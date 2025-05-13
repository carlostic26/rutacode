import 'package:flutter/material.dart';
import 'package:rutacode/features/level/data/datasources/level_local_database.dart';
import 'package:sqflite_common/sqlite_api.dart';

class DetailJrLocalDatabaseHelper {
  LevelLocalDatabaseHelper dbHelper = LevelLocalDatabaseHelper();

  Future<void> createDetailTable(Database db) async {
    await db.execute('''
      CREATE TABLE detail(
        id INTEGER,  
        module TEXT,
        subtopic_id TEXT,
        definition TEXT,
        img_url TEXT,
        code_example TEXT,          
        PRIMARY KEY (module, subtopic_id, id), -- Clave primaria compuesta
        FOREIGN KEY (module, subtopic_id) REFERENCES subtopic(module, id) ON DELETE CASCADE
      );
    ''');

    insertDetailsJr(db);
  }

  Future<void> insertDetailsJr(Database db) async {
    try {
      await insertDetailsJrLevel1(db);
      await insertDetailsJrLevel2(db);
      await insertDetailsJrLevel3(db);
      await insertDetailsJrLevel4(db);
      await insertDetailsJrLevel5(db);
      await insertDetailsJrLevel6(db);
      await insertDetailsJrLevel7(db);
      await insertDetailsJrLevel8(db);
      await insertDetailsJrLevel9(db);
    } catch (e) {
      //print("Error inserting details jr: $e");
    }
  }

  Future<void> insertDetailsJrLevel1(Database db) async {
    try {
      await _insertDetailsJrTopic1Level1(db);
      await _insertDetailsJrTopic2Level1(db);
      await _insertDetailsJrTopic3Level1(db);
      await _insertDetailsJrTopic4Level1(db);
      await _insertDetailsJrTopic5Level1(db);
    } catch (e) {
      //print("Error inserting details jr level  1: $e");
    }
  }

  Future<void> _insertDetailsJrTopic1Level1(db) async {
    // Detalle para 'var'
    await db.insert('detail', {
      'id': 1,
      'subtopic_id': 's01t01l01', // Subtopic 'var'
      'module': 'Jr',
      'definition': 'La palabra clave `var` se utiliza para declarar una variable sin especificar su tipo explícitamente. El tipo se infiere en tiempo de compilación.\n\n'
          'En otras palabras... 😅\n\n'
          'Imagínate que entras a una tienda y le dices al vendedor: “Quiero comprar algo, pero todavía no sé qué”. En lugar de forzarte a elegir de inmediato, el vendedor te deja agarrar lo que necesites y luego te cobra según el producto que elijas. Así funciona `var` en programación.\n\n'
          'Cuando usas `var`, le estás diciendo al compilador: “Voy a guardar algo aquí, pero ya verás de qué tipo es cuando lo asigne”. Por ejemplo, si escribes `var edad = 25`, el compilador automáticamente entiende que `edad` es un número entero (`int`). Si en cambio escribes `var nombre = "Carlos"`, sabe que es un `String`.\n\n'
          'Así que recuerda: `var` te da flexibilidad al inicio, pero sigue teniendo reglas. Úsalo sabiamente y deja que el compilador haga su magia. ✨',
      'img_url': '',
      'code_example': '''
void main() {
  var edad = 25;
  var nombre = "Carlos";

 debugPrint("Nombre: \$nombre, Edad: \$edad");
}
''',
    });

    // Detalle para 'final'
    await db.insert('detail', {
      'id': 2,
      'subtopic_id': 's02t01l01', // Subtopic 'final'
      'module': 'Jr',
      'definition': 'La palabra clave `final` se utiliza para declarar una variable que solo puede ser asignada una vez. Su valor no puede cambiar después de la asignación inicial.\n\n'
          '¿Te quedaron dudas? 🤔\n\n'
          'Piensa en `final` como un tatuaje: una vez que lo tienes, no puedes cambiarlo (a menos que quieras pasar por un doloroso proceso de eliminación). En programación, `final` te permite declarar una variable que solo puede ser asignada una vez. Después de eso, su valor es inmutable.\n\n'
          'Por ejemplo, si escribes `final pi = 3.1416`, no podrás cambiar el valor de `pi` más adelante en el código. ¡Es como decirle al compilador: “Este valor es sagrado, no lo toques!” 🙏\n\n'
          'Usa `final` cuando estés seguro de que el valor no cambiará. Te ayudará a evitar errores y a mantener tu código más seguro.',
      'img_url': '',
      'code_example': '''
void main() {
  final pi = 3.1416;
  final nombre = "Alice";

 debugPrint("El valor de pi es: \$pi");
 debugPrint("Nombre: \$nombre");
}
''',
    });

    // Detalle para 'const'
    await db.insert('detail', {
      'id': 3,
      'subtopic_id': 's03t01l01', // Subtopic 'const'
      'module': 'Jr',
      'definition': 'La palabra clave `const` se utiliza para declarar una variable constante cuyo valor debe ser conocido en tiempo de compilación y no puede cambiar en tiempo de ejecución.\n\n'
          '¿Pero qué significa esto? 🤨\n\n'
          'Imaginemos que `const` es como una promesa que haces al compilador: “Este valor no cambiará nunca, y lo sabes desde el momento en que escribes el código”. A diferencia de `final`, que permite asignar un valor en tiempo de ejecución, `const` exige que el valor sea conocido en tiempo de compilación.\n\n'
          'Por ejemplo, si escribes `const pi = 3.1416`, estás diciendo: “Este valor es constante y no cambiará en ningún momento”. Si intentas cambiar `pi` más adelante, el compilador te detendrá con un error. 🚫\n\n'
          'Usa `const` para valores que sabes que nunca cambiarán, como constantes matemáticas o configuraciones fijas.',
      'img_url': '',
      'code_example': '''
void main() {
  const pi = 3.1416;
  const diasSemana = 7;

 debugPrint("El valor de pi es: \$pi");
 debugPrint("Días en una semana: \$diasSemana");
}
''',
    });

    // Detalle para 'int'
    await db.insert('detail', {
      'id': 4,
      'subtopic_id': 's04t01l01', // Subtopic 'int'
      'module': 'Jr',
      'definition':
          'El tipo `int` se utiliza para representar números enteros, es decir, números sin decimales.\n\n'
              '¿Aún no te queda claro? 🤷‍♂️\n\n'
              'Piensa en `int` como una caja donde solo puedes guardar números completos, como 1, 42 o -7. Por ejemplo, si escribes `int edad = 25`, estás declarando una variable que solo puede almacenar números enteros. Si intentas asignarle un número con decimales, como `edad = 25.5`, el compilador te dirá: “¡Eh, esto no es un entero!” 🚨\n\n'
              'Usa `int` cuando necesites trabajar con cantidades discretas, como la edad de una persona, el número de páginas de un libro o la cantidad de likes en una publicación.',
      'img_url': '',
      'code_example': '''
void main() {
  int edad = 25;
  int cantidadLikes = 100;

 debugPrint("Edad: \$edad");
 debugPrint("Likes: \$cantidadLikes");
}
''',
    });

    // Detalle para 'double'
    await db.insert('detail', {
      'id': 5,
      'subtopic_id': 's05t01l01', // Subtopic 'double'
      'module': 'Jr',
      'definition':
          'El tipo `double` se utiliza para representar números de punto flotante, es decir, números con decimales.\n\n'
              '¿Te quedaron dudas? 🤔\n\n'
              'Piensa en `double` como una caja donde puedes guardar números como 3.14, -0.5 o 42.0. Por ejemplo, si escribes `double pi = 3.1416`, estás declarando una variable que puede almacenar números con decimales. Si intentas asignarle un número entero, como `pi = 3`, el compilador lo aceptará, pero lo convertirá automáticamente a `3.0`.\n\n'
              'Usa `double` cuando necesites trabajar con cantidades precisas, como el valor de π, el precio de un producto o la temperatura de un lugar.',
      'img_url': '',
      'code_example': '''
void main() {
  double pi = 3.1416;
  double precio = 19.99;

 debugPrint("El valor de pi es: \$pi");
 debugPrint("Precio: \$precio");

  pi = 3;
}
''',
    });

    // Detalle para 'bool'
    await db.insert('detail', {
      'id': 6,
      'subtopic_id': 's06t01l01', // Subtopic 'bool'
      'module': 'Jr',
      'definition':
          'El tipo `bool` se utiliza para representar valores booleanos, que pueden ser `true` (verdadero) o `false` (falso).\n\n'
              '¿Pero qué significa esto? 🤨\n\n'
              'Piensa en `bool` como un interruptor de luz: solo tiene dos posiciones, encendido (`true`) o apagado (`false`). Por ejemplo, si escribes `bool isActive = true`, estás declarando una variable que puede ser verdadera o falsa. Esta variable es útil para tomar decisiones en tu código, como mostrar un mensaje si un usuario está activo o no.\n\n'
              'Usa `bool` cuando necesites trabajar con condiciones lógicas, como verificar si un usuario está conectado, si un número es mayor que otro o si una tarea está completada.',
      'img_url': '',
      'code_example': '''
void main() {
  bool isActive = true;
  bool isCompleted = false;

  if (isActive) {
   debugPrint("El usuario está activo.");
  } else {
   debugPrint("El usuario no está activo.");
  }
}
''',
    });

    // Detalle para 'String'
    await db.insert('detail', {
      'id': 7,
      'subtopic_id': 's07t01l01', // Subtopic 'String'
      'module': 'Jr',
      'definition':
          'El tipo `String` se utiliza para representar cadenas de texto, es decir, secuencias de caracteres.\n\n'
              '¿Aún no te queda claro? 🤷‍♂️\n\n'
              'Piensa en `String` como una caja donde puedes guardar palabras, frases o incluso párrafos completos. Por ejemplo, si escribes `String nombre = "Alice"`, estás declarando una variable que puede almacenar texto. Puedes usar `String` para almacenar nombres, mensajes, direcciones o cualquier otro tipo de información textual.\n\n'
              'Usa `String` cuando necesites trabajar con texto en tu código, como mostrar un mensaje de bienvenida, almacenar el nombre de un usuario o concatenar varias palabras.',
      'img_url': '',
      'code_example': '''
void main() {
  String nombre = "Alice";
  String mensaje = "¡Hola, mundo!";

 debugPrint("Nombre: \$nombre");
 debugPrint("Mensaje: \$mensaje");

  String saludo = "Hola, " + nombre + "!";
 debugPrint(saludo);
}
''',
    });
  }

  Future<void> _insertDetailsJrTopic2Level1(db) async {
    // Detalle para 'Listas'
    await db.insert('detail', {
      'id': 8,
      'subtopic_id': 's01t02l01', // Subtopic 'Listas'
      'module': 'Jr',
      'definition': 'Una lista en Dart es una colección ordenada de elementos que pueden ser de cualquier tipo. Puedes pensar en una lista como una fila de cajas, donde cada caja contiene un valor.\n\n'
          'Ya, pero ¿qué es una lista? 🤔\n\n'
          'Imaginemos que tienes una lista de compras. En esa lista, puedes agregar, eliminar o modificar elementos. En Dart, una lista funciona de la misma manera. Puedes agregar elementos, eliminarlos o acceder a ellos usando su posición (índice).\n\n'
          'Por ejemplo, si escribes `List<String> frutas = ["manzana", "banana"]`, estás creando una lista de cadenas de texto. Puedes acceder a los elementos usando su índice, como `frutas[0]` para obtener "manzana".\n\n'
          'Las listas son una de las estructuras de datos más comunes en programación. Úsalas cuando necesites almacenar y manipular una colección de elementos.',
      'img_url': '',
      'code_example': '''
void main() {
  List<String> frutas = ["manzana", "banana", "naranja"]; // Lista de cadenas
 debugPrint("Mi fruta favorita es: \${frutas[0]}"); // Acceso por índice

  frutas.add("uva"); // Agregar un elemento
 debugPrint("Todas las frutas: \$frutas");
}
''',
    });

    // Detalle para 'Métodos y propiedades de listas'
    await db.insert('detail', {
      'id': 9,
      'subtopic_id': 's02t02l01', // Subtopic 'Métodos y propiedades de listas'
      'module': 'Jr',
      'definition': 'Las listas en Dart tienen varios métodos y propiedades que te permiten manipular y obtener información sobre sus elementos.\n\n'
          '¿Qué puedes hacer con una lista? 🛠️\n\n'
          'Imaginemos que tienes una lista de tareas pendientes. Con los métodos y propiedades de las listas, puedes agregar tareas, eliminar las completadas, ordenarlas o incluso ver cuántas tienes. En Dart, las listas tienen métodos como `add`, `remove`, `sort` y propiedades como `length`.\n\n'
          'Por ejemplo, si escribes `frutas.length`, obtienes la cantidad de elementos en la lista. Si usas `frutas.sort()`, la lista se ordena alfabéticamente.\n\n'
          'Estos métodos y propiedades hacen que trabajar con listas sea más fácil y eficiente.',
      'img_url': '',
      'code_example': '''
void main() {
  List<String> frutas = ["manzana", "banana", "naranja"];

 debugPrint("Número de frutas: \${frutas.length}"); // Propiedad length

  frutas.add("uva"); // Método add
  frutas.remove("banana"); // Método remove
  frutas.sort(); // Método sort

 debugPrint("Frutas actualizadas: \$frutas");
}
''',
    });

    // Detalle para 'Mapas'
    await db.insert('detail', {
      'id': 10,
      'subtopic_id': 's03t02l01', // Subtopic 'Mapas'
      'module': 'Jr',
      'definition': 'Un mapa en Dart es una colección de pares clave-valor, donde cada clave es única y se asocia a un valor específico.\n\n'
          '¿Pero qué es un mapa? 🗺️\n\n'
          'Imaginemos que tienes un diccionario. Cada palabra (clave) tiene un significado (valor). En Dart, un mapa funciona de la misma manera. Puedes usar una clave para acceder a su valor correspondiente.\n\n'
          'Por ejemplo, si escribes `Map<String, int> edades = {"Alice": 25, "Bob": 30}`, estás creando un mapa donde las claves son nombres y los valores son edades. Puedes acceder a la edad de Alice usando `edades["Alice"]`.\n\n'
          'Los mapas son útiles cuando necesitas almacenar y buscar datos de manera eficiente usando claves únicas.',
      'img_url': '',
      'code_example': '''
void main() {
  Map<String, int> edades = {
    "Alice": 25,
    "Bob": 30,
  };

 debugPrint("La edad de Alice es: \${edades["Alice"]}"); // Acceso por clave

  edades["Carlos"] = 28; // Agregar un nuevo par clave-valor
 debugPrint("Todas las edades: \$edades");
}
''',
    });

    // Detalle para 'Métodos y propiedades de mapas'
    await db.insert('detail', {
      'id': 11,
      'subtopic_id': 's04t02l01', // Subtopic 'Métodos y propiedades de mapas'
      'module': 'Jr',
      'definition': 'Los mapas en Dart tienen varios métodos y propiedades que te permiten manipular y obtener información sobre sus pares clave-valor.\n\n'
          '¿Qué puedes hacer con un mapa? 🛠️\n\n'
          'Imaginemos que tienes un mapa de tesoros. Con los métodos y propiedades de los mapas, puedes agregar nuevos tesoros, eliminar los que ya encontraste o ver cuántos te faltan. En Dart, los mapas tienen métodos como `putIfAbsent`, `remove` y propiedades como `keys` y `values`.\n\n'
          'Por ejemplo, si escribes `edades.keys`, obtienes una lista de todas las claves en el mapa. Si usas `edades.remove("Alice")`, eliminas el par clave-valor asociado a "Alice".\n\n'
          'Estos métodos y propiedades hacen que trabajar con mapas sea más fácil y eficiente.',
      'img_url': '',
      'code_example': '''
void main() {
  Map<String, int> edades = {
    "Alice": 25,
    "Bob": 30,
  };

 debugPrint("Claves del mapa: \${edades.keys}"); // Propiedad keys
 debugPrint("Valores del mapa: \${edades.values}"); // Propiedad values

  edades.remove("Alice"); // Método remove
  edades.putIfAbsent("Carlos", () => 28); // Método putIfAbsent

 debugPrint("Mapa actualizado: \$edades");
}
''',
    });

    // Detalle para 'Sets'
    await db.insert('detail', {
      'id': 12,
      'subtopic_id': 's05t02l01', // Subtopic 'Sets'
      'module': 'Jr',
      'definition': 'Un set en Dart es una colección de elementos únicos, es decir, no permite duplicados.\n\n'
          'Vamos de nuevo. 🎲\n\n'
          'Imaginemos que tienes una caja de crayones. No puedes tener dos crayones del mismo color. En Dart, un set funciona de la misma manera. Solo puedes agregar elementos únicos, y si intentas agregar un duplicado, simplemente se ignora.\n\n'
          'Por ejemplo, si escribes `Set<String> colores = {"rojo", "verde", "azul"}`, estás creando un set de colores. Si intentas agregar "rojo" de nuevo, el set no cambiará.\n\n'
          'Los sets son útiles cuando necesitas asegurarte de que no haya elementos duplicados en una colección.',
      'img_url': '',
      'code_example': '''
void main() {
  Set<String> colores = {"rojo", "verde", "azul"}; // Set de colores

  colores.add("amarillo"); // Agregar un nuevo color
  colores.add("rojo"); // Intentar agregar un duplicado (no se agrega)

 debugPrint("Colores disponibles: \$colores");
}
''',
    });
  }

  Future<void> _insertDetailsJrTopic3Level1(db) async {
    // Detalle para 'Introducción a las funciones'
    await db.insert('detail', {
      'id': 13,
      'subtopic_id': 's01t03l01',
      'module': 'Jr',
      'definition': 'Una función en Dart es un bloque de código que realiza una tarea específica y puede ser reutilizado en diferentes partes de un programa.\n\n'
          '¿Pero qué es realmente una función? 🤔\n\n'
          'Imaginemos que tienes una receta de cocina. En lugar de repetir los mismos pasos cada vez que quieres cocinar, simplemente sigues la receta. En Dart, una función es como esa receta: defines una serie de pasos (código) que se ejecutan cada vez que la llamas.\n\n'
          'Por ejemplo, si escribes una función para saludar, puedes usarla cada vez que necesites mostrar un mensaje de bienvenida. Esto hace que tu código sea más organizado y fácil de mantener.\n\n'
          'Las funciones son una parte fundamental de la programación. Úsalas para dividir tu código en tareas más pequeñas y manejables.',
      'img_url': '',
      'code_example': '''
void main() {
  // Llamada a la función saludar
  saludar();
}

// Definición de la función saludar
void saludar() {
 debugPrint("¡Hola, bienvenido a RutaCode!");
}
''',
    });

    // Detalle para 'Declaración y llamada'
    await db.insert('detail', {
      'id': 14,
      'subtopic_id': 's02t03l01', // Subtopic 'Declaración y llamada'
      'module': 'Jr',
      'definition': 'Declarar una función en Dart implica definir su nombre, parámetros y el código que ejecutará. Llamar a una función significa ejecutar ese código en cualquier parte del programa.\n\n'
          '¿Cómo se declara y llama una función? 🛠️\n\n'
          'Imaginemos que tienes una máquina de café. Primero, defines cómo funciona la máquina (declaración). Luego, cada vez que quieres un café, simplemente presionas un botón (llamada). En Dart, declarar una función es como configurar la máquina, y llamarla es como presionar el botón.\n\n'
          'Por ejemplo, si declaras una función `sumar`, puedes llamarla cada vez que necesites realizar una suma. Esto evita repetir el mismo código una y otra vez.\n\n'
          'Declarar y llamar funciones es una de las habilidades más importantes en programación.',
      'img_url': '',
      'code_example': '''
void main() {
  // Llamada a la función sumar
  int resultado = sumar(5, 3);
 debugPrint("El resultado es: \$resultado");
}

// Declaración de la función sumar
int sumar(int a, int b) {
  return a + b;
}
''',
    });

    // Detalle para 'Parámetros y retorno'
    await db.insert('detail', {
      'id': 15,
      'subtopic_id': 's03t03l01', // Subtopic 'Parámetros y retorno'
      'module': 'Jr',
      'definition': 'Los parámetros son valores que se pasan a una función para que los use en su ejecución. El retorno es el valor que la función devuelve después de realizar su tarea.\n\n'
          '¿Qué son los parámetros y el retorno? 🎯\n\n'
          'Imaginemos que tienes una calculadora. Los números que ingresas son los parámetros, y el resultado que muestra es el retorno. En Dart, los parámetros son como los números que le das a la función, y el retorno es el resultado que obtienes después de ejecutarla.\n\n'
          'Por ejemplo, si escribes una función `multiplicar`, puedes pasarle dos números como parámetros y obtener su producto como retorno. Esto hace que las funciones sean flexibles y reutilizables.\n\n'
          'Los parámetros y el retorno son herramientas poderosas para crear funciones dinámicas y útiles.',
      'img_url': '',
      'code_example': '''
void main() {
  // Llamada a la función multiplicar
  int resultado = multiplicar(4, 7);
 debugPrint("El producto es: \$resultado");
}

// Declaración de la función multiplicar
int multiplicar(int a, int b) {
  return a * b;
}
''',
    });

    // Detalle para 'Funciones anónimas y lambdas'
    await db.insert('detail', {
      'id': 16,
      'subtopic_id': 's04t03l01', // Subtopic 'Funciones anónimas y lambdas'
      'module': 'Jr',
      'definition': 'Una función anónima en Dart es una función que no tiene nombre y se define directamente donde se necesita. Las lambdas son una forma abreviada de escribir funciones anónimas.\n\n'
          '¿Qué son las funciones anónimas y lambdas? 🎭\n\n'
          'Imaginemos que tienes una nota adhesiva. En lugar de escribir una receta completa, simplemente anotas los pasos clave. En Dart, una función anónima es como esa nota: no tiene un nombre formal, pero hace su trabajo en el momento.\n\n'
          'Por ejemplo, si necesitas una función rápida para sumar dos números, puedes usar una lambda como `(a, b) => a + b`. Esto es útil cuando no necesitas reutilizar la función en otro lugar.\n\n'
          'Las funciones anónimas y lambdas son ideales para tareas rápidas y específicas.',
      'img_url': '',
      'code_example': '''
void main() {
  // Uso de una función anónima
  var sumar = (int a, int b) {
    return a + b;
  };

 debugPrint("Suma: \${sumar(5, 3)}");

  // Uso de una lambda
  var multiplicar = (int a, int b) => a * b;
 debugPrint("Multiplicación: \${multiplicar(4, 7)}");
}
''',
    });
  }

  Future<void> _insertDetailsJrTopic4Level1(db) async {
    // Detalle para 'Operadores Aritméticos: +, -, *, /, %'
    await db.insert('detail', {
      'id': 17,
      'subtopic_id': 's01t04l01', // Subtopic 'Operadores Aritméticos'
      'module': 'Jr',
      'definition': 'Los operadores aritméticos en Dart se utilizan para realizar operaciones matemáticas básicas como suma, resta, multiplicación, división y módulo.\n\n'
          '¿Qué son los operadores aritméticos? 🧮\n\n'
          'Imaginemos que tienes una calculadora. Los operadores aritméticos son como los botones que usas para sumar, restar, multiplicar o dividir números. En Dart, estos operadores te permiten hacer cálculos directamente en tu código.\n\n'
          'Por ejemplo, si escribes `5 + 3`, obtienes `8`. Si usas `10 % 3`, obtienes `1` (el resto de la división). Estos operadores son fundamentales para realizar cálculos en tus programas.\n\n'
          'Los operadores aritméticos son herramientas básicas pero poderosas en programación.',
      'img_url': '',
      'code_example': '''
void main() {
  int a = 10;
  int b = 3;

 debugPrint("Suma: \${a + b}"); // 13
 debugPrint("Resta: \${a - b}"); // 7
 debugPrint("Multiplicación: \${a * b}"); // 30
 debugPrint("División: \${a / b}"); // 3.333...
 debugPrint("Módulo: \${a % b}"); // 1
}
''',
    });

    // Detalle para 'Operadores de Comparación: ==, !=, >, <, >=, <='
    await db.insert('detail', {
      'id': 18,
      'subtopic_id': 's02t04l01', // Subtopic 'Operadores de Comparación'
      'module': 'Jr',
      'definition': 'Los operadores de comparación en Dart se utilizan para comparar dos valores y devolver un resultado booleano (`true` o `false`).\n\n'
          '¿Qué son los operadores de comparación? 🔍\n\n'
          'Imaginemos que tienes una balanza. Los operadores de comparación son como las pesas que te ayudan a determinar si un lado es más pesado, más ligero o igual que el otro. En Dart, estos operadores te permiten comparar valores y tomar decisiones basadas en el resultado.\n\n'
          'Por ejemplo, si escribes `5 > 3`, obtienes `true`. Si usas `10 == 10`, también obtienes `true`. Estos operadores son esenciales para controlar el flujo de tu programa.\n\n'
          'Los operadores de comparación son clave para tomar decisiones en tu código.',
      'img_url': '',
      'code_example': '''
void main() {
  int a = 10;
  int b = 3;

 debugPrint("¿a es igual a b? \${a == b}"); // false
 debugPrint("¿a es diferente de b? \${a != b}"); // true
 debugPrint("¿a es mayor que b? \${a > b}"); // true
 debugPrint("¿a es menor que b? \${a < b}"); // false
 debugPrint("¿a es mayor o igual que b? \${a >= b}"); // true
 debugPrint("¿a es menor o igual que b? \${a <= b}"); // false
}
''',
    });

    // Detalle para 'Operadores Lógicos: &&, ||, !'
    await db.insert('detail', {
      'id': 19,
      'subtopic_id': 's03t04l01', // Subtopic 'Operadores Lógicos'
      'module': 'Jr',
      'definition': 'Los operadores lógicos en Dart se utilizan para combinar o invertir expresiones booleanas. Los principales son `&&` (AND), `||` (OR) y `!` (NOT).\n\n'
          '¿Qué son los operadores lógicos? 🧠\n\n'
          'Imaginemos que tienes dos interruptores de luz. El operador `&&` (AND) enciende la luz solo si ambos interruptores están activados. El operador `||` (OR) enciende la luz si al menos uno está activado. El operador `!` (NOT) invierte el estado: si la luz está encendida, la apaga, y viceversa.\n\n'
          'Por ejemplo, si escribes `true && false`, obtienes `false`. Si usas `true || false`, obtienes `true`. Estos operadores son esenciales para crear condiciones complejas en tu código.\n\n'
          'Los operadores lógicos te permiten tomar decisiones más sofisticadas en tus programas.',
      'img_url': '',
      'code_example': '''
void main() {
  bool a = true;
  bool b = false;

 debugPrint("AND: \${a && b}"); // false
 debugPrint("OR: \${a || b}"); // true
 debugPrint("NOT: \${!a}"); // false
}
''',
    });
  }

  Future<void> _insertDetailsJrTopic5Level1(db) async {
    // Detalle para 'if'
    await db.insert('detail', {
      'id': 20,
      'subtopic_id': 's01t05l01', // Subtopic 'if'
      'module': 'Jr',
      'definition': 'La sentencia `if` en Dart se utiliza para ejecutar un bloque de código solo si una condición es verdadera (`true`).\n\n'
          '¿Qué es un `if`? 🤔\n\n'
          'Imaginemos que tienes un semáforo. Si la luz está en verde (`true`), puedes cruzar la calle. Si está en rojo (`false`), debes detenerte. En Dart, el `if` funciona de la misma manera: ejecuta un bloque de código solo si la condición es verdadera.\n\n'
          'Por ejemplo, si escribes `if (edad >= 18) {debugPrint("Eres mayor de edad"); }`, el mensaje se mostrará solo si la condición `edad >= 18` es verdadera.\n\n'
          'El `if` es una de las estructuras de control más básicas y esenciales en programación.',
      'img_url': '',
      'code_example': '''
void main() {
  int edad = 20;

  if (edad >= 18) {
   debugPrint("Eres mayor de edad");
  }
}
''',
    });

    // Detalle para 'else'
    await db.insert('detail', {
      'id': 21,
      'subtopic_id': 's02t05l01', // Subtopic 'else'
      'module': 'Jr',
      'definition':
          'La sentencia `else` en Dart se utiliza junto con `if` para ejecutar un bloque de código cuando la condición del `if` es falsa (`false`).\n\n'
              '¿Qué es un `else`? 🤷‍♂️\n\n'
              'Imaginemos que el semáforo está en rojo. Si no puedes cruzar (`if` es falso), entonces debes esperar (`else`). En Dart, el `else` te permite definir qué hacer cuando la condición del `if` no se cumple.\n\n'
              'Por ejemplo, si escribes `if (edad >= 18) {debugPrint("Eres mayor de edad"); } else {debugPrint("Eres menor de edad"); }`, el mensaje "Eres menor de edad" se mostrará si la condición `edad >= 18` es falsa.\n\n'
              'El `else` es útil para manejar casos alternativos en tu código.',
      'img_url': '',
      'code_example': '''
void main() {
  int edad = 15;

  if (edad >= 18) {
   debugPrint("Eres mayor de edad");
  } else {
   debugPrint("Eres menor de edad");
  }
}
''',
    });

    // Detalle para 'else if'
    await db.insert('detail', {
      'id': 22,
      'subtopic_id': 's03t05l01', // Subtopic 'else if'
      'module': 'Jr',
      'definition': 'La sentencia `else if` en Dart se utiliza para verificar múltiples condiciones en secuencia después de un `if`.\n\n'
          '¿Qué es un `else if`? 🤨\n\n'
          'Imaginemos que tienes un semáforo con tres luces: verde, amarillo y rojo. Si no es verde (`if` es falso), verificas si es amarillo (`else if`). Si tampoco es amarillo, entonces es rojo (`else`). En Dart, el `else if` te permite manejar múltiples condiciones de manera ordenada.\n\n'
          'Por ejemplo, si escribes `if (nota >= 90) {debugPrint("Excelente"); } else if (nota >= 70) {debugPrint("Aprobado"); } else {debugPrint("Reprobado"); }`, el programa evaluará cada condición en orden.\n\n'
          'El `else if` es ideal para manejar decisiones más complejas en tu código.',
      'img_url': '',
      'code_example': '''
void main() {
  int nota = 85;

  if (nota >= 90) {
   debugPrint("Excelente");
  } else if (nota >= 70) {
   debugPrint("Aprobado");
  } else {
   debugPrint("Reprobado");
  }
}
''',
    });

    // Detalle para 'for'
    await db.insert('detail', {
      'id': 23,
      'subtopic_id': 's04t05l01', // Subtopic 'for'
      'module': 'Jr',
      'definition': 'El bucle `for` en Dart se utiliza para repetir un bloque de código un número específico de veces.\n\n'
          '¿Qué es un `for`? 🔄\n\n'
          'Imaginemos que tienes una lista de tareas y quieres hacer cada una de ellas en orden. El bucle `for` es como un asistente que recorre la lista y realiza cada tarea por ti. En Dart, el `for` te permite repetir un bloque de código mientras una condición sea verdadera.\n\n'
          'Por ejemplo, si escribes `for (int i = 0; i < 5; i++) {debugPrint("Iteración \$i"); }`, el mensaje se mostrará 5 veces, una por cada iteración del bucle.\n\n'
          'El `for` es una herramienta poderosa para automatizar tareas repetitivas.',
      'img_url': '',
      'code_example': '''
void main() {
  for (int i = 0; i < 5; i++) {
   debugPrint("Iteración \$i");
  }
}
''',
    });

    // Detalle para 'while'
    await db.insert('detail', {
      'id': 24,
      'subtopic_id': 's05t05l01', // Subtopic 'while'
      'module': 'Jr',
      'definition': 'El bucle `while` en Dart se utiliza para repetir un bloque de código mientras una condición sea verdadera (`true`).\n\n'
          '¿Qué es un `while`? 🔄\n\n'
          'Imaginemos que estás lavando platos. Mientras haya platos sucios (`condición verdadera`), sigues lavando. En Dart, el `while` funciona de la misma manera: repite un bloque de código mientras la condición sea verdadera.\n\n'
          'Por ejemplo, si escribes `while (contador < 5) {debugPrint("Contador: \$contador"); contador++; }`, el mensaje se mostrará hasta que `contador` sea 5.\n\n'
          'El `while` es útil cuando no sabes cuántas veces necesitas repetir una tarea.',
      'img_url': '',
      'code_example': '''
void main() {
  int contador = 0;

  while (contador < 5) {
   debugPrint("Contador: \$contador");
    contador++;
  }
}
''',
    });

    // Detalle para 'do-while'
    await db.insert('detail', {
      'id': 25,
      'subtopic_id': 's06t05l01', // Subtopic 'do-while'
      'module': 'Jr',
      'definition': 'El bucle `do-while` en Dart es similar al `while`, pero garantiza que el bloque de código se ejecute al menos una vez, incluso si la condición es falsa.\n\n'
          '¿Qué es un `do-while`? 🔄\n\n'
          'Imaginemos que estás probando un nuevo plato. Primero lo cocinas (`hacer`), y luego decides si te gusta (`condición`). En Dart, el `do-while` funciona de la misma manera: ejecuta el bloque de código al menos una vez y luego verifica la condición.\n\n'
          'Por ejemplo, si escribes `do {debugPrint("Contador: \$contador"); contador++; } while (contador < 5);`, el mensaje se mostrará al menos una vez, incluso si `contador` ya es 5.\n\n'
          'El `do-while` es útil cuando necesitas ejecutar un bloque de código al menos una vez antes de verificar la condición.',
      'img_url': '',
      'code_example': '''
void main() {
  int contador = 0;

  do {
   debugPrint("Contador: \$contador");
    contador++;
  } while (contador < 5);
}
''',
    });

    // Detalle para 'switch case'
    await db.insert('detail', {
      'id': 26,
      'subtopic_id': 's07t05l01', // Subtopic 'switch case'
      'module': 'Jr',
      'definition': 'La sentencia `switch case` en Dart se utiliza para ejecutar diferentes bloques de código dependiendo del valor de una variable.\n\n'
          '¿Qué es un `switch case`? 🎚️\n\n'
          'Imaginemos que tienes un menú de opciones. Dependiendo de la opción que elijas, se ejecuta una acción diferente. En Dart, el `switch case` funciona de la misma manera: evalúa el valor de una variable y ejecuta el bloque de código correspondiente.\n\n'
          'Por ejemplo, si escribes `switch (dia) { case 1:debugPrint("Lunes"); break; case 2:debugPrint("Martes"); break; }`, el programa mostrará el nombre del día correspondiente al valor de `dia`.\n\n'
          'El `switch case` es ideal para manejar múltiples casos de manera organizada.',
      'img_url': '',
      'code_example': '''
void main() {
  int dia = 2;

  switch (dia) {
    case 1:
     debugPrint("Lunes");
      break;
    case 2:
     debugPrint("Martes");
      break;
    default:
     debugPrint("Día no válido");
  }
}
''',
    });
  }

  Future<void> insertDetailsJrLevel2(Database db) async {
    try {
      await _insertDetailsJrTopic1Level2(db);
      await _insertDetailsJrTopic2Level2(db);
      await _insertDetailsJrTopic3Level2(db);
      await _insertDetailsJrTopic4Level2(db);
    } catch (e) {
      debugPrint("Error inserting details jr level 2: $e");
    }
  }

  Future<void> _insertDetailsJrTopic1Level2(db) async {
    // Detalle para 'Instalación de Flutter CLI'
    await db.insert('detail', {
      'id': 27,
      'subtopic_id': 's01t01l02', // Subtopic 'Instalación de Flutter CLI'
      'module': 'Jr',
      'definition': 'La instalación de Flutter CLI es el primer paso para comenzar a desarrollar aplicaciones con Flutter. La CLI (Command Line Interface) es una herramienta que te permite interactuar con Flutter desde la terminal o consola.\n\n'
          '¿Por qué es importante instalar Flutter CLI? 🛠️\n\n'
          'Flutter CLI es esencial porque te permite realizar tareas como crear proyectos, ejecutar aplicaciones, gestionar dependencias y mucho más, directamente desde la terminal. Sin la CLI, no podrías aprovechar todas las funcionalidades que Flutter ofrece.\n\n'
          'Además, la CLI es obligatoria porque es la forma oficial de interactuar con Flutter. Aunque existen IDEs como Android Studio o VS Code que facilitan el desarrollo, en el fondo, estos entornos utilizan la CLI para ejecutar comandos.\n\n'
          'Instalar Flutter CLI es el primer paso para convertirte en un desarrollador Flutter profesional.',
      'img_url': '',
      'code_example': '''
# Ejemplo de instalación de Flutter CLI en Linux/macOS:
# 1. Descarga Flutter desde https://flutter.dev
# 2. Extrae el archivo en una ubicación de tu preferencia.
# 3. Agrega Flutter a tu PATH:
export PATH="\$PATH:`pwd`/flutter/bin"

# Verifica la instalación:
flutter --version
''',
    });

    // Detalle para 'Comandos básicos de Flutter CLI'
    await db.insert('detail', {
      'id': 28,
      'subtopic_id': 's02t01l02', // Subtopic 'Comandos básicos de Flutter CLI'
      'module': 'Jr',
      'definition': 'Los comandos básicos de Flutter CLI son herramientas esenciales para gestionar y desarrollar aplicaciones Flutter de manera eficiente.\n\n'
          '¿Por qué son importantes estos comandos? 🚀\n\n'
          'Los comandos de Flutter CLI te permiten realizar tareas comunes como crear proyectos, ejecutar aplicaciones en diferentes dispositivos, gestionar dependencias y mucho más. Dominar estos comandos te hará más productivo y te permitirá trabajar de manera más profesional.\n\n'
          'Algunos comandos básicos incluyen:\n'
          '- `flutter create`: Crea un nuevo proyecto Flutter.\n'
          '- `flutter run`: Ejecuta la aplicación en un dispositivo conectado o emulador.\n'
          '- `flutter pub get`: Obtiene las dependencias del proyecto.\n\n'
          'Estos comandos son la base para trabajar con Flutter desde la terminal.',
      'img_url': '',
      'code_example': '''
# Crear un nuevo proyecto Flutter
flutter create mi_proyecto

# Navegar al directorio del proyecto
cd mi_proyecto

# Ejecutar la aplicación en un dispositivo conectado
flutter run

# Obtener dependencias del proyecto
flutter pub get
''',
    });

    // Detalle para 'Creación de un proyecto Flutter desde la CLI'
    await db.insert('detail', {
      'id': 29,
      'subtopic_id':
          's03t01l02', // Subtopic 'Creación de un proyecto Flutter desde la CLI'
      'module': 'Jr',
      'definition': 'Crear un proyecto Flutter desde la CLI es el primer paso para comenzar a desarrollar una aplicación. Este proceso genera la estructura básica del proyecto, incluyendo archivos y carpetas esenciales.\n\n'
          '¿Por qué es importante crear un proyecto desde la CLI? 🏗️\n\n'
          'Crear un proyecto desde la CLI te da control total sobre la configuración inicial de tu aplicación. Además, es la forma más rápida y eficiente de empezar un nuevo proyecto, ya que la CLI genera automáticamente todo lo que necesitas para comenzar a codificar.\n\n'
          'El comando `flutter create` no solo crea la estructura del proyecto, sino que también configura el entorno de desarrollo con las dependencias y archivos necesarios. Esto te ahorra tiempo y te permite enfocarte en lo más importante: desarrollar tu aplicación.\n\n'
          'Crear un proyecto desde la CLI es una habilidad fundamental para cualquier desarrollador Flutter.',
      'img_url': '',
      'code_example': '''
# Crear un nuevo proyecto Flutter
flutter create mi_app

# Navegar al directorio del proyecto
cd mi_app

# Ejecutar la aplicación
flutter run
''',
    });
  }

  Future<void> _insertDetailsJrTopic2Level2(db) async {
    // Detalle para 'Configuración de VS Code para Flutter'
    await db.insert('detail', {
      'id': 30,
      'subtopic_id':
          's01t02l02', // Subtopic 'Configuración de VS Code para Flutter'
      'module': 'Jr',
      'definition': 'Configurar Visual Studio Code (VS Code) para Flutter es esencial para tener un entorno de desarrollo eficiente y productivo. VS Code es uno de los editores de código más populares para desarrollar aplicaciones Flutter.\n\n'
          '¿Por qué es importante configurar VS Code para Flutter? 🛠️\n\n'
          'VS Code es ligero, personalizable y tiene un excelente soporte para Flutter. Al configurarlo correctamente, obtienes características como resaltado de sintaxis, autocompletado, depuración integrada y acceso rápido a los comandos de Flutter.\n\n'
          'Además, VS Code es compatible con extensiones que mejoran aún más tu experiencia de desarrollo. Una configuración adecuada te ahorra tiempo y te permite enfocarte en escribir código en lugar de lidiar con problemas del entorno.\n\n'
          'Configurar VS Code para Flutter es un paso clave para ser más productivo.',
      'img_url': '',
      'code_example': '''
# Pasos básicos para configurar VS Code para Flutter:
1. Instala VS Code desde https://code.visualstudio.com.
2. Abre VS Code y ve a la pestaña de extensiones (Ctrl+Shift+X).
3. Busca e instala la extensión "Flutter".
4. Reinicia VS Code para aplicar los cambios.
''',
    });

    // Detalle para 'Extensiones recomendadas para Flutter'
    await db.insert('detail', {
      'id': 31,
      'subtopic_id':
          's02t02l02', // Subtopic 'Extensiones recomendadas para Flutter'
      'module': 'Jr',
      'definition': 'Las extensiones de VS Code son herramientas que mejoran tu experiencia de desarrollo con Flutter. Algunas extensiones son esenciales para aumentar tu productividad y aprovechar al máximo el editor.\n\n'
          '¿Por qué son importantes las extensiones? 🚀\n\n'
          'Las extensiones te permiten agregar funcionalidades adicionales a VS Code, como soporte para Dart, formateo automático de código, integración con Git y herramientas de depuración avanzadas. Estas herramientas te ayudan a escribir código más rápido, detectar errores con facilidad y mantener un código limpio y organizado.\n\n'
          'Algunas extensiones recomendadas para Flutter son:\n'
          '- **Flutter**: Soporte oficial para Flutter y Dart.\n'
          '- **Dart**: Resaltado de sintaxis y autocompletado para Dart.\n'
          '- **Pubspec Assist**: Facilita la gestión de dependencias en el archivo `pubspec.yaml`.\n\n'
          'Instalar las extensiones correctas puede marcar la diferencia en tu flujo de trabajo.',
      'img_url': '',
      'code_example': '''
# Extensiones recomendadas para Flutter en VS Code:
1. Flutter (extensión oficial)
2. Dart
3. Pubspec Assist
4. Error Lens (resalta errores directamente en el código)
5. Bracket Pair Colorizer (colorea los pares de corchetes para mejor legibilidad)
''',
    });

    // Detalle para 'Depuración de código en VS Code'
    await db.insert('detail', {
      'id': 32,
      'subtopic_id': 's03t02l02', // Subtopic 'Depuración de código en VS Code'
      'module': 'Jr',
      'definition': 'La depuración de código en VS Code es una de las características más poderosas para identificar y corregir errores en tu aplicación Flutter. VS Code ofrece herramientas integradas para depurar tu código de manera eficiente.\n\n'
          '¿Por qué es importante la depuración en VS Code? 🔍\n\n'
          'La depuración te permite ejecutar tu aplicación paso a paso, inspeccionar variables, ver el flujo de ejecución y detectar errores en tiempo real. Con VS Code, puedes configurar puntos de interrupción (breakpoints), inspeccionar el estado de tu aplicación y corregir problemas de manera rápida y efectiva.\n\n'
          'Además, VS Code se integra perfectamente con Flutter, lo que te permite depurar tanto en dispositivos físicos como en emuladores. Esto es esencial para garantizar que tu aplicación funcione correctamente en diferentes entornos.\n\n'
          'Dominar la depuración en VS Code es una habilidad clave para cualquier desarrollador Flutter.',
      'img_url': '',
      'code_example': '''
# Pasos para depurar en VS Code:
1. Abre tu proyecto Flutter en VS Code.
2. Establece puntos de interrupción (breakpoints) haciendo clic en el margen izquierdo del editor.
3. Presiona F5 o selecciona "Run > Start Debugging" para iniciar la depuración.
4. Usa la barra de herramientas de depuración para:
   - Continuar la ejecución (F5).
   - Ejecutar paso a paso (F10).
   - Inspeccionar variables en la sección "Variables".
''',
    });
  }

  Future<void> _insertDetailsJrTopic3Level2(db) async {
    // Detalle para 'Configuración de Android Studio para Flutter'
    await db.insert('detail', {
      'id': 33,
      'subtopic_id':
          's01t03l02', // Subtopic 'Configuración de Android Studio para Flutter'
      'module': 'Jr',
      'definition': 'Configurar Android Studio para Flutter es esencial si prefieres un entorno de desarrollo más robusto y especializado en aplicaciones móviles. Android Studio es el IDE oficial para el desarrollo de Android y tiene un excelente soporte para Flutter.\n\n'
          '¿Por qué es importante configurar Android Studio para Flutter? 🛠️\n\n'
          'Android Studio ofrece herramientas avanzadas como un editor de código inteligente, un emulador de dispositivos integrado, y soporte para depuración y pruebas. Además, es compatible con plugins de Flutter y Dart, lo que lo convierte en una opción poderosa para desarrollar aplicaciones multiplataforma.\n\n'
          'Configurar Android Studio correctamente te permite aprovechar al máximo sus características, como el diseño visual de interfaces, la gestión de dependencias y la integración con herramientas de desarrollo avanzadas.\n\n'
          'Configurar Android Studio para Flutter es un paso clave para desarrolladores que buscan un entorno profesional.',
      'img_url': '',
      'code_example': '''
# Pasos básicos para configurar Android Studio para Flutter:
1. Descarga e instala Android Studio desde https://developer.android.com/studio.
2. Abre Android Studio y ve a "Plugins" en la configuración.
3. Busca e instala los plugins "Flutter" y "Dart".
4. Reinicia Android Studio para aplicar los cambios.
5. Configura el SDK de Flutter en "File > Settings > Languages & Frameworks > Flutter".
''',
    });

    // Detalle para 'Uso del emulador en Android Studio'
    await db.insert('detail', {
      'id': 34,
      'subtopic_id':
          's02t03l02', // Subtopic 'Uso del emulador en Android Studio'
      'module': 'Jr',
      'definition': 'El emulador de Android Studio es una herramienta poderosa para probar tus aplicaciones Flutter en diferentes dispositivos virtuales sin necesidad de hardware físico.\n\n'
          '¿Por qué es importante el emulador? 📱\n\n'
          'El emulador te permite simular diferentes dispositivos Android con varias configuraciones de pantalla, versiones del sistema operativo y hardware. Esto es esencial para asegurarte de que tu aplicación funcione correctamente en una amplia gama de dispositivos.\n\n'
          'Además, el emulador se integra perfectamente con Android Studio, lo que te permite depurar y probar tu aplicación en tiempo real. Puedes simular interacciones táctiles, rotaciones de pantalla, llamadas telefónicas y más.\n\n'
          'Dominar el uso del emulador es fundamental para garantizar la calidad de tu aplicación.',
      'img_url': '',
      'code_example': '''
# Pasos para usar el emulador en Android Studio:
1. Abre Android Studio y ve a "Tools > Device Manager".
2. Crea un nuevo dispositivo virtual (AVD) seleccionando un dispositivo y una imagen del sistema.
3. Inicia el emulador desde el Device Manager.
4. Ejecuta tu aplicación Flutter seleccionando el emulador como dispositivo de destino.
''',
    });

    // Detalle para 'Integración con herramientas de desarrollo'
    await db.insert('detail', {
      'id': 35,
      'subtopic_id':
          's03t03l02', // Subtopic 'Integración con herramientas de desarrollo'
      'module': 'Jr',
      'definition': 'Android Studio se integra con una variedad de herramientas de desarrollo que mejoran tu flujo de trabajo y te ayudan a crear aplicaciones Flutter de alta calidad.\n\n'
          '¿Por qué es importante la integración con herramientas de desarrollo? 🚀\n\n'
          'La integración con herramientas como el SDK de Android, Gradle, y los plugins de Flutter y Dart te permite gestionar dependencias, construir y depurar tu aplicación, y realizar pruebas de manera eficiente. Además, Android Studio ofrece soporte para Git, lo que facilita el control de versiones de tu código.\n\n'
          'Otras herramientas integradas incluyen el profiler para analizar el rendimiento de tu aplicación, el diseñador de interfaces para crear layouts visualmente, y el asistente de pruebas para ejecutar pruebas unitarias y de interfaz.\n\n'
          'Aprovechar estas herramientas te permite ser más productivo y mantener un código de alta calidad.',
      'img_url': '',
      'code_example': '''
# Herramientas integradas en Android Studio:
1. **SDK Manager**: Para gestionar versiones del SDK de Android.
2. **Gradle**: Para construir y gestionar dependencias del proyecto.
3. **Flutter y Dart plugins**: Para soporte avanzado de Flutter y Dart.
4. **Git Integration**: Para control de versiones.
5. **Profiler**: Para analizar el rendimiento de la aplicación.
6. **Layout Editor**: Para diseñar interfaces de usuario visualmente.
''',
    });
  }

  Future<void> _insertDetailsJrTopic4Level2(db) async {
    // Detalle para 'Configuración de IntelliJ IDEA para Flutter'
    await db.insert('detail', {
      'id': 36,
      'subtopic_id':
          's01t04l02', // Subtopic 'Configuración de IntelliJ IDEA para Flutter'
      'module': 'Jr',
      'definition': 'Configurar IntelliJ IDEA para Flutter es una excelente opción si prefieres un entorno de desarrollo robusto y altamente personalizable. IntelliJ IDEA es un IDE potente que ofrece soporte nativo para Flutter y Dart.\n\n'
          '¿Por qué es importante configurar IntelliJ IDEA para Flutter? 🛠️\n\n'
          'IntelliJ IDEA es conocido por su inteligencia de código avanzada, herramientas de refactorización y soporte para múltiples lenguajes de programación. Al configurarlo para Flutter, obtienes características como autocompletado inteligente, resaltado de sintaxis, y herramientas de depuración integradas.\n\n'
          'Además, IntelliJ IDEA es compatible con plugins de Flutter y Dart, lo que lo convierte en una opción poderosa para desarrolladores que buscan un entorno profesional y altamente personalizable.\n\n'
          'Configurar IntelliJ IDEA para Flutter es ideal para quienes buscan un IDE completo y avanzado.',
      'img_url': '',
      'code_example': '''
# Pasos básicos para configurar IntelliJ IDEA para Flutter:
1. Descarga e instala IntelliJ IDEA desde https://www.jetbrains.com/idea.
2. Abre IntelliJ IDEA y ve a "Plugins" en la configuración.
3. Busca e instala los plugins "Flutter" y "Dart".
4. Reinicia IntelliJ IDEA para aplicar los cambios.
5. Configura el SDK de Flutter en "File > Settings > Languages & Frameworks > Flutter".
''',
    });

    // Detalle para 'Comparación entre IntelliJ IDEA y VS Code'
    await db.insert('detail', {
      'id': 37,
      'subtopic_id':
          's02t04l02', // Subtopic 'Comparación entre IntelliJ IDEA y VS Code'
      'module': 'Jr',
      'definition': 'IntelliJ IDEA y VS Code son dos de los entornos de desarrollo más populares para Flutter, pero cada uno tiene sus propias ventajas y desventajas.\n\n'
          '¿Cuál es la diferencia entre IntelliJ IDEA y VS Code? 🤔\n\n'
          '- **IntelliJ IDEA**: Es un IDE completo y robusto, ideal para desarrolladores que buscan herramientas avanzadas como refactorización inteligente, integración profunda con herramientas de desarrollo y soporte para múltiples lenguajes. Sin embargo, puede ser más pesado y consumir más recursos.\n\n'
          '- **VS Code**: Es un editor de código ligero y altamente personalizable, perfecto para desarrolladores que prefieren un entorno más simple y rápido. Tiene un excelente soporte para Flutter a través de extensiones, pero carece de algunas características avanzadas de IntelliJ IDEA.\n\n'
          'La elección entre IntelliJ IDEA y VS Code depende de tus necesidades y preferencias personales. Ambos son excelentes opciones para desarrollar aplicaciones Flutter.',
      'img_url': '',
      'code_example': '''
# Comparación rápida:
- **IntelliJ IDEA**: IDE completo, herramientas avanzadas, más pesado.
- **VS Code**: Editor ligero, personalizable, más rápido.
''',
    });

    // Detalle para 'Depuración en IntelliJ IDEA'
    await db.insert('detail', {
      'id': 38,
      'subtopic_id': 's03t04l02', // Subtopic 'Depuración en IntelliJ IDEA'
      'module': 'Jr',
      'definition': 'La depuración en IntelliJ IDEA es una de las características más poderosas para identificar y corregir errores en tu aplicación Flutter. IntelliJ IDEA ofrece herramientas avanzadas de depuración que te permiten inspeccionar el estado de tu aplicación en tiempo real.\n\n'
          '¿Por qué es importante la depuración en IntelliJ IDEA? 🔍\n\n'
          'IntelliJ IDEA te permite establecer puntos de interrupción (breakpoints), inspeccionar variables, ver el flujo de ejecución y corregir errores de manera eficiente. Además, se integra perfectamente con Flutter, lo que te permite depurar tanto en dispositivos físicos como en emuladores.\n\n'
          'Otras características incluyen la capacidad de evaluar expresiones durante la depuración, inspeccionar el estado de los widgets en aplicaciones Flutter, y realizar pruebas unitarias y de interfaz directamente desde el IDE.\n\n'
          'Dominar la depuración en IntelliJ IDEA es esencial para garantizar la calidad de tu aplicación.',
      'img_url': '',
      'code_example': '''
# Pasos para depurar en IntelliJ IDEA:
1. Abre tu proyecto Flutter en IntelliJ IDEA.
2. Establece puntos de interrupción (breakpoints) haciendo clic en el margen izquierdo del editor.
3. Presiona "Debug" o selecciona "Run > Debug" para iniciar la depuración.
4. Usa la barra de herramientas de depuración para:
   - Continuar la ejecución (F9).
   - Ejecutar paso a paso (F8).
   - Inspeccionar variables en la sección "Variables".
''',
    });
  }

  Future<void> insertDetailsJrLevel3(Database db) async {
    try {
      await _insertDetailsJrTopic1Level3(db);
      await _insertDetailsJrTopic2Level3(db);
      await _insertDetailsJrTopic3Level3(db);
      await _insertDetailsJrTopic4Level3(db);
      await _insertDetailsJrTopic5Level3(db);
      await _insertDetailsJrTopic6Level3(db);
    } catch (e) {
      debugPrint("Error inserting details jr level 3: $e");
    }
  }

  Future<void> _insertDetailsJrTopic1Level3(db) async {
    // Detalle para 'Introducción a los widgets heredados'
    await db.insert('detail', {
      'id': 39,
      'subtopic_id':
          's01t01l03', // Subtopic 'Introducción a los widgets heredados'
      'module': 'Jr',
      'definition': 'Los widgets heredados en Flutter son aquellos que formaron parte de las primeras versiones del framework y que aún están disponibles para su uso. Estos widgets son la base sobre la cual se construyeron los widgets modernos.\n\n'
          '¿Qué son los widgets heredados? 🕰️\n\n'
          'Los widgets heredados, como `Center`, `Padding`, y `Container`, son componentes básicos que permiten construir interfaces de usuario en Flutter. Aunque siguen siendo útiles, muchos de ellos han sido reemplazados o mejorados por widgets más modernos y eficientes.\n\n'
          'Estos widgets son ideales para entender los fundamentos de Flutter y cómo se construyen las interfaces. Sin embargo, es recomendable familiarizarse también con los widgets modernos para aprovechar al máximo las capacidades del framework.\n\n'
          'Los widgets heredados son una parte importante de la historia de Flutter y siguen siendo relevantes en ciertos contextos.',
      'img_url': '',
      'code_example': '''
// Ejemplo de un widget heredado: Center
Center(
  child: Text("Hola, mundo"),
)
''',
    });

    // Detalle para 'Uso de widgets heredados en Flutter'
    await db.insert('detail', {
      'id': 40,
      'subtopic_id':
          's02t01l03', // Subtopic 'Uso de widgets heredados en Flutter'
      'module': 'Jr',
      'definition': 'Los widgets heredados en Flutter, como `Center`, `Padding`, y `Container`, se utilizan para construir interfaces de usuario de manera sencilla y eficiente. Aunque son básicos, siguen siendo útiles en muchos escenarios.\n\n'
          '¿Cómo se usan los widgets heredados? 🛠️\n\n'
          'Los widgets heredados se utilizan de la misma manera que los widgets modernos: se colocan en el árbol de widgets y se personalizan con propiedades como `child`, `padding`, o `color`. Por ejemplo, el widget `Center` se usa para centrar un widget hijo en su contenedor, mientras que `Padding` agrega espacio alrededor de un widget.\n\n'
          'Aunque los widgets heredados son fáciles de usar, es importante recordar que los widgets modernos ofrecen más funcionalidades y mejor rendimiento. Sin embargo, los widgets heredados son una excelente opción para proyectos simples o para aprender los fundamentos de Flutter.\n\n'
          'El uso de widgets heredados es una habilidad básica pero importante en Flutter.',
      'img_url': '',
      'code_example': '''
// Ejemplo de uso de widgets heredados
Container(
  color: Colors.blue,
  padding: EdgeInsets.all(16.0),
  child: Center(
    child: Text("Hola, mundo", style: TextStyle(color: Colors.white)),
  ),
)
''',
    });

    // Detalle para 'Diferencias entre widgets heredados y modernos'
    await db.insert('detail', {
      'id': 41,
      'subtopic_id':
          's03t01l03', // Subtopic 'Diferencias entre widgets heredados y modernos'
      'module': 'Jr',
      'definition': 'Los widgets heredados y modernos en Flutter tienen diferencias clave en términos de funcionalidad, rendimiento y flexibilidad. Aunque los widgets heredados son más simples, los widgets modernos ofrecen más características y mejor optimización.\n\n'
          '¿Cuáles son las diferencias principales? 🤔\n\n'
          '- **Funcionalidad**: Los widgets modernos, como `Flex`, `Stack`, y `ListView`, ofrecen más opciones de personalización y manejo de layouts complejos.\n'
          '- **Rendimiento**: Los widgets modernos están optimizados para mejorar el rendimiento y reducir el consumo de recursos.\n'
          '- **Flexibilidad**: Los widgets modernos permiten una mayor flexibilidad en el diseño y la interacción, como el soporte para animaciones y efectos avanzados.\n\n'
          'Aunque los widgets heredados son útiles para proyectos simples o para aprender, los widgets modernos son la mejor opción para aplicaciones complejas y de alto rendimiento.',
      'img_url': '',
      'code_example': '''
// Ejemplo de un widget moderno: Column
Column(
  children: [
    Text("Elemento 1"),
    Text("Elemento 2"),
    Text("Elemento 3"),
  ],
)

// Ejemplo de un widget heredado: Center
Center(
  child: Text("Hola, mundo"),
)
''',
    });
  }

  Future<void> _insertDetailsJrTopic2Level3(db) async {
    // Detalle para 'Creación de widgets Stateless'
    await db.insert('detail', {
      'id': 42,
      'subtopic_id': 's01t02l03',
      'module': 'Jr',
      'definition': 'Un widget Stateless en Flutter es un componente de interfaz de usuario que no mantiene ningún estado interno. Esto significa que su apariencia y comportamiento no cambian a lo largo de su ciclo de vida.\n\n'
          '¿Cómo se crea un widget Stateless? 🛠️\n\n'
          'Para crear un widget Stateless, debes extender la clase `StatelessWidget` y sobrescribir el método `build`. Este método define cómo se debe construir la interfaz del widget. Los widgets Stateless son ideales para componentes que no necesitan cambiar dinámicamente, como textos, iconos o contenedores estáticos.\n\n'
          'Por ejemplo, si creas un widget `MiTexto`, este podría mostrar un mensaje fijo que no cambia durante la ejecución de la aplicación.\n\n'
          'Crear widgets Stateless es una habilidad fundamental en Flutter, ya que son la base para construir interfaces simples y eficientes.',
      'img_url': '',
      'code_example': '''
// Ejemplo de un widget Stateless
class MiTexto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Hola, mundo");
  }
}
''',
    });

    // Detalle para 'Uso de widgets Stateless en interfaces'
    await db.insert('detail', {
      'id': 43,
      'subtopic_id': 's02t02l03',
      'module': 'Jr',
      'definition': 'Los widgets Stateless se utilizan ampliamente en Flutter para construir interfaces de usuario que no requieren cambios dinámicos. Son componentes ligeros y eficientes que se pueden combinar para crear layouts complejos.\n\n'
          '¿Cómo se usan los widgets Stateless en interfaces? 🖼️\n\n'
          'Los widgets Stateless se colocan en el árbol de widgets y se personalizan con propiedades como `child`, `color`, o `padding`. Por ejemplo, puedes usar un `Text` para mostrar un mensaje, un `Icon` para mostrar un ícono, o un `Container` para agrupar otros widgets.\n\n'
          'Estos widgets son ideales para componentes estáticos, como encabezados, pies de página, o elementos de lista que no cambian durante la ejecución de la aplicación.\n\n'
          'El uso de widgets Stateless es esencial para construir interfaces eficientes y fáciles de mantener.',
      'img_url': '',
      'code_example': '''
// Ejemplo de uso de widgets Stateless en una interfaz
Scaffold(
  appBar: AppBar(
    title: Text("Mi App"),
  ),
  body: Center(
    child: Column(
      children: [
        Text("Bienvenido a RutaCode"),
        Icon(Icons.star, color: Colors.yellow),
      ],
    ),
  ),
)
''',
    });

    // Detalle para 'Ventajas y limitaciones de los widgets Stateless'
    await db.insert('detail', {
      'id': 44,
      'subtopic_id': 's03t02l03',
      'module': 'Jr',
      'definition': 'Los widgets Stateless tienen ventajas y limitaciones que los hacen ideales para ciertos casos de uso, pero no para todos.\n\n'
          '¿Cuáles son las ventajas y limitaciones de los widgets Stateless? 🤔\n\n'
          '- **Ventajas**:\n'
          '  - **Eficiencia**: Al no mantener estado interno, son más ligeros y rápidos de renderizar.\n'
          '  - **Simplicidad**: Son fáciles de crear y usar, lo que los hace ideales para componentes estáticos.\n'
          '  - **Reutilización**: Pueden ser reutilizados en diferentes partes de la aplicación sin preocuparse por el estado.\n\n'
          '- **Limitaciones**:\n'
          '  - **Inmutabilidad**: No pueden cambiar su apariencia o comportamiento una vez construidos.\n'
          '  - **Uso limitado**: No son adecuados para componentes que necesitan actualizarse dinámicamente, como formularios o animaciones.\n\n'
          'Los widgets Stateless son una herramienta poderosa, pero es importante entender cuándo usarlos y cuándo optar por widgets Stateful.',
      'img_url': '',
      'code_example': '''
// Ejemplo de un widget Stateless con ventajas y limitaciones
class MiBoton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
       debugPrint("Botón presionado");
      },
      child: Text("Presiona aquí"),
    );
  }
}
''',
    });
  }

  Future<void> _insertDetailsJrTopic3Level3(db) async {
    // Detalle para 'Creación de widgets Stateful'
    await db.insert('detail', {
      'id': 45,
      'subtopic_id': 's01t03l03',
      'module': 'Jr',
      'definition': 'Un widget Stateful en Flutter es un componente de interfaz de usuario que puede mantener un estado interno. Esto significa que su apariencia y comportamiento pueden cambiar dinámicamente durante la ejecución de la aplicación.\n\n'
          '¿Cómo se crea un widget Stateful? 🛠️\n\n'
          'Para crear un widget Stateful, debes extender la clase `StatefulWidget` y definir una clase `State` asociada. La clase `State` es donde se gestiona el estado del widget y se define cómo se debe construir la interfaz en el método `build`.\n\n'
          'Por ejemplo, si creas un widget `Contador`, este podría mostrar un número que aumenta cada vez que el usuario presiona un botón.\n\n'
          'Crear widgets Stateful es esencial para construir interfaces dinámicas e interactivas en Flutter.',
      'img_url': '',
      'code_example': '''
// Ejemplo de un widget Stateful
class Contador extends StatefulWidget {
  @override
  _ContadorState createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  int _contador = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Contador: \$_contador"),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _contador++;
            });
          },
          child: Text("Incrementar"),
        ),
      ],
    );
  }
}
''',
    });

    // Detalle para 'Uso de setState para actualizar la interfaz'
    await db.insert('detail', {
      'id': 46,
      'subtopic_id': 's02t03l03',
      'module': 'Jr',
      'definition': 'El método `setState` en Flutter se utiliza para actualizar el estado interno de un widget Stateful y notificar al framework que la interfaz debe reconstruirse.\n\n'
          '¿Cómo se usa `setState` para actualizar la interfaz? 🔄\n\n'
          'Cuando llamas a `setState`, Flutter marca el widget como "sucio" y lo reconstruye con el nuevo estado. Esto es útil para actualizar la interfaz en respuesta a interacciones del usuario, como hacer clic en un botón o cambiar el valor de un campo de texto.\n\n'
          'Por ejemplo, si tienes un contador que aumenta cada vez que el usuario presiona un botón, puedes usar `setState` para actualizar el valor del contador y reconstruir la interfaz.\n\n'
          'El uso correcto de `setState` es clave para crear aplicaciones dinámicas y reactivas en Flutter.',
      'img_url': '',
      'code_example': '''
// Ejemplo de uso de setState
class _ContadorState extends State<Contador> {
  int _contador = 0;

  void _incrementar() {
    setState(() {
      _contador++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Contador: \$_contador"),
        ElevatedButton(
          onPressed: _incrementar,
          child: Text("Incrementar"),
        ),
      ],
    );
  }
}
''',
    });

    // Detalle para 'Ciclo de vida de un widget Stateful'
    await db.insert('detail', {
      'id': 47,
      'subtopic_id': 's03t03l03',
      'module': 'Jr',
      'definition': 'El ciclo de vida de un widget Stateful en Flutter consta de una serie de métodos que se ejecutan en diferentes momentos, desde la creación hasta la destrucción del widget.\n\n'
          '¿Cuál es el ciclo de vida de un widget Stateful? 🔄\n\n'
          'Los métodos principales del ciclo de vida son:\n'
          '- **createState**: Se llama cuando se crea el widget Stateful.\n'
          '- **initState**: Se llama una sola vez, justo después de que el widget se inserta en el árbol de widgets.\n'
          '- **build**: Se llama cada vez que el widget necesita reconstruirse.\n'
          '- **dispose**: Se llama cuando el widget se elimina del árbol de widgets.\n\n'
          'Estos métodos te permiten gestionar recursos, inicializar datos y realizar tareas de limpieza. Entender el ciclo de vida es esencial para crear widgets Stateful eficientes y libres de errores.',
      'img_url': '',
      'code_example': '''
// Ejemplo de ciclo de vida de un widget Stateful
class _MiWidgetState extends State<MiWidget> {
  @override
  void initState() {
    super.initState();
   debugPrint("Widget inicializado");
  }

  @override
  void dispose() {
   debugPrint("Widget eliminado");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text("Hola, mundo");
  }
}
''',
    });
  }

  Future<void> _insertDetailsJrTopic4Level3(db) async {
    // Detalle para 'Uso de Container y Padding para estilos'
    await db.insert('detail', {
      'id': 48,
      'subtopic_id': 's01t04l03',
      'module': 'Jr',
      'definition': 'El widget `Container` en Flutter es una caja versátil que permite aplicar estilos como colores, bordes, márgenes y relleno (padding) a otros widgets. El widget `Padding` se utiliza específicamente para agregar espacio alrededor de un widget hijo.\n\n'
          '¿Cómo se usan `Container` y `Padding` para estilos? 🎨\n\n'
          'El `Container` es ideal para agrupar widgets y aplicar estilos como colores de fondo, bordes redondeados o sombras. Por otro lado, `Padding` es útil cuando necesitas agregar espacio alrededor de un widget sin aplicar otros estilos.\n\n'
          'Por ejemplo, puedes usar un `Container` para crear un botón con un color de fondo y bordes redondeados, y un `Padding` para agregar espacio alrededor del texto dentro del botón.\n\n'
          'Estos widgets son herramientas esenciales para diseñar interfaces atractivas y bien estructuradas en Flutter.',
      'img_url': '',
      'code_example': '''
// Ejemplo de uso de Container y Padding
Container(
  padding: EdgeInsets.all(16.0), // Padding interno
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(8.0),
  ),
  child: Padding(
    padding: EdgeInsets.symmetric(vertical: 8.0), // Padding adicional
    child: Text(
      "Hola, mundo",
      style: TextStyle(color: Colors.white),
    ),
  ),
)
''',
    });

    // Detalle para 'Personalización de textos con TextStyle'
    await db.insert('detail', {
      'id': 49,
      'subtopic_id': 's02t04l03',
      'module': 'Jr',
      'definition': 'El widget `TextStyle` en Flutter se utiliza para personalizar la apariencia de los textos, como el color, el tamaño, la fuente y el estilo (negrita, cursiva, etc.).\n\n'
          '¿Cómo se personalizan los textos con `TextStyle`? ✍️\n\n'
          'Con `TextStyle`, puedes definir cómo se ve un texto en tu aplicación. Por ejemplo, puedes cambiar el color del texto, ajustar el tamaño de la fuente, o aplicar estilos como negrita o cursiva.\n\n'
          'Además, puedes combinar `TextStyle` con otros widgets, como `Text` o `RichText`, para crear textos más complejos y visualmente atractivos.\n\n'
          'La personalización de textos es clave para crear interfaces claras y profesionales.',
      'img_url': '',
      'code_example': '''
// Ejemplo de personalización de textos con TextStyle
Text(
  "Bienvenido a RutaCode",
  style: TextStyle(
    color: Colors.blue,
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
  ),
)
''',
    });

    // Detalle para 'Uso de Theme para estilos globales'
    await db.insert('detail', {
      'id': 50,
      'subtopic_id': 's03t04l03',
      'module': 'Jr',
      'definition': 'El widget `Theme` en Flutter se utiliza para definir estilos globales que se aplican a toda la aplicación o a una parte de ella. Esto incluye colores, tipografías y otros estilos visuales.\n\n'
          '¿Por qué es importante usar `Theme` para estilos globales? 🌍\n\n'
          'El uso de `Theme` te permite mantener la consistencia visual en toda la aplicación. En lugar de definir estilos individualmente para cada widget, puedes definir un tema global que se aplique automáticamente.\n\n'
          'Por ejemplo, puedes definir un color primario y una tipografía en el tema, y todos los widgets de la aplicación usarán estos estilos de manera coherente.\n\n'
          'Usar `Theme` es una práctica recomendada para crear aplicaciones con un diseño uniforme y profesional.',
      'img_url': '',
      'code_example': '''
// Ejemplo de uso de Theme para estilos globales
MaterialApp(
  theme: ThemeData(
    primaryColor: Colors.blue,
    accentColor: Colors.green,
    textTheme: TextTheme(
      bodyText1: TextStyle(fontSize: 16.0, color: Colors.black),
      headline1: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
    ),
  ),
  home: MyHomePage(),
)
''',
    });
  }

  Future<void> _insertDetailsJrTopic5Level3(db) async {
    // Detalle para 'Introducción a los widgets Material'
    await db.insert('detail', {
      'id': 51,
      'subtopic_id': 's01t05l03',
      'module': 'Jr',
      'definition': 'Los widgets Material en Flutter son componentes de interfaz de usuario que siguen las pautas de diseño de Material Design, creadas por Google. Estos widgets ofrecen una apariencia y comportamiento consistentes con las aplicaciones de Android.\n\n'
          '¿Qué son los widgets Material? 🎨\n\n'
          'Los widgets Material incluyen componentes como `AppBar`, `FloatingActionButton`, `Drawer`, y muchos más. Estos widgets están diseñados para ser visualmente atractivos, fáciles de usar y altamente personalizables.\n\n'
          'Material Design se enfoca en la simplicidad, la consistencia y la usabilidad, lo que lo convierte en una excelente opción para aplicaciones modernas y profesionales.\n\n'
          'Los widgets Material son esenciales para crear aplicaciones que sigan las mejores prácticas de diseño de Android.',
      'img_url': '',
      'code_example': '''
// Ejemplo básico de una aplicación con Material Design
MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: Text("Mi App"),
    ),
    body: Center(
      child: Text("Hola, mundo"),
    ),
  ),
)
''',
    });

    // Detalle para 'Uso de AppBar, FloatingActionButton y Drawer'
    await db.insert('detail', {
      'id': 52,
      'subtopic_id': 's02t05l03',
      'module': 'Jr',
      'definition': 'Los widgets `AppBar`, `FloatingActionButton` y `Drawer` son componentes clave de Material Design que se utilizan para crear interfaces funcionales y atractivas.\n\n'
          '¿Cómo se usan estos widgets? 🛠️\n\n'
          '- **AppBar**: Es una barra superior que muestra el título de la aplicación y acciones comunes, como botones de menú o búsqueda.\n'
          '- **FloatingActionButton**: Es un botón circular flotante que se usa para acciones principales, como agregar un elemento nuevo.\n'
          '- **Drawer**: Es un panel lateral que se desliza para mostrar opciones de navegación o configuración.\n\n'
          'Estos widgets son fáciles de usar y se integran perfectamente con otros componentes de Material Design.',
      'img_url': '',
      'code_example': '''
// Ejemplo de uso de AppBar, FloatingActionButton y Drawer
Scaffold(
  appBar: AppBar(
    title: Text("Mi App"),
    actions: [
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {},
      ),
    ],
  ),
  drawer: Drawer(
    child: ListView(
      children: [
        ListTile(
          title: Text("Inicio"),
          onTap: () {},
        ),
        ListTile(
          title: Text("Configuración"),
          onTap: () {},
        ),
      ],
    ),
  ),
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
  ),
  body: Center(
    child: Text("Hola, mundo"),
  ),
)
''',
    });

    // Detalle para 'Personalización de widgets Material'
    await db.insert('detail', {
      'id': 53,
      'subtopic_id': 's03t05l03',
      'module': 'Jr',
      'definition': 'Los widgets Material en Flutter son altamente personalizables, lo que te permite adaptarlos a las necesidades específicas de tu aplicación.\n\n'
          '¿Cómo se personalizan los widgets Material? 🎨\n\n'
          'Puedes personalizar colores, formas, tipografías y comportamientos de los widgets Material utilizando propiedades como `color`, `shape`, `textTheme`, y más. Además, puedes usar el widget `Theme` para aplicar estilos globales.\n\n'
          'Por ejemplo, puedes cambiar el color de la `AppBar`, agregar bordes redondeados al `FloatingActionButton`, o modificar el estilo del texto en el `Drawer`.\n\n'
          'La personalización de widgets Material es clave para crear aplicaciones únicas y coherentes con la identidad visual de tu marca.',
      'img_url': '',
      'code_example': '''
// Ejemplo de personalización de widgets Material
AppBar(
  title: Text("Mi App"),
  backgroundColor: Colors.deepPurple,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
      bottom: Radius.circular(20),
    ),
  ),
)

FloatingActionButton(
  onPressed: () {},
  child: Icon(Icons.add),
  backgroundColor: Colors.green,
  shape: CircleBorder(),
)
''',
    });
  }

  Future<void> _insertDetailsJrTopic6Level3(db) async {
    // Detalle para 'Introducción a los widgets Cupertino'
    await db.insert('detail', {
      'id': 54,
      'subtopic_id': 's01t06l03',
      'module': 'Jr',
      'definition': 'Los widgets Cupertino en Flutter son componentes de interfaz de usuario que siguen las pautas de diseño de iOS. Estos widgets ofrecen una apariencia y comportamiento consistentes con las aplicaciones de Apple.\n\n'
          '¿Qué son los widgets Cupertino? 🍎\n\n'
          'Los widgets Cupertino incluyen componentes como `CupertinoNavigationBar`, `CupertinoButton`, y `CupertinoPicker`. Estos widgets están diseñados para imitar el estilo visual y las interacciones típicas de iOS.\n\n'
          'Usar widgets Cupertino es ideal si deseas que tu aplicación tenga un aspecto nativo en dispositivos iOS, manteniendo la consistencia con las aplicaciones de Apple.\n\n'
          'Los widgets Cupertino son esenciales para crear aplicaciones que sigan las mejores prácticas de diseño de iOS.',
      'img_url': '',
      'code_example': '''
// Ejemplo básico de una aplicación con Cupertino Design
CupertinoApp(
  home: CupertinoPageScaffold(
    navigationBar: CupertinoNavigationBar(
      middle: Text("Mi App"),
    ),
    child: Center(
      child: Text("Hola, mundo"),
    ),
  ),
)
''',
    });

    // Detalle para 'Uso de CupertinoNavigationBar y CupertinoButton'
    await db.insert('detail', {
      'id': 55,
      'subtopic_id': 's02t06l03',
      'module': 'Jr',
      'definition': 'Los widgets `CupertinoNavigationBar` y `CupertinoButton` son componentes clave de Cupertino Design que se utilizan para crear interfaces funcionales y atractivas en iOS.\n\n'
          '¿Cómo se usan estos widgets? 🛠️\n\n'
          '- **CupertinoNavigationBar**: Es una barra de navegación superior que muestra el título de la aplicación y acciones comunes, como botones de retroceso o acciones adicionales.\n'
          '- **CupertinoButton**: Es un botón con el estilo típico de iOS, que se usa para acciones principales o secundarias.\n\n'
          'Estos widgets son fáciles de usar y se integran perfectamente con otros componentes de Cupertino Design.',
      'img_url': '',
      'code_example': '''
// Ejemplo de uso de CupertinoNavigationBar y CupertinoButton
CupertinoPageScaffold(
  navigationBar: CupertinoNavigationBar(
    middle: Text("Mi App"),
    trailing: CupertinoButton(
      child: Text("Guardar"),
      onPressed: () {},
    ),
  ),
  child: Center(
    child: CupertinoButton(
      child: Text("Presiona aquí"),
      onPressed: () {},
    ),
  ),
)
''',
    });

    // Detalle para 'Diferencias entre widgets Material y Cupertino'
    await db.insert('detail', {
      'id': 56,
      'subtopic_id': 's03t06l03',
      'module': 'Jr',
      'definition': 'Los widgets Material y Cupertino en Flutter tienen diferencias clave en términos de diseño, comportamiento y uso.\n\n'
          '¿Cuáles son las diferencias principales? 🤔\n\n'
          '- **Diseño**: Los widgets Material siguen las pautas de Material Design (Android), mientras que los widgets Cupertino imitan el diseño de iOS.\n'
          '- **Comportamiento**: Los widgets Material tienen animaciones y transiciones típicas de Android, mientras que los widgets Cupertino replican las interacciones de iOS.\n'
          '- **Uso**: Los widgets Material son ideales para aplicaciones Android o multiplataforma, mientras que los widgets Cupertino son mejores para aplicaciones iOS.\n\n'
          'Elegir entre Material y Cupertino depende del público objetivo y la plataforma en la que se ejecutará tu aplicación.',
      'img_url': '',
      'code_example': '''
// Ejemplo de comparación entre Material y Cupertino
MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: Text("Material Design"),
    ),
    body: Center(
      child: Text("Hola, Android"),
    ),
  ),
)

CupertinoApp(
  home: CupertinoPageScaffold(
    navigationBar: CupertinoNavigationBar(
      middle: Text("Cupertino Design"),
    ),
    child: Center(
      child: Text("Hola, iOS"),
    ),
  ),
)
''',
    });
  }

  Future<void> insertDetailsJrLevel4(Database db) async {
    try {
      await _insertDetailsJrTopic1Level4(db);
      await _insertDetailsJrTopic2Level4(db);
      await _insertDetailsJrTopic3Level4(db);
    } catch (e) {
      debugPrint("Error inserting details jr level 4: $e");
    }
  }

  Future<void> _insertDetailsJrTopic1Level4(db) async {
    // Detalle para 'Agregar fuentes personalizadas a un proyecto Flutter'
    await db.insert('detail', {
      'id': 58,
      'subtopic_id': 's01t01l04',
      'module': 'Jr',
      'definition': 'Agregar fuentes personalizadas a un proyecto Flutter permite personalizar la tipografía de la aplicación para que coincida con la identidad visual de tu marca.\n\n'
          '¿Cómo se agregan fuentes personalizadas? 🖋️\n\n'
          'Para agregar una fuente personalizada, debes incluir los archivos de la fuente (por ejemplo, `.ttf` o `.otf`) en la carpeta `assets/fonts` de tu proyecto y luego configurar el archivo `pubspec.yaml` para que Flutter reconozca estas fuentes.\n\n'
          'Una vez configuradas, puedes usar las fuentes personalizadas en tu aplicación mediante el widget `TextStyle`.\n\n'
          'Agregar fuentes personalizadas es una forma sencilla de mejorar la apariencia y la consistencia visual de tu aplicación.',
      'img_url': '',
      'code_example': '''
# Ejemplo de configuración en pubspec.yaml
flutter:
  fonts:
    - family: MiFuente
      fonts:
        - asset: assets/fonts/MiFuente-Regular.ttf
        - asset: assets/fonts/MiFuente-Bold.ttf
          weight: 700

# Uso de la fuente personalizada en TextStyle
Text(
  "Hola, mundo",
  style: TextStyle(
    fontFamily: "MiFuente",
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
  ),
)
''',
    });

    // Detalle para 'Uso de fuentes en TextStyle'
    await db.insert('detail', {
      'id': 59,
      'subtopic_id': 's02t01l04',
      'module': 'Jr',
      'definition': 'El widget `TextStyle` en Flutter se utiliza para aplicar estilos a los textos, incluyendo el uso de fuentes personalizadas.\n\n'
          '¿Cómo se usan las fuentes en `TextStyle`? ✍️\n\n'
          'Una vez que has agregado una fuente personalizada a tu proyecto, puedes usarla en cualquier widget `Text` especificando el nombre de la fuente en la propiedad `fontFamily` de `TextStyle`.\n\n'
          'Además, puedes combinar la fuente con otras propiedades como `fontSize`, `fontWeight`, y `color` para crear textos visualmente atractivos.\n\n'
          'El uso de fuentes personalizadas es clave para mantener la consistencia visual en tu aplicación.',
      'img_url': '',
      'code_example': '''
// Ejemplo de uso de fuentes en TextStyle
Text(
  "Bienvenido a RutaCode",
  style: TextStyle(
    fontFamily: "MiFuente",
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
  ),
)
''',
    });

    // Detalle para 'Optimización de fuentes para diferentes dispositivos'
    await db.insert('detail', {
      'id': 60,
      'subtopic_id': 's03t01l04',
      'module': 'Jr',
      'definition': 'Optimizar fuentes para diferentes dispositivos es esencial para garantizar que tu aplicación se vea bien en pantallas de distintos tamaños y resoluciones.\n\n'
          '¿Cómo se optimizan las fuentes? 📱\n\n'
          'Para optimizar las fuentes, puedes usar tamaños de fuente relativos (como `MediaQuery` o `LayoutBuilder`) en lugar de valores fijos. También es recomendable utilizar fuentes que sean legibles en diferentes tamaños y pesos.\n\n'
          'Además, puedes cargar diferentes versiones de una fuente (por ejemplo, regular, bold, italic) y usarlas según el contexto o el dispositivo.\n\n'
          'La optimización de fuentes es clave para crear aplicaciones accesibles y adaptables.',
      'img_url': '',
      'code_example': '''
// Ejemplo de optimización de fuentes con MediaQuery
Text(
  "Texto adaptable",
  style: TextStyle(
    fontFamily: "MiFuente",
    fontSize: MediaQuery.of(context).size.width * 0.05, // Tamaño relativo
    fontWeight: FontWeight.bold,
  ),
)
''',
    });
  }

  Future<void> _insertDetailsJrTopic2Level4(db) async {
    // Detalle para 'Agregar imágenes a un proyecto Flutter'
    await db.insert('detail', {
      'id': 61,
      'subtopic_id': 's01t02l04',
      'module': 'Jr',
      'definition': 'Agregar imágenes a un proyecto Flutter es esencial para crear interfaces visualmente atractivas. Las imágenes pueden ser locales (almacenadas en el proyecto) o remotas (descargadas desde una URL).\n\n'
          '¿Cómo se agregan imágenes? 🖼️\n\n'
          'Para agregar imágenes locales, debes colocarlas en la carpeta `assets/images` y configurar el archivo `pubspec.yaml` para que Flutter las reconozca. Para imágenes remotas, puedes usar la URL directamente.\n\n'
          'Flutter proporciona widgets como `Image.asset` para imágenes locales y `Image.network` para imágenes remotas.\n\n'
          'Agregar imágenes es una forma sencilla de mejorar la experiencia visual de tu aplicación.',
      'img_url': '',
      'code_example': '''
# Ejemplo de configuración en pubspec.yaml
flutter:
  assets:
    - assets/images/mi_imagen.png

# Uso de Image.asset para imágenes locales
Image.asset("assets/images/mi_imagen.png")

# Uso de Image.network para imágenes remotas
Image.network("https://example.com/mi_imagen.jpg")
''',
    });

    // Detalle para 'Uso de Image.asset y Image.network'
    await db.insert('detail', {
      'id': 62,
      'subtopic_id': 's02t02l04',
      'module': 'Jr',
      'definition': 'Los widgets `Image.asset` y `Image.network` en Flutter se utilizan para mostrar imágenes locales y remotas, respectivamente.\n\n'
          '¿Cómo se usan estos widgets? 🖼️\n\n'
          '- **Image.asset**: Se usa para cargar imágenes que están almacenadas en la carpeta `assets` de tu proyecto. Es ideal para imágenes que no cambian con frecuencia.\n'
          '- **Image.network**: Se usa para cargar imágenes desde una URL. Es útil para imágenes dinámicas o que se actualizan con frecuencia.\n\n'
          'Ambos widgets son fáciles de usar y se integran perfectamente con otros componentes de Flutter.',
      'img_url': '',
      'code_example': '''
// Ejemplo de uso de Image.asset y Image.network
Column(
  children: [
    Image.asset("assets/images/mi_imagen.png"),
    Image.network("https://example.com/mi_imagen.jpg"),
  ],
)
''',
    });

    // Detalle para 'Optimización de imágenes para diferentes resoluciones'
    await db.insert('detail', {
      'id': 63,
      'subtopic_id': 's03t02l04',
      'module': 'Jr',
      'definition': 'Optimizar imágenes para diferentes resoluciones es esencial para garantizar que tu aplicación se vea bien en dispositivos con distintas densidades de pantalla.\n\n'
          '¿Cómo se optimizan las imágenes? 📱\n\n'
          'Flutter permite definir imágenes para diferentes densidades de pantalla (1x, 2x, 3x) en la carpeta `assets/images`. El framework selecciona automáticamente la imagen adecuada según el dispositivo.\n\n'
          'Además, puedes usar widgets como `FadeInImage` para mostrar un placeholder mientras se carga la imagen, o `CachedNetworkImage` para almacenar en caché imágenes remotas.\n\n'
          'La optimización de imágenes es clave para crear aplicaciones eficientes y visualmente consistentes.',
      'img_url': '',
      'code_example': '''
# Ejemplo de estructura de carpetas para imágenes adaptativas
assets/
  images/
    mi_imagen.png
    mi_imagen_2x.png
    mi_imagen_3x.png

# Uso de FadeInImage para imágenes con placeholder
FadeInImage.assetNetwork(
  placeholder: "assets/images/placeholder.png",
  image: "https://example.com/mi_imagen.jpg",
)
''',
    });
  }

  Future<void> _insertDetailsJrTopic3Level4(db) async {
    // Detalle para 'Carga de archivos de audio y video'
    await db.insert('detail', {
      'id': 64,
      'subtopic_id': 's01t03l04',
      'module': 'Jr',
      'definition': 'La carga de archivos de audio y video en Flutter permite agregar contenido multimedia a tu aplicación, como música, efectos de sonido o videos.\n\n'
          '¿Cómo se cargan archivos de audio y video? 🎵🎥\n\n'
          'Para cargar archivos de audio y video, puedes usar paquetes como `audioplayers` para audio y `video_player` para video. Estos paquetes proporcionan widgets y métodos para reproducir y controlar contenido multimedia.\n\n'
          'Además, los archivos multimedia pueden ser locales (almacenados en el proyecto) o remotos (descargados desde una URL).\n\n'
          'Agregar audio y video es una forma efectiva de mejorar la experiencia del usuario en tu aplicación.',
      'img_url': '',
      'code_example': '''
# Ejemplo de uso de audioplayers para audio
import 'package:audioplayers/audioplayers.dart';

final player = AudioPlayer();
player.play(AssetSource("audio/mi_audio.mp3"));

# Ejemplo de uso de video_player para video
import 'package:video_player/video_player.dart';

final controller = VideoPlayerController.asset("assets/videos/mi_video.mp4");
controller.initialize().then((_) {
  controller.play();
});
''',
    });

    // Detalle para 'Gestión de archivos en el sistema de archivos'
    await db.insert('detail', {
      'id': 65,
      'subtopic_id': 's02t03l04',
      'module': 'Jr',
      'definition': 'La gestión de archivos en el sistema de archivos permite a tu aplicación leer, escribir y manipular archivos en el dispositivo del usuario.\n\n'
          '¿Cómo se gestionan archivos en Flutter? 📂\n\n'
          'Flutter proporciona el paquete `path_provider` para acceder a rutas comunes del sistema de archivos, como el directorio de documentos o el directorio temporal. Luego, puedes usar la clase `File` de Dart para leer o escribir archivos.\n\n'
          'Esta funcionalidad es útil para guardar configuraciones, almacenar datos locales, o manejar archivos descargados.\n\n'
          'La gestión de archivos es esencial para aplicaciones que necesitan persistencia de datos o interacción con el sistema de archivos.',
      'img_url': '',
      'code_example': '''
# Ejemplo de uso de path_provider y File
import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<void> guardarArchivo() async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File("\${directory.path}/mi_archivo.txt");
  await file.writeAsString("Hola, mundo");
}

Future<void> leerArchivo() async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File("\${directory.path}/mi_archivo.txt");
  String contenido = await file.readAsString();
 debugPrint(contenido);
}
''',
    });
  }

  Future<void> insertDetailsJrLevel5(Database db) async {
    try {
      await _insertDetailsJrTopic1Level5(db);
      await _insertDetailsJrTopic2Level5(db);
    } catch (e) {
      debugPrint("Error inserting details jr level 5: $e");
    }
  }

  Future<void> _insertDetailsJrTopic1Level5(db) async {
    // Detalle para 'Introducción a Git y comandos básicos'
    await db.insert('detail', {
      'id': 66,
      'subtopic_id': 's01t01l05',
      'module': 'Jr',
      'definition': 'Git es un sistema de control de versiones distribuido que te permite rastrear cambios en el código, colaborar con otros desarrolladores y gestionar proyectos de software de manera eficiente.\n\n'
          '¿Qué es Git y por qué es importante? 🛠️\n\n'
          'Git te permite guardar "instantáneas" de tu código en diferentes momentos, lo que facilita la reversión a versiones anteriores, la colaboración en equipo y la gestión de cambios. Algunos comandos básicos incluyen:\n'
          '- `git init`: Inicializa un repositorio Git en un proyecto.\n'
          '- `git add`: Agrega cambios al área de preparación (staging).\n'
          '- `git commit`: Guarda los cambios en el historial del repositorio.\n'
          '- `git status`: Muestra el estado actual del repositorio.\n\n'
          'Git es una herramienta esencial para cualquier desarrollador, ya que mejora la organización y la colaboración en proyectos de software.',
      'img_url': '',
      'code_example': '''
# Ejemplo de comandos básicos de Git
git init
git add .
git commit -m "Primer commit"
git status
''',
    });

    // Detalle para 'Creación y gestión de ramas'
    await db.insert('detail', {
      'id': 67,
      'subtopic_id': 's02t01l05',
      'module': 'Jr',
      'definition': 'Las ramas en Git te permiten trabajar en diferentes versiones de un proyecto de manera simultánea. Esto es útil para desarrollar nuevas características, corregir errores o experimentar sin afectar la rama principal.\n\n'
          '¿Cómo se crean y gestionan ramas? 🌿\n\n'
          'Puedes crear una nueva rama con el comando `git branch nombre_rama` y cambiar a esa rama con `git checkout nombre_rama`. Para fusionar una rama con la rama principal, usa `git merge nombre_rama`.\n\n'
          'Las ramas son una parte fundamental del flujo de trabajo en Git, ya que permiten aislar cambios y facilitan la colaboración en equipo.\n\n'
          'Dominar la creación y gestión de ramas es clave para trabajar de manera eficiente en proyectos grandes o colaborativos.',
      'img_url': '',
      'code_example': '''
# Ejemplo de creación y gestión de ramas
git branch nueva_rama
git checkout nueva_rama
# Realiza cambios y haz commits
git checkout main
git merge nueva_rama
''',
    });

    // Detalle para 'Resolución de conflictos en Git'
    await db.insert('detail', {
      'id': 68,
      'subtopic_id': 's03t01l05',
      'module': 'Jr',
      'definition': 'Los conflictos en Git ocurren cuando dos ramas tienen cambios incompatibles en la misma parte del código. Resolver estos conflictos es esencial para mantener la integridad del proyecto.\n\n'
          '¿Cómo se resuelven conflictos en Git? ⚔️\n\n'
          'Cuando ocurre un conflicto, Git marca las áreas problemáticas en el código. Debes editar manualmente el archivo para resolver el conflicto, luego usar `git add` para marcar el conflicto como resuelto y finalmente completar la fusión con `git commit`.\n\n'
          'Es importante comunicarse con el equipo para entender los cambios y tomar decisiones informadas al resolver conflictos.\n\n'
          'La resolución de conflictos es una habilidad clave para trabajar en proyectos colaborativos con Git.',
      'img_url': '',
      'code_example': '''
# Ejemplo de resolución de conflictos
# Git marca el conflicto en el archivo
<<<<<<< HEAD
Código de la rama actual
=======
Código de la rama fusionada
>>>>>>> nueva_rama

# Edita el archivo para resolver el conflicto
git add archivo_conflicto.txt
git commit -m "Conflicto resuelto"
''',
    });
  }

  Future<void> _insertDetailsJrTopic2Level5(db) async {
    // Detalle para 'Creación de un repositorio en GitHub'
    await db.insert('detail', {
      'id': 69,
      'subtopic_id': 's01t02l05',
      'module': 'Jr',
      'definition': 'GitHub es una plataforma basada en Git que permite alojar repositorios, colaborar en proyectos y gestionar el ciclo de vida del software.\n\n'
          '¿Cómo se crea un repositorio en GitHub? 🚀\n\n'
          'Para crear un repositorio en GitHub, inicia sesión en tu cuenta, haz clic en "New" en la página de repositorios, y completa los detalles como el nombre y la descripción. Luego, puedes clonar el repositorio en tu máquina local usando `git clone`.\n\n'
          'GitHub es una herramienta esencial para el desarrollo colaborativo, ya que facilita la gestión de código, el seguimiento de problemas y la revisión de cambios.\n\n'
          'Crear un repositorio en GitHub es el primer paso para compartir y colaborar en proyectos de software.',
      'img_url': '',
      'code_example': '''
# Ejemplo de clonación de un repositorio de GitHub
git clone https://github.com/usuario/mi_repositorio.git
''',
    });

    // Detalle para 'Subir y actualizar proyectos en GitHub'
    await db.insert('detail', {
      'id': 70,
      'subtopic_id': 's02t02l05',
      'module': 'Jr',
      'definition': 'Subir y actualizar proyectos en GitHub te permite compartir tu código con otros desarrolladores y mantener un historial de cambios en la nube.\n\n'
          '¿Cómo se suben y actualizan proyectos? 📤\n\n'
          'Para subir un proyecto, primero inicializa un repositorio Git local (`git init`), luego agrega los cambios (`git add .`), haz un commit (`git commit -m "Mensaje"`), y finalmente sube los cambios a GitHub con `git push origin main`.\n\n'
          'Para actualizar un proyecto, usa `git pull` para descargar los cambios más recientes desde GitHub y fusionarlos con tu copia local.\n\n'
          'Subir y actualizar proyectos en GitHub es esencial para la colaboración y el control de versiones.',
      'img_url': '',
      'code_example': '''
# Ejemplo de subir un proyecto a GitHub
git init
git add .
git commit -m "Primer commit"
git remote add origin https://github.com/usuario/mi_repositorio.git
git push -u origin main

# Ejemplo de actualizar un proyecto desde GitHub
git pull origin main
''',
    });

    // Detalle para 'Uso de Pull Requests y Code Reviews'
    await db.insert('detail', {
      'id': 71,
      'subtopic_id': 's03t02l05',
      'module': 'Jr',
      'definition': 'Los Pull Requests (PR) y las Code Reviews son prácticas esenciales en GitHub para colaborar en proyectos y garantizar la calidad del código.\n\n'
          '¿Cómo se usan Pull Requests y Code Reviews? 🔍\n\n'
          'Un Pull Request es una solicitud para fusionar cambios de una rama a otra (por ejemplo, de una rama de desarrollo a la rama principal). Durante el proceso de revisión (Code Review), otros desarrolladores pueden revisar el código, hacer comentarios y sugerir mejoras antes de aprobar la fusión.\n\n'
          'Estas prácticas fomentan la colaboración, mejoran la calidad del código y ayudan a detectar errores antes de que lleguen a la rama principal.\n\n'
          'El uso de Pull Requests y Code Reviews es clave para trabajar en equipos de desarrollo de manera eficiente.',
      'img_url': '',
      'code_example': '''
# Ejemplo de flujo de trabajo con Pull Requests
1. Crea una nueva rama: `git branch nueva_rama`
2. Realiza cambios y haz commits: `git commit -m "Nueva funcionalidad"`
3. Sube la rama a GitHub: `git push origin nueva_rama`
4. Abre un Pull Request en GitHub y espera la revisión.
5. Después de la aprobación, fusiona la rama con `git merge nueva_rama`.
''',
    });
  }

  Future<void> insertDetailsJrLevel6(Database db) async {
    try {
      await _insertDetailsJrTopic1Level6(db);
      await _insertDetailsJrTopic2Level6(db);
    } catch (e) {
      debugPrint("Error inserting details jr level 6: $e");
    }
  }

  Future<void> _insertDetailsJrTopic1Level6(db) async {
    // Detalle para 'Introducción a SQLite en Flutter'
    await db.insert('detail', {
      'id': 72,
      'subtopic_id': 's01t01l06',
      'module': 'Jr',
      'definition': 'SQLite es una base de datos ligera y embebida que permite almacenar datos estructurados en aplicaciones Flutter. Es ideal para aplicaciones que necesitan persistencia de datos local.\n\n'
          '¿Qué es SQLite y por qué es importante? 🗄️\n\n'
          'SQLite es una base de datos relacional que se ejecuta directamente en el dispositivo, sin necesidad de un servidor externo. Es perfecta para almacenar datos como configuraciones, listas de tareas, o información de usuarios.\n\n'
          'En Flutter, puedes usar el paquete `sqflite` para interactuar con SQLite. Este paquete proporciona una API sencilla para crear, gestionar y consultar bases de datos.\n\n'
          'SQLite es una herramienta esencial para aplicaciones que requieren almacenamiento local de datos estructurados.',
      'img_url': '',
      'code_example': '''
# Ejemplo de configuración de SQLite en Flutter
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> abrirBaseDeDatos() async {
  return openDatabase(
    join(await getDatabasesPath(), 'mi_base_de_datos.db'),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE usuarios(id INTEGER PRIMARY KEY, nombre TEXT)",
      );
    },
    version: 1,
  );
}
''',
    });

    // Detalle para 'Creación y gestión de una base de datos SQLite'
    await db.insert('detail', {
      'id': 73,
      'subtopic_id': 's02t01l06',
      'module': 'Jr',
      'definition': 'Crear y gestionar una base de datos SQLite en Flutter implica definir la estructura de la base de datos, abrir una conexión y realizar operaciones como insertar, actualizar o eliminar datos.\n\n'
          '¿Cómo se crea y gestiona una base de datos SQLite? 🛠️\n\n'
          'Para crear una base de datos, debes definir las tablas y sus columnas en el método `onCreate` de `openDatabase`. Luego, puedes usar métodos como `insert`, `update`, y `delete` para gestionar los datos.\n\n'
          'Es importante manejar correctamente la conexión a la base de datos y cerrarla cuando ya no sea necesaria para evitar problemas de rendimiento.\n\n'
          'La creación y gestión de una base de datos SQLite es clave para aplicaciones que necesitan almacenar y recuperar datos de manera eficiente.',
      'img_url': '',
      'code_example': '''
# Ejemplo de creación y gestión de una base de datos SQLite
Future<void> insertarUsuario(Database db, String nombre) async {
  await db.insert(
    'usuarios',
    {'nombre': nombre},
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<void> actualizarUsuario(Database db, int id, String nombre) async {
  await db.update(
    'usuarios',
    {'nombre': nombre},
    where: "id = ?",
    whereArgs: [id],
  );
}

Future<void> eliminarUsuario(Database db, int id) async {
  await db.delete(
    'usuarios',
    where: "id = ?",
    whereArgs: [id],
  );
}
''',
    });

    // Detalle para 'Consultas básicas y avanzadas en SQLite'
    await db.insert('detail', {
      'id': 74,
      'subtopic_id': 's03t01l06',
      'module': 'Jr',
      'definition': 'Las consultas en SQLite te permiten recuperar datos de la base de datos de manera eficiente. Puedes realizar consultas básicas, como seleccionar todos los registros, o consultas avanzadas, como filtros, ordenamientos y joins.\n\n'
          '¿Cómo se realizan consultas en SQLite? 🔍\n\n'
          'Para realizar consultas, puedes usar el método `query` o ejecutar sentencias SQL directamente con `rawQuery`. Las consultas pueden incluir condiciones (`WHERE`), ordenamientos (`ORDER BY`), y límites (`LIMIT`).\n\n'
          'Las consultas avanzadas, como los joins, te permiten combinar datos de varias tablas para obtener resultados más complejos.\n\n'
          'Dominar las consultas en SQLite es esencial para trabajar con datos estructurados en aplicaciones Flutter.',
      'img_url': '',
      'code_example': '''
# Ejemplo de consultas básicas y avanzadas en SQLite
Future<List<Map<String, dynamic>>> obtenerUsuarios(Database db) async {
  return await db.query('usuarios');
}

Future<List<Map<String, dynamic>>> obtenerUsuarioPorId(Database db, int id) async {
  return await db.query(
    'usuarios',
    where: "id = ?",
    whereArgs: [id],
  );
}

Future<List<Map<String, dynamic>>> obtenerUsuariosOrdenados(Database db) async {
  return await db.query(
    'usuarios',
    orderBy: "nombre ASC",
  );
}
''',
    });
  }

  Future<void> _insertDetailsJrTopic2Level6(db) async {
    // Detalle para 'Introducción a Shared Preferences'
    await db.insert('detail', {
      'id': 75,
      'subtopic_id': 's01t02l06',
      'module': 'Jr',
      'definition': 'Shared Preferences es una forma sencilla de almacenar datos simples en aplicaciones Flutter, como preferencias del usuario o configuraciones.\n\n'
          '¿Qué es Shared Preferences y por qué es importante? 🗂️\n\n'
          'Shared Preferences es un almacenamiento clave-valor que permite guardar datos primitivos (como `String`, `int`, `bool`, etc.) de manera persistente. Es ideal para almacenar pequeñas cantidades de datos que no requieren una estructura compleja.\n\n'
          'En Flutter, puedes usar el paquete `shared_preferences` para acceder a esta funcionalidad. Es fácil de usar y no requiere configuración adicional.\n\n'
          'Shared Preferences es una herramienta esencial para guardar preferencias del usuario o configuraciones simples.',
      'img_url': '',
      'code_example': '''
# Ejemplo de configuración de Shared Preferences en Flutter
import 'package:shared_preferences/shared_preferences.dart';

Future<void> guardarPreferencia(String clave, String valor) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(clave, valor);
}

Future<String?> obtenerPreferencia(String clave) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(clave);
}
''',
    });

    // Detalle para 'Almacenamiento de datos simples en Shared Preferences'
    await db.insert('detail', {
      'id': 76,
      'subtopic_id': 's02t02l06',
      'module': 'Jr',
      'definition': 'El almacenamiento de datos simples en Shared Preferences es ideal para guardar información como configuraciones del usuario, preferencias de la aplicación o estados simples.\n\n'
          '¿Cómo se almacenan datos simples? 📝\n\n'
          'Puedes usar métodos como `setString`, `setInt`, `setBool`, y `setDouble` para guardar datos en Shared Preferences. Para recuperar los datos, usa los métodos correspondientes como `getString`, `getInt`, etc.\n\n'
          'Shared Preferences es una solución ligera y eficiente para almacenar datos que no requieren una estructura compleja o consultas avanzadas.\n\n'
          'El almacenamiento de datos simples es clave para personalizar la experiencia del usuario en tu aplicación.',
      'img_url': '',
      'code_example': '''
# Ejemplo de almacenamiento de datos simples
Future<void> guardarConfiguracion(String tema, bool esModoOscuro) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('tema', tema);
  await prefs.setBool('esModoOscuro', esModoOscuro);
}

Future<String?> obtenerTema() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('tema');
}

Future<bool?> esModoOscuro() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('esModoOscuro');
}
''',
    });

    // Detalle para 'Uso de Shared Preferences para guardar preferencias del usuario'
    await db.insert('detail', {
      'id': 77,
      'subtopic_id': 's03t02l06',
      'module': 'Jr',
      'definition': 'Shared Preferences es ideal para guardar preferencias del usuario, como el tema de la aplicación, el idioma seleccionado o configuraciones personalizadas.\n\n'
          '¿Cómo se usan Shared Preferences para preferencias del usuario? 🎨\n\n'
          'Puedes guardar las preferencias del usuario usando métodos como `setString`, `setBool`, o `setInt`, y recuperarlas cuando la aplicación se inicie. Esto permite personalizar la experiencia del usuario según sus elecciones.\n\n'
          'Por ejemplo, puedes guardar el tema seleccionado (claro u oscuro) y aplicarlo cada vez que el usuario abra la aplicación.\n\n'
          'El uso de Shared Preferences para preferencias del usuario es una práctica común en aplicaciones móviles.',
      'img_url': '',
      'code_example': '''
# Ejemplo de uso de Shared Preferences para preferencias del usuario
Future<void> guardarTema(String tema) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('tema', tema);
}

Future<String?> obtenerTema() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('tema');
}

Future<void> aplicarTema() async {
  final tema = await obtenerTema();
  if (tema == "oscuro") {
    // Aplicar tema oscuro
  } else {
    // Aplicar tema claro
  }
}
''',
    });
  }

  Future<void> insertDetailsJrLevel7(Database db) async {
    try {
      await _insertDetailsJrTopic1Level7(db);
      await _insertDetailsJrTopic2Level7(db);
      await _insertDetailsJrTopic3Level7(db);
      await _insertDetailsJrTopic4Level7(db);
    } catch (e) {
      debugPrint("Error inserting details jr level 7: $e");
    }
  }

  Future<void> _insertDetailsJrTopic1Level7(db) async {
    // Detalle para 'Qué es la Programación Orientada a Objetos (POO)'
    await db.insert('detail', {
      'id': 78,
      'subtopic_id': 's01t01l07',
      'module': 'Jr',
      'definition': 'La Programación Orientada a Objetos (POO) es un paradigma de programación que organiza el código en "objetos", que son instancias de "clases". Estos objetos representan entidades del mundo real y contienen datos (atributos) y comportamientos (métodos).\n\n'
          '¿Qué es la POO y por qué es importante? 🧩\n\n'
          'La POO permite modelar problemas complejos de manera más clara y modular. En lugar de escribir código lineal, puedes crear clases que representen entidades (como un usuario, un producto o un vehículo) y definir cómo interactúan entre sí.\n\n'
          'Este enfoque mejora la reutilización del código, facilita el mantenimiento y hace que el software sea más escalable.\n\n'
          'La POO es un paradigma fundamental en el desarrollo de software moderno.',
      'img_url': '',
      'code_example': '''
// Ejemplo básico de una clase en Dart
class Coche {
  String marca;
  String modelo;

  Coche(this.marca, this.modelo);

  void arrancar() {
   debugPrint("El coche \$marca \$modelo está arrancando.");
  }
}
''',
    });

    // Detalle para 'Ventajas de usar POO'
    await db.insert('detail', {
      'id': 79,
      'subtopic_id': 's02t01l07',
      'module': 'Jr',
      'definition': 'La Programación Orientada a Objetos (POO) ofrece varias ventajas que la hacen ideal para desarrollar aplicaciones complejas y mantenibles.\n\n'
          '¿Cuáles son las ventajas de usar POO? 🚀\n\n'
          '- **Modularidad**: El código se divide en clases y objetos, lo que facilita su reutilización y mantenimiento.\n'
          '- **Abstracción**: Permite ocultar los detalles de implementación y exponer solo lo necesario.\n'
          '- **Encapsulamiento**: Protege los datos internos de un objeto y controla cómo se accede a ellos.\n'
          '- **Herencia**: Permite crear nuevas clases basadas en clases existentes, reutilizando código.\n'
          '- **Polimorfismo**: Permite que objetos de diferentes clases se comporten de manera similar.\n\n'
          'Estas ventajas hacen que la POO sea una herramienta poderosa para el desarrollo de software.',
      'img_url': '',
      'code_example': '''
// Ejemplo de modularidad y reutilización
class Animal {
  void hacerSonido() {
   debugPrint("Sonido genérico");
  }
}

class Perro extends Animal {
  @override
  void hacerSonido() {
   debugPrint("Guau guau");
  }
}
''',
    });

    // Detalle para 'Conceptos básicos'
    await db.insert('detail', {
      'id': 80,
      'subtopic_id': 's03t01l07',
      'module': 'Jr',
      'definition': 'Los conceptos básicos de la POO incluyen clases, objetos, atributos, métodos, y la interacción entre ellos.\n\n'
          '¿Cuáles son los conceptos básicos de la POO? 🧠\n\n'
          '- **Clase**: Es una plantilla o blueprint que define las propiedades y comportamientos de un objeto.\n'
          '- **Objeto**: Es una instancia de una clase, que representa una entidad específica.\n'
          '- **Atributos**: Son las variables que almacenan los datos de un objeto.\n'
          '- **Métodos**: Son las funciones que definen el comportamiento de un objeto.\n\n'
          'Entender estos conceptos es esencial para dominar la POO y aplicarla en tus proyectos.',
      'img_url': '',
      'code_example': '''
// Ejemplo de clase, objeto, atributos y métodos
class Persona {
  String nombre;
  int edad;

  Persona(this.nombre, this.edad);

  void saludar() {
   debugPrint("Hola, mi nombre es \$nombre y tengo \$edad años.");
  }
}

void main() {
  var persona = Persona("Juan", 25);
  persona.saludar();
}
''',
    });
  }

  Future<void> _insertDetailsJrTopic2Level7(db) async {
    // Detalle para 'Declaración y definición de clases'
    await db.insert('detail', {
      'id': 81,
      'subtopic_id': 's01t02l07',
      'module': 'Jr',
      'definition': 'Una clase en Dart es una plantilla que define las propiedades (atributos) y comportamientos (métodos) de un objeto. Declarar y definir clases es el primer paso para trabajar con POO.\n\n'
          '¿Cómo se declara y define una clase? 🛠️\n\n'
          'Para declarar una clase, usas la palabra clave `class` seguida del nombre de la clase. Luego, defines los atributos y métodos dentro de la clase. Los atributos representan el estado del objeto, y los métodos representan su comportamiento.\n\n'
          'Por ejemplo, puedes crear una clase `Coche` con atributos como `marca` y `modelo`, y métodos como `arrancar` y `detener`.\n\n'
          'Declarar y definir clases es fundamental para modelar entidades en tu aplicación.',
      'img_url': '',
      'code_example': '''
// Ejemplo de declaración y definición de una clase
class Coche {
  String marca;
  String modelo;

  Coche(this.marca, this.modelo);

  void arrancar() {
   debugPrint("El coche \$marca \$modelo está arrancando.");
  }

  void detener() {
   debugPrint("El coche \$marca \$modelo se ha detenido.");
  }
}
''',
    });

    // Detalle para 'Instanciación de objetos'
    await db.insert('detail', {
      'id': 82,
      'subtopic_id': 's02t02l07',
      'module': 'Jr',
      'definition': 'La instanciación de objetos es el proceso de crear una instancia específica de una clase. Un objeto es una representación concreta de una clase, con valores específicos para sus atributos.\n\n'
          '¿Cómo se instancian objetos? 🏗️\n\n'
          'Para instanciar un objeto, usas la palabra clave `new` (opcional en Dart) seguida del nombre de la clase y los argumentos necesarios para el constructor. Por ejemplo, puedes crear un objeto `Coche` con una marca y un modelo específicos.\n\n'
          'Los objetos son la base de la POO, ya que permiten interactuar con las entidades definidas en las clases.\n\n'
          'La instanciación de objetos es clave para trabajar con POO en Dart.',
      'img_url': '',
      'code_example': '''
// Ejemplo de instanciación de objetos
void main() {
  var miCoche = Coche("Toyota", "Corolla");
  miCoche.arrancar();
  miCoche.detener();
}
''',
    });

    // Detalle para 'Constructores y destructores'
    await db.insert('detail', {
      'id': 83,
      'subtopic_id': 's03t02l07',
      'module': 'Jr',
      'definition': 'Los constructores son métodos especiales que se ejecutan al crear un objeto, mientras que los destructores (aunque no son comunes en Dart) se refieren a la limpieza de recursos cuando un objeto ya no se usa.\n\n'
          '¿Qué son los constructores y destructores? 🏭\n\n'
          'En Dart, los constructores se definen con el mismo nombre de la clase y se usan para inicializar los atributos del objeto. Puedes tener constructores con parámetros, constructores nombrados o constructores por defecto.\n\n'
          'Aunque Dart no tiene destructores explícitos, puedes usar el método `dispose` o similares para liberar recursos cuando un objeto ya no es necesario.\n\n'
          'Los constructores son esenciales para inicializar objetos de manera correcta y eficiente.',
      'img_url': '',
      'code_example': '''
// Ejemplo de constructores
class Coche {
  String marca;
  String modelo;

  // Constructor con parámetros
  Coche(this.marca, this.modelo);

  // Constructor nombrado
  Coche.nuevo() {
    marca = "Desconocida";
    modelo = "Desconocido";
  }
}

void main() {
  var miCoche = Coche("Toyota", "Corolla");
  var cocheNuevo = Coche.nuevo();
}
''',
    });
  }

  Future<void> _insertDetailsJrTopic3Level7(db) async {
    // Detalle para 'Abstracción'
    await db.insert('detail', {
      'id': 84,
      'subtopic_id': 's01t03l07',
      'module': 'Jr',
      'definition': 'La abstracción en POO es el proceso de ocultar los detalles de implementación y exponer solo lo necesario para interactuar con un objeto.\n\n'
          '¿Qué es la abstracción y por qué es importante? 🎭\n\n'
          'La abstracción permite simplificar la interacción con objetos complejos al exponer solo las funcionalidades esenciales. Por ejemplo, cuando usas un coche, no necesitas saber cómo funciona el motor, solo cómo conducirlo.\n\n'
          'En Dart, la abstracción se logra mediante clases abstractas, interfaces y métodos que ocultan la lógica interna.\n\n'
          'La abstracción es clave para crear sistemas modulares y fáciles de entender.',
      'img_url': '',
      'code_example': '''
// Ejemplo de abstracción con una clase abstracta
abstract class Vehiculo {
  void arrancar();
  void detener();
}

class Coche extends Vehiculo {
  @override
  void arrancar() {
   debugPrint("Coche arrancado");
  }

  @override
  void detener() {
   debugPrint("Coche detenido");
  }
}
''',
    });

    // Detalle para 'Encapsulamiento'
    await db.insert('detail', {
      'id': 85,
      'subtopic_id': 's02t03l07',
      'module': 'Jr',
      'definition': 'El encapsulamiento en POO es el mecanismo que protege los datos internos de un objeto y controla cómo se accede a ellos.\n\n'
          '¿Qué es el encapsulamiento y por qué es importante? 🔒\n\n'
          'El encapsulamiento permite ocultar los detalles de implementación de un objeto y exponer solo los métodos necesarios para interactuar con él. Esto se logra usando modificadores de acceso como `private` (en Dart, con un guion bajo `_`).\n\n'
          'Por ejemplo, puedes ocultar el estado interno de un objeto y solo permitir su modificación a través de métodos específicos.\n\n'
          'El encapsulamiento es esencial para proteger la integridad de los datos y evitar errores.',
      'img_url': '',
      'code_example': '''
// Ejemplo de encapsulamiento
class CuentaBancaria {
  double _saldo = 0.0;

  void depositar(double monto) {
    if (monto > 0) {
      _saldo += monto;
    }
  }

  double obtenerSaldo() {
    return _saldo;
  }
}
''',
    });

    // Detalle para 'Herencia'
    await db.insert('detail', {
      'id': 86,
      'subtopic_id': 's03t03l07',
      'module': 'Jr',
      'definition': 'La herencia en POO es un mecanismo que permite crear nuevas clases basadas en clases existentes, reutilizando su código y extendiendo su funcionalidad.\n\n'
          '¿Qué es la herencia y por qué es importante? 🧬\n\n'
          'La herencia permite definir una clase base (superclase) y luego crear clases derivadas (subclases) que heredan sus atributos y métodos. Por ejemplo, puedes tener una clase `Vehiculo` y luego crear clases como `Coche` y `Moto` que hereden de ella.\n\n'
          'Esto promueve la reutilización del código y facilita la organización de clases relacionadas.\n\n'
          'La herencia es una herramienta poderosa para crear jerarquías de clases y evitar la duplicación de código.',
      'img_url': '',
      'code_example': '''
// Ejemplo de herencia
class Vehiculo {
  void arrancar() {
   debugPrint("Vehículo arrancado");
  }
}

class Coche extends Vehiculo {
  @override
  void arrancar() {
   debugPrint("Coche arrancado");
  }
}
''',
    });

    // Detalle para 'Polimorfismo'
    await db.insert('detail', {
      'id': 87,
      'subtopic_id': 's04t03l07',
      'module': 'Jr',
      'definition': 'El polimorfismo en POO es la capacidad de que objetos de diferentes clases se comporten de manera similar cuando se usan a través de una interfaz común.\n\n'
          '¿Qué es el polimorfismo y por qué es importante? 🎭\n\n'
          'El polimorfismo permite que una misma operación se comporte de manera diferente según el objeto que la ejecuta. Por ejemplo, puedes tener un método `hacerSonido` que se comporte de manera diferente en clases como `Perro` y `Gato`.\n\n'
          'Esto se logra mediante la herencia y la sobrescritura de métodos, o mediante interfaces.\n\n'
          'El polimorfismo es esencial para crear sistemas flexibles y extensibles.',
      'img_url': '',
      'code_example': '''
// Ejemplo de polimorfismo
class Animal {
  void hacerSonido() {
   debugPrint("Sonido genérico");
  }
}

class Perro extends Animal {
  @override
  void hacerSonido() {
   debugPrint("Guau guau");
  }
}

class Gato extends Animal {
  @override
  void hacerSonido() {
   debugPrint("Miau");
  }
}

void main() {
  Animal miAnimal = Perro();
  miAnimal.hacerSonido(); // Guau guau

  miAnimal = Gato();
  miAnimal.hacerSonido(); // Miau
}
''',
    });
  }

  Future<void> _insertDetailsJrTopic4Level7(db) async {
    // Detalle para 'Cambiar el color de un auto'
    await db.insert('detail', {
      'id': 88, // Asegúrate de que este ID sea único
      'subtopic_id': 's01t04l07', // Subtopic 'Cambiar el color de un auto'
      'module': 'Jr',
      'definition':
          'En programación orientada a objetos (POO), podemos modelar un auto como un objeto con propiedades como color, marca y modelo. Un método para cambiar el color del auto permite modificar esta propiedad de manera dinámica.\n\n'
              'En otras palabras... 😅\n\n'
              'Imaginemos que tienes un auto de juguete y decides pintarlo de otro color. En POO, esto se traduce en un método que actualiza la propiedad "color" del objeto "Auto". Por ejemplo, si el auto es rojo y lo cambias a azul, el método se encarga de hacer esa actualización.\n\n'
              'Este es un ejemplo práctico de cómo la POO nos permite manipular objetos del mundo real en código. ¡Es como ser el dueño de un taller de pintura de autos virtual! 🚗🎨',
      'img_url': '',
      'code_example': '''
class Auto {
  String marca;
  String modelo;
  String color;

  Auto(this.marca, this.modelo, this.color);

  void cambiarColor(String nuevoColor) {
    this.color = nuevoColor;
   debugPrint("El auto ahora es de color: \$color");
  }
}

void main() {
  Auto miAuto = Auto("Toyota", "Corolla", "Rojo");
 debugPrint("Color actual: \${miAuto.color}"); // Output: Rojo
  miAuto.cambiarColor("Azul");            // Cambia el color a Azul
 debugPrint("Nuevo color: \${miAuto.color}"); // Output: Azul
}
''',
    });

// Detalle para 'Jerarquías de vehículos'
    await db.insert('detail', {
      'id': 89, // Asegúrate de que este ID sea único
      'subtopic_id': 's02t04l07', // Subtopic 'Jerarquías de vehículos'
      'module': 'Jr',
      'definition':
          'En POO, las jerarquías de vehículos son un ejemplo clásico de herencia. Podemos crear una clase base "Vehículo" y luego derivar clases más específicas como "Auto", "Moto" o "Camión".\n\n'
              '¿Te quedaron dudas? 🤔\n\n'
              'Piensa en una familia de vehículos. Todos tienen características comunes, como una marca y un modelo, pero también tienen diferencias. Por ejemplo, un auto tiene puertas, mientras que una moto tiene un manillar. La herencia nos permite reutilizar código y organizar las clases de manera lógica.\n\n'
              'Este enfoque es útil para modelar relaciones del mundo real en código. ¡Es como crear un árbol genealógico de vehículos! 🌳🚗🏍️',
      'img_url': '',
      'code_example': '''
class Vehiculo {
  String marca;
  String modelo;

  Vehiculo(this.marca, this.modelo);

  void describir() {
   debugPrint("\$marca \$modelo");
  }
}

class Auto extends Vehiculo {
  int numPuertas;

  Auto(String marca, String modelo, this.numPuertas) : super(marca, modelo);

  @override
  void describir() {
   debugPrint("\$marca \$modelo con \$numPuertas puertas");
  }
}

class Moto extends Vehiculo {
  String tipo;

  Moto(String marca, String modelo, this.tipo) : super(marca, modelo);

  @override
  void describir() {
   debugPrint("\$marca \$modelo, Tipo: \$tipo");
  }
}

void main() {
  Auto miAuto = Auto("Ford", "Mustang", 2);
  Moto miMoto = Moto("Yamaha", "MT-07", "Deportiva");

  miAuto.describir(); // Output: Ford Mustang con 2 puertas
  miMoto.describir(); // Output: Yamaha MT-07, Tipo: Deportiva
}
''',
    });

    // Detalle para 'Implementación de interfaces'
    await db.insert('detail', {
      'id': 90, // Asegúrate de que este ID sea único
      'subtopic_id': 's03t04l07', // Subtopic 'Implementación de interfaces'
      'module': 'Jr',
      'definition':
          'En POO, las interfaces son contratos que definen qué métodos debe implementar una clase. En Dart, no existen interfaces como tal, pero se pueden simular usando clases abstractas.\n\n'
              'En otras palabras... 😅\n\n'
              'Imaginemos que estás construyendo un robot. Le das un manual de instrucciones que dice: "Debes poder caminar y hablar". Cualquier robot que siga este manual debe implementar esas acciones. En programación, las interfaces funcionan de manera similar: definen un conjunto de métodos que las clases deben implementar.\n\n'
              'Este enfoque es útil para garantizar que ciertas clases cumplan con un estándar. ¡Es como darle un contrato a tus objetos! 📜🤖',
      'img_url': '',
      'code_example': '''
abstract class Vehiculo {
  void arrancar();
  void detener();
}

class Auto implements Vehiculo {
  @override
  void arrancar() {
   debugPrint("El auto está arrancando...");
  }

  @override
  void detener() {
   debugPrint("El auto se ha detenido.");
  }
}

class Moto implements Vehiculo {
  @override
  void arrancar() {
   debugPrint("La moto está arrancando...");
  }

  @override
  void detener() {
   debugPrint("La moto se ha detenido.");
  }
}

void main() {
  Auto miAuto = Auto();
  Moto miMoto = Moto();

  miAuto.arrancar(); // Output: El auto está arrancando...
  miMoto.detener();  // Output: La moto se ha detenido.
}
''',
    });
  }

  Future<void> insertDetailsJrLevel8(Database db) async {
    try {
      await _insertDetailsJrTopic1Level8(db);
      await _insertDetailsJrTopic2Level8(db);
    } catch (e) {
      debugPrint("Error inserting details jr level 8: $e");
    }
  }

  Future<void> _insertDetailsJrTopic1Level8(db) async {
    // Detalle para 'Introducción a las pruebas de widgets'
    await db.insert('detail', {
      'id': 91,
      'subtopic_id': 's01t01l08',
      'module': 'Jr',
      'definition':
          'Las pruebas de widgets son esenciales para garantizar que la interfaz de usuario de tu aplicación funcione correctamente. Estas pruebas verifican que los widgets se rendericen y se comporten como se espera.\n\n'
              'En otras palabras... 😅\n\n'
              'Imaginemos que estás construyendo una casa y quieres asegurarte de que todas las puertas y ventanas funcionen correctamente. Las pruebas de widgets son como un inspector que revisa cada parte de la casa para asegurarse de que todo esté en orden. En Flutter, este "inspector" es el `WidgetTester`, que te permite probar y validar tus widgets de manera automatizada.\n\n'
              '¡Las pruebas de widgets son tu mejor aliado para evitar sorpresas desagradables en producción! 🛠️🏠',
      'img_url': '',
      'code_example': '''
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/main.dart';

void main() {
  testWidgets('Prueba de renderizado del widget', (WidgetTester tester) async {
    // Construye el widget
    await tester.pumpWidget(MyApp());

    // Verifica que el texto "Hola, Mundo" esté presente
    expect(find.text('Hola, Mundo'), findsOneWidget);
  });
}
''',
    });

    // Detalle para 'Uso de WidgetTester para pruebas de interfaz'
    await db.insert('detail', {
      'id': 92, // Siguiente ID
      'subtopic_id': 's02t01l08', // Subtopic 02, Topic 01, Level 08
      'module': 'Jr',
      'definition':
          'El `WidgetTester` es una herramienta poderosa en Flutter para realizar pruebas de interfaz. Te permite interactuar con los widgets y verificar su comportamiento.\n\n'
              '¿Te quedaron dudas? 🤔\n\n'
              'Piensa en `WidgetTester` como un control remoto que te permite manipular y probar tus widgets. Puedes simular toques, deslizamientos y otras interacciones para asegurarte de que todo funcione como debería.\n\n'
              'Por ejemplo, puedes usar `WidgetTester` para verificar que un botón cambie de color al ser presionado o que un texto aparezca después de una acción. ¡Es como tener un laboratorio de pruebas para tus widgets! 🧪🔬',
      'img_url': '',
      'code_example': '''
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/main.dart';

void main() {
  testWidgets('Prueba de interacción con un botón', (WidgetTester tester) async {
    // Construye el widget
    await tester.pumpWidget(MyApp());

    // Simula un toque en el botón
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump(); // Actualiza el estado del widget

    // Verifica que el texto "Botón presionado" esté presente
    expect(find.text('Botón presionado'), findsOneWidget);
  });
}
''',
    });

    // Detalle para 'Pruebas de interacción con widgets'
    await db.insert('detail', {
      'id': 93, // Siguiente ID
      'subtopic_id': 's03t01l08', // Subtopic 03, Topic 01, Level 08
      'module': 'Jr',
      'definition':
          'Las pruebas de interacción con widgets verifican cómo los widgets responden a las acciones del usuario, como toques, deslizamientos o entradas de texto.\n\n'
              'En otras palabras... 😅\n\n'
              'Imaginemos que tienes una aplicación con un formulario. Quieres asegurarte de que, cuando el usuario escriba su nombre y presione un botón, el nombre se muestre correctamente en la pantalla. Las pruebas de interacción te permiten simular estas acciones y verificar que todo funcione como se espera.\n\n'
              '¡Estas pruebas son clave para garantizar una experiencia de usuario fluida y sin errores! 🖱️📱',
      'img_url': '',
      'code_example': '''
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/main.dart';

void main() {
  testWidgets('Prueba de interacción con un campo de texto', (WidgetTester tester) async {
    // Construye el widget
    await tester.pumpWidget(MyApp());

    // Simula la entrada de texto
    await tester.enterText(find.byType(TextField), 'Juan');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump(); // Actualiza el estado del widget

    // Verifica que el texto "Hola, Juan" esté presente
    expect(find.text('Hola, Juan'), findsOneWidget);
  });
}
''',
    });
  }

  Future<void> _insertDetailsJrTopic2Level8(db) async {
    // Detalle para 'Introducción a las pruebas unitarias'
    await db.insert('detail', {
      'id': 94,
      'subtopic_id': 's01t02l08',
      'module': 'Jr',
      'definition':
          'Las pruebas unitarias son pruebas que verifican el comportamiento de una función o método específico en tu código. Son esenciales para garantizar que cada parte de tu aplicación funcione correctamente.\n\n'
              'En otras palabras... 😅\n\n'
              'Imaginemos que estás construyendo un reloj. Las pruebas unitarias son como probar cada engranaje por separado para asegurarte de que funcione correctamente antes de ensamblar todo el reloj. En programación, esto significa probar funciones y métodos de manera aislada para detectar errores temprano.\n\n'
              '¡Las pruebas unitarias son tu primera línea de defensa contra los bugs! 🐛🛡️',
      'img_url': '',
      'code_example': '''
import 'package:test/test.dart';

int sumar(int a, int b) {
  return a + b;
}

void main() {
  test('Prueba de la función sumar', () {
    expect(sumar(2, 3), equals(5));
  });
}
''',
    });

    // Detalle para 'Uso de test y expect en pruebas unitarias'
    await db.insert('detail', {
      'id': 95, // Siguiente ID
      'subtopic_id': 's02t02l08', // Subtopic 02, Topic 02, Level 08
      'module': 'Jr',
      'definition':
          'En Dart, las pruebas unitarias se escriben usando las funciones `test` y `expect`. `test` define una prueba, mientras que `expect` verifica que el resultado sea el esperado.\n\n'
              '¿Te quedaron dudas? 🤔\n\n'
              'Piensa en `test` como un escenario que defines para probar algo, y en `expect` como la afirmación que haces sobre el resultado. Por ejemplo, si pruebas una función que suma dos números, usas `expect` para verificar que el resultado sea correcto.\n\n'
              '¡Estas herramientas son fundamentales para escribir pruebas claras y efectivas! 🧪✅',
      'img_url': '',
      'code_example': '''
import 'package:test/test.dart';

int multiplicar(int a, int b) {
  return a * b;
}

void main() {
  test('Prueba de la función multiplicar', () {
    expect(multiplicar(2, 3), equals(6));
  });
}
''',
    });

    // Detalle para 'Pruebas de funciones y métodos en Dart'
    await db.insert('detail', {
      'id': 96, // Siguiente ID
      'subtopic_id': 's03t02l08', // Subtopic 03, Topic 02, Level 08
      'module': 'Jr',
      'definition':
          'Las pruebas de funciones y métodos en Dart te permiten verificar que cada parte de tu lógica de negocio funcione correctamente. Esto incluye funciones simples, métodos de clases y más.\n\n'
              'En otras palabras... 😅\n\n'
              'Imaginemos que tienes una función que calcula el descuento de un producto. Con las pruebas unitarias, puedes verificar que la función devuelva el descuento correcto para diferentes precios y porcentajes. Esto te da confianza en que tu lógica es sólida y libre de errores.\n\n'
              '¡Prueba todo, desde las funciones más simples hasta las más complejas! 🧮🔍',
      'img_url': '',
      'code_example': '''
import 'package:test/test.dart';

double calcularDescuento(double precio, double descuento) {
  return precio - (precio * descuento / 100);
}

void main() {
  test('Prueba de la función calcularDescuento', () {
    expect(calcularDescuento(100, 10), equals(90));
    expect(calcularDescuento(200, 20), equals(160));
  });
}
''',
    });
  }

  Future<void> insertDetailsJrLevel9(Database db) async {
    try {
      await _insertDetailsJrTopic1Level9(db);
      await _insertDetailsJrTopic2Level9(db);
    } catch (e) {
      debugPrint("Error inserting details jr level 9: $e");
    }
  }

  Future<void> _insertDetailsJrTopic1Level9(db) async {
    // Detalle para 'Preparación de una aplicación para la App Store'
    await db.insert('detail', {
      'id': 97,
      'subtopic_id': 's01t01l09',
      'module': 'Jr',
      'definition':
          'Preparar una aplicación para la App Store implica varios pasos, como configurar el proyecto en Xcode, agregar íconos y pantallas de inicio, y asegurarse de que la aplicación cumpla con las pautas de Apple.\n\n'
              'este proceso es crucial para garantizar que tu aplicación esté lista para ser revisada y publicada. Necesitarás un identificador de aplicación (App ID), un perfil de aprovisionamiento y un certificado de distribución.\n\n'
              '¡Sigue cada paso cuidadosamente para evitar problemas durante la revisión! 🍏📱',
      'img_url': '',
      'code_example': '''
1. Abre Xcode y selecciona tu proyecto.
2. Ve a "Signing & Capabilities" y configura tu equipo de desarrollo.
3. Asegúrate de que el "Bundle Identifier" sea único.
4. Agrega íconos y pantallas de inicio en el apartado "Assets".
''',
    });

    // Detalle para 'Creación de un certificado de distribución'
    await db.insert('detail', {
      'id': 98,
      'subtopic_id': 's02t01l09',
      'module': 'Jr',
      'definition':
          'Un certificado de distribución es necesario para firmar tu aplicación antes de subirla a la App Store. Este certificado garantiza que la aplicación proviene de un desarrollador autorizado.\n\n'
              'Veamos mejor un ejemplo: para crear un certificado, debes usar Apple Developer. Ve a "Certificates, Identifiers & Profiles", selecciona "Certificates" y sigue los pasos para generar un certificado de distribución.\n\n'
              '¡Este paso es esencial para que tu aplicación pueda ser distribuida en la App Store! 📜🔐',
      'img_url': '',
      'code_example': '''
1. Inicia sesión en Apple Developer.
2. Ve a "Certificates, Identifiers & Profiles".
3. Selecciona "Certificates" y haz clic en "+".
4. Elige "iOS Distribution" y sigue las instrucciones.
''',
    });

    // Detalle para 'Subida de una aplicación a la App Store'
    await db.insert('detail', {
      'id': 99,
      'subtopic_id': 's03t01l09',
      'module': 'Jr',
      'definition':
          'Subir una aplicación a la App Store es el último paso para publicarla. Esto implica crear un registro en App Store Connect, archivar la aplicación en Xcode y subirla usando Xcode o Application Loader.\n\n'
              'Expliquemos esto en otras palabras: una vez que tu aplicación esté lista, debes crear un nuevo registro en App Store Connect, archivar la aplicación en Xcode y luego subirla para su revisión.\n\n'
              '¡Este es el momento en que tu aplicación está lista para llegar a millones de usuarios! 🚀📲',
      'img_url': '',
      'code_example': '''
1. Crea un nuevo registro en App Store Connect.
2. En Xcode, selecciona "Product" > "Archive".
3. Una vez archivada, selecciona "Distribute App" y sigue los pasos.
4. Sube la aplicación y espera la revisión de Apple.
''',
    });
  }

  Future<void> _insertDetailsJrTopic2Level9(db) async {
    // Detalle para 'Preparación de una aplicación para la Play Store'
    await db.insert('detail', {
      'id': 100,
      'subtopic_id': 's01t02l09',
      'module': 'Jr',
      'definition':
          'Preparar una aplicación para la Play Store implica configurar el proyecto en Android Studio, generar un APK o AAB firmado, y asegurarse de que la aplicación cumpla con las políticas de Google.\n\n'
              'este proceso incluye la creación de un ícono adecuado, la configuración de permisos y la generación de un archivo firmado para su distribución.\n\n'
              '¡Sigue cada paso cuidadosamente para evitar problemas durante la publicación! 🤖📱',
      'img_url': '',
      'code_example': '''
1. Abre Android Studio y selecciona tu proyecto.
2. Configura el ícono de la aplicación en "res/mipmap".
3. Genera un APK o AAB firmado desde "Build" > "Generate Signed Bundle / APK".
''',
    });

    // Detalle para 'Creación de un keystore para firma'
    await db.insert('detail', {
      'id': 101,
      'subtopic_id': 's02t02l09',
      'module': 'Jr',
      'definition':
          'Un keystore es un archivo que contiene claves privadas y certificados necesarios para firmar tu aplicación. Es esencial para garantizar la autenticidad de la aplicación en la Play Store.\n\n'
              'Veamos mejor un ejemplo: puedes crear un keystore usando Android Studio. Ve a "Build" > "Generate Signed Bundle / APK" y sigue los pasos para generar un nuevo keystore.\n\n'
              '¡Guarda este archivo en un lugar seguro, ya que es necesario para futuras actualizaciones! 🔑📂',
      'img_url': '',
      'code_example': '''
1. En Android Studio, ve a "Build" > "Generate Signed Bundle / APK".
2. Selecciona "APK" o "Android App Bundle".
3. Haz clic en "Create new" para generar un keystore.
4. Completa los campos requeridos y guarda el keystore.
''',
    });

    // Detalle para 'Subida de una aplicación a la Play Store'
    await db.insert('detail', {
      'id': 102,
      'subtopic_id': 's03t02l09',
      'module': 'Jr',
      'definition':
          'Subir una aplicación a la Play Store es el último paso para publicarla. Esto implica crear un registro en Google Play Console, subir el APK o AAB firmado y completar la información de la lista.\n\n'
              'Expliquemos esto en otras palabras: una vez que tu aplicación esté lista, debes crear un nuevo registro en Google Play Console, subir el archivo firmado y completar los detalles de la lista, como descripción, capturas de pantalla y categoría.\n\n'
              '¡Este es el momento en que tu aplicación está lista para llegar a millones de usuarios en Android! 🚀📲',
      'img_url': '',
      'code_example': '''
1. Crea un nuevo registro en Google Play Console.
2. Sube el APK o AAB firmado en la sección "Release" > "Production".
3. Completa la información de la lista, como descripción y capturas de pantalla.
4. Envía la aplicación para su revisión.
''',
    });
  }
}
