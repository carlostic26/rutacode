import 'package:rutacode/features/progress/domain/repositories/progress_repository.dart';

class GetTotalScoreByLevel {
  final ProgressRepository _progressRepository;

  GetTotalScoreByLevel(this._progressRepository);

  Future<int> call(String module, int level) async {
    return await _progressRepository.getTotalScoreByLevelOfModule(
        module: module, levelId: level);
  }
}
