import 'package:rutacode/common/feature/content/data/datasources/languages/aws/main_insert_aws.dart';
import 'package:rutacode/common/feature/content/data/datasources/languages/java/main_insert_java.dart';
import 'package:rutacode/common/feature/content/data/datasources/languages/javascript/main_insert_js.dart';
import 'package:rutacode/common/feature/content/data/datasources/languages/linux/main_insert_linux.dart';
import 'package:rutacode/common/feature/content/data/datasources/languages/python/main_insert_python.dart';
import 'package:rutacode/common/feature/content/data/datasources/languages/spp/main_insert_cpp.dart';
import 'package:rutacode/features/home/data/datasource/inserts_language.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalContentDatabaseHelper {
  final Database? testDatabase;
  Database? _database;
  int dbVersion = 11;

  LocalContentDatabaseHelper({this.testDatabase});

  Future<Database> getDatabase() async {
    if (testDatabase != null) {
      return testDatabase!;
    }
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final String dbName = 'rutacode_db_$dbVersion.db';

    return await openDatabase(
      join(dbPath, dbName),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE IF NOT EXISTS programming_content (
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

        await db.execute('''
          CREATE TABLE IF NOT EXISTS language_img (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            language TEXT,
            url_img TEXT
          )
        ''');

        await InsertJavaData.insertJavaData(db);
        await InsertPythonData.insertPythonData(db);
        await InsertJsData.insertJsData(db);
        await InsertCppData.insertCppData(db);
        await InsertLinuxData.insertLinuxData(db);
        await InsertAwsData.insertAwsData(db);

        await insertLanguageData(db);
      },
    );
  }
}
