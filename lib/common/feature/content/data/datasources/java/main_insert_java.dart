import 'package:rutacode/common/feature/content/data/datasources/java/insert_jr_java.dart';
import 'package:rutacode/common/feature/content/data/datasources/java/insert_mid_java.dart';
import 'package:rutacode/common/feature/content/data/datasources/java/insert_sr_java.dart';
import 'package:sqflite/sqflite.dart';

class InsertJavaData {
  static Future<void> insertJavaData(Database db) async {
    await _insertJrLevelData(db);
    await _insertMidLevelData(db);
    await _insertSrLevelData(db);
  }

  static Future<void> _insertJrLevelData(Database db) async {
    await insertJrLevel1Data(db);
    await insertJrLevel2Data(db);
    await insertJrLevel3Data(db);
    await insertJrLevel4Data(db);
    await insertJrLevel5Data(db);
  }

  static Future<void> _insertMidLevelData(Database db) async {
    await insertMidLevel1Data(db);
  }

  static Future<void> _insertSrLevelData(Database db) async {
    await insertSrLevel1Data(db);
    await insertSrLevel2Data(db);
  }
}
