import 'package:rutacode/features/progress/domain/repositories/progress_repository.dart';

class IsSubtopicCompletedUseCase {
  final ProgressRepository _progressRepository;

  IsSubtopicCompletedUseCase(this._progressRepository);

  Future<bool> call(String language, String module, int level, String topic,
      String subtopic) async {
    return await _progressRepository.isSubtopicCompleted(
        language, module, level, topic, subtopic);
  }
}
