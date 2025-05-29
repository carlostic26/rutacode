import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/detail/data/models/detail_model.dart';
import 'package:rutacode/features/list_items/presentation/state/current_page_provider.dart';
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
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: GestureDetector(
        onTap: () {
          ref.read(titleTopicProvider.notifier).state = detailContent.topic!;
          ref.read(currentContentPageProvider.notifier).state = 1;
        },
        child: Container(
          height: 50,
          width: 400,
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
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
