abstract class ScoreRepository {
  Future<void> addScore(
      String subtopic, String module, int level, String topic, int amount);

  Future<int> getScore(String subtopic, String module, int level, String topic);

  Future<void> updateScore(
      String subtopic, String module, int level, String topic, int newAmount);

  Future<List<int>> getScoresByModule(String module);
}
