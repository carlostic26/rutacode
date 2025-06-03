class ExamQuestion {
  final String id;
  final String questionText;
  final List<String> options;
  final String correctAnswer;
  final String language;
  final String module;

  ExamQuestion({
    required this.id,
    required this.questionText,
    required this.options,
    required this.correctAnswer,
    required this.language,
    required this.module,
  });
}
