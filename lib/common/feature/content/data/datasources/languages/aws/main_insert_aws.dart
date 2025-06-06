import 'package:flutter/material.dart';
import 'package:rutacode/common/feature/content/data/datasources/languages/aws/insert_jr_aws.dart';
import 'package:rutacode/common/feature/content/data/datasources/languages/aws/insert_mid_aws.dart';
import 'package:rutacode/common/feature/content/data/datasources/languages/aws/insert_sr_aws.dart';
import 'package:sqflite/sqflite.dart';

class InsertAwsData {
  static Future<void> insertAwsData(Database db) async {
    try {
      await _insertJrLevelData(db);
      await _insertMidLevelData(db);
      await _insertSrLevelData(db);
    } catch (e, stackTrace) {
      debugPrint('Error al insertar Aws: $e');
      debugPrint('Stack trace: $stackTrace');
    }
    try {
      await _insertJrLevelData(db);
      await _insertMidLevelData(db);
      await _insertSrLevelData(db);
    } catch (e, stackTrace) {
      debugPrint('Error al insertar Aws: $e');
      debugPrint('Stack trace: $stackTrace');
    }
  }

  static Future<void> _insertJrLevelData(Database db) async {
    await insertJrLevel1AwsData(db);
    await insertJrLevel2AwsData(db);
    await insertJrLevel3AwsData(db);
    await insertJrLevel4AwsData(db);
    await insertJrLevel5AwsData(db);
    await insertJrLevel6AwsData(db);
  }

  static Future<void> _insertMidLevelData(Database db) async {
    await insertMidLevel1AwsData(db);
    await insertMidLevel2AwsData(db);
    await insertMidLevel3AwsData(db);
    await insertMidLevel4AwsData(db);
    await insertMidLevel5AwsData(db);
    await insertMidLevel6AwsData(db);
  }

  static Future<void> _insertSrLevelData(Database db) async {
    await insertSrLevel1AwsData(db);
    await insertSrLevel2AwsData(db);
    await insertSrLevel3AwsData(db);
    await insertSrLevel4AwsData(db);
    await insertSrLevel5AwsData(db);
    await insertSrLevel6AwsData(db);
  }
}
