import 'package:rutacode/common/feature/content/data/datasources/old_database_helper.dart';
import 'package:rutacode/features/list_items/data/model/subtopic_model.dart';
import 'package:rutacode/features/list_items/domain/repositories/subtopic_repository.dart';
import 'package:sqflite/sqflite.dart';

class SubtopicRepositoryImpl implements SubtopicRepository {
  final LocalDatabaseHelper _dbHelper = LocalDatabaseHelper();

  Future<Database> get _database async => await _dbHelper.getDatabase();

  @override
  Future<List<SubtopicModel>> getSubtopics(
      String topicID, String module) async {
    final db = await _database;
    final maps = await db.query(
      'subtopic',
      where: 'topic_id = ? and module = ?',
      whereArgs: [topicID, module],
    );

    return List.generate(maps.length, (i) {
      return SubtopicModel(
        id: maps[i]['id'] as String,
        title: maps[i]['title'] as String,
        module: maps[i]['module'] as String,
      );
    });
  }
}
