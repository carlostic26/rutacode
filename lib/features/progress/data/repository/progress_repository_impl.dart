import 'package:rutacode/common/feature/content/data/datasources/db_helper.dart';
import 'package:rutacode/features/progress/data/datasources/progress_local_database.dart';
import 'package:rutacode/features/progress/data/model/progress_model.dart';
import 'package:rutacode/features/progress/domain/repositories/progress_repository.dart';
import 'package:rutacode/features/list_items/domain/repositories/subtopic_repository.dart';
import 'package:rutacode/features/list_items/domain/repositories/topic_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

/* class ProgressRepositoryImpl implements ProgressRepository {
  final ProgressLocalContentDatabaseHelper _dbHelper =
      ProgressLocalContentDatabaseHelper();
  final SubtopicRepository _subtopicRepository;
  final TopicRepository _topicRepository;

  final LocalContentDatabaseHelper _localDbHelper =
      LocalContentDatabaseHelper();

  // Constructor que inicializa _subtopicRepository
  ProgressRepositoryImpl(this._subtopicRepository, this._topicRepository);

  Future<Database> get progressLocalDatabase async =>
      await _dbHelper.getDatabase();

  final LocalContentDatabaseHelper _subtopicDbHelper =
      LocalContentDatabaseHelper();
  Future<Database> get subtopicLocalDatabase async =>
      await _subtopicDbHelper.getDatabase();

  Future<Database> get _localDatabase async =>
      await _localDbHelper.getDatabase();

  @override
  Future<void> createProgressBySubtopic({
    required String language,
    required String module,
    required int levelId,
    required String topic,
    required String subtopic,
    required int score,
  }) async {
    final db = await progressLocalDatabase;
    await db.insert(
      'progress',
      {
        'language': language,
        'module': module,
        'level_id': levelId,
        'topic': topic,
        'subtopic': subtopic,
        'score': score,
      },
    );
  }

  @override
  Future<void> saveCompletedLevels(
      String module, List<int> completedLevels) async {
    final prefs = await SharedPreferences.getInstance();

    // Convertimos la lista de IDs a lista de strings
    final levelsAsStrings = completedLevels.map((id) => id.toString()).toList();

    // Guardamos usando una clave única por módulo
    await prefs.setStringList('completed_levels_$module', levelsAsStrings);
  }

  @override
  Future<List<int>> getAllCompletedLevels(String module) async {
    final db = await progressLocalDatabase;

    // Asumiendo que tu tabla progress tiene una columna 'module'
    final result = await db.query(
      'progress',
      columns: ['level_id'],
      where: 'module = ?',
      whereArgs: [module],
    );

    return result.map((map) => map['level_id'] as int).toList();
  }

  @override
  Future<List<ProgressModel>> getAllProgressByLanguage(String language) async {
    final db = await progressLocalDatabase;
    final maps = await db.query(
      'progress',
      where: 'language = ?',
      whereArgs: [language],
    );

    return List.generate(maps.length, (i) {
      return ProgressModel.fromMap(maps[i]);
    });
  }

  @override
  Future<List<ProgressModel>> getAllModuleProgress(String module) async {
    final db = await progressLocalDatabase;
    final maps = await db.query(
      'progress',
      where: 'module = ?',
      whereArgs: [module],
    );

    return List.generate(maps.length, (i) {
      return ProgressModel.fromMap(maps[i]);
    });
  }

  @override
  Future<List<ProgressModel>> getAllLevelProgressByModule({
    required String module,
    required int levelId,
  }) async {
    final db = await progressLocalDatabase;
    final maps = await db.query(
      'progress',
      where: 'module = ? AND level_id = ?',
      whereArgs: [module, levelId],
    );

    return List.generate(maps.length, (i) {
      return ProgressModel.fromMap(maps[i]);
    });
  }

  @override
  Future<List<ProgressModel>> getAllTopicProgressByModule({
    required String module,
    required int levelId,
    required String topicId,
  }) async {
    final db = await progressLocalDatabase;
    final maps = await db.query(
      'progress',
      where: 'module = ? AND level_id = ? AND topic_id = ?',
      whereArgs: [module, levelId, topicId],
    );

    return List.generate(maps.length, (i) {
      return ProgressModel.fromMap(maps[i]);
    });
  }

  @override
  Future<bool> isTopicCompleted(String language, String module, int level,
      String topic, String subtopicTitle) async {
    // Obtener todos los subtopics del topic
    final subtopics = await _subtopicRepository.getSubtopicsByTopic(
        language, module, level, topic);

    // Verificar si todos los subtopics están completados
    for (final subtopic in subtopics) {
      final isCompleted = await isSubtopicCompleted(
          language, module, level, topic, subtopicTitle);
      if (!isCompleted) {
        return false; // Si algún subtopic no está completado, el topic no está completado
      }
    }

    //print("Verificando subtopics del topic $topicId");
    for (final subtopic in subtopics) {
      final isCompleted = await isSubtopicCompleted(
          language, module, level, topic, subtopicTitle);
      //print("En impl, Subtopic ${subtopic.id}: ¿Completado? $isCompleted");
    }

    return true; // Todos los subtopics están completados
  }

  @override
  Future<bool> isSubtopicCompleted(String language, String module, int level,
      String topic, String subtopic) async {
    final db = await progressLocalDatabase;
    final result = await db.query(
      'progress',
      where:
          'language = ? AND module = ? AND level_id = ? AND topic = ? AND subtopic = ?',
      whereArgs: [language, module, level, topic, subtopic],
    );
    return result.isNotEmpty;
  }

  @override
  Future<List<String>> getAllCompletedSubtopics(String module) async {
    final db = await progressLocalDatabase;
    final result = await db.query(
      'progress',
      columns: ['subtopic'],
      where: 'module = ?',
      whereArgs: [module],
      distinct: true,
    );
    return result.map((map) => map['subtopic'] as String).toList();
  }

  @override
  Future<List<String>> getAllCompletedTopics(String module) async {
    final db = await progressLocalDatabase;
    final result = await db.query(
      'progress',
      columns: ['topic'],
      where: 'module = ?',
      whereArgs: [module],
    );
    return result.map((map) => map['topic'] as String).toList();
  }

  //---- Score

  //en este metodo se obtiene los puntajes ya creados por los casos de uso de progress
  @override
  Future<List<int>> getScoresByModule(String module) async {
    final db = await progressLocalDatabase;

    // Consultar todos los registros del módulo
    final scores = await db.query(
      'progress',
      where: 'module = ?',
      whereArgs: [module],
    );

    // Agrupar los puntajes por nivel
    final levelScores = <int, int>{};
    for (final score in scores) {
      final level = score['level_id'] as int;
      final amount = score['score'] as int;

      // Sumar los puntajes por nivel
      levelScores[level] = (levelScores[level] ?? 0) + amount;
    }

    // Ordenar los niveles y devolver una lista de puntajes
    final sortedLevels = levelScores.keys.toList()..sort();
    return sortedLevels.map((level) => levelScores[level]!).toList();
  }

  Future<List<int>> calculateCircularProgressByModule(String module) async {
    final db = await progressLocalDatabase;

    // Consultar todos los registros del módulo
    final scores = await db.query(
      'progress',
      where: 'module = ?',
      whereArgs: [module],
    );

    // Agrupar los puntajes por nivel
    final levelScores = <int, int>{};
    for (final score in scores) {
      final level = score['level_id'] as int;
      final amount = score['score'] as int;

      // Sumar los puntajes por nivel
      levelScores[level] = (levelScores[level] ?? 0) + amount;
    }

    // Ordenar los niveles y devolver una lista de puntajes
    final sortedLevels = levelScores.keys.toList()..sort();
    return sortedLevels.map((level) => levelScores[level]!).toList();
  }

  @override
  Future<bool> isLevelCompleted(String language, String module, int level,
      String topicTitle, subtopic) async {
    // Obtener todos los topics del nivel
    final topics =
        await _topicRepository.getTopicsByLevel(language, module, level);

    // Verificar si todos los topics están completados
    for (final topic in topics) {
      final isCompleted =
          await isTopicCompleted(language, module, level, topicTitle, subtopic);
      if (!isCompleted) {
        return false; // Si algún topic no está completado, el nivel no está completado
      }
    }

    return true; // Todos los topics están completados
  }

  /// Retorna el número total de subtemas precargados para el módulo indicado.
  /// Se asume que en la tabla "subtopic" existe una columna "module" para filtrar.
  @override
  Future<int> countAllSubtopicsByModule(String module) async {
    final db = await _localDatabase;
    final result = await db.rawQuery(
      'SELECT COUNT(*) as total FROM programming_content WHERE module = ?',
      [module],
    );
    return result.first['total'] as int;
  }

  @override
  Future<int> getTotalScoreByLevelOfModule(
      {required String module, required int levelId}) async {
    final db = await progressLocalDatabase;

    // Consultar todos los registros del módulo y nivel
    final scores = await db.query(
      'progress',
      where: 'module = ? AND level_id = ?',
      whereArgs: [module, levelId],
    );

    // Sumar los puntajes
    int totalScore = 0;
    for (final score in scores) {
      totalScore += score['score'] as int;
    }

    return totalScore;
  }

  @override
  Future<int> getCompletedSubtopicsByLevel(
      {required String module, required int level}) async {
    final db = await progressLocalDatabase;

    // Contar los subtopics completados en el nivel
    final result = await db.rawQuery('''
      SELECT COUNT(*) as count
      FROM progress
      WHERE module = ? AND level_id = ?
    ''', [module, level]);

    return result.first['count'] as int;
  }

  @override
  Future<int> getTotalSubtopicsByLevel(
      {required String module, required int level}) async {
    final db = await subtopicLocalDatabase;

    // Contar el número total de subtopics en el nivel
    final result = await db.rawQuery('''
    SELECT COUNT(*) as count
    FROM programming_content 
    JOIN topic ON programming_content.topic = topic AND programming_content.module = programming_content.module
    WHERE programming_content.level_id = ? AND programming_content.module = ?
  ''', [level, module]);

    return result.first['count'] as int;
  }

  /// Retorna el puntaje total obtenido por el usuario para el módulo indicado,
  /// sumando los puntajes registrados en la tabla "progress".
  Future<int> getUTotalScoreProgressByModule(String module) async {
    final db = await progressLocalDatabase;
    final result = await db.rawQuery(
      'SELECT SUM(score) as totalScore FROM progress WHERE module = ?',
      [module],
    );
    // Si no hay registros, se devuelve 0
    return result.first['totalScore'] != null
        ? result.first['totalScore'] as int
        : 0;
  }

  /// Calcula el porcentaje de progreso para el módulo.
  /// Se compara el puntaje del usuario con el puntaje máximo posible.
  @override
  Future<double> getCircularProgressPercentageByModule(String module) async {
    final totalSubtopics = await countAllSubtopicsByModule(module);
    final maxScore = totalSubtopics * 2; // Cada subtema vale 2 puntos
    if (maxScore == 0) return 0;
    final userScore = await getUTotalScoreProgressByModule(module);
    return (userScore / maxScore) * 100;
  }

  @override
  Future<int> getUserTotalScoreByLanguage(String language) async {
    final db = await progressLocalDatabase;

    try {
      // Consultar la suma de los puntajes para el módulo
      final result = await db.rawQuery(
        'SELECT SUM(score) as totalScore FROM progress WHERE module = ?',
        [language],
      );

      // Si no hay registros, devolver 0
      return result.first['totalScore'] != null
          ? result.first['totalScore'] as int
          : 0;
    } catch (e) {
      //print('Error al obtener el puntaje acumulado: $e');
      throw Exception(
          'Error al obtener el puntaje acumulado para el módulo $language');
    }
  }

  @override
  Future<int> getUserTotalScoreByModule(String module) async {
    final db = await progressLocalDatabase;

    try {
      // Consultar la suma de los puntajes para el módulo
      final result = await db.rawQuery(
        'SELECT SUM(score) as totalScore FROM progress WHERE module = ?',
        [module],
      );

      // Si no hay registros, devolver 0
      return result.first['totalScore'] != null
          ? result.first['totalScore'] as int
          : 0;
    } catch (e) {
      //print('Error al obtener el puntaje acumulado: $e');
      throw Exception(
          'Error al obtener el puntaje acumulado para el módulo $module');
    }
  }
} */

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

  @override
  Future<int> getTotalSubtopicsByLevel({
    required String language,
    required String module,
    required int level,
  }) async {
    final db = await _dbHelper.getDatabase();
    final result = await db.rawQuery('''
      SELECT COUNT(*) as total 
      FROM programming_content 
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

  @override
  Future<double> getProgressPercentageByModule({
    required String language,
    required String module,
    required int level,
  }) async {
    // Obtener subtemas completados
    final completed = await getCompletedSubtopicsByLevel(
      language: language,
      module: module,
      level: level,
    );

    // Obtener total de subtemas
    final total = await getTotalSubtopicsByLevel(
      language: language,
      module: module,
      level: level,
    );

    if (total == 0) return 0.0;

    return (completed / total) * 100;
  }
}
