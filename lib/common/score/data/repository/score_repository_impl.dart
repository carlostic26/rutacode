// data/repository/score_repository_impl.dart
import 'package:rutacode/common/data/datasources/old_database_helper.dart';
import 'package:rutacode/common/score/domain/repository/score_repository.dart';
import 'package:sqflite/sqflite.dart';

class ScoreRepositoryImpl implements ScoreRepository {
  final LocalDatabaseHelper _dbHelper = LocalDatabaseHelper();

  Future<Database> get _database async => await _dbHelper.getDatabase();

  @override
  Future<List<int>> getScoresByModule(String module) async {
    final db = await _database;

    // Consultar todos los registros del módulo
    final scores = await db.query(
      'score',
      where: 'module = ?',
      whereArgs: [module],
    );

    // Agrupar los puntajes por nivel
    final levelScores = <String, int>{};
    for (final score in scores) {
      final level = score['level'] as String;
      final amount = score['amount'] as int;

      // Sumar los puntajes por nivel
      levelScores[level] = (levelScores[level] ?? 0) + amount;
    }

    // Ordenar los niveles y devolver una lista de puntajes
    final sortedLevels = levelScores.keys.toList()..sort();
    return sortedLevels.map((level) => levelScores[level]!).toList();
  }

  @override
  Future<void> addScore(String subtopic, String module, int level, String topic,
      int amount) async {
    final db = await _database;

    // Verificar si ya existe un registro para este subtopic, módulo, nivel y topic
    final existingScores = await db.query(
      'score',
      where: 'subtopic = ? AND module = ? AND level = ? AND topic = ?',
      whereArgs: [subtopic, module, level, topic],
    );

    if (existingScores.isNotEmpty) {
      // Si existe, actualizar el score sumando los puntos proporcionados
      final currentAmount = existingScores.first['amount'] as int;
      final newAmount = currentAmount + amount;

      await db.update(
        'score',
        {'amount': newAmount},
        where: 'subtopic = ? AND module = ? AND level = ? AND topic = ?',
        whereArgs: [subtopic, module, level, topic],
      );
    } else {
      // Si no existe, insertar un nuevo registro con el score proporcionado
      await db.insert('score', {
        'subtopic': subtopic,
        'module': module,
        'level': level,
        'topic': topic,
        'amount': amount,
      });
    }
  }

  @override
  Future<int> getScore(
      String subtopic, String module, int level, String topic) async {
    final db = await _database;

    // Obtener el score actual para este subtopic, módulo, nivel y topic
    final scores = await db.query(
      'score',
      where: 'subtopic = ? AND module = ? AND level = ? AND topic = ?',
      whereArgs: [subtopic, module, level, topic],
    );

    // Si existe un registro, devolver el score; de lo contrario, devolver 0
    if (scores.isNotEmpty) {
      return scores.first['amount'] as int;
    } else {
      return 0;
    }
  }

  @override
  Future<void> updateScore(String subtopic, String module, int level,
      String topic, int newAmount) async {
    final db = await _database;

    // Verificar si ya existe un registro para este subtopic, módulo, nivel y topic
    final existingScores = await db.query(
      'score',
      where: 'subtopic = ? AND module = ? AND level = ? AND topic = ?',
      whereArgs: [subtopic, module, level, topic],
    );

    if (existingScores.isNotEmpty) {
      // Si existe, actualizar el score con el nuevo valor
      await db.update(
        'score',
        {'amount': newAmount},
        where: 'subtopic = ? AND module = ? AND level = ? AND topic = ?',
        whereArgs: [subtopic, module, level, topic],
      );
    } else {
      // Si no existe, insertar un nuevo registro con el nuevo score
      await db.insert('score', {
        'subtopic': subtopic,
        'module': module,
        'level': level,
        'topic': topic,
        'amount': newAmount,
      });
    }
  }
}
