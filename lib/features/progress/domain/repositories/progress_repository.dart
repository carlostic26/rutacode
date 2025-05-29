import 'package:rutacode/features/progress/data/model/progress_model.dart';

/* abstract class ProgressRepository {
  Future<void> createProgressBySubtopic({
    required String language,
    required String module,
    required int levelId,
    required String topic,
    required String subtopic,
    required int score,
  });

  Future<int> getUserTotalScoreByLanguage(String language);

  Future<int> getUserTotalScoreByModule(String module);

  Future<List<ProgressModel>> getAllProgressByLanguage(String language);

  Future<List<ProgressModel>> getAllModuleProgress(String module);

  Future<List<ProgressModel>> getAllLevelProgressByModule({
    required String module,
    required int levelId,
  });

  Future<List<ProgressModel>> getAllTopicProgressByModule({
    required String module,
    required int levelId,
    required String topicId,
  });

  Future<void> saveCompletedLevels(String module, List<int> completedLevels);

  Future<bool> isSubtopicCompleted(
      String language, String module, int level, String topic, String subtopic);
  Future<bool> isTopicCompleted(String language, String module, int level,
      String topic, String subtopicTitle);

  Future<List<int>> getAllCompletedLevels(String module);

  Future<List<int>> getScoresByModule(String module);

  Future<int> getTotalScoreByLevelOfModule({
    required String module,
    required int levelId,
  });

  Future<int> getTotalSubtopicsByLevel({
    required String module,
    required int level,
  });

  Future<int> countAllSubtopicsByModule(String module);
  Future<int> getCompletedSubtopicsByLevel({
    required String module,
    required int level,
  });

  Future<List<String>> getAllCompletedTopics(String module);
  Future<List<String>> getAllCompletedSubtopics(String module);
  Future<bool> isLevelCompleted(
      String language, String module, int level, String topicTitle, subtopic);

  Future<double> getCircularProgressPercentageByModule(String module);
}
  */

abstract class ProgressRepository {
  // Operaciones básicas de progreso
  Future<void> saveScoreProgressBySubtopic({
    required String language,
    required String module,
    required int levelId,
    required String topic,
    required String subtopic,
    required int score,
  });

  // Consultas de estado de completado
  Future<bool> isSubtopicCompleted(
      String language, String module, int level, String topic, String subtopic);

  Future<bool> isTopicCompleted(
      String language, String module, int level, String topic);

  Future<bool> isLevelCompleted(String language, String module, int level);

  // Consultas de puntuación
  Future<int> getUserTotalScoreByLanguage(String language);
  Future<int> getUserTotalScoreByModule(String language, String module);
  Future<int> getTotalScoreByLevel({
    required String language,
    required String module,
    required int levelId,
  });

  // Consultas de progreso
  Future<List<ProgressModel>> getAllProgressByLanguage(String language);
  Future<List<ProgressModel>> getProgressByModule(
      String language, String module);
  Future<List<ProgressModel>> getProgressByLevel({
    required String language,
    required String module,
    required int levelId,
  });

  Future<List<ProgressModel>> getProgressByTopic({
    required String language,
    required String module,
    required int levelId,
    required String topic,
  });

  // Métricas de progreso
  Future<int> getTotalSubtopicsByLevel({
    required String language,
    required String module,
    required int level,
  });

  Future<int> getCompletedSubtopicsByLevel({
    required String language,
    required String module,
    required int level,
  });

  Future<double> getProgressPercentageByModule({
    required String language,
    required String module,
    required int level,
  });
}
