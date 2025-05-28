import 'package:rutacode/features/progress/domain/repositories/progress_repository.dart';

class CreateProgressBySubtopicUseCase {
  final ProgressRepository _progressRepository;
  late final String module;
  late final int levelId;
  late final String topicId;
  late final int score;

  CreateProgressBySubtopicUseCase(this._progressRepository);

  Future<void> call(String language, String module, int levelId, String topicId,
      String subtopicId, int score) async {
    await _progressRepository.createProgressBySubtopic(
        language: language,
        module: module,
        levelId: levelId,
        topic: topicId,
        subtopic: subtopicId,
        score: score);
  }
}
