import 'package:flutter/material.dart';
import 'package:rutacode/features/exam/data/datasources/preload_aws_questions.dart';
import 'package:rutacode/features/exam/data/datasources/preload_cpp_questions.dart';
import 'package:rutacode/features/exam/data/datasources/preload_java_questions.dart';
import 'package:rutacode/features/exam/data/datasources/preload_js_questions.dart';
import 'package:rutacode/features/exam/data/datasources/preload_linux_questions.dart';
import 'package:rutacode/features/exam/data/datasources/preload_python_questions.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalExamDataSource {
  static const String _tableName = 'exam_questions';
  static const int _dbVersion = 12;
  static const String _dbName = 'final_exam$_dbVersion.db';
  Database? _database;

  Future<Database> getDatabase() async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);

    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableName (
        id TEXT PRIMARY KEY,
        language TEXT,
        module TEXT,
        questionText TEXT,
        options TEXT,
        correctAnswer TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS user_answers (
        questionId TEXT PRIMARY KEY,
        selectedAnswer TEXT
      )
    ''');

    debugPrint('Creando y precargando base de datos versión $_dbVersion');

    await preloadJavaQuestions(db);
    await preloadJavaScriptQuestions(db);
    await preloadAwsQuestions(db);
    await preloadCppQuestions(db);
    await preloadLinuxQuestions(db);
    await preloadPythonQuestions(db);
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < _dbVersion) {
      debugPrint('Actualizando base de datos de $oldVersion a $newVersion...');
      await db.execute('DROP TABLE IF EXISTS $_tableName');
      await _onCreate(db, newVersion);
    }
  }

  Future<void> preloadJavaQuestions(Database db) async {
    await preloadJavaJrQuestions(db, _tableName);
    await preloadJavaMidQuestions(db, _tableName);
    await preloadJavaSrQuestions(db, _tableName);
  }

  Future<void> preloadJavaScriptQuestions(Database db) async {
    await preloadJavaScriptJrQuestions(db, _tableName);
    await preloadJavaScriptMidQuestions(db, _tableName);
    await preloadJavaScriptSrQuestions(db, _tableName);
  }

  Future<void> preloadAwsQuestions(Database db) async {
    await preloadAwsJrQuestions(db, _tableName);
    await preloadAwsMidQuestions(db, _tableName);
    await preloadAwsSrQuestions(db, _tableName);
  }

  Future<void> preloadCppQuestions(Database db) async {
    await preloadCppJrQuestions(db, _tableName);
    await preloadCppMidQuestions(db, _tableName);
    await preloadCppSrQuestions(db, _tableName);
  }

  Future<void> preloadLinuxQuestions(Database db) async {
    await preloadLinuxJrQuestions(db, _tableName);
    await preloadLinuxMidQuestions(db, _tableName);
    await preloadLinuxSrQuestions(db, _tableName);
  }

  Future<void> preloadPythonQuestions(Database db) async {
    await preloadPythonJrQuestions(db, _tableName);
    await preloadPythonMidQuestions(db, _tableName);
    await preloadPythonSrQuestions(db, _tableName);
  }

  Future<void> debugdebugPrintAllQuestions() async {
    final db = await getDatabase();
    debugPrint('debugdebugPrintAllQuestions: \n');
    final questions = await db.query(_tableName);
    for (final question in questions) {
      debugPrint(question.toString());
    }
  }

  Future<List<Map<String, dynamic>>> query(
    String table, {
    String? where,
    List<dynamic>? whereArgs,
  }) async {
    final db = await getDatabase();
    return await db.query(table, where: where, whereArgs: whereArgs);
  }

  Future<void> insert(String table, Map<String, dynamic> data) async {
    final db = await getDatabase();
    await db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
