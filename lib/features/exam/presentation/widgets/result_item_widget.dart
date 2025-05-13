import 'package:flutter/material.dart';
import 'package:rutacode/features/exam/domain/entities/exam_question.dart';

class ResultItemWidget extends StatelessWidget {
  final ExamQuestion question;
  final String? userAnswer;

  const ResultItemWidget({
    required this.question,
    required this.userAnswer,
    super.key,
  });

  BoxDecoration _getOptionDecoration(bool isCorrect, bool isWrong) {
    return BoxDecoration(
      color: isCorrect
          ? const Color.fromARGB(80, 76, 175, 79)
          : isWrong
              ? const Color.fromARGB(59, 255, 0, 38)
              : null,
      border: Border.all(
        color: isCorrect
            ? Colors.green
            : isWrong
                ? Colors.red
                : Colors.grey[300]!,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(4),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                question.questionText,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ...question.options.map((option) {
              final optionLetter = option.split(')')[0].trim();
              final isCorrect = optionLetter == question.correctAnswer;
              final isWrong =
                  optionLetter == userAnswer?.split(')')[0].trim() &&
                      !isCorrect;
              final decoration = _getOptionDecoration(
                  isCorrect, isWrong); // Usa el método aquí

              return ListTile(
                minTileHeight: 10,
                title: Text(
                  option,
                  style: TextStyle(
                    fontSize: 12,
                    color: isCorrect || isWrong ? Colors.white : null,
                    fontWeight: isCorrect ? FontWeight.bold : null,
                  ),
                ),
                tileColor: decoration.color, // Usa el color del BoxDecoration
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: decoration.border!.top.color,
                    width: decoration.border!.top.width,
                  ), // Usa el borde del BoxDecoration
                  borderRadius: decoration.borderRadius!,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
