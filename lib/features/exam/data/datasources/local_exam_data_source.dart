import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/exam_question_model.dart';

class LocalExamDataSource {
  static const String _tableName = 'exam_questions';
  static const String _dbName = 'final_exam3.db';
  Database? _database;

  // Inicializar la base de datos
  Future<Database> getDatabase() async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // Crear la tabla de preguntas y pre-cargar preguntas
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $_tableName (
      id TEXT PRIMARY KEY,
      questionText TEXT,
      options TEXT,
      correctAnswer TEXT,
      moduleId TEXT
    )
  ''');

    // Añade esta tabla nueva
    await db.execute('''
    CREATE TABLE IF NOT EXISTS user_answers (
      questionId TEXT PRIMARY KEY,
      selectedAnswer TEXT
    )
  ''');

    await _preloadQuestions(db);
  }

  Future<void> _preloadQuestions(Database db) async {
    final preloadedQuestions = [
      // Preguntas para el módulo Jr
      ExamQuestionModel(
        id: '1',
        questionText:
            'En Dart, ¿qué palabra clave se usa para declarar una variable inmutable que se asigna en tiempo de compilación?',
        options: ['A) var', 'B) final', 'C) const', 'D) static'],
        correctAnswer: 'C',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '2',
        questionText:
            '¿Cuál de estos NO es un tipo de dato incorporado en Dart?',
        options: ['A) List', 'B) Map', 'C) Tuple', 'D) Set'],
        correctAnswer: 'C',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '3',
        questionText:
            'En Flutter, ¿qué tipo de widget NO tiene estado interno?',
        options: [
          'A) StatelessWidget',
          'B) StatefulWidget',
          'C) InheritedWidget',
          'D) MaterialApp'
        ],
        correctAnswer: 'A',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '4',
        questionText:
            '¿Qué comando de Flutter CLI se usa para crear un nuevo proyecto?',
        options: [
          'A) flutter init',
          'B) flutter create',
          'C) flutter new',
          'D) flutter start'
        ],
        correctAnswer: 'B',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '5',
        questionText:
            '¿Qué widget se usa para agregar espacio alrededor de otro widget?',
        options: ['A) Container', 'B) Padding', 'C) Margin', 'D) Spacer'],
        correctAnswer: 'B',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '6',
        questionText:
            'En Dart, ¿qué operador se usa para comparar igualdad de valor?',
        options: ['A) =', 'B) ==', 'C) ===', 'D) equals'],
        correctAnswer: 'B',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '7',
        questionText:
            '¿Qué estructura de control permite manejar múltiples condiciones en Dart?',
        options: ['A) if-else', 'B) for', 'C) switch-case', 'D) while'],
        correctAnswer: 'C',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '8',
        questionText:
            '¿Qué extensión de VS Code es esencial para desarrollo Flutter?',
        options: ['A) Dart', 'B) Flutter', 'C) Code Runner', 'D) Pub Helper'],
        correctAnswer: 'B',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '9',
        questionText:
            '¿Qué método se usa para actualizar el estado en un StatefulWidget?',
        options: [
          'A) updateState()',
          'B) refresh()',
          'C) setState()',
          'D) rebuild()'
        ],
        correctAnswer: 'C',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '10',
        questionText:
            '¿Dónde se definen las fuentes personalizadas en un proyecto Flutter?',
        options: [
          'A) pubspec.yaml',
          'B) main.dart',
          'C) styles.css',
          'D) fonts.ini'
        ],
        correctAnswer: 'A',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '11',
        questionText: '¿Qué comando de Git crea una nueva rama?',
        options: [
          'A) git new',
          'B) git create',
          'C) git branch',
          'D) git checkout -b'
        ],
        correctAnswer: 'D',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '12',
        questionText:
            '¿Qué widget muestra una barra superior en aplicaciones Material Design?',
        options: ['A) TopBar', 'B) AppBar', 'C) NavigationBar', 'D) Header'],
        correctAnswer: 'B',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '13',
        questionText: '¿Qué tipo de base de datos local usa SQL en Flutter?',
        options: ['A) Hive', 'B) SharedPreferences', 'C) SQLite', 'D) Realm'],
        correctAnswer: 'C',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '14',
        questionText:
            'En POO, ¿qué principio permite ocultar detalles de implementación?',
        options: [
          'A) Herencia',
          'B) Polimorfismo',
          'C) Encapsulamiento',
          'D) Abstracción'
        ],
        correctAnswer: 'C',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '15',
        questionText:
            '¿Qué widget permite hacer transiciones animadas entre pantallas?',
        options: [
          'A) AnimatedContainer',
          'B) Hero',
          'C) FadeTransition',
          'D) SlideTransition'
        ],
        correctAnswer: 'B',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '16',
        questionText:
            '¿Qué método se usa para cargar imágenes locales en Flutter?',
        options: [
          'A) Image.file()',
          'B) Image.local()',
          'C) Image.asset()',
          'D) Image.load()'
        ],
        correctAnswer: 'C',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '17',
        questionText:
            '¿Qué comando actualiza las dependencias en un proyecto Flutter?',
        options: [
          'A) flutter update',
          'B) flutter pub get',
          'C) flutter upgrade',
          'D) flutter refresh'
        ],
        correctAnswer: 'B',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '18',
        questionText:
            '¿Qué propiedad controla el color de fondo de un Container?',
        options: ['A) background', 'B) bgColor', 'C) color', 'D) decoration'],
        correctAnswer: 'C',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '19',
        questionText:
            '¿Qué estructura de datos almacena pares clave-valor en Dart?',
        options: ['A) List', 'B) Set', 'C) Map', 'D) Array'],
        correctAnswer: 'C',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '20',
        questionText:
            '¿Qué widget Material Design representa un botón flotante?',
        options: [
          'A) RaisedButton',
          'B) FlatButton',
          'C) FloatingActionButton',
          'D) IconButton'
        ],
        correctAnswer: 'C',
        moduleId: 'Jr',
      ),

      ExamQuestionModel(
        id: '21',
        questionText: '¿Qué tipo de función en Dart no tiene nombre asociado?',
        options: [
          'A) Función estática',
          'B) Función anónima',
          'C) Función principal',
          'D) Función global'
        ],
        correctAnswer: 'B',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '22',
        questionText:
            '¿Qué widget se usa para crear una lista desplazable en Flutter?',
        options: ['A) GridView', 'B) Column', 'C) ListView', 'D) ScrollView'],
        correctAnswer: 'C',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '23',
        questionText:
            'En Dart, ¿qué tipo de loop ejecuta al menos una vez sin importar la condición?',
        options: ['A) for', 'B) while', 'C) do-while', 'D) forEach'],
        correctAnswer: 'C',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '24',
        questionText:
            '¿Qué archivo define las dependencias de un proyecto Flutter?',
        options: [
          'A) package.json',
          'B) pubspec.yaml',
          'C) dependencies.ini',
          'D) flutter.cfg'
        ],
        correctAnswer: 'B',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '25',
        questionText: '¿Qué comando de Git sube cambios al repositorio remoto?',
        options: [
          'A) git commit',
          'B) git push',
          'C) git upload',
          'D) git send'
        ],
        correctAnswer: 'B',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '26',
        questionText:
            '¿Qué widget permite organizar hijos en una fila horizontal?',
        options: ['A) Column', 'B) Stack', 'C) Row', 'D) Flex'],
        correctAnswer: 'C',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '27',
        questionText:
            'En SharedPreferences, ¿qué método se usa para guardar un valor booleano?',
        options: [
          'A) saveBool()',
          'B) setBool()',
          'C) putBool()',
          'D) writeBool()'
        ],
        correctAnswer: 'B',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '28',
        questionText: '¿Qué operador Dart concatena dos cadenas de texto?',
        options: ['A) &', 'B) +', 'C) ++', 'D) concat()'],
        correctAnswer: 'B',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '29',
        questionText:
            '¿Qué método se llama cuando un StatefulWidget se inserta en el árbol?',
        options: [
          'A) init()',
          'B) create()',
          'C) initState()',
          'D) onInsert()'
        ],
        correctAnswer: 'C',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '30',
        questionText:
            '¿Qué propiedad de Text widget controla el tamaño de fuente?',
        options: ['A) textSize', 'B) size', 'C) fontSize', 'D) fontScale'],
        correctAnswer: 'C',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '31',
        questionText:
            '¿Qué tipo de dato Dart representa números con decimales?',
        options: ['A) int', 'B) num', 'C) float', 'D) double'],
        correctAnswer: 'D',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '32',
        questionText:
            '¿Qué widget Material Design muestra un menú lateral deslizable?',
        options: [
          'A) NavigationBar',
          'B) Drawer',
          'C) SideMenu',
          'D) SlidingPanel'
        ],
        correctAnswer: 'B',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '33',
        questionText: 'En Git, ¿qué comando descarga cambios sin fusionarlos?',
        options: [
          'A) git pull',
          'B) git fetch',
          'C) git download',
          'D) git update'
        ],
        correctAnswer: 'B',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '34',
        questionText: '¿Qué método SQLite ejecuta consultas SELECT en Flutter?',
        options: ['A) query()', 'B) select()', 'C) get()', 'D) execute()'],
        correctAnswer: 'A',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '35',
        questionText: '¿Qué patrón de diseño usa una sola instancia global?',
        options: ['A) Factory', 'B) Singleton', 'C) Prototype', 'D) Builder'],
        correctAnswer: 'B',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '36',
        questionText: '¿Qué widget muestra un indicador de carga circular?',
        options: [
          'A) Loader',
          'B) ProgressBar',
          'C) CircularProgressIndicator',
          'D) ActivityIndicator'
        ],
        correctAnswer: 'C',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '37',
        questionText: '¿Qué sentencia Dart maneja excepciones potenciales?',
        options: [
          'A) try-catch',
          'B) handle-error',
          'C) on-failure',
          'D) exception'
        ],
        correctAnswer: 'A',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '38',
        questionText:
            '¿Qué propiedad controla el espacio entre widgets en un Column?',
        options: [
          'A) padding',
          'B) margin',
          'C) spacing',
          'D) mainAxisAlignment'
        ],
        correctAnswer: 'D',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '39',
        questionText:
            '¿Qué comando Flutter ejecuta la app en un dispositivo conectado?',
        options: [
          'A) flutter start',
          'B) flutter launch',
          'C) flutter run',
          'D) flutter execute'
        ],
        correctAnswer: 'C',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '40',
        questionText:
            '¿Qué tipo de widget usa TextEditingController para manejar texto?',
        options: ['A) Text', 'B) TextField', 'C) Label', 'D) TextDisplay'],
        correctAnswer: 'B',
        moduleId: 'Jr',
      ),

      ExamQuestionModel(
        id: '41',
        questionText:
            '¿Qué widget permite anular el sistema de navegación predeterminado?',
        options: [
          'A) Navigator',
          'B) Router',
          'C) MaterialApp',
          'D) CupertinoApp'
        ],
        correctAnswer: 'A',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '42',
        questionText: 'En Dart, ¿qué método convierte una cadena a mayúsculas?',
        options: [
          'A) toUpperCase()',
          'B) upperCase()',
          'C) capitalize()',
          'D) toUpper()'
        ],
        correctAnswer: 'A',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '43',
        questionText:
            '¿Qué componente de Android Studio permite probar apps en dispositivos virtuales?',
        options: [
          'A) Device Manager',
          'B) Emulator',
          'C) Virtual Box',
          'D) AVD Manager'
        ],
        correctAnswer: 'D',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '44',
        questionText:
            '¿Qué tipo de animación cambia gradualmente la opacidad de un widget?',
        options: [
          'A) FadeTransition',
          'B) AnimatedOpacity',
          'C) OpacityController',
          'D) FadeAnimation'
        ],
        correctAnswer: 'B',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '45',
        questionText: '¿Qué comando muestra la versión instalada de Flutter?',
        options: [
          'A) flutter --version',
          'B) flutter version',
          'C) flutter -v',
          'D) flutter check'
        ],
        correctAnswer: 'A',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '46',
        questionText:
            '¿Qué widget envuelve otros widgets para aplicar márgenes uniformes?',
        options: ['A) Container', 'B) Padding', 'C) Margin', 'D) SafeArea'],
        correctAnswer: 'B',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '47',
        questionText:
            'En Git, ¿qué comando fusiona una rama con la rama actual?',
        options: [
          'A) git merge',
          'B) git combine',
          'C) git join',
          'D) git integrate'
        ],
        correctAnswer: 'A',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '48',
        questionText: '¿Qué método de List en Dart elimina el último elemento?',
        options: [
          'A) removeLast()',
          'B) pop()',
          'C) deleteLast()',
          'D) truncate()'
        ],
        correctAnswer: 'A',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '49',
        questionText: '¿Qué paquete Flutter permite hacer HTTP requests?',
        options: ['A) http', 'B) requests', 'C) dio', 'D) fetch'],
        correctAnswer: 'A',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '50',
        questionText:
            '¿Qué propiedad de ThemeData define los colores principales de la app?',
        options: [
          'A) primaryColor',
          'B) mainColor',
          'C) themeColor',
          'D) palette'
        ],
        correctAnswer: 'A',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '51',
        questionText: '¿Qué widget muestra un diálogo modal en Flutter?',
        options: ['A) Modal', 'B) AlertDialog', 'C) Popup', 'D) DialogBox'],
        correctAnswer: 'B',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '52',
        questionText: '¿Qué tipo de testing verifica widgets individuales?',
        options: [
          'A) Unit testing',
          'B) Widget testing',
          'C) Integration testing',
          'D) UI testing'
        ],
        correctAnswer: 'B',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '53',
        questionText: '¿Qué comando limpia el proyecto Flutter?',
        options: [
          'A) flutter clean',
          'B) flutter clear',
          'C) flutter reset',
          'D) flutter refresh'
        ],
        correctAnswer: 'A',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '54',
        questionText:
            '¿Qué método de Map devuelve todas las claves como iterable?',
        options: ['A) keys()', 'B) getKeys()', 'C) allKeys()', 'D) keyList()'],
        correctAnswer: 'A',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '55',
        questionText:
            '¿Qué widget permite desplazamiento con gestos en Flutter?',
        options: [
          'A) Scrollable',
          'B) GestureDetector',
          'C) SingleChildScrollView',
          'D) Draggable'
        ],
        correctAnswer: 'C',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '56',
        questionText: '¿Qué extensión de archivo tienen los archivos Dart?',
        options: ['A) .dart', 'B) .dt', 'C) .dr', 'D) .dartscript'],
        correctAnswer: 'A',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '57',
        questionText: '¿Qué función debe contener todo programa Dart?',
        options: ['A) start()', 'B) main()', 'C) run()', 'D) init()'],
        correctAnswer: 'B',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '58',
        questionText: '¿Qué widget organiza hijos en pila superpuesta?',
        options: ['A) Column', 'B) Grid', 'C) Stack', 'D) Pile'],
        correctAnswer: 'C',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '59',
        questionText:
            '¿Qué herramienta inspecciona el árbol de widgets en tiempo real?',
        options: [
          'A) Flutter Inspector',
          'B) Widget Viewer',
          'C) Dart Analyzer',
          'D) Layout Explorer'
        ],
        correctAnswer: 'A',
        moduleId: 'Jr',
      ),
      ExamQuestionModel(
        id: '60',
        questionText:
            '¿Qué método de String en Dart divide el texto en una lista?',
        options: ['A) split()', 'B) divide()', 'C) separate()', 'D) break()'],
        correctAnswer: 'A',
        moduleId: 'Jr',
      ),

      //----- Preguntas para el módulo Mid -----

      ExamQuestionModel(
        id: '100',
        questionText:
            '¿Qué tipo de Provider en Riverpod es ideal para estados simples?',
        options: [
          'A) NotifierProvider',
          'B) StateProvider',
          'C) FutureProvider',
          'D) StreamProvider'
        ],
        correctAnswer: 'B',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '101',
        questionText:
            'En Riverpod, ¿qué método escucha cambios sin reconstruir widgets?',
        options: ['A) watch', 'B) read', 'C) listen', 'D) observe'],
        correctAnswer: 'B',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '102',
        questionText:
            '¿Qué principio SOLID indica que una clase debe tener una sola razón para cambiar?',
        options: ['A) OCP', 'B) SRP', 'C) LSP', 'D) ISP'],
        correctAnswer: 'B',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '103',
        questionText:
            '¿Qué patrón de diseño crea objetos sin especificar su clase concreta?',
        options: ['A) Singleton', 'B) Factory', 'C) Builder', 'D) Prototype'],
        correctAnswer: 'B',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '104',
        questionText: 'En Firestore, ¿qué método realiza operaciones atómicas?',
        options: [
          'A) batch()',
          'B) transaction()',
          'C) atomic()',
          'D) operation()'
        ],
        correctAnswer: 'B',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '105',
        questionText:
            '¿Qué paquete convierte JSON a objetos Dart automáticamente?',
        options: [
          'A) json_serializable',
          'B) http',
          'C) dart:convert',
          'D) retrofit'
        ],
        correctAnswer: 'A',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '106',
        questionText: 'En BLoC, ¿qué componente transforma eventos en estados?',
        options: ['A) Bloc', 'B) Cubit', 'C) Mapper', 'D) Transformer'],
        correctAnswer: 'A',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '107',
        questionText: '¿Qué Firebase service permite autenticar con Google?',
        options: [
          'A) Firestore Auth',
          'B) Cloud Identity',
          'C) Firebase Authentication',
          'D) Google Sign-In'
        ],
        correctAnswer: 'C',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '108',
        questionText: '¿Qué operador RxDart combina múltiples streams?',
        options: ['A) merge()', 'B) combine()', 'C) zip()', 'D) concat()'],
        correctAnswer: 'A',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '109',
        questionText: '¿Qué herramienta automatiza despliegues en iOS/Android?',
        options: ['A) Codemagic', 'B) Fastlane', 'C) Bitrise', 'D) Travis CI'],
        correctAnswer: 'B',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '110',
        questionText:
            '¿Qué widget anima propiedades usando curvas personalizadas?',
        options: [
          'A) AnimatedCurve',
          'B) CurvedAnimation',
          'C) TweenAnimation',
          'D) CustomAnimation'
        ],
        correctAnswer: 'B',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '111',
        questionText: '¿Qué método de http retorna un Future con la respuesta?',
        options: ['A) fetch()', 'B) request()', 'C) get()', 'D) call()'],
        correctAnswer: 'C',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '112',
        questionText: 'En CI/CD, ¿qué plataforma está integrada con GitHub?',
        options: [
          'A) Bitrise',
          'B) GitHub Actions',
          'C) Codemagic',
          'D) Fastlane'
        ],
        correctAnswer: 'B',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '113',
        questionText:
            '¿Qué Firebase feature permite cambiar parámetros sin actualizar la app?',
        options: [
          'A) Cloud Messaging',
          'B) Remote Config',
          'C) Dynamic Links',
          'D) App Distribution'
        ],
        correctAnswer: 'B',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '114',
        questionText:
            '¿Qué principio SOLID permite extender comportamiento sin modificar código?',
        options: ['A) SRP', 'B) OCP', 'C) LSP', 'D) DIP'],
        correctAnswer: 'B',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '115',
        questionText: '¿Qué componente GetX maneja rutas y dependencias?',
        options: [
          'A) GetBuilder',
          'B) GetMaterialApp',
          'C) GetXController',
          'D) GetService'
        ],
        correctAnswer: 'B',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '116',
        questionText:
            '¿Qué operador Stream transforma datos antes de emitirlos?',
        options: ['A) filter()', 'B) map()', 'C) reduce()', 'D) expand()'],
        correctAnswer: 'B',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '117',
        questionText:
            '¿Qué Cloud Function se ejecuta cuando se crea un documento Firestore?',
        options: ['A) onCreate', 'B) onWrite', 'C) onUpdate', 'D) onDocument'],
        correctAnswer: 'A',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '118',
        questionText:
            '¿Qué herramienta analiza el rendimiento de widgets en Flutter?',
        options: [
          'A) Flutter Inspector',
          'B) Dart DevTools',
          'C) Performance Overlay',
          'D) Timeline View'
        ],
        correctAnswer: 'C',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '119',
        questionText: '¿Qué patrón separa la lógica de negocio de la interfaz?',
        options: ['A) MVC', 'B) BLoC', 'C) Singleton', 'D) Factory'],
        correctAnswer: 'B',
        moduleId: 'Mid',
      ),

      ExamQuestionModel(
        id: '120',
        questionText:
            '¿Qué tipo de Provider se usa para operaciones asíncronas en Riverpod?',
        options: [
          'A) StateProvider',
          'B) FutureProvider',
          'C) StreamProvider',
          'D) ChangeNotifierProvider'
        ],
        correctAnswer: 'B',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '121',
        questionText:
            '¿Qué patrón de diseño garantiza una única instancia de una clase?',
        options: ['A) Factory', 'B) Singleton', 'C) Builder', 'D) Prototype'],
        correctAnswer: 'B',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '122',
        questionText:
            'En BLoC, ¿qué componente maneja la lógica de negocio sin eventos?',
        options: ['A) Bloc', 'B) Cubit', 'C) Reducer', 'D) Controller'],
        correctAnswer: 'B',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '123',
        questionText:
            '¿Qué Firebase service envía notificaciones push a dispositivos?',
        options: [
          'A) Cloud Messaging',
          'B) Remote Config',
          'C) Cloud Functions',
          'D) App Distribution'
        ],
        correctAnswer: 'A',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '124',
        questionText:
            '¿Qué método de AnimationController inicia una animación?',
        options: ['A) start()', 'B) play()', 'C) forward()', 'D) animate()'],
        correctAnswer: 'C',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '125',
        questionText: '¿Qué principio SOLID sugiere depender de abstracciones?',
        options: ['A) SRP', 'B) OCP', 'C) LSP', 'D) DIP'],
        correctAnswer: 'D',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '126',
        questionText:
            '¿Qué comando de Fastlane despliega una app en TestFlight?',
        options: ['A) beta', 'B) pilot', 'C) deliver', 'D) gym'],
        correctAnswer: 'B',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '127',
        questionText:
            '¿Qué widget usa AnimatedBuilder para reconstruir solo lo necesario?',
        options: [
          'A) ValueListenableBuilder',
          'B) StreamBuilder',
          'C) Consumer',
          'D) BlocBuilder'
        ],
        correctAnswer: 'A',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '128',
        questionText:
            '¿Qué operador RxDart filtra emisiones duplicadas consecutivas?',
        options: [
          'A) distinct()',
          'B) filter()',
          'C) debounce()',
          'D) throttle()'
        ],
        correctAnswer: 'A',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '129',
        questionText:
            '¿Qué herramienta analiza el rendimiento de renderizado en Flutter?',
        options: [
          'A) Flutter Inspector',
          'B) Performance Overlay',
          'C) Dart DevTools',
          'D) Timeline'
        ],
        correctAnswer: 'B',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '130',
        questionText:
            '¿Qué método Firestore obtiene documentos en tiempo real?',
        options: ['A) get()', 'B) fetch()', 'C) snapshots()', 'D) stream()'],
        correctAnswer: 'C',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '131',
        questionText:
            '¿Qué patrón organiza el código en Controller-Service-Repository?',
        options: ['A) MVC', 'B) MVVM', 'C) Clean Architecture', 'D) Redux'],
        correctAnswer: 'C',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '132',
        questionText:
            '¿Qué tipo de animación interpola entre valores con una curva?',
        options: [
          'A) Tween',
          'B) CurvedAnimation',
          'C) AnimationController',
          'D) AnimatedWidget'
        ],
        correctAnswer: 'B',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '133',
        questionText: '¿Qué paquete permite manejar inyección de dependencias?',
        options: ['A) get_it', 'B) injectable', 'C) provider', 'D) kiwi'],
        correctAnswer: 'A',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '134',
        questionText: '¿Qué componente de GetX maneja el estado reactivo?',
        options: ['A) GetBuilder', 'B) GetX', 'C) GetView', 'D) GetController'],
        correctAnswer: 'B',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '135',
        questionText: '¿Qué Firebase feature permite A/B testing?',
        options: [
          'A) Remote Config',
          'B) Cloud Messaging',
          'C) App Distribution',
          'D) Dynamic Links'
        ],
        correctAnswer: 'A',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '136',
        questionText:
            '¿Qué método de Stream escucha eventos sin cancelar suscripciones previas?',
        options: ['A) listen', 'B) asyncListen', 'C) observe', 'D) subscribe'],
        correctAnswer: 'A',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '137',
        questionText: '¿Qué herramienta CI/CD está especializada en Flutter?',
        options: [
          'A) Bitrise',
          'B) Codemagic',
          'C) GitHub Actions',
          'D) Jenkins'
        ],
        correctAnswer: 'B',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '138',
        questionText:
            '¿Qué principio SOLID permite sustituir clases derivadas?',
        options: ['A) SRP', 'B) OCP', 'C) LSP', 'D) ISP'],
        correctAnswer: 'C',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '139',
        questionText: '¿Qué operador transforma un Stream en otro Stream?',
        options: ['A) map', 'B) where', 'C) take', 'D) expand'],
        correctAnswer: 'A',
        moduleId: 'Mid',
      ),

      ExamQuestionModel(
        id: '140',
        questionText:
            '¿Qué tipo de pruebas verifican múltiples widgets trabajando juntos?',
        options: [
          'A) Unit tests',
          'B) Widget tests',
          'C) Integration tests',
          'D) Smoke tests'
        ],
        correctAnswer: 'C',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '141',
        questionText:
            'En Riverpod, ¿qué decorador marca una clase como proveedor?',
        options: ['A) @provider', 'B) @riverpod', 'C) @state', 'D) @notifier'],
        correctAnswer: 'B',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '142',
        questionText: '¿Qué comando de Fastlane despliega a Google Play Store?',
        options: ['A) supply', 'B) deploy', 'C) playstore', 'D) upload'],
        correctAnswer: 'A',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '143',
        questionText:
            '¿Qué Firestore rule permite lectura solo a usuarios autenticados?',
        options: [
          'A) allow read: if true',
          'B) allow read: if request.auth != null',
          'C) allow read: if isSignedIn()',
          'D) allow read: if userLogged'
        ],
        correctAnswer: 'B',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '144',
        questionText:
            '¿Qué patrón usa eventos, estados y reducers para manejar estado?',
        options: ['A) BLoC', 'B) Redux', 'C) Provider', 'D) MVVM'],
        correctAnswer: 'B',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '145',
        questionText:
            '¿Qué método de AnimationController repite una animación infinitamente?',
        options: ['A) loop()', 'B) repeat()', 'C) cycle()', 'D) infinite()'],
        correctAnswer: 'B',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '146',
        questionText: '¿Qué paquete permite mockear dependencias en pruebas?',
        options: ['A) mockito', 'B) test', 'C) fake_async', 'D) bloc_test'],
        correctAnswer: 'A',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '147',
        questionText: '¿Qué componente de GetX maneja internacionalización?',
        options: [
          'A) GetTranslations',
          'B) GetLocale',
          'C) GetX',
          'D) GetMaterialApp'
        ],
        correctAnswer: 'D',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '148',
        questionText: '¿Qué operador RxDart retrasa emisiones de un Stream?',
        options: [
          'A) delay()',
          'B) debounceTime()',
          'C) throttleTime()',
          'D) bufferTime()'
        ],
        correctAnswer: 'B',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '149',
        questionText:
            '¿Qué herramienta de Firebase distribuye builds a testers?',
        options: [
          'A) Cloud Storage',
          'B) App Distribution',
          'C) Test Lab',
          'D) Crashlytics'
        ],
        correctAnswer: 'B',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '150',
        questionText:
            '¿Qué método de testing verifica interacciones con widgets?',
        options: [
          'A) expect()',
          'B) verify()',
          'C) pumpAndSettle()',
          'D) tap()'
        ],
        correctAnswer: 'D',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '151',
        questionText:
            '¿Qué principio SOLID sugiere interfaces específicas para clientes?',
        options: ['A) SRP', 'B) OCP', 'C) LSP', 'D) ISP'],
        correctAnswer: 'D',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '152',
        questionText:
            '¿Qué Cloud Function se ejecuta cuando se actualiza un documento?',
        options: ['A) onCreate', 'B) onUpdate', 'C) onWrite', 'D) onModify'],
        correctAnswer: 'B',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '153',
        questionText:
            '¿Qué widget muestra diferentes hijos basados en un Stream?',
        options: [
          'A) FutureBuilder',
          'B) StreamBuilder',
          'C) BlocBuilder',
          'D) ValueListenableBuilder'
        ],
        correctAnswer: 'B',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '154',
        questionText:
            '¿Qué comando de Codemagic inicia el pipeline manualmente?',
        options: [
          'A) codemagic run',
          'B) cm build',
          'C) start pipeline',
          'D) build workflow'
        ],
        correctAnswer: 'A',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '155',
        questionText:
            '¿Qué patrón usa UseCases para encapsular lógica de negocio?',
        options: ['A) MVC', 'B) Clean Architecture', 'C) MVVM', 'D) Redux'],
        correctAnswer: 'B',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '156',
        questionText: '¿Qué método de Firestore ordena resultados por campo?',
        options: [
          'A) sort()',
          'B) orderBy()',
          'C) arrangeBy()',
          'D) where().sort()'
        ],
        correctAnswer: 'B',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '157',
        questionText:
            '¿Qué tipo de animación usa PhysicsSimulation para efectos realistas?',
        options: [
          'A) SpringSimulation',
          'B) TweenAnimation',
          'C) CurvedAnimation',
          'D) FrictionSimulation'
        ],
        correctAnswer: 'A',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '158',
        questionText:
            '¿Qué paquete permite generar código para serialización JSON?',
        options: [
          'A) json_serializable',
          'B) freezed',
          'C) build_runner',
          'D) dart:convert'
        ],
        correctAnswer: 'A',
        moduleId: 'Mid',
      ),
      ExamQuestionModel(
        id: '159',
        questionText:
            '¿Qué herramienta muestra el árbol de renderizado de widgets?',
        options: [
          'A) Flutter Inspector',
          'B) Dart DevTools',
          'C) Layout Explorer',
          'D) Widget Viewer'
        ],
        correctAnswer: 'A',
        moduleId: 'Mid',
      ),

      //------ Preguntas para el módulo Sr ------

      ExamQuestionModel(
        id: '200',
        questionText:
            '¿Qué tecnología permite comunicación bidireccional en tiempo real con servidores?',
        options: ['A) REST API', 'B) WebSockets', 'C) GraphQL', 'D) gRPC'],
        correctAnswer: 'B',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '201',
        questionText:
            'En GraphQL, ¿qué operación modifica datos en el servidor?',
        options: ['A) Query', 'B) Mutation', 'C) Subscription', 'D) Action'],
        correctAnswer: 'B',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '202',
        questionText:
            '¿Qué técnica optimiza consultas Firestore con datos frecuentemente accedidos?',
        options: [
          'A) Sharding',
          'B) Caching',
          'C) Indexing',
          'D) Denormalización'
        ],
        correctAnswer: 'B',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '203',
        questionText:
            '¿Qué árbol de Flutter contiene la representación visual de los widgets?',
        options: [
          'A) Widget Tree',
          'B) Element Tree',
          'C) Render Tree',
          'D) Layer Tree'
        ],
        correctAnswer: 'C',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '204',
        questionText:
            '¿Qué patrón de animación permite crear movimientos con física realista?',
        options: [
          'A) Tween Animation',
          'B) Physics-based Animation',
          'C) Hero Animation',
          'D) Curved Animation'
        ],
        correctAnswer: 'B',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '205',
        questionText:
            '¿Qué principio de Flutter evita reconstrucciones innecesarias de widgets?',
        options: [
          'A) Inmutabilidad',
          'B) Polymorphism',
          'C) Encapsulamiento',
          'D) Herencia'
        ],
        correctAnswer: 'A',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '206',
        questionText: '¿Qué técnica de CI/CD permite despliegues progresivos?',
        options: [
          'A) Blue-Green Deployment',
          'B) Canary Releases',
          'C) Feature Flags',
          'D) A/B Testing'
        ],
        correctAnswer: 'B',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '207',
        questionText:
            '¿Qué herramienta analiza el rendimiento de widgets en profundidad?',
        options: [
          'A) Flutter Inspector',
          'B) Dart DevTools',
          'C) Performance Overlay',
          'D) Timeline'
        ],
        correctAnswer: 'D',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '208',
        questionText:
            '¿Qué método de Firestore realiza operaciones atómicas múltiples?',
        options: [
          'A) batch()',
          'B) transaction()',
          'C) atomic()',
          'D) multi()'
        ],
        correctAnswer: 'A',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '209',
        questionText:
            '¿Qué componente de Flutter dibuja directamente en el canvas?',
        options: [
          'A) CustomPaint',
          'B) RenderBox',
          'C) CanvasWidget',
          'D) DirectRenderer'
        ],
        correctAnswer: 'A',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '210',
        questionText:
            '¿Qué técnica reduce el tamaño de APK eliminando recursos innecesarios?',
        options: [
          'A) ProGuard',
          'B) Shrinking',
          'C) Obfuscation',
          'D) Tree Shaking'
        ],
        correctAnswer: 'D',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '211',
        questionText:
            '¿Qué patrón arquitectónico separa lógica en Use Cases y Entities?',
        options: ['A) MVC', 'B) MVVM', 'C) Clean Architecture', 'D) Redux'],
        correctAnswer: 'C',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '212',
        questionText:
            '¿Qué herramienta mide el rendimiento de animaciones frame por frame?',
        options: [
          'A) Flutter Inspector',
          'B) Performance Overlay',
          'C) Raster Stats',
          'D) Timeline'
        ],
        correctAnswer: 'D',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '213',
        questionText:
            '¿Qué método optimiza consultas Firestore con índices compuestos?',
        options: [
          'A) createIndex()',
          'B) indexOn()',
          'C) compoundQuery()',
          'D) optimize()'
        ],
        correctAnswer: 'B',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '214',
        questionText:
            '¿Qué técnica implementa WebSockets en Flutter usando streams?',
        options: [
          'A) WebSocketChannel',
          'B) Socket.io',
          'C) HttpServer',
          'D) StreamController'
        ],
        correctAnswer: 'A',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '215',
        questionText:
            '¿Qué árbol de Flutter maneja el estado y la configuración de widgets?',
        options: [
          'A) Widget Tree',
          'B) Element Tree',
          'C) Render Tree',
          'D) State Tree'
        ],
        correctAnswer: 'B',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '216',
        questionText:
            '¿Qué patrón de animación crea transiciones fluidas entre pantallas?',
        options: [
          'A) Hero',
          'B) PageRouteBuilder',
          'C) AnimatedSwitcher',
          'D) CustomTransition'
        ],
        correctAnswer: 'A',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '217',
        questionText:
            '¿Qué técnica de testing verifica flujos de usuario completos?',
        options: [
          'A) Unit Testing',
          'B) Widget Testing',
          'C) Integration Testing',
          'D) Golden Testing'
        ],
        correctAnswer: 'C',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '218',
        questionText:
            '¿Qué herramienta de Firebase analiza comportamiento de usuarios?',
        options: [
          'A) Crashlytics',
          'B) Analytics',
          'C) Performance',
          'D) Predictions'
        ],
        correctAnswer: 'B',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '219',
        questionText:
            '¿Qué componente implementa lógica de servidor sin gestionar infraestructura?',
        options: [
          'A) Cloud Run',
          'B) Cloud Functions',
          'C) App Engine',
          'D) Compute Engine'
        ],
        correctAnswer: 'B',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '220',
        questionText:
            '¿Qué técnica de RenderObject optimiza el pintado de widgets?',
        options: [
          'A) Repaint Boundary',
          'B) Layer Caching',
          'C) Partial Redraw',
          'D) Canvas Optimization'
        ],
        correctAnswer: 'A',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '221',
        questionText:
            '¿Qué protocolo de CI/CD permite pipelines condicionales?',
        options: [
          'A) YAML Config',
          'B) GitHub Actions',
          'C) Bitrise Workflows',
          'D) Fastlane Lanes'
        ],
        correctAnswer: 'B',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '222',
        questionText:
            '¿Qué método de Firestore protege datos con reglas de seguridad?',
        options: [
          'A) validate()',
          'B) rules()',
          'C) secure()',
          'D) allow/deny'
        ],
        correctAnswer: 'D',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '223',
        questionText:
            '¿Qué patrón de estado maneja complejidad en apps empresariales?',
        options: ['A) BLoC', 'B) Riverpod', 'C) Redux', 'D) GetX'],
        correctAnswer: 'C',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '224',
        questionText:
            '¿Qué técnica reduce el tiempo de compilación en grandes proyectos?',
        options: [
          'A) Modularización',
          'B) Obfuscación',
          'C) Minificación',
          'D) Bundling'
        ],
        correctAnswer: 'A',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '225',
        questionText:
            '¿Qué herramienta analiza el consumo de memoria en Flutter?',
        options: [
          'A) Memory Profiler',
          'B) Heap Snapshot',
          'C) Allocation Tracker',
          'D) Dart DevTools'
        ],
        correctAnswer: 'D',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '226',
        questionText:
            '¿Qué técnica de WebSockets maneja reconexiones automáticas?',
        options: [
          'A) Retry Strategy',
          'B) Exponential Backoff',
          'C) Heartbeat',
          'D) Reconnect Policy'
        ],
        correctAnswer: 'B',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '227',
        questionText:
            '¿Qué método de GraphQL recibe actualizaciones en tiempo real?',
        options: ['A) Query', 'B) Mutation', 'C) Subscription', 'D) Watch'],
        correctAnswer: 'C',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '228',
        questionText:
            '¿Qué patrón de animación sincroniza múltiples animaciones?',
        options: [
          'A) TweenSequence',
          'B) AnimationGroup',
          'C) Interval',
          'D) Staggered Animation'
        ],
        correctAnswer: 'D',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '229',
        questionText: '¿Qué técnica de testing compara imágenes de widgets?',
        options: [
          'A) Snapshot Testing',
          'B) Golden Testing',
          'C) Pixel Testing',
          'D) UI Diffing'
        ],
        correctAnswer: 'B',
        moduleId: 'Sr',
      ),

      ExamQuestionModel(
        id: '230',
        questionText:
            '¿Qué técnica permite ejecutar código Dart en paralelo al hilo principal?',
        options: ['A) Async/Await', 'B) Isolates', 'C) Futures', 'D) Streams'],
        correctAnswer: 'B',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '231',
        questionText:
            '¿Qué patrón de diseño es ideal para implementar un sistema de notificaciones?',
        options: ['A) Singleton', 'B) Observer', 'C) Decorator', 'D) Strategy'],
        correctAnswer: 'B',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '232',
        questionText:
            '¿Qué herramienta de Firebase permite rastrear eventos personalizados en la app?',
        options: [
          'A) Crashlytics',
          'B) Analytics',
          'C) Performance',
          'D) Predictions'
        ],
        correctAnswer: 'B',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '233',
        questionText:
            '¿Qué método de RenderObject optimiza el layout de widgets complejos?',
        options: [
          'A) performLayout()',
          'B) paint()',
          'C) markNeedsLayout()',
          'D) layout()'
        ],
        correctAnswer: 'A',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '234',
        questionText:
            '¿Qué técnica de estado global maneja mejor apps con 50+ pantallas?',
        options: ['A) Provider', 'B) Riverpod', 'C) BLoC', 'D) Redux'],
        correctAnswer: 'D',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '235',
        questionText:
            '¿Qué comando de Flutter mide el rendimiento de la app en release mode?',
        options: [
          'A) flutter profile',
          'B) flutter run --release',
          'C) flutter analyze',
          'D) flutter test --performance'
        ],
        correctAnswer: 'A',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '236',
        questionText:
            '¿Qué arquitectura separa dominio, datos y presentación en módulos independientes?',
        options: ['A) MVC', 'B) MVVM', 'C) Clean Architecture', 'D) Hexagonal'],
        correctAnswer: 'C',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '237',
        questionText:
            '¿Qué técnica reduce el tiempo de carga inicial en apps grandes?',
        options: [
          'A) Lazy Loading',
          'B) Tree Shaking',
          'C) Code Splitting',
          'D) Precompilation'
        ],
        correctAnswer: 'A',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '238',
        questionText:
            '¿Qué componente de Flutter permite crear widgets con renderizado personalizado?',
        options: [
          'A) CustomPainter',
          'B) RenderObject',
          'C) WidgetBuilder',
          'D) Canvas'
        ],
        correctAnswer: 'B',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '239',
        questionText:
            '¿Qué patrón de animación permite crear efectos basados en física real?',
        options: [
          'A) Tween Animation',
          'B) Physics-based Animation',
          'C) Hero Animation',
          'D) Staggered Animation'
        ],
        correctAnswer: 'B',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '240',
        questionText:
            '¿Qué técnica de testing verifica el rendimiento de widgets en diferentes dispositivos?',
        options: [
          'A) Integration Testing',
          'B) Golden Testing',
          'C) Performance Testing',
          'D) Widget Testing'
        ],
        correctAnswer: 'C',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '241',
        questionText:
            '¿Qué método de Firestore permite consultas complejas con múltiples condiciones?',
        options: [
          'A) where().where()',
          'B) compoundQuery()',
          'C) query()',
          'D) advancedQuery()'
        ],
        correctAnswer: 'A',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '242',
        questionText:
            '¿Qué herramienta analiza el árbol de widgets y sus propiedades en tiempo real?',
        options: [
          'A) Flutter Inspector',
          'B) Dart DevTools',
          'C) Performance Overlay',
          'D) Timeline'
        ],
        correctAnswer: 'A',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '243',
        questionText:
            '¿Qué técnica de estado global es más eficiente para apps con alta frecuencia de actualizaciones?',
        options: ['A) Provider', 'B) Riverpod', 'C) BLoC', 'D) GetX'],
        correctAnswer: 'C',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '244',
        questionText:
            '¿Qué protocolo de CI/CD permite pipelines paralelos con dependencias complejas?',
        options: [
          'A) GitHub Actions',
          'B) Bitrise',
          'C) Codemagic',
          'D) Fastlane'
        ],
        correctAnswer: 'A',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '245',
        questionText:
            '¿Qué técnica optimiza el rendimiento de listas con miles de items?',
        options: [
          'A) Pagination',
          'B) Lazy Loading',
          'C) ListView.builder',
          'D) Todos los anteriores'
        ],
        correctAnswer: 'D',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '246',
        questionText:
            '¿Qué método de RenderObject marca un widget para repintado sin recalcular layout?',
        options: [
          'A) markNeedsPaint()',
          'B) markNeedsLayout()',
          'C) repaint()',
          'D) update()'
        ],
        correctAnswer: 'A',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '247',
        questionText:
            '¿Qué patrón arquitectónico es ideal para apps con lógica de negocio compleja?',
        options: ['A) MVC', 'B) MVVM', 'C) Clean Architecture', 'D) Redux'],
        correctAnswer: 'C',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '248',
        questionText:
            '¿Qué técnica de Firebase permite sincronizar datos offline?',
        options: [
          'A) Firestore Persistence',
          'B) Realtime Database',
          'C) Cloud Sync',
          'D) Offline First'
        ],
        correctAnswer: 'A',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '249',
        questionText:
            '¿Qué herramienta permite crear animaciones complejas con código declarativo?',
        options: ['A) Flutter Animation', 'B) Rive', 'C) Lottie', 'D) Flare'],
        correctAnswer: 'B',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '250',
        questionText:
            '¿Qué técnica de testing verifica flujos de usuario completos en diferentes dispositivos?',
        options: [
          'A) Unit Testing',
          'B) Integration Testing',
          'C) Widget Testing',
          'D) Golden Testing'
        ],
        correctAnswer: 'B',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '251',
        questionText:
            '¿Qué método de optimización reduce el tamaño del bundle eliminando código no usado?',
        options: [
          'A) Minification',
          'B) Obfuscation',
          'C) Tree Shaking',
          'D) Compression'
        ],
        correctAnswer: 'C',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '252',
        questionText:
            '¿Qué componente de Flutter permite la comunicación directa entre isolates?',
        options: [
          'A) MessageChannel',
          'B) Port',
          'C) IsolateHandler',
          'D) StreamController'
        ],
        correctAnswer: 'B',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '253',
        questionText:
            '¿Qué técnica de Firestore mejora el rendimiento de consultas frecuentes?',
        options: [
          'A) Caching',
          'B) Indexing',
          'C) Denormalization',
          'D) Todos los anteriores'
        ],
        correctAnswer: 'D',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '254',
        questionText:
            '¿Qué patrón de estado maneja mejor aplicaciones con múltiples fuentes de datos?',
        options: ['A) BLoC', 'B) Redux', 'C) Riverpod', 'D) GetX'],
        correctAnswer: 'B',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '255',
        questionText:
            '¿Qué herramienta permite analizar el consumo de memoria en tiempo real?',
        options: [
          'A) Memory Profiler',
          'B) Dart DevTools',
          'C) Performance Overlay',
          'D) Timeline'
        ],
        correctAnswer: 'B',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '256',
        questionText:
            '¿Qué técnica de animación permite crear transiciones fluidas entre estados complejos?',
        options: [
          'A) Implicit Animations',
          'B) Explicit Animations',
          'C) Physics-based Animations',
          'D) Custom Painter'
        ],
        correctAnswer: 'C',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '257',
        questionText:
            '¿Qué método de testing verifica la apariencia visual de widgets en diferentes configuraciones?',
        options: [
          'A) Unit Testing',
          'B) Integration Testing',
          'C) Golden Testing',
          'D) Widget Testing'
        ],
        correctAnswer: 'C',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '258',
        questionText:
            '¿Qué técnica de CI/CD permite despliegues automatizados a múltiples entornos?',
        options: [
          'A) Blue-Green Deployment',
          'B) Canary Releases',
          'C) Feature Flags',
          'D) Pipeline Multietapa'
        ],
        correctAnswer: 'D',
        moduleId: 'Sr',
      ),
      ExamQuestionModel(
        id: '259',
        questionText:
            '¿Qué componente de Flutter permite la creación de widgets altamente personalizables?',
        options: [
          'A) CustomPaint',
          'B) RenderObject',
          'C) WidgetBuilder',
          'D) Todos los anteriores'
        ],
        correctAnswer: 'D',
        moduleId: 'Sr',
      ),
    ];

    // Insertar las preguntas en la base de datos
    for (final question in preloadedQuestions) {
      await db.insert(_tableName, question.toMap());
    }
  }

/*   Future<void> printAllQuestions() async {
    final db = await getDatabase();
    final questions = await db.query('exam_questions');
    for (final question in questions) {
      debugPrint(question);
    }
  } */

  // Método genérico para ejecutar consultas
  Future<List<Map<String, dynamic>>> query(String table,
      {String? where, List<dynamic>? whereArgs}) async {
    final db = await getDatabase();
    return await db.query(table, where: where, whereArgs: whereArgs);
  }

  // Método genérico para insertar datos
  Future<void> insert(String table, Map<String, dynamic> data) async {
    final db = await getDatabase();
    await db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
