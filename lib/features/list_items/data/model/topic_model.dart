import 'package:rutacode/features/list_items/domain/entities/topic_entity.dart';

class TopicModel extends Topic {
  TopicModel({
    required super.id,
    required super.title,
    required super.module,
  });

  factory TopicModel.fromMap(Map<String, dynamic> map) {
    return TopicModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      module: map['module'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'module': module,
    };
  }

  TopicModel copyWith({
    String? id,
    String? title,
  }) {
    return TopicModel(
      id: id ?? this.id,
      title: title ?? this.title,
      module: module,
    );
  }
}
