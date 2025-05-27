import 'package:rutacode/features/detail/data/models/detail_model.dart';

abstract class TopicRepository {
  Future<List<DetailContentModel>> getTopicsByModule(
      String language, String module);
}
