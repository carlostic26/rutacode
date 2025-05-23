import 'package:rutacode/features/detail/data/models/detail_model.dart';

abstract class DetailRepository {
  Future<DetailContentModel> getDetail(String subtopicID, String module);
}
