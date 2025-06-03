import 'package:rutacode/features/exam/data/models/exam_question_model.dart';
import 'package:sqflite/sqflite.dart';

Future<void> preloadJavaJrQuestions(Database db, tableName) async {
  final preloadedJavaJrQuestions = [
    // Preguntas para el módulo Jr

    // Sintaxis Básica
    ExamQuestionModel(
      id: '1',
      questionText:
          '¿Cuál es la extensión de un archivo de código fuente Java?',
      options: ['A) .js', 'B) .java', 'C) .class', 'D) .jvm'],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: '2',
      questionText:
          '¿Qué símbolo se usa para comentarios de una sola línea en Java?',
      options: ['A) //', 'B) /*', 'C) #', 'D) --'],
      correctAnswer: 'A',
      language: 'Java',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: '3',
      questionText: '¿Qué palabra clave define el método principal en Java?',
      options: ['A) start', 'B) main', 'C) void', 'D) public'],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Jr',
    ),

    // Tipos de Datos y Variables
    ExamQuestionModel(
      id: '4',
      questionText: '¿Cuál de estos NO es un tipo primitivo en Java?',
      options: ['A) int', 'B) String', 'C) boolean', 'D) double'],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: '5',
      questionText:
          '¿Qué tipo de dato usarías para almacenar un valor verdadero/falso?',
      options: ['A) int', 'B) boolean', 'C) String', 'D) char'],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: '6',
      questionText: '¿Cómo se declara una variable entera en Java?',
      options: ['A) int x;', 'B) integer x;', 'C) Int x;', 'D) var x;'],
      correctAnswer: 'A',
      language: 'Java',
      module: 'Jr',
    ),

    // Operadores
    ExamQuestionModel(
      id: '7',
      questionText:
          '¿Qué operador se usa para obtener el resto de una división?',
      options: ['A) /', 'B) %', 'C) //', 'D) *'],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: '8',
      questionText: '¿Qué operador lógico representa "Y" en Java?',
      options: ['A) &&', 'B) ||', 'C) !', 'D) &'],
      correctAnswer: 'A',
      language: 'Java',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: '9',
      questionText: '¿Qué hace el operador ++ en Java?',
      options: [
        'A) Suma dos números',
        'B) Incrementa en 1 una variable',
        'C) Concatena strings',
        'D) Compara valores'
      ],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Jr',
    ),

    // Estructuras de Control
    ExamQuestionModel(
      id: '10',
      questionText: '¿Qué estructura se usa para decisiones múltiples en Java?',
      options: ['A) if-else', 'B) for', 'C) switch', 'D) while'],
      correctAnswer: 'C',
      language: 'Java',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: '11',
      questionText: '¿Qué bucle se ejecuta al menos una vez?',
      options: ['A) for', 'B) while', 'C) do-while', 'D) foreach'],
      correctAnswer: 'C',
      language: 'Java',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: '12',
      questionText: '¿Qué palabra clave detiene la ejecución de un bucle?',
      options: ['A) stop', 'B) exit', 'C) break', 'D) return'],
      correctAnswer: 'C',
      language: 'Java',
      module: 'Jr',
    ),

    // POO - Clases y Objetos
    ExamQuestionModel(
      id: '13',
      questionText: '¿Qué palabra clave se usa para crear un objeto en Java?',
      options: ['A) create', 'B) new', 'C) object', 'D) make'],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: '14',
      questionText: '¿Qué es un constructor en Java?',
      options: [
        'A) Un método que destruye objetos',
        'B) Un método especial para inicializar objetos',
        'C) Una clase especial',
        'D) Un tipo de variable'
      ],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: '15',
      questionText:
          '¿Qué palabra clave se refiere a la instancia actual de una clase?',
      options: ['A) this', 'B) self', 'C) super', 'D) current'],
      correctAnswer: 'A',
      language: 'Java',
      module: 'Jr',
    ),

    // POO - Pilares
    ExamQuestionModel(
      id: '16',
      questionText:
          '¿Qué pilar de la POO permite ocultar detalles de implementación?',
      options: [
        'A) Encapsulamiento',
        'B) Herencia',
        'C) Polimorfismo',
        'D) Abstracción'
      ],
      correctAnswer: 'A',
      language: 'Java',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: '17',
      questionText: '¿Qué palabra clave se usa para herencia en Java?',
      options: ['A) inherits', 'B) extends', 'C) implements', 'D) super'],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: '18',
      questionText:
          '¿Qué concepto permite que un método tenga múltiples formas?',
      options: [
        'A) Encapsulamiento',
        'B) Herencia',
        'C) Polimorfismo',
        'D) Abstracción'
      ],
      correctAnswer: 'C',
      language: 'Java',
      module: 'Jr',
    ),

    // POO - Conceptos Avanzados
    ExamQuestionModel(
      id: '19',
      questionText: '¿Qué palabra clave define una interfaz en Java?',
      options: ['A) class', 'B) interface', 'C) abstract', 'D) implements'],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: '20',
      questionText: '¿Qué modificador de acceso es el más restrictivo?',
      options: ['A) public', 'B) protected', 'C) default', 'D) private'],
      correctAnswer: 'D',
      language: 'Java',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: '21',
      questionText:
          '¿Qué palabra clave define un método que pertenece a la clase y no a instancias?',
      options: ['A) final', 'B) static', 'C) const', 'D) abstract'],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Jr',
    ),

    // Arrays y Colecciones
    ExamQuestionModel(
      id: '22',
      questionText: '¿Cómo se declara un array de enteros en Java?',
      options: [
        'A) int[] arr;',
        'B) array int arr;',
        'C) int arr[];',
        'D) A y C son correctas'
      ],
      correctAnswer: 'D',
      language: 'Java',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: '23',
      questionText: '¿Qué colección NO permite elementos duplicados?',
      options: ['A) ArrayList', 'B) LinkedList', 'C) HashSet', 'D) Vector'],
      correctAnswer: 'C',
      language: 'Java',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: '24',
      questionText:
          '¿Qué interfaz representa una colección de pares clave-valor?',
      options: ['A) List', 'B) Set', 'C) Map', 'D) Queue'],
      correctAnswer: 'C',
      language: 'Java',
      module: 'Jr',
    ),

    // Strings
    ExamQuestionModel(
      id: '25',
      questionText: '¿Qué método de String devuelve su longitud?',
      options: ['A) size()', 'B) length()', 'C) count()', 'D) getSize()'],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: '26',
      questionText: '¿Qué clase es mutable (puede modificarse)?',
      options: ['A) String', 'B) StringBuilder', 'C) Ambas', 'D) Ninguna'],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: '27',
      questionText: '¿Qué método convierte un String a mayúsculas?',
      options: [
        'A) toUpperCase()',
        'B) upperCase()',
        'C) capitalize()',
        'D) toUpper()'
      ],
      correctAnswer: 'A',
      language: 'Java',
      module: 'Jr',
    ),

    // Manejo de Archivos
    ExamQuestionModel(
      id: '28',
      questionText:
          '¿Qué clase se usa para leer archivos de texto línea por línea?',
      options: [
        'A) FileReader',
        'B) BufferedReader',
        'C) FileInputStream',
        'D) Scanner'
      ],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: '29',
      questionText: '¿Qué paquete contiene las clases para manejo de archivos?',
      options: [
        'A) java.util',
        'B) java.io',
        'C) java.file',
        'D) java.filesystem'
      ],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Jr',
    ),

    // Excepciones
    ExamQuestionModel(
      id: '30',
      questionText: '¿Qué bloque se usa para manejar excepciones?',
      options: ['A) try', 'B) catch', 'C) finally', 'D) Todas las anteriores'],
      correctAnswer: 'D',
      language: 'Java',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: '31',
      questionText:
          '¿Qué excepción ocurre al acceder a un índice inválido en un array?',
      options: [
        'A) NullPointerException',
        'B) ArrayIndexOutOfBoundsException',
        'C) IndexOutOfRangeException',
        'D) InvalidIndexException'
      ],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: '32',
      questionText: '¿Qué bloque se ejecuta siempre, haya o no excepción?',
      options: ['A) try', 'B) catch', 'C) finally', 'D) throw'],
      correctAnswer: 'C',
      language: 'Java',
      module: 'Jr',
    ),

    // Entorno de Desarrollo
    ExamQuestionModel(
      id: '33',
      questionText: '¿Qué herramienta compila código Java?',
      options: ['A) javac', 'B) java', 'C) jvm', 'D) jdk'],
      correctAnswer: 'A',
      language: 'Java',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: '34',
      questionText: '¿Qué variable de entorno debe configurarse para Java?',
      options: ['A) JAVA_HOME', 'B) JDK_PATH', 'C) JVM_PATH', 'D) CLASS_PATH'],
      correctAnswer: 'A',
      language: 'Java',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: '35',
      questionText: '¿Qué comando ejecuta un programa Java?',
      options: ['A) javac', 'B) java', 'C) run', 'D) execute'],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Jr',
    ),

    // Control de Versiones
    ExamQuestionModel(
      id: '36',
      questionText: '¿Qué comando de Git registra cambios en el repositorio?',
      options: ['A) add', 'B) commit', 'C) push', 'D) save'],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: '37',
      questionText: '¿Qué plataforma es popular para alojar repositorios Git?',
      options: [
        'A) GitHub',
        'B) GitLab',
        'C) Bitbucket',
        'D) Todas las anteriores'
      ],
      correctAnswer: 'D',
      language: 'Java',
      module: 'Jr',
    ),

    // Pruebas Unitarias
    ExamQuestionModel(
      id: '38',
      questionText: '¿Qué anotación marca un método de prueba en JUnit?',
      options: ['A) @Test', 'B) @JUnit', 'C) @Assert', 'D) @Check'],
      correctAnswer: 'A',
      language: 'Java',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: '39',
      questionText: '¿Qué método verifica igualdad en JUnit?',
      options: [
        'A) assertEqual()',
        'B) assertEquals()',
        'C) same()',
        'D) equals()'
      ],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Jr',
    ),

    // Preguntas adicionales para completar 50
    ExamQuestionModel(
      id: '40',
      questionText: '¿Qué tipo de dato ocupa 32 bits en Java?',
      options: ['A) byte', 'B) short', 'C) int', 'D) long'],
      correctAnswer: 'C',
      language: 'Java',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: '41',
      questionText: '¿Qué operador verifica igualdad de valor en Java?',
      options: ['A) =', 'B) ==', 'C) ===', 'D) equals()'],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: '42',
      questionText:
          '¿Qué estructura permite repetir código un número conocido de veces?',
      options: ['A) while', 'B) do-while', 'C) for', 'D) if'],
      correctAnswer: 'C',
      language: 'Java',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: '43',
      questionText: '¿Qué palabra clave evita que una clase sea heredada?',
      options: ['A) private', 'B) final', 'C) static', 'D) sealed'],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: '44',
      questionText: '¿Qué método se llama automáticamente al crear un objeto?',
      options: ['A) main()', 'B) init()', 'C) constructor', 'D) new()'],
      correctAnswer: 'C',
      language: 'Java',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: '45',
      questionText: '¿Qué colección mantiene el orden de inserción?',
      options: ['A) HashSet', 'B) TreeSet', 'C) ArrayList', 'D) HashMap'],
      correctAnswer: 'C',
      language: 'Java',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: '46',
      questionText: '¿Qué método de String verifica si contiene una subcadena?',
      options: ['A) contains()', 'B) has()', 'C) includes()', 'D) find()'],
      correctAnswer: 'A',
      language: 'Java',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: '47',
      questionText:
          '¿Qué excepción ocurre al invocar un método en un objeto null?',
      options: [
        'A) NullPointerException',
        'B) NullReferenceException',
        'C) InvalidObjectException',
        'D) NoSuchMethodException'
      ],
      correctAnswer: 'A',
      language: 'Java',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: '48',
      questionText:
          '¿Qué comando de Git descarga cambios de un repositorio remoto?',
      options: ['A) pull', 'B) fetch', 'C) clone', 'D) download'],
      correctAnswer: 'A',
      language: 'Java',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: '49',
      questionText: '¿Qué anotación de JUnit se ejecuta antes de cada prueba?',
      options: ['A) @Before', 'B) @BeforeEach', 'C) @Setup', 'D) @PreTest'],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: '50',
      questionText: '¿Qué tipo de dato se usa para un único carácter en Java?',
      options: [
        'A) String',
        'B) char',
        'C) Character',
        'D) B y C son correctas'
      ],
      correctAnswer: 'D',
      language: 'Java',
      module: 'Jr',
    ),
  ];

  // Insertar las preguntas en la base de datos
  for (final question in preloadedJavaJrQuestions) {
    await db.insert(tableName, question.toMap());
  }
}

Future<void> preloadJavaMidQuestions(Database db, tableName) async {
  final preloadedJavaMidQuestions = [
    // Preguntas para el módulo Mid

    ExamQuestionModel(
      id: '51',
      questionText:
          '¿Qué interfaz se debe implementar para ordenar objetos con orden natural en Java?',
      options: [
        'A) Comparator',
        'B) Iterable',
        'C) Comparable',
        'D) Serializable'
      ],
      correctAnswer: 'C',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '52',
      questionText: '¿Qué método de Stream permite transformar cada elemento?',
      options: ['A) filter()', 'B) collect()', 'C) map()', 'D) reduce()'],
      correctAnswer: 'C',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '53',
      questionText: '¿Cuál es la diferencia entre Comparable y Comparator?',
      options: [
        'A) Comparable se usa para ordenar listas de números',
        'B) Comparator se implementa en la misma clase',
        'C) Comparable impone un orden natural; Comparator define un orden externo',
        'D) No hay diferencia'
      ],
      correctAnswer: 'C',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '54',
      questionText: '¿Qué palabra clave evita condiciones de carrera en Java?',
      options: ['A) static', 'B) synchronized', 'C) final', 'D) transient'],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '55',
      questionText:
          '¿Qué clase se usa para manejar múltiples hilos de forma eficiente?',
      options: ['A) Thread', 'B) Runnable', 'C) ExecutorService', 'D) Timer'],
      correctAnswer: 'C',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '56',
      questionText:
          '¿Qué método de Thread detiene su ejecución durante un tiempo?',
      options: ['A) wait()', 'B) join()', 'C) sleep()', 'D) pause()'],
      correctAnswer: 'C',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '57',
      questionText:
          '¿Cuál de los siguientes NO es un método intermedio en Stream API?',
      options: ['A) map()', 'B) filter()', 'C) forEach()', 'D) sorted()'],
      correctAnswer: 'C',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '58',
      questionText:
          '¿Qué interfaz funcional acepta un parámetro y no devuelve nada?',
      options: ['A) Predicate', 'B) Supplier', 'C) Consumer', 'D) Function'],
      correctAnswer: 'C',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '59',
      questionText:
          '¿Qué clase permite manejar resultados nulos de forma segura?',
      options: [
        'A) Optional',
        'B) NullHandler',
        'C) EmptyResult',
        'D) SafeReturn'
      ],
      correctAnswer: 'A',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '60',
      questionText:
          '¿Cuál es una ventaja del uso de `PreparedStatement` sobre `Statement`?',
      options: [
        'A) Más rápido',
        'B) Más seguro contra inyecciones SQL',
        'C) Usa menos memoria',
        'D) Menos código'
      ],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '61',
      questionText: '¿Cuál de estas es una operación terminal en Stream API?',
      options: ['A) filter()', 'B) map()', 'C) sorted()', 'D) collect()'],
      correctAnswer: 'D',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '62',
      questionText:
          '¿Qué clase se usa para manejar tareas asincrónicas con retorno?',
      options: ['A) Runnable', 'B) Thread', 'C) Future', 'D) TimerTask'],
      correctAnswer: 'C',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '63',
      questionText:
          '¿Qué método de Thread espera la finalización de otro hilo?',
      options: ['A) wait()', 'B) join()', 'C) notify()', 'D) stop()'],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '64',
      questionText: '¿Qué colección es segura para múltiples hilos?',
      options: [
        'A) HashMap',
        'B) ArrayList',
        'C) CopyOnWriteArrayList',
        'D) TreeSet'
      ],
      correctAnswer: 'C',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '65',
      questionText:
          '¿Qué palabra clave se usa para asegurar la visibilidad entre hilos?',
      options: ['A) static', 'B) final', 'C) volatile', 'D) transient'],
      correctAnswer: 'C',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '66',
      questionText:
          '¿Qué interfaz funcional representa una función que retorna un valor?',
      options: ['A) Consumer', 'B) Supplier', 'C) Predicate', 'D) Comparator'],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '67',
      questionText: '¿Qué anotación indica una entidad en JPA?',
      options: ['A) @Column', 'B) @Table', 'C) @Entity', 'D) @Id'],
      correctAnswer: 'C',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '68',
      questionText:
          '¿Qué método se usa para ejecutar múltiples tareas en ExecutorService?',
      options: ['A) submit()', 'B) start()', 'C) runAll()', 'D) begin()'],
      correctAnswer: 'A',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '69',
      questionText:
          '¿Qué operador se usa en expresiones lambda para separar parámetros del cuerpo?',
      options: ['A) ->', 'B) =>', 'C) :=', 'D) ::'],
      correctAnswer: 'A',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '70',
      questionText:
          '¿Qué método en Optional ejecuta código si hay valor presente?',
      options: ['A) if()', 'B) isPresent()', 'C) ifPresent()', 'D) onValue()'],
      correctAnswer: 'C',
      language: 'Java',
      module: 'Mid',
    ),

    // JDBC, Lambdas, Maven, Gradle, etc.

    ExamQuestionModel(
      id: '71',
      questionText: '¿Cuál de estos NO es un método de la interfaz Stream?',
      options: ['A) filter()', 'B) reduce()', 'C) sum()', 'D) map()'],
      correctAnswer: 'C',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '72',
      questionText: '¿Qué clase gestiona la conexión en JDBC?',
      options: [
        'A) Driver',
        'B) DriverManager',
        'C) ConnectionFactory',
        'D) Connector'
      ],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '73',
      questionText: '¿Qué anotación define el identificador en JPA?',
      options: ['A) @Primary', 'B) @Key', 'C) @Id', 'D) @Identifier'],
      correctAnswer: 'C',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '74',
      questionText:
          '¿Qué interfaz funcional acepta un parámetro y devuelve un valor?',
      options: ['A) Function', 'B) Consumer', 'C) Runnable', 'D) Supplier'],
      correctAnswer: 'A',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '75',
      questionText:
          '¿Qué clase permite ejecutar múltiples tareas concurrentes con retorno?',
      options: [
        'A) Thread',
        'B) FutureTask',
        'C) Callable',
        'D) ExecutorService'
      ],
      correctAnswer: 'D',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '76',
      questionText: '¿Qué método combina valores en una Stream?',
      options: ['A) collect()', 'B) reduce()', 'C) map()', 'D) filter()'],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '77',
      questionText: '¿Qué se usa en Maven para declarar dependencias?',
      options: [
        'A) build.gradle',
        'B) pom.xml',
        'C) config.xml',
        'D) dependencies.txt'
      ],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '78',
      questionText:
          '¿Qué tipo de prueba permite simular dependencias externas?',
      options: ['A) JUnit', 'B) Mockito', 'C) IntegrationTest', 'D) Selenium'],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '79',
      questionText: '¿Cuál es el ciclo de vida por defecto en Maven?',
      options: ['A) compile', 'B) install', 'C) default', 'D) validate'],
      correctAnswer: 'C',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '80',
      questionText:
          '¿Qué herramienta se usa para pruebas con bases de datos reales?',
      options: ['A) Mockito', 'B) Testcontainers', 'C) JUnit', 'D) Jenkins'],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Mid',
    ),

    ExamQuestionModel(
      id: '81',
      questionText:
          '¿Qué clase de Java permite operaciones funcionales sobre colecciones?',
      options: ['A) Stream', 'B) Optional', 'C) Function', 'D) Lambda'],
      correctAnswer: 'A',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '82',
      questionText:
          '¿Qué método de Optional retorna el valor o un valor alternativo?',
      options: ['A) orElse()', 'B) get()', 'C) ifPresent()', 'D) orThrow()'],
      correctAnswer: 'A',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '83',
      questionText: '¿Qué clase permite acceso sincronizado por defecto?',
      options: ['A) ArrayList', 'B) HashMap', 'C) Vector', 'D) TreeMap'],
      correctAnswer: 'C',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '84',
      questionText:
          '¿Cuál es una interfaz funcional con un solo método booleano?',
      options: ['A) Predicate', 'B) Consumer', 'C) Function', 'D) BiConsumer'],
      correctAnswer: 'A',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '85',
      questionText:
          '¿Qué clase representa un punto en el tiempo sin zona horaria?',
      options: [
        'A) LocalDate',
        'B) ZonedDateTime',
        'C) Instant',
        'D) LocalTime'
      ],
      correctAnswer: 'C',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '86',
      questionText:
          '¿Qué clase de colección impide duplicados y no garantiza orden?',
      options: ['A) ArrayList', 'B) LinkedList', 'C) HashSet', 'D) TreeMap'],
      correctAnswer: 'C',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '87',
      questionText: '¿Qué clase se recomienda para cadenas modificables?',
      options: [
        'A) String',
        'B) StringBuffer',
        'C) StringBuilder',
        'D) CharSequence'
      ],
      correctAnswer: 'C',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '88',
      questionText:
          '¿Qué tipo de anotación se usa para pruebas unitarias en JUnit?',
      options: ['A) @Mock', 'B) @Before', 'C) @Test', 'D) @Run'],
      correctAnswer: 'C',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '89',
      questionText:
          '¿Cuál de estos es un método default de las interfaces en Java 8+?',
      options: ['A) default()', 'B) static()', 'C) abstract()', 'D) private()'],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '90',
      questionText:
          '¿Qué estructura de datos se recomienda para acceso por clave y es ordenada?',
      options: ['A) HashMap', 'B) LinkedList', 'C) TreeMap', 'D) ArrayList'],
      correctAnswer: 'C',
      language: 'Java',
      module: 'Mid',
    ),

    ExamQuestionModel(
      id: '91',
      questionText:
          '¿Cuál es la principal diferencia entre las interfaces Runnable y Callable en Java?',
      options: [
        'A) Runnable puede lanzar excepciones, Callable no',
        'B) Callable retorna un resultado, Runnable no',
        'C) Runnable es para tareas asincrónicas, Callable para tareas sincrónicas',
        'D) Callable es más antigua que Runnable'
      ],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '92',
      questionText:
          '¿Qué método de la clase Object se utiliza para obtener una notificación cuando un hilo espera?',
      options: ['A) wait()', 'B) notify()', 'C) sleep()', 'D) join()'],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '93',
      questionText:
          '¿Qué clase se utiliza para representar una fecha sin zona horaria en Java 8?',
      options: ['A) Date', 'B) Calendar', 'C) LocalDate', 'D) ZonedDateTime'],
      correctAnswer: 'C',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '94',
      questionText: '¿Cuál es la diferencia principal entre HashMap y TreeMap?',
      options: [
        'A) HashMap permite claves duplicadas, TreeMap no',
        'B) TreeMap mantiene el orden natural de las claves, HashMap no',
        'C) HashMap es más lento que TreeMap',
        'D) TreeMap permite claves nulas, HashMap no'
      ],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '95',
      questionText:
          '¿Qué anotación se utiliza para indicar que un método sobrescribe otro en una superclase?',
      options: ['A) @Override', 'B) @Overload', 'C) @Inherited', 'D) @Super'],
      correctAnswer: 'A',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '96',
      questionText:
          '¿Qué operador se utiliza para referenciar un método en Java 8?',
      options: ['A) ::', 'B) ->', 'C) =>', 'D) **'],
      correctAnswer: 'A',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '97',
      questionText:
          '¿Qué método de la clase Thread se utiliza para iniciar la ejecución de un hilo?',
      options: ['A) run()', 'B) start()', 'C) execute()', 'D) begin()'],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '98',
      questionText:
          '¿Cuál es el propósito de la palabra clave "transient" en Java?',
      options: [
        'A) Indicar que una variable es constante',
        'B) Excluir un campo de la serialización',
        'C) Permitir la herencia de una clase',
        'D) Marcar un método como obsoleto'
      ],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '99',
      questionText:
          '¿Qué clase en Java se utiliza para leer datos de una fuente de entrada de manera eficiente?',
      options: [
        'A) Scanner',
        'B) BufferedReader',
        'C) InputStream',
        'D) FileReader'
      ],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: '100',
      questionText: '¿Qué método se utiliza para comparar dos objetos en Java?',
      options: ['A) equals()', 'B) compareTo()', 'C) ==', 'D) compare()'],
      correctAnswer: 'A',
      language: 'Java',
      module: 'Mid',
    ),
  ];

  // Insertar las preguntas en la base de datos
  for (final question in preloadedJavaMidQuestions) {
    await db.insert(tableName, question.toMap());
  }
}

Future<void> preloadJavaSrQuestions(Database db, tableName) async {
  final preloadedJavaSrQuestions = [
    // Preguntas para el módulo Sr

    // Patrones de Diseño - Creacionales
    ExamQuestionModel(
      id: '101',
      questionText:
          '¿Qué patrón creacional asegura que una clase tenga solo una instancia?',
      options: [
        'A) Factory Method',
        'B) Singleton',
        'C) Builder',
        'D) Prototype'
      ],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: '102',
      questionText:
          '¿Qué patrón es útil cuando la construcción de un objeto es compleja?',
      options: [
        'A) Abstract Factory',
        'B) Builder',
        'C) Singleton',
        'D) Adapter'
      ],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Sr',
    ),

    // Patrones de Diseño - Estructurales
    ExamQuestionModel(
      id: '103',
      questionText:
          '¿Qué patrón permite que interfaces incompatibles trabajen juntas?',
      options: ['A) Decorator', 'B) Facade', 'C) Adapter', 'D) Proxy'],
      correctAnswer: 'C',
      language: 'Java',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: '104',
      questionText:
          '¿Qué patrón añade funcionalidad a un objeto dinámicamente?',
      options: ['A) Composite', 'B) Decorator', 'C) Bridge', 'D) Flyweight'],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Sr',
    ),

    // Patrones de Diseño - Comportamiento
    ExamQuestionModel(
      id: '105',
      questionText:
          '¿Qué patrón define una familia de algoritmos intercambiables?',
      options: [
        'A) Observer',
        'B) Strategy',
        'C) Command',
        'D) Template Method'
      ],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: '106',
      questionText:
          '¿Qué patrón notifica a objetos dependientes de cambios de estado?',
      options: [
        'A) Mediator',
        'B) Observer',
        'C) Chain of Responsibility',
        'D) Visitor'
      ],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Sr',
    ),

    // Rendimiento y Optimización - JVM
    ExamQuestionModel(
      id: '107',
      questionText:
          '¿Qué recolector de basura es adecuado para aplicaciones con baja latencia?',
      options: ['A) Serial GC', 'B) Parallel GC', 'C) CMS', 'D) G1 GC'],
      correctAnswer: 'D',
      language: 'Java',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: '108',
      questionText:
          '¿Qué área de memoria de la JVM almacena objetos recién creados?',
      options: ['A) Heap', 'B) Stack', 'C) Metaspace', 'D) Eden Space'],
      correctAnswer: 'D',
      language: 'Java',
      module: 'Sr',
    ),

    // Spring Framework - Core
    ExamQuestionModel(
      id: '109',
      questionText:
          '¿Qué anotación de Spring marca una clase como componente gestionado?',
      options: ['A) @Service', 'B) @Component', 'C) @Bean', 'D) @Repository'],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: '110',
      questionText:
          '¿Qué patrón implementa la inyección de dependencias en Spring?',
      options: [
        'A) Factory',
        'B) Singleton',
        'C) Decorator',
        'D) Inversión de Control'
      ],
      correctAnswer: 'D',
      language: 'Java',
      module: 'Sr',
    ),

    // Spring Boot
    ExamQuestionModel(
      id: '111',
      questionText: '¿Qué archivo configura las dependencias en Spring Boot?',
      options: [
        'A) application.properties',
        'B) pom.xml/build.gradle',
        'C) spring-config.xml',
        'D) bootstrap.yml'
      ],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: '112',
      questionText: '¿Qué anotación marca la clase principal en Spring Boot?',
      options: [
        'A) @MainApplication',
        'B) @SpringBootApplication',
        'C) @EnableAutoConfiguration',
        'D) @SpringApplication'
      ],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Sr',
    ),

    // Microservicios
    ExamQuestionModel(
      id: '113',
      questionText:
          '¿Qué componente de Spring Cloud implementa service discovery?',
      options: ['A) Zuul', 'B) Eureka', 'C) Ribbon', 'D) Config Server'],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: '114',
      questionText: '¿Qué protocolo es común en APIs de microservicios?',
      options: ['A) SOAP', 'B) REST', 'C) RPC', 'D) GraphQL'],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Sr',
    ),

    // Seguridad
    ExamQuestionModel(
      id: '115',
      questionText: '¿Qué estándar se usa para autenticación con tokens JWT?',
      options: ['A) OAuth1', 'B) OAuth2', 'C) Basic Auth', 'D) OpenID'],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: '116',
      questionText: '¿Qué anotación protege endpoints en Spring Security?',
      options: [
        'A) @Secure',
        'B) @PreAuthorize',
        'C) @Protected',
        'D) @AuthRequired'
      ],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Sr',
    ),

    // Eventos y Mensajería
    ExamQuestionModel(
      id: '117',
      questionText:
          '¿Qué tecnología se usa comúnmente para mensajería asíncrona?',
      options: ['A) RabbitMQ', 'B) JDBC', 'C) WebSockets', 'D) REST Template'],
      correctAnswer: 'A',
      language: 'Java',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: '118',
      questionText:
          '¿Qué patrón implica almacenar todos los cambios como eventos?',
      options: [
        'A) CQRS',
        'B) Event Sourcing',
        'C) Saga',
        'D) Circuit Breaker'
      ],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Sr',
    ),

    // DevOps
    ExamQuestionModel(
      id: '119',
      questionText:
          '¿Qué herramienta se usa para análisis estático de código Java?',
      options: ['A) Jenkins', 'B) SonarQube', 'C) Prometheus', 'D) Grafana'],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: '120',
      questionText:
          '¿Qué archivo define la configuración de Docker para una app Java?',
      options: [
        'A) docker-compose.yml',
        'B) Dockerfile',
        'C) container.json',
        'D) docker-config.xml'
      ],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Sr',
    ),

    // Java Reactive
    ExamQuestionModel(
      id: '121',
      questionText: '¿Qué proyecto de Spring soporta programación reactiva?',
      options: [
        'A) Spring MVC',
        'B) Spring WebFlux',
        'C) Spring Batch',
        'D) Spring Data'
      ],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: '122',
      questionText: '¿Qué interfaz representa un flujo reactivo en Java?',
      options: ['A) Stream', 'B) Flux', 'C) Optional', 'D) CompletableFuture'],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Sr',
    ),

    // Cloud
    ExamQuestionModel(
      id: '123',
      questionText:
          '¿Qué servicio AWS es adecuado para desplegar apps Java sin servidores?',
      options: ['A) EC2', 'B) Lambda', 'C) ECS', 'D) Elastic Beanstalk'],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: '124',
      questionText: '¿Qué herramienta se usa para orquestar contenedores?',
      options: [
        'A) Docker Compose',
        'B) Kubernetes',
        'C) Jenkins',
        'D) Terraform'
      ],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Sr',
    ),

    // Tópicos Avanzados
    ExamQuestionModel(
      id: '125',
      questionText: '¿Qué tecnología permite compilar Java a código nativo?',
      options: ['A) HotSpot', 'B) GraalVM', 'C) J9', 'D) OpenJDK'],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Sr',
    ),

    // Spring Data JPA
    ExamQuestionModel(
      id: '126',
      questionText:
          '¿Qué anotación de JPA marca una clase como entidad persistente?',
      options: ['A) @Entity', 'B) @Table', 'C) @Repository', 'D) @Persistent'],
      correctAnswer: 'A',
      language: 'Java',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: '127',
      questionText:
          '¿Qué método de Spring Data JPA ejecuta automáticamente consultas derivadas del nombre del método?',
      options: ['A) @Query', 'B) Query Methods', 'C) JPQL', 'D) Criteria API'],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Sr',
    ),

    // Concurrencia Avanzada
    ExamQuestionModel(
      id: '128',
      questionText:
          '¿Qué interfaz representa una tarea asíncrona que puede retornar un resultado?',
      options: [
        'A) Runnable',
        'B) Future',
        'C) Callable',
        'D) CompletableFuture'
      ],
      correctAnswer: 'C',
      language: 'Java',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: '129',
      questionText:
          '¿Qué clase proporciona un bloqueo reentrante con más flexibilidad que synchronized?',
      options: [
        'A) Semaphore',
        'B) ReentrantLock',
        'C) CountDownLatch',
        'D) CyclicBarrier'
      ],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Sr',
    ),

    // Java Moderno (Features 8+)
    ExamQuestionModel(
      id: '130',
      questionText:
          '¿Qué interfaz funcional representa una operación que acepta un argumento y no devuelve resultado?',
      options: [
        'A) Supplier<T>',
        'B) Consumer<T>',
        'C) Function<T,R>',
        'D) Predicate<T>'
      ],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: '131',
      questionText:
          '¿Qué método de Optional se usa para proporcionar un valor por defecto?',
      options: ['A) orElse()', 'B) get()', 'C) ifPresent()', 'D) filter()'],
      correctAnswer: 'A',
      language: 'Java',
      module: 'Sr',
    ),

    // Performance Optimization
    ExamQuestionModel(
      id: '132',
      questionText: '¿Qué herramienta se usa para microbenchmarking en Java?',
      options: ['A) JProfiler', 'B) VisualVM', 'C) JMH', 'D) YourKit'],
      correctAnswer: 'C',
      language: 'Java',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: '133',
      questionText: '¿Qué técnica ayuda a prevenir memory leaks en Java?',
      options: [
        'A) Usar WeakReferences',
        'B) Incrementar heap size',
        'C) Desactivar GC',
        'D) Usar solo variables static'
      ],
      correctAnswer: 'A',
      language: 'Java',
      module: 'Sr',
    ),

    // Spring Cloud
    ExamQuestionModel(
      id: '134',
      questionText:
          '¿Qué componente de Spring Cloud implementa un API Gateway?',
      options: [
        'A) Spring Cloud Config',
        'B) Spring Cloud Gateway',
        'C) Spring Cloud Bus',
        'D) Spring Cloud Circuit Breaker'
      ],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: '135',
      questionText: '¿Qué patrón protege servicios de fallos en cascada?',
      options: [
        'A) Service Discovery',
        'B) Circuit Breaker',
        'C) API Gateway',
        'D) Config Server'
      ],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Sr',
    ),

    // Kubernetes
    ExamQuestionModel(
      id: '136',
      questionText: '¿Qué recurso de Kubernetes define cómo desplegar pods?',
      options: ['A) Pod', 'B) Deployment', 'C) Service', 'D) ReplicaSet'],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: '137',
      questionText: '¿Qué comando muestra los logs de un pod en Kubernetes?',
      options: [
        'A) kubectl logs [pod-name]',
        'B) kubectl get logs [pod-name]',
        'C) kubectl pod logs [pod-name]',
        'D) kubectl show logs [pod-name]'
      ],
      correctAnswer: 'A',
      language: 'Java',
      module: 'Sr',
    ),

    // Observabilidad
    ExamQuestionModel(
      id: '138',
      questionText:
          '¿Qué herramienta se usa comúnmente para monitoreo de métricas en aplicaciones Java?',
      options: ['A) Prometheus', 'B) Jaeger', 'C) Zipkin', 'D) ELK'],
      correctAnswer: 'A',
      language: 'Java',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: '139',
      questionText:
          '¿Qué anotación de Spring Boot expone métricas de actuator para Prometheus?',
      options: [
        'A) @EnableMetrics',
        'B) @PrometheusScrape',
        'C) @ActuatorEndpoint',
        'D) Ninguna, se configura en application.properties'
      ],
      correctAnswer: 'D',
      language: 'Java',
      module: 'Sr',
    ),

    // Seguridad Avanzada
    ExamQuestionModel(
      id: '140',
      questionText:
          '¿Qué componente de OAuth2 representa la aplicación que consume el API?',
      options: [
        'A) Resource Owner',
        'B) Client',
        'C) Resource Server',
        'D) Authorization Server'
      ],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: '141',
      questionText: '¿Qué algoritmo se usa comúnmente para firmar tokens JWT?',
      options: ['A) MD5', 'B) SHA-1', 'C) HS256', 'D) AES'],
      correctAnswer: 'C',
      language: 'Java',
      module: 'Sr',
    ),

    // Event-Driven Architecture
    ExamQuestionModel(
      id: '142',
      questionText:
          '¿Qué tecnología de mensajería usa el concepto de topics y partitions?',
      options: ['A) RabbitMQ', 'B) Kafka', 'C) ActiveMQ', 'D) JMS'],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: '143',
      questionText:
          '¿Qué patrón maneja transacciones distribuidas en microservicios?',
      options: [
        'A) Two-Phase Commit',
        'B) Saga',
        'C) Event Sourcing',
        'D) CQRS'
      ],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Sr',
    ),

    // Java Avanzado
    ExamQuestionModel(
      id: '144',
      questionText: '¿Qué característica de Java 9 introduce módulos?',
      options: ['A) JPMS', 'B) Jigsaw', 'C) Jlink', 'D) Todas las anteriores'],
      correctAnswer: 'D',
      language: 'Java',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: '145',
      questionText:
          '¿Qué método de CompletableFuture combina múltiples futuros?',
      options: ['A) allOf()', 'B) combine()', 'C) merge()', 'D) join()'],
      correctAnswer: 'A',
      language: 'Java',
      module: 'Sr',
    ),

    // Cloud Native
    ExamQuestionModel(
      id: '146',
      questionText: '¿Qué servicio de AWS es un registry de contenedores?',
      options: ['A) ECR', 'B) ECS', 'C) EKS', 'D) S3'],
      correctAnswer: 'A',
      language: 'Java',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: '147',
      questionText:
          '¿Qué herramienta de HashiCorp se usa para manejar secretos en la nube?',
      options: ['A) Terraform', 'B) Vault', 'C) Consul', 'D) Nomad'],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Sr',
    ),

    // Testing Avanzado
    ExamQuestionModel(
      id: '148',
      questionText:
          '¿Qué librería permite mockear clases final en pruebas unitarias?',
      options: ['A) Mockito', 'B) PowerMock', 'C) EasyMock', 'D) JMockit'],
      correctAnswer: 'B',
      language: 'Java',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: '149',
      questionText: '¿Qué anotación de JUnit 5 ejecuta pruebas parametrizadas?',
      options: [
        'A) @ParameterizedTest',
        'B) @TestWithParameters',
        'C) @RepeatedTest',
        'D) @ValueSource'
      ],
      correctAnswer: 'A',
      language: 'Java',
      module: 'Sr',
    ),

    // CI/CD
    ExamQuestionModel(
      id: '150',
      questionText: '¿Qué archivo define el pipeline en GitHub Actions?',
      options: [
        'A) workflow.yml',
        'B) actions.yaml',
        'C) pipeline.json',
        'D) main.workflow'
      ],
      correctAnswer: 'A',
      language: 'Java',
      module: 'Sr',
    )
  ];

  // Insertar las preguntas en la base de datos
  for (final question in preloadedJavaSrQuestions) {
    await db.insert(tableName, question.toMap());
  }
}
