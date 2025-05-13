import 'package:rutacode/common/score/domain/repository/score_repository.dart';

class ScoreUseCases {
  late final ScoreRepository scoreRepository;

  ScoreUseCases(this.scoreRepository);

  Future<void> add(String subtopic, String module, int level, String topic,
      int amount) async {
    return await scoreRepository.addScore(
        subtopic, module, level, topic, amount);
  }

  Future<int> get(
      String subtopic, String module, int level, String topic) async {
    return await scoreRepository.getScore(subtopic, module, level, topic);
  }

  Future<void> update(String subtopic, String module, int level, String topic,
      int newAmount) async {
    return await scoreRepository.updateScore(
        subtopic, module, level, topic, newAmount);
  }

  Future<List<int>> getByModule(String module) async {
    return await scoreRepository.getScoresByModule(module);
  }
}
