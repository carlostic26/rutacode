import 'package:rutacode/common/domain/entities/content_entity.dart';

class ContentModel extends ContentEntity {
  ContentModel({
    required super.language,
    required super.module,
    required super.level,
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
    String? topic,
    String? subtopic,
    String? definition,
    String? codeExample,
  }) {
    return ContentModel(
      language: language ?? this.language,
      module: module ?? this.module,
      level: level ?? this.level,
      topic: topic ?? this.topic,
      subtopic: subtopic ?? this.subtopic,
      definition: definition ?? this.definition,
      codeExample: codeExample ?? this.codeExample,
    );
  }
}
