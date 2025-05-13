import 'package:rutacode/common/score/domain/entity/score_entity.dart';

class ScoreModel extends Score {
  ScoreModel({
    required super.id,
    required super.amount,
    required super.module,
    required super.level,
    required super.topic,
    required super.subtopic,
  });

  factory ScoreModel.fromMap(Map<String, dynamic> map) {
    return ScoreModel(
      id: map['id'] ?? '',
      amount: map['amount'] ?? '',
      module: map['module'] ?? '',
      level: map['level'] ?? '',
      topic: map['topic'] ?? '',
      subtopic: map['subtopic'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amount': amount,
      'module': module,
      'level': level,
      'topic': topic,
      'subtopic': subtopic,
    };
  }
}
