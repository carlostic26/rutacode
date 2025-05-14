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
      'topic': 'Sintaxis Básica',
      'subtopic': 'Estructura de un programa Java',
      'definition': '''
Cuando te adentras en Java, lo primero que notarás es su estructura característica. Un programa típico en Java se compone de clases y métodos, siendo el método `main` el punto de entrada donde comienza la ejecución.

¿Te preguntas por qué es importante entender esta estructura? Porque dominarla te permite organizar tu código de manera lógica y eficiente, facilitando su mantenimiento y escalabilidad.

En Java, todo el código reside dentro de clases. El método `main` se define como `public static void main(String[] args)`, y es donde se inicia la ejecución del programa. Comprender esta estructura básica es esencial para escribir programas funcionales y bien organizados.
''',
      'code_example': '''
// Comentario: Programa básico en Java
public class MiPrograma {
    public static void main(String[] args) {
        System.out.println("¡Hola, mundo!");
    }
}
'''
    });

    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 1,
      'topic': 'Sintaxis Básica',
      'subtopic': 'Comentarios',
      'definition': '''
Los comentarios en Java son anotaciones que el compilador ignora, pero que son fundamentales para documentar y explicar el código. Existen dos tipos principales: de una sola línea y de múltiples líneas.

¿Te preguntas cómo y cuándo usarlos? Utiliza comentarios para describir la funcionalidad de bloques de código, explicar decisiones de diseño o dejar recordatorios para ti o tus compañeros de equipo.

- Comentarios de una sola línea: se inician con `//` y se extienden hasta el final de la línea.
- Comentarios de múltiples líneas: se encierran entre `/*` y `*/`, y pueden abarcar varias líneas.

Un uso adecuado de los comentarios mejora la legibilidad y mantenibilidad del código.
''',
      'code_example': '''
// Este es un comentario de una sola línea

/*
Este es un comentario
de múltiples líneas
*/
'''
    });

    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 1,
      'topic': 'Sintaxis Básica',
      'subtopic': 'Puntos y comas',
      'definition': '''
En Java, el punto y coma (`;`) es un elemento esencial que indica el final de una instrucción. Es similar al punto al final de una oración en lenguaje natural.

¿Te has preguntado por qué es necesario? Porque sin él, el compilador no puede determinar dónde termina una instrucción, lo que puede provocar errores de compilación.

Cada declaración en Java debe terminar con un punto y coma. Omitirlo puede resultar en errores que impidan la compilación del programa.
''',
      'code_example': '''
int numero = 5; // Correcto

int numero = 5 // Incorrecto: falta el punto y coma
'''
    });

    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 1,
      'topic': 'Sintaxis Básica',
      'subtopic': 'Bloques de código',
      'definition': '''
Los bloques de código en Java se definen utilizando llaves `{}` y agrupan un conjunto de instrucciones que se ejecutan juntas. Son fundamentales para estructurar el código y definir ámbitos.

¿Te preguntas cómo se utilizan? Por ejemplo, en estructuras de control como `if`, `for` o en la definición de métodos y clases, los bloques de código determinan qué instrucciones pertenecen a cada estructura.

Usar bloques de código correctamente es crucial para la claridad y el funcionamiento adecuado del programa.
''',
      'code_example': '''
if (condicion) {
    // Bloque de código que se ejecuta si la condición es verdadera
    System.out.println("Condición verdadera");
}
'''
    });

    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 1,
      'topic': 'Tipos de Datos y Variables',
      'subtopic': 'Tipos primitivos',
      'definition': '''
Java ofrece varios tipos de datos primitivos que representan valores simples y no objetos. Estos incluyen:

- `int`: enteros (por ejemplo, 10, -5)
- `double`: números de punto flotante (por ejemplo, 3.14)
- `boolean`: valores lógicos (`true` o `false`)
- `char`: caracteres individuales (por ejemplo, 'A')

¿Te preguntas por qué son importantes? Porque son la base para almacenar y manipular datos simples en tus programas.

Elegir el tipo de dato adecuado es esencial para optimizar el uso de memoria y garantizar la precisión de los cálculos.
''',
      'code_example': '''
int edad = 30;
double altura = 1.75;
boolean esEstudiante = true;
char inicial = 'J';
'''
    });

    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 1,
      'topic': 'Tipos de Datos y Variables',
      'subtopic': 'Tipos de referencia',
      'definition': '''
Los tipos de referencia en Java son aquellos que hacen referencia a objetos en la memoria. A diferencia de los tipos primitivos, que almacenan valores directamente, los tipos de referencia almacenan direcciones de memoria donde se encuentran los objetos.

¿Te preguntas cuáles son? Algunos ejemplos incluyen:

- `String`: cadenas de texto
- `Arrays`: arreglos de elementos
- Clases personalizadas que defines en tu programa

Comprender la diferencia entre tipos primitivos y de referencia es crucial para manejar correctamente la memoria y evitar errores comunes como `NullPointerException`.
''',
      'code_example': '''
String nombre = "Ana";
int[] numeros = {1, 2, 3, 4, 5};
MiClase objeto = new MiClase();
'''
    });

    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 1,
      'topic': 'Tipos de Datos y Variables',
      'subtopic': 'Declaración e inicialización de variables',
      'definition': '''
En Java, declarar una variable significa reservar un espacio en memoria para almacenar un tipo específico de dato, mientras que inicializarla es asignarle un valor por primera vez. Ambas acciones son fundamentales para trabajar con datos en tus programas.

¿Te preguntas cómo hacerlo correctamente? Puedes declarar e inicializar una variable en una sola línea o por separado.

Por ejemplo:
- Declaración y inicialización en una línea: `int edad = 25;`
- Declaración y luego inicialización: 
  ```java
  int edad;
  edad = 25;
Es importante inicializar las variables antes de usarlas para evitar errores de compilación. Además, elegir el tipo de dato adecuado asegura que la variable almacene la información correctamente y optimice el uso de memoria.
''',
      'code_example': '''
int edad = 25; // Declaración e inicialización en una línea

int altura; // Declaración
altura = 170; // Inicialización posterior
'''
    });

    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 1,
      'topic': 'Tipos de Datos y Variables',
      'subtopic': 'Ámbito de variables',
      'definition': '''
El ámbito de una variable en Java determina dónde puede ser accedida o modificada dentro de tu código. Comprender los diferentes ámbitos es esencial para evitar errores y escribir código limpio y mantenible.

¿Te preguntas qué tipos de ámbitos existen? Principalmente, hay tres:

- **Variables locales**: Declaradas dentro de un método o bloque, solo son accesibles dentro de ese contexto.
- **Variables de instancia**: Declaradas dentro de una clase pero fuera de cualquier método, pertenecen a una instancia específica de la clase.
- **Variables de clase (estáticas)**: Declaradas con la palabra clave `static`, pertenecen a la clase en sí y son compartidas por todas las instancias.

Conocer el ámbito de tus variables te ayuda a controlar su visibilidad y duración, lo que es crucial para evitar conflictos y errores inesperados.
''',
      'code_example': '''
public class EjemploAmbito {
    int variableDeInstancia = 10; // Variable de instancia

    static int variableDeClase = 20; // Variable de clase

    public void metodo() {
        int variableLocal = 30; // Variable local
        System.out.println("Variable local: " + variableLocal);
        System.out.println("Variable de instancia: " + variableDeInstancia);
        System.out.println("Variable de clase: " + variableDeClase);
    }
}
'''
    });

    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 1,
      'topic': 'Operadores',
      'subtopic': 'Operadores aritméticos (+, -, *, /, %)',
      'definition': '''
En Java, los operadores aritméticos permiten realizar operaciones matemáticas básicas, como suma, resta, multiplicación, división y módulo (residuo de una división).

¿Te preguntas cómo se utilizan? Aquí tienes los principales operadores aritméticos:
- `+` Suma: Añade dos valores.
- `-` Resta: Sustrae el segundo valor del primero.
- `*` Multiplicación: Multiplica dos valores.
- `/` División: Divide el primer valor por el segundo.
- `%` Módulo: Devuelve el residuo de la división del primer valor por el segundo.

Estos operadores son fundamentales para realizar cálculos en tus programas.
''',
      'code_example': '''
int a = 10;
int b = 3;

int suma = a + b;        // Resultado: 13
int resta = a - b;       // Resultado: 7
int multiplicacion = a * b; // Resultado: 30
int division = a / b;    // Resultado: 3
int modulo = a % b;      // Resultado: 1
'''
    });

    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 1,
      'topic': 'Operadores',
      'subtopic': 'Operadores de comparación (==, !=, >, <, etc.)',
      'definition': '''
Los operadores de comparación en Java se utilizan para comparar dos valores y devolver un resultado booleano: `true` si la comparación es verdadera, o `false` si es falsa.

¿Te preguntas cuáles son estos operadores? Aquí están:
- `==` Igual a: Devuelve `true` si ambos operandos son iguales.
- `!=` No igual a: Devuelve `true` si los operandos no son iguales.
- `>` Mayor que: Devuelve `true` si el operando izquierdo es mayor que el derecho.
- `<` Menor que: Devuelve `true` si el operando izquierdo es menor que el derecho.
- `>=` Mayor o igual que: Devuelve `true` si el operando izquierdo es mayor o igual que el derecho.
- `<=` Menor o igual que: Devuelve `true` si el operando izquierdo es menor o igual que el derecho.

Estos operadores son esenciales para tomar decisiones en tu código, como en estructuras condicionales.
''',
      'code_example': '''
int a = 5;
int b = 10;

System.out.println(a == b); // false
System.out.println(a != b); // true
System.out.println(a > b);  // false
System.out.println(a < b);  // true
System.out.println(a >= b); // false
System.out.println(a <= b); // true
'''
    });

    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 1,
      'topic': 'Operadores',
      'subtopic': 'Operadores lógicos (&&, ||, !)',
      'definition': '''
En Java, los operadores lógicos se utilizan para combinar expresiones booleanas y devolver un resultado booleano. Son fundamentales para construir condiciones más complejas.

¿Te preguntas cuáles son estos operadores? Aquí están:
- `&&` AND lógico: Devuelve `true` si ambas expresiones son verdaderas.
- `||` OR lógico: Devuelve `true` si al menos una de las expresiones es verdadera.
- `!` NOT lógico: Invierte el valor de una expresión booleana; `true` se convierte en `false` y viceversa.

Estos operadores son especialmente útiles en estructuras de control como `if`, `while` y `for`.
''',
      'code_example': '''
boolean a = true;
boolean b = false;

System.out.println(a && b); // false
System.out.println(a || b); // true
System.out.println(!a);     // false
'''
    });

    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 1,
      'topic': 'Operadores',
      'subtopic': 'Operadores de asignación (=, +=, -=, etc.)',
      'definition': '''
Los operadores de asignación en Java se utilizan para asignar valores a las variables. El operador de asignación básico es `=`, pero existen operadores compuestos que combinan asignación con otra operación.

¿Te preguntas cómo funcionan? Aquí tienes algunos ejemplos:
- `=` Asignación simple: Asigna el valor del operando derecho a la variable del operando izquierdo.
- `+=` Suma y asigna: Suma el valor del operando derecho al de la variable y asigna el resultado a la variable.
- `-=` Resta y asigna: Resta el valor del operando derecho al de la variable y asigna el resultado a la variable.
- `*=` Multiplica y asigna: Multiplica el valor de la variable por el del operando derecho y asigna el resultado a la variable.
- `/=` Divide y asigna: Divide el valor de la variable entre el del operando derecho y asigna el resultado a la variable.
- `%=` Módulo y asigna: Calcula el módulo del valor de la variable con el del operando derecho y asigna el resultado a la variable.

Estos operadores hacen que el código sea más conciso y legible.
''',
      'code_example': '''
int a = 10;

a += 5; // a = a + 5; Resultado: 15
a -= 3; // a = a - 3; Resultado: 12
a *= 2; // a = a * 2; Resultado: 24
a /= 4; // a = a / 4; Resultado: 6
a %= 5; // a = a % 5; Resultado: 1
'''
    });

    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 1,
      'topic': 'Estructuras de control',
      'subtopic': 'Sentencias condicionales (if, else if, else)',
      'definition': '''
Las sentencias condicionales en Java permiten ejecutar diferentes bloques de código según ciertas condiciones. Son fundamentales para controlar el flujo de un programa.

¿Te preguntas cómo funcionan? Aquí tienes una explicación:
- `if`: Evalúa una condición; si es verdadera, ejecuta el bloque de código asociado.
- `else if`: Se evalúa si la condición anterior fue falsa; permite verificar múltiples condiciones.
- `else`: Se ejecuta si ninguna de las condiciones anteriores fue verdadera.

Estas estructuras permiten que tu programa tome decisiones y responda de manera diferente según las circunstancias.
''',
      'code_example': '''
int numero = 10;

if (numero > 0) {
    System.out.println("El número es positivo.");
} else if (numero < 0) {
    System.out.println("El número es negativo.");
} else {
    System.out.println("El número es cero.");
}
'''
    });

    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 1,
      'topic': 'Estructuras de control',
      'subtopic': 'Sentencia switch-case',
      'definition': '''
La sentencia `switch` en Java permite seleccionar entre múltiples bloques de código a ejecutar, basándose en el valor de una expresión.

¿Te preguntas cuándo usar `switch`? Es útil cuando se tienen múltiples condiciones que dependen del valor de una misma variable.

La estructura básica es:
- `switch`: Evalúa una expresión.
- `case`: Define un bloque de código que se ejecuta si la expresión coincide con el valor especificado.
- `break`: Finaliza la ejecución del `switch`.
- `default`: Se ejecuta si ninguna de las condiciones anteriores se cumple.

Esta estructura mejora la legibilidad cuando se manejan múltiples condiciones relacionadas.
''',
      'code_example': '''
int dia = 3;
String nombreDia;

switch (dia) {
    case 1:
        nombreDia = "Lunes";
        break;
    case 2:
        nombreDia = "Martes";
        break;
    case 3:
        nombreDia = "Miércoles";
        break;
    default:
        nombreDia = "Día no válido";
        break;
}

System.out.println("El día es: " + nombreDia);
'''
    });

    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 1,
      'topic': 'Estructuras de control',
      'subtopic': 'Bucles (for, while, do-while)',
      'definition': '''
Los bucles en Java permiten ejecutar un bloque de código repetidamente mientras se cumpla una condición.

¿Te preguntas qué tipos de bucles existen? Aquí están:
- `for`: Se utiliza cuando se conoce de antemano cuántas veces se debe ejecutar el bloque de código.
- `while`: Se ejecuta mientras una condición sea verdadera; se evalúa antes de cada iteración.
- `do-while`: Similar al `while`, pero la condición se evalúa después de ejecutar el bloque de código al menos una vez.

Estos bucles son esenciales para tareas repetitivas y para recorrer estructuras de datos.
''',
      'code_example': '''
// Bucle for
for (int i = 0; i < 5; i++) {
    System.out.println("Iteración for: " + i);
}

// Bucle while
int j = 0;
while (j < 5) {
    System.out.println("Iteración while: " + j);
    j++;
}

// Bucle do-while
int k = 0;
do {
    System.out.println("Iteración do-while: " + k);
    k++;
} while (k < 5);
'''
    });

    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 1,
      'topic': 'Estructuras de control',
      'subtopic': 'Break y continue',
      'definition': '''
En Java, las sentencias `break` y `continue` se utilizan para controlar el flujo de los bucles, permitiéndote salir anticipadamente de un bucle o saltar a la siguiente iteración según ciertas condiciones.

¿Te preguntas cómo y cuándo usar estas sentencias? Aquí te lo explico:

- `break`: Se utiliza para salir inmediatamente de un bucle, sin esperar a que la condición del bucle se evalúe como falsa. Es útil cuando se ha alcanzado un resultado deseado y no es necesario continuar iterando.

- `continue`: Se emplea para saltar la iteración actual del bucle y continuar con la siguiente. Es útil cuando, bajo ciertas condiciones, no se desea ejecutar el resto del código dentro del bucle para esa iteración específica.

Estas sentencias son herramientas poderosas para controlar el flujo de tus programas y hacerlos más eficientes y legibles.
''',
      'code_example': '''
// Uso de break
for (int i = 1; i <= 10; i++) {
    if (i == 5) {
        break; // Sale del bucle cuando i es igual a 5
    }
    System.out.println("Valor de i: " + i);
}
// Salida: Valor de i: 1
//         Valor de i: 2
//         Valor de i: 3
//         Valor de i: 4

// Uso de continue
for (int i = 1; i <= 5; i++) {
    if (i == 3) {
        continue; // Salta la iteración cuando i es igual a 3
    }
    System.out.println("Valor de i: " + i);
}
// Salida: Valor de i: 1
//         Valor de i: 2
//         Valor de i: 4
//         Valor de i: 5
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
