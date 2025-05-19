import 'package:rutacode/common/feature/content/data/datasources/db_helper.dart';
import 'package:rutacode/features/languages/data/model/leanguage_img_model.dart';
import 'package:rutacode/features/languages/domain/repositories/leanguage_repository.dart';
import 'package:sqflite_common/sqlite_api.dart';

class LanguageRepositoryImpl implements LanguageRepository {
  final LocalContentDatabaseHelper _dbHelper = LocalContentDatabaseHelper();

  Future<Database> get _database async => await _dbHelper.getDatabase();

  @override
  Future<List<LanguageModel>> getlanguages() async {
    final db = await _database;
    final maps = await db.query(
      'language_img',
    );

    return List.generate(maps.length, (i) {
      return LanguageModel(
        language: maps[i]['language'] as String,
        urlImage: maps[i]['url_img'] as String,
      );
    });
  }
}
