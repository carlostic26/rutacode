import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/detail/data/models/detail_model.dart';
import 'package:rutacode/features/languages/presentation/provider/language_providers.dart';
import 'package:rutacode/features/level/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:rutacode/features/list_items/presentation/state/provider/get_subtopic_use_case_provider.dart';
import 'package:rutacode/features/list_items/presentation/state/provider/get_topic_use_case_provider.dart';
import 'package:rutacode/features/list_items/presentation/widgets/item_subtopic_widget.dart';
import 'package:easy_stepper/easy_stepper.dart';

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
                // Stepper Vertical (mostrado pero inactivo)
                SizedBox(
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
                        finishedStepBackgroundColor:
                            Colors.grey, // Cambiado a gris
                        stepRadius: 8,
                        activeStep: 0, // Siempre muestra el primer paso
                        enableStepTapping: false,
                        direction: Axis.vertical,
                        steps: List.generate(
                          subtopicList.length,
                          (index) => const EasyStep(
                            icon:
                                Icon(Icons.check, size: 20, color: Colors.grey),
                            activeIcon:
                                Icon(Icons.check, size: 20, color: Colors.grey),
                            finishIcon:
                                Icon(Icons.check, size: 20, color: Colors.grey),
                          ),
                        ),
                        onStepReached: (index) {},
                      ),
                    ],
                  ),
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
