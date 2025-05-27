/* import 'package:sqflite/sqflite.dart';

class LevelLocalContentDatabaseHelper {
  Future<void> createLevelTable(Database db) async {
    await db.execute('''
        CREATE TABLE level(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          module TEXT,
          num_order INTEGER,
          title TEXT,
          description TEXT,
          points INTEGER,
          is_completed INTEGER
        );
      ''');

    await _insertLevelsJr(db);
    await _insertLevelsMid(db);
    await _insertLevelsSr(db);
  }

  //NOTE: No es posible asignar points y is_completed en la creación de la tabla porque se espera actualizaciones en el futuro
  // asi que si se agregan mas niveles, se deben agregar manualmente los puntos y si se completaron o no por el usuario

  Future<void> _insertLevelsJr(db) async {
    await db.insert('level', {
      'module': 'Jr',
      'num_order': 1,
      'title': 'Básicos de Dart',
      'description':
          "Explora la sintaxis básica de Dart, incluyendo la declaración de variables, tipos de datos primitivos y la estructura básica de un programa. Este es el punto de partida para escribir código funcional en Dart.",
      'points': 0,
      'is_completed': 1,
    });

    await db.insert('level', {
      'module': 'Jr',
      'num_order': 2,
      'title': 'Configuración del Entorno de Desarrollo',
      'description':
          "Descubre cómo configurar tu entorno de desarrollo con Flutter CLI, VS Code, Android Studio o IntelliJ IDEA. Repasa cómo gestionar proyectos y ejecutar aplicaciones en diferentes dispositivos.",
      'points': 0,
      'is_completed': 1,
    });

    await db.insert('level', {
      'module': 'Jr',
      'num_order': 3,
      'title': 'Tipos de Widgets',
      'description':
          "Revisa los widgets básicos de Flutter, como Stateless y Stateful widgets, y cómo usarlos para construir interfaces de usuario. También explora widgets Material y Cupertino para diseños específicos de plataforma.",
      'points': 0,
      'is_completed': 1,
    });

    await db.insert('level', {
      'module': 'Jr',
      'num_order': 4,
      'title': 'Trabajo con Activos (Assets)',
      'description':
          "Explora cómo gestionar activos como fuentes, imágenes y otros archivos en tu aplicación Flutter. Repasa cómo cargar y usar estos recursos en tus proyectos.",
      'points': 0,
      'is_completed': 1,
    });

    await db.insert('level', {
      'module': 'Jr',
      'num_order': 5,
      'title': 'Sistemas de Control de Versiones',
      'description':
          "Descubre el uso de Git y GitHub para gestionar el control de versiones en tus proyectos. Repasa cómo colaborar en equipo y mantener un historial de cambios.",
      'points': 0,
      'is_completed': 1,
    });

    await db.insert('level', {
      'module': 'Jr',
      'num_order': 6,
      'title': 'Almacenamiento',
      'description':
          "Revisa cómo almacenar datos localmente en el dispositivo usando SQLite y Shared Preferences. Explora cómo guardar preferencias del usuario o datos en caché.",
      'points': 0,
      'is_completed': 1,
    });

    await db.insert('level', {
      'module': 'Jr',
      'num_order': 7,
      'title': 'Programación Orientada a Objetos',
      'description':
          "Repasa los conceptos básicos de la programación orientada a objetos (POO) en Dart, incluyendo clases, objetos, herencia y polimorfismo.",
      'points': 0,
      'is_completed': 1,
    });

    await db.insert('level', {
      'module': 'Jr',
      'num_order': 8,
      'title': 'Pruebas (Testing)',
      'description':
          "Explora las pruebas unitarias y de widgets para asegurar la calidad de tu código. Descubre cómo escribir pruebas que validen el comportamiento de tu aplicación.",
      'points': 0,
      'is_completed': 1,
    });

    await db.insert('level', {
      'module': 'Jr',
      'num_order': 9,
      'title': 'Despliegue de Aplicaciones',
      'description':
          "Revisa los pasos necesarios para desplegar aplicaciones en Google Play Store y Apple App Store. Explora cómo publicar tu aplicación en las tiendas oficiales.",
      'points': 0,
      'is_completed': 1,
    });
  }

  Future<void> _insertLevelsMid(db) async {
    await db.insert('level', {
      'module': 'Mid',
      'num_order': 1,
      'title': 'Gestión de Estado con Riverpod',
      'description':
          "Explora cómo gestionar el estado en Flutter usando Riverpod, un enfoque moderno y eficiente para la gestión de estado en aplicaciones Flutter.",
      'points': 0,
      'is_completed': 0,
    });

    await db.insert('level', {
      'module': 'Mid',
      'num_order': 2,
      'title': 'Dart Avanzado',
      'description':
          "Descubre conceptos avanzados de Dart, como Streams, Futures y programación asíncrona, para manejar operaciones complejas en tus aplicaciones.",
      'points': 0,
      'is_completed': 0,
    });

    await db.insert('level', {
      'module': 'Mid',
      'num_order': 3,
      'title': 'Principios de Diseño',
      'description':
          "Revisa los principios SOLID y otros conceptos de diseño de software para escribir código más modular, mantenible y escalable.",
      'points': 0,
      'is_completed': 0,
    });

    await db.insert('level', {
      'module': 'Mid',
      'num_order': 4,
      'title': 'Trabajo con APIs',
      'description':
          "Explora cómo consumir APIs RESTful en tu aplicación Flutter. Repasa la serialización y deserialización de JSON para manejar datos de servidores externos.",
      'points': 0,
      'is_completed': 0,
    });

    await db.insert('level', {
      'module': 'Mid',
      'num_order': 5,
      'title': 'Integración con Firebase',
      'description':
          "Descubre cómo integrar Firebase en tu aplicación para usar servicios como Firestore, autenticación, notificaciones push y Cloud Functions.",
      'points': 0,
      'is_completed': 0,
    });

    await db.insert('level', {
      'module': 'Mid',
      'num_order': 6,
      'title': 'Gestión de Estado Avanzada',
      'description':
          "Revisa técnicas avanzadas de gestión de estado como Provider, Riverpod, BLoC y GetX. Explora cómo manejar el estado en aplicaciones complejas.",
      'points': 0,
      'is_completed': 0,
    });

    await db.insert('level', {
      'module': 'Mid',
      'num_order': 7,
      'title': 'Animaciones Básicas',
      'description':
          "Repasa cómo crear animaciones básicas en Flutter usando widgets como Hero, Opacidad y controladores de animación.",
      'points': 0,
      'is_completed': 0,
    });

    await db.insert('level', {
      'module': 'Mid',
      'num_order': 8,
      'title': 'Programación Reactiva',
      'description':
          "Explora los conceptos de programación reactiva usando RxDart. Descubre cómo manejar flujos de datos de manera más eficiente.",
      'points': 0,
      'is_completed': 0,
    });

    await db.insert('level', {
      'module': 'Mid',
      'num_order': 9,
      'title': 'Integración y Entrega Continua (CI/CD)',
      'description':
          "Revisa cómo configurar integración y entrega continua (CI/CD) usando herramientas como Fastlane, Codemagic y GitHub Actions.",
      'points': 0,
      'is_completed': 0,
    });

    await db.insert('level', {
      'module': 'Mid',
      'num_order': 10,
      'title': 'Herramientas de Desarrollo (Dev Tools)',
      'description':
          "Descubre herramientas de desarrollo como Flutter Inspector y Flutter Outline para depurar y optimizar tu aplicación.",
      'points': 0,
      'is_completed': 0,
    });
  }

  Future<void> _insertLevelsSr(db) async {
    await db.insert('level', {
      'module': 'Sr',
      'num_order': 1,
      'title': 'Trabajo con APIs Avanzado',
      'description':
          "Explora cómo trabajar con APIs avanzadas como WebSockets y GraphQL para aplicaciones en tiempo real y consultas complejas.",
      'points': 0,
      'is_completed': 0,
    });

    await db.insert('level', {
      'module': 'Sr',
      'num_order': 2,
      'title': 'Almacenamiento Avanzado',
      'description':
          "Revisa cómo usar Firestore de manera avanzada para gestionar datos en tiempo real. Descubre cómo optimizar consultas y garantizar la seguridad de los datos.",
      'points': 0,
      'is_completed': 0,
    });

    await db.insert('level', {
      'module': 'Sr',
      'num_order': 3,
      'title': 'Animaciones Avanzadas',
      'description':
          "Repasa cómo crear animaciones avanzadas en Flutter, incluyendo animaciones curvas y personalizadas.",
      'points': 0,
      'is_completed': 0,
    });

    await db.insert('level', {
      'module': 'Sr',
      'num_order': 4,
      'title': 'Internals de Flutter',
      'description':
          "Explora los conceptos internos de Flutter, como Render Objects, los 3 árboles y la inmutabilidad. Descubre cómo funciona Flutter bajo el capó.",
      'points': 0,
      'is_completed': 0,
    });

    await db.insert('level', {
      'module': 'Sr',
      'num_order': 5,
      'title': 'CI/CD Avanzado',
      'description':
          "Revisa cómo configurar integración y entrega continua (CI/CD) con protocolos avanzados para automatizar el despliegue de aplicaciones.",
      'points': 0,
      'is_completed': 0,
    });

    await db.insert('level', {
      'module': 'Sr',
      'num_order': 6,
      'title': 'Analíticas',
      'description':
          "Descubre cómo usar herramientas de análisis como Firebase Analytics, Google Analytics y Mixpanel para medir el rendimiento de tu aplicación.",
      'points': 0,
      'is_completed': 0,
    });
  }
}
 */