import 'package:rutacode/features/progress/domain/repositories/progress_repository.dart';

class CreateProgressBySubtopicUseCase {
  final ProgressRepository _progressRepository;
  late final String module;
  late final int levelId;
  late final String topicId;
  late final int score;

  CreateProgressBySubtopicUseCase(this._progressRepository);

  Future<void> call(String module, int levelId, String topicId,
      String subtopicId, int score) async {
    await _progressRepository.createProgressBySubtopic(
        module: module,
        levelId: levelId,
        topicId: topicId,
        subtopicId: subtopicId,
        score: score);
  }
}
