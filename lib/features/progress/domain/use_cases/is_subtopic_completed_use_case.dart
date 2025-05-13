import 'package:rutacode/features/progress/domain/repositories/progress_repository.dart';

class IsSubtopicCompletedUseCase {
  final ProgressRepository _progressRepository;

  IsSubtopicCompletedUseCase(this._progressRepository);

  Future<bool> call(String module, String subtopicId) async {
    return await _progressRepository.isSubtopicCompleted(module, subtopicId);
  }
}
