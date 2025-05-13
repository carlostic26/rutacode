// Proveedor del repositorio que vamos a usar en los casos de uso
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/detail/data/repositories/detail_repository_impl.dart';
import 'package:rutacode/features/detail/domain/repositories/detail_repository.dart';
import 'package:rutacode/features/detail/domain/use_cases/get_detail_use_case.dart';

final detailRepositoryProvider = Provider<DetailRepository>((ref) {
  return DetailRepositoryImpl();
});

// Proveedor del titulo de Detail seleccionado
final titleDetailProvider = StateProvider<String>((ref) => '');
final detailIdProvider = StateProvider<String>((ref) => '');
final detailTitleProvider = StateProvider<String>((ref) => '');

// Proveedor del caso de uso (Inyección de dependencias)
final getDetailUseCaseProvider = Provider<GetDetailUseCase>((ref) {
  final repository = ref.read(detailRepositoryProvider);
  return GetDetailUseCase(repository);
});
