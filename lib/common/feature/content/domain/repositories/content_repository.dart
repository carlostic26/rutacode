import 'package:rutacode/common/feature/content/data/model/content_model.dart';

abstract class ContentRepository {
  Future<ContentModel> getContentByCompositeKey({
    required String language,
    required String module,
    required int level,
    required String topic,
    required String subtopic,
  });

  Future<List<String>> getAllLanguages();
  Future<List<String>> getModulesByLanguage(String language);
  Future<List<int>> getLevelsByContent({
    required String language,
    required String module,
  });

  Future<List<String>> getTopicsByContent({
    required String language,
    required String module,
    required int level,
  });

  Future<List<String>> getSubtopicsByContent({
    required String language,
    required String module,
    required int level,
    required String topic,
  });
}
