import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/detail/data/models/detail_model.dart';
import 'package:rutacode/features/languages/presentation/provider/language_providers.dart';
import 'package:rutacode/features/level/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:rutacode/features/list_items/presentation/state/provider/get_topic_use_case_provider.dart';
import 'package:rutacode/features/list_items/presentation/widgets/item_topic_widget.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:rutacode/features/progress/presentation/state/provider/progress_use_cases_provider.dart';

class TopicPage extends ConsumerWidget {
  const TopicPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listTopicUseCase = ref.read(getTopicUseCaseProvider);
    final actualLanguage = ref.watch(actualLanguageProvider);
    final actualModule = ref.watch(actualModuleProvider);
    final actualLevelId = ref.watch(actualLevelProvider);

    return FutureBuilder<List<DetailContentModel>>(
      future:
          listTopicUseCase.call(actualLanguage, actualModule, actualLevelId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No se encontraron topics.'));
        }

        final topicList = snapshot.data!;

        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Stepper Vertical
                SizedBox(
                  width: 60,
                  child: TopicStepperWidget(topicList: topicList),
                ),
                // Lista de Topics
                Expanded(
                  child: ListView.builder(
                    itemCount: topicList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 28),
                        child: ItemTopicWidget(
                          detailContent: topicList[index],
                          module: actualModule,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<EasyStep> _buildSteps(List<DetailContentModel> topics) {
    return topics.map((topic) {
      return const EasyStep(
        icon: Icon(Icons.check, size: 20, color: Colors.grey),
        activeIcon: Icon(Icons.check, size: 20, color: Colors.grey),
        finishIcon: Icon(Icons.check, size: 20, color: Colors.grey),
      );
    }).toList();
  }
}

/* class TopicStepperWidget extends StatelessWidget {
  final List<DetailContentModel> topicList;

  const TopicStepperWidget({super.key, required this.topicList});

  @override
  Widget build(BuildContext context) {
    // Simulación de lista de subtemas completados (booleanos)
    // En la vida real, esto vendría desde un estado con Riverpod u otra fuente
    final List<bool> completedList = List.generate(
      topicList.length,
      (index) => index < 3, // por ejemplo, los primeros 3 completados
    );

    // Detecta el siguiente subtema incompleto (para poner el paso activo)
    final int nextIndex = completedList.indexWhere((completed) => !completed);

    // Si todos están completos, usa el último paso como activo
    final int activeStep = nextIndex == -1 ? topicList.length - 1 : nextIndex;

    return SizedBox(
      width: 60,
      child: EasyStepper(
        alignment: Alignment.topLeft,
        direction: Axis.vertical,
        stepRadius: 8,
        enableStepTapping: false,
        activeStep: activeStep,
        activeStepBackgroundColor: Colors.grey,
        finishedStepBackgroundColor: Colors.green,
        lineStyle: const LineStyle(
          lineLength: 20,
          lineThickness: 1,
          lineType: LineType.dotted,
        ),
        steps: List.generate(
          topicList.length,
          (index) {
            final isCompleted = completedList[index];

            return const EasyStep(
              icon: Icon(
                Icons.check,
                size: 20,
                color: Colors.white,
              ),
              activeIcon: Icon(
                Icons.more_horiz,
                size: 20,
                color: Colors.white,
              ),
              finishIcon: Icon(
                Icons.check,
                size: 20,
                color: Colors.white,
              ),
            );
          },
        ),
        onStepReached: (index) {},
      ),
    );
  }
} */

class TopicStepperWidget extends ConsumerWidget {
  final List<DetailContentModel> topicList;

  const TopicStepperWidget({super.key, required this.topicList});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useCase = ref.watch(progressUseCasesProvider);
    final language = ref.watch(actualLanguageProvider);
    final module = ref.watch(actualModuleProvider);
    final level = ref.watch(actualLevelProvider);

    final completionFutures = topicList.map((topic) {
      return useCase.isTopicCompleted(
        language: language,
        module: module,
        level: level,
        topic: topic.topic!, // topic a evaluar
      );
    }).toList();

    return FutureBuilder<List<bool>>(
      future: Future.wait(completionFutures),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const SizedBox(
            width: 60,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        final completedList =
            snapshot.data ?? List.filled(topicList.length, false);
        final allCompleted = completedList.every((completed) => completed);

        // Lógica mejorada para determinar el paso activo
        int activeStep;
        if (allCompleted) {
          // Si todos están completados, el último paso es el activo (pero mostrado como completado)
          activeStep = topicList.length - 1;
        } else {
          // Buscamos el primer paso incompleto
          activeStep = completedList.indexWhere((completed) => !completed);
          // Si no encuentra (caso inesperado), usamos el primer paso
          activeStep = activeStep == -1 ? 0 : activeStep;
        }

        return SizedBox(
          width: 60,
          child: EasyStepper(
            alignment: Alignment.topLeft,
            direction: Axis.vertical,
            stepRadius: 8,
            enableStepTapping: false,
            activeStep: activeStep,
            activeStepBackgroundColor:
                allCompleted ? Colors.green : Colors.grey,
            finishedStepBackgroundColor: Colors.green,
            lineStyle: const LineStyle(
              lineLength: 20,
              lineThickness: 1,
              lineType: LineType.dotted,
            ),
            steps: List.generate(
              topicList.length,
              (index) {
                final isCompleted = completedList[index];

                return EasyStep(
                  icon: Icon(
                    isCompleted || allCompleted
                        ? Icons.check
                        : Icons.more_horiz,
                    size: 20,
                    color: Colors.white,
                  ),
                  activeIcon: const Icon(
                    Icons.more_horiz,
                    size: 20,
                    color: Colors.white,
                  ),
                  finishIcon: const Icon(
                    Icons.check,
                    size: 20,
                    color: Colors.white,
                  ),
                );
              },
            ),
            onStepReached: (index) {},
          ),
        );
      },
    );
  }
}
