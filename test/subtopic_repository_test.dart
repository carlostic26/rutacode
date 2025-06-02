import 'package:flutter_test/flutter_test.dart';
import 'package:rutacode/common/feature/content/data/datasources/db_helper.dart';
import 'package:rutacode/features/detail/data/models/detail_model.dart';
import 'package:rutacode/features/list_items/data/repositories/subtopic_repository_impl.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  late SubtopicRepositoryImpl repository;

  setUpAll(() async {
    // Inicializa sqflite_common_ffi
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;

    // Crea una base de datos en memoria
    final db = await databaseFactory.openDatabase(inMemoryDatabasePath);

    // Crea la tabla 'programming_content'
    await db.execute('''
      CREATE TABLE programming_content (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        language TEXT,
        module TEXT,
        level INTEGER,
        title_level TEXT,
        topic TEXT,
        subtopic TEXT,
        definition TEXT,
        code_example TEXT
      )
    ''');

    // Inserta datos de prueba
    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 1,
      'title_level': 'Nivel 1',
      'topic': 'Fundamentos de Java',
      'subtopic': 'Variables',
      'definition': 'Definición de variables en Java.',
      'code_example': 'int x = 5;'
    });

    // Inicializa el repositorio
    repository = SubtopicRepositoryImpl();
  });

  test('getSubtopicsByTopic returns list of DetailContentModel', () async {
    final result = await repository.getSubtopicsByTopic(
      'Java',
      'Jr',
      1,
      'Fundamentos de Java',
    );

    expect(result, isA<List<DetailContentModel>>());
    expect(result.length, greaterThan(0));
    expect(result.first.subtopic, equals('Variables'));
  });
}
