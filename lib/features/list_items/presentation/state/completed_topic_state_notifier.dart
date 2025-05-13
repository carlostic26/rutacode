import 'package:flutter_riverpod/flutter_riverpod.dart';

//Este provider notifica al steper cualquier cambio que haya respecto al registro de un topic con subtopic completos. Mostrará cambios en tiempo real en pantalla, para evitar el problema de tener que volver a estrar a topic screen para ver el steper completado
final completedTopicProvider =
    StateNotifierProvider<CompletedTopicNotifier, List<String>>((ref) {
  return CompletedTopicNotifier();
});

class CompletedTopicNotifier extends StateNotifier<List<String>> {
  CompletedTopicNotifier() : super([]);

  void markTopicAsCompleted(String topicId) {
    if (!state.contains(topicId)) {
      state = [...state, topicId];
    }
  }

  bool isTopicCompleted(String topicId) {
    return state.contains(topicId);
  }
}
