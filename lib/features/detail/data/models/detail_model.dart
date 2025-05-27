import 'package:rutacode/features/detail/domain/entities/detail_entity.dart';

class DetailContentModel extends DetailContentEntity {
  DetailContentModel({
    required super.id,
    required super.language,
    required super.module,
    required super.level,
    required super.titleLevel,
    required super.topic,
    required super.subtopic,
    required super.definition,
    required super.codeExample,
  });

  factory DetailContentModel.fromMap(Map<String, dynamic> map) {
    return DetailContentModel(
      id: map['id'],
      language: map['language'],
      module: map['module'],
      level: map['level'],
      titleLevel: map['tittle_level'],
      topic: map['topic'],
      subtopic: map['subtopic'],
      definition: map['definition'],
      codeExample: map['code_example'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'language': language,
      'module': module,
      'level': level,
      'tittle_level': titleLevel,
      'topic': topic,
      'subtopic': subtopic,
      'definition': definition,
      'code_example': codeExample,
    };
  }

  DetailContentModel copyWith({
    int? id,
    String? language,
    String? module,
    int? level,
    String? titleLevel,
    String? topic,
    String? subtopic,
    String? definition,
    String? codeExample,
  }) {
    return DetailContentModel(
      id: id ?? this.id,
      language: language ?? this.language,
      module: module ?? this.module,
      level: level ?? this.level,
      titleLevel: titleLevel ?? this.titleLevel,
      topic: topic ?? this.topic,
      subtopic: subtopic ?? this.subtopic,
      definition: definition ?? this.definition,
      codeExample: codeExample ?? this.codeExample,
    );
  }
}
