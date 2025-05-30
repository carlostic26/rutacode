import 'package:rutacode/features/progress/data/datasources/progress_local_database.dart';
import 'package:rutacode/features/progress/data/model/progress_model.dart';
import 'package:rutacode/features/progress/domain/repositories/progress_repository.dart';
import 'package:rutacode/features/list_items/domain/repositories/subtopic_repository.dart';
import 'package:rutacode/features/list_items/domain/repositories/topic_repository.dart';

class ProgressRepositoryImpl implements ProgressRepository {
  final ProgressLocalContentDatabaseHelper _dbHelper =
      ProgressLocalContentDatabaseHelper();
  final SubtopicRepository _subtopicRepository;
  final TopicRepository _topicRepository;

  ProgressRepositoryImpl({
    required ProgressLocalContentDatabaseHelper dbHelper,
    required SubtopicRepository subtopicRepository,
    required TopicRepository topicRepository,
  })  : _subtopicRepository = subtopicRepository,
        _topicRepository = topicRepository;

  @override
  Future<void> saveScoreProgressBySubtopic({
    required String language,
    required String module,
    required int levelId,
    required String topic,
    required String subtopic,
    required int score,
  }) async {
    final db = await _dbHelper.getDatabase();

    // Verificar si ya existe un registro para evitar duplicados
    final existing = await db.query(
      'progress',
      where: '''
        language = ? AND module = ? AND level_id = ? 
        AND topic = ? AND subtopic = ?
      ''',
      whereArgs: [language, module, levelId, topic, subtopic],
    );

    if (existing.isEmpty) {
      await db.insert('progress', {
        'language': language,
        'module': module,
        'level_id': levelId,
        'topic': topic,
        'subtopic': subtopic,
        'score': score,
      });
    }
  }

  @override
  Future<bool> isSubtopicCompleted(String language, String module, int level,
      String topic, String subtopic) async {
    final db = await _dbHelper.getDatabase();
    final result = await db.query(
      'progress',
      where: '''
        language = ? AND module = ? AND level_id = ? 
        AND topic = ? AND subtopic = ?
      ''',
      whereArgs: [language, module, level, topic, subtopic],
    );
    return result.isNotEmpty;
  }

  @override
  Future<bool> isTopicCompleted(
      String language, String module, int level, String topic) async {
    final subtopics = await _subtopicRepository.getSubtopicsByTopic(
        language, module, level, topic);

    if (subtopics.isEmpty) return false;

    for (final subtopic in subtopics) {
      final isCompleted = await isSubtopicCompleted(
          language, module, level, topic, subtopic.subtopic!);
      if (!isCompleted) return false;
    }

    return true;
  }

  @override
  Future<bool> isLevelCompleted(
      String language, String module, int level) async {
    final topics =
        await _topicRepository.getTopicsByLevel(language, module, level);

    if (topics.isEmpty) return false;

    for (final topic in topics) {
      final isCompleted =
          await isTopicCompleted(language, module, level, topic.topic!);
      if (!isCompleted) return false;
    }

    return true;
  }

  @override
  Future<int> countLevelsByModule(String language, String module) async {
    final db = await _dbHelper.getDatabase();
    final result = await db.rawQuery('''
      SELECT COUNT(DISTINCT level_id) as total 
      FROM progress 
      WHERE language = ? AND module = ?
      ''', [language, module]);
    return result.first['total'] as int? ?? 0;
  }

  @override
  Future<int> countAllSubtopicsByModule(String language, String module) async {
    final db = await _dbHelper.getDatabase();

    final result = await db.rawQuery('''
      SELECT COUNT(subtopic) as total 
      FROM progress 
      WHERE language = ? AND module = ?
      ''', [language, module]);

    return result.first['total'] as int? ?? 0;
  }

  @override
  Future<int> getUserTotalScoreByLanguage(String language) async {
    final db = await _dbHelper.getDatabase();
    final result = await db.rawQuery(
        'SELECT SUM(score) as total FROM progress WHERE language = ?',
        [language]);
    return result.first['total'] as int? ?? 0;
  }

  @override
  Future<int> getUserTotalScoreByModule(String language, String module) async {
    final db = await _dbHelper.getDatabase();
    final result = await db.rawQuery(
        'SELECT SUM(score) as total FROM progress WHERE language = ? AND module = ?',
        [language, module]);
    return result.first['total'] as int? ?? 0;
  }

  @override
  Future<int> getTotalScoreByLevel({
    required String language,
    required String module,
    required int levelId,
  }) async {
    final db = await _dbHelper.getDatabase();
    final result = await db.rawQuery('''
      SELECT SUM(score) as total 
      FROM progress 
      WHERE language = ? AND module = ? AND level_id = ?
      ''', [language, module, levelId]);
    return result.first['total'] as int? ?? 0;
  }

  @override
  Future<List<ProgressModel>> getAllProgressByLanguage(String language) async {
    final db = await _dbHelper.getDatabase();
    final maps = await db.query(
      'progress',
      where: 'language = ?',
      whereArgs: [language],
    );
    return maps.map((map) => ProgressModel.fromMap(map)).toList();
  }

  @override
  Future<List<ProgressModel>> getProgressByModule(
      String language, String module) async {
    final db = await _dbHelper.getDatabase();
    final maps = await db.query(
      'progress',
      where: 'language = ? AND module = ?',
      whereArgs: [language, module],
    );
    return maps.map((map) => ProgressModel.fromMap(map)).toList();
  }

  @override
  Future<List<ProgressModel>> getProgressByLevel({
    required String language,
    required String module,
    required int levelId,
  }) async {
    final db = await _dbHelper.getDatabase();
    final maps = await db.query(
      'progress',
      where: 'language = ? AND module = ? AND level_id = ?',
      whereArgs: [language, module, levelId],
    );
    return maps.map((map) => ProgressModel.fromMap(map)).toList();
  }

  @override
  Future<List<ProgressModel>> getProgressByTopic({
    required String language,
    required String module,
    required int levelId,
    required String topic,
  }) async {
    final db = await _dbHelper.getDatabase();
    final maps = await db.query(
      'progress',
      where: '''
        language = ? AND module = ? AND level_id = ? AND topic = ?
      ''',
      whereArgs: [language, module, levelId, topic],
    );
    return maps.map((map) => ProgressModel.fromMap(map)).toList();
  }

  Future<int> getTotalSubtopicsByModule({
    required String language,
    required String module,
  }) async {
    final db = await _dbHelper.getDatabase();
    final result = await db.rawQuery('''
      SELECT COUNT(*) as total 
      FROM progress
      WHERE language = ? AND module = ?
      ''', [language, module]);
    return result.first['total'] as int;
  }

  @override
  Future<int> getTotalSubtopicsByLevel({
    required String language,
    required String module,
    required int level,
  }) async {
    final db = await _dbHelper.getDatabase();
    final result = await db.rawQuery('''
      SELECT COUNT(*) as total 
      FROM progress 
      WHERE language = ? AND module = ? AND level = ?
      ''', [language, module, level]);
    return result.first['total'] as int;
  }

  @override
  Future<int> getCompletedSubtopicsByLevel({
    required String language,
    required String module,
    required int level,
  }) async {
    final db = await _dbHelper.getDatabase();
    final result = await db.rawQuery('''
      SELECT COUNT(DISTINCT subtopic) as total 
      FROM progress 
      WHERE language = ? AND module = ? AND level_id = ?
      ''', [language, module, level]);
    return result.first['total'] as int;
  }

  Future<int> getCompletedSubtopicsByModule({
    required String language,
    required String module,
  }) async {
    final db = await _dbHelper.getDatabase();
    final result = await db.rawQuery('''
      SELECT COUNT(DISTINCT subtopic) as total 
      FROM progress 
      WHERE language = ? AND module = ?
      ''', [language, module]);
    return result.first['total'] as int;
  }

//progreso de porcentaje por cada modulo de un lenguajer
  @override
  Future<double> getProgressPercentageByModule({
    required String language,
    required String module,
  }) async {
    // Obtener subtemas completados
    final completed = await getCompletedSubtopicsByModule(
      language: language,
      module: module,
    );

    // Obtener total de subtemas
    final total = await getTotalSubtopicsByModule(
      language: language,
      module: module,
    );

    if (total == 0) return 0.0;

    return (completed / total) * 100;
  }

  @override
  Future<void> deleteAllUserProgress() async {
    final db = await _dbHelper.getDatabase();
    await db.delete('progress');
  }
}
