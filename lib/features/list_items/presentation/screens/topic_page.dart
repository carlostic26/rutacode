import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/detail/data/models/detail_model.dart';
import 'package:rutacode/features/languages/presentation/provider/language_providers.dart';
import 'package:rutacode/features/level/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:rutacode/features/list_items/presentation/state/provider/get_topic_use_case_provider.dart';
import 'package:rutacode/features/list_items/presentation/widgets/item_topic_widget.dart';
import 'package:easy_stepper/easy_stepper.dart';

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
                        stepRadius: 10,
                        activeStep: 0, // Siempre muestra el primer paso
                        enableStepTapping: false,
                        direction: Axis.vertical,
                        steps: _buildSteps(topicList),
                        onStepReached: (index) {},
                      )
                    ],
                  ),
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
