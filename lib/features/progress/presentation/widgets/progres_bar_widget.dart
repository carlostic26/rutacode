import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double progress;
  final double maxProgress;
  final Color backgroundColor;
  final Color progressColor;

  const ProgressBar({
    super.key,
    required this.progress,
    required this.maxProgress,
    this.backgroundColor = Colors.grey,
    this.progressColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        final double progressWidth = (progress / maxProgress) * width;

        return Stack(
          children: [
            // Fondo gris (representa el 100% del progreso)
            Container(
              width: width,
              height: 10,
              decoration: BoxDecoration(
                color: backgroundColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            // Barra azul (representa el progreso actual)
            Container(
              width: progressWidth,
              height: 10,
              decoration: BoxDecoration(
                color: progressColor,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ],
        );
      },
    );
  }
}
