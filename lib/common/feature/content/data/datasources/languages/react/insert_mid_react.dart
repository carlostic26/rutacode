import 'package:sqflite_common/sqlite_api.dart';

Future<void> insertReactMidLevel1Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Hooks Avanzados',
    'topic': 'Hooks Comunes',
    'subtopic': 'Uso de useContext para manejo de contexto',
    'definition': '''
El Hook `useContext` en React es tu pasaporte para el manejo eficiente del "contexto" de tu aplicación. El contexto es una forma de compartir datos (como un tema de color, la información del usuario autenticado, o la configuración de idioma) entre componentes sin tener que pasar props manualmente a través de cada nivel del árbol de componentes.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una aplicación donde tienes una barra de navegación (Navbar), un componente de perfil de usuario, y quizás varios otros componentes que necesitan saber si el usuario está logueado y cuál es su nombre. Sin `useContext`, tendrías que pasar la prop `currentUser` desde el componente más alto hasta cada componente hijo que la necesite, incluso si esos hijos no la usan directamente, solo para pasarla a sus propios hijos. Esto se conoce como "prop drilling" y puede hacer que tu código sea tedioso de mantener y leer. `useContext` resuelve este problema. Primero, defines un Contexto usando `React.createContext()`. Luego, un componente "Proveedor" (`.Provider`) envuelve la parte de tu árbol de componentes donde quieres que el contexto esté disponible y le pasa el valor que desees. Finalmente, cualquier componente hijo (no importa cuán profundo esté) puede usar `useContext(MiContexto)` para acceder directamente a ese valor, sin necesidad de props intermedias. Es una herramienta poderosa para manejar estados globales o semi-globales de tu aplicación de una manera limpia y eficiente.
''',
    'code_example': r'''
// 1. Crear el Contexto (ThemeContext.js)
import React, { createContext, useState, useContext } from 'react';

// Creamos un nuevo Contexto
const ThemeContext = createContext(null);

// Componente Proveedor del Contexto
export function ThemeProvider({ children }) {
  const [theme, setTheme] = useState('light'); // Estado del tema
  const toggleTheme = () => {
    setTheme(prevTheme => (prevTheme === 'light' ? 'dark' : 'light'));
  };

  const value = { theme, toggleTheme }; // Objeto con el valor del contexto

  return (
    <ThemeContext.Provider value={value}>
      {children}
    </ThemeContext.Provider>
  );
}

// Hook personalizado para consumir el contexto más fácilmente
export function useTheme() {
  return useContext(ThemeContext);
}

// 2. Componente que consume el contexto (BotonCambiarTema.js)
// import React from 'react';
// import { useTheme } from './ThemeContext'; // Importa el hook personalizado

function BotonCambiarTema() {
  const { theme, toggleTheme } = useTheme(); // Consumimos el contexto con el hook

  const estiloBoton = {
    padding: '10px 20px',
    borderRadius: '5px',
    border: 'none',
    cursor: 'pointer',
    backgroundColor: theme === 'light' ? '#f0f0f0' : '#333',
    color: theme === 'light' ? '#333' : 'white',
    marginTop: '10px',
  };

  return (
    <button style={estiloBoton} onClick={toggleTheme}>
      Cambiar a Tema {theme === 'light' ? 'Oscuro' : 'Claro'}
    </button>
  );
}

// 3. Componente que muestra el tema (ContenidoConTema.js)
// import React from 'react';
// import { useTheme } from './ThemeContext';

function ContenidoConTema() {
  const { theme } = useTheme(); // Consumimos el contexto

  const estiloContenido = {
    backgroundColor: theme === 'light' ? 'white' : '#555',
    color: theme === 'light' ? '#333' : 'white',
    padding: '20px',
    border: `1px solid ${theme === 'light' ? '#ccc' : '#888'}`,
    borderRadius: '8px',
    marginTop: '20px',
  };

  return (
    <div style={estiloContenido}>
      <h3>Este contenido se adapta al tema: {theme.toUpperCase()}</h3>
      <p>Ya no necesitamos pasar el tema por props.</p>
    </div>
  );
}

// 4. Componente principal que usa el Proveedor (App.js)
function App() {
  return (
    <ThemeProvider> {/* Envolvemos los componentes que necesitan el contexto */}
      <div style={{ fontFamily: 'Arial, sans-serif', padding: '20px' }}>
        <h1>Uso de useContext para Temas</h1>
        <BotonCambiarTema />
        <ContenidoConTema />
        <p>El tema se comparte globalmente sin prop drilling.</p>
      </div>
    </ThemeProvider>
  );
}

export default App;

// Ejemplo incorrecto (prop drilling en lugar de context)
// function Abuelo() {
//   const [theme, setTheme] = useState('light');
//   return <Padre theme={theme} setTheme={setTheme} />;
// }
// function Padre({ theme, setTheme }) {
//   return <Hijo theme={theme} setTheme={setTheme} />;
// }
// function Hijo({ theme, setTheme }) {
//   return (
//     <button onClick={() => setTheme(theme === 'light' ? 'dark' : 'light')}>
//       Cambiar Tema (Prop Drilling)
//     </button>
//   );
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Hooks Avanzados',
    'topic': 'Hooks Comunes',
    'subtopic': 'Uso de useReducer para manejo de estado complejo',
    'definition': '''
El Hook `useReducer` es una alternativa a `useState` para el manejo de estado, especialmente útil cuando la lógica de actualización del estado es compleja, involucra múltiples sub-valores o cuando el próximo estado depende del estado anterior. Está inspirado en el patrón Redux.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en un carrito de compras. Añadir un producto, eliminarlo, actualizar la cantidad, vaciar el carrito... Todas estas acciones modifican el mismo estado del carrito de diferentes maneras. Si usaras `useState` para cada uno, tu lógica de actualización de estado podría volverse muy dispersa y difícil de seguir. `useReducer` centraliza toda esta lógica en una sola función llamada "reducer". Un `reducer` es una función pura que toma el estado actual y una "acción" (un objeto que describe lo que acaba de pasar) y devuelve el nuevo estado. `useReducer` te devuelve el estado actual y una función `dispatch` que usas para "disparar" acciones. Cuando llamas a `dispatch` con una acción, React pasa esa acción a tu función `reducer`, que calcula el nuevo estado y re-renderiza el componente. Esto hace que las actualizaciones de estado sean más predecibles, testeables y fáciles de depurar, especialmente en aplicaciones con lógica de estado compleja. Es como un mini-Redux integrado directamente en tu componente.
''',
    'code_example': r'''
// Ejemplo de uso de useReducer para manejo de estado complejo (contador avanzado)
import React, { useReducer } from 'react';

// 1. La función Reducer
// Es una función pura que toma el 'estado' actual y una 'acción'
// y devuelve el NUEVO estado. NO debe modificar el estado directamente.
function contadorReducer(state, action) {
  switch (action.type) {
    case 'incrementar':
      return { count: state.count + 1 };
    case 'decrementar':
      return { count: state.count - 1 };
    case 'resetear':
      return { count: action.payload }; // 'payload' es el valor que se pasa con la acción
    case 'sumar':
      return { count: state.count + action.payload };
    default:
      return state; // Devuelve el estado actual si la acción no es reconocida
  }
}

function ContadorConReducer() {
  // 2. Inicializar useReducer
  // useReducer(reducerFunction, initialState)
  // Devuelve: [currentState, dispatchFunction]
  const [estadoContador, dispatch] = useReducer(contadorReducer, { count: 0 });

  return (
    <div style={{ border: '2px solid purple', padding: '20px', margin: '20px' }}>
      <h2>Contador con useReducer: {estadoContador.count}</h2>
      <button onClick={() => dispatch({ type: 'incrementar' })}>
        Incrementar
      </button>
      <button onClick={() => dispatch({ type: 'decrementar' })}>
        Decrementar
      </button>
      <button onClick={() => dispatch({ type: 'resetear', payload: 0 })}>
        Resetear a 0
      </button>
      <button onClick={() => dispatch({ type: 'sumar', payload: 5 })}>
        Sumar 5
      </button>
      <p>
        Observa cómo las acciones describen "lo que pasó", y el reducer decide "cómo cambia el estado".
      </p>
    </div>
  );
}

// Ejemplo más complejo: un gestor de tareas (similar a Redux)
function tareasReducer(state, action) {
  switch (action.type) {
    case 'agregar_tarea':
      return [
        ...state,
        { id: Date.now(), texto: action.payload, completada: false }
      ];
    case 'alternar_tarea':
      return state.map(tarea =>
        tarea.id === action.payload
          ? { ...tarea, completada: !tarea.completada }
          : tarea
      );
    case 'eliminar_tarea':
      return state.filter(tarea => tarea.id !== action.payload);
    default:
      return state;
  }
}

function GestorDeTareas() {
  const [tareas, dispatch] = useReducer(tareasReducer, []);
  const [nuevaTareaTexto, setNuevaTareaTexto] = useState('');

  const handleAddTask = (e) => {
    e.preventDefault();
    if (nuevaTareaTexto.trim()) {
      dispatch({ type: 'agregar_tarea', payload: nuevaTareaTexto.trim() });
      setNuevaTareaTexto('');
    }
  };

  return (
    <div style={{ border: '2px solid maroon', padding: '20px', margin: '20px' }}>
      <h2>Gestor de Tareas con useReducer</h2>
      <form onSubmit={handleAddTask}>
        <input
          type="text"
          value={nuevaTareaTexto}
          onChange={(e) => setNuevaTareaTexto(e.target.value)}
          placeholder="Añadir nueva tarea..."
        />
        <button type="submit">Añadir Tarea</button>
      </form>
      <ul>
        {tareas.map(tarea => (
          <li key={tarea.id} style={{ textDecoration: tarea.completada ? 'line-through' : 'none' }}>
            <span onClick={() => dispatch({ type: 'alternar_tarea', payload: tarea.id })} style={{ cursor: 'pointer', marginRight: '10px' }}>
              {tarea.texto}
            </span>
            <button onClick={() => dispatch({ type: 'eliminar_tarea', payload: tarea.id })}>
              X
            </button>
          </li>
        ))}
      </ul>
      <p>
        El estado de las tareas se gestiona de forma centralizada por el reducer.
      </p>
    </div>
  );
}

// Uso en App.js
function App() {
  return (
    <div>
      <ContadorConReducer />
      <GestorDeTareas />
    </div>
  );
}

export default App;

// Ejemplo incorrecto (mutar el estado directamente dentro del reducer)
// function badReducer(state, action) {
//   if (action.type === 'incrementar') {
//     state.count++; // ¡MAL! Mutación directa. Siempre devuelve un nuevo objeto de estado.
//     return state;
//   }
//   return state;
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Hooks Avanzados',
    'topic': 'Hooks Comunes',
    'subtopic': 'Uso de useMemo y useCallback para optimización',
    'definition': '''
Los Hooks `useMemo` y `useCallback` son herramientas de optimización en React que te ayudan a evitar re-renderizados innecesarios y cálculos costosos. Ambos funcionan memoizando (memorizando) valores o funciones, de modo que React solo los recalcula o recrea cuando sus dependencias cambian.

No sé tú, pero a mí esto al principio me costó un poco entender cuándo y cómo usarlos. ¿Te estás preguntando por qué esto importa? En React, cuando el estado o las props de un componente cambian, este se re-renderiza, y por defecto, también lo hacen todos sus hijos. Si tienes cálculos complejos o funciones que se pasan como props a componentes hijos memoizados (`React.memo`), estas re-creaciones de valores o funciones pueden ser costosas y anular las optimizaciones.

* **`useMemo`:** Se usa para memoizar un valor calculado. Recibe una función que retorna un valor y un array de dependencias. React solo volverá a ejecutar la función y recalculará el valor si alguna de las dependencias en el array ha cambiado. Si las dependencias no han cambiado, `useMemo` devolverá el valor memoizado de la renderización anterior. Esto es útil para cálculos intensivos.

* **`useCallback`:** Se usa para memoizar una función. Recibe una función y un array de dependencias. React solo volverá a crear la función si alguna de las dependencias en el array ha cambiado. Si las dependencias no han cambiado, `useCallback` devolverá la misma instancia de la función de la renderización anterior. Esto es crucial cuando pasas funciones como `props` a componentes hijos optimizados con `React.memo`, ya que evita que el hijo se re-renderice innecesariamente solo porque se le pasó una nueva instancia de la misma función en cada render.

Ambos Hooks son herramientas de rendimiento y no siempre son necesarios. De hecho, su uso excesivo puede añadir complejidad sin un beneficio real. Deben usarse cuando has identificado un problema de rendimiento específico (por ejemplo, usando React DevTools Profiler) y sabes que un cálculo o una función se está re-creando o re-ejecutando con demasiada frecuencia.
''',
    'code_example': r'''
// Ejemplo de uso de useMemo y useCallback
import React, { useState, useMemo, useCallback } from 'react';

// Componente hijo que solo se re-renderiza si sus props cambian
// Envolvemos con React.memo para optimizarlo
const ListaDeItemsMemoizada = React.memo(({ items, onItemClick }) => {
  console.log('  Renderizando ListaDeItemsMemoizada...');
  return (
    <ul>
      {items.map(item => (
        <li key={item.id} onClick={() => onItemClick(item.id)}>
          {item.nombre}
        </li>
      ))}
    </ul>
  );
});

function OptimizacionHooks() {
  const [conteo, setConteo] = useState(0);
  const [filtro, setFiltro] = useState('');

  const todosLosItems = [
    { id: 1, nombre: 'Manzana' },
    { id: 2, nombre: 'Banana' },
    { id: 3, nombre: 'Cereza' },
    { id: 4, nombre: 'Dátil' },
    { id: 5, nombre: 'Uva' },
  ];

  // 1. useMemo para memoizar un valor calculado
  // Solo se recalcula 'itemsFiltrados' si 'todosLosItems' o 'filtro' cambian
  const itemsFiltrados = useMemo(() => {
    console.log('Calculando items filtrados (useMemo)...');
    return todosLosItems.filter(item =>
      item.nombre.toLowerCase().includes(filtro.toLowerCase())
    );
  }, [todosLosItems, filtro]); // Dependencias: recalcular si estos valores cambian

  // 2. useCallback para memoizar una función
  // Solo se re-crea 'handleItemClick' si 'setConteo' cambia (que nunca lo hace)
  const handleItemClick = useCallback((id) => {
    console.log(`Clic en el item con ID: ${id}`);
    setConteo(prevConteo => prevConteo + 1);
  }, []); // Dependencias: array vacío significa que la función solo se crea una vez

  console.log('Renderizando componente padre OptimizacionHooks...');

  return (
    <div style={{ border: '2px solid #555', padding: '20px', margin: '20px' }}>
      <h2>Optimización con useMemo y useCallback</h2>

      <p>Conteo de clics en ítems: {conteo}</p>
      <button onClick={() => setConteo(c => c + 1)}>
        Incrementar Conteo Padre (sin afectar lista)
      </button>

      <div>
        <label>
          Filtrar Items:
          <input
            type="text"
            value={filtro}
            onChange={(e) => setFiltro(e.target.value)}
          />
        </label>
      </div>

      <ListaDeItemsMemoizada items={itemsFiltrados} onItemClick={handleItemClick} />

      <p>
        Observa la consola: "Calculando items filtrados" solo aparece al cambiar el filtro.
        "Renderizando ListaDeItemsMemoizada" solo aparece al cambiar el filtro o si el conteo cambia.
        La función `handleItemClick` no se re-crea en cada render del padre.
      </p>
    </div>
  );
}

// Uso en App.js
function App() {
  return (
    <div>
      <OptimizacionHooks />
    </div>
  );
}

export default App;

// Ejemplo incorrecto (uso de useMemo para valores triviales o sin dependencias)
// const valorTrivial = useMemo(() => 1 + 1, []); // No vale la pena memoizar un valor fijo
// const miObjeto = useMemo(() => ({ a: 1, b: 2 }), []); // Si el objeto no cambia nunca, mejor declararlo fuera.

// Ejemplo incorrecto (olvidar useCallback al pasar función a un hijo memoizado)
// const HijoNoMemoizado = React.memo(({ onClick }) => {
//   console.log('Renderizando HijoNoMemoizado...');
//   return <button onClick={onClick}>Click Me</button>;
// });
// function PadreSinCallback() {
//   const [count, setCount] = useState(0);
//   // Esta función se re-crea en cada render, forzando a HijoNoMemoizado a re-renderizar
//   const handleClick = () => setCount(count + 1);
//   return <HijoNoMemoizado onClick={handleClick} />;
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Hooks Avanzados',
    'topic': 'Hooks Personalizados',
    'subtopic': 'Creación de hooks personalizados',
    'definition': '''
Los Hooks personalizados en React son funciones JavaScript que te permiten extraer lógica de estado o efectos reutilizable de tus componentes funcionales. Comienzan con el prefijo `use` (por ejemplo, `useMiHook`) y pueden llamar a otros Hooks (como `useState`, `useEffect`, `useRef`, etc.).

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una situación donde tienes varias funciones de componente que necesitan la misma lógica, como obtener datos de una API, manejar el estado de un formulario, o subscribirse a un evento del navegador. Antes de los Hooks, esto se manejaba con patrones como "render props" o "higher-order components", que a menudo resultaban en un "envoltorio" excesivo de componentes (lo que se conoce como "wrapper hell"). Los Hooks personalizados te permiten compartir esta lógica sin modificar la jerarquía de componentes. Simplemente creas una función JavaScript que encapsula esa lógica, y luego la puedes usar en cualquier componente funcional. Cuando llamas a un Hook personalizado, estás compartiendo la lógica *con estado*, no el estado en sí. Cada vez que usas un Hook personalizado en un componente, obtienes una instancia separada y aislada de ese estado. Es una forma elegante y poderosa de mantener tu código DRY (Don't Repeat Yourself) y de hacer que tus componentes sean más legibles y enfocados en su propósito principal.
''',
    'code_example': r'''
// 1. Definición de un Hook Personalizado (useContador.js)
import { useState, useEffect } from 'react';

// Un hook personalizado para manejar un contador
function useContador(initialCount = 0) {
  const [count, setCount] = useState(initialCount);

  const increment = () => setCount(prevCount => prevCount + 1);
  const decrement = () => setCount(prevCount => prevCount - 1);
  const reset = () => setCount(initialCount);

  // Un efecto dentro del hook, por ejemplo para loggear el conteo
  useEffect(() => {
    console.log(`El contador actual es: ${count}`);
  }, [count]); // El efecto se ejecuta cuando 'count' cambia

  // El hook devuelve un objeto con el estado y las funciones para manipularlo
  return { count, increment, decrement, reset };
}

export default useContador;


// 2. Uso del Hook Personalizado en un Componente (ComponenteContador.js)
// import React from 'react';
// import useContador from './useContador'; // Importamos nuestro hook personalizado

function ComponenteContador() {
  // Usamos el hook, como cualquier otro hook integrado de React
  const { count, increment, decrement, reset } = useContador(10); // Empezamos en 10

  return (
    <div style={{ border: '2px solid navy', padding: '20px', margin: '20px' }}>
      <h2>Contador Personalizado: {count}</h2>
      <button onClick={increment}>Incrementar</button>
      <button onClick={decrement}>Decrementar</button>
      <button onClick={reset}>Resetear</button>
      <p>Este componente usa nuestro propio hook `useContador`.</p>
    </div>
  );
}


// Otro ejemplo: un hook para detectar el tamaño de la ventana (useWindowSize.js)
// import { useState, useEffect } from 'react';

function useWindowSize() {
  const [windowSize, setWindowSize] = useState({
    width: undefined,
    height: undefined,
  });

  useEffect(() => {
    function handleResize() {
      setWindowSize({
        width: window.innerWidth,
        height: window.innerHeight,
      });
    }

    window.addEventListener('resize', handleResize); // Suscribirse al evento de redimensionamiento
    handleResize(); // Llamar una vez para obtener el tamaño inicial

    return () => window.removeEventListener('resize', handleResize); // Limpiar al desmontar
  }, []); // Array vacío asegura que solo se ejecuta una vez al montar

  return windowSize;
}

// Componente que usa el hook useWindowSize
function DetectorTamanoVentana() {
  const { width, height } = useWindowSize();

  return (
    <div style={{ border: '2px solid teal', padding: '20px', margin: '20px' }}>
      <h2>Tamaño de la Ventana</h2>
      <p>Ancho: {width}px</p>
      <p>Alto: {height}px</p>
      <p>Redimensiona la ventana del navegador para ver cómo cambian los valores.</p>
    </div>
  );
}


// Uso en App.js
function App() {
  return (
    <div>
      <ComponenteContador />
      <DetectorTamanoVentana />
    </div>
  );
}

export default App;

// Ejemplo incorrecto (un hook que no empieza con 'use')
// function getContador() { // Esto no es un hook válido según las reglas de React
//   const [count, setCount] = useState(0); // Esto lanzaría un error ESLint
//   return { count, setCount };
// }
// Los hooks DEBEN empezar con 'use' para que React sepa que siguen las reglas de los Hooks.
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Hooks Avanzados',
    'topic': 'Hooks Personalizados',
    'subtopic': 'Reutilización de lógica entre componentes',
    'definition': '''
La principal ventaja de los Hooks personalizados es su capacidad para reutilizar lógica con estado entre diferentes componentes sin incurrir en los problemas de "prop drilling" o la complejidad de los patrones de componentes de orden superior y render props.

Seguramente pensarás de qué va todo esto... 

Pensemos por un momento en un escenario donde necesitas gestionar un formulario de entrada en varios lugares de tu aplicación. Cada formulario necesita su propio estado para los campos, manejadores de cambio, y quizás lógica de validación. Sin Hooks personalizados, tendrías que duplicar esta lógica en cada componente de formulario. Con un Hook personalizado como `useFormInput` (que maneje el valor y los cambios de un input) o `useFormValidation` (que encapsule la lógica de validación), puedes escribir la lógica una sola vez y luego simplemente llamarlos en cada componente que los necesite.

La clave es que, aunque la *lógica* se comparte, el *estado* que manejan los Hooks es independiente para cada componente que los usa. Es decir, si usas `useContador` en dos componentes diferentes, cada componente tendrá su propio `count` y sus propias funciones `increment`, `decrement`, etc., que operan sobre su propio estado aislado. Esto mantiene la modularidad y evita efectos secundarios no deseados. Además, los Hooks personalizados pueden usar cualquier otro Hook de React, lo que les da una flexibilidad enorme para construir abstracciones complejas y encapsular comportamientos que de otro modo serían difíciles de compartir. Es un cambio de paradigma que ha simplificado enormemente la forma en que los desarrolladores de React construyen aplicaciones.
''',
    'code_example': r'''
// Hook Personalizado para manejar el estado de un input (useFormInput.js)
import { useState } from 'react';

function useFormInput(initialValue) {
  const [value, setValue] = useState(initialValue);

  const handleChange = (e) => {
    setValue(e.target.value);
  };

  const reset = () => {
    setValue(initialValue);
  };

  return {
    value,
    onChange: handleChange,
    reset,
  };
}

export default useFormInput;


// Componente 1: Formulario de Login (usa useFormInput)
// import React from 'react';
// import useFormInput from './useFormInput';

function FormularioLogin() {
  const email = useFormInput('');
  const password = useFormInput('');

  const handleSubmit = (e) => {
    e.preventDefault();
    alert(`Intentando iniciar sesión con:\nEmail: ${email.value}\nContraseña: ${password.value}`);
    email.reset();
    password.reset();
  };

  return (
    <div style={{ border: '2px solid darkgreen', padding: '20px', margin: '20px' }}>
      <h2>Formulario de Login</h2>
      <form onSubmit={handleSubmit}>
        <div>
          <label>
            Email:
            <input type="email" {...email} /> {/* Spreads props from useFormInput */}
          </label>
        </div>
        <div>
          <label>
            Contraseña:
            <input type="password" {...password} />
          </label>
        </div>
        <button type="submit">Login</button>
      </form>
      <p>Los campos se controlan mediante el hook `useFormInput`.</p>
    </div>
  );
}


// Componente 2: Formulario de Contacto (también usa useFormInput)
// import React from 'react';
// import useFormInput from './useFormInput';

function FormularioContacto() {
  const nombre = useFormInput('');
  const mensaje = useFormInput('');

  const handleSubmit = (e) => {
    e.preventDefault();
    alert(`Mensaje de:\n${nombre.value}\nMensaje: ${mensaje.value}`);
    nombre.reset();
    mensaje.reset();
  };

  return (
    <div style={{ border: '2px solid darkblue', padding: '20px', margin: '20px' }}>
      <h2>Formulario de Contacto</h2>
      <form onSubmit={handleSubmit}>
        <div>
          <label>
            Nombre:
            <input type="text" {...nombre} />
          </label>
        </div>
        <div>
          <label>
            Mensaje:
            <textarea {...mensaje} rows="4"></textarea>
          </label>
        </div>
        <button type="submit">Enviar</button>
      </form>
      <p>Ambos formularios reutilizan la lógica de manejo de input.</p>
    </div>
  );
}

// Uso en App.js
function App() {
  return (
    <div>
      <FormularioLogin />
      <FormularioContacto />
    </div>
  );
}

export default App;

// Ejemplo incorrecto (duplicar lógica en lugar de usar un hook)
// function FormularioLoginDuplicado() {
//   const [email, setEmail] = useState('');
//   const [password, setPassword] = useState('');
//
//   const handleEmailChange = (e) => setEmail(e.target.value);
//   const handlePasswordChange = (e) => setPassword(e.target.value);
//
//   // ... el resto de la lógica duplicada
//   return <p>...</p>
// }
// Cada formulario debería tener su propia copia de la lógica del input, lo que es ineficiente.
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Hooks Avanzados',
    'topic': 'Hooks Personalizados',
    'subtopic': 'Buenas prácticas en la creación de hooks',
    'definition': '''
Crear Hooks personalizados es una habilidad valiosa, pero para que sean realmente útiles y mantengas tu código limpio, es importante seguir algunas buenas prácticas. Estas reglas no son caprichos, sino pautas que te ayudarán a escribir Hooks robustos, legibles y fáciles de mantener.

Vamos a ver de qué se trata todo esto... 

Primero y principal: **nombra tus Hooks personalizados con el prefijo `use`**. Esto es una convención de React que permite a React (y a las herramientas de linting) saber que esa función sigue las "Reglas de los Hooks", lo que es crucial para su correcto funcionamiento y para la depuración. Además, asegura que un Hook personalizado no debe llamarse dentro de bucles, condiciones o funciones anidadas; siempre debe ser llamado en la parte superior de tu componente funcional o de otro Hook personalizado.

Otras buenas prácticas incluyen:
* **Encapsula lógica específica:** Un Hook personalizado debe hacer una cosa y hacerla bien. Si tu Hook empieza a hacer demasiadas cosas, considera dividirlo en Hooks más pequeños y especializados.
* **Recibe y devuelve lo necesario:** Pasa las dependencias y configuraciones como argumentos al Hook, y devuelve solo los valores y funciones que el componente que lo usa necesita. Evita devolver cosas que no sean directamente relevantes para el consumidor.
* **Manejo de efectos y limpieza:** Si tu Hook utiliza `useEffect`, asegúrate de que maneja correctamente la limpieza de recursos (como suscripciones, temporizadores, o listeners de eventos) en su función de retorno, para evitar fugas de memoria.
* **Prueba tu Hook:** Los Hooks personalizados son unidades de lógica reutilizable, por lo que deberían ser testeables de forma aislada, asegurando que su comportamiento sea predecible.
* **Documenta tu Hook:** Describe claramente qué hace tu Hook, qué argumentos espera, qué devuelve, y cualquier efecto secundario o restricción.

Seguir estas pautas hará que tus Hooks personalizados sean un activo invaluable en tu caja de herramientas de desarrollo React, permitiéndote construir aplicaciones más limpias, modulares y mantenibles.
''',
    'code_example': r'''
// Ejemplo de buenas prácticas en la creación de hooks

// 1. Nombra el hook con 'use' y encapsula lógica específica
// useLocalStorage.js
import { useState, useEffect } from 'react';

// Un hook para manejar el estado persistente en localStorage
function useLocalStorage(key, initialValue) {
  // Estado para almacenar el valor
  const [value, setValue] = useState(() => {
    try {
      const item = window.localStorage.getItem(key);
      return item ? JSON.parse(item) : initialValue;
    } catch (error) {
      console.error(error);
      return initialValue;
    }
  });

  // Efecto para sincronizar el estado con localStorage
  useEffect(() => {
    try {
      window.localStorage.setItem(key, JSON.stringify(value));
    } catch (error) {
      console.error(error);
    }
  }, [key, value]); // Dependencias: actualizar localStorage si 'key' o 'value' cambian

  // Devuelve el valor y la función para actualizarlo (como useState)
  return [value, setValue];
}

export default useLocalStorage;


// 2. Componente que usa el hook (configuracionUsuario.js)
// import React from 'react';
// import useLocalStorage from './useLocalStorage';

function ConfiguracionUsuario() {
  // Usamos el hook para manejar el tema y el nombre de usuario persistente
  const [tema, setTema] = useLocalStorage('appTheme', 'light');
  const [nombreUsuario, setNombreUsuario] = useLocalStorage('userName', 'Invitado');

  const handleTemaChange = () => {
    setTema(prevTema => (prevTema === 'light' ? 'dark' : 'light'));
  };

  const handleNombreChange = (e) => {
    setNombreUsuario(e.target.value);
  };

  const estiloContenedor = {
    backgroundColor: tema === 'light' ? '#f0f0f0' : '#333',
    color: tema === 'light' ? '#333' : 'white',
    padding: '20px',
    margin: '20px',
    border: '1px solid #ccc',
    borderRadius: '8px',
  };

  return (
    <div style={estiloContenedor}>
      <h2>Configuración de Usuario (Persistente)</h2>
      <p>Hola, {nombreUsuario}!</p>
      <label>
        Tu Nombre:
        <input type="text" value={nombreUsuario} onChange={handleNombreChange} />
      </label>
      <br /><br />
      <p>Tema Actual: {tema.toUpperCase()}</p>
      <button onClick={handleTemaChange}>
        Cambiar a Tema {tema === 'light' ? 'Oscuro' : 'Claro'}
      </button>
      <p>
        El nombre y el tema se guardan en el almacenamiento local del navegador
        y se cargan automáticamente al recargar la página.
      </p>
    </div>
  );
}


// Uso en App.js
function App() {
  return (
    <div>
      <ConfiguracionUsuario />
    </div>
  );
}

export default App;

// Ejemplo incorrecto (no usar el prefijo 'use' o violar las reglas de los hooks)
// function localStorageHook(key, initialValue) { // Error: No empieza con 'use'
//   const [value, setValue] = useState(initialValue);
//   return [value, setValue];
// }

// function BadComponente() {
//   // Error: Llamar a un hook dentro de una condición
//   if (algunaCondicion) {
//     const [count, setCount] = useState(0);
//   }
//   return <p>...</p>;
// }
'''
  });
}

Future<void> insertReactMidLevel2Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Enrutamiento y Navegación',
    'topic': 'React Router',
    'subtopic': 'Configuración de rutas con react-router-dom',
    'definition': '''
`React Router` es una de las librerías más populares y esenciales para manejar el enrutamiento en aplicaciones de React de una sola página (SPA). Te permite crear rutas que corresponden a diferentes vistas o componentes en tu aplicación, sin que el navegador tenga que recargar toda la página.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una página web tradicional. Cuando haces clic en un enlace, el navegador descarga una página HTML completamente nueva. En una SPA de React, queremos una experiencia más fluida, donde la URL cambie, pero solo una parte de la interfaz de usuario se actualice dinámicamente. `React Router` hace esto posible. Al instalar `react-router-dom`, obtienes acceso a componentes como `BrowserRouter` (que usa la API de historial del navegador para mantener la UI sincronizada con la URL), `Routes` (un contenedor para tus rutas) y `Route` (para definir una ruta individual que renderiza un componente específico cuando la URL coincide). Básicamente, le dices a `React Router` qué componente debe mostrar para cada URL que definas, y él se encarga de cambiar la vista de forma eficiente. Esto es fundamental para construir aplicaciones web complejas con múltiples secciones y una navegación clara.
''',
    'code_example': r'''
// 1. Instalar react-router-dom: npm install react-router-dom

// index.js o App.js (Componente principal)
import React from 'react';
import { BrowserRouter, Routes, Route, Link } from 'react-router-dom';
import './App.css'; // Para estilos básicos de la navegación

// Componentes de ejemplo para las rutas
function Home() {
  return (
    <div className="page-content">
      <h2>Página de Inicio</h2>
      <p>Bienvenido a nuestra aplicación React.</p>
    </div>
  );
}

function About() {
  return (
    <div className="page-content">
      <h2>Acerca de Nosotros</h2>
      <p>Somos una empresa dedicada a la enseñanza de React.</p>
    </div>
  );
}

function Contact() {
  return (
    <div className="page-content">
      <h2>Contacto</h2>
      <p>Puedes contactarnos en info@example.com</p>
    </div>
  );
}

function NotFound() {
  return (
    <div className="page-content" style={{ color: 'red' }}>
      <h2>404 - Página no encontrada</h2>
      <p>La URL que has solicitado no existe.</p>
    </div>
  );
}

function App() {
  return (
    <BrowserRouter> {/* Envuelve toda tu aplicación para habilitar el enrutamiento */}
      <nav className="navbar">
        <ul className="nav-list">
          <li className="nav-item">
            <Link to="/" className="nav-link">Inicio</Link> {/* Enlace a la ruta raíz */}
          </li>
          <li className="nav-item">
            <Link to="/about" className="nav-link">Acerca de</Link>
          </li>
          <li className="nav-item">
            <Link to="/contact" className="nav-link">Contacto</Link>
          </li>
          <li className="nav-item">
            <Link to="/non-existent" className="nav-link">Ir a 404</Link>
          </li>
        </ul>
      </nav>

      {/* Define tus rutas dentro de <Routes> */}
      <Routes>
        {/* Route con 'element' para el componente a renderizar */}
        <Route path="/" element={<Home />} />
        <Route path="/about" element={<About />} />
        <Route path="/contact" element={<Contact />} />
        {/* Ruta para capturar cualquier URL que no coincida */}
        <Route path="*" element={<NotFound />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;

// App.css (para dar un poco de estilo a la navegación)
/*
.navbar {
  background-color: #333;
  padding: 10px 0;
}

.nav-list {
  list-style-type: none;
  margin: 0;
  padding: 0;
  display: flex;
  justify-content: center;
}

.nav-item {
  margin: 0 15px;
}

.nav-link {
  color: white;
  text-decoration: none;
  font-weight: bold;
  padding: 5px 10px;
  border-radius: 4px;
  transition: background-color 0.3s ease;
}

.nav-link:hover {
  background-color: #555;
}

.page-content {
  padding: 30px;
  text-align: center;
  border: 1px dashed #ccc;
  margin: 20px;
  border-radius: 8px;
  background-color: #f9f9f9;
}
*/

// Ejemplo incorrecto (usar <a> tags sin React Router para navegación interna)
// function NavIncorrecta() {
//   return (
//     <nav>
//       {/* Esto recargaría la página, no es una SPA */}
//       <a href="/about">Acerca de (Incorrecto)</a>
//     </nav>
//   );
// }
// Siempre usa <Link> o useNavigate para navegación interna con React Router.
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Enrutamiento y Navegación',
    'topic': 'React Router',
    'subtopic': 'Navegación programática y enlaces',
    'definition': '''
Además de los enlaces declarativos que creas con el componente `<Link>`, `React Router` te ofrece formas de navegar programáticamente, es decir, mediante código JavaScript. Esto es fundamental cuando necesitas cambiar de ruta después de que una acción ha sido completada, como un envío de formulario, una autenticación exitosa o la selección de un elemento de una lista.

Seguramente pensarás de qué va todo esto... 

La navegación programática se logra principalmente a través del Hook `useNavigate()`. Cuando llamas a `useNavigate()`, te devuelve una función que puedes invocar con la ruta a la que quieres ir. Por ejemplo, `Maps('/dashboard')` te llevará a la ruta `/dashboard`. Esta función también te permite pasar opciones adicionales, como reemplazar la entrada actual en el historial del navegador (`Maps('/login', { replace: true })`) o navegar hacia adelante o hacia atrás en el historial (`Maps(-1)` para ir atrás, `Maps(1)` para ir adelante).

Los enlaces declarativos con `<Link to="/ruta">` son perfectos para la navegación de usuario directa (como botones de menú o enlaces en el texto). Sin embargo, cuando la navegación es el resultado de una lógica compleja o de un evento no directo de clic en un enlace, la navegación programática con `useNavigate()` es la herramienta adecuada. Es la flexibilidad de `React Router` la que te permite construir experiencias de usuario fluidas y lógicas sin esfuerzo.
''',
    'code_example': r'''
// 1. Instalar react-router-dom si aún no lo has hecho: npm install react-router-dom

// Componente principal de la aplicación
import React, { useState } from 'react';
import { BrowserRouter, Routes, Route, Link, useNavigate } from 'react-router-dom';
import './App.css'; // Para estilos básicos

// Componentes para las rutas
function Home() {
  return (
    <div className="page-content">
      <h2>Página de Inicio</h2>
      <p>Navega usando los enlaces o el botón de abajo.</p>
      <GoToAboutButton /> {/* Un componente que usa navegación programática */}
    </div>
  );
}

function About() {
  const navigate = useNavigate(); // Obtenemos la función de navegación

  const goToHomePage = () => {
    navigate('/'); // Navega a la ruta raíz (Inicio)
  };

  const goBack = () => {
    navigate(-1); // Navega una página atrás en el historial
  };

  return (
    <div className="page-content">
      <h2>Acerca de Nosotros</h2>
      <p>Esta es la página de información.</p>
      <button onClick={goToHomePage} className="action-button">Ir a Inicio</button>
      <button onClick={goBack} className="action-button">Volver Atrás</button>
    </div>
  );
}

function Dashboard() {
  const navigate = useNavigate();
  const [isAdmin, setIsAdmin] = useState(false);

  const handleLogout = () => {
    alert('Sesión cerrada.');
    // Después de cerrar sesión, navega a la página de inicio
    navigate('/');
  };

  const toggleAdmin = () => {
    setIsAdmin(!isAdmin);
    // Ejemplo de navegación con estado: pasando un valor a la ruta
    navigate('/dashboard/settings', { state: { isAdmin: !isAdmin } });
  };

  return (
    <div className="page-content">
      <h2>Panel de Control</h2>
      <p>Bienvenido al dashboard.</p>
      <button onClick={handleLogout} className="action-button logout-button">Cerrar Sesión</button>
      <button onClick={toggleAdmin} className="action-button">
        Ir a Configuración (admin: {isAdmin ? 'Sí' : 'No'})
      </button>
    </div>
  );
}

function DashboardSettings() {
  const { state } = useNavigate(); // El Hook useNavigate es importado, pero aquí no se usa la función de navegación.
                                  // Se usa 'useLocation' para acceder al estado pasado por 'navigate'.
  const location = useNavigate(); // Esto es incorrecto, debería ser useLocation() para obtener el objeto location.
  const passedState = location.state; // Acceder al estado pasado

  return (
    <div className="page-content">
      <h3>Configuración del Dashboard</h3>
      {passedState && passedState.isAdmin !== undefined && (
        <p>¿Es administrador? {passedState.isAdmin ? 'Sí' : 'No'}</p>
      )}
      <p>Aquí se configurarían los ajustes.</p>
      <Link to="/dashboard" className="action-button">Volver al Dashboard</Link>
    </div>
  );
}


// Componente que usa useNavigate
function GoToAboutButton() {
  const navigate = useNavigate(); // Obtenemos la función navigate

  const handleGoToAbout = () => {
    navigate('/about'); // Navegación programática
  };

  return (
    <button onClick={handleGoToAbout} className="action-button">
      Ir a Acerca de (Botón)
    </button>
  );
}

function App() {
  return (
    <BrowserRouter>
      <nav className="navbar">
        <ul className="nav-list">
          <li className="nav-item"><Link to="/" className="nav-link">Inicio</Link></li>
          <li className="nav-item"><Link to="/about" className="nav-link">Acerca de</Link></li>
          <li className="nav-item"><Link to="/dashboard" className="nav-link">Dashboard</Link></li>
        </ul>
      </nav>

      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/about" element={<About />} />
        <Route path="/dashboard" element={<Dashboard />} />
        <Route path="/dashboard/settings" element={<DashboardSettings />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;

// App.css (Para dar un poco de estilo, mismo que el anterior)
/*
.navbar {
  background-color: #333;
  padding: 10px 0;
}

.nav-list {
  list-style-type: none;
  margin: 0;
  padding: 0;
  display: flex;
  justify-content: center;
}

.nav-item {
  margin: 0 15px;
}

.nav-link {
  color: white;
  text-decoration: none;
  font-weight: bold;
  padding: 5px 10px;
  border-radius: 4px;
  transition: background-color 0.3s ease;
}

.nav-link:hover {
  background-color: #555;
}

.page-content {
  padding: 30px;
  text-align: center;
  border: 1px dashed #ccc;
  margin: 20px;
  border-radius: 8px;
  background-color: #f9f9f9;
}

.action-button {
  background-color: #007bff;
  color: white;
  padding: 10px 15px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  margin: 5px;
  font-size: 1em;
  transition: background-color 0.2s;
}

.action-button:hover {
  background-color: #0056b3;
}

.logout-button {
  background-color: #dc3545;
}

.logout-button:hover {
  background-color: #c82333;
}
*/

// Ejemplo incorrecto (usar window.location para navegación interna)
// function BadNavigation() {
//   const goToDashboard = () => {
//     window.location.href = '/dashboard'; // Esto recargaría la página, perdiendo el estado de React.
//   };
//   return <button onClick={goToDashboard}>Ir a Dashboard (Malo)</button>;
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Enrutamiento y Navegación',
    'topic': 'React Router',
    'subtopic': 'Rutas anidadas y dinámicas',
    'definition': '''
A medida que tu aplicación de React crece, es común que ciertas secciones tengan su propia estructura de navegación interna. Aquí es donde entran en juego las rutas anidadas y dinámicas en `React Router`, permitiéndote construir interfaces de usuario complejas y modulares.

Seguramente pensarás de qué va todo esto... 

**Rutas anidadas** significan que una ruta principal puede contener sub-rutas, y cuando accedes a una sub-ruta, tanto el componente de la ruta principal como el de la sub-ruta se renderizan. Esto es perfecto para diseños como un dashboard con varias secciones (Configuración, Perfil, Reportes), donde la barra lateral del dashboard permanece visible mientras el contenido principal cambia. Puedes definir rutas anidadas dentro de un componente `Route` padre, y usar el componente `<Outlet>` en el componente padre para indicar dónde deben renderizarse los componentes hijos de las rutas anidadas.

Por otro lado, las **rutas dinámicas** te permiten crear rutas que capturan partes variables de la URL. Por ejemplo, en lugar de tener una ruta separada para cada ID de producto (`/products/1`, `/products/2`), puedes tener una ruta dinámica como `/products/:id`. El `:id` actúa como un parámetro de la URL, y puedes acceder a su valor dentro de tu componente usando el Hook `useParams()`. Esto es increíblemente útil para mostrar detalles específicos de un recurso (un usuario, un producto, un artículo de blog) basado en su identificador único en la URL. Combinar rutas anidadas con rutas dinámicas te da la flexibilidad para modelar casi cualquier estructura de navegación que tu aplicación pueda necesitar.
''',
    'code_example': r'''
// 1. Instalar react-router-dom: npm install react-router-dom

// Componente principal de la aplicación
import React from 'react';
import { BrowserRouter, Routes, Route, Link, Outlet, useParams } from 'react-router-dom';
import './App.css'; // Para estilos básicos

// Componentes para las rutas
function DashboardLayout() {
  return (
    <div className="dashboard-layout">
      <nav className="dashboard-nav">
        <ul>
          <li><Link to="overview">Vista General</Link></li> {/* Rutas relativas */}
          <li><Link to="profile">Perfil</Link></li>
          <li><Link to="settings">Ajustes</Link></li>
          <li><Link to="/users">Ver Usuarios</Link></li> {/* Ruta absoluta */}
        </ul>
      </nav>
      <div className="dashboard-content">
        {/* <Outlet> renderiza el componente hijo de la ruta anidada */}
        <Outlet />
      </div>
    </div>
  );
}

function DashboardOverview() {
  return <div className="page-content"><h3>Vista General del Dashboard</h3><p>Estadísticas y resumen.</p></div>;
}

function DashboardProfile() {
  return <div className="page-content"><h3>Tu Perfil</h3><p>Aquí puedes editar tu información personal.</p></div>;
}

function DashboardSettings() {
  return <div className="page-content"><h3>Ajustes de la Cuenta</h3><p>Gestiona las configuraciones de tu aplicación.</p></div>;
}

// Rutas Dinámicas
function UserList() {
  const users = [
    { id: '1', name: 'Alice' },
    { id: '2', name: 'Bob' },
    { id: '3', name: 'Charlie' },
  ];
  return (
    <div className="page-content">
      <h2>Lista de Usuarios</h2>
      <ul>
        {users.map(user => (
          <li key={user.id}>
            <Link to={`/users/${user.id}`}>Ver {user.name}</Link>
          </li>
        ))}
      </ul>
    </div>
  );
}

function UserDetail() {
  // useParams() Hook para acceder a los parámetros de la URL
  const { userId } = useParams(); // 'userId' debe coincidir con ':userId' en la ruta

  const users = [
    { id: '1', name: 'Alice', email: 'alice@example.com' },
    { id: '2', name: 'Bob', email: 'bob@example.com' },
    { id: '3', name: 'Charlie', email: 'charlie@example.com' },
  ];

  const user = users.find(u => u.id === userId);

  if (!user) {
    return <div className="page-content" style={{ color: 'red' }}><h3>Usuario no encontrado.</h3></div>;
  }

  return (
    <div className="page-content">
      <h2>Detalles del Usuario: {user.name}</h2>
      <p>ID: {user.id}</p>
      <p>Email: {user.email}</p>
      <Link to="/users" className="action-button">Volver a la Lista de Usuarios</Link>
    </div>
  );
}

function App() {
  return (
    <BrowserRouter>
      <nav className="navbar">
        <ul className="nav-list">
          <li className="nav-item"><Link to="/" className="nav-link">Inicio</Link></li>
          <li className="nav-item"><Link to="/dashboard" className="nav-link">Dashboard</Link></li>
          <li className="nav-item"><Link to="/users" className="nav-link">Usuarios</Link></li>
        </ul>
      </nav>

      <Routes>
        <Route path="/" element={<div className="page-content"><h2>Página Principal</h2><p>Explora las diferentes secciones.</p></div>} />

        {/* Ruta anidada para el Dashboard */}
        <Route path="dashboard" element={<DashboardLayout />}>
          {/* Rutas hijas. La 'path' es relativa a la ruta padre. */}
          <Route index element={<DashboardOverview />} /> {/* Ruta por defecto para /dashboard */}
          <Route path="overview" element={<DashboardOverview />} />
          <Route path="profile" element={<DashboardProfile />} />
          <Route path="settings" element={<DashboardSettings />} />
          {/* Si se intenta acceder a /dashboard/loquesea y no coincide, se puede poner un not found */}
          <Route path="*" element={<div className="page-content" style={{ color: 'orange' }}>
            <h3>Sub-ruta de Dashboard no encontrada</h3>
          </div>} />
        </Route>

        {/* Rutas dinámicas para Usuarios */}
        <Route path="users" element={<UserList />} />
        {/* :userId es un parámetro dinámico. */}
        <Route path="users/:userId" element={<UserDetail />} />

        {/* Ruta para capturar cualquier otra URL no definida */}
        <Route path="*" element={<div className="page-content" style={{ color: 'red' }}><h2>404 - Página no encontrada</h2></div>} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;

// App.css (continuación para los estilos de dashboard)
/*
.navbar {
  background-color: #333;
  padding: 10px 0;
}

.nav-list {
  list-style-type: none;
  margin: 0;
  padding: 0;
  display: flex;
  justify-content: center;
}

.nav-item {
  margin: 0 15px;
}

.nav-link {
  color: white;
  text-decoration: none;
  font-weight: bold;
  padding: 5px 10px;
  border-radius: 4px;
  transition: background-color 0.3s ease;
}

.nav-link:hover {
  background-color: #555;
}

.page-content {
  padding: 30px;
  text-align: center;
  border: 1px dashed #ccc;
  margin: 20px;
  border-radius: 8px;
  background-color: #f9f9f9;
}

.dashboard-layout {
  display: flex;
  height: calc(100vh - 60px); /* Ajusta para que la barra de navegación superior no la tape */
  margin-top: 20px;
}

.dashboard-nav {
  width: 200px;
  background-color: #f0f0f0;
  padding: 20px;
  border-right: 1px solid #ddd;
}

.dashboard-nav ul {
  list-style-type: none;
  padding: 0;
}

.dashboard-nav li {
  margin-bottom: 10px;
}

.dashboard-nav a {
  text-decoration: none;
  color: #007bff;
  font-weight: bold;
  display: block;
  padding: 8px;
  border-radius: 4px;
}

.dashboard-nav a:hover {
  background-color: #e2e6ea;
}

.dashboard-content {
  flex-grow: 1;
  padding: 20px;
  background-color: #fff;
}

.action-button {
  background-color: #007bff;
  color: white;
  padding: 10px 15px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  margin: 5px;
  font-size: 1em;
  transition: background-color 0.2s;
}

.action-button:hover {
  background-color: #0056b3;
}
*/

// Ejemplo incorrecto (no usar <Outlet> en la ruta padre para rutas anidadas)
// function DashboardLayoutIncorrecto() {
//   return (
//     <div>
//       <nav>...</nav>
//       {/* Si no pones <Outlet>, las rutas hijas nunca se renderizarán aquí */}
//       {/* Los componentes hijos de Route nunca se mostrarán */}
//     </div>
//   );
// }

// Ejemplo incorrecto (acceder a parámetros de ruta sin useParams)
// function UserDetailIncorrecto({ match }) { // 'match' es de React Router v5, no v6
//   // En v6, ya no se usa 'match.params', se usa useParams()
//   const userId = match.params.userId; // Esto no funcionaría en React Router v6
//   return <p>...</p>;
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Enrutamiento y Navegación',
    'topic': 'Parámetros y Redirecciones',
    'subtopic': 'Manejo de parámetros de ruta',
    'definition': '''
El manejo de parámetros de ruta en React Router te permite crear URLs dinámicas que capturan información directamente de la dirección, haciendo que tu aplicación sea más flexible y capaz de mostrar contenido específico basado en la URL.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una tienda online. No querrías crear una página diferente para cada producto individual que vendes. En su lugar, defines una única "ruta de producto" que puede mostrar los detalles de CUALQUIER producto, siempre y cuando se le pase el ID del producto en la URL (por ejemplo, `/productos/camisa-azul` o `/productos/123`). React Router logra esto usando placeholders con dos puntos (`:`) en la definición de tu ruta (como `/productos/:productId`). Dentro del componente que se renderiza para esa ruta, puedes acceder al valor de esos parámetros usando el Hook `useParams()`. Este Hook devuelve un objeto donde las claves son los nombres de tus parámetros de ruta (sin los dos puntos) y los valores son las partes correspondientes de la URL. Es una forma increíblemente poderosa de crear URLs significativas y de acceder a datos relevantes para el contenido que se muestra en cada página.
''',
    'code_example': r'''
// 1. Instalar react-router-dom: npm install react-router-dom

// index.js o App.js (Componente principal)
import React from 'react';
import { BrowserRouter, Routes, Route, Link, useParams } from 'react-router-dom';
import './App.css'; // Para estilos básicos

// Datos de ejemplo para productos
const productos = [
  { id: '101', nombre: 'Laptop Gamer', precio: 1200, descripcion: 'Potente laptop para gaming.' },
  { id: '102', nombre: 'Teclado Mecánico', precio: 80, descripcion: 'Teclado con switches Cherry MX.' },
  { id: '103', nombre: 'Monitor Curvo', precio: 350, descripcion: 'Monitor de 27 pulgadas con alta tasa de refresco.' },
];

function ListaProductos() {
  return (
    <div className="page-content">
      <h2>Nuestros Productos</h2>
      <ul>
        {productos.map(producto => (
          <li key={producto.id}>
            <Link to={`/productos/${producto.id}`}>{producto.nombre}</Link>
          </li>
        ))}
      </ul>
    </div>
  );
}

function DetalleProducto() {
  // useParams() devuelve un objeto con los parámetros de la URL.
  // El nombre de la propiedad (productId) debe coincidir con el de la ruta (:productId).
  const { productId } = useParams();

  // Buscar el producto basado en el ID de la URL
  const producto = productos.find(p => p.id === productId);

  if (!producto) {
    return (
      <div className="page-content" style={{ color: 'red' }}>
        <h2>Producto no encontrado</h2>
        <p>No se encontró ningún producto con el ID: {productId}</p>
        <Link to="/productos" className="action-button">Volver a la Lista</Link>
      </div>
    );
  }

  return (
    <div className="page-content">
      <h2>{producto.nombre}</h2>
      <p><strong>ID:</strong> {producto.id}</p>
      <p><strong>Precio:</strong> ${producto.precio.toFixed(2)}</p>
      <p><strong>Descripción:</strong> {producto.descripcion}</p>
      <Link to="/productos" className="action-button">Volver a la Lista</Link>
    </div>
  );
}

// Otro ejemplo: perfil de usuario con múltiples parámetros
function PerfilUsuario() {
  // Ejemplo con múltiples parámetros: /usuarios/:username/:tab
  const { username, tab } = useParams();

  return (
    <div className="page-content">
      <h2>Perfil de {username}</h2>
      {tab && <p>Estás viendo la pestaña: <strong>{tab}</strong></p>}
      <p>Este componente demuestra el uso de múltiples parámetros de ruta.</p>
      <nav style={{ marginTop: '15px' }}>
        <Link to={`/usuarios/${username}/informacion`} className="action-button">Información</Link>
        <Link to={`/usuarios/${username}/publicaciones`} className="action-button">Publicaciones</Link>
      </nav>
    </div>
  );
}


function App() {
  return (
    <BrowserRouter>
      <nav className="navbar">
        <ul className="nav-list">
          <li className="nav-item"><Link to="/" className="nav-link">Inicio</Link></li>
          <li className="nav-item"><Link to="/productos" className="nav-link">Productos</Link></li>
          <li className="nav-item"><Link to="/usuarios/alicia/informacion" className="nav-link">Perfil Alicia</Link></li>
        </ul>
      </nav>

      <Routes>
        <Route path="/" element={<div className="page-content"><h2>Página Principal</h2><p>Explora los productos y perfiles.</p></div>} />
        <Route path="/productos" element={<ListaProductos />} />
        {/* Ruta dinámica: :productId capturará el valor en la URL */}
        <Route path="/productos/:productId" element={<DetalleProducto />} />

        {/* Ruta con múltiples parámetros dinámicos y un parámetro opcional */}
        <Route path="/usuarios/:username" element={<PerfilUsuario />} />
        <Route path="/usuarios/:username/:tab" element={<PerfilUsuario />} /> {/* Con una pestaña específica */}

        <Route path="*" element={<div className="page-content" style={{ color: 'red' }}><h2>404 - Página no encontrada</h2></div>} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;

// App.css (misma que el anterior para consistencia)
/*
.navbar {
  background-color: #333;
  padding: 10px 0;
}

.nav-list {
  list-style-type: none;
  margin: 0;
  padding: 0;
  display: flex;
  justify-content: center;
}

.nav-item {
  margin: 0 15px;
}

.nav-link {
  color: white;
  text-decoration: none;
  font-weight: bold;
  padding: 5px 10px;
  border-radius: 4px;
  transition: background-color 0.3s ease;
}

.nav-link:hover {
  background-color: #555;
}

.page-content {
  padding: 30px;
  text-align: center;
  border: 1px dashed #ccc;
  margin: 20px;
  border-radius: 8px;
  background-color: #f9f9f9;
}

.action-button {
  background-color: #007bff;
  color: white;
  padding: 10px 15px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  margin: 5px;
  font-size: 1em;
  transition: background-color 0.2s;
}

.action-button:hover {
  background-color: #0056b3;
}
*/

// Ejemplo incorrecto (intentar acceder a parámetros directamente de props sin useParams)
// function OldProductDetail(props) {
//   // En React Router v6, 'match.params' ya no se pasa directamente por props.
//   // const productId = props.match.params.productId; // Esto no funcionaría en v6
//   return <p>...</p>;
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Enrutamiento y Navegación',
    'topic': 'Parámetros y Redirecciones',
    'subtopic': 'Redirecciones y rutas protegidas',
    'definition': '''
Las redirecciones y las rutas protegidas son aspectos fundamentales en el enrutamiento de aplicaciones web, permitiéndote controlar el flujo de navegación de los usuarios y restringir el acceso a ciertas partes de tu aplicación basándose en condiciones, como la autenticación.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una página de login. Si un usuario ya está autenticado, no tiene sentido que vea la página de login; deberíamos redirigirlo automáticamente a su dashboard. O, si un usuario intenta acceder a una página de administración sin los permisos adecuados, deberíamos enviarlo a una página de "Acceso Denegado" o de login. `React Router` facilita esto con el componente `<Navigate>` y con lógica personalizada para rutas protegidas.

El componente `<Navigate>` es una forma declarativa de realizar una redirección. Cuando se renderiza, cambia la URL y reemplaza la entrada actual en el historial. Es útil para redirecciones condicionales dentro del renderizado de un componente. Para rutas protegidas, la estrategia común es crear un componente envoltorio (`PrivateRoute` o `ProtectedRoute`) que compruebe una condición (por ejemplo, si el usuario está logueado o tiene un rol específico). Si la condición se cumple, renderiza el componente deseado; si no, utiliza `<Navigate>` para redirigir al usuario a una página de login o a una página de error. Esto es una piedra angular para la seguridad y la experiencia de usuario en aplicaciones con autenticación y diferentes niveles de acceso.
''',
    'code_example': r'''
// 1. Instalar react-router-dom: npm install react-router-dom

// index.js o App.js (Componente principal)
import React, { useState, createContext, useContext } from 'react';
import { BrowserRouter, Routes, Route, Link, Navigate, Outlet } from 'react-router-dom';
import './App.css'; // Para estilos básicos

// Creamos un contexto de autenticación para simular el login/logout
const AuthContext = createContext(null);

// Proveedor de autenticación
function AuthProvider({ children }) {
  const [user, setUser] = useState(null); // null si no está logueado, un objeto si sí

  const login = (username, password) => {
    // Simula una llamada a API
    if (username === 'test' && password === '123') {
      setUser({ name: username, roles: ['user'] });
      return true;
    }
    return false;
  };

  const logout = () => {
    setUser(null);
  };

  const isAuthenticated = !!user; // true si hay un usuario
  const hasRole = (role) => user && user.roles.includes(role);

  const value = { user, isAuthenticated, hasRole, login, logout };

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
}

// Hook personalizado para consumir el contexto de autenticación
function useAuth() {
  return useContext(AuthContext);
}

// Componente para la página de Login
function LoginPage() {
  const { login, isAuthenticated } = useAuth();
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');

  if (isAuthenticated) {
    // Si ya está autenticado, redirige al dashboard
    return <Navigate to="/dashboard" replace />;
  }

  const handleSubmit = (e) => {
    e.preventDefault();
    if (login(username, password)) {
      // Redirección manejada por <Navigate> en la parte superior
    } else {
      setError('Credenciales incorrectas');
    }
  };

  return (
    <div className="page-content">
      <h2>Iniciar Sesión</h2>
      <form onSubmit={handleSubmit}>
        <div>
          <label>
            Usuario:
            <input type="text" value={username} onChange={(e) => setUsername(e.target.value)} />
          </label>
        </div>
        <div>
          <label>
            Contraseña:
            <input type="password" value={password} onChange={(e) => setPassword(e.target.value)} />
          </label>
        </div>
        {error && <p style={{ color: 'red' }}>{error}</p>}
        <button type="submit">Entrar</button>
      </form>
    </div>
  );
}

// Componente de Dashboard (accesible solo si logueado)
function DashboardPage() {
  const { user, logout } = useAuth();
  return (
    <div className="page-content">
      <h2>Bienvenido al Dashboard, {user?.name}!</h2>
      <p>Contenido exclusivo para usuarios autenticados.</p>
      <button onClick={logout} className="action-button logout-button">Cerrar Sesión</button>
      <Link to="/admin" className="action-button">Ir a Admin (Protegida por Rol)</Link>
    </div>
  );
}

// Componente de Página de Administración (accesible solo por admin)
function AdminPage() {
  const { user } = useAuth();
  return (
    <div className="page-content">
      <h2>Página de Administración</h2>
      <p>Solo visible para usuarios con rol 'admin'. Tu rol: {user?.roles?.join(', ')}</p>
    </div>
  );
}

// Componente de acceso denegado
function AccessDenied() {
  return (
    <div className="page-content" style={{ color: 'orange' }}>
      <h2>Acceso Denegado</h2>
      <p>No tienes permisos para ver esta página.</p>
      <Link to="/" className="action-button">Volver al Inicio</Link>
    </div>
  );
}

// Componente de Ruta Protegida
// Recibe los roles requeridos y el componente a renderizar
function ProtectedRoute({ children, requiredRoles = [] }) {
  const { isAuthenticated, hasRole } = useAuth();

  if (!isAuthenticated) {
    // Si no está autenticado, redirige al login
    return <Navigate to="/login" replace />;
  }

  // Si se requieren roles y el usuario no tiene ninguno, denegar acceso
  if (requiredRoles.length > 0 && !requiredRoles.some(role => hasRole(role))) {
    return <Navigate to="/access-denied" replace />;
  }

  return children; // Si autenticado y con roles correctos, renderiza los hijos
}


function App() {
  return (
    <BrowserRouter>
      <AuthProvider> {/* Envuelve toda la app para que el contexto esté disponible */}
        <nav className="navbar">
          <ul className="nav-list">
            <li className="nav-item"><Link to="/" className="nav-link">Inicio</Link></li>
            <li className="nav-item"><Link to="/login" className="nav-link">Login</Link></li>
            <li className="nav-item"><Link to="/dashboard" className="nav-link">Dashboard</Link></li>
            <li className="nav-item"><Link to="/admin" className="nav-link">Admin</Link></li>
          </ul>
        </nav>

        <Routes>
          <Route path="/" element={<div className="page-content"><h2>Página Principal</h2><p>Intenta acceder al Dashboard o Admin.</p></div>} />
          <Route path="/login" element={<LoginPage />} />
          <Route path="/access-denied" element={<AccessDenied />} />

          {/* Rutas protegidas */}
          <Route
            path="/dashboard"
            element={
              <ProtectedRoute> {/* Por defecto, solo requiere autenticación */}
                <DashboardPage />
              </ProtectedRoute>
            }
          />
          <Route
            path="/admin"
            element={
              <ProtectedRoute requiredRoles={['admin']}> {/* Requiere rol 'admin' */}
                <AdminPage />
              </ProtectedRoute>
            }
          />

          <Route path="*" element={<div className="page-content" style={{ color: 'red' }}><h2>404 - Página no encontrada</h2></div>} />
        </Routes>
      </AuthProvider>
    </BrowserRouter>
  );
}

export default App;

// App.css (mismo que el anterior)
/*
.navbar {
  background-color: #333;
  padding: 10px 0;
}

.nav-list {
  list-style-type: none;
  margin: 0;
  padding: 0;
  display: flex;
  justify-content: center;
}

.nav-item {
  margin: 0 15px;
}

.nav-link {
  color: white;
  text-decoration: none;
  font-weight: bold;
  padding: 5px 10px;
  border-radius: 4px;
  transition: background-color 0.3s ease;
}

.nav-link:hover {
  background-color: #555;
}

.page-content {
  padding: 30px;
  text-align: center;
  border: 1px dashed #ccc;
  margin: 20px;
  border-radius: 8px;
  background-color: #f9f9f9;
}

.action-button {
  background-color: #007bff;
  color: white;
  padding: 10px 15px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  margin: 5px;
  font-size: 1em;
  transition: background-color 0.2s;
}

.action-button:hover {
  background-color: #0056b3;
}

.logout-button {
  background-color: #dc3545;
}

.logout-button:hover {
  background-color: #c82333;
}
*/

// Ejemplo incorrecto (redirección con window.location en un componente React)
// function OldRedirectComponent() {
//   // Esto no es idiomático en React Router y causa una recarga completa
//   window.location.href = '/new-page';
//   return null;
// }
// Siempre usa <Navigate> o useNavigate para redirecciones en React Router.
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Enrutamiento y Navegación',
    'topic': 'Parámetros y Redirecciones',
    'subtopic': 'Uso de hooks de enrutamiento',
    'definition': '''
`React Router` proporciona una serie de Hooks que te dan acceso a información sobre la ruta actual, la capacidad de navegar programáticamente y mucho más, todo ello de una manera limpia y funcional.

Seguramente pensarás de qué va todo esto... 

Ya hemos visto `useParams()` para acceder a los parámetros dinámicos de la URL y `useNavigate()` para la navegación programática. Pero hay más. El Hook `useLocation()` te devuelve un objeto `location` que contiene información sobre la URL actual, como el `pathname` (la ruta), el `search` (la cadena de consulta, como `?key=value`) y el `hash` (la parte de la URL que empieza con `#`). Esto es súper útil para, por ejemplo, resaltar el enlace de navegación activo, analizar parámetros de la cadena de consulta, o implementar desplazamiento a anclas.

Otro Hook útil es `useMatch()`, que te permite comprobar si la URL actual coincide con un patrón de ruta específico, lo cual es genial para aplicar estilos a enlaces activos o para renderizar contenido condicionalmente. Finalmente, `useResolvedPath()` te ayuda a resolver una ruta a una ruta canónica que puede ser útil para construir enlaces. Estos Hooks son la forma moderna y recomendada de interactuar con el enrutador en componentes funcionales, haciendo que tu código sea más conciso, legible y alineado con el paradigma de los Hooks de React.
''',
    'code_example': r'''
// 1. Instalar react-router-dom: npm install react-router-dom

// index.js o App.js (Componente principal)
import React, { useState } from 'react';
import {
  BrowserRouter,
  Routes,
  Route,
  Link,
  useParams,     // Acceder a parámetros de ruta
  useNavigate,   // Navegación programática
  useLocation,   // Información sobre la URL actual
  useMatch,      // Comprobar si la URL coincide con un patrón
} from 'react-router-dom';
import './App.css'; // Para estilos básicos

// Componente de inicio
function HomePage() {
  const location = useLocation(); // Obtiene el objeto location
  const navigate = useNavigate(); // Obtiene la función navigate

  const goToAboutWithQuery = () => {
    navigate('/about?source=homepage&version=1.0'); // Navega con una cadena de consulta
  };

  return (
    <div className="page-content">
      <h2>Página de Inicio</h2>
      <p>Ruta actual: <code>{location.pathname}</code></p>
      <button onClick={goToAboutWithQuery} className="action-button">
        Ir a Acerca de (con Query Params)
      </button>
    </div>
  );
}

// Componente Acerca de
function AboutPage() {
  const location = useLocation(); // Para ver los query params
  const queryParams = new URLSearchParams(location.search); // Parsear la cadena de consulta
  const source = queryParams.get('source');
  const version = queryParams.get('version');

  return (
    <div className="page-content">
      <h2>Acerca de Nosotros</h2>
      <p>Ruta: <code>{location.pathname}</code></p>
      {source && <p>Fuente: <strong>{source}</strong></p>}
      {version && <p>Versión: <strong>{version}</strong></p>}
      <Link to="/" className="action-button">Volver al Inicio</Link>
    </div>
  );
}

// Componente para un perfil de usuario (con parámetros dinámicos)
function UserProfile() {
  const { userId } = useParams(); // Obtiene el parámetro de la URL
  const navigate = useNavigate();

  const handleEditProfile = () => {
    // Ejemplo de cómo navegar a una sub-ruta del usuario
    navigate(`/users/${userId}/edit`);
  };

  return (
    <div className="page-content">
      <h2>Perfil del Usuario: {userId}</h2>
      <p>Aquí se muestran los detalles del usuario con ID: {userId}</p>
      <button onClick={handleEditProfile} className="action-button">Editar Perfil</button>
      <Link to="/users" className="action-button">Volver a la Lista de Usuarios</Link>
    </div>
  );
}

function UserEditProfile() {
  const { userId } = useParams();
  return (
    <div className="page-content">
      <h3>Editando Perfil de Usuario: {userId}</h3>
      <p>Formulario para editar el perfil.</p>
      <Link to={`/users/${userId}`} className="action-button">Volver al Perfil</Link>
    </div>
  );
}

// Componente de navegación para demostrar useMatch
function CustomNavLink({ to, children }) {
  const match = useMatch(to); // Comprueba si la URL actual coincide con 'to'

  const linkStyle = {
    fontWeight: match ? 'bold' : 'normal',
    color: match ? 'lightgreen' : 'white', // Color diferente si está activo
    textDecoration: 'none',
    padding: '5px 10px',
    borderRadius: '4px',
    backgroundColor: match ? '#555' : 'transparent',
    transition: 'background-color 0.3s, font-weight 0.3s, color 0.3s',
  };

  return (
    <li className="nav-item">
      <Link to={to} style={linkStyle}>
        {children}
      </Link>
    </li>
  );
}


function App() {
  const usersData = [{ id: 'john_doe' }, { id: 'jane_smith' }];

  return (
    <BrowserRouter>
      <nav className="navbar">
        <ul className="nav-list">
          <CustomNavLink to="/">Inicio</CustomNavLink>
          <CustomNavLink to="/about">Acerca de</CustomNavLink>
          <CustomNavLink to="/users">Usuarios</CustomNavLink>
          {/* Puedes añadir enlaces dinámicos para usuarios */}
          {usersData.map(user => (
            <CustomNavLink key={user.id} to={`/users/${user.id}`}>
              {user.id}
            </CustomNavLink>
          ))}
        </ul>
      </nav>

      <Routes>
        <Route path="/" element={<HomePage />} />
        <Route path="/about" element={<AboutPage />} />

        {/* Rutas para usuarios */}
        <Route path="/users" element={<div className="page-content">
          <h2>Lista de Usuarios</h2>
          <ul>
            {usersData.map(user => (
              <li key={user.id}>
                <Link to={`/users/${user.id}`}>{user.id}</Link>
              </li>
            ))}
          </ul>
        </div>} />
        <Route path="/users/:userId" element={<UserProfile />} />
        <Route path="/users/:userId/edit" element={<UserEditProfile />} />

        <Route path="*" element={<div className="page-content" style={{ color: 'red' }}><h2>404 - Página no encontrada</h2></div>} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;

// App.css (mismo que el anterior)
/*
.navbar {
  background-color: #333;
  padding: 10px 0;
}

.nav-list {
  list-style-type: none;
  margin: 0;
  padding: 0;
  display: flex;
  justify-content: center;
}

.nav-item {
  margin: 0 15px;
}

.nav-link {
  color: white;
  text-decoration: none;
  font-weight: bold;
  padding: 5px 10px;
  border-radius: 4px;
  transition: background-color 0.3s ease;
}

.nav-link:hover {
  background-color: #555;
}

.page-content {
  padding: 30px;
  text-align: center;
  border: 1px dashed #ccc;
  margin: 20px;
  border-radius: 8px;
  background-color: #f9f9f9;
}

.action-button {
  background-color: #007bff;
  color: white;
  padding: 10px 15px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  margin: 5px;
  font-size: 1em;
  transition: background-color 0.2s;
}

.action-button:hover {
  background-color: #0056b3;
}
*/

// Ejemplo incorrecto (acceder a location directamente desde props en v6)
// function OldAboutPage(props) {
//   // En React Router v6, el objeto 'location' no se pasa por props.
//   // const currentLocation = props.location; // Esto no funcionaría en v6
//   return <p>...</p>;
// }
'''
  });
}

Future<void> insertReactMidLevel3Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Manejo de Estado Global',
    'topic': 'Context API',
    'subtopic': 'Creación y uso de contextos',
    'definition': '''
La Context API de React es una característica que te permite compartir datos que se consideran "globales" para un árbol de componentes, como un tema de interfaz de usuario, la información del usuario autenticado, o la configuración regional, sin tener que pasar props manualmente a través de cada nivel.

Seguramente pensarás de qué va todo esto... 

Imagina que tienes un componente principal y, muy abajo en el árbol de componentes, un componente hijo que necesita acceder a un dato que reside en el componente principal. Sin Context, tendrías que pasar ese dato como una `prop` de padre a hijo, y luego de ese hijo a su propio hijo, y así sucesivamente, incluso si los componentes intermedios no necesitan ese dato en absoluto. Esto se conoce como "prop drilling" y puede volverse bastante tedioso y difícil de manejar en aplicaciones grandes. La Context API resuelve este problema. Primero, utilizas `React.createContext()` para crear un objeto Context. Este objeto viene con dos componentes: `Provider` (Proveedor) y `Consumer` (Consumidor). El `Provider` se usa para envolver la parte del árbol de componentes donde quieres que el contexto esté disponible y le pasas el valor que deseas compartir a través de su prop `value`. Luego, cualquier componente (sin importar cuán profundo esté) que quiera acceder a ese valor, puede usar el Hook `useContext()` (la forma moderna y recomendada para componentes funcionales) o el componente `Consumer` (para componentes de clase o si no puedes usar Hooks) para "suscribirse" a ese contexto y obtener el valor directamente. Esto es una forma elegante de evitar el `prop drilling` y de gestionar estados que son relevantes para muchos componentes en tu aplicación.
''',
    'code_example': r'''
// 1. Crear el Contexto (ThemeContext.js)
import React, { createContext, useState, useEffect, useContext } from 'react';

// Creamos un nuevo Contexto. Puedes pasar un valor por defecto.
// Este valor por defecto se usa si un consumidor intenta leer el contexto sin un proveedor.
const ThemeContext = createContext('light');

// Componente Proveedor del Contexto
// Envuelve la parte de tu aplicación que necesita acceso a este contexto.
export function ThemeProvider({ children }) {
  const [theme, setTheme] = useState('light'); // Estado real del tema

  // Función para cambiar el tema
  const toggleTheme = () => {
    setTheme(prevTheme => (prevTheme === 'light' ? 'dark' : 'light'));
  };

  // Puedes usar useEffect para persistir el tema en localStorage, por ejemplo
  useEffect(() => {
    const savedTheme = localStorage.getItem('appTheme');
    if (savedTheme) {
      setTheme(savedTheme);
    }
  }, []);

  useEffect(() => {
    localStorage.setItem('appTheme', theme);
  }, [theme]);

  // El objeto 'value' es lo que se pasa a todos los consumidores del contexto
  const contextValue = {
    theme,
    toggleTheme,
  };

  return (
    <ThemeContext.Provider value={contextValue}>
      {children} {/* 'children' son los componentes que serán envueltos por el proveedor */}
    </ThemeContext.Provider>
  );
}

// 2. Usar el Contexto en un Componente (ComponenteBotonTema.js)
// import React from 'react';
// import { ThemeContext } from './ThemeContext'; // Importamos el contexto

function ComponenteBotonTema() {
  // Usamos el Hook useContext para acceder al valor del contexto
  const { theme, toggleTheme } = useContext(ThemeContext);

  const buttonStyle = {
    backgroundColor: theme === 'light' ? '#eee' : '#666',
    color: theme === 'light' ? '#333' : 'white',
    padding: '10px 20px',
    borderRadius: '5px',
    border: 'none',
    cursor: 'pointer',
    marginTop: '10px',
  };

  return (
    <button style={buttonStyle} onClick={toggleTheme}>
      Cambiar a Tema {theme === 'light' ? 'Oscuro' : 'Claro'}
    </button>
  );
}

// Otro componente que usa el contexto (ComponenteContenidoConTema.js)
// import React from 'react';
// import { ThemeContext } from './ThemeContext';

function ComponenteContenidoConTema() {
  const { theme } = useContext(ThemeContext);

  const contentStyle = {
    backgroundColor: theme === 'light' ? 'white' : '#444',
    color: theme === 'light' ? '#333' : 'white',
    padding: '20px',
    margin: '20px 0',
    border: `1px solid ${theme === 'light' ? '#ccc' : '#888'}`,
    borderRadius: '8px',
  };

  return (
    <div style={contentStyle}>
      <h3>Este contenido se adapta al tema: {theme.toUpperCase()}</h3>
      <p>Ya no necesitamos pasar el tema por props a cada componente.</p>
    </div>
  );
}


// 3. Componente principal (App.js)
function App() {
  return (
    <ThemeProvider> {/* Toda la aplicación (o parte de ella) envuelta por el proveedor */}
      <div style={{ fontFamily: 'Arial, sans-serif', padding: '20px' }}>
        <h1>Ejemplo de Context API</h1>
        <p>El tema de la aplicación se gestiona globalmente.</p>
        <ComponenteBotonTema />
        <ComponenteContenidoConTema />
        <p>
          Intenta cambiar el tema y observa cómo ambos componentes se actualizan,
          sin pasar props directamente.
        </p>
      </div>
    </ThemeProvider>
  );
}

export default App;

// Ejemplo incorrecto (intentar usar useContext fuera de un Provider)
// function ComponenteSinProvider() {
//   // Si no hay un ThemeProvider envolviéndolo, 'theme' y 'toggleTheme' serían 'undefined'
//   // o el valor por defecto de createContext si se le pasara uno.
//   // Esto puede llevar a errores en tiempo de ejecución.
//   const { theme, toggleTheme } = useContext(ThemeContext);
//   return <p>Intento acceder al tema sin un proveedor.</p>;
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Manejo de Estado Global',
    'topic': 'Context API',
    'subtopic': 'Proveedores y consumidores de contexto',
    'definition': '''
Dentro de la Context API, el `Provider` (Proveedor) y el `Consumer` (Consumidor) son los dos pilares que hacen posible el flujo de datos global, cada uno con un rol muy claro en cómo se comparte y se accede al estado.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una estación de radio y sus oyentes. La estación es el `Provider`: emite una señal (el valor del contexto) que todos los que la sintonizan pueden recibir. Los oyentes son los `Consumers`: sintonizan esa señal para escuchar lo que la estación está transmitiendo. En React, el componente `Provider` (como `MiContexto.Provider`) es el responsable de hacer que el valor de un contexto esté disponible para todos los componentes anidados debajo de él en el árbol. La prop `value` de `Provider` es crucial, ya que es el dato que se compartirá. Puedes tener múltiples `Providers` en tu aplicación, incluso anidados, para diferentes contextos o para sobrescribir valores de un contexto para una parte específica del árbol.

Por otro lado, los `Consumers` son los componentes que "escuchan" o "consumen" ese valor. La forma más moderna y recomendada para componentes funcionales es usar el Hook `useContext()`. Simplemente le pasas el objeto Context que creaste (`useContext(MiContexto)`), y te devolverá el valor actual de ese contexto. Para componentes de clase, o si no puedes usar Hooks, puedes usar el componente `MiContexto.Consumer` que utiliza el patrón de "render props" (le pasas una función como hijo, y esa función recibe el valor del contexto como argumento y devuelve los elementos que quieres renderizar). Entender el rol de `Provider` para emitir el valor y `Consumer` (a través de `useContext` o el componente `Consumer`) para recibirlo es clave para manejar el estado global de forma efectiva con la Context API.
''',
    'code_example': r'''
// 1. Crear el Contexto (UserContext.js)
import React, { createContext, useState, useContext } from 'react';

// Creamos un Contexto para la información del usuario autenticado
const UserContext = createContext(null); // Valor por defecto: null

// Componente Proveedor (UserProvider)
export function UserProvider({ children }) {
  const [currentUser, setCurrentUser] = useState(null); // null si no hay usuario logueado

  const loginUser = (username) => {
    // Simular un login
    setCurrentUser({ name: username, id: Date.now() });
  };

  const logoutUser = () => {
    setCurrentUser(null);
  };

  const contextValue = {
    currentUser,
    loginUser,
    logoutUser,
    isAuthenticated: !!currentUser, // Booleano para saber si hay usuario
  };

  return (
    <UserContext.Provider value={contextValue}>
      {children}
    </UserContext.Provider>
  );
}

// Hook personalizado para facilitar el consumo del contexto
export function useUser() {
  return useContext(UserContext);
}

// 2. Componente que provee el contexto (App.js o index.js)
// Ya lo hemos hecho al envolver <App/> con <UserProvider> en el ejemplo principal.

// 3. Componentes que consumen el contexto

// Componente de bienvenida (Consumer usando useContext)
function WelcomeMessage() {
  const { currentUser, isAuthenticated, logoutUser } = useUser(); // Consumimos el contexto

  const messageStyle = {
    padding: '15px',
    backgroundColor: '#e6f7ff',
    borderLeft: '4px solid #4CAF50',
    margin: '10px 0',
  };

  if (!isAuthenticated) {
    return <div style={messageStyle}>¡Bienvenido, invitado! Por favor, inicia sesión.</div>;
  }

  return (
    <div style={messageStyle}>
      ¡Hola, {currentUser.name}! Eres el usuario #{currentUser.id}.
      <button
        onClick={logoutUser}
        style={{ marginLeft: '15px', padding: '5px 10px', backgroundColor: '#dc3545', color: 'white', border: 'none', borderRadius: '3px', cursor: 'pointer' }}
      >
        Cerrar Sesión
      </button>
    </div>
  );
}

// Componente de formulario de login (Consumer usando useContext)
function LoginForm() {
  const { loginUser, isAuthenticated } = useUser();
  const [usernameInput, setUsernameInput] = useState('');

  if (isAuthenticated) {
    return <p style={{ color: 'green', fontWeight: 'bold' }}>Ya has iniciado sesión.</p>;
  }

  const handleSubmit = (e) => {
    e.preventDefault();
    if (usernameInput.trim()) {
      loginUser(usernameInput.trim());
      setUsernameInput('');
    } else {
      alert('Por favor, ingresa un nombre de usuario.');
    }
  };

  return (
    <form onSubmit={handleSubmit} style={{ border: '1px solid #ddd', padding: '20px', borderRadius: '8px', backgroundColor: '#f9f9f9' }}>
      <h3>Iniciar Sesión</h3>
      <label>
        Nombre de Usuario:
        <input
          type="text"
          value={usernameInput}
          onChange={(e) => setUsernameInput(e.target.value)}
          style={{ marginLeft: '10px', padding: '5px' }}
        />
      </label>
      <button type="submit" style={{ marginLeft: '10px', padding: '8px 15px', backgroundColor: '#007bff', color: 'white', border: 'none', borderRadius: '5px', cursor: 'pointer' }}>
        Login
      </button>
    </form>
  );
}

// Componente de estadísticas del usuario (solo visible si autenticado)
function UserStats() {
  const { isAuthenticated, currentUser } = useUser();

  if (!isAuthenticated) {
    return <p style={{ color: '#888' }}>Inicia sesión para ver tus estadísticas.</p>;
  }

  return (
    <div style={{ border: '1px dashed blue', padding: '15px', marginTop: '20px' }}>
      <h4>Estadísticas de {currentUser.name}</h4>
      <p>ID de sesión: {currentUser.id}</p>
      <p>¡Has visitado 5 páginas hoy!</p>
    </div>
  );
}


// Componente principal de la aplicación
function App() {
  return (
    <UserProvider> {/* Envuelve todos los componentes que necesitan acceso al contexto de usuario */}
      <div style={{ fontFamily: 'Arial, sans-serif', padding: '20px' }}>
        <h1>Ejemplo de Proveedores y Consumidores de Contexto</h1>
        <WelcomeMessage />
        <LoginForm />
        <UserStats />
        <p>
          Observa cómo `WelcomeMessage`, `LoginForm` y `UserStats`
          acceden a la información del usuario a través del `UserProvider`
          sin prop drilling.
        </p>
      </div>
    </UserProvider>
  );
}

export default App;

// Ejemplo de componente Consumer (para componentes de clase o si no usas Hooks)
// import React from 'react';
// import { UserContext } from './UserContext';
//
// class ClassBasedUserDisplay extends React.Component {
//   render() {
//     return (
//       <UserContext.Consumer>
//         {({ currentUser, isAuthenticated }) => (
//           <div style={{ marginTop: '20px', border: '1px solid purple', padding: '10px' }}>
//             <h4>Componente de Clase (Consumidor)</h4>
//             {isAuthenticated ? (
//               <p>Usuario logueado: {currentUser.name}</p>
//             ) : (
//               <p>No hay usuario logueado.</p>
//             )}
//           </div>
//         )}
//       </UserContext.Consumer>
//     );
//   }
// }
//
// // Para usarlo, simplemente lo renderizas dentro de UserProvider
// // <ClassBasedUserDisplay />
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Manejo de Estado Global',
    'topic': 'Context API',
    'subtopic': 'Limitaciones y casos de uso',
    'definition': '''
Aunque la Context API es una herramienta poderosa para evitar el "prop drilling" y compartir estado global, no es una solución mágica para *todo* el manejo de estado en React. Tiene sus propias limitaciones y es importante saber cuándo es el mejor momento para usarla.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en las principales limitaciones. La Context API **no está optimizada para actualizaciones de alta frecuencia**. Si el valor que pasas a través del contexto cambia muy a menudo, todos los componentes que consumen ese contexto (incluso si no usan directamente la parte del valor que cambió) se re-renderizarán. Esto puede llevar a problemas de rendimiento si no se maneja con cuidado. Para estados que cambian constantemente o que requieren interacciones complejas con efectos secundarios, podrías considerar soluciones más robustas como Redux o Zustand.

Además, el Context API hace que la inferencia de dónde provienen los datos sea un poco más difícil, ya que no se ve en la firma de las `props`. No es ideal para pasar estado de componente a componente que solo está a uno o dos niveles de profundidad, porque el `prop drilling` ocasional puede ser más claro.

**Casos de uso ideales para Context API:**

* **Datos globales "semi-estáticos":** Información que no cambia muy a menudo y es necesaria en muchas partes de la aplicación. Ejemplos clásicos incluyen:
    * **Temas de UI** (claro/oscuro).
    * **Información de autenticación del usuario** (si está logueado, su ID, etc.).
    * **Configuración de idioma** o localización.
* **Evitar prop drilling excesivo:** Cuando tienes un dato que necesita ser pasado por 3 o más niveles de componentes, y los componentes intermedios no lo usan, Context es una excelente solución.
* **Inyección de dependencias:** Para proporcionar instancias de APIs, servicios o configuraciones a un sub-árbol de componentes.

En resumen, la Context API es genial para evitar el desorden de props para datos de alcance global y de actualización infrecuente. Sin embargo, para estados complejos, que cambian a menudo, o que necesitan una lógica de gestión más sofisticada (middleware, historial de estados, etc.), librerías dedicadas al manejo de estado suelen ser una mejor opción. Es una herramienta poderosa, pero como toda herramienta, saber cuándo y cuándo no usarla es la clave.
''',
    'code_example': r'''
// Ejemplo ilustrativo de las limitaciones del Context API y cuándo usarlo

// 1. Contexto de Notificaciones (ejemplo de actualización frecuente, podría ser un anti-patrón)
import React, { createContext, useState, useContext, useEffect } from 'react';

const NotificationContext = createContext(null);

export function NotificationProvider({ children }) {
  const [notifications, setNotifications] = useState([]);

  // Simula la adición de nuevas notificaciones cada cierto tiempo
  useEffect(() => {
    let count = 0;
    const interval = setInterval(() => {
      count++;
      setNotifications(prev => [...prev, `Notificación ${count} - ${new Date().toLocaleTimeString()}`]);
    }, 3000); // Añade una notificación cada 3 segundos

    return () => clearInterval(interval);
  }, []);

  // Solo se usa para demostrar la actualización, no se expone un `addNotification` aquí
  const value = { notifications };

  console.log('NotificationProvider re-renderizado'); // Observa cuántas veces se re-renderiza
  return (
    <NotificationContext.Provider value={value}>
      {children}
    </NotificationContext.Provider>
  );
}

function useNotifications() {
  return useContext(NotificationContext);
}

// Componente que consume las notificaciones (se re-renderizará con cada nueva notificación)
function NotificationDisplay() {
  const { notifications } = useNotifications();
  console.log('  NotificationDisplay re-renderizado');

  return (
    <div style={{ border: '1px solid #ccc', padding: '10px', maxHeight: '150px', overflowY: 'auto' }}>
      <h4>Notificaciones (Actualización frecuente)</h4>
      <ul>
        {notifications.map((notif, index) => (
          <li key={index} style={{ fontSize: '0.9em', marginBottom: '5px' }}>{notif}</li>
        ))}
      </ul>
    </div>
  );
}

// 2. Contexto de Preferencias de Usuario (ejemplo de caso de uso ideal - pocas actualizaciones)
const PreferencesContext = createContext(null);

export function PreferencesProvider({ children }) {
  const [fontSize, setFontSize] = useState(16);
  const [animationsEnabled, setAnimationsEnabled] = useState(true);

  const toggleAnimations = () => setAnimationsEnabled(prev => !prev);
  const increaseFontSize = () => setFontSize(prev => prev + 2);

  const value = { fontSize, animationsEnabled, toggleAnimations, increaseFontSize };

  console.log('PreferencesProvider re-renderizado'); // Observa cuántas veces se re-renderiza
  return (
    <PreferencesContext.Provider value={value}>
      {children}
    </PreferencesContext.Provider>
  );
}

function usePreferences() {
  return useContext(PreferencesContext);
}

// Componente que consume las preferencias (se re-renderiza solo cuando las preferencias cambian)
function UserPreferencesPanel() {
  const { fontSize, animationsEnabled, toggleAnimations, increaseFontSize } = usePreferences();
  console.log('  UserPreferencesPanel re-renderizado');

  return (
    <div style={{ border: '1px solid #007bff', padding: '10px', marginTop: '20px' }}>
      <h4>Preferencias de Usuario (Actualización infrecuente)</h4>
      <p style={{ fontSize: `${fontSize}px` }}>Tamaño de Fuente: {fontSize}px</p>
      <p>Animaciones: {animationsEnabled ? 'Habilitadas' : 'Deshabilitadas'}</p>
      <button onClick={increaseFontSize}>Aumentar Fuente</button>
      <button onClick={toggleAnimations}>Alternar Animaciones</button>
      <p style={{ fontSize: '0.8em', color: '#666' }}>
        Este componente se re-renderiza solo cuando sus preferencias cambian,
        no con cada notificación.
      </p>
    </div>
  );
}

// Componente intermedio que no usa el contexto, pero se re-renderiza si su padre sí
function IntermediateComponent({ children }) {
  console.log('    IntermediateComponent re-renderizado');
  return (
    <div style={{ border: '1px dashed gray', margin: '10px', padding: '10px' }}>
      <p>Componente Intermedio (se re-renderiza si el Provider lo hace)</p>
      {children}
    </div>
  );
}

// Componente principal de la aplicación
function App() {
  return (
    <NotificationProvider> {/* Contexto que se actualiza frecuentemente */}
      <PreferencesProvider> {/* Contexto que se actualiza menos frecuentemente */}
        <div style={{ fontFamily: 'Arial, sans-serif', padding: '20px' }}>
          <h1>Context API: Limitaciones y Casos de Uso</h1>
          <p>
            Abre la consola y observa los logs de re-renderizado para entender cuándo se re-renderizan
            los proveedores y los consumidores.
          </p>

          <NotificationDisplay />

          <IntermediateComponent>
            <UserPreferencesPanel />
          </IntermediateComponent>

          <p style={{ marginTop: '30px', borderTop: '1px solid #ccc', paddingTop: '15px' }}>
            **Conclusión:**
            <ul>
              <li>El `NotificationProvider` y `NotificationDisplay` se re-renderizan a menudo porque el estado del contexto cambia frecuentemente.</li>
              <li>El `PreferencesProvider` y `UserPreferencesPanel` se re-renderizan solo cuando sus propios valores de contexto cambian.</li>
              <li>`IntermediateComponent` se re-renderiza porque es un hijo del `PreferencesProvider` (incluso si no usa el contexto directamente).</li>
            </ul>
            Usa Context para datos globales que no cambian a menudo; para datos de alta frecuencia, considera `useReducer` o librerías de manejo de estado dedicadas.
          </p>
        </div>
      </PreferencesProvider>
    </NotificationProvider>
  );
}

export default App;

// Ejemplo incorrecto (uso de Context para cada pequeña pieza de estado local)
// function MisplacedContext() {
//   // Esto no es un buen caso de uso para Context.
//   // Se debería usar useState para el estado local de un contador.
//   const MyCounterContext = createContext(0);
//   // ... Provider y Consumer para un simple contador ...
// }
// Context API añade overhead y no es necesario para estado local o de bajo nivel.
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Manejo de Estado Global',
    'topic': 'Redux',
    'subtopic': 'Conceptos básicos de Redux: store, actions, reducers',
    'definition': '''
Redux es una librería de manejo de estado predecible para aplicaciones JavaScript. Su core se basa en tres principios fundamentales: un único *store*, *actions* que describen lo que pasó, y *reducers* que especifican cómo el estado cambia en respuesta a esas actions.

No sé tú, pero a mí esto al principio me costó un poco entender. ¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una aplicación compleja donde diferentes componentes, a menudo muy distantes en el árbol de componentes, necesitan compartir y actualizar el mismo estado. Si usaras solo el Context API o el estado local de React, podrías terminar con un flujo de datos confuso y difícil de depurar. Redux centraliza todo el estado de tu aplicación en un solo lugar: el **Store**. Este `store` es la "fuente de la verdad" para todo el estado. Para cambiar el estado, nunca lo modificas directamente. En su lugar, `dispatches` (despachas) una **Action**. Una `action` es simplemente un objeto JavaScript plano que describe lo que sucedió, con un tipo (`type`) y opcionalmente un `payload` (los datos necesarios para el cambio). Finalmente, los **Reducers** son funciones puras que toman el estado actual y una `action`, y devuelven un *nuevo* estado. Son puros porque nunca modifican el estado original, siempre devuelven una nueva versión. Esta arquitectura de flujo de datos unidireccional hace que las actualizaciones de estado sean predecibles y fáciles de rastrear, lo que es invaluable en aplicaciones grandes y complejas.
''',
    'code_example': r'''
// 1. Conceptos básicos de Redux sin React (Core Redux)
// Para instalar: npm install redux

import { createStore } from 'redux';

// 2. Definir Actions (Describen lo que pasó)
// Las acciones son objetos JavaScript planos con una propiedad 'type'.
const incrementarContador = () => {
  return {
    type: 'INCREMENTAR', // Tipo de acción
  };
};

const decrementarContador = () => ({
  type: 'DECREMENTAR',
});

const sumarCantidad = (cantidad) => ({
  type: 'SUMAR_CANTIDAD',
  payload: cantidad, // Datos adicionales que la acción lleva
});

// 3. Definir Reducers (Especifican cómo el estado cambia)
// Un reducer es una función pura que toma el estado actual y una acción,
// y devuelve un NUEVO estado. ¡Nunca muta el estado original!
function contadorReducer(state = { count: 0 }, action) {
  switch (action.type) {
    case 'INCREMENTAR':
      return { ...state, count: state.count + 1 }; // Devuelve un nuevo objeto de estado
    case 'DECREMENTAR':
      return { ...state, count: state.count - 1 };
    case 'SUMAR_CANTIDAD':
      return { ...state, count: state.count + action.payload };
    default:
      return state; // Si la acción no es reconocida, devuelve el estado actual sin cambios
  }
}

// 4. Crear el Store (El único lugar donde reside todo el estado de la aplicación)
// Se crea el store pasándole la función reducer.
const store = createStore(contadorReducer);

console.log('Estado inicial:', store.getState()); // { count: 0 }

// 5. Suscribirse a los cambios en el Store (Opcional, pero útil para depuración o UI)
// La función de suscripción se ejecuta cada vez que el estado del store cambia.
const unsubscribe = store.subscribe(() => {
  console.log('Estado actualizado (desde suscripción):', store.getState());
});

// 6. Despachar Actions (La única forma de cambiar el estado)
// Disparamos las acciones para notificar al reducer que algo ha pasado.
store.dispatch(incrementarContador());    // count: 1
store.dispatch(incrementarContador());    // count: 2
store.dispatch(decrementarContador());    // count: 1
store.dispatch(sumarCantidad(10));       // count: 11
store.dispatch(sumarCantidad(3));        // count: 14

// Dejar de escuchar cambios (cuando ya no es necesario)
unsubscribe();

store.dispatch(incrementarContador()); // Esto no se logueará por la suscripción

// Ejemplo de un reducer incorrecto (mutación directa del estado)
// function badReducer(state = { count: 0 }, action) {
//   if (action.type === 'INCREMENTAR_MAL') {
//     state.count++; // ¡ERROR! Esto muta el estado directamente.
//     return state;
//   }
//   return state;
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Manejo de Estado Global',
    'topic': 'Redux',
    'subtopic': 'Integración con React mediante react-redux',
    'definition': '''
Aunque Redux gestiona el estado de forma independiente a cualquier framework UI, `react-redux` es la librería oficial que facilita la integración de un *store* de Redux con tus componentes de React, haciendo que el acceso y la actualización del estado global sean fluidos.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en que ya tienes tu `store` de Redux configurado, con tus `actions` y `reducers`. Ahora, ¿cómo conectas tus componentes de React a este `store` para que puedan leer el estado y despachar acciones? Aquí es donde entra `react-redux`. Proporciona dos elementos clave: el componente `<Provider>` y los Hooks `useSelector()` y `useDispatch()`.

El `<Provider>` es un componente que envuelve toda tu aplicación de React (o la parte que necesita acceso al `store`). Recibe el `store` de Redux como una `prop` y lo hace disponible para todos los componentes anidados. Es similar al `Provider` de la Context API, pero específico para Redux.

Para que tus componentes funcionales accedan al estado del `store`, usas el Hook `useSelector()`. Le pasas una función "selectora" que toma el estado completo de Redux y devuelve la porción específica del estado que tu componente necesita. Esto es muy eficiente porque `useSelector` solo re-renderiza el componente si la porción del estado que "seleccionó" realmente cambia. Para despachar acciones (la única forma de cambiar el estado en Redux), utilizas el Hook `useDispatch()`. Este Hook te devuelve la función `dispatch` del `store`, que luego usas para pasar tus objetos de acción. Esta combinación de `Provider`, `useSelector` y `useDispatch` es el patrón estándar para construir aplicaciones React con Redux, manteniendo tus componentes limpios y separados de la lógica de negocio del estado.
''',
    'code_example': r'''
// 1. Instalar: npm install redux react-redux

// store.js (Configuración de Redux Store)
import { createStore } from 'redux';

// Reducer simple
function contadorReducer(state = { count: 0 }, action) {
  switch (action.type) {
    case 'INCREMENTAR':
      return { ...state, count: state.count + 1 };
    case 'DECREMENTAR':
      return { ...state, count: state.count - 1 };
    default:
      return state;
  }
}

// Crear el Store
const store = createStore(contadorReducer);

export default store;


// App.js (Integración React + Redux)
import React from 'react';
import { Provider, useSelector, useDispatch } from 'react-redux';
import store from './store'; // Importamos nuestro store de Redux
import './App.css'; // Para estilos básicos

// Componente que muestra el contador y despacha acciones
function ContadorComponente() {
  // 1. useSelector: Para leer el estado del store
  const count = useSelector(state => state.count); // Selecciona la propiedad 'count' del estado

  // 2. useDispatch: Para obtener la función dispatch
  const dispatch = useDispatch();

  return (
    <div className="counter-container">
      <h3>Contador con Redux: {count}</h3>
      <button onClick={() => dispatch({ type: 'INCREMENTAR' })}>
        Incrementar
      </button>
      <button onClick={() => dispatch({ type: 'DECREMENTAR' })}>
        Decrementar
      </button>
      <p>
        El estado del contador es global y manejado por Redux.
      </p>
    </div>
  );
}

// Otro componente que también accede al contador
function DisplayContador() {
  const count = useSelector(state => state.count);
  return (
    <div className="display-container">
      <h4>El contador actual es: {count}</h4>
      <p>Este componente también lee el mismo estado global.</p>
    </div>
  );
}

function App() {
  return (
    // 3. Provider: Envuelve tu aplicación (o la parte que necesita acceso al store)
    // y le pasa el store de Redux.
    <Provider store={store}>
      <div className="App">
        <h1>Integración de Redux con React</h1>
        <ContadorComponente />
        <DisplayContador />
        <p>
          Observa cómo ambos componentes acceden y actualizan el mismo estado de Redux.
        </p>
      </div>
    </Provider>
  );
}

export default App;

// App.css (ejemplo de estilos)
/*
.App {
  font-family: Arial, sans-serif;
  text-align: center;
  padding: 20px;
}

.counter-container, .display-container {
  border: 2px solid #007bff;
  padding: 20px;
  margin: 20px auto;
  max-width: 400px;
  border-radius: 8px;
  background-color: #f0f8ff;
}

button {
  background-color: #28a745;
  color: white;
  padding: 10px 15px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  margin: 0 10px;
  font-size: 1em;
  transition: background-color 0.2s;
}

button:hover {
  background-color: #218838;
}
*/

// Ejemplo incorrecto (mutar el estado directamente desde un componente React sin dispatch)
// function BadComponent() {
//   const count = useSelector(state => state.count);
//   // ¡MAL! Nunca mutar el estado de Redux directamente desde un componente
//   // count++;
//   return <p>...</p>
// }
// La única forma de cambiar el estado de Redux es despachando acciones.
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Manejo de Estado Global',
    'topic': 'Redux',
    'subtopic': 'Uso de middleware como redux-thunk',
    'definition': '''
El concepto de "middleware" en Redux es una capa de funcionalidad que se interpone entre el despacho de una acción y el momento en que esa acción llega a los *reducers*. Es el lugar perfecto para manejar efectos secundarios, como llamadas a APIs, logging o lógica asíncrona.

No sé tú, pero a mí esto al principio me costó un poco entender. ¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en que necesitas obtener datos de un servidor. Esa operación es asíncrona, es decir, no ocurre de inmediato. Los *reducers* de Redux deben ser funciones puras y síncronas; no pueden realizar llamadas a APIs o tener efectos secundarios. Si intentaras despachar una acción que directamente hace una llamada de red, romperías la pureza del reducer y la predecibilidad de Redux. Aquí es donde el middleware entra en juego.

`Redux-Thunk` es uno de los middleware más comunes y sencillos. Permite que las `actions` que despachas no sean solo objetos JavaScript planos, sino también *funciones*. Cuando `redux-thunk` intercepta una `action` que es una función, la ejecuta y le pasa los argumentos `dispatch` y `getState`. Esto te permite realizar operaciones asíncronas dentro de esa función y luego despachar *otras* acciones (objetos planos) cuando la operación asíncrona se completa (por ejemplo, `FETCH_SUCCESS` o `FETCH_FAILURE`). Así, tu lógica asíncrona se encapsula en las `actions` (o "thunks"), manteniendo los `reducers` puros y la integridad del flujo de datos de Redux. Es esencial para manejar operaciones complejas fuera del flujo síncrono estándar de Redux.
''',
    'code_example': r'''
// 1. Instalar: npm install redux react-redux redux-thunk

// store.js (Configuración del Store con Middleware)
import { createStore, applyMiddleware } from 'redux';
import { thunk } from 'redux-thunk'; // Importamos el middleware Redux Thunk

// Reducer de ejemplo para gestionar el estado de los posts
const initialState = {
  posts: [],
  loading: false,
  error: null,
};

function postsReducer(state = initialState, action) {
  switch (action.type) {
    case 'FETCH_POSTS_REQUEST':
      return { ...state, loading: true, error: null };
    case 'FETCH_POSTS_SUCCESS':
      return { ...state, loading: false, posts: action.payload };
    case 'FETCH_POSTS_FAILURE':
      return { ...state, loading: false, error: action.payload };
    default:
      return state;
  }
}

// Crear el Store aplicando el middleware thunk
const store = createStore(postsReducer, applyMiddleware(thunk));

export default store;


// actions.js (Definición de Actions y Async Actions - Thunks)

// Action creators para el estado de la solicitud
const fetchPostsRequest = () => ({
  type: 'FETCH_POSTS_REQUEST',
});

const fetchPostsSuccess = (posts) => ({
  type: 'FETCH_POSTS_SUCCESS',
  payload: posts,
});

const fetchPostsFailure = (error) => ({
  type: 'FETCH_POSTS_FAILURE',
  payload: error,
});

// Un "thunk" (una función que despacha otras acciones)
// Este es el middleware que permite manejar lógica asíncrona
export const fetchPosts = () => {
  // Retorna una función que recibe `dispatch` y `getState`
  return async (dispatch, getState) => {
    dispatch(fetchPostsRequest()); // Despacha la acción de solicitud
    try {
      const response = await fetch('https://jsonplaceholder.typicode.com/posts?_limit=5');
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      const data = await response.json();
      dispatch(fetchPostsSuccess(data)); // Despacha éxito con los datos
    } catch (error) {
      dispatch(fetchPostsFailure(error.message)); // Despacha fallo con el error
    }
  };
};


// App.js (Componente React que usa el middleware)
import React, { useEffect } from 'react';
import { Provider, useSelector, useDispatch } from 'react-redux';
import store from './store';
import { fetchPosts } from './actions'; // Importamos nuestra acción asíncrona (thunk)
import './App.css'; // Para estilos

function PostsList() {
  const { posts, loading, error } = useSelector(state => state); // Selecciona todo el estado de posts
  const dispatch = useDispatch();

  useEffect(() => {
    // Cuando el componente se monta, despacha la acción asíncrona (thunk)
    dispatch(fetchPosts());
  }, [dispatch]); // Asegúrate de que el efecto se ejecuta solo una vez al montar

  if (loading) {
    return <div className="loading-message">Cargando posts...</div>;
  }

  if (error) {
    return <div className="error-message">Error: {error}</div>;
  }

  return (
    <div className="posts-container">
      <h2>Posts Fetcheados (con Redux Thunk)</h2>
      <ul>
        {posts.map(post => (
          <li key={post.id}>
            <strong>{post.title}</strong>
            <p>{post.body.substring(0, 50)}...</p>
          </li>
        ))}
      </ul>
      <p>
        Los datos se cargan de una API de forma asíncrona,
        manejando los estados de carga y error a través de Redux Thunk.
      </p>
    </div>
  );
}

function App() {
  return (
    <Provider store={store}>
      <div className="App">
        <h1>Redux Middleware: Redux Thunk</h1>
        <PostsList />
      </div>
    </Provider>
  );
}

export default App;

// App.css (ejemplo de estilos)
/*
.App {
  font-family: Arial, sans-serif;
  text-align: center;
  padding: 20px;
}

.posts-container {
  border: 2px solid #28a745;
  padding: 20px;
  margin: 20px auto;
  max-width: 600px;
  border-radius: 8px;
  background-color: #e6ffe6;
}

.posts-container ul {
  list-style: none;
  padding: 0;
}

.posts-container li {
  background-color: #fff;
  border: 1px solid #ddd;
  margin-bottom: 10px;
  padding: 10px;
  border-radius: 5px;
  text-align: left;
}

.loading-message {
  color: #007bff;
  font-size: 1.2em;
  margin-top: 20px;
}

.error-message {
  color: #dc3545;
  font-size: 1.2em;
  margin-top: 20px;
}
*/

// Ejemplo incorrecto (intentar hacer llamadas asíncronas directamente en el reducer)
// function badReducer(state = { data: null }, action) {
//   if (action.type === 'FETCH_DATA_BAD') {
//     // ¡ERROR! No se deben hacer efectos secundarios o llamadas asíncronas aquí.
//     // fetch('some-api-url').then(res => res.json()).then(data => { /* ... */ });
//     return { ...state, data: "esto no es predecible" };
//   }
//   return state;
// }
'''
  });
}

Future<void> insertReactMidLevel4Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Consumo de APIs',
    'topic': 'Fetch y Axios',
    'subtopic': 'Realización de peticiones HTTP con fetch',
    'definition': '''
El API `Fetch` es una interfaz moderna y potente para realizar peticiones de red, como solicitar datos de un servidor, directamente desde el navegador web. Es el estándar nativo de JavaScript para hacer peticiones HTTP.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en casi cualquier aplicación web que uses hoy en día, ya sea una red social, una tienda online o un servicio de streaming. Todas ellas necesitan comunicarse con un servidor para obtener información (tus publicaciones, los productos, las películas). Antes, para hacer esto en JavaScript, la gente usaba `XMLHttpRequest` (XHR), que era un poco engorroso de usar. `Fetch` vino a simplificar esto enormemente, ofreciendo una API basada en Promesas, lo que facilita el manejo de operaciones asíncronas y las cadenas de solicitudes.

Con `fetch`, puedes enviar solicitudes GET, POST, PUT, DELETE, etc., y manejar las respuestas del servidor. Cuando haces una petición `fetch`, devuelve una `Promise` que se resuelve en un objeto `Response`. Este objeto `Response` contiene información sobre la respuesta de la red, pero *no* los datos directamente. Para obtener los datos en formato JSON, por ejemplo, necesitas llamar a `response.json()`, que también devuelve una `Promise`. Esta dualidad de Promesas es importante porque la solicitud de red es una operación y la lectura del cuerpo de la respuesta es otra. Dominar `fetch` es fundamental para interactuar con cualquier backend desde tu aplicación React y para construir aplicaciones dinámicas que consumen datos externos.
''',
    'code_example': r'''
// Componente React que usa Fetch para obtener datos de una API
import React, { useState, useEffect } from 'react';
import './App.css'; // Para estilos básicos

function FetchDataComponent() {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    // Función asíncrona para realizar la petición Fetch
    const fetchData = async () => {
      try {
        setLoading(true); // Indica que la carga ha comenzado
        setError(null);   // Reinicia el error

        // 1. Realizar una petición GET simple a una API de ejemplo
        const response = await fetch('https://jsonplaceholder.typicode.com/posts?_limit=5');

        // 2. Comprobar si la respuesta fue exitosa (código de estado 200-299)
        if (!response.ok) {
          // Si la respuesta no es OK, lanza un error con el estado HTTP
          throw new Error(`Error HTTP: ${response.status} - ${response.statusText}`);
        }

        // 3. Parsear el cuerpo de la respuesta como JSON
        const result = await response.json();

        // 4. Actualizar el estado con los datos obtenidos
        setData(result);
      } catch (err) {
        // 5. Capturar y manejar cualquier error que ocurra durante la petición
        console.error("Error al obtener los datos:", err);
        setError(err.message); // Guarda el mensaje de error en el estado
      } finally {
        // 6. Finalmente, desactiva el indicador de carga
        setLoading(false);
      }
    };

    fetchData(); // Llama a la función para ejecutar la petición
  }, []); // El array vacío asegura que se ejecuta solo una vez al montar el componente

  if (loading) {
    return <div className="status-message loading">Cargando datos...</div>;
  }

  if (error) {
    return <div className="status-message error">Error: {error}</div>;
  }

  return (
    <div className="data-container">
      <h2>Posts Obtenidos con `fetch`</h2>
      <ul>
        {data.map(post => (
          <li key={post.id}>
            <strong>{post.title}</strong>
            <p>{post.body.substring(0, 70)}...</p>
          </li>
        ))}
      </ul>
      <p>
        Este componente carga los posts directamente desde una API
        utilizando la interfaz `fetch` del navegador.
      </p>
    </div>
  );
}

// Ejemplo de petición POST con Fetch
function PostDataComponent() {
  const [responseMessage, setResponseMessage] = useState('');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  const postNewItem = async () => {
    try {
      setLoading(true);
      setError(null);
      setResponseMessage('');

      const newItem = {
        title: 'Mi nuevo post',
        body: 'Este es el cuerpo del nuevo post creado con Fetch POST.',
        userId: 1,
      };

      const response = await fetch('https://jsonplaceholder.typicode.com/posts', {
        method: 'POST', // Especifica el método HTTP
        headers: {
          'Content-Type': 'application/json', // Indica que estamos enviando JSON
        },
        body: JSON.stringify(newItem), // Convierte el objeto JavaScript a cadena JSON
      });

      if (!response.ok) {
        throw new Error(`Error HTTP: ${response.status}`);
      }

      const result = await response.json();
      setResponseMessage(`Post creado exitosamente con ID: ${result.id}`);
      console.log('Nuevo post creado:', result);
    } catch (err) {
      console.error("Error al crear el post:", err);
      setError(err.message);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="data-container" style={{ borderColor: 'teal' }}>
      <h2>Crear Post con `fetch` (POST)</h2>
      <button onClick={postNewItem} disabled={loading}>
        {loading ? 'Enviando...' : 'Crear Nuevo Post'}
      </button>
      {responseMessage && <p className="success-message">{responseMessage}</p>}
      {error && <p className="error-message">{error}</p>}
      <p>
        Al hacer clic en el botón, se enviará un nuevo post de prueba a la API.
        Consulta la consola para ver el objeto de respuesta completo.
      </p>
    </div>
  );
}


function App() {
  return (
    <div className="App">
      <h1>Consumo de APIs con `fetch`</h1>
      <FetchDataComponent />
      <PostDataComponent />
    </div>
  );
}

export default App;

// App.css
/*
.App {
  font-family: Arial, sans-serif;
  text-align: center;
  padding: 20px;
}

.data-container {
  border: 2px solid #007bff;
  padding: 20px;
  margin: 20px auto;
  max-width: 600px;
  border-radius: 8px;
  background-color: #f0f8ff;
}

.data-container ul {
  list-style: none;
  padding: 0;
}

.data-container li {
  background-color: #fff;
  border: 1px solid #ddd;
  margin-bottom: 10px;
  padding: 10px;
  border-radius: 5px;
  text-align: left;
}

.status-message {
  padding: 10px;
  margin: 10px auto;
  max-width: 400px;
  border-radius: 5px;
  font-weight: bold;
}

.loading {
  background-color: #e0f7fa;
  color: #007bff;
}

.error {
  background-color: #ffebee;
  color: #dc3545;
}

.success-message {
  background-color: #e6ffe6;
  color: #28a745;
  padding: 10px;
  margin-top: 10px;
  border-radius: 5px;
}

button {
  background-color: #28a745;
  color: white;
  padding: 10px 15px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  margin-top: 10px;
  font-size: 1em;
  transition: background-color 0.2s;
}

button:hover:not(:disabled) {
  background-color: #218838;
}

button:disabled {
  background-color: #cccccc;
  cursor: not-allowed;
}
*/

// Ejemplo incorrecto (no manejar errores de red o HTTP)
// async function badFetchExample() {
//   // Si la red falla o el servidor devuelve un 404/500, esta Promise NO RECHAZARÁ
//   // solo si hay un problema de red (DNS, offline). Para errores HTTP, hay que chequear response.ok.
//   const response = await fetch('https://unexistente.api/data');
//   const data = await response.json(); // Esto podría lanzar un error si la respuesta no es JSON o si !response.ok
//   console.log(data);
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Consumo de APIs',
    'topic': 'Fetch y Axios',
    'subtopic': 'Uso de Axios para consumo de APIs',
    'definition': '''
Axios es una librería de cliente HTTP basada en Promesas para el navegador y Node.js. Ofrece una API más rica y fácil de usar en comparación con la API nativa `fetch`, especialmente para el manejo de peticiones y respuestas HTTP.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en que `fetch` es la herramienta integrada del navegador, pero a veces necesitas un poco más de potencia y conveniencia, sobre todo en aplicaciones React más grandes. Axios brilla aquí. Una de sus ventajas clave es el **manejo automático de JSON**: con Axios, no necesitas llamar a `response.json()` por separado; los datos JSON ya vienen parseados en la respuesta. Otra gran característica es la **gestión de errores mejorada**: Axios rechaza automáticamente las Promesas para cualquier respuesta con código de estado HTTP 4xx o 5xx (a diferencia de `fetch`, que solo rechaza la promesa si hay un problema de red).

Además, Axios facilita el uso de **interceptores**, que te permiten modificar las solicitudes o respuestas globalmente antes de que se envíen o se procesen. Esto es súper útil para añadir tokens de autenticación a todas las solicitudes salientes o para manejar errores de forma centralizada. También tiene protección CSRF integrada y la capacidad de cancelar peticiones. Por estas razones, muchas empresas y desarrolladores prefieren Axios para sus proyectos React, ya que ofrece una experiencia más robusta y menos verbosa para el consumo de APIs.
''',
    'code_example': r'''
// 1. Instalar Axios: npm install axios

// Componente React que usa Axios para obtener datos
import React, { useState, useEffect } from 'react';
import axios from 'axios'; // Importamos la librería Axios
import './App.css'; // Para estilos básicos

function AxiosDataComponent() {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchData = async () => {
      try {
        setLoading(true);
        setError(null);

        // 1. Realizar una petición GET con Axios
        // Axios devuelve una Promise que se resuelve con el objeto de respuesta
        const response = await axios.get('https://jsonplaceholder.typicode.com/todos?_limit=5');

        // 2. Axios parsea automáticamente el JSON; los datos están en response.data
        setData(response.data);
      } catch (err) {
        // 3. Axios captura automáticamente errores HTTP (4xx, 5xx) aquí
        console.error("Error al obtener los datos con Axios:", err);
        // Puedes acceder al estado HTTP del error: err.response.status
        if (err.response) {
          setError(`Error Axios: ${err.response.status} - ${err.message}`);
        } else if (err.request) {
          setError('Error de red: No se recibió respuesta del servidor.');
        } else {
          setError(`Error inesperado: ${err.message}`);
        }
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, []);

  if (loading) {
    return <div className="status-message loading">Cargando tareas con Axios...</div>;
  }

  if (error) {
    return <div className="status-message error">Error: {error}</div>;
  }

  return (
    <div className="data-container" style={{ borderColor: 'purple' }}>
      <h2>Tareas Obtenidas con `axios`</h2>
      <ul>
        {data.map(todo => (
          <li key={todo.id} className={todo.completed ? 'completed' : ''}>
            {todo.title} {todo.completed && '✅'}
          </li>
        ))}
      </ul>
      <p>
        Este componente carga tareas utilizando `axios`, con un manejo de errores
        más directo para respuestas HTTP.
      </p>
    </div>
  );
}

// Ejemplo de petición POST con Axios
function PostDataAxiosComponent() {
  const [responseMessage, setResponseMessage] = useState('');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  const postNewItem = async () => {
    try {
      setLoading(true);
      setError(null);
      setResponseMessage('');

      const newItem = {
        title: 'Mi nueva tarea con Axios',
        completed: false,
        userId: 1,
      };

      // Realizar petición POST con Axios
      const response = await axios.post('https://jsonplaceholder.typicode.com/todos', newItem);

      setResponseMessage(`Tarea creada exitosamente con ID: ${response.data.id}`);
      console.log('Nueva tarea creada:', response.data);
    } catch (err) {
      console.error("Error al crear la tarea con Axios:", err);
      if (err.response) {
        setError(`Error POST: ${err.response.status} - ${err.message}`);
      } else {
        setError(`Error inesperado: ${err.message}`);
      }
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="data-container" style={{ borderColor: 'darkorange' }}>
      <h2>Crear Tarea con `axios` (POST)</h2>
      <button onClick={postNewItem} disabled={loading}>
        {loading ? 'Enviando...' : 'Crear Nueva Tarea'}
      </button>
      {responseMessage && <p className="success-message">{responseMessage}</p>}
      {error && <p className="error-message">{error}</p>}
      <p>
        Axios simplifica el envío de datos JSON y el manejo de respuestas.
      </p>
    </div>
  );
}


function App() {
  return (
    <div className="App">
      <h1>Consumo de APIs con `Axios`</h1>
      <AxiosDataComponent />
      <PostDataAxiosComponent />
    </div>
  );
}

export default App;

// App.css (mismo que el anterior, añadiendo estilo para tareas completadas)
/*
.App {
  font-family: Arial, sans-serif;
  text-align: center;
  padding: 20px;
}

.data-container {
  border: 2px solid #007bff;
  padding: 20px;
  margin: 20px auto;
  max-width: 600px;
  border-radius: 8px;
  background-color: #f0f8ff;
}

.data-container ul {
  list-style: none;
  padding: 0;
}

.data-container li {
  background-color: #fff;
  border: 1px solid #ddd;
  margin-bottom: 10px;
  padding: 10px;
  border-radius: 5px;
  text-align: left;
}

.data-container li.completed {
  text-decoration: line-through;
  color: #888;
  background-color: #e6e6e6;
}

.status-message {
  padding: 10px;
  margin: 10px auto;
  max-width: 400px;
  border-radius: 5px;
  font-weight: bold;
}

.loading {
  background-color: #e0f7fa;
  color: #007bff;
}

.error {
  background-color: #ffebee;
  color: #dc3545;
}

.success-message {
  background-color: #e6ffe6;
  color: #28a745;
  padding: 10px;
  margin-top: 10px;
  border-radius: 5px;
}

button {
  background-color: #28a745;
  color: white;
  padding: 10px 15px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  margin-top: 10px;
  font-size: 1em;
  transition: background-color 0.2s;
}

button:hover:not(:disabled) {
  background-color: #218838;
}

button:disabled {
  background-color: #cccccc;
  cursor: not-allowed;
}
*/

// Ejemplo incorrecto (manejo de errores de Axios de forma incorrecta)
// async function badAxiosExample() {
//   try {
//     const response = await axios.get('https://api.example.com/nonexistent');
//     // Esto no es suficiente, Axios ya maneja el rechazo de la promesa para errores HTTP
//     // if (!response.status === 200) { throw new Error('Bad status'); }
//     console.log(response.data);
//   } catch (error) {
//     // Si no verificas error.response, podrías perder detalles importantes
//     console.error("Error genérico:", error.message); // Esto puede ser poco descriptivo
//   }
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Consumo de APIs',
    'topic': 'Fetch y Axios',
    'subtopic': 'Manejo de respuestas y errores',
    'definition': '''
Manejar correctamente las respuestas y los errores al consumir APIs es tan crucial como hacer la petición en sí. Una buena estrategia de manejo de errores garantiza que tu aplicación sea robusta y que el usuario reciba retroalimentación útil cuando algo sale mal.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una aplicación que depende de datos externos. Si la red se cae, el servidor no responde, o la API devuelve un error (por ejemplo, un 404 de "No encontrado" o un 500 de "Error del servidor"), tu aplicación necesita saber cómo reaccionar. Si no manejas estos escenarios, la aplicación podría simplemente "romperse" o mostrar una pantalla en blanco.

Con `fetch`, el primer paso es verificar `response.ok` (un booleano que indica si el código de estado HTTP está en el rango 200-299) *después* de que la promesa de `fetch` se resuelva. Si `response.ok` es falso, debes lanzar un error manualmente para que sea capturado en el bloque `catch`. Luego, para obtener los datos, usas métodos como `response.json()` o `response.text()`, que también devuelven promesas. En el bloque `catch`, puedes inspeccionar el error para determinar su tipo (problema de red, error HTTP, etc.) y mostrar un mensaje apropiado al usuario o registrar el error.

Con `Axios`, el manejo de errores es más directo: Axios automáticamente rechaza la promesa para cualquier respuesta que no sea un 2xx, lo que significa que puedes capturar errores HTTP directamente en tu bloque `catch`. El objeto `error` de Axios es muy informativo y te permite acceder a la respuesta (`error.response`), la solicitud (`error.request`) o el mensaje del error (`error.message`). Implementar estos patrones de manejo de errores no solo hace tu código más fiable, sino que también mejora la experiencia del usuario al informarle sobre posibles problemas en la comunicación con el servidor.
''',
    'code_example': r'''
// Componente React que demuestra el manejo de respuestas y errores con Fetch y Axios

import React, { useState } from 'react';
import axios from 'axios';
import './App.css'; // Para estilos

function ApiResponseHandler() {
  const [fetchData, setFetchData] = useState(null);
  const [fetchError, setFetchError] = useState(null);
  const [axiosData, setAxiosData] = useState(null);
  const [axiosError, setAxiosError] = useState(null);
  const [loadingFetch, setLoadingFetch] = useState(false);
  const [loadingAxios, setLoadingAxios] = useState(false);

  // --- Manejo con Fetch ---
  const handleFetchRequest = async (url, type) => {
    setLoadingFetch(true);
    setFetchData(null);
    setFetchError(null);
    try {
      const response = await fetch(url);

      // Paso 1: Siempre verificar response.ok para errores HTTP con Fetch
      if (!response.ok) {
        // Lanzar un error para que sea capturado por el bloque catch
        const errorBody = await response.json().catch(() => ({ message: 'Error desconocido' }));
        throw new Error(`Fetch Error ${response.status}: ${errorBody.message || response.statusText}`);
      }

      // Paso 2: Procesar el cuerpo de la respuesta
      const result = await response.json();
      setFetchData(result);
    } catch (err) {
      // Paso 3: Capturar errores de red o los errores lanzados manualmente
      console.error(`Error en petición ${type} con Fetch:`, err);
      setFetchError(`Fetch falló: ${err.message}`);
    } finally {
      setLoadingFetch(false);
    }
  };

  // --- Manejo con Axios ---
  const handleAxiosRequest = async (url, type) => {
    setLoadingAxios(true);
    setAxiosData(null);
    setAxiosError(null);
    try {
      // Axios automáticamente rechaza la Promise para códigos de estado 4xx/5xx
      const response = await axios.get(url);

      // Los datos ya están parseados en response.data
      setAxiosData(response.data);
    } catch (err) {
      // Axios proporciona un objeto de error más detallado
      console.error(`Error en petición ${type} con Axios:`, err);
      if (err.response) {
        // El servidor respondió con un código de estado fuera del rango 2xx
        setAxiosError(`Axios Error ${err.response.status}: ${err.response.data?.message || err.message}`);
      } else if (err.request) {
        // La petición fue hecha pero no se recibió respuesta (ej. red caída)
        setAxiosError('Axios Error: No se recibió respuesta del servidor. ¿Problema de red?');
      } else {
        // Algo más causó el error
        setAxiosError(`Axios Error: ${err.message}`);
      }
    } finally {
      setLoadingAxios(false);
    }
  };

  return (
    <div className="App">
      <h1>Manejo de Respuestas y Errores de API</h1>

      <div className="api-section">
        <h2>Peticiones con `fetch`</h2>
        <button onClick={() => handleFetchRequest('https://jsonplaceholder.typicode.com/posts?_limit=3', 'GET Válido')} disabled={loadingFetch}>
          {loadingFetch ? 'Cargando...' : 'Obtener Posts (OK)'}
        </button>
        <button onClick={() => handleFetchRequest('https://jsonplaceholder.typicode.com/nonexistent-endpoint', 'GET Fallido 404')} disabled={loadingFetch}>
          {loadingFetch ? 'Cargando...' : 'Obtener Fallido (404)'}
        </button>
        <div className="response-display">
          {loadingFetch && <div className="status-message loading">Cargando...</div>}
          {fetchError && <div className="status-message error">{fetchError}</div>}
          {fetchData && (
            <div className="status-message success">
              <p>Datos OK ({fetchData.length} ítems)</p>
              <pre>{JSON.stringify(fetchData[0], null, 2)}...</pre>
            </div>
          )}
        </div>
      </div>

      <div className="api-section">
        <h2>Peticiones con `axios`</h2>
        <button onClick={() => handleAxiosRequest('https://jsonplaceholder.typicode.com/users?_limit=3', 'GET Válido')} disabled={loadingAxios}>
          {loadingAxios ? 'Cargando...' : 'Obtener Usuarios (OK)'}
        </button>
        <button onClick={() => handleAxiosRequest('https://jsonplaceholder.typicode.com/broken-api-endpoint', 'GET Fallido 404')} disabled={loadingAxios}>
          {loadingAxios ? 'Cargando...' : 'Obtener Fallido (404)'}
        </button>
        <div className="response-display">
          {loadingAxios && <div className="status-message loading">Cargando...</div>}
          {axiosError && <div className="status-message error">{axiosError}</div>}
          {axiosData && (
            <div className="status-message success">
              <p>Datos OK ({axiosData.length} ítems)</p>
              <pre>{JSON.stringify(axiosData[0], null, 2)}...</pre>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}

export default ApiResponseHandler;

// App.css (misma que las anteriores, con algunas adiciones para las secciones)
/*
.App {
  font-family: Arial, sans-serif;
  text-align: center;
  padding: 20px;
}

.api-section {
  border: 2px solid #555;
  padding: 20px;
  margin: 30px auto;
  max-width: 700px;
  border-radius: 10px;
  background-color: #f8f8f8;
}

.api-section h2 {
  color: #333;
  margin-bottom: 20px;
}

button {
  background-color: #007bff;
  color: white;
  padding: 10px 15px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  margin: 0 10px 15px;
  font-size: 1em;
  transition: background-color 0.2s;
}

button:hover:not(:disabled) {
  background-color: #0056b3;
}

button:disabled {
  background-color: #cccccc;
  cursor: not-allowed;
}

.response-display {
  margin-top: 20px;
  min-height: 100px; /* Para mantener el layout */
  background-color: #fff;
  border: 1px dashed #ccc;
  padding: 10px;
  border-radius: 5px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 0.9em;
}

.status-message {
  padding: 10px;
  border-radius: 5px;
  font-weight: bold;
  width: 90%;
}

.loading {
  background-color: #e0f7fa;
  color: #007bff;
}

.error {
  background-color: #ffebee;
  color: #dc3545;
}

.success {
  background-color: #e6ffe6;
  color: #28a745;
}

.success pre {
  text-align: left;
  white-space: pre-wrap; /* Permite saltos de línea */
  word-wrap: break-word; /* Rompe palabras largas */
  max-height: 150px;
  overflow-y: auto;
  background-color: #f5f5f5;
  padding: 10px;
  border-radius: 5px;
  margin-top: 10px;
}
*/

// Ejemplo incorrecto (no usar .catch() para errores de red)
// async function noCatchExample() {
//   try {
//     // Si no hay conexión a internet, esta línea lanzaría un error
//     // y no sería capturado si no hay un .catch() o un try-catch envolviéndola.
//     const response = await fetch('https://www.google.com/unreachable-resource');
//     const data = await response.json();
//   } catch (e) {
//     // Este catch es esencial para capturar errores de red o errores lanzados manualmente
//     console.error("Error no manejado:", e);
//   }
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Consumo de APIs',
    'topic': 'Manejo de Datos Asíncronos',
    'subtopic': 'Estados de carga y error',
    'definition': '''
Cuando tu aplicación React necesita obtener datos de una API externa, esas operaciones son asíncronas. Esto significa que la respuesta no es instantánea, y durante ese tiempo, el usuario no puede quedar a la deriva. Es crucial gestionar los estados de carga y error para proporcionar una experiencia de usuario fluida y transparente.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una página que muestra una lista de productos. Si el usuario hace clic para ver la lista y no pasa nada durante unos segundos, podría pensar que la aplicación está rota. Si la red falla o el servidor devuelve un error, una pantalla en blanco no le dice nada. Por eso, mostrar un **estado de carga** (un spinner, un mensaje "Cargando...") le indica al usuario que la aplicación está trabajando y que espere. Una vez que los datos llegan, se oculta el indicador y se muestran los datos. Si ocurre un problema, mostrar un **estado de error** (un mensaje descriptivo, un botón para reintentar) le permite al usuario entender qué pasó y cómo podría solucionarlo.

La forma común de manejar esto en React es utilizando el Hook `useState`. Necesitarás al menos tres estados: uno para los datos (`data`), uno para indicar si la operación está en curso (`loading`), y uno para capturar cualquier mensaje de error (`error`). Antes de la petición asíncrona, estableces `loading` a `true` y `error` a `null`. Si la petición es exitosa, actualizas `data` y `loading` a `false`. Si falla, capturas el error, actualizas `error` con un mensaje y `loading` a `false`. Esta combinación te permite renderizar condicionalmente diferentes partes de tu UI según el estado actual de la operación asíncrona, ofreciendo una experiencia mucho más profesional y amigable.
''',
    'code_example': r'''
// Componente React que demuestra el manejo de estados de carga y error
import React, { useState, useEffect } from 'react';
import './App.css'; // Para estilos básicos

function DataFetchingComponent() {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(false); // Estado inicial: no cargando
  const [error, setError] = useState(null);     // Estado inicial: sin error

  const fetchData = async (simulateError = false) => {
    setLoading(true); // Se inicia la carga
    setError(null);   // Se limpia cualquier error previo
    setData(null);    // Se limpian datos previos

    try {
      // Simular un retardo de red
      await new Promise(resolve => setTimeout(resolve, 1500));

      if (simulateError) {
        // Simular un error de API (ej. 500 Internal Server Error)
        throw new Error('Lo sentimos, algo salió mal en el servidor.');
      }

      // Simular una llamada exitosa a una API
      const response = await fetch('https://jsonplaceholder.typicode.com/users?_limit=3');
      if (!response.ok) {
        throw new Error(`Error HTTP: ${response.status}`);
      }
      const users = await response.json();
      setData(users); // Datos obtenidos
    } catch (err) {
      setError(err.message); // Captura el error
    } finally {
      setLoading(false); // La carga ha terminado (éxito o error)
    }
  };

  useEffect(() => {
    // Cargar datos automáticamente al montar el componente
    fetchData();
  }, []);

  return (
    <div className="data-display-container">
      <h2>Manejo de Estados de Carga y Error</h2>
      {loading && (
        <div className="status-indicator loading-spinner">
          Cargando datos...
        </div>
      )}

      {error && (
        <div className="status-indicator error-message">
          <p>Ocurrió un problema:</p>
          <p><em>{error}</em></p>
          <button onClick={() => fetchData()} className="retry-button">Reintentar</button>
          <button onClick={() => fetchData(true)} className="retry-button error-button">Simular Error</button>
        </div>
      )}

      {data && !loading && !error && (
        <div className="status-indicator success-data">
          <h3>Datos Cargados Exitosamente:</h3>
          <ul>
            {data.map(user => (
              <li key={user.id}>{user.name} ({user.email})</li>
            ))}
          </ul>
          <button onClick={() => fetchData()} className="retry-button">Recargar Datos</button>
        </div>
      )}

      {!loading && !error && !data && (
        <div className="status-indicator idle-message">
          Haz clic en "Recargar Datos" para iniciar.
          <button onClick={() => fetchData()} className="retry-button">Recargar Datos</button>
          <button onClick={() => fetchData(true)} className="retry-button error-button">Simular Error</button>
        </div>
      )}
    </div>
  );
}

function App() {
  return (
    <div className="App">
      <DataFetchingComponent />
    </div>
  );
}

export default App;

// App.css (mismo que los anteriores, con estilos para los indicadores)
/*
.App {
  font-family: Arial, sans-serif;
  text-align: center;
  padding: 20px;
}

.data-display-container {
  border: 2px solid #333;
  padding: 25px;
  margin: 20px auto;
  max-width: 600px;
  border-radius: 10px;
  background-color: #f5f5f5;
  box-shadow: 0 4px 8px rgba(0,0,0,0.1);
}

.status-indicator {
  padding: 15px;
  margin-top: 15px;
  border-radius: 8px;
  font-weight: bold;
}

.loading-spinner {
  background-color: #e0f7fa;
  color: #007bff;
  border: 1px solid #007bff;
}

.error-message {
  background-color: #ffebee;
  color: #dc3545;
  border: 1px solid #dc3545;
}

.success-data {
  background-color: #e6ffe6;
  color: #28a745;
  border: 1px solid #28a745;
}

.success-data ul {
  list-style-type: none;
  padding: 0;
  margin-top: 15px;
}

.success-data li {
  background-color: #fff;
  margin-bottom: 8px;
  padding: 8px 12px;
  border-radius: 5px;
  border: 1px solid #eee;
}

.idle-message {
  background-color: #f0f0f0;
  color: #666;
  border: 1px solid #bbb;
}

.retry-button {
  background-color: #6c757d;
  color: white;
  padding: 8px 15px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  margin: 10px 5px 0;
  font-size: 0.9em;
  transition: background-color 0.2s;
}

.retry-button:hover {
  background-color: #5a6268;
}

.error-button {
  background-color: #dc3545;
}

.error-button:hover {
  background-color: #c82333;
}
*/

// Ejemplo incorrecto (no manejar estado de carga o error)
// function NoStatusHandlingComponent() {
//   const [data, setData] = useState(null);
//   useEffect(() => {
//     fetch('https://jsonplaceholder.typicode.com/users')
//       .then(res => res.json())
//       .then(json => setData(json));
//       // ¿Qué pasa si la red falla? El usuario no sabría.
//       // ¿Qué pasa mientras carga? La pantalla estaría vacía.
//   }, []);
//   return (
//     <div>
//       {data ? <p>Datos: {JSON.stringify(data)}</p> : <p>...</p>}
//     </div>
//   );
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Consumo de APIs',
    'topic': 'Manejo de Datos Asíncronos',
    'subtopic': 'Cancelación de peticiones',
    'definition': '''
La cancelación de peticiones HTTP es una técnica crucial para evitar fugas de memoria, errores de estado en componentes ya desmontados y para mejorar la eficiencia de tu aplicación, especialmente en escenarios donde las peticiones pueden tardar o volverse obsoletas.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en un componente de búsqueda que hace una petición a una API cada vez que el usuario escribe. Si el usuario escribe rápidamente "ap" y luego "manzana", se dispararán dos peticiones. Si la primera tarda más en responder que la segunda, podríamos terminar mostrando resultados de "ap" *después* de que el usuario ya vio los de "manzana", lo cual es confuso. Además, si un usuario navega a otra página mientras una petición está en curso, y esa petición se resuelve *después* de que el componente que la inició se desmontó, intentar actualizar el estado de un componente no montado causará un error (una "fuga de memoria").

Para solucionar esto, JavaScript moderno ofrece `AbortController`, y librerías como Axios tienen su propia forma de cancelar peticiones. El `AbortController` te permite crear una señal (`AbortSignal`) que se puede pasar a `fetch`. Cuando llamas a `abort()` en el controlador, la promesa de `fetch` se rechaza con un error de cancelación, permitiéndote limpiar y evitar actualizaciones de estado. Axios tiene una funcionalidad similar con `CancelToken` o el mismo `AbortController`. La idea es que, al desmontar un componente (`useEffect` con una función de limpieza) o antes de una nueva petición que anula una anterior, canceles las peticiones pendientes para evitar esos problemas. Esto no solo limpia tu código, sino que también mejora el rendimiento y la estabilidad de tu aplicación.
''',
    'code_example': r'''
// Componente React que demuestra la cancelación de peticiones con AbortController y Fetch
import React, { useState, useEffect } from 'react';
import './App.css'; // Para estilos básicos

function CancelableFetchComponent() {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);
  const [searchQuery, setSearchQuery] = useState('');

  useEffect(() => {
    // 1. Crear un AbortController para cada efecto
    const controller = new AbortController();
    const signal = controller.signal;

    const fetchData = async () => {
      setLoading(true);
      setError(null);
      setData(null);

      try {
        // Simular un retardo de red considerable
        await new Promise(resolve => setTimeout(resolve, 1000));

        // 2. Pasar la señal de AbortController a la petición fetch
        const response = await fetch(
          `https://jsonplaceholder.typicode.com/posts?q=${searchQuery}&_limit=5`,
          { signal } // Aquí se pasa la señal
        );

        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`);
        }
        const result = await response.json();
        setData(result);
      } catch (err) {
        // 3. Detectar si el error fue por una cancelación
        if (err.name === 'AbortError') {
          console.log('Petición abortada por el usuario o nueva búsqueda.');
          setError('Búsqueda anterior cancelada.'); // Mensaje más amigable
        } else {
          console.error("Error al obtener los datos:", err);
          setError(`Error: ${err.message}`);
        }
      } finally {
        setLoading(false);
      }
    };

    if (searchQuery) { // Solo si hay algo para buscar
      fetchData();
    } else { // Si la búsqueda está vacía, limpia los estados
      setData(null);
      setError(null);
      setLoading(false);
    }

    // 4. Función de limpieza de useEffect: Cancela la petición si el componente se desmonta
    // o si el efecto se ejecuta de nuevo (ej. por cambio en searchQuery)
    return () => {
      controller.abort(); // Llama a abort() en el controlador para cancelar la petición
    };
  }, [searchQuery]); // Dependencia del useEffect: se re-ejecuta al cambiar la búsqueda

  return (
    <div className="data-display-container">
      <h2>Cancelación de Peticiones (`fetch` con `AbortController`)</h2>
      <input
        type="text"
        placeholder="Buscar posts..."
        value={searchQuery}
        onChange={(e) => setSearchQuery(e.target.value)}
        className="search-input"
      />

      {loading && (
        <div className="status-indicator loading-spinner">
          Buscando "{searchQuery}"...
        </div>
      )}

      {error && (
        <div className="status-indicator error-message">
          <p>{error}</p>
        </div>
      )}

      {data && !loading && !error && (
        <div className="status-indicator success-data">
          <h3>Resultados para "{searchQuery}":</h3>
          <ul>
            {data.map(post => (
              <li key={post.id}><strong>{post.title}</strong></li>
            ))}
          </ul>
        </div>
      )}

      {!loading && !error && !data && !searchQuery && (
        <div className="status-indicator idle-message">
          Empieza a escribir para buscar posts.
        </div>
      )}
    </div>
  );
}


// Ejemplo con Axios y AbortController (Axios v0.22+ prefiere AbortController)
import axios from 'axios';

function CancelableAxiosComponent() {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);
  const [itemId, setItemId] = useState('');

  useEffect(() => {
    const controller = new AbortController();
    const signal = controller.signal;

    const fetchData = async () => {
      setLoading(true);
      setError(null);
      setData(null);

      try {
        await new Promise(resolve => setTimeout(resolve, 1000)); // Simular retardo

        const response = await axios.get(`https://jsonplaceholder.typicode.com/todos/${itemId}`, { signal });

        setData(response.data);
      } catch (err) {
        if (axios.isCancel(err)) { // Axios proporciona una forma de verificar si es una cancelación
          console.log('Petición Axios cancelada:', err.message);
          setError('Petición anterior cancelada.');
        } else {
          console.error("Error al obtener datos con Axios:", err);
          setError(`Error Axios: ${err.message}`);
        }
      } finally {
        setLoading(false);
      }
    };

    if (itemId && !isNaN(itemId)) { // Solo si es un ID válido
      fetchData();
    } else {
      setData(null);
      setError(null);
      setLoading(false);
    }

    return () => {
      controller.abort(); // Abortar la petición si el ID cambia o componente se desmonta
    };
  }, [itemId]);

  return (
    <div className="data-display-container" style={{ borderColor: 'purple' }}>
      <h2>Cancelación de Peticiones (`axios` con `AbortController`)</h2>
      <input
        type="number"
        placeholder="Buscar tarea por ID (1-200)"
        value={itemId}
        onChange={(e) => setItemId(e.target.value)}
        className="search-input"
        min="1"
        max="200"
      />

      {loading && (
        <div className="status-indicator loading-spinner">
          Buscando tarea {itemId}...
        </div>
      )}

      {error && (
        <div className="status-indicator error-message">
          <p>{error}</p>
        </div>
      )}

      {data && !loading && !error && (
        <div className="status-indicator success-data">
          <h3>Tarea ID: {data.id}</h3>
          <p>Título: {data.title}</p>
          <p>Completado: {data.completed ? 'Sí ✅' : 'No ❌'}</p>
        </div>
      )}

      {!loading && !error && !data && !itemId && (
        <div className="status-indicator idle-message">
          Ingresa un ID para buscar una tarea.
        </div>
      )}
    </div>
  );
}


function App() {
  return (
    <div className="App">
      <CancelableFetchComponent />
      <CancelableAxiosComponent />
    </div>
  );
}

export default App;

// App.css (mismo que el anterior, con algunos estilos adicionales para inputs)
/*
.App {
  font-family: Arial, sans-serif;
  text-align: center;
  padding: 20px;
}

.data-display-container {
  border: 2px solid #333;
  padding: 25px;
  margin: 20px auto;
  max-width: 600px;
  border-radius: 10px;
  background-color: #f5f5f5;
  box-shadow: 0 4px 8px rgba(0,0,0,0.1);
}

.status-indicator {
  padding: 15px;
  margin-top: 15px;
  border-radius: 8px;
  font-weight: bold;
}

.loading-spinner {
  background-color: #e0f7fa;
  color: #007bff;
  border: 1px solid #007bff;
}

.error-message {
  background-color: #ffebee;
  color: #dc3545;
  border: 1px solid #dc3545;
}

.success-data {
  background-color: #e6ffe6;
  color: #28a745;
  border: 1px solid #28a745;
}

.success-data ul {
  list-style-type: none;
  padding: 0;
  margin-top: 15px;
}

.success-data li {
  background-color: #fff;
  margin-bottom: 8px;
  padding: 8px 12px;
  border-radius: 5px;
  border: 1px solid #eee;
}

.idle-message {
  background-color: #f0f0f0;
  color: #666;
  border: 1px solid #bbb;
}

.search-input {
  padding: 10px;
  margin-bottom: 15px;
  width: 80%;
  max-width: 300px;
  border: 1px solid #ccc;
  border-radius: 5px;
  font-size: 1em;
}
*/

// Ejemplo incorrecto (no cancelar peticiones y causar "race conditions" o fugas)
// function BadSearchComponent() {
//   const [results, setResults] = useState([]);
//   const [query, setQuery] = useState('');
//
//   useEffect(() => {
//     if (query) {
//       fetch(`https://jsonplaceholder.typicode.com/posts?q=${query}`)
//         .then(res => res.json())
//         .then(data => setResults(data));
//         // PROBLEMA: Si el usuario escribe rápido, la petición más lenta puede sobrescribir
//         // los resultados de una petición más rápida, o intentar actualizar el estado
//         // después de que el componente se desmonte.
//     }
//   }, [query]);
//
//   return (
//     <div>
//       <input value={query} onChange={e => setQuery(e.target.value)} />
//       {results.map(r => <p key={r.id}>{r.title}</p>)}
//     </div>
//   );
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Consumo de APIs',
    'topic': 'Manejo de Datos Asíncronos',
    'subtopic': 'Actualización de datos en tiempo real',
    'definition': '''
La actualización de datos en tiempo real permite que tu aplicación reaccione instantáneamente a los cambios en el servidor sin que el usuario tenga que recargar la página. Es fundamental para experiencias interactivas como chats, notificaciones o tableros de actividad.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una aplicación de chat. Si cada usuario tuviera que refrescar la página para ver los nuevos mensajes, la conversación sería imposible. O en un panel de control donde las métricas cambian constantemente. Las aplicaciones modernas necesitan reflejar los datos más recientes en cuanto estos ocurren. Las técnicas de actualización de datos en tiempo real nos permiten "escuchar" los cambios del servidor.

Hay varias estrategias para lograr esto:

1.  **Polling (Sondeo):** Tu aplicación realiza peticiones HTTP a la API a intervalos regulares (ej. cada 5 segundos) para ver si hay algo nuevo. Es la más sencilla de implementar, pero puede ser ineficiente si los datos no cambian a menudo (muchas peticiones vacías) o lenta si los cambios son muy frecuentes (la latencia del intervalo).

2.  **WebSockets:** Son un protocolo que permite una comunicación bidireccional, full-duplex, entre el cliente y el servidor sobre una única conexión TCP. Una vez establecida, el servidor puede *enviar* datos al cliente en cualquier momento (y viceversa), sin necesidad de que el cliente los solicite. Es ideal para chats, juegos en línea y cualquier aplicación que necesite un flujo constante de datos.

3.  **Server-Sent Events (SSE):** Permiten al servidor enviar actualizaciones de datos unidireccionales al cliente sobre una conexión HTTP estándar. Es como un flujo constante de eventos del servidor al navegador. Es más sencillo que WebSockets si solo necesitas el flujo del servidor al cliente (ej. para notificaciones o feeds de noticias).

4.  **Librerías de Sincronización de Datos:** Soluciones como Firebase Realtime Database, Supabase Realtime o GraphQL con suscripciones, abstraen gran parte de la complejidad de WebSockets/SSE y te permiten suscribirte a cambios en datos específicos. Son excelentes para aplicaciones que necesitan escalabilidad y un manejo robusto de la sincronización.

Elegir la técnica adecuada depende de la frecuencia y la naturaleza de los cambios que esperas.
''',
    'code_example': r'''
// Componente React que demuestra diferentes formas de actualizar datos en tiempo real

import React, { useState, useEffect } from 'react';
import './App.css'; // Para estilos básicos

// --- 1. Polling (Sondeo) ---
function PollingComponent() {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchData = async () => {
      setLoading(true);
      try {
        const response = await fetch('https://api.coindesk.com/v1/bpi/currentprice.json'); // API de precios de Bitcoin
        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`);
        }
        const result = await response.json();
        setData(result.bpi.USD.rate_float.toFixed(2)); // Precio en USD
        setError(null);
      } catch (err) {
        setError('Error al obtener precio de Bitcoin: ' + err.message);
        setData(null);
      } finally {
        setLoading(false);
      }
    };

    // Ejecuta la petición inicialmente
    fetchData();

    // Configura el polling cada 5 segundos
    const intervalId = setInterval(fetchData, 5000);

    // Limpia el intervalo cuando el componente se desmonta
    return () => clearInterval(intervalId);
  }, []);

  return (
    <div className="realtime-section polling">
      <h3>Polling (Precio BTC USD)</h3>
      {loading && <p>Cargando precio...</p>}
      {error && <p className="error-message">{error}</p>}
      {data && (
        <p>
          Precio actual: <strong>${data}</strong> <br />
          <small>(Actualizado cada 5 segundos)</small>
        </p>
      )}
    </div>
  );
}

// --- 2. WebSockets (Simulado para frontend) ---
// En una aplicación real, necesitarías un servidor WebSocket.
// Aquí solo se simula la recepción de mensajes.
function WebSocketComponent() {
  const [messages, setMessages] = useState([]);
  const [isConnected, setIsConnected] = useState(false);

  useEffect(() => {
    // Simulación de un WebSocket
    let ws;
    const connectWebSocket = () => {
      // Intentar conectar a un servidor WebSocket real sería:
      // ws = new WebSocket('ws://localhost:8080');

      // Simulación: Generar un mensaje cada 3 segundos
      let messageCount = 0;
      const interval = setInterval(() => {
        messageCount++;
        const newMessage = `Mensaje ${messageCount} desde el servidor (simulado): ${new Date().toLocaleTimeString()}`;
        setMessages(prev => [...prev, newMessage]);
      }, 3000);

      setIsConnected(true);
      console.log('Simulando conexión WebSocket...');

      // Limpieza de la simulación
      return () => {
        clearInterval(interval);
        console.log('Simulación WebSocket desconectada.');
        setIsConnected(false);
      };
    };

    const cleanup = connectWebSocket();
    return cleanup;
  }, []);

  return (
    <div className="realtime-section websocket">
      <h3>WebSockets (Mensajes de Chat Simulados)</h3>
      <p className={isConnected ? 'status-connected' : 'status-disconnected'}>
        Estado: {isConnected ? 'Conectado' : 'Desconectado'}
      </p>
      <div className="messages-box">
        {messages.length === 0 && <p>Esperando mensajes...</p>}
        {messages.map((msg, index) => (
          <p key={index} className="message-item">{msg}</p>
        ))}
      </div>
    </div>
  );
}

// --- 3. Server-Sent Events (SSE) (Simulado para frontend) ---
// Similar a WebSockets, esto requeriría un servidor SSE real.
function SSEComponent() {
  const [lastEvent, setLastEvent] = useState(null);

  useEffect(() => {
    // Simulación de SSE: Generar un evento cada 4 segundos
    let eventCount = 0;
    const interval = setInterval(() => {
      eventCount++;
      const newEvent = `Evento #${eventCount}: Actualización de noticias - ${new Date().toLocaleTimeString()}`;
      setLastEvent(newEvent);
    }, 4000);

    return () => clearInterval(interval);
  }, []);

  return (
    <div className="realtime-section sse">
      <h3>Server-Sent Events (Noticias Simuladas)</h3>
      {lastEvent ? (
        <p>Última noticia: <strong>{lastEvent}</strong></p>
      ) : (
        <p>Esperando la primera noticia...</p>
      )}
      <small>(Simulando un flujo unidireccional de eventos)</small>
    </div>
  );
}


function App() {
  return (
    <div className="App">
      <h1>Actualización de Datos en Tiempo Real</h1>
      <PollingComponent />
      <WebSocketComponent />
      <SSEComponent />
    </div>
  );
}

export default App;

// App.css (adiciones para los estilos de tiempo real)
/*
.App {
  font-family: Arial, sans-serif;
  text-align: center;
  padding: 20px;
}

.realtime-section {
  border: 2px solid #ccc;
  padding: 20px;
  margin: 20px auto;
  max-width: 500px;
  border-radius: 10px;
  background-color: #f9f9f9;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.polling {
  border-color: #007bff;
  background-color: #e6f7ff;
}

.websocket {
  border-color: #28a745;
  background-color: #e6ffe6;
}

.sse {
  border-color: #ffc107;
  background-color: #fff8e6;
}

.status-connected {
  color: #28a745;
  font-weight: bold;
}

.status-disconnected {
  color: #dc3545;
  font-weight: bold;
}

.messages-box {
  border: 1px solid #ddd;
  height: 150px;
  overflow-y: auto;
  padding: 10px;
  margin-top: 10px;
  background-color: #fff;
  text-align: left;
}

.message-item {
  margin-bottom: 5px;
  padding: 3px 0;
  border-bottom: 1px dashed #eee;
  font-size: 0.9em;
  color: #333;
}

.error-message {
  color: #dc3545;
  font-weight: bold;
}
*/

// Ejemplo incorrecto (actualizar datos en tiempo real con recargas manuales)
// function ManualRefreshComponent() {
//   const [data, setData] = useState(null);
//   const fetchData = async () => {
//     const response = await fetch('https://some-api.com/data');
//     const result = await response.json();
//     setData(result);
//   };
//
//   return (
//     <div>
//       <p>Datos: {data ? JSON.stringify(data) : 'N/A'}</p>
//       <button onClick={fetchData}>Refrescar Datos</button>
//       <p>Esto no es "tiempo real" y requiere intervención del usuario.</p>
//     </div>
//   );
// }
'''
  });
}

Future<void> insertReactMidLevel5Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Testing y Calidad de Código',
    'topic': 'Pruebas Unitarias',
    'subtopic': 'Uso de Jest para pruebas unitarias',
    'definition': '''
Jest es un framework de testing de JavaScript muy popular, desarrollado por Facebook, que se enfoca en la simplicidad y el rendimiento, siendo una opción predeterminada para proyectos React creados con Create React App. Es una herramienta todo-en-uno que incluye un *runner*, un *framework de aserciones* y un *motor de mocks*.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en que estás construyendo una aplicación compleja. A medida que añades más código, es fácil introducir errores. Las pruebas unitarias te permiten verificar que las piezas más pequeñas y aisladas de tu código (como funciones o componentes individuales) funcionan exactamente como esperas. Jest simplifica enormemente este proceso. Su filosofía es "zero configuration", lo que significa que a menudo puedes empezar a escribir pruebas sin mucha configuración inicial.

Con Jest, escribes tus pruebas en archivos `.test.js` o `.spec.js`. Utiliza la función `test()` o `it()` para definir una prueba y `expect()` para hacer aserciones sobre los valores. Por ejemplo, `expect(sum(1, 2)).toBe(3)` verifica que la función `sum` devuelve 3. Jest también viene con un poderoso motor de *mocking*, lo que te permite reemplazar dependencias externas (como llamadas a la red o módulos) con versiones controladas, asegurando que solo estás probando la unidad de código en cuestión. Su velocidad y su capacidad para ejecutar pruebas en paralelo lo convierten en una herramienta indispensable para mantener la calidad y fiabilidad de tu codebase.
''',
    'code_example': r'''
// Para configurar Jest:
// 1. Instalar Jest: `npm install --save-dev jest`
// 2. Si usas Babel, `npm install --save-dev babel-jest @babel/core @babel/preset-env`
//    y configura tu .babelrc o babel.config.js
// 3. Añadir en package.json: `"scripts": { "test": "jest" }`
// Para ejecutar: `npm test`

// math.js (El módulo que queremos probar)
export function sum(a, b) {
  return a + b;
}

export function subtract(a, b) {
  return a - b;
}

export function multiply(a, b) {
  return a * b;
}

export function divide(a, b) {
  if (b === 0) {
    throw new Error('No se puede dividir por cero');
  }
  return a / b;
}


// math.test.js (Archivo de pruebas para math.js)
// `describe` agrupa pruebas relacionadas.
describe('Funciones matemáticas básicas', () => {

  // `test` o `it` define una prueba individual.
  test('sumar 1 + 2 debería ser 3', () => {
    // `expect` es el valor a probar.
    // `toBe` es un "matcher" que verifica igualdad estricta (===) para valores primitivos.
    expect(sum(1, 2)).toBe(3);
  });

  it('restar 5 - 2 debería ser 3', () => {
    expect(subtract(5, 2)).toBe(3);
  });

  test('multiplicar 3 * 4 debería ser 12', () => {
    expect(multiply(3, 4)).toBe(12);
  });

  test('dividir 10 / 2 debería ser 5', () => {
    expect(divide(10, 2)).toBe(5);
  });

  test('dividir por cero debería lanzar un error', () => {
    // Para probar que una función lanza un error, debes envolverla en otra función.
    expect(() => divide(10, 0)).toThrow('No se puede dividir por cero');
    // También puedes probar contra el tipo de error
    expect(() => divide(10, 0)).toThrow(Error);
  });

  // Otros matchers comunes:
  test('el resultado de una operación debería ser mayor que 0', () => {
    expect(sum(5, 5)).toBeGreaterThan(0);
  });

  test('un objeto debería contener una propiedad específica', () => {
    const user = { id: 1, name: 'Alice' };
    expect(user).toHaveProperty('name', 'Alice');
    expect(user).toEqual({ id: 1, name: 'Alice' }); // `toEqual` para igualdad profunda de objetos
  });

  test('un array debería contener un elemento específico', () => {
    const numbers = [1, 2, 3, 4];
    expect(numbers).toContain(3);
  });

  // Mocks (para simular funciones externas)
  test('una función mock debería haber sido llamada', () => {
    const mockCallback = jest.fn(x => 42 + x); // jest.fn() crea una función mock
    mockCallback(0);
    mockCallback(1);

    expect(mockCallback.mock.calls.length).toBe(2); // Fue llamada 2 veces
    expect(mockCallback.mock.calls[0][0]).toBe(0); // El primer argumento de la primera llamada fue 0
    expect(mockCallback.mock.results[1].value).toBe(43); // El resultado de la segunda llamada fue 43
  });
});

// Ejemplo incorrecto (no usar matchers de Jest o aserciones incompletas)
// test('esto es una prueba mal hecha', () => {
//   let x = 5;
//   x++;
//   // console.log(x); // Esto no es una aserción, no verifica nada.
//   // La prueba pasaría incluso si x fuera 5, lo cual es incorrecto.
// });
//
// test('comparación de objetos incorrecta con toBe', () => {
//   const obj1 = { a: 1 };
//   const obj2 = { a: 1 };
//   // expect(obj1).toBe(obj2); // Esto fallaría porque `toBe` compara referencias para objetos.
//   // Deberías usar `toEqual` para comparar el contenido de objetos.
// });
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Testing y Calidad de Código',
    'topic': 'Pruebas Unitarias',
    'subtopic': 'Pruebas de componentes con React Testing Library',
    'definition': '''
React Testing Library (RTL) es una librería que complementa Jest y se enfoca en probar el comportamiento de los componentes de React de una manera que simula cómo los usuarios interactuarían con ellos. Su filosofía principal es "cuanto más se parezca tu prueba a la forma en que tus usuarios usan tu software, más confianza te dará".

Seguramente pensarás de qué va todo esto... ¿Por qué no simplemente probar la implementación interna de mis componentes? 

La idea de RTL es simple: en lugar de preocuparte por el estado interno de un componente o por si ciertos métodos fueron llamados, te centras en lo que el usuario ve y puede hacer. Pensemos por un momento en un botón. A un usuario no le importa si el botón usa un `useState` o un `useReducer` internamente; le importa que al hacer clic en él, ocurra algo. RTL te proporciona utilidades para renderizar componentes, encontrar elementos en el DOM (de la misma manera que un usuario los encontraría, por texto, rol, etc.) y simular eventos (clics, cambios en inputs).

Al usar RTL, te ves forzado a escribir pruebas que son robustas frente a los cambios internos de refactorización de tus componentes. Si refactorizas el código interno de un componente pero su comportamiento visible para el usuario no cambia, tus pruebas de RTL seguirán pasando. Esto te da mucha más confianza en tu código a largo plazo y hace que tus pruebas sean más fáciles de mantener. Es la herramienta preferida para probar componentes de React de manera efectiva y centrada en el usuario.
''',
    'code_example': r'''
// Para configurar React Testing Library:
// 1. Instalar: `npm install --save-dev @testing-library/react @testing-library/jest-dom`
// 2. En tu archivo de setup de pruebas (ej. src/setupTests.js), importar:
//    `import '@testing-library/jest-dom';`

// Componente React (src/components/Button.js)
import React, { useState } from 'react';

function Button({ onClick, children }) {
  const [clicked, setClicked] = useState(false);

  const handleClick = () => {
    setClicked(true);
    if (onClick) {
      onClick();
    }
  };

  return (
    <button onClick={handleClick} disabled={clicked}>
      {children} {clicked && '(Clickeado!)'}
    </button>
  );
}

export default Button;

// Test del componente (src/components/Button.test.js)
import React from 'react';
// `render` para renderizar el componente.
// `screen` para acceder al DOM consultando elementos.
// `fireEvent` para disparar eventos.
import { render, screen, fireEvent } from '@testing-library/react';
import '@testing-library/jest-dom'; // Para matchers personalizados como .toBeInTheDocument

import Button from './Button';

describe('Button Component', () => {
  test('renderiza el botón con el texto correcto', () => {
    // 1. Renderizar el componente
    render(<Button>Haz clic aquí</Button>);

    // 2. Buscar el elemento por su texto accesible (cómo lo vería un usuario)
    // `getByText` lanzará un error si no lo encuentra, `queryByText` retorna null.
    const buttonElement = screen.getByText(/Haz clic aquí/i); // /i para insensible a mayúsculas/minúsculas

    // 3. Afirmar que el elemento está en el documento
    expect(buttonElement).toBeInTheDocument();
  });

  test('llama a la función onClick cuando se hace clic en el botón', () => {
    // Jest.fn() crea una función mock para espiar si fue llamada.
    const handleClick = jest.fn();

    render(<Button onClick={handleClick}>Clickeame</Button>);
    const buttonElement = screen.getByText(/Clickeame/i);

    // 4. Disparar un evento de usuario (simular clic)
    fireEvent.click(buttonElement);

    // 5. Afirmar que la función mock fue llamada
    expect(handleClick).toHaveBeenCalledTimes(1);

    // Afirmar que el botón se deshabilita y su texto cambia después del clic
    expect(buttonElement).toBeDisabled();
    expect(screen.getByText(/Clickeado!/i)).toBeInTheDocument();
  });

  test('no llama a onClick si el botón está inicialmente deshabilitado', () => {
    const handleClick = jest.fn();
    render(<Button onClick={handleClick} disabled={true}>Botón deshabilitado</Button>); // Simula disabled desde props

    const buttonElement = screen.getByText(/Botón deshabilitado/i);
    expect(buttonElement).toBeDisabled();

    fireEvent.click(buttonElement);
    expect(handleClick).not.toHaveBeenCalled();
  });

  // Prueba de un componente con estado interno
  test('el botón muestra "(Clickeado!)" después de hacer clic', () => {
    render(<Button>Estado interno</Button>);
    const buttonElement = screen.getByText(/Estado interno/i);

    expect(screen.queryByText(/\(Clickeado!\)/i)).not.toBeInTheDocument(); // Asegura que no está al principio

    fireEvent.click(buttonElement);

    expect(screen.getByText(/Estado interno \(Clickeado!\)/i)).toBeInTheDocument(); // Ahora sí debe estar
  });
});

// Ejemplo incorrecto (probar detalles de implementación interna)
// test('intento de probar el estado interno de un componente (BAD PRACTICE)', () => {
//   // Esto no es compatible con RTL y no es una buena práctica.
//   // RTL desencora acceder a las instancias de los componentes para probar su estado directamente.
//   // En su lugar, deberías probar el *comportamiento visible* que ese estado produce.
// });
//
// // Ejemplo incorrecto (usar ids generados o selectores de CSS internos)
// test('seleccionar un elemento por id interno (menos robusto)', () => {
//   // Si tu componente genera un ID como 'my-button-123', es frágil si el ID cambia.
//   // RTL prefiere `getByRole`, `getByText`, `getByLabelText`, etc.
//   // render(<div data-testid="mi-boton-test"><button>Click</button></div>);
//   // expect(screen.getByTestId('mi-boton-test')).toBeInTheDocument();
//   // Aunque `getByTestId` existe, es preferible usar los métodos que emulan el uso real.
// });
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Testing y Calidad de Código',
    'topic': 'Pruebas Unitarias',
    'subtopic': 'Mocks y pruebas de funciones',
    'definition': '''
En el mundo del testing unitario, "mocks" (o simulacros) son objetos o funciones que imitan el comportamiento de componentes o módulos reales de los que depende tu unidad de código bajo prueba. Son esenciales para aislar la unidad que estás probando y controlar su entorno.

No sé tú, pero a mí esto al principio me costó un poco entender. ¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una función que guarda datos en una base de datos o que hace una llamada a una API externa. Cuando quieres probar *solo* la lógica de esa función (la "unidad"), no quieres que la prueba dependa de si la base de datos está disponible o si la API externa funciona. Ahí es donde entran los mocks. Un "mock" te permite sustituir esa dependencia real con una versión controlada, una que simula el comportamiento esperado (ej. "cuando llames a `guardarEnBD`, simplemente retorna `true`"). Esto asegura que tu prueba sea:

1.  **Aislada:** Solo pruebas la unidad de código que te interesa, sin influencias externas.
2.  **Rápida:** Evitas operaciones lentas como llamadas de red o acceso a disco.
3.  **Predecible:** Siempre obtendrás el mismo resultado de tu dependencia simulada, eliminando la aleatoriedad que podría venir de un sistema externo.

Jest, con su función `jest.fn()` y `jest.mock()`, facilita la creación de mocks. Puedes crear mocks de funciones para espiar si fueron llamadas y con qué argumentos, o puedes mockear módulos completos para reemplazar sus exportaciones. Esta capacidad de controlar el entorno de prueba es una piedra angular para escribir pruebas unitarias efectivas y confiables, permitiéndote verificar la lógica interna de tus funciones sin preocuparte por sus dependencias externas.
''',
    'code_example': r'''
// Para configurar Jest:
// Asegúrate de tener Jest instalado y configurado en tu package.json para ejecutar pruebas.

// 1. Un módulo con una dependencia externa (src/api.js)
// Este módulo simula una llamada a una API real.
export async function fetchUserById(id) {
  const response = await fetch(`https://jsonplaceholder.typicode.com/users/${id}`);
  if (!response.ok) {
    throw new Error('Usuario no encontrado');
  }
  return response.json();
}

// 2. Una función que usa la dependencia externa (src/userService.js)
// Queremos probar `getUserName` sin hacer una petición de red real.
import { fetchUserById } from './api';

export async function getUserName(userId) {
  try {
    const user = await fetchUserById(userId);
    return user.name;
  } catch (error) {
    console.error('Error en getUserName:', error.message);
    return null;
  }
}

// 3. Pruebas de funciones con Mocks (src/userService.test.js)
// Aquí es donde Jest entra en juego para crear mocks.

// Mockear el módulo 'api.js' completo.
// Jest reemplazará las importaciones de 'api.js' en `userService.js`
// con este mock en el contexto de las pruebas.
jest.mock('./api', () => ({
  // jest.fn() crea una función mock que podemos espiar y controlar.
  fetchUserById: jest.fn(),
}));

// Importar la función que queremos probar y la función mockeada
import { getUserName } from './userService';
import { fetchUserById } from './api'; // Importamos la versión mockeada de fetchUserById

describe('userService', () => {
  // Limpiar los mocks antes de cada prueba para asegurar independencia
  beforeEach(() => {
    fetchUserById.mockClear(); // Reinicia el estado de las llamadas al mock
  });

  test('getUserName debería devolver el nombre del usuario si la petición es exitosa', async () => {
    // Configurar el comportamiento del mock para una respuesta exitosa
    fetchUserById.mockResolvedValueOnce({
      id: 1,
      name: 'Leanne Graham',
      email: 'Sincere@april.biz',
    });

    const userName = await getUserName(1);

    // Afirmaciones:
    // Verificar que la función mock fue llamada con los argumentos correctos
    expect(fetchUserById).toHaveBeenCalledTimes(1);
    expect(fetchUserById).toHaveBeenCalledWith(1);

    // Verificar que nuestra función `getUserName` devolvió el resultado esperado
    expect(userName).toBe('Leanne Graham');
  });

  test('getUserName debería devolver null si la petición falla', async () => {
    // Configurar el comportamiento del mock para que rechace la promesa
    fetchUserById.mockRejectedValueOnce(new Error('Network error'));

    const userName = await getUserName(2);

    // Verificar que la función mock fue llamada
    expect(fetchUserById).toHaveBeenCalledTimes(1);
    expect(fetchUserById).toHaveBeenCalledWith(2);

    // Verificar que nuestra función manejó el error y devolvió null
    expect(userName).toBeNull();
  });

  // Otro ejemplo: Mockear una función de utilidad
  test('una función de utilidad debe ser llamada', () => {
    const logUtility = {
      logMessage: jest.fn(),
    };

    function processData(data) {
      if (data.length > 5) {
        logUtility.logMessage('Datos grandes procesados');
      } else {
        logUtility.logMessage('Datos pequeños procesados');
      }
    }

    processData([1, 2, 3, 4, 5, 6]);
    expect(logUtility.logMessage).toHaveBeenCalledWith('Datos grandes procesados');
    expect(logUtility.logMessage).toHaveBeenCalledTimes(1);

    processData([1, 2]);
    expect(logUtility.logMessage).toHaveBeenCalledWith('Datos pequeños procesados');
    expect(logUtility.logMessage).toHaveBeenCalledTimes(2); // Fue llamada una vez más
  });
});

// Ejemplo incorrecto (no mockear dependencias externas)
// test('getUserName sin mock (BAD PRACTICE)', async () => {
//   // Si no mockeamos fetchUserById, esta prueba intentaría hacer una petición de red real.
//   // Esto la haría lenta, dependiente de la red y del servicio externo, y no sería una prueba unitaria.
//   const userName = await getUserName(1);
//   expect(userName).toBe('Leanne Graham'); // Esto podría fallar si la API no está disponible
// });

// Ejemplo incorrecto (mockear solo parcialmente cuando se necesita un mock completo)
// Si `api.js` tuviera más funciones y solo mockearas `fetchUserById`,
// las otras funciones seguirían siendo las reales a menos que las mockees explícitamente.
// jest.mock('./api', () => ({
//   fetchUserById: jest.fn(),
//   // otherFunction: jest.fn(), // Si no se mockea, seguiría siendo la real.
// }));
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Testing y Calidad de Código',
    'topic': 'Pruebas de Integración',
    'subtopic': 'Pruebas de flujos completos',
    'definition': '''
Las pruebas de integración se centran en verificar que diferentes partes de tu aplicación (como varios componentes de React o la interacción de un componente con una API) funcionan correctamente juntas. A diferencia de las pruebas unitarias que aíslan pequeñas unidades, las pruebas de integración se preocupan por cómo estos módulos se "integran".

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una tienda online. Las pruebas unitarias pueden verificar que el componente del "carrito de compras" añade productos correctamente y que el componente de "pago" procesa los detalles de la tarjeta. Pero, ¿qué pasa si el carrito no se comunica bien con el componente de pago? O ¿si la información del usuario no fluye correctamente desde el formulario de inicio de sesión a la sección de pedidos? Las pruebas de integración simulan estos **flujos completos**, como "un usuario se registra, inicia sesión, añade un producto al carrito y completa la compra".

Estas pruebas te dan confianza en que las piezas individuales de tu aplicación no solo funcionan por sí mismas, sino que también interactúan de la manera esperada. Son cruciales porque a menudo, los errores no se encuentran en una sola unidad de código, sino en la forma en que esas unidades se conectan. Al probar flujos de usuario reales, estás construyendo una red de seguridad que te alertará si un cambio en una parte de tu código rompe una funcionalidad en otra parte, asegurando que la experiencia del usuario final sea consistente y sin errores.
''',
    'code_example': r'''
// Para estas pruebas, se asume que tienes Jest y React Testing Library configurados.
// npm install --save-dev jest @testing-library/react @testing-library/jest-dom

// --- Componentes (simulados para el ejemplo) ---

// components/LoginForm.js
import React, { useState } from 'react';

function LoginForm({ onLogin }) {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');

  const handleSubmit = (e) => {
    e.preventDefault();
    setError(''); // Limpiar errores previos
    if (username === 'testuser' && password === 'password123') {
      onLogin(username);
    } else {
      setError('Credenciales incorrectas');
    }
  };

  return (
    <form onSubmit={handleSubmit}>
      {error && <p style={{ color: 'red' }}>{error}</p>}
      <div>
        <label htmlFor="username">Usuario:</label>
        <input
          id="username"
          type="text"
          value={username}
          onChange={(e) => setUsername(e.target.value)}
        />
      </div>
      <div>
        <label htmlFor="password">Contraseña:</label>
        <input
          id="password"
          type="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
        />
      </div>
      <button type="submit">Iniciar Sesión</button>
    </form>
  );
}
export default LoginForm;

// components/Dashboard.js
import React from 'react';

function Dashboard({ username }) {
  return (
    <div>
      <h1>Bienvenido, {username}!</h1>
      <p>Este es tu panel de control.</p>
    </div>
  );
}
export default Dashboard;


// App.js (El componente que integra todo el flujo)
import React, { useState } from 'react';
import LoginForm from './LoginForm';
import Dashboard from './Dashboard';
import './App.css'; // Para estilos básicos

function App() {
  const [loggedInUser, setLoggedInUser] = useState(null);

  const handleLogin = (username) => {
    setLoggedInUser(username);
  };

  const handleLogout = () => {
    setLoggedInUser(null);
  };

  return (
    <div className="App">
      {!loggedInUser ? (
        <LoginForm onLogin={handleLogin} />
      ) : (
        <>
          <Dashboard username={loggedInUser} />
          <button onClick={handleLogout}>Cerrar Sesión</button>
        </>
      )}
    </div>
  );
}

export default App;


// --- Prueba de Integración (App.test.js) ---
import React from 'react';
import { render, screen, fireEvent, waitFor } from '@testing-library/react';
import '@testing-library/jest-dom';
import App from './App';

describe('Flujo de Autenticación de la Aplicación', () => {
  test('un usuario puede iniciar sesión y luego cerrar sesión', async () => {
    // 1. Renderizar el componente principal (App), que contiene el flujo completo
    render(<App />);

    // --- Parte 1: Iniciar Sesión ---
    // Verificar que el formulario de login está presente
    expect(screen.getByLabelText(/Usuario:/i)).toBeInTheDocument();
    expect(screen.getByLabelText(/Contraseña:/i)).toBeInTheDocument();
    expect(screen.getByRole('button', { name: /Iniciar Sesión/i })).toBeInTheDocument();

    // Simular la entrada del usuario
    fireEvent.change(screen.getByLabelText(/Usuario:/i), { target: { value: 'testuser' } });
    fireEvent.change(screen.getByLabelText(/Contraseña:/i), { target: { value: 'password123' } });

    // Simular el envío del formulario
    fireEvent.click(screen.getByRole('button', { name: /Iniciar Sesión/i }));

    // Esperar a que el Dashboard aparezca (porque la autenticación es síncrona en este ejemplo)
    // Para asincronía real, usar `await screen.findByText`
    await waitFor(() => {
      expect(screen.getByText(/Bienvenido, testuser!/i)).toBeInTheDocument();
    });
    expect(screen.getByText(/Este es tu panel de control./i)).toBeInTheDocument();
    expect(screen.getByRole('button', { name: /Cerrar Sesión/i })).toBeInTheDocument();

    // Verificar que el formulario de login ya no está visible
    expect(screen.queryByLabelText(/Usuario:/i)).not.toBeInTheDocument();

    // --- Parte 2: Cerrar Sesión ---
    // Simular el clic en el botón de cerrar sesión
    fireEvent.click(screen.getByRole('button', { name: /Cerrar Sesión/i }));

    // Esperar a que el formulario de login reaparezca
    await waitFor(() => {
      expect(screen.getByLabelText(/Usuario:/i)).toBeInTheDocument();
    });
    // Verificar que el Dashboard ya no está visible
    expect(screen.queryByText(/Bienvenido, testuser!/i)).not.toBeInTheDocument();
  });

  test('mostrar mensaje de error con credenciales incorrectas', async () => {
    render(<App />);

    fireEvent.change(screen.getByLabelText(/Usuario:/i), { target: { value: 'wronguser' } });
    fireEvent.change(screen.getByLabelText(/Contraseña:/i), { target: { value: 'wrongpass' } });
    fireEvent.click(screen.getByRole('button', { name: /Iniciar Sesión/i }));

    // Esperar a que el mensaje de error aparezca
    await waitFor(() => {
      expect(screen.getByText(/Credenciales incorrectas/i)).toBeInTheDocument();
    });
    // Asegurarse de que el dashboard NO aparece
    expect(screen.queryByText(/Bienvenido,/i)).not.toBeInTheDocument();
  });
});

// App.css (ejemplo de estilos)
/*
.App {
  font-family: Arial, sans-serif;
  text-align: center;
  padding: 20px;
}

form {
  margin: 20px auto;
  padding: 30px;
  border: 1px solid #ddd;
  border-radius: 8px;
  max-width: 400px;
  box-shadow: 0 2px 5px rgba(0,0,0,0.1);
  background-color: #fff;
}

form div {
  margin-bottom: 15px;
  text-align: left;
}

form label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold;
}

form input[type="text"],
form input[type="password"] {
  width: calc(100% - 20px);
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

form button {
  background-color: #007bff;
  color: white;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-size: 1em;
  transition: background-color 0.2s;
}

form button:hover {
  background-color: #0056b3;
}

h1 {
  color: #28a745;
}

p {
  color: #555;
}
*/

// Ejemplo incorrecto (probar solo partes del flujo o hacer aserciones débiles)
// test('inicio de sesión incompleto (MAL)', async () => {
//   render(<LoginForm onLogin={jest.fn()} />);
//   fireEvent.change(screen.getByLabelText(/Usuario:/i), { target: { value: 'testuser' } });
//   // Falla: no se simula la contraseña ni el clic en el botón, el flujo no se completa.
//   // expect(screen.getByText(/Usuario:/i)).toBeInTheDocument(); // Esto solo verifica la presencia de un elemento, no el flujo.
// });
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Testing y Calidad de Código',
    'topic': 'Pruebas de Integración',
    'subtopic': 'Simulación de eventos y navegación',
    'definition': '''
Para que las pruebas de integración sean efectivas, necesitamos simular cómo un usuario real interactuaría con nuestra aplicación. Esto incluye simular clics, escribir en campos de texto y, crucialmente, simular la navegación entre diferentes partes de la aplicación.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una aplicación web donde el usuario navega de una página a otra. Si tus pruebas solo verifican la interacción dentro de una sola página, te estás perdiendo cómo la aplicación se comporta cuando el usuario se mueve entre rutas. `React Testing Library` (RTL) nos proporciona herramientas para simular eventos del DOM como `fireEvent.click()` o `fireEvent.change()`, que nos permiten interactuar con los elementos de la UI de la misma manera que lo haría un usuario.

Para la navegación, cuando usamos librerías como `React Router`, los componentes de ruta no se renderizan automáticamente en un entorno de prueba sin un contexto de enrutador. Para simular la navegación, a menudo necesitamos envolver los componentes bajo prueba con `BrowserRouter` (o `MemoryRouter` para pruebas aisladas) y usar utilidades como `userEvent` (una extensión de RTL que simula interacciones más realistas) o métodos del propio `history` de `React Router` para cambiar la URL y verificar que la UI se actualiza correctamente. Esto nos permite probar que los enlaces dirigen a las páginas correctas, que los componentes se montan y desmontan como se espera, y que los parámetros de URL se manejan adecuadamente, cubriendo así un aspecto fundamental de la experiencia del usuario.
''',
    'code_example': r'''
// Para estas pruebas, se asume Jest, React Testing Library y React Router configurados.
// npm install --save-dev react-router-dom @testing-library/user-event

// --- Componentes (simulados para el ejemplo) ---

// components/Home.js
import React from 'react';
import { Link } from 'react-router-dom';

function Home() {
  return (
    <div>
      <h2>Página de Inicio</h2>
      <p>Bienvenido a nuestra aplicación de ejemplo.</p>
      <Link to="/about">Ir a Sobre Nosotros</Link>
      <br/>
      <Link to="/dashboard">Ir al Dashboard (Requiere Auth)</Link>
    </div>
  );
}
export default Home;

// components/About.js
import React from 'react';

function About() {
  return (
    <div>
      <h2>Sobre Nosotros</h2>
      <p>Conoce más sobre nuestra misión.</p>
    </div>
  );
}
export default About;

// components/Dashboard.js (protegido por autenticación)
import React from 'react';

function Dashboard() {
  return (
    <div>
      <h2>Panel de Control</h2>
      <p>Contenido solo para usuarios autenticados.</p>
    </div>
  );
}
export default Dashboard;

// App.js (La aplicación con rutas)
import React, { useState } from 'react';
import { BrowserRouter as Router, Routes, Route, Navigate } from 'react-router-dom';
import Home from './Home';
import About from './About';
import Dashboard from './Dashboard';
import LoginForm from './LoginForm'; // Reutilizamos el LoginForm del subtema anterior
import './App.css';

// Componente para simular autenticación
const PrivateRoute = ({ children, isAuthenticated }) => {
  return isAuthenticated ? children : <Navigate to="/login" replace />;
};

function App() {
  const [loggedInUser, setLoggedInUser] = useState(null);

  const handleLogin = (username) => {
    setLoggedInUser(username);
  };

  const handleLogout = () => {
    setLoggedInUser(null);
  };

  return (
    <Router> {/* BrowserRouter para el entorno de la aplicación */}
      <nav>
        <Link to="/">Inicio</Link> |{' '}
        <Link to="/about">Sobre</Link> |{' '}
        {loggedInUser ? (
          <>
            <Link to="/dashboard">Dashboard</Link> |{' '}
            <button onClick={handleLogout} style={{ background: 'none', border: 'none', color: 'blue', cursor: 'pointer' }}>Cerrar Sesión</button>
          </>
        ) : (
          <Link to="/login">Iniciar Sesión</Link>
        )}
      </nav>
      <div style={{ margin: '20px', padding: '20px', border: '1px solid #eee', borderRadius: '8px' }}>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/about" element={<About />} />
          <Route path="/login" element={<LoginForm onLogin={handleLogin} />} />
          <Route
            path="/dashboard"
            element={
              <PrivateRoute isAuthenticated={loggedInUser}>
                <Dashboard />
              </PrivateRoute>
            }
          />
          <Route path="*" element={<h1>404: Página no encontrada</h1>} />
        </Routes>
      </div>
    </Router>
  );
}

export default App;


// --- Prueba de Integración con Navegación (App.test.js) ---
import React from 'react';
import { render, screen, fireEvent, waitFor } from '@testing-library/react';
import userEvent from '@testing-library/user-event'; // Para simular interacciones más realistas
import '@testing-library/jest-dom';
import { MemoryRouter } from 'react-router-dom'; // Usar MemoryRouter para aislar pruebas de ruta
import App from './App';

describe('Flujo de Navegación y Autenticación en la App', () => {

  // Función auxiliar para renderizar el componente con MemoryRouter
  // Esto es clave para probar componentes que usan React Router
  const renderWithRouter = (ui, { route = '/' } = {}) => {
    window.history.pushState({}, 'Test page', route);
    return render(ui, { wrapper: ({ children }) => <MemoryRouter initialEntries={[route]}>{children}</MemoryRouter> });
  };

  test('navegación de inicio a sobre nosotros', async () => {
    renderWithRouter(<App />);

    // Verificar que estamos en la página de inicio
    expect(screen.getByText(/Página de Inicio/i)).toBeInTheDocument();

    // Simular clic en el enlace "Ir a Sobre Nosotros"
    // userEvent.click es mejor que fireEvent.click para interacciones complejas
    await userEvent.click(screen.getByRole('link', { name: /Ir a Sobre Nosotros/i }));

    // Verificar que la página "Sobre Nosotros" se ha cargado
    expect(screen.getByText(/Sobre Nosotros/i)).toBeInTheDocument();
    expect(screen.queryByText(/Página de Inicio/i)).not.toBeInTheDocument();
  });

  test('intento de acceder a dashboard sin autenticación redirige a login', async () => {
    renderWithRouter(<App />, { route: '/dashboard' });

    // Esperar a que la página de login aparezca (por la redirección)
    await waitFor(() => {
      expect(screen.getByRole('button', { name: /Iniciar Sesión/i })).toBeInTheDocument();
    });
    // Verificar que el Dashboard no se renderiza
    expect(screen.queryByText(/Panel de Control/i)).not.toBeInTheDocument();
  });

  test('autenticación y acceso al dashboard, luego cierre de sesión', async () => {
    renderWithRouter(<App />);

    // Ir a la página de login
    await userEvent.click(screen.getByRole('link', { name: /Iniciar Sesión/i }));
    expect(screen.getByLabelText(/Usuario:/i)).toBeInTheDocument();

    // Iniciar sesión
    userEvent.type(screen.getByLabelText(/Usuario:/i), 'testuser');
    userEvent.type(screen.getByLabelText(/Contraseña:/i), 'password123');
    await userEvent.click(screen.getByRole('button', { name: /Iniciar Sesión/i }));

    // Esperar a que el usuario autenticado vea los enlaces de navegación
    await waitFor(() => {
      expect(screen.getByRole('link', { name: /Dashboard/i })).toBeInTheDocument();
      expect(screen.getByRole('button', { name: /Cerrar Sesión/i })).toBeInTheDocument();
    });
    // Verificar que la navegación principal también muestra el nombre de usuario o un indicador
    expect(screen.queryByRole('link', { name: /Iniciar Sesión/i })).not.toBeInTheDocument();

    // Ahora, ir al dashboard
    await userEvent.click(screen.getByRole('link', { name: /Dashboard/i }));
    await waitFor(() => {
      expect(screen.getByText(/Panel de Control/i)).toBeInTheDocument();
    });

    // Cerrar sesión
    await userEvent.click(screen.getByRole('button', { name: /Cerrar Sesión/i }));
    await waitFor(() => {
      expect(screen.getByRole('link', { name: /Iniciar Sesión/i })).toBeInTheDocument();
    });
    expect(screen.queryByText(/Panel de Control/i)).not.toBeInTheDocument();
  });

  test('manejo de rutas no existentes (404)', async () => {
    renderWithRouter(<App />, { route: '/ruta-no-existente' });

    await waitFor(() => {
      expect(screen.getByRole('heading', { level: 1, name: /404: Página no encontrada/i })).toBeInTheDocument();
    });
  });
});

// App.css (ejemplo de estilos)
/*
.App {
  font-family: Arial, sans-serif;
  text-align: center;
  padding: 20px;
}

nav {
  margin-bottom: 20px;
  padding: 10px;
  background-color: #f0f0f0;
  border-radius: 5px;
}

nav a {
  margin: 0 10px;
  text-decoration: none;
  color: #007bff;
  font-weight: bold;
}

nav a:hover {
  text-decoration: underline;
}

h2 {
  color: #333;
}
*/

// Ejemplo incorrecto (no envolver en Router para probar navegación)
// test('intento de probar navegación sin Router (BAD)', () => {
//   // render(<App />); // Esto fallaría porque `Link` y `Routes` necesitan un Router superior.
//   // expect(screen.getByRole('link', { name: /Sobre Nosotros/i })).toBeInTheDocument();
// });

// Ejemplo incorrecto (usar `window.location.assign` para simular navegación en pruebas)
// test('simular navegación con window.location.assign (EVITAR)', () => {
//   // No es una buena práctica en pruebas de React Testing Library.
//   // Mockear `window.location.assign` o `history.push` directamente rompe la filosofía de RTL
//   // de probar cómo el usuario interactúa con la UI, no la implementación interna.
//   // Usa `MemoryRouter` y `userEvent.click` en los <Link> o <button> de navegación.
// });
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Testing y Calidad de Código',
    'topic': 'Pruebas de Integración',
    'subtopic': 'Cobertura de pruebas y métricas',
    'definition': '''
La cobertura de pruebas es una métrica que mide la cantidad de código de tu aplicación que ha sido ejecutado por tus pruebas. No es una garantía de que tu código sea perfecto, pero es un indicador útil de cuánta lógica ha sido ejercitada por tus tests.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en que tienes una aplicación grande. Si solo tienes un puñado de pruebas, es posible que haya grandes secciones de tu código sin probar. Si haces un cambio en una de esas secciones no probadas, podrías introducir un error sin darte cuenta. La cobertura de pruebas te ayuda a identificar esas "lagunas" en tus tests, mostrándote qué líneas de código, ramas (condiciones `if/else`), funciones o componentes no están siendo tocados por ninguna de tus pruebas.

Herramientas como Jest vienen con un reportero de cobertura de pruebas integrado que genera informes detallados (en la consola y como archivos HTML). Este informe te dirá, por ejemplo, qué porcentaje de tus sentencias, ramas, funciones y líneas de código están cubiertas. Una alta cobertura no significa ausencia de bugs (podrías tener un 100% de cobertura y aún así tener lógica defectuosa), pero una baja cobertura es una señal de alerta clara de que muchas partes de tu aplicación podrían estar fallando sin que lo sepas. Utilizar estas métricas te permite enfocar tus esfuerzos de testing donde más se necesitan y trabajar hacia una base de código más robusta y fiable.
''',
    'code_example': r'''
// Para generar el informe de cobertura con Jest:
// 1. Asegúrate de tener Jest configurado en tu proyecto.
// 2. Ejecuta tus pruebas con el flag `--coverage`: `npm test -- --coverage`
//    (Si tu script "test" en package.json ya es "jest", puedes usar: `npm test -- --coverage`)
// Esto generará un informe en la consola y una carpeta `coverage/` con un informe HTML.

// --- Archivo de ejemplo (src/utils/mathUtils.js) ---
export function add(a, b) {
  return a + b;
}

export function subtract(a, b) {
  return a - b;
}

export function multiply(a, b) {
  return a * b;
}

export function divide(a, b) {
  if (b === 0) {
    // Esta rama de código es un buen candidato para no estar cubierta si no se prueba
    console.error('Error: División por cero no permitida.');
    return undefined; // Retorna undefined para indicar un fallo
  }
  return a / b;
}

export function isEven(number) {
  if (typeof number !== 'number') {
    throw new Error('Input must be a number.');
  }
  return number % 2 === 0;
}

// --- Archivo de pruebas (src/utils/mathUtils.test.js) ---
import { add, subtract, multiply, divide, isEven } from './mathUtils';

describe('mathUtils', () => {
  test('add function should correctly add two numbers', () => {
    expect(add(1, 2)).toBe(3);
    expect(add(-1, 1)).toBe(0);
  });

  test('subtract function should correctly subtract two numbers', () => {
    expect(subtract(5, 2)).toBe(3);
    expect(subtract(2, 5)).toBe(-3);
  });

  test('multiply function should correctly multiply two numbers', () => {
    expect(multiply(3, 4)).toBe(12);
    expect(multiply(0, 10)).toBe(0);
  });

  test('divide function should correctly divide two numbers', () => {
    expect(divide(10, 2)).toBe(5);
    expect(divide(7, 2)).toBe(3.5);
  });

  test('divide function should handle division by zero', () => {
    // Para que esta rama esté cubierta, debemos probarla
    expect(divide(10, 0)).toBeUndefined(); // Esperamos undefined cuando se divide por cero
    // No usamos toThrow aquí porque la función maneja el error internamente y no lo lanza
  });

  test('isEven function should return true for even numbers', () => {
    expect(isEven(2)).toBe(true);
    expect(isEven(0)).toBe(true);
    expect(isEven(-4)).toBe(true);
  });

  test('isEven function should return false for odd numbers', () => {
    expect(isEven(3)).toBe(false);
    expect(isEven(-1)).toBe(false);
  });

  test('isEven function should throw error for non-numeric input', () => {
    expect(() => isEven('abc')).toThrow('Input must be a number.');
    expect(() => isEven(null)).toThrow('Input must be a number.');
  });
});

/*
Después de ejecutar `npm test -- --coverage`, Jest mostrará un informe en la consola
similar a este (los porcentajes pueden variar):

-----------------|---------|----------|---------|---------|-------------------
File             | % Stmts | % Branch | % Funcs | % Lines | Uncovered Line #s
-----------------|---------|----------|---------|---------|-------------------
All files        |     100 |    92.85 |     100 |     100 |
 src/utils/mathUtils.js |     100 |    92.85 |     100 |     100 | 17
-----------------|---------|----------|---------|---------|-------------------

En este ejemplo, la línea 17 (el `console.error` dentro de `divide` cuando `b === 0`)
no fue cubierta directamente por una aserción, aunque la rama `if (b === 0)` sí lo fue.
Esto nos indica que podríamos añadir una prueba para esa línea específica (ej. mockear console.error y verificar su llamada).

Si comentaras la prueba de `divide by zero`, verías una cobertura de ramas y líneas más baja.

Ejemplo de código que NO está cubierto (hipotético, no incluido en mathUtils.js para el ejemplo)
function unusedFunction() {
  // Este código nunca se ejecutaría si no hay una prueba que lo llame.
  // El informe de cobertura lo marcaría como no cubierto.
  return 'never called';
}

function processComplexData(data) {
  if (data.type === 'A') {
    // Rama A
  } else if (data.type === 'B') {
    // Rama B - Si solo pruebas 'A', 'B' no estará cubierto
  } else {
    // Rama C - Si no pruebas ni 'A' ni 'B', esta rama tampoco lo estará.
  }
}
*/
'''
  });
}

Future<void> insertReactMidLevel6Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Optimización y Buenas Prácticas',
    'topic': 'Optimización de Rendimiento',
    'subtopic': 'Memoización de componentes con React.memo',
    'definition': '''
La memoización es una técnica de optimización que evita recálculos innecesarios de funciones o re-renderizados de componentes guardando el resultado de una operación costosa y devolviendo ese resultado almacenado si las mismas entradas vuelven a aparecer. En React, `React.memo` es una herramienta de alto nivel para memoizar componentes funcionales.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una aplicación React con muchos componentes anidados. Cada vez que el estado de un componente padre cambia, React re-renderiza *todos* sus componentes hijos por defecto. Si un componente hijo es "costoso" de renderizar (porque tiene mucha lógica o muchos elementos en su árbol) y sus `props` no han cambiado, re-renderizarlo de nuevo es un desperdicio de recursos. `React.memo` actúa como un "guardián inteligente": envuelve tu componente funcional y, antes de re-renderizarlo, compara las `props` nuevas con las anteriores. Si son idénticas, `React.memo` le dice a React que omita el re-renderizado de ese componente y que use la versión previamente renderizada.

Esto es súper útil para componentes que:
1.  Son puramente funcionales (dado el mismo input, siempre producen el mismo output).
2.  Reciben las mismas props la mayor parte del tiempo.
3.  Son costosos de renderizar.

Es importante recordar que `React.memo` hace una comparación superficial de las `props`. Si las `props` incluyen objetos o funciones, y estas se recrean en cada render del padre (lo que es común), la memoización no funcionará como esperas a menos que también memoices esas funciones u objetos con `useCallback` y `useMemo`, respectivamente. Usar `React.memo` de forma estratégica puede mejorar significativamente el rendimiento de tu aplicación al reducir los re-renderizados innecesarios.
''',
    'code_example': r'''
// Componente de ejemplo que muestra el uso de React.memo

import React, { useState, useCallback, useMemo } from 'react';
import './App.css';

// 1. Componente Hijo NO memoizado (sin React.memo)
function NonMemoizedChild({ value, onIncrement }) {
  console.log('  NonMemoizedChild se ha renderizado'); // Para ver cuándo se renderiza
  return (
    <div className="child-box non-memoized">
      <h4>Hijo NO Memoizado</h4>
      <p>Valor de Prop: {value}</p>
      <button onClick={onIncrement}>Incrementar Padre</button>
    </div>
  );
}

// 2. Componente Hijo memoizado con React.memo
// Se re-renderizará SOLO si sus props *cambian superficialmente*.
const MemoizedChild = React.memo(({ value, onIncrement }) => {
  console.log('  MemoizedChild se ha renderizado'); // Para ver cuándo se renderiza
  return (
    <div className="child-box memoized">
      <h4>Hijo Memoizado (React.memo)</h4>
      <p>Valor de Prop: {value}</p>
      <button onClick={onIncrement}>Incrementar Padre</button>
    </div>
  );
});

// 3. Otro componente hijo memoizado que recibe un objeto y una función
const ComplexMemoizedChild = React.memo(({ settings, calculate }) => {
  console.log('  ComplexMemoizedChild se ha renderizado');
  const result = calculate(settings.factor); // Usa la función y el objeto de las props
  return (
    <div className="child-box complex-memoized">
      <h4>Hijo Memoizado Complejo</h4>
      <p>Factor: {settings.factor}</p>
      <p>Resultado Cálculo: {result}</p>
    </div>
  );
});


function ParentComponent() {
  const [count, setCount] = useState(0);
  const [otherState, setOtherState] = useState(0);

  // Cada vez que ParentComponent se re-renderiza, esta función `handleIncrement`
  // es recreada, lo que causaría que `MemoizedChild` también se re-renderice
  // a menos que usemos `useCallback`.
  const handleIncrement = useCallback(() => {
    setCount(prevCount => prevCount + 1);
  }, []); // El array de dependencias vacío significa que la función solo se crea una vez.

  // Si `settings` no se memoiza, `ComplexMemoizedChild` se re-renderizará
  // porque el objeto `settings` sería una nueva referencia en cada render.
  const memoizedSettings = useMemo(() => ({
    factor: 10,
    unit: 'items'
  }), []); // El array de dependencias vacío significa que el objeto solo se crea una vez.

  // Si `calculateValue` no se memoiza, `ComplexMemoizedChild` se re-renderizará
  // porque la función `calculate` sería una nueva referencia en cada render.
  const calculateValue = useCallback((factor) => {
    // Simula un cálculo costoso
    let sum = 0;
    for(let i = 0; i < 1000000; i++) {
        sum += i * factor;
    }
    return sum;
  }, []);

  return (
    <div className="parent-container">
      <h2>Componente Padre</h2>
      <p>Contador Padre: {count}</p>
      <p>Otro Estado Padre (no afecta hijos): {otherState}</p>
      <button onClick={() => setCount(count + 1)}>Incrementar Contador</button>
      <button onClick={() => setOtherState(otherState + 1)}>Cambiar Otro Estado</button>
      <hr />

      <NonMemoizedChild value={count} onIncrement={handleIncrement} />
      <MemoizedChild value={count} onIncrement={handleIncrement} />
      <ComplexMemoizedChild settings={memoizedSettings} calculate={calculateValue} />

      <p>
        Observa la consola del navegador. Cuando incrementas el "Otro Estado",
        el componente "Hijo NO Memoizado" se re-renderiza, mientras que los
        componentes "Hijo Memoizado" no lo hacen, a menos que cambie su prop `value`
        o que las referencias de `settings` o `calculate` no estén memoizadas.
      </p>
    </div>
  );
}

function App() {
  return (
    <div className="App">
      <ParentComponent />
    </div>
  );
}

export default App;

// App.css (ejemplo de estilos)
/*
.App {
  font-family: Arial, sans-serif;
  text-align: center;
  padding: 20px;
}

.parent-container {
  border: 2px solid #3498db;
  padding: 20px;
  margin: 20px auto;
  max-width: 800px;
  border-radius: 10px;
  background-color: #ecf0f1;
  box-shadow: 0 4px 8px rgba(0,0,0,0.1);
}

.parent-container h2 {
  color: #2c3e50;
}

.child-box {
  border: 1px dashed #7f8c8d;
  padding: 15px;
  margin: 15px auto;
  width: 90%;
  border-radius: 8px;
}

.non-memoized {
  background-color: #f1c40f30;
  border-color: #f1c40f;
}

.memoized {
  background-color: #2ecc7130;
  border-color: #2ecc71;
}

.complex-memoized {
  background-color: #9b59b630;
  border-color: #9b59b6;
}

button {
  background-color: #3498db;
  color: white;
  padding: 10px 15px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  margin: 5px;
  font-size: 1em;
  transition: background-color 0.2s;
}

button:hover {
  background-color: #2980b9;
}
*/

// Ejemplo incorrecto (memoizar cuando no es necesario o correctamente)
// const TrivialComponent = React.memo(({ text }) => {
//   // console.log('TrivialComponent render');
//   // Memoizar un componente que rara vez cambia sus props o es muy ligero
//   // puede añadir más sobrecarga que beneficio debido a la comparación de props.
//   return <p>{text}</p>;
// });

// Ejemplo incorrecto (no usar useCallback o useMemo con React.memo para props de objetos/funciones)
// const ParentBadMemo = () => {
//   const [count, setCount] = useState(0);
//   // Cada render de ParentBadMemo, `myFunc` es una nueva función.
//   const myFunc = () => console.log('Hello');
//   // React.memo hará una comparación superficial de `myFunc` y siempre la verá como diferente,
//   // forzando el re-render de BadlyMemoizedChild.
//   return <BadlyMemoizedChild someProp={count} funcProp={myFunc} />;
// };
// const BadlyMemoizedChild = React.memo(({ someProp, funcProp }) => {
//   // console.log('BadlyMemoizedChild render');
//   return <div>{someProp}</div>;
// });
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Optimización y Buenas Prácticas',
    'topic': 'Optimización de Rendimiento',
    'subtopic': 'Carga diferida de componentes (lazy loading)',
    'definition': '''
La carga diferida, o "lazy loading", es una técnica de optimización que retrasa la carga de partes de tu aplicación hasta que realmente se necesitan. En el contexto de React, esto significa cargar componentes o módulos JavaScript solo cuando van a ser renderizados en la pantalla.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una aplicación grande con muchas páginas o funcionalidades. Cuando un usuario la visita por primera vez, tradicionalmente se descarga todo el código JavaScript de la aplicación de golpe. Esto puede hacer que la carga inicial sea muy lenta, especialmente en dispositivos con conexiones lentas. La carga diferida soluciona esto. En lugar de descargar todo, se divide el código de la aplicación en "trozos" (chunks) más pequeños. Solo se descarga el trozo de código necesario para la página o funcionalidad actual. Cuando el usuario navega a otra sección que requiere un trozo de código diferente, ese trozo se descarga bajo demanda.

React facilita la carga diferida con `React.lazy()` y `Suspense`. `React.lazy()` te permite renderizar un import dinámico como un componente regular. `Suspense` es un componente que envuelve los componentes cargados de forma perezosa y te permite mostrar un "fallback" (como un spinner de carga) mientras los componentes se están cargando. Esto no solo acelera el tiempo de carga inicial de tu aplicación, sino que también reduce el consumo de ancho de banda, lo que resulta en una experiencia de usuario mucho más fluida y eficiente, especialmente en Single Page Applications (SPAs) complejas.
''',
    'code_example': r'''
// Para usar React.lazy y Suspense, no necesitas instalar librerías adicionales,
// vienen incluidos con React.

// 1. Crear componentes que se cargarán de forma perezosa
// components/HeavyComponent.js
import React from 'react';

function HeavyComponent() {
  // Simula un componente "pesado" con un retardo de carga artificial
  const startTime = performance.now();
  while (performance.now() - startTime < 500) {
    // Bloquear el hilo principal por 0.5 segundos para simular carga
  }
  console.log('HeavyComponent: ¡Me he cargado!');
  return (
    <div style={{ padding: '20px', border: '1px solid #c0392b', backgroundColor: '#e74c3c30', borderRadius: '8px' }}>
      <h3>Componente Pesado (Lazy Loaded)</h3>
      <p>Este componente se cargó solo cuando fue necesario. ¡Imagina que tiene mucha lógica!</p>
    </div>
  );
}
export default HeavyComponent;

// components/AnotherLazyComponent.js
import React from 'react';

function AnotherLazyComponent() {
  console.log('AnotherLazyComponent: ¡También me he cargado!');
  return (
    <div style={{ padding: '20px', border: '1px solid #27ae60', backgroundColor: '#2ecc7130', borderRadius: '8px', marginTop: '15px' }}>
      <h3>Otro Componente Lazy Loaded</h3>
      <p>Útil para rutas o modales que no siempre se muestran.</p>
    </div>
  );
}
export default AnotherLazyComponent;


// 2. Usar React.lazy y Suspense en el componente principal (App.js)
import React, { useState, lazy, Suspense } from 'react';
import './App.css';

// Usar React.lazy para definir los componentes que se cargarán de forma diferida
const LazyHeavyComponent = lazy(() => import('./HeavyComponent'));
const LazyAnotherComponent = lazy(() => import('./AnotherLazyComponent'));

function App() {
  const [showHeavy, setShowHeavy] = useState(false);
  const [showAnother, setShowAnother] = useState(false);

  return (
    <div className="App">
      <h1>Carga Diferida (Lazy Loading) en React</h1>
      <p>
        Haz clic en los botones para cargar los componentes.
        Observa la pestaña "Network" de las herramientas de desarrollo
        para ver cuándo se descarga el JavaScript de cada componente.
      </p>

      <div style={{ margin: '20px' }}>
        <button onClick={() => setShowHeavy(!showHeavy)}>
          {showHeavy ? 'Ocultar Pesado' : 'Mostrar Componente Pesado'}
        </button>
        <button onClick={() => setShowAnother(!showAnother)}>
          {showAnother ? 'Ocultar Otro' : 'Mostrar Otro Componente Lazy'}
        </button>
      </div>

      <div style={{ border: '1px solid #ccc', padding: '15px', minHeight: '200px', borderRadius: '10px' }}>
        {showHeavy && (
          // 3. Envolver los componentes cargados de forma perezosa con Suspense
          // Suspense muestra el fallback mientras el componente se está cargando
          <Suspense fallback={<div className="loading-fallback">Cargando Componente Pesado...</div>}>
            <LazyHeavyComponent />
          </Suspense>
        )}
        {showAnother && (
          <Suspense fallback={<div className="loading-fallback">Cargando Otro Componente...</div>}>
            <LazyAnotherComponent />
          </Suspense>
        )}
        {!showHeavy && !showAnother && (
          <p>Ningún componente lazy loaded está visible.</p>
        )}
      </div>
    </div>
  );
}

export default App;

// App.css (ejemplo de estilos)
/*
.App {
  font-family: Arial, sans-serif;
  text-align: center;
  padding: 20px;
}

button {
  background-color: #007bff;
  color: white;
  padding: 10px 15px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  margin: 5px;
  font-size: 1em;
  transition: background-color 0.2s;
}

button:hover {
  background-color: #0056b3;
}

.loading-fallback {
  padding: 20px;
  background-color: #f0f8ff;
  border: 1px dashed #007bff;
  color: #007bff;
  font-weight: bold;
  border-radius: 8px;
}
*/

// Ejemplo incorrecto (no usar Suspense con React.lazy)
// function AppBadLazy() {
//   // const LazyComponent = lazy(() => import('./MyComponent'));
//   // return <LazyComponent />; // Esto lanzaría un error si no está envuelto en <Suspense>
// }

// Ejemplo incorrecto (usar importación dinámica directamente en JSX sin lazy)
// function AppBadImport() {
//   // return (
//   //   <div>
//   //     {showComponent && import('./MyComponent')} // Esto no funciona así, `import()` devuelve una Promesa.
//   //   </div>
//   // );
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Optimización y Buenas Prácticas',
    'topic': 'Optimización de Rendimiento',
    'subtopic': 'Análisis de rendimiento con herramientas de desarrollo',
    'definition': '''
El análisis de rendimiento en aplicaciones React implica usar herramientas específicas para identificar los "cuellos de botella" y las áreas donde tu aplicación podría estar rindiendo por debajo de lo esperado. Estas herramientas te dan una visión profunda de cómo React procesa y renderiza tus componentes.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en que tu aplicación se siente "lenta" o "torpe" en ciertas interacciones. Podrías tener animaciones que no son fluidas, o quizás la UI tarda en responder a los clics del usuario. Sin un análisis profundo, es difícil saber exactamente *por qué* está ocurriendo. Las herramientas de desarrollo del navegador y las extensiones de React te permiten ver qué componentes se re-renderizan, cuánto tiempo les toma, qué operaciones son costosas y si hay algún patrón que cause ineficiencias.

Las principales herramientas para esto son:
1.  **React Developer Tools:** Una extensión de navegador indispensable (para Chrome/Firefox) que te permite inspeccionar el árbol de componentes de React, sus props, estado y hooks. Incluye un perfilador ("Profiler") que graba el ciclo de renderizado y te muestra un gráfico de "flame chart" donde puedes ver cuánto tiempo tarda cada componente en renderizarse y cuántas veces lo hace. Esto es oro puro para identificar re-renderizados innecesarios o componentes lentos.
2.  **Pestaña "Performance" de Chrome DevTools (u otros navegadores):** Te permite grabar el rendimiento general del navegador, incluyendo el tiempo de CPU, actividad de red, diseño, pintura y scripts. Puedes ver cuándo se ejecutan los scripts de React y cómo impactan en el rendimiento visual de la página.
3.  **Lighthouse (integrado en Chrome DevTools):** Una herramienta de auditoría que evalúa tu aplicación en varios aspectos, incluyendo rendimiento, accesibilidad, mejores prácticas y SEO. Te da una puntuación y sugerencias concretas para mejorar.

Al usar estas herramientas, puedes tomar decisiones informadas sobre dónde aplicar optimizaciones (como `React.memo`, `useCallback`, `useMemo`, carga diferida) para lograr una experiencia de usuario fluida y receptiva.
''',
    'code_example': r'''
// No hay un "código de ejemplo" directo para el análisis de rendimiento,
// ya que se trata más de usar las herramientas externas.
// Sin embargo, podemos mostrar un componente "problemático" y cómo lo inspeccionarías.

import React, { useState, useEffect } from 'react';
import './App.css';

// Componente que podría causar problemas de rendimiento si no se optimiza
function UnoptimizedList({ items, filterText }) {
  // Simula un cálculo costoso en cada render
  const filteredItems = items.filter(item =>
    item.name.toLowerCase().includes(filterText.toLowerCase())
  );
  console.log('UnoptimizedList: Renderizado y filtrando...');

  return (
    <div className="list-container">
      <h3>Lista No Optimizada</h3>
      <p>Total de ítems: {filteredItems.length}</p>
      <ul>
        {filteredItems.map(item => (
          <li key={item.id}>{item.name}</li>
        ))}
      </ul>
    </div>
  );
}

// Versión optimizada con React.memo y useMemo
const OptimizedList = React.memo(({ items, filterText }) => {
  console.log('OptimizedList: Renderizado y filtrando (memoizado)...');

  // useMemo para memoizar el resultado del filtrado.
  // Solo se recalculará si `items` o `filterText` cambian.
  const memoizedFilteredItems = useMemo(() => {
    console.log('  OptimizedList: ¡Filtrando ítems (cálculo costoso)!'); // Solo se ve si cambian dependencias
    return items.filter(item =>
      item.name.toLowerCase().includes(filterText.toLowerCase())
    );
  }, [items, filterText]); // Dependencias para el memoizado

  return (
    <div className="list-container optimized">
      <h3>Lista Optimizada (React.memo + useMemo)</h3>
      <p>Total de ítems: {memoizedFilteredItems.length}</p>
      <ul>
        {memoizedFilteredItems.map(item => (
          <li key={item.id}>{item.name}</li>
        ))}
      </ul>
    </div>
  );
});


function App() {
  const [data, setData] = useState([]);
  const [filter, setFilter] = useState('');
  const [refreshCount, setRefreshCount] = useState(0); // Para forzar re-renders del padre

  useEffect(() => {
    // Generar 1000 ítems de datos simulados
    const dummyData = Array.from({ length: 1000 }, (_, i) => ({
      id: i,
      name: `Elemento ${i + 1} de la lista`
    }));
    setData(dummyData);
  }, []);

  const handleRefresh = () => {
    setRefreshCount(prev => prev + 1);
    console.log('App: Re-render forzado (sin cambiar datos de la lista)');
  };

  return (
    <div className="App">
      <h1>Análisis de Rendimiento (Ejemplo Práctico)</h1>
      <p>
        Abre las **React Developer Tools** (pestaña "Profiler") y la pestaña "Console" de tu navegador.<br/>
        Graba el rendimiento mientras escribes en el input o haces clic en "Forzar Re-render".
      </p>
      <input
        type="text"
        placeholder="Filtrar ítems..."
        value={filter}
        onChange={(e) => setFilter(e.target.value)}
        className="filter-input"
      />
      <button onClick={handleRefresh}>Forzar Re-render de App ({refreshCount})</button>

      <hr />

      <UnoptimizedList items={data} filterText={filter} />
      <OptimizedList items={data} filterText={filter} />

      <p>
        **Observa:**<br/>
        1. Al escribir, ambos componentes se re-renderizan.
        2. Al "Forzar Re-render de App", solo `UnoptimizedList` se re-renderiza completamente,
           mientras `OptimizedList` *no* recalcula el filtro (gracias a `useMemo`)
           y su renderizado es más rápido (gracias a `React.memo` si sus props no cambiaron).
        3. En el Profiler, busca los tiempos de renderizado y las barras grises para ver cuándo
           los componentes no se renderizaron gracias a la memoización.
      </p>
    </div>
  );
}

export default App;

// App.css (ejemplo de estilos)
/*
.App {
  font-family: Arial, sans-serif;
  text-align: center;
  padding: 20px;
}

.filter-input {
  padding: 10px;
  margin: 15px 10px;
  width: 300px;
  border: 1px solid #ccc;
  border-radius: 5px;
  font-size: 1em;
}

button {
  background-color: #007bff;
  color: white;
  padding: 10px 15px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  margin: 5px;
  font-size: 1em;
  transition: background-color 0.2s;
}

button:hover {
  background-color: #0056b3;
}

.list-container {
  border: 1px solid #ddd;
  padding: 15px;
  margin: 20px auto;
  max-width: 600px;
  border-radius: 8px;
  background-color: #f8f8f8;
  text-align: left;
}

.list-container ul {
  list-style: none;
  padding: 0;
  max-height: 200px;
  overflow-y: auto;
  border: 1px solid #eee;
  background-color: #fff;
  padding: 10px;
  border-radius: 5px;
}

.list-container li {
  padding: 5px 0;
  border-bottom: 1px dashed #f0f0f0;
}

.list-container li:last-child {
  border-bottom: none;
}

.optimized {
  border-color: #28a745;
  background-color: #e6ffe6;
}
*/

// Ejemplo incorrecto (ignorar warnings de rendimiento o el profiler)
// Si el profiler de React DevTools te muestra que un componente se renderiza muchas veces
// con las mismas props y tarda mucho, y no investigas por qué, estás ignorando una señal.
//
// const BadComponent = ({ heavyData }) => {
//   // Si heavyData es un objeto grande que cambia constantemente de referencia,
//   // o si esta operación es muy costosa y se ejecuta en cada render,
//   // es una señal de que necesitas optimizar.
//   const processedData = JSON.stringify(heavyData).length; // Costoso!
//   return <div>{processedData}</div>;
// };
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Optimización y Buenas Prácticas',
    'topic': 'Accesibilidad y SEO',
    'subtopic': 'Mejores prácticas de accesibilidad en React',
    'definition': '''
La accesibilidad web (conocida como A11y, por el número de letras entre la A y la Y) se refiere a la práctica de diseñar y desarrollar sitios web y aplicaciones que pueden ser utilizados por cualquier persona, independientemente de sus capacidades físicas, sensoriales o cognitivas, o del dispositivo que usen. En React, es fundamental integrar estas prácticas desde el principio.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en un usuario con discapacidad visual que utiliza un lector de pantalla para navegar por tu aplicación. Si tu UI no está construida con la accesibilidad en mente, este usuario podría no poder entender el contenido, interactuar con los botones o completar formularios. Esto no solo excluye a un segmento importante de usuarios, sino que también puede tener implicaciones legales y éticas. React, al ser una librería para construir interfaces de usuario, te da el control para implementar estas mejores prácticas.

Algunas de las mejores prácticas clave incluyen:
* **Uso de elementos HTML semánticos:** En lugar de usar `div`s para todo, utiliza `header`, `nav`, `main`, `footer`, `button`, `a`, etc., que transmiten significado a los navegadores y tecnologías de asistencia.
* **Atributos ARIA (Accessible Rich Internet Applications):** Estos atributos complementan el HTML semántico, proporcionando información adicional sobre roles, estados y propiedades de los elementos UI, especialmente para componentes personalizados que no tienen un equivalente HTML nativo (como un `DatePicker` o un `Modal`). Por ejemplo, `aria-label`, `aria-labelledby`, `aria-describedby`, `aria-expanded`.
* **Gestión del foco del teclado:** Asegúrate de que los usuarios puedan navegar por todos los elementos interactivos usando solo el teclado, y que el foco sea visible y lógico (ej. cuando se abre un modal, el foco debe moverse al modal y regresar al elemento que lo activó al cerrarse).
* **Contraste de color suficiente:** El texto y los elementos interactivos deben tener suficiente contraste con su fondo para ser legibles para personas con baja visión.
* **Alternativas de texto para imágenes:** Todas las imágenes que transmiten información deben tener un atributo `alt` descriptivo.

Integrar estas prácticas en React significa no solo escribir HTML correcto, sino también usar los hooks y el ciclo de vida para gestionar el foco, actualizar atributos ARIA dinámicamente y asegurarte de que los componentes personalizados sean accesibles. Es una inversión que beneficia a todos tus usuarios.
''',
    'code_example': r'''
// Componente de ejemplo que demuestra mejores prácticas de accesibilidad en React

import React, { useState, useRef, useEffect } from 'react';
import './App.css'; // Para estilos básicos y CSS para el outline del foco

// 1. Componente con buen uso de etiquetas semánticas y atributos ARIA
function AccessibleButton() {
  const [pressed, setPressed] = useState(false);

  // Un buen botón usa la etiqueta <button> por defecto.
  // Si fuera un div simulando un botón, necesitaría `role="button"` y manejo de teclado.
  return (
    <button
      className="a11y-button"
      onClick={() => setPressed(!pressed)}
      aria-pressed={pressed} // Indica a las tecnologías de asistencia si el botón está "presionado" (toggle)
      aria-label="Toggle Estado" // Etiqueta descriptiva para lectores de pantalla si el texto no es suficiente
    >
      {pressed ? 'Activado ✅' : 'Desactivado ❌'}
    </button>
  );
}

// 2. Componente de Modal accesible (con manejo de foco y atributos ARIA)
function AccessibleModal({ isOpen, onClose }) {
  const modalRef = useRef(null); // Referencia al modal para gestionar el foco
  const prevActiveElement = useRef(null); // Para guardar el elemento que tenía el foco antes de abrir el modal

  useEffect(() => {
    if (isOpen) {
      // Guarda el elemento que tenía el foco antes de abrir el modal
      prevActiveElement.current = document.activeElement;
      // Mueve el foco al modal o a un elemento dentro del modal cuando se abre
      // Usar setTimeout para asegurar que el modal ya está renderizado
      setTimeout(() => modalRef.current?.focus(), 0);

      // Bloquear el scroll del cuerpo cuando el modal está abierto
      document.body.style.overflow = 'hidden';
    } else {
      // Restaurar el foco al elemento anterior cuando el modal se cierra
      prevActiveElement.current?.focus();
      // Restaurar el scroll
      document.body.style.overflow = '';
    }

    // Limpieza al desmontar o al cambiar isOpen
    return () => {
      document.body.style.overflow = '';
    };
  }, [isOpen]);

  // Manejar la tecla Escape para cerrar el modal
  const handleKeyDown = (event) => {
    if (event.key === 'Escape') {
      onClose();
    }
  };

  if (!isOpen) return null;

  return (
    <div
      className="modal-overlay"
      role="dialog"        // Indica que es un cuadro de diálogo
      aria-modal="true"    // Indica que el contenido detrás del modal es inactivo
      aria-labelledby="modal-title" // Relaciona el modal con su título para accesibilidad
      tabIndex={-1}        // Hace que el div sea enfocable programáticamente
      ref={modalRef}       // Asigna la referencia
      onKeyDown={handleKeyDown} // Maneja eventos de teclado
    >
      <div className="modal-content">
        <h2 id="modal-title">Título del Modal Accesible</h2>
        <p>Este es el contenido del modal. Puedes navegar con Tab.</p>
        <button className="close-button" onClick={onClose} aria-label="Cerrar modal">
          &times; {/* Símbolo de cierre */}
        </button>
        <button>Botón Dentro Modal</button>
        <input type="text" placeholder="Input de texto" />
      </div>
    </div>
  );
}


function App() {
  const [isModalOpen, setIsModalOpen] = useState(false);

  return (
    <div className="App">
      <h1>Prácticas de Accesibilidad (A11y) en React</h1>

      <section>
        <h2>Ejemplo de Botón Accesible</h2>
        <p>Un botón con `aria-pressed` y `aria-label` para mejor contexto.</p>
        <AccessibleButton />
      </section>

      <section style={{ marginTop: '40px' }}>
        <h2>Ejemplo de Modal Accesible</h2>
        <p>
          Este modal gestiona el foco del teclado, usa atributos ARIA y se cierra con Escape.
        </p>
        <button onClick={() => setIsModalOpen(true)}>Abrir Modal</button>
        <AccessibleModal isOpen={isModalOpen} onClose={() => setIsModalOpen(false)} />
      </section>

      <section style={{ marginTop: '40px' }}>
        <h2>Otros Ejemplos (solo conceptuales)</h2>
        <p>
          Asegúrate de usar etiquetas HTML semánticas como `<nav>`, `<main>`, `<section>`, `<article>`, `<aside>`, `<footer>`.
        </p>
        <p>
          Las imágenes deben tener un `alt` descriptivo:
          <img src="logo.png" alt="Logo de la empresa RutaCode" style={{ width: '50px', verticalAlign: 'middle', marginLeft: '10px' }} />
        </p>
        <p>
          Verifica siempre el contraste de color con herramientas.
        </p>
      </section>
    </div>
  );
}

export default App;

// App.css (para estilos básicos y visualización de foco)
/*
body {
  font-family: Arial, sans-serif;
  margin: 0;
  padding: 20px;
  background-color: #f4f4f4;
  color: #333;
}

.App {
  text-align: center;
  max-width: 800px;
  margin: 0 auto;
  background-color: #fff;
  padding: 30px;
  border-radius: 10px;
  box-shadow: 0 4px 15px rgba(0,0,0,0.1);
}

section {
  border: 1px solid #ddd;
  padding: 20px;
  margin-top: 30px;
  border-radius: 8px;
  background-color: #f9f9f9;
}

button {
  background-color: #007bff;
  color: white;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-size: 1em;
  margin: 10px;
  transition: background-color 0.2s;
}

button:hover {
  background-color: #0056b3;
}

// Estilo para el focus (importante para usuarios de teclado)
*:focus {
  outline: 3px solid #ffbf00; // Un outline visible para el foco
  outline-offset: 2px;
}

.a11y-button {
  background-color: #28a745;
  color: white;
  padding: 12px 25px;
  font-size: 1.1em;
  border-radius: 8px;
  border: none;
  cursor: pointer;
}

.a11y-button[aria-pressed="true"] {
  background-color: #dc3545;
}

.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.7);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 1000;
}

.modal-content {
  background: white;
  padding: 30px;
  border-radius: 10px;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
  max-width: 500px;
  width: 90%;
  position: relative;
  outline: none; // Remover outline por defecto para gestionar el nuestro
}

.close-button {
  position: absolute;
  top: 10px;
  right: 10px;
  background: none;
  border: none;
  font-size: 1.5em;
  cursor: pointer;
  color: #666;
}

.close-button:hover {
  color: #333;
}

.modal-content button, .modal-content input {
  margin: 10px 5px;
}
*/

// Ejemplo incorrecto (usar divs sin semántica para elementos interactivos)
// function BadButton() {
//   return (
//     <div onClick={() => alert('Clicked!')} style={{ cursor: 'pointer', padding: '10px', border: '1px solid black' }}>
//       Click Me (BAD - no es accesible para teclado/lectores de pantalla sin `role` y `tabIndex`)
//     </div>
//   );
// }

// Ejemplo incorrecto (no gestionar el foco en modales)
// function BadModal({ isOpen, onClose }) {
//   if (!isOpen) return null;
//   return (
//     <div className="modal-overlay">
//       <div className="modal-content">
//         <h2>Bad Modal</h2>
//         <p>Foco de teclado no gestionado.</p>
//         <button onClick={onClose}>Close</button>
//       </div>
//     </div>
//   );
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Optimización y Buenas Prácticas',
    'topic': 'Accesibilidad y SEO',
    'subtopic': 'Uso de etiquetas semánticas',
    'definition': '''
Las etiquetas semánticas en HTML (como `header`, `nav`, `main`, `footer`, `article`, `section`, `aside`) son elementos que transmiten significado sobre el contenido que contienen, tanto a los navegadores como a los desarrolladores y, crucialmente, a las tecnologías de asistencia como los lectores de pantalla.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en un documento sin títulos, párrafos o secciones claras, solo un montón de texto. Sería muy difícil de leer y entender, ¿verdad? Lo mismo ocurre con el código HTML. Si construyes tu aplicación React usando solo `div`s y `span`s, tu página será un caos estructural para un lector de pantalla o para los motores de búsqueda. Estas etiquetas semánticas ayudan a crear una **estructura lógica y significativa** de tu contenido. Por ejemplo, un lector de pantalla puede permitir a un usuario saltar directamente al `main` contenido, o a la `nav`egación principal, o a una `article` específica, lo cual mejora drásticamente la experiencia de navegación para personas con discapacidad visual o cognitiva.

Además de la accesibilidad, el uso de etiquetas semánticas también es beneficioso para el SEO (Search Engine Optimization). Los motores de búsqueda utilizan la estructura semántica de tu página para comprender mejor su contenido y determinar su relevancia. Una página bien estructurada semánticamente es más fácil de rastrear e indexar, lo que puede mejorar tu posicionamiento en los resultados de búsqueda. En React, donde construyes tu UI con componentes, es vital que estos componentes rendericen HTML con la semántica adecuada, asegurando que tu aplicación no solo sea visualmente atractiva, sino también comprensible y accesible para todos y para los robots de búsqueda.
''',
    'code_example': r'''
// Componente de ejemplo que demuestra el uso de etiquetas semánticas en React

import React from 'react';
import './App.css'; // Para estilos básicos

function App() {
  return (
    // 1. Usar <header> para el encabezado de la página
    <header className="page-header">
      <h1>Mi Aplicación Semántica</h1>
      {/* 2. Usar <nav> para la navegación principal */}
      <nav aria-label="Navegación principal del sitio">
        <ul>
          <li><a href="#home">Inicio</a></li>
          <li><a href="#about">Acerca de</a></li>
          <li><a href="#contact">Contacto</a></li>
        </ul>
      </nav>
    </header>

    // 3. Usar <main> para el contenido principal de la página
    <main className="page-main">
      <p>Bienvenido al contenido principal de nuestra aplicación.</p>

      {/* 4. Usar <section> para agrupar contenido relacionado */}
      <section aria-labelledby="features-heading">
        <h2 id="features-heading">Características Destacadas</h2>
        <p>Aquí presentamos las funcionalidades clave de nuestra aplicación.</p>

        {/* 5. Usar <article> para contenido independiente y redistribuible */}
        <article className="blog-post" aria-labelledby="post-title-1">
          <h3 id="post-title-1">Primer Artículo del Blog</h3>
          <p>Publicado por: <span className="author">Jane Doe</span></p>
          <p>Fecha: <time dateTime="2023-10-26">26 de Octubre, 2023</time></p>
          <p>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod
            tempor incididunt ut labore et dolore magna aliqua.
          </p>
          {/* 6. Usar <figure> y <figcaption> para imágenes con leyendas */}
          <figure>
            <img src="https://via.placeholder.com/150" alt="Ejemplo de imagen de placeholder" />
            <figcaption>Una imagen ilustrativa del contenido del artículo.</figcaption>
          </figure>
          <p>Continúa la lectura...</p>
        </article>

        <article className="blog-post" aria-labelledby="post-title-2">
          <h3 id="post-title-2">Segundo Artículo Interesante</h3>
          <p>Publicado por: <span className="author">John Smith</span></p>
          <p>Fecha: <time dateTime="2023-10-25">25 de Octubre, 2023</time></p>
          <p>
            Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
            aliquip ex ea commodo consequat.
          </p>
        </article>
      </section>

      {/* 7. Usar <aside> para contenido tangencial o relacionado pero secundario */}
      <aside className="sidebar" aria-label="Información adicional">
        <h3>Artículos Relacionados</h3>
        <ul>
          <li><a href="#related-1">Guía de Accesibilidad</a></li>
          <li><a href="#related-2">Optimización para SEO</a></li>
        </ul>
      </aside>
    </main>

    // 8. Usar <footer> para el pie de página
    <footer className="page-footer">
      <p>&copy; {new Date().getFullYear()} Mi Aplicación Semántica. Todos los derechos reservados.</p>
      <nav aria-label="Enlaces de pie de página">
        <ul>
          <li><a href="#privacy">Política de Privacidad</a></li>
          <li><a href="#terms">Términos de Servicio</a></li>
        </ul>
      </nav>
    </footer>
  );
}

export default App;

// App.css (ejemplo de estilos)
/*
body {
  font-family: Arial, sans-serif;
  line-height: 1.6;
  margin: 0;
  padding: 0;
  background-color: #f4f4f4;
  color: #333;
}

.App {
  max-width: 900px;
  margin: 20px auto;
  background: #fff;
  padding: 20px;
  box-shadow: 0 0 10px rgba(0,0,0,0.1);
  border-radius: 8px;
}

header.page-header {
  background-color: #333;
  color: white;
  padding: 20px 0;
  text-align: center;
  border-radius: 8px 8px 0 0;
}

header.page-header h1 {
  margin: 0;
  font-size: 2.2em;
}

nav ul {
  list-style: none;
  padding: 0;
  margin: 10px 0 0;
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
}

nav li {
  margin: 0 15px;
}

nav a {
  color: white;
  text-decoration: none;
  font-weight: bold;
}

nav a:hover {
  text-decoration: underline;
}

main.page-main {
  padding: 20px;
}

section {
  margin-bottom: 30px;
  padding: 20px;
  border: 1px solid #eee;
  border-radius: 5px;
  background-color: #fcfcfc;
}

section h2 {
  color: #007bff;
  border-bottom: 2px solid #007bff;
  padding-bottom: 10px;
  margin-top: 0;
}

article.blog-post {
  border: 1px dashed #ccc;
  padding: 15px;
  margin-bottom: 20px;
  border-radius: 5px;
  background-color: #fff;
}

article.blog-post h3 {
  color: #28a745;
  margin-top: 0;
}

article.blog-post figure {
  margin: 10px 0;
  text-align: center;
}

article.blog-post figcaption {
  font-style: italic;
  font-size: 0.9em;
  color: #666;
  margin-top: 5px;
}

.author {
  font-weight: bold;
  color: #555;
}

aside.sidebar {
  background-color: #f0f0f0;
  border: 1px solid #ddd;
  padding: 15px;
  border-radius: 5px;
  margin-top: 30px;
}

aside.sidebar h3 {
  color: #6c757d;
  border-bottom: 1px solid #aaa;
  padding-bottom: 5px;
}

aside.sidebar ul {
  list-style: disc;
  padding-left: 20px;
}

aside.sidebar a {
  color: #007bff;
  text-decoration: none;
}

footer.page-footer {
  background-color: #333;
  color: white;
  padding: 20px 0;
  text-align: center;
  font-size: 0.9em;
  border-radius: 0 0 8px 8px;
  margin-top: 20px;
}

footer.page-footer nav {
  margin-top: 10px;
}

footer.page-footer nav a {
  color: #a0c4ff;
}
*/

// Ejemplo incorrecto (abuso de divs sin semántica)
// function BadPage() {
//   return (
//     <div> {/* Esto debería ser <header> */}
//       <h1>My App</h1>
//       <div> {/* Esto debería ser <nav> */}
//         <span>Home</span><span>About</span>
//       </div>
//     </div>
//     <div> {/* Esto debería ser <main> */}
//       <div> {/* Esto debería ser <section> o <article> */}
//         <h2>Content</h2>
//         <p>Some text.</p>
//       </div>
//     </div>
//     <div> {/* Esto debería ser <footer> */}
//       <p>Copyright</p>
//     </div>
//   );
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'React',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Optimización y Buenas Prácticas',
    'topic': 'Accesibilidad y SEO',
    'subtopic': 'Consideraciones de SEO en aplicaciones SPA',
    'definition': '''
Las Single Page Applications (SPAs) en React ofrecen una experiencia de usuario fluida y dinámica, pero históricamente han presentado desafíos para el SEO (Search Engine Optimization). Esto se debe a que los motores de búsqueda (como Google, Bing) solían tener dificultades para rastrear y entender el contenido que se carga dinámicamente con JavaScript, en lugar de estar presente en el HTML inicial.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en que tu aplicación es un blog o una tienda online. Si los motores de búsqueda no pueden "ver" tu contenido o entender su estructura, es muy probable que tu sitio no aparezca en los resultados de búsqueda, o que lo haga con un ranking muy bajo. Esto significa menos tráfico orgánico y, por lo tanto, menos usuarios. Afortunadamente, Google y otros motores de búsqueda han mejorado significativamente su capacidad para rastrear JavaScript, pero aún hay consideraciones importantes:

1.  **Renderizado del lado del servidor (SSR) o Generación de Sitios Estáticos (SSG):** Esta es la solución más robusta para el SEO en SPAs.
    * **SSR (Server-Side Rendering):** El servidor renderiza el componente React a HTML en cada solicitud, y ese HTML completo se envía al navegador. Los motores de búsqueda lo ven directamente. Herramientas como Next.js o Remix facilitan esto.
    * **SSG (Static Site Generation):** Durante el proceso de construcción (build), la aplicación React se renderiza a archivos HTML estáticos pregenerados para cada ruta. Estos archivos se sirven directamente a los usuarios y motores de búsqueda. También lo facilitan Next.js, Gatsby o Astro.
    Estos enfoques aseguran que los rastreadores de motores de búsqueda obtengan contenido HTML completo y procesado en su primera pasada.

2.  **Manejo de metadatos (meta tags):** Es crucial que cada página o ruta de tu SPA tenga sus propios `<title>`, `<meta name="description">`, `<meta property="og:title">` (para Open Graph en redes sociales), etc. Herramientas como `React Helmet` (o `react-helmet-async`) te permiten gestionar estas etiquetas en el `head` del documento dinámicamente desde tus componentes.

3.  **URLs limpias y amigables:** Asegúrate de usar URLs que sean descriptivas y legibles para humanos y motores de búsqueda (ej. `/productos/camisa-azul` en lugar de `/p?id=123`). React Router gestiona esto bien.

4.  **Sitemaps XML:** Un sitemap ayuda a los motores de búsqueda a descubrir todas las páginas importantes de tu sitio.

5.  **Optimización del rendimiento:** La velocidad de carga de la página es un factor de ranking importante. Técnicas como la carga diferida (`React.lazy` y `Suspense`), la división de código (code splitting) y la optimización de imágenes son vitales para mejorar la velocidad.

Aunque las SPAs ofrecen una gran UX, requieren un enfoque consciente en el SEO para asegurar que tu contenido sea descubrible. Ignorar estos aspectos puede significar que tu brillante aplicación React permanezca oculta en los resultados de búsqueda.
''',
    'code_example': r'''
// No hay un "código ejecutable" directo para demostrar SSR/SSG en un entorno de React puro,
// ya que estas son características de frameworks como Next.js, Remix, Gatsby.
// Sin embargo, podemos ilustrar cómo gestionar meta tags con React Helmet.

// Para usar React Helmet (o react-helmet-async para React 18 Concurrent Mode)
// npm install react-helmet-async (preferible para React 18+)

// --- Componentes (simulados para el ejemplo) ---

// components/HomePage.js
import React from 'react';
import { Helmet } from 'react-helmet-async'; // Importar Helmet

function HomePage() {
  return (
    <>
      <Helmet>
        <title>Mi Sitio | Inicio</title>
        <meta name="description" content="Página principal de mi increíble aplicación React. Descubre nuestros servicios." />
        <link rel="canonical" href="https://www.misitio.com/" />
        {/* Open Graph para redes sociales */}
        <meta property="og:title" content="Mi Sitio Web Principal" />
        <meta property="og:description" content="Bienvenido a la página de inicio." />
        <meta property="og:type" content="website" />
        <meta property="og:url" content="https://www.misitio.com/" />
        <meta property="og:image" content="https://www.misitio.com/images/home-banner.jpg" />
      </Helmet>
      <div>
        <h2>Bienvenido a la Página de Inicio</h2>
        <p>Este es el contenido de tu página principal.</p>
      </div>
    </>
  );
}
export default HomePage;

// components/ProductPage.js
import React from 'react';
import { Helmet } from 'react-helmet-async';

function ProductPage({ productId }) {
  // Simulación de datos del producto
  const product = {
    1: { name: 'Camisa Azul', description: 'Una camisa de algodón de alta calidad.', price: '$25' },
    2: { name: 'Pantalón Negro', description: 'Pantalones cómodos y duraderos.', price: '$40' },
  }[productId];

  if (!product) {
    return (
      <>
        <Helmet><title>Producto no encontrado</title></Helmet>
        <h3>Producto no encontrado</h3>
      </>
    );
  }

  return (
    <>
      <Helmet>
        <title>Producto: {product.name} | Mi Tienda</title>
        <meta name="description" content={`Comprar ${product.name}: ${product.description}`} />
        <link rel="canonical" href={`https://www.misitio.com/productos/${productId}`} />
        <meta property="og:title" content={product.name} />
        <meta property="og:description" content={product.description} />
        <meta property="og:type" content="product" />
        <meta property="og:url" content={`https://www.misitio.com/productos/${productId}`} />
        {/* Asume que tienes una imagen específica para cada producto */}
        <meta property="og:image" content={`https://www.misitio.com/images/product-${productId}.jpg`} />
      </Helmet>
      <div>
        <h2>{product.name}</h2>
        <p>{product.description}</p>
        <p>Precio: {product.price}</p>
      </div>
    </>
  );
}
export default ProductPage;


// App.js (La aplicación principal con rutas)
import React from 'react';
import { BrowserRouter as Router, Routes, Route, Link } from 'react-router-dom';
import { HelmetProvider } from 'react-helmet-async'; // Importar HelmetProvider
import HomePage from './HomePage';
import ProductPage from './ProductPage';
import './App.css';

function App() {
  return (
    // 1. Envolver toda tu aplicación con HelmetProvider
    <HelmetProvider>
      <Router>
        <nav>
          <Link to="/">Inicio</Link> |{' '}
          <Link to="/productos/1">Producto 1</Link> |{' '}
          <Link to="/productos/2">Producto 2</Link> |{' '}
          <Link to="/productos/3">Producto 3 (No existe)</Link>
        </nav>
        <div className="content-area">
          <Routes>
            <Route path="/" element={<HomePage />} />
            <Route path="/productos/:productId" element={<ProductPage />} />
            <Route path="*" element={
              <>
                <Helmet><title>Página no encontrada</title></Helmet>
                <h3>404: Página no encontrada</h3>
              </>
            } />
          </Routes>
        </div>
      </Router>
    </HelmetProvider>
  );
}

export default App;

// App.css (ejemplo de estilos)
/*
body {
  font-family: Arial, sans-serif;
  margin: 0;
  padding: 0;
  background-color: #f4f4f4;
  color: #333;
}

.App {
  text-align: center;
  max-width: 900px;
  margin: 20px auto;
  background-color: #fff;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 4px 15px rgba(0,0,0,0.1);
}

nav {
  margin-bottom: 20px;
  padding: 15px;
  background-color: #e9ecef;
  border-radius: 8px;
}

nav a {
  margin: 0 10px;
  text-decoration: none;
  color: #007bff;
  font-weight: bold;
}

nav a:hover {
  text-decoration: underline;
}

.content-area {
  padding: 20px;
  border: 1px solid #ddd;
  border-radius: 8px;
  background-color: #fcfcfc;
  min-height: 200px;
}

h2 {
  color: #333;
}

p {
  color: #555;
}
*/

// Para probar:
// 1. Inicia tu aplicación React en modo desarrollo.
// 2. Abre las herramientas de desarrollo del navegador.
// 3. Ve a la pestaña "Elements" y examina la sección `<head>`.
// 4. Navega entre las diferentes rutas (Inicio, Producto 1, Producto 2, Producto 3).
// Observa cómo las etiquetas `<title>` y `<meta name="description">` cambian dinámicamente en el `<head>`.

// Ejemplo incorrecto (no usar React Helmet o soluciones similares para meta tags)
// function MissingMetaComponent() {
//   return (
//     <div>
//       <h2>Esta página no tiene meta tags dinámicos</h2>
//       <p>El título del navegador y la descripción para SEO no cambiarán.</p>
//     </div>
//   );
// }

// Ejemplo conceptual incorrecto (confiar solo en JavaScript para SEO en SPAs)
// Si tu SPA no usa SSR/SSG y solo confías en que Google ejecute tu JavaScript para indexar el contenido,
// te arriesgas a que Google no rastree todo tu contenido, o que lo haga con un retraso significativo.
// Especialmente otros motores de búsqueda menos avanzados podrían tener muchos problemas.
'''
  });
}
