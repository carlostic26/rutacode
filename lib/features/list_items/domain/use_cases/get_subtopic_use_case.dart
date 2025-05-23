import 'package:rutacode/features/detail/data/models/detail_model.dart';
import 'package:rutacode/features/list_items/domain/repositories/subtopic_repository.dart';

class GetSubtopicUseCase {
  late final SubtopicRepository repository;

  GetSubtopicUseCase(this.repository);

  Future<List<DetailContentModel>> call(
      String language, String module, int level, String topic) async {
    return repository.getSubtopicsByTopic(language, module, level, topic);
  }
}
