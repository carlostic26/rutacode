import 'package:rutacode/features/exam/data/models/exam_question_model.dart';
import 'package:sqflite_common/sqlite_api.dart';

Future<void> preloadJavaScriptJrQuestions(Database db, tableName) async {
  final preloadedJavaScriptJrQuestions = [
    ExamQuestionModel(
      id: 'js_jr_01',
      questionText:
          '¿Qué palabra clave permite declarar una variable con ámbito de bloque en JavaScript?',
      options: ['A) var', 'B) let', 'C) const', 'D) static'],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_02',
      questionText:
          '¿Qué tipo de dato representa una ausencia intencional de valor en JavaScript?',
      options: ['A) undefined', 'B) false', 'C) null', 'D) NaN'],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_03',
      questionText:
          '¿Qué operador devuelve el tipo de una variable en JavaScript?',
      options: ['A) type()', 'B) typeof', 'C) instanceOf', 'D) class'],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_04',
      questionText: '¿Cuál de los siguientes NO es un tipo de dato primitivo?',
      options: ['A) symbol', 'B) string', 'C) object', 'D) number'],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_05',
      questionText:
          '¿Qué palabra clave permite declarar constantes en JavaScript?',
      options: ['A) const', 'B) static', 'C) final', 'D) let'],
      correctAnswer: 'A',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_06',
      questionText: '¿Cuál es el resultado de typeof null en JavaScript?',
      options: [
        'A) "object"',
        'B) "null"',
        'C) "undefined"',
        'D) "null object"'
      ],
      correctAnswer: 'A',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_07',
      questionText:
          '¿Qué estructura de control se usa para ejecutar diferentes bloques según un valor?',
      options: ['A) if', 'B) else', 'C) switch', 'D) try'],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_08',
      questionText:
          '¿Qué bucle ejecuta su bloque al menos una vez, incluso si la condición es falsa?',
      options: ['A) for', 'B) while', 'C) do...while', 'D) foreach'],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_09',
      questionText:
          '¿Qué palabra clave detiene la ejecución de un bucle inmediatamente?',
      options: ['A) continue', 'B) break', 'C) exit', 'D) return'],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_10',
      questionText: '¿Qué operador compara valor y tipo de manera estricta?',
      options: ['A) ==', 'B) !=', 'C) ===', 'D) ='],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_11',
      questionText: '¿Cuál de estos NO es un operador lógico en JavaScript?',
      options: ['A) &&', 'B) ||', 'C) !', 'D) <>'],
      correctAnswer: 'D',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_12',
      questionText: '¿Qué sentencia se usa para manejar excepciones?',
      options: [
        'A) try/catch',
        'B) if/else',
        'C) error/throw',
        'D) check/handle'
      ],
      correctAnswer: 'A',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_13',
      questionText: '¿Qué función convierte una cadena en número?',
      options: [
        'A) parseNumber()',
        'B) parseInt()',
        'C) stringToNum()',
        'D) convert()'
      ],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_14',
      questionText: '¿Cuál de estos NO es un bucle válido en JavaScript?',
      options: ['A) for', 'B) while', 'C) loop', 'D) do...while'],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_15',
      questionText:
          '¿Cuál es la forma correcta de declarar una función en JavaScript?',
      options: [
        'A) function = myFunc() {}',
        'B) def myFunc() {}',
        'C) function myFunc() {}',
        'D) fun myFunc() {}'
      ],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_16',
      questionText:
          '¿Qué palabra clave define una función anónima autoejecutable?',
      options: ['A) IIFE', 'B) Lambda', 'C) Arrow', 'D) AutoFunc'],
      correctAnswer: 'A',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_17',
      questionText: '¿Cuál de los siguientes es un operador de comparación?',
      options: ['A) +=', 'B) !==', 'C) &&', 'D) ++'],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_18',
      questionText:
          '¿Qué función se usa para verificar si una variable no es un número?',
      options: ['A) isnan()', 'B) isNaN()', 'C) isNumber()', 'D) checkNaN()'],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_19',
      questionText: '¿Qué operador se utiliza para concatenar cadenas?',
      options: ['A) +', 'B) &', 'C) &&', 'D) ||'],
      correctAnswer: 'A',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_20',
      questionText: '¿Cuál es el resultado de typeof NaN?',
      options: ['A) "number"', 'B) "NaN"', 'C) "undefined"', 'D) "object"'],
      correctAnswer: 'A',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_21',
      questionText: '¿Qué palabra clave lanza una excepción en JavaScript?',
      options: ['A) throw', 'B) raise', 'C) catch', 'D) break'],
      correctAnswer: 'A',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_22',
      questionText: '¿Cuál de las siguientes es una función flecha válida?',
      options: ['A) () -> {}', 'B) () => {}', 'C) {} => ()', 'D) arrow() {}'],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_23',
      questionText: '¿Qué valor se considera falsy en JavaScript?',
      options: ['A) "0"', 'B) []', 'C) false', 'D) "false"'],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_24',
      questionText:
          '¿Cuál de los siguientes es un tipo de dato introducido en ES6?',
      options: ['A) bigint', 'B) symbol', 'C) object', 'D) string'],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_25',
      questionText:
          '¿Qué palabra clave evita declarar variables globales accidentalmente?',
      options: ['A) const', 'B) let', 'C) use strict', 'D) final'],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_26',
      questionText:
          '¿Qué palabra clave define una variable global si se declara fuera de una función?',
      options: ['A) var', 'B) const', 'C) let', 'D) global'],
      correctAnswer: 'A',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_27',
      questionText: '¿Cuál de estos operadores se utiliza para incremento?',
      options: ['A) ++', 'B) +=', 'C) +', 'D) increment()'],
      correctAnswer: 'A',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_28',
      questionText:
          '¿Qué sentencia ejecuta un bloque siempre que una condición sea verdadera?',
      options: ['A) for', 'B) switch', 'C) if', 'D) while'],
      correctAnswer: 'D',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_29',
      questionText: '¿Qué objeto contiene información sobre errores lanzados?',
      options: ['A) Error', 'B) Exception', 'C) ThrowObject', 'D) CatchInfo'],
      correctAnswer: 'A',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_30',
      questionText:
          '¿Qué palabra clave se usa para declarar un parámetro rest?',
      options: ['A) ...', 'B) rest', 'C) spread', 'D) &'],
      correctAnswer: 'A',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_31',
      questionText:
          '¿Qué operador se usa para verificar si un objeto pertenece a una clase?',
      options: ['A) typeof', 'B) instanceof', 'C) classof', 'D) in'],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_32',
      questionText: '¿Cuál es el valor de undefined + 1 en JavaScript?',
      options: ['A) 1', 'B) "undefined1"', 'C) NaN', 'D) Error'],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_33',
      questionText: '¿Qué tipo devuelve typeof NaN?',
      options: ['A) NaN', 'B) number', 'C) undefined', 'D) null'],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_34',
      questionText: '¿Qué método convierte un string en número flotante?',
      options: [
        'A) parseInt()',
        'B) parseFloat()',
        'C) Number()',
        'D) Float()'
      ],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_35',
      questionText: '¿Qué valor es falsy en JavaScript?',
      options: ['A) "0"', 'B) []', 'C) 0', 'D) "false"'],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_36',
      questionText:
          '¿Qué palabra clave previene la redeclaración de variables dentro de un mismo bloque?',
      options: ['A) var', 'B) const', 'C) let', 'D) static'],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_37',
      questionText:
          '¿Qué tipo de función puede ser invocada inmediatamente tras su definición?',
      options: ['A) Arrow function', 'B) IIFE', 'C) Callback', 'D) Lambda'],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_38',
      questionText: '¿Cuál de estos no es un valor primitivo?',
      options: ['A) number', 'B) string', 'C) object', 'D) boolean'],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_39',
      questionText: '¿Qué hace el operador `===`?',
      options: [
        'A) Compara valores sin importar tipo',
        'B) Compara solo tipos',
        'C) Compara valor y tipo',
        'D) Asigna valores'
      ],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_40',
      questionText: '¿Cuál de los siguientes es un operador de asignación?',
      options: ['A) ==', 'B) =', 'C) ===', 'D) !='],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_41',
      questionText: '¿Qué operador se usa para negar una condición?',
      options: ['A) &&', 'B) ||', 'C) !', 'D) !='],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_42',
      questionText:
          '¿Cuál de estos operadores sirve para comparar igualdad floja?',
      options: ['A) ===', 'B) ==', 'C) =', 'D) !=='],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_43',
      questionText: '¿Cuál es el valor de typeof []?',
      options: ['A) "array"', 'B) "object"', 'C) "list"', 'D) "[]"'],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_44',
      questionText:
          '¿Cuál de las siguientes funciones nativas evalúa código JS en tiempo de ejecución?',
      options: ['A) isNaN()', 'B) eval()', 'C) parseInt()', 'D) Number()'],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_45',
      questionText:
          '¿Qué operador se usa para asignar y evaluar al mismo tiempo?',
      options: ['A) =', 'B) :=', 'C) =>', 'D) , (coma)'],
      correctAnswer: 'D',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_46',
      questionText: '¿Cuál es el tipo de dato retornado por typeof undefined?',
      options: ['A) "null"', 'B) "undefined"', 'C) "object"', 'D) "false"'],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_47',
      questionText:
          '¿Qué función se usa para verificar la validez de un número?',
      options: [
        'A) isFinite()',
        'B) isValid()',
        'C) isNaN()',
        'D) checkNumber()'
      ],
      correctAnswer: 'A',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_48',
      questionText:
          '¿Qué operador se utiliza para comparar referencias a objetos?',
      options: ['A) ==', 'B) ===', 'C) instanceof', 'D) Object.is()'],
      correctAnswer: 'D',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_49',
      questionText: '¿Qué palabra clave puede causar hoisting?',
      options: ['A) const', 'B) let', 'C) var', 'D) function*'],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'js_jr_50',
      questionText:
          '¿Qué tipo de conversión ocurre cuando JavaScript transforma tipos automáticamente?',
      options: ['A) explícita', 'B) coerción', 'C) directa', 'D) binaria'],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Jr',
    ),
  ];

  // Insertar las preguntas en la base de datos
  for (final question in preloadedJavaScriptJrQuestions) {
    await db.insert(tableName, question.toMap());
  }
}

Future<void> preloadJavaScriptMidQuestions(Database db, tableName) async {
  final preloadedJavaScriptMidQuestions = [
    ExamQuestionModel(
      id: 'js_mid_01',
      questionText:
          'En JavaScript, ¿cuál es la forma correcta de acceder a la propiedad "nombre" de un objeto llamado "usuario" usando dot notation?',
      options: [
        'A) usuario["nombre"]',
        'B) usuario.nombre',
        'C) usuario->nombre',
        'D) usuario::nombre'
      ],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_02',
      questionText:
          '¿Cuál es el propósito principal de JSON.stringify() en JavaScript?',
      options: [
        'A) Convertir una cadena JSON en un objeto JavaScript.',
        'B) Convertir un objeto JavaScript en una cadena JSON.',
        'C) Validar la sintaxis JSON.',
        'D) Parsear una URL JSON.'
      ],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_03',
      questionText:
          '¿Qué método de Array se utiliza para agregar uno o más elementos al final de un array y devuelve la nueva longitud del array?',
      options: ['A) shift()', 'B) unshift()', 'C) push()', 'D) pop()'],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_04',
      questionText:
          '¿Cuál es la principal ventaja de usar Typed Arrays como Int8Array en JavaScript?',
      options: [
        'A) Mejor manejo de cadenas.',
        'B) Optimización de memoria y rendimiento para datos numéricos.',
        'C) Mejor manejo de objetos.',
        'D) Facilita la manipulación del DOM.'
      ],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_05',
      questionText:
          'En JavaScript, ¿qué estructura de datos se utiliza para almacenar colecciones de clave-valor donde las claves pueden ser de cualquier tipo?',
      options: ['A) Set', 'B) Array', 'C) Map', 'D) Object'],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_06',
      questionText: '¿Qué describe mejor un "closure" en JavaScript?',
      options: [
        'A) Una función que no tiene acceso a variables externas.',
        'B) Una función que se invoca inmediatamente después de su definición.',
        'C) Una función que "recuerda" el entorno en el que fue creada, incluso cuando se ejecuta fuera de ese entorno.',
        'D) Una función que se llama a sí misma recursivamente.'
      ],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_07',
      questionText:
          '¿Qué hace que el "lexical scope" sea importante en JavaScript?',
      options: [
        'A) Determina cómo se manejan los eventos del DOM.',
        'B) Define el ámbito de las variables basándose en la ubicación física en el código.',
        'C) Controla la asincronía en el código.',
        'D) Regula el uso de "this" en diferentes contextos.'
      ],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_08',
      questionText:
          'Cuando se usa "this" en una función flecha en JavaScript, ¿a qué contexto se refiere?',
      options: [
        'A) Al objeto global (window o global).',
        'B) Al objeto que llama a la función flecha.',
        'C) Al contexto léxico (donde se define la función flecha).',
        'D) Siempre es undefined.'
      ],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_09',
      questionText:
          '¿Qué método se utiliza para llamar a una función con un valor "this" específico y argumentos proporcionados como una lista individual?',
      options: ['A) apply()', 'B) bind()', 'C) call()', 'D) create()'],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_10',
      questionText:
          'En el Event Loop de JavaScript, ¿qué es la "callback queue"?',
      options: [
        'A) Una pila de llamadas de funciones.',
        'B) Una cola de tareas asincrónicas listas para ser ejecutadas.',
        'C) Un registro de eventos del DOM.',
        'D) Una lista de promesas pendientes.'
      ],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_11',
      questionText:
          '¿Cuál es la principal diferencia entre setTimeout() y setInterval()?',
      options: [
        'A) setTimeout ejecuta una función repetidamente, setInterval la ejecuta una sola vez.',
        'B) setTimeout es para promesas, setInterval para callbacks.',
        'C) setTimeout ejecuta una función una sola vez después de un retardo, setInterval la ejecuta repetidamente en intervalos.',
        'D) No hay diferencia, son sinónimos.'
      ],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_12',
      questionText:
          '¿Qué término se usa para describir la anidación excesiva de funciones callback, lo que dificulta la lectura y el mantenimiento del código?',
      options: [
        'A) Callback chain',
        'B) Callback hell',
        'C) Callback loop',
        'D) Callback pyramid'
      ],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_13',
      questionText:
          '¿Qué método se utiliza para manejar errores en una cadena de promesas en JavaScript?',
      options: ['A) .thenError()', 'B) .error()', 'C) .catch()', 'D) .fail()'],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_14',
      questionText:
          '¿Cuál es la palabra clave que se utiliza dentro de una función `async` para esperar la resolución de una promesa?',
      options: ['A) wait', 'B) yield', 'C) await', 'D) resolve'],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_15',
      questionText:
          '¿En qué contexto se puede aplicar la directiva \'use strict\' en JavaScript?',
      options: [
        'A) Sólo a nivel global.',
        'B) Sólo dentro de funciones.',
        'C) A nivel global, dentro de funciones y dentro de clases.',
        'D) Sólo dentro de bloques `if`.'
      ],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_16',
      questionText:
          '¿Cuál de los siguientes errores comunes es evitado por \'use strict\'?',
      options: [
        'A) Errores de sintaxis.',
        'B) Asignación accidental a variables no declaradas.',
        'C) Errores de red.',
        'D) Bucles infinitos.'
      ],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_17',
      questionText:
          '¿Qué herramienta se menciona para ayudar a aplicar un estilo y convenciones de código consistentes en JavaScript?',
      options: [
        'A) Debugger',
        'B) Bundler',
        'C) Linter (eslint)',
        'D) Compiler'
      ],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_18',
      questionText:
          '¿Qué método del DOM se utiliza para seleccionar un elemento por su ID?',
      options: [
        'A) querySelector()',
        'B) getElementsByClassName()',
        'C) getElementById()',
        'D) findElementById()'
      ],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_19',
      questionText:
          '¿Qué concepto en JavaScript permite que un solo manejador de eventos gestione eventos para múltiples elementos secundarios, aprovechando la burbujeo de eventos?',
      options: [
        'A) Event Bubbling',
        'B) Event Capturing',
        'C) Event Delegation',
        'D) Event Propagation'
      ],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_20',
      questionText:
          '¿Qué pestaña de las DevTools del navegador es útil para inspeccionar las solicitudes de red realizadas por una página web?',
      options: ['A) Console', 'B) Elements', 'C) Sources', 'D) Network'],
      correctAnswer: 'D',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_21',
      questionText:
          '¿Cuál es la función moderna en JavaScript para realizar peticiones HTTP?',
      options: [
        r'''A) XMLHttpRequest', 'B) $.ajax()', 'C) fetch()', 'D) sendRequest()'''
      ],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_22',
      questionText:
          'En el manejo de respuestas con `fetch()`, ¿qué método se utiliza para parsear el cuerpo de la respuesta como JSON?',
      options: ['A) .text()', 'B) .blob()', 'C) .json()', 'D) .formData()'],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_23',
      questionText:
          '¿Qué método se utiliza en `XMLHttpRequest` para especificar el tipo de solicitud HTTP (GET, POST, etc.) y la URL?',
      options: [
        'A) send()',
        'B) open()',
        'C) setRequestHeader()',
        'D) onload()'
      ],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_24',
      questionText:
          '¿Cuál de los siguientes es un ejemplo de "Topic 3: Control de Flujo en Bucles" en JavaScript?',
      options: [
        'A) Bucle for...of',
        'B) Uso de break',
        'C) Sentencia switch',
        'D) Objeto arguments'
      ],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_25',
      questionText:
          '¿Qué subtopic se relaciona con "Nivel 5: Operadores y Expresiones", "Topic 2: Comparaciones de Igualdad"?',
      options: [
        'A) Operadores lógicos',
        'B) Algoritmo is LooselyEqual',
        'C) Operador typeof',
        'D) Operadores aritméticos'
      ],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_26',
      questionText:
          '¿Cuál es el propósito principal de `JSON.parse()` en JavaScript?',
      options: [
        'A) Convertir un objeto JavaScript a una cadena JSON.',
        'B) Convertir una cadena JSON a un objeto JavaScript.',
        'C) Validar un objeto JavaScript.',
        'D) Enviar datos JSON a un servidor.'
      ],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_27',
      questionText:
          '¿Qué método de Array se utiliza para iterar sobre los elementos de un array y ejecutar una función de callback para cada elemento, sin modificar el array original?',
      options: ['A) map()', 'B) filter()', 'C) forEach()', 'D) reduce()'],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_28',
      questionText:
          '¿Cuál es la diferencia clave entre `Map` y `WeakMap` en JavaScript?',
      options: [
        'A) `Map` solo puede tener cadenas como claves, `WeakMap` puede tener objetos.',
        'B) `WeakMap` permite la recolección de basura de sus claves si no hay otras referencias a ellas, `Map` no.',
        'C) `Map` es más rápido para iterar, `WeakMap` es más lento.',
        'D) `WeakMap` puede almacenar valores primitivos, `Map` solo objetos.'
      ],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_29',
      questionText:
          '¿Qué ventaja ofrecen los "closures" en JavaScript en términos de encapsulamiento?',
      options: [
        'A) Permiten el acceso global a todas las variables.',
        'B) Ayudan a simular variables privadas, protegiéndolas del acceso externo.',
        'C) Hacen que todas las funciones sean públicas por defecto.',
        'D) Eliminan la necesidad de declarar variables.'
      ],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_30',
      questionText:
          '¿Cómo afecta el "lexical scope" a las funciones anidadas en JavaScript?',
      options: [
        'A) Las funciones anidadas solo pueden acceder a sus propias variables.',
        'B) Las funciones anidadas pueden acceder a las variables de su ámbito padre.',
        'C) Las funciones anidadas tienen un ámbito global por defecto.',
        'D) Las funciones anidadas no pueden acceder a variables fuera de ellas mismas.'
      ],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_31',
      questionText:
          '¿Qué método de manipulación de contexto se utiliza para establecer el valor de `this` para una función y llamarla inmediatamente con argumentos proporcionados como un array?',
      options: ['A) call()', 'B) bind()', 'C) apply()', 'D) execute()'],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_32',
      questionText:
          'En el Event Loop, ¿cuál es la diferencia entre "microtasks" y "macrotasks"?',
      options: [
        'A) No hay diferencia, son el mismo concepto.',
        'B) Las microtasks se ejecutan antes que las macrotasks en cada ciclo del Event Loop.',
        'C) Las macrotasks se ejecutan antes que las microtasks en cada ciclo del Event Loop.',
        'D) Las microtasks solo se usan para el DOM, macrotasks para la red.'
      ],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_33',
      questionText:
          '¿Cuál es una técnica común para evitar el "callback hell"?',
      options: [
        'A) Usar más callbacks anidados.',
        'B) Encadenar promesas o usar async/await.',
        'C) Evitar el uso de funciones asincrónicas.',
        'D) Usar solo `setTimeout`.'
      ],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_34',
      questionText: 'En JavaScript, ¿cómo se crea una nueva promesa?',
      options: [
        'A) `new Promise()`',
        'B) `Promise.create()`',
        'C) `Promise()`',
        'D) `makePromise()`'
      ],
      correctAnswer: 'A',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_35',
      questionText:
          'Cuando se utiliza `async/await`, ¿cómo se manejan los errores que ocurren dentro de las funciones asincrónicas?',
      options: [
        'A) Con bloques `if/else`.',
        'B) Con `try/catch`.',
        'C) No se pueden manejar errores.',
        'D) Con sentencias `switch`.'
      ],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_36',
      questionText:
          r'''¿Qué ocurre si se intenta escribir sobre una propiedad no configurable en modo estricto (`'use strict'`)?''',
      options: [
        'A) La operación es ignorada silenciosamente.',
        'B) Se lanza un error `TypeError`.',
        'C) La propiedad se sobrescribe de todos modos.',
        'D) La aplicación se detiene.'
      ],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_37',
      questionText:
          '¿Por qué es importante el "nombrado de variables" en las buenas prácticas de código JavaScript?',
      options: [
        'A) Para hacer el código más corto.',
        'B) Para mejorar la legibilidad y el mantenimiento del código.',
        'C) Para evitar errores de sintaxis.',
        'D) Para optimizar el rendimiento.'
      ],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_38',
      questionText:
          '¿Qué método del DOM se utiliza para añadir un nuevo nodo (elemento) como hijo de otro elemento existente?',
      options: [
        'A) removeChild()',
        'B) replaceChild()',
        'C) appendChild()',
        'D) insertNode()'
      ],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_39',
      questionText:
          '¿Cuál es una característica clave de los "eventos del teclado" en el DOM?',
      options: [
        'A) Solo se disparan en elementos de formulario.',
        'B) Incluyen `keydown`, `keyup` y `keypress`.',
        'C) No se pueden prevenir.',
        'D) Solo se detectan en el objeto `window`.'
      ],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_40',
      questionText:
          '¿Para qué se utiliza la pestaña "Sources" en las DevTools del navegador?',
      options: [
        'A) Para ver las solicitudes de red.',
        'B) Para depurar el código JavaScript con breakpoints.',
        'C) Para inspeccionar los elementos HTML y CSS.',
        'D) Para analizar el rendimiento de la aplicación.'
      ],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_41',
      questionText:
          'Al realizar una petición `fetch()`, ¿qué opción se utiliza para especificar el método HTTP (GET, POST, PUT, etc.)?',
      options: ['A) `body`', 'B) `headers`', 'C) `method`', 'D) `mode`'],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_42',
      questionText:
          '¿Qué indica un código de estado HTTP 404 en una respuesta de `fetch()`?',
      options: [
        'A) Éxito de la petición.',
        'B) Recurso no encontrado.',
        'C) Error interno del servidor.',
        'D) Permiso denegado.'
      ],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_43',
      questionText:
          '¿Qué tipo de evento se utiliza con `XMLHttpRequest` para detectar cuando la respuesta de una petición ha sido recibida y está lista?',
      options: ['A) `click`', 'B) `load`', 'C) `change`', 'D) `submit`'],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_44',
      questionText:
          '¿Qué subtopic se encuentra bajo "Nivel 1: Estructuras de Datos", "Topic 1: Objetos"?',
      options: [
        'A) Sintaxis de JSON',
        'B) Métodos en objetos',
        'C) Creación de Map',
        'D) Conversión de string a número'
      ],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_45',
      questionText:
          '¿Cuál de los siguientes es un "Método común" para Arrays, según el documento?',
      options: ['A) filter', 'B) for...of', 'C) Object.is()', 'D) eval'],
      correctAnswer: 'A',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_46',
      questionText:
          'En el contexto de "Funciones Avanzadas y this", ¿qué describe mejor el "Lexical Environment"?',
      options: [
        'A) El entorno de ejecución global.',
        'B) El entorno donde una función fue definida estáticamente en el código.',
        'C) El contexto de `this` en tiempo de ejecución.',
        'D) La pila de llamadas.'
      ],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_47',
      questionText:
          '¿Qué subtopic se relaciona con "Nivel 3: Asincronía", "Topic 2: Temporizadores"?',
      options: [
        'A) Call stack',
        'B) setTimeout()',
        'C) Creación de promesas',
        'D) Sintaxis básica de async/await'
      ],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_48',
      questionText:
          '¿Qué práctica de código se menciona en "Nivel 4: Modo Estricto y Buenas Prácticas", "Topic 3: Estilo y convenciones de código"?',
      options: [
        'A) Uso de `eval`',
        'B) Asignación accidental a variables no declaradas',
        'C) Sangría y estructura',
        'D) Callback hell'
      ],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_49',
      questionText:
          'En el contexto de "Nivel 5: DOM y Herramientas del Navegador", "Topic 1: DOM básico", ¿qué acción se menciona?',
      options: [
        'A) Análisis de performance',
        'B) Manejadores de eventos',
        'C) Manipulación de texto y atributos',
        'D) Comunicación HTTP con fetch'
      ],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'js_mid_50',
      questionText:
          '¿Qué se discute en "Nivel 6: APIs Web y Fetch", "Topic 2: Manejo de errores en peticiones"?',
      options: [
        'A) Sintaxis básica de fetch()',
        'B) Objeto arguments',
        'C) Uso de try/catch con async/await',
        'D) Métodos en clases'
      ],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Mid',
    ),
  ];

  // Insertar las preguntas en la base de datos
  for (final question in preloadedJavaScriptMidQuestions) {
    await db.insert(tableName, question.toMap());
  }
}

Future<void> preloadJavaScriptSrQuestions(Database db, tableName) async {
  final preloadedJavaScriptSrQuestions = [
    ExamQuestionModel(
      id: 'js_sr_01',
      questionText:
          '¿Qué palabra clave se usa para definir una clase en JavaScript?',
      options: ['A) function', 'B) def', 'C) class', 'D) constructor'],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_02',
      questionText: '¿Qué método se usa para heredar de otra clase?',
      options: ['A) prototype()', 'B) inherit()', 'C) extend()', 'D) extends'],
      correctAnswer: 'D',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_03',
      questionText:
          '¿Cuál es la forma correcta de exportar una función con módulos ES?',
      options: [
        'A) export function myFunc() {}',
        'B) export = myFunc()',
        'C) exports.myFunc',
        'D) module.export'
      ],
      correctAnswer: 'A',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_04',
      questionText: '¿Cuál es el propósito de Object.freeze()?',
      options: [
        'A) Eliminar propiedades de un objeto',
        'B) Hacer un objeto inmutable',
        'C) Evitar el uso de memoria',
        'D) Convertir un objeto en string'
      ],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_05',
      questionText: '¿Qué método permite la delegación de eventos en el DOM?',
      options: [
        'A) addEventListener()',
        'B) dispatchEvent()',
        'C) stopPropagation()',
        'D) onEvent()'
      ],
      correctAnswer: 'A',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_06',
      questionText:
          '¿Qué operador accede de forma segura a propiedades anidadas?',
      options: ['A) ??', 'B) ?.', 'C) &&', 'D) =='],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_07',
      questionText: '¿Qué función se utiliza para cargar módulos en CommonJS?',
      options: ['A) include()', 'B) load()', 'C) require()', 'D) import'],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_08',
      questionText:
          '¿Qué palabra clave se utiliza para acceder al constructor padre en una subclase?',
      options: ['A) parent()', 'B) super', 'C) this.super', 'D) extends'],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_09',
      questionText: '¿Qué método convierte una matriz en un solo valor?',
      options: ['A) map()', 'B) forEach()', 'C) reduce()', 'D) flat()'],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_10',
      questionText:
          '¿Qué símbolo se usa para declarar campos privados en clases ES?',
      options: ['A) _', 'B) private', 'C) #', 'D) !'],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_11',
      questionText: '¿Qué hace Object.seal() a un objeto?',
      options: [
        'A) Impide la eliminación y adición de propiedades, pero permite modificarlas',
        'B) Lo congela completamente',
        'C) Elimina todos los métodos',
        'D) Previene cualquier uso del objeto'
      ],
      correctAnswer: 'A',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_12',
      questionText:
          '¿Qué método se usa para observar consumo de memoria en tiempo real?',
      options: [
        'A) console.memory()',
        'B) performance.memory()',
        'C) devtools',
        'D) heapSnap()'
      ],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_13',
      questionText: '¿Cuál de estos métodos permite composición de funciones?',
      options: ['A) compose()', 'B) reduce()', 'C) map()', 'D) pipe()'],
      correctAnswer: 'A',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_14',
      questionText:
          '¿Qué estructura permite definir iteradores personalizados?',
      options: [
        'A) [Symbol.iterator]',
        'B) generator()',
        'C) customFor',
        'D) IteratorLoop'
      ],
      correctAnswer: 'A',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_15',
      questionText: '¿Qué define una función generadora en JS?',
      options: [
        'A) function* nombre()',
        'B) gen function()',
        'C) def nombre()',
        'D) generator nombre()'
      ],
      correctAnswer: 'A',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_16',
      questionText:
          '¿Qué característica permite suspender y reanudar funciones en JS?',
      options: ['A) await', 'B) yield', 'C) then()', 'D) pause()'],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_17',
      questionText: '¿Cuál de estos NO es un ataque que previene "use strict"?',
      options: [
        'A) XSS',
        'B) asignar sin declarar',
        'C) duplicar parámetros',
        'D) escritura sobre propiedades no configurables'
      ],
      correctAnswer: 'A',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_18',
      questionText: '¿Qué operador lógico compuesto fue introducido en ES2020?',
      options: ['A) &&=', 'B) or=!', 'C) =!=', 'D) ===>'],
      correctAnswer: 'A',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_19',
      questionText: '¿Qué hace Object.preventExtensions()?',
      options: [
        'A) Previene la edición de propiedades',
        'B) Impide añadir nuevas propiedades',
        'C) Elimina propiedades',
        'D) Hace el objeto inmutable'
      ],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_20',
      questionText: '¿Cuál es el propósito de Intl.NumberFormat?',
      options: [
        'A) Redondear decimales',
        'B) Internacionalizar números',
        'C) Convertir a hexadecimal',
        'D) Formatear fechas'
      ],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_21',
      questionText: '¿Qué método se usa para aplanar arrays anidados?',
      options: ['A) map()', 'B) reduce()', 'C) flat()', 'D) slice()'],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_22',
      questionText: '¿Cuál es un caso común de fuga de memoria en JS?',
      options: [
        'A) Uso de `const`',
        'B) Uso de `for`',
        'C) Referencias colgantes en closures',
        'D) Uso de funciones flecha'
      ],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_23',
      questionText: '¿Cuál es una ventaja de los módulos ES sobre CommonJS?',
      options: [
        'A) Uso sin import',
        'B) Carga sincrónica',
        'C) Soporte nativo del navegador',
        'D) Uso de require'
      ],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_24',
      questionText:
          '¿Qué palabra clave encapsula funciones en programación funcional?',
      options: ['A) curry', 'B) map', 'C) compose', 'D) const'],
      correctAnswer: 'A',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_25',
      questionText:
          '¿Qué permite a un generador async pausar hasta que se resuelva una promesa?',
      options: ['A) await', 'B) yield', 'C) for...await', 'D) then'],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_26',
      questionText: '¿Qué tipo de herencia implementa JavaScript por defecto?',
      options: ['A) Clásica', 'B) Prototípica', 'C) Múltiple', 'D) Jerárquica'],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_27',
      questionText: '¿Cuál es la salida de Object.getPrototypeOf([])?',
      options: ['A) Array', 'B) Object', 'C) null', 'D) Array.prototype'],
      correctAnswer: 'D',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_28',
      questionText:
          '¿Cuál es una forma válida de definir un método estático en una clase?',
      options: [
        'A) static myMethod() {}',
        'B) function* static myMethod',
        'C) this.myMethod() = static',
        'D) #static()'
      ],
      correctAnswer: 'A',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_29',
      questionText:
          '¿Qué operador devuelve el primer valor definido (no null o undefined)?',
      options: ['A) ||', 'B) ??', 'C) &&', 'D) ?:'],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_30',
      questionText:
          '¿Qué función se utiliza para obtener pares clave-valor de un objeto?',
      options: [
        'A) Object.keys()',
        'B) Object.entries()',
        'C) Object.values()',
        'D) Object.map()'
      ],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_31',
      questionText: '¿Qué ventaja ofrece el patrón de módulos en JavaScript?',
      options: [
        'A) Mayor rendimiento',
        'B) Evita colisiones de nombres',
        'C) Mejora la compatibilidad con CSS',
        'D) Permite cargar imágenes'
      ],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_32',
      questionText:
          '¿Qué tipo de colección es débilmente referenciada y no evita el garbage collection?',
      options: ['A) Set', 'B) WeakSet', 'C) Map', 'D) Array'],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_33',
      questionText: '¿Qué función se utiliza para convertir datos a JSON?',
      options: [
        'A) JSON.convert()',
        'B) JSON.encode()',
        'C) JSON.stringify()',
        'D) toJSON()'
      ],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_34',
      questionText:
          '¿Qué API se recomienda para obtener información del navegador?',
      options: ['A) navigator', 'B) location', 'C) window', 'D) userAgent'],
      correctAnswer: 'A',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_35',
      questionText:
          '¿Qué estructura permite gestionar tareas asincrónicas con mejor legibilidad?',
      options: [
        'A) callbacks',
        'B) promises',
        'C) async/await',
        'D) setInterval'
      ],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_36',
      questionText:
          '¿Qué método se usa para agrupar llamadas a funciones en eventos de scroll?',
      options: ['A) batch()', 'B) throttle()', 'C) reduce()', 'D) forEach()'],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_37',
      questionText:
          '¿Qué característica de programación funcional asegura que una función no tiene efectos secundarios?',
      options: [
        'A) Inmutabilidad',
        'B) Función pura',
        'C) Recursión',
        'D) Curry'
      ],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_38',
      questionText: '¿Cuál es el beneficio del operador ?. en JavaScript?',
      options: [
        'A) Mejora el rendimiento de loops',
        'B) Evita errores si una propiedad no existe',
        'C) Reemplaza typeof',
        'D) Define clases privadas'
      ],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_39',
      questionText:
          '¿Qué permite a un generador comunicar valores desde el exterior?',
      options: ['A) yield', 'B) this', 'C) next()', 'D) return'],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_40',
      questionText:
          '¿Qué método detiene la propagación de un evento en el DOM?',
      options: [
        'A) stopDefault()',
        'B) preventDefault()',
        'C) stopPropagation()',
        'D) blockEvent()'
      ],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_41',
      questionText:
          '¿Qué función aplana arrays y luego ejecuta una transformación?',
      options: ['A) map()', 'B) flat()', 'C) flatMap()', 'D) reduce()'],
      correctAnswer: 'C',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_42',
      questionText:
          '¿Qué operador fue introducido en ES2020 para trabajar con valores null o undefined?',
      options: ['A) ??', 'B) !', 'C) ?.', 'D) =='],
      correctAnswer: 'A',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_43',
      questionText: '¿Qué propiedad de Intl permite formatear fechas?',
      options: [
        'A) Intl.DateFormat',
        'B) Intl.DateTimeFormat',
        'C) Intl.Time',
        'D) Date.Intl'
      ],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_44',
      questionText:
          '¿Qué método ejecuta una función sobre cada elemento de un array y retorna un nuevo array?',
      options: ['A) map()', 'B) forEach()', 'C) reduce()', 'D) filter()'],
      correctAnswer: 'A',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_45',
      questionText:
          '¿Qué operador permite asignación solo si el valor es null o undefined?',
      options: ['A) ||=', 'B) ??=', 'C) &&=', 'D) !=='],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_46',
      questionText: '¿Qué función mide el tiempo preciso de ejecución en JS?',
      options: [
        'A) performance.now()',
        'B) Date.now()',
        'C) time()',
        'D) console.time()'
      ],
      correctAnswer: 'A',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_47',
      questionText:
          '¿Qué herramienta del navegador ayuda a detectar memory leaks?',
      options: [
        'A) Network',
        'B) Console',
        'C) Performance',
        'D) Heap snapshot'
      ],
      correctAnswer: 'D',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_48',
      questionText:
          '¿Qué método obtiene el valor de una propiedad con símbolo?',
      options: [
        'A) Object.get()',
        'B) Reflect.get()',
        'C) Symbol.get()',
        'D) Object.symbols()'
      ],
      correctAnswer: 'B',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_49',
      questionText:
          '¿Qué función se usa para copiar propiedades de un objeto a otro?',
      options: [
        'A) Object.assign()',
        'B) Object.copy()',
        'C) Object.clone()',
        'D) Object.merge()'
      ],
      correctAnswer: 'A',
      language: 'JavaScript',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'js_sr_50',
      questionText:
          '¿Qué método permite definir una propiedad con configuración específica?',
      options: [
        'A) Object.defineProperty()',
        'B) Object.setProperty()',
        'C) Object.config()',
        'D) Object.edit()'
      ],
      correctAnswer: 'A',
      language: 'JavaScript',
      module: 'Sr',
    ),
  ];

  // Insertar las preguntas en la base de datos
  for (final question in preloadedJavaScriptSrQuestions) {
    await db.insert(tableName, question.toMap());
  }
}
