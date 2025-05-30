import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutacode/features/home/data/model/leanguage_img_model.dart';
import 'package:rutacode/features/home/data/repository/leanguage_repository_impl.dart';
import 'package:rutacode/features/home/domain/repositories/leanguage_repository.dart';
import 'package:rutacode/features/home/domain/use_cases/get_language_use_case.dart';

final languageRepositoryProvider = Provider<LanguageRepository>((ref) {
  return LanguageRepositoryImpl();
});

// Proveedor del módulo seleccionado
final actualLanguageProvider = StateProvider<String>((ref) => 'none');

final getLanguagesProvider = Provider<GetLanguageUseCase>((ref) {
  final repository = ref.watch(languageRepositoryProvider);
  return GetLanguageUseCase(repository);
});

final languagesListProvider = FutureProvider<List<LanguageModel>>((ref) async {
  final getLeanguages = ref.watch(getLanguagesProvider);
  return await getLeanguages();
});
