import 'package:rutacode/features/progress/data/model/progress_model.dart';
import 'package:rutacode/features/progress/domain/repositories/progress_repository.dart';

class ProgressUseCases {
  final ProgressRepository _repository;

  ProgressUseCases(this._repository);

  Future<void> saveScoreProgressBySubtopic({
    required String language,
    required String module,
    required int levelId,
    required String topic,
    required String subtopic,
    required int score,
  }) async {
    await _repository.saveScoreProgressBySubtopic(
      language: language,
      module: module,
      levelId: levelId,
      topic: topic,
      subtopic: subtopic,
      score: score,
    );
  }

  Future<List<ProgressModel>> getAllProgressLevelsByModule({
    required String language,
    required String module,
  }) async {
    return _repository.getProgressByModule(language, module);
  }

  Future<List<ProgressModel>> getAllProgressModules(String language) async {
    return _repository.getAllProgressByLanguage(language);
  }

  Future<List<ProgressModel>> getAllProgressTopicsByModule({
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

  Future<double> getCircularProgressPercentageByModule({
    required String language,
    required String module,
  }) async {
    return _repository.getProgressPercentageByModule(
      language: language,
      module: module,
    );
  }

  Future<List<ProgressModel>> getLevelProgress({
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

  Future<int> countLevelsByModule({
    required String language,
    required String module,
  }) async {
    return _repository.countLevelsByModule(language, module);
  }

  Future<int> getScoresProgressByModule({
    required String language,
    required String module,
  }) async {
    return _repository.getUserTotalScoreByModule(language, module);
  }

  Future<int> getTotalScoreByLevel({
    required String language,
    required String module,
    required int levelId,
  }) async {
    return _repository.getTotalScoreByLevel(
      language: language,
      module: module,
      levelId: levelId,
    );
  }

  Future<int> getUserScoreByModule({
    required String language,
    required String module,
  }) async {
    return _repository.getUserTotalScoreByModule(language, module);
  }

  Future<bool> isSubtopicCompleted({
    required String language,
    required String module,
    required int level,
    required String topic,
    required String subtopic,
  }) async {
    return _repository.isSubtopicCompleted(
        language, module, level, topic, subtopic);
  }

  Future<bool> isTopicCompleted({
    required String language,
    required String module,
    required int level,
    required String topic,
  }) async {
    return _repository.isTopicCompleted(language, module, level, topic);
  }

  Future<bool> isLevelCompleted({
    required String language,
    required String module,
    required int level,
  }) async {
    return _repository.isLevelCompleted(language, module, level);
  }

  Future<void> deleteAllUserProgress() async {
    await _repository.deleteAllUserProgress();
  }
}
