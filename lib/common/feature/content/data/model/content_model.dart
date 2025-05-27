import 'package:rutacode/common/feature/content/domain/entities/content_entity.dart';

class ContentModel extends ContentEntity {
  ContentModel({
    required super.language,
    required super.module,
    required super.level,
    required super.titleLevel,
    required super.topic,
    required super.subtopic,
    required super.definition,
    required super.codeExample,
  });

  factory ContentModel.fromMap(Map<String, dynamic> map) {
    return ContentModel(
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

  ContentModel copyWith({
    String? language,
    String? module,
    int? level,
    int? titleLevel,
    String? topic,
    String? subtopic,
    String? definition,
    String? codeExample,
  }) {
    return ContentModel(
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
