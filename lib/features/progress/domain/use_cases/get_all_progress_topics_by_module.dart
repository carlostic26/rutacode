import 'package:rutacode/features/progress/data/model/progress_model.dart';
import 'package:rutacode/features/progress/domain/repositories/progress_repository.dart';

class GetAllProgressTopicsByModuleUseCase {
  final ProgressRepository _progressRepository;
  late final String module;
  late final int levelId;
  late final String topicId;

  GetAllProgressTopicsByModuleUseCase(this._progressRepository);

  Future<List<ProgressModel>> call() async {
    return await _progressRepository.getAllTopicProgressByModule(
        module: module, levelId: levelId, topicId: topicId);
  }
}
