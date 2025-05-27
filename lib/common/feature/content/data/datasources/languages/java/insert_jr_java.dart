import 'package:sqflite_common/sqlite_api.dart';

Future<void> insertJrLevel1Data(Database db) async {
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

Future<void> insertJrLevel2Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Jr',
    'level': 2,
    'tittle_level': 'Programación Orientada a Objetos (POO)',
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
    'tittle_level': 'Programación Orientada a Objetos (POO)',
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
    'tittle_level': 'Programación Orientada a Objetos (POO)',
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
    'tittle_level': 'Programación Orientada a Objetos (POO)',
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
    'tittle_level': 'Programación Orientada a Objetos (POO)',
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
    'tittle_level': 'Programación Orientada a Objetos (POO)',
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
    'tittle_level': 'Programación Orientada a Objetos (POO)',
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
    'tittle_level': 'Programación Orientada a Objetos (POO)',
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
    'tittle_level': 'Programación Orientada a Objetos (POO)',
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
    'tittle_level': 'Programación Orientada a Objetos (POO)',
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
    'tittle_level': 'Programación Orientada a Objetos (POO)',
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
    'tittle_level': 'Programación Orientada a Objetos (POO)',
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
    'tittle_level': 'Programación Orientada a Objetos (POO)',
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

Future<void> insertJrLevel3Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Jr',
    'level': 3,
    'tittle_level': 'Manejo de Datos',
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
    'tittle_level': 'Manejo de Datos',
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
    'tittle_level': 'Manejo de Datos',
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
    'tittle_level': 'Manejo de Datos',
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
    'tittle_level': 'Manejo de Datos',
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
    'tittle_level': 'Manejo de Datos',
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
    'tittle_level': 'Manejo de Datos',
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
    'tittle_level': 'Manejo de Datos',
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
    'tittle_level': 'Manejo de Datos',
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
    'tittle_level': 'Manejo de Datos',
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
    'tittle_level': 'Manejo de Datos',
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
    'tittle_level': 'Manejo de Datos',
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

Future<void> insertJrLevel4Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Jr',
    'level': 4,
    'tittle_level': 'Manejo de Excepciones',
    'topic': 'Tipos de Excepciones',
    'subtopic': 'Excepciones verificadas vs no verificadas',
    'definition': '''
En Java, las excepciones se dividen en dos grandes grupos: las **verificadas (checked)** y las **no verificadas (unchecked)**. Esta clasificación afecta directamente cómo el compilador y tú, como desarrollador, deben manejarlas.

¿Te estás preguntando por qué esto importa?

Pensemos por un momento en cómo Java maneja los errores. Las **excepciones verificadas** son aquellas que el compilador obliga a manejar, ya sea mediante un bloque `try-catch` o declarando su posible lanzamiento con la cláusula `throws`. Estas excepciones suelen representar condiciones fuera del control del programa, como errores de entrada/salida o problemas de red. Ejemplos comunes incluyen `IOException` y `SQLException`.

Por otro lado, las **excepciones no verificadas** son aquellas que el compilador no exige manejar explícitamente. Generalmente, derivan de errores de programación, como referencias nulas o índices fuera de rango. Ejemplos comunes incluyen `NullPointerException` y `ArrayIndexOutOfBoundsException`.

Es esencial comprender esta distinción para escribir código robusto y evitar errores inesperados durante la ejecución.
''',
    'code_example': '''
// Ejemplo de excepción verificada
import java.io.FileReader;
import java.io.IOException;

public class EjemploChecked {
    public static void main(String[] args) {
        try {
            FileReader lector = new FileReader("archivo.txt");
            lector.close();
        } catch (IOException e) {
            System.out.println("Ocurrió una excepción verificada: " + e.getMessage());
        }
    }
}

// Ejemplo de excepción no verificada
public class EjemploUnchecked {
    public static void main(String[] args) {
        int[] numeros = {1, 2, 3};
        System.out.println(numeros[5]); // Esto lanzará ArrayIndexOutOfBoundsException
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Jr',
    'level': 4,
    'tittle_level': 'Manejo de Excepciones',
    'topic': 'Tipos de Excepciones',
    'subtopic': 'Jerarquía de excepciones',
    'definition': '''
La jerarquía de excepciones en Java está estructurada de manera que todas las excepciones derivan de la clase base `Throwable`. Esta clase tiene dos subclases principales: `Error` y `Exception`.

¿Te estás preguntando cómo esta jerarquía afecta el manejo de excepciones?

Pensemos por un momento en cómo capturar múltiples excepciones. Puedes usar bloques `catch` separados para diferentes tipos de excepciones o un solo bloque `catch` para una superclase común. Sin embargo, es importante ordenar los bloques `catch` del más específico al más general para evitar que las excepciones específicas sean capturadas por bloques generales antes de tiempo.

Entender esta jerarquía te permite manejar las excepciones de manera más precisa y efectiva.
''',
    'code_example': '''
// Ejemplo de jerarquía de excepciones
public class JerarquiaExcepciones {
    public static void main(String[] args) {
        try {
            String texto = null;
            System.out.println(texto.length()); // Esto lanzará NullPointerException
        } catch (NullPointerException e) {
            System.out.println("Capturada NullPointerException");
        } catch (RuntimeException e) {
            System.out.println("Capturada RuntimeException");
        } catch (Exception e) {
            System.out.println("Capturada Exception");
        }
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Jr',
    'level': 4,
    'tittle_level': 'Manejo de Excepciones',
    'topic': 'Tipos de Excepciones',
    'subtopic':
        'Excepciones comunes (NullPointerException, ArrayIndexOutOfBoundsException, etc.)',
    'definition': '''
En Java, algunas excepciones son especialmente comunes y es fundamental comprenderlas:

- **NullPointerException**: Ocurre cuando se intenta usar una referencia que apunta a `null`, como acceder a métodos o propiedades de un objeto no inicializado.

- **ArrayIndexOutOfBoundsException**: Se lanza cuando se intenta acceder a un índice fuera del rango válido de un arreglo.

- **ArithmeticException**: Resulta de operaciones aritméticas ilegales, como dividir por cero.

- **ClassCastException**: Se produce al intentar convertir un objeto a una subclase de la cual no es una instancia.

- **IllegalArgumentException**: Indica que un método ha recibido un argumento inapropiado.

¿Te estás preguntando cómo prevenir estas excepciones?

Pensemos por un momento en la importancia de validar datos antes de usarlos. Verificar si un objeto es `null` antes de acceder a sus métodos, asegurarse de que los índices estén dentro de los límites del arreglo y validar los argumentos de los métodos son prácticas esenciales para evitar estas excepciones.
''',
    'code_example': '''
// Ejemplo de NullPointerException
public class EjemploNullPointer {
    public static void main(String[] args) {
        String texto = null;
        System.out.println(texto.length()); // Lanza NullPointerException
    }
}

// Ejemplo de ArrayIndexOutOfBoundsException
public class EjemploArrayIndex {
    public static void main(String[] args) {
        int[] numeros = {1, 2, 3};
        System.out.println(numeros[5]); // Lanza ArrayIndexOutOfBoundsException
    }
}

// Ejemplo de ArithmeticException
public class EjemploArithmetic {
    public static void main(String[] args) {
        int resultado = 10 / 0; // Lanza ArithmeticException
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Jr',
    'level': 4,
    'tittle_level': 'Manejo de Excepciones',
    'topic': 'Manejo de Errores',
    'subtopic': 'Try-catch-finally',
    'definition': '''
El bloque `try-catch-finally` en Java es la forma básica de manejar errores durante la ejecución del programa. Permite intentar ejecutar código que podría lanzar una excepción, capturar esa excepción si ocurre y ejecutar código adicional independientemente de si ocurrió una excepción o no.

¿Te estás preguntando cómo funciona cada parte?

Pensemos por un momento en las tres secciones:

- **try**: Aquí colocas el código que podría lanzar una excepción.
- **catch**: Si ocurre una excepción en el bloque try, se captura aquí y puedes manejarla adecuadamente.
- **finally**: Este bloque se ejecuta siempre, haya o no una excepción. Es ideal para liberar recursos o realizar tareas de limpieza.

Por ejemplo, si estás leyendo un archivo, puedes colocar la lectura en el bloque try, manejar posibles errores en el catch y cerrar el archivo en el finally para asegurarte de que se cierre correctamente sin importar lo que ocurra.
''',
    'code_example': '''
// Ejemplo de try-catch-finally
import java.io.*;

public class EjemploTryCatchFinally {
    public static void main(String[] args) {
        BufferedReader lector = null;
        try {
            lector = new BufferedReader(new FileReader("archivo.txt"));
            String linea = lector.readLine();
            System.out.println("Contenido: " + linea);
        } catch (IOException e) {
            System.out.println("Ocurrió un error al leer el archivo: " + e.getMessage());
        } finally {
            try {
                if (lector != null) {
                    lector.close();
                    System.out.println("Archivo cerrado correctamente.");
                }
            } catch (IOException e) {
                System.out.println("Error al cerrar el archivo: " + e.getMessage());
            }
        }
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Jr',
    'level': 4,
    'tittle_level': 'Manejo de Excepciones',
    'topic': 'Manejo de Errores',
    'subtopic': 'Multi-catch',
    'definition': '''
El bloque `multi-catch` en Java permite capturar múltiples tipos de excepciones en un solo bloque catch, reduciendo la redundancia cuando diferentes excepciones requieren el mismo manejo.

¿Te estás preguntando cuándo usar multi-catch?

Pensemos por un momento en una situación donde diferentes métodos pueden lanzar distintas excepciones, pero todas deben manejarse de la misma manera. En lugar de escribir múltiples bloques catch con el mismo código, puedes combinarlos usando el operador `|`.

Esto no solo hace que el código sea más limpio y fácil de mantener, sino que también reduce la posibilidad de errores al duplicar código en múltiples bloques catch.
''',
    'code_example': '''
// Ejemplo de multi-catch
public class EjemploMultiCatch {
    public static void main(String[] args) {
        try {
            String texto = null;
            System.out.println(texto.length()); // Esto lanzará NullPointerException
        } catch (NullPointerException | ArithmeticException e) {
            System.out.println("Se capturó una excepción: " + e.getClass().getSimpleName());
        }
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Jr',
    'level': 4,
    'tittle_level': 'Manejo de Excepciones',
    'topic': 'Manejo de Errores',
    'subtopic': 'Try-with-resources',
    'definition': '''
El bloque `try-with-resources` en Java simplifica el manejo de recursos como archivos o conexiones, asegurando que se cierren automáticamente al finalizar el bloque, sin necesidad de un bloque finally explícito.

¿Te estás preguntando cómo mejora esto el manejo de recursos?

Pensemos por un momento en cómo se manejaban los recursos antes: tenías que asegurarte de cerrarlos manualmente en un bloque finally, lo que podía ser propenso a errores si olvidabas hacerlo. Con `try-with-resources`, cualquier objeto que implemente la interfaz `AutoCloseable` se cerrará automáticamente al salir del bloque try, incluso si ocurre una excepción.

Esto no solo reduce el código necesario, sino que también minimiza el riesgo de fugas de recursos, haciendo que tu aplicación sea más robusta y eficiente.
''',
    'code_example': '''
// Ejemplo de try-with-resources
import java.io.*;

public class EjemploTryWithResources {
    public static void main(String[] args) {
        try (BufferedReader lector = new BufferedReader(new FileReader("archivo.txt"))) {
            String linea = lector.readLine();
            System.out.println("Contenido: " + linea);
        } catch (IOException e) {
            System.out.println("Ocurrió un error al leer el archivo: " + e.getMessage());
        }
        // No es necesario cerrar el lector; se cierra automáticamente
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Jr',
    'level': 4,
    'tittle_level': 'Manejo de Excepciones',
    'topic': 'Manejo de Errores',
    'subtopic': 'Creación de excepciones personalizadas',
    'definition': '''
Crear excepciones personalizadas en Java te permite definir errores específicos para tu aplicación, proporcionando mensajes más claros y un manejo de errores más preciso.

¿Te estás preguntando cuándo deberías crear tus propias excepciones?

Pensemos por un momento en una aplicación bancaria. Si un usuario intenta retirar más dinero del que tiene en su cuenta, podrías lanzar una excepción personalizada como `FondosInsuficientesException` en lugar de una genérica `Exception`. Esto hace que el código sea más legible y que el manejo de errores sea más específico y controlado.

Para crear una excepción personalizada, simplemente extiende la clase `Exception` (para excepciones verificadas) o `RuntimeException` (para no verificadas) y, opcionalmente, agrega constructores personalizados para mensajes de error.
''',
    'code_example': '''
// Definición de una excepción personalizada
public class FondosInsuficientesException extends Exception {
    public FondosInsuficientesException(String mensaje) {
        super(mensaje);
    }
}

// Uso de la excepción personalizada
public class CuentaBancaria {
    private double saldo = 1000.0;

    public void retirar(double cantidad) throws FondosInsuficientesException {
        if (cantidad > saldo) {
            throw new FondosInsuficientesException("Fondos insuficientes para retirar " + cantidad);
        }
        saldo -= cantidad;
    }

    public static void main(String[] args) {
        CuentaBancaria cuenta = new CuentaBancaria();
        try {
            cuenta.retirar(1500.0);
        } catch (FondosInsuficientesException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
}
'''
  });
}

Future<void> insertJrLevel5Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Jr',
    'level': 5,
    'tittle_level': 'Herramientas Básicas',
    'topic': 'Entorno de Desarrollo',
    'subtopic': 'Instalación de JDK',
    'definition': '''
El JDK (Java Development Kit) es el paquete esencial para desarrollar aplicaciones en Java. Incluye herramientas como el compilador `javac` y la máquina virtual de Java (JVM), que son fundamentales para escribir y ejecutar programas en este lenguaje.

¿Te preguntas cómo instalarlo?

Primero, visita la página oficial de Oracle y descarga la versión más reciente del JDK para tu sistema operativo. Una vez descargado, ejecuta el instalador y sigue las instrucciones. Por defecto, el JDK se instalará en una ruta como `C:\\Program Files\\Java\\jdk-21`.

Después de la instalación, es importante configurar las variables de entorno para que el sistema reconozca los comandos de Java desde cualquier ubicación en la terminal. Esto se logra estableciendo las variables `JAVA_HOME` y actualizando el `PATH`.
''',
    'code_example': '''
// Verificar la instalación del JDK
// Abre la terminal y ejecuta:
java -version
// Deberías ver algo como:
// java version "21.0.1" 2025-05-15
// Java(TM) SE Runtime Environment (build 21.0.1+9-LTS)
// Java HotSpot(TM) 64-Bit Server VM (build 21.0.1+9-LTS, mixed mode)
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Jr',
    'level': 5,
    'tittle_level': 'Herramientas Básicas',
    'topic': 'Entorno de Desarrollo',
    'subtopic': 'Configuración de variables de entorno',
    'definition': '''
Configurar las variables de entorno es un paso crucial para que el sistema operativo pueda localizar las herramientas de Java desde cualquier ubicación en la terminal.

¿Te preguntas cómo hacerlo?

Primero, necesitas establecer la variable `JAVA_HOME`, que apunta al directorio donde se instaló el JDK. Luego, debes agregar `%JAVA_HOME%\\bin` al final de la variable `PATH` para que los comandos como `java` y `javac` estén disponibles globalmente.

Este proceso varía ligeramente según el sistema operativo, pero en Windows, puedes acceder a las variables de entorno a través de las propiedades del sistema.
''',
    'code_example': '''
// Configurar JAVA_HOME y PATH en Windows
// 1. Abre el Panel de Control y ve a "Sistema" > "Configuración avanzada del sistema" > "Variables de entorno".
// 2. En "Variables del sistema", haz clic en "Nueva" y crea JAVA_HOME con el valor:
//    C:\\Program Files\\Java\\jdk-21
// 3. Busca la variable PATH, haz clic en "Editar" y agrega al final:
//    %JAVA_HOME%\\bin
// 4. Acepta los cambios y reinicia la terminal para que surtan efecto.
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Jr',
    'level': 5,
    'tittle_level': 'Herramientas Básicas',
    'topic': 'Entorno de Desarrollo',
    'subtopic': 'Uso de IDE (IntelliJ IDEA, Eclipse)',
    'definition': '''
Un Entorno de Desarrollo Integrado (IDE) facilita la escritura, compilación y depuración de código. IntelliJ IDEA y Eclipse son dos de los IDEs más populares para Java.

¿Te preguntas cuál elegir?

IntelliJ IDEA es conocido por su interfaz moderna y potentes herramientas de análisis de código, mientras que Eclipse es valorado por su extensibilidad y amplia comunidad. Ambos ofrecen características como autocompletado, navegación entre clases y depuración paso a paso.

La elección depende de tus preferencias y necesidades específicas del proyecto.
''',
    'code_example': '''
// Crear un nuevo proyecto en IntelliJ IDEA:
// 1. Abre IntelliJ IDEA y selecciona "New Project".
// 2. Elige "Java" como tipo de proyecto y configura el JDK.
// 3. Define el nombre y la ubicación del proyecto.
// 4. Haz clic en "Finish" y comienza a escribir tu código en la clase Main.

// Crear un nuevo proyecto en Eclipse:
// 1. Abre Eclipse y selecciona "File" > "New" > "Java Project".
// 2. Ingresa el nombre del proyecto y configura el JDK.
// 3. Haz clic en "Finish" y crea una nueva clase Java dentro del proyecto.
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Jr',
    'level': 5,
    'tittle_level': 'Herramientas Básicas',
    'topic': 'Entorno de Desarrollo',
    'subtopic': 'Compilación y ejecución desde terminal',
    'definition': '''
Compilar y ejecutar programas Java desde la terminal es una habilidad esencial que te permite comprender mejor el proceso de desarrollo sin depender de un IDE.

¿Te preguntas cómo hacerlo?

Primero, escribe tu código en un archivo con extensión `.java`, por ejemplo, `HolaMundo.java`. Luego, abre la terminal, navega hasta el directorio donde se encuentra el archivo y utiliza el compilador de Java (`javac`) para compilar el código. Esto generará un archivo `.class` que puedes ejecutar con el comando `java`.

Este método es especialmente útil para scripts simples o cuando trabajas en entornos donde no hay un IDE disponible.
''',
    'code_example': '''
// Compilar y ejecutar un programa Java desde la terminal
// 1. Abre la terminal y navega al directorio del archivo:
//    cd C:\\Ruta\\Al\\Proyecto
// 2. Compila el archivo Java:
//    javac HolaMundo.java
// 3. Ejecuta el programa compilado:
//    java HolaMundo

// Asegúrate de que el archivo HolaMundo.java contiene una clase pública con un método main:
// public class HolaMundo {
//     public static void main(String[] args) {
//         System.out.println("Hola, mundo");
//     }
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Jr',
    'level': 5,
    'tittle_level': 'Herramientas Básicas',
    'topic': 'Control de Versiones',
    'subtopic': 'Introducción a Git',
    'definition': '''
Git es básicamente un sistema que guarda un registro de todos los cambios que le haces a tus archivos. Imagínalo como un "control + z" ilimitado y súper poderoso, pero para todo tu proyecto.

Seguramente te estarás preguntando: "¿Por qué necesito esto?". Bueno, piensa en lo siguiente: ¿Alguna vez has borrado algo importante por accidente? ¿O has querido volver a una versión anterior de tu trabajo? Git te rescata de esos dramas.

Git te permite trabajar en equipo sin que se arme un caos. Cada persona puede tener su propia "copia" del proyecto y luego combinar los cambios de todos de forma ordenada. Es como tener un libro donde cada autor escribe en su propia hoja y luego se juntan todas las historias en una sola.  Además, plataformas como GitHub y GitLab usan Git, así que aprenderlo te abre las puertas a colaborar con otros programadores y mostrar tu trabajo al mundo 🌎.
''',
    'code_example': '''
// Inicializar un nuevo repositorio Git en la carpeta actual
git init

// Agregar un archivo al "área de preparación" (staging area)
git add mi_archivo.java

// Guardar los cambios con un mensaje descriptivo
git commit -m "Agregué la clase MiArchivo"

// Enviar los cambios al repositorio remoto (por ejemplo, GitHub)
git push origin main

// Ejemplo de un error común: olvidar agregar el archivo antes de commitear
// git commit -m "Intento guardar el archivo" // ¡Este commit estará vacío si no hiciste 'git add'!
''',
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Jr',
    'level': 5,
    'tittle_level': 'Herramientas Básicas',
    'topic': 'Control de Versiones',
    'subtopic': 'Comandos básicos (init, add, commit, push, pull)',
    'definition': '''
Dominar los comandos básicos de Git es como aprender los hechizos de un mago: te dan el poder de controlar el tiempo... ¡del código!  Estos comandos son los que usarás casi a diario, así que vale la pena entenderlos bien.

¿Te preguntas por qué son tan importantes?  Pues, piensa en un trabajo en equipo.  Sin estos comandos, sería un desastre: archivos duplicados, cambios perdidos, ¡un caos total!  Git pone orden y te permite colaborar fluidamente.

Aquí te dejo un desglose de los "hechizos" más comunes:

* **`git init`**:  Este es el comando para "crear" un nuevo repositorio Git en una carpeta. Es como decir: "¡Oye, Git, voy a empezar a rastrear los cambios aquí!".
* **`git add`**:  Imagina que tienes varios archivos, pero no quieres guardar *todos* los cambios. `git add` te permite elegir qué archivos o cambios específicos quieres "guardar" en el próximo "snapshot" (commit). Es como seleccionar qué fotos quieres subir a Instagram.
* **`git commit`**:  Este comando toma los cambios que "agregaste" con `git add` y los guarda permanentemente en el historial de Git.  Siempre debes escribir un mensaje descriptivo ("Agregué la función X", "Corregí el bug Y") para saber qué hiciste en ese "snapshot".
* **`git push`**:  Si estás trabajando con un repositorio remoto (como en GitHub), `git push` envía tus cambios locales al repositorio remoto.  Es como publicar tu trabajo para que otros lo vean.
* **`git pull`**:  Lo opuesto a `git push`.  `git pull` trae los cambios del repositorio remoto a tu copia local.  Útil para mantenerte al día con el trabajo de otros.

Con estos comandos, ya puedes hacer magia con tu código.
''',
    'code_example': '''
// Inicializa un repositorio
git init

// Agrega archivos
git add archivo1.txt archivo2.java

// Crea un "snapshot" de los cambios
git commit -m "Agregados archivos iniciales"

// Envía los cambios al repositorio remoto
git push origin main

// Obtiene los últimos cambios del repositorio remoto
git pull origin main

// Ejemplo incorrecto: Tratar de hacer push sin haber hecho commit
// git push origin main // Esto fallará si no hay commits locales nuevos
''',
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Jr',
    'level': 5,
    'tittle_level': 'Herramientas Básicas',
    'topic': 'Control de Versiones',
    'subtopic': 'Creación de repositorios en GitHub',
    'definition': '''
Crear repositorios en GitHub es el primer paso para compartir tu código con el mundo y colaborar con otros desarrolladores. Es como tener tu propio espacio en la nube para guardar y gestionar tus proyectos.

¿Por qué querrías hacer esto?  

Bueno, GitHub no solo es un lugar para guardar código. Es una plataforma social para programadores. Puedes mostrar tu trabajo, recibir feedback, contribuir a proyectos de código abierto y hasta encontrar empleo.

Aquí te explico los pasos básicos para crear un repositorio en GitHub:

1.  **Crea una cuenta en GitHub:** Si aún no tienes una, ve a github.com y regístrate. Es gratis para repositorios públicos.
2.  **Haz clic en el botón "New":** Lo encontrarás en la página principal o en tu perfil.
3.  **Dale un nombre a tu repositorio:** Elige un nombre descriptivo y fácil de recordar.
4.  **Añade una descripción (opcional):** Explica brevemente de qué trata tu proyecto.
5.  **Elige la visibilidad (público o privado):** Los repositorios públicos son visibles para todos, mientras que los privados solo los pueden ver las personas que invites.
6.  **Inicializa el repositorio con un README (opcional):** Un archivo README es como la "portada" de tu proyecto.  Puedes agregar información sobre cómo usarlo, cómo contribuir, etc.
7.  **Haz clic en "Create repository":** ¡Y listo!  Ya tienes tu repositorio en GitHub.

Ahora puedes subir tu código a este repositorio usando Git desde la terminal o usando la interfaz web de GitHub. ¡A compartir tu talento! 🚀
''',
    'code_example': '''
// No hay código para crear el repositorio, se hace en la interfaz web de GitHub

// Pero aquí un ejemplo de cómo enlazar un repositorio local con el remoto:

// 1. Crear el repositorio en GitHub (como se explicó arriba)

// 2. En la terminal, dentro de la carpeta de tu proyecto local:

// Agregar el repositorio remoto como "origin"
// git remote add origin <URL_DEL_REPOSITORIO_EN_GITHUB>

// Enviar el código local al repositorio remoto
// git push -u origin main

// Ejemplo de error:  Intentar hacer push a un repositorio remoto inexistente
// git remote add origin url_incorrecta // Esto dará error al hacer push
// git push origin main
''',
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Jr',
    'level': 5,
    'tittle_level': 'Herramientas Básicas',
    'topic': 'Pruebas Unitarias',
    'subtopic': 'Introducción a JUnit',
    'definition': '''
JUnit es un framework de código abierto que facilita la escritura y ejecución de pruebas unitarias en Java. Permite verificar que cada parte del código funcione correctamente de forma aislada.

¿Te preguntas por qué deberías usarlo?

Al implementar pruebas unitarias con JUnit, puedes detectar errores en etapas tempranas del desarrollo, lo que ahorra tiempo y recursos. Además, facilita el mantenimiento del código y mejora la calidad del software.

Para comenzar, necesitas agregar la dependencia de JUnit en tu proyecto y crear clases de prueba con métodos anotados que verifiquen el comportamiento esperado de tu código.
''',
    'code_example': '''
// Ejemplo básico de prueba con JUnit 5

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class CalculadoraTest {

    @Test
    void testSuma() {
        Calculadora calc = new Calculadora();
        int resultado = calc.sumar(2, 3);
        assertEquals(5, resultado);
    }
}

// Clase Calculadora a probar
class Calculadora {
    int sumar(int a, int b) {
        return a + b;
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Jr',
    'level': 5,
    'tittle_level': 'Herramientas Básicas',
    'topic': 'Pruebas Unitarias',
    'subtopic': 'Anotaciones básicas (@Test, @Before, @After)',
    'definition': '''
Las anotaciones en JUnit permiten definir el comportamiento de los métodos de prueba y su ciclo de vida. Las más comunes son:

- `@Test`: Indica que el método es una prueba unitaria.
- `@Before`: Se ejecuta antes de cada método de prueba.
- `@After`: Se ejecuta después de cada método de prueba.

¿Te preguntas cómo se utilizan?

Estas anotaciones ayudan a preparar el entorno antes de cada prueba y a limpiar recursos después de su ejecución. Por ejemplo, puedes inicializar objetos comunes en `@Before` y cerrarlos en `@After`.

Es importante notar que en JUnit 5, `@Before` y `@After` han sido reemplazadas por `@BeforeEach` y `@AfterEach` respectivamente, para mayor claridad.
''',
    'code_example': '''
// Uso de anotaciones en JUnit 5

import org.junit.jupiter.api.*;

public class BaseDeDatosTest {

    @BeforeEach
    void conectar() {
        System.out.println("Conectando a la base de datos...");
    }

    @Test
    void testConsulta() {
        System.out.println("Ejecutando consulta...");
        Assertions.assertTrue(true);
    }

    @AfterEach
    void desconectar() {
        System.out.println("Desconectando de la base de datos...");
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Jr',
    'level': 5,
    'tittle_level': 'Herramientas Básicas',
    'topic': 'Pruebas Unitarias',
    'subtopic': 'Assertions',
    'definition': '''
Las assertions en JUnit son métodos que verifican si una condición específica se cumple durante una prueba. Algunas de las más utilizadas son:

- `assertEquals(expected, actual)`: Verifica que dos valores sean iguales.
- `assertTrue(condition)`: Verifica que una condición sea verdadera.
- `assertFalse(condition)`: Verifica que una condición sea falsa.
- `assertNull(object)`: Verifica que un objeto sea nulo.
- `assertNotNull(object)`: Verifica que un objeto no sea nulo.

¿Te preguntas cómo aplicarlas?

Estas assertions permiten validar el comportamiento de tu código. Por ejemplo, puedes verificar que una función retorne el valor esperado o que una lista no esté vacía después de una operación.

Utilizar assertions adecuadas mejora la precisión de las pruebas y facilita la detección de errores.
''',
    'code_example': '''
// Ejemplo de assertions en JUnit 5

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class UsuarioTest {

    @Test
    void testNombreUsuario() {
        Usuario user = new Usuario("Carlos");
        assertEquals("Carlos", user.getNombre());
        assertNotNull(user);
        assertTrue(user.getNombre().startsWith("C"));
    }
}

// Clase Usuario a probar
class Usuario {
    private String nombre;

    Usuario(String nombre) {
        this.nombre = nombre;
    }

    String getNombre() {
        return nombre;
    }
}
'''
  });
}
