import 'package:rutacode/common/feature/content/data/datasources/python/insert_sr_python.dart';
import 'package:sqflite/sqflite.dart';

class InsertPythonData {
  static Future<void> insertPythonData(Database db) async {
    await _insertJrLevelData(db);
    await _insertMidLevelData(db);
    await _insertSrLevelData(db);
  }

  static Future<void> _insertJrLevelData(Database db) async {
/*     await insertJrLevel1Data(db);
    await insertJrLevel2Data(db);
    await insertJrLevel3Data(db); */
  }

  static Future<void> _insertMidLevelData(Database db) async {}

  static Future<void> _insertSrLevelData(Database db) async {
    await insertSrLevel1Data(db);
    await insertSrLevel2Data(db);
    await insertSrLevel3Data(db);
  }
}
