import 'package:rutacode/features/detail/data/models/detail_model.dart';

abstract class TopicRepository {
  Future<List<DetailContentModel>> getTopicsByLevel(
      String language, String module, int level);
}
