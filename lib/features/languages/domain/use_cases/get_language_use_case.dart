import 'package:rutacode/features/languages/data/model/leanguage_img_model.dart';
import 'package:rutacode/features/languages/domain/repositories/leanguage_repository.dart';

class GetLanguageUseCase {
  late final LanguageRepository _languageRepository;

  GetLanguageUseCase(this._languageRepository);

  Future<List<LanguageModel>> call() async {
    return await _languageRepository.getlanguages();
  }
}
