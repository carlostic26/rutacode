import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/detail/data/models/detail_model.dart';
import 'package:rutacode/features/list_items/presentation/state/current_page_provider.dart';
import 'package:rutacode/features/list_items/presentation/state/provider/get_subtopic_use_case_provider.dart';

class ItemSubtopicWidget extends ConsumerWidget {
  final DetailContentModel detailContent;
  final int index;

  const ItemSubtopicWidget({
    super.key,
    required this.detailContent,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: GestureDetector(
        onTap: () {
          ref.read(subtopicTitleProvider.notifier).state =
              detailContent.subtopic!;
          ref.read(currentContentPageProvider.notifier).state = 2;
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
                detailContent.subtopic!,
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
