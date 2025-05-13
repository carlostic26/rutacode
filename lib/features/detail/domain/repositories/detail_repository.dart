import 'package:rutacode/features/detail/data/models/detail_model.dart';

abstract class DetailRepository {
  Future<DetailModel> getDetail(String subtopicID, String module);
}
