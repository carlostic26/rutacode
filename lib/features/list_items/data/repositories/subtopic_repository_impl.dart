import 'package:flutter/material.dart';
import 'package:rutacode/common/feature/content/data/datasources/db_helper.dart';
import 'package:rutacode/features/detail/data/models/detail_model.dart';
import 'package:rutacode/features/list_items/domain/repositories/subtopic_repository.dart';
import 'package:sqflite/sqflite.dart';

class SubtopicRepositoryImpl implements SubtopicRepository {
  final LocalContentDatabaseHelper _dbHelper = LocalContentDatabaseHelper();

  Future<Database> get _database async => await _dbHelper.getDatabase();

  @override
  @override
  Future<List<DetailContentModel>> getSubtopicsByTopic(
    String language,
    String module,
    int level,
    String topic,
  ) async {
    final db = await _database;

    debugPrint(
        '📌 Params en subtopic: language=$language, module=$module, level=$level, topic=$topic');

    final maps = await db.query(
      'programming_content',
      where: 'language = ? AND module = ? AND level = ? AND topic = ?',
      whereArgs: [language, module, level, topic],
    );

    return List.generate(maps.length, (i) {
      return DetailContentModel(
        id: maps[i]['id'] as int,
        language: maps[i]['language'] as String,
        module: maps[i]['module'] as String,
        level: maps[i]['level'] as int,
        titleLevel: maps[i]['tittle_level'] as String,
        topic: maps[i]['topic'] as String,
        subtopic: maps[i]['subtopic'] as String,
        definition: maps[i]['definition'] as String,
        codeExample: maps[i]['code_example'] as String,
      );
    });
  }
}
