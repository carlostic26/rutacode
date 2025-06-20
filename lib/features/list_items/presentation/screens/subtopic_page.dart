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

    // variables provider para solicitud de datos
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
          debugPrint(snapshot.data.toString());
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
                StepperWidget(
                  subtopicList: subtopicList,
                  module: actualModule, // Pasamos el módulo al stepper
                ),

                // Lista de Subtopics
                Expanded(
                  child: Stack(children: [
                    ListView.builder(
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
                  ]),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class StepperWidget extends ConsumerWidget {
  final List<DetailContentModel> subtopicList;
  final String module;

  const StepperWidget({
    super.key,
    required this.subtopicList,
    required this.module,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Obtenemos los subtopics completados según el módulo
    final completedSubtopics = switch (module) {
      'Jr' => ref.watch(jrCompletedSubtopicsProvider),
      'Mid' => ref.watch(midCompletedSubtopicsProvider),
      'Sr' => ref.watch(srCompletedSubtopicsProvider),
      _ => throw Exception('Módulo no válido'),
    };

    return SizedBox(
      width: 60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EasyStepper(
            alignment: Alignment.topLeft,
            lineStyle: const LineStyle(
              lineLength: 20,
              lineThickness: 1,
              lineType: LineType.dotted,
            ),
            activeStepBackgroundColor: Colors.grey,
            finishedStepBackgroundColor: Colors.green,
            stepRadius: 8,
            activeStep: _getActiveStep(completedSubtopics, subtopicList),
            enableStepTapping: false,
            direction: Axis.vertical,
            steps: List.generate(
              subtopicList.length,
              (index) {
                final subtopic = subtopicList[index];
                final isCompleted = completedSubtopics.contains(subtopic.id);

                return EasyStep(
                  icon: isCompleted
                      ? const Icon(Icons.check, size: 20, color: Colors.white)
                      : const Icon(Icons.check, size: 20, color: Colors.grey),
                  activeIcon:
                      const Icon(Icons.check, size: 20, color: Colors.white),
                  finishIcon:
                      const Icon(Icons.check, size: 20, color: Colors.white),
                );
              },
            ),
            onStepReached: (index) {},
          ),
        ],
      ),
    );
  }

  int _getActiveStep(
      List<String> completedSteps, List<DetailContentModel> subtopicList) {
    for (int i = 0; i < subtopicList.length; i++) {
      if (!completedSteps.contains(subtopicList[i].id)) {
        return i;
      }
    }
    return subtopicList.length;
  }
}
