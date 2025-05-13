import 'package:rutacode/common/data/datasources/old_database_helper.dart';
import 'package:rutacode/features/list_items/data/model/topic_model.dart';
import 'package:rutacode/features/list_items/domain/repositories/topic_repository.dart';
import 'package:sqflite/sqflite.dart';

class TopicRepositoryImpl implements TopicRepository {
  final LocalDatabaseHelper _dbHelper = LocalDatabaseHelper();

  Future<Database> get _database async => await _dbHelper.getDatabase();

  @override
  Future<List<TopicModel>> getTopics(int levelId, String module) async {
    final db = await _database;
    final maps = await db.query(
      'topic',
      where: "level_id = ? and module = ?",
      whereArgs: [levelId, module],
    );

    return List.generate(maps.length, (i) {
      return TopicModel(
        id: maps[i]['id'] as String,
        title: maps[i]['title'] as String,
        module: maps[i]['module'] as String,
      );
    });
  }
}
