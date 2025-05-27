import 'package:rutacode/features/progress/domain/repositories/progress_repository.dart';

class IsTopicCompletedUseCase {
  final ProgressRepository _progressRepository;

  IsTopicCompletedUseCase(this._progressRepository);

  Future<bool> call(String language, String module, int levelId, String topic,
      String subtopic) async {
    return await _progressRepository.isTopicCompleted(
        language, module, levelId, topic, subtopic);
  }
}
