import 'package:rutacode/features/list_items/data/model/topic_model.dart';

abstract class TopicRepository {
  Future<List<TopicModel>> getTopics(int levelId, String module);
}
