import 'package:rutacode/features/progress/domain/repositories/progress_repository.dart';

class GetScoresByModule {
  final ProgressRepository _progressRepository;

  GetScoresByModule(this._progressRepository);

  Future<List<int>> call(String module) async {
    return await _progressRepository.getScoresByModule(module);
  }
}
