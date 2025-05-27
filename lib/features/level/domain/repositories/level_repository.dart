import 'package:rutacode/features/detail/data/models/detail_model.dart';

abstract class LevelRepository {
  Future<List<DetailContentModel>> getLevelByModule(
      String language, String module);
  Future<int> countLevelsByModule(String language, String module);
}
