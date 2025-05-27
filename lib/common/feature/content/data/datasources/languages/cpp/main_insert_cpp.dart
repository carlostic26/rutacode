import 'package:rutacode/common/feature/content/data/datasources/languages/cpp/insert_jr_cpp.dart';
import 'package:rutacode/common/feature/content/data/datasources/languages/cpp/insert_mid_cpp.dart';
import 'package:rutacode/common/feature/content/data/datasources/languages/cpp/insert_sr_cpp.dart';
import 'package:sqflite/sqflite.dart';

class InsertCppData {
  static Future<void> insertCppData(Database db) async {
    await _insertCppJrLevelData(db);
    await _insertCppMidLevelData(db);
    await _insertCppSrLevelData(db);
  }

  static Future<void> _insertCppJrLevelData(Database db) async {
    await insertJrLevel1DataCpp(db);
    await insertJrLevel2DataCpp(db);
    await insertJrLevel3DataCpp(db);
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
  }
}
