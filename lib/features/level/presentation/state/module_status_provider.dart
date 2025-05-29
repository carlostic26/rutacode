/* import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/detail/data/models/detail_model.dart';
import 'package:rutacode/features/languages/presentation/provider/language_providers.dart';
import 'package:rutacode/features/level/presentation/state/completed_levels_shp_provider.dart';
import 'package:rutacode/features/level/presentation/state/provider/get_level_use_case_provider.dart';

final cachedLevelsProvider =
    FutureProvider.family<List<DetailContentModel>, String>(
        (ref, module) async {
  final getLevelUseCase = ref.read(getLevelUseCaseProvider);
  final actualLanguage = ref.watch(actualLanguageProvider);
  return getLevelUseCase.call(actualLanguage, module);
});

// Actualizamos los providers de estado del módulo para usar el caché
final jrModuleStatusProvider = FutureProvider<bool>((ref) async {
  final completedLevels = ref.watch(completedLevelsProvider);
  final jrLevelsAsync = ref.watch(cachedLevelsProvider('Jr'));

  return jrLevelsAsync.when(
    loading: () => false,
    error: (_, __) => false,
    data: (levels) {
      final levelNumbers = levels.map((level) => level.level).toList();
      final jrCompletedLevels = completedLevels['Jr'] ??
          []; // Obtener los niveles completos específicos para Jr
      return levelNumbers.every((level) => jrCompletedLevels.contains(level));
    },
  );
});

final middleModuleStatusProvider = FutureProvider<bool>((ref) async {
  final completedLevels = ref.watch(completedLevelsProvider);
  final midLevelsAsync = ref.watch(cachedLevelsProvider('Mid'));

  return midLevelsAsync.when(
    loading: () => false,
    error: (_, __) => false,
    data: (levels) {
      final levelNumbers = levels.map((level) => level.level).toList();
      final midCompletedLevels = completedLevels['Mid'] ??
          []; // Obtener los niveles completos específicos para Mid
      return levelNumbers.every((level) => midCompletedLevels.contains(level));
    },
  );
});
 */