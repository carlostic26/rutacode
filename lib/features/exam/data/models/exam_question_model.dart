class ExamQuestionModel {
  final String id;
  final String questionText;
  final List<String> options;
  final String correctAnswer;
  final String moduleId;

  ExamQuestionModel({
    required this.id,
    required this.questionText,
    required this.options,
    required this.correctAnswer,
    required this.moduleId,
  });

  // Convertir un Map a ExamQuestionModel
  factory ExamQuestionModel.fromMap(Map<String, dynamic> map) {
    return ExamQuestionModel(
      id: map['id'],
      questionText: map['questionText'],
      options: (map['options'] as String).split(','), // Convertir String a List
      correctAnswer: map['correctAnswer'],
      moduleId: map['moduleId'],
    );
  }

  // Convertir ExamQuestionModel a un Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'questionText': questionText,
      'options': options.join(','), // Convertir List a String
      'correctAnswer': correctAnswer,
      'moduleId': moduleId,
    };
  }
}
