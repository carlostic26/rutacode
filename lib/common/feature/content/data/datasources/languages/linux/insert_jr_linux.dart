import 'package:sqflite_common/sqlite_api.dart';

Future<void> insertJrLevel1DataLinux(Database db) async {
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción a Linux',
    'topic': 'Fundamentos de Linux',
    'subtopic': '¿Qué es Linux y por qué aprenderlo?',
    'definition': '''
Linux es un sistema operativo de código abierto que se encuentra en una gran variedad de dispositivos, desde teléfonos Android hasta supercomputadoras, servidores y la mayoría de los dispositivos IoT. Es una alternativa robusta a Windows o macOS, conocido por su estabilidad, seguridad y flexibilidad.

¿Te estás preguntando de qué va todo esto y por qué deberías invertir tiempo en aprender Linux? 

La verdad es que aprender Linux abre un mundo de posibilidades, especialmente si te interesa la programación, la administración de sistemas, el desarrollo web o incluso la ciberseguridad.

Al ser de código abierto, Linux permite que cualquiera pueda ver su código fuente, modificarlo y distribuirlo, lo que ha impulsado una comunidad global de desarrolladores. Esto se traduce en un sistema que evoluciona constantemente, con una gran cantidad de software libre y herramientas disponibles. Además, es un sistema operativo fundamental en la infraestructura de internet; la mayoría de los servidores web funcionan con Linux, lo que lo convierte en una habilidad esencial para cualquier profesional de TI. Su estabilidad y seguridad son puntos clave, ya que es menos propenso a virus y fallos en comparación con otros sistemas operativos. La línea de comandos, que al principio puede parecer intimidante, es extremadamente poderosa y permite automatizar tareas complejas de manera eficiente. Muchas empresas de tecnología, como Google, Facebook y Amazon, utilizan Linux en sus operaciones diarias debido a su escalabilidad y rendimiento, lo que valida la importancia de conocer este sistema.
''',
    'code_example': r'''
// Ejemplo de cómo interactuar con el sistema de archivos en Linux desde la terminal
// Listar el contenido del directorio actual
ls -l

// Navegar a un directorio específico
cd /home/usuario/Documentos

// Mostrar el directorio actual
pwd

// Crear un nuevo directorio
mkdir MiNuevoProyecto

// Eliminar un archivo (¡cuidado con esto!)
rm archivo_antiguo.txt

// Ejemplo de un comando incorrecto o un error común:
// Intentar eliminar un directorio no vacío sin la opción -r (recursiva)
// Esto generará un error: "rm: cannot remove 'MiDirectorio': Is a directory"
// rm MiDirectorio

// La forma correcta de eliminar un directorio no vacío es con -r
// rm -r MiDirectorio
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción a Linux',
    'topic': 'Fundamentos de Linux',
    'subtopic': 'Historia y filosofía de Linux',
    'definition': '''
La historia de Linux comienza con Linus Torvalds, un estudiante de Finlandia, quien en 1991 creó el núcleo de Linux como un hobby, inspirado por MINIX, un sistema operativo tipo Unix. Su idea era crear un sistema operativo de código abierto que funcionara en computadoras personales.

No sé tú, pero a mí esto al principio me costó... 

La filosofía de Linux, y del movimiento de software libre en general, se basa en la idea de que el software debe ser libre para ser usado, modificado y distribuido por cualquiera. Esto se resume en las "cuatro libertades" del software libre: la libertad de ejecutar el programa para cualquier propósito, la libertad de estudiar cómo funciona el programa y adaptarlo a tus necesidades, la libertad de redistribuir copias y la libertad de distribuir copias de tus versiones modificadas. Esta filosofía ha fomentado la colaboración masiva y la innovación, permitiendo que millones de desarrolladores de todo el mundo contribuyan al crecimiento y mejora de Linux. Es por esto que tenemos una gran variedad de distribuciones y herramientas, adaptándose a casi cualquier necesidad. Esta apertura y colaboración también son la base de su robustez y seguridad, ya que una gran cantidad de ojos revisan el código constantemente en busca de errores y vulnerabilidades.
''',
    'code_example': r'''
// No hay un "código" directo para la historia o filosofía,
// pero aquí hay un ejemplo de cómo se puede verificar la versión del kernel Linux,
// que es el corazón del sistema creado por Linus Torvalds.
// Esto muestra la versión del kernel que estás utilizando.
uname -r

// Puedes ver información más detallada del sistema, incluyendo el kernel
uname -a

// Un ejemplo de cómo la comunidad contribuye con herramientas
// apt-get es un comando para instalar software en distribuciones Debian/Ubuntu,
// desarrollado y mantenido por la comunidad.
// sudo apt-get update // Actualiza la lista de paquetes
// sudo apt-get install git // Instala Git, una herramienta fundamental en el desarrollo colaborativo
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción a Linux',
    'topic': 'Fundamentos de Linux',
    'subtopic':
        'Distribuciones principales (Ubuntu, Fedora, Debian, CentOS/RHEL)',
    'definition': '''
Cuando hablamos de Linux, es importante entender que no hay una única versión de "Linux" como tal. En su lugar, existen las "distribuciones", que son versiones completas del sistema operativo construidas sobre el núcleo de Linux, e incluyen un conjunto de software, herramientas y configuraciones específicas.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en por qué hay tantas. Cada distribución está diseñada para diferentes propósitos o audiencias. Por ejemplo, Ubuntu es muy popular por su facilidad de uso y una gran comunidad de soporte, lo que la hace ideal para principiantes y usuarios de escritorio. Debian, por otro lado, es conocida por su estabilidad y es la base de muchas otras distribuciones, incluyendo Ubuntu, siendo preferida en entornos de servidor. Fedora es una distribución de vanguardia patrocinada por Red Hat, que a menudo introduce las últimas tecnologías y sirve como base para Red Hat Enterprise Linux (RHEL), una distribución comercial orientada a empresas. CentOS era una recreación gratuita de RHEL, muy usada en servidores, pero ahora se ha transformado en CentOS Stream, que es un punto intermedio entre Fedora y RHEL. La elección de una distribución depende de tus necesidades: si buscas estabilidad para un servidor, Debian o RHEL/CentOS podrían ser buenas opciones; si quieres lo último en tecnología y una comunidad activa, Fedora podría ser tu elección; y si eres nuevo en Linux, Ubuntu es un excelente punto de partida.
''',
    'code_example': r'''
// No hay código directamente relacionado con las distribuciones,
// pero aquí te muestro cómo puedes identificar la distribución de Linux que estás usando.
// Este comando suele mostrar el nombre y la versión de la distribución.
cat /etc/os-release

// Ejemplo de cómo instalar un paquete en diferentes distribuciones:
// En Debian/Ubuntu (usan apt):
// sudo apt update
// sudo apt install htop

// En Fedora/CentOS/RHEL (usan dnf o yum):
// sudo dnf update
// sudo dnf install htop

// Un error común es intentar usar un gestor de paquetes de una distribución en otra,
// por ejemplo, intentar usar 'apt' en Fedora.
// sudo apt install htop // Esto fallaría en Fedora con un error "command not found"
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción a Linux',
    'topic': 'Fundamentos de Linux',
    'subtopic': 'Comunidad open source',
    'definition': '''
La comunidad open source, o de código abierto, es un pilar fundamental de Linux y de muchas de las tecnologías que usamos hoy en día. Se trata de un grupo global de desarrolladores, usuarios, entusiastas y empresas que colaboran de manera voluntaria para crear, mejorar y mantener software que es libremente accesible para todos.

Vamos a ver de que se trata todo esto y por qué es tan relevante... 

Pensemos que la comunidad open source es como un gran vecindario donde todos se ayudan. Cuando Linus Torvalds liberó el kernel de Linux, invitó a la gente a colaborar, y así nació esta gran comunidad. La filosofía es que al compartir el código y permitir que cualquiera lo modifique, se mejora la calidad del software, se corrigen errores más rápidamente y se fomenta la innovación. No hay una "empresa Linux" que dirija todo, sino que son miles de proyectos y millones de personas trabajando juntas. Esto significa que si tienes un problema con una herramienta de Linux, es muy probable que encuentres ayuda en foros, listas de correo, o que alguien ya haya reportado y solucionado ese mismo problema. Empresas como Red Hat, Google, IBM y muchas otras no solo usan Linux, sino que también contribuyen activamente al desarrollo del kernel y de diversas herramientas open source, invirtiendo en desarrolladores para que trabajen en estos proyectos. Esta colaboración masiva es lo que ha hecho de Linux un sistema operativo tan robusto, seguro y versátil, capaz de adaptarse a casi cualquier necesidad tecnológica.
''',
    'code_example': r'''
// La comunidad open source se manifiesta en la colaboración en proyectos.
// Git es la herramienta más común para la gestión de versiones en proyectos open source.
// Clonar un repositorio de un proyecto open source (ejemplo: un proyecto en GitHub)
// git clone https://github.com/torvalds/linux.git // Descarga el código fuente del kernel de Linux

// Ver el historial de contribuciones en un proyecto Git
// git log

// Un ejemplo de cómo los proyectos open source suelen tener archivos CONTRIBUTING.md
// que explican cómo puedes unirte y aportar al proyecto.
// cat CONTRIBUTING.md // Esto se ejecutaría dentro de un repositorio clonado

// Un error común podría ser intentar contribuir sin entender el flujo de trabajo
// de un proyecto (ej: no usar un fork, no seguir las guías de contribución).
// git push // Sin configurar el repositorio remoto o sin permisos, esto fallaría.
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción a Linux',
    'topic': 'Instalación y Primeros Pasos',
    'subtopic': 'Opciones de instalación (VirtualBox, Live USB, Cloud)',
    'definition': '''
Cuando decides instalar Linux, tienes varias maneras de hacerlo, dependiendo de lo que necesites y de los recursos que tengas a mano. No hay una única forma "correcta", sino la que mejor se adapte a tu situación.

¿Te estás preguntando por qué esto importa y cuál es la mejor opción para ti? 

Una de las maneras más populares para empezar es usando una máquina virtual, como VirtualBox[cite: 3]. Esto te permite instalar Linux dentro de tu sistema operativo actual (Windows o macOS) sin modificar tu disco duro principal. Es ideal para experimentar, aprender y probar cosas sin riesgo. Otra opción muy útil es crear un Live USB[cite: 3]. Esto significa que pones una distribución de Linux en una memoria USB, y puedes arrancar tu computadora desde ella sin necesidad de instalar nada en el disco duro. Es perfecto para probar Linux antes de instalarlo, o para usarlo como un sistema portátil. Finalmente, también puedes optar por instalar Linux en la nube[cite: 3]. Proveedores como AWS, Google Cloud o Azure ofrecen máquinas virtuales con Linux preinstalado que puedes alquilar. Esto es ideal si necesitas un servidor Linux para proyectos web, desarrollo o simplemente si quieres una máquina accesible desde cualquier lugar sin preocuparte por el hardware. Cada opción tiene sus ventajas y desventajas, desde la facilidad de uso hasta el rendimiento y el costo, así que elegir bien es el primer paso.
''',
    'code_example': r'''
// No hay código de programación directo para las opciones de instalación,
// pero aquí te muestro comandos útiles después de una instalación básica
// para verificar el uso del disco y la información del sistema.

// Para verificar el espacio en disco en Linux:
df -h
// Esto muestra el espacio total, usado y disponible de los sistemas de archivos.

// Para ver información básica del hardware (ejemplo en VirtualBox):
sudo lshw -short
// Puede que necesites instalar 'lshw': sudo apt install lshw (en Ubuntu/Debian)

// Ejemplo de comando relacionado con el uso de la red en la nube o localmente:
ip a
// Muestra las direcciones IP de tus interfaces de red.

// Un error común es no verificar los requisitos del sistema antes de instalar,
// lo que puede llevar a problemas de rendimiento.
// Por ejemplo, intentar correr una máquina virtual con poca RAM asignada.
// En VirtualBox, asegúrate de asignar suficiente RAM y CPU.
// (No es un comando, sino una configuración de la VM)
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción a Linux',
    'topic': 'Instalación y Primeros Pasos',
    'subtopic': 'Configuración inicial',
    'definition': '''
Una vez que has instalado Linux, ya sea en una máquina virtual, un Live USB o en la nube, hay una serie de pasos iniciales que te ayudarán a dejar el sistema listo para usar. Estos son los primeros ajustes que harás para personalizar y preparar tu entorno.

Seguramente pensarás de qué va todo esto y por qué es importante hacer una buena configuración inicial... 

Después de la instalación, es crucial configurar la zona horaria y el idioma, ya que esto afectará cómo el sistema maneja las fechas, horas y la interfaz de usuario. También es un buen momento para establecer la configuración de red si no se hizo automáticamente, asegurándote de que tu sistema pueda conectarse a internet. Otro paso fundamental es crear y configurar usuarios y grupos[cite: 5], especialmente si vas a compartir el sistema o si quieres separar tus actividades de las de otros usuarios. Asegurarte de que solo los usuarios correctos tengan permisos para ciertas acciones es clave para la seguridad. Además, es recomendable configurar las preferencias del entorno de escritorio si estás usando uno, como el fondo de pantalla, los temas y los accesos directos. Estos primeros pasos, aunque parezcan sencillos, son la base para tener un sistema Linux funcional y adaptado a tus necesidades, permitiéndote trabajar de forma más cómoda y segura desde el principio.
''',
    'code_example': r'''
// Ejemplo de comandos comunes en la configuración inicial de Linux:

// 1. Configurar la zona horaria (ejemplo para Madrid, España):
sudo timedatectl set-timezone Europe/Madrid

// 2. Cambiar la contraseña de un usuario (ejemplo para el usuario actual):
passwd

// 3. Crear un nuevo usuario (ejemplo: 'nuevo_usuario'):
sudo useradd -m nuevo_usuario
sudo passwd nuevo_usuario

// 4. Añadir un usuario al grupo 'sudo' (para darle permisos de administrador):
sudo usermod -aG sudo nuevo_usuario

// 5. Verificar la configuración de red (mostrar información de las interfaces):
ip a

// Un error común es no cambiar la contraseña por defecto (si la hay) o usar una débil.
// Esto compromete la seguridad del sistema.
// Nunca dejes la contraseña vacía o 'admin'/'password'.
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción a Linux',
    'topic': 'Instalación y Primeros Pasos',
    'subtopic': 'Entorno gráfico vs línea de comandos',
    'definition': '''
Al usar Linux, pronto te darás cuenta de que hay dos formas principales de interactuar con el sistema: a través de un entorno gráfico (GUI) o mediante la línea de comandos (CLI). Cada uno tiene su propósito y sus ventajas.

¿Te estás preguntando por qué esto importa y cuándo usar cada uno? 

El entorno gráfico, que es lo que la mayoría de la gente asocia con una computadora (ventanas, iconos, puntero del ratón), te proporciona una interfaz visual intuitiva para navegar por archivos, abrir aplicaciones y configurar el sistema. Es ideal para tareas diarias, navegar por internet, usar suites de oficina o editar imágenes. Sin embargo, la verdadera potencia de Linux se desata en la línea de comandos. La línea de comandos es una interfaz basada en texto donde escribes comandos para que el sistema realice tareas[cite: 3]. Aunque al principio pueda parecer intimidante, es increíblemente eficiente para la administración del sistema, la automatización de tareas, la gestión de servidores y la programación. Un buen ejemplo es cuando necesitas actualizar cientos de servidores; hacerlo uno por uno con una GUI sería una locura, pero con un solo comando en la CLI, puedes automatizarlo. Muchos desarrolladores y administradores de sistemas prefieren la línea de comandos por su velocidad, flexibilidad y capacidad para realizar operaciones complejas que no siempre son posibles en una GUI. Dominar ambos te dará una ventaja significativa en el mundo de Linux.
''',
    'code_example': r'''
// Ejemplo de la misma tarea realizada con CLI y conceptualmente con GUI:

// 1. Crear un directorio:
//   CLI:
mkdir MiCarpetaCLI
//   GUI: (Ir a la ubicación, clic derecho, "Nueva carpeta", escribir "MiCarpetaGUI")

// 2. Listar el contenido de un directorio:
//   CLI:
ls -l
//   GUI: (Abrir el explorador de archivos y ver la lista de archivos)

// 3. Abrir un editor de texto (ejemplo con 'nano'):
//   CLI:
nano mi_documento.txt
//   GUI: (Hacer doble clic en un archivo .txt o abrir un editor como GEdit/VS Code)

// Un error común es depender solo de la GUI para tareas que son mucho más eficientes en la CLI,
// como renombrar múltiples archivos a la vez, o buscar texto dentro de muchos archivos.
// Esto es mucho más rápido y potente en la CLI.
// find . -name "*.txt" -exec rename 's/.txt/.old/' {} \; // Ejemplo CLI
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción a Linux',
    'topic': 'Instalación y Primeros Pasos',
    'subtopic': 'Actualización del sistema',
    'definition': '''
Mantener tu sistema Linux actualizado es una de las tareas más importantes para asegurar su buen funcionamiento y, sobre todo, su seguridad. Las actualizaciones no solo traen nuevas características, sino que también corrigen errores y cierran vulnerabilidades que podrían ser explotadas.

¿Te estás preguntando por qué esto importa tanto? 

Pensemos por un momento en las razones. Ignorar las actualizaciones es como dejar la puerta de tu casa abierta; tarde o temprano, alguien podría aprovecharse. Las actualizaciones del sistema operativo, de los programas y del kernel, son cruciales para protegerte de amenazas emergentes. Además de la seguridad[cite: 8], las actualizaciones a menudo mejoran el rendimiento, solucionan problemas de compatibilidad y te brindan acceso a las últimas versiones de tus aplicaciones favoritas. En Linux, el proceso de actualización es bastante sencillo, y generalmente se realiza a través de los gestores de paquetes, como `apt` en distribuciones basadas en Debian/Ubuntu, o `dnf`/`yum` en distribuciones basadas en Red Hat/Fedora[cite: 5]. Es una buena práctica realizar estas actualizaciones regularmente, incluso semanalmente, para mantener tu sistema en óptimas condiciones y protegido. Piensa en ello como el mantenimiento regular de un coche; si no lo haces, es probable que en algún momento falle.
''',
    'code_example': r'''
// Comandos para actualizar el sistema en distribuciones basadas en Debian/Ubuntu:

// 1. Actualizar la lista de paquetes disponibles (sincroniza con los repositorios):
sudo apt update

// 2. Actualizar los paquetes instalados a sus últimas versiones:
sudo apt upgrade

// 3. Opcional: Realizar una actualización de distribución (actualiza a una nueva versión mayor):
sudo apt dist-upgrade
// ¡Cuidado! Este comando puede realizar cambios significativos y no siempre es necesario.

// Comandos equivalentes para distribuciones basadas en Fedora/CentOS/RHEL (usan dnf):

// 1. Actualizar la lista de paquetes y los paquetes instalados:
// sudo dnf update

// Un error común es no ejecutar 'sudo apt update' antes de 'sudo apt upgrade'.
// Esto significa que los paquetes no se actualizarán a las versiones más recientes disponibles
// en los repositorios, porque el sistema no sabe qué versiones hay.
// sudo apt upgrade // Sin un 'update' previo, solo actualizaría lo que ya sabe que existe.
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción a Linux',
    'topic': 'Sistema de Archivos',
    'subtopic': 'Estructura del sistema de archivos (/bin, /etc, /home, /var)',
    'definition': '''
El sistema de archivos de Linux tiene una estructura jerárquica muy organizada, que empieza desde la raíz, representada por una barra diagonal `/`. Cada directorio bajo la raíz tiene un propósito específico, lo que ayuda a mantener el sistema ordenado y eficiente[cite: 3].

¿Te estás preguntando por qué esto importa y cómo te ayuda? Pensemos por un momento en algunos de los directorios más importantes:
* `/bin`: Aquí se guardan los "binarios" o programas ejecutables esenciales para el sistema, como los comandos `ls`, `cd` y `pwd`[cite: 3]. Son comandos básicos que casi cualquier usuario puede ejecutar.
* `/etc`: Este directorio contiene archivos de configuración del sistema. Piensa en él como el "cerebro" donde se almacenan las reglas y ajustes para casi todo el software instalado[cite: 3]. Por ejemplo, las configuraciones de red o las contraseñas de usuarios están en archivos dentro de `/etc`.
* `/home`: Este es el directorio personal para cada usuario del sistema. Si tu nombre de usuario es `juan`, tendrás un directorio `/home/juan` donde guardar tus documentos, fotos y configuraciones personales[cite: 3]. Es tu espacio privado.
* `/var`: Este directorio se usa para almacenar datos "variables" o que cambian frecuentemente. Aquí encontrarás cosas como archivos de registro (logs), bases de datos y archivos de cola de impresión[cite: 3, 5]. Un ejemplo claro es `/var/log`, donde se guardan los registros del sistema, muy útiles para depurar problemas.

Entender esta estructura es clave porque te permite saber dónde buscar archivos y dónde almacenar los tuyos para que el sistema funcione correctamente y de forma segura. Es como el esqueleto del sistema operativo.
''',
    'code_example': r'''
// Explorando la estructura de directorios

// Navegar al directorio raíz:
cd /

// Listar el contenido del directorio raíz para ver las carpetas principales:
ls

// Navegar al directorio /etc para ver archivos de configuración:
cd /etc
ls

// Volver a tu directorio personal (home):
cd /home/$USER
pwd
// O simplemente:
// cd ~

// Un error común es intentar guardar archivos personales en directorios del sistema
// como /bin o /etc. Esto no solo es incorrecto, sino que puede causar problemas
// de permisos o incluso dañar el sistema. Siempre guarda tus cosas en /home.
// Ejemplo incorrecto (no lo hagas):
// sudo touch /bin/mi_archivo_personal.txt
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción a Linux',
    'topic': 'Sistema de Archivos',
    'subtopic': 'Comandos básicos (ls, cd, pwd, mkdir, rm)',
    'definition': '''
Cuando trabajas en la línea de comandos de Linux, hay un conjunto de herramientas esenciales que usarás casi constantemente para navegar, crear y gestionar archivos y directorios. Estos comandos son tu "caja de herramientas" fundamental[cite: 3].

¿Te estás preguntando por qué estos comandos son tan importantes? Vamos a ver de qué se trata todo esto:
* `ls`: Este comando es como tus ojos en la terminal. Te permite "listar" el contenido de un directorio[cite: 3]. Puedes ver qué archivos y subdirectorios hay, y con opciones como `ls -l`, obtendrás más detalles como permisos, propietario, tamaño y fecha.
* `cd`: "Change Directory" te permite moverte entre directorios en el sistema de archivos[cite: 3]. Es como hacer doble clic en una carpeta, pero desde la terminal. Por ejemplo, `cd Documentos` te llevará a tu carpeta de Documentos.
* `pwd`: "Print Working Directory" te dice en qué directorio te encuentras actualmente[cite: 3]. Es muy útil cuando te has movido mucho y quieres saber tu ubicación exacta en la jerarquía del sistema de archivos.
* `mkdir`: "Make Directory" te permite crear nuevos directorios o carpetas[cite: 3]. Por ejemplo, `mkdir ProyectoNuevo` creará una carpeta llamada "ProyectoNuevo" en tu directorio actual.
* `rm`: "Remove" se usa para eliminar archivos o directorios[cite: 3]. Ten mucho cuidado con este comando, ya que lo que borras con `rm` no suele ir a una papelera de reciclaje y es difícil de recuperar. Para borrar directorios no vacíos, necesitarás la opción `-r` (recursiva).

Dominar estos comandos es el primer paso para sentirte cómodo y eficiente en la terminal de Linux, son el pan de cada día para cualquier interacción con el sistema de archivos.
''',
    'code_example': r'''
// Usando los comandos básicos

// 1. Listar el contenido del directorio actual (sin detalles):
ls

// 2. Listar con detalles (permisos, propietario, tamaño, fecha):
ls -l

// 3. Crear un nuevo directorio:
mkdir MiDirectorioDePrueba

// 4. Moverse al nuevo directorio:
cd MiDirectorioDePrueba

// 5. Saber dónde estás:
pwd

// 6. Volver al directorio anterior:
cd ..

// 7. Crear un archivo vacío para luego eliminarlo:
touch archivo_para_borrar.txt

// 8. Eliminar el archivo:
rm archivo_para_borrar.txt

// Un error común con `rm` es intentar borrar un directorio no vacío sin `-r`:
// mkdir DirectorioNoVacio
// touch DirectorioNoVacio/archivo.txt
// rm DirectorioNoVacio // Esto fallará
// rm -r DirectorioNoVacio // Esto sí funciona (¡cuidado!)
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción a Linux',
    'topic': 'Sistema de Archivos',
    'subtopic': 'Permisos y propiedad (chmod, chown)',
    'definition': '''
En Linux, la seguridad de los archivos es fundamental, y esto se gestiona principalmente a través de permisos y propiedad. Cada archivo y directorio tiene un propietario, un grupo y un conjunto de permisos que dictan quién puede leer, escribir o ejecutar ese archivo o directorio[cite: 3].

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en por qué es tan crucial. Si trabajas en un servidor con varios usuarios, no querrás que cualquiera pueda leer o modificar tus archivos personales, ¿verdad? Los permisos se definen para tres categorías: el usuario propietario, el grupo propietario y "otros" (cualquier otro usuario en el sistema). Para cada una de estas categorías, se pueden otorgar permisos de lectura (`r`), escritura (`w`) y ejecución (`x`).

* `chmod`: Este comando se usa para "cambiar los modos" o permisos de un archivo o directorio[cite: 3]. Puedes usar notación simbólica (ej. `u+x` para añadir permiso de ejecución al usuario) o notación numérica (ej. `755` para `rwx` al propietario, `rx` al grupo y `rx` a otros). La notación numérica se basa en que `r=4`, `w=2`, `x=1`, sumando los valores.
* `chown`: Este comando se usa para "cambiar el propietario" de un archivo o directorio[cite: 3]. Con él, puedes transferir la propiedad de un archivo a otro usuario o grupo, lo cual es muy útil en entornos de colaboración o para la administración de sistemas.

Entender y aplicar correctamente los permisos es vital para la seguridad y el buen funcionamiento de tu sistema Linux. Es una habilidad esencial para cualquier administrador o desarrollador.
''',
    'code_example': r'''
// Gestionando permisos y propiedad

// Crear un archivo de prueba:
touch archivo_permisos.txt

// 1. Ver los permisos actuales del archivo:
ls -l archivo_permisos.txt
// Salida ejemplo: -rw-r--r-- 1 usuario grupo ... archivo_permisos.txt
// Significado: -rw- (propietario: leer, escribir), r-- (grupo: leer), r-- (otros: leer)

// 2. Cambiar permisos con notación numérica (ej: 755 - propietario: rwx, grupo: rx, otros: rx):
chmod 755 archivo_permisos.txt
ls -l archivo_permisos.txt
// Salida: -rwxr-xr-x 1 usuario grupo ... archivo_permisos.txt

// 3. Cambiar permisos con notación simbólica (ej: añadir permiso de ejecución al propietario):
chmod u+x archivo_permisos.txt
// Ya está ejecutado por el comando anterior, pero es un ejemplo.
// chmod g+w archivo_permisos.txt // Añadir permiso de escritura al grupo
// ls -l archivo_permisos.txt // Verificar el cambio

// 4. Cambiar el propietario del archivo (requiere sudo y otro usuario existente):
// sudo chown nuevo_usuario archivo_permisos.txt
// ls -l archivo_permisos.txt // Verificar el cambio de propietario

// 5. Cambiar el grupo propietario del archivo:
// sudo chown :nuevo_grupo archivo_permisos.txt
// O:
// sudo chown nuevo_usuario:nuevo_grupo archivo_permisos.txt
// ls -l archivo_permisos.txt

// Un error común es dar permisos excesivos (ej. 777 a todo), lo cual es un riesgo de seguridad.
// Por ejemplo, `chmod 777 script.sh` permite que cualquiera ejecute o modifique ese script.
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción a Linux',
    'topic': 'Sistema de Archivos',
    'subtopic': 'Enlaces simbólicos y duros',
    'definition': '''
En Linux, los enlaces son una característica muy útil para referenciar archivos o directorios desde múltiples ubicaciones sin necesidad de copiar el contenido. Existen dos tipos principales: enlaces simbólicos (o soft links) y enlaces duros (o hard links).

¿Te estás preguntando por qué esto importa y cuándo usar cada uno? Pensemos por un momento en las diferencias.
* **Enlaces simbólicos (Soft Links)**: Piensa en un enlace simbólico como un "atajo" o "acceso directo" en Windows. Es un archivo que contiene la ruta a otro archivo o directorio. Si el archivo o directorio original se mueve o se borra, el enlace simbólico se "rompe" y deja de funcionar. Son muy flexibles, ya que pueden apuntar a archivos o directorios en diferentes sistemas de archivos (particiones o discos duros). Se crean con el comando `ln -s`. Son los más comunes.
* **Enlaces duros (Hard Links)**: Un enlace duro es una entrada adicional en el sistema de archivos que apunta directamente al mismo "inode" (el bloque de datos real en el disco) que el archivo original. Esto significa que el enlace duro y el archivo original son, esencialmente, el mismo archivo. Si borras el archivo original, el contenido sigue existiendo mientras al menos un enlace duro apunte a él. Solo se elimina completamente cuando no quedan enlaces duros. Sin embargo, no pueden apuntar a directorios ni a archivos en diferentes sistemas de archivos. Se crean con el comando `ln`.

Los enlaces son muy útiles para organizar tus archivos, crear alias a comandos o programas, y en la administración de sistemas para mantener la consistencia sin duplicar el espacio en disco.
''',
    'code_example': r'''
// Creando y gestionando enlaces

// 1. Crear un archivo de ejemplo:
touch archivo_original.txt
echo "Este es el contenido del archivo original." > archivo_original.txt

// 2. Crear un enlace simbólico al archivo_original.txt:
ln -s archivo_original.txt enlace_simbolico.txt

// 3. Crear un enlace duro al archivo_original.txt:
ln archivo_original.txt enlace_duro.txt

// 4. Ver los detalles de los enlaces (el 'l' en los permisos indica enlace simbólico):
ls -l
// Salida ejemplo:
// -rw-r--r-- 2 usuario grupo ... archivo_original.txt
// -rw-r--r-- 2 usuario grupo ... enlace_duro.txt
// lrwxrwxrwx 1 usuario grupo ... enlace_simbolico.txt -> archivo_original.txt

// 5. Borrar el archivo original y ver qué pasa con los enlaces:
rm archivo_original.txt

// 6. Intentar ver el contenido del enlace simbólico (fallará):
cat enlace_simbolico.txt
// Salida: cat: enlace_simbolico.txt: No such file or directory

// 7. Ver el contenido del enlace duro (seguirá funcionando):
cat enlace_duro.txt
// Salida: Este es el contenido del archivo original.

// Un error común es confundir los enlaces simbólicos con los duros.
// Recuerda: el simbólico es un atajo, el duro es una "copia" del puntero al dato.
// rm enlace_simbolico.txt // Solo borra el atajo, no el original
// rm enlace_duro.txt // Borra una referencia al archivo, el dato real persiste si hay otras referencias.
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción a Linux',
    'topic': 'Procesos y Servicios',
    'subtopic': 'Visualización de procesos (ps, top, htop)',
    'definition': '''
En Linux, un proceso es una instancia de un programa en ejecución. Cada vez que abres una aplicación, ejecutas un comando o inicias un servicio, se crea uno o varios procesos. Saber cómo ver y entender estos procesos es fundamental para monitorear y gestionar tu sistema.

¿Te estás preguntando por qué esto importa y cómo te ayuda? 

Pensemos por un momento en las herramientas que tenemos a nuestra disposición.
* `ps`: Este comando te muestra un "snapshot" de los procesos que están corriendo en un momento específico. Es útil para ver procesos que están asociados a tu terminal o para obtener una lista completa de todos los procesos del sistema con opciones como `ps aux`. Es como tomar una foto de lo que está sucediendo.
* `top`: A diferencia de `ps`, `top` te da una vista en tiempo real de los procesos que están consumiendo más recursos (CPU, memoria). Se actualiza constantemente, lo que lo hace ideal para identificar qué programas están ralentizando tu sistema. Puedes ordenarlos por diferentes criterios, como el uso de CPU o memoria.
* `htop`: Es una versión mejorada y más interactiva de `top`. Ofrece una interfaz más amigable, te permite desplazarte por la lista de procesos, matar procesos con un solo clic (o una tecla), y muestra medidores de CPU y memoria de forma visual. Es muy útil para un monitoreo rápido y una gestión interactiva.

Dominar estas herramientas te permitirá diagnosticar problemas de rendimiento, identificar programas que no responden y entender qué está haciendo tu sistema en cualquier momento. Son esenciales para el "pulso" de tu máquina.
''',
    'code_example': r'''
// Visualizando procesos en Linux

// 1. Ver los procesos asociados a tu terminal:
ps

// 2. Ver todos los procesos ejecutándose en el sistema:
ps aux
// Esta es una de las combinaciones más comunes para ver todos los procesos de todos los usuarios.

// 3. Abrir el monitor de procesos interactivo 'top':
top
// Para salir de 'top', presiona 'q'.

// 4. Abrir el monitor de procesos interactivo 'htop' (si no está instalado, instálalo con sudo apt install htop):
htop
// Para salir de 'htop', presiona 'F10' o 'q'.

// Un error común es no entender la salida de 'ps aux'.
// - 'USER': el usuario propietario del proceso.
// - 'PID': Process ID, un número único para cada proceso.
// - '%CPU': Porcentaje de uso de CPU.
// - '%MEM': Porcentaje de uso de memoria.
// - 'COMMAND': El comando que inició el proceso.
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción a Linux',
    'topic': 'Procesos y Servicios',
    'subtopic': 'Gestión de procesos (kill, killall, nice, renice)',
    'definition': '''
Una vez que puedes ver los procesos que se están ejecutando en tu sistema Linux, el siguiente paso es aprender a gestionarlos. Esto incluye detenerlos, pausarlos o cambiar su prioridad, lo cual es vital para mantener la estabilidad y el rendimiento de tu máquina.

¿Te estás preguntando por qué esto importa y cuándo usar cada comando? Pensemos por un momento en su utilidad.
* `kill`: Este comando te permite "matar" o terminar un proceso utilizando su ID de proceso (PID). Es como cerrar una aplicación de golpe. Puedes enviar diferentes tipos de señales; la más común es `SIGTERM` (15), que pide al proceso que se cierre de forma ordenada, y `SIGKILL` (9), que lo fuerza a terminar inmediatamente, sin importar lo que esté haciendo.
* `killall`: Si necesitas terminar todos los procesos con un nombre específico, `killall` es tu amigo. Por ejemplo, `killall firefox` cerrará todas las ventanas y procesos de Firefox que estén abiertos. Es más rápido que buscar cada PID individualmente.
* `nice`: Este comando se utiliza para iniciar un proceso con una prioridad específica. Un valor "nice" más alto (menos prioridad) significa que el proceso será "más amable" con otros procesos, cediendo recursos a los que tienen mayor prioridad. Esto es útil para tareas en segundo plano que no requieren un rendimiento inmediato.
* `renice`: Si ya tienes un proceso en ejecución y quieres cambiar su prioridad, `renice` es el comando a usar. Puedes hacer que un proceso sea más o menos "amable" sin necesidad de reiniciarlo. Esto es genial para ajustar el rendimiento sobre la marcha.

Dominar estos comandos te da un control significativo sobre cómo los programas utilizan los recursos de tu sistema, permitiéndote resolver problemas de congelación, optimizar el rendimiento y asegurar que las tareas importantes tengan la prioridad que merecen.
''',
    'code_example': r'''
// Gestionando procesos en Linux

// 1. Encontrar el PID de un proceso (ej. 'gedit'):
// ps aux | grep gedit
// (Si gedit está corriendo, verás una línea con su PID)

// 2. Intentar matar un proceso de forma "amigable" (reemplaza PID_DEL_PROCESO con el número real):
// kill PID_DEL_PROCESO

// 3. Forzar la terminación de un proceso (si no responde al kill normal):
// kill -9 PID_DEL_PROCESO

// 4. Matar todos los procesos con un nombre específico (ej. 'firefox'):
// killall firefox

// 5. Iniciar un proceso con una prioridad más baja (menos recursos para él):
// nice -n 10 ./mi_script_pesado.sh
// (El valor 'nice' va de -20 a 19, siendo 19 la prioridad más baja)

// 6. Cambiar la prioridad de un proceso ya en ejecución (reemplaza PID y NUEVA_PRIORIDAD):
// renice -n 15 -p PID_DEL_PROCESO

// Un error común es usar `kill -9` sin antes intentar un `kill` normal.
// `kill -9` es una señal de "emergencia" y no permite al programa guardar su trabajo.
// Úsalo solo si el proceso no responde a otras señales.
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción a Linux',
    'topic': 'Procesos y Servicios',
    'subtopic': 'Servicios básicos (systemd, service)',
    'definition': '''
En Linux, los "servicios" son programas que se ejecutan en segundo plano, sin una interfaz gráfica directa, y que están diseñados para realizar tareas específicas de manera continua. Piensa en ellos como los "motores" que hacen funcionar muchas de las funcionalidades de tu sistema, como el servidor web, el servicio de red o el servidor de impresión.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en las herramientas que tenemos a nuestra disposición.
* `systemd`: Es el sistema de inicio (init system) más moderno y ampliamente adoptado en muchas distribuciones Linux (como Ubuntu, Fedora, CentOS). `systemd` es responsable de inicializar el sistema al arrancar, gestionar los servicios y mantenerlos en ejecución. Cada servicio se define en un "unit file" con extensión `.service`. Con `systemd`, puedes iniciar, detener, reiniciar, habilitar (para que inicie con el sistema) o deshabilitar servicios.
* `service`: Este comando es una interfaz más antigua y sencilla para gestionar servicios, que en muchos sistemas modernos (con `systemd`) se traduce internamente a comandos de `systemctl`. Aunque `systemctl` es el comando "nativo" para `systemd`, `service` sigue siendo útil por su simplicidad para operaciones básicas.

Comprender cómo funcionan y se gestionan los servicios es vital para cualquier administrador de sistemas o desarrollador que trabaje con servidores. Permite asegurar que los componentes necesarios de una aplicación o del sistema estén siempre activos y funcionando correctamente.
''',
    'code_example': r'''
// Gestionando servicios en Linux con systemctl (el método moderno)

// 1. Ver el estado de un servicio (ej. 'apache2' para un servidor web):
sudo systemctl status apache2
// Te dirá si está activo, inactivo, o si hay errores.

// 2. Iniciar un servicio:
sudo systemctl start apache2

// 3. Detener un servicio:
sudo systemctl stop apache2

// 4. Reiniciar un servicio (útil después de cambiar una configuración):
sudo systemctl restart apache2

// 5. Habilitar un servicio para que inicie automáticamente con el sistema:
sudo systemctl enable apache2

// 6. Deshabilitar un servicio para que no inicie con el sistema:
sudo systemctl disable apache2

// 7. Ver todos los servicios activos (pueden ser muchos):
// sudo systemctl list-units --type=service --state=running

// Un error común es no usar `sudo` para gestionar servicios, ya que requiere permisos de root.
// Otro error es no reiniciar un servicio después de cambiar su archivo de configuración,
// lo que significa que los cambios no se aplicarán.
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción a Linux',
    'topic': 'Procesos y Servicios',
    'subtopic': 'Logs del sistema (/var/log)',
    'definition': '''
Los "logs" o registros del sistema son archivos que contienen información detallada sobre los eventos que ocurren en tu sistema Linux. Son como el diario de tu computadora, registrando desde inicios de sesión y errores de aplicaciones hasta mensajes del kernel y actividades de red.

¿Te estás preguntando por qué esto importa tanto y dónde encontrar esa información? 

Pensemos por un momento en su utilidad. Estos registros son increíblemente valiosos para la resolución de problemas (debugging), la auditoría de seguridad y el monitoreo del rendimiento. Si una aplicación falla, si un servicio no inicia o si sospechas de alguna actividad inusual, los logs son el primer lugar al que debes acudir.

En Linux, la mayoría de los logs se almacenan en el directorio `/var/log`. Dentro de este directorio, encontrarás una variedad de archivos de log, cada uno con un propósito específico:
* `/var/log/syslog` (en Debian/Ubuntu) o `/var/log/messages` (en Fedora/CentOS): Contiene mensajes generales del sistema, incluyendo mensajes del kernel, autenticación, y otros eventos importantes.
* `/var/log/auth.log` (en Debian/Ubuntu) o `/var/log/secure` (en Fedora/CentOS): Registra intentos de inicio de sesión, autenticaciones y actividades relacionadas con la seguridad. Muy útil para detectar accesos no autorizados.
* `/var/log/kern.log`: Mensajes del kernel de Linux.
* `/var/log/apt/history.log` (en Debian/Ubuntu): Registra las instalaciones y eliminaciones de paquetes con `apt`.
* Directorios para servicios específicos: Por ejemplo, `/var/log/apache2` para logs de Apache, o `/var/log/mysql` para MySQL.

Saber cómo leer y analizar estos logs es una habilidad indispensable para mantener un sistema Linux saludable y seguro. Es tu ventana a lo que realmente está sucediendo "detrás de cámaras".
''',
    'code_example': r'''
// Explorando los logs del sistema en /var/log

// 1. Listar el contenido del directorio /var/log:
ls -l /var/log

// 2. Ver las últimas líneas del archivo de log del sistema (ej. syslog en Ubuntu):
tail /var/log/syslog
// 'tail' es útil para ver los eventos más recientes.

// 3. Ver las primeras líneas del archivo de log (ej. auth.log):
head /var/log/auth.log

// 4. Ver el contenido completo de un archivo de log (puede ser muy largo):
cat /var/log/syslog
// ¡Cuidado! Si el archivo es grande, llenará la terminal.

// 5. Ver el contenido de un log de forma paginada (más cómodo para archivos grandes):
less /var/log/syslog
// Dentro de 'less', puedes usar las flechas para navegar, 'q' para salir.

// 6. Monitorear un log en tiempo real (útil para ver eventos mientras ocurren):
tail -f /var/log/syslog

// Un error común es intentar abrir archivos de log muy grandes con un editor de texto gráfico,
// lo que puede hacer que el editor se congele o consuma mucha memoria.
// Los comandos `less` o `tail -f` son mucho más eficientes para esto.
''',
  });
}

Future<void> insertJrLevel2DataLinux(Database db) async {
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Comandos Esenciales',
    'topic': 'Manipulación de Archivos',
    'subtopic': 'Visualización (cat, less, more, head, tail)',
    'definition': '''
Cuando trabajas con la línea de comandos en Linux, a menudo necesitas ver el contenido de los archivos de texto, ya sean configuraciones, logs o scripts. Hay varias herramientas diseñadas específicamente para esta tarea, cada una con sus propias ventajas.

¿Te estás preguntando por qué esto importa y cuándo usar cada una? Pensemos por un momento en su utilidad.
* `cat`: Viene de "concatenate" (concatenar), pero su uso más común es para mostrar el contenido completo de un archivo directamente en la terminal. Es genial para archivos pequeños, ya que los muestra de una vez.
* `less`: Este comando es mucho más útil para archivos grandes. Te permite ver el contenido de forma paginada, es decir, pantalla por pantalla. Puedes desplazarte hacia arriba y abajo, buscar texto y salir cuando quieras. Es como un visor de texto interactivo en la terminal.
* `more`: Similar a `less`, `more` también muestra el contenido de forma paginada, pero es más limitado. Solo te permite avanzar hacia adelante, no hacia atrás. Por eso, `less` suele ser la opción preferida.
* `head`: Como su nombre lo indica, `head` muestra las primeras líneas de un archivo. Por defecto, muestra las primeras 10 líneas, pero puedes especificar cuántas líneas quieres ver (ej. `head -n 5 mi_archivo.txt` para las primeras 5). Es útil para echar un vistazo rápido al inicio de un archivo.
* `tail`: Lo opuesto a `head`, `tail` muestra las últimas líneas de un archivo. También por defecto, muestra las últimas 10. Es indispensable para monitorear archivos de log en tiempo real usando la opción `-f`, ya que te muestra las nuevas líneas a medida que se añaden.

Dominar estos comandos te permitirá inspeccionar el contenido de cualquier archivo de texto de forma eficiente, lo cual es crucial para la depuración y la administración del sistema.
''',
    'code_example': r'''
// Creando un archivo de ejemplo para las demostraciones:
echo -e "Linea 1\nLinea 2\nLinea 3\nLinea 4\nLinea 5\nLinea 6\nLinea 7\nLinea 8\nLinea 9\nLinea 10\nLinea 11\nLinea 12" > mi_archivo_de_texto.txt

// 1. Mostrar todo el contenido de un archivo pequeño:
cat mi_archivo_de_texto.txt

// 2. Ver el contenido de un archivo grande de forma paginada (usa 'q' para salir):
less mi_archivo_de_texto.txt

// 3. Ver el contenido de un archivo grande con 'more' (usa 'q' para salir):
more mi_archivo_de_texto.txt

// 4. Mostrar las primeras 5 líneas de un archivo:
head -n 5 mi_archivo_de_texto.txt

// 5. Mostrar las últimas 3 líneas de un archivo:
tail -n 3 mi_archivo_de_texto.txt

// 6. Monitorear un archivo de log en tiempo real (agrega algo al archivo en otra terminal para ver el efecto):
// tail -f mi_archivo_de_texto.txt
// En otra terminal: echo "Nueva linea de log" >> mi_archivo_de_texto.txt

// Un error común es usar `cat` para archivos muy grandes, lo que llenará la terminal y será difícil de leer.
// cat /var/log/syslog // Esto no es una buena idea para logs extensos.
// Siempre prefiere `less` o `tail` para logs y archivos grandes.
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Comandos Esenciales',
    'topic': 'Manipulación de Archivos',
    'subtopic': 'Edición (nano, vim básico)',
    'definition': '''
Para cualquier persona que trabaje en Linux, ya sea programador, administrador de sistemas o simplemente un usuario avanzado, es fundamental saber cómo editar archivos de texto directamente desde la terminal. No siempre tendrás una interfaz gráfica disponible, especialmente en servidores remotos.

¿Te estás preguntando por qué esto importa y cuándo usar cada editor? 

Pensemos por un momento en los dos editores de texto de terminal más comunes.
* `nano`: Este es un editor de texto muy sencillo y fácil de usar, ideal para principiantes o para ediciones rápidas. Sus comandos básicos (como guardar, buscar o salir) se muestran en la parte inferior de la pantalla, lo que lo hace muy intuitivo. Es perfecto para cuando solo necesitas hacer un cambio rápido en un archivo de configuración o escribir una nota simple.
* `vim` (básico): Vim es un editor de texto extremadamente potente y configurable, pero también tiene una curva de aprendizaje más pronunciada. Es famoso por su modo "modal", lo que significa que tiene diferentes modos para insertar texto, navegar y ejecutar comandos. Aunque al principio puede parecer complicado, dominar Vim (al menos sus fundamentos) te hará increíblemente eficiente para la edición de código y archivos de configuración complejos. Muchos desarrolladores profesionales lo utilizan por su velocidad y flexibilidad.

Si bien `nano` es una excelente puerta de entrada, invertir tiempo en aprender los conceptos básicos de `vim` te abrirá un mundo de posibilidades y te hará sentir mucho más cómodo en cualquier entorno Linux.
''',
    'code_example': r'''
// Editando archivos de texto en la terminal

// 1. Abrir un archivo con nano para editarlo (si no existe, lo creará):
nano mi_documento_nano.txt
// Dentro de nano:
// - Escribe tu texto.
// - Ctrl + O (para guardar, 'Write Out')
// - Enter (para confirmar el nombre del archivo)
// - Ctrl + X (para salir)

// 2. Abrir un archivo con vim para editarlo (si no existe, lo creará):
vim mi_documento_vim.txt
// Dentro de vim:
// - Para empezar a escribir, presiona la tecla 'i' (modo Insertar).
// - Escribe tu texto.
// - Para salir del modo Insertar, presiona la tecla 'Esc'.
// - Para guardar y salir, escribe ':wq' y presiona Enter. (w=write, q=quit)
// - Para salir sin guardar, escribe ':q!' y presiona Enter.

// Un error común con Vim es intentar escribir directamente sin entrar en el modo 'Insertar'
// (presionando 'i'). Esto resultará en comandos extraños o errores.
// Otro error es olvidar cómo guardar y salir, lo que puede ser frustrante al principio.
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Comandos Esenciales',
    'topic': 'Manipulación de Archivos',
    'subtopic': 'Búsqueda (find, locate, grep)',
    'definition': '''
En Linux, la capacidad de encontrar archivos y texto dentro de ellos de manera eficiente es una habilidad superpoderosa. Imagina tener miles de archivos y necesitar encontrar uno específico o una frase dentro de muchos. Para eso están las herramientas de búsqueda.

¿Te estás preguntando por qué esto importa y cuándo usar cada herramienta? Pensemos por un momento en las opciones que tienes:
* `find`: Este comando es como un detective experto en archivos. Te permite buscar archivos y directorios en una jerarquía de directorios basándose en una gran variedad de criterios, como nombre, tamaño, tipo, fecha de modificación y permisos. Por ejemplo, puedes buscar todos los archivos `.log` que se modificaron en las últimas 24 horas. Es increíblemente potente y flexible.
* `locate`: A diferencia de `find`, `locate` es mucho más rápido porque busca en una base de datos pre-indexada de todos los archivos del sistema. Sin embargo, esto significa que la base de datos no siempre está actualizada al instante, por lo que puede que no encuentre archivos recién creados. Es ideal para búsquedas rápidas si no necesitas la información más reciente. (Necesitas ejecutar `sudo updatedb` para actualizar su base de datos).
* `grep`: Este comando es el "buscapalabras" de Linux. Se usa para buscar patrones de texto (cadenas de texto o expresiones regulares) dentro del contenido de los archivos. Es extremadamente útil para analizar logs, encontrar funciones específicas en código fuente o filtrar la salida de otros comandos. Por ejemplo, puedes buscar todas las líneas que contengan la palabra "error" en un archivo de log.

Combinar estas herramientas te da un control completo sobre cómo encontrar y manipular la información en tu sistema Linux, siendo esenciales para la resolución de problemas y la gestión de datos.
''',
    'code_example': r'''
// Creando algunos archivos de ejemplo para las demostraciones:
mkdir -p BusquedaTest/sub_dir
echo "Esto es un archivo de prueba." > BusquedaTest/archivo1.txt
echo "Contiene la palabra clave Linux." > BusquedaTest/sub_dir/archivo2.log
echo "Otro archivo sin clave." > BusquedaTest/archivo3.conf

// 1. Encontrar archivos por nombre en el directorio actual y subdirectorios:
find BusquedaTest -name "archivo1.txt"

// 2. Encontrar todos los archivos .log:
find BusquedaTest -name "*.log"

// 3. Buscar archivos modificados en los últimos 7 días (ajusta según la fecha):
// find BusquedaTest -mtime -7

// 4. Buscar archivos con locate (puede que necesites instalar 'mlocate' y actualizar la DB):
// sudo apt install mlocate
// sudo updatedb
// locate archivo1.txt

// 5. Buscar texto "Linux" dentro de un archivo:
grep "Linux" BusquedaTest/sub_dir/archivo2.log

// 6. Buscar texto "error" en todos los archivos .log dentro de un directorio:
grep "error" BusquedaTest/*.log

// 7. Buscar texto recursivamente en un directorio y sus subdirectorios:
grep -r "Linux" BusquedaTest/

// Un error común es usar `locate` justo después de crear un archivo y no encontrarlo,
// olvidando que la base de datos de `locate` no se actualiza instantáneamente.
// Otro error es no usar comillas al buscar nombres de archivo con espacios en `find`.
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Comandos Esenciales',
    'topic': 'Manipulación de Archivos',
    'subtopic': 'Compresión (tar, gzip, zip)',
    'definition': '''
Cuando trabajas con muchos archivos, o archivos muy grandes, es común que necesites comprimirlos para ahorrar espacio de almacenamiento o para transferirlos más rápido por la red. Linux ofrece varias herramientas poderosas para esto.

¿Te estás preguntando por qué esto importa y cuándo usar cada herramienta? Pensemos por un momento en las opciones más comunes:
* `tar`: Viene de "Tape ARchiver" (archivador de cintas), y su función principal es "empaquetar" varios archivos y directorios en un solo archivo, conocido como "tarball" (con extensión `.tar`). No comprime los archivos por sí mismo, solo los agrupa. Esto es muy útil para mantener la estructura de directorios y los permisos de los archivos cuando los mueves o los copias.
* `gzip`: Este comando se usa para comprimir archivos individualmente. A menudo se usa en combinación con `tar`. Primero, usas `tar` para agrupar tus archivos, y luego `gzip` para comprimir ese `tarball`. Un archivo comprimido con `gzip` tendrá una extensión `.gz` (ej. `archivo.tar.gz`). Es muy eficiente para reducir el tamaño de los archivos.
* `zip`: Aunque es más común en Windows, `zip` también está disponible en Linux y te permite tanto agrupar como comprimir archivos en un solo paso. Los archivos `.zip` son muy compatibles con otros sistemas operativos, lo que lo hace ideal para compartir archivos con usuarios de Windows o macOS.

La combinación de `tar` y `gzip` (`tar -czvf`) es una de las más usadas en Linux para crear archivos comprimidos y archivados. Saber usar estas herramientas te ahorrará mucho espacio y tiempo al manipular grandes volúmenes de datos.
''',
    'code_example': r'''
// Creando algunos archivos de ejemplo para las demostraciones:
mkdir -p CompresionTest
echo "Contenido del archivo 1." > CompresionTest/archivo1.txt
echo "Contenido del archivo 2." > CompresionTest/archivo2.log
echo "Contenido del archivo 3." > CompresionTest/sub_dir/archivo3.conf

// 1. Empaquetar un directorio con `tar` (sin comprimir):
tar -cvf mi_paquete.tar CompresionTest/
// -c: crear archivo, -v: verbose (mostrar progreso), -f: especificar nombre de archivo

// 2. Comprimir un archivo individual con `gzip`:
gzip CompresionTest/archivo1.txt
// Esto creará CompresionTest/archivo1.txt.gz y eliminará el original.
// Para descomprimir: gunzip CompresionTest/archivo1.txt.gz

// 3. Empaquetar y comprimir un directorio en un solo paso (el uso más común de tar):
tar -czvf mi_paquete_comprimido.tar.gz CompresionTest/
// -z: usar gzip para comprimir

// 4. Descomprimir y extraer un tar.gz:
mkdir ExtraidoTest
tar -xzvf mi_paquete_comprimido.tar.gz -C ExtraidoTest/
// -x: extraer, -z: usar gzip, -v: verbose, -f: especificar nombre de archivo, -C: cambiar directorio

// 5. Crear un archivo .zip:
zip -r mi_paquete.zip CompresionTest/
// -r: recursivo (para incluir directorios)

// 6. Descomprimir un archivo .zip:
unzip mi_paquete.zip -d ZipExtraidoTest/
// -d: especificar directorio de destino

// Un error común es intentar descomprimir un archivo .tar.gz solo con `gzip` o `tar` por separado.
// Siempre usa `tar -xzvf` para .tar.gz o `unzip` para .zip.
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Comandos Esenciales',
    'topic': 'Redes Básicas',
    'subtopic': 'Comandos de red (ping, ifconfig/ip, netstat/ss)',
    'definition': '''
Para cualquier persona que trabaje con Linux, entender cómo funciona la red y cómo diagnosticar problemas de conectividad es fundamental. Afortunadamente, Linux ofrece una suite de comandos robusta para inspeccionar y gestionar la red.

¿Te estás preguntando por qué esto importa y cuándo usar cada comando? Pensemos por un momento en las herramientas esenciales que tienes:
* `ping`: Este es tu comando de "eco" en la red. Envía pequeños paquetes a una dirección IP o nombre de host y espera una respuesta. Es la forma más básica de verificar si hay conectividad entre dos puntos de la red. Si recibes respuestas, sabes que el otro host está vivo y accesible.
* `ifconfig` / `ip`: `ifconfig` es una herramienta más antigua, pero todavía presente en muchos sistemas, que te permite ver y configurar las interfaces de red de tu máquina (por ejemplo, Wi-Fi, Ethernet). `ip` es la herramienta moderna y más potente que la reemplaza. Ambos te muestran la dirección IP de tu máquina, la máscara de red y otros detalles importantes.
* `netstat` / `ss`: `netstat` (network statistics) es una herramienta para mostrar conexiones de red, tablas de ruteo, estadísticas de interfaz, y más. Te permite ver qué puertos están abiertos y qué conexiones se están estableciendo. `ss` (socket statistics) es una alternativa más rápida y moderna a `netstat`, especialmente útil en sistemas con muchas conexiones. Ambos son cruciales para entender qué servicios de red se están ejecutando y qué conexiones están activas.

Dominar estos comandos te dará la capacidad de verificar la conectividad, identificar tu dirección de red, y entender qué servicios de red están activos en tu sistema, lo cual es vital para la resolución de problemas de red.
''',
    'code_example': r'''
// Comandos básicos para redes en Linux

// 1. Verificar conectividad a un sitio web (ej. Google):
ping google.com
// Presiona Ctrl+C para detener el ping.

// 2. Ver la configuración de tus interfaces de red (usando 'ip' que es lo moderno):
ip a
// Alternativa más antigua (puede que necesites instalar net-tools):
// ifconfig

// 3. Ver las conexiones de red activas y los puertos abiertos (usando 'ss' que es lo moderno):
ss -tuln
// -t: TCP, -u: UDP, -l: listening, -n: numeric (no resolver nombres de host/puertos)
// Alternativa más antigua:
// netstat -tuln

// 4. Ver la tabla de ruteo (cómo tu máquina sabe a dónde enviar el tráfico):
ip r
// Alternativa más antigua:
// route -n

// Un error común es usar `ifconfig` en sistemas modernos que solo tienen `ip`,
// o usar `netstat` cuando `ss` es más eficiente.
// Siempre es bueno empezar con `ping` para diagnosticar problemas de conectividad básicos.
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Comandos Esenciales',
    'topic': 'Redes Básicas',
    'subtopic': 'Configuración básica de red',
    'definition': '''
Después de saber cómo ver el estado de tu red, el siguiente paso es aprender a configurar sus aspectos básicos. A veces necesitarás ajustar tu dirección IP, tu DNS o cómo se conecta tu máquina a la red.

¿Te estás preguntando por qué esto importa? Pensemos por un momento en un escenario común: conectar un nuevo servidor o una máquina virtual a una red específica, o solucionar un problema de conectividad. La configuración de red en Linux puede hacerse de varias maneras, dependiendo de la distribución y de si prefieres una interfaz gráfica o la línea de comandos.

A nivel de comandos, el enfoque moderno se centra en la herramienta `ip`, que reemplaza a `ifconfig` para muchas tareas. Con `ip`, puedes asignar direcciones IP a interfaces, configurar rutas estáticas o gestionar la interfaz de loopback. Para la configuración de DNS, generalmente se edita el archivo `/etc/resolv.conf`, donde se listan los servidores DNS que tu sistema utiliza para traducir nombres de dominio a direcciones IP.

En entornos de servidor, o cuando necesitas una configuración persistente (que sobreviva a un reinicio), a menudo se editan archivos de configuración específicos de la distribución (por ejemplo, en Ubuntu, se usan archivos en `/etc/netplan` o configuraciones en `/etc/network/interfaces` en versiones antiguas). Entender cómo configurar manualmente la red te da un control granular sobre cómo tu sistema se comunica con el mundo exterior, lo cual es una habilidad crucial para la administración de servidores y la resolución de problemas de red.
''',
    'code_example': r'''
// Comandos de ejemplo para configuración básica de red (requieren permisos de root)

// 1. Asignar una dirección IP estática a una interfaz (ej. eth0):
// sudo ip addr add 192.168.1.100/24 dev eth0
// Esto es temporal, se pierde al reiniciar.

// 2. Levantar una interfaz de red (activarla):
// sudo ip link set dev eth0 up

// 3. Configurar la puerta de enlace predeterminada (default gateway):
// sudo ip route add default via 192.168.1.1

// 4. Configurar servidores DNS (editando /etc/resolv.conf):
// sudo nano /etc/resolv.conf
// Añade líneas como:
// nameserver 8.8.8.8
// nameserver 8.8.4.4
// (Estos cambios pueden ser sobrescritos por el DHCP al reiniciar)

// Para configuraciones persistentes, necesitarías editar archivos específicos
// de tu distribución, como en Ubuntu:
// sudo nano /etc/netplan/01-netcfg.yaml
// Y luego aplicar los cambios:
// sudo netplan apply

// Un error común es configurar una IP estática que ya está siendo usada en la red,
// lo que puede causar conflictos.
// Otro error es no hacer persistentes los cambios de configuración si necesitas que duren un reinicio.
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Comandos Esenciales',
    'topic': 'Redes Básicas',
    'subtopic': 'SSH básico',
    'definition': '''
SSH, o Secure Shell, es una de las herramientas más importantes y utilizadas en el mundo de Linux y los servidores. Permite conectarse de forma segura a una máquina remota y ejecutar comandos como si estuvieras sentado frente a ella.

¿Te estás preguntando por qué esto importa tanto y cómo funciona? Pensemos por un momento en la seguridad. Antes de SSH, las conexiones remotas a menudo se hacían de forma insegura, enviando contraseñas en texto plano. SSH encripta toda la comunicación entre tu máquina y el servidor remoto, protegiéndola de espías.

El uso básico de SSH es simple: utilizas el comando `ssh` seguido del nombre de usuario y la dirección IP o nombre de host del servidor. Por ejemplo, `ssh usuario@192.168.1.5` o `ssh usuario@servidor.ejemplo.com`. Una vez conectado, cualquier comando que escribas en tu terminal se ejecutará en el servidor remoto.

SSH no es solo para ejecutar comandos; también te permite reenviar puertos, transferir archivos (con `scp` o `sftp`) y mucho más. Es la columna vertebral de la administración remota de servidores, y es una habilidad esencial para cualquier profesional de TI que trabaje con sistemas Linux en la nube o en centros de datos. La capacidad de gestionar un servidor desde cualquier parte del mundo de forma segura es lo que hace a SSH tan indispensable.
''',
    'code_example': r'''
// Usando SSH para conectar a un servidor remoto

// 1. Conectarse a un servidor remoto con un usuario específico:
// ssh mi_usuario@mi_servidor.com
// Se te pedirá la contraseña de 'mi_usuario' en 'mi_servidor.com'.

// 2. Conectarse a un servidor remoto con una IP:
// ssh mi_usuario@192.168.1.10
// Si tu nombre de usuario es el mismo en la máquina local y remota, puedes omitirlo:
// ssh mi_servidor.com

// 3. Ejecutar un comando directamente en el servidor sin entrar a la sesión interactiva:
// ssh mi_usuario@mi_servidor.com "ls -l /var/log"
// Esto listará el contenido del directorio /var/log en el servidor remoto.

// 4. Copiar una clave SSH pública a un servidor para futuras conexiones sin contraseña:
// ssh-copy-id mi_usuario@mi_servidor.com
// (Esto configura la autenticación por clave SSH, más segura que la contraseña).

// Un error común es intentar conectarse a un servidor que no tiene el servicio SSH (`sshd`)
// instalado y corriendo. El error sería "Connection refused" o "Connection timed out".
// Otro error es olvidar la contraseña o no tener los permisos adecuados para el usuario.
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Comandos Esenciales',
    'topic': 'Redes Básicas',
    'subtopic': 'Transferencia de archivos (scp, rsync)',
    'definition': '''
Una vez que puedes conectarte a servidores remotos, es muy común que necesites mover archivos entre tu máquina local y el servidor, o entre servidores. Para esto, Linux nos ofrece herramientas poderosas y seguras que aprovechan SSH.

¿Te estás preguntando por qué esto importa y cuándo usar cada herramienta? Pensemos por un momento en su utilidad.
* `scp`: Viene de "secure copy". Es un comando muy sencillo que te permite copiar archivos y directorios de forma segura entre hosts en una red, utilizando el protocolo SSH para la encriptación. Es ideal para copias rápidas y directas. Su sintaxis es similar a la del comando `cp` local, pero añadiendo la información del host remoto (`usuario@host:/ruta/`). Puedes copiar desde local a remoto, de remoto a local, o incluso entre dos servidores remotos.
* `rsync`: Es una herramienta mucho más avanzada y versátil para la sincronización de archivos. `rsync` es especialmente útil porque solo copia las partes de los archivos que han cambiado (lo que se conoce como "copia diferencial"). Esto lo hace increíblemente eficiente para sincronizar grandes volúmenes de datos o hacer copias de seguridad incrementales, ya que ahorra mucho ancho de banda y tiempo. Además, puede manejar la eliminación de archivos en el destino que ya no existen en el origen. Es el "sincronizador" de archivos por excelencia en Linux.

Tanto `scp` como `rsync` son herramientas indispensables para cualquier persona que trabaje con servidores remotos. `scp` para copias rápidas y sencillas, y `rsync` para sincronizaciones más complejas y eficientes.
''',
    'code_example': r'''
// Transferencia de archivos con scp y rsync

// Asume que tienes un archivo local llamado 'mi_local_archivo.txt'
// y un servidor remoto con usuario 'mi_usuario' en 'mi_servidor.com'

// 1. Copiar un archivo desde tu máquina local a un servidor remoto:
scp mi_local_archivo.txt mi_usuario@mi_servidor.com:/home/mi_usuario/
// Esto copiará 'mi_local_archivo.txt' a la carpeta home del usuario remoto.

// 2. Copiar un archivo desde un servidor remoto a tu máquina local:
scp mi_usuario@mi_servidor.com:/home/mi_usuario/archivo_remoto.conf .
// El punto '.' al final significa "copiar al directorio actual local".

// 3. Copiar un directorio completo recursivamente:
scp -r mi_directorio_local/ mi_usuario@mi_servidor.com:/home/mi_usuario/

// 4. Sincronizar un directorio local con uno remoto usando rsync:
rsync -avz mi_directorio_local/ mi_usuario@mi_servidor.com:/home/mi_usuario/sincronizado/
// -a: modo archivo (preserva permisos, tiempos, etc.)
// -v: verbose (mostrar progreso)
// -z: comprimir datos durante la transferencia (útil para redes lentas)
// La barra '/' al final de 'mi_directorio_local/' es importante:
// Si termina en '/', copia el *contenido* del directorio.
// Si no termina en '/', copia el directorio en sí.

// 5. Sincronizar un directorio remoto a uno local:
// rsync -avz mi_usuario@mi_servidor.com:/home/mi_usuario/servidor_data/ ./local_copia/

// Un error común con `scp` es no especificar la ruta completa en el destino o el origen,
// o no usar `-r` para directorios.
// Con `rsync`, es crucial entender el uso de la barra final '/' para evitar sorpresas.
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Comandos Esenciales',
    'topic': 'Gestión de Paquetes',
    'subtopic': 'Gestores de paquetes (apt, yum/dnf, rpm, dpkg)',
    'definition': '''
En Linux, instalar, actualizar y eliminar software se hace de una manera muy organizada gracias a los "gestores de paquetes". Piensa en ellos como tiendas de aplicaciones centralizadas para tu sistema operativo, que te facilitan la vida.

¿Te estás preguntando por qué esto importa y cuándo usar cada gestor? 

Pensemos por un momento en las herramientas más comunes:
* **`apt` (Advanced Package Tool)**: Este es el gestor de paquetes por excelencia en distribuciones basadas en Debian, como Ubuntu y Mint. Es súper fácil de usar y te permite instalar software, actualizar tu sistema, y gestionar dependencias de manera eficiente. Si usas Ubuntu, este será tu pan de cada día.
* **`yum` / `dnf` (Yellowdog Updater Modified / Dandified YUM)**: `yum` fue el gestor de paquetes tradicional en distribuciones basadas en Red Hat, como Fedora y CentOS. Sin embargo, `dnf` es su sucesor más moderno y rápido, y es el recomendado actualmente para estas distribuciones. Ambos hacen la misma función: instalar, actualizar y gestionar paquetes RPM.
* **`rpm` (Red Hat Package Manager)**: Este es el formato de paquete base para distribuciones como Red Hat, Fedora y CentOS. `rpm` es una herramienta de bajo nivel que te permite instalar paquetes `.rpm` individuales, pero no resuelve automáticamente las dependencias (por eso se usan `yum` o `dnf` encima de él).
* **`dpkg` (Debian Package)**: Similar a `rpm`, `dpkg` es el formato de paquete y la herramienta de bajo nivel para distribuciones basadas en Debian. Te permite instalar archivos `.deb` directamente, pero tampoco maneja dependencias. `apt` es la herramienta de alto nivel que lo usa por debajo para manejar todo.

Cada gestor está ligado a un tipo de distribución y a su formato de paquete. Entender cuál usar y cómo te permitirá mantener tu sistema al día y con todo el software que necesitas.
''',
    'code_example': r'''
# Ejemplos de uso de gestores de paquetes

# Para distribuciones basadas en Debian/Ubuntu (usan apt y .deb):

# 1. Actualizar la lista de paquetes disponibles:
sudo apt update

# 2. Instalar un paquete (ej. 'vlc'):
sudo apt install vlc

# 3. Eliminar un paquete:
sudo apt remove vlc

# 4. Limpiar paquetes que ya no son necesarios:
sudo apt autoremove

# Para distribuciones basadas en Red Hat/Fedora/CentOS (usan dnf/yum y .rpm):

# 1. Actualizar el sistema:
# sudo dnf update
# (O sudo yum update en sistemas más antiguos)

# 2. Instalar un paquete (ej. 'htop'):
# sudo dnf install htop
# (O sudo yum install htop)

# 3. Eliminar un paquete:
# sudo dnf remove htop
# (O sudo yum remove htop)

# Ejemplos de herramientas de bajo nivel:

# 1. Instalar un paquete .deb descargado (en Debian/Ubuntu):
# sudo dpkg -i mi_aplicacion.deb
# NOTA: Esto no resuelve dependencias, por lo que podría fallar.
# sudo apt install -f # Para intentar arreglar dependencias después de dpkg

# 2. Instalar un paquete .rpm descargado (en Red Hat/Fedora/CentOS):
# sudo rpm -i mi_aplicacion.rpm
# NOTA: Tampoco resuelve dependencias.

# Un error común es mezclar gestores de paquetes (ej. intentar usar 'apt' en Fedora).
# Siempre usa el gestor de paquetes nativo de tu distribución.
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Comandos Esenciales',
    'topic': 'Gestión de Paquetes',
    'subtopic': 'Repositorios',
    'definition': '''
Cuando hablamos de gestores de paquetes en Linux, los "repositorios" son el corazón del sistema. Piensa en ellos como grandes bibliotecas o almacenes centralizados donde se guarda todo el software que puedes instalar en tu sistema.

¿Te estás preguntando por qué esto importa y cómo se usan? 

Los repositorios contienen no solo los programas, sino también información sobre sus versiones, dependencias (otros programas que necesitan para funcionar) y metadatos. Cuando ejecutas un comando como `sudo apt install algo` o `sudo dnf install algo`, tu gestor de paquetes va a estos repositorios, busca el software, verifica sus dependencias y descarga todo lo necesario para instalarlo.

Existen diferentes tipos de repositorios:
* **Oficiales**: Son los que vienen preconfigurados con tu distribución Linux. Son confiables y el software que contienen ha sido probado para funcionar bien con tu versión del sistema.
* **De terceros (PPA en Ubuntu)**: Son repositorios mantenidos por individuos o equipos, que a menudo ofrecen versiones más nuevas de software o programas que no están en los repositorios oficiales. Hay que usarlos con precaución, ya que no siempre tienen el mismo nivel de pruebas.
* **Comerciales**: Algunas empresas ofrecen sus propios repositorios para distribuir su software propietario (como navegadores o herramientas de desarrollo).

La gestión de repositorios implica añadir nuevas fuentes de software o eliminar las que ya no necesitas. Esto se hace editando archivos de configuración o usando comandos específicos del gestor de paquetes. Mantener tus repositorios actualizados y bien gestionados es crucial para tener acceso al software más reciente y seguro.
''',
    'code_example': r'''
# Gestionando repositorios en Debian/Ubuntu (apt)

# 1. La configuración de los repositorios se encuentra en /etc/apt/sources.list
# Puedes ver su contenido:
cat /etc/apt/sources.list

# 2. Añadir un PPA (Personal Package Archive) - requiere el paquete 'software-properties-common':
# sudo apt install software-properties-common
# sudo add-apt-repository ppa:nombre_del_ppa/ppa
# Ejemplo: Para añadir un PPA de un editor de texto:
# sudo add-apt-repository ppa:libreoffice/ppa
# Luego de añadir un repositorio, siempre actualiza la lista de paquetes:
# sudo apt update

# Gestionando repositorios en Fedora/CentOS/RHEL (dnf/yum)

# Los repositorios se suelen configurar en archivos .repo en el directorio /etc/yum.repos.d/
# Puedes listar los archivos .repo existentes:
# ls /etc/yum.repos.d/

# Para habilitar/deshabilitar repositorios o añadir nuevos, se suele editar manualmente
# estos archivos .repo o usar el comando 'dnf config-manager'.
# Ejemplo para instalar dnf-plugins-core (si no está instalado):
# sudo dnf install 'dnf-command(config-manager)'
# Habilitar un repositorio:
# sudo dnf config-manager --set-enabled nombre_del_repositorio

# Un error común es añadir repositorios no confiables, lo que puede introducir software inestable
# o incluso comprometer la seguridad de tu sistema.
# Siempre investiga antes de añadir un nuevo repositorio.
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Comandos Esenciales',
    'topic': 'Gestión de Paquetes',
    'subtopic': 'Snap y Flatpak',
    'definition': '''
Más allá de los gestores de paquetes tradicionales como `apt` o `dnf`, han surgido nuevas tecnologías para la distribución de software en Linux: Snap y Flatpak. Ambos buscan simplificar la instalación de aplicaciones, empaquetándolas con todas sus dependencias.

¿Te estás preguntando por qué esto importa y cuál es la diferencia? 

Pensemos por un momento en los problemas que buscan resolver. Históricamente, una aplicación podía no funcionar en una distribución de Linux diferente a la que fue creada, o tener conflictos de dependencias con otras aplicaciones. Snap (desarrollado por Canonical, la empresa detrás de Ubuntu) y Flatpak (desarrollado por la comunidad, apoyado por Red Hat) abordan esto:
* **Concepto de "sandbox"**: Tanto Snap como Flatpak aíslan las aplicaciones del resto del sistema. Esto significa que una aplicación Snap o Flatpak incluye todas las librerías y dependencias que necesita para funcionar, sin interferir con otras aplicaciones o con el sistema base. Es como tener cada aplicación en su propia "caja".
* **Actualizaciones simplificadas**: Las aplicaciones se actualizan de forma independiente al sistema operativo, lo que facilita a los desarrolladores distribuir las últimas versiones de su software directamente a los usuarios.
* **Compatibilidad universal**: Una aplicación empaquetada como Snap o Flatpak debería funcionar en cualquier distribución de Linux que soporte Snapd o Flatpak, respectivamente. Esto reduce la fragmentación en el ecosistema de aplicaciones Linux.

Mientras que `apt` o `dnf` gestionan los paquetes del sistema operativo y las librerías principales, Snap y Flatpak se centran en la distribución de aplicaciones de usuario. Elegir uno u otro a menudo depende de la disponibilidad de la aplicación que buscas y de tu preferencia personal. Son el futuro de la distribución de software en el escritorio Linux.
''',
    'code_example': r'''
# Ejemplos de uso de Snap y Flatpak

# Asume que Snapd y Flatpak están instalados en tu sistema.
# Si no lo están:
# sudo apt install snapd (para Ubuntu/Debian)
# sudo apt install flatpak (para Ubuntu/Debian)
# sudo dnf install flatpak (para Fedora/CentOS)
# flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo (añadir repositorio Flathub)

# Usando Snap:

# 1. Buscar una aplicación (ej. 'spotify'):
snap find spotify

# 2. Instalar una aplicación Snap:
sudo snap install spotify

# 3. Listar las aplicaciones Snap instaladas:
snap list

# 4. Eliminar una aplicación Snap:
sudo snap remove spotify

# Usando Flatpak:

# 1. Buscar una aplicación (ej. 'gimp'):
flatpak search gimp

# 2. Instalar una aplicación Flatpak (ej. GIMP desde Flathub):
# flatpak install flathub org.gimp.GIMP

# 3. Listar las aplicaciones Flatpak instaladas:
flatpak list

# 4. Eliminar una aplicación Flatpak:
# flatpak uninstall org.gimp.GIMP

# Un error común es intentar instalar una aplicación Snap o Flatpak si el sistema no tiene
# la plataforma (snapd o flatpak) instalada y configurada.
# Otro error es olvidar que los comandos Snap y Flatpak son diferentes a los de apt/dnf.
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Comandos Esenciales',
    'topic': 'Gestión de Paquetes',
    'subtopic': 'Compilación desde fuentes',
    'definition': '''
Aunque los gestores de paquetes hacen la vida mucho más fácil, a veces te encontrarás en situaciones donde el software que necesitas no está disponible en los repositorios o necesitas una versión muy específica, con configuraciones personalizadas. En estos casos, la solución es "compilar desde las fuentes".

¿Te estás preguntando por qué esto importa y qué significa exactamente? 

Pensemos por un momento en cómo funciona. La mayoría del software está escrito en lenguajes de programación de alto nivel (como C, C++, Python, etc.). Antes de que la computadora pueda ejecutarlo, ese código fuente debe ser "compilado" a un formato binario que la máquina entienda. Cuando descargas un paquete `.deb` o `.rpm`, ya está compilado. Sin embargo, compilar desde las fuentes significa que tú mismo tomas el código fuente, lo adaptas (si es necesario) y lo conviertes en un programa ejecutable para tu sistema.

El proceso general suele seguir estos pasos:
1.  **Descargar el código fuente**: Generalmente un archivo `.tar.gz` o un repositorio Git.
2.  **Descomprimir el archivo**: Si es un tarball.
3.  **Configurar la compilación**: Usando un script `configure`. Este paso verifica que tengas todas las dependencias necesarias y prepara el software para tu sistema.
4.  **Compilar**: Ejecutando el comando `make`. Aquí es donde el código fuente se convierte en binarios.
5.  **Instalar**: Ejecutando `sudo make install`. Esto copia los binarios y archivos necesarios a los directorios del sistema.

Compilar desde las fuentes te da el máximo control y flexibilidad, pero también requiere más conocimiento y paciencia para resolver dependencias. Es una habilidad de nivel intermedio que te permite ejecutar software muy nuevo o muy específico que de otra forma no podrías.
''',
    'code_example': r'''
# Pasos básicos para compilar software desde las fuentes
# Este es un ejemplo genérico y los pasos pueden variar ligeramente
# dependiendo del software.

# 1. Descargar el código fuente (ej. con 'wget' o 'git clone'):
# wget https://ejemplo.com/software-1.0.tar.gz
# git clone https://github.com/alguien/mi_software.git

# 2. Descomprimir el archivo (si es un tarball):
# tar -xzvf software-1.0.tar.gz
# cd software-1.0/

# 3. Instalar dependencias de compilación (esto es crucial y varía mucho):
# Por ejemplo, para un proyecto C/C++ en Ubuntu, podrías necesitar:
# sudo apt install build-essential autoconf automake libtool pkg-config

# 4. Configurar el proceso de compilación (esto genera el Makefile):
./configure
# A veces necesitarás opciones específicas, ej: ./configure --prefix=/opt/mi_app

# 5. Compilar el software:
make

# 6. Instalar el software (normalmente requiere permisos de root):
sudo make install

# Un error común es que el paso `./configure` falle porque faltan dependencias.
# Los mensajes de error suelen indicar qué paquete o librería necesitas instalar.
# Otro error es olvidar `sudo` en `make install`, lo que resulta en errores de permisos.
# Siempre lee el archivo `README` o `INSTALL` del proyecto; ellos te darán los pasos exactos.
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Comandos Esenciales',
    'topic': 'Usuarios y Grupos',
    'subtopic': 'Creación y gestión (useradd, usermod, passwd)',
    'definition': '''
En Linux, la administración de usuarios es fundamental para la seguridad y la organización del sistema. Cada usuario tiene su propio espacio y permisos, lo que permite un control granular sobre quién puede hacer qué.

¿Te estás preguntando por qué esto importa y cómo se hace? 

Pensemos por un momento en las herramientas básicas para esta tarea:
* `useradd`: Este comando se usa para crear nuevos usuarios. Le das un nombre, un directorio personal y, opcionalmente, un grupo principal, entre otras cosas. Es el punto de partida para dar acceso a alguien al sistema.
* `usermod`: Si necesitas modificar la información de un usuario existente (cambiar su directorio personal, grupo, shell, etc.), `usermod` es tu herramienta. Es como el "editor" de usuarios.
* `passwd`: Permite cambiar la contraseña de un usuario. Es esencial para la seguridad, ya que una contraseña robusta es la primera línea de defensa contra accesos no autorizados. Cada usuario puede cambiar su propia contraseña, y el administrador puede cambiar la de otros.

Dominar estos comandos te permite controlar quién tiene acceso al sistema y qué pueden hacer, lo cual es crucial en cualquier entorno multiusuario o en servidores.
''',
    'code_example': '''
# Creando y gestionando usuarios

# 1. Crear un nuevo usuario llamado 'invitado':
sudo useradd invitado

# 2. Establecer la contraseña del usuario 'invitado':
sudo passwd invitado

# 3. Crear un nuevo usuario con un directorio personal específico:
sudo useradd -m -d /home/nuevo_usuario nuevo_usuario
# -m: crear el directorio personal
# -d: especificar el directorio personal

# 4. Añadir un usuario a un grupo secundario (ej. 'sudo' para darle privilegios):
sudo usermod -aG sudo invitado
# -aG: añadir al grupo, no reemplazarlo

# 5. Cambiar el shell (intérprete de comandos) de un usuario:
sudo usermod -s /bin/bash invitado
# -s: especificar el shell

# 6. Bloquear la cuenta de un usuario (sin eliminarlo):
sudo usermod -L invitado
# -L: bloquear

# 7. Desbloquear la cuenta de un usuario:
sudo usermod -U invitado
# -U: desbloquear

# Un error común es olvidar usar `sudo` para crear o modificar usuarios, ya que requiere
# privilegios de administrador. Otro error es no establecer una contraseña segura.
'''
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Comandos Esenciales',
    'topic': 'Usuarios y Grupos',
    'subtopic': 'Grupos (groupadd, gpasswd)',
    'definition': '''
En Linux, los grupos son una forma de organizar a los usuarios y controlar los permisos de acceso a los archivos y recursos del sistema. Un grupo puede tener varios usuarios, y cada usuario pertenece al menos a un grupo principal.

¿Te estás preguntando por qué esto importa y cómo se gestionan? 

Pensemos por un momento en su utilidad. Los grupos simplifican la administración de permisos. En lugar de dar permisos a cada usuario individualmente, puedes dárselos a un grupo, y todos los miembros del grupo heredarán esos permisos.

* `groupadd`: Este comando se usa para crear nuevos grupos. Le das un nombre y, opcionalmente, un ID de grupo (GID).
* `gpasswd`: Permite gestionar los miembros de un grupo. Puedes añadir o eliminar usuarios de un grupo existente.

La gestión de grupos es esencial en entornos multiusuario, como servidores web o de archivos, donde necesitas controlar quién tiene acceso a qué recursos.
''',
    'code_example': '''
# Gestionando grupos

# 1. Crear un nuevo grupo llamado 'desarrolladores':
sudo groupadd desarrolladores

# 2. Añadir un usuario existente ('juan') al grupo 'desarrolladores':
sudo usermod -aG desarrolladores juan
# -aG: añadir al grupo, no reemplazarlo

# 3. Crear un grupo con un GID específico (poco común):
sudo groupadd -g 1001 editores
# -g: especificar el GID

# 4. Eliminar un usuario de un grupo (usando gpasswd):
sudo gpasswd -d juan desarrolladores
# -d: eliminar usuario del grupo

# 5. Mostrar los grupos a los que pertenece un usuario:
groups juan

# Un error común es confundir `usermod -g` con `usermod -aG`. El primero *reemplaza* el grupo principal,
# mientras que el segundo *añade* al grupo secundario.
'''
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Comandos Esenciales',
    'topic': 'Usuarios y Grupos',
    'subtopic': 'Sudo y su',
    'definition': '''
En Linux, la seguridad es primordial. `sudo` y `su` son dos comandos clave para gestionar los privilegios de usuario y ejecutar comandos como si fueras el administrador (root).

¿Te estás preguntando por qué esto importa y cuál es la diferencia? 

Pensemos por un momento en su función. El usuario root tiene control total sobre el sistema, y usarlo para todo sería peligroso. `sudo` y `su` nos permiten elevar nuestros privilegios solo cuando es necesario.

* `sudo` (Substitute User Do): Permite a un usuario autorizado ejecutar un solo comando con privilegios de root. Es más seguro que `su` porque solo elevas los privilegios para un comando específico, no para toda una sesión.
* `su` (Substitute User): Permite cambiar al usuario root o a otro usuario. Si no especificas un usuario, te convierte en root. Es útil para realizar varias tareas administrativas seguidas, pero es menos seguro que `sudo`.

La configuración de qué usuarios pueden usar `sudo` se encuentra en el archivo `/etc/sudoers`. Modificar este archivo requiere precaución para no bloquear el acceso administrativo.
''',
    'code_example': '''
# Usando sudo y su

# 1. Ejecutar un comando como root usando sudo:
sudo apt update
# Pide la contraseña del usuario actual.

# 2. Ejecutar un comando como otro usuario (ej. 'juan'):
sudo -u juan comando

# 3. Convertirse en root usando su (pide la contraseña de root):
su
# Ahora la terminal tiene privilegios de root.

# 4. Convertirse en otro usuario usando su (pide la contraseña de ese usuario):
su juan

# 5. Editar el archivo /etc/sudoers (¡con mucho cuidado!):
sudo visudo
# Usa 'visudo' en lugar de un editor de texto normal para evitar errores.

# Un error común es usar `su` en lugar de `sudo` para tareas administrativas simples.
# `sudo` es preferible por seguridad. Otro error es editar `/etc/sudoers` incorrectamente,
# lo que puede bloquear el acceso administrativo.
'''
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Comandos Esenciales',
    'topic': 'Usuarios y Grupos',
    'subtopic': 'Cuotas de disco',
    'definition': '''
En entornos multiusuario, especialmente en servidores, es importante controlar cuánto espacio en disco puede usar cada usuario o grupo. Las "cuotas de disco" te permiten establecer límites y evitar que un usuario o grupo acapare todo el espacio disponible.

¿Te estás preguntando por qué esto importa y cómo se implementa? 

Pensemos por un momento en la justicia y la estabilidad del sistema. Sin cuotas, un usuario podría llenar el disco duro con archivos innecesarios, afectando a otros usuarios o incluso al sistema en sí.

La gestión de cuotas implica:
1.  Habilitar las cuotas en el sistema de archivos (editando `/etc/fstab`).
2.  Instalar las herramientas de gestión de cuotas (normalmente el paquete `quota`).
3.  Configurar las cuotas para usuarios y/o grupos (usando `edquota`).

Puedes establecer límites "blandos" (soft limits) y "duros" (hard limits). El límite blando es un aviso, mientras que el duro impide que el usuario o grupo exceda ese espacio.
''',
    'code_example': '''
# Gestionando cuotas de disco

# 1. Verificar si las cuotas están habilitadas en /etc/fstab:
cat /etc/fstab
# Busca opciones como 'usrquota' o 'grpquota' en la partición donde quieres habilitar las cuotas.

# 2. Instalar las herramientas de gestión de cuotas (si no están instaladas):
sudo apt install quota # En Debian/Ubuntu
sudo yum install quota # En Fedora/CentOS

# 3. Activar las cuotas (remontando el sistema de archivos):
sudo mount -o remount,usrquota,grpquota /

# 4. Inicializar las bases de datos de cuotas:
sudo quotacheck -avugm

# 5. Editar las cuotas para un usuario (ej. 'juan'):
sudo edquota -u juan
# Se abrirá un editor de texto. Define los límites blandos y duros para bloques y inodos.

# 6. Editar las cuotas para un grupo (ej. 'desarrolladores'):
sudo edquota -g desarrolladores

# 7. Ver las cuotas de un usuario:
quota juan

# 8. Ver las cuotas de todos los usuarios:
repquota -a

# Un error común es no habilitar las cuotas en `/etc/fstab` antes de intentar configurarlas.
# Otro error es no entender la diferencia entre límites blandos y duros.
'''
  });
}

Future<void> insertJrLevel3DataLinux(Database db) async {
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Shell Scripting Básico',
    'topic': 'Fundamentos de Bash',
    'subtopic': 'Variables y entornos',
    'definition': '''
En el mundo de Bash, las variables son como esos post-its que usas para recordar cosas importantes. Nos permiten guardar información temporalmente para usarla más tarde en nuestros scripts o comandos. Los entornos, por otro lado, son el contexto donde estas variables viven.

¿Te estás preguntando por qué esto es relevante? 

Piensa en un escenario donde necesitas repetir un nombre de archivo o una ruta muchas veces. En lugar de escribirlo una y otra vez, lo guardas en una variable y simplemente usas el nombre de la variable. Esto hace que tus scripts sean más limpios, fáciles de mantener y menos propensos a errores. Hay variables que tú defines (`mi_variable="hola"`) y otras que ya existen en el sistema (variables de entorno como `PATH` o `HOME`), que nos indican dónde buscar programas o cuál es el directorio personal del usuario. Entender cómo funcionan es clave para escribir scripts potentes y eficientes.
''',
    'code_example': r'''
# Variables y entornos en Bash

# 1. Definir una variable de usuario:
mi_mensaje="Hola, mundo!"
echo $mi_mensaje
# Salida: Hola, mundo!

# 2. Usar una variable de entorno (ej. HOME):
echo "Tu directorio personal es: $HOME"

# 3. Definir una variable de entorno para un comando:
# NOTA: Esta variable solo existe para el comando `ls`
mi_prefijo="[ARCH]" ls $mi_prefijo*

# 4. Exportar una variable para que esté disponible en subshells:
export mi_variable_global="Acceso desde cualquier subshell"
bash -c 'echo "Desde subshell: $mi_variable_global"'
# Salida: Desde subshell: Acceso desde cualquier subshell

# 5. Intentar acceder a una variable no exportada desde un subshell (esto no funcionará):
mi_variable_local="Solo en este shell"
bash -c 'echo "Desde subshell (fallido): $mi_variable_local"'
# Salida: Desde subshell (fallido): 

# Un error común es olvidar el signo `$` al intentar acceder al valor de la variable.
# Otro error es no exportar variables cuando se necesitan en subshells.
'''
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Shell Scripting Básico',
    'topic': 'Fundamentos de Bash',
    'subtopic': 'Redirección y pipes',
    'definition': '''
En Bash, la redirección y los pipes son herramientas esenciales que nos permiten controlar cómo fluye la información entre los comandos. En pocas palabras, nos permiten "desviar" la salida de un comando o usar la salida de uno como entrada para otro.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en la eficiencia. Imagina que quieres guardar la salida de un comando en un archivo o que necesitas que la lista de archivos de un directorio sea filtrada por otro comando. En lugar de copiar y pegar manualmente, o de crear archivos temporales, la redirección y los pipes hacen todo esto de forma automática y fluida. Los operadores `>` y `>>` nos permiten enviar la salida a un archivo (sobreescribiendo o añadiendo), mientras que `<` nos permite usar un archivo como entrada. El operador `|` (pipe) es un verdadero game-changer: conecta la salida estándar de un comando con la entrada estándar de otro, creando cadenas de comandos muy potentes. Dominar esto es fundamental para automatizar tareas y manipular datos eficazmente.
''',
    'code_example': '''
# Redirección y pipes en Bash

# 1. Redirigir la salida estándar a un archivo (crea/sobrescribe):
echo "Este es un mensaje." > salida.txt
cat salida.txt
# Salida: Este es un mensaje.

# 2. Redirigir la salida estándar a un archivo (añade al final):
echo "Este es otro mensaje." >> salida.txt
cat salida.txt
# Salida: Este es un mensaje.
# Este es otro mensaje.

# 3. Redirigir la entrada estándar desde un archivo:
sort < nombres.txt
# (Asumiendo que nombres.txt contiene nombres en diferentes líneas, los ordenará)

# 4. Usar un pipe para encadenar comandos:
ls -l | grep ".txt"
# Muestra solo los archivos .txt de la lista larga.

# 5. Redirigir errores a un archivo:
rm archivo_inexistente 2> errores.log
# Los errores se guardan en errores.log en lugar de mostrarse en la consola.

# 6. Redirigir la salida estándar y los errores al mismo archivo:
ls -l non_existent_file &> todo.log
# O también: ls -l non_existent_file > todo.log 2>&1

# Un error común es usar `>` cuando se quiere añadir contenido, sobreescribiendo el archivo.
# Otro error es olvidar que el pipe (`|`) solo redirige la salida estándar, no los errores.
'''
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Shell Scripting Básico',
    'topic': 'Fundamentos de Bash',
    'subtopic': 'Comillas y expansión',
    'definition': r'''
Cuando trabajamos con Bash, las comillas y la expansión son cruciales para controlar cómo el shell interpreta los caracteres especiales y expande las variables o los patrones. No sé tú, pero a mí esto al principio me costó 🤯 un poco entender qué tipo de comilla usar y cuándo.

Pensemos por un momento en su importancia. Si no usas las comillas correctas, Bash podría interpretar espacios como separadores de argumentos, expandir variables que no quieres o ignorar caracteres especiales.
* **Comillas dobles (`"`):** Permiten la expansión de variables (por ejemplo, `$HOME`) y comandos (usando `` `comando` `` o `$(comando)`). Sin embargo, suprimen la expansión de comodines (globbing, como `*` o `?`). Son ideales cuando quieres que el contenido de una variable se expanda, pero que los espacios dentro de ella se traten como parte de un único argumento.
* **Comillas simples (`'`):** Son las más estrictas. Suprimen *toda* expansión. Lo que pones entre comillas simples se toma literalmente, carácter por carácter. Esto es útil cuando quieres asegurar que una cadena de texto se interprete exactamente como está escrita, sin que Bash intente "ayudarte" con expansiones.
* **Sin comillas:** Si no usas comillas, Bash realizará todas las expansiones posibles (variables, comodines, comandos, etc.) y dividirá la línea en palabras basándose en los espacios (word splitting). Esto puede llevar a resultados inesperados si no se maneja con cuidado.

Entender cuándo y cómo usar cada tipo de comillas te dará un control mucho mayor sobre tus scripts y comandos, evitando sorpresas desagradables.
''',
    'code_example': r'''
# Comillas y expansión en Bash

# 1. Comillas dobles (`"`): permiten expansión de variables, suprimen comodines.
mi_nombre="Juan Pérez"
echo "Hola, $mi_nombre"
# Salida: Hola, Juan Pérez

echo "Listar archivos: $(ls)"
# Salida: Listar archivos: archivo1.txt archivo2.sh ...

touch "archivo con espacios.txt"
ls "archivo con espacios.txt"
# Muestra: archivo con espacios.txt (se trata como un solo argumento)

ls *.txt
# Esto expande a todos los archivos .txt

ls "*.txt"
# Esto busca un archivo literal llamado "*.txt" (probablemente no exista)

# 2. Comillas simples (`'`): suprimen toda expansión, literal.
echo 'Hola, $mi_nombre'
# Salida: Hola, $mi_nombre

echo 'Listar archivos: $(ls)'
# Salida: Listar archivos: $(ls)

# 3. Sin comillas: expande todo, realiza word splitting.
mi_lista="uno dos tres"
for palabra in $mi_lista; do echo $palabra; done
# Salida:
# uno
# dos
# tres

# Un error común es usar comillas simples cuando quieres que una variable se expanda.
# Otro error es no usar comillas en rutas con espacios, lo que provoca que Bash interprete
# cada parte de la ruta como un argumento separado.
'''
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Shell Scripting Básico',
    'topic': 'Fundamentos de Bash',
    'subtopic': 'Historial y autocompletado',
    'definition': '''
En el día a día trabajando con la línea de comandos de Linux, el historial de comandos y el autocompletado son como tus asistentes personales que te ahorran un montón de tiempo y te evitan errores tipográficos.

¿Te estás preguntando por qué esto es tan útil? 

Pensemos por un momento en la comodidad.
El **historial de comandos** te permite recordar y reutilizar comandos que ya has ejecutado. Esto es increíblemente práctico para no tener que teclear una y otra vez comandos largos o complejos. Puedes navegar por ellos con las flechas del teclado (arriba y abajo), buscar dentro del historial (`Ctrl+R`) o incluso ver una lista numerada de tus últimos comandos (`history`). Esto no solo acelera tu flujo de trabajo, sino que también te ayuda a recordar la sintaxis de comandos que usas con menos frecuencia.

El **autocompletado** (generalmente activado con la tecla `Tab`) es una maravilla que rellena automáticamente nombres de archivos, directorios, comandos y hasta opciones de comandos. Empiezas a escribir y si presionas `Tab` una vez, Bash intenta completar el resto. Si hay varias opciones, presionas `Tab` dos veces para verlas todas. Esto es un salvavidas para evitar errores tipográficos, especialmente con rutas largas o nombres complicados. Dominar estas dos características básicas pero poderosas transformará tu experiencia en la terminal, haciéndote mucho más eficiente y preciso.
''',
    'code_example': r'''
# Historial y autocompletado en Bash

# 1. Navegar por el historial:
# Presiona la flecha ARRIBA para ver el comando anterior.
# Presiona la flecha ABAJO para ver el comando siguiente.

# 2. Buscar en el historial (búsqueda inversa):
# Presiona CTRL+R y empieza a escribir.
# Ejemplo: (reverse-i-search)`grep`:
# Te mostrará el último comando que contenga 'grep'.

# 3. Ver el historial completo:
history
# Muestra una lista numerada de los comandos ejecutados.

# 4. Ejecutar un comando del historial por su número:
!123
# Ejecuta el comando número 123 de tu historial.

# 5. Ejecutar el último comando:
!!

# 6. Autocompletado:
# Escribe `cd /us` y presiona TAB (se completará a `cd /usr/`)
# Escribe `ls /var/l` y presiona TAB dos veces (mostrará opciones como `lib`, `local`, `log`)

# 7. Ejecutar el último argumento del comando anterior:
mkdir mi_directorio
cd !$
# cd !$ expande a `cd mi_directorio`

# Un error común es no aprovechar el autocompletado, tecleando rutas y nombres completos.
# Otro error es no usar la búsqueda inversa (Ctrl+R) para encontrar comandos rápidamente.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Shell Scripting Básico',
    'topic': 'Estructuras de Control',
    'subtopic': 'Condicionales (if, case)',
    'definition': '''
En el mundo del shell scripting, las estructuras condicionales son como las decisiones que tomamos en la vida real. Nos permiten ejecutar ciertas partes del código solo si se cumple una condición específica. Esto es fundamental para que nuestros scripts puedan adaptarse a diferentes situaciones y no sean solo una secuencia lineal de comandos.

¿Te estás preguntando por qué esto es tan importante? 

Pensemos por un momento en la flexibilidad que nos dan. Sin condicionales, un script haría lo mismo siempre, sin importar el estado del sistema o las entradas del usuario. Pero con `if` y `case`, nuestros scripts pueden ser más inteligentes:

* `if`: Es la estructura condicional más común. Evalúa una expresión y, si es verdadera, ejecuta un bloque de comandos. Podemos añadir `elif` (else if) para probar condiciones adicionales y `else` para un bloque de comandos que se ejecuta si ninguna de las condiciones anteriores es verdadera. Es ideal para condiciones simples o cuando necesitamos un control muy específico sobre el flujo.
* `case`: Es como un `if` pero optimizado para múltiples opciones basadas en el valor de una variable. Es especialmente útil cuando tienes una variable que puede tomar varios valores y quieres ejecutar un bloque de código diferente para cada valor. Piensa en menús interactivos o en procesar diferentes tipos de entrada; `case` lo hace más legible y ordenado que anidar muchos `if`/`elif`.

Dominar estas estructuras te permite crear scripts que reaccionan a diferentes escenarios, haciendo tu automatización mucho más robusta y dinámica.
''',
    'code_example': r'''
# Condicionales en Bash: if y case

# --- Usando if ---

# 1. Ejemplo básico de if:
numero=10
if [ $numero -gt 5 ]; then
  echo "El número es mayor que 5."
fi
# Salida: El número es mayor que 5.

# 2. Ejemplo con if-else:
nombre="Juan"
if [ "$nombre" == "Pedro" ]; then
  echo "Hola, Pedro."
else
  echo "No eres Pedro."
fi
# Salida: No eres Pedro.

# 3. Ejemplo con if-elif-else:
edad=20
if [ $edad -lt 18 ]; then
  echo "Eres menor de edad."
elif [ $edad -ge 18 ] && [ $edad -lt 65 ]; then
  echo "Eres adulto."
else
  echo "Eres un adulto mayor."
fi
# Salida: Eres adulto.

# --- Usando case ---

# 4. Ejemplo básico de case:
opcion="c"
case "$opcion" in
  "a")
    echo "Seleccionaste la opción A."
    ;;
  "b")
    echo "Seleccionaste la opción B."
    ;;
  "c")
    echo "Seleccionaste la opción C."
    ;;
  *)
    echo "Opción inválida."
    ;;
esac
# Salida: Seleccionaste la opción C.

# 5. Case con múltiples patrones y pipes:
fruta="manzana"
case "$fruta" in
  "manzana" | "pera")
    echo "Es una fruta común."
    ;;
  "mango")
    echo "Es un mango tropical."
    ;;
  *)
    echo "No conozco esa fruta."
    ;;
esac
# Salida: Es una fruta común.

# Errores comunes:
# - Olvidar los corchetes `[]` o los puntos y comas `;;` en `case`.
# - No usar `$((...))` para operaciones aritméticas en `if` cuando sea necesario.
# - Olvidar comillas en variables dentro de `if` que puedan contener espacios (ej. [ "$var" == "valor" ]).
'''
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Shell Scripting Básico',
    'topic': 'Estructuras de Control',
    'subtopic': 'Bucles (for, while, until)',
    'definition': '''
En el mundo del shell scripting, los bucles son la forma en que hacemos que nuestros scripts repitan tareas una y otra vez sin cansarse. Si tienes una acción que necesitas realizar múltiples veces (ya sea un número fijo de veces o hasta que se cumpla una condición), los bucles son tus mejores aliados.

¿Te estás preguntando por qué son tan útiles? 

Pensemos por un momento en la automatización. Imagina que necesitas procesar una lista de archivos, o que quieres ejecutar un comando cada cierto tiempo hasta que algo cambie. Hacer esto manualmente sería tedioso y propenso a errores. Aquí es donde entran los bucles:

* `for`: Este bucle es ideal cuando sabes de antemano sobre qué elementos quieres iterar. Puedes recorrer una lista de números, nombres de archivos, o cualquier secuencia de elementos. Es perfecto para procesar colecciones o cuando necesitas un número definido de repeticiones.
* `while`: El bucle `while` sigue ejecutándose mientras una condición sea verdadera. Es decir, comprueba la condición al principio de cada iteración. Es muy útil cuando no sabes cuántas veces necesitas repetir algo, pero sabes cuándo quieres que se detenga (por ejemplo, leer líneas de un archivo hasta el final, o esperar a que un servicio se inicie).
* `until`: Es lo opuesto a `while`. El bucle `until` se ejecuta *hasta* que una condición se vuelve verdadera. Comprueba la condición al principio de cada iteración y continúa mientras la condición sea falsa. Es útil cuando quieres esperar a que algo específico ocurra antes de detenerte.

Con estos bucles, puedes transformar tareas repetitivas en procesos automatizados y eficientes, liberando tu tiempo para cosas más interesantes.
''',
    'code_example': r'''
# Bucles en Bash: for, while, until

# --- Usando for ---

# 1. Bucle for para iterar sobre una lista de números:
for i in 1 2 3 4 5; do
  echo "Número: $i"
done
# Salida: Números del 1 al 5.

# 2. Bucle for para iterar sobre archivos en un directorio:
for archivo in *.txt; do
  echo "Procesando archivo: $archivo"
done
# Procesará cada archivo .txt en el directorio actual.

# 3. Bucle for estilo C (requiere doble paréntesis):
for (( i=0; i<3; i++ )); do
  echo "Iteración $i"
done
# Salida: Iteración 0, Iteración 1, Iteración 2

# --- Usando while ---

# 4. Bucle while para contar hasta 3:
contador=0
while [ $contador -lt 3 ]; do
  echo "Contador: $contador"
  contador=$((contador + 1))
done
# Salida: Contador 0, Contador 1, Contador 2

# 5. Bucle while para leer un archivo línea por línea:
# Crear un archivo de ejemplo:
# echo "Línea 1" > ejemplo.txt
# echo "Línea 2" >> ejemplo.txt
# echo "Línea 3" >> ejemplo.txt

while IFS= read -r linea; do
  echo "Leído: $linea"
done < ejemplo.txt
# Salida: Leído: Línea 1, Leído: Línea 2, Leído: Línea 3

# --- Usando until ---

# 6. Bucle until para esperar hasta que un archivo exista:
archivo_a_esperar="/tmp/archivo_temporal.txt"
until [ -f "$archivo_a_esperar" ]; do
  echo "Esperando por $archivo_a_esperar..."
  sleep 1 # Espera 1 segundo antes de reintentar
done
echo "¡$archivo_a_esperar encontrado!"
# El bucle se ejecutará hasta que el archivo sea creado.

# Errores comunes:
# - Bucles infinitos si la condición nunca cambia o es siempre verdadera/falsa.
# - Olvidar incrementar contadores en bucles while/until.
# - No usar comillas dobles en variables que podrían contener espacios en las condiciones del bucle.
'''
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Shell Scripting Básico',
    'topic': 'Estructuras de Control',
    'subtopic': 'Funciones',
    'definition': '''
En el mundo del shell scripting, las funciones son como pequeñas recetas o mini-programas que encapsulan un conjunto de comandos. Nos permiten agrupar código que realiza una tarea específica para poder reutilizarlo varias veces a lo largo de un script o incluso en diferentes scripts.

¿Te estás preguntando por qué esto es tan práctico? 

Pensemos por un momento en la organización y la eficiencia. Si tienes un bloque de código que se repite varias veces, en lugar de copiarlo y pegarlo (lo cual es una mala práctica y dificulta el mantenimiento), lo metes dentro de una función. Así, si necesitas hacer un cambio, lo haces en un solo lugar. Además, las funciones hacen que tus scripts sean más legibles y fáciles de entender, ya que le das un nombre descriptivo a un bloque de funcionalidad. Es como darle un título a un párrafo: de un vistazo sabes de qué trata. Pueden recibir parámetros, lo que las hace aún más versátiles, permitiéndote adaptar su comportamiento sin reescribir el código interno.
''',
    'code_example': r'''
# Funciones en Bash

# 1. Definición y llamada básica de una función:
saludar() {
  echo "¡Hola desde mi primera función!"
}

saludar
# Salida: ¡Hola desde mi primera función!

# 2. Función con parámetros:
greeter() {
  echo "Hola, $1! Hoy es $2."
}

greeter "Mundo" "jueves"
# Salida: Hola, Mundo! Hoy es jueves.

# 3. Función que devuelve un valor (usando return para el estado de salida):
# En Bash, 'return' solo devuelve un número entero (0-255). Para devolver cadenas, se usa echo.
sumar() {
  local resultado=$(( $1 + $2 ))
  echo $resultado # Imprimimos el resultado para capturarlo.
  return 0 # 0 indica éxito
}

suma_total=$(sumar 5 3)
echo "La suma es: $suma_total"
# Salida: La suma es: 8

# 4. Función con variables locales (usando 'local'):
mostrar_variable() {
  local mensaje="Esta es una variable local"
  echo "Dentro de la función: $mensaje"
}

mensaje="Esta es una variable global"
echo "Antes de la función: $mensaje"
mostrar_variable
echo "Después de la función: $mensaje"
# Salida:
# Antes de la función: Esta es una variable global
# Dentro de la función: Esta es una variable local
# Después de la función: Esta es una variable global

# Errores comunes:
# - Olvidar `local` en variables dentro de funciones, lo que puede causar efectos secundarios inesperados en variables globales.
# - Intentar devolver una cadena de texto con `return` (solo se usa para códigos de salida).
# - No pasar suficientes argumentos a la función o no manejarlos dentro de la función.
'''
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Shell Scripting Básico',
    'topic': 'Estructuras de Control',
    'subtopic': 'Parámetros y argumentos',
    'definition': r'''
Cuando creamos scripts en Bash, rara vez queremos que hagan exactamente lo mismo cada vez que se ejecutan. Aquí es donde entran en juego los parámetros y argumentos: nos permiten pasar información a nuestros scripts para que puedan comportarse de manera diferente según lo que necesitemos. Son como las "entradas" que le das a un programa.

¿Te estás preguntando por qué esto es tan útil? 

Pensemos por un momento en la flexibilidad. Imagina un script para copiar archivos; no quieres que siempre copie el mismo archivo al mismo destino. Quieres decirle *qué* archivo copiar y *dónde*. Los parámetros (o argumentos, que se usan indistintamente en este contexto) son esa información que pasamos al script cuando lo ejecutamos en la línea de comandos.

Bash nos proporciona variables especiales para acceder a estos argumentos:
* `$1`, `$2`, `$3`, ...: Representan los argumentos individuales. `$1` es el primer argumento, `$2` el segundo, y así sucesivamente.
* `$0`: Es un caso especial; representa el nombre del propio script que se está ejecutando.
* `$#`: Nos dice cuántos argumentos se le pasaron al script (el número total).
* `$@`: Expande todos los argumentos como palabras separadas. Es muy útil cuando quieres iterar sobre cada argumento individualmente, especialmente si algunos argumentos pueden contener espacios.
* `$*`: También expande todos los argumentos, pero los trata como una sola cadena de texto. No es tan común como `$@` para iterar.
* `$?`: Nos da el código de salida del último comando ejecutado (0 para éxito, diferente de 0 para error).

Entender cómo acceder y manipular estos parámetros es fundamental para crear scripts dinámicos, reutilizables y verdaderamente útiles.
''',
    'code_example': r'''
# Parámetros y argumentos en Bash

# Asumamos que este script se llama 'mi_script.sh'
# y lo ejecutamos así: bash mi_script.sh primer_arg "segundo argumento" 123

# 1. Acceder a argumentos individuales:
echo "Nombre del script: $0"
echo "Primer argumento: $1"
echo "Segundo argumento: $2"
echo "Tercer argumento: $3"
# Salida para el ejemplo:
# Nombre del script: mi_script.sh
# Primer argumento: primer_arg
# Segundo argumento: segundo argumento
# Tercer argumento: 123

# 2. Número total de argumentos:
echo "Número de argumentos: $#"
# Salida para el ejemplo: Número de argumentos: 3

# 3. Iterar sobre todos los argumentos con $@ (recomendado):
echo "Iterando con \$@:"
for arg in "$@"; do
  echo "  Argumento: $arg"
done
# Salida para el ejemplo:
#   Argumento: primer_arg
#   Argumento: segundo argumento
#   Argumento: 123

# 4. Iterar sobre todos los argumentos con $* (cuidado con los espacios):
echo "Iterando con \$*:"
for arg in "$*"; do
  echo "  Argumento: $arg"
done
# Salida para el ejemplo:
#   Argumento: primer_arg segundo argumento 123
# (Nota: $* los trata como una sola cadena si están entre comillas dobles)

# 5. Obtener el código de salida del último comando:
ls /ruta/que/no/existe
echo "Código de salida del ls: $?"
# Salida: Código de salida del ls: 2 (o similar, indicando error)

ls /tmp
echo "Código de salida del ls: $?"
# Salida: Código de salida del ls: 0 (indicando éxito)

# Errores comunes:
# - Olvidar las comillas dobles alrededor de `$@` o `$*` al iterar, lo que puede causar problemas con argumentos que contienen espacios.
# - Confundir `$@` y `$*` en escenarios donde los argumentos pueden tener espacios internos.
# - No validar el número de argumentos esperados al inicio del script.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Shell Scripting Básico',
    'topic': 'Scripts Prácticos',
    'subtopic': 'Automatización de tareas',
    'definition': '''
La automatización de tareas en Bash es donde el poder del scripting realmente brilla. En lugar de ejecutar comandos repetitivos manualmente, escribimos scripts para que el sistema los haga por nosotros. Esto no solo ahorra tiempo, sino que también reduce la posibilidad de errores humanos.

¿Te estás preguntando por qué esto es tan crucial? 

Pensemos por un momento en la eficiencia y la consistencia. Si tienes un conjunto de pasos que necesitas realizar regularmente, como hacer copias de seguridad, limpiar archivos temporales o desplegar una aplicación, automatizarlos asegura que cada vez se hagan de la misma manera, sin olvidar ningún paso. Un script es como tu empleado infatigable que trabaja 24/7 sin quejarse. Puedes combinar todos los comandos que hemos visto hasta ahora (variables, condicionales, bucles, funciones) para construir soluciones robustas que resuelvan problemas reales. Desde un simple script para saludar hasta un sistema de despliegue complejo, la automatización es el corazón de la eficiencia en Linux.
''',
    'code_example': r'''
# Automatización de tareas con scripts Bash

# Ejemplo de script de copia de seguridad simple:
# Guarda esto como 'backup.sh' y dale permisos de ejecución (chmod +x backup.sh)

#!/bin/bash

# Variables
FECHA=$(date +%Y%m%d%H%M%S)
DIR_ORIGEN="/home/usuario/documentos" # Cambia esto a tu directorio de origen
DIR_DESTINO="/home/usuario/backups"  # Cambia esto a tu directorio de destino
NOMBRE_ARCHIVO="backup_docs_$FECHA.tar.gz"

# Crear directorio de destino si no existe
mkdir -p "$DIR_DESTINO"

echo "Iniciando copia de seguridad de $DIR_ORIGEN..."

# Crear el archivo tar.gz
tar -czvf "$DIR_DESTINO/$NOMBRE_ARCHIVO" "$DIR_ORIGEN"

# Verificar si la copia de seguridad fue exitosa
if [ $? -eq 0 ]; then
  echo "Copia de seguridad '$NOMBRE_ARCHIVO' creada exitosamente en $DIR_DESTINO."
else
  echo "¡Error al crear la copia de seguridad!"
fi

# Eliminar copias de seguridad antiguas (ej. las de más de 7 días)
find "$DIR_DESTINO" -type f -name "backup_docs_*.tar.gz" -mtime +7 -delete
echo "Copia de seguridad antiguas eliminadas."

# Un error común es no usar comillas dobles en las rutas de los directorios o nombres de archivo
# si pueden contener espacios, lo que haría que el comando falle.
# Otro error es no verificar el código de salida ($?) para saber si una operación tuvo éxito.
'''
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Shell Scripting Básico',
    'topic': 'Scripts Prácticos',
    'subtopic': 'Programación de tareas (cron, at)',
    'definition': '''
Una vez que tienes tus scripts listos para automatizar, el siguiente paso lógico es que se ejecuten automáticamente en el momento adecuado, incluso cuando no estás frente a la computadora. Aquí es donde entran en juego `cron` y `at`, las herramientas de Linux para programar tareas.

¿Te estás preguntando por qué esto es tan vital? 

Pensemos por un momento en la despreocupación. Imagina que necesitas hacer una copia de seguridad todos los días a las 3 AM o generar un informe semanal. No querrías levantarte a esa hora o recordarlo cada vez. `cron` y `at` se encargan de que tus scripts se ejecuten de forma fiable y puntual.

* `cron`: Es el demonio de planificación de tareas por excelencia en Linux. Te permite programar tareas para que se ejecuten a intervalos regulares (diariamente, semanalmente, mensualmente, a una hora específica, etc.). Las tareas se definen en un archivo llamado `crontab`, que es básicamente una tabla de configuraciones de cron. Cada línea en un crontab representa una tarea programada y su sintaxis puede parecer un poco críptica al principio, pero una vez que la entiendes, es muy potente.
* `at`: A diferencia de `cron`, `at` se usa para programar tareas que se ejecutarán *una sola vez* en un momento futuro específico. Es perfecto para esos "recuérdame hacer esto en media hora" o "ejecuta este comando cuando sea medianoche". No es para tareas recurrentes, sino para eventos puntuales.

Dominar `cron` y `at` te convierte en un verdadero mago de la automatización, permitiéndote que tus sistemas trabajen para ti sin intervención constante.
''',
    'code_example': r'''
# Programación de tareas con cron y at

# --- Usando cron ---

# 1. Editar tu crontab (se abrirá un editor de texto):
crontab -e
# La primera vez te pedirá que elijas un editor (nano, vim, etc.)

# 2. Ejemplos de entradas en crontab:
# Ejecutar un script cada 5 minutos:
# */5 * * * * /ruta/a/mi_script.sh

# Ejecutar un script todos los días a la 2:30 AM:
# 30 2 * * * /ruta/a/otro_script.sh

# Ejecutar un comando cada lunes a las 9:00 AM:
# 0 9 * * 1 echo "¡Es lunes!" >> /tmp/lunes_log.txt

# La sintaxis de crontab es:
# MIN HORA DIA_MES MES DIA_SEMANA COMANDO
# * = cualquier valor
# */n = cada n unidades

# 3. Listar las tareas cron programadas:
crontab -l

# 4. Eliminar todas las tareas cron programadas:
crontab -r # ¡Cuidado! Esto borra todas tus tareas cron.

# --- Usando at ---

# 5. Programar un comando para que se ejecute en 10 minutos:
echo "echo 'Hola desde at, 10 minutos después.'" | at now + 10 minutes

# 6. Programar un script para que se ejecute a una hora específica:
at 18:00 tomorrow
# (Luego escribe los comandos, por ejemplo: /ruta/a/mi_script.sh, y presiona Ctrl+D)

# 7. Listar las tareas at pendientes:
atq

# 8. Eliminar una tarea at por su número de trabajo (ej. 5):
atrm 5

# Errores comunes:
# - Olvidar la ruta completa del script en cron (cron no tiene el mismo PATH que tu sesión interactiva).
# - No dar permisos de ejecución al script que cron intentará ejecutar (chmod +x).
# - Confundir la sintaxis de crontab y no entender el orden de los campos.
# - Olvidar que 'at' es para una sola ejecución, no para tareas recurrentes.
'''
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Shell Scripting Básico',
    'topic': 'Scripts Prácticos',
    'subtopic': 'Validación de entrada',
    'definition': r'''
Cuando creamos scripts en Bash, es muy común que necesitemos que los usuarios (o incluso otros scripts) nos proporcionen información. La "validación de entrada" es el proceso de asegurarnos de que los datos que recibimos son válidos y cumplen con lo que esperamos. Si no validamos la entrada, nuestros scripts pueden fallar de formas inesperadas o, peor aún, ser vulnerables a entradas maliciosas.

¿Te estás preguntando por qué esto es tan crucial? 

Pensemos por un momento en la robustez y la seguridad. Un script que espera un número, pero recibe texto, podría romperse. Un script que espera una ruta de archivo, pero recibe un nombre malicioso, podría causar un desastre. La validación es como un filtro que protege tu script de datos incorrectos o peligrosos.

Podemos validar la entrada de varias maneras:
* **Comprobando el número de argumentos:** Asegurarnos de que el usuario ha proporcionado la cantidad correcta de parámetros.
* **Verificando tipos de datos:** Aunque Bash no tiene tipos de datos fuertes como otros lenguajes, podemos usar expresiones regulares o pruebas para ver si una entrada parece un número, un email, etc.
* **Comprobando existencia de archivos/directorios:** Si el script necesita un archivo, verificar si existe y si tenemos permisos sobre él.
* **Validando formatos específicos:** Por ejemplo, si se espera una fecha en un formato particular.

Implementar la validación de entrada es una práctica fundamental para escribir scripts fiables y seguros, que puedan manejar tanto entradas correctas como inesperadas sin problemas.
''',
    'code_example': r'''
# Validación de entrada en scripts Bash

# Ejemplo de script de validación de entrada:
# Guarda esto como 'validar_entrada.sh' y dale permisos de ejecución (chmod +x validar_entrada.sh)

#!/bin/bash

# 1. Validar el número de argumentos
if [ "$#" -ne 1 ]; then
  echo "Uso: $0 <nombre_de_archivo>"
  echo "Este script necesita exactamente un argumento: el nombre de un archivo."
  exit 1 # Salir con código de error
fi

ARCHIVO_A_PROCESAR="$1"

# 2. Validar si el argumento es un archivo existente
if [ ! -f "$ARCHIVO_A_PROCESAR" ]; then
  echo "Error: El archivo '$ARCHIVO_A_PROCESAR' no existe."
  exit 2
fi

# 3. Validar si el archivo es legible
if [ ! -r "$ARCHIVO_A_PROCESAR" ]; then
  echo "Error: No tengo permisos de lectura para '$ARCHIVO_A_PROCESAR'."
  exit 3
fi

# 4. Validar un patrón (ejemplo, si el archivo tiene extensión .log)
if [[ ! "$ARCHIVO_A_PROCESAR" =~ \\.log$ ]]; then
  echo "Advertencia: El archivo '$ARCHIVO_A_PROCESAR' no parece ser un archivo de log (.log)."
  # No salimos, solo es una advertencia
fi

echo "Validación exitosa: '$ARCHIVO_A_PROCESAR' es un archivo válido y legible."
# Aquí iría la lógica principal del script con el archivo validado.

# --- Ejemplo de uso y posibles errores ---
# Correcto:
# bash validar_entrada.sh mi_log.log

# Incorrecto (argumentos insuficientes):
# bash validar_entrada.sh

# Incorrecto (archivo no existente):
# bash validar_entrada.sh archivo_que_no_existe.txt

# Incorrecto (sin permisos de lectura):
# touch solo_escritura.txt && chmod -r solo_escritura.txt
# bash validar_entrada.sh solo_escritura.txt

# Errores comunes:
# - No verificar el número de argumentos.
# - No comprobar la existencia o los permisos de archivos/directorios.
# - Olvidar las comillas dobles alrededor de las variables al hacer pruebas (ej. [ -f $ARCHIVO ] podría fallar si $ARCHIVO tiene espacios).
# - No salir del script con un código de error significativo después de una validación fallida.
'''
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Shell Scripting Básico',
    'topic': 'Scripts Prácticos',
    'subtopic': 'Manejo de errores',
    'definition': r'''
Incluso los scripts más cuidadosamente diseñados pueden encontrarse con problemas: un archivo que no existe, un comando que falla, una red que se cae. El "manejo de errores" es la estrategia que usamos para que nuestros scripts puedan identificar estos problemas y reaccionar de manera controlada, en lugar de simplemente fallar y dejar un desorden.

¿Te estás preguntando por qué esto es tan vital? 

Pensemos por un momento en la resiliencia. Un script sin manejo de errores es como un coche sin frenos; tarde o temprano, chocará. Un script robusto no solo hace su trabajo, sino que también sabe qué hacer cuando las cosas no salen según lo planeado: puede informar el problema, limpiar lo que hizo, intentar otra vez o simplemente detenerse de forma elegante.

En Bash, el manejo de errores se basa principalmente en los códigos de salida de los comandos:
* `$?`: Esta variable especial contiene el código de salida del último comando ejecutado. Un valor de `0` generalmente indica éxito, mientras que cualquier otro valor (típicamente de `1` a `255`) indica algún tipo de error.
* `set -e`: Esta opción es un salvavidas. Si la incluyes al principio de tu script, Bash saldrá inmediatamente del script si cualquier comando falla (es decir, si su código de salida no es 0). Es una forma sencilla de evitar que un script siga ejecutándose y cause más problemas después de un error crítico.
* `trap`: Este comando nos permite definir acciones a tomar cuando se recibe una señal (como `EXIT` cuando el script termina, `ERR` cuando un comando falla, o `INT` cuando el usuario presiona `Ctrl+C`). Es útil para realizar limpiezas, enviar notificaciones o gestionar situaciones específicas.

Implementar un buen manejo de errores no solo hace que tus scripts sean más fiables, sino que también te facilita la depuración y te da tranquilidad al automatizar tareas críticas.
''',
    'code_example': r'''
# Manejo de errores en scripts Bash

# Ejemplo de script con manejo de errores:
# Guarda esto como 'manejo_errores.sh' y dale permisos de ejecución (chmod +x manejo_errores.sh)

#!/bin/bash

# --- 1. Usar 'set -e' para salir en caso de error ---
# Si algún comando falla, el script se detendrá inmediatamente.
set -e

# --- 2. Usar 'trap' para limpieza o mensajes al salir ---
cleanup() {
  echo "Limpiando archivos temporales..."
  rm -f /tmp/mi_archivo_temp.txt
  echo "Proceso finalizado (o con error)."
}

# Ejecutar la función cleanup cuando el script termine (exit) o se reciba una señal de error (ERR)
trap cleanup EXIT
trap 'echo "¡Error inesperado! Revisar el log."; exit 1' ERR

echo "Iniciando script..."

# Crear un archivo temporal
touch /tmp/mi_archivo_temp.txt
echo "Archivo temporal creado."

# Simular una operación que puede fallar (ej. copiar un archivo inexistente)
echo "Intentando copiar un archivo..."
cp /ruta/a/archivo_inexistente.txt /tmp/destino.txt || {
  echo "Error: No se pudo copiar el archivo. Abortando."
  exit 1 # Salir con un código de error específico
}

echo "Archivo copiado exitosamente."

# Simular otra operación
echo "Realizando otra tarea..."
ls -l /tmp
echo "Tarea completada."

# Si llegamos aquí, todo salió bien.
echo "Script finalizado con éxito."

# --- Pruebas y Errores comunes ---

# Para probar el trap de ERR o set -e:
# 1. Comenta la línea `cp ... || { ... }` y ejecuta el script: `bash manejo_errores.sh`
#    Verás que el script se detiene y llama al `trap ERR`.

# 2. Sin 'set -e', el script podría continuar incluso después de un error.
#    Comenta `set -e` y ejecuta el script con el `cp` fallido. Verás que sigue
#    ejecutando "Realizando otra tarea..." aunque el paso anterior falló.
#    Siempre es buena práctica usar `set -e` a menos que se manejen errores explícitamente.

# Errores comunes:
# - No verificar el código de salida ($?) de los comandos críticos.
# - No usar `set -e` para abortar el script en caso de errores inesperados.
# - Olvidar limpiar recursos temporales o dejar el sistema en un estado inconsistente tras un fallo.
# - No proporcionar mensajes de error claros al usuario.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Shell Scripting Básico',
    'topic': 'Herramientas de Procesamiento',
    'subtopic': 'awk básico',
    'definition': '''
`awk` es una herramienta de procesamiento de texto increíblemente potente y flexible en Linux. Piensa en ella como un pequeño lenguaje de programación especializado en escanear archivos, línea por línea, y realizar acciones basadas en patrones. Es especialmente útil para analizar y manipular datos estructurados, como logs, archivos CSV o cualquier tipo de texto donde los campos están delimitados.

¿Te estás preguntando por qué esto es tan relevante? 

Pensemos por un momento en su utilidad. Imagina que tienes un archivo de log gigante y solo te interesan las líneas que contienen la palabra "ERROR" y quieres extraer el tercer y quinto campo de esas líneas. Con comandos básicos de `grep` y `cut` podría ser un poco enrevesado, pero `awk` lo hace de forma elegante y concisa. `awk` funciona leyendo cada línea, dividiéndola en "campos" (por defecto, por espacios), y luego aplicando reglas (patrones y acciones) que tú defines. Puedes filtrar líneas, reformatear la salida, realizar cálculos e incluso generar informes. Es una herramienta esencial para cualquier persona que trabaje regularmente con archivos de texto y necesite hacer algo más que una simple búsqueda o extracción.
''',
    'code_example': r'''
# awk básico

# Crear un archivo de ejemplo para las demostraciones
# echo "Nombre Edad Ciudad" > datos.txt
# echo "Juan 30 Madrid" >> datos.txt
# echo "Maria 25 Barcelona" >> datos.txt
# echo "Pedro 35 Valencia" >> datos.txt

# 1. Imprimir todas las líneas:
awk '{print}' datos.txt
# Salida: (Contenido completo del archivo)
# Nombre Edad Ciudad
# Juan 30 Madrid
# Maria 25 Barcelona
# Pedro 35 Valencia

# 2. Imprimir el primer y tercer campo de cada línea:
awk '{print $1, $3}' datos.txt
# Salida:
# Nombre Ciudad
# Juan Madrid
# Maria Barcelona
# Pedro Valencia

# 3. Imprimir líneas que contengan un patrón específico:
awk '/Maria/ {print}' datos.txt
# Salida: Maria 25 Barcelona

# 4. Imprimir líneas donde el segundo campo (Edad) sea mayor que 28:
awk '$2 > 28 {print $1, $2}' datos.txt
# Salida:
# Nombre Edad
# Juan 30
# Pedro 35

# 5. Usar un delimitador de campo diferente (ej. coma para CSV):
# echo "item1,10,catA" > productos.csv
# echo "item2,20,catB" >> productos.csv
awk -F',' '{print $1, $3}' productos.csv
# Salida:
# item1 catA
# item2 catB
# -F: Especifica el delimitador de campo.

# 6. Ejecutar acciones antes (BEGIN) y después (END) de procesar el archivo:
awk 'BEGIN {print "--- Reporte de Datos ---"} {print $1} END {print "--- Fin del Reporte ---"}' datos.txt
# Salida:
# --- Reporte de Datos ---
# Nombre
# Juan
# Maria
# Pedro
# --- Fin del Reporte ---

# Un error común es olvidar las comillas simples alrededor del script de awk.
# Otro error es no entender que $0 se refiere a toda la línea, y $1, $2, etc., a los campos individuales.
'''
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Shell Scripting Básico',
    'topic': 'Herramientas de Procesamiento',
    'subtopic': 'sed básico',
    'definition': '''
`sed`, o Stream EDitor, es una herramienta de línea de comandos en Linux que se utiliza para filtrar y transformar texto. Su nombre lo dice todo: trabaja como un editor que opera sobre "flujos" de texto, línea por línea. Es especialmente potente para hacer sustituciones, eliminaciones o inserciones en archivos de texto de forma no interactiva.

¿Te estás preguntando por qué esto es tan útil? 

Pensemos por un momento en la manipulación masiva de texto. Imagina que necesitas cambiar una palabra específica en cientos de archivos de configuración, o eliminar líneas vacías de un log. Hacer esto manualmente sería una pesadilla. `sed` te permite definir reglas de transformación que aplica automáticamente. Su sintaxis básica es `sed 'comando' archivo`, donde el comando más común es la sustitución (`s/patron/reemplazo/modificadores`). Puedes usar expresiones regulares para patrones complejos, lo que lo hace increíblemente versátil para tareas de limpieza de datos, refactorización de código o cualquier cosa que implique buscar y modificar texto. `sed` es una herramienta fundamental en el arsenal de cualquier administrador de sistemas o desarrollador que trabaje con la terminal.
''',
    'code_example': r'''
# sed básico

# Crear un archivo de ejemplo para las demostraciones
# echo "Hola mundo" > texto.txt
# echo "Linea dos del mundo" >> texto.txt
# echo "Otro hola mundo mas" >> texto.txt
# echo "" >> texto.txt # Linea vacia
# echo "Fin." >> texto.txt

# 1. Sustituir 'mundo' por 'Linux' en cada línea (solo la primera ocurrencia por línea):
sed 's/mundo/Linux/' texto.txt
# Salida:
# Hola Linux
# Linea dos del Linux
# Otro hola Linux mas
#
# Fin.

# 2. Sustituir 'mundo' por 'Linux' globalmente en cada línea (todas las ocurrencias):
sed 's/mundo/Linux/g' texto.txt
# (Si una línea tuviera "mundo mundo", ambas se cambiarían)

# 3. Eliminar líneas que contengan la palabra 'Linea':
sed '/Linea/d' texto.txt
# Salida:
# Hola mundo
# Otro hola mundo mas
#
# Fin.

# 4. Eliminar líneas vacías:
sed '/^$/d' texto.txt
# Salida: (La línea vacía del ejemplo.txt se elimina)
# Hola mundo
# Linea dos del mundo
# Otro hola mundo mas
# Fin.

# 5. Insertar una línea antes de la primera línea:
sed '1i Esto es una nueva primera línea.' texto.txt
# Salida:
# Esto es una nueva primera línea.
# Hola mundo
# ... (resto del archivo)

# 6. Reemplazar una línea específica (ej. la línea 2):
sed '2c Esta es la nueva línea dos.' texto.txt
# Salida:
# Hola mundo
# Esta es la nueva línea dos.
# Otro hola mundo mas
# ...

# 7. Sustitución in-place (modificar el archivo original, ¡usar con precaución!):
# sed -i 's/mundo/PLANETA/g' texto.txt
# Este comando modificaría 'texto.txt' directamente.

# Errores comunes:
# - Olvidar las comillas simples alrededor del script de sed.
# - No usar el modificador 'g' si se quieren reemplazar todas las ocurrencias en una línea.
# - Confundir 'd' (delete) con 's' (substitute).
# - Usar `-i` sin una copia de seguridad o sin entender que modifica el archivo original.
'''
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Shell Scripting Básico',
    'topic': 'Herramientas de Procesamiento',
    'subtopic': 'cut, sort, uniq',
    'definition': '''
Cuando trabajamos con datos en la línea de comandos, a menudo necesitamos "cortar", "ordenar" o "filtrar" información. `cut`, `sort` y `uniq` son tres herramientas clásicas de Linux que, combinadas, son increíblemente poderosas para manipular datos tabulares o listados.

¿Te estás preguntando por qué esto es tan útil? 

Pensemos por un momento en la limpieza de datos. Imagina que tienes un archivo CSV y solo necesitas la segunda columna, o un log donde quieres ver las entradas únicas ordenadas por fecha. Estas herramientas hacen ese tipo de trabajo de forma eficiente.

* `cut`: Como su nombre indica, te permite "cortar" secciones de cada línea de un archivo. Puedes especificar qué delimitador usar (espacios, comas, etc.) y qué campos (columnas) o caracteres quieres extraer. Es perfecto para extraer columnas específicas de datos estructurados.
* `sort`: Esta herramienta hace exactamente lo que esperas: ordena las líneas de un archivo de texto. Puedes ordenar alfabéticamente, numéricamente, en orden inverso, o incluso por una columna específica. Es indispensable para organizar datos y facilitar su análisis.
* `uniq`: Se usa para eliminar líneas duplicadas de un archivo de texto. Es importante recordar que `uniq` solo detecta y elimina líneas duplicadas *consecutivas*, por lo que a menudo se usa después de un `sort`. Puedes usarlo para contar ocurrencias de líneas únicas o simplemente para obtener una lista sin repeticiones.

Estas tres herramientas, a menudo utilizadas en conjunto y encadenadas con pipes, forman la base de muchas operaciones de procesamiento de texto en la línea de comandos, permitiéndote transformar datos brutos en información útil de manera rápida y eficiente.
''',
    'code_example': '''
# cut, sort, uniq

# Crear un archivo de ejemplo para las demostraciones
# echo "manzana,rojo,5" > frutas.csv
# echo "pera,verde,3" >> frutas.csv
# echo "manzana,rojo,5" >> frutas.csv # Duplicado
# echo "platano,amarillo,8" >> frutas.csv
# echo "uva,morado,2" >> frutas.csv
# echo "pera,verde,3" >> frutas.csv # Otro duplicado

# --- Usando cut ---

# 1. Extraer el primer campo (nombre de la fruta) usando ',' como delimitador:
cut -d',' -f1 frutas.csv
# Salida:
# manzana
# pera
# manzana
# platano
# uva
# pera
# -d: delimitador, -f: campo

# 2. Extraer el segundo y tercer campo:
cut -d',' -f2,3 frutas.csv
# Salida:
# rojo,5
# verde,3
# rojo,5
# amarillo,8
# morado,2
# verde,3

# --- Usando sort ---

# 3. Ordenar el archivo alfabéticamente (por defecto):
sort frutas.csv
# Salida:
# manzana,rojo,5
# manzana,rojo,5
# pera,verde,3
# pera,verde,3
# platano,amarillo,8
# uva,morado,2

# 4. Ordenar numéricamente por el tercer campo (la cantidad):
sort -t',' -k3n frutas.csv
# Salida:
# uva,morado,2
# pera,verde,3
# pera,verde,3
# manzana,rojo,5
# manzana,rojo,5
# platano,amarillo,8
# -t: delimitador, -k: clave de ordenación, n: numérico

# --- Usando uniq ---

# 5. Eliminar líneas duplicadas (solo si son consecutivas):
sort frutas.csv | uniq
# Salida:
# manzana,rojo,5
# pera,verde,3
# platano,amarillo,8
# uva,morado,2
# (Nota: 'uniq' por sí solo no eliminaría los duplicados si no están juntos.)

# 6. Contar ocurrencias de líneas únicas:
sort frutas.csv | uniq -c
# Salida:
#       2 manzana,rojo,5
#       2 pera,verde,3
#       1 platano,amarillo,8
#       1 uva,morado,2

# Errores comunes:
# - No usar `sort` antes de `uniq` si quieres eliminar todas las líneas duplicadas, no solo las consecutivas.
# - Olvidar especificar el delimitador correcto (`-d`) para `cut`.
# - Intentar ordenar numéricamente sin el modificador `-n` en `sort`, lo que llevaría a un orden alfabético.
'''
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Shell Scripting Básico',
    'topic': 'Herramientas de Procesamiento',
    'subtopic': 'xargs y paralelización básica',
    'definition': '''
Cuando tienes una lista de elementos (archivos, nombres, resultados de comandos) y quieres ejecutar un comando sobre cada uno de ellos, `xargs` es tu mejor amigo en Bash. Es una herramienta que toma elementos de la entrada estándar y los pasa como argumentos a otro comando. Además, `xargs` tiene una capacidad de paralelización básica que puede acelerar significativamente tareas que involucran muchos elementos.

¿Te estás preguntando por qué esto es tan práctico? 

Pensemos por un momento en la eficiencia en escala. Imagina que tienes una lista de miles de archivos y quieres comprimir cada uno de ellos, o eliminar una serie de directorios. Si intentas pasar todos los nombres de archivo directamente a un comando como `rm` o `gzip`, podrías encontrarte con un límite de longitud de línea de comandos. `xargs` resuelve este problema dividiendo la lista en bloques más pequeños y ejecutando el comando para cada bloque, o incluso en paralelo. Es especialmente útil cuando combinas `find` (para encontrar elementos) con `xargs` (para procesarlos). La paralelización básica con la opción `-P` puede transformar una tarea que tardaría horas en una que se complete en minutos, aprovechando los múltiples núcleos de tu procesador.
''',
    'code_example': r'''
# xargs y paralelización básica

# Crear algunos archivos de ejemplo
# touch archivo1.txt archivo2.log archivo3.zip otro_archivo.txt

# 1. Pasar cada archivo encontrado por 'find' a 'rm':
# find . -name "*.txt" | xargs rm
# Esto encontraría todos los archivos .txt y los eliminaría usando rm.

# 2. Copiar archivos a un nuevo directorio:
# mkdir -p destino_xargs
# ls *.txt | xargs -I {} cp {} destino_xargs/
# -I {}: 'replace-string', reemplaza '{}' con cada elemento de la entrada.
# cp archivo1.txt destino_xargs/archivo1.txt
# cp archivo2.txt destino_xargs/archivo2.txt
# ...

# 3. Ejecutar un comando para cada línea de un archivo (con confirmación):
# echo "archivo_a_eliminar.txt" > lista_archivos.txt
# echo "otro_mas.log" >> lista_archivos.txt
# cat lista_archivos.txt | xargs -p rm
# -p: 'prompt', pide confirmación antes de cada ejecución.

# 4. Paralelización básica: Ejecutar comandos en paralelo.
# Imagina que tienes 100 imágenes y quieres redimensionarlas con 'convert' (ImageMagick).
# En lugar de una a una, puedes procesar 4 a la vez (si tienes 4 núcleos).
# find . -name "*.jpg" | xargs -P 4 -I {} convert {} -resize 50% {}-mini.jpg
# -P 4: Ejecutar 4 procesos en paralelo.

# 5. Ejecutar un script para cada directorio encontrado:
# mkdir dir1 dir2 dir3
# echo '#!/bin/bash' > mi_script_procesador.sh
# echo 'echo "Procesando directorio: $1"' >> mi_script_procesador.sh
# chmod +x mi_script_procesador.sh
# find . -type d -name "dir*" | xargs -I {} ./mi_script_procesador.sh {}
# Esto ejecutaría mi_script_procesador.sh para dir1, dir2 y dir3.

# Errores comunes:
# - Olvidar `xargs` y pasar una lista de archivos demasiado larga a un comando, causando un error de "Argument list too long".
# - No usar `-I {}` cuando el comando al que pasas los argumentos necesita el argumento en una posición específica (ej. `cp {} destino/`).
# - Abusar de la paralelización (`-P`) sin considerar los recursos del sistema (CPU, RAM, I/O).
'''
  });
}

Future<void> insertJrLevel4DataLinux(Database db) async {
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Administración Básica del Sistema',
    'topic': 'Gestión de Discos',
    'subtopic': 'Particionamiento (fdisk, parted)',
    'definition': '''
La gestión de discos es una de las tareas fundamentales en cualquier sistema operativo, y en Linux, tienes herramientas poderosas para ello. El "particionamiento" es el proceso de dividir un disco duro en secciones lógicas, llamadas particiones. Piensa en tu disco duro como una gran parcela de tierra, y las particiones son como dividir esa parcela en diferentes campos para diferentes propósitos (uno para el sistema operativo, otro para tus datos, etc.).

¿Te estás preguntando por qué esto es tan importante? 

Pensemos por un momento en la organización y la flexibilidad. Particionar te permite, por ejemplo, tener diferentes sistemas de archivos en la misma unidad física, o aislar el sistema operativo de tus datos para que una reinstalación no borre todo. Dos de las herramientas más comunes para esta tarea son `fdisk` y `parted`:

* `fdisk`: Es una herramienta más antigua y tradicional, ideal para trabajar con tablas de particiones MBR (Master Boot Record). Es interactiva y orientada a la línea de comandos, lo que la hace muy potente para tareas de particionamiento rápido, pero requiere un poco de cuidado al usarla, ya que los cambios se guardan al final.
* `parted`: Esta herramienta es más moderna y versátil, capaz de trabajar con tablas de particiones MBR y GPT (GUID Partition Table), que son esenciales para discos grandes (más de 2TB). `parted` permite realizar operaciones de particionamiento sobre la marcha (aunque siempre con precaución), y es una excelente opción para discos modernos y esquemas de particionamiento más complejos.

Dominar estas herramientas es crucial para configurar tu almacenamiento de manera eficiente, sea para un servidor o una estación de trabajo, permitiendo una mejor organización y resiliencia de tus datos.
''',
    'code_example': '''
# Particionamiento de discos en Linux: fdisk y parted

# --- Usando fdisk (para MBR, discos de hasta 2TB) ---

# ¡ADVERTENCIA! Las operaciones con fdisk pueden borrar datos si no se hacen con cuidado.
# Siempre trabaja en un disco que no contenga datos importantes o en una máquina virtual.

# 1. Listar los discos disponibles:
sudo fdisk -l
# Esto te mostrará algo como /dev/sda, /dev/sdb, etc.

# 2. Iniciar fdisk en un disco (ej. /dev/sdb, un disco vacío o de prueba):
# sudo fdisk /dev/sdb
# Comandos interactivos dentro de fdisk:
#   p: imprimir la tabla de particiones actual
#   n: crear una nueva partición
#   d: borrar una partición
#   w: escribir los cambios al disco (¡guardar y salir!)
#   q: salir sin guardar los cambios

# 3. Ejemplo rápido de creación de partición (NO EJECUTAR SIN ENTENDER):
# sudo fdisk /dev/sdb
#   n (nueva partición)
#   p (primaria)
#   1 (número de partición)
#   [Enter] (primer sector por defecto)
#   +5G (tamaño de 5 Gigabytes)
#   w (escribir cambios y salir)

# --- Usando parted (para MBR y GPT, discos grandes) ---

# 4. Iniciar parted en un disco (ej. /dev/sdb):
# sudo parted /dev/sdb
# Comandos interactivos dentro de parted:
#   print: mostrar la tabla de particiones actual
#   mklabel gpt/msdos: crear una nueva tabla de particiones (GPT o MBR)
#   mkpart: crear una nueva partición
#   rm: eliminar una partición
#   quit: salir

# 5. Ejemplo rápido de creación de partición GPT (NO EJECUTAR SIN ENTENDER):
# sudo parted /dev/sdb
#   mklabel gpt (crear tabla de particiones GPT)
#   mkpart primary ext4 0% 100% (crear una partición primaria, tipo ext4, que ocupe todo el disco)
#   print (ver la nueva tabla)
#   quit (salir)

# Errores comunes:
# - No respaldar datos antes de particionar.
# - Elegir el disco equivocado para particionar (¡muy peligroso!).
# - Olvidar escribir los cambios (`w` en fdisk, o no confirmar en parted).
# - No entender la diferencia entre MBR y GPT, especialmente con discos de más de 2TB.
'''
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Administración Básica del Sistema',
    'topic': 'Gestión de Discos',
    'subtopic': 'Sistemas de archivos (mkfs, mount)',
    'definition': '''
Una vez que has particionado tu disco duro, la siguiente pieza del rompecabezas es preparar esas particiones para que puedan almacenar datos. Aquí es donde entran en juego los "sistemas de archivos" y los comandos `mkfs` y `mount`. Un sistema de archivos es la estructura que organiza cómo se guardan y recuperan los datos en una partición, incluyendo nombres de archivos, permisos, directorios y más. Sin un sistema de archivos, una partición es solo un espacio en blanco sin sentido para el sistema operativo.

¿Te estás preguntando por qué esto es tan fundamental? 

Pensemos por un momento en la accesibilidad de los datos. Sin un sistema de archivos, el sistema Linux no puede leer ni escribir en una partición. Y sin `mount`, esa partición, incluso con su sistema de archivos, es inaccesible.

* `mkfs` (make filesystem): Este comando se utiliza para crear un sistema de archivos en una partición. Hay varios tipos de sistemas de archivos (ext4, XFS, Btrfs, FAT32, NTFS, etc.), y `mkfs` te permite elegir cuál quieres usar. Por ejemplo, `mkfs.ext4` crearía un sistema de archivos ext4. Es el paso que transforma el espacio crudo en un lugar organizado para tus archivos.
* `mount`: Una vez que una partición tiene un sistema de archivos, necesitas "montarla" para que Linux la vea y pueda acceder a ella. Montar significa conectar la partición a un punto específico en el árbol de directorios de Linux (el "punto de montaje"). Por ejemplo, podrías montar una partición en `/mnt/datos` o `/home/usuario/documentos`. Una vez montada, puedes interactuar con ella como si fuera cualquier otro directorio en tu sistema.

Entender `mkfs` y `mount` es esencial para que tus nuevas particiones y discos estén realmente listos para ser utilizados por el sistema operativo y por ti.
''',
    'code_example': '''
# Sistemas de archivos y montaje en Linux: mkfs y mount

# ¡ADVERTENCIA! Estos comandos formatean particiones y pueden borrar datos.
# Asegúrate de usar una partición de prueba (ej. /dev/sdb1) que no contenga datos importantes.

# Asumiendo que ya tienes una partición creada (ej. /dev/sdb1)

# --- Usando mkfs ---

# 1. Crear un sistema de archivos ext4 en la partición /dev/sdb1:
sudo mkfs.ext4 /dev/sdb1
# Esto formatea la partición con el sistema de archivos ext4.
# Para otros sistemas de archivos: mkfs.xfs, mkfs.btrfs, etc.

# 2. Confirmar la creación del sistema de archivos (opcional, pero útil):
# Puedes usar 'blkid' para ver información sobre sistemas de archivos y UUIDs
sudo blkid /dev/sdb1

# --- Usando mount ---

# 3. Crear un punto de montaje (un directorio donde la partición será visible):
sudo mkdir /mnt/mi_disco_nuevo

# 4. Montar la partición /dev/sdb1 en el punto de montaje:
sudo mount /dev/sdb1 /mnt/mi_disco_nuevo
# Ahora puedes acceder a los archivos de esa partición en /mnt/mi_disco_nuevo

# 5. Verificar que la partición esté montada:
df -hT | grep /mnt/mi_disco_nuevo
# Salida esperada: /dev/sdb1 ext4 ... /mnt/mi_disco_nuevo

# 6. Desmontar la partición cuando ya no la necesites (¡importante antes de retirarla!):
sudo umount /mnt/mi_disco_nuevo
# No puedes desmontar una partición si hay programas o usuarios accediendo a ella.
# Si está en uso, puedes intentar `sudo fuser -m /mnt/mi_disco_nuevo` para ver qué proceso la usa.

# 7. Montaje persistente (para que la partición se monte automáticamente al inicio):
# Edita el archivo /etc/fstab (¡con mucho cuidado!)
# sudo nano /etc/fstab
# Añade una línea como esta (reemplaza UUID o /dev/sdb1 con tu partición real):
# UUID=tu_uuid_aqui /mnt/mi_disco_nuevo ext4 defaults 0 2
# o
# /dev/sdb1 /mnt/mi_disco_nuevo ext4 defaults 0 2
# Luego, puedes probar si fstab es correcto con: sudo mount -a

# Errores comunes:
# - Intentar montar una partición sin un sistema de archivos creado.
# - Intentar montar una partición en un directorio que ya tiene contenido (el contenido original se ocultaría).
# - Olvidar desmontar una partición antes de intentar formatearla o retirarla físicamente.
# - Errores en /etc/fstab que pueden impedir que el sistema arranque.
'''
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Administración Básica del Sistema',
    'topic': 'Gestión de Discos',
    'subtopic': 'Espacio en disco (df, du)',
    'definition': '''
Una parte crucial de la administración de sistemas es saber cuánto espacio tienes disponible y dónde se está usando. No sé tú, pero a mí me ha pasado más de una vez que el disco duro se llena misteriosamente. Aquí es donde entran en juego `df` y `du`, las herramientas esenciales para monitorear el espacio en disco en Linux.

¿Te estás preguntando por qué esto es tan importante? 

Pensemos por un momento en la estabilidad del sistema. Un disco lleno puede causar todo tipo de problemas, desde fallos en las aplicaciones hasta la imposibilidad de guardar archivos o actualizar el sistema. `df` y `du` te dan la visibilidad que necesitas para prevenir estos problemas o para depurarlos cuando ocurren.

* `df` (disk free): Este comando te muestra el espacio libre y usado en los sistemas de archivos montados. Es ideal para obtener una visión general rápida del estado de tus particiones. Te dirá cuánto espacio total tienen, cuánto está usado, cuánto está disponible y el porcentaje de uso para cada partición.
* `du` (disk usage): A diferencia de `df`, `du` se enfoca en el uso de espacio por archivos y directorios específicos. Es perfecto para encontrar "gorrones de espacio" dentro de un directorio particular, ayudándote a identificar qué carpetas o archivos son los más grandes y están consumiendo tu almacenamiento. Puedes usarlo para auditar el uso de espacio a nivel granular.

Combinar `df` para una vista macro y `du` para una vista micro es la clave para una gestión eficiente del espacio en disco, permitiéndote tomar decisiones informadas sobre dónde necesitas liberar espacio o expandir tu almacenamiento.
''',
    'code_example': '''
# Espacio en disco en Linux: df y du

# --- Usando df ---

# 1. Mostrar el espacio en disco de todos los sistemas de archivos montados (legible para humanos):
df -h
# Salida típica:
# Filesystem      Size  Used Avail Use% Mounted on
# /dev/sda1        20G  5.0G   14G  27% /
# tmpfs           1.9G     0  1.9G   0% /dev/shm
# /dev/sdb1       100G   20G   80G  20% /mnt/datos

# 2. Mostrar el espacio en disco con tipo de sistema de archivos:
df -hT

# 3. Mostrar el espacio en disco de un directorio específico (si está montado en su propia partición):
df -h /home

# --- Usando du ---

# 4. Mostrar el uso de disco de todos los archivos y subdirectorios en el directorio actual:
du -h .
# Salida: (listará el tamaño de cada archivo/directorio y el total del directorio actual)

# 5. Mostrar el uso total de disco de un directorio (resumen):
du -sh /var/log
# -s: summary (solo el total), -h: human-readable

# 6. Encontrar los 10 directorios más grandes en el directorio actual (útil para limpieza):
du -sh * | sort -rh | head -n 10
# Esto lista el tamaño de cada elemento, los ordena de mayor a menor y muestra los 10 primeros.

# 7. Mostrar el uso de disco de archivos de un tipo específico (ej. todos los .log):
du -h *.log

# Errores comunes:
# - Usar `du` sin `-h` para directorios grandes, lo que devuelve tamaños en bloques (poco legibles).
# - Confundir la salida de `df` (espacio en el sistema de archivos) con `du` (espacio ocupado por archivos/directorios).
# - Olvidar que `du` puede tardar mucho en directorios con millones de archivos.
'''
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Administración Básica del Sistema',
    'topic': 'Gestión de Discos',
    'subtopic': 'LVM básico',
    'definition': '''
Mientras que el particionamiento tradicional es útil, a veces necesitamos una forma más flexible de gestionar el almacenamiento, especialmente en entornos de servidores. Aquí es donde entra en juego LVM (Logical Volume Manager). LVM es una capa de abstracción que te permite gestionar el espacio en disco de una manera mucho más dinámica que las particiones fijas. Piensa en ello como una forma de agrupar tus discos físicos en un "pool" de almacenamiento grande, del cual puedes crear volúmenes lógicos de cualquier tamaño, y luego redimensionarlos o moverlos sin tener que reparticionar todo.

¿Te estás preguntando por qué esto es tan genial? 

Pensemos por un momento en la flexibilidad y la capacidad de crecimiento. Sin LVM, si te quedas sin espacio en una partición, tienes que redimensionarla (lo cual es complejo y riesgoso) o añadir otro disco y montar una nueva partición. Con LVM, puedes añadir más discos físicos a tu pool de almacenamiento en caliente y expandir tus volúmenes lógicos sin interrupciones.

Los componentes clave de LVM son:
* **Volúmenes Físicos (PV - Physical Volumes):** Son tus discos duros o particiones individuales que LVM utiliza.
* **Grupos de Volúmenes (VG - Volume Groups):** Es una agrupación de uno o más Volúmenes Físicos. Este es tu "pool" de almacenamiento del que se crean los volúmenes lógicos.
* **Volúmenes Lógicos (LV - Logical Volumes):** Son las particiones "virtuales" que creas dentro de un Grupo de Volúmenes. Son lo que montas y usas como si fueran particiones normales.

LVM te permite realizar operaciones como redimensionar volúmenes lógicos (expandir o reducir), crear instantáneas (snapshots) para copias de seguridad rápidas, o mover volúmenes lógicos entre diferentes Volúmenes Físicos, todo ello con una flexibilidad que el particionamiento tradicional no puede ofrecer. Es una herramienta indispensable para administradores de sistemas.
''',
    'code_example': r'''
# LVM básico (Logical Volume Manager)

# ¡ADVERTENCIA! Estos comandos modifican el almacenamiento.
# EJECUTA SÓLO EN MÁQUINAS VIRTUALES O DISCOS DE PRUEBA.

# Asumiendo que tienes dos discos virtuales nuevos: /dev/sdb y /dev/sdc

# --- 1. Crear Volúmenes Físicos (PV) ---
# Primero, asegúrate de que los discos no estén particionados o crea una partición completa.
# Por ejemplo, con parted:
# sudo parted /dev/sdb mklabel gpt
# sudo parted /dev/sdb mkpart primary 0% 100%
# sudo parted /dev/sdc mklabel gpt
# sudo parted /dev/sdc mkpart primary 0% 100%

# Luego, crea los Volúmenes Físicos:
sudo pvcreate /dev/sdb1
sudo pvcreate /dev/sdc1
# O si usas todo el disco directamente sin particionar:
# sudo pvcreate /dev/sdb
# sudo pvcreate /dev/sdc

# Verificar los PVs:
sudo pvs

# --- 2. Crear un Grupo de Volúmenes (VG) ---
# Agrupar los PVs en un VG llamado 'vg_datos':
sudo vgcreate vg_datos /dev/sdb1 /dev/sdc1

# Verificar los VGs:
sudo vgs

# --- 3. Crear un Volumen Lógico (LV) ---
# Crear un LV llamado 'lv_proyectos' de 10GB dentro de 'vg_datos':
sudo lvcreate -L 10G -n lv_proyectos vg_datos

# Crear un segundo LV llamado 'lv_usuarios' que use el espacio restante:
sudo lvcreate -l 100%FREE -n lv_usuarios vg_datos

# Verificar los LVs:
sudo lvs

# --- 4. Formatear y Montar los Volúmenes Lógicos ---
# Formatear el LV con un sistema de archivos (ej. ext4):
sudo mkfs.ext4 /dev/vg_datos/lv_proyectos
sudo mkfs.ext4 /dev/vg_datos/lv_usuarios

# Crear puntos de montaje:
sudo mkdir /mnt/proyectos_lvm
sudo mkdir /mnt/usuarios_lvm

# Montar los LVs:
sudo mount /dev/vg_datos/lv_proyectos /mnt/proyectos_lvm
sudo mount /dev/vg_datos/lv_usuarios /mnt/usuarios_lvm

# Verificar el montaje:
df -hT | grep lvm

# --- 5. Extender un Volumen Lógico (ej. lv_proyectos) ---
# Primero, extender el LV (ej. añadir 5GB más):
sudo lvextend -L +5G /dev/vg_datos/lv_proyectos

# Luego, redimensionar el sistema de archivos para que ocupe el nuevo espacio:
sudo resize2fs /dev/vg_datos/lv_proyectos
# Para XFS: sudo xfs_growfs /mnt/proyectos_lvm

# Errores comunes:
# - Intentar usar LVM en discos o particiones que ya contienen datos importantes sin respaldo.
# - Olvidar formatear el Volumen Lógico antes de montarlo.
# - No extender el sistema de archivos (`resize2fs` o `xfs_growfs`) después de extender el Volumen Lógico.
# - Confundir los nombres de PVs, VGs y LVs al operar con ellos.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Administración Básica del Sistema',
    'topic': 'Seguridad Básica',
    'subtopic': 'Firewall básico (ufw, iptables básico)',
    'definition': '''
Cuando hablamos de seguridad en Linux, lo primero que nos viene a la mente es el firewall. Piensa en el firewall como el guardián de tu red, una barrera que controla el tráfico que entra y sale de tu sistema. Decide qué conexiones están permitidas y cuáles no, basándose en un conjunto de reglas que tú defines.

¿Te estás preguntando por qué esto es tan crítico? 

Pensemos por un momento en la protección. Sin un firewall, tu sistema está expuesto a cualquier conexión no deseada, lo que podría llevar a ataques, intrusiones o uso indebido de recursos. Dos de las herramientas más usadas para configurar firewalls en Linux son `ufw` y `iptables`:

* `iptables`: Es el firewall nativo de Linux y el más potente, pero también el más complejo. Opera a bajo nivel, permitiéndote definir reglas muy granulares sobre qué paquetes de red se aceptan, se rechazan o se descartan. Su complejidad radica en que cada regla debe ser muy específica, y una configuración incorrecta puede bloquear el acceso a tu propio sistema. Los administradores de sistemas experimentados lo adoran por su flexibilidad, pero para principiantes, puede ser abrumador.
* `ufw` (Uncomplicated Firewall): Es una interfaz de usuario para `iptables` que, como su nombre indica, es mucho más sencilla de usar. Está diseñado para facilitar la configuración de un firewall básico y es ideal para usuarios que quieren proteger su sistema sin profundizar en la complejidad de `iptables`. `ufw` traduce tus comandos simples a reglas de `iptables` por ti, haciéndolo perfecto para estaciones de trabajo o servidores con necesidades de firewall menos complejas.

Dominar el firewall es la primera línea de defensa para cualquier sistema Linux, ya sea que elijas la simplicidad de `ufw` o el control granular de `iptables`.
''',
    'code_example': '''
# Firewall básico en Linux: ufw e iptables

# --- Usando ufw (Uncomplicated Firewall) ---
# ufw es generalmente la opción recomendada para la mayoría de usuarios y servidores.

# 1. Habilitar ufw (¡con cuidado, asegúrate de no bloquearte!):
sudo ufw enable
# Esto activará el firewall y bloqueará por defecto todas las conexiones entrantes (excepto las establecidas).

# 2. Permitir el tráfico SSH (¡esencial si estás en un servidor remoto!):
sudo ufw allow ssh
# O por puerto: sudo ufw allow 22

# 3. Permitir el tráfico HTTP (puerto 80) y HTTPS (puerto 443):
sudo ufw allow http
sudo ufw allow https
# O por puertos: sudo ufw allow 80/tcp
# sudo ufw allow 443/tcp

# 4. Denegar explícitamente un puerto (ej. 21 para FTP):
sudo ufw deny 21/tcp

# 5. Listar el estado de las reglas de ufw:
sudo ufw status verbose

# 6. Deshabilitar ufw (¡con precaución!):
# sudo ufw disable

# --- Usando iptables (para control más granular) ---
# iptables es más complejo. Para principiantes, ufw es más seguro.

# 7. Listar las reglas actuales de iptables:
sudo iptables -L -n -v
# -L: Listar, -n: no resolver nombres, -v: verboso

# 8. Permitir el tráfico SSH (ejemplo básico, NO PERSISTENTE por defecto):
# Esto inserta la regla al principio de la cadena INPUT.
# sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
# Para que sea persistente, necesitas instalar 'iptables-persistent' o un equivalente.

# 9. Bloquear una dirección IP específica:
# sudo iptables -A INPUT -s 192.168.1.100 -j DROP

# 10. Guardar las reglas de iptables (depende de la distribución):
# En Debian/Ubuntu: sudo netfilter-persistent save
# En CentOS/RHEL: sudo service iptables save (si usas service) o sudo firewall-cmd --runtime-to-permanent (si usas firewalld)

# 11. Eliminar todas las reglas (¡cuidado!):
# sudo iptables -F # Limpia todas las reglas de todas las cadenas
# sudo iptables -X # Borra cadenas vacías creadas por el usuario

# Errores comunes:
# - Bloquear el puerto SSH mientras estás conectado remotamente, lo que te dejará fuera.
# - No guardar las reglas de iptables (se perderán después de un reinicio).
# - Complicar demasiado las reglas de ufw/iptables, haciéndolas difíciles de depurar.
# - Olvidar permitir el tráfico de respuesta para conexiones salientes (ufw lo maneja automáticamente).
'''
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Administración Básica del Sistema',
    'topic': 'Seguridad Básica',
    'subtopic': 'SSH seguro (keys, config)',
    'definition': '''
SSH (Secure Shell) es la herramienta más común para conectarse de forma remota a servidores Linux. Es como un túnel seguro que te permite ejecutar comandos y transferir archivos de forma cifrada. Pero usar SSH de forma segura no es solo cuestión de tener una contraseña; las claves SSH y una configuración adecuada son la clave para proteger tus accesos.

¿Te estás preguntando por qué esto es tan importante? 

Pensemos por un momento en la integridad y la autenticación. Usar solo contraseñas para SSH es peligroso porque son vulnerables a ataques de fuerza bruta. Las claves SSH, en cambio, son pares de archivos (una clave pública y una privada) que proporcionan una autenticación mucho más fuerte y conveniente:

* **Autenticación con claves SSH:** En lugar de una contraseña, tú generas un par de claves. La clave pública se coloca en el servidor al que quieres conectarte, y la clave privada (que debe permanecer secreta y protegida en tu máquina local) se usa para autenticarte. Es como tener una cerradura y una llave únicas para cada servidor. Esto elimina la necesidad de contraseñas, haciendo los ataques de fuerza bruta inútiles y el acceso más rápido.
* **Configuración SSH (`~/.ssh/config`):** Este archivo es tu centro de control para todas tus conexiones SSH. Te permite definir alias para servidores, especificar rutas a tus claves privadas, configurar puertos alternativos, e incluso establecer opciones de conexión específicas para cada host. Organizar tus conexiones en este archivo no solo mejora la seguridad (al no tener que escribir tantos parámetros en la línea de comandos), sino que también te hace más eficiente.

Implementar la autenticación basada en claves y una buena configuración de SSH es una práctica fundamental que todo usuario y administrador de Linux debería adoptar para proteger sus accesos remotos.
''',
    'code_example': r'''
# SSH seguro: Claves SSH y configuración

# --- Generación de claves SSH ---

# 1. Generar un par de claves SSH (si no tienes uno).
# Se recomienda usar algoritmos fuertes como ED25519.
ssh-keygen -t ed25519 -C "tu_email@ejemplo.com"
# Te pedirá una ubicación (por defecto: ~/.ssh/id_ed25519) y una frase de contraseña (passphrase).
# ¡Usa una passphrase fuerte! Protege tu clave privada incluso si alguien la roba.
# Esto creará dos archivos: id_ed25519 (clave privada) y id_ed25519.pub (clave pública).

# 2. Copiar la clave pública al servidor remoto:
ssh-copy-id usuario@servidor_remoto
# Esto te pedirá la contraseña del usuario en el servidor, y luego copiará tu clave pública
# a ~/.ssh/authorized_keys en el servidor, habilitando el acceso por clave.

# Si ssh-copy-id no está disponible o quieres hacerlo manualmente:
# cat ~/.ssh/id_ed25519.pub | ssh usuario@servidor_remoto "mkdir -p ~/.ssh && chmod 700 ~/.ssh && cat >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"

# --- Configuración SSH (~/.ssh/config) ---

# 3. Crear o editar tu archivo de configuración SSH:
# nano ~/.ssh/config
# Asegúrate de que los permisos sean correctos: chmod 600 ~/.ssh/config

# 4. Ejemplo de configuración en ~/.ssh/config:

# Host mi_servidor_dev
#   HostName 192.168.1.100  # O la IP pública / dominio
#   User mi_usuario_remoto
#   Port 2222               # Si SSH está en un puerto no estándar
#   IdentityFile ~/.ssh/id_ed25519 # La ruta a tu clave privada
#   ForwardAgent yes        # Útil para saltos SSH

# Host servidor_web_produccion
#   HostName produccion.ejemplo.com
#   User admin_web
#   IdentityFile ~/.ssh/claves/prod_web_key
#   StrictHostKeyChecking no # NO RECOMENDADO en producción, solo para casos específicos/temporales

# 5. Conectarse usando la configuración:
ssh mi_servidor_dev
# Ya no necesitas especificar usuario, IP, puerto o clave; SSH los toma del config.

# 6. Deshabilitar la autenticación por contraseña en el servidor (¡después de configurar claves!):
# Esto se hace en el archivo /etc/ssh/sshd_config en el servidor remoto.
# Busca y cambia:
# PasswordAuthentication yes  a  PasswordAuthentication no
# Luego, reinicia el servicio SSH: sudo systemctl restart sshd (o sudo service ssh restart)
# ¡HAZ ESTO SOLO DESPUÉS DE PROBAR QUE LA AUTENTICACIÓN CON CLAVE FUNCIONA PERFECTAMENTE!

# Errores comunes:
# - No proteger la clave privada con una passphrase o mantenerla en una ubicación no segura.
# - Olvidar cambiar los permisos de los archivos de clave (`chmod 600 id_ed25519`, `chmod 644 id_ed25519.pub`).
# - Bloquearte del servidor al deshabilitar la autenticación por contraseña antes de verificar que la autenticación por clave funciona.
# - Escribir mal las rutas a las claves en el archivo `~/.ssh/config`.
'''
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Administración Básica del Sistema',
    'topic': 'Seguridad Básica',
    'subtopic': 'SELinux/AppArmor básico',
    'definition': '''
Más allá del firewall, que controla el tráfico de red, Linux tiene mecanismos de seguridad más profundos que controlan lo que los programas y procesos pueden hacer dentro del sistema. Aquí es donde entran en juego SELinux (Security-Enhanced Linux) y AppArmor: son sistemas de control de acceso obligatorio (MAC - Mandatory Access Control). A diferencia del control de acceso discrecional (DAC) estándar de Linux (basado en permisos rwx), donde un usuario puede dar permisos a sus propios archivos, MAC impone políticas de seguridad que el propio usuario root no puede anular fácilmente.

¿Te estás preguntando por qué esto es tan relevante? 

Pensemos por un momento en la contención de daños. Si un atacante logra comprometer un servicio (como un servidor web o un servidor DNS), SELinux o AppArmor pueden limitar el daño al restringir lo que ese servicio puede hacer en el sistema. Incluso si el atacante obtiene privilegios de root dentro de ese servicio, no podrá acceder a archivos o ejecutar comandos que la política de MAC le prohíba.

* **SELinux:** Desarrollado por la NSA y mantenido por la comunidad Red Hat, es extremadamente potente y granular. Define una política de seguridad muy detallada para cada proceso y recurso (archivos, sockets, etc.). Es complejo de configurar y depurar, y una política incorrecta puede hacer que los servicios dejen de funcionar. Sin embargo, su capacidad de control es inigualable.
* **AppArmor:** Desarrollado por Canonical (Ubuntu), es más simple y fácil de usar que SELinux. En lugar de una política global para todo el sistema, AppArmor funciona con "perfiles" que se aplican a programas individuales, definiendo sus capacidades (a qué archivos pueden acceder, qué red pueden usar, etc.). Es menos granular que SELinux, pero mucho más amigable para empezar y depurar.

Ambas herramientas son una segunda línea de defensa fundamental para proteger tu sistema Linux, mitigando el impacto de posibles vulnerabilidades y atacantes. Elegir entre una u otra a menudo depende de la distribución de Linux que estés usando (Red Hat/CentOS favorece SELinux, Ubuntu/Debian favorece AppArmor).
''',
    'code_example': '''
# SELinux/AppArmor básico

# --- SELinux básico (principalmente en Red Hat/CentOS/Fedora) ---

# 1. Verificar el estado de SELinux:
sestatus
# Salida: Enabled, Permissive, Disabled.
#   - Enforcing: SELinux aplica las políticas. Los errores se deniegan.
#   - Permissive: SELinux advierte sobre violaciones, pero no las deniega (bueno para depurar).
#   - Disabled: SELinux está desactivado (no recomendado en producción).

# 2. Cambiar el modo de SELinux a Permissive (temporalmente, para depurar):
sudo setenforce 0
# Para cambiar a Enforcing: sudo setenforce 1

# 3. Listar el contexto de seguridad de un archivo/directorio:
ls -Z /var/www/html
# Esto te muestra etiquetas como 'unconfined_u:object_r:httpd_sys_content_t:s0'

# 4. Cambiar el contexto de seguridad de un archivo (ejemplo, para un servidor web):
# Si subes archivos web a un lugar que SELinux no espera, podrías necesitar esto:
# sudo semanage fcontext -a -t httpd_sys_content_t "/var/www/html/mi_app(/.*)?"
# sudo restorecon -Rv /var/www/html/mi_app
# Esto es complejo y requiere entender los tipos de contexto.

# 5. Ver mensajes de denegación de SELinux (cuando algo no funciona):
# sudo tail -f /var/log/audit/audit.log | grep AVC
# O usar la herramienta audit2allow para generar reglas (avanzado):
# sudo apt-get install policycoreutils-python-utils (en Debian/Ubuntu)
# sudo dnf install policycoreutils-python-utils (en CentOS/Fedora)
# grep "denied" /var/log/audit/audit.log | audit2allow -M mypol
# sudo semodule -i mypol.pp

# --- AppArmor básico (principalmente en Ubuntu/Debian) ---

# 6. Verificar el estado de AppArmor:
sudo aa-status
# Salida: Te muestra los perfiles en modo 'enforce' (aplicando) o 'complain' (reportando, pero no denegando).

# 7. Listar los perfiles de AppArmor:
sudo find /etc/apparmor.d -type f

# 8. Poner un perfil en modo de cumplimiento (enforce):
sudo aa-enforce /etc/apparmor.d/usr.sbin.apache2
# Esto aplica el perfil estrictamente.

# 9. Poner un perfil en modo de queja (complain - bueno para depurar):
sudo aa-complain /etc/apparmor.d/usr.sbin.apache2
# Las violaciones se registran, pero no se bloquean.

# 10. Deshabilitar un perfil (¡cuidado!):
# sudo aa-disable /etc/apparmor.d/usr.sbin.apache2

# 11. Recargar todos los perfiles de AppArmor:
# sudo systemctl reload apparmor (o sudo service apparmor reload)

# Errores comunes:
# - Deshabilitar SELinux/AppArmor en lugar de aprender a gestionarlos, dejando el sistema vulnerable.
# - Olvidar poner SELinux en modo 'permissive' para depurar problemas, frustrándose por denegaciones.
# - No revisar los logs de auditoría cuando los servicios no funcionan como se espera (audit.log para SELinux, syslog/kern.log para AppArmor).
'''
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Administración Básica del Sistema',
    'topic': 'Seguridad Básica',
    'subtopic': 'Actualizaciones de seguridad',
    'definition': '''
Una de las prácticas de seguridad más básicas y a menudo subestimadas es mantener tu sistema Linux actualizado. Las "actualizaciones de seguridad" son parches y correcciones que los desarrolladores de software lanzan para cerrar vulnerabilidades descubiertas en el sistema operativo o en las aplicaciones que utilizas.

¿Te estás preguntando por qué esto es tan fundamental? 

Pensemos por un momento en la constante carrera armamentista. Los atacantes buscan activamente fallas en el software, y una vez que encuentran una, la explotan. Si tu sistema tiene software desactualizado, es como dejar una puerta abierta para que los intrusos entren. Las actualizaciones de seguridad no solo cierran esas puertas, sino que también pueden mejorar el rendimiento y añadir nuevas funcionalidades.

El proceso para actualizar tu sistema varía ligeramente según la distribución de Linux que uses, pero la idea principal es la misma:

* **Repositorios de software:** Linux obtiene su software de "repositorios", que son servidores que almacenan paquetes de software. Tu sistema los consulta para saber si hay versiones más nuevas disponibles.
* **Gestores de paquetes:** Herramientas como `apt` (en Debian/Ubuntu), `dnf` (en Fedora/RHEL/CentOS 8+) o `yum` (en CentOS 7 y anteriores) se encargan de interactuar con estos repositorios, descargar los paquetes actualizados y instalarlos en tu sistema.

Es una buena práctica configurar tus sistemas para que reciban notificaciones de actualizaciones o, mejor aún, para que las instalen automáticamente en un horario regular, especialmente en entornos de servidor donde la intervención manual puede ser limitada. Ignorar las actualizaciones de seguridad es una de las mayores vulnerabilidades que puedes introducir en cualquier sistema.
''',
    'code_example': '''
# Actualizaciones de seguridad en Linux

# --- En sistemas basados en Debian/Ubuntu (usando apt) ---

# 1. Actualizar la lista de paquetes disponibles (sincroniza con los repositorios):
sudo apt update
# Esto no instala nada, solo descarga la información más reciente sobre los paquetes.

# 2. Actualizar todos los paquetes instalados a sus últimas versiones:
sudo apt upgrade
# Esto actualiza los paquetes sin eliminar los paquetes que ya no son necesarios
# o instalar nuevos paquetes que no se han instalado con la versión actual.

# 3. Actualizar el sistema completamente (instala nuevas dependencias, elimina obsoletos):
sudo apt full-upgrade
# Esto es más completo que 'upgrade' y es recomendable para actualizaciones mayores.
# En algunos casos, 'dist-upgrade' es un alias para 'full-upgrade'.

# 4. Eliminar paquetes que ya no son necesarios (limpieza):
sudo apt autoremove
# Esto elimina dependencias que se instalaron automáticamente con otros paquetes
# y que ahora ya no son requeridas.

# --- En sistemas basados en Red Hat/CentOS/Fedora (usando dnf o yum) ---

# Para Fedora / CentOS 8+ (usando dnf):
# 5. Actualizar todos los paquetes:
sudo dnf update
# Para un 'full-upgrade' equivalente, 'dnf upgrade' es generalmente suficiente.

# 6. Limpiar paquetes huérfanos:
sudo dnf autoremove

# Para CentOS 7 y anteriores (usando yum):
# 7. Actualizar todos los paquetes:
# sudo yum update

# 8. Limpiar paquetes huérfanos:
# sudo yum autoremove

# --- Reinicio después de actualizaciones del kernel ---
# Si se actualiza el kernel (núcleo del sistema), es crucial reiniciar para que los cambios tengan efecto.
# Puedes verificar la versión del kernel antes y después:
uname -r
# Si el número cambia después de la actualización, reinicia:
# sudo reboot

# Errores comunes:
# - No reiniciar el sistema después de una actualización importante del kernel, lo que deja el sistema usando el kernel antiguo y vulnerable.
# - No hacer actualizaciones con regularidad, lo que acumula vulnerabilidades y hace que las actualizaciones futuras sean más complejas.
# - Ignorar los mensajes de advertencia durante el proceso de actualización.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Administración Básica del Sistema',
    'topic': 'Monitoreo Básico',
    'subtopic': 'Uso de recursos (top, vmstat, iostat)',
    'definition': '''
Saber qué está haciendo tu sistema y cómo está usando sus recursos es fundamental para cualquier administrador. El "monitoreo de recursos" te permite ver el rendimiento de tu CPU, memoria, disco y red, identificar cuellos de botella y asegurarte de que tu sistema funciona sin problemas.

¿Te estás preguntando por qué esto es tan crucial? 

Pensemos por un momento en la estabilidad y la resolución de problemas. Si un servicio se ralentiza o deja de responder, las herramientas de monitoreo son tu primera parada para diagnosticar qué está pasando. ¿Es la CPU al 100%? ¿Se agotó la memoria? ¿El disco está saturado? Tres herramientas clásicas para responder a estas preguntas son `top`, `vmstat` e `iostat`:

* `top`: Es la navaja suiza del monitoreo de procesos. Te muestra una vista en tiempo real de los procesos que más CPU y memoria están consumiendo, la carga del sistema, la memoria libre y más. Es excelente para tener una idea rápida de qué está ocurriendo en el momento.
* `vmstat`: Se enfoca en la actividad de la memoria virtual (virtual memory statistics). Te da información sobre el uso de CPU, memoria, paginación (swapping), y la actividad de E/S (entrada/salida) del disco. Es muy útil para identificar problemas de rendimiento relacionados con la memoria o el intercambio de datos entre RAM y disco.
* `iostat`: Como su nombre indica, se especializa en las estadísticas de entrada/salida (I/O) de los dispositivos de almacenamiento. Te muestra la actividad de los discos, incluyendo lecturas, escrituras y la utilización del disco. Es indispensable para diagnosticar problemas de rendimiento donde el disco es el cuello de botella.

Dominar estas herramientas te da la capacidad de diagnosticar rápidamente problemas de rendimiento y entender cómo tus aplicaciones interactúan con los recursos del sistema.
''',
    'code_example': '''
# Monitoreo de uso de recursos: top, vmstat, iostat

# --- Usando top (vista general de procesos y recursos) ---

# 1. Iniciar top:
top
# En la interfaz de top:
#   q: salir
#   k: matar un proceso (te pedirá el PID)
#   M: ordenar por uso de memoria
#   P: ordenar por uso de CPU (predeterminado)
#   1: mostrar estadísticas por cada núcleo de CPU

# --- Usando vmstat (estadísticas de memoria virtual, CPU y E/S) ---

# 2. Mostrar un informe de vmstat una vez:
vmstat
# Salida:
# procs ---memory---- ---swap-- -----io---- -system-- ----cpu----
# r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
# 1  0      0 123456 23456 345678    0    0     0     0  123  456  1  1 97  0  0
#   r: procesos en ejecución o esperando CPU, b: procesos bloqueados
#   swpd: memoria swap usada, free: memoria libre
#   si/so: swap in/out, bi/bo: blocks in/out (lecturas/escrituras de bloques)
#   us/sy/id/wa: % CPU user/system/idle/wait (esperando I/O)

# 3. Mostrar un informe cada 2 segundos, 5 veces:
vmstat 2 5

# --- Usando iostat (estadísticas de E/S de dispositivos) ---

# 4. Instalar iostat (parte del paquete 'sysstat'):
# En Debian/Ubuntu: sudo apt install sysstat
# En Red Hat/CentOS/Fedora: sudo dnf install sysstat (o sudo yum install sysstat)

# 5. Mostrar estadísticas de E/S para todos los dispositivos:
iostat
# Salida: Muestra estadísticas de CPU y luego de cada dispositivo de bloque (sda, sdb, etc.)
#   kB_read/s, kB_wrtn/s: Kilobytes leídos/escritos por segundo
#   %util: porcentaje de tiempo que el dispositivo estuvo ocupado con solicitudes de E/S.
#          Un %util cercano a 100% indica un cuello de botella en el disco.

# 6. Mostrar estadísticas de E/S cada 3 segundos, 4 veces, para un dispositivo específico:
iostat -d sda1 3 4
# -d: solo dispositivos, sda1: el dispositivo específico.

# Errores comunes:
# - No interpretar correctamente los valores de `top` (ej. confundir memoria cache con memoria libre).
# - Olvidar que `vmstat` y `iostat` necesitan ser ejecutados repetidamente para ver tendencias.
# - No instalar el paquete `sysstat` antes de intentar usar `iostat`.
# - No diferenciar entre problemas de CPU (alto `us`/`sy` en vmstat/top) y problemas de I/O (alto `wa` en vmstat, alto `%util` en iostat).
'''
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Administración Básica del Sistema',
    'topic': 'Monitoreo Básico',
    'subtopic': 'Logs básicos (journalctl)',
    'definition': '''
Los logs del sistema son como el diario de tu computadora: registran todo lo que sucede, desde el inicio del sistema y los errores de hardware hasta la actividad de las aplicaciones y los intentos de inicio de sesión. Entender cómo leer y buscar en estos logs es fundamental para diagnosticar problemas y mantener la seguridad de tu sistema.

¿Te estás preguntando por qué esto es tan vital? 

Pensemos por un momento en la depuración. Cuando algo sale mal, los logs son tu primera fuente de información para entender por qué. ¿Un servicio no arranca? El log te dirá el error. ¿Un usuario no puede iniciar sesión? El log puede mostrar si la contraseña es incorrecta o hay un problema de permisos. En sistemas Linux modernos (especialmente aquellos que usan `systemd`, que son la mayoría de las distribuciones actuales), la herramienta principal para gestionar y ver los logs es `journalctl`.

`journalctl` es la interfaz para el *systemd-journald*, el sistema de registro unificado de `systemd`. A diferencia de los logs tradicionales basados en archivos de texto plano (como los de `/var/log` de antaño), `journalctl` almacena los logs en un formato binario estructurado, lo que permite una búsqueda y filtrado mucho más potente y eficiente. Puedes buscar por servicio, por fecha, por prioridad, e incluso ver logs de reinicios anteriores. Es una herramienta poderosa que centraliza y facilita la gestión de logs, haciendo la vida del administrador mucho más sencilla a la hora de investigar problemas.
''',
    'code_example': '''
# Logs básicos en Linux: journalctl

# --- Usando journalctl (el visor de logs moderno de systemd) ---

# 1. Ver todos los logs del sistema (desde el arranque más reciente):
sudo journalctl
# Presiona 'q' para salir, 'Page Up'/'Page Down' para navegar.

# 2. Ver los logs en tiempo real (como 'tail -f'):
sudo journalctl -f
# Esto es muy útil para ver los logs mientras se produce un evento o se inicia un servicio.

# 3. Ver logs de un servicio específico (ej. Apache web server):
sudo journalctl -u apache2
# O para Nginx: sudo journalctl -u nginx
# Para un servicio de Systemd, usa el nombre de la unidad (.service).

# 4. Ver logs desde un momento específico (ej. desde ayer):
sudo journalctl --since "yesterday"
# Otros ejemplos: --since "2024-05-28 10:00:00", --since "1 hour ago", --since "2 days ago"

# 5. Ver logs hasta un momento específico:
sudo journalctl --until "now"
# O --until "2024-05-28 12:00:00"

# 6. Ver logs de un reinicio anterior (útil para depurar problemas de arranque):
sudo journalctl -b -1
# -b: boot, -1: el arranque anterior. -0 es el arranque actual.

# 7. Ver logs con un nivel de prioridad específico (ej. solo errores):
sudo journalctl -p err
# Niveles de prioridad (de más crítico a menos): emerg, alert, crit, err, warning, notice, info, debug.

# 8. Ver solo los últimos N líneas de los logs:
sudo journalctl -n 20
# Muestra las últimas 20 líneas.

# 9. Ver logs de un ejecutable específico:
sudo journalctl /usr/bin/nginx
# Muestra logs generados por el ejecutable de Nginx.

# Errores comunes:
# - No usar 'sudo' para acceder a todos los logs.
# - Olvidar las comillas en los parámetros de tiempo si contienen espacios (ej. "--since '1 hour ago'").
# - No saber el nombre correcto de la unidad de systemd para un servicio (`systemctl list-units --type=service` te puede ayudar).
'''
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Administración Básica del Sistema',
    'topic': 'Monitoreo Básico',
    'subtopic': 'Alertas simples',
    'definition': r'''
De nada sirve tener un monitoreo exhaustivo si no te enteras cuando algo sale mal. Las "alertas simples" son mecanismos para notificarte cuando se detecta una condición crítica en tu sistema, como un disco lleno, un servicio caído o un uso excesivo de recursos. No sé tú, pero a mí me da mucha tranquilidad saber que mi sistema me avisará si algo necesita mi atención.

¿Te estás preguntando por qué esto es tan fundamental? Pensemos por un momento en la proactividad. En lugar de esperar a que un usuario se queje de que un servicio no funciona o que el sistema se bloquee porque el disco está lleno, las alertas te permiten actuar antes de que el problema se convierta en una crisis. Incluso en la administración básica, configurar unas pocas alertas clave puede ahorrarte muchos dolores de cabeza.

Puedes configurar alertas simples usando herramientas de scripting y combinándolas con métodos de notificación comunes:
* **Scripts de Bash y cron:** Puedes escribir un script que verifique una condición (ej. `df -h | grep /dev/sda1 | awk '{print $5}' | sed 's/%//'` para el porcentaje de uso de disco) y, si la condición se cumple (ej. el porcentaje es mayor al 90%), ejecute una acción de notificación. Luego, programas ese script con `cron` para que se ejecute periódicamente.
* **Correo electrónico:** Es el método de notificación más universal. Puedes usar comandos como `mail` o `sendmail` (o `mutt` para algo más avanzado) dentro de tus scripts para enviar un correo electrónico a tu dirección cuando se activa una alerta.
* **Mensajes en la terminal:** Para problemas menos críticos o para pruebas, simplemente imprimir un mensaje en la terminal o escribirlo en un archivo de log adicional puede ser suficiente.
* **Herramientas de mensajería (básico):** Algunas herramientas permiten enviar mensajes a plataformas como Telegram o Slack mediante APIs, aunque esto ya sería un paso más allá del "básico".

Aunque las soluciones de monitoreo profesionales son mucho más sofisticadas, empezar con alertas simples te permite tener una base sólida de visibilidad sobre el estado de tu sistema y reaccionar a tiempo ante los problemas.
''',
    'code_example': r'''
# Alertas simples en Linux con Bash y cron

# Ejemplo de script para alertar sobre espacio en disco bajo
# Guarda esto como 'check_disk_space.sh' y dale permisos de ejecución (chmod +x)

#!/bin/bash

# Configuración
THRESHOLD=90 # Porcentaje de uso de disco para activar la alerta
PARTITION="/" # Partición a monitorear (ej. /, /home, /var)
RECIPIENT="tu_email@ejemplo.com" # Tu dirección de correo para recibir alertas
HOSTNAME=$(hostname) # Nombre del host para la alerta

# Obtener el porcentaje de uso de la partición
# df -h: muestra uso de disco, -h para formato legible para humanos
# awk '$NF == "'''
        r'$PARTITION'
        r'''" {print $5}': busca la línea de la partición y extrae el 5to campo (uso %)
# sed 's/%//': elimina el signo de porcentaje
USED_PERCENT=$(df -h | awk -v part="'''
        r'$PARTITION'
        r'''" '$NF == part {print $5}' | sed 's/%//')

# Verificar si el uso excede el umbral
if [ -z "$USED_PERCENT" ]; then
  MESSAGE="ERROR: No se pudo obtener el uso de la partición $PARTITION en $HOSTNAME."
  echo "$MESSAGE" | mail -s "Alerta de monitoreo: ERROR en script" "$RECIPIENT"
  exit 1
elif [ "$USED_PERCENT" -ge "$THRESHOLD" ]; then
  MESSAGE="ALERTA: El uso de disco en $PARTITION en $HOSTNAME es del $USED_PERCENT%, superando el umbral del $THRESHOLD%."
  echo "$MESSAGE" | mail -s "Alerta de monitoreo: Disco bajo en $HOSTNAME" "$RECIPIENT"
  # También puedes añadir un log o un mensaje en la consola:
  echo "$(date): $MESSAGE" >> /var/log/disk_alerts.log
else
  echo "$(date): Uso de disco de $PARTITION es del $USED_PERCENT%. Todo OK."
fi

# --- Programar la alerta con cron ---

# 1. Editar tu crontab para programar el script (ej. cada 15 minutos):
# crontab -e
#
# Añade la siguiente línea (asegúrate de que la ruta al script sea correcta):
# */15 * * * * /ruta/a/tu/check_disk_space.sh > /dev/null 2>&1
# El ' > /dev/null 2>&1 ' es para suprimir la salida normal del script y solo enviar correo si hay un error o alerta.

# --- Verificación básica del envío de correo (requiere un agente de correo como Postfix/Sendmail) ---
# Puedes probar el comando 'mail' directamente:
# echo "Mensaje de prueba" | mail -s "Test de correo" "tu_email@ejemplo.com"
# Si no recibes correos, el problema puede estar en la configuración de tu MTA (Mail Transfer Agent)
# o en la configuración de SPAM de tu bandeja de entrada.

# Errores comunes:
# - No instalar un agente de correo (MTA) como Postfix o Sendmail para que el comando 'mail' funcione.
# - No dar permisos de ejecución al script (`chmod +x`).
# - Errores en la ruta del script en la configuración de cron.
# - No validar si la extracción del porcentaje de uso de disco fue exitosa, lo que puede llevar a alertas incorrectas.
'''
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Administración Básica del Sistema',
    'topic': 'Monitoreo Básico',
    'subtopic': 'Herramientas gráficas básicas',
    'definition': '''
Aunque la línea de comandos es el corazón de Linux, a veces una interfaz gráfica puede hacer el monitoreo más intuitivo y visual, especialmente para una vista rápida o para usuarios que no están acostumbrados a la terminal. Las "herramientas gráficas básicas" de monitoreo te ofrecen una representación visual del rendimiento de tu sistema y el uso de recursos.

¿Te estás preguntando por qué esto puede ser útil? 

Pensemos por un momento en la facilidad de uso. Si bien `top`, `vmstat` e `iostat` son poderosos, sus salidas son puramente textuales. Una gráfica puede mostrarte tendencias de uso de CPU o memoria de un vistazo, lo que es invaluable para identificar picos o problemas que quizás no notes en una tabla de números. Esto es especialmente cierto si estás trabajando en un entorno de escritorio Linux.

Algunas herramientas gráficas básicas populares incluyen:
* **Monitor del Sistema (System Monitor):** La mayoría de los entornos de escritorio (GNOME, KDE, XFCE, etc.) vienen con su propia aplicación de "Monitor del Sistema" preinstalada. Estas herramientas suelen ofrecer pestañas para ver el uso de CPU, memoria, red, procesos activos e incluso la actividad del disco. Son muy fáciles de usar y proporcionan una visión general excelente.
* **htop:** Aunque es una herramienta de terminal, `htop` es una mejora gráfica sobre `top`. Es mucho más interactiva, con barras de progreso para CPU y memoria, y permite ordenar, filtrar y matar procesos de forma más sencilla con el teclado. Es una herramienta semi-gráfica indispensable para muchos administradores.
* **ksysguard / gnome-system-monitor:** Son las aplicaciones específicas de KDE y GNOME, respectivamente, que te proporcionan gráficos en tiempo real y una interfaz más amigable para gestionar procesos y ver estadísticas del sistema.

Si bien las herramientas de línea de comandos son esenciales para scripts y servidores sin interfaz gráfica, las herramientas gráficas básicas son una excelente opción para el monitoreo interactivo en estaciones de trabajo y para visualizar rápidamente el estado de tu sistema.
''',
    'code_example': '''
# Herramientas gráficas básicas de monitoreo en Linux

# --- htop (Monitor de procesos interactivo en terminal) ---

# 1. Instalar htop (si no está ya instalado):
# En Debian/Ubuntu: sudo apt install htop
# En Red Hat/CentOS/Fedora: sudo dnf install htop (o sudo yum install htop)

# 2. Iniciar htop:
htop
# En la interfaz de htop:
#   F1: Ayuda
#   F2: Configuración (personalizar columnas, colores)
#   F3: Buscar procesos
#   F4: Filtrar procesos
#   F5: Vista de árbol (para ver relaciones padre-hijo de procesos)
#   F6: Ordenar por columna (CPU, Memoria, etc.)
#   F9: Matar un proceso (te pedirá la señal)
#   q: Salir

# --- Monitor del Sistema (Ejemplo GNOME/KDE) ---

# No hay comandos de terminal para "abrir" directamente la GUI como parte de un script de shell de monitoreo,
# ya que son aplicaciones de escritorio.
# Para iniciar el Monitor del Sistema de GNOME (en entornos GNOME):
# gnome-system-monitor &
# (El '&' lo ejecuta en segundo plano para no bloquear tu terminal)

# Para iniciar KSystemGuard de KDE (en entornos KDE):
# ksysguard &

# Estas herramientas generalmente se encuentran en el menú de aplicaciones de tu escritorio,
# a menudo bajo "Utilidades", "Herramientas del Sistema" o "Administración".

# --- Ejemplo de lo que se ve en un Monitor del Sistema Gráfico ---
# Pestañas comunes:
# - Procesos: Lista de todos los procesos, uso de CPU, Memoria, PID, etc. (similar a top/htop).
# - Recursos: Gráficos en tiempo real de uso de CPU, Memoria, Tráfico de red.
# - Sistemas de archivos: Espacio en disco de las particiones montadas (similar a df).

# Errores comunes:
# - Intentar usar `htop` o monitores gráficos en servidores sin entorno de escritorio (no tienen sentido).
# - No entender que, aunque sean gráficos, la información que muestran proviene de los mismos datos subyacentes que las herramientas de línea de comandos.
# - Depender exclusivamente de herramientas gráficas en lugar de aprender las de línea de comandos para la automatización y servidores remotos.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Administración Básica del Sistema',
    'topic': 'Virtualización Básica',
    'subtopic': 'Introducción a máquinas virtuales',
    'definition': '''
La virtualización es uno de esos conceptos que revolucionaron la informática. Una "máquina virtual" (VM) es, en esencia, una computadora simulada dentro de otra computadora. Es como tener un PC completo (con su propio sistema operativo, hardware virtual y aplicaciones) que se ejecuta como un programa en tu sistema operativo anfitrión.

¿Te estás preguntando por qué esto es tan útil? 

Pensemos por un momento en la flexibilidad y el aislamiento. Las VMs te permiten:

* **Ejecutar múltiples sistemas operativos:** Puedes tener Linux, Windows y macOS (si el hardware lo permite) ejecutándose simultáneamente en una sola máquina física. Esto es invaluable para desarrollo, pruebas o para ejecutar software que solo está disponible en un SO específico.
* **Aislar entornos:** Una VM está aislada del sistema anfitrión y de otras VMs. Si algo sale mal en una VM (un virus, un software defectuoso), no afecta a tu sistema principal ni a otras VMs. Esto la convierte en un entorno seguro para experimentar o probar software.
* **Portabilidad:** Puedes "mover" una VM de un hardware físico a otro, o de un servidor a otro, con relativa facilidad. Esto facilita el despliegue y la recuperación ante desastres.
* **Optimización de recursos:** Permite consolidar múltiples servidores pequeños en un solo hardware físico potente, ahorrando espacio, energía y costos de mantenimiento.

Existen diferentes tipos de virtualización (tipo 1 "bare-metal" como ESXi o Proxmox, y tipo 2 "hosted" como VirtualBox o VMware Workstation), pero la idea central es la misma: maximizar el uso de los recursos físicos y proporcionar entornos aislados para distintas necesidades. La virtualización es la base de la computación en la nube y una habilidad esencial en el mundo tecnológico actual.
''',
    'code_example': '''
# Introducción a máquinas virtuales (VMs)

# No hay comandos de terminal directamente para "introducir" el concepto de VMs,
# pero podemos mostrar cómo se interactúa con un sistema virtualizado o qué información se busca.

# Ejemplo de verificación si tu CPU soporta virtualización (para KVM/QEMU):
# grep -E --color 'vmx|svm' /proc/cpuinfo
# Si ves 'vmx' (para Intel) o 'svm' (para AMD), tu CPU soporta virtualización por hardware,
# lo cual es crucial para un buen rendimiento de VMs.

# Ejemplo de cómo ver las máquinas virtuales en ejecución (si usas 'virsh' para KVM/QEMU):
# sudo virsh list --all
# Salida:
#  Id    Name                           State
# ----------------------------------------------------
#  1     my_ubuntu_vm                   running
#  -     my_windows_vm                  shut off

# Ejemplo de cómo se vería un directorio de una VM (en VirtualBox, por ejemplo):
# ls -l ~/VirtualBox VMs/MyUbuntuVM/
# Salida esperada (mostraría archivos de configuración .vbox, disco virtual .vdi, etc.):
# -rw------- 1 user user  123456789 May 28 16:00 MyUbuntuVM.vbox
# -rw------- 1 user user 50000000000 May 28 16:05 MyUbuntuVM.vdi
# ...

# Comparación conceptual con contenedores (que veremos después):
# Una máquina virtual:
#   - Contiene un sistema operativo completo (kernel, librerías, aplicaciones).
#   - Requiere más recursos (RAM, CPU, disco) que un contenedor.
#   - Proporciona aislamiento completo a nivel de hardware virtualizado.
#   - Es ideal para ejecutar sistemas operativos diferentes o aislar aplicaciones críticas.

# Un contenedor:
#   - Comparte el kernel del sistema operativo anfitrión.
#   - Incluye solo las aplicaciones y sus dependencias.
#   - Es más ligero, arranca más rápido y usa menos recursos.
#   - Proporciona aislamiento a nivel de proceso y espacio de nombres.
#   - Ideal para empaquetar y desplegar aplicaciones de forma consistente.

# Errores comunes conceptuales:
# - Confundir una máquina virtual con un contenedor (son diferentes tecnologías para propósitos similares).
# - Pensar que una VM no consume recursos del sistema anfitrión (sí lo hace, aunque se asignan virtualmente).
# - No entender que la virtualización por hardware (VT-x/AMD-V) es necesaria para un rendimiento óptimo de muchas VMs.
'''
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Administración Básica del Sistema',
    'topic': 'Virtualización Básica',
    'subtopic': 'KVM/QEMU básico',
    'definition': '''
Cuando hablamos de virtualización en Linux, `KVM` (Kernel-based Virtual Machine) y `QEMU` son nombres que aparecen constantemente. KVM es una tecnología de virtualización integrada directamente en el kernel de Linux que convierte al kernel en un hipervisor de tipo 1 (bare-metal). QEMU, por otro lado, es un emulador de máquina completo y virtualizador. A menudo se usan juntos: KVM proporciona la capacidad de virtualización de hardware nativa (que permite a las VMs ejecutarse casi a la velocidad nativa), y QEMU se encarga de la emulación del hardware (procesador, red, gráficos, etc.) para las máquinas virtuales.

¿Te estás preguntando por qué esta combinación es tan poderosa? 

Pensemos por un momento en el rendimiento y el control. A diferencia de soluciones como VirtualBox (que son hipervisores de tipo 2 o alojados), KVM aprovecha las extensiones de virtualización del hardware de tu CPU (Intel VT-x o AMD-V), lo que significa que las máquinas virtuales se ejecutan con una sobrecarga mínima, casi como si estuvieran en hardware real. Esto lo hace ideal para servidores y entornos donde el rendimiento es crítico.

Usar KVM/QEMU implica trabajar con herramientas de línea de comandos o, más comúnmente, con interfaces gráficas como `virt-manager` que simplifican la creación y gestión de VMs. Aunque la configuración inicial puede ser un poco más compleja que VirtualBox, el rendimiento y la integración con el kernel de Linux hacen de KVM/QEMU una opción superior para virtualización en entornos de producción y para usuarios avanzados de Linux.
''',
    'code_example': r'''
# KVM/QEMU básico

# --- Preparación del sistema para KVM/QEMU ---

# 1. Verificar si tu CPU soporta virtualización (Intel VT-x o AMD-V):
grep -E --color 'vmx|svm' /proc/cpuinfo
# Si no ves 'vmx' o 'svm', la virtualización por hardware podría estar deshabilitada en la BIOS/UEFI.

# 2. Instalar los paquetes necesarios (ejemplo para Debian/Ubuntu):
sudo apt update
sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virtinst virt-manager
# - qemu-kvm: Los binarios de QEMU y el módulo KVM.
# - libvirt-daemon-system: El demonio de libvirt, que gestiona KVM.
# - libvirt-clients: Herramientas de cliente para libvirt (ej. virsh).
# - bridge-utils: Para configurar redes puente (útil para que las VMs tengan IP propia).
# - virtinst: Herramientas para crear VMs desde la línea de comandos.
# - virt-manager: La GUI para gestionar VMs (¡muy recomendable!).

# 3. Añadir tu usuario al grupo 'libvirt' para poder gestionar VMs sin sudo:
sudo usermod -aG libvirt $USER
# Luego, cierra la sesión y vuelve a iniciar para que los cambios tengan efecto.

# 4. Verificar que KVM esté funcionando:
lsmod | grep kvm
# Deberías ver 'kvm_intel' o 'kvm_amd' y 'kvm'.

# --- Gestión básica con virsh (línea de comandos) ---

# No podemos mostrar la creación completa de una VM aquí (requiere una imagen ISO),
# pero sí comandos para interactuar con ellas.

# 5. Listar las máquinas virtuales:
sudo virsh list --all
# Muestra VMs en ejecución y detenidas.

# 6. Iniciar una máquina virtual (ej. 'my_ubuntu_vm'):
# sudo virsh start my_ubuntu_vm

# 7. Apagar una máquina virtual (apaga de forma elegante):
# sudo virsh shutdown my_ubuntu_vm

# 8. Apagar una máquina virtual de forma forzada (como desenchufar):
# sudo virsh destroy my_ubuntu_vm

# 9. Ver el uso de recursos de una VM (muy básico):
# sudo virsh domstats my_ubuntu_vm

# --- Gestión con virt-manager (GUI) ---

# Para iniciar la interfaz gráfica:
# virt-manager &
# Esto abrirá una ventana donde puedes crear, iniciar, detener y gestionar tus VMs de forma visual.
# La creación de una VM se hace a través de un asistente gráfico que te guía por la configuración.

# Errores comunes:
# - No tener las extensiones de virtualización habilitadas en la BIOS/UEFI de tu hardware.
# - Olvidar añadir tu usuario al grupo 'libvirt'.
# - Intentar iniciar VMs sin una imagen de instalación (ISO) o un disco virtual preexistente.
# - No entender que `virsh` es para la línea de comandos y `virt-manager` es la GUI.
'''
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Administración Básica del Sistema',
    'topic': 'Virtualización Básica',
    'subtopic': 'Contenedores básicos (Docker introductorio)',
    'definition': '''
Si las máquinas virtuales son casas individuales, los "contenedores" son como apartamentos en un edificio: comparten una base común (el sistema operativo anfitrión) pero tienen sus propias habitaciones y muebles. Los contenedores empaquetan una aplicación y todas sus dependencias (bibliotecas, configuraciones, etc.) en un solo paquete ligero y portable, que puede ejecutarse de forma consistente en cualquier entorno. Docker es, sin duda, la herramienta más popular para trabajar con contenedores.

¿Te estás preguntando por qué esto es tan innovador? 

Pensemos por un momento en la consistencia y la eficiencia. Con los contenedores, solucionas el famoso problema de "funciona en mi máquina, pero no en producción". Una aplicación en un contenedor siempre tendrá el mismo entorno, sin importar dónde se ejecute. Esto facilita enormemente el desarrollo, las pruebas y el despliegue. Además:

* **Ligeros:** A diferencia de las VMs, los contenedores comparten el kernel del sistema operativo anfitrión, lo que los hace mucho más ligeros, rápidos de iniciar y con menos consumo de recursos.
* **Portátiles:** Un contenedor Docker se puede ejecutar en cualquier máquina que tenga Docker instalado, ya sea tu laptop, un servidor local o la nube.
* **Aislamiento:** Aunque comparten el kernel, los contenedores proporcionan un buen nivel de aislamiento entre sí y del sistema anfitrión, lo que mejora la seguridad y evita conflictos de dependencias.
* **Desarrollo y Ops (DevOps):** Los contenedores son la piedra angular de las prácticas DevOps, ya que facilitan la entrega continua y el despliegue de aplicaciones.

Docker ha democratizado el uso de contenedores, permitiendo a desarrolladores y administradores construir, enviar y ejecutar aplicaciones de una manera estandarizada y eficiente. Es una tecnología que ha cambiado la forma en que se despliegan las aplicaciones modernas.
''',
    'code_example': r'''
# Contenedores básicos: Docker introductorio

# --- Instalación de Docker (ejemplo para Debian/Ubuntu) ---

# 1. Eliminar versiones antiguas (si existen):
sudo apt remove docker docker-engine docker.io containerd runc

# 2. Instalar dependencias:
sudo apt update
sudo apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common

# 3. Añadir la clave GPG oficial de Docker:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# 4. Añadir el repositorio de Docker:
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 5. Instalar Docker Engine:
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io

# 6. Añadir tu usuario al grupo 'docker' para ejecutar comandos sin sudo:
sudo usermod -aG docker $USER
# Cierra la sesión y vuelve a iniciar para que los cambios surtan efecto.

# 7. Verificar la instalación:
docker run hello-world
# Esto debería descargar una pequeña imagen y ejecutarla, mostrando un mensaje de bienvenida.

# --- Comandos básicos de Docker ---

# 8. Descargar una imagen (ej. Ubuntu):
docker pull ubuntu:latest

# 9. Listar las imágenes descargadas:
docker images

# 10. Ejecutar un contenedor de forma interactiva (ej. una shell de Ubuntu):
docker run -it ubuntu /bin/bash
# -i: interactivo, -t: pseudo-TTY. Estarás dentro del contenedor.
# Escribe 'exit' para salir del contenedor.

# 11. Ejecutar un contenedor en segundo plano (detached mode) y mapear un puerto:
# docker run -d -p 8080:80 nginx
# Esto descarga y ejecuta un servidor web Nginx, accesible en http://localhost:8080

# 12. Listar los contenedores en ejecución:
docker ps

# 13. Listar todos los contenedores (en ejecución y detenidos):
docker ps -a

# 14. Detener un contenedor (por su ID o nombre):
# docker stop <container_id_o_nombre>

# 15. Eliminar un contenedor (debe estar detenido):
# docker rm <container_id_o_nombre>

# 16. Eliminar una imagen:
# docker rmi <image_id_o_nombre>

# Errores comunes:
# - Olvidar añadir tu usuario al grupo 'docker', lo que te obligará a usar 'sudo' con cada comando.
# - Intentar ejecutar un contenedor sin haber descargado su imagen primero.
# - Confundir 'detener' con 'eliminar' un contenedor.
# - No entender que los cambios dentro de un contenedor no se guardan por defecto a menos que se "persistan" con volúmenes.
'''
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Administración Básica del Sistema',
    'topic': 'Virtualización Básica',
    'subtopic': 'Vagrant básico',
    'definition': '''
Mientras que Docker es fantástico para aplicaciones, a veces necesitas un entorno de desarrollo completo que replique un sistema operativo entero, pero de forma más sencilla que con una VM manual. Aquí es donde `Vagrant` entra en escena. Vagrant es una herramienta que te permite crear y gestionar entornos de desarrollo virtualizados de forma automatizada y reproducible. Usa proveedores de virtualización como VirtualBox (por defecto), VMware o KVM/Libvirt para lanzar máquinas virtuales.

¿Te estás preguntando por qué esto es tan útil? 

Pensemos por un momento en la consistencia del entorno de desarrollo. Si trabajas en un equipo, cada desarrollador puede tener su propia máquina configurada de manera ligeramente diferente, lo que lleva a problemas de "funciona en mi máquina". Vagrant resuelve esto al permitirte definir un entorno de desarrollo en un archivo de configuración (`Vagrantfile`) que todos pueden usar. Así, todos trabajan en el mismo entorno virtual, eliminando las inconsistencias.

Las ventajas de Vagrant son:
* **Reproducibilidad:** El `Vagrantfile` es un archivo de texto que describe el entorno. Puedes versionarlo con Git y compartirlo, asegurando que todos tengan el mismo setup.
* **Facilidad de uso:** Con solo unos pocos comandos (`vagrant up`, `vagrant ssh`, `vagrant destroy`), puedes levantar, acceder y destruir entornos virtuales complejos.
* **Provisionamiento:** Vagrant puede ejecutar scripts (Bash, Ansible, Chef, Puppet) para instalar software, configurar bases de datos y hacer todo lo necesario para que tu entorno esté listo para desarrollar.
* **Flexibilidad:** Aunque por defecto usa VirtualBox, puedes configurarlo para usar otros proveedores de virtualización si lo necesitas.

Vagrant es una herramienta invaluable para equipos de desarrollo y para cualquier persona que necesite entornos de desarrollo limpios, aislados y consistentemente configurados.
''',
    'code_example': '''
# Vagrant básico

# --- Requisitos previos ---
# Asegúrate de tener un proveedor de virtualización instalado, como VirtualBox.
# (Descarga e instala VirtualBox desde su sitio web oficial)

# --- Instalación de Vagrant ---

# 1. Descargar Vagrant desde el sitio web oficial de Vagrant:
# https://www.vagrantup.com/downloads.html
# Descarga el paquete .deb (para Debian/Ubuntu) o .rpm (para Red Hat/CentOS/Fedora) y instálalo.
# Ejemplo para Debian/Ubuntu:
# sudo dpkg -i vagrant_x.y.z_amd64.deb
# sudo apt install -f # Para resolver dependencias

# 2. Verificar la instalación:
vagrant --version

# --- Uso básico de Vagrant ---

# 3. Crear un directorio para tu proyecto y navegar a él:
mkdir my_vagrant_project
cd my_vagrant_project

# 4. Inicializar un nuevo Vagrantfile con una 'box' (imagen de VM):
# Usaremos 'ubuntu/focal64' como ejemplo, que es Ubuntu 20.04 LTS.
vagrant init ubuntu/focal64
# Esto crea un archivo llamado 'Vagrantfile' en tu directorio actual.

# 5. Abrir el Vagrantfile y revisar su contenido. Es un archivo Ruby.
# nano Vagrantfile
# Puedes ver la línea 'config.vm.box = "ubuntu/focal64"'
# Y una sección comentada para "provisioning" que usaremos después.

# 6. Levantar la máquina virtual (primera vez descargará la box):
vagrant up
# Esto descargará la box si no la tienes, iniciará la VM en VirtualBox
# y la configurará según el Vagrantfile.

# 7. Acceder a la máquina virtual vía SSH:
vagrant ssh
# Estarás conectado a la VM. Escribe 'exit' para salir.

# 8. Configurar provisioning (ejecutar comandos/scripts al levantar la VM):
# Edita el Vagrantfile y descomenta/añade una sección de provisioning.
# Ejemplo de Vagrantfile (solo la parte relevante):
# Vagrant.configure("2") do |config|
#   config.vm.box = "ubuntu/focal64"
#
#   # Provisioning con un script de shell
#   config.vm.provision "shell", inline: <<-SHELL
#     echo "Instalando Nginx en la VM..."
#     sudo apt update
#     sudo apt install -y nginx
#     echo "Nginx instalado y funcionando!"
#   SHELL
# end
#
# Guarda el Vagrantfile y ejecuta:
# vagrant reload --provision
# Esto reinicia la VM y ejecuta el script de provisioning.

# 9. Suspender la máquina virtual (guarda su estado para reanudar rápido):
vagrant suspend

# 10. Reanudar la máquina virtual:
vagrant resume

# 11. Apagar la máquina virtual:
vagrant halt

# 12. Destruir la máquina virtual (eliminarla completamente):
vagrant destroy
# Esto elimina la VM de VirtualBox y libera el espacio en disco.

# Errores comunes:
# - No tener un proveedor de virtualización (como VirtualBox) instalado antes de usar Vagrant.
# - Errores de sintaxis en el Vagrantfile (es sensible a la indentación y los detalles de Ruby).
# - No ejecutar `vagrant reload --provision` después de cambiar la sección de provisioning en el Vagrantfile.
# - No liberar espacio en disco con `vagrant destroy` cuando ya no necesitas una VM.
'''
  });
}

Future<void> insertJrLevel5DataLinux(Database db) async {
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Entorno de Desarrollo',
    'topic': 'Configuración del Entorno',
    'subtopic': 'Shell avanzado (Zsh, Fish)',
    'definition': '''
El shell es la interfaz que usas para interactuar con el sistema operativo a través de la línea de comandos. Si bien Bash es el shell por defecto en la mayoría de las distribuciones Linux, existen alternativas más avanzadas que pueden mejorar enormemente tu productividad y la experiencia en la terminal. Hablamos de Zsh (Z Shell) y Fish (Friendly Interactive Shell).

¿Te estás preguntando por qué molestarse en cambiar de shell? 

Pensemos por un momento en la eficiencia y la personalización. Bash es sólido, pero Zsh y Fish llevan la interactividad de la terminal a otro nivel con características que te harán la vida más fácil:

* **Autocompletado inteligente:** Ambos shells ofrecen un autocompletado de comandos y argumentos mucho más potente y contextual que Bash. Fish, en particular, tiene sugerencias de autocompletado "en línea" que te muestran comandos completos basados en tu historial y los directorios por los que has navegado, como si un asistente te estuviera susurrando.
* **Resaltado de sintaxis:** Te ayuda a detectar errores tipográficos antes de ejecutar un comando.
* **Historial mejorado:** Puedes navegar por tu historial de comandos de forma más eficiente y buscar comandos específicos con mayor facilidad.
* **Plugins y temas:** Zsh, especialmente con frameworks como Oh My Zsh, te permite instalar cientos de plugins para añadir funcionalidades (como integración con Git, gestión de entornos de Python, etc.) y temas visuales para personalizar el aspecto de tu terminal. Fish también tiene un ecosistema de plugins y una configuración muy intuitiva.

Cambiar a un shell avanzado es como actualizar de un coche básico a uno con todas las comodidades: te permite moverte más rápido, con menos esfuerzo y con una experiencia más agradable. Para cualquier persona que pase mucho tiempo en la terminal, la inversión de tiempo en aprender y configurar uno de estos shells se paga con creces en productividad.
''',
    'code_example': r'''
# Shell avanzado: Zsh y Fish

# --- Instalación y Configuración Básica de Zsh ---

# 1. Instalar Zsh (ejemplo para Debian/Ubuntu):
sudo apt install zsh

# 2. Cambiar tu shell predeterminado a Zsh:
chsh -s $(which zsh)
# Deberás cerrar la sesión y volver a iniciar para que el cambio surta efecto.

# 3. Instalar Oh My Zsh (framework para gestionar la configuración de Zsh):
# (Requiere 'curl' o 'wget' y 'git' instalados)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Esto copiará una configuración base de Zsh y te guiará a través de la primera configuración.

# 4. Personalizar tu archivo .zshrc (ubicado en tu directorio de inicio):
# nano ~/.zshrc
# Aquí puedes cambiar el tema (ej. ZSH_THEME="agnoster"), activar/desactivar plugins (plugins=(git zsh-autosuggestions zsh-syntax-highlighting)), etc.

# Para plugins como 'zsh-autosuggestions' y 'zsh-syntax-highlighting', necesitas instalarlos primero:
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# Luego, añádelos a la lista de plugins en tu .zshrc.
# Después de editar .zshrc, recarga la configuración con: source ~/.zshrc

# --- Instalación y Configuración Básica de Fish ---

# 5. Instalar Fish (ejemplo para Debian/Ubuntu):
sudo apt install fish

# 6. Cambiar tu shell predeterminado a Fish:
chsh -s $(which fish)
# Deberás cerrar la sesión y volver a iniciar.

# 7. Configurar Fish:
# Fish tiene una configuración basada en funciones y variables, y no usa un '.fishrc' tradicional.
# Puedes añadir configuraciones personalizadas en: ~/.config/fish/config.fish
# Para configurar interactivamente desde la terminal:
fish_config
# Esto abrirá una interfaz web para personalizar Fish (temas, funciones, etc.).

# Ejemplo de un alias en Fish:
# fun ll
#   ls -lA $argv
# end
# funsave ll
# Para guardar la función 'll' permanentemente.

# Errores comunes:
# - No cerrar y volver a iniciar la sesión después de cambiar el shell con `chsh`.
# - No instalar los plugins de Zsh antes de añadirlos a .zshrc.
# - En Fish, intentar usar sintaxis de Bash (ej. `;` para separar comandos, `&&` para condicionales - Fish usa `and` y `or`).
# - Configurar un tema de Zsh que requiera una fuente Powerline sin instalarla, lo que puede causar caracteres extraños.
'''
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Entorno de Desarrollo',
    'topic': 'Configuración del Entorno',
    'subtopic': 'Editores (Vim, VS Code)',
    'definition': '''
El editor de texto es, para muchos de nosotros, la herramienta más utilizada en nuestro día a día. Es donde escribimos código, configuramos archivos, tomamos notas y un largo etcétera. La elección del editor es muy personal, pero hay dos pesos pesados en el mundo Linux que merecen nuestra atención: Vim y VS Code.

¿Te estás preguntando por qué invertir tiempo en estos editores? 

Pensemos por un momento en la eficiencia y la versatilidad.

* **Vim:** Este editor de terminal es una leyenda. Es ligero, increíblemente rápido y está disponible en prácticamente cualquier sistema Linux, incluso en los más minimalistas o remotos. Su curva de aprendizaje es pronunciada, no lo voy a negar. No sé tú, pero a mí me costó un poco la primera vez que intenté salir de él 🤯. Sin embargo, una vez que dominas sus modos de operación (normal, inserción, visual, comando), te permite editar texto a la velocidad del pensamiento sin levantar las manos del teclado. Es extensible con plugins y su eficiencia es inigualable para tareas puramente de edición de texto o de código en la terminal. Muchos desarrolladores veteranos juran por él.

* **VS Code (Visual Studio Code):** Desarrollado por Microsoft, VS Code es un editor de código moderno y multiplataforma que se ha ganado una enorme popularidad en la comunidad de desarrollo. Combina lo mejor de un editor de texto ligero con las características de un IDE (Entorno de Desarrollo Integrado). Es altamente configurable, tiene un ecosistema de extensiones gigantesco (para casi cualquier lenguaje o herramienta que imagines), depuradores integrados, control de versiones (Git) y una interfaz gráfica amigable. Es perfecto para el desarrollo de proyectos complejos, tanto localmente como para desarrollo remoto (con la extensión Remote SSH, por ejemplo).

Mientras que Vim es el rey de la eficiencia en la terminal y para tareas rápidas, VS Code es el campeón de la productividad para proyectos de software completos, con su riqueza de características y un ecosistema de extensiones que puede cubrir casi cualquier necesidad. La elección entre ellos a menudo depende del contexto y las preferencias personales.
''',
    'code_example': r'''
# Editores de texto: Vim y VS Code

# --- Vim básico ---

# 1. Abrir un archivo con Vim:
vim mi_archivo.txt
# Estarás en MODO NORMAL (no puedes escribir directamente).

# 2. Entrar en MODO INSERCIÓN (para escribir texto):
# Presiona 'i'
# Ahora puedes escribir como en un editor normal.

# 3. Salir del MODO INSERCIÓN y volver a MODO NORMAL:
# Presiona 'Esc'

# 4. Guardar y salir desde MODO NORMAL:
# Presiona ':wq' (write and quit) y luego 'Enter'

# 5. Salir sin guardar desde MODO NORMAL:
# Presiona ':q!' (quit without saving, force) y luego 'Enter'

# 6. Comandos comunes en MODO NORMAL:
#   dd: Borrar la línea actual
#   yy: Copiar la línea actual
#   p: Pegar
#   u: Deshacer
#   Ctrl+r: Rehacer
#   /patron: Buscar 'patron'
#   n: Siguiente ocurrencia de la búsqueda
#   :%s/viejo/nuevo/g: Reemplazar todas las ocurrencias de 'viejo' por 'nuevo' en todo el archivo.

# --- VS Code básico (asumiendo que ya está instalado) ---

# 7. Abrir VS Code desde la terminal en el directorio actual:
code .
# Esto abrirá VS Code y cargará el directorio como un proyecto.

# 8. Abrir un archivo específico:
code mi_codigo.py

# 9. Instalar una extensión desde la línea de comandos (ej. Python):
code --install-extension ms-python.python

# 10. Abrir un directorio remoto vía SSH (requiere la extensión "Remote - SSH"):
# 10.1. Instala la extensión "Remote - SSH" en VS Code.
# 10.2. Abre la paleta de comandos (Ctrl+Shift+P o Cmd+Shift+P).
# 10.3. Escribe 'Remote-SSH: Connect to Host...' y selecciona tu host SSH configurado.
# Esto abrirá una nueva ventana de VS Code conectada directamente al servidor remoto.

# Errores comunes:
# - En Vim, intentar escribir sin haber entrado en MODO INSERCIÓN, lo que ejecuta comandos.
# - En Vim, no saber cómo salir (la famosa "trampa de Vim").
# - En VS Code, no instalar las extensiones adecuadas para el lenguaje o la funcionalidad que necesitas.
# - Expectar que VS Code se comporte como un IDE completo sin las configuraciones y extensiones necesarias.
'''
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Entorno de Desarrollo',
    'topic': 'Configuración del Entorno',
    'subtopic': 'Terminales avanzadas (Kitty, Alacritty)',
    'definition': '''
El emulador de terminal es la ventana a tu línea de comandos. Si bien la terminal por defecto de tu sistema (como GNOME Terminal o Konsole) cumple su función, existen "terminales avanzadas" diseñadas para ofrecer un rendimiento superior, más personalización y características específicas que pueden mejorar tu flujo de trabajo. Aquí es donde entran en juego opciones como Kitty y Alacritty.

¿Te estás preguntando por qué esto importa si ya tienes una terminal? 

Pensemos por un momento en la velocidad y la experiencia de usuario. Las terminales avanzadas se centran en:

* **Rendimiento:** Tanto Kitty como Alacritty están construidas con lenguajes de programación de bajo nivel (Python y C para Kitty, Rust para Alacritty) y aprovechan la GPU para el renderizado. Esto significa que son increíblemente rápidas, especialmente al mostrar grandes cantidades de texto o al desplazarse por archivos de log extensos. Notarás la diferencia si trabajas mucho con la terminal.
* **Personalización:** Ambas ofrecen una gran cantidad de opciones de configuración a través de archivos de texto plano, permitiéndote ajustar casi todos los aspectos visuales y de comportamiento: fuentes, colores, atajos de teclado, ligaduras (combinación de caracteres para mejorar la legibilidad del código), y más.
* **Características avanzadas:** Kitty, por ejemplo, permite "pestañas" y "ventanas" dentro de una sola ventana de terminal, y soporta "kittens" (mini-aplicaciones que se ejecutan dentro de la terminal). Alacritty, por su parte, se enfoca en la velocidad extrema, siendo una de las terminales más rápidas disponibles.

Elegir una terminal avanzada es como invertir en un monitor de alta gama para tu desarrollo: mejora la experiencia visual, la velocidad y la comodidad, lo que se traduce en una mayor productividad si pasas horas frente a la línea de comandos. No son solo herramientas, son una extensión de tu flujo de trabajo.
''',
    'code_example': '''
# Terminales avanzadas: Kitty y Alacritty

# --- Kitty (Terminal acelerada por GPU) ---

# 1. Instalar Kitty (ejemplo para Debian/Ubuntu):
sudo apt install kitty

# 2. Iniciar Kitty:
kitty
# Se abrirá una nueva ventana de terminal Kitty.

# 3. Archivo de configuración de Kitty:
# Puedes encontrarlo en ~/.config/kitty/kitty.conf
# Si no existe, puedes copiar el archivo de ejemplo:
# cp /etc/xdg/kitty/kitty.conf ~/.config/kitty/kitty.conf
# Luego, edítalo con tu editor preferido:
# nano ~/.config/kitty/kitty.conf

# 4. Ejemplos de configuración en kitty.conf:
# font_family      FiraCode Nerd Font Mono
# font_size        12.0
# bold_font        auto
# italic_font      auto
# background_opacity 0.9 # Para un fondo semi-transparente
# enabled_layouts  splits,tall,stack # Diseños de ventana
# map ctrl+shift+t new_tab # Nuevo atajo para abrir una nueva pestaña

# 5. Funciones avanzadas de Kitty:
# - Dividir la ventana verticalmente: Ctrl+Shift+Enter
# - Dividir la ventana horizontalmente: Ctrl+Shift+d
# - Moverse entre paneles: Ctrl+Shift+corchete_izquierda/derecha

# --- Alacritty (Terminal rápida y ligera) ---

# 6. Instalar Alacritty (ejemplo para Debian/Ubuntu, puede variar según la distribución):
# Alacritty a menudo se recomienda instalar desde su repositorio de GitHub para la última versión.
# Pasos generales para instalar desde código fuente (avanzado):
# sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh # Instalar Rust
# git clone https://github.com/alacritty/alacritty.git
# cd alacritty
# cargo build --release
# sudo cp target/release/alacritty /usr/local/bin # O ~/.local/bin/
# sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
# sudo desktop-file-install extra/linux/Alacritty.desktop
# sudo update-desktop-database

# Si hay un paquete disponible:
# sudo apt install alacritty # (Puede ser una versión más antigua)

# 7. Iniciar Alacritty:
alacritty
# Se abrirá una nueva ventana de terminal Alacritty.

# 8. Archivo de configuración de Alacritty (YAML):
# Se encuentra en ~/.config/alacritty/alacritty.yml
# Si no existe, puedes copiarlo del repositorio de GitHub de Alacritty.
# nano ~/.config/alacritty/alacritty.yml

# 9. Ejemplos de configuración en alacritty.yml:
# font:
#   normal:
#     family: FiraCode Nerd Font Mono
#     style: Regular
#   size: 12.0
# colors:
#   primary:
#     background: '0x1e1e1e'
#     foreground: '0xd0d0d0'
# opacity: 0.9

# Errores comunes:
# - No instalar las dependencias necesarias para compilar Alacritty si lo haces desde el código fuente.
# - Problemas con las fuentes (especialmente Powerline o Nerd Fonts) si no están instaladas o configuradas correctamente en la terminal.
# - No entender que la configuración de estas terminales se hace a través de archivos de texto plano y no mediante una GUI.
'''
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Entorno de Desarrollo',
    'topic': 'Configuración del Entorno',
    'subtopic': 'Gestión de dotfiles',
    'definition': '''
Conforme te adentras en el mundo de Linux y la línea de comandos, empiezas a personalizar tu entorno de forma intensiva: alias, funciones de shell, configuraciones de Vim, Zsh, Git, tmux, etc. Todos estos archivos de configuración, que suelen empezar con un punto (`.`) y están ocultos en tu directorio de inicio (`~`), se conocen como "dotfiles". La "gestión de dotfiles" es el proceso de organizar, versionar y sincronizar estas configuraciones entre diferentes máquinas.

¿Te estás preguntando por qué esto es importante? 

Pensemos por un momento en la consistencia y la eficiencia. No sé tú, pero a mí me frustra cuando tengo que configurar un nuevo sistema y volver a hacer todas las personalizaciones desde cero 😩. La gestión de dotfiles resuelve este problema:

* **Reproducibilidad:** Asegura que puedes recrear tu entorno de desarrollo perfecto en cualquier máquina nueva (o después de una reinstalación) en cuestión de minutos, no de horas.
* **Control de versiones:** Al guardar tus dotfiles en un repositorio de Git (por ejemplo, en GitHub), puedes llevar un registro de los cambios, volver a versiones anteriores si algo sale mal, y colaborar con otros en configuraciones compartidas.
* **Sincronización:** Te permite mantener tus configuraciones actualizadas en todas tus máquinas, ya sea tu laptop, tu PC de escritorio o tus servidores remotos.
* **Compartir y aprender:** Puedes compartir tus dotfiles con otros (o ver los de otros) para descubrir nuevas optimizaciones y formas de configurar herramientas.

Existen varias estrategias para gestionar dotfiles: desde simples enlaces simbólicos (symlinks) hasta herramientas especializadas como `GNU Stow`, `rcm`, o incluso soluciones caseras con scripts de Bash. La clave es encontrar un método que se adapte a tu flujo de trabajo y que te permita tener tu entorno siempre a punto, sin importar dónde estés trabajando.
''',
    'code_example': r'''
# Gestión de dotfiles

# --- Estrategia de enlaces simbólicos con Git (Método común y flexible) ---

# 1. Crear un repositorio de Git para tus dotfiles (ej. en GitHub).
# mkdir ~/dotfiles
# cd ~/dotfiles
# git init
# git remote add origin git@github.com:tu_usuario/dotfiles.git

# 2. Mover tus dotfiles actuales al nuevo repositorio:
# Por ejemplo, para .zshrc:
mv ~/.zshrc ~/dotfiles/.zshrc

# 3. Crear un enlace simbólico desde el repositorio de dotfiles a tu directorio de inicio:
ln -s ~/dotfiles/.zshrc ~/.zshrc
# Esto crea un "atajo" en tu ~ que apunta al archivo real en ~/dotfiles.

# 4. Repetir para otros dotfiles importantes (ej. .bashrc, .vimrc, .gitconfig, .config/nvim/init.vim):
# mv ~/.bashrc ~/dotfiles/.bashrc
# ln -s ~/dotfiles/.bashrc ~/.bashrc

# mv ~/.gitconfig ~/dotfiles/.gitconfig
# ln -s ~/dotfiles/.gitconfig ~/.gitconfig

# Si tienes directorios de configuración (ej. ~/.config/nvim):
# mv ~/.config/nvim ~/dotfiles/.config/nvim
# ln -s ~/dotfiles/.config/nvim ~/.config/nvim

# 5. Añadir los dotfiles al repositorio y hacer tu primer commit:
cd ~/dotfiles
git add .
git commit -m "Initial commit of dotfiles"
git push -u origin main

# --- Usando GNU Stow (Herramienta más avanzada para gestionar enlaces) ---

# 6. Instalar Stow:
# sudo apt install stow # Debian/Ubuntu
# sudo dnf install stow # Red Hat/CentOS/Fedora

# 7. Organizar tus dotfiles para Stow:
# La idea es tener cada configuración en su propio directorio dentro de tu repositorio `dotfiles`.
# Por ejemplo:
# ~/dotfiles/zsh/.zshrc
# ~/dotfiles/vim/.vimrc
# ~/dotfiles/git/.gitconfig
# ~/dotfiles/nvim/.config/nvim

# Estructura del repositorio:
# ~/dotfiles/
# ├── zsh/
# │   └── .zshrc
# ├── vim/
# │   └── .vimrc
# ├── git/
# │   └── .gitconfig
# └── nvim/
#     └── .config/
#         └── nvim/
#             └── init.vim

# 8. Navegar al directorio 'dotfiles' y usar Stow para crear los enlaces simbólicos:
cd ~/dotfiles
stow zsh # Crea enlaces para .zshrc en ~
stow vim # Crea enlaces para .vimrc en ~
stow git # Crea enlaces para .gitconfig en ~
stow nvim # Crea enlaces para .config/nvim en ~/.config

# 9. Desinstalar (eliminar los enlaces):
# stow -D zsh

# Errores comunes:
# - No usar `ln -s` (enlace simbólico) sino `ln` (enlace duro), lo cual no funciona a través de sistemas de archivos y es menos flexible.
# - Olvidar que los dotfiles están ocultos y no verlos con un `ls` normal (usar `ls -a`).
# - Sobreponer un archivo existente con un enlace simbólico sin haber movido/respaldado el original primero.
# - En Stow, no organizar los directorios correctamente o no ejecutar `stow` desde el directorio padre de los módulos.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Entorno de Desarrollo',
    'topic': 'Herramientas de Desarrollo',
    'subtopic': 'Compiladores (gcc)',
    'definition': '''
Cuando escribes código en lenguajes como C o C++, ese código no es directamente ejecutable por la máquina. Necesitas una herramienta que lo traduzca a un lenguaje que el procesador entienda. Aquí es donde entra en juego el "compilador". En el vasto mundo de Linux, el compilador por excelencia para C, C++ y otros lenguajes es GCC (GNU Compiler Collection).

¿Te estás preguntando por qué GCC es tan importante? 

Pensemos por un momento en el puente entre tu código y la máquina. GCC no es solo una herramienta, es un pilar fundamental en el desarrollo de software en sistemas Unix-like (incluido Linux). Su importancia radica en que:

* **Es el estándar de facto:** La mayoría del software de código abierto en Linux está compilado con GCC. Entender cómo funciona es esencial si planeas desarrollar tus propias aplicaciones o compilar software desde la fuente.
* **Proceso de compilación:** GCC te permite transformar tu código fuente (escrito por ti) en un programa ejecutable. Este proceso generalmente involucra varias etapas:
    * **Preprocesamiento:** Expande las macros y los archivos de cabecera (`#include`).
    * **Compilación:** Traduce el código preprocesado a código ensamblador.
    * **Ensamblado:** Convierte el código ensamblador en código máquina (objetos).
    * **Enlazado (Linking):** Une los archivos objeto con las librerías necesarias para crear el ejecutable final.
* **Flexibilidad:** Aunque es conocido por C y C++, GCC soporta una amplia gama de lenguajes de programación, lo que lo convierte en una herramienta versátil para diferentes proyectos. Es altamente configurable y permite optimizaciones para diferentes arquitecturas de CPU.

Dominar los conceptos básicos de GCC es una habilidad invaluable para cualquier desarrollador que trabaje con lenguajes compilados en Linux. Es la base sobre la que se construyen muchos otros sistemas de software.
''',
    'code_example': '''
# Compiladores: GCC (GNU Compiler Collection)

# --- Instalación de GCC ---

# 1. Instalar GCC (ejemplo para Debian/Ubuntu):
sudo apt update
sudo apt install build-essential
# 'build-essential' instala GCC, g++, make y otras herramientas de desarrollo básicas.

# 2. Verificar la versión de GCC:
gcc --version
g++ --version # Para el compilador de C++

# --- Compilación básica de un programa C ---

# Programa de ejemplo (guárdalo como 'hello.c'):
# include <stdio.h>
#
# int main() {
#     printf("¡Hola desde el mundo C!\n");
#     return 0;
# }

# 3. Compilar el programa C:
gcc hello.c -o hello
# -o hello: Especifica el nombre del archivo de salida (ejecutable).
# Si no usas '-o', el ejecutable por defecto se llamará 'a.out'.

# 4. Ejecutar el programa compilado:
./hello

# --- Compilación de un programa C++ ---

# Programa de ejemplo (guárdalo como 'hello.cpp'):
# include <iostream>
#
# int main() {
#     std::cout << "¡Hola desde el mundo C++!" << std::endl;
#     return 0;
# }

# 5. Compilar el programa C++:
g++ hello.cpp -o hello_cpp

# 6. Ejecutar el programa C++ compilado:
./hello_cpp

# --- Opciones de compilación comunes ---

# 7. Compilar con advertencias (recomendado para desarrollo):
gcc -Wall -Wextra hello.c -o hello_warn
# -Wall: Habilita la mayoría de las advertencias.
# -Wextra: Habilita advertencias adicionales.

# 8. Compilar con optimizaciones (para producción):
gcc -O2 hello.c -o hello_optimized
# -O2: Nivel de optimización 2 (hay -O1, -O3, -Os, etc.).

# 9. Compilar solo hasta el archivo objeto (sin enlazar):
gcc -c hello.c -o hello.o
# Esto genera 'hello.o' (un archivo objeto) que puede ser enlazado más tarde.

# 10. Enlazar archivos objeto con librerías:
# Si tu programa usa la librería matemática (ej. `sqrt()`), necesitas enlazarla:
# gcc my_math_program.c -o my_math_program -lm
# -lm: Enlaza con la librería matemática.

# Errores comunes:
# - No instalar 'build-essential' antes de intentar usar gcc/g++.
# - Olvidar el `./` para ejecutar el programa (ej. solo escribir 'hello' en lugar de './hello').
# - No enlazar con las librerías necesarias (resulta en errores de "undefined reference").
# - Ignorar las advertencias del compilador; a menudo, son indicativos de posibles errores lógicos.
'''
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Entorno de Desarrollo',
    'topic': 'Herramientas de Desarrollo',
    'subtopic': 'Make y CMake básico',
    'definition': '''
Cuando tus proyectos de software crecen más allá de un solo archivo fuente, compilar todo manualmente con `gcc` se vuelve una pesadilla. Necesitas una forma de automatizar el proceso de compilación, de manera que solo se recompilen las partes que realmente han cambiado. Aquí es donde entran `Make` y `CMake`.

¿Te estás preguntando por qué estas herramientas son tan necesarias? 

Pensemos por un momento en la gestión de proyectos grandes.

* **Make:** Es una utilidad clásica y fundamental para la automatización de la construcción de software. Utiliza un archivo llamado `Makefile` donde defines reglas sobre cómo construir tu programa, incluyendo qué archivos fuente dependen de cuáles, cómo compilarlos, cómo enlazarlos y cómo limpiar el proyecto. Su principal ventaja es que solo recompila lo que es necesario, lo que acelera enormemente el ciclo de desarrollo en proyectos grandes. Es como tener un chef que solo prepara los ingredientes que faltan o se estropearon, en lugar de cocinar todo el plato desde cero cada vez.

* **CMake:** Es una herramienta de "generación de sistemas de construcción". A diferencia de Make, CMake no compila directamente el código. En su lugar, lee archivos de configuración llamados `CMakeLists.txt` (que son más abstractos y multiplataforma) y genera los `Makefiles` (u otros archivos de proyecto para Visual Studio, Xcode, etc.) que luego `Make` (o el sistema de construcción nativo) usa para compilar. CMake es la solución moderna para gestionar proyectos complejos que necesitan compilarse en diferentes sistemas operativos o con diferentes compiladores. Es el director de orquesta que prepara las partituras (Makefiles) para los músicos (Make) antes de que empiecen a tocar.

En resumen, Make te ayuda a compilar tu código de manera eficiente en Linux, mientras que CMake te ayuda a generar los archivos de construcción para que tu proyecto sea portable y fácil de compilar en cualquier lugar. Para proyectos de C/C++ serios, entender la sinergia entre estas dos herramientas es crucial.
''',
    'code_example': r'''
# Make y CMake básico

# --- Uso básico de Make ---

# 1. Crear un programa de ejemplo (guárdalo como 'main.c'):
# include <stdio.h>
# include "func.h"
#
# int main() {
#     printf("¡Hola desde main!\n");
#     print_func();
#     return 0;
# }

# 2. Crear un archivo de cabecera (guárdalo como 'func.h'):
#ifndef FUNC_H
#define FUNC_H
#
# void print_func();
#
#endif

# 3. Crear otro archivo fuente (guárdalo como 'func.c'):
# include <stdio.h>
# include "func.h"
#
# void print_func() {
#     printf("¡Hola desde func!\n");
# }

# 4. Crear un 'Makefile' en el mismo directorio:
# nano Makefile

# Contenido del Makefile:
# CC = gcc
# CFLAGS = -Wall -Wextra

# # Regla por defecto para construir el ejecutable
# all: my_program

# my_program: main.o func.o
# 	$(CC) $(CFLAGS) main.o func.o -o my_program

# main.o: main.c func.h
# 	$(CC) $(CFLAGS) -c main.c

# func.o: func.c func.h
# 	$(CC) $(CFLAGS) -c func.c

# # Regla para limpiar los archivos generados
# clean:
# 	rm -f *.o my_program

# 5. Compilar el proyecto usando Make:
make
# Esto ejecutará las reglas para crear 'my_program'.

# 6. Ejecutar el programa:
./my_program

# 7. Limpiar el proyecto:
make clean

# --- Uso básico de CMake ---

# 8. Instalar CMake:
sudo apt install cmake # Debian/Ubuntu
# sudo dnf install cmake # Red Hat/CentOS/Fedora

# 9. Crear el mismo programa de ejemplo, pero ahora necesitas un 'CMakeLists.txt'.
# Borra el 'Makefile' si lo creaste antes.

# 10. Crear un 'CMakeLists.txt' en el mismo directorio:
# nano CMakeLists.txt

# Contenido del CMakeLists.txt:
# cmake_minimum_required(VERSION 3.10)
# project(MyProject C CXX) # C y C++ si usas ambos

# # Añade el ejecutable y sus archivos fuente
# add_executable(my_program main.c func.c)

# 11. Crear un directorio para la construcción (build) y navegar a él:
mkdir build
cd build

# 12. Generar los Makefiles (u otros archivos de proyecto) con CMake:
cmake ..
# Los '..' indican que el CMakeLists.txt está en el directorio padre.

# 13. Compilar el proyecto usando Make (ahora generado por CMake):
make

# 14. Ejecutar el programa:
./my_program

# 15. Limpiar el directorio de construcción:
# Puedes simplemente eliminar el directorio 'build':
# cd ..
# rm -rf build

# Errores comunes:
# - En Make, errores de tabulación en el Makefile (las acciones deben comenzar con una tabulación, no espacios).
# - No especificar correctamente las dependencias en el Makefile, lo que lleva a recompilaciones innecesarias o fallos.
# - En CMake, olvidar ejecutar `cmake ..` en el directorio de construcción antes de `make`.
# - No entender que CMake *genera* los Makefiles, y Make es quien *ejecuta* la compilación.
'''
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Entorno de Desarrollo',
    'topic': 'Herramientas de Desarrollo',
    'subtopic': 'Control de versiones (Git básico)',
    'definition': '''
Si estás desarrollando software, trabajar sin un "sistema de control de versiones" es como escribir una novela sin guardar borradores y sin un historial de cambios. Es un desastre esperando a ocurrir. El control de versiones te permite llevar un registro de cada cambio que haces en tu código, volver a versiones anteriores, colaborar con otros desarrolladores de forma eficiente y gestionar diferentes ramas de desarrollo. En el mundo moderno, Git es, sin lugar a dudas, el rey de los sistemas de control de versiones.

¿Te estás preguntando por qué Git es tan indispensable? 

Pensemos por un momento en la colaboración y la seguridad de tu código.

* **Historial completo:** Git guarda cada versión de tu código, permitiéndote ver quién hizo qué cambio, cuándo y por qué. Si algo se rompe, puedes identificar rápidamente el cambio que lo causó y revertirlo.
* **Colaboración:** Permite que múltiples personas trabajen en el mismo proyecto al mismo tiempo sin sobrescribirse los cambios. Los "branches" (ramas) son una característica clave que te permite trabajar en nuevas funcionalidades o correcciones de errores de forma aislada sin afectar la versión principal del código.
* **Distribución:** A diferencia de sistemas centralizados, Git es distribuido, lo que significa que cada desarrollador tiene una copia completa de todo el historial del proyecto. Esto lo hace robusto y permite trabajar sin conexión. Plataformas como GitHub, GitLab y Bitbucket se construyen sobre Git y facilitan la colaboración remota.
* **Flexibilidad:** Git es extremadamente potente y flexible, adaptándose a casi cualquier flujo de trabajo de desarrollo (Git Flow, GitHub Flow, etc.).

Dominar los comandos básicos de Git es una de las habilidades más fundamentales y requeridas para cualquier desarrollador de software hoy en día. Es la herramienta que te permite navegar por la complejidad del desarrollo en equipo y mantener tu código seguro y organizado.
''',
    'code_example': r'''
# Control de versiones: Git básico

# --- Configuración inicial de Git (haz esto una vez) ---

# 1. Configurar tu nombre de usuario:
git config --global user.name "Tu Nombre"

# 2. Configurar tu correo electrónico:
git config --global user.email "tu_email@ejemplo.com"

# 3. (Opcional) Configurar tu editor por defecto para mensajes de commit:
git config --global core.editor "nano" # O "vim", "code --wait", etc.

# --- Inicio de un proyecto Git ---

# 4. Crear un nuevo repositorio Git en un directorio existente:
mkdir my_git_project
cd my_git_project
git init
# Esto crea un subdirectorio oculto '.git/' que contendrá todo el historial.

# 5. Clonar un repositorio existente desde GitHub (o similar):
# git clone https://github.com/usuario/nombre_repo.git
# cd nombre_repo

# --- Flujo de trabajo básico de Git ---

# 6. Crear/modificar archivos (ej. 'README.md'):
echo "# Mi Proyecto Git" > README.md
echo "Este es mi primer archivo en Git." >> README.md

# 7. Ver el estado actual del repositorio:
git status
# Te mostrará qué archivos han sido modificados, añadidos o no rastreados.

# 8. Añadir archivos al "staging area" (área de preparación):
git add README.md
# O para añadir todos los cambios en el directorio actual: git add .

# 9. Confirmar los cambios (commit):
git commit -m "Initial commit: Added README file"
# -m: Mensaje del commit. Un buen mensaje de commit es descriptivo.

# 10. Ver el historial de commits:
git log
# Presiona 'q' para salir.

# --- Ramas (Branches) básicas ---

# 11. Listar ramas:
git branch
# La rama actual se marca con un asterisco.

# 12. Crear una nueva rama:
git branch nueva-funcionalidad

# 13. Cambiar a una nueva rama:
git checkout nueva-funcionalidad
# O, para crear y cambiar a una rama en un solo paso: git checkout -b otra-funcionalidad

# 14. (En la nueva rama) Hacer cambios y commit:
echo "Esto es un cambio en la nueva funcionalidad." >> new_feature.txt
git add new_feature.txt
git commit -m "Added new feature file"

# 15. Volver a la rama principal (master/main):
git checkout main

# 16. Fusionar (merge) los cambios de la nueva rama a la rama principal:
git merge nueva-funcionalidad
# Si hay conflictos, Git te lo notificará y deberás resolverlos manualmente.

# 17. Eliminar una rama (después de fusionarla):
git branch -d nueva-funcionalidad

# --- Trabajo con repositorios remotos (ej. GitHub) ---

# 18. Empujar (push) tus cambios locales al repositorio remoto:
git push origin main
# 'origin' es el nombre por defecto del remoto, 'main' es la rama.

# 19. Traer (pull) los últimos cambios del repositorio remoto:
git pull origin main
# Esto descarga y fusiona los cambios del remoto.

# Errores comunes:
# - Olvidar hacer 'git add' antes de 'git commit', lo que resulta en un commit vacío.
# - Confundir 'git pull' (traer y fusionar) con 'git fetch' (solo traer, no fusionar).
# - Intentar hacer 'git push' sin haber configurado el remoto o sin permisos.
# - Trabajar directamente en la rama 'main'/'master' para nuevas funcionalidades en lugar de crear una rama separada.
'''
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Entorno de Desarrollo',
    'topic': 'Herramientas de Desarrollo',
    'subtopic': 'Depuración básica (gdb)',
    'definition': '''
Cuando tu código no se comporta como esperas (¡y esto sucede a menudo!), simplemente leer el código o añadir mensajes `printf` puede no ser suficiente para encontrar el problema. Necesitas un "depurador" (debugger), una herramienta que te permita ejecutar tu programa paso a paso, inspeccionar el valor de las variables, y entender el flujo de ejecución. En Linux, para programas escritos en C, C++ y otros lenguajes de bajo nivel, GDB (GNU Debugger) es la herramienta estándar y más poderosa.

¿Te estás preguntando por qué GDB es tan vital para los desarrolladores? 

Pensemos por un momento en la resolución de misterios complejos en el código.

* **Puntos de interrupción (Breakpoints):** Puedes pausar la ejecución de tu programa en líneas específicas para investigar su estado en ese momento.
* **Paso a paso:** Te permite avanzar el programa línea por línea, función por función, para seguir su lógica de ejecución.
* **Inspección de variables:** En cualquier punto de interrupción, puedes examinar el valor de las variables para ver si son lo que esperabas. Esto es crucial para identificar errores lógicos.
* **Seguimiento de pila (Stack Trace):** Si tu programa falla, GDB te mostrará la secuencia de llamadas a funciones que llevaron al error, lo que te ayuda a localizar el origen del problema.
* **Modificación en tiempo de ejecución:** En algunos casos, puedes incluso cambiar el valor de las variables o el flujo de ejecución mientras el programa está pausado, para probar soluciones rápidas.

GDB es una herramienta de línea de comandos, lo que al principio puede parecer intimidante, pero su potencia y flexibilidad son inigualables para la depuración de bajo nivel. Muchos IDEs y entornos de desarrollo utilizan GDB por debajo para proporcionar sus capacidades de depuración gráfica. Dominar GDB es una habilidad avanzada que te diferenciará y te permitirá resolver problemas de código de manera mucho más eficiente.
''',
    'code_example': '''
# Depuración básica: GDB (GNU Debugger)

# --- Preparación para GDB ---

# 1. Instalar GDB:
sudo apt install gdb # Debian/Ubuntu
# sudo dnf install gdb # Red Hat/CentOS/Fedora

# 2. Compilar tu programa con información de depuración (-g):
# Programa de ejemplo (guárdalo como 'buggy_program.c'):
# include <stdio.h>
#
# int main() {
#     int a = 5;
#     int b = 0;
#     int result;
#
#     printf("Calculando...\n");
#
#     // Esto causará una división por cero si b es 0
#     result = a / b;
#
#     printf("El resultado es: %d\n", result);
#
#     return 0;
# }

gcc -g buggy_program.c -o buggy_program
# El flag '-g' es CRUCIAL para que GDB pueda asociar el código máquina con tus líneas de código fuente.

# --- Sesión básica de GDB ---

# 3. Iniciar GDB con tu programa:
gdb ./buggy_program

# 4. Establecer un punto de interrupción (breakpoint) en una línea específica:
break 10
# 'break' o 'b' seguido del número de línea. Puedes ver el número de línea con `list`.

# 5. Listar el código fuente (para ver números de línea):
list
# o 'l'

# 6. Ejecutar el programa hasta el primer breakpoint o hasta que termine:
run
# o 'r'

# 7. Navegación paso a paso:
#   next (o 'n'): Ejecuta la siguiente línea de código, saltando sobre las llamadas a funciones.
#   step (o 's'): Ejecuta la siguiente línea de código, entrando en las llamadas a funciones.
#   continue (o 'c'): Continúa la ejecución hasta el siguiente breakpoint o el final del programa.
#   finish: Continúa hasta el final de la función actual.

# 8. Imprimir el valor de una variable:
print a
# o 'p a'

# 9. Mostrar todos los breakpoints:
info breakpoints

# 10. Eliminar un breakpoint (por su número, que se ve en 'info breakpoints'):
delete 1

# 11. Salir de GDB:
quit
# o 'q'

# --- Ejemplo de depuración de una división por cero ---

# (Dentro de GDB)
# break 10
# run
# (El programa se detendrá en la línea 'result = a / b;')
# print a
# print b
# (Verás que 'b' es 0)
# (Puedes cambiar el valor de 'b' para probar: set var b = 2)
# continue
# (Verás que el programa ahora funciona o que la división por cero ocurre en la línea esperada)

# Errores comunes:
# - No compilar el programa con el flag '-g'. Sin esto, GDB no podrá mostrar el código fuente ni los nombres de las variables.
# - Intentar depurar un programa que ya terminó su ejecución.
# - Confundir 'next' con 'step' al navegar por el código.
# - Olvidar que los cambios en las variables dentro de GDB son temporales y no afectan el código fuente.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Entorno de Desarrollo',
    'topic': 'Lenguajes de Scripting',
    'subtopic': 'Python básico para sysadmins',
    'definition': r'''
Python se ha vuelto un aliado indispensable para cualquier administrador de sistemas, incluso para aquellos que están empezando. No es un lenguaje diseñado específicamente para el sistema operativo Linux, pero su versatilidad y la gran cantidad de librerías disponibles lo hacen perfecto para automatizar tareas, gestionar configuraciones y analizar datos en un entorno Linux.

¿Te estás preguntando por qué esto importa? Pensemos por un momento en la cantidad de tareas repetitivas que un sysadmin tiene que hacer: desde crear usuarios, gestionar permisos, monitorear logs, hasta desplegar aplicaciones. Hacer todo esto manualmente no solo consume un tiempo precioso, sino que también es propenso a errores. Aquí es donde Python brilla, permitiéndote escribir scripts que hagan el trabajo por ti, de forma rápida y consistente.

Python es un lenguaje de alto nivel, lo que significa que su sintaxis es más cercana al lenguaje humano, haciéndolo relativamente fácil de aprender y leer. Para un administrador de sistemas, esto se traduce en poder escribir scripts funcionales sin tener que lidiar con la complejidad de lenguajes de bajo nivel. Puedes interactuar con el sistema operativo de varias maneras: ejecutar comandos de shell, manipular archivos y directorios, trabajar con procesos, e incluso interactuar con APIs de servicios en la nube. Por ejemplo, el módulo `os` te permite ejecutar comandos del sistema, el módulo `subprocess` te da un control más granular sobre los procesos que lanzas, y `paramiko` es excelente para automatizar tareas en servidores remotos vía SSH. La comunidad de Python es enorme y siempre activa, lo que significa que hay una infinidad de recursos, tutoriales y librerías pre-construidas que puedes usar para casi cualquier tarea que necesites automatizar.
''',
    'code_example': r'''
// Ejemplo correcto: Script básico de Python para listar archivos en un directorio
import os

def listar_archivos(directorio):
    try:
        archivos = os.listdir(directorio)
        print(f"Archivos en '{directorio}':")
        for archivo in archivos:
            print(archivo)
    except FileNotFoundError:
        print(f"Error: El directorio '{directorio}' no existe.")
    except Exception as e:
        print(f"Ocurrió un error: {e}")

if __name__ == "__main__":
    ruta_a_listar = "/var/log" # Puedes cambiar esta ruta
    listar_archivos(ruta_a_listar)

// Ejemplo incorrecto: Intentar ejecutar comandos complejos directamente con os.system sin manejo de errores
// Esto es menos seguro y más difícil de manejar para la salida o errores.
// import os
// os.system("ls -la; rm -rf /") # ¡MUY PELIGROSO! No maneja errores y puede ejecutar comandos destructivos fácilmente.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Entorno de Desarrollo',
    'topic': 'Lenguajes de Scripting',
    'subtopic': 'Perl básico',
    'definition': r'''
Perl es un lenguaje de programación con una larga historia, especialmente popular en los primeros días de la web y en la administración de sistemas. Aunque a veces se le considera "viejo", sigue siendo una herramienta poderosa y relevante para muchas tareas, especialmente aquellas que implican el procesamiento de texto y la manipulación de archivos de configuración en entornos Linux.

Seguramente pensarás de qué va todo esto y por qué te interesaría aprender un lenguaje que no suena tan "moderno" como otros. Bueno, la verdad es que Perl es increíblemente bueno para lo que fue diseñado: extraer información de archivos de texto, modificarla y generar reportes. Muchos sistemas y herramientas legadas en Linux todavía usan scripts de Perl, por lo que entenderlo te dará una ventaja significativa al trabajar con infraestructuras existentes. Además, su capacidad para trabajar con expresiones regulares lo hace extremadamente potente para tareas de búsqueda y reemplazo avanzadas.

Perl se destaca por su flexibilidad, permitiendo a los programadores escribir código de una manera muy concisa y a veces, incluso, un poco "artística". Esto puede hacer que los scripts de Perl sean un poco más difíciles de leer para los principiantes, pero una vez que te acostumbras a su estilo, te das cuenta de lo eficiente que puede ser. Es muy común ver Perl en scripts para la gestión de logs, automatización de tareas de red y en la generación de informes personalizados. A pesar de que otros lenguajes como Python han ganado terreno, Perl sigue siendo una opción robusta para tareas específicas donde la velocidad de procesamiento de texto y la concisión del código son prioritarias.
''',
    'code_example': r'''
// Ejemplo correcto: Script básico de Perl para buscar y reemplazar texto en un archivo
// Guarda este código como 'reemplazar.pl' y úsalo así: perl reemplazar.pl mi_archivo.txt
use strict;
use warnings;

my $filename = shift @ARGV;
my $old_text = "antiguo";
my $new_text = "nuevo";

open my $fh, '<', $filename or die "No se pudo abrir el archivo '$filename': $!";
my @lines = <$fh>;
close $fh;

open my $fh_out, '>', $filename or die "No se pudo escribir en el archivo '$filename': $!";
foreach my $line (@lines) {
    $line =~ s/$old_text/$new_text/g; // Reemplaza todas las ocurrencias
    print $fh_out $line;
}
close $fh_out;

print "Reemplazo completado en '$filename'.\n";

// Ejemplo incorrecto: No usar 'use strict' y 'use warnings', lo que puede llevar a errores sutiles.
// my $variable; // No se declara con 'my'
// $variabl = "hola"; // Error de tipografía que no sería detectado sin 'use strict'
// print $variabl;
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Entorno de Desarrollo',
    'topic': 'Lenguajes de Scripting',
    'subtopic': 'Ruby básico',
    'definition': r'''
Ruby es un lenguaje de programación dinámico y de código abierto que se enfoca en la simplicidad y la productividad. Aunque quizás sea más conocido por el framework Ruby on Rails para desarrollo web, Ruby también es una excelente opción para escribir scripts de administración de sistemas en Linux gracias a su sintaxis elegante y legible.

No sé tú, pero a mí esto al principio me costó entenderlo: ¿otro lenguaje más para scripting? La verdad es que Ruby ofrece una experiencia de desarrollo muy amigable, lo que lo hace ideal para automatizar tareas repetitivas y gestionar recursos del sistema. Su filosofía "menos código, más acción" significa que puedes lograr mucho con menos líneas de código, lo cual es fantástico para scripts rápidos que necesitas escribir.

Ruby tiene una sintaxis muy natural, casi como escribir en inglés, lo que facilita la lectura y el mantenimiento de los scripts. Para un sysadmin, esto se traduce en la capacidad de crear herramientas personalizadas de forma rápida y eficiente. Puedes usar Ruby para interactuar con la línea de comandos, manipular archivos, gestionar procesos e incluso interactuar con APIs de servicios en la nube. El ecosistema de gemas (librerías de Ruby) es muy rico, con muchas opciones para tareas de administración, como la gestión de paquetes, la interacción con bases de datos y la automatización de la infraestructura. Además, la comunidad de Ruby es muy activa y colaborativa, lo que asegura que siempre encontrarás recursos y apoyo cuando los necesites.
''',
    'code_example': r'''
// Ejemplo correcto: Script básico de Ruby para verificar si un servicio está corriendo
# Guarda este código como 'verificar_servicio.rb' y ejecútalo con: ruby verificar_servicio.rb
def verificar_servicio(nombre_servicio)
  `systemctl is-active #{nombre_servicio}`.strip
end

servicio_a_verificar = "apache2" # Cambia esto por el nombre de tu servicio

estado = verificar_servicio(servicio_a_verificar)

if estado == "active"
  puts "El servicio '#{servicio_a_verificar}' está corriendo. ✅"
else
  puts "El servicio '#{servicio_a_verificar}' no está corriendo. ❌ Estado: #{estado}"
end

// Ejemplo incorrecto: Intentar ejecutar comandos del sistema sin capturar la salida o errores
// system("rm -rf /") # ¡PELIGROSO! Ejecuta el comando directamente sin verificación.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Entorno de Desarrollo',
    'topic': 'Lenguajes de Scripting',
    'subtopic': 'Comparativa de lenguajes',
    'definition': r'''
Cuando hablamos de lenguajes de scripting para administración de sistemas en Linux, es común que surjan debates sobre cuál es el "mejor". La verdad es que no hay una respuesta única, ya que cada lenguaje (Python, Perl, Ruby, Bash) tiene sus fortalezas y debilidades, y la elección ideal depende mucho de la tarea específica y de tus preferencias personales.

Seguramente te preguntarás cuál deberías aprender primero o cuál te conviene más. La clave está en entender el panorama general. Pensemos por un momento en las tareas que un sysadmin realiza a diario: desde la automatización de tareas simples, el procesamiento de texto complejo, hasta la orquestación de infraestructuras. Cada lenguaje está optimizado para diferentes aspectos de este trabajo.

Bash es el lenguaje nativo de la shell de Linux y es excelente para tareas rápidas y directas, como encadenar comandos o realizar operaciones básicas de archivos. Es fundamental para cualquier administrador de sistemas, ya que es el lenguaje en el que te comunicas directamente con el sistema. Sin embargo, para tareas más complejas, con lógica avanzada, manejo de errores robusto o interacción con APIs, Bash puede volverse engorroso. Aquí es donde Python, Perl y Ruby entran en juego. Python se ha ganado la popularidad por su legibilidad, su vasta colección de librerías (especialmente para red y automatización de la nube) y su curva de aprendizaje suave, lo que lo hace ideal para casi cualquier tarea de scripting avanzada. Perl, aunque a veces visto como "viejo", sigue siendo un campeón insuperable para el procesamiento de texto y expresiones regulares, siendo muy potente para manipular archivos de configuración y logs. Ruby, por su parte, ofrece una sintaxis muy elegante y orientada a objetos, lo que facilita la escritura de scripts limpios y mantenibles, especialmente si ya estás familiarizado con el desarrollo orientado a objetos o si buscas un lenguaje que fomente la productividad. La mejor estrategia es dominar Bash para lo esencial y luego elegir uno de los otros lenguajes (Python es una apuesta segura para empezar) para las tareas más complejas y específicas.
''',
    'code_example': r'''
// No se aplica un ejemplo de código único para una comparativa de lenguajes.
// Sin embargo, se pueden mostrar pequeños fragmentos de código de cada lenguaje para ilustrar puntos:

// Bash (para una tarea simple de listado y filtrado)
// ls -la /var/log | grep "auth.log"

// Python (para una tarea similar pero con más control programático)
// import os
// for filename in os.listdir("/var/log"):
//     if "auth.log" in filename:
//         print(filename)

// Perl (para procesamiento de texto avanzado)
// # perl -pe 's/ERROR/WARNING/g' server.log > new_server.log

// Ruby (para interacción con el sistema)
// # `ps aux | grep "nginx"`.each_line do |line|
// #   puts line if line.include?("worker")
// # end
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Entorno de Desarrollo',
    'topic': 'Automatización Básica',
    'subtopic': 'Introducción a Ansible',
    'definition': r'''
Ansible es una herramienta de automatización que te permite configurar sistemas, desplegar software y orquestar tareas avanzadas como actualizaciones continuas o puestas en marcha de servidores sin tener que escribir un montón de scripts en Bash o Python para cada cosa. Es una de las herramientas más populares para la "infraestructura como código", lo que significa que puedes describir cómo quieres que sea tu infraestructura usando archivos de texto sencillos.

¿Te estás preguntando por qué Ansible es tan importante? La verdad es que facilita muchísimo la vida de cualquier administrador de sistemas. Pensemos por un momento en un escenario donde tienes diez, cincuenta o incluso cientos de servidores que necesitan la misma configuración o la misma actualización. Hacer esto manualmente sería una locura, ¿verdad? Ansible te permite definir esa configuración una sola vez y aplicarla a todos tus servidores de forma consistente y sin errores. Lo mejor de todo es que es "agentless", lo que significa que no necesitas instalar ningún software especial en los servidores remotos, solo SSH, lo cual simplifica mucho la configuración y el mantenimiento.

Ansible utiliza archivos YAML para describir las tareas, lo que hace que sus "playbooks" (como se llaman los archivos de configuración) sean muy legibles y fáciles de entender, incluso para quienes no son programadores. Puedes definir variables, bucles, condiciones, y ejecutar tareas en paralelo en múltiples máquinas. Desde instalar paquetes, copiar archivos, reiniciar servicios, hasta gestionar usuarios y permisos, Ansible puede con todo. Empresas como Atlassian y NASA utilizan Ansible para gestionar sus infraestructuras, demostrando su escalabilidad y fiabilidad en entornos complejos. Su curva de aprendizaje es bastante amigable, lo que lo convierte en una excelente primera herramienta de automatización para empezar a gestionar infraestructuras.
''',
    'code_example': r'''
// Ejemplo correcto: Un playbook básico de Ansible para instalar Nginx en un servidor Ubuntu
// Guarda esto como 'install_nginx.yml'
---
- name: Instalar y configurar Nginx
  hosts: webservers # Este es un grupo de hosts definido en tu archivo de inventario
  become: yes         # Ejecutar las tareas como root (con sudo)

  tasks:
    - name: Actualizar caché de apt e instalar Nginx
      ansible.builtin.apt:
        name: nginx
        state: present
        update_cache: yes

    - name: Asegurar que Nginx esté corriendo y habilitado al inicio
      ansible.builtin.systemd:
        name: nginx
        state: started
        enabled: yes

    - name: Copiar un archivo de configuración simple de Nginx (opcional)
      ansible.builtin.copy:
        content: "<h1>Hola desde Ansible!</h1>"
        dest: /var/www/html/index.html
        mode: '0644'

// Ejemplo incorrecto: Playbook con sintaxis YAML incorrecta o sangría inconsistente
// - name: Este playbook fallará debido a la sintaxis incorrecta
//   hosts: all
//   tasks:
//   - name: Tarea mal sangrada
//     command: echo "Hola"
//   - name: Otra tarea
//     command: echo "Mundo"
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Entorno de Desarrollo',
    'topic': 'Automatización Básica',
    'subtopic': 'Scripts de mantenimiento',
    'definition': r'''
Los scripts de mantenimiento son esas pequeñas piezas de código, generalmente escritas en Bash, Python o Perl, que te ayudan a automatizar las tareas rutinarias y repetitivas que se necesitan para mantener un sistema Linux en óptimas condiciones. Piensa en ellos como tus asistentes personales para el servidor, haciendo el trabajo pesado por ti.

¿Te estás preguntando por qué esto es tan crucial? Pensemos por un momento en las tareas que realizamos a diario: limpieza de archivos temporales, rotación de logs, verificación de espacio en disco, actualización de paquetes, etc. Hacer todo esto manualmente no solo consume un tiempo valioso, sino que también aumenta el riesgo de errores humanos. Los scripts de mantenimiento garantizan que estas tareas se ejecuten de manera consistente y eficiente, liberándote para enfocarte en problemas más complejos y estratégicos. La idea es que tu sistema se cuide a sí mismo, o al menos gran parte de él.

Un buen script de mantenimiento no solo ejecuta comandos, sino que también maneja errores, registra su actividad (logs) y, si es posible, notifica si algo sale mal. Pueden ser tan simples como un script que elimine archivos antiguos en un directorio específico o tan complejos como uno que revise la salud de varios servicios y genere un informe. La clave es identificar las tareas que se repiten con frecuencia y que tienen un patrón claro, y luego convertirlas en código. Por ejemplo, podrías tener un script que se ejecute todas las noches para limpiar los logs antiguos o uno que verifique el uso de CPU y RAM y te envíe una alerta si superan cierto umbral. Estos scripts son la columna vertebral de una administración de sistemas eficiente y proactiva, y te permitirán mantener tu infraestructura en buen estado con el mínimo esfuerzo manual.
''',
    'code_example': r'''
// Ejemplo correcto: Script de Bash para limpiar archivos de log antiguos
#!/bin/bash

LOG_DIR="/var/log"
DAYS_TO_KEEP=7

echo "Iniciando limpieza de logs en $LOG_DIR..."

# Buscar y eliminar archivos .log de más de N días
find "$LOG_DIR" -type f -name "*.log" -mtime +"$DAYS_TO_KEEP" -exec rm {} \;

# Eliminar archivos .gz de más de N días (si los logs se comprimen)
find "$LOG_DIR" -type f -name "*.gz" -mtime +"$DAYS_TO_KEEP" -exec rm {} \;

echo "Limpieza de logs completada. Archivos de más de $DAYS_TO_KEEP días eliminados."

// Ejemplo incorrecto: Un script de mantenimiento con comandos muy genéricos y sin validación
// #!/bin/bash
// # rm -rf /tmp/* # Peligroso si /tmp contiene algo importante o si no hay validación
// # exit 0
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Entorno de Desarrollo',
    'topic': 'Automatización Básica',
    'subtopic': 'Automatización de backups',
    'definition': r'''
La automatización de backups consiste en utilizar scripts o herramientas para realizar copias de seguridad de tus datos de forma regular y sin intervención manual. Es uno de esos aspectos de la administración de sistemas donde la automatización no es solo una comodidad, sino una necesidad absoluta.

Seguramente pensarás que hacer copias de seguridad es obvio, pero ¿te has preguntado qué pasa si se te olvida un día o si el proceso manual falla? Pensemos por un momento en la tranquilidad que te da saber que tus datos están seguros, incluso si algo sale mal. La automatización de backups elimina el error humano, asegura la consistencia de las copias y te permite recuperar información vital rápidamente en caso de desastre, ya sea un fallo de hardware, una eliminación accidental o un ataque de ransomware. Es la póliza de seguro de tu infraestructura.

Un sistema de backup automatizado bien configurado implicará no solo la copia de los archivos, sino también la verificación de la integridad de los backups, la gestión de la retención de versiones antiguas y la notificación de éxitos o fallos. Puedes usar herramientas como `rsync` para sincronizar directorios de forma eficiente, `tar` y `gzip` para comprimir y empaquetar archivos, o incluso soluciones más avanzadas como `BorgBackup` o `Duplicity` para backups cifrados y deduplicados. Los scripts de backup suelen ejecutarse a través de `cron` en Linux, lo que te permite programar su ejecución a intervalos regulares (diarios, semanales, etc.). La automatización de backups es una práctica fundamental que te salvará de muchos dolores de cabeza y te permitirá dormir tranquilo sabiendo que tus datos están protegidos.
''',
    'code_example': r'''
// Ejemplo correcto: Script de Bash para realizar un backup simple con tar y gzip
#!/bin/bash

SOURCE_DIR="/var/www/html" # Directorio a respaldar
BACKUP_DIR="/mnt/backups/web" # Directorio de destino del backup
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="web_backup_$DATE.tar.gz"

echo "Iniciando backup de $SOURCE_DIR a $BACKUP_DIR/$BACKUP_FILE..."

mkdir -p "$BACKUP_DIR" # Asegura que el directorio de backups exista

tar -czf "$BACKUP_DIR/$BACKUP_FILE" "$SOURCE_DIR"

if [ $? -eq 0 ]; then
  echo "Backup completado exitosamente: $BACKUP_FILE"
else
  echo "Error durante el backup."
fi

// Ejemplo incorrecto: Script de backup que sobrescribe backups anteriores sin control de versiones
// #!/bin/bash
// # SOURCE_DIR="/data"
// # BACKUP_FILE="/backups/data_backup.tar.gz"
// # tar -czf "$BACKUP_FILE" "$SOURCE_DIR" # Esto sobrescribirá el archivo cada vez
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Entorno de Desarrollo',
    'topic': 'Automatización Básica',
    'subtopic': 'Reportes automáticos',
    'definition': r'''
Los reportes automáticos son scripts o herramientas que se encargan de recopilar información del sistema (como el uso de recursos, el estado de los servicios, los logs, etc.) y presentarla de una forma legible y estructurada, todo ello sin intervención manual. En lugar de revisar logs o ejecutar comandos manualmente cada día, dejas que el sistema te entregue un resumen.

¿Te estás preguntando por qué esto es tan útil? Pensemos por un momento en un escenario donde necesitas saber el estado de tus servidores cada mañana o al final del día. En lugar de conectarte a cada uno y revisar, ¿no sería genial recibir un email con un resumen o ver un panel? Los reportes automáticos te permiten mantenerte informado sobre la salud y el rendimiento de tus sistemas de manera proactiva, detectando problemas antes de que se conviertan en emergencias. Te ahorran tiempo y te dan una visión clara de lo que está sucediendo sin tener que buscar la información.

Estos reportes pueden ser tan simples como un email diario con el espacio en disco restante de los servidores o tan complejos como un dashboard web que muestre métricas en tiempo real. Puedes usar comandos de Linux como `df`, `du`, `top`, `free`, `journalctl` o `grep` para extraer la información, y luego procesarla con scripts en Bash, Python o Perl para darle formato. Por ejemplo, podrías tener un script Python que recoja el uso de la CPU y la memoria, formatee esa información en un archivo HTML o un PDF, y luego lo envíe por correo electrónico a tu equipo. La automatización de reportes es una forma efectiva de asegurar que siempre estés al tanto del estado de tu infraestructura, permitiéndote tomar decisiones informadas y reaccionar rápidamente ante cualquier anomalía.
''',
    'code_example': r'''
// Ejemplo correcto: Script de Bash para generar un reporte básico de uso de disco y enviarlo por correo
#!/bin/bash

REPORT_FILE="/tmp/disk_usage_report.txt"
RECIPIENT="tu_correo@ejemplo.com"
SUBJECT="Reporte diario de uso de disco - $(hostname)"

echo "Generando reporte de uso de disco..."

echo "Reporte de uso de disco para $(hostname) - $(date)" > "$REPORT_FILE"
echo "---------------------------------------------------" >> "$REPORT_FILE"
df -h >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo "Uso de i-nodos:" >> "$REPORT_FILE"
df -hi >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo "Uso de memoria:" >> "$REPORT_FILE"
free -h >> "$REPORT_FILE"

# Enviar el reporte por correo (requiere que 'mail' o 'sendmail' esté configurado)
mail -s "$SUBJECT" "$RECIPIENT" < "$REPORT_FILE"

echo "Reporte enviado a $RECIPIENT."

// Ejemplo incorrecto: Generar un reporte ilegible o sin información relevante
// #!/bin/bash
// # echo "Datos crudos:" > /tmp/reporte.txt
// # dmesg >> /tmp/reporte.txt # Mucha información irrelevante para un reporte diario
'''
  });
}

Future<void> insertJrLevel6DataLinux(Database db) async {
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Preparación para Certificaciones Junior',
    'topic': 'LFCS (Linux Foundation Certified System Administrator)',
    'subtopic': 'Objetivos del examen',
    'definition': r'''
El examen LFCS (Linux Foundation Certified System Administrator) es una certificación diseñada para validar tus habilidades prácticas en la administración de sistemas Linux. A diferencia de otros exámenes que son teóricos, este se enfoca en que demuestres lo que sabes hacer en un entorno de línea de comandos real.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en la importancia de tener una certificación que respalde tus conocimientos. La Linux Foundation, que organiza este examen, es una entidad muy respetada en el mundo del código abierto, y una certificación LFCS demuestra a los empleadores que tienes las habilidades necesarias para trabajar como administrador de sistemas Linux de nivel junior. El objetivo principal del examen es evaluar tu capacidad para realizar tareas fundamentales de administración de sistemas, desde la configuración inicial hasta la resolución de problemas básicos.

Los objetivos del examen cubren una variedad de temas que son esenciales para cualquier sysadmin. No se trata solo de memorizar comandos, sino de entender cómo funcionan y cómo aplicarlos para resolver problemas reales. Por ejemplo, te evaluarán en la instalación y configuración de sistemas Linux, la gestión de usuarios y grupos, la manipulación de archivos y directorios, la gestión de procesos, la configuración de redes básicas, la gestión de paquetes, y la automatización de tareas con scripts. En resumen, el examen LFCS busca asegurar que eres capaz de operar y mantener un sistema Linux de forma efectiva y segura. Es una prueba rigurosa, pero superarla te abrirá muchas puertas en el campo de la administración de sistemas.
''',
    'code_example': r'''
// No aplica un ejemplo de código para este subtopic, ya que se trata de objetivos de examen.
// El enfoque es conceptual sobre qué se evalúa en la certificación LFCS.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Preparación para Certificaciones Junior',
    'topic': 'LFCS (Linux Foundation Certified System Administrator)',
    'subtopic': 'Áreas clave',
    'definition': r'''
Las áreas clave del examen LFCS son los pilares sobre los que se construye la evaluación de tus habilidades como administrador de sistemas Linux. Son los grandes grupos de temas y funcionalidades que la Linux Foundation considera esenciales para un profesional de nivel junior.

Seguramente pensarás de qué va todo esto y qué deberías priorizar en tu estudio... 

La verdad es que entender estas áreas es fundamental para estructurar tu preparación. El examen LFCS se divide en varias categorías importantes, cada una con un peso específico en la puntuación final. Pensemos por un momento en cómo un administrador de sistemas interactúa con Linux día a día: necesita instalarlo, configurarlo, gestionarlo, solucionar problemas y asegurarse de que esté seguro. Estas áreas clave reflejan ese flujo de trabajo.

Algunas de las áreas clave incluyen:
* **Fundamentos de Linux:** Aquí entran los conceptos básicos del sistema de archivos, permisos, usuarios y grupos, y comandos esenciales como `ls`, `cd`, `pwd`, `mkdir`, `rm`, `cp`, `mv`[cite: 3].
* **Operación de sistemas en ejecución:** Esto abarca la gestión de procesos (`ps`, `top`, `kill`), servicios (`systemd`), logs del sistema (`/var/log`), y la programación de tareas con `cron`[cite: 4, 5].
* **Gestión de almacenamiento:** Se refiere a la partición de discos (`fdisk`, `parted`), la creación y montaje de sistemas de archivos (`mkfs`, `mount`), y el uso de espacio en disco (`df`, `du`)[cite: 7, 8].
* **Redes:** Incluye comandos básicos de red (`ping`, `ifconfig/ip`, `netstat/ss`), configuración de red básica y SSH[cite: 5].
* **Administración de usuarios y grupos:** Creación, modificación y eliminación de usuarios y grupos, y el uso de `sudo`[cite: 5].
* **Gestión de paquetes:** Uso de gestores de paquetes como `apt`, `yum/dnf`, `rpm`, `dpkg`[cite: 5].
* **Shell scripting:** Conocimientos básicos de Bash, variables, redirección, pipes y estructuras de control[cite: 6].

Dominar estas áreas te dará una base sólida no solo para el examen, sino también para tu carrera profesional en Linux.
''',
    'code_example': r'''
// No aplica un ejemplo de código para este subtopic, ya que se trata de áreas clave de examen.
// El enfoque es conceptual sobre los temas que se evalúan.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Preparación para Certificaciones Junior',
    'topic': 'LFCS (Linux Foundation Certified System Administrator)',
    'subtopic': 'Práctica de comandos',
    'definition': r'''
La práctica de comandos es, sin lugar a dudas, la parte más crítica de tu preparación para el examen LFCS. No se trata solo de saber qué hace un comando, sino de cómo usarlo en diferentes escenarios, combinarlo con otros y depurar si algo no sale como esperas. El examen es 100% práctico, así que si no lo has hecho en la línea de comandos, es como si no lo supieras.

No sé tú, pero a mí esto al principio me costó... 

La clave para la práctica de comandos es la repetición y la simulación de escenarios reales. Pensemos por un momento en cómo aprendes a andar en bicicleta; no es leyendo un manual, ¿verdad? Es montándote y cayéndote unas cuantas veces. Lo mismo ocurre con los comandos de Linux. Necesitas un entorno de práctica donde puedas probar y equivocarte sin miedo a romper algo real. Las máquinas virtuales (VirtualBox, KVM) o entornos de laboratorio en la nube son ideales para esto.

Cada comando que aprendas debe ser ejecutado múltiples veces con diferentes opciones. Por ejemplo, no solo `ls`, sino `ls -l`, `ls -a`, `ls -lh`, `ls -R`, `ls -F`. Después, intenta combinarlos con `grep`, `awk`, `sed` o `xargs` para realizar tareas más complejas[cite: 7]. Practica la gestión de permisos con `chmod` y `chown`, la creación y eliminación de usuarios y grupos con `useradd` y `groupadd`, la gestión de servicios con `systemctl` y `service`, y la configuración de redes con `ip` o `ifconfig`[cite: 3, 4, 5]. Asegúrate de entender la salida de cada comando y cómo interpretar los posibles errores. La práctica constante te dará la fluidez y la confianza necesarias para enfrentar el examen y, más importante aún, para desempeñarte eficazmente en un entorno de producción.
''',
    'code_example': r'''
// Ejemplo correcto: Combinación de comandos para una tarea común
// Buscar todos los archivos .conf en /etc que contienen la palabra "nginx"
find /etc -name "*.conf" -type f -exec grep -l "nginx" {} +

// Crear un usuario con un home directory específico y una shell
sudo useradd -m -d /home/nuevo_usuario -s /bin/bash nuevo_usuario
sudo passwd nuevo_usuario

// Reiniciar un servicio y verificar su estado
sudo systemctl restart apache2
systemctl status apache2

// Ejemplo incorrecto: Comandos sin entender las opciones, lo que puede llevar a resultados inesperados
// rm -rf / # ¡NUNCA HAGAS ESTO! Eliminará todo el sistema.
// chmod 777 / # ¡PELIGROSO! Dará permisos de escritura a todos en la raíz.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Preparación para Certificaciones Junior',
    'topic': 'LFCS (Linux Foundation Certified System Administrator)',
    'subtopic': 'Simulacros de examen',
    'definition': r'''
Los simulacros de examen son una parte esencial de tu estrategia de preparación para el LFCS. No solo te ayudan a evaluar tus conocimientos, sino que también te familiarizan con el formato del examen, la presión del tiempo y el tipo de preguntas prácticas que encontrarás. Es como un ensayo general antes de la gran función.

¿Te estás preguntando por qué esto es tan importante? 

Pensemos por un momento en la diferencia entre estudiar los temas y realmente aplicar lo aprendido bajo presión. Un simulacro de examen replica las condiciones reales del examen LFCS, que es completamente práctico y se realiza en una máquina virtual a la que accedes remotamente. Esto significa que no basta con saber la teoría; tienes que ser capaz de ejecutar los comandos de forma precisa y eficiente en un tiempo limitado. Si no estás acostumbrado a la presión, podrías bloquearte o cometer errores que no harías en un entorno relajado.

Los simulacros te permiten identificar tus puntos débiles. Si te quedas atascado en una tarea de permisos, por ejemplo, sabes que necesitas reforzar `chmod` y `chown`[cite: 3]. Si el tiempo se te agota, es una señal de que necesitas ser más rápido o más eficiente con tus comandos. Busca plataformas o recursos que ofrezcan entornos de laboratorio similares al examen real. Algunos proveedores de cursos de certificación suelen incluir simulacros con escenarios realistas. Durante el simulacro, intenta cronometrarte, no uses recursos externos (como Google) y sé lo más autónomo posible. Analiza tus errores después de cada simulacro y enfoca tu estudio en esas áreas. La idea es que cuando llegue el día del examen real, ya hayas "pasado" la prueba varias veces en un entorno controlado, lo que aumentará tu confianza y tus posibilidades de éxito.
''',
    'code_example': r'''
// No aplica un ejemplo de código para este subtopic, ya que se trata de simulacros de examen.
// El enfoque es conceptual sobre la metodología de estudio.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Preparación para Certificaciones Junior',
    'topic': 'RHCSA (Red Hat Certified System Administrator)',
    'subtopic': 'Diferencias con LFCS',
    'definition': r'''
Aunque tanto el RHCSA (Red Hat Certified System Administrator) como el LFCS (Linux Foundation Certified System Administrator) son certificaciones prácticas de administración de sistemas Linux, tienen sus propias particularidades que las hacen distintas. Entender estas diferencias es clave para decidir cuál se alinea mejor con tus objetivos profesionales.

¿Te estás preguntando por qué importa distinguir entre estas dos certificaciones? 

Pensemos por un momento en un par de herramientas: ambas cumplen una función similar, pero una está diseñada para un propósito general y la otra para un entorno específico. LFCS se enfoca en un conocimiento más general de Linux, válido para cualquier distribución (Ubuntu, Debian, Fedora, etc.), mientras que RHCSA se centra específicamente en Red Hat Enterprise Linux (RHEL) y sus derivados (como CentOS o AlmaLinux). Esto significa que las herramientas y comandos específicos de RHEL son los que predominan en el examen RHCSA.

Una diferencia importante es el ecosistema. La Linux Foundation es una organización paraguas para el código abierto, por lo que LFCS es más "agnóstico" a la distribución. Red Hat, por otro lado, es una empresa líder en soluciones empresariales de Linux, y su certificación valida tus habilidades para trabajar con sus productos. Esto se traduce en que el RHCSA suele ser más valorado en entornos corporativos que utilizan activamente RHEL. El LFCS puede ser una excelente primera certificación para demostrar habilidades fundamentales en Linux en general, mientras que el RHCSA es un paso más allá si tu objetivo es trabajar con la pila tecnológica de Red Hat. Ambos exámenes son prácticos y se realizan en un entorno de laboratorio, lo que los hace muy valiosos en el mercado laboral, pero el contexto de uso de cada uno es lo que realmente los diferencia.
''',
    'code_example': r'''
// No aplica un ejemplo de código para este subtopic, ya que se trata de diferencias entre certificaciones.
// El enfoque es conceptual sobre las características distintivas de cada una.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Preparación para Certificaciones Junior',
    'topic': 'RHCSA (Red Hat Certified System Administrator)',
    'subtopic': 'Enfoque en RHEL',
    'definition': r'''
El RHCSA (Red Hat Certified System Administrator) tiene un enfoque muy claro y definido: Red Hat Enterprise Linux (RHEL). Esto significa que cada tarea, cada comando y cada configuración que debas dominar para el examen estará directamente relacionada con la forma en que se hacen las cosas en el ecosistema de Red Hat.

No sé tú, pero a mí esto al principio me costó...

Acostumbrarse a los comandos específicos de RHEL y a las herramientas de configuración puede ser un pequeño reto si vienes de otras distribuciones como Ubuntu o Debian. Pensemos por un momento en las diferencias. Mientras que Ubuntu usa `apt` para la gestión de paquetes, RHEL usa `dnf` o `yum`. Para la configuración de red, aunque `ip` es universal, RHEL tiene herramientas adicionales como `nmcli` o `nmtui` que son prioritarias en su examen. También hay herramientas específicas para la gestión de SELinux, un componente de seguridad crucial en RHEL.

El enfoque en RHEL implica que no solo debes saber cómo realizar una tarea, sino cómo realizarla "a la manera Red Hat". Esto incluye el uso de `systemctl` para servicios, la comprensión de los directorios de configuración específicos, la gestión de almacenamiento con LVM (Logical Volume Manager) que es muy común en RHEL, y la administración de usuarios y grupos con las políticas de Red Hat. La ventaja de este enfoque es que si trabajas en un entorno empresarial, es muy probable que encuentres RHEL, y la certificación RHCSA valida directamente tus habilidades para ese entorno. Es una certificación muy valorada porque demuestra que puedes manejar un sistema Linux de nivel empresarial, lo que es un gran plus en el mercado laboral.
''',
    'code_example': r'''
// Ejemplo correcto: Gestión de paquetes en RHEL con dnf (equivalente a apt en Debian/Ubuntu)
// Instalar un paquete
sudo dnf install httpd -y

// Actualizar todos los paquetes
sudo dnf update -y

// Eliminar un paquete
sudo dnf remove httpd -y

// Ejemplo de configuración de red con nmcli (Herramienta de RHEL)
// Mostrar interfaces de red
nmcli connection show

// Activar una conexión
sudo nmcli connection up enp0s3

// Ejemplo de SELinux (específico de RHEL)
// Cambiar el contexto de SELinux de un archivo
sudo semanage fcontext -a -t httpd_sys_content_t "/var/www/html(/.*)?"
sudo restorecon -Rv /var/www/html

// Ejemplo incorrecto: Intentar usar apt en un sistema RHEL
// sudo apt install nginx # Esto no funcionará en RHEL, ya que usa dnf/yum
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Preparación para Certificaciones Junior',
    'topic': 'RHCSA (Red Hat Certified System Administrator)',
    'subtopic': 'Prácticas recomendadas',
    'definition': r'''
Para prepararte para el examen RHCSA de manera efectiva, no basta con leer la teoría. Necesitas adoptar ciertas prácticas recomendadas que te ayudarán a consolidar tus conocimientos y a desarrollar la velocidad y precisión necesarias para el examen práctico. Es como entrenar para una maratón; no solo corres el día de la carrera.

Seguramente te preguntarás cómo estudiar de la forma más eficiente... 

Pensemos por un momento en un deportista de alto rendimiento: no solo entrena, sino que tiene una rutina, una dieta y un plan. Para el RHCSA, es similar. Una de las prácticas más importantes es la **práctica constante en un entorno de laboratorio real**. Configura una máquina virtual con RHEL (puedes usar CentOS Stream o AlmaLinux como alternativas gratuitas que son casi idénticas a RHEL en funcionalidad para el examen) y haz todas las tareas posibles. No solo leas los comandos, ejecútalos.

Aquí te dejo algunas recomendaciones clave:
* **Dominar la línea de comandos:** El examen es 100% CLI. Asegúrate de ser eficiente con los comandos básicos, la redirección de entrada/salida, los pipes y las expresiones regulares.
* **Familiarízate con las herramientas de RHEL:** Dedica tiempo a `dnf`, `nmcli`, `firewalld`, `semanage` y otras herramientas específicas de Red Hat.
* **Practica la gestión de almacenamiento:** Esto incluye `fdisk`, `gdisk`, `parted`, `pvcreate`, `vgcreate`, `lvcreate`, `mount`, `unmount`, y las entradas de `/etc/fstab`.
* **Comprende y configura SELinux:** Es un componente importante de seguridad en RHEL y suele aparecer en el examen. Practica el uso de `getenforce`, `setenforce`, `semanage` y `restorecon`.
* **Control del tiempo:** Practica las tareas bajo un límite de tiempo. El examen tiene una duración específica y es fácil quedarse sin tiempo si no eres eficiente.
* **Documentación:** Aprende a usar `man pages` y `info pages` de manera efectiva. Durante el examen, no tendrás acceso a Internet, pero sí a la documentación del sistema.
* **Automatización básica:** Conoce el uso de `cron` y `at` para programar tareas.

Adoptar estas prácticas te dará la confianza y la habilidad para enfrentar cualquier escenario que se presente en el examen.
''',
    'code_example': r'''
// Ejemplo de práctica recomendada: Uso de man pages para obtener ayuda
// Este es el equivalente a buscar en Google durante el examen
man dnf
man systemctl
man lvcreate

// Ejemplo de práctica: Crear un volumen lógico (tarea común en RHCSA)
// Asegúrate de tener un disco adicional o una partición libre para practicar
// sudo pvcreate /dev/sdb1
// sudo vgcreate myvg /dev/sdb1
// sudo lvcreate -L 5G -n mylv myvg
// sudo mkfs.xfs /dev/myvg/mylv
// sudo mkdir /mnt/data
// sudo mount /dev/myvg/mylv /mnt/data
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Preparación para Certificaciones Junior',
    'topic': 'RHCSA (Red Hat Certified System Administrator)',
    'subtopic': 'Recursos de estudio',
    'definition': r'''
Cuando te embarcas en la aventura de obtener la certificación RHCSA, contar con los recursos de estudio adecuados es tan importante como la dedicación. Hay una gran cantidad de materiales disponibles, pero saber cuáles son los más efectivos te ahorrará mucho tiempo y te guiará por el camino correcto.

Seguramente te preguntarás dónde encontrar ese material de calidad... 

Pensemos por un momento en un mapa del tesoro: no vas a cualquier lado, sigues las pistas más fiables. Para el RHCSA, los recursos oficiales de Red Hat son, sin duda, el "mapa del tesoro" principal. Red Hat ofrece cursos oficiales (RH124 y RH134) que están diseñados específicamente para preparar a los estudiantes para el examen. Estos cursos, aunque tienen un costo, son la forma más directa de aprender el material tal como lo espera Red Hat.

Además de los cursos oficiales, hay otros recursos muy valiosos:
* **Documentación oficial de Red Hat:** Los manuales y la documentación en línea de RHEL son una fuente inagotable de información. Acostúmbrate a consultarlos, ya que es lo único a lo que tendrás acceso durante el examen.
* **Libros:** Existen varios libros excelentes específicamente diseñados para el RHCSA, como "RHCSA/RHCE Red Hat Enterprise Linux 8 Cert Guide" de Sander van Vugt o "RHCSA Exam Cram" de Anthony Sequeira.
* **Plataformas de cursos online:** Sitios como Udemy, Coursera o Pluralsight suelen tener cursos muy bien valorados de instructores experimentados que cubren el temario del RHCSA. Busca aquellos que incluyan laboratorios prácticos.
* **YouTube:** Canales dedicados a Linux y certificaciones pueden ofrecer tutoriales y guías paso a paso.
* **Comunidades y foros:** Participar en comunidades de Linux o foros de certificación (como Reddit r/linuxadmin o foros específicos de Red Hat) te permite hacer preguntas, compartir experiencias y obtener consejos de otros estudiantes o profesionales.
* **Entornos de laboratorio:** Como mencionamos antes, usar máquinas virtuales (con CentOS Stream o AlmaLinux) es un recurso indispensable para la práctica práctica.

Combina estos recursos, priorizando la práctica, y estarás en una excelente posición para aprobar el RHCSA.
''',
    'code_example': r'''
// No aplica un ejemplo de código para este subtopic, ya que se trata de recursos de estudio.
// El enfoque es conceptual sobre dónde encontrar material para la preparación.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Preparación para Certificaciones Junior',
    'topic': 'LPIC-1',
    'subtopic': 'Estructura del examen',
    'definition': r'''
La certificación LPIC-1 (Linux Professional Institute Certification Level 1) es una de las certificaciones más populares y reconocidas para administradores de sistemas Linux junior. A diferencia de otras, esta certificación se divide en dos exámenes separados: el 101 y el 102. Debes aprobar ambos para obtener la certificación completa.

¿Te estás preguntando por qué esta estructura es importante? 

Pensemos por un momento en un curso universitario que tiene dos partes; cada parte cubre un conjunto de temas específicos antes de pasar a la siguiente. El LPIC-1 funciona de manera similar. El examen 101 se enfoca en los fundamentos de Linux, la arquitectura del sistema, la instalación, la gestión de paquetes, los comandos básicos de GNU y Unix, y la gestión de dispositivos. El examen 102, por su parte, se centra en la configuración del shell, el scripting, la gestión de interfaces de usuario y escritorios, tareas administrativas, servicios esenciales del sistema, fundamentos de red y seguridad.

Ambos exámenes son de opción múltiple con algunas preguntas de "rellenar el espacio en blanco" y, a veces, de "coincidencia". No son exámenes prácticos en el sentido de que tengas una consola para ejecutar comandos, pero sí requieren que sepas el comando exacto, las opciones y su salida esperada. Cada examen tiene aproximadamente 60 preguntas y una duración de 90 minutos. Es fundamental que domines los temas de ambos exámenes para obtener la certificación LPIC-1. Esta estructura te permite dividir tu estudio en dos fases, lo que puede hacer que el proceso sea menos abrumador.
''',
    'code_example': r'''
// No aplica un ejemplo de código para este subtopic, ya que se trata de la estructura del examen.
// El enfoque es conceptual sobre cómo se organiza la certificación.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Preparación para Certificaciones Junior',
    'topic': 'LPIC-1',
    'subtopic': 'Temario completo',
    'definition': r'''
El temario completo del LPIC-1 es una lista detallada de todos los objetivos de conocimiento y habilidades que se evalúan en los dos exámenes (101 y 102). Es tu hoja de ruta definitiva para saber exactamente qué estudiar y en qué profundidad.

Seguramente pensarás que es muchísima información, y lo es... 

Pensemos por un momento en un libro de texto muy extenso; necesitas un índice para saber dónde está cada capítulo. El temario oficial de LPI es ese índice, y es crucial que lo revises punto por punto. No te confíes solo en un libro o un curso; asegúrate de que cubran todos los objetivos del temario, porque el examen puede preguntar sobre cualquier cosa que esté allí.

Algunos de los temas clave que cubre el temario incluyen:
**Para el examen 101:**
* **Arquitectura del sistema:** Hardware, arranque, runlevels.
* **Instalación de Linux y gestión de paquetes:** Métodos de instalación, gestión de librerías compartidas, paquetes Debian/RPM.
* **Comandos GNU y Unix:** Uso de la línea de comandos, filtros, pipes, expresiones regulares, edición de texto con `vi/vim`.
* **Dispositivos, sistemas de archivos de Linux y la Jerarquía Estándar de Sistema de Archivos (FHS):** Particiones, sistemas de archivos, montaje, permisos, enlaces, cuotas de disco.

**Para el examen 102:**
* **Shells, scripting y gestión de datos:** Personalización del shell, scripts Bash, gestión de versiones de código (introducción a Git), archivos y directorios.
* **Interfaces de usuario y escritorios:** Instalación y configuración de X11, entornos de escritorio.
* **Tareas administrativas:** Gestión de usuarios y grupos, programación de trabajos (`cron`, `at`), logs del sistema, gestión de impresoras.
* **Servicios esenciales del sistema:** Configuración de la hora, DNS, servicios de correo, servidores web.
* **Fundamentos de red:** Conceptos básicos de TCP/IP, configuración de red, resolución de problemas.
* **Seguridad:** Tareas de seguridad básicas, configuración de firewall (Netfilter/iptables), SSH.

Cada objetivo en el temario tiene un peso, lo que te indica qué tan importante es. Esto te permite priorizar tu estudio y dedicar más tiempo a los temas con mayor peso.
''',
    'code_example': r'''
// No aplica un ejemplo de código para este subtopic, ya que se trata del temario completo.
// El enfoque es conceptual sobre los temas que se evalúan en la certificación.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Preparación para Certificaciones Junior',
    'topic': 'LPIC-1',
    'subtopic': 'Estrategias de estudio',
    'definition': r'''
Estudiar para el LPIC-1 requiere una estrategia bien pensada, porque, aunque no es un examen práctico en consola, sí exige un conocimiento muy detallado de comandos, opciones y configuraciones. No se trata solo de memorizar, sino de entender cómo funcionan las cosas en Linux.

No sé tú, pero a mí esto al principio me costó... 

Intentaba memorizar todos los comandos de golpe y no funcionaba. La clave es la constancia y la combinación de diferentes métodos de estudio. Pensemos por un momento en cómo se prepara un buen chef; no solo lee recetas, sino que cocina, prueba y ajusta. Lo mismo con el LPIC-1.

Aquí te dejo algunas estrategias de estudio que te pueden ser muy útiles:
* **Usa un libro de preparación específico para LPIC-1:** Hay excelentes libros que cubren el temario de forma estructurada. Algunos populares son los de Michael Jang o los de Roderick W. Smith.
* **Combina teoría con práctica en una máquina virtual:** Aunque el examen no es práctico, necesitas ejecutar los comandos para entender sus opciones, la salida y los archivos de configuración asociados. Instala una o dos distribuciones Linux (como Debian/Ubuntu y CentOS/Fedora) en máquinas virtuales y practica cada comando del temario.
* **Crea tarjetas de estudio (flashcards):** Para comandos, opciones y archivos de configuración, las flashcards son excelentes para la memorización y el repaso rápido.
* **Haz muchos ejercicios y preguntas de práctica:** Busca bancos de preguntas y simulacros de examen. Esto te ayudará a familiarizarte con el formato de las preguntas y a identificar tus áreas débiles. LPI tiene preguntas de muestra en su sitio web, y muchos libros y cursos incluyen ejercicios.
* **Lee las man pages:** Aunque no tendrás internet en el examen, entender las man pages te da una visión profunda de los comandos. Practica buscar la información relevante rápidamente.
* **Estudia por objetivos:** El temario de LPI está dividido por objetivos. Enfócate en dominar un objetivo a la vez antes de pasar al siguiente.
* **Únete a comunidades:** Discutir con otros estudiantes en foros o grupos de estudio puede ayudarte a aclarar dudas y a entender diferentes perspectivas.

La consistencia es clave. Dedica un tiempo cada día o semana a estudiar y practicar, y verás cómo tu confianza y conocimientos aumentan.
''',
    'code_example': r'''
// No aplica un ejemplo de código para este subtopic, ya que se trata de estrategias de estudio.
// El enfoque es conceptual sobre cómo prepararse eficazmente.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Preparación para Certificaciones Junior',
    'topic': 'LPIC-1',
    'subtopic': 'Preguntas comunes',
    'definition': r'''
Las preguntas comunes en el examen LPIC-1 no son simplemente las que aparecen con frecuencia, sino aquellas que abordan conceptos fundamentales y comandos clave que todo administrador de sistemas Linux de nivel junior debe dominar. Familiarizarte con estos patrones de preguntas puede darte una ventaja significativa.

Seguramente pensarás en cómo predecir las preguntas del examen, y la verdad es que no se trata de adivinar, sino de entender los temas recurrentes. Pensemos por un momento en un profesor que siempre hace preguntas sobre los mismos conceptos importantes; el LPIC-1 tiene sus "favoritos" porque son pilares de la administración de Linux. LPI publica objetivos muy específicos, y las preguntas giran en torno a cómo realizar las tareas descritas en esos objetivos, a menudo con opciones y sintaxis muy particulares.

Algunos tipos de preguntas comunes que puedes esperar son:
* **Sintaxis de comandos:** Te pedirán la opción correcta para un comando específico (`ls -l`, `grep -i`, `find -name`).
* **Archivos de configuración:** Preguntas sobre dónde se almacenan ciertas configuraciones (`/etc/fstab`, `/etc/passwd`, `/etc/inittab` o `/etc/systemd`).
* **Permisos y propiedad:** Escenarios donde debes calcular permisos octales (`chmod`) o identificar quién es el propietario de un archivo (`chown`).
* **Gestión de paquetes:** Preguntas sobre cómo instalar, actualizar o eliminar paquetes usando `dpkg`, `apt`, `rpm` o `yum/dnf`.
* **Expresiones regulares:** Casos donde debes identificar la expresión regular correcta para un patrón de búsqueda o reemplazo.
* **Scripts Bash:** Preguntas sobre la salida de un script simple, el uso de variables, bucles o condicionales.
* **Procesos y servicios:** Cómo iniciar, detener, reiniciar o verificar el estado de un servicio (`systemctl`, `service`), o cómo matar un proceso (`kill`).
* **Redes básicas:** Configuración de direcciones IP, gateways, y comandos como `ping`, `ip` o `netstat`.
* **Uso de la documentación:** Aunque no es un comando per se, a veces te preguntan cómo encontrar información usando `man` o `info`.

La mejor manera de prepararte para estas preguntas es practicando los comandos y entendiendo a fondo los conceptos detrás de ellos. No te limites a la memorización; busca comprender por qué se usa una opción o por qué un archivo de configuración está en un lugar específico.
''',
    'code_example': r'''
// Ejemplo de tipo de pregunta: ¿Qué comando mostrará todos los archivos ocultos en el directorio actual?
// a) ls -H
// b) ls -a
// c) ls -o
// d) ls -d
// Respuesta correcta: b) ls -a

// Ejemplo de tipo de pregunta: ¿Cuál es el archivo de configuración principal para los puntos de montaje de sistemas de archivos?
// a) /etc/mounts
// b) /etc/fstab
// c) /etc/disks
// d) /proc/mounts
// Respuesta correcta: b) /etc/fstab

// Ejemplo de tipo de pregunta: ¿Qué valor de chmod otorgaría permisos de lectura, escritura y ejecución al propietario, y solo lectura y ejecución al grupo y a otros?
// a) 775
// b) 755
// c) 644
// d) 744
// Respuesta correcta: b) 755
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Preparación para Certificaciones Junior',
    'topic': 'Proyecto Final Junior',
    'subtopic': 'Configuración completa de un servidor',
    'definition': r'''
La configuración completa de un servidor es la joya de la corona de tu nivel junior, el punto donde pones en práctica todo lo aprendido en un escenario real. Aquí, te enfrentarás al desafío de levantar un servidor desde cero, asegurándote de que todas las piezas encajen y funcionen en armonía.

¿Te estás preguntando por qué esto es tan crucial? 

Pensemos por un momento en un director de orquesta; no solo conoce las notas de cada instrumento, sino que sabe cómo hacer que todos suenen juntos. Configurar un servidor completo es como dirigir esa orquesta. Es la oportunidad de integrar conceptos de instalación, redes, seguridad, servicios y automatización. No se trata solo de instalar un sistema operativo, sino de adaptarlo a una necesidad específica, ya sea un servidor web, de base de datos o de archivos.

Este proyecto te obligará a considerar aspectos como la elección de la distribución Linux adecuada, la gestión de particiones, la configuración de la red (IP estática, DNS), la instalación de servicios clave (Apache/Nginx, MySQL/PostgreSQL, SSH), la configuración de firewalls (iptables/firewalld), la gestión de usuarios y permisos, y la implementación de soluciones de backup básicas. Es el momento de aplicar tus conocimientos sobre `systemctl`, `crontab`, `rsync`, `find`, `grep` y todas esas herramientas que has estado practicando. Al final, tendrás un sistema funcional que tú mismo habrás construido, lo cual es una satisfacción enorme y una prueba tangible de tus habilidades para cualquier posible empleador.
''',
    'code_example': r'''
// Ejemplo de pasos generales para la configuración de un servidor web básico
// Este no es un script único, sino una secuencia de comandos representativa.

// 1. Actualizar el sistema
sudo apt update && sudo apt upgrade -y # Para Debian/Ubuntu
// sudo dnf update -y # Para RHEL/CentOS

// 2. Instalar un servidor web (Nginx en este caso)
sudo apt install nginx -y
// sudo dnf install nginx -y

// 3. Habilitar y arrancar el servicio Nginx
sudo systemctl enable nginx
sudo systemctl start nginx

// 4. Configurar el firewall (permitir HTTP/HTTPS)
sudo ufw enable # Solo para UFW (Ubuntu)
sudo ufw allow 'Nginx HTTP'
sudo ufw allow 'Nginx HTTPS'

// O para firewalld (RHEL/CentOS)
// sudo firewall-cmd --permanent --add-service=http
// sudo firewall-cmd --permanent --add-service=https
// sudo firewall-cmd --reload

// 5. Configurar un usuario para despliegue (ejemplo)
sudo useradd -m -s /bin/bash deployuser
sudo passwd deployuser
sudo usermod -aG sudo deployuser # Opcional: darle permisos sudo

// 6. Configurar SSH para acceso seguro (asegurarse que esté habilitado)
// sudo systemctl status ssh
// sudo systemctl enable ssh
// Configurar claves SSH para el usuario 'deployuser' (fuera de este ejemplo)
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Preparación para Certificaciones Junior',
    'topic': 'Proyecto Final Junior',
    'subtopic': 'Documentación del proceso',
    'definition': r'''
Documentar el proceso de configuración de tu servidor es casi tan importante como la configuración en sí. No es solo un paso más, es una práctica esencial que distingue a un administrador de sistemas junior de uno que ya empieza a pensar como un profesional.

¿Te estás preguntando por qué esto es tan crucial? 

Pensemos por un momento en un manual de instrucciones para armar algo; si no está bien hecho, te vas a frustrar y quizás no termines el trabajo. En el mundo de la administración de sistemas, la documentación es ese manual. Te permite a ti mismo (en el futuro) o a otros entender lo que hiciste, por qué lo hiciste y cómo replicarlo o solucionarlo si algo falla. Una buena documentación te ahorra horas de dolor de cabeza.

Tu documentación debe ser clara, concisa y completa. Incluye detalles como:
* **Requisitos iniciales:** Hardware, sistema operativo base, dependencias.
* **Pasos de instalación:** Todos los comandos ejecutados, incluyendo `apt install`, `dnf install`, `useradd`, etc.
* **Archivos de configuración modificados:** Si cambiaste `nginx.conf`, `sshd_config`, `fstab`, etc., documenta qué líneas modificaste y por qué.
* **Servicios configurados:** Nginx, Apache, MySQL, SSH, etc., con sus respectivos estados.
* **Configuración de red:** IPs, máscaras, gateways, DNS.
* **Seguridad:** Reglas de firewall, usuarios y permisos especiales, configuraciones de SELinux si aplica.
* **Automatización:** Cualquier script de mantenimiento o backup que hayas configurado, y cómo está programado (`crontab`).
* **Validación:** Cómo se verifica que todo funciona correctamente.

Puedes usar herramientas sencillas como Markdown, un documento de texto plano o incluso un wiki personal. Lo importante es que sea legible y fácil de actualizar. Una buena documentación te hará un administrador de sistemas mucho más valioso.
''',
    'code_example': r'''
// Ejemplo de un fragmento de documentación en Markdown para una sección de configuración de Nginx.
// Esto iría en un archivo .md o similar.

# Configuración de Nginx

## 1. Instalación
Se instaló Nginx utilizando el gestor de paquetes del sistema:
```bash
sudo apt update
sudo apt install nginx -y
2. Configuración del Firewall
Se habilitó UFW y se permitieron los puertos HTTP (80) y HTTPS (443):

Bash

sudo ufw enable
sudo ufw allow 'Nginx HTTP'
sudo ufw allow 'Nginx HTTPS'
sudo ufw status
3. Archivos de Configuración
Se modificó el archivo de configuración por defecto para añadir un servidor virtual simple.

Ubicación: /etc/nginx/sites-available/default

Cambios realizados:

Se actualizó el root a /var/www/html/mi_sitio.
Se añadió un bloque location / para servir el index.html.
Ejemplo de bloque de servidor virtual (simplificado):

Nginx

server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html/mi_sitio;
    index index.html index.htm;

    server_name _;

    location / {
        try_files $uri $uri/ =404;
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Preparación para Certificaciones Junior',
    'topic': 'Proyecto Final Junior',
    'subtopic': 'Solución de problemas',
    'definition': r'''
La solución de problemas, o troubleshooting, es donde realmente demuestras tu valía como administrador de sistemas. No todo va a funcionar a la primera, y la capacidad de identificar la causa de un problema y solucionarlo es una habilidad invaluable que te pondrá por delante de muchos.

¿Te estás preguntando por qué esto es tan crucial? 

Pensemos por un momento en un detective: no solo mira la escena del crimen, sino que busca pistas, las analiza y sigue un proceso lógico para encontrar al culpable. En la administración de sistemas, el "culpable" es el error, y tú eres el detective. Es frustrante cuando algo no funciona, pero es en esos momentos donde más aprendes.

Para este proyecto final, prepárate para encontrarte con errores. Podría ser un servicio que no arranca, un permiso incorrecto, un firewall bloqueando una conexión, o un archivo de configuración con un error de sintaxis. Aquí es donde usarás herramientas como:

journalctl o tail -f /var/log/syslog (o messages en RHEL) para revisar los logs del sistema y de los servicios.
systemctl status <servicio> para ver el estado de los servicios.
netstat -tulnp o ss -tulnp para verificar puertos abiertos y procesos escuchando.
ip a o ifconfig para revisar la configuración de red.
ping, traceroute, dig o nslookup para diagnosticar problemas de conectividad.
chmod, chown y ls -l para verificar permisos.
strace para rastrear llamadas al sistema de un proceso.
df -h y du -sh para problemas de espacio en disco.
Herramientas de validación específicas de servicios (ej. nginx -t para Nginx).
La clave es un enfoque metódico: observa el problema, formula una hipótesis, prueba tu hipótesis (ejecuta un comando para verificar), analiza el resultado, y repite hasta encontrar la causa. No te desesperes, cada error es una oportunidad de aprendizaje.
''',
    'code_example': r'''
// Ejemplo de comandos para troubleshooting básico
// 1. Revisar el estado de un servicio y sus logs si falla
sudo systemctl status apache2.service
sudo journalctl -xeu apache2.service # Ver logs detallados del servicio

// 2. Verificar conectividad de red
ping https://www.google.com/search?q=google.com
ip a show eth0 # Reemplaza eth0 con tu interfaz de red

// 3. Revisar puertos abiertos (si una aplicación no responde)
sudo ss -tulnp | grep :80 # Buscar qué proceso escucha en el puerto 80

// 4. Verificar permisos de un archivo o directorio
ls -l /var/www/html/index.html
namei -mo /var/www/html/index.html # Muestra la cadena de permisos

// 5. Validar la sintaxis de un archivo de configuración (para Nginx)
sudo nginx -t
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Preparación para Certificaciones Junior',
    'topic': 'Proyecto Final Junior',
    'subtopic': 'Presentación de resultados',
    'definition': r'''
La presentación de resultados de tu proyecto final no es solo el broche de oro, es tu oportunidad de mostrar todo lo que has logrado y cómo lo has hecho. Es la culminación de tu esfuerzo y la demostración de tus habilidades como administrador de sistemas Linux.

¿Te estás preguntando por qué esto es tan crucial? 

Pensemos por un momento en un ingeniero que diseña un puente; no solo lo construye, sino que lo presenta, explica sus características y resuelve dudas. En el mundo real, los administradores de sistemas a menudo tienen que presentar sus soluciones a equipos, gerentes o incluso clientes. Una buena presentación demuestra no solo tu capacidad técnica, sino también tus habilidades de comunicación.

Tu presentación debe ser clara, concisa y enfocada en los puntos clave. Aquí te dejo algunos elementos que debería incluir:

Introducción: Qué problema o necesidad abordaba tu servidor/proyecto.
Arquitectura/Diseño: Un diagrama sencillo de cómo está configurado el servidor (red, servicios, etc.).
Tecnologías utilizadas: Linux (distribución y versión), servicios (Nginx, MySQL), herramientas (Ansible, Bash).
Proceso de configuración: Un resumen de los pasos más importantes que seguiste (no una lista exhaustiva de comandos, eso va en la documentación).
Desafíos y soluciones: Los problemas que encontraste y cómo los resolviste. Esto demuestra tu capacidad de troubleshooting.
Resultados y validación: Muestra que el servidor funciona (ej. acceso a una página web, conexión a una base de datos). Puedes usar capturas de pantalla o un video corto.
Lecciones aprendidas: ¿Qué aprendiste durante el proyecto? ¿Qué harías diferente la próxima vez?
Preguntas y respuestas: Prepárate para responder preguntas sobre tu configuración, tus decisiones y los problemas que surgieron.
Puedes usar herramientas como diapositivas (PowerPoint, Google Slides, Keynote), un documento PDF bien formateado o incluso un pequeño sitio web estático. La clave es ser capaz de comunicar tu trabajo de manera efectiva, destacando tus habilidades y los logros del proyecto.
''',
    'code_example': r'''
// No aplica un ejemplo de código para este subtopic, ya que se trata de la presentación de resultados.
// El enfoque es conceptual sobre cómo comunicar el proyecto.
'''
  });
}
