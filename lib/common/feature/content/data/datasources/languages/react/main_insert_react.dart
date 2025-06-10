import 'package:rutacode/common/feature/content/data/datasources/languages/react/insert_jr_react.dart';
import 'package:rutacode/common/feature/content/data/datasources/languages/react/insert_mid_react.dart';
import 'package:sqflite/sqflite.dart';

class InsertReactData {
  static Future<void> insertReactData(Database db) async {
    await _insertReactJrLevelData(db);
    await _insertReactMidLevelData(db);
    await _insertReactSrLevelData(db);
  }

  static Future<void> _insertReactJrLevelData(Database db) async {
    await insertReactJrLevel1Data(db);
    await insertReactJrLevel2Data(db);
    await insertReactJrLevel3Data(db);
    await insertReactJrLevel4Data(db);
    await insertReactJrLevel5Data(db);
    await insertReactJrLevel6Data(db);
  }

  static Future<void> _insertReactMidLevelData(Database db) async {
    await insertReactMidLevel1Data(db);
    await insertReactMidLevel2Data(db);
    await insertReactMidLevel3Data(db);
    await insertReactMidLevel4Data(db);
    await insertReactMidLevel5Data(db);
    await insertReactMidLevel6Data(db);
  }

  static Future<void> _insertReactSrLevelData(Database db) async {}
}
