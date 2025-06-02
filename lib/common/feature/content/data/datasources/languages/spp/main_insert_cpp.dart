import 'package:rutacode/common/feature/content/data/datasources/languages/spp/insert_jr_cpp.dart';
import 'package:rutacode/common/feature/content/data/datasources/languages/spp/insert_mid_cpp.dart';
import 'package:rutacode/common/feature/content/data/datasources/languages/spp/insert_sr_cpp.dart';
import 'package:sqflite/sqflite.dart';

class InsertCppData {
  static Future<void> insertCppData(Database db) async {
    await _insertCppJrLevelData(db);
    await _insertCppMidLevelData(db);
    await _insertCppSrLevelData(db);
  }

  static Future<void> _insertCppJrLevelData(Database db) async {
    await insertJrLevel1DataCpp(db);
    await insertJrLevel2DataCpp(db);
    await insertJrLevel3DataCpp(db);
    await insertJrLevel4DataCpp(db);
    await insertJrLevel5DataCpp(db);
    await insertJrLevel6DataCpp(db);
    await insertJrLevel7DataCpp(db);
    await insertJrLevel8DataCpp(db);
  }

  static Future<void> _insertCppMidLevelData(Database db) async {}

  static Future<void> _insertCppSrLevelData(Database db) async {
    await insertSrLevel1DataCpp(db);
    await insertSrLevel2DataCpp(db);
    await insertSrLevel3DataCpp(db);
    await insertSrLevel4DataCpp(db);
    await insertSrLevel5DataCpp(db);
  }
}
