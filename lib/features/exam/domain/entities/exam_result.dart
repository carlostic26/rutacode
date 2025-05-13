class ExamResult {
  final int correctAnswers;
  final int incorrectAnswers;
  final int unanswered;

  ExamResult({
    required this.correctAnswers,
    required this.incorrectAnswers,
    required this.unanswered,
  });

  // Añade este método
  double get scorePercentage {
    final totalQuestions = correctAnswers + incorrectAnswers + unanswered;
    return totalQuestions > 0 ? (correctAnswers / totalQuestions) * 100 : 0;
  }
}
