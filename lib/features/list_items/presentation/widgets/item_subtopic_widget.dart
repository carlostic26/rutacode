import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/detail/data/models/detail_model.dart';
import 'package:rutacode/features/level/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:rutacode/features/list_items/presentation/screens/list_items_screen.dart';
import 'package:rutacode/features/progress/presentation/state/provider/progress_use_cases_provider.dart';
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
    // Obtener el módulo actual
    final module = ref.watch(actualModuleProvider);

    // Seleccionar el provider correcto según el módulo
    final completedSubtopics = switch (module) {
      'Jr' => ref.watch(jrCompletedSubtopicsProvider),
      'Mid' => ref.watch(midCompletedSubtopicsProvider),
      'Sr' => ref.watch(srCompletedSubtopicsProvider),
      _ => throw Exception('Módulo no válido'),
    };

    final isCompleted = completedSubtopics.contains(detailContent.subtopic);
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: GestureDetector(
        onTap: () {
          // Navegar a la pantalla de detalles
          //    ref.read(subtopicIdProvider.notifier).state = detailContent.id!;
          ref.read(subtopicTitleProvider.notifier).state =
              detailContent.subtopic!;
/*           Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DetailPage()),
          ); */

          // En algún lugar donde navegas a DetailPage:
          ref.read(currentPageProvider.notifier).state = 2;
        },
        child: Container(
          height: 50,
          width: 400,
          decoration: BoxDecoration(
            color: isCompleted ? Colors.green : Colors.grey.shade800,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 12, top: 2),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                detailContent.subtopic!,
                style: const TextStyle(
                    color: Colors.white,
                    //fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    fontSize: 12),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
