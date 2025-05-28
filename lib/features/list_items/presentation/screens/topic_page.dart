import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/detail/data/models/detail_model.dart';
import 'package:rutacode/features/languages/presentation/provider/language_providers.dart';
import 'package:rutacode/features/level/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:rutacode/features/progress/presentation/state/provider/progress_use_cases_provider.dart';
import 'package:rutacode/features/list_items/presentation/state/provider/get_topic_use_case_provider.dart';
import 'package:rutacode/features/list_items/presentation/widgets/item_topic_widget.dart';
import 'package:easy_stepper/easy_stepper.dart';

class TopicPage extends ConsumerWidget {
  const TopicPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listTopicUseCase = ref.read(getTopicUseCaseProvider);

    // variables provider para solicitud de datos
    final actualLanguage = ref.watch(actualLanguageProvider);
    final actualModule = ref.watch(actualModuleProvider);
    final actualLevelTittle = ref.watch(levelTitleProvider);
    final actualLevelId = ref.watch(actualLevelProvider);
    //final titleTopic = ref.watch(topicTitleProvider);

    // late final int levelId;

    // Handle different modules using a switch statement
/*     switch (actualModule) {
      case 'Jr':
        levelId = ref.read(actualLevelProvider);
        break;
      case 'Mid':
        levelId = ref.read(actualLevelProvider);
        break;
      case 'Sr':
        levelId = ref.read(actualLevelProvider);
        break;
      default:
        // Default logic for unknown modules
        break;
    } */

    // Obtener los topics completados según el módulo
    final completedTopics = switch (actualModule) {
      'Jr' => ref.watch(jrCompletedTopicsProvider),
      'Mid' => ref.watch(midCompletedTopicsProvider),
      'Sr' => ref.watch(srCompletedTopicsProvider),
      _ => throw Exception('Módulo no válido'),
    };

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

        final activeStep = topicList
            .where((topic) => completedTopics.contains(topic.id.toString()))
            .length;

        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Stepper Vertical
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
                        finishedStepBackgroundColor: Colors.green,
                        stepRadius: 10,
                        activeStep: activeStep,
                        enableStepTapping: false,
                        direction: Axis.vertical,
                        steps: _buildSteps(topicList, completedTopics),
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

  List<EasyStep> _buildSteps(
      List<DetailContentModel> topics, List<String> completedTopics) {
    return topics.map((topic) {
      final isCompleted = completedTopics.contains(topic.id.toString());
      return EasyStep(
        icon: Icon(
          Icons.check,
          size: 20,
          color: isCompleted ? Colors.white : Colors.grey,
        ),
        activeIcon: const Icon(Icons.check, size: 20, color: Colors.white),
        finishIcon: const Icon(Icons.check, size: 20, color: Colors.white),
      );
    }).toList();
  }
}
