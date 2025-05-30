import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/exam_question_model.dart';

class LocalExamDataSource {
  static const String _tableName = 'exam_questions';
  static const String _dbName = 'final_exam4.db';
  Database? _database;

  // Inicializar la base de datos
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
      version: 1,
      onCreate: _onCreate,
    );
  }

  // Crear la tabla de preguntas y pre-cargar preguntas
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $_tableName (
      id TEXT PRIMARY KEY,
      questionText TEXT,
      options TEXT,
      correctAnswer TEXT,
      language TEXT,
      moduleId TEXT
    )
  ''');

    // Añade esta tabla nueva
    await db.execute('''
    CREATE TABLE IF NOT EXISTS user_answers (
      questionId TEXT PRIMARY KEY,
      selectedAnswer TEXT
    )
  ''');

    await _preloadQuestions(db);
  }

  Future<void> _preloadQuestions(Database db) async {
    final preloadedJavaQuestions = [
      // Preguntas para el módulo Jr

      ExamQuestionModel(
        id: '1',
        questionText:
            'En Dart, ¿qué palabra clave se usa para declarar una variable inmutable que se asigna en tiempo de compilación?',
        options: ['A) var', 'B) final', 'C) const', 'D) static'],
        correctAnswer: 'C',
        language: 'Java',
        moduleId: 'Jr',
      ),

      // Preguntas para el módulo Mid
      ExamQuestionModel(
        id: '1',
        questionText:
            '¿Cuál de estos NO es un tipo de dato incorporado en Dart?',
        options: ['A) List', 'B) Map', 'C) Tuple', 'D) Set'],
        correctAnswer: 'C',
        language: 'Java',
        moduleId: 'Jr',
      ),

      // Preguntas para el módulo Sr
      ExamQuestionModel(
        id: '1',
        questionText:
            '¿Cuál de estos NO es un tipo de dato incorporado en Dart?',
        options: ['A) List', 'B) Map', 'C) Tuple', 'D) Set'],
        correctAnswer: 'C',
        language: 'Java',
        moduleId: 'Jr',
      ),
    ];

    // Insertar las preguntas en la base de datos
    for (final question in preloadedJavaQuestions) {
      await db.insert(_tableName, question.toMap());
    }
  }

/*   Future<void> printAllQuestions() async {
    final db = await getDatabase();
    final questions = await db.query('exam_questions');
    for (final question in questions) {
      debugPrint(question);
    }
  } */

  // Método genérico para ejecutar consultas
  Future<List<Map<String, dynamic>>> query(String table,
      {String? where, List<dynamic>? whereArgs}) async {
    final db = await getDatabase();
    return await db.query(table, where: where, whereArgs: whereArgs);
  }

  // Método genérico para insertar datos
  Future<void> insert(String table, Map<String, dynamic> data) async {
    final db = await getDatabase();
    await db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
