import 'package:rutacode/features/exam/domain/entities/exam_question.dart';

class ExamQuestionModel extends ExamQuestion {
  ExamQuestionModel({
    required super.id,
    required super.language,
    required super.module,
    required super.questionText,
    required super.options,
    required super.correctAnswer,
  });

  // Convertir un Map a ExamQuestionModel
  factory ExamQuestionModel.fromMap(Map<String, dynamic> map) {
    return ExamQuestionModel(
      id: map['id'],
      language: map['language'],
      module: map['module'],
      questionText: map['questionText'],
      options: (map['options'] as String).split(','),
      correctAnswer: map['correctAnswer'],
    );
  }

  // Convertir ExamQuestionModel a un Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'language': language,
      'module': module,
      'questionText': questionText,
      'options': options.join(','),
      'correctAnswer': correctAnswer,
    };
  }
}
