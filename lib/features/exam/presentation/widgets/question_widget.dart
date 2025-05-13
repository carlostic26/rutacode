import 'package:flutter/material.dart';
import 'package:rutacode/features/exam/domain/entities/exam_question.dart';

class QuestionWidget extends StatelessWidget {
  final ExamQuestion question;
  final String? selectedAnswer;
  final Function(String) onAnswerSelected;

  const QuestionWidget({
    required this.question,
    required this.selectedAnswer,
    required this.onAnswerSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Pregunta (más grande y en bold)
          Container(
            height: screenHeight * 0.22,
            width: screenWidth,
            decoration: BoxDecoration(
              color: const Color.fromARGB(173, 66, 66, 66),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
              child: Text(
                question.questionText,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Opciones de respuesta modificadas
          ...question.options.map((option) {
            // Extrae solo la letra de la opción (A, B, C, D)
            final optionLetter = option.split(')')[0].trim();
            // Extrae solo la letra de la respuesta seleccionada (si existe)
            final selectedLetter = selectedAnswer?.split(')')[0].trim();

            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: selectedLetter == optionLetter
                    ? Colors.blue.withOpacity(0.2)
                    : Colors.transparent,
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: RadioListTile<String>(
                title: Text(
                  option,
                  style: const TextStyle(fontSize: 16),
                ),
                value: optionLetter, // Envía solo la letra (A, B, C, D)
                groupValue: selectedLetter, // Compara solo las letras
                onChanged: (value) {
                  onAnswerSelected(option); // Envía la opción completa
                },
                controlAffinity: ListTileControlAffinity.trailing,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                tileColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
