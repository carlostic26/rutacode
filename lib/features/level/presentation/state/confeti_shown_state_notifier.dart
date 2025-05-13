import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfettiShownNotifier extends StateNotifier<List<int>> {
  ConfettiShownNotifier() : super([]);

  // Método para agregar un nivel a la lista de niveles que ya mostraron confeti
  void markLevelAsShown(int levelOrder) {
    if (!state.contains(levelOrder)) {
      state = [...state, levelOrder];
    }
  }

  // Método para verificar si un nivel ya mostró confeti
  bool hasShownConfetti(int levelOrder) {
    return state.contains(levelOrder);
  }
}

// Provider para el StateNotifier
final confettiShownProvider =
    StateNotifierProvider<ConfettiShownNotifier, List<int>>(
  (ref) => ConfettiShownNotifier(),
);
