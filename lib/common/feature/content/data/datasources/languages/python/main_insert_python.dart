import 'package:rutacode/common/feature/content/data/datasources/languages/python/insert_jr_python.dart';
import 'package:rutacode/common/feature/content/data/datasources/languages/python/insert_sr_python.dart';
import 'package:sqflite/sqflite.dart';

class InsertPythonData {
  static Future<void> insertPythonData(Database db) async {
    await _insertJrLevelData(db);
    await _insertMidLevelData(db);
    await _insertPythonSrLevelData(db);
  }

  static Future<void> _insertJrLevelData(Database db) async {
    await insertPythonJrLevel1Data(db);
    await insertPythonJrLevel2Data(db);
    await insertPythonJrLevel3Data(db);
    await insertPythonJrLevel4Data(db);
    await insertPythonJrLevel5Data(db);
  }

  static Future<void> _insertMidLevelData(Database db) async {}

  static Future<void> _insertPythonSrLevelData(Database db) async {
    await insertPythonSrLevel1Data(db);
    await insertPythonSrLevel2Data(db);
    await insertPythonSrLevel3Data(db);
    await insertPythonSrLevel4Data(db);
    await insertPythonSrLevel5Data(db);
    await insertPythonSrLevel6Data(db);
  }
}
