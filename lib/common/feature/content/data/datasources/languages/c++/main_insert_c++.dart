import 'package:rutacode/common/feature/content/data/datasources/languages/c++/insert_jr_c++.dart';
import 'package:rutacode/common/feature/content/data/datasources/languages/c++/insert_mid_c++.dart';
import 'package:rutacode/common/feature/content/data/datasources/languages/c++/insert_sr_c++.dart';
import 'package:sqflite/sqflite.dart';

class InsertCppData {
  static Future<void> insertCppData(Database db) async {
    await _insertCppJrLevelData(db);
    await _insertCppMidLevelData(db);
    await _insertCppSrLevelData(db);
  }

  static Future<void> _insertCppJrLevelData(Database db) async {
    await insertCppJrLevel1Data(db);
    await insertCppJrLevel2Data(db);
    await insertCppJrLevel3Data(db);
  }

  static Future<void> _insertCppMidLevelData(Database db) async {
    await insertCppMidLevel1Data(db);
    await insertCppMidLevel2Data(db);
    await insertCppMidLevel3Data(db);
  }

  static Future<void> _insertCppSrLevelData(Database db) async {
    await insertCppSrLevel1Data(db);
    await insertCppSrLevel2Data(db);
    await insertCppSrLevel3Data(db);
    await insertCppSrLevel4Data(db);
    await insertCppSrLevel5Data(db);
  }
}
