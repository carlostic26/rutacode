import 'package:rutacode/features/home/domain/entity/leanguage_img_entity.dart';

class LanguageModel extends LanguageEntity {
  LanguageModel({required super.language, required super.urlImage});

  factory LanguageModel.fromMap(Map<String, dynamic> map) {
    return LanguageModel(
      language: map['language'] as String,
      urlImage: map['url_img'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'language': language,
      'url_img': urlImage,
    };
  }

  LanguageModel copyWith({
    String? name,
    String? imageUrl,
  }) {
    return LanguageModel(
      language: language ?? language!,
      urlImage: urlImage ?? urlImage!,
    );
  }
}
