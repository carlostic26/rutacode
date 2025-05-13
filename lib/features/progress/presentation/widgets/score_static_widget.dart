import 'package:flutter/material.dart';

class StatisticsScoreWidget extends StatelessWidget {
  final List<double> progressListScores;

  const StatisticsScoreWidget({
    super.key,
    required this.progressListScores,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: progressListScores.map((score) {
                  return Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      // Sombra de fondo de la barra (color oscuro)
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5.0), // Espacio entre barras
                        width: 20, // Ancho de cada barra
                        decoration: BoxDecoration(
                          color: Colors.grey.shade900,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        height: 150, // Altura máxima de la barra
                      ),

                      // Barra de progreso (color azul)
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5.0), // Espacio entre barras
                        width: 20,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        height: score * 150, // Altura proporcional al progreso
                      ),
                    ],
                  );
                }).toList(),
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
