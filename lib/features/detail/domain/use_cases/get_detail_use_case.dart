import 'package:rutacode/features/detail/data/models/detail_model.dart';
import 'package:rutacode/features/detail/domain/repositories/detail_repository.dart';

class GetDetailUseCase {
  final DetailRepository repository;

  GetDetailUseCase(this.repository);

  Future<DetailContentModel> call(String language, String module, int level,
      String topic, String subtopic) {
    return repository.getDetail(language, module, level, topic, subtopic);
  }
}
