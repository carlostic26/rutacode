import 'package:rutacode/common/feature/content/data/datasources/db_helper.dart';
import 'package:rutacode/features/detail/data/models/detail_model.dart';
import 'package:rutacode/features/list_items/domain/repositories/topic_repository.dart';
import 'package:sqflite/sqflite.dart';

class TopicRepositoryImpl implements TopicRepository {
  final LocalContentDatabaseHelper _dbHelper = LocalContentDatabaseHelper();

  Future<Database> get _database async => await _dbHelper.getDatabase();

  @override
  Future<List<DetailContentModel>> getTopicsByModule(
      String language, String module) async {
    final db = await _database;
    final maps = await db.rawQuery('''
      SELECT MIN(id) as id, language, module, level, tittle_level, topic, subtopic, definition, code_example
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
        titleLevel: maps[i]['tittle_level'] as String,
        topic: maps[i]['topic'] as String,
        subtopic: maps[i]['subtopic'] as String,
        definition: maps[i]['definition'] as String,
        codeExample: maps[i]['code_example'] as String,
      );
    });
  }
}
