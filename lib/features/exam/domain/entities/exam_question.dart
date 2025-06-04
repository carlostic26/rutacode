class ExamQuestion {
  final String id;
  final String language;
  final String module;
  final String questionText;
  final List<String> options;
  final String correctAnswer;

  ExamQuestion({
    required this.id,
    required this.language,
    required this.module,
    required this.questionText,
    required this.options,
    required this.correctAnswer,
  });
}
