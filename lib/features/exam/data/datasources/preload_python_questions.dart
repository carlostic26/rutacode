import 'package:sqflite_common/sqlite_api.dart';
import 'package:rutacode/features/exam/data/models/exam_question_model.dart';

Future<void> preloadPythonJrQuestions(Database db, tableName) async {
  final preloadedPythonJrQuestions = [
    ExamQuestionModel(
      id: 'py_jr_01',
      questionText:
          '¿Cuál de las siguientes opciones describe correctamente la indentación en Python?',
      options: [
        'A) Es opcional para mejorar la legibilidad del código.',
        'B) Se usa para definir bloques de código y es obligatoria.',
        'C) Se utiliza solo para comentarios multilinea.',
        'D) No tiene ninguna función específica en la sintaxis de Python.'
      ],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Jr',
    ),

    ExamQuestionModel(
      id: 'py_jr_02',
      questionText:
          '¿Cómo se define un comentario de una sola línea en Python?',
      options: [
        'A) // Este es un comentario',
        'B) /* Este es un comentario */',
        'C) # Este es un comentario',
        'D) '
      ],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'py_jr_03',
      questionText:
          '¿Qué se utiliza para definir un bloque de código en Python?',
      options: [
        'A) Llaves ({})',
        'B) Corchetes ([])',
        'C) Indentación',
        'D) Paréntesis (())'
      ],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Jr',
    ),
    // Topic 2: Tipos de Datos y Variables
    ExamQuestionModel(
      id: 'py_jr_04',
      questionText:
          '¿Cuál de los siguientes no es un tipo de dato básico en Python?',
      options: ['A) int', 'B) float', 'C) char', 'D) bool'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'py_jr_05',
      questionText:
          '¿Qué tipo de dato se utiliza para almacenar una colección ordenada e inmutable de elementos en Python?',
      options: ['A) list', 'B) set', 'C) dict', 'D) tuple'],
      correctAnswer: 'D',
      language: 'Python',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'py_jr_06',
      questionText: '¿Cómo se declara e inicializa una variable en Python?',
      options: [
        'A) var myVariable = 10;',
        'B) int myVariable = 10;',
        'C) myVariable = 10',
        'D) let myVariable = 10;'
      ],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'py_jr_07',
      questionText:
          '¿Cuál es el ámbito de una variable declarada dentro de una función en Python?',
      options: ['A) Global', 'B) Local', 'C) Module', 'D) Class'],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Jr',
    ),
    // Topic 3: Operadores
    ExamQuestionModel(
      id: 'py_jr_08',
      questionText:
          '¿Cuál es el resultado de la operación `10 // 3` en Python?',
      options: ['A) 3.33', 'B) 3', 'C) 1', 'D) 0.33'],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'py_jr_09',
      questionText:
          '¿Cuál de los siguientes operadores se utiliza para la igualdad en Python?',
      options: ['A) =', 'B) ==', 'C) ===', 'D) !='],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'py_jr_10',
      questionText:
          '¿Qué operador lógico se usa para combinar dos condiciones donde ambas deben ser verdaderas?',
      options: ['A) or', 'B) not', 'C) and', 'D) xor'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'py_jr_11',
      questionText:
          'Si `x = 5`, ¿cuál es el valor de `x` después de ejecutar `x += 3`?',
      options: ['A) 5', 'B) 3', 'C) 8', 'D) 2'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Jr',
    ),
    // Nivel 2: Programación Orientada a Objetos
    // Topic 1: Clases y Objetos
    ExamQuestionModel(
      id: 'py_jr_12',
      questionText:
          '¿Qué palabra clave se usa para definir una clase en Python?',
      options: ['A) define class', 'B) class', 'C) object', 'D) new class'],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'py_jr_13',
      questionText:
          '¿Cómo se llama el método constructor en una clase de Python?',
      options: ['A) constructor()', 'B) __init__()', 'C) new()', 'D) create()'],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Jr',
    ),
    // Topic 2: Pilares de la POO
    ExamQuestionModel(
      id: 'py_jr_14',
      questionText:
          '¿Qué pilar de la POO se refiere a la capacidad de una subclase para heredar atributos y métodos de una superclase?',
      options: [
        'A) Encapsulamiento',
        'B) Polimorfismo',
        'C) Herencia',
        'D) Abstracción'
      ],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'py_jr_15',
      questionText:
          '¿Cuál es el propósito de los métodos especiales como `__str__` y `__repr__` en Python?',
      options: [
        'A) Definir operadores aritméticos.',
        'B) Controlar la creación y eliminación de objetos.',
        'C) Proporcionar representaciones de cadena para objetos.',
        'D) Implementar interfaces.'
      ],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Jr',
    ),
    // Topic 3: Conceptos Avanzados (POO Jr.)
    ExamQuestionModel(
      id: 'py_jr_16',
      questionText:
          r'''¿Qué símbolo se utiliza para aplicar un decorador a una función o método en Python?''',
      options: ['A) #', 'B) @', r'''C) $''', 'D) &'],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'py_jr_17',
      questionText:
          '¿Cuál de las siguientes opciones es una característica de las `dataclasses` introducidas en Python 3.7+?',
      options: [
        'A) Requieren la implementación manual de `__init__`, `__repr__`, etc.',
        'B) Son inmutables por defecto y no pueden tener atributos.',
        'C) Simplifican la creación de clases principalmente para almacenar datos.',
        'D) Son una alternativa a las clases abstractas.'
      ],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Jr',
    ),
    // Nivel 3: Manejo de Datos
    // Topic 1: Estructuras de Datos
    ExamQuestionModel(
      id: 'py_jr_18',
      questionText:
          '¿Cuál de las siguientes estructuras de datos en Python es inmutable?',
      options: ['A) List', 'B) Dictionary', 'C) Tuple', 'D) Set'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'py_jr_19',
      questionText:
          '¿Qué estructura de datos almacena pares clave-valor en Python?',
      options: ['A) List', 'B) Tuple', 'C) Set', 'D) Dictionary'],
      correctAnswer: 'D',
      language: 'Python',
      module: 'Jr',
    ),
    // Topic 2: Strings y Manipulación
    ExamQuestionModel(
      id: 'py_jr_20',
      questionText:
          '¿Cuál es la forma más moderna y recomendada para formatear cadenas en Python 3.6+?',
      options: [
        'A) El operador %',
        'B) El método .format()',
        'C) f-strings',
        'D) Concatenación con +'
      ],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'py_jr_21',
      questionText:
          '¿Qué módulo se utiliza en Python para trabajar con expresiones regulares básicas?',
      options: ['A) str_utils', 'B) re', 'C) regex_lib', 'D) pattern'],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Jr',
    ),
    // Topic 3: Manejo de Archivos
    ExamQuestionModel(
      id: 'py_jr_22',
      questionText:
          '¿Cuál es el propósito de usar `with open(...)` en Python al manejar archivos?',
      options: [
        'A) Abre el archivo en modo de solo lectura.',
        'B) Asegura que el archivo se cierre automáticamente, incluso si ocurre un error.',
        'C) Permite escribir en archivos sin necesidad de permisos.',
        'D) Impide que otros programas accedan al archivo mientras está abierto.'
      ],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'py_jr_23',
      questionText:
          '¿Qué formato de archivo se usa comúnmente para almacenar datos tabulares y puede ser leído por el módulo `csv` en Python?',
      options: ['A) XML', 'B) PDF', 'C) CSV', 'D) TXT'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Jr',
    ),
    // Nivel 4: Manejo de Excepciones
    // Topic 1: Tipos de Excepciones
    ExamQuestionModel(
      id: 'py_jr_24',
      questionText:
          '¿Cuál de las siguientes es una excepción común en Python que se produce cuando se intenta realizar una operación en un tipo de dato incorrecto?',
      options: [
        'A) ValueError',
        'B) IndexError',
        'C) TypeError',
        'D) KeyError'
      ],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'py_jr_25',
      questionText: '¿Cómo se levanta una excepción personalizada en Python?',
      options: [
        'A) throw MyException',
        'B) create MyException',
        'C) raise MyException',
        'D) generate MyException'
      ],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Jr',
    ),

    ExamQuestionModel(
      id: 'py_jr_26',
      questionText:
          '¿Cuál es la secuencia correcta de bloques para manejar excepciones en Python?',
      options: [
        'A) try-except-finally-else',
        'B) try-else-except-finally',
        'C) try-except-else-finally',
        'D) except-try-else-finally'
      ],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'py_jr_27',
      questionText:
          '¿Qué bloque de código se ejecuta siempre, independientemente de si ocurre una excepción o no?',
      options: ['A) try', 'B) except', 'C) else', 'D) finally'],
      correctAnswer: 'D',
      language: 'Python',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'py_jr_28',
      questionText: '¿Qué información proporciona un `traceback` en Python?',
      options: [
        'A) El uso de memoria del programa.',
        'B) El historial de llamadas a funciones que llevaron a una excepción.',
        'C) Los valores de todas las variables en un momento dado.',
        'D) La versión del intérprete de Python en uso.'
      ],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Jr',
    ),

    // Nivel 5: Herramientas Básicas
    // Topic 1: Entorno de Desarrollo
    ExamQuestionModel(
      id: 'py_jr_29',
      questionText:
          '¿Cuál es la herramienta de gestión de paquetes estándar para Python?',
      options: ['A) npm', 'B) pip', 'C) gem', 'D) apt'],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'py_jr_30',
      questionText:
          '¿Para qué se utilizan los entornos virtuales (`venv`) en Python?',
      options: [
        'A) Para ejecutar código Python en un servidor remoto.',
        'B) Para aislar las dependencias de los proyectos Python.',
        'C) Para depurar código Python.',
        'D) Para convertir código Python a otros lenguajes.'
      ],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'py_jr_31',
      questionText:
          '¿Cuál de los siguientes es un IDE popular para el desarrollo en Python?',
      options: ['A) Notepad++', 'B) Sublime Text', 'C) PyCharm', 'D) Gedit'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'py_jr_32',
      questionText: '¿Cómo se ejecuta un script de Python desde la terminal?',
      options: [
        'A) run script.py',
        'B) python script.py',
        'C) execute script.py',
        'D) start script.py'
      ],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Jr',
    ),
    // Topic 2: Control de Versiones
    ExamQuestionModel(
      id: 'py_jr_33',
      questionText:
          '¿Qué sistema de control de versiones se menciona como básico en el documento?',
      options: ['A) SVN', 'B) Mercurial', 'C) Git', 'D) CVS'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'py_jr_34',
      questionText:
          '¿Cuál es el propósito del archivo `.gitignore` en un proyecto Python que usa Git?',
      options: [
        'A) Listar las dependencias del proyecto.',
        'B) Especificar los archivos que Git debe ignorar (no rastrear).',
        'C) Configurar el autor del repositorio Git.',
        'D) Definir los permisos de acceso al repositorio.'
      ],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Jr',
    ),
    // Topic 3: Pruebas Unitarias
    ExamQuestionModel(
      id: 'py_jr_35',
      questionText:
          '¿Qué módulo estándar de Python se utiliza para escribir pruebas unitarias?',
      options: ['A) test_unit', 'B) unittest', 'C) py_test', 'D) check_test'],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'py_jr_36',
      questionText:
          '¿Qué biblioteca popular de terceros se menciona para realizar pruebas unitarias en Python, más allá del módulo estándar?',
      options: ['A) Nose', 'B) Mock', 'C) pytest', 'D) coverage'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'py_jr_37',
      questionText:
          '¿Qué es una "Assertion" en el contexto de las pruebas unitarias?',
      options: [
        'A) Una declaración que verifica si una condición es verdadera.',
        'B) Un error que detiene la ejecución del programa.',
        'C) Un comentario en el código de prueba.',
        'D) Una función que genera datos de prueba.'
      ],
      correctAnswer: 'A',
      language: 'Python',
      module: 'Jr',
    ),

    // Junior (Jr) - Nivel 1: Fundamentos de Python
    // Topic 4: Estructuras de Control
    ExamQuestionModel(
      id: 'py_jr_38',
      questionText:
          '¿Qué sentencia se usa para ejecutar diferentes bloques de código basados en múltiples condiciones?',
      options: [
        'A) if-else',
        'B) switch-case',
        'C) if-elif-else',
        'D) case-when'
      ],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'py_jr_39',
      questionText:
          '¿Qué tipo de bucle se utiliza para iterar sobre una secuencia (como una lista o cadena)?',
      options: ['A) while', 'B) do-while', 'C) for', 'D) until'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'py_jr_40',
      questionText:
          '¿Cuál de las siguientes sentencias se usa para salir completamente de un bucle?',
      options: ['A) continue', 'B) exit', 'C) break', 'D) return'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'py_jr_41',
      questionText:
          '¿Qué sentencia se usa para saltar el resto del código en la iteración actual de un bucle y pasar a la siguiente?',
      options: ['A) break', 'B) skip', 'C) next', 'D) continue'],
      correctAnswer: 'D',
      language: 'Python',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'py_jr_42',
      questionText: '¿Cuál es el propósito de la sentencia `pass` en Python?',
      options: [
        'A) Se usa para ignorar errores.',
        'B) Es un marcador de posición nulo que no hace nada.',
        'C) Cierra el programa.',
        'D) Detiene la ejecución de un bucle.'
      ],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Jr',
    ),

    // Nivel 1: Fundamentos de Python
    // Topic 2: Tipos de Datos y Variables (Más preguntas)
    ExamQuestionModel(
      id: 'py_jr_43',
      questionText:
          '¿Qué tipo de dato complejo es una colección ordenada y mutable de elementos?',
      options: ['A) tuple', 'B) set', 'C) list', 'D) dict'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'py_jr_44',
      questionText:
          '¿Cuál de los siguientes es un tipo de dato inmutable en Python?',
      options: ['A) list', 'B) dict', 'C) str', 'D) set'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'py_jr_45',
      questionText:
          'Si una variable se declara fuera de cualquier función o clase, ¿qué ámbito tiene?',
      options: ['A) Local', 'B) Clase', 'C) Global', 'D) Módulo'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Jr',
    ),

    // Nivel 1: Fundamentos de Python
    // Topic 3: Operadores (Más preguntas)
    ExamQuestionModel(
      id: 'py_jr_46',
      questionText:
          '¿Qué operador aritmético se usa para la exponenciación (elevar a una potencia) en Python?',
      options: ['A) ^', 'B) **', 'C) exp', 'D) pow()'],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'py_jr_47',
      questionText: '¿Cuál es el resultado de `7 % 3` en Python?',
      options: ['A) 2.33', 'B) 2', 'C) 1', 'D) 0'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'py_jr_48',
      questionText:
          '¿Cuál de los siguientes operadores de comparación significa "no igual a"?',
      options: ['A) =!', 'B) <>', 'C) !==', 'D) !='],
      correctAnswer: 'D',
      language: 'Python',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'py_jr_49',
      questionText: '¿Cuál es el resultado de `True or False` en Python?',
      options: ['A) False', 'B) True', 'C) None', 'D) Error'],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'py_jr_50',
      questionText:
          'Si `y = 10`, ¿cuál es el valor de `y` después de ejecutar `y /= 2`?',
      options: ['A) 5', 'B) 10', 'C) 20', 'D) 2'],
      correctAnswer: 'A',
      language: 'Python',
      module: 'Jr',
    ),
  ];

  // Insertar las preguntas en la base de datos
  for (final question in preloadedPythonJrQuestions) {
    await db.insert(tableName, question.toMap());
  }
}

Future<void> preloadPythonMidQuestions(Database db, tableName) async {
  final preloadedPythonMidQuestions = [
    ExamQuestionModel(
      id: 'py_mid_01',
      questionText:
          '¿Qué concepto algorítmico implica que una función se llama a sí misma para resolver un problema?',
      options: [
        'A) Iteración',
        'B) Recursión',
        'C) Búsqueda',
        'D) Ordenamiento'
      ],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'py_mid_02',
      questionText:
          '¿Cuál de los siguientes algoritmos se utiliza para organizar elementos en un orden específico?',
      options: [
        'A) Búsqueda lineal',
        'B) Búsqueda binaria',
        'C) Ordenamiento',
        'D) Hash'
      ],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'py_mid_03',
      questionText:
          '¿Qué algoritmo de búsqueda es eficiente para listas ordenadas, dividiendo repetidamente la lista por la mitad?',
      options: [
        'A) Búsqueda lineal',
        'B) Búsqueda binaria',
        'C) Búsqueda de amplitud',
        'D) Búsqueda de profundidad'
      ],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'py_mid_04',
      questionText:
          '¿Qué notación se usa para describir el rendimiento (tiempo o espacio) de un algoritmo en función del tamaño de la entrada?',
      options: [
        'A) Big-O',
        'B) O-Notation',
        'C) Complexity-O',
        'D) Algorithmic-O'
      ],
      correctAnswer: 'A',
      language: 'Python',
      module: 'Mid',
    ),
    // Topic 2: Colecciones Avanzadas
    ExamQuestionModel(
      id: 'py_mid_05',
      questionText:
          '¿Qué tipo de diccionario del módulo `collections` permite especificar un valor por defecto para las claves que no existen?',
      options: [
        'A) OrderedDict',
        'B) namedtuple',
        'C) defaultdict',
        'D) Counter'
      ],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'py_mid_06',
      questionText:
          '¿Qué `namedtuple` proporciona una forma fácil de crear clases de objetos ligeros con atributos nombrados?',
      options: [
        'A) tupledict',
        'B) namedtuple',
        'C) attrtuple',
        'D) data_tuple'
      ],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'py_mid_07',
      questionText:
          '¿Qué módulo se utiliza para implementar un "heap" (montículo), una estructura de datos basada en árboles binarios?',
      options: ['A) queue', 'B) heapq', 'C) treeq', 'D) stack'],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'py_mid_08',
      questionText:
          '¿Qué módulo de Python proporciona funciones para mantener una lista ordenada sin tener que reordenarla completamente después de cada inserción?',
      options: ['A) sortlist', 'B) orderedlist', 'C) bisect', 'D) insertsort'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Mid',
    ),

    // Nivel 2: Concurrencia y Paralelismo
    // Topic 1: Threads Básicos
    ExamQuestionModel(
      id: 'py_mid_09',
      questionText:
          '¿Qué módulo de Python se utiliza para trabajar con hilos (threads)?',
      options: [
        'A) multiprocessing',
        'B) asyncio',
        'C) threading',
        'D) concurrent'
      ],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'py_mid_10',
      questionText: '¿Qué es el GIL (Global Interpreter Lock) en Python?',
      options: [
        'A) Un mecanismo que permite que múltiples hilos se ejecuten en paralelo completo.',
        'B) Un bloqueo que permite que solo un hilo de Python se ejecute a la vez dentro del intérprete.',
        'C) Una herramienta para depurar programas multihilo.',
        'D) Un sistema de gestión de memoria para hilos.'
      ],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'py_mid_11',
      questionText:
          '¿Qué problema puede ocurrir en la programación concurrente cuando múltiples hilos acceden y modifican datos compartidos sin sincronización adecuada?',
      options: [
        'A) Deadlock',
        'B) Race condition',
        'C) Livelock',
        'D) Starvation'
      ],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Mid',
    ),
    // Topic 2: Multiprocessing
    ExamQuestionModel(
      id: 'py_mid_12',
      questionText:
          '¿Qué módulo de Python se utiliza para aprovechar múltiples núcleos de CPU y ejecutar tareas en paralelo real?',
      options: [
        'A) threading',
        'B) asyncio',
        'C) multiprocessing',
        'D) concurrent.futures'
      ],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'py_mid_13',
      questionText:
          '¿Qué clase del módulo `multiprocessing` se usa para crear un grupo de procesos que pueden ejecutar tareas de forma concurrente?',
      options: [
        'A) ProcessGroup',
        'B) WorkerPool',
        'C) Pool',
        'D) ProcessQueue'
      ],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'py_mid_14',
      questionText:
          '¿Qué objeto del módulo `multiprocessing` se usa para permitir la comunicación segura entre procesos?',
      options: ['A) Pipe', 'B) ShareData', 'C) Queue', 'D) Event'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Mid',
    ),
    // Topic 3: Asincronía
    ExamQuestionModel(
      id: 'py_mid_15',
      questionText:
          '¿Qué palabras clave se utilizan en Python para escribir código asíncrono y esperar resultados sin bloquear el hilo principal?',
      options: [
        'A) start/stop',
        'B) async/await',
        'C) run/pause',
        'D) begin/end'
      ],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'py_mid_16',
      questionText:
          '¿Qué módulo de Python proporciona la infraestructura para escribir código concurrente utilizando sintaxis `async/await`?',
      options: ['A) concurrent', 'B) threading', 'C) asyncio', 'D) tasks'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'py_mid_17',
      questionText:
          '¿Qué es un "Event loop" en el contexto de la programación asíncrona en Python?',
      options: [
        'A) Un bucle que ejecuta código síncrono en secuencia.',
        'B) Un componente central que gestiona y distribuye las tareas asíncronas.',
        'C) Un mecanismo para detectar errores en código asíncrono.',
        'D) Una herramienta para la depuración de aplicaciones concurrentes.'
      ],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Mid',
    ),

    // Nivel 3: Python Moderno
    // Topic 1: Tipado
    ExamQuestionModel(
      id: 'py_mid_18',
      questionText:
          '¿Qué característica de Python permite agregar sugerencias de tipo a variables, parámetros de función y valores de retorno?',
      options: [
        'A) Dynamic typing',
        'B) Type casting',
        'C) Type hints',
        'D) Strict typing'
      ],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'py_mid_19',
      questionText:
          '¿Qué herramienta se utiliza para realizar la verificación estática de tipos en código Python?',
      options: ['A) PyLint', 'B) Flake8', 'C) mypy', 'D) Black'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'py_mid_20',
      questionText:
          '¿Qué biblioteca se menciona que utiliza anotaciones de tipo para la validación de datos, especialmente útil en APIs web?',
      options: ['A) Marshmallow', 'B) Pydantic', 'C) Cerberus', 'D) Valida'],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Mid',
    ),
    // Topic 2: Funcional
    ExamQuestionModel(
      id: 'py_mid_21',
      questionText: '¿Qué son las "Lambda functions" en Python?',
      options: [
        'A) Funciones con nombres largos y complejos.',
        'B) Pequeñas funciones anónimas de una sola expresión.',
        'C) Funciones que siempre devuelven `None`.',
        'D) Funciones que requieren múltiples argumentos posicionales.'
      ],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'py_mid_22',
      questionText:
          '¿Qué función incorporada en Python aplica una función a cada elemento de un iterable y devuelve un iterador de los resultados?',
      options: ['A) filter', 'B) reduce', 'C) map', 'D) apply'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'py_mid_23',
      questionText:
          '¿Qué módulo estándar de Python proporciona herramientas de programación funcional, como `partial` y `wraps`?',
      options: [
        'A) itertools',
        'B) collections',
        'C) functools',
        'D) operator'
      ],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Mid',
    ),
    // Topic 3: Iteradores y Generadores
    ExamQuestionModel(
      id: 'py_mid_24',
      questionText:
          '¿Qué palabra clave se usa en una función para convertirla en un generador?',
      options: ['A) return', 'B) generate', 'C) yield', 'D) iterate'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'py_mid_25',
      questionText:
          'Es un tipo de objeto que produce una secuencia de resultados uno por uno a medida que se solicitan, en lugar de construirlos todos a la vez:',
      options: ['A) Lista', 'B) Tupla', 'C) Generador', 'D) Diccionario'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'py_mid_26',
      questionText:
          '¿Qué módulo estándar de Python proporciona funciones para crear iteradores de forma eficiente y trabajar con secuencias infinitas o complejas?',
      options: [
        'A) functools',
        'B) collections',
        'C) itertools',
        'D) operator'
      ],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Mid',
    ),

    // Nivel 4: Bases de Datos
    // Topic 1: SQL Básico
    ExamQuestionModel(
      id: 'py_mid_27',
      questionText:
          '¿Qué módulo estándar de Python se utiliza para interactuar con bases de datos SQLite?',
      options: [
        'A) mysql.connector',
        'B) psycopg2',
        'C) sqlite3',
        'D) database_api'
      ],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'py_mid_28',
      questionText:
          '¿Qué tipo de consultas básicas se realizan comúnmente con SQL para recuperar datos de una base de datos?',
      options: ['A) CREATE', 'B) INSERT', 'C) SELECT', 'D) DELETE'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'py_mid_29',
      questionText: '¿Qué parte de SQLAlchemy se menciona como un ORM básico?',
      options: [
        'A) SQLAlchemy ORM',
        'B) SQLAlchemy Core',
        'C) SQLAlchemy Migrate',
        'D) SQLAlchemy Alembic'
      ],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Mid',
    ),
    // Topic 2: ORMs
    ExamQuestionModel(
      id: 'py_mid_30',
      questionText: '¿Qué ORM popular se utiliza con el framework web Django?',
      options: [
        'A) SQLAlchemy ORM',
        'B) Peewee',
        'C) PonyORM',
        'D) Django ORM'
      ],
      correctAnswer: 'D',
      language: 'Python',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'py_mid_31',
      questionText: '¿Qué es un "Modelo" en el contexto de un ORM?',
      options: [
        'A) Una representación de la interfaz de usuario.',
        'B) Una clase Python que mapea a una tabla de base de datos.',
        'C) Un esquema de base de datos.',
        'D) Una función que ejecuta consultas SQL.'
      ],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Mid',
    ),

    // Nivel 5: Pruebas Avanzadas
    // Topic 1: Pruebas Unitarias
    ExamQuestionModel(
      id: 'py_mid_32',
      questionText:
          '¿Qué característica de `pytest` permite ejecutar la misma prueba con diferentes conjuntos de datos de entrada?',
      options: ['A) fixtures', 'B) setup', 'C) parametriza', 'D) hooks'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'py_mid_33',
      questionText:
          'En `pytest`, ¿qué se utiliza para proporcionar un entorno de prueba consistente y reutilizable, a menudo con recursos como conexiones a bases de datos o archivos temporales?',
      options: [
        'A) setup/teardown',
        'B) mocks',
        'C) fixtures',
        'D) assertions'
      ],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Mid',
    ),
    // Topic 2: Mocking
    ExamQuestionModel(
      id: 'py_mid_34',
      questionText:
          '¿Qué módulo de Python se utiliza para crear objetos "mock" (simulados) en pruebas unitarias?',
      options: [
        'A) test_mock',
        'B) unittest.mock',
        'C) simulate',
        'D) fake_objects'
      ],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'py_mid_35',
      questionText:
          '¿Cuál es la función principal de `patch` en el módulo `unittest.mock`?',
      options: [
        'A) Para aplicar actualizaciones de seguridad a módulos.',
        'B) Para reemplazar objetos o funciones temporalmente durante una prueba.',
        'C) Para depurar código con errores.',
        'D) Para mejorar el rendimiento de las pruebas.'
      ],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'py_mid_36',
      questionText:
          '¿Qué clase del módulo `unittest.mock` permite crear objetos simulados con atributos y métodos dinámicos?',
      options: [
        'A) SimpleMock',
        'B) DynamicMock',
        'C) MagicMock',
        'D) AutoMock'
      ],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Mid',
    ),

    // Nivel 6: Gestión de Dependencias
    // Topic 1: Entornos Virtuales
    ExamQuestionModel(
      id: 'py_mid_37',
      questionText:
          'Además de `venv`, ¿qué otra herramienta popular de gestión de entornos virtuales se menciona?',
      options: [
        'A) virtualenvwrapper',
        'B) conda',
        'C) pipenv',
        'D) poetryenv'
      ],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'py_mid_38',
      questionText:
          '¿Qué herramienta de gestión de dependencias y entornos virtuales se menciona que busca reemplazar tanto `pip` como `venv`?',
      options: ['A) Conda', 'B) Pipenv', 'C) Poetry', 'D) Pyenv'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Mid',
    ),
    // Topic 2: Empaquetado
    ExamQuestionModel(
      id: 'py_mid_39',
      questionText:
          '¿Qué archivo se utilizaba tradicionalmente para definir cómo se empaqueta un proyecto Python?',
      options: [
        'A) package.json',
        'B) requirements.txt',
        'C) setup.py',
        'D) manifest.json'
      ],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'py_mid_40',
      questionText:
          '¿Qué archivo se está convirtiendo en el estándar moderno para la configuración de proyectos Python y el empaquetado?',
      options: [
        'A) setup.cfg',
        'B) pyproject.toml',
        'C) config.ini',
        'D) project.yaml'
      ],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'py_mid_41',
      questionText:
          '¿Qué formato de archivo de distribución de Python precompilado se utiliza para una instalación más rápida y sencilla?',
      options: ['A) .tar.gz', 'B) .zip', 'C) .egg', 'D) .wheel'],
      correctAnswer: 'D',
      language: 'Python',
      module: 'Mid',
    ),

    // Preguntas adicionales para completar 25 del módulo Mid
    // Nivel 1: Estructuras de Datos Avanzadas
    // Topic 1: Algoritmos (Más preguntas)
    ExamQuestionModel(
      id: 'py_mid_42',
      questionText:
          r'''Un algoritmo tiene una complejidad $O(n^2)$. Si la entrada se duplica, ¿cómo afectará esto al tiempo de ejecución?''',
      options: [
        'A) Se duplicará.',
        'B) Se cuadruplicará.',
        'C) Permanecerá igual.',
        'D) Se reducirá a la mitad.'
      ],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'py_mid_43',
      questionText:
          '¿Qué término describe un algoritmo que divide un problema grande en subproblemas más pequeños del mismo tipo, resolviendo los subproblemas y combinando sus soluciones?',
      options: [
        'A) Greedy algorithm',
        'B) Divide and conquer',
        'C) Dynamic programming',
        'D) Backtracking'
      ],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Mid',
    ),

    // Nivel 2: Concurrencia y Paralelismo
    // Topic 1: Threads Básicos (Más preguntas)
    ExamQuestionModel(
      id: 'py_mid_44',
      questionText:
          '¿Qué función se utiliza comúnmente en el módulo `threading` para iniciar la ejecución de un hilo?',
      options: ['A) run()', 'B) execute()', 'C) start()', 'D) begin()'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'py_mid_45',
      questionText:
          '¿Qué método de un objeto `Thread` se utiliza para esperar a que el hilo termine su ejecución?',
      options: ['A) end()', 'B) stop()', 'C) wait()', 'D) join()'],
      correctAnswer: 'D',
      language: 'Python',
      module: 'Mid',
    ),

    // Nivel 3: Python Moderno
    // Topic 1: Tipado (Más preguntas)
    ExamQuestionModel(
      id: 'py_mid_46',
      questionText:
          '¿Cuál es el beneficio principal de usar `type hints` en código Python?',
      options: [
        'A) Hace el código más lento.',
        'B) Permite la detección de errores de tipo estáticos y mejora la legibilidad.',
        'C) Es un reemplazo completo para las pruebas unitarias.',
        'D) Solo funciona con versiones antiguas de Python.'
      ],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Mid',
    ),
    // Topic 2: Funcional (Más preguntas)
    ExamQuestionModel(
      id: 'py_mid_47',
      questionText:
          '¿Qué función del módulo `functools` se utiliza para crear nuevas funciones a partir de funciones existentes, con algunos argumentos predefinidos?',
      options: ['A) compose', 'B) partial', 'C) decorate', 'D) reduce'],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'py_mid_48',
      questionText:
          '¿Qué función incorporada en Python filtra elementos de un iterable basándose en una función que devuelve `True` o `False`?',
      options: ['A) map', 'B) apply', 'C) filter', 'D) reduce'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Mid',
    ),
    // Nivel 4: Bases de Datos
    // Topic 1: SQL Básico (Más preguntas)
    ExamQuestionModel(
      id: 'py_mid_49',
      questionText:
          '¿Qué sentencia SQL se usa para agregar nuevos registros a una tabla?',
      options: [
        'A) ADD INTO',
        'B) UPDATE',
        'C) INSERT INTO',
        'D) CREATE RECORD'
      ],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'py_mid_50',
      questionText:
          'Cuando se trabaja con `sqlite3` en Python, ¿qué método de un objeto cursor se utiliza para ejecutar una consulta SQL?',
      options: ['A) run()', 'B) query()', 'C) execute()', 'D) dispatch()'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Mid',
    ),
  ];

  // Insertar las preguntas en la base de datos
  for (final question in preloadedPythonMidQuestions) {
    await db.insert(tableName, question.toMap());
  }
}

Future<void> preloadPythonSrQuestions(Database db, tableName) async {
  final preloadedPythonSrQuestions = [
    ExamQuestionModel(
      id: 'py_sr_01',
      questionText:
          '¿Qué patrón de diseño asegura que una clase tenga una única instancia y proporciona un punto de acceso global a ella?',
      options: ['A) Factory', 'B) Builder', 'C) Singleton', 'D) Prototype'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'py_sr_02',
      questionText:
          '¿Qué patrón de diseño se utiliza para crear objetos sin especificar la clase exacta del objeto que se va a crear?',
      options: [
        'A) Abstract Factory',
        'B) Builder',
        'C) Singleton',
        'D) Factory'
      ],
      correctAnswer: 'D',
      language: 'Python',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'py_sr_03',
      questionText:
          '¿Qué patrón de diseño se enfoca en la construcción de objetos complejos paso a paso?',
      options: [
        'A) Singleton',
        'B) Builder',
        'C) Factory Method',
        'D) Prototype'
      ],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Sr',
    ),
    // Topic 2: Patrones Estructurales
    ExamQuestionModel(
      id: 'py_sr_04',
      questionText:
          '¿Qué patrón de diseño permite que interfaces incompatibles trabajen juntas?',
      options: ['A) Decorator', 'B) Facade', 'C) Adapter', 'D) Proxy'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'py_sr_05',
      questionText:
          '¿Qué patrón de diseño adjunta responsabilidades adicionales a un objeto de forma dinámica?',
      options: ['A) Adapter', 'B) Composite', 'C) Decorator', 'D) Flyweight'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'py_sr_06',
      questionText:
          '¿Qué patrón de diseño proporciona una interfaz unificada y simplificada a un conjunto de interfaces en un subsistema?',
      options: ['A) Adapter', 'B) Facade', 'C) Bridge', 'D) Proxy'],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Sr',
    ),
    // Topic 3: Patrones de Comportamiento
    ExamQuestionModel(
      id: 'py_sr_07',
      questionText:
          '¿Qué patrón de diseño define una dependencia de uno a muchos entre objetos, de modo que cuando un objeto cambia de estado, todos sus dependientes son notificados y actualizados automáticamente?',
      options: [
        'A) Strategy',
        'B) Command',
        'C) Observer',
        'D) Template Method'
      ],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'py_sr_08',
      questionText:
          '¿Qué patrón de diseño permite a un algoritmo variar independientemente de los clientes que lo usan?',
      options: [
        'A) Observer',
        'B) Strategy',
        'C) Chain of Responsibility',
        'D) State'
      ],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'py_sr_09',
      questionText:
          '¿Qué patrón de diseño encapsula una solicitud como un objeto, permitiendo la parametrización de clientes con diferentes solicitudes, la cola o el registro de solicitudes, y el soporte de operaciones que se pueden deshacer?',
      options: ['A) Iterator', 'B) Mediator', 'C) Command', 'D) Memento'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Sr',
    ),

    // Nivel 2: Rendimiento y Optimización
    // Topic 1: Profiling
    ExamQuestionModel(
      id: 'py_sr_10',
      questionText:
          '¿Qué módulo estándar de Python se utiliza para el profiling de código, midiendo el tiempo de ejecución de diferentes partes del programa?',
      options: ['A) time', 'B) profile_tool', 'C) cProfile', 'D) perf_monitor'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'py_sr_11',
      questionText:
          '¿Qué módulo se utiliza para medir el tiempo de ejecución de pequeños fragmentos de código en Python?',
      options: ['A) datetime', 'B) stopwatch', 'C) timeit', 'D) timer'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'py_sr_12',
      questionText:
          '¿Qué herramienta se menciona para perfilar el uso de memoria de un programa Python?',
      options: [
        'A) memory_usage',
        'B) mem_profiler',
        'C) memory_profiler',
        'D) psutil'
      ],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Sr',
    ),
    // Topic 2: Optimización
    ExamQuestionModel(
      id: 'py_sr_13',
      questionText:
          '¿Qué herramienta permite escribir extensiones de Python en C o C++ y compilar el código Python para mejorar el rendimiento?',
      options: ['A) PyPy', 'B) Jython', 'C) Cython', 'D) IronPython'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'py_sr_14',
      questionText:
          '¿Qué biblioteca se utiliza para compilar funciones Python para la CPU o GPU en tiempo de ejecución, a menudo para cálculos numéricos intensivos?',
      options: ['A) TensorFlow', 'B) Numba', 'C) PyTorch', 'D) Keras'],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'py_sr_15',
      questionText:
          '¿Qué biblioteca es esencial para la "vectorización" de operaciones numéricas en Python, lo que resulta en un rendimiento significativamente mejorado para arrays grandes?',
      options: ['A) SciPy', 'B) Pandas', 'C) NumPy', 'D) Matplotlib'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Sr',
    ),

    // Nivel 3: Frameworks Web
    // Topic 1: Django
    ExamQuestionModel(
      id: 'py_sr_16',
      questionText: '¿Qué arquitectura sigue el framework Django?',
      options: ['A) MVC', 'B) MVVM', 'C) MTV', 'D) MVP'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'py_sr_17',
      questionText:
          'En Django, ¿qué componente se encarga de la interacción con la base de datos y define la estructura de los datos?',
      options: ['A) Views', 'B) Templates', 'C) ORM', 'D) URLs'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'py_sr_18',
      questionText:
          'En Django, ¿qué se utiliza para mapear URLs a funciones o clases Python que manejan las solicitudes web?',
      options: ['A) Models', 'B) Views', 'C) Templates', 'D) URLs'],
      correctAnswer: 'D',
      language: 'Python',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'py_sr_19',
      questionText:
          'En Django, ¿qué se utiliza para la representación de la interfaz de usuario, mezclando HTML con lógica de plantilla?',
      options: ['A) Views', 'B) Models', 'C) Controllers', 'D) Templates'],
      correctAnswer: 'D',
      language: 'Python',
      module: 'Sr',
    ),
    // Topic 2: FastAPI
    ExamQuestionModel(
      id: 'py_sr_20',
      questionText:
          '¿Cuál es una característica clave de FastAPI que lo hace adecuado para APIs de alto rendimiento?',
      options: [
        'A) Síncrono',
        'B) Basado en Flask',
        'C) Async',
        'D) Solo para bases de datos SQL'
      ],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'py_sr_21',
      questionText: 'FastAPI utiliza `Pydantic models` para...',
      options: [
        'A) Definir la interfaz de usuario.',
        'B) Validar y serializar datos.',
        'C) Manejar autenticación.',
        'D) Conectar a bases de datos.'
      ],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'py_sr_22',
      questionText:
          '¿Qué estándar de API se genera automáticamente por FastAPI, permitiendo la documentación interactiva?',
      options: ['A) RESTful API', 'B) GraphQL', 'C) SOAP', 'D) OpenAPI'],
      correctAnswer: 'D',
      language: 'Python',
      module: 'Sr',
    ),
    // Topic 3: Flask
    ExamQuestionModel(
      id: 'py_sr_23',
      questionText:
          '¿Qué concepto en Flask permite estructurar aplicaciones grandes y modularizar diferentes partes de la aplicación?',
      options: ['A) Routes', 'B) Blueprints', 'C) Modules', 'D) Components'],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'py_sr_24',
      questionText:
          'Flask es un microframework. Su funcionalidad puede extenderse a través de...',
      options: [
        'A) Bibliotecas externas únicamente.',
        'B) Extensions',
        'C) Solo plugins oficiales.',
        'D) Añadiendo más rutas.'
      ],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'py_sr_25',
      questionText:
          '¿Qué es WSGI en el contexto de Flask y otras aplicaciones web Python?',
      options: [
        'A) Un protocolo para bases de datos web.',
        'B) Una interfaz entre servidores web y aplicaciones web Python.',
        'C) Un estándar para la comunicación entre microservicios.',
        'D) Un formato de datos para APIs.'
      ],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Sr',
    ),

    ExamQuestionModel(
      id: 'py_sr_26',
      questionText:
          '¿Qué arquitectura se enfoca en construir una aplicación como una colección de servicios pequeños, independientes y acoplados laxamente?',
      options: [
        'A) Monolítica',
        'B) Microservicios',
        'C) Cliente-Servidor',
        'D) Peer-to-Peer'
      ],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'py_sr_27',
      questionText:
          '¿Qué tipo de arquitectura es fundamental en el diseño de microservicios para permitir la comunicación asíncrona y desacoplada entre servicios?',
      options: [
        'A) Request-response',
        'B) Batch processing',
        'C) Event-driven architecture',
        'D) Monolithic design'
      ],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'py_sr_28',
      questionText:
          '¿Qué protocolo de comunicación RPC de alto rendimiento se menciona como una alternativa eficiente a REST en arquitecturas de microservicios?',
      options: ['A) SOAP', 'B) XML-RPC', 'C) gRPC', 'D) JSON-RPC'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'py_sr_29',
      questionText:
          '¿Qué característica se asocia con REST avanzado en el contexto de las APIs, permitiendo que el cliente descubra las capacidades de la API?',
      options: ['A) SOAP headers', 'B) HATEOAS', 'C) RPC calls', 'D) WSDL'],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Sr',
    ),
    // Topic 2: Seguridad
    ExamQuestionModel(
      id: 'py_sr_30',
      questionText:
          '¿Qué estándar abierto se utiliza para la autenticación y el intercambio seguro de información entre las partes como un objeto JSON?',
      options: ['A) SAML', 'B) JWT', 'C) OAuth 1.0', 'D) OpenID'],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'py_sr_31',
      questionText:
          '¿Qué marco de autorización permite a las aplicaciones de terceros acceder a recursos de usuario en un servidor HTTP con la aprobación del usuario?',
      options: ['A) Basic Auth', 'B) API Key', 'C) OAuth', 'D) Digest Auth'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'py_sr_32',
      questionText:
          '¿Qué algoritmo de hashing se recomienda para almacenar contraseñas de forma segura en Python debido a su capacidad de ser lento y resistente a ataques de fuerza bruta?',
      options: ['A) MD5', 'B) SHA-256', 'C) bcrypt', 'D) PBKDF2'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Sr',
    ),
    // Topic 3: Mensajería
    ExamQuestionModel(
      id: 'py_sr_33',
      questionText:
          '¿Qué broker de mensajes popular se utiliza para la comunicación asíncrona entre microservicios, basado en el protocolo AMQP?',
      options: ['A) ZeroMQ', 'B) Redis Pub/Sub', 'C) RabbitMQ', 'D) ActiveMQ'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'py_sr_34',
      questionText:
          '¿Qué plataforma de streaming de eventos distribuida se utiliza para construir pipelines de datos en tiempo real y aplicaciones de streaming?',
      options: [
        'A) AWS SQS',
        'B) Kafka',
        'C) Google Pub/Sub',
        'D) Azure Service Bus'
      ],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'py_sr_35',
      questionText:
          '¿Qué biblioteca de Python se utiliza para la gestión de tareas distribuidas y procesamiento asíncrono, a menudo con RabbitMQ o Redis?',
      options: ['A) RQ', 'B) Dramatiq', 'C) Celery', 'D) Huey'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Sr',
    ),

    // Nivel 5: DevOps para Python
    // Topic 1: CI/CD
    ExamQuestionModel(
      id: 'py_sr_36',
      questionText:
          '¿Qué plataforma de CI/CD se menciona como una herramienta integrada para automatizar flujos de trabajo de desarrollo en GitHub?',
      options: [
        'A) Jenkins',
        'B) GitLab CI/CD',
        'C) Travis CI',
        'D) GitHub Actions'
      ],
      correctAnswer: 'D',
      language: 'Python',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'py_sr_37',
      questionText:
          '¿Qué tecnología se utiliza para empaquetar una aplicación Python y sus dependencias en un contenedor aislado, facilitando la implementación en cualquier entorno?',
      options: [
        'A) Virtual machines',
        'B) Dockerización',
        'C) Vagrant',
        'D) Kubernetes'
      ],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'py_sr_38',
      questionText:
          '¿Cuál es el beneficio principal de ejecutar pruebas en el entorno de CI (Integración Continua)?',
      options: [
        'A) Permite la depuración manual.',
        'B) Asegura que el código nuevo no rompa las funcionalidades existentes.',
        'C) Reduce el tiempo de desarrollo.',
        'D) Genera documentación del proyecto.'
      ],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Sr',
    ),
    // Topic 2: Cloud
    ExamQuestionModel(
      id: 'py_sr_39',
      questionText:
          '¿Qué servicio de "serverless compute" de AWS permite ejecutar código Python sin aprovisionar ni administrar servidores?',
      options: ['A) EC2', 'B) Lambda', 'C) S3', 'D) ECS'],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'py_sr_40',
      questionText:
          '¿Cuál es el servicio equivalente a AWS Lambda en Google Cloud Platform para funciones sin servidor?',
      options: [
        'A) Compute Engine',
        'B) Cloud Run',
        'C) Cloud Functions',
        'D) App Engine'
      ],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'py_sr_41',
      questionText:
          '¿Qué servicio de Microsoft Azure se utiliza para implementar funciones sin servidor escritas en Python?',
      options: [
        'A) Azure VMs',
        'B) Azure App Service',
        'C) Azure Functions',
        'D) Azure Kubernetes Service'
      ],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Sr',
    ),

    // Nivel 6: Tópicos Avanzados
    // Topic 1: Descriptores
    ExamQuestionModel(
      id: 'py_sr_42',
      questionText: '¿Qué es un "descriptor" en Python?',
      options: [
        'A) Un tipo de dato para describir objetos.',
        'B) Un protocolo que permite a un objeto personalizar el acceso de atributos de otros objetos.',
        'C) Una función para decorar clases.',
        'D) Un método para depurar propiedades.'
      ],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'py_sr_43',
      questionText:
          '¿Qué método de un descriptor se llama cuando se accede al atributo (get, set, delete)?',
      options: [
        'A) __get__',
        'B) __access__',
        'C) __attribute__',
        'D) __call__'
      ],
      correctAnswer: 'A',
      language: 'Python',
      module: 'Sr',
    ),
    // Topic 2: Metaclases
    ExamQuestionModel(
      id: 'py_sr_44',
      questionText: '¿Qué es una "metaclase" en Python?',
      options: [
        'A) Una clase abstracta.',
        'B) Una clase que define cómo se crean las clases.',
        'C) Un tipo de herencia múltiple.',
        'D) Una clase utilizada para la validación de tipos.'
      ],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'py_sr_45',
      questionText:
          '¿Qué método se llama implícitamente cuando se define una nueva clase en Python, y puede ser sobrescrito por una metaclase?',
      options: ['A) __init__', 'B) __call__', 'C) __new__', 'D) __build__'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Sr',
    ),
    // Topic 3: Introspección y Reflexión
    ExamQuestionModel(
      id: 'py_sr_46',
      questionText:
          '¿Qué función incorporada de Python se utiliza para obtener una lista de los nombres de los atributos y métodos de un objeto?',
      options: [
        'A) get_attrs()',
        'B) inspect()',
        'C) dir()',
        'D) attributes()'
      ],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'py_sr_47',
      questionText:
          '¿Qué función se utiliza para verificar si un objeto tiene un atributo determinado?',
      options: [
        'A) check_attr()',
        'B) has_attr()',
        'C) hasattr()',
        'D) is_attr()'
      ],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'py_sr_48',
      questionText:
          '¿Qué módulo de la biblioteca estándar de Python proporciona funciones para examinar objetos activos (módulos, clases, funciones, etc.)?',
      options: ['A) reflection', 'B) sys', 'C) inspect', 'D) builtins'],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Sr',
    ),
    // Topic 4: CPython Internals (Subtopic no mencionado en el PDF, pero necesario para completar las 25)
    ExamQuestionModel(
      id: 'py_sr_49',
      questionText: '¿Qué es el "Global Interpreter Lock (GIL)" en CPython?',
      options: [
        'A) Un mecanismo que permite la ejecución paralela real de múltiples hilos en CPython.',
        'B) Un bloqueo que permite que solo un hilo de Python se ejecute a la vez en CPython.',
        'C) Una herramienta para depurar código en CPython.',
        'D) Un sistema de gestión de memoria para CPython.'
      ],
      correctAnswer: 'B',
      language: 'Python',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'py_sr_50',
      questionText:
          '¿Qué tipo de colección interna utiliza CPython para optimizar la búsqueda de nombres de variables y atributos?',
      options: [
        'A) Listas enlazadas',
        'B) Arrays dinámicos',
        'C) Diccionarios (tablas hash)',
        'D) Árboles binarios'
      ],
      correctAnswer: 'C',
      language: 'Python',
      module: 'Sr',
    ),
  ];

  // Insertar las preguntas en la base de datos
  for (final question in preloadedPythonSrQuestions) {
    await db.insert(tableName, question.toMap());
  }
}
