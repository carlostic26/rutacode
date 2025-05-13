import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/progress/domain/repositories/progress_repository.dart';

class ProgressNotifier extends StateNotifier<List<String>> {
  final ProgressRepository _repository;
  final String _module; // Añadir campo para el módulo

  ProgressNotifier(this._repository, this._module) : super([]) {
    _loadCompletedSubtopics();
  }

  Future<void> _loadCompletedSubtopics() async {
    // Pasar el módulo como parámetro
    final completedSubtopics =
        await _repository.getAllCompletedSubtopics(_module);
    state = completedSubtopics;
  }

  void setCompletedSubtopicProvider(String subtopicId) {
    if (!state.contains(subtopicId)) {
      state = [...state, subtopicId];
    }
  }
}
