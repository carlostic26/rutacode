import 'package:rutacode/features/detail/data/models/detail_model.dart';
import 'package:rutacode/features/list_items/domain/repositories/topic_repository.dart';

class GetTopicUseCase {
  late final TopicRepository repository;

  GetTopicUseCase(this.repository);

  Future<List<DetailContentModel>> call(
      String language, String module, int level) async {
    return repository.getTopicsByLevel(language, module, level);
  }
}
