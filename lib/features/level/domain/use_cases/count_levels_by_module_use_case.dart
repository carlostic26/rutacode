import 'package:rutacode/features/level/domain/repositories/level_repository.dart';

class CountLevelsByModuleUseCase {
  late final LevelRepository repository;

  CountLevelsByModuleUseCase(this.repository);

  Future<int> call(String module) async {
    return repository.countLevelsByModule(module);
  }
}
