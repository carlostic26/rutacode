class ContentEntity {
  final String language;
  final String module;
  final int level;
  final int titleLevel;
  final String topic;
  final String subtopic;
  final String definition;
  final String codeExample;

  ContentEntity({
    required this.language,
    required this.module,
    required this.level,
    required this.titleLevel,
    required this.topic,
    required this.subtopic,
    required this.definition,
    required this.codeExample,
  });
}
