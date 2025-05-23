/* import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/level/presentation/state/provider/count_levels_use_case_provider.dart';
import 'package:rutacode/features/level/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:rutacode/features/progress/domain/repositories/progress_repository.dart';
import 'package:rutacode/features/progress/domain/use_cases/get_level_progress_use_case.dart';
import 'package:rutacode/features/progress/presentation/state/provider/progress_use_cases_provider.dart';
import 'package:rutacode/features/progress/presentation/state/start_exam_provider.dart';
import 'package:rutacode/features/progress/presentation/widgets/circular_progress_widget.dart';
import 'package:rutacode/features/progress/presentation/widgets/score_static_widget.dart';

class ScoreInfoWidget extends ConsumerWidget {
  final String module;
  const ScoreInfoWidget({
    super.key,
    required this.module,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Obtener el provider específico para este módulo
    final examProvider = ref.watch(examProviderSelector(module));
    final isExamStarted = ref.watch(examProvider);

    final getLevelProgress = ref.read(getLevelProgressProvider);
    final getCircularProgressPercentageByModuleUseCase =
        ref.read(getCircularProgressPercentageByModuleUseCaseProvider);
    final actualLevelIdJr = ref.watch(actualLevelIdJrProvider);
    final actualLevelIdMid = ref.watch(actualLevelIdMidProvider);
    final actualLevelIdSr = ref.watch(actualLevelIdSrProvider);
    final progressRepository = ref.read(progressRepositoryProvider);

    return FutureBuilder<List<double>>(
      future: _getProgressForLevels(module, getLevelProgress, ref),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No hay datos disponibles.'));
        } else {
          final progressList = snapshot.data!;
          return FutureBuilder<double>(
            future: getCircularProgressPercentageByModuleUseCase.call(module),
            builder: (context, progressSnapshot) {
              if (progressSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (progressSnapshot.hasError) {
                return Center(child: Text('Error: ${progressSnapshot.error}'));
              } else if (!progressSnapshot.hasData) {
                return const Center(
                    child: Text('No hay datos de progreso disponibles.'));
              } else {
                final progressPercentage = progressSnapshot.data!;
                return FutureBuilder<Map<String, int>>(
                  future:
                      _getAccumulatedPoints(progressRepository, module, ref),
                  builder: (context, pointsSnapshot) {
                    if (pointsSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (pointsSnapshot.hasError) {
                      return Center(
                          child: Text('Error: ${pointsSnapshot.error}'));
                    } else if (!pointsSnapshot.hasData) {
                      return const Center(
                          child: Text('No hay datos de puntos disponibles.'));
                    } else {
                      final pointsData = pointsSnapshot.data!;
                      final userScore = pointsData['userScore']!;
                      final maxScore = pointsData['maxScore']!;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Text(
                              '👨🏼‍💻$module',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                            child: SizedBox(
                              height: 150,
                              child: StatisticsScoreWidget(
                                  progressListScores: progressList),
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
                                    module == 'Jr'
                                        ? Text(
                                            ' $actualLevelIdJr',
                                            style:
                                                const TextStyle(fontSize: 10),
                                          )
                                        : module == 'Mid'
                                            ? Text(
                                                ' $actualLevelIdMid',
                                                style: const TextStyle(
                                                    fontSize: 10),
                                              )
                                            : module == 'Sr'
                                                ? Text(
                                                    ' $actualLevelIdSr',
                                                    style: const TextStyle(
                                                        fontSize: 10),
                                                  )
                                                : const SizedBox(
                                                    height: 10,
                                                  ),
                                    const Text(
                                      'Examen final:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                    Text(
                                      isExamStarted
                                          ? 'Iniciado'
                                          : 'No iniciado',
                                      style: const TextStyle(fontSize: 10),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Progreso',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
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
                    }
                  },
                );
              }
            },
          );
        }
      },
    );
  }
}

// Método para obtener el progreso de cada nivel
Future<List<double>> _getProgressForLevels(
    String module, GetLevelProgress getLevelProgress, WidgetRef ref) async {
  final progressList = <double>[];

  // Obtener el caso de uso desde el provider
  final countLevelsUseCase = ref.read(countLevelsUseCaseProvider);

  // Obtener el número de niveles del módulo
  final numberOfLevels = await countLevelsUseCase.call(module);

  // Iterar sobre los niveles y obtener el progreso
  for (int level = 1; level <= numberOfLevels; level++) {
    final progress = await getLevelProgress.call(module, level);
    progressList.add(progress);
  }

  return progressList;
}

Future<Map<String, int>> _getAccumulatedPoints(
    ProgressRepository progressRepository, String module, ref) async {
  final getUserTotalScoreByModuleUseCase =
      ref.read(getUserTotalScoreByModuleUseCaseProvider);

  final userScore = await getUserTotalScoreByModuleUseCase.call(module);
  final totalSubtopics =
      await progressRepository.countAllSubtopicsByModule(module);
  final maxScore = totalSubtopics * 2; // Cada subtema vale 2 puntos

  return {
    'userScore': userScore,
    'maxScore': maxScore,
  };
}
 */