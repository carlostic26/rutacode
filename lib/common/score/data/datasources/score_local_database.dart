import 'package:rutacode/features/level/data/datasources/level_local_database.dart';
import 'package:sqflite_common/sqlite_api.dart';

class ScoreLocalDatabaseHelper {
  LevelLocalDatabaseHelper dbHelper = LevelLocalDatabaseHelper();

  Future<void> createScoreTable(Database db) async {
    await db.execute('''
      CREATE TABLE score (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          subtopic TEXT NOT NULL,
          module TEXT NOT NULL,
          level TEXT NOT NULL,
          topic TEXT NOT NULL,
          amount INTEGER NOT NULL
      );
    ''');
  }
}
