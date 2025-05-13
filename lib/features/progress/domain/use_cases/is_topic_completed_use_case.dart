import 'package:rutacode/features/progress/domain/repositories/progress_repository.dart';

class IsTopicCompletedUseCase {
  final ProgressRepository _progressRepository;

  IsTopicCompletedUseCase(this._progressRepository);

  Future<bool> call(String module, int levelId, String topicId) async {
    return await _progressRepository.isTopicCompleted(module, levelId, topicId);
  }
}
