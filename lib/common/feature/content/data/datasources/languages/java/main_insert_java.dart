import 'package:rutacode/common/feature/content/data/datasources/languages/java/insert_jr_java.dart';
import 'package:rutacode/common/feature/content/data/datasources/languages/java/insert_sr_java.dart';
import 'package:sqflite/sqflite.dart';

class InsertJavaData {
  static Future<void> insertJavaData(Database db) async {
    try {
      await _insertJrLevelData(db);
      await _insertMidLevelData(db);
      await _insertPythonSrLevelData(db);
    } catch (e, stackTrace) {
      print('Error al insertar Java: $e');
      print('Stack trace: $stackTrace');
    }
  }

  static Future<void> _insertJrLevelData(Database db) async {
    await insertJrLevel1Data(db);
    await insertJrLevel2Data(db);
    await insertJrLevel3Data(db);
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
