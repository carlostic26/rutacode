import 'package:path/path.dart';
import 'package:rutacode/features/detail/data/datasourcers/detail_jr_inserts_db.dart';
import 'package:rutacode/features/detail/data/datasourcers/detail_mid_inserts_db.dart';
import 'package:rutacode/features/detail/data/datasourcers/detail_sr_inserts_db.dart';
import 'package:rutacode/features/list_items/data/datasources/subtopic_local_database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:rutacode/features/level/data/datasources/level_local_database.dart';
import 'package:rutacode/features/list_items/data/datasources/topic_local_database.dart';

class LocalDatabaseHelper {
  Database? _database;
  int dbVersion = 1;

  Future<Database> getDatabase() async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    try {
      final dbPath = await getDatabasesPath();
      final String dbName = 'rutacode_db_$dbVersion.db';

      return await openDatabase(
        join(dbPath, dbName),
        version: 1,
        onCreate: (db, version) async {
          // Delegar la creación de tablas a cada feature
          await LevelLocalDatabaseHelper().createLevelTable(db);
          await TopicLocalDatabaseHelper().createTopicTable(db);
          await SubtopicLocalDatabaseHelper().createSubtopicTable(db);
          await DetailJrLocalDatabaseHelper().createDetailTable(db);
          await DetailMidLocalDatabaseHelper().insertDetailsMid(db);
          await DetailSrLocalDatabaseHelper().insertDetailsSr(db);
        },
      );
    } catch (e) {
      throw Exception('Error initializing global database: $e');
    }
  }
}
