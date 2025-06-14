class ProgressEntity {
  final int id;
  final String language;
  final String module;
  final int levelId;
  final String topicId;
  final String subtopicId;
  final int score;

  ProgressEntity({
    required this.id,
    required this.language,
    required this.module,
    required this.levelId,
    required this.topicId,
    required this.subtopicId,
    required this.score,
  });
}
