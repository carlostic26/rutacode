import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/detail/data/models/detail_model.dart';
import 'package:rutacode/features/languages/presentation/provider/language_providers.dart';
import 'package:rutacode/features/level/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:rutacode/features/list_items/presentation/state/provider/get_subtopic_use_case_provider.dart';
import 'package:rutacode/features/list_items/presentation/state/provider/get_topic_use_case_provider.dart';
import 'package:rutacode/features/list_items/presentation/widgets/item_subtopic_widget.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:rutacode/features/progress/presentation/state/provider/progress_use_cases_provider.dart';

class SubtopicPage extends ConsumerWidget {
  const SubtopicPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listSubtopicUseCase = ref.watch(getSubtopicUseCaseProvider);
    final actualLanguage = ref.watch(actualLanguageProvider);
    final actualModule = ref.watch(actualModuleProvider);
    final actualLevel = ref.watch(actualLevelProvider);
    final topicTitle = ref.watch(titleTopicProvider);

    return FutureBuilder<List<DetailContentModel>>(
      future: listSubtopicUseCase.call(
          actualLanguage, actualModule, actualLevel, topicTitle),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No se encontraron subtemas.'));
        }

        final subtopicList = snapshot.data!;

        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Stepper Vertical
                SizedBox(
                  width: 60,
                  child: SubtopicStepperWidget(subtopicList: subtopicList),
                ),
                // Lista de Subtopics
                Expanded(
                  child: ListView.builder(
                    itemCount: subtopicList.length,
                    itemBuilder: (context, index) {
                      final subtopic = subtopicList[index];
                      return Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 22.3),
                        child: ItemSubtopicWidget(
                          detailContent: subtopic,
                          index: index,
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
}

class SubtopicStepperWidget extends ConsumerWidget {
  final List<DetailContentModel> subtopicList;

  const SubtopicStepperWidget({super.key, required this.subtopicList});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useCase = ref.watch(progressUseCasesProvider);
    final language = ref.watch(actualLanguageProvider);
    final module = ref.watch(actualModuleProvider);
    final level = ref.watch(actualLevelProvider);
    final topic = ref.watch(titleTopicProvider);

    final completionFutures = subtopicList.map((subtopic) {
      return useCase.isSubtopicCompleted(
        language: language,
        module: module,
        level: level,
        topic: topic,
        subtopic: subtopic.subtopic!,
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
            snapshot.data ?? List.filled(subtopicList.length, false);
        final allCompleted = completedList.every((completed) => completed);

        // Lógica mejorada para determinar el paso activo
        int activeStep;
        if (allCompleted) {
          // Si todos están completados, el último paso es el activo (pero mostrado como completado)
          activeStep = subtopicList.length - 1;
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
              subtopicList.length,
              (index) {
                final isCompleted = completedList[index];
                final isActive = index == activeStep;

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
