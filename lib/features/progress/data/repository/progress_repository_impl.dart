import 'package:flutter/material.dart';
import 'package:rutacode/common/feature/content/data/datasources/db_helper.dart';
import 'package:rutacode/features/progress/data/datasources/progress_local_database.dart';
import 'package:rutacode/features/progress/data/model/progress_model.dart';
import 'package:rutacode/features/progress/domain/repositories/progress_repository.dart';
import 'package:rutacode/features/list_items/domain/repositories/subtopic_repository.dart';
import 'package:rutacode/features/list_items/domain/repositories/topic_repository.dart';

class ProgressRepositoryImpl implements ProgressRepository {
  final ProgressLocalContentDatabaseHelper _dbProgressHelper =
      ProgressLocalContentDatabaseHelper();

  final LocalContentDatabaseHelper _dbLocalHelper =
      LocalContentDatabaseHelper();

  final SubtopicRepository _subtopicRepository;
  final TopicRepository _topicRepository;

  ProgressRepositoryImpl({
    required ProgressLocalContentDatabaseHelper dbHelper,
    required SubtopicRepository subtopicRepository,
    required TopicRepository topicRepository,
  })  : _subtopicRepository = subtopicRepository,
        _topicRepository = topicRepository;

  @override
  Future<void> setScoreBySubtopic({
    required String language,
    required String module,
    required int levelId,
    required String topic,
    required String subtopic,
    required int score,
  }) async {
    final db = await _dbProgressHelper.getDatabase();

    // Verificar si ya existe un registro para evitar duplicados
    final existing = await db.query(
      'progress',
      where: '''
        language = ? AND module = ? AND level_id = ? 
        AND topic = ? AND subtopic = ?
      ''',
      whereArgs: [language, module, levelId, topic, subtopic],
    );

    debugPrint('Existing progress: $existing');

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
  Future<int> countTotalScoreByLanguage(String language) async {
    final db = await _dbProgressHelper.getDatabase();
    final result = await db.rawQuery(
        'SELECT SUM(score) as total FROM progress WHERE language = ?',
        [language]);
    return result.first['total'] as int? ?? 0;
  }

  @override
  Future<int> countTotalScoreByModule(String language, String module) async {
    final db = await _dbProgressHelper.getDatabase();
    final result = await db.rawQuery(
        'SELECT SUM(score) as total FROM progress WHERE language = ? AND module = ?',
        [language, module]);
    return result.first['total'] as int? ?? 0;
  }

  @override
  Future<int> countTotalScoreByLevel({
    required String language,
    required String module,
    required int levelId,
  }) async {
    final db = await _dbProgressHelper.getDatabase();
    final result = await db.rawQuery('''
      SELECT SUM(score) as total 
      FROM progress 
      WHERE language = ? AND module = ? AND level_id = ?
      ''', [language, module, levelId]);
    return result.first['total'] as int? ?? 0;
  }

  // ========== Consultas de progreso ==========

  @override
  Future<double> getLevelProgressPercentage({
    required String language,
    required String module,
    required int level,
  }) async {
    // Obtener subtemas completados en este nivel
    final completed = await countSubtopicsCompletedByLevel(
      language: language,
      module: module,
      level: level,
    );

    // Obtener total de subtemas en este nivel
    final totalSubtopics = await _countTotalSubtopicsInLevel(
      language: language,
      module: module,
      level: level,
    );

    if (totalSubtopics == 0) return 0.0;

    return completed / totalSubtopics;
  }

  @override
  Future<List<ProgressModel>> getProgressByLanguage(String language) async {
    final db = await _dbProgressHelper.getDatabase();
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
    final db = await _dbProgressHelper.getDatabase();
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
    final db = await _dbProgressHelper.getDatabase();
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
    final db = await _dbProgressHelper.getDatabase();
    final maps = await db.query(
      'progress',
      where: '''
        language = ? AND module = ? AND level_id = ? AND topic = ?
      ''',
      whereArgs: [language, module, levelId, topic],
    );
    return maps.map((map) => ProgressModel.fromMap(map)).toList();
  }

  // ====== Métricas de progreso =========
  @override
  Future<int> countSubtopicsCompletedByModule({
    required String language,
    required String module,
  }) async {
    final db = await _dbProgressHelper.getDatabase();
    final result = await db.rawQuery('''
      SELECT COUNT(DISTINCT subtopic) as total 
      FROM progress
      WHERE language = ? AND module = ?
      ''', [language, module]);
    return result.first['total'] as int;
  }

  @override
  Future<int> countSubtopicsCompletedByLevel({
    required String language,
    required String module,
    required int level,
  }) async {
    final db = await _dbProgressHelper.getDatabase();
    final result = await db.rawQuery('''
      SELECT COUNT(DISTINCT subtopic) as total 
      FROM progress 
      WHERE language = ? AND module = ? AND level_id = ?
      ''', [language, module, level]);
    return result.first['total'] as int;
  }

  @override
  Future<int> countLevelsCompletedByModule({
    required String language,
    required String module,
  }) async {
    final db = await _dbProgressHelper.getDatabase();
    final result = await db.rawQuery('''
      SELECT COUNT(DISTINCT level_id) as total 
      FROM progress 
      WHERE language = ? AND module = ?
      ''', [language, module]);
    return result.first['total'] as int;
  }

// ====== Métrica de porcentaje por cada modulo de un lenguaje
  @override
  Future<double> getProgressPercentageByModule({
    required String language,
    required String module,
  }) async {
    // Obtener subtemas completados
    final completed = await countSubtopicsCompletedByModule(
      language: language,
      module: module,
    );

    // Obtener total de subtemas de content programming
    final total =
        await countTotalSubtopicsByModuleInProgrammingContent(language, module);

    if (total == 0) return 0.0;

    return (completed / total) * 100;
  }

  // ===== Consultas de estado de completado
  @override
  Future<bool> isSubtopicCompleted(String language, String module, int level,
      String topic, String subtopic) async {
    final db = await _dbProgressHelper.getDatabase();
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
  Future<void> deleteAllUserProgress() async {
    final db = await _dbProgressHelper.getDatabase();
    await db.delete('progress');
  }

  // ========== Consultas de cuentas en la BD programming_content ==========

  @override
  Future<int> countTotalLevelsByModuleInProgrammingContent(
      String language, String module) async {
    try {
      final db = await _dbLocalHelper.getDatabase();
      final result = await db.query(
        'programming_content',
        distinct: true,
        columns: ['level'],
        where: 'language = ? AND module = ?',
        whereArgs: [language, module],
      );

      return result.length;
    } catch (e) {
      debugPrint('Error counting distinct levels: $e');
      return 0;
    }
  }

  @override
  Future<int> countTotalSubtopicsByModuleInProgrammingContent(
      String language, String module) async {
    try {
      final db = await _dbLocalHelper.getDatabase();
      final result = await db.query(
        'programming_content',
        distinct: true,
        columns: ['subtopic'],
        where: 'language = ? AND module = ?',
        whereArgs: [language, module],
      );

      return result.length;
    } catch (e) {
      debugPrint('Error counting distinct subtopics: $e');
      return 0;
    }
  }

  Future<int> _countTotalSubtopicsInLevel({
    required String language,
    required String module,
    required int level,
  }) async {
    try {
      final db = await _dbLocalHelper.getDatabase();
      final result = await db.query(
        'programming_content',
        distinct: true,
        columns: ['subtopic'],
        where: 'language = ? AND module = ? AND level = ?',
        whereArgs: [language, module, level],
      );
      return result.length;
    } catch (e) {
      debugPrint('Error counting subtopics in level: $e');
      return 0;
    }
  }
}
