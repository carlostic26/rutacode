import 'package:rutacode/features/progress/data/model/progress_model.dart';
import 'package:rutacode/features/progress/domain/repositories/progress_repository.dart';

class ProgressUseCases {
  final ProgressRepository _repository;

  ProgressUseCases(this._repository);

  // ========== Operaciones básicas de progreso ==========

  Future<void> setScoreBySubtopic({
    required String language,
    required String module,
    required int levelId,
    required String topic,
    required String subtopic,
    required int score,
  }) async {
    return _repository.setScoreBySubtopic(
      language: language,
      module: module,
      levelId: levelId,
      topic: topic,
      subtopic: subtopic,
      score: score,
    );
  }

  // ========== Consultas de puntuación ==========
  Future<int> countTotalScoreByLanguage({
    required String language,
  }) async {
    return _repository.countTotalScoreByLanguage(language);
  }

  Future<int> countTotalScoreByModule({
    required String language,
    required String module,
  }) async {
    return _repository.countTotalScoreByModule(language, module);
  }

  Future<int> countTotalScoreByLevel({
    required String language,
    required String module,
    required int levelId,
  }) async {
    return _repository.countTotalScoreByLevel(
      language: language,
      module: module,
      levelId: levelId,
    );
  }

  // ========== Consultas de progreso ==========
  Future<List<ProgressModel>> getProgressByLanguage({
    required String language,
  }) async {
    return _repository.getProgressByLanguage(language);
  }

  Future<List<ProgressModel>> getProgressByModule({
    required String language,
    required String module,
  }) async {
    return _repository.getProgressByModule(language, module);
  }

  Future<List<ProgressModel>> getProgressByLevel({
    required String language,
    required String module,
    required int levelId,
  }) async {
    return _repository.getProgressByLevel(
      language: language,
      module: module,
      levelId: levelId,
    );
  }

  Future<List<ProgressModel>> getProgressByTopic({
    required String language,
    required String module,
    required int levelId,
    required String topic,
  }) async {
    return _repository.getProgressByTopic(
      language: language,
      module: module,
      levelId: levelId,
      topic: topic,
    );
  }

  // ========== Métricas de progreso ==========

  Future<int> countSubtopicsCompletedByModule({
    required String language,
    required String module,
  }) async {
    return _repository.countSubtopicsCompletedByModule(
        language: language, module: module);
  }

  Future<int> countSubtopicsCompletedByLevel({
    required String language,
    required String module,
    required int level,
  }) async {
    return _repository.countSubtopicsCompletedByLevel(
      language: language,
      module: module,
      level: level,
    );
  }

  Future<int> countLevelsCompletedByModule({
    required String language,
    required String module,
  }) async {
    return _repository.countLevelsCompletedByModule(
      language: language,
      module: module,
    );
  }

// Metrica de porcentaje de progreso por módulo

  Future<double> getProgressPercentageByModule({
    required String language,
    required String module,
  }) async {
    return _repository.getProgressPercentageByModule(
      language: language,
      module: module,
    );
  }

// ========== Consultas de estado de completado ==========

  Future<bool> isSubtopicCompleted({
    required String language,
    required String module,
    required int level,
    required String topic,
    required String subtopic,
  }) async {
    return _repository.isSubtopicCompleted(
      language,
      module,
      level,
      topic,
      subtopic,
    );
  }

  Future<bool> isTopicCompleted({
    required String language,
    required String module,
    required int level,
    required String topic,
  }) async {
    return _repository.isTopicCompleted(
      language,
      module,
      level,
      topic,
    );
  }

  Future<bool> isLevelCompleted({
    required String language,
    required String module,
    required int level,
  }) async {
    return _repository.isLevelCompleted(
      language,
      module,
      level,
    );
  }

  // ========== Eliminación de progreso ==========
  Future<void> deleteAllUserProgress() async {
    return _repository.deleteAllUserProgress();
  }

  // ========== Consultas de cuentas en programming content ==========
  Future<int> countTotalLevelsByModuleInProgrammingContent({
    required String language,
    required String module,
  }) async {
    return _repository.countTotalLevelsByModuleInProgrammingContent(
      language,
      module,
    );
  }

  Future<int> countTotalSubtopicsByModuleInProgrammingContent(
      String language, String module) async {
    return _repository.countTotalSubtopicsByModuleInProgrammingContent(
      language,
      module,
    );
  }
}
