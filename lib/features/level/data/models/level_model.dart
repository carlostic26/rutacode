/* import 'package:rutacode/features/level/domain/entities/level.dart';

class LevelModel extends Level {
  LevelModel(
      {required super.id,
      required super.module,
      required super.order,
      required super.title,
      required super.description,
      required super.points,
      required super.isCompleted});

  factory LevelModel.fromMap(Map<String, dynamic> map) {
    return LevelModel(
      id: map['id'] ?? '',
      module: map['module'] ?? '',
      order: map['num_order'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      points: map['points'] ?? '',
      isCompleted: map['is_completed'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    int isCompletedParser = 0;
    if (isCompleted == true) {
      isCompletedParser = 1;
    }
    return {
      'id': id,
      'module': module,
      'num_order': order,
      'title': title,
      'description': description,
      'points': points,
      'is_completed': isCompletedParser,
    };
  }

  LevelModel copyWith({
    int? id,
    String? module,
    int? order,
    String? title,
    String? description,
    int? points,
    bool? isCompleted,
  }) {
    return LevelModel(
      id: id ?? this.id,
      module: module ?? this.module,
      order: order ?? this.order,
      title: title ?? this.title,
      description: description ?? this.description,
      points: points ?? this.points,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
 */