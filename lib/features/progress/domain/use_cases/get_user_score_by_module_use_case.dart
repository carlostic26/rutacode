import 'package:rutacode/features/progress/domain/repositories/progress_repository.dart';

class GetUserTotalScoreByModuleUseCase {
  final ProgressRepository _progressRepository;

  GetUserTotalScoreByModuleUseCase(this._progressRepository);

  Future<int> call(String module) async {
    return await _progressRepository.getUserTotalScoreByModule(module);
  }
}
