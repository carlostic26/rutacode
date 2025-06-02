import 'package:sqflite_common/sqlite_api.dart';

Future<void> insertJsJrLevel1Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Fundamentos de JavaScript',
    'topic': 'Introducción a JavaScript',
    'subtopic': '¿Qué es JavaScript?',
    'definition': '''
JavaScript es el lenguaje que le da vida a las páginas web. Piensa en una página web como un cuerpo: HTML sería el esqueleto (la estructura), CSS la ropa y el maquillaje (el estilo), y JavaScript serían los músculos, el cerebro y el sistema nervioso, todo lo que le permite moverse, interactuar y hacer cosas.

¿Seguramente te estarás preguntando de qué va todo esto?

Pues bien, JavaScript permite que los sitios web no sean solo estáticos, sino dinámicos. Esto significa que puede responder a lo que haces: si haces clic en un botón, si llenas un formulario, si ves una animación, todo eso es posible gracias a JavaScript. Es el motor detrás de muchas de las experiencias interactivas que tenemos en la web hoy en día. Desde un simple menú desplegable hasta complejas aplicaciones web como Google Maps o Netflix, JavaScript es fundamental. Es el lenguaje que permite que la web sea más que solo texto e imágenes; la convierte en una plataforma de interacción y funcionalidad.
''',
    'code_example': '''
// Un ejemplo básico de JavaScript interactuando con el HTML
// Digamos que tenemos un botón en nuestro HTML: <button id="miBoton">Haz clic</button>

document.getElementById('miBoton').addEventListener('click', function() {
  alert('¡Hola desde JavaScript!'); // Esto mostrará un mensaje emergente
});

// Ejemplo incorrecto: Intentar manipular un elemento que no existe
// document.getElementById('otroBoton').addEventListener('click', function() {
//   console.log('Esto no funcionará si no hay un botón con ID "otroBoton" en el HTML');
// });
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Fundamentos de JavaScript',
    'topic': 'Introducción a JavaScript',
    'subtopic': 'Historia de JavaScript',
    'definition': '''
La historia de JavaScript es bastante interesante y se remonta a 1995, cuando Brendan Eich, un ingeniero de Netscape, lo creó en solo diez días. Inicialmente se llamó Mocha, luego LiveScript, y finalmente JavaScript. El objetivo era añadir interactividad a los navegadores web.

¿Te estás preguntando por qué esto importa?

Bueno, conocer la historia nos ayuda a entender por qué JavaScript funciona de la manera que lo hace y por qué ha evolucionado tanto. En sus inicios, JavaScript era un lenguaje sencillo, pero rápidamente se convirtió en un estándar. Microsoft, con su Internet Explorer, lanzó su propia versión llamada JScript, lo que generó inconsistencias. Para resolver esto, se creó ECMAScript, que es la especificación estándar del lenguaje. La historia de JavaScript es la historia de cómo la web pasó de ser una serie de documentos estáticos a un ecosistema dinámico y lleno de aplicaciones. Es una evolución constante, y entender sus raíces nos da una perspectiva valiosa sobre su presente y futuro.
''',
    'code_example': '''
// No hay un ejemplo de código directo para la historia, ya que es un tema conceptual.
// Pero podríamos simular un "viaje en el tiempo" con una función:

function simularVersionAntigua() {
  // En las primeras versiones, la depuración era más rudimentaria
  console.log("¡Cuidado! Navegador de 1995 detectado.");
  // Muchas funcionalidades modernas no existirían
}

simularVersionAntigua();
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Fundamentos de JavaScript',
    'topic': 'Introducción a JavaScript',
    'subtopic': 'Versiones de ECMAScript',
    'definition': '''
ECMAScript, o ES, es la especificación estándar en la que se basa JavaScript. Piensa en ello como el manual de reglas que todos los motores de JavaScript deben seguir para asegurar que el código funcione de la misma manera en todos los navegadores y entornos.

¿No sé tú, pero a mí esto al principio me costó entenderlo?

Básicamente, cada año se lanza una nueva versión de ECMAScript (por ejemplo, ES2015, ES2016, etc.), y cada una trae nuevas características y mejoras al lenguaje. Esto es lo que permite que JavaScript evolucione constantemente, añadiendo funcionalidades que hacen nuestro trabajo más fácil y el código más potente. Por ejemplo, ES2015 (también conocida como ES6) fue una actualización enorme que introdujo cosas como las funciones flecha, las clases y las promesas, que transformaron la forma en que escribimos JavaScript. Las nuevas versiones solucionan problemas, mejoran el rendimiento y agregan herramientas que antes teníamos que simular o usar librerías externas. Mantenerse al día con estas versiones es clave para escribir código moderno y eficiente.
''',
    'code_example': '''
// Ejemplo de una característica introducida en ES6 (ES2015): las funciones flecha
// Antes de ES6
function sumarAntiguo(a, b) {
  return a + b;
}
console.log('Suma antigua:', sumarAntiguo(2, 3));

// Con ES6 (funciones flecha)
const sumarModerno = (a, b) => a + b;
console.log('Suma moderno:', sumarModerno(2, 3));

// Ejemplo incorrecto: Intentar usar una característica muy nueva en un entorno antiguo
// const potencia = (base, exponente) => base ** exponente; // El operador ** es de ES2016
// Si intentaras ejecutar esto en un navegador muy viejo, daría un error de sintaxis.
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Fundamentos de JavaScript',
    'topic': 'Introducción a JavaScript',
    'subtopic': 'Cómo ejecutar JavaScript',
    'definition': '''
Hay varias maneras de ejecutar código JavaScript, lo que te da mucha flexibilidad dependiendo de lo que quieras hacer. La forma más común es en un navegador web, donde JavaScript interactúa directamente con el HTML y el CSS para crear interfaces dinámicas.

Vamos a ver de que se trata todo esto...

Puedes incrustar JavaScript directamente en tu archivo HTML usando la etiqueta `<script>`, o, lo que es más común y recomendado, enlazar un archivo JavaScript externo. Esto ayuda a mantener tu código organizado y facilita la reutilización. Además de los navegadores, también puedes ejecutar JavaScript en el lado del servidor con Node.js, lo que permite usar JavaScript para construir aplicaciones completas, no solo front-end. Incluso hay entornos de desarrollo que te permiten ejecutar JavaScript en la consola para pruebas rápidas. La flexibilidad de JavaScript para ejecutarse en tantos lugares es una de las razones por las que es tan popular y versátil en el desarrollo web moderno.
''',
    'code_example': '''
// 1. En el HTML (dentro de un archivo .html)
/*
<!DOCTYPE html>
<html>
<head>
    <title>Mi Página</title>
</head>
<body>
    <h1>Cómo ejecutar JS</h1>
    <script>
        console.log("Hola desde JavaScript dentro del HTML");
    </script>
    <script src="mi_script.js"></script> </body>
</html>
*/

// 2. En un archivo JavaScript externo (mi_script.js)
console.log("Hola desde un archivo JavaScript externo");

// 3. En la consola del navegador (abriendo las DevTools F12)
// Simplemente escribes tu código aquí y presionas Enter
// alert("Hola desde la consola!");

// 4. Con Node.js (en tu terminal)
// Guardas este código en un archivo llamado 'app.js'
// console.log("Hola desde Node.js");
// Luego, en tu terminal, navegas hasta el directorio y ejecutas: node app.js
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Fundamentos de JavaScript',
    'topic': 'Declaración de Variables',
    'subtopic': 'Palabra clave var',
    'definition': '''
La palabra clave `var` fue la forma original de declarar variables en JavaScript. Cuando usas `var`, estás creando una variable que tiene un alcance de función o global. Esto significa que si la declaras dentro de una función, solo existe ahí, pero si la declaras fuera de cualquier función, está disponible en todo el script.

¿Seguramente te estarás preguntando por qué esto importa si tenemos `let` y `const` ahora?

Bueno, entender `var` es crucial porque todavía hay mucho código JavaScript "antiguo" por ahí que lo usa. La particularidad de `var` es su comportamiento de "hoisting": las declaraciones de variables con `var` se "elevan" al inicio de su ámbito, lo que a veces puede llevar a comportamientos inesperados o difíciles de depurar, especialmente para los principiantes. Además, `var` permite redeclarar la misma variable múltiples veces en el mismo ámbito sin lanzar un error, lo que puede causar confusiones. Aunque hoy en día se recomienda usar `let` y `const` para un código más predecible y seguro, saber cómo funciona `var` te ayudará a leer y entender cualquier código JavaScript que te encuentres.
''',
    'code_example': '''
// Ejemplo de var con ámbito de función
function ejemploVarFuncion() {
  var mensaje = "Hola desde la función";
  console.log(mensaje); // Salida: "Hola desde la función"
}
ejemploVarFuncion();
// console.log(mensaje); // Esto daría un error: mensaje no está definido

// Ejemplo de var con hoisting
console.log(nombre); // Salida: undefined (la declaración se eleva, pero no la asignación)
var nombre = "Alice";
console.log(nombre); // Salida: "Alice"

// Ejemplo de redeclaración con var (permite comportamientos inesperados)
var edad = 30;
var edad = 31; // No hay error, el valor se sobrescribe
console.log(edad); // Salida: 31
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Fundamentos de JavaScript',
    'topic': 'Declaración de Variables',
    'subtopic': 'Palabra clave let',
    'definition': '''
La palabra clave `let` se introdujo en ECMAScript 2015 (ES6) como una mejora para declarar variables en JavaScript. A diferencia de `var`, las variables declaradas con `let` tienen un ámbito de bloque, lo que significa que solo existen dentro del bloque de código (como un `if`, `for`, o un simple par de llaves `{}`) donde fueron definidas.

¿Te estás preguntando por qué esto importa y por qué es mejor que `var`?

La principal ventaja de `let` es que resuelve muchos de los problemas y comportamientos inesperados que tenía `var`, como el "hoisting" y la redeclaración fácil. Con `let`, si intentas acceder a una variable antes de su declaración dentro de su bloque, obtendrás un error (lo que se conoce como "Zona Temporal Muerta"), lo cual te ayuda a detectar errores más temprano. Además, no puedes redeclarar una variable `let` en el mismo ámbito, lo que previene errores sutiles de sobrescritura. Esto hace que el código sea mucho más predecible, fácil de entender y, en general, más robusto. Si estás escribiendo JavaScript moderno, `let` es tu opción preferida cuando el valor de la variable necesita cambiar.
''',
    'code_example': '''
// Ejemplo de let con ámbito de bloque
if (true) {
  let mensaje = "Hola desde el bloque if";
  console.log(mensaje); // Salida: "Hola desde el bloque if"
}
// console.log(mensaje); // Esto daría un error: mensaje no está definido (fuera de su bloque)

// Ejemplo de let y la Zona Temporal Muerta
// console.log(ciudad); // Error: Cannot access 'ciudad' before initialization
let ciudad = "Lima";

// Ejemplo de que no se puede redeclarar con let
let pais = "Perú";
// let pais = "Chile"; // Esto daría un error: Identifier 'pais' has already been declared
console.log(pais); // Salida: "Perú"
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Fundamentos de JavaScript',
    'topic': 'Declaración de Variables',
    'subtopic': 'Palabra clave const',
    'definition': '''
La palabra clave `const` también se introdujo en ECMAScript 2015 (ES6) y se usa para declarar "constantes". Al igual que `let`, las variables `const` tienen un ámbito de bloque. La gran diferencia es que una vez que asignas un valor a una constante, no puedes reasignarla.

¿No sé tú, pero a mí esto al principio me costó 🤯? Es fundamental entender que `const` no hace que el valor sea inmutable, sino que la *referencia* al valor sea inmutable. Si `const` apunta a un tipo de dato primitivo (como un número o una cadena de texto), el valor en sí es inmutable. Pero si apunta a un objeto o un array, puedes modificar las propiedades de ese objeto o los elementos de ese array, lo que no puedes hacer es reasignar la variable `const` para que apunte a un objeto o array completamente nuevo. Esto es súper útil para valores que sabes que no van a cambiar durante la ejecución de tu programa, como una URL base, un número de puerto o las opciones de configuración, lo que ayuda a prevenir errores y hace tu código más predecible.
''',
    'code_example': '''
// Ejemplo de const con valor primitivo (inmutable)
const PI = 3.14159;
// PI = 3.14; // Esto daría un error: Assignment to constant variable.
console.log(PI); // Salida: 3.14159

// Ejemplo de const con un objeto (la referencia es constante, el contenido mutable)
const usuario = { nombre: "Juan", edad: 25 };
usuario.edad = 26; // Esto es válido, se modifica una propiedad del objeto
console.log(usuario); // Salida: { nombre: "Juan", edad: 26 }

// const usuario = { nombre: "Pedro" }; // Esto daría un error: Assignment to constant variable.
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Fundamentos de JavaScript',
    'topic': 'Declaración de Variables',
    'subtopic': 'Reglas de nombramiento de variables',
    'definition': r'''
Nombrar variables de forma clara y coherente es una de esas cosas que parece pequeña, pero que marca una gran diferencia en la legibilidad y el mantenimiento de tu código. En JavaScript, hay algunas reglas básicas y convenciones que es bueno seguir.

¿Te estás preguntando por qué esto importa? Porque un buen nombre de variable puede ahorrarte horas de depuración y hace que tu código sea fácil de entender para ti y para cualquier otra persona que lo lea. Primero, los nombres de variables deben empezar con una letra, un guion bajo (`_`) o un signo de dólar (`$`). No pueden empezar con un número. Segundo, solo pueden contener letras, números, guiones bajos y signos de dólar. No se permiten espacios ni otros símbolos especiales. Tercero, JavaScript es "case-sensitive", lo que significa que `miVariable` es diferente de `mivariable`. La convención más usada es `camelCase` (empezar con minúscula y cada nueva palabra con mayúscula, como `nombreDeUsuario`), excepto para constantes globales que a menudo se escriben en `UPPER_SNAKE_CASE` (todo en mayúsculas y palabras separadas por guiones bajos, como `MAX_INTENTOS`). Evita usar palabras reservadas de JavaScript como nombres de variables (por ejemplo, `if`, `for`, `function`). Un buen nombre de variable describe su propósito de manera concisa y clara.
''',
    'code_example': r'''
// Ejemplos de nombres de variables válidos y buenas prácticas
let nombreUsuario = "Ana"; // camelCase, lo más común
let _estadoInterno = "activo"; // Válido, a veces se usa para variables "privadas"
let $elementoDOM = document.getElementById('miId'); // Válido, común para referencias a elementos DOM
const MAX_INTENTOS = 3; // UPPER_SNAKE_CASE para constantes globales

// Ejemplos de nombres de variables inválidos o malas prácticas
// let 1apellido = "García"; // Inválido: no puede empezar con número
// let mi variable = "valor"; // Inválido: no se permiten espacios
// let for = "bucle"; // Inválido: 'for' es una palabra reservada

let numeroDeUsuariosRegistrados = 10; // Buen nombre, descriptivo
let n = 10; // Mal nombre, poco descriptivo (evitar a menos que sea un contador simple en un bucle corto)
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Fundamentos de JavaScript',
    'topic': 'Declaración de Variables',
    'subtopic': 'Ámbito de variables (block, function, global)',
    'definition': '''
El ámbito, o *scope*, de una variable define dónde está disponible esa variable en tu código. Entender esto es fundamental para evitar errores y escribir código predecible, ya que determina qué partes de tu programa pueden acceder a una variable y cuáles no.

¿Te estás preguntando por qué esto importa? Pensemos por un momento en una oficina: cada persona tiene su propio escritorio (ámbito de bloque), donde guarda sus cosas personales. Si necesita algo de un archivo compartido (ámbito de función), puede ir a buscarlo. Y si necesita algo de la sala de suministros general (ámbito global), está disponible para todos. En JavaScript, tenemos tres tipos principales de ámbito:

* **Ámbito Global:** Las variables declaradas fuera de cualquier función o bloque tienen un ámbito global. Esto significa que son accesibles desde cualquier parte de tu código, lo cual puede ser conveniente pero también riesgoso si no se maneja con cuidado, ya que muchas variables globales pueden generar conflictos.
* **Ámbito de Función (o Local):** Las variables declaradas dentro de una función con `var`, `let` o `const` tienen un ámbito de función. Solo son accesibles desde dentro de esa función. Una vez que la función termina, esas variables dejan de existir.
* **Ámbito de Bloque:** Introducido con `let` y `const` en ES6, el ámbito de bloque significa que una variable es accesible solo dentro del bloque de código más cercano (delimitado por llaves `{}`). Esto es especialmente útil en bucles `for` y condicionales `if`, ya que las variables declaradas dentro de ellos no "escaparán" y causarán problemas fuera de su contexto.

Priorizar el ámbito de bloque y de función sobre el ámbito global ayuda a crear código más modular, fácil de mantener y con menos efectos secundarios inesperados.
''',
    'code_example': '''
// 1. Ámbito Global
const planeta = "Tierra"; // Variable global

function mostrarPlaneta() {
  console.log(planeta); // Acceso a variable global
}
mostrarPlaneta(); // Salida: Tierra
console.log(planeta); // Salida: Tierra

// 2. Ámbito de Función (con var)
function ejemploFuncionScope() {
  var mensajeFuncion = "Hola desde la función";
  console.log(mensajeFuncion); // Salida: Hola desde la función
}
ejemploFuncionScope();
// console.log(mensajeFuncion); // Error: mensajeFuncion is not defined (fuera del ámbito de la función)

// 3. Ámbito de Bloque (con let y const)
if (true) {
  let color = "azul";
  const forma = "círculo";
  console.log(color);  // Salida: azul
  console.log(forma);  // Salida: círculo
}
// console.log(color);  // Error: color is not defined (fuera del ámbito del bloque)
// console.log(forma);  // Error: forma is not defined (fuera del ámbito del bloque)

// Ejemplo combinado de ámbitos
let globalNum = 10;

function incrementar() {
  let funcionNum = 5;
  if (true) {
    let bloqueNum = 2;
    console.log(globalNum + funcionNum + bloqueNum); // Acceso a todos los ámbitos: 10 + 5 + 2 = 17
  }
  // console.log(bloqueNum); // Error: bloqueNum no está definido aquí
}
incrementar();
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Fundamentos de JavaScript',
    'topic': 'Declaración de Variables',
    'subtopic': 'Hoisting',
    'definition': '''
El "hoisting" es un comportamiento peculiar de JavaScript que a veces confunde un poco. Piensa en ello como si JavaScript "elevara" las declaraciones de variables y funciones al inicio de su respectivo ámbito *antes* de que el código se ejecute. Es importante entender que solo se eleva la *declaración*, no la *inicialización* (la asignación de un valor).

¿Seguramente te estarás preguntando de qué va todo esto?

Pues bien, con `var`, puedes usar una variable antes de declararla en el código, y no obtendrás un error, sino `undefined`. Esto se debe a que la declaración `var` se "mueve" al inicio de su función o ámbito global, pero la asignación de valor permanece donde la escribiste. Esto puede llevar a errores sutiles si no estás atento. Sin embargo, con `let` y `const`, el hoisting también ocurre, pero se comportan de manera diferente. Si intentas usar una variable `let` o `const` antes de declararla, JavaScript te lanzará un error de referencia (lo que se conoce como la "Zona Temporal Muerta"). Esto es una mejora significativa porque te obliga a declarar tus variables antes de usarlas, lo que resulta en un código mucho más claro y con menos errores. Entender el hoisting es clave para depurar y comprender cómo se interpretan tus variables en JavaScript.
''',
    'code_example': '''
// Ejemplo de Hoisting con var
console.log(fruta); // Salida: undefined (la declaración de 'fruta' se eleva)
var fruta = "manzana";
console.log(fruta); // Salida: manzana

// Esto es lo que JavaScript hace internamente con 'var':
/*
var fruta; // La declaración se mueve al inicio
console.log(fruta);
fruta = "manzana"; // La asignación permanece
console.log(fruta);
*/

// Ejemplo de Hoisting con let y const (Zona Temporal Muerta)
// console.log(verdura); // Error: Cannot access 'verdura' before initialization
let verdura = "zanahoria";
console.log(verdura);

// console.log(color); // Error: Cannot access 'color' before initialization
const color = "rojo";
console.log(color);

// Hoisting de funciones (declaraciones de función se elevan completamente)
saludar(); // Salida: ¡Hola mundo! (Funciona porque la declaración de la función se eleva)
function saludar() {
  console.log("¡Hola mundo!");
}

// Hoisting de expresiones de función (solo se eleva la declaración de la variable)
// decirAdios(); // Error: decirAdios is not a function (la variable se eleva, pero no la función asignada)
var decirAdios = function() {
  console.log("¡Adiós!");
};
decirAdios(); // Salida: ¡Adiós! (funciona después de la asignación)
'''
  });
}

Future<void> insertJsJrLevel2Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Tipos de Datos y Conversión',
    'topic': 'Tipos de Datos',
    'subtopic': 'Tipo string',
    'definition': r'''
Un `string` en JavaScript es una secuencia de caracteres, es decir, texto. Puedes usarlo para representar nombres, frases, direcciones o cualquier otra cosa que necesites escribir. Se definen encerrando el texto entre comillas simples (`' '`), comillas dobles (`" "`) o comillas invertidas (backticks ``` ` ```).

¿Seguramente te estarás preguntando cuál es la diferencia entre las comillas?

Las comillas simples y dobles funcionan de manera muy similar, la elección entre una u otra suele ser una cuestión de estilo personal o de consistencia dentro de un proyecto. Sin embargo, las comillas invertidas, introducidas en ES6, son mucho más potentes. Permiten crear "template literals", lo que significa que puedes insertar variables y expresiones directamente dentro de la cadena usando `${}` y también puedes escribir strings en múltiples líneas sin necesidad de caracteres especiales como `\n`. Trabajar con strings es una de las tareas más comunes en la programación, ya sea para mostrar mensajes al usuario, procesar entradas de formularios o manipular datos de texto.
''',
    'code_example': r'''
// Usando comillas dobles
let nombre = "Juan Pérez";
console.log(nombre); // Salida: Juan Pérez

// Usando comillas simples
let saludo = 'Hola, ¿cómo estás?';
console.log(saludo); // Salida: Hola, ¿cómo estás?

// Usando comillas invertidas (template literals)
let edad = 30;
let mensaje = `Mi nombre es ${nombre} y tengo ${edad} años.`;
console.log(mensaje); // Salida: Mi nombre es Juan Pérez y tengo 30 años.

// String de múltiples líneas con template literals
let poema = `
  Las rosas son rojas,
  las violetas azules,
  JavaScript es genial,
  ¡qué te lo creas!
`;
console.log(poema);

// Ejemplo de concatenación de strings (menos moderna que template literals para strings complejos)
let primerParte = "Hola";
let segundaParte = "Mundo";
let fraseCompleta = primerParte + " " + segundaParte;
console.log(fraseCompleta); // Salida: Hola Mundo
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Tipos de Datos y Conversión',
    'topic': 'Tipos de Datos',
    'subtopic': 'Tipo number',
    'definition': '''
El tipo `number` en JavaScript se utiliza para representar valores numéricos, tanto enteros como decimales (también conocidos como números de punto flotante). No hace distinción entre enteros y flotantes como otros lenguajes; todos son simplemente `numbers`.

¿Te estás preguntando por qué esto importa?

Pues bien, en JavaScript, los números se manejan internamente como números de punto flotante de doble precisión según el estándar IEEE 754. Esto significa que tienen una precisión muy alta, pero también que hay límites en los números muy grandes o muy pequeños que pueden representarse con total exactitud. Si necesitas trabajar con números extremadamente grandes o con una precisión decimal perfecta (por ejemplo, para cálculos financieros), puede que necesites usar el tipo `BigInt` (que veremos más adelante) o librerías específicas. Sin embargo, para la gran mayoría de las operaciones matemáticas en el día a día, el tipo `number` es lo que usarás. Puedes realizar operaciones aritméticas básicas como sumas, restas, multiplicaciones, divisiones, y también usar funciones matemáticas más avanzadas a través del objeto global `Math`.
''',
    'code_example': r'''
// Declaración de números enteros
let edad = 25;
console.log(edad); // Salida: 25

// Declaración de números decimales (punto flotante)
let precio = 99.99;
console.log(precio); // Salida: 99.99

// Operaciones aritméticas básicas
let suma = 10 + 5;     // Salida: 15
let resta = 20 - 7;    // Salida: 13
let multiplicacion = 3 * 6; // Salida: 18
let division = 100 / 4;  // Salida: 25
let modulo = 10 % 3;   // Salida: 1 (el resto de la división)

console.log(`Suma: ${suma}, Resta: ${resta}, Multiplicación: ${multiplicacion}`);
console.log(`División: ${division}, Módulo: ${modulo}`);

// Usando el objeto Math
let raizCuadrada = Math.sqrt(81);
console.log("Raíz cuadrada de 81:", raizCuadrada); // Salida: 9

let potencia = Math.pow(2, 3); // 2 elevado a la 3
console.log("2 elevado a la 3:", potencia); // Salida: 8

// Ejemplo de un número especial: NaN (Not-a-Number)
let resultadoInvalido = "hola" / 2;
console.log(resultadoInvalido); // Salida: NaN

// Ejemplo de Infinity
let dividiendoPorCero = 10 / 0;
console.log(dividiendoPorCero); // Salida: Infinity
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Tipos de Datos y Conversión',
    'topic': 'Tipos de Datos',
    'subtopic': 'Tipo boolean',
    'definition': '''
El tipo `boolean` en JavaScript es el tipo de dato más simple y solo puede tener dos valores: `true` (verdadero) o `false` (falso). Es fundamental para la lógica de programación, ya que se utiliza para tomar decisiones, controlar el flujo de un programa y representar condiciones.

¿No sé tú, pero a mí esto al principio me costó? 

Es fundamental para el control de flujo. Por ejemplo, en un juego, podrías tener una variable booleana `estaJugando` que sea `true` cuando el juego está activo y `false` cuando no. O en una aplicación de e-commerce, `productoEnStock` podría ser `true` o `false`. Estas variables booleanas son la base de las sentencias condicionales (`if/else`) y los bucles, permitiendo que tu código se adapte y reaccione a diferentes situaciones. Cada vez que ves un `if` o un `while`, hay un booleano, explícito o implícito, decidiendo el camino a seguir.
''',
    'code_example': '''
// Declaración de variables booleanas
let estaActivo = true;
let tienePermiso = false;

console.log(estaActivo);    // Salida: true
console.log(tienePermiso);  // Salida: false

// Uso en una sentencia condicional (if/else)
let usuarioLogueado = true;

if (usuarioLogueado) {
  console.log("Bienvenido a tu cuenta.");
} else {
  console.log("Por favor, inicia sesión.");
}

// Operadores lógicos que devuelven booleanos
let esMayorDeEdad = (edad >= 18); // Asumiendo 'edad' es una variable numérica
let puedeConducir = esMayorDeEdad && tienePermiso; // AND lógico

console.log("¿Es mayor de edad?", esMayorDeEdad);
console.log("¿Puede conducir?", puedeConducir);

// Ejemplo de valor "truthy" y "falsy" (conceptos importantes con booleanos)
// En un contexto booleano, algunos valores no booleanos se evalúan como true (truthy) o false (falsy)
if ("Hola") { // "Hola" es truthy
  console.log("El string 'Hola' es truthy.");
}

if (0) { // 0 es falsy
  console.log("Este mensaje no se mostrará porque 0 es falsy.");
}
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Tipos de Datos y Conversión',
    'topic': 'Tipos de Datos',
    'subtopic': 'Tipo null',
    'definition': '''
El tipo `null` en JavaScript es un valor especial que representa la ausencia intencional de cualquier valor de objeto. Es decir, cuando asignas `null` a una variable, estás diciendo explícitamente "esta variable no tiene ningún valor, y lo sé".

¿Seguramente te estarás preguntando de qué va todo esto?

Pensemos por un momento en una caja vacía que sabes que está vacía y que no hay nada. Eso es `null`. Es un valor que un desarrollador asigna para indicar que algo está vacío o no existe, de forma deliberada. A menudo se utiliza para inicializar una variable que más tarde contendrá un objeto, o para "resetear" el valor de una variable. Es importante no confundirlo con `undefined`, que veremos a continuación, aunque a veces sus comportamientos puedan parecer similares en ciertas comparaciones. `null` es un valor primitivo, a pesar de que `typeof null` devuelve 'object' (lo cual es una peculiaridad histórica de JavaScript, no significa que sea un objeto). Es un marcador claro de "vacío intencional".
''',
    'code_example': '''
// Declaración de una variable y asignación de null
let usuarioSeleccionado = null;
console.log(usuarioSeleccionado); // Salida: null

// Uso común: inicializar una variable antes de que tenga un valor real
let carritoDeCompras = null; // Al inicio, el carrito está vacío
// Más tarde en el código, si el usuario agrega productos:
// carritoDeCompras = { items: ["camisa", "pantalon"], total: 50 };

// Comprobación de null
if (usuarioSeleccionado === null) {
  console.log("Ningún usuario ha sido seleccionado.");
}

// Diferencia con un valor vacío en otros tipos
let cadenaVacia = "";
let arrayVacio = [];

console.log(cadenaVacia === null); // Salida: false
console.log(arrayVacio === null);  // Salida: false

// La "peculiaridad" de typeof null
console.log(typeof null); // Salida: "object" (un error histórico en JavaScript)
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Tipos de Datos y Conversión',
    'topic': 'Tipos de Datos',
    'subtopic': 'Tipo undefined',
    'definition': '''
El tipo `undefined` en JavaScript es un valor que indica que una variable ha sido declarada pero no se le ha asignado ningún valor, o que una propiedad de un objeto no existe. Es el valor por defecto de una variable recién creada.

¿Te estás preguntando por qué esto importa?

Pensemos por un momento en una caja. Si tienes una caja y no le has metido nada dentro, está `undefined`. No es que esté vacía a propósito (como en el caso de `null`), sino que simplemente aún no se le ha dado un contenido. JavaScript asigna `undefined` automáticamente en varias situaciones: cuando declaras una variable sin inicializarla, cuando accedes a una propiedad de un objeto que no existe, o cuando una función no devuelve explícitamente un valor. Es crucial entender `undefined` para depurar tu código, ya que a menudo aparece cuando hay errores lógicos o cuando se intentan usar variables o propiedades que no tienen un valor definido en ese momento. Es un indicador de que "falta un valor" o "aún no se ha establecido".
''',
    'code_example': r'''
// Declaración de una variable sin asignar un valor
let miVariable;
console.log(miVariable); // Salida: undefined

// Acceso a una propiedad de objeto que no existe
let persona = { nombre: "Carlos" };
console.log(persona.edad); // Salida: undefined

// Una función que no devuelve nada explícitamente
function noDevuelveNada() {
  // no hay 'return'
}
let resultadoFuncion = noDevuelveNada();
console.log(resultadoFuncion); // Salida: undefined

// Parámetros de función que no se pasan
function saludar(nombre) {
  console.log(`Hola, ${nombre}`);
}
saludar(); // Salida: Hola, undefined

// Comparaciones con undefined
console.log(miVariable === undefined); // Salida: true
console.log(null === undefined);     // Salida: false (valores diferentes)
console.log(null == undefined);      // Salida: true (misma "ausencia de valor" en comparación laxa)
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Tipos de Datos y Conversión',
    'topic': 'Tipos de Datos',
    'subtopic': 'Tipo bigint',
    'definition': r'''
El tipo `BigInt` se introdujo en ECMAScript 2020 para representar números enteros de una precisión arbitraria. Esto significa que puedes trabajar con números enteros que son mucho más grandes que el límite que puede manejar el tipo `number` regular en JavaScript.

¿No sé tú, pero a mí esto al principio me costó? 

Es que el tipo `number` normal tiene un límite para los enteros (aproximadamente hasta $2^{53} - 1$ y hasta $-(2^{53} - 1)$). Para la mayoría de las operaciones, esto es suficiente, pero en escenarios como la criptografía, identificadores muy largos de bases de datos o cálculos científicos que requieren números enteros enormes, el `number` normal se quedaba corto y podía llevar a errores de precisión. `BigInt` resuelve este problema. Para crear un `BigInt`, simplemente añades una `n` al final de un número entero literal, o usas la función `BigInt()`. Las operaciones aritméticas con `BigInt` funcionan de manera similar a los números normales, pero debes asegurarte de que todas las operandos sean `BigInt` para evitar errores.
''',
    'code_example': '''
// Creando BigInts
const numeroGrande = 9007199254740991n; // Número entero más grande que un Number puede representar con seguridad
const numeroAunMasGrande = numeroGrande + 10n;
console.log(numeroAunMasGrande); // Salida: 9007199254741001n

// Usando la función BigInt()
const otroNumeroGrande = BigInt("12345678901234567890");
console.log(otroNumeroGrande); // Salida: 12345678901234567890n

// Operaciones aritméticas con BigInt
const a = 10n;
const b = 2n;
console.log(a + b); // Salida: 12n
console.log(a * b); // Salida: 20n
console.log(a / b); // Salida: 5n (la división de BigInts truncará los decimales)

// Importante: No puedes mezclar BigInts con Numbers directamente en operaciones
// const mezcla = 10n + 5; // Esto daría un error: Cannot mix BigInt and other types
const mezclaCorrecta = 10n + BigInt(5); // Correcto: Convertir Number a BigInt
console.log(mezclaCorrecta); // Salida: 15n

// Comparaciones (funcionan como esperas)
console.log(10n > 5n); // Salida: true
console.log(10n === 10); // Salida: false (diferente tipo)
console.log(10n == 10);  // Salida: true (comparación laxa, coercion de tipo)
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Tipos de Datos y Conversión',
    'topic': 'Tipos de Datos',
    'subtopic': 'Tipo symbol',
    'definition': '''
El tipo `Symbol` se introdujo en ECMAScript 2015 (ES6) y es un tipo de dato primitivo que representa un identificador único e inmutable. La principal característica de un Symbol es que, aunque crees dos Symbols con la misma descripción, nunca serán iguales entre sí.

¿Seguramente te estarás preguntando para qué sirve esto?

Pensemos por un momento en una huella dactilar. Cada huella es única, incluso si dos personas tuvieran la misma inicial, su huella seguiría siendo distinta. Así funciona `Symbol`: te garantiza que cada Symbol que creas es verdaderamente único. Esto es increíblemente útil para evitar colisiones de nombres de propiedades en objetos. Por ejemplo, si diferentes librerías quieren añadir propiedades a un mismo objeto pero no quieren sobrescribirse mutuamente, pueden usar Symbols como claves de propiedad. Los Symbols también se usan para definir "well-known symbols" internos de JavaScript que modifican el comportamiento de ciertos objetos, como `Symbol.iterator` para hacer un objeto iterable. Son una herramienta más avanzada, pero muy potente para gestionar la unicidad y el comportamiento interno de los objetos.
''',
    'code_example': '''
// Creando Symbols
const id1 = Symbol('id');
const id2 = Symbol('id'); // Aunque la descripción es la misma, son Symbols diferentes

console.log(id1);      // Salida: Symbol(id)
console.log(id2);      // Salida: Symbol(id)
console.log(id1 === id2); // Salida: false (son únicos)

// Usando Symbols como claves de propiedad en objetos
const usuario = {
  nombre: "Alicia",
  [id1]: 123, // Usamos el Symbol como clave
  [id2]: 456  // Este es otra propiedad, no colisiona con id1
};

console.log(usuario.nombre); // Salida: Alicia
console.log(usuario[id1]);   // Salida: 123
console.log(usuario[id2]);   // Salida: 456

// Los Symbols no aparecen en los bucles for...in ni en Object.keys()
for (let key in usuario) {
  console.log(key); // Solo mostrará 'nombre'
}
console.log(Object.keys(usuario)); // Salida: ['nombre']
console.log(Object.getOwnPropertySymbols(usuario)); // Para ver las propiedades Symbol: [ Symbol(id), Symbol(id) ]

// Ejemplo de un "well-known symbol"
const myArray = [1, 2, 3];
const iterator = myArray[Symbol.iterator]();
console.log(iterator.next()); // Salida: { value: 1, done: false }
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Tipos de Datos y Conversión',
    'topic': 'Tipos de Datos',
    'subtopic': 'Tipo object',
    'definition': '''
El tipo `object` es el tipo de dato más complejo en JavaScript y actúa como un contenedor para colecciones de datos y funcionalidades más complejas. Prácticamente todo en JavaScript que no es un tipo primitivo (string, number, boolean, null, undefined, bigint, symbol) es un `object`. Esto incluye arrays, funciones, fechas, expresiones regulares, y por supuesto, los objetos literales que creamos con `{}`.

¿Te estás preguntando por qué esto importa?

Pues bien, los objetos son la base de la programación orientada a objetos en JavaScript y una herramienta fundamental para organizar datos relacionados. Un objeto literal es como un diccionario o un mapa, donde puedes almacenar pares clave-valor. Las claves (o nombres de propiedades) son strings (o Symbols), y los valores pueden ser de cualquier tipo de dato, incluyendo otros objetos o funciones (que en el contexto de un objeto se llaman "métodos"). Esta flexibilidad te permite modelar entidades del mundo real, agrupar datos de forma lógica y encapsular comportamientos. Entender los objetos es un paso crucial para dominar JavaScript, ya que te abre la puerta a estructuras de datos más avanzadas y a la programación orientada a objetos.
''',
    'code_example': r'''
// Creando un objeto literal básico
const miCoche = {
  marca: "Toyota",
  modelo: "Corolla",
  año: 2020,
  esElectrico: false,
  arrancar: function() { // Esto es un método (una función dentro de un objeto)
    console.log("El coche está arrancando...");
  },
  detalles: function() {
    return `Marca: ${this.marca}, Modelo: ${this.modelo}`;
  }
};

// Accediendo a propiedades del objeto
console.log(miCoche.marca);    // Salida: Toyota (notación de punto)
console.log(miCoche['modelo']); // Salida: Corolla (notación de corchetes, útil si la clave tiene espacios o es una variable)

// Llamando a un método del objeto
miCoche.arrancar(); // Salida: El coche está arrancando...
console.log(miCoche.detalles()); // Salida: Marca: Toyota, Modelo: Corolla

// Añadiendo una nueva propiedad
miCoche.color = "azul";
console.log(miCoche.color); // Salida: azul

// Otros tipos de objetos
const miArray = [1, 2, 3]; // Un array es un tipo de objeto
const miFuncion = function() {}; // Una función también es un objeto

console.log(typeof miArray);   // Salida: object
console.log(typeof miFuncion); // Salida: function (una excepción, pero sigue siendo un objeto)
console.log(typeof miCoche);   // Salida: object
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Tipos de Datos y Conversión',
    'topic': 'Tipos de Datos',
    'subtopic': 'Operador typeof',
    'definition': '''
El operador `typeof` en JavaScript es una herramienta sencilla pero muy útil que te permite averiguar el tipo de dato de una variable o una expresión. Cuando lo usas, te devuelve una cadena de texto que representa ese tipo.

¿Te estás preguntando por qué esto importa?

Pues bien, saber el tipo de dato es fundamental para realizar operaciones correctas y evitar errores en tu código, especialmente cuando trabajas con datos que provienen de fuentes externas (como la entrada de un usuario o una API) y no estás seguro de su formato. Por ejemplo, si esperas un número pero recibes una cadena de texto, `typeof` te lo indicará. Ten en cuenta que `typeof` tiene algunas peculiaridades históricas, la más famosa es que `typeof null` devuelve `'object'`, lo cual es un error del lenguaje que se ha mantenido por razones de compatibilidad. Además, para funciones, devuelve `'function'` (aunque las funciones son un tipo de objeto), y para arrays, también devuelve `'object'` (ya que los arrays son objetos). Para distinguir entre objetos y arrays, o entre diferentes tipos de objetos, a menudo necesitarás usar métodos más específicos como `Array.isArray()` o el operador `instanceof`. A pesar de estas pequeñas "rarezas", `typeof` sigue siendo tu primera parada para una rápida verificación de tipo.
''',
    'code_example': '''
// Ejemplos de uso de typeof con tipos primitivos
console.log(typeof "Hola");         // Salida: string
console.log(typeof 123);            // Salida: number
console.log(typeof true);           // Salida: boolean
console.log(typeof undefined);      // Salida: undefined
console.log(typeof 10n);            // Salida: bigint
console.log(typeof Symbol('foo'));  // Salida: symbol

// Ejemplos de uso de typeof con objetos y sus particularidades
console.log(typeof { a: 1 });       // Salida: object (para objetos literales)
console.log(typeof [1, 2, 3]);      // Salida: object (para arrays)
console.log(typeof function() {});   // Salida: function (para funciones)
console.log(typeof null);           // Salida: object (¡la famosa peculiaridad!)

// Cómo distinguir arrays de objetos (ya que typeof ambos es 'object')
let myArray = [1, 2];
let myObject = { a: 1 };

console.log(Array.isArray(myArray));   // Salida: true
console.log(Array.isArray(myObject));  // Salida: false

// Ejemplo práctico: Validar un tipo de entrada
function procesarEntrada(valor) {
  if (typeof valor === 'number') {
    console.log("El valor es un número:", valor * 2);
  } else if (typeof valor === 'string') {
    console.log("El valor es un string:", valor.toUpperCase());
  } else {
    console.log("Tipo de dato desconocido:", typeof valor);
  }
}

procesarEntrada(5);      // Salida: El valor es un número: 10
procesarEntrada("test"); // Salida: El valor es un string: TEST
procesarEntrada(true);   // Salida: Tipo de dato desconocido: boolean
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Tipos de Datos y Conversión',
    'topic': 'Conversión de Tipos',
    'subtopic': 'Conversión implícita (coerción)',
    'definition': '''
La conversión implícita, o "coerción", es un proceso que JavaScript realiza automáticamente cuando un operador o una función espera un tipo de dato y se le proporciona otro. En estos casos, JavaScript intenta convertir el valor al tipo esperado para poder realizar la operación.

¿Seguramente te estarás preguntando de qué va todo esto?

Pensemos por un momento en una situación cotidiana: si intentas mezclar una cuchara de metal con un imán, el metal reaccionará. De manera similar, en JavaScript, si intentas sumar un número y una cadena de texto, el lenguaje no te dará un error de inmediato. En su lugar, intentará que los tipos "cooperen". Por ejemplo, al sumar un número y un string, JavaScript convertirá el número a string y luego los concatenará. Si usas operadores de comparación laxa (`==`), también se produce coerción, tratando de hacer que los valores sean del mismo tipo antes de compararlos. Si bien puede ser conveniente, la coerción implícita es una fuente común de errores y comportamientos inesperados para los desarrolladores, ya que no siempre es obvio cómo JavaScript va a convertir los tipos. Es por eso que muchos prefieren usar la conversión explícita o los operadores de comparación estricta (`===`) para tener un control total sobre el proceso.
''',
    'code_example': r'''
// Ejemplo 1: Suma de string y number (el número se convierte a string)
let resultado1 = "Hola " + 5;
console.log(resultado1); // Salida: "Hola 5"
console.log(typeof resultado1); // Salida: "string"

// Ejemplo 2: Operación matemática con string numérico (el string se convierte a number)
let resultado2 = "10" / 2;
console.log(resultado2); // Salida: 5
console.log(typeof resultado2); // Salida: "number"

// Ejemplo 3: Comparación laxa (==) - null y undefined
console.log(null == undefined); // Salida: true (ambos representan "ausencia de valor")

// Ejemplo 4: Comparación laxa con booleanos (el número se convierte a booleano)
if (1) { // 1 es truthy, se convierte a true
  console.log("El número 1 es truthy");
}
if ("") { // "" (cadena vacía) es falsy, se convierte a false
  console.log("Este mensaje no se mostrará");
}
if ("0" == 0) { // El string "0" se convierte a number 0, y 0 == 0 es true
  console.log('"0" == 0 es verdadero');
}

// Ejemplo que puede llevar a confusión
let a = "5";
let b = 3;
let c = a + b; // "53" (concatenación)
let d = a - b; // 2 (resta, "5" se convierte a 5)
console.log(`a + b = ${c}, a - b = ${d}`);
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Tipos de Datos y Conversión',
    'topic': 'Conversión de Tipos',
    'subtopic': 'Conversión explícita',
    'definition': '''
La conversión explícita, también conocida como "type casting" en otros lenguajes, ocurre cuando el desarrollador fuerza intencionalmente un valor de un tipo de dato a otro. A diferencia de la coerción implícita, aquí eres tú quien decide y escribe el código para realizar la conversión.

¿Te estás preguntando por qué esto importa?

Pues bien, la conversión explícita te da un control total y una mayor claridad sobre cómo se manejan los tipos de datos en tu código. Es una buena práctica porque reduce la ambigüedad y previene los errores sutiles que pueden surgir de la coerción implícita de JavaScript. Hay varias funciones y constructores en JavaScript diseñados específicamente para la conversión explícita, como `Number()`, `String()`, `Boolean()`, `parseInt()`, `parseFloat()`, entre otros. Usar estas herramientas asegura que tu código sea más predecible y fácil de depurar, ya que el comportamiento de la conversión es evidente a primera vista. Es como si en lugar de dejar que el imán reaccione con el metal solo, tú decides activamente pegar la cuchara al imán cuando lo necesitas, y sabes exactamente qué va a pasar.
''',
    'code_example': '''
// 1. Conversión a Número
let strNumero = "123";
let numDesdeStr = Number(strNumero); // Convierte a número
console.log(numDesdeStr, typeof numDesdeStr); // Salida: 123 "number"

let strFlotante = "123.45";
let numDesdeStrFlotante = parseFloat(strFlotante); // Convierte a flotante
console.log(numDesdeStrFlotante, typeof numDesdeStrFlotante); // Salida: 123.45 "number"

let strEntero = "42px";
let numDesdeStrEntero = parseInt(strEntero); // Extrae el entero hasta el primer no-número
console.log(numDesdeStrEntero, typeof numDesdeStrEntero); // Salida: 42 "number"

// 2. Conversión a String
let numAString = 123;
let strDesdeNum = String(numAString); // Convierte a string
console.log(strDesdeNum, typeof strDesdeNum); // Salida: "123" "string"

let boolAString = true;
let strDesdeBool = String(boolAString);
console.log(strDesdeBool, typeof strDesdeBool); // Salida: "true" "string"

// Otra forma de convertir a string (concatenación con string vacío)
let numAString2 = 456 + "";
console.log(numAString2, typeof numAString2); // Salida: "456" "string"

// 3. Conversión a Booleano
let valorCero = 0;
let boolDesdeCero = Boolean(valorCero); // 0 es falsy
console.log(boolDesdeCero, typeof boolDesdeCero); // Salida: false "boolean"

let valorNoVacio = "Hola";
let boolDesdeString = Boolean(valorNoVacio); // "Hola" es truthy
console.log(boolDesdeString, typeof boolDesdeString); // Salida: true "boolean"

// Otra forma de convertir a booleano (doble negación)
let boolDesdeString2 = !!"texto";
console.log(boolDesdeString2, typeof boolDesdeString2); // Salida: true "boolean"
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Tipos de Datos y Conversión',
    'topic': 'Conversión de Tipos',
    'subtopic': 'Conversión de string a número',
    'definition': '''
Convertir un `string` que contiene un número a un `number` es una operación muy común en JavaScript, especialmente cuando se trabaja con entradas de usuario (que siempre se leen como strings) o datos recibidos de APIs. Hay varias formas de hacerlo explícitamente.

¿Te estás preguntando por qué esto importa?

Pues bien, si intentas realizar operaciones matemáticas con un string numérico, JavaScript podría terminar concatenando los strings en lugar de sumar los números, o darte un `NaN` (Not-a-Number) si la cadena no es puramente numérica. Para asegurar que las operaciones sean correctas, es vital convertir el string a número primero. Las formas más comunes son usando `Number()`, `parseInt()` y `parseFloat()`. `Number()` intentará convertir todo el string a un número; si no puede, devolverá `NaN`. `parseInt()` y `parseFloat()` son más indulgentes: leen el string desde el principio y convierten hasta que encuentran un carácter no numérico, ignorando el resto. `parseInt()` solo para enteros y `parseFloat()` para números con decimales. También puedes usar el operador unario `+` o multiplicar por 1 (`* 1`), que son atajos que realizan una conversión implícita pero con un comportamiento predecible. La elección dependerá de la exactitud que necesites y si esperas enteros o flotantes.
''',
    'code_example': '''
// 1. Usando Number() - convierte el string completo a número
let s1 = "123";
let n1 = Number(s1);
console.log(n1, typeof n1); // Salida: 123 "number"

let s2 = "3.14";
let n2 = Number(s2);
console.log(n2, typeof n2); // Salida: 3.14 "number"

let s3 = "Hola123";
let n3 = Number(s3);
console.log(n3, typeof n3); // Salida: NaN "number" (No es un número válido)

// 2. Usando parseInt() - extrae el entero del principio
let s4 = "456";
let n4 = parseInt(s4);
console.log(n4, typeof n4); // Salida: 456 "number"

let s5 = "789.50";
let n5 = parseInt(s5); // Ignora la parte decimal
console.log(n5, typeof n5); // Salida: 789 "number"

let s6 = "100px";
let n6 = parseInt(s6); // Convierte hasta el primer carácter no numérico
console.log(n6, typeof n6); // Salida: 100 "number"

let s7 = "abc123";
let n7 = parseInt(s7);
console.log(n7, typeof n7); // Salida: NaN "number" (no empieza con un número)

// 3. Usando parseFloat() - extrae el número flotante del principio
let s8 = "987.65";
let n8 = parseFloat(s8);
console.log(n8, typeof n8); // Salida: 987.65 "number"

let s9 = "50.5em";
let n9 = parseFloat(s9);
console.log(n9, typeof n9); // Salida: 50.5 "number"

// 4. Usando el operador unario + (atajo para Number())
let s10 = "200";
let n10 = +s10;
console.log(n10, typeof n10); // Salida: 200 "number"

let s11 = "400";
let n11 = s11 * 1; // Multiplicar por 1 también fuerza la conversión
console.log(n11, typeof n11); // Salida: 400 "number"
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Tipos de Datos y Conversión',
    'topic': 'Conversión de Tipos',
    'subtopic': 'Conversión de booleanos',
    'definition': '''
Convertir valores a `booleanos` es una operación que JavaScript realiza con frecuencia, ya sea explícita o implícitamente, especialmente en contextos donde se espera una condición de verdadero/falso (como en sentencias `if`, bucles `while`, o en el operador lógico `!`).

¿No sé tú, pero a mí esto al principio me costó? 

Es fundamental entender el concepto de "truthy" y "falsy". En JavaScript, no solo `true` y `false` son booleanos puros. Muchos otros valores, cuando se evalúan en un contexto booleano, se consideran "truthy" (se comportan como `true`) o "falsy" (se comportan como `false`).

Los valores *falsy* son:
* `false`
* `0` (el número cero)
* `""` (una cadena vacía)
* `null`
* `undefined`
* `NaN` (Not-a-Number)
* `0n` (BigInt cero)

Todos los demás valores, incluyendo strings no vacíos (incluso `"false"`), números distintos de cero, objetos (incluidos arrays vacíos `{}` y `[]`), y funciones, son *truthy*. Para una conversión explícita, puedes usar el constructor `Boolean()` o el operador de doble negación `!!`, que convierte cualquier valor a su equivalente booleano.
''',
    'code_example': r'''
// Conversión explícita usando Boolean()
console.log(Boolean(true));    // Salida: true
console.log(Boolean(false));   // Salida: false

console.log(Boolean(0));       // Salida: false (0 es falsy)
console.log(Boolean(1));       // Salida: true (cualquier número distinto de 0 es truthy)
console.log(Boolean(""));      // Salida: false (cadena vacía es falsy)
console.log(Boolean("Hola"));  // Salida: true (cadena no vacía es truthy)
console.log(Boolean(null));    // Salida: false (null es falsy)
console.log(Boolean(undefined)); // Salida: false (undefined es falsy)
console.log(Boolean(NaN));     // Salida: false (NaN es falsy)
console.log(Boolean({}));      // Salida: true (cualquier objeto, incluso vacío, es truthy)
console.log(Boolean([]));      // Salida: true (cualquier array, incluso vacío, es truthy)

// Conversión explícita usando el operador de doble negación (!!)
console.log(!!"Hola Mundo"); // Salida: true
console.log(!!0);           // Salida: false
console.log(!!{});          // Salida: true

// Conversión implícita en contextos booleanos
if (5 > 3) { // La expresión (5 > 3) es true
  console.log("5 es mayor que 3");
}

let nombre = "Alice";
if (nombre) { // 'nombre' (string no vacío) es truthy
  console.log(`El nombre es: ${nombre}`);
}

let contador = 0;
while (contador) { // 'contador' (0) es falsy, el bucle no se ejecuta
  console.log("Esto no se imprimirá");
}
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Tipos de Datos y Conversión',
    'topic': 'Conversión de Tipos',
    'subtopic': 'Conversión de objetos',
    'definition': '''
La conversión de objetos a otros tipos de datos (como strings o números) es un tema un poco más avanzado en JavaScript, ya que no es tan directa como convertir primitivos. Cuando un objeto necesita ser convertido a un tipo primitivo, JavaScript sigue una serie de reglas internas y busca métodos específicos en el objeto.

¿Te estás preguntando por qué esto importa?

Pues bien, la mayoría de las veces, cuando intentas operar un objeto con un operador que espera un primitivo (como `+` o `-`), JavaScript intenta convertir ese objeto a un tipo primitivo. No hay una única "conversión de objeto", sino que depende del "hint" (sugerencia) que reciba: `string`, `number` o `default`.
Cuando un objeto necesita ser convertido a un `string` (por ejemplo, en una concatenación), JavaScript primero busca el método `toString()` del objeto. Si no lo encuentra o no devuelve un primitivo, buscará `valueOf()`. Cuando necesita ser convertido a un `number` (por ejemplo, en operaciones matemáticas), primero busca `valueOf()`, y si no devuelve un primitivo o no existe, busca `toString()`. Si ambos están presentes y el "hint" es `default`, JavaScript elige basándose en el tipo esperado o puede tener un comportamiento específico (para fechas, por ejemplo, es `string`, para la mayoría de los demás objetos es `number`). Los objetos por defecto tienen un `toString()` que devuelve `"[object Object]"` y un `valueOf()` que devuelve el propio objeto, por lo que a menudo necesitarás definir tus propios métodos si quieres una conversión significativa.
''',
    'code_example': r'''
// Ejemplo 1: Objeto convertido a string (implícitamente)
const miObjeto = {
  nombre: "Test",
  edad: 1
};
console.log("El objeto es: " + miObjeto); // Salida: El objeto es: [object Object]
// Aquí, miObjeto.toString() se llama implícitamente, que por defecto devuelve "[object Object]"

// Ejemplo 2: Definir toString() y valueOf() personalizados
const punto = {
  x: 10,
  y: 20,
  // Para conversión a string
  toString: function() {
    return `Punto(${this.x}, ${this.y})`;
  },
  // Para conversión a number (devuelve la suma de coordenadas)
  valueOf: function() {
    return this.x + this.y;
  }
};

// Conversión a string (el "hint" es string)
console.log(String(punto)); // Salida: Punto(10, 20)
console.log(`Mi punto es: ${punto}`); // Salida: Mi punto es: Punto(10, 20) (template literal usa toString)

// Conversión a number (el "hint" es number)
console.log(Number(punto)); // Salida: 30 (llama a valueOf())
console.log(punto * 2);     // Salida: 60 (llama a valueOf(), luego multiplica)

// Operador + (el "hint" por defecto para + es 'default', pero si uno es string, se convierte a string)
console.log(punto + " un valor"); // Salida: Punto(10, 20) un valor (punto.toString() se llama)

// Ejemplo 3: Array convertido a string
const miArray = [1, 2, 3];
console.log(String(miArray)); // Salida: "1,2,3" (llama a miArray.toString())
console.log("Items: " + miArray); // Salida: "Items: 1,2,3"
'''
  });
}

Future<void> insertJsJrLevel3Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Estructuras de Control',
    'topic': 'Condicionales',
    'subtopic': 'Sentencia if',
    'definition': '''
La sentencia `if` es una de las estructuras de control más fundamentales en cualquier lenguaje de programación, y JavaScript no es la excepción. Te permite ejecutar un bloque de código solo si una condición específica es verdadera. Es como un "si esto es cierto, entonces haz esto".

¿Te estás preguntando por qué esto importa?

Pues bien, la toma de decisiones es el corazón de la programación. Sin una sentencia `if`, tu código simplemente seguiría un camino lineal. Con `if`, puedes hacer que tu programa reaccione de manera diferente a distintas situaciones. Piensa en una aplicación de clima: si la temperatura es inferior a cero, muestra un mensaje de "hace frío"; si no, no muestra ese mensaje. La condición dentro del `if` es una expresión que se evalúa a un booleano (verdadero o falso). Si el resultado es `true`, el código dentro de las llaves `{}` se ejecuta. Si es `false`, ese bloque de código se salta y el programa continúa con la siguiente línea después del `if`. Es la forma más básica y directa de introducir lógica condicional en tus programas.
''',
    'code_example': r'''
// Ejemplo básico de sentencia if
let temperatura = 25;

if (temperatura > 20) {
  console.log("Hace calor hoy."); // Esta línea se ejecutará
}

let estaLloviendo = false;
if (estaLloviendo) {
  console.log("No olvides tu paraguas."); // Esta línea NO se ejecutará
}

// Ejemplo con una condición más compleja
let edad = 18;
let tieneLicencia = true;

if (edad >= 18 && tieneLicencia) { // Ambas condiciones deben ser verdaderas
  console.log("Puedes conducir legalmente."); // Esta línea se ejecutará
}

// Uso de un valor "truthy" (que no es boolean pero se evalúa como true)
let nombreUsuario = "Carlos";
if (nombreUsuario) { // Un string no vacío es truthy
  console.log(`Bienvenido, ${nombreUsuario}!`);
}

// Uso de un valor "falsy" (que no es boolean pero se evalúa como false)
let puntos = 0;
if (puntos) { // 0 es falsy, este bloque NO se ejecutará
  console.log("Tienes puntos!");
} else {
  console.log("No tienes puntos todavía.");
}
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Estructuras de Control',
    'topic': 'Condicionales',
    'subtopic': 'Sentencia if...else',
    'definition': '''
La sentencia `if...else` es una extensión de la sentencia `if` que te permite definir dos caminos distintos para tu programa: uno si la condición es verdadera y otro si es falsa. Es como preguntar: "si esto es cierto, haz 'A'; de lo contrario, haz 'B'".

¿No sé tú, pero a mí esto al principio me costó? 

Es que a menudo no solo necesitas que algo ocurra si una condición es verdadera, sino que también necesitas una acción alternativa si la condición es falsa. Aquí es donde `else` entra en juego. Por ejemplo, si un usuario ingresa una contraseña, puedes decir: `if` la contraseña es correcta, permite el acceso; `else`, muestra un mensaje de error. Es una estructura de bifurcación binaria que cubre todas las posibilidades para una única condición. Esto hace que tu código sea más robusto al asegurarte de que siempre haya una respuesta, sin importar si la condición inicial se cumple o no.
''',
    'code_example': '''
// Ejemplo básico de sentencia if...else
let hora = 15;

if (hora < 12) {
  console.log("Buenos días.");
} else {
  console.log("Buenas tardes."); // Esta línea se ejecutará
}

// Otro ejemplo: verificar si un número es par o impar
let numero = 7;

if (numero % 2 === 0) { // El operador % (módulo) da el residuo de una división
  console.log("El número es par.");
} else {
  console.log("El número es impar."); // Esta línea se ejecutará
}

// if...else if...else (para múltiples condiciones)
let calificacion = 85;

if (calificacion >= 90) {
  console.log("Calificación: A");
} else if (calificacion >= 80) { // Si la primera es falsa, evalúa esta
  console.log("Calificación: B"); // Esta línea se ejecutará
} else if (calificacion >= 70) {
  console.log("Calificación: C");
} else { // Si ninguna de las anteriores es verdadera
  console.log("Calificación: F");
}
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Estructuras de Control',
    'topic': 'Condicionales',
    'subtopic': 'Sentencia switch',
    'definition': '''
La sentencia `switch` es una alternativa a las largas cadenas de `if...else if...else` cuando tienes una sola expresión que quieres comparar contra múltiples valores posibles. Es ideal para situaciones donde la decisión se basa en el valor exacto de una variable.

¿Te estás preguntando por qué esto importa?

Pues bien, pensemos por un momento en un sistema de menú: si el usuario elige '1', muestra la opción A; si elige '2', la opción B; y así sucesivamente. Con `if...else if`, esto podría volverse muy tedioso y difícil de leer. El `switch` simplifica esto. Evalúas una expresión una vez, y luego comparas el resultado con diferentes valores (`case`). Si encuentra una coincidencia, ejecuta el bloque de código asociado a ese `case`. Una parte crucial de la sentencia `switch` es la palabra clave `break;`. Si olvidas poner `break;` al final de cada `case`, el código seguirá ejecutándose en los siguientes `case` (lo que se conoce como "fall-through"), incluso si no coinciden, lo cual casi siempre es un error. También puedes incluir un `default` para capturar cualquier valor que no coincida con ningún `case` específico, similar al `else` en un `if...else`. Es una forma más limpia y eficiente de manejar múltiples rutas basadas en un único valor.
''',
    'code_example': '''
// Ejemplo básico de sentencia switch
let diaSemana = 3; // Lunes: 1, Martes: 2, etc.

switch (diaSemana) {
  case 1:
    console.log("Hoy es Lunes");
    break; // Importante para salir del switch
  case 2:
    console.log("Hoy es Martes");
    break;
  case 3:
    console.log("Hoy es Miércoles");
    break; // Este break evitará que se ejecute "Jueves"
  case 4:
    console.log("Hoy es Jueves");
    break;
  case 5:
    console.log("Hoy es Viernes");
    break;
  default: // Si ninguno de los casos anteriores coincide
    console.log("Es fin de semana o un día inválido.");
}
// Salida: Hoy es Miércoles

// Ejemplo con múltiples casos compartiendo el mismo código
let fruta = "manzana";

switch (fruta) {
  case "manzana":
  case "banana":
    console.log("Es una fruta común.");
    break;
  case "mango":
  case "aguacate":
    console.log("Es una fruta tropical.");
    break;
  default:
    console.log("No conozco esa fruta.");
}
// Salida: Es una fruta común.

// Ejemplo del "fall-through" (sin break - ¡generalmente un error!)
let numero = 1;
switch (numero) {
  case 1:
    console.log("Caso 1"); // Se ejecuta
  case 2:
    console.log("Caso 2"); // ¡También se ejecuta!
  default:
    console.log("Default"); // ¡Y también se ejecuta!
}
// Salida:
// Caso 1
// Caso 2
// Default
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Estructuras de Control',
    'topic': 'Manejo de Errores',
    'subtopic': 'Sentencia try...catch',
    'definition': '''
La sentencia `try...catch` es una de las herramientas más importantes para manejar errores de manera controlada en JavaScript. Te permite "probar" un bloque de código que podría fallar y, si ocurre un error, "capturarlo" para que tu programa no se detenga bruscamente, sino que pueda reaccionar y recuperarse.

¿Seguramente te estarás preguntando de qué va todo esto?

Pensemos por un momento en un paracaidista. El bloque `try` es como el salto: intentas hacer algo que podría salir mal. El bloque `catch` es el paracaídas de emergencia: si el salto sale mal (hay un error), el paracaídas se abre y te permite aterrizar de forma segura en lugar de estrellarte. Dentro del bloque `try` pones el código que sospechas que podría lanzar un error (por ejemplo, intentar acceder a una propiedad de un objeto que no existe, o una operación de red que falla). Si ocurre un error en ese bloque, la ejecución salta inmediatamente al bloque `catch`. El bloque `catch` recibe un objeto `error` (a menudo llamado `e` o `err`) que contiene información sobre lo que salió mal. Esto te permite mostrar un mensaje amigable al usuario, registrar el error para depuración, o intentar alguna acción de recuperación, manteniendo tu aplicación funcionando sin interrupciones abruptas.
''',
    'code_example': '''
// Ejemplo básico de try...catch
function dividir(a, b) {
  try {
    if (b === 0) {
      throw new Error("No se puede dividir por cero."); // Lanzamos un error intencional
    }
    return a / b;
  } catch (error) {
    console.error("Ocurrió un error al dividir:", error.message); // Capturamos el error
    return null; // Devolvemos un valor seguro en caso de error
  }
}

console.log(dividir(10, 2)); // Salida: 5
console.log(dividir(10, 0)); // Salida: Ocurrió un error al dividir: No se puede dividir por cero. / null

// Otro ejemplo: Accediendo a una propiedad indefinida
let usuario = { nombre: "Ana" };

try {
  console.log(usuario.direccion.calle); // Esto intentará acceder a 'direccion' que no existe
} catch (e) {
  console.error("Error al acceder a la dirección:", e.message);
}
// Salida: Error al acceder a la dirección: Cannot read properties of undefined (reading 'calle')

// Sin try...catch, el programa se detendría con un error no capturado.
// console.log(usuario.direccion.calle); // Esto rompería el script
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Estructuras de Control',
    'topic': 'Manejo de Errores',
    'subtopic': 'Bloque finally',
    'definition': '''
El bloque `finally` es una parte opcional de la sentencia `try...catch` que te permite especificar un bloque de código que se ejecutará siempre, sin importar si hubo un error en el bloque `try` o si el error fue capturado por el `catch`. Es como una cláusula de "limpieza" o "aseguramiento".

¿Te estás preguntando por qué esto importa?

Pensemos por un momento en cerrar un cajón después de sacar o guardar algo. Ya sea que encontraras lo que buscabas (no hubo error) o que el cajón estuviera vacío (hubo un error), siempre querrías cerrar el cajón. En programación, `finally` es ideal para tareas que deben realizarse en cualquier circunstancia, como liberar recursos. Por ejemplo, si abres una conexión a una base de datos o a un archivo en tu bloque `try`, y esa operación falla o se completa con éxito, querrías asegurarte de que la conexión se cierre para evitar pérdidas de memoria o recursos bloqueados. El código dentro de `finally` se ejecuta después del `try` y del `catch` (si el `catch` se ejecutó), e incluso si hay una sentencia `return` dentro del `try` o `catch`. Esto garantiza que ciertas acciones de limpieza siempre se lleven a cabo, haciendo tu código más robusto y eficiente en el manejo de recursos.
''',
    'code_example': r'''
// Ejemplo de try...catch...finally
function procesarArchivo(nombreArchivo) {
  let archivoAbierto = false; // Simula un recurso

  try {
    console.log(`Intentando abrir el archivo: ${nombreArchivo}`);
    // Simulación de una operación que puede fallar o tener éxito
    if (nombreArchivo === "archivo_inexistente.txt") {
      throw new Error("El archivo no se encontró.");
    }
    archivoAbierto = true;
    console.log("Archivo abierto exitosamente.");

    // Simulación de operación con el archivo
    // throw new Error("Error de lectura en el archivo."); // Descomentar para probar el error

    return "Contenido del archivo procesado.";

  } catch (error) {
    console.error("Se produjo un error:", error.message);
    return "Error al procesar el archivo."; // Devolver un valor para el flujo normal
  } finally {
    // Este bloque se ejecuta siempre, sin importar si hubo error o no
    if (archivoAbierto) {
      console.log("Cerrando el archivo.");
      // Aquí iría el código real para cerrar el archivo o liberar recursos
    } else {
      console.log("No se pudo abrir el archivo, no hay nada que cerrar.");
    }
  }
}

console.log(procesarArchivo("mi_documento.txt"));
// Salida esperada (sin error):
// Intentando abrir el archivo: mi_documento.txt
// Archivo abierto exitosamente.
// Cerrando el archivo.
// Contenido del archivo procesado.

console.log("\n--- Probando con un error ---");
console.log(procesarArchivo("archivo_inexistente.txt"));
// Salida esperada (con error):
// Intentando abrir el archivo: archivo_inexistente.txt
// Se produjo un error: El archivo no se encontró.
// No se pudo abrir el archivo, no hay nada que cerrar.
// Error al procesar el archivo.
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Estructuras de Control',
    'topic': 'Manejo de Errores',
    'subtopic': 'Palabra clave throw',
    'definition': '''
La palabra clave `throw` en JavaScript te permite generar (o "lanzar") un error personalizado de manera explícita. Es una forma de indicar que ha ocurrido una condición excepcional que el programa no puede manejar en ese punto y que debe ser capturada por un bloque `try...catch` superior.

¿Te estás preguntando por qué esto importa?

Pues bien, pensemos por un momento en un chef que está preparando una receta. Si le falta un ingrediente crucial, no puede continuar. En lugar de seguir y arruinar el plato, `throw` es como si el chef dijera: "¡Error! No tengo el ingrediente clave. Necesito que alguien solucione esto". Puedes `throw` cualquier tipo de valor: un string, un número, un objeto, o lo más común y recomendado, un objeto `Error` (o una de sus subclases). Lanzar un error es una forma poderosa de gestionar la lógica de tu aplicación, permitiéndote centralizar el manejo de problemas inesperados. Por ejemplo, si una función recibe argumentos inválidos, en lugar de continuar con datos incorrectos, puedes `throw` un error para forzar al código que la llama a manejar esa situación. Es esencial para construir aplicaciones robustas que reaccionen adecuadamente a situaciones anómalas.
''',
    'code_example': r'''
// Ejemplo 1: Lanzar un string (válido, pero menos recomendable)
function saludar(nombre) {
  if (!nombre) {
    throw "El nombre es obligatorio."; // Lanzamos un string
  }
  console.log(`Hola, ${nombre}`);
}

try {
  saludar(); // Intentamos llamar sin nombre
} catch (mensaje) {
  console.error("Error capturado (string):", mensaje); // Capturamos el string
}
// Salida: Error capturado (string): El nombre es obligatorio.

// Ejemplo 2: Lanzar un objeto Error (lo más recomendado)
function calcularDivision(a, b) {
  if (typeof a !== 'number' || typeof b !== 'number') {
    throw new TypeError("Ambos argumentos deben ser números."); // TypeError es una subclase de Error
  }
  if (b === 0) {
    throw new Error("División por cero no permitida."); // Lanzamos un objeto Error
  }
  return a / b;
}

try {
  console.log(calcularDivision(10, 2)); // Salida: 5
  console.log(calcularDivision(10, 0)); // Esto lanzará un error
} catch (error) {
  console.error("Error al calcular la división:", error.message);
  console.error("Tipo de error:", error.name); // Accedemos a propiedades del objeto Error
}
// Salida: Error al calcular la división: División por cero no permitida.
//         Tipo de error: Error

try {
  console.log(calcularDivision("diez", 2)); // Esto lanzará un TypeError
} catch (error) {
  console.error("Error al calcular la división:", error.message);
  console.error("Tipo de error:", error.name);
}
// Salida: Error al calcular la división: Ambos argumentos deben ser números.
//         Tipo de error: TypeError
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Estructuras de Control',
    'topic': 'Manejo de Errores',
    'subtopic': 'Objetos Error',
    'definition': '''
Los `Objetos Error` en JavaScript son instancias especiales que se crean cuando ocurre un error en tiempo de ejecución. Son la forma estándar y más útil de representar los errores, ya sea que sean lanzados automáticamente por el motor de JavaScript o que los lances tú mismo con la palabra clave `throw`.

¿No sé tú, pero a mí esto al principio me costó? 

Es que, aunque puedes lanzar cualquier cosa con `throw`, los objetos `Error` (y sus subclases) son los que te dan información estructurada y útil para depurar. Un objeto `Error` básico tiene al menos dos propiedades clave: `name` (el tipo de error, como 'Error', 'TypeError', 'ReferenceError', etc.) y `message` (una descripción legible del error). Además, en muchos entornos, también tienen una propiedad `stack`, que es un rastro de la pila de llamadas que te indica exactamente dónde ocurrió el error en tu código. JavaScript tiene varias subclases de `Error` ya definidas para errores comunes, como `TypeError` (valor de tipo inesperado), `ReferenceError` (variable no definida), `SyntaxError` (problemas de sintaxis), etc. Usar estos objetos de error estándar o crear tus propios objetos `Error` personalizados te permite categorizar y manejar los problemas de una manera mucho más eficaz y profesional.
''',
    'code_example': '''
// Creación y propiedades de un objeto Error básico
const miError = new Error("Algo salió mal en mi función.");
console.log(miError.name);    // Salida: Error
console.log(miError.message); // Salida: Algo salió mal en mi función.
console.log(miError.stack);   // Salida: (Una traza de la pila de llamadas, variará según el entorno)

// Ejemplos de subclases de Error comunes
try {
  // ReferenceError: ocurre cuando se intenta acceder a una variable no declarada
  console.log(variableNoExiste);
} catch (error) {
  console.error("Tipo de error:", error.name);    // Salida: ReferenceError
  console.error("Mensaje:", error.message);
}

try {
  // TypeError: ocurre cuando un valor no es del tipo esperado
  let numero = 5;
  numero.toUpperCase(); // Los números no tienen el método toUpperCase
} catch (error) {
  console.error("Tipo de error:", error.name);    // Salida: TypeError
  console.error("Mensaje:", error.message);
}

try {
  // SyntaxError: (normalmente no capturable en try...catch, ocurre en tiempo de parseo)
  // eval("const 1x = 10;"); // eval() puede lanzar SyntaxError
} catch (error) {
  console.error("Tipo de error (eval):", error.name);
  console.error("Mensaje (eval):", error.message);
}

// Custom Error: Creando tu propia clase de error (más avanzado, pero útil)
class ValidationError extends Error {
  constructor(message) {
    super(message);
    this.name = "ValidationError";
  }
}

function validarEdad(edad) {
  if (edad < 0 || edad > 120) {
    throw new ValidationError("La edad proporcionada no es válida.");
  }
  return true;
}

try {
  validarEdad(150);
} catch (error) {
  console.error("Error personalizado:", error.name);    // Salida: ValidationError
  console.error("Mensaje:", error.message);
}
'''
  });
}

Future<void> insertJsJrLevel4Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Bucles e Iteraciones',
    'topic': 'Bucles Comunes',
    'subtopic': 'Bucle for',
    'definition': '''
El bucle `for` es una de las estructuras de bucle más versátiles y comúnmente utilizadas en JavaScript. Te permite ejecutar un bloque de código un número específico de veces, controlando la inicialización, la condición de continuación y la actualización de un contador.

¿Seguramente te estarás preguntando de qué va todo esto?

Pues bien, pensemos por un momento en un atleta que necesita correr 10 vueltas en una pista. El bucle `for` es como su plan: empieza en la vuelta 1 (inicialización), sigue corriendo mientras no haya completado las 10 vueltas (condición), y al final de cada vuelta, registra que ha completado otra (actualización). La sintaxis del `for` tiene tres partes dentro de los paréntesis, separadas por puntos y comas: la primera es la **inicialización**, donde declaras y le das un valor inicial a tu variable de control (normalmente `i` para "índice"); la segunda es la **condición**, una expresión booleana que se evalúa antes de cada iteración, y si es `true`, el bucle continúa; la tercera es la **expresión de actualización**, que se ejecuta al final de cada iteración (normalmente para incrementar o decrementar el contador). Es la elección perfecta cuando sabes de antemano cuántas veces necesitas que se repita una acción.
''',
    'code_example': r'''
// Ejemplo básico de bucle for
for (let i = 0; i < 5; i++) {
  console.log(`Iteración número: ${i}`);
}
// Salida:
// Iteración número: 0
// Iteración número: 1
// Iteración número: 2
// Iteración número: 3
// Iteración número: 4

// Bucle for para recorrer un array
const frutas = ["Manzana", "Banana", "Cereza"];
for (let i = 0; i < frutas.length; i++) {
  console.log(`Me gusta la ${frutas[i]}`);
}
// Salida:
// Me gusta la Manzana
// Me gusta la Banana
// Me gusta la Cereza

// Bucle for con decremento
for (let i = 5; i > 0; i--) {
  console.log(`Cuenta regresiva: ${i}`);
}
// Salida:
// Cuenta regresiva: 5
// Cuenta regresiva: 4
// Cuenta regresiva: 3
// Cuenta regresiva: 2
// Cuenta regresiva: 1

// Bucle for sin alguna de sus partes (posible, pero menos común)
let contador = 0;
for (; contador < 3; contador++) { // Inicialización fuera
  console.log(`Contador: ${contador}`);
}

// Bucle infinito (¡cuidado!)
// for (;;) {
//   console.log("Esto se ejecutará para siempre a menos que se detenga manualmente.");
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Bucles e Iteraciones',
    'topic': 'Bucles Comunes',
    'subtopic': 'Bucle while',
    'definition': '''
El bucle `while` te permite ejecutar un bloque de código repetidamente *mientras* una condición específica sea verdadera. A diferencia del bucle `for`, que es ideal cuando conoces el número de iteraciones, el `while` es perfecto cuando no sabes de antemano cuántas veces necesitarás repetir algo.

¿Te estás preguntando por qué esto importa?

Pensemos por un momento en un jugador que sigue jugando un juego mientras tenga vidas. El bucle `while` es el mecanismo que mantiene el juego activo: mientras el jugador tenga vidas (la condición), el juego continúa. La clave del `while` es que la condición se evalúa *antes* de cada iteración. Si la condición es `true`, el código dentro del bucle se ejecuta. Si es `false`, el bucle se detiene. Esto significa que es vital asegurarte de que algo dentro del bucle cambie el estado de la condición en algún momento para que se vuelva falsa, de lo contrario, caerás en un bucle infinito que congelará tu programa. Es muy útil para situaciones donde esperas que una condición cambie externamente o después de un número desconocido de repeticiones, como leer datos de un stream hasta que se acaben, o esperar una entrada específica del usuario.
''',
    'code_example': r'''
// Ejemplo básico de bucle while
let contador = 0;
while (contador < 3) {
  console.log(`Contador actual: ${contador}`);
  contador++; // Es crucial actualizar la condición para evitar un bucle infinito
}
// Salida:
// Contador actual: 0
// Contador actual: 1
// Contador actual: 2

// Bucle while para simular un inicio de sesión hasta que la contraseña sea correcta
let contrasenaCorrecta = "secreto";
let intentoContrasena = "";
let intentos = 0;

// Simulación de entrada de usuario (en un entorno real usarías un prompt o un formulario)
function obtenerEntradaUsuario() {
  intentos++;
  if (intentos === 1) return "123";
  if (intentos === 2) return "clave";
  if (intentos === 3) return "secreto";
  return ""; // Para evitar bucle infinito en caso de que no haya coincidencia
}

while (intentoContrasena !== contrasenaCorrecta && intentos < 5) {
  console.log("Intento de inicio de sesión...");
  intentoContrasena = obtenerEntradaUsuario(); // Aquí se "actualiza" la condición
  if (intentoContrasena === contrasenaCorrecta) {
    console.log("¡Inicio de sesión exitoso!");
  } else if (intentos < 5) {
    console.log("Contraseña incorrecta. Intenta de nuevo.");
  }
}
if (intentoContrasena !== contrasenaCorrecta) {
  console.log("Demasiados intentos fallidos.");
}

// Ejemplo de bucle infinito (¡cuidado!)
// let x = 0;
// while (x < 5) {
//   console.log(x); // Nunca se incrementa x, se ejecuta indefinidamente
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Bucles e Iteraciones',
    'topic': 'Bucles Comunes',
    'subtopic': 'Bucle do...while',
    'definition': '''
El bucle `do...while` es similar al bucle `while`, pero con una diferencia crucial: el bloque de código dentro del `do...while` se ejecuta al menos una vez, *antes* de que la condición sea evaluada por primera vez. Después de esa primera ejecución, el bucle continúa repitiéndose *mientras* la condición sea verdadera.

¿No sé tú, pero a mí esto al principio me costó? 

Es que a diferencia de `while` (que evalúa la condición al inicio) y `for` (que tiene sus tres partes definidas al inicio), `do...while` te garantiza que el código se ejecutará al menos una vez. Esto es útil en escenarios donde necesitas ejecutar una acción y luego, basándote en el resultado de esa acción, decidir si continuar repitiéndola. Por ejemplo, si estás pidiéndole al usuario que ingrese un dato y quieres asegurarte de que al menos se le pida una vez, incluso si la condición inicial podría haber sido falsa. O si estás leyendo datos de algún lugar y quieres procesar al menos la primera parte, luego decidir si hay más para leer. Es menos común que `for` o `while`, pero tiene su nicho específico donde es la opción más elegante.
''',
    'code_example': r'''
// Ejemplo básico de bucle do...while
let i = 0;
do {
  console.log(`Valor de i: ${i}`);
  i++;
} while (i < 3);
// Salida:
// Valor de i: 0
// Valor de i: 1
// Valor de i: 2

// Ejemplo donde do...while ejecuta al menos una vez, incluso si la condición inicial es falsa
let j = 5;
do {
  console.log(`Valor de j (se ejecuta al menos una vez): ${j}`);
  j++;
} while (j < 3); // La condición es falsa desde el principio, pero el bloque se ejecutó una vez
// Salida:
// Valor de j (se ejecuta al menos una vez): 5

// Comparación con while (que no se ejecuta si la condición inicial es falsa)
let k = 5;
while (k < 3) {
  console.log(`Valor de k (nunca se ejecuta): ${k}`);
  k++;
}
// Salida: (nada, porque la condición inicial k < 3 es falsa)

// Uso práctico: pedir al usuario una entrada válida
let entradaUsuario;
let contrasenaCorrecta = "abc";

do {
  entradaUsuario = prompt("Por favor, introduce la contraseña:"); // Simulación de prompt en navegador
  if (entradaUsuario !== contrasenaCorrecta) {
    alert("Contraseña incorrecta. Intenta de nuevo.");
  }
} while (entradaUsuario !== contrasenaCorrecta);

console.log("¡Contraseña correcta! Acceso concedido.");
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Bucles e Iteraciones',
    'topic': 'Bucles Modernos',
    'subtopic': 'Bucle for...of',
    'definition': '''
El bucle `for...of` se introdujo en ES6 (ECMAScript 2015) y proporciona una forma más sencilla y directa de iterar sobre objetos iterables (como arrays, strings, Maps, Sets, etc.). A diferencia del bucle `for` tradicional, no necesitas manejar índices ni preocuparte por la longitud del iterable.

¿Seguramente te estarás preguntando de qué va todo esto?

Pues bien, piensa en el `for...of` como una forma de decir "para cada elemento de esta colección, haz algo". En lugar de acceder a los elementos por su posición (como `array[i]`), el `for...of` te da el elemento directamente en cada iteración. Esto hace que el código sea más limpio y legible, especialmente cuando solo te interesa el valor de cada elemento y no su índice. No funciona con objetos literales (que no son iterables por defecto), pero sí con cualquier objeto que implemente el protocolo de iteración (es decir, que tenga el método `[Symbol.iterator]()`). Es la opción preferida para recorrer arrays y otros iterables modernos, haciendo tu código más conciso y menos propenso a errores de "off-by-one" (donde te equivocas por uno en el índice).
''',
    'code_example': r'''
// Iterando sobre un Array
const numeros = [10, 20, 30];
for (const numero of numeros) {
  console.log(numero);
}
// Salida:
// 10
// 20
// 30

// Iterando sobre un String (cada carácter es un elemento)
const saludo = "Hola";
for (const caracter of saludo) {
  console.log(caracter);
}
// Salida:
// H
// o
// l
// a

// Iterando sobre un Set
const colores = new Set(['rojo', 'verde', 'azul']);
for (const color of colores) {
  console.log(color);
}
// Salida (el orden puede variar ligeramente en Sets):
// rojo
// verde
// azul

// Iterando sobre un Map (obtiene [clave, valor] en cada iteración)
const mapa = new Map([
  ['a', 1],
  ['b', 2]
]);
for (const [clave, valor] of mapa) {
  console.log(`Clave: ${clave}, Valor: ${valor}`);
}
// Salida:
// Clave: a, Valor: 1
// Clave: b, Valor: 2

// Intentando iterar sobre un objeto literal (dará error porque no es directamente iterable)
const miObjeto = { a: 1, b: 2 };
// for (const valor of miObjeto) { // TypeError: miObjeto is not iterable
//   console.log(valor);
// }

// Para iterar sobre las propiedades de un objeto literal, usar Object.keys(), Object.values(), o Object.entries() con for...of
for (const key of Object.keys(miObjeto)) {
  console.log(`Clave: ${key}, Valor: ${miObjeto[key]}`);
}
// Salida:
// Clave: a, Valor: 1
// Clave: b, Valor: 2
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Bucles e Iteraciones',
    'topic': 'Bucles Modernos',
    'subtopic': 'Bucle for...in',
    'definition': '''
El bucle `for...in` te permite iterar sobre las *propiedades* enumerables de un objeto. Es importante destacar que no está diseñado para iterar sobre arrays (aunque técnicamente funcionará, pero no en el orden esperado y no es la mejor práctica). Su principal caso de uso son los objetos literales, donde quieres recorrer sus claves (nombres de propiedades).

¿Te estás preguntando por qué esto importa?

Pues bien, piensa en el `for...in` como una forma de decir "para cada propiedad de este objeto, haz algo". En cada iteración, el bucle te da el *nombre* de la propiedad (una cadena de texto), no el valor. Si quieres acceder al valor, necesitas usar la notación de corchetes (`objeto[propiedad]`). Es crucial recordar que el `for...in` itera sobre las propiedades enumerables, lo que significa que no recorrerá las propiedades heredadas o las no enumerables (propiedades añadidas directamente al objeto con `Object.defineProperty()` y `enumerable: false`). El orden de iteración no está garantizado y puede variar entre navegadores. Si necesitas iterar sobre los elementos de un array en orden, usa `for`, `for...of`, o métodos de array como `forEach()`. Para objetos, si necesitas un orden específico o quieres controlar qué propiedades se iteran, considera usar `Object.keys()`, `Object.values()`, o `Object.entries()` junto con un bucle `for...of`.
''',
    'code_example': r'''
// Ejemplo básico de for...in con un objeto
const persona = {
  nombre: "Carlos",
  edad: 30,
  ciudad: "Madrid"
};

for (const key in persona) {
  console.log(`Propiedad: ${key}, Valor: ${persona[key]}`);
}
// Salida (el orden no está garantizado, pero suele ser el de definición):
// Propiedad: nombre, Valor: Carlos
// Propiedad: edad, Valor: 30
// Propiedad: ciudad, Valor: Madrid

// Peligro de for...in con arrays (NO RECOMENDADO)
const miArray = ['a', 'b', 'c'];
for (const index in miArray) {
  console.log(`Índice: ${index}, Valor: ${miArray[index]}`);
}
// Salida (parece funcionar, pero puede incluir propiedades no numéricas del prototipo si las hubiera):
// Índice: 0, Valor: a
// Índice: 1, Valor: b
// Índice: 2, Valor: c
// Para arrays, usa for...of o for (let i...) o forEach() para mayor seguridad y claridad.

// Propiedades heredadas (for...in las incluye si son enumerables)
function Animal() {
  this.especie = "Mamífero";
}
function Perro() {
  this.nombre = "Firulais";
}
Perro.prototype = new Animal(); // Hereda de Animal

const miPerro = new Perro();
for (const prop in miPerro) {
  // Aquí verás 'nombre' y 'especie'
  // Es una buena práctica usar hasOwnProperty() para evitar propiedades heredadas
  if (miPerro.hasOwnProperty(prop)) {
    console.log(`Propiedad propia: ${prop}, Valor: ${miPerro[prop]}`);
  } else {
    console.log(`Propiedad heredada: ${prop}, Valor: ${miPerro[prop]}`);
  }
}
// Salida:
// Propiedad propia: nombre, Valor: Firulais
// Propiedad heredada: especie, Valor: Mamífero
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Bucles e Iteraciones',
    'topic': 'Control de Flujo en Bucles',
    'subtopic': 'Uso de break',
    'definition': '''
La palabra clave `break` se utiliza dentro de los bucles (como `for`, `while`, `do...while`, `for...of`, `for...in`) para terminar la ejecución del bucle de forma prematura. Una vez que `break` es ejecutado, el bucle se detiene por completo y la ejecución del programa continúa con la sentencia que sigue inmediatamente al bucle.

¿Seguramente te estarás preguntando de qué va todo esto?

Pues bien, piensa en el `break` como un botón de "parada de emergencia" en un bucle. Imagina que estás buscando un artículo específico en una lista de compras muy larga. Una vez que encuentras el artículo, no tiene sentido seguir revisando el resto de la lista. Ahí es donde `break` es útil: te permite salir del bucle tan pronto como se cumple una condición deseada, lo que optimiza el rendimiento y evita ciclos innecesarios. Es crucial para situaciones en las que un resultado específico significa que ya no necesitas seguir iterando, como encontrar el primer elemento que cumple un criterio, validar una entrada única, o cuando ocurre un error grave dentro de un bucle que impide continuar. Su uso correcto puede hacer que tu código sea más eficiente y legible.
''',
    'code_example': r'''
// Ejemplo 1: Detener un bucle for cuando se encuentra un valor
for (let i = 1; i <= 10; i++) {
  console.log(`Número actual: ${i}`);
  if (i === 5) {
    console.log("¡Se encontró el número 5! Terminando el bucle.");
    break; // El bucle se detendrá aquí
  }
}
// Salida:
// Número actual: 1
// Número actual: 2
// Número actual: 3
// Número actual: 4
// Número actual: 5
// ¡Se encontró el número 5! Terminando el bucle.

// Ejemplo 2: Usar break en un bucle while para salir de una condición
let intentos = 0;
const contrasenaCorrecta = "secreto";
let entradaUsuario;

while (true) { // Bucle infinito intencional
  intentos++;
  entradaUsuario = prompt("Introduce la contraseña (o escribe 'salir'):"); // Simulación de prompt

  if (entradaUsuario === contrasenaCorrecta) {
    console.log("¡Contraseña correcta! Acceso concedido.");
    break; // Salir del bucle porque la condición se cumplió
  } else if (entradaUsuario === 'salir') {
    console.log("Saliendo del intento de inicio de sesión.");
    break; // Salir del bucle por petición del usuario
  } else {
    console.log(`Intento fallido. Llevas ${intentos} intentos.`);
    if (intentos >= 3) {
      console.log("Demasiados intentos fallidos. Bloqueado.");
      break; // Salir del bucle por intentos excesivos
    }
  }
}

// Ejemplo 3: Rompiendo un bucle for...of
const productos = ['camiseta', 'pantalón', 'zapatos', 'gorra'];
const productoBuscado = 'zapatos';

for (const producto of productos) {
  if (producto === productoBuscado) {
    console.log(`¡Encontré el producto: ${producto}!`);
    break;
  }
  console.log(`Revisando: ${producto}`);
}
// Salida:
// Revisando: camiseta
// Revisando: pantalón
// ¡Encontré el producto: zapatos!
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Bucles e Iteraciones',
    'topic': 'Control de Flujo en Bucles',
    'subtopic': 'Uso de continue',
    'definition': '''
La palabra clave `continue` se utiliza dentro de los bucles (como `for`, `while`, `do...while`, `for...of`, `for...in`) para saltar la iteración actual del bucle y pasar directamente a la siguiente iteración. Es decir, el código restante en la iteración actual del bucle se omite, pero el bucle en sí no se detiene.

¿No sé tú, pero a mí esto al principio me costó? 

Pensemos por un momento en un filtro de contenido: estás procesando una lista de elementos y solo quieres trabajar con aquellos que cumplen ciertas características. Si un elemento no cumple esas características, no quieres que tu programa se detenga, sino que simplemente salte a la siguiente. `continue` es como un "salto de línea" dentro del bucle: te permite omitir el resto del código del bloque actual y pasar rápidamente a la siguiente repetición del bucle. Es útil para evitar ejecutar lógica innecesaria en ciertas iteraciones o para filtrar elementos que no cumplen una condición, sin tener que anidar muchas sentencias `if`.
''',
    'code_example': r'''
// Ejemplo 1: Saltar números pares en un bucle for
for (let i = 1; i <= 5; i++) {
  if (i % 2 === 0) { // Si el número es par
    console.log(`Saltando el número par: ${i}`);
    continue; // Pasa a la siguiente iteración
  }
  console.log(`Número impar procesado: ${i}`);
}
// Salida:
// Número impar procesado: 1
// Saltando el número par: 2
// Número impar procesado: 3
// Saltando el número par: 4
// Número impar procesado: 5

// Ejemplo 2: Procesar solo strings que no están vacíos en un array
const datos = ["apple", "", "banana", null, "cherry", undefined, ""];

for (const item of datos) {
  if (typeof item !== 'string' || item.length === 0) { // Si no es string o es string vacío
    console.log(`Ignorando elemento inválido: ${item}`);
    continue; // Pasa al siguiente item
  }
  console.log(`Procesando string: ${item.toUpperCase()}`);
}
// Salida:
// Procesando string: APPLE
// Ignorando elemento inválido:
// Procesando string: BANANA
// Ignorando elemento inválido: null
// Procesando string: CHERRY
// Ignorando elemento inválido: undefined
// Ignorando elemento inválido:

// Ejemplo 3: continue en un bucle while
let contador = 0;
while (contador < 5) {
  contador++;
  if (contador === 3) {
    console.log("Saltando el 3.");
    continue; // Salta la iteración actual cuando contador es 3
  }
  console.log(`Contador: ${contador}`);
}
// Salida:
// Contador: 1
// Contador: 2
// Saltando el 3.
// Contador: 4
// Contador: 5
'''
  });
}

Future<void> insertJsJrLevel5Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Operadores y Expresiones',
    'topic': 'Tipos de Operadores',
    'subtopic': 'Operadores aritméticos (+, -, *, /, %)',
    'definition': '''
Los operadores aritméticos en JavaScript se utilizan para realizar cálculos matemáticos entre valores numéricos. Son los bloques de construcción fundamentales para cualquier operación cuantitativa en tu código.

¿Seguramente te estarás preguntando de qué va todo esto?

Pues bien, estos operadores funcionan exactamente como esperarías en matemáticas básicas:
* **`+` (Adición):** Suma dos números. Si uno de los operandos es un string, realiza concatenación de strings.
* **`-` (Sustracción):** Resta el segundo número del primero.
* **`*` (Multiplicación):** Multiplica dos números.
* **`/` (División):** Divide el primer número por el segundo. Si divides por cero, el resultado es `Infinity` (o `-Infinity` si el numerador es negativo), no un error.
* **`%` (Módulo o Resto):** Devuelve el resto de una división entera. Es útil para determinar si un número es par o impar, o para saber si un número es múltiplo de otro.

Dominar estos operadores es esencial para cualquier lógica que implique cálculos, desde simples contadores hasta algoritmos complejos. Son la base de la manipulación numérica en JavaScript.
''',
    'code_example': r'''
let a = 10;
let b = 3;

// Adición
let suma = a + b;
console.log(`Suma: ${suma}`); // Salida: Suma: 13

// Sustracción
let resta = a - b;
console.log(`Resta: ${resta}`); // Salida: Resta: 7

// Multiplicación
let multiplicacion = a * b;
console.log(`Multiplicación: ${multiplicacion}`); // Salida: Multiplicación: 30

// División
let division = a / b;
console.log(`División: ${division}`); // Salida: División: 3.3333333333333335

// Módulo (Resto)
let modulo = a % b;
console.log(`Módulo: ${modulo}`); // Salida: Módulo: 1 (10 dividido por 3 es 3 con un resto de 1)

// Ejemplo de concatenación con +
let texto = "Hola " + "Mundo";
console.log(texto); // Salida: Hola Mundo

let textoNumero = "El número es: " + 5;
console.log(textoNumero); // Salida: El número es: 5

// División por cero
console.log(10 / 0); // Salida: Infinity
console.log(-10 / 0); // Salida: -Infinity
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Operadores y Expresiones',
    'topic': 'Tipos de Operadores',
    'subtopic': 'Operadores de asignación (=, +=, -=, etc.)',
    'definition': '''
Los operadores de asignación en JavaScript se utilizan para asignar un valor a una variable. El operador de asignación básico es `=`, pero existen otros operadores compuestos que combinan una operación aritmética (o bit a bit) con la asignación, ofreciendo una forma abreviada y concisa de actualizar el valor de una variable.

¿Te estás preguntando por qué esto importa?

Pues bien, estos operadores hacen tu código más eficiente y legible al reducir la repetición. En lugar de escribir `x = x + 5;`, puedes usar el operador de asignación compuesto `x += 5;`. Ambos hacen lo mismo: toman el valor actual de `x`, le suman 5, y luego asignan el nuevo resultado a `x`. Esto es particularmente útil en bucles o funciones donde actualizas constantemente el valor de una variable. Los operadores de asignación compuestos incluyen:
* **`=` (Asignación simple):** Asigna el valor del operando derecho al operando izquierdo.
* **`+=` (Adición y asignación):** `x += y` es equivalente a `x = x + y`.
* **`-=` (Sustracción y asignación):** `x -= y` es equivalente a `x = x - y`.
* **`*=` (Multiplicación y asignación):** `x *= y` es equivalente a `x = x * y`.
* **`/=` (División y asignación):** `x /= y` es equivalente a `x = x / y`.
* **`%=` (Módulo y asignación):** `x %= y` es equivalente a `x = x % y`.
* **`**=` (Exponenciación y asignación, ES7):** `x **= y` es equivalente a `x = x ** y`.

Además de los aritméticos, también existen operadores de asignación para operaciones bit a bit (`&=`, `|=`, `^=`, `<<=`, `>>=`, `>>>=`) y lógicas (`&&=`, `||=`, `??=`, ES11), que se verán en otros temas o niveles más avanzados.
''',
    'code_example': r'''
let x = 10;
let y = 5;

// Operador de asignación simple
let z = 20;
console.log(`z = ${z}`); // Salida: z = 20

// Operador de adición y asignación (+=)
x += y; // x = x + y; (10 + 5 = 15)
console.log(`x después de +=: ${x}`); // Salida: x después de +=: 15

// Operador de sustracción y asignación (-=)
x = 10; // Reiniciar x para el ejemplo
x -= y; // x = x - y; (10 - 5 = 5)
console.log(`x después de -=: ${x}`); // Salida: x después de -=: 5

// Operador de multiplicación y asignación (*=)
x = 10;
x *= y; // x = x * y; (10 * 5 = 50)
console.log(`x después de *=: ${x}`); // Salida: x después de *=: 50

// Operador de división y asignación (/=)
x = 10;
x /= y; // x = x / y; (10 / 5 = 2)
console.log(`x después de /=: ${x}`); // Salida: x después de /=: 2

// Operador de módulo y asignación (%=)
x = 10;
x %= y; // x = x % y; (10 % 5 = 0)
console.log(`x después de %=: ${x}`); // Salida: x después de %=: 0

// Operador de exponenciación y asignación (**=)
let base = 2;
base **= 3; // base = base ** 3; (2^3 = 8)
console.log(`base después de **=: ${base}`); // Salida: base después de **=: 8
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Operadores y Expresiones',
    'topic': 'Tipos de Operadores',
    'subtopic': 'Operadores lógicos (&&, ||, !)',
    'definition': '''
Los operadores lógicos en JavaScript se utilizan para combinar expresiones booleanas o para invertir el valor de una expresión booleana. Son esenciales para construir condiciones complejas y controlar el flujo de tu programa.

¿No sé tú, pero a mí esto al principio me costó? 

Pensemos por un momento en tomar decisiones en la vida real. A menudo decimos: "Si tengo dinero *y* tiempo, iré de viaje" (AND). O: "Si tengo hambre *o* sed, buscaré algo" (OR). O: "No quiero salir si *no* está soleado" (NOT). Los operadores lógicos replican estas ideas en el código:

* **`&&` (AND lógico):** Devuelve `true` si *ambos* operandos son `true`. Si el primer operando es `false`, no evalúa el segundo (cortocircuito). Es útil para asegurar que múltiples condiciones se cumplan simultáneamente.
* **`||` (OR lógico):** Devuelve `true` si *al menos uno* de los operandos es `true`. Si el primer operando es `true`, no evalúa el segundo (cortocircuito). Es útil para proporcionar valores por defecto o cuando varias condiciones son aceptables.
* **`!` (NOT lógico):** Invierte el valor booleano de su operando. Si es `true`, lo convierte a `false`, y viceversa. También convierte valores "truthy" a `false` y "falsy" a `true`.

Estos operadores te permiten escribir lógica condicional muy expresiva y potente, crucial para cualquier aplicación interactiva.
''',
    'code_example': r'''
let edad = 20;
let tieneLicencia = true;
let esEstudiante = false;

// Operador AND (&&)
// Ambas condiciones deben ser verdaderas
let puedeConducir = (edad >= 18 && tieneLicencia);
console.log(`¿Puede conducir? ${puedeConducir}`); // Salida: ¿Puede conducir? true (20 >= 18 es true, true es true -> true)

let esEstudianteConLicencia = (esEstudiante && tieneLicencia);
console.log(`¿Es estudiante con licencia? ${esEstudianteConLicencia}`); // Salida: ¿Es estudiante con licencia? false (false && true -> false)

// Operador OR (||)
// Al menos una condición debe ser verdadera
let puedeEntrarFiesta = (edad >= 18 || esEstudiante);
console.log(`¿Puede entrar a la fiesta? ${puedeEntrarFiesta}`); // Salida: ¿Puede entrar a la fiesta? true (20 >= 18 es true, true || false -> true)

let necesitaAyuda = (esEstudiante || !tieneLicencia);
console.log(`¿Necesita ayuda? ${necesitaAyuda}`); // Salida: ¿Necesita ayuda? false (false || !true -> false || false -> false)

// Operador NOT (!)
let estaActivo = true;
let noEstaActivo = !estaActivo;
console.log(`¿No está activo? ${noEstaActivo}`); // Salida: ¿No está activo? false

let esNumero = 0; // 0 es falsy
let noEsNumero = !esNumero; // !falsy -> true
console.log(`¿No es número (truthy/falsy)? ${noEsNumero}`); // Salida: ¿No es número (truthy/falsy)? true

// Cortocircuito con &&
let usuario = { nombre: "Juan" };
let nombreUsuario = usuario && usuario.nombre; // Si 'usuario' es truthy, asigna usuario.nombre
console.log(`Nombre de usuario: ${nombreUsuario}`); // Salida: Nombre de usuario: Juan

let otroUsuario = null;
let otroNombreUsuario = otroUsuario && otroUsuario.nombre; // Como 'otroUsuario' es falsy, no evalúa otroUsuario.nombre
console.log(`Otro nombre de usuario: ${otroNombreUsuario}`); // Salida: Otro nombre de usuario: null

// Cortocircuito con ||
let valorPorDefecto = "Valor por defecto";
let valorConfigurado = "Mi valor";
let resultadoOR = valorConfigurado || valorPorDefecto; // Si 'valorConfigurado' es truthy, lo usa
console.log(`Resultado OR: ${resultadoOR}`); // Salida: Resultado OR: Mi valor

let valorNulo = null;
let resultadoOR2 = valorNulo || valorPorDefecto; // Si 'valorNulo' es falsy, usa el valor por defecto
console.log(`Resultado OR2: ${resultadoOR2}`); // Salida: Resultado OR2: Valor por defecto
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Operadores y Expresiones',
    'topic': 'Tipos de Operadores',
    'subtopic': 'Operadores de comparación (>, <, <=, >=)',
    'definition': r'''
Los operadores de comparación en JavaScript se utilizan para comparar dos valores y determinar su relación. Siempre devuelven un valor booleano: `true` si la comparación es verdadera y `false` si es falsa.

¿Te estás preguntando por qué esto importa?

Pues bien, estos operadores son la base de las decisiones en tu código, permitiéndote controlar el flujo del programa basándote en si una condición se cumple o no. Imagina que quieres mostrar un descuento si el precio es *menor* de $50, o permitir el acceso a un sitio si la edad es *mayor o igual* a 18. Aquí es donde entran en juego:
* **`>` (Mayor que):** Devuelve `true` si el operando izquierdo es mayor que el derecho.
* **`<` (Menor que):** Devuelve `true` si el operando izquierdo es menor que el derecho.
* **`>=` (Mayor o igual que):** Devuelve `true` si el operando izquierdo es mayor o igual que el derecho.
* **`<=` (Menor o igual que):** Devuelve `true` si el operando izquierdo es menor o igual que el derecho.
* **`==` (Igualdad laxa):** Compara si dos valores son iguales *después de intentar convertirlos al mismo tipo* (coerción). Esta comparación puede llevar a resultados inesperados.
* **`===` (Igualdad estricta):** Compara si dos valores son iguales *sin realizar ninguna conversión de tipo*. Es la forma preferida de comparar igualdad en JavaScript.
* **`!=` (Desigualdad laxa):** Devuelve `true` si los operandos no son iguales *después de la coerción*.
* **`!==` (Desigualdad estricta):** Devuelve `true` si los operandos no son iguales *sin coerción*. Es la forma preferida de comparar desigualdad.

La elección entre comparación laxa (`==`, `!=`) y estricta (`===`, `!==`) es crucial. Siempre que sea posible, se recomienda usar los operadores estrictos (`===`, `!==`) para evitar sorpresas debido a la coerción de tipos.
''',
    'code_example': r'''
let num1 = 10;
let num2 = 5;
let strNum = "10";

// Mayor que (>)
console.log(`10 > 5: ${num1 > num2}`);      // Salida: true
console.log(`5 > 10: ${num2 > num1}`);      // Salida: false

// Menor que (<)
console.log(`10 < 5: ${num1 < num2}`);      // Salida: false
console.log(`5 < 10: ${num2 < num1}`);      // Salida: true

// Mayor o igual que (>=)
console.log(`10 >= 10: ${num1 >= 10}`);     // Salida: true
console.log(`10 >= 5: ${num1 >= num2}`);     // Salida: true

// Menor o igual que (<=)
console.log(`5 <= 5: ${num2 <= 5}`);        // Salida: true
console.log(`5 <= 10: ${num2 <= num1}`);     // Salida: true

// Igualdad laxa (==) - ¡Cuidado con la coerción!
console.log(`10 == "10": ${num1 == strNum}`); // Salida: true (el string "10" se convierte a número 10)
console.log(`0 == false: ${0 == false}`);     // Salida: true (0 y false son falsy)
console.log(`null == undefined: ${null == undefined}`); // Salida: true

// Igualdad estricta (===) - RECOMENDADO
console.log(`10 === "10": ${num1 === strNum}`); // Salida: false (tipos diferentes: number vs string)
console.log(`0 === false: ${0 === false}`);     // Salida: false (tipos diferentes: number vs boolean)
console.log(`null === undefined: ${null === undefined}`); // Salida: false (tipos diferentes)

// Desigualdad laxa (!=)
console.log(`10 != "10": ${num1 != strNum}`); // Salida: false (son iguales después de coerción)

// Desigualdad estricta (!==) - RECOMENDADO
console.log(`10 !== "10": ${num1 !== strNum}`); // Salida: true (son diferentes en tipo)
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Operadores y Expresiones',
    'topic': 'Tipos de Operadores',
    'subtopic': 'Operadores bit a bit',
    'definition': '''
Los operadores bit a bit en JavaScript realizan operaciones en los patrones de bits de los números. Convierten los operandos a representaciones binarias de 32 bits con signo, realizan la operación y luego convierten el resultado de nuevo a un número estándar.

¿No sé tú, pero a mí esto al principio me costó? 

Es que estos operadores son bastante específicos y no se usan tan comúnmente en el desarrollo web front-end del día a día como los operadores aritméticos o lógicos. Sin embargo, son fundamentales en ciertos nichos, como la optimización de algoritmos, gráficos, o cuando se trabaja con banderas de bits (flags) en configuraciones. Operan directamente a nivel de bits de los números, lo que los hace muy eficientes para ciertas tareas. Los operadores incluyen:
* **`&` (AND a nivel de bit):** Establece cada bit a 1 si el bit correspondiente en ambos operandos es 1.
* **`|` (OR a nivel de bit):** Establece cada bit a 1 si el bit correspondiente en uno o ambos operandos es 1.
* **`^` (XOR a nivel de bit):** Establece cada bit a 1 si los bits correspondientes en los operandos son diferentes.
* **`~` (NOT a nivel de bit):** Invierte todos los bits del operando.
* **`<<` (Desplazamiento a la izquierda):** Desplaza los bits del primer operando a la izquierda por el número de posiciones especificado por el segundo operando. Se insertan ceros a la derecha.
* **`>>` (Desplazamiento a la derecha con signo):** Desplaza los bits del primer operando a la derecha por el número de posiciones. El bit de signo se propaga.
* **`>>>` (Desplazamiento a la derecha sin signo):** Desplaza los bits del primer operando a la derecha por el número de posiciones. Se insertan ceros a la izquierda.

Aunque no los uses a diario, son importantes para entender cómo funcionan los números a un nivel más bajo y para interpretar código que los utiliza en contextos específicos.
''',
    'code_example': r'''
// Ejemplo con números pequeños para visualización (se convierten a binario de 32 bits)
// En binario:
// 5 = 0000...0101
// 3 = 0000...0011

let num1 = 5; // 0101 en binario
let num2 = 3; // 0011 en binario

// AND a nivel de bit (&)
//   0101 (5)
// & 0011 (3)
// = 0001 (1)
let resultadoAND = num1 & num2;
console.log(`5 & 3 = ${resultadoAND}`); // Salida: 1

// OR a nivel de bit (|)
//   0101 (5)
// | 0011 (3)
// = 0111 (7)
let resultadoOR = num1 | num2;
console.log(`5 | 3 = ${resultadoOR}`); // Salida: 7

// XOR a nivel de bit (^)
//   0101 (5)
// ^ 0011 (3)
// = 0110 (6)
let resultadoXOR = num1 ^ num2;
console.log(`5 ^ 3 = ${resultadoXOR}`); // Salida: 6

// NOT a nivel de bit (~)
//   0000...0101 (5)
// ~ 1111...1010 (-6)
let resultadoNOT = ~num1;
console.log(`~5 = ${resultadoNOT}`); // Salida: -6 (Debido a la representación de números negativos en binario)

// Desplazamiento a la izquierda (<<)
// 5 << 1  (0101 << 1 = 1010)
// 1010 en binario es 10 en decimal
let resultadoShiftLeft = num1 << 1;
console.log(`5 << 1 = ${resultadoShiftLeft}`); // Salida: 10

// Desplazamiento a la derecha con signo (>>)
// 5 >> 1 (0101 >> 1 = 0010)
// 0010 en binario es 2 en decimal
let resultadoShiftRight = num1 >> 1;
console.log(`5 >> 1 = ${resultadoShiftRight}`); // Salida: 2

// Desplazamiento a la derecha sin signo (>>>)
// Esto es importante para números negativos, donde >> mantiene el signo
let negNum = -5; // En binario (complemento a dos) es ...11111011
let resultadoUnsignedShiftRight = negNum >>> 1;
console.log(`-5 >>> 1 = ${resultadoUnsignedShiftRight}`); // Salida: 2147483645 (Un número grande positivo)
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Operadores y Expresiones',
    'topic': 'Tipos de Operadores',
    'subtopic': 'Operador coma (,)',
    'definition': '''
El operador coma (`,`) en JavaScript es un operador binario que evalúa cada uno de sus operandos (de izquierda a derecha) y devuelve el valor del *último* operando.

¿Te estás preguntando por qué esto importa?

Pues bien, aunque no se usa tan frecuentemente como otros operadores, el operador coma tiene un propósito específico: te permite incluir múltiples expresiones en un lugar donde JavaScript solo espera una. Su uso más común es en la sección de inicialización o de actualización de un bucle `for`, donde puedes realizar varias operaciones en una sola línea. Por ejemplo, en un bucle `for (let i = 0, j = 10; i < j; i++, j--)`, el operador coma se usa para declarar e inicializar `i` y `j` y para actualizarlos en cada iteración. Fuera de los bucles `for`, su uso es menos común y a menudo se desaconseja por motivos de legibilidad, ya que puede hacer que el código sea más difícil de entender. Sin embargo, es una herramienta poderosa para escribir código compacto cuando la situación lo justifica.
''',
    'code_example': r'''
// Ejemplo 1: En la sección de inicialización de un bucle for
for (let i = 0, j = 5; i < j; i++, j--) {
  console.log(`i: ${i}, j: ${j}`);
}
// Salida:
// i: 0, j: 5
// i: 1, j: 4
// i: 2, j: 3

// Ejemplo 2: Evaluar múltiples expresiones y devolver la última
let a = 1;
let b = 2;
let c = (a++, b += 2, a + b); // Evalúa a++, luego b+=2, luego a+b. El valor final es a+b.
console.log(`a: ${a}, b: ${b}, c: ${c}`); // Salida: a: 2, b: 4, c: 6

// Desglose de c = (a++, b += 2, a + b);
// 1. a++  -> a se convierte en 2 (devuelve el valor original de a, que es 1, pero se ignora)
// 2. b += 2 -> b se convierte en 4 (devuelve 4, pero se ignora)
// 3. a + b -> 2 + 4 = 6 (este es el valor que se devuelve y se asigna a c)

// Ejemplo 3: Uso menos común (y a veces desaconsejado por legibilidad)
function logAndReturn(value) {
  console.log("Evaluando:", value);
  return value;
}

let resultado = (logAndReturn(10), logAndReturn(20), logAndReturn(30));
console.log("Resultado final:", resultado);
// Salida:
// Evaluando: 10
// Evaluando: 20
// Evaluando: 30
// Resultado final: 30
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Operadores y Expresiones',
    'topic': 'Tipos de Operadores',
    'subtopic': 'Operadores de strings',
    'definition': r'''
Aunque JavaScript no tiene una gran variedad de operadores dedicados exclusivamente a strings como en otros lenguajes, el operador de adición (`+`) es el más comúnmente utilizado y versátil para trabajar con texto. Además, el operador de asignación compuesto `+=` también es muy relevante.

¿Seguramente te estarás preguntando de qué va todo esto?

Pues bien, cuando se utiliza el operador `+` con al menos un operando que es un `string`, JavaScript realiza una operación de **concatenación de strings**. Esto significa que une dos o más cadenas de texto para formar una nueva cadena. Es el pan de cada día para construir mensajes, formatear salidas o combinar datos textuales. Por ejemplo, si tienes el nombre y el apellido de una persona en variables separadas, puedes unirlos con `+` para formar el nombre completo. El operador `+=` funciona de manera similar, permitiéndote añadir texto al final de una cadena existente de forma concisa. Además de estos, aunque no son operadores per se, es importante mencionar los "template literals" (usando comillas invertidas ``` ` ```) que, junto con `${}` para incrustar expresiones, ofrecen una forma aún más potente y legible de construir y manipular strings en JavaScript moderno.
''',
    'code_example': r'''
// Operador de adición (+) para concatenación
let nombre = "Alice";
let apellido = "Smith";

let nombreCompleto = nombre + " " + apellido;
console.log(`Nombre completo: ${nombreCompleto}`); // Salida: Nombre completo: Alice Smith

let saludo = "Hola" + ", " + nombre + "!";
console.log(`Saludo: ${saludo}`); // Salida: Saludo: Hola, Alice!

// Concatenación de string con número (el número se convierte a string)
let edad = 30;
let mensajeEdad = "Mi edad es: " + edad;
console.log(`Mensaje edad: ${mensajeEdad}`); // Salida: Mensaje edad: Mi edad es: 30

// Operador de asignación compuesta (+=)
let frase = "JavaScript es ";
frase += "genial."; // frase = frase + "genial.";
console.log(`Frase: ${frase}`); // Salida: Frase: JavaScript es genial.

frase += " Es muy poderoso.";
console.log(`Frase actualizada: ${frase}`); // Salida: Frase actualizada: JavaScript es genial. Es muy poderoso.

// Uso de Template Literals (ES6) para construcción de strings más limpia
// Aunque no es un "operador", es la forma moderna de hacer muchas concatenaciones
let producto = "Laptop";
let precio = 1200;
let stock = 5;

let infoProducto = `El producto ${producto} tiene un precio de $${precio} y quedan ${stock} unidades.`;
console.log(`Info producto: ${infoProducto}`);
// Salida: Info producto: El producto Laptop tiene un precio de $1200 y quedan 5 unidades.
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Operadores y Expresiones',
    'topic': 'Tipos de Operadores',
    'subtopic': 'Operador unario (+, -, !)',
    'definition': '''
Los operadores unarios en JavaScript son aquellos que operan sobre un único operando. Aunque ya hemos visto algunos en otros contextos, es importante destacarlos por su comportamiento específico. Los más comunes son el unario `+`, el unario `-`, y el lógico `!`.

¿Te estás preguntando por qué esto importa?

Pues bien, estos operadores tienen funciones muy específicas que pueden no ser obvias a primera vista:
* **`+` (Unario más):** Este operador intenta convertir su operando a un número. Es una forma rápida y explícita de realizar una conversión de tipo de otros valores (como strings numéricos o booleanos) a números. Si el valor no puede convertirse, devuelve `NaN`.
* **`-` (Unario menos):** Este operador no solo convierte su operando a un número (si no lo es), sino que también lo niega (cambia su signo). Es útil para obtener el valor negativo de un número o para convertir un string numérico negativo a un número negativo real.
* **`!` (NOT lógico):** Ya lo vimos en operadores lógicos. Convierte su operando a un booleano (si no lo es) y luego invierte su valor. Convierte "truthy" a `false` y "falsy" a `true`.

Estos operadores son herramientas concisas y potentes para la manipulación de tipos y valores, y su comprensión es clave para entender el comportamiento de ciertas expresiones en JavaScript.
''',
    'code_example': r'''
// Operador unario + (conversión a número)
let strNum = "123";
let numConvertido = +strNum;
console.log(`+ "123": ${numConvertido}, tipo: ${typeof numConvertido}`); // Salida: 123, tipo: number

let boolTrue = true;
let numDesdeBool = +boolTrue;
console.log(`+ true: ${numDesdeBool}, tipo: ${typeof numDesdeBool}`); // Salida: 1, tipo: number

let boolFalse = false;
let numDesdeBoolFalse = +boolFalse;
console.log(`+ false: ${numDesdeBoolFalse}, tipo: ${typeof numDesdeBoolFalse}`); // Salida: 0, tipo: number

let nulo = null;
let numDesdeNull = +nulo;
console.log(`+ null: ${numDesdeNull}, tipo: ${typeof numDesdeNull}`); // Salida: 0, tipo: number

let indefinido = undefined;
let numDesdeUndefined = +indefinido;
console.log(`+ undefined: ${numDesdeUndefined}, tipo: ${typeof numDesdeUndefined}`); // Salida: NaN, tipo: number

let strNoNumero = "abc";
let numDesdeNoNumero = +strNoNumero;
console.log(`+ "abc": ${numDesdeNoNumero}, tipo: ${typeof numDesdeNoNumero}`); // Salida: NaN, tipo: number

// Operador unario - (conversión a número y negación)
let positivo = 10;
let negativo = -positivo;
console.log(`- 10: ${negativo}, tipo: ${typeof negativo}`); // Salida: -10, tipo: number

let strNegativo = "-25";
let numNegado = -strNegativo;
console.log(`- "-25": ${numNegado}, tipo: ${typeof numNegado}`); // Salida: 25, tipo: number

let otroStrNum = "50";
let numNegado2 = -otroStrNum;
console.log(`- "50": ${numNegado2}, tipo: ${typeof numNegado2}`); // Salida: -50, tipo: number

// Operador unario ! (NOT lógico)
let esVerdadero = true;
let noEsVerdadero = !esVerdadero;
console.log(`!true: ${noEsVerdadero}, tipo: ${typeof noEsVerdadero}`); // Salida: false, tipo: boolean

let numeroCero = 0; // Falsy
let noEsCero = !numeroCero;
console.log(`!0: ${noEsCero}, tipo: ${typeof noEsCero}`); // Salida: true, tipo: boolean

let cadenaNoVacia = "texto"; // Truthy
let esVacio = !cadenaNoVacia;
console.log(`!"texto": ${esVacio}, tipo: ${typeof esVacio}`); // Salida: false, tipo: boolean
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Operadores y Expresiones',
    'topic': 'Tipos de Operadores',
    'subtopic': 'Operador typeof',
    'definition': '''
El operador `typeof` en JavaScript es una herramienta sencilla pero muy útil que te permite averiguar el tipo de dato de una variable o una expresión. Cuando lo usas, te devuelve una cadena de texto que representa ese tipo.

¿Te estás preguntando por qué esto importa?

Pues bien, saber el tipo de dato es fundamental para realizar operaciones correctas y evitar errores en tu código, especialmente cuando trabajas con datos que provienen de fuentes externas (como la entrada de un usuario o una API) y no estás seguro de su formato. Por ejemplo, si esperas un número pero recibes una cadena de texto, `typeof` te lo indicará. Ten en cuenta que `typeof` tiene algunas peculiaridades históricas, la más famosa es que `typeof null` devuelve `'object'`, lo cual es un error del lenguaje que se ha mantenido por razones de compatibilidad. Además, para funciones, devuelve `'function'` (aunque las funciones son un tipo de objeto), y para arrays, también devuelve `'object'` (ya que los arrays son objetos). Para distinguir entre objetos y arrays, o entre diferentes tipos de objetos, a menudo necesitarás usar métodos más específicos como `Array.isArray()` o el operador `instanceof`. A pesar de estas pequeñas "rarezas", `typeof` sigue siendo tu primera parada para una rápida verificación de tipo.
''',
    'code_example': '''
// Ejemplos de uso de typeof con tipos primitivos
console.log(typeof "Hola");         // Salida: string
console.log(typeof 123);            // Salida: number
console.log(typeof true);           // Salida: boolean
console.log(typeof undefined);      // Salida: undefined
console.log(typeof 10n);            // Salida: bigint
console.log(typeof Symbol('foo'));  // Salida: symbol

// Ejemplos de uso de typeof con objetos y sus particularidades
console.log(typeof { a: 1 });       // Salida: object (para objetos literales)
console.log(typeof [1, 2, 3]);      // Salida: object (para arrays)
console.log(typeof function() {});   // Salida: function (para funciones)
console.log(typeof null);           // Salida: object (¡la famosa peculiaridad!)

// Cómo distinguir arrays de objetos (ya que typeof ambos es 'object')
let myArray = [1, 2];
let myObject = { a: 1 };

console.log(Array.isArray(myArray));   // Salida: true
console.log(Array.isArray(myObject));  // Salida: false

// Ejemplo práctico: Validar un tipo de entrada
function procesarEntrada(valor) {
  if (typeof valor === 'number') {
    console.log("El valor es un número:", valor * 2);
  } else if (typeof valor === 'string') {
    console.log("El valor es un string:", valor.toUpperCase());
  } else {
    console.log("Tipo de dato desconocido:", typeof valor);
  }
}

procesarEntrada(5);      // Salida: El valor es un número: 10
procesarEntrada("test"); // Salida: El valor es un string: TEST
procesarEntrada(true);   // Salida: Tipo de dato desconocido: boolean
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Operadores y Expresiones',
    'topic': 'Tipos de Operadores',
    'subtopic': 'Operador instanceof',
    'definition': '''
El operador `instanceof` se utiliza para verificar si un objeto es una instancia de una clase o constructor particular, o si hereda de ese prototipo. Devuelve `true` si es así, y `false` en caso contrario.

¿No sé tú, pero a mí esto al principio me costó? 

Es que, mientras `typeof` es excelente para tipos primitivos, para objetos (incluidos arrays y funciones), `typeof` a menudo solo te dirá `'object'` o `'function'`. `instanceof` te permite ir un paso más allá y preguntar: "¿este objeto fue creado por este constructor o una de sus subclases?". Pensemos en una jerarquía de animales: si tienes un `perro`, `perro instanceof Perro` sería `true`, pero también `perro instanceof Animal` sería `true` si `Perro` hereda de `Animal`. Esto es fundamental en la programación orientada a objetos para verificar la "ascendencia" de un objeto y tomar decisiones basadas en su origen. Sin embargo, tiene una limitación: solo funciona correctamente con objetos (no con primitivos) y cuando el prototipo del constructor está en la cadena de prototipos del objeto. No funciona bien a través de diferentes "frames" o contextos de JavaScript. Para arrays, `Array.isArray()` es generalmente preferible.
''',
    'code_example': r'''
// Ejemplo 1: Con objetos simples y constructores
function Persona(nombre) {
  this.nombre = nombre;
}

const juan = new Persona("Juan");
const array = [1, 2, 3];
const objetoLiteral = {};

console.log(`juan instanceof Persona: ${juan instanceof Persona}`); // Salida: true
console.log(`juan instanceof Object: ${juan instanceof Object}`);   // Salida: true (Persona hereda de Object)
console.log(`array instanceof Array: ${array instanceof Array}`);   // Salida: true
console.log(`array instanceof Object: ${array instanceof Object}`); // Salida: true (Array hereda de Object)
console.log(`objetoLiteral instanceof Object: ${objetoLiteral instanceof Object}`); // Salida: true
console.log(`"hola" instanceof String: ${"hola" instanceof String}`); // Salida: false (primitivo string no es una instancia de String object)

// Ejemplo 2: Con clases (sintaxis moderna)
class Animal {
  constructor(nombre) {
    this.nombre = nombre;
  }
}

class Perro extends Animal {
  constructor(nombre, raza) {
    super(nombre);
    this.raza = raza;
  }
}

const firulais = new Perro("Firulais", "Labrador");

console.log(`firulais instanceof Perro: ${firulais instanceof Perro}`); // Salida: true
console.log(`firulais instanceof Animal: ${firulais instanceof Animal}`); // Salida: true (herencia)
console.log(`firulais instanceof Object: ${firulais instanceof Object}`); // Salida: true (todo hereda de Object)

// Ejemplo 3: instanceof con primitivos (siempre false)
console.log(`10 instanceof Number: ${10 instanceof Number}`);         // Salida: false
console.log(`true instanceof Boolean: ${true instanceof Boolean}`);   // Salida: false
console.log(`null instanceof Object: ${null instanceof Object}`);     // Salida: false
console.log(`undefined instanceof Object: ${undefined instanceof Object}`); // Salida: false

// NOTA: Para verificar si algo es un array, Array.isArray() es más robusto y recomendado
console.log(`Array.isArray(array): ${Array.isArray(array)}`);       // Salida: true
console.log(`Array.isArray(objetoLiteral): ${Array.isArray(objetoLiteral)}`); // Salida: false
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Operadores y Expresiones',
    'topic': 'Comparaciones de Igualdad',
    'subtopic': 'Comparación con ==',
    'definition': '''
El operador de igualdad laxa (`==`) en JavaScript se utiliza para comparar si dos valores son iguales. Sin embargo, antes de realizar la comparación, JavaScript intenta convertir los operandos a un tipo común (proceso conocido como "coerción de tipos").

¿Seguramente te estarás preguntando de qué va todo esto?

Pues bien, piensa en el `==` como un traductor flexible. Si le das dos cosas de diferentes "idiomas" (tipos de datos), intentará traducirlas al mismo idioma antes de ver si son idénticas. Por ejemplo, si comparas `5 == "5"`, JavaScript convertirá la cadena `"5"` a un número `5` antes de compararlos, resultando en `true`. Esto puede ser conveniente en algunos casos, pero a menudo lleva a resultados inesperados y errores difíciles de depurar, especialmente cuando no estás completamente familiarizado con las reglas de coerción de JavaScript. Por eso, aunque existe, su uso se desaconseja en la mayoría de los casos a favor de la comparación estricta (`===`), ya que esta última no realiza coerciones y es más predecible. Entender su comportamiento es clave para leer código existente y para evitar trampas comunes.
''',
    'code_example': r'''
// Ejemplos de igualdad laxa (==) y coerción

// Número y String
console.log(`5 == "5": ${5 == "5"}`);        // Salida: true (string "5" se convierte a number 5)

// Número y Booleano
console.log(`0 == false: ${0 == false}`);     // Salida: true (0 se convierte a false)
console.log(`1 == true: ${1 == true}`);       // Salida: true (1 se convierte a true)

// Null y Undefined
console.log(`null == undefined: ${null == undefined}`); // Salida: true (ambos representan "ausencia de valor")

// String vacío y Booleano
console.log(`"" == false: ${"" == false}`);   // Salida: true (string vacío se convierte a false)

// Objeto con primitivo
let obj = { valueOf: () => 10 };
console.log(`obj == 10: ${obj == 10}`);       // Salida: true (obj.valueOf() se llama y se convierte a 10)

// NaN (Not-a-Number)
console.log(`NaN == NaN: ${NaN == NaN}`);     // Salida: false (NaN no es igual a nada, ni siquiera a sí mismo)

// Array vacío
console.log(`[] == 0: ${[] == 0}`);           // Salida: true ([] se convierte a "" y luego a 0)
console.log(`[] == false: ${[] == false}`);   // Salida: true ([] se convierte a "" y luego a false)

// String y número
console.log(`" " == 0: ${" " == 0}`);         // Salida: true (" " se convierte a 0)

// Objeto y Objeto (comparan referencia, no contenido)
let obj1 = { a: 1 };
let obj2 = { a: 1 };
console.log(`obj1 == obj2: ${obj1 == obj2}`); // Salida: false (diferentes referencias en memoria)

let obj3 = obj1;
console.log(`obj1 == obj3: ${obj1 == obj3}`); // Salida: true (misma referencia)
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Operadores y Expresiones',
    'topic': 'Comparaciones de Igualdad',
    'subtopic': 'Comparación con ===',
    'definition': '''
El operador de igualdad estricta (`===`) en JavaScript se utiliza para comparar si dos valores son iguales *sin realizar ninguna coerción de tipos*. Esto significa que, para que la comparación sea `true`, tanto el valor como el tipo de los operandos deben ser idénticos.

¿No sé tú, pero a mí esto al principio me costó? 

Pues bien, piensa en el `===` como un guardia de seguridad muy estricto: no solo verifica si las personas (valores) son las mismas, sino que también se asegura de que ambas tengan la misma identificación (tipo de dato) y que esta sea exacta. Si los tipos de los operandos son diferentes, la comparación siempre devolverá `false` inmediatamente, sin intentar ninguna conversión. Esto lo convierte en la forma más predecible y segura de comparar valores en JavaScript, ya que elimina las sorpresas que pueden surgir con la coerción de `==`. Es la práctica recomendada para la mayoría de las comparaciones de igualdad en tu código, ya que promueve un comportamiento más consistente y reduce la probabilidad de errores sutiles.
''',
    'code_example': r'''
// Ejemplos de igualdad estricta (===)

// Número y String
console.log(`5 === "5": ${5 === "5"}`);        // Salida: false (tipo number vs tipo string)

// Número y Booleano
console.log(`0 === false: ${0 === false}`);     // Salida: false (tipo number vs tipo boolean)
console.log(`1 === true: ${1 === true}`);       // Salida: false (tipo number vs tipo boolean)

// Null y Undefined
console.log(`null === undefined: ${null === undefined}`); // Salida: false (tipo null vs tipo undefined)

// String vacío y Booleano
console.log(`"" === false: ${"" === false}`);   // Salida: false (tipo string vs tipo boolean)

// Booleanos puros
console.log(`true === true: ${true === true}`);   // Salida: true
console.log(`false === false: ${false === false}`); // Salida: true

// NaN (Not-a-Number)
console.log(`NaN === NaN: ${NaN === NaN}`);     // Salida: false (NaN no es igual a nada, ni siquiera a sí mismo)

// Array vacío
console.log(`[] === 0: ${[] === 0}`);           // Salida: false (tipo object vs tipo number)
console.log(`[] === false: ${[] === false}`);   // Salida: false (tipo object vs tipo boolean)

// Objeto y Objeto (comparan referencia, no contenido)
let obj1 = { a: 1 };
let obj2 = { a: 1 };
console.log(`obj1 === obj2: ${obj1 === obj2}`); // Salida: false (diferentes referencias en memoria)

let obj3 = obj1;
console.log(`obj1 === obj3: ${obj1 === obj3}`); // Salida: true (misma referencia)

// Primitivos del mismo tipo y valor
let numA = 10;
let numB = 10;
console.log(`numA === numB: ${numA === numB}`); // Salida: true

let strA = "hello";
let strB = "hello";
console.log(`strA === strB: ${strA === strB}`); // Salida: true
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Operadores y Expresiones',
    'topic': 'Comparaciones de Igualdad',
    'subtopic': 'Comparación con Object.is()',
    'definition': '''
`Object.is()` es un método estático introducido en ES6 (ECMAScript 2015) que compara dos valores para determinar si son el mismo valor. A diferencia de `==` (que realiza coerción) y `===` (que tiene una peculiaridad con `NaN` y los ceros), `Object.is()` proporciona una comparación de igualdad más precisa y se adhiere al algoritmo "SameValue".

¿Te estás preguntando por qué esto importa?

Pues bien, piensa en `Object.is()` como la comparación de igualdad más "correcta" o "verdadera" que existe en JavaScript, especialmente útil cuando necesitas una equivalencia perfecta para todos los tipos de valores. Corrige dos "deficiencias" de `===`:
1.  **`NaN === NaN` es `false`, pero `Object.is(NaN, NaN)` es `true`.** Esto es muy útil porque `NaN` es el único valor en JavaScript que no es igual a sí mismo con `==` o `===`. `Object.is()` soluciona esto, lo cual es vital para manejar casos donde el resultado de un cálculo podría ser `NaN` y necesitas verificarlo.
2.  **`+0 === -0` es `true`, pero `Object.is(+0, -0)` es `false`.** Aunque en la mayoría de los casos esto no es un problema, en ciertos contextos matemáticos o de bits, distinguir entre el cero positivo y el cero negativo puede ser importante, y `Object.is()` te lo permite.

Para todos los demás casos, `Object.is()` se comporta de manera idéntica a `===`. Por lo tanto, si tus necesidades de comparación son estrictas y necesitas manejar `NaN` y ceros con precisión, `Object.is()` es la herramienta adecuada.
''',
    'code_example': r'''
// Casos donde Object.is() se comporta igual que ===
console.log(`Object.is(25, 25): ${Object.is(25, 25)}`);             // Salida: true
console.log(`Object.is("hello", "hello"): ${Object.is("hello", "hello")}`); // Salida: true
console.log(`Object.is(true, true): ${Object.is(true, true)}`);     // Salida: true
console.log(`Object.is(null, null): ${Object.is(null, null)}`);     // Salida: true
console.log(`Object.is(undefined, undefined): ${Object.is(undefined, undefined)}`); // Salida: true

// Diferencias clave con ===
// 1. NaN
console.log(`NaN === NaN: ${NaN === NaN}`);                     // Salida: false
console.log(`Object.is(NaN, NaN): ${Object.is(NaN, NaN)}`);       // Salida: true

// 2. Cero positivo y negativo
console.log(`+0 === -0: ${+0 === -0}`);                         // Salida: true
console.log(`Object.is(+0, -0): ${Object.is(+0, -0)}`);           // Salida: false

// Objeto y Objeto (compara referencia, igual que ===)
let obj1 = { a: 1 };
let obj2 = { a: 1 };
console.log(`Object.is(obj1, obj2): ${Object.is(obj1, obj2)}`); // Salida: false (diferentes referencias)

let obj3 = obj1;
console.log(`Object.is(obj1, obj3): ${Object.is(obj1, obj3)}`); // Salida: true (misma referencia)

// Comparación de primitivos con objetos wrapper
console.log(`Object.is(5, new Number(5)): ${Object.is(5, new Number(5))}`); // Salida: false (tipo primitivo vs objeto)
console.log(`5 === new Number(5): ${5 === new Number(5)}`);               // Salida: false
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Operadores y Expresiones',
    'topic': 'Comparaciones de Igualdad',
    'subtopic': 'Algoritmo isLooselyEqual',
    'definition': '''
El algoritmo "isLooselyEqual" es el conjunto de reglas internas que JavaScript sigue para evaluar el operador de igualdad laxa (`==`). Este algoritmo se describe en la especificación ECMAScript y detalla cómo se realiza la coerción de tipos para intentar hacer que dos valores sean comparables antes de verificar su igualdad.

¿Seguramente te estarás preguntando de qué va todo esto?

Pues bien, piensa en este algoritmo como un "diagrama de flujo de decisión" interno que el motor de JavaScript sigue cuando ve un `==`. Sus pasos son complejos y por eso es una fuente común de comportamientos inesperados:
1.  **Si los tipos son los mismos:** Se comportan como `===` (con la excepción de `NaN`, que nunca es igual a sí mismo).
2.  **Si uno es `null` y el otro `undefined`:** Devuelve `true`.
3.  **Si uno es `number` y el otro `string`:** El string se convierte a `number` y luego se compara.
4.  **Si uno es `boolean`:** El booleano se convierte a `number` (`true` a `1`, `false` a `0`) y luego se compara.
5.  **Si uno es `object` y el otro `number` o `string`:** El objeto se convierte a un primitivo (intentando `valueOf()` y luego `toString()`) y luego se compara.
6.  **Otros casos:** Generalmente devuelve `false` si no hay una regla clara para la coerción, o si uno es `NaN`.

Debido a su complejidad y las reglas de coerción implícita, rara vez se recomienda depender de este algoritmo directamente en tu código. Es más útil comprenderlo para depurar y entender por qué `==` produce ciertos resultados, en lugar de usarlo como tu principal herramienta de comparación.
''',
    'code_example': r'''
// Estos ejemplos ilustran el comportamiento del algoritmo isLooselyEqual
// Son los mismos ejemplos que para `==`, ya que `==` usa este algoritmo.

// Caso 1: Tipos iguales (se comporta como ===, excepto NaN)
console.log(`5 == 5: ${5 == 5}`);           // true (number)
console.log(`"a" == "a": ${"a" == "a"}`);   // true (string)
console.log(`true == true: ${true == true}`);// true (boolean)
console.log(`NaN == NaN: ${NaN == NaN}`);   // false (excepción a la regla de tipos iguales, NaN no es igual a sí mismo)

// Caso 2: null y undefined
console.log(`null == undefined: ${null == undefined}`); // true

// Caso 3: number y string
console.log(`10 == "10": ${10 == "10"}`);         // true ("10" se convierte a 10)
console.log(`10 == "10.0": ${10 == "10.0"}`);     // true ("10.0" se convierte a 10)
console.log(`10 == "abc": ${10 == "abc"}`);       // false ("abc" se convierte a NaN, 10 == NaN es false)

// Caso 4: booleanos
console.log(`0 == false: ${0 == false}`);         // true (false se convierte a 0)
console.log(`1 == true: ${1 == true}`);           // true (true se convierte a 1)
console.log(`2 == true: ${2 == true}`);           // false (true se convierte a 1, 2 == 1 es false)

// Caso 5: object con number/string
console.log(`[1] == 1: ${[1] == 1}`);             // true ([1] se convierte a "1", luego "1" a 1)
console.log(`[ ] == 0: ${[] == 0}`);             // true ([] se convierte a "", luego "" a 0)
console.log(`{} == "[object Object]": ${{} == "[object Object]"}`); // true ({} se convierte a "[object Object]")

// Caso 6: Objeto y Primitivo - null/undefined
console.log(`{} == null: ${{} == null}`);         // false
console.log(`[] == null: ${[] == null}`);         // false
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Operadores y Expresiones',
    'topic': 'Comparaciones de Igualdad',
    'subtopic': 'Algoritmo isStrictlyEqual',
    'definition': '''
El algoritmo "isStrictlyEqual" es el conjunto de reglas internas que JavaScript utiliza para evaluar el operador de igualdad estricta (`===`). Este algoritmo está diseñado para ser lo más directo y predecible posible, sin realizar ninguna coerción de tipos.

¿Te estás preguntando por qué esto importa?

Pues bien, piensa en este algoritmo como un "verificador de identidad" sin excepciones. Cuando el motor de JavaScript ve un `===`, sigue estos pasos muy sencillos:
1.  **Si los tipos de los operandos son diferentes:** Devuelve `false` inmediatamente. No importa cuáles sean los valores, si los tipos no coinciden, no son estrictamente iguales.
2.  **Si los tipos son los mismos:**
    * **Numbers:**
        * Si uno es `NaN`, devuelve `false` (incluso si el otro también es `NaN`).
        * Si son los mismos números (incluyendo `+0` y `-0` que se consideran iguales), devuelve `true`.
    * **Strings, Booleans, Symbol, BigInt, Undefined, Null:** Si tienen el mismo valor, devuelve `true`.
    * **Objects:** Devuelve `true` solo si ambos operandos se refieren *exactamente al mismo objeto* en memoria (es decir, son la misma referencia). Si son dos objetos distintos, incluso si tienen el mismo contenido, devolverá `false`.

Debido a su simplicidad y la ausencia de coerción, el algoritmo `isStrictlyEqual` (y por extensión, el operador `===`) es la forma preferida para comparar igualdad en la gran mayoría de los casos en JavaScript, ya que minimiza sorpresas y hace el código más robusto y fácil de entender.
''',
    'code_example': r'''
// Estos ejemplos ilustran el comportamiento del algoritmo isStrictlyEqual
// Son los mismos ejemplos que para `===`, ya que `===` usa este algoritmo.

// Caso 1: Tipos diferentes (siempre false)
console.log(`5 === "5": ${5 === "5"}`);        // false (number vs string)
console.log(`0 === false: ${0 === false}`);     // false (number vs boolean)
console.log(`null === undefined: ${null === undefined}`); // false (null vs undefined)
console.log(`[] === 0: ${[] === 0}`);           // false (object vs number)

// Caso 2: Tipos iguales
// Numbers
console.log(`10 === 10: ${10 === 10}`);         // true
console.log(`NaN === NaN: ${NaN === NaN}`);     // false (peculiaridad de NaN)
console.log(`+0 === -0: ${+0 === -0}`);         // true (peculiaridad de +0 y -0)

// Strings
console.log(`"hello" === "hello": ${"hello" === "hello"}`); // true
console.log(`"hello" === "Hello": ${"hello" === "Hello"}`); // false (sensible a mayúsculas/minúsculas)

// Booleans
console.log(`true === true: ${true === true}`);     // true
console.log(`true === false: ${true === false}`);   // false

// Undefined y Null
console.log(`undefined === undefined: ${undefined === undefined}`); // true
console.log(`null === null: ${null === null}`);     // true

// Objects (comparación por referencia)
let objA = { x: 1 };
let objB = { x: 1 };
let objC = objA;

console.log(`objA === objB: ${objA === objB}`); // false (diferentes objetos en memoria)
console.log(`objA === objC: ${objA === objC}`); // true (misma referencia al objeto)
console.log(`[] === []: ${[] === []}`);         // false (dos arrays vacíos pero diferentes)
console.log(`{} === {}: ${{} === {}}`);         // false (dos objetos literales vacíos pero diferentes)
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Operadores y Expresiones',
    'topic': 'Comparaciones de Igualdad',
    'subtopic': 'Algoritmo SameValue',
    'definition': '''
El algoritmo "SameValue" es un algoritmo de comparación de igualdad más riguroso que `===` y es el que subyace a `Object.is()`. Este algoritmo se utiliza en ciertos contextos internos de JavaScript y para el comportamiento de `Object.is()`.

¿Te estás preguntando por qué esto importa?

Pues bien, piensa en el algoritmo `SameValue` como el intento de JavaScript de definir la igualdad "más perfecta" posible entre dos valores, abordando las dos principales peculiaridades de `===`:
1.  **`NaN`:** `SameValue(NaN, NaN)` es `true`. A diferencia de `===`, que dice que `NaN` no es igual a sí mismo, `SameValue` lo considera igual. Esto es crucial en situaciones donde quieres detectar si un valor es específicamente `NaN`.
2.  **Ceros con signo:** `SameValue(+0, -0)` es `false`. Mientras que `===` trata `+0` y `-0` como iguales, `SameValue` los distingue. Aunque esta distinción rara vez es importante en la mayoría de las aplicaciones, puede serlo en contextos muy específicos (por ejemplo, en matemáticas financieras o gráficos).

Para todos los demás tipos y valores (primitivos y referencias de objetos), `SameValue` se comporta exactamente igual que `isStrictlyEqual` (y por lo tanto, `===`). Es el algoritmo que debes considerar cuando necesitas la máxima precisión en las comparaciones, especialmente para manejar `NaN` de forma confiable.
''',
    'code_example': r'''
// Ejemplos del comportamiento del algoritmo SameValue (ilustrado por Object.is())

// Comparación de NaN:
console.log(`SameValue(NaN, NaN): ${Object.is(NaN, NaN)}`);     // Salida: true (diferente de ===)

// Comparación de +0 y -0:
console.log(`SameValue(+0, -0): ${Object.is(+0, -0)}`);         // Salida: false (diferente de ===)

// Para todos los demás casos, SameValue se comporta como ===

// Tipos diferentes (siempre false)
console.log(`SameValue(5, "5"): ${Object.is(5, "5")}`);          // Salida: false
console.log(`SameValue(null, undefined): ${Object.is(null, undefined)}`); // Salida: false

// Tipos iguales, valores iguales
console.log(`SameValue(10, 10): ${Object.is(10, 10)}`);         // Salida: true
console.log(`SameValue("abc", "abc"): ${Object.is("abc", "abc")}`); // Salida: true
console.log(`SameValue(true, true): ${Object.is(true, true)}`); // Salida: true
console.log(`SameValue(null, null): ${Object.is(null, null)}`); // Salida: true

// Comparación de objetos (por referencia, igual que ===)
let objX = { a: 1 };
let objY = { a: 1 };
let objZ = objX;

console.log(`SameValue(objX, objY): ${Object.is(objX, objY)}`); // Salida: false
console.log(`SameValue(objX, objZ): ${Object.is(objX, objZ)}`); // Salida: true
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Operadores y Expresiones',
    'topic': 'Comparaciones de Igualdad',
    'subtopic': 'Algoritmo SameValueZero',
    'definition': '''
El algoritmo "SameValueZero" es otro algoritmo de comparación de igualdad interna de JavaScript, utilizado por métodos como `Array.prototype.includes()` y `Map` y `Set` para determinar la igualdad de las claves o elementos. Es casi idéntico al algoritmo `SameValue` (y `Object.is()`), con una única y crucial diferencia: trata a `+0` y `-0` como iguales.

¿No sé tú, pero a mí esto al principio me costó? 

Es que, mientras `Object.is()` distingue `+0` y `-0`, `SameValueZero` no lo hace, considerándolos iguales, al igual que el operador `===`. La razón de esta diferencia es la practicidad: para la mayoría de los casos de uso en estructuras de datos como `Map` y `Set`, o al buscar elementos en un array, no querrías que `+0` y `-0` fueran tratados como valores distintos, ya que numéricamente son equivalentes.

En resumen:
* **`==` (isLooselyEqual):** Realiza coerción de tipos, muchas sorpresas.
* **`===` (isStrictlyEqual):** No hay coerción. `NaN !== NaN`. `+0 === -0`.
* **`Object.is()` (SameValue):** No hay coerción. `NaN === NaN`. `+0 !== -0`.
* **`Array.prototype.includes()`, `Map`, `Set` (SameValueZero):** No hay coerción. `NaN === NaN`. `+0 === -0`.

Entender estas sutiles diferencias es crucial para predecir el comportamiento de ciertas funcionalidades de JavaScript y escribir código más preciso.
''',
    'code_example': r'''
// Ejemplos del comportamiento del algoritmo SameValueZero
// Es el mismo que `Object.is()` excepto por el manejo de +0 y -0.

// Comparación de NaN:
// SameValueZero(NaN, NaN) es true. Esto es como Object.is() y diferente de ===.
const arrayConNaN = [1, NaN, 3];
console.log(`arrayConNaN.includes(NaN): ${arrayConNaN.includes(NaN)}`); // Salida: true

const setConNaN = new Set();
setConNaN.add(NaN);
console.log(`setConNaN.has(NaN): ${setConNaN.has(NaN)}`); // Salida: true

// Comparación de +0 y -0:
// SameValueZero(+0, -0) es true. Esto es como === y diferente de Object.is().
console.log(`+0 === -0: ${+0 === -0}`);                         // Salida: true (el algoritmo isStrictlyEqual y SameValueZero coinciden aquí)

console.log(`Object.is(+0, -0): ${Object.is(+0, -0)}`);           // Salida: false (Object.is() usa SameValue)

const arrayConCeros = [0]; // Internamente es +0
console.log(`arrayConCeros.includes(-0): ${arrayConCeros.includes(-0)}`); // Salida: true (SameValueZero los trata como iguales)

const setConCeros = new Set();
setConCeros.add(-0);
console.log(`setConCeros.has(+0): ${setConCeros.has(+0)}`);       // Salida: true (SameValueZero los trata como iguales)

// Para todos los demás casos, SameValueZero se comporta como === y SameValue.

// Tipos diferentes (siempre false)
console.log(`[1].includes("1"): ${[1].includes("1")}`);          // Salida: false (no hay coerción)

// Comparación de objetos (por referencia, igual que === y SameValue)
let objA = { x: 1 };
let objB = { x: 1 };
let objC = objA;

console.log(`[objA].includes(objB): ${[objA].includes(objB)}`); // Salida: false
console.log(`[objA].includes(objC): ${[objA].includes(objC)}`); // Salida: true

const mapConObjeto = new Map();
mapConObjeto.set(objA, "valor");
console.log(`mapConObjeto.has(objB): ${mapConObjeto.has(objB)}`); // Salida: false
console.log(`mapConObjeto.has(objC): ${mapConObjeto.has(objC)}`); // Salida: true
'''
  });
}

Future<void> insertJsJrLevel6Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Funciones',
    'topic': 'Fundamentos de Funciones',
    'subtopic': 'Declaración de funciones',
    'definition': '''
Una declaración de función (también conocida como "declaración de función con nombre") es la forma más común y tradicional de definir una función en JavaScript. Consiste en la palabra clave `function`, seguida de un nombre para la función, una lista de parámetros entre paréntesis y, finalmente, el bloque de código de la función encerrado entre llaves `{}`.

¿Seguramente te estarás preguntando de qué va todo esto?

Pues bien, piensa en una declaración de función como "enseñarle" a JavaScript una nueva receta y darle un nombre. Una vez que la "receta" (la función) está definida, puedes "cocinarla" (ejecutarla) tantas veces como quieras simplemente usando su nombre seguido de paréntesis `()`. La principal ventaja de las declaraciones de función es que están sujetas a "hoisting". Esto significa que JavaScript las "eleva" al principio de su ámbito antes de ejecutar cualquier código. Por lo tanto, puedes llamar a una función declarada *antes* de que su definición aparezca en el código, lo cual puede ser conveniente para la organización del código, pero a veces puede llevar a confusiones si no se comprende bien el `hoisting`. Son ideales para definir funciones que serán reutilizadas en múltiples lugares y que tienen un propósito claro y un nombre descriptivo.
''',
    'code_example': r'''
// Ejemplo básico de una declaración de función
function saludar(nombre) {
  console.log(`Hola, ${nombre}!`);
}

// Llamar a la función después de su declaración
saludar("Alice"); // Salida: Hola, Alice!

// Hoisting: Puedes llamar a la función antes de su declaración
despedirse("Bob"); // Salida: Adiós, Bob!

function despedirse(nombre) {
  console.log(`Adiós, ${nombre}!`);
}

// Función sin parámetros
function mostrarMensaje() {
  console.log("Este es un mensaje simple.");
}
mostrarMensaje(); // Salida: Este es un mensaje simple.

// Función con múltiples parámetros y valor de retorno
function sumar(a, b) {
  return a + b; // La palabra clave 'return' envía un valor de vuelta
}

let resultado = sumar(5, 3);
console.log(`El resultado de la suma es: ${resultado}`); // Salida: El resultado de la suma es: 8

// Una función puede llamar a otra función
function calcularYMostrar(num1, num2) {
  let suma = sumar(num1, num2); // Llamamos a la función sumar
  console.log(`La suma calculada es: ${suma}`);
}
calcularYMostrar(7, 2); // Salida: La suma calculada es: 9
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Funciones',
    'topic': 'Fundamentos de Funciones',
    'subtopic': 'Expresiones de funciones',
    'definition': '''
Una expresión de función es otra forma de definir funciones en JavaScript, donde una función se crea como parte de una expresión y se asigna a una variable. A diferencia de las declaraciones de función, las expresiones de función no están sujetas a "hoisting" en el mismo sentido; solo están disponibles una vez que la línea de código donde se definen es ejecutada.

¿Te estás preguntando por qué esto importa?

Pues bien, piensa en una expresión de función como una "tarea especial" que asignas a un "trabajador" (la variable). El "trabajador" solo sabe cómo hacer la tarea *después* de que se le ha dado la asignación. Esto significa que si intentas llamar a la función *antes* de que la línea de código que la define se haya ejecutado, obtendrás un error. Las expresiones de función son muy flexibles y se utilizan comúnmente para:
* **Funciones anónimas:** Funciones sin nombre que se usan una sola vez, a menudo como callbacks.
* **Asignación dinámica:** Puedes asignar funciones a variables, pasarlas como argumentos a otras funciones (callbacks), o devolverlas desde funciones.
* **Closures:** Son fundamentales para crear closures, donde una función "recuerda" el entorno en el que fue creada.
* **IIFEs (Immediately Invoked Function Expressions):** Funciones que se definen y se ejecutan inmediatamente.

La sintaxis puede incluir un nombre de función (expresión de función con nombre) o ser anónima (expresión de función anónima), siendo esta última la más frecuente. La elección entre declaración y expresión de función a menudo depende de si necesitas `hoisting` o si la función es parte de una asignación o un callback.
''',
    'code_example': r'''
// Ejemplo 1: Expresión de función anónima (la más común)
const saludar = function(nombre) {
  console.log(`Hola desde una expresión, ${nombre}!`);
};

// Llamar a la función después de su definición
saludar("Charlie"); // Salida: Hola desde una expresión, Charlie!

// Intentar llamar antes de la definición (dará un ReferenceError)
// despedirse(); // ReferenceError: Cannot access 'despedirse' before initialization (debido a let/const y el "temporal dead zone")

const despedirse = function(nombre) {
  console.log(`Adiós desde una expresión, ${nombre}!`);
};
despedirse("David"); // Salida: Adiós desde una expresión, David!

// Ejemplo 2: Expresión de función con nombre (el nombre solo es visible dentro de la función)
const multiplicar = function operacionMultiplicacion(a, b) {
  console.log(`Ejecutando operacionMultiplicacion internamente.`);
  return a * b;
};

let producto = multiplicar(4, 2);
console.log(`El producto es: ${producto}`); // Salida: El producto es: 8

// Intentar llamar al nombre interno de la función fuera de su ámbito (dará ReferenceError)
// operacionMultiplicacion(2, 3); // ReferenceError: operacionMultiplicacion is not defined

// Ejemplo 3: Expresión de función como callback
function ejecutarOperacion(operacion, x, y) {
  return operacion(x, y);
}

const division = function(a, b) {
  if (b === 0) {
    return "Error: División por cero";
  }
  return a / b;
};

console.log(ejecutarOperacion(division, 10, 2)); // Salida: 5
console.log(ejecutarOperacion(division, 10, 0)); // Salida: Error: División por cero
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Funciones',
    'topic': 'Fundamentos de Funciones',
    'subtopic': 'Parámetros y argumentos',
    'definition': '''
En JavaScript, los **parámetros** son los nombres de las variables que se listan en la definición de una función. Actúan como marcadores de posición para los valores que la función espera recibir. Los **argumentos**, por otro lado, son los valores reales que se pasan a la función cuando esta es llamada.

¿Seguramente te estarás preguntando de qué va todo esto?

Pues bien, piensa en una función como una "receta". Los parámetros son los "ingredientes" que la receta especifica que necesita (ej. "harina", "azúcar"). Los argumentos son los "ingredientes reales" que pones en el tazón cuando estás preparando la receta (ej. "2 tazas de harina", "1 taza de azúcar"). Cuando llamas a una función, los argumentos que le pasas se asignan a los parámetros correspondientes en el orden en que aparecen. Es crucial entender que los parámetros se convierten en variables locales dentro del ámbito de la función. Si la función se llama con menos argumentos de los esperados, los parámetros restantes se inicializarán con `undefined`. Si se llama con más argumentos, los argumentos adicionales simplemente serán ignorados (aunque son accesibles a través del objeto `arguments` o el parámetro rest). Dominar el uso de parámetros y argumentos es la base para construir funciones flexibles y reutilizables que pueden operar con diferentes conjuntos de datos.
''',
    'code_example': r'''
// Declaración de función con parámetros `num1` y `num2`
function multiplicar(num1, num2) {
  console.log(`Parámetro num1: ${num1}, Parámetro num2: ${num2}`);
  return num1 * num2;
}

// Llamadas a la función con diferentes argumentos
console.log("--- Llamada 1 ---");
let resultado1 = multiplicar(5, 10); // 5 y 10 son los argumentos
console.log(`Resultado de multiplicar(5, 10): ${resultado1}`); // Salida: 50

console.log("\n--- Llamada 2 ---");
let valorA = 7;
let valorB = 3;
let resultado2 = multiplicar(valorA, valorB); // valorA y valorB son los argumentos
console.log(`Resultado de multiplicar(valorA, valorB): ${resultado2}`); // Salida: 21

// Función con un solo parámetro
function saludar(nombre) {
  console.log(`Hola, ${nombre}!`);
}
console.log("\n--- Llamada 3 ---");
saludar("Ana"); // "Ana" es el argumento

// Función sin parámetros (pero se pueden pasar argumentos que son ignorados si no hay manejo)
function hacerAlgo() {
  console.log("Haciendo algo sin parámetros específicos.");
}
console.log("\n--- Llamada 4 ---");
hacerAlgo("esto", "aquello"); // "esto" y "aquello" son argumentos, pero no hay parámetros que los capturen

// Comportamiento cuando se pasan menos argumentos de los esperados
function infoPersona(nombre, edad, ciudad) {
  console.log(`\n--- Info Persona ---`);
  console.log(`Nombre: ${nombre}`);
  console.log(`Edad: ${edad}`); // Si no se pasa, será undefined
  console.log(`Ciudad: ${ciudad}`); // Si no se pasa, será undefined
}
infoPersona("Pedro", 25);
// Salida:
// Nombre: Pedro
// Edad: 25
// Ciudad: undefined
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Funciones',
    'topic': 'Fundamentos de Funciones',
    'subtopic': 'Parámetros por defecto',
    'definition': '''
Los parámetros por defecto (o valores predeterminados de parámetros) permiten inicializar un parámetro con un valor preestablecido si no se proporciona un argumento para ese parámetro, o si el argumento proporcionado es `undefined`. Esta característica se introdujo en ES6 (ECMAScript 2015) y simplifica enormemente el manejo de argumentos opcionales.

¿No sé tú, pero a mí esto al principio me costó? 

Es que antes de ES6, tenías que hacer verificaciones manuales dentro de la función para asignar un valor por defecto si un argumento era `undefined` (ej. `nombre = nombre || 'Invitado';`). Esto podía ser tedioso y propenso a errores. Pensemos por un momento en un restaurante que ofrece un "menú del día". Si no pides un plato específico, automáticamente te sirven el "plato del día". Los parámetros por defecto funcionan de manera similar: si no especificas un valor para un parámetro, JavaScript automáticamente le asigna el valor que definiste como predeterminado. Esto hace que tu código sea más conciso, legible y robusto al proporcionar valores sensatos para los parámetros que podrían omitirse.
''',
    'code_example': r'''
// Ejemplo 1: Parámetros por defecto básicos
function saludar(nombre = "Invitado", idioma = "es") {
  if (idioma === "es") {
    console.log(`Hola, ${nombre}!`);
  } else if (idioma === "en") {
    console.log(`Hello, ${nombre}!`);
  } else {
    console.log(`Idioma no soportado para ${nombre}.`);
  }
}

console.log("--- Saludos ---");
saludar();             // Salida: Hola, Invitado! (ambos parámetros usan sus valores por defecto)
saludar("María");      // Salida: Hola, María! (solo nombre se sobreescribe)
saludar("John", "en"); // Salida: Hello, John! (ambos parámetros se sobreescriben)
saludar("Peter", "fr"); // Salida: Idioma no soportado para Peter.

// Ejemplo 2: Parámetros por defecto con expresiones (se evalúan en el momento de la llamada)
let contadorLlamadas = 0;
function generarID() {
  contadorLlamadas++;
  return `ID-${contadorLlamadas}`;
}

function crearUsuario(nombre, id = generarID()) {
  console.log(`\n--- Nuevo Usuario ---`);
  console.log(`Nombre: ${nombre}, ID: ${id}`);
}

crearUsuario("Alice"); // Salida: Nombre: Alice, ID: ID-1
crearUsuario("Bob");   // Salida: Nombre: Bob, ID: ID-2
crearUsuario("Charlie", "CUSTOM-ID-001"); // Salida: Nombre: Charlie, ID: CUSTOM-ID-001

// Ejemplo 3: Parámetros por defecto y undefined
function infoProducto(nombre, precio = 0, stock = 10) {
  console.log(`\n--- Info Producto ---`);
  console.log(`Producto: ${nombre}, Precio: $${precio}, Stock: ${stock}`);
}

infoProducto("Leche");        // Salida: Producto: Leche, Precio: $0, Stock: 10
infoProducto("Pan", 2.5);     // Salida: Producto: Pan, Precio: $2.5, Stock: 10
infoProducto("Manzanas", undefined, 50); // Se usa undefined para usar el valor por defecto de precio
// Salida: Producto: Manzanas, Precio: $0, Stock: 50
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Funciones',
    'topic': 'Fundamentos de Funciones',
    'subtopic': 'Parámetro rest',
    'definition': '''
El parámetro rest (`...nombreVariable`) es una característica de ES6 (ECMAScript 2015) que permite a una función aceptar un número indefinido de argumentos como un array. Recopila todos los argumentos restantes que no tienen un parámetro individual asignado y los agrupa en un único array.

¿Te estás preguntando por qué esto importa?

Pues bien, piensa en el parámetro rest como una "caja de recolección" para todos los extras. Si tu función espera un "plato principal" (un parámetro nombrado) y luego no sabes cuántos "acompañamientos" adicionales podría recibir, el parámetro rest es perfecto. Por ejemplo, en una función `sumarTodos(primerNumero, ...numerosRestantes)`, `primerNumero` tomará el primer argumento, y `numerosRestantes` será un array que contiene todos los demás argumentos pasados a la función. Esto es increíblemente útil para crear funciones flexibles que pueden manejar una cantidad variable de entradas, como funciones de suma, promedios, o cualquier operación que necesite procesar una colección de ítems. A diferencia del obsoleto objeto `arguments` (que no es un array real), el parámetro rest es un `Array` estándar, lo que te permite usar todos los métodos de array directamente en él. Solo puede haber un parámetro rest en la definición de una función, y siempre debe ser el último parámetro.
''',
    'code_example': r'''
// Ejemplo 1: Sumar un número ilimitado de argumentos
function sumarNumeros(...numeros) { // `numeros` es un array de todos los argumentos pasados
  let total = 0;
  for (const num of numeros) {
    total += num;
  }
  return total;
}

console.log(`Suma de 1, 2, 3: ${sumarNumeros(1, 2, 3)}`);       // Salida: 6
console.log(`Suma de 5, 10, 15, 20: ${sumarNumeros(5, 10, 15, 20)}`); // Salida: 50
console.log(`Suma de nada: ${sumarNumeros()}`);                 // Salida: 0

// Ejemplo 2: Combinar parámetros nombrados con el parámetro rest
function registrarAccion(accion, ...detalles) {
  console.log(`\nAcción registrada: ${accion}`);
  if (detalles.length > 0) {
    console.log("Detalles adicionales:");
    detalles.forEach((detalle, index) => {
      console.log(`  ${index + 1}. ${detalle}`);
    });
  } else {
    console.log("  No se proporcionaron detalles adicionales.");
  }
}

registrarAccion("Login de usuario", "Usuario: admin", "IP: 192.168.1.100");
// Salida:
// Acción registrada: Login de usuario
// Detalles adicionales:
//   1. Usuario: admin
//   2. IP: 192.168.1.100

registrarAccion("Cierre de sesión");
// Salida:
// Acción registrada: Cierre de sesión
//   No se proporcionaron detalles adicionales.

// Ejemplo 3: El parámetro rest debe ser el último
// function ejemploInvalido(...primero, segundo) { // Esto generaría un error de sintaxis
//   console.log(primero, segundo);
// }

// Ejemplo 4: Obteniendo solo los argumentos restantes
function saludarVarios(saludoInicial, ...nombres) {
  console.log(`${saludoInicial}, ${nombres.join(' y ')}!`);
}

saludarVarios("Hola", "Alice", "Bob", "Charlie");
// Salida: Hola, Alice y Bob y Charlie!
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Funciones',
    'topic': 'Fundamentos de Funciones',
    'subtopic': 'Objeto arguments',
    'definition': '''
El objeto `arguments` es una variable local especial disponible dentro de todas las funciones (excepto las funciones flecha). Es un objeto tipo array (pero no un `Array` real) que contiene todos los argumentos pasados a la función, en el orden en que fueron recibidos.

¿No sé tú, pero a mí esto al principio me costó? 

Es que, antes de la introducción del parámetro rest en ES6, el objeto `arguments` era la única forma de acceder a un número indefinido de argumentos pasados a una función. Pensemos por un momento en una "caja de sastre" donde se guardan todos los hilos y botones, sin un orden estricto y no siempre fáciles de usar. `arguments` es similar: contiene todos los argumentos, pero para usar métodos de array (como `forEach` o `map`), primero tienes que convertirlo a un array real (por ejemplo, usando `Array.from(arguments)` o el operador spread `[...arguments]`). Debido a sus limitaciones (no es un `Array` y no se comporta bien en funciones flecha) y la existencia del parámetro rest (que es superior y más limpio), el uso de `arguments` está **en gran medida desaconsejado** en el código JavaScript moderno. Sin embargo, es importante conocerlo porque lo encontrarás en código antiguo y para entender cómo JavaScript manejaba los argumentos variables históricamente.
''',
    'code_example': r'''
// Ejemplo 1: Uso básico del objeto arguments para sumar todos los argumentos
function sumarTodos() {
  console.log(`\n--- Usando arguments para sumar ---`);
  console.log(`Tipo de arguments: ${typeof arguments}`); // Salida: object
  console.log(`arguments es una instancia de Array: ${arguments instanceof Array}`); // Salida: false

  let total = 0;
  // Puedes iterar con un bucle for tradicional
  for (let i = 0; i < arguments.length; i++) {
    total += arguments[i];
  }
  return total;
}

console.log(`Suma de 1, 2, 3 (usando arguments): ${sumarTodos(1, 2, 3)}`);       // Salida: 6
console.log(`Suma de 5, 10 (usando arguments): ${sumarTodos(5, 10)}`);          // Salida: 15

// Ejemplo 2: Convirtiendo arguments a un Array real para usar métodos de Array
function procesarArgs() {
  console.log(`\n--- Convirtiendo arguments a Array ---`);
  // Forma moderna: Operador Spread
  const argsArray = [...arguments];
  console.log(`argsArray es una instancia de Array: ${argsArray instanceof Array}`); // Salida: true
  console.log(`Elementos duplicados: ${argsArray.map(arg => arg * 2)}`);

  // Forma antigua: Array.prototype.slice.call()
  // const argsArrayOld = Array.prototype.slice.call(arguments);
  // console.log(`Elementos reversados (antiguo): ${argsArrayOld.reverse()}`);
}

procesarArgs(10, 20, 30);
// Salida:
// Elementos duplicados: 20,40,60

// Ejemplo 3: El objeto arguments en funciones con parámetros nombrados
function mostrarArgumentos(a, b) {
  console.log(`\n--- Parámetros y arguments ---`);
  console.log(`a: ${a}, b: ${b}`);
  console.log(`arguments[0]: ${arguments[0]}, arguments[1]: ${arguments[1]}`);
  console.log(`Todos los argumentos: `, arguments);
}

mostrarArgumentos("primer", "segundo", "tercer", "cuarto"); // El cuarto argumento se accede via arguments
// Salida:
// a: primer, b: segundo
// arguments[0]: primer, arguments[1]: segundo
// Todos los argumentos: Arguments { '0': 'primer', '1': 'segundo', '2': 'tercer', '3': 'cuarto', callee: ƒ, Symbol(Symbol.iterator): ƒ }

// Ejemplo 4: arguments NO existe en funciones flecha
const funcionFlecha = (...args) => { // ¡Usar parámetro rest en funciones flecha!
  // console.log(arguments); // Esto generaría un ReferenceError: arguments is not defined
  console.log(`\n--- Función Flecha con Parámetro Rest ---`);
  console.log(`Parámetro rest: ${args}`);
};

funcionFlecha(1, 2, 3); // Salida: Parámetro rest: 1,2,3
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Funciones',
    'topic': 'Estilos y Comportamientos',
    'subtopic': 'Funciones flecha',
    'definition': '''
Las funciones flecha (arrow functions), introducidas en ES6 (ECMAScript 2015), ofrecen una sintaxis más concisa para escribir expresiones de función. Son una alternativa a las funciones tradicionales, especialmente útiles para funciones anónimas y callbacks, y tienen un comportamiento diferente con respecto al `this` y el objeto `arguments`.

¿Seguramente te estarás preguntando de qué va todo esto?

Pues bien, piensa en las funciones flecha como una forma abreviada y moderna de definir funciones, eliminando algunas de las "complicaciones" de las funciones tradicionales. Su principal característica es que **no tienen su propio `this`**. En cambio, el `this` dentro de una función flecha se hereda del ámbito léxico (el ámbito donde la función flecha fue definida), lo que resuelve un problema común con el `this` en callbacks. Además, **no tienen el objeto `arguments`**, por lo que si necesitas acceder a todos los argumentos, debes usar el parámetro rest (`...args`). Su sintaxis es `(parámetros) => { cuerpo }`. Si el cuerpo de la función es una sola expresión, puedes omitir las llaves y el `return` implícito, lo que las hace muy concisas. Son ideales para:
* Callbacks de una sola línea (ej. en `map`, `filter`, `reduce`).
* Funciones anónimas concisas.
* Cuando necesitas que `this` se refiera al contexto circundante.

Sin embargo, no son adecuadas para constructores (`new Function()`), métodos de objetos que necesitan su propio `this` dinámico, o funciones que dependen del objeto `arguments`.
''',
    'code_example': r'''
// Ejemplo 1: Sintaxis básica de función flecha
const sumar = (a, b) => a + b; // Retorno implícito para una sola expresión
console.log(`Suma (flecha): ${sumar(5, 3)}`); // Salida: Suma (flecha): 8

const saludar = nombre => console.log(`Hola, ${nombre}!`); // Un solo parámetro, paréntesis opcionales
saludar("Elena"); // Salida: Hola, Elena!

const mostrarMensaje = () => console.log("Mensaje sin parámetros."); // Sin parámetros, paréntesis obligatorios
mostrarMensaje(); // Salida: Mensaje sin parámetros.

// Ejemplo 2: Función flecha con cuerpo de bloque (requiere `return` explícito)
const obtenerInfo = (nombre, edad) => {
  const anioActual = new Date().getFullYear();
  const anioNacimiento = anioActual - edad;
  return `Nombre: ${nombre}, Edad: ${edad}, Año de nacimiento: ${anioNacimiento}`;
};
console.log(obtenerInfo("Juan", 30)); // Salida: Nombre: Juan, Edad: 30, Año de nacimiento: 1995

// Ejemplo 3: Diferencia clave con `this`
// Contexto global (en navegador, `this` es window; en Node.js, `this` es {})
this.valorGlobal = "Soy global";

const objTradicional = {
  valor: "Soy tradicional",
  mostrarValor: function() {
    // `this` aquí se refiere a `objTradicional`
    console.log(`Función tradicional this.valor: ${this.valor}`);

    // Problema: en un callback anidado, `this` cambia a global/undefined en strict mode
    setTimeout(function() {
      console.log(`Callback tradicional this.valor: ${this.valor}`); // `this` es window/undefined
    }, 100);
  }
};
objTradicional.mostrarValor();
// Salida (puede variar ligeramente según el entorno):
// Función tradicional this.valor: Soy tradicional
// Callback tradicional this.valor: Soy global (o undefined en strict mode)


const objFlecha = {
  valor: "Soy flecha",
  mostrarValor: function() {
    // `this` aquí se refiere a `objFlecha`
    console.log(`Función tradicional envolvente this.valor: ${this.valor}`);

    // Solución: `this` en la función flecha hereda del ámbito léxico (aquí, de `mostrarValor` de `objFlecha`)
    setTimeout(() => {
      console.log(`Callback flecha this.valor: ${this.valor}`); // `this` sigue siendo `objFlecha`
    }, 100);
  }
};
objFlecha.mostrarValor();
// Salida:
// Función tradicional envolvente this.valor: Soy flecha
// Callback flecha this.valor: Soy flecha

// Ejemplo 4: No tienen `arguments`
const funcionSinArguments = (...args) => { // Usa el parámetro rest
  console.log(`\nArgumentos con flecha (parámetro rest): ${args}`);
};
funcionSinArguments(1, 2, 3); // Salida: Argumentos con flecha (parámetro rest): 1,2,3

// const funcionConArguments = () => {
//   console.log(arguments); // Esto daría ReferenceError
// };
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Funciones',
    'topic': 'Estilos y Comportamientos',
    'subtopic': 'IIFE (Immediately Invoked Function Expression)',
    'definition': '''
Una IIFE (Immediately Invoked Function Expression), o Expresión de Función Ejecutada Inmediatamente, es un patrón de diseño en JavaScript donde una función se define y se ejecuta inmediatamente después de su creación. Su estructura típica es una expresión de función envuelta en paréntesis `()`, seguida de otro par de paréntesis `()` para invocarla.

¿Te estás preguntando por qué esto importa?

Pues bien, piensa en una IIFE como un "laboratorio secreto" de un solo uso. Todo lo que sucede dentro de esa función se mantiene aislado del resto de tu código global. Esto es crucial por varias razones, especialmente antes de la llegada de los módulos de ES6:
1.  **Aislamiento de Ámbito:** Las IIFEs crean su propio ámbito de función, lo que evita que las variables y funciones definidas dentro de ellas "contaminen" el ámbito global. Esto previene conflictos de nombres y efectos secundarios no deseados en aplicaciones grandes o cuando se integran bibliotecas de terceros.
2.  **Protección de Variables:** Al mantener las variables locales dentro de la IIFE, las haces privadas y no accesibles desde fuera, lo que es una forma de encapsulamiento. Esto es la base para el patrón "módulo" en JavaScript antiguo.
3.  **Ejecución Inmediata:** La función se ejecuta tan pronto como se define, lo que es útil para inicializar configuraciones, ejecutar código una sola vez al cargar la página, o para configurar listeners de eventos.
4.  **Creación de Closures:** Permiten crear closures que capturan variables de su entorno circundante, lo que es potente para mantener el estado.

Aunque los módulos de ES6 (`import`/`export`) han reducido la necesidad de IIFEs para el aislamiento de ámbito en proyectos modernos, siguen siendo un patrón válido y útil en muchos contextos, especialmente en proyectos heredados o para scripts pequeños y auto-contenidos.
''',
    'code_example': r'''
// Ejemplo 1: IIFE básica para aislamiento de ámbito
(function() {
  let mensaje = "Hola desde una IIFE!"; // `mensaje` es local a esta IIFE
  console.log(mensaje);
})(); // Los paréntesis finales invocan la función

// Intentar acceder a `mensaje` aquí resultaría en un ReferenceError
// console.log(mensaje); // ReferenceError: mensaje is not defined

// Ejemplo 2: IIFE con parámetros
(function(nombre) {
  let saludo = `Bienvenido, ${nombre}!`;
  console.log(saludo);
})("Alice"); // Pasamos "Alice" como argumento

// Ejemplo 3: IIFE que devuelve un valor (patrón de módulo simple)
const contador = (function() {
  let cuenta = 0; // Esta variable es privada (closure)

  return {
    incrementar: function() {
      cuenta++;
      console.log(`Cuenta: ${cuenta}`);
    },
    obtenerCuenta: function() {
      return cuenta;
    }
  };
})(); // La IIFE se ejecuta y devuelve un objeto con métodos

contador.incrementar();     // Salida: Cuenta: 1
contador.incrementar();     // Salida: Cuenta: 2
console.log(`Cuenta actual: ${contador.obtenerCuenta()}`); // Salida: Cuenta actual: 2

// Intentar acceder directamente a `cuenta` resultaría en un ReferenceError
// console.log(contador.cuenta); // undefined

// Ejemplo 4: Variaciones de sintaxis (menos comunes pero válidas)
// Con operador unario +
+function() { console.log("IIFE con +"); }();

// Con operador unario !
!function() { console.log("IIFE con !"); }();

// Con paréntesis alrededor de la invocación
(function() { console.log("IIFE con paréntesis alrededor de la invocación"); }());
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Funciones',
    'topic': 'Estilos y Comportamientos',
    'subtopic': 'Stack de llamadas',
    'definition': '''
El "Stack de llamadas" (Call Stack) en JavaScript es una estructura de datos (una pila LIFO - Last In, First Out) que registra el orden en que se ejecutan las funciones en un programa. Cada vez que una función es invocada, se "empuja" (push) a la cima del stack. Cuando una función termina de ejecutarse, se "saca" (pop) del stack.

¿Seguramente te estarás preguntando de qué va todo esto?

Pues bien, piensa en el stack de llamadas como una pila de platos en un restaurante. Cuando un camarero trae un plato (invoca una función), lo pone en la cima de la pila. Cuando un plato se limpia (la función termina), se retira el plato de la cima. JavaScript siempre ejecuta la función que está en la cima del stack. Si la función en la cima llama a otra función, esa nueva función se empuja a la cima y se ejecuta. Este proceso continúa hasta que la función actual devuelve un valor o lanza un error. Si el stack se llena demasiado (por ejemplo, con una recursión infinita), se produce un error de "Stack Overflow". Entender el stack de llamadas es fundamental para depurar errores, comprender el flujo de ejecución asíncrono (aunque las operaciones asíncronas se manejan fuera del stack de llamadas principal) y para razonar sobre el comportamiento de programas complejos.
''',
    'code_example': r'''
// Ejemplo 1: Ilustración básica del Stack de Llamadas
function primeraFuncion() {
  console.log("Inicio de primeraFuncion");
  segundaFuncion(); // Llama a segundaFuncion
  console.log("Fin de primeraFuncion");
}

function segundaFuncion() {
  console.log("Inicio de segundaFuncion");
  terceraFuncion(); // Llama a terceraFuncion
  console.log("Fin de segundaFuncion");
}

function terceraFuncion() {
  console.log("Inicio de terceraFuncion");
  // Esta función no llama a ninguna otra, así que terminará y saldrá del stack
  console.log("Fin de terceraFuncion");
}

console.log("Programa iniciado");
primeraFuncion(); // La primera llamada, se empuja al stack
console.log("Programa finalizado");

// Orden de ejecución y cómo se vería el stack:
// 1. Programa iniciado
// 2. `primeraFuncion` se empuja al stack
//    - Inicio de primeraFuncion
// 3. `segundaFuncion` se empuja al stack
//    - Inicio de segundaFuncion
// 4. `terceraFuncion` se empuja al stack
//    - Inicio de terceraFuncion
//    - Fin de terceraFuncion
// 5. `terceraFuncion` se saca del stack
//    - Fin de segundaFuncion
// 6. `segundaFuncion` se saca del stack
//    - Fin de primeraFuncion
// 7. `primeraFuncion` se saca del stack
// 8. Programa finalizado

// Salida esperada en la consola:
// Programa iniciado
// Inicio de primeraFuncion
// Inicio de segundaFuncion
// Inicio de terceraFuncion
// Fin de terceraFuncion
// Fin de segundaFuncion
// Fin de primeraFuncion
// Programa finalizado


// Ejemplo 2: Recursión y el Stack de Llamadas (¡cuidado con el Stack Overflow!)
function factorial(n) {
  console.log(`Calculando factorial de: ${n}`);
  if (n < 0) {
    throw new Error("No se puede calcular factorial de números negativos.");
  }
  if (n === 0 || n === 1) {
    return 1;
  }
  return n * factorial(n - 1); // Llamada recursiva: `factorial(n-1)` se empuja al stack
}

try {
  console.log("\n--- Calculando Factorial ---");
  console.log(`Factorial de 3: ${factorial(3)}`);
  // Stack para factorial(3):
  // factorial(3)
  //   factorial(2)
  //     factorial(1) <- Esta devuelve 1, se saca del stack
  //   factorial(2) devuelve 2 * 1, se saca del stack
  // factorial(3) devuelve 3 * 2, se saca del stack
} catch (e) {
  console.error(e.message);
}

// Ejemplo de Stack Overflow (descomentar para probar, podría colgar el navegador/Node.js)
// function stackOverflow() {
//   stackOverflow(); // Llamada a sí misma sin condición de parada
// }
// stackOverflow(); // Esto llenará el stack y causará un error
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Funciones',
    'topic': 'Estilos y Comportamientos',
    'subtopic': 'Contexto de ejecución',
    'definition': '''
El "Contexto de ejecución" (Execution Context) en JavaScript es un concepto fundamental que describe el entorno en el que se evalúa y ejecuta el código JavaScript. Cada vez que el código se ejecuta, se crea un contexto de ejecución. Hay dos tipos principales: el Contexto de Ejecución Global y los Contextos de Ejecución de Función.

¿No sé tú, pero a mí esto al principio me costó? 

Pensemos en un "escenario" para una obra de teatro. El contexto de ejecución es como ese escenario: define las reglas, el elenco (variables, funciones) y cómo se interpretan los diálogos (el código). Cuando JavaScript carga tu script, crea el **Contexto de Ejecución Global**, que es el "escenario principal" donde se definen las variables y funciones globales. Cada vez que llamas a una función, JavaScript crea un nuevo **Contexto de Ejecución de Función** para esa llamada. Este nuevo contexto se empuja al "Stack de llamadas" y se convierte en el contexto activo. Contiene:
* **Variable Environment:** Dónde se almacenan las variables y declaraciones de función locales.
* **Lexical Environment:** Un mapa de identificadores a valores, y una referencia al entorno léxico "exterior" (el ámbito donde se definió la función). Esto es crucial para los "closures".
* **`this` Binding:** El valor del `this` para esa ejecución. Este es el aspecto más variable y a menudo confuso.

Entender el contexto de ejecución es vital para comprender cómo se resuelven las variables, cómo funciona el `this` y cómo se comportan los closures. Es la base de cómo JavaScript organiza y ejecuta tu código.
''',
    'code_example': r'''
// --- Contexto de Ejecución Global ---
// Este código se ejecuta en el Contexto de Ejecución Global.
let variableGlobal = "Soy una variable global";

function funcionGlobal() {
  console.log(this); // En el navegador, `this` en el contexto global es `window`. En Node.js, es `{}` (objeto global).
  console.log(variableGlobal); // Accede a la variable global
}

console.log("--- Contexto Global ---");
funcionGlobal();

// --- Contexto de Ejecución de Función ---
function saludar(nombre) { // Se crea un nuevo Contexto de Ejecución para `saludar`
  let mensaje = `Hola, ${nombre}`; // `mensaje` y `nombre` son locales a este contexto
  console.log(mensaje);
  console.log(this); // El valor de `this` depende de cómo se llama la función

  // Este contexto de función tiene acceso a `variableGlobal` debido al ámbito léxico
  console.log(`Accediendo desde función a global: ${variableGlobal}`);

  function funcionAnidada() { // Otro Contexto de Ejecución anidado
    let saludoInterno = "Desde la función anidada";
    console.log(`${mensaje} ${saludoInterno}`); // Accede a `mensaje` del contexto externo (closure)
    console.log(this); // El `this` de la función anidada también depende de cómo se llama
  }
  funcionAnidada(); // Llama a la función anidada
}

console.log("\n--- Llamada a función (contexto por defecto) ---");
saludar("Alicia"); // `this` será el objeto global (window en navegador, {} en Node.js)

// --- Diferentes formas de llamar una función y su `this` ---

// 1. Llamada como método de un objeto: `this` es el objeto
const usuario = {
  nombre: "Bob",
  saludarMetodo: function() {
    console.log(`\nHola, soy ${this.nombre} (desde método).`);
    console.log(this); // `this` es `usuario`
  }
};
usuario.saludarMetodo();

// 2. Llamada con `call`, `apply`, `bind`: `this` se establece explícitamente
function mostrarEdad() {
  console.log(`\nMi edad es ${this.edad} (usando call/apply/bind).`);
  console.log(this);
}
const persona = { edad: 25 };
mostrarEdad.call(persona);   // `this` es `persona`
mostrarEdad.apply(persona);  // `this` es `persona`

const mostrarEdadBind = mostrarEdad.bind({ edad: 40 });
mostrarEdadBind();          // `this` es `{ edad: 40 }`

// 3. Función flecha: `this` es el del ámbito léxico
const miObjeto = {
  id: "ABC",
  funcionTradicional: function() {
    console.log(`\nTradicional - this.id: ${this.id}`); // `this` es `miObjeto`
    setTimeout(function() {
      console.log(`Tradicional Callback - this.id: ${this.id}`); // `this` es global/undefined
    }, 0);
  },
  funcionFlecha: function() {
    console.log(`\nFlecha Envolvente - this.id: ${this.id}`); // `this` es `miObjeto`
    setTimeout(() => { // Función flecha aquí
      console.log(`Flecha Callback - this.id: ${this.id}`); // `this` hereda de `funcionFlecha` (que es `miObjeto`)
    }, 0);
  }
};
miObjeto.funcionTradicional();
miObjeto.funcionFlecha();
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Funciones',
    'topic': 'Estilos y Comportamientos',
    'subtopic': 'Funciones nativas (eval, isNaN, etc.)',
    'definition': '''
Las funciones nativas en JavaScript (también llamadas funciones globales o intrínsecas) son funciones predefinidas que están disponibles globalmente en cualquier entorno JavaScript sin necesidad de importarlas. Realizan tareas comunes y fundamentales, como la conversión de tipos, el manejo de URL, o la evaluación de código.

¿Seguramente te estarás preguntando de qué va todo esto?

Pues bien, piensa en estas funciones como "herramientas integradas" que JavaScript te ofrece desde el principio. No tienes que construirlas tú mismo; simplemente las usas cuando las necesitas. Algunas de las más importantes y comúnmente utilizadas son:
* **`eval()`:** Ejecuta una cadena de texto como si fuera código JavaScript. **Su uso se desaconseja fuertemente** debido a riesgos de seguridad (permite la inyección de código malicioso) y problemas de rendimiento (dificulta la optimización por parte del motor JS).
* **`isNaN()`:** Determina si un valor es `NaN` (Not-a-Number). **¡Cuidado!** Realiza coerción de tipos. Por ejemplo, `isNaN("hello")` es `true` porque `"hello"` no es un número. Es preferible usar `Number.isNaN()` para una verificación más estricta que no coacciona el tipo.
* **`parseInt()`:** Analiza una cadena de texto y devuelve un número entero. Puede tomar un segundo argumento (radix) para especificar la base numérica (ej. base 10, base 16).
* **`parseFloat()`:** Analiza una cadena de texto y devuelve un número de punto flotante (decimal).
* **`encodeURI()`, `decodeURI()`, `encodeURIComponent()`, `decodeURIComponent()`:** Se utilizan para codificar y decodificar cadenas de texto para URLs, manejando caracteres especiales.
* **`isFinite()`:** Determina si un valor es un número finito.
* **`Number()`, `String()`, `Boolean()`:** Funciones constructoras que se pueden usar para conversiones de tipo explícitas.

Aunque estas funciones son "nativas", siempre es importante entender su comportamiento, especialmente con la coerción de tipos o las implicaciones de seguridad, para usarlas de forma efectiva y segura.
''',
    'code_example': r'''
// --- Ejemplos de funciones nativas ---

// 1. eval() - ¡USO DESACONSEJADO POR SEGURIDAD Y RENDIMIENTO!
console.log("\n--- eval() ---");
try {
  let codigo = "let x = 10; console.log(x * 2);";
  eval(codigo); // Salida: 20
  // eval("console.log(window);"); // En navegador, accede al objeto window
} catch (e) {
  console.error("Error al usar eval:", e.message);
}
// Nunca uses eval() con cadenas de origen desconocido o inseguro.

// 2. isNaN() - ¡Cuidado con la coerción!
console.log("\n--- isNaN() ---");
console.log(`isNaN(123): ${isNaN(123)}`);           // Salida: false (es un número)
console.log(`isNaN("123"): ${isNaN("123")}`);       // Salida: false ("123" se convierte a 123)
console.log(`isNaN("hello"): ${isNaN("hello")}`);   // Salida: true ("hello" no se puede convertir a número)
console.log(`isNaN(true): ${isNaN(true)}`);         // Salida: false (true se convierte a 1)
console.log(`isNaN(undefined): ${isNaN(undefined)}`); // Salida: true (undefined se convierte a NaN)
console.log(`isNaN(NaN): ${isNaN(NaN)}`);           // Salida: true

// Preferible usar Number.isNaN() para una verificación estricta de NaN
console.log(`Number.isNaN("hello"): ${Number.isNaN("hello")}`); // Salida: false (no es NaN y no es un number)
console.log(`Number.isNaN(NaN): ${Number.isNaN(NaN)}`);         // Salida: true

// 3. parseInt() y parseFloat()
console.log("\n--- parseInt() y parseFloat() ---");
console.log(`parseInt("100px"): ${parseInt("100px")}`);   // Salida: 100
console.log(`parseInt("3.14"): ${parseInt("3.14")}`);     // Salida: 3 (trunca decimales)
console.log(`parseFloat("3.14px"): ${parseFloat("3.14px")}`); // Salida: 3.14
console.log(`parseInt("0xF"): ${parseInt("0xF")}`);       // Salida: 15 (detecta hexadecimal)
console.log(`parseInt("0F", 16): ${parseInt("0F", 16)}`); // Salida: 15 (explícitamente hexadecimal)
console.log(`parseInt("  123 "): ${parseInt("  123 ")}`); // Salida: 123 (ignora espacios en blanco)
console.log(`parseInt("abc"): ${parseInt("abc")}`);       // Salida: NaN (no puede parsear)

// 4. Codificación/Decodificación de URLs
console.log("\n--- Codificación/Decodificación de URLs ---");
let uri = "my page.html?name=Jhon Doe&age=30";
let encodedURI = encodeURI(uri);
console.log(`encodeURI: ${encodedURI}`);
// Salida: my%20page.html?name=Jhon%20Doe&age=30

let component = "Jhon Doe & Cía";
let encodedComponent = encodeURIComponent(component);
console.log(`encodeURIComponent: ${encodedComponent}`);
// Salida: Jhon%20Doe%20%26%20C%C3%ADa

let decodedComponent = decodeURIComponent(encodedComponent);
console.log(`decodeURIComponent: ${decodedComponent}`);
// Salida: Jhon Doe & Cía

// 5. isFinite()
console.log("\n--- isFinite() ---");
console.log(`isFinite(10): ${isFinite(10)}`);           // Salida: true
console.log(`isFinite(Infinity): ${isFinite(Infinity)}`); // Salida: false
console.log(`isFinite(-Infinity): ${isFinite(-Infinity)}`); // Salida: false
console.log(`isFinite(NaN): ${isFinite(NaN)}`);         // Salida: false
console.log(`isFinite("10"): ${isFinite("10")}`);       // Salida: true ("10" se convierte a número)
console.log(`isFinite("abc"): ${isFinite("abc")}`);     // Salida: false ("abc" se convierte a NaN)

// 6. Conversión de tipo con funciones constructoras
console.log("\n--- Conversión de Tipo ---");
console.log(`Number("42"): ${Number("42")}, tipo: ${typeof Number("42")}`); // Salida: 42, tipo: number
console.log(`String(123): ${String(123)}, tipo: ${typeof String(123)}`);   // Salida: "123", tipo: string
console.log(`Boolean(0): ${Boolean(0)}, tipo: ${typeof Boolean(0)}`);       // Salida: false, tipo: boolean
console.log(`Boolean(""): ${Boolean("")}, tipo: ${typeof Boolean("")}`);   // Salida: false, tipo: boolean
console.log(`Boolean("hello"): ${Boolean("hello")}, tipo: ${typeof Boolean("hello")}`); // Salida: true, tipo: boolean
'''
  });
}
