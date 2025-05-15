import 'package:sqflite/sqflite.dart';

class InsertJavaData {
  static Future<void> insertJavaData(Database db) async {
    await _insertJrLevelData(db);
    await _insertMidLevelData(db);
    // await _insertSrLevelData(db);
  }

  static Future<void> _insertJrLevelData(Database db) async {
    await _insertJrLevel1Data(db);
    await _insertJrLevel2Data(db);
    await _insertJrLevel3Data(db);
  }

  static Future<void> _insertJrLevel1Data(Database db) async {
    // Ejemplo de inserción para nivel Junior
    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 1,
      'tittle_level': 'Fundamentos de Java',
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
      'tittle_level': 'Fundamentos de Java',
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
      'tittle_level': 'Fundamentos de Java',
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
      'tittle_level': 'Fundamentos de Java',
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
      'tittle_level': 'Fundamentos de Java',
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
      'tittle_level': 'Fundamentos de Java',
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
      'tittle_level': 'Fundamentos de Java',
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
      'tittle_level': 'Fundamentos de Java',
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
      'tittle_level': 'Fundamentos de Java',
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
      'tittle_level': 'Fundamentos de Java',
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
      'tittle_level': 'Fundamentos de Java',
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
      'tittle_level': 'Fundamentos de Java',
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
      'tittle_level': 'Fundamentos de Java',
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
      'tittle_level': 'Fundamentos de Java',
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
      'tittle_level': 'Fundamentos de Java',
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
      'tittle_level': 'Fundamentos de Java',
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

  static Future<void> _insertJrLevel2Data(Database db) async {
    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 2,
      'title_level': 'Programación Orientada a Objetos (POO)',
      'topic': 'Clases y Objetos',
      'subtopic': 'Definición de clases',
      'definition': '''
Una clase en Java es como el plano de un edificio: define cómo serán los objetos que se construyan a partir de ella. Es decir, especifica qué atributos (datos) y métodos (comportamientos) tendrán esos objetos.

¿Pero entonces qué significa eso?

Pensemos por un momento en una clase `Persona`. Esta clase puede tener atributos como `nombre` y `edad`, y métodos como `saludar()`. Al crear un objeto de la clase `Persona`, ese objeto tendrá su propio `nombre` y `edad`, y podrá ejecutar el método `saludar()`.

En resumen, una clase es una plantilla que define la estructura y el comportamiento de los objetos. Al crear una instancia de la clase (un objeto), este tendrá las características y comportamientos definidos en la clase.
''',
      'code_example': '''
public class Persona {
    String nombre;
    int edad;

    void saludar() {
        System.out.println("Hola, mi nombre es " + nombre);
    }
}
'''
    });

    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 2,
      'title_level': 'Programación Orientada a Objetos (POO)',
      'topic': 'Clases y Objetos',
      'subtopic': 'Creación de objetos',
      'definition': '''
En Java, un objeto es una instancia de una clase. Para crear un objeto, se utiliza la palabra clave `new` seguida del constructor de la clase. Esto asigna memoria para el nuevo objeto y llama al constructor correspondiente.

¿Te estás preguntando cómo se hace esto?

Supongamos que tienes una clase `Persona`. Para crear un objeto de esta clase, escribirías: `Persona persona1 = new Persona();`. Esto crea un nuevo objeto `persona1` de la clase `Persona`.

Una vez creado el objeto, puedes acceder a sus atributos y métodos utilizando el operador punto (`.`). Por ejemplo, `persona1.nombre = "Juan";` asigna el nombre "Juan" al objeto `persona1`.
''',
      'code_example': '''
Persona persona1 = new Persona();
persona1.nombre = "Juan";
persona1.edad = 30;
persona1.saludar(); // Salida: Hola, mi nombre es Juan
'''
    });

    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 2,
      'title_level': 'Programación Orientada a Objetos (POO)',
      'topic': 'Clases y Objetos',
      'subtopic': 'Atributos y métodos',
      'definition': '''
En Java, los atributos son variables que representan las características o propiedades de una clase, mientras que los métodos son funciones que definen el comportamiento de la clase.

¿Te estás preguntando cómo se utilizan?

Pensemos por un momento en una clase `Coche`. Esta clase puede tener atributos como `marca` y `velocidad`, y métodos como `acelerar()`. Los atributos almacenan el estado del objeto, y los métodos definen las acciones que el objeto puede realizar.

Por ejemplo, el método `acelerar()` podría aumentar la velocidad del coche en una cantidad determinada. Al crear un objeto de la clase `Coche`, este tendrá su propia `marca` y `velocidad`, y podrá ejecutar el método `acelerar()`.
''',
      'code_example': '''
public class Coche {
    String marca;
    int velocidad;

    void acelerar(int incremento) {
        velocidad += incremento;
    }
}
'''
    });

    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 2,
      'title_level': 'Programación Orientada a Objetos (POO)',
      'topic': 'Clases y Objetos',
      'subtopic': 'Constructores',
      'definition': '''
En Java, un constructor es un método especial que se utiliza para inicializar objetos. Tiene el mismo nombre que la clase y no tiene tipo de retorno. Los constructores se invocan automáticamente al crear un objeto con la palabra clave `new`.

¿Te estás preguntando por qué esto importa?

Pensemos por un momento en la clase `Persona`. Al definir un constructor que recibe parámetros, puedes crear objetos con valores iniciales específicos. Por ejemplo, `Persona persona1 = new Persona("Ana", 25);` crea un objeto `persona1` con el nombre "Ana" y la edad 25.

Los constructores son fundamentales para establecer el estado inicial de los objetos y garantizar que se creen con valores válidos.
''',
      'code_example': '''
public class Persona {
    String nombre;
    int edad;

    public Persona(String nombre, int edad) {
        this.nombre = nombre;
        this.edad = edad;
    }
}
'''
    });

    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 2,
      'title_level': 'Programación Orientada a Objetos (POO)',
      'topic': 'Prilares de la POO',
      'subtopic': 'Encapsulamiento (modificadores de acceso)',
      'definition': '''
El encapsulamiento es un principio de la POO que consiste en ocultar los detalles internos de una clase y exponer solo lo necesario a través de métodos públicos. En Java, esto se logra utilizando modificadores de acceso como `private` y `public`.

¿Te estás preguntando cómo se aplica esto?

Pensemos por un momento en una clase `CuentaBancaria` con un atributo `saldo`. Para proteger el acceso directo a `saldo`, lo declaramos como `private` y proporcionamos métodos `getSaldo()` y `depositar()` para acceder y modificar su valor de manera controlada.

Esto ayuda a mantener la integridad de los datos y evita modificaciones no deseadas desde fuera de la clase.
''',
      'code_example': '''
public class CuentaBancaria {
    private double saldo;

    public CuentaBancaria(double saldoInicial) {
        this.saldo = saldoInicial;
    }

    public double getSaldo() {
        return saldo;
    }

    public void depositar(double cantidad) {
        if (cantidad > 0) {
            saldo += cantidad;
        }
    }
}

// Uso
CuentaBancaria cuenta = new CuentaBancaria(1000);
cuenta.depositar(500);
System.out.println(cuenta.getSaldo()); // Salida: 1500.0
'''
    });

    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 2,
      'title_level': 'Programación Orientada a Objetos (POO)',
      'topic': 'Prilares de la POO',
      'subtopic': 'Herencia (extends, super)',
      'definition': '''
La herencia en Java permite que una clase (subclase) adquiera las propiedades y comportamientos de otra clase (superclase). Es una forma de reutilizar código y establecer una relación jerárquica entre clases.

¿Te estás preguntando cómo funciona esto?

Pensemos por un momento en una clase `Animal` que tiene un método `hacerSonido()`. Podemos crear una subclase `Perro` que herede de `Animal` y sobrescriba el método `hacerSonido()` para que imprima "Guau". De esta manera, `Perro` tiene acceso a los métodos y atributos de `Animal`, pero también puede tener sus propias implementaciones.

La herencia se logra utilizando la palabra clave `extends`. Es importante destacar que Java solo permite herencia simple, es decir, una clase solo puede heredar de una superclase.
''',
      'code_example': '''
public class Animal {
    void hacerSonido() {
        System.out.println("Sonido genérico");
    }
}

public class Perro extends Animal {
    @Override
    void hacerSonido() {
        System.out.println("Guau");
    }
}

// Uso
Perro miPerro = new Perro();
miPerro.hacerSonido(); // Salida: Guau
'''
    });

    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 2,
      'title_level': 'Programación Orientada a Objetos (POO)',
      'topic': 'Prilares de la POO',
      'subtopic': 'Polimorfismo (sobrecarga y sobrescritura)',
      'definition': '''
El polimorfismo en Java permite que un objeto adopte múltiples formas. Es decir, una referencia de tipo superclase puede apuntar a objetos de sus subclases, y al invocar métodos, se ejecutará la versión correspondiente al tipo real del objeto.

¿Te estás preguntando por qué esto es útil?

Pensemos por un momento en una clase `Animal` con un método `hacerSonido()`, y subclases como `Perro` y `Gato` que sobrescriben este método. Podemos tener un arreglo de `Animal` que contenga objetos `Perro` y `Gato`, y al iterar sobre ellos e invocar `hacerSonido()`, cada objeto ejecutará su propia implementación.

Esto proporciona flexibilidad y permite escribir código más general y reutilizable.
''',
      'code_example': '''
public class Animal {
    void hacerSonido() {
        System.out.println("Sonido genérico");
    }
}

public class Perro extends Animal {
    @Override
    void hacerSonido() {
        System.out.println("Guau");
    }
}

public class Gato extends Animal {
    @Override
    void hacerSonido() {
        System.out.println("Miau");
    }
}

// Uso
Animal[] animales = { new Perro(), new Gato() };
for (Animal animal : animales) {
    animal.hacerSonido();
}
// Salida:
// Guau
// Miau
'''
    });

    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 2,
      'title_level': 'Programación Orientada a Objetos (POO)',
      'topic': 'Prilares de la POO',
      'subtopic': 'Abstracción (clases abstractas)',
      'definition': '''
La abstracción en Java consiste en enfocarse en los aspectos esenciales de un objeto, ignorando los detalles innecesarios. Se logra mediante clases abstractas e interfaces, que definen métodos sin implementar, dejando que las subclases proporcionen las implementaciones concretas.

¿Te estás preguntando cuándo usar esto?

Pensemos por un momento en una clase abstracta `Figura` con un método `calcularArea()`. Las subclases como `Circulo` y `Rectangulo` implementan este método de manera específica. Esto permite tratar diferentes figuras de manera uniforme, centrándonos en lo que hacen (calcular el área) sin preocuparnos por cómo lo hacen.

La abstracción facilita la creación de sistemas más flexibles y mantenibles.
''',
      'code_example': '''
public abstract class Figura {
    abstract double calcularArea();
}

public class Circulo extends Figura {
    private double radio;

    public Circulo(double radio) {
        this.radio = radio;
    }

    @Override
    double calcularArea() {
        return Math.PI * radio * radio;
    }
}

public class Rectangulo extends Figura {
    private double ancho;
    private double alto;

    public Rectangulo(double ancho, double alto) {
        this.ancho = ancho;
        this.alto = alto;
    }

    @Override
    double calcularArea() {
        return ancho * alto;
    }
}

// Uso
Figura figura1 = new Circulo(5);
Figura figura2 = new Rectangulo(4, 6);
System.out.println(figura1.calcularArea()); // Salida: 78.53981633974483
System.out.println(figura2.calcularArea()); // Salida: 24.0
'''
    });

    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 2,
      'title_level': 'Programación Orientada a Objetos (POO)',
      'topic': 'Conceptos Avanzados',
      'subtopic': 'Interfaces',
      'definition': '''
Las interfaces en Java definen un contrato que las clases pueden implementar. Es decir, especifican qué métodos deben tener las clases que las implementan, sin proporcionar la implementación de dichos métodos.

¿Te estás preguntando cómo se utilizan?

Pensemos por un momento en una interfaz `Dibujable` que declara un método `dibujar()`. Cualquier clase que implemente `Dibujable` debe proporcionar su propia implementación de `dibujar()`. Esto permite que diferentes clases compartan un comportamiento común sin estar relacionadas por herencia.

Desde Java 8, las interfaces pueden incluir métodos con implementación por defecto (`default`) y métodos estáticos. Esto proporciona mayor flexibilidad al diseñar APIs y permite agregar nuevas funcionalidades sin romper las implementaciones existentes.
''',
      'code_example': '''
public interface Dibujable {
    void dibujar();
    default void imprimir() {
        System.out.println("Imprimiendo dibujo...");
    }
}

public class Circulo implements Dibujable {
    @Override
    public void dibujar() {
        System.out.println("Dibujando un círculo");
    }
}

// Uso
Dibujable figura = new Circulo();
figura.dibujar();   // Salida: Dibujando un círculo
figura.imprimir();  // Salida: Imprimiendo dibujo...
'''
    });

    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 2,
      'title_level': 'Programación Orientada a Objetos (POO)',
      'topic': 'Conceptos Avanzados',
      'subtopic': 'Clases anidadas',
      'definition': '''
En Java, es posible definir una clase dentro de otra clase. A estas se les llama clases anidadas. Existen dos tipos principales: las clases anidadas estáticas y las clases internas (no estáticas).

¿Te estás preguntando cuándo usar cada una?

Pensemos por un momento en una clase `Contenedor` que tiene una clase interna `Elemento`. Si `Elemento` necesita acceder a los miembros de instancia de `Contenedor`, se define como una clase interna. Si no necesita ese acceso, puede definirse como una clase anidada estática, lo que puede mejorar la eficiencia y claridad del código.

Las clases anidadas ayudan a agrupar clases que están estrechamente relacionadas, mejorando la encapsulación y la organización del código.
''',
      'code_example': '''
public class Contenedor {
    private String mensaje = "Hola desde Contenedor";

    class Interna {
        void mostrarMensaje() {
            System.out.println(mensaje);
        }
    }

    static class Estatica {
        void mostrarMensaje() {
            System.out.println("Hola desde clase anidada estática");
        }
    }
}

// Uso
Contenedor contenedor = new Contenedor();
Contenedor.Interna interna = contenedor.new Interna();
interna.mostrarMensaje(); // Salida: Hola desde Contenedor

Contenedor.Estatica estatica = new Contenedor.Estatica();
estatica.mostrarMensaje(); // Salida: Hola desde clase anidada estática
'''
    });

    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 2,
      'title_level': 'Programación Orientada a Objetos (POO)',
      'topic': 'Conceptos Avanzados',
      'subtopic': 'Enums',
      'definition': '''
Los enums en Java son tipos especiales que representan un conjunto fijo de constantes. Se utilizan para definir variables que solo pueden tomar uno de un número limitado de valores predefinidos.

¿Te estás preguntando por qué usar enums en lugar de constantes?

Pensemos por un momento en los días de la semana. En lugar de definir constantes como `LUNES`, `MARTES`, etc., puedes definir un enum `Dia` con esos valores. Esto proporciona una mayor seguridad de tipo y facilita la lectura y mantenimiento del código.

Además, los enums pueden tener atributos, métodos y constructores, lo que les permite comportarse de manera similar a las clases.
''',
      'code_example': '''
public enum Dia {
    LUNES("Inicio de semana"),
    MARTES("Segundo día"),
    MIERCOLES("Mitad de semana"),
    JUEVES("Casi viernes"),
    VIERNES("Fin de semana cercano"),
    SABADO("Día de descanso"),
    DOMINGO("Día familiar");

    private String descripcion;

    Dia(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getDescripcion() {
        return descripcion;
    }
}

// Uso
Dia hoy = Dia.LUNES;
System.out.println(hoy.getDescripcion()); // Salida: Inicio de semana
'''
    });

    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 2,
      'title_level': 'Programación Orientada a Objetos (POO)',
      'topic': 'Conceptos Avanzados',
      'subtopic': 'Records (Java 14+)',
      'definition': '''
Los records son una característica introducida en Java 14 que permite definir clases inmutables de manera concisa. Son ideales para representar datos simples y eliminan la necesidad de escribir código repetitivo como constructores, getters, `equals()`, `hashCode()` y `toString()`.

¿Te estás preguntando cómo se declaran?

Pensemos por un momento en una clase `Punto` con coordenadas `x` e `y`. Con records, puedes definirla en una sola línea: `record Punto(int x, int y) {}`. Esto crea automáticamente los métodos mencionados anteriormente.

Los records son especialmente útiles cuando necesitas clases que solo contienen datos y no requieren lógica adicional.
''',
      'code_example': '''
public record Punto(int x, int y) {}

// Uso
Punto punto = new Punto(3, 5);
System.out.println(punto.x()); // Salida: 3
System.out.println(punto.y()); // Salida: 5
System.out.println(punto);     // Salida: Punto[x=3, y=5]
'''
    });

    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 2,
      'title_level': 'Programación Orientada a Objetos (POO)',
      'topic': 'Conceptos Avanzados',
      'subtopic': 'Métodos estáticos',
      'definition': '''
Los métodos estáticos en Java pertenecen a la clase en lugar de a las instancias de la clase. Esto significa que puedes llamarlos sin crear un objeto de la clase.

¿Te estás preguntando cuándo usarlos?

Pensemos por un momento en una clase `Matematica` con un método `sumar()`. Si este método no depende de ninguna instancia y solo realiza una operación general, tiene sentido declararlo como estático. Así, puedes llamarlo directamente como `Matematica.sumar(5, 3)`.

Los métodos estáticos son útiles para operaciones utilitarias o funciones que no requieren mantener estado entre llamadas.
''',
      'code_example': '''
public class Matematica {
    public static int sumar(int a, int b) {
        return a + b;
    }
}

// Uso
int resultado = Matematica.sumar(5, 3);
System.out.println(resultado); // Salida: 8
'''
    });
  }

  static Future<void> _insertJrLevel3Data(Database db) async {
    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 3,
      'title_level': 'Manejo de Datos',
      'topic': 'Arrays y Colecciones',
      'subtopic': 'Arrays unidimensionales y multidimensionales',
      'definition': '''
Los arrays en Java son estructuras que permiten almacenar múltiples elementos del mismo tipo. Un array unidimensional es como una fila de casillas, mientras que un array multidimensional puede imaginarse como una tabla o incluso una matriz de varias dimensiones.

¿Te estás preguntando cómo se declaran y utilizan?

Pensemos por un momento en un array unidimensional que almacena las edades de un grupo de personas. Se declara como `int[] edades = new int[5];`. Para un array bidimensional, como una tabla de calificaciones, se usaría `int[][] calificaciones = new int[3][4];`, representando 3 estudiantes con 4 calificaciones cada uno.

Es importante recordar que los arrays en Java tienen un tamaño fijo una vez declarados, y sus índices comienzan en 0.
''',
      'code_example': '''
// Array unidimensional
int[] edades = new int[3];
edades[0] = 25;
edades[1] = 30;
edades[2] = 22;

// Array bidimensional
int[][] calificaciones = new int[2][3];
calificaciones[0][0] = 85;
calificaciones[0][1] = 90;
calificaciones[0][2] = 78;
calificaciones[1][0] = 88;
calificaciones[1][1] = 92;
calificaciones[1][2] = 81;

// Acceso a elementos
System.out.println("Edad del primer estudiante: " + edades[0]);
System.out.println("Primera calificación del segundo estudiante: " + calificaciones[1][0]);
'''
    });

    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 3,
      'title_level': 'Manejo de Datos',
      'topic': 'Arrays y Colecciones',
      'subtopic': 'ArrayList vs Array',
      'definition': '''
En Java, tanto los arrays como los ArrayList permiten almacenar múltiples elementos, pero presentan diferencias clave. Los arrays tienen un tamaño fijo y pueden contener tipos primitivos, mientras que los ArrayList son dinámicos y solo pueden almacenar objetos.

¿Te estás preguntando cuál usar y cuándo?

Pensemos por un momento en una lista de tareas que puede crecer o reducirse. Un ArrayList sería ideal, ya que permite añadir o eliminar elementos fácilmente. En cambio, si sabes que necesitarás exactamente 10 espacios para almacenar números enteros, un array sería más eficiente.

Además, los ArrayList ofrecen métodos útiles como `add()`, `remove()` y `contains()`, facilitando la manipulación de los datos.
''',
      'code_example': '''
// Uso de Array
int[] numeros = new int[3];
numeros[0] = 10;
numeros[1] = 20;
numeros[2] = 30;

// Uso de ArrayList
import java.util.ArrayList;
ArrayList<String> tareas = new ArrayList<>();
tareas.add("Estudiar");
tareas.add("Practicar");
tareas.add("Descansar");

// Acceso a elementos
System.out.println("Primer número: " + numeros[0]);
System.out.println("Primera tarea: " + tareas.get(0));
'''
    });

    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 3,
      'title_level': 'Manejo de Datos',
      'topic': 'Arrays y Colecciones',
      'subtopic': 'LinkedList',
      'definition': '''
La clase LinkedList en Java implementa una lista doblemente enlazada, lo que permite una inserción y eliminación eficiente de elementos, especialmente en listas largas.

¿Te estás preguntando cuándo usar LinkedList en lugar de ArrayList?

Pensemos por un momento en una aplicación que requiere insertar y eliminar elementos frecuentemente en el medio de la lista. En este caso, LinkedList es más eficiente que ArrayList, ya que no necesita desplazar elementos para mantener el orden.

Sin embargo, acceder a elementos por índice es más lento en LinkedList, ya que necesita recorrer la lista desde el principio o el final.
''',
      'code_example': '''
import java.util.LinkedList;

LinkedList<String> nombres = new LinkedList<>();
nombres.add("Ana");
nombres.add("Luis");
nombres.add("Carlos");

nombres.addFirst("María");
nombres.addLast("Pedro");

System.out.println("Primer nombre: " + nombres.getFirst());
System.out.println("Último nombre: " + nombres.getLast());
'''
    });

    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 3,
      'title_level': 'Manejo de Datos',
      'topic': 'Arrays y Colecciones',
      'subtopic': 'HashSet, TreeSet',
      'definition': '''
HashSet y TreeSet son implementaciones de la interfaz Set en Java, utilizadas para almacenar elementos únicos. La principal diferencia radica en el orden de los elementos.

¿Te estás preguntando cuál elegir?

Pensemos por un momento en una colección de nombres únicos. Si no te importa el orden, HashSet es más rápido. Si necesitas que los elementos estén ordenados, TreeSet es la opción adecuada, ya que mantiene los elementos en orden natural o según un comparador personalizado.

Es importante destacar que HashSet permite elementos nulos, mientras que TreeSet no lo permite si se utiliza el orden natural.
''',
      'code_example': '''
import java.util.HashSet;
import java.util.TreeSet;

HashSet<String> hashSet = new HashSet<>();
hashSet.add("Banana");
hashSet.add("Manzana");
hashSet.add("Pera");

TreeSet<String> treeSet = new TreeSet<>();
treeSet.add("Banana");
treeSet.add("Manzana");
treeSet.add("Pera");

System.out.println("HashSet: " + hashSet);
System.out.println("TreeSet: " + treeSet);
'''
    });

    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 3,
      'title_level': 'Manejo de Datos',
      'topic': 'Arrays y Colecciones',
      'subtopic': 'HashMap, TreeMap',
      'definition': '''
HashMap y TreeMap son implementaciones de la interfaz Map en Java, utilizadas para almacenar pares clave-valor. La diferencia principal radica en el orden de las claves.

¿Te estás preguntando cuál usar?

Pensemos por un momento en un directorio telefónico. Si necesitas acceder rápidamente a un número dado un nombre, HashMap es eficiente. Si además deseas que los nombres estén ordenados alfabéticamente, TreeMap es la elección adecuada.

Recuerda que HashMap permite una clave nula y múltiples valores nulos, mientras que TreeMap no permite claves nulas si se utiliza el orden natural.
''',
      'code_example': '''
import java.util.HashMap;
import java.util.TreeMap;

HashMap<String, Integer> hashMap = new HashMap<>();
hashMap.put("Ana", 1234);
hashMap.put("Luis", 5678);
hashMap.put("Carlos", 9012);

TreeMap<String, Integer> treeMap = new TreeMap<>();
treeMap.put("Ana", 1234);
treeMap.put("Luis", 5678);
treeMap.put("Carlos", 9012);

System.out.println("HashMap: " + hashMap);
System.out.println("TreeMap: " + treeMap);
'''
    });

    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 3,
      'title_level': 'Manejo de Datos',
      'topic': 'Strings y Manipulación',
      'subtopic': 'Clase String y sus métodos',
      'definition': '''
La clase `String` en Java representa una secuencia de caracteres y es una de las más utilizadas en el lenguaje. Una característica importante es que los objetos de tipo `String` son inmutables, lo que significa que una vez creados, su valor no puede cambiar.

¿Te estás preguntando cómo manipular cadenas si son inmutables?

Pensemos por un momento en una cadena de texto que necesitas modificar. Aunque no puedes cambiar el contenido de una `String` existente, puedes crear nuevas cadenas basadas en transformaciones de la original. La clase `String` proporciona numerosos métodos para trabajar con cadenas, como `length()`, `charAt()`, `substring()`, `toUpperCase()`, `toLowerCase()`, `trim()`, `replace()`, entre otros. Estos métodos te permiten realizar operaciones comunes como obtener la longitud de una cadena, acceder a caracteres individuales, extraer subcadenas, cambiar el caso de los caracteres, eliminar espacios en blanco y reemplazar partes del texto.
''',
      'code_example': '''
String texto = "  Hola Mundo  ";
System.out.println("Longitud: " + texto.length());
System.out.println("Primer carácter: " + texto.charAt(0));
System.out.println("Subcadena: " + texto.substring(2, 6));
System.out.println("Mayúsculas: " + texto.toUpperCase());
System.out.println("Sin espacios: '" + texto.trim() + "'");
System.out.println("Reemplazo: " + texto.replace("Mundo", "Java"));
'''
    });

    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 3,
      'title_level': 'Manejo de Datos',
      'topic': 'Strings y Manipulación',
      'subtopic': 'StringBuilder y StringBuffer',
      'definition': '''
Cuando necesitas realizar múltiples modificaciones en una cadena de texto, como concatenaciones o inserciones, las clases `StringBuilder` y `StringBuffer` son herramientas útiles en Java. A diferencia de la clase `String`, que es inmutable, estas clases permiten modificar el contenido sin crear nuevos objetos.

¿Te estás preguntando cuál de las dos utilizar?

Pensemos por un momento en un escenario donde estás construyendo dinámicamente una cadena en un entorno de un solo hilo. En este caso, `StringBuilder` es más eficiente ya que no es sincronizado y, por lo tanto, más rápido. Sin embargo, si estás trabajando en un entorno multihilo donde múltiples hilos pueden acceder y modificar la cadena simultáneamente, `StringBuffer` es la opción adecuada, ya que es sincronizado y seguro para hilos.
''',
      'code_example': '''
// Uso de StringBuilder
StringBuilder sb = new StringBuilder("Hola");
sb.append(" Mundo");
System.out.println(sb.toString()); // Salida: Hola Mundo

// Uso de StringBuffer
StringBuffer sbf = new StringBuffer("Hola");
sbf.append(" Java");
System.out.println(sbf.toString()); // Salida: Hola Java
'''
    });

    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 3,
      'title_level': 'Manejo de Datos',
      'topic': 'Strings y Manipulación',
      'subtopic': 'Formateo de Strings',
      'definition': '''
El formateo de cadenas en Java te permite crear cadenas con un formato específico, lo cual es especialmente útil para presentar datos de manera legible. El método `String.format()` es una herramienta poderosa para este propósito.

¿Te estás preguntando cómo funciona este método?

Pensemos por un momento en la necesidad de mostrar un número con dos decimales o alinear texto en una tabla. Con `String.format()`, puedes utilizar especificadores de formato similares a los de `printf` en C. Por ejemplo, `%s` para cadenas, `%d` para enteros y `%.2f` para números de punto flotante con dos decimales. Esto te permite controlar la presentación de los datos de manera precisa y profesional.
''',
      'code_example': '''
String nombre = "Ana";
int edad = 30;
double salario = 12345.6789;

String resultado = String.format("Nombre: %s | Edad: %d | Salario: %.2f", nombre, edad, salario);
System.out.println(resultado); // Salida: Nombre: Ana | Edad: 30 | Salario: 12345.68
'''
    });

    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 3,
      'title_level': 'Manejo de Datos',
      'topic': 'Strings y Manipulación',
      'subtopic': 'Expresiones regulares básicas',
      'definition': '''
Las expresiones regulares, también conocidas como regex, son patrones que permiten buscar y manipular texto de manera eficiente. En Java, se utilizan comúnmente para validar entradas, buscar coincidencias y realizar reemplazos en cadenas de texto.

¿Te estás preguntando cómo implementarlas?

Pensemos por un momento en la necesidad de verificar si una cadena es un correo electrónico válido. Utilizando la clase `Pattern` y `Matcher` del paquete `java.util.regex`, puedes definir un patrón que represente la estructura de un correo electrónico y luego comprobar si una cadena coincide con ese patrón. Las expresiones regulares ofrecen una forma flexible y potente de trabajar con texto en Java.
''',
      'code_example': '''
import java.util.regex.Pattern;
import java.util.regex.Matcher;

String texto = "Contacta a soporte@example.com para más información.";
String patron = "\\b[\\w.%+-]+@[\\w.-]+\\.[a-zA-Z]{2,6}\\b";

Pattern pattern = Pattern.compile(patron);
Matcher matcher = pattern.matcher(texto);

while (matcher.find()) {
    System.out.println("Correo encontrado: " + matcher.group());
}
'''
    });

    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 3,
      'title_level': 'Manejo de Datos',
      'topic': 'Manejo de Archivos',
      'subtopic': 'Clases File, FileReader, FileWriter',
      'definition': '''
En Java, la clase `File` se utiliza para representar rutas de archivos y directorios. Aunque no permite leer o escribir directamente en archivos, proporciona métodos para obtener información sobre ellos, como su existencia, tamaño y permisos.

¿Te estás preguntando cómo leer y escribir en archivos?

Pensemos por un momento en la necesidad de leer el contenido de un archivo de texto. La clase `FileReader` permite leer archivos de texto carácter por carácter, mientras que `FileWriter` permite escribir caracteres en un archivo. Estas clases son adecuadas para operaciones simples de lectura y escritura de texto.

Es importante tener en cuenta que `FileReader` y `FileWriter` utilizan la codificación de caracteres predeterminada del sistema. Si necesitas especificar una codificación diferente, considera usar `InputStreamReader` y `OutputStreamWriter`.
''',
      'code_example': '''
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class EjemploArchivo {
    public static void main(String[] args) {
        File archivo = new File("ejemplo.txt");

        // Escribir en el archivo
        try (FileWriter escritor = new FileWriter(archivo)) {
            escritor.write("Hola, mundo!");
        } catch (IOException e) {
            e.printStackTrace();
        }

        // Leer del archivo
        try (FileReader lector = new FileReader(archivo)) {
            int caracter;
            while ((caracter = lector.read()) != -1) {
                System.out.print((char) caracter);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
'''
    });

    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 3,
      'title_level': 'Manejo de Datos',
      'topic': 'Manejo de Archivos',
      'subtopic': 'BufferedReader/BufferedWriter',
      'definition': '''
Las clases `BufferedReader` y `BufferedWriter` en Java se utilizan para mejorar la eficiencia de las operaciones de lectura y escritura de texto al utilizar un búfer interno. Esto reduce el número de accesos al disco, lo que puede mejorar el rendimiento, especialmente al trabajar con archivos grandes.

¿Te estás preguntando cómo utilizarlas?

Pensemos por un momento en la necesidad de leer un archivo línea por línea. `BufferedReader` proporciona el método `readLine()`, que facilita esta tarea. Por otro lado, `BufferedWriter` permite escribir texto de manera eficiente y proporciona el método `newLine()` para insertar saltos de línea.

Es importante cerrar siempre estos flujos después de usarlos para liberar recursos del sistema.
''',
      'code_example': '''
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class EjemploBuffered {
    public static void main(String[] args) {
        String archivo = "ejemplo_buffered.txt";

        // Escribir en el archivo
        try (BufferedWriter escritor = new BufferedWriter(new FileWriter(archivo))) {
            escritor.write("Primera línea");
            escritor.newLine();
            escritor.write("Segunda línea");
        } catch (IOException e) {
            e.printStackTrace();
        }

        // Leer del archivo
        try (BufferedReader lector = new BufferedReader(new FileReader(archivo))) {
            String linea;
            while ((linea = lector.readLine()) != null) {
                System.out.println(linea);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
'''
    });

    await db.insert('programming_content', {
      'language': 'Java',
      'module': 'Jr',
      'level': 3,
      'title_level': 'Manejo de Datos',
      'topic': 'Manejo de Archivos',
      'subtopic': 'InputStream/OutputStream',
      'definition': '''
Las clases `InputStream` y `OutputStream` en Java se utilizan para leer y escribir datos en forma de bytes, lo que las hace adecuadas para manejar archivos binarios como imágenes, archivos de audio o cualquier otro tipo de datos no textuales.

¿Te estás preguntando cómo funcionan?

Pensemos por un momento en la necesidad de copiar una imagen de un lugar a otro. Utilizando `FileInputStream` (una subclase de `InputStream`) puedes leer los bytes del archivo fuente, y con `FileOutputStream` (una subclase de `OutputStream`) puedes escribir esos bytes en el archivo de destino.

Es esencial manejar adecuadamente las excepciones y cerrar los flujos después de usarlos para evitar pérdidas de datos o bloqueos de recursos.
''',
      'code_example': '''
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class CopiarArchivo {
    public static void main(String[] args) {
        String archivoOrigen = "imagen.jpg";
        String archivoDestino = "copia_imagen.jpg";

        try (FileInputStream entrada = new FileInputStream(archivoOrigen);
             FileOutputStream salida = new FileOutputStream(archivoDestino)) {

            byte[] buffer = new byte[1024];
            int bytesLeidos;
            while ((bytesLeidos = entrada.read(buffer)) != -1) {
                salida.write(buffer, 0, bytesLeidos);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
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
      'tittle_level': '',
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
      'tittle_level': '',
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
