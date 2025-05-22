import 'package:rutacode/common/feature/content/data/datasources/languages/javascript/insert_jr_js.dart';
import 'package:rutacode/common/feature/content/data/datasources/languages/javascript/insert_mid_js.dart';
import 'package:rutacode/common/feature/content/data/datasources/languages/javascript/insert_sr_js.dart';
import 'package:sqflite/sqflite.dart';

class InsertJsData {
  static Future<void> insertJsData(Database db) async {
    await _insertJsJrLevelData(db);
    await _insertJsMidLevelData(db);
    await _insertJsSrLevelData(db);
  }

  static Future<void> _insertJsJrLevelData(Database db) async {
    await insertJsJrLevel1Data(db);
    await insertJsJrLevel2Data(db);
    await insertJsJrLevel3Data(db);
    await insertJsJrLevel4Data(db);
    await insertJsJrLevel5Data(db);
    await insertJsJrLevel6Data(db);
  }

  static Future<void> _insertJsMidLevelData(Database db) async {
    await insertJsMidLevel1Data(db);
    await insertJsMidLevel2Data(db);
    await insertJsMidLevel3Data(db);
    await insertJsMidLevel4Data(db);
    await insertJsMidLevel5Data(db);
    await insertJsMidLevel6Data(db);
  }

  static Future<void> _insertJsSrLevelData(Database db) async {
    await insertJsSrLevel1Data(db);
    await insertJsSrLevel2Data(db);
    await insertJsSrLevel3Data(db);
  }
}
