import 'package:rutacode/common/feature/content/data/datasources/languages/linux/insert_jr_linux.dart';
import 'package:rutacode/common/feature/content/data/datasources/languages/linux/insert_sr_linux.dart';
import 'package:rutacode/common/feature/content/data/datasources/languages/linux/intert_mid_linux.dart';
import 'package:sqflite/sqflite.dart';

class InsertCppData {
  static Future<void> insertCppData(Database db) async {
    await _insertLinuxJrLevelData(db);
    await _insertLinuxMidLevelData(db);
    await _insertLinuxSrLevelData(db);
  }

  static Future<void> _insertLinuxJrLevelData(Database db) async {
    await insertJrLevel1DataLinux(db);
    await insertJrLevel2DataLinux(db);
    await insertJrLevel3DataLinux(db);
    await insertJrLevel4DataLinux(db);
    await insertJrLevel5DataLinux(db);
    await insertJrLevel6DataLinux(db);
  }

  static Future<void> _insertLinuxMidLevelData(Database db) async {
    await insertMidLevel1DataLinux(db);
    await insertMidLevel2DataLinux(db);
    await insertMidLevel3DataLinux(db);
    await insertMidLevel4DataLinux(db);
    await insertMidLevel5DataLinux(db);
    await insertMidLevel6DataLinux(db);
  }

  static Future<void> _insertLinuxSrLevelData(Database db) async {
    await insertSrLevel1DataLinux(db);
    await insertSrLevel2DataLinux(db);
    await insertSrLevel3DataLinux(db);
    await insertSrLevel4DataLinux(db);
    await insertSrLevel5DataLinux(db);
    await insertSrLevel6DataLinux(db);
  }
}
