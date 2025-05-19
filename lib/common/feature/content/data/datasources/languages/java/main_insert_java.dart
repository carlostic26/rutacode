import 'package:flutter/material.dart';
import 'package:rutacode/common/feature/content/data/datasources/languages/java/insert_jr_java.dart';
import 'package:rutacode/common/feature/content/data/datasources/languages/java/insert_mid_java.dart';
import 'package:rutacode/common/feature/content/data/datasources/languages/java/insert_sr_java.dart';
import 'package:sqflite/sqflite.dart';

class InsertJavaData {
  static Future<void> insertJavaData(Database db) async {
    try {
      await _insertJrLevelData(db);
      await _insertMidLevelData(db);
      await _insertPythonSrLevelData(db);
    } catch (e, stackTrace) {
      debugPrint('Error al insertar Java: $e');
      debugPrint('Stack trace: $stackTrace');
    }
  }

  static Future<void> _insertJrLevelData(Database db) async {
    await insertJrLevel1Data(db);
    await insertJrLevel2Data(db);
    await insertJrLevel3Data(db);
    await insertJrLevel4Data(db);
    await insertJrLevel5Data(db);
  }

  static Future<void> _insertMidLevelData(Database db) async {
    await insertMidLevel1Data(db);
    await insertMidLevel2Data(db);
    await insertMidLevel3Data(db);
    await insertMidLevel4Data(db);
    await insertMidLevel5Data(db);
    await insertMidLevel6Data(db);
  }

  static Future<void> _insertPythonSrLevelData(Database db) async {
    await insertPythonSrLevel1Data(db);
    await insertPythonSrLevel2Data(db);
    await insertPythonSrLevel3Data(db);
    await insertPythonSrLevel4Data(db);
    await insertPythonSrLevel5Data(db);
    await insertPythonSrLevel6Data(db);
  }
}
