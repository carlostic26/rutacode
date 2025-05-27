import 'package:rutacode/features/detail/data/models/detail_model.dart';

abstract class SubtopicRepository {
  Future<List<DetailContentModel>> getSubtopicsByTopic(
      String language, String module, int level, String topic);
}
