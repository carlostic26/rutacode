import 'package:flutter/material.dart';
import 'package:rutacode/common/feature/content/data/datasources/db_helper.dart';
import 'package:rutacode/features/detail/data/models/detail_model.dart';
import 'package:rutacode/features/detail/domain/repositories/detail_repository.dart';
import 'package:sqflite/sqflite.dart';

class DetailRepositoryImpl implements DetailRepository {
  final LocalContentDatabaseHelper _dbHelper = LocalContentDatabaseHelper();

  Future<Database> get _database async => await _dbHelper.getDatabase();

  @override
  Future<DetailContentModel> getDetail(String language, String module,
      int level, String topic, String subtopic) async {
    final db = await _database;

    final maps = await db.query(
      'programming_content',
      where:
          'language = ? AND module = ? AND level = ? AND topic = ? AND subtopic = ?',
      whereArgs: [language, module, level, topic, subtopic],
    );

    return DetailContentModel(
      id: maps[0]['id'] as int,
      language: maps[0]['language'] as String,
      module: maps[0]['module'] as String,
      level: maps[0]['level'] as int,
      titleLevel: maps[0]['tittle_level'] as String,
      topic: maps[0]['topic'] as String,
      subtopic: maps[0]['subtopic'] as String,
      definition: maps[0]['definition'] as String,
      codeExample: maps[0]['code_example'] as String,
    );
  }
}
