class ExamQuestion {
  final String id;
  final String questionText;
  final List<String> options;
  final String correctAnswer;

  ExamQuestion({
    required this.id,
    required this.questionText,
    required this.options,
    required this.correctAnswer,
  });
}
