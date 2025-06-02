import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/progress/data/datasources/progress_local_database.dart';
import 'package:rutacode/features/progress/data/repository/progress_repository_impl.dart';
import 'package:rutacode/features/progress/domain/repositories/progress_repository.dart';
import 'package:rutacode/features/list_items/presentation/state/provider/get_subtopic_use_case_provider.dart';
import 'package:rutacode/features/list_items/presentation/state/provider/get_topic_use_case_provider.dart';
import 'package:rutacode/features/progress/domain/use_cases/progress_use_cases.dart';

final progressUseCasesProvider = Provider<ProgressUseCases>((ref) {
  final repository = ref.read(progressRepositoryProvider);
  return ProgressUseCases(repository);
});

/* ASI SE USA LO DE ARRIBA

final useCases = ref.read(progressUseCasesProvider);
await useCases.createProgressBySubtopic(...);
final completed = await useCases.isTopicCompleted(...);

*/

/// Proveedor del repositorio de progreso que centraliza el acceso a datos
final progressRepositoryProvider = Provider<ProgressRepository>((ref) {
  final subtopicRepository = ref.read(subtopicRepositoryProvider);
  final topicRepository = ref.read(topicRepositoryProvider);
  final ProgressLocalContentDatabaseHelper dbHelper =
      ProgressLocalContentDatabaseHelper(); // Make sure this provider exists
  return ProgressRepositoryImpl(
    dbHelper: dbHelper,
    subtopicRepository: subtopicRepository,
    topicRepository: topicRepository,
  );
});

/* 
/* ************************************************************************
 *           STATENOTIFIERS Y PROVEEDORES PARA MÓDULOS                   *
 ************************************************************************ */

/// StateNotifier para manejar los topics completados por módulo
class CompletedTopicsNotifier extends StateNotifier<List<String>> {
  final ProgressRepository _repository;
  final String _module;

  CompletedTopicsNotifier(this._repository, this._module) : super([]) {
    _loadCompletedTopics();
  }

  Future<void> _loadCompletedTopics() async {
    final completedTopics = await _repository.getAllCompletedTopics(_module);
    state = completedTopics;
  }

  Future<void> checkAndUpdateTopicCompletion(
    String language,
    String module,
    int level,
    String topic,
    String subtopic,
  ) async {
    final isCompleted = await _repository.isTopicCompleted(
        language, module, level, topic, subtopic);
    if (isCompleted && !state.contains(topic)) {
      state = [...state, topic];
    } else if (!isCompleted && state.contains(topic)) {
      state = state.where((id) => id != topic).toList();
    }
  }

  Future<void> reset() async {
    state = []; // Limpia la lista de topics completados
    await _loadCompletedTopics(); // Vuelve a cargar desde la base de datos
  }
}

/// StateNotifier para manejar los subtopics completados por módulo
class CompletedSubtopicsNotifier extends StateNotifier<List<String>> {
  final ProgressRepository _repository;
  final String _module;

  CompletedSubtopicsNotifier(this._repository, this._module) : super([]) {
    _loadCompletedSubtopics();
  }

  Future<void> _loadCompletedSubtopics() async {
    final completedSubtopics =
        await _repository.getAllCompletedSubtopics(_module);
    state = completedSubtopics;
  }

  void markSubtopicAsCompleted(String subtopicId) {
    if (!state.contains(subtopicId)) {
      state = [...state, subtopicId];
    }
  }

  Future<void> reset() async {
    state = []; // Limpia la lista de subtopics completados
    await _loadCompletedSubtopics(); // Vuelve a cargar desde la base de datos
  }
}

/* ************************************************************************
 *              PROVEEDORES BASE (FAMILY) POR MÓDULO                     *
 ************************************************************************ */

final completedTopicsProvider =
    StateNotifierProvider.family<CompletedTopicsNotifier, List<String>, String>(
        (ref, module) {
  final repository = ref.read(progressRepositoryProvider);
  return CompletedTopicsNotifier(repository, module);
});

final completedSubtopicsProvider = StateNotifierProvider.family<
    CompletedSubtopicsNotifier, List<String>, String>((ref, module) {
  final repository = ref.read(progressRepositoryProvider);
  return CompletedSubtopicsNotifier(repository, module);
});

/* ************************************************************************
 *              PROVEEDORES ESPECÍFICOS POR MÓDULO                       *
 ************************************************************************ */

// ------------------------- PARA TOPICS ---------------------------------

final jrCompletedTopicsProvider =
    Provider<List<String>>((ref) => ref.watch(completedTopicsProvider('Jr')));

final midCompletedTopicsProvider =
    Provider<List<String>>((ref) => ref.watch(completedTopicsProvider('Mid')));

final srCompletedTopicsProvider =
    Provider<List<String>>((ref) => ref.watch(completedTopicsProvider('Sr')));

// ----------------------- PARA SUBTOPICS -------------------------------

final jrCompletedSubtopicsProvider = Provider<List<String>>(
    (ref) => ref.watch(completedSubtopicsProvider('Jr')));

final midCompletedSubtopicsProvider = Provider<List<String>>(
    (ref) => ref.watch(completedSubtopicsProvider('Mid')));

final srCompletedSubtopicsProvider = Provider<List<String>>(
    (ref) => ref.watch(completedSubtopicsProvider('Sr')));
 */