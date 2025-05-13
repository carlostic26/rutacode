import 'package:rutacode/core/database/old_database_helper.dart';
import 'package:rutacode/features/level/data/models/level_model.dart';
import 'package:rutacode/features/level/domain/repositories/level_repository.dart';
import 'package:sqflite/sqflite.dart';

class LevelRepositoryImpl implements LevelRepository {
  final LocalDatabaseHelper _dbHelper = LocalDatabaseHelper();

  Future<Database> get _database async => await _dbHelper.getDatabase();

  @override
  Future<List<LevelModel>> getLevel(String module) async {
    final db = await _database;
    final maps = await db.query(
      'level',
      where: 'module = ?',
      whereArgs: [module],
    );

    return List.generate(maps.length, (i) {
      return LevelModel(
        id: maps[i]['id'] as int,
        module: maps[i]['module'] as String,
        order: maps[i]['num_order'] as int,
        title: maps[i]['title'] as String,
        description: maps[i]['description'] as String,
        points: maps[i]['points'] as int,
        isCompleted: maps[i]['isCompleted'] == 1,
      );
    });
  }

  // Método para contar los niveles de un módulo
  @override
  Future<int> countLevelsByModule(String module) async {
    final db = await _database;
    final count = Sqflite.firstIntValue(
      await db.rawQuery(
        'SELECT COUNT(*) FROM level WHERE module = ?',
        [module],
      ),
    );
    return count ?? 0;
  }
}
