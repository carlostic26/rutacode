import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/progress/domain/repositories/progress_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CompletedLevelsNotifier extends StateNotifier<List<int>> {
  final ProgressRepository _repository;
  final SharedPreferences _sharedPreferences;
  final String _module;

  CompletedLevelsNotifier(
      this._repository, this._sharedPreferences, this._module)
      : super([]) {
    _loadCompletedLevelsByModule(_module);
  }

  // Cargar los niveles completados
  Future<void> _loadCompletedLevelsByModule(String module) async {
    final completedLevels = await _repository.getAllCompletedLevels(module);
    state = completedLevels;
  }

  // Verificar y actualizar si un nivel está completado
  Future<void> checkAndUpdateLevelCompletion(int levelId, String module) async {
    // Verificar si todos los topics del nivel están completados
    final isCompleted = await _repository.isLevelCompleted(module, levelId);

    // Actualizar el estado solo si es necesario
    if (isCompleted && !state.contains(levelId)) {
      state = [...state, levelId]; // Marcar el nivel como completado
      await _sharedPreferences.setInt(
          'lastCompletedLevel', levelId); // Guardar el último nivel completado
    } else if (!isCompleted && state.contains(levelId)) {
      state = state
          .where((id) => id != levelId)
          .toList(); // Remover el nivel si ya no está completado
    }

    debugPrint("Verificando nivel $levelId: ¿Completado? $isCompleted");
  }

  // Obtener el último nivel completado
  int? getLastCompletedLevel() {
    return _sharedPreferences.getInt('lastCompletedLevel');
  }

  // Limpiar el último nivel completado
  Future<void> clearLastCompletedLevel() async {
    await _sharedPreferences.remove('lastCompletedLevel');
  }

  Future<void> clear() async {
    state = []; // Resetea la lista interna
    await _sharedPreferences.remove('lastCompletedLevel');
    await _sharedPreferences.remove('completed_levels');
  }
}
