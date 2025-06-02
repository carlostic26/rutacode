import 'package:rutacode/common/feature/content/data/datasources/db_helper.dart';
import 'package:rutacode/features/detail/data/models/detail_model.dart';
import 'package:rutacode/features/level/domain/repositories/level_repository.dart';
import 'package:sqflite/sqflite.dart';

class LevelRepositoryImpl implements LevelRepository {
  final LocalContentDatabaseHelper _dbHelper = LocalContentDatabaseHelper();

  Future<Database> get _database async => await _dbHelper.getDatabase();

  @override
  Future<List<DetailContentModel>> getLevelByModule(
      String language, String module) async {
    final db = await _database;

    final maps = await db.rawQuery('''
      SELECT MIN(id) as id, language, module, level, title_level, topic, subtopic, definition, code_example
      FROM programming_content
      WHERE language = ? AND module = ?
      GROUP BY level
      ORDER BY level ASC
    ''', [language, module]);

    return List.generate(maps.length, (i) {
      return DetailContentModel(
        id: maps[i]['id'] as int,
        language: maps[i]['language'] as String,
        module: maps[i]['module'] as String,
        level: maps[i]['level'] as int,
        titleLevel: maps[i]['title_level'] as String,
        topic: maps[i]['topic'] as String,
        subtopic: maps[i]['subtopic'] as String,
        definition: maps[i]['definition'] as String,
        codeExample: maps[i]['code_example'] as String,
      );
    });
  }

// Método para contar los niveles (registros) de un módulo en un lenguaje específico
  @override
  Future<int> countLevelsByModule(String language, String module) async {
    final db = await _database;
    final count = Sqflite.firstIntValue(
      await db.rawQuery(
        'SELECT COUNT(*) FROM programming_content WHERE language = ? AND module = ?',
        [language, module],
      ),
    );
    return count ?? 0;
  }
}
