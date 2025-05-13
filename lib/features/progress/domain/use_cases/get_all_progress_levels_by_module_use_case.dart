import 'package:rutacode/features/progress/data/model/progress_model.dart';
import 'package:rutacode/features/progress/domain/repositories/progress_repository.dart';

class GetAllLevelsProgressByModuleUseCase {
  final ProgressRepository _progressRepository;
  late final String module;
  late final int levelId;

  GetAllLevelsProgressByModuleUseCase(this._progressRepository);

  Future<List<ProgressModel>> call() async {
    return await _progressRepository.getAllLevelProgressByModule(
        module: module, levelId: levelId);
  }
}
