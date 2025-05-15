import 'package:rutacode/common/feature/content/data/datasources/java/insert_jr_java.dart';
import 'package:sqflite/sqflite.dart';

class InsertJavaData {
  static Future<void> insertJavaData(Database db) async {
    await _insertJrLevelData(db);
    await _insertMidLevelData(db);
    // await _insertSrLevelData(db);
  }

  static Future<void> _insertJrLevelData(Database db) async {
    await insertJrLevel1Data(db);
  }

  static Future<void> _insertMidLevelData(Database db) async {}
}
