import 'package:rutacode/features/list_items/data/model/subtopic_model.dart';
import 'package:rutacode/features/list_items/domain/repositories/subtopic_repository.dart';

class GetSubtopicUseCase {
  late final SubtopicRepository repository;

  GetSubtopicUseCase(this.repository);

  Future<List<SubtopicModel>> call(String topicID, String module) async {
    return repository.getSubtopics(topicID, module);
  }
}
