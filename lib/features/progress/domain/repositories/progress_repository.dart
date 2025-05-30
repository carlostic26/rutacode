import 'package:rutacode/features/progress/data/model/progress_model.dart';

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

  // Consultas de cuentas
  Future<int> countLevelsByModule(String language, String module);
  Future<int> countAllSubtopicsByModule(String language, String module);

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
  });

  //Eliminación de progreso
  Future<void> deleteAllUserProgress();
}
