import 'package:sqflite_common/sqlite_api.dart';

Future<void> insertReactJrLevel1Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción y Configuración',
    'topic': 'Configuración del Entorno',
    'subtopic': 'Instalación de Node.js y npm',
    'definition': '''
Si estás dando tus primeros pasos en el desarrollo web con React, la instalación de Node.js y npm es el punto de partida fundamental. Son como los cimientos sobre los que construirás tu aplicación. Sin ellos, simplemente no podrías ejecutar las herramientas necesarias para desarrollar.

¿Te estás preguntando por qué esto importa? 

Pues bien, Node.js es un entorno de ejecución de JavaScript que permite a este lenguaje, que normalmente corre en el navegador, funcionar en tu computadora. Esto es crucial porque muchas de las herramientas y librerías de React están escritas en JavaScript y necesitan un lugar para ejecutarse fuera del navegador. npm, por su parte, es el gestor de paquetes oficial de Node.js. Piensa en npm como una enorme biblioteca donde puedes encontrar y descargar un montón de "libros" (paquetes de código) que otros desarrolladores han creado y compartido. Estos paquetes facilitan enormemente el desarrollo, ya que no tienes que escribir todo desde cero. Por ejemplo, cuando usas Create React App o Vite, npm se encarga de descargar todas las dependencias que esos proyectos necesitan para funcionar. Es una herramienta indispensable para manejar las dependencias de tu proyecto, asegurando que todo esté en su lugar y que las versiones de las librerías sean compatibles entre sí. Es como el director de orquesta que se asegura de que todos los músicos tengan sus partituras y estén listos para tocar en armonía.
''',
    'code_example': '''
// Para verificar si Node.js y npm están instalados, abre tu terminal y ejecuta:
// Esto debería mostrar la versión de Node.js
node -v 

// Esto debería mostrar la versión de npm
npm -v

// Si no están instalados, puedes descargarlos desde la página oficial de Node.js.
// Una vez instalados, puedes inicializar un nuevo proyecto de Node.js con npm:
// Esto creará un archivo package.json en tu directorio actual
npm init -y

// Para instalar un paquete (por ejemplo, Express para un backend sencillo):
npm install express

// Para ejecutar un script definido en tu package.json:
// Suponiendo que tienes un script llamado "start": "node index.js"
npm start
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción y Configuración',
    'topic': 'Configuración del Entorno',
    'subtopic': 'Uso de Create React App (CRA) y Vite para iniciar proyectos',
    'definition': '''
Iniciar un proyecto React puede parecer abrumador al principio, pero herramientas como Create React App (CRA) y Vite simplifican enormemente este proceso. Son como las "llaves en mano" que te permiten empezar a codificar tu aplicación sin tener que preocuparte por toda la configuración inicial.

Seguramente pensarás de qué va todo esto... 

En pocas palabras, tanto CRA como Vite son "bundlers" o empaquetadores de módulos que vienen con configuraciones preestablecidas para que puedas crear aplicaciones de React rápidamente. CRA fue durante mucho tiempo la opción por defecto y aún es muy usada. Te da una configuración robusta y lista para producción, incluyendo herramientas como Webpack y Babel bajo el capó, que se encargan de transformar tu código React moderno en algo que los navegadores puedan entender. Es excelente para principiantes porque abstrae la complejidad de la configuración de build. Por otro lado, Vite es una alternativa más reciente que ha ganado mucha popularidad por su velocidad. A diferencia de CRA, Vite utiliza un enfoque diferente para el servidor de desarrollo y el empaquetado, lo que resulta en tiempos de inicio mucho más rápidos y recargas instantáneas. Para proyectos pequeños o medianos, Vite es una excelente opción si buscas una experiencia de desarrollo ágil y rápida. La elección entre uno y otro a menudo depende del tamaño del proyecto, el equipo de desarrollo y las preferencias personales. Ambos hacen un gran trabajo al configurar todo lo necesario para que puedas centrarte en escribir el código de tu aplicación React.
''',
    'code_example': '''
// Para iniciar un proyecto con Create React App:
// Asegúrate de tener Node.js y npm instalados.
npx create-react-app mi-app-cra
cd mi-app-cra
npm start

// Para iniciar un proyecto con Vite:
// Asegúrate de tener Node.js y npm instalados.
npm create vite@latest mi-app-vite -- --template react
cd mi-app-vite
npm install
npm run dev

// Ejemplo incorrecto (intentar crear un proyecto sin las herramientas necesarias):
// Esto fallaría si no tienes npx o npm instalados globalmente
// create-react-app mi-app // Sin npx
// vite mi-app // Sin npm create
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción y Configuración',
    'topic': 'Configuración del Entorno',
    'subtopic': 'Estructura básica de un proyecto React',
    'definition': '''
Cuando creas tu primer proyecto React, ya sea con Create React App o Vite, te encontrarás con una estructura de carpetas y archivos bastante estándar. Entender esta organización es clave para saber dónde poner tu código y cómo se relacionan las diferentes partes de tu aplicación. Es como conocer el mapa de una ciudad antes de empezar a explorarla.

No sé tú, pero a mí esto al principio me costó un poco entender qué archivo iba dónde. A grandes rasgos, en la raíz de tu proyecto, verás archivos como `package.json`, que contiene información sobre tu proyecto y sus dependencias, y `.gitignore`, que le dice a Git qué archivos ignorar. La carpeta `node_modules/` es donde npm guarda todas las librerías que tu proyecto necesita, y generalmente no la tocas directamente. La magia de tu aplicación React suele residir en la carpeta `src/`. Dentro de `src/`, encontrarás `index.js` (o `main.jsx` en Vite), que es el punto de entrada principal de tu aplicación, donde se renderiza el componente raíz de React en el DOM. También verás `App.js` (o `App.jsx`), que es el componente principal de tu aplicación, y a menudo el lugar donde empiezas a organizar tus otros componentes. Es común crear subcarpetas dentro de `src/` para organizar tus componentes (por ejemplo, `components/`, `pages/`, `assets/`, `utils/`), lo que ayuda a mantener el código limpio y modular a medida que tu proyecto crece. Una buena estructura facilita la colaboración en equipo y el mantenimiento a largo plazo.
''',
    'code_example': '''
// Estructura típica de un proyecto React (simplificado):

mi-app/
├── node_modules/ // Dependencias instaladas por npm
├── public/       // Archivos estáticos (como index.html, favicon.ico)
│   └── index.html // El archivo HTML principal de tu aplicación
├── src/          // Aquí va todo tu código fuente de React
│   ├── App.css
│   ├── App.js      // El componente principal de tu aplicación
│   ├── App.test.js // Archivos de prueba
│   ├── index.css
│   ├── index.js    // Punto de entrada de la aplicación
│   └── reportWebVitals.js // Para medir el rendimiento (opcional)
├── .gitignore    // Archivos y carpetas a ignorar por Git
├── package.json  // Metadatos del proyecto y dependencias
├── package-lock.json // Versiones exactas de las dependencias
└── README.md     // Información del proyecto

// Ejemplo de App.js básico:
import React from 'react';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <h1>¡Hola, React!</h1>
        <p>Mi primera aplicación.</p>
      </header>
    </div>
  );
}

export default App;
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción y Configuración',
    'topic': 'JSX y Renderizado',
    'subtopic': 'Sintaxis de JSX',
    'definition': '''
JSX, que significa JavaScript XML, es una extensión de sintaxis que te permite escribir código parecido a HTML directamente dentro de tus archivos JavaScript. Es la forma en que React te permite describir la interfaz de usuario de tu aplicación. Piensa en ello como una manera de fusionar la lógica de JavaScript con la estructura de la interfaz, lo que hace que tu código sea más intuitivo y fácil de entender.

Seguramente pensarás de qué va todo esto... 

La idea principal de JSX es que te permite definir cómo se ve tu UI utilizando una sintaxis que es muy familiar si ya conoces HTML. En lugar de usar complejas llamadas a funciones para crear elementos en el DOM, puedes escribir `<div className="mi-clase">Hola, mundo</div>` y React se encargará de traducirlo a lo que el navegador necesita. Una peculiaridad importante es el uso de `className` en lugar de `class` para las clases CSS, debido a que `class` es una palabra reservada en JavaScript. También verás que los atributos HTML como `for` se convierten en `htmlFor`. Otra cosa a tener en cuenta es que JSX requiere que los elementos estén siempre cerrados, ya sea con una etiqueta de cierre como `</div>` o con una barra inclinada al final para elementos vacíos como `<img src="..." />`. La magia de JSX radica en que, aunque parezca HTML, en realidad es JavaScript detrás de escena, lo que te permite incrustar expresiones JavaScript directamente dentro de tus etiquetas, lo que nos lleva a los siguientes subtemas.
''',
    'code_example': r'''
// Ejemplo básico de JSX
import React from 'react';

function App() {
  return (
    <div className="container"> {/* className en lugar de class */}
      <h1>¡Hola desde JSX!</h1>
      <p>Esto es un párrafo.</p>
      <img src="logo.png" alt="Logo" /> {/* Elementos vacíos auto-cerrados */}
    </div>
  );
}

export default App;

// Ejemplo incorrecto de JSX (etiqueta sin cerrar)
// function IncorrectApp() {
//   return (
//     <div>
//       <span>Este span no está cerrado
//     </div>
//   );
// }

// Ejemplo incorrecto de JSX (usando 'class' en lugar de 'className')
// function AnotherIncorrectApp() {
//   return (
//     <div class="my-div"> {/* 'class' es una palabra reservada en JS */}
//       Contenido
//     </div>
//   );
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción y Configuración',
    'topic': 'JSX y Renderizado',
    'subtopic': 'Renderizado de elementos y componentes',
    'definition': '''
El renderizado en React es el proceso por el cual React toma tus elementos y componentes JSX y los transforma en lo que el usuario ve en el navegador. Es el corazón de cómo React actualiza la interfaz de usuario de manera eficiente.

Vamos a ver de qué se trata todo esto... 

Para que un elemento o componente React aparezca en la pantalla, necesitas "renderizarlo" en el DOM (Document Object Model). El DOM es la representación estructurada de tu página web, y React se encarga de manipularlo por ti. Históricamente, en aplicaciones React, se utilizaba `ReactDOM.render()` para renderizar el componente principal de tu aplicación en un elemento HTML específico (usualmente un `<div>` con un ID como 'root') en tu archivo `index.html`. Con las versiones más recientes de React, se utiliza `ReactDOM.createRoot()` y `root.render()`, lo que ofrece mejoras de rendimiento y la capacidad de manejar características concurrentes. Lo importante es que, una vez que le indicas a React dónde y qué renderizar, él se encarga del resto. Cuando el estado o las props de un componente cambian, React realiza un proceso llamado "reconciliación". En lugar de actualizar todo el DOM, crea un "árbol virtual" de la UI y lo compara con el árbol anterior. Solo actualiza los nodos del DOM que realmente han cambiado, lo que lo hace increíblemente rápido y eficiente. Esta es una de las razones por las que React es tan popular en el desarrollo de aplicaciones de una sola página (SPA) donde las actualizaciones de la UI son constantes.
''',
    'code_example': '''
// En public/index.html, usualmente tienes un div como este:
// <div id="root"></div>

// En src/index.js (o main.jsx si usas Vite)

// Con React 18+ (recomendado)
import React from 'react';
import ReactDOM from 'react-dom/client'; // Importar de 'react-dom/client'
import App from './App'; // Tu componente principal

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);

// Con React < 18 (legado)
// import React from 'react';
// import ReactDOM from 'react-dom';
// import App from './App';

// ReactDOM.render(
//   <React.StrictMode>
//     <App />
//   </React.StrictMode>,
//   document.getElementById('root')
// );

// Ejemplo de un componente simple que se renderiza
function Saludo() {
  return <h1>¡Hola, soy un componente!</h1>;
}

// Puedes renderizarlo también así (en un archivo diferente si quisieras)
// root.render(<Saludo />);
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción y Configuración',
    'topic': 'JSX y Renderizado',
    'subtopic': 'Uso de expresiones en JSX',
    'definition': '''
Una de las características más potentes de JSX es la capacidad de incrustar expresiones de JavaScript directamente dentro de tu marcado HTML. Esto significa que puedes combinar la lógica dinámica con la estructura de tu interfaz de usuario de una manera muy fluida y legible.

Pensemos por un momento en lo útil que es esto... 

Con las expresiones en JSX, puedes hacer cosas como mostrar variables, realizar operaciones matemáticas, llamar a funciones, o incluso aplicar lógica condicional, todo dentro de tus etiquetas HTML. Para hacerlo, simplemente envuelves el código JavaScript que quieres evaluar entre llaves `{}`. Por ejemplo, si tienes una variable `nombre` con un valor, puedes mostrarlo directamente como `<h1>Hola, {nombre}</h1>`. Esto es increíblemente poderoso porque te permite crear interfaces de usuario dinámicas que responden a los datos y a la lógica de tu aplicación sin tener que manipular el DOM manualmente. Puedes usar el resultado de cualquier expresión JavaScript válida dentro de estas llaves, siempre y cuando el resultado sea un tipo de dato que React pueda renderizar (como cadenas de texto, números, elementos JSX, o arreglos de estos). Esto abre un mundo de posibilidades para construir interfaces interactivas y reactivas.
''',
    'code_example': r'''
// Ejemplo de uso de expresiones en JSX
import React from 'react';

function GatoComponent() {
  const nombreGato = "Bigotes";
  const edad = 3;
  const estaAdoptado = true;

  function obtenerEstadoAdopcion() {
    return estaAdoptado ? "adoptado" : "no adoptado";
  }

  const elementosLista = ['Jugar', 'Comer', 'Dormir'];

  return (
    <div>
      {/* Mostrar una variable */}
      <h2>Mi gato se llama {nombreGato}</h2>

      {/* Realizar una operación matemática */}
      <p>Su edad en años humanos es {edad * 7}.</p>

      {/* Llamar a una función */}
      <p>Este gato está {obtenerEstadoAdopcion()}.</p>

      {/* Lógica condicional (operador ternario) */}
      <p>Estado: {estaAdoptado ? '¡Feliz en su nuevo hogar!' : 'Buscando una familia.'}</p>

      {/* Renderizar una lista usando map */}
      <h3>Cosas favoritas de {nombreGato}:</h3>
      <ul>
        {elementosLista.map((item, index) => (
          <li key={index}>{item}</li>
        ))}
      </ul>

      {/* Expresión incorrecta (intentar usar sentencias como if/else directamente) */}
      {/*
      { if (estaAdoptado) {
          return <p>Adoptado</p>;
        } else {
          return <p>No adoptado</p>;
        }
      }
      */}
      {/* En su lugar, usa un operador ternario o una función */}
    </div>
  );
}

export default GatoComponent;
'''
  });
}

Future<void> insertReactJrLevel2Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Componentes y Props',
    'topic': 'Componentes Funcionales y de Clase',
    'subtopic': 'Creación de componentes funcionales',
    'definition': '''
Los componentes funcionales son la forma moderna y preferida de construir la interfaz de usuario en React. Son básicamente funciones de JavaScript que reciben un objeto de `props` (propiedades) como argumento y devuelven elementos de React que describen lo que se debe mostrar en la pantalla. 

¿Te estás preguntando por qué esto importa? 

Pues bien, la creación de componentes funcionales ha simplificado mucho el desarrollo en React, especialmente desde la introducción de los Hooks. Antes de los Hooks, los componentes funcionales eran conocidos como "componentes sin estado" porque no podían manejar su propio estado interno ni acceder a los métodos del ciclo de vida de React. Sin embargo, con Hooks como `useState` y `useEffect`, los componentes funcionales ahora pueden hacer todo lo que un componente de clase puede hacer, y a menudo de una manera más concisa y legible. Son más fáciles de leer y escribir, y su sintaxis es más limpia, lo que ayuda a que el código sea más mantenible. Además, suelen tener un mejor rendimiento en comparación con los componentes de clase en ciertos escenarios, aunque React realiza optimizaciones para ambos. Su simplicidad los hace ideales para la mayoría de las necesidades de tu aplicación, especialmente cuando estás empezando a aprender React. Son la base sobre la cual construirás la mayoría de tus interfaces de usuario en React.
''',
    'code_example': r'''
// Ejemplo de un componente funcional básico
import React from 'react';

function Saludo(props) {
  return <h1>Hola, {props.nombre}!</h1>;
}

// O usando desestructuración de props (más común y recomendado)
function Bienvenida({ nombre }) {
  return <p>¡Bienvenido/a, {nombre}!</p>;
}

// Para usar estos componentes:
function App() {
  return (
    <div>
      <Saludo nombre="Ana" />
      <Bienvenida nombre="Pedro" />
    </div>
  );
}

export default App;

// Ejemplo incorrecto (intentar usar 'this.props' en un componente funcional)
// function ComponenteIncorrecto() {
//   return <p>{this.props.valor}</p>; // Esto causaría un error
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Componentes y Props',
    'topic': 'Componentes Funcionales y de Clase',
    'subtopic': 'Introducción a componentes de clase',
    'definition': '''
Los componentes de clase fueron la forma principal de construir componentes en React antes de la llegada de los Hooks y los componentes funcionales con estado. Son clases de JavaScript que extienden de `React.Component` y tienen la capacidad de manejar su propio estado interno y métodos de ciclo de vida. 

No sé tú, pero a mí esto al principio me costó un poco entender la diferencia. Los componentes de clase son "clases" en el sentido de la programación orientada a objetos. Esto significa que tienen un constructor, métodos (como `render()`, que es el único método obligatorio y devuelve el JSX) y propiedades (como `this.props` y `this.state`).  Son útiles cuando necesitas funcionalidades específicas del ciclo de vida que aún no tienen un equivalente directo en Hooks (aunque esto es cada vez menos común) o si estás trabajando con bases de código más antiguas que los utilizan extensamente. Por ejemplo, el método `componentDidMount()` en un componente de clase se ejecuta justo después de que el componente se ha montado en el DOM, siendo un lugar ideal para realizar peticiones de datos. Aunque los componentes funcionales con Hooks son ahora la opción preferida para la mayoría de los casos, es crucial entender los componentes de clase porque te los encontrarás en proyectos existentes y son fundamentales para comprender cómo ha evolucionado React.
''',
    'code_example': r'''
// Ejemplo de un componente de clase básico
import React from 'react';

class Contador extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      conteo: 0
    };
  }

  // Método para actualizar el estado
  incrementar = () => {
    this.setState({ conteo: this.state.conteo + 1 });
  };

  render() { // El método render es obligatorio en componentes de clase
    return (
      <div>
        <h1>Conteo: {this.state.conteo}</h1>
        <button onClick={this.incrementar}>Incrementar</button>
      </div>
    );
  }
}

export default Contador;

// Ejemplo incorrecto (olvidar llamar super(props) en el constructor)
// class ComponenteSinSuper extends React.Component {
//   constructor(props) {
//     // this.props no estaría definido si no se llama super(props)
//     this.state = { data: props.initialData }; // Esto causaría un error
//   }
//   render() { return <p>Hola</p>; }
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Componentes y Props',
    'topic': 'Componentes Funcionales y de Clase',
    'subtopic': 'Diferencias y casos de uso',
    'definition': '''
Entender las diferencias entre los componentes funcionales y los componentes de clase es fundamental para saber cuándo usar cada uno en tu aplicación React. Aunque los componentes funcionales con Hooks son la tendencia actual, ambos siguen siendo válidos y tienen sus particularidades. 

¿Te estás preguntando por qué esto importa?

La principal diferencia histórica era que los componentes de clase podían manejar estado interno y acceder a métodos de ciclo de vida (como `componentDidMount`, `componentDidUpdate`, `componentWillUnmount`), mientras que los funcionales no.  Sin embargo, con la introducción de Hooks como `useState` y `useEffect`, los componentes funcionales ahora pueden hacer lo mismo. Los componentes funcionales suelen ser más concisos y fáciles de leer, lo que reduce la cantidad de código repetitivo y mejora la mantenibilidad. Son ideales para la mayoría de los casos de uso, desde componentes de presentación simples hasta contenedores con lógica compleja. Por otro lado, los componentes de clase todavía se encuentran en bases de código heredadas y pueden ser útiles si necesitas usar `getSnapshotBeforeUpdate` o `componentDidCatch` (para manejo de errores a nivel de componente), aunque incluso para estos casos existen alternativas con Hooks o librerías específicas. En resumen, si estás empezando un proyecto nuevo o añadiendo nuevas características, la recomendación general es optar por componentes funcionales con Hooks debido a su simplicidad, legibilidad y el enfoque moderno de React.
''',
    'code_example': r'''
// Componente Funcional (preferido para nuevos desarrollos)
import React, { useState, useEffect } from 'react';

function TemporizadorFuncional() {
  const [segundos, setSegundos] = useState(0);

  // useEffect simula componentDidMount y componentDidUpdate
  useEffect(() => {
    const intervalo = setInterval(() => {
      setSegundos(prevSegundos => prevSegundos + 1);
    }, 1000);

    // Retorno de useEffect simula componentWillUnmount (limpieza)
    return () => clearInterval(intervalo);
  }, []); // El array vacío significa que se ejecuta solo una vez al montar

  return (
    <h2>Tiempo transcurrido: {segundos} segundos (Funcional)</h2>
  );
}

// Componente de Clase (aún presente en código legado)
import React, { Component } from 'react';

class TemporizadorClase extends Component {
  constructor(props) {
    super(props);
    this.state = {
      segundos: 0
    };
  }

  // componentDidMount se ejecuta después de que el componente se monta
  componentDidMount() {
    this.intervalo = setInterval(() => {
      this.setState(prevState => ({
        segundos: prevState.segundos + 1
      }));
    }, 1000);
  }

  // componentWillUnmount se ejecuta antes de que el componente sea removido
  componentWillUnmount() {
    clearInterval(this.intervalo);
  }

  render() {
    return (
      <h2>Tiempo transcurrido: {this.state.segundos} segundos (Clase)</h2>
    );
  }
}

// Uso en App.js
function App() {
  return (
    <div>
      <TemporizadorFuncional />
      <TemporizadorClase />
    </div>
  );
}

export default App;
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Componentes y Props',
    'topic': 'Props y Comunicación entre Componentes',
    'subtopic': 'Paso de props a componentes hijos',
    'definition': '''
El paso de `props` (abreviatura de "properties" o propiedades) a componentes hijos es el mecanismo fundamental en React para pasar datos de un componente padre a un componente hijo. Es la forma principal de que los componentes se comuniquen entre sí, siguiendo un flujo de datos unidireccional, es decir, de arriba hacia abajo.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una aplicación React como un árbol de componentes. El componente raíz sería el tronco, y los demás componentes serían las ramas y las hojas. Para que una hoja obtenga información del tronco, el tronco debe pasarle esa información. Así funcionan las `props`. Cuando defines un componente en JSX, puedes pasarle atributos personalizados, que React internamente recolecta en un objeto `props`. Este objeto estará disponible dentro del componente hijo. Por ejemplo, si tienes un componente `TarjetaProducto` y quieres que muestre el nombre y el precio de un producto, le pasarías `nombre="Camiseta"` y `precio={25.99}` como props. Dentro de `TarjetaProducto`, accederías a estos valores a través de `props.nombre` y `props.precio`. Esta unidireccionalidad del flujo de datos es una de las características clave de React que facilita la depuración y hace que el estado de tu aplicación sea más predecible. Si los datos solo fluyen en una dirección, es mucho más fácil rastrear de dónde provienen los cambios.
''',
    'code_example': r'''
// Componente Padre
import React from 'react';
import ComponenteHijo from './ComponenteHijo'; // Asegúrate de crear este archivo

function ComponentePadre() {
  const nombreUsuario = "Alice";
  const edadUsuario = 30;

  return (
    <div>
      <h1>Componente Padre</h1>
      {/* Pasando props al ComponenteHijo */}
      <ComponenteHijo nombre={nombreUsuario} edad={edadUsuario} />
      <ComponenteHijo nombre="Bob" edad={25} />
    </div>
  );
}

export default ComponentePadre;

// Componente Hijo (ComponenteHijo.js)
import React from 'react';

function ComponenteHijo(props) {
  // Accediendo a las props
  return (
    <div style={{ border: '1px solid gray', padding: '10px', margin: '10px' }}>
      <h3>Hola desde el Componente Hijo</h3>
      <p>Mi nombre es: {props.nombre}</p>
      <p>Mi edad es: {props.edad} años.</p>
    </div>
  );
}

// O usando desestructuración de props (más común)
// function ComponenteHijo({ nombre, edad }) {
//   return (
//     <div style={{ border: '1px solid gray', padding: '10px', margin: '10px' }}>
//       <h3>Hola desde el Componente Hijo (desestructurado)</h3>
//       <p>Mi nombre es: {nombre}</p>
//       <p>Mi edad es: {edad} años.</p>
//     </div>
//   );
// }

// export default ComponenteHijo;

// Ejemplo incorrecto (intentar modificar las props directamente en el hijo)
// function ComponenteHijoIncorrecto({ nombre }) {
//   nombre = "Nuevo Nombre"; // ¡Esto no está permitido! Las props son de solo lectura.
//   return <p>{nombre}</p>;
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Componentes y Props',
    'topic': 'Props y Comunicación entre Componentes',
    'subtopic': 'Validación de props con PropTypes',
    'definition': '''
Validar las `props` con PropTypes es una práctica recomendada en React que te ayuda a asegurar que los componentes reciban los tipos de datos esperados. Es como tener un control de calidad para los datos que entran a tus componentes.

¿Te estás preguntando por qué esto importa? 

En proyectos grandes o cuando trabajas en equipo, es fácil que un componente reciba un tipo de dato incorrecto como `prop`, lo que puede llevar a errores difíciles de depurar en tiempo de ejecución. PropTypes te permite especificar los tipos de datos esperados (como `string`, `number`, `boolean`, `array`, `object`, o incluso un `func` para funciones) y si son obligatorios (`isRequired`). Si un componente recibe una `prop` que no coincide con el tipo o si falta una `prop` obligatoria, React emitirá una advertencia en la consola del navegador. Esto no detiene la aplicación, pero te alerta sobre posibles problemas antes de que se conviertan en errores mayores. Aunque TypeScript ha ganado mucha popularidad y ofrece validación de tipos en tiempo de compilación, PropTypes sigue siendo una excelente opción para proyectos JavaScript puros o para añadir una capa extra de robustez al desarrollo. Es una herramienta sencilla pero muy efectiva para mantener la coherencia y la calidad de tu código.
''',
    'code_example': r'''
// Instala PropTypes: npm install prop-types

import React from 'react';
import PropTypes from 'prop-types'; // Importar PropTypes

function PerfilUsuario({ nombre, edad, esActivo, etiquetas }) {
  return (
    <div style={{ border: '1px dashed #ccc', padding: '15px', margin: '15px' }}>
      <h2>{nombre}</h2>
      <p>Edad: {edad}</p>
      <p>Estado: {esActivo ? 'Activo' : 'Inactivo'}</p>
      <p>Etiquetas: {etiquetas.join(', ')}</p>
    </div>
  );
}

// Definición de PropTypes para el componente PerfilUsuario
PerfilUsuario.propTypes = {
  nombre: PropTypes.string.isRequired, // 'nombre' debe ser un string y es obligatorio
  edad: PropTypes.number,             // 'edad' debe ser un número (opcional)
  esActivo: PropTypes.bool.isRequired,  // 'esActivo' debe ser un booleano y es obligatorio
  etiquetas: PropTypes.arrayOf(PropTypes.string), // 'etiquetas' debe ser un array de strings (opcional)
};

// Establecer valores por defecto para props (opcional, pero buena práctica)
PerfilUsuario.defaultProps = {
  edad: 18,
  etiquetas: ['general'],
};

// Uso en App.js
function App() {
  return (
    <div>
      <PerfilUsuario nombre="Carlos" esActivo={true} edad={28} etiquetas={['developer', 'frontend']} />
      <PerfilUsuario nombre="Maria" esActivo={false} /> {/* 'edad' y 'etiquetas' usarán valores por defecto */}
      {/* Esto generaría una advertencia en consola porque 'esActivo' es obligatorio y falta: */}
      {/* <PerfilUsuario nombre="Juan" /> */}
      {/* Esto también generaría una advertencia (tipo incorrecto para edad): */}
      {/* <PerfilUsuario nombre="Ana" esActivo={true} edad="veinte" /> */}
    </div>
  );
  }

export default App;
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Componentes y Props',
    'topic': 'Props y Comunicación entre Componentes',
    'subtopic': 'Comunicación entre componentes',
    'definition': '''
La comunicación entre componentes en React se refiere a cómo los diferentes componentes de tu aplicación comparten información y se interactúan. Aunque el paso de `props` de padre a hijo es el método más directo, existen otras estrategias para situaciones más complejas.

Vamos a ver de qué se trata todo esto... 

Ya sabes que los datos fluyen de padre a hijo a través de `props`. Pero, ¿qué pasa si un componente hijo necesita "hablar" con su padre, o si dos componentes hermanos necesitan compartir información? Aquí es donde entran en juego otros patrones. Para que un hijo se comunique con su padre, el padre puede pasarle una función como `prop`. El hijo luego puede llamar a esa función, pasando argumentos que el padre puede usar para actualizar su propio estado o realizar alguna acción. Esto se conoce comúnmente como "levantamiento de estado" (lifting state up). Para la comunicación entre componentes que no tienen una relación directa (por ejemplo, hermanos que no comparten un padre común inmediato o componentes muy distantes en el árbol), se pueden usar soluciones como el Context API de React o librerías de manejo de estado global como Redux. Estas soluciones proporcionan una forma de compartir datos a través de toda la aplicación sin tener que pasar `props` manualmente a través de muchos niveles de componentes, lo que a veces se conoce como "prop drilling". Entender estos mecanismos es clave para construir aplicaciones React robustas y bien estructuradas, ya que te permiten manejar el flujo de datos de manera eficiente y escalable.
''',
    'code_example': r'''
// Comunicación de Hijo a Padre (Levantamiento de Estado)

// Componente Hijo: BotonIncrementar.js
import React from 'react';

function BotonIncrementar({ onIncrementar }) {
  return (
    <button onClick={onIncrementar}>
      Incrementar Contador
    </button>
  );
}

export default BotonIncrementar;

// Componente Padre: ContadorPadre.js
import React, { useState } from 'react';
import BotonIncrementar from './BotonIncrementar';

function ContadorPadre() {
  const [conteo, setConteo] = useState(0);

  const manejarIncremento = () => {
    setConteo(conteo + 1);
  };

  return (
    <div style={{ border: '2px solid green', padding: '20px', margin: '20px' }}>
      <h2>Contador del Padre: {conteo}</h2>
      {/* Pasamos la función manejarIncremento como una prop al hijo */}
      <BotonIncrementar onIncrementar={manejarIncremento} />
      <p>El hijo está enviando una señal al padre para actualizar el contador.</p>
    </div>
  );
}

// Comunicación entre Componentes Hermanos (a través de un padre común)

// Componente Hermano 1: DisplayConteo.js
import React from 'react';

function DisplayConteo({ valor }) {
  return (
    <div style={{ border: '1px solid blue', padding: '10px', margin: '5px' }}>
      <h3>Display del Conteo: {valor}</h3>
    </div>
  );
}

export default DisplayConteo;

// Componente Hermano 2: ControlConteo.js
import React from 'react';

function ControlConteo({ onCambio }) {
  const handleRestar = () => onCambio(-1);
  const handleSumar = () => onCambio(1);

  return (
    <div style={{ border: '1px solid red', padding: '10px', margin: '5px' }}>
      <button onClick={handleRestar}>Restar</button>
      <button onClick={handleSumar}>Sumar</button>
    </div>
  );
}

export default ControlConteo;

// Componente Padre Común para hermanos: App.js (o un componente superior)
function App() {
  const [valorHermano, setValorHermano] = useState(0);

  const manejarCambioHermano = (cambio) => {
    setValorHermano(prevValor => prevValor + cambio);
  };

  return (
    <div>
      <ContadorPadre /> {/* Ejemplo de Hijo a Padre */}

      <hr />

      <h2>Comunicación entre Hermanos (via Padre)</h2>
      <DisplayConteo valor={valorHermano} />
      <ControlConteo onCambio={manejarCambioHermano} />
    </div>
  );
}

export default App;
'''
  });
}

Future<void> insertReactJrLevel3Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Estado y Eventos',
    'topic': 'Manejo de Estado',
    'subtopic': 'Uso de useState para gestionar el estado local',
    'definition': '''
El `estado` en React es como la "memoria" de un componente, la información que puede cambiar con el tiempo y que React usa para decidir cuándo y cómo actualizar la interfaz de usuario. El Hook `useState` es la herramienta fundamental para añadir esta capacidad de "memoria" a tus componentes funcionales.

¿Te estás preguntando por qué esto importa? 

Antes de `useState`, solo los componentes de clase podían manejar su propio estado interno, lo que a menudo llevaba a componentes más complejos y verbosos. `useState` vino a simplificar esto, permitiendo que cualquier componente funcional tenga su propio estado reactivo. Cuando llamas a `useState`, le pasas el valor inicial de tu estado (por ejemplo, un número, un string, un booleano, o un objeto), y te devuelve un array con dos cosas: el valor actual de tu estado y una función para actualizarlo. Es crucial entender que cuando usas la función de actualización (la segunda cosa del array), React sabe que algo cambió y que necesita volver a renderizar el componente con el nuevo valor. Esto es lo que hace que tu interfaz de usuario sea interactiva y responda a las acciones del usuario o a los cambios de datos. La magia de `useState` radica en su simplicidad y en cómo permite que tus componentes "recuerden" cosas importantes para su funcionamiento sin la complejidad de las clases.
''',
    'code_example': r'''
// Ejemplo básico de useState
import React, { useState } from 'react';

function Contador() {
  // Declaramos una variable de estado 'conteo' y una función 'setConteo' para actualizarla.
  // El valor inicial es 0.
  const [conteo, setConteo] = useState(0);

  const incrementar = () => {
    // Usamos setConteo para actualizar el valor de 'conteo'.
    // Esto hará que el componente se re-renderice con el nuevo valor.
    setConteo(conteo + 1);
  };

  const decrementar = () => {
    setConteo(conteo - 1);
  };

  return (
    <div>
      <p>Contador: {conteo}</p>
      <button onClick={incrementar}>Sumar</button>
      <button onClick={decrementar}>Restar</button>
    </div>
  );
}

export default Contador;

// Ejemplo de estado con un booleano
function BotonAlternar() {
  const [estaEncendido, setEstaEncendido] = useState(false);

  const alternar = () => {
    setEstaEncendido(!estaEncendido);
  };

  return (
    <div>
      <p>La luz está: {estaEncendido ? 'Encendida' : 'Apagada'}</p>
      <button onClick={alternar}>Alternar Luz</button>
    </div>
  );
}

// Ejemplo de estado con un string
function CampoTexto() {
  const [texto, setTexto] = useState('');

  const manejarCambio = (evento) => {
    setTexto(evento.target.value);
  };

  return (
    <div>
      <input type="text" value={texto} onChange={manejarCambio} />
      <p>Estás escribiendo: {texto}</p>
    </div>
  );
}

// Uso en App.js
function App() {
  return (
    <div>
      <Contador />
      <hr />
      <BotonAlternar />
      <hr />
      <CampoTexto />
    </div>
  );
}
export default App;

// Ejemplo incorrecto (intentar modificar el estado directamente sin la función set)
// function Incorrecto() {
//   let [valor, setValor] = useState(0);
//   valor = 1; // Esto no hará que el componente se re-renderice
//   return <p>{valor}</p>;
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Estado y Eventos',
    'topic': 'Manejo de Estado',
    'subtopic': 'Actualización y lectura del estado',
    'definition': '''
Actualizar y leer el estado en React son operaciones que van de la mano. Cuando utilizas `useState`, recibes el valor actual del estado y una función dedicada para cambiar ese valor. La forma en que manejas estas operaciones es crucial para la reactividad de tu aplicación.

No sé tú, pero a mí esto al principio me costó entender que no podía simplemente `modificar` el estado como una variable normal. Para leer el estado, simplemente accedes a la primera variable que te devuelve `useState`. Por ejemplo, si tienes `const [cuenta, setCuenta] = useState(0);`, el valor actual es `cuenta`. Para actualizar el estado, **siempre** debes usar la función `setCuenta` (o el nombre que le hayas dado a la función de actualización). Es importante que nunca modifiques el estado directamente, como `cuenta = 10;`, porque React no se dará cuenta del cambio y tu componente no se re-renderizará. Cuando llamas a la función de actualización, puedes pasarle el nuevo valor directamente (`setCuenta(cuenta + 1)`), o, si el nuevo estado depende del estado anterior, puedes pasar una función al `setter` (`setCuenta(prevCuenta => prevCuenta + 1)`). Esta última forma es la más segura cuando las actualizaciones son asíncronas o si hay múltiples actualizaciones que podrían superponerse, ya que React garantiza que `prevCuenta` será el estado más reciente. Entender esto es la clave para que tus componentes reaccionen correctamente a los cambios y mantengan una interfaz de usuario consistente.
''',
    'code_example': r'''
// Ejemplo de actualización y lectura del estado
import React, { useState } from 'react';

function TareaApp() {
  const [tareas, setTareas] = useState([]); // Estado inicial: un array vacío de tareas
  const [nuevaTarea, setNuevaTarea] = useState(''); // Estado para el input de la nueva tarea

  const agregarTarea = () => {
    if (nuevaTarea.trim() !== '') { // Validar que la tarea no esté vacía
      // Actualizar el estado usando una función para basarse en el estado previo
      setTareas(prevTareas => [...prevTareas, nuevaTarea]);
      setNuevaTarea(''); // Limpiar el input después de agregar la tarea
    }
  };

  const manejarCambioInput = (e) => {
    // Lectura del valor del input y actualización del estado de nuevaTarea
    setNuevaTarea(e.target.value);
  };

  const eliminarTarea = (indiceAEliminar) => {
    // Filtrar las tareas para eliminar la que coincida con el índice
    setTareas(prevTareas => prevTareas.filter((_, index) => index !== indiceAEliminar));
  };

  return (
    <div style={{ border: '2px dashed purple', padding: '20px', margin: '20px' }}>
      <h1>Lista de Tareas</h1>
      <input
        type="text"
        value={nuevaTarea} // Lectura del estado 'nuevaTarea'
        onChange={manejarCambioInput} // Actualización del estado al escribir
        placeholder="Añadir nueva tarea..."
      />
      <button onClick={agregarTarea}>Añadir</button>
      <ul>
        {/* Lectura del estado 'tareas' para renderizar la lista */}
        {tareas.map((tarea, index) => (
          <li key={index}>
            {tarea}
            <button onClick={() => eliminarTarea(index)} style={{ marginLeft: '10px' }}>
              X
            </button>
          </li>
        ))}
      </ul>
    </div>
  );
}

export default TareaApp;

// Ejemplo incorrecto de actualización (mutar el estado directamente)
// function IncorrectaActualizacion() {
//   const [numeros, setNumeros] = useState([1, 2, 3]);
//
//   const añadirNumeroIncorrecto = () => {
//     numeros.push(4); // ¡NO HACER ESTO! Esto muta el array directamente.
//     setNumeros(numeros); // React no detectará un cambio en la referencia del array
//   };
//
//   return (
//     <div>
//       <p>Números: {numeros.join(', ')}</p>
//       <button onClick={añadirNumeroIncorrecto}>Añadir (Incorrecto)</button>
//     </div>
//   );
// }

// Forma correcta de añadir un elemento a un array en el estado:
// setNumeros(prevNumeros => [...prevNumeros, 4]); // Crea un nuevo array
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Estado y Eventos',
    'topic': 'Manejo de Estado',
    'subtopic': 'Estado derivado y valores calculados',
    'definition': '''
El estado derivado, o valores calculados, se refiere a la información que no se almacena directamente en el estado de un componente, sino que se calcula a partir del estado existente o de las `props`. Es una práctica fundamental para mantener tu estado lo más conciso y eficiente posible.

Vamos a ver de qué se trata todo esto... 

Piensa en ello así: si tienes el precio unitario y la cantidad de un producto en el estado, el `precio total` no necesita ser parte del estado. Puedes calcularlo cada vez que el `precio unitario` o la `cantidad` cambien. Este `precio total` sería un estado derivado. La ventaja de esto es doble: primero, evitas la redundancia de datos. Si el precio total estuviera en el estado y también lo calcularas, tendrías dos fuentes de verdad, lo que podría llevar a inconsistencias. Segundo, simplifica la lógica de actualización. Solo necesitas preocuparte por actualizar el precio unitario y la cantidad; el precio total se actualizará automáticamente. Esto hace que tu código sea más predecible y menos propenso a errores. Siempre que un valor pueda ser computado a partir de otro estado o props, es una buena señal de que debería ser un estado derivado y no almacenado directamente. Es una de esas pequeñas optimizaciones que marcan una gran diferencia en la claridad y eficiencia de tu aplicación React.
''',
    'code_example': r'''
// Ejemplo de estado derivado
import React, { useState } from 'react';

function CalculadoraCompra() {
  const [precioUnitario, setPrecioUnitario] = useState(10); // Estado del precio unitario
  const [cantidad, setCantidad] = useState(1);         // Estado de la cantidad

  // Estado derivado: el precio total se calcula a partir de precioUnitario y cantidad
  const precioTotal = precioUnitario * cantidad;

  const manejarCambioPrecio = (e) => {
    setPrecioUnitario(Number(e.target.value)); // Convertir a número
  };

  const manejarCambioCantidad = (e) => {
    setCantidad(Number(e.target.value)); // Convertir a número
  };

  return (
    <div style={{ border: '2px solid orange', padding: '20px', margin: '20px' }}>
      <h1>Calculadora de Compra</h1>
      <div>
        <label>
          Precio Unitario:
          <input type="number" value={precioUnitario} onChange={manejarCambioPrecio} />
        </label>
      </div>
      <div>
        <label>
          Cantidad:
          <input type="number" value={cantidad} onChange={manejarCambioCantidad} />
        </label>
      </div>
      {/* Mostrando el estado derivado */}
      <h3>Precio Total: ${precioTotal.toFixed(2)}</h3>
      <p>Nota: El 'Precio Total' no es un estado, se calcula dinámicamente.</p>
    </div>
  );
}

export default CalculadoraCompra;

// Otro ejemplo de estado derivado: lista filtrada
function ListaTareasFiltrable() {
  const [tareas, setTareas] = useState([
    { id: 1, texto: 'Aprender React', completada: true },
    { id: 2, texto: 'Construir app', completada: false },
    { id: 3, texto: 'Desplegar proyecto', completada: false },
  ]);
  const [mostrarCompletadas, setMostrarCompletadas] = useState(true);

  // Estado derivado: tareas filtradas
  const tareasFiltradas = mostrarCompletadas
    ? tareas
    : tareas.filter(tarea => !tarea.completada);

  return (
    <div style={{ border: '1px dotted green', padding: '15px', margin: '15px' }}>
      <h2>Mis Tareas</h2>
      <label>
        <input
          type="checkbox"
          checked={mostrarCompletadas}
          onChange={() => setMostrarCompletadas(!mostrarCompletadas)}
        />
        Mostrar Tareas Completadas
      </label>
      <ul>
        {tareasFiltradas.map(tarea => (
          <li key={tarea.id} style={{ textDecoration: tarea.completada ? 'line-through' : 'none' }}>
            {tarea.texto}
          </li>
        ))}
      </ul>
    </div>
  );
}

// Uso en App.js
function App() {
  return (
    <div>
      <CalculadoraCompra />
      <hr />
      <ListaTareasFiltrable />
    </div>
  );
}
export default App;
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Estado y Eventos',
    'topic': 'Manejo de Eventos',
    'subtopic': 'Manejo de eventos del DOM en React',
    'definition': '''
El manejo de eventos en React es la forma en que tu aplicación responde a las interacciones del usuario, como clics de botón, entradas de texto, envíos de formularios, etc. React envuelve los eventos nativos del navegador en lo que llama "eventos sintéticos" para garantizar un comportamiento consistente en diferentes navegadores.

Seguramente pensarás de qué va todo esto... 

Cuando agregas un manejador de eventos en React, lo haces directamente en el JSX, de una manera muy similar a cómo lo harías con atributos HTML, pero con un par de diferencias clave. Primero, los nombres de los eventos se escriben en camelCase (por ejemplo, `onClick` en lugar de `onclick`). Segundo, le pasas una función como valor al atributo, no un string. Por ejemplo, en lugar de `<button onclick="miFuncion()">`, escribes `<button onClick={miFuncion}>`. Es importante entender que React no adjunta los oyentes de eventos directamente a los elementos DOM individuales; en su lugar, utiliza un sistema de delegación de eventos. Esto significa que los oyentes se adjuntan a un elemento padre (generalmente el `document` o el elemento raíz donde se renderiza tu app), y los eventos se propagan hasta él. Cuando un evento ocurre, React "sintetiza" el evento y lo pasa a tu función manejadora. Esto mejora el rendimiento y simplifica el manejo de eventos complejos.
''',
    'code_example': r'''
// Ejemplo de manejo de eventos del DOM en React
import React, { useState } from 'react';

function EventosBasicos() {
  const [mensaje, setMensaje] = useState('Haz clic en los botones');

  // Manejador para el evento 'click'
  const handleClick = () => {
    setMensaje('¡Botón clickeado!');
    console.log('Botón clickeado!');
  };

  // Manejador para el evento 'change' en un input
  const handleChange = (e) => {
    setMensaje(`Escribiendo: ${e.target.value}`);
    console.log('Valor del input:', e.target.value);
  };

  // Manejador para el evento 'mouseover'
  const handleMouseOver = () => {
    console.log('Mouse sobre el div!');
  };

  // Manejador para el evento 'submit' de un formulario
  const handleSubmit = (e) => {
    e.preventDefault(); // Previene el comportamiento por defecto de recargar la página
    setMensaje('Formulario enviado!');
    console.log('Formulario enviado. Contenido del input:', e.target.elements.miInput.value);
  };

  return (
    <div style={{ border: '2px solid blue', padding: '20px', margin: '20px' }}>
      <h2>Manejo de Eventos Básicos</h2>
      <p>{mensaje}</p>

      <button onClick={handleClick}>Clic Aquí</button>
      <br /><br />

      <input type="text" onChange={handleChange} placeholder="Escribe algo..." />
      <br /><br />

      <div
        onMouseOver={handleMouseOver}
        style={{ border: '1px solid gray', padding: '10px', display: 'inline-block' }}
      >
        Pasa el mouse por aquí
      </div>
      <br /><br />

      <form onSubmit={handleSubmit}>
        <input type="text" name="miInput" placeholder="Enviar formulario" />
        <button type="submit">Enviar Formulario</button>
      </form>
    </div>
  );
}

export default EventosBasicos;

// Ejemplo incorrecto (pasar una función como string, como en HTML nativo)
// function IncorrectoManejo() {
//   return (
//     <button onclick="console.log('No funciona así en React')">
//       Clic (Incorrecto)
//     </button>
//   );
// }

// Ejemplo incorrecto (olvidar envolver la función en JSX con llaves si no es una referencia)
// function OtroIncorrecto() {
//   return (
//     <button onClick="handleClick()"> {/* Esto también es incorrecto */}
//       Clic
//     </button>
//   );
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Estado y Eventos',
    'topic': 'Manejo de Eventos',
    'subtopic': 'Eventos personalizados',
    'definition': '''
Además de los eventos nativos del DOM que React abstrae (como `onClick`, `onChange`), a veces necesitarás crear y manejar tus propios "eventos personalizados" dentro de la lógica de tu aplicación. Esto no se refiere a eventos DOM creados por ti, sino a la forma en que los componentes se comunican entre sí a través de "callbacks" o funciones pasadas como `props`.

Pensemos por un momento en cómo esto difiere del manejo de eventos del DOM... 

Mientras que `onClick` responde a un clic real en el navegador, un "evento personalizado" en React se simula pasando una función del componente padre al hijo como una `prop`. Cuando ocurre una acción específica dentro del componente hijo (por ejemplo, un clic interno en un botón que el hijo gestiona), el hijo puede llamar a esa función `prop` que le pasó el padre. Esto permite que el componente padre reaccione a lo que sucede dentro del hijo y actualice su propio estado o realice otras acciones. Es el principal mecanismo de comunicación de hijo a padre en React, a menudo llamado "levantamiento de estado" (lifting state up). Por ejemplo, si tienes un componente `BotónConfirmar` que encapsula un botón HTML, el padre puede pasar una `prop` llamada `onConfirm` que es una función. Cuando el usuario hace clic en el botón dentro de `BotónConfirmar`, este componente hijo llamaría a `props.onConfirm()`, notificando al padre de que la confirmación ocurrió. Esto es crucial para mantener los datos fluyendo en una sola dirección y para que tus componentes sean reutilizables y modulares.
''',
    'code_example': r'''
// Componente Hijo: BotonContador.js
import React from 'react';

function BotonContador({ etiqueta, alClic }) {
  // 'alClic' es nuestro "evento personalizado" que es una función pasada por props.
  return (
    <button onClick={alClic}>
      {etiqueta}
    </button>
  );
}

export default BotonContador;

// Componente Padre: App.js
import React, { useState } from 'react';
import BotonContador from './BotonContador'; // Asegúrate de crear este archivo

function App() {
  const [conteo, setConteo] = useState(0);

  // Esta función es el "manejador del evento personalizado" en el padre.
  const manejarClicBoton = () => {
    setConteo(prevConteo => prevConteo + 1);
  };

  return (
    <div style={{ border: '2px solid purple', padding: '20px', margin: '20px' }}>
      <h1>Eventos Personalizados en React</h1>
      <p>El contador es: {conteo}</p>
      {/* Pasamos la función 'manejarClicBoton' como prop 'alClic' al componente hijo */}
      <BotonContador etiqueta="Sumar 1" alClic={manejarClicBoton} />
      <BotonContador etiqueta="Sumar 1 (otro botón)" alClic={manejarClicBoton} />
      <p>
        Cuando haces clic en los botones del hijo, el padre es notificado y actualiza su estado.
      </p>
    </div>
  );
}

export default App;

// Otro ejemplo: un componente de input con un evento 'onValorCambia'
// Componente InputPersonalizado.js
// import React, { useState } from 'react';
//
// function InputPersonalizado({ onValorCambia }) {
//   const [valorInterno, setValorInterno] = useState('');
//
//   const handleChange = (e) => {
//     const nuevoValor = e.target.value;
//     setValorInterno(nuevoValor);
//     // Llamamos al "evento personalizado" (la prop onValorCambia) con el nuevo valor
//     if (onValorCambia) {
//       onValorCambia(nuevoValor);
//     }
//   };
//
//   return (
//     <input type="text" value={valorInterno} onChange={handleChange} placeholder="Escribe aquí..." />
//   );
// }
// export default InputPersonalizado;
//
// // Uso en el padre:
// // function MiFormulario() {
// //   const [textoGlobal, setTextoGlobal] = useState('');
// //   return (
// //     <div>
// //       <p>Texto en el padre: {textoGlobal}</p>
// //       <InputPersonalizado onValorCambia={(valor) => setTextoGlobal(valor)} />
// //     </div>
// //   );
// // }
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Estado y Eventos',
    'topic': 'Manejo de Eventos',
    'subtopic': 'Prevención de comportamiento por defecto',
    'definition': '''
En el desarrollo web, algunos eventos del navegador tienen un "comportamiento por defecto". Por ejemplo, hacer clic en un enlace (`<a>`) te lleva a otra página, y enviar un formulario (`<form>`) recarga la página. En React, a menudo querrás evitar este comportamiento predeterminado para controlar la lógica de tu aplicación.

No sé tú, pero a mí esto al principio me costó y me frustraba ver cómo mis formularios recargaban la página. Para evitar el comportamiento por defecto de un evento en React, puedes llamar al método `event.preventDefault()` dentro de tu función manejadora del evento. El objeto `event` (o `e` como se le suele abreviar) es el objeto de evento sintético que React pasa a tus manejadores. Este método es super útil, por ejemplo, cuando manejas el envío de un formulario: si no lo llamas, el navegador intentará enviar el formulario a una URL (generalmente la misma página, lo que causa una recarga completa) y perderías todo el estado de tu aplicación React. Al usar `e.preventDefault()`, le dices al navegador "espera, yo me encargo de esto, no hagas lo que harías normalmente". Esto te da el control total sobre lo que sucede después del evento, permitiéndote, por ejemplo, enviar datos a una API de forma asíncrona sin recargar la página. Es un pequeño detalle, pero absolutamente esencial para construir aplicaciones web dinámicas y de una sola página.
''',
    'code_example': r'''
// Ejemplo de prevención de comportamiento por defecto
import React, { useState } from 'react';

function FormularioContacto() {
  const [nombre, setNombre] = useState('');
  const [email, setEmail] = useState('');
  const [mensajeConfirmacion, setMensajeConfirmacion] = useState('');

  const handleSubmit = (e) => {
    e.preventDefault(); // ¡PREVENIMOS LA RECARGA DE LA PÁGINA!
    console.log('Formulario enviado (sin recarga):', { nombre, email });
    setMensajeConfirmacion(`¡Gracias, ${nombre}! Tu mensaje ha sido enviado.`);
    // Aquí normalmente harías una petición a una API para enviar los datos
    setNombre(''); // Limpiar campos después del envío
    setEmail('');
  };

  const handleClickEnlace = (e) => {
    e.preventDefault(); // Evita que el enlace te lleve a otra página
    alert('Has intentado ir a Google, pero te detuve. ¡Quédate en mi app!');
  };

  return (
    <div style={{ border: '2px solid green', padding: '20px', margin: '20px' }}>
      <h2>Formulario de Contacto</h2>
      <p>{mensajeConfirmacion}</p>
      <form onSubmit={handleSubmit}>
        <div>
          <label>
            Nombre:
            <input type="text" value={nombre} onChange={(e) => setNombre(e.target.value)} />
          </label>
        </div>
        <div>
          <label>
            Email:
            <input type="email" value={email} onChange={(e) => setEmail(e.target.value)} />
          </label>
        </div>
        <button type="submit">Enviar Mensaje</button>
      </form>
      <br />
      <a href="https://www.google.com" onClick={handleClickEnlace}>
        Ir a Google (pero no lo harás 😉)
      </a>
    </div>
  );
}

export default FormularioContacto;

// Ejemplo incorrecto (olvidar preventDefault en un formulario)
// function FormularioSinPrevencion() {
//   const handleSubmit = () => {
//     console.log('Este mensaje se verá brevemente antes de la recarga.');
//     // El formulario se enviará y la página se recargará
//   };
//   return (
//     <form onSubmit={handleSubmit}>
//       <button type="submit">Enviar (Recarga la página)</button>
//     </form>
//   );
// }
'''
  });
}

Future<void> insertReactJrLevel4Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Ciclo de Vida y Efectos',
    'topic': 'Ciclo de Vida de Componentes',
    'subtopic': 'Métodos de ciclo de vida en componentes de clase',
    'definition': '''
El ciclo de vida de un componente en React se refiere a las diferentes fases por las que pasa un componente desde que se crea hasta que se destruye. Los componentes de clase tienen una serie de métodos especiales que te permiten ejecutar código en puntos específicos de este ciclo.

¿Te estás preguntando por qué esto importa? 

Entender estos métodos es crucial si trabajas con componentes de clase (aunque los Hooks han simplificado mucho esto para los componentes funcionales). Cada método de ciclo de vida tiene un propósito específico:
* `constructor()`: Es el primer método que se llama cuando se crea una instancia del componente. Aquí inicializas el estado y enlazas métodos si es necesario.
* `static getDerivedStateFromProps()`: Se llama antes de cada renderizado. Su propósito es permitir que un componente actualice su estado interno basándose en cambios en las props, pero debe usarse con cuidado.
* `render()`: Es el único método obligatorio. Se encarga de devolver el JSX que React debe mostrar en la pantalla. No debes causar efectos secundarios aquí.
* `componentDidMount()`: Se ejecuta una vez, justo después de que el componente se ha montado en el DOM. Es el lugar perfecto para realizar peticiones de datos iniciales, configurar suscripciones o interactuar con el DOM directamente.
* `shouldComponentUpdate()`: Se llama antes de que el componente se actualice. Puedes devolver `false` para decirle a React que no re-renderice el componente si las props o el estado no han cambiado, lo que es útil para optimizaciones de rendimiento.
* `componentDidUpdate()`: Se invoca inmediatamente después de que la actualización ocurre. Es un buen lugar para realizar operaciones de red cuando las props o el estado cambian, o para interactuar con el DOM después de una actualización.
* `componentWillUnmount()`: Se llama justo antes de que el componente sea desmontado y destruido del DOM. Aquí es donde debes realizar cualquier limpieza, como cancelar peticiones de red o eliminar suscripciones.

Dominar estos métodos te da un control preciso sobre el comportamiento de tus componentes a lo largo de su existencia.
''',
    'code_example': r'''
// Ejemplo de Componente de Clase con métodos de ciclo de vida
import React, { Component } from 'react';

class ContadorDeClase extends Component {
  constructor(props) {
    super(props);
    this.state = {
      conteo: 0
    };
    console.log('1. Constructor: Componente inicializado.');
  }

  // Se llama antes de cada render (raramente usado hoy día, pero existe)
  static getDerivedStateFromProps(props, state) {
    // console.log('2. getDerivedStateFromProps: Se actualiza el estado derivado si es necesario.');
    return null; // O un objeto para actualizar el estado
  }

  // Se ejecuta una vez después de que el componente se monta en el DOM
  componentDidMount() {
    console.log('4. componentDidMount: Componente montado en el DOM.');
    // Aquí puedes hacer peticiones a APIs, configurar listeners, etc.
    this.intervalId = setInterval(() => {
      this.setState(prevState => ({
        conteo: prevState.conteo + 1
      }));
    }, 1000);
  }

  // Se llama antes de cada re-renderizado (para optimización)
  shouldComponentUpdate(nextProps, nextState) {
    console.log('5. shouldComponentUpdate: ¿Debería actualizarse?');
    // Si el conteo es par, no re-renderices para mostrarlo en consola
    // return nextState.conteo % 2 === 0;
    return true; // Normalmente siempre true para re-renderizar
  }

  // Se ejecuta después de cada actualización (re-renderizado)
  componentDidUpdate(prevProps, prevState) {
    console.log('6. componentDidUpdate: Componente actualizado.');
    if (this.state.conteo !== prevState.conteo) {
      console.log(`Conteo ha cambiado de ${prevState.conteo} a ${this.state.conteo}`);
    }
  }

  // Se ejecuta justo antes de que el componente sea eliminado del DOM
  componentWillUnmount() {
    console.log('7. componentWillUnmount: Componente a punto de ser desmontado. Limpiando...');
    clearInterval(this.intervalId); // Limpiar el intervalo para evitar fugas de memoria
  }

  incrementar = () => {
    this.setState(prevState => ({ conteo: prevState.conteo + 1 }));
  };

  render() {
    console.log('3. Render: Dibujando UI.');
    return (
      <div style={{ border: '2px solid navy', padding: '20px', margin: '20px' }}>
        <h2>Contador de Clase: {this.state.conteo}</h2>
        <button onClick={this.incrementar}>Incrementar</button>
        <p>Revisa la consola para ver el ciclo de vida.</p>
      </div>
    );
  }
}

// Componente para demostrar componentWillUnmount
class DemostradorDesmontaje extends Component {
  render() {
    return <p>Este componente se desmontará en 5 segundos.</p>;
  }

  componentWillUnmount() {
    console.log('DemostradorDesmontaje: ¡Adiós mundo!');
  }
}

// Uso en App.js
function App() {
  const [mostrarContador, setMostrarContador] = React.useState(true);

  React.useEffect(() => {
    const timer = setTimeout(() => {
      setMostrarContador(false);
    }, 5000); // Esconde el contador después de 5 segundos

    return () => clearTimeout(timer);
  }, []);

  return (
    <div>
      {mostrarContador ? <ContadorDeClase /> : <p>Contador desmontado.</p>}
      {mostrarContador && <DemostradorDesmontaje />}
    </div>
  );
}

export default App;

// Ejemplo incorrecto (realizar efectos secundarios directos en render)
// class BadComponent extends Component {
//   render() {
//     console.log('¡Petición de red aquí! (MALO)'); // Esto causaría múltiples peticiones
//     return <p>...</p>;
//   }
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Ciclo de Vida y Efectos',
    'topic': 'Ciclo de Vida de Componentes',
    'subtopic': 'Uso de useEffect en componentes funcionales',
    'definition': '''
El Hook `useEffect` en React es la herramienta principal para manejar los "efectos secundarios" en tus componentes funcionales. Los efectos secundarios son cualquier operación que va más allá de la simple renderización de la interfaz, como peticiones de datos, suscripciones, manipulación directa del DOM, o timers.

¿Te estás preguntando por qué esto importa? 

Antes de `useEffect`, todas estas operaciones se manejaban en los métodos de ciclo de vida de los componentes de clase, lo que a menudo resultaba en lógica dispersa y difícil de seguir. `useEffect` unifica la lógica relacionada con el "montaje", "actualización" y "desmontaje" del componente en un solo lugar. Cuando usas `useEffect`, le pasas una función que React ejecutará después de cada renderizado que haya afectado a las dependencias de ese efecto. Puedes pensar en `useEffect` como una combinación de `componentDidMount`, `componentDidUpdate` y `componentWillUnmount` para componentes funcionales. Si no pasas un segundo argumento (el array de dependencias), el efecto se ejecutará después de cada renderizado. Si pasas un array vacío `[]`, se ejecutará solo una vez después del montaje inicial (como `componentDidMount`). Si pasas un array con variables, el efecto se ejecutará cada vez que alguna de esas variables cambie. La clave de `useEffect` es su capacidad para "sincronizar" tu componente con sistemas externos al React, de una manera declarativa y limpia.
''',
    'code_example': r'''
// Ejemplo básico de useEffect
import React, { useState, useEffect } from 'react';

function SaludoDinamico() {
  const [nombre, setNombre] = useState('Invitado');

  // Efecto que se ejecuta después de cada renderizado si 'nombre' cambia
  // Simula componentDidMount y componentDidUpdate
  useEffect(() => {
    console.log(`El nombre ha cambiado a: ${nombre}`);
    // Puedes hacer peticiones a APIs aquí, basadas en el nuevo nombre
  }, [nombre]); // Array de dependencias: se re-ejecuta cuando 'nombre' cambia

  // Efecto que se ejecuta solo una vez al montar el componente (como componentDidMount)
  useEffect(() => {
    console.log('Componente SaludoDinamico montado por primera vez.');
    // Aquí puedes configurar una suscripción inicial, cargar datos una sola vez
  }, []); // Array de dependencias vacío

  return (
    <div style={{ border: '2px solid blue', padding: '20px', margin: '20px' }}>
      <h2>Hola, {nombre}!</h2>
      <input
        type="text"
        value={nombre}
        onChange={(e) => setNombre(e.target.value)}
        placeholder="Introduce tu nombre"
      />
      <p>Revisa la consola para ver los efectos.</p>
    </div>
  );
}

// Ejemplo de un temporizador con useEffect
function TemporizadorFuncional() {
  const [segundos, setSegundos] = useState(0);

  useEffect(() => {
    console.log('Temporizador iniciado.');
    const idIntervalo = setInterval(() => {
      setSegundos(prevSegundos => prevSegundos + 1);
    }, 1000);

    // Función de limpieza (como componentWillUnmount)
    return () => {
      console.log('Temporizador limpiado.');
      clearInterval(idIntervalo);
    };
  }, []); // Se ejecuta solo una vez al montar y limpia al desmontar

  return (
    <div style={{ border: '2px solid green', padding: '20px', margin: '20px' }}>
      <h3>Tiempo transcurrido: {segundos} segundos</h3>
      <p>Este temporizador usa useEffect para su lógica.</p>
    </div>
  );
}

// Uso en App.js
function App() {
  const [mostrarTemporizador, setMostrarTemporizador] = useState(true);

  return (
    <div>
      <SaludoDinamico />
      <hr />
      <button onClick={() => setMostrarTemporizador(!mostrarTemporizador)}>
        {mostrarTemporizador ? 'Ocultar Temporizador' : 'Mostrar Temporizador'}
      </button>
      {mostrarTemporizador && <TemporizadorFuncional />}
    </div>
  );
}

export default App;

// Ejemplo incorrecto (olvidar las dependencias cuando son necesarias)
// function ComponenteConDependenciaFaltante() {
//   const [conteo, setConteo] = useState(0);
//
//   useEffect(() => {
//     // console.log(conteo); // ¡Advertencia: 'conteo' falta en el array de dependencias!
//   }, []); // El efecto no se re-ejecutará cuando 'conteo' cambie, lo que puede causar bugs.
//
//   return (
//     <button onClick={() => setConteo(conteo + 1)}>
//       Incrementar ({conteo})
//     </button>
//   );
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Ciclo de Vida y Efectos',
    'topic': 'Ciclo de Vida de Componentes',
    'subtopic': 'Limpieza de efectos y dependencias',
    'definition': '''
La limpieza de efectos en `useEffect` es crucial para evitar problemas como fugas de memoria, comportamientos inesperados o bugs en tu aplicación React. Se refiere a la forma en que `useEffect` te permite "deshacer" cualquier configuración o suscripción que hayas iniciado en el efecto.

¿Te estás preguntando por qué esto importa? 

Piensa en un efecto que configura un temporizador o una suscripción a un evento. Si el componente se desmonta (desaparece de la pantalla) y no limpias ese temporizador o suscripción, estos seguirán ejecutándose en segundo plano, consumiendo recursos y potencialmente intentando actualizar un componente que ya no existe, lo que lleva a errores. Para limpiar un efecto, la función que le pasas a `useEffect` puede (y a menudo debería) devolver otra función. Esta función de retorno es la "función de limpieza", y React la ejecutará justo antes de que el componente se desmonte, o antes de que el efecto se re-ejecute debido a un cambio en sus dependencias.

Las **dependencias** son el segundo argumento opcional de `useEffect` (el array `[]`). Indican a React cuándo debe re-ejecutar el efecto.
* Si el array de dependencias está vacío (`[]`), el efecto se ejecuta solo una vez después del montaje inicial y la limpieza se ejecuta solo al desmontar el componente.
* Si omites el array de dependencias, el efecto se ejecuta después de cada renderizado del componente.
* Si incluyes variables en el array (por ejemplo, `[nombreUsuario, idProducto]`), el efecto se re-ejecuta cada vez que el valor de alguna de esas variables cambie. Esto es vital para asegurar que tu efecto siempre use los valores más recientes de las props y el estado sin caer en "cierres" (closures) obsoletos.

Dominar la limpieza y las dependencias es la clave para escribir efectos robustos y eficientes que se comporten correctamente en todas las fases del ciclo de vida de tu componente.
''',
    'code_example': r'''
// Ejemplo de limpieza de efectos y dependencias
import React, { useState, useEffect } from 'react';

function Cronometro() {
  const [segundos, setSegundos] = useState(0);
  const [estaCorriendo, setEstaCorriendo] = useState(false);

  // Efecto para el cronómetro
  useEffect(() => {
    let intervaloId;
    if (estaCorriendo) {
      console.log('Efecto: Cronómetro iniciado.');
      intervaloId = setInterval(() => {
        setSegundos(prevSegundos => prevSegundos + 1);
      }, 1000);
    } else {
      console.log('Efecto: Cronómetro detenido.');
    }

    // Función de limpieza: se ejecuta cuando el componente se desmonta
    // O cuando 'estaCorriendo' cambia de true a false, o viceversa, y el efecto se re-ejecuta
    return () => {
      console.log('Efecto: Limpiando intervalo.');
      clearInterval(intervaloId); // Evitar fugas de memoria
    };
  }, [estaCorriendo]); // Dependencia: el efecto se re-ejecuta si 'estaCorriendo' cambia

  return (
    <div style={{ border: '2px dashed chocolate', padding: '20px', margin: '20px' }}>
      <h2>Cronómetro: {segundos} segundos</h2>
      <button onClick={() => setEstaCorriendo(!estaCorriendo)}>
        {estaCorriendo ? 'Detener' : 'Iniciar'}
      </button>
      <button onClick={() => setSegundos(0)} disabled={estaCorriendo}>
        Resetear
      </button>
      <p>Revisa la consola para ver cuándo se inicia/detiene el efecto y la limpieza.</p>
    </div>
  );
}

// Otro ejemplo: cargar datos basado en una prop
function LectorDePost({ postId }) {
  const [post, setPost] = useState(null);
  const [cargando, setCargando] = useState(false);
  const [error, setError] = useState(null);

  useEffect(() => {
    if (!postId) {
      setPost(null);
      return; // No hay ID de post, no hay que cargar nada
    }

    console.log(`Efecto: Cargando post ${postId}...`);
    setCargando(true);
    setError(null);
    setPost(null); // Limpiar post anterior

    const controladorAbort = new AbortController(); // Para cancelar la petición
    const signal = controladorAbort.signal;

    fetch(`https://jsonplaceholder.typicode.com/posts/${postId}`, { signal })
      .then(response => {
        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`);
        }
        return response.json();
      })
      .then(data => {
        setPost(data);
        setCargando(false);
      })
      .catch(err => {
        if (err.name === 'AbortError') {
          console.log('Petición cancelada');
        } else {
          setError(err);
          setCargando(false);
        }
      });

    // Función de limpieza: cancelar la petición si el componente se desmonta o postId cambia
    return () => {
      console.log(`Efecto: Limpiando carga de post ${postId}.`);
      controladorAbort.abort(); // Cancela la petición fetch pendiente
    };
  }, [postId]); // El efecto se re-ejecuta CADA VEZ que 'postId' cambia

  if (cargando) return <p>Cargando post...</p>;
  if (error) return <p>Error al cargar el post: {error.message}</p>;
  if (!post) return <p>Selecciona un ID de post para cargar.</p>;

  return (
    <div style={{ border: '2px dashed blueviolet', padding: '20px', margin: '20px' }}>
      <h3>Post ID: {post.id}</h3>
      <h4>{post.title}</h4>
      <p>{post.body}</p>
    </div>
  );
}

// Uso en App.js
function App() {
  const [currentPostId, setCurrentPostId] = useState(1);
  const [mostrarCronometro, setMostrarCronometro] = useState(true);

  return (
    <div>
      <button onClick={() => setMostrarCronometro(!mostrarCronometro)}>
        {mostrarCronometro ? 'Ocultar Cronómetro' : 'Mostrar Cronómetro'}
      </button>
      {mostrarCronometro && <Cronometro />}

      <hr />
      <h2>Lector de Posts</h2>
      <button onClick={() => setCurrentPostId(prevId => prevId + 1)}>Siguiente Post</button>
      <button onClick={() => setCurrentPostId(prevId => Math.max(1, prevId - 1))}>Post Anterior</button>
      <p>Cargando Post ID: {currentPostId}</p>
      <LectorDePost postId={currentPostId} />
    </div>
  );
}

export default App;
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Ciclo de Vida y Efectos',
    'topic': 'Refs y Acceso al DOM',
    'subtopic': 'Uso de useRef para acceder a elementos del DOM',
    'definition': '''
El Hook `useRef` en React es una herramienta poderosa que te permite acceder directamente a los elementos del DOM o a las instancias de componentes de clase. Es como tener un "gancho" para interactuar con esos elementos de una manera más directa, fuera del flujo de datos de React.

¿Te estás preguntando por qué esto importa? 

En la mayoría de los casos, en React, trabajas de forma declarativa, es decir, describes cómo debería verse tu interfaz y React se encarga de actualizar el DOM. Sin embargo, hay situaciones en las que necesitas interactuar directamente con un elemento DOM real. Por ejemplo, para enfocar un campo de entrada de texto, reproducir o pausar un video, medir el tamaño de un elemento, o integrar librerías de terceros que manipulan el DOM. Para estos casos, `useRef` es tu mejor amigo. Cuando llamas a `useRef()`, te devuelve un objeto `ref` mutable cuya propiedad `.current` se inicializa con el argumento que le pasaste (o `null` por defecto). Luego, puedes adjuntar este objeto `ref` a un elemento JSX (por ejemplo, `<input ref={miInputRef} />`). Una vez que el componente se monta, la propiedad `.current` de `miInputRef` apuntará directamente al nodo DOM de ese input. Es importante recordar que las `refs` no están destinadas para manejar la actualización de la UI de forma declarativa, sino para esos casos específicos donde necesitas una interacción imperativa con el DOM subyacente.
''',
    'code_example': r'''
// Ejemplo de uso de useRef para acceder a elementos del DOM
import React, { useRef } from 'react';

function CampoDeTextoEnfocado() {
  // Creamos una ref
  const inputRef = useRef(null);

  const enfocarInput = () => {
    // Accedemos directamente al elemento DOM a través de .current
    if (inputRef.current) {
      inputRef.current.focus(); // Enfocamos el campo de texto
      inputRef.current.style.backgroundColor = 'lightyellow';
    }
  };

  return (
    <div style={{ border: '2px solid navy', padding: '20px', margin: '20px' }}>
      <h2>Enfocar Campo de Texto con useRef</h2>
      <input
        type="text"
        ref={inputRef} // Adjuntamos la ref al elemento input
        placeholder="Escribe algo aquí..."
      />
      <button onClick={enfocarInput}>Enfocar Input</button>
      <p>Haz clic en el botón para enfocar y resaltar el campo de texto.</p>
    </div>
  );
}

// Otro ejemplo: reproducción de video
function ReproductorVideo() {
  const videoRef = useRef(null);

  const reproducir = () => {
    if (videoRef.current) {
      videoRef.current.play();
    }
  };

  const pausar = () => {
    if (videoRef.current) {
      videoRef.current.pause();
    }
  };

  return (
    <div style={{ border: '2px solid teal', padding: '20px', margin: '20px' }}>
      <h2>Reproductor de Video con useRef</h2>
      <video ref={videoRef} width="320" height="240" controls>
        <source src="https://www.w3schools.com/html/mov_bbb.mp4" type="video/mp4" />
        Tu navegador no soporta el tag de video.
      </video>
      <br />
      <button onClick={reproducir}>Reproducir</button>
      <button onClick={pausar}>Pausar</button>
    </div>
  );
}

// Uso en App.js
function App() {
  return (
    <div>
      <CampoDeTextoEnfocado />
      <ReproductorVideo />
    </div>
  );
}

export default App;

// Ejemplo incorrecto (intentar manipular el DOM directamente sin refs, en lugar de declarativamente)
// function ComponenteIncorrectoDOM() {
//   // Esto no es Reactivo y es difícil de manejar con el ciclo de vida de React
//   const cambiarEstilo = () => {
//     document.getElementById('miParrafo').style.color = 'red';
//   };
//   return (
//     <div>
//       <p id="miParrafo">Texto</p>
//       <button onClick={cambiarEstilo}>Cambiar Estilo</button>
//     </div>
//   );
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Ciclo de Vida y Efectos',
    'topic': 'Refs y Acceso al DOM',
    'subtopic': 'Referencias en componentes de clase',
    'definition': '''
Aunque en los componentes funcionales usamos `useRef`, los componentes de clase en React también tienen una forma de manejar referencias para acceder directamente a los elementos del DOM o a otras instancias de componentes de clase. Es un concepto similar, pero con una sintaxis diferente que involucra la propiedad `createRef()`.

Seguramente pensarás de qué va todo esto... 

Antes de la llegada de los Hooks, `React.createRef()` era la forma estándar de crear `refs` en componentes de clase. Lo que haces es inicializar una `ref` en el `constructor` de tu clase y luego la adjuntas a un elemento JSX usando el atributo `ref`. Una vez que el componente se monta, esa `ref` tendrá su propiedad `.current` apuntando al nodo DOM del elemento. La diferencia clave con `useRef` es que en los componentes de clase, la `ref` se crea una vez en el constructor y se mantiene para toda la vida del componente. También podías pasar `refs` como `props` (lo que se conoce como "ref forwarding"), lo que permite que un componente padre acceda al DOM de un componente hijo, pero esto requiere una envoltura especial usando `React.forwardRef`. Aunque hoy en día se prefiere `useRef` para los componentes funcionales, comprender cómo funcionan las `refs` en componentes de clase es importante si vas a mantener código antiguo o trabajar en proyectos que aún los utilicen.
''',
    'code_example': r'''
// Ejemplo de referencias en componentes de clase
import React, { Component, createRef } from 'react';

class EnfocadorDeClase extends Component {
  constructor(props) {
    super(props);
    // Creamos la ref en el constructor
    this.miInputRef = createRef();
  }

  componentDidMount() {
    // Al montar, enfocamos el input automáticamente
    if (this.miInputRef.current) {
      this.miInputRef.current.focus();
    }
  }

  enfocarManualmente = () => {
    if (this.miInputRef.current) {
      this.miInputRef.current.focus();
      this.miInputRef.current.style.border = '2px solid blue';
    }
  };

  render() {
    return (
      <div style={{ border: '2px solid orange', padding: '20px', margin: '20px' }}>
        <h2>Campo de Texto con Ref de Clase</h2>
        <input
          type="text"
          ref={this.miInputRef} // Adjuntamos la ref al elemento
          placeholder="Me enfoco al cargar y al hacer clic"
        />
        <button onClick={this.enfocarManualmente}>Enfocar y Resaltar</button>
        <p>Este campo se enfoca al cargar la página y al hacer clic en el botón.</p>
      </div>
    );
  }
}

// Ejemplo de Referencia a un Componente de Clase
class MiComponenteClaseHijo extends Component {
  saludar() {
    alert('¡Hola desde el componente hijo de clase!');
  }

  render() {
    return <p>Soy un componente de clase hijo.</p>;
  }
}

class PadreDeClase extends Component {
  constructor(props) {
    super(props);
    this.hijoRef = createRef();
  }

  llamarMetodoHijo = () => {
    if (this.hijoRef.current) {
      this.hijoRef.current.saludar(); // Llamamos a un método del componente hijo
    }
  };

  render() {
    return (
      <div style={{ border: '2px solid green', padding: '20px', margin: '20px' }}>
        <h2>Acceso a Componente de Clase Hijo</h2>
        <MiComponenteClaseHijo ref={this.hijoRef} /> {/* Adjuntamos la ref al componente hijo */}
        <button onClick={this.llamarMetodoHijo}>Llamar método del Hijo</button>
        <p>Haz clic para que el componente hijo de clase te salude.</p>
      </div>
    );
  }
}


// Uso en App.js
function App() {
  return (
    <div>
      <EnfocadorDeClase />
      <PadreDeClase />
    </div>
  );
}

export default App;

// Ejemplo incorrecto (intentar adjuntar ref a componente funcional directamente)
// function ComponenteFuncional() {
//   return <p>Soy funcional</p>;
// }
// class OtroPadre extends Component {
//   constructor(props) {
//     super(props);
//     this.funcionalRef = createRef();
//   }
//   render() {
//     // Esto NO FUNCIONA: no se pueden usar refs de clase directamente en componentes funcionales.
//     // Se necesitaría React.forwardRef en el componente funcional.
//     return <ComponenteFuncional ref={this.funcionalRef} />;
//   }
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Ciclo de Vida y Efectos',
    'topic': 'Refs y Acceso al DOM',
    'subtopic': 'Casos de uso comunes de refs',
    'definition': '''
Si bien las `refs` en React no son el método principal para interactuar con la interfaz de usuario (la programación declarativa es preferible), existen varios escenarios específicos donde su uso es no solo adecuado, sino a menudo necesario. Son esas situaciones donde necesitas "escapar" del modelo declarativo de React por un momento.

Vamos a ver de qué se trata todo esto... 

Los casos de uso más comunes para las `refs` giran en torno a interacciones imperativas con el DOM o la integración con librerías externas. Aquí te dejo algunos ejemplos:
* **Manejo de foco, selección de texto o reproducción de medios:** Quieres enfocar automáticamente un campo de entrada cuando un componente se carga, o controlar la reproducción/pausa de un video. Estos son comportamientos que el navegador controla directamente y requieren acceso al nodo DOM.
* **Integración con librerías DOM de terceros:** Si estás usando una librería JavaScript que no está diseñada específicamente para React y que manipula el DOM directamente (por ejemplo, una librería de gráficos, un editor de texto complejo), necesitarás una `ref` para pasarle a esa librería el nodo DOM con el que debe interactuar.
* **Animaciones:** Para ciertas animaciones de bajo nivel o que requieran manipulación directa de CSS, a veces es más eficiente o incluso necesario acceder al elemento DOM.
* **Medición de elementos:** Obtener las dimensiones o la posición de un elemento en la pantalla (su `offsetWidth`, `offsetHeight`, etc.) requiere acceso al nodo DOM.
* **Manejo de componentes de clase hijos (imperativamente):** Aunque menos común con los Hooks, puedes usar una `ref` para llamar a métodos públicos expuestos por un componente de clase hijo.

Es importante recordar que las `refs` deben usarse con moderación. Si puedes lograr el mismo resultado de forma declarativa (manipulando el estado o las `props`), esa es casi siempre la mejor opción. Las `refs` son una herramienta para cuando realmente necesitas un "escape" al mundo del DOM.
''',
    'code_example': r'''
// Ejemplo de caso de uso común: enfocar un input al cargar el componente
import React, { useRef, useEffect } from 'react';

function FormularioLogin() {
  const emailInputRef = useRef(null);

  useEffect(() => {
    // Enfoca el campo de email cuando el componente se monta
    if (emailInputRef.current) {
      emailInputRef.current.focus();
    }
  }, []); // El array vacío asegura que se ejecuta solo una vez al montar

  const handleSubmit = (e) => {
    e.preventDefault();
    alert(`Intentando iniciar sesión con email: ${emailInputRef.current.value}`);
    // Aquí podrías enviar los datos a un servidor
  };

  return (
    <div style={{ border: '2px solid purple', padding: '20px', margin: '20px' }}>
      <h2>Iniciar Sesión (con useRef para enfoque)</h2>
      <form onSubmit={handleSubmit}>
        <div>
          <label>
            Email:
            <input type="email" ref={emailInputRef} /> {/* La ref está aquí */}
          </label>
        </div>
        <div>
          <label>
            Contraseña:
            <input type="password" />
          </label>
        </div>
        <button type="submit">Entrar</button>
      </form>
      <p>El campo de email se enfoca automáticamente al cargar.</p>
    </div>
  );
}

// Otro caso de uso: medir un elemento
function MedidorDeAncho() {
  const divRef = useRef(null);
  const [ancho, setAncho] = useState(0);

  useEffect(() => {
    // Medir el ancho del div después del renderizado
    if (divRef.current) {
      setAncho(divRef.current.offsetWidth);
    }

    // Opcional: Re-medir si la ventana cambia de tamaño
    const handleResize = () => {
      if (divRef.current) {
        setAncho(divRef.current.offsetWidth);
      }
    };

    window.addEventListener('resize', handleResize);
    return () => window.removeEventListener('resize', handleResize);
  }, []); // Se ejecuta al montar y re-mide si el ancho del div cambia

  return (
    <div style={{ border: '2px dashed gray', padding: '20px', margin: '20px' }}>
      <h2>Medición de Elementos con useRef</h2>
      <div ref={divRef} style={{ width: '50%', height: '50px', backgroundColor: 'lightblue', margin: 'auto' }}>
        Este es el div a medir.
      </div>
      <p>El ancho actual del div es: {ancho}px</p>
      <p>Intenta cambiar el tamaño de la ventana del navegador para ver cómo el ancho se actualiza.</p>
    </div>
  );
}

// Uso en App.js
function App() {
  return (
    <div>
      <FormularioLogin />
      <MedidorDeAncho />
    </div>
  );
}

export default App;

// Ejemplo de un caso donde NO usar refs (manejo de input simple)
// function CampoMalo() {
//   const inputRef = useRef(null);
//   const handleSubmit = () => {
//     // Esto es un anti-patrón; se debe usar el estado para controlar inputs
//     console.log(inputRef.current.value);
//   };
//   return (
//     <div>
//       <input ref={inputRef} />
//       <button onClick={handleSubmit}>Enviar</button>
//     </div>
//   );
// }
'''
  });
}

Future<void> insertReactJrLevel5Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Listas y Formularios',
    'topic': 'Renderizado de Listas',
    'subtopic': 'Uso de map para renderizar listas',
    'definition': '''
Renderizar listas en React es una tarea muy común, y la forma más efectiva y declarativa de hacerlo es utilizando el método `map()` de los arrays de JavaScript. Esto te permite transformar una lista de datos en una lista de elementos JSX que React puede mostrar.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una lista de productos en una tienda online, o una lista de tareas pendientes. No querrías escribir el código HTML para cada elemento individualmente. Ahí es donde `map()` brilla. Cuando tienes un array de datos (por ejemplo, un array de objetos, donde cada objeto representa un ítem de tu lista), puedes llamar a `map()` sobre ese array. Para cada elemento del array, la función de `map()` devolverá un elemento JSX (como un `<li>`, un `<div>`, o incluso un componente React completo) que represente ese dato. React luego toma este array de elementos JSX y los renderiza en el DOM. Es una forma elegante y eficiente de mostrar colecciones de datos, ya que el renderizado se adapta automáticamente al número de elementos en tu array, ya sean 0, 10 o 1000. Además, mantiene tu código limpio y fácil de mantener, ya que la lógica de renderizado para cada elemento de la lista está centralizada.
''',
    'code_example': r'''
// Ejemplo de uso de map para renderizar listas
import React from 'react';

function ListaDeTareas() {
  const tareas = [
    { id: 1, texto: 'Comprar pan', completada: false },
    { id: 2, texto: 'Estudiar React Hooks', completada: true },
    { id: 3, texto: 'Hacer ejercicio', completada: false },
  ];

  return (
    <div style={{ border: '2px solid navy', padding: '20px', margin: '20px' }}>
      <h2>Mis Tareas Pendientes</h2>
      <ul>
        {/* Usamos map para transformar cada objeto 'tarea' en un elemento <li> */}
        {tareas.map(tarea => (
          <li key={tarea.id} style={{ textDecoration: tarea.completada ? 'line-through' : 'none' }}>
            {tarea.texto}
          </li>
        ))}
      </ul>
      <p>Cada ítem de la lista se genera dinámicamente a partir del array 'tareas'.</p>
    </div>
  );
}

// Otro ejemplo: lista de productos
function ListaDeProductos() {
  const productos = [
    { id: 'a1', nombre: 'Laptop Gamer', precio: 1200 },
    { id: 'b2', nombre: 'Teclado Mecánico', precio: 80 },
    { id: 'c3', nombre: 'Mouse Inalámbrico', precio: 45 },
  ];

  return (
    <div style={{ border: '2px dashed blue', padding: '20px', margin: '20px' }}>
      <h2>Catálogo de Productos</h2>
      {productos.map(producto => (
        <div key={producto.id} style={{ marginBottom: '10px', padding: '5px', border: '1px solid #eee' }}>
          <h3>{producto.nombre}</h3>
          <p>Precio: ${producto.precio.toFixed(2)}</p>
        </div>
      ))}
    </div>
  );
}

// Uso en App.js
function App() {
  return (
    <div>
      <ListaDeTareas />
      <ListaDeProductos />
    </div>
  );
}

export default App;

// Ejemplo incorrecto (sin usar map, repitiendo código)
// function ListaManual() {
//   return (
//     <ul>
//       <li>Tarea 1</li>
//       <li>Tarea 2</li>
//       <li>Tarea 3</li>
//     </ul>
//   );
// }
// Este enfoque no es escalable si la lista cambia dinámicamente.
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Listas y Formularios',
    'topic': 'Renderizado de Listas',
    'subtopic': 'Claves únicas en elementos de listas',
    'definition': '''
Cuando renderizas listas de elementos en React, es fundamental que cada elemento tenga una `key` (clave) única y estable. Esta `key` no se muestra en la interfaz de usuario, pero es un identificador interno crucial para que React pueda optimizar el rendimiento y comportarse correctamente.

No sé tú, pero a mí esto al principio me costó entender su importancia, hasta que vi los errores en consola. ¿Te estás preguntando por qué esto importa? Piensa en una lista donde los elementos pueden cambiar de orden, añadirse o eliminarse. Sin una `key` única, React tiene dificultades para identificar qué elementos han cambiado, cuáles son nuevos o cuáles se han movido. Esto puede llevar a problemas de rendimiento (React re-renderiza más de lo necesario), errores extraños (estado incorrecto asociado a un elemento equivocado), y problemas con animaciones. La `key` ayuda a React a rastrear la identidad de cada elemento de la lista entre un renderizado y el siguiente. Deberías usar una `key` que sea verdaderamente única y persistente para el elemento en cuestión, incluso si la lista cambia. Lo ideal es usar un ID único del elemento desde tus datos (por ejemplo, `producto.id` o `tarea.id`). Si no tienes un ID estable, puedes usar el índice del array como `key` (`index`), pero esto solo es aceptable si la lista nunca cambia de orden, se añaden o eliminan elementos. Usar el índice como `key` cuando la lista puede modificarse es una fuente común de bugs.
''',
    'code_example': r'''
// Ejemplo de claves únicas en elementos de listas
import React from 'react';

function ListaDeUsuarios() {
  const usuarios = [
    { id: 'user-abc', nombre: 'Juan', email: 'juan@example.com' },
    { id: 'user-def', nombre: 'Ana', email: 'ana@example.com' },
    { id: 'user-ghi', nombre: 'Pedro', email: 'pedro@example.com' },
  ];

  return (
    <div style={{ border: '2px solid green', padding: '20px', margin: '20px' }}>
      <h2>Lista de Usuarios (con ID único como key)</h2>
      <ul>
        {/* Usamos 'usuario.id' como key, que es único y estable */}
        {usuarios.map(usuario => (
          <li key={usuario.id}>
            {usuario.nombre} ({usuario.email})
          </li>
        ))}
      </ul>
      <p>La consola no mostrará advertencias sobre 'key'.</p>
    </div>
  );
}

// Ejemplo (aceptable solo si la lista es estática y no cambia de orden)
function ListaEstaticaConIndice() {
  const frutas = ['Manzana', 'Banana', 'Cereza'];

  return (
    <div style={{ border: '2px dashed gray', padding: '20px', margin: '20px' }}>
      <h2>Lista de Frutas (con índice como key, solo para listas estáticas)</h2>
      <ul>
        {/* Usamos el índice como key, solo si la lista no cambia nunca */}
        {frutas.map((fruta, index) => (
          <li key={index}>
            {fruta}
          </li>
        ))}
      </ul>
      <p>Este uso del índice es aceptable si la lista 'frutas' nunca va a cambiar de orden o tamaño.</p>
    </div>
  );
}

// Ejemplo incorrecto (usar índice como key cuando la lista puede cambiar)
// Esto causaría problemas si se añaden/eliminan elementos o se reordena
function ListaDinamicaConIndiceIncorrecto() {
  const [items, setItems] = React.useState(['Item A', 'Item B', 'Item C']);

  const añadirItem = () => {
    setItems(prevItems => [...prevItems, `Nuevo Item ${prevItems.length + 1}`]);
  };

  const eliminarPrimerItem = () => {
    setItems(prevItems => prevItems.slice(1));
  };

  return (
    <div style={{ border: '2px solid red', padding: '20px', margin: '20px' }}>
      <h2>Lista Dinámica (¡Índice como key, CUIDADO!)</h2>
      <button onClick={añadirItem}>Añadir Item</button>
      <button onClick={eliminarPrimerItem}>Eliminar Primer Item</button>
      <ul>
        {items.map((item, index) => (
          // React mostrará advertencias en la consola y podría haber bugs
          <li key={index}> 
            {item}
          </li>
        ))}
      </ul>
      <p style={{ color: 'red' }}>
        <strong>¡Advertencia!</strong> Usar el índice como 'key' en listas dinámicas es un anti-patrón.
        Abre la consola del navegador y verás los warnings de React.
      </p>
    </div>
  );
}

// Uso en App.js
function App() {
  return (
    <div>
      <ListaDeUsuarios />
      <ListaEstaticaConIndice />
      <ListaDinamicaConIndiceIncorrecto />
    </div>
  );
}

export default App;
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Listas y Formularios',
    'topic': 'Renderizado de Listas',
    'subtopic': 'Listas anidadas y componentes dinámicos',
    'definition': '''
El renderizado de listas en React va más allá de simples `<li>` elementos. Puedes tener listas anidadas (listas dentro de listas) y, lo que es más potente, puedes renderizar componentes de React dinámicamente dentro de tus listas. Esto permite construir interfaces de usuario complejas y reutilizables.

Vamos a ver de qué se trata todo esto... 

Pensemos en un menú con submenús, o un tablero Kanban con columnas y tarjetas. Estas son estructuras que implican listas dentro de listas. Puedes lograr esto utilizando `map()` de forma anidada. Por ejemplo, si tienes un array de categorías, y cada categoría tiene un array de ítems, podrías usar un `map()` para las categorías y dentro de ese `map()`, otro `map()` para los ítems de cada categoría. La clave aquí es que cada elemento *individual* dentro de la lista (ya sea de la lista principal o de la anidada) debe tener su propia `key` única.

Además, en lugar de renderizar elementos HTML directamente como `<li>` o `<div>`, a menudo querrás renderizar tus propios componentes React personalizados. Esto es increíblemente útil para la reutilización de código. Por ejemplo, en lugar de un `<li>` simple, podrías tener un componente `<ItemDeLista>` que reciba las `props` necesarias para mostrar la información y manejar su propia lógica interna (como un botón de eliminar o un checkbox). De esta manera, cada elemento de tu lista se convierte en una instancia de un componente React, lo que hace que tu código sea más modular, fácil de mantener y probar. Es la base para construir interfaces de usuario escalables y dinámicas.
''',
    'code_example': r'''
// Componente re-utilizable para un ítem de menú
import React from 'react';

function ItemMenu({ texto, hijos }) {
  return (
    <li>
      {texto}
      {hijos && hijos.length > 0 && (
        <ul>
          {hijos.map(subItem => (
            <ItemMenu key={subItem.id} texto={subItem.texto} hijos={subItem.hijos} />
          ))}
        </ul>
      )}
    </li>
  );
}

// Componente re-utilizable para una tarjeta de producto
function TarjetaProducto({ producto }) {
  return (
    <div style={{ border: '1px solid #ccc', padding: '10px', margin: '5px', borderRadius: '5px' }}>
      <h3>{producto.nombre}</h3>
      <p>Categoría: {producto.categoria}</p>
      <p>Precio: ${producto.precio.toFixed(2)}</p>
      <button onClick={() => alert(`Añadir ${producto.nombre} al carrito`)}>
        Añadir al Carrito
      </button>
    </div>
  );
}


// Componente Padre: ListaAnidadaYDinamica.js
function ListaAnidadaYDinamica() {
  // Datos para una lista de menú anidada
  const menuItems = [
    { id: 1, texto: 'Inicio' },
    {
      id: 2,
      texto: 'Productos',
      hijos: [
        { id: 21, texto: 'Electrónica' },
        { id: 22, texto: 'Ropa', hijos: [
          { id: 221, texto: 'Hombres' },
          { id: 222, texto: 'Mujeres' },
        ]},
      ],
    },
    { id: 3, texto: 'Contacto' },
  ];

  // Datos para una lista de productos dinámicos
  const productosData = [
    { id: 'prod-001', nombre: 'Smartphone X', categoria: 'Electrónica', precio: 699.99 },
    { id: 'prod-002', nombre: 'Camiseta Básica', categoria: 'Ropa', precio: 19.99 },
    { id: 'prod-003', nombre: 'Auriculares BT', categoria: 'Electrónica', precio: 89.00 },
  ];

  return (
    <div style={{ border: '2px solid darkcyan', padding: '20px', margin: '20px' }}>
      <h2>Menú Anidado (con componentes dinámicos)</h2>
      <nav>
        <ul>
          {menuItems.map(item => (
            <ItemMenu key={item.id} texto={item.texto} hijos={item.hijos} />
          ))}
        </ul>
      </nav>

      <hr />

      <h2>Lista de Productos (renderizando componentes)</h2>
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(200px, 1fr))', gap: '15px' }}>
        {productosData.map(producto => (
          <TarjetaProducto key={producto.id} producto={producto} />
        ))}
      </div>
      <p>Cada tarjeta de producto es un componente React reutilizable.</p>
    </div>
  );
}

// Uso en App.js
function App() {
  return (
    <div>
      <ListaAnidadaYDinamica />
    </div>
  );
}

export default App;
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Listas y Formularios',
    'topic': 'Manejo de Formularios',
    'subtopic': 'Control de inputs con estado',
    'definition': '''
En React, la forma más común de manejar los inputs de un formulario (como campos de texto, checkboxes o selectores) es a través de lo que se conoce como "componentes controlados". Esto significa que el valor del input está controlado por el estado de tu componente React.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en un campo de texto simple. Si no lo "controlas" con el estado de React, cada vez que el usuario escribe, el navegador actualizará el DOM, pero React no tendrá una idea de cuál es el valor actual del input en su "memoria" (estado). Al vincular el valor del input a una variable de estado y la función `onChange` a una función que actualiza ese estado, le estás dando a React el control total. Cada vez que el usuario escribe, el evento `onChange` se dispara, tu función actualiza el estado con el nuevo valor del input, y React re-renderiza el input con ese nuevo valor. Esto puede sonar un poco a bucle, pero es una forma muy poderosa de asegurar que el estado de tu aplicación y lo que el usuario ve en la interfaz estén siempre sincronizados. Además, te permite manipular el valor del input programáticamente, realizar validaciones en tiempo real, o incluso prellenar campos desde una API. Es una piedra angular en el manejo de formularios en React.
''',
    'code_example': r'''
// Ejemplo de control de inputs con estado
import React, { useState } from 'react';

function FormularioRegistro() {
  // Estado para el campo de nombre
  const [nombre, setNombre] = useState('');
  // Estado para el campo de email
  const [email, setEmail] = useState('');
  // Estado para un checkbox
  const [aceptarTerminos, setAceptarTerminos] = useState(false);
  // Estado para un selector (dropdown)
  const [pais, setPais] = useState('España');

  // Manejador de cambios para el campo de nombre
  const handleNombreChange = (e) => {
    setNombre(e.target.value);
  };

  // Manejador de cambios para el campo de email
  const handleEmailChange = (e) => {
    setEmail(e.target.value);
  };

  // Manejador de cambios para el checkbox
  const handleTerminosChange = (e) => {
    setAceptarTerminos(e.target.checked); // Para checkboxes, usa .checked
  };

  // Manejador de cambios para el selector
  const handlePaisChange = (e) => {
    setPais(e.target.value);
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    alert(`Formulario enviado:\nNombre: ${nombre}\nEmail: ${email}\nTérminos aceptados: ${aceptarTerminos}\nPaís: ${pais}`);
    console.log({ nombre, email, aceptarTerminos, pais });
  };

  return (
    <div style={{ border: '2px solid navy', padding: '20px', margin: '20px' }}>
      <h2>Formulario de Registro (Controlado)</h2>
      <form onSubmit={handleSubmit}>
        <div>
          <label>
            Nombre:
            <input
              type="text"
              value={nombre}         // El valor del input está controlado por el estado
              onChange={handleNombreChange} // El evento onChange actualiza el estado
              placeholder="Tu nombre"
            />
          </label>
        </div>
        <div>
          <label>
            Email:
            <input
              type="email"
              value={email}
              onChange={handleEmailChange}
              placeholder="tu@email.com"
            />
          </label>
        </div>
        <div>
          <label>
            <input
              type="checkbox"
              checked={aceptarTerminos} // 'checked' para checkboxes
              onChange={handleTerminosChange}
            />
            Acepto los términos y condiciones
          </label>
        </div>
        <div>
          <label>
            País:
            <select value={pais} onChange={handlePaisChange}>
              <option value="España">España</option>
              <option value="México">México</option>
              <option value="Argentina">Argentina</option>
            </select>
          </label>
        </div>
        <button type="submit">Registrarse</button>
      </form>
      <p>
        Valores actuales del estado:<br/>
        Nombre: <strong>{nombre}</strong><br/>
        Email: <strong>{email}</strong><br/>
        Acepta Términos: <strong>{aceptarTerminos ? 'Sí' : 'No'}</strong><br/>
        País: <strong>{pais}</strong>
      </p>
    </div>
  );
}

export default FormularioRegistro;

// Ejemplo de input no controlado (no recomendado para la mayoría de los casos)
// function InputNoControlado() {
//   const inputRef = useRef(null);
//
//   const handleSubmit = (e) => {
//     e.preventDefault();
//     // El valor se obtiene directamente del DOM al momento del submit
//     alert('Valor no controlado: ' + inputRef.current.value);
//   };
//
//   return (
//     <form onSubmit={handleSubmit}>
//       <input type="text" ref={inputRef} defaultValue="Hola" />
//       <button type="submit">Obtener Valor</button>
//     </form>
//   );
// }
// Los componentes no controlados son raros y se usan para casos muy específicos donde no necesitas el control de React.
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Listas y Formularios',
    'topic': 'Manejo de Formularios',
    'subtopic': 'Validación básica de formularios',
    'definition': '''
La validación básica de formularios en React se refiere a verificar que los datos que el usuario ha introducido cumplen con ciertos criterios antes de ser procesados o enviados. Esto es crucial para asegurar la integridad de los datos y proporcionar una buena experiencia de usuario.

No sé tú, pero a mí esto al principio me costó un poco, ya que hay varias maneras de hacerlo. ¿Te estás preguntando por qué esto importa? Imagina un campo de email. Quieres asegurarte de que el usuario realmente introduzca un formato de email válido. O en un campo de contraseña, que tenga una longitud mínima. Realizar validaciones básicas evita que se envíen datos erróneos al servidor y permite darle feedback instantáneo al usuario sobre qué campos necesita corregir. En React, la validación se suele manejar junto con el estado del formulario. Puedes añadir lógica de validación directamente en tu función `onSubmit` o, mejor aún, en las funciones `onChange` para validación en tiempo real. Esto implica comprobar las condiciones (por ejemplo, si un campo no está vacío, si un email tiene el formato `@`, si una contraseña tiene 8 caracteres) y, si no se cumplen, actualizar un estado de "errores" para mostrar mensajes al usuario. Aunque existen librerías avanzadas para formularios y validación (como Formik o React Hook Form), entender la validación básica es fundamental y suficiente para muchos casos sencillos.
''',
    'code_example': r'''
// Ejemplo de validación básica de formularios
import React, { useState } from 'react';

function FormularioConValidacion() {
  const [nombre, setNombre] = useState('');
  const [email, setEmail] = useState('');
  const [contrasena, setContrasena] = useState('');
  const [errores, setErrores] = useState({}); // Estado para guardar mensajes de error

  const validarFormulario = () => {
    let nuevosErrores = {};
    if (!nombre.trim()) { // .trim() para quitar espacios en blanco
      nuevosErrores.nombre = 'El nombre es obligatorio.';
    }
    if (!email.trim()) {
      nuevosErrores.email = 'El email es obligatorio.';
    } else if (!/\S+@\S+\.\S+/.test(email)) { // Regex para validar email básico
      nuevosErrores.email = 'El formato del email no es válido.';
    }
    if (contrasena.length < 6) {
      nuevosErrores.contrasena = 'La contraseña debe tener al menos 6 caracteres.';
    }
    setErrores(nuevosErrores);
    return Object.keys(nuevosErrores).length === 0; // Retorna true si no hay errores
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    const esValido = validarFormulario();
    if (esValido) {
      alert('¡Formulario enviado con éxito!');
      console.log('Datos válidos:', { nombre, email, contrasena });
      // Aquí normalmente enviarías los datos a un servidor
      // setNombre(''); setEmail(''); setContrasena(''); setErrores({}); // Opcional: limpiar form
    } else {
      console.log('Errores de validación:', errores);
    }
  };

  return (
    <div style={{ border: '2px solid green', padding: '20px', margin: '20px' }}>
      <h2>Formulario con Validación Básica</h2>
      <form onSubmit={handleSubmit}>
        <div>
          <label>
            Nombre:
            <input
              type="text"
              value={nombre}
              onChange={(e) => setNombre(e.target.value)}
            />
            {errores.nombre && <p style={{ color: 'red', fontSize: '0.8em' }}>{errores.nombre}</p>}
          </label>
        </div>
        <div>
          <label>
            Email:
            <input
              type="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
            />
            {errores.email && <p style={{ color: 'red', fontSize: '0.8em' }}>{errores.email}</p>}
          </label>
        </div>
        <div>
          <label>
            Contraseña:
            <input
              type="password"
              value={contrasena}
              onChange={(e) => setContrasena(e.target.value)}
            />
            {errores.contrasena && <p style={{ color: 'red', fontSize: '0.8em' }}>{errores.contrasena}</p>}
          </label>
        </div>
        <button type="submit">Enviar</button>
      </form>
      <p>
        Intenta enviar el formulario con campos vacíos o datos incorrectos para ver las validaciones.
      </p>
    </div>
  );
}

export default FormularioConValidacion;

// Ejemplo de validación en tiempo real (al escribir)
// function ValidacionTiempoReal() {
//   const [username, setUsername] = useState('');
//   const [usernameError, setUsernameError] = useState('');
//
//   const handleUsernameChange = (e) => {
//     const value = e.target.value;
//     setUsername(value);
//     if (value.length < 3) {
//       setUsernameError('El nombre de usuario debe tener al menos 3 caracteres.');
//     } else {
//       setUsernameError('');
//     }
//   };
//
//   return (
//     <div>
//       <label>
//         Username:
//         <input type="text" value={username} onChange={handleUsernameChange} />
//       </label>
//       {usernameError && <p style={{ color: 'orange' }}>{usernameError}</p>}
//     </div>
//   );
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Listas y Formularios',
    'topic': 'Manejo de Formularios',
    'subtopic': 'Manejo de eventos de formulario',
    'definition': '''
El manejo de eventos de formulario en React es la forma en que tu aplicación responde a las interacciones específicas que ocurren dentro de un formulario HTML, como el envío del formulario, cambios en los inputs, o el desenfoque de un campo.

¿Te estás preguntando por qué esto importa? 

Los formularios son la principal vía de interacción con el usuario para recolectar información. Necesitas saber cuándo el usuario ha terminado de llenar un campo (`onChange`, `onBlur`), o cuándo ha decidido enviar la información (`onSubmit`). En React, estos eventos se manejan de manera muy similar a otros eventos del DOM, pero con algunas consideraciones importantes. El evento `onChange` es fundamental para los "componentes controlados" (como vimos en el subtema anterior), ya que se dispara cada vez que el valor de un input cambia, permitiéndote actualizar el estado de React. El evento `onSubmit` es el más importante para el formulario en sí. Se dispara cuando el usuario hace clic en un botón de tipo `submit` o presiona Enter en un campo de texto dentro del formulario. Es crucial que en tu manejador `onSubmit` siempre llames a `event.preventDefault()`. Esto evita que el navegador realice su comportamiento por defecto de recargar la página, lo cual es casi siempre indeseable en una aplicación React de una sola página, ya que perderías todo el estado de tu aplicación. Al prevenir el comportamiento por defecto, obtienes el control total sobre cómo se procesan los datos del formulario, permitiéndote enviarlos asíncronamente a una API o realizar otras operaciones.
''',
    'code_example': r'''
// Ejemplo de manejo de eventos de formulario
import React, { useState } from 'react';

function FormularioDeContacto() {
  const [nombre, setNombre] = useState('');
  const [email, setEmail] = useState('');
  const [mensaje, setMensaje] = useState('');
  const [estadoEnvio, setEstadoEnvio] = useState('');

  // Manejador del evento 'change' para todos los inputs (generalizado)
  // Permite un manejo más conciso si los inputs son muchos
  const handleChange = (e) => {
    const { name, value } = e.target; // Desestructuramos name y value del target
    if (name === 'nombre') {
      setNombre(value);
    } else if (name === 'email') {
      setEmail(value);
    } else if (name === 'mensaje') {
      setMensaje(value);
    }
    // console.log(`Campo '${name}' cambió a: ${value}`);
  };

  // Manejador del evento 'blur' (cuando el input pierde el foco)
  const handleBlur = (e) => {
    console.log(`Campo '${e.target.name}' perdió el foco. Valor: ${e.target.value}`);
    // Aquí podrías implementar validación en tiempo real campo por campo
  };

  // Manejador del evento 'submit' del formulario
  const handleSubmit = (e) => {
    e.preventDefault(); // ¡MÉTODO CRÍTICO para evitar la recarga de la página!
    setEstadoEnvio('Enviando...');
    console.log('Formulario enviado:', { nombre, email, mensaje });

    // Simulación de envío de datos a un servidor
    setTimeout(() => {
      setEstadoEnvio('¡Mensaje enviado con éxito!');
      setNombre('');
      setEmail('');
      setMensaje('');
    }, 2000);
  };

  return (
    <div style={{ border: '2px dashed blue', padding: '20px', margin: '20px' }}>
      <h2>Formulario de Contacto (Eventos)</h2>
      <form onSubmit={handleSubmit}>
        <div>
          <label>
            Nombre:
            <input
              type="text"
              name="nombre" // Es importante tener el atributo 'name'
              value={nombre}
              onChange={handleChange}
              onBlur={handleBlur}
              placeholder="Tu nombre"
            />
          </label>
        </div>
        <div>
          <label>
            Email:
            <input
              type="email"
              name="email"
              value={email}
              onChange={handleChange}
              onBlur={handleBlur}
              placeholder="tu@email.com"
            />
          </label>
        </div>
        <div>
          <label>
            Mensaje:
            <textarea
              name="mensaje"
              value={mensaje}
              onChange={handleChange}
              onBlur={handleBlur}
              rows="4"
              placeholder="Escribe tu mensaje aquí..."
            ></textarea>
          </label>
        </div>
        <button type="submit" disabled={estadoEnvio === 'Enviando...'}>
          {estadoEnvio === 'Enviando...' ? 'Enviando...' : 'Enviar Mensaje'}
        </button>
        {estadoEnvio && estadoEnvio !== 'Enviando...' && <p style={{ color: 'green' }}>{estadoEnvio}</p>}
      </form>
      <p>
        Observa los mensajes en la consola al interactuar con el formulario y al enviarlo.
      </p>
    </div>
  );
}

export default FormularioDeContacto;

// Ejemplo incorrecto (olvidar e.preventDefault() en onSubmit)
// function FormularioRecargador() {
//   const handleSubmit = (e) => {
//     // Si no pones e.preventDefault(), la página se recargará
//     console.log('Esto solo se verá un instante...');
//   };
//   return (
//     <form onSubmit={handleSubmit}>
//       <button type="submit">Enviar (¡Recarga la página!)</button>
//     </form>
//   );
// }
'''
  });
}

Future<void> insertReactJrLevel6Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Estilizado de Componentes',
    'topic': 'Estilos en React',
    'subtopic': 'Estilos en línea y clases CSS',
    'definition': '''
Estilizar tus componentes en React es esencial para que tu aplicación se vea bien. Hay varias maneras de aplicar estilos, y dos de las más básicas son los estilos en línea y el uso de clases CSS regulares.

¿Te estás preguntando por qué esto importa? 

En React, puedes aplicar estilos directamente a los elementos JSX utilizando el atributo `style`. Sin embargo, a diferencia del HTML tradicional donde el valor es una cadena, en JSX, el valor debe ser un objeto JavaScript. Las propiedades CSS se escriben en camelCase (por ejemplo, `backgroundColor` en lugar de `background-color`). Este enfoque es útil para estilos dinámicos que dependen del estado del componente o para estilos muy específicos de un solo elemento, pero no es ideal para grandes cantidades de CSS o para estilos reutilizables.

La otra forma es la que ya conoces del HTML: usar clases CSS. Puedes definir tus reglas CSS en archivos `.css` separados y luego aplicar esas clases a tus elementos JSX usando el atributo `className` (sí, `className` en lugar de `class` porque `class` es una palabra reservada en JavaScript). Esta es la forma más común de aplicar estilos estáticos y reutilizables en React, ya que puedes organizar tu CSS de forma modular y mantener una clara separación de preocupaciones. Puedes usar una sola clase, múltiples clases (separadas por espacios), o incluso combinar clases de forma condicional, lo que te da mucha flexibilidad. Es la base sobre la que se construyen métodos de estilizado más avanzados en React.
''',
    'code_example': r'''
// Componente de ejemplo con estilos en línea y clases CSS
import React, { useState } from 'react';
import './EstilosBasicos.css'; // Importa tu archivo CSS

function EstilosEnReact() {
  const [estaActivo, setEstaActivo] = useState(false);

  // Estilo en línea como objeto JavaScript
  const estiloBotonDinamico = {
    backgroundColor: estaActivo ? 'green' : 'gray',
    color: 'white',
    padding: '10px 20px',
    border: 'none',
    borderRadius: '5px',
    cursor: 'pointer',
    marginTop: '10px',
    fontSize: '1em',
  };

  return (
    <div className="contenedor-estilos" style={{ margin: '20px', padding: '20px', border: '2px solid #ddd' }}>
      <h2>Estilos en Línea y Clases CSS</h2>

      {/* Estilo en línea */}
      <p style={{ color: 'blue', fontSize: '1.2em', fontWeight: 'bold' }}>
        Este párrafo tiene estilos en línea.
      </p>

      {/* Uso de clases CSS definidas en EstilosBasicos.css */}
      <div className="tarjeta">
        <h3>Tarjeta con Estilos CSS</h3>
        <p className="texto-secundario">Este es un texto dentro de una tarjeta.</p>
        <button className="boton-primario">Botón Primario</button>
      </div>

      {/* Combinando estilos en línea y clases CSS condicionales */}
      <button
        style={estiloBotonDinamico} // Estilo en línea dinámico
        onClick={() => setEstaActivo(!estaActivo)}
        className={estaActivo ? 'boton-activo' : 'boton-inactivo'} // Clases CSS condicionales
      >
        {estaActivo ? 'Activo' : 'Inactivo'} (Estado: {estaActivo ? 'Verdadero' : 'Falso'})
      </button>

      <p className="texto-pie">
        Los estilos en línea son para casos específicos, las clases CSS para reutilización.
      </p>
    </div>
  );
}

// EstilosBasicos.css (contenido del archivo)
/*
.contenedor-estilos {
  font-family: Arial, sans-serif;
}

.tarjeta {
  background-color: #f0f0f0;
  border: 1px solid #ccc;
  padding: 15px;
  margin-bottom: 20px;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.tarjeta h3 {
  color: #333;
  margin-top: 0;
}

.texto-secundario {
  color: #666;
  font-style: italic;
}

.boton-primario {
  background-color: #007bff;
  color: white;
  padding: 8px 15px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.boton-primario:hover {
  background-color: #0056b3;
}

.boton-activo {
  border: 2px solid green;
}

.boton-inactivo {
  border: 2px solid red;
}

.texto-pie {
  font-size: 0.9em;
  color: #888;
  margin-top: 20px;
}
*/

// Uso en App.js
function App() {
  return (
    <div>
      <EstilosEnReact />
    </div>
  );
}

export default App;

// Ejemplo incorrecto de estilo en línea (usar string en lugar de objeto)
// function ComponenteMalo() {
//   return (
//     // Esto NO funciona en React. El valor de 'style' debe ser un objeto.
//     // <p style="color: red; font-size: 16px;">Texto</p>
//     <p>...</p>
//   );
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Estilizado de Componentes',
    'topic': 'Estilos en React',
    'subtopic': 'Uso de CSS Modules',
    'definition': '''
Los CSS Modules son una solución de estilizado en React que te permiten escribir CSS regular de una manera que evita conflictos de nombres entre clases. Es una forma de "localizar" tus estilos a componentes específicos, evitando que un estilo en un componente afecte accidentalmente a otro.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una aplicación grande donde varios desarrolladores trabajan en diferentes componentes. Si todos usan nombres de clase genéricos como `button` o `card`, es muy fácil que los estilos de un componente sobrescriban los de otro, lo que lleva a un CSS impredecible y difícil de depurar. CSS Modules resuelven esto al "hashear" (generar nombres únicos) automáticamente los nombres de tus clases CSS durante el proceso de construcción de tu aplicación. Por ejemplo, una clase `.button` en `MiComponente.module.css` podría convertirse en algo como `MiComponente_button_abc123`.

Para usar CSS Modules, simplemente nombras tus archivos CSS con la extensión `.module.css` (por ejemplo, `MiComponente.module.css`) y los importas en tu componente JavaScript. Cuando importas el archivo CSS, lo que obtienes es un objeto JavaScript donde las claves son tus nombres de clase originales y los valores son los nombres hasheados únicos. Luego, aplicas estos nombres únicos a tus elementos JSX. Esto garantiza que tus estilos son de alcance local, lo que significa que los estilos definidos en un CSS Module solo afectarán al componente que lo importa, haciendo que tu CSS sea más modular, predecible y fácil de mantener a escala.
''',
    'code_example': r'''
// Componente que usa CSS Modules
import React from 'react';
// Importa el archivo CSS Module. 'styles' será un objeto.
import styles from './BotonPersonalizado.module.css';

function BotonPersonalizado() {
  return (
    <div className={styles.contenedor}>
      {/* Usamos las clases importadas del objeto 'styles' */}
      <button className={styles.botonPrincipal}>
        Haz clic aquí
      </button>
      <p className={styles.textoInfo}>
        Este botón usa CSS Modules para evitar conflictos de nombres.
      </p>
      <button className={`${styles.botonPrincipal} ${styles.botonSecundario}`}>
        Botón Secundario
      </button>
    </div>
  );
}

// BotonPersonalizado.module.css (contenido del archivo)
/*
.contenedor {
  margin: 20px;
  padding: 20px;
  border: 1px solid #a0a0a0;
  border-radius: 8px;
  background-color: #f8f8f8;
  font-family: sans-serif;
}

.botonPrincipal {
  background-color: #4CAF50; /* Verde */
  color: white;
  padding: 10px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 1em;
  margin-right: 10px;
}

.botonPrincipal:hover {
  background-color: #45a049;
}

.textoInfo {
  font-size: 0.9em;
  color: #555;
  margin-top: 15px;
}

.botonSecundario {
  background-color: #008CBA; /* Azul */
}

.botonSecundario:hover {
  background-color: #007bb5;
}
*/

// Uso en App.js
function App() {
  return (
    <div>
      <BotonPersonalizado />
    </div>
  );
}

export default App;

// Ejemplo incorrecto (importar CSS Module como CSS global)
// import './BotonPersonalizado.module.css'; // Incorrecto: no obtendrías el objeto de clases
// function BadComponent() {
//   return (
//     <button className="botonPrincipal">
//       Esto NO usaría el nombre hasheado si no se importa como módulo.
//     </button>
//   );
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Estilizado de Componentes',
    'topic': 'Estilos en React',
    'subtopic': 'Introducción a styled-components y Emotion',
    'definition': '''
Más allá de los estilos en línea y CSS Modules, existen librerías como `styled-components` y `Emotion` que te permiten escribir CSS directamente dentro de tus archivos JavaScript, una técnica conocida como "CSS-in-JS". Esto fusiona la lógica de tus componentes con sus estilos de una manera muy potente.

No sé tú, pero a mí esto al principio me costó un poco cambiar mi mentalidad de cómo escribir CSS. ¿Te estás preguntando por qué esto importa? Estas librerías te permiten crear componentes de React que ya tienen estilos adjuntos. En lugar de aplicar clases CSS a elementos HTML, defines un "componente estilizado" que es, en sí mismo, un componente de React con estilos CSS. Por ejemplo, con `styled-components`, en lugar de un `div`, podrías crear un `styled.div` y pasarle tus reglas CSS usando plantillas de cadenas (template literals).

La gran ventaja de CSS-in-JS es el aislamiento total de los estilos. Al igual que CSS Modules, los nombres de clase son generados automáticamente para evitar conflictos. Pero además, obtienes:
* **Colocación de estilos:** Tus estilos están junto a tu componente, lo que facilita ver y entender cómo se ve y funciona un componente.
* **Estilos dinámicos:** Puedes pasar `props` directamente a tus componentes estilizados para cambiar sus estilos dinámicamente, lo que hace que la interfaz de usuario sea muy reactiva.
* **Remoción de estilos muertos:** Como los estilos están asociados a componentes, las herramientas de construcción pueden eliminar fácilmente el CSS que no se está utilizando.

`styled-components` y `Emotion` son dos de las librerías más populares que implementan CSS-in-JS, y ambas ofrecen una experiencia de desarrollo similar y muy productiva, ayudándote a construir sistemas de diseño escalables y mantener tu CSS organizado y sin conflictos.
''',
    'code_example': r'''
// Ejemplo con styled-components (necesita instalación: npm install styled-components)
import React from 'react';
import styled from 'styled-components';

// Creamos un componente de botón estilizado
const StyledButton = styled.button`
  background-color: #ff6347; /* Tomate */
  color: white;
  padding: 12px 25px;
  border: none;
  border-radius: 8px;
  cursor: pointer;
  font-size: 1.1em;
  transition: background-color 0.3s ease;

  &:hover {
    background-color: #e5533d;
  }

  /* Estilos condicionales basados en props */
  ${props => props.primary && `
    background-color: #4CAF50; /* Verde */
    &:hover {
      background-color: #45a049;
    }
  `}
`;

// Creamos un componente de tarjeta estilizado
const StyledCard = styled.div`
  background-color: white;
  border: 1px solid #ddd;
  border-radius: 10px;
  padding: 20px;
  margin: 20px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  display: flex;
  flex-direction: column;
  align-items: center;
  font-family: sans-serif;
`;

function EstilosConCSSinJS() {
  return (
    <StyledCard>
      <h2>Estilizado con styled-components</h2>
      <p>Estos componentes tienen estilos definidos directamente en JavaScript.</p>
      <StyledButton>Botón Normal</StyledButton>
      <StyledButton primary>Botón Primario</StyledButton>
      <p>Los estilos son dinámicos y están encapsulados.</p>
    </StyledCard>
  );
}

export default EstilosConCSSinJS;


// Ejemplo con Emotion (necesita instalación: npm install @emotion/react @emotion/styled)
// import React from 'react';
// import styled from '@emotion/styled';
// import { css } from '@emotion/react'; // Para estilos en línea o condicionales avanzados
//
// const EmotionButton = styled.button`
//   background-color: dodgerblue;
//   color: white;
//   padding: 10px 20px;
//   border: none;
//   border-radius: 5px;
//   cursor: pointer;
//
//   &:hover {
//     background-color: #1e90ff;
//   }
// `;
//
// const EmotionContainer = styled.div`
//   padding: 15px;
//   background-color: #eee;
//   border-radius: 10px;
//   margin-top: 20px;
// `;
//
// function EmotionExample() {
//   const isLarge = true;
//   return (
//     <EmotionContainer
//       css={css` /* Ejemplo de uso de 'css' prop para estilos condicionales */
//         ${isLarge && 'font-size: 1.2em; border: 2px solid purple;'}
//       `}
//     >
//       <EmotionButton>Emotion Button</EmotionButton>
//       <p>Esto es un ejemplo con Emotion.</p>
//     </EmotionContainer>
//   );
// }
//
// // Uso en App.js (descomentar para probar)
// // function App() {
// //   return (
// //     <div>
// //       <EstilosConCSSinJS />
// //       <EmotionExample />
// //     </div>
// //   );
// // }
// // export default App;
'''
  });
}
