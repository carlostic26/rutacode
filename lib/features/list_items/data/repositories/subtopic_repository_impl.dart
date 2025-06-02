import 'package:flutter/material.dart';
import 'package:rutacode/common/feature/content/data/datasources/db_helper.dart';
import 'package:rutacode/features/detail/data/models/detail_model.dart';
import 'package:rutacode/features/list_items/domain/repositories/subtopic_repository.dart';
import 'package:sqflite/sqflite.dart';

class SubtopicRepositoryImpl implements SubtopicRepository {
  final LocalContentDatabaseHelper _dbHelper = LocalContentDatabaseHelper();

  Future<Database> get _database async => await _dbHelper.getDatabase();

  @override
  Future<List<DetailContentModel>> getSubtopicsByTopic(
    String language,
    String module,
    int level,
    String topic,
  ) async {
    final db = await _database;
    final maps = await db.query(
      'programming_content',
      where: 'language = ? AND module = ? AND level = ? AND topic = ?',
      whereArgs: [language, module, level, topic],
      // Ordenar por subtopic para consistencia
      orderBy: 'subtopic ASC',
    );

    // Usar LinkedHashMap para mantener el orden de inserción
    final uniqueSubtopics = <String, DetailContentModel>{};

    for (final map in maps) {
      final subtopic = map['subtopic'] as String;
      uniqueSubtopics.putIfAbsent(
          subtopic,
          () => DetailContentModel(
                id: map['id'] as int,
                language: map['language'] as String,
                module: map['module'] as String,
                level: map['level'] as int,
                titleLevel: map['tittle_level'] as String,
                topic: map['topic'] as String,
                subtopic: subtopic,
                definition: map['definition'] as String,
                codeExample: map['code_example'] as String,
              ));
    }

    return uniqueSubtopics.values.toList();
  }
}
