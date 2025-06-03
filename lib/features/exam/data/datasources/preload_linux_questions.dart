import 'package:sqflite_common/sqlite_api.dart';
import 'package:rutacode/features/exam/data/models/exam_question_model.dart';

Future<void> preloadLinuxJrQuestions(Database db, tableName) async {
  final preloadedLinuxJrQuestions = [];
  // Insertar las preguntas en la base de datos
  for (final question in preloadedLinuxJrQuestions) {
    await db.insert(tableName, question.toMap());
  }
}

Future<void> preloadLinuxMidQuestions(Database db, tableName) async {
  final preloadedLinuxMidQuestions = [];
  // Insertar las preguntas en la base de datos
  for (final question in preloadedLinuxMidQuestions) {
    await db.insert(tableName, question.toMap());
  }
}

Future<void> preloadLinuxSrQuestions(Database db, tableName) async {
  final preloadedLinuxSrQuestions = [];

  // Insertar las preguntas en la base de datos
  for (final question in preloadedLinuxSrQuestions) {
    await db.insert(tableName, question.toMap());
  }
}
