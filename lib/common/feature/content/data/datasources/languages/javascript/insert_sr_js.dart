import 'package:sqflite_common/sqlite_api.dart';

Future<void> insertJsSrLevel1Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Clases y Prototipos',
    'topic': 'Prototipos en JavaScript',
    'subtopic': 'Delegación de propiedades',
    'definition': '''
En JavaScript, los objetos pueden heredar propiedades y métodos de otros objetos. Esto se conoce como delegación de propiedades, un concepto clave en el modelo prototípico del lenguaje.

Si alguna vez te has preguntado cómo es que ciertos métodos como .toString() están disponibles en casi cualquier objeto, la respuesta está en la cadena de prototipos. Cuando intentas acceder a una propiedad que no existe directamente en un objeto, JavaScript automáticamente "sube" por esta cadena buscando la propiedad en los prototipos vinculados.

Pensemos en cómo funciona esto: cada objeto en JavaScript tiene una referencia interna a otro objeto llamado su prototipo. Cuando solicitas una propiedad, el motor primero revisa el objeto mismo. Si no la encuentra, busca en su prototipo, luego en el prototipo del prototipo, y así sucesivamente hasta llegar a null. Este mecanismo es eficiente en memoria porque múltiples objetos pueden compartir las mismas propiedades a través de un prototipo común, en lugar de tener copias separadas.
''',
    'code_example': '''
// Ejemplo correcto
const animal = {
  haceSonido: function() {
    console.log('Sonido genérico');
  }
};

const perro = Object.create(animal); // perro hereda de animal
perro.haceSonido(); // "Sonido genérico" - propiedad heredada

// Ejemplo incorrecto común
const gato = {};
gato.__proto__ = animal; // Aunque funciona, __proto__ está deprecado
gato.haceSonido();

// Mejor práctica: usar Object.create o Object.setPrototypeOf
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Clases y Prototipos',
    'topic': 'Prototipos en JavaScript',
    'subtopic': '__proto__ vs Object.getPrototypeOf()',
    'definition': '''
JavaScript ofrece dos formas principales de acceder al prototipo de un objeto: la propiedad __proto__ y el método Object.getPrototypeOf(). Aunque ambos sirven para lo mismo, hay diferencias importantes en cómo y cuándo usarlos.

Probablemente te hayas encontrado con __proto__ en código antiguo o tutoriales. Fue la primera implementación para acceder al prototipo, pero tiene sus problemas. Es una propiedad heredada de Object.prototype que originalmente no era parte del estándar ECMAScript, aunque luego fue estandarizada por compatibilidad.

Object.getPrototypeOf() es el enfoque moderno y recomendado. Es más explícito, forma parte del estándar oficial y funciona consistentemente en todos los entornos. Además, es la única forma segura de obtener el prototipo en código que usa "use strict", donde __proto__ podría no estar disponible.
''',
    'code_example': '''
// Usando Object.getPrototypeOf (recomendado)
const padre = { valor: 42 };
const hijo = Object.create(padre);

console.log(Object.getPrototypeOf(hijo) === padre); // true

// Usando __proto__ (no recomendado)
console.log(hijo.__proto__ === padre); // true, pero evita este enfoque

// Ejemplo de código problemático con __proto__
const obj = Object.create(null); // obj no hereda de Object.prototype
console.log(obj.__proto__); // undefined
console.log(Object.getPrototypeOf(obj)); // null - funciona correctamente
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Clases y Prototipos',
    'topic': 'Prototipos en JavaScript',
    'subtopic': 'Añadir propiedades al prototipo',
    'definition': '''
Modificar prototipos existentes es una técnica poderosa en JavaScript que permite extender la funcionalidad de objetos de manera global. Sin embargo, con gran poder viene gran responsabilidad.

Si alguna vez te has preguntado cómo añadir métodos a todos los arrays o strings en tu proyecto, la respuesta está en modificar sus prototipos nativos. Por ejemplo, cuando añades un método a Array.prototype, automáticamente estará disponible en todos los arrays de tu aplicación.

Pero cuidado: modificar prototipos incorporados (como Array, Object o String) puede causar conflictos si no se hace con precaución. Es una práctica conocida como "monkey patching" y, aunque útil en algunos casos, puede llevar a problemas de mantenimiento y compatibilidad. Es especialmente arriesgado cuando trabajas en proyectos grandes o usas múltiples librerías que podrían hacer modificaciones similares.
''',
    'code_example': '''
// Añadir método seguro a un prototipo
Array.prototype.suma = function() {
  return this.reduce((total, num) => total + num, 0);
};

const numeros = [1, 2, 3];
console.log(numeros.suma()); // 6

// Ejemplo problemático (no hacer)
Object.prototype.miMetodo = function() {
  console.log('¡Peligo! Esto afecta a TODOS los objetos');
};

const obj = {};
obj.miMetodo(); // Funciona, pero contamina todo el prototipo Object

// Alternativa más segura: usar clases o funciones utilitarias
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Clases y Prototipos',
    'topic': 'Herencia Prototípica',
    'subtopic': 'Enlace entre objetos',
    'definition': '''
La herencia prototípica en JavaScript se basa en la idea de que los objetos pueden vincularse directamente entre sí, compartiendo propiedades y métodos. A diferencia de los lenguajes basados en clases, aquí la herencia ocurre directamente entre instancias.

Pensemos en cómo se organiza esto: cuando un objeto hereda de otro, se establece un enlace dinámico. Si cambias una propiedad en el prototipo, todos los objetos que lo heredan verán ese cambio inmediatamente. Esto es diferente a la herencia clásica donde las instancias suelen tener copias independientes de los métodos heredados.

Este enfoque es ligero en memoria pero requiere entender bien cómo funciona la cadena de prototipos. Por ejemplo, si modificas una propiedad heredada directamente en un objeto hijo, JavaScript creará una propiedad local en ese objeto, "ocultando" la versión del prototipo sin modificarla realmente.
''',
    'code_example': '''
// Creación de objetos vinculados
const vehiculo = {
  arrancar: function() {
    return '¡Motor encendido!';
  }
};

const coche = Object.create(vehiculo);
coche.ruedas = 4;

console.log(coche.arrancar()); // "¡Motor encendido!" (heredado)
console.log(coche.ruedas); // 4 (propia)

// Modificación de propiedades heredadas
coche.arrancar = function() {
  return '¡Coche arrancado con llave!';
};
console.log(coche.arrancar()); // "¡Coche arrancado con llave!" (propia)
console.log(vehiculo.arrancar()); // "¡Motor encendido!" (sin cambios)
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Clases y Prototipos',
    'topic': 'Herencia Prototípica',
    'subtopic': 'Reutilización de métodos',
    'definition': '''
Una de las mayores ventajas de la herencia prototípica es la capacidad de compartir métodos entre múltiples objetos sin duplicar código. Esto permite una eficiencia de memoria significativa en aplicaciones con muchas instancias.

Seguramente te has preguntado cómo frameworks como jQuery pueden manejar miles de elementos DOM sin consumir memoria excesiva. La respuesta está en que todos esos elementos comparten los mismos métodos a través de la cadena de prototipos, en lugar de tener copias separadas de cada función.

Cuando creas un método en un prototipo, todas las instancias que hereden de él accederán al mismo bloque de código en memoria. Esto es especialmente útil para métodos que no necesitan estado interno específico de cada instancia. Sin embargo, debes tener cuidado con las propiedades mutables en los prototipos, ya que serán compartidas por todas las instancias.
''',
    'code_example': r'''
// Métodos compartidos a través del prototipo
function Persona(nombre) {
  this.nombre = nombre;
}

Persona.prototype.saludar = function() {
  return `Hola, soy ${this.nombre}`;
};

const persona1 = new Persona('Alice');
const persona2 = new Persona('Bob');

console.log(persona1.saludar()); // "Hola, soy Alice"
console.log(persona2.saludar()); // "Hola, soy Bob"

// Todas las instancias comparten el mismo método
console.log(persona1.saludar === persona2.saludar); // true

// Ejemplo problemático con propiedades mutables
Persona.prototype.intereses = [];
persona1.intereses.push('programación');
console.log(persona2.intereses); // ["programación"] - ¡compartido!
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Clases y Prototipos',
    'topic': 'Herencia Prototípica',
    'subtopic': 'Prototypal inheritance pattern',
    'definition': r'''
El patrón de herencia prototípica es una forma establecida de implementar herencia en JavaScript antes de la introducción de las clases en ES6. Aunque hoy tenemos sintaxis de clases, entender este patrón es crucial para trabajar con código legacy y comprender los fundamentos del lenguaje.

Este patrón combina constructores con prototipos para crear un sistema de herencia flexible. La idea es que una función constructora crea nuevos objetos, mientras que su propiedad prototype sirve como plantilla para las instancias. Cuando usas el operador new, JavaScript automáticamente establece el prototipo de la nueva instancia al objeto prototype del constructor.

Muchas librerías importantes de JavaScript, incluyendo versiones antiguas de frameworks como AngularJS, usaban extensivamente este patrón. Aún hoy, cuando usas clases en ES6+, estás esencialmente usando una sintaxis más limpia para este mismo patrón prototípico subyacente.
''',
    'code_example': r'''
// Implementación clásica del patrón
function Animal(nombre) {
  this.nombre = nombre;
}

Animal.prototype.hablar = function() {
  return `${this.nombre} hace un sonido`;
};

function Perro(nombre) {
  Animal.call(this, nombre); // Llama al constructor padre
}

// Establece la cadena prototípica
Perro.prototype = Object.create(Animal.prototype);
Perro.prototype.constructor = Perro; // Corrige el constructor

Perro.prototype.hablar = function() {
  return `${this.nombre} ladra`;
};

const miPerro = new Perro('Rex');
console.log(miPerro.hablar()); // "Rex ladra"

// Versión moderna equivalente con clases ES6
class Animal {
  constructor(nombre) {
    this.nombre = nombre;
  }
  hablar() {
    return `${this.nombre} hace un sonido`;
  }
}

class Perro extends Animal {
  hablar() {
    return `{this.nombre} ladra`;
  }
}
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Clases y Prototipos',
    'topic': 'Clases (ES6+)',
    'subtopic': 'Declaración con class',
    'definition': '''
Las clases en ES6+ son esencialmente "azúcar sintáctico" sobre el sistema prototípico existente de JavaScript. Introducen una forma más clara y familiar de trabajar con herencia, especialmente para desarrolladores con experiencia en lenguajes basados en clases.

Si vienes de lenguajes como Java o C#, la sintaxis te resultará familiar, pero es importante recordar que detrás de escena sigue siendo el mismo sistema prototípico de siempre. La palabra clave class no introduce un nuevo modelo de herencia, sino que proporciona una sintaxis más limpia para el patrón de herencia prototípica que ya existía.

Una clase en JavaScript es básicamente una función especial que actúa como constructor, donde los métodos definidos dentro se añaden al prototipo de esta función. Esto explica por qué puedes seguir usando métodos como Object.getPrototypeOf() incluso con instancias de clase.
''',
    'code_example': '''
// Declaración básica de clase
class Rectangulo {
  constructor(alto, ancho) {
    this.alto = alto;
    this.ancho = ancho;
  }

  // Método de instancia (va al prototipo)
  calcularArea() {
    return this.alto * this.ancho;
  }
}

const miRectangulo = new Rectangulo(5, 8);
console.log(miRectangulo.calcularArea()); // 40

// Equivalente aproximado sin sintaxis de clase
function RectanguloFunc(alto, ancho) {
  this.alto = alto;
  this.ancho = ancho;
}

RectanguloFunc.prototype.calcularArea = function() {
  return this.alto * this.ancho;
};
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Clases y Prototipos',
    'topic': 'Clases (ES6+)',
    'subtopic': 'Herencia con extends',
    'definition': '''
El sistema de herencia con extends en JavaScript simplifica enormemente la creación de jerarquías de objetos. Bajo el capó, implementa toda la cadena prototípica que antes teníamos que configurar manualmente.

Cuando usas extends, estás indicando que una clase debe heredar de otra, estableciendo automáticamente la cadena de prototipos correcta. La clase hija obtiene acceso a todos los métodos y propiedades de la clase padre, a menos que los sobrescriba explícitamente.

Un detalle importante es que las clases en JavaScript solo pueden extender de una sola clase padre (herencia simple), pero puedes crear jerarquías complejas encadenando múltiples niveles de herencia. Esto difiere de algunos lenguajes que permiten herencia múltiple, pero sigue siendo un patrón poderoso cuando se usa adecuadamente.
''',
    'code_example': r'''
// Herencia básica con extends
class Animal {
  constructor(nombre) {
    this.nombre = nombre;
  }

  hablar() {
    return `${this.nombre} hace un sonido`;
  }
}

class Perro extends Animal {
  hablar() {
    return `${this.nombre} ladra`;
  }

  moverCola() {
    return `${this.nombre} mueve la cola felizmente`;
  }
}

const miPerro = new Perro('Rex');
console.log(miPerro.hablar()); // "Rex ladra"
console.log(miPerro.moverCola()); // "Rex mueve la cola felizmente"

// Accediendo al prototipo para ver la herencia
console.log(Object.getPrototypeOf(miPerro) === Perro.prototype); // true
console.log(Object.getPrototypeOf(Perro.prototype) === Animal.prototype); // true
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Clases y Prototipos',
    'topic': 'Clases (ES6+)',
    'subtopic': 'Uso de super',
    'definition': '''
La palabra clave super en clases de JavaScript tiene dos usos principales: llamar al constructor de la clase padre y acceder a métodos de la clase padre desde la clase hija. Es el puente que conecta la herencia en el sistema de clases.

Cuando estás en el constructor de una clase hija, super() debe ser llamado antes de poder usar this. Esto asegura que la parte de la clase padre esté correctamente inicializada antes de que la clase hija añada sus propias propiedades. Fuera del constructor, super se usa para acceder a métodos del prototipo padre que podrían haber sido sobrescritos en la clase hija.

Este mecanismo es particularmente útil cuando quieres extender el comportamiento de un método en lugar de reemplazarlo completamente. Puedes llamar a la versión del padre, obtener su resultado, y luego añadir lógica adicional alrededor de ese resultado.
''',
    'code_example': '''
// Uso de super en constructor
class Vehiculo {
  constructor(marca) {
    this.marca = marca;
    this.encendido = false;
  }
}

class Coche extends Vehiculo {
  constructor(marca, modelo) {
    super(marca); // Llama al constructor de Vehiculo
    this.modelo = modelo;
  }
}

const miCoche = new Coche('Toyota', 'Corolla');
console.log(miCoche.marca); // "Toyota"
console.log(miCoche.modelo); // "Corolla"

// Uso de super para acceder a métodos padre
class Padre {
  metodo() {
    return 'Padre';
  }
}

class Hijo extends Padre {
  metodo() {
    return super.metodo() + ' + Hijo';
  }
}

const instancia = new Hijo();
console.log(instancia.metodo()); // "Padre + Hijo"
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Clases y Prototipos',
    'topic': 'Métodos estáticos y privados',
    'subtopic': 'Declaración con static',
    'definition': '''
Los métodos estáticos en JavaScript son funciones que pertenecen a la clase misma, no a sus instancias. Se definen usando la palabra clave static y son útiles para funcionalidad que no requiere acceso a datos de instancia específicos.

Piensa en los métodos estáticos como herramientas asociadas a un tipo de objeto, pero que no necesitan una instancia concreta para funcionar. Son comunes en clases de utilidad, factories, o para agrupar funciones relacionadas. Por ejemplo, Math.random() es un método estático - no necesitas crear una instancia de Math para usarlo.

Un detalle importante es que los métodos estáticos no tienen acceso a las propiedades de instancia (this) porque, por definición, se llaman en la clase, no en una instancia. Sin embargo, pueden acceder a otros métodos estáticos de la misma clase usando el nombre de la clase.
''',
    'code_example': '''
class UtilidadesMatematicas {
  static sumar(a, b) {
    return a + b;
  }

  static restar(a, b) {
    return a - b;
  }

  static operaciones = {
    PI: 3.1416,
    sumarCuadrados: (a, b) => a*a + b*b
  };
}

// Uso sin instanciar
console.log(UtilidadesMatematicas.sumar(5, 3)); // 8
console.log(UtilidadesMatematicas.operaciones.PI); // 3.1416

// Error común
try {
  const util = new UtilidadesMatematicas();
  console.log(util.sumar(2, 2)); // Error: sumar no es una función
} catch(e) {
  console.log('Los métodos estáticos no están disponibles en instancias');
}
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Clases y Prototipos',
    'topic': 'Métodos estáticos y privados',
    'subtopic': 'Encapsulamiento con #',
    'definition': '''
Los campos privados en clases, introducidos recientemente en JavaScript, permiten un verdadero encapsulamiento usando el prefijo #. A diferencia de las convenciones anteriores (como el guión bajo _ para indicar "privado"), estos campos son realmente inaccesibles desde fuera de la clase.

Este mecanismo resuelve un problema de larga data en JavaScript: la falta de control de acceso real en las propiedades de los objetos. Con los campos privados, puedes estar seguro de que ciertos datos internos de tu clase no serán modificados accidentalmente (o intencionalmente) desde código externo.

Los campos privados deben declararse en el ámbito de la clase (no dentro de métodos) y solo pueden accederse desde dentro de los métodos de esa misma clase. Ni siquiera las clases hijas tienen acceso a los campos privados de sus padres, lo que proporciona un fuerte aislamiento de la implementación interna.
''',
    'code_example': '''
class Contador {
  #valor = 0; // Campo privado

  incrementar() {
    this.#valor++;
  }

  get valor() {
    return this.#valor;
  }

  // Método para demostrar que no se puede acceder desde fuera
  intentarAccederExternamente() {
    try {
      console.log(this.#valor);
    } catch(e) {
      console.log('Acceso denegado a campo privado');
    }
  }
}

const contador = new Contador();
contador.incrementar();
console.log(contador.valor); // 1
console.log(contador.#valor); // Error: campo privado no accesible
contador.intentarAccederExternamente(); // "Acceso denegado a campo privado"
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Clases y Prototipos',
    'topic': 'Métodos estáticos y privados',
    'subtopic': 'Acceso interno y externo',
    'definition': '''
El sistema de acceso en JavaScript con campos privados (#) y métodos públicos crea una clara separación entre la API pública de una clase y su implementación interna. Esto es fundamental para el principio de encapsulamiento en la programación orientada a objetos.

Desde dentro de la clase, puedes acceder tanto a los miembros públicos como privados. Sin embargo, desde fuera solo puedes acceder a los miembros públicos. Esta asimetría permite diseñar clases con una interfaz limpia y estable, mientras mantienes la libertad de cambiar la implementación interna sin afectar a los consumidores de tu clase.

Un patrón común es usar métodos getter públicos para proporcionar acceso controlado a datos privados, posiblemente con validación o transformación. Los setters pueden incluir lógica para mantener la integridad de los datos. Esta aproximación es más flexible que exponer campos públicos directamente, ya que permite cambiar la implementación sin modificar la interfaz.
''',
    'code_example': '''
class Usuario {
  #nombre;
  #edad;

  constructor(nombre, edad) {
    this.#nombre = nombre;
    this.#edad = edad;
  }

  // Getter público para nombre
  get nombre() {
    return this.#nombre.toUpperCase();
  }

  // Método público que accede a datos privados
  esMayorDeEdad() {
    return this.#edad >= 18;
  }

  // Setter con validación
  set edad(nuevaEdad) {
    if (nuevaEdad > 0 && nuevaEdad < 120) {
      this.#edad = nuevaEdad;
    } else {
      console.log('Edad no válida');
    }
  }
}

const usuario = new Usuario('Ana', 25);
console.log(usuario.nombre); // "ANA" (transformado por el getter)
console.log(usuario.esMayorDeEdad()); // true
usuario.edad = 30; // Funciona
usuario.edad = 200; // "Edad no válida"

// Intento de acceso directo fallido
console.log(usuario.#nombre); // Error: campo privado
''',
  });
}

Future<void> insertJsSrLevel2Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 2,
    'title_level': 'Módulos en JavaScript',
    'topic': 'Módulos CommonJS',
    'subtopic': 'require',
    'definition': '''
Cuando trabajas con muchos archivos en JavaScript, necesitas una forma de compartir funciones, objetos o variables entre ellos. Aquí es donde entra en juego CommonJS y su función `require`.

¿Te preguntas por qué usar algo como `require` si puedes copiar y pegar código entre archivos? Bueno, mantener tu código modular hace que sea más limpio, reutilizable y fácil de mantener. 

`require` es una función que te permite importar módulos en Node.js (entorno de ejecución basado en JavaScript). Puedes traer funciones o datos definidos en otro archivo y usarlos como si fueran parte del actual. Internamente, cuando usas `require`, Node carga el archivo, lo ejecuta y te devuelve lo que exportó. Es una herramienta clave para dividir el código en partes más manejables. Aunque hoy en día los módulos ECMAScript (ESM) están ganando popularidad, `require` sigue siendo ampliamente usado en entornos que trabajan con CommonJS.
''',
    'code_example': r'''
// archivo utils.js
function saludar(nombre) {
  return `Hola, ${nombre}`;
}

module.exports = saludar;

// archivo app.js
const saludar = require('./utils');

console.log(saludar('Carlos')); // Hola, Carlos
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 2,
    'title_level': 'Módulos en JavaScript',
    'topic': 'Módulos CommonJS',
    'subtopic': 'module.exports',
    'definition': '''
Cuando creas funcionalidades en un archivo y quieres que otros las puedan usar, necesitas una forma de exportarlas. En CommonJS, esa forma es `module.exports`.

Seguro te estás preguntando: ¿qué diferencia hay entre `exports` y `module.exports`? Buena pregunta. Aunque a veces se usan como sinónimos, `module.exports` es el verdadero objeto que se devuelve cuando haces un `require`.

Todo lo que asignes a `module.exports` será lo que otro archivo podrá importar. Puedes exportar funciones, objetos o clases completas. Esto permite encapsular la lógica en módulos y hacer que tu aplicación escale sin convertirse en un caos.
''',
    'code_example': r'''
// archivo math.js
module.exports = {
  suma(a, b) {
    return a + b;
  },
  resta(a, b) {
    return a - b;
  }
};

// archivo main.js
const math = require('./math');
console.log(math.suma(3, 2)); // 5
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 2,
    'title_level': 'Módulos en JavaScript',
    'topic': 'Módulos CommonJS',
    'subtopic': 'Contexto de ejecución',
    'definition': '''
Cada módulo en Node.js se ejecuta dentro de su propio contexto. Eso significa que las variables que defines en un archivo no se mezclan con las de otros archivos.

¿Te estás preguntando qué tiene de especial este "contexto"? Pues que, gracias a esto, puedes crear variables con el mismo nombre en diferentes módulos sin preocuparte de que choquen entre sí.

Node.js envuelve cada archivo en una función antes de ejecutarlo, lo que le da su propio scope. Es como si cada archivo fuera una mini aplicación aislada, evitando conflictos y ayudando a mantener la estructura limpia. 
''',
    'code_example': r'''
// archivo uno.js
const secreto = '1234';
console.log(module); // cada módulo tiene su propio objeto module

// archivo dos.js
const secreto = 'abcd'; // no entra en conflicto con uno.js
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 2,
    'title_level': 'Módulos en JavaScript',
    'topic': 'Módulos ECMAScript (ESM)',
    'subtopic': 'Importación con import',
    'definition': '''
ECMAScript introdujo una forma más moderna y estandarizada de manejar módulos usando `import`. Si vienes de usar `require`, verás que `import` es más declarativo y elegante.

Quizá te estés preguntando: ¿por qué cambiar a `import` si `require` funciona? La realidad es que `import` te da ventajas como carga estática, que permite mejores optimizaciones por parte del motor de JavaScript.

Con `import`, puedes traer funciones, objetos o clases desde otro archivo de forma explícita, lo que mejora la claridad del código. Además, es compatible con el navegador y soportado de forma nativa por muchos entornos modernos.
''',
    'code_example': r'''
// archivo utils.js
export function saludar(nombre) {
  return `Hola, ${nombre}`;
}

// archivo app.js
import { saludar } from './utils.js';

console.log(saludar('Lucía')); // Hola, Lucía
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 2,
    'title_level': 'Módulos en JavaScript',
    'topic': 'Módulos ECMAScript (ESM)',
    'subtopic': 'Exportación con export',
    'definition': '''
Cuando quieres que una función, clase o constante esté disponible fuera del archivo donde fue definida, usas `export`.

¿Te estás preguntando cuál usar: `export` o `export default`? Esa es una duda común. `export` se usa para exportaciones nombradas, mientras que `export default` permite exportar una sola cosa principal por archivo.

Usar `export` ayuda a mantener tu código modular y organizado. Así, puedes importar solo lo que necesitas y mantener un control más fino sobre lo que compartes con el resto de la app.
''',
    'code_example': r'''
// Exportación nombrada
export const PI = 3.14;
export function area(radio) {
  return PI * radio * radio;
}

// Exportación por defecto
export default function saludo() {
  return 'Hola mundo';
}
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 2,
    'title_level': 'Módulos en JavaScript',
    'topic': 'Módulos ECMAScript (ESM)',
    'subtopic': 'Importaciones por defecto y nombradas',
    'definition': '''
Cuando importas cosas con `import` en JavaScript, puedes hacerlo de distintas maneras según cómo se haya exportado el contenido: por defecto o de forma nombrada.

¿No estás seguro de cuál usar o cuándo? No te preocupes, es algo que confunde a muchos al principio.

Una exportación por defecto permite exportar una única cosa principal desde un archivo. Por ejemplo, una función o clase que representa la "idea central" del módulo. En cambio, las exportaciones nombradas te permiten exportar múltiples elementos, como funciones auxiliares, constantes u objetos. Lo bueno es que puedes combinarlas si lo necesitas: tener una exportación por defecto y otras nombradas en el mismo archivo. Esto le da flexibilidad a tu código y te obliga a pensar mejor qué cosas deben ser reutilizadas.

Al importar, si usas `import nombre from`, estás trayendo la exportación por defecto. Si usas `{ nombre }`, estás trayendo una nombrada. Si te equivocas en el tipo de importación, puede que el código ni siquiera corra, así que es bueno entender bien la diferencia.
''',
    'code_example': r'''
// archivo math.js
export default function sumar(a, b) {
  return a + b;
}

export const PI = 3.1416;

// archivo app.js
import sumar, { PI } from './math.js';

console.log(sumar(5, 3)); // 8
console.log(PI);          // 3.1416
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 2,
    'title_level': 'Módulos en JavaScript',
    'topic': 'Módulos dinámicos',
    'subtopic': 'import()',
    'definition': '''
En JavaScript, `import()` es una función que permite cargar módulos de forma dinámica y asíncrona. A diferencia de las importaciones estáticas, que se realizan al inicio del archivo, `import()` te da la flexibilidad de cargar módulos cuando realmente los necesitas.

¿Te preguntas por qué usar `import()` en lugar de las importaciones tradicionales? Bueno, imagina que tienes una aplicación grande y algunos módulos solo se utilizan en ciertas condiciones. Con `import()`, puedes cargar esos módulos bajo demanda, mejorando el rendimiento y reduciendo el tiempo de carga inicial.

Cuando llamas a `import()`, esta devuelve una promesa que se resuelve con el módulo solicitado. Esto significa que puedes usar `await` para obtener el módulo y acceder a sus exportaciones. Es especialmente útil en aplicaciones que requieren carga condicional de componentes o funcionalidades.
''',
    'code_example': r'''
// Carga dinámica de un módulo
async function cargarModulo() {
  const modulo = await import('./miModulo.js');
  modulo.funcionExportada();
}

cargarModulo();
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 2,
    'title_level': 'Módulos en JavaScript',
    'topic': 'Módulos dinámicos',
    'subtopic': 'Carga condicional de módulos',
    'definition': '''
La carga condicional de módulos te permite importar módulos solo cuando se cumplen ciertas condiciones en tiempo de ejecución. Esto es útil para optimizar el rendimiento de tu aplicación, evitando cargar código innecesario.

¿Te estás preguntando cómo funciona esto en la práctica? Supongamos que tienes una funcionalidad que solo se utiliza en dispositivos móviles. Puedes verificar si el usuario está en un dispositivo móvil y, en ese caso, cargar el módulo correspondiente.

Utilizando `import()` dentro de una estructura condicional, puedes decidir en qué momento y bajo qué circunstancias cargar un módulo específico. Esto no solo mejora la eficiencia, sino que también permite una mayor modularidad en tu código.
''',
    'code_example': r'''
// Carga condicional de un módulo
async function inicializar() {
  if (esDispositivoMovil()) {
    const moduloMovil = await import('./moduloMovil.js');
    moduloMovil.inicializar();
  } else {
    const moduloEscritorio = await import('./moduloEscritorio.js');
    moduloEscritorio.inicializar();
  }
}

inicializar();
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 2,
    'title_level': 'Módulos en JavaScript',
    'topic': 'Módulos dinámicos',
    'subtopic': 'Módulos asincrónicos',
    'definition': '''
Los módulos asincrónicos en JavaScript permiten cargar y ejecutar código de manera no bloqueante, lo que es esencial para aplicaciones modernas que requieren alta eficiencia y capacidad de respuesta.

¿Te preguntas cómo se implementan estos módulos? Utilizando `import()`, puedes cargar módulos de forma asíncrona. Esto significa que el resto de tu aplicación puede seguir funcionando mientras se carga el módulo, mejorando la experiencia del usuario.

Además, los módulos asincrónicos son especialmente útiles cuando trabajas con recursos que pueden tardar en cargarse, como datos de una API o componentes pesados. Al cargarlos de forma asincrónica, evitas que tu aplicación se congele o se vuelva lenta.
''',
    'code_example': r'''
// Uso de un módulo asincrónico
async function obtenerDatos() {
  const moduloDatos = await import('./moduloDatos.js');
  const datos = await moduloDatos.cargarDatos();
  console.log(datos);
}

obtenerDatos();
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 2,
    'title_level': 'Módulos en JavaScript',
    'topic': 'Ámbito de los módulos',
    'subtopic': 'Encapsulamiento',
    'definition': '''
El encapsulamiento en JavaScript es una técnica que permite ocultar los detalles internos de un módulo, exponiendo solo lo necesario para su uso externo. Esto ayuda a mantener el código organizado y a prevenir conflictos entre diferentes partes de una aplicación.

¿Te preguntas cómo se logra esto en JavaScript? Una forma común es utilizando funciones autoejecutables (IIFE) o el patrón de módulo revelador. Estas estructuras crean un ámbito privado donde se pueden definir variables y funciones que no serán accesibles desde el exterior, a menos que se expongan explícitamente.

Este enfoque no solo mejora la seguridad del código al evitar accesos no deseados, sino que también facilita el mantenimiento y la escalabilidad de las aplicaciones al mantener una separación clara entre las partes internas y externas de un módulo.
''',
    'code_example': r'''
// Ejemplo de encapsulamiento con IIFE
const modulo = (function() {
  // Variable privada
  let contador = 0;

  // Función privada
  function incrementar() {
    contador++;
  }

  // Exponiendo solo lo necesario
  return {
    obtenerContador: function() {
      return contador;
    },
    aumentar: function() {
      incrementar();
    }
  };
})();

modulo.aumentar();
console.log(modulo.obtenerContador()); // 1
// console.log(modulo.contador); // undefined
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 2,
    'title_level': 'Módulos en JavaScript',
    'topic': 'Ámbito de los módulos',
    'subtopic': 'Variables privadas',
    'definition': '''
En JavaScript, las variables privadas son aquellas que no pueden ser accedidas directamente desde fuera de su ámbito. Esto es útil para proteger datos sensibles y evitar modificaciones no deseadas.

¿Te preguntas cómo crear variables privadas? Una técnica común es utilizar closures, donde una función interna tiene acceso a las variables de su función externa, pero estas no son accesibles desde fuera. Otra forma más moderna es utilizando campos privados en clases, introducidos en ECMAScript 2022, que se definen con el prefijo `#`.

Estas técnicas permiten encapsular datos y comportamientos, mejorando la modularidad y seguridad del código.
''',
    'code_example': r'''
// Usando closures
function crearContador() {
  let contador = 0;
  return {
    incrementar: function() {
      contador++;
    },
    obtener: function() {
      return contador;
    }
  };
}

const contador = crearContador();
contador.incrementar();
console.log(contador.obtener()); // 1
// console.log(contador.contador); // undefined

// Usando campos privados en clases
class Contador {
  #contador = 0;

  incrementar() {
    this.#contador++;
  }

  obtener() {
    return this.#contador;
  }
}

const c = new Contador();
c.incrementar();
console.log(c.obtener()); // 1
// console.log(c.#contador); // SyntaxError
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 2,
    'title_level': 'Módulos en JavaScript',
    'topic': 'Ámbito de los módulos',
    'subtopic': 'Separación de responsabilidades',
    'definition': '''
La separación de responsabilidades es un principio de diseño que consiste en dividir una aplicación en partes distintas, cada una encargada de una tarea específica. Esto facilita el mantenimiento, la escalabilidad y la comprensión del código.

¿Te preguntas cómo aplicar esto en JavaScript? Una forma es organizando el código en módulos, donde cada módulo se encarga de una funcionalidad particular, como la gestión de datos, la interfaz de usuario o la lógica de negocio. Esto permite trabajar en cada parte de forma independiente y reutilizar código en diferentes contextos.

Al mantener responsabilidades separadas, se reduce la complejidad y se mejora la calidad del software.
''',
    'code_example': r'''
// Módulo de datos
const datos = (function() {
  let lista = [];

  return {
    agregar: function(item) {
      lista.push(item);
    },
    obtenerTodos: function() {
      return lista;
    }
  };
})();

// Módulo de interfaz
const interfaz = (function() {
  return {
    mostrar: function(items) {
      items.forEach(item => console.log(item));
    }
  };
})();

// Uso
datos.agregar('Elemento 1');
datos.agregar('Elemento 2');
interfaz.mostrar(datos.obtenerTodos());
// Salida:
// Elemento 1
// Elemento 2
''',
  });
}

Future<void> insertJsSrLevel3Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Iteradores y Generadores',
    'topic': 'Iteradores personalizados',
    'subtopic': 'Protocolo iterable',
    'definition': '''
El protocolo iterable en JavaScript define cómo los objetos deben comportarse para ser compatibles con construcciones como `for...of` y el operador de propagación (`...`). Básicamente, si un objeto implementa el método `[Symbol.iterator]`, se considera iterable.

¿Te preguntas por qué es importante esto? Bueno, al hacer que tus objetos sean iterables, puedes integrarlos de manera más fluida con las características del lenguaje que esperan iterables, como bucles y funciones que procesan colecciones.

Implementar el protocolo iterable permite que tus objetos personalizados se comporten como arrays u otras colecciones nativas, facilitando su uso y manipulación.
''',
    'code_example': r'''
// Objeto personalizado que implementa el protocolo iterable
const miIterable = {
  datos: [1, 2, 3],
  [Symbol.iterator]() {
    let index = 0;
    const datos = this.datos;
    return {
      next() {
        if (index < datos.length) {
          return { value: datos[index++], done: false };
        } else {
          return { done: true };
        }
      }
    };
  }
};

for (const valor of miIterable) {
  console.log(valor);
}
// Salida:
// 1
// 2
// 3
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Iteradores y Generadores',
    'topic': 'Iteradores personalizados',
    'subtopic': 'Implementación de [Symbol.iterator]()',
    'definition': '''
El método `[Symbol.iterator]()` es la clave para hacer que un objeto sea iterable en JavaScript. Al definir este método, puedes personalizar cómo se recorre tu objeto con `for...of` y otras construcciones que esperan iterables.

¿Te preguntas cómo implementarlo? Simplemente, define una función que devuelva un objeto con un método `next()`. Este método debe retornar un objeto con las propiedades `value` y `done`, indicando el valor actual y si la iteración ha terminado.

Esta capacidad te permite controlar completamente la forma en que tus objetos son iterados, lo que es útil para crear estructuras de datos personalizadas o interfaces más intuitivas.
''',
    'code_example': r'''
// Implementación de [Symbol.iterator]() en un objeto personalizado
const contador = {
  inicio: 1,
  fin: 5,
  [Symbol.iterator]() {
    let actual = this.inicio;
    const fin = this.fin;
    return {
      next() {
        if (actual <= fin) {
          return { value: actual++, done: false };
        } else {
          return { done: true };
        }
      }
    };
  }
};

for (const num of contador) {
  console.log(num);
}
// Salida:
// 1
// 2
// 3
// 4
// 5
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Iteradores y Generadores',
    'topic': 'Iteradores personalizados',
    'subtopic': 'Iteración manual con .next()',
    'definition': '''
La iteración manual con `.next()` te permite tener un control más detallado sobre el proceso de iteración. En lugar de usar un bucle `for...of`, puedes avanzar paso a paso, lo que es útil en situaciones donde necesitas pausar o modificar la iteración en función de condiciones específicas.

¿Te preguntas cuándo usar esto? Por ejemplo, en casos donde la iteración depende de eventos externos o necesitas interacciones más complejas entre pasos.

Cada llamada a `.next()` devuelve un objeto con las propiedades `value` y `done`, lo que te permite saber el valor actual y si la iteración ha finalizado.
''',
    'code_example': r'''
// Iteración manual con .next()
function* generador() {
  yield 'a';
  yield 'b';
  yield 'c';
}

const iterador = generador();

console.log(iterador.next()); // { value: 'a', done: false }
console.log(iterador.next()); // { value: 'b', done: false }
console.log(iterador.next()); // { value: 'c', done: false }
console.log(iterador.next()); // { value: undefined, done: true }
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Iteradores y Generadores',
    'topic': 'Generadores (function*)',
    'subtopic': 'Declaración y uso básico',
    'definition': '''
Los generadores, definidos con `function*`, son funciones especiales que pueden pausar su ejecución y reanudarla más tarde. Esto se logra mediante la palabra clave `yield`, que permite devolver múltiples valores a lo largo del tiempo.

¿Te preguntas cómo se usan? Al llamar a una función generadora, no se ejecuta inmediatamente. En su lugar, devuelve un objeto iterador que puedes recorrer con `.next()` o en un bucle `for...of`.

Esta característica es útil para manejar secuencias de datos, especialmente cuando trabajas con flujos o necesitas mantener el estado entre iteraciones.
''',
    'code_example': r'''
// Declaración y uso básico de un generador
function* generador() {
  yield 1;
  yield 2;
  yield 3;
}

const iterador = generador();

for (const valor of iterador) {
  console.log(valor);
}
// Salida:
// 1
// 2
// 3
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Iteradores y Generadores',
    'topic': 'Generadores (function*)',
    'subtopic': 'Uso del yield',
    'definition': '''
El operador `yield` en JavaScript se utiliza dentro de funciones generadoras para pausar y reanudar su ejecución. Esto permite que la función devuelva múltiples valores a lo largo del tiempo, en lugar de todos a la vez.

¿Te preguntas cómo funciona esto en la práctica? Cuando una función generadora encuentra una expresión `yield`, su ejecución se detiene y el valor especificado se devuelve al llamador. La función puede luego reanudarse desde donde se detuvo, permitiendo un control más preciso sobre el flujo de datos.

Esta capacidad es especialmente útil para manejar secuencias de datos grandes o infinitas, ya que permite procesar elementos uno por uno sin cargar todo en memoria.
''',
    'code_example': r'''
// Función generadora que produce una secuencia de números
function* generadorNumeros() {
  yield 1;
  yield 2;
  yield 3;
}

const iterador = generadorNumeros();

console.log(iterador.next().value); // 1
console.log(iterador.next().value); // 2
console.log(iterador.next().value); // 3
console.log(iterador.next().done);  // true
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Iteradores y Generadores',
    'topic': 'Generadores (function*)',
    'subtopic': 'Comunicación con generadores',
    'definition': '''
Una característica poderosa de las funciones generadoras en JavaScript es la capacidad de comunicarse bidireccionalmente con el código que las utiliza. Esto se logra mediante el método `next()`, que no solo reanuda la ejecución del generador, sino que también puede enviar valores de vuelta a él.

¿Te preguntas cómo se establece esta comunicación? Cuando una función generadora se pausa en una expresión `yield`, puede recibir un valor la próxima vez que se llame a `next(valor)`. Este valor se convierte en el resultado de la expresión `yield` dentro del generador, permitiendo que el generador ajuste su comportamiento en función de la entrada recibida.

Esta interacción bidireccional es útil para construir flujos de control complejos, como máquinas de estados o procesadores de datos que requieren retroalimentación en cada paso.
''',
    'code_example': r'''
// Generador que recibe valores externos
function* generadorInteractivo() {
  const nombre = yield "¿Cuál es tu nombre?";
  const edad = yield "¿Cuál es tu edad?";
  return `Hola, ${nombre}. Tienes ${edad} años.`;
}

const iterador = generadorInteractivo();

console.log(iterador.next().value);       // "¿Cuál es tu nombre?"
console.log(iterador.next("Carlos").value); // "¿Cuál es tu edad?"
console.log(iterador.next(30).value);       // "Hola, Carlos. Tienes 30 años."
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Iteradores y Generadores',
    'topic': 'Iteración avanzada',
    'subtopic': 'Composición de generadores',
    'definition': '''
La composición de generadores permite combinar múltiples generadores en uno solo, facilitando la creación de secuencias complejas de manera modular y reutilizable.

¿Te preguntas cómo se logra esto? Utilizando la sintaxis `yield*`, puedes delegar la iteración a otro generador, integrando sus valores en la secuencia del generador principal. Esto es útil cuando deseas construir secuencias a partir de partes más pequeñas y manejables.

Esta técnica mejora la legibilidad y mantenibilidad del código, especialmente en aplicaciones que requieren la generación de secuencias complejas o jerárquicas.
''',
    'code_example': r'''
// Generador que produce una secuencia de números
function* generarNumeros(inicio, fin) {
  for (let i = inicio; i <= fin; i++) {
    yield i;
  }
}

// Generador que compone múltiples secuencias
function* generarSecuenciaCompleta() {
  yield* generarNumeros(1, 3);
  yield* generarNumeros(10, 12);
}

for (const numero of generarSecuenciaCompleta()) {
  console.log(numero);
}
// Salida:
// 1
// 2
// 3
// 10
// 11
// 12
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Iteradores y Generadores',
    'topic': 'Iteración avanzada',
    'subtopic': 'Delegación con yield*',
    'definition': '''
La delegación con `yield*` permite que un generador ceda el control de la iteración a otro generador o iterable, integrando sus valores en la secuencia del generador principal.

¿Te preguntas cuándo usar esto? Es útil cuando deseas dividir una secuencia en partes lógicas o reutilizar generadores existentes dentro de otros generadores. Al usar `yield*`, el generador principal se convierte en un intermediario que transmite los valores del generador delegado.

Esta técnica promueve la modularidad y la reutilización del código, facilitando la construcción de secuencias complejas a partir de componentes más simples.
''',
    'code_example': r'''
// Generador que produce letras
function* generarLetras() {
  yield 'a';
  yield 'b';
  yield 'c';
}

// Generador que delega a otro generador
function* generarCaracteres() {
  yield 1;
  yield* generarLetras(); // Delegación
  yield 2;
}

for (const valor of generarCaracteres()) {
  console.log(valor);
}
// Salida:
// 1
// 'a'
// 'b'
// 'c'
// 2
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Iteradores y Generadores',
    'topic': 'Iteración avanzada',
    'subtopic': 'Iteradores con for...of',
    'definition': '''
El bucle `for...of` en JavaScript permite iterar sobre objetos iterables, como arrays, strings, maps, sets y generadores. Es una forma sencilla y legible de recorrer elementos sin necesidad de manejar índices o llamadas explícitas a métodos de iteración.

¿Te preguntas cómo se aplica esto a los generadores? Cuando un generador produce una secuencia de valores, puedes utilizar `for...of` para consumir esos valores de manera eficiente y clara. Esto simplifica el código y mejora su legibilidad.

El uso de `for...of` con generadores es especialmente útil cuando deseas procesar cada valor generado sin preocuparte por los detalles internos de la iteración.
''',
    'code_example': r'''
// Generador que produce una secuencia de números
function* generarNumeros() {
  yield 1;
  yield 2;
  yield 3;
}

for (const numero of generarNumeros()) {
  console.log(numero);
}
// Salida:
// 1
// 2
// 3
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Iteradores y Generadores',
    'topic': 'Async Generators',
    'subtopic': 'async function*',
    'definition': '''
Las funciones generadoras asíncronas, definidas con `async function*`, permiten generar secuencias de valores que pueden ser obtenidos de manera asíncrona. Esto es útil cuando necesitas manejar flujos de datos que llegan con el tiempo, como respuestas de red o lecturas de archivos.

¿Te preguntas cómo se utilizan? Dentro de una función generadora asíncrona, puedes usar `await` para esperar la resolución de promesas antes de emitir cada valor con `yield`. Esto combina la potencia de los generadores con la capacidad de manejar operaciones asíncronas de forma secuencial.

Esta característica es especialmente valiosa en aplicaciones que requieren procesar datos a medida que se reciben, sin bloquear la ejecución del programa.
''',
    'code_example': r'''
// Generador asíncrono que simula la obtención de datos
async function* obtenerDatos() {
  const datos = ['dato1', 'dato2', 'dato3'];
  for (const dato of datos) {
    await new Promise(resolve => setTimeout(resolve, 1000)); // Simula retraso
    yield dato;
  }
}

(async () => {
  for await (const dato of obtenerDatos()) {
    console.log(dato);
  }
})();
// Salida (con un segundo de intervalo entre cada línea):
// 'dato1'
// 'dato2'
// 'dato3'
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Iteradores y Generadores',
    'topic': 'Async Generators',
    'subtopic': 'Uso de for await...of',
    'definition': '''
El bucle `for await...of` en JavaScript permite iterar sobre objetos asincrónamente iterables, como generadores asíncronos o streams de datos. Es una herramienta poderosa para manejar flujos de datos que llegan con el tiempo, permitiendo procesarlos de manera secuencial y sin bloquear la ejecución.

¿Te preguntas cómo se diferencia de `for...of`? Mientras que `for...of` se utiliza para iterar sobre objetos sincrónicos, `for await...of` está diseñado para manejar objetos que devuelven promesas, esperando su resolución antes de continuar con la siguiente iteración.

Esta sintaxis es especialmente útil en aplicaciones que requieren procesar datos a medida que se reciben, como lecturas de archivos, respuestas de red o eventos de usuario.
''',
    'code_example': r'''
// Generador asíncrono que simula la obtención de datos
async function* obtenerDatos() {
  const datos = ['dato1', 'dato2', 'dato3'];
  for (const dato of datos) {
    await new Promise(resolve => setTimeout(resolve, 1000)); // Simula retraso
    yield dato;
  }
}

(async () => {
  for await (const dato of obtenerDatos()) {
    console.log(dato);
  }
})();
// Salida (con un segundo de intervalo entre cada línea):
// 'dato1'
// 'dato2'
// 'dato3'
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Iteradores y Generadores',
    'topic': 'Async Generators',
    'subtopic': 'Control asincrónico por lotes',
    'definition': '''
El control asincrónico por lotes implica procesar conjuntos de datos en grupos, permitiendo manejar grandes volúmenes de información de manera eficiente y sin bloquear la ejecución del programa.

¿Te preguntas cómo se implementa esto en JavaScript? Utilizando generadores asíncronos junto con técnicas de procesamiento por lotes, puedes obtener y procesar datos en bloques, esperando la finalización de cada lote antes de continuar con el siguiente.

Esta estrategia es especialmente útil en aplicaciones que manejan grandes cantidades de datos, como procesamiento de archivos, consultas a bases de datos o llamadas a APIs, optimizando el uso de recursos y mejorando el rendimiento general.
''',
    'code_example': r'''
// Generador asíncrono que simula la obtención de datos en lotes
async function* obtenerLotes() {
  const lotes = [
    ['dato1', 'dato2'],
    ['dato3', 'dato4'],
    ['dato5']
  ];
  for (const lote of lotes) {
    await new Promise(resolve => setTimeout(resolve, 1000)); // Simula retraso
    yield lote;
  }
}

(async () => {
  for await (const lote of obtenerLotes()) {
    console.log('Procesando lote:', lote);
    // Aquí podrías procesar cada elemento del lote
  }
})();
// Salida (con un segundo de intervalo entre cada línea):
// 'Procesando lote: ['dato1', 'dato2']'
// 'Procesando lote: ['dato3', 'dato4']'
// 'Procesando lote: ['dato5']'
''',
  });
}

Future<void> insertJsSrLevel4Data(Database db) async {}
