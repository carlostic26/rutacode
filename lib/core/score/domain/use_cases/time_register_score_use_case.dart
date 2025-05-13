import 'package:rutacode/core/score/domain/use_cases/crud_score_use_cases.dart';

//Este es un caso de uso para el tiempo, que usa otro caso de uso para registrar una puntuación después de un retraso
class RegisterScoreAfterDelayUseCase {
  final ScoreUseCases scoreUseCases;

  RegisterScoreAfterDelayUseCase({required this.scoreUseCases});

  Future<void> call({
    required String subtopic,
    required String module,
    required int level,
    required String topic,
  }) async {
    await scoreUseCases.add(subtopic, module, level, topic, 2);
  }
}
