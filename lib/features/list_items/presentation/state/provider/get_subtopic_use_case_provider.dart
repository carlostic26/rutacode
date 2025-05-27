import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/list_items/data/repositories/subtopic_repository_impl.dart';
import 'package:rutacode/features/list_items/domain/repositories/subtopic_repository.dart';
import 'package:rutacode/features/list_items/domain/use_cases/get_subtopic_use_case.dart';

// Proveedor del repositorio que vamos a usar en los casos de uso
final subtopicRepositoryProvider = Provider<SubtopicRepository>((ref) {
  return SubtopicRepositoryImpl();
});

// Proveedor del titulo de subtopic seleccionado
final subtopicTitleProvider = StateProvider<String>((ref) => '');

// Proveedor del caso de uso (Inyección de dependencias)
final getSubtopicUseCaseProvider = Provider<GetSubtopicUseCase>((ref) {
  final repository = ref.read(subtopicRepositoryProvider);
  return GetSubtopicUseCase(repository);
});
