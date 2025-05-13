import 'package:rutacode/features/list_items/data/model/topic_model.dart';
import 'package:rutacode/features/list_items/domain/repositories/topic_repository.dart';

class GetTopicUseCase {
  late final TopicRepository repository;

  GetTopicUseCase(this.repository);

  Future<List<TopicModel>> call(int levelId, String module) async {
    return repository.getTopics(levelId, module);
  }
}
