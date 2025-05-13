import 'package:rutacode/features/exam/domain/repositories/exam_repository.dart';

class SaveUserAnswer {
  final ExamRepository repository;

  SaveUserAnswer(this.repository);

  Future<void> call(String questionId, String selectedAnswer) async {
    await repository.saveUserAnswer(questionId, selectedAnswer);
  }
}
