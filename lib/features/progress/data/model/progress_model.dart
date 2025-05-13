import 'package:rutacode/features/progress/domain/entities/progress_entity.dart';

class ProgressModel extends ProgressEntity {
  ProgressModel(
      {required super.id,
      required super.module,
      required super.levelId,
      required super.topicId,
      required super.subtopicId,
      required super.score});

  factory ProgressModel.fromMap(Map<String, dynamic> map) {
    return ProgressModel(
      id: map['id'] ?? '',
      module: map['module'] ?? '',
      levelId: map['level_id'] ?? '',
      topicId: map['topic_id'] ?? '',
      subtopicId: map['subtopic_id'] ?? '',
      score: map['score'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'module': module,
      'level_id': levelId,
      'topic_id': topicId,
      'subtopic_id': subtopicId,
      'score': score,
    };
  }

  ProgressModel copyWith({
    int? id,
    String? module,
    int? levelId,
    String? topicId,
    String? subtopicId,
    int? score,
  }) {
    return ProgressModel(
      id: id ?? this.id,
      module: module ?? this.module,
      levelId: levelId ?? this.levelId,
      topicId: topicId ?? this.topicId,
      subtopicId: subtopicId ?? this.subtopicId,
      score: score ?? this.score,
    );
  }
}
