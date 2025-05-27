import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/detail/data/models/detail_model.dart';
import 'package:rutacode/features/progress/presentation/state/provider/progress_use_cases_provider.dart';
import 'package:rutacode/features/list_items/presentation/screens/list_items_screen.dart';
import 'package:rutacode/features/list_items/presentation/state/provider/get_topic_use_case_provider.dart';

class ItemTopicWidget extends ConsumerWidget {
  final DetailContentModel detailContent;
  final String module;

  const ItemTopicWidget({
    super.key,
    required this.detailContent,
    required this.module,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Obtener el provider correcto según el módulo
    final List<String> completedTopics = switch (module) {
      'Jr' => ref.watch(jrCompletedTopicsProvider),
      'Mid' => ref.watch(midCompletedTopicsProvider),
      'Sr' => ref.watch(srCompletedTopicsProvider),
      _ => throw Exception('Módulo no válido'),
    };
    final isCompleted = completedTopics.contains(detailContent.topic);

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: GestureDetector(
/*         onTap: () {
          ref.read(topicIdProvider.notifier).state = topic.id!;
          ref.read(topicTitleProvider.notifier).state = topic.title!;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SubtopicScreen()),
          );
        }, */
        onTap: () {
          ref.read(topicTitleProvider.notifier).state =
              detailContent.topic as String;
          ref.read(topicTitleProvider.notifier).state = detailContent.topic!;
          ref.read(currentPageProvider.notifier).state = 1;
        },
        child: Container(
          height: 50,
          width: 400,
          decoration: BoxDecoration(
            color: isCompleted ? Colors.green : const Color(0xFF2962FF),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 12, top: 2),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                detailContent.topic!,
                style: const TextStyle(
                    color: Colors.white, fontFamily: 'Poppins', fontSize: 12),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
