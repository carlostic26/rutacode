import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/progress/domain/use_cases/progress_use_cases.dart';
import 'package:rutacode/features/progress/presentation/state/provider/progress_use_cases_provider.dart';
import 'package:rutacode/features/progress/presentation/state/start_exam_provider.dart';
import 'package:rutacode/features/progress/presentation/widgets/circular_progress_widget.dart';
import 'package:rutacode/features/progress/presentation/widgets/statics_score_widget.dart';

class ScoreInfoWidget extends ConsumerWidget {
  final String module;
  final String language;

  const ScoreInfoWidget({
    super.key,
    required this.language,
    required this.module,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final examProvider = ref.watch(examProviderSelector(module));
    final isExamStarted = ref.watch(examProvider);
    final progressUseCases = ref.watch(progressUseCasesProvider);

    const actualLevelIdJr = 1;
    const actualLevelIdMid = 2;
    const actualLevelIdSr = 3;

    return FutureBuilder<double>(
      future: progressUseCases.getProgressPercentageByModule(
          language: language, module: module),
      builder: (context, progressSnapshot) {
        if (progressSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (progressSnapshot.hasError) {
          debugPrint('Error en progreso: ${progressSnapshot.error}');
          return Center(child: Text('Error: ${progressSnapshot.error}'));
        }

        final progressPercentage = progressSnapshot.data ?? 0.0;

        return FutureBuilder<List<double>>(
          future: _getLevelsProgressByModule(language, module, ref),
          builder: (context, progressSnapshot) {
            if (progressSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (progressSnapshot.hasError) {
              debugPrint(
                  'Error en progreso por nivel: ${progressSnapshot.error}');
              return Center(child: Text('Error: ${progressSnapshot.error}'));
            }

            final progressList = progressSnapshot.data ?? [];

            return FutureBuilder<Map<String, int>>(
              future: _countScoresByModule(language, module, progressUseCases),
              builder: (context, scoreSnapshot) {
                if (scoreSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (scoreSnapshot.hasError) {
                  debugPrint('Error en puntos: ${scoreSnapshot.error}');
                  return Center(child: Text('Error: ${scoreSnapshot.error}'));
                }

                final scoreData =
                    scoreSnapshot.data ?? {'userScore': 0, 'maxScore': 0};
                final userScore = scoreData['userScore']!;
                final maxScore = scoreData['maxScore']!;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        '👨🏼‍💻 $module',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                      child: SizedBox(
                        height: 150,
                        child: StatisticsScoreWidget(
                          progressListScores: progressList,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 50, 10),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Nivel Actual',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              Text(
                                module == 'Jr'
                                    ? '$actualLevelIdJr'
                                    : module == 'Mid'
                                        ? '$actualLevelIdMid'
                                        : '$actualLevelIdSr',
                                style: const TextStyle(fontSize: 10),
                              ),
                              const Text(
                                'Examen final:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              Text(
                                isExamStarted ? 'Iniciado' : 'No iniciado',
                                style: const TextStyle(fontSize: 10),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Puntos acumulados:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              Text(
                                '$userScore/$maxScore',
                                style: const TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Progreso',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 10),
                              ),
                              const SizedBox(height: 12),
                              CircularProgressWidget(
                                  progress: progressPercentage),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }

  Future<Map<String, int>> _countScoresByModule(
    String language,
    String module,
    ProgressUseCases useCases,
  ) async {
    try {
      final userScore = await useCases.countTotalScoreByModule(
        language: language,
        module: module,
      );

      final totalSubtopics =
          await useCases.countTotalSubtopicsByModuleInProgrammingContent(
        language,
        module,
      );

      return {
        'userScore': userScore,
        'maxScore': totalSubtopics *
            2, //este campo es el de puntos maximos de mis puntajes, lo que eel usuario debe alcanzar
      };
    } catch (e) {
      debugPrint('Error en _getAccumulatedPoints: $e');
      return {'userScore': 0, 'maxScore': 0};
    }
  }

  Future<List<double>> _getLevelsProgressByModule(
      String language, String module, WidgetRef ref) async {
    final useCases = ref.read(progressUseCasesProvider);
    final progressList = <double>[];

    // Obtener el número de niveles del módulo
    final totalLevels =
        await useCases.countTotalLevelsByModuleInProgrammingContent(
            language: language, module: module);

    debugPrint(
        '*** NUMERO DE NIVELES EN PROTG CONTENT en $module: $totalLevels');

    // Obtener progreso para cada nivel
    for (int level = 1; level <= totalLevels; level++) {
      final progress = await useCases.getLevelProgressPercentage(
        language: language,
        module: module,
        level: level,
      );
      progressList.add(progress);
      debugPrint('Progreso nivel $level: $progress');
    }

    return progressList;
  }
}

/* final completedLevelListProvider = StateProvider<List<int>>((ref) {
  return [];
});

class ScoreInfoWidget extends ConsumerWidget {
  final String module;
  final String language;

  const ScoreInfoWidget({
    super.key,
    required this.language,
    required this.module,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final examProvider = ref.watch(examProviderSelector(module));
    final isExamStarted = ref.watch(examProvider);
    final progressUseCases = ref.watch(progressUseCasesProvider);

    const actualLevelIdJr = 1;
    const actualLevelIdMid = 2;
    const actualLevelIdSr = 3;

    return FutureBuilder<double>(
      future: progressUseCases.getProgressPercentageByModule(
          language: language, module: module),
      builder: (context, progressSnapshot) {
        if (progressSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (progressSnapshot.hasError) {
          debugPrint('Error en progreso: ${progressSnapshot.error}');
          return Center(child: Text('Error: ${progressSnapshot.error}'));
        }

        final progressPercentage = progressSnapshot.data ?? 0.0;

        return FutureBuilder<List<double>>(
          future: _getAllExistingLevelsByModule(language, module, ref),
          builder: (context, levelsSnapshot) {
            if (levelsSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (levelsSnapshot.hasError) {
              debugPrint('Error en niveles: ${levelsSnapshot.error}');
              return Center(child: Text('Error: ${levelsSnapshot.error}'));
            }

            final progressList = levelsSnapshot.data ?? [];

            return FutureBuilder<List<double>>(
              future: _getLevelsProgressByModule(language, module, ref),
              builder: (context, completedSnapshot) {
                if (completedSnapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (completedSnapshot.hasError) {
                  debugPrint(
                      'Error en niveles completados: ${completedSnapshot.error}');
                  return Center(
                      child: Text('Error: ${completedSnapshot.error}'));
                }

                final completedList = completedSnapshot.data ?? [];

                return FutureBuilder<Map<String, int>>(
                  future:
                      _countScoresByModule(language, module, progressUseCases),
                  builder: (context, scoreSnapshot) {
                    if (scoreSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (scoreSnapshot.hasError) {
                      debugPrint('Error en puntos: ${scoreSnapshot.error}');
                      return Center(
                          child: Text('Error: ${scoreSnapshot.error}'));
                    }

                    final scoreData =
                        scoreSnapshot.data ?? {'userScore': 0, 'maxScore': 0};
                    final userScore = scoreData['userScore']!;
                    final maxScore = scoreData['maxScore']!;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            '👨🏼‍💻 $module',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                          child: SizedBox(
                            height: 150,
                            child: StatisticsScoreWidget(
                              progressListScores: progressList,
                              // completedLevelList: completedList,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 10, 50, 10),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Nivel Actual',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  Text(
                                    module == 'Jr'
                                        ? '$actualLevelIdJr'
                                        : module == 'Mid'
                                            ? '$actualLevelIdMid'
                                            : '$actualLevelIdSr',
                                    style: const TextStyle(fontSize: 10),
                                  ),
                                  const Text(
                                    'Examen final:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  Text(
                                    isExamStarted ? 'Iniciado' : 'No iniciado',
                                    style: const TextStyle(fontSize: 10),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    'Puntos acumulados:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  Text(
                                    '$userScore/$maxScore',
                                    style: const TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Progreso',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10),
                                  ),
                                  const SizedBox(height: 12),
                                  CircularProgressWidget(
                                      progress: progressPercentage),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                      ],
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}

Future<Map<String, int>> _countScoresByModule(
  String language,
  String module,
  ProgressUseCases useCases,
) async {
  try {
    final userScore = await useCases.countTotalScoreByModule(
      language: language,
      module: module,
    );

    final totalSubtopics =
        await useCases.countTotalSubtopicsByModuleInProgrammingContent(
      language,
      module,
    );

    return {
      'userScore': userScore,
      'maxScore': totalSubtopics *
          2, //este campo es el de puntos maximos de mis puntajes, lo que eel usuario debe alcanzar
    };
  } catch (e) {
    debugPrint('Error en _getAccumulatedPoints: $e');
    return {'userScore': 0, 'maxScore': 0};
  }
}

// Método en UI para obtener el progreso de cada nivel
// No son los niveles completados sino el numero de niveles de cada módulo
Future<List<double>> _getAllExistingLevelsByModule(
    String language, String module, WidgetRef ref) async {
  final useCases = ref.read(progressUseCasesProvider);
  final listNumberOfLevels = <double>[];

  // Obtener el número de niveles del módulo
  final totalLevels =
      await useCases.countTotalLevelsByModuleInProgrammingContent(
          language: language, module: module);

  debugPrint('*** NUMERO DE NIVELES EN PROTG CONTENT en $module: $totalLevels');

  // Iterar sobre los niveles y obtener el progreso
  for (int level = 1; level <= totalLevels; level++) {
    listNumberOfLevels.add(level.toDouble());
  }

  //establecer niveles completados
  //final completedLevelList = _getLevelsProgressByModule(language, module, ref);

  //ref.read(completedLevelListProvider.notifier).state =  await completedLevelList;

  return listNumberOfLevels;
}

/* Future<List<int>> _getCompletedLevelsByModule( //change name to _getProgressLevelByModule
    String language, String module, WidgetRef ref) async {
  final useCases = ref.read(progressUseCasesProvider);
  final listCompletedLevelIndexes = <int>[];

  // Obtener el número total de niveles
  final totalLevels =
      await useCases.countTotalLevelsByModuleInProgrammingContent(
          language: language, module: module);

  for (int i = 0; i < totalLevels; i++) {
    final levelId = i + 1;
    final isLevelCompleted = await useCases.isLevelCompleted(
      language: language,
      module: module,
      level: levelId,
    );

    if (isLevelCompleted) {
      listCompletedLevelIndexes.add(i); // guardar índice (no ID)
    }
  }

  return listCompletedLevelIndexes;
}
 */

Future<List<double>> _getLevelsProgressByModule(
    String language, String module, WidgetRef ref) async {
  final useCases = ref.read(progressUseCasesProvider);
  final progressList = <double>[];

  // Obtener el número de niveles del módulo
  final totalLevels =
      await useCases.countTotalLevelsByModuleInProgrammingContent(
          language: language, module: module);

  // Obtener progreso para cada nivel
  for (int level = 1; level <= totalLevels; level++) {
    final progress = await useCases.getLevelProgressPercentage(
      language: language,
      module: module,
      level: level,
    );
    progressList.add(progress);
  }

  return progressList;
}


// Método para obtener el progreso de cada nivel
/* Future<List<int>> _getNumberOfLevelsByModule(
    String language, String module, WidgetRef ref) async {
  final useCases = ref.read(progressUseCasesProvider);
  final listNumberOfLevels = <int>[];

  // Obtener el número de niveles del módulo
  final totalLevels = await useCases.countLevelsByModuleInProgrammingContent(
      language: language, module: module);

  debugPrint('*** NUMERO DE NIVELES EN PROTG CONTENT en $module: $totalLevels');

  // Iterar sobre los niveles y obtener el progreso
  for (int level = 1; level <= totalLevels; level++) {
    final isLevelCompleted = await useCases.isLevelCompleted(
        language: language, module: module, level: level);

    if (isLevelCompleted) {
      listNumberOfLevels.add(level);
    }
  }

  return listNumberOfLevels;
}
 */


// Método para obtener el progreso de cada nivel
/* 

Future<Map<String, int>> _getAccumulatedPoints(
    ProgressRepository progressRepository,
    String language,
    String module,
    ref) async {
  final useCases = ref.read(progressUseCasesProvider);

  final userTotalScoreByModuleUseCase = useCases.getUserTotalScoreByModule();

  final userScore = userTotalScoreByModuleUseCase;

  final totalSubtopics =
      await progressRepository.countAllSubtopicsByModule(language, module);
  final maxScore = totalSubtopics * 2; // Cada subtema vale 2 puntos

  return {
    'userScore': userScore,
    'maxScore': maxScore,
  };
}

 */
 */