import 'package:rutacode/features/exam/data/datasources/preload_java_questions.dart';
import 'package:rutacode/features/exam/data/datasources/preload_js_questions.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalExamDataSource {
  static const String _tableName = 'exam_questions';
  static const int _dbVersion = 2;
  static const String _dbName = 'final_exam$_dbVersion.db';
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
      module TEXT
    )
  ''');

    // Añade esta tabla nueva
    await db.execute('''
    CREATE TABLE IF NOT EXISTS user_answers (
      questionId TEXT PRIMARY KEY,
      selectedAnswer TEXT
    )
  ''');

    await preloadJavaQuestions(db);
    await preloadJavScriptQuestions(db);
  }

  Future<void> preloadJavaQuestions(Database db) async {
    preloadJavaJrQuestions(db, _tableName);
    preloadJavaMidQuestions(db, _tableName);
    preloadJavaSrQuestions(db, _tableName);
  }

  Future<void> preloadJavScriptQuestions(Database db) async {
    preloadJavaScriptJrQuestions(db, _tableName);
    preloadJavaScriptMidQuestions(db, _tableName);
    preloadJavaScriptSrQuestions(db, _tableName);
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
