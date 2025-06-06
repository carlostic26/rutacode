import 'package:sqflite_common/sqlite_api.dart';

Future<void> insertAngularJrLevel1Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción y Configuración',
    'topic': 'Configuración del Entorno',
    'subtopic': 'Instalación de Node.js y npm',
    'definition': r'''
Para empezar a trabajar con Angular, lo primero que necesitamos es tener Node.js y npm instalados en nuestro equipo. Son como los cimientos sobre los que construiremos nuestras aplicaciones.

Aquí te va la aclaración: Node.js es un entorno de ejecución de JavaScript que nos permite usar JavaScript fuera del navegador, mientras que npm (Node Package Manager) es el gestor de paquetes de Node.js. Pensemos por un momento en npm como una enorme biblioteca donde puedes encontrar y descargar un montón de herramientas y paquetes de código que otros desarrolladores han creado y compartido. Angular, y muchas de sus dependencias, se distribuyen como paquetes npm. Sin ellos, simplemente no podríamos instalar Angular CLI ni el resto de las librerías que hacen funcionar una aplicación Angular. Así que, antes de nada, asegúrate de tener estas dos piezas clave en su lugar.

La instalación es bastante sencilla. Solo tienes que ir a la página oficial de Node.js, descargar el instalador que corresponda a tu sistema operativo (Windows, macOS, Linux) y seguir los pasos. El instalador de Node.js ya incluye npm, así que una vez que termines, tendrás ambos listos para usar. Es una de esas cosas que haces una vez y luego te olvidas, pero es absolutamente fundamental para cualquier desarrollo moderno con JavaScript, y por supuesto, con Angular.
''',
    'code_example': r'''
// Para verificar si Node.js está instalado, abre tu terminal y escribe:
node -v
// Deberías ver algo como: v20.10.0 (la versión puede variar)

// Para verificar si npm está instalado:
npm -v
// Deberías ver algo como: 10.2.3 (la versión puede variar)

// Si necesitas actualizar npm a la última versión (recomendado):
npm install -g npm@latest

// Ejemplo de un error común si Node.js o npm no están instalados
// Si intentas ejecutar un comando npm sin tenerlo instalado, verás un error como:
// 'npm' no se reconoce como un comando interno o externo,
// programa operable o archivo por lotes.
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción y Configuración',
    'topic': 'Configuración del Entorno',
    'subtopic': 'Uso de Angular CLI para iniciar proyectos',
    'definition': r'''
Una vez que tenemos Node.js y npm listos, el siguiente paso mágico es el Angular CLI (Command Line Interface). Esta es la herramienta que te va a ahorrar un montón de tiempo y esfuerzo al momento de crear, desarrollar y gestionar tus proyectos de Angular.

Seguramente pensarás de qué va todo esto... 

Pues, el Angular CLI es una interfaz de línea de comandos que simplifica enormemente el desarrollo de aplicaciones Angular. En lugar de tener que configurar manualmente un proyecto desde cero, lo cual puede ser un dolor de cabeza con todas las dependencias y configuraciones necesarias, el CLI lo hace por ti con un simple comando. Esto es super útil porque te permite centrarte en escribir el código de tu aplicación en lugar de preocuparte por la configuración inicial. Puedes crear nuevos proyectos, generar componentes, servicios, módulos y muchas otras cosas, todo desde la terminal.

Digamos que quieres empezar un nuevo proyecto: solo tienes que abrir tu terminal y escribir `ng new nombre-de-tu-proyecto`. El CLI se encarga de descargar todas las dependencias, configurar el proyecto con las mejores prácticas y dejarlo listo para que empieces a codificar. También te ayuda a ejecutar tu aplicación, compilarla para producción e incluso a realizar pruebas. Es como tener un asistente personal que se encarga de todas las tareas repetitivas y complejas del desarrollo de Angular.
''',
    'code_example': r'''
// Primero, instala Angular CLI globalmente en tu sistema:
npm install -g @angular/cli

// Luego, para crear un nuevo proyecto de Angular (reemplaza 'mi-primer-app' con el nombre que quieras):
ng new mi-primer-app
// El CLI te hará algunas preguntas, como si quieres añadir enrutamiento de Angular y qué formato de hoja de estilo quieres usar (CSS, SCSS, etc.).

// Navega al directorio de tu nuevo proyecto:
cd mi-primer-app

// Y para iniciar el servidor de desarrollo y ver tu aplicación en el navegador:
ng serve --open
// Esto abrirá tu aplicación en el navegador en http://localhost:4200/

/*
Ejemplo de un comando incorrecto (sin el 'ng' prefijo)
Si olvidas el 'ng' al inicio, la terminal no reconocerá el comando:
new mi-primer-app
// Esto resultará en un error como: 'new' no se reconoce como un comando interno o externo.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción y Configuración',
    'topic': 'Configuración del Entorno',
    'subtopic': 'Estructura básica de un proyecto Angular',
    'definition': r'''
Cuando creas un proyecto con Angular CLI, te encontrarás con una estructura de carpetas y archivos bastante organizada. Al principio, puede parecer un poco abrumador, pero en realidad está diseñada para que el desarrollo sea más eficiente y escalable.

No sé tú, pero a mí esto al principio me costó. 

Sin embargo, una vez que entiendes la lógica, todo cobra sentido. La carpeta principal donde pasarás la mayor parte de tu tiempo es `src/app`. Aquí es donde reside el código fuente de tu aplicación. Dentro de `src/app`, encontrarás tus componentes, módulos, servicios y todo lo que conforma tu lógica de negocio y la interfaz de usuario. Verás que cada componente suele tener su propio archivo TypeScript (`.ts`), su plantilla HTML (`.html`) y su archivo de estilos (`.css`, `.scss`, etc.).

Otros archivos importantes incluyen `angular.json`, que es el archivo de configuración del proyecto para el CLI; `package.json`, que lista todas las dependencias del proyecto y los scripts npm; y `tsconfig.json`, que configura el compilador de TypeScript. Entender esta estructura es clave porque te permite saber dónde poner cada pieza de tu código y cómo interactúa todo. Por ejemplo, si necesitas crear un nuevo componente, el CLI lo creará en la ubicación correcta y lo registrará en el módulo adecuado. Es una convención que facilita el trabajo en equipo y el mantenimiento del proyecto a largo plazo.
''',
    'code_example': r'''
// Estructura de directorios típica de un proyecto Angular:

// mi-proyecto/
// ├── e2e/                     // Pruebas end-to-end
// ├── node_modules/            // Dependencias de npm
// ├── src/                     // Código fuente de tu aplicación
// │   ├── app/                 // Componentes, módulos, servicios de tu app
// │   │   ├── app.component.css
// │   │   ├── app.component.html
// │   │   ├── app.component.ts
// │   │   └── app.module.ts    // Módulo principal de la aplicación
// │   ├── assets/              // Imágenes, iconos, etc.
// │   ├── environments/        // Configuraciones para diferentes entornos (desarrollo, producción)
// │   ├── favicon.ico
// │   ├── index.html           // Página principal de la aplicación
// │   ├── main.ts              // Punto de entrada de la aplicación
// │   ├── polyfills.ts         // Scripts para compatibilidad con navegadores antiguos
// │   └── styles.css           // Estilos globales de la aplicación
// ├── .angular/                // Archivos de caché generados por Angular CLI
// ├── .gitignore
// ├── angular.json             // Archivo de configuración del Angular CLI
// ├── karma.conf.js            // Configuración para pruebas unitarias con Karma
// ├── package.json             // Dependencias y scripts de npm
// ├── tsconfig.app.json        // Configuración de TypeScript para la aplicación
// ├── tsconfig.json            // Configuración global de TypeScript
// ├── tsconfig.spec.json       // Configuración de TypeScript para pruebas
// └── README.md                // Información del proyecto

/*
Comúnmente, las personas nuevas en Angular pueden confundir dónde poner el código.
Por ejemplo, poner un nuevo componente directamente en 'src/' en lugar de 'src/app/'.
Aunque técnicamente podría funcionar con configuraciones manuales, rompe la convención y la facilidad de uso del CLI.
Siempre usa 'ng generate component nombre-del-componente' para que el CLI lo coloque y configure correctamente.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción y Configuración',
    'topic': 'TypeScript en Angular',
    'subtopic': 'Tipado estático y anotaciones de tipo',
    'definition': r'''
Angular ama TypeScript, y no es para menos. TypeScript es un "superconjunto" de JavaScript, lo que significa que añade características adicionales a JavaScript, y una de las más importantes es el tipado estático y las anotaciones de tipo. Esto puede sonar un poco técnico, pero créeme, es una característica que te salvará de muchos dolores de cabeza.

¿Te preguntas por qué esto importa?

Aquí te va la explicación: El tipado estático básicamente significa que puedes declarar el tipo de datos que esperas para tus variables, parámetros de funciones y retornos de funciones (números, cadenas de texto, booleanos, etc.) antes de que tu código se ejecute. Esto lo haces con las "anotaciones de tipo". Por ejemplo, si declaras una variable `nombre: string`, TypeScript sabrá que `nombre` siempre debe ser una cadena de texto. Si intentas asignarle un número, el editor de código o el compilador te avisará inmediatamente. Esto es genial porque atrapa errores comunes durante el desarrollo, antes de que tu aplicación llegue a manos de los usuarios. Pensemos por un momento en un escenario donde trabajas en un equipo grande: si cada uno de ustedes sabe el tipo de dato que espera una función o una variable, la comunicación y la integración de su código es mucho más fluida y con menos errores. JavaScript, por su parte, es de tipado dinámico, lo que significa que no sabes el tipo de una variable hasta que el código se ejecuta, y es ahí donde aparecen los famosos `undefined` o errores en tiempo de ejecución que son más difíciles de rastrear. Con TypeScript, tienes una capa extra de seguridad y claridad en tu código, lo que facilita mucho la depuración y el mantenimiento de proyectos grandes.
''',
    'code_example': r'''
// Ejemplo de tipado estático en TypeScript:

// Declaración de una variable con un tipo específico
let nombre: string = "Juan";
let edad: number = 30;
let esActivo: boolean = true;

// ERROR: Intentar asignar un tipo incorrecto
// nombre = 123; // Esto generaría un error en tiempo de compilación: Type 'number' is not assignable to type 'string'.

// Funciones con anotaciones de tipo en parámetros y valor de retorno
function saludar(nombre: string): string {
  return "Hola, " + nombre;
}

// ERROR: Pasar un tipo incorrecto a una función
// saludar(123); // Esto generaría un error: Argument of type 'number' is not assignable to parameter of type 'string'.

// Tipado implícito vs. explícito
// Tipado explícito (recomendado para mayor claridad)
let precio: number = 100;

// Tipado implícito (TypeScript infiere el tipo, pero es menos claro)
let cantidad = 50; // TypeScript infiere que 'cantidad' es de tipo number

/*
Un error común es pensar que el tipado de TypeScript se mantiene en el navegador.
Cuando tu código TypeScript se compila a JavaScript, todas las anotaciones de tipo se eliminan.
TypeScript solo ayuda en la fase de desarrollo para atrapar errores y mejorar la legibilidad del código.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción y Configuración',
    'topic': 'TypeScript en Angular',
    'subtopic': 'Interfaces y clases',
    'definition': r'''
Cuando hablamos de organizar nuestro código en TypeScript, especialmente en Angular, las interfaces y las clases son dos conceptos fundamentales. Nos permiten estructurar nuestros datos y comportamientos de una manera mucho más limpia y predecible.

Vamos a ver de que se trata todo esto... 

Piensa en las interfaces como contratos o planos. Una interfaz define la forma que debe tener un objeto: qué propiedades debe tener y de qué tipo, y qué métodos debe implementar. No contiene ninguna lógica de implementación, solo la "firma". Esto es increíblemente útil para asegurar que diferentes partes de tu código (o diferentes desarrolladores) manejen los mismos tipos de datos de forma consistente. Por ejemplo, si tienes una interfaz `Usuario` con propiedades `id`, `nombre` y `email`, cualquier objeto que se declare como `Usuario` debe tener esas propiedades y con esos tipos. Las clases, por otro lado, son los "moldes" reales para crear objetos. Una clase puede tener propiedades (datos) y métodos (comportamientos), y a partir de ella, puedes crear múltiples instancias (objetos) que comparten esa misma estructura y lógica. En Angular, usamos clases para definir componentes, servicios y otros elementos clave de nuestra aplicación. Por ejemplo, un `Componente` es una clase que tiene propiedades para sus datos y métodos para manejar eventos o lógica. Las interfaces y clases trabajan muy bien juntas: una clase puede "implementar" una interfaz, lo que significa que se compromete a cumplir el contrato definido por la interfaz. Esto refuerza el tipado estático y la consistencia en tu aplicación, haciendo que tu código sea más robusto y fácil de mantener.
''',
    'code_example': r'''
// Ejemplo de Interfaces en TypeScript:

// Definición de una interfaz
interface Producto {
  id: number;
  nombre: string;
  precio: number;
  stock?: number; // La propiedad 'stock' es opcional
}

// Implementación de la interfaz en un objeto
const miProducto: Producto = {
  id: 1,
  nombre: "Laptop",
  precio: 1200,
  stock: 50
};

// Otro objeto que cumple la interfaz (sin la propiedad opcional)
const otroProducto: Producto = {
  id: 2,
  nombre: "Teclado",
  precio: 75
};

// Ejemplo de Clases en TypeScript:

// Definición de una clase
class Coche {
  marca: string;
  modelo: string;
  año: number;

  constructor(marca: string, modelo: string, año: number) {
    this.marca = marca;
    this.modelo = modelo;
    this.año = año;
  }

  obtenerDescripcion(): string {
    return `${this.marca} ${this.modelo} (${this.año})`;
  }
}

// Creación de una instancia de la clase
const miCoche = new Coche("Toyota", "Corolla", 2023);
console.log(miCoche.obtenerDescripcion()); // Salida: Toyota Corolla (2023)

// Una clase puede implementar una interfaz
class Libro implements Producto {
  id: number;
  nombre: string;
  precio: number;
  autor: string; // Propiedad adicional

  constructor(id: number, nombre: string, precio: number, autor: string) {
    this.id = id;
    this.nombre = nombre;
    this.precio = precio;
    this.autor = autor;
  }
}

/*
Un error común es intentar crear una instancia de una interfaz directamente.
Las interfaces solo son contratos de tipos, no pueden ser instanciadas.

// ERROR:
// const miError: Producto = new Producto();
// Esto generaría un error: 'Producto' only refers to a type, but is being used as a value here.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción y Configuración',
    'topic': 'TypeScript en Angular',
    'subtopic': 'Decoradores y su uso en Angular',
    'definition': r'''
Los decoradores son una característica súper interesante de TypeScript que se usa muchísimo en Angular. Imagina que son como etiquetas o funciones especiales que puedes adjuntar a clases, propiedades, métodos o parámetros. Estas etiquetas tienen un propósito: modificar o añadir metadatos a la declaración a la que están adjuntas.

¿Te estás preguntando por qué los necesitamos?

Bueno, en el contexto de Angular, los decoradores son la columna vertebral de cómo la magia ocurre. Por ejemplo, cuando defines un componente en Angular, usas el decorador `@Component`. Este decorador no solo le dice a Angular que esta clase es un componente, sino que también le permite configurar cosas como su selector HTML (cómo lo usarás en tus plantillas), su plantilla (`templateUrl` o `template`) y sus estilos (`styleUrls`). Sin este decorador, Angular simplemente vería tu clase como una clase de TypeScript normal y no sabría qué hacer con ella. Otros decoradores comunes incluyen `@Input()` y `@Output()` para la comunicación entre componentes, `@Injectable()` para servicios (que permite la inyección de dependencias) y `@NgModule()` para módulos. Básicamente, los decoradores son la forma en que le damos instrucciones a Angular sobre cómo debe tratar nuestras clases y miembros de clase. Son la clave para que Angular pueda entender la estructura de tu aplicación y cómo deben interactuar sus diferentes partes. Gracias a ellos, podemos escribir código más declarativo y limpio, dejando que Angular se encargue de la configuración y la lógica interna basándose en esas "etiquetas" que le proporcionamos.
''',
    'code_example': r'''
// Ejemplo de decoradores en Angular con TypeScript:

// Importamos el decorador Component de Angular core
import { Component, Input, Output, EventEmitter } from '@angular/core';

// Decorador @Component: Define una clase como un componente de Angular.
// Aquí le pasamos un objeto de configuración con metadatos.
@Component({
  selector: 'app-saludador', // El nombre que usaremos en el HTML para este componente
  template: `
    <p>Hola, {{ nombre }}!</p>
    <button (click)="emitirSaludo()">Saludar</button>
  `, // Plantilla HTML del componente
  styles: [`p { color: blue; }`] // Estilos del componente
})
export class SaludadorComponent {
  // Decorador @Input(): Permite que la propiedad 'nombre' reciba datos desde un componente padre.
  @Input() nombre: string = 'Mundo';

  // Decorador @Output() y EventEmitter: Permite que el componente emita eventos a un componente padre.
  @Output() saludoEmitido = new EventEmitter<string>();

  emitirSaludo() {
    this.saludoEmitido.emit(`¡Saludo desde ${this.nombre}!`);
  }
}

// Ejemplo de cómo usar este componente en otra plantilla HTML:
/*
<app-saludador [nombre]="'Alice'" (saludoEmitido)="manejarSaludo($event)"></app-saludador>
*/

// Otro ejemplo: Decorador @Injectable para servicios
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root' // Indica que este servicio estará disponible en toda la aplicación
})
export class MiServicio {
  obtenerDatos() {
    console.log('Obteniendo datos...');
  }
}

/*
Un error común es olvidar importar el decorador antes de usarlo.
Si intentas usar @Component sin importar { Component } de '@angular/core',
obtendrás un error de 'Cannot find name 'Component''.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción y Configuración',
    'topic': 'Componentes y Plantillas',
    'subtopic': 'Creación y estructura de componentes',
    'definition': r'''
En Angular, los componentes son las piezas fundamentales de tu interfaz de usuario. Piensa en ellos como bloques de construcción autónomos que combinan la lógica (código TypeScript), la vista (plantilla HTML) y el estilo (CSS). Cada componente tiene su propio propósito y su propia "zona" en la pantalla de tu aplicación.

Seguramente pensarás de qué va todo esto... 

Pues, cada aplicación Angular es esencialmente un árbol de componentes. Tienes un componente raíz (usualmente `AppComponent`) y de él se desprenden otros componentes, que a su vez pueden contener más componentes, y así sucesivamente. Cuando creas un componente con el Angular CLI, este te genera automáticamente varios archivos: un archivo `.ts` para la lógica (donde defines las propiedades y métodos de tu componente), un archivo `.html` para la plantilla (que es lo que se renderizará en el navegador), y un archivo `.css` (o `.scss`, etc.) para los estilos específicos de ese componente. También genera un archivo `.spec.ts` para pruebas unitarias. Lo genial de esta estructura es que mantiene todo lo relacionado con un componente encapsulado en un solo lugar. Esto facilita muchísimo la organización, el mantenimiento y la reutilización del código. Por ejemplo, si tienes un componente `BotonPersonalizado`, puedes usarlo en diferentes partes de tu aplicación sin tener que duplicar su código o sus estilos.
''',
    'code_example': r'''
// Para crear un nuevo componente usando Angular CLI:
// ng generate component nombre-del-componente
// O su abreviatura: ng g c nombre-del-componente

// Ejemplo de los archivos generados para 'mi-boton':
/*
src/app/
├── mi-boton/
│   ├── mi-boton.component.css
│   ├── mi-boton.component.html
│   ├── mi-boton.component.spec.ts
│   └── mi-boton.component.ts
*/

// Contenido típico de mi-boton.component.ts:
import { Component } from '@angular/core';

@Component({
  selector: 'app-mi-boton', // Cómo se usará este componente en otras plantillas HTML
  templateUrl: './mi-boton.component.html', // Ruta al archivo HTML de la plantilla
  styleUrls: ['./mi-boton.component.css'] // Ruta al archivo CSS de los estilos
})
export class MiBotonComponent {
  // Propiedades de la clase (datos)
  textoBoton: string = 'Haz clic aquí';

  // Métodos de la clase (lógica)
  onClick(): void {
    alert('¡Botón clicado!');
  }
}

// Contenido típico de mi-boton.component.html:
/*
<button (click)="onClick()">{{ textoBoton }}</button>
*/

// Para usar este componente en otra plantilla (ej. app.component.html):
/*
<app-mi-boton></app-mi-boton>
*/

/*
Un error común es intentar llamar a métodos o propiedades en la plantilla HTML
que no están definidos en la clase TypeScript del componente.
Esto causaría un error de compilación o un error en tiempo de ejecución.
Asegúrate siempre de que lo que usas en el HTML tenga su contraparte en el .ts.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción y Configuración',
    'topic': 'Componentes y Plantillas',
    'subtopic': 'Comunicación entre componentes (Input y Output)',
    'definition': r'''
En una aplicación Angular, es muy común que los componentes necesiten hablar entre sí. Piensa en un componente padre que contiene varios componentes hijos; el padre podría necesitar pasarle información a un hijo, y el hijo podría necesitar notificar al padre sobre algo que sucedió. Aquí es donde entran en juego los decoradores `@Input()` y `@Output()`.

Esto tiene una explicación, y es porque los componentes son entidades aisladas por defecto. Para que puedan interactuar de manera controlada y predecible, Angular nos proporciona estos mecanismos. `@Input()` es como una "entrada" para el componente hijo. Permite que un componente padre le pase datos al hijo. Imagina que tienes un componente `TarjetaProducto` y quieres que muestre diferentes productos. Con `@Input()`, puedes pasarle la información de cada producto individualmente desde el componente que usa `TarjetaProducto`. Por otro lado, `@Output()` es como una "salida" para el componente hijo. Permite que el componente hijo envíe datos o notificaciones a su componente padre. Esto se logra usando `EventEmitter`, que es un mecanismo para emitir eventos personalizados. Por ejemplo, un componente `BotónEliminar` podría usar `@Output()` para emitir un evento `eliminado` cuando el usuario hace clic en él, y el componente padre podría escuchar ese evento y reaccionar eliminando el elemento correspondiente. Esta comunicación unidireccional (de padre a hijo con `@Input()`, y de hijo a padre con `@Output()`) es una buena práctica en Angular que ayuda a mantener el flujo de datos claro y fácil de depurar.
''',
    'code_example': r'''
// Componente Padre (ej. app.component.ts)
import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  template: `
    <h2>Lista de Productos</h2>
    <app-producto-item
      *ngFor="let prod of productos"
      [producto]="prod"
      (productoSeleccionado)="manejarProductoSeleccionado($event)">
    </app-producto-item>
    <p *ngIf="productoSeleccionado">Producto seleccionado: {{ productoSeleccionado.nombre }}</p>
  `
})
export class AppComponent {
  productos = [
    { id: 1, nombre: 'Laptop', precio: 1200 },
    { id: 2, nombre: 'Teclado', precio: 75 },
    { id: 3, nombre: 'Ratón', precio: 25 }
  ];
  productoSeleccionado: any;

  manejarProductoSeleccionado(producto: any) {
    this.productoSeleccionado = producto;
    console.log('Se ha seleccionado el producto:', producto.nombre);
  }
}

// Componente Hijo (ej. producto-item.component.ts)
import { Component, Input, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-producto-item',
  template: `
    <div style="border: 1px solid #ccc; padding: 10px; margin-bottom: 5px;">
      <h3>{{ producto.nombre }}</h3>
      <p>Precio: ${{ producto.precio }}</p>
      <button (click)="seleccionarProducto()">Seleccionar</button>
    </div>
  `
})
export class ProductoItemComponent {
  // @Input() para recibir datos del padre
  @Input() producto: any;

  // @Output() para emitir eventos al padre
  // EventEmitter<any> indica que emitirá un objeto de cualquier tipo
  @Output() productoSeleccionado = new EventEmitter<any>();

  seleccionarProducto() {
    this.productoSeleccionado.emit(this.producto); // Emitimos el producto actual
  }
}

/*
Un error común es olvidar importar 'Input', 'Output', 'EventEmitter'
o no llamar a '.emit()' en el EventEmitter para que el evento se dispare.
También, si no usas los corchetes [] para @Input o paréntesis () para @Output
en la plantilla del componente padre, Angular no los reconocerá.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción y Configuración',
    'topic': 'Componentes y Plantillas',
    'subtopic': 'Ciclo de vida de los componentes',
    'definition': r'''
Los componentes en Angular no solo se crean y destruyen; pasan por una serie de fases a lo largo de su existencia, desde que se inicializan hasta que se eliminan. A estas fases se les conoce como el "ciclo de vida de los componentes", y Angular nos permite "engancharnos" a estos momentos específicos para ejecutar nuestra propia lógica.

Pensemos por un momento en un bebé: nace, crece, aprende, madura y eventualmente se despide. Los componentes de Angular tienen un proceso similar, pero mucho más predecible. Angular proporciona una serie de interfaces de ciclo de vida que puedes implementar en tus componentes para ejecutar código en momentos clave. Las más comunes son: `ngOnInit` (cuando el componente se inicializa por primera vez, ideal para cargar datos iniciales), `ngOnChanges` (cuando Angular detecta cambios en las propiedades de entrada del componente, útil para reaccionar a datos nuevos del padre), `ngDoCheck` (para implementar tu propia lógica de detección de cambios), `ngAfterContentInit`, `ngAfterContentChecked`, `ngAfterViewInit`, `ngAfterViewChecked` (para interactuar con el contenido proyectado o la vista del componente) y `ngOnDestroy` (cuando el componente se va a destruir, perfecto para limpiar suscripciones, temporizadores y evitar fugas de memoria). Entender y utilizar estos "hooks" o ganchos del ciclo de vida es crucial para gestionar el estado de tu componente, optimizar su rendimiento y evitar problemas como las fugas de memoria. Por ejemplo, si un componente se suscribe a un Observable para recibir datos, es vital desuscribirse en `ngOnDestroy` para liberar recursos cuando el componente ya no sea necesario.
''',
    'code_example': r'''
// Importamos las interfaces del ciclo de vida que vamos a usar
import { Component, OnInit, OnChanges, SimpleChanges, OnDestroy } from '@angular/core';

@Component({
  selector: 'app-ejemplo-ciclo-vida',
  template: `
    <p>Componente de Ejemplo: {{ mensaje }}</p>
    <p *ngIf="valorInput">Valor recibido: {{ valorInput }}</p>
  `
})
export class EjemploCicloVidaComponent implements OnInit, OnChanges, OnDestroy {
  mensaje: string = 'Iniciando...';
  valorInput: string;

  constructor() {
    // 1. Constructor: Se ejecuta primero, antes de cualquier hook del ciclo de vida.
    // Útil para inicializar variables, no para lógica compleja que dependa de @Input.
    console.log('1. Constructor: Componente creado.');
  }

  // ngOnChanges: Se ejecuta cuando Angular detecta cambios en las propiedades de entrada (@Input).
  // Se ejecuta antes de ngOnInit si hay @Inputs.
  ngOnChanges(changes: SimpleChanges): void {
    console.log('2. ngOnChanges: Se detectaron cambios en las propiedades de entrada.');
    for (const propName in changes) {
      if (changes.hasOwnProperty(propName)) {
        const change = changes[propName];
        const current = JSON.stringify(change.currentValue);
        const previous = JSON.stringify(change.previousValue);
        console.log(`   - ${propName}: current = ${current}, previous = ${previous}`);
      }
    }
  }

  // ngOnInit: Se ejecuta una vez, después del constructor y ngOnChanges (si existen @Inputs).
  // Es el lugar ideal para inicializar datos, llamar a servicios para obtener datos, etc.
  ngOnInit(): void {
    console.log('3. ngOnInit: Componente inicializado.');
    this.mensaje = '¡Componente listo para usar!';
  }

  // ngOnDestroy: Se ejecuta justo antes de que Angular destruya el componente.
  // Es crucial para limpiar recursos: desuscribirse de Observables, limpiar temporizadores, etc.
  ngOnDestroy(): void {
    console.log('4. ngOnDestroy: Componente destruido. Limpiando recursos...');
    // Aquí iría la lógica de limpieza
  }

  // Puedes simular el paso de un input desde un componente padre:
  // En el componente padre HTML: <app-ejemplo-ciclo-vida [valorInput]="'Hola desde padre'"></app-ejemplo-ciclo-vida>
}

/*
Un error común es realizar operaciones asíncronas (como llamadas HTTP) en el constructor.
El constructor debe ser ligero; la lógica de inicialización que requiere datos o servicios
debe ir en ngOnInit. Otro error es olvidar desuscribirse de Observables en ngOnDestroy,
lo que puede llevar a fugas de memoria.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción y Configuración',
    'topic': 'Directivas Básicas',
    'subtopic': 'Uso de *ngIf y *ngFor',
    'definition': r'''
En Angular, las directivas son una de esas características que te hacen la vida más fácil al manipular el DOM (Document Object Model) y aplicar comportamientos a los elementos HTML. De las más usadas, y que verás en casi cualquier proyecto, son `*ngIf` y `*ngFor`.

Aquí te va la aclaración: `*ngIf` es como un interruptor condicional para elementos HTML. Te permite renderizar o remover elementos del DOM basándose en una condición. Si la condición es verdadera, el elemento y su contenido se añaden al DOM; si es falsa, se eliminan completamente. Esto es diferente a simplemente ocultar un elemento con CSS, ya que `*ngIf` realmente lo quita y lo pone, lo que puede ser útil para el rendimiento si tienes muchos elementos que no siempre deben estar presentes. Por otro lado, `*ngFor` es tu mejor amigo cuando necesitas renderizar una lista de elementos. Imagina que tienes un array de productos y quieres mostrar cada uno en una tarjeta HTML. Con `*ngFor`, puedes iterar sobre ese array y generar un elemento HTML por cada ítem en la lista, sin tener que escribir el mismo código HTML una y otra vez. Simplifica muchísimo la creación de listas dinámicas y repetitivas, que son el pan de cada día en cualquier aplicación web. Ambas directivas son estructurales, lo que significa que modifican la estructura del DOM.
''',
    'code_example': r'''
// Ejemplo de uso de *ngIf en una plantilla HTML:
/*
<div *ngIf="mostrarMensaje">
  <p>Este mensaje solo se mostrará si 'mostrarMensaje' es verdadero.</p>
</div>

<button (click)="mostrarMensaje = !mostrarMensaje">Alternar Mensaje</button>
*/

// En tu componente TypeScript (ej. app.component.ts):
import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  template: `
    <div *ngIf="mostrarMensaje">
      <p>Este mensaje solo se mostrará si 'mostrarMensaje' es verdadero.</p>
    </div>
    <button (click)="mostrarMensaje = !mostrarMensaje">Alternar Mensaje</button>

    <h2>Lista de Ítems</h2>
    <ul>
      <li *ngFor="let item of items; index as i; first as isFirst; last as isLast; odd as isOdd; even as isEven">
        {{ i }}. {{ item }}
        <span *ngIf="isFirst">(Primero)</span>
        <span *ngIf="isLast">(Último)</span>
        <span *ngIf="isOdd">(Impar)</span>
        <span *ngIf="isEven">(Par)</span>
      </li>
    </ul>

    <div *ngIf="items.length === 0">
      <p>No hay ítems para mostrar.</p>
    </div>
  `
})
export class AppComponent {
  mostrarMensaje: boolean = true;
  items: string[] = ['Manzana', 'Banana', 'Cereza', 'Dátiles'];
}

/*
Un error común con *ngIf es confundirlo con ocultar con CSS.
Si solo quieres ocultar un elemento pero mantenerlo en el DOM, usaría [hidden]="!condicion".
*ngIf remueve el elemento completamente, lo cual puede tener implicaciones en la forma en que los estilos y scripts se aplican.

Un error común con *ngFor es olvidar el 'let item of items'.
O intentar iterar sobre algo que no es una colección iterable.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción y Configuración',
    'topic': 'Directivas Básicas',
    'subtopic': 'Aplicación de ngClass y ngStyle',
    'definition': r'''
Además de las directivas estructurales como `*ngIf` y `*ngFor`, Angular nos ofrece directivas de atributo que nos permiten manipular los atributos de los elementos HTML. Entre las más útiles para el manejo de estilos, tenemos `ngClass` y `ngStyle`.

Esto tiene una explicación, y es porque estas directivas hacen que el manejo dinámico de los estilos sea mucho más sencillo y reactivo. `ngClass` te permite añadir o quitar clases CSS a un elemento HTML de forma condicional. Pensemos por un momento en una situación donde tienes un botón de "Guardar" que debe verse diferente (ej. verde) cuando el formulario es válido, y deshabilitado (ej. gris) cuando es inválido. En lugar de manipular las clases directamente con JavaScript puro, `ngClass` te permite enlazar un objeto donde las claves son los nombres de las clases y los valores son expresiones booleanas. Si la expresión es verdadera, la clase se aplica; si es falsa, se quita. Esto es super limpio y declarativo. `ngStyle`, por su parte, te permite aplicar estilos CSS en línea directamente a un elemento HTML de forma dinámica. Si necesitas que el color de fondo de un div cambie según un valor numérico, o que el tamaño de fuente se ajuste dinámicamente, `ngStyle` te permite hacer esto enlazando un objeto donde las claves son las propiedades CSS y los valores son las expresiones que definen esos estilos. Ambas directivas son excelentes para crear interfaces de usuario dinámicas y responsivas sin tener que escribir lógica compleja para el manejo de DOM manual.
''',
    'code_example': r'''
// Ejemplo de uso de ngClass en una plantilla HTML:
/*
<div [ngClass]="{'resaltado': esResaltado, 'deshabilitado': estaDeshabilitado}">
  Este texto cambiará de estilo.
</div>

<button (click)="esResaltado = !esResaltado">Alternar Resaltado</button>
<button (click)="estaDeshabilitado = !estaDeshabilitado">Alternar Deshabilitado</button>
*/

// En tu componente TypeScript (ej. app.component.ts):
import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  template: `
    <h2>Uso de ngClass</h2>
    <div [ngClass]="{'resaltado': esResaltado, 'deshabilitado': estaDeshabilitado}" class="caja">
      Este texto cambiará de estilo con ngClass.
    </div>
    <button (click)="esResaltado = !esResaltado">Alternar Resaltado</button>
    <button (click)="estaDeshabilitado = !estaDeshabilitado">Alternar Deshabilitado</button>

    <hr>

    <h2>Uso de ngStyle</h2>
    <div [ngStyle]="{'background-color': colorFondo, 'font-size.px': tamanoFuente}" class="caja">
      Este texto cambiará de estilo con ngStyle.
    </div>
    <input type="color" [(ngModel)]="colorFondo">
    <input type="range" min="12" max="36" [(ngModel)]="tamanoFuente">
  `,
  styles: [`
    .caja {
      padding: 20px;
      margin: 10px;
      border: 1px solid black;
      width: 300px;
      text-align: center;
    }
    .resaltado {
      background-color: yellow;
      font-weight: bold;
    }
    .deshabilitado {
      opacity: 0.5;
      cursor: not-allowed;
    }
  `]
})
export class AppComponent {
  esResaltado: boolean = false;
  estaDeshabilitado: boolean = false;

  colorFondo: string = '#ADD8E6'; // Light Blue
  tamanoFuente: number = 16;
}

/*
Un error común con ngClass y ngStyle es intentar usar la sintaxis
de directivas estructurales (con el asterisco *).
Estas son directivas de atributo y usan la sintaxis de enlace de propiedades ([]).

// INCORRECTO:
// <div *ngClass="{'resaltado': esResaltado}"></div>

// CORRECTO:
// <div [ngClass]="{'resaltado': esResaltado}"></div>
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción y Configuración',
    'topic': 'Directivas Básicas',
    'subtopic': 'Creación de directivas personalizadas',
    'definition': r'''
Más allá de las directivas que Angular nos da por defecto (como `*ngIf`, `ngClass`, etc.), a veces te encontrarás con la necesidad de crear tus propias directivas. Esto es súper potente porque te permite añadir comportamientos reutilizables a tus elementos HTML de una manera muy limpia y declarativa. Piensa en ellas como si estuvieras extendiendo el HTML con nuevas funcionalidades.

¿Te estás preguntando por qué querrías hacer esto?

Aquí te va la aclaración: Pensemos por un momento en una situación donde tienes un requisito recurrente, como resaltar el texto de un elemento cuando el mouse pasa por encima, o quizás formatear un número de teléfono de una manera específica en varios lugares de tu aplicación. En lugar de escribir la misma lógica y manipular el DOM directamente en cada componente donde necesites esa funcionalidad, puedes encapsularla en una directiva personalizada. Una directiva personalizada es una clase de TypeScript decorada con `@Directive`. Dentro de esta clase, puedes usar `ElementRef` para acceder al elemento del DOM al que se adjunta la directiva, y `Renderer2` para manipular ese elemento de forma segura y compatible con todas las plataformas donde Angular pueda ejecutarse. También puedes usar `@HostListener` para escuchar eventos en el elemento huésped (como un clic o un `mouseover`) y `@HostBinding` para enlazar propiedades del elemento huésped a propiedades de tu directiva. Esto te permite crear comportamientos complejos una sola vez y luego aplicarlos a cualquier elemento HTML con solo añadir el selector de tu directiva como un atributo. Es una forma elegante de mantener tu código DRY (Don't Repeat Yourself) y de separar las preocupaciones.
''',
    'code_example': r'''
// 1. Crear una directiva personalizada usando Angular CLI:
// ng generate directive highlight
// O su abreviatura: ng g d highlight

// 2. Archivo src/app/highlight.directive.ts:
import { Directive, ElementRef, HostListener, Input, Renderer2 } from '@angular/core';

@Directive({
  selector: '[appHighlight]' // Selector de atributo, se usará como <p appHighlight>
})
export class HighlightDirective {
  // @Input para permitir que la directiva reciba un color de un componente padre
  @Input('appHighlight') highlightColor: string; // Alias para el nombre del atributo

  constructor(private el: ElementRef, private renderer: Renderer2) {
    // ElementRef: Referencia al elemento HTML al que se aplica la directiva.
    // Renderer2: Servicio de Angular para manipular el DOM de forma segura.
  }

  // @HostListener: Escucha eventos en el elemento HTML donde se aplica la directiva.
  @HostListener('mouseenter') onMouseEnter() {
    this.highlight(this.highlightColor || 'yellow'); // Usa el color del input o amarillo por defecto
  }

  @HostListener('mouseleave') onMouseLeave() {
    this.highlight(null); // Quita el resaltado
  }

  private highlight(color: string | null) {
    this.renderer.setStyle(this.el.nativeElement, 'background-color', color);
  }
}

// 3. Importar la directiva en el módulo donde la vayas a usar (ej. app.module.ts):
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { AppComponent } from './app.component';
import { HighlightDirective } from './highlight.directive'; // Importa la directiva

@NgModule({
  declarations: [
    AppComponent,
    HighlightDirective // Declara la directiva aquí
  ],
  imports: [
    BrowserModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

// 4. Usar la directiva en una plantilla HTML (ej. app.component.html):
/*
<p appHighlight>Pasa el mouse sobre mí para resaltarme.</p>
<p [appHighlight]="'lightblue'">Este párrafo se resaltará de color azul claro.</p>
*/

/*
Un error común es olvidar declarar la directiva en el NgModule donde se va a usar.
Si no la declaras en el array 'declarations' de tu módulo, Angular no la reconocerá y obtendrás un error.
Otro error es no usar ElementRef y Renderer2 para manipular el DOM, lo cual es una buena práctica
para asegurar que la directiva funcione correctamente en diferentes entornos (ej. server-side rendering).
*/
'''
  });
}

Future<void> insertAngularJrLevel2Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Enrutamiento y Navegación',
    'topic': 'Configuración de Rutas',
    'subtopic': 'Definición de rutas en Angular',
    'definition': r'''
En cualquier aplicación web que no sea trivial, necesitas navegar entre diferentes vistas o secciones. Aquí es donde entra el enrutador de Angular, una de sus características más poderosas. La definición de rutas en Angular es la forma en que le decimos a la aplicación qué componente debe mostrarse cuando el usuario navega a una URL específica.

¿Te estás preguntando por qué esto importa?

Aquí te va la aclaración: Pensemos por un momento en una tienda online. Cuando vas a la página de "Productos", luego a la de "Carrito" y finalmente a "Mi Cuenta", la URL en tu navegador cambia. El enrutador de Angular es el encargado de que, al cambiar esa URL, el contenido de la aplicación también cambie para mostrar el componente correcto (por ejemplo, el `ProductosComponent`, `CarritoComponent`, o `MiCuentaComponent`). Para definir estas rutas, creamos un array de objetos JavaScript, donde cada objeto mapea un `path` (la parte de la URL después del dominio) a un `component` específico. Este array se importa y se configura en un módulo especial de enrutamiento (normalmente llamado `app-routing.module.ts`). Esto permite que tu aplicación sea una Single Page Application (SPA), donde el navegador carga una sola página HTML al inicio y luego el enrutador se encarga de cambiar el contenido dinámicamente sin recargar la página completa. Esto no solo mejora la experiencia del usuario al hacer la navegación más fluida, sino que también es fundamental para construir aplicaciones web modernas y eficientes.
''',
    'code_example': r'''
// 1. Crear un archivo de enrutamiento (ej. app-routing.module.ts):
// Usualmente se genera con ng new si eliges agregar enrutamiento.

// 2. Contenido típico de app-routing.module.ts:
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

// Importa tus componentes que quieres asociar a rutas
import { HomeComponent } from './home/home.component';
import { AboutComponent } from './about/about.component';
import { ContactComponent } from './contact/contact.component';

// Define tus rutas: un array de objetos Routes
const routes: Routes = [
  { path: '', component: HomeComponent }, // Ruta raíz o por defecto
  { path: 'about', component: AboutComponent }, // Cuando la URL es /about
  { path: 'contact', component: ContactComponent } // Cuando la URL es /contact
];

@NgModule({
  imports: [RouterModule.forRoot(routes)], // Configura el enrutador con las rutas principales
  exports: [RouterModule] // Exporta RouterModule para que esté disponible en otros módulos
})
export class AppRoutingModule { }

// 3. Asegúrate de importar AppRoutingModule en tu AppModule (app.module.ts):
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppRoutingModule } from './app-routing.module'; // Importa tu módulo de enrutamiento
import { AppComponent } from './app.component';
import { HomeComponent } from './home/home.component';
import { AboutComponent } from './about/about.component';
import { ContactComponent } from './contact/contact.component';

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    AboutComponent,
    ContactComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule // Añádelo a los imports
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

// 4. Agrega <router-outlet> en tu plantilla principal (ej. app.component.html):
// <router-outlet> es el marcador donde Angular renderizará los componentes
// que corresponden a la ruta actual.
/*
<nav>
  <a routerLink="/">Home</a> |
  <a routerLink="/about">About</a> |
  <a routerLink="/contact">Contact</a>
</nav>

<router-outlet></router-outlet>
*/

/*
Un error común es olvidar el <router-outlet> en la plantilla principal.
Sin él, aunque las rutas estén definidas, Angular no tendrá dónde renderizar los componentes.
Otro error es no importar RouterModule.forRoot(routes) en el módulo de enrutamiento
o no importar el módulo de enrutamiento en el AppModule.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Enrutamiento y Navegación',
    'topic': 'Configuración de Rutas',
    'subtopic': 'Rutas anidadas y parámetros de ruta',
    'definition': r'''
Una vez que dominas la definición básica de rutas, el siguiente paso es entender cómo manejar rutas más complejas, como las rutas anidadas y los parámetros de ruta. Estas características son esenciales para construir aplicaciones realistas con estructuras de navegación más profundas y contenido dinámico.

Pensemos por un momento en un perfil de usuario en una red social. Tienes una URL como `/users/123`, donde "123" es el ID del usuario. Ese "123" es un **parámetro de ruta**. Permite que una misma ruta (por ejemplo, `/users/:id`) muestre diferentes contenidos basándose en el valor que se pasa en la URL. Angular nos permite definir estos parámetros usando dos puntos `:` delante del nombre del parámetro en la ruta (ej. `path: 'users/:id'`). Luego, dentro del componente asociado a esa ruta, puedes acceder al valor de ese parámetro usando el servicio `ActivatedRoute`. Por otro lado, las **rutas anidadas** (o rutas hijas) son súper útiles cuando quieres tener una estructura de navegación jerárquica dentro de un componente principal. Imagina que dentro del perfil de ese usuario (`/users/:id`), quieres tener subsecciones como "Publicaciones", "Amigos" o "Fotos". En lugar de crear rutas completamente separadas, puedes anidar estas subrutas dentro de la ruta principal de usuario. Para esto, defines un `children` array dentro de la ruta padre, y dentro del componente padre, agregas otro `<router-outlet>` donde se renderizarán los componentes hijos. Esto no solo mantiene tu configuración de rutas organizada, sino que también permite que una parte de la pantalla cambie mientras otra (la del componente padre) permanece constante. Es una forma muy efectiva de construir interfaces de usuario complejas y navegables.
''',
    'code_example': r'''
// Ejemplo de rutas anidadas y parámetros de ruta:

// En tu app-routing.module.ts:
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { HomeComponent } from './home/home.component';
import { UserDetailComponent } from './user-detail/user-detail.component';
import { UserPostsComponent } from './user-posts/user-posts.component';
import { UserFriendsComponent } from './user-friends/user-friends.component';

const routes: Routes = [
  { path: '', component: HomeComponent },
  // Ruta con parámetro :id y rutas anidadas
  {
    path: 'users/:id', // :id es un parámetro de ruta
    component: UserDetailComponent,
    children: [ // Rutas anidadas
      { path: '', redirectTo: 'posts', pathMatch: 'full' }, // Redirección por defecto para el hijo
      { path: 'posts', component: UserPostsComponent },
      { path: 'friends', component: UserFriendsComponent }
    ]
  },
  // ... otras rutas
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }


// En el componente padre (ej. user-detail/user-detail.component.ts) para leer el parámetro:
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-user-detail',
  template: `
    <h2>Detalle del Usuario: {{ userId }}</h2>
    <nav>
      <a [routerLink]="['posts']">Publicaciones</a> |
      <a [routerLink]="['friends']">Amigos</a>
    </nav>
    <router-outlet></router-outlet> `
})
export class UserDetailComponent implements OnInit {
  userId: string | null = null;

  constructor(private route: ActivatedRoute) { }

  ngOnInit(): void {
    // Suscribirse a los parámetros de la ruta para reaccionar a cambios
    this.route.paramMap.subscribe(params => {
      this.userId = params.get('id'); // Obtener el valor del parámetro 'id'
      console.log('ID de usuario:', this.userId);
      // Aquí podrías cargar los datos del usuario basándote en este ID
    });
  }
}

/*
Un error común es olvidar el <router-outlet> dentro del componente padre
cuando se usan rutas anidadas. Si no está, los componentes hijos no se renderizarán.
Otro error es intentar acceder a los parámetros de ruta directamente como una propiedad
del componente en lugar de usar ActivatedRoute, o no suscribirse al `paramMap` si esperas
que el parámetro cambie sin que el componente se destruya y recree.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Enrutamiento y Navegación',
    'topic': 'Configuración de Rutas',
    'subtopic': 'Redirecciones y rutas comodín',
    'definition': r'''
Para que la navegación en tu aplicación Angular sea completa y robusta, no solo necesitas definir rutas para tus componentes, sino también manejar situaciones como URLs que no existen o redireccionar a los usuarios de manera automática. Aquí es donde las redirecciones y las rutas comodín (`**`) se vuelven indispensables.

No sé tú, pero a mí esto al principio me costó. 

La redirección es sencilla: si un usuario intenta acceder a una URL, y quieres que en su lugar se muestre el contenido de otra URL, defines una regla de redirección. Esto es muy útil, por ejemplo, si cambias el nombre de una página o si quieres que la ruta raíz (`/`) siempre redirija a una página de inicio específica (ej. `/home`). Para configurar una redirección, en tu array de `Routes`, especificas el `path` original, el `redirectTo` (la nueva URL), y un `pathMatch`. `pathMatch: 'full'` significa que la URL debe coincidir exactamente con el `path` para que la redirección ocurra, mientras que `pathMatch: 'prefix'` significa que debe coincidir con el prefijo (útil para rutas anidadas). Por otro lado, la **ruta comodín**, representada por `**`, es como una "ruta de respaldo" que atrapa cualquier URL que no haya coincidido con ninguna de las rutas definidas anteriormente. Esto es perfecto para implementar una página de "404 No Encontrado". Siempre debe ser la **última ruta** en tu configuración, porque el enrutador de Angular procesa las rutas en el orden en que están definidas. Si pones la ruta comodín al principio, interceptaría todas las URLs y tus otras rutas nunca serían alcanzadas. Juntos, las redirecciones y las rutas comodín te permiten controlar completamente el flujo de navegación de tu aplicación, mejorando tanto la experiencia del usuario como la robustez de tu aplicación.
''',
    'code_example': r'''
// Ejemplo de redirecciones y rutas comodín en app-routing.module.ts:
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { HomeComponent } from './home/home.component';
import { ProductsComponent } from './products/products.component';
import { NotFoundComponent } from './not-found/not-found.component'; // Componente para 404

const routes: Routes = [
  // Redirección de la ruta raíz a /home
  { path: '', redirectTo: '/home', pathMatch: 'full' },

  { path: 'home', component: HomeComponent },
  { path: 'products', component: ProductsComponent },
  { path: 'productos', redirectTo: '/products', pathMatch: 'full' }, // Redirección de una URL antigua a una nueva

  // Ruta comodín: '**' coincidirá con cualquier URL que no haya sido procesada por las rutas anteriores.
  // SIEMPRE debe ser la ÚLTIMA ruta en la configuración.
  { path: '**', component: NotFoundComponent } // Mostrar componente 404 si la URL no coincide con ninguna ruta
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

// En tu componente de "No Encontrado" (ej. not-found/not-found.component.ts):
import { Component } from '@angular/core';

@Component({
  selector: 'app-not-found',
  template: `
    <div style="text-align: center; margin-top: 50px;">
      <h1>404</h1>
      <p>Lo sentimos, la página que buscas no existe.</p>
      <a routerLink="/home">Volver a la página de inicio</a>
    </div>
  `
})
export class NotFoundComponent { }

/*
Un error común es colocar la ruta comodín antes que las rutas específicas.
Si lo haces, el enrutador siempre coincidirá con la ruta comodín y tus rutas válidas nunca serán alcanzadas.

// ERROR COMÚN (NO HAGAS ESTO):
// const routes: Routes = [
//   { path: '**', component: NotFoundComponent }, // ¡Esto atrapa todo!
//   { path: 'home', component: HomeComponent } // Esta ruta nunca se alcanzará
// ];

// Asegúrate de que el 'pathMatch: 'full'' se use correctamente en las redirecciones,
// especialmente para la ruta raíz, para evitar comportamientos inesperados.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Enrutamiento y Navegación',
    'topic': 'Guards y Resolvers',
    'subtopic': 'Protección de rutas con Guards',
    'definition': r'''
Cuando construyes una aplicación, es fundamental controlar quién puede acceder a qué partes. No querrías que un usuario no autenticado vea el panel de administración, ¿verdad? Aquí es donde entran en juego los "Guards" de Angular. Son como vigilantes que se colocan delante de tus rutas para decidir si un usuario tiene permiso para activarlas, desactivarlas, o cargar un módulo.

¿Te preguntas por qué esto es tan importante?

Aquí te va la aclaración: Pensemos por un momento en un sistema de seguridad para una casa. Antes de entrar a ciertas habitaciones, necesitas una llave o un código. Los Guards funcionan de manera similar en Angular. Antes de que el enrutador active una ruta (es decir, muestre el componente asociado a esa ruta), puede consultar a uno o varios Guards. Si un Guard devuelve `true`, el usuario puede pasar; si devuelve `false`, se le niega el acceso. Hay varios tipos de Guards, pero los más comunes son:
* `CanActivate`: Decide si una ruta puede ser activada. Ideal para verificar si un usuario está logueado o tiene un rol específico.
* `CanDeactivate`: Decide si una ruta puede ser desactivada, es decir, si el usuario puede salir de ella. Útil para preguntar al usuario si quiere guardar cambios antes de abandonar un formulario, por ejemplo.
* `CanLoad`: Decide si un módulo (que se carga de forma perezosa) puede ser cargado. Esto es importante para la seguridad y el rendimiento, ya que evita que el navegador descargue código que el usuario no tiene permiso de ver.

Los Guards son clases de TypeScript que implementan una de estas interfaces y su lógica de decisión. Permiten centralizar la lógica de autorización y autenticación, haciendo tu código más limpio, seguro y fácil de mantener.
''',
    'code_example': r'''
// 1. Crear un Guard usando Angular CLI:
// ng generate guard auth
// El CLI te preguntará qué interfaces quieres implementar (CanActivate, CanDeactivate, etc.)

// 2. Ejemplo de un AuthGuard (auth.guard.ts) para CanActivate:
import { Injectable } from '@angular/core';
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, UrlTree, Router } from '@angular/router';
import { Observable } from 'rxjs';
import { AuthService } from './auth.service'; // Asume que tienes un servicio de autenticación

@Injectable({
  providedIn: 'root' // Hace que el guard sea un singleton y esté disponible en toda la app
})
export class AuthGuard implements CanActivate {
  constructor(private authService: AuthService, private router: Router) {}

  canActivate(
    route: ActivatedRouteSnapshot, // Información de la ruta que se intenta activar
    state: RouterStateSnapshot): Observable<boolean | UrlTree> | Promise<boolean | UrlTree> | boolean | UrlTree {
    
    if (this.authService.isLoggedIn()) { // Simula la verificación de login
      return true; // Permite el acceso
    } else {
      // Si no está logueado, redirige a la página de login
      this.router.navigate(['/login']);
      return false; // Niega el acceso
    }
  }
}

// 3. Usar el Guard en la definición de tus rutas (app-routing.module.ts):
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AdminDashboardComponent } from './admin-dashboard/admin-dashboard.component';
import { LoginComponent } from './login/login.component';
import { AuthGuard } from './auth.guard'; // Importa tu guard

const routes: Routes = [
  { path: 'login', component: LoginComponent },
  {
    path: 'admin',
    component: AdminDashboardComponent,
    canActivate: [AuthGuard] // Aplica el guard a esta ruta
  },
  // ... otras rutas
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

/*
Un error común es olvidar registrar el Guard en el array 'providers' de tu módulo
(aunque 'providedIn: 'root'' lo hace automáticamente desde Angular 6+).
Otro error es no manejar el caso de que el Guard devuelva 'false',
lo que podría dejar al usuario en una página en blanco o sin una navegación clara.
Siempre redirige o muestra un mensaje adecuado.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Enrutamiento y Navegación',
    'topic': 'Guards y Resolvers',
    'subtopic': 'Precarga de datos con Resolvers',
    'definition': r'''
Imagina que tienes una página que muestra el detalle de un producto. Antes de que la página se cargue por completo y el usuario la vea, necesitas obtener los datos de ese producto desde una API. Si simplemente cargas el componente y luego haces la petición, el usuario podría ver la página vacía o con un "cargando..." por un momento. Aquí es donde los "Resolvers" de Angular vienen al rescate.

Vamos a ver de que se trata todo esto... 

Un Resolver es una clase que implementa la interfaz `Resolve`. Su propósito principal es obtener datos antes de que una ruta sea activada y su componente asociado sea renderizado. Es decir, garantiza que los datos necesarios para un componente estén disponibles antes de que el componente intente usarlos. Esto evita los famosos "flickers" o parpadeos de la interfaz y mejora la experiencia del usuario, ya que la página se muestra con la información completa desde el principio. Pensemos por un momento en una tienda online. Si un usuario hace clic en un producto, un Resolver podría ir a buscar los detalles de ese producto (nombre, descripción, precio, imagen) *antes* de que el componente de detalle del producto se muestre. Si la carga de datos falla, el Resolver también puede manejar ese error, por ejemplo, redirigiendo a una página de error o mostrando un mensaje. Una vez que el Resolver completa su tarea y devuelve los datos, estos se pueden inyectar directamente en el componente a través de `ActivatedRoute`. Así, cuando tu componente se inicializa, ya tiene los datos listos para ser utilizados, sin tener que preocuparse por la lógica de carga asíncrona.
''',
    'code_example': r'''
// 1. Crear un Resolver usando Angular CLI:
// ng generate resolver product-detail

// 2. Ejemplo de un ProductDetailResolver (product-detail.resolver.ts):
import { Injectable } from '@angular/core';
import { Resolve, ActivatedRouteSnapshot, RouterStateSnapshot } from '@angular/router';
import { Observable, of } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { ProductService } from './product.service'; // Asume un servicio para obtener productos

interface Product {
  id: number;
  name: string;
  price: number;
  description: string;
}

@Injectable({
  providedIn: 'root'
})
export class ProductDetailResolver implements Resolve<Product> {
  constructor(private productService: ProductService) {}

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<Product> {
    const productId = +route.paramMap.get('id'); // El '+' convierte el string a number
    console.log(`Resolviendo datos para el producto ID: ${productId}`);

    return this.productService.getProduct(productId).pipe(
      catchError(error => {
        console.error('Error al cargar el producto:', error);
        // Aquí podrías redirigir a una página de error o devolver un Observable de un objeto vacío/nulo
        return of(null as any); // Devuelve un observable de null si hay error
      })
    );
  }
}

// 3. Usar el Resolver en la definición de tus rutas (app-routing.module.ts):
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ProductDetailComponent } from './product-detail/product-detail.component';
import { ProductDetailResolver } from './product-detail.resolver'; // Importa tu resolver

const routes: Routes = [
  {
    path: 'products/:id',
    component: ProductDetailComponent,
    resolve: {
      product: ProductDetailResolver // 'product' será la clave para acceder a los datos resueltos
    }
  },
  // ... otras rutas
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

// 4. En el componente (product-detail/product-detail.component.ts) para acceder a los datos resueltos:
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-product-detail',
  template: `
    <div *ngIf="product">
      <h2>{{ product.name }}</h2>
      <p>Precio: ${{ product.price }}</p>
      <p>{{ product.description }}</p>
    </div>
    <div *ngIf="!product">
      <p>Producto no encontrado o error al cargar.</p>
    </div>
  `
})
export class ProductDetailComponent implements OnInit {
  product: Product; // El tipo Product debe estar definido (como en el resolver)

  constructor(private route: ActivatedRoute) { }

  ngOnInit(): void {
    // Los datos resueltos se encuentran en el 'data' snapshot de ActivatedRoute
    this.product = this.route.snapshot.data['product'];
    console.log('Datos del producto cargados por Resolver:', this.product);
  }
}

/*
Un error común es intentar acceder a los datos resueltos antes de que el resolver haya terminado,
lo cual es lo que el resolver precisamente evita. Asegúrate de que tu lógica de componente
dependa de que los datos ya estén presentes. Otro error es no manejar los errores en el resolver,
lo que podría dejar la navegación estancada si la petición falla.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Enrutamiento y Navegación',
    'topic': 'Guards y Resolvers',
    'subtopic': 'Estrategias de carga de módulos',
    'definition': r'''
Cuando tu aplicación Angular empieza a crecer, puede volverse pesada, especialmente si todo el código se carga al inicio. Para combatir esto y mejorar el rendimiento, Angular ofrece diferentes "estrategias de carga de módulos". Esto es crucial para que tu aplicación sea rápida y eficiente, especialmente en dispositivos móviles o con conexiones lentas.

Esto tiene una explicación, y es porque una aplicación Angular grande puede tener muchos módulos y componentes. Si los cargas todos de una vez cuando la aplicación se inicia, el tiempo de carga inicial puede ser muy alto. Aquí es donde el concepto de "Lazy Loading" (carga perezosa) se vuelve fundamental. La carga perezosa significa que un módulo, con todos sus componentes y servicios, solo se descarga y se carga cuando el usuario realmente navega a una ruta que pertenece a ese módulo. Esto reduce drásticamente el tamaño del bundle inicial de la aplicación, haciendo que se cargue mucho más rápido. Sin embargo, ¿qué pasa si sabes que un usuario probablemente necesitará un módulo pronto, pero no quieres que lo espere? Ahí entran las estrategias de precarga:

1.  **No Preloading (Lazy Loading por defecto):** Los módulos solo se cargan cuando se navega a su ruta. Esto es lo más común y lo más eficiente para reducir el bundle inicial.
2.  **PreloadAllModules:** Todos los módulos cargados perezosamente se precargan en segundo plano después de que la aplicación ha iniciado. Esto significa que cuando el usuario navegue a esas rutas, el módulo ya estará disponible. Es bueno si quieres que la mayoría de tus módulos estén listos sin afectar el inicio inicial.
3.  **Custom Preloading Strategy:** Puedes crear tu propia estrategia para decidir qué módulos precargar y cuándo. Por ejemplo, podrías precargar solo los módulos que los usuarios más visitan, o precargar módulos solo en horas de poca actividad.

Seleccionar la estrategia correcta depende de la naturaleza de tu aplicación y del comportamiento esperado del usuario. Una buena estrategia de carga puede marcar una gran diferencia en la percepción de rendimiento de tu aplicación.
''',
    'code_example': r'''
// Ejemplo de configuración de estrategias de carga en app-routing.module.ts:
import { NgModule } from '@angular/core';
import { PreloadAllModules, RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  { path: '', redirectTo: '/home', pathMatch: 'full' },
  { path: 'home', loadChildren: () => import('./home/home.module').then(m => m.HomeModule) },
  { path: 'admin', loadChildren: () => import('./admin/admin.module').then(m => m.AdminModule) },
  { path: 'user-profile', loadChildren: () => import('./user-profile/user-profile.module').then(m => m.UserProfileModule) },
];

@NgModule({
  imports: [
    RouterModule.forRoot(routes, {
      // Estrategia de carga por defecto: No Preloading (lazy loading)
      // Para cambiar la estrategia, se añade el segundo argumento a forRoot:
      // Ejemplo de PreloadAllModules:
      // preloadingStrategy: PreloadAllModules

      // Ejemplo de una estrategia de precarga personalizada (ver abajo):
      // preloadingStrategy: CustomPreloadingStrategy
    })
  ],
  exports: [RouterModule],
  // Si usas una estrategia de precarga personalizada, también debes proveerla aquí
  // providers: [CustomPreloadingStrategy]
})
export class AppRoutingModule { }

// Ejemplo de una estrategia de precarga personalizada (custom-preloading-strategy.ts):
import { PreloadingStrategy, Route } from '@angular/router';
import { Observable, of, timer } from 'rxjs';
import { Injectable } from '@angular/core';
import { flatMap } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class CustomPreloadingStrategy implements PreloadingStrategy {
  preload(route: Route, load: () => Observable<any>): Observable<any> {
    // Si la ruta tiene una propiedad 'preload' establecida a true, precárgala.
    // Opcionalmente, puedes añadir un retraso para que no afecte el inicio inicial.
    if (route.data && route.data['preload']) {
      console.log(`Precargando módulo: ${route.path}`);
      return timer(5000).pipe( // Precargar después de 5 segundos
        flatMap(() => load())
      );
    } else {
      return of(null); // No precargar
    }
  }
}

// Para usar la estrategia personalizada, en tu configuración de rutas, añade:
// { path: 'user-profile', loadChildren: () => import('./user-profile/user-profile.module').then(m => m.UserProfileModule), data: { preload: true } },

/*
Un error común es no definir 'loadChildren' para los módulos que quieres cargar de forma perezosa.
Si no usas 'loadChildren', el módulo se cargará eager (al inicio) sin importar la estrategia de precarga.
Otro error es no importar y proveer tu estrategia de precarga personalizada correctamente en el AppModule
o AppRoutingModule.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Enrutamiento y Navegación',
    'topic': 'Lazy Loading',
    'subtopic': 'Implementación de carga perezosa',
    'definition': r'''
El "Lazy Loading" o carga perezosa es una técnica súper importante en Angular para optimizar el rendimiento de tu aplicación. En pocas palabras, significa que un módulo, con todos sus componentes, servicios y otras dependencias, no se carga al inicio de la aplicación, sino solo cuando el usuario lo necesita, es decir, cuando navega a una ruta que pertenece a ese módulo.

¿Te preguntas por qué esto importa tanto?

Aquí te va la explicación: Pensemos por un momento en una aplicación grande, como un dashboard administrativo con muchas secciones (usuarios, productos, reportes, configuraciones, etc.). Si cargas todo ese código al principio, tu aplicación tardará mucho en iniciar, lo que frustrará a los usuarios, especialmente si tienen conexiones a internet lentas o usan dispositivos con recursos limitados. Con la carga perezosa, solo se descarga lo esencial para el inicio. Cuando el usuario hace clic en "Reportes", solo en ese momento se descarga y carga el módulo de reportes. Esto reduce drásticamente el tamaño del bundle inicial que el navegador tiene que descargar, haciendo que tu aplicación "se sienta" mucho más rápida y responsiva. La implementación es bastante sencilla en Angular: en lugar de importar un componente directamente en tus rutas, usas la propiedad `loadChildren` y una función que importa dinámicamente tu módulo. El enrutador de Angular se encarga de la magia de descargar el módulo solo cuando la ruta se activa. Es una de las primeras optimizaciones que debes considerar en cualquier aplicación Angular de tamaño medio a grande.
''',
    'code_example': r'''
// 1. Asegúrate de tener un módulo separado para la sección que quieres cargar perezosamente.
// Por ejemplo, si tienes un módulo 'admin', asegúrate de que sea un NgModule.
// ng generate module admin --route admin --module app.module
// Esto creará un módulo 'admin' con su propio archivo de enrutamiento (admin-routing.module.ts)
// y lo configurará para lazy loading en app-routing.module.ts.

// 2. En tu archivo de enrutamiento principal (app-routing.module.ts):
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

// NO importes AdminModule directamente aquí. En su lugar, usa loadChildren.
// import { AdminModule } from './admin/admin.module'; // ¡Incorrecto para Lazy Loading!

const routes: Routes = [
  { path: '', redirectTo: '/home', pathMatch: 'full' },
  { path: 'home', component: HomeComponent },
  {
    // Carga perezosa del módulo 'admin'
    path: 'admin',
    loadChildren: () => import('./admin/admin.module').then(m => m.AdminModule)
  },
  { path: '**', component: NotFoundComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

// 3. En el módulo que se cargará perezosamente (ej. admin/admin.module.ts):
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AdminDashboardComponent } from './admin-dashboard/admin-dashboard.component';
import { AdminRoutingModule } from './admin-routing.module'; // Su propio enrutamiento

@NgModule({
  declarations: [
    AdminDashboardComponent
  ],
  imports: [
    CommonModule,
    AdminRoutingModule // Importa su propio módulo de enrutamiento
  ]
})
export class AdminModule { }

// 4. En el archivo de enrutamiento del módulo perezoso (admin/admin-routing.module.ts):
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AdminDashboardComponent } from './admin-dashboard/admin-dashboard.component';

const routes: Routes = [
  { path: '', component: AdminDashboardComponent } // Ruta por defecto para /admin
];

@NgModule({
  imports: [RouterModule.forChild(routes)], // Usa forChild para módulos hijos
  exports: [RouterModule]
})
export class AdminRoutingModule { }

/*
Un error común es intentar importar el módulo perezoso directamente en el AppModule.
Si lo haces, el módulo se cargará eager (al inicio), anulando el propósito del lazy loading.
Asegúrate de usar `loadChildren` y la sintaxis `import().then()` para los módulos perezosos.
Otro error es olvidar usar `RouterModule.forChild(routes)` en los módulos de enrutamiento hijos.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Enrutamiento y Navegación',
    'topic': 'Lazy Loading',
    'subtopic': 'Beneficios y consideraciones',
    'definition': r'''
Ya sabes que el Lazy Loading es una herramienta poderosa para optimizar el rendimiento de tu aplicación Angular. Pero, ¿cuáles son exactamente sus beneficios y qué cosas deberías tener en cuenta al usarlo? Es importante entender el panorama completo para aplicarlo de la mejor manera.

Esto tiene una explicación, y es que el principal **beneficio** es la **reducción del tiempo de carga inicial** de la aplicación. Al cargar solo el código que el usuario necesita de inmediato, la aplicación se vuelve más rápida y responsiva, lo que se traduce en una mejor experiencia de usuario. Esto es especialmente crítico para usuarios con conexiones lentas o dispositivos de baja potencia. Además, al dividir tu aplicación en módulos más pequeños, el Lazy Loading también ayuda a **organizar mejor tu código**, haciendo que proyectos grandes sean más manejables y fáciles de mantener para equipos de desarrollo. Cada módulo perezoso es un bloque funcional autónomo.

Ahora, hablemos de las **consideraciones**:
* **Tiempo de carga del módulo:** Aunque el inicio es más rápido, habrá un pequeño retraso la primera vez que un usuario acceda a una ruta de un módulo perezoso, ya que el navegador necesitará descargar el código. Sin embargo, este retraso suele ser menor que el de cargar todo al inicio.
* **Complejidad en el enrutamiento:** El enrutamiento se vuelve un poco más complejo, ya que necesitas definir rutas para los módulos perezosos y sus propios archivos de enrutamiento con `forChild`.
* **Manejo de servicios:** Los servicios que son `providedIn: 'root'` se cargan globalmente, pero si un servicio solo lo necesita un módulo perezoso, es mejor proveerlo dentro de ese módulo para que se cargue también de forma perezosa.
* **Estrategias de precarga:** Para mitigar el pequeño retraso, puedes usar estrategias de precarga (como `PreloadAllModules` o una personalizada) que precargan módulos en segundo plano después del inicio inicial.

En resumen, el Lazy Loading es una técnica de optimización que mejora significativamente la experiencia del usuario, pero requiere una planificación cuidadosa de la estructura de tus módulos y rutas.
''',
    'code_example': r'''
// No hay un ejemplo de código directo para "Beneficios y Consideraciones"
// ya que es más un concepto. Sin embargo, para recalcar, aquí hay un recordatorio
// de cómo se vería una ruta con lazy loading:

// app-routing.module.ts
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { PreloadAllModules } from '@angular/router'; // Importar si se usa

const routes: Routes = [
  { path: '', redirectTo: '/home', pathMatch: 'full' },
  { path: 'home', component: HomeComponent },
  {
    // Este es el punto clave del lazy loading:
    // El módulo 'admin' solo se cargará cuando se acceda a la ruta '/admin'.
    path: 'admin',
    loadChildren: () => import('./admin/admin.module').then(m => m.AdminModule)
  },
  { path: '**', component: NotFoundComponent }
];

@NgModule({
  imports: [
    RouterModule.forRoot(routes, {
      // Opcional: para precargar todos los módulos lazy después del arranque inicial
      // preloadingStrategy: PreloadAllModules
    })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule { }

/*
Consideración clave: Si tu aplicación es muy pequeña y no esperas que crezca mucho,
el overhead de organizar módulos para lazy loading podría no valer la pena.
Pero para cualquier aplicación que crezca más allá de unas pocas páginas,
el lazy loading es casi siempre la mejor opción para el rendimiento.

Un error común es intentar aplicar lazy loading a un componente individual.
El lazy loading se aplica a MÓDULOS, no directamente a componentes.
El módulo es la unidad que se carga perezosamente.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Enrutamiento y Navegación',
    'topic': 'Lazy Loading',
    'subtopic': 'Organización de módulos para Lazy Loading',
    'definition': r'''
Para implementar el Lazy Loading de forma efectiva, la clave está en cómo organizas los módulos en tu aplicación Angular. Una buena estructura modular es fundamental para que el enrutador pueda cargar solo las partes necesarias de tu aplicación cuando el usuario las solicite.

No sé tú, pero a mí esto al principio me costó. 

La idea principal es que cada "característica" o "sección" significativa de tu aplicación tenga su propio módulo. Pensemos por un momento en una aplicación de gestión de tareas. Podrías tener un `TasksModule` para todo lo relacionado con las tareas, un `UsersModule` para la gestión de usuarios, y un `AuthModule` para la autenticación. Cada uno de estos módulos debería ser un `NgModule` con sus propios componentes, servicios, directivas y, crucialmente, su propio archivo de enrutamiento (`.module.ts` y `.routing.module.ts` respectivamente). El módulo raíz de tu aplicación (`AppModule`) solo se encargaría de cargar los módulos perezosos a través de sus rutas, utilizando la propiedad `loadChildren`. Es importante que los módulos perezosos no sean importados directamente por el `AppModule` (o cualquier otro módulo que se cargue al inicio), ya que eso anularía el efecto del Lazy Loading. Además, los módulos perezosos deben usar `RouterModule.forChild()` en sus propios archivos de enrutamiento, en lugar de `forRoot()`, que solo se usa en el módulo de enrutamiento raíz. Al seguir esta organización, tu aplicación se dividirá en trozos más pequeños, que se cargarán de forma asíncrona, mejorando significativamente el rendimiento y facilitando el mantenimiento a largo plazo.
''',
    'code_example': r'''
// 1. Estructura de carpetas recomendada para módulos perezosos:
/*
src/app/
├── app-routing.module.ts
├── app.module.ts
├── core/             // Módulo Core (servicios globales, singletons)
│   ├── core.module.ts
│   └── auth.service.ts
├── shared/           // Módulo Shared (componentes, directivas, pipes reutilizables)
│   ├── shared.module.ts
│   └── custom-button/custom-button.component.ts
├── home/             // Módulo de Característica 1 (Lazy Loaded)
│   ├── home-routing.module.ts
│   ├── home.module.ts
│   └── home.component.ts
├── admin/            // Módulo de Característica 2 (Lazy Loaded)
│   ├── admin-routing.module.ts
│   ├── admin.module.ts
│   └── dashboard/dashboard.component.ts
└── ...
*/

// 2. app-routing.module.ts (para el módulo raíz):
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  { path: '', redirectTo: '/home', pathMatch: 'full' },
  { path: 'home', loadChildren: () => import('./home/home.module').then(m => m.HomeModule) },
  { path: 'admin', loadChildren: () => import('./admin/admin.module').then(m => m.AdminModule) },
  // ... otras rutas de carga perezosa
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

// 3. home/home.module.ts (ejemplo de un módulo perezoso):
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HomeRoutingModule } from './home-routing.module';
import { HomeComponent } from './home.component';
import { SharedModule } from '../shared/shared.module'; // Puedes importar módulos compartidos

@NgModule({
  declarations: [
    HomeComponent
  ],
  imports: [
    CommonModule,
    HomeRoutingModule,
    SharedModule // Importa SharedModule aquí para usar sus componentes/directivas
  ]
})
export class HomeModule { }

// 4. home/home-routing.module.ts (enrutamiento del módulo perezoso):
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home.component';

const routes: Routes = [
  { path: '', component: HomeComponent } // Ruta por defecto para /home
];

@NgModule({
  imports: [RouterModule.forChild(routes)], // Usa forChild
  exports: [RouterModule]
})
export class HomeRoutingModule { }

/*
Un error común es que un módulo cargado perezosamente intente importar un módulo
que también se carga perezosamente en otro lugar. Esto puede causar problemas de bundling.
También, asegúrate de que los servicios que son específicos de un módulo perezoso se provean
dentro de ese módulo, no globalmente (`providedIn: 'root'`) si no quieres que se carguen al inicio.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Enrutamiento y Navegación',
    'topic': 'Navegación Programática',
    'subtopic': 'Uso del Router para navegación',
    'definition': r'''
Hasta ahora, hemos visto cómo navegar usando el atributo `routerLink` en tus plantillas HTML. Pero, ¿qué pasa si necesitas navegar a una ruta después de que un usuario ha completado un formulario, o después de una acción asíncrona como una llamada a una API? Para estos escenarios, Angular te ofrece la "navegación programática" usando el servicio `Router`.

¿Te preguntas por qué esto importa?

Aquí te va la aclaración: Pensemos por un momento en un flujo de autenticación. Después de que un usuario ingresa sus credenciales y el servidor las valida, no vas a pedirle que haga clic en un `routerLink` para ir al dashboard. En su lugar, querrás redirigirlo automáticamente. El servicio `Router` te permite hacer esto desde tu código TypeScript. Puedes inyectar el `Router` en cualquier componente o servicio, y luego usar sus métodos como `Maps()` o `MapsByUrl()`. `Maps()` es más flexible, ya que te permite pasar un array de segmentos de ruta, lo que es útil para construir rutas dinámicas con parámetros. `MapsByUrl()` es más directo, tomando una URL completa como un string. La navegación programática es indispensable para crear experiencias de usuario fluidas y para controlar el flujo de la aplicación basándose en la lógica de tu negocio, no solo en clics directos del usuario. Te da el poder de llevar al usuario a donde necesite ir, en el momento preciso.
''',
    'code_example': r'''
// 1. Importa el servicio Router en tu componente:
import { Component } from '@angular/core';
import { Router } from '@angular/router'; // Importa el servicio Router

@Component({
  selector: 'app-dashboard',
  template: `
    <h2>Dashboard</h2>
    <button (click)="irAProductos()">Ir a Productos</button>
    <button (click)="irADetalleProducto(123)">Ver Producto 123</button>
    <button (click)="irAAdminConParametros()">Ir a Admin con Query Params</button>
  `
})
export class DashboardComponent {
  constructor(private router: Router) { } // Inyecta el servicio Router

  irAProductos(): void {
    // Navegación simple a una ruta sin parámetros
    this.router.navigate(['/products']);
  }

  irADetalleProducto(id: number): void {
    // Navegación a una ruta con un parámetro de ruta
    this.router.navigate(['/products', id]); // Genera una URL como /products/123
  }

  irAAdminConParametros(): void {
    // Navegación con parámetros de consulta (query parameters)
    this.router.navigate(['/admin'], {
      queryParams: {
        page: 2,
        sort: 'name'
      },
      fragment: 'top' // Opcional: para ir a un fragmento específico en la página
    });
    // Genera una URL como /admin?page=2&sort=name#top
  }

  // Ejemplo de navegación incorrecta (sin el servicio Router)
  // No puedes simplemente llamar a una ruta como si fuera una función:
  // irAContacto() {
  //   '/contact'; // Esto no hará nada
  // }
}

/*
Un error común es intentar manipular la URL directamente con JavaScript (ej. window.location.href).
Esto evita que el enrutador de Angular maneje la navegación, lo que podría causar problemas
con la detección de cambios de ruta y el ciclo de vida de los componentes.
Siempre usa el servicio `Router` de Angular para la navegación.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Enrutamiento y Navegación',
    'topic': 'Navegación Programática',
    'subtopic': 'Manejo de parámetros de consulta',
    'definition': r'''
Además de los parámetros de ruta que ya vimos (esos que van en la URL como `/users/123`), en la navegación web también existen los "parámetros de consulta" o "query parameters". Son esos pares clave-valor que ves después del signo de interrogación en la URL, como `/products?category=electronics&price_min=100`. Angular tiene una forma elegante de manejarlos, tanto para agregarlos al navegar como para leerlos desde el componente.

Aquí te va la aclaración: Los parámetros de consulta son muy útiles para filtrar o clasificar contenido sin cambiar la estructura fundamental de la ruta. Pensemos por un momento en una página de búsqueda de productos. La ruta base podría ser `/search`, pero los filtros de búsqueda (categoría, precio, orden) se pasarían como parámetros de consulta. Esto permite que la misma página `SearchComponent` se comporte de manera diferente según los filtros aplicados. Para añadir parámetros de consulta al navegar programáticamente, pasas un objeto `queryParams` al método `Maps()` del servicio `Router`. Y para leerlos desde un componente, inyectas `ActivatedRoute` y te suscribes a su `queryParamMap`. La ventaja de `queryParamMap` es que te proporciona los parámetros como un `ParamMap`, que es inmutable y fácil de usar, y te permite reaccionar a los cambios en los parámetros sin recargar el componente. Manejar correctamente los parámetros de consulta es esencial para crear aplicaciones web dinámicas y con capacidades de búsqueda y filtrado robustas.
''',
    'code_example': r'''
// 1. En el componente que inicia la navegación (ej. search-form.component.ts):
import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-search-form',
  template: `
    <input [(ngModel)]="searchTerm" placeholder="Buscar...">
    <select [(ngModel)]="selectedCategory">
      <option value="electronics">Electrónica</option>
      <option value="books">Libros</option>
    </select>
    <button (click)="buscar()">Buscar</button>
  `
})
export class SearchFormComponent {
  searchTerm: string = '';
  selectedCategory: string = 'electronics';

  constructor(private router: Router) { }

  buscar(): void {
    this.router.navigate(['/search'], {
      queryParams: {
        q: this.searchTerm,
        category: this.selectedCategory,
        // Añadir lógica para limpiar parámetros vacíos si es necesario
        ...(this.searchTerm ? { q: this.searchTerm } : {}),
        ...(this.selectedCategory ? { category: this.selectedCategory } : {})
      },
      queryParamsHandling: 'merge' // Para mantener otros query params existentes
    });
    // Esto generaría una URL como /search?q=laptop&category=electronics
  }
}

// 2. En el componente que recibe los parámetros (ej. search-results.component.ts):
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Subscription } from 'rxjs'; // Para manejar la suscripción

@Component({
  selector: 'app-search-results',
  template: `
    <h2>Resultados de Búsqueda</h2>
    <p>Término de búsqueda: {{ searchTerm }}</p>
    <p>Categoría: {{ category }}</p>
    <ul>
      <li *ngFor="let result of results">{{ result }}</li>
    </ul>
  `
})
export class SearchResultsComponent implements OnInit {
  searchTerm: string | null = null;
  category: string | null = null;
  results: string[] = [];
  private queryParamsSubscription: Subscription;

  constructor(private route: ActivatedRoute) { }

  ngOnInit(): void {
    // Suscribirse a los cambios en los parámetros de consulta
    this.queryParamsSubscription = this.route.queryParamMap.subscribe(params => {
      this.searchTerm = params.get('q');
      this.category = params.get('category');
      console.log(`Buscando: "${this.searchTerm}" en categoría: "${this.category}"`);
      // Aquí harías tu llamada a la API para obtener los resultados
      this.results = [`Resultado 1 para ${this.searchTerm}`, `Resultado 2 para ${this.searchTerm}`];
    });
  }

  ngOnDestroy(): void {
    // Es crucial desuscribirse para evitar fugas de memoria
    if (this.queryParamsSubscription) {
      this.queryParamsSubscription.unsubscribe();
    }
  }
}

/*
Un error común es intentar leer los query parameters directamente del `snapshot.queryParams`
si esperas que los parámetros cambien sin que el componente se destruya y recree.
Si la URL cambia solo los query parameters (ej. de /search?q=a a /search?q=b),
el componente no se reinicializa, y el `snapshot` tendría datos obsoletos.
Siempre suscríbete a `route.queryParamMap` para reaccionar a los cambios.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Enrutamiento y Navegación',
    'topic': 'Navegación Programática',
    'subtopic': 'Control de historial de navegación',
    'definition': r'''
En una aplicación web, la experiencia de navegación del usuario no solo se trata de ir de un punto A a un punto B, sino también de poder retroceder o avanzar en el historial, como lo harías con los botones del navegador. Angular, a través de su servicio `Router`, te da cierto control sobre este historial de navegación.

¿Te estás preguntando por qué esto importa?

Aquí te va la aclaración: Pensemos por un momento en un asistente de registro de múltiples pasos. Cuando el usuario completa un paso, lo navegas al siguiente. Sin embargo, no querrías que el usuario pueda usar el botón "atrás" del navegador para volver al paso anterior una vez que el paso actual ha sido validado y completado. En esos casos, es útil poder reemplazar la entrada actual en el historial del navegador en lugar de añadir una nueva. El método `Maps()` del `Router` tiene una opción llamada `replaceUrl` que, cuando se establece en `true`, le dice al navegador que reemplace la entrada actual en el historial en lugar de añadir una nueva. Esto significa que si el usuario presiona el botón "atrás", no volverá a la página que acaba de "reemplazar". Por otro lado, si solo necesitas simular el comportamiento del botón "atrás", puedes usar el método `back()` del servicio `Location` (no directamente del Router, pero trabajan juntos). `Location` es un servicio de Angular que interactúa con el historial del navegador. Comprender cómo manipular el historial de navegación es clave para crear flujos de usuario más intuitivos y seguros, especialmente en formularios multipaso o en acciones que no deberían ser "deshechas" por el botón de retroceso.
''',
    'code_example': r'''
// 1. Importa el servicio Router y Location en tu componente:
import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { Location } from '@angular/common'; // Para interactuar con el historial del navegador

@Component({
  selector: 'app-checkout-steps',
  template: `
    <h2>Paso {{ currentStep }} de Pago</h2>
    <button (click)="goToNextStep()">Siguiente Paso</button>
    <button (click)="goBack()" *ngIf="currentStep > 1">Atrás</button>
    <button (click)="confirmPurchase()">Confirmar Compra (Reemplazar URL)</button>
  `
})
export class CheckoutStepsComponent {
  currentStep: number = 1;

  constructor(private router: Router, private location: Location) { }

  goToNextStep(): void {
    this.currentStep++;
    // Navegación normal: añade una nueva entrada al historial
    this.router.navigate(['/checkout', this.currentStep]);
  }

  goBack(): void {
    // Simula el botón "atrás" del navegador
    this.location.back();
  }

  confirmPurchase(): void {
    // Cuando la compra se confirma, no queremos que el usuario pueda volver
    // fácilmente al paso anterior con el botón de atrás del navegador.
    // Usamos `replaceUrl: true` para reemplazar la entrada actual del historial.
    this.router.navigate(['/order-confirmation', 123], { replaceUrl: true });
    // URL será /order-confirmation/123. Si presiona atrás, no volverá a /checkout.
  }

  // En un escenario real, la ruta de checkout sería dinámica:
  // this.router.navigate(['/checkout', this.currentStep], { replaceUrl: true });
}

/*
Un error común es usar `window.history.back()` o `window.history.pushState()`
directamente. Aunque funcionan, Angular tiene sus propios servicios (`Router`, `Location`)
que están integrados con su sistema de enrutamiento y detección de cambios.
Usar los servicios de Angular es la forma recomendada y segura.
*/
'''
  });
}

Future<void> insertAngularJrLevel3Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Formularios y Validaciones',
    'topic': 'Formularios Reactivos',
    'subtopic': 'Creación de formularios con FormBuilder',
    'definition': r'''
Cuando hablamos de formularios en Angular, existen dos enfoques principales: los formularios basados en plantillas y los formularios reactivos. Para proyectos más complejos y escalables, los formularios reactivos son la opción preferida, y la herramienta estrella para crearlos es `FormBuilder`.

Seguramente pensarás de qué va todo esto... 

Pues, `FormBuilder` es un servicio de Angular que simplifica enormemente la creación de instancias de `FormControl`, `FormGroup` y `FormArray`. En lugar de tener que crear cada `FormControl` (que representa un campo de tu formulario) uno por uno y luego agruparlos manualmente en un `FormGroup` (que representa el formulario completo), `FormBuilder` te permite definir la estructura de tu formulario de una manera más concisa y legible, casi como si estuvieras escribiendo un JSON. Esto es genial porque te permite definir la estructura de tu formulario directamente en tu código TypeScript, lo que te da un control total y reactivo sobre cada campo, su valor, su estado de validación, etc. Pensemos por un momento en un formulario de registro de usuario con muchos campos: nombre, email, contraseña, confirmación de contraseña, dirección, etc. Sin `FormBuilder`, el código para inicializar todos esos `FormControl` y `FormGroup` podría ser bastante verboso. Con `FormBuilder`, se vuelve mucho más elegante y fácil de manejar, permitiéndote concentrarte en la lógica de validación y envío de datos.
''',
    'code_example': r'''
// 1. Importa ReactiveFormsModule y FormBuilder en tu módulo (ej. app.module.ts):
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { ReactiveFormsModule } from '@angular/forms'; // Importa este módulo
import { AppComponent } from './app.component';
import { UserFormComponent } from './user-form/user-form.component';

@NgModule({
  declarations: [
    AppComponent,
    UserFormComponent
  ],
  imports: [
    BrowserModule,
    ReactiveFormsModule // Añade a los imports
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

// 2. En tu componente (ej. user-form/user-form.component.ts):
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms'; // Importa FormBuilder, FormGroup, Validators

@Component({
  selector: 'app-user-form',
  template: `
    <form [formGroup]="userForm" (ngSubmit)="onSubmit()">
      <div>
        <label for="name">Nombre:</label>
        <input id="name" type="text" formControlName="name">
        <div *ngIf="userForm.get('name')?.invalid && userForm.get('name')?.touched">
          El nombre es obligatorio.
        </div>
      </div>

      <div>
        <label for="email">Email:</label>
        <input id="email" type="email" formControlName="email">
        <div *ngIf="userForm.get('email')?.invalid && userForm.get('email')?.touched">
          <span *ngIf="userForm.get('email')?.errors?.['required']">El email es obligatorio.</span>
          <span *ngIf="userForm.get('email')?.errors?.['email']">Debe ser un email válido.</span>
        </div>
      </div>

      <button type="submit" [disabled]="userForm.invalid">Registrar</button>
    </form>

    <p>Estado del formulario: {{ userForm.status }}</p>
    <p>Valor del formulario: {{ userForm.value | json }}</p>
  `
})
export class UserFormComponent implements OnInit {
  userForm: FormGroup;

  constructor(private fb: FormBuilder) { } // Inyecta FormBuilder

  ngOnInit(): void {
    // Usamos FormBuilder.group() para crear el FormGroup
    this.userForm = this.fb.group({
      // Cada clave es el nombre del FormControl, y el valor es un array:
      // [valorInicial, [validador1, validador2, ...]]
      name: ['', Validators.required],
      email: ['', [Validators.required, Validators.email]]
    });
  }

  onSubmit(): void {
    if (this.userForm.valid) {
      console.log('Formulario enviado:', this.userForm.value);
      // Aquí enviarías los datos a un servicio
    } else {
      console.log('Formulario inválido.');
      // Opcional: Marcar todos los campos como 'touched' para mostrar errores
      this.userForm.markAllAsTouched();
    }
  }
}

/*
Un error común es olvidar importar 'ReactiveFormsModule' en tu NgModule.
Si no lo importas, Angular no reconocerá las directivas de formularios reactivos
como '[formGroup]' o 'formControlName', y tu aplicación no funcionará correctamente.
Otro error es no inyectar 'FormBuilder' en el constructor del componente.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Formularios y Validaciones',
    'topic': 'Formularios Reactivos',
    'subtopic': 'Validaciones síncronas y asíncronas',
    'definition': r'''
Las validaciones son el alma de cualquier formulario. No querrás que los usuarios envíen datos incompletos o incorrectos, ¿verdad? En Angular, con los formularios reactivos, tienes la flexibilidad de implementar validaciones tanto síncronas como asíncronas, lo que te permite cubrir casi cualquier escenario de validación.

¿Te estás preguntando por qué esto importa?

Aquí te va la aclaración: Pensemos por un momento en las **validaciones síncronas**. Estas son las más comunes y se ejecutan de inmediato. Por ejemplo, `Validators.required` verifica si un campo no está vacío, `Validators.email` verifica si el formato es de correo electrónico, o `Validators.minLength` y `maxLength` para la longitud. Se definen directamente en el array de validadores cuando creas tu `FormControl` con `FormBuilder`. Son rápidas y se ejecutan cada vez que el valor del campo cambia. Por otro lado, las **validaciones asíncronas** son para escenarios donde necesitas verificar algo que toma tiempo, como consultar una base de datos o una API para ver si un nombre de usuario ya está tomado. Estas validaciones no bloquean la interfaz de usuario, y su resultado no es inmediato. Se definen en un segundo array (después de las validaciones síncronas) cuando creas tu `FormControl`. Angular esperará a que la promesa o el observable de tu validador asíncrono se resuelva para determinar la validez del campo. Esto es súper potente porque te permite crear validaciones complejas que dependen de factores externos, como la disponibilidad de un usuario, sin afectar la fluidez de la interacción del usuario con el formulario. Ambos tipos de validadores actualizan el estado de tu `FormControl` (válido, inválido, pendiente), lo que te permite mostrar mensajes de error apropiados al usuario.
''',
    'code_example': r'''
// 1. Importa los validadores necesarios:
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators, AbstractControl, ValidationErrors } from '@angular/forms';
import { Observable, of, timer } from 'rxjs';
import { map, switchMap, debounceTime, take } from 'rxjs/operators';

@Component({
  selector: 'app-validation-form',
  template: `
    <form [formGroup]="userForm" (ngSubmit)="onSubmit()">
      <div>
        <label for="username">Nombre de Usuario:</label>
        <input id="username" type="text" formControlName="username">
        <div *ngIf="userForm.get('username')?.invalid && userForm.get('username')?.touched">
          <span *ngIf="userForm.get('username')?.errors?.['required']">El nombre de usuario es obligatorio.</span>
          <span *ngIf="userForm.get('username')?.errors?.['minlength']">Mínimo 3 caracteres.</span>
          <span *ngIf="userForm.get('username')?.errors?.['usernameTaken']">Este nombre de usuario ya está en uso.</span>
        </div>
        <div *ngIf="userForm.get('username')?.pending">Verificando disponibilidad...</div>
      </div>

      <div>
        <label for="password">Contraseña:</label>
        <input id="password" type="password" formControlName="password">
        <div *ngIf="userForm.get('password')?.invalid && userForm.get('password')?.touched">
          La contraseña es obligatoria y debe tener al menos 6 caracteres.
        </div>
      </div>

      <button type="submit" [disabled]="userForm.invalid || userForm.pending">Registrar</button>
    </form>

    <p>Estado del formulario: {{ userForm.status }}</p>
  `
})
export class ValidationFormComponent implements OnInit {
  userForm: FormGroup;

  constructor(private fb: FormBuilder) { }

  ngOnInit(): void {
    this.userForm = this.fb.group({
      // [valorInicial, [validadores_sincronos], [validadores_asincronos]]
      username: ['',
        [Validators.required, Validators.minLength(3)],
        [this.usernameValidator.bind(this)] // 'bind(this)' para mantener el contexto
      ],
      password: ['', [Validators.required, Validators.minLength(6)]]
    });
  }

  // Validador asíncrono de ejemplo: simula una llamada a API
  // Verifica si el nombre de usuario 'admin' ya está tomado
  usernameValidator(control: AbstractControl): Observable<ValidationErrors | null> {
    // Retraso para simular llamada de red
    return timer(500).pipe(
      map(() => {
        const username = control.value;
        if (username === 'admin') {
          return { usernameTaken: true }; // Error: nombre de usuario tomado
        }
        return null; // Válido
      }),
      take(1) // Toma el primer valor y completa
    );
  }

  onSubmit(): void {
    if (this.userForm.valid) {
      console.log('Formulario enviado:', this.userForm.value);
    } else {
      console.log('Formulario inválido o pendiente.');
      this.userForm.markAllAsTouched(); // Para mostrar errores
    }
  }
}

/*
Un error común es olvidar que los validadores asíncronos deben devolver
un `Observable<ValidationErrors | null>` o `Promise<ValidationErrors | null>`.
Si no lo hacen, Angular no esperará por su resultado.
Otro error es no manejar el estado 'pending' del formulario/control mientras un validador asíncrono está en curso.
Esto es importante para deshabilitar el botón de envío y dar feedback al usuario.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Formularios y Validaciones',
    'topic': 'Formularios Reactivos',
    'subtopic': 'Manejo del estado del formulario',
    'definition': r'''
En los formularios reactivos de Angular, no solo te preocupas por el valor de los campos, sino también por su "estado". Este estado es súper importante porque te permite saber qué está haciendo el usuario con el formulario y cómo debes reaccionar, por ejemplo, mostrando mensajes de error.

Esto tiene una explicación, y es porque cada `FormControl`, `FormGroup` y `FormArray` en Angular tiene propiedades de estado que te dan información clave:
* `value`: Es el valor actual del campo o del formulario. Esto es lo que envías al servidor.
* `status`: Te dice el estado de validación global. Puede ser `'VALID'`, `'INVALID'`, o `'PENDING'` (si hay validadores asíncronos en curso).
* `valid`: Un booleano que es `true` si el control o formulario es válido.
* `invalid`: Un booleano que es `true` si el control o formulario es inválido.
* `dirty`: `true` si el usuario ha cambiado el valor del campo desde su inicialización. Es decir, el usuario ha interactuado con él y lo ha modificado.
* `pristine`: Lo opuesto a `dirty`. `true` si el usuario *no* ha cambiado el valor.
* `touched`: `true` si el campo ha sido visitado o ha perdido el foco. Útil para mostrar errores solo después de que el usuario interactuó con el campo.
* `untouched`: Lo opuesto a `touched`. `true` si el campo *no* ha sido visitado.
* `errors`: Un objeto que contiene los errores de validación actuales, si los hay.

Pensemos por un momento en un formulario de registro. No querrías mostrar un mensaje de "Campo obligatorio" tan pronto como el formulario carga. Lo ideal es mostrarlo solo después de que el usuario ha interactuado con el campo (estado `touched`) y este sigue estando vacío (`invalid`). Estas propiedades de estado te dan el control granular para mejorar la experiencia del usuario y hacer que tus validaciones sean inteligentes y no intrusivas.
''',
    'code_example': r'''
// En tu componente (ej. registration-form.component.ts):
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-registration-form',
  template: `
    <form [formGroup]="registrationForm" (ngSubmit)="onSubmit()">
      <div>
        <label for="username">Nombre de Usuario:</label>
        <input id="username" type="text" formControlName="username">
        <div *ngIf="registrationForm.get('username')?.invalid && registrationForm.get('username')?.touched">
          <span *ngIf="registrationForm.get('username')?.errors?.['required']" style="color: red;">
            El nombre de usuario es obligatorio.
          </span>
        </div>
      </div>

      <div>
        <label for="password">Contraseña:</label>
        <input id="password" type="password" formControlName="password">
        <div *ngIf="registrationForm.get('password')?.invalid && registrationForm.get('password')?.touched">
          <span *ngIf="registrationForm.get('password')?.errors?.['required']" style="color: red;">
            La contraseña es obligatoria.
          </span>
          <span *ngIf="registrationForm.get('password')?.errors?.['minlength']" style="color: red;">
            La contraseña debe tener al menos 6 caracteres.
          </span>
        </div>
      </div>

      <button type="submit" [disabled]="registrationForm.invalid">Registrar</button>
    </form>

    <hr>
    <h3>Estado del Formulario (debug):</h3>
    <p>Formulario Válido: {{ registrationForm.valid }}</p>
    <p>Formulario Sucio (Dirty): {{ registrationForm.dirty }}</p>
    <p>Campo 'username' Válido: {{ registrationForm.get('username')?.valid }}</p>
    <p>Campo 'username' Tocado (Touched): {{ registrationForm.get('username')?.touched }}</p>
    <p>Errores del campo 'password': {{ registrationForm.get('password')?.errors | json }}</p>
  `
})
export class RegistrationFormComponent implements OnInit {
  registrationForm: FormGroup;

  constructor(private fb: FormBuilder) { }

  ngOnInit(): void {
    this.registrationForm = this.fb.group({
      username: ['', [Validators.required]],
      password: ['', [Validators.required, Validators.minLength(6)]]
    });
  }

  onSubmit(): void {
    if (this.registrationForm.valid) {
      console.log('Registro exitoso:', this.registrationForm.value);
    } else {
      console.log('Formulario inválido. Revise los errores.');
      // Opcional: Marcar todos los campos como 'touched' para forzar la visualización de errores
      this.registrationForm.markAllAsTouched();
    }
  }
}

/*
Un error común es mostrar los mensajes de error tan pronto como la página carga,
incluso antes de que el usuario interactúe con el campo.
Esto se evita usando la combinación de `invalid` y `touched` (o `dirty`) en tus `*ngIf`
para controlar cuándo aparecen los mensajes de error.
`*ngIf="formControl.invalid && formControl.touched"` es un patrón muy común y efectivo.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Formularios y Validaciones',
    'topic': 'Formularios Basados en Plantillas',
    'subtopic': 'Uso de ngModel para enlace bidireccional',
    'definition': r'''
Mientras que los formularios reactivos son ideales para la complejidad, a veces solo necesitas un formulario sencillo, sin mucha lógica programática. Para esos casos, los formularios basados en plantillas son una excelente opción, y su corazón es la directiva `ngModel`, que te permite lograr un "enlace de datos bidireccional" de una manera muy intuitiva.

¿Te estás preguntando por qué esto importa?

Aquí te va la explicación: `ngModel` es la estrella aquí. Permite que el valor de un elemento de formulario (como un `input` o `textarea`) y una propiedad en tu componente TypeScript estén siempre sincronizados. Si el usuario escribe algo en el `input`, la propiedad en tu componente se actualiza automáticamente. Y si tú cambias la propiedad en tu componente, el valor del `input` se actualiza en la plantilla. Pensemos por un momento en un campo de nombre de usuario donde quieres mostrar instantáneamente lo que el usuario está escribiendo en algún otro lugar de la página. Con `ngModel`, simplemente enlazas el `input` a una propiedad de tu componente usando la sintaxis `[(ngModel)]="miPropiedad"`. Angular se encarga de toda la magia detrás de escena. Esto es extremadamente conveniente para formularios pequeños o cuando la mayor parte de la lógica de validación puede manejarse con atributos HTML. A diferencia de los formularios reactivos, donde defines la estructura en el TypeScript, con los formularios basados en plantillas, la mayor parte de la configuración del formulario (incluidas las validaciones) se realiza directamente en el HTML de tu plantilla, lo que los hace más declarativos y a menudo más rápidos de configurar para escenarios simples.
''',
    'code_example': r'''
// 1. Importa FormsModule en tu módulo (ej. app.module.ts):
// Esto es CRUCIAL para que ngModel y otras directivas de formularios de plantilla funcionen.
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms'; // Importa este módulo
import { AppComponent } from './app.component';
import { SimpleFormComponent } from './simple-form/simple-form.component';

@NgModule({
  declarations: [
    AppComponent,
    SimpleFormComponent
  ],
  imports: [
    BrowserModule,
    FormsModule // Añade a los imports
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

// 2. En tu componente (ej. simple-form/simple-form.component.ts):
import { Component } from '@angular/core';

@Component({
  selector: 'app-simple-form',
  template: `
    <form #heroForm="ngForm" (ngSubmit)="onSubmit(heroForm)">
      <div>
        <label for="name">Nombre:</label>
        <input type="text" id="name" name="name" [(ngModel)]="hero.name" required #nameField="ngModel">
        
        <p>Estado del campo 'name': {{ nameField.valid }} | {{ nameField.dirty }} | {{ nameField.touched }}</p>

        <div *ngIf="nameField.invalid && (nameField.dirty || nameField.touched)" style="color: red;">
          El nombre es obligatorio.
        </div>
      </div>

      <div>
        <label for="alterEgo">Alter Ego:</label>
        <input type="text" id="alterEgo" name="alterEgo" [(ngModel)]="hero.alterEgo">
      </div>

      <button type="submit" [disabled]="!heroForm.valid">Enviar</button>
    </form>

    <hr>
    <h3>Valor del formulario (debug):</h3>
    <p>{{ hero | json }}</p>
    <h3>Estado del formulario (debug):</h3>
    <p>Formulario Válido: {{ heroForm.valid }}</p>
    <p>Formulario Sucio (Dirty): {{ heroForm.dirty }}</p>
  `
})
export class SimpleFormComponent {
  hero = {
    name: '',
    alterEgo: ''
  };

  onSubmit(form: any): void {
    if (form.valid) {
      console.log('Formulario enviado:', this.hero);
      // Aquí enviarías los datos a un servicio
    } else {
      console.log('Formulario inválido.');
    }
  }
}

/*
Un error común es olvidar importar `FormsModule` en tu módulo.
Si no lo importas, `[(ngModel)]` no funcionará y obtendrás errores en la consola.
Otro error es no incluir el atributo `name` en los inputs con `ngModel`.
Aunque HTML5 lo hace opcional para algunos inputs, para `ngModel` es necesario
porque lo usa para registrar el control dentro del `ngForm` padre.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Formularios y Validaciones',
    'topic': 'Formularios Basados en Plantillas',
    'subtopic': 'Validaciones con atributos HTML5',
    'definition': r'''
Una de las grandes ventajas de los formularios basados en plantillas en Angular es que puedes aprovechar las validaciones integradas de HTML5 directamente en tu markup. Esto hace que las validaciones simples sean increíblemente rápidas y fáciles de implementar, sin necesidad de escribir código TypeScript adicional.

Aquí te va la aclaración: Pensemos por un momento en un campo de correo electrónico que necesita ser obligatorio y tener un formato válido. En lugar de escribir lógica de validación compleja en TypeScript, puedes añadir simplemente los atributos `required` y `type="email"` al `input` en tu HTML. Angular, junto con `ngModel`, es lo suficientemente inteligente como para detectar estos atributos HTML5 y aplicar las validaciones correspondientes automáticamente. El input se marcará como inválido si no cumple con la condición. Otros atributos HTML5 útiles incluyen `minlength`, `maxlength`, `pattern` (para expresiones regulares), `min`, `max`, y `step` para campos numéricos. Esto es muy conveniente para prototipos rápidos o para formularios con requisitos de validación básicos. Sin embargo, es importante recordar que estas validaciones son principalmente del lado del cliente. Para una seguridad robusta, siempre debes replicar las validaciones importantes en el lado del servidor, ya que los usuarios pueden deshabilitar el JavaScript o manipular el HTML. Pero para dar un feedback instantáneo y mejorar la usabilidad, las validaciones HTML5 son una herramienta excelente y sencilla de usar en tus formularios basados en plantillas.
''',
    'code_example': r'''
// En tu componente (ej. registration-template-form/registration-template-form.component.ts):
import { Component } from '@angular/core';

@Component({
  selector: 'app-registration-template-form',
  template: `
    <form #userForm="ngForm" (ngSubmit)="onSubmit(userForm)">
      <div>
        <label for="username">Nombre de Usuario:</label>
        <input type="text" id="username" name="username"
               [(ngModel)]="user.username"
               required           minlength="4"      #usernameField="ngModel"> <div *ngIf="usernameField.invalid && (usernameField.dirty || usernameField.touched)" style="color: red;">
          <span *ngIf="usernameField.errors?.['required']">El nombre de usuario es obligatorio.</span>
          <span *ngIf="usernameField.errors?.['minlength']">Mínimo {{usernameField.errors?.['minlength']?.requiredLength}} caracteres.</span>
        </div>
      </div>

      <div>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email"
               [(ngModel)]="user.email"
               required           pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" #emailField="ngModel">
        
        <div *ngIf="emailField.invalid && (emailField.dirty || emailField.touched)" style="color: red;">
          <span *ngIf="emailField.errors?.['required']">El email es obligatorio.</span>
          <span *ngIf="emailField.errors?.['pattern']">El formato del email no es válido.</span>
        </div>
      </div>

      <button type="submit" [disabled]="!userForm.valid">Registrar</button>
    </form>

    <p>Estado del formulario: {{ userForm.valid ? 'Válido' : 'Inválido' }}</p>
  `
})
export class RegistrationTemplateFormComponent {
  user = {
    username: '',
    email: ''
  };

  onSubmit(form: any): void {
    if (form.valid) {
      console.log('Usuario registrado:', this.user);
    } else {
      console.log('Formulario con errores.');
    }
  }
}

/*
Un error común es asumir que las validaciones HTML5 son suficientes para la seguridad.
Siempre se deben realizar validaciones en el lado del servidor también,
ya que las validaciones del lado del cliente pueden ser eludidas.
Otro error es olvidar el atributo `name` en los inputs; es necesario para que `ngModel`
registre los controles y las validaciones se apliquen correctamente.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Formularios y Validaciones',
    'topic': 'Formularios Basados en Plantillas',
    'subtopic': 'Manejo de errores y mensajes de validación',
    'definition': r'''
Una parte crucial de la experiencia de usuario en cualquier formulario es cómo se manejan y se muestran los mensajes de error de validación. Un buen feedback visual sobre lo que el usuario hizo mal (o lo que le falta por hacer) puede marcar la diferencia entre un formulario frustrante y uno intuitivo. En los formularios basados en plantillas de Angular, esto se logra combinando las directivas `ngModel` con `*ngIf` y el acceso a las propiedades de estado del control.

¿Te estás preguntando por qué esto importa?

Aquí te va la aclaración: Cuando usas `ngModel` en un campo de formulario, Angular crea automáticamente una instancia de `FormControl` "detrás de escena". Esta instancia tiene las mismas propiedades de estado que vimos en los formularios reactivos: `valid`, `invalid`, `dirty`, `pristine`, `touched`, `untouched`, y `errors`. Lo genial es que puedes acceder a estas propiedades directamente desde tu plantilla HTML para controlar la visibilidad de los mensajes de error. Pensemos por un momento en un campo de contraseña. Quieres que sea obligatorio y tenga una longitud mínima. Si el usuario lo deja vacío o introduce muy pocos caracteres, quieres mostrar un mensaje específico. Para lograr esto, primero "exportas" la directiva `ngModel` a una variable de plantilla local (ej. `#passwordField="ngModel"`). Luego, con `*ngIf`, puedes verificar si el campo es `invalid` y si el usuario ya lo `touched` (interactuó con él) o lo dejó `dirty` (lo modificó). Dentro de ese `*ngIf`, puedes acceder a los `errors` específicos (como `required` o `minlength`) para mostrar mensajes personalizados. Este enfoque declarativo mantiene tu lógica de visualización de errores directamente en el HTML, haciendo que los formularios sean más claros y fáciles de depurar visualmente.
''',
    'code_example': r'''
// En tu componente (ej. contact-form/contact-form.component.ts):
import { Component } from '@angular/core';

@Component({
  selector: 'app-contact-form',
  template: `
    <form #contactForm="ngForm" (ngSubmit)="onSubmit(contactForm)">
      <div>
        <label for="name">Nombre:</label>
        <input type="text" id="name" name="name"
               [(ngModel)]="contact.name"
               required
               minlength="3"
               #nameField="ngModel"> <div *ngIf="nameField.invalid && (nameField.dirty || nameField.touched)" style="color: red;">
          <span *ngIf="nameField.errors?.['required']">El nombre es obligatorio.</span>
          <span *ngIf="nameField.errors?.['minlength']">El nombre debe tener al menos 3 caracteres.</span>
        </div>
      </div>

      <div>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email"
               [(ngModel)]="contact.email"
               required
               pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$"
               #emailField="ngModel"> <div *ngIf="emailField.invalid && (emailField.dirty || emailField.touched)" style="color: red;">
          <span *ngIf="emailField.errors?.['required']">El email es obligatorio.</span>
          <span *ngIf="emailField.errors?.['pattern']">Por favor, introduce un email válido.</span>
        </div>
      </div>

      <button type="submit" [disabled]="!contactForm.valid">Enviar Mensaje</button>
    </form>
    <br>
    <p>Estado general del formulario: {{ contactForm.valid ? 'Válido' : 'Inválido' }}</p>
  `
})
export class ContactFormComponent {
  contact = {
    name: '',
    email: ''
  };

  onSubmit(form: any): void {
    if (form.valid) {
      console.log('Mensaje enviado:', this.contact);
      // Aquí enviarías los datos a un servicio
    } else {
      console.log('Formulario inválido. Revise los errores.');
      // Opcional: para forzar que todos los campos muestren sus errores al intentar enviar
      form.controls['name'].markAsTouched();
      form.controls['email'].markAsTouched();
    }
  }
}

/*
Un error común es mostrar los mensajes de error tan pronto como la página carga,
sin que el usuario haya interactuado con el campo. Esto puede ser molesto.
La solución es usar la combinación `formControl.invalid && (formControl.dirty || formControl.touched)`.
Otro error es olvidar exportar `ngModel` a una variable de plantilla (ej. `#nameField="ngModel"`),
sin esto no podrás acceder a las propiedades de estado del control en tu plantilla.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Formularios y Validaciones',
    'topic': 'Validaciones Personalizadas',
    'subtopic': 'Creación de validadores personalizados',
    'definition': r'''
Las validaciones integradas de Angular y HTML5 son geniales, pero inevitablemente te encontrarás con situaciones en las que necesitas una lógica de validación que no está disponible por defecto. Aquí es donde la "creación de validadores personalizados" se vuelve una herramienta esencial en tu arsenal de Angular.

Seguramente pensarás de qué va todo esto... 

Pues, un validador personalizado es una función o una clase que te permite implementar cualquier lógica de validación que se te ocurra, desde verificar un formato de código postal específico hasta asegurar que un campo no contenga ciertas palabras ofensivas. Estos validadores reciben un `AbstractControl` (que puede ser un `FormControl`, `FormGroup` o `FormArray`) y devuelven un objeto de errores (`ValidationErrors`) si la validación falla, o `null` si es exitosa. Pensemos por un momento en una tienda online donde los códigos de descuento deben tener un formato muy específico, por ejemplo, "DESC-XXXX" donde X son números. No hay un validador HTML5 o de Angular que haga eso. Tú crearías una función validadora que reciba el `FormControl` del código de descuento, aplique una expresión regular para verificar el formato, y si no coincide, devuelva un objeto como `{ 'invalidDiscountCode': true }`. Estos validadores pueden ser síncronos (si la lógica es inmediata) o asíncronos (si necesitan, por ejemplo, hacer una llamada a una API para verificar la unicidad de un dato). Al crear tus propios validadores, mantienes tu lógica de validación encapsulada y reutilizable, lo que hace que tus formularios sean más robustos y fáciles de mantener.
''',
    'code_example': r'''
// 1. Crear un archivo para el validador personalizado (ej. custom-validators.ts):
import { AbstractControl, ValidatorFn, ValidationErrors } from '@angular/forms';
import { Observable, timer } from 'rxjs';
import { map, take } from 'rxjs/operators';

// Validador Síncrono: Verifica si un campo no contiene la palabra 'badword'
export function forbiddenWordValidator(forbiddenWord: string): ValidatorFn {
  return (control: AbstractControl): ValidationErrors | null => {
    const value = control.value as string;
    if (value && value.toLowerCase().includes(forbiddenWord.toLowerCase())) {
      return { forbiddenWord: { value: control.value } }; // Error
    }
    return null; // Válido
  };
}

// Validador Asíncrono: Simula la verificación de disponibilidad de un email en un servidor
export function uniqueEmailValidator(delayMs: number = 500): ValidatorFn {
  return (control: AbstractControl): Promise<ValidationErrors | null> | Observable<ValidationErrors | null> => {
    const email = control.value;
    if (!email) {
      return of(null); // Si no hay email, no hay error de unicidad
    }

    // Simula una llamada a un servidor
    return timer(delayMs).pipe(
      map(() => {
        const emailsTaken = ['test@example.com', 'admin@domain.com'];
        if (emailsTaken.includes(email)) {
          return { uniqueEmail: true }; // Error: email ya tomado
        }
        return null; // Válido
      }),
      take(1) // Asegura que el observable se complete después de un valor
    );
  };
}

// 2. Usar los validadores en tu componente de formulario reactivo:
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { forbiddenWordValidator, uniqueEmailValidator } from './custom-validators'; // Importa tus validadores

@Component({
  selector: 'app-custom-validation-form',
  template: `
    <form [formGroup]="myForm" (ngSubmit)="onSubmit()">
      <div>
        <label for="message">Mensaje:</label>
        <input id="message" type="text" formControlName="message">
        <div *ngIf="myForm.get('message')?.invalid && myForm.get('message')?.touched">
          <span *ngIf="myForm.get('message')?.errors?.['forbiddenWord']" style="color: red;">
            ¡La palabra 'badword' no está permitida!
          </span>
        </div>
      </div>

      <div>
        <label for="email">Email:</label>
        <input id="email" type="email" formControlName="email">
        <div *ngIf="myForm.get('email')?.invalid && myForm.get('email')?.touched">
          <span *ngIf="myForm.get('email')?.errors?.['required']" style="color: red;">El email es obligatorio.</span>
          <span *ngIf="myForm.get('email')?.errors?.['email']" style="color: red;">Formato de email inválido.</span>
          <span *ngIf="myForm.get('email')?.errors?.['uniqueEmail']" style="color: red;">Este email ya está registrado.</span>
        </div>
        <div *ngIf="myForm.get('email')?.pending">Verificando email...</div>
      </div>

      <button type="submit" [disabled]="myForm.invalid || myForm.pending">Enviar</button>
    </form>
  `
})
export class CustomValidationFormComponent implements OnInit {
  myForm: FormGroup;

  constructor(private fb: FormBuilder) { }

  ngOnInit(): void {
    this.myForm = this.fb.group({
      message: ['', [Validators.required, forbiddenWordValidator('badword')]],
      email: ['',
        [Validators.required, Validators.email],
        [uniqueEmailValidator(800)] // Pasa un retraso al validador asíncrono
      ]
    });
  }

  onSubmit(): void {
    if (this.myForm.valid) {
      console.log('Formulario válido:', this.myForm.value);
    } else {
      console.log('Formulario inválido.');
      this.myForm.markAllAsTouched();
    }
  }
}

/*
Un error común es olvidar devolver 'null' del validador si la validación es exitosa.
Si el validador no devuelve nada o devuelve algo distinto de 'null' o un objeto de errores,
Angular no sabrá el estado de validación.

Para validadores asíncronos, es crucial que el Observable o Promise se complete
después de emitir su valor (usualmente con `take(1)` en Observables),
de lo contrario, el control permanecerá en estado 'pending'.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Formularios y Validaciones',
    'topic': 'Validaciones Personalizadas',
    'subtopic': 'Aplicación de validaciones condicionales',
    'definition': r'''
En el mundo real, los formularios no siempre son estáticos. A veces, la validación de un campo depende del valor de otro campo, o incluso de alguna lógica de negocio específica. Aquí es donde la "aplicación de validaciones condicionales" se vuelve indispensable para construir formularios dinámicos y adaptables.

Aquí te va la aclaración: Pensemos por un momento en un formulario de registro. Si el usuario selecciona "Otro" en un campo de selección de género, entonces aparece un nuevo campo de texto donde debe especificar cuál es ese "otro". En ese momento, ese nuevo campo debe volverse obligatorio. O quizás, si un usuario indica que es mayor de edad, no es necesario pedir el consentimiento de los padres. Estas son validaciones condicionales. En Angular, puedes lograr esto de varias maneras:
1.  **Observando cambios en otros controles:** Puedes suscribirte al `valueChanges` de un `FormControl` y, cuando su valor cambie, agregar o remover validadores a otro `FormControl` usando `setValidators()` o `clearValidators()`. Luego, debes llamar a `updateValueAndValidity()` para que el control reevalúe su estado.
2.  **Validadores a nivel de FormGroup:** Para validaciones que involucran la relación entre varios campos (por ejemplo, "la contraseña y la confirmación de contraseña deben ser iguales"), puedes crear un validador personalizado a nivel de `FormGroup`. Este validador recibe todo el `FormGroup` y puede comparar los valores de sus controles hijos.

La clave es que Angular te da las herramientas para manipular dinámicamente las reglas de validación en tiempo de ejecución, lo que permite que tus formularios se adapten inteligentemente a la entrada del usuario, mejorando la usabilidad y la precisión de los datos.
''',
    'code_example': r'''
// 1. Validador personalizado a nivel de FormGroup (ej. password-match.validator.ts):
import { AbstractControl, ValidationErrors, ValidatorFn } from '@angular/forms';

// Validador que compara dos campos (ej. contraseña y confirmación)
export const passwordMatchValidator: ValidatorFn = (control: AbstractControl): ValidationErrors | null => {
  const password = control.get('password');
  const confirmPassword = control.get('confirmPassword');

  if (!password || !confirmPassword) {
    return null; // Los controles no existen, no se puede validar
  }

  // Si confirmPassword tiene valor y no coincide con password, retorna error
  if (confirmPassword.value && password.value !== confirmPassword.value) {
    // Establecer el error en el control 'confirmPassword'
    confirmPassword.setErrors({ passwordMismatch: true });
    return { passwordMismatch: true }; // Error a nivel de FormGroup
  } else {
    // Si coinciden o confirmPassword está vacío, asegurar que no haya error de passwordMismatch
    if (confirmPassword.errors && confirmPassword.errors['passwordMismatch']) {
      // Eliminar solo el error 'passwordMismatch' si existe
      const { passwordMismatch, ...rest } = confirmPassword.errors;
      confirmPassword.setErrors(Object.keys(rest).length ? rest : null);
    }
    return null; // Válido
  }
};


// 2. En tu componente de formulario reactivo (ej. user-registration.component.ts):
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { passwordMatchValidator } from './password-match.validator'; // Importa el validador

@Component({
  selector: 'app-user-registration',
  template: `
    <form [formGroup]="registrationForm" (ngSubmit)="onSubmit()">
      <div>
        <label for="hasMiddleName">¿Tiene segundo nombre?</label>
        <input type="checkbox" id="hasMiddleName" formControlName="hasMiddleName">
      </div>

      <div *ngIf="registrationForm.get('hasMiddleName')?.value">
        <label for="middleName">Segundo Nombre:</label>
        <input id="middleName" type="text" formControlName="middleName">
        <div *ngIf="registrationForm.get('middleName')?.invalid && registrationForm.get('middleName')?.touched" style="color: red;">
          El segundo nombre es obligatorio si lo tiene.
        </div>
      </div>

      <hr>
      <h3>Validación de Contraseñas:</h3>
      <div>
        <label for="password">Contraseña:</label>
        <input type="password" id="password" formControlName="password">
        <div *ngIf="registrationForm.get('password')?.invalid && registrationForm.get('password')?.touched" style="color: red;">
          La contraseña es obligatoria.
        </div>
      </div>

      <div>
        <label for="confirmPassword">Confirmar Contraseña:</label>
        <input type="password" id="confirmPassword" formControlName="confirmPassword">
        <div *ngIf="registrationForm.get('confirmPassword')?.invalid && registrationForm.get('confirmPassword')?.touched" style="color: red;">
          <span *ngIf="registrationForm.get('confirmPassword')?.errors?.['passwordMismatch']">Las contraseñas no coinciden.</span>
        </div>
        <div *ngIf="registrationForm.errors?.['passwordMismatch'] && registrationForm.get('confirmPassword')?.touched" style="color: red;">
          Las contraseñas no coinciden (error de grupo).
        </div>
      </div>

      <button type="submit" [disabled]="registrationForm.invalid">Registrar</button>
    </form>

    <p>Estado del Formulario: {{ registrationForm.status }}</p>
    <p>Errores del Formulario: {{ registrationForm.errors | json }}</p>
  `
})
export class UserRegistrationComponent implements OnInit {
  registrationForm: FormGroup;

  constructor(private fb: FormBuilder) { }

  ngOnInit(): void {
    this.registrationForm = this.fb.group({
      hasMiddleName: [false],
      middleName: [''], // Campo que se validará condicionalmente
      password: ['', Validators.required],
      confirmPassword: ['', Validators.required]
    }, { validators: passwordMatchValidator }); // Aplica el validador de grupo aquí

    // Lógica para validación condicional del campo 'middleName'
    this.registrationForm.get('hasMiddleName')?.valueChanges.subscribe(hasMiddleName => {
      const middleNameControl = this.registrationForm.get('middleName');
      if (hasMiddleName) {
        middleNameControl?.setValidators(Validators.required);
      } else {
        middleNameControl?.clearValidators();
        middleNameControl?.setValue(''); // Limpiar valor si ya no es necesario
      }
      middleNameControl?.updateValueAndValidity(); // Muy importante para reevaluar validaciones
    });
  }

  onSubmit(): void {
    if (this.registrationForm.valid) {
      console.log('Registro exitoso:', this.registrationForm.value);
    } else {
      console.log('Formulario inválido.');
      this.registrationForm.markAllAsTouched();
    }
  }
}

/*
Un error común es olvidar llamar a `updateValueAndValidity()` en el `FormControl`
después de cambiar sus validadores (`setValidators` o `clearValidators`).
Si no lo haces, el control no reevaluará su estado de validación y los errores no se mostrarán.

Otro error en validadores de grupo es no limpiar los errores de los controles individuales
cuando la condición de error ya no se cumple (como el `passwordMismatch` en `confirmPassword`).
Asegúrate de manejar esto para evitar que los controles se queden en un estado de error persistente.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Formularios y Validaciones',
    'topic': 'Validaciones Personalizadas',
    'subtopic': 'Integración de validaciones en formularios complejos',
    'definition': r'''
Cuando construyes formularios que van más allá de lo básico, la integración de todas las validaciones (síncronas, asíncronas, personalizadas y condicionales) puede parecer un rompecabezas. Sin embargo, Angular te da las herramientas para que incluso los formularios más complejos mantengan una lógica de validación limpia y manejable.

Aquí te va la aclaración: Pensemos por un momento en un formulario de checkout de una tienda en línea. Este formulario podría tener secciones de información de envío, detalles de pago, y datos del cliente. Cada sección podría ser un `FormGroup` anidado, y dentro de ellos, `FormControls` individuales con sus propias validaciones. Además, la validez del método de pago podría depender del país de envío (validación condicional), y la verificación de la tarjeta de crédito podría requerir una llamada a una API (validación asíncrona). La clave para integrar todo esto es la naturaleza jerárquica y reactiva de los formularios de Angular. Puedes aplicar validadores a nivel de `FormControl` para campos individuales, validadores a nivel de `FormGroup` para relaciones entre campos, y validadores asíncronos cuando necesites lógica que implique promesas u observables. Al usar `FormBuilder`, construyes esta estructura de forma declarativa, y Angular se encarga de propagar el estado de validación (válido/inválido/pendiente) desde los controles individuales hasta los grupos y, finalmente, al formulario completo. Esto significa que puedes deshabilitar el botón de envío del formulario principal si cualquier parte de él es inválida. La habilidad de componer validadores y anidar formularios te permite construir interfaces de usuario robustas y amigables, donde la validación ocurre en tiempo real y el feedback es instantáneo, guiando al usuario a través del proceso de llenado sin frustraciones.
''',
    'code_example': r'''
// 1. Reutiliza los validadores personalizados (ej. custom-validators.ts y password-match.validator.ts)
// y crea un componente de formulario que los integre.

// En tu componente de formulario complejo (ej. complex-registration.component.ts):
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators, FormArray } from '@angular/forms';
import { forbiddenWordValidator, uniqueEmailValidator } from './custom-validators'; // Tus validadores personalizados
import { passwordMatchValidator } from './password-match.validator'; // Tu validador de grupo

@Component({
  selector: 'app-complex-registration',
  template: `
    <form [formGroup]="complexForm" (ngSubmit)="onSubmit()">
      <h3>Datos Personales</h3>
      <div formGroupName="personalInfo">
        <div>
          <label for="firstName">Nombre:</label>
          <input id="firstName" type="text" formControlName="firstName">
          <div *ngIf="complexForm.get('personalInfo.firstName')?.invalid && complexForm.get('personalInfo.firstName')?.touched" style="color: red;">
            El nombre es obligatorio.
          </div>
        </div>
        <div>
          <label for="email">Email:</label>
          <input id="email" type="email" formControlName="email">
          <div *ngIf="complexForm.get('personalInfo.email')?.invalid && complexForm.get('personalInfo.email')?.touched" style="color: red;">
            <span *ngIf="complexForm.get('personalInfo.email')?.errors?.['required']">El email es obligatorio.</span>
            <span *ngIf="complexForm.get('personalInfo.email')?.errors?.['email']">Email inválido.</span>
            <span *ngIf="complexForm.get('personalInfo.email')?.errors?.['uniqueEmail']">Email ya registrado.</span>
          </div>
          <div *ngIf="complexForm.get('personalInfo.email')?.pending">Verificando email...</div>
        </div>
      </div>

      <h3>Contraseña</h3>
      <div formGroupName="security">
        <div>
          <label for="password">Contraseña:</label>
          <input type="password" id="password" formControlName="password">
          <div *ngIf="complexForm.get('security.password')?.invalid && complexForm.get('security.password')?.touched" style="color: red;">
            La contraseña es obligatoria y mínimo 6 caracteres.
          </div>
        </div>
        <div>
          <label for="confirmPassword">Confirmar Contraseña:</label>
          <input type="password" id="confirmPassword" formControlName="confirmPassword">
          <div *ngIf="complexForm.get('security.confirmPassword')?.invalid && complexForm.get('security.confirmPassword')?.touched" style="color: red;">
            Las contraseñas no coinciden.
          </div>
        </div>
      </div>

      <h3>Teléfonos</h3>
      <div formArrayName="phones">
        <div *ngFor="let phoneControl of phones.controls; let i = index" [formGroupName]="i">
          <label for="phoneType{{i}}">Tipo:</label>
          <select id="phoneType{{i}}" formControlName="type">
            <option value="home">Casa</option>
            <option value="mobile">Móvil</option>
          </select>
          <label for="phoneNumber{{i}}">Número:</label>
          <input id="phoneNumber{{i}}" type="text" formControlName="number">
          <div *ngIf="phoneControl.invalid && phoneControl.touched" style="color: red;">
            Número es obligatorio.
          </div>
          <button type="button" (click)="removePhone(i)">Eliminar</button>
        </div>
        <button type="button" (click)="addPhone()">Añadir Teléfono</button>
      </div>

      <button type="submit" [disabled]="complexForm.invalid || complexForm.pending">Registrar Cuenta</button>
    </form>

    <hr>
    <p>Estado del Formulario Complejo: {{ complexForm.status }}</p>
    <p>Valor del Formulario Complejo: {{ complexForm.value | json }}</p>
  `
})
export class ComplexRegistrationComponent implements OnInit {
  complexForm: FormGroup;

  constructor(private fb: FormBuilder) { }

  ngOnInit(): void {
    this.complexForm = this.fb.group({
      personalInfo: this.fb.group({
        firstName: ['', Validators.required],
        lastName: [''],
        email: ['',
          [Validators.required, Validators.email],
          [uniqueEmailValidator(800)] // Validador asíncrono
        ]
      }),
      security: this.fb.group({
        password: ['', [Validators.required, Validators.minLength(6)]],
        confirmPassword: ['', Validators.required]
      }, { validators: passwordMatchValidator }), // Validador a nivel de grupo
      phones: this.fb.array([
        this.createPhoneGroup()
      ])
    });

    // Ejemplo de validación condicional compleja:
    // Si el nombre tiene 'admin', el email no puede ser 'admin@domain.com'
    // Esta lógica podría ir en un validador a nivel de FormGroup 'personalInfo'
    this.complexForm.get('personalInfo.firstName')?.valueChanges.subscribe(firstName => {
      const emailControl = this.complexForm.get('personalInfo.email');
      if (firstName?.toLowerCase().includes('admin') && emailControl?.value === 'admin@domain.com') {
        emailControl?.setErrors({ adminEmailConflict: true });
      } else if (emailControl?.errors && emailControl.errors['adminEmailConflict']) {
        // Limpiar el error si ya no aplica
        const { adminEmailConflict, ...rest } = emailControl.errors;
        emailControl.setErrors(Object.keys(rest).length ? rest : null);
      }
    });
  }

  // Getter para acceder fácilmente al FormArray 'phones' en la plantilla
  get phones(): FormArray {
    return this.complexForm.get('phones') as FormArray;
  }

  createPhoneGroup(): FormGroup {
    return this.fb.group({
      type: ['mobile', Validators.required],
      number: ['', Validators.required]
    });
  }

  addPhone(): void {
    this.phones.push(this.createPhoneGroup());
  }

  removePhone(index: number): void {
    this.phones.removeAt(index);
  }

  onSubmit(): void {
    // Marcar todos los controles como 'touched' para mostrar los errores al intentar enviar
    this.markAllControlsAsTouched(this.complexForm);

    if (this.complexForm.valid) {
      console.log('Formulario Complejo Válido:', this.complexForm.value);
      // Aquí enviarías los datos a un servicio
    } else {
      console.log('Formulario Complejo Inválido.');
    }
  }

  // Función auxiliar para marcar todos los controles como 'touched'
  markAllControlsAsTouched(formGroup: FormGroup | FormArray): void {
    Object.values(formGroup.controls).forEach(control => {
      control.markAsTouched();
      if (control instanceof FormGroup || control instanceof FormArray) {
        this.markAllControlsAsTouched(control);
      }
    });
  }
}

/*
Un error común es no validar los `FormArray` correctamente o no enlazar los `FormGroup` anidados
con `formGroupName` en la plantilla.

La función `markAllControlsAsTouched` es un patrón útil para garantizar que todos los mensajes
de error se muestren al usuario cuando intenta enviar un formulario inválido,
ya que por defecto, los errores solo se muestran en campos 'touched'.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Formularios y Validaciones',
    'topic': 'Manejo de Eventos en Formularios',
    'subtopic': 'Captura de eventos de entrada',
    'definition': r'''
Interactuar con los formularios no es solo enviar datos; también implica reaccionar a lo que el usuario está haciendo mientras los llena. Capturar eventos de entrada es fundamental para dar feedback instantáneo, realizar validaciones al vuelo o habilitar/deshabilitar funcionalidades, haciendo tus formularios más dinámicos y amigables.

¿Te estás preguntando por qué esto importa?

Aquí te va la aclaración: Pensemos por un momento en un campo de búsqueda donde, a medida que el usuario escribe, quieres mostrar sugerencias. O un campo de contraseña que muestra un indicador de fortaleza en tiempo real. Para lograr esto, necesitas capturar los eventos que ocurren en los elementos del formulario, como `input` (cuando el valor cambia), `blur` (cuando el campo pierde el foco), `focus` (cuando el campo gana el foco), `change` (cuando el valor cambia y el campo pierde el foco, o para `select` y `checkbox`), o `keyup`/`keydown` (cuando se presiona/suelta una tecla). En Angular, esto se hace usando el "event binding" (enlace de eventos) con la sintaxis de paréntesis `(evento)="tuFuncion()"`. Dentro de tu función, puedes acceder al objeto `event` nativo del DOM o, si estás usando formularios reactivos, suscribirte al `valueChanges` de un `FormControl`, que es una forma más reactiva y poderosa de reaccionar a los cambios de valor. La captura de eventos te permite construir formularios que no solo reciben datos, sino que también responden inteligentemente a la interacción del usuario, proporcionando una experiencia más rica y reactiva.
''',
    'code_example': r'''
// En tu componente (ej. event-handling-form/event-handling-form.component.ts):
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, FormControl } from '@angular/forms';
import { debounceTime, distinctUntilChanged } from 'rxjs/operators'; // Para optimizar la captura de eventos

@Component({
  selector: 'app-event-handling-form',
  template: `
    <h2>Manejo de Eventos</h2>
    <form [formGroup]="myForm">
      <div>
        <label for="username">Nombre de Usuario:</label>
        <input id="username" type="text" formControlName="username"
               (input)="onInputUsername($event)"       (blur)="onBlurUsername()">             <p>Escribiendo: {{ currentUsernameInput }}</p>
        <p>Campo tocado (blur): {{ usernameTouched }}</p>
      </div>

      <div>
        <label for="searchQuery">Búsqueda (debounce):</label>
        <input id="searchQuery" type="text" formControlName="searchQuery">
        <p>Realizando búsqueda para: {{ debouncedSearchQuery }}</p>
      </div>

      <div>
        <label for="consent">Acepto términos:</label>
        <input id="consent" type="checkbox" formControlName="consent"
               (change)="onChangeConsent($event)">    <p>Consentimiento: {{ consentGiven }}</p>
      </div>
    </form>
  `
})
export class EventHandlingFormComponent implements OnInit {
  myForm: FormGroup;
  currentUsernameInput: string = '';
  usernameTouched: boolean = false;
  debouncedSearchQuery: string = '';
  consentGiven: boolean = false;

  constructor(private fb: FormBuilder) { }

  ngOnInit(): void {
    this.myForm = this.fb.group({
      username: [''],
      searchQuery: [''],
      consent: [false]
    });

    // Suscribirse a valueChanges para el campo de búsqueda (reactivo)
    // Usamos debounceTime para esperar a que el usuario termine de escribir
    // y distinctUntilChanged para reaccionar solo a cambios reales.
    this.myForm.get('searchQuery')?.valueChanges.pipe(
      debounceTime(500), // Espera 500ms después de la última pulsación de tecla
      distinctUntilChanged() // Solo emite si el valor es diferente al anterior
    ).subscribe(query => {
      this.debouncedSearchQuery = query;
      console.log('Búsqueda ejecutada para:', query);
      // Aquí harías tu llamada a la API de búsqueda
    });
  }

  // Manejador del evento 'input' del campo de usuario
  onInputUsername(event: Event): void {
    this.currentUsernameInput = (event.target as HTMLInputElement).value;
    console.log('Input de username:', this.currentUsernameInput);
  }

  // Manejador del evento 'blur' del campo de usuario
  onBlurUsername(): void {
    this.usernameTouched = true;
    console.log('Campo de usuario perdió el foco.');
  }

  // Manejador del evento 'change' del checkbox
  onChangeConsent(event: Event): void {
    this.consentGiven = (event.target as HTMLInputElement).checked;
    console.log('Consentimiento cambiado a:', this.consentGiven);
    // Podrías habilitar/deshabilitar un botón aquí, por ejemplo
  }

  // EJEMPLO DE UN USO INCORRECTO:
  // No se debe intentar acceder directamente a elementos del DOM con document.getElementById
  // cuando Angular ya proporciona formas reactivas para manejar los valores de los controles.
  // getInputValueDirectly(): void {
  //   const inputElement = document.getElementById('username') as HTMLInputElement;
  //   console.log('Valor directo:', inputElement.value); // Esto es anti-patrón en Angular reactivo
  // }
}

/*
Un error común es intentar acceder directamente a los elementos del DOM usando
métodos como `document.getElementById` o `querySelector` en el contexto de Angular.
Aunque es posible, va en contra de la filosofía de Angular.
Para obtener el valor de un campo, usa `formControlName` y accede a `myForm.get('controlName').value`
o `(event.target as HTMLInputElement).value` en el manejador de eventos del template.
Para reaccionar a cambios en tiempo real en formularios reactivos, suscríbete a `valueChanges`.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Formularios y Validaciones',
    'topic': 'Manejo de Eventos en Formularios',
    'subtopic': 'Respuesta a cambios en el formulario',
    'definition': r'''
En formularios reactivos de Angular, no solo te interesa el valor final del formulario al enviarlo, sino también cómo reaccionar a los cambios que el usuario realiza en tiempo real. Responder a estos cambios te permite construir interfaces de usuario dinámicas que validan, calculan o habilitan/deshabilitan elementos sobre la marcha.

Aquí te va la aclaración: Cada `FormControl`, `FormGroup` o `FormArray` en un formulario reactivo expone una propiedad `valueChanges` que es un `Observable`. Suscribirte a este `Observable` te permite recibir notificaciones cada vez que el valor de ese control o grupo cambia. Esto es increíblemente poderoso para escenarios donde la lógica de tu aplicación depende de la entrada del usuario en tiempo real. Pensemos por un momento en un calculador de préstamos donde, a medida que el usuario ajusta la cantidad, el plazo o la tasa de interés, el pago mensual se actualiza instantáneamente. O en un formulario de registro donde ciertos campos se habilitan o deshabilitan según las selecciones previas del usuario (por ejemplo, si selecciona "Empresa", aparecen campos para el CIF y el sector). Al suscribirte a `valueChanges`, puedes ejecutar tu lógica de negocio en respuesta a estos cambios. Además de `valueChanges`, también tienes `statusChanges`, que es un `Observable` que te notifica cuando el estado de validación de un control (`VALID`, `INVALID`, `PENDING`) cambia. Esta combinación te da un control completo sobre el comportamiento y la reactividad de tus formularios.
''',
    'code_example': r'''
// En tu componente (ej. dynamic-form/dynamic-form.component.ts):
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Subscription } from 'rxjs'; // Para gestionar las suscripciones
import { startWith } from 'rxjs/operators'; // Para emitir el valor inicial

@Component({
  selector: 'app-dynamic-form',
  template: `
    <h2>Configuración de Usuario</h2>
    <form [formGroup]="userConfigForm">
      <div>
        <label for="role">Rol:</label>
        <select id="role" formControlName="role">
          <option value="user">Usuario</option>
          <option value="admin">Administrador</option>
        </select>
      </div>

      <div *ngIf="userConfigForm.get('role')?.value === 'admin'">
        <label for="adminCode">Código de Administrador:</label>
        <input id="adminCode" type="text" formControlName="adminCode">
        <div *ngIf="userConfigForm.get('adminCode')?.invalid && userConfigForm.get('adminCode')?.touched" style="color: red;">
          El código de administrador es obligatorio para administradores.
        </div>
      </div>

      <div>
        <label for="notifications">Recibir Notificaciones:</label>
        <input type="checkbox" id="notifications" formControlName="notifications">
      </div>

      <div *ngIf="userConfigForm.get('notifications')?.value">
        <label for="notificationEmail">Email de Notificación:</label>
        <input id="notificationEmail" type="email" formControlName="notificationEmail">
        <div *ngIf="userConfigForm.get('notificationEmail')?.invalid && userConfigForm.get('notificationEmail')?.touched" style="color: red;">
          Email de notificación inválido o requerido.
        </div>
      </div>
    </form>

    <hr>
    <h3>Debugging del Formulario:</h3>
    <p>Valor del formulario: {{ userConfigForm.value | json }}</p>
    <p>Estado del formulario: {{ userConfigForm.status }}</p>
  `
})
export class DynamicFormComponent implements OnInit {
  userConfigForm: FormGroup;
  private subscriptions: Subscription = new Subscription(); // Para gestionar suscripciones

  constructor(private fb: FormBuilder) { }

  ngOnInit(): void {
    this.userConfigForm = this.fb.group({
      role: ['user'],
      adminCode: [''],
      notifications: [false],
      notificationEmail: ['']
    });

    // Suscribirse a los cambios en el campo 'role'
    // startWith() emite el valor inicial del control, lo que es útil para la lógica inicial
    this.subscriptions.add(
      this.userConfigForm.get('role')?.valueChanges.pipe(startWith(this.userConfigForm.get('role')?.value)).subscribe(role => {
        const adminCodeControl = this.userConfigForm.get('adminCode');
        if (role === 'admin') {
          adminCodeControl?.setValidators(Validators.required);
        } else {
          adminCodeControl?.clearValidators();
          adminCodeControl?.setValue(''); // Opcional: limpiar el valor si ya no aplica
        }
        adminCodeControl?.updateValueAndValidity(); // Es crucial reevaluar validaciones
      })
    );

    // Suscribirse a los cambios en el campo 'notifications'
    this.subscriptions.add(
      this.userConfigForm.get('notifications')?.valueChanges.pipe(startWith(this.userConfigForm.get('notifications')?.value)).subscribe(notificationsEnabled => {
        const notificationEmailControl = this.userConfigForm.get('notificationEmail');
        if (notificationsEnabled) {
          notificationEmailControl?.setValidators([Validators.required, Validators.email]);
        } else {
          notificationEmailControl?.clearValidators();
          notificationEmailControl?.setValue('');
        }
        notificationEmailControl?.updateValueAndValidity();
      })
    );
  }

  ngOnDestroy(): void {
    // Es CRUCIAL desuscribirse para evitar fugas de memoria, especialmente con Observables.
    this.subscriptions.unsubscribe();
  }

  // Ejemplo de cómo reaccionar a cambios en todo el formulario
  logFormChanges(): void {
    this.subscriptions.add(
      this.userConfigForm.valueChanges.subscribe(value => {
        console.log('Valor del formulario cambiado:', value);
      })
    );
    this.subscriptions.add(
      this.userConfigForm.statusChanges.subscribe(status => {
        console.log('Estado del formulario cambiado:', status);
      })
    );
  }
}

/*
Un error común es olvidar desuscribirse de los Observables (`valueChanges`, `statusChanges`)
en el `ngOnDestroy` del componente. Si no lo haces, puedes tener fugas de memoria
o comportamientos inesperados cuando el componente ya no existe.

Otro error es no llamar a `updateValueAndValidity()` después de modificar dinámicamente
los validadores de un control. Sin esto, Angular no reevaluará el estado de validación
del control, y tu lógica condicional podría no reflejarse en la UI.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Formularios y Validaciones',
    'topic': 'Manejo de Eventos en Formularios',
    'subtopic': 'Actualización dinámica de valores',
    'definition': r'''
A veces, en un formulario, el valor de un campo no solo depende de lo que el usuario escribe, sino también de otros campos, de cálculos o de datos externos. La "actualización dinámica de valores" es la capacidad de cambiar programáticamente el valor de un `FormControl` en respuesta a alguna lógica, lo que permite crear formularios altamente interactivos.

Vamos a ver de que se trata todo esto... 

Pensemos por un momento en un formulario de cotización. Si un usuario selecciona un tipo de servicio y una cantidad, el precio total debería calcularse y mostrarse automáticamente en otro campo sin que el usuario tenga que escribirlo. O en un formulario de registro donde el campo "nombre de usuario sugerido" se precarga basándose en el nombre y apellido ingresados. Para hacer esto, tienes varios métodos en `FormControl` (o `FormGroup`):
* `setValue()`: Establece un valor específico para el control. Es estricto y requiere que pases el valor completo si lo usas en un `FormGroup` (debes proporcionar valores para todos los controles hijos).
* `patchValue()`: Permite actualizar solo un subconjunto de los valores de un `FormGroup` o `FormArray`. Es más flexible cuando solo quieres cambiar algunos campos sin afectar el resto.
* `reset()`: Restablece el control o formulario a su estado original (valor inicial, `pristine`, `untouched`). Puedes pasarle un objeto para restablecerlo a valores específicos.

Estas funciones son tus herramientas para manipular el estado de los formularios desde el código TypeScript. Combinadas con la suscripción a `valueChanges`, te permiten crear formularios que no solo reaccionan a la entrada del usuario, sino que también guían y asisten al usuario al actualizar campos automáticamente.
''',
    'code_example': r'''
// En tu componente (ej. order-form/order-form.component.ts):
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Subscription } from 'rxjs';
import { debounceTime, startWith } from 'rxjs/operators';

@Component({
  selector: 'app-order-form',
  template: `
    <h2>Formulario de Pedido</h2>
    <form [formGroup]="orderForm">
      <div>
        <label for="product">Producto:</label>
        <select id="product" formControlName="product">
          <option value="">Seleccione un producto</option>
          <option value="laptop">Laptop ($1200)</option>
          <option value="mouse">Mouse ($25)</option>
          <option value="keyboard">Teclado ($75)</option>
        </select>
        <div *ngIf="orderForm.get('product')?.invalid && orderForm.get('product')?.touched" style="color: red;">
          Producto es obligatorio.
        </div>
      </div>

      <div>
        <label for="quantity">Cantidad:</label>
        <input id="quantity" type="number" formControlName="quantity">
        <div *ngIf="orderForm.get('quantity')?.invalid && orderForm.get('quantity')?.touched" style="color: red;">
          Cantidad debe ser un número positivo.
        </div>
      </div>

      <div>
        <label for="totalPrice">Precio Total:</label>
        <input id="totalPrice" type="text" formControlName="totalPrice" readonly>
      </div>

      <button type="button" (click)="resetForm()">Resetear Formulario</button>
    </form>

    <hr>
    <p>Valor del formulario: {{ orderForm.value | json }}</p>
  `
})
export class OrderFormComponent implements OnInit {
  orderForm: FormGroup;
  productPrices = {
    laptop: 1200,
    mouse: 25,
    keyboard: 75
  };
  private subscriptions: Subscription = new Subscription();

  constructor(private fb: FormBuilder) { }

  ngOnInit(): void {
    this.orderForm = this.fb.group({
      product: ['', Validators.required],
      quantity: [1, [Validators.required, Validators.min(1)]],
      totalPrice: [{ value: 0, disabled: true }] // Deshabilita el control para que no sea editable
    });

    // Suscribirse a los cambios en 'product' y 'quantity' para calcular el precio total
    this.subscriptions.add(
      this.orderForm.valueChanges.pipe(
        debounceTime(300), // Espera un poco para calcular
        startWith(this.orderForm.value) // Emite el valor inicial al cargar
      ).subscribe(values => {
        const selectedProduct = values.product;
        const quantity = values.quantity;

        if (selectedProduct && quantity > 0 && this.productPrices[selectedProduct]) {
          const price = this.productPrices[selectedProduct] * quantity;
          // Actualiza el valor del campo 'totalPrice' dinámicamente
          // Usamos patchValue porque solo cambiamos un campo, no el formulario completo
          this.orderForm.patchValue({ totalPrice: price.toFixed(2) }, { emitEvent: false }); // No emite otro valueChanges
        } else {
          this.orderForm.patchValue({ totalPrice: '0.00' }, { emitEvent: false });
        }
      })
    );
  }

  ngOnDestroy(): void {
    this.subscriptions.unsubscribe();
  }

  resetForm(): void {
    // Restablece el formulario a su estado inicial y limpia validaciones
    this.orderForm.reset({
      product: '',
      quantity: 1,
      totalPrice: '0.00' // Restablece el valor inicial para totalPrice
    });
    // Opcional: para asegurar que los campos no estén 'touched' después del reset
    this.orderForm.markAsPristine();
    this.orderForm.markAsUntouched();
  }
}

/*
Un error común es intentar actualizar un valor en el mismo `valueChanges` sin usar
`{ emitEvent: false }` en `setValue()` o `patchValue()`.
Esto puede causar un bucle infinito porque `setValue` o `patchValue`
también emiten un evento `valueChanges`. Al usar `{ emitEvent: false }`,
previenes que se dispare otro evento `valueChanges`.

Otro error es no deshabilitar los campos calculados (`totalPrice` en este caso)
para evitar que el usuario los modifique directamente.
*/
'''
  });
}

Future<void> insertAngularJrLevel4Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Servicios y Comunicación HTTP',
    'topic': 'Servicios en Angular',
    'subtopic': 'Creación de servicios con Angular CLI',
    'definition': r'''
En Angular, los servicios son el lugar ideal para alojar la lógica de negocio, la comunicación con APIs externas o cualquier funcionalidad que necesites compartir entre diferentes componentes sin duplicar código. Crear un servicio es el primer paso para una aplicación bien estructurada.

Aquí te va la aclaración: Pensemos por un momento en una aplicación de lista de tareas. Es probable que varios componentes (uno para mostrar tareas, otro para añadir nuevas tareas, otro para editar tareas) necesiten acceder a la misma lista de tareas y guardarla en algún lugar (quizás una base de datos o una API). Si cada componente maneja su propia lógica de datos, pronto tendrás un caos de código repetido y difícil de mantener. Los servicios resuelven esto. Son clases de TypeScript que puedes inyectar en cualquier componente, otro servicio, o incluso en directivas. La forma más sencilla y recomendada de crearlos es usando el Angular CLI. Cuando ejecutas el comando `ng generate service`, el CLI no solo crea el archivo del servicio, sino que también añade el decorador `@Injectable()` y, a partir de Angular 6+, lo configura automáticamente para que sea `providedIn: 'root'`. Esto significa que el servicio será un "singleton", es decir, habrá una única instancia de ese servicio disponible en toda tu aplicación, lo cual es perfecto para compartir datos y lógica. Así, cada componente puede interactuar con la misma fuente de verdad a través del servicio.
''',
    'code_example': r'''
// 1. Crear un servicio usando Angular CLI:
// Abre tu terminal en la raíz de tu proyecto Angular y ejecuta:
// ng generate service data/user

// Esto creará un archivo 'src/app/data/user.service.ts' y un archivo de prueba.

// 2. Contenido del servicio generado (src/app/data/user.service.ts):
import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';

// El decorador @Injectable() es crucial para que Angular pueda inyectar el servicio.
// providedIn: 'root' hace que el servicio sea un singleton global.
@Injectable({
  providedIn: 'root'
})
export class UserService {

  // Un array de usuarios de ejemplo (simulando datos de una API)
  private users = [
    { id: 1, name: 'Alice' },
    { id: 2, name: 'Bob' },
    { id: 3, name: 'Charlie' }
  ];

  constructor() {
    console.log('UserService ha sido instanciado.');
  }

  getUsers(): Observable<any[]> {
    // Aquí normalmente harías una petición HTTP.
    // Por ahora, simulamos una respuesta asíncrona con 'of' de RxJS.
    return of(this.users);
  }

  getUserById(id: number): Observable<any> {
    const user = this.users.find(u => u.id === id);
    return of(user);
  }

  addUser(user: any): Observable<any> {
    const newId = this.users.length > 0 ? Math.max(...this.users.map(u => u.id)) + 1 : 1;
    const newUser = { ...user, id: newId };
    this.users.push(newUser);
    return of(newUser);
  }
}

// 3. Un ejemplo de CÓDIGO INCORRECTO:
// No intentes crear una instancia del servicio manualmente en un componente:
// const userService = new UserService(); // ¡Incorrecto! Esto anula la inyección de dependencias.
// Siempre inyecta los servicios a través del constructor.
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Servicios y Comunicación HTTP',
    'topic': 'Servicios en Angular',
    'subtopic': 'Inyección de dependencias',
    'definition': r'''
La "Inyección de Dependencias" (DI por sus siglas en inglés) es uno de los pilares de Angular y un patrón de diseño fundamental que simplifica enormemente la gestión de dependencias entre diferentes partes de tu aplicación, especialmente cuando se trata de servicios.

¿Te estás preguntando por qué esto importa?

Aquí te va la aclaración: Pensemos por un momento en un componente que necesita obtener datos de un servicio (`UserService`). Sin DI, ese componente tendría que crear una nueva instancia de `UserService` por sí mismo cada vez que lo necesitara, o preocuparse por cómo obtener una instancia ya existente. Esto no solo sería repetitivo, sino que haría que tu código fuera difícil de probar y mantener. Con la inyección de dependencias, Angular se encarga de crear y proporcionar las instancias de tus servicios justo cuando las necesitas. Tú simplemente "declaras" que tu componente o servicio "depende" de otro servicio (indicándolo en el constructor), y Angular (a través de su "inyector") lo "inyecta" automáticamente. Esto significa que tu componente no necesita saber *cómo* crear o gestionar el `UserService`; solo necesita saber que lo necesita. Esto tiene varios beneficios clave:
* **Reusabilidad:** Los servicios se pueden inyectar en múltiples componentes y servicios.
* **Mantenibilidad:** Si el `UserService` cambia (por ejemplo, ahora obtiene datos de una API diferente), solo necesitas actualizar el servicio, no todos los componentes que lo usan.
* **Probabilidad:** Puedes "simular" o "mockear" los servicios fácilmente durante las pruebas unitarias, inyectando versiones de prueba en lugar de las reales.
Es un concepto poderoso que fomenta un código más limpio, modular y fácil de probar.
''',
    'code_example': r'''
// 1. Definición del servicio (src/app/data/user.service.ts):
import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';

@Injectable({
  providedIn: 'root' // Indica que este servicio puede ser inyectado y es un singleton
})
export class UserService {
  private users = [
    { id: 1, name: 'Alice' },
    { id: 2, name: 'Bob' }
  ];

  constructor() {
    console.log('UserService instanciado para inyección.');
  }

  getUsers(): Observable<any[]> {
    return of(this.users);
  }
}

// 2. Inyección del servicio en un componente (src/app/user-list/user-list.component.ts):
import { Component, OnInit } from '@angular/core';
import { UserService } from '../data/user.service'; // Importa el servicio

@Component({
  selector: 'app-user-list',
  template: `
    <h2>Lista de Usuarios</h2>
    <ul>
      <li *ngFor="let user of users">
        {{ user.name }} (ID: {{ user.id }})
      </li>
    </ul>
  `
})
export class UserListComponent implements OnInit {
  users: any[] = [];

  // Inyectamos el UserService en el constructor. Angular se encarga de proporcionar la instancia.
  constructor(private userService: UserService) {
    console.log('UserListComponent creado.');
  }

  ngOnInit(): void {
    // Usamos el servicio inyectado para obtener los datos.
    this.userService.getUsers().subscribe(data => {
      this.users = data;
      console.log('Usuarios cargados:', this.users);
    });
  }

  // Ejemplo de CÓDIGO INCORRECTO:
  // No hacer esto:
  // constructor() {
  //   this.userService = new UserService(); // ¡Error! Esto viola la inyección de dependencias.
  // }
}

// 3. Un servicio inyectando otro servicio (ej. analytics.service.ts inyectando UserService):
import { Injectable } from '@angular/core';
import { UserService } from './user.service'; // Importa el servicio a inyectar

@Injectable({
  providedIn: 'root'
})
export class AnalyticsService {
  constructor(private userService: UserService) { // Inyecta UserService aquí
    console.log('AnalyticsService instanciado e inyectando UserService.');
  }

  logUserActivity(userId: number, activity: string): void {
    // Podría usar el userService para obtener detalles del usuario
    this.userService.getUserById(userId).subscribe(user => {
      console.log(`Actividad de ${user?.name} (ID: ${userId}): ${activity}`);
    });
  }
}

/*
Un error común es olvidar el decorador `@Injectable()` en un servicio.
Si no lo pones, Angular no sabrá que es un servicio inyectable y no podrá
proporcionar una instancia cuando otro componente o servicio lo solicite.

Otro error es intentar inyectar algo que no está provisto. Si un servicio
no tiene `providedIn: 'root'` o no está listado en el array `providers`
de un `NgModule`, Angular no sabrá cómo crear su instancia.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Servicios y Comunicación HTTP',
    'topic': 'Servicios en Angular',
    'subtopic': 'Alcance de los servicios (root, component)',
    'definition': r'''
Cuando creas un servicio en Angular, es importante entender dónde (o "cuándo") Angular creará una instancia de ese servicio y quiénes podrán acceder a ella. Esto se conoce como el "alcance" de un servicio y es fundamental para optimizar el rendimiento y evitar problemas de estado.

No sé tú, pero a mí esto al principio me costó. 

La idea es que Angular tiene un sistema de inyección de dependencias jerárquico. Esto significa que un servicio puede estar disponible en diferentes niveles de tu aplicación, y el mismo servicio puede tener múltiples instancias si no se maneja bien el alcance. Hay dos alcances principales que vas a usar la mayor parte del tiempo:
1.  **`providedIn: 'root'`**: Este es el valor por defecto cuando generas un servicio con el CLI desde Angular 6+. Significa que el servicio se registra con el inyector raíz de la aplicación. Como resultado, hay una **única instancia** de este servicio (un "singleton") disponible en toda la aplicación. Todos los componentes y otros servicios que inyecten este servicio obtendrán la misma instancia. Esto es ideal para servicios que gestionan el estado global de la aplicación (ej. un servicio de autenticación, un servicio de datos) o que se necesitan en muchos lugares. Es la forma más eficiente de proveer servicios.
2.  **A nivel de Componente/Módulo (usando `providers` array)**: Si colocas un servicio en el array `providers` de un `@NgModule` (por ejemplo, en un módulo lazy-loaded) o en el `providers` de un `@Component`, estás diciendo que quieres una **nueva instancia** de ese servicio cada vez que ese módulo o componente (y sus hijos) se cargue.
    * Si lo provees en un `@NgModule` lazy-loaded, el servicio será un singleton dentro de ese módulo y sus componentes. Otros módulos cargados eager no lo verán.
    * Si lo provees en un `@Component`, una nueva instancia del servicio se creará cada vez que el componente se cree, y solo ese componente (y sus hijos en su plantilla) podrán acceder a esa instancia. Esto es útil si un servicio necesita tener un estado específico para una parte aislada de la UI.

Comprender el alcance te permite decidir dónde debe vivir tu servicio para garantizar que se comporte como esperas: como una fuente de verdad única o como una entidad con estado propio para un componente específico.
''',
    'code_example': r'''
// 1. Servicio con alcance 'root' (recomendado para la mayoría de los casos)
// src/app/global-counter.service.ts
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root' // Este servicio es un singleton global
})
export class GlobalCounterService {
  private count = 0;

  increment(): void {
    this.count++;
    console.log('Global Counter:', this.count);
  }

  getCount(): number {
    return this.count;
  }
}

// 2. Servicio con alcance a nivel de componente
// src/app/component-counter.service.ts
import { Injectable } from '@angular/core';

@Injectable() // Observa que NO tiene providedIn: 'root'
export class ComponentCounterService {
  private count = 0;

  increment(): void {
    this.count++;
    console.log('Component Counter:', this.count);
  }

  getCount(): number {
    return this.count;
  }
}

// 3. Componente que inyecta ambos servicios para demostrar el alcance
// src/app/counter-display/counter-display.component.ts
import { Component, OnInit } from '@angular/core';
import { GlobalCounterService } from '../global-counter.service';
import { ComponentCounterService } from '../component-counter.service';

@Component({
  selector: 'app-counter-display',
  template: `
    <h3>Contador Global: {{ globalCounter.getCount() }}</h3>
    <button (click)="globalCounter.increment()">Incrementar Global</button>

    <h3>Contador por Componente: {{ componentCounter.getCount() }}</h3>
    <button (click)="componentCounter.increment()">Incrementar Componente</button>
  `,
  // Aquí proveemos el ComponentCounterService a nivel de este componente.
  // Cada instancia de CounterDisplayComponent tendrá SU PROPIA instancia de ComponentCounterService.
  providers: [ComponentCounterService]
})
export class CounterDisplayComponent implements OnInit {
  constructor(
    public globalCounter: GlobalCounterService,
    public componentCounter: ComponentCounterService // Instancia única para este componente
  ) {}

  ngOnInit(): void {
    console.log('CounterDisplayComponent inicializado.');
    this.globalCounter.increment();
    this.componentCounter.increment();
  }
}

// 4. Uso de CounterDisplayComponent en App.component.ts para mostrar múltiples instancias
// src/app/app.component.ts
import { Component } from '@angular/core';
import { GlobalCounterService } from './global-counter.service'; // Inyectado aquí para mostrar que es global

@Component({
  selector: 'app-root',
  template: `
    <h1>Demostración de Alcance de Servicios</h1>
    <app-counter-display></app-counter-display>
    <app-counter-display></app-counter-display> <p>Global Counter (desde App Root): {{ globalCounter.getCount() }}</p>
  `
})
export class AppComponent {
  constructor(public globalCounter: GlobalCounterService) {}
}

/*
Al ejecutar esto, verás que el "Global Counter" se incrementa en todas las instancias del componente
y en el componente raíz, porque es un singleton.
Sin embargo, el "Component Counter" se reinicia para cada `app-counter-display`,
demostrando que cada componente obtiene su propia instancia de ese servicio.

Un error común es no entender que `providedIn: 'root'` hace que el servicio sea un singleton.
Si por error provees un servicio que debería ser un singleton a nivel de un componente
(omitiendo `providedIn: 'root'` y listándolo en `providers` del componente),
obtendrás múltiples instancias de ese servicio, lo que puede llevar a comportamientos inesperados
y problemas de estado si el servicio está diseñado para ser global.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Servicios y Comunicación HTTP',
    'topic': 'Comunicación HTTP',
    'subtopic': 'Uso de HttpClient para peticiones HTTP',
    'definition': r'''
Una aplicación web moderna no vive aislada; casi siempre necesita interactuar con servidores remotos para obtener, enviar o actualizar datos. En Angular, la herramienta oficial y recomendada para hacer esto es el `HttpClient`.

¿Te estás preguntando por qué esto importa?

Aquí te va la aclaración: Pensemos por un momento en una aplicación que muestra una lista de productos. Esa lista no está incrustada en tu código; lo más seguro es que venga de una API REST que vive en un servidor. `HttpClient` es el servicio de Angular que te permite hacer estas peticiones (GET, POST, PUT, DELETE, etc.) de una manera sencilla y segura. Funciona con Observables (parte de RxJS), lo que significa que las peticiones son asíncronas y puedes encadenar operaciones, manejar errores y transformar los datos de una manera muy potente. Es mucho más moderno y flexible que las antiguas formas de hacer peticiones HTTP en JavaScript. Además, `HttpClient` ya viene con características de seguridad integradas y es fácilmente extensible a través de interceptores (de los que hablaremos más adelante). Es la pieza fundamental que conecta tu aplicación Angular con el "backend", permitiéndole consumir y manipular datos en la nube.
''',
    'code_example': r'''
// 1. Asegúrate de importar HttpClientModule en tu módulo principal (ej. app.module.ts):
// Sin esto, el HttpClient no estará disponible para inyectar.
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http'; // Importa HttpClientModule
import { AppComponent } from './app.component';
import { ProductListComponent } from './product-list/product-list.component';

@NgModule({
  declarations: [
    AppComponent,
    ProductListComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule // Añade HttpClientModule a los imports
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

// 2. Crea un servicio para manejar las peticiones HTTP (ej. product.service.ts):
// Es una buena práctica encapsular la lógica HTTP en servicios.
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http'; // Importa HttpClient
import { Observable } from 'rxjs'; // Para trabajar con Observables

@Injectable({
  providedIn: 'root'
})
export class ProductService {
  private apiUrl = 'https://jsonplaceholder.typicode.com/posts'; // Ejemplo de API pública

  constructor(private http: HttpClient) { } // Inyecta HttpClient

  // Método para obtener todos los productos (petición GET)
  getProducts(): Observable<any[]> {
    return this.http.get<any[]>(this.apiUrl); // El <any[]> es el tipo de datos esperado
  }

  // Método para obtener un producto por ID (GET con parámetro de ruta)
  getProductById(id: number): Observable<any> {
    return this.http.get<any>(`${this.apiUrl}/${id}`);
  }

  // Método para añadir un nuevo producto (petición POST)
  addProduct(product: any): Observable<any> {
    return this.http.post<any>(this.apiUrl, product);
  }

  // Método para actualizar un producto existente (petición PUT)
  updateProduct(id: number, product: any): Observable<any> {
    return this.http.put<any>(`${this.apiUrl}/${id}`, product);
  }

  // Método para eliminar un producto (petición DELETE)
  deleteProduct(id: number): Observable<any> {
    return this.http.delete<any>(`${this.apiUrl}/${id}`);
  }
}

// 3. Usa el servicio en un componente (ej. product-list/product-list.component.ts):
import { Component, OnInit } from '@angular/core';
import { ProductService } from '../product.service'; // Importa el servicio

@Component({
  selector: 'app-product-list',
  template: `
    <h2>Nuestros Productos</h2>
    <button (click)="loadProducts()">Cargar Productos</button>
    <ul *ngIf="products.length > 0">
      <li *ngFor="let product of products">
        {{ product.title }} (ID: {{ product.id }})
        <button (click)="deleteProduct(product.id)">Eliminar</button>
      </li>
    </ul>
    <p *ngIf="loading">Cargando productos...</p>
    <p *ngIf="errorMessage" style="color: red;">Error: {{ errorMessage }}</p>
  `
})
export class ProductListComponent implements OnInit {
  products: any[] = [];
  loading: boolean = false;
  errorMessage: string | null = null;

  constructor(private productService: ProductService) { }

  ngOnInit(): void {
    // Puedes cargar productos al inicio o con un botón
    // this.loadProducts();
  }

  loadProducts(): void {
    this.loading = true;
    this.errorMessage = null;
    this.products = []; // Limpiar lista anterior
    this.productService.getProducts().subscribe({
      next: (data) => {
        this.products = data.slice(0, 5); // Limitar a 5 para el ejemplo
        this.loading = false;
      },
      error: (err) => {
        this.errorMessage = 'No se pudieron cargar los productos.';
        console.error('Error al cargar productos:', err);
        this.loading = false;
      },
      complete: () => {
        console.log('Carga de productos completada.');
      }
    });
  }

  deleteProduct(id: number): void {
    this.productService.deleteProduct(id).subscribe({
      next: () => {
        console.log(`Producto con ID ${id} eliminado (simulado).`);
        // Opcional: Actualizar la UI después de la eliminación exitosa
        this.products = this.products.filter(p => p.id !== id);
      },
      error: (err) => {
        console.error(`Error al eliminar producto ${id}:`, err);
        this.errorMessage = `No se pudo eliminar el producto con ID ${id}.`;
      }
    });
  }
}

/*
Un error común es olvidar importar `HttpClientModule` en el `NgModule` donde
se va a usar el `HttpClient` o en el `AppModule` si es un servicio global.
Si no lo haces, Angular no encontrará el `HttpClient` y la inyección fallará.

Otro error es no suscribirse al `Observable` retornado por los métodos de `HttpClient`.
Las peticiones HTTP en Angular son "cold Observables", lo que significa que no se ejecutan
hasta que alguien se suscribe a ellas. Si no te suscribes, la petición nunca se enviará.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Servicios y Comunicación HTTP',
    'topic': 'Comunicación HTTP',
    'subtopic': 'Manejo de respuestas y errores',
    'definition': r'''
Hacer peticiones HTTP es solo la mitad de la batalla. La otra mitad, igualmente crucial, es saber cómo interpretar las respuestas exitosas del servidor y, aún más importante, cómo gestionar los errores que inevitablemente ocurrirán. Un buen manejo de errores es lo que diferencia una aplicación robusta de una que se rompe al primer problema de red.

Aquí te va la aclaración: Pensemos por un momento en una situación donde tu aplicación intenta obtener la lista de usuarios, pero el servidor está caído o devuelve un error 500. Si no manejas ese error, tu aplicación podría colgarse o mostrar un mensaje confuso al usuario. `HttpClient` de Angular, al trabajar con Observables, te facilita el manejo de respuestas y errores a través de los métodos `next`, `error` y `complete` de la suscripción.
* **`next`**: Esta es la función que se ejecuta cuando la petición se completa con éxito y el servidor devuelve una respuesta válida (por ejemplo, un código de estado 200 OK). Aquí es donde normalmente procesas los datos recibidos.
* **`error`**: Esta función se invoca si algo sale mal con la petición, ya sea un error de red, un timeout, o un código de estado de error del servidor (como 404 Not Found, 500 Internal Server Error). Dentro de esta función, recibes un objeto `HttpErrorResponse` que contiene información detallada sobre el error (código de estado, mensaje, etc.). Es aquí donde puedes mostrar mensajes de error al usuario, registrar el error para depuración, o intentar reintentar la petición.
* **`complete`**: Se ejecuta cuando el Observable se completa, ya sea con éxito o con un error. Es útil para limpiar recursos o para lógica que siempre debe ejecutarse al final de la petición.

Además, puedes usar operadores de RxJS como `catchError` para interceptar errores y transformarlos o reaccionar a ellos, y `retry` o `retryWhen` para reintentar automáticamente las peticiones fallidas. Un manejo de errores proactivo y user-friendly es esencial para la resiliencia de tu aplicación.
''',
    'code_example': r'''
// En tu servicio HTTP (ej. data.service.ts):
import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError, retry } from 'rxjs/operators'; // Importa operadores de RxJS

@Injectable({
  providedIn: 'root'
})
export class DataService {
  private baseUrl = 'https://jsonplaceholder.typicode.com'; // API de ejemplo

  constructor(private http: HttpClient) { }

  // Método para obtener datos y manejar respuestas/errores
  getUsers(): Observable<any[]> {
    return this.http.get<any[]>(`${this.baseUrl}/users`).pipe(
      retry(2), // Reintenta la petición hasta 2 veces si falla
      catchError(this.handleError) // Captura y maneja errores
    );
  }

  // Método para enviar datos
  createPost(data: any): Observable<any> {
    return this.http.post<any>(`${this.baseUrl}/posts`, data).pipe(
      catchError(this.handleError)
    );
  }

  // Manejador de errores centralizado
  private handleError(error: HttpErrorResponse) {
    let errorMessage = 'Ocurrió un error desconocido.';
    if (error.error instanceof ErrorEvent) {
      // Error del lado del cliente o de red
      console.error('Error del cliente o de red:', error.error.message);
      errorMessage = `Error: ${error.error.message}`;
    } else {
      // El backend retornó un código de respuesta de error.
      // El cuerpo de la respuesta puede contener información más específica.
      console.error(
        `Código de error del backend: ${error.status}, ` +
        `cuerpo: ${JSON.stringify(error.error)}`);

      if (error.status === 404) {
        errorMessage = 'Recurso no encontrado. La URL puede estar incorrecta.';
      } else if (error.status >= 500) {
        errorMessage = 'Error del servidor. Por favor, inténtelo más tarde.';
      } else if (error.status === 400) {
        errorMessage = 'Solicitud incorrecta. Verifique los datos enviados.';
      } else {
        errorMessage = `Error del servidor: ${error.status} - ${error.statusText || ''}`;
      }
    }
    // Devuelve un Observable con un mensaje de error legible para el usuario
    return throwError(() => new Error(errorMessage));
  }
}

// En tu componente (ej. app.component.ts o user-dashboard.component.ts):
import { Component, OnInit } from '@angular/core';
import { DataService } from './data.service'; // Importa tu servicio

@Component({
  selector: 'app-user-dashboard',
  template: `
    <h2>Dashboard de Usuarios</h2>
    <button (click)="loadUsers()">Cargar Usuarios</button>
    <div *ngIf="users.length > 0">
      <h3>Usuarios:</h3>
      <ul>
        <li *ngFor="let user of users">{{ user.name }}</li>
      </ul>
    </div>
    <p *ngIf="loading">Cargando...</p>
    <p *ngIf="userError" style="color: red;">{{ userError }}</p>

    <hr>
    <h3>Crear Nueva Publicación</h3>
    <button (click)="createPost()">Crear Post</button>
    <p *ngIf="postSuccess" style="color: green;">Post creado con éxito!</p>
    <p *ngIf="postError" style="color: red;">{{ postError }}</p>
  `
})
export class UserDashboardComponent implements OnInit {
  users: any[] = [];
  loading: boolean = false;
  userError: string | null = null;
  postSuccess: boolean = false;
  postError: string | null = null;

  constructor(private dataService: DataService) { }

  ngOnInit(): void {
    // Puedes cargar usuarios al inicio si lo deseas
    // this.loadUsers();
  }

  loadUsers(): void {
    this.loading = true;
    this.userError = null;
    this.dataService.getUsers().subscribe({
      next: (data) => {
        this.users = data;
        this.loading = false;
        console.log('Usuarios cargados:', data);
      },
      error: (err: Error) => { // El error ya es un objeto Error gracias a handleError
        this.userError = err.message;
        this.loading = false;
        console.error('Error en el componente al cargar usuarios:', err);
      },
      complete: () => {
        console.log('Petición de usuarios completada.');
      }
    });
  }

  createPost(): void {
    this.postSuccess = false;
    this.postError = null;
    const newPost = {
      title: 'Mi nueva publicación Angular',
      body: 'Contenido interesante sobre Angular.',
      userId: 1
    };
    this.dataService.createPost(newPost).subscribe({
      next: (response) => {
        this.postSuccess = true;
        console.log('Post creado:', response);
      },
      error: (err: Error) => {
        this.postError = err.message;
        console.error('Error en el componente al crear post:', err);
      }
    });
  }

  // Ejemplo de CÓDIGO INCORRECTO:
  // No manejar errores en la suscripción, dejando a la aplicación vulnerable a fallos:
  // this.dataService.getUsers().subscribe(data => {
  //   this.users = data;
  // }); // <-- Falta la función 'error' aquí.
}

/*
Un error común es no manejar el error en el `subscribe()` del componente.
Si el `catchError` en el servicio simplemente registra el error y no lo 'relanza'
con `throwError(() => new Error(errorMessage))`, el `subscribe()` del componente
nunca recibirá el error y la aplicación podría no reaccionar visualmente.

Otro error es no diferenciar entre `ErrorEvent` (errores de red/cliente)
y `HttpErrorResponse` (errores del servidor) para dar mensajes más precisos.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Servicios y Comunicación HTTP',
    'topic': 'Comunicación HTTP',
    'subtopic': 'Configuración de encabezados y parámetros',
    'definition': r'''
Las peticiones HTTP son más que solo enviar datos al cuerpo. A menudo, necesitas enviar información adicional que no es parte del "payload" principal, como tokens de autenticación, tipos de contenido o criterios de filtrado para una API. Aquí es donde la "configuración de encabezados y parámetros" entra en juego, permitiéndote afinar tus peticiones.

Aquí te va la aclaración: Pensemos por un momento en una aplicación que requiere que el usuario esté autenticado para acceder a ciertos recursos. Cuando haces una petición a una API protegida, necesitas enviar un token de autorización en los encabezados HTTP. O quizás, quieres obtener una lista de productos y filtrarla por categoría o paginación. Estos filtros no van en la ruta directamente, sino como "parámetros de consulta" (query parameters) en la URL, como `?category=electronics&page=1`. `HttpClient` de Angular te permite configurar fácilmente tanto los encabezados (headers) como los parámetros de consulta (params) al realizar una petición. Puedes usar la clase `HttpHeaders` para añadir o modificar encabezados (como `Authorization` o `Content-Type`) y `HttpParams` para construir parámetros de consulta de manera segura y legible. Esto es crucial para interactuar correctamente con APIs RESTful, donde los encabezados se utilizan para la seguridad y la configuración, y los parámetros se usan para el filtrado, la clasificación y la paginación. Dominar esto te da un control completo sobre cómo tu aplicación se comunica con el servidor.
''',
    'code_example': r'''
// En tu servicio HTTP (ej. api.service.ts):
import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams, HttpErrorResponse } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class ApiService {
  private apiUrl = 'https://jsonplaceholder.typicode.com'; // API de ejemplo

  constructor(private http: HttpClient) { }

  // Método para obtener posts con encabezados personalizados y parámetros de consulta
  getPosts(userId?: number, limit?: number): Observable<any[]> {
    let headers = new HttpHeaders();
    headers = headers.set('X-Custom-Header', 'AngularApp'); // Añade un encabezado personalizado
    headers = headers.set('Authorization', 'Bearer_MiTokenSecreto'); // Ejemplo de token de autenticación

    let params = new HttpParams();
    if (userId) {
      params = params.set('userId', userId.toString()); // Añade parámetro de consulta userId
    }
    if (limit) {
      params = params.set('_limit', limit.toString()); // Añade parámetro de consulta _limit (para JSONPlaceholder)
    }

    return this.http.get<any[]>(`${this.apiUrl}/posts`, { headers: headers, params: params }).pipe(
      catchError(this.handleError)
    );
  }

  // Método para añadir un post con encabezados específicos (ej. Content-Type)
  addPost(postData: any): Observable<any> {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json; charset=UTF-8', // Tipo de contenido
      'X-Another-Header': 'ValorPersonalizado'
    });

    return this.http.post<any>(`${this.apiUrl}/posts`, postData, { headers: headers }).pipe(
      catchError(this.handleError)
    );
  }

  // Manejador de errores (reutilizado del subtema anterior)
  private handleError(error: HttpErrorResponse) {
    let errorMessage = 'Ocurrió un error en la petición.';
    if (error.error instanceof ErrorEvent) {
      errorMessage = `Error del cliente: ${error.error.message}`;
    } else {
      errorMessage = `Error del servidor: ${error.status} - ${error.message}`;
      if (error.status === 401) {
        errorMessage = 'No autorizado. Por favor, inicie sesión.';
      }
    }
    console.error('Error HTTP:', error);
    return throwError(() => new Error(errorMessage));
  }
}

// En tu componente (ej. posts-viewer/posts-viewer.component.ts):
import { Component, OnInit } from '@angular/core';
import { ApiService } from '../api.service'; // Importa tu servicio

@Component({
  selector: 'app-posts-viewer',
  template: `
    <h2>Publicaciones</h2>
    <div>
      <label for="userIdFilter">Filtrar por User ID:</label>
      <input type="number" id="userIdFilter" [(ngModel)]="filterUserId">
      <label for="limitFilter">Límite:</label>
      <input type="number" id="limitFilter" [(ngModel)]="filterLimit">
      <button (click)="loadPosts()">Cargar Posts</button>
    </div>
    <ul *ngIf="posts.length > 0">
      <li *ngFor="let post of posts">
        {{ post.title }} (By User: {{ post.userId }})
      </li>
    </ul>
    <p *ngIf="loading">Cargando posts...</p>
    <p *ngIf="errorMessage" style="color: red;">{{ errorMessage }}</p>

    <hr>
    <h3>Añadir Nueva Publicación</h3>
    <button (click)="addSamplePost()">Añadir Post de Prueba</button>
    <p *ngIf="addSuccess" style="color: green;">Post añadido!</p>
    <p *ngIf="addError" style="color: red;">{{ addError }}</p>
  `
})
export class PostsViewerComponent implements OnInit {
  posts: any[] = [];
  loading: boolean = false;
  errorMessage: string | null = null;
  filterUserId: number | null = null;
  filterLimit: number | null = 5;
  addSuccess: boolean = false;
  addError: string | null = null;

  constructor(private apiService: ApiService) { }

  ngOnInit(): void {
    this.loadPosts();
  }

  loadPosts(): void {
    this.loading = true;
    this.errorMessage = null;
    this.posts = [];
    this.apiService.getPosts(this.filterUserId || undefined, this.filterLimit || undefined).subscribe({
      next: (data) => {
        this.posts = data;
        this.loading = false;
      },
      error: (err: Error) => {
        this.errorMessage = err.message;
        this.loading = false;
      }
    });
  }

  addSamplePost(): void {
    this.addSuccess = false;
    this.addError = null;
    const newPost = {
      title: 'Mi Post de Prueba con Headers',
      body: 'Este es el contenido de un post de prueba.',
      userId: 99
    };
    this.apiService.addPost(newPost).subscribe({
      next: (response) => {
        this.addSuccess = true;
        console.log('Post añadido con headers:', response);
      },
      error: (err: Error) => {
        this.addError = err.message;
      }
    });
  }

  // Ejemplo de CÓDIGO INCORRECTO:
  // No intentar construir los encabezados o parámetros correctamente.
  // No es buena práctica concatenar manualmente query params a la URL sin HttpParams.
  // this.http.get(`${this.apiUrl}/posts?userId=${userId}`); // Menos seguro y propenso a errores de codificación URL
}

/*
Un error común es intentar mutar objetos `HttpHeaders` o `HttpParams` directamente.
Son inmutables. Cada vez que llamas a `.set()`, `.append()`, etc.,
devuelven una NUEVA instancia con los cambios. Debes reasignar la variable
(`headers = headers.set(...)`).

Otro error es no convertir los números a strings cuando se usan en `HttpParams.set()`,
ya que `.set()` espera un string.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Servicios y Comunicación HTTP',
    'topic': 'Interceptores',
    'subtopic': 'Creación de interceptores para modificar solicitudes',
    'definition': r'''
Cuando tu aplicación Angular crece y necesitas aplicar lógica transversal a todas (o a muchas) tus peticiones HTTP, como añadir un token de autorización o registrar cada petición, los "interceptores" son la solución elegante y potente que Angular te ofrece.

No sé tú, pero a mí esto al principio me costó 🤯. La idea es que un interceptor es un "middleware" para tus peticiones HTTP. Pensemos por un momento en una cadena de montaje: antes de que un producto salga de la fábrica (tu petición HTTP se envíe), pasa por varias estaciones donde se le pueden añadir componentes, modificar o incluso rechazar. Los interceptores funcionan de manera similar. Implementas la interfaz `HttpInterceptor` y defines un método `intercept()` que recibe la solicitud HTTP saliente y un "manejador" para la siguiente parte de la cadena. Dentro de este método, puedes modificar la solicitud (por ejemplo, añadir un encabezado, un cuerpo, o parámetros), o puedes modificar la respuesta entrante. Esto es fantástico porque centraliza la lógica que de otro modo tendrías que repetir en cada uno de tus servicios HTTP. Ya sea para añadir un `Bearer Token` para la autenticación, incluir un encabezado personalizado para el seguimiento o incluso para manipular la URL de la petición, un interceptor te permite hacerlo de forma global y transparente para el resto de tu código.
''',
    'code_example': r'''
// 1. Crear el interceptor (ej. auth.interceptor.ts):
import { Injectable } from '@angular/core';
import {
  HttpRequest,
  HttpHandler,
  HttpEvent,
  HttpInterceptor
} from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable() // No necesita providedIn: 'root' aquí, se provee en el módulo
export class AuthInterceptor implements HttpInterceptor {

  constructor() {}

  intercept(request: HttpRequest<unknown>, next: HttpHandler): Observable<HttpEvent<unknown>> {
    // Clona la solicitud para poder modificarla (las solicitudes son inmutables)
    const authToken = 'MiTokenDeAutenticacionFijo123'; // Simula obtener un token de un servicio de autenticación

    // Añade el token de autorización al encabezado
    const authRequest = request.clone({
      setHeaders: {
        Authorization: `Bearer ${authToken}`
      }
    });

    console.log('AuthInterceptor: Solicitud interceptada y token añadido.');
    // Pasa la solicitud modificada al siguiente manejador en la cadena
    return next.handle(authRequest);
  }
}

// 2. Proveer el interceptor en tu módulo (ej. app.module.ts):
// Es crucial registrar el interceptor en el array 'providers' de tu módulo.
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http'; // Importa HTTP_INTERCEPTORS
import { AppComponent } from './app.component';
import { AuthInterceptor } from './auth.interceptor'; // Importa tu interceptor
import { DataService } from './data.service'; // Servicio para probar

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule
  ],
  providers: [
    DataService, // Tu servicio para hacer peticiones HTTP
    {
      provide: HTTP_INTERCEPTORS, // Token de inyección para interceptores
      useClass: AuthInterceptor,  // Tu clase de interceptor
      multi: true                 // Importante: permite múltiples interceptores
    }
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }

// 3. Un servicio haciendo una petición que será interceptada
// src/app/data.service.ts
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root' // Ojo: Este servicio está en root, pero su petición pasará por el interceptor global
})
export class DataService {
  private apiUrl = 'https://jsonplaceholder.typicode.com/posts/1'; // API de ejemplo

  constructor(private http: HttpClient) { }

  getData(): Observable<any> {
    console.log('DataService: Haciendo petición GET...');
    // Esta petición será interceptada por AuthInterceptor automáticamente
    return this.http.get<any>(this.apiUrl);
  }
}

// 4. Componente que usa el servicio (ej. app.component.ts)
import { Component, OnInit } from '@angular/core';
import { DataService } from './data.service';

@Component({
  selector: 'app-root',
  template: `
    <h1>Demostración de Interceptor</h1>
    <button (click)="fetchData()">Obtener Datos</button>
    <p *ngIf="data">Datos obtenidos: {{ data | json }}</p>
    <p *ngIf="error" style="color: red;">Error: {{ error }}</p>
  `
})
export class AppComponent implements OnInit {
  data: any;
  error: string | null = null;

  constructor(private dataService: DataService) { }

  ngOnInit(): void { }

  fetchData(): void {
    this.data = null;
    this.error = null;
    this.dataService.getData().subscribe({
      next: (res) => {
        this.data = res;
        console.log('Datos recibidos en el componente:', res);
      },
      error: (err) => {
        this.error = 'Falló la obtención de datos.';
        console.error('Error al obtener datos:', err);
      }
    });
  }
}

/*
Un error común es olvidar la propiedad `multi: true` en la configuración del interceptor en `providers`.
Si no la incluyes, solo se registrará el último interceptor que añadas, y los demás serán ignorados.
`multi: true` le dice a Angular que `HTTP_INTERCEPTORS` es un token para una colección de proveedores.

Otro error es intentar modificar la solicitud `request` directamente sin clonarla.
Las solicitudes HTTP en Angular son inmutables. Siempre debes usar `request.clone()`
para crear una versión modificada.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Servicios y Comunicación HTTP',
    'topic': 'Interceptores',
    'subtopic': 'Manejo de errores globales',
    'definition': r'''
Si bien es importante manejar los errores en cada suscripción de HTTP, a veces quieres una forma centralizada de capturar y reaccionar a los errores HTTP en toda tu aplicación, especialmente para errores que son comunes y requieren una acción global, como mostrar un mensaje de notificación o redirigir al usuario. Aquí, los interceptores de errores son tu mejor amigo.

Esto tiene una explicación, y es porque Pensemos por un momento en una situación donde tu API de backend devuelve un error 401 (No Autorizado) si el token de sesión ha expirado. Lo normal sería que, al recibir este error, tu aplicación redirija al usuario a la página de inicio de sesión. Si tuvieras que añadir esta lógica a *cada* lugar donde haces una petición HTTP, sería repetitivo y propenso a errores. Un interceptor de errores permite centralizar esta lógica. Puedes implementar un interceptor que capture todas las respuestas HTTP. Si la respuesta es un error, puedes inspeccionar el código de estado. Si es un 401, por ejemplo, podrías redirigir al usuario. Además de la redirección, un interceptor puede ser utilizado para:
* **Registrar errores**: Enviar información de errores a un servicio de monitoreo (como Sentry o LogRocket).
* **Mostrar notificaciones**: Desencadenar una notificación global de error (un toast, un snackbar) sin que cada componente tenga que preocuparse por ello.
* **Reintentar peticiones**: Implementar lógica para reintentar peticiones fallidas (aunque `retry` de RxJS también es útil).

La belleza de esto es que desacopla la lógica de manejo de errores de tus componentes y servicios individuales, haciendo tu código más limpio, modular y fácil de mantener.
''',
    'code_example': r'''
// 1. Crear el interceptor de errores (ej. error.interceptor.ts):
import { Injectable } from '@angular/core';
import {
  HttpRequest,
  HttpHandler,
  HttpEvent,
  HttpInterceptor,
  HttpErrorResponse // Importa HttpErrorResponse
} from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators'; // Importa catchError
import { Router } from '@angular/router'; // Si vas a redirigir

@Injectable()
export class ErrorInterceptor implements HttpInterceptor {

  constructor(private router: Router) {} // Inyecta Router si necesitas redirigir

  intercept(request: HttpRequest<unknown>, next: HttpHandler): Observable<HttpEvent<unknown>> {
    return next.handle(request).pipe(
      catchError((error: HttpErrorResponse) => { // Captura el error aquí
        let errorMessage = 'Ocurrió un error desconocido.';
        if (error.error instanceof ErrorEvent) {
          // Error del lado del cliente o de red
          errorMessage = `Error del cliente o de red: ${error.error.message}`;
        } else {
          // El backend retornó un código de respuesta de error.
          errorMessage = `Error del servidor: ${error.status} - ${error.message}`;

          // Lógica de manejo de errores global
          switch (error.status) {
            case 401: // No autorizado
              console.error('Error 401: No autorizado. Redirigiendo a login.');
              // Aquí podrías redirigir a la página de login
              // this.router.navigate(['/login']);
              break;
            case 403: // Prohibido (sin permisos)
              console.error('Error 403: Acceso denegado.');
              // Mostrar notificación de acceso denegado
              break;
            case 500: // Error interno del servidor
              console.error('Error 500: Fallo interno del servidor.');
              // Mostrar mensaje de error genérico al usuario
              break;
            // Añade más casos según necesites
          }
        }
        console.error('Interceptor de Errores: Error capturado:', errorMessage);
        // Propaga el error para que los suscriptores individuales puedan manejarlo también
        return throwError(() => new Error(errorMessage));
      })
    );
  }
}

// 2. Proveer el interceptor en tu módulo (ej. app.module.ts):
// Asegúrate de que el ErrorInterceptor se provea DESPUÉS del AuthInterceptor si usas ambos,
// para que el AuthInterceptor añada el token antes de que el ErrorInterceptor procese la respuesta.
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { AppComponent } from './app.component';
import { AuthInterceptor } from './auth.interceptor'; // Tu interceptor de autenticación
import { ErrorInterceptor } from './error.interceptor'; // Tu interceptor de errores
import { DataService } from './data.service';

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule
  ],
  providers: [
    DataService,
    {
      provide: HTTP_INTERCEPTORS,
      useClass: AuthInterceptor,
      multi: true
    },
    {
      provide: HTTP_INTERCEPTORS,
      useClass: ErrorInterceptor,
      multi: true // Es crucial para permitir múltiples interceptores
    }
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }

// 3. Servicio para probar (ej. data.service.ts)
// La lógica de manejo de errores en el servicio puede ser más simple ahora,
// ya que el interceptor global se encarga de lo común.
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class DataService {
  private apiUrlError = 'https://jsonplaceholder.typicode.com/nonexistent'; // URL que dará 404
  private apiUrlAuth = 'https://jsonplaceholder.typicode.com/posts'; // Para simular auth fallida

  constructor(private http: HttpClient) { }

  getNonExistentResource(): Observable<any> {
    console.log('DataService: Solicitando recurso inexistente...');
    return this.http.get<any>(this.apiUrlError); // Este fallará con 404
  }

  // Simula una petición que podría fallar con 401 si no hay token (aunque JSONPlaceholder no lo hace)
  getProtectedData(): Observable<any> {
    console.log('DataService: Solicitando datos protegidos...');
    return this.http.get<any>(this.apiUrlAuth);
  }
}

// 4. Componente para interactuar (ej. app.component.ts)
import { Component } from '@angular/core';
import { DataService } from './data.service';

@Component({
  selector: 'app-root',
  template: `
    <h1>Manejo de Errores Globales con Interceptores</h1>
    <button (click)="loadNonExistent()">Cargar Recurso Inexistente (404)</button>
    <button (click)="loadProtectedData()">Cargar Datos Protegidos (Simula 401)</button>
    <p *ngIf="componentError" style="color: red;">Error en el Componente: {{ componentError }}</p>
  `
})
export class AppComponent {
  componentError: string | null = null;

  constructor(private dataService: DataService) { }

  loadNonExistent(): void {
    this.componentError = null;
    this.dataService.getNonExistentResource().subscribe({
      next: () => { console.log('Esto no debería pasar.'); },
      error: (err) => {
        this.componentError = `Error en el componente: ${err.message}`;
        console.error('Error en componente al cargar recurso inexistente:', err);
      }
    });
  }

  loadProtectedData(): void {
    this.componentError = null;
    // Si la API fuera real y respondiera con 401, el interceptor lo capturaría primero.
    this.dataService.getProtectedData().subscribe({
      next: (data) => { console.log('Datos protegidos obtenidos:', data); },
      error: (err) => {
        this.componentError = `Error en el componente al cargar datos protegidos: ${err.message}`;
        console.error('Error en componente al cargar datos protegidos:', err);
      }
    });
  }
}

/*
Un error común es que el interceptor capture el error pero no lo 'relance' usando `throwError()`.
Si el interceptor solo registra el error y no lo propaga, los suscriptores (`subscribe()`)
del `HttpClient` en los servicios o componentes no recibirán el error, y su lógica
de `error` nunca se ejecutará, lo que puede ocultar problemas.

Otro error es la *orden* de los interceptores. El orden en el que los provees en `app.module.ts`
es importante. Un interceptor que añade encabezados (AuthInterceptor) debe ir antes de uno
que maneja errores de red (ErrorInterceptor) si quieres que el token se incluya en la petición
antes de que un posible error de red sea capturado.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Servicios y Comunicación HTTP',
    'topic': 'Interceptores',
    'subtopic': 'Implementación de autenticación y autorización',
    'definition': r'''
La autenticación (saber quién eres) y la autorización (qué puedes hacer) son pilares fundamentales de la seguridad en la mayoría de las aplicaciones web. Implementar estas funcionalidades de forma robusta y escalable es crucial, y en Angular, los interceptores son la herramienta estrella para ello.

Vamos a ver de que se trata todo esto... 

Pensemos por un momento en un escenario donde, después de que un usuario inicia sesión, recibes un "token de acceso" (como un JWT - JSON Web Token). Este token debe incluirse en casi todas las peticiones que tu aplicación haga a la API de backend para demostrar que el usuario está autenticado y tiene permiso para acceder a los recursos. Sin un interceptor, tendrías que añadir manualmente el `Authorization` header a cada `HttpClient.get()`, `post()`, etc., lo cual es tedioso y propenso a errores. Un interceptor de autenticación centraliza esta lógica. Él se encarga de:
1.  **Añadir el token de autenticación**: Antes de que cualquier petición HTTP salga, el interceptor clona la solicitud y le añade el `Authorization` header con el token.
2.  **Manejar tokens expirados o errores 401**: Si el backend devuelve un error 401 (Unauthorized), el interceptor puede detectar esto, intentar refrescar el token (si es posible), o redirigir al usuario a la página de inicio de sesión.
Esto no solo simplifica tu código en los servicios y componentes, sino que también mejora la seguridad y la mantenibilidad. La autenticación y autorización no son solo sobre enviar un token; también implican la gestión del ciclo de vida del token (almacenamiento seguro, expiración, refresco) y la protección de rutas en el lado del cliente (con Guards), de los que hablaremos en otro momento. Los interceptores son el eslabón fundamental para la comunicación segura con tu backend.
''',
    'code_example': r'''
// 1. Servicio de autenticación (ej. auth.service.ts) - Simula el login y gestión del token
import { Injectable } from '@angular/core';
import { Observable, of, BehaviorSubject } from 'rxjs';
import { tap, delay } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  // BehaviorSubject para observar el estado de autenticación
  private loggedIn = new BehaviorSubject<boolean>(false);
  isLoggedIn = this.loggedIn.asObservable(); // Observable público

  private _authToken: string | null = null; // Almacena el token

  constructor() {
    // Intentar cargar el token al iniciar la app
    this._authToken = localStorage.getItem('auth_token');
    this.loggedIn.next(!!this._authToken); // Actualiza el estado de autenticación
  }

  // Simula un inicio de sesión
  login(username: string, password: string): Observable<boolean> {
    // Lógica real de login y obtención de token de un backend
    // Por simplicidad, un login exitoso si los credenciales son 'user'/'pass'
    if (username === 'user' && password === 'pass') {
      const token = 'fake-jwt-token-12345';
      this._authToken = token;
      localStorage.setItem('auth_token', token); // Guardar token (en un entorno real, usar Local Storage con precaución)
      this.loggedIn.next(true);
      return of(true).pipe(delay(500)); // Simula latencia
    }
    return of(false).pipe(delay(500));
  }

  logout(): void {
    this._authToken = null;
    localStorage.removeItem('auth_token');
    this.loggedIn.next(false);
  }

  getAuthToken(): string | null {
    return this._authToken;
  }
}

// 2. Interceptor de Autenticación (ej. auth.interceptor.ts)
import { Injectable } from '@angular/core';
import {
  HttpRequest,
  HttpHandler,
  HttpEvent,
  HttpInterceptor,
  HttpErrorResponse
} from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { AuthService } from './auth.service'; // Inyecta el AuthService
import { Router } from '@angular/router';

@Injectable()
export class AuthInterceptor implements HttpInterceptor {

  constructor(private authService: AuthService, private router: Router) {}

  intercept(request: HttpRequest<unknown>, next: HttpHandler): Observable<HttpEvent<unknown>> {
    const authToken = this.authService.getAuthToken();

    // Clona la solicitud y añade el token si existe
    if (authToken) {
      request = request.clone({
        setHeaders: {
          Authorization: `Bearer ${authToken}`
        }
      });
      console.log('AuthInterceptor: Token de autenticación añadido.');
    }

    return next.handle(request).pipe(
      catchError((error: HttpErrorResponse) => {
        // Manejo de errores de autenticación/autorización
        if (error.status === 401 || error.status === 403) {
          console.error('AuthInterceptor: Error de autenticación/autorización (401/403).');
          this.authService.logout(); // Limpiar token
          this.router.navigate(['/login']); // Redirigir a la página de login
        }
        // Propaga el error para que otros manejadores o el suscriptor lo procesen
        return throwError(() => error);
      })
    );
  }
}

// 3. Proveer el interceptor y el servicio en tu módulo (ej. app.module.ts):
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { FormsModule } from '@angular/forms'; // Para el login
import { AppRoutingModule } from './app-routing.module'; // Para rutas
import { AppComponent } from './app.component';
import { AuthInterceptor } from './auth.interceptor';
import { AuthService } from './auth.service';
import { DataService } from './data.service'; // Para probar peticiones
import { LoginComponent } from './login/login.component'; // Componente de login
import { DashboardComponent } from './dashboard/dashboard.component'; // Componente protegido

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    DashboardComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    FormsModule,
    AppRoutingModule // Importa tu módulo de rutas
  ],
  providers: [
    AuthService,
    DataService,
    {
      provide: HTTP_INTERCEPTORS,
      useClass: AuthInterceptor,
      multi: true
    }
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }

// 4. Componente de Login (ej. login/login.component.ts)
import { Component } from '@angular/core';
import { AuthService } from '../auth.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  template: `
    <h2>Login</h2>
    <input type="text" [(ngModel)]="username" placeholder="Usuario (user)">
    <input type="password" [(ngModel)]="password" placeholder="Contraseña (pass)">
    <button (click)="onLogin()">Iniciar Sesión</button>
    <p *ngIf="loginError" style="color: red;">{{ loginError }}</p>
  `
})
export class LoginComponent {
  username = 'user';
  password = 'pass';
  loginError: string | null = null;

  constructor(private authService: AuthService, private router: Router) {}

  onLogin(): void {
    this.loginError = null;
    this.authService.login(this.username, this.password).subscribe(success => {
      if (success) {
        this.router.navigate(['/dashboard']); // Redirigir a una ruta protegida
      } else {
        this.loginError = 'Credenciales inválidas.';
      }
    });
  }
}

// 5. Componente protegido (ej. dashboard/dashboard.component.ts)
import { Component, OnInit } from '@angular/core';
import { DataService } from '../data.service';
import { AuthService } from '../auth.service';

@Component({
  selector: 'app-dashboard',
  template: `
    <h2>Dashboard (Protegido)</h2>
    <button (click)="fetchProtectedData()">Obtener Datos Protegidos</button>
    <p *ngIf="protectedData">Datos Protegidos: {{ protectedData | json }}</p>
    <p *ngIf="protectedError" style="color: red;">Error: {{ protectedError }}</p>
    <button (click)="authService.logout()">Cerrar Sesión</button>
  `
})
export class DashboardComponent implements OnInit {
  protectedData: any;
  protectedError: string | null = null;

  constructor(private dataService: DataService, public authService: AuthService) {}

  ngOnInit(): void {
    // Intentar cargar datos al inicio del dashboard
    this.fetchProtectedData();
  }

  fetchProtectedData(): void {
    this.protectedData = null;
    this.protectedError = null;
    // Simular una API que requiere autenticación
    this.dataService.getProtectedData().subscribe({
      next: (data) => {
        this.protectedData = data;
      },
      error: (err) => {
        this.protectedError = `Error al obtener datos protegidos: ${err.message}`;
      }
    });
  }
}

// 6. Módulo de rutas (ej. app-routing.module.ts) - Para proteger rutas
import { NgModule } from '@angular/core';
import { RouterModule, Routes, CanActivateFn } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { AuthService } from './auth.service';
import { map, take } from 'rxjs/operators';

// Guard para proteger rutas
const authGuard: CanActivateFn = (route, state) => {
  const authService = new AuthService(); // NOTA: Esto es solo un ejemplo simplificado, en un entorno real se inyectaría
                                         // el servicio de auth en una función de guarda.
                                         // Para una implementación correcta de un guard, ver el subtema de Guards.
  return authService.isLoggedIn.pipe(
    take(1), // Toma el primer valor y completa
    map(isAuth => {
      if (isAuth) {
        return true;
      } else {
        console.warn('Acceso denegado. Redirigiendo a login.');
        // router.navigate(['/login']); // No podemos inyectar Router aquí directamente en CanActivateFn <= Angular 15
        // En Angular 15+, se puede inyectar con inject(Router)
        return false;
      }
    })
  );
};


const routes: Routes = [
  { path: 'login', component: LoginComponent },
  { path: 'dashboard', component: DashboardComponent, canActivate: [authGuard] }, // Ruta protegida
  { path: '', redirectTo: '/dashboard', pathMatch: 'full' },
  { path: '**', redirectTo: '/dashboard' } // Ruta comodín
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

/*
Un error común al implementar autenticación con interceptores es almacenar el token
en `localStorage` sin considerar los riesgos de seguridad (ej. ataques XSS).
Para aplicaciones reales, considera usar `sessionStorage` o soluciones más seguras
si el token es sensible.

Otro error es no manejar la expiración del token y los errores 401.
Un interceptor bien diseñado debe detectar un 401 y, o bien intentar refrescar el token,
o bien redirigir al usuario a la página de login para que se autentique de nuevo.
No manejar esto resulta en una mala experiencia de usuario.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Servicios y Comunicación HTTP',
    'topic': 'Observables y RxJS',
    'subtopic': 'Introducción a Observables',
    'definition': r'''
Si has estado trabajando con Angular por un tiempo, seguramente te habrás topado con los "Observables" y "RxJS". Estos no son solo términos de moda; son la columna vertebral de cómo Angular maneja eventos asíncronos y flujos de datos. Entenderlos es un antes y un después en tu desarrollo Angular.

Aquí te va la aclaración: Pensemos por un momento en una petición a una API para obtener datos. Esta petición no sucede instantáneamente; toma un tiempo y la respuesta llegará en algún momento en el futuro. Antes, en JavaScript, solíamos usar "callbacks" o "Promises" para manejar esto. Los Observables son una evolución de esos conceptos. Son como "fuentes de datos que emiten valores a lo largo del tiempo, de forma asíncrona". Un Observable puede emitir cero, uno o múltiples valores, y también puede emitir un error o una señal de "completado". La clave es que son "lazy", es decir, no hacen nada hasta que alguien se "suscribe" a ellos. Es como si tuvieras una suscripción a una revista: no te llegan las revistas hasta que te suscribes, y te siguen llegando hasta que te das de baja o la revista deja de publicarse. `HttpClient` de Angular, por ejemplo, devuelve Observables para todas sus peticiones. Esto es increíblemente poderoso porque te permite trabajar con flujos de datos de una manera muy declarativa y funcional, usando una vasta colección de "operadores" de RxJS para transformar, combinar, filtrar y manejar esos flujos de datos de manera eficiente.
''',
    'code_example': r'''
// 1. Un Observable básico (src/app/observable-intro/observable-intro.component.ts)
import { Component, OnInit } from '@angular/core';
import { Observable, Observer } from 'rxjs'; // Importa Observable y Observer

@Component({
  selector: 'app-observable-intro',
  template: `
    <h2>Introducción a Observables</h2>
    <p>Mensajes del Observable:</p>
    <ul>
      <li *ngFor="let message of messages">{{ message }}</li>
    </ul>
    <p *ngIf="completed">Observable Completado.</p>
    <p *ngIf="error" style="color: red;">Error: {{ error }}</p>
  `
})
export class ObservableIntroComponent implements OnInit {
  messages: string[] = [];
  completed: boolean = false;
  error: string | null = null;

  ngOnInit(): void {
    // 2. Crear un Observable
    const myObservable = new Observable((observer: Observer<string>) => {
      // observer es el "consumidor" que recibirá los valores
      console.log('Observable: Hola, soy el productor de datos!');

      // Emitir algunos valores
      observer.next('Dato 1');
      observer.next('Dato 2');

      // Simular un evento asíncrono
      setTimeout(() => {
        observer.next('Dato 3 (después de 1 segundo)');
        // observer.error('¡Ups! Algo salió mal.'); // Simular un error
        observer.complete(); // Indica que el Observable ha terminado de emitir valores
      }, 1000);

      // Función de limpieza opcional (se ejecuta al desuscribirse o al completar/error)
      return () => {
        console.log('Observable: Limpieza realizada.');
      };
    });

    // 3. Suscribirse al Observable
    console.log('Componente: Antes de suscribirse.');
    myObservable.subscribe({
      next: (data: string) => {
        // Función que se ejecuta cuando el Observable emite un valor
        this.messages.push(data);
        console.log('Componente: Recibido ->', data);
      },
      error: (err: any) => {
        // Función que se ejecuta si el Observable emite un error
        this.error = err;
        console.error('Componente: Error ->', err);
      },
      complete: () => {
        // Función que se ejecuta cuando el Observable se completa
        this.completed = true;
        console.log('Componente: Completado.');
      }
    });
    console.log('Componente: Después de suscribirse.');
  }

  // EJEMPLO DE CÓDIGO INCORRECTO:
  // No suscribirse a un Observable "frío" (como los de HttpClient) significa que nunca se ejecutará.
  // this.http.get('/api/data'); // <-- Esto no hace la petición porque falta el .subscribe()
}

// Para usar el componente, agrégalo a tu app.module.ts:
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppComponent } from './app.component';
import { ObservableIntroComponent } from './observable-intro/observable-intro.component';

@NgModule({
  declarations: [
    AppComponent,
    ObservableIntroComponent // Añade el componente
  ],
  imports: [
    BrowserModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

// Y úsalo en tu app.component.html:
// <app-observable-intro></app-observable-intro>
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Servicios y Comunicación HTTP',
    'topic': 'Observables y RxJS',
    'subtopic': 'Operadores básicos de RxJS',
    'definition': r'''
Los Observables por sí solos son poderosos, pero su verdadera magia radica en la vasta colección de "operadores" que nos ofrece RxJS. Estos operadores son funciones que te permiten transformar, combinar, filtrar y manipular los datos que fluyen a través de un Observable de manera declarativa y funcional, como si estuvieras construyendo un "ducto" para tus datos.

Vamos a ver de que se trata todo esto... 

Pensemos por un momento en una tubería: un Observable es el agua que fluye, y los operadores son filtros, bombas o mezcladores que puedes instalar a lo largo de la tubería para procesar el agua antes de que llegue a su destino. RxJS categoriza los operadores en varios tipos:
* **Creación**: Para crear nuevos Observables (ej. `of`, `from`, `interval`).
* **Transformación**: Para cambiar la forma de los datos emitidos (ej. `map`, `pluck`, `mergeMap`, `switchMap`). `map` es como `Array.map`, pero para Observables. `switchMap` es crucial para evitar "condiciones de carrera" en peticiones HTTP, cancelando peticiones antiguas si llega una nueva.
* **Filtrado**: Para seleccionar solo algunos valores (ej. `filter`, `take`, `debounceTime`). `filter` es como `Array.filter`. `debounceTime` espera un tiempo antes de emitir un valor, útil para búsquedas.
* **Combinación**: Para unir múltiples Observables (ej. `forkJoin`, `combineLatest`, `concat`).
* **Manejo de errores**: Para reaccionar a errores (ej. `catchError`, `retry`).

La belleza de los operadores es que son "puros" (no modifican el Observable original, sino que devuelven uno nuevo) y "encadenables" (puedes aplicar múltiples operadores uno tras otro usando el método `pipe()`). Dominar los operadores de RxJS es clave para escribir código Angular reactivo, legible y eficiente, especialmente cuando se trata de consumir APIs, manejar eventos de UI o gestionar el estado de tu aplicación.
''',
    'code_example': r'''
// En tu componente (ej. rxjs-operators-demo/rxjs-operators-demo.component.ts):
import { Component, OnInit } from '@angular/core';
import { of, from, interval, forkJoin } from 'rxjs'; // Operadores de creación
import { map, filter, debounceTime, distinctUntilChanged, switchMap, catchError } from 'rxjs/operators'; // Operadores pipeable
import { HttpClient } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';

@Component({
  selector: 'app-rxjs-operators-demo',
  template: `
    <h2>Demostración de Operadores RxJS</h2>

    <h3>Operador map: Multiplicar números</h3>
    <p>Números originales: 1, 2, 3, 4, 5</p>
    <p>Números multiplicados por 10: {{ mappedNumbers | json }}</p>

    <h3>Operador filter: Números pares</h3>
    <p>Números originales: 1, 2, 3, 4, 5</p>
    <p>Números pares: {{ filteredNumbers | json }}</p>

    <h3>Operador debounceTime & distinctUntilChanged (Simulación de búsqueda)</h3>
    <label for="searchInput">Escribe algo para buscar:</label>
    <input id="searchInput" type="text" [(ngModel)]="searchQuery">
    <p>Texto de búsqueda final (debounced): {{ debouncedSearchQuery }}</p>
    <p *ngIf="searchResult">Resultado de búsqueda: {{ searchResult | json }}</p>

    <h3>Operador switchMap: Cancelación de peticiones</h3>
    <p>Obteniendo datos de un usuario (simulando peticiones rápidas):</p>
    <button (click)="getUserData(1)">Usuario 1</button>
    <button (click)="getUserData(2)">Usuario 2</button>
    <p *ngIf="userData">Datos del usuario: {{ userData | json }}</p>

    <h3>Operador forkJoin: Combinar múltiples Observables</h3>
    <button (click)="getCombinedData()">Cargar Datos Combinados</button>
    <p *ngIf="combinedData">Datos Combinados: {{ combinedData | json }}</p>
    <p *ngIf="combinedError" style="color: red;">Error Combinado: {{ combinedError }}</p>
  `
})
export class RxjsOperatorsDemoComponent implements OnInit {
  mappedNumbers: number[] = [];
  filteredNumbers: number[] = [];
  searchQuery: string = '';
  debouncedSearchQuery: string = '';
  searchResult: any;
  userData: any;
  combinedData: any;
  combinedError: string | null = null;

  constructor(private http: HttpClient) { }

  ngOnInit(): void {
    // Ejemplo de operador 'map'
    of(1, 2, 3, 4, 5).pipe(
      map(num => num * 10)
    ).subscribe(result => {
      this.mappedNumbers.push(result);
    });

    // Ejemplo de operador 'filter'
    of(1, 2, 3, 4, 5).pipe(
      filter(num => num % 2 === 0) // Solo números pares
    ).subscribe(result => {
      this.filteredNumbers.push(result);
    });

    // Ejemplo de 'debounceTime' y 'distinctUntilChanged' con simulación de input
    // Para esto, en un formulario reactivo usarías formControl.valueChanges
    // Aquí usamos un observable que emite el valor de searchQuery al cambiar
    // (Esto es solo para el ejemplo, en Angular real, usarías FormGroup/FormControl)
    const searchQueryChanges = new Observable<string>(observer => {
      Object.defineProperty(this, 'searchQuery', {
        set: (value: string) => {
          (this as any)._searchQuery = value;
          observer.next(value);
        },
        get: () => (this as any)._searchQuery
      });
    });

    searchQueryChanges.pipe(
      debounceTime(500), // Espera 500ms después de la última emisión
      distinctUntilChanged(), // Solo emite si el valor es diferente al anterior
      switchMap(query => { // Usa switchMap para cancelar peticiones anteriores
        this.debouncedSearchQuery = query;
        if (query.length > 2) {
          // Simula una petición HTTP de búsqueda
          console.log(`Simulando búsqueda para: ${query}`);
          return this.http.get(`https://jsonplaceholder.typicode.com/posts?q=${query}`).pipe(
            catchError(err => {
              console.error('Error en la búsqueda simulada:', err);
              return of(null); // Devuelve un observable que emite null en caso de error
            })
          );
        }
        return of(null); // Si el query es muy corto, no hace la petición
      })
    ).subscribe(result => {
      this.searchResult = result ? result.slice(0,1) : null; // Mostrar solo 1 resultado de ejemplo
    });
  }

  // Ejemplo de switchMap para cancelación de peticiones (típico en búsqueda)
  getUserData(userId: number): void {
    console.log(`Solicitando datos del usuario ${userId}...`);
    // Cada vez que se llama a getUserData, switchMap cancela la petición anterior
    // si aún está en curso y comienza una nueva.
    of(userId).pipe(
      switchMap(id => this.http.get(`https://jsonplaceholder.typicode.com/users/${id}`)),
      catchError(err => {
        console.error('Error al obtener datos del usuario:', err);
        return of(null);
      })
    ).subscribe(data => {
      this.userData = data;
      console.log(`Datos del usuario ${userId} recibidos.`);
    });
  }

  // Ejemplo de forkJoin para combinar Observables paralelos
  getCombinedData(): void {
    const posts$ = this.http.get('https://jsonplaceholder.typicode.com/posts/1');
    const comments$ = this.http.get('https://jsonplaceholder.typicode.com/posts/1/comments');
    const user$ = this.http.get('https://jsonplaceholder.typicode.com/users/1');

    // forkJoin espera que todos los Observables se completen y luego emite un array con sus resultados
    forkJoin([posts$, comments$, user$]).pipe(
      catchError(err => {
        this.combinedError = `Error al combinar datos: ${err.message}`;
        console.error('Error en forkJoin:', err);
        return throwError(() => err); // Re-lanza el error para que el suscriptor lo maneje
      })
    ).subscribe(
      ([posts, comments, user]) => {
        this.combinedData = { post: posts, comments: comments, user: user };
        console.log('Datos combinados:', this.combinedData);
      },
      error => {
        // Este error se capturará si throwError es usado en el catchError del pipe
        console.error('Error en el suscriptor de combinedData:', error);
      }
    );
  }

  // EJEMPLO DE CÓDIGO INCORRECTO:
  // Usar 'mergeMap' en lugar de 'switchMap' para búsquedas en tiempo real.
  // mergeMap no cancela peticiones anteriores, lo que puede llevar a resultados desactualizados
  // si el usuario escribe muy rápido.
  // searchQueryChanges.pipe(
  //   debounceTime(500),
  //   mergeMap(query => this.http.get(`https://jsonplaceholder.typicode.com/posts?q=${query}`))
  // ).subscribe(result => {
  //   this.searchResult = result; // Podría mostrar resultados de una búsqueda antigua
  // });
}

// Asegúrate de importar el componente en tu AppModule y añadir FormsModule si usas ngModel.
// import { FormsModule } from '@angular/forms';
// imports: [ BrowserModule, HttpClientModule, FormsModule ]
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Servicios y Comunicación HTTP',
    'topic': 'Observables y RxJS',
    'subtopic': 'Suscripción y cancelación de Observables',
    'definition': r'''
Entender cómo te "suscribes" a un Observable para empezar a recibir sus valores y, crucialmente, cómo "cancelas" esa suscripción, es vital para evitar fugas de memoria y asegurar que tu aplicación Angular funcione de manera eficiente y estable.

Aquí te va la aclaración: Pensemos por un momento en una conversación telefónica. Marcas un número (eso es como crear un Observable), pero la conversación no empieza hasta que la otra persona contesta (eso es suscribirse). Mientras hablas, recibes información. Cuando cuelgas (eso es cancelar la suscripción), la conversación termina. Si no colgaras, la línea seguiría abierta y consumiría recursos innecesarios. Con los Observables es parecido. Cuando llamas al método `.subscribe()` en un Observable, le dices: "Quiero empezar a recibir los valores que emitas". Este método devuelve un objeto `Subscription`, que es tu "manija" para controlar esa suscripción. Si un Observable emite valores continuamente (como `interval`, `fromEvent`, o `valueChanges` de un formulario) y no te desuscribes, el código asociado a esa suscripción seguirá ejecutándose y consumiendo memoria incluso si el componente que la inició ya no existe. Esto se conoce como "fuga de memoria". Para evitarlo, es fundamental llamar a `.unsubscribe()` en tu `Subscription` cuando el componente (o la lógica que usa el Observable) se destruya o ya no necesite escuchar más. En Angular, el lugar más común para hacer esto es en el método `ngOnDestroy()` de un componente. Otra forma, más moderna y a menudo preferida, es usar operadores de RxJS como `take(1)`, `takeUntil()`, `first()`, `tap()` o el `async` pipe en las plantillas, que se encargan de la desuscripción automáticamente.
''',
    'code_example': r'''
// En tu componente (ej. subscription-management/subscription-management.component.ts):
import { Component, OnInit, OnDestroy } from '@angular/core';
import { interval, Subscription, Observable } from 'rxjs'; // Importa interval y Subscription
import { take, takeUntil, tap } from 'rxjs/operators'; // Importa operadores para gestión de suscripciones
import { Subject } from 'rxjs'; // Necesario para takeUntil

@Component({
  selector: 'app-subscription-management',
  template: `
    <h2>Gestión de Suscripciones</h2>
    <h3>Contador manual: {{ manualCounter }}</h3>
    <p>Este contador se actualiza cada segundo y debe ser desuscrito manualmente.</p>

    <h3>Contador automático (take(5)): {{ autoCounterTake }}</h3>
    <p>Este contador se detiene automáticamente después de 5 emisiones.</p>

    <h3>Contador con ngOnDestroy (takeUntil): {{ autoCounterDestroy }}</h3>
    <p>Este contador se detiene cuando el componente es destruido.</p>

    <button (click)="toggleComponent()">
      {{ showComponent ? 'Ocultar Componente' : 'Mostrar Componente' }}
    </button>
    <div *ngIf="showComponent">
      <app-child-component></app-child-component> </div>
  `
})
export class SubscriptionManagementComponent implements OnInit, OnDestroy {
  manualCounter: number = 0;
  autoCounterTake: number = 0;
  autoCounterDestroy: number = 0;
  showComponent: boolean = true;

  private manualSubscription: Subscription | null = null;
  private destroy$ = new Subject<void>(); // Subject para takeUntil

  ngOnInit(): void {
    // 1. Suscripción manual y desuscripción en ngOnDestroy
    this.manualSubscription = interval(1000).subscribe(val => {
      this.manualCounter = val;
      console.log('Manual Counter:', val);
    });

    // 2. Desuscripción automática con 'take'
    // El Observable se completa automáticamente después de `count` emisiones.
    interval(500).pipe(
      take(5) // Tomar solo los primeros 5 valores y luego completar
    ).subscribe(val => {
      this.autoCounterTake = val;
      console.log('Auto Counter (take(5)):', val);
    }, null, () => {
      console.log('Auto Counter (take(5)) Completado.');
    });

    // 3. Desuscripción automática con 'takeUntil' y Subject en ngOnDestroy
    // El Observable se completa cuando el Subject 'destroy$' emite un valor.
    interval(200).pipe(
      takeUntil(this.destroy$), // Se completa cuando destroy$ emite
      tap(val => console.log('Auto Counter (takeUntil):', val)) // Para ver las emisiones
    ).subscribe(val => {
      this.autoCounterDestroy = val;
    }, null, () => {
      console.log('Auto Counter (takeUntil) Completado (por ngOnDestroy).');
    });
  }

  // Este método es CRUCIAL para liberar recursos.
  ngOnDestroy(): void {
    console.log('SubscriptionManagementComponent: ngOnDestroy ejecutado.');
    // Desuscribirse de la suscripción manual
    if (this.manualSubscription) {
      this.manualSubscription.unsubscribe();
      console.log('Suscripción manual desuscrita.');
    }
    // Emitir un valor en el Subject para que takeUntil complete los Observables
    this.destroy$.next();
    this.destroy$.complete();
    console.log('destroy$ Subject completado.');
  }

  toggleComponent(): void {
    this.showComponent = !this.showComponent;
  }

  // EJEMPLO DE CÓDIGO INCORRECTO:
  // Olvidar desuscribirse de un Observable de larga vida.
  // private badSubscription: Subscription;
  // constructor() {
  //   this.badSubscription = interval(1000).subscribe(val => console.log('¡Fuga de memoria!'));
  // }
  // // No hay ngOnDestroy ni .unsubscribe() para badSubscription.
}

// Componente hijo para demostrar ngOnDestroy (app-child-component.ts)
import { Component, OnDestroy } from '@angular/core';
import { interval, Subscription } from 'rxjs';

@Component({
  selector: 'app-child-component',
  template: `
    <div style="border: 1px solid blue; padding: 10px; margin-top: 10px;">
      <h4>Componente Hijo</h4>
      <p>Este componente tiene su propia suscripción a un intervalo.</p>
    </div>
  `
})
export class ChildComponent implements OnDestroy {
  private childSubscription: Subscription;

  constructor() {
    this.childSubscription = interval(700).subscribe(val => {
      console.log('Child Component Counter:', val);
    });
    console.log('ChildComponent: Creado.');
  }

  ngOnDestroy(): void {
    this.childSubscription.unsubscribe();
    console.log('ChildComponent: Suscripción desuscrita en ngOnDestroy.');
    console.log('ChildComponent: Destruido.');
  }
}

// Asegúrate de añadir ambos componentes a tu AppModule:
// import { AppComponent } from './app.component';
// import { SubscriptionManagementComponent } from './subscription-management/subscription-management.component';
// import { ChildComponent } from './child/child.component';
// @NgModule({
//   declarations: [
//     AppComponent,
//     SubscriptionManagementComponent,
//     ChildComponent
//   ],
//   imports: [ BrowserModule ],
//   bootstrap: [AppComponent]
// })
// export class AppModule { }

// Y en tu app.component.html:
// <app-subscription-management></app-subscription-management>

/*
Un error común y grave es no desuscribirse de Observables de "larga vida" (que no se completan)
cuando el componente que los suscribe es destruido. Esto causa fugas de memoria y
un comportamiento inesperado. Siempre desuscríbete en `ngOnDestroy()`.

Otro error es depender de la desuscripción automática para Observables que
realmente no se completan, como `interval` o `fromEvent`. Para estos,
debes usar `takeUntil` con un `Subject` que emita en `ngOnDestroy`
o manejar la suscripción manualmente.
*/
'''
  });
}

Future<void> insertAngularJrLevel5Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Pruebas y Herramientas',
    'topic': 'Pruebas Unitarias',
    'subtopic': 'Uso de Jasmine y Karma',
    'definition': r'''
Cuando construyes una aplicación, no quieres que se rompa al menor cambio. Las "pruebas unitarias" son tu primera línea de defensa, y en Angular, la dupla dinámica para esto es "Jasmine" como framework de pruebas y "Karma" como ejecutor de pruebas.

¿Te estás preguntando por qué esto importa?

Aquí te va la aclaración: Pensemos por un momento en que estás construyendo un coche. ¿Probarías el coche entero después de montarlo para ver si las ruedas giran? ¡Claro que no! Probarías cada rueda, cada motor, cada puerta por separado antes de ensamblarlos. Las pruebas unitarias son eso mismo: pruebas pequeñas y aisladas que verifican que las unidades más pequeñas de tu código (un componente, un servicio, una función) funcionan exactamente como esperas. Jasmine te da el lenguaje para escribir estas pruebas (describe, it, expect), y Karma es el que toma esas pruebas, las ejecuta en un navegador real o simulado (como Chrome Headless) y te da los resultados. La combinación de ambos te permite tener confianza en tu código, asegurarte de que los cambios no introducen errores, y facilita la refactorización. Además, escribir pruebas te obliga a pensar en cómo tu código se comporta, lo que a menudo lleva a un mejor diseño. Es una inversión de tiempo que se paga con creces en estabilidad y menos dolores de cabeza a largo plazo.
''',
    'code_example': r'''
// 1. Configuración básica (automáticamente generada por Angular CLI)
// Cuando creas un proyecto Angular, `karma.conf.js` y `src/test.ts` ya están configurados.
// Cuando generas un componente o servicio (`ng generate component my-component`),
// Angular CLI automáticamente crea un archivo de especificaciones `.spec.ts` para él.

// 2. Un ejemplo de prueba unitaria para un servicio (src/app/data.service.spec.ts)
// Asume que tienes un `DataService` con un método `getData()` que devuelve un Observable.
import { TestBed } from '@angular/core/testing';
import { HttpClientTestingModule, HttpTestingController } from '@angular/common/http/testing'; // Para simular HTTP
import { DataService } from './data.service'; // El servicio a probar

describe('DataService', () => {
  let service: DataService;
  let httpTestingController: HttpTestingController; // Para controlar las peticiones HTTP simuladas

  // `beforeEach` se ejecuta antes de cada prueba (`it`)
  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [HttpClientTestingModule], // Importa este módulo para simular HttpClient
      providers: [DataService] // Provee el servicio que vamos a probar
    });
    service = TestBed.inject(DataService); // Obtiene una instancia del servicio
    httpTestingController = TestBed.inject(HttpTestingController); // Obtiene el controlador de simulación HTTP
  });

  // `afterEach` se ejecuta después de cada prueba (`it`)
  afterEach(() => {
    // Verifica que no haya peticiones HTTP pendientes después de cada prueba
    httpTestingController.verify();
  });

  it('debería ser creado', () => {
    expect(service).toBeTruthy(); // Verifica que el servicio exista
  });

  it('debería obtener datos del servidor (GET)', () => {
    const testData = [{ id: 1, name: 'Test User' }];

    // Llama al método del servicio que hace la petición HTTP
    service.getData().subscribe(data => {
      expect(data).toEqual(testData); // Verifica que los datos recibidos sean los esperados
    });

    // Expects que se haya hecho una petición GET a la URL específica
    const req = httpTestingController.expectOne('https://jsonplaceholder.typicode.com/users');
    expect(req.request.method).toEqual('GET');

    // Responde a la petición simulada para que el Observable emita un valor
    req.flush(testData);
  });

  it('debería manejar errores de la petición GET', () => {
    const errorMessage = 'Error de red simulado';

    service.getData().subscribe(
      () => fail('Se esperaba un error, pero no se produjo.'), // Si no hay error, la prueba falla
      (error: any) => {
        expect(error.status).toEqual(500);
        expect(error.statusText).toEqual('Internal Server Error');
      }
    );

    const req = httpTestingController.expectOne('https://jsonplaceholder.typicode.com/users');
    req.flush(errorMessage, { status: 500, statusText: 'Internal Server Error' });
  });
});

// 3. Un ejemplo de prueba unitaria para un componente (src/app/hero-list/hero-list.component.spec.ts)
// Asume que tienes un `HeroListComponent` que muestra héroes y usa un `HeroService`.
import { ComponentFixture, TestBed } from '@angular/core/testing';
import { HeroListComponent } from './hero-list.component';
import { HeroService } from '../hero.service'; // El servicio real (o simulado)
import { of } from 'rxjs'; // Para Observables

describe('HeroListComponent', () => {
  let component: HeroListComponent;
  let fixture: ComponentFixture<HeroListComponent>;
  let mockHeroService: any; // Mock del servicio

  beforeEach(async () => {
    // Crea un mock del HeroService
    mockHeroService = jasmine.createSpyObj('HeroService', ['getHeroes']);
    mockHeroService.getHeroes.and.returnValue(of([{ id: 1, name: 'Batman' }])); // Simula una respuesta

    await TestBed.configureTestingModule({
      declarations: [HeroListComponent],
      providers: [
        { provide: HeroService, useValue: mockHeroService } // Provee el mock en lugar del servicio real
      ]
    }).compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(HeroListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges(); // Detecta cambios y renderiza el componente
  });

  it('debería crear el componente', () => {
    expect(component).toBeTruthy();
  });

  it('debería cargar los héroes en el ngOnInit', () => {
    expect(mockHeroService.getHeroes).toHaveBeenCalledTimes(1); // Verifica que el método del mock fue llamado
    expect(component.heroes.length).toBe(1);
    expect(component.heroes[0].name).toBe('Batman');
  });

  it('debería mostrar el título "Héroes"', () => {
    const compiled = fixture.nativeElement;
    expect(compiled.querySelector('h2').textContent).toContain('Héroes');
  });
});

/*
Un error común es olvidar importar `HttpClientTestingModule` o `RouterTestingModule`
(o cualquier otro módulo de Angular) cuando tu componente o servicio en prueba depende de ellos.
Si no los importas, Angular no podrá resolver esas dependencias durante la prueba.

Otro error es no llamar a `fixture.detectChanges()` después de realizar cambios en el componente
que afecten la plantilla. Si no lo haces, la vista del componente no se actualizará y tus aserciones
sobre el DOM podrían fallar.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Pruebas y Herramientas',
    'topic': 'Pruebas Unitarias',
    'subtopic': 'Pruebas de componentes y servicios',
    'definition': r'''
Las pruebas unitarias en Angular no son un concepto abstracto; se aplican directamente a las piezas fundamentales de tu aplicación: los componentes y los servicios. Entender cómo probar cada uno de ellos es clave para construir una aplicación robusta.

Aquí te va la aclaración: Pensemos por un momento en un chef. Para asegurar que un plato esté perfecto, el chef no solo prueba el plato final, sino que prueba cada ingrediente (un servicio) y cada paso de la receta (un componente) por separado. De manera similar, en Angular, las pruebas unitarias se enfocan en verificar la lógica de tus servicios de forma aislada y en asegurar que tus componentes se renderizan correctamente y reaccionan a las interacciones del usuario.
* **Pruebas de Servicios**: Los servicios generalmente contienen lógica de negocio o se encargan de la comunicación con el backend. Sus pruebas son más sencillas porque no tienen una interfaz de usuario. Te enfocas en verificar que sus métodos hacen lo que se supone que deben hacer: devolver los datos correctos, llamar a una API con los parámetros adecuados, etc. Para las dependencias (como `HttpClient`), usas `HttpClientTestingModule` para simular las respuestas.
* **Pruebas de Componentes**: Son un poco más complejas porque un componente tiene una plantilla (DOM) y una clase (lógica). Necesitas verificar tanto que la lógica de la clase funciona, como que la plantilla muestra los datos correctos y que el componente reacciona a los eventos del usuario (clics, entradas de texto). Para esto, usas `TestBed` para configurar un entorno de prueba que simule un módulo de Angular, `ComponentFixture` para interactuar con la instancia y el DOM del componente, y `fixture.detectChanges()` para forzar la detección de cambios y la actualización de la vista. Además, para las dependencias de los componentes (como servicios inyectados), se suelen usar "mocks" o "espías" para controlar su comportamiento durante la prueba.
La combinación de estas pruebas te da una cobertura completa de la funcionalidad principal de tu aplicación, asegurando que tanto la lógica de negocio como la interfaz de usuario funcionan como se espera.
''',
    'code_example': r'''
// Asume los siguientes servicios y componentes para los ejemplos:

// src/app/user.service.ts (Servicio para probar)
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class UserService {
  private apiUrl = 'https://jsonplaceholder.typicode.com/users';

  constructor(private http: HttpClient) { }

  getUsers(): Observable<any[]> {
    return this.http.get<any[]>(this.apiUrl);
  }

  getUserById(id: number): Observable<any> {
    return this.http.get<any>(`${this.apiUrl}/${id}`);
  }
}

// src/app/user-profile/user-profile.component.ts (Componente para probar)
import { Component, OnInit, Input } from '@angular/core';
import { UserService } from '../user.service';
import { ActivatedRoute } from '@angular/router';
import { switchMap } from 'rxjs/operators';
import { of } from 'rxjs';

@Component({
  selector: 'app-user-profile',
  template: `
    <div *ngIf="user">
      <h2>Perfil de {{ user.name }}</h2>
      <p>Email: {{ user.email }}</p>
      <p>Teléfono: {{ user.phone }}</p>
    </div>
    <div *ngIf="!user && !loading">
      <p>Usuario no encontrado o no cargado.</p>
    </div>
    <div *ngIf="loading">
      <p>Cargando perfil...</p>
    </div>
  `
})
export class UserProfileComponent implements OnInit {
  @Input() userId: number | null = null; // Para poder pasar el ID por Input o por ruta
  user: any | null = null;
  loading: boolean = false;

  constructor(
    private userService: UserService,
    private route: ActivatedRoute // Inyectamos ActivatedRoute para obtener parámetros de ruta
  ) {}

  ngOnInit(): void {
    this.loading = true;
    if (this.userId) {
      this.loadUser(this.userId);
    } else {
      // Si el userId no se pasa como Input, intentamos obtenerlo de la URL
      this.route.paramMap.pipe(
        switchMap(params => {
          const id = params.get('id');
          return id ? this.userService.getUserById(+id) : of(null);
        })
      ).subscribe(user => {
        this.user = user;
        this.loading = false;
      }, () => {
        this.loading = false; // Manejar error si la API falla
      });
    }
  }

  private loadUser(id: number): void {
    this.userService.getUserById(id).subscribe(user => {
      this.user = user;
      this.loading = false;
    }, () => {
      this.loading = false;
    });
  }
}


// --- PRUEBAS DE SERVICIO (src/app/user.service.spec.ts) ---
import { TestBed } from '@angular/core/testing';
import { HttpClientTestingModule, HttpTestingController } from '@angular/common/http/testing';
import { UserService } from './user.service';

describe('UserService', () => {
  let service: UserService;
  let httpTestingController: HttpTestingController;
  const apiUrl = 'https://jsonplaceholder.typicode.com/users';

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [HttpClientTestingModule],
      providers: [UserService]
    });
    service = TestBed.inject(UserService);
    httpTestingController = TestBed.inject(HttpTestingController);
  });

  afterEach(() => {
    httpTestingController.verify(); // Asegura que no queden peticiones pendientes
  });

  it('debería ser creado', () => {
    expect(service).toBeTruthy();
  });

  it('debería obtener todos los usuarios', () => {
    const dummyUsers = [{ id: 1, name: 'Juan' }, { id: 2, name: 'María' }];

    service.getUsers().subscribe(users => {
      expect(users.length).toBe(2);
      expect(users).toEqual(dummyUsers);
    });

    const req = httpTestingController.expectOne(apiUrl);
    expect(req.request.method).toBe('GET');
    req.flush(dummyUsers); // Provee los datos simulados
  });

  it('debería obtener un usuario por ID', () => {
    const dummyUser = { id: 1, name: 'Juan' };
    const userId = 1;

    service.getUserById(userId).subscribe(user => {
      expect(user).toEqual(dummyUser);
    });

    const req = httpTestingController.expectOne(`${apiUrl}/${userId}`);
    expect(req.request.method).toBe('GET');
    req.flush(dummyUser);
  });

  it('debería manejar errores en la petición de usuarios', () => {
    const errorMessage = 'Error al cargar usuarios';

    service.getUsers().subscribe(
      () => fail('Se esperaba un error'),
      error => {
        expect(error.status).toBe(500);
        expect(error.statusText).toBe('Internal Server Error');
      }
    );

    const req = httpTestingController.expectOne(apiUrl);
    req.flush(errorMessage, { status: 500, statusText: 'Internal Server Error' });
  });
});


// --- PRUEBAS DE COMPONENTE (src/app/user-profile/user-profile.component.spec.ts) ---
import { ComponentFixture, TestBed } from '@angular/core/testing';
import { UserProfileComponent } from './user-profile.component';
import { UserService } from '../user.service';
import { ActivatedRoute } from '@angular/router'; // Para simular la ruta activa
import { of } from 'rxjs';

describe('UserProfileComponent', () => {
  let component: UserProfileComponent;
  let fixture: ComponentFixture<UserProfileComponent>;
  let mockUserService: any; // Mock del UserService
  let mockActivatedRoute: any; // Mock del ActivatedRoute

  beforeEach(async () => {
    // Crea un mock del UserService
    mockUserService = jasmine.createSpyObj('UserService', ['getUserById']);
    // Configura el mock para que devuelva un Observable con un usuario
    mockUserService.getUserById.and.returnValue(of({ id: 1, name: 'Test User', email: 'test@example.com', phone: '123-456' }));

    // Crea un mock del ActivatedRoute (para simular parámetros de ruta)
    mockActivatedRoute = {
      paramMap: of({ get: (key: string) => (key === 'id' ? '1' : null) }) // Simula paramMap con un ID
    };

    await TestBed.configureTestingModule({
      declarations: [UserProfileComponent],
      providers: [
        { provide: UserService, useValue: mockUserService },
        { provide: ActivatedRoute, useValue: mockActivatedRoute } // Provee el mock de ActivatedRoute
      ]
    }).compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(UserProfileComponent);
    component = fixture.componentInstance;
    fixture.detectChanges(); // Ejecuta ngOnInit y detecta cambios iniciales
  });

  it('debería crear el componente', () => {
    expect(component).toBeTruthy();
  });

  it('debería cargar el usuario si se le pasa userId como Input', () => {
    component.userId = 2; // Simula pasar el ID por Input
    fixture.detectChanges(); // Forzar la detección de cambios para que se llame loadUser

    expect(mockUserService.getUserById).toHaveBeenCalledWith(2); // Verificar que se llamó con el ID correcto
    expect(component.user.name).toBe('Test User');
    expect(component.loading).toBeFalse();
  });

  it('debería cargar el usuario desde la ruta si no se pasa userId como Input', () => {
    // En este caso, el mockActivatedRoute ya tiene el ID '1' configurado
    expect(mockUserService.getUserById).toHaveBeenCalledWith(1); // Verificar que se llamó con el ID de la ruta
    expect(component.user.name).toBe('Test User');
    expect(component.loading).toBeFalse();
  });

  it('debería mostrar los detalles del usuario', () => {
    fixture.detectChanges(); // Asegurar que el componente esté actualizado
    const compiled = fixture.nativeElement;
    expect(compiled.querySelector('h2').textContent).toContain('Perfil de Test User');
    expect(compiled.querySelector('p:nth-of-type(1)').textContent).toContain('Email: test@example.com');
  });

  it('debería mostrar "Cargando perfil..." mientras se carga', () => {
    mockUserService.getUserById.and.returnValue(new Observable(() => {})); // Simula un observable que nunca emite
    component.userId = 3;
    fixture.detectChanges(); // Dispara la carga
    const compiled = fixture.nativeElement;
    expect(compiled.querySelector('p').textContent).toContain('Cargando perfil...');
    expect(component.loading).toBeTrue();
  });

  it('debería mostrar "Usuario no encontrado" si no hay usuario', () => {
    mockUserService.getUserById.and.returnValue(of(null)); // Simula que no se encuentra el usuario
    component.userId = 99;
    fixture.detectChanges();
    const compiled = fixture.nativeElement;
    expect(compiled.querySelector('p').textContent).toContain('Usuario no encontrado o no cargado.');
    expect(component.user).toBeNull();
  });
});

/*
Un error común al probar componentes es olvidar llamar a `fixture.detectChanges()`
después de que un evento o un cambio en los datos haga que la plantilla deba actualizarse.
Sin esto, la vista no reflejará los cambios y tus aserciones sobre el DOM podrían fallar.

Otro error es no proveer mocks para todas las dependencias del componente o servicio
que estás probando. Si una dependencia no se mockea o provee, `TestBed` no podrá
crear la instancia del componente/servicio, y la prueba fallará.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Pruebas y Herramientas',
    'topic': 'Pruebas Unitarias',
    'subtopic': 'Mocks y espías',
    'definition': r'''
En el mundo de las pruebas unitarias, especialmente cuando tu código tiene "dependencias" (es decir, usa otros servicios o componentes), no quieres que esas dependencias afecten el resultado de tu prueba. Aquí es donde los "mocks" y los "espías" de Jasmine se vuelven indispensables.

Esto tiene una explicación, y es porque Pensemos por un momento en que estás probando un nuevo motor de coche. No querrías probarlo en un coche real, arriesgándote a chocar si el motor falla. En su lugar, lo probarías en un banco de pruebas aislado. Los mocks y espías son ese "banco de pruebas" para tus dependencias.
* **Mocks**: Un mock es una versión "falsa" de un objeto que se comporta de una manera predecible y controlada. Lo usas para reemplazar una dependencia real de tu código bajo prueba. Por ejemplo, si un componente necesita un `UserService` para obtener datos de una API, en lugar de llamar a la API real (lo cual haría tu prueba lenta y dependiente de la red), le das al componente un "mock" de `UserService` que simplemente devuelve datos predefinidos. Esto aísla tu prueba del mundo exterior y asegura que el componente se comporte como esperas sin importar lo que haga la API real. En Jasmine, puedes crear mocks básicos con `jasmine.createSpyObj()`.
* **Espías (Spies)**: Un espía es como un "observador" que puedes colocar en un método de un objeto (real o mock). Te permite verificar si un método fue llamado, cuántas veces fue llamado, con qué argumentos fue llamado y, opcionalmente, cambiar su implementación (`and.returnValue`, `and.callFake`). Por ejemplo, si quieres asegurarte de que un botón llama al método `save()` de un servicio, puedes poner un espía en `save()` y luego simular el clic del botón. Después, verificas si el espía fue llamado. Los espías te ayudan a entender la "interacción" entre tus unidades de código.

Tanto los mocks como los espías son herramientas poderosas para aislar tu código bajo prueba, controlar su entorno y verificar su comportamiento, lo que resulta en pruebas unitarias más rápidas, confiables y útiles.
''',
    'code_example': r'''
// Asume el siguiente servicio y componente para los ejemplos:

// src/app/notification.service.ts
import { Injectable } from '@angular/core';
import { Subject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class NotificationService {
  private _message = new Subject<string>();
  message$ = this._message.asObservable();

  showNotification(msg: string): void {
    console.log(`Notificación: ${msg}`); // En una app real, esto mostraría un toast/snackbar
    this._message.next(msg);
  }
}

// src/app/user-management/user-management.component.ts
import { Component } from '@angular/core';
import { UserService } from '../user.service'; // Asume el UserService del ejemplo anterior
import { NotificationService } from '../notification.service';

@Component({
  selector: 'app-user-management',
  template: `
    <h2>Gestión de Usuarios</h2>
    <button (click)="createUser()">Crear Usuario</button>
    <button (click)="deleteUser(1)">Eliminar Usuario 1</button>
  `
})
export class UserManagementComponent {
  constructor(
    private userService: UserService,
    private notificationService: NotificationService
  ) {}

  createUser(): void {
    const newUser = { name: 'Nuevo Usuario', email: 'nuevo@example.com' };
    this.userService.addUser(newUser).subscribe(
      () => {
        this.notificationService.showNotification('Usuario creado exitosamente!');
        console.log('Usuario creado en la UI.');
      },
      (error) => {
        this.notificationService.showNotification('Error al crear usuario.');
        console.error('Error creando usuario:', error);
      }
    );
  }

  deleteUser(id: number): void {
    this.userService.deleteUser(id).subscribe(
      () => {
        this.notificationService.showNotification(`Usuario ${id} eliminado.`);
        console.log(`Usuario ${id} eliminado en la UI.`);
      },
      (error) => {
        this.notificationService.showNotification(`Error al eliminar usuario ${id}.`);
        console.error('Error eliminando usuario:', error);
      }
    );
  }
}


// --- PRUEBAS DE COMPONENTE CON MOCKS Y ESPÍAS (src/app/user-management/user-management.component.spec.ts) ---
import { ComponentFixture, TestBed } from '@angular/core/testing';
import { UserManagementComponent } from './user-management.component';
import { UserService } from '../user.service';
import { NotificationService } from '../notification.service';
import { of, throwError } from 'rxjs'; // Para simular Observables

describe('UserManagementComponent', () => {
  let component: UserManagementComponent;
  let fixture: ComponentFixture<UserManagementComponent>;
  let mockUserService: any; // Mock para UserService
  let mockNotificationService: any; // Mock para NotificationService

  beforeEach(async () => {
    // 1. Crear mocks/espías para los servicios
    // `jasmine.createSpyObj` crea un objeto que tiene métodos que son espías
    mockUserService = jasmine.createSpyObj('UserService', ['addUser', 'deleteUser']);
    mockNotificationService = jasmine.createSpyObj('NotificationService', ['showNotification']);

    // Configurar el comportamiento de los espías (qué devuelven cuando son llamados)
    mockUserService.addUser.and.returnValue(of({ id: 99, name: 'Nuevo Usuario' })); // Simula éxito
    mockUserService.deleteUser.and.returnValue(of(null)); // Simula éxito

    await TestBed.configureTestingModule({
      declarations: [UserManagementComponent],
      providers: [
        // 2. Prover los mocks en lugar de los servicios reales
        { provide: UserService, useValue: mockUserService },
        { provide: NotificationService, useValue: mockNotificationService }
      ]
    }).compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(UserManagementComponent);
    component = fixture.componentInstance;
    fixture.detectChanges(); // Ejecuta ngOnInit si lo tuviera, y enlace de datos
  });

  it('debería crear el componente', () => {
    expect(component).toBeTruthy();
  });

  it('debería llamar a UserService.addUser y mostrar notificación al crear usuario', () => {
    // Actuar: simular un clic en el botón
    const createButton = fixture.nativeElement.querySelector('button');
    createButton.click();
    fixture.detectChanges(); // Forzar detección de cambios después del clic

    // Aserciones: verificar que los espías fueron llamados
    expect(mockUserService.addUser).toHaveBeenCalledTimes(1);
    expect(mockUserService.addUser).toHaveBeenCalledWith({ name: 'Nuevo Usuario', email: 'nuevo@example.com' });
    expect(mockNotificationService.showNotification).toHaveBeenCalledWith('Usuario creado exitosamente!');
  });

  it('debería mostrar notificación de error si createUser falla', () => {
    // Configurar el mock para que falle
    mockUserService.addUser.and.returnValue(throwError(() => new Error('Error de prueba')));

    const createButton = fixture.nativeElement.querySelector('button');
    createButton.click();
    fixture.detectChanges();

    expect(mockUserService.addUser).toHaveBeenCalledTimes(1);
    expect(mockNotificationService.showNotification).toHaveBeenCalledWith('Error al crear usuario.');
  });

  it('debería llamar a UserService.deleteUser y mostrar notificación al eliminar usuario', () => {
    const deleteButton = fixture.nativeElement.querySelectorAll('button')[1]; // El segundo botón
    deleteButton.click();
    fixture.detectChanges();

    expect(mockUserService.deleteUser).toHaveBeenCalledTimes(1);
    expect(mockUserService.deleteUser).toHaveBeenCalledWith(1);
    expect(mockNotificationService.showNotification).toHaveBeenCalledWith('Usuario 1 eliminado.');
  });

  it('debería mostrar notificación de error si deleteUser falla', () => {
    mockUserService.deleteUser.and.returnValue(throwError(() => new Error('Error de eliminación')));

    const deleteButton = fixture.nativeElement.querySelectorAll('button')[1];
    deleteButton.click();
    fixture.detectChanges();

    expect(mockUserService.deleteUser).toHaveBeenCalledTimes(1);
    expect(mockNotificationService.showNotification).toHaveBeenCalledWith('Error al eliminar usuario 1.');
  });
});

/*
Un error común es intentar llamar a métodos `spyOn` en objetos que ya son espías creados con `createSpyObj`.
`createSpyObj` ya crea espías para los métodos especificados, por lo que no necesitas `spyOn` sobre ellos.
Solo usarías `spyOn` si quisieras espiar un método de un objeto REAL.

Otro error es olvidar configurar el `returnValue` (o `callFake`, etc.) de un espía
cuando el método mockeado debe devolver un Observable o una Promise. Si no lo haces,
el `subscribe()` en tu código bajo prueba no se ejecutará y la prueba podría no pasar.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Pruebas y Herramientas',
    'topic': 'Pruebas de Integración',
    'subtopic': 'Pruebas de interacción entre componentes',
    'definition': r'''
Mientras que las pruebas unitarias se centran en el aislamiento de las piezas de tu código, las "pruebas de interacción entre componentes" se aseguran de que estos componentes, una vez unidos, se comuniquen y trabajen juntos como se espera.

Aquí te va la aclaración: Pensemos por un momento en que estás construyendo un tren. Ya probaste que el motor (un componente) funciona y que los vagones (otros componentes) están bien. Ahora, necesitas probar que el motor se engancha correctamente a los vagones y que la electricidad fluye entre ellos, permitiendo que el tren se mueva como una unidad. Las pruebas de interacción entre componentes hacen precisamente eso: verifican que los componentes se comunican correctamente, ya sea a través de `@Input()` y `@Output()`, servicios compartidos, o incluso a través de rutas. No se trata solo de probar que un componente hace su trabajo individual, sino de garantizar que cuando dos o más componentes se combinan, su interacción no genera errores y el flujo de datos entre ellos es el correcto. Esto es crucial porque muchos errores en aplicaciones grandes no provienen de un componente defectuoso en sí, sino de cómo interactúan entre sí. Estas pruebas te dan la confianza de que tus componentes, que son los bloques de construcción de tu interfaz de usuario, trabajan en armonía.
''',
    'code_example': r'''
// Asume los siguientes componentes para los ejemplos:

// src/app/item-list/item-list.component.ts (Componente Padre)
import { Component, OnInit } from '@angular/core';
import { ItemService } from '../item.service'; // Asume ItemService existe
import { Observable } from 'rxjs';

@Component({
  selector: 'app-item-list',
  template: `
    <h2>Lista de Items</h2>
    <app-item-detail
      *ngFor="let item of items$ | async"
      [item]="item"
      (itemSelected)="onItemSelected($event)"
    ></app-item-detail>
    <div *ngIf="selectedItem">
      <h3>Item Seleccionado:</h3>
      <p>{{ selectedItem.name }} - {{ selectedItem.description }}</p>
    </div>
  `
})
export class ItemListComponent implements OnInit {
  items$: Observable<any[]>;
  selectedItem: any | null = null;

  constructor(private itemService: ItemService) {
    this.items$ = this.itemService.getItems(); // Obtiene items de un servicio
  }

  ngOnInit(): void {}

  onItemSelected(item: any): void {
    this.selectedItem = item;
    console.log('Item seleccionado en el padre:', item);
  }
}

// src/app/item-detail/item-detail.component.ts (Componente Hijo)
import { Component, Input, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-item-detail',
  template: `
    <div class="item-card" (click)="selectItem()">
      <h4>{{ item.name }}</h4>
      <p>{{ item.description }}</p>
    </div>
  `,
  styles: [`
    .item-card {
      border: 1px solid #ccc;
      padding: 10px;
      margin-bottom: 5px;
      cursor: pointer;
    }
    .item-card:hover {
      background-color: #f0f0f0;
    }
  `]
})
export class ItemDetailComponent {
  @Input() item: any;
  @Output() itemSelected = new EventEmitter<any>();

  selectItem(): void {
    this.itemSelected.emit(this.item);
  }
}

// src/app/item.service.ts (Servicio mockeable)
import { Injectable } from '@angular/core';
import { of } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ItemService {
  private dummyItems = [
    { id: 1, name: 'Laptop', description: 'Portátil de alto rendimiento' },
    { id: 2, name: 'Mouse', description: 'Ratón ergonómico' }
  ];

  getItems() {
    return of(this.dummyItems); // Devuelve un Observable simulado
  }
}


// --- PRUEBA DE INTERACCIÓN ENTRE COMPONENTES (src/app/item-list/item-list.component.spec.ts) ---
import { ComponentFixture, TestBed } from '@angular/core/testing';
import { ItemListComponent } from './item-list.component';
import { ItemDetailComponent } from '../item-detail/item-detail.component'; // Importa el componente hijo
import { ItemService } from '../item.service';
import { of } from 'rxjs';
import { By } from '@angular/platform-browser'; // Para buscar elementos en el DOM de prueba

describe('ItemListComponent (Interaction Tests)', () => {
  let parentFixture: ComponentFixture<ItemListComponent>;
  let parentComponent: ItemListComponent;
  let mockItemService: any;

  const testItems = [
    { id: 1, name: 'Laptop', description: 'Portátil de alto rendimiento' },
    { id: 2, name: 'Mouse', description: 'Ratón ergonómico' }
  ];

  beforeEach(async () => {
    mockItemService = jasmine.createSpyObj('ItemService', ['getItems']);
    mockItemService.getItems.and.returnValue(of(testItems)); // El servicio siempre devuelve estos items

    await TestBed.configureTestingModule({
      declarations: [
        ItemListComponent,
        ItemDetailComponent // Declara también el componente hijo para que pueda ser usado en la plantilla del padre
      ],
      providers: [
        { provide: ItemService, useValue: mockItemService }
      ]
    }).compileComponents();
  });

  beforeEach(() => {
    parentFixture = TestBed.createComponent(ItemListComponent);
    parentComponent = parentFixture.componentInstance;
    parentFixture.detectChanges(); // Renderiza el ItemListComponent y sus hijos ItemDetailComponents
  });

  it('debería crear el ItemListComponent', () => {
    expect(parentComponent).toBeTruthy();
  });

  it('debería renderizar dos ItemDetailComponents', () => {
    // Busca todos los elementos con el selector 'app-item-detail'
    const itemDetailElements = parentFixture.debugElement.queryAll(By.css('app-item-detail'));
    expect(itemDetailElements.length).toBe(2);
  });

  it('debería pasar los datos del item del padre al hijo', () => {
    // Obtener la instancia del componente hijo (el primero)
    const itemDetailDebugElement = parentFixture.debugElement.query(By.directive(ItemDetailComponent));
    const itemDetailComponentInstance = itemDetailDebugElement.componentInstance as ItemDetailComponent;

    expect(itemDetailComponentInstance.item).toEqual(testItems[0]);
    expect(itemDetailComponentInstance.item.name).toBe('Laptop');
  });

  it('debería actualizar el item seleccionado en el padre cuando el hijo emite itemSelected', () => {
    // Obtener todos los debug elements de los hijos
    const itemDetailDebugElements = parentFixture.debugElement.queryAll(By.directive(ItemDetailComponent));
    const firstItemDetailDebugElement = itemDetailDebugElements[0]; // El primer item de la lista

    // Simular un clic en el div interno del componente hijo
    firstItemDetailDebugElement.query(By.css('.item-card')).nativeElement.click();

    // Necesario para que Angular detecte los cambios en la plantilla del padre
    parentFixture.detectChanges();

    // Verificar que el padre ha reaccionado a la emisión del hijo
    expect(parentComponent.selectedItem).toEqual(testItems[0]);

    // Verificar que el texto en la plantilla del padre se ha actualizado
    const compiled = parentFixture.nativeElement;
    expect(compiled.querySelector('div h3').textContent).toContain('Item Seleccionado:');
    expect(compiled.querySelector('div p').textContent).toContain('Laptop - Portátil de alto rendimiento');
  });

  it('debería manejar la selección de un segundo item', () => {
    const itemDetailDebugElements = parentFixture.debugElement.queryAll(By.directive(ItemDetailComponent));
    const secondItemDetailDebugElement = itemDetailDebugElements[1]; // El segundo item

    secondItemDetailDebugElement.query(By.css('.item-card')).nativeElement.click();
    parentFixture.detectChanges();

    expect(parentComponent.selectedItem).toEqual(testItems[1]);
    const compiled = parentFixture.nativeElement;
    expect(compiled.querySelector('div p').textContent).toContain('Mouse - Ratón ergonómico');
  });
});

/*
Un error común es olvidar declarar el componente hijo (`ItemDetailComponent` en este caso)
en el `declarations` array del `TestBed.configureTestingModule`. Si no lo haces, Angular
no sabrá cómo renderizar `app-item-detail` dentro de la plantilla de `ItemListComponent`.

Otro error es olvidar llamar a `fixture.detectChanges()` después de simular una interacción
(como un clic) que debería desencadenar una actualización de la vista. Sin esto, el DOM
no se refrescará y las aserciones sobre los elementos en la plantilla fallarán.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Pruebas y Herramientas',
    'topic': 'Pruebas de Integración',
    'subtopic': 'Validación de flujo de datos',
    'definition': r'''
Las pruebas de integración no solo se preocupan de que los componentes se hablen, sino que esa conversación fluya con la información correcta y en el momento adecuado. La "validación del flujo de datos" es el corazón de estas pruebas, asegurando que los datos se muevan sin problemas por toda tu aplicación.

Vamos a ver de que se trata todo esto... 

Pensemos por un momento en una fábrica de coches, de nuevo. No solo compruebas que el motor y las ruedas se conectan, sino que el combustible llega al motor, que los frenos reciben la señal para detener el coche, y que la información del velocímetro llega al panel de control. En tu aplicación Angular, esto significa verificar:
* **De padres a hijos**: Que los datos pasados a través de `@Input()` son correctamente recibidos y mostrados por el componente hijo.
* **De hijos a padres**: Que los eventos emitidos por `@Output()` llevan la información correcta y son manejados adecuadamente por el componente padre.
* **A través de servicios**: Que los servicios actúan como un puente de datos entre componentes no relacionados directamente, y que la información se almacena, recupera o transforma correctamente a través de ellos.
* **Interacciones con la UI**: Que las acciones del usuario (clics, entradas de texto) desencadenan los cambios de datos esperados y que estos cambios se reflejan correctamente en la interfaz de usuario.

La validación del flujo de datos es vital porque asegura la consistencia de la aplicación. Previene bugs donde los datos se pierden, se corrompen o simplemente no llegan a donde deberían. Al enfocarte en el camino que siguen los datos a través de tus componentes y servicios, construyes un sistema más fiable y predecible.
''',
    'code_example': r'''
// Asume los siguientes componentes y servicio:

// src/app/counter/counter.component.ts (Componente para probar flujo de datos)
import { Component, Input, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-counter',
  template: `
    <div class="counter-card">
      <h3>Contador: {{ value }}</h3>
      <button (click)="increment()">Incrementar</button>
      <button (click)="decrement()">Decrementar</button>
      <button (click)="reset.emit()">Reiniciar</button>
    </div>
  `,
  styles: [`
    .counter-card {
      border: 1px solid #ddd;
      padding: 15px;
      margin: 10px;
      background-color: #f9f9f9;
      text-align: center;
    }
    button {
      margin: 5px;
      padding: 8px 15px;
      cursor: pointer;
    }
  `]
})
export class CounterComponent {
  @Input() value: number = 0;
  @Output() valueChange = new EventEmitter<number>(); // Emite el nuevo valor
  @Output() reset = new EventEmitter<void>(); // Emite cuando se reinicia

  increment(): void {
    this.value++;
    this.valueChange.emit(this.value);
  }

  decrement(): void {
    this.value--;
    this.valueChange.emit(this.value);
  }
}

// src/app/dashboard/dashboard.component.ts (Componente que integra CounterComponent)
import { Component, OnInit } from '@angular/core';
import { DashboardService } from '../dashboard.service'; // Asume DashboardService existe

@Component({
  selector: 'app-dashboard',
  template: `
    <h1>Panel de Control</h1>
    <p>Total de Clicks Registrados: {{ totalClicks }}</p>
    <app-counter
      [value]="initialCounterValue"
      (valueChange)="onCounterValueChange($event)"
      (reset)="onCounterReset()"
    ></app-counter>
    <p>Valor actual del contador: {{ currentCounterValue }}</p>
  `
})
export class DashboardComponent implements OnInit {
  initialCounterValue: number = 10;
  currentCounterValue: number = 10;
  totalClicks: number = 0;

  constructor(private dashboardService: DashboardService) {}

  ngOnInit(): void {
    this.dashboardService.getTotalClicks().subscribe(clicks => {
      this.totalClicks = clicks;
    });
  }

  onCounterValueChange(newValue: number): void {
    this.currentCounterValue = newValue;
    this.dashboardService.addClick(); // Registra un click cada vez que el valor cambia
  }

  onCounterReset(): void {
    this.currentCounterValue = 0;
    this.dashboardService.resetClicks(); // Reinicia el contador de clicks
  }
}

// src/app/dashboard.service.ts
import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class DashboardService {
  private _totalClicks = new BehaviorSubject<number>(0);
  totalClicks: Observable<number> = this._totalClicks.asObservable();

  constructor() {}

  addClick(): void {
    this._totalClicks.next(this._totalClicks.value + 1);
  }

  resetClicks(): void {
    this._totalClicks.next(0);
  }

  getTotalClicks(): Observable<number> {
    return this.totalClicks;
  }
}


// --- PRUEBAS DE INTEGRACIÓN DEL FLUJO DE DATOS (src/app/dashboard/dashboard.component.spec.ts) ---
import { ComponentFixture, TestBed } from '@angular/core/testing';
import { DashboardComponent } from './dashboard.component';
import { CounterComponent } from '../counter/counter.component'; // Importa el componente hijo
import { DashboardService } from '../dashboard.service';
import { By } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms'; // Si los componentes usan ngModel (no en este caso, pero buena práctica)
import { of } from 'rxjs';

describe('DashboardComponent (Data Flow Validation)', () => {
  let dashboardFixture: ComponentFixture<DashboardComponent>;
  let dashboardComponent: DashboardComponent;
  let mockDashboardService: any; // Mock del servicio

  beforeEach(async () => {
    mockDashboardService = jasmine.createSpyObj('DashboardService', ['getTotalClicks', 'addClick', 'resetClicks']);
    // Configura el mock para que `getTotalClicks` devuelva un valor inicial
    mockDashboardService.getTotalClicks.and.returnValue(of(0));
    // Configura `addClick` y `resetClicks` para que no hagan nada (los espiaremos)
    mockDashboardService.addClick.and.returnValue(void 0); // No devuelve nada
    mockDashboardService.resetClicks.and.returnValue(void 0);

    await TestBed.configureTestingModule({
      declarations: [
        DashboardComponent,
        CounterComponent // Declara el componente hijo
      ],
      imports: [FormsModule], // Si usas ngModel en algún lado
      providers: [
        { provide: DashboardService, useValue: mockDashboardService }
      ]
    }).compileComponents();
  });

  beforeEach(() => {
    dashboardFixture = TestBed.createComponent(DashboardComponent);
    dashboardComponent = dashboardFixture.componentInstance;
    dashboardFixture.detectChanges(); // Renderiza el DashboardComponent y sus hijos
  });

  it('debería crear el DashboardComponent', () => {
    expect(dashboardComponent).toBeTruthy();
  });

  it('debería pasar el valor inicial del contador al componente hijo', () => {
    const counterDebugElement = dashboardFixture.debugElement.query(By.directive(CounterComponent));
    const counterComponentInstance = counterDebugElement.componentInstance as CounterComponent;

    expect(counterComponentInstance.value).toBe(10);
  });

  it('debería actualizar el valor actual del contador en el padre cuando el hijo emite valueChange', () => {
    const counterDebugElement = dashboardFixture.debugElement.query(By.directive(CounterComponent));
    const incrementButton = counterDebugElement.query(By.css('button')).nativeElement; // Botón de Incrementar

    incrementButton.click(); // Simular clic en el botón de incrementar del hijo
    dashboardFixture.detectChanges(); // Actualizar la vista del padre

    // Verificar que el valor del contador del padre se actualizó
    expect(dashboardComponent.currentCounterValue).toBe(11);
    // Verificar que el servicio fue llamado para registrar el click
    expect(mockDashboardService.addClick).toHaveBeenCalledTimes(1);

    // Verificar el texto en la plantilla del padre
    const compiled = dashboardFixture.nativeElement;
    expect(compiled.querySelector('p:last-of-type').textContent).toContain('Valor actual del contador: 11');
  });

  it('debería reiniciar el contador en el padre y el servicio cuando el hijo emite reset', () => {
    const counterDebugElement = dashboardFixture.debugElement.query(By.directive(CounterComponent));
    const resetButton = counterDebugElement.queryAll(By.css('button'))[2].nativeElement; // Botón de Reiniciar

    // Cambiar el valor actual del contador y simular clicks antes de reiniciar
    dashboardComponent.currentCounterValue = 5;
    mockDashboardService.addClick.calls.reset(); // Limpiar llamadas previas
    mockDashboardService.addClick();
    mockDashboardService.addClick();
    dashboardFixture.detectChanges(); // Para asegurar que la UI del padre esté alineada con el valor actual

    resetButton.click(); // Simular clic en el botón de reiniciar del hijo
    dashboardFixture.detectChanges(); // Actualizar la vista del padre

    // Verificar que el valor del contador del padre se reinició
    expect(dashboardComponent.currentCounterValue).toBe(0);
    // Verificar que el servicio fue llamado para reiniciar los clicks
    expect(mockDashboardService.resetClicks).toHaveBeenCalledTimes(1);
    // Verificar que `addClick` no fue llamado (si ya había sido llamado, debería permanecer en 0 después del reset)
    expect(mockDashboardService.addClick).not.toHaveBeenCalled();

    const compiled = dashboardFixture.nativeElement;
    expect(compiled.querySelector('p:last-of-type').textContent).toContain('Valor actual del contador: 0');
  });

  it('debería mostrar el total de clicks del servicio', () => {
    mockDashboardService.getTotalClicks.and.returnValue(of(5)); // Simular que el servicio devuelve 5 clicks
    dashboardFixture.detectChanges(); // Forzar ngOnInit nuevamente

    const compiled = dashboardFixture.nativeElement;
    expect(compiled.querySelector('p:first-of-type').textContent).toContain('Total de Clicks Registrados: 5');
  });
});

/*
Un error común es no mockear adecuadamente los servicios de los que dependen los componentes.
Si el `DashboardService` real fuera llamado en lugar del mock, la prueba sería lenta y
dependería del estado interno del servicio, haciendo la prueba menos unitaria y más volátil.

Otro error es no verificar que los métodos de los servicios mockeados fueron llamados
con los argumentos correctos (`toHaveBeenCalledWith`). Esto asegura que el flujo de datos
y la lógica de negocio se activen correctamente.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Pruebas y Herramientas',
    'topic': 'Pruebas de Integración',
    'subtopic': 'Herramientas para pruebas de integración',
    'definition': r'''
Mientras Jasmine y Karma son excelentes para las pruebas unitarias, cuando se trata de "pruebas de integración" (y a menudo las de extremo a extremo), necesitas herramientas más robustas que puedan simular un navegador completo y la interacción de un usuario real con tu aplicación.

No sé tú, pero a mí esto al principio me costó. 

La idea es que, Pensemos por un momento en que has ensamblado todas las partes de tu coche. Ahora, necesitas a alguien que se siente al volante, lo encienda, conduzca por diferentes terrenos y vea cómo se comporta todo en conjunto. Las pruebas de integración a gran escala y las pruebas de extremo a extremo (E2E) necesitan herramientas que puedan "manejar" tu aplicación en un navegador de verdad, interactuar con los elementos de la interfaz de usuario como lo haría un humano, y verificar el estado de la aplicación.
Aquí te va la aclaración:
* **Protractor**: Era la herramienta "oficial" para pruebas E2E en Angular por mucho tiempo. Utilizaba WebDriver para interactuar con navegadores reales y tenía integraciones específicas para Angular. Sin embargo, su desarrollo se ha desacelerado y no es la opción más recomendada hoy en día.
* **Cypress**: Es una herramienta más moderna y popular para pruebas de integración y E2E. Es más rápida, fácil de configurar y depurar que Protractor. Corre directamente en el navegador, lo que le da acceso al DOM y al estado de la aplicación de una manera que WebDriver no puede. Su API es intuitiva y ofrece características como la "recarga automática", el "viaje en el tiempo" (para depurar) y la captura de videos. Es una excelente opción para probar cómo los componentes interactúan entre sí y con el backend, simulando flujos de usuario completos.
* **Playwright**: Desarrollado por Microsoft, es otra alternativa potente y muy versátil. Soporta múltiples navegadores (Chromium, Firefox, WebKit) y puede ejecutar pruebas en paralelo. Su objetivo es proporcionar una API unificada para automatizar cualquier navegador. Es muy rápido y fiable para pruebas E2E y de integración.

Elegir la herramienta correcta para tus pruebas de integración y E2E es crucial, ya que impacta directamente en la velocidad de tus ciclos de desarrollo y en la confianza que tienes en tu aplicación antes de llevarla a producción. Cypress y Playwright son las opciones más relevantes y robustas en el ecosistema Angular actual.
''',
    'code_example': r'''
// NOTA: Los ejemplos de código para Cypress o Playwright se escriben
// en sus propios archivos de prueba (ej. `my-feature.cy.ts` para Cypress)
// y se ejecutan con sus propios CLI, no directamente dentro de un archivo Angular.

// --- Ejemplo con Cypress (ej. cypress/e2e/login.cy.ts) ---
// Primero, asegúrate de tener Cypress instalado: `npm install cypress --save-dev`
// Luego, puedes abrirlo con `npx cypress open` y crear un archivo de prueba.

describe('Flujo de Login', () => {
  beforeEach(() => {
    // Visita la página de login de tu aplicación Angular
    cy.visit('/login');
  });

  it('debería mostrar un mensaje de error con credenciales incorrectas', () => {
    // Encontrar los campos de usuario y contraseña y escribir valores
    cy.get('input[type="text"]').type('usuario_incorrecto');
    cy.get('input[type="password"]').type('password_incorrecto');

    // Clicar en el botón de login
    cy.get('button').contains('Iniciar Sesión').click();

    // Verificar que aparece un mensaje de error
    cy.get('.error-message').should('be.visible').and('contain', 'Credenciales inválidas.');
  });

  it('debería logearse correctamente y redirigir al dashboard', () => {
    // Escribir credenciales correctas (asumiendo que 'user'/'pass' son válidas)
    cy.get('input[type="text"]').type('user');
    cy.get('input[type="password"]').type('pass');
    cy.get('button').contains('Iniciar Sesión').click();

    // Verificar que la URL cambia al dashboard
    cy.url().should('include', '/dashboard');

    // Verificar que un elemento en el dashboard es visible
    cy.get('h1').should('contain', 'Panel de Control');

    // Puedes hacer más aserciones, como verificar que el botón de logout existe
    cy.get('button').contains('Cerrar Sesión').should('be.visible');
  });

  it('debería permitir logout', () => {
    // Logearse primero para estar en el estado de "logueado"
    cy.get('input[type="text"]').type('user');
    cy.get('input[type="password"]').type('pass');
    cy.get('button').contains('Iniciar Sesión').click();
    cy.url().should('include', '/dashboard');

    // Clicar en el botón de logout
    cy.get('button').contains('Cerrar Sesión').click();

    // Verificar que la URL vuelve a la página de login
    cy.url().should('include', '/login');
    // Y que el campo de usuario está de nuevo visible
    cy.get('input[type="text"]').should('be.visible');
  });
});

// --- Ejemplo con Playwright (ej. tests/e2e/login.spec.ts) ---
// Primero, instala Playwright: `npm install @playwright/test` y `npx playwright install`
// Luego, puedes ejecutar las pruebas con `npx playwright test`.

import { test, expect } from '@playwright/test';

test.beforeEach(async ({ page }) => {
  // Navega a la página de login antes de cada prueba
  await page.goto('http://localhost:4200/login'); // Ajusta la URL de tu app Angular
});

test('debería mostrar un mensaje de error con credenciales incorrectas', async ({ page }) => {
  await page.locator('input[type="text"]').fill('usuario_incorrecto');
  await page.locator('input[type="password"]').fill('password_incorrecto');
  await page.locator('button:has-text("Iniciar Sesión")').click();

  // Esperar a que el mensaje de error sea visible
  const errorMessage = page.locator('.error-message');
  await expect(errorMessage).toBeVisible();
  await expect(errorMessage).toContainText('Credenciales inválidas.');
});

test('debería logearse correctamente y redirigir al dashboard', async ({ page }) => {
  await page.locator('input[type="text"]').fill('user');
  await page.locator('input[type="password"]').fill('pass');
  await page.locator('button:has-text("Iniciar Sesión")').click();

  // Verificar la URL después de la redirección
  await expect(page).toHaveURL(/.*dashboard/);

  // Verificar un elemento en el dashboard
  await expect(page.locator('h1')).toContainText('Panel de Control');
  await expect(page.locator('button:has-text("Cerrar Sesión")')).toBeVisible();
});

test('debería permitir cerrar sesión', async ({ page }) => {
  // Primero, logearse
  await page.locator('input[type="text"]').fill('user');
  await page.locator('input[type="password"]').fill('pass');
  await page.locator('button:has-text("Iniciar Sesión")').click();
  await expect(page).toHaveURL(/.*dashboard/);

  // Clicar en cerrar sesión
  await page.locator('button:has-text("Cerrar Sesión")').click();

  // Verificar la redirección de vuelta al login
  await expect(page).toHaveURL(/.*login/);
  await expect(page.locator('input[type="text"]')).toBeVisible();
});

/*
Un error común al escribir pruebas E2E es usar selectores CSS o XPath demasiado frágiles
(por ejemplo, basarse en el orden de los elementos o IDs generados dinámicamente).
Es mejor usar selectores que sean más robustos, como `data-test-id` personalizados,
o texto visible (`button:has-text("Iniciar Sesión")`), que son menos propensos a romperse
con cambios menores en el HTML.

Otro error es no manejar la asincronía correctamente. Las interacciones con el navegador
son asíncronas, por lo que es crucial usar `await` en Playwright o los comandos encadenados
de Cypress (`.then()`, `.should()`) para asegurar que las acciones y aserciones se ejecuten
en el orden correcto y que el navegador tenga tiempo de renderizar los cambios.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Formularios y Validaciones',
    'topic': 'Validaciones Personalizadas',
    'subtopic': 'Creación de validadores personalizados',
    'definition': r'''
Las validaciones integradas de Angular y HTML5 son geniales, pero inevitablemente te encontrarás con situaciones en las que necesitas una lógica de validación que no está disponible por defecto. Aquí es donde la "creación de validadores personalizados" se vuelve una herramienta esencial en tu arsenal de Angular.

Seguramente pensarás de qué va todo esto... Pues, un validador personalizado es una función o una clase que te permite implementar cualquier lógica de validación que se te ocurra, desde verificar un formato de código postal específico hasta asegurar que un campo no contenga ciertas palabras ofensivas. Estos validadores reciben un `AbstractControl` (que puede ser un `FormControl`, `FormGroup` o `FormArray`) y devuelven un objeto de errores (`ValidationErrors`) si la validación falla, o `null` si es exitosa. Pensemos por un momento en una tienda online donde los códigos de descuento deben tener un formato muy específico, por ejemplo, "DESC-XXXX" donde X son números. No hay un validador HTML5 o de Angular que haga eso. Tú crearías una función validadora que reciba el `FormControl` del código de descuento, aplique una expresión regular para verificar el formato, y si no coincide, devuelva un objeto como `{ 'invalidDiscountCode': true }`. Estos validadores pueden ser síncronos (si la lógica es inmediata) o asíncronos (si necesitan, por ejemplo, hacer una llamada a una API para verificar la unicidad de un dato). Al crear tus propios validadores, mantienes tu lógica de validación encapsulada y reutilizable, lo que hace que tus formularios sean más robustos y fáciles de mantener.
''',
    'code_example': r'''
// 1. Crear un archivo para el validador personalizado (ej. custom-validators.ts):
import { AbstractControl, ValidatorFn, ValidationErrors } from '@angular/forms';
import { Observable, timer } from 'rxjs';
import { map, take } from 'rxjs/operators';

// Validador Síncrono: Verifica si un campo no contiene la palabra 'badword'
export function forbiddenWordValidator(forbiddenWord: string): ValidatorFn {
  return (control: AbstractControl): ValidationErrors | null => {
    const value = control.value as string;
    if (value && value.toLowerCase().includes(forbiddenWord.toLowerCase())) {
      return { forbiddenWord: { value: control.value } }; // Error
    }
    return null; // Válido
  };
}

// Validador Asíncrono: Simula la verificación de disponibilidad de un email en un servidor
export function uniqueEmailValidator(delayMs: number = 500): ValidatorFn {
  return (control: AbstractControl): Promise<ValidationErrors | null> | Observable<ValidationErrors | null> => {
    const email = control.value;
    if (!email) {
      return of(null); // Si no hay email, no hay error de unicidad
    }

    // Simula una llamada a un servidor
    return timer(delayMs).pipe(
      map(() => {
        const emailsTaken = ['test@example.com', 'admin@domain.com'];
        if (emailsTaken.includes(email)) {
          return { uniqueEmail: true }; // Error: email ya tomado
        }
        return null; // Válido
      }),
      take(1) // Asegura que el observable se complete después de un valor
    );
  };
}

// 2. Usar los validadores en tu componente de formulario reactivo:
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { forbiddenWordValidator, uniqueEmailValidator } from './custom-validators'; // Importa tus validadores

@Component({
  selector: 'app-custom-validation-form',
  template: `
    <form [formGroup]="myForm" (ngSubmit)="onSubmit()">
      <div>
        <label for="message">Mensaje:</label>
        <input id="message" type="text" formControlName="message">
        <div *ngIf="myForm.get('message')?.invalid && myForm.get('message')?.touched">
          <span *ngIf="myForm.get('message')?.errors?.['forbiddenWord']" style="color: red;">
            ¡La palabra 'badword' no está permitida!
          </span>
        </div>
      </div>

      <div>
        <label for="email">Email:</label>
        <input id="email" type="email" formControlName="email">
        <div *ngIf="myForm.get('email')?.invalid && myForm.get('email')?.touched">
          <span *ngIf="myForm.get('email')?.errors?.['required']" style="color: red;">El email es obligatorio.</span>
          <span *ngIf="myForm.get('email')?.errors?.['email']" style="color: red;">Formato de email inválido.</span>
          <span *ngIf="myForm.get('email')?.errors?.['uniqueEmail']" style="color: red;">Este email ya está registrado.</span>
        </div>
        <div *ngIf="myForm.get('email')?.pending">Verificando email...</div>
      </div>

      <button type="submit" [disabled]="myForm.invalid || myForm.pending">Enviar</button>
    </form>
  `
})
export class CustomValidationFormComponent implements OnInit {
  myForm: FormGroup;

  constructor(private fb: FormBuilder) { }

  ngOnInit(): void {
    this.myForm = this.fb.group({
      message: ['', [Validators.required, forbiddenWordValidator('badword')]],
      email: ['',
        [Validators.required, Validators.email],
        [uniqueEmailValidator(800)] // Pasa un retraso al validador asíncrono
      ]
    });
  }

  onSubmit(): void {
    if (this.myForm.valid) {
      console.log('Formulario válido:', this.myForm.value);
    } else {
      console.log('Formulario inválido.');
      this.myForm.markAllAsTouched();
    }
  }
}

/*
Un error común es olvidar devolver 'null' del validador si la validación es exitosa.
Si el validador no devuelve nada o devuelve algo distinto de 'null' o un objeto de errores,
Angular no sabrá el estado de validación.

Para validadores asíncronos, es crucial que el Observable o Promise se complete
después de emitir su valor (usualmente con `take(1)` en Observables),
de lo contrario, el control permanecerá en estado 'pending'.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Formularios y Validaciones',
    'topic': 'Validaciones Personalizadas',
    'subtopic': 'Aplicación de validaciones condicionales',
    'definition': r'''
En el mundo real, los formularios no siempre son estáticos. A veces, la validación de un campo depende del valor de otro campo, o incluso de alguna lógica de negocio específica. Aquí es donde la "aplicación de validaciones condicionales" se vuelve indispensable para construir formularios dinámicos y adaptables.

Aquí te va la aclaración: Pensemos por un momento en un formulario de registro. Si el usuario selecciona "Otro" en un campo de selección de género, entonces aparece un nuevo campo de texto donde debe especificar cuál es ese "otro". En ese momento, ese nuevo campo debe volverse obligatorio. O quizás, si un usuario indica que es mayor de edad, no es necesario pedir el consentimiento de los padres. Estas son validaciones condicionales. En Angular, puedes lograr esto de varias maneras:
1.  **Observando cambios en otros controles:** Puedes suscribirte al `valueChanges` de un `FormControl` y, cuando su valor cambie, agregar o remover validadores a otro `FormControl` usando `setValidators()` o `clearValidators()`. Luego, debes llamar a `updateValueAndValidity()` para que el control reevalúe su estado.
2.  **Validadores a nivel de FormGroup:** Para validaciones que involucran la relación entre varios campos (por ejemplo, "la contraseña y la confirmación de contraseña deben ser iguales"), puedes crear un validador personalizado a nivel de `FormGroup`. Este validador recibe todo el `FormGroup` y puede comparar los valores de sus controles hijos.

La clave es que Angular te da las herramientas para manipular dinámicamente las reglas de validación en tiempo de ejecución, lo que permite que tus formularios se adapten inteligentemente a la entrada del usuario, mejorando la usabilidad y la precisión de los datos.
''',
    'code_example': r'''
// 1. Validador personalizado a nivel de FormGroup (ej. password-match.validator.ts):
import { AbstractControl, ValidationErrors, ValidatorFn } from '@angular/forms';

// Validador que compara dos campos (ej. contraseña y confirmación)
export const passwordMatchValidator: ValidatorFn = (control: AbstractControl): ValidationErrors | null => {
  const password = control.get('password');
  const confirmPassword = control.get('confirmPassword');

  if (!password || !confirmPassword) {
    return null; // Los controles no existen, no se puede validar
  }

  // Si confirmPassword tiene valor y no coincide con password, retorna error
  if (confirmPassword.value && password.value !== confirmPassword.value) {
    // Establecer el error en el control 'confirmPassword'
    confirmPassword.setErrors({ passwordMismatch: true });
    return { passwordMismatch: true }; // Error a nivel de FormGroup
  } else {
    // Si coinciden o confirmPassword está vacío, asegurar que no haya error de passwordMismatch
    if (confirmPassword.errors && confirmPassword.errors['passwordMismatch']) {
      // Eliminar solo el error 'passwordMismatch' si existe
      const { passwordMismatch, ...rest } = confirmPassword.errors;
      confirmPassword.setErrors(Object.keys(rest).length ? rest : null);
    }
    return null; // Válido
  }
};


// 2. En tu componente de formulario reactivo (ej. user-registration.component.ts):
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { passwordMatchValidator } from './password-match.validator'; // Importa el validador

@Component({
  selector: 'app-user-registration',
  template: `
    <form [formGroup]="registrationForm" (ngSubmit)="onSubmit()">
      <div>
        <label for="hasMiddleName">¿Tiene segundo nombre?</label>
        <input type="checkbox" id="hasMiddleName" formControlName="hasMiddleName">
      </div>

      <div *ngIf="registrationForm.get('hasMiddleName')?.value">
        <label for="middleName">Segundo Nombre:</label>
        <input id="middleName" type="text" formControlName="middleName">
        <div *ngIf="registrationForm.get('middleName')?.invalid && registrationForm.get('middleName')?.touched" style="color: red;">
          El segundo nombre es obligatorio si lo tiene.
        </div>
      </div>

      <hr>
      <h3>Validación de Contraseñas:</h3>
      <div>
        <label for="password">Contraseña:</label>
        <input type="password" id="password" formControlName="password">
        <div *ngIf="registrationForm.get('password')?.invalid && registrationForm.get('password')?.touched" style="color: red;">
          La contraseña es obligatoria.
        </div>
      </div>

      <div>
        <label for="confirmPassword">Confirmar Contraseña:</label>
        <input type="password" id="confirmPassword" formControlName="confirmPassword">
        <div *ngIf="registrationForm.get('confirmPassword')?.invalid && registrationForm.get('confirmPassword')?.touched" style="color: red;">
          <span *ngIf="registrationForm.get('confirmPassword')?.errors?.['passwordMismatch']">Las contraseñas no coinciden.</span>
        </div>
        <div *ngIf="registrationForm.errors?.['passwordMismatch'] && registrationForm.get('confirmPassword')?.touched" style="color: red;">
          Las contraseñas no coinciden (error de grupo).
        </div>
      </div>

      <button type="submit" [disabled]="registrationForm.invalid">Registrar</button>
    </form>

    <p>Estado del Formulario: {{ registrationForm.status }}</p>
    <p>Errores del Formulario: {{ registrationForm.errors | json }}</p>
  `
})
export class UserRegistrationComponent implements OnInit {
  registrationForm: FormGroup;

  constructor(private fb: FormBuilder) { }

  ngOnInit(): void {
    this.registrationForm = this.fb.group({
      hasMiddleName: [false],
      middleName: [''], // Campo que se validará condicionalmente
      password: ['', Validators.required],
      confirmPassword: ['', Validators.required]
    }, { validators: passwordMatchValidator }); // Aplica el validador de grupo aquí

    // Lógica para validación condicional del campo 'middleName'
    this.registrationForm.get('hasMiddleName')?.valueChanges.subscribe(hasMiddleName => {
      const middleNameControl = this.registrationForm.get('middleName');
      if (hasMiddleName) {
        middleNameControl?.setValidators(Validators.required);
      } else {
        middleNameControl?.clearValidators();
        middleNameControl?.setValue(''); // Limpiar valor si ya no es necesario
      }
      middleNameControl?.updateValueAndValidity(); // Muy importante para reevaluar validaciones
    });
  }

  onSubmit(): void {
    if (this.registrationForm.valid) {
      console.log('Registro exitoso:', this.registrationForm.value);
    } else {
      console.log('Formulario inválido.');
      this.registrationForm.markAllAsTouched();
    }
  }
}

/*
Un error común es olvidar llamar a `updateValueAndValidity()` en el `FormControl`
después de cambiar sus validadores (`setValidators` o `clearValidators`).
Si no lo haces, el control no reevaluará su estado de validación y los errores no se mostrarán.

Otro error en validadores de grupo es no limpiar los errores de los controles individuales
cuando la condición de error ya no se cumple (como el `passwordMismatch` en `confirmPassword`).
Asegúrate de manejar esto para evitar que los controles se queden en un estado de error persistente.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Formularios y Validaciones',
    'topic': 'Validaciones Personalizadas',
    'subtopic': 'Integración de validaciones en formularios complejos',
    'definition': r'''
Cuando construyes formularios que van más allá de lo básico, la integración de todas las validaciones (síncronas, asíncronas, personalizadas y condicionales) puede parecer un rompecabezas. Sin embargo, Angular te da las herramientas para que incluso los formularios más complejos mantengan una lógica de validación limpia y manejable.

Aquí te va la aclaración: Pensemos por un momento en un formulario de checkout de una tienda en línea. Este formulario podría tener secciones de información de envío, detalles de pago, y datos del cliente. Cada sección podría ser un `FormGroup` anidado, y dentro de ellos, `FormControls` individuales con sus propias validaciones. Además, la validez del método de pago podría depender del país de envío (validación condicional), y la verificación de la tarjeta de crédito podría requerir una llamada a una API (validación asíncrona). La clave para integrar todo esto es la naturaleza jerárquica y reactiva de los formularios de Angular. Puedes aplicar validadores a nivel de `FormControl` para campos individuales, validadores a nivel de `FormGroup` para relaciones entre campos, y validadores asíncronos cuando necesites lógica que implique promesas u observables. Al usar `FormBuilder`, construyes esta estructura de forma declarativa, y Angular se encarga de propagar el estado de validación (válido/inválido/pendiente) desde los controles individuales hasta los grupos y, finalmente, al formulario completo. Esto significa que puedes deshabilitar el botón de envío del formulario principal si cualquier parte de él es inválida. La habilidad de componer validadores y anidar formularios te permite construir interfaces de usuario robustas y amigables, donde la validación ocurre en tiempo real y el feedback es instantáneo, guiando al usuario a través del proceso de llenado sin frustraciones.
''',
    'code_example': r'''
// 1. Reutiliza los validadores personalizados (ej. custom-validators.ts y password-match.validator.ts)
// y crea un componente de formulario que los integre.

// En tu componente de formulario complejo (ej. complex-registration.component.ts):
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators, FormArray } from '@angular/forms';
import { forbiddenWordValidator, uniqueEmailValidator } from './custom-validators'; // Tus validadores personalizados
import { passwordMatchValidator } from './password-match.validator'; // Tu validador de grupo

@Component({
  selector: 'app-complex-registration',
  template: `
    <form [formGroup]="complexForm" (ngSubmit)="onSubmit()">
      <h3>Datos Personales</h3>
      <div formGroupName="personalInfo">
        <div>
          <label for="firstName">Nombre:</label>
          <input id="firstName" type="text" formControlName="firstName">
          <div *ngIf="complexForm.get('personalInfo.firstName')?.invalid && complexForm.get('personalInfo.firstName')?.touched" style="color: red;">
            El nombre es obligatorio.
          </div>
        </div>
        <div>
          <label for="email">Email:</label>
          <input id="email" type="email" formControlName="email">
          <div *ngIf="complexForm.get('personalInfo.email')?.invalid && complexForm.get('personalInfo.email')?.touched" style="color: red;">
            <span *ngIf="complexForm.get('personalInfo.email')?.errors?.['required']">El email es obligatorio.</span>
            <span *ngIf="complexForm.get('personalInfo.email')?.errors?.['email']">Email inválido.</span>
            <span *ngIf="complexForm.get('personalInfo.email')?.errors?.['uniqueEmail']">Email ya registrado.</span>
          </div>
          <div *ngIf="complexForm.get('personalInfo.email')?.pending">Verificando email...</div>
        </div>
      </div>

      <h3>Contraseña</h3>
      <div formGroupName="security">
        <div>
          <label for="password">Contraseña:</label>
          <input type="password" id="password" formControlName="password">
          <div *ngIf="complexForm.get('security.password')?.invalid && complexForm.get('security.password')?.touched" style="color: red;">
            La contraseña es obligatoria y mínimo 6 caracteres.
          </div>
        </div>
        <div>
          <label for="confirmPassword">Confirmar Contraseña:</label>
          <input type="password" id="confirmPassword" formControlName="confirmPassword">
          <div *ngIf="complexForm.get('security.confirmPassword')?.invalid && complexForm.get('security.confirmPassword')?.touched" style="color: red;">
            Las contraseñas no coinciden.
          </div>
        </div>
      </div>

      <h3>Teléfonos</h3>
      <div formArrayName="phones">
        <div *ngFor="let phoneControl of phones.controls; let i = index" [formGroupName]="i">
          <label for="phoneType{{i}}">Tipo:</label>
          <select id="phoneType{{i}}" formControlName="type">
            <option value="home">Casa</option>
            <option value="mobile">Móvil</option>
          </select>
          <label for="phoneNumber{{i}}">Número:</label>
          <input id="phoneNumber{{i}}" type="text" formControlName="number">
          <div *ngIf="phoneControl.invalid && phoneControl.touched" style="color: red;">
            Número es obligatorio.
          </div>
          <button type="button" (click)="removePhone(i)">Eliminar</button>
        </div>
        <button type="button" (click)="addPhone()">Añadir Teléfono</button>
      </div>

      <button type="submit" [disabled]="complexForm.invalid || complexForm.pending">Registrar Cuenta</button>
    </form>

    <hr>
    <p>Estado del Formulario Complejo: {{ complexForm.status }}</p>
    <p>Valor del Formulario Complejo: {{ complexForm.value | json }}</p>
  `
})
export class ComplexRegistrationComponent implements OnInit {
  complexForm: FormGroup;

  constructor(private fb: FormBuilder) { }

  ngOnInit(): void {
    this.complexForm = this.fb.group({
      personalInfo: this.fb.group({
        firstName: ['', Validators.required],
        lastName: [''],
        email: ['',
          [Validators.required, Validators.email],
          [uniqueEmailValidator(800)] // Validador asíncrono
        ]
      }),
      security: this.fb.group({
        password: ['', [Validators.required, Validators.minLength(6)]],
        confirmPassword: ['', Validators.required]
      }, { validators: passwordMatchValidator }), // Validador a nivel de grupo
      phones: this.fb.array([
        this.createPhoneGroup()
      ])
    });

    // Ejemplo de validación condicional compleja:
    // Si el nombre tiene 'admin', el email no puede ser 'admin@domain.com'
    // Esta lógica podría ir en un validador a nivel de FormGroup 'personalInfo'
    this.complexForm.get('personalInfo.firstName')?.valueChanges.subscribe(firstName => {
      const emailControl = this.complexForm.get('personalInfo.email');
      if (firstName?.toLowerCase().includes('admin') && emailControl?.value === 'admin@domain.com') {
        emailControl?.setErrors({ adminEmailConflict: true });
      } else if (emailControl?.errors && emailControl.errors['adminEmailConflict']) {
        // Limpiar el error si ya no aplica
        const { adminEmailConflict, ...rest } = emailControl.errors;
        emailControl.setErrors(Object.keys(rest).length ? rest : null);
      }
    });
  }

  // Getter para acceder fácilmente al FormArray 'phones' en la plantilla
  get phones(): FormArray {
    return this.complexForm.get('phones') as FormArray;
  }

  createPhoneGroup(): FormGroup {
    return this.fb.group({
      type: ['mobile', Validators.required],
      number: ['', Validators.required]
    });
  }

  addPhone(): void {
    this.phones.push(this.createPhoneGroup());
  }

  removePhone(index: number): void {
    this.phones.removeAt(index);
  }

  onSubmit(): void {
    // Marcar todos los controles como 'touched' para mostrar los errores al intentar enviar
    this.markAllControlsAsTouched(this.complexForm);

    if (this.complexForm.valid) {
      console.log('Formulario Complejo Válido:', this.complexForm.value);
      // Aquí enviarías los datos a un servicio
    } else {
      console.log('Formulario Complejo Inválido.');
    }
  }

  // Función auxiliar para marcar todos los controles como 'touched'
  markAllControlsAsTouched(formGroup: FormGroup | FormArray): void {
    Object.values(formGroup.controls).forEach(control => {
      control.markAsTouched();
      if (control instanceof FormGroup || control instanceof FormArray) {
        this.markAllControlsAsTouched(control);
      }
    });
  }
}

/*
Un error común es no validar los `FormArray` correctamente o no enlazar los `FormGroup` anidados
con `formGroupName` en la plantilla.

La función `markAllControlsAsTouched` es un patrón útil para garantizar que todos los mensajes
de error se muestren al usuario cuando intenta enviar un formulario inválido,
ya que por defecto, los errores solo se muestran en campos 'touched'.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Pruebas y Herramientas',
    'topic': 'Automatización de Tareas',
    'subtopic': 'Uso de scripts npm',
    'definition': r'''
En el desarrollo de Angular, no quieres hacer todo manualmente. Los "scripts npm" son como pequeños programas que te permiten automatizar tareas comunes, desde compilar tu código hasta ejecutar pruebas o desplegar tu aplicación.

¿Te estás preguntando por qué esto importa?

Aquí te va la aclaración: Pensemos por un momento en una línea de ensamblaje de coches. No quieres que cada paso (soldar, pintar, instalar ruedas) se haga a mano; necesitas robots y procesos automatizados para que todo sea rápido y consistente. Los scripts npm son esos "robots" para tu proyecto Angular. Están definidos en el archivo `package.json` y puedes ejecutarlos con el comando `npm run <nombre_del_script>`. Angular CLI (Command Line Interface) ya viene con scripts predefinidos como `start` (para correr en desarrollo), `build` (para compilar para producción) y `test` (para ejecutar pruebas unitarias). Pero la verdadera magia es que puedes crear tus propios scripts para casi cualquier cosa: copiar archivos, ejecutar herramientas de análisis de código, desplegar a un servidor, etc. Esto te ahorra tiempo, reduce errores y hace que el flujo de trabajo de tu equipo sea más eficiente.
''',
    'code_example': r'''
// Ejemplo de un archivo `package.json` con scripts npm personalizados

{
  "name": "mi-proyecto-angular",
  "version": "1.0.0",
  "scripts": {
    "ng": "ng", // El comando base de Angular CLI
    "start": "ng serve", // Correr en modo desarrollo
    "build": "ng build", // Compilar para producción
    "watch": "ng build --watch --configuration development", // Compilar y recompilar automáticamente en desarrollo
    "test": "ng test", // Ejecutar pruebas unitarias
    "e2e": "ng e2e", // Ejecutar pruebas de extremo a extremo (si están configuradas)
    "lint": "ng lint", // Ejecutar linters (análisis de código estático)
    "e2e:ci": "ng e2e --watch=false --browsers=ChromeHeadless", // E2E para integración continua
    "format": "prettier --write \"src/**/*.ts\" \"e2e/**/*.ts\"", // Formatear el código con Prettier
    "deploy": "npm run build && firebase deploy", // Compilar y desplegar a Firebase
    "analyze": "ng build --stats-json && webpack-bundle-analyzer dist/mi-proyecto-angular/stats.json", // Analizar el tamaño del bundle
    "update-dependencies": "npm update", // Actualizar dependencias a las últimas versiones
    "backup-database": "node scripts/backup-database.js", // Script personalizado para hacer un backup de la base de datos
    "generate-docs": "compodoc -p tsconfig.json -s", // Generar documentación con Compodoc
    "bump-version": "npm version patch -m \"Bumped version to %s\"", // Incrementar la versión del proyecto
    "prepare": "husky install" // Configurar Husky (hooks de Git)
  },
  "dependencies": {
    // ...dependencias del proyecto...
  },
  "devDependencies": {
    // ...dependencias de desarrollo...
    "@angular/cli": "~17.0.0", // Angular CLI
    "@angular/compiler-cli": "~17.0.0",
    "typescript": "~5.2.2",
    "prettier": "^3.0.0", // Formateador de código
    "webpack-bundle-analyzer": "^4.9.0", // Analizador del tamaño del bundle
    "compodoc": "^14.0.0", // Generador de documentación
    "husky": "^8.0.0", // Hooks de Git
    // ...otras dependencias de desarrollo...
  }
}

/*
Para usar un script npm:
1. Abre tu terminal en la raíz de tu proyecto Angular.
2. Ejecuta `npm run <nombre_del_script>`. Por ejemplo:
   - `npm run start` para correr la aplicación en desarrollo.
   - `npm run build` para compilar para producción.
   - `npm run test` para ejecutar las pruebas unitarias.
   - `npm run format` (si lo definiste) para formatear tu código.
   - `npm run deploy` (si lo definiste) para desplegar tu aplicación.

Un error común es olvidar que los scripts npm son esencialmente comandos de la terminal.
Si un script falla, la terminal te dará el mensaje de error. Asegúrate de que los comandos
dentro de tus scripts sean correctos y que las dependencias necesarias estén instaladas.

Otro error es no aprovechar los scripts npm para tareas repetitivas. Si te encuentras
haciendo la misma secuencia de comandos una y otra vez, conviértela en un script npm.
Esto hará que tu flujo de trabajo sea más eficiente y menos propenso a errores.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Pruebas y Herramientas',
    'topic': 'Automatización de Tareas',
    'subtopic': 'Integración con herramientas de automatización',
    'definition': r'''
Los scripts npm son un buen comienzo, pero para flujos de trabajo más complejos, querrás integrar tu proyecto Angular con herramientas de automatización más robustas. Estas herramientas pueden orquestar múltiples tareas, reaccionar a eventos (como un push a un repositorio) y ejecutar tareas en servidores remotos.

Esto tiene una explicación, y es porque Pensemos por un momento en una fábrica moderna. No solo tienes robots individuales; tienes una línea de ensamblaje completa, con robots que se coordinan entre sí, cintas transportadoras que mueven las piezas y sensores que aseguran que todo funcione sin problemas. De manera similar, en el desarrollo de Angular, las herramientas de automatización te permiten crear una "línea de ensamblaje" para tu código:
* **Integración Continua/Entrega Continua (CI/CD)**: Herramientas como Jenkins, GitLab CI, GitHub Actions o Travis CI automatizan el proceso de construcción, prueba y despliegue de tu aplicación cada vez que hay cambios en el código. Esto asegura que los nuevos cambios no rompan nada y que siempre tengas una versión desplegable de tu aplicación.
* **Automatización de Builds**: Puedes configurar estas herramientas para que ejecuten scripts npm (como `build`, `test`, `lint`) en un servidor, generar artefactos (como archivos `.js` y `.css` optimizados), y luego desplegarlos a un entorno de pruebas o producción.
* **Automatización de Pruebas**: Ejecutar pruebas unitarias y de extremo a extremo automáticamente es crucial. Estas herramientas pueden ejecutar tus pruebas en navegadores reales o simulados, generar informes y notificarte si alguna prueba falla.
* **Análisis de Código**: Integrar linters y herramientas de análisis estático (como ESLint y SonarQube) para verificar la calidad y el estilo de tu código automáticamente.
* **Despliegue Automatizado**: Desplegar tu aplicación a un servidor (ya sea en la nube o local) puede ser un proceso complejo. Estas herramientas pueden automatizar este proceso, desde la copia de archivos hasta la configuración del servidor.

Integrar tu proyecto Angular con estas herramientas te permite enfocarte en escribir código, sabiendo que el resto del flujo de trabajo está automatizado y es fiable.
''',
    'code_example': r'''
// Ejemplo de configuración de GitHub Actions (ej. .github/workflows/main.yml)
// Este archivo define un flujo de trabajo que se ejecuta en cada "push" y "pull request"
// a la rama "main".

name: CI/CD Angular

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest # Ejecutar en un servidor Ubuntu

    steps:
    - uses: actions/checkout@v3 # Obtener el código del repositorio
    - name: Use Node.js 18
      uses: actions/setup-node@v3
      with:
        node-version: '18' # Usar Node.js versión 18
        cache: 'npm' # Cachear las dependencias de npm

    - name: Instalar dependencias
      run: npm ci # `npm ci` es como `npm install`, pero más rápido y fiable

    - name: Lint, Build y Test
      run: |
        npm run lint
        npm run build --configuration production
        npm run test --watch=false --browsers=ChromeHeadless # Pruebas en modo headless

    - name: Subir artefactos de build
      uses: actions/upload-artifact@v3
      with:
        name: dist
        path: dist/mi-proyecto-angular # Subir los archivos compilados

  deploy:
    needs: build # Depende del job "build"
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/main' # Solo desplegar si el push es a la rama "main"

    steps:
    - uses: actions/checkout@v3
    - name: Descargar artefactos de build
      uses: actions/download-artifact@v3
      with:
        name: dist
        path: dist

    - name: Desplegar a Firebase Hosting
      uses: FirebaseExtended/action-hosting-deploy@v0
      with:
        repoToken: '${{ secrets.GITHUB_TOKEN }}'
        firebaseServiceAccount: '${{ secrets.FIREBASE_SERVICE_ACCOUNT }}'
        channelId: live
        projectId: mi-proyecto-firebase # Ajusta esto
        entrypoint: dist # El directorio con los archivos compilados

/*
Para integrar tu proyecto Angular con herramientas de automatización:
1. Elige una herramienta (Jenkins, GitLab CI, GitHub Actions, etc.).
2. Crea un archivo de configuración (ej. `.github/workflows/main.yml` para GitHub Actions).
3. Define los "jobs" (tareas) que quieres automatizar (build, test, deploy, etc.).
4. Define los "steps" (pasos) dentro de cada job (instalar dependencias, ejecutar scripts npm, etc.).
5. Configura las credenciales y las variables de entorno necesarias (ej. claves de API, tokens).
6. Haz "push" a tu código y observa cómo la herramienta ejecuta automáticamente tu flujo de trabajo.

Un error común es no entender la diferencia entre integración continua (CI) y entrega continua (CD).
CI se enfoca en automatizar la construcción y prueba de tu código. CD se enfoca en automatizar
el despliegue. A menudo se usan juntas, pero son conceptos distintos.

Otro error es no asegurar tus credenciales y variables de entorno. Nunca hardcodees secretos
en tus archivos de configuración. Usa las funciones de "secrets" de tu herramienta de automatización
para almacenarlos de forma segura.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Angular',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Pruebas y Herramientas',
    'topic': 'Automatización de Tareas',
    'subtopic': 'Configuración de tareas recurrentes',
    'definition': r'''
Algunas tareas en el desarrollo de Angular no son eventos únicos (como compilar o desplegar), sino que necesitas que se ejecuten periódicamente. La "configuración de tareas recurrentes" te permite automatizar estas tareas, asegurando que se ejecuten a intervalos regulares sin intervención manual.

Aquí te va la aclaración: Pensemos por un momento en el mantenimiento de un edificio. No solo lo construyes una vez; necesitas limpiarlo, repararlo y revisarlo periódicamente. En el desarrollo de Angular, algunas tareas necesitan este tipo de "mantenimiento" continuo:
* **Backups de la base de datos**: Si tu aplicación tiene un backend, necesitas hacer backups regulares para proteger los datos.
* **Limpieza de logs**: Los archivos de log pueden crecer mucho con el tiempo. Necesitas rotarlos o eliminarlos periódicamente.
* **Actualización de dependencias**: Mantener tus dependencias actualizadas es importante para la seguridad y el rendimiento.
* **Ejecución de pruebas automatizadas**: Ejecutar pruebas regularmente (ej. cada noche) te permite detectar problemas antes de que afecten a los usuarios.
* **Recopilación de métricas de rendimiento**: Monitorizar el rendimiento de tu aplicación en producción te ayuda a identificar problemas y optimizarla.

Para estas tareas, no quieres depender de que alguien recuerde ejecutarlas manualmente. Necesitas un sistema que las ejecute automáticamente, según un horario predefinido.
''',
    'code_example': r'''
// No hay una forma "nativa" de Angular de configurar tareas recurrentes.
// Necesitas herramientas externas.

// 1. Tareas programadas en el servidor (para tareas del backend):
//   - **Cron (Linux/Unix)**: Es el estándar para tareas programadas.
//     Puedes editar el archivo crontab con `crontab -e` y añadir entradas como:
//     `0 2 * * * node scripts/backup-database.js > /var/log/backup.log 2>&1`
//     (Esto ejecuta el script `backup-database.js` a las 2:00 AM todos los días)
//   - **Task Scheduler (Windows)**: El equivalente a Cron en Windows.
//     Puedes configurarlo a través de la interfaz gráfica o con comandos.

// 2. Tareas programadas en el cliente (para tareas del frontend, *con limitaciones*):
//   - **setInterval() en JavaScript**: Puedes ejecutar código cada cierto intervalo.
//     Sin embargo, esto solo funciona mientras la página está abierta.
//     Ejemplo:
/*
    setInterval(() => {
      console.log('Ejecutando tarea recurrente en el cliente...');
      // Hacer algo (ej. actualizar datos, enviar métricas)
    }, 60000); // Ejecutar cada minuto
*/
//   - **Web Workers**: Permiten ejecutar JavaScript en segundo plano, incluso
//     si el usuario cambia de pestaña. Sin embargo, también tienen limitaciones
//     (no acceso directo al DOM).

// 3. Servicios de terceros:
//   - **Cron jobs as a service**: Hay servicios en la nube que te permiten
//     programar tareas (ej. EasyCron, Cronitor).
//   - **Servicios de monitoreo**: Algunos servicios (ej. UptimeRobot) no solo
//     verifican si tu sitio está activo, sino que también pueden ejecutar
//     tareas periódicas.

// Ejemplo de un script Node.js para hacer un backup de la base de datos (scripts/backup-database.js)
const fs = require('fs');
const { execSync } = require('child_process'); // Para ejecutar comandos del sistema

const backupDir = '/var/backups'; // Ajusta esto
const dbName = 'mi_base_de_datos'; // Ajusta esto
const backupFile = `${backupDir}/${dbName}_${new Date().toISOString()}.sql`;

try {
  // Ejecutar el comando `mysqldump` para hacer el backup
  execSync(`mysqldump ${dbName} > ${backupFile}`);
  console.log(`Backup de la base de datos "${dbName}" creado en: ${backupFile}`);

  // Opcional: comprimir el backup
  execSync(`gzip ${backupFile}`);
  console.log(`Backup comprimido.`);
} catch (error) {
  console.error('Error al hacer el backup:', error.message);
}

/*
Para configurar tareas recurrentes:
1. Identifica las tareas que necesitas automatizar (backups, limpieza de logs, etc.).
2. Elige una herramienta (Cron, Task Scheduler, setInterval, etc.).
3. Escribe el código o los comandos para ejecutar la tarea.
4. Configura la herramienta para ejecutar la tarea a intervalos regulares.
5. Asegúrate de que la herramienta tenga los permisos necesarios para ejecutar la tarea.
6. Monitoriza la ejecución de las tareas y maneja los posibles errores.

Un error común es no tener en cuenta la zona horaria. Cron y Task Scheduler usan la zona horaria
del servidor. Si tu servidor está en una zona horaria diferente a la de tus usuarios,
ajusta los horarios de las tareas en consecuencia.

Otro error es no manejar los errores. Si una tarea falla (ej. un backup), necesitas
recibir una notificación (ej. por correo electrónico) para poder solucionarlo.
*/
'''
  });
}
