import 'package:rutacode/common/feature/content/data/datasources/languages/angular/insert_jr_angular.dart';
import 'package:rutacode/common/feature/content/data/datasources/languages/angular/insert_mid_angular.dart';
import 'package:sqflite/sqflite.dart';

class InsertAngularData {
  static Future<void> insertAngularData(Database db) async {
    await _insertAngularJrLevelData(db);
    await _insertAngularMidLevelData(db);
    await _insertAngularSrLevelData(db);
  }

  static Future<void> _insertAngularJrLevelData(Database db) async {
    await insertAngularJrLevel1Data(db);
    await insertAngularJrLevel2Data(db);
    await insertAngularJrLevel3Data(db);
    await insertAngularJrLevel4Data(db);
    await insertAngularJrLevel5Data(db);
  }

  static Future<void> _insertAngularMidLevelData(Database db) async {
    await insertAngularMidLevel1Data(db);
    await insertAngularMidLevel2Data(db);
    await insertAngularMidLevel3Data(db);
  }

  static Future<void> _insertAngularSrLevelData(Database db) async {}
}
