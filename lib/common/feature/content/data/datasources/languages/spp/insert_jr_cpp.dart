import 'package:sqflite_common/sqlite_api.dart';

Future<void> insertJrLevel1DataCpp(Database db) async {
  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 1,
    'tittle_level': 'Fundamentos del Lenguaje y Entorno',
    'topic': 'Introducción a C++',
    'subtopic': '¿Qué es C++?',
    'definition': '''
C++ es un lenguaje de programación multiparadigma que se ha consolidado como una herramienta potente y flexible en el mundo del desarrollo de software. Nos permite crear una gran variedad de aplicaciones, desde sistemas operativos hasta videojuegos complejos.

¿Cómo un solo lenguaje puede hacer tanto?

Pues bien, a grandes rasgos, C++ te da un control muy cercano al hardware, lo que lo hace super eficiente y rápido. Pensemos por un momento en que C++ es como la navaja suiza de los lenguajes de programación. Lo puedes usar para casi todo. Su potencia radica en que combina características de la programación orientada a objetos, la programación genérica y la programación estructurada. Esto significa que puedes elegir el estilo de programación que mejor se adapte a tu proyecto, o incluso combinarlos para lograr soluciones más robustas y eficientes. Es el lenguaje detrás de gigantes como Adobe, Google y Microsoft, y ha sido la base para desarrollar sistemas operativos como Windows y macOS, así como navegadores web y videojuegos de alto rendimiento. En esencia, si buscas velocidad, control y flexibilidad, C++ es tu aliado.
''',
    'code_example': '''
// Un ejemplo sencillo de C++:
#include <iostream> // Incluye la librería de entrada/salida

int main() { // Función principal donde empieza la ejecución del programa
    std::cout << "¡Hola, mundo desde C++!"; // Imprime un mensaje en la consola
    return 0; // Indica que el programa terminó correctamente
}

/*
Este no es un ejemplo incorrecto per se, pero a veces los principiantes olvidan incluir la librería iostream
o no usan el 'std::' namespace, lo que puede causar errores de compilación.
*/

// Ejemplo incorrecto (o incompleto para fines demostrativos):
// int main() {
//    cout << "¡Hola, mundo!"; // Error: 'cout' no declarado sin #include <iostream> o using namespace std;
//    return 0;
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 1,
    'tittle_level': 'Fundamentos del Lenguaje y Entorno',
    'topic': 'Introducción a C++',
    'subtopic': 'Historia y evolución del lenguaje',
    'definition': '''
La historia de C++ es fascinante y nos ayuda a entender por qué es tan relevante hoy en día. Nació de la mano de Bjarne Stroustrup en los laboratorios Bell, a principios de los años 80. Su idea original era mejorar el lenguaje C, añadiéndole características de programación orientada a objetos.

Al principio, C++ ni siquiera se llamaba así. Se le conocía como "C con Clases". ¿Interesante, verdad?

Imagina la evolución: desde un simple conjunto de mejoras a C, se convirtió en un lenguaje con su propia identidad, ganando tracción y adoptando el nombre C++ en 1983. El "++" viene del operador de incremento en C, que simboliza la evolución y la adición de nuevas funcionalidades. A lo largo de los años, ha pasado por varias estandarizaciones importantes, como C++98, C++03, C++11, C++14, C++17, C++20 y ahora C++23. Cada una de estas versiones ha introducido nuevas características, mejoras de rendimiento y herramientas que facilitan la vida de los desarrolladores. Esta constante evolución es una de las razones por las que C++ sigue siendo una opción popular y poderosa en el desarrollo de software moderno.
''',
    'code_example': '''
// En este subtema no aplica un ejemplo de código funcional,
// ya que se trata de la historia y evolución del lenguaje.
// Sin embargo, podemos simular un pequeño "timeline" en comentarios:

/*
1979: Bjarne Stroustrup empieza a trabajar en "C con Clases".
1983: El lenguaje es renombrado a C++.
1998: Primera estandarización ISO (C++98).
2003: Revisión menor (C++03).
2011: Gran actualización con C++11 (auto, lambdas, smart pointers, etc.).
2014: C++14 (pequeñas mejoras).
2017: C++17 (más mejoras, como std::optional, std::variant).
2020: C++20 (módulos, corrutinas, conceptos, rangos).
2023: C++23 (nuevas características).
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 1,
    'tittle_level': 'Fundamentos del Lenguaje y Entorno',
    'topic': 'Introducción a C++',
    'subtopic': 'Diferencias entre C y C++',
    'definition': '''
Aunque C++ surgió de C, no son lo mismo. Son como hermanos, pero con personalidades distintas. C es un lenguaje más antiguo, procedural y directo, mientras que C++ añadió un montón de funcionalidades, especialmente la programación orientada a objetos.

¿Te estás preguntando por qué esto importa?

Pues entender las diferencias es clave para saber cuándo usar cada uno y qué esperar de ellos. Mientras C se enfoca en funciones y manipulación de memoria a bajo nivel, C++ expande esto con clases, objetos y otras abstracciones que nos ayudan a escribir código más organizado y reutilizable.

La principal diferencia radica en que C++ es un lenguaje multiparadigma. Esto significa que, además de la programación estructurada que C ya ofrecía, C++ incorpora la programación orientada a objetos (POO) y la programación genérica a través de plantillas (templates). En C, todo gira en torno a funciones y estructuras de datos. En C++, aunque puedes seguir ese estilo, tienes la opción de definir clases que encapsulan datos y funciones en un solo lugar, lo que facilita el diseño de software complejo y su mantenimiento. También, C++ introduce los punteros inteligentes, que ayudan a manejar la memoria de forma más segura, reduciendo las fugas de memoria que son comunes en C si no se tiene cuidado. Además, C++ tiene la Standard Template Library (STL), una colección de contenedores, algoritmos e iteradores que simplifican muchas tareas comunes de programación.
''',
    'code_example': '''
// Ejemplo en C (estilo procedural)
#include <stdio.h> // Librería de entrada/salida para C

typedef struct { // Definición de una estructura en C
    char nombre[50];
    int edad;
} PersonaC;

void saludarC(PersonaC p) {
    printf("Hola, soy %s y tengo %d años.\\n", p.nombre, p.edad);
}

// int main() {
//     PersonaC persona1 = {"Ana", 30};
//     saludarC(persona1);
//     return 0;
// }

// Ejemplo en C++ (estilo orientado a objetos)
#include <iostream> // Librería de entrada/salida para C++
#include <string>   // Para usar std::string

class PersonaCPP { // Definición de una clase en C++
public:
    std::string nombre;
    int edad;

    // Constructor
    PersonaCPP(std::string nom, int ed) : nombre(nom), edad(ed) {}

    void saludar() {
        std::cout << "Hola, soy " << nombre << " y tengo " << edad << " años." << std::endl;
    }
};

// int main() {
//     PersonaCPP persona2("Luis", 25);
//     persona2.saludar();
//     return 0;
// }

/*
Comentario: Observa cómo en C++ usamos 'class' para agrupar datos y funciones,
y 'std::string' para manejar cadenas de texto de forma más sencilla que los 'char arrays' de C.
Además, 'std::cout' es el equivalente de 'printf' en C++ para imprimir en consola.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 1,
    'tittle_level': 'Fundamentos del Lenguaje y Entorno',
    'topic': 'Introducción a C++',
    'subtopic': 'Aplicaciones comunes de C++',
    'definition': '''
C++ es un lenguaje superversátil, lo que significa que lo vas a encontrar en muchísimos lugares, desde los rincones más profundos de tu sistema operativo hasta los videojuegos que te quitan el sueño.

No sé tú, pero a mí esto al principio me costó entender la magnitud de su alcance. Su eficiencia y capacidad de control a bajo nivel lo hacen ideal para escenarios donde el rendimiento es crítico.

Pensemos por un momento en las aplicaciones prácticas. ¿Dónde lo ves aplicado?

Por ejemplo, en el desarrollo de sistemas operativos, C++ es fundamental para partes del kernel, controladores de dispositivos y sistemas de archivos. Gracias a su velocidad, es el lenguaje por excelencia para crear motores de videojuegos como Unreal Engine o Unity (aunque este último usa C# para scripts, su motor base es C++). También lo encontramos en el desarrollo de navegadores web como Chrome y Firefox, donde el rendimiento es clave para una experiencia de usuario fluida. Además, es muy usado en software de alto rendimiento, como simulaciones científicas, herramientas de diseño asistido por computadora (CAD) y software financiero donde cada milisegundo cuenta. Incluso en inteligencia artificial y machine learning, C++ se utiliza para optimizar algoritmos y bibliotecas que requieren una ejecución ultrarrápida. La flexibilidad de C++ para interactuar directamente con el hardware y su capacidad para manejar grandes volúmenes de datos lo convierten en una opción poderosa para soluciones empresariales y sistemas embebidos.
''',
    'code_example': '''
// Aunque este subtema no se presta a un ejemplo de código directo,
// podemos ilustrar la idea de "aplicación" con un comentario sobre un hipotético escenario:

/*
// Imaginemos un fragmento de código de un motor de videojuegos (pseudocódigo C++):
class GameObject {
public:
    virtual void update(float deltaTime) = 0; // Actualiza el estado del objeto en cada frame
    virtual void render() = 0;              // Dibuja el objeto en pantalla
    // ... más lógica para manejo de físicas, colisiones, etc.
};

class Player : public GameObject {
    // Implementación específica para el jugador
};

class Enemy : public GameObject {
    // Implementación específica para un enemigo
};

// En el bucle principal del juego:
// for (GameObject* obj : allGameObjects) {
//     obj->update(deltaTime);
//     obj->render();
// }

// Este tipo de estructura es común en aplicaciones de alto rendimiento
// como los motores de videojuegos, donde C++ brilla por su capacidad de
// abstracción y control.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 1,
    'tittle_level': 'Fundamentos del Lenguaje y Entorno',
    'topic': 'Configuración del Entorno de Desarrollo',
    'subtopic': 'Instalación de compiladores (GCC, Clang, MSVC)',
    'definition': '''
Para poder escribir y ejecutar código C++, necesitas un compilador. Piensa en el compilador como un traductor: toma el código que tú escribes (que está en un lenguaje que entendemos los humanos) y lo convierte en instrucciones que la computadora puede entender y ejecutar.

¿Sabías que existen diferentes compiladores para C++?

Los más populares son GCC (GNU Compiler Collection), Clang y MSVC (Microsoft Visual C++). Cada uno tiene sus particularidades, pero todos cumplen la misma función principal. Para usuarios de Windows, si usas Visual Studio, MSVC ya viene incluido. Si prefieres una opción más ligera o multiplataforma, MinGW (que incluye GCC para Windows) o Clang son excelentes opciones. En sistemas Linux, GCC y Clang suelen venir preinstalados o son fáciles de instalar desde los gestores de paquetes. La instalación es generalmente sencilla: descargas el paquete adecuado para tu sistema operativo y sigues las instrucciones. Es un paso fundamental, porque sin un compilador, tu código C++ se queda solo en un texto bonito.
''',
    'code_example': '''
// Este subtema no tiene un ejemplo de código C++ ejecutable,
// ya que se enfoca en la instalación de herramientas.
// Sin embargo, podemos simular la verificación de una instalación
// de compilador en la línea de comandos.

/*
// Para verificar la instalación de GCC en la terminal:
// gcc --version
// clang --version
// cl /? (para MSVC en el Símbolo del Sistema o PowerShell de Windows)

// Ejemplo de lo que verías (varía según la versión):
// gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
// Copyright (C) 2021 Free Software Foundation, Inc.
// This is free software; see the source for copying conditions.  There is NO
// warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

// Comentario: Si ves una salida similar, ¡felicidades, tu compilador está listo!
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 1,
    'tittle_level': 'Fundamentos del Lenguaje y Entorno',
    'topic': 'Configuración del Entorno de Desarrollo',
    'subtopic':
        'Elección de editores e IDEs (VSCode, Code::Blocks, Visual Studio)',
    'definition': '''
Una vez que tienes un compilador, el siguiente paso es elegir dónde vas a escribir tu código. Aquí es donde entran los editores de texto y los entornos de desarrollo integrados (IDEs). Un editor de texto es como un bloc de notas glorificado, diseñado específicamente para escribir código, con características como resaltado de sintaxis y autocompletado básico. Un IDE es un paquete mucho más completo.

¿Te preguntas cuál elegir?

Pues bien, la elección entre un editor y un IDE, o entre diferentes opciones dentro de cada categoría, depende mucho de tu estilo de trabajo y del tipo de proyecto. Para empezar, Visual Studio Code (VSCode) es una opción muy popular y gratuita, que se puede extender con miles de extensiones para C++, lo que lo convierte en un pseudo-IDE muy potente. Code::Blocks es otro IDE ligero y de código abierto, ideal para principiantes por su facilidad de uso. Si trabajas en Windows y necesitas una solución robusta para proyectos grandes, Visual Studio de Microsoft es el IDE más completo y ofrece una integración perfecta con el ecosistema de desarrollo de Microsoft. IDEs como CLion (de JetBrains, de pago) son muy valorados por sus herramientas avanzadas de depuración y análisis de código. La clave es probar y ver con cuál te sientes más cómodo y productivo.
''',
    'code_example': '''
// Este subtema no tiene un ejemplo de código C++ ejecutable,
// ya que se enfoca en la elección de herramientas.
// Aquí te dejo un comentario que simula un "consejo" en un IDE:

/*
// En VSCode, después de instalar la extensión de C/C++,
// puedes configurar el "tasks.json" y "launch.json"
// para compilar y depurar directamente desde el editor.

// Ejemplo de un snippet en VSCode para un nuevo archivo C++:
// #include <iostream>
//
// int main() {
//     // Coloca tu código aquí.
//     // El IDE te ayudará con el autocompletado y la detección de errores.
//     return 0;
// }

// Comentario: La mayoría de los IDEs modernos ofrecen plantillas
// y asistentes para crear proyectos rápidamente.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 1,
    'tittle_level': 'Fundamentos del Lenguaje y Entorno',
    'topic': 'Configuración del Entorno de Desarrollo',
    'subtopic': 'Primer programa: "Hola Mundo"',
    'definition': '''
Todo programador, sin importar el lenguaje, empieza con el famoso "Hola Mundo". Es una tradición, casi un rito de iniciación. Este pequeño programa es la prueba definitiva de que tu entorno de desarrollo está configurado correctamente y listo para funcionar.

¿Listo para escribir tu primer "Hola Mundo" en C++?

Es bastante sencillo. El programa simplemente imprime el mensaje "¡Hola, mundo!" en la consola. Esto nos asegura que el compilador puede procesar tu código, y que el programa se puede ejecutar sin problemas. Es un hito importante porque, si esto funciona, significa que la base está sólida para empezar a construir cosas más complejas. Este es el equivalente digital a decir "¡Estoy aquí!" en el mundo de la programación.
''',
    'code_example': r'''
// Primer programa en C++: "Hola Mundo"
#include <iostream> // Necesario para usar 'std::cout'

int main() { // La función principal donde empieza la ejecución del programa
    // std::cout es el objeto que usamos para imprimir en la consola
    // El operador << se usa para "insertar" el texto en la salida
    // std::endl inserta un salto de línea y vacía el búfer de salida
    std::cout << "¡Hola, mundo desde C++!" << std::endl;
    return 0; // Indica que el programa ha terminado correctamente (0 significa sin errores)
}

/*
// Ejemplo de un error común o una alternativa:
// Si olvidas el '#include <iostream>', el compilador no sabrá qué es 'std::cout'.
// int main() {
//    std::cout << "¡Hola, mundo!"; // Error de compilación: 'std::cout' no fue declarado.
//    return 0;
// }

// También puedes usar 'using namespace std;' para evitar escribir 'std::' cada vez,
// pero es una práctica que se desaconseja en proyectos grandes para evitar colisiones de nombres.
// #include <iostream>
// using namespace std; // Evitar en archivos .h o con mucho código
// int main() {
//     cout << "¡Hola, mundo!";
//     return 0;
// }
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 1,
    'tittle_level': 'Fundamentos del Lenguaje y Entorno',
    'topic': 'Configuración del Entorno de Desarrollo',
    'subtopic': 'Compilación y ejecución desde la línea de comandos',
    'definition': '''
Aunque los IDEs facilitan mucho la vida, entender cómo compilar y ejecutar tu código C++ desde la línea de comandos es una habilidad fundamental. Te da una comprensión más profunda de lo que sucede "detrás de cámaras" y es esencial para automatizar procesos o trabajar en entornos sin interfaz gráfica.

¿Te preguntas cómo se hace esto sin un IDE?

El proceso se divide en dos fases principales: compilación y ejecución. Primero, usas el compilador (como g++ para GCC o cl para MSVC) para transformar tu archivo `.cpp` en un archivo ejecutable. Esto genera un archivo con extensión `.exe` en Windows o sin extensión (o `.out`) en Linux/macOS. Una vez que tienes el ejecutable, simplemente lo invocas desde la línea de comandos para que tu programa se ponga en marcha. Es una forma directa y potente de interactuar con tus programas, especialmente útil cuando depuras o integras tu código en sistemas más grandes.
''',
    'code_example': '''
// Suponiendo que tienes un archivo llamado 'hola.cpp' con el código de "Hola Mundo":
/*
#include <iostream>

int main() {
    std::cout << "¡Hola, mundo desde la línea de comandos!" << std::endl;
    return 0;
}
*/

// Pasos para compilar y ejecutar en la terminal (usando GCC/G++):

// 1. Compilar:
// g++ hola.cpp -o mi_programa
// (Esto creará un archivo ejecutable llamado 'mi_programa'.)

// 2. Ejecutar:
// ./mi_programa
// (En Windows, simplemente 'mi_programa.exe' o 'mi_programa')

/*
// Ejemplo de un comando incorrecto o con errores:
// g++ -o mi_programa   // Error: falta el archivo de origen '.cpp'

// g++ hola.cpp -o mi_programa -std=c++98 // Esto es correcto, pero fuerza un estándar específico.
// Un error común es escribir mal el nombre del archivo o del compilador.
// Siempre verifica que estés en la misma carpeta donde se encuentra tu archivo '.cpp'.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 1,
    'tittle_level': 'Fundamentos del Lenguaje y Entorno',
    'topic': 'Herramientas de Desarrollo',
    'subtopic': 'Uso de la terminal y comandos básicos',
    'definition': '''
La terminal, también conocida como línea de comandos o consola, es una de las herramientas más poderosas y subestimadas para cualquier desarrollador. Aunque al principio pueda parecer un poco intimidante, dominarla te da un control inmenso sobre tu sistema y tus proyectos.

¿Por qué es importante dominar la terminal?

Pensemos por un momento en ella como una interfaz de texto que te permite interactuar directamente con el sistema operativo sin necesidad de clicks y ventanas. Puedes navegar por directorios, crear y eliminar archivos, ejecutar programas y automatizar tareas con solo escribir comandos. Algunos comandos básicos incluyen `cd` (cambiar de directorio), `ls` (listar contenido de un directorio en Linux/macOS) o `dir` (en Windows), `mkdir` (crear directorio), `rm` (eliminar archivos) o `del` (en Windows), y `cp` (copiar) o `copy` (en Windows). Conocer estos comandos te da una agidez que no siempre obtienes con una interfaz gráfica, y es el pan de cada día para trabajar con servidores o en entornos de desarrollo profesional.
''',
    'code_example': '''
// Este subtema no tiene un ejemplo de código C++ ejecutable,
// pero sí comandos que se usarían en la terminal.

/*
// Ejemplos de comandos básicos en la terminal (Linux/macOS):

// 1. Navegar a un directorio:
// cd /home/usuario/proyectos/mi_proyecto

// 2. Listar archivos y directorios:
// ls -l

// 3. Crear un nuevo directorio:
// mkdir nueva_carpeta

// 4. Eliminar un archivo:
// rm mi_archivo.txt

// 5. Compilar un programa C++ (asumiendo g++ instalado):
// g++ main.cpp -o mi_programa

// 6. Ejecutar el programa:
// ./mi_programa

// Comentario: Los comandos varían ligeramente entre sistemas operativos.
// En Windows, podrías usar 'dir' en lugar de 'ls' y 'copy' en lugar de 'cp'.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 1,
    'tittle_level': 'Fundamentos del Lenguaje y Entorno',
    'topic': 'Herramientas de Desarrollo',
    'subtopic': 'Sistemas de control de versiones (introducción a Git)',
    'definition': '''
Imagínate que estás trabajando en un proyecto con un equipo y cada uno hace cambios en el mismo código. O quizás estás solo, pero quieres guardar diferentes versiones de tu proyecto y poder volver atrás si algo sale mal. Aquí es donde entran los sistemas de control de versiones, y Git es el rey indiscutible.

¿Te preguntas qué es Git y por qué es tan importante?

Git es una herramienta que te permite rastrear los cambios en tu código a lo largo del tiempo. Es como tener un "historial de versiones" de tu proyecto, donde cada vez que haces un cambio significativo, puedes "guardar" ese estado (llamado "commit"). Si en algún momento introduces un error o quieres volver a una versión anterior, Git te lo permite sin dramas. Además, es esencial para el trabajo en equipo, ya que facilita que múltiples desarrolladores trabajen en el mismo proyecto sin sobrescribir los cambios de los demás, permitiendo fusionar (merge) el trabajo de todos de forma organizada. Empresas de todos los tamaños, desde startups hasta gigantes tecnológicos, lo utilizan para gestionar sus proyectos de software.
''',
    'code_example': '''
// Este subtema introduce un concepto, no un código C++ ejecutable.
// Aquí se muestran comandos básicos de Git que usarías en la terminal.

/*
// 1. Inicializar un repositorio Git en tu proyecto:
// git init

// 2. Añadir archivos a la "zona de preparación" (staging area):
// git add . // Añade todos los cambios en el directorio actual

// 3. Confirmar los cambios (crear un "commit"):
// git commit -m "Mi primer commit: Agregué el programa Hola Mundo"

// 4. Ver el historial de commits:
// git log

// 5. Clonar un repositorio existente (por ejemplo, desde GitHub):
// git clone https://github.com/usuario/mi_repositorio.git

// Comentario: Estos son solo los comandos más básicos.
// Git tiene muchísimas funcionalidades para trabajar en equipo,
// como ramas ('git branch'), fusión ('git merge'), etc.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 1,
    'tittle_level': 'Fundamentos del Lenguaje y Entorno',
    'topic': 'Herramientas de Desarrollo',
    'subtopic': 'Depuración básica y uso de breakpoints',
    'definition': '''
En el mundo real, los programas rara vez funcionan perfectamente a la primera. Es normal cometer errores, conocidos como "bugs". Para encontrar y corregir estos problemas, usamos una herramienta llamada depurador (debugger). La depuración es el proceso de ejecutar tu programa paso a paso, examinando el valor de las variables y el flujo de ejecución para identificar dónde algo no va como esperas.

¿Te estás preguntando cómo funciona la depuración?

Uno de los conceptos clave en la depuración es el "breakpoint". Un breakpoint es un punto que colocas en tu código para decirle al depurador que detenga la ejecución del programa justo antes de esa línea. Esto te permite "pausar" el programa en un momento específico y luego inspeccionar el estado de las variables, ver qué funciones se están llamando y cómo se está comportando el código. Es como tener una lupa sobre tu programa mientras se ejecuta, lo que te permite entender por qué algo falla o se comporta de manera inesperada. Herramientas como GDB (GNU Debugger) o los depuradores integrados en IDEs como Visual Studio o VSCode hacen esta tarea mucho más sencilla.
''',
    'code_example': r'''
// Ejemplo de código C++ para depurar
#include <iostream>

int main() {
    int a = 5;
    int b = 10;
    int suma = 0; // Aquí podríamos poner un breakpoint

    suma = a + b; // Aquí se sumarán los valores

    std::cout << "La suma es: " << suma << std::endl; // Otro breakpoint aquí para ver el resultado
    
    // Un error común que podríamos querer depurar:
    // int division = a / 0; // Esto causaría un error de división por cero en tiempo de ejecución.
                           // Un depurador nos mostraría dónde ocurre.

    return 0;
}

/*
// Cómo usar breakpoints en un IDE (ej. VSCode):
// 1. Abre el archivo .cpp en tu editor/IDE.
// 2. Haz clic en el margen izquierdo de la línea donde quieres pausar (ej. la línea 'suma = a + b;').
//    Aparecerá un punto rojo, indicando el breakpoint.
// 3. Inicia el programa en modo depuración (usualmente con F5 o un botón de "Run and Debug").
// 4. El programa se detendrá en el breakpoint. Podrás inspeccionar 'a', 'b', 'suma'.
// 5. Usa los botones de "Paso a paso" (step over, step into, step out)
//    para avanzar línea por línea y observar cómo cambian las variables.

// Comentario: Los depuradores son herramientas invaluables para entender
// el flujo de tu programa y encontrar la causa raíz de los errores.
*/
'''
  });
}

Future<void> insertJrLevel2DataCpp(Database db) async {
  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 2,
    'tittle_level': 'Tipos de Datos, Variables y Operadores',
    'topic': 'Tipos de Datos y Variables',
    'subtopic': 'Tipos de datos primitivos (int, float, char, bool)',
    'definition': '''
Cuando escribes programas, necesitas una forma de almacenar información. Aquí es donde entran en juego los tipos de datos primitivos. Son como las piezas LEGO básicas con las que construyes todo lo demás en C++. Cada tipo de dato tiene un propósito específico y puede almacenar un rango particular de valores.

¿Sabes cuáles son los tipos de datos más fundamentales en C++?

En C++, los tipos de datos primitivos más comunes son:
* `int`: Se usa para números enteros, como 5, -100 o 0. Piensa en ellos como números sin decimales.
* `float` y `double`: Ambos son para números con decimales. `float` es para números de punto flotante de precisión simple, y `double` es para precisión doble, lo que significa que puede almacenar números con más decimales y un rango más amplio. `double` es generalmente el preferido por su mayor precisión.
* `char`: Sirve para almacenar un solo carácter, como 'A', 'z', '5' o '#'. Se representa con comillas simples.
* `bool`: Este es muy sencillo, solo puede tener dos valores: `true` (verdadero) o `false` (falso). Es perfecto para decisiones lógicas.

Entender estos tipos es el primer paso para poder manipular información en tus programas.
''',
    'code_example': r'''
#include <iostream> // Para imprimir en consola

int main() {
    // Declaración e inicialización de variables con tipos primitivos
    int edad = 30;              // Un número entero
    float precio = 19.99f;      // Un número con decimales (la 'f' es importante para float)
    double pi = 3.1415926535;   // Un número con más precisión decimal
    char inicial = 'J';         // Un solo carácter
    bool esMayor = true;        // Un valor booleano (verdadero/falso)

    std::cout << "Edad: " << edad << std::endl;
    std::cout << "Precio: " << precio << std::endl;
    std::cout << "Pi: " << pi << std::endl;
    std::cout << "Inicial: " << inicial << std::endl;
    std::cout << "Es mayor: " << esMayor << std::endl; // true se imprime como 1, false como 0

    // Un error común: asignar un tipo incorrecto
    // int numero_grande = 3.14; // Advertencia/Error: posible pérdida de datos, 3.14 es float/double

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 2,
    'tittle_level': 'Tipos de Datos, Variables y Operadores',
    'topic': 'Tipos de Datos y Variables',
    'subtopic': 'Declaración e inicialización de variables',
    'definition': '''
Una variable es un nombre simbólico que le das a un espacio en la memoria de la computadora para almacenar un valor. Piensa en una variable como una etiqueta que pones en una caja para saber qué hay dentro. Antes de poder usar una variable, necesitas declararla (decirle al compilador que existe y qué tipo de datos va a guardar) y, preferiblemente, inicializarla (darle un valor inicial).

¿Cómo declaras e inicializas una variable en C++?

La declaración es sencilla: primero el tipo de dato, luego el nombre que le quieres dar a la variable. Por ejemplo, `int miNumero;` le dice a C++ que "miNumero" existirá y guardará un número entero. La inicialización es cuando le asignas un valor por primera vez. Puedes hacerlo en la misma línea de la declaración (`int miNumero = 10;`) o después (`miNumero = 20;`). Inicializar tus variables es una buena práctica porque si no lo haces, la variable podría contener lo que se conoce como "valor basura" (lo que sea que estuviera en esa posición de memoria antes), y eso puede llevar a errores difíciles de encontrar. Es como poner una etiqueta en una caja y asegurarte de que ya tiene algo útil dentro.
''',
    'code_example': r'''
#include <iostream>

int main() {
    // Declaración de una variable sin inicialización
    int numeroEntero; // Contendrá un "valor basura" si no se inicializa

    // Inicialización después de la declaración
    numeroEntero = 100;
    std::cout << "Numero entero (inicializado después): " << numeroEntero << std::endl;

    // Declaración e inicialización en la misma línea (la forma más común)
    double precioProducto = 25.50;
    char letraInicial = 'A';
    bool estaActivo = true;

    std::cout << "Precio del producto: " << precioProducto << std::endl;
    std::cout << "Letra inicial: " << letraInicial << std::endl;
    std::cout << "Está activo: " << estaActivo << std::endl;

    // Declaración e inicialización usando llaves (desde C++11, inicialización uniforme)
    int otraEdad{42};
    std::cout << "Otra edad: " << otraEdad << std::endl;

    // Un ejemplo de lo que no hacer: usar una variable no inicializada
    // int valorNoInicializado;
    // std::cout << "Valor no inicializado (¡cuidado!): " << valorNoInicializado << std::endl;
    // Esto podría imprimir cualquier cosa, ya que 'valorNoInicializado' no tiene un valor predecible.

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 2,
    'tittle_level': 'Tipos de Datos, Variables y Operadores',
    'topic': 'Tipos de Datos y Variables',
    'subtopic': 'Conversión de tipos y casting',
    'definition': '''
A veces, en tu programa, te encontrarás con la necesidad de trabajar con diferentes tipos de datos. Por ejemplo, podrías tener un número entero y necesitar que se comporte como un número con decimales para una operación. Aquí es donde entra la conversión de tipos, también conocida como "casting". Es la forma en que le dices al compilador que trate un dato de un tipo como si fuera de otro.

¿Te preguntas cuándo y cómo se usa la conversión de tipos?

Existen dos tipos principales de conversión: implícita y explícita. La conversión implícita ocurre automáticamente cuando el compilador puede realizar una conversión segura sin perder información (por ejemplo, de un `int` a un `double`). La conversión explícita, o *casting*, es cuando tú, como programador, fuerzas la conversión. Se hace con operadores de casting como `static_cast<TipoDeseado>(variable)` o la sintaxis de estilo C `(TipoDeseado)variable`. Es crucial usar el casting con conocimiento, porque forzar una conversión puede llevar a la pérdida de datos o a comportamientos inesperados si no se hace correctamente, especialmente al convertir de un tipo más grande a uno más pequeño (por ejemplo, de `double` a `int`, donde los decimales se perderán).
''',
    'code_example': r'''
#include <iostream>

int main() {
    // Conversión implícita (automática)
    int entero = 10;
    double decimal = entero; // El entero se convierte automáticamente a double
    std::cout << "Entero a double (implícito): " << decimal << std::endl; // Salida: 10

    // Pérdida de precisión en conversión implícita (de double a int)
    double valorDecimal = 15.75;
    int valorEntero = valorDecimal; // Los decimales se truncan (se pierden)
    std::cout << "Double a int (implícito, truncado): " << valorEntero << std::endl; // Salida: 15

    // Conversión explícita (casting estilo C)
    float numFloat = 12.34f;
    int numEnteroCasted = (int)numFloat; // Forzar la conversión a int
    std::cout << "Float a int (casting estilo C): " << numEnteroCasted << std::endl; // Salida: 12

    // Conversión explícita (casting estático - preferido en C++)
    double numDouble = 20.99;
    int numEnteroStaticCasted = static_cast<int>(numDouble); // El static_cast es más seguro
    std::cout << "Double a int (static_cast): " << numEnteroStaticCasted << std::endl; // Salida: 20

    // Ejemplo de conversión de char a int (se convierte a su valor ASCII)
    char caracter = 'A';
    int valorAscii = static_cast<int>(caracter);
    std::cout << "Carácter 'A' a int (ASCII): " << valorAscii << std::endl; // Salida: 65

    // Un ejemplo de cuándo el casting es útil y potencialmente peligroso:
    // int dividendo = 10;
    // int divisor = 3;
    // double resultadoIncorrecto = dividendo / divisor; // Ambos son int, la división es entera: 3.0
    // double resultadoCorrecto = static_cast<double>(dividendo) / divisor; // Uno se castea a double, la división es float: 3.333...
    // std::cout << "División int/int sin casting: " << resultadoIncorrecto << std::endl;
    // std::cout << "División int/int con casting: " << resultadoCorrecto << std::endl;

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 2,
    'tittle_level': 'Tipos de Datos, Variables y Operadores',
    'topic': 'Operadores',
    'subtopic': 'Operadores aritméticos',
    'definition': '''
Los operadores aritméticos son el pan de cada día cuando necesitas hacer cálculos en tus programas. Son símbolos que te permiten realizar operaciones matemáticas básicas como sumar, restar, multiplicar y dividir. Piensa en ellos como la calculadora integrada en C++.

¿Qué operaciones aritméticas puedes hacer en C++?

Pues, son bastante intuitivas. Tienes el `+` para la suma, `-` para la resta, `*` para la multiplicación y `/` para la división. Además, hay un operador muy útil llamado `%` (módulo), que te da el resto de una división. Es decir, si divides 10 entre 3, el resultado de la división es 3, pero el resto es 1, y ese 1 es lo que te daría el operador módulo. También existen los operadores de incremento (`++`) y decremento (`--`), que aumentan o disminuyen el valor de una variable en uno. Estos son muy comunes en bucles y contadores.
''',
    'code_example': r'''
#include <iostream>

int main() {
    int a = 10;
    int b = 3;

    // Suma
    int suma = a + b; // suma será 13
    std::cout << "Suma: " << suma << std::endl;

    // Resta
    int resta = a - b; // resta será 7
    std::cout << "Resta: " << resta << std::endl;

    // Multiplicación
    int multiplicacion = a * b; // multiplicacion será 30
    std::cout << "Multiplicación: " << multiplicacion << std::endl;

    // División (con enteros, el resultado es entero, se trunca el decimal)
    int division = a / b; // division será 3 (10 / 3 = 3.33, se trunca a 3)
    std::cout << "División (enteros): " << division << std::endl;

    // Módulo (resto de la división)
    int modulo = a % b; // modulo será 1 (10 dividido por 3 es 3 con resto 1)
    std::cout << "Módulo: " << modulo << std::endl;

    // Incremento
    int contador = 5;
    contador++; // contador ahora es 6
    std::cout << "Contador después de incremento: " << contador << std::endl;

    // Decremento
    int valor = 8;
    valor--; // valor ahora es 7
    std::cout << "Valor después de decremento: " << valor << std::endl;

    // Ejemplo de error común: división por cero
    // int cero = 0;
    // int resultadoError = a / cero; // Esto causará un error en tiempo de ejecución
    // std::cout << "Esto causará un error de división por cero: " << resultadoError << std::endl;

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 2,
    'tittle_level': 'Tipos de Datos, Variables y Operadores',
    'topic': 'Operadores',
    'subtopic': 'Operadores de asignación',
    'definition': '''
Los operadores de asignación son clave para darle valores a tus variables. El más básico y que ya conoces es el signo igual (`=`), que se usa para asignar un valor a una variable. Pero C++ nos ofrece atajos muy convenientes para cuando quieres hacer una operación aritmética y luego asignar el resultado a la misma variable.

¿Para qué sirven estos operadores de asignación combinados?

Piensa en ellos como una forma más concisa de escribir ciertas operaciones. Por ejemplo, si quieres sumar 5 a una variable `x` y luego guardar el resultado en `x`, en lugar de escribir `x = x + 5;`, puedes usar el operador de asignación compuesto `+=`, es decir, `x += 5;`. Lo mismo aplica para la resta (`-=`), multiplicación (`*=`), división (`/=`) y módulo (`%=`). Estos operadores no solo hacen tu código más corto y legible, sino que a menudo también son más eficientes porque evitan reescribir la variable dos veces.
''',
    'code_example': r'''
#include <iostream>

int main() {
    int x = 10;
    std::cout << "Valor inicial de x: " << x << std::endl;

    // Asignación simple
    int y = 20; // Asigna el valor 20 a y
    std::cout << "Valor de y: " << y << std::endl;

    // Asignación con suma (x = x + 5;)
    x += 5; // x ahora es 15
    std::cout << "x después de x += 5: " << x << std::endl;

    // Asignación con resta (x = x - 3;)
    x -= 3; // x ahora es 12
    std::cout << "x después de x -= 3: " << x << std::endl;

    // Asignación con multiplicación (x = x * 2;)
    x *= 2; // x ahora es 24
    std::cout << "x después de x *= 2: " << x << std::endl;

    // Asignación con división (x = x / 4;)
    x /= 4; // x ahora es 6
    std::cout << "x después de x /= 4: " << x << std::endl;

    // Asignación con módulo (x = x % 5;)
    x %= 5; // x ahora es 1 (6 dividido por 5 es 1 con resto 1)
    std::cout << "x después de x %= 5: " << x << std::endl;

    // Un error común: confundir '=' con '==' (operador de comparación)
    // if (x = 1) { // Esto asigna 1 a x y la condición siempre es verdadera si x no es 0
    //     std::cout << "Esto es una asignación, no una comparación." << std::endl;
    // }

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 2,
    'tittle_level': 'Tipos de Datos, Variables y Operadores',
    'topic': 'Operadores',
    'subtopic': 'Operadores de comparación',
    'definition': '''
Los operadores de comparación son fundamentales para tomar decisiones en tu código. Te permiten comparar dos valores y el resultado de esa comparación siempre será un valor booleano: `true` (verdadero) o `false` (falso). Imagina que tu programa necesita decidir si un usuario es mayor de edad o si un precio es menor que cierto límite; para eso usas estos operadores.

¿Cómo se usan estos operadores para comparar valores?

Pues tenemos varios para elegir. El más común es el operador de igualdad `==` (doble igual), que verifica si dos valores son iguales. Es importante no confundirlo con el operador de asignación `=`. Luego tenemos `!=` para "no es igual", `<` para "menor que", `>` para "mayor que", `<=` para "menor o igual que" y `>=` para "mayor o igual que". Estos operadores son la base de cualquier lógica condicional y te permiten controlar el flujo de tu programa basándose en si ciertas condiciones se cumplen o no.
''',
    'code_example': r'''
#include <iostream>

int main() {
    int num1 = 10;
    int num2 = 20;
    int num3 = 10;

    // Operador de igualdad (==)
    bool esIgual = (num1 == num3); // true, porque 10 es igual a 10
    std::cout << "num1 == num3: " << esIgual << std::endl; // Imprime 1 (true)

    // Operador de desigualdad (!=)
    bool noEsIgual = (num1 != num2); // true, porque 10 no es igual a 20
    std::cout << "num1 != num2: " << noEsIgual << std::endl; // Imprime 1 (true)

    // Operador menor que (<)
    bool menorQue = (num1 < num2); // true, porque 10 es menor que 20
    std::cout << "num1 < num2: " << menorQue << std::endl; // Imprime 1 (true)

    // Operador mayor que (>)
    bool mayorQue = (num2 > num1); // true, porque 20 es mayor que 10
    std::cout << "num2 > num1: " << mayorQue << std::endl; // Imprime 1 (true)

    // Operador menor o igual que (<=)
    bool menorOIgual = (num1 <= num3); // true, porque 10 es menor o igual que 10
    std::cout << "num1 <= num3: " << menorOIgual << std::endl; // Imprime 1 (true)

    // Operador mayor o igual que (>=)
    bool mayorOIgual = (num2 >= num3); // true, porque 20 es mayor o igual que 10
    std::cout << "num2 >= num3: " << mayorOIgual << std::endl; // Imprime 1 (true)

    // Un error común: usar '=' en lugar de '==' en una comparación
    // if (num1 = num2) { // Esto asigna 20 a num1, y la condición se evalúa a true (20 es distinto de 0)
    //     std::cout << "¡Cuidado! Esto es una asignación, no una comparación." << std::endl;
    // }

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 2,
    'tittle_level': 'Tipos de Datos, Variables y Operadores',
    'topic': 'Operadores',
    'subtopic': 'Operadores lógicos',
    'definition': '''
Mientras que los operadores de comparación te ayudan a evaluar condiciones individuales (por ejemplo, si 'A' es mayor que 'B'), los operadores lógicos te permiten combinar múltiples condiciones para crear expresiones más complejas. Son esenciales cuando necesitas que tu programa tome decisiones basadas en si varias cosas son verdaderas o falsas al mismo tiempo.

¿Cómo se combinan condiciones con operadores lógicos?

Tenemos tres operadores lógicos principales:
* **AND lógico (`&&`):** Este operador es como decir "y". La expresión completa solo será verdadera si *todas* las condiciones que conecta son verdaderas. Si al menos una es falsa, el resultado es falso.
* **OR lógico (`||`):** Este operador es como decir "o". La expresión completa será verdadera si *al menos una* de las condiciones que conecta es verdadera. Solo será falsa si todas las condiciones son falsas.
* **NOT lógico (`!`):** Este es un operador unario (afecta a una sola cosa) que invierte el valor booleano de una condición. Si algo era verdadero, `!` lo convierte en falso, y viceversa.

Estos operadores te dan la flexibilidad para construir lógica condicional robusta en tus programas, permitiendo decisiones sofisticadas.
''',
    'code_example': r'''
#include <iostream>

int main() {
    bool condicion1 = true;
    bool condicion2 = false;
    int edad = 20;
    int limite = 18;

    // Operador AND lógico (&&)
    // true && true -> true
    // true && false -> false
    // false && true -> false
    // false && false -> false
    bool resultadoAND = (condicion1 && (edad >= limite)); // true && true -> true
    std::cout << "condicion1 && (edad >= limite): " << resultadoAND << std::endl; // Imprime 1 (true)

    // Operador OR lógico (||)
    // true || true -> true
    // true || false -> true
    // false || true -> true
    // false || false -> false
    bool resultadoOR = (condicion1 || condicion2); // true || false -> true
    std::cout << "condicion1 || condicion2: " << resultadoOR << std::endl; // Imprime 1 (true)

    // Operador NOT lógico (!)
    // !true -> false
    // !false -> true
    bool resultadoNOT = !condicion1; // !true -> false
    std::cout << "!condicion1: " << resultadoNOT << std::endl; // Imprime 0 (false)

    // Combinación de operadores
    bool combinacion = ( (edad > 20) && (condicion1 || !condicion2) );
    // (false && (true || true)) -> (false && true) -> false
    std::cout << "Combinación compleja: " << combinacion << std::endl; // Imprime 0 (false)

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 2,
    'tittle_level': 'Tipos de Datos, Variables y Operadores',
    'topic': 'Operadores',
    'subtopic': 'Precedencia y asociatividad de operadores',
    'definition': '''
Cuando tienes una expresión compleja con varios operadores, ¿cómo sabe C++ cuál ejecutar primero? Ahí es donde entran en juego la precedencia y la asociatividad de los operadores. Son como las reglas de las operaciones matemáticas (PEMDAS/BODMAS) pero para la programación. Entenderlas es crucial para evitar sorpresas y asegurarse de que tu código haga exactamente lo que esperas.

¿Cómo afectan la precedencia y la asociatividad a tus cálculos?

La **precedencia** define el orden en que se evalúan los operadores. Por ejemplo, la multiplicación y la división tienen mayor precedencia que la suma y la resta. Esto significa que en una expresión como `5 + 3 * 2`, la multiplicación `3 * 2` se hace primero (resultando en 6), y luego se suma 5, dando un total de 11. Si quisieras que la suma se hiciera primero, tendrías que usar paréntesis: `(5 + 3) * 2`.

La **asociatividad** entra en juego cuando tienes dos operadores con la misma precedencia. Define si la operación se evalúa de izquierda a derecha o de derecha a izquierda. Por ejemplo, la mayoría de los operadores aritméticos son asociativos de izquierda a derecha (`10 / 2 * 5` se evalúa como `(10 / 2) * 5`, no `10 / (2 * 5)`). El operador de asignación (`=`) es un ejemplo de asociatividad de derecha a izquierda (`a = b = 5;` asigna 5 a `b` y luego el valor de `b` a `a`). Un buen uso de paréntesis siempre aclara tus intenciones y es una buena práctica para evitar ambigüedades.
''',
    'code_example': r'''
#include <iostream>

int main() {
    int resultado;

    // Ejemplo de precedencia: Multiplicación antes que suma
    // 5 + (3 * 2) = 5 + 6 = 11
    resultado = 5 + 3 * 2;
    std::cout << "5 + 3 * 2 = " << resultado << std::endl; // Salida: 11

    // Usando paréntesis para cambiar la precedencia
    // (5 + 3) * 2 = 8 * 2 = 16
    resultado = (5 + 3) * 2;
    std::cout << "(5 + 3) * 2 = " << resultado << std::endl; // Salida: 16

    // Ejemplo de asociatividad de izquierda a derecha (división y multiplicación)
    // (10 / 2) * 5 = 5 * 5 = 25
    resultado = 10 / 2 * 5;
    std::cout << "10 / 2 * 5 = " << resultado << std::endl; // Salida: 25

    // Ejemplo de asociatividad de derecha a izquierda (asignación)
    int a, b;
    a = b = 25; // b = 25; luego a = b;
    std::cout << "a = " << a << ", b = " << b << std::endl; // Salida: a = 25, b = 25

    // Combinación con operadores lógicos
    bool condicionA = true;
    bool condicionB = false;
    bool condicionC = true;

    // !condicionA || condicionB && condicionC
    // !true || false && true
    // false || (false && true) // && tiene mayor precedencia que ||
    // false || false
    // false
    bool resLogico = !condicionA || condicionB && condicionC;
    std::cout << "!condicionA || condicionB && condicionC = " << resLogico << std::endl; // Salida: 0 (false)

    // Usando paréntesis para aclarar (o cambiar) la lógica
    bool resLogicoParentesis = (!condicionA || condicionB) && condicionC;
    // (false || false) && true
    // false && true
    // false
    std::cout << "(!condicionA || condicionB) && condicionC = " << resLogicoParentesis << std::endl; // Salida: 0 (false)

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 2,
    'tittle_level': 'Tipos de Datos, Variables y Operadores',
    'topic': 'Constantes y Enumeraciones',
    'subtopic': 'Definición y uso de constantes (const, constexpr)',
    'definition': '''
En programación, a menudo necesitamos valores que no cambian a lo largo de la ejecución de nuestro programa. Para eso usamos las constantes. Son como variables, pero una vez que les asignas un valor, este ya no se puede modificar. Es una forma de garantizar que ciertos datos permanezcan inalterables, lo cual es muy útil para valores fijos o configuraciones importantes.

¿Qué tipos de constantes existen en C++?

C++ nos ofrece principalmente dos formas de definir constantes: `const` y `constexpr`.

* **`const`**: Es la más común y se usa para declarar que una variable es de solo lectura. Su valor se establece en tiempo de compilación o en tiempo de ejecución, pero una vez asignado, no puede cambiarse. Piensa en `const` como una promesa al compilador de que ese valor no va a ser modificado.
* **`constexpr`**: Introducido en C++11, `constexpr` va un paso más allá. Significa "expresión constante" y asegura que el valor se evalúe *completamente* en tiempo de compilación. Esto es ideal para valores que son conocidos antes de que el programa se ejecute, como el tamaño de un array o constantes matemáticas. El beneficio de `constexpr` es que permite al compilador realizar optimizaciones adicionales, haciendo tu programa más rápido.

Ambas son excelentes para mejorar la legibilidad y seguridad de tu código, evitando que se modifiquen valores importantes por accidente.
''',
    'code_example': r'''
#include <iostream>

int main() {
    // Uso de 'const' para una constante en tiempo de ejecución
    const double PI_APROXIMADO = 3.14159;
    // PI_APROXIMADO = 3.14; // Error: No se puede asignar a una variable 'const'

    std::cout << "Pi aproximado (const): " << PI_APROXIMADO << std::endl;

    // Uso de 'constexpr' para una constante en tiempo de compilación
    constexpr int MAX_USUARIOS = 100;
    // MAX_USUARIOS = 200; // Error: No se puede asignar a una variable 'constexpr'

    std::cout << "Máximo de usuarios (constexpr): " << MAX_USUARIOS << std::endl;

    // 'constexpr' también se puede usar con funciones
    constexpr int getDoble(int x) {
        return x * 2;
    }
    constexpr int VALOR_DOBLE = getDoble(5); // Calculado en tiempo de compilación

    std::cout << "Valor doble (constexpr función): " << VALOR_DOBLE << std::endl;

    // Otro ejemplo con 'const' en diferentes contextos
    const int miEdad = 25;
    // int* ptr = &miEdad; // Error: no puedes obtener un puntero no-const a un const
    const int* ptrConst = &miEdad; // Puntero a un int constante (no puedes cambiar *ptrConst)
    // *ptrConst = 26; // Error: no puedes cambiar el valor a través de ptrConst

    int numeroNormal = 50;
    int *const ptrConstSolo = &numeroNormal; // Puntero constante a un int (puedes cambiar *ptrConstSolo, pero no ptrConstSolo)
    *ptrConstSolo = 51; // Esto es válido
    // ptrConstSolo = &miEdad; // Error: el puntero en sí es constante

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 2,
    'tittle_level': 'Tipos de Datos, Variables y Operadores',
    'topic': 'Constantes y Enumeraciones',
    'subtopic': 'Enumeraciones (enum, enum class)',
    'definition': '''
Cuando tienes un conjunto de valores relacionados que representan opciones fijas, como los días de la semana, los estados de un semáforo (rojo, amarillo, verde) o los meses del año, usar números mágicos (por ejemplo, 0 para rojo, 1 para amarillo) puede hacer que tu código sea difícil de leer y propenso a errores. Aquí es donde las enumeraciones, o `enum`, vienen al rescate.

¿Cuál es la diferencia entre `enum` y `enum class`?

Las enumeraciones te permiten darle nombres significativos a un conjunto de valores enteros, mejorando la legibilidad del código. Antes de C++11, se usaba `enum` a secas. Por ejemplo, `enum Dias { LUNES, MARTES, ... };`. Sin embargo, los `enum` tradicionales tienen algunos inconvenientes: sus enumeradores se "filtran" al ámbito donde se declara el enum, lo que puede causar colisiones de nombres si tienes dos enums con el mismo nombre de un enumerador. Además, se convierten implícitamente a enteros, lo que puede llevar a errores sutiles.

Para solucionar esto, C++11 introdujo `enum class` (enumeraciones con ámbito). Con `enum class`, los enumeradores están fuertemente tipados y tienen su propio ámbito, lo que significa que tienes que acceder a ellos usando el nombre de la enumeración (por ejemplo, `Color::ROJO`). Esto elimina las colisiones de nombres y las conversiones implícitas no deseadas, haciendo tu código más robusto y seguro. Es la forma moderna y recomendada de trabajar con enumeraciones en C++.
''',
    'code_example': r'''
#include <iostream>
#include <string>

int main() {
    // Ejemplo de 'enum' tradicional (antes de C++11)
    enum ColorAntiguo {
        ROJO,    // 0
        VERDE,   // 1
        AZUL     // 2
    };

    ColorAntiguo miColorAntiguo = ROJO;

    if (miColorAntiguo == 0) { // Se permite la comparación implícita con enteros
        std::cout << "Mi color antiguo es ROJO (enum tradicional)." << std::endl;
    }

    // Un problema del 'enum' tradicional: posible colisión de nombres
    // enum Estado { ACTIVO, INACTIVO };
    // int ACTIVO = 10; // Esto podría causar un error o advertencia, dependiendo del compilador
    // debido a la colisión de nombres con ACTIVO en el enum.

    // Ejemplo de 'enum class' (enumeración con ámbito, C++11 en adelante)
    enum class ColorModerno {
        ROJO,    // 0 por defecto
        VERDE,   // 1
        AZUL     // 2
    };

    ColorModerno miColorModerno = ColorModerno::VERDE;

    // if (miColorModerno == 1) { // Error: No se permite la comparación implícita con enteros
    //     std::cout << "Esto no compilará." << std::endl;
    // }

    if (miColorModerno == ColorModerno::VERDE) { // Acceso explícito al enumerador
        std::cout << "Mi color moderno es VERDE (enum class)." << std::endl;
    }

    // Podemos castear explícitamente un 'enum class' a un entero si es necesario
    int valorColor = static_cast<int>(miColorModerno);
    std::cout << "Valor entero de ColorModerno::VERDE: " << valorColor << std::endl; // Salida: 1

    // Un ejemplo de cómo usarlo en un switch (funciona para ambos)
    switch (miColorModerno) {
        case ColorModerno::ROJO:
            std::cout << "El color es rojo." << std::endl;
            break;
        case ColorModerno::VERDE:
            std::cout << "El color es verde." << std::endl;
            break;
        default:
            std::cout << "Otro color." << std::endl;
            break;
    }

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 2,
    'tittle_level': 'Tipos de Datos, Variables y Operadores',
    'topic': 'Constantes y Enumeraciones',
    'subtopic': 'Ventajas de las enumeraciones',
    'definition': '''
Ya hemos visto qué son las enumeraciones y la diferencia entre `enum` y `enum class`, pero lo más importante es entender por qué deberías usarlas. No son solo una característica bonita del lenguaje; ofrecen beneficios muy concretos que hacen que tu código sea mucho mejor.

¿Cuáles son las ventajas clave de usar enumeraciones?

La primera y más obvia es la **legibilidad del código**. Imagina que en lugar de `if (estado == 2)`, escribes `if (estado == EstadoDelJuego::PAUSADO)`. Es mucho más claro lo que está pasando, ¿verdad? Los nombres descriptivos de los enumeradores hacen que tu intención sea evidente para cualquiera que lea el código (incluido tu yo del futuro).

Segundo, aumentan la **seguridad del tipo**. Especialmente con `enum class`, evitas errores comunes donde podrías comparar accidentalmente un enumerador con un entero sin darte cuenta. Al forzar la conversión explícita, el compilador te avisa si algo no cuadra.

Tercero, previenen **colisiones de nombres**. Con `enum class`, cada enumerador está dentro de su propio ámbito, lo que significa que puedes tener `enum class Fruta { MANZANA };` y `enum class Animal { MANZANA };` sin ningún problema, porque se acceden como `Fruta::MANZANA` y `Animal::MANZANA` respectivamente. Esto es genial en proyectos grandes donde la posibilidad de repetir nombres es alta.

Finalmente, facilitan el **mantenimiento**. Si necesitas añadir un nuevo estado o valor, solo tienes que modificar la enumeración en un solo lugar, y el compilador te ayudará a encontrar todas las partes del código que necesitan ser actualizadas. En resumen, las enumeraciones son una herramienta potente para crear código más limpio, seguro y fácil de mantener.
''',
    'code_example': r'''
#include <iostream>
#include <string>

int main() {
    // Ventaja 1: Legibilidad y claridad
    enum class Direccion {
        NORTE,
        SUR,
        ESTE,
        OESTE
    };

    Direccion miDireccion = Direccion::NORTE;

    // Es mucho más claro que un número mágico
    if (miDireccion == Direccion::NORTE) {
        std::cout << "Vamos hacia el norte." << std::endl;
    }

    // Ventaja 2: Seguridad de tipo (evita comparaciones accidentales con enteros)
    // if (miDireccion == 0) { // Esto no compilará con enum class, lo cual es bueno
    //     std::cout << "Error de tipo." << std::endl;
    // }

    // Ventaja 3: Prevención de colisiones de nombres
    enum class TipoVehiculo { COCHE, MOTO, CAMION };
    enum class Color { ROJO, AZUL, VERDE };

    TipoVehiculo miVehiculo = TipoVehiculo::COCHE;
    Color colorFavorito = Color::ROJO;

    // No hay colisión de nombres entre COCHE y ROJO aunque COCHE y ROJO fueran 0 y 0
    // en ambos enums si fueran 'enum' tradicional
    if (miVehiculo == TipoVehiculo::COCHE) {
        std::cout << "Es un coche." << std::endl;
    }
    if (colorFavorito == Color::ROJO) {
        std::cout << "El color es rojo." << std::endl;
    }

    // Ventaja 4: Facilita el mantenimiento (ej. añadir un nuevo estado)
    // Imagina un juego con estados:
    enum class EstadoJuego {
        MENU_PRINCIPAL,
        JUGANDO,
        PAUSADO,
        FIN_JUEGO
        // Si añades un nuevo estado aquí, el compilador te avisará
        // si un switch-case no lo maneja (con -Werror=switch o similar)
    };

    EstadoJuego actual = EstadoJuego::JUGANDO;

    switch (actual) {
        case EstadoJuego::MENU_PRINCIPAL: break;
        case EstadoJuego::JUGANDO:
            std::cout << "El juego está en curso." << std::endl;
            break;
        case EstadoJuego::PAUSADO: break;
        case EstadoJuego::FIN_JUEGO: break;
    }

    return 0;
}
'''
  });
}

Future<void> insertJrLevel3DataCpp(Database db) async {
  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 3,
    'tittle_level': 'Control de Flujo',
    'topic': 'Estructuras Condicionales',
    'subtopic': 'if, else if, else',
    'definition': '''
En la programación, no siempre queremos que nuestro código se ejecute de principio a fin de forma lineal. A menudo, necesitamos que el programa tome decisiones y siga diferentes caminos dependiendo de ciertas condiciones. Para esto, usamos las estructuras condicionales, y las sentencias `if`, `else if` y `else` son las más fundamentales.

¿Cómo se usan estas estructuras para tomar decisiones en tu código?

Piensa en ellas como un sistema de "si esto, entonces aquello, si no, entonces otra cosa".
* El bloque `if` es la base: si la condición que le pones dentro de los paréntesis es verdadera (`true`), el código dentro de sus llaves se ejecuta. Si es falsa, simplemente se salta ese bloque.
* El bloque `else if` se usa cuando tienes varias condiciones posibles. Si la condición del `if` principal es falsa, el programa pasa a evaluar la condición del `else if`. Si esta es verdadera, su código se ejecuta. Puedes tener tantos `else if` como necesites.
* Finalmente, el bloque `else` es el comodín. Si ninguna de las condiciones anteriores (`if` o `else if`) se cumple, el código dentro del `else` se ejecuta por defecto. Es el camino que se toma si todas las demás opciones fallan.

Estas sentencias son la columna vertebral de la lógica de decisión en cualquier programa, permitiéndole reaccionar dinámicamente a diferentes situaciones.
''',
    'code_example': r'''
#include <iostream>
#include <string>

int main() {
    int edad = 19;
    std::string mensaje;

    // Ejemplo básico de if-else if-else
    if (edad < 13) {
        mensaje = "Eres un niño.";
    } else if (edad < 18) { // Si la primera condición fue falsa, evalúa esta
        mensaje = "Eres un adolescente.";
    } else { // Si ninguna de las anteriores fue verdadera
        mensaje = "Eres un adulto.";
    }
    std::cout << "Edad: " << edad << " -> " << mensaje << std::endl; // Salida: Eres un adulto.

    int puntuacion = 85;
    char calificacion;

    if (puntuacion >= 90) {
        calificacion = 'A';
    } else if (puntuacion >= 80) { // Si no es A, ¿es al menos 80?
        calificacion = 'B';
    } else if (puntuacion >= 70) { // Si no es A ni B, ¿es al menos 70?
        calificacion = 'C';
    } else {
        calificacion = 'F'; // Si ninguna de las anteriores, es F
    }
    std::cout << "Puntuación: " << puntuacion << " -> Calificación: " << calificacion << std::endl; // Salida: Calificación: B

    // Un error común: olvidar las llaves o la lógica incorrecta
    // int x = 5;
    // if (x > 10)
    //     std::cout << "X es mayor que 10"; // Solo esta línea es parte del if si no hay llaves
    //     std::cout << "Esto siempre se imprime, ¡cuidado!"; // Esta línea no es parte del if

    // if (x > 10) {
    //     // Hacer algo
    // } else if (x > 5) { // Lógica incorrecta si se evalúa después de x > 10
    //     // Si x fuera 12, nunca entraría aquí porque la primera condición (x > 10) sería verdadera
    // }

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 3,
    'tittle_level': 'Control de Flujo',
    'topic': 'Estructuras Condicionales',
    'subtopic': 'switch-case',
    'definition': '''
Cuando tienes una variable que puede tomar varios valores discretos y necesitas ejecutar diferentes bloques de código para cada uno de esos valores, las sentencias `if-else if-else` pueden volverse largas y un poco enredadas. Aquí es donde la estructura `switch-case` brilla por su elegancia y claridad.

¿Cómo funciona `switch-case` para manejar múltiples opciones?

Piensa en `switch-case` como un menú de opciones. Le das una expresión (generalmente una variable de tipo entero, char o enum) al `switch`, y luego defines varios `case` con los valores específicos que esa expresión puede tomar. Si el valor de la expresión coincide con el de un `case`, el código dentro de ese `case` se ejecuta. La clave aquí es la palabra `break;`. Si no pones `break;` al final de un `case`, la ejecución "caerá" al siguiente `case` (lo que se conoce como *fall-through*), lo cual a veces es intencional, pero la mayoría de las veces es un error. También tienes la opción `default`, que es como el `else` de un `if`: se ejecuta si la expresión no coincide con ningún `case` definido. Es ideal para limpiar y organizar la lógica cuando tienes muchas opciones.
''',
    'code_example': r'''
#include <iostream>
#include <string>

int main() {
    int diaDeLaSemana = 3; // 1 para Lunes, 2 para Martes, etc.
    std::string nombreDia;

    switch (diaDeLaSemana) {
        case 1:
            nombreDia = "Lunes";
            break; // Importante: salir del switch
        case 2:
            nombreDia = "Martes";
            break;
        case 3:
            nombreDia = "Miércoles";
            break;
        case 4:
            nombreDia = "Jueves";
            break;
        case 5:
            nombreDia = "Viernes";
            break;
        case 6:
            nombreDia = "Sábado";
            break;
        case 7:
            nombreDia = "Domingo";
            break;
        default: // Se ejecuta si ningún case coincide
            nombreDia = "Día inválido";
            break;
    }
    std::cout << "El día es: " << nombreDia << std::endl; // Salida: El día es: Miércoles

    char opcion = 'B';
    switch (opcion) {
        case 'A':
            std::cout << "Seleccionaste la opción A." << std::endl;
            break;
        case 'B':
            std::cout << "Seleccionaste la opción B." << std::endl;
            // No hay 'break;' aquí, ¡cuidado! Esto causará "fall-through"
        case 'C':
            std::cout << "Seleccionaste la opción C (o caíste desde B)." << std::endl;
            break;
        default:
            std::cout << "Opción desconocida." << std::endl;
            break;
    }
    // Salida para 'opcion = B':
    // Seleccionaste la opción B.
    // Seleccionaste la opción C (o caíste desde B).

    // Uso de enum class para mayor claridad en switch
    enum class EstadoLuz { ROJO, AMARILLO, VERDE };
    EstadoLuz luzActual = EstadoLuz::ROJO;

    switch (luzActual) {
        case EstadoLuz::ROJO:
            std::cout << "Alto." << std::endl;
            break;
        case EstadoLuz::AMARILLO:
            std::cout << "Precaución." << std::endl;
            break;
        case EstadoLuz::VERDE:
            std::cout << "Adelante." << std::endl;
            break;
    }

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 3,
    'tittle_level': 'Control de Flujo',
    'topic': 'Estructuras Condicionales',
    'subtopic': 'Operador ternario',
    'definition': '''
Si las sentencias `if-else` son para decisiones complejas, el operador ternario es la versión "express" para situaciones simples donde necesitas asignar un valor a una variable o ejecutar una expresión basada en una única condición. Es una forma concisa y elegante de escribir un `if-else` en una sola línea.

¿Cómo se utiliza el operador ternario para decisiones rápidas?

Su sintaxis es `condición ? valor_si_true : valor_si_false;`. Primero evalúas una `condición`. Si esa condición es verdadera, la expresión completa toma el valor que está después del `?`. Si es falsa, toma el valor que está después de los `:`. Es ideal para inicializar variables condicionalmente o para expresiones cortas donde un `if-else` tradicional podría resultar demasiado verboso. Por ejemplo, si quieres saber si un número es par o impar y almacenar el resultado en una cadena, el ternario es perfecto. Aunque es muy útil para la concisión, si la lógica se vuelve muy compleja, es mejor volver a usar un `if-else` para mantener la claridad.
''',
    'code_example': r'''
#include <iostream>
#include <string>

int main() {
    int numero = 7;
    std::string tipoNumero;

    // Usando if-else tradicional para comparar
    if (numero % 2 == 0) {
        tipoNumero = "par";
    } else {
        tipoNumero = "impar";
    }
    std::cout << "El número " << numero << " es " << tipoNumero << " (if-else)." << std::endl;

    // Usando el operador ternario para el mismo resultado
    // condición ? valor_si_true : valor_si_false
    std::string tipoNumeroTernario = (numero % 2 == 0) ? "par" : "impar";
    std::cout << "El número " << numero << " es " << tipoNumeroTernario << " (ternario)." << std::endl;

    int edad = 20;
    std::string mensajeEdad;

    // Ejemplo de operador ternario para asignar un mensaje
    mensajeEdad = (edad >= 18) ? "Mayor de edad" : "Menor de edad";
    std::cout << "Estado de edad: " << mensajeEdad << std::endl;

    double temperatura = 28.5;
    std::string estadoClima = (temperatura > 25) ? "Caluroso" : "Templado";
    std::cout << "El clima es: " << estadoClima << std::endl;

    // Anidación de operadores ternarios (¡cuidado con la legibilidad!)
    int valor = 5;
    std::string categoria = (valor > 10) ? "Alto" : (valor > 5) ? "Medio" : "Bajo";
    std::cout << "Categoría del valor " << valor << ": " << categoria << std::endl; // Salida: Bajo (porque 5 no es > 10, ni > 5)

    // Un ejemplo de lo que no hacer (demasiado complejo para un ternario)
    // std::string resultadoMuyComplejo = (cond1) ? ((cond2) ? "Caso1" : "Caso2") : ((cond3) ? "Caso3" : "Caso4");
    // Para lógica así, mejor usar if-else if-else.

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 3,
    'tittle_level': 'Control de Flujo',
    'topic': 'Bucles y Estructuras de Repetición',
    'subtopic': 'while, do-while',
    'definition': '''
Los bucles, también conocidos como estructuras de repetición, son el pan de cada día cuando necesitas que tu programa haga la misma tarea varias veces sin tener que escribir el mismo código una y otra vez. Imagina que quieres saludar a 100 personas; no vas a escribir 100 veces `std::cout << "Hola!";`. Para eso están los bucles. Los bucles `while` y `do-while` son dos de los más básicos y útiles.

¿Sabes cuándo usar `while` y cuándo `do-while`?

El bucle `while` es el más sencillo: repite un bloque de código *mientras* una condición sea verdadera. La condición se evalúa *antes* de cada iteración. Si la condición es falsa desde el principio, el código dentro del `while` nunca se ejecuta. Es como decir: "Mientras siga lloviendo, mantén el paraguas abierto".

Por otro lado, el bucle `do-while` es un poco diferente. También repite un bloque de código *mientras* una condición sea verdadera, pero la clave es que la condición se evalúa *después* de cada iteración. Esto significa que el código dentro del `do-while` se ejecuta al menos una vez, incluso si la condición es falsa. Es como decir: "Abre el paraguas y luego, mientras siga lloviendo, mantenlo abierto". Es útil cuando necesitas que una acción se realice al menos una vez, como pedirle al usuario que ingrese datos.
''',
    'code_example': r'''
#include <iostream>

int main() {
    // Ejemplo de bucle while
    int contador = 0;
    std::cout << "--- Bucle while ---" << std::endl;
    while (contador < 5) { // La condición se evalúa antes de cada iteración
        std::cout << "Contador (while): " << contador << std::endl;
        contador++; // Es crucial actualizar la condición para evitar un bucle infinito
    }
    std::cout << "Fin del bucle while." << std::endl;
    std::cout << std::endl;

    // Ejemplo de bucle do-while
    int i = 0;
    std::cout << "--- Bucle do-while ---" << std::endl;
    do {
        std::cout << "Contador (do-while): " << i << std::endl;
        i++;
    } while (i < 5); // La condición se evalúa después de la primera iteración
    std::cout << "Fin del bucle do-while." << std::endl;
    std::cout << std::endl;

    // Diferencia clave: do-while ejecuta al menos una vez
    int num = 10;
    std::cout << "--- Demostración do-while (ejecuta al menos una vez) ---" << std::endl;
    do {
        std::cout << "Este mensaje se imprime al menos una vez, aunque 'num < 5' sea falso." << std::endl;
        num++;
    } while (num < 5); // num es 10, así que la condición es falsa
    std::cout << "Fin de la demostración do-while." << std::endl;
    std::cout << std::endl;

    // Ejemplo de bucle infinito (¡no hacer esto en código real sin un 'break'!)
    // int x = 0;
    // while (true) { // La condición siempre es verdadera
    //     std::cout << "¡Bucle infinito! Presiona Ctrl+C para detener." << std::endl;
    //     // Si no hay un 'break' o la condición nunca cambia a false, se repite para siempre.
    // }

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 3,
    'tittle_level': 'Control de Flujo',
    'topic': 'Bucles y Estructuras de Repetición',
    'subtopic': 'for',
    'definition': '''
Si los bucles `while` y `do-while` son excelentes para repeticiones basadas en una condición, el bucle `for` es tu mejor amigo cuando sabes de antemano cuántas veces quieres que se repita algo, o cuando necesitas una estructura clara para inicializar un contador, verificar una condición y actualizar ese contador en cada paso. Es el bucle más compacto y comúnmente usado para iteraciones con un número predefinido de vueltas.

¿Cómo se estructura el bucle `for` y qué lo hace tan conveniente?

La sintaxis del bucle `for` es muy característica y se divide en tres partes, todas dentro de los paréntesis y separadas por punto y coma:
1.  **Inicialización**: Aquí defines e inicializas tu variable de control (por ejemplo, `int i = 0;`). Esta parte se ejecuta solo una vez, al principio del bucle.
2.  **Condición**: Es la expresión que se evalúa antes de cada iteración. Mientras sea verdadera, el bucle continúa. Cuando se vuelve falsa, el bucle termina (por ejemplo, `i < 10;`).
3.  **Actualización**: Se ejecuta al final de cada iteración, después de que el código del bucle se ha ejecutado. Normalmente, se usa para incrementar o decrementar la variable de control (por ejemplo, `i++`).

Esta estructura compacta hace que el bucle `for` sea muy legible y fácil de gestionar para tareas repetitivas y controladas por un contador. Desde recorrer arrays hasta realizar cálculos un número específico de veces, el `for` es una herramienta indispensable.
''',
    'code_example': r'''
#include <iostream>
#include <vector> // Para usar std::vector (más adelante verás qué es esto)

int main() {
    // Ejemplo básico de bucle for
    std::cout << "--- Bucle for simple ---" << std::endl;
    for (int i = 0; i < 5; i++) { // Inicialización; Condición; Actualización
        std::cout << "Iteración (for): " << i << std::endl;
    }
    std::cout << "Fin del bucle for." << std::endl;
    std::cout << std::endl;

    // Bucle for para recorrer un array (o vector, que es similar)
    std::vector<int> numeros = {10, 20, 30, 40, 50};
    std::cout << "--- Recorriendo un vector con for ---" << std::endl;
    for (int i = 0; i < numeros.size(); i++) {
        std::cout << "Elemento en índice " << i << ": " << numeros[i] << std::endl;
    }
    std::cout << std::endl;

    // Bucle for sin alguna de sus partes (válido, pero menos común)
    // Puede ser como un 'while(true)' si omites la condición
    int j = 0;
    std::cout << "--- Bucle for con condición omitida (manejo interno) ---" << std::endl;
    for ( ; ; ) { // Bucle infinito si no hay un 'break'
        std::cout << "Bucle infinito (rompiendo en 3): " << j << std::endl;
        j++;
        if (j == 3) {
            break; // Salir del bucle
        }
    }
    std::cout << "Fin del bucle for infinito modificado." << std::endl;
    std::cout << std::endl;

    // Un error común: bucle infinito si la condición de actualización es incorrecta
    // for (int k = 0; k >= 0; k++) { // k siempre será >= 0, bucle infinito
    //     std::cout << "Esto es un bucle infinito." << std::endl;
    // }

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 3,
    'tittle_level': 'Control de Flujo',
    'topic': 'Bucles y Estructuras de Repetición',
    'subtopic': 'break y continue',
    'definition': '''
Dentro de los bucles (ya sean `for`, `while` o `do-while`), a veces necesitas una forma de alterar el flujo normal de repetición. Quizás quieras salir del bucle completamente antes de que termine su curso natural, o tal vez quieras saltarte una iteración específica y pasar a la siguiente. Para esto, C++ nos da dos sentencias muy útiles: `break` y `continue`.

¿Cómo se usan `break` y `continue` para controlar tus bucles?

* La sentencia `break;` es como un botón de "parada de emergencia" para tu bucle. Cuando el programa encuentra un `break;`, sale inmediatamente del bucle en el que se encuentra y continúa la ejecución del código justo después del bucle. Es útil cuando has encontrado lo que buscabas o cuando se cumple una condición que hace que el resto del bucle sea innecesario.

* La sentencia `continue;` es diferente. En lugar de salir del bucle, `continue;` le dice al programa que "salte" el resto de la ejecución de la iteración actual y pase directamente a la siguiente iteración del bucle. Es decir, el código que está después del `continue;` dentro de esa iteración no se ejecuta, pero el bucle sigue su curso normal. Es útil cuando quieres omitir ciertas acciones para casos específicos dentro de un bucle, sin detenerlo por completo.

Ambas son herramientas poderosas para hacer que tus bucles sean más flexibles y eficientes, permitiéndote manejar condiciones especiales dentro de ellos.
''',
    'code_example': r'''
#include <iostream>

int main() {
    // Ejemplo de 'break'
    std::cout << "--- Ejemplo de 'break' ---" << std::endl;
    for (int i = 0; i < 10; i++) {
        if (i == 5) {
            std::cout << "Encontré el número 5. ¡Saliendo del bucle!" << std::endl;
            break; // Sale completamente del bucle for
        }
        std::cout << "Número actual: " << i << std::endl;
    }
    std::cout << "Después del bucle con break." << std::endl;
    std::cout << std::endl;

    // Ejemplo de 'continue'
    std::cout << "--- Ejemplo de 'continue' ---" << std::endl;
    for (int i = 0; i < 10; i++) {
        if (i % 2 != 0) { // Si el número es impar
            std::cout << "Saltando número impar: " << i << std::endl;
            continue; // Salta el resto de esta iteración y pasa a la siguiente
        }
        std::cout << "Número par encontrado: " << i << std::endl;
    }
    std::cout << "Después del bucle con continue." << std::endl;
    std::cout << std::endl;

    // Combinación de break y continue (evitar complejidad excesiva)
    std::cout << "--- Ejemplo combinado (evita abusar) ---" << std::endl;
    int suma = 0;
    for (int i = 1; i <= 10; i++) {
        if (i == 3) {
            std::cout << "Saltando el 3." << std::endl;
            continue; // Salta la suma para 3
        }
        if (i == 7) {
            std::cout << "Llegué al 7. Rompiendo el bucle." << std::endl;
            break; // Suma solo hasta el 6
        }
        suma += i;
        std::cout << "Sumando " << i << ". Suma actual: " << suma << std::endl;
    }
    std::cout << "Suma total (ignorando 3, parando en 7): " << suma << std::endl; // Salida: 1+2+4+5+6 = 18

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 3,
    'tittle_level': 'Control de Flujo',
    'topic': 'Manejo de Errores Básico',
    'subtopic': 'Introducción a las excepciones',
    'definition': '''
En la programación, no todo sale siempre como esperamos. Los errores pueden ocurrir por muchas razones: el usuario ingresa datos incorrectos, un archivo no existe, la red se cae, o incluso por un error lógico en nuestro propio código. Cuando un programa se encuentra con una situación inesperada que no puede manejar en el flujo normal, se dice que ocurre una "excepción".

¿Qué significa que ocurra una excepción?

Una excepción es un evento que ocurre durante la ejecución de un programa que interrumpe el flujo normal de las instrucciones. En C++, las excepciones son un mecanismo poderoso para el manejo de errores. En lugar de que el programa falle abruptamente o devuelva un valor de error críptico, una excepción permite que el programa "lance" un objeto (la excepción) que contiene información sobre el error. Este objeto puede ser "capturado" por otra parte del programa que esté preparada para manejar ese tipo de error. Esto separa el código de manejo de errores del código "normal", haciendo que tu programa sea más robusto y fácil de entender. Es una forma estructurada de lidiar con problemas inesperados.
''',
    'code_example': r'''
#include <iostream>
#include <vector> // Para simular un error de acceso

int main() {
    // Ejemplo de una situación que podría lanzar una excepción
    std::vector<int> miVector = {1, 2, 3};

    std::cout << "Intentando acceder a un elemento fuera de rango..." << std::endl;
    try {
        // Acceder a un índice que no existe en el vector (esto lanzará una excepción out_of_range)
        // Algunos compiladores/librerías requieren que se use .at() para que se lance la excepción
        // miVector[10]; // Usando [] no siempre lanza excepción por defecto, puede ser comportamiento indefinido
        int valor = miVector.at(10); // .at() sí lanza std::out_of_range si el índice es inválido
        std::cout << "Este mensaje no se imprimirá si se lanza una excepción." << std::endl;
    }
    catch (const std::out_of_range& e) { // Captura la excepción específica
        std::cerr << "¡Excepción capturada! Error al acceder al vector: " << e.what() << std::endl;
    }
    catch (const std::exception& e) { // Captura cualquier otra excepción estándar
        std::cerr << "¡Otra excepción estándar capturada!: " << e.what() << std::endl;
    }
    catch (...) { // Captura cualquier tipo de excepción (genérico)
        std::cerr << "¡Se capturó una excepción desconocida!" << std::endl;
    }

    std::cout << "El programa continúa después de intentar manejar la excepción." << std::endl;

    // Otro ejemplo (sin manejo de excepciones explícito para mostrar la interrupción)
    // int dividendo = 10;
    // int divisor = 0;
    // std::cout << "Intentando dividir por cero (esto podría causar un crash):" << std::endl;
    // int resultado = dividendo / divisor; // Esto causaría un error en tiempo de ejecución (división por cero)
    // std::cout << "Este mensaje NO se imprimirá si el programa falla." << std::endl;

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 3,
    'tittle_level': 'Control de Flujo',
    'topic': 'Manejo de Errores Básico',
    'subtopic': 'Uso de try-catch',
    'definition': '''
El mecanismo de excepciones en C++ se implementa principalmente con los bloques `try` y `catch`. Son la forma estructurada de intentar ejecutar un código que podría generar un error y, si ese error ocurre, "atraparlo" y manejarlo de manera controlada.

¿Cómo se usan los bloques `try` y `catch`?

El bloque `try` es como un "escudo" alrededor del código que sospechas que podría lanzar una excepción. Colocas dentro de él todas las sentencias que quieres que se monitoreen. Si alguna instrucción dentro del bloque `try` lanza una excepción, la ejecución de ese bloque se detiene inmediatamente.

Justo después del bloque `try`, colocas uno o más bloques `catch`. Cada bloque `catch` actúa como un "filtro": especifica el tipo de excepción que está dispuesto a manejar. Si una excepción lanzada por el `try` coincide con el tipo de una de las cláusulas `catch`, el código dentro de ese `catch` se ejecuta. Esto te permite escribir lógica específica para responder a diferentes tipos de errores. Si no se lanza ninguna excepción en el `try`, los bloques `catch` simplemente se ignoran y el programa continúa después de ellos. Esto asegura que los errores no hagan que tu programa se bloquee, sino que se recuperen elegantemente.
''',
    'code_example': r'''
#include <iostream>
#include <string>
#include <stdexcept> // Para std::runtime_error, std::invalid_argument, etc.

// Función que podría lanzar una excepción
double dividir(double numerador, double denominador) {
    if (denominador == 0) {
        // Lanzamos una excepción de tipo std::runtime_error
        throw std::runtime_error("Error: División por cero no permitida.");
    }
    return numerador / denominador;
}

int main() {
    double n1 = 10.0;
    double d1 = 2.0;
    double n2 = 5.0;
    double d2 = 0.0; // Denominador que causará un error

    // Primer intento: división exitosa
    try {
        std::cout << "Intentando dividir " << n1 << " entre " << d1 << std::endl;
        double resultado1 = dividir(n1, d1);
        std::cout << "Resultado: " << resultado1 << std::endl;
    }
    catch (const std::runtime_error& e) {
        // Este catch no se ejecutará aquí
        std::cerr << "Capturado un error de ejecución: " << e.what() << std::endl;
    }
    std::cout << std::endl;

    // Segundo intento: división por cero, se lanzará una excepción
    try {
        std::cout << "Intentando dividir " << n2 << " entre " << d2 << std::endl;
        double resultado2 = dividir(n2, d2); // Aquí se lanza la excepción
        std::cout << "Este mensaje no se imprimirá." << std::endl; // Esta línea se salta
    }
    catch (const std::runtime_error& e) { // Captura la excepción std::runtime_error
        std::cerr << "¡Error capturado en el segundo intento! " << e.what() << std::endl;
    }
    catch (const std::exception& e) { // Catch genérico para cualquier otra excepción estándar
        std::cerr << "¡Otra excepción estándar capturada!: " << e.what() << std::endl;
    }
    catch (...) { // Catch-all para cualquier tipo de excepción
        std::cerr << "¡Se capturó una excepción de tipo desconocido!" << std::endl;
    }

    std::cout << "\nEl programa continúa después de ambos intentos de división." << std::endl;

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 3,
    'tittle_level': 'Control de Flujo',
    'topic': 'Manejo de Errores Básico',
    'subtopic': 'throw y tipos de excepciones estándar',
    'definition': '''
Para que el mecanismo `try-catch` funcione, algo tiene que "lanzar" la excepción. Este es el propósito de la palabra clave `throw`. Cuando detectas una situación de error que no puedes resolver en el lugar, utilizas `throw` para indicar que ha ocurrido una excepción y pasas un objeto que la representa.

¿Qué tipos de excepciones puedes lanzar y atrapar?

Puedes `throw` cualquier cosa en C++ (un entero, una cadena, un objeto), pero la mejor práctica es lanzar objetos que hereden de `std::exception`. La librería estándar de C++ provee varias clases de excepciones ya definidas para errores comunes. Algunas de las más importantes son:

* **`std::exception`**: Es la clase base de todas las excepciones estándar. Puedes capturarla para atrapar cualquier excepción estándar.
* **`std::runtime_error`**: Para errores que ocurren durante la ejecución del programa y que no pueden ser detectados en tiempo de compilación (como la división por cero si el divisor es una variable).
* **`std::logic_error`**: Para errores lógicos en el programa que podrían haberse evitado con una mejor lógica (por ejemplo, `std::invalid_argument` si una función recibe un parámetro no válido).
* **`std::bad_alloc`**: Se lanza cuando una operación de asignación de memoria falla (no hay suficiente memoria).
* **`std::out_of_range`**: Se lanza cuando intentas acceder a un índice fuera de los límites de un contenedor (como un vector o string) usando el método `at()`.

Lanzar y capturar estas excepciones estándar o tus propias clases derivadas de `std::exception` hace que tu manejo de errores sea consistente, descriptivo y más fácil de depurar.
''',
    'code_example': r'''
#include <iostream>
#include <string>
#include <stdexcept> // Para std::runtime_error, std::invalid_argument, out_of_range, etc.
#include <vector>

// Función que valida una edad y lanza una excepción si es inválida
void validarEdad(int edad) {
    if (edad < 0 || edad > 120) {
        // Lanzamos una excepción de tipo std::out_of_range (aunque std::invalid_argument también sería válida)
        throw std::out_of_range("La edad ingresada (" + std::to_string(edad) + ") no es válida.");
    }
    std::cout << "Edad validada correctamente: " << edad << std::endl;
}

// Otra función que simula un error de runtime
void procesarDatos(int* ptr) {
    if (ptr == nullptr) {
        throw std::runtime_error("Error: El puntero no puede ser nulo.");
    }
    // Suponemos alguna operación con el puntero
    std::cout << "Datos procesados desde el puntero: " << *ptr << std::endl;
}

int main() {
    // Ejemplo de manejo de edad
    try {
        validarEdad(30);
        validarEdad(-5); // Esto lanzará una excepción
        std::cout << "Este mensaje no se imprimirá después de la excepción." << std::endl;
    }
    catch (const std::out_of_range& e) { // Captura la excepción específica
        std::cerr << "Error de edad (std::out_of_range): " << e.what() << std::endl;
    }
    catch (const std::exception& e) { // Captura cualquier otra excepción estándar
        std::cerr << "Error genérico (std::exception): " << e.what() << std::endl;
    }
    std::cout << std::endl;

    // Ejemplo de manejo de puntero nulo
    int* miPuntero = nullptr;
    try {
        procesarDatos(miPuntero); // Esto lanzará una excepción
        std::cout << "Este mensaje no se imprimirá." << std::endl;
    }
    catch (const std::runtime_error& e) {
        std::cerr << "Error de procesamiento (std::runtime_error): " << e.what() << std::endl;
    }
    catch (...) { // Catch-all si hay otras excepciones inesperadas
        std::cerr << "Se capturó una excepción desconocida." << std::endl;
    }
    std::cout << std::endl;

    // Simular un error de memoria (menos común en ejemplos simples)
    // try {
    //     std::vector<int>* v = new std::vector<int>(1000000000); // Intenta asignar mucha memoria
    //     // delete v;
    // }
    // catch (const std::bad_alloc& e) {
    //     std::cerr << "Error de memoria (std::bad_alloc): " << e.what() << std::endl;
    // }

    std::cout << "Fin del programa." << std::endl;

    return 0;
}
'''
  });
}

Future<void> insertJrLevel4DataCpp(Database db) async {
  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 4,
    'tittle_level': 'Funciones y Modularización',
    'topic': 'Funciones',
    'subtopic': 'Declaración y definición',
    'definition': '''
A medida que tus programas crecen, escribir todo el código en la función `main` se vuelve inmanejable. Aquí es donde las funciones entran en juego. Una función es un bloque de código reutilizable que realiza una tarea específica. Pensar en funciones es como dividir un problema grande en problemas más pequeños y manejables.

¿Sabes cuál es la diferencia entre declarar y definir una función?

La **declaración** (también conocida como prototipo de función o firma) le dice al compilador que una función con un cierto nombre, tipo de retorno y parámetros existe. Es como una promesa: "Oye, compilador, va a haber una función llamada 'sumar' que toma dos enteros y devuelve un entero". La declaración es necesaria antes de que puedas llamar a la función en tu código. Se suele colocar en un archivo de cabecera (`.h` o `.hpp`) o al principio del archivo `.cpp` donde se usará.

La **definición** de una función es donde realmente escribes el código que la función ejecutará. Es el "cuerpo" de la función. Es donde le dices a C++ *cómo* la función va a realizar su tarea prometida. La definición incluye el mismo tipo de retorno, nombre y parámetros que la declaración, seguidos por el bloque de código entre llaves. La definición se suele colocar en un archivo `.cpp`. Separar la declaración de la definición permite la modularización y la compilación separada de archivos, lo que es crucial en proyectos grandes.
''',
    'code_example': r'''
#include <iostream>

// --- Declaración de funciones (prototipos) ---
// Le dice al compilador que estas funciones existen y cómo lucen.
int sumar(int a, int b);
void saludar(std::string nombre);
double calcularAreaCirculo(double radio);

int main() {
    // Podemos llamar a las funciones después de su declaración
    int resultadoSuma = sumar(5, 3);
    std::cout << "La suma es: " << resultadoSuma << std::endl; // Salida: La suma es: 8

    saludar("Juan"); // Salida: ¡Hola, Juan! Bienvenido.

    double area = calcularAreaCirculo(2.5);
    std::cout << "El área del círculo es: " << area << std::endl; // Salida: El área del círculo es: [valor]

    return 0;
}

// --- Definición de funciones ---
// Aquí es donde el código real de las funciones se implementa.

// Definición de la función sumar
int sumar(int a, int b) {
    return a + b; // Devuelve la suma de a y b
}

// Definición de la función saludar
void saludar(std::string nombre) { // 'void' significa que no devuelve nada
    std::cout << "¡Hola, " << nombre << "! Bienvenido." << std::endl;
}

// Definición de la función para calcular el área de un círculo
// Usamos 'const double PI' dentro de la función para mantenerla local a ella.
double calcularAreaCirculo(double radio) {
    const double PI = 3.14159;
    return PI * radio * radio;
}

/*
// Un error común: llamar a una función sin declararla primero (si está definida después de main)
// int multiplicar(int x, int y) { return x * y; }
// int main() {
//    int prod = multiplicar(4, 2); // Error si 'multiplicar' no se declara antes de main
//    return 0;
// }
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 4,
    'tittle_level': 'Funciones y Modularización',
    'topic': 'Funciones',
    'subtopic': 'Parámetros y argumentos',
    'definition': '''
Para que las funciones sean realmente útiles, a menudo necesitan recibir información para poder realizar su tarea. Aquí es donde entran los parámetros y los argumentos. Aunque a menudo se usan indistintamente, tienen una diferencia sutil pero importante en el contexto de las funciones.

¿Cuál es la diferencia entre un parámetro y un argumento?

Los **parámetros** son las variables que se declaran en la definición (o prototipo) de una función. Actúan como "marcadores de posición" para los valores que la función espera recibir. Por ejemplo, en `int sumar(int a, int b)`, `a` y `b` son parámetros. Cuando defines una función, estás diciendo qué tipo de información va a necesitar para trabajar.

Los **argumentos** son los valores reales que pasas a la función cuando la llamas. Son los datos concretos que se le dan a los parámetros en ese momento específico. Por ejemplo, cuando llamas a `sumar(5, 3);`, `5` y `3` son los argumentos. El valor de `5` se copia al parámetro `a`, y el valor de `3` se copia al parámetro `b`.

La forma en que se pasan los argumentos a los parámetros (por valor, por referencia, etc.) es un tema avanzado, pero por ahora, lo crucial es entender que los parámetros son las "cajas" que esperan datos, y los argumentos son los "datos" que se ponen en esas cajas cuando usas la función.
''',
    'code_example': r'''
#include <iostream>
#include <string>

// Función con parámetros: 'nombre' y 'edad' son los parámetros
void mostrarInfoPersona(std::string nombre, int edad) {
    std::cout << "Nombre: " << nombre << ", Edad: " << edad << std::endl;
}

// Función que calcula el doble de un número. 'num' es el parámetro.
int calcularDoble(int num) {
    return num * 2;
}

int main() {
    // Llamada a mostrarInfoPersona con argumentos
    std::cout << "--- Argumentos para mostrarInfoPersona ---" << std::endl;
    mostrarInfoPersona("Ana", 28); // "Ana" y 28 son argumentos
    mostrarInfoPersona("Carlos", 45); // "Carlos" y 45 son otros argumentos

    // Llamada a calcularDoble con un argumento
    std::cout << "\n--- Argumentos para calcularDoble ---" << std::endl;
    int miNumero = 7;
    int dobleDeMiNumero = calcularDoble(miNumero); // miNumero (7) es el argumento
    std::cout << "El doble de " << miNumero << " es: " << dobleDeMiNumero << std::endl;

    // Puedes pasar valores literales como argumentos
    int dobleDe10 = calcularDoble(10); // 10 es un argumento literal
    std::cout << "El doble de 10 es: " << dobleDe10 << std::endl;

    // Un error común: no pasar la cantidad o tipo correcto de argumentos
    // mostrarInfoPersona("Pedro"); // Error: Falta el argumento 'edad'
    // calcularDoble("texto"); // Error: Se espera un 'int', se pasa una 'std::string'

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 4,
    'tittle_level': 'Funciones y Modularización',
    'topic': 'Funciones',
    'subtopic': 'Valor de retorno',
    'definition': '''
Cuando una función realiza una tarea, a menudo produce un resultado que queremos usar en otra parte de nuestro programa. Aquí es donde el "valor de retorno" de una función se vuelve crucial. El valor de retorno es la información que una función le "devuelve" a la parte del código que la llamó, una vez que ha terminado su ejecución.

¿Cómo se especifica y se utiliza el valor de retorno de una función?

Para que una función devuelva un valor, debes especificar su "tipo de retorno" antes del nombre de la función en su declaración y definición. Por ejemplo, `int sumar(...)` indica que la función `sumar` devolverá un valor de tipo entero. Dentro del cuerpo de la función, utilizas la palabra clave `return` seguida del valor o expresión que quieres devolver. Cuando la sentencia `return` se ejecuta, la función termina inmediatamente y el control vuelve al punto donde fue llamada, llevando consigo el valor especificado.

Si una función no necesita devolver ningún valor (por ejemplo, si solo imprime algo en pantalla o modifica variables pasadas por referencia), su tipo de retorno debe ser `void`. Es como decir que la función hace algo, pero no genera un resultado directo que necesitemos para cálculos posteriores. El uso adecuado de los valores de retorno es clave para construir programas modulares y que se puedan reutilizar fácilmente.
''',
    'code_example': r'''
#include <iostream>
#include <string>

// Función que devuelve un entero (la suma de dos números)
int sumar(int a, int b) {
    int resultado = a + b;
    return resultado; // Devuelve el valor de 'resultado'
}

// Función que devuelve un double (el promedio de tres números)
double calcularPromedio(double n1, double n2, double n3) {
    double suma = n1 + n2 + n3;
    return suma / 3.0; // Devuelve el promedio
}

// Función que devuelve un string (un saludo personalizado)
std::string obtenerSaludo(std::string nombre) {
    return "¡Hola, " + nombre + "!"; // Devuelve una cadena de texto
}

// Función que no devuelve ningún valor (su tipo de retorno es 'void')
void imprimirMensaje(std::string mensaje) {
    std::cout << "Mensaje: " << mensaje << std::endl;
    // No hay 'return' explícito, o se podría poner 'return;'
}

int main() {
    // Capturando el valor de retorno de 'sumar'
    int num1 = 10;
    int num2 = 15;
    int miSuma = sumar(num1, num2); // 'miSuma' toma el valor devuelto por 'sumar' (25)
    std::cout << "La suma es: " << miSuma << std::endl;

    // Usando el valor de retorno directamente en una expresión
    std::cout << "La suma de 7 y 8 es: " << sumar(7, 8) << std::endl;

    // Capturando el valor de retorno de 'calcularPromedio'
    double promedio = calcularPromedio(5.5, 7.0, 8.5);
    std::cout << "El promedio es: " << promedio << std::endl;

    // Capturando el valor de retorno de 'obtenerSaludo'
    std::string saludo = obtenerSaludo("María");
    std::cout << saludo << std::endl;

    // Llamando a una función void (no devuelve nada)
    imprimirMensaje("Este es un mensaje simple.");

    // Un error común: intentar capturar un valor de retorno de una función 'void'
    // int x = imprimirMensaje("Error!"); // Error: La función 'imprimirMensaje' es void

    // Otro error: no devolver el tipo correcto
    // int funcionIncorrecta() { return "texto"; } // Error: Se espera int, se devuelve string

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 4,
    'tittle_level': 'Funciones y Modularización',
    'topic': 'Funciones',
    'subtopic': 'Ámbito de variables',
    'definition': '''
El "ámbito" o "scope" de una variable se refiere a la región de tu programa donde esa variable puede ser accedida o utilizada. Es como el "territorio" donde una variable es conocida. Entender el ámbito es fundamental para evitar errores y para escribir código organizado, ya que determina la vida útil y la visibilidad de tus variables.

¿Dónde pueden ser vistas y usadas tus variables?

Principalmente, hay dos tipos de ámbito que debes conocer:

1.  **Ámbito local**: Una variable declarada dentro de un bloque de código (como una función, un bucle `for`, o un bloque `if`) tiene ámbito local. Esto significa que solo puede ser accedida y utilizada dentro de ese bloque específico. Una vez que el programa sale de ese bloque, la variable deja de existir y su memoria se libera. Esto es excelente para evitar colisiones de nombres y para que las funciones sean independientes.

2.  **Ámbito global**: Una variable declarada fuera de cualquier función (usualmente al principio del archivo `.cpp` o en un archivo de cabecera) tiene ámbito global. Esto significa que puede ser accedida desde cualquier parte del programa, desde cualquier función. Si bien esto puede parecer conveniente, el uso excesivo de variables globales se considera una mala práctica, ya que puede llevar a un código difícil de depurar y mantener, porque cualquier parte del programa podría alterarlas inesperadamente. Es mejor pasar datos entre funciones usando parámetros y valores de retorno.

Además de estos, existen otros ámbitos como el de clase (para miembros de una clase) y el de archivo (para variables estáticas). Conocer el ámbito te ayuda a entender cuándo y dónde declarar tus variables para que sean accesibles solo cuando sea necesario.
''',
    'code_example': r'''
#include <iostream>
#include <string>

// --- Variable Global ---
// 'mensajeGlobal' tiene ámbito global, es accesible desde cualquier función.
std::string mensajeGlobal = "Soy una variable global.";

// Función que usa una variable local y una global
void funcionEjemplo(int parametroLocal) {
    // --- Variable Local (de función) ---
    // 'variableLocalFuncion' solo existe dentro de 'funcionEjemplo'.
    int variableLocalFuncion = 10;

    std::cout << "Dentro de funcionEjemplo:" << std::endl;
    std::cout << "  Parámetro local: " << parametroLocal << std::endl;
    std::cout << "  Variable local de función: " << variableLocalFuncion << std::endl;
    std::cout << "  Variable global: " << mensajeGlobal << std::endl;

    // Intentar acceder a 'variableLocalMain' aquí sería un error de compilación.
    // std::cout << variableLocalMain << std::endl; // Error: 'variableLocalMain' no declarada en este ámbito
}

int main() {
    // --- Variable Local (de main) ---
    // 'variableLocalMain' solo existe dentro de la función main.
    int variableLocalMain = 50;

    std::cout << "Dentro de main:" << std::endl;
    std::cout << "  Variable local de main: " << variableLocalMain << std::endl;
    std::cout << "  Variable global: " << mensajeGlobal << std::endl;

    // Llamando a la función y pasándole un argumento (que será 'parametroLocal' dentro de la función)
    funcionEjemplo(25);

    // --- Variable Local (de bloque) ---
    // 'x' solo existe dentro de este bloque 'if'.
    if (true) {
        int x = 100;
        std::cout << "  Dentro del bloque if, x: " << x << std::endl;
    }
    // std::cout << x << std::endl; // Error: 'x' no declarada en este ámbito (fuera del bloque if)

    // Un error común: re-declarar una variable local con el mismo nombre en el mismo ámbito
    // int variableLocalMain = 70; // Error: Redefinición de 'variableLocalMain'

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 4,
    'tittle_level': 'Funciones y Modularización',
    'topic': 'Técnicas Avanzadas en Funciones',
    'subtopic': 'Sobrecarga de funciones',
    'definition': '''
Imagina que necesitas una función para sumar números, pero a veces quieres sumar dos enteros, otras veces dos números decimales, y en ocasiones, incluso tres enteros. Si tuvieras que usar un nombre diferente para cada una (`sumarEnteros`, `sumarDecimales`, `sumarTresEnteros`), tu código se volvería rápidamente confuso. Aquí es donde la **sobrecarga de funciones** en C++ entra en juego.

¿Qué es la sobrecarga de funciones y cómo te ayuda a escribir código más limpio?

La sobrecarga de funciones te permite definir múltiples funciones con el *mismo nombre*, siempre y cuando tengan **diferentes firmas**. La "firma" de una función es la combinación de su nombre y los tipos y el orden de sus parámetros. El tipo de retorno no es parte de la firma para la sobrecarga.

Cuando llamas a una función sobrecargada, el compilador de C++ es lo suficientemente inteligente como para determinar cuál versión de la función debes usar basándose en el número y el tipo de los argumentos que le pasas. Esto permite que el código sea más intuitivo y legible, ya que puedes usar un nombre significativo para una operación lógica, sin importar los tipos de datos específicos con los que estés trabajando. Es como tener un botón "sumar" universal que sabe qué hacer dependiendo de los números que le des.
''',
    'code_example': r'''
#include <iostream>
#include <string>

// Sobrecarga de la función 'sumar' para enteros
int sumar(int a, int b) {
    std::cout << "Sumando dos enteros." << std::endl;
    return a + b;
}

// Sobrecarga de la función 'sumar' para dobles
double sumar(double a, double b) {
    std::cout << "Sumando dos dobles." << std::endl;
    return a + b;
}

// Sobrecarga de la función 'sumar' para tres enteros
int sumar(int a, int b, int c) {
    std::cout << "Sumando tres enteros." << std::endl;
    return a + b + c;
}

// Otro ejemplo: sobrecarga para imprimir diferentes tipos
void imprimir(int valor) {
    std::cout << "Imprimiendo entero: " << valor << std::endl;
}

void imprimir(const std::string& texto) { // Usamos const reference para eficiencia
    std::cout << "Imprimiendo cadena: " << texto << std::endl;
}

int main() {
    // El compilador decide qué versión de 'sumar' llamar
    std::cout << "Resultado 1 (int): " << sumar(10, 20) << std::endl;
    std::cout << "Resultado 2 (double): " << sumar(10.5, 20.3) << std::endl;
    std::cout << "Resultado 3 (tres int): " << sumar(1, 2, 3) << std::endl;

    std::cout << std::endl;

    // El compilador decide qué versión de 'imprimir' llamar
    imprimir(123);
    imprimir("Hola, C++!");

    // Un error común: sobrecargar solo por el tipo de retorno (no es válido)
    // int obtenerValor() { return 1; }
    // double obtenerValor() { return 1.0; } // Error: redefinición de 'obtenerValor()'

    // Otro error común: firmas idénticas
    // int operacion(int x, int y) { return x + y; }
    // int operacion(int a, int b) { return a * b; } // Error: redefinición de 'operacion(int, int)'

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 4,
    'tittle_level': 'Funciones y Modularización',
    'topic': 'Técnicas Avanzadas en Funciones',
    'subtopic': 'Funciones inline',
    'definition': '''
Cuando llamas a una función, el programa realiza una serie de pasos adicionales: guarda el estado actual, salta a la ubicación de la función, ejecuta su código, guarda el valor de retorno y luego salta de vuelta al punto donde fue llamada. Para funciones muy pequeñas y que se llaman muy a menudo, este "costo" de la llamada a la función puede impactar ligeramente el rendimiento. Las **funciones `inline`** ofrecen una optimización para estos casos.

¿Qué hacen las funciones `inline` y cuándo deberías usarlas?

Cuando marcas una función con la palabra clave `inline`, le estás dando una *sugerencia* al compilador. Le dices: "Compilador, si es posible, en lugar de llamar a esta función de la manera usual, por favor, inserta el código de esta función directamente en el lugar donde se llama". Esto se conoce como *inlining* o *expansión en línea*.

El objetivo principal es reducir el "overhead" (la sobrecarga) de la llamada a la función, lo que puede resultar en un código ejecutable más rápido. Sin embargo, es solo una *sugerencia*. El compilador tiene la última palabra y puede decidir ignorar `inline` si considera que la función es demasiado grande o compleja para ser inlined, ya que inlining funciones grandes podría aumentar el tamaño del código y, paradójicamente, reducir el rendimiento por un uso menos eficiente de la caché.

Las funciones `inline` son ideales para funciones muy cortas, que realizan una tarea trivial y que se llaman con mucha frecuencia, como getters y setters simples de clases. No se deben usar indiscriminadamente.
''',
    'code_example': r'''
#include <iostream>

// Función 'inline' para calcular el doble de un número.
// La palabra clave 'inline' es una SUGERENCIA al compilador.
inline int getDoble(int x) {
    return x * 2;
}

// Otra función 'inline' para una suma simple
inline int sumar(int a, int b) {
    return a + b;
}

// Función no-inline para comparar el impacto
int getTriple(int x) {
    return x * 3;
}

int main() {
    int numero = 10;

    // Cuando se llama a getDoble, el compilador podría reemplazar
    // 'getDoble(numero)' directamente con 'numero * 2'.
    int resultadoDoble = getDoble(numero);
    std::cout << "El doble de " << numero << " es: " << resultadoDoble << std::endl;

    int num1 = 5;
    int num2 = 7;
    int resultadoSuma = sumar(num1, num2);
    std::cout << "La suma de " << num1 << " y " << num2 << " es: " << resultadoSuma << std::endl;

    // Comparación con una función normal
    int resultadoTriple = getTriple(numero);
    std::cout << "El triple de " << numero << " es: " << resultadoTriple << std::endl;

    // Notas importantes sobre 'inline':
    // 1. Es una sugerencia, no una orden. El compilador puede ignorarla.
    // 2. Usar 'inline' en funciones grandes puede aumentar el tamaño del ejecutable,
    //    lo que podría empeorar el rendimiento (menos eficiencia de caché de instrucciones).
    // 3. Las funciones 'inline' deben definirse en los archivos de cabecera (.h/.hpp)
    //    para que el compilador tenga acceso a su implementación al hacer inlining.
    //    Si se definen en .cpp y se llaman desde otros .cpp, puede haber problemas de enlazado.

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 4,
    'tittle_level': 'Funciones y Modularización',
    'topic': 'Técnicas Avanzadas en Funciones',
    'subtopic': 'Parámetros por defecto',
    'definition': '''
Cuando diseñas funciones, a veces hay parámetros que tienen un valor "típico" o "predeterminado" la mayor parte del tiempo. En lugar de tener que pasar ese valor cada vez que llamas a la función, C++ te permite definir **parámetros por defecto**. Esto hace que tus funciones sean más flexibles y fáciles de usar, ya que puedes omitir los argumentos correspondientes a esos parámetros y la función usará sus valores preestablecidos.

¿Cómo se definen y se usan los parámetros por defecto?

Para usar parámetros por defecto, simplemente asignas un valor a un parámetro directamente en la declaración de la función (el prototipo). Por ejemplo, `void saludar(std::string nombre, std::string saludo = "Hola");`. Si cuando llamas a `saludar()`, solo le pasas un `nombre`, el `saludo` automáticamente tomará el valor "Hola". Si le pasas un `saludo` explícito, ese valor sobrescribirá el predeterminado.

Una regla importante es que todos los parámetros con valores por defecto deben colocarse al **final** de la lista de parámetros. No puedes tener un parámetro por defecto seguido de un parámetro sin un valor por defecto. Es decir, `(int a, int b = 0, int c)` es válido, pero `(int a = 0, int b, int c)` no lo es. Los parámetros por defecto aumentan la versatilidad de tus funciones, permitiendo que sean llamadas de diversas maneras sin necesidad de sobrecargar las funciones solo para manejar diferentes conjuntos de argumentos.
''',
    'code_example': r'''
#include <iostream>
#include <string>

// Función con parámetros por defecto
// 'saludo' tiene un valor por defecto "Hola".
// 'signo' tiene un valor por defecto '!'.
void saludar(std::string nombre, std::string saludo = "Hola", char signo = '!') {
    std::cout << saludo << ", " << nombre << signo << std::endl;
}

// Función con un parámetro por defecto para un cálculo
int multiplicar(int a, int b = 2) { // b tiene un valor por defecto de 2
    return a * b;
}

int main() {
    // Llamada 1: Usando todos los valores por defecto (solo se pasa 'nombre')
    std::cout << "--- Usando parámetros por defecto ---" << std::endl;
    saludar("Ana"); // Salida: Hola, Ana!

    // Llamada 2: Sobrescribiendo solo el primer valor por defecto
    saludar("Pedro", "Buenos días"); // Salida: Buenos días, Pedro!

    // Llamada 3: Sobrescribiendo todos los valores por defecto
    saludar("Luis", "Qué tal", '?'); // Salida: Qué tal, Luis?

    std::cout << std::endl;

    // Llamada a multiplicar:
    std::cout << "--- Multiplicar con parámetros por defecto ---" << std::endl;
    std::cout << "Multiplicar 5 por 2 (por defecto): " << multiplicar(5) << std::endl; // Salida: 10
    std::cout << "Multiplicar 5 por 3 (explicito): " << multiplicar(5, 3) << std::endl; // Salida: 15

    // Un error común: parámetros por defecto no al final
    // void funcionInvalida(int a = 0, int b); // Error: Parámetro 'b' no tiene valor por defecto
    //                                         // y viene después de uno que sí lo tiene.

    // void otraFuncionInvalida(int a, int b = 0, int c); // Error: Parámetro 'c' sin defecto después de 'b' con defecto

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 4,
    'tittle_level': 'Funciones y Modularización',
    'topic': 'Técnicas Avanzadas en Funciones',
    'subtopic': 'Recursividad',
    'definition': '''
Hasta ahora, hemos visto funciones que llaman a otras funciones, o funciones que simplemente ejecutan su código y terminan. Pero hay una técnica poderosa en programación donde una función se llama a sí misma. Esto se conoce como **recursividad**. Es como mirarse en un espejo que a su vez se refleja en otro espejo, y así sucesivamente.

¿Cuándo es útil la recursividad y qué consideraciones hay que tener?

La recursividad es muy útil para resolver problemas que pueden dividirse en subproblemas más pequeños que son de la misma naturaleza que el problema original. Un ejemplo clásico es el cálculo del factorial de un número, o el cálculo de los números de Fibonacci. En estos casos, la solución se expresa naturalmente en términos de sí misma.

Para que una función recursiva funcione correctamente y no termine en un bucle infinito, debe tener dos partes esenciales:
1.  **Caso base**: Es la condición de parada. Es la situación más simple del problema que puede resolverse directamente sin hacer más llamadas recursivas. Sin un caso base, la función se llamaría a sí misma infinitamente, lo que llevaría a un desbordamiento de la pila (stack overflow) y a que el programa se bloquee.
2.  **Paso recursivo**: Es cuando la función se llama a sí misma, pero con un problema más pequeño o una versión modificada del original, acercándose al caso base.

Aunque elegante, la recursividad puede ser menos eficiente en algunos casos que una solución iterativa (usando bucles) debido a la sobrecarga de múltiples llamadas a funciones. Sin embargo, para ciertos problemas, su claridad y concisión la hacen la opción preferida.
''',
    'code_example': r'''
#include <iostream>
#include <string>

// Ejemplo 1: Cálculo del factorial usando recursividad
// Factorial de n (n!) = n * (n-1)!
// Caso base: 0! = 1, 1! = 1
long long factorial(int n) {
    if (n == 0 || n == 1) { // Caso base: si n es 0 o 1, devuelve 1
        return 1;
    } else { // Paso recursivo: n * factorial de (n-1)
        return n * factorial(n - 1);
    }
}

// Ejemplo 2: Cálculo del número de Fibonacci usando recursividad
// Fibonacci(n) = Fibonacci(n-1) + Fibonacci(n-2)
// Casos base: Fibonacci(0) = 0, Fibonacci(1) = 1
long long fibonacci(int n) {
    if (n == 0) { // Caso base 1
        return 0;
    } else if (n == 1) { // Caso base 2
        return 1;
    } else { // Paso recursivo
        return fibonacci(n - 1) + fibonacci(n - 2);
    }
}

// Ejemplo 3: Imprimir números de forma descendente (simple)
void cuentaRegresiva(int n) {
    if (n <= 0) { // Caso base
        std::cout << "¡Despegue!" << std::endl;
    } else { // Paso recursivo
        std::cout << n << "..." << std::endl;
        cuentaRegresiva(n - 1); // La función se llama a sí misma con un problema más pequeño
    }
}

int main() {
    // Probar la función factorial
    std::cout << "--- Factorial ---" << std::endl;
    std::cout << "Factorial de 5: " << factorial(5) << std::endl; // 5! = 5*4*3*2*1 = 120
    std::cout << "Factorial de 0: " << factorial(0) << std::endl; // 0! = 1
    std::cout << std::endl;

    // Probar la función fibonacci
    std::cout << "--- Fibonacci ---" << std::endl;
    std::cout << "Fibonacci(0): " << fibonacci(0) << std::endl; // 0
    std::cout << "Fibonacci(1): " << fibonacci(1) << std::endl; // 1
    std::cout << "Fibonacci(5): " << fibonacci(5) << std::endl; // 0, 1, 1, 2, 3, 5 -> 5
    std::cout << "Fibonacci(10): " << fibonacci(10) << std::endl; // 55
    std::cout << std::endl;

    // Probar la cuenta regresiva
    std::cout << "--- Cuenta Regresiva ---" << std::endl;
    cuentaRegresiva(3);
    std::cout << std::endl;

    // Un error común: Recursión infinita (sin caso base o caso base incorrecto)
    // void bucleInfinito(int n) {
    //     std::cout << "Llamada: " << n << std::endl;
    //     bucleInfinito(n + 1); // Nunca llega a un caso base
    // }
    // bucleInfinito(1); // Esto causaría un stack overflow.

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 4,
    'tittle_level': 'Funciones y Modularización',
    'topic': 'Organización del Código',
    'subtopic': 'Archivos de encabezado (.h) y de implementación (.cpp)',
    'definition': '''
A medida que tus proyectos de C++ crecen, mantener todo el código en un solo archivo `.cpp` se vuelve impráctico. Para organizar el código de manera eficiente, facilitar la reutilización y acelerar los tiempos de compilación, los proyectos de C++ se dividen típicamente en archivos de encabezado (`.h` o `.hpp`) y archivos de implementación (`.cpp`).

¿Cuál es la función de cada tipo de archivo?

* **Archivos de Encabezado (`.h` o `.hpp`)**: Estos archivos son como los "contratos" o "planos" de tu código. Contienen las **declaraciones** (prototipos) de funciones, las definiciones de clases, las declaraciones de variables globales, las definiciones de `enum`, `struct`, `typedef`, etc. En esencia, le dicen al compilador "qué" existe en tu programa sin revelar "cómo" está implementado. Cuando un archivo `.cpp` necesita usar algo definido en otro archivo, simplemente incluye su archivo de encabezado. La regla de oro es que todo lo que necesita ser conocido por múltiples archivos debe declararse en un archivo de encabezado.

* **Archivos de Implementación (`.cpp`)**: Estos archivos contienen las **definiciones** (las implementaciones reales) de las funciones declaradas en los archivos de encabezado, así como las definiciones de clases y la lógica del programa. Un archivo `.cpp` incluye los archivos de encabezado relevantes para poder acceder a las declaraciones que necesita. Cada archivo `.cpp` se compila de forma independiente en un "archivo objeto" (`.o` o `.obj`). Luego, un enlazador (`linker`) combina todos los archivos objeto para crear el ejecutable final.

Esta separación (`.h` para lo que se *declara* y `.cpp` para lo que se *define*) es la base de la modularización en C++, promoviendo la reutilización de código y haciendo los proyectos más manejables y fáciles de mantener.
''',
    'code_example': r'''
// --- Archivo de encabezado (ej: "calculadora.h") ---
// #ifndef CALCULADORA_H
// #define CALCULADORA_H

// #include <string> // Si se usa std::string en las declaraciones

// // Declaración de una función para sumar
// int sumar(int a, int b);

// // Declaración de una función para restar
// int restar(int a, int b);

// #endif // CALCULADORA_H

// --- Archivo de implementación (ej: "calculadora.cpp") ---
// #include "calculadora.h" // Incluye el archivo de encabezado correspondiente
// #include <iostream>      // Para usar std::cout si se necesita para depuración o mensajes internos

// // Definición de la función sumar
// int sumar(int a, int b) {
//     return a + b;
// }

// // Definición de la función restar
// int restar(int a, int b) {
//     return a - b;
// }

// --- Archivo principal (ej: "main.cpp") ---
#include <iostream>
#include "calculadora.h" // Incluye el encabezado para poder usar las funciones declaradas

int main() {
    int num1 = 10;
    int num2 = 5;

    int resultadoSuma = sumar(num1, num2);
    std::cout << "Suma: " << resultadoSuma << std::endl; // Salida: Suma: 15

    int resultadoResta = restar(num1, num2);
    std::cout << "Resta: " << resultadoResta << std::endl; // Salida: Resta: 5

    return 0;
}

/*
// Cómo se compilaría desde la línea de comandos (ej. con g++):
// g++ main.cpp calculadora.cpp -o mi_programa
// ./mi_programa

// Comentario: El compilador necesita ver las declaraciones en el .h
// cuando compila main.cpp, y las definiciones en el .cpp
// cuando compila calculadora.cpp. El enlazador las une al final.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 4,
    'tittle_level': 'Funciones y Modularización',
    'topic': 'Organización del Código',
    'subtopic': 'Directivas de preprocesador (#include, #define)',
    'definition': '''
Antes de que tu código C++ sea compilado, pasa por una fase llamada "preprocesamiento". El preprocesador es un programa que modifica tu código fuente basándose en directivas especiales que comienzan con `#`. Estas directivas no son parte del lenguaje C++ en sí, sino instrucciones para el preprocesador. Dos de las directivas más comunes e importantes son `#include` y `#define`.

¿Para qué sirven `#include` y `#define`?

* **`#include`**: Esta directiva es la que usamos para "incluir" el contenido de otro archivo directamente en el archivo actual. Cuando el preprocesador ve un `#include`, literalmente copia y pega el contenido del archivo especificado en ese punto.
    * `#include <nombre_archivo>`: Se usa para archivos de la biblioteca estándar (como `<iostream>`, `<vector>`). El compilador los busca en directorios predefinidos.
    * `#include "nombre_archivo"`: Se usa para tus propios archivos de encabezado. El compilador los busca primero en el directorio actual del archivo fuente.
    `#include` es fundamental para la modularización, permitiéndote reutilizar declaraciones y definiciones de otros archivos.

* **`#define`**: Esta directiva se usa para definir macros. Una macro es un fragmento de código al que se le da un nombre. Antes de la compilación, cada vez que el preprocesador encuentra ese nombre, lo reemplaza por el fragmento de código.
    * **Macros de objeto**: Simplemente reemplazan un nombre por un valor o una expresión (ej., `#define PI 3.14159`). Esto se usaba tradicionalmente para constantes, aunque `const` y `constexpr` son preferibles en C++ moderno por su seguridad de tipo.
    * **Macros de función**: Simulan funciones pero realizan un simple reemplazo de texto (ej., `#define CUADRADO(x) ((x)*(x))`). Las funciones `inline` y las plantillas son generalmente preferibles en C++ moderno.

Una aplicación crucial de `#define` es en los **guardas de inclusión** (`#ifndef`, `#define`, `#endif`) en los archivos de encabezado. Estos evitan que el mismo archivo de encabezado sea incluido varias veces en una sola unidad de compilación, lo que podría causar errores de redefinición.
''',
    'code_example': r'''
// --- Ejemplo de guarda de inclusión (parte de un .h) ---
// #ifndef MI_UTILIDAD_H
// #define MI_UTILIDAD_H
//
// void imprimirMensajeUtil();
//
// #endif // MI_UTILIDAD_H

#include <iostream> // Incluye la biblioteca estándar iostream (para entrada/salida)
#include <string>   // Incluye la biblioteca estándar string

// --- Ejemplo de #define para una constante (menos recomendado que 'const' en C++) ---
#define MAX_BUFFER_SIZE 1024
#define VERSION "1.0.0"

// --- Ejemplo de #define para una macro de función (menos recomendado que 'inline' o funciones) ---
#define MULTIPLICAR(a, b) ((a) * (b)) // Paréntesis importantes para evitar errores de precedencia

int main() {
    // Uso de lo incluido con #include
    std::cout << "Hola desde iostream y string." << std::endl;
    std::string nombre = "Usuario";
    std::cout << "Bienvenido, " << nombre << std::endl;

    // Uso de macros definidas con #define
    std::cout << "Tamaño máximo del buffer: " << MAX_BUFFER_SIZE << " bytes" << std::endl;
    std::cout << "Versión de la aplicación: " << VERSION << std::endl;

    int x = 5, y = 3;
    // El preprocesador reemplaza MULTIPLICAR(x, y) con ((x) * (y))
    std::cout << "Multiplicación con macro: " << MULTIPLICAR(x, y) << std::endl; // Salida: 15

    // Peligro de las macros si no se usan paréntesis
    // #define SUMAR_MAL(a, b) a + b
    // int res = SUMAR_MAL(2, 3) * 4; // Esto se expande a 2 + 3 * 4 = 2 + 12 = 14 (no (2+3)*4)
    // std::cout << "Suma mal (macro): " << res << std::endl; // Si la incluyeras, verías 14

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 4,
    'tittle_level': 'Funciones y Modularización',
    'topic': 'Organización del Código',
    'subtopic': 'Uso de namespaces',
    'definition': '''
A medida que trabajas en proyectos más grandes o utilizas bibliotecas de terceros, es muy probable que te encuentres con el problema de la "colisión de nombres". Esto ocurre cuando dos elementos diferentes (como funciones, clases o variables) en distintas partes del código tienen el mismo nombre, lo que confunde al compilador. Para resolver esto, C++ introdujo los **namespaces** (espacios de nombres).

¿Qué son los namespaces y cómo te ayudan a evitar conflictos de nombres?

Un `namespace` es un contenedor que te permite agrupar nombres relacionados. Es como un apellido para tus funciones y clases, que ayuda a distinguirlas de otras con el mismo nombre pero de diferentes "familias" o módulos. Por ejemplo, la biblioteca estándar de C++ usa el namespace `std`. Por eso, cuando usas `cout` o `endl`, necesitas escribir `std::cout` y `std::endl`, o usar `using namespace std;` para evitar escribir `std::` repetidamente.

Al colocar tu propio código dentro de un `namespace`, puedes evitar que los nombres que eliges para tus funciones, clases o variables entren en conflicto con nombres definidos en otras bibliotecas o en otras partes de tu propio proyecto.

Puedes declarar un `namespace` usando la palabra clave `namespace` seguida de un nombre y un bloque de código `{}`. Para acceder a los elementos dentro de un `namespace`, utilizas el operador de resolución de ámbito `::` (por ejemplo, `MiNamespace::miFuncion()`). Esto te permite tener un código más organizado, legible y robusto al prevenir problemas de nombres.
''',
    'code_example': r'''
#include <iostream>
#include <string>

// --- Definición de un namespace personalizado ---
namespace MiBiblioteca {
    int version = 1;

    void saludar() {
        std::cout << "Hola desde MiBiblioteca." << std::endl;
    }

    // Una función con un nombre común
    void imprimir(const std::string& mensaje) {
        std::cout << "MiBiblioteca::imprimir: " << mensaje << std::endl;
    }
} // fin del namespace MiBiblioteca

// --- Otro namespace con una función con el mismo nombre 'imprimir' ---
namespace OtraUtilidad {
    double version = 2.5;

    void imprimir(const std::string& mensaje) {
        std::cout << "OtraUtilidad::imprimir: " << mensaje << std::endl;
    }
} // fin del namespace OtraUtilidad

int main() {
    // Accediendo a elementos del namespace std
    std::cout << "--- Usando el namespace std ---" << std::endl;
    std::cout << "Mensaje de std::cout" << std::endl; // std::endl es un manipulador de std

    std::cout << std::endl;

    // Accediendo a elementos de MiBiblioteca de forma explícita
    std::cout << "--- Usando MiBiblioteca ---" << std::endl;
    MiBiblioteca::saludar();
    std::cout << "Versión de MiBiblioteca: " << MiBiblioteca::version << std::endl;
    MiBiblioteca::imprimir("Este es un mensaje específico de MiBiblioteca.");

    std::cout << std::endl;

    // Accediendo a elementos de OtraUtilidad de forma explícita
    std::cout << "--- Usando OtraUtilidad ---" << std::endl;
    OtraUtilidad::imprimir("Este es un mensaje específico de OtraUtilidad.");
    std::cout << "Versión de OtraUtilidad: " << OtraUtilidad::version << std::endl;

    // --- Uso de 'using namespace' para evitar escribir el prefijo ---
    // Esto se recomienda en archivos .cpp o dentro de funciones, no en archivos .h.
    using namespace MiBiblioteca; // Trae todos los nombres de MiBiblioteca al ámbito actual
    std::cout << "\n--- Usando 'using namespace MiBiblioteca' ---" << std::endl;
    saludar(); // Ahora podemos llamar directamente 'saludar()'
    std::cout << "Versión (sin prefijo): " << version << std::endl; // ¡Cuidado! 'version' ahora es de MiBiblioteca
    imprimir("Mensaje después de 'using namespace MiBiblioteca'."); // Llama a MiBiblioteca::imprimir

    // Si tuviéramos 'using namespace OtraUtilidad;' también, 'imprimir' sería ambiguo.
    // Error: llamada ambigua a la función sobrecargada 'imprimir'
    // using namespace OtraUtilidad;
    // imprimir("Esto daría error!");

    return 0;
}
'''
  });
}

Future<void> insertJrLevel5DataCpp(Database db) async {
  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 5,
    'tittle_level': 'Arreglos y Cadenas de Caracteres',
    'topic': 'Arreglos (Arrays)',
    'subtopic': 'Declaración e inicialización',
    'definition': '''
Cuando necesitas almacenar una colección de elementos del mismo tipo (por ejemplo, una lista de temperaturas, una serie de puntuaciones de exámenes o un conjunto de nombres de productos), crear una variable separada para cada elemento sería repetitivo e impráctico. Aquí es donde los **arreglos** (también conocidos como *arrays* en inglés) se vuelven muy útiles. Un arreglo es una estructura de datos que almacena un número fijo de elementos del mismo tipo en ubicaciones de memoria contiguas.

¿Cómo se declara y se inicializa un arreglo en C++?

La **declaración** de un arreglo implica especificar el tipo de los elementos que contendrá y el número de elementos que puede almacenar. La sintaxis general es `Tipo nombre_arreglo[tamaño];`. Por ejemplo, `int edades[5];` declara un arreglo llamado `edades` que puede almacenar 5 enteros. Es importante destacar que el `tamaño` debe ser una expresión constante conocida en tiempo de compilación.

La **inicialización** se refiere a darle valores a los elementos del arreglo. Puedes inicializar un arreglo de varias maneras:
* **Al momento de la declaración**: Puedes proporcionar una lista de valores entre llaves `{}`. Si proporcionas menos valores que el tamaño del arreglo, los elementos restantes se inicializan a cero (o al valor por defecto para su tipo). Por ejemplo, `int numeros[] = {1, 2, 3};` declara e inicializa un arreglo de 3 enteros, y el compilador deduce el tamaño.
* **Posteriormente, elemento por elemento**: Puedes asignar valores a cada posición individualmente después de la declaración, usando el operador de subíndice `[]`. Por ejemplo, `edades[0] = 20;`.

Los arreglos son la estructura de datos más básica para colecciones y son fundamentales para entender cómo se organizan los datos en memoria.
''',
    'code_example': r'''
#include <iostream>
#include <string> // Necesario para std::string

int main() {
    // 1. Declaración de un arreglo sin inicialización
    // Los valores serán "basura" (lo que haya en memoria en ese momento)
    int numeros[5];
    std::cout << "--- Arreglo declarado sin inicializar ---" << std::endl;
    std::cout << "Primer elemento (puede ser basura): " << numeros[0] << std::endl;
    // Esto se hace para demostrar, pero es una mala práctica usar valores no inicializados.
    std::cout << std::endl;

    // 2. Inicialización de un arreglo al momento de la declaración
    // El tamaño se deduce automáticamente (3 elementos)
    int puntuaciones[] = {95, 80, 72};
    std::cout << "--- Arreglo inicializado en la declaración ---" << std::endl;
    std::cout << "Puntuación 1: " << puntuaciones[0] << std::endl; // 0-indexado
    std::cout << "Puntuación 2: " << puntuaciones[1] << std::endl;
    std::cout << "Puntuación 3: " << puntuaciones[2] << std::endl;
    std::cout << "Tamaño del arreglo puntuaciones: " << sizeof(puntuaciones) / sizeof(puntuaciones[0]) << std::endl;
    std::cout << std::endl;

    // 3. Inicialización de un arreglo especificando tamaño y menos elementos
    // Los elementos restantes se inicializan a cero.
    double temperaturas[4] = {25.5, 28.0}; // temperaturas[2] y temperaturas[3] serán 0.0
    std::cout << "--- Arreglo inicializado parcialmente (restantes a cero) ---" << std::endl;
    std::cout << "Temperatura 1: " << temperaturas[0] << std::endl;
    std::cout << "Temperatura 2: " << temperaturas[1] << std::endl;
    std::cout << "Temperatura 3: " << temperaturas[2] << std::endl;
    std::cout << "Temperatura 4: " << temperaturas[3] << std::endl;
    std::cout << std::endl;

    // 4. Declaración y luego inicialización elemento por elemento
    char vocales[5];
    vocales[0] = 'a';
    vocales[1] = 'e';
    vocales[2] = 'i';
    vocales[3] = 'o';
    vocales[4] = 'u';
    std::cout << "--- Arreglo inicializado elemento por elemento ---" << std::endl;
    std::cout << "Vocal 1: " << vocales[0] << std::endl;
    std::cout << "Vocal 5: " << vocales[4] << std::endl;
    std::cout << std::endl;

    // Un error común: Acceder fuera de los límites del arreglo
    // int miArray[3] = {10, 20, 30};
    // std::cout << miArray[3] << std::endl; // ¡ERROR! Esto es acceder fuera de los límites (índices válidos: 0, 1, 2)
    // Esto resulta en comportamiento indefinido y puede causar un crash.

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 5,
    'tittle_level': 'Arreglos y Cadenas de Caracteres',
    'topic': 'Arreglos (Arrays)',
    'subtopic': 'Acceso y modificación de elementos',
    'definition': '''
Una vez que has declarado e inicializado un arreglo, la forma más común de interactuar con sus elementos individuales es a través de sus índices. Los arreglos en C++ (y en la mayoría de los lenguajes de programación) son **basados en cero**, lo que significa que el primer elemento está en el índice `0`, el segundo en el índice `1`, y así sucesivamente, hasta el último elemento que estará en el índice `tamaño - 1`.

¿Cómo se accede a los elementos de un arreglo y se modifican sus valores?

Para **acceder** a un elemento específico, usas el nombre del arreglo seguido de corchetes `[]` que contienen el índice del elemento al que quieres acceder. Por ejemplo, si tienes `int miArray[5];`, `miArray[0]` te dará el valor del primer elemento, y `miArray[4]` te dará el valor del quinto y último elemento.

Para **modificar** un elemento, simplemente usas la misma sintaxis de acceso y el operador de asignación (`=`) para darle un nuevo valor. Por ejemplo, `miArray[0] = 100;` cambiará el valor del primer elemento a 100.

Es crucial recordar que C++ no realiza automáticamente una "verificación de límites" para los accesos a arreglos con el operador `[]`. Si intentas acceder a un índice fuera del rango válido (por ejemplo, `miArray[5]` en un arreglo de tamaño 5), el comportamiento es **indefinido**. Esto puede llevar a errores difíciles de depurar, como lecturas de memoria aleatoria o corrupción de memoria, por lo que siempre debes asegurarte de que tus accesos estén dentro de los límites del arreglo.
''',
    'code_example': r'''
#include <iostream>
#include <string>

int main() {
    // Declaración e inicialización de un arreglo
    int numeros[5] = {10, 20, 30, 40, 50};

    std::cout << "--- Acceso a elementos del arreglo ---" << std::endl;
    // Acceder al primer elemento (índice 0)
    std::cout << "Primer elemento (indice 0): " << numeros[0] << std::endl; // Salida: 10

    // Acceder al tercer elemento (índice 2)
    std::cout << "Tercer elemento (indice 2): " << numeros[2] << std::endl; // Salida: 30

    // Acceder al último elemento (índice tamaño - 1)
    std::cout << "Último elemento (indice 4): " << numeros[4] << std::endl; // Salida: 50
    std::cout << std::endl;

    std::cout << "--- Modificación de elementos del arreglo ---" << std::endl;
    // Modificar el primer elemento
    numeros[0] = 100;
    std::cout << "Nuevo valor del primer elemento: " << numeros[0] << std::endl; // Salida: 100

    // Modificar el último elemento
    numeros[4] = 500;
    std::cout << "Nuevo valor del último elemento: " << numeros[4] << std::endl; // Salida: 500
    std::cout << std::endl;

    std::cout << "--- Contenido del arreglo después de modificaciones ---" << std::endl;
    // Imprimir todos los elementos para ver los cambios
    for (int i = 0; i < 5; i++) {
        std::cout << "numeros[" << i << "]: " << numeros[i] << std::endl;
    }
    std::cout << std::endl;

    // Advertencia: Acceso fuera de los límites del arreglo (COMPORTAMIENTO INDEFINIDO)
    // int miArray[3] = {1, 2, 3};
    // std::cout << "Acceso fuera de limites (miArray[3]): " << miArray[3] << std::endl; // ¡Peligro!
    // Esto podría imprimir un valor aleatorio, causar un fallo, o comportarse de forma inesperada.
    // Siempre asegúrate de que el índice esté entre 0 y tamaño-1.

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 5,
    'tittle_level': 'Arreglos y Cadenas de Caracteres',
    'topic': 'Arreglos (Arrays)',
    'subtopic': 'Iteración sobre arreglos',
    'definition': '''
Una de las tareas más comunes con los arreglos es procesar cada uno de sus elementos. Esto se logra mediante la **iteración** (o "recorrido") sobre el arreglo, lo que significa visitar cada elemento en secuencia, generalmente desde el primero hasta el último.

¿Cómo se recorren los elementos de un arreglo en C++?

La forma más estándar y tradicional de iterar sobre un arreglo en C++ es utilizando un **bucle `for`**. El bucle `for` es ideal para esto porque te permite controlar fácilmente un contador que va desde el primer índice (0) hasta el último (`tamaño - 1`). La estructura típica es:

```cpp
for (int i = 0; i < tamaño_del_arreglo; i++) {
    // Acceder al elemento: arreglo[i]
}
Aquí:

int i = 0;: Inicializa el índice en el primer elemento.
i < tamaño_del_arreglo;: La condición para continuar el bucle es que el índice sea menor que el tamaño total (así llegamos hasta tamaño - 1).
i++: Incrementa el índice para pasar al siguiente elemento en cada iteración.
Desde C++11, también existe el bucle for basado en rango (range-based for loop), que es mucho más conciso y menos propenso a errores al recorrer colecciones. La sintaxis es:

C++

for (Tipo elemento : arreglo) {
    // 'elemento' toma el valor de cada elemento del arreglo
}
Este bucle itera automáticamente sobre todos los elementos del arreglo, y en cada iteración, elemento toma el valor del elemento actual. Es preferible cuando no necesitas el índice del elemento. Ambos métodos son fundamentales para procesar colecciones de datos almacenadas en arreglos.
''',
    'code_example': r'''
#include &lt;iostream>
#include &lt;string> // Necesario para std::string
#include &lt;numeric> // Para std::accumulate (suma elementos de un rango)

int main() {
int numeros[] = {10, 20, 30, 40, 50};
// Calcular el tamaño del arreglo (solo funciona para arreglos C-style estáticos)
const int TAMANIO = sizeof(numeros) / sizeof(numeros[0]);

std::cout << "--- Iteración usando bucle 'for' tradicional ---" << std::endl;
for (int i = 0; i < TAMANIO; i++) {
    std::cout << "Elemento en indice " << i << ": " << numeros[i] << std::endl;
}
std::cout << std::endl;

std::cout << "--- Iteración usando bucle 'for' basado en rango (C++11 en adelante) ---" << std::endl;
// Esto es más conciso y menos propenso a errores de límites
for (int num : numeros) { // 'num' es una copia del elemento actual
    std::cout << "Elemento: " << num << std::endl;
}
std::cout << std::endl;

// Si necesitas modificar los elementos usando el for basado en rango, usa una referencia (&)
std::cout << "--- Modificación con for basado en rango (usando referencia) ---" << std::endl;
for (int& num : numeros) { // 'num' es ahora una referencia al elemento actual
    num += 1; // Incrementa cada elemento en 1
}
// Vuelve a imprimir para ver los cambios
for (int num : numeros) {
    std::cout << "Elemento modificado: " << num << std::endl;
}
std::cout << std::endl;

// Ejemplo: Calcular la suma de elementos de un arreglo
int suma = 0;
for (int i = 0; i < TAMANIO; i++) {
    suma += numeros[i];
}
std::cout << "Suma de los elementos del arreglo (for tradicional): " << suma << std::endl;

// Otra forma de sumar (usando for-range y <numeric> que veremos más adelante)
int suma_range = 0;
for (int num : numeros) {
    suma_range += num;
}
std::cout << "Suma de los elementos del arreglo (for basado en rango): " << suma_range << std::endl;

return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 5,
    'tittle_level': 'Arreglos y Cadenas de Caracteres',
    'topic': 'Cadenas de Caracteres (Strings)',
    'subtopic': 'Cadenas estilo C (char arrays)',
    'definition': '''
Antes de que la clase `std::string` fuera una parte estándar de C++, las cadenas de caracteres se manejaban principalmente utilizando arreglos de caracteres, a menudo llamados **cadenas estilo C** o cadenas *C-style*. Aunque `std::string` es la forma preferida en C++ moderno, entender las cadenas estilo C es crucial porque todavía se encuentran en código legado, en interfaces con bibliotecas de C, y para comprender cómo funcionan las cadenas a un nivel más bajo.

¿Cómo se representan y manipulan las cadenas estilo C?

Una cadena estilo C es esencialmente un arreglo de caracteres (`char`) que **termina con un carácter nulo** (`'\\0'`). Este carácter nulo es vital porque indica el final de la cadena, permitiendo a las funciones que trabajan con cadenas saber dónde detenerse.

Puedes declarar e inicializar una cadena estilo C de varias maneras:
* `char nombre[10];`: Declara un arreglo de 10 caracteres. No inicializa nada, así que necesitas asegurarte de que termines la cadena con `\\0`.
* `char saludo[] = "Hola";`: Declara e inicializa un arreglo con los caracteres 'H', 'o', 'l', 'a' y automáticamente le añade el '\\0' al final. El tamaño del arreglo será 5.
* `char mensaje[6] = {'H', 'o', 'l', 'a', '\\0'};`: Inicialización explícita, incluyendo el nulo.

Las operaciones con estas cadenas no son tan intuitivas como con `std::string` y a menudo requieren el uso de funciones de la biblioteca `<cstring>` (como `strcpy`, `strcat`, `strlen`, `strcmp`), las cuales son propensas a errores si no se manejan con cuidado los tamaños de los arreglos (riesgo de desbordamiento de buffer). Aunque potentes, su manejo manual de memoria y el riesgo de errores hacen que `std::string` sea la opción preferida para la mayoría de las tareas.
''',
    'code_example': r'''
#include <iostream> // Para std::cout
#include <cstring>  // Para funciones de manipulación de cadenas estilo C (strcpy, strlen, strcat, strcmp)

int main() {
    // 1. Declaración e inicialización de cadenas estilo C
    char saludo[] = "Hola Mundo"; // El compilador añade automáticamente el '\0'
    char nombre[20]; // Un arreglo de 20 caracteres para almacenar un nombre

    std::cout << "--- Cadenas estilo C ---" << std::endl;
    std::cout << "Saludo: " << saludo << std::endl;

    // 2. Copiar una cadena (¡Cuidado con el tamaño del buffer!)
    // strcpy(destino, origen) - No verifica el tamaño del destino.
    //strncpy(destino, origen, n) - Copia hasta n caracteres, es más seguro.
    strcpy(nombre, "Juan"); // Copia "Juan" en 'nombre'.
                            // Asegúrate de que 'nombre' tenga suficiente espacio para "Juan" + '\0'.
    std::cout << "Nombre copiado: " << nombre << std::endl;

    // 3. Longitud de una cadena (strlen no cuenta el '\0')
    size_t longitud_saludo = strlen(saludo);
    std::cout << "Longitud del saludo: " << longitud_saludo << std::endl; // Salida: 10

    // 4. Concatenación de cadenas (¡También cuidado con el tamaño del buffer!)
    char mensaje[50] = "Buenos "; // Mensaje inicial
    strcat(mensaje, "dias, ");    // Concatena "dias, "
    strcat(mensaje, nombre);      // Concatena el contenido de 'nombre' ("Juan")
    strcat(mensaje, "!");        // Concatena "!"
    std::cout << "Mensaje concatenado: " << mensaje << std::endl; // Salida: Buenos dias, Juan!

    // 5. Comparación de cadenas (strcmp)
    // Retorna 0 si son iguales, < 0 si str1 < str2, > 0 si str1 > str2 lexicográficamente
    char str1[] = "manzana";
    char str2[] = "manzana";
    char str3[] = "banana";

    if (strcmp(str1, str2) == 0) {
        std::cout << "'" << str1 << "' y '" << str2 << "' son iguales." << std::endl;
    }
    if (strcmp(str1, str3) > 0) {
        std::cout << "'" << str1 << "' es mayor que '" << str3 << "'." << std::endl;
    }
    std::cout << std::endl;

    // Advertencia: Desbordamiento de buffer (MUY PELIGROSO)
    // char buffer[5];
    // strcpy(buffer, "Hola Mundo Largo"); // Esto sobrescribirá la memoria adyacente y puede causar un crash.
    // NUNCA HAGAS ESTO SIN ASEGURARTE DEL TAMAÑO.

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 5,
    'tittle_level': 'Arreglos y Cadenas de Caracteres',
    'topic': 'Cadenas de Caracteres (Strings)',
    'subtopic': 'Clase std::string',
    'definition': '''
Mientras que las cadenas estilo C (`char arrays`) son fundamentales y se encuentran en código legado, la forma moderna y segura de manejar texto en C++ es a través de la **clase `std::string`**. Esta clase, parte de la biblioteca estándar de C++ (`<string>`), abstrae la complejidad del manejo de memoria y los detalles de las cadenas de caracteres, proporcionando una interfaz mucho más segura, flexible y fácil de usar.

¿Por qué `std::string` es preferible a las cadenas estilo C?

`std::string` es una clase diseñada para representar secuencias de caracteres. Las principales ventajas son:
* **Manejo automático de memoria**: No tienes que preocuparte por asignar o liberar memoria, ni por desbordamientos de buffer. `std::string` se encarga de redimensionar su almacenamiento automáticamente cuando la cadena crece o se encoge.
* **Facilidad de uso**: Proporciona métodos y operadores intuitivos para operaciones comunes como concatenación (`+`), asignación (`=`), comparación (`==`, `<`, `>`), acceso a caracteres individuales (`[]` o `at()`), búsqueda, y mucho más.
* **Seguridad**: Reduce drásticamente los errores comunes asociados con el manejo manual de `char arrays`, como desbordamientos de buffer o no terminar la cadena con `\\0`.

`std::string` es el tipo de cadena de caracteres que usarás en la mayoría de tus proyectos de C++ modernos, a menos que tengas una razón específica para interactuar con APIs de C o hardware de bajo nivel que requieran cadenas estilo C.
''',
    'code_example': r'''
#include <iostream> // Para std::cout, std::cin
#include <string>   // ¡Fundamental para usar std::string!

int main() {
    // 1. Declaración e inicialización de std::string
    std::string saludo = "Hola, "; // Inicialización directa
    std::string nombre;             // Declaración sin inicializar
    std::string mensajeCompleto;    // Otra declaración

    std::cout << "--- Clase std::string ---" << std::endl;
    std::cout << "Por favor, ingresa tu nombre: ";
    // Leer una línea completa, incluyendo espacios (cin detiene en el primer espacio)
    std::getline(std::cin, nombre);

    // 2. Concatenación de std::string (usando operador +)
    mensajeCompleto = saludo + nombre + "!";
    std::cout << "Saludo personalizado: " << mensajeCompleto << std::endl;

    // 3. Obtener la longitud de la cadena
    std::cout << "Longitud del saludo: " << saludo.length() << std::endl; // o .size()
    std::cout << "Longitud del mensaje completo: " << mensajeCompleto.length() << std::endl;
    std::cout << std::endl;

    // 4. Acceso a caracteres individuales (como un arreglo)
    // std::string también es 0-indexada
    if (!mensajeCompleto.empty()) { // Verifica si no está vacía antes de acceder
        std::cout << "Primer caracter del mensaje: " << mensajeCompleto[0] << std::endl;
        std::cout << "Último caracter del mensaje: " << mensajeCompleto[mensajeCompleto.length() - 1] << std::endl;
    }

    // Acceso seguro con .at() (lanza excepción si el índice es inválido)
    try {
        std::cout << "Caracter en indice 5: " << mensajeCompleto.at(5) << std::endl;
        // std::cout << "Caracter en indice 100: " << mensajeCompleto.at(100) << std::endl; // Esto lanzaría out_of_range
    } catch (const std::out_of_range& e) {
        std::cerr << "Error al acceder a caracter: " << e.what() << std::endl;
    }
    std::cout << std::endl;

    // 5. Comparación de std::string (usando operadores de comparación)
    std::string strA = "apple";
    std::string strB = "banana";
    std::string strC = "apple";

    if (strA == strC) {
        std::cout << "'" << strA << "' es igual a '" << strC << "'." << std::endl;
    }
    if (strA < strB) {
        std::cout << "'" << strA << "' viene antes de '" << strB << "' alfabéticamente." << std::endl;
    }
    std::cout << std::endl;

    // 6. Búsqueda de subcadenas
    std::string texto = "El rápido zorro marrón salta sobre el perro perezoso.";
    std::string buscar = "zorro";
    size_t pos = texto.find(buscar); // find retorna npos si no lo encuentra

    if (pos != std::string::npos) {
        std::cout << "Se encontró '" << buscar << "' en la posición: " << pos << std::endl;
    } else {
        std::cout << "'" << buscar << "' no se encontró." << std::endl;
    }
    std::cout << std::endl;

    // 7. Subcadenas (substr)
    std::string sub = texto.substr(3, 7); // Empieza en índice 3, toma 7 caracteres
    std::cout << "Subcadena: '" << sub << "'" << std::endl; // Salida: rápido

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 5,
    'tittle_level': 'Arreglos y Cadenas de Caracteres',
    'topic': 'Cadenas de Caracteres (Strings)',
    'subtopic': 'Operaciones comunes (concatenación, búsqueda, longitud)',
    'definition': '''
La clase `std::string` no solo simplifica el manejo de cadenas al automatizar la memoria, sino que también ofrece un rico conjunto de operaciones que hacen que trabajar con texto sea mucho más fácil y seguro que con las cadenas estilo C. Estas operaciones están integradas directamente como métodos de la clase o a través de operadores sobrecargados.

¿Cuáles son las operaciones más frecuentes que puedes realizar con `std::string`?

* **Concatenación**: Unir dos o más cadenas. La forma más intuitiva es usando el operador `+` o el operador `+=`.
    * Ej: `std::string s1 = "Hola"; std::string s2 = "Mundo"; std::string s3 = s1 + s2;`
* **Longitud**: Obtener el número de caracteres en la cadena.
    * Métodos: `length()` o `size()`. Ambos devuelven el mismo valor.
* **Acceso a caracteres**: Acceder a un carácter específico por su posición (índice).
    * Operador `[]`: `miString[indice]`. Rápido pero no verifica límites.
    * Método `at()`: `miString.at(indice)`. Más seguro, lanza `std::out_of_range` si el índice es inválido.
* **Comparación**: Determinar si dos cadenas son iguales o cuál precede a la otra alfabéticamente.
    * Operadores: `==`, `!=`, `<`, `<=`, `>`, `>=`. Funcionan como esperarías para comparación lexicográfica.
* **Búsqueda**: Encontrar la posición de una subcadena o carácter dentro de una cadena.
    * Método `find()`: Busca la primera ocurrencia. Retorna la posición o `std::string::npos` si no se encuentra.
    * Método `rfind()`: Busca la última ocurrencia.
* **Subcadenas**: Extraer una parte de una cadena.
    * Método `substr(pos, len)`: Retorna una nueva cadena que es una subcadena, empezando en `pos` y con longitud `len`.
* **Inserción/Borrado/Reemplazo**: Modificar la cadena insertando, eliminando o reemplazando partes de ella.
    * Métodos: `insert()`, `erase()`, `replace()`.
* **Vacío**: Comprobar si una cadena está vacía.
    * Método `empty()`: Retorna `true` si la cadena no contiene caracteres.

Estas operaciones hacen que `std::string` sea una herramienta poderosa y eficiente para cualquier manipulación de texto en tus programas C++.
''',
    'code_example': r'''
#include <iostream>
#include <string>   // Para std::string
#include <algorithm> // Para std::reverse (usado en ejemplo de modificación)

int main() {
    std::string s1 = "Hola";
    std::string s2 = " Mundo";
    std::string s3 = "C++ Programación";

    std::cout << "--- Operaciones Comunes con std::string ---" << std::endl;

    // 1. Concatenación
    std::string s_concatenada = s1 + s2; // Usando operador +
    std::cout << "Concatenación (+): " << s_concatenada << std::endl; // Salida: Hola Mundo

    s1 += " Cruel"; // Usando operador +=
    std::cout << "Concatenación (+=): " << s1 << std::endl; // Salida: Hola Cruel

    std::cout << std::endl;

    // 2. Longitud de la cadena
    std::cout << "Longitud de '" << s_concatenada << "': " << s_concatenada.length() << std::endl;
    std::cout << "Longitud de '" << s3 << "': " << s3.size() << std::endl; // size() es igual a length()

    std::cout << std::endl;

    // 3. Acceso a caracteres
    std::cout << "Primer caracter de '" << s3 << "': " << s3[0] << std::endl;
    std::cout << "Caracter en indice 3 de '" << s3 << "': " << s3.at(3) << std::endl;

    // Captura de error para .at()
    try {
        std::cout << "Caracter en indice 50 (error): " << s3.at(50) << std::endl;
    } catch (const std::out_of_range& e) {
        std::cerr << "Error al acceder con .at(): " << e.what() << std::endl;
    }

    std::cout << std::endl;

    // 4. Búsqueda de subcadenas (find, rfind)
    std::string texto_busqueda = "Esto es una cadena para realizar busquedas, es una buena cadena.";
    std::string subcadena_a_buscar = "cadena";

    size_t pos_primera = texto_busqueda.find(subcadena_a_buscar);
    if (pos_primera != std::string::npos) {
        std::cout << "Primera ocurrencia de '" << subcadena_a_buscar << "' en: " << pos_primera << std::endl;
    }

    size_t pos_ultima = texto_busqueda.rfind(subcadena_a_buscar);
    if (pos_ultima != std::string::npos) {
        std::cout << "Última ocurrencia de '" << subcadena_a_buscar << "' en: " << pos_ultima << std::endl;
    }

    std::cout << std::endl;

    // 5. Subcadenas (substr)
    std::string original = "Hola mundo C++";
    std::string sub1 = original.substr(0, 4);  // "Hola" (desde 0, 4 caracteres)
    std::string sub2 = original.substr(5, 5);  // "mundo" (desde 5, 5 caracteres)
    std::string sub3 = original.substr(11);   // "C++" (desde 11 hasta el final)

    std::cout << "Original: '" << original << "'" << std::endl;
    std::cout << "Subcadena 1: '" << sub1 << "'" << std::endl;
    std::cout << "Subcadena 2: '" << sub2 << "'" << std::endl;
    std::cout << "Subcadena 3: '" << sub3 << "'" << std::endl;

    std::cout << std::endl;

    // 6. Inserción, Borrado, Reemplazo (Ejemplos rápidos)
    std::string mutable_str = "C es genial!";
    mutable_str.insert(1, "++"); // Inserta "++" en la posición 1
    std::cout << "Después de insert: " << mutable_str << std::endl; // Salida: C++ es genial!

    mutable_str.erase(0, 3); // Borra 3 caracteres desde la posición 0 ("C++")
    std::cout << "Después de erase: " << mutable_str << std::endl; // Salida:  es genial! (espacio al principio)

    mutable_str.replace(0, 2, "C++"); // Reemplaza 2 caracteres desde pos 0 con "C++"
    std::cout << "Después de replace: " << mutable_str << std::endl; // Salida: C++ genial!

    std::cout << std::endl;

    // 7. Comprobar si está vacía
    std::string vacia;
    std::string no_vacia = "abc";
    std::cout << "vacia.empty(): " << (vacia.empty() ? "true" : "false") << std::endl;
    std::cout << "no_vacia.empty(): " << (no_vacia.empty() ? "true" : "false") << std::endl;

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 5,
    'tittle_level': 'Arreglos y Cadenas de Caracteres',
    'topic': 'Cadenas de Caracteres (Strings)',
    'subtopic': 'Operaciones comunes (concatenación, búsqueda, longitud)',
    'definition': '''
La clase `std::string` no solo simplifica el manejo de cadenas al automatizar la memoria, sino que también ofrece un rico conjunto de operaciones que hacen que trabajar con texto sea mucho más fácil y seguro que con las cadenas estilo C. Estas operaciones están integradas directamente como métodos de la clase o a través de operadores sobrecargados.

¿Cuáles son las operaciones más frecuentes que puedes realizar con `std::string`?

* **Concatenación**: Unir dos o más cadenas para formar una nueva. Es una de las operaciones más fundamentales.
    * Puedes usar el operador `+` para unir dos `std::string` o un `std::string` con un literal de cadena (o `char array`).
    * También puedes usar el operador `+=` para añadir una cadena al final de otra existente.
* **Longitud**: Obtener el número de caracteres presentes en la cadena. Esto es crucial para iterar sobre la cadena, asignar memoria o validar entradas.
    * Los métodos `length()` y `size()` son los más comunes para este propósito y devuelven el mismo valor.
* **Búsqueda**: Localizar la posición de una subcadena o un carácter específico dentro de una cadena más grande.
    * El método `find()` busca la primera ocurrencia de una subcadena o carácter. Si lo encuentra, devuelve la posición (índice) de inicio; de lo contrario, retorna `std::string::npos`, que es una constante que indica "no encontrado".
    * El método `rfind()` hace lo mismo, pero busca la última ocurrencia.
* **Acceso a caracteres individuales**: Recuperar o modificar un carácter específico de la cadena basándose en su posición.
    * El operador `[]` (corchetes) permite acceder a un carácter como si fuera un arreglo. Es rápido, pero no realiza verificación de límites, lo que puede llevar a errores si el índice está fuera de rango.
    * El método `at()` también permite acceder a un carácter, pero es más seguro, ya que lanza una excepción `std::out_of_range` si el índice es inválido.
* **Subcadenas**: Extraer una porción de una cadena para crear una nueva cadena.
    * El método `substr(pos, len)` crea una nueva `std::string` que es una copia de una parte de la cadena original, comenzando en `pos` (índice) y extrayendo `len` caracteres. Si `len` se omite, extrae hasta el final de la cadena.

Estas operaciones son la base para cualquier manipulación de texto compleja en C++ y hacen de `std::string` una herramienta poderosa y eficiente.
''',
    'code_example': r'''
#include <iostream>
#include <string>   // Fundamental para usar std::string

int main() {
    std::string s1 = "Hola";
    std::string s2 = " Mundo";
    std::string s3 = "C++ Programación Avanzada";

    std::cout << "--- Operaciones Comunes con std::string ---" << std::endl;

    // 1. Concatenación
    std::string s_concatenada = s1 + s2; // Usando operador +
    std::cout << "Concatenación (+): '" << s_concatenada << "'" << std::endl; // Salida: 'Hola Mundo'

    s1 += " Cruel"; // Usando operador +=
    std::cout << "Concatenación (+=): '" << s1 << "'" << std::endl; // Salida: 'Hola Cruel'

    std::cout << std::endl;

    // 2. Longitud de la cadena
    std::cout << "Longitud de '" << s_concatenada << "': " << s_concatenada.length() << std::endl;
    std::cout << "Longitud de '" << s3 << "': " << s3.size() << std::endl; // .size() es idéntico a .length()

    std::cout << std::endl;

    // 3. Búsqueda de subcadenas (find, rfind)
    std::string texto_busqueda = "El rápido zorro marrón salta sobre el perro perezoso.";
    std::string buscar_zorro = "zorro";
    std::string buscar_gato = "gato";

    size_t pos_zorro = texto_busqueda.find(buscar_zorro);
    if (pos_zorro != std::string::npos) { // std::string::npos indica que no se encontró
        std::cout << "Primera ocurrencia de '" << buscar_zorro << "' en la posición: " << pos_zorro << std::endl;
    } else {
        std::cout << "'" << buscar_zorro << "' no se encontró." << std::endl;
    }

    size_t pos_perro = texto_busqueda.find("perro"); // Buscar un literal
    std::cout << "Ocurrencia de 'perro' en: " << pos_perro << std::endl; // Salida: Ocurrencia de 'perro' en: 41

    size_t pos_no_encontrado = texto_busqueda.find(buscar_gato);
    if (pos_no_encontrado == std::string::npos) {
        std::cout << "'" << buscar_gato << "' no se encontró (retornó npos)." << std::endl;
    }

    std::cout << std::endl;

    // 4. Acceso a caracteres individuales ([], at())
    if (!s3.empty()) { // Buena práctica: verificar si la cadena no está vacía
        std::cout << "Primer caracter de '" << s3 << "': " << s3[0] << std::endl; // C
        std::cout << "Caracter en índice 4 de '" << s3 << "': " << s3.at(4) << std::endl; // P
    }

    // Acceso seguro con .at() (manejo de excepción para índice fuera de rango)
    try {
        // Esto lanzaría una std::out_of_range si el índice es > s3.length() - 1
        std::cout << "Intentando acceder a índice 50: " << s3.at(50) << std::endl;
    } catch (const std::out_of_range& e) {
        std::cerr << "Error: Acceso fuera de rango con .at(): " << e.what() << std::endl;
    }

    std::cout << std::endl;

    // 5. Subcadenas (substr)
    std::string original = "Programacion en C++ moderno";
    // Extraer "C++"
    std::string subcadena_cpp = original.substr(16, 3); // Empieza en índice 16, 3 caracteres
    std::cout << "Original: '" << original << "'" << std::endl;
    std::cout << "Subcadena 'C++': '" << subcadena_cpp << "'" << std::endl; // Salida: 'C++'

    // Extraer "Programacion"
    std::string subcadena_prog = original.substr(0, 12); // Empieza en índice 0, 12 caracteres
    std::cout << "Subcadena 'Programacion': '" << subcadena_prog << "'" << std::endl; // Salida: 'Programacion'

    // Extraer desde un punto hasta el final
    std::string subcadena_final = original.substr(19); // Desde índice 19 hasta el final
    std::cout << "Subcadena 'moderno': '" << subcadena_final << "'" << std::endl; // Salida: 'moderno'

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 5,
    'tittle_level': 'Arreglos y Cadenas de Caracteres',
    'topic': 'Vectores (std::vector)',
    'subtopic': 'Introducción a vectores',
    'definition': '''
Si bien los arreglos (arrays C-style) son fundamentales para entender cómo se organizan los datos en memoria, tienen una limitación importante: su tamaño es fijo y debe ser conocido en tiempo de compilación. Esto significa que una vez que declaras un arreglo, no puedes cambiar su tamaño si necesitas almacenar más o menos elementos. Aquí es donde entra en juego `std::vector`, la estructura de datos más versátil y ampliamente utilizada para colecciones dinámicas en C++.

¿Qué es `std::vector` y por qué es una alternativa superior a los arreglos tradicionales?

`std::vector` es una plantilla de clase que forma parte de la Biblioteca Estándar de Plantillas (STL por sus siglas en inglés: Standard Template Library) de C++. A diferencia de los arreglos estáticos, un `std::vector` es un **arreglo dinámico**. Esto significa que puede crecer o encogerse en tiempo de ejecución, según sea necesario. Cuando añades elementos a un vector y este se queda sin espacio, automáticamente asigna más memoria para acomodar los nuevos elementos (generalmente duplicando su capacidad para eficiencia).

Las principales ventajas de `std::vector` son:
* **Tamaño dinámico**: No necesitas saber de antemano cuántos elementos vas a almacenar.
* **Seguridad**: Proporciona métodos para verificar límites (como `at()`), reduciendo el riesgo de errores de acceso a memoria.
* **Funcionalidades ricas**: Incluye muchos métodos útiles para añadir, eliminar, buscar, ordenar elementos, etc.
* **Contigüidad en memoria**: Al igual que los arreglos C-style, los elementos de un `std::vector` se almacenan en ubicaciones de memoria contiguas, lo que permite un acceso muy eficiente (acceso aleatorio O(1)).

`std::vector` es el "caballo de batalla" para manejar colecciones de datos en C++ moderno, siendo la primera opción en la mayoría de los casos donde se requiere una lista de elementos del mismo tipo.
''',
    'code_example': r'''
#include <iostream>
#include <vector> // ¡Necesario para usar std::vector!
#include <string> // Para usar std::string como tipo de elemento

int main() {
    // 1. Declaración de un vector (vacío)
    std::vector<int> numeros_enteros; // Un vector que contendrá enteros

    // 2. Declaración e inicialización con algunos elementos
    std::vector<std::string> frutas = {"Manzana", "Banana", "Cereza"};

    // 3. Declaración e inicialización con un tamaño fijo y valor por defecto
    // Un vector de 5 elementos, todos inicializados a 0
    std::vector<double> temperaturas(5, 0.0);

    std::cout << "--- Introducción a std::vector ---" << std::endl;

    // Verificar si los vectores están vacíos y su tamaño
    std::cout << "numeros_enteros esta vacio? " << (numeros_enteros.empty() ? "Si" : "No") << std::endl;
    std::cout << "Tamanio de numeros_enteros: " << numeros_enteros.size() << std::endl;

    std::cout << "frutas esta vacio? " << (frutas.empty() ? "Si" : "No") << std::endl;
    std::cout << "Tamanio de frutas: " << frutas.size() << std::endl;

    std::cout << "temperaturas esta vacio? " << (temperaturas.empty() ? "Si" : "No") << std::endl;
    std::cout << "Tamanio de temperaturas: " << temperaturas.size() << std::endl;
    std::cout << "Primer elemento de temperaturas: " << temperaturas[0] << std::endl; // Acceso directo

    std::cout << std::endl;

    // Añadir elementos a un vector vacío (demostración de tamaño dinámico)
    std::cout << "--- Anadiendo elementos a numeros_enteros ---" << std::endl;
    numeros_enteros.push_back(10); // Añade 10 al final
    numeros_enteros.push_back(20); // Añade 20 al final
    numeros_enteros.push_back(30); // Añade 30 al final

    std::cout << "Tamanio de numeros_enteros ahora: " << numeros_enteros.size() << std::endl;
    std::cout << "Primer elemento de numeros_enteros: " << numeros_enteros[0] << std::endl;
    std::cout << "Último elemento de numeros_enteros: " << numeros_enteros[numeros_enteros.size() - 1] << std::endl;
    std::cout << std::endl;

    // Acceder a elementos (como un array, pero con más seguridad)
    std::cout << "--- Acceso a elementos de frutas ---" << std::endl;
    std::cout << "La segunda fruta es: " << frutas[1] << std::endl; // Banana
    // Usar .at() para acceso seguro
    try {
        std::cout << "La tercera fruta es: " << frutas.at(2) << std::endl; // Cereza
        // Esto lanzaría una excepción si el índice fuera 100
        // std::cout << "Fruta en indice 100: " << frutas.at(100) << std::endl;
    } catch (const std::out_of_range& e) {
        std::cerr << "Error de acceso: " << e.what() << std::endl;
    }

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 5,
    'tittle_level': 'Arreglos y Cadenas de Caracteres',
    'topic': 'Vectores (std::vector)',
    'subtopic': 'Métodos comunes (push_back, size, clear)',
    'definition': '''
La verdadera potencia de `std::vector` reside en los métodos que ofrece para manipular sus elementos de manera eficiente y segura. A diferencia de los arreglos estáticos, que requieren manejo manual de índices y tamaños, los vectores proporcionan funciones miembro que simplifican enormemente las operaciones de añadir, quitar, consultar y gestionar la colección.

¿Cuáles son algunos de los métodos más utilizados y fundamentales de `std::vector`?

* **`push_back(elemento)`**: Este es, con diferencia, uno de los métodos más usados. Añade un nuevo `elemento` al final del vector. Si el vector no tiene suficiente capacidad para el nuevo elemento, automáticamente reasigna memoria (generalmente doblando su capacidad) para acomodarlo. Esto lo hace ideal para construir colecciones de tamaño desconocido.
* **`size()`**: Retorna el número actual de elementos en el vector. Este valor cambia dinámicamente a medida que añades o eliminas elementos.
* **`empty()`**: Retorna `true` si el vector no contiene elementos (su `size()` es 0), y `false` en caso contrario. Es una forma segura de verificar si un vector está vacío antes de intentar acceder a sus elementos.
* **`clear()`**: Elimina todos los elementos del vector, dejando el vector vacío (su `size()` se convierte en 0). La capacidad de memoria (el espacio reservado) puede o no ser liberada por completo, dependiendo de la implementación.
* **`pop_back()`**: Elimina el último elemento del vector. Es importante asegurarse de que el vector no esté vacío antes de llamar a `pop_back()` para evitar un comportamiento indefinido.
* **`at(indice)`**: Accede al elemento en la posición `indice` especificada. A diferencia del operador `[]`, `at()` realiza una verificación de límites y lanza una excepción `std::out_of_range` si el índice es inválido.
* **`front()` / `back()`**: Retornan una referencia al primer y último elemento del vector, respectivamente. También requieren que el vector no esté vacío.

Estos métodos, junto con otros como `insert()`, `erase()`, `resize()`, `capacity()`, entre otros, hacen de `std::vector` una de las estructuras de datos más robustas y flexibles en C++.
''',
    'code_example': r'''
#include <iostream>
#include <vector> // Para std::vector
#include <string> // Para std::string

int main() {
    std::vector<int> edades;

    std::cout << "--- Métodos Comunes de std::vector ---" << std::endl;

    // 1. empty() y size() en un vector vacío
    std::cout << "Vector 'edades' esta vacio? " << (edades.empty() ? "Si" : "No") << std::endl; // Si
    std::cout << "Tamanio inicial de 'edades': " << edades.size() << std::endl; // 0

    std::cout << std::endl;

    // 2. push_back(elemento) - Añadir elementos
    edades.push_back(25); // Añade 25
    edades.push_back(30); // Añade 30
    edades.push_back(22); // Añade 22

    std::cout << "Después de anadir 3 elementos:" << std::endl;
    std::cout << "Vector 'edades' esta vacio? " << (edades.empty() ? "Si" : "No") << std::endl; // No
    std::cout << "Tamanio actual de 'edades': " << edades.size() << std::endl; // 3

    std::cout << std::endl;

    // 3. Acceso a elementos con [] y at()
    std::cout << "Primer elemento (indice 0) con []: " << edades[0] << std::endl; // 25
    std::cout << "Segundo elemento (indice 1) con .at(): " << edades.at(1) << std::endl; // 30

    // Intentar acceder fuera de límites con .at() (seguro, lanza excepción)
    try {
        std::cout << "Accediendo a indice 5 (fuera de rango): " << edades.at(5) << std::endl;
    } catch (const std::out_of_range& e) {
        std::cerr << "Error de acceso: " << e.what() << std::endl; // Captura la excepción
    }

    // Intentar acceder fuera de límites con [] (peligroso, comportamiento indefinido)
    // std::cout << "Accediendo a indice 5 (fuera de rango) con []: " << edades[5] << std::endl; // ¡EVITAR!

    std::cout << std::endl;

    // 4. pop_back() - Eliminar el último elemento
    if (!edades.empty()) { // Siempre verificar antes de pop_back()
        std::cout << "Elemento antes de pop_back: " << edades.back() << std::endl; // 22
        edades.pop_back(); // Elimina 22
        std::cout << "Tamanio después de pop_back: " << edades.size() << std::endl; // 2
        std::cout << "Nuevo último elemento: " << edades.back() << std::endl; // 30
    }

    std::cout << std::endl;

    // 5. front() y back() - Acceder al primer y último elemento
    if (!edades.empty()) {
        std::cout << "Elemento al frente (front()): " << edades.front() << std::endl; // 25
        std::cout << "Elemento al final (back()): " << edades.back() << std::endl;   // 30
    }

    std::cout << std::endl;

    // 6. clear() - Eliminar todos los elementos
    edades.clear();
    std::cout << "Después de clear():" << std::endl;
    std::cout << "Vector 'edades' esta vacio? " << (edades.empty() ? "Si" : "No") << std::endl; // Si
    std::cout << "Tamanio de 'edades' después de clear: " << edades.size() << std::endl; // 0

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 5,
    'tittle_level': 'Arreglos y Cadenas de Caracteres',
    'topic': 'Vectores (std::vector)',
    'subtopic': 'Iteración y acceso a elementos',
    'definition': '''
Una vez que tienes datos almacenados en un `std::vector`, la siguiente tarea fundamental es recorrer (iterar) sus elementos para leerlos o modificarlos. `std::vector` ofrece varias formas robustas y convenientes de hacer esto, combinando lo mejor de los arreglos con la flexibilidad de las colecciones dinámicas.

¿Cómo puedes recorrer los elementos de un `std::vector` y acceder a ellos?

1.  **Bucle `for` tradicional (basado en índice)**: Al igual que con los arreglos C-style, puedes usar un bucle `for` con un contador para acceder a los elementos por su índice. Esta es una opción cuando necesitas el índice del elemento (por ejemplo, para imprimir la posición junto al valor).
    ```cpp
    for (size_t i = 0; i < miVector.size(); ++i) {
        // Acceder: miVector[i] o miVector.at(i)
    }
    ```
    Es crucial usar `miVector.size()` para la condición del bucle, ya que el tamaño puede cambiar.

2.  **Bucle `for` basado en rango (C++11 en adelante)**: Esta es la forma preferida y más concisa de iterar sobre un vector (y otras colecciones STL) cuando no necesitas el índice del elemento. Es menos propenso a errores de "uno más" o "uno menos" en los límites.
    ```cpp
    for (Tipo elemento : miVector) { // 'elemento' es una copia
        // Usar 'elemento'
    }
    ```
    Si necesitas modificar los elementos dentro del bu bucle, usa una referencia:
    ```cpp
    for (Tipo& elemento : miVector) { // 'elemento' es una referencia
        // Modificar 'elemento'
    }
    ```

3.  **Iteradores**: Los iteradores son un concepto más avanzado en la STL, pero son la forma más genérica y poderosa de navegar por las colecciones. Un iterador es un objeto que apunta a un elemento dentro de una colección y puede ser incrementado para moverse al siguiente elemento.
    ```cpp
    for (std::vector<Tipo>::iterator it = miVector.begin(); it != miVector.end(); ++it) {
        // Acceder: *it
    }
    ```
    * `miVector.begin()`: Retorna un iterador que apunta al primer elemento.
    * `miVector.end()`: Retorna un iterador que apunta *después* del último elemento (es un "centinela" para la condición de parada).
    Los iteradores son esenciales para algoritmos más complejos y para funcionar de manera uniforme con diferentes tipos de contenedores STL.

Para el acceso a elementos individualmente, además del `[]` (que es rápido pero sin verificación de límites) y `at()` (que es seguro y lanza excepción), también puedes usar `front()` y `back()` para el primer y último elemento respectivamente, asumiendo que el vector no está vacío.
''',
    'code_example': r'''
#include <iostream>
#include <vector>    // Para std::vector
#include <string>    // Para std::string
#include <numeric>   // Para std::accumulate (para sumar elementos)
#include <algorithm> // Para std::for_each (opcional, con iteradores)

int main() {
    std::vector<int> puntuaciones = {85, 92, 78, 95, 88, 70};

    std::cout << "--- Iteración sobre std::vector ---" << std::endl;

    // 1. Bucle 'for' tradicional (por índice)
    std::cout << "\nUsando bucle for tradicional:" << std::endl;
    for (size_t i = 0; i < puntuaciones.size(); ++i) {
        std::cout << "Puntuacion en indice " << i << ": " << puntuaciones[i] << std::endl;
    }

    // 2. Bucle 'for' basado en rango (C++11+) - Leer elementos
    std::cout << "\nUsando bucle for basado en rango (lectura):" << std::endl;
    for (int score : puntuaciones) { // 'score' es una copia del elemento
        std::cout << "Puntuacion: " << score << std::endl;
    }

    // 3. Bucle 'for' basado en rango - Modificar elementos
    std::cout << "\nUsando bucle for basado en rango (modificacion):" << std::endl;
    for (int& score : puntuaciones) { // 'score' es una REFERENCIA, permite modificar el original
        score += 2; // Añadir 2 puntos a cada puntuación
    }
    std::cout << "Puntuaciones después de sumar 2 puntos:" << std::endl;
    for (int score : puntuaciones) {
        std::cout << score << " ";
    }
    std::cout << std::endl;

    // 4. Iteración usando iteradores (más avanzado y genérico para STL)
    std::cout << "\nUsando iteradores:" << std::endl;
    // std::vector<int>::iterator it; // Declaración explícita del iterador
    for (auto it = puntuaciones.begin(); it != puntuaciones.end(); ++it) {
        // *it desreferencia el iterador para obtener el valor del elemento
        std::cout << "Elemento con iterador: " << *it << std::endl;
    }

    std::cout << std::endl;

    // --- Acceso directo a elementos (complementario a la iteración) ---
    std::cout << "--- Acceso directo a elementos ---" << std::endl;
    if (!puntuaciones.empty()) {
        std::cout << "Primer elemento (front()): " << puntuaciones.front() << std::endl;
        std::cout << "Último elemento (back()): " << puntuaciones.back() << std::endl;
    }

    // Calcular la suma de los elementos (ejemplo práctico)
    int suma_total = 0;
    // For basado en rango es muy legible para esto
    for (int score : puntuaciones) {
        suma_total += score;
    }
    std::cout << "\nSuma total de las puntuaciones: " << suma_total << std::endl;

    // Con std::accumulate de <numeric>
    // int suma_con_accumulate = std::accumulate(puntuaciones.begin(), puntuaciones.end(), 0);
    // std::cout << "Suma con std::accumulate: " << suma_con_accumulate << std::endl;


    return 0;
}
'''
  });
}

Future<void> insertJrLevel6DataCpp(Database db) async {
  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 6,
    'tittle_level': 'Punteros y Referencias',
    'topic': 'Punteros',
    'subtopic': 'Declaración e inicialización',
    'definition': '''
Los **punteros** son una de las características más potentes y, a menudo, más desafiantes de C++. Un puntero es una variable que almacena una dirección de memoria. En lugar de almacenar un valor directamente, un puntero "apunta" a la ubicación en la memoria donde se encuentra otro valor. Comprender los punteros es fundamental para el manejo de memoria dinámica, las estructuras de datos avanzadas y la interacción de bajo nivel con el hardware.

¿Cómo se declara un puntero y qué significa inicializarlo?

La **declaración** de un puntero implica especificar el tipo de datos al que apuntará el puntero, seguido de un asterisco (`*`) y el nombre del puntero. Por ejemplo, `int* ptr;` declara un puntero llamado `ptr` que puede apuntar a una ubicación en la memoria que contiene un valor entero. Es importante que el tipo del puntero coincida con el tipo de datos al que va a apuntar.

La **inicialización** de un puntero significa darle un valor inicial, que es una dirección de memoria. Un puntero no inicializado contiene una dirección "basura" (aleatoria) y usarlo es extremadamente peligroso, ya que podría intentar acceder a una parte de la memoria que no le pertenece, causando fallos (`segmentation faults`) o corrupción de datos.

Las formas comunes de inicializar un puntero son:
* **Apuntando a una variable existente**: Usando el operador de dirección (`&`). `int* ptr = &miVariable;` hace que `ptr` almacene la dirección de memoria de `miVariable`.
* **Apuntando a memoria dinámica**: Usando el operador `new`. `int* ptr = new int;` asigna dinámicamente memoria para un entero y `ptr` apunta a esa nueva ubicación. (¡Esto lo veremos en más detalle más adelante!)
* **Con `nullptr` (C++11 en adelante) o `NULL`**: Inicializar un puntero a `nullptr` (preferido en C++ moderno) o `NULL` indica explícitamente que el puntero no apunta a ninguna ubicación de memoria válida. Esto es una buena práctica para punteros que aún no tienen una dirección válida.
* **Inicialización a `0`**: Al igual que `NULL` y `nullptr`, un puntero inicializado a `0` es un puntero nulo.

Manejar punteros requiere mucha precaución, ya que un uso incorrecto puede llevar a errores graves y difíciles de depurar.
''',
    'code_example': r'''
#include <iostream>

int main() {
    // 1. Declaración de punteros
    int* ptr_entero;        // Un puntero a un entero
    double* ptr_doble;      // Un puntero a un double
    char* ptr_caracter;     // Un puntero a un caracter

    // 2. Inicialización de punteros
    int numero = 42;
    ptr_entero = &numero; // ptr_entero ahora almacena la dirección de memoria de 'numero'

    double pi = 3.14159;
    ptr_doble = &pi;      // ptr_doble ahora almacena la dirección de memoria de 'pi'

    char letra = 'A';
    ptr_caracter = &letra; // ptr_caracter ahora almacena la dirección de memoria de 'letra'

    // Puntero inicializado a nullptr (C++11 y posterior)
    // Buena práctica para indicar que el puntero no apunta a nada válido
    int* ptr_nulo = nullptr;

    // Puntero inicializado a NULL (opción más antigua, aún válida)
    // #define NULL 0 o similar, es un valor numérico
    // int* ptr_nulo_antiguo = NULL;

    std::cout << "--- Declaración e Inicialización de Punteros ---" << std::endl;

    // Imprimir el valor de la variable original
    std::cout << "Valor de numero: " << numero << std::endl;
    // Imprimir la dirección de memoria de la variable original
    std::cout << "Direccion de memoria de numero (&numero): " << &numero << std::endl;
    // Imprimir el valor del puntero (la dirección que almacena)
    std::cout << "Valor de ptr_entero (la direccion): " << ptr_entero << std::endl;

    std::cout << std::endl;

    std::cout << "Valor de pi: " << pi << std::endl;
    std::cout << "Direccion de memoria de pi (&pi): " << &pi << std::endl;
    std::cout << "Valor de ptr_doble (la direccion): " << ptr_doble << std::endl;

    std::cout << std::endl;

    std::cout << "Valor de letra: " << letra << std::endl;
    std::cout << "Direccion de memoria de letra (&letra): " << static_cast<void*>(&letra) << std::endl; // Casteo a void* para imprimir direcciones de char* correctamente
    std::cout << "Valor de ptr_caracter (la direccion): " << static_cast<void*>(ptr_caracter) << std::endl;

    std::cout << std::endl;

    std::cout << "Valor de ptr_nulo: " << ptr_nulo << std::endl; // Normalmente imprime 0x0 o 0
    if (ptr_nulo == nullptr) {
        std::cout << "ptr_nulo apunta a nullptr (no apunta a ninguna direccion valida)." << std::endl;
    }

    // Un error MUY COMÚN y peligroso: puntero no inicializado
    // int* ptr_no_inicializado;
    // *ptr_no_inicializado = 10; // ¡ERROR! Esto es comportamiento indefinido, puede causar un crash.
    // Nunca desreferencies un puntero no inicializado o nulo.

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 6,
    'tittle_level': 'Punteros y Referencias',
    'topic': 'Punteros',
    'subtopic': 'Operadores * y &',
    'definition': '''
Para trabajar con punteros en C++, se utilizan dos operadores clave que a menudo causan confusión al principio, pero son fundamentales para su manejo: el operador de dirección (`&`) y el operador de desreferencia (`*`). Entender cómo funcionan estos operadores es la clave para manipular la memoria directamente a través de punteros.

¿Qué hacen los operadores `*` y `&` en el contexto de los punteros?

1.  **Operador de dirección (`&`) - "Dirección de"**:
    * Este operador se usa para obtener la **dirección de memoria** de una variable. Cuando lo colocas antes del nombre de una variable, te devuelve la dirección donde esa variable está almacenada en la memoria.
    * Ejemplo: `int num = 10; int* ptr = &num;` Aquí, `&num` obtiene la dirección de memoria de `num`, y esa dirección se almacena en `ptr`.

2.  **Operador de desreferencia (`*`) - "Valor en la dirección"**:
    * Este operador tiene dos usos principales en C++ relacionados con punteros.
    * **En la declaración de un puntero**: Cuando se usa en la declaración de una variable (ej., `int* ptr;`), indica que `ptr` es un puntero (que almacenará una dirección). No es el mismo `*` que el de la multiplicación.
    * **Para acceder al valor al que apunta un puntero**: Cuando se usa con un puntero ya declarado (ej., `*ptr`), se conoce como el operador de desreferencia. Significa "el valor al que apunta esta dirección de memoria". Te permite acceder y manipular el dato almacenado en la dirección de memoria que el puntero contiene.
    * Ejemplo: `*ptr = 20;` Si `ptr` apunta a `num`, esta operación cambiará el valor de `num` a 20. `std::cout << *ptr;` imprimiría el valor actual de `num`.

En resumen, `&` te da la dirección de una variable, y `*` (cuando se aplica a un puntero) te da el valor que está en esa dirección. Son complementarios para la manipulación de datos a través de punteros.
''',
    'code_example': r'''
#include <iostream>

int main() {
    int valor = 10;
    int* ptr_valor; // Declaración de un puntero a un entero

    std::cout << "--- Operadores * (desreferencia) y & (dirección) ---" << std::endl;

    // 1. Usando el operador '&' (dirección de)
    // ptr_valor almacena la dirección de memoria de la variable 'valor'
    ptr_valor = &valor;

    std::cout << "Valor de la variable 'valor': " << valor << std::endl;
    std::cout << "Direccion de memoria de 'valor' (&valor): " << &valor << std::endl;
    std::cout << "Valor de 'ptr_valor' (la direccion que almacena): " << ptr_valor << std::endl;

    std::cout << std::endl;

    // 2. Usando el operador '*' (desreferencia - valor en la dirección)
    // Acceder al valor al que apunta 'ptr_valor'
    std::cout << "Valor al que apunta 'ptr_valor' (*ptr_valor): " << *ptr_valor << std::endl; // Salida: 10

    // Modificar el valor a través del puntero
    *ptr_valor = 25; // Esto cambia el valor de la variable 'valor' a 25
    std::cout << "Valor de 'valor' despues de modificarlo via puntero: " << valor << std::endl; // Salida: 25
    std::cout << "Valor al que apunta 'ptr_valor' despues de modificarlo: " << *ptr_valor << std::endl; // Salida: 25

    std::cout << std::endl;

    // Otro ejemplo: Puntero a un double
    double precio = 99.99;
    double* ptr_precio = &precio; // ptr_precio apunta a la dirección de 'precio'

    std::cout << "Valor de 'precio': " << precio << std::endl;
    std::cout << "Direccion de 'precio': " << &precio << std::endl;
    std::cout << "Valor de 'ptr_precio': " << ptr_precio << std::endl;
    std::cout << "Valor al que apunta 'ptr_precio': " << *ptr_precio << std::endl; // Salida: 99.99

    *ptr_precio = 50.50; // Modifica 'precio' a través de 'ptr_precio'
    std::cout << "Nuevo valor de 'precio': " << precio << std::endl; // Salida: 50.50

    // Cuidado: nunca desreferenciar un puntero nulo o no inicializado
    int* puntero_nulo = nullptr;
    // std::cout << *puntero_nulo << std::endl; // ¡PELIGRO! Esto podría causar un crash.

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 6,
    'tittle_level': 'Punteros y Referencias',
    'topic': 'Punteros',
    'subtopic': 'Punteros y arreglos',
    'definition': '''
En C++, hay una relación muy estrecha y fundamental entre los punteros y los arreglos (arrays). De hecho, el nombre de un arreglo C-style (sin corchetes) a menudo se comporta como un puntero al primer elemento del arreglo. Entender esta relación es clave para manipular eficientemente los datos en memoria y para comprender cómo funcionan muchas funciones de biblioteca.

¿Cuál es la relación entre punteros y arreglos en C++?

1.  **El nombre de un arreglo es un puntero (constante) al primer elemento**:
    * Cuando usas el nombre de un arreglo sin el operador `[]` (subíndice), se interpreta como la dirección de memoria de su primer elemento.
    * Ejemplo: `int arr[5];` entonces `arr` es equivalente a `&arr[0]`.

2.  **Aritmética de punteros**:
    * Puedes realizar operaciones aritméticas con punteros. Sumar o restar un entero a un puntero mueve el puntero por múltiplos del tamaño del tipo de datos al que apunta.
    * Ejemplo: Si `ptr` apunta a `arr[0]`, entonces `ptr + 1` apunta a `arr[1]`, `ptr + 2` apunta a `arr[2]`, y así sucesivamente. Esto es porque el compilador sabe el tamaño del tipo de datos y ajusta el desplazamiento de memoria correctamente.
    * Puedes usar el operador de desreferencia (`*`) con la aritmética de punteros: `*(ptr + i)` es equivalente a `ptr[i]` o `arr[i]`.

3.  **Acceso a elementos**:
    * Ambos, la notación de subíndice (`arr[i]`) y la notación de puntero (`*(arr + i)`), son equivalentes para acceder a elementos de un arreglo.
    * Esto significa que puedes recorrer un arreglo usando un puntero que se incrementa en cada paso.

Esta equivalencia es una de las razones por las que las funciones que trabajan con arreglos a menudo toman un puntero al primer elemento y el tamaño del arreglo como argumentos, ya que no "conocen" el tamaño total del arreglo por sí mismas. Aunque `std::vector` es más seguro y preferible en C++ moderno, entender esta relación directa es vital para el código C++ existente y para un conocimiento profundo del lenguaje.
''',
    'code_example': r'''
#include <iostream>

int main() {
    int numeros[] = {10, 20, 30, 40, 50};
    const int TAMANIO = sizeof(numeros) / sizeof(numeros[0]);

    std::cout << "--- Punteros y Arreglos ---" << std::endl;

    // 1. El nombre del arreglo como puntero al primer elemento
    // 'numeros' por sí solo es la dirección de memoria del primer elemento (numeros[0])
    std::cout << "Direccion de numeros[0] (&numeros[0]): " << &numeros[0] << std::endl;
    std::cout << "Valor de 'numeros' (como puntero): " << numeros << std::endl; // Deberían ser iguales

    // Declarar un puntero y apuntarlo al inicio del arreglo
    int* ptr_numeros = numeros; // Es lo mismo que int* ptr_numeros = &numeros[0];
    std::cout << "Valor de 'ptr_numeros' (apuntando al inicio): " << ptr_numeros << std::endl;

    std::cout << std::endl;

    // 2. Acceso a elementos usando notación de subíndice (arreglo)
    std::cout << "Acceso usando notacion de subindice:" << std::endl;
    for (int i = 0; i < TAMANIO; ++i) {
        std::cout << "numeros[" << i << "]: " << numeros[i] << std::endl;
    }

    std::cout << std::endl;

    // 3. Acceso a elementos usando notación de puntero y aritmética de punteros
    std::cout << "Acceso usando notacion de puntero y aritmetica:" << std::endl;
    for (int i = 0; i < TAMANIO; ++i) {
        // ptr_numeros + i avanza el puntero al i-ésimo elemento
        // *(ptr_numeros + i) desreferencia ese puntero para obtener el valor
        std::cout << "*(ptr_numeros + " << i << "): " << *(ptr_numeros + i) << std::endl;
    }

    std::cout << std::endl;

    // 4. Modificar elementos a través de punteros
    std::cout << "Modificando elementos via punteros:" << std::endl;
    *(ptr_numeros + 0) = 100; // Cambia numeros[0]
    ptr_numeros[1] = 200;    // También puedes usar la notación de subíndice con punteros
    std::cout << "numeros[0] ahora: " << numeros[0] << std::endl;
    std::cout << "numeros[1] ahora: " << numeros[1] << std::endl;

    std::cout << std::endl;

    // Iterar el arreglo incrementando el puntero directamente
    std::cout << "Iterando con incremento de puntero:" << std::endl;
    int* p = numeros; // Puntero al inicio
    int* end_p = numeros + TAMANIO; // Puntero justo después del último elemento

    while (p < end_p) {
        std::cout << "Elemento: " << *p << std::endl;
        p++; // Mueve el puntero al siguiente entero
    }

    // Cuidado: Una vez que un arreglo se pasa a una función como puntero,
    // la función pierde la información de su tamaño original.
    // void procesarArray(int* arr_param) { /* size of arr_param will be size of pointer, not array */ }

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 6,
    'tittle_level': 'Punteros y Referencias',
    'topic': 'Punteros',
    'subtopic': 'Punteros a funciones',
    'definition': '''
Así como las variables pueden almacenar números o cadenas de texto, también pueden almacenar la dirección de memoria de una función. Esto se logra mediante el uso de **punteros a funciones**. Un puntero a función te permite tratar una función como si fuera un dato: puedes pasarla como argumento a otras funciones, almacenarla en variables, o incluso devolverla como valor de retorno.

¿Por qué querrías usar punteros a funciones y cómo funcionan?

Los punteros a funciones son útiles para:
* **Implementar callbacks**: Cuando quieres que una función llame a otra función que es proporcionada por el usuario o por otra parte del programa.
* **Diseñar algoritmos flexibles**: Por ejemplo, una función de ordenamiento que puede usar diferentes criterios de comparación (pasando un puntero a la función de comparación deseada).
* **Tablas de salto**: En algunos sistemas operativos o microcontroladores, se usan punteros a funciones para implementar "tablas de salto" o "tablas de vectores de interrupción".

La **declaración** de un puntero a función es un poco más compleja que la de un puntero a dato, ya que debe coincidir con la *firma* de la función a la que apuntará (su tipo de retorno y sus parámetros). La sintaxis general es `tipo_retorno (*nombre_puntero)(tipo_param1, tipo_param2, ...);`. Los paréntesis alrededor de `*nombre_puntero` son cruciales para distinguirlo de una función que retorna un puntero.

Una vez declarado, puedes asignar la dirección de una función a ese puntero (simplemente usando el nombre de la función, sin paréntesis) y luego llamar a la función a través del puntero.
''',
    'code_example': r'''
#include <iostream>
#include <vector>
#include <algorithm> // Para std::sort

// 1. Funciones de ejemplo a las que apuntarán los punteros

// Función que suma dos enteros
int sumar(int a, int b) {
    return a + b;
}

// Función que resta dos enteros
int restar(int a, int b) {
    return a - b;
}

// Función que imprime un mensaje
void imprimirMensaje(std::string msg) {
    std::cout << "Mensaje: " << msg << std::endl;
}

// Función para usar como callback (ordenar un vector)
// Retorna true si a es menor que b, false en caso contrario
bool compararAscendente(int a, int b) {
    return a < b;
}

// Retorna true si a es mayor que b, false en caso contrario
bool compararDescendente(int a, int b) {
    return a > b;
}

int main() {
    std::cout << "--- Punteros a Funciones ---" << std::endl;

    // 1. Declaración e inicialización de un puntero a función
    // Puntero a una función que toma dos int y retorna un int
    int (*ptr_operacion)(int, int);

    // Asignar la dirección de la función 'sumar' al puntero
    ptr_operacion = sumar; // 'sumar' sin paréntesis obtiene su dirección

    // Llamar a la función a través del puntero
    int resultado = ptr_operacion(10, 5);
    std::cout << "Resultado de la suma via puntero: " << resultado << std::endl; // Salida: 15

    // Asignar la dirección de la función 'restar' al mismo puntero
    ptr_operacion = restar;
    resultado = ptr_operacion(10, 5);
    std::cout << "Resultado de la resta via puntero: " << resultado << std::endl; // Salida: 5

    std::cout << std::endl;

    // 2. Puntero a función que no retorna valor (void)
    void (*ptr_imprimir)(std::string); // Puntero a función que toma std::string y no retorna nada
    ptr_imprimir = imprimirMensaje;

    ptr_imprimir("Hola desde un puntero a void function!"); // Salida: Mensaje: Hola desde...

    std::cout << std::endl;

    // 3. Ejemplo de uso con std::sort (algoritmo de la STL)
    std::vector<int> numeros = {5, 2, 8, 1, 9, 4};

    std::cout << "Vector original: ";
    for (int n : numeros) {
        std::cout << n << " ";
    }
    std::cout << std::endl;

    // Ordenar ascendente usando un puntero a función de comparación
    // La función 'sort' toma un rango y una función de comparación (un puntero a función)
    std::sort(numeros.begin(), numeros.end(), compararAscendente);
    std::cout << "Vector ordenado ascendente: ";
    for (int n : numeros) {
        std::cout << n << " ";
    }
    std::cout << std::endl;

    // Ordenar descendente cambiando el puntero a función
    std::sort(numeros.begin(), numeros.end(), compararDescendente);
    std::cout << "Vector ordenado descendente: ";
    for (int n : numeros) {
        std::cout << n << " ";
    }
    std::cout << std::endl;

    // Errores comunes:
    // int (*ptr_mal_tipo)(double, double); // Error: tipos de parámetros no coinciden con sumar/restar
    // ptr_operacion = imprimirMensaje; // Error: tipo de retorno o parámetros no coinciden

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 6,
    'tittle_level': 'Punteros y Referencias',
    'topic': 'Referencias',
    'subtopic': 'Referencias como alias',
    'definition': '''
En C++, una **referencia** es un alias, es decir, un nombre alternativo, para una variable ya existente. A diferencia de un puntero, que almacena la dirección de memoria de una variable, una referencia *es* la variable original, solo que con un nombre diferente. Las referencias son una forma poderosa de trabajar con variables sin la sintaxis engorrosa de los punteros y con mayor seguridad.

¿Qué implica que una referencia sea un alias?

* **No es una variable independiente**: Una referencia no ocupa su propio espacio de memoria de forma directa como lo hace un puntero (aunque internamente el compilador pueda usar mecanismos similares a los punteros, esto es transparente para el programador). En su lugar, el compilador hace que cualquier uso de la referencia se traduzca directamente en un acceso a la variable original.
* **Transparencia**: Trabajar con una referencia es exactamente lo mismo que trabajar directamente con la variable original. No hay indirección (como con los punteros) ni necesidad de desreferenciar.
* **Cambios mutuos**: Si modificas el valor de la referencia, estás modificando el valor de la variable original. Si modificas el valor de la variable original, el valor de la referencia también cambia. Siempre están sincronizados porque son la misma cosa.
* **Debe inicializarse**: Debido a que una referencia *es* la variable original, debe ser inicializada al momento de su declaración con una variable existente del mismo tipo. No puedes tener una referencia "vacía" o sin inicializar.
* **No se puede reasignar**: Una vez que una referencia está vinculada a una variable, ese vínculo es permanente. No puedes hacer que la referencia se refiera a otra variable diferente más adelante.

En esencia, una referencia te da una forma más limpia y segura de trabajar con variables, especialmente cuando quieres pasar variables a funciones para modificarlas.
''',
    'code_example': r'''
#include <iostream>
#include <string>

int main() {
    std::cout << "--- Referencias como Alias ---" << std::endl;

    // 1. Declaración de una variable original
    int numero_original = 100;
    std::string texto_original = "Hola Mundo";

    std::cout << "Valor original de numero_original: " << numero_original << std::endl;
    std::cout << "Direccion de numero_original: " << &numero_original << std::endl;

    std::cout << "Valor original de texto_original: " << texto_original << std::endl;
    std::cout << "Direccion de texto_original: " << &texto_original << std::endl;

    std::cout << std::endl;

    // 2. Declaración e inicialización de referencias (alias)
    // 'alias_numero' es ahora otro nombre para 'numero_original'
    int& alias_numero = numero_original;

    // 'alias_texto' es ahora otro nombre para 'texto_original'
    std::string& alias_texto = texto_original;

    std::cout << "Valor de alias_numero: " << alias_numero << std::endl;
    std::cout << "Direccion de alias_numero: " << &alias_numero << std::endl; // Misma direccion que numero_original

    std::cout << "Valor de alias_texto: " << alias_texto << std::endl;
    std::cout << "Direccion de alias_texto: " << &alias_texto << std::endl; // Misma direccion que texto_original

    std::cout << std::endl;

    // 3. Modificando el valor a través del alias (la referencia)
    alias_numero = 200; // Esto modifica numero_original
    alias_texto = "Adios Planeta"; // Esto modifica texto_original

    std::cout << "Despues de modificar via alias:" << std::endl;
    std::cout << "Nuevo valor de numero_original: " << numero_original << std::endl; // Salida: 200
    std::cout << "Nuevo valor de alias_numero: " << alias_numero << std::endl;     // Salida: 200 (sincronizado)

    std::cout << "Nuevo valor de texto_original: " << texto_original << std::endl; // Salida: Adios Planeta
    std::cout << "Nuevo valor de alias_texto: " << alias_texto << std::endl;     // Salida: Adios Planeta (sincronizado)

    std::cout << std::endl;

    // 4. Intentos inválidos:
    // int& referencia_sin_inicializar; // Error: una referencia debe ser inicializada
    // int otro_numero = 300;
    // alias_numero = otro_numero; // Esto NO reasigna la referencia, esto ASIGNA el VALOR de otro_numero a numero_original
    // std::cout << "numero_original despues de 'reasignacion' (en realidad asignacion): " << numero_original << std::endl; // Salida: 300


    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 6,
    'tittle_level': 'Punteros y Referencias',
    'topic': 'Referencias',
    'subtopic': 'Paso por referencia a funciones',
    'definition': '''
Uno de los usos más comunes e importantes de las referencias es en los parámetros de las funciones. El **paso por referencia** permite que una función reciba acceso directo a la variable original que se le pasa como argumento, en lugar de trabajar con una copia. Esto es crucial cuando quieres que una función modifique el valor de la variable original.

¿Cómo funciona el paso por referencia y por qué es útil?

* **Sintaxis**: Para pasar un argumento por referencia, declaras el parámetro de la función como una referencia usando el operador `&`. Por ejemplo, `void modificar(int& ref);` declara una función que toma un entero por referencia.
* **No hay copia**: Cuando llamas a una función con un argumento pasado por referencia, no se crea una copia del argumento. La función trabaja directamente con la variable original, lo que es muy eficiente para objetos grandes.
* **Modificación directa**: Cualquier cambio que la función haga al parámetro de referencia se reflejará directamente en la variable original que se pasó a la función.
* **Eficiencia (para objetos grandes)**: Aunque para tipos primitivos (int, char) el costo de copiar es bajo, para objetos complejos (como `std::string` o `std::vector`), copiar el objeto completo puede ser costoso en términos de tiempo y memoria. El paso por referencia evita esta copia, mejorando el rendimiento.
* **Evitar punteros**: El paso por referencia proporciona gran parte de la funcionalidad del paso por puntero (la capacidad de modificar el original) pero con una sintaxis más limpia, segura y natural, sin la necesidad de desreferenciar explícitamente (`*`) o de verificar `nullptr`.

El paso por referencia es fundamental para funciones que necesitan modificar sus argumentos (por ejemplo, una función para intercambiar dos valores) o para aquellas que necesitan trabajar con objetos grandes de forma eficiente sin modificar la original (usando `const&` para referencia constante).
''',
    'code_example': r'''
#include <iostream>
#include <string>
#include <vector>

// Función que intercambia los valores de dos enteros usando paso por referencia
void intercambiar(int& a, int& b) {
    int temp = a;
    a = b;
    b = temp;
    std::cout << "Dentro de intercambiar: a = " << a << ", b = " << b << std::endl;
}

// Función que incrementa un contador por referencia
void incrementarContador(int& contador) {
    contador++; // Modifica la variable original
    std::cout << "Dentro de incrementarContador: " << contador << std::endl;
}

// Función que NO modifica la variable original (paso por valor)
void incrementarContadorPorValor(int contador) {
    contador++; // Modifica solo la copia local
    std::cout << "Dentro de incrementarContadorPorValor (copia): " << contador << std::endl;
}

// Función que imprime un vector de strings de forma eficiente (paso por referencia constante)
// No se modifica el vector, pero se evita copiarlo.
void imprimirVector(const std::vector<std::string>& vec) {
    std::cout << "Elementos del vector: ";
    for (const std::string& s : vec) {
        std::cout << s << " ";
    }
    std::cout << std::endl;
    // vec.push_back("Nuevo"); // Esto causaría un error de compilación si 'vec' fuera const
}

int main() {
    std::cout << "--- Paso por Referencia a Funciones ---" << std::endl;

    // Ejemplo 1: Intercambiar valores
    int x = 5;
    int y = 10;
    std::cout << "Antes de intercambiar: x = " << x << ", y = " << y << std::endl;
    intercambiar(x, y); // x e y se pasan por referencia
    std::cout << "Despues de intercambiar: x = " << x << ", y = " << y << std::endl; // x=10, y=5

    std::cout << std::endl;

    // Ejemplo 2: Incrementar contador
    int mi_contador = 0;
    std::cout << "Valor inicial de mi_contador: " << mi_contador << std::endl;
    incrementarContador(mi_contador); // mi_contador se pasa por referencia
    std::cout << "Valor de mi_contador despues de incrementar: " << mi_contador << std::endl; // Salida: 1

    std::cout << std::endl;

    // Comparación con paso por valor
    int otro_contador = 0;
    std::cout << "Valor inicial de otro_contador: " << otro_contador << std::endl;
    incrementarContadorPorValor(otro_contador); // otro_contador se pasa por valor (se copia)
    std::cout << "Valor de otro_contador despues de incrementar por valor: " << otro_contador << std::endl; // Salida: 0 (no cambió)

    std::cout << std::endl;

    // Ejemplo 3: Paso por referencia constante (para eficiencia y seguridad)
    std::vector<std::string> frutas = {"Manzana", "Banana", "Cereza"};
    imprimirVector(frutas); // El vector se pasa por referencia constante

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 6,
    'tittle_level': 'Punteros y Referencias',
    'topic': 'Referencias',
    'subtopic': 'Diferencias entre punteros y referencias',
    'definition': '''
Aunque tanto los punteros como las referencias en C++ pueden usarse para acceder y modificar datos indirectamente, son conceptos distintos con características y usos diferentes. Elegir entre un puntero y una referencia depende de la situación específica.

¿Cuáles son las diferencias clave y cuándo usar punteros vs. referencias?

| Característica         | Punteros                                      | Referencias                               |
| :--------------------- | :-------------------------------------------- | :---------------------------------------- |
| **Símbolo** | `*` (declaración y desreferencia), `&` (dirección) | `&` (declaración)                       |
| **Almacena** | Una dirección de memoria                      | Un alias para una variable existente      |
| **Inicialización** | Puede ser declarado y luego inicializado      | Debe ser inicializado al momento de la declaración |
| **Nulidad** | Puede ser `nullptr` (o `NULL`)                | No puede ser nula (siempre apunta a algo válido) |
| **Reasignación** | Puede ser reasignado para apuntar a otra variable | No puede ser reasignado (siempre se refiere a la misma variable) |
| **Aritmética** | Se le puede aplicar aritmética de punteros (`+`, `-`) | No se le puede aplicar aritmética de punteros |
| **Sintaxis de uso** | Necesita desreferencia (`*ptr`) para acceder al valor | Se usa directamente como la variable original |
| **Indirección** | Sí, explícita (a través de la dirección)      | Implícita (el compilador maneja la indirección) |
| **Seguridad** | Menos seguro (posibilidad de punteros nulos, punteros colgantes) | Más seguro (siempre válidas, no nulas)   |
| **Caso de uso típico** | Memoria dinámica, arreglos, estructuras de datos enlazadas, cuando se necesita la opción de "no apuntar a nada" | Paso de argumentos a funciones (entrada/salida), alias de variables, iteradores de rango |
''',
    'code_example': r'''
#include <iostream>
#include <string>
#include <vector>

// 1. Funcion con paso por referencia (modifica el original)
void duplicarValor(int& num) {
    num *= 2;
    std::cout << "Dentro de duplicarValor (referencia): El numero es " << num << std::endl;
}

// 2. Funcion con paso por valor (modifica solo una copia)
void duplicarValorPorCopia(int num) {
    num *= 2;
    std::cout << "Dentro de duplicarValorPorCopia (copia): El numero es " << num << std::endl;
}

// 3. Funcion con paso por puntero (modifica el original, requiere desreferencia)
void duplicarValorPorPuntero(int* ptr_num) {
    if (ptr_num != nullptr) { // Siempre verificar punteros nulos
        *ptr_num *= 2; // Desreferenciar para acceder al valor
        std::cout << "Dentro de duplicarValorPorPuntero (puntero): El numero es " << *ptr_num << std::endl;
    } else {
        std::cout << "Puntero nulo recibido." << std::endl;
    }
}

// Funcion que concatena eficientemente (referencia constante)
void imprimirYConcatenar(const std::string& str1, const std::string& str2) {
    std::cout << "Combinacion de strings: " << str1 << " " << str2 << std::endl;
    // str1 += "algo"; // Esto daria un error de compilacion porque str1 es const
}

int main() {
    std::cout << "--- Diferencias entre Punteros y Referencias ---" << std::endl;

    int valor = 5;
    std::cout << "\nValor inicial: " << valor << std::endl;

    // Uso de referencia
    duplicarValor(valor); // Pasar la variable directamente
    std::cout << "Valor despues de duplicarValor (referencia): " << valor << std::endl; // Salida: 10

    // Reiniciar valor
    valor = 5;
    std::cout << "\nValor reiniciado: " << valor << std::endl;

    // Uso de paso por valor
    duplicarValorPorCopia(valor); // Se pasa una copia
    std::cout << "Valor despues de duplicarValorPorCopia (valor): " << valor << std::endl; // Salida: 5 (no cambio)

    // Reiniciar valor
    valor = 5;
    std::cout << "\nValor reiniciado: " << valor << std::endl;

    // Uso de puntero
    duplicarValorPorPuntero(&valor); // Pasar la dirección de la variable
    std::cout << "Valor despues de duplicarValorPorPuntero (puntero): " << valor << std::endl; // Salida: 10

    std::cout << std::endl;

    // Comparación de sintaxis:
    int a = 10;
    int& ref_a = a; // Referencia: se usa como si fuera 'a'
    int* ptr_a = &a; // Puntero: almacena la dirección de 'a'

    std::cout << "Valor de 'a': " << a << std::endl;
    std::cout << "Valor a traves de ref_a: " << ref_a << std::endl; // Sin '*'
    std::cout << "Valor a traves de ptr_a: " << *ptr_a << std::endl; // Con '*'

    ref_a = 20; // Modifica 'a'
    std::cout << "Nuevo valor de 'a' via ref_a: " << a << std::endl;

    *ptr_a = 30; // Modifica 'a'
    std::cout << "Nuevo valor de 'a' via ptr_a: " << a << std::endl;

    std::cout << std::endl;

    // Punteros pueden ser nulos, referencias NO
    int* posible_nulo = nullptr; // OK
    // int& referencia_nula = nullptr; // Error: referencia debe inicializarse con objeto valido

    // Punteros pueden reasignarse, referencias NO
    int b = 40;
    ptr_a = &b; // ptr_a ahora apunta a 'b'
    std::cout << "ptr_a ahora apunta a 'b', *ptr_a = " << *ptr_a << std::endl; // Salida: 40

    // ref_a = b; // ERROR: Esto NO reasigna ref_a a 'b', esto ASIGNA el VALOR de 'b' a 'a' (ya que ref_a es un alias de 'a')
    std::cout << "Valor de 'a' (via ref_a = b): " << a << std::endl; // Salida: 40 (porque a se modificó)

    std::string s_val1 = "Hello";
    std::string s_val2 = "World";
    imprimirYConcatenar(s_val1, s_val2); // Paso por referencia constante para eficiencia

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 6,
    'tittle_level': 'Punteros y Referencias',
    'topic': 'Punteros Inteligentes',
    'subtopic': 'Concepto de punteros inteligentes',
    'definition': '''
En C++, los **punteros inteligentes** son clases que actúan como punteros pero que además gestionan automáticamente la memoria a la que apuntan. A diferencia de los punteros "crudos" (int*, double*, etc.), los punteros inteligentes se encargan de liberar la memoria cuando ya no es necesaria, evitando así las fugas de memoria, un problema común y difícil de depurar en C++.

¿Por qué son necesarios los punteros inteligentes?

* **Gestión automática de la memoria**: La principal ventaja es que eliminan la necesidad de llamar explícitamente a `delete` para liberar la memoria asignada con `new`. El puntero inteligente lo hace automáticamente cuando sale de su ámbito o cuando ya no se le necesita.
* **Prevención de fugas de memoria**: Si olvidas llamar a `delete`, la memoria asignada permanece ocupada, lo que se conoce como fuga de memoria. Los punteros inteligentes garantizan que esto no ocurra.
* **Excepciones seguras**: En C++, si se lanza una excepción entre la asignación de memoria con `new` y la llamada a `delete`, la memoria no se liberará. Los punteros inteligentes, al ser objetos que se destruyen automáticamente, liberan la memoria incluso en presencia de excepciones.
* **Claridad y seguridad del código**: El uso de punteros inteligentes hace que el código sea más claro y menos propenso a errores relacionados con la gestión de memoria.

C++ proporciona varios tipos de punteros inteligentes en la biblioteca estándar (en el encabezado `<memory>`):

* `std::unique_ptr`: Representa la propiedad exclusiva de la memoria a la que apunta. Solo un `unique_ptr` puede apuntar a un recurso dado. Cuando el `unique_ptr` se destruye, el recurso se libera.
* `std::shared_ptr`: Permite que varios punteros compartan la propiedad de un recurso. Mantiene un "contador de referencias" para saber cuántos `shared_ptr` apuntan al recurso. Cuando el último `shared_ptr` se destruye, el recurso se libera.
* `std::weak_ptr`: No participa en la gestión de la propiedad, sino que proporciona un acceso no propietario a un recurso gestionado por un `shared_ptr`. Se usa para evitar referencias circulares.

El uso de punteros inteligentes es una de las mejores prácticas en C++ moderno, ya que simplifica la gestión de memoria y hace que el código sea más robusto y fácil de mantener.
''',
    'code_example': r'''
#include <iostream>
#include <memory> // Para los punteros inteligentes

class MiClase {
public:
    MiClase() { std::cout << "MiClase construida" << std::endl; }
    ~MiClase() { std::cout << "MiClase destruida" << std::endl; }
    void hacerAlgo() { std::cout << "MiClase haciendo algo..." << std::endl; }
};

int main() {
    std::cout << "--- Punteros Inteligentes (Concepto) ---" << std::endl;

    // 1. Puntero crudo (ejemplo de lo que NO queremos hacer)
    MiClase* ptr_crudo = new MiClase();
    ptr_crudo->hacerAlgo();
    delete ptr_crudo; // ¡Necesitamos llamar a delete explícitamente!
    // Si olvidamos el delete, hay una fuga de memoria.

    std::cout << std::endl;

    // 2. Usando un unique_ptr (propiedad exclusiva)
    { // Ámbito limitado para demostrar la destrucción automática
        std::unique_ptr<MiClase> ptr_unico(new MiClase());
        ptr_unico->hacerAlgo();
        // No necesitamos llamar a delete. El destructor de unique_ptr lo hace.
    } // ptr_unico se destruye al salir del ámbito, y MiClase también.

    std::cout << std::endl;

    // 3. Usando un shared_ptr (propiedad compartida)
    {
        std::shared_ptr<MiClase> ptr_compartido1 = std::make_shared<MiClase>();
        ptr_compartido1->hacerAlgo();

        std::shared_ptr<MiClase> ptr_compartido2 = ptr_compartido1; // Comparten la propiedad
        ptr_compartido2->hacerAlgo();

        // El recurso se destruye cuando el último shared_ptr se destruye.
    }

    std::cout << "Fin del programa." << std::endl;
    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 6,
    'tittle_level': 'Punteros y Referencias',
    'topic': 'Punteros Inteligentes',
    'subtopic': 'Uso básico de std::unique_ptr y std::shared_ptr',
    'definition': '''
C++ proporciona dos clases principales de punteros inteligentes: `std::unique_ptr` y `std::shared_ptr`, cada una con un comportamiento y casos de uso distintos.

### `std::unique_ptr` (Propiedad Exclusiva)

* **Propiedad única**: Un `unique_ptr` garantiza la propiedad exclusiva del recurso al que apunta. Esto significa que solo un `unique_ptr` puede apuntar a un objeto dado en un momento dado.
* **Destrucción automática**: Cuando el `unique_ptr` se destruye (por ejemplo, al salir del ámbito), el objeto al que apunta se destruye automáticamente.
* **No copiable**: No se puede copiar un `unique_ptr` (su constructor de copia y operador de asignación están eliminados). Esto refuerza la idea de propiedad exclusiva. Sin embargo, se puede *mover* un `unique_ptr` a otro, transfiriendo la propiedad.
* **Uso principal**: Se utiliza cuando un objeto debe tener un único propietario claro y su vida útil está ligada al ámbito del propietario.

### `std::shared_ptr` (Propiedad Compartida)

* **Propiedad compartida**: Varios `shared_ptr` pueden apuntar al mismo objeto.
* **Conteo de referencias**: `shared_ptr` utiliza un "contador de referencias" para llevar un registro de cuántos `shared_ptr` apuntan al objeto. Cuando el contador llega a cero (es decir, cuando todos los `shared_ptr` que apuntan al objeto se destruyen), el objeto se destruye automáticamente.
* **Copiable**: Se puede copiar y asignar `shared_ptr`. Cada copia incrementa el contador de referencias.
* **Uso principal**: Se utiliza cuando varios objetos necesitan acceder y posiblemente modificar el mismo recurso, y la vida útil del recurso debe extenderse hasta que todos los usuarios hayan terminado.

### Creación de punteros inteligentes

* **`std::make_unique` (para `unique_ptr`, C++14 en adelante)**: Es la forma recomendada de crear un `unique_ptr`. Es más seguro y eficiente que usar `new` directamente.
* **`std::make_shared` (para `shared_ptr`)**: Es la forma recomendada de crear un `shared_ptr`. También es más seguro y eficiente, ya que la memoria para el objeto y el contador de referencias se asignan juntas.

### `std::weak_ptr`

* Un `weak_ptr` es un puntero inteligente que *no* participa en el conteo de referencias. Proporciona acceso no propietario a un objeto gestionado por un `shared_ptr`. Se utiliza para evitar referencias circulares.
''',
    'code_example': r'''
#include <iostream>
#include <memory>
#include <vector>

class Recurso {
public:
    Recurso(const std::string& nombre) : nombre_(nombre) {
        std::cout << "Recurso '" << nombre_ << "' creado." << std::endl;
    }
    ~Recurso() {
        std::cout << "Recurso '" << nombre_ << "' destruido." << std::endl;
    }
    void usar() {
        std::cout << "Recurso '" << nombre_ << "' siendo usado." << std::endl;
    }
private:
    std::string nombre_;
};

int main() {
    std::cout << "--- Uso básico de unique_ptr y shared_ptr ---" << std::endl;

    // 1. unique_ptr (propiedad exclusiva)
    {
        std::unique_ptr<Recurso> ptr_unico = std::make_unique<Recurso>("Archivo.txt");
        ptr_unico->usar();
        // No necesitamos delete. El recurso se destruye al salir del ámbito.
    }

    std::cout << std::endl;

    // 2. shared_ptr (propiedad compartida)
    {
        std::shared_ptr<Recurso> ptr_compartido1 = std::make_shared<Recurso>("BaseDeDatos");
        ptr_compartido1->usar();

        std::shared_ptr<Recurso> ptr_compartido2 = ptr_compartido1; // Comparten la propiedad
        ptr_compartido2->usar();

        std::cout << "Contador de referencias: " << ptr_compartido1.use_count() << std::endl; // 2

        std::vector<std::shared_ptr<Recurso>> recursos;
        recursos.push_back(ptr_compartido1); // Otra copia del shared_ptr
        std::cout << "Contador de referencias despues de push_back: " << ptr_compartido1.use_count() << std::endl; // 3
    } // El recurso se destruye cuando el último shared_ptr se destruye (al final del bloque).

    std::cout << "Fin del programa." << std::endl;
    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 6,
    'tittle_level': 'Punteros y Referencias',
    'topic': 'Punteros Inteligentes',
    'subtopic': 'Ventajas sobre punteros crudos',
    'definition': '''
Los punteros inteligentes ofrecen varias ventajas significativas sobre los punteros "crudos" (los punteros nativos de C++ como `int*`, `double*`, etc.) en términos de seguridad, gestión de memoria y claridad del código.

### 1. Gestión Automática de la Memoria

* **Punteros crudos**: Requieren que el programador gestione explícitamente la asignación y liberación de memoria usando `new` y `delete`. Olvidar `delete` conduce a fugas de memoria.
* **Punteros inteligentes**: Liberan automáticamente la memoria cuando ya no se necesitan, eliminando la posibilidad de fugas de memoria. `unique_ptr` y `shared_ptr` garantizan que la memoria se libere cuando el puntero inteligente sale de su ámbito o cuando ya no hay referencias al objeto.

### 2. Excepciones Seguras

* **Punteros crudos**: Si se lanza una excepción entre la asignación con `new` y la liberación con `delete`, la memoria no se libera. Esto se conoce como "fuga de memoria en presencia de excepciones".
* **Punteros inteligentes**: Garantizan que la memoria se libere incluso si se lanzan excepciones. El destructor del puntero inteligente siempre se llama cuando el objeto sale de su ámbito, independientemente de si se lanzó una excepción.

### 3. Evitan Punteros Colgantes (Dangling Pointers)

* **Punteros crudos**: Es posible que un puntero crudo apunte a una ubicación de memoria que ya ha sido liberada (un "puntero colgante"). Desreferenciar un puntero colgante conduce a un comportamiento indefinido.
* **Punteros inteligentes**: Reducen significativamente el riesgo de punteros colgantes. Con `unique_ptr`, la propiedad exclusiva evita que varios punteros apunten al mismo objeto. Con `shared_ptr`, el objeto se destruye solo cuando el último `shared_ptr` que apunta a él se destruye.

### 4. Claridad y Seguridad del Código

* **Punteros crudos**: Requieren una gestión manual y cuidadosa, lo que hace que el código sea más propenso a errores y más difícil de entender.
* **Punteros inteligentes**: Hacen que el código sea más claro y seguro. La semántica de propiedad (`unique_ptr` vs. `shared_ptr`) comunica claramente cómo se gestiona la memoria.

### 5. Facilidad de Uso

* **Punteros crudos**: Requieren desreferenciar explícitamente (`*ptr`) y verificar punteros nulos (`if (ptr != nullptr)`)
* **Punteros inteligentes**: Se usan de forma más natural, como si fueran punteros crudos, pero con mayor seguridad.

### Ejemplo Comparativo

El siguiente ejemplo ilustra las diferencias en el manejo de la memoria y la seguridad entre punteros crudos y punteros inteligentes.
''',
    'code_example': r'''
#include <iostream>
#include <memory>

class Recurso {
public:
    Recurso(const std::string& nombre) : nombre_(nombre) {
        std::cout << "Recurso '" << nombre_ << "' creado." << std::endl;
    }
    ~Recurso() {
        std::cout << "Recurso '" << nombre_ << "' destruido." << std::endl;
    }
    void usar() {
        std::cout << "Recurso '" << nombre_ << "' siendo usado." << std::endl;
    }
private:
    std::string nombre_;
};

// Ejemplo con punteros crudos (¡NO RECOMENDADO!)
void usarRecursoCrudo() {
    Recurso* ptr_crudo = new Recurso("RecursoCrudo");
    ptr_crudo->usar();
    // ...
    delete ptr_crudo; // ¡Si olvidamos esto, hay una fuga de memoria!
}

// Ejemplo con puntero inteligente (RECOMENDADO)
void usarRecursoInteligente() {
    std::unique_ptr<Recurso> ptr_inteligente = std::make_unique<Recurso>("RecursoInteligente");
    ptr_inteligente->usar();
    // No necesitamos delete. La memoria se libera automáticamente.
}

// Ejemplo de excepción con punteros crudos
void usarRecursoCrudoConExcepcion() {
    Recurso* ptr_crudo = new Recurso("RecursoCrudoExcepcion");
    try {
        ptr_crudo->usar();
        throw std::runtime_error("¡Ocurrio un error!");
    } catch (const std::exception& e) {
        std::cerr << "Excepcion capturada: " << e.what() << std::endl;
        delete ptr_crudo; // ¡Necesitamos liberar la memoria en el catch!
    }
} // Si olvidamos el delete en el catch, hay una fuga de memoria.

// Ejemplo de excepción con puntero inteligente
void usarRecursoInteligenteConExcepcion() {
    std::unique_ptr<Recurso> ptr_inteligente = std::make_unique<Recurso>("RecursoInteligenteExcepcion");
    try {
        ptr_inteligente->usar();
        throw std::runtime_error("¡Ocurrio un error!");
    } catch (const std::exception& e) {
        std::cerr << "Excepcion capturada: " << e.what() << std::endl;
        // No necesitamos delete. La memoria se libera automáticamente.
    }
} // La memoria se libera automáticamente, incluso si hay una excepción.

int main() {
    std::cout << "--- Ventajas de Punteros Inteligentes sobre Punteros Crudos ---" << std::endl;

    std::cout << "\nEjemplo con punteros crudos:" << std::endl;
    usarRecursoCrudo();

    std::cout << "\nEjemplo con punteros inteligentes:" << std::endl;
    usarRecursoInteligente();

    std::cout << "\nEjemplo de excepción con punteros crudos:" << std::endl;
    usarRecursoCrudoConExcepcion();

    std::cout << "\nEjemplo de excepción con punteros inteligentes:" << std::endl;
    usarRecursoInteligenteConExcepcion();

    std::cout << "\nFin del programa." << std::endl;
    return 0;
}
'''
  });
}

Future<void> insertJrLevel7DataCpp(Database db) async {
  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 7,
    'tittle_level': 'Estructuras de Datos Básicas',
    'topic': 'Estructuras (struct)',
    'subtopic': 'Declaración y uso',
    'definition': '''
Las estructuras, o `struct` en C++, son una forma genial de agrupar diferentes tipos de datos bajo un mismo nombre. Pensemos por un momento en cómo manejamos información compleja. Si quisieras guardar los datos de una persona (nombre, edad, altura, etc.), ¿usarías una variable para cada uno? Sería un desorden. Aquí es donde `struct` brilla, permitiéndote crear un "molde" o "plantilla" para organizar datos relacionados.

¿Seguramente pensarás de qué va todo esto?

La idea es que con un `struct` puedes definir tu propio tipo de dato. Por ejemplo, podrías crear un tipo `Persona` que contenga un `std::string` para el nombre, un `int` para la edad y un `double` para la altura. Una vez que defines este `struct`, puedes declarar variables de ese tipo, igual que declaras un `int` o un `float`. Es como si estuvieras diseñando una tarjeta de presentación con todos los campos que necesitas.

Lo interesante de `struct` es que, a diferencia de una clase, por defecto todos sus miembros son públicos. Esto significa que puedes acceder a ellos directamente desde cualquier parte del código donde tengas una instancia de esa estructura. Esto las hace ideales para agrupar datos sencillos sin preocuparse por la encapsulación o los métodos complejos que suelen ir en las clases. Son más ligeras en concepto y en uso, perfectas para organizar información de una manera coherente y fácil de manejar. Es una herramienta fundamental para construir estructuras de datos más complejas más adelante.
''',
    'code_example': r'''
#include <iostream>
#include <string>

// Declaración de una estructura para representar un punto en 2D
struct Punto {
    int x;
    int y;
};

// Declaración de una estructura para representar un Libro
struct Libro {
    std::string titulo;
    std::string autor;
    int anioPublicacion;
    double precio;
};

int main() {
    std::cout << "--- Declaracion y Uso de Estructuras ---" << std::endl;

    // 1. Uso de la estructura Punto
    // Declaración de una variable (instancia) de tipo Punto
    Punto p1;

    // Acceso y asignación de valores a los miembros de la estructura
    p1.x = 10;
    p1.y = 20;

    std::cout << "Coordenadas del Punto p1: (" << p1.x << ", " << p1.y << ")" << std::endl;

    // Puedes inicializar en la declaración (C++11 en adelante)
    Punto p2 = {30, 40}; // Inicialización agregada
    std::cout << "Coordenadas del Punto p2: (" << p2.x << ", " << p2.y << ")" << std::endl;

    std::cout << std::endl;

    // 2. Uso de la estructura Libro
    // Declaración y asignación de valores a una instancia de Libro
    Libro libro1;
    libro1.titulo = "Cien Anos de Soledad";
    libro1.autor = "Gabriel Garcia Marquez";
    libro1.anioPublicacion = 1967;
    libro1.precio = 15.99;

    std::cout << "Detalles del Libro 1:" << std::endl;
    std::cout << "  Titulo: " << libro1.titulo << std::endl;
    std::cout << "  Autor: " << libro1.autor << std::endl;
    std::cout << "  Anio: " << libro1.anioPublicacion << std::endl;
    std::cout << "  Precio: $" << libro1.precio << std::endl;

    // Ejemplo de un error común (no inicializar todos los miembros explícitamente y usar valores basura)
    // Libro libro_incompleto;
    // std::cout << "Titulo de libro_incompleto (podria ser basura): " << libro_incompleto.titulo << std::endl;

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 7,
    'tittle_level': 'Estructuras de Datos Básicas',
    'topic': 'Estructuras (struct)',
    'subtopic': 'Acceso a miembros',
    'definition': '''
Una vez que has definido una estructura y has creado una variable (o "instancia") de ella, la siguiente pregunta natural es: ¿cómo accedo a los datos que he agrupado dentro de ella? Aquí es donde entra en juego el operador de acceso a miembros, que es fundamental para interactuar con las estructuras.

¿Te estás preguntando por qué esto importa?

Porque sin este acceso, tu `struct` sería solo una caja bonita sin forma de sacar o meter nada. La forma más directa de acceder a un miembro de una estructura es usando el **operador punto (`.`)**. Si tienes una variable de tu `struct`, simplemente pones el nombre de la variable, luego un punto, y después el nombre del miembro al que quieres acceder. Es súper intuitivo y fácil de recordar.

Piensa en el `struct` como un expediente y cada miembro como un campo específico dentro de ese expediente, como "Nombre", "Edad" o "ID". El operador punto es como la etiqueta que te permite señalar exactamente qué campo quieres leer o modificar. Esto aplica tanto para leer el valor de un miembro (por ejemplo, `persona.edad`) como para asignarle un nuevo valor (como `persona.edad = 30`). Si estás trabajando con punteros a estructuras, la cosa cambia un poco: en lugar del punto, usarías el **operador flecha (`->`)**. Ambos operadores son esenciales para manipular la información que organizas cuidadosamente en tus estructuras.
''',
    'code_example': r'''
#include <iostream>
#include <string>

struct Producto {
    int id;
    std::string nombre;
    double precio;
    int stock;
};

int main() {
    std::cout << "--- Acceso a Miembros de Estructuras ---" << std::endl;

    // Crear una instancia de la estructura Producto
    Producto miProducto;

    // Acceso a miembros usando el operador punto (.) para asignar valores
    miProducto.id = 101;
    miProducto.nombre = "Laptop Gaming";
    miProducto.precio = 1250.75;
    miProducto.stock = 5;

    // Acceso a miembros usando el operador punto (.) para leer valores
    std::cout << "ID del Producto: " << miProducto.id << std::endl;
    std::cout << "Nombre del Producto: " << miProducto.nombre << std::endl;
    std::cout << "Precio del Producto: $" << miProducto.precio << std::endl;
    std::cout << "Stock disponible: " << miProducto.stock << std::endl;

    std::cout << std::endl;

    // Modificando un miembro directamente
    miProducto.stock -= 1; // Vendemos uno
    std::cout << "Nuevo stock despues de una venta: " << miProducto.stock << std::endl;

    std::cout << std::endl;

    // Acceso a miembros a través de un puntero a la estructura (operador flecha ->)
    Producto* ptrProducto = &miProducto; // Obtener la dirección de miProducto

    std::cout << "Acceso a traves de puntero (operador ->):" << std::endl;
    std::cout << "  Nombre: " << ptrProducto->nombre << std::endl;
    std::cout << "  Precio: $" << ptrProducto->precio << std::endl;

    // También puedes usar el operador asterisco y punto, pero es menos común y más verboso
    // std::cout << "  ID (via *ptr.id): " << (*ptrProducto).id << std::endl; // Ejemplo equivalente pero menos usado

    // Ejemplo de lo que NO se debe hacer (acceder a un puntero nulo)
    // Producto* punteroNulo = nullptr;
    // punteroNulo->nombre = "Error"; // Esto causaría un fallo en tiempo de ejecución si se desreferencia
    // if (punteroNulo != nullptr) {
    //     punteroNulo->usar(); // Siempre verificar si el puntero no es nulo antes de usarlo
    // }

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 7,
    'tittle_level': 'Estructuras de Datos Básicas',
    'topic': 'Estructuras (struct)',
    'subtopic': 'Anidamiento de estructuras',
    'definition': '''
El anidamiento de estructuras es una característica muy útil en C++ que te permite incluir una estructura dentro de otra. Pensemos por un momento en que estás diseñando un sistema para una empresa y necesitas almacenar la información de los empleados, pero también quieres detalles de su dirección, que a su vez tiene calle, número, ciudad, etc. ¿Crearías un montón de campos separados para cada parte de la dirección dentro del `struct` del empleado? No parece muy organizado, ¿verdad?

¿Seguramente pensarás que tiene mucho sentido agrupar esos datos de la dirección en su propia estructura?

Y sí, es exactamente así. El anidamiento te permite hacer eso, creando jerarquías lógicas de datos. Puedes definir un `struct Direccion` con sus campos (`calle`, `numero`, `ciudad`, `codigoPostal`) y luego, dentro de tu `struct Empleado`, simplemente incluyes un miembro de tipo `Direccion`. Esto no solo hace que tu código sea mucho más legible y fácil de mantener, sino que también refleja mejor las relaciones del mundo real entre los datos.

Para acceder a los miembros de una estructura anidada, simplemente encadenas los operadores punto (`.`). Por ejemplo, para acceder a la calle de la dirección de un empleado, harías algo como `empleado.direccion.calle`. Es una forma elegante y eficiente de organizar datos complejos, manteniendo la modularidad y la claridad. Esta técnica es fundamental cuando tus datos empiezan a tener más capas y quieres representarlos de una manera lógica y estructurada.
''',
    'code_example': r'''
#include <iostream>
#include <string>
#include <vector> // Necesario para std::vector

// Estructura para representar la fecha de nacimiento
struct Fecha {
    int dia;
    int mes;
    int anio;
};

// Estructura para representar la dirección
struct Direccion {
    std::string calle;
    int numero;
    std::string ciudad;
    std::string codigoPostal;
};

// Estructura principal para representar una Persona, que anida otras estructuras
struct Persona {
    std::string nombre;
    int edad;
    Fecha fechaNacimiento; // Miembro de tipo Fecha
    Direccion domicilio;    // Miembro de tipo Direccion
};

int main() {
    std::cout << "--- Anidamiento de Estructuras ---" << std::endl;

    // Crear una instancia de la estructura Persona
    Persona miPersona;

    // Asignar valores a los miembros, incluyendo los de las estructuras anidadas
    miPersona.nombre = "Ana Lopez";
    miPersona.edad = 30;

    // Acceder y asignar a los miembros de la estructura anidada Fecha
    miPersona.fechaNacimiento.dia = 15;
    miPersona.fechaNacimiento.mes = 7;
    miPersona.fechaNacimiento.anio = 1994;

    // Acceder y asignar a los miembros de la estructura anidada Direccion
    miPersona.domicilio.calle = "Avenida Siempre Viva";
    miPersona.domicilio.numero = 742;
    miPersona.domicilio.ciudad = "Springfield";
    miPersona.domicilio.codigoPostal = "12345";

    // Mostrar la información de la persona
    std::cout << "Nombre: " << miPersona.nombre << std::endl;
    std::cout << "Edad: " << miPersona.edad << " anios" << std::endl;
    std::cout << "Fecha de Nacimiento: "
              << miPersona.fechaNacimiento.dia << "/"
              << miPersona.fechaNacimiento.mes << "/"
              << miPersona.fechaNacimiento.anio << std::endl;
    std::cout << "Direccion: "
              << miPersona.domicilio.calle << " #"
              << miPersona.domicilio.numero << ", "
              << miPersona.domicilio.ciudad << " ("
              << miPersona.domicilio.codigoPostal << ")" << std::endl;

    std::cout << std::endl;

    // Ejemplo de una estructura que anida una estructura ya existente (de la biblioteca estándar)
    struct Estudiante {
        std::string nombre;
        int id;
        std::vector<double> calificaciones; // Anidando un vector (estructura de datos de la STL)
    };

    Estudiante estudiante1;
    estudiante1.nombre = "Carlos Perez";
    estudiante1.id = 12345;
    estudiante1.calificaciones.push_back(9.5);
    estudiante1.calificaciones.push_back(8.0);
    estudiante1.calificaciones.push_back(10.0);

    std::cout << "Informacion del Estudiante:" << std::endl;
    std::cout << "  Nombre: " << estudiante1.nombre << std::endl;
    std::cout << "  ID: " << estudiante1.id << std::endl;
    std::cout << "  Calificaciones: ";
    for (double cal : estudiante1.calificaciones) {
        std::cout << cal << " ";
    }
    std::cout << std::endl;

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 7,
    'tittle_level': 'Estructuras de Datos Básicas',
    'topic': 'Uniones (union)',
    'subtopic': 'Declaración y uso',
    'definition': '''
Las uniones, o `union` en C++, son como una especie de "estructura con superpoderes de ahorro de memoria" cuando se trata de datos que no necesitan coexistir al mismo tiempo. Pensemos por un momento en un escenario donde un dato puede ser de un tipo u otro, pero nunca ambos a la vez. Por ejemplo, en un sistema de procesamiento de medios, un archivo podría ser una imagen con sus propiedades, o un archivo de audio con las suyas. Guardar espacio para ambos simultáneamente sería un desperdicio si solo usaremos uno a la vez.

¿Alguna vez has pensado en cómo optimizar el uso de memoria para datos mutuamente excluyentes?

Una `union` te permite definir un bloque de memoria que puede ser interpretado de diferentes maneras, dependiendo del tipo de dato que guardes en ella en un momento dado. A diferencia de un `struct`, donde todos los miembros ocupan su propio espacio de memoria de forma simultánea, en una `union`, todos los miembros comparten la *misma* ubicación de memoria. Esto significa que el tamaño de la `union` será igual al tamaño de su miembro más grande. Cuando asignas un valor a un miembro de la unión, ese valor ocupa la memoria compartida, y cualquier valor que estuviera previamente allí (si fuera de otro miembro) se sobrescribe. Es crucial recordar que solo debes acceder al último miembro al que le asignaste un valor; intentar leer otro miembro resultaría en comportamiento indefinido. Son muy potentes para optimizar el uso de memoria en situaciones específicas donde la exclusividad del dato está garantizada.
''',
    'code_example': r'''
#include <iostream>
#include <string> // Necesario para std::string

// Declaración de una unión para almacenar un valor que puede ser int o float
union DatoNumerico {
    int entero;
    float flotante;
};

// Declaración de una unión más compleja para un "item" que puede ser una fruta o un coche
union Item {
    struct Fruta {
        std::string nombre;
        int cantidad;
    } fruta;

    struct Coche {
        std::string marca;
        int anio;
    } coche;
};

int main() {
    std::cout << "--- Declaracion y Uso de Uniones ---" << std::endl;

    // 1. Uso de la unión DatoNumerico
    DatoNumerico miDato;

    // Asignar y leer como entero
    miDato.entero = 10;
    std::cout << "Dato como entero: " << miDato.entero << std::endl;

    // Asignar y leer como flotante (esto sobrescribe el valor entero)
    miDato.flotante = 20.5f;
    std::cout << "Dato como flotante: " << miDato.flotante << std::endl;

    // ¡ADVERTENCIA! Intentar leer el entero después de asignar un flotante
    // resultará en comportamiento indefinido, ya que la memoria ha sido reinterpretada.
    // std::cout << "Dato como entero despues de flotante (¡RIESGO!): " << miDato.entero << std::endl;

    std::cout << std::endl;

    // 2. Uso de la unión Item con estructuras anidadas
    Item miItem;

    // Usar la unión para almacenar una fruta
    miItem.fruta.nombre = "Manzana";
    miItem.fruta.cantidad = 5;
    std::cout << "Item es una fruta: " << miItem.fruta.nombre << ", Cantidad: " << miItem.fruta.cantidad << std::endl;

    // Ahora usar la misma unión para almacenar un coche (sobrescribe la fruta)
    miItem.coche.marca = "Toyota";
    miItem.coche.anio = 2022;
    std::cout << "Item ahora es un coche: " << miItem.coche.marca << ", Anio: " << miItem.coche.anio << std::endl;

    // Ejemplo de error común: intentar acceder a la fruta después de asignar el coche
    // std::cout << "¡RIESGO! Nombre de la fruta despues de asignar coche: " << miItem.fruta.nombre << std::endl;

    // Un uso incorrecto (aunque técnicamente posible, lleva a errores si no se gestiona bien)
    // miItem.fruta.nombre = "Pera"; // Esto sobrescribe parcialmente los datos del coche, causando corrupción
    // std::cout << "Coche anio despues de corrupcion: " << miItem.coche.anio << std::endl; // Comportamiento indefinido

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 7,
    'tittle_level': 'Estructuras de Datos Básicas',
    'topic': 'Uniones (union)',
    'subtopic': 'Diferencias con struct',
    'definition': '''
Cuando hablamos de organizar datos en C++, es natural que surja la comparación entre `struct` y `union`. Ambas te permiten agrupar miembros de diferentes tipos de datos, pero la filosofía detrás de cada una y cómo gestionan la memoria es radicalmente distinta. Ignorar estas diferencias puede llevar a errores sutiles y difíciles de depurar, o a un uso ineficiente de la memoria.

¿Te has preguntado por qué existen dos conceptos aparentemente similares para agrupar datos?

La principal diferencia radica en cómo se asigna el espacio en memoria. En un `struct`, cada miembro tiene su propio espacio de memoria individual. Esto significa que si tienes un `struct` con un `int` y un `double`, el `struct` ocupará la suma del tamaño de un `int` más el tamaño de un `double` (más un posible `padding` para alineación). Todos los miembros de un `struct` coexisten en memoria al mismo tiempo, lo que te permite acceder a cualquiera de ellos en cualquier momento sin problemas.

Por otro lado, una `union` es un caso especial donde todos los miembros comparten la *misma* ubicación de memoria. El tamaño de la `union` será solo el tamaño de su miembro más grande. Esto implica que, en cualquier momento, solo uno de los miembros de la `union` puede contener un valor significativo. Cuando escribes en un miembro, sobrescribes el valor de cualquier otro miembro que estuviera usando esa misma memoria. Piénsalo como un solo casillero que puedes usar para guardar una pelota o un libro, pero no ambos a la vez. Si pones la pelota y luego el libro, la pelota ya no estará en el casillero. Esta gestión de memoria las hace útiles para ciertas optimizaciones, pero exige mucho cuidado para evitar leer datos incorrectos.
''',
    'code_example': r'''
#include <iostream>
#include <string>

// Definición de una estructura
struct S_MiDatos {
    int entero;
    float flotante;
    char caracter;
};

// Definición de una unión
union U_MiDatos {
    int entero;
    float flotante;
    char caracter;
};

int main() {
    std::cout << "--- Diferencias entre struct y union ---" << std::endl;

    // 1. Estructura (struct)
    S_MiDatos s_data;
    s_data.entero = 10;
    s_data.flotante = 3.14f;
    s_data.caracter = 'A';

    std::cout << "Valores de la estructura:" << std::endl;
    std::cout << "  Entero: " << s_data.entero << std::endl;
    std::cout << "  Flotante: " << s_data.flotante << std::endl;
    std::cout << "  Caracter: " << s_data.caracter << std::endl;
    std::cout << "Tamano de la estructura: " << sizeof(s_data) << " bytes" << std::endl;
    // Todos los miembros de la estructura pueden ser accedidos y mantienen sus valores simultáneamente.

    std::cout << std::endl;

    // 2. Unión (union)
    U_MiDatos u_data;

    u_data.entero = 10;
    std::cout << "Valores de la union (despues de asignar entero):" << std::endl;
    std::cout << "  Entero: " << u_data.entero << std::endl;
    // std::cout << "  Flotante (¡RIESGO! Comportamiento indefinido): " << u_data.flotante << std::endl;

    u_data.flotante = 3.14f; // Esto sobrescribe el 'entero'
    std::cout << "Valores de la union (despues de asignar flotante):" << std::endl;
    // std::cout << "  Entero (¡RIESGO! Comportamiento indefinido): " << u_data.entero << std::endl;
    std::cout << "  Flotante: " << u_data.flotante << std::endl;

    u_data.caracter = 'X'; // Esto sobrescribe el 'flotante'
    std::cout << "Valores de la union (despues de asignar caracter):" << std::endl;
    // std::cout << "  Flotante (¡RIESGO! Comportamiento indefinido): " << u_data.flotante << std::endl;
    std::cout << "  Caracter: " << u_data.caracter << std::endl;

    std::cout << "Tamano de la union: " << sizeof(u_data) << " bytes" << std::endl;
    // El tamaño de la unión es el del miembro más grande (probablemente float o int, 4 bytes en muchos sistemas)
    // Solo un miembro puede ser válido a la vez.

    // Comportamiento incorrecto y fuente de errores:
    // U_MiDatos error_union;
    // error_union.entero = 100;
    // std::cout << "Entero: " << error_union.entero << std::endl;
    // error_union.flotante = 50.5f; // Entero ahora es basura
    // std::cout << "Float: " << error_union.flotante << std::endl;
    // std::cout << "Entero (¡ERROR!): " << error_union.entero << std::endl; // Leyendo basura

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 7,
    'tittle_level': 'Estructuras de Datos Básicas',
    'topic': 'Uniones (union)',
    'subtopic': 'Casos de uso comunes',
    'definition': '''
Aunque las uniones no son tan ubicuas como las estructuras, tienen su nicho particular donde realmente brillan, especialmente en escenarios donde la eficiencia de memoria es crítica o cuando trabajas con datos que inherentemente son de "uno u otro" tipo. No se usan a diario en el código moderno si no hay una necesidad explícita.

¿Pensemos por un momento en cuándo realmente necesitamos usar una `union`?

Uno de los usos más clásicos es en el **manejo de datos variados**. Imagina un sistema que procesa mensajes, y un mensaje puede ser de tipo `texto`, `binario` o `JSON`. Cada tipo tiene una estructura de datos diferente. En lugar de crear un `struct` gigante que tenga espacio para todos ellos (y desperdicie memoria), puedes usar una `union` para almacenar el contenido del mensaje. Normalmente, esto va de la mano con un `enum` o una variable `flag` que indica qué tipo de dato se está almacenando actualmente en la `union`, para que siempre sepas qué miembro leer de forma segura.

Otro caso de uso es en la **interoperabilidad con hardware o protocolos de bajo nivel**, donde los datos vienen empaquetados de una forma específica y necesitas reinterpretar los mismos bytes como diferentes tipos de datos. Por ejemplo, leer un registro de un dispositivo que puede contener un estado numérico o un conjunto de banderas de bits. También son útiles en la implementación de **tipos variantes**, donde una variable puede contener diferentes tipos de datos en diferentes momentos, aunque en C++ moderno, `std::variant` (a partir de C++17) es la opción preferida y más segura para este propósito, ya que gestiona automáticamente el tipo activo y evita los errores de acceso que pueden ocurrir con las uniones crudas. Sin embargo, entender `union` es fundamental para apreciar las soluciones más avanzadas y para trabajar en contextos de bajo nivel.
''',
    'code_example': r'''
#include <iostream>
#include <string>
#include <variant> // Para std::variant (C++17+)

// Un caso de uso clásico: un tipo de mensaje que puede ser texto o un ID
enum class TipoMensaje {
    TEXTO,
    ID_USUARIO
};

struct Mensaje {
    TipoMensaje tipo;
    union Contenido {
        std::string texto; // ¡Cuidado! std::string es una clase, no un tipo trivial.
                           // El uso de string en union requiere gestión manual de constructor/destructor
                           // o envolverlo en un tipo POD como char[]. Para C++ moderno, std::variant es mejor.
        int idUsuario;
        // Para simplificar el ejemplo y evitar complejidades de lifetime,
        // usaremos char array en lugar de std::string directamente si queremos ser "puros" con union.
        // Pero para ilustrar el concepto, a veces se muestra así, sabiendo las limitaciones.
    } contenido;
};

// Ejemplo alternativo y más seguro con std::variant (C++17+)
// Si no tienes C++17 o quieres algo más "básico", la union con un char[] es la opción.
struct MensajeSeguro {
    TipoMensaje tipo;
    std::variant<std::string, int> contenido; // Ahora podemos tener string o int de forma segura
};

int main() {
    std::cout << "--- Casos de Uso Comunes de Uniones ---" << std::endl;

    // Ejemplo 1: Mensaje con union (requiere gestión manual o tipos simples)
    Mensaje msg1;
    msg1.tipo = TipoMensaje::TEXTO;
    // Esto es problemático porque std::string no es "Plain Old Data" (POD)
    // y su constructor/destructor no se llaman automáticamente en una union.
    // Para unions "puras", deberías usar char arrays o tipos POD.
    // msg1.contenido.texto = "Hola mundo!"; // Esto puede causar problemas de memoria/lifetime.
    // Para simplificar, usemos un char array como ejemplo de texto en una union
    
    // Ejemplo de un union con tipos POD (Plain Old Data) para evitar problemas
    union DatoSimple {
        int numero;
        char caracter[5]; // Array de caracteres para un texto corto
    };

    DatoSimple d_simple;
    d_simple.numero = 123;
    std::cout << "Dato simple (numero): " << d_simple.numero << std::endl;

    // Cuidado al copiar strings en char arrays en unions:
    // strncpy(d_simple.caracter, "ABCD", 5); // Necesario para copiar con seguridad
    // d_simple.caracter[4] = '\0'; // Asegurar terminación nula
    // std::cout << "Dato simple (caracter): " << d_simple.caracter << std::endl;


    std::cout << std::endl;
    // Ejemplo 2: Mensaje con std::variant (C++17+), la forma moderna y segura
    MensajeSeguro msg_seguro1;
    msg_seguro1.tipo = TipoMensaje::TEXTO;
    msg_seguro1.contenido = "Este es un mensaje de texto."; // Asigna std::string
    std::cout << "Mensaje seguro (texto): " << std::get<std::string>(msg_seguro1.contenido) << std::endl;

    MensajeSeguro msg_seguro2;
    msg_seguro2.tipo = TipoMensaje::ID_USUARIO;
    msg_seguro2.contenido = 98765; // Asigna int
    std::cout << "Mensaje seguro (ID): " << std::get<int>(msg_seguro2.contenido) << std::endl;

    // std::get te permite acceder al tipo correcto, si intentas acceder al tipo incorrecto, lanza std::bad_variant_access
    // try {
    //     std::cout << std::get<std::string>(msg_seguro2.contenido) << std::endl; // Esto lanzaría una excepción
    // } catch (const std::bad_variant_access& e) {
    //     std::cerr << "Error al acceder a std::variant: " << e.what() << std::endl;
    // }

    std::cout << "\nNota sobre std::string en unions: Usar std::string directamente en uniones puede ser peligroso "
              << "porque std::string es una clase con constructor/destructor. "
              << "Las unions no llaman a estos automaticamente. Para C++ moderno, std::variant es la solucion segura." << std::endl;

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 7,
    'tittle_level': 'Estructuras de Datos Básicas',
    'topic': 'Enumeraciones Avanzadas',
    'subtopic': 'Uso avanzado de enum class',
    'definition': '''
Si ya has trabajado con las enumeraciones básicas (`enum`), sabrás que son útiles para asignar nombres legibles a valores enteros. Sin embargo, C++ tiene una versión mejorada, las `enum class` (también conocidas como *scoped enums*), que resuelven algunos de los problemas y ambigüedades de las enumeraciones tradicionales. Las `enum class` te ofrecen una mayor seguridad de tipo y una semántica más clara, lo que las convierte en la opción preferida en C++ moderno.

¿Te has preguntado cómo evitar colisiones de nombres con enumeraciones tradicionales?

La principal ventaja de `enum class` es que sus enumeradores están "scoped", es decir, están dentro del ámbito de la enumeración. Esto significa que para acceder a un enumerador, tienes que usar el nombre de la enumeración seguido del operador de resolución de ámbito (`::`), por ejemplo, `Color::Rojo`. Esto evita colisiones de nombres con otros enumeradores o variables globales, un problema común con los `enum` tradicionales que "exportan" sus nombres al ámbito global. Además, `enum class` no se convierte implícitamente a tipos enteros, lo que te da una seguridad de tipo mucho mayor, previniendo errores donde accidentalmente comparas una enumeración con un entero que no representa un valor válido para esa enumeración. Son robustas y hacen tu código más predecible.
''',
    'code_example': r'''
#include <iostream>
#include <string>

// Enumeración tradicional (sin ámbito y conversión implícita)
enum DireccionClasica {
    NORTE,
    SUR,
    ESTE,
    OESTE
};

// Enumeración con ámbito (enum class)
enum class Direccion {
    NORTE,
    SUR,
    ESTE,
    OESTE
};

// También puedes especificar el tipo subyacente (por defecto es int)
enum class EstadoConcreto : unsigned char {
    APAGADO = 0,
    ENCENDIDO = 1,
    EN_ESPERA = 2
};

void mover(Direccion dir) {
    switch (dir) {
        case Direccion::NORTE: // Acceso con ámbito
            std::cout << "Moviendo al Norte" << std::endl;
            break;
        case Direccion::SUR:
            std::cout << "Moviendo al Sur" << std::endl;
            break;
        case Direccion::ESTE:
            std::cout << "Moviendo al Este" << std::endl;
            break;
        case Direccion::OESTE:
            std::cout << "Moviendo al Oeste" << std::endl;
            break;
    }
}

int main() {
    std::cout << "--- Uso Avanzado de enum class ---" << std::endl;

    // Uso de enum tradicional (puede causar colisiones de nombres)
    DireccionClasica d_clasica = NORTE; // NORTE está en el ámbito global
    std::cout << "Direccion clasica: " << d_clasica << std::endl; // Se imprime como entero

    std::cout << std::endl;

    // Uso de enum class (seguro y con ámbito)
    Direccion d = Direccion::ESTE; // Debes usar el nombre del enum para acceder
    mover(d);

    // No se puede convertir implícitamente a int
    // int val = Direccion::SUR; // ERROR de compilación: no hay conversión implícita
    int val_explicito = static_cast<int>(Direccion::SUR); // Conversión explícita es necesaria
    std::cout << "Valor entero de Direccion::SUR: " << val_explicito << std::endl;

    std::cout << std::endl;

    // Uso de enum class con tipo subyacente específico
    EstadoConcreto estado = EstadoConcreto::ENCENDIDO;
    std::cout << "Estado actual (valor): " << static_cast<int>(estado) << std::endl;

    // Ejemplo de error que enum class evita:
    // int mi_entero = 0;
    // if (mi_entero == NORTE) { // Con enum clasico, esto compila y es confuso
    //     std::cout << "Esto es confuso con enum clasico." << std::endl;
    // }
    // if (mi_entero == Direccion::NORTE) { // Con enum class, ERROR de compilación
    //     std::cout << "Esto es claro con enum class." << std::endl;
    // }


    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 7,
    'tittle_level': 'Estructuras de Datos Básicas',
    'topic': 'Enumeraciones Avanzadas',
    'subtopic': 'Conversión entre enums y tipos primitivos',
    'definition': '''
A veces, por muy útiles y seguras que sean las `enum class`, te encontrarás en situaciones donde necesitas interactuar con sistemas o bibliotecas que esperan un tipo numérico (como un `int` o un `char`) en lugar de tu enumeración. O quizás, al revés, recibes un número y necesitas saber a qué enumerador corresponde. Aquí es donde las conversiones se vuelven importantes, pero hay que hacerlas de la forma correcta para mantener la seguridad que nos ofrecen las `enum class`.

¿Te has preguntado cómo puedes usar un `enum class` en una función que espera un número, sin romper la seguridad de tipos?

A diferencia de los `enum` tradicionales, las `enum class` no se convierten automáticamente a tipos enteros. Esta es una de sus mayores ventajas, ya que previene errores sutiles. Para convertir un valor de `enum class` a un tipo primitivo (como `int` o `long`), necesitas usar un `static_cast` explícito. Por ejemplo, `static_cast<int>(MiEnum::Valor)`. Esto te obliga a ser consciente de la conversión que estás realizando, lo que es una buena práctica para evitar sorpresas.

Para la conversión inversa, es decir, de un tipo primitivo a un `enum class`, también se usa `static_cast`. Sin embargo, aquí la cautela es doble: debes asegurarte de que el valor numérico que estás convirtiendo realmente corresponda a uno de los enumeradores definidos. Si intentas convertir un número que no es un enumerador válido, el resultado será un objeto de la enumeración con un valor subyacente inválido, lo cual puede llevar a comportamiento inesperado si no lo manejas correctamente. Es vital tener un mecanismo para validar estas conversiones, como un `switch` o un mapa de valores, si la seguridad es crítica.
''',
    'code_example': r'''
#include <iostream>
#include <string>
#include <map> // Para el ejemplo de mapeo

enum class CodigoError : int { // Especificamos int como tipo subyacente
    EXITO = 0,
    ARCHIVO_NO_ENCONTRADO = 1,
    PERMISO_NEGADO = 2,
    MEMORIA_INSUFICIENTE = 3
};

// Función que simula una API antigua que espera un int
void procesarEstado(int estadoNumerico) {
    std::cout << "API recibio estado numerico: " << estadoNumerico << std::endl;
    // Aquí podríamos convertir de int a CodigoError si fuera necesario
    // if (static_cast<CodigoError>(estadoNumerico) == CodigoError::EXITO) { ... }
}

int main() {
    std::cout << "--- Conversion entre Enums y Tipos Primitivos ---" << std::endl;

    // 1. Convertir de enum class a tipo primitivo (int)
    CodigoError miError = CodigoError::ARCHIVO_NO_ENCONTRADO;
    int errorNumerico = static_cast<int>(miError); // Conversion explicita
    std::cout << "CodigoError::ARCHIVO_NO_ENCONTRADO como int: " << errorNumerico << std::endl;

    procesarEstado(errorNumerico); // Se puede pasar a funciones que esperan int

    // 2. Convertir de tipo primitivo (int) a enum class
    int estadoRecibido = 0; // Podría venir de una función o una entrada
    CodigoError estadoConvertido = static_cast<CodigoError>(estadoRecibido);
    std::cout << "Int 0 convertido a CodigoError: " << static_cast<int>(estadoConvertido) << std::endl;

    // ¡CUIDADO! Convertir un valor no mapeado
    int valorDesconocido = 99;
    CodigoError errorDesconocido = static_cast<CodigoError>(valorDesconocido);
    std::cout << "Int 99 convertido a CodigoError (posible valor invalido): " << static_cast<int>(errorDesconocido) << std::endl;
    // No hay garantía de que `errorDesconocido` sea un valor válido de `CodigoError`

    std::cout << std::endl;

    // Buenas prácticas: Usar un mapa para mapear valores de enum a strings (o viceversa)
    std::map<CodigoError, std::string> mensajesError = {
        {CodigoError::EXITO, "Operacion exitosa"},
        {CodigoError::ARCHIVO_NO_ENCONTRADO, "Error: Archivo no encontrado"},
        {CodigoError::PERMISO_NEGADO, "Error: Permiso denegado"},
        {CodigoError::MEMORIA_INSUFICIENTE, "Error: Memoria insuficiente"}
    };

    if (mensajesError.count(miError)) { // Verificar si el error existe en el mapa
        std::cout << "Mensaje para miError: " << mensajesError[miError] << std::endl;
    } else {
        std::cout << "Error desconocido: " << static_cast<int>(miError) << std::endl;
    }

    // Un ejemplo de conversión incorrecta (implicitamente, lo que enum class previene)
    // if (miError == 1) { // Esto generaría un error de compilación, lo cual es bueno.
    //     std::cout << "Comparacion implicita (ERROR)." << std::endl;
    // }

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 7,
    'tittle_level': 'Estructuras de Datos Básicas',
    'topic': 'Enumeraciones Avanzadas',
    'subtopic': 'Buenas prácticas',
    'definition': '''
Usar enumeraciones de manera efectiva puede mejorar la legibilidad y seguridad de tu código, pero como casi todo en programación, hay formas mejores y peores de hacerlo. Seguir algunas buenas prácticas te ayudará a evitar problemas comunes y a sacar el máximo provecho de las `enum class` en C++.

¿Te estás preguntando cómo escribir enumeraciones que sean realmente robustas y fáciles de entender para otros?

La primera regla de oro es **preferir `enum class` sobre `enum` tradicional**. Esto se debe a que `enum class` proporciona seguridad de tipo (no hay conversiones implícitas a enteros) y un ámbito propio para sus enumeradores, lo que evita colisiones de nombres. Es una forma de encapsular mejor tus conjuntos de constantes. Otro consejo importante es **especificar el tipo subyacente** si tienes requisitos de tamaño o interoperabilidad específicos (por ejemplo, `: unsigned char` o `: long long`). Esto te da un control explícito sobre la memoria y asegura que el `enum` se comporte como esperas en diferentes plataformas o al interactuar con APIs externas.

Considera siempre **dar nombres descriptivos** tanto a la enumeración como a sus enumeradores. Evita abreviaturas crípticas; un nombre claro como `DireccionMovimiento` es mucho mejor que `DirMov`. Finalmente, para la conversión de un valor numérico a una `enum class`, **valida siempre el valor**. Como mencionamos antes, un `static_cast` ciego puede producir un `enum class` con un valor subyacente que no corresponde a ningún enumerador válido. Puedes usar un `switch` o un mapa (`std::map`) para verificar si el valor numérico realmente pertenece a tu enumeración antes de procesarlo, lo que evitará errores lógicos y comportamientos indefinidos en tu aplicación.
''',
    'code_example': r'''
#include <iostream>
#include <string>
#include <map> // Para mapear enums a strings
#include <stdexcept> // Para std::out_of_range

// BUENA PRÁCTICA 1: Usar enum class
enum class NivelRegistro : char { // BUENA PRÁCTICA 2: Especificar tipo subyacente
    DEBUG = 'D',
    INFO = 'I',
    ADVERTENCIA = 'W',
    ERROR = 'E',
    CRITICO = 'C'
};

// BUENA PRÁCTICA 3: Función de utilidad para convertir enum class a string
// Esto mejora la legibilidad al imprimir
std::string nivelRegistroToString(NivelRegistro nivel) {
    switch (nivel) {
        case NivelRegistro::DEBUG:     return "DEBUG";
        case NivelRegistro::INFO:      return "INFO";
        case NivelRegistro::ADVERTENCIA: return "ADVERTENCIA";
        case NivelRegistro::ERROR:     return "ERROR";
        case NivelRegistro::CRITICO:   return "CRITICO";
        default: return "DESCONOCIDO"; // BUENA PRÁCTICA 4: Manejar casos inesperados
    }
}

// BUENA PRÁCTICA 4 (parte 2): Validar la conversión de primitivo a enum
// Usar un mapa para validar y obtener el enum de un valor primitivo
std::map<char, NivelRegistro> charToNivelRegistro = {
    {'D', NivelRegistro::DEBUG},
    {'I', NivelRegistro::INFO},
    {'W', NivelRegistro::ADVERTENCIA},
    {'E', NivelRegistro::ERROR},
    {'C', NivelRegistro::CRITICO}
};

NivelRegistro charANivelRegistroSeguro(char c) {
    auto it = charToNivelRegistro.find(c);
    if (it != charToNivelRegistro.end()) {
        return it->second;
    }
    // Si no se encuentra, puedes lanzar una excepción o devolver un valor por defecto
    throw std::out_of_range("Caracter de nivel de registro invalido: " + std::string(1, c));
}

int main() {
    std::cout << "--- Buenas Practicas con Enumeraciones ---" << std::endl;

    NivelRegistro nivel1 = NivelRegistro::INFO;
    std::cout << "Nivel 1: " << nivelRegistroToString(nivel1) << std::endl;

    NivelRegistro nivel2 = NivelRegistro::ERROR;
    std::cout << "Nivel 2: " << nivelRegistroToString(nivel2) << std::endl;

    std::cout << std::endl;

    // Demostrando la conversión segura de char a enum class
    try {
        NivelRegistro nivelDesdeChar = charANivelRegistroSeguro('W');
        std::cout << "Nivel desde char 'W': " << nivelRegistroToString(nivelDesdeChar) << std::endl;

        NivelRegistro nivelDesdeCharInvalido = charANivelRegistroSeguro('X'); // Esto lanzará una excepción
        std::cout << "Nivel desde char 'X': " << nivelRegistroToString(nivelDesdeCharInvalido) << std::endl;
    } catch (const std::out_of_range& e) {
        std::cerr << "Error: " << e.what() << std::endl;
    }

    std::cout << std::endl;

    // MALAS PRÁCTICAS (evitar):
    // 1. Usar enum tradicionales que "contaminan" el ámbito global:
    // enum TipoArchivo { TXT, PDF, JPG };
    // int tipo = TXT; // TXT es visible globalmente

    // 2. No especificar el tipo subyacente si hay una razón para ello:
    // enum class Direccion { ARRIBA, ABAJO }; // No se sabe el tamaño exacto si importa

    // 3. Conversiones implícitas (no posibles con enum class, lo cual es bueno):
    // if (NivelRegistro::DEBUG == 0) { /* ... */ } // Esto no compila, y es correcto.

    return 0;
}
'''
  });
}

Future<void> insertJrLevel8DataCpp(Database db) async {
  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 8,
    'tittle_level': 'Buenas Prácticas y Estilo de Código',
    'topic': 'Convenciones de Nomenclatura',
    'subtopic': 'Estilos comunes (CamelCase, snake_case)',
    'definition': '''
Las convenciones de nomenclatura son como el lenguaje secreto que usas para nombrar tus variables, funciones, clases y todo lo que creas en tu código. Pensemos por un momento en cómo nombrarías los archivos en tu computadora. ¿Usarías nombres genéricos como "archivo1", "archivo2", o nombres más descriptivos como "informe_ventas_2024_Q1"? En programación, pasa exactamente lo mismo: elegir buenos nombres hace que tu código sea muchísimo más fácil de leer y entender, tanto para ti en el futuro como para cualquier otro programador que lo vea.

¿Alguna vez te has preguntado por qué algunos códigos parecen tener un estilo tan particular en sus nombres?

Existen varios estilos comunes de nomenclatura que la comunidad de desarrollo ha adoptado a lo largo del tiempo. Los dos más extendidos son:

* **CamelCase**: Este estilo se caracteriza por escribir las palabras juntas, con la primera letra de cada palabra (excepto la primera, en su variante `camelCase`) en mayúscula.
    * **`camelCase` (o `lowerCamelCase`)**: La primera letra de la primera palabra va en minúscula, y las primeras letras de las palabras subsiguientes van en mayúscula. Es muy común para nombres de variables y funciones en lenguajes como Java o JavaScript. Un ejemplo podría ser `nombreDeUsuario` o `calcularTotal`.
    * **`PascalCase` (o `UpperCamelCase`)**: La primera letra de *todas* las palabras va en mayúscula. Es el estilo preferido para nombres de clases y tipos en muchos lenguajes, incluyendo C# y, a menudo, C++. Un ejemplo sería `MiClase` o `SistemaGestionDeInventario`.
* **`snake_case`**: En este estilo, todas las palabras se escriben en minúscula y se separan con guiones bajos (`_`). Es muy popular en lenguajes como Python y en partes de la comunidad de C++. Lo verías en nombres como `nombre_de_usuario`, `calcular_total`, o `mi_clase`.

La clave con estos estilos es la **consistencia**. Es menos importante cuál estilo elijas, y mucho más importante que, una vez elegido, lo uses de forma uniforme en todo tu proyecto. Si en un equipo unos usan `camelCase` y otros `snake_case` para lo mismo, el código se vuelve una mezcla confusa. Un código consistente en su nomenclatura es una señal de profesionalismo y facilita enormemente el mantenimiento.
''',
    'code_example': r'''
#include <iostream>
#include <string>

// Estilo PascalCase para nombres de clases/estructuras
class CalculadoraImpuestos {
public:
    // Estilo camelCase para nombres de funciones
    double calcularImpuesto(double ingresoBruto) {
        // Estilo camelCase para nombres de variables locales
        double tasaImpositiva = 0.15;
        double impuestoCalculado = ingresoBruto * tasaImpositiva;
        return impuestoCalculado;
    }
};

// Estilo snake_case para nombres de funciones globales o variables constantes
const double PI_VALUE = 3.14159; // snake_case con mayúsculas para constantes
double calcular_area_circulo(double radio) {
    return PI_VALUE * radio * radio;
}

// Otro ejemplo de snake_case para una estructura
struct DatosCliente {
    int id_cliente;
    std::string nombre_completo;
    std::string correo_electronico;
};

int main() {
    std::cout << "--- Estilos de Nomenclatura Comunes ---" << std::endl;

    // Uso de PascalCase para clase y camelCase para metodo
    CalculadoraImpuestos miCalculadora;
    double miIngreso = 50000.0;
    double impuestoAPagar = miCalculadora.calcularImpuesto(miIngreso);
    std::cout << "Impuesto a pagar (camelCase): $" << impuestoAPagar << std::endl;

    std::cout << std::endl;

    // Uso de snake_case para funcion y variable
    double miRadio = 5.0;
    double area = calcular_area_circulo(miRadio);
    std::cout << "Area del circulo (snake_case): " << area << std::endl;

    std::cout << std::endl;

    // Ejemplo de uso de struct con snake_case para miembros
    DatosCliente cliente1;
    cliente1.id_cliente = 12345;
    cliente1.nombre_completo = "Juan Perez";
    cliente1.correo_electronico = "juan.perez@example.com";

    std::cout << "Datos del Cliente:" << std::endl;
    std::cout << "  ID: " << cliente1.id_cliente << std::endl;
    std::cout << "  Nombre: " << cliente1.nombre_completo << std::endl;
    std::cout << "  Email: " << cliente1.correo_electronico << std::endl;

    // Un mal ejemplo (mezclar estilos sin razon o usar nombres confusos)
    // int x; // Muy generico
    // double calculo_De_Costo; // Mezcla de estilos (camelCase y snake_case)
    // void procesar_Datos_DeCliente(); // No sigue una convención clara consistentemente

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 8,
    'tittle_level': 'Buenas Prácticas y Estilo de Código',
    'topic': 'Convenciones de Nomenclatura',
    'subtopic': 'Nombres significativos y legibilidad',
    'definition': '''
El corazón de un buen estilo de código no reside en la cantidad de líneas que escribes, sino en lo fácil que es entenderlas. La legibilidad comienza, sin duda alguna, con nombres significativos. Pensemos por un momento en un libro o un manual: ¿lo entenderías si los capítulos tuvieran títulos como "C1", "C2", o si usaran nombres descriptivos como "Introducción a la Programación Orientada a Objetos" o "Manejo de Excepciones"? En el código, los nombres de tus variables, funciones, y clases son precisamente eso: los títulos de los capítulos que guían la lectura y comprensión.

¿Alguna vez te has encontrado con un código que parece un acertijo, lleno de nombres abreviados y prácticamente indescifrables, que te hacen perder horas tratando de entender qué demonios hacen?

Un nombre significativo es aquel que comunica de forma clara e inequívoca la intención, el propósito o el contenido de lo que está nombrando. La regla de oro es: **evita las abreviaturas crípticas y los nombres de una sola letra** (a menos que sean contadores en bucles muy cortos y obvios, como `i` para un índice). Un nombre como `contador` es una mejora sobre `c`, pero `numeroDeElementosProcesados` es aún mejor si describe con precisión qué es lo que esa variable está contando. Para las funciones, un nombre como `calcular` es demasiado vago; `calcularImpuestoTotal` o `obtenerNombreUsuario` son mucho más descriptivos y te dicen exactamente qué esperar cuando llamas a esa función.

La legibilidad no es solo un capricho estético; es una necesidad práctica. Un código con nombres claros y descriptivos es:
* **Más fácil de entender**: Reduces la carga cognitiva, ya que no tienes que descifrar qué significa cada nombre.
* **Más fácil de depurar**: Cuando algo falla, puedes rastrear el problema más rápidamente porque los nombres te guían.
* **Más fácil de mantener y extender**: Los cambios y las nuevas funcionalidades se integran con menos riesgo de introducir nuevos errores.
* **Más colaborativo**: Otros programadores (incluido tu yo del futuro) pueden entender y contribuir a tu trabajo sin necesidad de una explicación exhaustiva.

En esencia, invertir tiempo en elegir nombres significativos es una inversión en la calidad, mantenibilidad y sostenibilidad de tu proyecto de software.
''',
    'code_example': r'''
#include <iostream>
#include <string>
#include <vector>

// MAL EJEMPLO: Nombres poco significativos o abreviados
// int c; // ¿Qué cuenta?
// void proc(); // ¿Qué procesa?
// class mgr; // ¿Qué gestiona?

// BUENAS PRÁCTICAS: Nombres significativos y legibles

// Nombres claros para variables
int cantidadProductosEnInventario = 150; // Mejor que 'cantProd' o 'cp'
double precioUnitarioSinIVA = 25.50;    // Mejor que 'p' o 'pu'

// Nombres claros para funciones
// Indica claramente lo que hace la función
double calcularPrecioFinalConImpuestos(double precioBase, double tasaImpuesto) {
    return precioBase * (1.0 + tasaImpuesto);
}

// Indica claramente lo que obtiene la función
std::string obtenerNombreCompletoUsuario(const std::string& nombre, const std::string& apellido) {
    return nombre + " " + apellido;
}

// Nombres claros para clases/estructuras
// Comunica el propósito de la clase
class GestorDePedidosOnline {
public:
    void agregarProductoAlCarrito(int idProducto, int cantidad) {
        // Lógica para agregar al carrito
        std::cout << "Producto " << idProducto << " (x" << cantidad << ") agregado al carrito." << std::endl;
    }
    // ... mas metodos relevantes
};

// Ejemplo con un vector de datos de clientes
struct Cliente {
    int idCliente; // Claramente el ID del cliente
    std::string nombreCliente; // Claramente el nombre del cliente
    std::string emailContacto; // Claramente el email para contacto
};

int main() {
    std::cout << "--- Nombres Significativos y Legibilidad ---" << std::endl;

    // Uso de variables con nombres significativos
    double costoInicial = 100.0;
    double porcentajeDescuento = 0.10; // Es un 10%
    double costoConDescuento = costoInicial * (1.0 - porcentajeDescuento);
    std::cout << "Costo inicial: $" << costoInicial << std::endl;
    std::cout << "Porcentaje de descuento: " << porcentajeDescuento * 100 << "%" << std::endl;
    std::cout << "Costo con descuento: $" << costoConDescuento << std::endl;

    std::cout << std::endl;

    // Uso de funciones con nombres significativos
    double tasaIVA = 0.16;
    double precioConIVA = calcularPrecioFinalConImpuestos(precioUnitarioSinIVA, tasaIVA);
    std::cout << "Precio unitario sin IVA: $" << precioUnitarioSinIVA << std::endl;
    std::cout << "Precio final con IVA: $" << precioConIVA << std::endl;

    std::string nombre = "Ana";
    std::string apellido = "Garcia";
    std::string nombreCompleto = obtenerNombreCompletoUsuario(nombre, apellido);
    std::cout << "Nombre completo: " << nombreCompleto << std::endl;

    std::cout << std::endl;

    // Uso de clases con nombres significativos
    GestorDePedidosOnline sistemaPedidos;
    sistemaPedidos.agregarProductoAlCarrito(405, 2);

    std::cout << std::endl;

    // Creacion y uso de struct con nombres claros
    Cliente miCliente;
    miCliente.idCliente = 789;
    miCliente.nombreCliente = "Elena Rodriguez";
    miCliente.emailContacto = "elena.r@email.com";
    std::cout << "Cliente ID: " << miCliente.idCliente << std::endl;
    std::cout << "Cliente Nombre: " << miCliente.nombreCliente << std::endl;

    // MAL EJEMPLO EN CONTEXTO REAL:
    // std::vector<Cliente> c; // 'c' es un nombre vago para un vector de clientes
    // for (int i = 0; i < c.size(); ++i) { // 'i' es aceptable aqui, pero si el bucle es largo, mejor un nombre mas descriptivo
    //     std::cout << c[i].n << std::endl; // 'n' para nombre es malo
    // }

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 8,
    'tittle_level': 'Buenas Prácticas y Estilo de Código',
    'topic': 'Comentarios y Documentación',
    'subtopic': 'Comentarios en línea y de bloque',
    'definition': '''
Los comentarios son como notas que agregas a tu código para explicar qué hace, cómo funciona o por qué se hizo de cierta manera. Pensemos por un momento en un manual de instrucciones: ¿sería útil si solo tuviera los pasos a seguir sin ninguna explicación, sin ninguna aclaración de por qué ese paso es importante? Los comentarios cumplen esa misma función vital, pero dentro de tu código fuente. Son para los humanos que lo leerán, no para el compilador.

¿Te has preguntado alguna vez por qué algunos programadores parecen hablar consigo mismos en medio del código?

Pues bien, no están hablando solos, ¡están dejando pistas para el futuro! Existen dos tipos principales de comentarios en C++ que te permiten hacer esto:

* **Comentarios en línea (`//`)**: Son breves y se usan para explicar una sola línea de código o una pequeña sección muy específica. Todo lo que escribas después de `//` hasta el final de la línea será ignorado por el compilador. Son perfectos para aclarar una variable, una operación particular o una condición.
    ```c++
    int contador = 0; // Inicializa el contador a cero para el bucle
    ```
* **Comentarios de bloque (`/* ... */`)**: Pueden abarcar múltiples líneas y se delimitan con `/*` al principio y `*/` al final. Son ideales para explicaciones más extensas, como el propósito de una función completa, la lógica compleja de un algoritmo o incluso para deshabilitar temporalmente grandes secciones de código durante la depuración.
    ```c++
    /*
    Esta función compleja se encarga de calcular el promedio
    ponderado de calificaciones de un estudiante.
    Considera los créditos de cada materia.
    */
    double calcularPromedioPonderado(...) {
        // ...
    }
    ```

Un buen comentario es conciso, claro y, lo más importante, aporta valor. No repitas lo que el código ya dice de forma obvia (por ejemplo, `x = 5; // x es igual a 5` es completamente redundante e inútil). En su lugar, explica el *por qué* detrás de una decisión de diseño, las suposiciones que se hicieron, o cualquier detalle que no sea inmediatamente obvio a simple vista. Los mejores comentarios explican la intención, no la operación.
''',
    'code_example': r'''
#include <iostream>
#include <vector>
#include <numeric> // Para std::accumulate

/*
 * Este programa demuestra el uso de comentarios en línea y de bloque
 * para mejorar la legibilidad y comprensión del código C++.
 * Es fundamental para la colaboración y el mantenimiento a largo plazo.
 */

// Definición de una estructura simple para representar un estudiante
struct Estudiante {
    std::string nombre; // Nombre completo del estudiante
    int edad;           // Edad del estudiante en años
    double promedio;    /* Promedio general de calificaciones
                           Calculado sobre todas las materias. */
};

/**
 * @brief Calcula la suma de todos los elementos en un vector de enteros.
 * Esta función es un ejemplo de un bloque de comentario para una función.
 * @param numeros Un vector constante de enteros.
 * @return La suma total de los elementos.
 */
int calcularSuma(const std::vector<int>& numeros) {
    int suma = 0; // Inicializa la suma a cero
    for (int num : numeros) { // Itera sobre cada número en el vector
        suma += num; // Acumula el valor actual en la suma
    }
    return suma; // Devuelve el resultado final de la suma
}

int main() {
    std::cout << "--- Comentarios en linea y de bloque ---" << std::endl;

    // Crear un vector de números para sumar
    std::vector<int> misNumeros = {10, 20, 30, 40, 50}; // Números de ejemplo

    // Llamar a la función para calcular la suma
    int resultadoSuma = calcularSuma(misNumeros); // Se llama a la funcion auxiliar

    // Imprimir el resultado en la consola
    std::cout << "La suma de los numeros es: " << resultadoSuma << std::endl;

    // Ejemplo de un comentario de bloque para deshabilitar temporalmente código:
    /*
    // Este bloque de código está temporalmente deshabilitado
    // para probar otra funcionalidad.
    std::cout << "Este mensaje no se mostrara." << std::endl;
    // int x = 10;
    // std::cout << x << std::endl;
    */

    std::cout << std::endl;

    // MAL EJEMPLO: Comentarios redundantes que no aportan valor
    int a = 5; // Declara una variable entera 'a' y le asigna el valor 5

    // MAL EJEMPLO: Explicar lo obvio
    // for (int i = 0; i < 10; ++i) { // Este es un bucle for que va de 0 a 9
    //     std::cout << i << std::endl; // Imprime el valor de i
    // }

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 8,
    'tittle_level': 'Buenas Prácticas y Estilo de Código',
    'topic': 'Comentarios y Documentación',
    'subtopic': 'Uso de herramientas como Doxygen',
    'definition': '''
Doxygen es como un asistente súper inteligente que toma tus comentarios bien estructurados y los convierte automáticamente en una documentación profesional y bien organizada para tu código. Pensemos por un momento en la documentación de una biblioteca popular como `std::vector` en C++: ¿te imaginas tener que bucear directamente en el código fuente para entender cómo usar cada función, cada parámetro, cada valor de retorno? Sería una locura. Doxygen te permite generar precisamente ese tipo de documentación, de forma automatizada, a partir de lo que ya escribes en tu código.

¿Alguna vez te has preguntado cómo se crean esos manuales de referencia tan completos y fáciles de navegar para las grandes bibliotecas de software?

Pues bien, Doxygen es una de las herramientas clave para lograrlo. Su magia reside en que analiza tu código fuente (C++, C, Java, Python, entre otros) y extrae los comentarios que siguen un formato específico. Estos comentarios, a menudo llamados *docblocks*, usan etiquetas especiales que empiezan con `@` (o `\`) para indicar qué tipo de información se está describiendo. Por ejemplo, `@param` para describir un parámetro de función, `@return` para el valor de retorno, `@brief` para un resumen corto, o `@author` para el autor del código.

Una vez que tienes tus comentarios formateados de esta manera, simplemente ejecutas Doxygen. La herramienta procesará tus archivos y generará la documentación en diversos formatos, como HTML (lo más común, con páginas web navegables), LaTeX (para PDF de alta calidad), XML, e incluso diagramas de clases y de llamadas (¡sí, dibuja el código por ti!). Esto significa que puedes mantener la documentación junto con el código, y al actualizar el código, solo necesitas actualizar los comentarios relevantes y regenerar la documentación. Es una herramienta esencial para proyectos grandes, bibliotecas de código abierto o cualquier software que vaya a ser usado por otros desarrolladores, ya que simplifica enormemente el proceso de mantener la documentación al día.
''',
    'code_example': r'''
#include <iostream>

/**
 * @brief Define el estado de un dispositivo.
 *
 * Esta enumeración proporciona estados claros para un dispositivo,
 * mejorando la legibilidad y seguridad de tipo.
 */
enum class EstadoDispositivo {
    /**
     * @brief El dispositivo está apagado.
     */
    APAGADO,
    /**
     * @brief El dispositivo está encendido y funcionando.
     */
    ENCENDIDO,
    /**
     * @brief El dispositivo está en modo de suspensión.
     */
    SUSPENDIDO
};

/**
 * @brief Obtiene una descripción legible del estado de un dispositivo.
 *
 * Esta función toma un valor de `EstadoDispositivo` y devuelve
 * una cadena de texto que describe ese estado.
 *
 * @param estado El estado actual del dispositivo.
 * @return Una cadena de texto que representa el estado.
 * @author TuNombre
 * @date 2025-05-26
 */
std::string obtenerDescripcionEstado(EstadoDispositivo estado) {
    switch (estado) {
        case EstadoDispositivo::APAGADO:
            return "El dispositivo esta apagado.";
        case EstadoDispositivo::ENCENDIDO:
            return "El dispositivo esta encendido.";
        case EstadoDispositivo::SUSPENDIDO:
            return "El dispositivo esta en modo de suspension.";
        default:
            return "Estado desconocido.";
    }
}

int main() {
    std::cout << "--- Uso de Herramientas como Doxygen ---" << std::endl;

    EstadoDispositivo miDispositivo = EstadoDispositivo::ENCENDIDO;
    std::cout << obtenerDescripcionEstado(miDispositivo) << std::endl;

    EstadoDispositivo otroDispositivo = EstadoDispositivo::APAGADO;
    std::cout << obtenerDescripcionEstado(otroDispositivo) << std::endl;

    // Para generar la documentación con Doxygen:
    // 1. Instala Doxygen en tu sistema.
    // 2. Crea un archivo de configuración (Doxyfile) en tu proyecto
    //    ejecutando 'doxygen -g Doxyfile' en la terminal.
    // 3. Edita Doxyfile para configurar las rutas de entrada/salida, etc.
    //    - PROJECT_NAME     = "Mi Proyecto Cpp"
    //    - INPUT            = . (o la ruta a tu carpeta de código)
    //    - RECURSIVE        = YES
    //    - GENERATE_HTML    = YES
    //    - GENERATE_LATEX   = YES
    //    - EXTRACT_ALL      = YES (para documentar elementos no comentados)
    //    - JAVADOC_AUTOBRIEF = YES (si usas comentarios estilo JavaDoc)
    // 4. Ejecuta 'doxygen Doxyfile' en la terminal.
    // 5. La documentación HTML se generará en la carpeta 'html' (o la que configures).

    // Ejemplo de un comentario que Doxygen ignoraría por no seguir el formato
    // void funcionNoDocumentada() {
    //     // Esto es un comentario normal, Doxygen no lo procesara para documentacion
    // }

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 8,
    'tittle_level': 'Buenas Prácticas y Estilo de Código',
    'topic': 'Comentarios y Documentación',
    'subtopic': 'Importancia de la documentación',
    'definition': '''
La documentación en el desarrollo de software es como el mapa o el manual de usuario que le das a alguien para que pueda navegar por tu código o entender cómo usar tu programa sin perderse. Pensemos por un momento en un videojuego complejo o en un electrodoméstico nuevo: ¿lo podrías usar o disfrutar plenamente sin un manual, un tutorial o alguna forma de guía? La documentación cumple esa misma función vital para tu código.

¿Alguna vez te has encontrado con un código que parecía escrito en jeroglíficos, sin ninguna explicación sobre qué hace cada parte, cómo se conecta o por qué se implementó de esa manera?

Pues bien, ese es el panorama común cuando la documentación se ignora. Un código bien documentado es mucho más que un conjunto de líneas que la computadora puede ejecutar. Es una forma de comunicación fundamental y efectiva entre programadores (y esto incluye a tu yo del futuro, que te lo agradecerá enormemente). La documentación, en sus diversas formas, sirve para un propósito crítico:

* **Facilitar el entendimiento**: Explica el propósito, la lógica subyacente y el uso previsto de cada componente del código, desde una simple función hasta un módulo completo o la arquitectura general del sistema.
* **Acelerar el desarrollo y la incorporación de nuevos miembros**: Reduce drásticamente el tiempo que se necesita para que un nuevo desarrollador (o uno que regresa después de un tiempo) entienda y pueda empezar a modificar o extender el código.
* **Mejorar la colaboración**: Permite que múltiples programadores trabajen en el mismo proyecto sin confusiones, malentendidos o la necesidad constante de preguntar a otros qué hace una pieza de código.
* **Simplificar el mantenimiento y la depuración**: Cuando surge un error o necesitas agregar una nueva funcionalidad, una buena documentación te guía rápidamente a la sección relevante del código y te ayuda a entender su funcionamiento sin tener que descifrarlo línea por línea.
* **Promover la reutilización**: Si has escrito una biblioteca o un componente que otros podrían usar, una buena documentación es la clave para que puedan integrarlo en sus propios proyectos sin fricciones.

La documentación puede tomar muchas formas: desde comentarios en línea y de bloque (como los que ya vimos), pasando por la documentación generada automáticamente con herramientas como Doxygen, hasta manuales de usuario, guías de arquitectura, wikis internas y diagramas. Invertir tiempo en documentar tu código es una inversión directa en su calidad, usabilidad, longevidad y, en última instancia, en el éxito del proyecto.
''',
    'code_example': r'''
#include <iostream>
#include <string>
#include <vector>

// 1. Comentarios en el código (ya vistos, pero vitales para la documentación interna)
// Son la primera línea de defensa para el entendimiento del código.
double calcularPromedio(const std::vector<double>& calificaciones) {
    if (calificaciones.empty()) {
        return 0.0; // Evita la división por cero si no hay calificaciones.
    }
    double suma = 0.0;
    for (double cal : calificaciones) {
        suma += cal;
    }
    return suma / calificaciones.size();
}

// 2. Documentación externa (simulada aquí con descripciones, pero que Doxygen generaría)

/*
 * Documentación para la Clase GestorDeDatosDeUsuario
 *
 * Propósito: Encapsula la lógica para manejar las operaciones
 * de creación, lectura, actualización y eliminación (CRUD)
 * de datos de usuario en la aplicación.
 *
 * Responsabilidades:
 * - Almacenar y recuperar información de usuarios.
 * - Validar datos de usuario antes de la persistencia.
 * - Proporcionar una interfaz para interactuar con el almacenamiento.
 *
 * Consideraciones de Diseño:
 * - Utiliza un vector en memoria para la simulación.
 * - En un entorno real, se conectaría a una base de datos.
 */
class GestorDeDatosDeUsuario {
public:
    // /**
    //  * @brief Constructor por defecto de GestorDeDatosDeUsuario.
    //  * Inicializa el sistema de gestion de usuarios.
    //  */
    GestorDeDatosDeUsuario() {
        std::cout << "GestorDeDatosDeUsuario inicializado." << std::endl;
    }

    // /**
    //  * @brief Agrega un nuevo usuario al sistema.
    //  *
    //  * @param nombre El nombre del usuario a agregar.
    //  * @param id El ID unico del usuario.
    //  * @return true si el usuario fue agregado exitosamente, false si ya existe.
    //  */
    bool agregarUsuario(const std::string& nombre, int id) {
        // En la documentacion, se explicaria la logica de validacion y persistencia.
        std::cout << "Agregando usuario: " << nombre << " con ID: " << id << std::endl;
        return true; // Simulación
    }
};

int main() {
    std::cout << "--- Importancia de la Documentacion ---" << std::endl;

    // Ejemplo de uso de una función
    std::vector<double> notas = {8.5, 9.0, 7.8, 9.2};
    std::cout << "El promedio de las notas es: " << calcularPromedio(notas) << std::endl;

    std::cout << std::endl;

    // Ejemplo de uso de la clase
    GestorDeDatosDeUsuario gestor;
    gestor.agregarUsuario("Carlos Sainz", 101);
    gestor.agregarUsuario("Fernando Alonso", 102);

    std::cout << "\n¿Por que la documentacion es tan importante?" << std::endl;
    std::cout << "1. Facilita que otros programadores (y tu futuro yo) entiendan tu codigo." << std::endl;
    std::cout << "2. Reduce el tiempo necesario para hacer cambios y depurar errores." << std::endl;
    std::cout << "3. Mejora la colaboracion en equipos de desarrollo." << std::endl;
    std::cout << "4. Permite reutilizar componentes sin tener que descifrarlos de cero." << std::endl;

    // MAL EJEMPLO: Codigo sin documentacion (comentarios)
    // int x = 0;
    // for (int i = 0; i < 10; ++i) {
    //     x += i;
    // }
    // ¿Que representa 'x'? ¿Por que este bucle? Sin comentarios, es confuso.

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 8,
    'tittle_level': 'Buenas Prácticas y Estilo de Código',
    'topic': 'Organización y Estructura del Código',
    'subtopic': 'Separación de responsabilidades',
    'definition': '''
La separación de responsabilidades es un principio fundamental en el diseño de software que nos dice que cada parte de nuestro código (ya sea una función, una clase o un módulo) debe tener una única y clara tarea que hacer. Pensemos por un momento en una orquesta sinfónica: ¿te imaginas si el mismo músico tuviera que tocar todos los instrumentos (violín, trompeta, tambor) a la vez y también dirigir la orquesta? Sería un caos incomprensible, ¿verdad? Cada músico tiene su propio instrumento y su propia parte en la sinfonía, contribuyendo a un todo armónico. En el código, la separación de responsabilidades es exactamente eso: asignar a cada "músico" (es decir, cada componente de código) su propia función específica y bien definida.

¿Alguna vez has trabajado en un código donde una misma función o clase hacía de todo: calcular, validar, imprimir en pantalla, guardar en un archivo y enviar datos por la red, todo a la vez?

Si la respuesta es sí, entonces sabes lo increíblemente difícil que es entenderlo, modificarlo sin romper algo más o incluso depurarlo. La separación de responsabilidades busca evitar precisamente este "código espagueti" donde todo está inextricablemente entrelazado. En su lugar, promueve un diseño donde cada parte del código tiene una tarea bien definida y se comunica con otras partes de forma clara y controlada, a través de interfaces bien definidas. Esto hace que el código sea inherentemente:

* **Más fácil de entender**: Cada componente es más pequeño y enfocado en una única tarea, lo que reduce la carga cognitiva al leerlo.
* **Más fácil de probar**: Puedes probar cada parte de forma aislada sin depender de todo el sistema, lo que facilita la detección y corrección de errores.
* **Más fácil de mantener**: Los cambios en una parte del código tienen menos probabilidades de afectar negativamente a otras partes, ya que las responsabilidades están claramente delimitadas.
* **Más fácil de reutilizar**: Los componentes bien definidos y con una única responsabilidad pueden ser extraídos y usados en diferentes contextos o incluso en otros proyectos.

Este principio se aplica a todos los niveles de abstracción en el código. A nivel de funciones, significa que una función debe hacer una sola cosa y hacerla bien (por ejemplo, `calcularImpuesto`, pero no `calcularImpuestoYGuardarEnArchivo`). A nivel de clases, implica que una clase debe representar un único concepto o entidad (por ejemplo, `GestorDeUsuarios`, pero no `GestorDeUsuariosYGestionadorDeInventario`). A nivel de módulos o subsistemas, cada uno debe encargarse de una parte específica del sistema (por ejemplo, un módulo para la interfaz de usuario, otro para la lógica de negocio, otro para el acceso a la base de datos).
''',
    'code_example': r'''
#include <iostream>
#include <string>
#include <vector>
#include <numeric> // Para std::accumulate

// MAL EJEMPLO: Una función que tiene demasiadas responsabilidades (God Function)
void procesarPedidoCompleto(const std::string& cliente, const std::vector<std::string>& productos, double descuentoPorcentaje) {
    // Responsabilidad 1: Calcular el subtotal de los productos
    double subtotal = 0.0;
    std::cout << "Calculando subtotal para " << cliente << "..." << std::endl;
    for (const std::string& producto : productos) {
        // Simulación: cada producto cuesta $10.0
        subtotal += 10.0;
    }
    std::cout << "Subtotal calculado: $" << subtotal << std::endl;

    // Responsabilidad 2: Aplicar el descuento
    double totalConDescuento = subtotal * (1.0 - descuentoPorcentaje);
    std::cout << "Aplicando descuento (" << (descuentoPorcentaje * 100) << "%)..." << std::endl;
    std::cout << "Total con descuento: $" << totalConDescuento << std::endl;

    // Responsabilidad 3: Imprimir el recibo (formato de salida)
    std::cout << "\n--- Recibo de Compra ---" << std::endl;
    std::cout << "Cliente: " << cliente << std::endl;
    std::cout << "Productos:" << std::endl;
    for (const std::string& producto : productos) {
        std::cout << "  - " << producto << std::endl;
    }
    std::cout << "Total a Pagar: $" << totalConDescuento << std::endl;
    std::cout << "------------------------" << std::endl;

    // Responsabilidad 4: Simular el guardado del pedido en una base de datos o archivo
    std::cout << "Guardando pedido en el sistema de base de datos..." << std::endl;
    // Lógica compleja de base de datos o sistema de archivos aquí
    std::cout << "Pedido guardado exitosamente." << std::endl;
}

// BUENAS PRÁCTICAS: Separación de responsabilidades

// Responsabilidad 1: Cálculo de Precios
namespace CalculadoraDePrecios {
    double calcularSubtotal(const std::vector<std::string>& productos) {
        double subtotal = 0.0;
        for (const std::string& producto : productos) {
            subtotal += 10.0; // Simulación: costo fijo por producto
        }
        return subtotal;
    }

    double aplicarDescuento(double subtotal, double descuentoPorcentaje) {
        return subtotal * (1.0 - descuentoPorcentaje);
    }
}

// Responsabilidad 2: Formato e Impresión
namespace ImpresorDeRecibos {
    void imprimir(const std::string& cliente, const std::vector<std::string>& productos, double total) {
        std::cout << "\n--- Recibo de Compra ---" << std::endl;
        std::cout << "Cliente: " << cliente << std::endl;
        std::cout << "Productos:" << std::endl;
        for (const std::string& producto : productos) {
            std::cout << "  - " << producto << std::endl;
        }
        std::cout << "Total a Pagar: $" << total << std::endl;
        std::cout << "------------------------" << std::endl;
    }
}

// Responsabilidad 3: Persistencia de Datos
namespace PersistenciaDePedidos {
    void guardar(const std::string& cliente, const std::vector<std::string>& productos, double total) {
        std::cout << "Guardando pedido de '" << cliente << "' con total $" << total << " en la base de datos..." << std::endl;
        // Lógica de base de datos o sistema de archivos real aquí
        std::cout << "Pedido guardado exitosamente." << std::endl;
    }
}

int main() {
    std::cout << "--- Demostracion de Separacion de Responsabilidades ---" << std::endl;

    std::string clienteActual = "Maria Gomez";
    std::vector<std::string> listaProductos = {"Libro de C++", "Cafetera", "Audifonos"};
    double descuentoAplicado = 0.15; // 15% de descuento

    // MAL EJEMPLO: Una sola llamada para todo
    // procesarPedidoCompleto(clienteActual, listaProductos, descuentoAplicado);

    // BUENAS PRÁCTICAS: Orquestando las responsabilidades separadas
    std::cout << "\n--- Usando Responsabilidades Separadas ---" << std::endl;
    double subtotalCalculado = CalculadoraDePrecios::calcularSubtotal(listaProductos);
    double totalFinal = CalculadoraDePrecios::aplicarDescuento(subtotalCalculado, descuentoAplicado);
    ImpresorDeRecibos::imprimir(clienteActual, listaProductos, totalFinal);
    PersistenciaDePedidos::guardar(clienteActual, listaProductos, totalFinal);

    std::cout << "\nVentajas de la separacion:" << std::endl;
    std::cout << "- Cada parte es mas facil de entender y probar." << std::endl;
    std::cout << "- Los cambios en el calculo no afectan la impresion o el guardado." << std::endl;
    std::cout << "- Podemos reutilizar 'ImpresorDeRecibos' en otro contexto." << std::endl;

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 8,
    'tittle_level': 'Buenas Prácticas y Estilo de Código',
    'topic': 'Organización y Estructura del Código',
    'subtopic': 'Modularización',
    'definition': '''
La modularización es la práctica de dividir un programa grande y complejo en partes más pequeñas, independientes y manejables, llamadas módulos. Pensemos por un momento en cómo se construye un coche moderno: no se construye como una única pieza gigante, sino que se ensambla a partir de componentes (módulos) prefabricados como el motor, el sistema de frenos, el sistema eléctrico, el chasis, etc. Cada uno de estos componentes se desarrolla de forma independiente, se prueba y luego se integra. En el código, la modularización es precisamente esa idea: construir tu software con "bloques" que funcionan de manera autónoma.

¿Alguna vez has tenido que modificar una pequeña parte de un código enorme y monolítico y has sentido que estabas a punto de derribar todo el edificio con un solo martillazo, sin saber qué más ibas a afectar?

Si la respuesta es sí, entonces sabes lo que significa la ausencia de modularización. Un módulo es una unidad autocontenida de código que encapsula una funcionalidad relacionada. Lo importante es que tenga una **interfaz bien definida** (es decir, una forma clara y pública de interactuar con él desde otras partes del código) y que **oculte los detalles internos de su implementación** (esto se conoce como "encapsulamiento" o "ocultamiento de información"). Esto significa que puedes usar un módulo sin necesidad de saber cómo funciona por dentro, solo necesitas conocer su interfaz.

Las ventajas de la modularización son enormes y contribuyen directamente a la calidad del software:

* **Mejora la organización y legibilidad**: El código es más fácil de navegar, entender y razonar.
* **Facilita la reutilización**: Los módulos bien diseñados se pueden extraer y usar en diferentes proyectos o en distintas partes del mismo proyecto.
* **Simplifica el mantenimiento**: Los cambios en un módulo no deberían afectar a otros módulos, siempre y cuando la interfaz se mantenga estable. Esto reduce los riesgos.
* **Permite el desarrollo en paralelo**: Diferentes equipos o programadores pueden trabajar en diferentes módulos a la vez, acelerando el proceso de desarrollo.
* **Facilita las pruebas**: Puedes probar cada módulo de forma aislada (pruebas unitarias), lo que simplifica la detección de errores.

En C++, la modularización se logra típicamente a través de archivos de cabecera (`.h` o `.hpp`) y archivos de implementación (`.cpp`). Los archivos de cabecera declaran las interfaces (clases, funciones, variables globales) que el módulo exporta y que pueden ser utilizadas por otros archivos. Los archivos de implementación (`.cpp`) contienen el código real de esas funciones y métodos, ocultando los detalles internos de la implementación. Otros archivos pueden simplemente incluir estos cabeceras para usar la funcionalidad del módulo.
''',
    'code_example': r'''
// NOTA: Para ejecutar este ejemplo correctamente, necesitarías compilar
// los archivos "calculadora.cpp" y "main.cpp" por separado y luego enlazarlos.
// Aquí se presenta una estructura hipotética de archivos.

// 1. Archivo de cabecera: calculadora.h (o calculadora.hpp)
// Este archivo declara la interfaz pública de nuestro módulo de calculadora.
// Contiene las "firmas" de las funciones que queremos que otros usen.
/*
#ifndef CALCULADORA_H
#define CALCULADORA_H

namespace MiCalculadora {
    // @brief Suma dos números.
    // @param a Primer operando.
    // @param b Segundo operando.
    // @return La suma de a y b.
    double sumar(double a, double b);

    // @brief Resta el segundo número del primero.
    // @param a Primer operando.
    // @param b Segundo operando.
    // @return La resta de a y b.
    double restar(double a, double b);
} // namespace MiCalculadora

#endif // CALCULADORA_H
*/

// 2. Archivo de implementación: calculadora.cpp
// Este archivo contiene la implementación real de las funciones declaradas en calculadora.h.
// Los detalles internos de cómo se realizan las operaciones están aquí.
/*
#include "calculadora.h" // Incluimos nuestra propia cabecera
#include <iostream>      // Para usar std::cerr en caso de errores (aunque no en este ejemplo simple)

namespace MiCalculadora {
    double sumar(double a, double b) {
        // Lógica de suma real
        return a + b;
    }

    double restar(double a, double b) {
        // Lógica de resta real
        return a - b;
    }
    // Otras funciones como multiplicar, dividir, etc. irían aquí.
} // namespace MiCalculadora
*/

// 3. Archivo principal del programa: main.cpp
// Este archivo usa el módulo de calculadora. Solo necesita incluir la cabecera.
#include <iostream>
// #include "calculadora.h" // En un proyecto real, se incluiría así.

// Para que este ejemplo sea "ejecutable" en un solo archivo, simularemos
// la inclusión de la implementación aquí mismo, aunque es una mala práctica para modularización real.
// En un entorno de desarrollo, calculadora.cpp se compilaría por separado.
namespace MiCalculadora {
    double sumar(double a, double b) { return a + b; }
    double restar(double a, double b) { return a - b; }
}


int main() {
    std::cout << "--- Demostracion de Modularizacion ---" << std::endl;

    double num1 = 25.5;
    double num2 = 12.3;

    // Usamos las funciones de nuestro módulo Calculadora
    std::cout << "Suma: " << MiCalculadora::sumar(num1, num2) << std::endl;
    std::cout << "Resta: " << MiCalculadora::restar(num1, num2) << std::endl;

    std::cout << "\nVentajas de la modularizacion:" << std::endl;
    std::cout << "- El codigo de la calculadora esta separado y es autocontenido." << std::endl;
    std::cout << "- Podemos cambiar la implementacion de 'sumar' en 'calculadora.cpp' sin tocar 'main.cpp'." << std::endl;
    std::cout << "- Este modulo 'MiCalculadora' podria ser usado en otros proyectos." << std::endl;
    std::cout << "- Facilita la colaboracion: diferentes personas pueden trabajar en diferentes modulos." << std::endl;

    // MAL EJEMPLO: Código monolítico sin modularización
    // Toda la lógica de la aplicación estaría en un único archivo principal.
    // Esto hace que el archivo sea enorme, difícil de navegar, y cualquier cambio en una parte
    // puede tener consecuencias inesperadas en otras partes distantes.

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Jr',
    'level': 8,
    'tittle_level': 'Buenas Prácticas y Estilo de Código',
    'topic': 'Organización y Estructura del Código',
    'subtopic': 'Reutilización de código y funciones genéricas',
    'definition': '''
La reutilización de código es una de las piedras angulares de la programación eficiente y robusta. Es como tener un conjunto de herramientas bien diseñadas y probadas que puedes usar una y otra vez para diferentes trabajos, en lugar de tener que fabricar una nueva herramienta cada vez que necesitas apretar un tornillo. Pensemos por un momento en las bibliotecas estándar de C++: ¿te imaginas tener que escribir tu propia función para ordenar un vector, para buscar un elemento, para manejar cadenas de texto, o para realizar operaciones matemáticas básicas? Sería una pérdida de tiempo monumental y un foco enorme de posibles errores. La reutilización busca precisamente eso: que tu código sea como un conjunto de herramientas bien afiladas, listas para usar y confiables.

¿Alguna vez te has encontrado copiando y pegando el mismo bloque de código una y otra vez en diferentes partes de tu proyecto, solo para darte cuenta más tarde de que habías cometido un error en una de las copias y tenías que corregirlo manualmente en todas partes?

Si te ha pasado, sabes la pesadilla que puede ser mantener código duplicado. La reutilización te evita esa situación. Cuando identificas una tarea común o un patrón de lógica que se repite en tu código, la mejor práctica es encapsularla. Esto puede ser en una función, un método de una clase, o incluso una clase completa que puedes llamar y usar en diferentes lugares. Esto no solo ahorra tiempo de desarrollo, sino que también reduce drásticamente la probabilidad de errores, ya que si hay un error, solo tienes que corregir el código en un único lugar centralizado.

Las **funciones genéricas** (o plantillas de función, `function templates` en C++) son una forma increíblemente poderosa de lograr la reutilización de código. Te permiten escribir una función una sola vez que puede operar con diferentes tipos de datos, sin necesidad de escribir una versión separada para cada tipo. Esto se logra mediante el uso de **plantillas** (`template`) en C++. Por ejemplo, puedes escribir una función genérica para ordenar un vector, y esa misma función funcionará tanto para `std::vector<int>` como para `std::vector<std::string>` o `std::vector<MiClasePersonalizada>`, siempre que el tipo cumpla con los requisitos de la operación (como ser comparable).

La reutilización no se limita solo a funciones y clases individuales. También puedes reutilizar:
* **Módulos completos**: Un conjunto de archivos (`.h` y `.cpp`) que ofrecen una funcionalidad cohesiva.
* **Bibliotecas**: Colecciones de módulos o clases que resuelven problemas comunes (como Boost, Qt, etc.).
* **Patrones de diseño**: Soluciones probadas y generales a problemas de diseño de software recurrentes.

Cuanto más puedas identificar y aplicar la reutilización, más eficiente será tu proceso de desarrollo, más robusto y de alta calidad será tu código, y más fácil será mantenerlo y extenderlo a largo plazo. Es un pilar fundamental para construir software escalable y sostenible.
''',
    'code_example': r'''
#include <iostream>
#include <vector>
#include <string>
#include <algorithm> // Para std::sort y std::reverse
#include <cctype>    // Para std::toupper

// MAL EJEMPLO: Código duplicado y no genérico
/*
int sumarEnteros(const std::vector<int>& numeros) {
    int suma = 0;
    for (int num : numeros) {
        suma += num;
    }
    return suma;
}

double sumarDoubles(const std::vector<double>& numeros) {
    double suma = 0.0;
    for (double num : numeros) {
        suma += num;
    }
    return suma;
}
// Si quisieramos sumar floats, necesitaríamos otra función.
*/

// BUENAS PRÁCTICAS: Función genérica para sumar (reutilización con plantillas)
template <typename T>
T sumarElementos(const std::vector<T>& elementos) {
    T suma = T(); // Inicializa suma a un valor por defecto (0 para numéricos, "" para string)
    for (const T& elemento : elementos) {
        suma += elemento;
    }
    return suma;
}

// Ejemplo de una clase reutilizable con funciones estáticas (utilidades)
class UtilidadesDeTexto {
public:
    // @brief Convierte una cadena de texto a mayúsculas.
    // @param cadena La cadena a convertir.
    // @return Una nueva cadena con todos los caracteres en mayúsculas.
    static std::string aMayusculas(const std::string& cadena) {
        std::string resultado = cadena;
        for (char& c : resultado) {
            c = static_cast<char>(std::toupper(static_cast<unsigned char>(c))); // Conversión segura para toupper
        }
        return resultado;
    }

    // @brief Invierte el orden de los caracteres en una cadena.
    // @param cadena La cadena a invertir.
    // @return Una nueva cadena con los caracteres en orden inverso.
    static std::string invertirCadena(const std::string& cadena) {
        std::string resultado = cadena;
        std::reverse(resultado.begin(), resultado.end());
        return resultado;
    }
};

int main() {
    std::cout << "--- Reutilizacion de Codigo y Funciones Genericas ---" << std::endl;

    // Uso de la función genérica sumarElementos()
    std::vector<int> enteros = {1, 2, 3, 4, 5};
    std::cout << "Suma de enteros: " << sumarElementos(enteros) << std::endl;

    std::vector<double> doubles = {1.1, 2.2, 3.3, 4.4, 5.5};
    std::cout << "Suma de doubles: " << sumarElementos(doubles) << std::endl;

    // Observa cómo sumarElementos también funciona para std::string (concatenación)
    std::vector<std::string> palabras = {"Hola", " ", "Mundo", "!"};
    std::cout << "Concatenacion de palabras: " << sumarElementos(palabras) << std::endl;

    std::cout << std::endl;

    // Uso de la clase reutilizable UtilidadesDeTexto
    std::string mensajeOriginal = "Mi mensaje Secreto.";
    std::cout << "Mensaje original:      " << mensajeOriginal << std::endl;
    std::cout << "Mensaje en mayusculas: " << UtilidadesDeTexto::aMayusculas(mensajeOriginal) << std::endl;
    std::cout << "Mensaje invertido:     " << UtilidadesDeTexto::invertirCadena(mensajeOriginal) << std::endl;

    std::cout << std::endl;

    // Ejemplo de reutilización de un algoritmo de la biblioteca estándar (¡el mejor tipo de reutilización!)
    std::vector<int> numerosDesordenados = {50, 20, 80, 10, 90, 30};
    std::cout << "Numeros desordenados: ";
    for (int num : numerosDesordenados) {
        std::cout << num << " ";
    }
    std::cout << std::endl;

    std::sort(numerosDesordenados.begin(), numerosDesordenados.end()); // Reutilizamos std::sort (un algoritmo genérico)
    std::cout << "Numeros ordenados (con std::sort): ";
    for (int num : numerosDesordenados) {
        std::cout << num << " ";
    }
    std::cout << std::endl;

    std::cout << "\nBeneficios de la reutilizacion:" << std::endl;
    std::cout << "- Menos codigo para escribir y mantener." << std::endl;
    std::cout << "- Mayor fiabilidad (el codigo reutilizado ya esta probado)." << std::endl;
    std::cout << "- Desarrollo mas rapido." << std::endl;
    std::cout << "- Facilita el mantenimiento y las actualizaciones." << std::endl;


    return 0;
}
'''
  });
}
