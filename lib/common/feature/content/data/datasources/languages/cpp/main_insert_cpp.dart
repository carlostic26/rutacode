import 'package:sqflite/sqflite.dart';

class InsertCppData {
  static Future<void> insertCppData(Database db) async {
    await _insertCppJrLevelData(db);
    await _insertCppMidLevelData(db);
    await _insertCppSrLevelData(db);
  }

  static Future<void> _insertCppJrLevelData(Database db) async {}

  static Future<void> _insertCppMidLevelData(Database db) async {}

  static Future<void> _insertCppSrLevelData(Database db) async {}
}
