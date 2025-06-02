import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/home/presentation/provider/language_providers.dart';
import 'package:rutacode/features/level/presentation/state/provider/get_level_use_case_provider.dart';
import 'package:rutacode/features/progress/presentation/state/provider/progress_use_cases_provider.dart';

final isLevelCompletedUseCaseProvider = FutureProvider<bool>(
  (ref) async {
    // Variables provider para solicitud de datos
    final language = ref.watch(actualLanguageProvider);
    final module = ref.watch(actualModuleProvider);
    final level = ref.watch(actualLevelProvider);

    final repository = ref.watch(progressUseCasesProvider);
    return await repository.isLevelCompleted(
        language: language, module: module, level: level);
  },
);
