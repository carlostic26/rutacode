import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/detail/data/models/detail_model.dart';
import 'package:rutacode/features/home/presentation/provider/language_providers.dart';
import 'package:rutacode/features/level/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:rutacode/features/list_items/presentation/state/current_page_provider.dart';
import 'package:rutacode/features/list_items/presentation/state/provider/get_topic_use_case_provider.dart';
import 'package:rutacode/features/progress/presentation/state/provider/progress_use_cases_provider.dart';

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
    final useCase = ref.watch(progressUseCasesProvider);

    final language = ref.watch(actualLanguageProvider);
    final module = ref.watch(actualModuleProvider);
    final level = ref.watch(actualLevelProvider);

    final topicFuture = useCase.isTopicCompleted(
      language: language,
      module: module,
      level: level,
      topic: detailContent.topic!, // topic a evaluar
    );

    return FutureBuilder<bool>(
      future: topicFuture,
      builder: (context, snapshot) {
        final isTopicCompleted = snapshot.data ?? false;

        return Padding(
          padding: const EdgeInsets.only(top: 8),
          child: GestureDetector(
            onTap: () {
              ref.read(titleTopicProvider.notifier).state =
                  detailContent.topic!;
              ref.read(currentContentPageProvider.notifier).state = 1;
            },
            child: Container(
              height: 50,
              width: 400,
              decoration: BoxDecoration(
                color: isTopicCompleted ? Colors.green : Colors.grey.shade900,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 12, top: 2),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    detailContent.topic!,
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 12),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
