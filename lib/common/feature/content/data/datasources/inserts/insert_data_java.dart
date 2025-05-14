import 'package:sqflite/sqflite.dart';

class InsertJavaData {
  static Future<void> insertJavaData(Database db) async {
    await _insertJrLevelData(db);
    await _insertMidLevelData(db);
    // await _insertSrLevelData(db);
  }

  static Future<void> _insertJrLevelData(Database db) async {
    await _insertJrLevel1Data(db);
    //await _insertJrLevel2Data(db);
  }

  static Future<void> _insertJrLevel1Data(Database db) async {
    // Ejemplo de inserción para nivel Junior
    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 1,
      'topic': 'Variables',
      'subtopic': 'String',
      'definition': '''
En Java, un String es un objeto que representa una secuencia de caracteres.
Es inmutable, lo que significa que no puede ser modificado después de su creación.
''',
      'code_example': '''
String nombre = "Juan";
String apellido = new String("Pérez");
'''
    });

    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 1,
      'topic': 'Variables',
      'subtopic': 'int',
      'definition': '''
El tipo int en Java es un entero de 32 bits con signo.
Almacena valores desde -2^31 hasta 2^31-1.
''',
      'code_example': '''
int edad = 25;
int cantidad = 1_000_000;
'''
    });
  }

  //---- MID LEVEL ----//

  static Future<void> _insertMidLevelData(Database db) async {
    // Ejemplo de inserción para nivel Junior
    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 1,
      'topic': 'Variables',
      'subtopic': 'String',
      'definition': '''
En Java, un String es un objeto que representa una secuencia de caracteres.
Es inmutable, lo que significa que no puede ser modificado después de su creación.
''',
      'code_example': '''
String nombre = "Juan";
String apellido = new String("Pérez");
'''
    });

    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 1,
      'topic': 'Variables',
      'subtopic': 'int',
      'definition': '''
El tipo int en Java es un entero de 32 bits con signo.
Almacena valores desde -2^31 hasta 2^31-1.
''',
      'code_example': '''
int edad = 25;
int cantidad = 1_000_000;
'''
    });
  }

  //---- SR LEVEL ----//
}
