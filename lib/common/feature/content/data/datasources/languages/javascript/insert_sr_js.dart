import 'package:sqflite_common/sqlite_api.dart';

Future<void> insertJsSrLevel1Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 1,
    'tittle_level': 'Clases y Prototipos',
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
    'tittle_level': 'Clases y Prototipos',
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
    'tittle_level': 'Clases y Prototipos',
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
    'tittle_level': 'Clases y Prototipos',
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
    'tittle_level': 'Clases y Prototipos',
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
    'tittle_level': 'Clases y Prototipos',
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
    'tittle_level': 'Clases y Prototipos',
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
    'tittle_level': 'Clases y Prototipos',
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
    'tittle_level': 'Clases y Prototipos',
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
    'tittle_level': 'Clases y Prototipos',
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
    'tittle_level': 'Clases y Prototipos',
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
    'tittle_level': 'Clases y Prototipos',
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
    'tittle_level': 'Módulos en JavaScript',
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
    'tittle_level': 'Módulos en JavaScript',
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
    'tittle_level': 'Módulos en JavaScript',
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
    'tittle_level': 'Módulos en JavaScript',
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
    'tittle_level': 'Módulos en JavaScript',
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
    'tittle_level': 'Módulos en JavaScript',
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
    'tittle_level': 'Módulos en JavaScript',
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
    'tittle_level': 'Módulos en JavaScript',
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
    'tittle_level': 'Módulos en JavaScript',
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
    'tittle_level': 'Módulos en JavaScript',
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
    'tittle_level': 'Módulos en JavaScript',
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
    'tittle_level': 'Módulos en JavaScript',
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
    'tittle_level': 'Iteradores y Generadores',
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
    'tittle_level': 'Iteradores y Generadores',
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
    'tittle_level': 'Iteradores y Generadores',
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
    'tittle_level': 'Iteradores y Generadores',
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
    'tittle_level': 'Iteradores y Generadores',
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
    'tittle_level': 'Iteradores y Generadores',
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
    'tittle_level': 'Iteradores y Generadores',
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
    'tittle_level': 'Iteradores y Generadores',
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
    'tittle_level': 'Iteradores y Generadores',
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
    'tittle_level': 'Iteradores y Generadores',
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
    'tittle_level': 'Iteradores y Generadores',
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
    'tittle_level': 'Iteradores y Generadores',
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

Future<void> insertJsSrLevel4Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 4,
    'tittle_level': 'Gestión de Memoria y Rendimiento',
    'topic': 'Modelo de memoria en JS',
    'subtopic': 'Stack vs Heap',
    'definition': '''
En JavaScript, la memoria se gestiona en dos estructuras principales: el stack y el heap. El stack es rápido pero limitado, mientras que el heap es más flexible pero requiere más gestión.

Si nunca has pensado en cómo JavaScript maneja la memoria internamente, puede parecer un tema abstracto. Pero entender esta diferencia es clave para optimizar el rendimiento de tus aplicaciones.

El stack almacena variables primitivas y referencias a objetos en un orden específico (LIFO - Last In, First Out). Es rápido porque la asignación y liberación de memoria es predecible. El heap, por otro lado, almacena los objetos complejos y las asignaciones dinámicas. Cuando creas un objeto, array o función, estos van al heap, mientras que las referencias a ellos se guardan en el stack. La recolección de basura (garbage collection) trabaja principalmente en el heap para liberar memoria no utilizada.
''',
    'code_example': '''
// Variables primitivas van al stack
let age = 30; // stack
let name = 'Alex'; // stack

// Objetos van al heap, la referencia va al stack
let person = { // referencia en stack, objeto en heap
  name: 'Alex',
  age: 30
};

// MALA PRÁCTICA: Crear muchos objetos temporales puede saturar el heap
function processData() {
  for(let i = 0; i < 10000; i++) {
    let tempObj = {index: i}; // Se crea y descarta rápidamente
    // Mejor: reutilizar objetos cuando sea posible
  }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 4,
    'tittle_level': 'Gestión de Memoria y Rendimiento',
    'topic': 'Modelo de memoria en JS',
    'subtopic': 'Asignación y liberación automática',
    'definition': '''
JavaScript maneja la memoria de forma automática mediante asignación y liberación, lo que nos ahorra tener que hacerlo manualmente como en otros lenguajes.

Puede que te preguntes cómo es que nunca tienes que "borrar" variables en JavaScript. Esto es gracias al recolector de basura (garbage collector), que trabaja en segundo plano.

Cuando declaras una variable, JavaScript automáticamente asigna memoria para ella. Para tipos primitivos, la memoria se libera inmediatamente cuando la variable sale de ámbito. Para objetos, el garbage collector identifica cuándo ya no hay referencias activas al objeto y libera esa memoria. Sin embargo, hay casos donde podemos crear memory leaks sin darnos cuenta, como cuando mantenemos referencias innecesarias a objetos grandes.
''',
    'code_example': '''
function createObjects() {
  const bigObject = new Array(1000000).fill('data'); // Ocupa mucha memoria
  
  // Cuando la función termina, bigObject es elegible para GC
  // a menos que haya referencias externas
}

// MEMORY LEAK POTENCIAL:
let cache = [];
function processWithLeak(data) {
  cache.push(processData(data)); // Los datos nunca se liberan
  // Mejor: limpiar el cache periódicamente o usar WeakMap
}
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 4,
    'tittle_level': 'Gestión de Memoria y Rendimiento',
    'topic': 'Modelo de memoria en JS',
    'subtopic': 'Variables primitivas vs referencias',
    'definition': '''
En JavaScript, hay una diferencia fundamental en cómo se manejan los tipos primitivos (numbers, strings, booleans) versus los objetos (arrays, functions, objects).

Si vienes de otros lenguajes, quizás esperes que todo se comporte como objetos. Pero en JavaScript, los primitivos tienen un comportamiento especial que afecta cómo trabajan con la memoria.

Los tipos primitivos se almacenan directamente en el stack y se pasan por valor - cuando los asignas a otra variable, se copia el valor. Los objetos, en cambio, se pasan por referencia - solo se copia la referencia al mismo objeto en el heap. Esto explica por qué modificar un objeto a través de una variable afecta a todas las referencias a ese mismo objeto, mientras que con primitivos cada variable mantiene su propio valor independiente.
''',
    'code_example': '''
// Primitivos - pasados por valor
let a = 10;
let b = a; // b obtiene una copia del valor
b = 20;
console.log(a); // 10 (no cambió)

// Objetos - pasados por referencia
let obj1 = {value: 10};
let obj2 = obj1; // obj2 apunta al mismo objeto
obj2.value = 20;
console.log(obj1.value); // 20 (ambos cambiaron)

// Para clonar objetos correctamente:
let obj3 = {...obj1}; // Spread operator para copia superficial
let obj4 = JSON.parse(JSON.stringify(obj1)); // Copia profunda (con limitaciones)
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 4,
    'tittle_level': 'Gestión de Memoria y Rendimiento',
    'topic': 'Recolección de basura (Garbage Collection)',
    'subtopic': 'Algoritmos de GC',
    'definition': '''
JavaScript utiliza algoritmos sofisticados para identificar y liberar memoria no utilizada automáticamente. Los motores modernos como V8 (Chrome) y SpiderMonkey (Firefox) han refinado estos procesos a lo largo de los años.

Quizás te sorprenda saber que el garbage collection no es perfecto y tiene un costo de rendimiento. Los motores de JavaScript han evolucionado para minimizar este impacto mediante algoritmos inteligentes.

Los dos algoritmos principales son: Mark-and-Sweep (marca y barre) y Generational Collection. Mark-and-Sweep recorre todos los objetos alcanzables desde las raíces globales, marcando los que están en uso, luego barre los no marcados. El enfoque generacional divide los objetos en "jóvenes" (allocados recientemente) y "viejos", ya que estadísticamente la mayoría de objetos mueren jóvenes. Esto permite optimizar la recolección enfocándose en las áreas más probables de tener basura.
''',
    'code_example': '''
// Ejemplo que puede generar trabajo extra para el GC
function createManyTemporaryObjects() {
  for(let i = 0; i < 1000; i++) {
    let temp = {index: i}; // Objeto creado y pronto descartado
    process(temp);
  }
  // El GC tendrá que limpiar estos 1000 objetos temporales
}

// Mejor enfoque: reutilizar objetos cuando sea posible
const reusableObj = {index: 0};
function createWithReuse() {
  for(let i = 0; i < 1000; i++) {
    reusableObj.index = i;
    process(reusableObj); // Mismo objeto, menos trabajo para GC
  }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 4,
    'tittle_level': 'Gestión de Memoria y Rendimiento',
    'topic': 'Recolección de basura (Garbage Collection)',
    'subtopic': 'Identificación de objetos inalcanzables',
    'definition': '''
El garbage collector de JavaScript determina qué memoria puede liberarse identificando objetos que ya no son alcanzables desde las raíces del programa.

Es posible que hayas escuchado sobre memory leaks en JavaScript y te preguntes cómo ocurren. Sucede cuando mantenemos referencias a objetos que ya no necesitamos, impidiendo que el GC los identifique como basura.

Las raíces típicas incluyen variables globales, la cadena de alcance de funciones en ejecución y referencias del DOM. Un objeto es inalcanzable cuando no hay ninguna cadena de referencias que lleve desde una raíz hasta él. Sin embargo, referencias circulares (objetos que se referencian entre sí pero no desde las raíces) sí son detectadas y recolectadas por los algoritmos modernos.
''',
    'code_example': '''
// Ejemplo de objeto inalcanzable
function createObject() {
  let obj = {data: 'temp'};
  // obj se vuelve inalcanzable al terminar la función
}

// MEMORY LEAK: referencia mantenida accidentalmente
let leakedObjects = [];
function processWithLeak(data) {
  let result = processData(data);
  leakedObjects.push(result); // Nunca se libera
  // Mejor: limpiar el array cuando ya no se necesite
}

// Referencias circulares SON recolectadas (mito común)
function createCircularReference() {
  let obj1 = {};
  let obj2 = {ref: obj1};
  obj1.ref = obj2; // Circular
  // Ambos serán recolectados si no hay otras referencias
}
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 4,
    'tittle_level': 'Gestión de Memoria y Rendimiento',
    'topic': 'Recolección de basura (Garbage Collection)',
    'subtopic': 'WeakMap y WeakSet como solución a leaks',
    'definition': '''
WeakMap y WeakSet son estructuras de datos especiales introducidas en ES6 que permiten almacenar referencias "débiles" a objetos, evitando así memory leaks comunes.

Si trabajas con caches o mapeos de objetos temporales, probablemente has enfrentado el dilema de cuándo limpiarlos. WeakMap y WeakSet resuelven esto elegantemente.

A diferencia de Map y Set normales, WeakMap y WeakSet no previenen que sus valores sean recolectados por el garbage collector. Cuando un objeto solo existe como valor en un WeakMap/WeakSet, puede ser recolectado. Esto los hace ideales para almacenar metadatos asociados a objetos cuyo ciclo de vida no controlamos, como elementos del DOM o instancias de terceras librerías. Las claves en WeakMap deben ser objetos (no primitivos).
''',
    'code_example': '''
// Uso básico de WeakMap
let weakMap = new WeakMap();
let obj = {};

weakMap.set(obj, 'metadata asociado');
console.log(weakMap.get(obj)); // 'metadata asociado'

// Cuando obj se vuelve inalcanzable...
obj = null;
// La entrada en weakMap será automáticamente removida

// EJEMPLO PRÁCTICO: Cache de resultados de procesamiento
const cache = new WeakMap();

function processCached(element) {
  if (!cache.has(element)) {
    let result = heavyProcessing(element);
    cache.set(element, result);
  }
  return cache.get(element);
}
// Cuando el elemento DOM es removido, su cache se limpia automáticamente
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 4,
    'tittle_level': 'Gestión de Memoria y Rendimiento',
    'topic': 'Detección de memory leaks',
    'subtopic': 'Uso de herramientas del navegador',
    'definition': '''
Cuando hablamos de “memory leaks” o fugas de memoria, nos referimos a casos donde el navegador guarda en la RAM cosas que ya no debería, lo que poco a poco hace que la app web se ponga lenta o hasta se caiga.

¿Te estás preguntando por qué esto importa?

Bueno, si alguna vez usaste una app web que de repente se empezó a trabar sin razón aparente, es muy posible que esté sufriendo una fuga de memoria. Aquí es donde entran las herramientas de desarrollo del navegador, como Chrome DevTools, que tienen pestañas específicas para ayudarte a detectar esos casos.

En particular, en la pestaña "Memory" de DevTools, puedes tomar snapshots (capturas del estado de la memoria) y comparar si hay objetos que siguen en memoria cuando ya no deberían. También puedes grabar el uso de memoria a lo largo del tiempo para ver si hay crecimiento constante. Si estás trabajando con listeners que nunca se eliminan o referencias a DOM que ya no se usa, estos snapshots te van a mostrar si los objetos siguen vivos.

Esta técnica es esencial para mantener una app rápida y saludable, sobre todo si tu aplicación vive abierta por muchas horas, como dashboards o apps de mensajería.
''',
    'code_example': r'''
// Código de ejemplo para usar herramientas del navegador

// Este listener se queda activo incluso si el elemento se elimina
const button = document.getElementById('click-me');

button.addEventListener('click', () => {
  console.log('Hiciste clic');
});

// Luego se elimina el botón del DOM pero el listener sigue en memoria
button.remove();

// En DevTools, ve a la pestaña Memory y toma un snapshot para ver
// si el objeto `button` sigue referenciado. Si lo está, tienes un memory leak.
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 4,
    'tittle_level': 'Gestión de Memoria y Rendimiento',
    'topic': 'Detección de memory leaks',
    'subtopic': 'Puntos comunes de fuga de memoria',
    'definition': '''
Al desarrollar en JavaScript, hay ciertos patrones y errores que suelen terminar en fugas de memoria. Esos errores no siempre generan fallos visibles, pero con el tiempo hacen que la aplicación consuma más RAM de lo necesario.

¿Te estás preguntando dónde suelen esconderse estas fugas?

Algunos de los lugares más comunes donde ocurren son:

- Listeners de eventos que nunca se eliminan (como `addEventListener` sin `removeEventListener`)
- Timers como `setInterval` que siguen ejecutándose sin necesidad
- Variables globales mal gestionadas
- Closures que retienen más información de la que deberían
- Caches o estructuras como `Map` o `Set` que nunca se limpian

Estos casos pueden parecer inofensivos en apps pequeñas, pero escalan mal. Si no se limpian correctamente, pueden mantener objetos vivos que ya no se usan, lo cual impide que el recolector de basura los elimine.

La buena noticia es que, sabiendo qué buscar, podés prevenirlos con facilidad. Y si ya están ocurriendo, herramientas como DevTools ayudan bastante a encontrarlos.
''',
    'code_example': r'''
// Peligro: esta fuga ocurre si el intervalo nunca se limpia
function startCounter() {
  setInterval(() => {
    console.log('Sigo corriendo...');
  }, 1000);
}

// Aunque ya no necesitamos el contador, sigue en memoria y ejecutándose
startCounter();

// Solución: guardar el ID del intervalo y usar clearInterval cuando sea necesario
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 4,
    'tittle_level': 'Gestión de Memoria y Rendimiento',
    'topic': 'Detección de memory leaks',
    'subtopic': 'Técnicas de profiling',
    'definition': '''
El profiling es como una radiografía de tu app: te deja ver cómo se comporta realmente bajo el capó. Sirve para encontrar cuellos de botella, fugas de memoria y partes del código que están consumiendo más recursos de los necesarios.

Seguramente pensarás que esto suena a algo avanzado y técnico.

Y lo es, pero no tiene por qué asustarte. Las herramientas modernas como Chrome DevTools hacen que perfilar una app sea accesible. Por ejemplo, la pestaña "Performance" te permite grabar una sesión de uso y ver en qué momento del timeline se hicieron más operaciones, cuánto tardaron, y si hubo bloqueos en el hilo principal.

En cuanto a la memoria, el profiling permite ver cuánto consume cada componente, función o ciclo. Esto te da pistas para decidir si vale la pena refactorizar alguna parte o si un componente está montado más tiempo del necesario.

Usar estas técnicas no solo mejora el rendimiento, también ayuda a que el usuario final tenga una experiencia más fluida.
''',
    'code_example': r'''
// No es código directo, pero así se usa el profiling en DevTools:

// 1. Abrí Chrome DevTools
// 2. Pestaña "Performance"
// 3. Click en "Record", usá la app por unos segundos y detené
// 4. Observá qué funciones tardan más y si hay trabajo bloqueante

// Para memoria:
// 1. Pestaña "Memory"
// 2. Tomá snapshots antes y después de una operación costosa
// 3. Compará si hay objetos que se quedan en memoria

// Ideal para detectar leaks o funciones que podrían optimizarse.
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 4,
    'tittle_level': 'Gestión de Memoria y Rendimiento',
    'topic': 'Optimización de performance',
    'subtopic': 'debounce y throttle',
    'definition': '''
Cuando un usuario escribe o hace scroll, tu aplicación puede llegar a ejecutar funciones decenas o cientos de veces por segundo. Eso puede saturar el navegador y hacer que todo se sienta lento o con lag.

¿Te has topado con un buscador que se congela mientras escribís?

Aquí es donde entran dos técnicas clave: **debounce** y **throttle**. Ambas ayudan a limitar cuántas veces se ejecuta una función, pero lo hacen de formas distintas.

- **Debounce** espera a que el usuario deje de hacer algo por un tiempo antes de ejecutar la función. Ideal para buscadores en vivo.
- **Throttle** ejecuta la función solo cada cierto intervalo, sin importar cuántos eventos ocurran entre medio. Perfecto para scroll o resize.

Aplicarlas bien mejora mucho el rendimiento y evita bloqueos innecesarios.
''',
    'code_example': r'''
// Debounce: espera a que el usuario deje de escribir
function debounce(fn, delay) {
  let timer;
  return function(...args) {
    clearTimeout(timer);
    timer = setTimeout(() => fn.apply(this, args), delay);
  };
}

const handleInput = debounce((event) => {
  console.log('Buscando:', event.target.value);
}, 500);

// input.addEventListener('input', handleInput);

// Throttle: ejecuta cada X tiempo sin importar cuántos eventos hay
function throttle(fn, limit) {
  let lastCall = 0;
  return function(...args) {
    const now = Date.now();
    if (now - lastCall >= limit) {
      lastCall = now;
      fn.apply(this, args);
    }
  };
}

// window.addEventListener('scroll', throttle(() => {
//   console.log('Scroll detectado');
// }, 200));
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 4,
    'tittle_level': 'Gestión de Memoria y Rendimiento',
    'topic': 'Optimización de performance',
    'subtopic': 'Medición con performance.now()',
    'definition': '''
Cuando queremos saber cuánto tiempo tarda en ejecutarse una parte específica de nuestro código, necesitamos una herramienta precisa. Aquí es donde entra en juego `performance.now()`, una función que nos proporciona una marca de tiempo con precisión de milisegundos, ideal para medir el rendimiento de nuestras funciones.

¿Te estás preguntando por qué esto importa?

Imagina que estás optimizando una función crítica en tu aplicación y necesitas saber si tus cambios realmente la hacen más rápida. Usar `performance.now()` te permite medir con exactitud el tiempo que tarda en ejecutarse esa función, ayudándote a tomar decisiones informadas sobre tus optimizaciones.

Esta función es parte de la API de rendimiento de JavaScript y es ampliamente compatible con los navegadores modernos. A diferencia de `Date.now()`, que puede verse afectado por cambios en el reloj del sistema, `performance.now()` proporciona una medición más precisa y constante, lo que la hace más confiable para pruebas de rendimiento.

Utilizar `performance.now()` es sencillo: simplemente tomas una marca de tiempo antes y después de la ejecución de la función que deseas medir y calculas la diferencia. Esta técnica es especialmente útil cuando se trabaja en aplicaciones donde el rendimiento es crítico, como juegos en línea, aplicaciones financieras o cualquier sistema en tiempo real.
''',
    'code_example': r'''
// Medir el tiempo de ejecución de una función
const inicio = performance.now();

realizarTareaIntensiva(); // Función cuya duración queremos medir

const fin = performance.now();
console.log(`La tarea tomó ${fin - inicio} milisegundos.`);
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 4,
    'tittle_level': 'Gestión de Memoria y Rendimiento',
    'topic': 'Optimización de performance',
    'subtopic': 'Minimización del trabajo en el main thread',
    'definition': '''
El "main thread" o hilo principal es donde el navegador ejecuta la mayoría de las tareas de una página web: renderizar el DOM, procesar eventos de usuario y ejecutar JavaScript. Si este hilo se sobrecarga, la aplicación puede volverse lenta o incluso no responder.

¿Te estás preguntando cómo evitar que esto suceda?

La clave está en minimizar el trabajo que realizamos en el hilo principal. Algunas estrategias efectivas incluyen:

- **Dividir el código en partes más pequeñas**: Utiliza técnicas como el "code splitting" para cargar solo el código necesario en cada momento.
- **Usar `requestIdleCallback` o `setTimeout`**: Estas funciones permiten diferir tareas no críticas para que se ejecuten cuando el hilo principal esté libre.
- **Implementar Web Workers**: Para tareas intensivas en cálculo, los Web Workers permiten ejecutar código en hilos separados, liberando el hilo principal.
- **Optimizar el uso de bibliotecas y frameworks**: Asegúrate de que las herramientas que utilizas no estén realizando operaciones costosas en el hilo principal.
- **Reducir el uso de animaciones complejas**: Las animaciones pueden ser exigentes; considera usar propiedades CSS que no requieran reflujo o repintado.

Al aplicar estas técnicas, mejorarás la capacidad de respuesta de tu aplicación, proporcionando una experiencia de usuario más fluida y eficiente.
''',
    'code_example': r'''
// Uso de Web Worker para realizar una tarea intensiva sin bloquear el hilo principal

// main.js
const worker = new Worker('worker.js');
worker.postMessage('Iniciar tarea intensiva');

worker.onmessage = function(event) {
  console.log('Resultado del worker:', event.data);
};

// worker.js
self.onmessage = function(event) {
  const resultado = realizarTareaIntensiva(); // Función pesada
  self.postMessage(resultado);
};
''',
  });
}

Future<void> insertJsSrLevel5Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 5,
    'tittle_level': 'JavaScript Seguro y Robusto',
    'topic': 'Seguridad en ejecución',
    'subtopic': 'Ataques XSS en scripts',
    'definition': '''
Los ataques XSS (Cross-Site Scripting) son una de las vulnerabilidades más comunes en aplicaciones web, permitiendo a atacantes inyectar código malicioso que se ejecuta en el contexto de tu aplicación.

Si piensas que solo las grandes empresas son objetivo de estos ataques, reconsidera. Aplicaciones pequeñas son frecuentemente objetivo precisamente porque suelen tener menos medidas de seguridad.

XSS ocurre cuando datos no sanitizados ingresados por usuarios terminan siendo interpretados como código. Hay tres tipos principales: XSS almacenado (el código malicioso se guarda en la base de datos), XSS reflejado (el código viene en la URL y se refleja en la respuesta), y DOM-based XSS (la manipulación ocurre completamente del lado del cliente). Para prevenirlos, siempre sanitiza y escapa los datos del usuario antes de mostrarlos en la página.
''',
    'code_example': '''
// VULNERABLE TO XSS:
function displayUserInput() {
  let userInput = document.getElementById('user-comment').value;
  document.getElementById('comments-section').innerHTML += userInput;
  // Si userInput contiene <script>maliciousCode()</script>, se ejecutará

  // FORMA SEGURA: usar textContent en lugar de innerHTML
  let safeDiv = document.createElement('div');
  safeDiv.textContent = userInput;
  document.getElementById('comments-section').appendChild(safeDiv);
}

// CON LIBRERÍAS DE SANITIZACIÓN (ej. DOMPurify):
import DOMPurify from 'dompurify';
let clean = DOMPurify.sanitize(userInput);
document.getElementById('safe-area').innerHTML = clean;
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 5,
    'tittle_level': 'JavaScript Seguro y Robusto',
    'topic': 'Seguridad en ejecución',
    'subtopic': 'Escapado de inputs',
    'definition': '''
Escapar inputs es el proceso de neutralizar caracteres peligrosos en datos ingresados por usuarios antes de incluirlos en tu aplicación. Es una defensa fundamental contra inyecciones de código.

Quizás te preguntes por qué no simplemente prohibir ciertos caracteres. El problema es que muchos caracteres "peligrosos" son también válidos en contextos normales (como < y > en texto matemático). Por eso escaparlos es mejor que prohibirlos.

Escapar significa convertir caracteres especiales en sus equivalentes HTML entities. Por ejemplo, < se convierte en &lt; y > en &gt;. Así, si alguien ingresa <script>, se mostrará literalmente en la página en lugar de ser interpretado como una etiqueta HTML. Las librerías modernas como DOMPurify automatizan este proceso, pero es importante entender qué hacen internamente.
''',
    'code_example': '''
// FUNCIÓN BÁSICA DE ESCAPADO:
function escapeHtml(unsafe) {
  return unsafe
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;")
    .replace(/'/g, "&#039;");
}

// USO:
let userInput = '<script>alert("XSS")</script>';
let safeOutput = escapeHtml(userInput);
console.log(safeOutput); 
// &lt;script&gt;alert(&quot;XSS&quot;)&lt;/script&gt;

// EN EL DOM:
document.getElementById('output').textContent = userInput; // Seguro (automáticamente escapa)
// vs
document.getElementById('output').innerHTML = escapeHtml(userInput); // También seguro
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 5,
    'tittle_level': 'JavaScript Seguro y Robusto',
    'topic': 'Seguridad en ejecución',
    'subtopic': 'Sanitización de datos',
    'definition': '''
La sanitización va un paso más allá del escapado: no solo neutraliza código peligroso, sino que también elimina o transforma contenido no deseado según reglas específicas de tu aplicación.

Pensemos por un momento en un campo donde los usuarios pueden ingresar HTML limitado (como negritas y enlaces). El escapado completo haría imposible este formato, mientras que la sanitización permite solo lo seguro.

Herramientas como DOMPurify implementan listas blancas (whitelists) de etiquetas y atributos permitidos. Por ejemplo, puedes permitir <strong> pero no <script>, o href en <a> pero solo con protocolos http/https (no javascript:). La sanitización debe ocurrir del lado del servidor también, nunca confíes solo en la validación del cliente. Un enfoque común es sanitizar al guardar los datos y al mostrarlos (defensa en profundidad).
''',
    'code_example': '''
// CON DOMPurify (configuración personalizada):
let dirty = '<div><script>alert("XSS")</script><p class="safe">Hello <a href="javascript:alert(1)">click</a></p></div>';

let clean = DOMPurify.sanitize(dirty, {
  ALLOWED_TAGS: ['p', 'strong', 'em', 'a'],
  ALLOWED_ATTR: ['class', 'href'],
  FORBID_ATTR: ['style'],
  FORBID_TAGS: ['script', 'style'],
  ALLOWED_URI_REGEXP: /^(https?|mailto):/i
});

console.log(clean);
// <p class="safe">Hello <a>click</a></p> 
// (script eliminado, href javascript: bloqueado)

// EN NODE.JS (usando sanitize-html):
const sanitizeHtml = require('sanitize-html');
let cleaned = sanitizeHtml(dirty, {
  allowedTags: sanitizeHtml.defaults.allowedTags.concat(['img'])
});
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 5,
    'tittle_level': 'JavaScript Seguro y Robusto',
    'topic': 'Inmutabilidad y protección de datos',
    'subtopic': 'Uso de Object.freeze()',
    'definition': '''
Object.freeze() es un método poderoso que previene modificaciones a un objeto: no se pueden agregar, eliminar o cambiar propiedades, y no se puede reasignar su prototipo.

Si has trabajado con estados en aplicaciones complejas, sabes lo valioso que es prevenir modificaciones accidentales. Object.freeze() te da esta garantía a nivel de lenguaje.

Al congelar un objeto, cualquier intento de modificación fallará silenciosamente en modo estricto o lanzará un error. Es shallow (superficial) - solo afecta las propiedades directas del objeto, no los objetos anidados. Para inmutabilidad profunda, necesitas recursividad. Es útil para objetos de configuración, constantes, o cualquier dato que no debería cambiar después de la inicialización.
''',
    'code_example': '''
const config = {
  apiUrl: 'https://api.example.com',
  maxRetries: 3,
  timeout: 5000
};

Object.freeze(config);

// Intentos de modificación:
config.apiUrl = 'http://malicious.com'; // Silently fails (o error en strict mode)
config.newProp = 'value'; // No se agrega
delete config.timeout; // No se elimina

// EN MODO ESTRICTO:
'use strict';
config.apiUrl = 'http://changed.com'; // TypeError: Cannot assign to read only property

// CONGELADO PROFUNDO (implementación básica):
function deepFreeze(obj) {
  Object.freeze(obj);
  Object.getOwnPropertyNames(obj).forEach(prop => {
    if (obj[prop] !== null && 
        typeof obj[prop] === 'object' && 
        !Object.isFrozen(obj[prop])) {
      deepFreeze(obj[prop]);
    }
  });
}
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 5,
    'tittle_level': 'JavaScript Seguro y Robusto',
    'topic': 'Inmutabilidad y protección de datos',
    'subtopic': 'Object.seal() y Object.preventExtensions()',
    'definition': '''
JavaScript ofrece varios niveles de protección para objetos: Object.preventExtensions(), Object.seal(), y Object.freeze(), cada uno con restricciones progresivamente más estrictas.

Puede que te preguntes por qué necesitarías opciones menos restrictivas que freeze. En muchos casos, quieres prevenir ciertos tipos de modificaciones pero no otros, según los requisitos de tu diseño.

Object.preventExtensions() solo evita que se agreguen nuevas propiedades. Object.seal() hace esto y además previene que se eliminen propiedades existentes (configura configurable: false en todas las propiedades). Pero ambas permiten modificar valores de propiedades existentes. Estas herramientas son útiles cuando quieres un control granular sobre qué modificaciones permitir en tus objetos, especialmente en código compartido o librerías.
''',
    'code_example': '''
// EJEMPLO CON preventExtensions():
let user = { name: 'Alice', age: 30 };
Object.preventExtensions(user);

user.name = 'Bob'; // OK - modificar existe
user.email = 'alice@example.com'; // Falla (en strict mode lanza error)
delete user.age; // OK - se puede eliminar

// EJEMPLO CON seal():
let sealedUser = { name: 'Alice', age: 30 };
Object.seal(sealedUser);

sealedUser.name = 'Bob'; // OK
sealedUser.email = 'alice@example.com'; // Falla
delete sealedUser.age; // Falla

// COMPARACIÓN:
let obj = { prop: 'value' };

Object.preventExtensions(obj);
// Puedes: modificar prop, eliminar prop
// No puedes: agregar props

Object.seal(obj);
// Puedes: modificar prop
// No puedes: agregar o eliminar props

Object.freeze(obj);
// No puedes: modificar, agregar o eliminar props
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 5,
    'tittle_level': 'JavaScript Seguro y Robusto',
    'topic': 'Inmutabilidad y protección de datos',
    'subtopic': 'Deep vs shallow freeze',
    'definition': '''
La diferencia entre freeze shallow y deep es crucial cuando trabajas con objetos anidados. Object.freeze() solo afecta el nivel superior del objeto, dejando las propiedades anidadas modificables.

Este comportamiento puede sorprender si esperas que freeze haga todo el trabajo por ti. De hecho, es un tradeoff intencional - freeze profundo tiene un costo de rendimiento y no siempre es necesario.

Para objetos complejos con múltiples niveles de anidación, necesitas implementar una solución recursiva o usar librerías como Immutable.js. El freeze profundo es especialmente importante cuando pasas objetos entre componentes o módulos y quieres garantizar que nada en el árbol de objetos pueda modificarse, ya sea accidental o maliciosamente.
''',
    'code_example': '''
// PROBLEMA CON FREEZE SHALLOW:
const company = {
  name: 'TechCorp',
  employees: [
    { name: 'Alice', position: 'Developer' },
    { name: 'Bob', position: 'Designer' }
  ]
};

Object.freeze(company);

company.name = 'NewName'; // Bloqueado (shallow)
company.employees.push({name: 'Charlie'}); // ¡Permitido!
company.employees[0].name = 'Eve'; // ¡También permitido!

// SOLUCIÓN RECURSIVA:
function deepFreeze(obj) {
  // Recuperar nombres de propiedades propias (incluye symbols)
  const propNames = [
    ...Object.getOwnPropertyNames(obj),
    ...Object.getOwnPropertySymbols(obj)
  ];

  // Congelar propiedades antes de congelar el objeto
  propNames.forEach(name => {
    const prop = obj[name];
    if (prop !== null && typeof prop === 'object' && !Object.isFrozen(prop)) {
      deepFreeze(prop);
    }
  });

  return Object.freeze(obj);
}

// USO CON LIBRERÍA (immer):
import { produce } from 'immer';
const nextState = produce(currentState, draft => {
  draft.employees[0].name = 'Alice Smith'; // Seguro, no muta el original
});
'''
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 6,
    'tittle_level': 'Avances en ECMAScript',
    'topic': 'Nuevas formas de control de flujo',
    'subtopic': 'Etiquetas (label)',
    'definition': '''
En ocasiones, al trabajar con bucles anidados, necesitamos una forma de controlar el flujo de ejecución de manera más precisa. Las etiquetas (`label`) en JavaScript nos permiten nombrar bloques de código y luego referirnos a ellos con declaraciones como `break` o `continue`.

¿Te estás preguntando por qué esto importa?

Cuando tienes bucles dentro de bucles, y bajo ciertas condiciones deseas salir de uno específico, las etiquetas te permiten hacerlo directamente. Esto mejora la legibilidad y el control del flujo de tu programa, evitando lógica adicional o el uso de variables auxiliares.
''',
    'code_example': r'''
// Uso de etiquetas para salir de un bucle externo
outerLoop:
for (let i = 0; i < 3; i++) {
  for (let j = 0; j < 3; j++) {
    if (i === 1 && j === 1) {
      break outerLoop; // Sale del bucle externo
    }
    console.log(`i = ${i}, j = ${j}`);
  }
}
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 6,
    'tittle_level': 'Avances en ECMAScript',
    'topic': 'Nuevas formas de control de flujo',
    'subtopic': 'Operador in en condiciones',
    'definition': '''
El operador `in` en JavaScript se utiliza para verificar si una propiedad específica existe en un objeto. Es una forma sencilla y efectiva de comprobar la presencia de claves en objetos o índices en arreglos.

¿Te estás preguntando por qué esto importa?

Cuando trabajas con objetos dinámicos o datos que pueden variar, es crucial verificar la existencia de ciertas propiedades antes de acceder a ellas para evitar errores. El operador `in` te permite hacer esto de manera concisa, mejorando la robustez de tu código.
''',
    'code_example': r'''
const usuario = {
  nombre: 'Ana',
  edad: 25
};

console.log('nombre' in usuario); // true
console.log('direccion' in usuario); // false

const arreglo = [10, 20, 30];
console.log(1 in arreglo); // true (índice 1 existe)
console.log(5 in arreglo); // false (índice 5 no existe)
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 6,
    'tittle_level': 'Avances en ECMAScript',
    'topic': 'Nuevas formas de control de flujo',
    'subtopic': 'do expressions (propuesta)',
    'definition': '''
Las `do expressions` son una propuesta para JavaScript que permitiría ejecutar bloques de código como expresiones, devolviendo un valor. Aunque aún no forman parte del estándar oficial, ofrecen una forma interesante de estructurar el código.

¿Te estás preguntando por qué esto importa?

Actualmente, en JavaScript, las declaraciones como `if`, `for` o `switch` no devuelven valores directamente. Con `do expressions`, podrías utilizar estas estructuras dentro de expresiones, asignando su resultado a variables, lo que podría llevar a un código más expresivo y funcional.
''',
    'code_example': r'''
// Nota: do expressions aún no están soportadas nativamente
// Este es un ejemplo hipotético de cómo se verían

let resultado = do {
  if (condicion) {
    'Sí';
  } else {
    'No';
  }
};

console.log(resultado); // 'Sí' o 'No' dependiendo de la condición
''',
  });
}

Future<void> insertJsSrLevel6Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 6,
    'tittle_level': 'Avances en ECMAScript',
    'topic': 'Nuevas características del lenguaje (ES2020+)',
    'subtopic': 'Optional chaining (?.)',
    'definition': '''
A veces, al acceder a propiedades de objetos anidados, nos enfrentamos a errores si alguna propiedad intermedia no existe. El operador de encadenamiento opcional (`?.`) nos permite acceder a estas propiedades de manera segura, evitando errores si alguna parte del camino es `null` o `undefined`.

¿Te estás preguntando por qué esto importa?

Este operador es especialmente útil cuando trabajamos con datos de fuentes externas o estructuras complejas, donde no siempre podemos garantizar la existencia de todas las propiedades. Con `?.`, podemos escribir código más limpio y seguro, evitando múltiples verificaciones de existencia.
''',
    'code_example': r'''
const usuario = {
  perfil: {
    nombre: 'Ana',
    direccion: {
      ciudad: 'Bogotá'
    }
  }
};

console.log(usuario.perfil?.direccion?.ciudad); // 'Bogotá'
console.log(usuario.perfil?.telefono?.numero); // undefined, sin error
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 6,
    'tittle_level': 'Avances en ECMAScript',
    'topic': 'Nuevas características del lenguaje (ES2020+)',
    'subtopic': 'Nullish coalescing (??)',
    'definition': '''
En JavaScript, a veces necesitamos asignar valores predeterminados cuando una variable es `null` o `undefined`. El operador de fusión nula (`??`) nos permite hacer esto de manera clara y precisa, sin confundir otros valores falsy como `0` o `''`.

¿Te estás preguntando por qué esto importa?

Este operador es útil para evitar asignar valores predeterminados cuando la variable tiene un valor válido pero falsy. Por ejemplo, si una variable es `0`, no queremos reemplazarla con un valor predeterminado. Con `??`, solo se asigna el valor predeterminado si la variable es `null` o `undefined`.
''',
    'code_example': r'''
let cantidad = 0;
let resultado = cantidad ?? 10;
console.log(resultado); // 0, no se reemplaza porque 0 no es null o undefined

let valor;
let resultado2 = valor ?? 5;
console.log(resultado2); // 5, se reemplaza porque valor es undefined
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 6,
    'tittle_level': 'Avances en ECMAScript',
    'topic': 'Nuevas características del lenguaje (ES2020+)',
    'subtopic': 'Operadores lógicos compuestos (&&=, ||=, ??=)',
    'definition': '''
Los operadores lógicos compuestos (`&&=`, `||=`, `??=`) combinan operaciones lógicas con asignaciones, permitiéndonos escribir código más conciso y legible.

¿Te estás preguntando por qué esto importa?

Estos operadores nos permiten actualizar el valor de una variable solo si se cumple cierta condición lógica. Por ejemplo, con `&&=`, la variable se actualiza solo si su valor actual es verdadero. Esto es útil para evitar escribir estructuras condicionales más largas y mantener el código limpio.
''',
    'code_example': r'''
let activo = true;
let nombre = 'Carlos';

activo &&= nombre; // Si activo es true, se asigna nombre
console.log(activo); // 'Carlos'

let usuario = null;
usuario ||= 'Invitado'; // Si usuario es falsy, se asigna 'Invitado'
console.log(usuario); // 'Invitado'

let edad;
edad ??= 18; // Si edad es null o undefined, se asigna 18
console.log(edad); // 18
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 6,
    'tittle_level': 'Avances en ECMAScript',
    'topic': 'Métodos recientes de arrays y objetos',
    'subtopic': 'Object.entries(), Object.values()',
    'definition': '''
Los métodos `Object.entries()` y `Object.values()` nos permiten trabajar con objetos de manera más flexible, convirtiéndolos en estructuras que podemos recorrer fácilmente.

¿Te estás preguntando por qué esto importa?

Con `Object.entries()`, obtenemos un arreglo de pares clave-valor del objeto, lo que facilita iterar sobre ellos. Con `Object.values()`, obtenemos un arreglo con solo los valores del objeto. Estos métodos son útiles para transformar objetos en arreglos y aplicar métodos como `map`, `filter` o `reduce`.
''',
    'code_example': r'''
const persona = {
  nombre: 'Lucía',
  edad: 30,
  ciudad: 'Medellín'
};

console.log(Object.entries(persona));
// [['nombre', 'Lucía'], ['edad', 30], ['ciudad', 'Medellín']]

console.log(Object.values(persona));
// ['Lucía', 30, 'Medellín']
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 6,
    'tittle_level': 'Avances en ECMAScript',
    'topic': 'Métodos recientes de arrays y objetos',
    'subtopic': 'Array.flat() y Array.flatMap()',
    'definition': '''
Los métodos `Array.flat()` y `Array.flatMap()` nos permiten trabajar con arreglos anidados de manera más sencilla, aplanándolos según nuestras necesidades.

¿Te estás preguntando por qué esto importa?

Con `Array.flat()`, podemos aplanar un arreglo de arreglos en un solo nivel, o más, dependiendo del parámetro que le pasemos. Con `Array.flatMap()`, combinamos las operaciones de `map()` y `flat()`, aplicando una función a cada elemento y luego aplanando el resultado en un solo paso.
''',
    'code_example': r'''
const anidado = [1, 2, [3, 4, [5, 6]]];
console.log(anidado.flat(1)); // [1, 2, 3, 4, [5, 6]]
console.log(anidado.flat(2)); // [1, 2, 3, 4, 5, 6]

const frases = ['Hola mundo', 'JavaScript es genial'];
const palabras = frases.flatMap(frase => frase.split(' '));
console.log(palabras); // ['Hola', 'mundo', 'JavaScript', 'es', 'genial']
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 6,
    'tittle_level': 'Avances en ECMAScript',
    'topic': 'Métodos recientes de arrays y objetos',
    'subtopic': 'Array.at()',
    'definition': '''
El método `Array.at()` nos permite acceder a elementos de un arreglo utilizando índices positivos o negativos, ofreciendo una forma más flexible y legible de obtener elementos.

¿Te estás preguntando por qué esto importa?

Con `Array.at()`, podemos acceder fácilmente al último elemento de un arreglo usando un índice negativo, sin necesidad de calcular la longitud del arreglo. Esto mejora la legibilidad del código y reduce posibles errores al trabajar con índices.
''',
    'code_example': r'''
const numeros = [10, 20, 30, 40, 50];

console.log(numeros.at(0)); // 10
console.log(numeros.at(-1)); // 50, último elemento
console.log(numeros.at(-2)); // 40, penúltimo elemento
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 6,
    'tittle_level': 'Avances en ECMAScript',
    'topic': 'Nuevas formas de control de flujo',
    'subtopic': 'Etiquetas (label)',
    'definition': '''
A veces, en estructuras de control complejas, especialmente con bucles anidados, necesitamos una forma de romper o continuar desde un nivel específico. Las etiquetas (`label`) en JavaScript nos permiten nombrar bloques de código y luego referirnos a ellos con declaraciones como `break` o `continue`.

¿Te estás preguntando por qué esto importa?

Imagina que tienes un bucle dentro de otro y, bajo ciertas condiciones, deseas salir del bucle externo desde el interno. Sin etiquetas, esto requeriría lógica adicional o banderas. Con etiquetas, puedes hacer esto de manera directa y clara, mejorando la legibilidad y control del flujo de tu programa.
''',
    'code_example': r'''
// Uso de etiquetas para salir de un bucle externo
outerLoop:
for (let i = 0; i < 3; i++) {
  for (let j = 0; j < 3; j++) {
    if (i === 1 && j === 1) {
      break outerLoop; // Sale del bucle externo
    }
    console.log(`i = ${i}, j = ${j}`);
  }
}
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 6,
    'tittle_level': 'Avances en ECMAScript',
    'topic': 'Nuevas formas de control de flujo',
    'subtopic': 'Operador in en condiciones',
    'definition': '''
El operador `in` en JavaScript se utiliza para verificar si una propiedad específica existe en un objeto. Es una forma sencilla y efectiva de comprobar la presencia de claves en objetos o índices en arreglos.

¿Te estás preguntando por qué esto importa?

Cuando trabajas con objetos dinámicos o datos que pueden variar, es crucial verificar la existencia de ciertas propiedades antes de acceder a ellas para evitar errores. El operador `in` te permite hacer esto de manera concisa, mejorando la robustez de tu código.
''',
    'code_example': r'''
const usuario = {
  nombre: 'Ana',
  edad: 25
};

console.log('nombre' in usuario); // true
console.log('direccion' in usuario); // false

const arreglo = [10, 20, 30];
console.log(1 in arreglo); // true (índice 1 existe)
console.log(5 in arreglo); // false (índice 5 no existe)
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 6,
    'tittle_level': 'Avances en ECMAScript',
    'topic': 'Nuevas formas de control de flujo',
    'subtopic': 'do expressions (propuesta)',
    'definition': '''
Las `do expressions` son una propuesta para JavaScript que permitiría ejecutar bloques de código como expresiones, devolviendo un valor. Aunque aún no forman parte del estándar oficial, ofrecen una forma interesante de estructurar el código.

¿Te estás preguntando por qué esto importa?

Actualmente, en JavaScript, las declaraciones como `if`, `for` o `switch` no devuelven valores directamente. Con `do expressions`, podrías utilizar estas estructuras dentro de expresiones, asignando su resultado a variables, lo que podría llevar a un código más expresivo y funcional.
''',
    'code_example': r'''
// Nota: do expressions aún no están soportadas nativamente
// Este es un ejemplo hipotético de cómo se verían

let resultado = do {
  if (condicion) {
    'Sí';
  } else {
    'No';
  }
};

console.log(resultado); // 'Sí' o 'No' dependiendo de la condición
''',
  });
}

Future<void> insertJsSrLevel7Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 7,
    'tittle_level': 'Programación Funcional en JavaScript',
    'topic': 'Principios funcionales',
    'subtopic': 'Funciones puras',
    'definition': '''
Una función pura es aquella que, dado el mismo conjunto de argumentos, siempre devuelve el mismo resultado y no produce efectos secundarios observables. Esto significa que no depende ni modifica el estado externo a la función.

¿Te estás preguntando por qué esto importa?

Las funciones puras son fundamentales en la programación funcional porque garantizan predictibilidad y facilidad de prueba. Al no depender de factores externos, su comportamiento es consistente, lo que facilita el razonamiento sobre el código y su depuración.
''',
    'code_example': r'''
// Función pura
function suma(a, b) {
  return a + b;
}

console.log(suma(2, 3)); // 5
console.log(suma(2, 3)); // 5

// Función impura
let contador = 0;
function incrementar() {
  contador++;
  return contador;
}

console.log(incrementar()); // 1
console.log(incrementar()); // 2
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 7,
    'tittle_level': 'Programación Funcional en JavaScript',
    'topic': 'Principios funcionales',
    'subtopic': 'Inmutabilidad',
    'definition': '''
La inmutabilidad es el principio de no modificar los datos originales. En lugar de alterar un objeto o arreglo existente, se crea una nueva copia con las modificaciones necesarias.

¿Te estás preguntando por qué esto importa?

Mantener los datos inmutables evita efectos secundarios inesperados y facilita el seguimiento del flujo de datos en una aplicación. Esto es especialmente útil en entornos asincrónicos o cuando múltiples funciones pueden interactuar con los mismos datos.
''',
    'code_example': r'''
// Objeto mutable
const usuario = { nombre: 'Ana', edad: 25 };
usuario.edad = 26; // Modifica el objeto original

// Objeto inmutable
const usuario = { nombre: 'Ana', edad: 25 };
const nuevoUsuario = { ...usuario, edad: 26 }; // Crea una nueva copia

console.log(usuario); // { nombre: 'Ana', edad: 25 }
console.log(nuevoUsuario); // { nombre: 'Ana', edad: 26 }
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 7,
    'tittle_level': 'Programación Funcional en JavaScript',
    'topic': 'Principios funcionales',
    'subtopic': 'Transparencia referencial',
    'definition': '''
La transparencia referencial es una propiedad que permite reemplazar una expresión por su valor sin alterar el comportamiento del programa. Esto es posible cuando una función es pura y no tiene efectos secundarios.

¿Te estás preguntando por qué esto importa?

La transparencia referencial facilita el razonamiento sobre el código, permite optimizaciones como la memoización y mejora la mantenibilidad del software al garantizar que las funciones se comporten de manera predecible.
''',
    'code_example': r'''
// Función con transparencia referencial
function cuadrado(n) {
  return n * n;
}

const resultado = cuadrado(4); // 16
// Podemos reemplazar cuadrado(4) por 16 en cualquier parte del código sin afectar su comportamiento

// Función sin transparencia referencial
let factor = 2;
function multiplicar(n) {
  return n * factor;
}

const resultado1 = multiplicar(4); // 8
factor = 3;
const resultado2 = multiplicar(4); // 12
// El resultado cambia según el valor externo 'factor', por lo que no es transparente referencialmente
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 7,
    'tittle_level': 'Programación Funcional en JavaScript',
    'topic': 'Métodos funcionales comunes',
    'subtopic': 'map, filter, reduce, some, every',
    'definition': '''
Los métodos `map`, `filter`, `reduce`, `some` y `every` son funciones de orden superior disponibles en los arreglos de JavaScript. Permiten procesar y transformar datos de manera declarativa y funcional.

¿Te estás preguntando por qué esto importa?

Estos métodos facilitan operaciones comunes sobre arreglos, como transformar elementos (`map`), filtrar según condiciones (`filter`), acumular valores (`reduce`), verificar si al menos un elemento cumple una condición (`some`) o si todos la cumplen (`every`). Su uso promueve un código más limpio y expresivo.
''',
    'code_example': r'''
const numeros = [1, 2, 3, 4, 5];

// map: eleva cada número al cuadrado
const cuadrados = numeros.map(n => n * n);
console.log(cuadrados); // [1, 4, 9, 16, 25]

// filter: selecciona números pares
const pares = numeros.filter(n => n % 2 === 0);
console.log(pares); // [2, 4]

// reduce: suma todos los números
const suma = numeros.reduce((acc, n) => acc + n, 0);
console.log(suma); // 15

// some: verifica si hay algún número mayor que 4
const hayMayorQueCuatro = numeros.some(n => n > 4);
console.log(hayMayorQueCuatro); // true

// every: verifica si todos los números son positivos
const todosPositivos = numeros.every(n => n > 0);
console.log(todosPositivos); // true
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 7,
    'tittle_level': 'Programación Funcional en JavaScript',
    'topic': 'Métodos funcionales comunes',
    'subtopic': 'Composición de funciones',
    'definition': '''
La composición de funciones es una técnica que consiste en combinar dos o más funciones para producir una nueva función. El resultado de una función se pasa como argumento a la siguiente.

¿Te estás preguntando por qué esto importa?

Componer funciones permite construir operaciones complejas a partir de funciones simples y reutilizables. Esto mejora la modularidad y legibilidad del código, facilitando su mantenimiento y prueba.
''',
    'code_example': r'''
// Definición de funciones simples
const duplicar = x => x * 2;
const incrementar = x => x + 1;

// Composición de funciones: primero duplica, luego incrementa
const duplicarEIncrementar = x => incrementar(duplicar(x));

console.log(duplicarEIncrementar(3)); // 7

// Utilizando una función de composición genérica
const compose = (f, g) => x => f(g(x));
const duplicarEIncrementar2 = compose(incrementar, duplicar);

console.log(duplicarEIncrementar2(3)); // 7
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 7,
    'tittle_level': 'Programación Funcional en JavaScript',
    'topic': 'Métodos funcionales comunes',
    'subtopic': 'Currying y partial application',
    'definition': '''
El currying es una técnica que transforma una función con múltiples argumentos en una secuencia de funciones unarias (que toman un solo argumento). La aplicación parcial consiste en fijar algunos argumentos de una función, produciendo una nueva función con menor aridad.

¿Te estás preguntando por qué esto importa?

Estas técnicas permiten crear funciones más específicas y reutilizables, facilitando la composición y mejorando la claridad del código. Son fundamentales en la programación funcional para construir abstracciones más expresivas.
''',
    'code_example': r'''
// Currying: función que suma tres números
function suma(a) {
  return function(b) {
    return function(c) {
      return a + b + c;
    };
  };
}

console.log(suma(1)(2)(3)); // 6

// Aplicación parcial: función que suma dos números
function sumar(a, b) {
  return a + b;
}

// Fijar el primer argumento usando bind
const sumarCinco = sumar.bind(null, 5);
console.log(sumarCinco(10)); // 15
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 7,
    'tittle_level': 'Programación Funcional en JavaScript',
    'topic': 'Funciones de orden superior',
    'subtopic': 'Qué son y cómo se usan',
    'definition': '''
Una función de orden superior es aquella que puede recibir otras funciones como argumentos, devolver una función como resultado o ambas cosas. Este concepto es fundamental en la programación funcional y permite crear código más modular y reutilizable.

¿Te estás preguntando por qué esto importa?

Las funciones de orden superior permiten abstraer operaciones comunes, facilitando la creación de funciones más generales y composables. Esto mejora la legibilidad y mantenibilidad del código, especialmente en aplicaciones complejas.
''',
    'code_example': r'''
// Función que recibe otra función como argumento
function aplicarOperacion(a, b, operacion) {
  return operacion(a, b);
}

function suma(x, y) {
  return x + y;
}

console.log(aplicarOperacion(5, 3, suma)); // 8

// Función que devuelve otra función
function crearMultiplicador(factor) {
  return function(numero) {
    return numero * factor;
  };
}

const duplicar = crearMultiplicador(2);
console.log(duplicar(4)); // 8
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 7,
    'tittle_level': 'Programación Funcional en JavaScript',
    'topic': 'Funciones de orden superior',
    'subtopic': 'Uso con callbacks y APIs',
    'definition': '''
Las funciones de orden superior son ampliamente utilizadas en JavaScript, especialmente en el manejo de callbacks y en la interacción con APIs. Permiten definir comportamientos personalizados que se ejecutan en respuesta a eventos o al completar operaciones asincrónicas.

¿Te estás preguntando por qué esto importa?

El uso de funciones de orden superior con callbacks permite manejar operaciones asincrónicas de manera eficiente, como la lectura de archivos, solicitudes HTTP o eventos del usuario, mejorando la capacidad de respuesta y la experiencia del usuario.
''',
    'code_example': r'''
// Uso de una función de orden superior con un callback
function procesarUsuario(nombre, callback) {
  console.log(`Procesando usuario ${nombre}`);
  callback(nombre);
}

function saludar(nombre) {
  console.log(`Hola, ${nombre}`);
}

procesarUsuario('Ana', saludar);

// Uso con una API: setTimeout
setTimeout(function() {
  console.log('Esto se ejecuta después de 2 segundos');
}, 2000);
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 7,
    'tittle_level': 'Programación Funcional en JavaScript',
    'topic': 'Funciones de orden superior',
    'subtopic': 'Composición dinámica de comportamiento',
    'definition': '''
La composición dinámica de comportamiento consiste en combinar funciones simples para crear funciones más complejas de manera flexible y reutilizable. Esto se logra mediante funciones de orden superior que permiten componer comportamientos en tiempo de ejecución.

¿Te estás preguntando por qué esto importa?

Esta técnica permite construir funcionalidades complejas a partir de piezas más pequeñas y manejables, facilitando la extensión y modificación del comportamiento del programa sin alterar el código existente.
''',
    'code_example': r'''
// Funciones simples
function enMayusculas(str) {
  return str.toUpperCase();
}

function agregarSignoExclamacion(str) {
  return str + '!';
}

// Función de orden superior para componer funciones
function componer(...funciones) {
  return function(valor) {
    return funciones.reduce((acumulado, fn) => fn(acumulado), valor);
  };
}

const enfatizar = componer(enMayusculas, agregarSignoExclamacion);
console.log(enfatizar('hola')); // 'HOLA!'
''',
  });
}

Future<void> insertJsSrLevel8Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 8,
    'tittle_level': 'Internacionalización y Localización',
    'topic': 'API Intl',
    'subtopic': 'Intl.NumberFormat',
    'definition': '''
La clase `Intl.NumberFormat` permite formatear números según las convenciones de diferentes locales, incluyendo estilos como moneda, porcentaje y notación compacta.

¿Te estás preguntando por qué esto importa?

Al desarrollar aplicaciones para una audiencia global, es esencial presentar números en formatos que los usuarios reconozcan y comprendan fácilmente. `Intl.NumberFormat` facilita esta tarea al manejar automáticamente las diferencias en formatos numéricos entre regiones.
''',
    'code_example': r'''
// Formatear número como moneda en Colombia
const numero = 1234567.89;
const formatoCOP = new Intl.NumberFormat('es-CO', {
  style: 'currency',
  currency: 'COP'
});
console.log(formatoCOP.format(numero)); // "$1.234.567,89"

// Formatear número como porcentaje
const porcentaje = 0.75;
const formatoPorcentaje = new Intl.NumberFormat('en-US', {
  style: 'percent'
});
console.log(formatoPorcentaje.format(porcentaje)); // "75%"
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 8,
    'tittle_level': 'Internacionalización y Localización',
    'topic': 'API Intl',
    'subtopic': 'Intl.DateTimeFormat',
    'definition': '''
La clase `Intl.DateTimeFormat` permite formatear fechas y horas según las convenciones de diferentes locales, adaptándose a formatos regionales y preferencias culturales.

¿Te estás preguntando por qué esto importa?

Mostrar fechas y horas en un formato familiar para el usuario mejora la experiencia y evita confusiones. `Intl.DateTimeFormat` automatiza este proceso, asegurando que la información temporal se presente de manera coherente y localizada.
''',
    'code_example': r'''
// Fecha actual
const fecha = new Date();

// Formatear fecha en formato largo en español de Colombia
const formatoFecha = new Intl.DateTimeFormat('es-CO', {
  dateStyle: 'full',
  timeStyle: 'long'
});
console.log(formatoFecha.format(fecha));
// Ejemplo de salida: "miércoles, 21 de mayo de 2025, 08:48:13 GMT-5"
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 8,
    'tittle_level': 'Internacionalización y Localización',
    'topic': 'API Intl',
    'subtopic': 'Intl.Collator',
    'definition': '''
La clase `Intl.Collator` proporciona funciones de comparación de cadenas que respetan las reglas de ordenación específicas de cada locale, permitiendo ordenar textos de manera culturalmente adecuada.

¿Te estás preguntando por qué esto importa?

El ordenamiento de textos puede variar entre culturas. Por ejemplo, en algunos idiomas, ciertos caracteres tienen un orden específico que difiere del orden lexicográfico estándar. `Intl.Collator` asegura que las comparaciones y ordenamientos de cadenas sean precisos y culturalmente relevantes.
''',
    'code_example': r'''
const palabras = ['zanahoria', 'árbol', 'zapato', 'ábaco'];

// Ordenar palabras según las reglas del español
const collator = new Intl.Collator('es-ES');
const ordenadas = palabras.sort(collator.compare);
console.log(ordenadas); // ["ábaco", "árbol", "zanahoria", "zapato"]
''',
  });
  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 8,
    'tittle_level': 'Internacionalización y Localización',
    'topic': 'Soporte de diferentes idiomas',
    'subtopic': 'Adaptación de formatos de fecha y moneda',
    'definition': '''
La adaptación de formatos de fecha y moneda es esencial para ofrecer una experiencia de usuario coherente y localizada. JavaScript proporciona la API `Intl` que permite formatear fechas y números según las convenciones de diferentes regiones.

¿Te estás preguntando por qué esto importa?

Mostrar fechas y monedas en un formato familiar para el usuario mejora la comprensión y la confianza en la aplicación. Utilizar la API `Intl` asegura que los datos se presenten de manera adecuada para cada audiencia.
''',
    'code_example': r'''
// Formatear fecha en formato largo en español de Colombia
const fecha = new Date();
const formatoFecha = new Intl.DateTimeFormat('es-CO', {
  dateStyle: 'full',
  timeStyle: 'long'
});
console.log(formatoFecha.format(fecha));
// Ejemplo de salida: "miércoles, 21 de mayo de 2025, 08:48:13 GMT-5"

// Formatear número como moneda en Colombia
const numero = 1234567.89;
const formatoMoneda = new Intl.NumberFormat('es-CO', {
  style: 'currency',
  currency: 'COP'
});
console.log(formatoMoneda.format(numero)); // "$1.234.567,89"
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 8,
    'tittle_level': 'Internacionalización y Localización',
    'topic': 'Soporte de diferentes idiomas',
    'subtopic': 'Estrategias de localización',
    'definition': '''
Las estrategias de localización implican adaptar una aplicación para diferentes idiomas y culturas. Esto incluye traducir textos, adaptar formatos de fecha y moneda, y considerar diferencias culturales en el diseño y funcionalidad.

¿Te estás preguntando por qué esto importa?

Una aplicación localizada correctamente puede alcanzar una audiencia más amplia y ofrecer una experiencia de usuario más personalizada y efectiva, aumentando la satisfacción y la retención de usuarios.
''',
    'code_example': r'''
// Ejemplo de objeto de traducciones
const traducciones = {
  'es': {
    saludo: 'Hola',
    despedida: 'Adiós'
  },
  'en': {
    saludo: 'Hello',
    despedida: 'Goodbye'
  }
};

// Función para obtener la traducción según el idioma
function traducir(idioma, clave) {
  return traducciones[idioma][clave] || clave;
}

console.log(traducir('es', 'saludo')); // "Hola"
console.log(traducir('en', 'despedida')); // "Goodbye"
''',
  });

  await db.insert('programming_content', {
    'language': 'JavaScript',
    'module': 'Sr',
    'level': 8,
    'tittle_level': 'Internacionalización y Localización',
    'topic': 'Soporte de diferentes idiomas',
    'subtopic': 'Detección del idioma del navegador',
    'definition': '''
Detectar el idioma del navegador permite adaptar automáticamente el contenido de la aplicación al idioma preferido del usuario. JavaScript proporciona propiedades como `navigator.language` y `navigator.languages` para obtener esta información.

¿Te estás preguntando por qué esto importa?

Al detectar el idioma del navegador, puedes ofrecer una experiencia más personalizada desde el primer contacto, mejorando la accesibilidad y la satisfacción del usuario.
''',
    'code_example': r'''
// Obtener el idioma preferido del navegador
const idioma = navigator.language || navigator.userLanguage;
console.log(idioma); // Ejemplo de salida: "es-CO"

// Obtener la lista de idiomas preferidos
const idiomas = navigator.languages;
console.log(idiomas); // Ejemplo de salida: ["es-CO", "en-US", "fr-FR"]
''',
  });
}
