import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatisticsScoreWidget extends ConsumerWidget {
  final List<double> progressListScores;
  const StatisticsScoreWidget({
    super.key,
    required this.progressListScores,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width * 0.49,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: List.generate(progressListScores.length, (index) {
                    final progress = progressListScores[index];
                    final isCompleted = progress >= 1.0; // 100% completado

                    return Stack(children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        width: 20,
                        height: 1.0 * 150, // Altura proporcional al progreso
                        decoration: BoxDecoration(
                          color: Colors.grey.shade900,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          width: 20,
                          height:
                              progress * 150, // Altura proporcional al progreso
                          decoration: BoxDecoration(
                            color: isCompleted
                                ? Colors.indigoAccent
                                : Colors.indigo.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                      )
                    ]);
                  }),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(progressListScores.length, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    width: 20,
                    child: Text(
                      'N${index + 1}',
                      style: const TextStyle(color: Colors.grey, fontSize: 8),
                      textAlign: TextAlign.center,
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 
 
 /* 
 class StatisticsScoreWidget extends ConsumerWidget {
  final List<double> progressListScores;
  final List<double> completedLevelList;
  const StatisticsScoreWidget({
    super.key,
    required this.progressListScores,
    required this.completedLevelList,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final completedLevelList = ref.watch(completedLevelListProvider);

    return SizedBox(
      height: 200,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(progressListScores.length, (index) {
                  final score = progressListScores[index];
                  final isCompleted = completedLevelList.contains(index);

                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    width: 20,
                    height: score * 150, // Altura proporcional al score
                    decoration: BoxDecoration(
                      color: isCompleted ? Colors.indigo : Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  );
                }),
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(progressListScores.length, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  width: 20,
                  child: Text(
                    'N${index + 1}',
                    style: const TextStyle(color: Colors.grey, fontSize: 8),
                    textAlign: TextAlign.center,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
  */