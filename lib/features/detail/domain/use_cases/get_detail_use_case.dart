import 'package:rutacode/features/detail/data/models/detail_model.dart';
import 'package:rutacode/features/detail/domain/repositories/detail_repository.dart';

class GetDetailUseCase {
  final DetailRepository repository;

  GetDetailUseCase(this.repository);

  Future<DetailModel> call(String subtopicID, String module) {
    return repository.getDetail(subtopicID, module);
  }
}
