import 'package:rutacode/features/detail/domain/entities/detail_entity.dart';

class DetailModel extends Detail {
  DetailModel({
    required super.id,
    required super.definition,
    required super.codeExample,
    required super.imgUrl,
  });

  factory DetailModel.fromMap(Map<String, dynamic> map) {
    return DetailModel(
      id: map['id'],
      definition: map['definition'],
      codeExample: map['code_example'],
      imgUrl: map['img_url'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'definition': definition,
      'code_example': codeExample,
      'img_url': imgUrl,
    };
  }

  DetailModel copyWith({
    int? id,
    String? definition,
    String? codeExample,
    String? imgUrl,
  }) {
    return DetailModel(
      id: id ?? this.id,
      definition: definition ?? this.definition,
      codeExample: codeExample ?? this.codeExample,
      imgUrl: imgUrl ?? this.imgUrl,
    );
  }
}
