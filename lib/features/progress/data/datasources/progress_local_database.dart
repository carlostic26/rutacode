import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ProgressLocalContentDatabaseHelper {
  Database? _database;
  final int dbVersion = 5;

  Future<Database> getDatabase() async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    try {
      final dbPath = await getDatabasesPath();
      final String dbName = 'rutacode_progress_v$dbVersion.db';

      return await openDatabase(
        join(dbPath, dbName),
        version: 1,
        onCreate: (db, version) async {
          await db.execute('''
          CREATE TABLE progress (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              language TEXT NOT NULL,
              module TEXT NOT NULL,
              level_id INTEGER NOT NULL,
              topic TEXT NOT NULL,
              subtopic TEXT NOT NULL,
              score INTEGER NOT NULL
          );
        ''');
        },
      );
    } catch (e) {
      throw Exception('Error initializing progress database: $e');
    }
  }

  // Método para cerrar la base de datos (opcional)
  Future<void> closeDatabase() async {
    if (_database != null) {
      await _database!.close();
      _database = null;
    }
  }
}
