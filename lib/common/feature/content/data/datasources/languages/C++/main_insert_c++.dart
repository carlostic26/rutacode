import 'package:flutter/material.dart';
import 'package:rutacode/common/feature/content/data/datasources/languages/C++/insert_jr_c++.dart';
import 'package:rutacode/common/feature/content/data/datasources/languages/C++/insert_mid_c++.dart';
import 'package:sqflite/sqflite.dart';

class InsertCPPData {
  static Future<void> insertCPPData(Database db) async {
    try {
      await _insertCppJrLevelData(db);
      await _insertCppMidLevelData(db);
      await _insertCppSrLevelData(db);
    } catch (e, stackTrace) {
      debugPrint('Error al insertar C++: $e');
      debugPrint('Stack trace: $stackTrace');
    }
  }

  static Future<void> _insertCppJrLevelData(Database db) async {
    await insertJrLevel1Data(db);
    await insertJrLevel2Data(db);
    await insertJrLevel3Data(db);
    await insertJrLevel4Data(db);
    await insertJrLevel5Data(db);
    await insertJrLevel6Data(db);
    await insertJrLevel7Data(db);
    await insertJrLevel8Data(db);
  }

  static Future<void> _insertCppMidLevelData(Database db) async {
    await insertMidLevel1Data(db);
    await insertMidLevel2Data(db);
    await insertMidLevel3Data(db);
  }

  static Future<void> _insertCppSrLevelData(Database db) async {}
}
