import 'package:rutacode/common/feature/content/data/datasources/db_helper.dart';
import 'package:rutacode/features/detail/data/models/detail_model.dart';
import 'package:rutacode/features/list_items/domain/repositories/topic_repository.dart';
import 'package:sqflite/sqflite.dart';

class TopicRepositoryImpl implements TopicRepository {
  final LocalContentDatabaseHelper _dbHelper = LocalContentDatabaseHelper();

  Future<Database> get _database async => await _dbHelper.getDatabase();

  @override
  Future<List<DetailContentModel>> getTopicsByLevel(
      String language, String module, int level) async {
    final db = await _database;

    // Opción 1: Si necesitas los subtopics agrupados
    final maps = await db.rawQuery('''
      SELECT 
        MIN(id) as id, 
        language, 
        module, 
        level, 
        title_level, 
        topic,
        GROUP_CONCAT(subtopic) as subtopics
      FROM programming_content
      WHERE language = ? AND module = ? AND level = ?
      GROUP BY topic
      ORDER BY MIN(id) ASC
    ''', [language, module, level]);

    // Opción 2: todos los registros individualmente
    // final maps = await db.query(
    //   'programming_content',
    //   where: 'language = ? AND module = ? AND level = ?',
    //   whereArgs: [language, module, level],
    //   orderBy: 'id ASC',
    // );
    return maps.map((map) {
      return DetailContentModel(
        id: map['id'] as int,
        language: map['language'] as String,
        module: map['module'] as String,
        level: map['level'] as int,
        titleLevel: map['title_level'] as String,
        topic: map['topic'] as String,
        subtopic: map['subtopics']
            as String, // Aquí tendrás todos los subtopics concatenados
        definition: '', // No necesario para esta vista
        codeExample: '', // No necesario para esta vista
      );
    }).toList();
  }
}
