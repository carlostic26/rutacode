/* import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/progress/domain/repositories/progress_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rutacode/features/progress/presentation/state/provider/progress_use_cases_provider.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('SharedPreferencesProvider should be overridden');
});

final completedLevelsProvider =
    StateNotifierProvider<CompletedLevelsNotifier, Map<String, List<int>>>(
        (ref) {
  final progressRepository = ref.read(progressRepositoryProvider);
  final sharedPreferences = ref.read(sharedPreferencesProvider);
  return CompletedLevelsNotifier(progressRepository, sharedPreferences);
});

class CompletedLevelsNotifier extends StateNotifier<Map<String, List<int>>> {
  final ProgressRepository _repository;
  final SharedPreferences _prefs;

  CompletedLevelsNotifier(this._repository, this._prefs) : super({}) {
    // Cargar todos los módulos al inicializar
    _loadAllModules();
  }

  Future<void> _loadAllModules() async {
    // Lista de todos los módulos disponibles
    const modules = ['Jr', 'Mid', 'Sr'];

    // Cargar los niveles completados para cada módulo
    final Map<String, List<int>> loadedLevels = {};

    for (final module in modules) {
      final completed = await _repository.getAllCompletedLevels(module);
      loadedLevels[module] = completed;
    }

    state = loadedLevels;
  }

  Future<void> checkAndUpdateLevelCompletionByModule(
    String language,
    String module,
    int levelId,
    String topic,
    String subtopic,
  ) async {
    final current = state[module] ?? [];
    final isCompleted = await _repository.isLevelCompleted(
        language, module, levelId, topic, subtopic);

    if (isCompleted && !current.contains(levelId)) {
      final updated = [...current, levelId];
      await _repository.saveCompletedLevels(module, updated);
      state = {...state, module: updated};
    } else if (!isCompleted && current.contains(levelId)) {
      final updated = current.where((id) => id != levelId).toList();
      await _repository.saveCompletedLevels(module, updated);
      state = {...state, module: updated};
    }
  }

  Future<void> loadModuleLevels(String module) async {
    final completed = await _repository.getAllCompletedLevels(module);
    state = {...state, module: completed};
  }

  Future<void> addCompletedLevel(String module, int levelOrder) async {
    final current = state[module] ?? [];
    if (!current.contains(levelOrder)) {
      final updated = [...current, levelOrder];
      await _repository.saveCompletedLevels(module, updated);
      state = {...state, module: updated};
    }
  }

  List<int> getCompletedLevelsForModule(String module) {
    return state[module] ?? [];
  }

  Future<void> clear() async {
    await _repository.saveCompletedLevels('', []);
    state = {};
  }

  int? getLastCompletedLevelByModule(String module) {
    final completedLevels = state[module];
    if (completedLevels == null || completedLevels.isEmpty) {
      return null;
    }
    return completedLevels.reduce((a, b) => a > b ? a : b);
  }
}
 */