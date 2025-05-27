import 'package:rutacode/features/detail/data/models/detail_model.dart';
import 'package:rutacode/features/level/domain/repositories/level_repository.dart';

class GetLevelUseCase {
  late final LevelRepository repository;

  GetLevelUseCase(this.repository);

  Future<List<DetailContentModel>> call(String language, String module) async {
    return repository.getLevelByModule(language, module);
  }
}
