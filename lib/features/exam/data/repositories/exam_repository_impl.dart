import 'package:flutter/material.dart';
import 'package:rutacode/features/exam/domain/entities/exam_question.dart';
import 'package:rutacode/features/exam/domain/entities/exam_result.dart';
import 'package:rutacode/features/exam/domain/entities/user_answer.dart';
import 'package:rutacode/features/exam/domain/repositories/exam_repository.dart';
import '../datasources/local_exam_data_source.dart';

/* class ExamRepositoryImpl implements ExamRepository {
  final LocalExamDataSource _localDataSource;

  ExamRepositoryImpl(this._localDataSource);

  @override
  Future<List<ExamQuestion>> getFinalExamQuestionsByModule(
      String language, String module) async {
    final rawQuestions = await _localDataSource.query(
      'exam_questions',
      where: 'language = ? AND module = ?',
      whereArgs: [language, module],
    );

    if (rawQuestions.isEmpty) {
      debugPrint(
          'No se encontraron preguntas en la base de datos para el módulo: $module');
      return [];
    }

    // Convertir todas las preguntas a objetos ExamQuestion
    final allQuestions = rawQuestions.map((map) {
      return ExamQuestion(
        id: map['id'],
        questionText: map['questionText'],
        options: List<String>.from((map['options'] as String).split(',')),
        correctAnswer: map['correctAnswer'],
        language: map['language'],
        module: map['module'],
      );
    }).toList();

    // Si hay 12 o menos preguntas, devolver todas
    if (allQuestions.length <= 12) {
      return allQuestions;
    }

    // Mezclar las preguntas aleatoriamente y tomar las primeras 12
    final shuffledQuestions = List<ExamQuestion>.from(allQuestions)..shuffle();
    return shuffledQuestions.take(12).toList();
  }

  @override
  Future<void> saveUserAnswer(String questionId, String selectedAnswer) async {
    await _localDataSource.insert(
      'user_answers',
      {
        'questionId': questionId,
        'selectedAnswer': selectedAnswer,
      },
    );
  }

  @override
  Future<List<String>> getCorrectAnswers(List<String> questionIds) async {
    final rawQuestions = await _localDataSource.query(
      'exam_questions',
      where: 'id IN (${questionIds.map((_) => '?').join(',')})',
      whereArgs: questionIds,
    );

    return rawQuestions.map((map) => map['correctAnswer'] as String).toList();
  }

  @override
  Future<ExamResult> calculateExamResult(List<UserAnswer> userAnswers) async {
    final questionIds = userAnswers.map((e) => e.questionId).toList();
    final correctAnswers = await getCorrectAnswers(questionIds);

    int correct = 0, incorrect = 0, unanswered = 0;

    for (final userAnswer in userAnswers) {
      if (userAnswer.selectedAnswer.isEmpty) {
        unanswered++;
      } else if (correctAnswers.contains(userAnswer.selectedAnswer)) {
        correct++;
      } else {
        incorrect++;
      }
    }

    return ExamResult(
      correctAnswers: correct,
      incorrectAnswers: incorrect,
      unanswered: unanswered,
    );
  }
}
 */

import 'package:flutter/foundation.dart';

class ExamRepositoryImpl implements ExamRepository {
  final LocalExamDataSource _localDataSource;

  ExamRepositoryImpl(this._localDataSource);

  @override
  Future<List<ExamQuestion>> getFinalExamQuestionsByModule(
      String language, String module) async {
    String moduleId = '';
    if (module == 'Junior') {
      moduleId = 'Jr';
    }

    try {
      final rawQuestions = await _localDataSource.query(
        'exam_questions',
        where: 'language = ? AND module = ?',
        whereArgs: [language, moduleId],
      );

      if (rawQuestions.isEmpty) {
        debugPrint(
            'No se encontraron preguntas en la base de datos para: $language - $moduleId');
        return [];
      }

      final allQuestions = rawQuestions.map((map) {
        final optionsRaw = map['options'] ?? '';
        return ExamQuestion(
          id: map['id']?.toString() ?? '',
          questionText: map['questionText']?.toString() ?? '',
          options: optionsRaw is String
              ? optionsRaw.split(',').map((e) => e.trim()).toList()
              : <String>[],
          correctAnswer: map['correctAnswer']?.toString() ?? '',
          language: map['language']?.toString() ?? '',
          module: map['module']?.toString() ?? '',
        );
      }).toList();

      if (allQuestions.length <= 12) {
        return allQuestions;
      }

      allQuestions.shuffle();
      return allQuestions.take(12).toList();
    } catch (e) {
      debugPrint('Error al obtener preguntas: $e');
      return [];
    }
  }

  @override
  Future<void> saveUserAnswer(String questionId, String selectedAnswer) async {
    try {
      await _localDataSource.insert(
        'user_answers',
        {
          'questionId': questionId,
          'selectedAnswer': selectedAnswer,
        },
      );
    } catch (e) {
      debugPrint('Error al guardar respuesta del usuario: $e');
    }
  }

  @override
  Future<List<String>> getCorrectAnswers(List<String> questionIds) async {
    if (questionIds.isEmpty) return [];

    try {
      final rawQuestions = await _localDataSource.query(
        'exam_questions',
        where: 'id IN (${questionIds.map((_) => '?').join(',')})',
        whereArgs: questionIds,
      );

      return rawQuestions
          .map((map) => map['correctAnswer']?.toString() ?? '')
          .toList();
    } catch (e) {
      debugPrint('Error al obtener respuestas correctas: $e');
      return [];
    }
  }

  @override
  Future<ExamResult> calculateExamResult(List<UserAnswer> userAnswers) async {
    final questionIds = userAnswers.map((e) => e.questionId).toList();
    final correctAnswers = await getCorrectAnswers(questionIds);

    int correct = 0, incorrect = 0, unanswered = 0;

    for (final userAnswer in userAnswers) {
      if (userAnswer.selectedAnswer.isEmpty) {
        unanswered++;
      } else if (correctAnswers.contains(userAnswer.selectedAnswer)) {
        correct++;
      } else {
        incorrect++;
      }
    }

    return ExamResult(
      correctAnswers: correct,
      incorrectAnswers: incorrect,
      unanswered: unanswered,
    );
  }
}
