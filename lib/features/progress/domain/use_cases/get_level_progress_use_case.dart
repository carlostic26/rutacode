import 'package:rutacode/features/progress/domain/repositories/progress_repository.dart';

class GetLevelProgress {
  final ProgressRepository _progressRepository;

  GetLevelProgress(this._progressRepository);

  Future<double> call(String module, int level) async {
    // Obtener el número de subtopics completados en el nivel
    final completedSubtopics = await _progressRepository
        .getCompletedSubtopicsByLevel(module: module, level: level);

    // Obtener el número total de subtopics en el nivel
    final totalSubtopics = await _progressRepository.getTotalSubtopicsByLevel(
        module: module, level: level);

    // Calcular el progreso (completados / total)
    if (totalSubtopics == 0) return 0.0; // Evitar división por cero
    return completedSubtopics / totalSubtopics;
  }
}
