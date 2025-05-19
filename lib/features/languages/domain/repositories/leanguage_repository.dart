import 'package:rutacode/features/languages/data/model/leanguage_img_model.dart';

abstract class LanguageRepository {
  Future<List<LanguageModel>> getlanguages();
}
