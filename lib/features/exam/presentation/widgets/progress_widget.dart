import 'package:flutter/material.dart';

class ProgressWidget extends StatelessWidget {
  final int currentIndex;
  final int totalQuestions;

  const ProgressWidget({
    required this.currentIndex,
    required this.totalQuestions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('Pregunta ${currentIndex + 1} de $totalQuestions');
  }
}
