import 'package:sqflite_common/sqlite_api.dart';
import 'package:rutacode/features/exam/data/models/exam_question_model.dart';

Future<void> preloadCppJrQuestions(Database db, tableName) async {
  final preloadedCppJrQuestions = [
    ExamQuestionModel(
      id: 'cpp_jr_01',
      questionText: '¿Qué es C++?',
      options: [
        'A) Un lenguaje de programación de alto nivel para desarrollo web.',
        'B) Un lenguaje de programación de propósito general, derivado de C, con soporte para programación orientada a objetos.',
        'C) Un sistema operativo de código abierto.',
        'D) Una base de datos relacional.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_02',
      questionText: '¿Cuál de los siguientes NO es un compilador común de C++?',
      options: ['A) GCC', 'B) Clang', 'C) MSVC', 'D) Python Interpreter'],
      correctAnswer: 'D',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_03',
      questionText:
          '¿Qué es el propósito principal de un IDE en el desarrollo de C++?',
      options: [
        'A) Ejecutar programas directamente en la web.',
        'B) Proporcionar un entorno integrado para escribir, compilar y depurar código.',
        'C) Administrar bases de datos.',
        'D) Diseñar interfaces gráficas de usuario exclusivamente.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_04',
      questionText:
          '¿Qué comando se utiliza típicamente para compilar un archivo C++ desde la línea de comandos con GCC?',
      options: [
        'A) run file.cpp',
        'B) compile file.cpp',
        'C) g++ file.cpp -o executable',
        'D) execute file.cpp'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_05',
      questionText:
          '¿Cuál es la función principal de Git en el desarrollo de software?',
      options: [
        'A) Para compilar código fuente.',
        'B) Para controlar versiones de código fuente.',
        'C) Para depurar programas.',
        'D) Para escribir documentación del proyecto.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_06',
      questionText:
          '¿Cuál de los siguientes es un tipo de dato primitivo en C++?',
      options: ['A) String', 'B) Array', 'C) int', 'D) List'],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_07',
      questionText:
          '¿Qué operador se utiliza para asignar un valor a una variable en C++?',
      options: ['A) ==', 'B) +', 'C) =', 'D) !='],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_08',
      questionText:
          '¿Qué palabra clave se usa para definir una constante en C++ que puede ser evaluada en tiempo de compilación?',
      options: ['A) const', 'B) static', 'C) volatile', 'D) constexpr'],
      correctAnswer: 'D',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_09',
      questionText:
          '¿Cuál es la estructura condicional más adecuada para manejar múltiples opciones discretas en C++?',
      options: [
        'A) if-else if-else',
        'B) switch-case',
        'C) Operador ternario',
        'D) while loop'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_10',
      questionText:
          '¿Cuál de los siguientes bucles garantiza que su bloque de código se ejecute al menos una vez?',
      options: ['A) while', 'B) for', 'C) do-while', 'D) foreach'],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_11',
      questionText:
          '¿Qué instrucción se usa para salir de un bucle inmediatamente en C++?',
      options: ['A) exit', 'B) return', 'C) break', 'D) continue'],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_12',
      questionText:
          '¿Qué palabra clave se utiliza para lanzar una excepción en C++?',
      options: ['A) catch', 'B) try', 'C) throw', 'D) finally'],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_13',
      questionText: '¿Cuál es el propósito principal de una función en C++?',
      options: [
        'A) Declarar variables globales.',
        'B) Organizar el código en bloques reutilizables y realizar tareas específicas.',
        'C) Definir nuevas clases.',
        'D) Incluir librerías externas.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_14',
      questionText:
          '¿Qué concepto permite a múltiples funciones con el mismo nombre realizar diferentes tareas basadas en sus parámetros?',
      options: [
        'A) Recursividad',
        'B) Funciones inline',
        'C) Sobrecarga de funciones',
        'D) Parámetros por defecto'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_15',
      questionText:
          '¿Para qué se utilizan los archivos de encabezado (.h) en C++?',
      options: [
        'A) Para la implementación de funciones y clases.',
        'B) Para declarar funciones, clases y variables que serán utilizadas en otros archivos.',
        'C) Para almacenar datos de configuración del proyecto.',
        'D) Para la ejecución directa del programa.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_16',
      questionText:
          '¿Cómo se accede al tercer elemento de un arreglo llamado `myArray` en C++?',
      options: [
        'A) myArray[3]',
        'B) myArray.get(2)',
        'C) myArray[2]',
        'D) myArray(3)'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_17',
      questionText:
          '¿Cuál es la clase estándar en C++ para manejar cadenas de caracteres de manera más segura y eficiente que las cadenas estilo C?',
      options: ['A) char[]', 'B) StringStream', 'C) std::string', 'D) CString'],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_18',
      questionText:
          '¿Cuál de los siguientes métodos NO es común en `std::vector`?',
      options: ['A) push_back', 'B) size', 'C) clear', 'D) remove'],
      correctAnswer: 'D',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_19',
      questionText:
          '¿Qué operador se utiliza para obtener la dirección de memoria de una variable en C++?',
      options: ['A) *', 'B) &', 'C) ->', 'D) .'],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_20',
      questionText: '¿Qué es una referencia en C++?',
      options: [
        'A) Un tipo de puntero que no puede ser nulo.',
        'B) Un alias para una variable existente.',
        'C) Una copia de una variable.',
        'D) Un tipo de dato que solo puede almacenar direcciones de memoria.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_21',
      questionText:
          '¿Cuál es la principal ventaja de usar punteros inteligentes sobre punteros crudos en C++?',
      options: [
        'A) Son más rápidos de declarar.',
        'B) Gestionan automáticamente la memoria, evitando fugas de memoria.',
        'C) No pueden ser nulos.',
        'D) Permiten acceso directo a la memoria física.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_22',
      questionText:
          '¿Qué palabra clave se usa para declarar una estructura en C++?',
      options: ['A) class', 'B) object', 'C) struct', 'D) union'],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_23',
      questionText:
          '¿Cuál es una diferencia clave entre `struct` y `union` en C++?',
      options: [
        'A) `struct` permite el acceso a todos los miembros simultáneamente, mientras que `union` solo permite el acceso a un miembro a la vez.',
        'B) `struct` solo puede contener tipos de datos primitivos, mientras que `union` puede contener cualquier tipo.',
        'C) `union` siempre tiene un tamaño menor que `struct`.',
        'D) `struct` se usa para programación orientada a objetos, `union` no.'
      ],
      correctAnswer: 'A',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_24',
      questionText:
          '¿Qué estilo de nomenclatura es comúnmente utilizado para nombres de variables en C++?',
      options: [
        'A) PascalCase',
        'B) snake_case',
        'C) kebab-case',
        'D) ALL_CAPS'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_25',
      questionText:
          '¿Cuál es la importancia de la documentación en el código C++?',
      options: [
        'A) Es un requisito legal para todos los proyectos.',
        'B) No es necesaria si el código es "autoexplicativo".',
        'C) Mejora la legibilidad, mantenibilidad y comprensión del código por otros desarrolladores (y por uno mismo en el futuro).',
        'D) Solo se utiliza para depurar errores.'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_26',
      questionText: '¿Cuál de los siguientes es un operador aritmético en C++?',
      options: ['A) `==`', 'B) `&&`', 'C) `+`', 'D) `!`'],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_27',
      questionText:
          '¿Cuál de los siguientes es un operador de comparación en C++?',
      options: ['A) `=`', 'B) `*`', 'C) `!=`', 'D) `/`'],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_28',
      questionText:
          '¿Qué tipo de dato se usa para almacenar valores verdaderos o falsos en C++?',
      options: ['A) `int`', 'B) `float`', 'C) `char`', 'D) `bool`'],
      correctAnswer: 'D',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_29',
      questionText:
          '¿Qué sucede si intentas dividir un entero por cero en C++?',
      options: [
        'A) Se produce un error de compilación.',
        'B) Se produce una advertencia en tiempo de compilación.',
        'C) Se produce un comportamiento indefinido en tiempo de ejecución.',
        'D) La división se realiza automáticamente a `0`.'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_30',
      questionText: '¿Qué es un operador de asignación en C++?',
      options: [
        'A) Un operador para comparar dos valores.',
        'B) Un operador para realizar operaciones matemáticas.',
        'C) Un operador para asignar un valor a una variable, como `=` o `+=`.',
        'D) Un operador para combinar expresiones lógicas.'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_31',
      questionText:
          '¿Cuál es la diferencia principal entre `const` y `constexpr` en la definición de constantes?',
      options: [
        'A) `const` es para variables, `constexpr` para funciones.',
        'B) `const` se evalúa en tiempo de ejecución, `constexpr` puede ser evaluado en tiempo de compilación.',
        'C) `constexpr` es solo para números enteros, `const` para cualquier tipo.',
        'D) No hay diferencia, son sinónimos.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_32',
      questionText:
          '¿Cuál de las siguientes es una ventaja de usar enumeraciones (enum class) en C++?',
      options: [
        'A) Permiten la herencia múltiple.',
        'B) Proporcionan una forma segura de definir un conjunto de valores con nombre, evitando colisiones de nombres.',
        'C) Optimizan la velocidad de ejecución del programa.',
        'D) Facilitan la depuración de memoria.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_33',
      questionText: '¿Para qué se utiliza el operador ternario en C++?',
      options: [
        'A) Para realizar bucles condicionales.',
        'B) Para definir un bloque de código que se ejecuta solo una vez.',
        'C) Como una forma concisa de una expresión `if-else` simple.',
        'D) Para manejar excepciones en tiempo de ejecución.'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_34',
      questionText: '¿Cuál es la función principal de `continue` en un bucle?',
      options: [
        'A) Terminar el bucle inmediatamente.',
        'B) Saltarse la iteración actual y pasar a la siguiente.',
        'C) Reiniciar el bucle desde el principio.',
        'D) Detener la ejecución del programa.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_35',
      questionText:
          '¿Qué bloque de código se utiliza para contener el código que puede lanzar una excepción?',
      options: ['A) `catch`', 'B) `throw`', 'C) `try`', 'D) `finally`'],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_36',
      questionText: '¿Qué indica el "ámbito de variables" en C++?',
      options: [
        'A) El tipo de dato de la variable.',
        'B) La visibilidad y vida útil de una variable en el programa.',
        'C) El valor actual de la variable.',
        'D) La cantidad de memoria que ocupa la variable.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_37',
      questionText: '¿Cuándo es apropiado usar una función `inline`?',
      options: [
        'A) Para funciones muy grandes y complejas.',
        'B) Para funciones pequeñas y simples, donde la llamada a la función es más costosa que la ejecución del código de la función.',
        'C) Cuando se requiere recursividad.',
        'D) Para funciones que lanzan excepciones.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_38',
      questionText:
          '¿Cuál es la directiva de preprocesador en C++ utilizada para incluir archivos de encabezado?',
      options: ['A) `#define`', 'B) `#ifdef`', 'C) `#include`', 'D) `#pragma`'],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_39',
      questionText:
          '¿Qué problema puede surgir al usar cadenas estilo C (`char arrays`) en comparación con `std::string`?',
      options: [
        'A) Son más rápidas.',
        'B) Son más seguras en cuanto a la gestión de memoria y el riesgo de desbordamientos de búfer.',
        'C) La gestión manual de la memoria y la falta de operaciones integradas pueden llevar a errores comunes como desbordamientos de búfer.',
        'D) No pueden almacenar caracteres nulos.'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_40',
      questionText:
          '¿Qué método de `std::vector` se utiliza para agregar un elemento al final del vector?',
      options: [
        'A) `add()`',
        'B) `insert()`',
        'C) `append()`',
        'D) `push_back()`'
      ],
      correctAnswer: 'D',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_41',
      questionText: '¿Cuál es el operador de desreferencia de puntero en C++?',
      options: ['A) `&`', 'B) `*`', 'C) `.`', 'D) `->`'],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_42',
      questionText: '¿Para qué se utilizan los punteros a funciones en C++?',
      options: [
        'A) Para acceder a miembros de una clase.',
        'B) Para almacenar la dirección de memoria de una función y llamarla indirectamente.',
        'C) Para declarar una función recursiva.',
        'D) Para optimizar el rendimiento de las funciones matemáticas.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_43',
      questionText:
          '¿Cuál es la principal diferencia entre punteros y referencias en C++?',
      options: [
        'A) Los punteros pueden ser nulos, las referencias no.',
        'B) Las referencias pueden reasignarse a diferentes objetos, los punteros no.',
        'C) Los punteros solo pueden apuntar a variables, las referencias a cualquier cosa.',
        'D) No hay diferencias significativas, son conceptos intercambiables.'
      ],
      correctAnswer: 'A',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_44',
      questionText: '¿Qué es el "anidamiento de estructuras" en C++?',
      options: [
        'A) Declarar una estructura dentro de una función.',
        'B) Declarar una estructura dentro de otra estructura.',
        'C) Usar punteros para acceder a miembros de una estructura.',
        'D) Definir una estructura como un miembro de una clase.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_45',
      questionText:
          '¿Cuál de los siguientes es un caso de uso común para las uniones (`union`) en C++?',
      options: [
        'A) Para agrupar diferentes tipos de datos que se usan simultáneamente.',
        'B) Para optimizar el uso de memoria cuando solo uno de varios tipos de datos se almacenará en un momento dado.',
        'C) Para crear clases con herencia.',
        'D) Para definir funciones inline.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_46',
      questionText:
          '¿Qué significa "nombres significativos y legibilidad" en las convenciones de nomenclatura?',
      options: [
        'A) Usar los nombres más cortos posibles para las variables.',
        'B) Elegir nombres que claramente indiquen el propósito o contenido de una variable, función o clase, facilitando la comprensión del código.',
        'C) Usar solo nombres en mayúsculas.',
        'D) Nombres que son difíciles de adivinar para los hackers.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_47',
      questionText:
          '¿Qué herramienta se menciona para la generación de documentación a partir del código fuente en C++?',
      options: ['A) Git', 'B) Doxygen', 'C) Valgrind', 'D) CMake'],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_48',
      questionText:
          '¿Cuál es un principio clave de la organización del código para la "reutilización de código"?',
      options: [
        'A) Escribir el código más complejo posible.',
        'B) Evitar funciones genéricas.',
        'C) Diseñar componentes y funciones de manera que puedan ser utilizados en múltiples partes del programa o en diferentes proyectos.',
        'D) Mantener todo el código en un solo archivo.'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_49',
      questionText: '¿Qué es un "breakpoint" en la depuración de código?',
      options: [
        'A) Una sección de código que se salta durante la ejecución.',
        'B) Un punto en el código donde la ejecución del programa se detiene temporalmente, permitiendo inspeccionar el estado del programa.',
        'C) Un error de sintaxis que detiene la compilación.',
        'D) Una función que restablece el programa a un estado anterior.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'cpp_jr_50',
      questionText: '¿Cuál es la función principal de los `namespaces` en C++?',
      options: [
        'A) Para definir variables globales.',
        'B) Para organizar el código y evitar colisiones de nombres entre diferentes bibliotecas o partes de un programa.',
        'C) Para incluir archivos de encabezado.',
        'D) Para declarar funciones `inline`.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Jr',
    ),
  ];

  // Insertar las preguntas en la base de datos
  for (final question in preloadedCppJrQuestions) {
    await db.insert(tableName, question.toMap());
  }
}

Future<void> preloadCppMidQuestions(Database db, tableName) async {
  final preloadedCppMidQuestions = [
    ExamQuestionModel(
      id: 'cpp_mid_01',
      questionText:
          '¿Cuál es el principio de la Programación Orientada a Objetos que se refiere a la ocultación de los detalles de implementación y la exposición solo de la interfaz necesaria?',
      options: [
        'A) Herencia',
        'B) Polimorfismo',
        'C) Encapsulamiento',
        'D) Abstracción'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_02',
      questionText:
          '¿Qué método especial de una clase en C++ se invoca automáticamente cuando un objeto es destruido?',
      options: [
        'A) Constructor',
        'B) Inicializador',
        'C) Destructor',
        'D) Finalizador'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_03',
      questionText:
          '¿Cuál es la característica de OOP que permite que una clase herede propiedades y comportamientos de otra clase?',
      options: [
        'A) Polimorfismo',
        'B) Abstracción',
        'C) Herencia',
        'D) Encapsulamiento'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_04',
      questionText: '¿Qué es el problema del diamante en la herencia en C++?',
      options: [
        'A) Un problema de rendimiento en clases muy grandes.',
        'B) Un problema que surge con la herencia virtual múltiple, donde una clase base se hereda múltiples veces a través de diferentes rutas.',
        'C) Un error de compilación relacionado con el acceso a miembros privados.',
        'D) Un problema de memoria en objetos complejos.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_05',
      questionText:
          '¿Qué permite el polimorfismo en tiempo de ejecución en C++?',
      options: [
        'A) Definir funciones con el mismo nombre pero diferentes parámetros.',
        'B) Que los objetos de diferentes clases respondan a la misma llamada a función de manera específica a su tipo real, a través de funciones virtuales.',
        'C) La capacidad de una función de llamarse a sí misma.',
        'D) La creación de objetos sin especificar su tipo.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_06',
      questionText: '¿Qué es un "template" en C++?',
      options: [
        'A) Una plantilla para generar código HTML.',
        'B) Una característica que permite escribir código genérico que funciona con diferentes tipos de datos sin reescribir el código para cada tipo.',
        'C) Un tipo especial de variable global.',
        'D) Una herramienta para la depuración de memoria.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_07',
      questionText:
          '¿Qué es SFINAE en el contexto de templates avanzados en C++?',
      options: [
        'A) Un acrónimo para "Standard Function Interface And Extensions".',
        'B) Un concepto que permite la sustitución de plantillas fallidas sin generar un error de compilación, lo que se utiliza para habilitar o deshabilitar plantillas en función de las propiedades de los tipos.',
        'C) Un tipo de optimización de compilador.',
        'D) Una herramienta para la gestión de memoria dinámica.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_08',
      questionText:
          '¿Cuál es el propósito principal de los "concepts" introducidos en C++20?',
      options: [
        'A) Para reemplazar las clases abstractas.',
        'B) Para definir restricciones y validaciones en templates, mejorando la legibilidad y mantenibilidad del código genérico.',
        'C) Para manejar excepciones de forma más eficiente.',
        'D) Para la serialización de datos.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_09',
      questionText:
          '¿Qué operador se utiliza para asignar memoria dinámicamente en C++?',
      options: ['A) `malloc`', 'B) `alloc`', 'C) `new`', 'D) `create`'],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_10',
      questionText:
          '¿Qué herramienta se menciona para la detección de fugas de memoria en C++?',
      options: ['A) GDB', 'B) Valgrind', 'C) CMake', 'D) Doxygen'],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_11',
      questionText:
          '¿Cuál de los siguientes punteros inteligentes es diseñado para tener una propiedad única sobre el recurso que gestiona?',
      options: [
        'A) `std::shared_ptr`',
        'B) `std::weak_ptr`',
        'C) `std::unique_ptr`',
        'D) `std::raw_ptr`'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_12',
      questionText: '¿Qué significa el acrónimo RAII en C++?',
      options: [
        'A) "Resource Allocation Is Important"',
        'B) "Resource Acquisition Is Initialization"',
        'C) "Read All Input Instantly"',
        'D) "Runtime Application Integration Interface"'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_13',
      questionText:
          '¿Qué concepto en C++11 y posteriores permite la transferencia eficiente de recursos, evitando copias innecesarias?',
      options: [
        'A) Copia profunda',
        'B) Asignación estática',
        'C) Move Semantics y Rvalue References',
        'D) Polimorfismo en tiempo de compilación'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_14',
      questionText:
          '¿Qué bloque de código se utiliza para capturar excepciones en C++?',
      options: ['A) `try`', 'B) `throw`', 'C) `catch`', 'D) `finally`'],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_15',
      questionText:
          '¿Cuál es una buena práctica recomendada para el manejo de excepciones en C++?',
      options: [
        'A) Usar códigos de error en lugar de excepciones para todo.',
        'B) Lanzar excepciones desde destructores.',
        'C) Utilizar RAII con excepciones para garantizar la liberación de recursos.',
        'D) Ignorar todas las excepciones.'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_16',
      questionText:
          '¿Qué contenedor de la STL es ideal para acceso rápido a elementos por índice y crecimiento dinámico?',
      options: [
        'A) `std::list`',
        'B) `std::set`',
        'C) `std::vector`',
        'D) `std::map`'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_17',
      questionText: '¿Qué permiten las funciones lambda en C++?',
      options: [
        'A) Declarar variables globales.',
        'B) Crear funciones anónimas en línea, a menudo utilizadas con algoritmos STL.',
        'C) Implementar herencia múltiple.',
        'D) Controlar el flujo de ejecución de manera externa.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_18',
      questionText:
          '¿Qué clase de la STL es útil para encapsular cualquier función invocable (función, puntero a función, objeto funcional, lambda)?',
      options: [
        'A) `std::bind`',
        'B) `std::function`',
        'C) `std::predicate`',
        'D) `std::algorithm`'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_19',
      questionText:
          '¿Cuál es la clase estándar en C++11 para crear y gestionar hilos de ejecución?',
      options: [
        'A) `pthread`',
        'B) `std::thread`',
        'C) `QThread`',
        'D) `boost::thread`'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_20',
      questionText:
          '¿Qué mecanismo se utiliza para proteger recursos compartidos y evitar condiciones de carrera en programación multihilo?',
      options: [
        'A) `std::async`',
        'B) `std::future`',
        'C) `std::mutex`',
        'D) `std::atomic`'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_21',
      questionText:
          '¿Qué objeto de la STL se utiliza para enviar un resultado o una excepción a un `std::future` en un hilo diferente?',
      options: [
        'A) `std::async`',
        'B) `std::promise`',
        'C) `std::thread`',
        'D) `std::atomic`'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_22',
      questionText: '¿Cuál es el flujo de salida estándar para errores en C++?',
      options: [
        'A) `std::cout`',
        'B) `std::cin`',
        'C) `std::cerr`',
        'D) `std::clog`'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_23',
      questionText: '¿Qué es la serialización de datos en C++?',
      options: [
        'A) El proceso de convertir objetos en una secuencia de bytes para almacenamiento o transmisión.',
        'B) El proceso de compilar código fuente.',
        'C) La gestión de la memoria dinámica.',
        'D) La depuración de programas en tiempo de ejecución.'
      ],
      correctAnswer: 'A',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_24',
      questionText:
          '¿Qué herramientas se utilizan para el análisis estático de código en C++?',
      options: [
        'A) GDB y LLDB',
        'B) Valgrind y AddressSanitizer',
        'C) clang-tidy y cpplint',
        'D) CMake y Makefiles'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_25',
      questionText:
          '¿Qué framework de testing se menciona como una opción para pruebas unitarias en C++?',
      options: ['A) JUnit', 'B) NUnit', 'C) Google Test', 'D) Pytest'],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_26',
      questionText:
          'Imagina que estás diseñando una biblioteca donde quieres asegurarte de que los usuarios pasen tipos específicos a tus templates, ¿qué característica de C++20 te permitiría especificar estas restricciones de manera clara y legible?',
      options: [
        'A) `std::enable_if`',
        'B) Traits',
        'C) Concepts',
        'D) Especialización de templates'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_27',
      questionText:
          'Si te encuentras con un programa C++ que consume una cantidad excesiva de memoria con el tiempo, y sospechas de fugas de memoria, ¿qué herramienta sería la más útil para diagnosticar este problema?',
      options: [
        'A) Un compilador (GCC, Clang)',
        'B) Un depurador (GDB, LLDB)',
        'C) Un analizador de memoria como Valgrind',
        'D) Un sistema de control de versiones (Git)'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_28',
      questionText:
          'En el manejo de memoria dinámica, ¿qué operador se utiliza para liberar la memoria asignada con `new`?',
      options: ['A) `free`', 'B) `destroy`', 'C) `delete`', 'D) `release`'],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_29',
      questionText:
          'Tienes un objeto `std::unique_ptr` que posee un recurso. Quieres transferir la propiedad de este recurso a otra función sin hacer una copia, ¿qué característica de C++ te permite hacer esto de manera eficiente?',
      options: [
        'A) Paso por referencia constante',
        'B) Copia profunda',
        'C) Move Semantics',
        'D) Punteros crudos'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_30',
      questionText:
          '¿Cuál es la garantía de excepción más fuerte, que promete que si una operación falla, el estado del programa no se modifica y los recursos se revierten a su estado original?',
      options: [
        'A) No-throw guarantee',
        'B) Basic guarantee',
        'C) Strong guarantee',
        'D) Weak guarantee'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_31',
      questionText:
          'Al manejar errores, ¿cuándo es generalmente preferible usar excepciones en lugar de códigos de error?',
      options: [
        'A) Siempre es mejor usar códigos de error para simplicidad.',
        'B) Cuando los errores son comunes y se espera que el programa los maneje sin terminación abrupta.',
        'C) Cuando los errores son excepcionales y no forman parte del flujo normal del programa.',
        'D) Nunca, las excepciones son un concepto obsoleto.'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_32',
      questionText:
          'Un desarrollador junior está escribiendo un constructor para una clase que adquiere un recurso. ¿Cuál es una consideración importante si el constructor puede lanzar una excepción?',
      options: [
        'A) El destructor siempre se llamará automáticamente, por lo que no hay preocupación.',
        'B) Es necesario asegurarse de que los recursos adquiridos se liberen adecuadamente, incluso si el constructor falla, posiblemente usando RAII.',
        'C) Las excepciones en los constructores no son posibles en C++.',
        'D) Se debe evitar adquirir recursos en constructores.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_33',
      questionText:
          'Necesitas almacenar un conjunto de elementos únicos y ordenados eficientemente. ¿Qué contenedor de la STL sería la mejor opción?',
      options: [
        'A) `std::vector`',
        'B) `std::list`',
        'C) `std::set`',
        'D) `std::unordered_map`'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_34',
      questionText:
          'Estás buscando un elemento específico en un `std::vector`. ¿Qué algoritmo estándar de la STL te ayudaría a encontrarlo?',
      options: [
        'A) `std::sort`',
        'B) `std::accumulate`',
        'C) `std::find`',
        'D) `std::transform`'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_35',
      questionText:
          'Si necesitas una estructura de datos LIFO (Last-In, First-Out), ¿qué adaptador de contenedor de la STL usarías?',
      options: [
        'A) `std::queue`',
        'B) `std::priority_queue`',
        'C) `std::stack`',
        'D) `std::deque`'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_36',
      questionText:
          '¿Qué es la "captura de variables" en el contexto de funciones lambda?',
      options: [
        'A) La capacidad de una lambda para modificar variables globales.',
        'B) La forma en que una lambda puede acceder y usar variables de su ámbito envolvente.',
        'C) Un error de compilación cuando una lambda no puede acceder a variables.',
        'D) Una técnica para hacer que las lambdas sean más rápidas.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_37',
      questionText:
          'Un programador desea ejecutar una tarea en un hilo separado para evitar que la interfaz de usuario se congele. ¿Qué clase de la biblioteca estándar de C++ es fundamental para esta tarea?',
      options: [
        'A) `std::vector`',
        'B) `std::string`',
        'C) `std::thread`',
        'D) `std::cout`'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_38',
      questionText:
          'Dos hilos intentan modificar la misma variable global simultáneamente, lo que puede llevar a resultados inesperados. ¿Qué se describe esta situación?',
      options: [
        'A) Un deadlock',
        'B) Una condición de carrera',
        'C) Una excepción de puntero nulo',
        'D) Un error de compilación'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_39',
      questionText:
          '¿Qué mecanismo se utiliza para la comunicación entre hilos, permitiendo que un hilo espere a que otro hilo cumpla una condición?',
      options: [
        'A) `std::mutex`',
        'B) `std::lock_guard`',
        'C) `std::condition_variable`',
        'D) `std::atomic`'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_40',
      questionText:
          'Quieres ejecutar una función de forma asíncrona y obtener su resultado en el futuro. ¿Qué combinación de objetos de la STL sería la más adecuada para esto?',
      options: [
        'A) `std::thread` y `std::mutex`',
        'B) `std::async` y `std::future`',
        'C) `std::promise` y `std::condition_variable`',
        'D) `std::atomic` y `std::lock_guard`'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_41',
      questionText:
          'Cuando trabajas con archivos en C++, ¿qué clase se utiliza para operaciones de entrada y salida de archivos?',
      options: [
        'A) `std::cout`',
        'B) `std::cin`',
        'C) `std::fstream`',
        'D) `std::string`'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_42',
      questionText:
          'Quieres guardar los datos de un objeto C++ en un archivo binario para poder restaurarlos más tarde. ¿Qué proceso se describe esta tarea?',
      options: [
        'A) Compilación',
        'B) Depuración',
        'C) Serialización',
        'D) Encriptación'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_43',
      questionText:
          'Para la lectura y escritura eficiente de grandes volúmenes de datos en archivos, ¿cuál de las siguientes consideraciones es crucial?',
      options: [
        'A) Usar solo `std::cout` y `std::cin`.',
        'B) Realizar operaciones de lectura/escritura carácter por carácter.',
        'C) Utilizar búferes y manejar el acceso aleatorio al archivo cuando sea necesario.',
        'D) Ignorar los errores en las operaciones de archivo.'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_44',
      questionText:
          '¿Cuál es el objetivo principal de integrar linters y formatters (como clang-tidy, cpplint) en el flujo de trabajo de desarrollo?',
      options: [
        'A) Para hacer que el código sea más lento.',
        'B) Para generar automáticamente la documentación del código.',
        'C) Para asegurar la consistencia del estilo de código, detectar posibles errores y mejorar la calidad general del código.',
        'D) Para convertir el código C++ a otros lenguajes.'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_45',
      questionText:
          'Estás desarrollando una característica nueva y quieres verificar que las unidades de código individuales (funciones, clases) funcionan correctamente de forma aislada. ¿Qué tipo de pruebas realizarías?',
      options: [
        'A) Pruebas de integración',
        'B) Pruebas de sistema',
        'C) Pruebas unitarias',
        'D) Pruebas de rendimiento'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_46',
      questionText:
          '¿Qué sistema de construcción es ampliamente utilizado en proyectos C++ para gestionar el proceso de compilación de forma multiplataforma?',
      options: ['A) `npm`', 'B) `Maven`', 'C) `CMake`', 'D) `Gradle`'],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_47',
      questionText:
          'Una práctica recomendada en C++ para mantener un código limpio y fácil de leer es seguir las "Convenciones de Nomenclatura". ¿Cuál es el beneficio principal de esto?',
      options: [
        'A) Reduce el tamaño del ejecutable.',
        'B) Mejora la velocidad de compilación.',
        'C) Aumenta la legibilidad y consistencia del código, facilitando el trabajo en equipo.',
        'D) Elimina la necesidad de comentarios en el código.'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_48',
      questionText:
          'Si te encuentras con un programa que se cuelga inesperadamente y necesitas investigar la causa raíz del fallo en tiempo de ejecución, ¿qué herramienta de depuración sería tu primera opción?',
      options: [
        'A) Un editor de texto.',
        'B) Un sistema de control de versiones.',
        'C) Un depurador como GDB o LLDB.',
        'D) Un analizador estático de código.'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_49',
      questionText:
          '¿Qué se entiende por "Integración Continua" en el desarrollo de software?',
      options: [
        'A) El proceso de integrar nuevas características solo una vez al final del proyecto.',
        'B) Una práctica de desarrollo donde los desarrolladores integran el código en un repositorio compartido con frecuencia, y cada integración es verificada por una construcción automatizada.',
        'C) Un método para depurar errores en tiempo real.',
        'D) La liberación de software cada día.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'cpp_mid_50',
      questionText:
          'Para gestionar dependencias de terceros en un proyecto C++, ¿qué herramientas de gestión de paquetes se mencionan?',
      options: [
        'A) `npm` y `pip`',
        'B) `vcpkg` y `Conan`',
        'C) `NuGet` y `Homebrew`',
        'D) `Composer` y `Bundler`'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Mid',
    ),
  ];

  // Insertar las preguntas en la base de datos
  for (final question in preloadedCppMidQuestions) {
    await db.insert(tableName, question.toMap());
  }
}

Future<void> preloadCppSrQuestions(Database db, tableName) async {
  final preloadedCppSrQuestions = [
    ExamQuestionModel(
      id: 'cpp_sr_01',
      questionText:
          'Un equipo de desarrollo está discutiendo la adopción de un nuevo estándar de C++. ¿Qué estándar de C++ introdujo los concepts, módulos y coroutines, impactando significativamente la forma de escribir código moderno?',
      options: ['A) C++11', 'B) C++14', 'C) C++17', 'D) C++20'],
      correctAnswer: 'D',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_02',
      questionText:
          'Cuando se compila un programa C++, ¿qué opción de compilador (flag) es fundamental para habilitar las características del estándar C++17 en GCC o Clang?',
      options: [
        'A) `-std=c++11`',
        'B) `-std=c++14`',
        'C) `-std=c++17`',
        'D) `-std=c++03`'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_03',
      questionText:
          'Si te encuentras con un programa C++ que tiene problemas de rendimiento en un bucle crítico, ¿qué herramienta sería la más adecuada para identificar los cuellos de botella y las secciones de código que más tiempo consumen?',
      options: [
        'A) Un analizador estático (clang-tidy)',
        'B) Un depurador (GDB)',
        'C) Un perfilador de rendimiento',
        'D) Un sistema de control de versiones (Git)'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_04',
      questionText:
          'Un ingeniero de software está realizando una revisión de código. Si encuentra un código que parece tener un error lógico complejo que solo ocurre bajo ciertas condiciones, ¿qué herramienta sería la más efectiva para rastrear el flujo de ejecución y los valores de las variables en tiempo real?',
      options: [
        'A) Un compilador',
        'B) Un depurador interactivo (GDB o LLDB)',
        'C) Una herramienta de análisis estático',
        'D) Un generador de documentación'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_05',
      questionText:
          'Para asegurar la calidad del código, un equipo utiliza una herramienta que verifica el código fuente en busca de errores potenciales, vulnerabilidades y violaciones de estilo antes de la compilación. ¿Qué tipo de herramienta es esta?',
      options: [
        'A) Depurador dinámico',
        'B) Compilador incremental',
        'C) Analizador estático de código',
        'D) Generador de informes de rendimiento'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_06',
      questionText:
          'Estás desarrollando una biblioteca en C++ y quieres que sea accesible desde código C. ¿Qué directiva de C++ se utiliza para asegurar que las funciones sean enlazadas con la convención de llamada de C?',
      options: [
        'A) `extern "C"`',
        'B) `using namespace C`',
        'C) `#pragma C_linkage`',
        'D) `__cdecl`'
      ],
      correctAnswer: 'A',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_07',
      questionText:
          'Un desarrollador necesita integrar un módulo de Python existente con una aplicación C++ para aprovechar su capacidad de procesamiento numérico. ¿Qué biblioteca es comúnmente utilizada para este tipo de interoperabilidad?',
      options: [
        'A) `Boost.Python`',
        'B) `SWIG`',
        'C) `pybind11`',
        'D) `Cython`'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_08',
      questionText:
          'Cuando un programa C++ necesita cargar bibliotecas en tiempo de ejecución (DLLs en Windows, Shared Libraries en Linux/macOS) en lugar de enlazarlas estáticamente, ¿qué proceso se describe esto?',
      options: [
        'A) Enlace estático',
        'B) Compilación JIT',
        'C) Carga dinámica de bibliotecas',
        'D) Vinculación tardía'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_09',
      questionText:
          'Una aplicación C++ debe interactuar directamente con el sistema operativo para realizar tareas como crear archivos o gestionar procesos. ¿Qué tipo de llamadas se utilizan para esto?',
      options: [
        'A) Llamadas a la API REST',
        'B) Llamadas a la biblioteca estándar de C++',
        'C) Llamadas al sistema operativo (System Calls)',
        'D) Llamadas a funciones virtuales'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_10',
      questionText:
          'Para desarrollar una aplicación que funcione tanto en Windows como en Linux sin grandes cambios en el código fuente, ¿qué enfoque de desarrollo es crucial?',
      options: [
        'A) Programación exclusiva para un solo sistema operativo.',
        'B) Usar ensamblador para todas las operaciones.',
        'C) Desarrollo multiplataforma, utilizando librerías y APIs portátiles.',
        'D) Reimplementar toda la aplicación para cada sistema operativo.'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_11',
      questionText:
          'Un programador necesita implementar una lógica que gestiona un recurso único y asegurarse de que se libere automáticamente cuando ya no se necesite, incluso si ocurren excepciones. ¿Qué patrón de diseño de C++ es el más adecuado para esto?',
      options: [
        'A) Factory Method',
        'B) Singleton',
        'C) Observer',
        'D) RAII (Resource Acquisition Is Initialization)'
      ],
      correctAnswer: 'D',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_12',
      questionText:
          'Estás diseñando una jerarquía de clases donde una clase base tiene una función virtual pura. Esto significa que la clase base no puede ser instanciada directamente. ¿Cómo se llama a este tipo de clase?',
      options: [
        'A) Clase concreta',
        'B) Clase final',
        'C) Clase abstracta',
        'D) Clase de utilidad'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_13',
      questionText:
          'En el contexto del polimorfismo, si una función miembro en una clase derivada tiene el mismo nombre y la misma firma que una función miembro en su clase base, ¿qué ocurre si la función base no es virtual?',
      options: [
        'A) Se produce un error de compilación.',
        'B) Se invoca siempre la función de la clase derivada.',
        'C) Se produce ocultamiento de nombre, y la función base se invoca a menos que se use un puntero o referencia a la clase derivada.',
        'D) La función de la clase derivada nunca se puede llamar.'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_14',
      questionText:
          'Para evitar el "slicing" de objetos cuando se pasa un objeto de una clase derivada a una función que espera un objeto de la clase base por valor, ¿qué técnica es la más apropiada?',
      options: [
        'A) Pasar el objeto por valor.',
        'B) Pasar el objeto por puntero o referencia.',
        'C) Utilizar la herencia virtual.',
        'D) Declarar la clase base como `final`.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_15',
      questionText:
          '¿Qué es una "función amiga" (`friend function`) en C++ y por qué se utiliza?',
      options: [
        'A) Una función que puede ser llamada desde cualquier lugar del programa.',
        'B) Una función que puede acceder a los miembros `private` y `protected` de una clase, utilizada para facilitar la implementación de operadores sobrecargados o la colaboración entre clases.',
        'C) Una función que no tiene parámetros.',
        'D) Una función que se hereda automáticamente a todas las clases derivadas.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_16',
      questionText:
          'En el diseño de sistemas complejos, ¿qué patrón de diseño se utiliza para permitir que un algoritmo varíe independientemente de los clientes que lo usan, encapsulando el algoritmo en una jerarquía de clases?',
      options: [
        'A) Singleton',
        'B) Factory Method',
        'C) Strategy',
        'D) Adapter'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_17',
      questionText:
          'Para implementar un sistema donde un objeto notifica automáticamente a múltiples objetos dependientes sobre cualquier cambio en su estado, ¿qué patrón de diseño es el más adecuado?',
      options: ['A) Builder', 'B) Observer', 'C) Decorator', 'D) Facade'],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_18',
      questionText:
          'Cuando se trabaja con templates, ¿qué se entiende por "especialización de templates"?',
      options: [
        'A) Crear un template que solo funciona con un tipo específico.',
        'B) Proporcionar una implementación diferente para un template cuando se instancia con un tipo o conjunto de tipos particular.',
        'C) Ignorar ciertos tipos en un template.',
        'D) La capacidad de un template para heredar de otro template.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_19',
      questionText:
          '¿Qué concepto en C++20 permite la composición de operaciones asíncronas y la escritura de código secuencial que se ejecuta de forma no bloqueante?',
      options: [
        'A) Futures y Promises',
        'B) Mutexes',
        'C) Coroutines',
        'D) Atomics'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_20',
      questionText:
          'Si necesitas garantizar que una variable sea modificada de forma atómica (sin interrupciones) en un entorno multihilo, ¿qué tipo de variable deberías usar en C++?',
      options: [
        'A) `volatile`',
        'B) `static`',
        'C) `std::atomic`',
        'D) `const`'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_21',
      questionText:
          'Un programador está optimizando un algoritmo y necesita que las operaciones sean lo más eficientes posible en términos de caché de la CPU. ¿Qué concepto de bajo nivel es importante considerar aquí?',
      options: [
        'A) Virtualización',
        'B) Localidad de la memoria',
        'C) Garbage Collection',
        'D) Reflexión'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_22',
      questionText:
          'En el desarrollo de bibliotecas, si quieres que los usuarios puedan usar tu biblioteca sin necesidad de recompilar su propio código cada vez que actualizas la biblioteca, ¿qué tipo de enlace es preferible?',
      options: [
        'A) Enlace estático',
        'B) Enlace dinámico (DLLs / Shared Libraries)',
        'C) Enlace directo',
        'D) Enlace en tiempo de compilación'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_23',
      questionText:
          '¿Qué es el "mangling de nombres" en C++ y por qué es necesario?',
      options: [
        'A) Es un error de compilación que ocurre en sistemas operativos antiguos.',
        'B) Es un proceso para ofuscar los nombres de las funciones para mejorar la seguridad.',
        'C) Es la forma en que los compiladores codifican información sobre los parámetros y el espacio de nombres de una función en su nombre final para soportar la sobrecarga de funciones y namespaces.',
        'D) Es una técnica para reducir el tamaño del ejecutable.'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_24',
      questionText:
          'Un equipo de desarrollo está migrando un proyecto de C++ a una nueva versión del estándar, y quieren automatizar la detección de código obsoleto o problemático. ¿Qué herramienta de análisis estático es ideal para este propósito?',
      options: ['A) GDB', 'B) Valgrind', 'C) Clang-Tidy', 'D) CMake'],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_25',
      questionText:
          'Cuando se desarrolla software para sistemas embebidos o drivers, es común la "programación de bajo nivel". ¿Qué implica esto en C++?',
      options: [
        'A) Escribir código únicamente en Python.',
        'B) Interactuar directamente con el hardware, registros de memoria y direcciones físicas, a menudo con el uso extensivo de punteros.',
        'C) Crear interfaces de usuario complejas.',
        'D) Utilizar solo funciones de la biblioteca estándar de alto nivel.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_26',
      questionText:
          'En el contexto de la metaprogramación con templates, ¿qué técnica se utiliza para seleccionar una implementación de template diferente basada en las propiedades de los tipos de argumentos en tiempo de compilación?',
      options: [
        'A) Virtual functions',
        'B) Run-time polymorphism',
        'C) SFINAE (Substitution Failure Is Not An Error)',
        'D) Dynamic dispatch'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_27',
      questionText:
          'Si estás implementando una biblioteca de algoritmos genéricos y quieres que el compilador verifique que los tipos pasados cumplen con ciertos requisitos (por ejemplo, ser "copy-constructible" o "comparable"), ¿qué característica de C++20 sería la más elegante y explícita para hacer esto?',
      options: [
        'A) Comentarios en el código',
        'B) `static_assert`',
        'C) Concepts',
        'D) Clases base abstractas'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_28',
      questionText:
          'Al diseñar interfaces de bibliotecas, se busca minimizar las dependencias de los archivos de encabezado para reducir los tiempos de compilación. ¿Qué técnica se utiliza para lograr esto, retrasando la inclusión de definiciones completas de tipos hasta el archivo de implementación?',
      options: [
        'A) Precompilación de encabezados',
        'B) PImpl (Pointer to Implementation) Idiom',
        'C) Enlace estático',
        'D) Uso exclusivo de funciones `inline`'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_29',
      questionText:
          'Cuando se optimiza el rendimiento de un programa C++, ¿por qué es importante considerar la alineación de datos y el "padding" de estructuras?',
      options: [
        'A) Para reducir el tamaño del ejecutable.',
        'B) Para mejorar el uso de la caché de la CPU y la velocidad de acceso a la memoria.',
        'C) Para hacer que el código sea más legible.',
        'D) Para evitar fugas de memoria.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_30',
      questionText:
          'Un programador experto está refactorizando un código heredado que usa punteros crudos extensivamente, llevando a posibles fugas de memoria. Para mejorar la seguridad y la gestión de recursos, ¿qué punteros inteligentes de C++11 debería priorizar?',
      options: [
        'A) `std::auto_ptr` y `boost::scoped_ptr`',
        'B) `std::unique_ptr` y `std::shared_ptr`',
        'C) `std::raw_ptr` y `std::owner_ptr`',
        'D) Punteros a funciones'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_31',
      questionText:
          'En el diseño de sistemas concurrentes, ¿qué problema ocurre cuando dos o más hilos están bloqueados indefinidamente, esperando mutuamente por un recurso que el otro tiene bloqueado?',
      options: [
        'A) Condición de carrera',
        'B) Inanición',
        'C) Deadlock',
        'D) Data race'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_32',
      questionText:
          'Para implementar un algoritmo paralelo donde cada hilo realiza una parte del trabajo de forma independiente y luego los resultados se combinan, ¿qué patrón de concurrencia es el más adecuado?',
      options: [
        'A) Productor-Consumidor',
        'B) Lector-Escritor',
        'C) Divide y Conquista (MapReduce)',
        'D) Barrera'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_33',
      questionText:
          'Si necesitas coordinar la ejecución de múltiples hilos de manera que todos lleguen a un punto específico antes de que cualquiera pueda continuar, ¿qué primitivo de sincronización sería el más apropiado?',
      options: [
        'A) `std::mutex`',
        'B) `std::condition_variable`',
        'C) `std::barrier` (C++20)',
        'D) `std::atomic`'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_34',
      questionText:
          'Un patrón de diseño que se utiliza para desacoplar el remitente de una solicitud de su receptor, permitiendo que múltiples objetos tengan la oportunidad de manejar la solicitud, es:',
      options: [
        'A) Factory Method',
        'B) Chain of Responsibility',
        'C) Command',
        'D) Iterator'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_35',
      questionText:
          'Al diseñar un sistema extensible, ¿qué principio de diseño SOLID establece que las entidades de software (clases, módulos, funciones, etc.) deben estar abiertas a la extensión, pero cerradas a la modificación?',
      options: [
        'A) Principio de Responsabilidad Única (SRP)',
        'B) Principio Abierto/Cerrado (OCP)',
        'C) Principio de Sustitución de Liskov (LSP)',
        'D) Principio de Inversión de Dependencia (DIP)'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_36',
      questionText:
          '¿Qué patrón de diseño se utiliza para crear objetos sin especificar la clase exacta del objeto que se va a crear, proporcionando una interfaz para crear familias de objetos relacionados o dependientes sin especificar sus clases concretas?',
      options: [
        'A) Abstract Factory',
        'B) Builder',
        'C) Prototype',
        'D) Singleton'
      ],
      correctAnswer: 'A',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_37',
      questionText:
          'Un programador está trabajando en un sistema donde los eventos de bajo nivel deben ser registrados con precisión. ¿Qué librería de logging de C++ es conocida por su alto rendimiento y flexibilidad?',
      options: [
        'A) `std::cout`',
        'B) `log4cpp`',
        'C) `spdlog`',
        'D) `Boost.Log`'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_38',
      questionText:
          'Para gestionar la configuración de una aplicación C++ de forma centralizada y flexible, ¿qué formato de archivo es comúnmente utilizado y por qué?',
      options: [
        'A) Archivos de texto plano por su simplicidad.',
        'B) XML o JSON por su estructura jerárquica y facilidad de análisis.',
        'C) Archivos binarios por su velocidad de lectura.',
        'D) Documentos PDF por su formato inmutable.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_39',
      questionText:
          'Un equipo está desarrollando un sistema de trading de alta frecuencia en C++. ¿Qué técnica de optimización de bajo nivel es crucial para minimizar la latencia y maximizar el rendimiento?',
      options: [
        'A) Uso extensivo de polimorfismo dinámico.',
        'B) Optimización de caché, evitación de falsos compartidos, y uso de estructuras de datos lock-free.',
        'C) Deshabilitar todas las optimizaciones del compilador.',
        'D) Escribir todo el código en Python.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_40',
      questionText:
          'Cuando se busca reducir el tamaño de un ejecutable C++ en sistemas con recursos limitados, ¿qué estrategia de enlace puede ser más beneficiosa?',
      options: [
        'A) Enlace dinámico con bibliotecas grandes.',
        'B) Enlace estático, incluyendo solo las partes del código necesarias.',
        'C) No usar ninguna biblioteca externa.',
        'D) Usar exclusivamente funciones `inline`.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_41',
      questionText:
          'Un equipo de DevOps quiere automatizar el proceso de construcción, prueba y despliegue de una aplicación C++. ¿Qué tipo de plataforma o herramienta sería fundamental para implementar un pipeline de CI/CD?',
      options: [
        'A) Un editor de texto simple.',
        'B) Un sistema de control de versiones distribuido como Git.',
        'C) Herramientas de automatización como Jenkins, GitLab CI, o GitHub Actions.',
        'D) Un depurador de memoria.'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_42',
      questionText:
          'Para el desarrollo de una API RESTful en C++, ¿qué librería o framework es comúnmente utilizada para manejar las peticiones HTTP y la serialización/deserialización JSON?',
      options: [
        'A) `Boost.Asio` para operaciones de red y `nlohmann/json` para JSON.',
        'B) `Qt` Framework directamente.',
        'C) `OpenGL` para gráficos.',
        'D) `libcurl` para todas las operaciones.'
      ],
      correctAnswer: 'A',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_43',
      questionText:
          '¿Qué es el "Test-Driven Development" (TDD) en el contexto de C++?',
      options: [
        'A) Un método donde se escriben los tests después de escribir el código.',
        'B) Una metodología de desarrollo donde se escriben las pruebas unitarias antes de escribir el código de producción.',
        'C) Un enfoque que solo se aplica a sistemas embebidos.',
        'D) Una técnica para optimizar el rendimiento del código.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_44',
      questionText:
          'Al desplegar una aplicación C++ en diferentes entornos (desarrollo, pruebas, producción), ¿qué estrategia se utiliza para gestionar las diferencias en las configuraciones (rutas, credenciales, etc.)?',
      options: [
        'A) Codificar todas las configuraciones directamente en el código fuente.',
        'B) Usar variables de entorno o archivos de configuración externos.',
        'C) Recompilar la aplicación para cada entorno.',
        'D) Ignorar las diferencias y esperar que funcione.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_45',
      questionText:
          'Un desarrollador necesita crear un conjunto de objetos complejos paso a paso, permitiendo diferentes representaciones del mismo proceso de construcción. ¿Qué patrón de diseño se ajusta a este requisito?',
      options: ['A) Facade', 'B) Builder', 'C) Proxy', 'D) Iterator'],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_46',
      questionText:
          'Para mejorar la robustez de una aplicación C++, se implementa un sistema de gestión de errores que no solo captura excepciones, sino que también las registra y notifica al equipo de desarrollo. ¿Qué componente clave es necesario para este sistema?',
      options: [
        'A) Un depurador en tiempo real.',
        'B) Un sistema de logging y monitoreo de errores.',
        'C) Una biblioteca de compresión de datos.',
        'D) Un generador de informes de rendimiento.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_47',
      questionText:
          'Un proyecto C++ ha crecido significativamente y el tiempo de compilación se ha vuelto muy largo. ¿Qué estrategia puede ayudar a reducir los tiempos de compilación?',
      options: [
        'A) Aumentar el número de archivos de encabezado incluidos.',
        'B) Utilizar la precompilación de encabezados, reducir las dependencias de los archivos de encabezado (PImpl), y la compilación distribuida.',
        'C) Deshabilitar las optimizaciones del compilador.',
        'D) Usar solo un archivo fuente grande.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_48',
      questionText:
          'En sistemas con memoria limitada, como los sistemas embebidos, ¿qué técnica de gestión de memoria es crucial para evitar la fragmentación y optimizar el uso de la RAM?',
      options: [
        'A) Usar solo asignaciones dinámicas con `new` y `delete`.',
        'B) Utilizar un asignador de memoria personalizado (custom allocator) o pools de memoria.',
        'C) Depender exclusivamente del recolector de basura.',
        'D) Almacenar todos los datos en el disco duro.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_49',
      questionText:
          '¿Qué es un "hook" en el contexto de la interacción con el sistema operativo o bibliotecas de terceros?',
      options: [
        'A) Una función que se ejecuta solo una vez al inicio del programa.',
        'B) Un punto de inserción en el código o sistema que permite interceptar y modificar el comportamiento predeterminado o añadir funcionalidad personalizada.',
        'C) Un error de compilación que impide la ejecución.',
        'D) Un tipo de variable global.'
      ],
      correctAnswer: 'B',
      language: 'C++',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'cpp_sr_50',
      questionText:
          'Un equipo está diseñando un sistema de alto rendimiento donde el acceso a datos compartidos entre múltiples hilos debe ser extremadamente rápido y sin bloqueos siempre que sea posible. ¿Qué tipo de estructuras de datos serían preferidas en este escenario?',
      options: [
        'A) Estructuras de datos basadas en `std::list`.',
        'B) Estructuras de datos basadas en bloqueo (`std::mutex`).',
        'C) Estructuras de datos lock-free (usando `std::atomic` y algoritmos concurrentes).',
        'D) Estructuras de datos inmutables.'
      ],
      correctAnswer: 'C',
      language: 'C++',
      module: 'Sr',
    ),
  ];

  // Insertar las preguntas en la base de datos
  for (final question in preloadedCppSrQuestions) {
    await db.insert(tableName, question.toMap());
  }
}
