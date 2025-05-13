import 'package:rutacode/features/progress/domain/repositories/progress_repository.dart';

class GetCircularProgressPercentageByModuleUseCase {
  final ProgressRepository _progressRepository;

  GetCircularProgressPercentageByModuleUseCase(this._progressRepository);

  Future<double> call(String module) async {
    return await _progressRepository
        .getCircularProgressPercentageByModule(module);
  }
}
