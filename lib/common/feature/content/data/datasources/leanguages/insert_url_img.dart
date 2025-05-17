import 'package:rutacode/common/feature/content/data/datasources/db_helper.dart';

class InsertLanguageImages {
  static Future<void> insertImages() async {
    final db = await LocalContentDatabaseHelper().getDatabase();

    final List<Map<String, dynamic>> imageData = [
      {
        'language': 'Java',
        'ur_img': 'https://example.com/java.png',
      },
      {
        'language': 'Python',
        'ur_img': 'https://example.com/python.png',
      },
      {
        'language': 'JavaScript',
        'ur_img': 'https://example.com/python.png',
      },
    ];

    // Utiliza una transacción para insertar múltiples registros de manera eficiente
    await db.transaction((txn) async {
      for (var data in imageData) {
        await txn.insert('leanguage_img', data);
      }
    });
  }
}
