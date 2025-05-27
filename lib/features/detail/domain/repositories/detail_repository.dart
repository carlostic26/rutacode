import 'package:rutacode/features/detail/data/models/detail_model.dart';

abstract class DetailRepository {
  Future<DetailContentModel> getDetail(
      String language, String module, int level, String topic, String subtopic);
}
