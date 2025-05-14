import 'package:rutacode/common/feature/content/data/datasources/java/main_insert_java.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalContentDatabaseHelper {
  Database? _database;
  int dbVersion = 1;

  Future<Database> getDatabase() async {
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

        await InsertJavaData.insertJavaData(db);
        //await InsertPythonData.insertPythonData(db);
        //this is develop branch
      },
    );
  }
}
