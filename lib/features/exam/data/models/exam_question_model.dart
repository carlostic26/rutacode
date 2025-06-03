import 'package:rutacode/features/exam/domain/entities/exam_question.dart';

class ExamQuestionModel extends ExamQuestion {
  ExamQuestionModel({
    required super.id,
    required super.questionText,
    required super.options,
    required super.correctAnswer,
    required super.language,
    required super.module,
  });

  // Convertir un Map a ExamQuestionModel
  factory ExamQuestionModel.fromMap(Map<String, dynamic> map) {
    return ExamQuestionModel(
      id: map['id'],
      questionText: map['questionText'],
      options: (map['options'] as String).split(','),
      correctAnswer: map['correctAnswer'],
      language: map['language'],
      module: map['module'],
    );
  }

  // Convertir ExamQuestionModel a un Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'questionText': questionText,
      'options': options.join(','),
      'correctAnswer': correctAnswer,
      'language': language,
      'moduleId': module,
    };
  }
}
