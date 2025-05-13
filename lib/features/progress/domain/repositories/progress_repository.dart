import 'package:rutacode/features/progress/data/model/progress_model.dart';

abstract class ProgressRepository {
  Future<void> createProgressBySubtopic({
    required String module,
    required int levelId,
    required String topicId,
    required String subtopicId,
    required int score,
  });

  Future<int> getUserTotalScoreByModule(String module);

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

  Future<bool> isSubtopicCompleted(String module, String subtopicId);
  Future<bool> isTopicCompleted(String module, int levelId, String topicId);

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
  Future<bool> isLevelCompleted(String module, int levelId);

  Future<double> getCircularProgressPercentageByModule(String module);
}
