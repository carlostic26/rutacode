import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/level/data/repositories/level_repository_impl.dart';
import 'package:rutacode/features/level/domain/repositories/level_repository.dart';
import 'package:rutacode/features/level/domain/use_cases/count_levels_by_module_use_case.dart';

// Proveedor del repositorio de los casos de uso
final levelRepositoryProvider = Provider<LevelRepository>((ref) {
  return LevelRepositoryImpl();
});

final countLevelsUseCaseProvider = Provider<CountLevelsByModuleUseCase>((ref) {
  final repository = ref.read(levelRepositoryProvider);
  return CountLevelsByModuleUseCase(repository);
});
