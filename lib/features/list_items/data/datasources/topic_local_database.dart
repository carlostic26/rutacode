/* import 'package:flutter/material.dart';
import 'package:rutacode/features/level/data/datasources/level_local_database.dart';
import 'package:sqflite_common/sqlite_api.dart';

class TopicLocalContentDatabaseHelper {
  LevelLocalContentDatabaseHelper dbHelper = LevelLocalContentDatabaseHelper();

  Future<void> createTopicTable(Database db) async {
    await db.execute('''
      CREATE TABLE topic(
        id TEXT,
        module TEXT,
        level_id INTEGER,
        title TEXT,
        PRIMARY KEY (module, level_id, id), -- Clave primaria compuesta
        FOREIGN KEY (module, level_id) REFERENCES level(module, id) ON DELETE CASCADE
      );
    ''');

    await insertTopicsJr(db);
    await insertTopicsMid(db);
    await insertTopicsSr(db);
  }

  Future<void> insertTopicsJr(Database db) async {
    try {
      await _insertTopicsLevel1Jr(db);
      await _insertTopicsLevel2Jr(db);
      await _insertTopicsLevel3Jr(db);
      await _insertTopicsLevel4Jr(db);
      await _insertTopicsLevel5Jr(db);
      await _insertTopicsLevel6Jr(db);
      await _insertTopicsLevel7Jr(db);
      await _insertTopicsLevel8Jr(db);
      await _insertTopicsLevel9Jr(db);
    } catch (e) {
      debugPrint("Error inserting topics jr: $e");
    }
  }

  Future<void> insertTopicsMid(Database db) async {
    try {
      await _insertTopicsLevel1Mid(db);
      await _insertTopicsLevel2Mid(db);
      await _insertTopicsLevel3Mid(db);
      await _insertTopicsLevel4Mid(db);
      await _insertTopicsLevel5Mid(db);
      await _insertTopicsLevel6Mid(db);
      await _insertTopicsLevel7Mid(db);
      await _insertTopicsLevel8Mid(db);
      await _insertTopicsLevel9Mid(db);
      await _insertTopicsLevel10Mid(db);
    } catch (e) {
      debugPrint("Error inserting topics mid: $e");
    }
  }

  Future<void> insertTopicsSr(Database db) async {
    try {
      await _insertTopicsLevel1Sr(db);
      await _insertTopicsLevel2Sr(db);
      await _insertTopicsLevel3Sr(db);
      await _insertTopicsLevel4Sr(db);
      await _insertTopicsLevel5Sr(db);
      await _insertTopicsLevel6Sr(db);
    } catch (e) {
      debugPrint("Error inserting topics sr: $e");
    }
  }

  //TODO: NOS FALTA AGREGAR LOS SUBTOPIC PARTIENDO DE ESTE ARCHIVO DE DART que fue donde quedamoscon deepseek
  // se debe pasar el archivo de subtopic corregido y que deepseek complete respecto a este archivo

// ---- Jr

  Future<void> _insertTopicsLevel1Jr(db) async {
    await db.insert('topic', {
      'id': 't01l01',
      'module': 'Jr',
      'level_id': 1,
      'title': 'Variables',
    });

    await db.insert('topic', {
      'id': 't02l01', // topic 02 - level 01
      'module': 'Jr',
      'level_id': 1,
      'title': 'Tipos de datos incorporados',
    });

    await db.insert('topic', {
      'id': 't03l01', // topic 03 - level 01
      'module': 'Jr',
      'level_id': 1,
      'title': 'Funciones',
    });

    await db.insert('topic', {
      'id': 't04l01', // topic 04 - level 01
      'module': 'Jr',
      'level_id': 1,
      'title': 'Operadores',
    });

    await db.insert('topic', {
      'id': 't05l01', // topic 05 - level 01
      'module': 'Jr',
      'level_id': 1,
      'title': 'Sentencias de control de flujo',
    });
  }

  Future<void> _insertTopicsLevel2Jr(db) async {
    await db.insert('topic', {
      'id': 't01l02', // topic 01 - level 02
      'module': 'Jr',
      'level_id': 2,
      'title': 'Flutter CLI',
    });

    await db.insert('topic', {
      'id': 't02l02', // topic 02 - level 02
      'module': 'Jr',
      'level_id': 2,
      'title': 'VS Code',
    });

    await db.insert('topic', {
      'id': 't03l02', // topic 03 - level 02
      'module': 'Jr',
      'level_id': 2,
      'title': 'Android Studio',
    });

    await db.insert('topic', {
      'id': 't04l02', // topic 04 - level 02
      'module': 'Jr',
      'level_id': 2,
      'title': 'IntelliJ IDEA',
    });
  }

  Future<void> _insertTopicsLevel3Jr(db) async {
    await db.insert('topic', {
      'id': 't01l03', // topic 01 - level 03
      'module': 'Jr',
      'level_id': 3,
      'title': 'Widgets heredados',
    });

    await db.insert('topic', {
      'id': 't02l03', // topic 02 - level 03
      'module': 'Jr',
      'level_id': 3,
      'title': 'Widgets sin estado (Stateless)',
    });

    await db.insert('topic', {
      'id': 't03l03', // topic 03 - level 03
      'module': 'Jr',
      'level_id': 3,
      'title': 'Widgets con estado (Stateful)',
    });

    await db.insert('topic', {
      'id': 't04l03', // topic 04 - level 03
      'module': 'Jr',
      'level_id': 3,
      'title': 'Widgets con estilos',
    });

    await db.insert('topic', {
      'id': 't05l03', // topic 05 - level 03
      'module': 'Jr',
      'level_id': 3,
      'title': 'Widgets Material',
    });

    await db.insert('topic', {
      'id': 't06l03', // topic 06 - level 03
      'module': 'Jr',
      'level_id': 3,
      'title': 'Widgets Cupertino',
    });
  }

  Future<void> _insertTopicsLevel4Jr(db) async {
    await db.insert('topic', {
      'id': 't01l04', // topic 01 - level 04
      'module': 'Jr',
      'level_id': 4,
      'title': 'Fuentes',
    });

    await db.insert('topic', {
      'id': 't02l04', // topic 02 - level 04
      'module': 'Jr',
      'level_id': 4,
      'title': 'Imágenes',
    });

    await db.insert('topic', {
      'id': 't03l04', // topic 03 - level 04
      'module': 'Jr',
      'level_id': 4,
      'title': 'Otros tipos de archivos',
    });
  }

  Future<void> _insertTopicsLevel5Jr(db) async {
    await db.insert('topic', {
      'id': 't01l05', // topic 01 - level 05
      'module': 'Jr',
      'level_id': 5,
      'title': 'Git',
    });

    await db.insert('topic', {
      'id': 't02l05', // topic 02 - level 05
      'module': 'Jr',
      'level_id': 5,
      'title': 'GitHub',
    });
  }

  Future<void> _insertTopicsLevel6Jr(db) async {
    await db.insert('topic', {
      'id': 't01l06', // topic 01 - level 06
      'module': 'Jr',
      'level_id': 6,
      'title': 'SQLite',
    });

    await db.insert('topic', {
      'id': 't02l06', // topic 02 - level 06
      'module': 'Jr',
      'level_id': 6,
      'title': 'Shared Preferences',
    });
  }

  Future<void> _insertTopicsLevel7Jr(db) async {
    await db.insert('topic', {
      'id': 't01l07', // topic 01 - level 07
      'module': 'Jr',
      'level_id': 7,
      'title': 'Introducción a la POO',
    });

    await db.insert('topic', {
      'id': 't02l07', // topic 02 - level 07
      'module': 'Jr',
      'level_id': 7,
      'title': 'Clases y objetos',
    });

    await db.insert('topic', {
      'id': 't03l07', // topic 03 - level 07
      'module': 'Jr',
      'level_id': 7,
      'title': 'Pilares de la POO',
    });

    await db.insert('topic', {
      'id': 't04l07', // topic 04 - level 07
      'module': 'Jr',
      'level_id': 7,
      'title': 'Ejemplos y casos de uso',
    });
  }

  Future<void> _insertTopicsLevel8Jr(db) async {
    await db.insert('topic', {
      'id': 't01l08', // topic 01 - level 08
      'module': 'Jr',
      'level_id': 8,
      'title': 'Pruebas de widgets',
    });

    await db.insert('topic', {
      'id': 't02l08', // topic 02 - level 08
      'module': 'Jr',
      'level_id': 8,
      'title': 'Pruebas unitarias',
    });
  }

  Future<void> _insertTopicsLevel9Jr(db) async {
    await db.insert('topic', {
      'id': 't01l09', // topic 01 - level 09
      'module': 'Jr',
      'level_id': 9,
      'title': 'App Store',
    });

    await db.insert('topic', {
      'id': 't02l09', // topic 02 - level 09
      'module': 'Jr',
      'level_id': 9,
      'title': 'Play Store',
    });
  }

// ---- Mid

  Future<void> _insertTopicsLevel1Mid(db) async {
    await db.insert('topic', {
      'id': 't01l01', // topic 01 - level 01
      'module': 'Mid',
      'level_id': 1,
      'title': 'Introducción a Riverpod',
    });

    await db.insert('topic', {
      'id': 't02l01', // topic 02 - level 01
      'module': 'Mid',
      'level_id': 1,
      'title': 'Tipos de providers',
    });

    await db.insert('topic', {
      'id': 't03l01', // topic 03 - level 01
      'module': 'Mid',
      'level_id': 1,
      'title': 'Notificar cambios de estado',
    });

    await db.insert('topic', {
      'id': 't04l01', // topic 04 - level 01
      'module': 'Mid',
      'level_id': 1,
      'title': 'Ejemplos prácticos y casos de uso',
    });
  }

  Future<void> _insertTopicsLevel2Mid(db) async {
    await db.insert('topic', {
      'id': 't01l02', // topic 01 - level 02
      'module': 'Mid',
      'level_id': 2,
      'title': 'Streams',
    });

    await db.insert('topic', {
      'id': 't02l02', // topic 02 - level 02
      'module': 'Mid',
      'level_id': 2,
      'title': 'Futures',
    });
  }

  Future<void> _insertTopicsLevel3Mid(db) async {
    await db.insert('topic', {
      'id': 't01l03', // topic 01 - level 03
      'module': 'Mid',
      'level_id': 3,
      'title': 'Principios SOLID',
    });

    await db.insert('topic', {
      'id': 't02l03', // topic 02 - level 03
      'module': 'Mid',
      'level_id': 3,
      'title': 'Patrones de diseño',
    });
  }

  Future<void> _insertTopicsLevel4Mid(db) async {
    await db.insert('topic', {
      'id': 't01l04', // topic 01 - level 04
      'module': 'Mid',
      'level_id': 4,
      'title': 'Serialización y deserialización JSON',
    });

    await db.insert('topic', {
      'id': 't02l04', // topic 02 - level 04
      'module': 'Mid',
      'level_id': 4,
      'title': 'APIs RESTful',
    });
  }

  Future<void> _insertTopicsLevel5Mid(db) async {
    await db.insert('topic', {
      'id': 't01l05', // topic 01 - level 05
      'module': 'Mid',
      'level_id': 5,
      'title': 'Firestore',
    });

    await db.insert('topic', {
      'id': 't02l05', // topic 02 - level 05
      'module': 'Mid',
      'level_id': 5,
      'title': 'Autenticación',
    });

    await db.insert('topic', {
      'id': 't03l05', // topic 03 - level 05
      'module': 'Mid',
      'level_id': 5,
      'title': 'Notificaciones push',
    });

    await db.insert('topic', {
      'id': 't04l05', // topic 04 - level 05
      'module': 'Mid',
      'level_id': 5,
      'title': 'Configuración remota',
    });

    await db.insert('topic', {
      'id': 't05l05', // topic 05 - level 05
      'module': 'Mid',
      'level_id': 5,
      'title': 'Cloud Functions',
    });
  }

  Future<void> _insertTopicsLevel6Mid(db) async {
    await db.insert('topic', {
      'id': 't01l06', // topic 01 - level 06
      'module': 'Mid',
      'level_id': 6,
      'title': 'Provider',
    });

    await db.insert('topic', {
      'id': 't02l06', // topic 02 - level 06
      'module': 'Mid',
      'level_id': 6,
      'title': 'Riverpod',
    });

    await db.insert('topic', {
      'id': 't03l06', // topic 03 - level 06
      'module': 'Mid',
      'level_id': 6,
      'title': 'BLoC',
    });

    await db.insert('topic', {
      'id': 't04l06', // topic 04 - level 06
      'module': 'Mid',
      'level_id': 6,
      'title': 'GetX',
    });
  }

  Future<void> _insertTopicsLevel7Mid(db) async {
    await db.insert('topic', {
      'id': 't01l07', // topic 01 - level 07
      'module': 'Mid',
      'level_id': 7,
      'title': 'Hero',
    });

    await db.insert('topic', {
      'id': 't02l07', // topic 02 - level 07
      'module': 'Mid',
      'level_id': 7,
      'title': 'Opacidad',
    });

    await db.insert('topic', {
      'id': 't03l07', // topic 03 - level 07
      'module': 'Mid',
      'level_id': 7,
      'title': 'Controlador de animaciones',
    });

    await db.insert('topic', {
      'id': 't04l07', // topic 04 - level 07
      'module': 'Mid',
      'level_id': 7,
      'title': 'Constructor animado',
    });

    await db.insert('topic', {
      'id': 't05l07', // topic 05 - level 07
      'module': 'Mid',
      'level_id': 7,
      'title': 'Widget animado',
    });
  }

  Future<void> _insertTopicsLevel8Mid(db) async {
    await db.insert('topic', {
      'id': 't01l08', // topic 01 - level 08
      'module': 'Mid',
      'level_id': 8,
      'title': 'RxDart',
    });
  }

  Future<void> _insertTopicsLevel9Mid(db) async {
    await db.insert('topic', {
      'id': 't01l09', // topic 01 - level 09
      'module': 'Mid',
      'level_id': 9,
      'title': 'Fastlane',
    });

    await db.insert('topic', {
      'id': 't02l09', // topic 02 - level 09
      'module': 'Mid',
      'level_id': 9,
      'title': 'Codemagic',
    });

    await db.insert('topic', {
      'id': 't03l09', // topic 03 - level 09
      'module': 'Mid',
      'level_id': 9,
      'title': 'Bitrise',
    });

    await db.insert('topic', {
      'id': 't04l09', // topic 04 - level 09
      'module': 'Mid',
      'level_id': 9,
      'title': 'GitHub Actions',
    });

    await db.insert('topic', {
      'id': 't05l09', // topic 05 - level 09
      'module': 'Mid',
      'level_id': 9,
      'title': 'Firebase App Distribution',
    });
  }

  Future<void> _insertTopicsLevel10Mid(db) async {
    await db.insert('topic', {
      'id': 't01l10', // topic 01 - level 10
      'module': 'Mid',
      'level_id': 10,
      'title': 'Flutter Inspector',
    });

    await db.insert('topic', {
      'id': 't02l10', // topic 02 - level 10
      'module': 'Mid',
      'level_id': 10,
      'title': 'Flutter Outline',
    });

    await db.insert('topic', {
      'id': 't03l10', // topic 03 - level 10
      'module': 'Mid',
      'level_id': 10,
      'title': 'Asignación de memoria',
    });
  }

// ---- Sr

  Future<void> _insertTopicsLevel1Sr(db) async {
    await db.insert('topic', {
      'id': 't01l01', // topic 01 - level 01
      'module': 'Sr',
      'level_id': 1,
      'title': 'Web Sockets',
    });

    await db.insert('topic', {
      'id': 't02l01', // topic 02 - level 01
      'module': 'Sr',
      'level_id': 1,
      'title': 'GraphQL',
    });
  }

  Future<void> _insertTopicsLevel2Sr(db) async {
    await db.insert('topic', {
      'id': 't01l02', // topic 01 - level 02
      'module': 'Sr',
      'level_id': 2,
      'title': 'Firestore (implementaciones avanzadas)',
    });

    await db.insert('topic', {
      'id': 't02l02', // topic 02 - level 02
      'module': 'Sr',
      'level_id': 2,
      'title': 'Cloud Functions (optimización y seguridad)',
    });
  }

  Future<void> _insertTopicsLevel3Sr(db) async {
    await db.insert('topic', {
      'id': 't01l03', // topic 01 - level 03
      'module': 'Sr',
      'level_id': 3,
      'title': 'Animaciones curvas',
    });
  }

  Future<void> _insertTopicsLevel4Sr(db) async {
    await db.insert('topic', {
      'id': 't01l04', // topic 01 - level 04
      'module': 'Sr',
      'level_id': 4,
      'title': 'Render Objects',
    });

    await db.insert('topic', {
      'id': 't02l04', // topic 02 - level 04
      'module': 'Sr',
      'level_id': 4,
      'title': '3 Árboles (3 Trees)',
    });

    await db.insert('topic', {
      'id': 't03l04', // topic 03 - level 04
      'module': 'Sr',
      'level_id': 4,
      'title': 'Inmutabilidad',
    });
  }

  Future<void> _insertTopicsLevel5Sr(db) async {
    await db.insert('topic', {
      'id': 't01l05', // topic 01 - level 05
      'module': 'Sr',
      'level_id': 5,
      'title': 'Directrices y protocolos avanzados',
    });
  }

  Future<void> _insertTopicsLevel6Sr(db) async {
    await db.insert('topic', {
      'id': 't01l06', // topic 01 - level 06
      'module': 'Sr',
      'level_id': 6,
      'title': 'Segment',
    });

    await db.insert('topic', {
      'id': 't02l06', // topic 02 - level 06
      'module': 'Sr',
      'level_id': 6,
      'title': 'Mix Panel',
    });

    await db.insert('topic', {
      'id': 't03l06', // topic 03 - level 06
      'module': 'Sr',
      'level_id': 6,
      'title': 'Firebase Analytics',
    });

    await db.insert('topic', {
      'id': 't04l06', // topic 04 - level 06
      'module': 'Sr',
      'level_id': 6,
      'title': 'Google Analytics',
    });
  }
}
 */