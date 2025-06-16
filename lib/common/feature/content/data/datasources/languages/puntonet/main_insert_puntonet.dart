import 'package:rutacode/common/feature/content/data/datasources/languages/puntonet/insert_jr_puntonet.dart';
import 'package:rutacode/common/feature/content/data/datasources/languages/puntonet/insert_mid_puntonet.dart';
import 'package:sqflite/sqflite.dart';
class InsertPuntonetData {
  static Future<void> insertPuntonetData(Database db) async {
    await _insertPuntonetJrLevelData(db);
    await _insertPuntonetMidLevelData(db);
    await _insertPuntonetSrLevelData(db);
  }

  static Future<void> _insertPuntonetJrLevelData(Database db) async {
    await insertPuntonetJrLevel1Data(db);
    await insertPuntonetJrLevel2Data(db);
    await insertPuntonetJrLevel3Data(db);
    await insertPuntonetJrLevel4Data(db);
    await insertPuntonetJrLevel5Data(db);
    await insertPuntonetJrLevel6Data(db);
  }

  static Future<void> _insertPuntonetMidLevelData(Database db) async {
    await insertPuntonetMidLevel1Data(db);
    await insertPuntonetMidLevel2Data(db);
    await insertPuntonetMidLevel3Data(db);
    await insertPuntonetMidLevel4Data(db);
    await insertPuntonetMidLevel5Data(db);
    await insertPuntonetMidLevel6Data(db);
  }

  static Future<void> _insertPuntonetSrLevelData(Database db) async {}
}