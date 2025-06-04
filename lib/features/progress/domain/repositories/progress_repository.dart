import 'package:rutacode/features/progress/data/model/progress_model.dart';

abstract class ProgressRepository {
  // Operaciones básicas de progreso
  Future<void> setScoreBySubtopic({
    required String language,
    required String module,
    required int levelId,
    required String topic,
    required String subtopic,
    required int score,
  });

  // Consultas de puntuación
  Future<int> countTotalScoreByLanguage(String language);
  Future<int> countTotalScoreByModule(String language, String module);
  Future<int> countTotalScoreByLevel({
    required String language,
    required String module,
    required int levelId,
  });

  // Consultas de progreso

  Future<double> getLevelProgressPercentage({
    required String language,
    required String module,
    required int level,
  });

  Future<List<ProgressModel>> getProgressByLanguage(String language);

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
  Future<int> countSubtopicsCompletedByModule({
    required String language,
    required String module,
  });

  Future<int> countSubtopicsCompletedByLevel({
    required String language,
    required String module,
    required int level,
  });

  Future<int> countLevelsCompletedByModule({
    required String language,
    required String module,
  });

  // Metrica de porcentaje de progreso por módulo
  Future<double> getProgressPercentageByModule({
    required String language,
    required String module,
  });

  // Consultas de estado de completado
  Future<bool> isSubtopicCompleted(
      String language, String module, int level, String topic, String subtopic);

  Future<bool> isTopicCompleted(
      String language, String module, int level, String topic);

  Future<bool> isLevelCompleted(String language, String module, int level);

  //Eliminación de progreso
  Future<void> deleteAllUserProgress();

  // ========== Consultas de cuentas en programming content ==========
  Future<int> countTotalLevelsByModuleInProgrammingContent(
      String language, String module);

  Future<int> countTotalSubtopicsByModuleInProgrammingContent(
      String language, String module);
}
