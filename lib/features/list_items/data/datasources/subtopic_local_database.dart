/* import 'package:flutter/material.dart';
import 'package:rutacode/features/level/data/datasources/level_local_database.dart';
import 'package:sqflite_common/sqlite_api.dart';

class SubtopicLocalContentDatabaseHelper {
  LevelLocalContentDatabaseHelper dbHelper = LevelLocalContentDatabaseHelper();

  Future<void> createSubtopicTable(Database db) async {
    await db.execute('''
        CREATE TABLE subtopic(
          id TEXT,
          topic_id TEXT,
          module TEXT,
          title TEXT,
          PRIMARY KEY (module, topic_id, id), -- Clave primaria compuesta
          FOREIGN KEY (module, topic_id) REFERENCES topic(module, id) ON DELETE CASCADE
        );
      ''');

    insertSubtopicsJr(db);
    insertSubtopicsMid(db);
    insertSubtopicsSr(db);
  }

  Future<void> insertSubtopicsJr(Database db) async {
    try {
      await _insertSubtopicsJrLevel1(db);
      await _insertSubtopicsJrLevel2(db);
      await _insertSubtopicsJrLevel3(db);
      await _insertSubtopicsJrLevel4(db);
      await _insertSubtopicsJrLevel5(db);
      await _insertSubtopicsJrLevel6(db);
      await _insertSubtopicsJrLevel7(db);
      await _insertSubtopicsJrLevel8(db);
      await _insertSubtopicsJrLevel9(db);
    } catch (e) {
      debugPrint("Error inserting subtopics jr: $e");
    }
  }

  Future<void> insertSubtopicsMid(Database db) async {
    try {
      await _insertSubtopicsMidLevel1(db);
      await _insertSubtopicsMidLevel2(db);
      await _insertSubtopicsMidLevel3(db);
      await _insertSubtopicsMidLevel4(db);
      await _insertSubtopicsMidLevel5(db);
      await _insertSubtopicsMidLevel6(db);
      await _insertSubtopicsMidLevel7(db);
      await _insertSubtopicsMidLevel8(db);
      await _insertSubtopicsMidLevel9(db);
      await _insertSubtopicsMidLevel10(db);
    } catch (e) {
      debugPrint("Error inserting subtopics mid: $e");
    }
  }

  Future<void> insertSubtopicsSr(Database db) async {
    try {
      await _insertSubtopicsSrLevel1(db);
      await _insertSubtopicsSrLevel2(db);
      await _insertSubtopicsSrLevel3(db);
      await _insertSubtopicsSrLevel4(db);
      await _insertSubtopicsSrLevel5(db);
      await _insertSubtopicsSrLevel6(db);
    } catch (e) {
      debugPrint("Error inserting subtopics sr: $e");
    }
  }

// ---- Subtopics Jr
  Future<void> _insertSubtopicsJrLevel1(db) async {
    // Topic 1: Variables - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't01l01', // Topic 1 del Nivel 1
      'id': 's01t01l01', // Subtopic 1 del Topic 1
      'module': 'Jr',
      'title': 'var',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l01',
      'id': 's02t01l01',
      'module': 'Jr',
      'title': 'final',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l01',
      'id': 's03t01l01',
      'module': 'Jr',
      'title': 'const',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l01',
      'id': 's04t01l01',
      'module': 'Jr',
      'title': 'int',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l01',
      'id': 's05t01l01',
      'module': 'Jr',
      'title': 'double',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l01',
      'id': 's06t01l01',
      'module': 'Jr',
      'title': 'bool',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l01',
      'id': 's07t01l01',
      'module': 'Jr',
      'title': 'String',
    });

    // Topic 2: Tipos de datos incorporados - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't02l01', // Topic 2 del Nivel 1
      'id': 's01t02l01', // Subtopic 1 del Topic 2
      'module': 'Jr',
      'title': 'Listas',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l01',
      'id': 's02t02l01',
      'module': 'Jr',
      'title': 'Métodos y propiedades de listas',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l01',
      'id': 's03t02l01',
      'module': 'Jr',
      'title': 'Mapas',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l01',
      'id': 's04t02l01',
      'module': 'Jr',
      'title': 'Métodos y propiedades de mapas',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l01',
      'id': 's05t02l01',
      'module': 'Jr',
      'title': 'Sets',
    });

    // Topic 3: Funciones - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't03l01', // Topic 3 del Nivel 1
      'id': 's01t03l01', // Subtopic 1 del Topic 3
      'module': 'Jr',
      'title': 'Introducción a las funciones',
    });

    await db.insert('subtopic', {
      'topic_id': 't03l01',
      'id': 's02t03l01',
      'module': 'Jr',
      'title': 'Declaración y llamada',
    });

    await db.insert('subtopic', {
      'topic_id': 't03l01',
      'id': 's03t03l01',
      'module': 'Jr',
      'title': 'Parámetros y retorno',
    });

    await db.insert('subtopic', {
      'topic_id': 't03l01',
      'id': 's04t03l01',
      'module': 'Jr',
      'title': 'Funciones anónimas y lambdas',
    });

    // Topic 4: Operadores - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't04l01', // Topic 4 del Nivel 1
      'id': 's01t04l01', // Subtopic 1 del Topic 4
      'module': 'Jr',
      'title': 'Operadores Aritméticos: +, -, *, /, %',
    });

    await db.insert('subtopic', {
      'topic_id': 't04l01',
      'id': 's02t04l01',
      'module': 'Jr',
      'title': 'Operadores de Comparación: ==, !=, >, <, >=, <=',
    });

    await db.insert('subtopic', {
      'topic_id': 't04l01',
      'id': 's03t04l01',
      'module': 'Jr',
      'title': 'Operadores Lógicos: &&, ||',
    });

    // Topic 5: Sentencias de control de flujo - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't05l01', // Topic 5 del Nivel 1
      'id': 's01t05l01', // Subtopic 1 del Topic 5
      'module': 'Jr',
      'title': 'if',
    });

    await db.insert('subtopic', {
      'topic_id': 't05l01',
      'id': 's02t05l01',
      'module': 'Jr',
      'title': 'else',
    });

    await db.insert('subtopic', {
      'topic_id': 't05l01',
      'id': 's03t05l01',
      'module': 'Jr',
      'title': 'else if',
    });

    await db.insert('subtopic', {
      'topic_id': 't05l01',
      'id': 's04t05l01',
      'module': 'Jr',
      'title': 'for',
    });

    await db.insert('subtopic', {
      'topic_id': 't05l01',
      'id': 's05t05l01',
      'module': 'Jr',
      'title': 'while',
    });

    await db.insert('subtopic', {
      'topic_id': 't05l01',
      'id': 's06t05l01',
      'module': 'Jr',
      'title': 'do-while',
    });

    await db.insert('subtopic', {
      'topic_id': 't05l01',
      'id': 's07t05l01',
      'module': 'Jr',
      'title': 'switch case',
    });
  }

  Future<void> _insertSubtopicsJrLevel2(db) async {
    // Topic 1: Flutter CLI - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't01l02', // Topic 1 del Nivel 2
      'id': 's01t01l02', // Subtopic 1 del Topic 1
      'module': 'Jr',
      'title': 'Instalación de Flutter CLI',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l02',
      'id': 's02t01l02',
      'module': 'Jr',
      'title': 'Comandos básicos de Flutter CLI',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l02',
      'id': 's03t01l02',
      'module': 'Jr',
      'title': 'Creación de un proyecto Flutter desde la CLI',
    });

    // Topic 2: VS Code - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't02l02', // Topic 2 del Nivel 2
      'id': 's01t02l02', // Subtopic 1 del Topic 2
      'module': 'Jr',
      'title': 'Configuración de VS Code para Flutter',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l02',
      'id': 's02t02l02',
      'module': 'Jr',
      'title': 'Extensiones recomendadas para Flutter',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l02',
      'id': 's03t02l02',
      'module': 'Jr',
      'title': 'Depuración de código en VS Code',
    });

    // Topic 3: Android Studio - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't03l02', // Topic 3 del Nivel 2
      'id': 's01t03l02', // Subtopic 1 del Topic 3
      'module': 'Jr',
      'title': 'Configuración de Android Studio para Flutter',
    });

    await db.insert('subtopic', {
      'topic_id': 't03l02',
      'id': 's02t03l02',
      'module': 'Jr',
      'title': 'Uso del emulador en Android Studio',
    });

    await db.insert('subtopic', {
      'topic_id': 't03l02',
      'id': 's03t03l02',
      'module': 'Jr',
      'title': 'Integración con herramientas de desarrollo',
    });

    // Topic 4: IntelliJ IDEA - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't04l02', // Topic 4 del Nivel 2
      'id': 's01t04l02', // Subtopic 1 del Topic 4
      'module': 'Jr',
      'title': 'Configuración de IntelliJ IDEA para Flutter',
    });

    await db.insert('subtopic', {
      'topic_id': 't04l02',
      'id': 's02t04l02',
      'module': 'Jr',
      'title': 'Comparación entre IntelliJ IDEA y VS Code',
    });

    await db.insert('subtopic', {
      'topic_id': 't04l02',
      'id': 's03t04l02',
      'module': 'Jr',
      'title': 'Depuración en IntelliJ IDEA',
    });
  }

  Future<void> _insertSubtopicsJrLevel3(db) async {
    // Topic 1: Widgets heredados - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't01l03', // Topic 1 del Nivel 3
      'id': 's01t01l03', // Subtopic 1 del Topic 1
      'module': 'Jr',
      'title': 'Introducción a los widgets heredados',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l03',
      'id': 's02t01l03',
      'module': 'Jr',
      'title': 'Uso de widgets heredados en Flutter',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l03',
      'id': 's03t01l03',
      'module': 'Jr',
      'title': 'Diferencias entre widgets heredados y modernos',
    });

    // Topic 2: Widgets sin estado (Stateless) - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't02l03', // Topic 2 del Nivel 3
      'id': 's01t02l03', // Subtopic 1 del Topic 2
      'module': 'Jr',
      'title': 'Creación de widgets Stateless',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l03',
      'id': 's02t02l03',
      'module': 'Jr',
      'title': 'Uso de widgets Stateless en interfaces',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l03',
      'id': 's03t02l03',
      'module': 'Jr',
      'title': 'Ventajas y limitaciones de los widgets Stateless',
    });

    // Topic 3: Widgets con estado (Stateful) - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't03l03', // Topic 3 del Nivel 3
      'id': 's01t03l03', // Subtopic 1 del Topic 3
      'module': 'Jr',
      'title': 'Creación de widgets Stateful',
    });

    await db.insert('subtopic', {
      'topic_id': 't03l03',
      'id': 's02t03l03',
      'module': 'Jr',
      'title': 'Uso de setState para actualizar la interfaz',
    });

    await db.insert('subtopic', {
      'topic_id': 't03l03',
      'id': 's03t03l03',
      'module': 'Jr',
      'title': 'Ciclo de vida de un widget Stateful',
    });

    // Topic 4: Widgets con estilos - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't04l03', // Topic 4 del Nivel 3
      'id': 's01t04l03', // Subtopic 1 del Topic 4
      'module': 'Jr',
      'title': 'Uso de Container y Padding para estilos',
    });

    await db.insert('subtopic', {
      'topic_id': 't04l03',
      'id': 's02t04l03',
      'module': 'Jr',
      'title': 'Personalización de textos con TextStyle',
    });

    await db.insert('subtopic', {
      'topic_id': 't04l03',
      'id': 's03t04l03',
      'module': 'Jr',
      'title': 'Uso de Theme para estilos globales',
    });

    // Topic 5: Widgets Material - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't05l03', // Topic 5 del Nivel 3
      'id': 's01t05l03', // Subtopic 1 del Topic 5
      'module': 'Jr',
      'title': 'Introducción a los widgets Material',
    });

    await db.insert('subtopic', {
      'topic_id': 't05l03',
      'id': 's02t05l03',
      'module': 'Jr',
      'title': 'Uso de AppBar, FloatingActionButton y Drawer',
    });

    await db.insert('subtopic', {
      'topic_id': 't05l03',
      'id': 's03t05l03',
      'module': 'Jr',
      'title': 'Personalización de widgets Material',
    });

    // Topic 6: Widgets Cupertino - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't06l03', // Topic 6 del Nivel 3
      'id': 's01t06l03', // Subtopic 1 del Topic 6
      'module': 'Jr',
      'title': 'Introducción a los widgets Cupertino',
    });

    await db.insert('subtopic', {
      'topic_id': 't06l03',
      'id': 's02t06l03',
      'module': 'Jr',
      'title': 'Uso de CupertinoNavigationBar y CupertinoButton',
    });

    await db.insert('subtopic', {
      'topic_id': 't06l03',
      'id': 's03t06l03',
      'module': 'Jr',
      'title': 'Diferencias entre widgets Material y Cupertino',
    });
  }

  Future<void> _insertSubtopicsJrLevel4(db) async {
    // Topic 1: Fuentes - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't01l04', // Topic 1 del Nivel 4
      'id': 's01t01l04', // Subtopic 1 del Topic 1
      'module': 'Jr',
      'title': 'Agregar fuentes personalizadas a un proyecto Flutter',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l04',
      'id': 's02t01l04',
      'module': 'Jr',
      'title': 'Uso de fuentes en TextStyle',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l04',
      'id': 's03t01l04',
      'module': 'Jr',
      'title': 'Optimización de fuentes para diferentes dispositivos',
    });

    // Topic 2: Imágenes - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't02l04', // Topic 2 del Nivel 4
      'id': 's01t02l04', // Subtopic 1 del Topic 2
      'module': 'Jr',
      'title': 'Agregar imágenes a un proyecto Flutter',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l04',
      'id': 's02t02l04',
      'module': 'Jr',
      'title': 'Uso de Image.asset y Image.network',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l04',
      'id': 's03t02l04',
      'module': 'Jr',
      'title': 'Optimización de imágenes para diferentes resoluciones',
    });

    // Topic 3: Otros tipos de archivos - Subtopics

    await db.insert('subtopic', {
      'topic_id': 't03l04',
      'id': 's01t03l04',
      'module': 'Jr',
      'title': 'Carga de archivos de audio y video',
    });

    await db.insert('subtopic', {
      'topic_id': 't03l04',
      'id': 's02t03l04',
      'module': 'Jr',
      'title': 'Gestión de archivos en el sistema de archivos',
    });
  }

  Future<void> _insertSubtopicsJrLevel5(db) async {
    // Topic 1: Git - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't01l05', // Topic 1 del Nivel 5
      'id': 's01t01l05', // Subtopic 1 del Topic 1
      'module': 'Jr',
      'title': 'Introducción a Git y comandos básicos',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l05',
      'id': 's02t01l05',
      'module': 'Jr',
      'title': 'Creación y gestión de ramas',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l05',
      'id': 's03t01l05',
      'module': 'Jr',
      'title': 'Resolución de conflictos en Git',
    });

    // Topic 2: GitHub - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't02l05', // Topic 2 del Nivel 5
      'id': 's01t02l05', // Subtopic 1 del Topic 2
      'module': 'Jr',
      'title': 'Creación de un repositorio en GitHub',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l05',
      'id': 's02t02l05',
      'module': 'Jr',
      'title': 'Subir y actualizar proyectos en GitHub',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l05',
      'id': 's03t02l05',
      'module': 'Jr',
      'title': 'Uso de Pull Requests y Code Reviews',
    });
  }

  Future<void> _insertSubtopicsJrLevel6(db) async {
    // Topic 1: SQLite - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't01l06', // Topic 1 del Nivel 6
      'id': 's01t01l06', // Subtopic 1 del Topic 1
      'module': 'Jr',
      'title': 'Introducción a SQLite en Flutter',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l06',
      'id': 's02t01l06',
      'module': 'Jr',
      'title': 'Creación y gestión de una base de datos SQLite',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l06',
      'id': 's03t01l06',
      'module': 'Jr',
      'title': 'Consultas básicas y avanzadas en SQLite',
    });

    // Topic 2: Shared Preferences - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't02l06', // Topic 2 del Nivel 6
      'id': 's01t02l06', // Subtopic 1 del Topic 2
      'module': 'Jr',
      'title': 'Introducción a Shared Preferences',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l06',
      'id': 's02t02l06',
      'module': 'Jr',
      'title': 'Almacenamiento de datos simples en Shared Preferences',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l06',
      'id': 's03t02l06',
      'module': 'Jr',
      'title':
          'Uso de Shared Preferences para guardar preferencias del usuario',
    });
  }

  Future<void> _insertSubtopicsJrLevel7(db) async {
    // Topic 1: Programación Orientada a Objetos (POO) - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't01l07', // Topic 1 del Nivel 7
      'id': 's01t01l07', // Subtopic 1 del Topic 1
      'module': 'Jr',
      'title': 'Qué es la Programación Orientada a Objetos (POO)',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l07',
      'id': 's02t01l07',
      'module': 'Jr',
      'title': 'Ventajas de usar POO',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l07',
      'id': 's03t01l07',
      'module': 'Jr',
      'title': 'Conceptos básicos de POO',
    });

    // Topic 2: Clases y objetos - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't02l07', // Topic 2 del Nivel 7
      'id': 's01t02l07', // Subtopic 1 del Topic 2
      'module': 'Jr',
      'title': 'Declaración y definición de clases',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l07',
      'id': 's02t02l07',
      'module': 'Jr',
      'title': 'Instanciación de objetos',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l07',
      'id': 's03t02l07',
      'module': 'Jr',
      'title': 'Constructores y destructores',
    });

    // Topic 3: Pilares de la POO - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't03l07', // Topic 3 del Nivel 7
      'id': 's01t03l07', // Subtopic 1 del Topic 3
      'module': 'Jr',
      'title': 'Abstracción',
    });

    await db.insert('subtopic', {
      'topic_id': 't03l07',
      'id': 's02t03l07',
      'module': 'Jr',
      'title': 'Encapsulamiento',
    });

    await db.insert('subtopic', {
      'topic_id': 't03l07',
      'id': 's03t03l07',
      'module': 'Jr',
      'title': 'Herencia',
    });

    await db.insert('subtopic', {
      'topic_id': 't03l07',
      'id': 's04t03l07',
      'module': 'Jr',
      'title': 'Polimorfismo',
    });

    // Topic 4: Ejemplos y casos de uso - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't04l07', // Topic 4 del Nivel 7
      'id': 's01t04l07', // Subtopic 1 del Topic 4
      'module': 'Jr',
      'title': 'Cambiar el color de un auto',
    });

    await db.insert('subtopic', {
      'topic_id': 't04l07',
      'id': 's02t04l07',
      'module': 'Jr',
      'title': 'Jerarquías de vehículos',
    });

    await db.insert('subtopic', {
      'topic_id': 't04l07',
      'id': 's03t04l07',
      'module': 'Jr',
      'title': 'Implementación de interfaces',
    });
  }

  Future<void> _insertSubtopicsJrLevel8(db) async {
    // Topic 1: Pruebas de widgets - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't01l08', // Topic 1 del Nivel 8
      'id': 's01t01l08', // Subtopic 1 del Topic 1
      'module': 'Jr',
      'title': 'Introducción a las pruebas de widgets',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l08',
      'id': 's02t01l08',
      'module': 'Jr',
      'title': 'Uso de WidgetTester para pruebas de interfaz',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l08',
      'id': 's03t01l08',
      'module': 'Jr',
      'title': 'Pruebas de interacción con widgets',
    });

    // Topic 2: Pruebas unitarias - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't02l08', // Topic 2 del Nivel 8
      'id': 's01t02l08', // Subtopic 1 del Topic 2
      'module': 'Jr',
      'title': 'Introducción a las pruebas unitarias',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l08',
      'id': 's02t02l08',
      'module': 'Jr',
      'title': 'Uso de test y expect en pruebas unitarias',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l08',
      'id': 's03t02l08',
      'module': 'Jr',
      'title': 'Pruebas de funciones y métodos en Dart',
    });
  }

  Future<void> _insertSubtopicsJrLevel9(db) async {
    // Topic 1: App Store - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't01l09', // Topic 1 del Nivel 9
      'id': 's01t01l09', // Subtopic 1 del Topic 1
      'module': 'Jr',
      'title': 'Preparación de una aplicación para la App Store',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l09',
      'id': 's02t01l09',
      'module': 'Jr',
      'title': 'Creación de un certificado de distribución',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l09',
      'id': 's03t01l09',
      'module': 'Jr',
      'title': 'Subida de una aplicación a la App Store',
    });

    // Topic 2: Play Store - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't02l09', // Topic 2 del Nivel 9
      'id': 's01t02l09', // Subtopic 1 del Topic 2
      'module': 'Jr',
      'title': 'Preparación de una aplicación para la Play Store',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l09',
      'id': 's02t02l09',
      'module': 'Jr',
      'title': 'Creación de un keystore para firma',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l09',
      'id': 's03t02l09',
      'module': 'Jr',
      'title': 'Subida de una aplicación a la Play Store',
    });
  }

// ---- Subtopics Mid

  Future<void> _insertSubtopicsMidLevel1(db) async {
    // Topic 1: Introducción a Riverpod - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't01l01', // Topic 1 del Nivel 1
      'id': 's01t01l01', // Subtopic 1 del Topic 1
      'module': 'Mid',
      'title': 'Qué es Riverpod',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l01',
      'id': 's02t01l01',
      'module': 'Mid',
      'title': 'Ventajas de uso',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l01',
      'id': 's03t01l01',
      'module': 'Mid',
      'title': 'Gestionar un estado en Flutter',
    });

    // Topic 2: Tipos de providers - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't02l01', // Topic 2 del Nivel 1
      'id': 's01t02l01', // Subtopic 1 del Topic 2
      'module': 'Mid',
      'title': 'StateProvider',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l01',
      'id': 's02t02l01',
      'module': 'Mid',
      'title': 'NotifierProvider',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l01',
      'id': 's03t02l01',
      'module': 'Mid',
      'title': 'FutureProvider',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l01',
      'id': 's04t02l01',
      'module': 'Mid',
      'title': 'StreamProvider',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l01',
      'id': 's05t02l01',
      'module': 'Mid',
      'title': 'Diferencias entre providers',
    });

    // Topic 3: Notificar cambios de estado - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't03l01', // Topic 3 del Nivel 1
      'id': 's01t03l01', // Subtopic 1 del Topic 3
      'module': 'Mid',
      'title': 'watch',
    });

    await db.insert('subtopic', {
      'topic_id': 't03l01',
      'id': 's02t03l01',
      'module': 'Mid',
      'title': 'read',
    });

    // Topic 4: Ejemplos prácticos y casos de uso - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't04l01', // Topic 4 del Nivel 1
      'id': 's01t04l01', // Subtopic 1 del Topic 4
      'module': 'Mid',
      'title': 'Contador simple con StateProvider',
    });

    await db.insert('subtopic', {
      'topic_id': 't04l01',
      'id': 's02t04l01',
      'module': 'Mid',
      'title': 'Gestión de autenticación con NotifierProvider',
    });
  }

  Future<void> _insertSubtopicsMidLevel2(db) async {
    // Topic 1: Streams - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't01l02', // Topic 1 del Nivel 2
      'id': 's01t01l02', // Subtopic 1 del Topic 1
      'module': 'Mid',
      'title': 'Introducción a los Streams en Dart',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l02',
      'id': 's02t01l02',
      'module': 'Mid',
      'title': 'Uso de StreamControllers y StreamBuilders',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l02',
      'id': 's03t01l02',
      'module': 'Mid',
      'title': 'Transformación de Streams con operadores',
    });

    // Topic 2: Futures - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't02l02', // Topic 2 del Nivel 2
      'id': 's01t02l02', // Subtopic 1 del Topic 2
      'module': 'Mid',
      'title': 'Introducción a los Futures en Dart',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l02',
      'id': 's02t02l02',
      'module': 'Mid',
      'title': 'Uso de async y await para manejar Futures',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l02',
      'id': 's03t02l02',
      'module': 'Mid',
      'title': 'Manejo de errores en Futures',
    });
  }

  Future<void> _insertSubtopicsMidLevel3(db) async {
    // Topic 1: Principios SOLID - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't01l03', // Topic 1 del Nivel 3
      'id': 's01t01l03', // Subtopic 1 del Topic 1
      'module': 'Mid',
      'title': 'Principio de Responsabilidad Única (SRP)',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l03',
      'id': 's02t01l03',
      'module': 'Mid',
      'title': 'Principio Abierto/Cerrado (OCP)',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l03',
      'id': 's03t01l03',
      'module': 'Mid',
      'title': 'Principio de Sustitución de Liskov (LSP)',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l03',
      'id': 's04t01l03',
      'module': 'Mid',
      'title': 'Principio de Segregación de Interfaces (ISP)',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l03',
      'id': 's05t01l03',
      'module': 'Mid',
      'title': 'Principio de Inversión de Dependencias (DIP)',
    });

    // Topic 2: Patrones de diseño - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't02l03', // Topic 2 del Nivel 3
      'id': 's01t02l03', // Subtopic 1 del Topic 2
      'module': 'Mid',
      'title': 'Introducción a los Patrones de Diseño',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l03',
      'id': 's02t02l03',
      'module': 'Mid',
      'title': 'Patrón Singleton en Dart',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l03',
      'id': 's03t02l03',
      'module': 'Mid',
      'title': 'Patrón Factory en Dart',
    });
  }

  Future<void> _insertSubtopicsMidLevel4(db) async {
    // Topic 1: Serialización y deserialización JSON - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't01l04', // Topic 1 del Nivel 4
      'id': 's01t01l04', // Subtopic 1 del Topic 1
      'module': 'Mid',
      'title': 'Introducción a JSON en Dart',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l04',
      'id': 's02t01l04',
      'module': 'Mid',
      'title': 'Serialización de Objetos a JSON',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l04',
      'id': 's03t01l04',
      'module': 'Mid',
      'title': 'Deserialización de JSON a Objetos',
    });

    // Topic 2: APIs RESTful - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't02l04', // Topic 2 del Nivel 4
      'id': 's01t02l04', // Subtopic 1 del Topic 2
      'module': 'Mid',
      'title': 'Introducción a las APIs RESTful',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l04',
      'id': 's02t02l04',
      'module': 'Mid',
      'title': 'Uso de http para consumir APIs RESTful',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l04',
      'id': 's03t02l04',
      'module': 'Mid',
      'title': 'Manejo de Respuestas y Errores en APIs RESTful',
    });
  }

  Future<void> _insertSubtopicsMidLevel5(db) async {
    // Topic 1: Firestore - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't01l05', // Topic 1 del Nivel 5
      'id': 's01t01l05', // Subtopic 1 del Topic 1
      'module': 'Mid',
      'title': 'Introducción a Firestore',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l05',
      'id': 's02t01l05',
      'module': 'Mid',
      'title': 'Creación y Gestión de Colecciones en Firestore',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l05',
      'id': 's03t01l05',
      'module': 'Mid',
      'title': 'Consultas Básicas y Avanzadas en Firestore',
    });

    // Topic 2: Autenticación - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't02l05', // Topic 2 del Nivel 5
      'id': 's01t02l05', // Subtopic 1 del Topic 2
      'module': 'Mid',
      'title': 'Introducción a Firebase Authentication',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l05',
      'id': 's02t02l05',
      'module': 'Mid',
      'title': 'Autenticación con Correo y Contraseña',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l05',
      'id': 's03t02l05',
      'module': 'Mid',
      'title': 'Autenticación con Proveedores Externos (Google, Facebook)',
    });

    // Topic 3: Notificaciones push - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't03l05', // Topic 3 del Nivel 5
      'id': 's01t03l05', // Subtopic 1 del Topic 3
      'module': 'Mid',
      'title': 'Introducción a las Notificaciones Push',
    });

    await db.insert('subtopic', {
      'topic_id': 't03l05',
      'id': 's02t03l05',
      'module': 'Mid',
      'title': 'Configuración de Firebase Cloud Messaging',
    });

    await db.insert('subtopic', {
      'topic_id': 't03l05',
      'id': 's03t03l05',
      'module': 'Mid',
      'title': 'Recepción y Manejo de Notificaciones Push',
    });

    // Topic 4: Configuración remota - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't04l05', // Topic 4 del Nivel 5
      'id': 's01t04l05', // Subtopic 1 del Topic 4
      'module': 'Mid',
      'title': 'Introducción a Firebase Remote Config',
    });

    await db.insert('subtopic', {
      'topic_id': 't04l05',
      'id': 's02t04l05',
      'module': 'Mid',
      'title': 'Configuración de Parámetros Remotos',
    });

    await db.insert('subtopic', {
      'topic_id': 't04l05',
      'id': 's03t04l05',
      'module': 'Mid',
      'title': 'Uso de Remote Config para Personalización en Tiempo Real',
    });

    // Topic 5: Cloud Functions - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't05l05', // Topic 5 del Nivel 5
      'id': 's01t05l05', // Subtopic 1 del Topic 5
      'module': 'Mid',
      'title': 'Introducción a Firebase Cloud Functions',
    });

    await db.insert('subtopic', {
      'topic_id': 't05l05',
      'id': 's02t05l05',
      'module': 'Mid',
      'title': 'Creación y Despliegue de Cloud Functions',
    });

    await db.insert('subtopic', {
      'topic_id': 't05l05',
      'id': 's03t05l05',
      'module': 'Mid',
      'title': 'Uso de Cloud Functions para Lógica del Servidor',
    });
  }

  Future<void> _insertSubtopicsMidLevel6(db) async {
    // Topic 1: Provider - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't01l06', // Topic 1 del Nivel 6
      'id': 's01t01l06', // Subtopic 1 del Topic 1
      'module': 'Mid',
      'title': 'Introducción a Provider',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l06',
      'id': 's02t01l06',
      'module': 'Mid',
      'title': 'Uso de Provider para Gestionar el Estado',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l06',
      'id': 's03t01l06',
      'module': 'Mid',
      'title': 'Combinación de Provider con otros Patrones',
    });

    // Topic 2: Riverpod - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't02l06', // Topic 2 del Nivel 6
      'id': 's01t02l06', // Subtopic 1 del Topic 2
      'module': 'Mid',
      'title': 'Introducción a Riverpod',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l06',
      'id': 's02t02l06',
      'module': 'Mid',
      'title': 'Uso de Riverpod para Gestionar el Estado',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l06',
      'id': 's03t02l06',
      'module': 'Mid',
      'title': 'Diferencias entre Provider y Riverpod',
    });

    // Topic 3: BLoC - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't03l06', // Topic 3 del Nivel 6
      'id': 's01t03l06', // Subtopic 1 del Topic 3
      'module': 'Mid',
      'title': 'Introducción a BLoC',
    });

    await db.insert('subtopic', {
      'topic_id': 't03l06',
      'id': 's02t03l06',
      'module': 'Mid',
      'title': 'Uso de BLoC para Gestionar el Estado',
    });

    await db.insert('subtopic', {
      'topic_id': 't03l06',
      'id': 's03t03l06',
      'module': 'Mid',
      'title': 'Implementación de BLoC en una Aplicación Flutter',
    });

    // Topic 4: GetX - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't04l06', // Topic 4 del Nivel 6
      'id': 's01t04l06', // Subtopic 1 del Topic 4
      'module': 'Mid',
      'title': 'Introducción a GetX',
    });

    await db.insert('subtopic', {
      'topic_id': 't04l06',
      'id': 's02t04l06',
      'module': 'Mid',
      'title': 'Uso de GetX para Gestionar el Estado',
    });

    await db.insert('subtopic', {
      'topic_id': 't04l06',
      'id': 's03t04l06',
      'module': 'Mid',
      'title': 'Ventajas y Desventajas de GetX',
    });
  }

  Future<void> _insertSubtopicsMidLevel7(db) async {
    // Topic 1: Hero - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't01l07', // Topic 1 del Nivel 7
      'id': 's01t01l07', // Subtopic 1 del Topic 1
      'module': 'Mid',
      'title': 'Introducción a las Animaciones Hero',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l07',
      'id': 's02t01l07',
      'module': 'Mid',
      'title': 'Uso de Hero para Transiciones entre Pantallas',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l07',
      'id': 's03t01l07',
      'module': 'Mid',
      'title': 'Personalización de Animaciones Hero',
    });

    // Topic 2: Opacidad - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't02l07', // Topic 2 del Nivel 7
      'id': 's01t02l07', // Subtopic 1 del Topic 2
      'module': 'Mid',
      'title': 'Introducción a las Animaciones de Opacidad',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l07',
      'id': 's02t02l07',
      'module': 'Mid',
      'title': 'Uso de AnimatedOpacity para Transiciones Suaves',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l07',
      'id': 's03t02l07',
      'module': 'Mid',
      'title': 'Combinación de Opacidad con otras Animaciones',
    });

    // Topic 3: Controlador de animaciones - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't03l07', // Topic 3 del Nivel 7
      'id': 's01t03l07', // Subtopic 1 del Topic 3
      'module': 'Mid',
      'title': 'Introducción a los Controladores de Animación',
    });

    await db.insert('subtopic', {
      'topic_id': 't03l07',
      'id': 's02t03l07',
      'module': 'Mid',
      'title': 'Uso de AnimationController para Controlar Animaciones',
    });

    await db.insert('subtopic', {
      'topic_id': 't03l07',
      'id': 's03t03l07',
      'module': 'Mid',
      'title': 'Sincronización de Animaciones con el Estado de la Aplicación',
    });

    // Topic 4: Constructor animado - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't04l07', // Topic 4 del Nivel 7
      'id': 's01t04l07', // Subtopic 1 del Topic 4
      'module': 'Mid',
      'title': 'Introducción a los Constructores Animados',
    });

    await db.insert('subtopic', {
      'topic_id': 't04l07',
      'id': 's02t04l07',
      'module': 'Mid',
      'title': 'Uso de AnimatedBuilder para Crear Animaciones Personalizadas',
    });

    await db.insert('subtopic', {
      'topic_id': 't04l07',
      'id': 's03t04l07',
      'module': 'Mid',
      'title': 'Combinación de Constructores Animados con otros Widgets',
    });

    // Topic 5: Widget animado - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't05l07', // Topic 5 del Nivel 7
      'id': 's01t05l07', // Subtopic 1 del Topic 5
      'module': 'Mid',
      'title': 'Introducción a los Widgets Animados',
    });

    await db.insert('subtopic', {
      'topic_id': 't05l07',
      'id': 's02t05l07',
      'module': 'Mid',
      'title': 'Uso de AnimatedWidget para Crear Animaciones Reutilizables',
    });

    await db.insert('subtopic', {
      'topic_id': 't05l07',
      'id': 's03t05l07',
      'module': 'Mid',
      'title': 'Personalización de Widgets Animados',
    });
  }

  Future<void> _insertSubtopicsMidLevel8(db) async {
    // Topic 1: RxDart - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't01l08', // Topic 1 del Nivel 8
      'id': 's01t01l08', // Subtopic 1 del Topic 1
      'module': 'Mid',
      'title': 'Introducción a RxDart',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l08',
      'id': 's02t01l08',
      'module': 'Mid',
      'title': 'Uso de Streams y Observables en RxDart',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l08',
      'id': 's03t01l08',
      'module': 'Mid',
      'title': 'Combinación de RxDart con BLoC',
    });
  }

  Future<void> _insertSubtopicsMidLevel9(db) async {
    // Topic 1: Fastlane - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't01l09', // Topic 1 del Nivel 9
      'id': 's01t01l09', // Subtopic 1 del Topic 1
      'module': 'Mid',
      'title': 'Introducción a Fastlane',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l09',
      'id': 's02t01l09',
      'module': 'Mid',
      'title': 'Automatización de Despliegues con Fastlane',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l09',
      'id': 's03t01l09',
      'module': 'Mid',
      'title': 'Configuración de Fastlane para iOS y Android',
    });

    // Topic 2: Codemagic - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't02l09', // Topic 2 del Nivel 9
      'id': 's01t02l09', // Subtopic 1 del Topic 2
      'module': 'Mid',
      'title': 'Introducción a Codemagic',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l09',
      'id': 's02t02l09',
      'module': 'Mid',
      'title': 'Configuración de CI/CD con Codemagic',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l09',
      'id': 's03t02l09',
      'module': 'Mid',
      'title': 'Automatización de Pruebas y Despliegues con Codemagic',
    });

    // Topic 3: Bitrise - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't03l09', // Topic 3 del Nivel 9
      'id': 's01t03l09', // Subtopic 1 del Topic 3
      'module': 'Mid',
      'title': 'Introducción a Bitrise',
    });

    await db.insert('subtopic', {
      'topic_id': 't03l09',
      'id': 's02t03l09',
      'module': 'Mid',
      'title': 'Configuración de CI/CD con Bitrise',
    });

    await db.insert('subtopic', {
      'topic_id': 't03l09',
      'id': 's03t03l09',
      'module': 'Mid',
      'title': 'Automatización de Pruebas y Despliegues con Bitrise',
    });

    // Topic 4: GitHub Actions - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't04l09', // Topic 4 del Nivel 9
      'id': 's01t04l09', // Subtopic 1 del Topic 4
      'module': 'Mid',
      'title': 'Introducción a GitHub Actions',
    });

    await db.insert('subtopic', {
      'topic_id': 't04l09',
      'id': 's02t04l09',
      'module': 'Mid',
      'title': 'Configuración de CI/CD con GitHub Actions',
    });

    await db.insert('subtopic', {
      'topic_id': 't04l09',
      'id': 's03t04l09',
      'module': 'Mid',
      'title': 'Automatización de Pruebas y Despliegues con GitHub Actions',
    });

    // Topic 5: Firebase App Distribution - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't05l09', // Topic 5 del Nivel 9
      'id': 's01t05l09', // Subtopic 1 del Topic 5
      'module': 'Mid',
      'title': 'Introducción a Firebase App Distribution',
    });

    await db.insert('subtopic', {
      'topic_id': 't05l09',
      'id': 's02t05l09',
      'module': 'Mid',
      'title': 'Configuración de Firebase App Distribution',
    });

    await db.insert('subtopic', {
      'topic_id': 't05l09',
      'id': 's03t05l09',
      'module': 'Mid',
      'title': 'Distribución de Aplicaciones a Testers',
    });
  }

  Future<void> _insertSubtopicsMidLevel10(db) async {
    // Topic 1: Flutter Inspector - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't01l10', // Topic 1 del Nivel 10
      'id': 's01t01l10', // Subtopic 1 del Topic 1
      'module': 'Mid',
      'title': 'Introducción a Flutter Inspector',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l10',
      'id': 's02t01l10',
      'module': 'Mid',
      'title': 'Uso de Flutter Inspector para Depurar Interfaces',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l10',
      'id': 's03t01l10',
      'module': 'Mid',
      'title': 'Análisis de Widgets y Render Trees con Flutter Inspector',
    });

    // Topic 2: Flutter Outline - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't02l10', // Topic 2 del Nivel 10
      'id': 's01t02l10', // Subtopic 1 del Topic 2
      'module': 'Mid',
      'title': 'Introducción a Flutter Outline',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l10',
      'id': 's02t02l10',
      'module': 'Mid',
      'title':
          'Uso de Flutter Outline para Visualizar la Estructura de Widgets',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l10',
      'id': 's03t02l10',
      'module': 'Mid',
      'title': 'Optimización de Interfaces con Flutter Outline',
    });

    // Topic 3: Asignación de memoria - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't03l10', // Topic 3 del Nivel 10
      'id': 's01t03l10', // Subtopic 1 del Topic 3
      'module': 'Mid',
      'title': 'Introducción a la Asignación de Memoria en Flutter',
    });

    await db.insert('subtopic', {
      'topic_id': 't03l10',
      'id': 's02t03l10',
      'module': 'Mid',
      'title': 'Uso de Herramientas para Monitorear el Uso de Memoria',
    });

    await db.insert('subtopic', {
      'topic_id': 't03l10',
      'id': 's03t03l10',
      'module': 'Mid',
      'title': 'Optimización del Uso de Memoria en Aplicaciones Flutter',
    });
  }

// ---- Subtopics Sr
  Future<void> _insertSubtopicsSrLevel1(db) async {
    // Topic 1: Web Sockets - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't01l01', // Topic 1 del Nivel 1
      'id': 's01t01l01', // Subtopic 1 del Topic 1
      'module': 'Sr',
      'title': 'Introducción a Web Sockets',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l01',
      'id': 's02t01l01',
      'module': 'Sr',
      'title': 'Uso de Web Sockets para Comunicación en Tiempo Real',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l01',
      'id': 's03t01l01',
      'module': 'Sr',
      'title': 'Implementación de Web Sockets en Flutter',
    });

    // Topic 2: GraphQL - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't02l01', // Topic 2 del Nivel 1
      'id': 's01t02l01', // Subtopic 1 del Topic 2
      'module': 'Sr',
      'title': 'Introducción a GraphQL',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l01',
      'id': 's02t02l01',
      'module': 'Sr',
      'title': 'Uso de GraphQL para Consultas y Mutaciones',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l01',
      'id': 's03t02l01',
      'module': 'Sr',
      'title': 'Integración de GraphQL en Aplicaciones Flutter',
    });
  }

  Future<void> _insertSubtopicsSrLevel2(db) async {
    // Topic 1: Firestore (implementaciones avanzadas) - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't01l02', // Topic 1 del Nivel 2
      'id': 's01t01l02', // Subtopic 1 del Topic 1
      'module': 'Sr',
      'title': 'Optimización de Consultas en Firestore',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l02',
      'id': 's02t01l02',
      'module': 'Sr',
      'title': 'Uso de Transacciones y Operaciones Atómicas',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l02',
      'id': 's03t01l02',
      'module': 'Sr',
      'title': 'Seguridad y Reglas en Firestore',
    });

    // Topic 2: Cloud Functions (optimización y seguridad) - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't02l02', // Topic 2 del Nivel 2
      'id': 's01t02l02', // Subtopic 1 del Topic 2
      'module': 'Sr',
      'title': 'Optimización de Cloud Functions para Escalabilidad',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l02',
      'id': 's02t02l02',
      'module': 'Sr',
      'title': 'Uso de Cloud Functions para Procesamiento en Segundo Plano',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l02',
      'id': 's03t02l02',
      'module': 'Sr',
      'title': 'Seguridad en Cloud Functions',
    });
  }

  Future<void> _insertSubtopicsSrLevel3(db) async {
    // Topic 1: Animaciones curvas - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't01l03', // Topic 1 del Nivel 3
      'id': 's01t01l03', // Subtopic 1 del Topic 1
      'module': 'Sr',
      'title': 'Introducción a las Animaciones Curvas',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l03',
      'id': 's02t01l03',
      'module': 'Sr',
      'title': 'Uso de Curvas Personalizadas para Animaciones',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l03',
      'id': 's03t01l03',
      'module': 'Sr',
      'title': 'Combinación de Animaciones Curvas con otros Efectos',
    });
  }

  Future<void> _insertSubtopicsSrLevel4(db) async {
    // Topic 1: Render Objects - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't01l04', // Topic 1 del Nivel 4
      'id': 's01t01l04', // Subtopic 1 del Topic 1
      'module': 'Sr',
      'title': 'Introducción a los Render Objects',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l04',
      'id': 's02t01l04',
      'module': 'Sr',
      'title': 'Uso de Render Objects para Crear Widgets Personalizados',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l04',
      'id': 's03t01l04',
      'module': 'Sr',
      'title': 'Optimización de Render Objects para Rendimiento',
    });

    // Topic 2: 3 Árboles (3 Trees) - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't02l04', // Topic 2 del Nivel 4
      'id': 's01t02l04', // Subtopic 1 del Topic 2
      'module': 'Sr',
      'title': 'Introducción a los 3 Árboles de Flutter',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l04',
      'id': 's02t02l04',
      'module': 'Sr',
      'title': 'Uso de los 3 Árboles para Depurar Interfaces',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l04',
      'id': 's03t02l04',
      'module': 'Sr',
      'title': 'Optimización de Interfaces con los 3 Árboles',
    });

    // Topic 3: Inmutabilidad - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't03l04', // Topic 3 del Nivel 4
      'id': 's01t03l04', // Subtopic 1 del Topic 3
      'module': 'Sr',
      'title': 'Introducción a la Inmutabilidad en Flutter',
    });

    await db.insert('subtopic', {
      'topic_id': 't03l04',
      'id': 's02t03l04',
      'module': 'Sr',
      'title': 'Uso de Inmutabilidad para Mejorar el Rendimiento',
    });

    await db.insert('subtopic', {
      'topic_id': 't03l04',
      'id': 's03t03l04',
      'module': 'Sr',
      'title': 'Comparación entre Inmutabilidad y Mutabilidad',
    });
  }

  Future<void> _insertSubtopicsSrLevel5(db) async {
    // Topic 1: CI/CD Avanzado - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't01l05', // Topic 1 del Nivel 5
      'id': 's01t01l05', // Subtopic 1 del Topic 1
      'module': 'Sr',
      'title': 'Introducción a CI/CD Avanzado',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l05',
      'id': 's02t01l05',
      'module': 'Sr',
      'title': 'Uso de Protocolos Avanzados para Automatización',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l05',
      'id': 's03t01l05',
      'module': 'Sr',
      'title': 'Optimización de Pipelines de CI/CD',
    });
  }

  Future<void> _insertSubtopicsSrLevel6(db) async {
    // Topic 1: Segment - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't01l06', // Topic 1 del Nivel 6
      'id': 's01t01l06', // Subtopic 1 del Topic 1
      'module': 'Sr',
      'title': 'Introducción a Segment',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l06',
      'id': 's02t01l06',
      'module': 'Sr',
      'title': 'Uso de Segment para Seguimiento de Eventos',
    });

    await db.insert('subtopic', {
      'topic_id': 't01l06',
      'id': 's03t01l06',
      'module': 'Sr',
      'title': 'Integración de Segment en Aplicaciones Flutter',
    });

    // Topic 2: Mix Panel - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't02l06', // Topic 2 del Nivel 6
      'id': 's01t02l06', // Subtopic 1 del Topic 2
      'module': 'Sr',
      'title': 'Introducción a Mix Panel',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l06',
      'id': 's02t02l06',
      'module': 'Sr',
      'title': 'Uso de Mix Panel para Análisis de Usuarios',
    });

    await db.insert('subtopic', {
      'topic_id': 't02l06',
      'id': 's03t02l06',
      'module': 'Sr',
      'title': 'Integración de Mix Panel en Aplicaciones Flutter',
    });

    // Topic 3: Firebase Analytics - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't03l06', // Topic 3 del Nivel 6
      'id': 's01t03l06', // Subtopic 1 del Topic 3
      'module': 'Sr',
      'title': 'Introducción a Firebase Analytics',
    });

    await db.insert('subtopic', {
      'topic_id': 't03l06',
      'id': 's02t03l06',
      'module': 'Sr',
      'title': 'Uso de Firebase Analytics para Seguimiento de Eventos',
    });

    await db.insert('subtopic', {
      'topic_id': 't03l06',
      'id': 's03t03l06',
      'module': 'Sr',
      'title': 'Personalización de Eventos en Firebase Analytics',
    });

    // Topic 4: Google Analytics - Subtopics
    await db.insert('subtopic', {
      'topic_id': 't04l06', // Topic 4 del Nivel 6
      'id': 's01t04l06', // Subtopic 1 del Topic 4
      'module': 'Sr',
      'title': 'Introducción a Google Analytics',
    });

    await db.insert('subtopic', {
      'topic_id': 't04l06',
      'id': 's02t04l06',
      'module': 'Sr',
      'title': 'Uso de Google Analytics para Análisis de Usuarios',
    });

    await db.insert('subtopic', {
      'topic_id': 't04l06',
      'id': 's03t04l06',
      'module': 'Sr',
      'title': 'Integración de Google Analytics en Aplicaciones Flutter',
    });
  }
}
 */