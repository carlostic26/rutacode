import 'package:rutacode/common/feature/content/data/datasources/db_helper.dart';
import 'package:rutacode/common/feature/content/data/model/content_model.dart';
import 'package:rutacode/common/feature/content/domain/repositories/content_repository.dart';
import 'package:sqflite_common/sqlite_api.dart';

class DetailRepositoryImpl implements ContentRepository {
  final LocalContentDatabaseHelper _dbHelper = LocalContentDatabaseHelper();

  Future<Database> get _database async => await _dbHelper.getDatabase();

  @override
  Future<ContentModel> getContentByCompositeKey({
    required String language,
    required String module,
    required int level,
    required String topic,
    required String subtopic,
  }) async {
    final db = await _database;
    final List<Map<String, dynamic>> maps = await db.query(
      'programming_content',
      where: '''
        language = ? AND 
        module = ? AND 
        level = ? AND 
        topic = ? AND 
        subtopic = ?
      ''',
      whereArgs: [language, module, level, topic, subtopic],
      limit: 1,
    );

    if (maps.isEmpty) {
      throw Exception('Content not found');
    }

    return ContentModel.fromMap(maps.first);
  }

  @override
  Future<List<String>> getAllLanguages() async {
    final db = await _database;
    final maps = await db.query(
      'programming_content',
      distinct: true,
      columns: ['language'],
    );
    return maps.map((e) => e['language'] as String).toList();
  }

  @override
  Future<List<String>> getModulesByLanguage(String language) async {
    final db = await _database;
    final maps = await db.query(
      'programming_content',
      distinct: true,
      columns: ['module'],
      where: 'language = ?',
      whereArgs: [language],
    );
    return maps.map((e) => e['module'] as String).toList();
  }

  @override
  Future<List<int>> getLevelsByContent({
    required String language,
    required String module,
  }) async {
    final db = await _database;
    final maps = await db.query(
      'programming_content',
      distinct: true,
      columns: ['level'],
      where: 'language = ? AND module = ?',
      whereArgs: [language, module],
      orderBy: 'level ASC',
    );
    return maps.map((e) => e['level'] as int).toList();
  }

  @override
  Future<List<String>> getTopicsByContent({
    required String language,
    required String module,
    required int level,
  }) async {
    final db = await _database;
    final maps = await db.query(
      'programming_content',
      distinct: true,
      columns: ['topic'],
      where: 'language = ? AND module = ? AND level = ?',
      whereArgs: [language, module, level],
    );
    return maps.map((e) => e['topic'] as String).toList();
  }

  @override
  Future<List<String>> getSubtopicsByContent({
    required String language,
    required String module,
    required int level,
    required String topic,
  }) async {
    final db = await _database;
    final maps = await db.query(
      'programming_content',
      distinct: true,
      columns: ['subtopic'],
      where: 'language = ? AND module = ? AND level = ? AND topic = ?',
      whereArgs: [language, module, level, topic],
    );
    return maps.map((e) => e['subtopic'] as String).toList();
  }
}
