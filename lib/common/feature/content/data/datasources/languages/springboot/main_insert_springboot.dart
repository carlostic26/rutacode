import 'package:rutacode/common/feature/content/data/datasources/languages/springboot/insert_jr_springboot.dart';
import 'package:rutacode/common/feature/content/data/datasources/languages/springboot/insert_mid_springboot.dart';
import 'package:sqflite/sqflite.dart';

class InsertSpringbootData {
  static Future<void> insertAngularData(Database db) async {
    await _insertSpringbootJrLevelData(db);
    await _insertSpringbootMidLevelData(db);
    await _insertSpringbootSrLevelData(db);
  }

  static Future<void> _insertSpringbootJrLevelData(Database db) async {
    await insertSpringbootJrLevel1Data(db);
    await insertSpringbootJrLevel2Data(db);
    await insertSpringbootJrLevel3Data(db);
    await insertSpringbootJrLevel4Data(db);
    await insertSpringbootJrLevel5Data(db);
    await insertSpringbootJrLevel6Data(db);
  }

  static Future<void> _insertSpringbootMidLevelData(Database db) async {
    await insertSpringbootMidLevel1Data(db);
    await insertSpringbootMidLevel2Data(db);
    await insertSpringbootMidLevel3Data(db);
    await insertSpringbootMidLevel4Data(db);
    await insertSpringbootMidLevel5Data(db);
    await insertSpringbootMidLevel6Data(db);
  }

  static Future<void> _insertSpringbootSrLevelData(Database db) async {}
}
