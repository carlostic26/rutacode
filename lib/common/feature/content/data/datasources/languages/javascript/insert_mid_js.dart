import 'package:sqflite_common/sqlite_api.dart';

Future<void> insertJsMidLevel1Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 1,
    'tittle_level': 'Estructuras de Datos',
    'topic': 'Objetos',
    'subtopic': 'Propiedades y valores',
    'definition': '''
En JavaScript, un objeto es una colección de **propiedades**, donde cada propiedad tiene un **nombre** (también llamado clave o clave de propiedad) y un **valor**. Los valores de las propiedades pueden ser cualquier tipo de dato en JavaScript, incluyendo otros objetos, funciones, números, strings, booleanos, etc. Los objetos son la estructura de datos más fundamental y versátil en JavaScript, y se utilizan para representar entidades complejas con características y comportamientos.

¿Seguramente te estarás preguntando de qué va todo esto?

Pues bien, piensa en un objeto como una "ficha de identidad" para algo. Si tienes una persona, esa persona tiene propiedades como "nombre", "edad", "ciudad". El "nombre" podría tener el valor "Juan", la "edad" el valor `30`, y la "ciudad" el valor "Madrid". En JavaScript, defines estas propiedades y sus valores dentro de un objeto literal usando llaves `{}`.

Las propiedades de un objeto son esenciales porque:
* **Organizan Datos:** Permiten agrupar datos relacionados bajo un mismo nombre.
* **Modelan Entidades:** Son la base para representar conceptos del mundo real en tu código.
* **Permiten Comportamiento:** Cuando el valor de una propiedad es una función, se le llama "método" y permite que el objeto realice acciones.

Entender cómo funcionan las propiedades y valores es la base para trabajar con objetos, manipular datos estructurados y construir aplicaciones JavaScript robustas.
''',
    'code_example': r'''
// Ejemplo 1: Objeto literal con propiedades y valores de diferentes tipos
const persona = {
  nombre: "Alice",           // Propiedad: nombre, Valor: "Alice" (string)
  edad: 28,                  // Propiedad: edad, Valor: 28 (number)
  esEstudiante: false,       // Propiedad: esEstudiante, Valor: false (boolean)
  ciudad: "Nueva York",      // Propiedad: ciudad, Valor: "Nueva York" (string)
  hobbies: ["leer", "nadar", "cocinar"], // Propiedad: hobbies, Valor: un array
  direccion: {               // Propiedad: direccion, Valor: otro objeto (objeto anidado)
    calle: "Calle Falsa 123",
    codigoPostal: "10001"
  },
  saludar: function() {      // Propiedad: saludar, Valor: una función (esto es un método)
    console.log(`Hola, mi nombre es ${this.nombre}.`);
  }
};

console.log("--- Propiedades del objeto persona ---");
console.log(`Nombre: ${persona.nombre}`);
console.log(`Edad: ${persona.edad}`);
console.log(`Es estudiante: ${persona.esEstudiante}`);
console.log(`Ciudad: ${persona.ciudad}`);
console.log(`Primer hobby: ${persona.hobbies[0]}`);
console.log(`Calle: ${persona.direccion.calle}`);

// Llamando al método del objeto
persona.saludar(); // Salida: Hola, mi nombre es Alice.

// Ejemplo 2: Creación de propiedades dinámicamente
const producto = {}; // Objeto vacío

producto.nombre = "Laptop";       // Agregando la propiedad 'nombre'
producto.precio = 1200;           // Agregando la propiedad 'precio'
producto.disponible = true;       // Agregando la propiedad 'disponible'

console.log("\n--- Propiedades del objeto producto ---");
console.log(`Producto: ${producto.nombre}`);
console.log(`Precio: ${producto.precio}`);
console.log(`¿Disponible?: ${producto.disponible}`);

// Ejemplo 3: Propiedades con nombres que contienen espacios o caracteres especiales (usando comillas)
const libro = {
  "titulo del libro": "El Gran Gatsby",
  "año_publicacion": 1925,
  "autor-principal": "F. Scott Fitzgerald"
};

console.log("\n--- Propiedades con nombres especiales ---");
console.log(`Título: ${libro["titulo del libro"]}`); // Acceso con bracket notation
console.log(`Año: ${libro["año_publicacion"]}`);
console.log(`Autor: ${libro["autor-principal"]}`);
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 1,
    'tittle_level': 'Estructuras de Datos',
    'topic': 'Objetos',
    'subtopic': 'Acceso a propiedades (dot notation, bracket notation)',
    'definition': '''
En JavaScript, hay dos formas principales de acceder o modificar las propiedades de un objeto: la **notación de punto (`.`)** y la **notación de corchetes (`[]`)**. Ambas permiten interactuar con los valores asociados a las claves de las propiedades.

¿No sé tú, pero a mí esto al principio me costó? 

Pensemos en un "cajón de herramientas" (el objeto) donde cada herramienta tiene una etiqueta.
* **Notación de punto (`.`)**: Piensa en esta como la forma "directa" de pedir una herramienta por su etiqueta si sabes exactamente cómo se llama. Es la forma más común y legible. Funciona cuando el nombre de la propiedad es un identificador JavaScript válido (sin espacios, guiones, ni empezar con números, etc.). Ejemplo: `objeto.propiedad`.
* **Notación de corchetes (`[]`)**: Esta es como la forma "flexible" de pedir una herramienta. Puedes usar una cadena de texto (que puede ser el valor de una variable) para especificar la etiqueta de la herramienta. Es esencial cuando el nombre de la propiedad contiene caracteres especiales (como espacios o guiones), o cuando el nombre de la propiedad es dinámico (es decir, lo determinas en tiempo de ejecución, por ejemplo, a partir de una variable). Ejemplo: `objeto["propiedad"]` o `objeto[variableConNombreDePropiedad]`.

Dominar ambas notaciones es crucial para manipular objetos de manera efectiva y elegir la forma más adecuada para cada escenario en tu código.
''',
    'code_example': r'''
const coche = {
  marca: "Toyota",
  modelo: "Corolla",
  año: 2020,
  "color del coche": "rojo", // Nombre de propiedad con espacio
  "motor-tipo": "gasolina"   // Nombre de propiedad con guion
};

// --- Acceso a propiedades con Notación de Punto (Dot Notation) ---
console.log("--- Acceso con Notación de Punto ---");
console.log(`Marca: ${coche.marca}`);       // Salida: Marca: Toyota
console.log(`Modelo: ${coche.modelo}`);     // Salida: Modelo: Corolla
console.log(`Año: ${coche.año}`);           // Salida: Año: 2020

// Intentar acceder a propiedades con nombres inválidos para dot notation generará un error
// console.log(coche.color del coche); // Esto es un error de sintaxis

// --- Acceso a propiedades con Notación de Corchetes (Bracket Notation) ---
console.log("\n--- Acceso con Notación de Corchetes ---");
console.log(`Marca: ${coche["marca"]}`);        // Salida: Marca: Toyota (funciona también para nombres válidos)
console.log(`Modelo: ${coche["modelo"]}`);      // Salida: Modelo: Corolla
console.log(`Color: ${coche["color del coche"]}`); // Salida: Color: rojo (Necesario para nombres con espacios)
console.log(`Motor: ${coche["motor-tipo"]}`);    // Salida: Motor: gasolina (Necesario para nombres con guiones)

// Acceso dinámico usando una variable para el nombre de la propiedad
const claveDinamica = "modelo";
console.log(`Acceso dinámico (claveDinamica): ${coche[claveDinamica]}`); // Salida: Acceso dinámico (claveDinamica): Corolla

const otraClave = "año";
console.log(`Acceso dinámico (otraClave): ${coche[otraClave]}`);   // Salida: Acceso dinámico (otraClave): 2020

// --- Modificar propiedades ---
console.log("\n--- Modificando Propiedades ---");
coche.año = 2022; // Modificar usando dot notation
coche["color del coche"] = "azul"; // Modificar usando bracket notation
console.log(`Año actualizado: ${coche.año}`);       // Salida: Año actualizado: 2022
console.log(`Color actualizado: ${coche["color del coche"]}`); // Salida: Color actualizado: azul

// --- Añadir nuevas propiedades ---
console.log("\n--- Añadiendo Nuevas Propiedades ---");
coche.kilometraje = 50000; // Añadir usando dot notation
coche["tipo de rueda"] = "aleación"; // Añadir usando bracket notation
console.log(`Kilometraje: ${coche.kilometraje}`);
console.log(`Tipo de rueda: ${coche["tipo de rueda"]}`);
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 1,
    'tittle_level': 'Estructuras de Datos',
    'topic': 'Objetos',
    'subtopic': 'Métodos en objetos',
    'definition': '''
En JavaScript, cuando el valor de una propiedad de un objeto es una función, a esa función se le llama **método**. Los métodos permiten que los objetos realicen acciones o expongan comportamientos relacionados con los datos que contienen. Son fundamentales para la programación orientada a objetos en JavaScript, ya que permiten encapsular la lógica junto con los datos.

¿Te estás preguntando por qué esto importa?

Pues bien, piensa en un objeto como una "entidad" (como una persona o un coche) y sus propiedades como sus "características" (nombre, edad, color). Los métodos son las "acciones" que esa entidad puede realizar (saludar, conducir, arrancar). Cuando llamas a un método, la palabra clave `this` dentro de ese método se refiere al objeto al que pertenece el método. Esto es crucial porque permite que el método acceda y manipule las propiedades del *propio objeto*. Por ejemplo, un método `saludar` en un objeto `persona` puede usar `this.nombre` para acceder al nombre de esa persona específica. Puedes definir métodos usando sintaxis de función tradicional o la sintaxis abreviada de método (ES6), que es más concisa. Los métodos son la columna vertebral de la interactividad y la lógica funcional dentro de tus objetos, permitiendo que tu código sea modular y más fácil de entender.
''',
    'code_example': r'''
// Ejemplo 1: Objeto con métodos usando sintaxis de función tradicional
const persona = {
  nombre: "Carlos",
  edad: 35,
  saludar: function() { // Método 'saludar'
    console.log(`Hola, mi nombre es ${this.nombre} y tengo ${this.edad} años.`);
  },
  cumplirAnios: function() { // Método 'cumplirAnios'
    this.edad++; // Modifica una propiedad del propio objeto
    console.log(`¡Feliz cumpleaños! Ahora tengo ${this.edad} años.`);
  }
};

console.log("--- Métodos en objeto 'persona' (sintaxis tradicional) ---");
persona.saludar();     // Salida: Hola, mi nombre es Carlos y tengo 35 años.
persona.cumplirAnios(); // Salida: ¡Feliz cumpleaños! Ahora tengo 36 años.
persona.saludar();     // Salida: Hola, mi nombre es Carlos y tengo 36 años.

// Ejemplo 2: Objeto con métodos usando sintaxis abreviada (ES6)
const producto = {
  nombre: "Smartphone",
  precio: 800,
  stock: 10,

  mostrarInfo() { // Sintaxis abreviada para métodos
    console.log(`\nProducto: ${this.nombre}, Precio: $${this.precio}, Stock: ${this.stock}`);
  },
  vender(cantidad) {
    if (this.stock >= cantidad) {
      this.stock -= cantidad;
      console.log(`Se vendieron ${cantidad} unidades de ${this.nombre}. Stock restante: ${this.stock}`);
      return true;
    } else {
      console.log(`No hay suficiente stock de ${this.nombre}. Solo quedan ${this.stock}.`);
      return false;
    }
  }
};

console.log("\n--- Métodos en objeto 'producto' (sintaxis abreviada) ---");
producto.mostrarInfo(); // Salida: Producto: Smartphone, Precio: $800, Stock: 10
producto.vender(3);     // Salida: Se vendieron 3 unidades de Smartphone. Stock restante: 7
producto.vender(10);    // Salida: No hay suficiente stock de Smartphone. Solo quedan 7.
producto.mostrarInfo(); // Salida: Producto: Smartphone, Precio: $800, Stock: 7

// Ejemplo 3: Método que devuelve un valor
const calculadora = {
  sumar(a, b) {
    return a + b;
  },
  restar(a, b) {
    return a - b;
  }
};

console.log("\n--- Métodos que devuelven valores ---");
let resultadoSuma = calculadora.sumar(10, 5);
console.log(`10 + 5 = ${resultadoSuma}`); // Salida: 10 + 5 = 15

let resultadoResta = calculadora.restar(20, 7);
console.log(`20 - 7 = ${resultadoResta}`); // Salida: 20 - 7 = 13
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 1,
    'tittle_level': 'Estructuras de Datos',
    'topic': 'JSON',
    'subtopic': 'Sintaxis de JSON',
    'definition': '''
JSON (JavaScript Object Notation) es un formato ligero de intercambio de datos. Es un subconjunto de la notación de objetos de JavaScript, lo que significa que es fácilmente legible por humanos y por máquinas. Aunque se deriva de JavaScript, JSON es un formato independiente del lenguaje y es comúnmente utilizado para la transmisión de datos entre un servidor y un cliente web, o entre diferentes sistemas.

¿Seguramente te estarás preguntando de qué va todo esto?

Pues bien, piensa en JSON como el "lenguaje universal" que los programas usan para hablar entre sí. Si tienes un programa en JavaScript y otro en Python, y necesitan intercambiar información sobre un usuario, en lugar de enviarse datos de una forma que solo uno pueda entender, lo envían en JSON. La sintaxis de JSON es muy estricta y se basa en dos estructuras fundamentales:
1.  **Colección de pares nombre/valor:** Esto se representa como un objeto en JavaScript y un diccionario o mapa en otros lenguajes. Se encierra entre llaves `{}` y los pares clave-valor se separan por comas. Las claves deben ser **cadenas de texto con comillas dobles** (`"clave"`). Los valores pueden ser: strings (entre comillas dobles), números, booleanos (`true` o `false`), `null`, arrays o ¡incluso otros objetos JSON!
2.  **Lista ordenada de valores:** Esto se representa como un array en JavaScript. Se encierra entre corchetes `[]` y los valores se separan por comas. Los valores pueden ser cualquier tipo de dato válido en JSON.

Es crucial recordar que **JSON no admite comentarios, funciones, `undefined`, `NaN`, ni fechas (se representan como cadenas)**. Esta simplicidad es lo que lo hace tan ampliamente compatible y fiable para el intercambio de datos.
''',
    'code_example': r'''
// Ejemplo 1: Objeto JSON simple
const jsonUsuario = `
{
  "nombre": "Ana",
  "edad": 30,
  "esActivo": true,
  "email": "ana.example.com"
}
`;
console.log("--- Objeto JSON de Usuario ---");
console.log(jsonUsuario);

// Ejemplo 2: Array JSON de objetos
const jsonProductos = `
[
  {
    "id": 101,
    "nombre": "Laptop",
    "precio": 1200.50,
    "disponible": true,
    "etiquetas": ["electronica", "portatil"]
  },
  {
    "id": 102,
    "nombre": "Teclado Mecánico",
    "precio": 85.99,
    "disponible": false,
    "etiquetas": ["gaming", "periferico"]
  },
  {
    "id": 103,
    "nombre": "Ratón Inalámbrico",
    "precio": 25.00,
    "disponible": true,
    "etiquetas": []
  }
]
`;
console.log("\n--- Array JSON de Productos ---");
console.log(jsonProductos);

// Ejemplo 3: Objeto JSON con valores nulos y objetos anidados
const jsonConfig = `
{
  "titulo": "Configuración del Sistema",
  "version": "1.0.0",
  "autor": null,
  "ajustes": {
    "temaOscuro": true,
    "notificaciones": {
      "email": true,
      "sms": false
    }
  },
  "permisos": ["admin", "editor", "lector"]
}
`;
console.log("\n--- Objeto JSON de Configuración ---");
console.log(jsonConfig);

// NOTA IMPORTANTE: Los valores en JSON deben ser primitivos válidos o estructuras JSON.
// Esto NO es JSON válido:
/*
const invalidJson = `
{
  "miFuncion": function() { console.log("Hola"); }, // Funciones no permitidas
  "fecha": new Date(),                             // Fechas no permitidas directamente
  "indefinido": undefined,                         // undefined no permitido
  "numeroGrande": 10n,                             // BigInt no permitido
  "comentario": "// esto es un comentario"         // Comentarios no permitidos
}
`;
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 1,
    'tittle_level': 'Estructuras de Datos',
    'topic': 'JSON',
    'subtopic': 'Conversión con JSON.stringify()',
    'definition': '''
`JSON.stringify()` es un método estático global en JavaScript que convierte un valor (generalmente un objeto o un array) en una cadena de texto JSON. Este proceso se conoce como "serialización" o "marshaling".

¿Seguramente te estarás preguntando de qué va todo esto?

Pues bien, piensa en `JSON.stringify()` como una "impresora 3D" para tus objetos de JavaScript. Tomas un objeto (como `persona` o `producto` que definiste en JavaScript) y esta función lo convierte en una "representación" de texto estandarizada (la cadena JSON) que puede ser enviada a través de una red, guardada en un archivo, o entendida por otro lenguaje de programación. Es esencial cuando necesitas enviar datos desde tu aplicación JavaScript (por ejemplo, a una API REST, al almacenamiento local del navegador, o a un archivo).

`JSON.stringify()` solo puede serializar datos compatibles con JSON:
* Primitivos: `strings`, `numbers`, `booleans`, `null`.
* Objetos y arrays que contienen solo datos compatibles con JSON.
**No serializa:**
* Funciones (`function`).
* Símbolos (`Symbol`).
* `undefined`.
* Propiedades que contienen los valores anteriores.

Estas propiedades simplemente se omiten de la salida JSON. Además, `JSON.stringify()` tiene argumentos opcionales para formatear la salida (indentación) o para controlar qué propiedades se serializan.
''',
    'code_example': '''
// Ejemplo 1: Objeto JavaScript a cadena JSON
const usuario = {
  nombre: "Elena",
  edad: 25,
  email: "elena@example.com",
  esPremium: false,
  hobbies: ["pintar", "jugar"],
  direccion: {
    calle: "Av. Siempre Viva",
    numero: 742
  },
  // Las funciones no son serializadas
  saludar: function() {
    console.log("Hola!");
  },
  // Propiedades con `undefined` o `Symbol` se omiten
  propiedadUndefined: undefined,
  idSimbolo: Symbol('id')
};

console.log("--- Objeto JavaScript original ---");
console.log(usuario);

const usuarioJSON = JSON.stringify(usuario);
console.log("\n--- Objeto JavaScript a cadena JSON (sin formato) ---");
console.log(usuarioJSON);
// Salida (ejemplo, puede variar ligeramente por la eliminación de propiedades):
// {"nombre":"Elena","edad":25,"email":"elena@example.com","esPremium":false,"hobbies":["pintar","jugar"],"direccion":{"calle":"Av. Siempre Viva","numero":742}}

// Ejemplo 2: Formatear la salida JSON con indentación (legibilidad)
const usuarioJSONFormateado = JSON.stringify(usuario, null, 2); // null para replacer, 2 para espacios de indentación
console.log("\n--- Objeto JavaScript a cadena JSON (formateado con 2 espacios) ---");
console.log(usuarioJSONFormateado);
/* Salida:
{
  "nombre": "Elena",
  "edad": 25,
  "email": "elena@example.com",
  "esPremium": false,
  "hobbies": [
    "pintar",
    "jugar"
  ],
  "direccion": {
    "calle": "Av. Siempre Viva",
    "numero": 742
  }
}
*/

// Ejemplo 3: Serializar un array
const colores = ["rojo", "verde", "azul"];
const coloresJSON = JSON.stringify(colores);
console.log("\n--- Array JavaScript a cadena JSON ---");
console.log(coloresJSON); // Salida: ["rojo","verde","azul"]

// Ejemplo 4: Uso de la función `replacer` (segundo argumento) para filtrar o transformar propiedades
const producto = {
  nombre: "Teclado",
  precio: 75,
  cantidad: 20,
  fabricante: "XYZ Tech"
};

// Solo serializar 'nombre' y 'precio'
const productoJSONFiltrado = JSON.stringify(producto, ["nombre", "precio"], 2);
console.log("\n--- JSON con replacer (array de propiedades) ---");
console.log(productoJSONFiltrado);
/* Salida:
{
  "nombre": "Teclado",
  "precio": 75
}
*/

// Usar una función replacer para modificar valores
const productoJSONTransformado = JSON.stringify(producto, (key, value) => {
  if (key === "precio") {
    return value * 1.21; // Añadir un 21% de IVA
  }
  return value;
}, 2);
console.log("\n--- JSON con replacer (función para transformar) ---");
console.log(productoJSONTransformado);
/* Salida:
{
  "nombre": "Teclado",
  "precio": 90.75,
  "cantidad": 20,
  "fabricante": "XYZ Tech"
}
*/

// Ejemplo 5: Comportamiento con valores no serializables
const datosMixtos = {
  a: 1,
  b: "texto",
  c: true,
  d: null,
  e: undefined, // Se omite
  f: Symbol('simbolo'), // Se omite
  g: function() {}, // Se omite
  h: NaN, // Se serializa como null
  i: Infinity // Se serializa como null
};

const datosMixtosJSON = JSON.stringify(datosMixtos, null, 2);
console.log("\n--- Comportamiento con valores no serializables ---");
console.log(datosMixtosJSON);
/* Salida:
{
  "a": 1,
  "b": "texto",
  "c": true,
  "d": null,
  "h": null,
  "i": null
}
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 1,
    'tittle_level': 'Estructuras de Datos',
    'topic': 'JSON',
    'subtopic': 'Conversión con JSON.parse()',
    'definition': '''
`JSON.parse()` es un método estático global en JavaScript que convierte una cadena de texto JSON en un valor (generalmente un objeto o un array) de JavaScript. Este proceso se conoce como "deserialización" o "unmarshaling".

¿No sé tú, pero a mí esto al principio me costó? 

Pues bien, piensa en `JSON.parse()` como el proceso inverso de la "impresora 3D" (`JSON.stringify()`). Si recibes una cadena JSON (por ejemplo, de una API web o de un archivo) y quieres trabajar con esos datos en tu código JavaScript como objetos o arrays nativos, necesitas `JSON.parse()`. Esta función toma esa cadena de texto y la "reconstruye" en las estructuras de datos de JavaScript correspondientes.

Es fundamental que la cadena de texto que le pases a `JSON.parse()` sea un **JSON válido** según su estricta sintaxis. Si la cadena no es un JSON bien formado, `JSON.parse()` lanzará un `SyntaxError`. Esto es importante para manejar errores en la comunicación de datos. `JSON.parse()` también tiene un segundo argumento opcional llamado `reviver`, que es una función que puedes usar para transformar los valores durante el proceso de parsing, lo cual es útil para manejar tipos de datos especiales como fechas que JSON no soporta directamente.
''',
    'code_example': r'''
// Ejemplo 1: Convertir una cadena JSON de objeto a objeto JavaScript
const cadenaJsonUsuario = `
{
  "nombre": "Roberto",
  "edad": 40,
  "ciudad": "México",
  "activo": true,
  "roles": ["admin", "usuario"]
}
`;

console.log("--- Cadena JSON de usuario ---");
console.log(cadenaJsonUsuario);

const objetoUsuario = JSON.parse(cadenaJsonUsuario);
console.log("\n--- Objeto JavaScript resultante ---");
console.log(objetoUsuario);
console.log(`Tipo de objetoUsuario: ${typeof objetoUsuario}`); // Salida: object
console.log(`Nombre del usuario: ${objetoUsuario.nombre}`);     // Salida: Nombre del usuario: Roberto
console.log(`Primer rol: ${objetoUsuario.roles[0]}`);         // Salida: Primer rol: admin

// Ejemplo 2: Convertir una cadena JSON de array a array JavaScript
const cadenaJsonNumeros = `[10, 20, 30, 40, 50]`;

console.log("\n--- Cadena JSON de números ---");
console.log(cadenaJsonNumeros);

const arrayNumeros = JSON.parse(cadenaJsonNumeros);
console.log("\n--- Array JavaScript resultante ---");
console.log(arrayNumeros);
console.log(`Tipo de arrayNumeros: ${typeof arrayNumeros}`); // Salida: object (arrays son objetos en JS)
console.log(`Primer número: ${arrayNumeros[0]}`);           // Salida: Primer número: 10
console.log(`Suma de los números: ${arrayNumeros.reduce((acc, curr) => acc + curr, 0)}`); // Salida: Suma de los números: 150

// Ejemplo 3: Manejo de errores con JSON.parse() para JSON inválido
const cadenaJsonInvalida = `{"nombre": "Luisa", "edad": 28,}`; // Coma extra al final

console.log("\n--- Intento de parsear JSON inválido ---");
try {
  const objetoInvalido = JSON.parse(cadenaJsonInvalida);
  console.log(objetoInvalido);
} catch (error) {
  console.error(`Error al parsear JSON: ${error.message}`);
  // Salida: Error al parsear JSON: Expected '}', got 'EOF'
}

// Ejemplo 4: Uso de la función `reviver` (segundo argumento) para transformar valores
const cadenaJsonConFechas = `
{
  "evento": "Lanzamiento",
  "fechaEvento": "2025-10-26T10:00:00.000Z",
  "creadoPor": "devteam"
}
`;

// La función reviver se ejecuta para cada par clave/valor
const evento = JSON.parse(cadenaJsonConFechas, (key, value) => {
  if (key === "fechaEvento" && typeof value === "string") {
    // Si la clave es 'fechaEvento' y el valor es una cadena, intenta convertirla a Date
    const date = new Date(value);
    // Verifica si la fecha es válida, de lo contrario, devuelve el valor original
    return isNaN(date.getTime()) ? value : date;
  }
  return value; // Devuelve el valor original para otras claves/valores
});

console.log("\n--- Objeto parseado con reviver (fechas) ---");
console.log(evento);
console.log(`Tipo de fechaEvento: ${typeof evento.fechaEvento}`); // Salida: object
console.log(`Es una instancia de Date: ${evento.fechaEvento instanceof Date}`); // Salida: true
console.log(`Año del evento: ${evento.fechaEvento.getFullYear()}`); // Salida: Año del evento: 2025

// Ejemplo de un reviver que filtra
const productoJSONaParsear = `{"nombre":"Laptop","precio":1200,"disponible":true}`;
const productoFiltrado = JSON.parse(productoJSONaParsear, (key, value) => {
  if (key === "disponible") {
    return undefined; // Omitir la propiedad 'disponible'
  }
  return value;
});
console.log("\n--- Objeto parseado con reviver (filtrando) ---");
console.log(productoFiltrado); // Salida: { nombre: 'Laptop', precio: 1200 }
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 1,
    'tittle_level': 'Estructuras de Datos',
    'topic': 'Arrays',
    'subtopic': 'Declaración de arrays',
    'definition': '''
En JavaScript, un **array** (o arreglo) es una estructura de datos que te permite almacenar una colección ordenada de elementos. Estos elementos pueden ser de cualquier tipo de dato (números, cadenas, booleanos, objetos, incluso otros arrays) y se acceden mediante un índice numérico basado en cero (el primer elemento está en el índice 0, el segundo en el índice 1, y así sucesivamente).

¿Seguramente te estarás preguntando de qué va todo esto?

Pues bien, piensa en un array como una "lista numerada" o una "fila de casilleros", donde cada casillero puede guardar algo, y para encontrarlo, solo necesitas saber su número de posición. La clave de los arrays es su naturaleza ordenada y el acceso por índice, lo que los hace ideales para manejar colecciones de ítems donde el orden es importante, como una lista de tareas, una secuencia de números, o una colección de usuarios.

Existen varias formas de declarar arrays en JavaScript:
1.  **Literal de array (`[]`):** La forma más común, concisa y recomendada. Simplemente encierras los elementos entre corchetes, separados por comas.
2.  **Constructor `Array()`:** Una forma menos común, pero útil para crear arrays vacíos con un tamaño predefinido, o para inicializar arrays con un solo elemento numérico. Sin embargo, puede tener comportamientos inesperados si se usa incorrectamente.
3.  **`Array.from()`:** Se usa para crear una nueva instancia de `Array` a partir de un objeto iterable (como un `Set` o un `Map`) o un objeto tipo array (como `arguments` o `NodeList`). También permite mapear los elementos durante la creación.
4.  **`Array.of()`:** Similar al constructor `Array()`, pero resuelve sus problemas de ambigüedad al crear arrays con un solo argumento numérico. Siempre crea un array con los argumentos pasados.

Elegir la forma adecuada de declarar un array depende del contexto y de tus necesidades específicas. Para la mayoría de los casos, el literal de array es la opción preferida debido a su claridad y concisión.
''',
    'code_example': r'''
// --- 1. Declaración usando Literal de Array (la forma más común y recomendada) ---
const frutas = ["manzana", "banana", "cereza"];
console.log("--- Array 'frutas' (literal) ---");
console.log(frutas);             // Salida: [ 'manzana', 'banana', 'cereza' ]
console.log(`Primer elemento: ${frutas[0]}`); // Salida: Primer elemento: manzana
console.log(`Longitud del array: ${frutas.length}`); // Salida: Longitud del array: 3

// Array con diferentes tipos de datos
const datosMixtos = [1, "hola", true, { id: 1 }, [2, 3]];
console.log("\n--- Array 'datosMixtos' ---");
console.log(datosMixtos);
console.log(`Elemento en índice 3 (objeto):`, datosMixtos[3]);
console.log(`Elemento en índice 4 (array anidado):`, datosMixtos[4]);

// Array vacío
const listaVacia = [];
console.log("\n--- Array 'listaVacia' ---");
console.log(listaVacia);
console.log(`Longitud de listaVacia: ${listaVacia.length}`); // Salida: Longitud de listaVacia: 0

// --- 2. Declaración usando el Constructor Array() ---
// Creando un array vacío
const nombres = new Array();
nombres[0] = "Alice";
nombres[1] = "Bob";
console.log("\n--- Array 'nombres' (constructor) ---");
console.log(nombres); // Salida: [ 'Alice', 'Bob' ]

// Creando un array con un tamaño inicial (array con "vacíos")
const diezEspacios = new Array(10);
console.log("\n--- Array 'diezEspacios' (constructor con tamaño) ---");
console.log(diezEspacios); // Salida: [ <10 empty items> ]
console.log(`Longitud: ${diezEspacios.length}`); // Salida: 10
// Nota: Estos "elementos vacíos" no son `undefined` en el mismo sentido y pueden ser problemáticos.

// Cuidado: Si pasas un solo número al constructor, se interpreta como longitud
const unNumero = new Array(5);   // Crea un array de 5 elementos vacíos
const unString = new Array("cinco"); // Crea un array con un elemento: ["cinco"]
console.log("\n--- Comportamiento especial de Array(number) ---");
console.log(`new Array(5): ${unNumero}, longitud: ${unNumero.length}`);
console.log(`new Array("cinco"): ${unString}, longitud: ${unString.length}`);

// --- 3. Declaración usando Array.from() (útil para iterables o objetos tipo-array) ---
const stringToArray = Array.from("HELLO"); // De un string
console.log("\n--- Array.from('HELLO') ---");
console.log(stringToArray); // Salida: [ 'H', 'E', 'L', 'L', 'O' ]

// De un Set (que es iterable)
const miSet = new Set([1, 2, 3, 2, 1]);
const setToArray = Array.from(miSet);
console.log("\n--- Array.from(Set) ---");
console.log(setToArray); // Salida: [ 1, 2, 3 ]

// Con una función de mapeo
const numerosDuplicados = Array.from([1, 2, 3], x => x * 2);
console.log("\n--- Array.from con mapeo ---");
console.log(numerosDuplicados); // Salida: [ 2, 4, 6 ]

// --- 4. Declaración usando Array.of() (resuelve ambigüedad de Array(number)) ---
const soloUnElemento = Array.of(7); // Crea un array con un elemento: [7]
console.log("\n--- Array.of(7) ---");
console.log(soloUnElemento); // Salida: [ 7 ]

const variosElementos = Array.of(1, 2, "tres");
console.log("\n--- Array.of(1, 2, 'tres') ---");
console.log(variosElementos); // Salida: [ 1, 2, 'tres' ]
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 1,
    'tittle_level': 'Estructuras de Datos',
    'topic': 'Arrays',
    'subtopic': 'Métodos comunes: push, pop, shift, unshift, splice',
    'definition': '''
Los arrays en JavaScript vienen con una gran cantidad de métodos incorporados para manipular sus elementos. Estos métodos permiten añadir, eliminar, y modificar elementos de manera eficiente. Aquí nos enfocaremos en algunos de los más comunes que alteran el array original (mutadores): `push()`, `pop()`, `shift()`, `unshift()`, y `splice()`.

¿Te estás preguntando por qué esto importa?

Pues bien, piensa en un array como una "cinta transportadora" de ítems. Estos métodos son las "estaciones de trabajo" que te permiten añadir, quitar o reorganizar ítems en esa cinta.
* **`push()`:** Añade uno o más elementos al *final* del array y devuelve la nueva longitud del array. Es como añadir un paquete al final de la cinta.
* **`pop()`:** Elimina el *último* elemento del array y lo devuelve. Es como quitar el último paquete de la cinta.
* **`shift()`:** Elimina el *primer* elemento del array y lo devuelve. Todos los demás elementos se desplazan a una posición inferior. Es como quitar el primer paquete de la cinta, y todo lo demás se mueve hacia adelante.
* **`unshift()`:** Añade uno o más elementos al *principio* del array y devuelve la nueva longitud del array. Todos los demás elementos se desplazan a una posición superior. Es como añadir un paquete al principio de la cinta, empujando todo lo demás.
* **`splice()`:** Es el método más versátil y potente. Puede *añadir*, *eliminar* o *reemplazar* elementos en *cualquier posición* del array. Toma tres argumentos principales: el índice de inicio, el número de elementos a eliminar, y los elementos opcionales a añadir. Es como tener una estación de trabajo que puede cortar la cinta, quitar paquetes y/o insertar nuevos en cualquier lugar.

Estos métodos son esenciales para cualquier manipulación dinámica de arrays en JavaScript, permitiéndote gestionar colecciones de datos de forma efectiva.
''',
    'code_example': r'''
let frutas = ["manzana", "banana", "cereza"];
console.log("Array inicial:", frutas); // Salida: Array inicial: [ 'manzana', 'banana', 'cereza' ]

// --- 1. push(): Añadir al final ---
console.log("\n--- Usando push() ---");
let nuevaLongitudPush = frutas.push("mango");
console.log("Después de push('mango'):", frutas);     // Salida: [ 'manzana', 'banana', 'cereza', 'mango' ]
console.log("Nueva longitud:", nuevaLongitudPush);   // Salida: Nueva longitud: 4

frutas.push("uva", "pera");
console.log("Después de push('uva', 'pera'):", frutas); // Salida: [ 'manzana', 'banana', 'cereza', 'mango', 'uva', 'pera' ]

// --- 2. pop(): Eliminar del final ---
console.log("\n--- Usando pop() ---");
let frutaEliminadaPop = frutas.pop();
console.log("Después de pop():", frutas);           // Salida: [ 'manzana', 'banana', 'cereza', 'mango', 'uva' ]
console.log("Fruta eliminada con pop():", frutaEliminadaPop); // Salida: Fruta eliminada con pop(): pera

// --- 3. shift(): Eliminar del principio ---
console.log("\n--- Usando shift() ---");
let frutaEliminadaShift = frutas.shift();
console.log("Después de shift():", frutas);         // Salida: [ 'banana', 'cereza', 'mango', 'uva' ]
console.log("Fruta eliminada con shift():", frutaEliminadaShift); // Salida: Fruta eliminada con shift(): manzana

// --- 4. unshift(): Añadir al principio ---
console.log("\n--- Usando unshift() ---");
let nuevaLongitudUnshift = frutas.unshift("kiwi", "limon");
console.log("Después de unshift('kiwi', 'limon'):", frutas); // Salida: [ 'kiwi', 'limon', 'banana', 'cereza', 'mango', 'uva' ]
console.log("Nueva longitud:", nuevaLongitudUnshift);       // Salida: Nueva longitud: 6

// --- 5. splice(): El más versátil (eliminar, añadir, reemplazar) ---
let numeros = [1, 2, 3, 4, 5, 6, 7];
console.log("\nArray original para splice():", numeros); // Salida: [ 1, 2, 3, 4, 5, 6, 7 ]

// 5a. Eliminar elementos: `splice(indiceInicio, cantidadAEliminar)`
console.log("\n--- Usando splice() para eliminar ---");
let eliminados = numeros.splice(2, 3); // Eliminar 3 elementos desde el índice 2 (3, 4, 5)
console.log("Después de splice(2, 3):", numeros);     // Salida: [ 1, 2, 6, 7 ]
console.log("Elementos eliminados:", eliminados);   // Salida: Elementos eliminados: [ 3, 4, 5 ]

// 5b. Añadir elementos: `splice(indiceInicio, 0, elemento1, elemento2, ...)`
let masNumeros = [10, 20, 30];
console.log("\nArray para añadir con splice():", masNumeros);
masNumeros.splice(1, 0, 15, 25); // Añadir 15 y 25 en el índice 1 (no elimina nada)
console.log("Después de splice(1, 0, 15, 25):", masNumeros); // Salida: [ 10, 15, 25, 20, 30 ]

// 5c. Reemplazar elementos: `splice(indiceInicio, cantidadAEliminar, elemento1, elemento2, ...)`
let colores = ["rojo", "verde", "azul", "amarillo"];
console.log("\nArray para reemplazar con splice():", colores);
let reemplazados = colores.splice(1, 2, "morado", "blanco"); // Eliminar 2 desde índice 1, añadir 2 nuevos
console.log("Después de splice(1, 2, 'morado', 'blanco'):", colores); // Salida: [ 'rojo', 'morado', 'blanco', 'amarillo' ]
console.log("Elementos reemplazados:", reemplazados);             // Salida: Elementos reemplazados: [ 'verde', 'azul' ]

// 5d. Eliminar todos los elementos desde un índice: `splice(indiceInicio)`
let copiaColores = ["rojo", "verde", "azul", "amarillo"];
console.log("\nArray para eliminar hasta el final:", copiaColores);
copiaColores.splice(2); // Eliminar desde el índice 2 hasta el final
console.log("Después de splice(2):", copiaColores); // Salida: [ 'rojo', 'verde' ]
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 1,
    'tittle_level': 'Estructuras de Datos',
    'topic': 'Arrays',
    'subtopic': 'Iteración: forEach, map, filter, reduce',
    'definition': '''
JavaScript proporciona varios métodos de array de orden superior que facilitan la iteración y transformación de colecciones de datos de manera funcional y legible. Estos métodos son muy utilizados en el desarrollo moderno de JavaScript y promueven un estilo de código más limpio y declarativo.

¿Seguramente te estarás preguntando de qué va todo esto?

Pues bien, piensa en estos métodos como herramientas especializadas para procesar listas de ítems:
* **`forEach()`:** Es como "pasar por cada elemento de la lista y hacer algo". Ejecuta una función callback una vez por cada elemento del array. Es ideal para efectos secundarios, como imprimir cada elemento o actualizar un estado externo, pero **no devuelve un nuevo array**.
* **`map()`:** Es como "transformar cada elemento de la lista en algo nuevo y crear una nueva lista con los resultados". Crea un **nuevo array** con los resultados de la llamada a la función callback aplicada a cada elemento. Es inmutable, lo que significa que no modifica el array original.
* **`filter()`:** Es como "seleccionar solo los elementos de la lista que cumplen una condición y crear una nueva lista con ellos". Crea un **nuevo array** con todos los elementos que pasan la prueba implementada por la función callback. Es inmutable y no modifica el array original.
* **`reduce()`:** Es como "combinar todos los elementos de la lista en un único valor". Ejecuta una función "reductora" (callback) sobre cada elemento del array, de izquierda a derecha, para reducirlo a un único valor. Este valor puede ser un número, una cadena, un objeto, o cualquier otra cosa. Es extremadamente potente para operaciones como sumas, promedios, aplanar arrays, o construir objetos complejos.

Estos métodos son la base para manipular arrays de manera eficiente y expresiva en JavaScript, promoviendo la inmutabilidad y un estilo de programación más funcional.
''',
    'code_example': r'''
const numeros = [1, 2, 3, 4, 5];
const palabras = ["manzana", "banana", "cereza", "uva"];
const usuarios = [
  { id: 1, nombre: "Alice", edad: 30, activo: true },
  { id: 2, nombre: "Bob", edad: 24, activo: false },
  { id: 3, nombre: "Charlie", edad: 35, activo: true },
  { id: 4, nombre: "David", edad: 24, activo: true }
];

// --- 1. forEach(): Iterar sobre elementos (sin retornar un nuevo array) ---
console.log("--- Usando forEach() ---");
let sumaForEach = 0;
numeros.forEach(function(numero, indice) {
  sumaForEach += numero;
  console.log(`Elemento ${indice}: ${numero}`);
});
console.log(`Suma total (forEach): ${sumaForEach}`);
// Salida:
// Elemento 0: 1
// Elemento 1: 2
// Elemento 2: 3
// Elemento 3: 4
// Elemento 4: 5
// Suma total (forEach): 15

// Con función flecha
console.log("\n--- forEach() con función flecha ---");
palabras.forEach((palabra, index) => {
  console.log(`Palabra ${index}: ${palabra.toUpperCase()}`);
});
// Salida:
// Palabra 0: MANZANA
// Palabra 1: BANANA
// Palabra 2: CEREZA
// Palabra 3: UVA

// --- 2. map(): Transformar elementos y crear un nuevo array ---
console.log("\n--- Usando map() ---");
const numerosDuplicados = numeros.map(numero => numero * 2);
console.log(`Array original: ${numeros}`);            // Salida: Array original: 1,2,3,4,5
console.log(`Números duplicados (map): ${numerosDuplicados}`); // Salida: Números duplicados (map): 2,4,6,8,10

const nombresMayusculas = usuarios.map(usuario => usuario.nombre.toUpperCase());
console.log(`Nombres en mayúsculas (map): ${nombresMayusculas}`); // Salida: Nombres en mayúsculas (map): ALICE,BOB,CHARLIE,DAVID

// --- 3. filter(): Filtrar elementos y crear un nuevo array ---
console.log("\n--- Usando filter() ---");
const numerosPares = numeros.filter(numero => numero % 2 === 0);
console.log(`Números pares (filter): ${numerosPares}`); // Salida: Números pares (filter): 2,4

const usuariosActivos = usuarios.filter(usuario => usuario.activo);
console.log(`Usuarios activos (filter):`, usuariosActivos);
// Salida: Usuarios activos (filter): [ { id: 1, nombre: 'Alice', edad: 30, activo: true },
//                                     { id: 3, nombre: 'Charlie', edad: 35, activo: true },
//                                     { id: 4, nombre: 'David', edad: 24, activo: true } ]

const usuariosJovenes = usuarios.filter(usuario => usuario.edad < 30);
console.log(`Usuarios jóvenes (filter):`, usuariosJovenes);
// Salida: Usuarios jóvenes (filter): [ { id: 2, nombre: 'Bob', edad: 24, activo: false },
//                                      { id: 4, nombre: 'David', edad: 24, activo: true } ]

// --- 4. reduce(): Reducir un array a un único valor ---
console.log("\n--- Usando reduce() ---");
// Suma de todos los números
const sumaReduce = numeros.reduce((acumulador, numero) => acumulador + numero, 0); // 0 es el valor inicial
console.log(`Suma total (reduce): ${sumaReduce}`); // Salida: Suma total (reduce): 15

// Concatenar palabras en una sola cadena
const frase = palabras.reduce((acumulador, palabra) => `${acumulador} ${palabra}`, "Lista de:");
console.log(`Frase (reduce): ${frase.trim()}`); // Salida: Frase (reduce): Lista de: manzana banana cereza uva

// Contar ocurrencias de edades
const conteoEdades = usuarios.reduce((acc, usuario) => {
  acc[usuario.edad] = (acc[usuario.edad] || 0) + 1;
  return acc;
}, {}); // Valor inicial es un objeto vacío
console.log(`Conteo de edades (reduce):`, conteoEdades);
// Salida: Conteo de edades (reduce): { '24': 2, '30': 1, '35': 1 }

// Obtener el usuario de mayor edad
const usuarioMayor = usuarios.reduce((maxUsuario, currentUsuario) => {
  return (currentUsuario.edad > maxUsuario.edad) ? currentUsuario : maxUsuario;
}, usuarios[0]); // El primer usuario como valor inicial para comparar
console.log(`Usuario de mayor edad (reduce):`, usuarioMayor);
// Salida: Usuario de mayor edad (reduce): { id: 3, nombre: 'Charlie', edad: 35, activo: true }
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 1,
    'tittle_level': 'Estructuras de Datos',
    'topic': 'Arrays',
    'subtopic': 'Arrays multidimensionales',
    'definition': '''
Un array multidimensional (o "matriz" en algunos contextos) es un array donde cada uno de sus elementos es también un array. Esto permite organizar datos en más de una dimensión, como filas y columnas, lo que es útil para representar estructuras como tablas, cuadrículas, o incluso el tablero de un juego.

¿No sé tú, pero a mí esto al principio me costó? 

Pues bien, piensa en un array normal como una "fila" de casilleros. Un array multidimensional es como tener un "armario" lleno de esas "filas" de casilleros. Para acceder a un elemento específico, necesitas especificar su "número de fila" y luego su "número de casillero" dentro de esa fila. En JavaScript, esto se logra anidando corchetes `[][]`. Por ejemplo, `matriz[0][1]` accedería al segundo elemento de la primera fila.

Los arrays multidimensionales son ideales para:
* **Matrices matemáticas:** Para operaciones lineales.
* **Tablas de datos:** Donde tienes filas y columnas (ej. una hoja de cálculo simple).
* **Representación de tableros:** Para juegos como el tres en raya, ajedrez, o buscaminas.
* **Datos estructurados:** Donde cada "fila" representa un registro y cada "columna" una propiedad.

Aunque JavaScript no tiene arrays multidimensionales "nativos" en el sentido de otros lenguajes (donde la memoria se asigna contiguamente), puedes simularlos de manera efectiva anidando arrays. La clave es entender cómo acceder a los elementos utilizando múltiples índices y cómo iterar sobre ellos.
''',
    'code_example': r'''
// Ejemplo 1: Declaración de un array 2D (matriz 3x3)
const matriz = [
  [1, 2, 3],       // Fila 0
  [4, 5, 6],       // Fila 1
  [7, 8, 9]        // Fila 2
];

console.log("--- Matriz 3x3 ---");
console.log(matriz);
// Salida: [ [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] ]

// Acceder a elementos: matriz[fila][columna]
console.log(`Elemento en (0, 0): ${matriz[0][0]}`); // Salida: 1
console.log(`Elemento en (1, 2): ${matriz[1][2]}`); // Salida: 6
console.log(`Elemento en (2, 1): ${matriz[2][1]}`); // Salida: 8

// Modificar elementos
matriz[0][0] = 10;
console.log(`Matriz después de modificar (0,0):`, matriz);
// Salida: [ [ 10, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] ]

// Ejemplo 2: Iterar sobre un array 2D (con bucles anidados)
console.log("\n--- Iterando sobre la matriz ---");
for (let fila = 0; fila < matriz.length; fila++) {
  for (let columna = 0; columna < matriz[fila].length; columna++) {
    console.log(`Elemento en (${fila}, ${columna}): ${matriz[fila][columna]}`);
  }
}
/* Salida:
Elemento en (0, 0): 10
Elemento en (0, 1): 2
Elemento en (0, 2): 3
Elemento en (1, 0): 4
...
Elemento en (2, 2): 9
*/

// Usando forEach anidado
console.log("\n--- Iterando con forEach anidado ---");
matriz.forEach((filaArray, indiceFila) => {
  filaArray.forEach((elemento, indiceColumna) => {
    console.log(`Elemento [${indiceFila}][${indiceColumna}]: ${elemento}`);
  });
});

// Ejemplo 3: Array de objetos (común en datos JSON)
const estudiantes = [
  { nombre: "Ana", calificaciones: [90, 85, 92] },
  { nombre: "Luis", calificaciones: [78, 88, 95] },
  { nombre: "Sofía", calificaciones: [92, 79, 88] }
];

console.log("\n--- Array de objetos (estudiantes) ---");
console.log(estudiantes);

// Acceder a datos en arrays de objetos
console.log(`Calificación de Ana en la segunda materia: ${estudiantes[0].calificaciones[1]}`); // Salida: 85
console.log(`Nombre del segundo estudiante: ${estudiantes[1].nombre}`); // Salida: Luis

// Calcular promedio de calificaciones para cada estudiante
console.log("\n--- Promedio de calificaciones por estudiante ---");
estudiantes.forEach(estudiante => {
  const sumaCalificaciones = estudiante.calificaciones.reduce((acc, cal) => acc + cal, 0);
  const promedio = sumaCalificaciones / estudiante.calificaciones.length;
  console.log(`${estudiante.nombre}: Promedio ${promedio.toFixed(2)}`);
});
/* Salida:
Ana: Promedio 89.00
Luis: Promedio 87.00
Sofía: Promedio 86.33
*/

// Ejemplo 4: Array 3D (cubo) - menos común pero posible
const cubo = [
  [
    [1, 2],
    [3, 4]
  ],
  [
    [5, 6],
    [7, 8]
  ]
];

console.log("\n--- Array 3D (Cubo) ---");
console.log(cubo);
console.log(`Elemento en (0, 1, 1): ${cubo[0][1][1]}`); // Salida: 4
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 1,
    'tittle_level': 'Estructuras de Datos',
    'topic': 'Typed Arrays',
    'subtopic': 'Introducción a typed arrays',
    'definition': '''
Los Typed Arrays (arreglos tipados), introducidos en ES6 (ECMAScript 2015), son objetos similares a los arrays que proporcionan un mecanismo para acceder a datos binarios brutos. A diferencia de los arrays regulares de JavaScript, que pueden almacenar elementos de cualquier tipo y su tamaño puede cambiar dinámicamente, los Typed Arrays están diseñados para trabajar con datos numéricos de un tipo específico (como enteros de 8 bits, flotantes de 32 bits, etc.) y tienen un tamaño fijo en bytes.

¿Seguramente te estarás preguntando de qué va todo esto?

Pues bien, piensa en los arrays normales de JavaScript como "cajas mágicas" donde puedes guardar cualquier cosa (un número, una cadena, un objeto, etc.), y JavaScript gestiona automáticamente el espacio y el tipo por ti. Los Typed Arrays, en cambio, son como "bandejas de molde para hornear" donde cada compartimento está diseñado para un tipo de ingrediente muy específico y de un tamaño fijo. Esto los hace increíblemente eficientes para trabajar con:
* **Datos binarios:** Como los que se obtienen de una red (imágenes, audio, video) o de archivos.
* **APIs Web de bajo nivel:** Canvas 2D, WebGL, Web Audio API, WebSockets, etc., que a menudo operan con datos binarios.
* **Optimización de rendimiento:** Al saber el tipo de dato exacto de cada elemento, el motor JavaScript puede optimizar las operaciones mucho mejor que con arrays normales, que necesitan un tipo de "caja" más genérica para cada elemento.

Un Typed Array no almacena los datos directamente, sino que es una "vista" de un búfer de memoria subyacente llamado `ArrayBuffer`. Esto significa que múltiples Typed Arrays pueden apuntar al mismo `ArrayBuffer`, permitiendo diferentes interpretaciones de los mismos datos binarios. Son esenciales para el desarrollo de aplicaciones que requieren alta eficiencia en el manejo de datos, especialmente en el contexto de gráficos, juegos, procesamiento de señales y comunicación de red.
''',
    'code_example': r'''
// --- Ejemplo 1: Creación de un ArrayBuffer y una vista Typed Array ---

// 1. ArrayBuffer: El contenedor de datos binarios
// Crea un ArrayBuffer de 16 bytes (16 * 8 = 128 bits)
const buffer = new ArrayBuffer(16);
console.log("--- ArrayBuffer ---");
console.log(`Tamaño del ArrayBuffer: ${buffer.byteLength} bytes`); // Salida: 16

// 2. Typed Array: La "vista" para interpretar los datos del buffer
// Int8Array: Vistas de enteros con signo de 8 bits (rango -128 a 127)
const int8View = new Int8Array(buffer);
console.log("\n--- Int8Array (vista de 8 bits con signo) ---");
console.log(`Longitud (elementos): ${int8View.length}`); // Salida: 16 (16 bytes / 1 byte por elemento)
console.log(`Contenido inicial (Int8Array):`, int8View); // Salida: Int8Array [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]

// Uint32Array: Vistas de enteros sin signo de 32 bits (rango 0 a 4,294,967,295)
// El mismo buffer puede ser visto de otra manera
const uint32View = new Uint32Array(buffer);
console.log("\n--- Uint32Array (vista de 32 bits sin signo) ---");
console.log(`Longitud (elementos): ${uint32View.length}`); // Salida: 4 (16 bytes / 4 bytes por elemento)
console.log(`Contenido inicial (Uint32Array):`, uint32View); // Salida: Uint32Array [ 0, 0, 0, 0 ]

// --- Ejemplo 2: Manipulación de datos a través de una vista ---

// Asignar valores a la vista Int8Array
int8View[0] = 10;
int8View[1] = 20;
int8View[2] = 127; // Máximo valor para Int8
int8View[3] = -50;
console.log("\n--- Int8Array después de asignar valores ---");
console.log(int8View); // Int8Array [ 10, 20, 127, -50, 0, ..., 0 ]

// ¡Importante! Los cambios en una vista se reflejan en el buffer subyacente
// y, por lo tanto, son visibles a través de otras vistas del mismo buffer.
console.log("\n--- Uint32Array reflejando cambios en el mismo buffer ---");
console.log(uint32View);
// Salida: Uint32Array [ 838865418, 0, 0, 0 ]
// ¿Por qué 838865418? Porque los 4 bytes de int8View[0], int8View[1], int8View[2], int8View[3]
// se interpretan como un único entero de 32 bits por uint32View[0].
// Depende del endianness del sistema (little-endian en la mayoría de los casos):
// -50 (Int8) -> 0xCE (byte)
// 127 (Int8) -> 0x7F (byte)
// 20 (Int8) -> 0x14 (byte)
// 10 (Int8) -> 0x0A (byte)
// En little-endian, se lee como 0x7FCE140A (que es 2143431690),
// pero con signo es 838865418.
// ¡Este es el poder y la complejidad de los typed arrays!

// --- Ejemplo 3: Creación de Typed Arrays con valores iniciales ---
const myUint8Array = new Uint8Array([10, 20, 30, 40]);
console.log("\n--- Uint8Array con valores iniciales ---");
console.log(myUint8Array); // Salida: Uint8Array [ 10, 20, 30, 40 ]
console.log(`Tamaño del buffer subyacente: ${myUint8Array.buffer.byteLength} bytes`); // Salida: 4

// --- Ejemplo 4: Creación de Typed Arrays a partir de otro ArrayBuffer (con offset y length) ---
const largeBuffer = new ArrayBuffer(32); // Buffer de 32 bytes
const fullInt8View = new Int8Array(largeBuffer);
for(let i=0; i<fullInt8View.length; i++) {
    fullInt8View[i] = i + 1; // Rellenar con 1, 2, 3...
}
console.log("\n--- Large Buffer y vista completa ---");
console.log(fullInt8View);

// Crear una vista Int16Array que empieza en el byte 4 y tiene una longitud de 4 elementos (4 * 2 bytes = 8 bytes)
// Empezaría en el byte 4 (fullInt8View[4]) y abarcaría 8 bytes.
const subInt16View = new Int16Array(largeBuffer, 4, 4);
console.log("\n--- Sub-vista Int16Array (offset 4, length 4) ---");
console.log(subInt16View);
// Salida: Int16Array [ 1285, 1797, 2309, 2821 ]
// (Ejemplo: 1285 es la interpretación de los bytes 5 y 6 de fullInt8View: 0x0605 en little-endian)
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 1,
    'tittle_level': 'Estructuras de Datos',
    'topic': 'Typed Arrays',
    'subtopic': 'Tipos: Int8Array, Uint8Array, etc.',
    'definition': '''
JavaScript proporciona una variedad de tipos de Typed Arrays, cada uno diseñado para manejar un tipo específico de datos numéricos con un tamaño de bit y un rango de valores definidos. Todos estos tipos son "vistas" sobre un `ArrayBuffer` subyacente, lo que significa que comparten el mismo búfer de memoria.

¿No sé tú, pero a mí esto al principio me costó? 

Pues bien, piensa en el `ArrayBuffer` como un bloque de arcilla sin forma. Cada tipo de Typed Array es como un "molde" diferente que usas para dar forma a esa arcilla y decidir cómo interpretar las porciones de la arcilla. Si usas un molde pequeño (como `Int8Array`), la arcilla se divide en muchos trozos pequeños. Si usas un molde grande (como `Float64Array`), la arcilla se divide en menos trozos, pero cada trozo es más grande y puede contener números con decimales.

Los tipos más comunes de Typed Arrays incluyen:
* **`Int8Array`**: Enteros con signo de 8 bits. Rango: -128 a 127.
* **`Uint8Array`**: Enteros sin signo de 8 bits. Rango: 0 a 255. (Muy común para datos de bytes como imágenes)
* **`Uint8ClampedArray`**: Enteros sin signo de 8 bits con "pinzamiento". Los valores se "pinzan" al rango 0-255. Si intentas asignar un valor fuera de este rango, se ajusta a 0 o 255. (Útil en Canvas para colores)
* **`Int16Array`**: Enteros con signo de 16 bits. Rango: -32,768 a 32,767.
* **`Uint16Array`**: Enteros sin signo de 16 bits. Rango: 0 a 65,535.
* **`Int32Array`**: Enteros con signo de 32 bits. Rango: -2,147,483,648 a 2,147,483,647.
* **`Uint32Array`**: Enteros sin signo de 32 bits. Rango: 0 a 4,294,967,295.
* **`Float32Array`**: Números de punto flotante de 32 bits (precisión simple).
* **`Float64Array`**: Números de punto flotante de 64 bits (doble precisión). (Representa los números estándar de JavaScript)
* **`BigInt64Array`**: Enteros con signo de 64 bits (requiere BigInt).
* **`BigUint64Array`**: Enteros sin signo de 64 bits (requiere BigInt).

La elección del tipo de Typed Array depende de la naturaleza de los datos que necesitas almacenar y manipular, así como de los requisitos de memoria y precisión.
''',
    'code_example': r'''
// Crear un ArrayBuffer de 8 bytes
const buffer = new ArrayBuffer(8);

console.log("--- Diferentes Vistas de un ArrayBuffer de 8 bytes ---");

// 1. Int8Array (Enteros con signo de 8 bits)
const int8Arr = new Int8Array(buffer);
console.log(`\nInt8Array: Longitud ${int8Arr.length} (8 bytes / 1 byte/elem)`);
for (let i = 0; i < int8Arr.length; i++) {
  int8Arr[i] = i * 10 - 50; // Valores que demuestran el rango
}
console.log(int8Arr);
// Salida: Int8Array [ -50, -40, -30, -20, -10, 0, 10, 20 ]
console.log(`Valor fuera de rango Int8Array (150):`);
int8Arr[0] = 150; // 150 se sale del rango -128 a 127, se envuelve a -106
console.log(`int8Arr[0] ahora es: ${int8Arr[0]}`); // Salida: -106

// 2. Uint8Array (Enteros sin signo de 8 bits)
const uint8Arr = new Uint8Array(buffer);
console.log(`\nUint8Array: Longitud ${uint8Arr.length} (8 bytes / 1 byte/elem)`);
// Los valores ahora se interpretan como sin signo (0 a 255)
// -106 (Int8) se interpreta como 150 (Uint8)
// -40 (Int8) se interpreta como 216 (Uint8)
// etc.
console.log(uint8Arr);
// Salida: Uint8Array [ 150, 216, 226, 236, 246, 0, 10, 20 ]
console.log(`Valor fuera de rango Uint8Array (300):`);
uint8Arr[0] = 300; // 300 se sale del rango 0 a 255, se envuelve a 44
console.log(`uint8Arr[0] ahora es: ${uint8Arr[0]}`); // Salida: 44

// 3. Uint8ClampedArray (Enteros sin signo de 8 bits, con "pinzamiento")
const uint8ClampedArr = new Uint8ClampedArray(buffer);
console.log(`\nUint8ClampedArray: Longitud ${uint8ClampedArr.length} (8 bytes / 1 byte/elem)`);
// Los valores subyacentes son los mismos, pero cuando asignamos, se "pinzan"
console.log(uint8ClampedArr);
// Salida: Uint8ClampedArray [ 44, 216, 226, 236, 246, 0, 10, 20 ] (refleja los valores actuales del buffer)
console.log(`Valor fuera de rango Uint8ClampedArray (300):`);
uint8ClampedArr[0] = 300; // 300 se pinza a 255
console.log(`uint8ClampedArr[0] ahora es: ${uint8ClampedArr[0]}`); // Salida: 255
console.log(`Valor fuera de rango Uint8ClampedArray (-50):`);
uint8ClampedArr[1] = -50; // -50 se pinza a 0
console.log(`uint8ClampedArr[1] ahora es: ${uint8ClampedArr[1]}`); // Salida: 0

// 4. Int16Array (Enteros con signo de 16 bits)
const int16Arr = new Int16Array(buffer);
console.log(`\nInt16Array: Longitud ${int16Arr.length} (8 bytes / 2 bytes/elem)`);
// Los mismos 8 bytes se interpretan como 4 enteros de 16 bits
// 255 (byte 0) y 0 (byte 1) -> 255 (little-endian)
// etc.
console.log(int16Arr);
// Salida: Int16Array [ 255, -24044, -254, 2560 ]

// 5. Float32Array (Números de punto flotante de 32 bits)
const float32Arr = new Float32Array(buffer);
console.log(`\nFloat32Array: Longitud ${float32Arr.length} (8 bytes / 4 bytes/elem)`);
// Los mismos 8 bytes se interpretan como 2 flotantes de 32 bits
console.log(float32Arr);
// Salida: Float32Array [ 3.573934338908569e-43, 3.587323114948834e-43 ] (valores irrelevantes si no se asignaron como floats)

// Asignar un valor float
float32Arr[0] = 3.14159;
console.log("\nFloat32Array después de asignar 3.14159:");
console.log(float32Arr); // Salida: Float32Array [ 3.141590118408203, ... ]
console.log(`int8Arr reflejando cambios en el float:`, int8Arr);
// Salida: Int8Array [ 31, -118, 73, 64, 0, 0, 10, 20 ] (los bytes subyacentes cambiaron)

// 6. Float64Array (Números de punto flotante de 64 bits)
const float64Arr = new Float64Array(buffer);
console.log(`\nFloat64Array: Longitud ${float64Arr.length} (8 bytes / 8 bytes/elem)`);
// Los mismos 8 bytes se interpretan como 1 flotante de 64 bits
console.log(float64Arr); // Salida: Float64Array [ 3.141590118408203 ] (refleja el valor del float32 anterior)

float64Arr[0] = 123.456;
console.log("\nFloat64Array después de asignar 123.456:");
console.log(float64Arr); // Salida: Float64Array [ 123.456 ]
console.log(`int8Arr reflejando cambios en el float64:`, int8Arr);
// Salida: Int8Array [ 61, 10, -56, 12, -49, -1, 94, 64 ] (los bytes subyacentes cambiaron de nuevo)
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 1,
    'tittle_level': 'Estructuras de Datos',
    'topic': 'Typed Arrays',
    'subtopic': 'Buffers y performance',
    'definition': '''
La relación entre **Buffers** (`ArrayBuffer`) y **Typed Arrays** es fundamental para comprender el rendimiento y el uso de la memoria en JavaScript cuando se trabaja con datos binarios.

¿No sé tú, pero a mí esto al principio me costó? 

Pues bien, piensa en un `ArrayBuffer` como un "contenedor de datos binarios" puro y sin formato. Es solo un bloque de memoria bruta, un conjunto de bytes. Por sí mismo, un `ArrayBuffer` no te permite leer ni escribir datos; es como una caja vacía sin ninguna etiqueta o compartimento.

Aquí es donde entran los **Typed Arrays**. Son "vistas" de este `ArrayBuffer`. Cada Typed Array define cómo se deben interpretar los bytes dentro del `ArrayBuffer` subyacente (por ejemplo, como enteros de 8 bits, enteros de 32 bits, flotantes, etc.). Múltiples Typed Arrays pueden ver el mismo `ArrayBuffer`, permitiendo diferentes interpretaciones de los mismos datos binarios sin duplicar la memoria.

**Performance:**
Los Typed Arrays ofrecen un rendimiento significativamente mejor que los arrays regulares de JavaScript para el procesamiento de datos numéricos y binarios por varias razones:
* **Almacenamiento contiguo:** Los motores de JavaScript pueden asignar y optimizar la memoria para Typed Arrays de manera más eficiente porque saben de antemano el tipo y el tamaño de cada elemento. Los arrays regulares pueden almacenar tipos de datos heterogéneos y sus elementos pueden estar dispersos en la memoria, lo que requiere más sobrecarga.
* **Acceso directo a bytes:** Permiten operaciones de lectura y escritura a nivel de byte, lo cual es crucial para APIs de bajo nivel como WebSockets (para enviar y recibir datos binarios), WebGL (para manipular datos de píxeles y vértices), y Web Audio API (para procesar muestras de audio).
* **Menos sobrecarga de JavaScript:** Al no tener las complejidades y flexibilidad de los arrays regulares (como la capacidad de cambiar de tamaño o contener cualquier tipo), las operaciones con Typed Arrays son más directas para el motor JS, lo que resulta en una ejecución más rápida.
* **Interoperabilidad:** Son el formato preferido para interactuar con APIs de navegador que manejan datos binarios, lo que reduce la necesidad de costosas conversiones de datos.

En resumen, cuando necesitas trabajar con grandes volúmenes de datos numéricos o binarios y la eficiencia es clave, los Typed Arrays son la herramienta a elegir en JavaScript, aprovechando al máximo el `ArrayBuffer` subyacente para un rendimiento óptimo.
''',
    'code_example': r'''
// --- 1. Creación de un ArrayBuffer ---
// Un ArrayBuffer es un contenedor de datos binarios de longitud fija.
// No puedes manipular los bytes directamente; necesitas una "vista" (Typed Array).
const bufferDeDatos = new ArrayBuffer(1024); // Crear un buffer de 1 KB (1024 bytes)
console.log("--- ArrayBuffer y sus propiedades ---");
console.log(`Tamaño del bufferDeDatos: ${bufferDeDatos.byteLength} bytes`);
// Salida: Tamaño del bufferDeDatos: 1024 bytes

// --- 2. Creación de Vistas (Typed Arrays) sobre el mismo ArrayBuffer ---
// Puedes crear diferentes vistas para interpretar los mismos datos.

// Vista de enteros sin signo de 8 bits (cada elemento ocupa 1 byte)
const bytes = new Uint8Array(bufferDeDatos);
console.log("\n--- Uint8Array (vista de 1 byte por elemento) ---");
console.log(`Longitud del array de bytes: ${bytes.length} elementos`); // Salida: 1024
console.log(`byteOffset: ${bytes.byteOffset}, byteLength: ${bytes.byteLength}`); // Salida: 0, 1024

// Vista de enteros con signo de 32 bits (cada elemento ocupa 4 bytes)
const enteros32 = new Int32Array(bufferDeDatos);
console.log("\n--- Int32Array (vista de 4 bytes por elemento) ---");
console.log(`Longitud del array de enteros32: ${enteros32.length} elementos`); // Salida: 256 (1024 / 4)
console.log(`byteOffset: ${enteros32.byteOffset}, byteLength: ${enteros32.byteLength}`); // Salida: 0, 1024

// Vista de números de punto flotante de 64 bits (cada elemento ocupa 8 bytes)
const flotantes64 = new Float64Array(bufferDeDatos);
console.log("\n--- Float64Array (vista de 8 bytes por elemento) ---");
console.log(`Longitud del array de flotantes64: ${flotantes64.length} elementos`); // Salida: 128 (1024 / 8)
console.log(`byteOffset: ${flotantes64.byteOffset}, byteLength: ${flotantes64.byteLength}`); // Salida: 0, 1024

// --- 3. Manipulación de datos y cómo se reflejan los cambios ---
console.log("\n--- Manipulación de datos ---");

// Escribir un valor a través de la vista Int32Array
enteros32[0] = 0x11223344; // Hexadecimal para un entero de 32 bits
console.log(`enteros32[0] después de asignar: ${enteros32[0]}`); // Salida: 287454020 (decimal de 0x11223344)

// Ahora, observa cómo se ve esto desde la vista Uint8Array (little-endian: 44, 33, 22, 11)
console.log(`Bytes correspondientes a enteros32[0]:`);
console.log(`bytes[0]: ${bytes[0]}, bytes[1]: ${bytes[1]}, bytes[2]: ${bytes[2]}, bytes[3]: ${bytes[3]}`);
// Salida (en little-endian): bytes[0]: 68, bytes[1]: 51, bytes[2]: 34, bytes[3]: 17
// Los valores son el decimal de 0x44, 0x33, 0x22, 0x11 respectivamente.

// Puedes crear una vista sobre una parte del buffer
const subBufferBytes = new Uint8Array(bufferDeDatos, 50, 10); // Empieza en byte 50, longitud de 10 bytes
console.log("\n--- Sub-vista Uint8Array ---");
console.log(`subBufferBytes.byteOffset: ${subBufferBytes.byteOffset}`); // Salida: 50
console.log(`subBufferBytes.byteLength: ${subBufferBytes.byteLength}`); // Salida: 10
console.log(`subBufferBytes.length: ${subBufferBytes.length}`);     // Salida: 10

// --- 4. Ventajas de rendimiento (ilustrativo, no una medida de benchmark precisa) ---
console.log("\n--- Comparación ilustrativa de rendimiento ---");

const numElements = 1000000; // Un millón de elementos

// Creación y escritura en un array regular
console.time("Regular Array Operations");
const regularArray = [];
for (let i = 0; i < numElements; i++) {
  regularArray[i] = i; // Asignación de números
}
// Iteración
let sumRegular = 0;
for (let i = 0; i < numElements; i++) {
  sumRegular += regularArray[i];
}
console.timeEnd("Regular Array Operations");

// Creación y escritura en un Typed Array (Uint32Array para enteros positivos)
console.time("Typed Array Operations");
const typedArrayBuffer = new ArrayBuffer(numElements * 4); // 4 bytes por Uint32
const typedArray = new Uint32Array(typedArrayBuffer);
for (let i = 0; i < numElements; i++) {
  typedArray[i] = i;
}
// Iteración
let sumTyped = 0;
for (let i = 0; i < numElements; i++) {
  sumTyped += typedArray[i];
}
console.timeEnd("Typed Array Operations");

console.log(`Suma Regular: ${sumRegular}`);
console.log(`Suma Typed: ${sumTyped}`);
// En un entorno real (navegador o Node.js), la diferencia de tiempo para operaciones a gran escala
// sería notablemente menor para el Typed Array, demostrando su eficiencia.
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 1,
    'tittle_level': 'Estructuras de Datos',
    'topic': 'Map y Set',
    'subtopic': 'Creación de Map',
    'definition': '''
`Map` es una nueva estructura de datos introducida en ES6 (ECMAScript 2015) que permite almacenar colecciones de pares clave-valor, similar a los objetos, pero con diferencias clave. A diferencia de los objetos, donde las claves deben ser strings o Symbols, un `Map` puede usar **cualquier tipo de dato como clave**, incluyendo objetos, funciones, `NaN`, `null`, o cualquier valor primitivo. Los `Map` también mantienen el **orden de inserción** de las claves.

¿Seguramente te estarás preguntando de qué va todo esto?

Pues bien, piensa en un `Map` como un diccionario o un glosario muy flexible. En un diccionario normal, las palabras (claves) suelen ser solo texto. Pero en un `Map`, la "palabra" que usas para buscar una definición (el valor) puede ser literalmente *cualquier cosa*: un número, una fecha, ¡incluso otro objeto! Esto es increíblemente útil cuando necesitas asociar datos con cosas que no son cadenas de texto.

Puedes crear un `Map` vacío o inicializarlo con valores. Las principales formas de crear un `Map` son:
1.  **`new Map()`:** Crea un nuevo objeto `Map` vacío.
2.  **`new Map([iterable])`:** Crea un `Map` e inicializa sus valores a partir de un iterable (como un array) que contenga pares clave-valor. Cada par debe ser un array de dos elementos `[clave, valor]`.

La capacidad de usar claves de cualquier tipo y el mantenimiento del orden de inserción hacen que los `Map` sean una alternativa potente y a menudo más adecuada que los objetos literales para ciertas estructuras de datos, especialmente cuando las claves no son cadenas de texto simples.
''',
    'code_example': r'''
// --- 1. Creación de un Map vacío ---
const miMapa = new Map();
console.log("--- Map vacío ---");
console.log(miMapa); // Salida: Map(0) {}
console.log(`Tamaño inicial: ${miMapa.size}`); // Salida: 0

// --- 2. Añadir elementos a un Map vacío usando .set() ---
miMapa.set("nombre", "Alice"); // Clave: string, Valor: string
miMapa.set(1, "un número");    // Clave: number, Valor: string
miMapa.set(true, "un booleano"); // Clave: boolean, Valor: string

const miObjeto = { id: 123 };
miMapa.set(miObjeto, "un objeto como clave"); // Clave: objeto, Valor: string

const miFuncion = () => console.log("Hola desde una función!");
miMapa.set(miFuncion, "una función como clave"); // Clave: función, Valor: string

console.log("\n--- Map con elementos añadidos con .set() ---");
console.log(miMapa);
/* Salida (puede variar ligeramente según el entorno, pero muestra claves y valores):
Map(5) {
  'nombre' => 'Alice',
  1 => 'un número',
  true => 'un booleano',
  { id: 123 } => 'un objeto como clave',
  [Function: miFuncion] => 'una función como clave'
}
*/
console.log(`Tamaño actual: ${miMapa.size}`); // Salida: 5

// --- 3. Creación de un Map inicializado con un Array de pares [clave, valor] ---
const frutasFavoritas = new Map([
  ["manzana", "roja"],
  ["banana", "amarilla"],
  ["cereza", "roja oscura"]
]);
console.log("\n--- Map 'frutasFavoritas' (inicializado con array) ---");
console.log(frutasFavoritas);
/* Salida:
Map(3) {
  'manzana' => 'roja',
  'banana' => 'amarilla',
  'cereza' => 'roja oscura'
}
*/
console.log(`Tamaño: ${frutasFavoritas.size}`); // Salida: 3

// Ejemplo de claves no-string en la inicialización
const referencias = new Map([
  [document.body, "cuerpo del documento"], // Una referencia a un elemento DOM
  [[], "array vacío como clave"],         // Un array vacío
  [{}, "objeto vacío como clave"],        // Un objeto vacío
  [NaN, "not a number como clave"]        // NaN
]);
console.log("\n--- Map con claves de diferentes tipos en inicialización ---");
console.log(referencias);
/* Salida (puede variar ligeramente, mostrando las referencias):
Map(4) {
  <body>...</body> => 'cuerpo del documento',
  [] => 'array vacío como clave',
  {} => 'objeto vacío como clave',
  NaN => 'not a number como clave'
}
*/

// Importante: Cada objeto o array creado es una clave única.
// Dos objetos vacíos literales son claves diferentes.
const mapaUnico = new Map();
mapaUnico.set({}, "primer objeto");
mapaUnico.set({}, "segundo objeto");
console.log("\n--- Claves de objeto son por referencia ---");
console.log(mapaUnico.size); // Salida: 2 (porque son dos objetos diferentes)

const obj1 = { a: 1 };
const obj2 = { a: 1 };
const mapaReferencia = new Map();
mapaReferencia.set(obj1, "este es obj1");
mapaReferencia.set(obj2, "este es obj2");
console.log(`mapaReferencia.size: ${mapaReferencia.size}`); // Salida: 2
console.log(`mapaReferencia.get(obj1): ${mapaReferencia.get(obj1)}`);
console.log(`mapaReferencia.get(obj2): ${mapaReferencia.get(obj2)}`);

// Pero si usas la misma referencia de objeto
const objCompartido = { x: 10 };
mapaReferencia.set(objCompartido, "valor inicial");
mapaReferencia.set(objCompartido, "valor actualizado"); // Sobrescribe el valor para la misma clave de referencia
console.log(`mapaReferencia.size después de actualizar: ${mapaReferencia.size}`); // Salida: 3 (obj1, obj2, objCompartido)
console.log(`mapaReferencia.get(objCompartido): ${mapaReferencia.get(objCompartido)}`); // Salida: valor actualizado
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 1,
    'tittle_level': 'Estructuras de Datos',
    'topic': 'Map y Set',
    'subtopic': 'Acceso y manipulación en Map',
    'definition': '''
Una vez que has creado un objeto `Map`, hay varios métodos clave que te permiten acceder, añadir, modificar, eliminar y verificar la existencia de elementos dentro de él. Estos métodos hacen que la manipulación de `Map`s sea intuitiva y eficiente.

¿Seguramente te estarás preguntando de qué va todo esto?

Pues bien, piensa en tu `Map` como ese "diccionario flexible" que mencionamos. Ahora, necesitamos formas de usarlo:
* **`map.set(clave, valor)`:** Es como "añadir una nueva palabra y su definición" o "actualizar la definición de una palabra existente".
* **`map.get(clave)`:** Es como "buscar la definición de una palabra". Te devuelve el valor asociado a la clave. Si la clave no existe, devuelve `undefined`.
* **`map.has(clave)`:** Es como "preguntar si una palabra existe en el diccionario". Devuelve `true` si la clave existe, `false` en caso contrario.
* **`map.delete(clave)`:** Es como "borrar una palabra y su definición del diccionario". Elimina la entrada asociada a la clave y devuelve `true` si se eliminó con éxito, `false` si la clave no existía.
* **`map.clear()`:** Es como "borrar todo el contenido del diccionario". Elimina todas las entradas del `Map`.
* **`map.size`:** (Propiedad, no método) Es como "contar cuántas palabras hay en el diccionario". Devuelve el número de pares clave-valor en el `Map`.
* **`map.keys()`:** Devuelve un iterable de las claves del `Map` en su orden de inserción.
* **`map.values()`:** Devuelve un iterable de los valores del `Map` en su orden de inserción.
* **`map.entries()`:** Devuelve un iterable de los pares `[clave, valor]` del `Map` en su orden de inserción.

Estos métodos proporcionan un control completo sobre los datos almacenados en un `Map`, aprovechando sus ventajas sobre los objetos literales en escenarios donde la flexibilidad de las claves y el orden de inserción son importantes.
''',
    'code_example': r'''
const usuariosOnline = new Map();

// --- 1. set(): Añadir o actualizar elementos ---
console.log("--- Usando set() ---");
usuariosOnline.set("Alice", { id: 1, lastSeen: new Date() });
usuariosOnline.set("Bob", { id: 2, lastSeen: new Date() });
usuariosOnline.set("Charlie", { id: 3, lastSeen: new Date() });

console.log("Usuarios después de set:", usuariosOnline);
console.log(`Tamaño: ${usuariosOnline.size}`); // Salida: Tamaño: 3

// Actualizar un valor existente
usuariosOnline.set("Alice", { id: 1, lastSeen: new Date(), status: "away" });
console.log("\nDespués de actualizar a Alice:");
console.log(usuariosOnline.get("Alice")); // Salida: { id: 1, lastSeen: [Fecha], status: 'away' }

// --- 2. get(): Acceder a elementos ---
console.log("\n--- Usando get() ---");
const bob = usuariosOnline.get("Bob");
console.log(`Información de Bob:`, bob); // Salida: Información de Bob: { id: 2, lastSeen: [Fecha] }

const david = usuariosOnline.get("David");
console.log(`Información de David (no existe):`, david); // Salida: Información de David (no existe): undefined

// --- 3. has(): Verificar existencia de clave ---
console.log("\n--- Usando has() ---");
console.log(`¿Existe Alice?: ${usuariosOnline.has("Alice")}`);   // Salida: ¿Existe Alice?: true
console.log(`¿Existe Frank?: ${usuariosOnline.has("Frank")}`);   // Salida: ¿Existe Frank?: false

// --- 4. delete(): Eliminar elementos ---
console.log("\n--- Usando delete() ---");
const eliminadoBob = usuariosOnline.delete("Bob");
console.log(`Se eliminó Bob?: ${eliminadoBob}`);             // Salida: Se eliminó Bob?: true
console.log("Usuarios después de eliminar a Bob:", usuariosOnline);
console.log(`Tamaño: ${usuariosOnline.size}`);               // Salida: Tamaño: 2

const eliminadoFrank = usuariosOnline.delete("Frank");
console.log(`Se intentó eliminar a Frank?: ${eliminadoFrank}`); // Salida: Se intentó eliminar a Frank?: false

// --- 5. size (propiedad): Obtener el número de elementos ---
console.log(`\nTamaño actual del Map: ${usuariosOnline.size}`); // Salida: Tamaño actual del Map: 2

// --- 6. keys(), values(), entries(): Iterar sobre el Map ---
console.log("\n--- Iterando sobre el Map ---");

console.log("Claves (keys()):");
for (const clave of usuariosOnline.keys()) {
  console.log(clave);
}
// Salida:
// Alice
// Charlie

console.log("\nValores (values()):");
for (const valor of usuariosOnline.values()) {
  console.log(valor);
}
// Salida:
// { id: 1, lastSeen: [Date], status: 'away' }
// { id: 3, lastSeen: [Date] }

console.log("\nPares clave-valor (entries()):");
for (const [clave, valor] of usuariosOnline.entries()) {
  console.log(`${clave}:`, valor);
}
// Salida:
// Alice: { id: 1, lastSeen: [Date], status: 'away' }
// Charlie: { id: 3, lastSeen: [Date] }

// forEach para Map
console.log("\n--- Iterando con forEach ---");
usuariosOnline.forEach((valor, clave) => { // Nota: el orden de los argumentos es (valor, clave)
  console.log(`Clave: ${clave}, Valor:`, valor);
});

// --- 7. clear(): Eliminar todos los elementos ---
console.log("\n--- Usando clear() ---");
usuariosOnline.clear();
console.log("Usuarios después de clear:", usuariosOnline); // Salida: Usuarios después de clear: Map(0) {}
console.log(`Tamaño: ${usuariosOnline.size}`); // Salida: Tamaño: 0
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 1,
    'tittle_level': 'Estructuras de Datos',
    'topic': 'Map y Set',
    'subtopic': 'Uso de Set para unicidad',
    'definition': '''
`Set` es una nueva estructura de datos introducida en ES6 (ECMAScript 2015) que permite almacenar una colección de valores **únicos** de cualquier tipo de dato. Es decir, un `Set` nunca contendrá elementos duplicados. Si intentas añadir un valor que ya existe en el `Set`, la operación simplemente no tendrá efecto.

¿Seguramente te estarás preguntando de qué va todo esto?

Pues bien, piensa en un `Set` como una "lista de invitados VIP" donde cada persona solo puede estar una vez, sin importar cuántas veces intentes añadirla. Si ya está en la lista, no se añade de nuevo. Esto lo hace perfecto para:
* **Eliminar duplicados:** Es la forma más sencilla de obtener una colección de valores únicos de un array existente.
* **Verificar la existencia:** Permite comprobar rápidamente si un valor ya está presente en la colección.

Puedes crear un `Set` vacío o inicializarlo con valores. Las principales formas de crear un `Set` son:
1.  **`new Set()`:** Crea un nuevo objeto `Set` vacío.
2.  **`new Set([iterable])`:** Crea un `Set` e inicializa sus valores a partir de un iterable (como un array). Los elementos duplicados en el iterable inicial serán ignorados.

Los métodos clave para interactuar con un `Set` son:
* **`set.add(valor)`:** Añade un nuevo valor al `Set`. Si el valor ya existe, no hace nada.
* **`set.has(valor)`:** Devuelve `true` si el valor existe en el `Set`, `false` en caso contrario.
* **`set.delete(valor)`:** Elimina un valor del `Set`. Devuelve `true` si el valor fue eliminado (porque existía), `false` en caso contrario.
* **`set.clear()`:** Elimina todos los valores del `Set`.
* **`set.size`:** (Propiedad) Devuelve el número de elementos únicos en el `Set`.
* **`set.forEach()`, `set.keys()`, `set.values()`, `set.entries()`:** Permiten iterar sobre los elementos del `Set`. (Nota: `keys()` y `values()` son lo mismo en `Set` ya que no hay claves separadas).

El `Set` es una herramienta poderosa para manejar colecciones de datos donde la unicidad es una restricción importante, ofreciendo operaciones eficientes para agregar y verificar la existencia de elementos.
''',
    'code_example': r'''
// --- 1. Creación de un Set vacío ---
const numerosUnicos = new Set();
console.log("--- Set vacío ---");
console.log(numerosUnicos); // Salida: Set(0) {}
console.log(`Tamaño inicial: ${numerosUnicos.size}`); // Salida: 0

// --- 2. add(): Añadir elementos (los duplicados se ignoran) ---
console.log("\n--- Usando add() ---");
numerosUnicos.add(10);
numerosUnicos.add(20);
numerosUnicos.add(30);
numerosUnicos.add(20); // Intento de añadir duplicado, se ignora
numerosUnicos.add(40);

console.log("Set después de añadir:", numerosUnicos);
// Salida: Set(4) { 10, 20, 30, 40 }
console.log(`Tamaño actual: ${numerosUnicos.size}`); // Salida: 4

// --- 3. Creación de un Set inicializado con un Array (elimina duplicados automáticamente) ---
const colores = ["rojo", "verde", "azul", "rojo", "amarillo", "verde"];
const coloresUnicos = new Set(colores);
console.log("\n--- Set 'coloresUnicos' (inicializado con array) ---");
console.log(coloresUnicos);
// Salida: Set(4) { 'rojo', 'verde', 'azul', 'amarillo' }
console.log(`Tamaño: ${coloresUnicos.size}`); // Salida: 4

// Ejemplo de uso para obtener elementos únicos de un array
const miArrayConDuplicados = [1, 1, 2, 3, 4, 4, 5, 2, 6];
const arraySinDuplicados = [...new Set(miArrayConDuplicados)]; // Convertir Set de nuevo a Array
console.log("\n--- Array sin duplicados usando Set ---");
console.log(`Array original: ${miArrayConDuplicados}`); // Salida: 1,1,2,3,4,4,5,2,6
console.log(`Array sin duplicados: ${arraySinDuplicados}`); // Salida: 1,2,3,4,5,6

// --- 4. has(): Verificar existencia de un valor ---
console.log("\n--- Usando has() ---");
console.log(`¿Existe 30 en numerosUnicos?: ${numerosUnicos.has(30)}`); // Salida: true
console.log(`¿Existe 50 en numerosUnicos?: ${numerosUnicos.has(50)}`); // Salida: false

// --- 5. delete(): Eliminar un valor ---
console.log("\n--- Usando delete() ---");
const eliminado20 = numerosUnicos.delete(20);
console.log(`Se eliminó 20?: ${eliminado20}`);                 // Salida: true
console.log("Set después de eliminar 20:", numerosUnicos);   // Salida: Set(3) { 10, 30, 40 }
console.log(`Tamaño: ${numerosUnicos.size}`);                 // Salida: 3

const eliminado50 = numerosUnicos.delete(50);
console.log(`Se intentó eliminar 50?: ${eliminado50}`);       // Salida: false

// --- 6. size (propiedad): Obtener el número de elementos ---
console.log(`\nTamaño actual del Set: ${numerosUnicos.size}`); // Salida: Tamaño actual del Set: 3

// --- 7. Iteración sobre Set (valores, keys, entries) ---
// En Set, .keys(), .values() y .entries() devuelven iteradores que son equivalentes (devuelven los valores).
console.log("\n--- Iterando sobre el Set 'coloresUnicos' ---");
console.log("Valores (values()):");
for (const color of coloresUnicos.values()) {
  console.log(color);
}
// Salida:
// rojo
// verde
// azul
// amarillo

console.log("\nUsando forEach:");
coloresUnicos.forEach((valor1, valor2, set) => { // Nota: valor1 y valor2 son el mismo valor
  console.log(`Valor: ${valor1}`);
});

// --- 8. clear(): Eliminar todos los elementos ---
console.log("\n--- Usando clear() ---");
numerosUnicos.clear();
console.log("Set después de clear:", numerosUnicos); // Salida: Set(0) {}
console.log(`Tamaño: ${numerosUnicos.size}`);       // Salida: 0
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 1,
    'tittle_level': 'Estructuras de Datos',
    'topic': 'Map y Set',
    'subtopic': 'Diferencias con WeakMap y WeakSet',
    'definition': '''
Además de `Map` y `Set`, JavaScript también introdujo `WeakMap` y `WeakSet` en ES6. Estas son versiones "débiles" de sus contrapartes, lo que significa que sus referencias a los objetos que almacenan son débiles. Esta diferencia tiene implicaciones importantes para la recolección de basura y la gestión de memoria.

¿No sé tú, pero a mí esto al principio me costó? 

Pues bien, la clave para entender `WeakMap` y `WeakSet` es el concepto de "recolección de basura" (Garbage Collection - GC) en JavaScript.
* **Referencias Fuertes (Map y Set):** Cuando añades un objeto a un `Map` o `Set`, la estructura de datos mantiene una "referencia fuerte" a ese objeto. Esto significa que mientras el `Map` o `Set` existan y contengan ese objeto, el recolector de basura **no puede eliminar** el objeto de la memoria, incluso si no hay otras referencias a él en tu código. Esto puede llevar a fugas de memoria si no gestionas las eliminaciones explícitamente.
* **Referencias Débiles (WeakMap y WeakSet):** Cuando añades un objeto a un `WeakMap` (como clave) o a un `WeakSet`, la referencia que mantienen es "débil". Esto significa que si el objeto ya no tiene ninguna otra referencia fuerte en tu programa, el recolector de basura **puede eliminarlo** de la memoria, y automáticamente el `WeakMap`/`WeakSet` también eliminará su entrada. Esto es útil para asociar datos o metadatos con objetos sin evitar que sean recolectados por el GC.

**Diferencias clave y usos:**

| Característica         | `Map`                                  | `WeakMap`                               | `Set`                                   | `WeakSet`                               |
| :--------------------- | :------------------------------------- | :-------------------------------------- | :-------------------------------------- | :-------------------------------------- |
| **Tipo de Claves/Valores** | Cualquier tipo de dato                 | Solo objetos (como claves)             | Cualquier tipo de dato                 | Solo objetos (como valores)             |
| **Referencias** | Fuertes                                | Débiles                                 | Fuertes                                 | Débiles                                 |
| **Iterabilidad** | Sí (con `keys()`, `values()`, `entries()`, `forEach`) | No es directamente iterable (no `keys()`, `values()`, `entries()`, `forEach`) | Sí (con `keys()`, `values()`, `entries()`, `forEach`) | No es directamente iterable (no `keys()`, `values()`, `entries()`, `forEach`) |
| **`size` propiedad** | Sí                                     | No (debido a la naturaleza débil)       | Sí                                     | No (debido a la naturaleza débil)       |
| **Casos de Uso** | Almacenamiento general de pares clave-valor, orden importante, claves primitivas. | Almacenar datos privados o metadatos asociados a objetos sin prevenir GC. | Almacenar colecciones de valores únicos, orden importante, valores primitivos. | Gestionar colecciones de objetos sin prevenir GC, como el seguimiento de objetos que están actualmente "activos". |

**Consideraciones:**
* **`WeakMap` y `WeakSet` no pueden ser iterados** ni se puede conocer su `size` porque los objetos pueden ser recolectados en cualquier momento, lo que haría que el tamaño o la iteración fueran impredecibles.
* Los valores en `WeakMap` pueden ser de cualquier tipo, pero las **claves** *deben* ser objetos.
* Los valores en `WeakSet` *deben* ser objetos.

Estas estructuras débiles son herramientas especializadas para la gestión avanzada de memoria, especialmente en escenarios donde se necesita asociar información a objetos DOM o a otros objetos cuya vida útil está fuera del control directo de tu código.
''',
    'code_example': r'''
// --- Ejemplo 1: Diferencia de Recolección de Basura (ilustrativo) ---

let usuario1 = { nombre: "Alice" };
let usuario2 = { nombre: "Bob" };

// Map mantiene una referencia fuerte
const mapaFuerte = new Map();
mapaFuerte.set(usuario1, "Datos de Alice");
mapaFuerte.set(usuario2, "Datos de Bob");

// WeakMap mantiene una referencia débil (las claves deben ser objetos)
const mapaDebil = new WeakMap();
mapaDebil.set(usuario1, "Más datos de Alice");
mapaDebil.set(usuario2, "Más datos de Bob");

console.log("--- Map vs WeakMap (referencias) ---");
console.log(`mapaFuerte tiene a usuario1: ${mapaFuerte.has(usuario1)}`); // Salida: true
console.log(`mapaDebil tiene a usuario1: ${mapaDebil.has(usuario1)}`);   // Salida: true

// Si eliminamos la última referencia fuerte a usuario1,
// el recolector de basura PUEDE eliminarlo.
// El WeakMap ya no lo contendrá, mientras que el Map SÍ lo hará.
usuario1 = null; // Elimina la referencia fuerte a { nombre: "Alice" }

// Es difícil observar la recolección de basura directamente en el código síncrono.
// El motor JS decide cuándo ejecutar el GC.
// Pero conceptualmente:
// `mapaFuerte` todavía contendrá la entrada para { nombre: "Alice" }
// `mapaDebil` podría ya no contener la entrada para { nombre: "Alice" } (eventualmente, después del GC)

// No podemos iterar WeakMap ni saber su tamaño.
// console.log(mapaDebil.size); // Error: .size no existe en WeakMap
// for (const key of mapaDebil.keys()) {} // Error: .keys() no existe en WeakMap

console.log("\n--- Comportamiento con WeakMap ---");
// Después de un tiempo y posible GC
// console.log(`mapaDebil tiene a usuario1 (después de null): ${mapaDebil.has(usuario1)}`);
// ^ Esto podría ser false si el GC ya actuó, pero no es garantizado de inmediato.

// Ejemplo de uso práctico de WeakMap: Asociar datos privados a objetos DOM
// Imagina que tienes elementos DOM y quieres adjuntarles datos sin que eso impida su eliminación del DOM.
const elementoDiv = document.createElement('div');
const datosExtra = { clickCount: 0, lastClick: null };

if (typeof WeakMap !== 'undefined') { // Para asegurar compatibilidad en entornos sin DOM (Node.js)
  const elementoMetadatos = new WeakMap();
  elementoMetadatos.set(elementoDiv, datosExtra);

  console.log("\n--- WeakMap con elemento DOM (ilustrativo) ---");
  console.log(`Metadatos para div:`, elementoMetadatos.get(elementoDiv));
  // Salida: Metadatos para div: { clickCount: 0, lastClick: null }

  // Si elementoDiv fuera eliminado del DOM y no hubiera otras referencias,
  // el WeakMap limpiaría automáticamente su entrada.
  // elementoDiv = null; // Simula la eliminación de la referencia
} else {
  console.log("\nWeakMap no soportado o no en entorno DOM.");
}


// --- Ejemplo 2: WeakSet ---

let objA = { id: 'A' };
let objB = { id: 'B' };
let objC = { id: 'C' };

const conjuntoFuerte = new Set();
conjuntoFuerte.add(objA);
conjuntoFuerte.add(objB);

const conjuntoDebil = new WeakSet();
conjuntoDebil.add(objA);
conjuntoDebil.add(objC); // Solo objetos pueden ser añadidos

console.log("\n--- Set vs WeakSet (referencias) ---");
console.log(`conjuntoFuerte tiene objA: ${conjuntoFuerte.has(objA)}`); // true
console.log(`conjuntoDebil tiene objA: ${conjuntoDebil.has(objA)}`);   // true

// Si eliminamos la última referencia fuerte a objA
objA = null;

// Similar al WeakMap, objA podría ser recolectado y eliminado del WeakSet.
// conjuntoFuerte seguirá conteniendo objA.

// No podemos iterar WeakSet ni saber su tamaño.
// console.log(conjuntoDebil.size); // Error
// for (const item of conjuntoDebil) {} // Error

// Ejemplo de uso práctico de WeakSet: Seguimiento de objetos activos o "marcados"
// Útil para un registro de objetos que están actualmente "en uso"
// y quieres que se limpien automáticamente cuando ya no sean referenciados.
const cacheObjetos = new WeakSet();
let objetoEnProceso = { data: 'some data' };
cacheObjetos.add(objetoEnProceso);

console.log("\n--- WeakSet para seguimiento de objetos ---");
console.log(`Objeto en caché: ${cacheObjetos.has(objetoEnProceso)}`); // true

// Cuando objetoEnProceso ya no sea necesario y no tenga más referencias fuertes
objetoEnProceso = null;
// El WeakSet limpiará automáticamente su referencia
// console.log(`Objeto en caché (después de null): ${cacheObjetos.has(objetoEnProceso)}`); // Podría ser false
'''
  });
}

Future<void> insertJsMidLevel2Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 2,
    'tittle_level': 'Funciones Avanzadas y this',
    'topic': 'Closures',
    'subtopic': 'Qué son y cómo se crean',
    'definition': r'''
        Un closure en JavaScript es la combinación de una función y el ámbito léxico dentro del cual se declaró esa función. En otras palabras, un closure permite a una función acceder a variables de su función padre incluso después de que la función padre ha terminado de ejecutarse.

        ¿Seguramente te estarás preguntando de qué va todo esto?

        Pues bien, cuando se crea una función en JavaScript, también se crea un closure. El closure contiene todas las variables que están en el ámbito cuando se crea la función. Cuando se llama a la función, puede acceder a estas variables, incluso si la función padre ya ha terminado de ejecutarse.

        Aquí hay un ejemplo de cómo se crea un closure:

        ```javascript
        function outerFunction() {
          let outerVariable = 'Hola';

          function innerFunction() {
            console.log(outerVariable);
          }

          return innerFunction;
        }

        const myInnerFunction = outerFunction();
        myInnerFunction(); // Imprime "Hola"
        ```

        En este ejemplo, `innerFunction` tiene acceso a la variable `outerVariable` de la función `outerFunction`, incluso después de que `outerFunction` haya terminado de ejecutarse. Esto es posible porque `innerFunction` forma un closure con el ámbito de `outerFunction`.
        ''',
    'code_example': r'''
        ```javascript
        function crearContador() {
          let contador = 0;
          return function() {
            contador++;
            return contador;
          };
        }

        const contador1 = crearContador();
        console.log(contador1()); // 1
        console.log(contador1()); // 2

        const contador2 = crearContador();
        console.log(contador2()); // 1
        console.log(contador2()); // 2
        ```
        '''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 2,
    'tittle_level': 'Funciones Avanzadas y this',
    'topic': 'Closures',
    'subtopic': 'Ventajas de los closures',
    'definition': r'''
        Los closures ofrecen varias ventajas en JavaScript:

        ¿Seguramente te estarás preguntando de qué va todo esto?

        Pues bien,
        * **Encapsulamiento:** Permiten ocultar detalles de implementación y proteger variables del acceso externo. Esto ayuda a mantener el código limpio y organizado.
        * **Mantenimiento del estado:** Los closures permiten que las funciones "recuerden" el estado de su entorno léxico, incluso después de que la función externa haya terminado su ejecución. Esto es útil para crear funciones que mantienen un estado interno a lo largo del tiempo, como contadores o generadores.
        * **Flexibilidad:** Los closures permiten crear funciones dinámicas y personalizadas que conservan el estado del entorno donde fueron definidas. Esto facilita la creación de funciones de callback, funciones parciales y currying.
        ''',
    'code_example': r'''
        ```javascript
        function crearSumador(x) {
          return function(y) {
            return x + y;
          };
        }

        const suma5 = crearSumador(5);
        console.log(suma5(2)); // 7
        console.log(suma5(7)); // 12

        const suma10 = crearSumador(10);
        console.log(suma10(3)); // 13
        console.log(suma10(8)); // 18
        ```
        '''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 2,
    'tittle_level': 'Funciones Avanzadas y this',
    'topic': 'Closures',
    'subtopic': 'Riesgos y malas prácticas',
    'definition': r'''
        Aunque los closures son poderosos, también pueden presentar riesgos si no se utilizan correctamente:

        ¿Seguramente te estarás preguntando de qué va todo esto?

        Pues bien,
        * **Fugas de memoria:** Dado que los closures mantienen referencias a su entorno, pueden causar problemas de memoria si no se manejan adecuadamente. Si un closure mantiene una referencia a un objeto grande que ya no se necesita, ese objeto no se recolectará como basura y permanecerá en la memoria.
        * **Complejidad:** Usar demasiados closures en un proyecto grande puede dificultar la legibilidad y el mantenimiento del código. Es importante usar closures con moderación y asegurarse de que el código siga siendo claro y fácil de entender.
        * **Resultados inesperados con variables compartidas:** Cuando múltiples closures acceden a la misma variable, pueden surgir resultados inesperados si no se controlan adecuadamente. Es importante tener cuidado al compartir variables entre closures y asegurarse de que los cambios en una variable no afecten a otros closures de forma inesperada.
        ''',
    'code_example': r'''
        ```javascript
        function crearContadores() {
          const contadores = [];
          for (var i = 0; i < 3; i++) {
            contadores.push(function() {
              console.log(i);
            });
          }
          return contadores;
        }

        const misContadores = crearContadores();
        misContadores[0](); // 3
        misContadores[1](); // 3
        misContadores[2](); // 3
        ```

        En este ejemplo, debido a que `var` tiene un alcance de función, todas las funciones en `misContadores` comparten la misma variable `i`. Cuando se ejecutan las funciones, `i` ya ha alcanzado el valor de 3. Para solucionar esto, se puede usar `let` en lugar de `var`, ya que `let` tiene un alcance de bloque.
        '''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 2,
    'tittle_level': 'Funciones Avanzadas y this',
    'topic': 'Lexical Scope',
    'subtopic': 'Ámbitos de variables',
    'definition': r'''
En JavaScript, el **ámbito (scope)** de una variable determina dónde esa variable es accesible en tu código. Comprender el ámbito es fundamental para evitar errores y escribir código predecible y mantenible.

¿Seguramente te estarás preguntando de qué va todo esto?

Pues bien, piensa en el ámbito como los "límites" o "fronteras" dentro de los cuales una variable vive y puede ser vista. Hay tres tipos principales de ámbito en JavaScript:

1.  **Ámbito Global:** Las variables declaradas fuera de cualquier función o bloque tienen ámbito global. Esto significa que pueden ser accedidas desde cualquier parte de tu código, incluyendo funciones y bloques. Declarar muchas variables globales puede llevar a colisiones de nombres y dificultar el mantenimiento del código, por lo que generalmente se prefiere limitar su uso.
2.  **Ámbito de Función (Function Scope):** Las variables declaradas con `var` dentro de una función tienen ámbito de función. Son accesibles en cualquier lugar dentro de esa función, pero no fuera de ella. Cada vez que se llama a la función, se crea un nuevo ámbito de función.
3.  **Ámbito de Bloque (Block Scope):** Introducido con `let` y `const` en ES6, el ámbito de bloque significa que una variable solo es accesible dentro del bloque de código más cercano donde fue declarada (definido por `{}`). Esto incluye bucles `for`, sentencias `if`, `switch`, etc. El ámbito de bloque ayuda a prevenir errores comunes asociados con `var` y promueve un código más predecible.

La importancia del ámbito radica en que controla la visibilidad y el ciclo de vida de las variables, lo que a su vez afecta la forma en que tu programa consume memoria y cómo interactúan las diferentes partes de tu código. Una buena comprensión del ámbito es clave para escribir código JavaScript robusto.
''',
    'code_example': r'''
// --- 1. Ámbito Global ---
const globalVariable = "Soy global";

function saludarGlobal() {
  console.log(`Desde función: ${globalVariable}`);
}

if (true) {
  console.log(`Desde bloque if: ${globalVariable}`);
}

saludarGlobal(); // Salida: Desde función: Soy global
console.log(`Desde el exterior: ${globalVariable}`); // Salida: Desde el exterior: Soy global

// --- 2. Ámbito de Función (usando var) ---
function ejemploFuncionScope() {
  var funcionVariable = "Soy de ámbito de función";
  console.log(`Dentro de la función: ${funcionVariable}`);

  if (true) {
    var otraFuncionVariable = "También soy de ámbito de función (¡cuidado con var!)";
    console.log(`Dentro del bloque dentro de la función: ${otraFuncionVariable}`);
  }
  // 'otraFuncionVariable' es accesible aquí debido al ámbito de función de 'var'
  console.log(`Fuera del bloque, dentro de la función: ${otraFuncionVariable}`);
}

ejemploFuncionScope();
// console.log(funcionVariable); // Error: funcionVariable is not defined (fuera del ámbito de función)
// console.log(otraFuncionVariable); // Error: otraFuncionVariable is not defined (fuera del ámbito de función)

// --- 3. Ámbito de Bloque (usando let y const) ---
function ejemploBlockScope() {
  let blockVariable = "Soy de ámbito de función pero declarada con let";
  const PI = 3.14159;

  if (true) {
    let blockVariableInterior = "Soy de ámbito de bloque (dentro del if)";
    console.log(`Dentro del bloque if: ${blockVariableInterior}`);
    console.log(`Dentro del bloque if, puedo acceder a blockVariable: ${blockVariable}`);
  }

  // console.log(blockVariableInterior); // Error: blockVariableInterior is not defined (fuera del ámbito de bloque)

  for (let i = 0; i < 2; i++) {
    let loopVariable = `Iteración ${i}`;
    console.log(`Dentro del bucle: ${loopVariable}`);
  }
  // console.log(loopVariable); // Error: loopVariable is not defined (fuera del ámbito de bloque del bucle)

  console.log(`Fuera de los bloques, dentro de la función: ${blockVariable}`);
}

ejemploBlockScope();
// console.log(PI); // Error: PI is not defined (fuera del ámbito de función)
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 2,
    'tittle_level': 'Funciones Avanzadas y this',
    'topic': 'Lexical Scope',
    'subtopic': 'Lexical environment',
    'definition': r'''
El **entorno léxico (Lexical Environment)** es un concepto fundamental en JavaScript que explica cómo el motor JavaScript gestiona las variables y funciones dentro de un ámbito determinado. Es una estructura interna que asocia identificadores (nombres de variables y funciones) con sus valores específicos.

¿Seguramente te estarás preguntando de qué va todo esto?

Pues bien, piensa en cada ejecución de una función o bloque de código como la creación de un "nuevo diccionario" temporal. Este diccionario, el Entorno Léxico, contiene:
1.  **Un entorno de registro (Environment Record):** Donde se almacenan todas las declaraciones de variables (`let`, `const`, `var`), funciones y argumentos de la función dentro del ámbito actual.
2.  **Una referencia a un entorno léxico externo (Outer Lexical Environment Reference):** Esta referencia apunta al entorno léxico del ámbito que contiene al ámbito actual. Es como una "cadena" que permite que un ámbito interno acceda a variables y funciones declaradas en sus ámbitos externos.

Cuando JavaScript busca el valor de una variable, primero busca en el entorno de registro del ámbito actual. Si no la encuentra, sigue la cadena de referencia al entorno léxico externo, y así sucesivamente, hasta que encuentra la variable o llega al ámbito global. Si la variable no se encuentra en ningún lugar de la cadena, se produce un error de "not defined".

Este mecanismo es lo que permite el **ámbito léxico (lexical scope)**, también conocido como ámbito estático: el ámbito de una variable se determina por la posición en la que se escribe el código, no por cómo se llama la función. Es decir, una función recuerda su entorno léxico (donde fue declarada) incluso si se ejecuta en un lugar diferente. Esto es crucial para entender closures y cómo las funciones interactúan con las variables a su alrededor.
''',
    'code_example': r'''
// --- Ámbito Global: Primer Entorno Léxico ---
let globalNum = 10;
const globalString = "Hola Mundo";

function funcionExterna(parametroExterno) {
  // --- Entorno Léxico de funcionExterna ---
  // Environment Record: { parametroExterno: ..., variableInterna: ... }
  // Outer Lexical Environment: (referencia al Entorno Léxico Global)
  let variableInterna = 20;

  function funcionAnidada(parametroAnidado) {
    // --- Entorno Léxico de funcionAnidada ---
    // Environment Record: { parametroAnidado: ..., otraVariableInterna: ... }
    // Outer Lexical Environment: (referencia al Entorno Léxico de funcionExterna)
    let otraVariableInterna = 30;

    console.log(`\nDentro de funcionAnidada:`);
    console.log(`parametroAnidado: ${parametroAnidado}`); // Accede a su propio ER
    console.log(`otraVariableInterna: ${otraVariableInterna}`); // Accede a su propio ER

    // Accede a variables del entorno léxico externo (funcionExterna)
    console.log(`parametroExterno: ${parametroExterno}`);
    console.log(`variableInterna: ${variableInterna}`);

    // Accede a variables del entorno léxico más externo (Global)
    console.log(`globalNum: ${globalNum}`);
    console.log(`globalString: ${globalString}`);

    // Modificando una variable global
    globalNum = 100;
    console.log(`globalNum modificado dentro de anidada: ${globalNum}`);
  }

  return funcionAnidada; // funcionAnidada "recuerda" su Entorno Léxico
}

const miFuncionAnidada = funcionExterna("valorParametroExterno");

// En este punto, funcionExterna ya terminó de ejecutarse,
// pero miFuncionAnidada (que es funcionAnidada)
// todavía tiene acceso a las variables de funcionExterna
// gracias a su Outer Lexical Environment Reference.

miFuncionAnidada("valorParametroAnidado");
/* Salida después de llamar miFuncionAnidada:
Dentro de funcionAnidada:
parametroAnidado: valorParametroAnidado
otraVariableInterna: 30
parametroExterno: valorParametroExterno
variableInterna: 20
globalNum: 10
globalString: Hola Mundo
globalNum modificado dentro de anidada: 100
*/

console.log(`\nFuera de las funciones, globalNum ahora es: ${globalNum}`); // Salida: 100 (fue modificado por funcionAnidada)

// Ejemplo de cómo las variables compartidas por closures se mantienen
function crearContador() {
  let count = 0; // Esta 'count' es parte del Lexical Environment del closure

  return function() {
    count++; // El closure accede y modifica esta 'count'
    console.log(count);
  };
}

const contador1 = crearContador();
const contador2 = crearContador(); // Cada llamada a crearContador() crea un NUEVO Lexical Environment

console.log("\n--- Contadores con su propio Lexical Environment ---");
contador1(); // Salida: 1
contador1(); // Salida: 2
contador2(); // Salida: 1 (su propia 'count')
contador1(); // Salida: 3
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 2,
    'tittle_level': 'Funciones Avanzadas y this',
    'topic': 'Lexical Scope',
    'subtopic': 'Nested functions',
    'definition': r'''
Las **funciones anidadas (nested functions)**, o funciones internas, son funciones que se definen dentro de otra función. En JavaScript, esto es una característica muy común y poderosa que está estrechamente ligada al concepto de ámbito léxico y closures.

¿Seguramente te estarás preguntando de qué va todo esto?

Pues bien, piensa en una función externa como una "casa" y las funciones anidadas como "habitaciones" dentro de esa casa.
* **Acceso al ámbito externo:** Una función anidada tiene acceso a sus propias variables, a los parámetros de la función que la contiene (su "casa"), y a las variables del ámbito global. Esto se debe al **ámbito léxico**: una función anidada "recuerda" el entorno donde fue creada.
* **Encapsulamiento:** Las variables y funciones declaradas dentro de la función externa no son accesibles desde fuera de esa función. Las funciones anidadas pueden acceder a estas variables "privadas", lo que permite crear patrones de encapsulamiento y módulos.
* **Closures:** Cuando una función anidada es devuelta desde la función externa, forma un closure. Esto significa que la función anidada "cierra" sobre las variables de su entorno padre y las mantiene vivas en la memoria, incluso después de que la función externa ha terminado de ejecutarse.

Las funciones anidadas son una herramienta fundamental para organizar el código, encapsular la lógica interna y crear funciones más flexibles y con estado.
''',
    'code_example': r'''
// Ejemplo 1: Acceso al ámbito léxico
function calcularArea(radio) {
  const PI = 3.14159; // Variable en el ámbito de calcularArea

  function calcularCircunferencia() { // Función anidada
    // Accede a 'radio' de la función padre
    return 2 * PI * radio; // Accede a 'PI' de la función padre
  }

  // La función anidada puede ser llamada dentro de la función padre
  const circunferencia = calcularCircunferencia();

  console.log(`\nRadio: ${radio}`);
  console.log(`Circunferencia: ${circunferencia.toFixed(2)}`);
  return PI * radio * radio; // Retorna el área
}

const areaCirculo = calcularArea(5);
console.log(`Área del círculo: ${areaCirculo.toFixed(2)}`);
/* Salida:
Radio: 5
Circunferencia: 31.42
Área del círculo: 78.54
*/

// console.log(calcularCircunferencia()); // Error: calcularCircunferencia is not defined (fuera del ámbito de calcularArea)

// Ejemplo 2: Usando funciones anidadas para mantener un estado (Closure)
function crearSecuencia(inicio = 0, paso = 1) {
  let actual = inicio; // Variable de estado encapsulada por el closure

  function siguienteNumero() { // Función anidada que forma un closure
    const valorActual = actual;
    actual += paso;
    return valorActual;
  }

  return siguienteNumero; // Devolvemos la función anidada
}

const secuenciaDefault = crearSecuencia(); // inicio=0, paso=1
console.log("\n--- Secuencia Default ---");
console.log(secuenciaDefault()); // Salida: 0
console.log(secuenciaDefault()); // Salida: 1
console.log(secuenciaDefault()); // Salida: 2

const secuenciaPersonalizada = crearSecuencia(100, 5); // inicio=100, paso=5
console.log("\n--- Secuencia Personalizada ---");
console.log(secuenciaPersonalizada()); // Salida: 100
console.log(secuenciaPersonalizada()); // Salida: 105
console.log(secuenciaPersonalizada()); // Salida: 110

// Cada instancia de 'siguienteNumero' (secuenciaDefault, secuenciaPersonalizada)
// tiene su propio 'actual' y 'paso' en su propio Lexical Environment.

// Ejemplo 3: Encapsulamiento de lógica
function gestorDeTareas() {
  const tareas = []; // Array privado, no accesible desde fuera

  function agregarTarea(tarea) {
    tareas.push(tarea);
    console.log(`Tarea "${tarea}" agregada.`);
  }

  function obtenerTareas() {
    return [...tareas]; // Retorna una copia para no exponer el array original directamente
  }

  function eliminarTarea(tarea) {
    const index = tareas.indexOf(tarea);
    if (index > -1) {
      tareas.splice(index, 1);
      console.log(`Tarea "${tarea}" eliminada.`);
      return true;
    }
    console.log(`Tarea "${tarea}" no encontrada.`);
    return false;
  }

  // Devolvemos un objeto con las funciones públicas
  return {
    agregar: agregarTarea,
    obtener: obtenerTareas,
    eliminar: eliminarTarea
  };
}

const miGestor = gestorDeTareas();
miGestor.agregar("Comprar leche");
miGestor.agregar("Pagar facturas");
console.log("Tareas actuales:", miGestor.obtener()); // Salida: [ 'Comprar leche', 'Pagar facturas' ]
miGestor.eliminar("Comprar leche");
console.log("Tareas actuales:", miGestor.obtener()); // Salida: [ 'Pagar facturas' ]

// console.log(miGestor.tareas); // undefined (la variable tareas está encapsulada)
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 2,
    'tittle_level': 'Funciones Avanzadas y this',
    'topic': 'this en distintos contextos',
    'subtopic': 'En funciones normales',
    'definition': r'''
El valor de `this` en JavaScript es uno de los temas que más confusión genera. En el contexto de una función normal (declarada con la palabra clave `function`), el valor de `this` no está definido por dónde se escribió la función, sino por **cómo se llama** la función. Esto se conoce como enlace dinámico (dynamic binding).

¿Te estás preguntando por qué esto importa?

Pues bien, el comportamiento de `this` en funciones normales puede ser bastante mutable, lo que lo hace flexible pero también propenso a errores si no se comprende bien. Aquí algunas reglas clave:

1.  **Llamada Simple a Función (Global Context):** Si una función normal se llama directamente (sin un objeto explícito delante), `this` se refiere al objeto global (`window` en navegadores, `undefined` en modo estricto). Este es el caso más común de "sorpresa" para los desarrolladores.
2.  **Llamada como Método (Object Method):** Cuando una función normal se llama como un método de un objeto (es decir, `objeto.metodo()`), `this` se refiere al objeto al que pertenece el método en ese momento. Esto es muy útil para que los métodos puedan acceder a las propiedades de su propio objeto.
3.  **Llamada con `call()`, `apply()`, `bind()`:** Estos métodos especiales te permiten establecer explícitamente el valor de `this` para una función.
    * `call()` y `apply()` ejecutan la función inmediatamente, pasando el primer argumento como el `this` deseado. `apply()` toma los argumentos en un array, mientras que `call()` los toma individualmente.
    * `bind()` crea una nueva función que ya tiene `this` fijado al valor que le pasaste, sin ejecutarla de inmediato.

Comprender estas diferencias es crucial para manejar correctamente el contexto en tu código y evitar comportamientos inesperados de `this`.
''',
    'code_example': r'''
// --- 1. Llamada Simple a Función (Global Context) ---
function mostrarThisGlobal() {
  console.log("--- En función normal (contexto global) ---");
  console.log(this); // En navegador: Window object; En Node.js (modo no estricto): Global object; En modo estricto: undefined
}
mostrarThisGlobal();

// Modo estricto (strict mode) cambia el comportamiento del 'this' global
// 'use strict';
// function mostrarThisGlobalEstricto() {
//   console.log("--- En función normal (contexto global - strict mode) ---");
//   console.log(this); // Salida: undefined
// }
// mostrarThisGlobalEstricto();


// --- 2. En Métodos de Objetos ---
const persona = {
  nombre: "Alice",
  saludar: function() {
    console.log("--- En método de objeto (función normal) ---");
    console.log(`Hola, mi nombre es ${this.nombre}`); // 'this' se refiere a 'persona'
  },
  presentar: function() {
    console.log(`Presentando: ${this.nombre}`);
    // Problema común: Si se anida una función normal sin cuidado, 'this' se pierde
    function decirNombreCompleto() {
      // Aquí, 'this' NO es 'persona', sino el objeto global (o undefined en strict mode)
      console.log(`¡Cuidado! Mi nombre completo es ${this.nombre} (esto es un problema)`);
    }
    decirNombreCompleto(); // Llamada simple, 'this' se enlaza al global
  }
};

persona.saludar(); // Salida: Hola, mi nombre es Alice
persona.presentar();
// Salida: ¡Cuidado! Mi nombre completo es undefined (o el nombre del objeto global si existe)

// --- 3. Con call(), apply(), bind() ---
const otraPersona = {
  nombre: "Bob"
};

// Usando call() para cambiar el contexto de 'this'
persona.saludar.call(otraPersona); // Salida: Hola, mi nombre es Bob

// Usando apply()
function mostrarInfo(edad, ciudad) {
  console.log(`Soy ${this.nombre}, tengo ${edad} años y vivo en ${ciudad}.`);
}
mostrarInfo.apply(otraPersona, [30, "Nueva York"]); // Salida: Soy Bob, tengo 30 años y vivo en Nueva York.

// Usando bind() para crear una nueva función con 'this' fijado
const saludarAlice = persona.saludar.bind(persona);
saludarAlice(); // Salida: Hola, mi nombre es Alice

const presentarBob = persona.presentar.bind(otraPersona);
presentarBob(); // Aunque 'presentar' tiene el problema de anidamiento, con bind fijamos 'this' en 'presentar'
/* Salida:
Presentando: Bob
¡Cuidado! Mi nombre completo es undefined (o el nombre del objeto global si existe)
(Nota: El problema del 'this' anidado persiste, ya que bind solo afecta al 'this' de la función 'presentar' misma, no de sus funciones internas no-flecha)
*/

// Solución al problema de 'this' en funciones anidadas (antigua práctica)
const personaConSolucion = {
  nombre: "Carlos",
  presentarMejor: function() {
    const self = this; // Capturar 'this' en una variable
    console.log(`Presentando mejor: ${self.nombre}`);
    function decirNombreCompletoMejor() {
      console.log(`Mi nombre completo es ${self.nombre} (¡Solucionado!)`); // Accede a 'self'
    }
    decirNombreCompletoMejor();
  }
};
personaConSolucion.presentarMejor();
/* Salida:
Presentando mejor: Carlos
Mi nombre completo es Carlos (¡Solucionado!)
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 2,
    'tittle_level': 'Funciones Avanzadas y this',
    'topic': 'this en distintos contextos',
    'subtopic': 'En funciones flecha',
    'definition': r'''
Las funciones flecha (`=>`) introducidas en ES6 cambiaron significativamente el comportamiento de `this`. A diferencia de las funciones normales, las funciones flecha **no tienen su propio `this`**. En su lugar, el valor de `this` dentro de una función flecha se determina **léxicamente**, es decir, `this` se refiere al `this` del ámbito que la envuelve (su ámbito padre inmediato).

Vamos a ver de qué se trata todo esto...

Esta característica es una de las principales razones para usar funciones flecha, ya que resuelve el problema común de "perder" el contexto de `this` que a menudo ocurría con las funciones normales, especialmente en callbacks o funciones anidadas. Para una función flecha, el `this` es el mismo que el `this` de la función o script que la contiene, y no puede ser modificado por `call()`, `apply()` o `bind()`.

Esto significa que:
* Si una función flecha se define en el ámbito global, `this` será el objeto global (`window` o `global`).
* Si una función flecha se define dentro de un método de un objeto (que es una función normal), `this` dentro de la función flecha será el objeto que llama a ese método.
* Si una función flecha se define dentro de otra función flecha, `this` se "propagará" de la misma manera.

El `this` léxico de las funciones flecha las hace ideales para callbacks, métodos de clases o cualquier situación donde se necesita preservar el contexto de `this` de la función o el objeto contenedor.
''',
    'code_example': r'''
// --- 1. Función Flecha en el Contexto Global ---
const globalArrow = () => {
  console.log("--- En función flecha (contexto global) ---");
  console.log(this); // En navegador: Window object; En Node.js: {} (objeto vacío, pero sigue siendo el 'this' global de Node)
};
globalArrow();

// --- 2. Función Flecha como Método de Objeto ---
// (No es su uso principal, pero muestra el enlace léxico)
const coche = {
  marca: "Tesla",
  velocidad: 0,
  acelerar: () => {
    // ¡Cuidado! 'this' aquí no es 'coche', sino el ámbito global
    console.log("--- En método de objeto (función flecha - mal uso como método principal) ---");
    console.log(`Acelerando ${this.marca} (incorrecto): ${this.velocidad++}`); // this.marca será undefined
  },
  // La forma correcta de un método de objeto es con función normal o sintaxis de método ES6
  frenar() { // Sintaxis de método ES6, es una función normal en cuanto a 'this'
    console.log("--- En método de objeto (función normal - correcto) ---");
    console.log(`Frenando ${this.marca}. Velocidad actual: ${this.velocidad--}`);
  }
};

coche.acelerar(); // Salida: Acelerando undefined (incorrecto). Velocidad actual: NaN
coche.frenar();   // Salida: Frenando Tesla. Velocidad actual: -1 (asumiendo que this.velocidad existe)


// --- 3. Función Flecha Anidada (el caso de uso estrella) ---
const jugador = {
  nombre: "Messi",
  goles: 0,
  marcarGolConRetraso: function() { // Función normal para capturar el 'this' del objeto 'jugador'
    console.log("--- Función flecha anidada (uso común y correcto) ---");
    console.log(`Jugador: ${this.nombre}`); // 'this' es 'jugador' aquí

    setTimeout(() => { // Función flecha como callback
      // 'this' aquí es el mismo 'this' de la función 'marcarGolConRetraso'
      // es decir, 'this' sigue siendo el objeto 'jugador'
      this.goles++;
      console.log(`${this.nombre} ha marcado un gol. Goles totales: ${this.goles}`);
    }, 1000);
  }
};

jugador.marcarGolConRetraso();
// Después de 1 segundo: Salida: Messi ha marcado un gol. Goles totales: 1

// Compara con una función normal anidada (problema clásico)
const entrenador = {
  nombre: "Pep",
  equipos: [],
  contratarEquipo: function(nombreEquipo) {
    console.log(`Entrenador: ${this.nombre}`);
    setTimeout(function() { // Función normal como callback
      // 'this' aquí no es 'entrenador', sino el objeto global (o undefined en strict mode)
      // Por eso, this.equipos causará un error o comportamiento inesperado
      // this.equipos.push(nombreEquipo); // Esto fallaría
      console.log(`¡Error común! 'this' dentro del callback normal no es el entrenador. ${this}`);
    }, 500);
  }
};

entrenador.contratarEquipo("Barcelona");
// Después de 0.5 segundos: Salida: ¡Error común! 'this' dentro del callback normal no es el entrenador. [object Window] (o undefined)
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 2,
    'tittle_level': 'Funciones Avanzadas y this',
    'topic': 'this en distintos contextos',
    'subtopic': 'En métodos de objetos',
    'definition': r'''
Cuando una función se define como una propiedad de un objeto y se llama utilizando la notación de punto (`objeto.metodo()`), se convierte en un **método de objeto**. En este escenario, el valor de `this` dentro de ese método se enlaza directamente al objeto al que pertenece el método. Esta es una de las formas más intuitivas y comunes de usar `this`.

¿No sé tú, pero a mí esto al principio me costó? 

Pues bien, la regla es sencilla: si llamas a una función a través de un objeto (como `miCoche.encender()`), entonces `this` dentro de `encender()` será `miCoche`. Esto permite que el método acceda y manipule las propiedades de ese objeto en particular. Es como si el método dijera: "Estoy trabajando para este objeto".

Es importante destacar que el valor de `this` no se basa en cómo se define el método (si es una función normal o una función flecha, aunque las funciones flecha tienen un comportamiento especial, como vimos). Se basa en el objeto que *llama* al método. Si tomas un método de un objeto y lo asignas a una variable, y luego llamas a esa variable como una función independiente, el `this` cambiará porque la llamada ya no está vinculada al objeto original.

Pensemos por un momento en cómo esto es crucial en el desarrollo: los métodos de los objetos son la base de la programación orientada a objetos en JavaScript. Permiten que los objetos tengan comportamientos que interactúan con sus propios datos internos, lo que conduce a un código más organizado y modular.
''',
    'code_example': r'''
// --- 1. Método de Objeto con Función Normal (Comportamiento Estándar) ---
const usuario = {
  nombre: "Diana",
  edad: 28,
  presentarse: function() {
    console.log("--- En método de objeto (función normal) ---");
    console.log(`Hola, soy ${this.nombre} y tengo ${this.edad} años.`);
  },
  actualizarEdad: function(nuevaEdad) {
    this.edad = nuevaEdad; // 'this' se refiere al objeto 'usuario'
    console.log(`${this.nombre} ahora tiene ${this.edad} años.`);
  }
};

usuario.presentarse();     // Salida: Hola, soy Diana y tengo 28 años.
usuario.actualizarEdad(29); // Salida: Diana ahora tiene 29 años.

// --- 2. Método de Objeto con Sintaxis Corta de ES6 (Equivalente a función normal para 'this') ---
const producto = {
  nombre: "Laptop",
  precio: 1200,
  mostrarDetalles() { // Sintaxis corta de método
    console.log("--- En método de objeto (sintaxis corta ES6) ---");
    console.log(`Producto: ${this.nombre}, Precio: $${this.precio}`);
  }
};

producto.mostrarDetalles(); // Salida: Producto: Laptop, Precio: $1200

// --- 3. Problema: Extracción de un método ---
// Cuando extraes un método de un objeto, pierde su contexto 'this' original
const miPresentacion = usuario.presentarse;
console.log("\n--- Método extraído del objeto (¡'this' perdido!) ---");
miPresentacion(); // Aquí, 'this' ya no es 'usuario', sino el objeto global (o undefined en strict mode)
// Salida: Hola, soy undefined y tengo undefined años.

// Solución al método extraído: Usar bind()
const presentarseVinculado = usuario.presentarse.bind(usuario);
console.log("\n--- Método extraído y vinculado con bind() ---");
presentarseVinculado(); // Salida: Hola, soy Diana y tengo 29 años.

// --- 4. Método de Objeto con Función Flecha (Uso inadecuado como método directo) ---
// Aunque se puede, no es idiomático ni suele ser correcto para métodos principales
const vehiculo = {
  tipo: "Coche",
  arrancar: () => { // Esto es una función flecha
    console.log("--- En método de objeto (función flecha - mal uso como método principal) ---");
    // 'this' aquí se enlaza léxicamente al ámbito GLOBAL, no al objeto 'vehiculo'
    console.log(`Arrancando el ${this.tipo} (incorrecto)`); // this.tipo será undefined
  }
};

vehiculo.arrancar(); // Salida: Arrancando el undefined (incorrecto)
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 2,
    'tittle_level': 'Funciones Avanzadas y this',
    'topic': 'this en distintos contextos',
    'subtopic': 'En eventos del DOM',
    'definition': r'''
Cuando trabajamos con eventos del DOM (Document Object Model), como clics, pases del ratón o envíos de formularios, el valor de `this` dentro de la función manejadora de eventos adquiere un significado particular.

¿Seguramente te estarás preguntando de qué va todo esto?

Pues bien, en la mayoría de los casos al adjuntar una función normal como *event listener* (manejador de eventos), el valor de `this` dentro de esa función se refiere al **elemento del DOM al que está adjunto el evento**. Esto es increíblemente útil porque te permite acceder directamente a las propiedades y métodos del elemento que disparó el evento. Por ejemplo, si tienes un botón y le añades un evento de clic, `this` dentro de la función de clic será ese mismo botón.

Este comportamiento es por diseño y sigue la regla de la "llamada como método" que vimos antes, donde el navegador internamente llama a tu función de manejador de eventos como un método del elemento DOM.

Sin embargo, hay que tener cuidado:
* Si usas una **función flecha** como manejador de eventos, `this` no se enlazará al elemento DOM. En su lugar, se enlazará léxicamente al `this` del contexto donde la función flecha fue definida. Esto a menudo significa que `this` será el objeto global (`window`), lo cual es un comportamiento no deseado si esperabas acceder al elemento.
* Si la función de manejador de eventos se pasa a un método como `call()`, `apply()` o `bind()`, entonces el `this` se establecerá de acuerdo a esos métodos, anulando el comportamiento por defecto del DOM.

Pensemos por un momento en un escenario común: necesitas cambiar el texto o el estilo del botón que acabas de hacer clic. Sin el `this` que apunta al elemento, tendrías que pasar el elemento como argumento, lo que sería más engorroso. El `this` en eventos DOM simplifica mucho esta tarea.
''',
    'code_example': r'''
// Asumiendo que tenemos el siguiente HTML:
// <button id="miBoton">Haz clic aquí</button>
// <div id="miDiv">Contenido del Div</div>

// --- 1. Función Normal como Manejador de Eventos (Uso Común y Correcto) ---
const miBoton = document.getElementById('miBoton');

function manejarClicNormal() {
  console.log("--- En función normal (manejador de eventos) ---");
  console.log("El elemento que disparó el evento es:", this); // 'this' es el botón
  this.textContent = "¡Clickeado!"; // Cambia el texto del botón
  this.style.backgroundColor = "lightblue";
}

miBoton.addEventListener('click', manejarClicNormal);

// --- 2. Función Flecha como Manejador de Eventos (Cuidado con 'this') ---
const miDiv = document.getElementById('miDiv');

miDiv.addEventListener('click', () => {
  console.log("--- En función flecha (manejador de eventos) ---");
  console.log("El elemento que disparó el evento es:", this); // 'this' es el objeto global (Window)
  // this.textContent = "¡Clickeado el div!"; // Esto NO funcionará como se espera (se aplica a Window)
  // this.style.backgroundColor = "lightcoral"; // Esto NO funcionará
});

// Para acceder al elemento del DOM dentro de una función flecha en un evento,
// generalmente se usa el argumento 'event.target' o se captura el elemento externo.
miDiv.addEventListener('mouseover', (event) => {
  console.log("--- En función flecha (accediendo con event.target) ---");
  console.log("El elemento que disparó el evento es:", event.target); // 'event.target' es el div
  event.target.style.backgroundColor = "yellow";
});

miDiv.addEventListener('mouseout', (event) => {
  event.target.style.backgroundColor = ""; // Volver al color original
});


// --- 3. Ejemplo con Múltiples Elementos (ilustra la utilidad de 'this') ---
// Asumiendo que tenemos:
// <button class="btn-item">Item 1</button>
// <button class="btn-item">Item 2</button>
// <button class="btn-item">Item 3</button>

const botonesItem = document.querySelectorAll('.btn-item');

botonesItem.forEach(boton => {
  boton.addEventListener('click', function() { // Usamos función normal aquí
    console.log(`\n--- Click en botón de item ---`);
    console.log(`Hiciste clic en: ${this.textContent}`); // 'this' es el botón clickeado
    this.style.fontWeight = 'bold';
  });
});

// Ejemplo incorrecto de 'this' en un bucle con función flecha para un listener
// Si usáramos una flecha aquí, 'this' no sería el botón, sino 'window'
// botonesItem.forEach(boton => {
//   boton.addEventListener('click', () => {
//     // console.log(`Hiciste clic en: ${this.textContent}`); // Error: this.textContent es undefined
//     console.log(`Hiciste clic en: ${boton.textContent}`); // Correcto si usamos 'boton' (la variable del closure)
//   });
// });
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 2,
    'tittle_level': 'Funciones Avanzadas y this',
    'topic': 'Manipulación de contexto',
    'subtopic': 'Uso de call()',
    'definition': r'''
El método `call()` es una herramienta poderosa en JavaScript que te permite invocar una función con un valor de `this` especificado y argumentos pasados individualmente. Es una forma directa de tomar el control del contexto de una función.

¿Te estás preguntando por qué esto importa?

Pues bien, como hemos visto, el valor de `this` en funciones normales es dinámico y depende de cómo se llama la función. Sin embargo, hay situaciones en las que necesitas que una función se ejecute como si fuera un método de un objeto diferente al que está naturalmente asociada, o incluso sin ningún objeto en particular, pero con un `this` predefinido. `call()` te da esa flexibilidad.

La sintaxis es `funcion.call(thisArg, arg1, arg2, ...)`.
* `thisArg`: El valor que se usará como `this` dentro de la función cuando se ejecute. Si pasas `null` o `undefined` (y no estás en modo estricto), `this` se convertirá al objeto global (`window` en navegadores).
* `arg1, arg2, ...`: Son los argumentos que se le pasan a la función, uno por uno, separados por comas.

Pensemos por un momento en la analogía de "pedir prestado" un método. Si tienes un método `presentarse` en un objeto `persona`, pero quieres que otro objeto `animal` lo use para presentarse a sí mismo, `call()` es la herramienta perfecta. También es útil cuando quieres aplicar una función a un objeto tipo array (como un `NodeList` del DOM) que no tiene todos los métodos de un array nativo. `call()` ejecuta la función de inmediato.
''',
    'code_example': r'''
// Objeto base
const persona = {
  nombre: "Carlos",
  saludar: function(saludo, despedida) {
    console.log(`${saludo}, soy ${this.nombre}. ${despedida}`);
  }
};

// Objeto diferente
const robot = {
  nombre: "WALL-E",
  modelo: "A-113"
};

console.log("--- Uso básico de call() ---");
persona.saludar("Hola", "Encantado de conocerte."); // Llamada normal

// Usar el método 'saludar' de 'persona' para el objeto 'robot'
persona.saludar.call(robot, "Saludos", "Hasta la vista, baby.");
// Salida: Saludos, soy WALL-E. Hasta la vista, baby.
// Aquí, 'this' dentro de 'saludar' se convirtió en 'robot'.

// --- call() con una función que no es un método de objeto ---
function describirYo(profesion, hobby) {
  console.log(`Mi nombre es ${this.nombre}, soy ${profesion} y me gusta ${hobby}.`);
}

const desarrollador = { nombre: "Ana" };
const artista = { nombre: "Pedro" };

console.log("\n--- Usando call() con funciones independientes ---");
describirYo.call(desarrollador, "desarrolladora", "leer");
// Salida: Mi nombre es Ana, soy desarrolladora y me gusta leer.

describirYo.call(artista, "artista", "pintar");
// Salida: Mi nombre es Pedro, soy artista y me gusta pintar.

// --- call() para usar métodos de Array en objetos tipo array (ej: NodeList) ---
// Supongamos que tienes un NodeList del DOM: const divs = document.querySelectorAll('div');
// Divs no tiene directamente el método 'forEach' de Array.prototype, pero puedes "prestárselo".
// Este ejemplo simula un objeto tipo array:
const miColeccion = {
  0: 'itemA',
  1: 'itemB',
  2: 'itemC',
  length: 3
};

console.log("\n--- call() para 'prestar' métodos ---");
Array.prototype.forEach.call(miColeccion, function(item, index) {
  console.log(`Elemento ${index}: ${item}`);
});
/* Salida:
Elemento 0: itemA
Elemento 1: itemB
Elemento 2: itemC
*/

// --- call() con 'thisArg' null o undefined (modo no estricto -> objeto global) ---
function mostrarThis() {
  console.log("--- this con call(null) en modo no estricto ---");
  console.log(this === window); // true en navegador
  console.log(this === global); // true en Node.js
}
mostrarThis.call(null);

// En modo estricto, this sería undefined
// 'use strict';
// function mostrarThisStrict() {
//   console.log("--- this con call(null) en modo estricto ---");
//   console.log(this); // undefined
// }
// mostrarThisStrict.call(null);
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 2,
    'tittle_level': 'Funciones Avanzadas y this',
    'topic': 'Manipulación de contexto',
    'subtopic': 'Uso de apply()',
    'definition': r'''
Similar a `call()`, el método `apply()` también te permite invocar una función con un valor de `this` específico. La principal diferencia radica en cómo le pasas los argumentos a la función: mientras `call()` los recibe de forma individual, `apply()` espera que los argumentos se le proporcionen como un **array o un objeto tipo array**.

¿Te estás preguntando por qué esto importa?

Pues bien, `apply()` es particularmente útil cuando no sabes de antemano cuántos argumentos le vas a pasar a una función, o cuando ya tienes los argumentos en una estructura de array. Esto lo hace muy flexible para escenarios donde los argumentos son dinámicos o provienen de una fuente como un array ya existente.

La sintaxis es `funcion.apply(thisArg, [argsArray])`.
* `thisArg`: El valor que se usará como `this` dentro de la función, al igual que en `call()`.
* `[argsArray]`: Un array o un objeto tipo array que contiene los argumentos que se pasarán a la función.

Pensemos por un momento en una función que calcula la suma de varios números, pero los números vienen en un array. O si tienes un método que esperas que reciba una lista variable de parámetros. `apply()` se convierte en tu aliado perfecto para estos casos, eliminando la necesidad de desestructurar manualmente el array de argumentos. Es una herramienta poderosa para manejar funciones variádicas de una manera controlada.
''',
    'code_example': r'''
// Objeto base
const jugador = {
  nombre: "Lionel",
  puntuacion: 0,
  sumarPuntos: function(puntosNuevos) {
    // 'arguments' es un objeto tipo array con todos los argumentos pasados
    const totalPuntosSumados = Array.from(arguments).reduce((acc, curr) => acc + curr, 0);
    this.puntuacion += totalPuntosSumados;
    console.log(`${this.nombre} ha sumado ${totalPuntosSumados} puntos. Puntuación total: ${this.puntuacion}`);
  }
};

// Objeto diferente
const equipo = {
  nombre: "Los Campeones",
  puntuacion: 0
};

console.log("--- Uso de apply() con argumentos en array ---");
// La función 'sumarPuntos' espera argumentos individuales,
// pero con apply podemos pasar un array
jugador.sumarPuntos.apply(jugador, [10, 5, 20]);
// Salida: Lionel ha sumado 35 puntos. Puntuación total: 35

// Usar el método 'sumarPuntos' de 'jugador' para el objeto 'equipo'
const puntosParaEquipo = [50, 10, 5];
jugador.sumarPuntos.apply(equipo, puntosParaEquipo);
// Salida: Los Campeones ha sumado 65 puntos. Puntuación total: 65
// Aquí, 'this' dentro de 'sumarPuntos' se convirtió en 'equipo'.

// --- apply() para encontrar el máximo/mínimo en un array (uso clásico) ---
const numeros = [10, 5, 20, 15, 30];

// Math.max no acepta un array directamente como argumentos, solo argumentos individuales
// Math.max(numeros) // Esto daría NaN

console.log("\n--- Usando apply() para Math.max/min ---");
const maxNumero = Math.max.apply(null, numeros); // 'null' porque Math no necesita un 'this' específico
console.log(`Máximo número: ${maxNumero}`); // Salida: 30

const minNumero = Math.min.apply(null, numeros);
console.log(`Mínimo número: ${minNumero}`); // Salida: 5

// Nota: Con ES6, esto se puede hacer con el operador spread (...)
const maxNumeroSpread = Math.max(...numeros);
console.log(`Máximo número (con spread): ${maxNumeroSpread}`); // Salida: 30

// --- apply() para concatenar arrays (en versiones antiguas de JS) ---
const array1 = [1, 2, 3];
const array2 = [4, 5, 6];

// Array.prototype.push.apply(array1, array2); // Concatena array2 en array1
// console.log("Array concatenado con apply:", array1); // Salida: [1, 2, 3, 4, 5, 6]

// Nota: Hoy en día, se usa [...array1, ...array2] o array1.concat(array2)

// Diferencia clave entre call y apply en un ejemplo
function infoPersonal(ciudad, ocupacion) {
  console.log(`Hola, soy ${this.nombre}, de ${ciudad} y soy ${ocupacion}.`);
}

const personaje = { nombre: "María" };

console.log("\n--- Comparación call() vs apply() ---");
infoPersonal.call(personaje, "Lima", "Ingeniera"); // Argumentos individuales
// Salida: Hola, soy María, de Lima y soy Ingeniera.

infoPersonal.apply(personaje, ["Madrid", "Doctora"]); // Argumentos en un array
// Salida: Hola, soy María, de Madrid y soy Doctora.
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 2,
    'tittle_level': 'Funciones Avanzadas y this',
    'topic': 'Manipulación de contexto',
    'subtopic': 'Enlace permanente con bind()',
    'definition': r'''
A diferencia de `call()` y `apply()` que ejecutan una función inmediatamente, el método `bind()` crea una **nueva función** cuyo `this` está permanentemente enlazado al valor que le pasas como primer argumento. Esta nueva función "vinculada" puede ser invocada en cualquier momento, y su `this` siempre será el que especificaste.

¿No sé tú, pero a mí esto al principio me costó? 

La clave es que `bind()` no ejecuta la función original; simplemente te devuelve una versión de esa función donde el `this` ya está fijado. Esto es increíblemente útil para situaciones donde necesitas pasar una función a un callback o a un event listener, pero quieres asegurarte de que conserve su contexto `this` original cuando se ejecute.

La sintaxis es `funcion.bind(thisArg, arg1, arg2, ...)`.
* `thisArg`: El valor que se usará como `this` en la nueva función.
* `arg1, arg2, ...`: Opcionalmente, puedes pasar argumentos adicionales. Estos argumentos se "pre-rellenarán" en la nueva función, lo que se conoce como *currying* o aplicación parcial. La nueva función siempre recibirá estos argumentos, seguidos de cualquier argumento que se le pase en el momento de la llamada.

Pensemos por un momento en componentes de UI o clases. A menudo, necesitas que los métodos de tus objetos se ejecuten con el `this` correcto cuando son pasados como callbacks (por ejemplo, a `setTimeout`, `addEventListener`, o a otros componentes). `bind()` resuelve elegantemente este problema, asegurando que tus funciones siempre tengan el contexto correcto sin importar cómo o dónde se les llame.
''',
    'code_example': r'''
// Objeto con un método
const contador = {
  valor: 0,
  incrementar: function() {
    this.valor++;
    console.log(`Valor actual: ${this.valor}`);
  }
};

contador.incrementar(); // Salida: Valor actual: 1

// --- 1. Problema sin bind(): 'this' se pierde en setTimeout ---
console.log("\n--- Problema con setTimeout sin bind() ---");
// setTimeout llama a la función en el contexto global (window), no el objeto 'contador'
// setTimeout(contador.incrementar, 1000); // Esto resultaría en NaN o error si 'this' fuera window.valor

// --- 2. Solución con bind(): Enlace permanente del 'this' ---
console.log("\n--- Solución con bind() en setTimeout ---");
const incrementarConBind = contador.incrementar.bind(contador);
setTimeout(incrementarConBind, 1000); // Después de 1 seg: Salida: Valor actual: 2 (correctamente)

// --- 3. bind() en Event Listeners ---
// Asumiendo que tenemos: <button id="btnClick">Haz clic para sumar</button>
const boton = document.getElementById('btnClick');

// Si no existiera el botón, este bloque de código no causaría error.
if (boton) {
  // 'this' dentro de esta función ANÓNIMA es el botón,
  // pero el 'this' de 'contador.incrementar' queremos que sea 'contador'
  boton.addEventListener('click', contador.incrementar.bind(contador));
  // Cada vez que hagas clic, 'this' en 'incrementar' será 'contador'.
} else {
  console.log("\n(Botón con id 'btnClick' no encontrado en el DOM para ejemplo de evento)");
}


// --- 4. bind() con argumentos pre-rellenados (Currying / Aplicación Parcial) ---
function multiplicar(a, b) {
  console.log(`\n--- Multiplicar con this: ${this?.contexto || 'Global'}`);
  return a * b;
}

const obj = { contexto: 'MiObjeto' };

// Creamos una nueva función donde 'this' es 'obj' y 'a' ya es 2
const duplicarEnContexto = multiplicar.bind(obj, 2);

console.log("Resultado de duplicarEnContexto(5):", duplicarEnContexto(5)); // Salida: 10
// Aunque llamamos con un solo argumento (5), '2' ya estaba fijado como 'a'.

// Otro ejemplo de pre-rellenado
const suma = function(a, b, c) {
  return this.prefijo + (a + b + c);
};

const miContexto = { prefijo: "Resultado: " };

const sumaParcial = suma.bind(miContexto, 10, 20); // 'a' es 10, 'b' es 20, 'this' es miContexto
console.log("Suma parcial:", sumaParcial(5)); // Salida: Resultado: 35 (10 + 20 + 5)
'''
  });
}

Future<void> insertJsMidLevel3Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 3,
    'tittle_level': 'Asincronía',
    'topic': 'Event Loop',
    'subtopic': 'Call stack',
    'definition': r'''
El **Call Stack** (pila de llamadas) es una estructura de datos que JavaScript utiliza para mantener un registro del orden en que se ejecutan las funciones en tu código. Es un mecanismo fundamental para entender cómo JavaScript procesa las llamadas a funciones de manera síncrona.

¿Te estás preguntando por qué esto importa?

Pues bien, pensemos en el Call Stack como una pila de platos: cuando una función se llama, se "apila" en la parte superior. Cuando esa función termina de ejecutarse, se "desapila" y se elimina de la pila. JavaScript siempre ejecuta la función que está en la parte superior de la pila. Si una función llama a otra función, esta segunda se apila encima de la primera, y así sucesivamente.

JavaScript es un lenguaje de un solo hilo (single-threaded), lo que significa que solo puede hacer una cosa a la vez. El Call Stack es el responsable de gestionar ese flujo de ejecución. Si una función tarda mucho en ejecutarse, "bloqueará" el Call Stack, impidiendo que cualquier otra cosa se ejecute, lo que puede llevar a una interfaz de usuario no responsiva (el famoso "Script unresponsive").

Comprender el Call Stack es el primer paso para entender cómo JavaScript maneja la asincronía, ya que los mecanismos asíncronos trabajan *fuera* de este flujo principal para evitar que se bloquee.
''',
    'code_example': r'''
// --- Ejemplo simple de Call Stack ---
function funcionC() {
  console.log("Iniciando función C");
  // La función C no llama a ninguna otra, así que se desapila
  console.log("Terminando función C");
}

function funcionB() {
  console.log("Iniciando función B");
  funcionC(); // Llama a función C, C se apila encima de B
  console.log("Terminando función B");
}

function funcionA() {
  console.log("Iniciando función A");
  funcionB(); // Llama a función B, B se apila encima de A
  console.log("Terminando función A");
}

console.log("Comienzo del programa");
funcionA(); // Llama a función A, A se apila
console.log("Fin del programa");

/*
Orden de ejecución y pila de llamadas (Call Stack):

1. `console.log("Comienzo del programa")`
   - Stack: [anonymous] (código global)

2. `funcionA()`
   - Stack: [anonymous] -> funcionA

3. `console.log("Iniciando función A")`
   - Stack: [anonymous] -> funcionA

4. `funcionB()`
   - Stack: [anonymous] -> funcionA -> funcionB

5. `console.log("Iniciando función B")`
   - Stack: [anonymous] -> funcionA -> funcionB

6. `funcionC()`
   - Stack: [anonymous] -> funcionA -> funcionB -> funcionC

7. `console.log("Iniciando función C")`
   - Stack: [anonymous] -> funcionA -> funcionB -> funcionC

8. `console.log("Terminando función C")`
   - Stack: [anonymous] -> funcionA -> funcionB -> funcionC

9. `funcionC` termina y se desapila
   - Stack: [anonymous] -> funcionA -> funcionB

10. `console.log("Terminando función B")`
    - Stack: [anonymous] -> funcionA -> funcionB

11. `funcionB` termina y se desapila
    - Stack: [anonymous] -> funcionA

12. `console.log("Terminando función A")`
    - Stack: [anonymous] -> funcionA

13. `funcionA` termina y se desapila
    - Stack: [anonymous]

14. `console.log("Fin del programa")`
    - Stack: [anonymous]

15. El código global termina y se desapila
    - Stack: Vacío
*/

// --- Ejemplo de bloqueo del Call Stack (bloqueo del hilo principal) ---
function bloqueaCallStack() {
  let i = 0;
  // Este bucle se ejecuta muchísimas veces y bloquea el hilo
  while (i < 1000000000) { // Un número muy grande
    i++;
  }
  console.log("Función bloqueante terminada.");
}

console.log("\nIntentando llamar a función bloqueante...");
// Si ejecutas esto en un navegador, la página se "congelará"
// y el siguiente console.log no se ejecutará hasta que el bucle termine.
// bloqueaCallStack();
console.log("¡Programa sigue (si no se bloqueó antes)!");
// En un navegador, este mensaje aparecería después de un retraso perceptible
// o incluso después de un aviso de "script unresponsive".
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 3,
    'tittle_level': 'Asincronía',
    'topic': 'Event Loop',
    'subtopic': 'Callback queue',
    'definition': r'''
Mientras el Call Stack maneja las operaciones síncronas, la **Callback Queue** (también conocida como Task Queue o Message Queue) es donde se alojan las funciones asíncronas una vez que su operación externa ha completado y están listas para ser ejecutadas por el motor de JavaScript.

Vamos a ver de qué se trata todo esto...

Pensemos en la Callback Queue como una sala de espera VIP para las funciones. Cuando inicias una operación asíncrona (como un `setTimeout`, una petición `Workspace`, o un evento del DOM), esa operación no se ejecuta en el Call Stack principal. En su lugar, el JavaScript le dice al entorno (navegador o Node.js) que la maneje. Una vez que la operación asíncrona termina (por ejemplo, el `setTimeout` cumple su tiempo, o la petición de red regresa con datos), su función de callback **no va directamente al Call Stack**. Primero, se coloca en la Callback Queue.

Aquí es donde entra en juego el Event Loop. El Event Loop está constantemente monitoreando tanto el Call Stack como la Callback Queue. Solo cuando el **Call Stack está completamente vacío** (es decir, no hay código síncrono ejecutándose), el Event Loop toma la primera función de la Callback Queue y la mueve al Call Stack para que se ejecute.

Esta interacción entre el Call Stack, la Callback Queue y el Event Loop es lo que permite a JavaScript manejar operaciones que llevan tiempo (como la red o temporizadores) sin bloquear el hilo principal de ejecución, manteniendo la interfaz de usuario responsiva.
''',
    'code_example': r'''
console.log("1. Inicio del script.");

setTimeout(function callback1() {
  // Esta función se ejecuta después de que el temporizador (0 ms) expire
  // y cuando el Call Stack esté vacío.
  console.log("4. Callback de setTimeout (0ms).");
}, 0);

setTimeout(function callback2() {
  console.log("5. Callback de setTimeout (100ms).");
}, 100);

fetch('https://jsonplaceholder.typicode.com/todos/1') // Simula una petición de red
  .then(response => response.json())
  .then(json => {
    // Esta función también es un callback y se coloca en la Callback Queue
    // (o Microtask Queue, dependiendo de la implementación de promesas)
    console.log("6. Callback de Fetch completado:", json.title);
  })
  .catch(error => console.error("Error en Fetch:", error));

console.log("2. Código síncrono intermedio.");

function funcionPesada() {
  let i = 0;
  // Bucle síncrono que bloquea el Call Stack temporalmente
  while (i < 100000000) { // Un número significativo pero no congelante
    i++;
  }
  console.log("3. Función pesada síncrona terminada.");
}

funcionPesada();

console.log("7. Fin del script principal.");

/*
Orden de salida y flujo:

1.  "1. Inicio del script." (Ejecución síncrona, Call Stack)
2.  `setTimeout(callback1, 0)` se registra. El callback1 va a la Web API / Node.js Timer.
3.  `setTimeout(callback2, 100)` se registra. El callback2 va a la Web API / Node.js Timer.
4.  `Workspace()` se inicia. La promesa va a la Web API / Node.js Environment.
5.  "2. Código síncrono intermedio." (Ejecución síncrona, Call Stack)
6.  `funcionPesada()` se llama. (Ejecución síncrona, Call Stack)
7.  `funcionPesada()` termina. "3. Función pesada síncrona terminada." (Ejecución síncrona, Call Stack)
8.  "7. Fin del script principal." (Ejecución síncrona, Call Stack)

En este punto, el Call Stack está vacío. El Event Loop entra en acción.

9.  El temporizador de `callback1` (0ms) ha expirado. `callback1` se mueve de la Web API a la **Callback Queue**.
10. El temporizador de `callback2` (100ms) expira. `callback2` se mueve a la **Callback Queue**.
11. La petición de `Workspace` ha completado. Su callback `.then()` se mueve a la **Microtask Queue** (que tiene mayor prioridad que la Callback Queue).

El Event Loop verifica la Microtask Queue PRIMERO.
12. La función de `.then()` de `Workspace` se mueve al Call Stack. "6. Callback de Fetch completado..." (Ejecución de Microtask)
13. La función de `.then()` de `Workspace` termina y se desapila.

El Event Loop verifica la Callback Queue (si la Microtask Queue está vacía).
14. `callback1` se mueve al Call Stack. "4. Callback de setTimeout (0ms)." (Ejecución de Macrotask)
15. `callback1` termina y se desapila.

16. `callback2` se mueve al Call Stack. "5. Callback de setTimeout (100ms)." (Ejecución de Macrotask)
17. `callback2` termina y se desapila.

Fin de la ejecución.

Output en consola (aproximado, el fetch puede variar):
1. Inicio del script.
2. Código síncrono intermedio.
3. Función pesada síncrona terminada.
7. Fin del script principal.
6. Callback de Fetch completado: (título del todo)
4. Callback de setTimeout (0ms).
5. Callback de setTimeout (100ms).
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 3,
    'tittle_level': 'Asincronía',
    'topic': 'Event Loop',
    'subtopic': 'Microtasks y macrotasks',
    'definition': r'''
Dentro del Event Loop, JavaScript no trata todas las tareas asíncronas de la misma manera. Hay una distinción crucial entre **Microtasks** y **Macrotasks** (o simplemente Tasks), que determina su prioridad de ejecución. Comprender esta jerarquía es vital para predecir el orden en que se ejecutarán tus callbacks asíncronos.

Vamos a ver de qué se trata todo esto...

Pensemos en ellas como diferentes "filas de espera" para el Call Stack, pero con distintas prioridades:

1.  **Macrotasks (o Tasks):** Esta es la cola "general" o "principal" de callbacks asíncronos. Incluyen cosas como:
    * Callbacks de `setTimeout` y `setInterval`.
    * Callbacks de eventos del DOM (clics, teclado, carga de recursos).
    * Callbacks de `requestAnimationFrame` (aunque se gestionan un poco diferente, suelen considerarse macrotasks).
    * Entrada/Salida (`I/O`) en Node.js.

    El Event Loop procesa una **única macrotask** del Callback Queue cada vez que el Call Stack se vacía. Después de que una macrotask se ejecuta, el Event Loop vacía la cola de microtasks antes de pasar a la siguiente macrotask.

2.  **Microtasks:** Esta es una cola de mayor prioridad. Se introdujeron para manejar de manera más eficiente las promesas. Incluyen:
    * Callbacks de promesas (`.then()`, `.catch()`, `.finally()`).
    * `async/await` (que se basa en promesas).
    * `queueMicrotask()`.
    * `MutationObserver` (para observar cambios en el DOM).

    A diferencia de las macrotasks, el Event Loop vacía **toda la cola de microtasks** cada vez que el Call Stack se vacía y antes de que se procese la siguiente macrotask. Esto significa que las microtasks siempre se ejecutan *antes* de la próxima macrotask.

La distinción entre Microtasks y Macrotasks es fundamental para entender por qué, por ejemplo, un `.then()` de una promesa se ejecuta antes que un `setTimeout(() => {}, 0)`, incluso si ambos parecen tener un retardo de cero. Las microtasks tienen prioridad, garantizando que el estado de las promesas se resuelva y maneje de manera consistente.
''',
    'code_example': r'''
console.log("1. Inicio del script síncrono.");

setTimeout(() => {
  console.log("4. Macrotask (setTimeout 0ms)");
}, 0);

Promise.resolve().then(() => {
  console.log("3. Microtask (Promise.resolve().then())");
});

function syncFunction() {
  console.log("2. Función síncrona intermedia.");
}
syncFunction();

console.log("5. Fin del script síncrono.");

/*
Orden de ejecución (explicación paso a paso):

1.  `console.log("1. Inicio del script síncrono.");`
    - Se ejecuta inmediatamente.
    - Output: "1. Inicio del script síncrono."
    - Call Stack: [syncFunction]

2.  `setTimeout(() => { ... }, 0);`
    - La macrotask `setTimeout` se registra en la Web API (o módulo de temporizadores de Node.js).
    - Después de 0ms, su callback se mueve a la **Macrotask Queue**.
    - Call Stack: [syncFunction]

3.  `Promise.resolve().then(() => { ... });`
    - La promesa se resuelve inmediatamente. Su callback `.then()` se mueve a la **Microtask Queue**.
    - Call Stack: [syncFunction]

4.  `syncFunction();`
    - La función síncrona `syncFunction` se apila y ejecuta.
    - Output: "2. Función síncrona intermedia."
    - Call Stack: [syncFunction]

5.  `syncFunction()` termina y se desapila.
    - Call Stack: Vacío

6.  `console.log("5. Fin del script síncrono.");`
    - Se ejecuta inmediatamente.
    - Output: "5. Fin del script síncrono."
    - Call Stack: Vacío

7.  **El Call Stack está vacío.** El Event Loop entra en acción.
    Primero, el Event Loop verifica y vacía la **Microtask Queue**.
    - La callback de `Promise.then()` se mueve al Call Stack.
    - Output: "3. Microtask (Promise.resolve().then())"
    - Call Stack: [Microtask Callback]
    - La callback de `Promise.then()` termina y se desapila.
    - Call Stack: Vacío. Microtask Queue: Vacía.

8.  Ahora, el Event Loop verifica la **Macrotask Queue**.
    - La callback de `setTimeout()` se mueve al Call Stack.
    - Output: "4. Macrotask (setTimeout 0ms)"
    - Call Stack: [Macrotask Callback]
    - La callback de `setTimeout()` termina y se desapila.
    - Call Stack: Vacío. Macrotask Queue: Vacía.

Fin de la ejecución.

Output final en consola:
1. Inicio del script síncrono.
2. Función síncrona intermedia.
5. Fin del script síncrono.
3. Microtask (Promise.resolve().then())
4. Macrotask (setTimeout 0ms)
*/

// --- Otro ejemplo con anidamiento ---
console.log("\n-- Ejemplo Anidado --");

setTimeout(() => {
  console.log("Macrotask 1");
  Promise.resolve().then(() => {
    console.log("Microtask Anidada por Macrotask 1");
  });
}, 0);

Promise.resolve().then(() => {
  console.log("Microtask 1");
  setTimeout(() => {
    console.log("Macrotask Anidada por Microtask 1");
  }, 0);
});

console.log("Fin del script principal (anidado)");

/*
Orden de salida (anidado):

1.  "Fin del script principal (anidado)" (síncrono)
2.  "Microtask 1" (la primera microtask se ejecuta)
3.  "Macrotask 1" (la primera macrotask se ejecuta después de que las microtasks iniciales se vacíen)
4.  "Microtask Anidada por Macrotask 1" (la microtask generada *dentro* de Macrotask 1)
5.  "Macrotask Anidada por Microtask 1" (la macrotask generada *dentro* de Microtask 1)

Output final en consola para el ejemplo anidado:
Fin del script principal (anidado)
Microtask 1
Macrotask 1
Microtask Anidada por Macrotask 1
Macrotask Anidada por Microtask 1
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 3,
    'tittle_level': 'Asincronía',
    'topic': 'Temporizadores',
    'subtopic': 'setTimeout()',
    'definition': r'''
El método `setTimeout()` es una función global en JavaScript que te permite ejecutar un bloque de código o una función **una única vez** después de que haya transcurrido un tiempo específico. Es una herramienta fundamental para introducir pausas o retrasos en la ejecución de tu código.

¿Te estás preguntando por qué esto importa?

Pues bien, `setTimeout()` es tu aliado cuando necesitas que algo suceda "después de un rato", pero solo una vez. Por ejemplo, mostrar un mensaje de bienvenida después de unos segundos, ocultar una notificación automáticamente, o retrasar la carga de un recurso para mejorar la experiencia de usuario inicial. La clave aquí es que es una ejecución **futura y única**.

Su sintaxis básica es `setTimeout(funcionOcodigo, retrasoEnMilisegundos, arg1, arg2, ...)`.
* `funcionOcodigo`: La función que deseas ejecutar o un string de código (aunque usar un string no es recomendado por razones de seguridad y rendimiento).
* `retrasoEnMilisegundos`: El tiempo, en milisegundos, que debe transcurrir antes de que la función se ejecute. Si se omite, o si es 0, la función se coloca inmediatamente en la cola de macrotareas (Callback Queue) y se ejecutará tan pronto como el Call Stack esté vacío.
* `arg1, arg2, ...`: Argumentos opcionales que se le pasan directamente a la función cuando se ejecuta.

`setTimeout()` devuelve un `timeoutID`, un valor numérico que puedes usar para cancelar la ejecución programada con `clearTimeout()` si la acción ya no es necesaria antes de que se dispare el temporizador. Pensemos por un momento en una ventana emergente que desaparece después de 5 segundos; podrías usar `setTimeout` para programar su cierre, pero si el usuario hace clic en "cerrar" antes, usarías `clearTimeout` para evitar que el temporizador se dispare.
''',
    'code_example': r'''
console.log("Inicio del script.");

// Ejemplo 1: Ejecutar una función después de 2 segundos
setTimeout(() => {
  console.log("¡Han pasado 2 segundos!");
}, 2000);

// Ejemplo 2: Pasar argumentos a la función
function mostrarMensaje(nombre, edad) {
  console.log(`Hola, ${nombre}. Tienes ${edad} años.`);
}

setTimeout(mostrarMensaje, 3000, "Ana", 30); // Pasando "Ana" y 30 como argumentos

// Ejemplo 3: setTimeout con 0ms de retraso
// Se ejecuta tan pronto como el Call Stack principal esté vacío
setTimeout(() => {
  console.log("Este mensaje aparece casi de inmediato, pero después del código síncrono.");
}, 0);

console.log("Fin del script síncrono.");

// Ejemplo 4: Cancelar un temporizador con clearTimeout()
const mensajeId = setTimeout(() => {
  console.log("Este mensaje nunca debería aparecer si lo cancelamos.");
}, 5000); // Programado para 5 segundos

console.log("Temporizador iniciado para 5 segundos.");
clearTimeout(mensajeId); // Cancelamos el temporizador antes de que se dispare
console.log("Temporizador cancelado.");

// Un uso común para manejar notificaciones que desaparecen
function mostrarNotificacion(mensaje, duracionMs) {
  const notificacionDiv = document.createElement('div');
  notificacionDiv.textContent = mensaje;
  notificacionDiv.style.cssText = 'position: fixed; top: 20px; right: 20px; background-color: #333; color: white; padding: 10px; border-radius: 5px; opacity: 1; transition: opacity 0.5s;';
  document.body.appendChild(notificacionDiv);

  const timeoutId = setTimeout(() => {
    notificacionDiv.style.opacity = '0'; // Inicia la transición de desvanecimiento
    setTimeout(() => { // Elimina el elemento después de la transición
      notificacionDiv.remove();
    }, 500); // Coincide con la duración de la transición
  }, duracionMs);

  // Opcional: permitir que el usuario la cierre antes
  notificacionDiv.addEventListener('click', () => {
    clearTimeout(timeoutId); // Si el usuario hace clic, cancela el temporizador
    notificacionDiv.remove();
    console.log("Notificación cerrada manualmente.");
  });
}

// Para probarlo en un navegador, descomenta:
// mostrarNotificacion("¡Bienvenido a mi sitio!", 4000); // Desaparece en 4 segundos
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 3,
    'tittle_level': 'Asincronía',
    'topic': 'Temporizadores',
    'subtopic': 'setInterval()',
    'definition': r'''
A diferencia de `setTimeout()`, que ejecuta una función una sola vez, el método `setInterval()` te permite ejecutar una función o un bloque de código **repetidamente** a intervalos de tiempo fijos. Es perfecto para tareas que necesitan ocurrir de forma periódica, como animaciones, relojes, o la actualización de datos en tiempo real.

¿Te estás preguntando por qué esto importa?

Pues bien, `setInterval()` es la función a la que recurres cuando quieres que algo "se repita cada X tiempo". Pensemos en un reloj digital que actualiza la hora cada segundo, un carrusel de imágenes que cambia automáticamente, o la verificación de un servidor cada cierto tiempo para ver si hay nuevas notificaciones.

Su sintaxis es `setInterval(funcionOcodigo, retrasoEnMilisegundos, arg1, arg2, ...)`.
* `funcionOcodigo`: La función que deseas ejecutar en cada intervalo.
* `retrasoEnMilisegundos`: El tiempo, en milisegundos, que debe transcurrir **entre cada ejecución** de la función. Es importante notar que este retraso no garantiza una ejecución precisa; el navegador o Node.js intentarán respetarlo, pero la ejecución real puede retrasarse si el Call Stack está ocupado.
* `arg1, arg2, ...`: Argumentos opcionales que se le pasan directamente a la función en cada ejecución.

`setInterval()` devuelve un `intervalID`, un valor numérico que es crucial para detener la repetición. Para detener un intervalo, debes llamar a `clearInterval()` y pasarle este ID. Olvidarse de detener los intervalos puede llevar a fugas de memoria y a que tu aplicación se comporte de forma inesperada.
''',
    'code_example': r'''
console.log("Inicio del script.");

let contadorSegundos = 0;

// Ejemplo 1: Un contador que se actualiza cada segundo
const intervaloId = setInterval(() => {
  contadorSegundos++;
  console.log(`Segundos transcurridos: ${contadorSegundos}`);

  // Detener el intervalo después de 5 segundos
  if (contadorSegundos >= 5) {
    clearInterval(intervaloId); // ¡Crucial para detener la repetición!
    console.log("Contador detenido después de 5 segundos.");
  }
}, 1000); // Cada 1000 milisegundos (1 segundo)

// Ejemplo 2: Pasar argumentos a la función del intervalo
let pulsos = 0;
function mostrarPulso(mensaje) {
  pulsos++;
  console.log(`${mensaje} Pulso #${pulsos}`);
}

const pulsoId = setInterval(mostrarPulso, 2000, "¡Pulso de vida!"); // Cada 2 segundos

// Detener este intervalo manualmente después de un tiempo
setTimeout(() => {
  clearInterval(pulsoId);
  console.log("Pulso de vida detenido.");
}, 7000); // Se detendrá después de 7 segundos (3 pulsos aproximadamente)

console.log("Fin del script síncrono. Los intervalos se ejecutan en segundo plano.");

// Un uso común para un reloj digital en el DOM (requiere HTML)
// Asumiendo un <div id="reloj"></div> en el HTML

// const relojDiv = document.getElementById('reloj');
// if (relojDiv) {
//   function actualizarReloj() {
//     const ahora = new Date();
//     relojDiv.textContent = ahora.toLocaleTimeString();
//   }
//   // Actualiza el reloj cada segundo
//   setInterval(actualizarReloj, 1000);
//   // Llama una vez al inicio para que muestre la hora de inmediato
//   actualizarReloj();
// } else {
//   console.log("Elemento #reloj no encontrado en el DOM.");
// }

// --- Mala práctica: olvidarse de clearInterval ---
// let contadorMalo = 0;
// setInterval(() => {
//   contadorMalo++;
//   console.log("¡Este intervalo nunca se detendrá! Contador:", contadorMalo);
//   // Esto seguirá ejecutándose indefinidamente, consumiendo recursos.
//   // Es una fuga de memoria si la función hace algo significativo o captura variables.
// }, 500);
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 3,
    'tittle_level': 'Asincronía',
    'topic': 'Temporizadores',
    'subtopic': 'Diferencias de comportamiento',
    'definition': r'''
Aunque `setTimeout()` y `setInterval()` son ambos mecanismos para programar código de forma asíncrona en JavaScript, su propósito y comportamiento fundamental son diferentes, y entender estas diferencias es clave para usarlos correctamente y evitar problemas.

¿Te estás preguntando por qué esto importa?

Pues bien, la distinción principal es sencilla:
* `setTimeout()`: Ejecuta una función **una única vez** después de un retraso especificado.
* `setInterval()`: Ejecuta una función **repetidamente** cada cierto intervalo de tiempo.

Sin embargo, hay matices importantes en su comportamiento en relación con el Event Loop y la naturaleza de JavaScript de un solo hilo:

1.  **Garantía de Retraso vs. Retraso Mínimo:**
    * `setTimeout()` garantiza que el callback **no se ejecutará antes** del tiempo especificado, pero sí puede ejecutarse después si el Call Stack está ocupado.
    * `setInterval()` también garantiza que cada ejecución **no empezará antes** del intervalo especificado. Sin embargo, si la ejecución de la función toma más tiempo que el intervalo, o si el Call Stack está ocupado, el siguiente intervalo podría retrasarse o incluso "saltarse" si el sistema está muy cargado, ya que el navegador o Node.js no apilarán múltiples ejecuciones de la misma función en la Callback Queue. Solo se encola una instancia a la vez.

2.  **Repetición:**
    * `setTimeout()` solo se ejecuta una vez. Si necesitas repetición, tendrías que anidarlo recursivamente dentro de su propio callback.
    * `setInterval()` repite automáticamente.

3.  **Manejo de Errores y Bloqueo:**
    * Si una función dentro de `setInterval()` tiene un error o tarda mucho en ejecutarse, puede afectar la consistencia del intervalo. Si una ejecución bloquea el hilo, las siguientes ejecuciones se retrasarán, y el "retraso" se acumulará.
    * Con `setTimeout()` anidado recursivamente, si una ejecución tarda mucho, la siguiente no se programa hasta que la anterior haya terminado, lo que ayuda a mantener un intervalo más consistente (aunque no preciso) entre el *final* de una ejecución y el *inicio* de la siguiente.

Pensemos por un momento en un escenario real: para una animación que debe ser fluida, podrías pensar en `setInterval`, pero `requestAnimationFrame` es a menudo superior. Para una tarea que debe ejecutarse cada 5 minutos, `setInterval` es adecuado, pero siempre considerando que la ejecución real puede desviarse ligeramente si el sistema está bajo carga. Siempre recuerda que los temporizadores son asíncronos y su ejecución depende del Event Loop.
''',
    'code_example': r'''
console.log("Inicio del script de diferencias.");

// --- setTimeout Anidado Recursivamente para Simular Intervalo ---
let contadorRecursivo = 0;
function ejecutarCadaSegundo() {
  contadorRecursivo++;
  console.log(`setTimeout recursivo: ${contadorRecursivo}s`);

  if (contadorRecursivo < 3) {
    // Programa la siguiente ejecución SOLO DESPUÉS de que la actual termine
    setTimeout(ejecutarCadaSegundo, 1000);
  }
}
setTimeout(ejecutarCadaSegundo, 1000); // Primera llamada

// --- setInterval ---
let contadorIntervalo = 0;
const intervaloId = setInterval(() => {
  contadorIntervalo++;
  console.log(`setInterval: ${contadorIntervalo}s`);

  if (contadorIntervalo >= 3) {
    clearInterval(intervaloId);
  }
}, 1000); // Cada 1 segundo

console.log("Fin del script síncrono.");

/*
Observación en la consola:

Inicio del script de diferencias.
Fin del script síncrono.
(Después de 1 segundo)
setTimeout recursivo: 1s
setInterval: 1s
(Después de 1 segundo)
setTimeout recursivo: 2s
setInterval: 2s
(Después de 1 segundo)
setTimeout recursivo: 3s
setInterval: 3s

En un escenario ideal sin bloqueo, ambos se comportan de manera similar.
*/

// --- Diferencia con una tarea que consume tiempo ---
console.log("\n--- Demostración de Retraso por Bloqueo ---");

// Función que simula una operación pesada
function operacionPesada(ms) {
  const start = Date.now();
  while (Date.now() - start < ms) {
    // Bloquea el hilo principal
  }
}

// Ejemplo con setInterval
let intCounter = 0;
const intHeavyId = setInterval(() => {
  intCounter++;
  const startTime = Date.now();
  console.log(`[setInterval] Ejecución ${intCounter} iniciada a ${startTime % 10000}ms`);
  operacionPesada(500); // Simula una tarea de 500ms
  const endTime = Date.now();
  console.log(`[setInterval] Ejecución ${intCounter} terminada a ${endTime % 10000}ms. Duración: ${endTime - startTime}ms`);
  if (intCounter >= 3) {
    clearInterval(intHeavyId);
    console.log("[setInterval] Detenido.");
  }
}, 200); // Se espera que se ejecute cada 200ms

// Ejemplo con setTimeout recursivo
let timeoutCounter = 0;
function recursiveHeavyTimeout() {
  timeoutCounter++;
  const startTime = Date.now();
  console.log(`[setTimeout Rec] Ejecución ${timeoutCounter} iniciada a ${startTime % 10000}ms`);
  operacionPesada(500); // Simula una tarea de 500ms
  const endTime = Date.now();
  console.log(`[setTimeout Rec] Ejecución ${timeoutCounter} terminada a ${endTime % 10000}ms. Duración: ${endTime - startTime}ms`);

  if (timeoutCounter < 3) {
    // Programa la siguiente llamada *después* de que esta ejecución termine y el retraso de 200ms
    setTimeout(recursiveHeavyTimeout, 200);
  } else {
    console.log("[setTimeout Rec] Detenido.");
  }
}
setTimeout(recursiveHeavyTimeout, 200); // Primera llamada

/*
Observa el output de los timestamps:

Con setInterval:
Verás que el inicio de cada ejecución de setInterval intentará adherirse a los 200ms,
pero como la operación dura 500ms, el siguiente intento de ejecución se retrasará.
El motor de JS no "acumula" las ejecuciones de setInterval;
solo encola una si el Call Stack está libre. Si el Call Stack está ocupado
cuando debería dispararse el siguiente intervalo, se saltará ese tick.
Las duraciones de cada ejecución *sí* serán de aproximadamente 500ms.

Con setTimeout recursivo:
Cada ejecución se programa *después* de que la anterior haya terminado y de que
se cumpla el retraso. Esto significa que el intervalo total entre el *inicio*
de una ejecución y el *inicio* de la siguiente será de aproximadamente
(duración de la tarea + retraso), en este caso (500ms + 200ms = 700ms).
Esto es a menudo preferible para tareas pesadas porque evita que se superpongan o se salten ticks.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 3,
    'tittle_level': 'Asincronía',
    'topic': 'Callbacks',
    'subtopic': 'Estructura de un callback',
    'definition': r'''
Un **callback** en JavaScript es simplemente una función que se pasa como argumento a otra función, con la intención de que se "llame de vuelta" o se ejecute en un momento posterior, típicamente después de que alguna operación asíncrona haya completado o un evento haya ocurrido.

¿Seguramente pensarás de qué va todo esto...?

Pues bien, pensemos por un momento en cómo funciona esto. Cuando defines una función y la pasas como argumento a otra, no la estás ejecutando de inmediato. Simplemente le estás diciendo a la función principal: "Cuando termines lo tuyo, o cuando suceda X, por favor, ejecuta esta función que te estoy dando". Es como dejar un número de teléfono a un amigo para que te llame cuando llegue al destino. Tú no lo llamas en ese momento, él te llama a ti después.

La estructura es bastante directa:
1.  Tienes una función principal (a menudo una función asíncrona o una que maneja eventos).
2.  Uno de los parámetros de esta función principal es una función, que es el callback.
3.  Dentro de la función principal, en algún punto, cuando la tarea que realiza se completa o cuando se cumple una condición, esa función de callback es invocada.

Los callbacks son la base de la programación asíncrona tradicional en JavaScript, permitiendo que tu código no se bloquee mientras espera operaciones que tardan tiempo (como peticiones de red, lectura de archivos, o temporizadores). Son una forma fundamental de manejar la secuencia de eventos en un entorno de un solo hilo como JavaScript.
''',
    'code_example': r'''
// --- 1. Callback en una función síncrona simple ---
function procesarNumeros(numeros, callback) {
  const numerosDuplicados = numeros.map(num => num * 2);
  // Llamamos al callback y le pasamos el resultado
  callback(numerosDuplicados);
}

function mostrarResultado(arr) {
  console.log("--- Callback en función síncrona ---");
  console.log("Números procesados:", arr);
}

const misNumeros = [1, 2, 3, 4];
procesarNumeros(misNumeros, mostrarResultado); // `mostrarResultado` es el callback

// --- 2. Callback en una función asíncrona (simulando una operación de red) ---
function obtenerDatosUsuario(id, callback) {
  console.log("\n--- Callback en función asíncrona (simulando red) ---");
  console.log(`Buscando datos para el usuario con ID: ${id}...`);

  setTimeout(() => {
    const datos = { id: id, nombre: "Juan Pérez", email: `juan${id}@example.com` };
    console.log("Datos obtenidos.");
    // Cuando la operación asíncrona termina, llamamos al callback
    callback(datos);
  }, 2000); // Simula un retraso de 2 segundos de red
}

function manejarDatosUsuario(usuario) {
  console.log("Datos de usuario recibidos y manejados:");
  console.log(`Nombre: ${usuario.nombre}, Email: ${usuario.email}`);
}

obtenerDatosUsuario(123, manejarDatosUsuario); // `manejarDatosUsuario` es el callback

// --- 3. Callbacks para manejo de eventos (en entorno de navegador) ---
// Supongamos que tienes un botón en tu HTML: <button id="miBoton">Haz clic</button>

// const miBoton = document.getElementById('miBoton');

// if (miBoton) {
//   function manejarClicBoton() {
//     console.log("\n--- Callback de evento del DOM ---");
//     console.log("¡El botón ha sido clickeado!");
//   }
//   // 'manejarClicBoton' es el callback que se ejecuta cuando ocurre el evento 'click'
//   miBoton.addEventListener('click', manejarClicBoton);
// } else {
//   console.log("\n(Elemento #miBoton no encontrado en el DOM para ejemplo de evento)");
// }

// --- 4. Callbacks con manejo de errores (patrón Node.js / error-first callback) ---
function leerArchivo(ruta, callback) {
  console.log("\n--- Callback con manejo de errores ---");
  // Simulación de lectura de archivo
  if (ruta === "archivo.txt") {
    setTimeout(() => {
      // Primer argumento es null si no hay error
      callback(null, "Contenido del archivo de texto.");
    }, 1500);
  } else {
    setTimeout(() => {
      // Primer argumento es un objeto Error si hay error
      callback(new Error("Archivo no encontrado."), null);
    }, 1500);
  }
}

function procesarContenido(error, contenido) {
  if (error) {
    console.error("Error al leer archivo:", error.message);
  } else {
    console.log("Contenido del archivo:", contenido);
  }
}

leerArchivo("archivo.txt", procesarContenido);
leerArchivo("archivo_inexistente.txt", procesarContenido);
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 3,
    'tittle_level': 'Asincronía',
    'topic': 'Callbacks',
    'subtopic': 'Callback hell',
    'definition': r'''
El **Callback Hell** (también conocido como "pirámide de la condenación" o "pyramid of doom") es un patrón de código que surge cuando se encadenan múltiples operaciones asíncronas que dependen unas de otras, utilizando callbacks anidados. Esto crea un código difícil de leer, mantener y depurar, ya que la indentación y el anidamiento crecen exponencialmente.

¿No sé tú, pero a mí esto al principio me costó ?

Pensemos por un momento en una serie de pasos que deben ejecutarse en un orden específico, donde cada paso asíncrono depende del resultado del anterior. Si cada paso se maneja con un callback que a su vez anida el siguiente callback, el código se vuelve muy "profundo" y se desplaza hacia la derecha.

Las características principales del Callback Hell son:
* **Anidamiento excesivo:** Múltiples niveles de indentación que hacen que el código sea difícil de seguir.
* **Dificultad de lectura:** Es complicado saber a qué callback pertenece cada bloque de código y cómo fluye la lógica.
* **Manejo de errores complicado:** Propagar errores a través de múltiples callbacks anidados puede ser una pesadilla, ya que cada nivel necesita su propia lógica de manejo de errores.
* **Reusabilidad limitada:** Las funciones anidadas suelen estar muy acopladas a la lógica de la función padre, dificultando su reutilización en otros contextos.

Aunque los callbacks son fundamentales para la asincronía en JavaScript, el Callback Hell es una señal de que necesitas una forma más estructurada de manejar secuencias de operaciones asíncronas. En las secciones siguientes, veremos cómo las Promesas y `async/await` resuelven elegantemente este problema.
''',
    'code_example': r'''
// --- EJEMPLO DE CALLBACK HELL (A EVITAR) ---

// Simulación de operaciones asíncronas
function obtenerUsuario(id, callback) {
  console.log(`\n1. Obteniendo usuario con ID: ${id}...`);
  setTimeout(() => {
    if (id === 1) {
      callback(null, { id: 1, nombre: "Alicia" });
    } else {
      callback(new Error("Usuario no encontrado"), null);
    }
  }, 1000);
}

function obtenerPublicaciones(usuarioId, callback) {
  console.log(`  2. Obteniendo publicaciones para usuario ID: ${usuarioId}...`);
  setTimeout(() => {
    if (usuarioId === 1) {
      callback(null, [{ id: 101, titulo: "Post 1" }, { id: 102, titulo: "Post 2" }]);
    } else {
      callback(new Error("No hay publicaciones"), null);
    }
  }, 1000);
}

function obtenerComentarios(publicacionId, callback) {
  console.log(`    3. Obteniendo comentarios para publicación ID: ${publicacionId}...`);
  setTimeout(() => {
    if (publicacionId === 101) {
      callback(null, ["Comentario A", "Comentario B"]);
    } else {
      callback(new Error("No hay comentarios"), null);
    }
  }, 1000);
}

// La "pirámide de la condenación" en acción:
console.log("--- Inicio del Callback Hell ---");
obtenerUsuario(1, (errorUsuario, usuario) => {
  if (errorUsuario) {
    console.error("Error al obtener usuario:", errorUsuario.message);
    return;
  }
  console.log(`Usuario encontrado: ${usuario.nombre}`);

  obtenerPublicaciones(usuario.id, (errorPublicaciones, publicaciones) => {
    if (errorPublicaciones) {
      console.error("  Error al obtener publicaciones:", errorPublicaciones.message);
      return;
    }
    console.log(`  Publicaciones de ${usuario.nombre}:`, publicaciones.map(p => p.titulo));

    if (publicaciones.length > 0) {
      obtenerComentarios(publicaciones[0].id, (errorComentarios, comentarios) => {
        if (errorComentarios) {
          console.error("    Error al obtener comentarios:", errorComentarios.message);
          return;
        }
        console.log(`    Comentarios para "${publicaciones[0].titulo}":`, comentarios);

        // Imagina que aquí tendrías otra operación, y el código se seguiría
        // yendo hacia la derecha y haciendo más ilegible.
        console.log("      Todo completo!");
      });
    } else {
      console.log("    No hay publicaciones para obtener comentarios.");
    }
  });
});

// Este código, aunque funcional, ilustra la ilegibilidad y la dificultad
// de seguir el flujo de control y el manejo de errores a medida que
// las operaciones asíncronas anidadas aumentan.

// Para ver el manejo de errores:
// obtenerUsuario(2, (errorUsuario, usuario) => {
//   if (errorUsuario) {
//     console.error("\n--- Ejemplo de error en usuario ---");
//     console.error("Error al obtener usuario:", errorUsuario.message);
//     return;
//   }
//   // ... el resto del código no se ejecutaría
// });
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 3,
    'tittle_level': 'Asincronía',
    'topic': 'Callbacks',
    'subtopic': 'Técnicas para evitarlo',
    'definition': r'''
El Callback Hell, si bien es una consecuencia natural del uso de callbacks anidados, no es un destino inevitable. JavaScript ha evolucionado para ofrecernos herramientas mucho más elegantes y legibles para manejar la asincronía y evitar esa "pirámide de la condenación".

¿Te estás preguntando por qué esto importa?

Pues bien, las principales técnicas y patrones para escapar del Callback Hell son:

1.  **Módulos / Descomposición de funciones:** La forma más simple y básica es dividir tu código en funciones más pequeñas y reutilizables. En lugar de anidar directamente, cada callback puede llamar a otra función que maneje la siguiente lógica, pasando los resultados. Esto ayuda a "aplanar" la estructura, aunque aún se basa en callbacks.

2.  **Generadores (ES6):** Los generadores (`function*` con `yield`) ofrecen una forma de pausar y reanudar la ejecución de una función, lo que puede simular un flujo síncrono para operaciones asíncronas. Aunque son poderosos, su sintaxis puede ser un poco más compleja para este propósito específico.

3.  **Promesas (Promises - ES6):** Esta es la solución más popular y ampliamente adoptada para el Callback Hell. Las promesas representan el resultado final de una operación asíncrona que puede estar "pendiente", "resuelta" (exitosa) o "rechazada" (fallida). Permiten encadenar operaciones asíncronas de manera secuencial y manejar errores de forma centralizada con métodos como `.then()` y `.catch()`, creando un código mucho más legible y plano.

4.  **Async/Await (ES2017):** Construido sobre Promesas, `async/await` es la forma más moderna y, para muchos, la más fácil de leer para escribir código asíncrono en JavaScript. Permite escribir código asíncrono que parece síncrono, usando las palabras clave `async` para marcar una función como asíncrona y `await` para "esperar" a que una promesa se resuelva antes de continuar la ejecución de la función. Elimina completamente el anidamiento de callbacks y facilita el manejo de errores con `try/catch`.

Estas herramientas te permiten escribir código asíncrono que no solo es más fácil de entender y depurar, sino también más robusto y mantenible a largo plazo. Las Promesas y `async/await` son los pilares de la asincronía moderna en JavaScript.
''',
    'code_example': r'''
// --- 1. Técnica: Descomposición de funciones (Aplanando la pirámide) ---
// Mismas funciones de simulación de obtenerUsuario, obtenerPublicaciones, obtenerComentarios
// (definidas en el subtema anterior para evitar repetición)

function manejarUsuario(errorUsuario, usuario) {
  if (errorUsuario) {
    console.error("Error al obtener usuario (descompuesto):", errorUsuario.message);
    return;
  }
  console.log(`\nUsuario encontrado (descompuesto): ${usuario.nombre}`);
  obtenerPublicaciones(usuario.id, manejarPublicaciones(usuario));
}

function manejarPublicaciones(usuario) {
  return (errorPublicaciones, publicaciones) => {
    if (errorPublicaciones) {
      console.error("  Error al obtener publicaciones (descompuesto):", errorPublicaciones.message);
      return;
    }
    console.log(`  Publicaciones de ${usuario.nombre} (descompuesto):`, publicaciones.map(p => p.titulo));

    if (publicaciones.length > 0) {
      obtenerComentarios(publicaciones[0].id, manejarComentarios(publicaciones[0]));
    } else {
      console.log("    No hay publicaciones para obtener comentarios (descompuesto).");
    }
  };
}

function manejarComentarios(publicacion) {
  return (errorComentarios, comentarios) => {
    if (errorComentarios) {
      console.error("    Error al obtener comentarios (descompuesto):", errorComentarios.message);
      return;
    }
    console.log(`    Comentarios para "${publicacion.titulo}" (descompuesto):`, comentarios);
    console.log("      Todo completo (descompuesto)!");
  };
}

console.log("--- Inicio con Descomposición de Funciones ---");
// obtenerUsuario(1, manejarUsuario);
// Descomentar para ver este ejemplo en acción. El código se mueve a la izquierda.


// --- 2. Técnica: Uso de Promesas (Solución elegante) ---
// Convertir las funciones basadas en callback a funciones que devuelven Promesas
function obtenerUsuarioPromesa(id) {
  console.log(`\n1. Obteniendo usuario con ID (Promesa): ${id}...`);
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      if (id === 1) {
        resolve({ id: 1, nombre: "Alicia" });
      } else {
        reject(new Error("Usuario no encontrado (Promesa)"));
      }
    }, 1000);
  });
}

function obtenerPublicacionesPromesa(usuarioId) {
  console.log(`  2. Obteniendo publicaciones para usuario ID (Promesa): ${usuarioId}...`);
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      if (usuarioId === 1) {
        resolve([{ id: 101, titulo: "Post 1" }, { id: 102, titulo: "Post 2" }]);
      } else {
        reject(new Error("No hay publicaciones (Promesa)"));
      }
    }, 1000);
  });
}

function obtenerComentariosPromesa(publicacionId) {
  console.log(`    3. Obteniendo comentarios para publicación ID (Promesa): ${publicacionId}...`);
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      if (publicacionId === 101) {
        resolve(["Comentario A", "Comentario B"]);
      } else {
        reject(new Error("No hay comentarios (Promesa)"));
      }
    }, 1000);
  });
}

console.log("\n--- Inicio con Promesas ---");
obtenerUsuarioPromesa(1)
  .then(usuario => {
    console.log(`Usuario encontrado (Promesa): ${usuario.nombre}`);
    return obtenerPublicacionesPromesa(usuario.id); // Encadenar la siguiente promesa
  })
  .then(publicaciones => {
    console.log(`  Publicaciones encontradas (Promesa):`, publicaciones.map(p => p.titulo));
    if (publicaciones.length > 0) {
      return obtenerComentariosPromesa(publicaciones[0].id); // Encadenar otra promesa
    } else {
      throw new Error("No hay publicaciones para comentarios (Promesa)"); // Propagar error si no hay posts
    }
  })
  .then(comentarios => {
    console.log(`    Comentarios encontrados (Promesa):`, comentarios);
    console.log("      Todo completo (Promesa)!");
  })
  .catch(error => { // Un solo .catch() para todos los errores en la cadena
    console.error("Error en la cadena de Promesas:", error.message);
  });

// Para probar un error:
// obtenerUsuarioPromesa(2) // ID 2 causará un error de usuario
//   .then(usuario => { /* ... */ })
//   .catch(error => {
//     console.error("\n--- Error en la cadena de Promesas (ejemplo de catch) ---");
//     console.error("Error capturado:", error.message);
//   });


// --- 3. Técnica: Async/Await (Lo más legible) ---
async function procesarDatosConAsyncAwait(userId) {
  console.log("\n--- Inicio con Async/Await ---");
  try {
    const usuario = await obtenerUsuarioPromesa(userId); // Espera que la promesa se resuelva
    console.log(`Usuario encontrado (Async/Await): ${usuario.nombre}`);

    const publicaciones = await obtenerPublicacionesPromesa(usuario.id); // Espera otra promesa
    console.log(`  Publicaciones encontradas (Async/Await):`, publicaciones.map(p => p.titulo));

    if (publicaciones.length > 0) {
      const comentarios = await obtenerComentariosPromesa(publicaciones[0].id); // Espera la última promesa
      console.log(`    Comentarios encontrados (Async/Await):`, comentarios);
      console.log("      Todo completo (Async/Await)!");
    } else {
      console.log("    No hay publicaciones para comentarios (Async/Await).");
    }

  } catch (error) { // try/catch maneja los errores como en código síncrono
    console.error("Error en la cadena de Async/Await:", error.message);
  }
}

procesarDatosConAsyncAwait(1); // Ejemplo exitoso
// procesarDatosConAsyncAwait(2); // Ejemplo con error de usuario
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 3,
    'tittle_level': 'Asincronía',
    'topic': 'Promesas',
    'subtopic': 'Creación de promesas',
    'definition': r'''
Las **Promesas (Promises)** son objetos en JavaScript que representan el eventual resultado (o fallo) de una operación asíncrona. En lugar de ejecutar callbacks de inmediato, una promesa te asegura que tendrás un resultado en el futuro, ya sea un éxito o un error, lo que te permite escribir código asíncrono de una forma mucho más legible y estructurada que con los callbacks tradicionales.

¿Seguramente pensarás de qué va todo esto...?

Pues bien, pensemos en una promesa como un compromiso de una operación asíncrona. Cuando inicias una operación que tarda tiempo (como una petición a una API, la lectura de un archivo, o un temporizador), esa operación te "promete" que en algún momento te dará un resultado. Esa promesa puede estar en uno de tres estados:
1.  **Pending (Pendiente):** El estado inicial; la operación asíncrona aún no ha completado.
2.  **Fulfilled (Resuelta/Cumplida):** La operación asíncrona se completó exitosamente y la promesa tiene un valor resultante.
3.  **Rejected (Rechazada):** La operación asíncrona falló y la promesa tiene una razón para el fallo (un error).

Una vez que una promesa pasa a un estado "resuelta" o "rechazada", se considera "settled" (establecida) y su estado no puede cambiar más. Para crear una promesa, utilizas el constructor `new Promise()`, el cual recibe una función ejecutora con dos argumentos: `resolve` y `reject`. `resolve` se llama cuando la operación es exitosa y `reject` cuando falla.

Las promesas son la base de la asincronía moderna en JavaScript y el paso fundamental para comprender `async/await`.
''',
    'code_example': r'''
console.log("Inicio del script.");

// --- 1. Creación de una Promesa básica (Exitosa) ---
const miPrimeraPromesa = new Promise((resolve, reject) => {
  // Simular una operación asíncrona que tarda 2 segundos
  setTimeout(() => {
    const exito = true; // Cambia a 'false' para ver el camino de rechazo
    if (exito) {
      console.log("Operación completada exitosamente.");
      resolve("¡Datos obtenidos con éxito!"); // Resuelve la promesa con un valor
    } else {
      reject(new Error("¡Error al obtener datos!")); // Rechaza la promesa con un error
    }
  }, 2000);
});

// Consumir la promesa
miPrimeraPromesa
  .then((data) => {
    console.log("Promesa resuelta (then):", data);
  })
  .catch((error) => {
    console.error("Promesa rechazada (catch):", error.message);
  });

console.log("Script principal continúa ejecutándose (promesa pendiente...).");

// --- 2. Creación de una Promesa que Rechaza ---
const promesaFallida = new Promise((resolve, reject) => {
  setTimeout(() => {
    console.log("\nSimulando un error...");
    reject(new Error("Conexión perdida con el servidor."));
  }, 1500);
});

promesaFallida
  .then((data) => {
    console.log("Esto no debería ejecutarse:", data);
  })
  .catch((error) => {
    console.error("Error en promesa fallida (catch):", error.message);
  });

// --- 3. Promesas ya resueltas/rechazadas (útil para pruebas o retornos síncronos) ---
const promesaResueltaInmediatamente = Promise.resolve("¡Siempre se resuelve!");
promesaResueltaInmediatamente.then(data => console.log("\nPromesa resuelta inmediatamente:", data));

const promesaRechazadaInmediatamente = Promise.reject(new Error("¡Siempre falla!"));
promesaRechazadaInmediatamente.catch(error => console.error("Promesa rechazada inmediatamente:", error.message));

// --- 4. Un caso práctico: Cargar una imagen ---
function cargarImagen(url) {
  return new Promise((resolve, reject) => {
    const img = new Image();
    img.onload = () => {
      console.log(`\nImagen cargada desde: ${url}`);
      resolve(img); // Resuelve con el objeto imagen
    };
    img.onerror = () => {
      reject(new Error(`No se pudo cargar la imagen de: ${url}`));
    };
    img.src = url; // Inicia la carga
  });
}

// Para probar en un navegador, descomentar:
// cargarImagen('https://via.placeholder.com/150')
//   .then(img => {
//     document.body.appendChild(img); // Añadir la imagen al DOM
//     console.log("Imagen añadida al DOM.");
//   })
//   .catch(error => {
//     console.error("Error al cargar imagen:", error.message);
//   });

// cargarImagen('invalid-url.jpg') // Esta fallará
//   .then(img => console.log("Imagen cargada (¡esto no debería pasar!)"))
//   .catch(error => console.error("Error al cargar imagen (inválida):", error.message));

console.log("Fin del script.");
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 3,
    'tittle_level': 'Asincronía',
    'topic': 'Promesas',
    'subtopic': 'Encadenamiento con .then()',
    'definition': r'''
El encadenamiento de promesas con `.then()` es la característica fundamental que permite superar el "Callback Hell". En lugar de anidar callbacks, `.then()` te permite ejecutar una serie de operaciones asíncronas secuencialmente, una tras otra, de una forma mucho más legible y lineal.

¿Te estás preguntando por qué esto importa?

Pues bien, cuando una promesa se resuelve exitosamente, puedes adjuntar un manejador de éxito usando `.then()`. Lo mágico es que `then()` **siempre devuelve una nueva promesa**. Esto significa que puedes encadenar múltiples llamadas a `.then()`, donde cada `.then()` subsiguiente esperará a que la promesa devuelta por el `.then()` anterior se resuelva.

La sintaxis es `promesa.then(onFulfilled, onRejected)`.
* `onFulfilled`: Es una función que se ejecuta cuando la promesa se resuelve. Recibe el valor resuelto de la promesa.
* `onRejected`: (Opcional, pero no recomendado aquí) Es una función que se ejecuta si la promesa es rechazada. Generalmente, se usa `.catch()` para esto.

Cuando encadenas `.then()`:
* Si tu función `onFulfilled` devuelve un valor normal (no una promesa), el siguiente `.then()` en la cadena recibirá ese valor.
* Si tu función `onFulfilled` devuelve una nueva promesa, el siguiente `.then()` esperará a que **esa nueva promesa** se resuelva, y recibirá el valor de esa nueva promesa. Esto es crucial para encadenar operaciones asíncronas dependientes.

Esta capacidad de encadenamiento convierte la programación asíncrona de un caos de callbacks anidados en una secuencia de pasos claros, donde cada `.then()` representa la finalización exitosa de una etapa y el inicio de la siguiente.
''',
    'code_example': r'''
console.log("Inicio del script de encadenamiento.");

// Simulación de operaciones asíncronas que devuelven promesas
function obtenerUsuario(id) {
  console.log(`\n1. Obteniendo usuario con ID: ${id}...`);
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      if (id === 1) {
        resolve({ id: 1, nombre: "Alicia", email: "alicia@example.com" });
      } else {
        reject(new Error("Usuario no encontrado"));
      }
    }, 1000);
  });
}

function obtenerPublicaciones(usuarioId) {
  console.log(`  2. Obteniendo publicaciones para usuario ID: ${usuarioId}...`);
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      if (usuarioId === 1) {
        resolve([{ id: 101, titulo: "Post 1", autorId: 1 }, { id: 102, titulo: "Post 2", autorId: 1 }]);
      } else {
        reject(new Error("No hay publicaciones"));
      }
    }, 800);
  });
}

function obtenerComentarios(publicacionId) {
  console.log(`    3. Obteniendo comentarios para publicación ID: ${publicacionId}...`);
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      if (publicacionId === 101) {
        resolve(["Comentario A", "Comentario B"]);
      } else {
        reject(new Error("No hay comentarios"));
      }
    }, 700);
  });
}

// --- Encadenamiento de Promesas con .then() ---
console.log("--- Encadenando Promesas ---");
obtenerUsuario(1)
  .then(usuario => {
    console.log(`Usuario encontrado: ${usuario.nombre}`);
    // Devolvemos una nueva promesa, el siguiente .then() esperará por ella
    return obtenerPublicaciones(usuario.id);
  })
  .then(publicaciones => {
    console.log(`  Publicaciones de Alicia:`, publicaciones.map(p => p.titulo));
    if (publicaciones.length > 0) {
      // Devolvemos otra promesa
      return obtenerComentarios(publicaciones[0].id);
    } else {
      // Si no hay publicaciones, lanzamos un error que será capturado por el .catch()
      throw new Error("No hay publicaciones para obtener comentarios.");
    }
  })
  .then(comentarios => {
    console.log(`    Comentarios del primer post:`, comentarios);
    console.log("      ¡Todas las operaciones asíncronas completadas exitosamente!");
  })
  .catch(error => { // Un solo .catch() al final maneja errores de toda la cadena
    console.error("Error en la cadena de promesas:", error.message);
  })
  .finally(() => { // Se ejecuta siempre, sin importar si hubo éxito o error
    console.log("\n--- La cadena de promesas ha finalizado (finally) ---");
  });

// --- Ejemplo de encadenamiento donde se devuelve un valor no-promesa ---
console.log("\n--- Encadenando con valores no-promesa ---");
Promise.resolve(10)
  .then(num => {
    console.log("Primer then:", num); // Salida: 10
    return num * 2; // Devuelve un valor normal
  })
  .then(resultado => {
    console.log("Segundo then:", resultado); // Salida: 20
    return resultado + 5;
  })
  .then(final => {
    console.log("Tercer then:", final); // Salida: 25
  })
  .catch(err => console.error("Error en cadena simple:", err.message));

// --- Ejemplo de un .then() con función de rechazo (menos común, .catch es preferido) ---
Promise.reject(new Error("¡Error específico!"))
  .then(
    value => console.log("Valor:", value), // Este no se ejecuta
    error => console.error("Error capturado en then (onRejected):", error.message) // Este sí
  );

console.log("Fin del script síncrono.");
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 3,
    'tittle_level': 'Asincronía',
    'topic': 'Promesas',
    'subtopic': 'Manejo de errores con .catch()',
    'definition': r'''
El manejo de errores en operaciones asíncronas siempre ha sido un desafío. Con las Promesas, el método `.catch()` ofrece una forma limpia y eficiente de gestionar los errores que puedan surgir en cualquier punto de una cadena de promesas, eliminando la necesidad de verificar errores en cada callback anidado.

¿No sé tú, pero a mí esto al principio me costó? 

Pues bien, `catch()` es como la "red de seguridad" de tus promesas. Si alguna promesa en una cadena se rechaza (es decir, falla), el control pasará inmediatamente al `.catch()` más cercano en la cadena, saltándose cualquier `.then()` intermedio.

La sintaxis es `promesa.catch(onRejected)`.
* `onRejected`: Es una función que se ejecuta cuando la promesa es rechazada. Recibe el objeto de error (la razón del rechazo).

Puntos clave sobre `.catch()`:
* **Centralización de errores:** Puedes tener un único `.catch()` al final de una cadena de promesas para manejar cualquier error que ocurra en cualquier paso anterior. Esto contrasta con los callbacks, donde cada función anidada necesitaba su propia lógica de manejo de errores.
* **Propagación de errores:** Si una promesa se rechaza y no hay un `.catch()` adjunto a esa promesa en particular, el error se "propaga" hacia abajo en la cadena hasta que se encuentre un `.catch()`. Si no se encuentra ninguno, el error se considerará una "promesa no manejada" (`UnhandledPromiseRejection`) y causará un error global en la aplicación.
* **Devolución de Promesas:** Un `.catch()` también puede devolver una promesa (o un valor). Si devuelve un valor, la cadena de promesas continuará como si el error hubiera sido manejado y la promesa se hubiera resuelto. Si devuelve una promesa rechazada, la cadena continuará en el siguiente `.catch()`.

Dominar `.catch()` es crucial para escribir código asíncrono robusto que no se caiga ante fallos inesperados.
''',
    'code_example': r'''
console.log("Inicio del script de manejo de errores.");

// Funciones que devuelven promesas (definidas en el subtema anterior)
function obtenerUsuario(id) {
  console.log(`\n1. Obteniendo usuario con ID: ${id}...`);
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      if (id === 1 || id === 3) { // El ID 1 y 3 será exitoso
        resolve({ id: id, nombre: `Usuario ${id}` });
      } else { // El ID 2 será un error
        reject(new Error(`Usuario con ID ${id} no encontrado`));
      }
    }, 1000);
  });
}

function obtenerDatosAdicionales(usuarioId) {
  console.log(`  2. Obteniendo datos adicionales para usuario ID: ${usuarioId}...`);
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      if (usuarioId === 1) { // El ID 1 tendrá datos adicionales
        resolve({ hobbies: ["leer", "programar"] });
      } else { // Los demás IDs causarán un error aquí
        reject(new Error(`Error al obtener datos adicionales para ID ${usuarioId}`));
      }
    }, 800);
  });
}

function procesarDatosFinales(datos) {
  console.log(`    3. Procesando datos finales...`);
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      if (datos.hobbies && datos.hobbies.length > 0) {
        resolve(`Procesamiento finalizado. Hobbies: ${datos.hobbies.join(', ')}`);
      } else {
        reject(new Error("No hay hobbies para procesar."));
      }
    }, 700);
  });
}

// --- Ejemplo 1: Cadena con error manejado por un .catch() final ---
console.log("--- Caso 1: Error en medio de la cadena, manejado al final ---");
obtenerUsuario(2) // Este paso fallará
  .then(usuario => {
    console.log(`Usuario ${usuario.nombre} obtenido.`); // Esto no se ejecutará
    return obtenerDatosAdicionales(usuario.id);
  })
  .then(datos => {
    console.log(`Datos adicionales: ${datos.hobbies}`); // Esto no se ejecutará
    return procesarDatosFinales(datos);
  })
  .then(resultado => {
    console.log(resultado); // Esto no se ejecutará
  })
  .catch(error => { // Aquí se captura el error de 'obtenerUsuario(2)'
    console.error(`Error en el Caso 1: ${error.message}`);
  })
  .finally(() => {
    console.log("Fin del Caso 1.");
  });


// --- Ejemplo 2: Un .catch() que se recupera del error ---
console.log("\n--- Caso 2: Error manejado y cadena continúa (recuperación) ---");
obtenerUsuario(3) // Este paso será exitoso
  .then(usuario => {
    console.log(`Usuario ${usuario.nombre} obtenido.`);
    return obtenerDatosAdicionales(usuario.id + 100); // Esto causará un error (ID no 1)
  })
  .catch(errorDeDatosAdicionales => {
    console.error(`Error de datos adicionales capturado: ${errorDeDatosAdicionales.message}. Recuperando...`);
    // Devolvemos un valor normal para que la cadena continúe con este valor
    return { hobbies: ["ninguno"] }; // Simula datos por defecto o un fallback
  })
  .then(datosRecuperados => {
    console.log(`Continuando con datos: ${datosRecuperados.hobbies}`);
    return procesarDatosFinales(datosRecuperados);
  })
  .then(resultadoFinal => {
    console.log(`Resultado final (Caso 2): ${resultadoFinal}`); // Se ejecutará con los datos recuperados
  })
  .catch(errorFinal => { // Por si hay otro error después de la recuperación
    console.error(`Error final en Caso 2: ${errorFinal.message}`);
  })
  .finally(() => {
    console.log("Fin del Caso 2.");
  });


// --- Ejemplo 3: Errores no manejados (UnhandledPromiseRejection) ---
console.log("\n--- Caso 3: Promesa sin .catch() (¡Mala práctica!) ---");
obtenerUsuario(99) // Esto fallará y no hay un .catch() adjunto
  .then(usuario => console.log(`Usuario 99: ${usuario.nombre}`)); // Este .then no se ejecutará

// En un entorno de navegador o Node.js, esto típicamente emitirá una advertencia
// o un error no capturado en la consola: "UnhandledPromiseRejectionWarning" o similar.
// Es crucial SIEMPRE tener un .catch() o usar async/await con try/catch para manejar todos los errores.

console.log("Fin del script síncrono general.");
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 3,
    'tittle_level': 'Asincronía',
    'topic': 'async/await',
    'subtopic': 'Sintaxis básica',
    'definition': r'''
`async/await` es una característica de ECMAScript 2017 (ES8) que permite escribir código asíncrono que parece síncrono, lo que lo hace mucho más fácil de leer y mantener que las cadenas de `.then()` de las Promesas o el "Callback Hell".

¿Te estás preguntando por qué esto importa?

Pues bien, `async/await` fue introducido para simplificar la programación asíncrona. Se construye sobre las Promesas, lo que significa que, bajo el capó, sigue utilizando el mecanismo de Promesas. Sin embargo, su sintaxis es más directa y se asemeja mucho al código síncrono tradicional, lo que reduce la curva de aprendizaje y la complejidad visible.

Hay dos palabras clave principales:
1.  **`async`**: Se coloca antes de la palabra clave `function` (o antes de un método en una clase o una función flecha) para declarar que una función es asíncrona. Una función `async` siempre devuelve una Promesa. Si la función `async` devuelve un valor directamente, JavaScript lo envolverá automáticamente en una Promesa resuelta. Si lanza un error, lo envolverá en una Promesa rechazada.
2.  **`await`**: Solo se puede usar dentro de una función `async`. La palabra clave `await` "pausa" la ejecución de la función `async` hasta que una Promesa se resuelve (o se rechaza). Una vez que la Promesa se resuelve, `await` devuelve el valor resuelto de la Promesa y la ejecución de la función `async` continúa. Si la Promesa se rechaza, `await` lanzará el error, que puede ser capturado con un bloque `try...catch`.

`async/await` no bloquea el hilo principal de JavaScript; solo "pausa" la ejecución de la función `async` específica que lo contiene, permitiendo que el Event Loop siga procesando otras tareas. Es una forma de escribir código asíncrono con una experiencia de lectura muy similar a la síncrona.
''',
    'code_example': r'''
console.log("Inicio del script.");

// --- Función que devuelve una Promesa (base para await) ---
function obtenerDatosUsuario(id) {
  console.log(`\nSimulando obtención de datos para usuario ID: ${id}...`);
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      if (id === 1) {
        resolve({ id: 1, nombre: "Juan", edad: 30 });
      } else {
        reject(new Error(`Usuario con ID ${id} no encontrado.`));
      }
    }, 1500); // Simula un retraso de red
  });
}

// --- Sintaxis básica de una función async/await ---
async function procesarUsuario(userId) {
  console.log(`\n--- Procesando usuario con ID: ${userId} (usando async/await) ---`);
  try {
    // 'await' pausa la ejecución de 'procesarUsuario' hasta que la promesa se resuelva
    const usuario = await obtenerDatosUsuario(userId);
    console.log(`Datos de usuario obtenidos: Nombre - ${usuario.nombre}, Edad - ${usuario.edad}`);

    // Imagina más operaciones asíncronas aquí...
    const mensaje = await new Promise(resolve => setTimeout(() => resolve("Procesamiento completado."), 500));
    console.log(mensaje);

    return `Procesamiento exitoso para ${usuario.nombre}`; // Las funciones async siempre devuelven una promesa
  } catch (error) {
    console.error(`Error al procesar usuario: ${error.message}`);
    throw error; // Propagar el error si es necesario
  }
}

// --- Invocando funciones async ---
// El resultado de una función async es una Promesa
procesarUsuario(1)
  .then(resultado => {
    console.log(`Resultado final (then): ${resultado}`);
  })
  .catch(error => {
    console.error(`Error capturado fuera de async/await: ${error.message}`);
  });

// Ejemplo de un error
procesarUsuario(2)
  .then(resultado => {
    console.log(`Resultado final (then): ${resultado}`); // No se ejecutará
  })
  .catch(error => {
    console.error(`Error capturado fuera de async/await: ${error.message}`); // Este sí
  });


// --- Función async que devuelve un valor síncrono ---
async function obtenerNumero() {
  console.log("\nObteniendo un número...");
  return 42; // Esto se envuelve automáticamente en Promise.resolve(42)
}

obtenerNumero().then(num => {
  console.log("Número obtenido:", num); // Salida: 42
});

// --- Función async que lanza un error síncronamente ---
async function lanzarErrorSincrono() {
  console.log("\nLanzando error síncronamente...");
  throw new Error("¡Error directo!"); // Esto se envuelve automáticamente en Promise.reject()
}

lanzarErrorSincrono().catch(err => {
  console.error("Error síncrono capturado:", err.message);
});


console.log("Fin del script síncrono principal.");
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 3,
    'tittle_level': 'Asincronía',
    'topic': 'async/await',
    'subtopic': 'Flujo con await',
    'definition': r'''
El uso de la palabra clave `await` dentro de una función `async` es lo que realmente transforma la manera en que escribimos y entendemos el código asíncrono. `await` permite un flujo de ejecución que se asemeja al síncrono, haciendo que las secuencias de operaciones asíncronas sean extremadamente legibles.

¿Te estás preguntando por qué esto importa?

Pues bien, pensemos en `await` como una forma de "pausar" la ejecución de la función `async` que lo contiene hasta que la Promesa a la que se le aplica se resuelva. Esto significa que el código que le sigue al `await` no se ejecutará hasta que la Promesa complete su trabajo y devuelva un valor.

Aquí es donde reside la magia y la diferencia con los `.then()` anidados:
* **Lectura lineal:** Con `await`, lees el código de arriba abajo, de forma secuencial, como si fuera síncrono.
* **Sin callbacks anidados:** Evitas los múltiples niveles de indentación que caracterizan al "Callback Hell" y a veces incluso a las cadenas de `.then()`.
* **Valores directos:** Una vez que la Promesa se resuelve, `await` "desenvuelve" el valor resuelto y lo asigna directamente a una variable, como si fuera una operación síncrona. No necesitas envolver tu lógica en callbacks.

Es crucial recordar que `await` solo funciona dentro de funciones marcadas con `async`. Si intentas usar `await` fuera de una función `async` (por ejemplo, en el ámbito global de un script antiguo, aunque en módulos ES6 ya está permitido), obtendrás un error de sintaxis. El flujo de ejecución `async/await` es una de las herramientas más poderosas para manejar la asincronía compleja en JavaScript de una manera limpia y comprensible.
''',
    'code_example': r'''
console.log("Inicio del script.");

// --- Funciones que devuelven Promesas (simulando operaciones asíncronas) ---
function paso1(data) {
  console.log(`\nIniciando Paso 1 con: ${data}`);
  return new Promise(resolve => {
    setTimeout(() => {
      console.log("Paso 1 completado.");
      resolve(data * 2); // Devolvemos el doble del valor
    }, 1000);
  });
}

function paso2(data) {
  console.log(`  Iniciando Paso 2 con: ${data}`);
  return new Promise(resolve => {
    setTimeout(() => {
      console.log("  Paso 2 completado.");
      resolve(data + 5); // Le sumamos 5 al valor
    }, 800);
  });
}

function paso3(data) {
  console.log(`    Iniciando Paso 3 con: ${data}`);
  return new Promise(resolve => {
    setTimeout(() => {
      console.log("    Paso 3 completado.");
      resolve(`Resultado final: ${data}`); // Generamos un string final
    }, 600);
  });
}

// --- Flujo de ejecución con async/await ---
async function ejecutarSecuenciaAsincrona() {
  console.log("--- Ejecutando secuencia asíncrona con async/await ---");
  const valorInicial = 5;

  // El `await` aquí "pausa" la ejecución de `ejecutarSecuenciaAsincrona`
  // hasta que la promesa de `paso1` se resuelva.
  const resultadoPaso1 = await paso1(valorInicial);
  // El código solo continúa a la siguiente línea una vez que `paso1` ha resuelto.

  const resultadoPaso2 = await paso2(resultadoPaso1);
  // De nuevo, espera que `paso2` se resuelva.

  const resultadoFinal = await paso3(resultadoPaso2);
  // Y espera que `paso3` se resuelva.

  console.log(`\n${resultadoFinal}`);
  console.log("Todas las operaciones asíncronas han terminado.");
}

// Invocamos la función async
ejecutarSecuenciaAsincrona();

// --- Otro ejemplo: Llamadas a la API ---
async function obtenerPostsYComentarios(postId) {
  console.log(`\n--- Obteniendo Post y Comentarios para ID: ${postId} ---`);
  try {
    const postResponse = await fetch(`https://jsonplaceholder.typicode.com/posts/${postId}`);
    const post = await postResponse.json();
    console.log(`Post encontrado: ${post.title}`);

    const commentsResponse = await fetch(`https://jsonplaceholder.typicode.com/posts/${postId}/comments`);
    const comments = await commentsResponse.json();
    console.log(`  Comentarios (${comments.length}): ${comments[0]?.body.substring(0, 30)}...`);

    return { post, comments };
  } catch (error) {
    console.error(`Error al obtener datos: ${error.message}`);
    throw error; // Re-lanzar el error para que sea capturado externamente
  }
}

// Invocamos y manejamos la promesa resultante
obtenerPostsYComentarios(1)
  .then(data => {
    console.log("Operación completada con éxito.");
  })
  .catch(err => {
    console.error("Fallo en la operación principal:", err.message);
  });

// Ejemplo con un ID que probablemente no exista para ver el flujo de error
obtenerPostsYComentarios(9999999) // ID muy grande para forzar un error de red o no encontrado
  .then(data => {
    console.log("Operación completada con éxito. (No debería verse esto)");
  })
  .catch(err => {
    console.error("Fallo en la operación principal (ID inválido):", err.message);
  });


console.log("Fin del script síncrono principal.");
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 3,
    'tittle_level': 'Asincronía',
    'topic': 'async/await',
    'subtopic': 'Errores con try/catch',
    'definition': r'''
Una de las grandes ventajas de `async/await` es que permite manejar los errores de Promesas de una manera que resulta familiar para quienes están acostumbrados al manejo de errores síncrono: utilizando bloques `try...catch`. Esto simplifica enormemente la lógica de manejo de errores en comparación con el uso de `.catch()` en cadenas de Promesas.

¿No sé tú, pero a mí esto al principio me costó? 

Pues bien, en una función `async`, cualquier Promesa rechazada que se encuentra con un `await` será "lanzada" como un error. Esto significa que puedes envolver tu código asíncrono en un bloque `try`, y si alguna de las operaciones `await` resulta en una Promesa rechazada, el control saltará directamente al bloque `catch`.

La sintaxis es exactamente la misma que para el manejo de errores síncronos:
```javascript
async function miFuncionAsincrona() {
  try {
    const resultado1 = await algunaPromesaQuePuedeFallar();
    const resultado2 = await otraPromesaQuePuedeFallar(resultado1);
    // ... más await
  } catch (error) {
    // Aquí se captura cualquier error (promesa rechazada)
    // que ocurrió en cualquiera de los `await` dentro del `try`
    console.error("Ocurrió un error:", error.message);
  }
}
Puntos clave:

Captura centralizada: Un solo bloque try...catch puede manejar errores de múltiples operaciones await dentro de esa función async.
Claridad: El código es más fácil de seguir porque la lógica de éxito y la lógica de error están claramente separadas y se parecen a un flujo síncrono.
Propagación: Si un error no es capturado por un try...catch dentro de la función async, la función async misma devolverá una Promesa rechazada, y el error deberá ser capturado por un .catch() fuera de la función o por otro try...catch en una función async superior.
Esta integración del manejo de errores hace que async/await sea la forma preferida de manejar la asincronía en JavaScript moderno, ya que combina la legibilidad con una robusta gestión de errores.
''',
    'code_example': r'''
console.log("Inicio del script de manejo de errores con try/catch.");

// --- Funciones que devuelven Promesas y pueden fallar ---
function simularPeticion(url, debeFallar = false) {
console.log(\nRealizando petición a: ${url}...);
return new Promise((resolve, reject) => {
setTimeout(() => {
if (debeFallar || url.includes("error")) {
reject(new Error(Fallo en la petición a ${url}));
} else {
resolve(Datos de ${url} obtenidos.);
}
}, 1000);
});
}

// --- Función async con try...catch para manejar errores ---
async function obtenerYProcesarDatos() {
console.log("--- Ejecutando obtenerYProcesarDatos (éxito) ---");
try {
const datos1 = await simularPeticion("api/usuarios");
console.log(Paso 1 exitoso: ${datos1});

const datos2 = await simularPeticion("api/productos");
console.log(`Paso 2 exitoso: ${datos2}`);

const datos3 = await simularPeticion("api/pedidos");
console.log(`Paso 3 exitoso: ${datos3}`);

console.log("¡Todos los datos procesados exitosamente!");
} catch (error) {
// Este catch capturará el primer error que ocurra en cualquiera de los await
console.error(ERROR CATASTROFICO (obtenerYProcesarDatos): ${error.message});
} finally {
console.log("Proceso de obtenerYProcesarDatos finalizado.");
}
}

// Invocamos la función exitosa
obtenerYProcesarDatos();

// --- Función async con try...catch para manejar un error específico ---
async function obtenerYProcesarConFallo() {
console.log("\n--- Ejecutando obtenerYProcesarConFallo (con error) ---");
try {
const datosA = await simularPeticion("api/clientes");
console.log(Paso A exitoso: ${datosA});

const datosB = await simularPeticion("api/datos_error", true); // ¡Este fallará!
console.log(`Paso B exitoso: ${datosB}`); // Esta línea no se ejecutará

const datosC = await simularPeticion("api/reportes");
console.log(`Paso C exitoso: ${datosC}`); // Esta línea no se ejecutará
} catch (error) {
// El control viene aquí cuando simularPeticion("api/datos_error", true) falla
console.error(ERROR ESPECÍFICO (obtenerYProcesarConFallo): ${error.message});
} finally {
console.log("Proceso de obtenerYProcesarConFallo finalizado.");
}
}

// Invocamos la función con fallo
obtenerYProcesarConFallo();

// --- Manejo de errores cuando la función async misma es la que se llama ---
async function funcionQueSiempreFalla() {
console.log("\n--- Función async que siempre falla ---");
// Lanzar un error directamente dentro de una función async
// Es equivalente a return Promise.reject(new Error(...))
throw new Error("Fallo intencional dentro de la función.");
}

// Aquí, el error se captura fuera de la función async con .catch()
funcionQueSiempreFalla()
.then(() => console.log("Esto no se ejecutará."))
.catch(error => console.error(Error capturado fuera de la función async: ${error.message}))
.finally(() => console.log("Finalizado el manejo de función que siempre falla."));

console.log("Fin del script síncrono principal.");
'''
  });
}

Future<void> insertJsMidLevel4Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 4,
    'tittle_level': 'Modo Estricto y Buenas Prácticas',
    'topic': "'use strict' en distintos contextos",
    'subtopic': "En funciones",
    'definition': r'''
El modo estricto de JavaScript, activado por la directiva `'use strict'`, es una forma de optar por un conjunto restringido de JavaScript. Cuando se aplica a una función, este modo cambia el comportamiento de ciertas características del lenguaje, eliminando algunos "errores silenciosos" de JavaScript y haciendo que el código sea más seguro y predecible.

¿Te estás preguntando por qué esto importa?

Pues bien, aplicar `'use strict'` dentro de una función específica te permite tener un control granular sobre qué partes de tu código se adhieren a estas reglas más estrictas. Esto es particularmente útil en proyectos grandes o cuando integras código de terceros, donde podrías querer aplicar el modo estricto solo a funciones críticas o nuevas, sin afectar el comportamiento de código antiguo que podría depender de las peculiaridades del modo no estricto.

Al declarar `'use strict'` en la primera línea del cuerpo de una función, solo el código dentro de esa función y cualquier función anidada dentro de ella (a menos que se especifique lo contrario) se ejecutará en modo estricto. Esto es ventajoso porque puedes migrar tu código gradualmente al modo estricto, o asegurarte de que una función específica se comporte siempre de manera predecible, independientemente del contexto estricto o no estricto del código que la llama.

Entre las reglas que impone el modo estricto en una función se encuentran:
* Prohibir la creación de variables globales accidentales (si olvidas `var`, `let` o `const`).
* Hacer que `this` sea `undefined` dentro de funciones (cuando no son métodos de objetos) en lugar del objeto global.
* Prohibir la eliminación de propiedades no configurables.
* Prohibir parámetros de función duplicados.

Es una herramienta valiosa para mejorar la calidad del código a nivel de función.
''',
    'code_example': r'''
// Modo no estricto por defecto a nivel global

function funcionEnModoNoEstricto() {
  variableGlobalNoEstricta = "¡Soy global accidentalmente!"; // Sin 'var', 'let', 'const'
  console.log("--- Función en Modo No Estricto ---");
  console.log("this en función normal (no estricta):", this === window); // true en navegador, global en Node.js
  console.log("Variable global accidental:", variableGlobalNoEstricta);
}
funcionEnModoNoEstricto();


function funcionEnModoEstricto() {
  'use strict'; // Modo estricto aplicado solo a esta función
  console.log("\n--- Función en Modo Estricto ---");

  try {
    // variableGlobalEstricta = "¡Error! No puedo ser global accidentalmente"; // Esto causaría un ReferenceError
    // console.log(variableGlobalEstricta);
  } catch (e) {
    console.error("Error al crear variable global accidental en modo estricto:", e.message);
  }

  // 'this' es undefined en una función normal en modo estricto
  console.log("this en función normal (estricta):", this === undefined); // true

  // try {
  //   // function conParametrosDuplicados(a, a) { // Esto causaría un SyntaxError
  //   //   console.log(a);
  //   // }
  //   // conParametrosDuplicados(1, 2);
  // } catch (e) {
  //   console.error("Error por parámetros duplicados (SyntaxError):", e.message); // Esto se vería en tiempo de parseo
  // }

  const objetoEstricto = {
    propiedad: 10
  };
  Object.defineProperty(objetoEstricto, 'propiedadFija', {
    value: 20,
    configurable: false
  });

  try {
    // delete objetoEstricto.propiedadFija; // Esto causaría un TypeError en modo estricto
  } catch (e) {
    console.error("Error al intentar eliminar propiedad no configurable en modo estricto:", e.message);
  }

  console.log("Fin de función en modo estricto.");
}

funcionEnModoEstricto();

// El código global sigue en modo no estricto
console.log("\n--- Contexto Global ---");
console.log("Variable global creada por función no estricta:", typeof variableGlobalNoEstricta); // 'string'
// console.log("Variable global creada por función estricta:", typeof variableGlobalEstricta); // ReferencerError si se intentara acceder
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 4,
    'tittle_level': 'Modo Estricto y Buenas Prácticas',
    'topic': "'use strict' en distintos contextos",
    'subtopic': "A nivel global",
    'definition': r'''
Cuando se declara `'use strict'` al principio de un script o de un archivo JavaScript completo, activa el modo estricto para **todo el código** contenido en ese script. Es la forma más amplia de aplicar estas reglas mejoradas de JavaScript.

¿Te estás preguntando por qué esto importa?

Pues bien, aplicar `'use strict'` a nivel global asegura que todo tu código se ejecute bajo un conjunto de reglas más estrictas y "modernas", lo que ayuda a prevenir errores comunes, malas prácticas y comportamientos inesperados que son permitidos en el modo no estricto de JavaScript. Es una declaración de intenciones: "Quiero que todo mi código se adhiera a las mejores prácticas".

Al hacer esto, se aplican todas las restricciones del modo estricto a todas las funciones, variables y sentencias dentro de ese archivo. Esto es particularmente útil en proyectos nuevos donde quieres asegurar la consistencia y la calidad del código desde el principio. También es la práctica recomendada para módulos JavaScript (archivos ES Modules), donde el modo estricto se aplica automáticamente.

La directiva `'use strict'` debe ser la primera sentencia ejecutable en el script. Si hay comentarios o espacios en blanco antes, está bien, pero no puede haber ninguna otra sentencia (como una declaración de variable o un `console.log`). Si la declaras después de otra sentencia, simplemente se ignorará y el script no se ejecutará en modo estricto.

Adoptar el modo estricto globalmente es un paso hacia un JavaScript más robusto y menos propenso a errores.
''',
    'code_example': r'''
// 'use strict'; // Descomentar para ver el efecto global

console.log("--- Script en Modo Estricto Global (si 'use strict' está descomentado) ---");

// 1. Prohibición de variables globales accidentales
try {
  // variableGlobalAccidental = "Intentando crear global"; // ReferenceError en modo estricto
  // console.log(variableGlobalAccidental);
  console.log("Intentando crear variable global accidental (comentado): Error de ReferenceError.");
} catch (e) {
  console.error("Error capturado:", e.message);
}

// 2. 'this' en funciones normales es 'undefined'
function miFuncionNormalEstricta() {
  console.log("this en función normal (modo estricto):", this === undefined); // true
}
miFuncionNormalEstricta();

// 3. Prohibición de eliminar propiedades no configurables
const obj = {};
Object.defineProperty(obj, 'propiedadFija', {
  value: 1,
  configurable: false
});
try {
  // delete obj.propiedadFija; // TypeError en modo estricto
  console.log("Intentando eliminar propiedad no configurable (comentado): Error de TypeError.");
} catch (e) {
  console.error("Error capturado:", e.message);
}

// 4. Prohibición de duplicar nombres de parámetros
try {
  // function funcionConParametrosDuplicados(a, a) { // SyntaxError en modo estricto
  //   console.log(a);
  // }
  // funcionConParametrosDuplicados(1, 2);
  console.log("Intentando usar parámetros duplicados (comentado): Error de SyntaxError.");
} catch (e) {
  console.error("Error capturado (SyntaxError se produce en tiempo de parseo):", e.message);
}


// 5. Prohibición de asignaciones a propiedades de solo lectura
// Math.PI = 3.14; // TypeError en modo estricto

// 6. Prohibición de utilizar octal (prefijo 0)
// let octalNumber = 010; // SyntaxError en modo estricto
// console.log(octalNumber);

// Demostración de que las funciones dentro de un script globalmente estricto también son estrictas
function otraFuncionEstricta() {
  // No necesita 'use strict' aquí, ya lo heredó del ámbito global
  console.log("this en otraFuncionEstricta (automáticamente estricta):", this === undefined); // true
}
otraFuncionEstricta();

console.log("Fin del script.");
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 4,
    'tittle_level': 'Modo Estricto y Buenas Prácticas',
    'topic': "'use strict' en distintos contextos",
    'subtopic': "En clases",
    'definition': r'''
Un aspecto importante de las clases de JavaScript (introducidas en ES2015) es que su código interno se ejecuta automáticamente en modo estricto. Esto significa que no necesitas, ni debes, añadir la directiva `'use strict'` explícitamente dentro de las clases o sus métodos.

¿Te estás preguntando por qué esto importa?

Pues bien, la imposición automática del modo estricto en las clases es una decisión de diseño del lenguaje para fomentar las buenas prácticas y evitar errores comunes asociados con el modo no estricto, especialmente en el contexto de la programación orientada a objetos. Te asegura que, por defecto, tus clases se comportarán de una manera más predecible y segura, sin que tengas que recordar añadir la directiva manualmente.

Esto significa que todas las reglas del modo estricto se aplican a:
* El constructor de la clase.
* Todos los métodos de instancia.
* Todos los métodos estáticos.
* Los getters y setters.

Por ejemplo, dentro de los métodos de una clase, el valor de `this` siempre estará ligado a la instancia de la clase (o a la clase misma para métodos estáticos), y no se "caerá" al objeto global (`window` o `global`) si el método se llama sin un contexto explícito. Además, no podrás crear propiedades globales accidentales ni usar parámetros duplicados, entre otras restricciones.

Es una característica conveniente que simplifica el desarrollo con clases, ya que te libra de la preocupación de activar el modo estricto y te permite concentrarte en la lógica de tu clase, sabiendo que ya está ejecutándose bajo las reglas más robustas de JavaScript.
''',
    'code_example': r'''
// NO es necesario ni recomendable añadir 'use strict'; dentro de las clases

class Persona {
  constructor(nombre) {
    this.nombre = nombre;
    // this en el constructor apunta a la nueva instancia
    console.log("--- Dentro del Constructor de la Clase ---");
    console.log("this en constructor (automáticamente estricto):", this instanceof Persona); // true
    try {
      // variableAccidentalClase = "Esto causaría un ReferenceError si no fuera un comentario";
    } catch (e) {
      console.error("Error (comentado):", e.message);
    }
  }

  saludar() {
    // this en un método de instancia apunta a la instancia
    console.log("\n--- Dentro del Método de Instancia 'saludar' ---");
    console.log("this en método de instancia (automáticamente estricto):", this instanceof Persona); // true
    console.log(`Hola, mi nombre es ${this.nombre}.`);

    // Prueba de un error en modo estricto:
    // intentarAsignarAPropiedadDeSoloLectura = function() {
    //   Math.PI = 3.14; // TypeError en modo estricto
    // };
    // try {
    //   intentarAsignarAPropiedadDeSoloLectura();
    // } catch (e) {
    //   console.error("Error al intentar asignar a propiedad de solo lectura (comentado):", e.message);
    // }
  }

  static infoGeneral() {
    // this en un método estático apunta a la clase misma
    console.log("\n--- Dentro del Método Estático 'infoGeneral' ---");
    console.log("this en método estático (automáticamente estricto):", this === Persona); // true
    console.log("Esta es una clase para crear objetos Persona.");
  }
}

const juan = new Persona("Juan");
juan.saludar(); // Llama al método de instancia

Persona.infoGeneral(); // Llama al método estático

// Demostración de que 'this' no se "cae" al objeto global cuando un método se extrae
console.log("\n--- 'this' no se pierde en métodos de clase (gracias al modo estricto) ---");
const saludarDeJuan = juan.saludar;
// Si esto fuera una función normal fuera de clase en modo no estricto, 'this' sería window/global.
// Pero en modo estricto (implícito en clases), 'this' es undefined aquí, lo que a menudo lleva a TypeError
// si el método intenta acceder a 'this.nombre'.
// Esto es una característica del modo estricto: 'this' es undefined por defecto
// si no hay un contexto de llamada explícito.
try {
  // saludarDeJuan(); // Esto lanzaría un TypeError porque 'this' sería undefined y no tendría 'nombre'
  console.log("Intentando llamar a método de clase sin contexto (comentado): TypeError esperado.");
} catch (e) {
  console.error("Error capturado:", e.message);
}

// Para que funcione, tendrías que enlazar el contexto
const saludarEnlazado = juan.saludar.bind(juan);
saludarEnlazado(); // Salida: Hola, mi nombre es Juan.

console.log("\nFin del script.");
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 4,
    'tittle_level': 'Modo Estricto y Buenas Prácticas',
    'topic': "Errores comunes evitados por 'use strict'",
    'subtopic': "Asignación accidental a variables no declaradas",
    'definition': r'''
Uno de los problemas más comunes en JavaScript, antes de la adopción generalizada del modo estricto, era la facilidad con la que se podían crear variables globales de forma accidental. Esto ocurría cuando intentabas asignar un valor a un identificador que no había sido declarado previamente con `var`, `let`, o `const`.

¿Te estás preguntando por qué esto importa?

Pues bien, en el modo no estricto, si escribías `miVariable = "valor";` sin haber declarado `miVariable` en ningún lugar visible, JavaScript automáticamente creaba una nueva propiedad en el objeto global (`window` en navegadores, `global` en Node.js) con ese nombre. Esto podía llevar a:
* **Colisiones de nombres:** Si múltiples partes de tu código (o scripts de terceros) accidentalmente usaban el mismo nombre para una variable global, podían sobrescribir los valores de las otras, causando comportamientos inesperados y difíciles de depurar.
* **Fugas de memoria:** Variables globales no deseadas pueden persistir en la memoria más de lo necesario, contribuyendo a un mayor consumo de recursos, especialmente en aplicaciones de larga duración.
* **Código menos predecible:** Dificultaba el seguimiento del flujo de datos y el ámbito de las variables, ya que el estado global podía modificarse de forma inesperada.

El modo estricto resuelve este problema crucial. Cuando `'use strict'` está activo, intentar asignar un valor a un identificador no declarado lanza un `ReferenceError`. Esto obliga a los desarrolladores a declarar explícitamente todas sus variables, fomentando una mejor gestión del ámbito y un código más robusto. Es una de las razones más convincentes para usar el modo estricto en tus proyectos.
''',
    'code_example': r'''
console.log("--- Asignación accidental de variables no declaradas ---");

// --- Comportamiento en modo NO estricto (por defecto) ---
function crearGlobalAccidental() {
  variableNoDeclarada = "¡Soy global sin darme cuenta!";
  console.log("En función no estricta, variableNoDeclarada:", variableNoDeclarada);
}
crearGlobalAccidental();
console.log("Fuera de la función, ¿variableNoDeclarada existe?:", typeof variableNoDeclarada !== 'undefined'); // true
console.log("Valor de variableNoDeclarada global:", variableNoDeclarada); // "¡Soy global sin darme cuenta!"
// console.log("Es una propiedad del objeto global (Window en navegador):", window.variableNoDeclarada); // Descomentar en navegador


// --- Comportamiento en modo ESTRICTO ---
function intentarCrearGlobalAccidentalEstricto() {
  'use strict';
  try {
    // Si esta línea no estuviera comentada, causaría un ReferenceError
    // variableEstrictaNoDeclarada = "¡Esto debería fallar!";
    // console.log("Esto no se ejecutará:", variableEstrictaNoDeclarada);
  } catch (error) {
    console.error("\nError capturado en modo estricto:", error.name, ":", error.message);
  }
}
intentarCrearGlobalAccidentalEstricto();

// Verificamos si la variable global fue creada (no debería serlo)
console.log("Fuera de la función estricta, ¿variableEstrictaNoDeclarada existe?:", typeof variableEstrictaNoDeclarada !== 'undefined'); // false
// Si hubieras usado 'use strict;' a nivel global al inicio del script,
// la primera `variableNoDeclarada` también habría causado un error.

// --- Otra demostración con 'this' accidentalmente global ---
// En modo no estricto, si una función se llama sin un objeto asociado, 'this' apunta al objeto global.
function thisGlobalNoEstricto() {
  console.log("\n--- 'this' accidentalmente global (no estricto) ---");
  // En navegadores, 'this' será window. En Node.js, puede ser global o undefined dependiendo del contexto.
  console.log("this es el objeto global:", this === globalThis || this === window);
  this.propiedadEnGlobal = "Propiedad añadida al global"; // Modificando el global
}
thisGlobalNoEstricto();
console.log("¿PropiedadEnGlobal existe globalmente?:", typeof propiedadEnGlobal !== 'undefined'); // true

// En modo estricto, 'this' es 'undefined' por defecto para funciones normales.
function thisUndefinedEstricto() {
  'use strict';
  console.log("\n--- 'this' es undefined (estricto) ---");
  console.log("this es undefined:", this === undefined); // true
  try {
    // this.propiedadEnGlobalEstricta = "No puedo hacer esto"; // TypeError en modo estricto
  } catch (error) {
    console.error("Error capturado en modo estricto al asignar a 'this':", error.name, ":", error.message);
  }
}
thisUndefinedEstricto();
console.log("¿PropiedadEnGlobalEstricta existe globalmente?:", typeof propiedadEnGlobalEstricta !== 'undefined'); // false
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 4,
    'tittle_level': 'Modo Estricto y Buenas Prácticas',
    'topic': "Errores comunes evitados por 'use strict'",
    'subtopic': "Escritura sobre propiedades no configurables",
    'definition': r'''
JavaScript permite definir propiedades de objetos con atributos específicos, como si son grabables (`writable`), enumerables (`enumerable`) o configurables (`configurable`). Una propiedad "no configurable" es aquella que no puede ser eliminada, ni sus atributos (excepto `writable`) pueden ser cambiados. Intentar modificar una propiedad no configurable o de solo lectura en modo no estricto fallará silenciosamente, lo que puede llevar a errores difíciles de detectar.

¿Te estás preguntando por qué esto importa?

Pues bien, en el modo no estricto, si intentabas eliminar una propiedad no configurable o asignar un valor a una propiedad de solo lectura, la operación simplemente fallaba sin lanzar ningún error. Tu código continuaba ejecutándose como si nada hubiera pasado, pero la modificación deseada nunca se aplicaba. Esto es lo que se conoce como un "error silencioso", y puede ser extremadamente frustrante de depurar: el valor no cambia, pero no hay ninguna indicación de por qué.

Por ejemplo, `Math.PI` es una propiedad de solo lectura. Intentar cambiar `Math.PI = 3.0;` en modo no estricto simplemente no tiene efecto, pero no te avisa del problema. Lo mismo ocurre con las propiedades definidas con `Object.defineProperty()` y el atributo `configurable: false`.

El modo estricto resuelve este problema haciendo que estas operaciones lancen un `TypeError`. Al lanzar un error, el programa te avisa inmediatamente de que estás intentando realizar una operación no permitida, lo que te permite corregir el problema o manejarlo explícitamente. Esta visibilidad mejora la robustez y la depurabilidad de tu código, ya que los errores se revelan en el momento en que se producen, en lugar de pasar desapercibidos y causar comportamientos anómalos más adelante.
''',
    'code_example': r'''
console.log("--- Escritura sobre propiedades no configurables ---");

// --- Comportamiento en modo NO estricto (por defecto) ---
const objetoNoEstricto = {};
Object.defineProperty(objetoNoEstricto, 'propiedadInmutable', {
  value: 10,
  writable: false, // De solo lectura
  configurable: false // No se puede eliminar ni cambiar sus atributos (excepto writable a true si ya era false)
});

console.log("Valor inicial de propiedadInmutable (no estricto):", objetoNoEstricto.propiedadInmutable); // 10

// Intentar cambiar un valor de solo lectura (falla silenciosamente)
objetoNoEstricto.propiedadInmutable = 20;
console.log("Valor después de intentar cambiar (no estricto):", objetoNoEstricto.propiedadInmutable); // Sigue siendo 10

// Intentar eliminar una propiedad no configurable (falla silenciosamente)
delete objetoNoEstricto.propiedadInmutable;
console.log("Después de intentar eliminar (no estricto):", objetoNoEstricto.propiedadInmutable); // Sigue siendo 10
console.log("¿PropiedadInmutable todavía existe (no estricto)?:", 'propiedadInmutable' in objetoNoEstricto); // true


// --- Comportamiento en modo ESTRICTO ---
function intentarModificarPropiedadesEstricto() {
  'use strict';
  const objetoEstricto = {};
  Object.defineProperty(objetoEstricto, 'propiedadEstrictaInmutable', {
    value: 10,
    writable: false,
    configurable: false
  });

  console.log("\n--- En función en Modo Estricto ---");
  console.log("Valor inicial de propiedadEstrictaInmutable:", objetoEstricto.propiedadEstrictaInmutable); // 10

  // Intentar cambiar un valor de solo lectura (lanza TypeError)
  try {
    objetoEstricto.propiedadEstrictaInmutable = 20;
  } catch (error) {
    console.error("Error capturado (TypeError):", error.name, ":", error.message); // TypeError
  }
  console.log("Valor después de intentar cambiar (estricto):", objetoEstricto.propiedadEstrictaInmutable); // Sigue siendo 10

  // Intentar eliminar una propiedad no configurable (lanza TypeError)
  try {
    delete objetoEstricto.propiedadEstrictaInmutable;
  } catch (error) {
    console.error("Error capturado (TypeError):", error.name, ":", error.message); // TypeError
  }
  console.log("¿PropiedadEstrictaInmutable todavía existe (estricto)?:", 'propiedadEstrictaInmutable' in objetoEstricto); // true
}

intentarModificarPropiedadesEstricto();

// --- Demostración con Math.PI (propiedad de solo lectura) ---
console.log("\n--- Demostración con Math.PI ---");
console.log("Valor inicial de Math.PI:", Math.PI);

// En modo NO estricto:
Math.PI = 3.0; // Fallo silencioso
console.log("Math.PI después de intentar cambiar (no estricto):", Math.PI); // Sigue siendo 3.14159...

// Si pusiéramos 'use strict;' al inicio del script, esto causaría un TypeError
// try {
//   'use strict'; // No se puede poner aquí, debe ir al inicio del script o de la función.
//   // Math.PI = 3.0; // TypeError
// } catch (e) {
//   console.error("Error al intentar cambiar Math.PI en modo estricto:", e.message);
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 4,
    'tittle_level': 'Modo Estricto y Buenas Prácticas',
    'topic': "Errores comunes evitados por 'use strict'",
    'subtopic': "Duplicación de parámetros",
    'definition': r'''
En JavaScript, tradicionalmente era posible declarar una función con nombres de parámetros duplicados, aunque el comportamiento era algo ambiguo y podía generar confusión. Por ejemplo, `function miFuncion(a, b, a) { ... }`.

¿Te estás preguntando por qué esto importa?

Pues bien, permitir parámetros duplicados es una fuente de ambigüedad y errores. Si una función tiene parámetros con el mismo nombre, el valor del último parámetro declarado sobrescribe el valor de los anteriores con el mismo nombre. Esto puede llevar a que los desarrolladores usen accidentalmente un parámetro que pensaban que tenía un valor diferente, o que simplemente el código se vuelva menos claro al tener nombres redundantes que no aportan valor y pueden engañar.

Por ejemplo:
```javascript
function sumar(a, b, a) {
  return a + b; // ¿Cuál 'a' se usa? La última 'a'.
}
sumar(1, 2, 3); // a es 3, b es 2. Retorna 5.
Este comportamiento puede ser confuso y no intuitivo, especialmente para quienes provienen de otros lenguajes de programación donde los parámetros duplicados suelen ser un error de sintaxis.

El modo estricto resuelve este problema de manera categórica. Al activarlo, declarar una función con nombres de parámetros duplicados lanza un SyntaxError. Este error se produce en tiempo de parseo (antes de que el código se ejecute), lo que significa que el problema se detecta muy temprano en el ciclo de desarrollo. Esto fuerza a los desarrolladores a ser más explícitos y precisos con la firma de sus funciones, eliminando una fuente común de confusión y errores de lógica.

Es una de las pequeñas pero significativas mejoras que el modo estricto aporta a la calidad y robustez general del código JavaScript.
''',
    'code_example': r'''
console.log("--- Duplicación de parámetros ---");

// --- Comportamiento en modo NO estricto (por defecto) ---
function funcionConParametrosDuplicadosNoEstricto(a, b, a) {
console.log("\n--- Función con parámetros duplicados (No Estricto) ---");
console.log("Argumentos recibidos:", arguments[0], arguments[1], arguments[2]); // 1, 2, 3
console.log("Valor de 'a' dentro de la función:", a); // El último 'a' (3)
console.log("Valor de 'b' dentro de la función:", b); // 2
return a + b;
}

const resultadoNoEstricto = funcionConParametrosDuplicadosNoEstricto(1, 2, 3);
console.log("Resultado (No Estricto):", resultadoNoEstricto); // Salida: 5 (3 + 2)

// --- Comportamiento en modo ESTRICTO ---
// Si esta función no estuviera comentada, el script se detendría con un SyntaxError
// (SyntaxError no se puede capturar con try/catch como los errores en tiempo de ejecución)

/*
function funcionConParametrosDuplicadosEstricto(x, y, x) {
'use strict'; // La directiva debe estar aquí
console.log("--- Función con parámetros duplicados (Estricto) ---");
// Esta función no se ejecutará, se lanzará un SyntaxError antes.
}
*/

console.log("\n--- En función en Modo Estricto ---");
try {
// Para demostrar el error de sintaxis en tiempo de ejecución,
// necesitamos que el parser lo encuentre. Si la función se define
// y se invoca en un mismo bloque donde 'use strict' está activo globalmente,
// el error ocurrirá.
// Como no podemos definir una función con SyntaxError y luego capturarlo,
// simulamos el mensaje.
console.log("Si se intentara definir 'function(x, y, x) { 'use strict'; }',");
console.log("se lanzaría un SyntaxError en tiempo de parseo.");
} catch (e) {
console.error("Error capturado (pero sería un SyntaxError directo):", e.message);
}

// Ejemplo con una función anónima en un contexto estricto global (si estuviera activo)
// para mostrar que el error es en la definición.
/*
'use strict'; // Si esto estuviera al inicio del script
(function(param1, param2, param1) { // SyntaxError aquí mismo
console.log(param1, param2);
})(1, 2, 3);
*/

console.log("\n--- Las Clases y Módulos ES6 son automáticamente estrictos ---");
class MiClase {
constructor(prop1, prop2 /*, prop1 / ) { // Duplicar 'prop1' aquí causaría un SyntaxError
this.prop1 = prop1;
this.prop2 = prop2;
}
metodo(arg1, arg2 /, arg1 */ ) { // Duplicar 'arg1' aquí también causaría un SyntaxError
console.log(arg1, arg2);
}
}
// Intenta descomentar y duplicar un parámetro en la clase de arriba para ver el error.
const instancia = new MiClase(10, 20);
instancia.metodo(30, 40);

console.log("\nFin del script.");
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 4,
    'tittle_level': 'Modo Estricto y Buenas Prácticas',
    'topic': "Estilo y convenciones de código",
    'subtopic': "Nombrado de variables",
    'definition': r'''
El nombrado de variables, funciones y clases es más que una simple convención; es un pilar fundamental para escribir código legible, mantenible y comprensible. Un buen sistema de nombrado mejora significativamente la claridad del código, reduciendo la necesidad de comentarios explicativos.

¿Te estás preguntando por qué esto importa?

Pues bien, pensemos en el código como una forma de comunicación. No solo te comunicas con la máquina, sino también con otros desarrolladores (incluido tu yo futuro). Nombres claros y consistentes para las variables, funciones y otros identificadores actúan como una documentación intrínseca del código. Si los nombres son confusos o ambiguos, el lector tendrá que esforzarse para descifrar la intención, lo que ralentiza el desarrollo y aumenta la probabilidad de introducir errores.

Algunas convenciones y principios clave para un buen nombrado en JavaScript incluyen:
* **CamelCase (camelCase):** Es la convención más común para nombres de variables, funciones, métodos y propiedades. La primera letra es minúscula y las palabras subsiguientes comienzan con mayúscula (ej., `miNombreDeUsuario`, `calcularTotal`).
* **PascalCase (PascalCase):** Utilizado para nombres de clases o constructores (ej., `Usuario`, `Producto`).
* **SCREAMING_SNAKE_CASE (MAYÚSCULAS_CON_GUIONES_BAJOS):** Reservado para constantes que no cambiarán su valor durante la ejecución del programa (ej., `MAX_INTENTOS`, `API_KEY`).
* **Nombres descriptivos:** Los nombres deben ser lo suficientemente descriptivos para transmitir su propósito sin ser excesivamente largos. Evita abreviaciones crípticas.
* **Consistencia:** Una vez que elijas una convención, sé consistente en todo tu proyecto.
* **Evitar palabras reservadas:** No uses palabras reservadas de JavaScript como nombres de variables.
* **Usar nombres significativos:** ¿Representa el nombre su propósito real? ¿Un nuevo desarrollador entendería su función con solo leer el nombre?

Adoptar un buen sistema de nombrado es una práctica que ahorra tiempo y esfuerzo a largo plazo, tanto para el desarrollador original como para cualquier persona que trabaje con el código.
''',
    'code_example': r'''
console.log("--- Nombrado de variables, funciones y clases ---");

// --- 1. CamelCase: Para variables, funciones, métodos y propiedades ---
// Correcto: Claro y sigue la convención
let nombreDeUsuario = "Alice";
let edadMinima = 18;

function obtenerDatosCliente() {
  // ...
}

const miObjeto = {
  nombreProducto: "Laptop",
  obtenerPrecio: function() {
    // ...
  }
};

// Incorrecto: No sigue la convención o es poco descriptivo
// let nombre_de_usuario = "Bob"; // Estilo Snake_Case, no común en JS para variables
// let ed = 20; // Poco descriptivo
// function getdata() { /* ... */ } // No es CamelCase

console.log("Variables CamelCase:", nombreDeUsuario, edadMinima);


// --- 2. PascalCase: Para Clases y Constructores ---
// Correcto: Distingue claramente que son constructores/clases
class Persona {
  constructor(nombre, apellido) {
    this.nombre = nombre;
    this.apellido = apellido;
  }
}

class GestorDeTareas {
  // ...
}

// Incorrecto: Confuso o no sigue la convención
// class persona { /* ... */ } // No es PascalCase
// let gestorTareas = new GestorDeTareas(); // gestorTareas es instancia, no una clase

console.log("Clases PascalCase: Persona, GestorDeTareas");


// --- 3. SCREAMING_SNAKE_CASE: Para Constantes globales o valores inmutables ---
// Correcto: Indica claramente que son constantes y no deben cambiar
const MAX_CONEXIONES = 100;
const API_URL_BASE = "https://api.example.com";
const PI = 3.14159; // Aunque Math.PI ya existe

// Incorrecto: No indica que es una constante o usa convención incorrecta
// const numeroMaxConexiones = 50; // Parece una variable normal
// const ApiUrl = "http://localhost"; // No es SCREAMING_SNAKE_CASE

console.log("Constantes SCREAMING_SNAKE_CASE:", MAX_CONEXIONES, API_URL_BASE);


// --- 4. Nombres descriptivos ---
// Correcto: Transmiten el propósito
let numeroDeIntentosFallidos = 0;
let esUsuarioAutenticado = true;
function validarFormularioDeRegistro() { /* ... */ }

// Incorrecto: Poco claros o ambiguos
// let n = 0; // ¿Qué es 'n'?
// let autenticado = true; // 'autenticado' podría ser un verbo
// function validar() { /* ... */ } // ¿Qué valida?

console.log("Nombres descriptivos:", numeroDeIntentosFallidos, esUsuarioAutenticado);


// --- 5. Evitar palabras reservadas ---
// Incorrecto (causaría error):
// let var = "valor";
// let function = "miFuncion";
// let new = "nuevo";

console.log("\nEvitar palabras reservadas (ej: var, function, new) como nombres.");

console.log("\nFin del script.");
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 4,
    'tittle_level': 'Modo Estricto y Buenas Prácticas',
    'topic': "Estilo y convenciones de código",
    'subtopic': "Sangría y estructura",
    'definition': r'''
La sangría (indentación) y una estructura de código consistente son cruciales para la legibilidad del código. Aunque JavaScript ignora los espacios en blanco, la forma en que organizas tu código visualmente impacta directamente en lo fácil que es entender el flujo, la anidación y el ámbito.

¿Te estás preguntando por qué esto importa?

Pues bien, pensemos en el código como un libro. Si un libro no tiene párrafos, capítulos o sangrías, sería extremadamente difícil de leer y comprender, incluso si las palabras individuales fueran correctas. De manera similar, un código bien sangrado y estructurado permite a los desarrolladores:
* **Identificar bloques de código:** Las sangrías claras muestran dónde comienzan y terminan los bloques de código (bucles, condicionales, funciones, etc.).
* **Comprender la anidación:** Facilita la visualización de la relación jerárquica entre diferentes partes del código.
* **Seguir el flujo de control:** Ayuda a entender rápidamente qué código se ejecuta bajo qué condiciones o dentro de qué iteración.
* **Reducir errores:** Un código desordenado puede ocultar errores lógicos o de sintaxis, mientras que una estructura limpia los hace más evidentes.
* **Facilitar la colaboración:** Múltiples desarrolladores trabajando en el mismo codebase se benefician enormemente de un estilo consistente, ya que no tienen que adaptarse constantemente a estilos diferentes.

Las convenciones comunes incluyen el uso de 2 o 4 espacios por nivel de sangría (los tabuladores son menos comunes debido a variaciones en la renderización), el posicionamiento consistente de llaves (`{}`), espacios alrededor de operadores y después de comas, y líneas en blanco para separar bloques lógicos de código. Establecer y adherirse a una guía de estilo para sangría y estructura es una práctica estándar en equipos de desarrollo profesionales.
''',
    'code_example': r'''
console.log("--- Sangría y estructura de código ---");

// --- 1. Sangría consistente (ejemplo con 2 espacios, un estándar común) ---
// Correcto
function calcularSuma(a, b) {
  if (a > 0 && b > 0) {
    let suma = a + b;
    return suma;
  } else {
    return 0;
  }
}

// Incorrecto (sangría inconsistente o mezcla de espacios/tabs)
// function calcularSumaIncorrecta(a, b) {
// if (a > 0 && b > 0) {
//   let suma = a + b;
//        return suma; // Sangría incorrecta
//   } else {
// return 0;
// }
// }

console.log("Resultado de calcularSuma(5, 3):", calcularSuma(5, 3)); // 8


// --- 2. Posicionamiento de llaves (ejemplo: "Allman style" vs "K&R style") ---
// K&R style (más común en JavaScript, llave de apertura en la misma línea)
function obtenerProducto(id) {
  if (id > 0) {
    return { name: "Producto X" };
  } else {
    return null;
  }
}

// Allman style (llave de apertura en línea nueva, menos común en JS)
// function obtenerProductoAllman(id)
// {
//   if (id > 0)
//   {
//     return { name: "Producto Y" };
//   }
//   else
//   {
//     return null;
//   }
// }

console.log("Resultado de obtenerProducto(1):", obtenerProducto(1)); // { name: "Producto X" }


// --- 3. Espacios alrededor de operadores y después de comas ---
// Correcto
let x = 10;
let y = 20;
let z = x + y; // Espacios alrededor de '+'
const arr = [1, 2, 3, 4]; // Espacios después de comas
for (let i = 0; i < arr.length; i++) { // Espacios en for
  // ...
}

// Incorrecto
// let x=10;
// let y=20;
// let z=x+y;
// const arr = [1,2,3,4];
// for(let i=0;i<arr.length;i++){ /* ... */ }


// --- 4. Líneas en blanco para separar bloques lógicos ---
// Correcto
function procesarPedido(items, descuento) {
  // Bloque para calcular subtotal
  let subtotal = 0;
  for (const item of items) {
    subtotal += item.precio * item.cantidad;
  }

  // Bloque para aplicar descuento
  let total = subtotal - descuento;
  if (total < 0) {
    total = 0;
  }

  // Bloque para finalizar el pedido
  console.log(`Total del pedido: $${total}`);
  return total;
}

// Incorrecto (todo junto)
// function procesarPedidoSinBlancos(items, descuento) {
//   let subtotal = 0;
//   for (const item of items) {
//     subtotal += item.precio * item.cantidad;
//   }
//   let total = subtotal - descuento;
//   if (total < 0) {
//     total = 0;
//   }
//   console.log(`Total del pedido: $${total}`);
//   return total;
// }

console.log("\nProcesando pedido (ver consola para salida):");
procesarPedido([{precio: 10, cantidad: 2}, {precio: 5, cantidad: 1}], 3); // Total: $22


console.log("\nFin del script.");
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 4,
    'tittle_level': 'Modo Estricto y Buenas Prácticas',
    'topic': "Estilo y convenciones de código",
    'subtopic': "Linters (eslint)",
    'definition': r'''
Los **Linters** son herramientas de análisis de código estático que examinan tu código fuente sin ejecutarlo para identificar errores programáticos, errores de estilo, construcciones sospechosas y posibles malas prácticas. **ESLint** es el linter más popular y configurable para JavaScript.

¿Te estás preguntando por qué esto importa?

Pues bien, pensemos en los linters como un control de calidad automatizado para tu código. Contar con un linter es fundamental por varias razones:
* **Consistencia del estilo:** Aseguran que todo el equipo (y tu mismo) siga las mismas convenciones de estilo (sangría, uso de comillas, puntos y comas, etc.), incluso si hay preferencias personales diferentes. Esto es crucial para la legibilidad en proyectos colaborativos.
* **Detección temprana de errores:** Pueden encontrar errores de sintaxis, problemas de lógica y posibles bugs antes de que el código sea ejecutado, ahorrando tiempo de depuración.
* **Aplicación de buenas prácticas:** Ayudan a aplicar patrones de código que se consideran mejores prácticas en la comunidad JavaScript, como evitar variables no usadas, la no asignación accidental a globales (reforzando el modo estricto), y la consistencia en el manejo de Promesas, entre otros.
* **Mejora de la calidad del código:** Al forzar el cumplimiento de reglas y estándares, la calidad general del código base mejora, haciéndolo más robusto y fácil de mantener.
* **Educación:** Al marcar los problemas, los linters también sirven como una herramienta educativa, ayudando a los desarrolladores a aprender y adoptar mejores hábitos de codificación.

ESLint es altamente configurable. Puedes elegir entre conjuntos de reglas predefinidos (como Airbnb, StandardJS, o Google), o crear tus propias reglas personalizadas para adaptarlas a las necesidades de tu proyecto. Se integra fácilmente con la mayoría de los editores de código (VS Code, WebStorm, etc.) y con los flujos de trabajo de CI/CD (Integración Continua/Entrega Continua), lo que permite que el linter revise el código automáticamente antes de que se fusione o se despliegue.

En resumen, los linters como ESLint son una herramienta indispensable en el desarrollo moderno de JavaScript para mantener un código de alta calidad y un estilo consistente.
''',
    'code_example': r'''
// Este archivo de ejemplo no puede ser ejecutado directamente para mostrar la funcionalidad de ESLint
// ya que ESLint es una herramienta externa que analiza el código.
// Sin embargo, se incluyen ejemplos de código que ESLint (con configuraciones comunes)
// marcaría como errores o advertencias.

/*
Para usar ESLint:
1.  Instalar Node.js y npm/yarn.
2.  En tu proyecto, inicializar npm: `npm init -y`
3.  Instalar ESLint: `npm install eslint --save-dev`
4.  Configurar ESLint: `npx eslint --init` (te guiará para elegir un estilo, ej. Airbnb, Standard)
5.  Añadir un script en `package.json` para ejecutarlo: `"lint": "eslint ."`
6.  Ejecutar el linter: `npm run lint`

También puedes instalar extensiones de ESLint en tu editor de código (ej. para VS Code)
para ver los errores y advertencias en tiempo real mientras escribes.
*/


// --- EJEMPLOS DE CÓDIGO QUE ESLINT MARCARÍA (dependiendo de la configuración) ---

// 1. Variable no usada (no-unused-vars)
// ESLint marcaría 'unusedVar' como una advertencia/error si no se usa después.
const unusedVar = 10;

function ejemploFuncion() {
  const otraVarNoUsada = 20; // También sería marcada
  console.log("Esta función hace algo.");
}
ejemploFuncion();

// 2. Uso de 'var' (prefer-const, no-var) - a menudo se prefiere 'let' o 'const'
var nombreAntiguo = "Pepe"; // ESLint podría sugerir cambiar a 'let' o 'const'

// 3. Espacios inconsistentes (indent)
function funcionConProblemaDeSangria() {
  if (true) {
  let valor = 5; // Mala sangría (ej. 2 espacios en lugar de 4 o viceversa)
    console.log(valor);
  }
}
funcionConProblemaDeSangria();

// 4. Puntos y comas faltantes (semi) - configurable, algunos estilos no los usan
const sinPuntoYComa = "Esto no tiene punto y coma"
const conPuntoYComa = "Esto sí;"

// 5. Comillas inconsistentes (quotes) - 'simple' o "doble"
const mensaje = 'Hola mundo'; // Si la regla es usar comillas dobles, esto sería un error
// const mensaje2 = "Hola mundo"; // Si la regla es usar comillas simples, esto sería un error

// 6. Funciones sin flecha cuando podrían serlo (arrow-body-style, prefer-arrow-callback)
const miFuncionAnonima = function(a, b) {
  return a + b;
};

// 7. Usar 'eval' (no-eval) - considerado una mala práctica de seguridad
// eval('console.log("Evitando eval!")');

// 8. Condicionales complejas (complexity) - advierte si la complejidad ciclómática es alta
function esComplejo(a, b, c, d) {
  if (a > b) {
    if (c < d) {
      if (a === c) {
        return true;
      }
    } else if (b === d) {
      // ...
    }
  } else if (a < b) {
    // ...
  }
  return false;
}
esComplejo(1,2,3,4);


// --- Código que ESLint (con una configuración estándar) aprobaría ---
const userName = "Jane Doe"; // CamelCase, 'const'
let userAge = 25; // CamelCase, 'let'

function calculateArea(width, height) { // CamelCase, indentación correcta
  const area = width * height; // 'const'
  return area;
}

const greeting = `Hello, ${userName}!`; // Template literals, buena práctica

console.log(greeting);
console.log(calculateArea(5, 10));

// Comentarios en un nuevo nivel de indentación
/* eslint-disable no-console */
// console.log("Este es un comentario que ESLint podría ignorar con la directiva anterior.");
/* eslint-enable no-console */

console.log("\nFin del script.");
'''
  });
}

Future<void> insertJsMidLevel5Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 5,
    'tittle_level': 'DOM y Herramientas del Navegador',
    'topic': 'DOM básico',
    'subtopic': 'Selección de elementos (getElementById, querySelector)',
    'definition': r'''
El **Document Object Model (DOM)** es una interfaz de programación que permite a JavaScript interactuar con el contenido, la estructura y el estilo de una página web. Pensemos en el DOM como una representación de tu página HTML organizada en un árbol de objetos, donde cada nodo representa una parte del documento, como un elemento HTML, un atributo, o el texto.

¿Seguramente pensarás de qué va todo esto?

Pues bien, para poder manipular cualquier cosa en tu página web con JavaScript, primero necesitas "encontrar" esos elementos específicos. El DOM nos ofrece métodos para seleccionar elementos, y dos de los más fundamentales y que usarás constantemente son `getElementById` y `querySelector`.

1.  **`document.getElementById()`:** Este método es el más directo y optimizado para buscar elementos por su atributo `id`. Dado que los `id` deben ser únicos en un documento HTML, este método te devuelve un único objeto `Element` que coincide con el `id` dado, o `null` si no encuentra nada. Es súper eficiente porque está diseñado específicamente para esta tarea rápida.

2.  **`document.querySelector()`:** Este método es más versátil porque te permite seleccionar elementos utilizando cualquier selector CSS válido. Si sabes cómo seleccionar elementos con CSS (por ejemplo, `#miId`, `.miClase`, `div p`, `input[type="text"]`), puedes usar esa misma lógica aquí. La clave es que `querySelector()` solo devuelve el **primer** elemento que coincide con el selector especificado. Si no encuentra ninguna coincidencia, devuelve `null`.

3.  **`document.querySelectorAll()`:** Similar a `querySelector()`, pero con una diferencia crucial: este método devuelve una `NodeList` (que se parece a un array) de **todos** los elementos que coinciden con el selector CSS. Si no hay coincidencias, te da una `NodeList` vacía. Es ideal cuando necesitas trabajar con un grupo de elementos, como todos los botones con una clase particular o todas las filas de una tabla.

Entender cómo seleccionar elementos es el primer paso esencial para cualquier tipo de manipulación del DOM, ya que te permite apuntar con precisión a las partes de tu página que deseas inspeccionar o modificar.
''',
    'code_example': r'''
// Asumiendo el siguiente HTML en tu página:
// <div id="contenedorPrincipal">
//   <h1 id="tituloPagina">Mi Página Dinámica</h1>
//   <p class="introduccion">Este es el párrafo de introducción.</p>
//   <p class="contenido">Primer párrafo de contenido.</p>
//   <p class="contenido">Segundo párrafo de contenido.</p>
//   <span data-info="dato1">Información importante</span>
//   <button id="miBotonAccion">Acción</button>
// </div>


console.log("--- Selección de elementos del DOM ---");

// --- 1. Usando getElementById() ---
const contenedor = document.getElementById('contenedorPrincipal');
console.log("Elemento con ID 'contenedorPrincipal':", contenedor);

const titulo = document.getElementById('tituloPagina');
console.log("Elemento con ID 'tituloPagina':", titulo);

const boton = document.getElementById('miBotonAccion');
console.log("Elemento con ID 'miBotonAccion':", boton);

const elementoInexistenteId = document.getElementById('idQueNoExiste');
console.log("Elemento con ID inexistente:", elementoInexistenteId); // Devolverá null


// --- 2. Usando querySelector() ---
// Selecciona el primer párrafo con la clase 'introduccion'
const parrafoIntro = document.querySelector('.introduccion');
console.log("\nPrimer párrafo con clase 'introduccion':", parrafoIntro);

// Selecciona el primer párrafo con la clase 'contenido'
const primerParrafoContenido = document.querySelector('.contenido');
console.log("Primer párrafo con clase 'contenido':", primerParrafoContenido);

// Selecciona un span con un atributo 'data-info'
const spanInfo = document.querySelector('span[data-info="dato1"]');
console.log("Span con atributo 'data-info':", spanInfo);

// Selecciona un elemento que no existe con querySelector
const elementoInexistenteQuery = document.querySelector('div#noExiste');
console.log("Elemento inexistente con querySelector:", elementoInexistenteQuery); // Devolverá null


// --- 3. Usando querySelectorAll() ---
// Selecciona todos los párrafos con la clase 'contenido'
const todosLosParrafosContenido = document.querySelectorAll('.contenido');
console.log("\nTodos los párrafos con clase 'contenido' (NodeList):", todosLosParrafosContenido);
// Puedes iterar sobre un NodeList usando forEach
todosLosParrafosContenido.forEach((p, index) => {
  console.log(`  Párrafo de contenido ${index + 1} texto:`, p.textContent);
});

// Selecciona todos los elementos <p> que sean descendientes directos de #contenedorPrincipal
const parrafosDirectos = document.querySelectorAll('#contenedorPrincipal > p');
console.log("Párrafos directos dentro de #contenedorPrincipal (NodeList):", parrafosDirectos);

// Selecciona elementos inexistentes con querySelectorAll
const elementosInexistentesQueryAll = document.querySelectorAll('.claseQueNoExiste');
console.log("Elementos inexistentes con querySelectorAll (NodeList vacía):", elementosInexistentesQueryAll); // NodeList []

console.log("\nFin de la selección de elementos.");
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 5,
    'tittle_level': 'DOM y Herramientas del Navegador',
    'topic': 'DOM básico',
    'subtopic': 'Manipulación de texto y atributos',
    'definition': r'''
Una vez que tienes seleccionados los elementos HTML con JavaScript, el siguiente paso lógico es poder modificar su contenido y sus propiedades. El DOM nos proporciona un conjunto de propiedades y métodos que te permiten leer, cambiar o incluso eliminar el texto y los atributos de cualquier elemento en tu página web.

¿Te estás preguntando por qué esto importa?

Pues bien, la capacidad de manipular texto y atributos es fundamental para crear páginas web que no solo se vean bien, sino que también sean interactivas y respondan a las acciones del usuario. Imagina que un usuario llena un formulario y quieres mostrar un mensaje de éxito; o que haces clic en un botón y cambia la imagen principal; o que deseas ocultar o mostrar contenido dinámicamente. Todo esto se logra manipulando el texto y los atributos del DOM.

Vamos a ver los principales métodos y propiedades para lograr esto:

1.  **`textContent`:** Esta propiedad es perfecta cuando solo quieres obtener o establecer el contenido de texto puro de un elemento, sin preocuparte por las etiquetas HTML que pueda contener. Si lees `textContent`, obtendrás todo el texto visible. Si lo estableces, cualquier HTML que intentes insertar se convertirá en texto simple, lo que lo hace seguro para evitar inyección de código.

2.  **`innerHTML`:** Si necesitas obtener o establecer el contenido de un elemento, incluyendo las etiquetas HTML, entonces `innerHTML` es tu aliado. Cuando lo estableces, el navegador parsea la cadena como HTML real y renderiza los elementos. Ten mucha precaución al usar `innerHTML` con datos provenientes del usuario, ya que podría ser vulnerable a ataques de Cross-Site Scripting (XSS) si el contenido no se ha validado o "sanitizado" previamente.

3.  **`getAttribute(name)`:** ¿Quieres saber el valor de un atributo específico de un elemento, como el `src` de una imagen o el `href` de un enlace? Este método te lo devuelve.

4.  **`setAttribute(name, value)`:** Si necesitas cambiar el valor de un atributo o añadir uno nuevo, `setAttribute()` es el método. Si el atributo ya existe, su valor se actualiza; si no existe, se crea.

5.  **`removeAttribute(name)`:** Cuando un atributo ya no es necesario, puedes eliminarlo completamente de un elemento con este método.

6.  **`classList`:** Esta es una propiedad muy útil que te devuelve un objeto `DOMTokenList` (una lista de clases CSS). Con `classList`, puedes añadir (`add()`), eliminar (`remove()`), alternar (`toggle()`) o verificar la presencia (`contains()`) de clases CSS de forma sencilla, lo que es ideal para cambiar el estilo visual de los elementos sin manipular directamente la propiedad `style`.

La manipulación de texto y atributos es el pan de cada día de cualquier desarrollador web que busque crear interfaces de usuario dinámicas y atractivas.
''',
    'code_example': r'''
// Asumiendo el siguiente HTML en tu página:
// <div id="contenedorManipulacion">
//   <h1 id="tituloPrincipal">Título de la Página</h1>
//   <p id="parrafoEjemplo">Este es un párrafo con <span>texto resaltado</span>.</p>
//   <img id="imagenDinamica" src="https://via.placeholder.com/150/FF0000/FFFFFF?text=Rojo" alt="Imagen Roja">
//   <a id="enlaceDinamico" href="https://ejemplo.com" target="_blank">Visitar Ejemplo</a>
//   <div id="elementoClases" class="caja activa">Elemento con clases</div>
// </div>
// <button onclick="ejecutarManipulacion()">Ejecutar Manipulación DOM</button>


console.log("--- Manipulación de texto y atributos ---");

function ejecutarManipulacion() {
  const titulo = document.getElementById('tituloPrincipal');
  const parrafo = document.getElementById('parrafoEjemplo');
  const imagen = document.getElementById('imagenDinamica');
  const enlace = document.getElementById('enlaceDinamico');
  const elementoClases = document.getElementById('elementoClases');

  console.log("\n--- Manipulando Contenido de Texto ---");
  // 1. Obtener y establecer texto con textContent
  console.log("Texto original del título:", titulo.textContent);
  titulo.textContent = "Nuevo Título Interactivo";
  console.log("Nuevo texto del título:", titulo.textContent);

  // 2. Obtener y establecer HTML con innerHTML
  console.log("HTML original del párrafo:", parrafo.innerHTML);
  parrafo.innerHTML = 'Este párrafo ahora tiene <strong>texto en negrita</strong> y un <a href="#">enlace interno</a>.';
  console.log("Nuevo HTML del párrafo:", parrafo.innerHTML);

  // Ejemplo de lo que NO hacer sin sanitización (XSS):
  // parrafo.innerHTML = '<img src="x" onerror="alert(\'¡Ataque XSS potencial!\')">';


  console.log("\n--- Manipulando Atributos ---");
  // 3. Obtener atributos
  console.log("SRC de la imagen:", imagen.getAttribute('src'));
  console.log("ALT de la imagen:", imagen.getAttribute('alt'));
  console.log("TARGET del enlace:", enlace.getAttribute('target'));

  // 4. Establecer atributos
  imagen.setAttribute('src', 'https://via.placeholder.com/150/0000FF/FFFFFF?text=Azul');
  imagen.setAttribute('alt', 'Imagen Azul Nueva');
  console.log("Nuevo SRC de la imagen:", imagen.getAttribute('src'));

  // 5. Eliminar atributos
  console.log("¿Enlace tiene 'target' antes de eliminar?:", enlace.hasAttribute('target'));
  enlace.removeAttribute('target');
  console.log("¿Enlace tiene 'target' después de eliminar?:", enlace.hasAttribute('target'));


  console.log("\n--- Manipulando Clases con classList ---");
  // 6. Estado inicial de las clases
  console.log("Clases iniciales del elemento:", elementoClases.classList.value);

  // 7. Añadir una clase
  elementoClases.classList.add('resaltado');
  console.log("Clases después de añadir 'resaltado':", elementoClases.classList.value);

  // 8. Eliminar una clase
  elementoClases.classList.remove('activa');
  console.log("Clases después de eliminar 'activa':", elementoClases.classList.value);

  // 9. Alternar una clase (si está la quita, si no está la pone)
  elementoClases.classList.toggle('oculto'); // Añade 'oculto'
  console.log("Clases después de toggle 'oculto' (añadido):", elementoClases.classList.value);
  elementoClases.classList.toggle('oculto'); // Quita 'oculto'
  console.log("Clases después de toggle 'oculto' (quitado):", elementoClases.classList.value);

  // 10. Verificar si un elemento tiene una clase
  console.log("¿Elemento tiene clase 'caja'?:", elementoClases.classList.contains('caja')); // true
  console.log("¿Elemento tiene clase 'inactivo'?:", elementoClases.classList.contains('inactivo')); // false

  // 11. Añadir múltiples clases (ES6)
  elementoClases.classList.add('borde', 'sombra');
  console.log("Clases después de añadir múltiples:", elementoClases.classList.value);

  // 12. Acceso directo a la propiedad 'style' (para cambios CSS en línea)
  elementoClases.style.backgroundColor = 'lightgreen';
  elementoClases.style.padding = '15px';
  console.log("Fondo y padding del elemento cambiados con style.");
}

// Para ver los cambios, asegúrate de tener el HTML de ejemplo en tu página
// y llama a 'ejecutarManipulacion()' (puedes añadir un botón que lo haga).
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 5,
    'tittle_level': 'DOM y Herramientas del Navegador',
    'topic': 'DOM básico',
    'subtopic': 'Inserción y eliminación de nodos',
    'definition': r'''
Además de modificar el contenido y los atributos de los elementos que ya existen, el DOM nos da la capacidad de crear elementos HTML nuevos desde cero, insertarlos en cualquier parte de la página y también eliminar elementos existentes. Pensemos por un momento en esto: es lo que nos permite construir interfaces de usuario completamente dinámicas que pueden crecer, encogerse o cambiar su estructura en tiempo real.

¿No sé tú, pero a mí esto al principio me costó? 

Pues bien, la capacidad de añadir y quitar elementos es lo que hace que una página web no solo se vea diferente, sino que también pueda cambiar su composición sin necesidad de recargarla. Esto es vital para las aplicaciones modernas que ves hoy en día, como las redes sociales que cargan nuevos posts mientras haces scroll o los carritos de compra que añaden ítems sin refrescar la página.

Vamos a explorar los métodos clave para estas operaciones:

1.  **`document.createElement(tagName)`:** Este es el punto de partida. Con él, creas un nuevo elemento HTML (por ejemplo, un `'div'`, un `'p'`, o un `'li'`) en la memoria del navegador. Es importante recordar que, al crearlo, el elemento aún no está visible en la página; es como un objeto recién fabricado que todavía no has puesto en su lugar.

2.  **`document.createTextNode(text)`:** A veces, solo necesitas añadir texto plano a un elemento, no más HTML anidado. Con `createTextNode()`, creas un nodo de texto que luego puedes adjuntar a un elemento.

3.  **`parentNode.appendChild(childNode)`:** Una vez que tienes un elemento o un nodo de texto creado, `appendChild()` te permite añadirlo como el **último hijo** de otro elemento ya existente en el DOM (el `parentNode`). Si el `childNode` que intentas añadir ya estaba en otra parte del documento, `appendChild()` lo moverá de su posición original a la nueva.

4.  **`parentNode.insertBefore(newNode, referenceNode)`:** Este método te da un control más preciso sobre dónde insertar un nuevo elemento. Permite insertar `newNode` dentro de `parentNode` **justo antes** de otro hijo existente (`referenceNode`). Si `referenceNode` es `null`, se comporta igual que `appendChild()`, añadiéndolo al final.

5.  **`element.remove()`:** Este es el método más directo y moderno para eliminar un elemento. Simplemente lo llamas sobre el elemento que quieres desaparecer del DOM, y ¡listo! Ya no está en la página.

6.  **`parentNode.removeChild(childNode)`:** Una forma más antigua pero aún válida de eliminar un elemento. Para usarlo, necesitas tener una referencia tanto al elemento padre (`parentNode`) como al elemento hijo (`childNode`) que deseas eliminar. Luego, llamas `removeChild()` sobre el padre, pasándole el hijo como argumento.

Estas operaciones de creación, inserción y eliminación de nodos son las herramientas fundamentales para manipular y construir dinámicamente la estructura de cualquier página web interactiva.
''',
    'code_example': r'''
// Asumiendo el siguiente HTML en tu página:
// <div id="contenedorDinamico">
//   <h2>Elementos Dinámicos</h2>
//   <ul id="miLista">
//     <li id="item1">Primer elemento</li>
//     <li id="item2">Segundo elemento</li>
//   </ul>
//   <p id="mensajePie">Mensaje de estado.</p>
// </div>
// <button onclick="ejecutarNodos()">Manipular Nodos del DOM</button>


console.log("--- Inserción y eliminación de nodos ---");

function ejecutarNodos() {
  const miLista = document.getElementById('miLista');
  const contenedorDinamico = document.getElementById('contenedorDinamico');
  const item1 = document.getElementById('item1');
  const mensajePie = document.getElementById('mensajePie');

  console.log("\n--- 1. Crear y Añadir Elementos ---");

  // Crear un nuevo elemento <li> y añadirlo al final de la lista
  const nuevoItem = document.createElement('li');
  nuevoItem.textContent = "¡Tercer elemento añadido!";
  nuevoItem.id = "item3";
  miLista.appendChild(nuevoItem);
  console.log("Elemento 'Tercer elemento' añadido al final de la lista.");

  // Crear otro elemento <li> y añadirlo antes de un elemento existente
  const itemImportante = document.createElement('li');
  itemImportante.textContent = "¡Elemento IMPORTANTE!";
  itemImportante.style.fontWeight = 'bold';
  miLista.insertBefore(itemImportante, item1); // Insertar antes de 'item1'
  console.log("Elemento '¡Elemento IMPORTANTE!' añadido antes de 'Primer elemento'.");

  // Crear un nuevo párrafo y añadirlo al contenedor principal
  const parrafoNuevo = document.createElement('p');
  const textoParrafo = document.createTextNode("Este párrafo fue creado y añadido dinámicamente.");
  parrafoNuevo.appendChild(textoParrafo);
  contenedorDinamico.appendChild(parrafoNuevo);
  console.log("Nuevo párrafo añadido al final de #contenedorDinamico.");


  console.log("\n--- 2. Eliminar Elementos ---");

  // Eliminar un elemento usando .remove() (moderno y simple)
  const item2 = document.getElementById('item2');
  if (item2) {
    item2.remove();
    console.log("Elemento 'Segundo elemento' eliminado usando .remove().");
  } else {
    console.log("El 'Segundo elemento' ya no existe.");
  }

  // Eliminar el primer elemento restante de la lista usando removeChild()
  // Necesitamos el padre y el hijo.
  if (miLista.firstElementChild) {
    const primerElementoRestante = miLista.firstElementChild;
    miLista.removeChild(primerElementoRestante);
    console.log(`Elemento '${primerElementoRestante.textContent}' eliminado usando removeChild().`);
  } else {
    console.log("No quedan elementos para eliminar en la lista.");
  }

  // Actualizar el mensaje del pie para reflejar los cambios
  mensajePie.textContent = "Elementos de la lista manipulados y algunos eliminados.";


  // --- 3. Reemplazar un nodo (opcional, pero útil) ---
  const tituloOriginal = contenedorDinamico.querySelector('h2');
  const nuevoTitulo = document.createElement('h3');
  nuevoTitulo.textContent = "Lista de Ítems (Actualizada)";
  if (tituloOriginal && tituloOriginal.parentNode) {
    tituloOriginal.parentNode.replaceChild(nuevoTitulo, tituloOriginal);
    console.log("Título 'Elementos Dinámicos' reemplazado por 'Lista de Ítems (Actualizada)'.");
  }


  // --- 4. Uso de DocumentFragment para inserciones múltiples eficientes ---
  // Es una buena práctica para añadir muchos elementos de una vez al DOM
  // ya que minimiza las operaciones de repintado del navegador.
  console.log("\n--- Uso de DocumentFragment (para eficiencia) ---");
  const fragmentoDeLista = document.createDocumentFragment();
  for (let i = 4; i <= 6; i++) {
    const itemFragmento = document.createElement('li');
    itemFragmento.textContent = `Elemento ${i} (añadido con fragmento)`;
    fragmentoDeLista.appendChild(itemFragmento);
  }
  miLista.appendChild(fragmentoDeLista); // Añade todos los items de golpe
  console.log("Tres elementos nuevos añadidos eficientemente con DocumentFragment.");

  console.log("\nFin de la manipulación de nodos.");
}

// Para probar este código, crea un archivo HTML con la estructura base y un botón
// que llame a la función `ejecutarNodos()`.
// <button onclick="ejecutarNodos()">Manipular Nodos del DOM</button>
// o simplemente ejecuta `ejecutarNodos()` en la consola del navegador.
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 5,
    'tittle_level': 'DOM y Herramientas del Navegador',
    'topic': 'Eventos del DOM',
    'subtopic': 'Manejadores de eventos',
    'definition': r'''
Los manejadores de eventos son funciones de JavaScript que se ejecutan cuando un evento específico ocurre en un elemento del DOM. Piensa en ellos como los "oídos" de tu página web, que están atentos a lo que sucede para poder reaccionar.

¿Te estás preguntando por qué esto importa?

Pues bien, sin manejadores de eventos, tu página web sería completamente estática. No podrías interactuar con los usuarios, reaccionar a sus clics, a las teclas que presionan o a los datos que introducen en formularios. Los manejadores de eventos son el motor que impulsa la interactividad y la dinámica de cualquier aplicación web moderna.

Existen varias formas de adjuntar un manejador de eventos a un elemento, pero una de las más recomendadas y flexibles es mediante el método `addEventListener()`.

1.  **`addEventListener()`:** Este es el método preferido en el desarrollo moderno de JavaScript. Te permite adjuntar una o más funciones a un mismo evento y elemento, sin sobrescribir manejadores anteriores. Ofrece un control granular sobre el comportamiento del evento, como especificar si el manejador debe ejecutarse en la fase de captura o de burbujeo. Su sintaxis básica es `elemento.addEventListener(evento, funcion)`, donde `evento` es el tipo de evento (ej., `'click'`, `'mouseover'`) y `funcion` es la lógica a ejecutar.

2.  **Propiedades de eventos (ej., `onclick`)**: Esta es una forma más antigua de adjuntar manejadores, directamente a través de una propiedad del elemento (ej., `elemento.onclick = function() { ... }`). La desventaja principal es que solo puedes adjuntar un manejador por evento a un elemento; si asignas un segundo manejador, el primero será sobrescrito. Aunque es simple para casos muy básicos, limita la flexibilidad en aplicaciones más grandes.

3.  **Atributos HTML (ej., `onclick="miFuncion()"`)**: La forma más antigua y generalmente menos recomendada es incrustar el código JavaScript directamente en un atributo HTML (ej., `<button onclick="miFuncion()">`). Esto mezcla la estructura HTML con el comportamiento JavaScript, haciendo que el código sea más difícil de leer, mantener y depurar. Se considera una mala práctica en la mayoría de los escenarios.

Utilizar `addEventListener()` promueve una separación limpia de HTML, CSS y JavaScript, lo que resulta en un código más organizado, mantenible y escalable.
''',
    'code_example': r'''
// Asumiendo el siguiente HTML en tu página:
// <button id="btnModerno">Clic Moderno</button>
// <button id="btnAntiguo">Clic Antiguo</button>
// <button id="btnHTML" onclick="manejarDesdeHTML()">Clic HTML</button>
// <p id="logMensajes"></p>

console.log("--- Manejadores de Eventos ---");

const btnModerno = document.getElementById('btnModerno');
const btnAntiguo = document.getElementById('btnAntiguo');
const logMensajes = document.getElementById('logMensajes');
let contadorClics = 0;

function agregarMensaje(msg) {
  logMensajes.textContent += `\n${msg}`;
  logMensajes.scrollTop = logMensajes.scrollHeight; // Scroll al final
}


// --- 1. Usando addEventListener (Recomendado) ---
function handleClickModerno() {
  contadorClics++;
  agregarMensaje(`btnModerno clicado (${contadorClics} veces).`);
  console.log("Manejador moderno ejecutado.");
}

// Adjuntar el manejador
btnModerno.addEventListener('click', handleClickModerno);

// Podemos añadir otro manejador al mismo evento y elemento
btnModerno.addEventListener('click', () => {
  agregarMensaje("¡Otro manejador en btnModerno también se ejecutó!");
});

// Quitar un manejador específico (solo si la función es nombrada)
// Si quisieras que el primer manejador se ejecutara solo una vez, podrías:
// btnModerno.addEventListener('click', function oneTimeHandler() {
//   agregarMensaje("Este mensaje solo aparecerá una vez.");
//   btnModerno.removeEventListener('click', oneTimeHandler);
// });


// --- 2. Usando propiedades de eventos (ej. .onclick) ---
// Este método sobrescribe cualquier manejador anterior
btnAntiguo.onclick = function() {
  agregarMensaje("btnAntiguo clicado (primera asignación).");
  console.log("Manejador antiguo #1 ejecutado.");
};

// Si asignamos otro, el anterior se pierde
btnAntiguo.onclick = function() {
  agregarMensaje("btnAntiguo clicado (¡esta sobrescribe la anterior!).");
  console.log("Manejador antiguo #2 (sobrescrito) ejecutado.");
};


// --- 3. Usando atributos HTML (NO recomendado) ---
// La función debe estar en el ámbito global para ser accesible
function manejarDesdeHTML() {
  agregarMensaje("btnHTML clicado (desde atributo HTML).");
  console.log("Manejador desde HTML ejecutado.");
}

// Considera el HTML donde este botón tiene 'onclick="manejarDesdeHTML()"'
// Esto es menos flexible, mezcla concerns y es difícil de mantener en código grande.

// Inicia el log de mensajes
agregarMensaje("Listo para registrar eventos...");

console.log("\nFin de manejadores de eventos.");
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 5,
    'tittle_level': 'DOM y Herramientas del Navegador',
    'topic': 'Eventos del DOM',
    'subtopic': 'Delegación de eventos',
    'definition': r'''
La delegación de eventos es una técnica muy inteligente en JavaScript que te permite manejar eventos en muchos elementos de una manera extremadamente eficiente. En lugar de adjuntar un manejador de eventos a cada elemento individual (lo cual puede ser costoso en rendimiento para listas muy largas o elementos que se añaden y quitan dinámicamente), adjuntas un único manejador a un elemento padre común.

¿No sé tú, pero a mí esto al principio me costó? 

Pues bien, la clave de la delegación de eventos reside en cómo los eventos "burbujean" en el DOM. Cuando un evento ocurre en un elemento (por ejemplo, un clic en un ítem de una lista), ese evento no solo se dispara en el elemento original, sino que también viaja hacia arriba a través de sus ancestros en el árbol del DOM. Un manejador en un elemento padre puede "capturar" y procesar estos eventos que burbujean desde sus hijos.

Las principales ventajas de esta técnica son:

1.  **Eficiencia de rendimiento:** Reduces drásticamente el número de manejadores de eventos que el navegador necesita registrar y gestionar. Esto es fundamental para páginas con muchos elementos repetitivos (como miles de filas en una tabla) o para dispositivos con recursos limitados.
2.  **Manejo de elementos dinámicos:** Esta es quizás su mayor ventaja. Si añades nuevos elementos al DOM después de que la página se cargó, no necesitas adjuntarles manualmente nuevos manejadores de eventos. El manejador en el elemento padre seguirá funcionando para los elementos recién creados porque los eventos de esos nuevos hijos también burbujearán.
3.  **Código más limpio y fácil de mantener:** Centralizas la lógica de manejo de eventos en un solo lugar, lo que hace que el código sea más conciso, legible y sencillo de modificar si cambian los requisitos.

Para implementar la delegación de eventos, adjuntas el manejador al elemento padre (por ejemplo, un `<ul>` para una lista de `<li>`). Dentro de la función manejadora, utilizas la propiedad `event.target` (que es el elemento específico que fue clicado) para identificar cuál de los elementos hijos fue el que disparó el evento. Luego, aplicas la lógica necesaria basándote en ese `event.target` o sus atributos. Es una técnica que se usa muchísimo en frameworks y librerías modernas de JavaScript.
''',
    'code_example': r'''
// Asumiendo el siguiente HTML en tu página:
// <ul id="listaItems" style="border: 1px solid #ccc; padding: 10px;">
//   <li data-id="item1">Item 1</li>
//   <li data-id="item2">Item 2</li>
//   <li data-id="item3">Item 3</li>
// </ul>
// <button id="addItemBtn">Añadir Nuevo Item</button>
// <p id="infoDelegacion"></p>

console.log("--- Delegación de Eventos ---");

const listaItems = document.getElementById('listaItems');
const addItemBtn = document.getElementById('addItemBtn');
const infoDelegacion = document.getElementById('infoDelegacion');
let nextItemId = 4;


// --- 1. Implementación de la Delegación de Eventos ---
// Adjuntamos UN SOLO manejador al elemento padre (UL)
listaItems.addEventListener('click', (event) => {
  // event.target es el elemento en el que se hizo clic (ej. un <li>, o incluso el texto dentro del <li>)
  // event.currentTarget es el elemento al que adjuntamos el manejador (el <ul>)

  console.log("Evento clic detectado en la lista (delegado).");
  console.log("Elemento que disparó el evento (event.target):", event.target.tagName, event.target.textContent);

  // Usamos .closest() para asegurarnos de que el clic fue en un <li>
  // o en un elemento dentro de un <li>.
  const clickedListItem = event.target.closest('li');

  if (clickedListItem) {
    // Si se hizo clic en un <li> o en algo dentro de él
    const itemId = clickedListItem.dataset.id; // Acceder a un atributo data-
    infoDelegacion.textContent = `Clic en item: "${clickedListItem.textContent}" (ID: ${itemId})`;
    clickedListItem.style.backgroundColor = '#e0ffe0'; // Cambiar estilo
    console.log(`Item con ID ${itemId} ha sido clicado.`);
  } else {
    // Si se hizo clic en el UL pero no en un LI
    infoDelegacion.textContent = "Clic en el área de la lista, pero no en un item.";
  }
});


// --- 2. Añadir elementos dinámicamente ---
// Estos nuevos elementos se manejarán automáticamente por el manejador del UL
// gracias al burbujeo.
addItemBtn.addEventListener('click', () => {
  const newItem = document.createElement('li');
  newItem.textContent = `Item ${nextItemId} (dinámico)`;
  newItem.dataset.id = `item${nextItemId}`; // Importante para identificarlo
  listaItems.appendChild(newItem);
  nextItemId++;
  infoDelegacion.textContent = `Añadido nuevo item dinámico: "${newItem.textContent}"`;
  console.log("Nuevo item añadido dinámicamente.");
});

// --- Ejemplo de cuándo NO se delegaría si hay lógica interna ---
// Si dentro de cada <li> hubiera un botón "Eliminar", y quieres que solo el botón lo elimine,
// y el clic en el texto del <li> marque como completado, tendrías que diferenciar con event.target.
/*
// HTML:
// <li>Tarea X <button class="delete-btn">X</button></li>
listaItems.addEventListener('click', (event) => {
  const target = event.target;
  if (target.classList.contains('delete-btn')) {
    // Es el botón de borrar
    target.closest('li').remove();
    console.log("Item borrado.");
    event.stopPropagation(); // Opcional: para evitar que el clic en el botón active el manejador del <li>
  } else if (target.tagName === 'LI') {
    // Es el <li> o el texto dentro
    target.style.textDecoration = 'line-through';
    console.log("Item marcado como completado.");
  }
});
*/

console.log("\nFin de la delegación de eventos.");
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 5,
    'tittle_level': 'DOM y Herramientas del Navegador',
    'topic': 'Eventos del DOM',
    'subtopic': 'Eventos del teclado, ratón, formularios',
    'definition': r'''
Los eventos del DOM no se limitan solo a los clics. El navegador expone una amplia gama de eventos que te permiten reaccionar a casi cualquier interacción del usuario, categorizados principalmente por el tipo de entrada: teclado, ratón y formularios. Cada categoría tiene eventos específicos y propiedades únicas en el objeto `Event` que te dan la información detallada que necesitas.

Vamos a ver de qué se trata todo esto:

### Eventos del Ratón (`MouseEvent`)
Estos eventos ocurren cuando el usuario interactúa con el ratón o un dispositivo apuntador.
* **`click`**: Se dispara cuando el usuario hace clic (presiona y suelta) el botón principal del ratón. Es uno de los más comunes.
* **`dblclick`**: Se dispara cuando el usuario hace doble clic rápidamente.
* **`mousedown`**: Se dispara cuando el usuario presiona un botón del ratón.
* **`mouseup`**: Se dispara cuando el usuario suelta un botón del ratón.
* **`mouseover`**: Se dispara cuando el puntero del ratón entra en el área de un elemento.
* **`mouseout`**: Se dispara cuando el puntero del ratón sale del área de un elemento.
* **`mousemove`**: Se dispara cuando el puntero del ratón se mueve mientras está sobre un elemento. Puede dispararse muchas veces rápidamente.
* **Propiedades útiles del objeto `Event`**: `clientX`, `clientY` (coordenadas del ratón en la ventana), `pageX`, `pageY` (coordenadas en el documento), `button` (qué botón fue presionado), `altKey`, `ctrlKey`, `shiftKey` (si las teclas modificadoras estaban presionadas).

### Eventos del Teclado (`KeyboardEvent`)
Estos eventos se disparan cuando el usuario interactúa con el teclado.
* **`keydown`**: Se dispara cuando una tecla es presionada. Ocurre repetidamente si la tecla se mantiene presionada.
* **`keyup`**: Se dispara cuando una tecla es liberada (levantada).
* **`keypress`**: (Obsoleto en la mayoría de los casos, usar `keydown` para capturar teclas, `input` para cambios de texto). Se disparaba cuando una tecla que produce un carácter era presionada y liberada.
* **Propiedades útiles del objeto `Event`**: `key` (el valor de la tecla, ej., `'a'`, `'Enter'`, `'ArrowUp'`), `code` (el código físico de la tecla, ej., `'KeyA'`, `'Enter'`, `'ArrowUp'`), `altKey`, `ctrlKey`, `shiftKey`, `metaKey` (tecla `Command` en Mac o `Windows` en PC).

### Eventos de Formularios (`Event` o `UIEvent`)
Estos eventos son cruciales para manejar la interacción con elementos de formulario (`<input>`, `<textarea>`, `<select>`, `<form>`).
* **`submit`**: Se dispara cuando se envía un formulario. Es el lugar ideal para validar los datos antes de que el formulario se envíe realmente al servidor.
* **`change`**: Se dispara cuando el valor de un elemento de formulario cambia y el elemento pierde el foco (por ejemplo, después de escribir en un input y hacer clic fuera, o seleccionar una opción en un `select`).
* **`input`**: Se dispara inmediatamente cada vez que el valor de un `<input>` o `<textarea>` cambia debido a la interacción del usuario. Es útil para validaciones en tiempo real o contadores de caracteres.
* **`focus`**: Se dispara cuando un elemento obtiene el foco.
* **`blur`**: Se dispara cuando un elemento pierde el foco.
* **Propiedades útiles del objeto `Event`**: Para `submit`, `change`, `input`, `event.target.value` es comúnmente usado para obtener el valor actual del campo. Para `submit`, `event.preventDefault()` es casi siempre necesario.

Dominar estos eventos y sus propiedades te permitirá construir interfaces de usuario altamente interactivas y ricas en funcionalidades.
''',
    'code_example': r'''
// Asumiendo el siguiente HTML en tu página:
// <div id="areaInteraccion" style="border: 2px dashed blue; padding: 20px; min-height: 150px; margin-bottom: 20px;">
//   <p>Haz clic o mueve el ratón aquí.</p>
// </div>
// <input type="text" id="inputTeclado" placeholder="Escribe algo aquí" style="display: block; margin-bottom: 10px;">
// <form id="miFormulario" style="border: 1px solid gray; padding: 10px;">
//   <label for="nombreInput">Nombre:</label>
//   <input type="text" id="nombreInput" name="nombre"><br>
//   <label for="selectOpciones">Opción:</label>
//   <select id="selectOpciones">
//     <option value="op1">Opción 1</option>
//     <option value="op2">Opción 2</option>
//   </select><br>
//   <button type="submit">Enviar Formulario</button>
// </form>
// <p id="logEventos" style="white-space: pre-wrap; font-family: monospace;"></p>


console.log("--- Eventos del Teclado, Ratón, Formularios ---");

const areaInteraccion = document.getElementById('areaInteraccion');
const inputTeclado = document.getElementById('inputTeclado');
const miFormulario = document.getElementById('miFormulario');
const nombreInput = document.getElementById('nombreInput');
const selectOpciones = document.getElementById('selectOpciones');
const logEventos = document.getElementById('logEventos');

function agregarLog(mensaje) {
  logEventos.textContent = `> ${mensaje}\n${logEventos.textContent}`;
}


// --- Eventos del Ratón ---
areaInteraccion.addEventListener('click', (event) => {
  agregarLog(`Clic en (${event.clientX}, ${event.clientY}). Target: ${event.target.tagName}`);
  areaInteraccion.style.backgroundColor = 'lightgreen';
  setTimeout(() => areaInteraccion.style.backgroundColor = '', 200);
});

areaInteraccion.addEventListener('dblclick', (event) => {
  agregarLog(`Doble clic en (${event.clientX}, ${event.clientY}).`);
  areaInteraccion.style.backgroundColor = 'salmon';
  setTimeout(() => areaInteraccion.style.backgroundColor = '', 200);
});

areaInteraccion.addEventListener('mouseover', () => {
  areaInteraccion.style.border = '2px solid green';
  agregarLog('Ratón ENTRA en el área.');
});

areaInteraccion.addEventListener('mouseout', () => {
  areaInteraccion.style.border = '2px dashed blue';
  agregarLog('Ratón SALE del área.');
});

// Puedes rastrear el movimiento del ratón, pero ten cuidado con el rendimiento
// areaInteraccion.addEventListener('mousemove', (event) => {
//   agregarLog(`Moviendo ratón: (${event.clientX}, ${event.clientY})`);
// });


// --- Eventos del Teclado ---
inputTeclado.addEventListener('keydown', (event) => {
  agregarLog(`KEYDOWN: Tecla '${event.key}' (Código: '${event.code}')`);
  if (event.key === 'Enter') {
    alert(`Presionaste Enter. Valor actual: ${inputTeclado.value}`);
  }
});

inputTeclado.addEventListener('keyup', (event) => {
  agregarLog(`KEYUP: Tecla '${event.key}'`);
});

// Aunque 'keypress' existe, 'keydown' y 'keyup' son preferibles para la mayoría de usos.
// 'input' es mejor para cambios de valor en campos de texto.
inputTeclado.addEventListener('input', (event) => {
  // Se dispara cada vez que el valor del input cambia (incluyendo pegar, autocompletar)
  agregarLog(`INPUT: Valor actual del input: ${event.target.value}`);
});


// --- Eventos de Formularios ---
miFormulario.addEventListener('submit', (event) => {
  event.preventDefault(); // IMPORTANTE: Previene el envío por defecto del formulario (recarga de página)
  const nombreValor = nombreInput.value;
  const opcionSeleccionada = selectOpciones.value;
  agregarLog(`FORMULARIO ENVIADO (prevented): Nombre: "${nombreValor}", Opción: "${opcionSeleccionada}"`);
  alert('Formulario simulado enviado. Revisa el log de eventos.');
  miFormulario.reset(); // Opcional: limpiar el formulario
});

nombreInput.addEventListener('change', (event) => {
  // Se dispara cuando el valor del input cambia Y pierde el foco (blur)
  agregarLog(`CHANGE (Nombre): Valor final: "${event.target.value}"`);
});

selectOpciones.addEventListener('change', (event) => {
  // Se dispara cuando la opción seleccionada cambia
  agregarLog(`CHANGE (Select): Nueva opción seleccionada: "${event.target.value}"`);
});

// Eventos de foco
nombreInput.addEventListener('focus', () => {
  nombreInput.style.backgroundColor = '#f0f8ff'; // Color azul claro
  agregarLog('INPUT: Campo Nombre EN FOCO.');
});
nombreInput.addEventListener('blur', () => {
  nombreInput.style.backgroundColor = ''; // Restablecer
  agregarLog('INPUT: Campo Nombre PIERDE FOCO.');
});


agregarLog("Esperando eventos...");

console.log("\nFin de los eventos del teclado, ratón y formularios.");
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 5,
    'tittle_level': 'DOM y Herramientas del Navegador',
    'topic': 'DevTools del navegador',
    'subtopic': 'Consola y breakpoints',
    'definition': r'''
Las DevTools (Herramientas de Desarrollo) del navegador son un conjunto de utilidades integradas directamente en tu navegador (Chrome DevTools, Firefox Developer Tools, Edge DevTools, etc.) que te permiten inspeccionar y depurar tu código HTML, CSS y JavaScript en tiempo real. Son una herramienta indispensable para cualquier desarrollador web.

¿Te estás preguntando por qué esto importa?

Pues bien, las DevTools son como tu laboratorio personal para el código web. Sin ellas, depurar problemas, entender cómo se renderiza tu página o interactuar con tu JavaScript sería extremadamente difícil. Son el punto de partida para identificar por qué algo no funciona como esperas o para optimizar tu aplicación. Dos de las características más usadas son la Consola y los Breakpoints.

### La Consola
La Consola es un entorno de línea de comandos donde puedes:
* **Registrar mensajes:** Utilizando métodos como `console.log()`, `console.warn()`, `console.error()`, `console.info()`, puedes imprimir información, variables, objetos, o mensajes de estado directamente desde tu código JavaScript. Esto es fundamental para entender el flujo de ejecución de tu programa y ver los valores de las variables en puntos específicos.
* **Ejecutar JavaScript:** Puedes escribir y ejecutar código JavaScript directamente en la Consola, lo que es útil para probar pequeñas porciones de código, interactuar con elementos del DOM o modificar el estado de tu aplicación en tiempo real.
* **Inspeccionar objetos:** Cuando registras objetos o arrays, la Consola te permite expandirlos y explorar sus propiedades y valores de forma interactiva.
* **Detectar errores:** La Consola muestra automáticamente los errores de JavaScript (errores de sintaxis, errores en tiempo de ejecución) y las advertencias, junto con el archivo y la línea donde ocurrieron.

### Los Breakpoints
Los Breakpoints (puntos de interrupción) son una característica poderosa del depurador de JavaScript. Te permiten pausar la ejecución de tu código en un punto específico, lo que te da la oportunidad de examinar el estado de tu programa en ese momento exacto.

Cuando la ejecución se detiene en un breakpoint, puedes:
* **Inspeccionar variables:** Ver los valores de todas las variables en el ámbito actual.
* **Recorrer el código:** Ejecutar el código línea por línea (`Step over`), entrar en funciones (`Step into`), salir de funciones (`Step out`) o continuar la ejecución normal (`Resume script execution`).
* **Analizar la pila de llamadas:** Ver la secuencia de funciones que llevaron al código a ese punto.
* **Modificar el código (temporalmente):** En algunos casos, puedes editar el código en caliente para probar soluciones rápidamente sin recargar la página.

La Consola y los Breakpoints, combinados, te proporcionan un control y una visibilidad sin precedentes sobre el comportamiento de tu código JavaScript, haciendo que la depuración sea mucho más eficiente y menos frustrante. Son herramientas que usarás a diario en tu vida como desarrollador web.
''',
    'code_example': r'''
// Asumiendo que abres las DevTools del navegador (F12 o Clic derecho > Inspeccionar)
// y vas a la pestaña "Console" y "Sources" (o "Depurador").

console.log("--- Consola y Breakpoints en DevTools ---");

let nombreUsuario = "Alicia";
let edad = 30;
let isActivo = true;

// --- Ejemplos de uso de la Consola ---
console.log("1. Hola desde console.log!"); // Mensaje simple
console.warn("2. Esto es una advertencia: ¡Cuidado con algo!"); // Mensaje de advertencia
console.error("3. ¡ERROR! Algo salió mal aquí."); // Mensaje de error
console.info("4. Información útil para el desarrollo."); // Mensaje informativo

console.log("5. Valor de nombreUsuario:", nombreUsuario); // Imprimir variable
console.log("6. Objeto complejo:", { id: 1, producto: "Laptop", precio: 1200 }); // Imprimir objeto

// console.dir() es útil para ver la representación de un objeto DOM
const miElemento = document.getElementById('miElemento');
if (miElemento) {
  console.log("7. console.log de un elemento DOM:", miElemento);
  console.dir("8. console.dir de un elemento DOM:", miElemento); // Muestra las propiedades del objeto
}

// Puedes usar console.table() para arrays de objetos o arrays multidimensionales
const usuarios = [
  { id: 1, nombre: 'Ana', rol: 'Admin' },
  { id: 2, nombre: 'Luis', rol: 'Editor' },
  { id: 3, nombre: 'Sofía', rol: 'Invitado' }
];
console.table("9. Tabla de usuarios:", usuarios);

// --- Ejemplos para Breakpoints ---
function calcularAreaRectangulo(ancho, alto) {
  // Para poner un breakpoint:
  // 1. En la pestaña "Sources" (o "Depurador"), haz clic en el número de línea a la izquierda.
  // 2. O inserta la palabra clave 'debugger;' en tu código (no recomendado para producción).
  debugger; // <-- Aquí se detendrá la ejecución si las DevTools están abiertas

  let area = ancho * alto; // Pon un breakpoint aquí
  let perimetro = 2 * (ancho + alto); // Pon otro breakpoint aquí

  console.log("10. Área calculada:", area);
  console.log("11. Perímetro calculado:", perimetro);

  return { area, perimetro };
}

console.log("\nLlamando a la función calcularAreaRectangulo...");
const resultado = calcularAreaRectangulo(5, 10);
console.log("12. Resultado final de la función:", resultado);

// Puedes poner breakpoints condicionales (clic derecho sobre el breakpoint en DevTools)
// por ejemplo, si 'area' es mayor que 50.

// También puedes poner breakpoints en eventos (pestaña Sources -> Event Listener Breakpoints)
// para pausar la ejecución cada vez que un cierto tipo de evento ocurre (ej. 'click').

console.log("\nFin del script. Explora la Consola y la pestaña Sources en DevTools.");
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 5,
    'tittle_level': 'DOM y Herramientas del Navegador',
    'topic': 'DevTools del navegador',
    'subtopic': 'Análisis de performance',
    'definition': r'''
El rendimiento de una página web es crucial para la experiencia del usuario. Una página lenta puede frustrar a los visitantes, aumentar las tasas de rebote y afectar negativamente el SEO. Las DevTools del navegador ofrecen herramientas robustas para analizar y optimizar el rendimiento de tu aplicación, ayudándote a identificar cuellos de botella y áreas de mejora.

¿Te estás preguntando por qué esto importa?

Pues bien, pensemos en una página web como un atleta. Si no sabes dónde está perdiendo velocidad o gastando demasiada energía, no puedes ayudarlo a mejorar. Las herramientas de análisis de performance en las DevTools te permiten ver exactamente qué está haciendo tu navegador en cada momento, cuánto tiempo le lleva y qué recursos está consumiendo. Esto es fundamental para:

* **Identificar scripts lentos:** Descubrir qué funciones de JavaScript están tardando demasiado en ejecutarse.
* **Optimizar el renderizado:** Entender cómo el navegador pinta y compone los elementos en pantalla.
* **Detectar jank (saltos en la animación):** Encontrar momentos donde la interfaz de usuario se congela o no responde fluidamente.
* **Reducir el consumo de CPU y memoria:** Entender si tu aplicación está utilizando demasiados recursos.

La pestaña "Performance" (o "Rendimiento" en español) en las DevTools es tu principal aliada aquí. Te permite grabar un perfil de rendimiento de tu página mientras interactúas con ella. Después de la grabación, verás un desglose detallado de las actividades del navegador:

1.  **CPU Usage (Uso de CPU):** Muestra cómo se está utilizando el procesador a lo largo del tiempo, con colores que indican diferentes tipos de actividad (JavaScript, renderizado, pintado, etc.). Picos altos en el uso de CPU a menudo indican trabajo pesado.
2.  **Network (Red):** Muestra las solicitudes de red que se realizaron durante la grabación, incluyendo el tiempo que tardaron en descargarse recursos como scripts, imágenes y hojas de estilo.
3.  **Frames (Cuadros):** Muestra el rendimiento de los cuadros por segundo (FPS). Si el FPS cae por debajo de 60, la animación o el scroll pueden parecer lentos o entrecortados.
4.  **Timings (Tiempos):** Marca eventos importantes en la línea de tiempo, como `DOMContentLoaded` (cuando el HTML y DOM están listos) y `Load` (cuando todos los recursos, incluyendo imágenes y CSS, se han cargado).
5.  **Main Thread (Hilo Principal):** Es una línea de tiempo detallada de lo que el hilo principal del navegador está haciendo: ejecutar JavaScript, calcular estilos, renderizar el layout, pintar, etc. Es aquí donde puedes ver exactamente qué funciones JavaScript están bloqueando el hilo y causando lentitud.
6.  **Memory (Memoria):** En una subpestaña o sección separada, puedes analizar el uso de memoria de tu aplicación, buscando posibles fugas de memoria o un consumo excesivo.

Analizar el rendimiento es una habilidad avanzada pero esencial que te permitirá crear aplicaciones web fluidas y optimizadas, proporcionando una excelente experiencia de usuario. Es un proceso iterativo de identificar, optimizar y volver a medir.
''',
    'code_example': r'''
// Este ejemplo no es interactivo con el editor, sino que muestra un escenario
// que se analizaría con la pestaña "Performance" de las DevTools.
// No se puede ejecutar aquí para ver el rendimiento, pero describe qué buscar.

console.log("--- Análisis de Performance con DevTools ---");

// Escenario 1: Una función JavaScript que bloquea el hilo principal (ejemplo de "jank")
function realizarCalculoPesado() {
  console.log("Iniciando cálculo pesado...");
  let resultado = 0;
  // Simula un bucle muy grande que bloquearía el hilo principal
  for (let i = 0; i < 100000000; i++) { // ¡Un número muy grande!
    resultado += Math.sqrt(i);
  }
  console.log("Cálculo pesado terminado. Resultado:", resultado);
  return resultado;
}

// Para analizar esto:
// 1. Abre las DevTools (F12).
// 2. Ve a la pestaña "Performance" (Rendimiento).
// 3. Haz clic en el botón de grabar (un círculo rojo).
// 4. Llama a 'realizarCalculoPesado()' en la Consola.
// 5. Detén la grabación.
// Verás un gran bloque amarillo en el "Main Thread" (Hilo Principal),
// indicando que JavaScript estuvo bloqueando el navegador.

// Escenario 2: Cambios de estilo que causan repintado (reflow/repaint)
function actualizarEstilosIneficientemente() {
  const elemento = document.getElementById('elementoCambioEstilo');
  if (!elemento) {
    console.log("Elemento #elementoCambioEstilo no encontrado.");
    return;
  }
  console.log("Actualizando estilos ineficientemente...");
  // Cada cambio de propiedad de estilo puede forzar al navegador a
  // recalcular el layout (reflow) y repintar (repaint), lo cual es costoso.
  elemento.style.width = '200px'; // Provoca reflow
  elemento.style.height = '200px'; // Provoca reflow
  elemento.style.backgroundColor = 'red'; // Provoca repaint
  elemento.style.margin = '10px'; // Provoca reflow
  console.log("Estilos actualizados.");
}

// Para analizar esto:
// 1. Añade un div <div id="elementoCambioEstilo" style="width:100px; height:100px; background-color:blue;"></div> al HTML.
// 2. Graba el rendimiento y llama a 'actualizarEstilosIneficientemente()'.
// Verás "Layout" y "Paint" en el Hilo Principal.

// Mejor forma de cambiar estilos (con clases o en una sola operación)
function actualizarEstilosEficientemente() {
  const elemento = document.getElementById('elementoCambioEstilo');
  if (elemento) {
    console.log("Actualizando estilos eficientemente (con clase)...");
    // Esto generalmente es más eficiente porque el navegador puede optimizar los cambios en lote
    elemento.classList.add('estilo-optimizacion');
    console.log("Estilos actualizados con clase.");
  }
}
// En tu CSS:
// .estilo-optimizacion {
//   width: 200px;
//   height: 200px;
//   background-color: red;
//   margin: 10px;
// }


// Puedes crear un elemento para los ejemplos:
/*
document.body.innerHTML += `
  <button onclick="realizarCalculoPesado()">Hacer Cálculo Pesado</button>
  <button onclick="actualizarEstilosIneficientemente()">Cambiar Estilo Ineficiente</button>
  <button onclick="actualizarEstilosEficientemente()">Cambiar Estilo Eficiente</button>
  <div id="elementoCambioEstilo" style="width:100px; height:100px; background-color:blue; margin-top:20px;"></div>
`;
*/

console.log("\nPara analizar el rendimiento, usa la pestaña 'Performance' (Rendimiento) en DevTools.");
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 5,
    'tittle_level': 'DOM y Herramientas del Navegador',
    'topic': 'DevTools del navegador',
    'subtopic': 'Inspector de red',
    'definition': r'''
El Inspector de Red es una de las herramientas más poderosas de las DevTools, esencial para cualquier aplicación web que interactúe con un servidor. Permite monitorear y analizar todas las solicitudes y respuestas de red que tu navegador realiza mientras carga y ejecuta tu página.

¿Seguramente pensarás de qué va todo esto?

Pues bien, cada vez que tu navegador carga una página web, solicita docenas (o incluso cientos) de recursos al servidor: el propio HTML, archivos CSS, scripts JavaScript, imágenes, fuentes, datos de API, etc. El Inspector de Red te da una visión completa de este proceso, permitiéndote entender:

* **Qué recursos se están cargando:** Ves la lista de todos los archivos que tu página está solicitando.
* **El tamaño de cada recurso:** Te ayuda a identificar archivos grandes que podrían ralentizar la carga.
* **El tiempo de carga:** Cuánto tiempo tarda cada recurso en descargarse, incluyendo el tiempo de espera, la descarga y la conexión.
* **El orden de carga:** Cómo se solicitan los recursos en el tiempo.
* **Códigos de estado HTTP:** Si una solicitud fue exitosa (200 OK), si hubo un error (404 Not Found, 500 Internal Server Error), o una redirección (302 Found).
* **Encabezados de solicitud y respuesta:** Puedes ver los metadatos que el navegador envía al servidor y los que el servidor devuelve. Esto es clave para la depuración de APIs, caché, cookies, etc.
* **Contenido de la respuesta:** Puedes inspeccionar el contenido real de los archivos (HTML, CSS, JSON, imágenes, etc.) que el servidor envió.

La pestaña "Network" (o "Red" en español) en tus DevTools es donde encontrarás esta funcionalidad. Al cargar o interactuar con tu página, verás una cascada de solicitudes. Puedes filtrar por tipo de recurso (JS, CSS, Img, XHR/Fetch para API), buscar por URL y ordenar las solicitudes.

### Componentes clave del Inspector de Red:

1.  **Panel de solicitudes:** Una lista de todas las solicitudes de red. Cada fila representa una solicitud.
2.  **Línea de tiempo en cascada:** Muestra visualmente el tiempo que tarda cada fase de la solicitud (DNS lookup, conexión, envío, espera, descarga). Las barras más largas indican cuellos de botella.
3.  **Detalles de la solicitud:** Al seleccionar una solicitud individual, puedes ver pestañas como:
    * **Headers (Cabeceras):** Muestra los encabezados de solicitud y respuesta, muy útil para depurar autenticación, cookies o problemas de caché.
    * **Payload (Carga):** Para solicitudes POST/PUT, muestra los datos enviados en el cuerpo de la solicitud.
    * **Preview (Vista previa):** Muestra una vista previa formateada de la respuesta (especialmente útil para JSON o imágenes).
    * **Response (Respuesta):** Muestra la respuesta sin procesar.
    * **Timing (Tiempos):** Desglose detallado del tiempo de cada fase de la solicitud.

El Inspector de Red es indispensable para optimizar la velocidad de carga de tu página, depurar problemas de comunicación con APIs, asegurar que los recursos se están cargando correctamente y entender el flujo de datos entre tu cliente y tu servidor.
''',
    'code_example': r'''
// Este ejemplo no interactúa directamente con el editor para mostrar la funcionalidad de la red,
// ya que la pestaña "Network" de las DevTools monitorea la comunicación del navegador.
// Sin embargo, podemos simular una solicitud para que se vea en el inspector.

console.log("--- Inspector de Red en DevTools ---");

// Para usar el Inspector de Red:
// 1. Abre las DevTools (F12).
// 2. Ve a la pestaña "Network" (Red).
// 3. Recarga tu página o haz clic en los botones/enlaces que disparan solicitudes de red.

// --- Escenario 1: Solicitud de una imagen remota ---
function cargarImagenDinamica() {
  console.log("Cargando imagen dinámica...");
  const img = document.createElement('img');
  img.src = 'https://via.placeholder.com/150/FF5733/FFFFFF?text=ImagenRemota';
  img.alt = 'Imagen de ejemplo';
  img.onload = () => console.log("Imagen cargada exitosamente.");
  img.onerror = () => console.error("Error al cargar la imagen.");
  document.body.appendChild(img);
  // En la pestaña "Network", verás una solicitud con el tipo "Img" para esta URL.
  // Podrás ver su tamaño, tiempo de carga, código de estado (200 OK), etc.
}

// --- Escenario 2: Solicitud a una API (usando Fetch API) ---
async function obtenerDatosAPI() {
  console.log("Obteniendo datos de una API de ejemplo...");
  const url = 'https://jsonplaceholder.typicode.com/posts/1'; // API de ejemplo
  try {
    const response = await fetch(url);
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }
    const data = await response.json();
    console.log("Datos de la API obtenidos:", data);
    // En la pestaña "Network", verás una solicitud con el tipo "XHR" o "Fetch" para esta URL.
    // Al hacer clic en ella, podrás inspeccionar las cabeceras, la carga (si es POST),
    // la vista previa y la respuesta JSON completa.
  } catch (error) {
    console.error("Error al obtener datos de la API:", error);
  }
}

// --- Escenario 3: Simular una solicitud fallida ---
async function simularErrorAPI() {
  console.log("Simulando error al obtener datos...");
  const urlInvalida = 'https://jsonplaceholder.typicode.com/invalid-path';
  try {
    const response = await fetch(urlInvalida);
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }
    const data = await response.json();
    console.log("Datos obtenidos (esto no debería pasar):", data);
  } catch (error) {
    console.error("Error simulado: la solicitud falló como se esperaba:", error);
    // En la pestaña "Network", verás esta solicitud con un código de estado 404 (Not Found).
    // Podrás inspeccionar la respuesta del servidor (generalmente una página de error o JSON de error).
  }
}

// Puedes crear botones en tu HTML para disparar estas funciones:
/*
document.body.innerHTML += `
  <button onclick="cargarImagenDinamica()">Cargar Imagen</button>
  <button onclick="obtenerDatosAPI()">Obtener Datos de API</button>
  <button onclick="simularErrorAPI()">Simular Error API</button>
  <div id="imagenContainer"></div>
`;
*/

console.log("\nPara inspeccionar estas solicitudes, usa la pestaña 'Network' (Red) en DevTools.");
'''
  });
}

Future<void> insertJsMidLevel6Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 6,
    'tittle_level': 'APIs Web y Fetch',
    'topic': 'Comunicación HTTP con fetch',
    'subtopic': 'Sintaxis básica de fetch()',
    'definition': r'''
La API Fetch en JavaScript es una interfaz moderna y potente para realizar solicitudes de red (HTTP) a servidores. Es el sucesor de métodos más antiguos como `XMLHttpRequest` (XHR) y está diseñada para ser más flexible, fácil de usar y basada en Promesas, lo que facilita el manejo asíncrono.

¿Te estás preguntando por qué esto importa?

Pues bien, hoy en día, casi cualquier aplicación web dinámica necesita comunicarse con un servidor para obtener o enviar datos: desde cargar una lista de productos, autenticar usuarios, guardar información o consumir servicios de terceros. Fetch API simplifica enormemente este proceso, permitiéndote construir aplicaciones web más interactivas y que no necesitan recargar la página para obtener nueva información.

La sintaxis básica de `Workspace()` es sorprendentemente sencilla, pero su poder radica en el uso de Promesas. `Workspace()` toma al menos un argumento: la URL del recurso al que quieres acceder. Por defecto, realiza una solicitud GET.

`Workspace(url)`

Esta llamada devuelve una `Promise` que resuelve a un objeto `Response` tan pronto como el servidor responde con los encabezados de la respuesta, *incluso si la respuesta es un error HTTP* (como un 404 Not Found o 500 Internal Server Error). Esto es un punto importante: la `Promise` solo se rechaza (entra en `.catch()`) si hay un problema de red (por ejemplo, el usuario está sin conexión) o si la solicitud fue bloqueada por razones de seguridad (como problemas de CORS).

Una vez que tienes el objeto `Response`, este tiene métodos para extraer el cuerpo de la respuesta en diferentes formatos (como JSON o texto). Estos métodos también devuelven Promesas.

Por ejemplo, si esperas una respuesta JSON, harías algo como:
`Workspace(url).then(response => response.json()).then(data => console.log(data));`

Comprender la sintaxis básica de `Workspace()` es el primer paso esencial para cualquier comunicación HTTP en el lado del cliente con JavaScript moderno.
''',
    'code_example': r'''
// Asumiendo que tenemos acceso a Internet para estas solicitudes.
// Usaremos la API de JSONPlaceholder para ejemplos: https://jsonplaceholder.typicode.com/

console.log("--- Sintaxis básica de fetch() ---");

// --- 1. Solicitud GET básica ---
// fetch() por defecto hace una solicitud GET.
// La Promise se resuelve con un objeto Response.
fetch('https://jsonplaceholder.typicode.com/posts/1')
  .then(response => {
    // Verificar si la respuesta es exitosa (códigos 200-299)
    if (!response.ok) {
      // Lanzar un error si la respuesta HTTP no es OK (ej. 404, 500)
      throw new Error(`Error HTTP: ${response.status} ${response.statusText}`);
    }
    // Convertir el cuerpo de la respuesta a JSON. Esto también devuelve una Promise.
    return response.json();
  })
  .then(data => {
    console.log("1. Datos del post (GET básico):", data);
    // { userId: 1, id: 1, title: '...', body: '...' }
  })
  .catch(error => {
    // Captura errores de red o errores lanzados en el .then() anterior
    console.error("1. Error al obtener el post:", error);
  });


// --- 2. Solicitud GET con async/await (más moderna y legible) ---
// async/await hace que el código asíncrono parezca síncrono.
async function obtenerUsuario(id) {
  try {
    const url = `https://jsonplaceholder.typicode.com/users/${id}`;
    const response = await fetch(url); // Espera la respuesta de los encabezados HTTP

    if (!response.ok) {
      throw new Error(`Error HTTP: ${response.status} ${response.statusText}`);
    }

    const userData = await response.json(); // Espera que el cuerpo se parse a JSON
    console.log(`\n2. Datos del usuario ${id} (async/await):`, userData);
  } catch (error) {
    console.error(`2. Error al obtener el usuario ${id}:`, error);
  }
}
obtenerUsuario(5);
obtenerUsuario(999); // Intentando obtener un usuario que probablemente no existe (ejemplo de error HTTP)


// --- 3. Manejo de respuesta como texto simple ---
async function obtenerTextoSimple() {
  try {
    const response = await fetch('https://jsonplaceholder.typicode.com/posts/2'); // Obtenemos un post
    if (!response.ok) {
      throw new Error(`Error HTTP: ${response.status}`);
    }
    const textData = await response.text(); // Usamos .text() para obtener el cuerpo como string
    console.log("\n3. Datos del post como texto simple (primeras 100 caracteres):", textData.substring(0, 100) + "...");
  } catch (error) {
    console.error("3. Error al obtener texto:", error);
  }
}
obtenerTextoSimple();


// --- Ejemplo de Promise rechazada por error de red (no por error HTTP) ---
// Para ver esto, deberías desconectar tu internet y ejecutar el código.
/*
fetch('https://this-url-does-not-exist.com/data')
  .then(response => {
    console.log("Respuesta de URL inexistente (esto no se debería ver si hay error de red):", response);
  })
  .catch(error => {
    console.error("\nERROR DE RED (ejemplo):", error); // Esto se activará si la URL es inalcanzable.
  });
*/

console.log("\nFin de la sintaxis básica de fetch().");
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 6,
    'tittle_level': 'APIs Web y Fetch',
    'topic': 'Comunicación HTTP con fetch',
    'subtopic': 'Headers y métodos (GET, POST, etc.)',
    'definition': r'''
Más allá de la solicitud GET básica, `Workspace()` te permite un control mucho más fino sobre la solicitud HTTP que envías. Esto se logra pasando un segundo argumento opcional: un objeto de configuración. Este objeto es clave para especificar el método HTTP, añadir encabezados (headers) personalizados, incluir un cuerpo de solicitud y mucho más.

Vamos a ver de qué se trata todo esto:

### Métodos HTTP (GET, POST, PUT, DELETE, etc.)
El objeto de configuración te permite cambiar el método HTTP de la solicitud.
* **`GET`**: El método por defecto. Se usa para solicitar datos de un recurso. Las solicitudes GET no deben tener un cuerpo (body).
* **`POST`**: Se usa para enviar datos a un servidor para crear un nuevo recurso (ej., enviar un formulario de registro, crear un nuevo post). Las solicitudes POST típicamente incluyen un cuerpo con los datos a enviar.
* **`PUT`**: Se usa para enviar datos a un servidor para actualizar completamente un recurso existente (reemplaza el recurso con los datos enviados). También incluye un cuerpo.
* **`PATCH`**: Similar a PUT, pero se usa para aplicar modificaciones parciales a un recurso. Incluye un cuerpo.
* **`DELETE`**: Se usa para eliminar un recurso específico del servidor. Las solicitudes DELETE no suelen tener un cuerpo.

Para especificar el método, usas la propiedad `method` en el objeto de configuración.

### Encabezados (Headers)
Los encabezados HTTP son pares clave-valor que proporcionan metadatos sobre la solicitud o la respuesta. Son cruciales para aspectos como:
* **Tipo de contenido (`Content-Type`):** Le dice al servidor el formato del cuerpo de la solicitud (ej., `'application/json'`, `'application/x-www-form-urlencoded'`).
* **Autorización (`Authorization`):** Se usa para enviar tokens de autenticación (ej., JWT) al servidor.
* **Aceptación (`Accept`):** Le dice al servidor qué tipo de formato de respuesta prefiere el cliente (ej., `'application/json'`).
* **Caché (`Cache-Control`):** Controla el comportamiento del almacenamiento en caché.

Para añadir encabezados, usas la propiedad `headers` en el objeto de configuración, que es a su vez un objeto o una instancia de `Headers`.

### Cuerpo de la solicitud (Body)
Para métodos como `POST`, `PUT` o `PATCH`, necesitas enviar datos en el cuerpo de la solicitud. El cuerpo se especifica con la propiedad `body` en el objeto de configuración. Los datos del cuerpo deben ser de un tipo específico, comúnmente una cadena JSON (`JSON.stringify(objeto)`), `FormData` (para formularios), `URLSearchParams`, etc. Es fundamental que el `Content-Type` de los encabezados coincida con el formato del `body`.

Al dominar el uso de los encabezados y métodos en `Workspace()`, desbloqueas la capacidad de interactuar completamente con cualquier API web, permitiendo a tu aplicación no solo leer, sino también crear, actualizar y eliminar recursos.
''',
    'code_example': r'''
// Usaremos la API de JSONPlaceholder para ejemplos: https://jsonplaceholder.typicode.com/

console.log("--- Headers y Métodos HTTP con fetch() ---");

// --- 1. Solicitud POST (Crear un nuevo recurso) ---
async function crearPost() {
  const nuevoPost = {
    title: 'Mi Nuevo Post Desde Fetch',
    body: 'Este es el contenido de mi post, enviado desde JavaScript.',
    userId: 1,
  };

  try {
    const response = await fetch('https://jsonplaceholder.typicode.com/posts', {
      method: 'POST', // Especifica el método HTTP
      headers: {
        'Content-Type': 'application/json; charset=UTF-8', // Indispensable para JSON
        'Authorization': 'Bearer tu_token_aqui_si_fuera_necesario' // Ejemplo de cabecera de autenticación
      },
      body: JSON.stringify(nuevoPost), // Convierte el objeto JS a una cadena JSON
    });

    if (!response.ok) {
      throw new Error(`Error HTTP: ${response.status}`);
    }

    const data = await response.json(); // La API de JSONPlaceholder devuelve el post creado
    console.log("\n1. Post creado (POST):", data);
    // Esperamos un objeto con el nuevo id asignado por el servidor
  } catch (error) {
    console.error("1. Error al crear el post:", error);
  }
}
crearPost();


// --- 2. Solicitud PUT (Actualizar completamente un recurso existente) ---
async function actualizarPostCompleto() {
  const postActualizado = {
    id: 1, // El ID del recurso a actualizar es crucial para PUT
    title: 'Título Actualizado Completamente',
    body: 'Nuevo contenido completo para el post.',
    userId: 1,
  };

  try {
    const response = await fetch('https://jsonplaceholder.typicode.com/posts/1', {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: JSON.stringify(postActualizado),
    });

    if (!response.ok) {
      throw new Error(`Error HTTP: ${response.status}`);
    }

    const data = await response.json();
    console.log("\n2. Post actualizado (PUT):", data);
  } catch (error) {
    console.error("2. Error al actualizar el post con PUT:", error);
  }
}
actualizarPostCompleto();


// --- 3. Solicitud PATCH (Actualizar parcialmente un recurso) ---
async function actualizarPostParcial() {
  const cambiosParciales = {
    title: 'Título Parcialmente Modificado', // Solo cambiamos el título
  };

  try {
    const response = await fetch('https://jsonplaceholder.typicode.com/posts/2', {
      method: 'PATCH',
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: JSON.stringify(cambiosParciales),
    });

    if (!response.ok) {
      throw new Error(`Error HTTP: ${response.status}`);
    }

    const data = await response.json();
    console.log("\n3. Post actualizado parcialmente (PATCH):", data);
  } catch (error) {
    console.error("3. Error al actualizar el post con PATCH:", error);
  }
}
actualizarPostParcial();


// --- 4. Solicitud DELETE (Eliminar un recurso) ---
async function eliminarPost() {
  const postIdAEliminar = 3;
  try {
    const response = await fetch(`https://jsonplaceholder.typicode.com/posts/${postIdAEliminar}`, {
      method: 'DELETE', // No se necesita cuerpo para DELETE
    });

    // Para DELETE, un 200 OK, 204 No Content, o 202 Accepted son respuestas válidas.
    if (!response.ok) {
      throw new Error(`Error HTTP: ${response.status}`);
    }

    // Para DELETE, la API de JSONPlaceholder devuelve un objeto vacío, no hay data para parsear.
    // console.log(await response.json()); // Esto podría fallar si la respuesta es 204 No Content
    console.log(`\n4. Post con ID ${postIdAEliminar} eliminado (DELETE). Estado: ${response.status}`);
  } catch (error) {
    console.error("4. Error al eliminar el post:", error);
  }
}
eliminarPost();

console.log("\nFin de Headers y Métodos HTTP con fetch().");
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 6,
    'tittle_level': 'APIs Web y Fetch',
    'topic': 'Comunicación HTTP con fetch',
    'subtopic': 'Manejo de respuestas (json(), text())',
    'definition': r'''
Cuando realizas una solicitud `Workspace()`, el primer `.then()` (o el `await fetch(...)`) te devuelve un objeto `Response`. Este objeto es mucho más que solo los datos que esperas; contiene metadatos sobre la respuesta HTTP, como el código de estado, los encabezados y un objeto `Body` que representa el cuerpo de la respuesta del servidor.

¿Te estás preguntando por qué esto importa?

Pues bien, el `Response` es la "carta" completa que el servidor te envía de vuelta. El cuerpo de esa carta puede venir en muchos formatos (texto plano, JSON, HTML, binario como una imagen, etc.), y necesitas saber cómo "leer" esa información. Los métodos del objeto `Response` como `json()` y `text()` son fundamentales para extraer el contenido real que necesitas procesar en tu aplicación.

Es crucial entender que estos métodos (`.json()`, `.text()`, `.blob()`, `.arrayBuffer()`, etc.) también devuelven Promesas. Esto se debe a que el proceso de leer el cuerpo de la respuesta puede ser asíncrono, especialmente si la respuesta es grande o se está transmitiendo por partes. Por lo tanto, necesitarás otro `.then()` (o un segundo `await`) para obtener los datos finales.

1.  **`response.json()`**: Este es el método más comúnmente usado cuando esperas que la respuesta del servidor sea una cadena de texto en formato JSON. Este método parsea esa cadena JSON y la convierte en un objeto o un array de JavaScript. Si el cuerpo de la respuesta no es un JSON válido, la `Promise` devuelta por `json()` se rechazará. Es la elección perfecta para la mayoría de las APIs REST.

2.  **`response.text()`**: Utiliza este método cuando esperas que la respuesta del servidor sea texto plano, HTML, XML o cualquier otro formato que no sea JSON y que simplemente quieras recibir como una cadena de texto. Este método lee el cuerpo de la respuesta y lo devuelve como una `string` de JavaScript.

3.  **Otros métodos de cuerpo**: Aunque `json()` y `text()` son los más frecuentes, `Response` también ofrece:
    * `response.blob()`: Para respuestas binarias, como imágenes o archivos, devolviendo un objeto `Blob`.
    * `response.arrayBuffer()`: Para respuestas binarias en un `ArrayBuffer`, útil para manipular datos binarios de bajo nivel.
    * `response.formData()`: Para respuestas con datos de formulario (`multipart/form-data`).

El manejo correcto del objeto `Response` y sus métodos de cuerpo es la segunda mitad de la ecuación de `Workspace()`, permitiéndote no solo realizar solicitudes, sino también interpretar y utilizar la información que el servidor te envía de vuelta de forma efectiva.
''',
    'code_example': r'''
// Usaremos la API de JSONPlaceholder para ejemplos: https://jsonplaceholder.typicode.com/

console.log("--- Manejo de respuestas (json(), text()) ---");

// --- 1. Manejo de respuesta JSON (el más común) ---
async function obtenerPostJSON(id) {
  try {
    const url = `https://jsonplaceholder.typicode.com/posts/${id}`;
    const response = await fetch(url);

    // Siempre verificar response.ok para errores HTTP
    if (!response.ok) {
      throw new Error(`Error HTTP: ${response.status} ${response.statusText}`);
    }

    const data = await response.json(); // PARSEA EL JSON del cuerpo de la respuesta
    console.log(`\n1. Post con ID ${id} (JSON):`, data);
    // Verás un objeto JavaScript directamente.
  } catch (error) {
    console.error(`1. Error al obtener post ${id} (JSON):`, error);
  }
}
obtenerPostJSON(1);
obtenerPostJSON(999); // Probando un ID que no existe para ver el error HTTP


// --- 2. Manejo de respuesta de texto plano ---
async function obtenerComentarioComoTexto(id) {
  try {
    const url = `https://jsonplaceholder.typicode.com/comments/${id}`;
    const response = await fetch(url);

    if (!response.ok) {
      throw new Error(`Error HTTP: ${response.status}`);
    }

    const textContent = await response.text(); // OBTIENE EL CUERPO COMO STRING
    console.log(`\n2. Comentario con ID ${id} (Texto):`);
    console.log(textContent); // Esto será una cadena JSON, no un objeto JS
    // Si quisieras convertirlo a objeto JS, tendrías que usar JSON.parse(textContent)
    const objDesdeTexto = JSON.parse(textContent);
    console.log("  Convertido a objeto JS desde texto:", objDesdeTexto);
  } catch (error) {
    console.error(`2. Error al obtener comentario ${id} (Texto):`, error);
  }
}
obtenerComentarioComoTexto(5);


// --- 3. Acceder a metadatos de la respuesta ---
async function obtenerMetadatosYDatos(id) {
  try {
    const url = `https://jsonplaceholder.typicode.com/users/${id}`;
    const response = await fetch(url);

    if (!response.ok) {
      throw new Error(`Error HTTP: ${response.status}`);
    }

    // Acceder a propiedades del objeto Response antes de leer el cuerpo
    console.log(`\n3. Metadatos de la respuesta para usuario ${id}:`);
    console.log("  Status:", response.status); // ej. 200
    console.log("  StatusText:", response.statusText); // ej. "OK"
    console.log("  URL:", response.url); // La URL final de la solicitud
    console.log("  Content-Type Header:", response.headers.get('Content-Type')); // Obtener una cabecera específica

    const userData = await response.json();
    console.log("  Datos del usuario:", userData);
  } catch (error) {
    console.error(`3. Error al obtener usuario ${id} (Metadatos):`, error);
  }
}
obtenerMetadatosYDatos(2);


// --- Ejemplo de error si intentas .json() en una respuesta no JSON ---
async function errorAlParsearJson() {
  try {
    // Esta URL devuelve HTML, no JSON
    const response = await fetch('https://www.google.com');

    if (!response.ok) {
      throw new Error(`Error HTTP: ${response.status}`);
    }

    console.log("\n4. Intentando parsear HTML como JSON...");
    const data = await response.json(); // Esto lanzará un error si la respuesta no es JSON
    console.log("  Datos obtenidos (esto no debería verse):", data);
  } catch (error) {
    console.error("4. ERROR al parsear a JSON (era HTML):", error);
    // Verás un error de sintaxis JSON, ya que el navegador no pudo parsear el HTML como JSON.
  }
}
errorAlParsearJson();

console.log("\nFin del manejo de respuestas con fetch().");
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 6,
    'tittle_level': 'APIs Web y Fetch',
    'topic': 'Manejo de errores en peticiones',
    'subtopic': 'Códigos de estado',
    'definition': r'''
Cuando realizas una petición HTTP a un servidor, este siempre te devuelve una respuesta. Parte fundamental de esa respuesta es el **código de estado HTTP**, un número de tres dígitos que indica el resultado de la solicitud. Es como el "veredicto" del servidor sobre lo que pediste.

¿Te estás preguntando por qué esto importa?

Pues bien, estos códigos de estado son la primera línea de comunicación entre tu cliente (el navegador) y el servidor. Entenderlos es crucial para saber si tu petición fue exitosa, si hubo algún problema con ella, o si el servidor necesita que hagas algo más. Sin interpretar estos códigos, tu aplicación podría intentar procesar datos de una solicitud fallida como si fuera un éxito, lo que llevaría a errores o comportamientos inesperados.

Los códigos de estado se dividen en varias categorías, cada una indicando un tipo general de respuesta:

* **1xx - Respuestas informativas:** Indican que la solicitud fue recibida y se está continuando con el proceso. Son menos comunes en el uso diario de `Workspace()`.
    * Ej: `100 Continue` (el cliente debe continuar con su solicitud).

* **2xx - Respuestas exitosas:** Indican que la solicitud fue recibida, entendida y aceptada. ¡Esto es lo que generalmente quieres ver!
    * Ej: `200 OK` (la solicitud fue exitosa, la respuesta contiene los datos solicitados).
    * Ej: `201 Created` (la solicitud fue exitosa y un nuevo recurso fue creado, común después de un `POST`).
    * Ej: `204 No Content` (la solicitud fue exitosa, pero no hay contenido para enviar en el cuerpo de la respuesta, común después de un `DELETE` exitoso).

* **3xx - Redirecciones:** Indican que se necesita una acción adicional para completar la solicitud.
    * Ej: `301 Moved Permanently` (el recurso ha sido movido a una nueva URL).
    * Ej: `302 Found` (el recurso se encuentra temporalmente en una URL diferente).

* **4xx - Errores del cliente:** Indican que hay un problema con la solicitud enviada por el cliente. El servidor no puede o no quiere procesarla.
    * Ej: `400 Bad Request` (la solicitud no pudo ser entendida por el servidor, a menudo por sintaxis incorrecta).
    * Ej: `401 Unauthorized` (la solicitud requiere autenticación, el cliente no ha proporcionado credenciales válidas).
    * Ej: `403 Forbidden` (el servidor entiende la solicitud pero se niega a autorizarla, incluso con autenticación).
    * Ej: `404 Not Found` (el recurso solicitado no existe en el servidor).
    * Ej: `405 Method Not Allowed` (el método HTTP usado no está permitido para el recurso).
    * Ej: `429 Too Many Requests` (el cliente ha enviado demasiadas solicitudes en un corto periodo de tiempo, "rate limiting").

* **5xx - Errores del servidor:** Indican que el servidor falló al completar una solicitud aparentemente válida.
    * Ej: `500 Internal Server Error` (un error genérico del servidor).
    * Ej: `502 Bad Gateway` (un servidor actuando como gateway o proxy recibió una respuesta inválida de un servidor upstream).
    * Ej: `503 Service Unavailable` (el servidor no está disponible temporalmente, a menudo por mantenimiento o sobrecarga).

En `Workspace()`, el objeto `Response` tiene una propiedad `status` que contiene este código numérico y una propiedad `ok` (booleano) que es `true` para códigos de estado en el rango `2xx`. Es una buena práctica verificar `response.ok` o `response.status` para manejar los errores HTTP adecuadamente.
''',
    'code_example': r'''
// Usaremos la API de JSONPlaceholder y una URL inexistente para simular errores.

console.log("--- Manejo de Errores: Códigos de Estado HTTP ---");

async function manejarRespuestaConCodigos(url, metodo = 'GET', body = null) {
  try {
    const options = { method: metodo };
    if (body) {
      options.headers = { 'Content-Type': 'application/json; charset=UTF-8' };
      options.body = JSON.stringify(body);
    }

    console.log(`\nRealizando ${metodo} a: ${url}`);
    const response = await fetch(url, options);

    console.log(`  Estado de la respuesta: ${response.status} ${response.statusText}`);

    // La propiedad 'ok' es true para respuestas 200-299.
    if (response.ok) {
      const data = await response.json();
      console.log("  ✅ Solicitud exitosa (2xx). Datos:", data);
      return data;
    } else {
      // Si la respuesta no es OK, pero no es un error de red, podemos leer el cuerpo
      // para obtener más detalles del error si la API los proporciona.
      const errorData = await response.json().catch(() => null); // Intenta leer JSON, si falla, null
      console.error(`  ❌ Error HTTP (${response.status}). Mensaje:`, errorData || response.statusText);
      // Podemos lanzar un error para que el `catch` externo lo maneje
      throw new Error(`Error del servidor o cliente: ${response.status}`);
    }
  } catch (error) {
    // Esto capturará errores de red o los errores que lanzamos explícitamente.
    console.error(`  ⚠️ Error en la petición (catch):`, error.message);
  }
}

// --- Ejemplos de uso ---

// 1. Solicitud exitosa (200 OK)
manejarRespuestaConCodigos('https://jsonplaceholder.typicode.com/posts/1');

// 2. Recurso no encontrado (404 Not Found)
manejarRespuestaConCodigos('https://jsonplaceholder.typicode.com/posts/9999');

// 3. Simular un Bad Request (400 - aunque JSONPlaceholder no lo emula fácil para GET)
// Para ver un 400, tendrías que enviar un POST con JSON inválido a una API que lo valide.
// Ejemplo conceptual de POST que podría dar 400:
/*
manejarRespuestaConCodigos('https://jsonplaceholder.typicode.com/posts', 'POST', {
  invalidField: 'This is not valid' // JSONPlaceholder aceptaría esto, otra API podría dar 400
});
*/

// 4. Crear un recurso (201 Created)
manejarRespuestaConCodigos('https://jsonplaceholder.typicode.com/posts', 'POST', {
  title: 'Nuevo título',
  body: 'Contenido del nuevo post',
  userId: 1
});

// 5. Simular un error del servidor (500 Internal Server Error)
// Esto es difícil de simular con APIs públicas estables, a menudo ocurre en tu propio backend.
// Aquí solo usamos una URL que probablemente dé error de conexión o un 404, no un 500 real.
manejarRespuestaConCodigos('https://httpstat.us/500'); // Un servicio para probar códigos de estado

console.log("\nFin del manejo de errores por códigos de estado.");
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 6,
    'tittle_level': 'APIs Web y Fetch',
    'topic': 'Manejo de errores en peticiones',
    'subtopic': 'Errores de red',
    'definition': r'''
Al trabajar con solicitudes HTTP usando `Workspace()`, es fundamental distinguir entre los errores que devuelve el servidor (como los códigos de estado 4xx o 5xx que vimos) y los **errores de red**. Los errores de red son problemas que impiden que tu solicitud siquiera llegue al servidor o que la respuesta del servidor retorne al cliente.

¿Qué estás pensando sobre esto?

Pues bien, un error de red es una falla en la "conexión" o el "camino" entre tu navegador y el servidor. La promesa `Workspace()` solo se rechaza (es decir, el bloque `.catch()` se activa) cuando ocurre un error de red, no cuando el servidor responde con un código de estado HTTP de error (como un 404 o 500). Esta es una diferencia crucial en el comportamiento de `Workspace()` que a veces confunde a los desarrolladores.

Ejemplos comunes de errores de red incluyen:

* **Usuario sin conexión:** El navegador no puede establecer una conexión porque el dispositivo no tiene acceso a internet.
* **Dominio inexistente:** Intentas hacer una solicitud a una URL cuyo dominio no se puede resolver (DNS).
* **Servidor no disponible:** El servidor al que intentas conectarte está caído o no responde.
* **Bloqueo de CORS:** La política de seguridad de `Cross-Origin Resource Sharing` (CORS) impide que el navegador realice la solicitud debido a restricciones de origen. Por ejemplo, si tu frontend está en `midominio.com` e intenta acceder a una API en `otrominio.com` sin que `otrominio.com` envíe los encabezados CORS adecuados, el navegador bloqueará la solicitud y `Workspace()` rechazará la promesa con un error de red.
* **Problemas de red locales:** Firewall, proxy mal configurado, o cualquier problema en la red del usuario que impida la comunicación.

Cuando se produce un error de red, la promesa `Workspace()` se rechaza con un objeto `TypeError`. Este error no tendrá un `response.status` o `response.ok` porque no hubo una respuesta HTTP del servidor para analizar. Simplemente, la solicitud no pudo completarse a nivel de red.

Por eso, en tu código, es vital tener un bloque `catch` después de la llamada `Workspace()` para manejar específicamente estos errores de red, que son distintos de los errores de aplicación o de servidor que se reflejan en los códigos de estado HTTP. Esto te permite proporcionar un feedback adecuado al usuario, como "No hay conexión a internet" o "Ha ocurrido un problema de red".
''',
    'code_example': r'''
console.log("--- Manejo de Errores: Errores de Red ---");

async function simularErrorDeRed(url) {
  try {
    console.log(`\nIntentando obtener datos de: ${url}`);
    const response = await fetch(url);

    // Si llegamos aquí, NO fue un error de red (TypeError). Podría ser un error HTTP.
    if (!response.ok) {
      const errorText = await response.text().catch(() => response.statusText);
      console.error(`  ❌ Error HTTP (${response.status}): ${errorText}`);
      throw new Error(`Error de servidor/cliente: ${response.status}`);
    }

    const data = await response.json();
    console.log("  ✅ Datos obtenidos exitosamente:", data);

  } catch (error) {
    // Este `catch` se activará por:
    // 1. Errores de red (TypeError, si la URL es inalcanzable, CORS, etc.)
    // 2. Errores lanzados explícitamente en el `if (!response.ok)` anterior.

    if (error instanceof TypeError) {
      // `TypeError` es la señal común de un error de red o CORS.
      console.error("  ⚠️ Error de red (TypeError):", error.message);
      console.error("  Posibles causas: Sin conexión, dominio inexistente, problema de CORS, etc.");
    } else {
      // Otros errores, como los que lanzamos para códigos HTTP no OK.
      console.error("  ❌ Error de aplicación:", error.message);
    }
  }
}

// --- Ejemplos de errores de red (para probar, ¡necesitas simular la condición!) ---

// 1. URL que probablemente no existe o no es accesible (podría causar un TypeError de red)
// Para ver esto como un TypeError, la URL debe ser completamente inalcanzable,
// no solo que responda con 404.
// Si tu navegador puede resolver el DNS de "asdfasdfasdf.com" pero no encuentra el host,
// o si estás sin conexión, verás el TypeError.
simularErrorDeRed('https://this-domain-surely-does-not-exist-123456.com/data');


// 2. Simular un problema de CORS
// Esto requiere dos orígenes diferentes. Si estás sirviendo tu HTML desde 'localhost:8080'
// y la API está en 'otrolocalhost:3000' sin los headers CORS adecuados, verás un error de red.
// (Este código por sí solo no activará CORS si se ejecuta en el mismo origen de la página HTML).
/*
simularErrorDeRed('http://another-origin.com/api/data');
*/


// 3. Una solicitud a una API válida, pero que responde con un error HTTP (NO es un error de red)
// Este es un ejemplo de un 404, que `Workspace` considera una respuesta `ok: false`.
// El `catch` se activará por el `throw new Error(...)` dentro de `manejarRespuestaConCodigos`.
simularErrorDeRed('https://jsonplaceholder.typicode.com/nonexistent-resource');

console.log("\nFin del manejo de errores de red. ¡Desconecta tu internet para probar el TypeError!");
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 6,
    'tittle_level': 'APIs Web y Fetch',
    'topic': 'Manejo de errores en peticiones',
    'subtopic': 'Uso de try/catch con async/await',
    'definition': r'''
La combinación de `async/await` con `try/catch` es la forma más limpia y legible de manejar errores en peticiones asíncronas con `Workspace()`. `async/await` te permite escribir código asíncrono que parece síncrono, y `try/catch` es el mecanismo estándar de JavaScript para manejar excepciones, lo que se traduce muy bien en el contexto de Promesas.

¿No sé tú, pero a mí esto al principio me costó? 

Pues bien, antes de `async/await`, el manejo de Promesas implicaba cadenas de `.then().catch()`, que podían volverse un poco enredadas para lógicas complejas. `async/await` simplifica drásticamente la estructura de tu código, haciendo que sea más fácil leer y entender el flujo de datos y el manejo de errores.

### Cómo funciona `try/catch` con `async/await` en `Workspace`:

1.  **`async` function**: Cualquier función que use `await` debe ser declarada como `async`. Esto indica que la función siempre devolverá una Promesa.
2.  **`await`**: Pausa la ejecución de la función `async` hasta que una Promesa se resuelva o se rechace. Si la Promesa se resuelve, `await` devuelve el valor resuelto. Si la Promesa se rechaza, `await` lanza el error como una excepción síncrona, lo que permite que sea capturada por un bloque `try/catch`.
3.  **`try` bloque**: Envuelve el código donde esperas que puedan ocurrir errores. Esto incluye la llamada a `Workspace()` y cualquier `.await` subsecuente (como `response.json()`).
4.  **`catch` bloque**: Si cualquier error es lanzado dentro del bloque `try` (ya sea por una Promesa rechazada por `await` o un error explícito `throw new Error()`), la ejecución salta inmediatamente al bloque `catch`. El error capturado estará disponible como el argumento del `catch`.

### La lógica del manejo de errores con `Workspace` y `async/await` suele ser:

```javascript
async function obtenerDatos() {
  try {
    const response = await fetch('tu_url'); // 1. Primer await: espera la respuesta de los encabezados
    // 2. Verifica si la respuesta HTTP es exitosa (códigos 2xx)
    if (!response.ok) {
      const errorBody = await response.json().catch(() => response.statusText); // Intenta leer el cuerpo de error
      throw new Error(`Error ${response.status}: ${JSON.stringify(errorBody)}`); // Lanza un error para manejarlo en catch
    }
    const data = await response.json(); // 3. Segundo await: espera el parseo del cuerpo (ej. JSON)
    // Procesar los datos exitosos aquí
    return data;
  } catch (error) {
    // Este `catch` capturará:
    // - Errores de red (TypeError de `Workspace`)
    // - Errores lanzados explícitamente en el `if (!response.ok)`
    // - Errores al parsear el JSON (`response.json()` falla)
    console.error("Ha ocurrido un error en la petición:", error.message);
    // Puedes manejar el error, mostrar un mensaje al usuario, etc.
    throw error; // Opcional: relanzar el error para que un manejador superior lo capture
  }
}
Esta estructura proporciona un manejo de errores robusto y fácil de seguir, lo que es fundamental para construir aplicaciones web estables y predecibles.
''',
    'code_example': r'''
// Usaremos la API de JSONPlaceholder para ejemplos.

console.log("--- Manejo de Errores: try/catch con async/await ---");

async function obtenerYProcesarPost(postId) {
try {
console.log(\nIntentando obtener y procesar post con ID: ${postId});
const url = https://jsonplaceholder.typicode.com/posts/${postId};

// Paso 1: Realizar la petición. 'await' pausará aquí hasta que los encabezados lleguen.
const response = await fetch(url);

// Paso 2: Verificar el estado HTTP. Si no es 2xx, la promesa de fetch NO se rechazó.
// Nosotros debemos lanzar un error explícitamente.
if (!response.ok) {
  let errorMessage = `Código de estado: ${response.status}`;
  // Intentar leer el cuerpo de la respuesta para obtener un mensaje de error detallado
  // Usamos .catch() aquí por si la respuesta no es JSON o si ya ha sido leída.
  try {
    const errorBody = await response.json();
    errorMessage += ` - Mensaje del servidor: ${JSON.stringify(errorBody)}`;
  } catch (e) {
    // Si no se pudo leer como JSON, usamos el statusText por defecto o un mensaje genérico.
    errorMessage += ` - ${response.statusText || 'Error desconocido'}`;
  }
  throw new Error(`Fallo en la petición: ${errorMessage}`);
}

// Paso 3: Parsear el cuerpo de la respuesta a JSON. 'await' pausará aquí.
const data = await response.json();

// Paso 4: Si todo fue bien, procesar los datos.
console.log("  ✅ Datos obtenidos y procesados exitosamente:", data);
return data;
} catch (error) {
// Este catch capturará:
// a) Errores de red (ej., el usuario está sin conexión). Fetch rechaza la promesa con un TypeError.
// b) Errores lanzados explícitamente por throw new Error(...) en el bloque if (!response.ok).
// c) Errores al intentar parsear el JSON si response.json() falla.
console.error(❌ Error al procesar post con ID ${postId}:, error.message);
// Puedes actualizar la UI para mostrar un mensaje al usuario.
// Ej: document.getElementById('mensajeError').textContent = 'No se pudieron cargar los datos.';
// Opcional: relanzar el error si un manejador de nivel superior necesita actuar.
// throw error;
}
}

// --- Ejemplos de llamadas a la función ---

// 1. Solicitud exitosa
obtenerYProcesarPost(1);

// 2. Solicitud a un ID que no existe (ejemplo de error 404)
obtenerYProcesarPost(9999);

// 3. Simular un error de red (para probar esto, desconecta tu internet antes de ejecutar)
// Esta URL seguramente no existe, lo que simulará un error de red si no se puede resolver el DNS.
obtenerYProcesarPost('https://www.google.com/search?q=https://this-is-an-invalid-domain-for-network-test.com/data');

// 4. Intentar parsear una respuesta no JSON (ej. HTML de Google)
async function probarErrorParseoJson() {
try {
console.log("\nIntentando obtener https://www.google.com/search?q=Google.com y parsear como JSON...");
const response = await fetch('https://www.google.com'); // Devuelve HTML
if (!response.ok) throw new Error(HTTP Error ${response.status});
const data = await response.json(); // Esto fallará y será capturado por el catch
console.log("  Datos de Google (no deberías ver esto):", data);
} catch (error) {
console.error("  ❌ Error de parseo JSON:", error.message);
console.error("  Causa: El cuerpo de la respuesta no era JSON válido.");
}
}
probarErrorParseoJson();

console.log("\nFin del uso de try/catch con async/await para manejo de errores.");
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 6,
    'tittle_level': 'APIs Web y Fetch',
    'topic': 'XMLHttpRequest',
    'subtopic': 'Creación manual',
    'definition': r'''
Antes de la llegada de la API Fetch, el método principal para realizar solicitudes HTTP asíncronas en JavaScript era el objeto `XMLHttpRequest` (XHR). Aunque `Workspace()` es ahora el estándar preferido y más moderno, `XMLHttpRequest` sigue siendo relevante porque muchos códigos existentes lo utilizan y es fundamental entender cómo funciona para comprender la evolución de las peticiones web en JavaScript.

¿Te estás preguntando por qué esto importa?

Pues bien, aunque no lo uses a diario para nuevas implementaciones, `XMLHttpRequest` fue el pionero de la comunicación asíncrona en el lado del cliente y sentó las bases para el desarrollo de aplicaciones web interactivas (lo que hoy conocemos como AJAX - Asynchronous JavaScript and XML). Comprender su funcionamiento te da una perspectiva histórica y te ayuda a depurar o mantener proyectos antiguos.

La creación manual de una solicitud `XMLHttpRequest` implica varios pasos secuenciales:

1.  **Instanciar el objeto:** Primero, creas una nueva instancia de `XMLHttpRequest` usando `new XMLHttpRequest()`.
2.  **Configurar la solicitud (`.open()`):** Con el método `open()`, defines el tipo de solicitud (GET, POST, etc.) y la URL a la que se enviará. Opcionalmente, puedes especificar si la solicitud debe ser asíncrona (generalmente `true`, el valor por defecto) y credenciales de usuario/contraseña.
    * Sintaxis: `xhr.open(method, url, async, user, password)`
3.  **Configurar encabezados (`.setRequestHeader()`):** Antes de enviar la solicitud, puedes añadir encabezados HTTP personalizados (como `Content-Type` para solicitudes POST) usando `setRequestHeader()`. Debes hacerlo después de `open()` y antes de `send()`.
4.  **Enviar la solicitud (`.send()`):** Finalmente, envías la solicitud al servidor usando `send()`. Para solicitudes `GET`, `DELETE` o `HEAD`, `send()` se llama sin argumentos. Para `POST`, `PUT`, etc., pasas el cuerpo de la solicitud como argumento (ej., una cadena JSON, datos de formulario).
5.  **Manejar la respuesta (`.onreadystatechange` o `addEventListener`):** `XMLHttpRequest` funciona con eventos para notificar el progreso y el estado de la respuesta.
    * La propiedad `xhr.readyState` cambia a lo largo de la vida de la solicitud (0: UNSENT, 1: OPENED, 2: HEADERS_RECEIVED, 3: LOADING, 4: DONE).
    * El evento `readystatechange` se dispara cada vez que `readyState` cambia. Cuando `readyState` es `4` (DONE) y `xhr.status` es `200` (OK), la solicitud ha terminado y es exitosa.
    * Puedes acceder al cuerpo de la respuesta a través de `xhr.responseText` (para texto) o `xhr.response` (para otros tipos, configurado con `xhr.responseType`).

Aunque es más verboso que `Workspace()`, el control explícito sobre cada paso de `XMLHttpRequest` proporciona una comprensión profunda del ciclo de vida de una petición HTTP.
''',
    'code_example': r'''
// Usaremos la API de JSONPlaceholder para ejemplos.

console.log("--- XMLHttpRequest: Creación manual ---");

function obtenerPostConXHR(postId) {
  console.log(`\nIniciando petición XHR para post con ID: ${postId}`);

  // 1. Crear una nueva instancia de XMLHttpRequest
  const xhr = new XMLHttpRequest();

  // 2. Configurar la solicitud: método GET y URL
  // El tercer argumento (true) indica que la petición será asíncrona.
  xhr.open('GET', `https://jsonplaceholder.typicode.com/posts/${postId}`, true);

  // 3. Opcional: Configurar encabezados antes de enviar (no necesario para GET sin autenticación)
  // xhr.setRequestHeader('Accept', 'application/json');

  // 4. Manejar el evento de cambio de estado
  // 'onreadystatechange' se dispara cada vez que la propiedad 'readyState' cambia.
  xhr.onreadystatechange = function() {
    // readyState 4: La operación está completa.
    if (xhr.readyState === XMLHttpRequest.DONE) {
      // status 200: La petición fue exitosa.
      if (xhr.status === 200) {
        console.log(`  ✅ XHR exitoso para post ${postId}. Estado: ${xhr.status}`);
        // xhr.responseText contiene la respuesta como una cadena de texto
        const data = JSON.parse(xhr.responseText); // Parsear la cadena JSON a un objeto JavaScript
        console.log("  Datos recibidos:", data);
      } else {
        // Manejo de errores HTTP (ej. 404, 500)
        console.error(`  ❌ Error XHR para post ${postId}. Estado: ${xhr.status} ${xhr.statusText}`);
        console.error("  Respuesta del servidor:", xhr.responseText);
      }
    }
  };

  // 5. Manejar errores de red u otros errores
  // El evento 'error' se dispara cuando hay problemas a nivel de red (ej. sin conexión, CORS bloqueado).
  xhr.onerror = function() {
    console.error(`  ⚠️ Error de red en XHR para post ${postId}.`);
  };

  // 6. Enviar la solicitud
  xhr.send(); // Para GET, POST con FormData, etc., el argumento es opcional o contiene el cuerpo.
}

// --- Ejemplos de uso ---
obtenerPostConXHR(1);   // Petición exitosa
obtenerPostConXHR(9999); // Petición a un recurso no existente (404)

// --- Ejemplo de POST con XHR ---
function crearPostConXHR() {
  console.log("\nIniciando petición XHR para crear un post (POST)...");
  const xhr = new XMLHttpRequest();
  xhr.open('POST', 'https://jsonplaceholder.typicode.com/posts', true);

  // Muy importante: Establecer el Content-Type para decir al servidor qué tipo de datos estamos enviando.
  xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');

  xhr.onreadystatechange = function() {
    if (xhr.readyState === XMLHttpRequest.DONE) {
      if (xhr.status === 201) { // 201 Created para POST exitoso
        console.log("  ✅ Post creado con XHR (POST). Estado:", xhr.status);
        const data = JSON.parse(xhr.responseText);
        console.log("  Respuesta del servidor:", data);
      } else {
        console.error(`  ❌ Error al crear post XHR (POST). Estado: ${xhr.status} ${xhr.statusText}`);
      }
    }
  };

  xhr.onerror = function() {
    console.error("  ⚠️ Error de red al crear post XHR (POST).");
  };

  const nuevoPost = {
    title: 'Post creado por XHR',
    body: 'Este es el contenido del post.',
    userId: 1,
  };
  xhr.send(JSON.stringify(nuevoPost)); // Envía el objeto JS como cadena JSON
}
crearPostConXHR();

console.log("\nFin de la creación manual de XMLHttpRequest.");
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 6,
    'tittle_level': 'APIs Web y Fetch',
    'topic': 'XMLHttpRequest',
    'subtopic': 'Comparación con fetch()',
    'definition': r'''
Mientras que `XMLHttpRequest` fue el caballo de batalla para las peticiones HTTP en JavaScript durante años, la API `Workspace` se introdujo para modernizar y simplificar este proceso. Aunque ambos sirven para el mismo propósito fundamental (realizar peticiones de red), sus arquitecturas y filosofías son bastante diferentes.

¿Te estás preguntando por qué esto importa?

Pues bien, comprender las diferencias entre `XMLHttpRequest` y `Workspace()` es crucial para elegir la herramienta adecuada para tu proyecto, para entender por qué `Workspace()` se ha convertido en el estándar de facto, y para adaptar tu código si trabajas con bases de código antiguas. Es como comparar un coche clásico con uno moderno: ambos te llevan a tu destino, pero la experiencia y las características son distintas.

Aquí tienes una comparación clave:

1.  **Basado en Promesas vs. Basado en Eventos/Callbacks:**
    * **`Workspace()`**: Nativamente basado en Promesas. Esto permite encadenar operaciones asíncronas (`.then()`, `.catch()`, `.finally()`) de una manera mucho más limpia y manejable, especialmente con `async/await`. El "callback hell" es cosa del pasado.
    * **`XMLHttpRequest`**: Basado en eventos y callbacks (`onreadystatechange`, `onload`, `onerror`). Esto a menudo llevaba a un código más aneso, con múltiples funciones para manejar diferentes estados y eventos, lo que podía resultar en "callback hell".

2.  **Manejo de errores HTTP:**
    * **`Workspace()`**: La Promesa de `Workspace()` solo se rechaza (entra en `.catch()`) si hay un error de red o de CORS. Un error HTTP como 404 o 500 *no* rechaza la Promesa; en su lugar, el `response.ok` será `false` y deberás verificarlo explícitamente y lanzar un error si es necesario.
    * **`XMLHttpRequest`**: Reacciona de manera diferente. Su evento `onerror` solo se dispara para errores de red. Sin embargo, su `onload` se dispara para *todas* las respuestas (incluidos los 4xx y 5xx), y eres tú quien debe verificar `xhr.status` para determinar si la petición fue exitosa o no. Un `xhr.status` diferente de `200` (o `2xx` si lo validas así) indica un error.

3.  **Sintaxis y Legibilidad:**
    * **`Workspace()`**: Más conciso y declarativo. Su uso con `async/await` mejora enormemente la legibilidad del código asíncrono.
    * **`XMLHttpRequest`**: Más verboso y requiere más líneas de código para configurar y manejar todos los estados y eventos posibles.

4.  **CORS y Credenciales:**
    * **`Workspace()`**: Por defecto, no envía cookies ni credenciales (`credentials: 'omit'`). Debes especificar `credentials: 'include'` para enviarlas. Esto es más seguro por defecto.
    * **`XMLHttpRequest`**: Por defecto, envía cookies y cabeceras de autenticación con peticiones del mismo origen. Requiere `xhr.withCredentials = true;` para peticiones cross-origin.

5.  **Streaming y Progresos:**
    * **`Workspace()`**: Ofrece un soporte nativo para `Streams` en el objeto `Response.body`, lo que permite procesar grandes cantidades de datos a medida que se reciben, lo que es útil para descarga de archivos o respuestas muy grandes.
    * **`XMLHttpRequest`**: Tiene eventos de progreso (`onprogress`) para monitorear la subida y descarga de datos.

En resumen, `Workspace()` es el futuro y el presente de las peticiones HTTP en JavaScript debido a su diseño basado en Promesas y su sintaxis más limpia. `XMLHttpRequest` sigue siendo una parte del legado web, pero para nuevas implementaciones, `Workspace()` es casi siempre la mejor elección.
''',
    'code_example': r'''
// Este ejemplo no se ejecuta para mostrar la funcionalidad, sino que compara
// la estructura de código de ambas APIs.

console.log("--- Comparación de XMLHttpRequest y fetch() ---");

const postId = 1;

// --- Implementación con XMLHttpRequest (estilo antiguo) ---
function getPostXHR(id) {
  console.log("\nUsando XMLHttpRequest para obtener post...");
  const xhr = new XMLHttpRequest();

  xhr.open('GET', `https://jsonplaceholder.typicode.com/posts/${id}`, true);

  xhr.onreadystatechange = function() {
    if (xhr.readyState === XMLHttpRequest.DONE) {
      if (xhr.status === 200) {
        console.log(`  XHR SUCESSO (${xhr.status}):`, JSON.parse(xhr.responseText));
      } else {
        console.error(`  XHR ERROR HTTP (${xhr.status}):`, xhr.statusText);
      }
    }
  };

  xhr.onerror = function() {
    console.error("  XHR ERROR DE RED.");
  };

  xhr.send();
}

// --- Implementación con Fetch API (estilo moderno con async/await) ---
async function getPostFetch(id) {
  console.log("\nUsando Fetch API para obtener post...");
  try {
    const response = await fetch(`https://jsonplaceholder.typicode.com/posts/${id}`);

    if (!response.ok) { // Verifica errores HTTP (4xx, 5xx)
      throw new Error(`Workspace ERROR HTTP (${response.status}): ${response.statusText}`);
    }

    const data = await response.json();
    console.log(`  Fetch SUCESSO (${response.status}):`, data);

  } catch (error) { // Captura errores de red (TypeError) o errores lanzados
    if (error instanceof TypeError) {
      console.error("  Fetch ERROR DE RED (TypeError):", error.message);
    } else {
      console.error("  Fetch ERROR (general):", error.message);
    }
  }
}

// --- Peticiones de ejemplo para comparar ---
getPostXHR(postId);
getPostFetch(postId);

// Ejemplo de error 404 para ambas
getPostXHR(9999);
getPostFetch(9999);

// Ejemplo de POST (estructuralmente más complejo con XHR)
function createPostXHR(postData) {
    console.log("\nUsando XMLHttpRequest para crear post (POST)...");
    const xhr = new XMLHttpRequest();
    xhr.open('POST', 'https://jsonplaceholder.typicode.com/posts', true);
    xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 201) {
                console.log(`  XHR SUCESSO POST (${xhr.status}):`, JSON.parse(xhr.responseText));
            } else {
                console.error(`  XHR ERROR POST (${xhr.status}):`, xhr.statusText);
            }
        }
    };
    xhr.onerror = function() { console.error("  XHR ERROR DE RED POST."); };
    xhr.send(JSON.stringify(postData));
}

async function createPostFetch(postData) {
    console.log("\nUsando Fetch API para crear post (POST)...");
    try {
        const response = await fetch('https://jsonplaceholder.typicode.com/posts', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json; charset=UTF-8' },
            body: JSON.stringify(postData),
        });
        if (!response.ok) {
            throw new Error(`Workspace ERROR POST (${response.status}): ${response.statusText}`);
        }
        const data = await response.json();
        console.log(`  Fetch SUCESSO POST (${response.status}):`, data);
    } catch (error) {
        console.error("  Fetch ERROR POST:", error.message);
    }
}

const newPost = { title: 'Comparación', body: 'Demo', userId: 1 };
createPostXHR(newPost);
createPostFetch(newPost);

console.log("\nObserva la diferencia en la concisión y el manejo de errores entre ambas APIs.");
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Mid',
    'level': 6,
    'tittle_level': 'APIs Web y Fetch',
    'topic': 'XMLHttpRequest',
    'subtopic': 'Manejo de eventos de respuesta',
    'definition': r'''
A diferencia de `Workspace()` que utiliza Promesas, `XMLHttpRequest` se basa en un modelo de eventos para notificar el progreso y el estado de la solicitud y su respuesta. Para trabajar con XHR, debes escuchar estos eventos específicos que se disparan en diferentes puntos del ciclo de vida de la petición.

¿Qué estás pensando sobre esto?

Pues bien, entender cómo `XMLHttpRequest` maneja los eventos es fundamental para interactuar correctamente con esta API más antigua. Es como sintonizar una radio: necesitas saber en qué frecuencia escuchar para obtener la información que deseas. Si bien `Workspace()` encapsula gran parte de esta complejidad, XHR te expone directamente a los estados de la conexión y transferencia de datos.

Los eventos más importantes y las propiedades clave para manejar la respuesta en XHR son:

1.  **`xhr.onreadystatechange`**: Este es el manejador de eventos más genérico y tradicional. Se dispara cada vez que la propiedad `xhr.readyState` cambia. `readyState` es un número que representa el estado actual de la solicitud:
    * `0 (UNSENT)`: El cliente ha sido creado. `open()` no ha sido llamado todavía.
    * `1 (OPENED)`: `open()` ha sido llamado.
    * `2 (HEADERS_RECEIVED)`: `send()` ha sido llamado, y los encabezados y el estado están disponibles.
    * `3 (LOADING)`: Descargando `responseText`. Se reciben datos parciales.
    * `4 (DONE)`: La operación completa.
    
    Dentro de este manejador, comúnmente verificas si `xhr.readyState === 4` para saber si la petición ha terminado, y luego `xhr.status` para verificar el código de estado HTTP (ej., `200` para éxito).

2.  **`xhr.status` y `xhr.statusText`**:
    * `xhr.status`: Contiene el código de estado HTTP (ej., `200`, `404`, `500`).
    * `xhr.statusText`: Contiene el mensaje de estado HTTP (ej., "OK", "Not Found", "Internal Server Error").
    Estos están disponibles cuando `readyState` es `2` o superior.

3.  **`xhr.responseText` y `xhr.response`**:
    * `xhr.responseText`: Contiene el cuerpo de la respuesta del servidor como una cadena de texto. Es el más utilizado para respuestas JSON o HTML.
    * `xhr.response`: Contiene el cuerpo de la respuesta en el formato especificado por `xhr.responseType`. Puedes configurar `xhr.responseType` a `'json'`, `'blob'`, `'arraybuffer'`, `'document'`, o `'text'` (por defecto). Si lo configuras a `'json'`, `xhr.response` ya será un objeto JavaScript parseado.

4.  **`xhr.onload`**: Este es un manejador de eventos más moderno y conveniente que `onreadystatechange`. Se dispara solo cuando la solicitud se ha completado *exitosamente* a nivel de red (es decir, la conexión se estableció y se recibió una respuesta del servidor), *independientemente del código de estado HTTP*. Es decir, se activará incluso para un `404` o `500`. Dentro de `onload`, aún debes verificar `xhr.status` para saber si la operación fue exitosa desde el punto de vista del servidor.

5.  **`xhr.onerror`**: Se dispara cuando la solicitud no se pudo completar debido a un error de red (ej., sin conexión, problemas de DNS, bloqueo de CORS). Este evento no se activa para errores de respuesta HTTP (4xx, 5xx).

6.  **`xhr.onprogress`**: Se dispara periódicamente durante la descarga de la respuesta. Es útil para implementar barras de progreso para archivos grandes. El evento proporciona `event.loaded` y `event.total` para calcular el progreso.

Aunque `XMLHttpRequest` es más complejo en su manejo de eventos que `Workspace()`, te da un control muy granular sobre cada etapa de la petición HTTP, lo cual puede ser útil en escenarios específicos como la gestión de progreso de subidas/descargas.
''',
    'code_example': r'''
// Usaremos la API de JSONPlaceholder para ejemplos.

console.log("--- XMLHttpRequest: Manejo de eventos de respuesta ---");

function manejarEventosXHR(url) {
  console.log(`\nIniciando petición XHR para: ${url}`);
  const xhr = new XMLHttpRequest();
  xhr.open('GET', url, true); // Petición asíncrona

  // --- 1. xhr.onreadystatechange (Tradicional) ---
  xhr.onreadystatechange = function() {
    console.log(`  onreadystatechange: readyState = ${xhr.readyState}`);
    if (xhr.readyState === XMLHttpRequest.HEADERS_RECEIVED) {
      console.log(`  HEADERS_RECEIVED: Status = ${xhr.status} ${xhr.statusText}`);
      // Podemos acceder a los encabezados aquí: xhr.getResponseHeader('Content-Type');
    }
    if (xhr.readyState === XMLHttpRequest.DONE) { // Cuando la operación está completa (estado 4)
      if (xhr.status === 200) {
        console.log(`  ✅ DONE (onreadystatechange): Datos recibidos. Longitud: ${xhr.responseText.length}`);
        const data = JSON.parse(xhr.responseText);
        // console.log("  Datos:", data); // Descomenta para ver los datos completos
      } else {
        console.error(`  ❌ DONE (onreadystatechange): Error HTTP ${xhr.status} - ${xhr.statusText}`);
      }
    }
  };

  // --- 2. xhr.onload (Más simple para éxito/error HTTP) ---
  xhr.onload = function() {
    // Este se activa cuando la respuesta HTTP se recibe completamente,
    // independientemente del status (200, 404, 500, etc.)
    console.log(`  onload: Petición completada con status ${xhr.status} ${xhr.statusText}`);
    if (xhr.status === 200) {
      console.log("  ✅ onload: Éxito! Los datos están listos.");
    } else {
      console.error(`  ❌ onload: Petición con error de servidor/cliente: ${xhr.status}`);
    }
  };

  // --- 3. xhr.onerror (Errores de red) ---
  xhr.onerror = function() {
    // Se activa solo para errores de red (ej. sin conexión, DNS fallido, CORS bloqueado)
    console.error("  ⚠️ onerror: Ha ocurrido un error de red o de CORS.");
  };

  // --- 4. xhr.onprogress (Para monitorear el progreso de la descarga) ---
  xhr.onprogress = function(event) {
    if (event.lengthComputable) {
      const percent = (event.loaded / event.total) * 100;
      console.log(`  onprogress: Descargando... ${percent.toFixed(2)}% (${event.loaded}/${event.total} bytes)`);
    } else {
      console.log("  onprogress: Progreso desconocido (lengthComputable es false).");
    }
  };

  // --- 5. xhr.onloadstart y xhr.onloadend (Inicio y fin de la transferencia) ---
  xhr.onloadstart = function() {
    console.log("  onloadstart: Transferencia iniciada.");
  };

  xhr.onloadend = function() {
    console.log("  onloadend: Transferencia finalizada (éxito o error).");
  };

  // Enviar la solicitud
  xhr.send();
}

// --- Ejemplos de uso ---
manejarEventosXHR('https://jsonplaceholder.typicode.com/posts/1'); // Éxito
manejarEventosXHR('https://jsonplaceholder.typicode.com/posts/9999'); // 404 Not Found (error HTTP)

// Para probar `onerror` y `onprogress` con un archivo más grande,
// o si estás sin conexión, el `onerror` se activaría.
// Por ejemplo:
// manejarEventosXHR('https://via.placeholder.com/2000x2000.png?text=LargeImage');

console.log("\nFin del manejo de eventos de respuesta con XMLHttpRequest.");
'''
  });
}
