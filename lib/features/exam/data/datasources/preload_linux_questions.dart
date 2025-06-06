import 'package:sqflite_common/sqlite_api.dart';
import 'package:rutacode/features/exam/data/models/exam_question_model.dart';

Future<void> preloadLinuxJrQuestions(Database db, tableName) async {
  final preloadedLinuxJrQuestions = [
    ExamQuestionModel(
      id: 'lnx_jr_01',
      questionText:
          'Te estás iniciando en el mundo de Linux y quieres entender sus orígenes y la razón de su popularidad. ¿Qué aspecto fundamental deberías investigar primero?',
      options: [
        'A) La historia y filosofía de Linux.',
        'B) Las últimas herramientas de virtualización.',
        'C) Cómo compilar el kernel desde cero.',
        'D) La optimización de bases de datos en Linux.'
      ],
      correctAnswer: 'A',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_02',
      questionText:
          'Para empezar a usar Linux, necesitas decidir cómo instalarlo. ¿Cuál de las siguientes no es una opción de instalación comúnmente utilizada para principiantes?',
      options: [
        'A) Usar VirtualBox.',
        'B) Crear un Live USB.',
        'C) Desplegar en un entorno de nube avanzado.',
        'D) Realizar una instalación dual boot.'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_03',
      questionText:
          'Acabas de instalar Ubuntu y quieres ver qué archivos hay en tu directorio actual. ¿Qué comando utilizarías para listar el contenido de un directorio?',
      options: ['A) cd', 'B) pwd', 'C) ls', 'D) mkdir'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_04',
      questionText:
          'Estás configurando un nuevo usuario en tu sistema Linux. Para asegurarte de que los archivos de ese usuario tienen los permisos correctos, necesitas entender cómo funcionan. ¿Qué comando te permite cambiar la propiedad de un archivo o directorio?',
      options: ['A) chmod', 'B) chown', 'C) ls -l', 'D) mkdir'],
      correctAnswer: 'B',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_05',
      questionText:
          'Tu sistema Linux está funcionando lento y sospechas que un proceso está consumiendo demasiados recursos. ¿Qué comando te permitiría ver los procesos que se están ejecutando en tiempo real y su consumo de recursos?',
      options: ['A) ps', 'B) kill', 'C) htop', 'D) systemd'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_06',
      questionText:
          'Necesitas ver las últimas líneas de un archivo de log para diagnosticar un problema reciente. ¿Qué comando es el más adecuado para mostrar las últimas diez líneas de un archivo?',
      options: ['A) cat', 'B) head', 'C) more', 'D) tail'],
      correctAnswer: 'D',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_07',
      questionText:
          'Quieres editar rápidamente un archivo de configuración directamente desde la línea de comandos sin necesidad de una interfaz gráfica. ¿Qué editor de texto básico es comúnmente utilizado para esta tarea en Linux?',
      options: [
        'A) LibreOffice Writer',
        'B) Gedit',
        'C) nano',
        'D) Microsoft Word'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_08',
      questionText:
          'Necesitas encontrar un archivo específico dentro de tu sistema, pero no recuerdas su ubicación exacta. Sabes que su nombre contiene la palabra "reporte". ¿Qué comando es ideal para buscar archivos por nombre en el sistema de archivos?',
      options: ['A) grep', 'B) locate', 'C) ping', 'D) tar'],
      correctAnswer: 'B',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_09',
      questionText:
          'Estás trabajando con un archivo de texto grande y solo te interesan las líneas que contienen una palabra específica. ¿Qué comando utilizarías para filtrar las líneas de un archivo que coincidan con un patrón?',
      options: ['A) find', 'B) grep', 'C) sort', 'D) uniq'],
      correctAnswer: 'B',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_10',
      questionText:
          'Quieres enviar un archivo grande a un compañero de trabajo. Para reducir el tamaño del archivo y facilitar la transferencia, decides comprimirlo. ¿Qué comando de compresión es comúnmente utilizado en Linux?',
      options: ['A) unzip', 'B) tar', 'C) bzip2', 'D) 7zip'],
      correctAnswer: 'B',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_11',
      questionText:
          'Necesitas verificar la conectividad de red desde tu servidor Linux a otro host en la red. ¿Qué comando básico de red usarías para enviar paquetes a un destino y verificar su respuesta?',
      options: ['A) ifconfig', 'B) netstat', 'C) ping', 'D) ssh'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_12',
      questionText:
          'Quieres transferir de forma segura un archivo desde tu máquina local a un servidor remoto Linux. ¿Qué protocolo y comando se utilizan comúnmente para la transferencia segura de archivos a través de SSH?',
      options: [
        'A) FTP y ftp',
        'B) HTTP y wget',
        'C) SCP y scp',
        'D) SMB y smbclient'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_13',
      questionText:
          'Estás utilizando una distribución basada en Debian (como Ubuntu) y necesitas instalar un nuevo paquete de software. ¿Qué gestor de paquetes usarías para esta tarea?',
      options: ['A) yum', 'B) rpm', 'C) apt', 'D) dnf'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_14',
      questionText:
          'Tu sistema Fedora necesita una actualización de software. ¿Qué gestor de paquetes moderno es el sucesor de yum y se utiliza para gestionar paquetes en sistemas basados en Red Hat?',
      options: ['A) dpkg', 'B) apt', 'C) dnf', 'D) snap'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_15',
      questionText:
          'Necesitas crear una nueva cuenta de usuario en tu sistema Linux para un nuevo miembro del equipo. ¿Qué comando usarías para añadir un nuevo usuario al sistema?',
      options: ['A) passwd', 'B) usermod', 'C) useradd', 'D) groupadd'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_16',
      questionText:
          'Eres un administrador de sistemas y necesitas ejecutar un comando con privilegios de superusuario, pero no quieres iniciar sesión como root. ¿Qué comando te permite ejecutar comandos con privilegios elevados de forma segura?',
      options: ['A) su', 'B) login', 'C) sudo', 'D) chown'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_17',
      questionText:
          'Estás escribiendo tu primer script de Bash y quieres almacenar un valor para usarlo más adelante. ¿Qué concepto fundamental de Bash te permite guardar y referenciar datos dentro de tu script?',
      options: ['A) Funciones', 'B) Bucles', 'C) Variables', 'D) Redirección'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_18',
      questionText:
          'Quieres automatizar una tarea que se ejecuta todos los días a una hora específica. ¿Qué herramienta de programación de tareas en Linux es ideal para ejecutar comandos o scripts de forma regular?',
      options: ['A) at', 'B) sleep', 'C) cron', 'D) watch'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_19',
      questionText:
          'Necesitas extraer columnas específicas de un archivo de datos separado por delimitadores. ¿Qué herramienta de procesamiento de texto en Linux es muy útil para seleccionar y manipular columnas de datos?',
      options: ['A) sed', 'B) awk', 'C) grep', 'D) sort'],
      correctAnswer: 'B',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_20',
      questionText:
          'Tu disco duro está casi lleno y necesitas identificar qué directorios están ocupando más espacio. ¿Qué comando te permite ver el uso de espacio en disco de archivos y directorios?',
      options: ['A) fdisk', 'B) mkfs', 'C) df', 'D) du'],
      correctAnswer: 'D',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_21',
      questionText:
          'Quieres proteger tu servidor de accesos no autorizados a ciertos puertos. ¿Qué herramienta básica de firewall se utiliza comúnmente en Linux para filtrar el tráfico de red?',
      options: ['A) SELinux', 'B) AppArmor', 'C) ufw', 'D) ssh-keygen'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_22',
      questionText:
          'Estás monitoreando el rendimiento de tu sistema y necesitas ver el uso de CPU, memoria y procesos en tiempo real. ¿Qué comando es similar a top pero ofrece una interfaz más interactiva y fácil de usar?',
      options: ['A) vmstat', 'B) iostat', 'C) htop', 'D) journalctl'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_23',
      questionText:
          'Te interesa la virtualización y quieres aprender sobre contenedores ligeros para desplegar aplicaciones de forma eficiente. ¿Qué tecnología introductoria de contenedores es ampliamente utilizada?',
      options: ['A) KVM', 'B) Vagrant', 'C) Docker', 'D) VirtualBox'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_24',
      questionText:
          'Necesitas configurar tu entorno de desarrollo en Linux y quieres una shell más avanzada que Bash, que te ofrezca características como autocompletado mejorado y plugins. ¿Qué shell alternativa podrías considerar?',
      options: ['A) sh', 'B) csh', 'C) Zsh', 'D) ksh'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_25',
      questionText:
          'Estás empezando con el control de versiones para tus proyectos de código. ¿Qué herramienta es fundamental para el control de versiones y es ampliamente utilizada en el desarrollo de software?',
      options: ['A) SVN', 'B) Mercurial', 'C) Git', 'D) CVS'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_26',
      questionText:
          'Trabajas en un entorno Linux donde la comunidad de código abierto es muy importante. ¿Cuál de las siguientes afirmaciones describe mejor un beneficio clave de la comunidad open source?',
      options: [
        'A) Limita el acceso al código fuente para proteger la propiedad intelectual.',
        'B) Fomenta la colaboración y el desarrollo de software por parte de una comunidad global.',
        'C) Impide que los usuarios modifiquen el software para mantener la estabilidad.',
        'D) Requiere licencias costosas para acceder a las actualizaciones.'
      ],
      correctAnswer: 'B',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_27',
      questionText:
          'Acabas de instalar Linux y necesitas decidir si vas a interactuar principalmente con el sistema a través de una interfaz visual o mediante comandos de texto. ¿Cuál es el término para la interfaz basada en texto que se usa para dar instrucciones a Linux?',
      options: [
        'A) Entorno gráfico',
        'B) Línea de comandos',
        'C) Gestor de ventanas',
        'D) Escritorio virtual'
      ],
      correctAnswer: 'B',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_28',
      questionText:
          'Después de instalar Linux, es crucial mantener el sistema actualizado. ¿Por qué es importante actualizar regularmente tu sistema operativo Linux?',
      options: [
        'A) Para cambiar el tema visual del escritorio.',
        'B) Para mejorar la velocidad del ratón y el teclado.',
        'C) Para recibir parches de seguridad y nuevas características.',
        'D) Para desinstalar software que no se usa.'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_29',
      questionText:
          'Estás explorando la estructura del sistema de archivos de Linux. ¿Qué directorio contiene generalmente los archivos binarios ejecutables esenciales del sistema, como ls o cat?',
      options: ['A) /home', 'B) /etc', 'C) /var', 'D) /bin'],
      correctAnswer: 'D',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_30',
      questionText:
          'Un compañero te pide que navegues hasta un directorio específico para encontrar un archivo. ¿Qué comando utilizas para cambiar de directorio en la línea de comandos de Linux?',
      options: ['A) ls', 'B) pwd', 'C) cd', 'D) mkdir'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_31',
      questionText:
          'Has creado un nuevo script en tu directorio personal y necesitas que sea ejecutable por ti. ¿Qué comando utilizarías para otorgar permisos de ejecución al script?',
      options: ['A) chown', 'B) chmod', 'C) rm', 'D) touch'],
      correctAnswer: 'B',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_32',
      questionText:
          'Quieres crear un acceso directo a un archivo importante en otra ubicación para no tener que navegar hasta él cada vez. ¿Qué tipo de enlace en Linux es como un acceso directo y puede apuntar a archivos o directorios en diferentes sistemas de archivos?',
      options: [
        'A) Enlace duro',
        'B) Enlace simbólico',
        'C) Copia de archivo',
        'D) Duplicado de archivo'
      ],
      correctAnswer: 'B',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_33',
      questionText:
          'Un proceso se ha quedado atascado y no responde. Necesitas terminarlo. ¿Qué comando usarías para enviar una señal para finalizar un proceso por su ID (PID)?',
      options: ['A) top', 'B) ps', 'C) kill', 'D) nice'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_34',
      questionText:
          'Después de una actualización, necesitas reiniciar un servicio específico en tu servidor Linux. ¿Qué sistema de gestión de servicios es el estándar en muchas distribuciones modernas de Linux para controlar los demonios y servicios del sistema?',
      options: [
        'A) init.d',
        'B) service (comando de compatibilidad)',
        'C) systemd',
        'D) xinetd'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_35',
      questionText:
          'Estás depurando un problema en el sistema y necesitas revisar los registros de eventos. ¿En qué directorio se almacenan comúnmente los archivos de registro del sistema en Linux?',
      options: ['A) /etc/log', 'B) /var/log', 'C) /usr/log', 'D) /tmp/log'],
      correctAnswer: 'B',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_36',
      questionText:
          'Quieres ver el contenido completo de un archivo de texto, pero es muy grande para caber en una sola pantalla. ¿Qué comando te permite ver el contenido de un archivo página por página, permitiéndote avanzar y retroceder?',
      options: ['A) cat', 'B) head', 'C) less', 'D) tail'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_37',
      questionText:
          'Estás en una red y necesitas saber la dirección IP de tu interfaz de red. ¿Qué comando, que ha sido reemplazado por ip pero aún es común en muchos sistemas, te permite ver la configuración de la interfaz de red?',
      options: ['A) netstat', 'B) ping', 'C) ifconfig', 'D) route'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_38',
      questionText:
          'Te conectas a menudo a un servidor remoto y te cansas de introducir la contraseña cada vez. ¿Qué método de autenticación en SSH es más seguro y conveniente que las contraseñas para el acceso remoto?',
      options: [
        'A) Usar una contraseña más larga.',
        'B) Deshabilitar la autenticación.',
        'C) Usar claves SSH (pares de claves pública/privada).',
        'D) Conectarse como root.'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_39',
      questionText:
          'Tu sistema operativo Red Hat necesita instalar un paquete que no está disponible en los repositorios predeterminados. ¿Qué herramienta de gestión de paquetes te permite instalar paquetes en formato .rpm directamente?',
      options: ['A) apt', 'B) yum', 'C) dpkg', 'D) rpm'],
      correctAnswer: 'D',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_40',
      questionText:
          'Quieres crear un grupo para los desarrolladores en tu sistema Linux, de modo que puedas asignar permisos a todos ellos de una vez. ¿Qué comando utilizas para crear un nuevo grupo?',
      options: ['A) useradd', 'B) usermod', 'C) groupadd', 'D) gpasswd'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_41',
      questionText:
          'Estás escribiendo un script Bash y necesitas leer la entrada del usuario. ¿Qué construcción básica de Bash permite que un script interactúe con el usuario pidiendo información?',
      options: ['A) Redirección', 'B) echo', 'C) read', 'D) printf'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_42',
      questionText:
          'Tienes un script que debe realizar una acción diferente dependiendo del valor de una variable. ¿Qué estructura de control en Bash te permite ejecutar diferentes bloques de código basándose en una condición?',
      options: [
        'A) Bucles for',
        'B) Funciones',
        'C) Condicionales if',
        'D) Redirección'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_43',
      questionText:
          'Tu script necesita procesar cada línea de un archivo de texto. ¿Qué estructura de control te permite iterar sobre una lista de elementos o sobre las líneas de un archivo?',
      options: ['A) if', 'B) case', 'C) for loop', 'D) Funciones'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_44',
      questionText:
          'Quieres automatizar la limpieza de archivos temporales cada noche. ¿Qué servicio de programación de tareas en Linux se utiliza para programar trabajos para que se ejecuten una sola vez en un momento futuro específico?',
      options: ['A) cron', 'B) systemd-timer', 'C) at', 'D) sleep'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_45',
      questionText:
          'Tienes un archivo con líneas duplicadas y quieres eliminarlas para obtener una lista única de elementos. ¿Qué comando es útil para reportar o eliminar líneas duplicadas en un archivo de texto?',
      options: ['A) sort', 'B) cut', 'C) uniq', 'D) grep'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_46',
      questionText:
          'Necesitas crear una nueva partición en un disco duro para almacenar datos. ¿Qué utilidad de línea de comandos es comúnmente utilizada para gestionar tablas de particiones y crear/modificar particiones en Linux?',
      options: ['A) mkfs', 'B) mount', 'C) fdisk', 'D) df'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_47',
      questionText:
          'Has creado una nueva partición y ahora necesitas prepararla para almacenar archivos. ¿Qué comando se utiliza para crear un sistema de archivos (como ext4 o XFS) en una partición?',
      options: ['A) mount', 'B) fdisk', 'C) mkfs', 'D) lsblk'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_48',
      questionText:
          'Quieres supervisar la actividad de entrada/salida de tus dispositivos de almacenamiento para identificar cuellos de botella. ¿Qué comando de monitoreo te proporciona estadísticas sobre la actividad del disco?',
      options: ['A) top', 'B) vmstat', 'C) iostat', 'D) ps'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_49',
      questionText:
          'Estás usando Git para el control de versiones de tus proyectos. ¿Qué comando es fundamental para crear un nuevo repositorio Git en tu directorio de trabajo actual?',
      options: ['A) git clone', 'B) git add', 'C) git init', 'D) git commit'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'lnx_jr_50',
      questionText:
          'Necesitas automatizar una tarea de mantenimiento básica en varios servidores. ¿Qué herramienta de automatización, que se basa en SSH y no requiere agentes en los nodos, es una buena introducción a la automatización de la configuración?',
      options: ['A) Puppet', 'B) Chef', 'C) Ansible', 'D) SaltStack'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Jr',
    ),
  ];
  // Insertar las preguntas en la base de datos
  for (final question in preloadedLinuxJrQuestions) {
    await db.insert(tableName, question.toMap());
  }
}

Future<void> preloadLinuxMidQuestions(Database db, tableName) async {
  final preloadedLinuxMidQuestions = [
    ExamQuestionModel(
      id: 'lnx_mid_01',
      questionText:
          'Un administrador de sistemas intermedio se enfrenta a la necesidad de gestionar un repositorio de paquetes personalizado para una aplicación interna. ¿Cuál de las siguientes acciones es crucial para garantizar la integridad y autenticidad de los paquetes en un repositorio personalizado de Debian/Ubuntu?',
      options: [
        'A) Solo usar paquetes de fuentes no verificadas.',
        'B) Firmar los paquetes digitalmente con una clave GPG.',
        'C) Deshabilitar la verificación de firmas de paquetes.',
        'D) Depender únicamente de la velocidad de descarga del repositorio.'
      ],
      correctAnswer: 'B',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_02',
      questionText:
          'Te han encargado la tarea de gestionar un sistema de archivos avanzado, específicamente para manejar grandes volúmenes de datos con características de instantáneas y sumas de comprobación. ¿Cuál de los siguientes sistemas de archivos es conocido por estas capacidades y se menciona en la ruta de conocimientos como especializado?',
      options: ['A) EXT4', 'B) FAT32', 'C) Btrfs ', 'D) NTFS'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_03',
      questionText:
          'En un entorno empresarial, es fundamental controlar quién tiene acceso a archivos y directorios más allá de los permisos básicos de propietario, grupo y otros. ¿Qué mecanismo permite establecer permisos más granulares sobre archivos y directorios en Linux, siendo una característica de "Sistemas de Archivos Avanzados"?',
      options: [
        'A) chmod octal',
        'B) ACLs (Access Control Lists) ',
        'C) chown recursivo',
        'D) Atributos extendidos de archivos'
      ],
      correctAnswer: 'B',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_04',
      questionText:
          'Un ingeniero de redes Linux necesita aumentar el ancho de banda y la redundancia de una conexión de red combinando múltiples interfaces de red físicas en una sola interfaz lógica. ¿Qué tecnología de red avanzada se utiliza para este propósito, también conocida como "channel bonding" o "NIC teaming"?',
      options: [
        'A) VLANs',
        'B) Enlace de interfaces (bonding, teaming) ',
        'C) Enrutamiento estático',
        'D) Configuración de DHCP'
      ],
      correctAnswer: 'B',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_05',
      questionText:
          'Para asegurar una conexión de red privada y cifrada a través de una red pública como Internet, un administrador opta por implementar una VPN. ¿Qué tecnología se menciona como opción en "Redes Avanzadas" para establecer una VPN en Linux?',
      options: ['A) Telnet', 'B) FTP', 'C) OpenVPN ', 'D) HTTP'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_06',
      questionText:
          'Como parte de las medidas de seguridad intermedia, se requiere fortalecer el sistema operativo para reducir su superficie de ataque. ¿Qué término se refiere al proceso de configurar un sistema de manera más segura, a menudo deshabilitando servicios innecesarios y aplicando configuraciones restrictivas?',
      options: [
        'A) Overclocking del sistema',
        'B) Desfragmentación del disco',
        'C) Hardening del sistema ',
        'D) Actualización del kernel únicamente'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_07',
      questionText:
          'Un analista de seguridad necesita detectar posibles intrusiones o modificaciones no autorizadas en archivos críticos del sistema. ¿Qué tipo de herramienta se utiliza para la detección de intrusos basándose en la monitorización de la integridad de los archivos?',
      options: [
        'A) Un firewall',
        'B) Un gestor de paquetes',
        'C) Un sistema de detección de intrusos (como aide, rkhunter) ',
        'D) Un editor de texto avanzado'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_08',
      questionText:
          'En el Shell Scripting Avanzado, a menudo es necesario manejar colecciones de datos. ¿Qué estructura de datos es fundamental en Bash Avanzado para almacenar múltiples valores indexados?',
      options: [
        'A) Variables simples',
        'B) Arrays ',
        'C) Cadenas de texto',
        'D) Números enteros'
      ],
      correctAnswer: 'B',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_09',
      questionText:
          'Un script avanzado necesita parsear y manipular datos en formato JSON, que es muy común en APIs web. ¿Qué herramienta de procesamiento de texto avanzada se recomienda para trabajar eficientemente con datos JSON en la línea de comandos?',
      options: ['A) grep', 'B) sed', 'C) awk', 'D) jq para JSON '],
      correctAnswer: 'D',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_10',
      questionText:
          'Para asegurar la calidad y fiabilidad de los scripts Bash complejos, es una buena práctica implementar pruebas. ¿Qué concepto se aplica para verificar que pequeñas unidades de código (como funciones o secciones de un script) funcionen correctamente de forma aislada?',
      options: [
        'A) Pruebas de integración',
        'B) Pruebas de rendimiento',
        'C) Pruebas unitarias para scripts ',
        'D) Pruebas de regresión'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_11',
      questionText:
          'Un script necesita interactuar con una API RESTful para automatizar tareas. Para hacer peticiones HTTP desde la línea de comandos, ¿qué herramienta avanzada es esencial para integrar scripts con APIs, manejando diversos métodos y autenticación?',
      options: ['A) ping', 'B) netcat', 'C) curl avanzado ', 'D) wget básico'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_12',
      questionText:
          'Un ingeniero DevOps está configurando una infraestructura de virtualización KVM y necesita asegurar que las máquinas virtuales puedan comunicarse entre sí y con redes externas de manera compleja. ¿Qué aspecto es fundamental configurar en KVM Avanzado para lograr esta conectividad?',
      options: [
        'A) Solo usar una única tarjeta de red para todas las VMs.',
        'B) Redes virtuales complejas.',
        'C) Desactivar el firewall en el host.',
        'D) Usar solo conexiones directas al hardware.'
      ],
      correctAnswer: 'B',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_13',
      questionText:
          'En Docker Avanzado, para asegurar que los datos generados por un contenedor persistan incluso si el contenedor es eliminado o recreado, se utilizan volúmenes. ¿Qué tipo de volúmenes se recomienda para la persistencia de datos en Docker?',
      options: [
        'A) Volúmenes efímeros',
        'B) Volúmenes temporales',
        'C) Volúmenes persistentes ',
        'D) Volúmenes de solo lectura'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_14',
      questionText:
          'Una filosofía clave de DevOps es tratar la infraestructura como código. ¿Qué herramienta se menciona como básica en este contexto para aprovisionar y gestionar infraestructura en la nube y on-premise de manera declarativa?',
      options: [
        'A) Vagrant',
        'B) Packer',
        'C) Terraform básico ',
        'D) Jenkins'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_15',
      questionText:
          'En el ámbito de las plataformas de nube, se busca familiarización con servicios de cómputo fundamentales. ¿Qué servicio de Amazon Web Services (AWS) es una máquina virtual escalable en la nube, y se considera básico en "Plataformas de Nube Básica"?',
      options: [
        'A) AWS S3',
        'B) AWS Lambda',
        'C) AWS EC2 básico ',
        'D) AWS RDS'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_16',
      questionText:
          'Para el monitoreo de sistemas, se busca una solución que permita recolectar métricas en tiempo real y visualizarlas en paneles. ¿Qué herramienta se menciona como básica para la recolección de métricas, a menudo combinada con Grafana para la visualización?',
      options: ['A) Zabbix', 'B) Nagios', 'C) Prometheus básico ', 'D) Splunk'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_17',
      questionText:
          'Un equipo necesita una herramienta para crear paneles interactivos y visualizaciones a partir de datos de monitoreo de diversas fuentes. ¿Qué herramienta se menciona como básica para la visualización de métricas en un contexto de monitoreo de sistemas?',
      options: ['A) Kibana', 'B) Grafana básico ', 'C) Tableau', 'D) Power BI'],
      correctAnswer: 'B',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_18',
      questionText:
          'En la gestión de logs, es importante rotar y retener los archivos de registro para evitar que consuman todo el espacio en disco y para cumplir con las políticas de auditoría. ¿Qué aspecto de los "Sistemas de Logging" se refiere a la administración del tamaño y la antigüedad de los archivos de log?',
      options: [
        'A) Centralización de logs',
        'B) Análisis de logs',
        'C) Rotación y retención ',
        'D) Filtrado de logs'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_19',
      questionText:
          'Para optimizar el rendimiento del sistema, un administrador está investigando cómo ajustar el comportamiento del kernel de Linux. ¿Qué técnica se enfoca en modificar los parámetros del kernel para mejorar el rendimiento del sistema en cargas de trabajo específicas?',
      options: [
        'A) Actualización de controladores de hardware',
        'B) Desfragmentación del disco',
        'C) Tuning del kernel ',
        'D) Aumento de la memoria RAM sin configuración adicional'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_20',
      questionText:
          'Para garantizar la continuidad del servicio en caso de fallo de un servidor, se implementa una solución de alta disponibilidad. ¿Qué herramienta se menciona como básica para proporcionar failover automático y mantener la disponibilidad de servicios críticos?',
      options: ['A) Apache', 'B) Nginx', 'C) Keepalived ', 'D) MySQL'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_21',
      questionText:
          'Un equipo de desarrollo quiere implementar un pipeline de Integración Continua/Despliegue Continuo (CI/CD). ¿Qué herramienta se menciona como básica y ampliamente utilizada para automatizar la construcción, prueba y despliegue de software en un pipeline de CI/CD?',
      options: ['A) Jira', 'B) Confluence', 'C) Jenkins básico ', 'D) Trello'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_22',
      questionText:
          'Para automatizar la configuración de múltiples servidores de manera declarativa, una organización busca una herramienta de gestión de configuración. ¿Qué herramienta se menciona como básica, que utiliza un enfoque basado en agentes y un lenguaje declarativo para la configuración de la infraestructura?',
      options: [
        'A) Ansible',
        'B) SaltStack',
        'C) Puppet básico ',
        'D) Chef básico '
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_23',
      questionText:
          'Al implementar pruebas automatizadas para la infraestructura, es beneficioso utilizar entornos que se puedan crear y destruir rápidamente para cada ciclo de prueba. ¿Qué concepto se refiere a la creación de infraestructura temporal que solo existe durante el tiempo que se necesitan las pruebas?',
      options: [
        'A) Infraestructura persistente',
        'B) Infraestructura manual',
        'C) Infraestructura efímera ',
        'D) Infraestructura en papel'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_24',
      questionText:
          'En el contexto de la observabilidad, se busca comprender cómo se distribuyen las peticiones a través de diferentes servicios en un sistema complejo. ¿Qué técnica permite seguir la ruta de una solicitud a medida que pasa por varios componentes de un sistema distribuido?',
      options: [
        'A) Métricas de negocio',
        'B) Logs estructurados',
        'C) Trazado distribuido ',
        'D) Alertas simples'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_25',
      questionText:
          'Un profesional busca obtener una certificación de nivel intermedio que valide sus habilidades en administración avanzada de sistemas Linux, incluyendo servicios y configuraciones complejas. ¿Qué certificación de la Linux Foundation se alinea con estos objetivos?',
      options: [
        'A) LFCS (Linux Foundation Certified System Administrator)',
        'B) RHCSA (Red Hat Certified System Administrator)',
        'C) LFCE (Linux Foundation Certified Engineer) ',
        'D) LPIC-1'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_26',
      questionText:
          'Un administrador de sistemas intermedio está trabajando con un servidor web Nginx y necesita configurar un balanceador de carga para distribuir el tráfico entre múltiples servidores de aplicaciones. ¿Qué directiva de configuración de Nginx es fundamental para definir un grupo de servidores ascendentes para balanceo de carga?',
      options: ['A) location', 'B) server', 'C) upstream', 'D) proxy_pass'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_27',
      questionText:
          'En un entorno de producción, la seguridad del servidor web es primordial. Para garantizar la comunicación cifrada, es necesario configurar SSL/TLS. ¿Qué archivo de configuración de Nginx se modifica típicamente para habilitar HTTPS y especificar los certificados SSL?',
      options: [
        'A) nginx.conf',
        'B) mime.types',
        'C) Archivo de configuración del sitio (e.g., default.conf o misitio.conf)',
        'D) fastcgi.conf'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_28',
      questionText:
          'Un equipo de desarrollo está utilizando bases de datos PostgreSQL en sus servidores Linux. Para optimizar el rendimiento de la base de datos, es crucial ajustar la configuración. ¿Qué archivo de configuración principal de PostgreSQL se modifica para cambiar parámetros como la asignación de memoria o el número de conexiones?',
      options: [
        'A) pg_hba.conf',
        'B) postgresql.conf',
        'C) pg_ident.conf',
        'D) pg_service.conf'
      ],
      correctAnswer: 'B',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_29',
      questionText:
          'Para la gestión de usuarios en PostgreSQL, es necesario crear roles y asignarles permisos. ¿Qué comando de PostgreSQL se utiliza para crear un nuevo usuario o rol en la base de datos?',
      options: [
        'A) DROP ROLE',
        'B) ALTER ROLE',
        'C) CREATE DATABASE',
        'D) CREATE ROLE'
      ],
      correctAnswer: 'D',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_30',
      questionText:
          'Un desarrollador necesita crear una base de datos MySQL para una nueva aplicación. ¿Qué comando de MySQL se utiliza para crear una nueva base de datos?',
      options: [
        'A) SHOW DATABASES;',
        'B) USE database_name;',
        'C) CREATE DATABASE database_name;',
        'D) DROP DATABASE database_name;'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_31',
      questionText:
          'Para asegurar una base de datos MySQL, es una buena práctica crear un usuario con privilegios limitados para la aplicación. ¿Qué comando de MySQL se utiliza para otorgar privilegios a un usuario en una base de datos específica?',
      options: [
        'A) REVOKE ALL PRIVILEGES ON database.* FROM \'user\'@\'host\';',
        'B) FLUSH PRIVILEGES;',
        'C) GRANT ALL PRIVILEGES ON database.* TO \'user\'@\'host\';',
        'D) DROP USER \'user\'@\'host\';'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_32',
      questionText:
          'Al trabajar con Docker, es común que una aplicación requiera varios servicios (ej., una base de datos y un servidor web) que deben comunicarse entre sí. ¿Qué herramienta de Docker se utiliza para definir y ejecutar aplicaciones multi-contenedor?',
      options: [
        'A) docker build',
        'B) docker run',
        'C) Docker Compose',
        'D) Docker Swarm'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_33',
      questionText:
          'Para optimizar el tamaño de las imágenes Docker y reducir las vulnerabilidades, se recomienda utilizar imágenes base minimalistas. ¿Cuál de las siguientes es una imagen base conocida por su tamaño extremadamente pequeño?',
      options: ['A) ubuntu', 'B) debian', 'C) alpine', 'D) centos'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_34',
      questionText:
          'Un equipo está implementando un sistema de monitoreo que recopila métricas de varios servidores Linux y las envía a un sistema centralizado. ¿Qué protocolo de red se utiliza comúnmente para el envío ligero de métricas?',
      options: ['A) TCP', 'B) UDP', 'C) ICMP', 'D) SSH'],
      correctAnswer: 'B',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_35',
      questionText:
          'Para asegurar que las alertas de monitoreo lleguen al equipo adecuado, es necesario configurar un sistema de notificación. ¿Qué método de notificación es comúnmente utilizado para enviar alertas automatizadas desde un sistema de monitoreo?',
      options: [
        'A) Notificaciones push a dispositivos móviles',
        'B) Llamadas telefónicas automatizadas',
        'C) Correo electrónico y/o Slack/Microsoft Teams',
        'D) Mensajes de texto SMS únicamente'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_36',
      questionText:
          'Un equipo está analizando logs de múltiples servidores para identificar patrones y problemas. ¿Qué herramienta de logging es parte de la "stack ELK" y se utiliza para la recolección, parsing y envío de logs a Elasticsearch?',
      options: ['A) Elasticsearch', 'B) Kibana', 'C) Logstash', 'D) Filebeat'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_37',
      questionText:
          'Para asegurar que los logs del sistema sean inalterables y no se pierdan, se requiere una solución de almacenamiento centralizado y seguro. ¿Qué propiedad es crucial para los logs almacenados centralmente con fines de auditoría y análisis forense?',
      options: [
        'A) Compresión máxima',
        'B) Acceso público',
        'C) Inmutabilidad y firma digital',
        'D) Borrado automático después de 24 horas'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_38',
      questionText:
          'Un administrador de sistemas necesita programar una tarea que se ejecute a intervalos irregulares o en respuesta a un evento del sistema. ¿Qué sistema de programación de tareas en Linux es más flexible que cron para este tipo de escenarios?',
      options: ['A) anacron', 'B) systemd-timers', 'C) at', 'D) batch'],
      correctAnswer: 'B',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_39',
      questionText:
          'Al gestionar un sistema Linux de tamaño considerable, es importante conocer las herramientas para la gestión de volúmenes lógicos. ¿Qué herramienta se utiliza para crear, redimensionar y gestionar volúmenes lógicos en Linux?',
      options: [
        'A) fdisk',
        'B) parted',
        'C) LVM (Logical Volume Manager)',
        'D) mkfs'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_40',
      questionText:
          'Un desarrollador está trabajando en un servidor Linux que requiere un software específico que aún no está en los repositorios oficiales. Para instalarlo, debe compilar el código fuente. ¿Qué comando se utiliza típicamente para configurar el proceso de compilación a partir del código fuente?',
      options: [
        'A) make',
        'B) make install',
        'C) ./configure',
        'D) apt install'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_41',
      questionText:
          'Para la gestión de un servidor web, se requiere asegurar que los certificados SSL/TLS se renueven automáticamente. ¿Qué herramienta popular se utiliza para obtener y renovar certificados SSL/TLS de forma gratuita y automatizada?',
      options: [
        r'''A) OpenSSL', 'B) GnuTLS', 'C) Certbot (Let's Encrypt)', 'D) keytool'''
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_42',
      questionText:
          'Un equipo de desarrollo está utilizando Git para el control de versiones y necesita fusionar cambios de una rama a otra. ¿Qué comando de Git se utiliza para integrar cambios de una rama a la rama actual?',
      options: [
        'A) git checkout',
        'B) git rebase',
        'C) git merge',
        'D) git branch'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_43',
      questionText:
          'Para mantener un historial de cambios limpio y lineal en Git, especialmente antes de compartir cambios, se prefiere reescribir el historial de commits. ¿Qué comando de Git se utiliza para rebasar una serie de commits?',
      options: ['A) git merge', 'B) git pull', 'C) git rebase', 'D) git reset'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_44',
      questionText:
          'Un administrador necesita monitorear la salud de varios servidores y recibir alertas si algún servicio crítico falla. ¿Qué categoría de herramientas de monitoreo es ideal para verificar si los servicios de red están disponibles y respondiendo?',
      options: [
        'A) Recopilación de métricas',
        'B) Monitoreo de logs',
        'C) Monitoreo de disponibilidad (ping, puertos TCP)',
        'D) Monitoreo de recursos del sistema'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_45',
      questionText:
          'Para realizar un análisis forense o depuración avanzada en un sistema Linux, es importante tener conocimiento de cómo se cargan los módulos del kernel. ¿Qué comando se utiliza para listar los módulos del kernel cargados actualmente?',
      options: ['A) lsmod', 'B) modprobe', 'C) insmod', 'D) rmmod'],
      correctAnswer: 'A',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_46',
      questionText:
          'Un administrador de red necesita configurar reglas de firewall más avanzadas que las proporcionadas por ufw, incluyendo el manejo de tablas y cadenas. ¿Qué herramienta de línea de comandos es la base para la configuración de firewall en Linux, permitiendo un control granular del tráfico de red?',
      options: ['A) firewalld', 'B) iptables', 'C) nftables', 'D) fail2ban'],
      correctAnswer: 'B',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_47',
      questionText:
          'Para el despliegue automatizado de aplicaciones, es común utilizar contenedores y orquestarlos. ¿Qué sistema de orquestación de contenedores es el estándar de facto en la industria y permite gestionar clústeres de contenedores a gran escala?',
      options: [
        'A) Docker Swarm',
        'B) Apache Mesos',
        'C) Kubernetes básico',
        'D) OpenShift'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_48',
      questionText:
          'En un entorno de desarrollo de software, es fundamental tener un sistema de gestión de versiones distribuido. ¿Qué sistema de control de versiones es el más popular y esencial para equipos que trabajan en código fuente?',
      options: ['A) Subversion (SVN)', 'B) Mercurial', 'C) Git', 'D) CVS'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_49',
      questionText:
          'Para diagnosticar problemas de rendimiento de I/O en un servidor Linux, se necesita una herramienta que muestre el uso del disco para cada proceso. ¿Qué herramienta es útil para monitorear el uso de disco por proceso en tiempo real?',
      options: ['A) df', 'B) du', 'C) iotop', 'D) iostat'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'lnx_mid_50',
      questionText:
          'Un administrador necesita automatizar la gestión de la configuración de varios servidores, aplicando playbooks para mantener el estado deseado. ¿Qué herramienta de gestión de configuración se menciona como fundamental, que utiliza YAML para sus playbooks y no requiere agentes en los nodos gestionados?',
      options: ['A) Puppet', 'B) Chef', 'C) Ansible', 'D) SaltStack'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Mid',
    ),
  ];
  // Insertar las preguntas en la base de datos
  for (final question in preloadedLinuxMidQuestions) {
    await db.insert(tableName, question.toMap());
  }
}

Future<void> preloadLinuxSrQuestions(Database db, tableName) async {
  final preloadedLinuxSrQuestions = [
    ExamQuestionModel(
      id: 'lnx_sr_01',
      questionText:
          'Un arquitecto de soluciones debe diseñar un sistema que cumpla con los más altos estándares de seguridad para una aplicación de misión crítica. La elección de la distribución es crucial. ¿Cuál de las siguientes distribuciones de Linux es conocida por su enfoque extremo en la seguridad y la inmutabilidad del sistema base, siendo una opción a considerar para hardening extremo?',
      options: [
        'A) Ubuntu Desktop',
        'B) Fedora Workstation',
        'C) Alpine Linux o CoreOS',
        'D) CentOS Stream'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_02',
      questionText:
          'En un entorno de nube híbrida, es necesario asegurar que los servidores Linux sean compatibles y gestionables en diferentes plataformas, desde on-premise hasta múltiples proveedores de nube. ¿Qué concepto de arquitectura empresarial es fundamental para garantizar la flexibilidad y adaptabilidad en estos escenarios?',
      options: [
        'A) Bloqueo de proveedor (vendor lock-in)',
        'B) Infraestructura agnóstica a la nube',
        'C) Dependencia de una única plataforma',
        'D) Configuración manual de cada servidor'
      ],
      correctAnswer: 'B',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_03',
      questionText:
          'Un equipo de operaciones senior está lidiando con un problema de rendimiento persistente en un servidor Linux. La depuración de fallos a nivel del kernel es la única opción restante. ¿Qué herramienta o técnica es indispensable para analizar volcados de memoria y rastrear problemas profundos en el kernel?',
      options: [
        'A) strace',
        'B) ltrace',
        'C) kdump y análisis de volcados de memoria (crash dumps)',
        'D) dmesg únicamente'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_04',
      questionText:
          'Para optimizar el rendimiento de la red en un servidor Linux de alta carga, un ingeniero senior considera ajustar los parámetros TCP/IP a nivel del kernel. ¿Qué archivo del sistema de archivos proc es comúnmente modificado para realizar tuning de red (ej., ajustar el tamaño de los buffers TCP)?',
      options: [
        'A) /proc/meminfo',
        'B) /proc/cpuinfo',
        'C) /proc/sys/net/ipv4/tcp_max_syn_backlog (o similares)',
        'D) /proc/partitions'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_05',
      questionText:
          'Un equipo de desarrollo de alto rendimiento está construyendo una aplicación que requiere una latencia extremadamente baja. Para garantizar que el kernel de Linux priorice ciertas tareas y reduzca el "jitter", ¿qué tipo de kernel se utiliza para optimizar la latencia en cargas de trabajo en tiempo real?',
      options: [
        'A) Kernel estándar',
        'B) Kernel con parches RT (Real-Time)',
        'C) Kernel genérico',
        'D) Kernel de depuración'
      ],
      correctAnswer: 'B',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_06',
      questionText:
          'Al diseñar un plan de recuperación ante desastres para un sistema Linux, se debe considerar la estrategia de copias de seguridad de datos críticos. Para un sistema de archivos en crecimiento constante, ¿qué tipo de copia de seguridad permite restaurar el estado exacto del sistema en un punto específico del tiempo, minimizando la pérdida de datos?',
      options: [
        'A) Copias de seguridad completas semanales',
        'B) Copias de seguridad incrementales diarias',
        'C) Instantáneas del sistema de archivos (snapshots)',
        'D) Solo replicación en tiempo real'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_07',
      questionText:
          'Un arquitecto de seguridad está implementando medidas de seguridad avanzadas en un servidor Linux. Además de los firewalls y ACLs, se requiere una política de seguridad a nivel del kernel para controlar qué aplicaciones pueden acceder a qué recursos del sistema. ¿Qué módulo de seguridad del kernel de Linux es conocido por su enfoque de seguridad obligatoria (MAC)?',
      options: ['A) AppArmor', 'B) SELinux', 'C) PAM', 'D) iptables'],
      correctAnswer: 'B',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_08',
      questionText:
          'Para identificar y analizar malware en un sistema Linux, un analista de seguridad necesita herramientas de respuesta a incidentes que permitan la recolección forense de datos. ¿Qué aspecto de la "Respuesta a Incidentes y Análisis Forense" implica la creación de una copia bit a bit de un dispositivo de almacenamiento para un análisis posterior?',
      options: [
        'A) Borrado seguro de datos',
        'B) Adquisición forense de imágenes de disco',
        'C) Monitoreo de red en vivo',
        'D) Escaneo de vulnerabilidades sin copia'
      ],
      correctAnswer: 'B',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_09',
      questionText:
          'Un ingeniero senior está diseñando una arquitectura de microservicios en Kubernetes y necesita asegurar que el almacenamiento sea elástico y persista independientemente de los pods. ¿Qué concepto de almacenamiento en Kubernetes permite el aprovisionamiento dinámico de volúmenes persistentes para los pods?',
      options: [
        'A) HostPath volumes',
        'B) EmptyDir volumes',
        'C) Persistent Volumes y Persistent Volume Claims',
        'D) ConfigMaps'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_10',
      questionText:
          'Para gestionar un clúster de Kubernetes, se requiere una herramienta de línea de comandos para interactuar con la API de Kubernetes. ¿Qué comando es la interfaz principal para operar clústeres de Kubernetes?',
      options: ['A) docker', 'B) kubectl', 'C) helm', 'D) minikube'],
      correctAnswer: 'B',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_11',
      questionText:
          'Un desarrollador senior está creando plantillas para desplegar aplicaciones en Kubernetes de manera repetible y versionada. ¿Qué herramienta de gestión de paquetes para Kubernetes se utiliza para definir, instalar y actualizar aplicaciones complejas?',
      options: ['A) kubectl apply', 'B) kustomize', 'C) Helm', 'D) jsonnet'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_12',
      questionText:
          'Un arquitecto de sistemas está evaluando diferentes opciones de orquestación de contenedores y necesita comparar Kubernetes con Docker Swarm. ¿Cuál de las siguientes es una ventaja clave de Kubernetes sobre Docker Swarm para la gestión de clústeres de contenedores a gran escala?',
      options: [
        'A) Mayor simplicidad de configuración para casos básicos.',
        'B) Menor curva de aprendizaje inicial.',
        'C) Escalabilidad, flexibilidad y un ecosistema más amplio.',
        'D) Integración más estrecha con Docker Desktop.'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_13',
      questionText:
          'En un entorno de CI/CD avanzado, se necesita una herramienta que permita la construcción y despliegue de imágenes de Docker de forma segura y automatizada, y que se integre bien con Kubernetes. ¿Qué concepto se refiere a la capacidad de construir imágenes Docker directamente en el clúster de Kubernetes, sin necesidad de un Docker daemon externo?',
      options: ['A) BuildKit', 'B) Kaniko', 'C) Jib', 'D) Docker-in-Docker'],
      correctAnswer: 'B',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_14',
      questionText:
          'Para garantizar la calidad del código de infraestructura como código (IaC), un ingeniero senior quiere implementar pruebas de integración. ¿Qué tipo de pruebas en IaC se centran en verificar que diferentes componentes de la infraestructura, como redes y servidores, interactúen correctamente una vez desplegados?',
      options: [
        'A) Pruebas unitarias de plantillas',
        'B) Pruebas de linting',
        'C) Pruebas de integración de infraestructura',
        'D) Pruebas de rendimiento del IaC'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_15',
      questionText:
          'Un equipo DevOps está utilizando Ansible para la gestión de la configuración y necesita crear roles reutilizables para sus playbooks. ¿Qué elemento de Ansible se utiliza para organizar la configuración en unidades lógicas y reutilizables, facilitando la modularidad y la compartición?',
      options: ['A) Tareas', 'B) Handlers', 'C) Roles', 'D) Variables'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_16',
      questionText:
          'Para gestionar un gran número de nodos con Ansible de manera eficiente, se requiere un inventario dinámico. ¿Qué característica de Ansible permite generar la lista de hosts y variables de forma programática, por ejemplo, a partir de una API de nube?',
      options: [
        'A) Archivo de inventario estático',
        'B) Inventarios dinámicos',
        'C) Grupos de hosts',
        'D) ansible-galaxy'
      ],
      correctAnswer: 'B',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_17',
      questionText:
          'Un ingeniero senior está optimizando el rendimiento de una base de datos distribuida en Linux. Para analizar el uso de CPU a nivel de kernel y de usuario, e identificar cuellos de botella en el código, ¿qué herramienta de perfilado de rendimiento avanzada es indispensable?',
      options: ['A) top', 'B) htop', 'C) perf', 'D) vmstat'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_18',
      questionText:
          'Para la resolución de problemas de red complejos en Linux, se necesita una herramienta que permita capturar y analizar el tráfico de red en detalle. ¿Qué utilidad de línea de comandos es ampliamente utilizada para la captura y análisis de paquetes de red?',
      options: ['A) ping', 'B) netstat', 'C) tcpdump', 'D) ip route'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_19',
      questionText:
          'Un administrador senior está trabajando con un sistema de archivos ext4 y necesita restaurar un archivo que ha sido eliminado accidentalmente. ¿Qué concepto de los sistemas de archivos permite la recuperación de datos eliminados en ciertas circunstancias?',
      options: [
        'A) Compresión de archivos',
        'B) Desfragmentación',
        'C) journaling y herramientas de recuperación de datos',
        'D) Permisos de archivos'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_20',
      questionText:
          'Para una aplicación que requiere un rendimiento de E/S muy alto y baja latencia, se busca un sistema de almacenamiento que evite el overhead del sistema de archivos tradicional. ¿Qué técnica permite a las aplicaciones acceder directamente a un dispositivo de bloque sin pasar por la capa del sistema de archivos?',
      options: ['A) LVM', 'B) RAID', 'C) Raw device mapping (RDM)', 'D) NFS'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_21',
      questionText:
          'Un equipo de seguridad está realizando un ejercicio de "red teaming" para probar la resistencia de la infraestructura Linux. ¿Qué tipo de actividad se enfoca en simular ataques del mundo real para identificar debilidades en la seguridad del sistema y las defensas organizacionales?',
      options: [
        'A) Escaneo de vulnerabilidades automatizado',
        'B) Auditoría de logs',
        'C) Pentesting (pruebas de intrusión) o Red Teaming',
        'D) Actualizaciones de software rutinarias'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_22',
      questionText:
          'En un entorno de datos masivos, se necesita optimizar un servidor Linux para el procesamiento eficiente de grandes conjuntos de datos. ¿Qué concepto de optimización de memoria es crucial para evitar la sobrecarga de E/S en sistemas con mucha RAM, a menudo configurado en /proc/sys/vm/swappiness?',
      options: [
        'A) Tamaño de la caché de disco',
        'B) Niveles de swappiness',
        'C) Gestión de bloques de disco',
        'D) Fragmentación del disco'
      ],
      correctAnswer: 'B',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_23',
      questionText:
          'Un ingeniero senior está trabajando en un proyecto de IoT y necesita desplegar aplicaciones en dispositivos de borde con recursos limitados. ¿Qué distribución de Kubernetes está diseñada específicamente para entornos de Edge Computing y tiene un footprint ligero?',
      options: [
        'A) OpenShift',
        'B) Google Kubernetes Engine (GKE)',
        'C) K3s (Rancher Kubernetes Engine)',
        'D) Azure Kubernetes Service (AKS)'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_24',
      questionText:
          'Para la configuración de un clúster HPC, se requiere un sistema de archivos distribuido de alto rendimiento que permita el acceso concurrente a los datos desde múltiples nodos. ¿Qué sistema de archivos distribuido es comúnmente utilizado en entornos HPC para proporcionar almacenamiento compartido y de alto rendimiento?',
      options: ['A) NFS', 'B) SMB/CIFS', 'C) Lustre o GPFS', 'D) GlusterFS'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_25',
      questionText:
          'Un profesional de Linux de nivel senior busca una certificación que valide su capacidad para diseñar, implementar y gestionar infraestructuras Linux complejas a nivel empresarial, incluyendo la automatización y la virtualización. ¿Qué certificación de Red Hat es reconocida como de nivel "arquitecto" y cubre estos aspectos avanzados?',
      options: [
        'A) RHCSA (Red Hat Certified System Administrator)',
        'B) RHCE (Red Hat Certified Engineer)',
        'C) RHCA (Red Hat Certified Architect)',
        'D) CompTIA Linux+'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_26',
      questionText:
          'Un equipo de seguridad senior está implementando un sistema de detección y prevención de intrusiones a nivel de red para proteger sus servidores Linux. ¿Qué tipo de sistema se utiliza para monitorear el tráfico de red en busca de patrones de ataque conocidos y puede tomar acciones para bloquearlos?',
      options: [
        'A) Antivirus basado en host',
        'B) Firewall de aplicaciones web (WAF)',
        'C) NIDS/NIPS (Network Intrusion Detection/Prevention System)',
        'D) Auditoría de logs de aplicaciones'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_27',
      questionText:
          'En un entorno de HPC, la gestión de recursos de cómputo es crítica. Se necesita un sistema que asigne eficientemente los trabajos a los nodos disponibles y gestione las colas. ¿Qué tipo de software se utiliza para la gestión de clústeres y la programación de trabajos en entornos HPC (ej., Slurm)?',
      options: [
        'A) Orquestador de contenedores',
        'B) Gestor de paquetes',
        'C) Sistema de gestión de recursos de clúster/scheduler',
        'D) Sistema de monitoreo de red'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_28',
      questionText:
          'Un arquitecto de soluciones está diseñando una estrategia de migración para una aplicación monolítica a una arquitectura de microservicios. En este contexto, ¿qué herramienta de la CNCF (Cloud Native Computing Foundation) es fundamental para la gestión del tráfico entre microservicios, proporcionando características como enrutamiento, resiliencia y observabilidad?',
      options: [
        'A) Docker',
        'B) Kubernetes',
        'C) Istio (Service Mesh)',
        'D) Prometheus'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_29',
      questionText:
          'Para asegurar la infraestructura de la nube, se busca implementar una política de "privilegio mínimo" para las identidades y accesos. ¿Qué servicio de AWS es fundamental para gestionar los permisos de usuarios, grupos y roles que interactúan con los recursos de la nube?',
      options: [
        'A) AWS EC2',
        'B) AWS S3',
        'C) AWS IAM (Identity and Access Management)',
        'D) AWS VPC'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_30',
      questionText:
          'Un equipo de DevOps senior necesita automatizar la creación de AMIs (Amazon Machine Images) o imágenes de VM personalizadas para diferentes entornos, asegurando que estén preconfiguradas y listas para usar. ¿Qué herramienta se utiliza para construir imágenes de máquina a partir de una única configuración de código fuente, compatible con múltiples plataformas?',
      options: ['A) Terraform', 'B) Ansible', 'C) Packer', 'D) Vagrant'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_31',
      questionText:
          'Al optimizar el rendimiento de la red en un servidor Linux de alto tráfico, se observa que el cuello de botella está en el procesamiento de paquetes. ¿Qué tecnología del kernel de Linux permite el procesamiento de paquetes de datos a una velocidad extremadamente alta al eludir parte de la pila de red tradicional?',
      options: [
        'A) Netfilter/iptables',
        'B) Bonding de interfaces',
        'C) eBPF (extended Berkeley Packet Filter)',
        'D) NetworkManager'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_32',
      questionText:
          'Un ingeniero de sistemas senior debe diseñar una solución de almacenamiento distribuido para un clúster de Kubernetes que garantice alta disponibilidad y escalabilidad horizontal para volúmenes persistentes. ¿Qué sistema de almacenamiento distribuido es una opción común para clústeres de contenedores?',
      options: [
        'A) NFS compartido',
        'B) GlusterFS o Ceph',
        'C) Almacenamiento local de nodos',
        'D) Una base de datos relacional'
      ],
      correctAnswer: 'B',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_33',
      questionText:
          'Para la depuración avanzada de problemas en aplicaciones complejas que se ejecutan en Linux, es necesario comprender la interacción entre los procesos y el sistema operativo a nivel de llamadas al sistema. ¿Qué utilidad de línea de comandos es esencial para rastrear las llamadas al sistema y las señales de un proceso?',
      options: ['A) lsof', 'B) pstree', 'C) strace', 'D) netstat'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_34',
      questionText:
          'Un equipo está implementando una solución de observabilidad completa que incluye métricas, logs y trazas. Para la centralización y análisis de logs a gran escala, ¿qué motor de búsqueda distribuido es fundamental en la stack ELK (Elasticsearch, Logstash, Kibana)?',
      options: ['A) Splunk', 'B) Grafana', 'C) Elasticsearch', 'D) Prometheus'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_35',
      questionText:
          'Para la automatización de la configuración en entornos empresariales grandes, se busca una herramienta que pueda gestionar miles de nodos y ofrecer un enfoque de "state management". ¿Qué herramienta de gestión de configuración se basa en un modelo de agente/servidor y permite la aplicación de estados declarativos a la infraestructura?',
      options: ['A) Ansible', 'B) SaltStack', 'C) Puppet', 'D) Chef'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_36',
      questionText:
          'Un ingeniero senior está diseñando una solución de Continuidad del Negocio y Recuperación ante Desastres (BCDR) para servicios críticos en Linux. ¿Qué tipo de estrategia de replicación de bases de datos es fundamental para garantizar la mínima pérdida de datos en caso de un desastre mayor?',
      options: [
        'A) Copias de seguridad diarias',
        'B) Replicación asíncrona',
        'C) Replicación síncrona/streaming replication',
        'D) Solo backups off-site'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_37',
      questionText:
          'Para asegurar la cadena de suministro de software, se requiere una solución que escanee las imágenes de contenedores en busca de vulnerabilidades conocidas antes de ser desplegadas en producción. ¿Qué tipo de herramienta se utiliza para el escaneo de seguridad de imágenes de contenedores?',
      options: [
        'A) Firewall de contenedores',
        'B) Escáner de vulnerabilidades de imágenes (ej., Trivy, Clair)',
        'C) Auditoría de código estática',
        'D) Sistema de monitoreo de contenedores'
      ],
      correctAnswer: 'B',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_38',
      questionText:
          'Un equipo de seguridad está llevando a cabo un análisis de seguridad profundo en un sistema Linux. Han detectado un proceso sospechoso y necesitan obtener la máxima información posible sobre su comportamiento. ¿Qué herramienta se utilizaría para realizar un seguimiento de todas las llamadas al sistema, señales, y eventos de un proceso, incluyendo sus argumentos y valores de retorno, a menudo para análisis forense o depuración avanzada?',
      options: ['A) ps aux', 'B) top', 'C) strace', 'D) lsof'],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_39',
      questionText:
          'En el contexto de la gestión de identidades y accesos en un entorno Linux empresarial, se busca integrar la autenticación y autorización con un directorio centralizado. ¿Qué protocolo se utiliza comúnmente para la autenticación y autorización centralizada contra servicios de directorio como OpenLDAP o Active Directory?',
      options: [
        'A) SSH',
        'B) FTP',
        'C) LDAP (Lightweight Directory Access Protocol)',
        'D) HTTP'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_40',
      questionText:
          'Un equipo de alto rendimiento está desarrollando un módulo del kernel para una aplicación específica. Para depurar problemas en el código del kernel, ¿qué herramienta es esencial para establecer puntos de interrupción, examinar la memoria y el estado del procesador a nivel de kernel?',
      options: [
        'A) gdb (user-space debugger)',
        'B) strace',
        'C) kgdb o crash (kernel debuggers)',
        'D) printk'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_41',
      questionText:
          'Para la orquestación de clústeres a gran escala en producción, se requiere una solución que no solo gestione contenedores, sino también funciones sin servidor, máquinas virtuales y otros recursos. ¿Qué plataforma de orquestación permite la gestión unificada de diversos tipos de cargas de trabajo a escala empresarial?',
      options: [
        'A) Docker Swarm',
        'B) Kubernetes solo para contenedores',
        'C) OpenShift (plataforma empresarial basada en Kubernetes)',
        'D) Apache Mesos'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_42',
      questionText:
          'Un ingeniero senior está optimizando el rendimiento de E/S de disco para una base de datos de alta transaccionalidad. Para entender cómo el kernel gestiona las peticiones de E/S y ajustar su comportamiento, ¿qué scheduler de E/S se enfoca en la latencia y es adecuado para SSDs?',
      options: [
        'A) CFQ (Completely Fair Queuing)',
        'B) Deadline',
        'C) Noop',
        'D) BFQ (Budget Fair Queuing)'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_43',
      questionText:
          'Al diseñar una solución de alta disponibilidad para una aplicación crítica, se considera la necesidad de replicación de datos a través de centros de datos geográficamente separados. ¿Qué tipo de replicación de almacenamiento es clave para la recuperación ante desastres a gran escala?',
      options: [
        'A) Replicación local de disco',
        'B) Replicación síncrona dentro del mismo data center',
        'C) Replicación asíncrona entre data centers',
        'D) Backups en cinta off-site'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_44',
      questionText:
          'Un equipo de investigación está utilizando Linux para simulaciones científicas que requieren la máxima precisión de tiempo y la minimización de interrupciones. ¿Qué tecnología del kernel permite el aislamiento de CPUs y la reducción de la sobrecarga del kernel para cargas de trabajo críticas que necesitan baja latencia y jitter?',
      options: [
        'A) CPU affinity',
        'B) Isolcpus y NoHpet',
        'C) Cgroups',
        'D) Ajuste del planificador de tareas estándar'
      ],
      correctAnswer: 'B',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_45',
      questionText:
          'Para asegurar la conformidad con las normativas de seguridad y auditoría en un entorno Linux empresarial, es necesario establecer líneas base de seguridad y automatizar su verificación. ¿Qué marco de automatización y cumplimiento de seguridad se utiliza para escanear, auditar y reforzar configuraciones de sistemas Linux según estándares predefinidos?',
      options: ['A) Nessus', 'B) OpenSCAP', 'C) Metasploit', 'D) Wireshark'],
      correctAnswer: 'B',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_46',
      questionText:
          'Un ingeniero senior está evaluando la adopción de eBPF para tareas de observabilidad y seguridad en el kernel de Linux. ¿Cuál de las siguientes es una ventaja clave de eBPF para estas aplicaciones?',
      options: [
        'A) Requiere recompilar el kernel para cada cambio.',
        'B) Permite ejecutar código arbitrario en el kernel de forma segura y eficiente.',
        'C) Solo se puede usar para el filtrado de paquetes de red.',
        'D) No es compatible con kernels recientes.'
      ],
      correctAnswer: 'B',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_47',
      questionText:
          'Para la gestión de secretos sensibles (ej., contraseñas de bases de datos, claves API) en entornos de Kubernetes, es fundamental una solución segura y centralizada. ¿Qué herramienta se utiliza comúnmente para almacenar, acceder y auditar secretos de forma segura en entornos distribuidos?',
      options: [
        'A) Variables de entorno en contenedores',
        'B) Archivos de configuración en el sistema de archivos',
        'C) HashiCorp Vault',
        'D) Hardcoding en el código fuente'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_48',
      questionText:
          'Un arquitecto de seguridad está diseñando un sistema para proteger aplicaciones web en contenedores. Para mitigar ataques a nivel de aplicación (ej., inyección SQL, XSS), ¿qué tipo de firewall es esencial para proteger las aplicaciones web de ataques conocidos y día cero?',
      options: [
        'A) Firewall de red (iptables)',
        'B) WAF (Web Application Firewall)',
        'C) Firewall de host (ufw)',
        'D) Firewall de base de datos'
      ],
      correctAnswer: 'B',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_49',
      questionText:
          'En un entorno de HPC, la comunicación entre los nodos es crucial para el rendimiento de las aplicaciones paralelas. ¿Qué estándar de interfaz de programación es fundamental para la comunicación entre procesos en clústeres HPC, permitiendo que las aplicaciones distribuidas se ejecuten de manera eficiente?',
      options: [
        'A) OpenMP',
        'B) POSIX Threads',
        'C) MPI (Message Passing Interface)',
        'D) Sockets de red estándar'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'lnx_sr_50',
      questionText:
          'Un equipo senior está desarrollando una aplicación que requiere interactuar directamente con componentes de hardware a través de la interfaz PCI Express. Para acceder a estos dispositivos desde el espacio de usuario de Linux, ¿qué técnica o API es necesaria para mapear la memoria del dispositivo directamente al espacio de direcciones del proceso?',
      options: [
        'A) Interrupciones del kernel',
        'B) sysfs o debugfs',
        'C) mmap sobre /dev/mem o UIO (Userspace I/O)',
        'D) Llamadas a la BIOS'
      ],
      correctAnswer: 'C',
      language: 'Linux',
      module: 'Sr',
    ),
  ];

  // Insertar las preguntas en la base de datos
  for (final question in preloadedLinuxSrQuestions) {
    await db.insert(tableName, question.toMap());
  }
}
