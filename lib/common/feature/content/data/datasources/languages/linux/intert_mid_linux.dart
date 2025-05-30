import 'package:sqflite_common/sqlite_api.dart';

Future<void> insertMidLevel1DataLinux(Database db) async {
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Administración Avanzada del Sistema',
    'topic': 'Gestión Avanzada de Paquetes',
    'subtopic': 'Creación de paquetes RPM/DEB',
    'definition': r'''
Crear tus propios paquetes RPM (Red Hat Package Manager) o DEB (Debian package) es llevar la gestión de software en Linux al siguiente nivel. En lugar de instalar programas compilando el código fuente o usando scripts manuales, empaquetas tu aplicación y sus dependencias en un formato que el sistema entiende y puede gestionar de forma limpia.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en la comodidad de instalar software con un simple `apt install` o `dnf install`. Esa comodidad es gracias a los paquetes. Si desarrollas software o necesitas desplegar una aplicación personalizada en muchos servidores, crear tus propios paquetes te ahorra un montón de trabajo. Asegura que la instalación, actualización y desinstalación sean consistentes y sin problemas, evitando los famosos "infiernos de dependencias". Es una práctica estándar en entornos de producción y para desarrolladores de software que distribuyen sus aplicaciones en Linux.

Para crear un paquete, necesitas definir cómo se compila el software, dónde se instalan los archivos, cuáles son sus dependencias y cómo se manejan los scripts de pre-instalación o post-instalación. Los paquetes RPM usan un archivo `.spec` para describir todo esto, mientras que los paquetes DEB utilizan un directorio `debian/` con varios archivos de control. Ambos formatos te permiten incluir scripts que se ejecutan en momentos específicos (antes de instalar, después de instalar, antes de desinstalar, etc.), lo cual es muy útil para tareas como crear usuarios, configurar permisos o reiniciar servicios. Dominar la creación de paquetes es una habilidad invaluable para cualquier sysadmin que busque automatizar el despliegue de software y mantener entornos limpios y estables.
''',
    'code_example': r'''
// Ejemplo básico: Estructura de un archivo .spec para RPM (conceptos clave)
// Este no es un script ejecutable directamente, sino un ejemplo de contenido de archivo.
/*
Name:           mi-aplicacion
Version:        1.0.0
Release:        1%{?dist}
Summary:        Mi primera aplicación empaquetada
License:        GPLv3+
URL:            http://www.ejemplo.com
Source0:        %{name}-%{version}.tar.gz
BuildRequires:  gcc make
Requires:       bash >= 4.0

%description
Este es un ejemplo de descripción para mi aplicación.

%prep
%setup -q

%build
%configure
make %{?_smp_mflags}

%install
rm -rf %{buildroot}
make install DESTDIR=%{buildroot}

%files
/usr/bin/mi-aplicacion
/etc/mi-aplicacion.conf

%changelog
* Vie May 30 2025 Tu Nombre <tu_correo@ejemplo.com> - 1.0.0-1
- Versión inicial del paquete.
*/

// Ejemplo básico: Archivo control de un paquete DEB (conceptos clave)
// Este es el contenido de un archivo 'control' dentro del directorio 'debian'
/*
Package: mi-aplicacion
Version: 1.0.0
Architecture: amd64
Maintainer: Tu Nombre <tu_correo@ejemplo.com>
Description: Mi primera aplicación empaquetada para Debian.
 Es una aplicación de ejemplo para demostrar la creación de paquetes DEB.
Depends: bash (>= 4.0), libc6
Priority: optional
Section: utils
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Administración Avanzada del Sistema',
    'topic': 'Gestión Avanzada de Paquetes',
    'subtopic': 'Repositorios personalizados',
    'definition': r'''
Los repositorios personalizados son como tu propia tienda de aplicaciones, pero para tus servidores Linux. En lugar de depender de los repositorios oficiales de tu distribución, que contienen miles de paquetes, puedes crear uno propio con las aplicaciones que necesitas, versiones específicas o tus propios paquetes personalizados (los que acabamos de ver cómo crear).

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una empresa que tiene software interno o configuraciones muy específicas que necesita desplegar en cientos de máquinas. ¿Vas a instalar cada cosa manualmente? ¡Ni de broma! Los repositorios personalizados te permiten centralizar la distribución de software, garantizando que todos los servidores tengan las mismas versiones de los mismos paquetes. Esto simplifica enormemente la gestión de actualizaciones, la seguridad y la consistencia en tu infraestructura. Es una pieza clave en la automatización del despliegue de software a gran escala.

Para crear un repositorio, necesitas un servidor web (Apache o Nginx) para servir los archivos de los paquetes y una herramienta que genere los metadatos del repositorio. En sistemas basados en Red Hat (RPM), se usa `createrepo` para generar el archivo `repodata/repomd.xml` y sus anexos. En sistemas basados en Debian (DEB), se usa `dpkg-scanpackages` y `apt-ftparchive` para generar los archivos `Packages` y `Release`. Una vez que tienes el repositorio montado, solo necesitas añadir la URL de tu repositorio a la configuración del gestor de paquetes (`/etc/yum.repos.d/` para RPM o `/etc/apt/sources.list.d/` para DEB) en tus servidores cliente, ¡y listo! Tus servidores podrán instalar y actualizar software desde tu propio repositorio. Esto es fundamental para construir y mantener entornos de producción de manera eficiente.
''',
    'code_example': r'''
// Ejemplo para RHEL/CentOS: Creación de un repositorio YUM/DNF
// Suponiendo que tus paquetes .rpm están en /var/www/html/mi_repo
// 1. Instalar la herramienta para crear repositorios
sudo dnf install createrepo -y

// 2. Navegar al directorio de tus paquetes
cd /var/www/html/mi_repo

// 3. Crear los metadatos del repositorio
createrepo .

// 4. Configuración en el cliente (ejemplo de archivo .repo)
// Contenido de /etc/yum.repos.d/mi_repo.repo
/*
[mi_repo]
name=Mi Repositorio Personalizado
baseurl=http://tu_servidor_web/mi_repo
enabled=1
gpgcheck=0 # Opcional: Desactivar la verificación GPG si no estás firmando tus paquetes aún
*/

// Ejemplo para Debian/Ubuntu: Creación de un repositorio APT
// Suponiendo que tus paquetes .deb están en /var/www/html/mi_repo/debs
// 1. Instalar herramientas
sudo apt install dpkg-dev -y

// 2. Navegar al directorio de tus paquetes
cd /var/www/html/mi_repo/debs

// 3. Generar el archivo Packages.gz
dpkg-scanpackages . /dev/null | gzip -9c > Packages.gz

// 4. Configuración en el cliente (ejemplo de archivo .list)
// Contenido de /etc/apt/sources.list.d/mi_repo.list
/*
deb http://tu_servidor_web/mi_repo/debs ./
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Administración Avanzada del Sistema',
    'topic': 'Gestión Avanzada de Paquetes',
    'subtopic': 'Firmado de paquetes',
    'definition': r'''
Firmar paquetes es como ponerle un sello de autenticidad a tu software. Es un proceso de seguridad que utiliza criptografía para asegurar que un paquete no ha sido alterado desde que fue creado por su autor original y que realmente proviene de la fuente que dice ser. En el mundo de la administración de sistemas, la confianza lo es todo.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en descargar un archivo de internet. ¿Cómo sabes que no contiene malware o que no fue modificado por alguien malintencionado? El firmado de paquetes resuelve este problema. Cuando un gestor de paquetes como `apt` o `dnf` descarga un paquete, primero verifica la firma criptográfica. Si la firma es válida y coincide con la clave pública que el sistema ya confía, el paquete se instala. Si no, la instalación se rechaza, protegiendo tu sistema de software corrupto o malicioso. Esta es una práctica fundamental en la cadena de suministro de software y es indispensable para mantener la seguridad de tus servidores.

Para firmar paquetes, necesitas un par de claves GPG (GNU Privacy Guard): una clave privada (que mantienes en secreto) para firmar los paquetes, y una clave pública (que distribuyes) para que los usuarios puedan verificar la firma. Al crear paquetes RPM, la firma se integra durante el proceso de construcción. Para los paquetes DEB, firmas el archivo `Release` del repositorio, no cada paquete individual. Una vez firmado, los usuarios importan tu clave pública a su sistema. Cuando intentan instalar un paquete de tu repositorio, el gestor de paquetes usa esa clave pública para verificar la firma, garantizando la integridad y autenticidad del paquete. Es un paso crucial para la seguridad en la distribución de software, especialmente en entornos de producción donde la integridad es vital.
''',
    'code_example': r'''
// Ejemplo: Proceso de firmado de un paquete RPM (general)
// 1. Generar una clave GPG (si no tienes una)
// gpg --full-generate-key

// 2. Exportar tu clave pública (para que los usuarios puedan importarla)
// gpg --export -a "Tu Nombre" > PUBLIC-KEY.asc

// 3. Configurar RPM para usar tu clave (en ~/.rpmmacros o /etc/rpm/macros)
/*
%_gpg_name Tu Nombre
*/

// 4. Reconstruir y firmar un paquete RPM
// rpmbuild --rebuild --sign mi-aplicacion-1.0.0-1.src.rpm

// Ejemplo: Firmado de un repositorio DEB (archivo Release)
// 1. Crear el archivo Release (después de generar Packages.gz)
// apt-ftparchive release . > Release

// 2. Firmar el archivo Release con tu clave GPG
// gpg --clearsign -o InRelease Release
// O: gpg -abs -o Release.gpg Release

// 3. En el cliente, importar la clave pública
// sudo apt-key add PUBLIC-KEY.asc # (En sistemas modernos, usar apt-key es obsoleto; se prefiere /etc/apt/trusted.gpg.d/)
// sudo gpg --no-default-keyring --keyring /etc/apt/trusted.gpg.d/tu_repo.gpg --import PUBLIC-KEY.asc
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Administración Avanzada del Sistema',
    'topic': 'Gestión Avanzada de Paquetes',
    'subtopic': 'Gestión de dependencias complejas',
    'definition': r'''
La gestión de dependencias complejas es uno de esos retos que te hacen sudar en la administración de sistemas. Se trata de cuando un software no solo necesita un paquete específico, sino una versión particular de ese paquete, o interactúa con otros componentes que tienen sus propias dependencias, creando una maraña de requisitos que pueden ser difíciles de desenredar.

¿Te estás preguntando por qué esto se vuelve un dolor de cabeza? 

Pensemos por un momento en un plato de comida que requiere varios ingredientes, y cada ingrediente a su vez necesita preparaciones especiales o no puede mezclarse con ciertos otros. Las dependencias en software son similares. Si el gestor de paquetes no puede resolver todas las interacciones entre los requisitos, te encontrarás con el famoso "infierno de dependencias" o conflictos que impiden la instalación o actualización. Esto es especialmente común cuando trabajas con software de terceros, versiones antiguas, o cuando necesitas tener múltiples versiones de una misma librería en el mismo sistema.

Los gestores de paquetes como `apt` y `dnf` están diseñados para manejar la mayoría de las dependencias automáticamente, pero en escenarios complejos, necesitarás intervenir. Esto implica entender cómo funcionan los archivos de control de paquetes (como el `control` de DEB o el `.spec` de RPM) para ver las dependencias declaradas. A veces, la solución implica:
* **Pinning de paquetes:** Especificar versiones exactas o rangos de versiones para un paquete.
* **Backports o repositorios de terceros:** Usar fuentes adicionales que contengan las versiones de dependencia que necesitas.
* **Contenedores (Docker):** Aislar la aplicación y sus dependencias en un entorno propio para evitar conflictos con el sistema base. Esto se ha vuelto una solución muy popular para las dependencias complejas.
* **Solución manual:** En casos extremos, descargar paquetes individuales y resolver las dependencias a mano (lo cual es tedioso y propenso a errores, ¡evítalo si puedes!).

Dominar la gestión de dependencias no es solo saber usar el gestor de paquetes, sino entender cómo las aplicaciones interactúan con el sistema y cómo las herramientas te ayudan a mantener esa relación en orden.
''',
    'code_example': r'''
// Ejemplo para Debian/Ubuntu: Pinning de paquetes (priorizar una versión específica)
// Contenido de /etc/apt/preferences.d/mi_preferencia
/*
Package: mi-libreria
Pin: version 1.2.3
Pin-Priority: 990

Package: mi-libreria
Pin: origin "http://repo.ejemplo.com/debian"
Pin-Priority: 900
*/

// Ejemplo para RHEL/CentOS: Excluir un paquete de actualizaciones para evitar conflictos
// Edita el archivo .repo de tu repositorio (ej. /etc/yum.repos.d/epel.repo)
/*
[epel]
name=Extra Packages for Enterprise Linux $releasever - $basearch
# ... otras configuraciones ...
exclude=mi-paquete-problematico # Excluir este paquete de las actualizaciones
*/

// Ejemplo conceptual de una dependencia compleja con Docker
// Imagine que tienes una aplicación 'app_legacy' que requiere Python 2.7
// y una 'app_nueva' que requiere Python 3.9.
// En lugar de instalar ambas versiones en el mismo sistema (lo cual es difícil y propenso a conflictos),
// puedes ejecutarlas en contenedores Docker separados.

// Dockerfile para app_legacy
/*
FROM python:2.7-slim-buster
WORKDIR /app
COPY requirements_legacy.txt .
RUN pip install -r requirements_legacy.txt
COPY app_legacy.py .
CMD ["python", "app_legacy.py"]
*/

// Dockerfile para app_nueva
/*
FROM python:3.9-slim-buster
WORKDIR /app
COPY requirements_new.txt .
RUN pip install -r requirements_new.txt
COPY app_nueva.py .
CMD ["python", "app_nueva.py"]
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Administración Avanzada del Sistema',
    'topic': 'Sistema de Archivos Avanzado',
    'subtopic': 'Sistemas de archivos especializados (XFS, Btrfs)',
    'definition': r'''
Más allá de los sistemas de archivos que usas a diario como ext4, existen opciones más especializadas como XFS y Btrfs que ofrecen funcionalidades avanzadas y están optimizadas para cargas de trabajo específicas o para la gestión moderna de datos. Conocerlos te da una ventaja en entornos de alto rendimiento o de almacenamiento flexible.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en diferentes tipos de vehículos; un coche normal te lleva al trabajo, pero una furgoneta o un camión están diseñados para tareas más pesadas o especializadas. Lo mismo ocurre con los sistemas de archivos. Mientras que ext4 es excelente para un uso general, XFS brilla en sistemas con grandes volúmenes de datos y operaciones intensivas de entrada/salida (I/O), y Btrfs ofrece características como snapshots y pools de almacenamiento que son un gran avance.

**XFS** es conocido por su robustez y rendimiento, especialmente con archivos muy grandes y sistemas de archivos de gran tamaño. Es la opción por defecto en Red Hat Enterprise Linux para las particiones del sistema. Su diseño de journaling optimizado lo hace muy rápido en escrituras y recuperaciones tras un fallo. Es ideal para servidores de archivos, bases de datos o sistemas de almacenamiento masivo.

**Btrfs** (B-tree File System) es un sistema de archivos más moderno que se enfoca en características de gestión de volumen de siguiente generación. Piensa en él como una combinación de un sistema de archivos y un gestor de volúmenes lógicos (como LVM). Sus características estrella incluyen:
* **Snapshots:** Crear "fotografías" instantáneas del sistema de archivos que puedes revertir o usar para backups, casi sin ocupar espacio adicional. Esto es increíblemente útil para probar configuraciones o recuperarse de errores.
* **Subvolúmenes:** Crear sistemas de archivos anidados que se pueden montar y desmontar de forma independiente, y que pueden tener sus propios snapshots.
* **Pooling de almacenamiento:** Combinar múltiples discos en un solo volumen lógico y gestionar RAID por software a nivel del sistema de archivos.
* **Checksums:** Integridad de datos para detectar y corregir errores.
* **Compresión y deduplicación:** Ahorro de espacio en disco.

Mientras que ext4 es la opción segura y probada para la mayoría, XFS y Btrfs ofrecen herramientas poderosas para entornos que exigen más de su almacenamiento, y entender cuándo y cómo usarlos es una habilidad valiosa.
''',
    'code_example': r'''
// Ejemplo: Crear un sistema de archivos XFS
// Suponiendo que tienes una partición /dev/sdb1 disponible
sudo mkfs.xfs /dev/sdb1

// Montar el sistema de archivos XFS
sudo mkdir /mnt/data_xfs
sudo mount /dev/sdb1 /mnt/data_xfs

// Ejemplo: Crear un sistema de archivos Btrfs y un subvolumen
// Suponiendo que tienes una partición /dev/sdc1 disponible
sudo mkfs.btrfs /dev/sdc1

// Montar el sistema de archivos Btrfs
sudo mkdir /mnt/data_btrfs
sudo mount /dev/sdc1 /mnt/data_btrfs

// Crear un subvolumen dentro del sistema de archivos Btrfs
sudo btrfs subvolume create /mnt/data_btrfs/home_backups

// Crear un snapshot de un subvolumen Btrfs
sudo btrfs subvolume snapshot /mnt/data_btrfs/home_backups /mnt/data_btrfs/home_backups_snap_$(date +%Y%m%d)

// Ejemplo incorrecto: Intentar crear un sistema de archivos Btrfs sin la herramienta adecuada
// sudo mkfs.btrf /dev/sdc1 # Error de comando, debería ser 'btrfs'
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Administración Avanzada del Sistema',
    'topic': 'Sistema de Archivos Avanzado',
    'subtopic': 'Quotas avanzadas',
    'definition': r'''
Las quotas avanzadas son como el policía del disco duro. Te permiten limitar la cantidad de espacio en disco o el número de archivos que un usuario o un grupo puede utilizar en un sistema de archivos. Si en el nivel junior aprendiste lo básico de `df` y `du`, aquí veremos cómo ponerle un freno a la explosión de datos.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en un servidor con muchos usuarios; si uno solo empieza a guardar películas en alta definición sin control, ¡adiós espacio en disco para todos! Las quotas son esenciales en entornos multiusuario, servidores de archivos, o cualquier sistema donde necesites controlar el consumo de recursos. Evitan que un usuario o un proceso acapare todo el espacio en disco y garantizan la disponibilidad para los demás.

Las quotas en Linux operan a dos niveles:
* **Quotas de disco (Disk Quotas):** Limitan la cantidad de bloques (espacio en disco) que un usuario o grupo puede consumir.
* **Quotas de inodos (Inode Quotas):** Limitan la cantidad de inodos (archivos o directorios) que un usuario o grupo puede crear.

Además de los límites "duros" (hard limits) que no se pueden exceder bajo ninguna circunstancia, las quotas también tienen límites "blandos" (soft limits) con un período de gracia. Esto significa que un usuario puede exceder el límite blando por un corto tiempo, pero si no reduce su uso antes de que expire el período de gracia, el límite blando se convierte en un límite duro. Configurar quotas implica modificar el archivo `/etc/fstab` para habilitarlas en una partición, ejecutar `quotacheck` para construir las tablas de quota y luego `edquota` para asignar límites a usuarios o grupos específicos. Es una herramienta poderosa para mantener el orden y la equidad en el uso del almacenamiento.
''',
    'code_example': r'''
// Ejemplo: Habilitar quotas en una partición y configurar una quota para un usuario
// 1. Modificar /etc/fstab para la partición /home (añadir usrquota,grpquota)
// Original:
// /dev/sda1 /home ext4 defaults 0 2
// Con quotas:
// /dev/sda1 /home ext4 defaults,usrquota,grpquota 0 2

// 2. Remontar la partición (o reiniciar) para que los cambios surtan efecto
sudo mount -o remount /home

// 3. Crear los archivos de quota y verificar su estado inicial
sudo quotacheck -cumg /home
# El comando anterior crea aquota.user y aquota.group en /home

// 4. Habilitar las quotas
sudo quotaon /home

// 5. Editar la quota para un usuario (ej. 'juan')
sudo edquota -u juan
# Esto abrirá un editor de texto (vi por defecto)
# Verás algo así:
# Disk quotas for user juan (uid 1001):
#   Filesystem            blocks       soft       hard     inodes     soft     hard
#   /dev/sda1                  0       102400     102400   0          0        0
# Aquí, '102400' es 100MB (102400 KB) para soft y hard limits en bloques.
# Si quieres un límite de 1GB: 1048576 (KB) para soft y hard.

// 6. Verificar el uso de quota para un usuario
quota -s -u juan

// Ejemplo incorrecto: Intentar establecer una quota sin habilitar las quotas en el fstab
// sudo edquota -u pedro # Fallará si la partición no está configurada para quotas.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Administración Avanzada del Sistema',
    'topic': 'Sistema de Archivos Avanzado',
    'subtopic': 'ACLs (Access Control Lists)',
    'definition': r'''
Las ACLs (Access Control Lists) son una extensión del sistema de permisos tradicional de Linux que te permiten un control mucho más granular sobre quién puede acceder a un archivo o directorio. Si los permisos `chmod` son como las luces de un semáforo (rojo/verde/amarillo), las ACLs son como un sistema de tráfico inteligente que te permite reglas muy específicas.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en un escenario donde necesitas que varios usuarios de diferentes grupos tengan acceso de escritura a un mismo directorio, pero no quieres cambiar el grupo propietario del directorio o añadir a todos a un mismo grupo masivo. Los permisos tradicionales (propietario, grupo, otros) se quedan cortos aquí. Las ACLs te permiten definir permisos para usuarios y grupos específicos que no son el propietario ni el grupo principal del archivo, ofreciendo una flexibilidad que es vital en entornos multiusuario complejos y para cumplir con requisitos de seguridad más estrictos.

Las ACLs se gestionan con los comandos `getfacl` para ver las ACLs de un archivo/directorio y `setfacl` para modificarlas. Puedes otorgar permisos de lectura, escritura y ejecución a usuarios individuales o grupos específicos, y también controlar cómo se heredan estos permisos a los archivos y directorios recién creados dentro de un directorio. Por ejemplo, podrías permitir que un usuario particular tenga permiso de escritura en un directorio que pertenece a otro grupo, o que un grupo de auditoría solo tenga permiso de lectura en ciertos archivos de log, sin afectar los permisos del propietario o el grupo principal. Esta granularidad es la clave de las ACLs, permitiéndote construir un sistema de permisos mucho más adaptado a tus necesidades y políticas de seguridad.
''',
    'code_example': r'''
// Ejemplo: Usar ACLs para dar permisos específicos a un usuario
// 1. Crear un archivo de prueba
touch mi_archivo.txt

// 2. Establecer permisos normales (propietario: rwx, grupo: rw, otros: r)
chmod 764 mi_archivo.txt

// 3. Verificar los permisos normales
ls -l mi_archivo.txt
# -rwxrw-r-- 1 usuario1 grupo1 0 May 30 10:00 mi_archivo.txt

// 4. Dar permiso de escritura al usuario 'juan' en 'mi_archivo.txt' (sin que sea propietario o parte del grupo principal)
sudo setfacl -m u:juan:rw mi_archivo.txt

// 5. Verificar las ACLs del archivo (verás un signo '+')
ls -l mi_archivo.txt
# -rwxrw-r--+ 1 usuario1 grupo1 0 May 30 10:00 mi_archivo.txt

// 6. Ver los detalles de la ACL
getfacl mi_archivo.txt
# # file: mi_archivo.txt
# # owner: usuario1
# # group: grupo1
# user::rwx
# user:juan:rw-      # Usuario 'juan' tiene permisos de lectura y escritura
# group::rw-
# mask::rw-
# other::r--

// Ejemplo: Dar permisos a un grupo específico (que no es el grupo principal)
sudo setfacl -m g:auditors:r-x /var/log/aplicacion

// Ejemplo incorrecto: Intentar usar chmod para permisos de usuario/grupo individual (no es posible con chmod)
// chmod u:juan:rw mi_archivo.txt # No funciona con chmod.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Administración Avanzada del Sistema',
    'topic': 'Sistema de Archivos Avanzado',
    'subtopic': 'Auditoría de archivos (auditd)',
    'definition': r'''
La auditoría de archivos con `auditd` es como instalar cámaras de seguridad en tu sistema de archivos. Te permite registrar detalladamente quién accedió a qué archivo, cuándo y de qué manera (leer, escribir, ejecutar). Es una herramienta fundamental para la seguridad y el cumplimiento normativo en entornos de producción.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en un banco que necesita saber quién accede a la caja fuerte y qué operaciones realiza. En un servidor, los archivos son la "caja fuerte". Si alguien modifica un archivo crítico, si un proceso inesperado accede a datos sensibles, o si hay un intento de acceso no autorizado, `auditd` puede registrar esa actividad. Esto es crucial para la forense digital, para detectar intrusiones, para el cumplimiento de estándares de seguridad (como PCI DSS, HIPAA) y para entender el comportamiento del sistema.

`auditd` es un demonio (servicio) que se ejecuta en segundo plano y utiliza reglas predefinidas para monitorear el acceso a archivos, la ejecución de programas, los cambios en la configuración del sistema, los eventos de autenticación y mucho más. Las reglas se definen en archivos de configuración (generalmente en `/etc/audit/rules.d/`) y se cargan usando el comando `auditctl`. Por ejemplo, podrías configurar una regla para registrar cada vez que alguien intenta escribir en un archivo de configuración crítico como `/etc/passwd` o `/etc/sudoers`. Los eventos auditados se escriben en los logs de auditoría (normalmente en `/var/log/audit/audit.log`). Luego, puedes usar herramientas como `ausearch` para buscar eventos específicos o `aureport` para generar informes. Configurar `auditd` de forma efectiva puede ser un poco complejo debido a la granularidad de sus reglas, pero el nivel de visibilidad que te ofrece sobre la actividad del sistema de archivos es invaluable para la seguridad avanzada.
''',
    'code_example': r'''
// Ejemplo: Configurar una regla de auditoría para un archivo sensible con auditd
// 1. Instalar el paquete auditd (si no está instalado)
sudo apt install auditd -y # Debian/Ubuntu
// sudo dnf install audit -y # RHEL/CentOS

// 2. Añadir una regla para monitorear escrituras en /etc/sudoers (como ejemplo)
// Esto se añade a un archivo en /etc/audit/rules.d/ o directamente con auditctl -w
// -w /etc/sudoers: monitorea el archivo /etc/sudoers
// -p wa: monitorea intentos de escritura (w) y cambios de atributos (a)
// -k sudoers_changes: una clave para identificar fácilmente los eventos relacionados con esta regla
sudo auditctl -w /etc/sudoers -p wa -k sudoers_changes

// 3. Reiniciar el servicio auditd para que la regla se aplique (o recargar con auditctl -R)
sudo systemctl restart auditd

// 4. Intentar modificar el archivo /etc/sudoers (como un usuario normal, para generar un evento)
// echo "Hola mundo" >> /etc/sudoers # Esto generará un permiso denegado, pero auditd lo registrará.

// 5. Buscar los eventos en el log de auditoría
sudo ausearch -k sudoers_changes -i
# -k sudoers_changes: busca por la clave que definimos
# -i: interpreta los números de usuario/grupo en nombres legibles

// Ejemplo de salida esperada (simplificada):
/*
type=SYSCALL msg=audit(...) arch=c000003e syscall=263 success=no exit=-13 a0=...
name="/etc/sudoers" ... comm="bash" exe="/usr/bin/bash" ...
key="sudoers_changes"
*/

// Ejemplo incorrecto: No persistir las reglas (se pierden al reiniciar auditd)
// auditctl -w /etc/shadow -p rwxa # Esta regla es temporal y no se guardará en /etc/audit/rules.d/
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Administración Avanzada del Sistema',
    'topic': 'Redes Avanzadas',
    'subtopic': 'Enlace de interfaces (bonding, teaming)',
    'definition': r'''
El enlace de interfaces, conocido como *bonding* o *teaming* en Linux, es una técnica que te permite combinar varias interfaces de red físicas (como tarjetas Ethernet) en una sola interfaz lógica. Piensa en ello como si unieras varios cables de red para formar uno solo, más grande y más robusto.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en la importancia de la redundancia y el rendimiento en una red. Si tienes un solo cable de red conectado a tu servidor y este falla, tu servidor se queda sin conexión. Con el *bonding*, si una de las interfaces físicas falla, el tráfico se redirige automáticamente por las interfaces restantes, manteniendo la conectividad (¡redundancia!). Además, dependiendo del modo de configuración, puedes sumar el ancho de banda de las interfaces, logrando mayor rendimiento de red (¡velocidad!). Esto es crucial en servidores de producción, firewalls o cualquier sistema que dependa de una conexión de red estable y de alto rendimiento.

Existen varios modos de *bonding* o *teaming*, cada uno con sus propias ventajas:
* **Balanceo de carga (Load Balancing):** Distribuye el tráfico entre las interfaces activas, aumentando el rendimiento.
* **Tolerancia a fallos (Failover):** Si una interfaz falla, el tráfico se conmuta automáticamente a otra.
* **Agregación de enlaces (Link Aggregation):** Combina el ancho de banda de varias interfaces (requiere soporte en el switch).

En sistemas Red Hat, el *teaming* es la herramienta preferida y más moderna para esto, mientras que el *bonding* es una opción más tradicional disponible en todas las distribuciones. La configuración implica la creación de una interfaz maestra y la asignación de las interfaces esclavas a ella, definiendo el modo de operación. Dominar estas técnicas te permite construir redes más resilientes y de mayor rendimiento, lo cual es una habilidad muy valorada en entornos empresariales.
''',
    'code_example': r'''
// Ejemplo: Configuración básica de bonding en modo active-backup (tolerancia a fallos)
// Esto es un ejemplo conceptual, la implementación puede variar ligeramente entre distribuciones.

// Para sistemas basados en Debian/Ubuntu (ej. /etc/network/interfaces)
/*
auto bond0
iface bond0 inet static
    address 192.168.1.100
    netmask 255.255.255.0
    gateway 192.168.1.1
    bond-mode active-backup
    bond-miimon 100
    bond-slaves eth0 eth1 # Nombres de tus interfaces físicas

auto eth0
iface eth0 inet manual
    bond-master bond0

auto eth1
iface eth1 inet manual
    bond-master bond0
*/

// Para sistemas basados en RHEL/CentOS (ej. archivos en /etc/sysconfig/network-scripts/)
// ifcfg-bond0
/*
TYPE=Bond
DEVICE=bond0
IPADDR=192.168.1.100
PREFIX=24
GATEWAY=192.168.1.1
ONBOOT=yes
BOOTPROTO=none
BONDING_OPTS="mode=1 miimon=100" # mode=1 es active-backup
*/

// ifcfg-eth0
/*
TYPE=Ethernet
BOOTPROTO=none
DEVICE=eth0
ONBOOT=yes
MASTER=bond0
SLAVE=yes
*/

// ifcfg-eth1
/*
TYPE=Ethernet
BOOTPROTO=none
DEVICE=eth1
ONBOOT=yes
MASTER=bond0
SLAVE=yes
*/

// Verificar el estado del bonding (después de configurar y reiniciar la red)
cat /proc/net/bonding/bond0

// Ejemplo incorrecto: No asignar esclavos a la interfaz maestra o usar nombres de interfaz incorrectos.
// iface bond0 inet static
//     bond-slaves ethX ethY # Si ethX o ethY no existen, el bonding no funcionará.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Administración Avanzada del Sistema',
    'topic': 'Redes Avanzadas',
    'subtopic': 'Enrutamiento avanzado',
    'definition': r'''
El enrutamiento avanzado va más allá de las tablas de enrutamiento estáticas que aprendiste en el nivel junior. Aquí hablamos de cómo hacer que tu servidor Linux actúe como un router inteligente, decidiendo el mejor camino para los paquetes de datos basándose en reglas complejas, múltiples interfaces de red y diferentes métricas.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una empresa que tiene varias conexiones a internet, o diferentes subredes que necesitan comunicarse de forma óptima. Un router simple no es suficiente. El enrutamiento avanzado te permite implementar políticas de enrutamiento dinámicas, balanceo de carga entre múltiples enlaces (multi-WAN), failover automático, y enrutamiento basado en políticas (PBR), donde el tráfico se enruta de manera diferente según su origen, destino o tipo. Esto es fundamental para construir redes robustas, eficientes y tolerantes a fallos en entornos corporativos o de proveedores de servicios.

Las herramientas clave para el enrutamiento avanzado en Linux son el comando `ip` (parte de iproute2), que es mucho más potente que el antiguo `route`, y el sistema de `netfilter/iptables` (o `nftables` en sistemas más modernos) para el filtrado de paquetes. Puedes configurar múltiples tablas de enrutamiento, establecer reglas que dirijan el tráfico a tablas específicas, y usar funcionalidades como `ip rule` para enrutamiento basado en políticas. Por ejemplo, podrías configurar que el tráfico de ciertos usuarios o aplicaciones salga por una conexión a internet diferente a la del tráfico general, o que en caso de caída de una conexión principal, el tráfico se redirija automáticamente a una conexión de respaldo. Dominar estas técnicas te convierte en un experto en la gestión de flujos de tráfico en redes Linux, lo cual es una habilidad de alto nivel.
''',
    'code_example': r'''
// Ejemplo: Enrutamiento basado en políticas (PBR) con ip rule
// Suponiendo que tienes dos interfaces: eth0 (Internet principal) y eth1 (Internet de respaldo)
// Y un tráfico específico que quieres enrutar por eth1.

// 1. Crear una nueva tabla de enrutamiento
sudo ip route add default via 192.168.2.1 dev eth1 table 100 # Default gateway para la nueva tabla

// 2. Añadir una regla para que el tráfico de una IP de origen específica use esta tabla
sudo ip rule add from 192.168.1.50 table 100 priority 100

// 3. (Opcional) Hacer persistente la configuración (varía según la distro)
// En Debian/Ubuntu: Añadir al archivo /etc/network/interfaces o scripts de inicio
// En RHEL/CentOS: Crear archivos en /etc/sysconfig/network-scripts/rule-ethX, route-ethX

// Ejemplo de Multi-WAN con iptables (NAT para dos interfaces de salida)
// sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
// sudo iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE

// Ejemplo incorrecto: Sobrecargar la tabla de enrutamiento principal con rutas muy específicas
// sudo ip route add 192.168.3.0/24 via 192.168.1.1 dev eth0 # Si se hace para muchas redes, es inmanejable.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Administración Avanzada del Sistema',
    'topic': 'Redes Avanzadas',
    'subtopic': 'VPNs (OpenVPN, WireGuard)',
    'definition': r'''
Las VPNs (Virtual Private Networks) son túneles seguros que te permiten conectar redes privadas a través de una red pública (como Internet), como si estuvieran físicamente conectadas. Esto crea un camino seguro para el tráfico de datos, protegiéndolo de espionaje o manipulación. Dos de las soluciones más populares en Linux son OpenVPN y WireGuard.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en un trabajador remoto que necesita acceder a los recursos internos de la oficina de forma segura, o en dos oficinas geográficamente separadas que necesitan comunicarse como si estuvieran en la misma red. Las VPNs hacen esto posible. Son esenciales para la seguridad de las comunicaciones, para el acceso remoto seguro y para interconectar redes de forma privada a través de Internet.

**OpenVPN** es una solución VPN muy madura y flexible, basada en SSL/TLS. Es muy configurable y ofrece una gran cantidad de opciones de cifrado y autenticación. Aunque su configuración puede ser un poco más compleja y su rendimiento, aunque bueno, puede ser ligeramente inferior a soluciones más nuevas debido a su uso de TCP (aunque también soporta UDP), su robustez y su adopción generalizada lo hacen una opción muy fiable. Es ideal para conexiones cliente-servidor, donde cada usuario tiene un certificado único.

**WireGuard** es una solución VPN más moderna, diseñada para ser simple, rápida y segura. Utiliza criptografía de última generación y tiene un código mucho más pequeño que OpenVPN, lo que lo hace más fácil de auditar y potencialmente más seguro. Su rendimiento es notablemente superior, especialmente en dispositivos móviles o con recursos limitados. Su configuración es sorprendentemente simple, basándose en el intercambio de claves públicas. Aunque es más reciente, su eficiencia y simplicidad lo están convirtiendo rápidamente en el favorito para muchos administradores de sistemas y desarrolladores.

Ambas son herramientas poderosas para construir redes seguras, y la elección entre una u otra dependerá de tus necesidades específicas de rendimiento, flexibilidad y facilidad de configuración.
''',
    'code_example': r'''
// Ejemplo básico: Configuración de OpenVPN Server (conceptual)
// Estos son fragmentos de un archivo de configuración de servidor OpenVPN (.conf)
/*
port 1194
proto udp
dev tun
ca ca.crt
cert server.crt
key server.key
dh dh.pem
server 10.8.0.0 255.255.255.0
ifconfig-pool-persist ipp.txt
push "redirect-gateway def1 bypass-dhcp"
push "dhcp-option DNS 8.8.8.8"
keepalive 10 120
cipher AES-256-CBC
user nobody
group nogroup
persist-key
persist-tun
status openvpn-status.log
verb 3
explicit-exit-notify 1
*/

// Ejemplo básico: Configuración de WireGuard (conceptual)
// Esto es el contenido de un archivo de configuración para la interfaz wg0 (ej. /etc/wireguard/wg0.conf)
/*
[Interface]
PrivateKey = <Private_Key_Server>
Address = 10.0.0.1/24
ListenPort = 51820
PostUp = iptables -A FORWARD -i %i -j ACCEPT; iptables -A FORWARD -o %i -j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
PostDown = iptables -D FORWARD -i %i -j ACCEPT; iptables -D FORWARD -o %i -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE

[Peer]
PublicKey = <Public_Key_Client>
AllowedIPs = 10.0.0.2/32
*/

// Ejemplo incorrecto: No habilitar el reenvío de IP (ip_forward) en el servidor VPN
// echo 0 > /proc/sys/net/ipv4/ip_forward # Esto deshabilitaría el reenvío, impidiendo que la VPN funcione.
// Lo correcto es: echo 1 > /proc/sys/net/ipv4/ip_forward o editar /etc/sysctl.conf
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Administración Avanzada del Sistema',
    'topic': 'Redes Avanzadas',
    'subtopic': 'Calidad de Servicio (QoS)',
    'definition': r'''
La Calidad de Servicio (QoS) en redes es como tener un "carril rápido" para el tráfico más importante. Te permite priorizar ciertos tipos de datos sobre otros para asegurar que las aplicaciones críticas (como llamadas de voz, video o SSH) reciban el ancho de banda y la latencia que necesitan, incluso cuando la red está congestionada.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una autopista con mucho tráfico. Si todas las ambulancias, coches de policía y coches normales tuvieran que esperar igual, el caos sería enorme. QoS funciona de la misma manera en tu red. Sin QoS, todo el tráfico se trata por igual, lo que puede llevar a que aplicaciones sensibles al tiempo sufran retrasos o interrupciones cuando la red está saturada. Implementar QoS es fundamental en entornos donde el rendimiento de la red es crítico y donde diferentes tipos de tráfico tienen requisitos de servicio distintos.

En Linux, QoS se gestiona principalmente a través de la herramienta `tc` (traffic control), parte del paquete `iproute2`. Con `tc`, puedes configurar una variedad de disciplinas de cola (queues disciplines) para clasificar el tráfico, establecer límites de ancho de banda, dar prioridades, o incluso retrasar el tráfico de baja prioridad. Por ejemplo, podrías configurar una regla para que las llamadas de VoIP siempre tengan prioridad sobre la descarga de archivos grandes, o para limitar el ancho de banda que un servicio de backup utiliza para no saturar la red durante el horario laboral. Aunque la configuración de `tc` puede ser compleja debido a su flexibilidad y la gran cantidad de opciones, el impacto en la mejora del rendimiento de la red para aplicaciones críticas es muy significativo. Es una habilidad de nivel intermedio a avanzado que te permite optimizar el uso de tus recursos de red.
''',
    'code_example': r'''
// Ejemplo básico: Limitar el ancho de banda de la interfaz eth0 a 10 Mbps
// 1. Limpiar cualquier configuración de qdisc existente en eth0
sudo tc qdisc del dev eth0 root

// 2. Añadir una disciplina de cola 'htb' (Hierarchy Token Bucket) como root
sudo tc qdisc add dev eth0 root handle 1: htb default 12

// 3. Crear una clase principal para todo el tráfico de eth0 con un límite de 10 Mbps
sudo tc class add dev eth0 parent 1: classid 1:1 htb rate 10mbit ceil 10mbit

// 4. Crear una clase secundaria para el tráfico por defecto (por ejemplo, baja prioridad)
sudo tc class add dev eth0 parent 1:1 classid 1:12 htb rate 1mbit ceil 10mbit

// 5. Verificar la configuración
sudo tc qdisc show dev eth0
sudo tc class show dev eth0

// Ejemplo: Priorizar tráfico SSH (conceptual)
// sudo tc filter add dev eth0 protocol ip parent 1:0 prio 1 u32 match ip dport 22 0xffff flowid 1:1

// Ejemplo incorrecto: Aplicar reglas de QoS sin entender la jerarquía de las disciplinas de cola.
// sudo tc qdisc add dev eth0 root pfifo # Esto es muy básico y no permite priorización por clase.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Administración Avanzada del Sistema',
    'topic': 'Seguridad Intermedia',
    'subtopic': 'Hardening del sistema',
    'definition': r'''
El hardening del sistema es el proceso de asegurar un servidor o sistema operativo reduciendo su superficie de ataque. Piensa en ello como fortificar un castillo: no basta con poner un muro; necesitas mejorar cada torre, cerrar cada ventana y vigilar cada entrada.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en las amenazas constantes en Internet: hackers, malware, vulnerabilidades. Si tu sistema está configurado con las opciones por defecto o con servicios innecesarios, estás dejando puertas abiertas. El hardening minimiza los riesgos de seguridad al eliminar servicios innecesarios, configurar de forma segura los que sí se usan, aplicar parches, ajustar permisos, y fortalecer las configuraciones de red y usuario. Es un proceso continuo, no algo que haces una sola vez.

Las prácticas de hardening incluyen:
* **Minimización del software:** Desinstalar cualquier servicio o aplicación que no sea estrictamente necesaria. Cada servicio extra es una posible vulnerabilidad.
* **Actualizaciones constantes:** Mantener el sistema operativo y todas las aplicaciones actualizadas con los últimos parches de seguridad.
* **Configuración de SSH segura:** Deshabilitar el acceso con contraseña para root, usar autenticación por clave, limitar los usuarios que pueden acceder por SSH, cambiar el puerto por defecto.
* **Configuración de firewall robusta:** Restringir el acceso a puertos específicos solo desde IPs de confianza.
* **Gestión de usuarios y permisos:** Utilizar el principio de privilegio mínimo, es decir, dar a los usuarios solo los permisos que necesitan para realizar su trabajo y nada más.
* **Auditoría y logging:** Habilitar y revisar logs para detectar actividades sospechosas.
* **SELinux/AppArmor:** Configurar y habilitar estos módulos de seguridad para aplicar políticas de control de acceso forzado.
* **Eliminación de credenciales por defecto:** Cambiar todas las contraseñas por defecto.

El hardening es una práctica fundamental para proteger tus sistemas de ataques, minimizar el impacto de las vulnerabilidades y cumplir con los estándares de seguridad.
''',
    'code_example': r'''
// Ejemplo: Hardenear SSH (parte del hardening general)
// Editar el archivo de configuración SSH: /etc/ssh/sshd_config

// Deshabilitar login de root (MUY RECOMENDADO)
// PermitRootLogin no

// Usar autenticación por clave (deshabilitar contraseña, opcional pero más seguro)
// PasswordAuthentication no
// PubkeyAuthentication yes

// Cambiar el puerto por defecto (para evitar escaneos comunes)
// Port 2222

// Permitir solo ciertos usuarios
// AllowUsers tu_usuario_seguro

// Después de hacer cambios, reiniciar el servicio SSH
sudo systemctl restart sshd

// Ejemplo incorrecto: Dejar servicios innecesarios corriendo o no actualizar el sistema.
// sudo systemctl disable apache2 # Si no se usa Apache, deshabilitarlo.
// sudo apt update # No actualizar regularmente, dejando vulnerabilidades sin parchear.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Administración Avanzada del Sistema',
    'topic': 'Seguridad Intermedia',
    'subtopic': 'Detección de intrusos (aide, rkhunter)',
    'definition': r'''
La detección de intrusos con herramientas como AIDE (Advanced Intrusion Detection Environment) y RKHunter (Rootkit Hunter) es como tener un sistema de alarma y un escáner forense para tu servidor. Estas herramientas te ayudan a identificar cambios no autorizados en archivos críticos del sistema y la presencia de rootkits, que son programas maliciosos diseñados para ocultar la actividad de un atacante.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una casa donde quieres saber si alguien ha entrado sin permiso o si han dejado algo extraño escondido. En un servidor, un cambio en un archivo del sistema o la presencia de un rootkit es una señal clara de que algo anda mal, posiblemente una intrusión. La detección temprana es crucial para limitar el daño y restaurar la seguridad.

**AIDE** funciona creando una "base de datos" (un snapshot) de la suma de verificación (checksums) de todos los archivos importantes del sistema (ejecutables, archivos de configuración). Periódicamente, puedes ejecutar AIDE de nuevo y comparará el estado actual de los archivos con su base de datos. Si un archivo ha sido modificado, añadido o eliminado, AIDE te lo notificará. Es excelente para detectar alteraciones del sistema de archivos, lo que puede indicar la presencia de malware, rootkits o actividad de un atacante. La base de datos de AIDE debe ser creada y almacenada de forma segura (idealmente en un medio de solo lectura o en una ubicación remota) para que no pueda ser manipulada por un atacante.

**RKHunter** se especializa en la detección de rootkits, puertas traseras (backdoors) y exploits locales. Escanea el sistema en busca de firmas conocidas de rootkits, verifica archivos y directorios para encontrar cambios sospechosos, y realiza comprobaciones sobre los módulos del kernel y los puertos de red. Es una herramienta proactiva que te ayuda a encontrar amenazas que intentan ocultar su presencia en el sistema.

Combinar AIDE y RKHunter te proporciona una sólida primera línea de defensa en la detección de actividad maliciosa y cambios no autorizados en tu sistema Linux.
''',
    'code_example': r'''
// Ejemplo: Uso básico de AIDE
// 1. Instalar AIDE
sudo apt install aide -y # Debian/Ubuntu
// sudo dnf install aide -y # RHEL/CentOS

// 2. Inicializar la base de datos de AIDE (primera vez)
sudo aide --init
// Renombra la base de datos para que sea la de referencia
sudo mv /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz

// 3. Realizar una verificación del sistema (comparar el estado actual con la base de datos)
sudo aide --check

// Si hay cambios, AIDE los listará. Para actualizar la base de datos después de cambios legítimos:
// sudo aide --update
// sudo mv /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz

// Ejemplo: Uso básico de RKHunter
// 1. Instalar RKHunter
sudo apt install rkhunter -y
// sudo dnf install rkhunter -y

// 2. Actualizar la base de datos de RKHunter (firmas de rootkits)
sudo rkhunter --update
sudo rkhunter --propupd # Actualizar la base de datos de propiedades de archivos

// 3. Ejecutar un escaneo completo del sistema
sudo rkhunter --checkall

// Ejemplo incorrecto: No actualizar las bases de datos de firmas.
// Si no actualizas RKHunter, no detectará los rootkits más recientes.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Administración Avanzada del Sistema',
    'topic': 'Seguridad Intermedia',
    'subtopic': 'Análisis de vulnerabilidades',
    'definition': r'''
El análisis de vulnerabilidades es el proceso de identificar debilidades conocidas en tu software, configuraciones o infraestructura que podrían ser explotadas por atacantes. Es como pasar un escáner de rayos X a tu sistema para encontrar los puntos débiles antes de que alguien más los descubra.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en un sistema de defensa: si no conoces tus puntos débiles, no puedes protegerte. Las vulnerabilidades son puertas traseras o errores que un atacante puede usar para ganar acceso no autorizado, escalar privilegios o interrumpir servicios. Realizar análisis de vulnerabilidades de forma regular te permite parchear o mitigar estos riesgos antes de que sean explotados, lo cual es proactivo y mucho mejor que reaccionar a un ataque.

Las herramientas de análisis de vulnerabilidades automatizan gran parte de este proceso. Escanean tu sistema (o red) en busca de software desactualizado, configuraciones inseguras, puertos abiertos innecesarios, servicios mal configurados o la ausencia de parches de seguridad. Algunas herramientas populares incluyen:
* **Nessus:** Un escáner de vulnerabilidades comercial muy potente que puede identificar miles de vulnerabilidades en sistemas y aplicaciones.
* **OpenVAS (Greenbone Vulnerability Management):** Una alternativa de código abierto a Nessus, con una gran base de datos de vulnerabilidades.
* **Nikto:** Un escáner de vulnerabilidades web que busca configuraciones inseguras, archivos potencialmente peligrosos y versiones desactualizadas de software web.
* **Nmap (con sus scripts NSE):** Aunque es principalmente un escáner de puertos, Nmap tiene scripts que pueden detectar vulnerabilidades específicas o versiones de software.
* **Vulnerability databases:** Consultar bases de datos públicas como CVE (Common Vulnerabilities and Exposures) para estar al tanto de las últimas vulnerabilidades.

El resultado de un análisis de vulnerabilidades es un informe que lista las debilidades encontradas, su severidad y, a menudo, recomendaciones para su mitigación. Integrar el análisis de vulnerabilidades en tu ciclo de vida de administración de sistemas es una práctica esencial para mantener un buen nivel de seguridad.
''',
    'code_example': r'''
// Ejemplo: Uso básico de Nmap para escanear puertos y detectar servicios/versiones
// Escanear un host para puertos abiertos y versiones de servicio
nmap -sV 192.168.1.100

// Escanear un host para vulnerabilidades comunes (usando scripts NSE)
nmap -sV --script vuln 192.168.1.100

// Ejemplo: Uso básico de Nikto para escanear un servidor web
// Instalar Nikto (si no está instalado)
// sudo apt install nikto -y

// Escanear un servidor web
nikto -h http://tu_servidor_web.com

// Ejemplo incorrecto: Basarse solo en una herramienta o no mantener las bases de datos de vulnerabilidades actualizadas.
// Si tu escáner tiene firmas antiguas, no detectará las nuevas vulnerabilidades.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Administración Avanzada del Sistema',
    'topic': 'Seguridad Intermedia',
    'subtopic': 'Certificados y PKI',
    'definition': r'''
Los certificados digitales y la PKI (Public Key Infrastructure o Infraestructura de Clave Pública) son la base de la seguridad moderna en Internet y en la comunicación entre sistemas. Piensa en ellos como pasaportes digitales que verifican la identidad de personas, servidores o aplicaciones, y permiten la comunicación cifrada.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en cuando accedes a una página web segura (con "https://"). El candadito que ves en tu navegador significa que la comunicación está cifrada y que la identidad del sitio web ha sido verificada por una Autoridad de Certificación (CA) de confianza. Los certificados y la PKI hacen posible esta confianza. Son fundamentales para el cifrado de datos en tránsito, la autenticación de entidades y el no repudio.

Una PKI se compone de varios elementos:
* **Autoridad de Certificación (CA):** Una entidad de confianza (como Let's Encrypt, DigiCert, o tu propia CA interna) que emite los certificados.
* **Certificados Digitales:** Archivos que contienen una clave pública, información sobre la identidad del titular y una firma digital de la CA. Se usan para cifrar la comunicación y verificar la identidad.
* **Claves Públicas y Privadas:** La clave pública se comparte y se usa para cifrar datos que solo la clave privada (que se mantiene en secreto) puede descifrar. La clave privada también se usa para firmar digitalmente.
* **Listas de Revocación de Certificados (CRL) u OSP (Online Certificate Status Protocol):** Mecanismos para verificar si un certificado ha sido revocado antes de su fecha de expiración.

En Linux, trabajarás con certificados para configurar servidores web (Nginx, Apache con SSL/TLS), SSH (para autenticación sin contraseña), VPNs (OpenVPN), y otras aplicaciones que requieren comunicación segura. Herramientas como OpenSSL son esenciales para generar claves, crear solicitudes de firma de certificados (CSRs) y gestionar certificados. Entender cómo funcionan los certificados y la PKI te da una base sólida para implementar seguridad en cualquier aplicación o servicio en red.
''',
    'code_example': r'''
// Ejemplo: Generar una clave privada y una solicitud de firma de certificado (CSR) con OpenSSL
// 1. Generar una clave privada RSA (2048 bits)
sudo openssl genrsa -out server.key 2048

// 2. Generar una solicitud de firma de certificado (CSR)
sudo openssl req -new -key server.key -out server.csr
# Esto te pedirá información como País, Estado, Ciudad, Nombre de la Organización, Nombre Común (ej. tu_dominio.com), etc.

// 3. (Opcional) Firmar el certificado con tu propia CA (para uso interno o testing)
// Suponiendo que tienes una CA (ca.crt y ca.key)
sudo openssl x509 -req -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out server.crt -days 365

// Ejemplo: Verificar un certificado
sudo openssl x509 -in server.crt -text -noout

// Ejemplo incorrecto: No proteger la clave privada
// Dejar la clave privada con permisos laxos (ej. 777) es un grave riesgo de seguridad.
// La clave privada debe tener permisos muy restrictivos (ej. 600) para solo el propietario.
// sudo chmod 600 server.key
'''
  });
}

Future<void> insertMidLevel2DataLinux(Database db) async {
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Shell Scripting Avanzado',
    'topic': 'Bash Avanzado',
    'subtopic': 'Arrays y operaciones',
    'definition': r'''
Los arrays en Bash son una forma de almacenar múltiples valores en una sola variable. Piensa en ellos como una lista donde cada elemento tiene una posición (un índice), permitiéndote organizar y acceder a datos relacionados de una manera más estructurada que con variables individuales.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en la necesidad de procesar una lista de nombres de archivos, direcciones IP o usuarios. Si usaras variables separadas para cada uno, el código se volvería inmanejable muy rápido. Los arrays te permiten iterar sobre colecciones de datos, lo que es fundamental para automatizar tareas repetitivas o gestionar conjuntos de información de manera eficiente en tus scripts. Son un salto importante desde el Bash básico que solo manejaba cadenas de texto simples.

Bash soporta tanto arrays indexados (numerados, que empiezan desde 0 por defecto) como arrays asociativos (donde los elementos se acceden por una clave de texto, como un diccionario en Python). Puedes declarar un array, añadir elementos, acceder a elementos específicos por su índice o clave, obtener el número total de elementos, o iterar sobre todos ellos. Por ejemplo, podrías tener un array de nombres de servidores y luego un bucle que se conecte por SSH a cada uno para ejecutar un comando. O un array asociativo que almacene la configuración de diferentes servicios con sus respectivos puertos. Dominar los arrays te abre un abanico de posibilidades para escribir scripts más complejos, legibles y potentes, permitiéndote manejar conjuntos de datos de forma mucho más efectiva.
''',
    'code_example': r'''
# Ejemplo: Arrays indexados en Bash
# Declarar un array
servidores=("webserver01" "dbserver02" "appserver03")

# Acceder a un elemento (índice 0 es el primero)
echo "Primer servidor: ${servidores[0]}"

# Acceder a todos los elementos
echo "Todos los servidores: ${servidores[@]}"

# Obtener el número de elementos
echo "Número de servidores: ${#servidores[@]}"

# Añadir un elemento al final
servidores+=("monitor04")
echo "Servidores actualizados: ${servidores[@]}"

# Eliminar un elemento (por índice)
unset servidores[1]
echo "Servidores después de eliminar: ${servidores[@]}"

# Iterar sobre un array
echo "Lista de servidores:"
for server in "${servidores[@]}"; do
    echo "- $server"
done

# Ejemplo: Arrays asociativos (requiere Bash 4+)
# Declarar un array asociativo
declare -A configuracion
configuracion["puerto_ssh"]="22"
configuracion["directorio_log"]="/var/log/mi_app"
configuracion["database_host"]="localhost"

# Acceder a un elemento por clave
echo "Puerto SSH: ${configuracion["puerto_ssh"]}"

# Obtener todas las claves
echo "Claves: ${!configuracion[@]}"

# Obtener todos los valores
echo "Valores: ${configuracion[@]}"

# Ejemplo incorrecto: Acceder a un array sin corchetes o comillas dobles
# echo $servidores[0] # Esto no funciona, se necesita ${servidores[0]}
# for server in $servidores[@]; do # Mal, si los nombres tienen espacios se rompe
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Shell Scripting Avanzado',
    'topic': 'Bash Avanzado',
    'subtopic': 'Expansión de parámetros',
    'definition': r'''
La expansión de parámetros en Bash es un conjunto de técnicas poderosas que te permiten manipular el contenido de variables de formas muy diversas y concisas, directamente desde la línea de comandos o dentro de tus scripts. Piensa en ello como tener un mini-editor de texto integrado en cada variable.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en la necesidad de extraer una parte de una cadena de texto, reemplazar caracteres, asignar valores por defecto si una variable está vacía, o eliminar prefijos/sufijos. Sin la expansión de parámetros, tendrías que recurrir a comandos externos como `sed`, `awk` o `cut`, lo cual hace tus scripts más lentos y menos legibles. La expansión de parámetros te permite hacer estas manipulaciones de forma nativa en Bash, lo que resulta en scripts más eficientes, más rápidos y, una vez que te acostumbras, más fáciles de escribir. Es una característica que da a Bash una flexibilidad increíble para el manejo de cadenas.

Algunas de las expansiones de parámetros más comunes incluyen:
* **Asignación de valor por defecto:** `"${VAR:-default}"` usa `default` si `VAR` está vacía o no definida.
* **Asignación y uso:** `"${VAR:=default}"` asigna `default` a `VAR` si está vacía y luego usa ese valor.
* **Error si vacío:** `"${VAR:?Error message}"` si `VAR` está vacía, el script sale con un error.
* **Eliminar prefijo más corto:** `"${VAR#*patron}"` elimina el patrón más corto desde el inicio de la cadena.
* **Eliminar prefijo más largo:** `"${VAR##*patron}"` elimina el patrón más largo desde el inicio de la cadena.
* **Eliminar sufijo más corto:** `"${VAR%patron*}"` elimina el patrón más corto desde el final.
* **Eliminar sufijo más largo:** `"${VAR%%patron*}"` elimina el patrón más largo desde el final.
* **Reemplazo de subcadenas:** `"${VAR/buscar/reemplazar}"` reemplaza la primera aparición. `"${VAR//buscar/reemplazar}"` reemplaza todas las apariciones.
* **Longitud de la cadena:** `"${#VAR}"` devuelve la longitud de la cadena.

Dominar estas expansiones te permite escribir scripts Bash mucho más elegantes y eficientes para el procesamiento de texto y la manipulación de variables.
''',
    'code_example': r'''
# Ejemplo: Expansión de parámetros
#!/bin/bash

NOMBRE_ARCHIVO="documento.2024.final.txt"
DIRECTORIO_LOGS=""
USUARIO="admin"

echo "--- Asignación de valor por defecto (:-)"
echo "Directorio de logs: ${DIRECTORIO_LOGS:-/var/log/default}" # Usa /var/log/default
echo "Variable original (no cambia): '$DIRECTORIO_LOGS'"

echo "--- Asignación y uso (:=)"
echo "Directorio de logs (después de asignar): ${DIRECTORIO_LOGS:=/var/log/app}" # Asigna y usa /var/log/app
echo "Variable original (ahora cambia): '$DIRECTORIO_LOGS'"

echo "--- Eliminar prefijo más corto (#)"
echo "Nombre de archivo sin 'documento.': ${NOMBRE_ARCHIVO#documento.}"

echo "--- Eliminar prefijo más largo (##)"
echo "Nombre de archivo sin extensión: ${NOMBRE_ARCHIVO%%.*}"
echo "Extensión de archivo: ${NOMBRE_ARCHIVO##*.}"

echo "--- Reemplazo (/) y reemplazo global (//)"
RUTA="/home/usuario/documentos/reportes"
echo "Ruta con 'temp' en lugar de 'documentos': ${RUTA/documentos/temp}"
TEXTO="uno dos uno tres uno"
echo "Reemplazo global de 'uno' por 'cero': ${TEXTO//uno/cero}"

echo "--- Longitud de la cadena (#)"
echo "Longitud de 'RUTA': ${#RUTA}"

echo "--- Error si vacío (:?)"
# Si descomentas la siguiente línea y USER_DB está vacía, el script saldrá con un error.
# : "${USER_DB:?La variable USER_DB no puede estar vacía}"
# echo "Usuario de DB: $USER_DB"

# Ejemplo incorrecto: Confundir # con ## o % con %%
# echo ${NOMBRE_ARCHIVO#.*} # Esto solo quita el primer punto, no la extensión
# echo ${NOMBRE_ARCHIVO%.*} # Esto solo quita el último punto, lo correcto para la extensión es ##*.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Shell Scripting Avanzado',
    'topic': 'Bash Avanzado',
    'subtopic': 'Sustitución de procesos',
    'definition': r'''
La sustitución de procesos en Bash es una característica avanzada que te permite usar la salida de un comando como si fuera un archivo temporal, sin necesidad de crear un archivo real en el disco. Es como si Bash creara un "túnel" virtual por donde pasa la información.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en la necesidad de comparar la salida de dos comandos, o de pasar la salida de un comando a otro que espera un archivo como entrada. Normalmente, tendrías que redirigir la salida del primer comando a un archivo temporal, luego pasar ese archivo al segundo comando, y finalmente borrar el archivo temporal. Esto no solo añade pasos y ensucia el sistema de archivos, sino que también puede ser ineficiente para grandes volúmenes de datos. La sustitución de procesos elimina esta necesidad, haciendo tus scripts más limpios y eficientes.

La sintaxis de la sustitución de procesos es `<(comando)` o `>(comando)`.
* **`<(comando)`:** La salida de `comando` se convierte en un archivo que el comando exterior puede leer. Es útil cuando un comando espera un archivo como entrada, pero tú tienes la información en la salida de otro comando.
* **`>(comando)`:** La entrada del comando exterior se envía a `comando`. Esto es menos común pero útil para redirigir la salida de un comando a la entrada de otro comando de una manera que no es posible con pipes normales.

La sustitución de procesos es especialmente útil con comandos que comparan archivos, como `diff`, `comm` o `cmp`, o con cualquier programa que pueda leer desde un nombre de archivo. Al usar esta característica, Bash crea un "fifo" (named pipe) o un archivo temporal en `/dev/fd/` o `/proc/self/fd/` que actúa como el archivo virtual, y lo elimina automáticamente cuando ya no es necesario. Es una técnica elegante para el manejo de flujos de datos complejos en Bash.
''',
    'code_example': r'''
# Ejemplo: Sustitución de procesos con `diff` para comparar salidas de comandos
# Comparar el contenido de dos directorios de forma recursiva
# ls -R /etc/nginx/sites-available/
# ls -R /etc/apache2/sites-available/

# Ahora, compara las salidas directamente sin archivos temporales
diff <(ls -R /etc/nginx/sites-available/) <(ls -R /etc/apache2/sites-available/)

# Ejemplo: Contar palabras en la salida de dos comandos y comparar
diff <(wc -l /var/log/syslog) <(wc -l /var/log/auth.log)

# Ejemplo: Pasar la salida de un comando a otro que espera un archivo
# Suponiendo que tienes un programa 'procesar_datos_desde_archivo.sh'
# que espera un archivo como argumento, y tú tienes los datos en un 'grep'
# procesar_datos_desde_archivo.sh <(grep "ERROR" /var/log/mi_app.log)

# Ejemplo incorrecto: Confundir sustitución de proceso con sustitución de comando normal (`$()`)
# diff $(ls -R /etc/nginx) $(ls -R /etc/apache2)
# Esto expandiría las listas de archivos como argumentos separados, lo que probablemente no funcionaría correctamente con `diff`.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Shell Scripting Avanzado',
    'topic': 'Bash Avanzado',
    'subtopic': 'Técnicas de depuración',
    'definition': r'''
Las técnicas de depuración en Bash son herramientas y metodologías que te permiten encontrar y corregir errores (bugs) en tus scripts. Cuando un script no hace lo que esperas, o se comporta de forma inesperada, depurar es el proceso de investigar paso a paso su ejecución para entender qué está pasando y dónde está el problema.

No sé tú, pero a mí esto al principio me costó... 

Los scripts de Bash pueden fallar de formas sutiles, y a veces la única pista es un error genérico. Pensemos por un momento en un mecánico que diagnostica un coche; no solo lo mira, sino que usa herramientas específicas para revisar el motor, el sistema eléctrico, etc. Para tus scripts, la depuración es ese conjunto de herramientas de diagnóstico. Sin ellas, estarías adivinando dónde está el error, lo cual es ineficiente y frustrante.

Algunas técnicas de depuración esenciales en Bash son:
* **Modo de depuración (`-x`):** Ejecutar el script con `bash -x mi_script.sh` o añadir `set -x` al inicio de tu script. Esto imprime cada comando después de que Bash lo expande, antes de ejecutarlo, lo que te permite ver exactamente qué comandos se están ejecutando y con qué argumentos. Es increíblemente útil para seguir el flujo de ejecución.
* **Modo de verificación de sintaxis (`-n`):** Ejecutar el script con `bash -n mi_script.sh`. Esto revisa el script solo por errores de sintaxis sin ejecutar ningún comando. Útil para verificar que no hay errores básicos antes de la ejecución.
* **Modo "exit on error" (`-e`):** Añadir `set -e` al script. Esto hace que el script salga inmediatamente si cualquier comando falla (devuelve un código de salida distinto de cero). Ayuda a detectar errores en comandos que podrían pasar desapercibidos.
* **Modo de verbosidad (`-v`):** Añadir `set -v` al script. Esto imprime las líneas del script a medida que se leen, antes de cualquier expansión.
* **Mensajes de depuración con `echo`:** Insertar declaraciones `echo` estratégicamente en tu script para imprimir el valor de variables en puntos específicos o para indicar qué parte del script se está ejecutando.
* **Depuradores Bash (ej. `bashdb`):** Para scripts muy complejos, existen depuradores interactivos que te permiten establecer puntos de interrupción, inspeccionar variables y avanzar paso a paso.

Dominar estas técnicas te convertirá en un solucionador de problemas mucho más eficaz, reduciendo drásticamente el tiempo que pasas arreglando scripts que no funcionan.
''',
    'code_example': r'''
# Ejemplo: Script con errores y cómo depurarlo

#!/bin/bash

# Este script intenta listar archivos en un directorio y luego procesarlos.
# Pero tiene un error sutil.

DIRECTORIO_USUARIOS="/home/users" # Error: La variable debería ser DIRECTORIO_USUARIOS
ARCHIVO_TEMPORAL="/tmp/lista_usuarios.txt"

echo "Iniciando procesamiento de usuarios..."

# Intentar listar archivos en el directorio incorrecto
ls "$DIRECTORIO_USUARIOS" > "$ARCHIVO_TEMPORAL"

if [ $? -eq 0 ]; then
    echo "Archivos listados correctamente en $ARCHIVO_TEMPORAL"
    # Procesar cada usuario (ejemplo)
    while IFS= read -r usuario; do
        echo "Procesando usuario: $usuario"
        # sleep 0.1 # Simular trabajo
    done < "$ARCHIVO_TEMPORAL"
else
    echo "Error al listar el directorio."
    exit 1
fi

echo "Procesamiento completado."

# --- Técnicas de depuración ---

# 1. Ejecutar con -x (modo de depuración)
# bash -x mi_script_con_errores.sh
# Verás la expansión de cada comando, lo que revelaría que $DIRECTORIO_USUARIOS está vacío.

# 2. Añadir 'set -x' al script para activar el modo de depuración internamente
# Descomenta la siguiente línea en el script:
# set -x

# 3. Insertar 'echo' para inspeccionar variables
# Antes del 'ls'
# echo "DEBUG: Intentando listar directorio: '$DIRECTORIO_USUARIOS'"
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Shell Scripting Avanzado',
    'topic': 'Herramientas de Procesamiento Avanzado',
    'subtopic': 'awk avanzado',
    'definition': r'''
`awk` es una herramienta de procesamiento de texto increíblemente potente en Linux, diseñada para manipular y extraer datos de archivos o flujos de entrada línea por línea. Si en el nivel junior lo viste como una forma de cortar y pegar columnas, en el nivel avanzado te darás cuenta de que es un lenguaje de programación en sí mismo, capaz de realizar operaciones complejas.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en la necesidad de analizar logs, generar informes a partir de datos tabulares, o transformar formatos de texto de una manera muy específica. Aunque `grep` puede buscar patrones y `cut` puede extraer columnas, `awk` va mucho más allá. Te permite aplicar lógica condicional, realizar cálculos, agrupar datos, y formatear la salida, todo ello en una sola pasada sobre el texto. Es como tener una mini-base de datos con capacidad de procesamiento dentro de tu terminal.

El poder de `awk` reside en su estructura de `patrón { acción }`. Por cada línea de entrada, `awk` verifica si la línea coincide con un `patrón`. Si lo hace, ejecuta la `acción` asociada. Puedes definir acciones que se ejecuten antes de procesar el primer registro (`BEGIN {}`) o después de procesar el último (`END {}`). Algunas de sus capacidades avanzadas incluyen:
* **Variables internas:** `NR` (número de registro/línea), `NF` (número de campos), `FS` (separador de campos), `RS` (separador de registros).
* **Variables definidas por el usuario:** Puedes crear tus propias variables para almacenar valores, realizar sumas, contadores, etc.
* **Condicionales (`if/else`):** Ejecutar acciones basadas en condiciones sobre los campos o la línea.
* **Bucles (`for`, `while`):** Iterar sobre campos o realizar operaciones repetitivas.
* **Funciones:** Tanto funciones internas (matemáticas, de cadena) como la posibilidad de definir tus propias funciones.
* **Manejo de múltiples archivos:** Procesar varios archivos en una sola ejecución.

Dominar `awk` te permite manipular datos textuales con una flexibilidad y eficiencia que pocas otras herramientas de línea de comandos pueden igualar, convirtiéndote en un verdadero mago del procesamiento de logs y reportes.
''',
    'code_example': r'''
# Ejemplo: awk avanzado - Calcular la suma de una columna y mostrar un resumen
# Suponiendo que tienes un archivo 'ventas.log' con el formato: fecha,producto,cantidad,precio
# Ejemplo de ventas.log:
# 2024-01-01,Laptop,2,1200.50
# 2024-01-02,Mouse,5,25.00
# 2024-01-02,Laptop,1,1200.50

# Calcular el total de ventas (cantidad * precio) y el total general
awk -F',' 'BEGIN {
    total_general = 0;
    print "--- Resumen de Ventas ---";
    print "Producto       Cantidad   Precio    Total Linea";
    print "------------------------------------------------";
}
{
    producto = $2;
    cantidad = $3;
    precio = $4;
    total_linea = cantidad * precio;
    printf "%-15s %-10d %-9.2f %-12.2f\n", producto, cantidad, precio, total_linea;
    total_general += total_linea;
}
END {
    print "------------------------------------------------";
    printf "Total General de Ventas: %.2f\n", total_general;
}' ventas.log

# Ejemplo: Buscar líneas donde el tercer campo es mayor que 100 y formatear la salida
echo "apple 10 150" > data.txt
echo "banana 5 90" >> data.txt
echo "orange 20 200" >> data.txt

awk '$3 > 100 { print "Artículo: " $1 ", Cantidad: " $2 ", Precio: " $3 }' data.txt

# Ejemplo incorrecto: Intentar hacer un procesamiento complejo de múltiples líneas con cut o grep.
# grep "Laptop" ventas.log | cut -d',' -f3,4 # Solo extraerá los campos, no calculará el total.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Shell Scripting Avanzado',
    'topic': 'Herramientas de Procesamiento Avanzado',
    'subtopic': 'sed avanzado',
    'definition': r'''
`sed` (stream editor) es una herramienta de línea de comandos para filtrar y transformar texto. Si ya lo usas para reemplazos simples, en este nivel verás que es capaz de realizar ediciones complejas, inserciones, eliminaciones y manipulaciones avanzadas de texto que van mucho más allá de un simple `s/buscar/reemplazar/`.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en la necesidad de modificar configuraciones en múltiples archivos, limpiar datos con patrones complejos, o automatizar ediciones de texto en scripts. Mientras que un editor de texto manual es útil para un solo archivo, `sed` te permite aplicar transformaciones programáticamente a flujos de texto, lo cual es invaluable para la automatización y el procesamiento por lotes. Es el bisturí quirúrgico para la manipulación de texto en la línea de comandos.

Las capacidades avanzadas de `sed` incluyen:
* **Direccionamiento de líneas y rangos:** Aplicar comandos solo a líneas específicas (`10d` para borrar la línea 10), rangos de líneas (`10,20d` para borrar de la 10 a la 20), o líneas que coinciden con un patrón (`/Error/d`).
* **Múltiples comandos:** Encadenar varios comandos de `sed` en una sola ejecución (`sed -e 's/old/new/' -e 's/otro/mas/'`).
* **Comandos de inserción/borrado:** `i` (insertar antes), `a` (añadir después), `d` (borrar línea), `c` (cambiar línea).
* **Manejo de espacios y saltos de línea:** `N` (añadir la siguiente línea al patrón), `P` (imprimir solo la primera parte del patrón), `D` (eliminar la primera parte del patrón). Esto es fundamental para trabajar con patrones que abarcan varias líneas.
* **Branching y etiquetado:** Controlar el flujo de ejecución de los comandos de `sed` (similar a un `goto`).
* **Buffers de hold y pattern:** Almacenar temporalmente líneas o patrones para manipulaciones más complejas.

Dominar `sed` te permite realizar transformaciones de texto extremadamente eficientes y precisas directamente desde tus scripts, lo cual es esencial para tareas de administración, procesamiento de logs y despliegues automatizados.
''',
    'code_example': r'''
# Ejemplo: sed avanzado - Borrar líneas basadas en un patrón y un rango, y añadir texto
# Suponiendo un archivo 'config.ini'
# [general]
# debug=true
# log_level=INFO
#
# [database]
# host=localhost
# port=5432
#
# [webserver]
# port=80
# max_clients=100

# 1. Borrar líneas en blanco y comentarios (líneas que empiezan con '#')
#sed -e '/^$/d' -e '/^#/d' config.ini

# 2. Reemplazar una línea específica y añadir otra después de un patrón
# En este ejemplo, cambia 'log_level' y añade una línea después de '[database]'
sed '/log_level/c\log_level=DEBUG' config.ini | \
sed '/^\[database\]/a\user=db_user\npassword=db_pass'
# El primer sed cambia la línea de log_level.
# El segundo sed usa 'a\' para añadir dos líneas (separadas por \n) después de la línea que contiene '[database]'.

# 3. Eliminar un rango de líneas entre dos patrones (incluyendo los patrones)
sed '/^\[database\]/,/^\[webserver\]/d' config.ini
# Esto borrará la sección [database] y hasta la línea antes de [webserver]

# 4. Uso del buffer hold (h) para procesar múltiples líneas
# Imprime las líneas entre "START" y "END" (incluyendo los delimitadores)
echo -e "Linea1\nSTART\nContenido1\nContenido2\nEND\nLinea6" | sed -n '/START/,/END/p'

# Ejemplo incorrecto: Usar expresiones regulares sin anclas o con errores en la sintaxis de los comandos.
# sed 's/port=80/port=8080' config.ini # Si hay múltiples 'port=80', afectará a todos los que no están en el rango.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Shell Scripting Avanzado',
    'topic': 'Herramientas de Procesamiento Avanzado',
    'subtopic': 'jq para JSON',
    'definition': r'''
`jq` es una herramienta de línea de comandos diseñada específicamente para procesar datos en formato JSON. Piensa en ella como `grep`, `sed` o `awk`, pero hecha a medida para la estructura jerárquica de JSON. Es esencial en el mundo de las APIs y la automatización moderna.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en la cantidad de datos que hoy en día se transmiten y almacenan en formato JSON: respuestas de APIs web, configuraciones de aplicaciones, logs de microservicios. Si necesitas extraer un valor específico de un JSON anidado, filtrar objetos por una condición, o transformar la estructura de un JSON, intentar hacerlo con `grep` o `awk` sería una pesadilla. `jq` hace estas tareas triviales, permitiéndote interactuar con datos JSON de manera eficiente y poderosa directamente desde tu terminal o tus scripts.

`jq` utiliza un lenguaje de filtro propio que es sorprendentemente intuitivo. Puedes encadenar operaciones para navegar por la estructura del JSON, filtrar elementos de arrays, seleccionar campos específicos, renombrar claves, e incluso construir nuevos objetos JSON a partir de los datos existentes. Por ejemplo:
* **Acceder a campos:** `.nombre_campo`, `.array[indice]`.
* **Filtrar arrays:** `.[].edad | select(. > 30)`.
* **Crear nuevos objetos/arrays:** `{ "nuevo_nombre": .nombre_original, "otra_data": .array[] }`.
* **Transformaciones:** `del(.campo_obsoleto)`, `map( . + {"status": "ok"} )`.

`jq` se ha vuelto una herramienta indispensable para desarrolladores y administradores de sistemas que trabajan con APIs RESTful, Kubernetes, o cualquier sistema que produzca o consuma datos JSON. Su capacidad para parsear, filtrar y manipular JSON de forma programática te ahorra una cantidad enorme de tiempo y esfuerzo.
''',
    'code_example': r'''
# Ejemplo: Uso de jq para JSON
# Suponiendo que tienes un archivo 'data.json':
# {
#   "name": "Alice",
#   "age": 30,
#   "city": "New York",
#   "hobbies": ["reading", "hiking", "cooking"],
#   "address": {
#     "street": "123 Main St",
#     "zip": "10001"
#   },
#   "orders": [
#     {"id": 101, "amount": 50.00, "status": "completed"},
#     {"id": 102, "amount": 75.50, "status": "pending"},
#     {"id": 103, "amount": 20.00, "status": "completed"}
#   ]
# }

# 1. Extraer el nombre
cat data.json | jq '.name' # Salida: "Alice"

# 2. Extraer la edad
cat data.json | jq '.age' # Salida: 30

# 3. Acceder a un campo anidado (calle de la dirección)
cat data.json | jq '.address.street' # Salida: "123 Main St"

# 4. Extraer todos los hobbies
cat data.json | jq '.hobbies[]' # Salida: "reading", "hiking", "cooking" (cada uno en una línea)

# 5. Filtrar órdenes con estado "pending"
cat data.json | jq '.orders[] | select(.status == "pending")'
# Salida: {"id": 102, "amount": 75.50, "status": "pending"}

# 6. Mapear las órdenes para mostrar solo el ID y el monto
cat data.json | jq '.orders[] | {order_id: .id, total_amount: .amount}'
# Salida:
# { "order_id": 101, "total_amount": 50 }
# { "order_id": 102, "total_amount": 75.5 }
# { "order_id": 103, "total_amount": 20 }

# Ejemplo incorrecto: Intentar usar grep para extraer valores de un JSON anidado de forma fiable.
# grep "name" data.json # Solo encontrará la línea, no extraerá el valor de forma estructurada.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Shell Scripting Avanzado',
    'topic': 'Herramientas de Procesamiento Avanzado',
    'subtopic': 'Procesamiento paralelo',
    'definition': r'''
El procesamiento paralelo en Bash y Linux se trata de ejecutar múltiples comandos o procesos simultáneamente, aprovechando al máximo los múltiples núcleos de tu CPU o la capacidad de tu sistema para manejar varias tareas a la vez. Es como tener varios cocineros trabajando en la misma cocina en lugar de uno solo, completando las tareas más rápido.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en un escenario donde necesitas procesar una gran cantidad de archivos, realizar copias de seguridad de múltiples bases de datos, o ejecutar tareas intensivas en CPU en muchos servidores. Si lo haces secuencialmente (una tarea tras otra), tardarás una eternidad. El procesamiento paralelo reduce drásticamente el tiempo de ejecución, permitiendo que tu sistema sea mucho más eficiente y productivo, especialmente cuando trabajas con grandes volúmenes de datos o un gran número de operaciones.

Hay varias formas de lograr procesamiento paralelo en Bash:
* **Operador `&` (backgrounding):** Ejecutar un comando en segundo plano y pasar inmediatamente al siguiente.
* **`wait` comando:** Esperar a que los procesos en segundo plano terminen.
* **`xargs` con `-P`:** Una herramienta extremadamente útil para ejecutar un comando para cada elemento de una lista, especificando el número de procesos paralelos.
* **`GNU Parallel`:** Una herramienta mucho más sofisticada y poderosa que `xargs` para ejecutar comandos en paralelo. Permite un control más fino sobre el número de trabajos, la gestión de errores, y la recolección de salidas. Es la herramienta de facto para tareas de procesamiento paralelo a gran escala.

Implementar procesamiento paralelo requiere un poco de cuidado para no sobrecargar el sistema, especialmente si las tareas son intensivas en I/O o memoria. Sin embargo, cuando se usa correctamente, puede transformar la eficiencia de tus scripts y operaciones de administración.
''',
    'code_example': r'''
# Ejemplo: Procesamiento paralelo de archivos con xargs
# Suponiendo que tienes muchos archivos .txt que quieres procesar con un script 'procesar_archivo.sh'

# Procesar 5 archivos en paralelo a la vez
find . -name "*.txt" | xargs -P 5 -I {} ./procesar_archivo.sh {}

# Contenido de procesar_archivo.sh (ejemplo)
#!/bin/bash
# echo "Procesando archivo: $1"
# Realiza alguna operación intensiva
# sleep 2
# echo "Terminado: $1"

# Ejemplo: Uso de GNU Parallel (más avanzado)
# Instalar GNU Parallel si no está disponible: sudo apt install parallel -y
# Procesar 5 archivos en paralelo usando 'gzip'
# find . -name "*.log" | parallel -j 5 gzip

# Ejecutar múltiples comandos en paralelo
# parallel ::: "sleep 1; echo 'Tarea 1'" "sleep 2; echo 'Tarea 2'" "sleep 1; echo 'Tarea 3'"

# Ejemplo de backgrounding simple con `&` y `wait`
# Tarea 1 en segundo plano
(sleep 3; echo "Tarea pesada 1 terminada") &
PID1=$! # Guarda el PID de la tarea 1

# Tarea 2 en segundo plano
(sleep 2; echo "Tarea pesada 2 terminada") &
PID2=$! # Guarda el PID de la tarea 2

echo "Ambas tareas lanzadas. Esperando que terminen..."

# Esperar a que terminen ambas tareas
wait $PID1 $PID2

echo "Todas las tareas han terminado."

# Ejemplo incorrecto: Lanzar demasiados procesos en paralelo sin control
# find . -name "*.mp4" | xargs -I {} ffmpeg -i {} -vf scale=640:-1 output_{}.mp4 & # Esto lanzaría un proceso por cada MP4, sobrecargando la CPU.
# Es mejor usar '-P' con xargs o GNU Parallel para limitar los procesos.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Shell Scripting Avanzado',
    'topic': 'Pruebas y Validación',
    'subtopic': 'Pruebas unitarias para scripts',
    'definition': r'''
Las pruebas unitarias para scripts son una práctica que te permite verificar que pequeñas partes de tu código (unidades) funcionan como se espera, de forma aislada. Aunque no es tan común como en lenguajes de programación compilados, es una técnica que eleva la calidad de tus scripts Bash.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en la construcción de un coche; no se espera a que todo esté ensamblado para ver si el motor funciona. Se prueban los componentes individualmente. Lo mismo ocurre con los scripts, especialmente los complejos. Un pequeño error en una función o un comando puede tener consecuencias desastrosas. Las pruebas unitarias te ayudan a detectar y corregir errores tempranamente, aseguran que los cambios no rompan funcionalidades existentes (regresiones), y te dan confianza en que tus scripts son fiables.

Aunque Bash no tiene un framework de pruebas unitarias incorporado como JUnit para Java o Pytest para Python, puedes implementar tus propias pruebas unitarias o usar herramientas de terceros:
* **Funciones de prueba manuales:** Crear funciones en tu script que llamen a las funciones que quieres probar y verifiquen su salida o el código de retorno.
* **`assert` o `test` comandos:** Usar condicionales `if` y los comandos `test` o `[` para verificar condiciones (ej. si una variable tiene el valor esperado, si un archivo existe).
* **Frameworks sencillos:** Existen proyectos como `shUnit2` o `bats` que proporcionan una estructura para escribir y ejecutar pruebas unitarias en Bash, con funcionalidades como la configuración antes/después de cada prueba (setup/teardown) y reportes de resultados.

Implementar pruebas unitarias en tus scripts es una señal de que estás pasando de escribir scripts para "salir del paso" a construir soluciones robustas y mantenibles.
''',
    'code_example': r'''
# Ejemplo: Pruebas unitarias sencillas en un script Bash

#!/bin/bash

# Funciones a probar
sumar() {
    echo $(( $1 + $2 ))
}

es_par() {
    if (( $1 % 2 == 0 )); then
        return 0 # Es par
    else
        return 1 # No es par
    fi
}

# --- Pruebas Unitarias ---

test_sumar() {
    local resultado=$(sumar 5 3)
    if [ "$resultado" -eq 8 ]; then
        echo "✅ test_sumar: PASSED"
    else
        echo "❌ test_sumar: FAILED. Esperado 8, Obtenido $resultado"
    fi
}

test_es_par() {
    if es_par 4; then
        echo "✅ test_es_par (4): PASSED"
    else
        echo "❌ test_es_par (4): FAILED. Esperado par."
    fi

    if ! es_par 5; then # ! niega el resultado de la función
        echo "✅ test_es_par (5): PASSED"
    else
        echo "❌ test_es_par (5): FAILED. Esperado impar."
    fi
}

# Ejecutar todas las pruebas
echo "--- Ejecutando pruebas unitarias ---"
test_sumar
test_es_par
echo "--- Pruebas finalizadas ---"

# Ejemplo incorrecto: No verificar el código de retorno o la salida de las funciones.
# es_par 7
# echo "Resultado es_par: $?" # Sin un 'if' para verificar el resultado, no es una prueba.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Shell Scripting Avanzado',
    'topic': 'Pruebas y Validación',
    'subtopic': 'Validación de entrada avanzada',
    'definition': r'''
La validación de entrada avanzada es el proceso de verificar que los datos que tu script recibe (ya sean argumentos de línea de comandos, entrada de usuario o de archivos) son correctos, están en el formato esperado y cumplen con las condiciones necesarias antes de ser procesados. Va más allá de simplemente verificar si una variable está vacía.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en un formulario en línea; si no validas que el email sea un email válido o que la fecha tenga el formato correcto, la información que recibes será un desastre. En los scripts, una entrada no validada puede llevar a errores inesperados, comandos malformados, vulnerabilidades de seguridad (como la inyección de comandos) o datos corruptos. Una validación robusta es la primera línea de defensa para la fiabilidad y seguridad de tus scripts.

Las técnicas de validación avanzada incluyen:
* **Expresiones Regulares:** Usar `grep -q` o `[[ $variable =~ patron ]]` para verificar que la entrada coincide con un patrón específico (ej. un formato de IP, un nombre de usuario, una fecha).
* **Verificación de tipos:** Aunque Bash trata todo como cadenas, puedes simular la verificación de tipos para números (`[[ $variable =~ ^[0-9]+$ ]]`), rutas (`[ -f "$archivo" ]`, `[ -d "$directorio" ]`).
* **Verificación de rangos:** Asegurarte de que un número está dentro de un rango aceptable (`(( $numero >= 10 && $numero <= 20 ))`).
* **Validación de opciones de línea de comandos:** Usar `getopts` o `getopt` para analizar argumentos con opciones y sus valores.
* **Manejo de argumentos requeridos y opcionales:** Asegurarse de que se proporcionan los argumentos mínimos necesarios.

Implementar una validación de entrada exhaustiva te permite escribir scripts que son mucho más tolerantes a errores del usuario y más seguros frente a entradas maliciosas, lo cual es fundamental para scripts que interactúan con el mundo exterior.
''',
    'code_example': r'''
# Ejemplo: Validación de entrada avanzada en Bash

#!/bin/bash

# Función para validar si una cadena es una dirección IP válida (IPv4 simple)
validar_ip() {
    local ip=$1
    if [[ "$ip" =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        # Verificación de rango de octetos (simplificado)
        IFS='.' read -r -a octetos <<< "$ip"
        for octeto in "${octetos[@]}"; do
            if (( octeto < 0 || octeto > 255 )); then
                return 1 # IP inválida
            fi
        done
        return 0 # IP válida
    else
        return 1 # Formato de IP inválido
    fi
}

# Función para validar si un archivo existe y es legible
validar_archivo_legible() {
    local archivo=$1
    if [[ -f "$archivo" && -r "$archivo" ]]; then
        return 0 # Archivo existe y es legible
    else
        return 1 # Archivo no existe o no es legible
    fi
}

# --- Uso de las validaciones ---

# Validar argumento de IP
IP_SERVIDOR="$1"
if ! validar_ip "$IP_SERVIDOR"; then
    echo "ERROR: La dirección IP '$IP_SERVIDOR' no es válida."
    exit 1
fi
echo "IP del servidor '$IP_SERVIDOR' validada correctamente."

# Validar argumento de archivo
ARCHIVO_CONFIG="$2"
if ! validar_archivo_legible "$ARCHIVO_CONFIG"; then
    echo "ERROR: El archivo de configuración '$ARCHIVO_CONFIG' no existe o no es legible."
    exit 1
fi
echo "Archivo de configuración '$ARCHIVO_CONFIG' validado correctamente."

# Ejemplo incorrecto: No validar la entrada
# echo "Entrada del usuario: $1" # Sin validación, cualquier cosa puede ser pasada.
# rm -rf "$1" # ¡Peligroso si $1 no es validado! Podría ser '/'
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Shell Scripting Avanzado',
    'topic': 'Pruebas y Validación',
    'subtopic': 'Manejo robusto de errores',
    'definition': r'''
El manejo robusto de errores en scripts Bash se trata de anticipar fallos, detectar cuándo ocurren y responder a ellos de manera controlada y elegante. En lugar de que tu script se detenga abruptamente o continúe ejecutándose con datos corruptos, un manejo de errores robusto asegura que el script falle de forma segura, notifique al usuario o al sistema, e incluso intente recuperarse.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una operación crítica en un servidor, como una actualización o una copia de seguridad. Si el script falla a mitad de camino sin una gestión de errores, podría dejar el sistema en un estado inconsistente o con datos perdidos. Un buen manejo de errores es crucial para la fiabilidad de tus scripts, especialmente en entornos de producción. Te permite crear scripts que son más predecibles, fáciles de depurar y seguros.

Las técnicas clave para un manejo de errores robusto incluyen:
* **Códigos de salida (`$?`):** Verificar el código de salida de cada comando. `0` generalmente significa éxito, cualquier otro valor indica un error.
* **`set -e`:** Una de las opciones más importantes. Hace que el script salga inmediatamente si cualquier comando falla (devuelve un código de salida distinto de cero). Esto evita que el script continúe después de un error.
* **`trap` comando:** Definir comandos o funciones que se ejecuten cuando el script recibe una señal (ej. `EXIT`, `ERR`, `INT` para Ctrl+C). Es ideal para la limpieza de recursos temporales (`trap 'rm -f /tmp/mi_temp_file' EXIT`).
* **Funciones de manejo de errores:** Crear una función dedicada a manejar errores, que pueda imprimir mensajes específicos, limpiar y salir del script.
* **Mensajes de error claros:** Informar al usuario sobre lo que salió mal y, si es posible, cómo solucionarlo.
* **Logging:** Registrar los errores en un archivo de log para una revisión posterior.

Al incorporar estas técnicas, tus scripts serán mucho más tolerantes a los fallos y te proporcionarán una visión clara cuando algo no salga según lo planeado, lo cual es fundamental para cualquier tarea automatizada.
''',
    'code_example': r'''
# Ejemplo: Manejo robusto de errores en Bash

#!/bin/bash

# 1. Usar 'set -e' para salir en caso de error
set -e

# 2. Función para manejar errores de forma elegante
manejar_error() {
    local codigo_salida=$?
    local linea=$1
    echo "ERROR: El script falló en la línea $linea con código de salida $codigo_salida." >&2
    echo "Por favor, revise el log para más detalles." >&2
    exit "$codigo_salida"
}

# 3. Usar 'trap' para llamar a la función de error cuando un comando falla (ERR) o al salir (EXIT)
# La señal ERR es para comandos que fallan; EXIT es para la salida normal o por error del script.
trap 'manejar_error ${LINENO}' ERR
trap 'echo "Script finalizado (limpieza si es necesario)"' EXIT

# --- Inicio del script ---

echo "Iniciando script..."

# Ejemplo de operación que podría fallar
# Intentar copiar un archivo que no existe
echo "Intentando copiar un archivo inexistente..."
cp /ruta/que/no/existe/archivo.txt /tmp/destino.txt # Esto causará un error y el script saldrá

echo "Esta línea no se ejecutará si el comando 'cp' anterior falla."

# Otro ejemplo (este funcionaría si el anterior falla)
touch /tmp/archivo_creado.txt
echo "Archivo creado correctamente."

# Simular otro error
# ls /ruta/que/no/existe/ # Esto también causaría un error

echo "Script completado con éxito (si no hubo errores antes)."

# Ejemplo incorrecto: No verificar el código de salida y continuar la ejecución
# rm /tmp/archivo_temp.txt # Si falla, el script podría continuar, pero el archivo no se borró.
# Esto es peligroso porque las operaciones subsiguientes podrían depender de que el archivo se haya borrado.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Shell Scripting Avanzado',
    'topic': 'Pruebas y Validación',
    'subtopic': 'Logging estructurado',
    'definition': r'''
El logging estructurado es la práctica de generar mensajes de registro en un formato consistente y fácil de parsear por máquinas, como JSON o key-value pairs. Va más allá de simplemente imprimir texto plano en los logs.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en la necesidad de analizar grandes volúmenes de logs de múltiples servidores o aplicaciones. Si los logs son solo texto libre, buscar patrones o extraer información específica es una tarea manual y tediosa. El logging estructurado permite que herramientas de análisis de logs (como ELK Stack, Splunk, o incluso `jq`) puedan indexar, buscar, filtrar y correlacionar eventos de forma automática y eficiente. Esto es crucial para la monitorización, la depuración rápida de problemas y la seguridad en entornos de producción.

En el contexto de scripts Bash, puedes implementar logging estructurado formateando tus mensajes de `echo` o `printf` de una manera específica. Por ejemplo, podrías usar:
* **Formato JSON:** Imprimir objetos JSON válidos para cada evento de log. Esto es ideal si tus logs se van a consumir por sistemas de análisis.
* **Formato de clave-valor (Key-Value Pairs):** `timestamp="...", level="INFO", message="...", user="...", file="..."`. Este formato es más fácil de parsear con herramientas como `awk` o `grep` si no se dispone de un parser JSON.

Cada mensaje de log estructurado debería incluir información clave como la marca de tiempo, el nivel de log (INFO, WARN, ERROR, DEBUG), el nombre del script o la función, el ID de un proceso o transacción, y cualquier dato relevante para el evento. Adoptar el logging estructurado eleva la observabilidad de tus sistemas, facilitando enormemente la detección y resolución de problemas.
''',
    'code_example': r'''
# Ejemplo: Logging estructurado en Bash (formato clave-valor y JSON)

#!/bin/bash

SCRIPT_NAME="mi_script_avanzado.sh"
LOG_FILE="/var/log/mi_app/script_avanzado.log"

# Asegurarse de que el directorio de logs existe
mkdir -p "$(dirname "$LOG_FILE")"

# Función de logging en formato clave-valor
log_kv() {
    local level="$1"
    local message="$2"
    local timestamp=$(date +"%Y-%m-%dT%H:%M:%S%z")
    echo "timestamp=\"$timestamp\" level=\"$level\" script=\"$SCRIPT_NAME\" message=\"$message\"" | tee -a "$LOG_FILE"
}

# Función de logging en formato JSON (requiere 'jq')
log_json() {
    local level="$1"
    local message="$2"
    local timestamp=$(date -u +"%Y-%m-%dT%H:%M:%SZ") # UTC timestamp
    local data_json="{}" # Objeto JSON para datos adicionales
    if [ -n "$3" ]; then
        data_json="$3" # Si se pasa un tercer argumento, es un JSON con datos extra
    fi

    jq -n --arg ts "$timestamp" \
          --arg lvl "$level" \
          --arg scp "$SCRIPT_NAME" \
          --arg msg "$message" \
          '{"timestamp": $ts, "level": $lvl, "script": $scp, "message": $msg} + ($ARGS.named.data | fromjson)' \
          --argjson data "$data_json" | tee -a "$LOG_FILE"
}

# --- Uso de las funciones de logging ---

# Ejemplo de log INFO (clave-valor)
log_kv "INFO" "Inicio del script."

# Ejemplo de log ERROR con datos adicionales (clave-valor)
log_kv "ERROR" "No se pudo conectar a la base de datos." "host=\"db.example.com\" port=\"5432\""

# Ejemplo de log INFO (JSON)
log_json "INFO" "Procesando archivo." '{"file_name": "reporte.csv", "lines": 1234}'

# Ejemplo de log WARN (JSON)
log_json "WARN" "Espacio en disco bajo." '{"disk_path": "/var", "free_gb": 10}'

echo "Script finalizado."

# Ejemplo incorrecto: Logs sin formato o con información inconsistente.
# echo "$(date) - [INFO] - El script inició." # Difícil de parsear automáticamente.
# echo "Script completado." # No indica nivel, ni timestamp, ni nombre del script.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Shell Scripting Avanzado',
    'topic': 'Integración con APIs',
    'subtopic': 'curl avanzado',
    'definition': r'''
`curl` es una herramienta de línea de comandos que te permite transferir datos desde o hacia un servidor, utilizando una variedad de protocolos (HTTP, HTTPS, FTP, etc.). Si en el nivel junior lo usaste para descargar una página web, en el nivel avanzado te darás cuenta de su verdadero poder para interactuar con APIs RESTful, enviar datos complejos y manejar autenticación.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en la cantidad de servicios y aplicaciones que hoy en día se comunican a través de APIs web: desde servicios en la nube hasta sistemas internos. `curl` te permite interactuar con ellos programáticamente desde tus scripts, lo que es fundamental para la automatización, la integración de sistemas y el monitoreo. Es tu navaja suiza para hablar con el mundo web desde la terminal.

Las capacidades avanzadas de `curl` incluyen:
* **Métodos HTTP:** Usar `GET`, `POST`, `PUT`, `DELETE` para interactuar con APIs.
* **Envío de datos:** Enviar datos en el cuerpo de la solicitud (`-d` para POST, `-X PUT -d` para PUT), o enviar archivos (`-F` para formularios multipart).
* **Cabeceras HTTP:** Añadir cabeceras personalizadas (`-H`), lo cual es crucial para la autenticación (ej. `Authorization`) y para especificar el tipo de contenido (ej. `Content-Type: application/json`).
* **Autenticación:** Soporte para varios tipos de autenticación, incluyendo `Basic Auth` (`-u`), `Bearer tokens` (en la cabecera `Authorization`).
* **Manejo de cookies:** Almacenar y enviar cookies (`-b`, `-c`).
* **Redirecciones:** Seguir redirecciones (`-L`).
* **Verbosidad y depuración:** Ver el progreso y las cabeceras de la solicitud/respuesta (`-v`, `-D`).
* **SSL/TLS:** Manejar certificados, ignorar errores de SSL (`-k`).

Dominar `curl` es una habilidad indispensable para cualquier administrador de sistemas o desarrollador que necesite automatizar interacciones con servicios web y APIs.
''',
    'code_example': r'''
# Ejemplo: curl avanzado - Interactuar con una API RESTful
# Suponiendo que tienes una API de ejemplo en 'https://jsonplaceholder.typicode.com'

# 1. Realizar una solicitud GET para obtener un post (JSON)
curl -s "https://jsonplaceholder.typicode.com/posts/1" | jq .
# -s: Modo silencioso, no muestra el progreso.
# | jq .: Pipea la salida a jq para formatear el JSON (asume que jq está instalado).

# 2. Realizar una solicitud POST para crear un nuevo post
curl -s -X POST \
     -H "Content-Type: application/json" \
     -d '{ "title": "foo", "body": "bar", "userId": 1 }' \
     "https://jsonplaceholder.typicode.com/posts" | jq .
# -X POST: Especifica el método POST.
# -H: Añade una cabecera HTTP.
# -d: Envía datos en el cuerpo de la solicitud.

# 3. Realizar una solicitud PUT para actualizar un post
curl -s -X PUT \
     -H "Content-Type: application/json" \
     -d '{ "id": 1, "title": "foo_updated", "body": "bar_updated", "userId": 1 }' \
     "https://jsonplaceholder.typicode.com/posts/1" | jq .

# 4. Realizar una solicitud DELETE
curl -s -X DELETE "https://jsonplaceholder.typicode.com/posts/1"

# Ejemplo incorrecto: No especificar el Content-Type para solicitudes POST/PUT con JSON.
# curl -X POST -d '{ "title": "test" }' "http://api.example.com/posts"
# El servidor podría no entender el cuerpo de la solicitud si no sabe que es JSON.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Shell Scripting Avanzado',
    'topic': 'Integración con APIs',
    'subtopic': 'Autenticación API',
    'definition': r'''
La autenticación API es el proceso de verificar la identidad de un cliente (como tu script Bash) que intenta acceder a un servicio web a través de su API. Es como presentar una identificación para entrar a un lugar restringido; la API necesita saber quién eres y si tienes permiso para hacer lo que quieres.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en acceder a tu cuenta bancaria o a la configuración de un servidor en la nube a través de una API. Si no hubiera un mecanismo de autenticación, cualquiera podría acceder a tus datos o realizar operaciones no autorizadas. La autenticación es la base de la seguridad en la integración con APIs, protegiendo tus datos y recursos de accesos no deseados.

Existen varios métodos comunes de autenticación API, y tus scripts Bash necesitan saber cómo implementarlos con `curl` (u otras herramientas):
* **Autenticación Básica (Basic Authentication):** Consiste en enviar un nombre de usuario y una contraseña (codificados en Base64) en la cabecera `Authorization`. Es simple pero no muy seguro por sí solo, ya que las credenciales están presentes en la cabecera (aunque cifradas por HTTPS). Se usa con `curl -u usuario:contrasena`.
* **Tokens de Portador (Bearer Tokens / OAuth 2.0 Access Tokens):** Este es uno de los métodos más comunes hoy en día. Después de un proceso de login inicial (OAuth), recibes un token (una cadena larga) que se envía en la cabecera `Authorization` con el prefijo "Bearer ". Es seguro porque el token no expone las credenciales originales y puede tener un tiempo de vida limitado.
* **Claves API (API Keys):** Una cadena de texto única que se envía como un parámetro de consulta (`?api_key=xyz`) o como una cabecera personalizada (`-H "X-API-Key: xyz"`). Es simple pero menos seguro que los tokens si no se usa HTTPS y no se rota la clave.
* **Autenticación basada en firmas/HMAC:** Métodos más complejos donde la solicitud se "firma" criptográficamente usando una clave secreta para asegurar que la solicitud no ha sido alterada y proviene de una fuente auténtica.

Elegir el método de autenticación correcto y gestionarlo de forma segura (sin dejar credenciales expuestas en tus scripts) es un aspecto crítico de la integración exitosa y segura con cualquier API.
''',
    'code_example': r'''
# Ejemplo: Autenticación API con curl

# 1. Autenticación Básica (Basic Authentication)
# Envía "username:password" codificado en Base64 en la cabecera Authorization.
# Idealmente, usa HTTPS para cifrar el tráfico.
curl -s -u "mi_usuario:mi_contraseña_secreta" \
     "https://api.ejemplo.com/recurso_seguro" | jq .

# 2. Autenticación con Token de Portador (Bearer Token)
# Después de obtener un token de acceso (ej. 'gho_abcdef1234567890'), lo envías en la cabecera.
TOKEN="gho_abcdef1234567890abcdef1234567890abcdef"
curl -s -H "Authorization: Bearer $TOKEN" \
     "https://api.github.com/user/repos" | jq .

# 3. Autenticación con API Key en una cabecera personalizada
# Muchas APIs usan cabeceras como 'X-API-Key' o 'x-api-key'.
API_KEY="mi_clave_secreta_api_12345"
curl -s -H "X-API-Key: $API_KEY" \
     "https://api.ejemplo.com/datos" | jq .

# Ejemplo incorrecto: Dejar credenciales o tokens directamente en un script de un repositorio público.
# GITHUB_TOKEN="TU_TOKEN_AQUI" # ¡NUNCA HAGAS ESTO! Usa variables de entorno o un gestor de secretos.
# curl -H "Authorization: Bearer TU_TOKEN_AQUI" ...
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Shell Scripting Avanzado',
    'topic': 'Integración con APIs',
    'subtopic': 'Procesamiento de respuestas',
    'definition': r'''
El procesamiento de respuestas de APIs se refiere a la forma en que tus scripts Bash toman la información que reciben de un servicio web y la transforman o extraen datos útiles. Una API no solo te envía los datos que pediste, sino que a menudo los envuelve en una estructura (como JSON o XML) que necesita ser interpretada.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en cómo te comunicas con un amigo. No solo escuchas lo que dice, sino que procesas esa información para entenderla y quizás extraer un detalle importante. Lo mismo ocurre con las APIs. Si tu script no puede entender la respuesta de la API, no podrá actuar en consecuencia, ya sea para obtener un ID, verificar un estado o extraer una lista de elementos. El procesamiento de respuestas es el paso crítico que convierte datos crudos en información actionable.

Las respuestas de las APIs suelen venir en formatos estructurados como JSON o XML. Aunque Bash no tiene parsers nativos para estos formatos, existen herramientas de línea de comandos especializadas:
* **`jq` para JSON:** Como vimos antes, es la herramienta de facto para extraer, filtrar y manipular datos JSON. Es ideal para respuestas de la mayoría de las APIs RESTful modernas.
* **`xmllint` o `xmlstarlet` para XML:** Si la API devuelve XML, estas herramientas te permiten navegar por la estructura del XML y extraer elementos usando rutas XPath.
* **`grep`, `sed`, `awk` (como último recurso):** Para respuestas simples (ej. texto plano o HTML básico), estas herramientas aún pueden ser útiles para extraer información, pero son menos fiables para formatos estructurados complejos debido a su falta de conciencia de la estructura.

Además de extraer datos, el procesamiento de respuestas también implica verificar los códigos de estado HTTP (ej. 200 OK, 404 Not Found, 500 Internal Server Error) y los mensajes de error. Tu script debería ser capaz de reaccionar adecuadamente a estos, ya sea reintentando la operación, notificando un error o saliendo. Un procesamiento robusto de respuestas es clave para crear scripts que interactúan con APIs de forma inteligente y resiliente.
''',
    'code_example': r'''
# Ejemplo: Procesamiento de respuestas de API con Bash y jq

#!/bin/bash

API_URL="https://jsonplaceholder.typicode.com/posts/1"

# 1. Obtener la respuesta de la API y capturar el código de estado HTTP
HTTP_CODE=$(curl -s -o response.json -w "%{http_code}" "$API_URL")

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "Respuesta exitosa (HTTP $HTTP_CODE)."
    
    # 2. Procesar la respuesta JSON con jq
    ID=$(jq '.id' response.json)
    TITLE=$(jq '.title' response.json)
    USER_ID=$(jq '.userId' response.json)

    echo "ID del post: $ID"
    echo "Título: $TITLE"
    echo "ID de usuario: $USER_ID"

    # Eliminar el archivo temporal
    rm response.json
else
    echo "ERROR: La solicitud falló con código HTTP $HTTP_CODE."
    # Si la API devuelve un JSON de error, también lo podemos procesar
    if [ -f response.json ]; then
        ERROR_MESSAGE=$(jq '.message' response.json 2>/dev/null)
        if [ -n "$ERROR_MESSAGE" ]; then
            echo "Mensaje de error de la API: $ERROR_MESSAGE"
        fi
        rm response.json
    fi
    exit 1
fi

# Ejemplo incorrecto: Intentar parsear JSON complejo con grep.
# title=$(grep "title" response.json | cut -d':' -f2 | tr -d '"') # Muy frágil a cambios en el formato.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Shell Scripting Avanzado',
    'topic': 'Integración con APIs',
    'subtopic': 'Automatización con APIs',
    'definition': r'''
La automatización con APIs es el objetivo final de dominar `curl` y el procesamiento de respuestas. Se trata de escribir scripts Bash que interactúen programáticamente con servicios web para realizar tareas repetitivas, gestionar recursos, integrar sistemas o recopilar datos, todo ello sin intervención manual.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en las operaciones diarias de un administrador de sistemas: crear usuarios, provisionar máquinas virtuales, gestionar DNS, desplegar aplicaciones. Si tienes que hacer clic en una interfaz web para cada una de estas tareas en diez servidores, perderás muchísimo tiempo. La automatización con APIs elimina el trabajo manual, reduce los errores humanos, acelera las operaciones y permite escalar tus capacidades. Es la clave para la eficiencia en la administración de infraestructura y el DevOps moderno.

Un script de automatización con APIs típicamente sigue estos pasos:
1.  **Configuración de credenciales:** Obtener y gestionar de forma segura los tokens API o claves. Idealmente, se usan variables de entorno, archivos de configuración protegidos o gestores de secretos.
2.  **Construcción de solicitudes:** Formar las URLs, cabeceras y cuerpos de las solicitudes HTTP según la documentación de la API.
3.  **Ejecución de solicitudes:** Usar `curl` (o herramientas similares) para enviar las solicitudes al endpoint de la API.
4.  **Manejo de errores:** Verificar el código de estado HTTP y los mensajes de error de la API.
5.  **Procesamiento de respuestas:** Extraer los datos necesarios de la respuesta JSON/XML usando `jq` o `xmlstarlet`.
6.  **Lógica de negocio:** Basado en los datos obtenidos, el script puede tomar decisiones, ejecutar comandos adicionales, actualizar bases de datos o generar informes.
7.  **Iteración y bucles:** A menudo, los scripts de automatización necesitan realizar la misma operación para una lista de ítems, lo que implica bucles y lógica de procesamiento de listas.

Combinando todas las habilidades de Bash avanzado (arrays, funciones, manejo de errores, logging, `jq`, `curl`), puedes construir scripts de automatización increíblemente potentes que interactúan sin problemas con cualquier servicio que exponga una API. Es una habilidad de valor incalculable en el panorama tecnológico actual.
''',
    'code_example': r'''
# Ejemplo: Automatización con APIs - Crear un usuario en una API de gestión (conceptual)

#!/bin/bash

# Este script simula la creación de un usuario en una API de gestión de usuarios.
# Las credenciales y URLs deben ser manejadas de forma segura en un entorno real.

# --- Configuración ---
API_BASE_URL="https://api.ejemplo.com/usuarios"
AUTH_TOKEN="tu_super_token_seguro_aqui" # En producción, usa variables de entorno o un gestor de secretos.
CONTENT_TYPE="application/json"

# --- Funciones ---
crear_usuario() {
    local username="$1"
    local email="$2"
    local password="$3"

    local payload
    payload=$(jq -n \
        --arg u "$username" \
        --arg e "$email" \
        --arg p "$password" \
        '{username: $u, email: $e, password: $p}')

    echo "Creando usuario '$username'..."

    HTTP_CODE=$(curl -s -o response.json -w "%{http_code}" \
        -X POST \
        -H "Content-Type: $CONTENT_TYPE" \
        -H "Authorization: Bearer $AUTH_TOKEN" \
        -d "$payload" \
        "$API_BASE_URL")

    if [ "$HTTP_CODE" -eq 201 ]; then # 201 Created
        echo "Usuario '$username' creado exitosamente."
        ID_USUARIO=$(jq '.id' response.json)
        echo "ID asignado: $ID_USUARIO"
        rm response.json
        return 0
    else
        echo "ERROR: Fallo al crear usuario '$username'. HTTP $HTTP_CODE."
        if [ -f response.json ]; then
            ERROR_MSG=$(jq -r '.message' response.json 2>/dev/null)
            [ -n "$ERROR_MSG" ] && echo "Mensaje de la API: $ERROR_MSG"
            rm response.json
        fi
        return 1
    fi
}

# --- Ejecución ---
if [ "$#" -ne 3 ]; then
    echo "Uso: $0 <nombre_usuario> <email> <contraseña>"
    exit 1
fi

USUARIO_NUEVO="$1"
EMAIL_NUEVO="$2"
PASSWORD_NUEVO="$3"

if crear_usuario "$USUARIO_NUEVO" "$EMAIL_NUEVO" "$PASSWORD_NUEVO"; then
    echo "Proceso de automatización completado para $USUARIO_NUEVO."
else
    echo "El proceso de automatización para $USUARIO_NUEVO falló."
    exit 1
fi

# Ejemplo incorrecto: Hardcodear datos sensibles o no verificar el resultado de la API.
# curl -X POST -d '{"user": "admin", "pass": "123"}' "$API_URL/login" # No uses credenciales así.
# curl ... # No procesar la respuesta o el código de estado, asumiendo que todo siempre funciona.
'''
  });
}

Future<void> insertMidLevel3DataLinux(Database db) async {
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Virtualización y Contenedores',
    'topic': 'KVM Avanzado',
    'subtopic': 'Configuración avanzada',
    'definition': r'''
KVM (Kernel-based Virtual Machine) es una tecnología de virtualización de código abierto que convierte el kernel de Linux en un hipervisor, permitiéndote ejecutar múltiples máquinas virtuales (VMs) en un solo servidor físico. La configuración avanzada de KVM implica optimizar su rendimiento y comportamiento para entornos de producción.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en un servidor con muchos recursos que quieres exprimir al máximo para correr diferentes aplicaciones, cada una en su propio entorno aislado. Con KVM, puedes crear máquinas virtuales con un rendimiento casi nativo. La configuración avanzada te permite afinar cada detalle para asegurar que tus VMs sean estables, rápidas y se adapten perfectamente a tus necesidades, lo cual es crucial para entornos de servidores donde la eficiencia y la fiabilidad son vitales.

La configuración avanzada de KVM va más allá de la simple creación de una VM y se enfoca en aspectos como:
* **Asignación de recursos:** Control preciso sobre la cantidad de CPU, RAM y E/S de disco que se le asigna a cada VM. Esto incluye la sobreasignación (overcommitment) de recursos para maximizar la densidad de VMs, pero con la cautela de no degradar el rendimiento.
* **Optimización de CPU:** Configurar la topología de CPU de la VM (número de sockets, cores por socket, hilos por core) para que coincida mejor con la aplicación invitada y el hardware subyacente. También se puede habilitar la pasarela de CPU (CPU passthrough) para exponer características de CPU específicas del host a la VM.
* **Módulos de E/S:** Utilizar dispositivos de E/S virtio, que son controladores paravirtualizados optimizados para KVM, ofreciendo un rendimiento de disco y red muy superior a los dispositivos emulados tradicionales.
* **Consolas y gráficos:** Configurar diferentes tipos de consolas (VNC, SPICE) y ajustar las opciones gráficas para optimizar la experiencia de usuario o el consumo de recursos en VMs sin interfaz gráfica.
* **Gestión de eventos y QEMU Monitor:** Interactuar directamente con el proceso QEMU que emula la VM para realizar tareas avanzadas, como inyectar comandos o monitorear el estado en tiempo real.

Configurar KVM de forma avanzada te permite exprimir el máximo rendimiento de tu hardware y construir una infraestructura virtualizada robusta y eficiente.
''',
    'code_example': r'''
# Ejemplo: Configuración avanzada de una VM con virt-install (CLI)
# Crear una VM con CPU y RAM específicos, disco virtio y red virtio

# Este comando es conceptual y requiere la imagen ISO/qcow2 en /var/lib/libvirt/images
sudo virt-install \
    --name my_advanced_vm \
    --ram 4096 \
    --vcpus 2,sockets=1,cores=2,threads=1 \
    --os-variant ubuntu22.04 \
    --disk path=/var/lib/libvirt/images/my_advanced_vm.qcow2,size=20,bus=virtio \
    --network bridge=br0,model=virtio \
    --location /var/lib/libvirt/images/ubuntu-22.04-live-server-amd64.iso,kernel=vmlinuz,initrd=initrd \
    --graphics vnc,listen=0.0.0.0 \
    --noautoconsole \
    --virt-type kvm

# Ejemplo: Modificar la configuración de una VM existente (usando virsh edit)
# sudo virsh edit my_advanced_vm
# Dentro del editor, puedes ajustar los siguientes valores:
# <currentMemory unit='KiB'>4194304</currentMemory>
# <memory unit='KiB'>4194304</memory>
# <vcpu placement='static'>2</vcpu>
# <cpu mode='host-passthrough' check='partial'/> # Para pasarela de CPU
# En la sección <devices>, asegúrate de que el disco y la red usen el modelo 'virtio'
# <disk type='file' device='disk'>
#   <driver name='qemu' type='qcow2' cache='none'/>
#   <source file='/var/lib/libvirt/images/my_advanced_vm.qcow2'/>
#   <target dev='vda' bus='virtio'/> # Aquí 'virtio'
# </disk>
# <interface type='bridge'>
#   <mac address='52:54:00:xx:yy:zz'/>
#   <source bridge='br0'/>
#   <model type='virtio'/> # Aquí 'virtio'
# </interface>

# Ejemplo incorrecto: No usar virtio para el disco y la red.
# Si en <target dev='hda' bus='ide'/> o <model type='e1000'/>, el rendimiento será inferior.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Virtualización y Contenedores',
    'topic': 'KVM Avanzado',
    'subtopic': 'Redes virtuales complejas',
    'definition': r'''
Las redes virtuales complejas en KVM implican ir más allá de una simple conexión de puente (bridge) para tus máquinas virtuales. Se trata de diseñar y configurar una infraestructura de red sofisticada que permita a tus VMs comunicarse entre sí, con el host y con redes externas de forma segura y eficiente.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en un entorno de servidor donde necesitas diferentes tipos de tráfico (ej. tráfico público de internet, tráfico de base de datos interno, tráfico de gestión) aislados o en diferentes subredes. Una configuración de red simple no es suficiente. Las redes virtuales complejas te permiten segmentar tu tráfico, implementar firewalls entre VMs, crear redes privadas solo para VMs, o incluso integrar tus VMs en una red física existente con VLANs. Esto es fundamental para la seguridad, el rendimiento y la organización en entornos de virtualización.

Las técnicas para redes virtuales complejas en KVM incluyen:
* **Puentes de red (Bridges):** Conectar interfaces virtuales de VMs a una interfaz de red física del host, permitiendo que las VMs obtengan IPs de la red externa como si fueran máquinas físicas. Puedes crear múltiples puentes y asociarlos a diferentes interfaces físicas o VLANs.
* **Redes NAT/Enrutadas:** Crear redes virtuales privadas para tus VMs donde el tráfico se enruta a través del host. Las VMs obtienen IPs de una subred interna y el host realiza NAT (Network Address Translation) para permitirles acceder a redes externas.
* **VLANs (Virtual Local Area Networks):** Segmentar el tráfico de red de las VMs a nivel de capa 2. Puedes configurar KVM para que las VMs envíen tráfico etiquetado con VLANs, lo que es útil para la segregación de red en entornos empresariales.
* **Redes aisladas/privadas:** Crear redes virtuales que solo existen entre VMs en el mismo host, sin acceso directo a la red física. Esto es útil para comunicaciones internas entre componentes de una aplicación multicapa.
* **Open vSwitch (OVS):** Un switch virtual programable y de código abierto que ofrece capacidades de red avanzadas mucho más allá de los puentes Linux estándar, incluyendo soporte para SDN (Software-Defined Networking), túneles, QoS y balanceo de carga.

Diseñar e implementar redes virtuales complejas es crucial para construir una infraestructura de virtualización robusta y adaptada a las necesidades específicas de tu aplicación y seguridad.
''',
    'code_example': r'''
# Ejemplo: Configuración de redes virtuales complejas en KVM

# 1. Crear un puente de red (si no tienes uno, ej. para VMs que acceden a la red física)
# Instalar bridge-utils
# sudo apt install bridge-utils -y # Debian/Ubuntu
# sudo dnf install bridge-utils -y # RHEL/CentOS

# Archivo de configuración de red (ej. /etc/netplan/01-netcfg.yaml en Ubuntu)
# network:
#   version: 2
#   ethernets:
#     enp0s3: # Tu interfaz física
#       dhcp4: no
#   bridges:
#     br0:
#       interfaces: [enp0s3]
#       dhcp4: yes # O configurar IP estática
#       parameters:
#         stp: true
#         forward-delay: 0
# sudo netplan apply

# 2. Crear una red NAT/Enrutada con virsh (para VMs con acceso a Internet a través del host)
# Definir la red en un archivo XML (ej. nat-network.xml)
/*
<network>
  <name>nat-network</name>
  <uuid>tu-uuid-generado</uuid> # Puedes omitirlo, libvirt lo genera
  <forward mode='nat'/>
  <bridge name='virbr1' stp='on' delay='0'/>
  <ip address='192.168.122.1' netmask='255.255.255.0'>
    <dhcp>
      <range start='192.168.122.100' end='192.168.122.200'/>
    </dhcp>
  </ip>
</network>
*/
# sudo virsh net-define nat-network.xml
# sudo virsh net-start nat-network
# sudo virsh net-autostart nat-network

# 3. Adjuntar una VM a una red específica (cuando la creas o editas)
# Usando virt-install
# --network network=nat-network,model=virtio

# O editando la VM con virsh edit y añadiendo:
# <interface type='network'>
#   <source network='nat-network'/>
#   <model type='virtio'/>
# </interface>

# Ejemplo incorrecto: Configurar múltiples interfaces de VM en la misma red sin aislamiento.
# Esto podría causar conflictos de IP o routing, y no proporciona segmentación de tráfico.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Virtualización y Contenedores',
    'topic': 'KVM Avanzado',
    'subtopic': 'Almacenamiento virtualizado',
    'definition': r'''
El almacenamiento virtualizado en KVM se refiere a cómo gestionas y presentas los recursos de almacenamiento a tus máquinas virtuales. Va mucho más allá de simplemente asignar un archivo de imagen a una VM, e implica optimizar el rendimiento, la flexibilidad y la resiliencia del almacenamiento de tus VMs.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en el rendimiento de una aplicación o base de datos que se ejecuta dentro de una VM. Si el almacenamiento subyacente es lento o inflexible, toda la aplicación se verá afectada. El almacenamiento virtualizado adecuado es fundamental para la velocidad, la escalabilidad y la fiabilidad de tus máquinas virtuales, lo cual es vital para cualquier carga de trabajo de producción.

Las opciones y técnicas avanzadas para el almacenamiento virtualizado en KVM incluyen:
* **Imágenes de disco (QCOW2 vs. RAW):**
    * **RAW:** Imágenes de disco simples y directas, ofrecen el mejor rendimiento (casi nativo) pero ocupan todo el espacio asignado desde el principio.
    * **QCOW2 (QEMU Copy-On-Write):** Formato más avanzado que permite funciones como instantáneas (snapshots), clonación, compresión y asignación de espacio dinámico (crece a medida que se usa). Ideal para flexibilidad y ahorro de espacio, aunque con una ligera sobrecarga de rendimiento.
* **Volúmenes Lógicos (LVM):** Utilizar LVM en el host para crear volúmenes lógicos que se asignan directamente a las VMs como discos. Ofrece flexibilidad para redimensionar, tomar instantáneas de LVM y gestionar pools de almacenamiento.
* **Almacenamiento en red (NFS, iSCSI, Ceph):** Conectar tus VMs a almacenamiento centralizado en red. Esto es crucial para la migración en caliente (live migration) de VMs entre hosts y para la alta disponibilidad.
    * **NFS:** Simple de configurar, ideal para archivos de imágenes de disco.
    * **iSCSI:** Ofrece acceso a nivel de bloque a almacenamiento remoto, con buen rendimiento.
    * **Ceph:** Un sistema de almacenamiento distribuido y altamente escalable que proporciona almacenamiento de objetos, bloques y archivos. Ideal para infraestructuras de nube y KVM a gran escala.
* **Pasarela de dispositivos (PCI Passthrough):** Asignar un dispositivo de hardware físico (ej. una tarjeta gráfica, un controlador de almacenamiento NVMe) directamente a una VM, dándole rendimiento nativo y acceso exclusivo al hardware. Esto es para cargas de trabajo que exigen el máximo rendimiento o acceso directo al hardware.
* **Caché de disco:** Configurar el modo de caché del disco virtual (ej. `none`, `writeback`, `writethrough`) para optimizar el rendimiento de E/S según tu carga de trabajo y tus requisitos de durabilidad de datos.

Elegir la estrategia de almacenamiento adecuada y configurarla correctamente es tan crítico como la CPU o la RAM para el rendimiento general de tus máquinas virtuales KVM.
''',
    'code_example': r'''
# Ejemplo: Configuración de almacenamiento virtualizado en KVM

# 1. Crear una imagen de disco QCOW2 (dinámica)
sudo qemu-img create -f qcow2 /var/lib/libvirt/images/my_vm_disk.qcow2 20G
# Esto crea una imagen que crece hasta 20GB a medida que se usa.

# 2. Crear un volumen lógico LVM y asignarlo a una VM
# Asumiendo que ya tienes un Volume Group (VG) llamado 'vg_data'
# Crear un LV de 50GB
sudo lvcreate -L 50G -n lv_myvm vg_data

# Adjuntar este LV a una VM (editando la VM con virsh edit)
# En la sección <devices>:
# <disk type='block' device='disk'>
#   <driver name='qemu' type='raw' cache='none'/> # 'raw' para rendimiento máximo con LVM
#   <source dev='/dev/vg_data/lv_myvm'/>
#   <target dev='vda' bus='virtio'/>
# </disk>

# 3. Configurar una VM para usar un disco en NFS
# Montar el NFS share en el host
# sudo mount -t nfs 192.168.1.200:/mnt/nfs_vm_data /var/lib/libvirt/images/nfs_pool

# Adjuntar la imagen NFS a la VM (editando la VM con virsh edit)
# <disk type='file' device='disk'>
#   <driver name='qemu' type='qcow2' cache='none'/>
#   <source file='/var/lib/libvirt/images/nfs_pool/another_vm.qcow2'/>
#   <target dev='vda' bus='virtio'/>
# </disk>

# 4. Configurar PCI Passthrough (ejemplo conceptual - requiere hardware compatible y configuración de IOMMU)
# Primero, identificar el ID del dispositivo PCI (ej. 0000:01:00.0)
# Luego, desvincularlo del driver del host y vincularlo a vfio-pci
# sudo virsh nodedev detach pci_0000_01_00_0
# Después, en virsh edit my_vm:
# <hostdev mode='subsystem' type='pci' managed='yes'>
#   <source>
#     <address domain='0x0000' bus='0x01' slot='0x00' function='0x0'/>
#   </source>
# </hostdev>

# Ejemplo incorrecto: Usar cache='writeback' sin una batería de respaldo (BBU) en el controlador RAID del host.
# Esto puede llevar a pérdida de datos en caso de un corte de energía. cache='none' o cache='writethrough' son más seguros.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Virtualización y Contenedores',
    'topic': 'KVM Avanzado',
    'subtopic': 'Migración en caliente',
    'definition': r'''
La migración en caliente (Live Migration) en KVM es una funcionalidad avanzada que te permite mover una máquina virtual en funcionamiento desde un host físico a otro, sin interrupción de servicio para los usuarios o aplicaciones que se ejecutan dentro de la VM. Es como mover una casa con personas dentro de una ubicación a otra, sin que se den cuenta.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en un servidor físico que necesita mantenimiento (actualizaciones de hardware, parches de seguridad, o incluso una falla inminente). Sin migración en caliente, tendrías que apagar las VMs, lo que resultaría en tiempo de inactividad para tus servicios. La migración en caliente elimina ese tiempo de inactividad, lo que es absolutamente crítico para la alta disponibilidad, el mantenimiento sin interrupciones y el balanceo de carga dinámico en entornos de producción y nube.

El proceso de migración en caliente en KVM, gestionado principalmente a través de `libvirt` y `virsh`, implica los siguientes pasos (simplificados):
1.  **Transferencia de estado de memoria:** La memoria de la VM se copia incrementalmente del host de origen al host de destino mientras la VM sigue funcionando. KVM/QEMU intenta copiar solo las páginas de memoria que han cambiado (dirty pages).
2.  **Sincronización:** Una vez que la mayoría de la memoria se ha copiado, la VM se pausa por un tiempo muy breve (milisegundos), se transfiere la memoria restante y el estado de la CPU.
3.  **Reanudación en destino:** La VM se inicia en el host de destino exactamente desde el punto donde se pausó en el origen.
4.  **Almacenamiento compartido:** Para que la migración sea posible sin copiar todo el disco de la VM (que sería demasiado lento para una migración en caliente), el disco de la VM debe estar en almacenamiento compartido (ej. NFS, iSCSI, Ceph) accesible por ambos hosts.

La migración en caliente es una característica estrella de KVM que permite una flexibilidad y disponibilidad excepcionales para tus cargas de trabajo virtualizadas, siendo un pilar en cualquier estrategia de alta disponibilidad.
''',
    'code_example': r'''
# Ejemplo: Realizar una migración en caliente de KVM con virsh

# Requisitos previos:
# 1. Ambos hosts KVM deben tener libvirt y KVM instalados y configurados.
# 2. El almacenamiento de la VM debe ser compartido (ej. en NFS) y accesible por ambos hosts.
# 3. Los hosts deben poder comunicarse por red y tener los puertos necesarios abiertos (ej. 16509 para libvirt, 49152-49215 para migración).
# 4. Asegúrate de que no hay firewalls bloqueando la comunicación.

# --- En el host de origen (Source Host) ---

# 1. Asegúrate de que el daemon libvirtd está corriendo
sudo systemctl status libvirtd

# 2. Iniciar la migración en caliente
# my_vm: Nombre de la máquina virtual a migrar.
# qemu+ssh://user@destination_host_ip/system: URL de conexión al host de destino.
# --live: Realiza la migración en caliente (sin tiempo de inactividad).
# --persistent: Hace que la definición de la VM sea persistente en el host de destino.
# --undefine-source: (Opcional) Elimina la definición de la VM del host de origen después de la migración exitosa.
sudo virsh migrate --live my_vm qemu+ssh://usuario_remoto@ip_destino/system --persistent --undefine-source

# Esto te pedirá la contraseña del usuario_remoto en el host de destino.
# Una vez completado, 'my_vm' debería estar corriendo en el host de destino.

# Verificar el estado de la VM en el host de origen (debería estar apagada o indefinida si usaste --undefine-source)
# virsh list --all

# --- En el host de destino (Destination Host) ---

# Verificar que la VM está corriendo
# virsh list

# Ejemplo incorrecto: Intentar migrar una VM con almacenamiento local (no compartido).
# virsh migrate --live my_vm qemu+ssh://user@ip_destino/system
# Esto fallaría o intentaría una migración 'offline' si el almacenamiento no es compartido.
# El error común es "Migration not supported by this storage type." o similar.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Virtualización y Contenedores',
    'topic': 'Docker Avanzado',
    'subtopic': 'Dockerfiles avanzados',
    'definition': r'''
Los Dockerfiles avanzados son el siguiente nivel en la construcción de imágenes de Docker eficientes, seguras y optimizadas. Si en el nivel junior aprendiste a usar `FROM`, `RUN` y `CMD`, aquí profundizamos en técnicas para crear imágenes más robustas y escalables.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una aplicación que despliegas en producción. Una imagen de Docker mal construida puede ser enorme (ocupando mucho espacio), lenta de construir, o incluso insegura, al incluir dependencias innecesarias o credenciales expuestas. Un Dockerfile avanzado te permite crear imágenes ligeras, reproducibles y seguras, lo cual es fundamental para el rendimiento, la eficiencia y la seguridad de tus despliegues en contenedores.

Las características de los Dockerfiles avanzados incluyen:
* **Construcción de múltiples etapas (Multi-stage builds):** Esta es una de las técnicas más importantes. Te permite usar múltiples sentencias `FROM` en un solo Dockerfile. La idea es que una etapa se use para compilar o empaquetar tu aplicación (ej. compilar un código Java o Go), y una etapa posterior (más pequeña) tome solo los artefactos necesarios del compilado, resultando en una imagen final mucho más reducida. Esto reduce significativamente el tamaño de la imagen y la superficie de ataque.
* **Optimización del cache de capas:** Entender cómo Docker cachea las capas para acelerar las construcciones. Mover las instrucciones que cambian con menos frecuencia (como `COPY . .` de tu código fuente) hacia el final del Dockerfile ayuda a aprovechar mejor el caché.
* **Variables de entorno (`ARG` vs `ENV`):** `ARG` define variables de construcción que solo están disponibles durante el proceso de construcción de la imagen, mientras que `ENV` define variables de entorno que persisten en el contenedor en tiempo de ejecución.
* **USUARIO (`USER`):** Especificar el usuario con el que se ejecutará el proceso dentro del contenedor, idealmente un usuario no root para mejorar la seguridad.
* **Puntos de montaje de secretos (`--secret` en `buildkit`):** Evitar copiar información sensible (claves API, contraseñas) directamente en la imagen. BuildKit (el constructor por defecto de Docker) permite montar secretos como archivos temporales durante la construcción.
* **Salud del contenedor (`HEALTHCHECK`):** Definir un comando para que Docker verifique periódicamente si el contenedor sigue funcionando correctamente y no solo está en ejecución.

Dominar estas técnicas de Dockerfile te permite construir imágenes de Docker de grado de producción, que son la base para despliegues eficientes y seguros en contenedores.
''',
    'code_example': r'''
# Ejemplo: Dockerfile Multi-Stage para una aplicación Go

# Etapa 1: Construcción (builder stage)
FROM golang:1.22-alpine AS builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN CGO_ENABLED=0 go build -o /go-app

# Etapa 2: Imagen final (final stage)
FROM alpine:latest

WORKDIR /app

COPY --from=builder /go-app .

# Exponer el puerto
EXPOSE 8080

# Definir el comando de inicio
CMD ["./go-app"]

# Ejemplo de Dockerfile con HEALTHCHECK y USER
# FROM nginx:alpine
# USER nginx # Ejecutar Nginx como un usuario no-root por seguridad

# HEALTHCHECK --interval=30s --timeout=3s \
#   CMD curl --fail http://localhost || exit 1

# Ejemplo incorrecto: Copiar todo el directorio de trabajo al principio, rompiendo el caché.
# FROM node:latest
# WORKDIR /app
# COPY . . # Si tu código cambia a menudo, invalida el caché de las capas subsiguientes.
# RUN npm install
# CMD ["node", "app.js"]
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Virtualización y Contenedores',
    'topic': 'Docker Avanzado',
    'subtopic': 'Orquestación básica',
    'definition': r'''
La orquestación básica en Docker se refiere a la gestión y automatización del despliegue, escalado, redes y disponibilidad de múltiples contenedores. Si Docker te permite correr contenedores individuales, la orquestación es lo que necesitas para gestionar aplicaciones completas compuestas por muchos contenedores que interactúan entre sí.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una aplicación web que tiene una base de datos, un backend, un frontend y un balanceador de carga. Cada uno de estos componentes podría ser un contenedor separado. Gestionar su orden de inicio, sus conexiones de red, sus volúmenes y su escalado manualmente sería un caos. La orquestación básica simplifica enormemente esta complejidad, permitiéndote definir la arquitectura de tu aplicación y dejar que una herramienta se encargue de la gestión operativa.

Las herramientas de orquestación básica más comunes en el ecosistema Docker son:
* **Docker Compose:** Es la herramienta principal para definir y ejecutar aplicaciones Docker multicontenedor en un solo host. Utilizas un archivo YAML (`docker-compose.yml`) para configurar todos los servicios de tu aplicación, incluyendo las imágenes a usar, puertos, volúmenes, redes y dependencias. Es ideal para entornos de desarrollo, pruebas, o despliegues simples en un único servidor.
* **Docker Swarm (integrado en Docker Engine):** Es la solución de orquestación nativa de Docker para clústeres. Te permite unir varios hosts Docker en un clúster (un "swarm") y desplegar servicios (aplicaciones) de forma distribuida. Swarm se encarga de la planificación de contenedores, el balanceo de carga, la alta disponibilidad y la autorreparación. Aunque es menos potente que Kubernetes, es muy fácil de configurar y usar para clústeres pequeños o medianos.

Ambas herramientas te abstraen de la complejidad de gestionar contenedores individuales, permitiéndote pensar en tu aplicación como un conjunto de servicios interconectados. Es el paso inicial hacia la gestión de contenedores a escala.
''',
    'code_example': r'''
# Ejemplo: Orquestación básica con Docker Compose
# Archivo docker-compose.yml para una aplicación web con una base de datos

# version: '3.8' # Versión de la sintaxis de Compose

# services:
#   web:
#     build: . # Construye la imagen desde el Dockerfile en el directorio actual
#     ports:
#       - "80:80" # Mapea el puerto 80 del host al puerto 80 del contenedor
#     volumes:
#       - .:/app # Monta el directorio actual del host en /app dentro del contenedor
#     depends_on:
#       - db # Asegura que 'db' se inicie antes que 'web'
#     environment:
#       DATABASE_URL: db # Variable de entorno para la conexión a la base de datos

#   db:
#     image: postgres:13 # Usa una imagen oficial de PostgreSQL
#     environment:
#       POSTGRES_DB: mydb
#       POSTGRES_USER: user
#       POSTGRES_PASSWORD: password
#     volumes:
#       - db_data:/var/lib/postgresql/data # Volumen persistente para los datos de la base de datos

# volumes:
#   db_data: # Define el volumen persistente

# Cómo usarlo:
# Desde el directorio donde está docker-compose.yml:
# Iniciar la aplicación:
# sudo docker-compose up -d
# -d: Ejecuta los contenedores en segundo plano (detached mode).

# Detener y eliminar los contenedores:
# sudo docker-compose down

# Ejemplo de Docker Swarm (comandos básicos)
# En el primer nodo (manager):
# docker swarm init --advertise-addr <IP_DEL_MANAGER>
# Obtendrá un comando para unir otros nodos al swarm.

# En otros nodos (workers):
# docker swarm join --token <TOKEN> <IP_DEL_MANAGER>:2377

# Después de inicializar el swarm, puedes desplegar servicios:
# docker service create --name my-nginx --publish 80:80 nginx:latest
# Escalar el servicio:
# docker service scale my-nginx=3

# Ejemplo incorrecto: Lanzar cada contenedor manualmente y luego tratar de conectarlos.
# docker run -d --name db_container postgres:13
# docker run -d --name web_container -p 80:80 --link db_container:db my_web_app
# Esto se vuelve inmanejable rápidamente para aplicaciones complejas.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Virtualización y Contenedores',
    'topic': 'Docker Avanzado',
    'subtopic': 'Redes en Docker',
    'definition': r'''
Las redes en Docker son la forma en que los contenedores se comunican entre sí, con el host y con el mundo exterior. Va más allá de simplemente exponer un puerto, e implica entender los diferentes tipos de redes que Docker crea para aislar y conectar tus aplicaciones.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una aplicación multicapa con un frontend, un backend y una base de datos. Necesitas que el frontend hable con el backend, y el backend con la base de datos, pero quizás no quieres que la base de datos sea accesible directamente desde internet. Una configuración de red adecuada es fundamental para la seguridad, el aislamiento y la capacidad de descubrimiento de tus servicios en contenedores.

Docker proporciona varios tipos de drivers de red, cada uno con un propósito específico:
* **Bridge (default):** Es la red por defecto para los contenedores. Cada contenedor obtiene una IP en una subred privada y puede comunicarse con otros contenedores en la misma red bridge. El tráfico saliente al mundo exterior se NATea a través de la IP del host. Para la comunicación entre contenedores, puedes usar sus nombres si están en la misma red definida por el usuario.
* **Host:** Un contenedor usa directamente la pila de red del host, es decir, comparte la dirección IP y los puertos del host. Esto proporciona el mejor rendimiento de red pero elimina el aislamiento de red del contenedor.
* **None:** El contenedor no tiene interfaz de red, solo la interfaz de loopback. Útil para contenedores que solo procesan datos de entrada/salida y no necesitan conectividad de red.
* **Overlay (para Docker Swarm):** Este driver crea una red distribuida entre múltiples hosts Docker. Permite que los contenedores en diferentes hosts se comuniquen como si estuvieran en la misma red local, lo cual es fundamental para la orquestación de contenedores a escala.
* **Macvlan:** Permite que un contenedor tenga su propia dirección MAC y se conecte directamente a la red física subyacente, apareciendo como un dispositivo físico en la red. Útil para casos de uso específicos donde el contenedor necesita ser una "máquina física" en la red.

Entender y configurar correctamente las redes en Docker te permite construir arquitecturas de contenedores complejas, seguras y eficientes.
''',
    'code_example': r'''
# Ejemplo: Redes en Docker

# 1. Inspeccionar las redes existentes
sudo docker network ls

# 2. Crear una red bridge definida por el usuario
# Es mejor usar redes definidas por el usuario que la red 'bridge' por defecto,
# ya que proporcionan resolución de nombres DNS entre contenedores.
sudo docker network create --driver bridge my_app_network

# 3. Lanzar contenedores en la red definida por el usuario
# Ahora puedes referenciar 'db' por su nombre desde el contenedor 'web'
sudo docker run -d --name db_container --network my_app_network postgres:13
sudo docker run -d --name web_container --network my_app_network -p 80:80 my_web_app_image

# Verificar que los contenedores están en la red
sudo docker inspect my_app_network

# 4. Lanzar un contenedor en modo 'host' (comparte la pila de red del host)
# Ten cuidado con esto, ya que el contenedor usa los puertos del host directamente.
# sudo docker run -d --name my_nginx_host --network host nginx:latest

# 5. Conectar un contenedor existente a una red adicional
# sudo docker network connect another_network my_existing_container

# Ejemplo incorrecto: Exponer demasiados puertos o usar --link (obsoleto).
# docker run -p 80:80 -p 22:22 -p 8080:8080 my_app # Exponer demasiados puertos aumenta la superficie de ataque.
# docker run --link db_container:db my_app # --link está obsoleto, usa redes definidas por el usuario.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Virtualización y Contenedores',
    'topic': 'Docker Avanzado',
    'subtopic': 'Volúmenes persistentes',
    'definition': r'''
Los volúmenes persistentes en Docker son la solución para almacenar datos generados por los contenedores de forma duradera y que no se pierdan cuando el contenedor se detiene, se elimina o se reinicia. Piensa en ellos como discos duros externos para tus contenedores.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una base de datos o en una aplicación que genera logs. Si los datos solo se almacenan dentro del contenedor, se borrarán en cuanto elimines ese contenedor. Esto hace que tus aplicaciones no sean persistentes y pierdan su estado. Los volúmenes persistentes son absolutamente cruciales para cualquier aplicación con estado (bases de datos, colas de mensajes, sistemas de archivos) que se ejecute en Docker, asegurando que tus datos sobrevivan al ciclo de vida del contenedor.

Docker ofrece varias formas de implementar volúmenes persistentes:
* **Volúmenes (Volumes):** Son la forma preferida de Docker para gestionar datos persistentes. Son directorios que Docker gestiona completamente en el sistema de archivos del host, pero fuera del sistema de archivos del contenedor. Docker se encarga de crearlos, gestionarlos y montarlos. Son muy eficientes y portables. Se usan para datos de bases de datos, cachés, etc.
* **Bind Mounts:** Te permiten montar un directorio o un archivo específico del sistema de archivos del host directamente en el contenedor. Esto te da un control muy fino sobre la ubicación del host. Son útiles para montar archivos de configuración, código fuente durante el desarrollo, o directorios de logs que quieres que estén directamente en el host.
* **tmpfs Mounts:** Montan un archivo temporal en la memoria RAM del host. Son útiles para datos no persistentes y sensibles que necesitan ser eliminados después de que el contenedor se detiene.

Entender y aplicar correctamente los volúmenes persistentes es fundamental para construir aplicaciones en contenedores que sean robustas, tolerantes a fallos y que mantengan su estado de forma segura.
''',
    'code_example': r'''
# Ejemplo: Volúmenes persistentes en Docker

# 1. Crear un volumen de Docker (la forma preferida)
sudo docker volume create my_data_volume

# 2. Lanzar un contenedor de PostgreSQL usando el volumen
sudo docker run -d \
    --name my_postgres_db \
    -e POSTGRES_DB=mydb \
    -e POSTGRES_USER=user \
    -e POSTGRES_PASSWORD=password \
    -v my_data_volume:/var/lib/postgresql/data \
    postgres:13

# -v my_data_volume:/var/lib/postgresql/data: Monta 'my_data_volume' (el volumen de Docker)
# en '/var/lib/postgresql/data' dentro del contenedor.
# Los datos de la base de datos se guardarán en el volumen y persistirán incluso si el contenedor es eliminado.

# 3. Listar volúmenes
sudo docker volume ls

# 4. Inspeccionar un volumen
sudo docker volume inspect my_data_volume
# Verás la ubicación real en el host bajo "Mountpoint".

# 5. Usar un Bind Mount (montar un directorio del host)
# Asegúrate de que el directorio /home/user/my_app_data exista en el host
mkdir -p /home/user/my_app_data
echo "Hello from host" > /home/user/my_app_data/host_file.txt

sudo docker run -it --rm \
    --name my_app_container \
    -v /home/user/my_app_data:/app/data \
    alpine sh -c "ls -l /app/data && cat /app/data/host_file.txt"

# -v /home/user/my_app_data:/app/data: Monta '/home/user/my_app_data' del host
# en '/app/data' dentro del contenedor. Los cambios se reflejan en ambos lados.

# Ejemplo incorrecto: No usar un volumen para datos de base de datos.
# sudo docker run -d --name ephemeral_db postgres:13
# Si detienes y eliminas este contenedor, todos los datos de la DB se perderán.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Virtualización y Contenedores',
    'topic': 'Infraestructura como Código',
    'subtopic': 'Ansible avanzado',
    'definition': r'''
Ansible es una herramienta de automatización de TI de código abierto que te permite configurar sistemas, desplegar software y orquestar tareas avanzadas como actualizaciones continuas o la provisión de infraestructura. Si en el nivel junior lo viste como una forma de ejecutar comandos en múltiples máquinas, en el nivel avanzado te darás cuenta de su poder para gestionar configuraciones complejas y flujos de trabajo completos.

¿Te estás preguntando por qué esto importa? Pensemos por un momento en la necesidad de configurar cientos de servidores idénticos, desplegar una aplicación en múltiples entornos (desarrollo, staging, producción), o realizar un mantenimiento sin downtime. Hacerlo manualmente sería propenso a errores, lento y tedioso. Ansible avanzado te permite definir el estado deseado de tu infraestructura de manera declarativa (Infrastructure as Code), asegurando que siempre esté en el mismo estado, de forma reproducible y automatizada. Esto es crucial para la eficiencia, la fiabilidad y la consistencia en cualquier entorno de TI.

Las características de Ansible avanzado incluyen:
* **Roles:** Una forma estructurada de organizar playbooks, variables, tareas, handlers y plantillas. Los roles promueven la reutilización y la modularidad de tu código Ansible, haciendo que los proyectos grandes sean más manejables.
* **Vault:** Una característica de Ansible para cifrar datos sensibles (como contraseñas, claves API, claves SSH) dentro de tus playbooks o archivos de variables. Esto es fundamental para la seguridad, ya que te permite almacenar código y datos sensibles en un repositorio de control de versiones de forma segura.
* **Módulos avanzados:** Utilizar módulos específicos para tareas complejas como la gestión de servicios en la nube (AWS, Azure, GCP), la interacción con APIs, la gestión de bases de datos, o la configuración de redes.
* **Delegación y Control de Flujo:** Controlar dónde se ejecutan las tareas (en el host local o en un host remoto específico) y cómo se manejan los errores o las condiciones.
* **Inventario dinámico:** Generar el inventario de hosts sobre la marcha, a partir de fuentes externas como la nube (AWS EC2, OpenStack), CMDBs o scripts personalizados. Esto es vital en entornos dinámicos donde los servidores se crean y destruyen constantemente.
* **Handlers:** Tareas especiales que solo se ejecutan cuando son "notificadas" por otras tareas que han realizado un cambio. Esto es útil para reiniciar servicios solo cuando su configuración ha cambiado.

Dominar Ansible avanzado te permite automatizar casi cualquier aspecto de la gestión de tu infraestructura, desde el despliegue de sistemas operativos hasta la configuración de aplicaciones complejas, ahorrándote incontables horas y reduciendo errores.
''',
    'code_example': r'''
# Ejemplo: Ansible avanzado - Usando Roles y Vault

# 1. Estructura de un rol de Ansible (ej. roles/webserver)
# roles/
# └── webserver/
#     ├── tasks/
#     │   └── main.yml  # Tareas del rol (instalar nginx, copiar config)
#     ├── handlers/
#     │   └── main.yml  # Handlers (reiniciar nginx)
#     ├── templates/
#     │   └── nginx.conf.j2 # Plantilla de configuración
#     └── vars/
#         └── main.yml  # Variables por defecto del rol (ej. http_port: 80)

# Contenido de roles/webserver/tasks/main.yml:
# - name: Instalar Nginx
#   ansible.builtin.apt:
#     name: nginx
#     state: present

# - name: Copiar plantilla de configuración de Nginx
#   ansible.builtin.template:
#     src: nginx.conf.j2
#     dest: /etc/nginx/nginx.conf
#   notify: Restart Nginx

# Contenido de roles/webserver/handlers/main.yml:
# - name: Restart Nginx
#   ansible.builtin.service:
#     name: nginx
#     state: restarted

# 2. Archivo de playbook que usa el rol (ej. deploy_web.yml)
# ---
# - name: Desplegar servidor web
#   hosts: web_servers
#   become: yes # Ejecutar tareas con privilegios de root
#   roles:
#     - webserver

# 3. Archivo de inventario (ej. inventory.ini)
# [web_servers]
# web01.example.com
# web02.example.com

# 4. Usando Ansible Vault para cifrar variables sensibles
# Crear un archivo de variables cifrado (ej. vars/secrets.yml)
# ansible-vault create vars/secrets.yml
# Contenido (se abrirá un editor):
# db_password: "MySuperSecretDbPassword123"

# En tu playbook o rol, puedes usar estas variables cifradas:
# - name: Configurar contraseña de la base de datos
#   ansible.builtin.lineinfile:
#     path: /etc/app/config.ini
#     regexp: '^db_password='
#     line: "db_password={{ db_password }}"
# # Para ejecutar este playbook, debes proporcionar la contraseña del vault:
# # ansible-playbook -i inventory.ini deploy_web.yml --ask-vault-pass

# Ejemplo incorrecto: Copiar contraseñas directamente en un playbook sin cifrar.
# - name: Set database password
#   ansible.builtin.lineinfile:
#     path: /etc/app/config.ini
#     regexp: '^db_password='
#     line: "db_password=PLAIN_TEXT_PASSWORD" # ¡NUNCA HAGAS ESTO!
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Virtualización y Contenedores',
    'topic': 'Infraestructura como Código',
    'subtopic': 'Terraform básico',
    'definition': r'''
Terraform es una herramienta de Infraestructura como Código (IaC) de HashiCorp que te permite definir, aprovisionar y gestionar infraestructura de TI (servidores, redes, bases de datos, etc.) en la nube o on-premise, utilizando un lenguaje de configuración declarativo. Es como tener un "plano" de tu infraestructura que puedes replicar y versionar.

¿Te estás preguntando por qué esto importa? Pensemos por un momento en la necesidad de desplegar una aplicación compleja con múltiples componentes (máquinas virtuales, balanceadores de carga, redes, bases de datos) en la nube. Configurar todo esto manualmente a través de una interfaz web es lento, propenso a errores y no reproducible. Terraform te permite describir tu infraestructura en archivos de texto, lo que significa que puedes versionarla, revisarla, y automatizar su despliegue y gestión. Esto es fundamental para la agilidad, la consistencia, la gobernanza y la colaboración en entornos de nube modernos.

Las características clave de Terraform incluyen:
* **Lenguaje de Configuración de HashiCorp (HCL):** Un lenguaje declarativo legible por humanos para describir tu infraestructura.
* **Proveedores (Providers):** Terraform interactúa con diferentes plataformas de nube (AWS, Azure, Google Cloud, OpenStack, VMware, etc.) y servicios a través de "proveedores". Cada proveedor sabe cómo hablar con la API de su plataforma para crear y gestionar recursos.
* **Recursos (Resources):** Representan los componentes de tu infraestructura (ej. `aws_instance` para una VM de AWS, `google_compute_network` para una red VPC).
* **Fuentes de datos (Data Sources):** Permiten a Terraform obtener información de recursos existentes que no gestiona directamente (ej. el ID de una imagen AMI de AWS).
* **Estado (State):** Terraform mantiene un archivo de estado (`.tfstate`) que mapea los recursos de tu configuración a los recursos reales en tu infraestructura. Este archivo es crucial para que Terraform sepa qué recursos existen y cómo gestionarlos.
* **Planificación de ejecución (`terraform plan`):** Antes de aplicar cambios, Terraform te muestra un plan detallado de lo que va a hacer (crear, modificar, destruir). Esto te permite revisar los cambios antes de que se ejecuten.
* **Aplicación (`terraform apply`):** Ejecuta los cambios definidos en el plan, aprovisionando o modificando tu infraestructura.
* **Destrucción (`terraform destroy`):** Elimina todos los recursos gestionados por una configuración de Terraform.

Terraform es una herramienta esencial en el panorama del DevOps y la computación en la nube, permitiéndote gestionar tu infraestructura de forma eficiente, reproducible y segura.
''',
    'code_example': r'''
# Ejemplo: Terraform básico - Desplegar una instancia EC2 en AWS

# 1. Archivo main.tf: Define el proveedor y los recursos
# provider "aws" {
#   region = "us-east-1" # Región de AWS
# }

# resource "aws_instance" "web_server" {
#   ami           = "ami-053b0d53c279acc90" # ID de una AMI de Ubuntu Server 22.04 LTS (puede variar por región)
#   instance_type = "t2.micro" # Tipo de instancia
#   tags = {
#     Name = "WebServerFromTerraform"
#   }
# }

# output "public_ip" {
#   value = aws_instance.web_server.public_ip
#   description = "La dirección IP pública del servidor web."
# }

# 2. Pasos para usar Terraform:

# Inicializar el directorio de trabajo de Terraform (descarga el proveedor AWS)
# terraform init

# Generar un plan de ejecución (muestra lo que Terraform hará)
# terraform plan

# Aplicar los cambios (crea la instancia EC2)
# terraform apply
# Te pedirá confirmación, escribe 'yes'.

# Después de la aplicación, Terraform mostrará la IP pública del servidor (definido en 'output').

# Destruir la infraestructura creada por Terraform
# terraform destroy
# Te pedirá confirmación, escribe 'yes'.

# Ejemplo incorrecto: No inicializar Terraform o aplicar cambios sin revisar el plan.
# terraform apply # Sin un 'terraform init' previo, fallará.
# terraform apply --auto-approve # Evita la confirmación manual, peligroso en producción sin revisión.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Virtualización y Contenedores',
    'topic': 'Infraestructura como Código',
    'subtopic': 'Packer',
    'definition': r'''
Packer es una herramienta de código abierto de HashiCorp que te permite crear imágenes de máquinas virtuales (VMs) o contenedores personalizadas y automatizadas para múltiples plataformas (AWS, VMware, VirtualBox, Docker, etc.) a partir de una única fuente de configuración. Es como tener una "receta" para construir tus plantillas de servidores de forma reproducible.

¿Te estás preguntando por qué esto importa? Pensemos por un momento en la necesidad de tener imágenes de servidores preconfiguradas con tu sistema operativo, parches de seguridad, software base y agentes de monitoreo ya instalados. Sin Packer, tendrías que crear y configurar cada imagen manualmente para cada plataforma, lo cual es propenso a errores, consume mucho tiempo y dificulta la consistencia. Packer automatiza este proceso, asegurando que tus imágenes sean idénticas y actualizadas en todos los entornos, lo cual es fundamental para la reproducibilidad, la velocidad de despliegue y la seguridad.

Packer funciona leyendo un archivo de plantilla (en HCL o JSON) que describe:
* **Builders:** Definiciones de la plataforma en la que se construirá la imagen (ej. `amazon-ebs` para AWS, `virtualbox-iso` para VirtualBox, `docker` para imágenes de Docker).
* **Provisioners:** Scripts o comandos que se ejecutarán *dentro* de la máquina virtual o contenedor para instalar software, aplicar configuraciones, copiar archivos, etc. (ej. `shell`, `ansible`, `chef`, `puppet`).
* **Post-processors:** Pasos opcionales que se ejecutan después de que la imagen base ha sido creada (ej. subir la imagen a un repositorio de artefactos, comprimirla).

La filosofía de "immutable infrastructure" (infraestructura inmutable) es central para Packer: en lugar de configurar servidores ya en ejecución, creas nuevas imágenes con todas las configuraciones y software preinstalados, y luego despliegas instancias a partir de esas imágenes. Esto simplifica la gestión de la configuración y facilita las reversiones. Packer es un componente clave en un pipeline de CI/CD para infraestructura.
''',
    'code_example': r'''
# Ejemplo: Plantilla de Packer para construir una imagen de AWS AMI con Nginx

# 1. Archivo nginx-ami.pkr.hcl:
# packer {
#   required_plugins {
#     amazon = {
#       source  = "github.com/hashicorp/amazon"
#       version = "~> 1"
#     }
#   }
# }

# source "amazon-ebs" "nginx_base" {
#   region        = "us-east-1"
#   instance_type = "t2.micro"
#   ami_name      = "packer-nginx-ami-{{timestamp}}"
#   source_ami    = "ami-053b0d53c279acc90" # Ubuntu Server 22.04 LTS (ejemplo)
#   ssh_username  = "ubuntu"
# }

# build {
#   name    = "nginx-server"
#   source  = "source.amazon-ebs.nginx_base"
#   provisioner "shell" {
#     inline = [
#       "sudo apt update",
#       "sudo apt install -y nginx",
#       "sudo systemctl enable nginx",
#       "sudo systemctl start nginx",
#       "echo 'Hello from Packer Nginx AMI!' | sudo tee /var/www/html/index.html"
#     ]
#   }

#   # Puedes añadir un post-processor, por ejemplo, para subir a un registro de AMI
#   # post-processor "manifest" {
#   #   output = "manifest.json"
#   # }
# }

# 2. Pasos para usar Packer:

# Inicializar los plugins de Packer
# packer init nginx-ami.pkr.hcl

# Validar la plantilla
# packer validate nginx-ami.pkr.hcl

# Construir la imagen
# packer build nginx-ami.pkr.hcl
# Esto lanzará una instancia temporal en AWS, ejecutará los provisioners, creará una AMI
# a partir de ella, y luego terminará la instancia temporal.

# Ejemplo incorrecto: No limpiar credenciales o datos sensibles después de la provisión.
# Si tus provisioners descargan secretos o dejan archivos temporales con información sensible,
# asegúrate de eliminarlos antes de que la imagen sea finalizada.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Virtualización y Contenedores',
    'topic': 'Infraestructura como Código',
    'subtopic': 'Pruebas de infraestructura',
    'definition': r'''
Las pruebas de infraestructura son el proceso de verificar que tu infraestructura como código (IaC) y la infraestructura resultante cumplen con los requisitos deseados y funcionan correctamente. Va más allá de simplemente verificar que un comando se ejecutó sin errores; se trata de validar el estado final del sistema.

¿Te estás preguntando por qué esto importa? Pensemos por un momento en un sistema automatizado que despliega servidores con ciertas configuraciones. ¿Cómo sabes que los puertos correctos están abiertos, que el software se instaló correctamente y que los servicios están corriendo como deberían? Sin pruebas de infraestructura, estarías confiando en la suerte, lo cual es inaceptable para entornos de producción. Las pruebas de infraestructura te dan la confianza de que tu IaC funciona, que tu infraestructura es consistente y que los cambios no introducen regresiones, lo cual es fundamental para la fiabilidad y la seguridad.

Las pruebas de infraestructura se pueden clasificar en diferentes niveles:
* **Pruebas de unidad (Unit Tests):** Verifican partes pequeñas de tu código IaC, como la sintaxis de un bloque de Terraform o de un playbook de Ansible.
* **Pruebas de integración (Integration Tests):** Despliegan una pequeña parte de tu infraestructura (ej. una VM, una red) y verifican que los componentes interactúan correctamente.
* **Pruebas de regresión:** Aseguran que los cambios o actualizaciones en tu IaC no rompan funcionalidades existentes.
* **Pruebas de extremo a extremo (End-to-End Tests):** Despliegan toda o una parte significativa de tu infraestructura y validan que la aplicación completa funciona como se espera.

Herramientas para pruebas de infraestructura:
* **Test Kitchen (Chef/Puppet):** Un framework para probar recetas de Chef o módulos de Puppet en entornos efímeros.
* **InSpec (Chef/Compliance):** Un marco de pruebas de cumplimiento y auditoría que te permite escribir pruebas legibles por humanos para verificar el estado de tus sistemas.
* **Serverspec / RSpec (Ruby):** Un framework para escribir pruebas de infraestructura que verifican la configuración y el estado del sistema.
* **Terratest (Go):** Una librería de Go de HashiCorp para escribir pruebas automatizadas para la infraestructura de Terraform y otros componentes de la nube.
* **Pester (PowerShell):** Un framework de pruebas unitarias y de integración para PowerShell, útil para la automatización en entornos Windows.

Integrar las pruebas de infraestructura en tu pipeline de CI/CD es una práctica esencial para garantizar la calidad y la fiabilidad de tu infraestructura automatizada.
''',
    'code_example': r'''
# Ejemplo: Pruebas de infraestructura con InSpec (conceptual)

# 1. Definir un perfil de InSpec (ej. controls/webserver/controls/nginx.rb)
# control 'nginx-is-installed' do
#   impact 1.0
#   title 'Nginx debe estar instalado'
#   desc 'Verifica que el paquete nginx esté instalado y activo.'
#   describe package('nginx') do
#     it { should be_installed }
#   end
#   describe service('nginx') do
#     it { should be_enabled }
#     it { should be_running }
#   end
# end

# control 'nginx-port-80' do
#   impact 0.7
#   title 'Nginx debe escuchar en el puerto 80'
#   desc 'Verifica que Nginx esté escuchando conexiones en el puerto TCP 80.'
#   describe port(80) do
#     it { should be_listening }
#     its('protocols') { should include('tcp') }
#   end
# end

# control 'nginx-welcome-page' do
#   impact 0.5
#   title 'La página de bienvenida de Nginx debe estar presente'
#   desc 'Verifica que la página index.html por defecto de Nginx sea accesible y contenga el texto esperado.'
#   describe http('http://localhost/') do
#     its('status') { should cmp 200 }
#     its('body') { should include('Welcome to nginx!') }
#   end
# end

# 2. Ejecutar las pruebas de InSpec contra un servidor remoto (o local)
# Asumiendo que InSpec está instalado y el perfil está en ./controls/webserver
# sudo inspec exec ./controls/webserver -t ssh://user@ip_del_servidor_web --password 'your_ssh_password' --sudo
# O si el servidor web está corriendo localmente después de un despliegue de Packer/Terraform:
# sudo inspec exec ./controls/webserver

# Ejemplo incorrecto: Desplegar infraestructura y asumir que funciona sin validación.
# Esto es como escribir código sin compilarlo ni probarlo, lo que lleva a errores en producción.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Virtualización y Contenedores',
    'topic': 'Infraestructura como Código',
    'subtopic': 'Ansible avanzado',
    'definition': r'''
Ansible es una herramienta de automatización de TI de código abierto que te permite configurar sistemas, desplegar software y orquestar tareas avanzadas como actualizaciones continuas o la provisión de infraestructura. Si en el nivel junior lo viste como una forma de ejecutar comandos en múltiples máquinas, en el nivel avanzado te darás cuenta de su poder para gestionar configuraciones complejas y flujos de trabajo completos.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en la necesidad de configurar cientos de servidores idénticos, desplegar una aplicación en múltiples entornos (desarrollo, staging, producción), o realizar un mantenimiento sin downtime. Hacerlo manualmente sería propenso a errores, lento y tedioso. Ansible avanzado te permite definir el estado deseado de tu infraestructura de manera declarativa (Infrastructure as Code), asegurando que siempre esté en el mismo estado, de forma reproducible y automatizada. Esto es crucial para la eficiencia, la fiabilidad y la consistencia en cualquier entorno de TI.

Las características de Ansible avanzado incluyen:
* **Roles:** Una forma estructurada de organizar playbooks, variables, tareas, handlers y plantillas. Los roles promueven la reutilización y la modularidad de tu código Ansible, haciendo que los proyectos grandes sean más manejables.
* **Vault:** Una característica de Ansible para cifrar datos sensibles (como contraseñas, claves API, claves SSH) dentro de tus playbooks o archivos de variables. Esto es fundamental para la seguridad, ya que te permite almacenar código y datos sensibles en un repositorio de control de versiones de forma segura.
* **Módulos avanzados:** Utilizar módulos específicos para tareas complejas como la gestión de servicios en la nube (AWS, Azure, GCP), la interacción con APIs, la gestión de bases de datos, o la configuración de redes.
* **Delegación y Control de Flujo:** Controlar dónde se ejecutan las tareas (en el host local o en un host remoto específico) y cómo se manejan los errores o las condiciones.
* **Inventario dinámico:** Generar el inventario de hosts sobre la marcha, a partir de fuentes externas como la nube (AWS EC2, OpenStack), CMDBs o scripts personalizados. Esto es vital en entornos dinámicos donde los servidores se crean y destruyen constantemente.
* **Handlers:** Tareas especiales que solo se ejecutan cuando son "notificadas" por otras tareas que han realizado un cambio. Esto es útil para reiniciar servicios solo cuando su configuración ha cambiado.

Dominar Ansible avanzado te permite automatizar casi cualquier aspecto de la gestión de tu infraestructura, desde el despliegue de sistemas operativos hasta la configuración de aplicaciones complejas, ahorrándote incontables horas y reduciendo errores.
''',
    'code_example': r'''
# Ejemplo: Ansible avanzado - Usando Roles y Vault

# 1. Estructura de un rol de Ansible (ej. roles/webserver)
# roles/
# └── webserver/
#     ├── tasks/
#     │   └── main.yml  # Tareas del rol (instalar nginx, copiar config)
#     ├── handlers/
#     │   └── main.yml  # Handlers (reiniciar nginx)
#     ├── templates/
#     │   └── nginx.conf.j2 # Plantilla de configuración
#     └── vars/
#         └── main.yml  # Variables por defecto del rol (ej. http_port: 80)

# Contenido de roles/webserver/tasks/main.yml:
# - name: Instalar Nginx
#   ansible.builtin.apt:
#     name: nginx
#     state: present

# - name: Copiar plantilla de configuración de Nginx
#   ansible.builtin.template:
#     src: nginx.conf.j2
#     dest: /etc/nginx/nginx.conf
#   notify: Restart Nginx

# Contenido de roles/webserver/handlers/main.yml:
# - name: Restart Nginx
#   ansible.builtin.service:
#     name: nginx
#     state: restarted

# 2. Archivo de playbook que usa el rol (ej. deploy_web.yml)
# ---
# - name: Desplegar servidor web
#   hosts: web_servers
#   become: yes # Ejecutar tareas con privilegios de root
#   roles:
#     - webserver

# 3. Archivo de inventario (ej. inventory.ini)
# [web_servers]
# web01.example.com
# web02.example.com

# 4. Usando Ansible Vault para cifrar variables sensibles
# Crear un archivo de variables cifrado (ej. vars/secrets.yml)
# ansible-vault create vars/secrets.yml
# Contenido (se abrirá un editor):
# db_password: "MySuperSecretDbPassword123"

# En tu playbook o rol, puedes usar estas variables cifradas:
# - name: Configurar contraseña de la base de datos
#   ansible.builtin.lineinfile:
#     path: /etc/app/config.ini
#     regexp: '^db_password='
#     line: "db_password={{ db_password }}"
# # Para ejecutar este playbook, debes proporcionar la contraseña del vault:
# # ansible-playbook -i inventory.ini deploy_web.yml --ask-vault-pass

# Ejemplo incorrecto: Copiar contraseñas directamente en un playbook sin cifrar.
# - name: Set database password
#   ansible.builtin.lineinfile:
#     path: /etc/app/config.ini
#     regexp: '^db_password='
#     line: "db_password=PLAIN_TEXT_PASSWORD" # ¡NUNCA HAGAS ESTO!
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Virtualización y Contenedores',
    'topic': 'Infraestructura como Código',
    'subtopic': 'Terraform básico',
    'definition': r'''
Terraform es una herramienta de Infraestructura como Código (IaC) de HashiCorp que te permite definir, aprovisionar y gestionar infraestructura de TI (servidores, redes, bases de datos, etc.) en la nube o on-premise, utilizando un lenguaje de configuración declarativo. Es como tener un "plano" de tu infraestructura que puedes replicar y versionar.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en la necesidad de desplegar una aplicación compleja con múltiples componentes (máquinas virtuales, balanceadores de carga, redes, bases de datos) en la nube. Configurar todo esto manualmente a través de una interfaz web es lento, propenso a errores y no reproducible. Terraform te permite describir tu infraestructura en archivos de texto, lo que significa que puedes versionarla, revisarla, y automatizar su despliegue y gestión. Esto es fundamental para la agilidad, la consistencia, la gobernanza y la colaboración en entornos de nube modernos.

Las características clave de Terraform incluyen:
* **Lenguaje de Configuración de HashiCorp (HCL):** Un lenguaje declarativo legible por humanos para describir tu infraestructura.
* **Proveedores (Providers):** Terraform interactúa con diferentes plataformas de nube (AWS, Azure, Google Cloud, OpenStack, VMware, etc.) y servicios a través de "proveedores". Cada proveedor sabe cómo hablar con la API de su plataforma para crear y gestionar recursos.
* **Recursos (Resources):** Representan los componentes de tu infraestructura (ej. `aws_instance` para una VM de AWS, `google_compute_network` para una red VPC).
* **Fuentes de datos (Data Sources):** Permiten a Terraform obtener información de recursos existentes que no gestiona directamente (ej. el ID de una imagen AMI de AWS).
* **Estado (State):** Terraform mantiene un archivo de estado (`.tfstate`) que mapea los recursos de tu configuración a los recursos reales en tu infraestructura. Este archivo es crucial para que Terraform sepa qué recursos existen y cómo gestionarlos.
* **Planificación de ejecución (`terraform plan`):** Antes de aplicar cambios, Terraform te muestra un plan detallado de lo que va a hacer (crear, modificar, destruir). Esto te permite revisar los cambios antes de que se ejecuten.
* **Aplicación (`terraform apply`):** Ejecuta los cambios definidos en el plan, aprovisionando o modificando tu infraestructura.
* **Destrucción (`terraform destroy`):** Elimina todos los recursos gestionados por una configuración de Terraform.

Terraform es una herramienta esencial en el panorama del DevOps y la computación en la nube, permitiéndote gestionar tu infraestructura de forma eficiente, reproducible y segura.
''',
    'code_example': r'''
# Ejemplo: Terraform básico - Desplegar una instancia EC2 en AWS

# 1. Archivo main.tf: Define el proveedor y los recursos
# provider "aws" {
#   region = "us-east-1" # Región de AWS
# }

# resource "aws_instance" "web_server" {
#   ami           = "ami-053b0d53c279acc90" # ID de una AMI de Ubuntu Server 22.04 LTS (puede variar por región)
#   instance_type = "t2.micro" # Tipo de instancia
#   tags = {
#     Name = "WebServerFromTerraform"
#   }
# }

# output "public_ip" {
#   value = aws_instance.web_server.public_ip
#   description = "La dirección IP pública del servidor web."
# }

# 2. Pasos para usar Terraform:

# Inicializar el directorio de trabajo de Terraform (descarga el proveedor AWS)
# terraform init

# Generar un plan de ejecución (muestra lo que Terraform hará)
# terraform plan

# Aplicar los cambios (crea la instancia EC2)
# terraform apply
# Te pedirá confirmación, escribe 'yes'.

# Después de la aplicación, Terraform mostrará la IP pública del servidor (definido en 'output').

# Destruir la infraestructura creada por Terraform
# terraform destroy
# Te pedirá confirmación, escribe 'yes'.

# Ejemplo incorrecto: No inicializar Terraform o aplicar cambios sin revisar el plan.
# terraform apply # Sin un 'terraform init' previo, fallará.
# terraform apply --auto-approve # Evita la confirmación manual, peligroso en producción sin revisión.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Virtualización y Contenedores',
    'topic': 'Infraestructura como Código',
    'subtopic': 'Packer',
    'definition': r'''
Packer es una herramienta de código abierto de HashiCorp que te permite crear imágenes de máquinas virtuales (VMs) o contenedores personalizadas y automatizadas para múltiples plataformas (AWS, VMware, VirtualBox, Docker, etc.) a partir de una única fuente de configuración. Es como tener una "receta" para construir tus plantillas de servidores de forma reproducible.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en la necesidad de tener imágenes de servidores preconfiguradas con tu sistema operativo, parches de seguridad, software base y agentes de monitoreo ya instalados. Sin Packer, tendrías que crear y configurar cada imagen manualmente para cada plataforma, lo cual es propenso a errores, consume mucho tiempo y dificulta la consistencia. Packer automatiza este proceso, asegurando que tus imágenes sean idénticas y actualizadas en todos los entornos, lo cual es fundamental para la reproducibilidad, la velocidad de despliegue y la seguridad.

Packer funciona leyendo un archivo de plantilla (en HCL o JSON) que describe:
* **Builders:** Definiciones de la plataforma en la que se construirá la imagen (ej. `amazon-ebs` para AWS, `virtualbox-iso` para VirtualBox, `docker` para imágenes de Docker).
* **Provisioners:** Scripts o comandos que se ejecutarán *dentro* de la máquina virtual o contenedor para instalar software, aplicar configuraciones, copiar archivos, etc. (ej. `shell`, `ansible`, `chef`, `puppet`).
* **Post-processors:** Pasos opcionales que se ejecutan después de que la imagen base ha sido creada (ej. subir la imagen a un repositorio de artefactos, comprimirla).

La filosofía de "immutable infrastructure" (infraestructura inmutable) es central para Packer: en lugar de configurar servidores ya en ejecución, creas nuevas imágenes con todas las configuraciones y software preinstalados, y luego despliegas instancias a partir de esas imágenes. Esto simplifica la gestión de la configuración y facilita las reversiones. Packer es un componente clave en un pipeline de CI/CD para infraestructura.
''',
    'code_example': r'''
# Ejemplo: Plantilla de Packer para construir una imagen de AWS AMI con Nginx

# 1. Archivo nginx-ami.pkr.hcl:
# packer {
#   required_plugins {
#     amazon = {
#       source  = "github.com/hashicorp/amazon"
#       version = "~> 1"
#     }
#   }
# }

# source "amazon-ebs" "nginx_base" {
#   region        = "us-east-1"
#   instance_type = "t2.micro"
#   ami_name      = "packer-nginx-ami-{{timestamp}}"
#   source_ami    = "ami-053b0d53c279acc90" # Ubuntu Server 22.04 LTS (ejemplo)
#   ssh_username  = "ubuntu"
# }

# build {
#   name    = "nginx-server"
#   source  = "source.amazon-ebs.nginx_base"
#   provisioner "shell" {
#     inline = [
#       "sudo apt update",
#       "sudo apt install -y nginx",
#       "sudo systemctl enable nginx",
#       "sudo systemctl start nginx",
#       "echo 'Hello from Packer Nginx AMI!' | sudo tee /var/www/html/index.html"
#     ]
#   }

#   # Puedes añadir un post-processor, por ejemplo, para subir a un registro de AMI
#   # post-processor "manifest" {
#   #   output = "manifest.json"
#   # }
# }

# 2. Pasos para usar Packer:

# Inicializar los plugins de Packer
# packer init nginx-ami.pkr.hcl

# Validar la plantilla
# packer validate nginx-ami.pkr.hcl

# Construir la imagen
# packer build nginx-ami.pkr.hcl
# Esto lanzará una instancia temporal en AWS, ejecutará los provisioners, creará una AMI
# a partir de ella, y luego terminará la instancia temporal.

# Ejemplo incorrecto: No limpiar credenciales o datos sensibles después de la provisión.
# Si tus provisioners descargan secretos o dejan archivos temporales con información sensible,
# asegúrate de eliminarlos antes de que la imagen sea finalizada.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Virtualización y Contenedores',
    'topic': 'Infraestructura como Código',
    'subtopic': 'Pruebas de infraestructura',
    'definition': r'''
Las pruebas de infraestructura son el proceso de verificar que tu infraestructura como código (IaC) y la infraestructura resultante cumplen con los requisitos deseados y funcionan correctamente. Va más allá de simplemente verificar que un comando se ejecutó sin errores; se trata de validar el estado final del sistema.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en un sistema automatizado que despliega servidores con ciertas configuraciones. ¿Cómo sabes que los puertos correctos están abiertos, que el software se instaló correctamente y que los servicios están corriendo como deberían? Sin pruebas de infraestructura, estarías confiando en la suerte, lo cual es inaceptable para entornos de producción. Las pruebas de infraestructura te dan la confianza de que tu IaC funciona, que tu infraestructura es consistente y que los cambios no introducen regresiones, lo cual es fundamental para la fiabilidad y la seguridad.

Las pruebas de infraestructura se pueden clasificar en diferentes niveles:
* **Pruebas de unidad (Unit Tests):** Verifican partes pequeñas de tu código IaC, como la sintaxis de un bloque de Terraform o de un playbook de Ansible.
* **Pruebas de integración (Integration Tests):** Despliegan una pequeña parte de tu infraestructura (ej. una VM, una red) y verifican que los componentes interactúan correctamente.
* **Pruebas de regresión:** Aseguran que los cambios o actualizaciones en tu IaC no rompan funcionalidades existentes.
* **Pruebas de extremo a extremo (End-to-End Tests):** Despliegan toda o una parte significativa de tu infraestructura y validan que la aplicación completa funciona como se espera.

Herramientas para pruebas de infraestructura:
* **Test Kitchen (Chef/Puppet):** Un framework para probar recetas de Chef o módulos de Puppet en entornos efímeros.
* **InSpec (Chef/Compliance):** Un marco de pruebas de cumplimiento y auditoría que te permite escribir pruebas legibles por humanos para verificar el estado de tus sistemas.
* **Serverspec / RSpec (Ruby):** Un framework para escribir pruebas de infraestructura que verifican la configuración y el estado del sistema.
* **Terratest (Go):** Una librería de Go de HashiCorp para escribir pruebas automatizadas para la infraestructura de Terraform y otros componentes de la nube.
* **Pester (PowerShell):** Un framework de pruebas unitarias y de integración para PowerShell, útil para la automatización en entornos Windows.

Integrar las pruebas de infraestructura en tu pipeline de CI/CD es una práctica esencial para garantizar la calidad y la fiabilidad de tu infraestructura automatizada.
''',
    'code_example': r'''
# Ejemplo: Pruebas de infraestructura con InSpec (conceptual)

# 1. Definir un perfil de InSpec (ej. controls/webserver/controls/nginx.rb)
# control 'nginx-is-installed' do
#   impact 1.0
#   title 'Nginx debe estar instalado'
#   desc 'Verifica que el paquete nginx esté instalado y activo.'
#   describe package('nginx') do
#     it { should be_installed }
#   end
#   describe service('nginx') do
#     it { should be_enabled }
#     it { should be_running }
#   end
# end

# control 'nginx-port-80' do
#   impact 0.7
#   title 'Nginx debe escuchar en el puerto 80'
#   desc 'Verifica que Nginx esté escuchando conexiones en el puerto TCP 80.'
#   describe port(80) do
#     it { should be_listening }
#     its('protocols') { should include('tcp') }
#   end
# end

# control 'nginx-welcome-page' do
#   impact 0.5
#   title 'La página de bienvenida de Nginx debe estar presente'
#   desc 'Verifica que la página index.html por defecto de Nginx sea accesible y contenga el texto esperado.'
#   describe http('http://localhost/') do
#     its('status') { should cmp 200 }
#     its('body') { should include('Welcome to nginx!') }
#   end
# end

# 2. Ejecutar las pruebas de InSpec contra un servidor remoto (o local)
# Asumiendo que InSpec está instalado y el perfil está en ./controls/webserver
# sudo inspec exec ./controls/webserver -t ssh://user@ip_del_servidor_web --password 'your_ssh_password' --sudo
# O si el servidor web está corriendo localmente después de un despliegue de Packer/Terraform:
# sudo inspec exec ./controls/webserver

# Ejemplo incorrecto: Desplegar infraestructura y asumir que funciona sin validación.
# Esto es como escribir código sin compilarlo ni probarlo, lo que lleva a errores en producción.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Virtualización y Contenedores',
    'topic': 'Plataformas de Nube Básica',
    'subtopic': 'AWS EC2 básico',
    'definition': r'''
AWS EC2 (Elastic Compute Cloud) es el servicio de Amazon Web Services que te permite lanzar y gestionar máquinas virtuales (instancias) en la nube. Es la base para la mayoría de las aplicaciones y servicios que se ejecutan en AWS.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en la necesidad de desplegar un servidor web, una base de datos o cualquier aplicación sin tener que comprar y mantener hardware físico. AWS EC2 te da la flexibilidad de crear servidores bajo demanda, escalarlos rápidamente y pagar solo por lo que usas. Es el equivalente virtual de un servidor físico, pero con la agilidad y escalabilidad de la nube, lo cual es fundamental para el desarrollo y despliegue de aplicaciones modernas.

En su nivel básico, AWS EC2 te permite:
* **Elegir la instancia:** Seleccionar el tipo de instancia adecuado según tus necesidades de CPU, RAM, almacenamiento y red. Existen diferentes familias de instancias (ej. `t2/t3` para uso general, `m5` para rendimiento equilibrado, `c5` para cómputo intensivo, `r5` para memoria intensiva).
* **Seleccionar una AMI (Amazon Machine Image):** Una AMI es una plantilla que contiene el sistema operativo, el software base y la configuración inicial de tu instancia. Puedes usar AMIs públicas (ej. Ubuntu, Amazon Linux), de la comunidad o crear las tuyas propias.
* **Configurar almacenamiento (EBS - Elastic Block Store):** Asignar volúmenes de almacenamiento persistente a tus instancias. Puedes elegir diferentes tipos de volúmenes (ej. SSD de propósito general, SSD de IOPS provisionadas, HDD) según tus requisitos de rendimiento.
* **Configurar la red (VPC, Security Groups):** Lanzar instancias dentro de una Virtual Private Cloud (VPC) para aislar tu red en la nube. Los Security Groups actúan como firewalls a nivel de instancia, controlando el tráfico de entrada y salida.
* **Par de claves (Key Pairs):** Utilizar pares de claves SSH para conectarte de forma segura a tus instancias Linux.
* **Elastic IPs (EIPs):** Asignar direcciones IP públicas estáticas a tus instancias, que persisten incluso si la instancia se detiene o se reinicia.

Dominar los conceptos básicos de AWS EC2 es el primer paso esencial para construir y desplegar aplicaciones en el ecosistema de Amazon Web Services.
''',
    'code_example': r'''
# Ejemplo: AWS EC2 básico - Lanzar una instancia EC2 (con la CLI de AWS)

# Asegúrate de tener la AWS CLI instalada y configurada con tus credenciales.
# aws configure

# 1. Listar AMIs disponibles (ej. para Ubuntu 22.04 LTS en us-east-1)
# Puedes encontrar AMIs en la consola de AWS o usando la CLI.
# aws ec2 describe-images --owners 099720109477 --filters "Name=name,Values=ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*" "Name=state,Values=available" --query "Images[0].ImageId" --output text
# ami-053b0d53c279acc90 (ejemplo de AMI ID)

# 2. Crear un par de claves SSH (si no tienes uno)
aws ec2 create-key-pair --key-name my-ec2-key --query 'KeyMaterial' --output text > my-ec2-key.pem
chmod 400 my-ec2-key.pem

# 3. Crear un grupo de seguridad (para permitir SSH)
aws ec2 create-security-group --group-name my-ec2-security-group --description "Allow SSH access"
# sg-0abcdef1234567890 (ejemplo de Security Group ID)

# 4. Añadir una regla para permitir SSH (puerto 22) desde tu IP pública
# Puedes obtener tu IP pública con: curl -s checkip.amazonaws.com
MY_IP=$(curl -s checkip.amazonaws.com)/32
aws ec2 authorize-security-group-ingress --group-name my-ec2-security-group --protocol tcp --port 22 --cidr "$MY_IP"

# 5. Lanzar una instancia EC2
aws ec2 run-instances \
    --image-id ami-053b0d53c279acc90 \
    --count 1 \
    --instance-type t2.micro \
    --key-name my-ec2-key \
    --security-groups my-ec2-security-group \
    --query 'Instances[0].InstanceId' \
    --output text

# i-0123456789abcdef0 (ejemplo de Instance ID)

# 6. Obtener la IP pública de la instancia recién lanzada
# Espera un minuto a que la instancia se inicialice
INSTANCE_ID="i-0123456789abcdef0" # Reemplaza con tu Instance ID
aws ec2 describe-instances --instance-ids "$INSTANCE_ID" --query 'Reservations[0].Instances[0].PublicIpAddress' --output text

# 7. Conectarse a la instancia (usando SSH)
# ssh -i my-ec2-key.pem ubuntu@<Public_IP_Address>

# 8. Terminar la instancia (cuando no la necesites)
# aws ec2 terminate-instances --instance-ids "$INSTANCE_ID"

# Ejemplo incorrecto: No especificar un grupo de seguridad o dejar el puerto 22 abierto a 0.0.0.0/0.
# Esto expone tu instancia a ataques de fuerza bruta y es una brecha de seguridad grave.
# aws ec2 authorize-security-group-ingress --group-name my-ec2-security-group --protocol tcp --port 22 --cidr 0.0.0.0/0
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Virtualización y Contenedores',
    'topic': 'Plataformas de Nube Básica',
    'subtopic': 'Google Cloud básico',
    'definition': r'''
Google Cloud Platform (GCP) es el conjunto de servicios de computación en la nube ofrecidos por Google. En este nivel básico, nos enfocaremos en sus servicios de cómputo, redes y almacenamiento más fundamentales, que te permiten desplegar tus aplicaciones y servicios.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en la necesidad de tener una infraestructura global, escalable y con la misma tecnología que impulsa Google. GCP te ofrece una amplia gama de servicios que puedes usar para construir desde sitios web simples hasta aplicaciones complejas de inteligencia artificial. Entender los conceptos básicos de GCP te abre la puerta a un ecosistema de nube potente y en crecimiento, lo cual es fundamental para cualquier profesional de tecnología que busque desplegar soluciones escalables.

Los componentes básicos de Google Cloud que debes conocer son:
* **Compute Engine:** El servicio de máquinas virtuales de GCP, similar a AWS EC2. Te permite crear y ejecutar VMs con una variedad de sistemas operativos y configuraciones de hardware. Puedes elegir entre diferentes tipos de máquinas (ej. `e2-standard`, `n2-standard`, `c2-standard`) según tus necesidades de CPU, RAM y rendimiento.
* **Virtual Private Cloud (VPC):** El servicio de red que te permite crear redes privadas, subredes, reglas de firewall y controlar el enrutamiento del tráfico para tus recursos en la nube. Las VPCs son globales, lo que significa que una red puede extenderse a través de múltiples regiones de Google Cloud.
* **Cloud Storage:** Un servicio de almacenamiento de objetos escalable y duradero, ideal para almacenar datos no estructurados como imágenes, videos, copias de seguridad o datos para análisis. Es similar a AWS S3.
* **Cloud SQL:** Un servicio de base de datos relacional gestionado que soporta MySQL, PostgreSQL y SQL Server. GCP se encarga de las operaciones de la base de datos (parches, copias de seguridad, replicación).
* **Cloud DNS:** Un servicio global de DNS que te permite gestionar tus nombres de dominio y enrutar el tráfico a tus recursos de GCP.
* **Identity and Access Management (IAM):** El servicio para gestionar quién tiene acceso a qué recursos en tu proyecto de GCP y qué acciones puede realizar.

Dominar los conceptos básicos de Google Cloud te permite empezar a construir y desplegar tus soluciones en una de las plataformas de nube más avanzadas del mercado.
''',
    'code_example': r'''
# Ejemplo: Google Cloud básico - Lanzar una instancia de Compute Engine (con la CLI de gcloud)

# Asegúrate de tener la Google Cloud CLI (gcloud) instalada y configurada.
# gcloud auth login
# gcloud config set project <YOUR_PROJECT_ID>

# 1. Listar zonas disponibles para Compute Engine
# gcloud compute zones list

# 2. Listar imágenes disponibles (ej. Debian 11)
# gcloud compute images list --filter "family:debian-11"

# 3. Crear una instancia de Compute Engine
gcloud compute instances create my-gcp-instance \
    --zone=us-central1-a \
    --machine-type=e2-micro \
    --image-family=debian-11 \
    --image-project=debian-cloud \
    --tags=http-server,https-server \
    --boot-disk-size=10GB \
    --boot-disk-type=pd-standard

# 4. Crear una regla de firewall para permitir HTTP (si no usaste --tags=http-server)
# gcloud compute firewall-rules create allow-http-80 \
#     --network=default \
#     --action=ALLOW \
#     --rules=tcp:80 \
#     --source-ranges=0.0.0.0/0 \
#     --target-tags=http-server

# 5. Obtener la dirección IP externa de la instancia
gcloud compute instances describe my-gcp-instance \
    --zone=us-central1-a \
    --format='get(networkInterfaces[0].accessConfigs[0].natIP)'

# 6. Conectarse a la instancia (SSH)
# gcloud compute ssh my-gcp-instance --zone=us-central1-a

# 7. Detener la instancia
# gcloud compute instances stop my-gcp-instance --zone=us-central1-a

# 8. Eliminar la instancia
# gcloud compute instances delete my-gcp-instance --zone=us-central1-a

# Ejemplo incorrecto: No especificar una zona o no permitir el tráfico necesario con reglas de firewall.
# gcloud compute instances create my-instance --machine-type=e2-micro # Sin zona, fallará.
# gcloud compute instances create my-web-server --no-address # Lanzará una VM sin IP pública si no la habilitas.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Virtualización y Contenedores',
    'topic': 'Plataformas de Nube Básica',
    'subtopic': 'Azure básico',
    'definition': r'''
Azure es la plataforma de computación en la nube de Microsoft, que ofrece una amplia gama de servicios para construir, desplegar y gestionar aplicaciones y servicios a través de una red global de centros de datos. En su nivel básico, te permite desplegar máquinas virtuales, configurar redes y almacenar datos.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en la necesidad de integrar tu infraestructura con los servicios de Microsoft (ej. Active Directory, .NET) o en entornos que ya utilizan productos de Microsoft. Azure te proporciona una plataforma de nube completa con herramientas y servicios que se integran bien con el ecosistema de Microsoft, además de soportar tecnologías de código abierto. Entender Azure básico te permite aprovechar su escalabilidad, seguridad y fiabilidad para tus proyectos.

Los componentes básicos de Azure que debes conocer son:
* **Máquinas Virtuales (VMs):** El servicio de cómputo que te permite crear y ejecutar VMs con una variedad de sistemas operativos (Windows Server, varias distribuciones de Linux) y tamaños (ej. `B-series` para cargas de trabajo de desarrollo/prueba, `D-series` para cargas de trabajo de producción de uso general).
* **Redes Virtuales (VNets):** El servicio que te permite crear tus propias redes privadas aisladas en la nube. Dentro de una VNet, puedes definir subredes, tablas de enrutamiento y grupos de seguridad de red (NSGs) para controlar el flujo de tráfico.
* **Grupos de Recursos (Resource Groups):** Una forma lógica de organizar tus recursos de Azure. Todos los recursos relacionados con una aplicación (VMs, redes, bases de datos) se agrupan en un solo grupo de recursos para facilitar la gestión.
* **Azure Storage:** Un servicio de almacenamiento escalable y duradero que ofrece diferentes tipos de almacenamiento: Blob Storage (objetos no estructurados), File Storage (compartidos de archivos SMB), Queue Storage (mensajería) y Table Storage (NoSQL).
* **Azure SQL Database:** Un servicio de base de datos relacional gestionado basado en SQL Server. Azure se encarga de las operaciones, el mantenimiento y las copias de seguridad.
* **Azure DNS:** Un servicio de hospedaje de dominios DNS que te permite resolver nombres de dominio en Azure y fuera de él.

Dominar los conceptos básicos de Azure te permite empezar a construir y desplegar tus soluciones en una de las plataformas de nube líderes en el mercado, especialmente útil si ya trabajas en un entorno basado en Microsoft.
''',
    'code_example': r'''
# Ejemplo: Azure básico - Lanzar una máquina virtual (con la CLI de Azure)

# Asegúrate de tener la Azure CLI instalada y autenticada.
# az login
# az account set --subscription <YOUR_SUBSCRIPTION_ID>

# 1. Crear un grupo de recursos
az group create --name my-azure-resource-group --location eastus

# 2. Crear una máquina virtual Linux
az vm create \
    --resource-group my-azure-resource-group \
    --name my-azure-vm \
    --image UbuntuLTS \
    --admin-username azureuser \
    --generate-ssh-keys \
    --public-ip-sku Standard

# 3. Abrir un puerto de red (ej. puerto 80 para un servidor web)
az vm open-port --resource-group my-azure-resource-group --name my-azure-vm --port 80

# 4. Obtener la dirección IP pública de la VM
az vm show --resource-group my-azure-resource-group --name my-azure-vm --query publicIpAddress --output tsv

# 5. Conectarse a la VM (SSH)
# ssh azureuser@<Public_IP_Address>

# 6. Detener la VM
# az vm stop --resource-group my-azure-resource-group --name my-azure-vm

# 7. Eliminar la VM y el grupo de recursos
# az group delete --name my-azure-resource-group --yes --no-wait

# Ejemplo incorrecto: No organizar los recursos en grupos o dejar puertos abiertos innecesariamente.
# az vm create --name my-vm --image UbuntuLTS # Sin grupo de recursos, se crearía en un grupo por defecto.
# az vm open-port --resource-group my-azure-resource-group --name my-azure-vm --port 0-65535 # Abre todos los puertos, un riesgo de seguridad.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Virtualización y Contenedores',
    'topic': 'Plataformas de Nube Básica',
    'subtopic': 'Herramientas CLI de nube',
    'definition': r'''
Las herramientas de línea de comandos (CLI) de las plataformas de nube (AWS CLI, gcloud CLI, Azure CLI) son interfaces que te permiten interactuar con los servicios en la nube directamente desde tu terminal. En lugar de usar las consolas web gráficas, estas CLIs te permiten automatizar, scriptar y gestionar tus recursos de nube de forma programática.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en la necesidad de crear 50 máquinas virtuales idénticas, cambiar configuraciones en 10 bases de datos, o automatizar el despliegue de una aplicación en la nube como parte de un pipeline de CI/CD. Intentar hacer esto manualmente a través de una interfaz web sería una locura. Las CLIs de nube te proporcionan la potencia y la flexibilidad para realizar estas tareas de forma eficiente, reproducible y escalable, lo cual es fundamental para el DevOps, la automatización y la gestión a gran escala en la nube.

Cada una de las principales plataformas de nube tiene su propia CLI:
* **AWS CLI:** La interfaz oficial de línea de comandos para Amazon Web Services. Te permite gestionar todos los servicios de AWS, desde EC2 hasta S3, Lambda, RDS, y más. Soporta diferentes formatos de salida (JSON, texto, tabla) y tiene una potente capacidad de consulta (JMESPath).
* **Google Cloud CLI (`gcloud`):** La herramienta unificada de línea de comandos de Google Cloud Platform. Puedes usarla para interactuar con Compute Engine, Cloud Storage, Kubernetes Engine, BigQuery y todos los demás servicios de GCP. Es muy bien integrada y ofrece autocompletado para los comandos.
* **Azure CLI:** La herramienta de línea de comandos de Microsoft Azure. Permite gestionar recursos de Azure a través de comandos simples y potentes, cubriendo una amplia gama de servicios como máquinas virtuales, redes, almacenamiento, bases de datos y servicios de contenedores.

Dominar el uso de estas CLIs es una habilidad esencial para cualquier profesional que trabaje con infraestructura en la nube, ya que te permite integrar la gestión de la nube en tus scripts de Bash y tus procesos de automatización.
''',
    'code_example': r'''
# Ejemplo: Uso de herramientas CLI de nube en un script Bash

# Este script conceptual demuestra cómo unificar operaciones de nube
# Requiere que las CLIs de AWS, gcloud y Azure estén instaladas y configuradas.

#!/bin/bash

# --- Configuración (en un entorno real, usaría variables de entorno o un gestor de secretos) ---
AWS_REGION="us-east-1"
GCP_ZONE="us-central1-a"
GCP_PROJECT_ID="your-gcp-project"
AZURE_RESOURCE_GROUP="my-azure-rg"
AZURE_LOCATION="eastus"

INSTANCE_NAME="my-cli-test-vm"
AMI_ID="ami-053b0d53c279acc90" # Ubuntu 22.04 LTS para AWS
GCP_IMAGE_FAMILY="debian-11"
AZURE_IMAGE="UbuntuLTS"

# --- Funciones para cada CLI ---

# Función para lanzar una VM en AWS
launch_aws_vm() {
    echo "Lanzando VM en AWS..."
    aws ec2 run-instances \
        --image-id "$AMI_ID" \
        --count 1 \
        --instance-type t2.micro \
        --key-name my-ec2-key \
        --security-groups my-ec2-security-group \
        --query 'Instances[0].InstanceId' --output text
}

# Función para lanzar una VM en GCP
launch_gcp_vm() {
    echo "Lanzando VM en Google Cloud..."
    gcloud compute instances create "$INSTANCE_NAME-gcp" \
        --project="$GCP_PROJECT_ID" \
        --zone="$GCP_ZONE" \
        --machine-type=e2-micro \
        --image-family="$GCP_IMAGE_FAMILY" \
        --image-project=debian-cloud \
        --tags=http-server \
        --format='get(name)'
}

# Función para lanzar una VM en Azure
launch_azure_vm() {
    echo "Lanzando VM en Azure..."
    az vm create \
        --resource-group "$AZURE_RESOURCE_GROUP" \
        --name "$INSTANCE_NAME-azure" \
        --location "$AZURE_LOCATION" \
        --image "$AZURE_IMAGE" \
        --admin-username azureuser \
        --generate-ssh-keys \
        --public-ip-sku Standard \
        --query 'name' --output tsv
}

# --- Ejecución ---
echo "--- Iniciando despliegues de VMs en múltiples nubes ---"

# Lanzar en AWS
AWS_VM_ID=$(launch_aws_vm)
if [ -n "$AWS_VM_ID" ]; then
    echo "VM de AWS lanzada con ID: $AWS_VM_ID"
else
    echo "ERROR: Fallo al lanzar VM en AWS."
fi

# Lanzar en GCP
GCP_VM_NAME=$(launch_gcp_vm)
if [ -n "$GCP_VM_NAME" ]; then
    echo "VM de GCP lanzada con nombre: $GCP_VM_NAME"
else
    echo "ERROR: Fallo al lanzar VM en GCP."
fi

# Lanzar en Azure
AZURE_VM_NAME=$(launch_azure_vm)
if [ -n "$AZURE_VM_NAME" ]; then
    echo "VM de Azure lanzada con nombre: $AZURE_VM_NAME"
else
    echo "ERROR: Fallo al lanzar VM en Azure."
fi

echo "--- Despliegues finalizados ---"

# Puedes añadir lógica para obtener IPs, verificar estado, etc.

# Ejemplo incorrecto: Copiar y pegar comandos individuales sin automatización.
# Esto no escala y es propenso a errores humanos cuando se repite.
# aws ec2 run-instances ...
# gcloud compute instances create ...
# az vm create ...
'''
  });
}

Future<void> insertMidLevel4DataLinux(Database db) async {
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Monitoreo y Registro',
    'topic': 'Monitoreo de Sistemas',
    'subtopic': 'Prometheus básico',
    'definition': r'''
Prometheus es un sistema de monitoreo y alertado de código abierto, diseñado para ser escalable y flexible. Se especializa en la recolección de métricas (valores numéricos) en forma de series temporales, es decir, datos etiquetados con una marca de tiempo.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en un servidor que está funcionando aparentemente bien, pero de repente empieza a ir lento o a consumir muchos recursos. Sin un sistema de monitoreo, no sabrías qué está pasando hasta que sea demasiado tarde. Prometheus te permite recopilar datos sobre el rendimiento de tus sistemas, aplicaciones y servicios, dándote una visión en tiempo real de su estado de salud y rendimiento. Es fundamental para la detección temprana de problemas, la optimización de recursos y la garantía de la disponibilidad de tus sistemas.

El funcionamiento básico de Prometheus implica:
* **Recolección de métricas (Pull-based):** A diferencia de otros sistemas que esperan que los clientes envíen datos, Prometheus "raspa" (scrapes) las métricas de los endpoints HTTP de las aplicaciones o servidores que quiere monitorear.
* **Exporters:** Son pequeños agentes que se ejecutan en los servidores o junto a las aplicaciones y exponen métricas en un formato que Prometheus puede entender. Hay exporters para casi todo: `node_exporter` para métricas del sistema operativo, `mysqld_exporter` para bases de datos MySQL, etc.
* **Almacenamiento de series temporales:** Prometheus almacena todas las métricas en una base de datos de series temporales interna, lo que permite consultas rápidas sobre el historial de los datos.
* **PromQL (Prometheus Query Language):** Un potente lenguaje de consulta que te permite seleccionar y agregar datos de series temporales en tiempo real. Con PromQL puedes crear gráficos complejos, calcular promedios, identificar picos y mucho más.
* **Target Discovery:** Prometheus puede descubrir automáticamente qué objetivos debe monitorear, integrándose con sistemas como Kubernetes, AWS EC2, Consul, etc.

Prometheus se ha convertido en un estándar de facto para el monitoreo en entornos de contenedores y microservicios, siendo una herramienta indispensable en el stack de observabilidad moderno.
''',
    'code_example': r'''
# Ejemplo: Prometheus básico - Monitorear un servidor Linux con node_exporter

# 1. Instalar y configurar node_exporter en el servidor a monitorear
# Descargar el exporter (verificar la última versión en GitHub de Prometheus)
# wget https://github.com/prometheus/node_exporter/releases/download/v1.7.0/node_exporter-1.7.0.linux-amd64.tar.gz
# tar xvfz node_exporter-1.7.0.linux-amd64.tar.gz
# cd node_exporter-1.7.0.linux-amd64

# Ejecutar node_exporter (normalmente como un servicio systemd)
# ./node_exporter

# Verificar que el exporter está sirviendo métricas en http://localhost:9100/metrics

# 2. Configurar Prometheus para raspar las métricas del node_exporter
# Archivo prometheus.yml (ejemplo mínimo)
# global:
#   scrape_interval: 15s # Raspar métricas cada 15 segundos
#
# scrape_configs:
#   - job_name: 'node'
#     static_configs:
#       - targets: ['<IP_DEL_SERVIDOR_MONITOREADO>:9100'] # Reemplaza con la IP de tu servidor

# 3. Iniciar Prometheus (después de instalarlo, p.ej. descargando el binario)
# wget https://github.com/prometheus/prometheus/releases/download/v2.51.2/prometheus-2.51.2.linux-amd64.tar.gz
# tar xvfz prometheus-2.51.2.linux-amd64.tar.gz
# cd prometheus-2.51.2.linux-amd64
# ./prometheus --config.file=prometheus.yml

# 4. Acceder a la UI de Prometheus en http://localhost:9090
# Puedes usar PromQL en la barra de búsqueda, por ejemplo:
# node_cpu_seconds_total
# node_memory_MemAvailable_bytes
# rate(node_cpu_seconds_total{mode="idle"}[5m])

# Ejemplo incorrecto: No configurar un firewall para permitir el tráfico a 9100 en el servidor exportador.
# Esto evitaría que Prometheus recoja las métricas.
# También, no usar un exporter oficial o bien mantenido puede llevar a métricas inconsistentes o errores.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Monitoreo y Registro',
    'topic': 'Monitoreo de Sistemas',
    'subtopic': 'Grafana básico',
    'definition': r'''
Grafana es una herramienta de código abierto para la visualización y análisis de métricas. Es el complemento perfecto para Prometheus (u otras fuentes de datos como bases de datos, logs, etc.), permitiéndote construir paneles de control interactivos y hermosos para entender el estado de tus sistemas.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en tener montones de datos de monitoreo en Prometheus. Son útiles, sí, pero ver números crudos o gráficos básicos en la interfaz de Prometheus no es la forma más intuitiva de entender rápidamente si todo está funcionando como debería. Grafana convierte esos datos en visualizaciones claras y atractivas, permitiéndote identificar tendencias, anomalías y problemas de un vistazo. Es la "cara" de tu sistema de monitoreo, crucial para la observabilidad y la toma de decisiones basada en datos.

Las características clave de Grafana incluyen:
* **Paneles de control (Dashboards):** Colecciones de paneles que muestran métricas y visualizaciones relacionadas. Puedes crear paneles desde cero o importar plantillas predefinidas (ej. para monitorear Linux, Nginx, Kubernetes).
* **Paneles (Panels):** Elementos individuales dentro de un panel de control que muestran una única visualización de datos (ej. gráficos de líneas, gráficos circulares, medidores, tablas, estadísticas).
* **Fuentes de datos (Data Sources):** Grafana no almacena datos por sí mismo. Se conecta a diversas fuentes de datos (Prometheus, InfluxDB, Loki, ElasticSearch, bases de datos SQL, etc.) para consultar y visualizar la información.
* **Lenguajes de consulta:** Utiliza los lenguajes de consulta nativos de cada fuente de datos (ej. PromQL para Prometheus, SQL para bases de datos relacionales).
* **Alertas:** Grafana puede configurar reglas de alerta basadas en los datos de tus paneles y enviar notificaciones a diferentes canales (email, Slack, PagerDuty).
* **Variables:** Permiten crear paneles dinámicos. Por ejemplo, puedes tener un menú desplegable para seleccionar el servidor que quieres monitorear, y el panel se actualizará automáticamente.

Grafana es una herramienta increíblemente versátil y potente para visualizar cualquier tipo de datos de series temporales, convirtiendo la información compleja en conocimiento accionable para equipos de operaciones y desarrollo.
''',
    'code_example': r'''
# Ejemplo: Grafana básico - Conectar a Prometheus y crear un panel

# 1. Instalar Grafana (ej. en Ubuntu)
# sudo apt install -y apt-transport-https software-properties-common wget
# sudo wget -q -O /usr/share/keyrings/grafana.key https://apt.grafana.com/gpg.key
# echo "deb [signed-by=/usr/share/keyrings/grafana.key] https://apt.grafana.com stable main" | sudo tee /etc/apt/sources.list.d/grafana.list
# sudo apt update
# sudo apt install grafana -y
# sudo systemctl enable grafana-server
# sudo systemctl start grafana-server

# 2. Acceder a Grafana en http://localhost:3000 (usuario/contraseña por defecto: admin/admin)
# Te pedirá cambiar la contraseña inicial.

# 3. Añadir Prometheus como fuente de datos en Grafana:
# a. En la interfaz web de Grafana, ve a "Connections" (o "Configuration" -> "Data sources").
# b. Haz clic en "Add new data source".
# c. Busca y selecciona "Prometheus".
# d. En "URL", ingresa la URL de tu servidor Prometheus (ej. http://localhost:9090).
# e. Haz clic en "Save & test". Debería mostrar "Data source is working".

# 4. Crear un panel de control básico en Grafana:
# a. Haz clic en el icono de "Dashboards" -> "New dashboard" -> "Add a new panel".
# b. En el panel "Query", selecciona tu fuente de datos "Prometheus".
# c. En la caja de PromQL, ingresa una consulta, por ejemplo:
#   sum(rate(node_cpu_seconds_total{mode="idle"}[5m])) by (instance)
# d. Selecciona el tipo de visualización (ej. "Graph").
# e. Puedes ajustar el título del panel y guardarlo en un panel de control.

# 5. Opcional: Importar un panel de control predefinido (ej. Node Exporter Full)
# a. Ve a "Dashboards" -> "Import".
# b. Busca el ID del panel en Grafana Labs (ej. 1860 para Node Exporter Full).
# c. Ingresa el ID y haz clic en "Load", luego selecciona tu fuente de datos Prometheus y "Import".

# Ejemplo incorrecto: No verificar la conectividad entre Grafana y Prometheus.
# Si la URL de Prometheus es incorrecta o hay un firewall bloqueando, Grafana no podrá obtener datos.
# También, usar consultas PromQL ineficientes en Grafana puede sobrecargar a Prometheus.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Monitoreo y Registro',
    'topic': 'Monitoreo de Sistemas',
    'subtopic': 'Alertmanager',
    'definition': r'''
Alertmanager es un componente del ecosistema de Prometheus que se encarga de la gestión y envío de alertas. Recibe las alertas generadas por Prometheus, las agrupa, las desduplica, las silencia y las envía a los receptores configurados (email, Slack, PagerDuty, etc.).

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en tener varios servidores y servicios que monitoreas con Prometheus. Si algo falla, Prometheus generará una alerta. Pero si cada instancia de un servicio falla, Prometheus enviaría múltiples alertas idénticas. Esto se vuelve una "tormenta de alertas" que nadie puede manejar. Alertmanager soluciona esto, asegurando que recibas notificaciones significativas y sin redundancia, lo cual es fundamental para una respuesta eficiente a los incidentes y para evitar la fatiga por alertas.

Las funciones principales de Alertmanager incluyen:
* **Agrupación (Grouping):** Combina alertas similares en una sola notificación. Por ejemplo, si diez instancias de un servicio fallan, Alertmanager puede enviarte una sola alerta con detalles sobre las diez, en lugar de diez alertas individuales.
* **Desduplicación (Deduplication):** Si la misma alerta se activa repetidamente, Alertmanager la envía solo una vez o en intervalos configurables, evitando la sobrecarga de notificaciones.
* **Silenciamiento (Silencing):** Permite silenciar temporalmente alertas que sabes que van a ocurrir (ej. durante un mantenimiento programado) para evitar ruido innecesario.
* **Supresión (Suppression):** Si una alerta de mayor gravedad (ej. un clúster entero está caído) se dispara, puede suprimir alertas de menor gravedad (ej. instancias individuales caídas) que son consecuencia de la primera.
* **Rutas (Routing):** Define reglas para enviar alertas a diferentes receptores según sus etiquetas. Por ejemplo, alertas de base de datos a un equipo de DBA, alertas de frontend a un equipo de desarrollo web.
* **Receptores (Receivers):** Configura los destinos a los que se envían las notificaciones (ej. Slack, email, PagerDuty, Webhooks, OpsGenie).

Alertmanager es el cerebro detrás de tus notificaciones de monitoreo, transformando los eventos brutos de Prometheus en alertas accionables y bien gestionadas.
''',
    'code_example': r'''
# Ejemplo: Alertmanager - Configuración básica y reglas de alerta

# 1. Configurar reglas de alerta en Prometheus (archivo alert.rules.yml)
# Este archivo es cargado por Prometheus.
# groups:
#   - name: general.rules
#     rules:
#     - alert: HostHighCpuLoad
#       expr: 100 - (avg by (instance) (rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100) > 80
#       for: 5m
#       labels:
#         severity: warning
#       annotations:
#         summary: "CPU alta en {{ $labels.instance }}"
#         description: "El uso de CPU de {{ $labels.instance }} está por encima del 80% durante 5 minutos."

# 2. Configurar Alertmanager (archivo alertmanager.yml)
# global:
#   resolve_timeout: 5m
#
# route:
#   group_by: ['alertname', 'instance']
#   group_wait: 30s
#   group_interval: 5m
#   repeat_interval: 1h
#   receiver: 'default-receiver' # Receptor por defecto
#
#   routes:
#   - match:
#       severity: 'critical'
#     receiver: 'critical-alerts'
#
# receivers:
#   - name: 'default-receiver'
#     webhook_configs:
#       - url: 'http://localhost:5000/default-webhook' # Simula un webhook
#   - name: 'critical-alerts'
#     email_configs:
#       - to: 'admin@example.com'
#         from: 'alertmanager@example.com'
#         smarthost: 'smtp.example.com:587'
#         auth_username: 'smtp_user'
#         auth_password: 'smtp_password'

# 3. Iniciar Alertmanager (después de instalarlo)
# wget https://github.com/prometheus/alertmanager/releases/download/v0.27.0/alertmanager-0.27.0.linux-amd64.tar.gz
# tar xvfz alertmanager-0.27.0.linux-amd64.tar.gz
# cd alertmanager-0.27.0.linux-amd64
# ./alertmanager --config.file=alertmanager.yml

# 4. Configurar Prometheus para enviar alertas a Alertmanager
# En prometheus.yml, añade:
# alerting:
#   alertmanagers:
#   - static_configs:
#     - targets: ['localhost:9093'] # Puerto por defecto de Alertmanager

# Ejemplo incorrecto: No configurar un 'for' en las reglas de alerta de Prometheus.
# Si una alerta no tiene 'for' (duración), se disparará y se resolverá instantáneamente si la métrica fluctúa,
# generando alertas ruidosas y sin sentido para problemas transitorios.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Monitoreo y Registro',
    'topic': 'Monitoreo de Sistemas',
    'subtopic': 'Métricas personalizadas',
    'definition': r'''
Las métricas personalizadas son puntos de datos específicos de tu aplicación o servicio que decides exponer para que un sistema de monitoreo (como Prometheus) los recoja. Van más allá de las métricas básicas del sistema operativo (CPU, memoria) y te dan una visión profunda de cómo se comporta tu software.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una tienda online. Saber que el servidor está bien no te dice si los usuarios están experimentando errores al pagar o si el inventario se está actualizando correctamente. Las métricas personalizadas te permiten medir exactamente lo que es importante para el negocio y la salud de tu aplicación (ej. número de pedidos procesados, latencia de una API, usuarios activos). Son esenciales para entender el rendimiento real de tus aplicaciones y para identificar cuellos de botella o errores específicos de tu lógica de negocio.

Exponer métricas personalizadas implica que tu aplicación genere datos en un formato que Prometheus pueda raspar. Hay varias formas de hacerlo:
* **Librerías de clientes (Client Libraries):** La forma más común y recomendada. Prometheus ofrece librerías de clientes para una multitud de lenguajes de programación (Go, Java, Python, Node.js, Ruby, etc.). Estas librerías te permiten instrumentar tu código, es decir, añadir llamadas para incrementar contadores, observar duraciones o medir valores. Luego, la librería expone un endpoint HTTP (`/metrics`) que Prometheus puede raspar.
* **Exporters personalizados:** Si no puedes modificar el código de tu aplicación, o si quieres exponer métricas de un sistema de terceros, puedes escribir un "exporter" personalizado. Un exporter es un pequeño programa (o script Bash/Python) que recolecta datos de tu aplicación o servicio y los convierte al formato de métricas de Prometheus, exponiéndolos en un endpoint HTTP.
* **Pushgateway:** Para trabajos de corta duración (ej. scripts batch) que no están siempre en ejecución, Prometheus no puede rasparlos directamente. El Pushgateway es un intermediario que permite a los trabajos enviar sus métricas a Prometheus (en lugar de ser raspados). Prometheus luego raspa las métricas del Pushgateway.

Al instrumentar tus aplicaciones con métricas personalizadas, transformas el monitoreo de una tarea genérica a una estrategia altamente específica y accionable para la observabilidad de tu software.
''',
    'code_example': r'''
# Ejemplo: Métricas personalizadas con un script Bash y Pushgateway (para tareas cortas)

# Este ejemplo simula un script que procesa algo y envía una métrica.
# Requiere que Pushgateway esté corriendo (https://github.com/prometheus/pushgateway)
# docker run -d -p 9091:9091 prom/pushgateway

#!/bin/bash

# Define el endpoint del Pushgateway
PUSHGATEWAY_URL="localhost:9091"
JOB_NAME="batch_processor"
INSTANCE_NAME="my_script_instance"

# Simular un procesamiento (ej. contar líneas en un archivo)
PROCESSED_LINES=$(wc -l /etc/passwd | awk '{print $1}')

# Generar la métrica en el formato de Prometheus
# myapp_lines_processed_total es un contador (gauge, histogram, summary son otros tipos)
# Se le añade una etiqueta 'file' para identificar qué archivo se procesó.
METRIC_DATA="myapp_lines_processed_total{file=\"/etc/passwd\"} $PROCESSED_LINES"

# Enviar la métrica al Pushgateway
# curl -X PUT -H "Content-Type: text/plain" --data-binary "$METRIC_DATA" \
#   http://${PUSHGATEWAY_URL}/metrics/job/${JOB_NAME}/instance/${INSTANCE_NAME}

# Para métricas de un servicio que siempre está corriendo (exporter personalizado)
# Ejemplo de un script Bash que expone métricas en un puerto (muy básico, para ilustrar)
# Este no usaría Pushgateway, sino que Prometheus lo rasparía directamente.

# #!/bin/bash
# # Script que sirve métricas en el puerto 9101

# PORT=9101
# while true; do
#     echo -e "HTTP/1.1 200 OK\nContent-Type: text/plain; version=0.0.4; charset=utf-8\n"
#     echo "myapp_custom_metric_value $(date +%s)" # Un contador simple
#     sleep 1
# done | nc -l -p $PORT

# Prometheus debería ser configurado para raspar este objetivo:
# - job_name: 'custom_app'
#   static_configs:
#     - targets: ['<IP_DEL_SERVIDOR>:9101']

# Ejemplo incorrecto: Scrapear archivos de log directamente para métricas.
# No es escalable ni eficiente. Es mejor procesar los logs y exponer métricas estructuradas.
# grep "ERROR" /var/log/myapp.log | wc -l # Esto no es una métrica de serie temporal.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Monitoreo y Registro',
    'topic': 'Sistemas de Logging',
    'subtopic': 'ELK Stack básico',
    'definition': r'''
El ELK Stack es un conjunto de tres herramientas de código abierto: Elasticsearch, Logstash y Kibana. Juntos, forman una potente plataforma para la ingesta, el almacenamiento, la búsqueda y la visualización de logs y otros datos generados por tus aplicaciones y sistemas.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en la cantidad masiva de logs que generan tus servidores, aplicaciones y dispositivos de red cada día. Analizarlos manualmente es imposible. El ELK Stack te permite centralizar todos esos logs, lo que facilita la búsqueda de errores, el análisis de patrones, la depuración de problemas y la obtención de información valiosa sobre el comportamiento de tus sistemas. Es fundamental para la observabilidad y la resolución de problemas en entornos distribuidos.

Cada componente del ELK Stack tiene un rol específico:
* **Elasticsearch:** Es un motor de búsqueda y análisis distribuido basado en Lucene. Es el corazón del stack, donde se almacenan y se indexan los logs. Su capacidad para realizar búsquedas de texto completo y análisis complejos en grandes volúmenes de datos lo hace ideal para este propósito.
* **Logstash:** Es un pipeline de procesamiento de datos que ingesta datos de varias fuentes, los transforma (parsea, enriquece, filtra) y los envía a un "stash" (generalmente Elasticsearch). Es como el "fontanero" del stack, asegurando que los logs lleguen a Elasticsearch en el formato correcto.
* **Kibana:** Es una plataforma de visualización y exploración de datos. Se conecta a Elasticsearch y te permite crear paneles de control interactivos, gráficos y realizar búsquedas complejas en tus logs de forma visual. Es la "interfaz de usuario" del stack, permitiéndote explorar y entender tus datos.

Aunque tradicionalmente se le conoce como ELK, hoy en día se ha expandido con la adición de Beats (agentes ligeros para el envío de datos), formándose el Elastic Stack completo. El ELK Stack es una solución muy popular para la gestión centralizada de logs en cualquier tipo de entorno.
''',
    'code_example': r'''
# Ejemplo: ELK Stack básico - Un flujo simple de Logstash a Elasticsearch y visualización en Kibana

# Este es un ejemplo conceptual. Se asume que Elasticsearch y Kibana ya están ejecutándose
# (ej. a través de Docker Compose o como servicios en la nube).

# 1. Configuración de Logstash (ej. config/logstash.conf)
# Este archivo le dice a Logstash cómo procesar los logs de un archivo y enviarlos a Elasticsearch.
# input {
#   file {
#     path => "/var/log/syslog" # Ruta al archivo de log que quieres procesar
#     start_position => "beginning"
#     sincedb_path => "/dev/null" # Para fines de demostración, procesa desde el inicio
#   }
# }

# filter {
#   # Aquí puedes añadir filtros GRC (Grok, Ruby, Conditional) para parsear tus logs
#   # Por ejemplo, para logs de Apache o Nginx
#   grok {
#     match => { "message" => "%{COMBINEDAPACHELOG}" }
#   }
#   date {
#     match => [ "timestamp", "dd/MMM/yyyy:HH:mm:ss Z" ]
#   }
#   # Más filtros para enriquecer datos, eliminar campos, etc.
# }

# output {
#   elasticsearch {
#     hosts => ["localhost:9200"] # Dirección de tu instancia de Elasticsearch
#     index => "syslog-%{+YYYY.MM.dd}" # Nombre del índice en Elasticsearch (diario)
#   }
#   stdout { codec => rubydebug } # Para ver la salida en la consola de Logstash
# }

# 2. Iniciar Logstash (asumiendo que los binarios están instalados)
# /usr/share/logstash/bin/logstash -f config/logstash.conf --config.reload.automatic

# 3. Acceder a Kibana (ej. http://localhost:5601)
# a. En Kibana, ve a "Stack Management" -> "Index Patterns".
# b. Haz clic en "Create index pattern".
# c. Ingresa el patrón de índice que configuraste en Logstash (ej. `syslog-*`).
# d. Selecciona el campo de tiempo (ej. `@timestamp`) y crea el patrón de índice.

# 4. Explorar los logs en Kibana:
# a. Ve a la sección "Discover".
# b. Selecciona el patrón de índice `syslog-*`.
# c. Podrás ver tus logs, buscarlos y filtrarlos.

# Ejemplo incorrecto: No definir un patrón de índice en Kibana o un campo de tiempo.
# Kibana no podrá mostrar tus logs correctamente o realizar búsquedas basadas en tiempo.
# También, no usar filtros en Logstash puede enviar logs sin parsear a Elasticsearch,
# haciendo que las búsquedas sean ineficientes y los datos difíciles de analizar.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Monitoreo y Registro',
    'topic': 'Sistemas de Logging',
    'subtopic': 'Rsyslog avanzado',
    'definition': r'''
Rsyslog es un demonio de logging de código abierto, muy potente y configurable, que se ejecuta en sistemas tipo Unix. Es una implementación avanzada del protocolo syslog, capaz de manejar grandes volúmenes de logs de diversas fuentes, transformarlos y enviarlos a múltiples destinos.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en la necesidad de centralizar los logs de seguridad, del sistema operativo o de aplicaciones de varios servidores en un solo lugar para su análisis y cumplimiento. Rsyslog básico solo envía logs a archivos locales. Rsyslog avanzado te permite reenviar logs a servidores remotos, filtrarlos de forma granular, transformar su formato y enviarlos a diferentes tipos de destinos, lo cual es fundamental para la seguridad, el cumplimiento normativo y la gestión centralizada de la información.

Las capacidades avanzadas de Rsyslog incluyen:
* **Envío de logs remotos (Client/Server):** Configurar Rsyslog para actuar como un cliente (enviar logs a un servidor remoto) o como un servidor (recibir logs de clientes remotos). Soporta protocolos TCP y UDP para la transferencia de logs.
* **Filtrado de logs:** Rsyslog permite filtrar logs basados en su facilidad (ej. `auth`, `mail`), severidad (ej. `info`, `error`, `crit`), o contenido (usando expresiones regulares). Esto es útil para dirigir logs específicos a diferentes destinos o para descartar logs ruidosos.
* **Plantillas (Templates):** Definir formatos personalizados para los mensajes de log. Esto es crucial para formatear logs en JSON o CSV antes de enviarlos a sistemas de análisis como Elasticsearch.
* **Módulos (Modules):** Rsyslog es modular y puede cargar diferentes módulos para entrada, procesamiento y salida. Por ejemplo, módulos para recibir logs de bases de datos, enviar a Kafka, o firmar logs criptográficamente.
* **Cola de disco (Disk Queuing):** Para asegurar la entrega de logs incluso si el destino remoto no está disponible, Rsyslog puede almacenar logs temporalmente en el disco y reenviarlos cuando la conexión se restablece.
* **Reglas de acción:** Definir acciones complejas basadas en las condiciones de los logs, como ejecutar un script, escribir en una base de datos, o descartar un log.

Dominar Rsyslog avanzado te permite tener un control granular sobre el flujo de logs en tu infraestructura, asegurando que la información crítica llegue a donde necesita ir, en el formato correcto y de forma fiable.
''',
    'code_example': r'''
# Ejemplo: Rsyslog avanzado - Reenvío de logs a un servidor remoto y formateo JSON

# 1. Configuración del cliente Rsyslog (ej. /etc/rsyslog.conf o /etc/rsyslog.d/50-remote.conf)
# Este ejemplo reenvía todos los logs de este servidor a un servidor remoto y también los formatea en JSON.

# Cargar el módulo para formato JSON (si es necesario)
# module(load="omfwd") # Módulo para reenvío de logs
# module(load="mmjsonparse") # Módulo para parsear JSON (opcional, si ya son JSON)
# module(load="omelasticsearch") # Si quieres enviar directamente a Elasticsearch

# Definir una plantilla para formatear los logs en JSON
# $template CustomJSONFormat,"{\"timestamp\":\"%timegenerated:::date-rfc3339%\",\"host\":\"%hostname%\",\"severity\":\"%syslogseverity-text%\",\"facility\":\"%syslogfacility-text%\",\"program\":\"%programname%\",\"message\":\"%msg:::json%\"}\n"

# Reenviar todos los logs a un servidor remoto (usando TCP para fiabilidad)
# @@ significa TCP, @ significa UDP
*.* @@log-server.example.com:514;CustomJSONFormat

# Si quieres filtrar, por ejemplo, solo logs de "auth" con severidad "info" o superior
# auth.info   @@log-server.example.com:514;CustomJSONFormat

# Reinciar Rsyslog para aplicar cambios
# sudo systemctl restart rsyslog

# 2. Configuración del servidor Rsyslog para recibir logs (ej. /etc/rsyslog.conf)
# Asegúrate de que el servidor está escuchando en los puertos adecuados.
# module(load="imudp") # Para recibir UDP
# input(type="imudp" port="514")
# module(load="imtcp") # Para recibir TCP
# input(type="imtcp" port="514")

# Definir dónde guardar los logs recibidos (ej. en un archivo separado)
# $template RemoteLogFormat,"%FROMHOST-IP% %syslogtag%%msg%\n"
# if $fromhost-ip != '127.0.0.1' then /var/log/remote_logs/all_remote_logs.log;RemoteLogFormat
# & stop # Para detener el procesamiento de logs recibidos si ya se han guardado.

# Reiniciar Rsyslog en el servidor
# sudo systemctl restart rsyslog

# Ejemplo incorrecto: No usar TCP para logs críticos o no configurar colas de disco.
# Usar UDP (`@`) para logs de seguridad o cruciales puede llevar a la pérdida de eventos si la red se congestiona.
# No configurar disk queues (`action(queue.type="LinkedList" queue.filename="q_fwd" ...)`) puede llevar a la pérdida de logs
# si el servidor remoto está caído.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Monitoreo y Registro',
    'topic': 'Sistemas de Logging',
    'subtopic': 'Rotación y retención',
    'definition': r'''
La rotación y retención de logs son prácticas esenciales en la gestión de logs que te permiten controlar el tamaño de los archivos de log y cuánto tiempo se conservan. La rotación evita que los archivos de log crezcan indefinidamente y consuman todo el espacio en disco, mientras que la retención define por cuánto tiempo se guardan esos logs.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en un servidor que genera gigabytes de logs cada día. Si no los gestionas, el disco se llenará rápidamente, causando que el sistema falle o que las aplicaciones dejen de funcionar. Además, las regulaciones de cumplimiento (como GDPR, HIPAA) a menudo exigen que los logs se retengan por un cierto período, pero también que se eliminen después de ese período para proteger la privacidad. La rotación y retención adecuadas son fundamentales para la estabilidad del sistema, el cumplimiento normativo y la eficiencia del almacenamiento.

En Linux, la herramienta estándar para la rotación de logs es `logrotate`. Sus características incluyen:
* **Rotación por tamaño o tiempo:** Puedes configurar `logrotate` para rotar logs cuando alcanzan un cierto tamaño (ej. 100MB) o después de un período específico (ej. diariamente, semanalmente, mensualmente).
* **Compresión:** Los archivos de log rotados se pueden comprimir (`compress`) para ahorrar espacio en disco.
* **Número de versiones:** Puedes especificar cuántas versiones anteriores de un log quieres mantener (`rotate 7` para guardar 7 versiones).
* **Post-rotación (postrotate scripts):** Ejecutar comandos después de la rotación de un log. Esto es útil para notificar a un servicio que el archivo de log ha cambiado y debe reabrirlo (ej. `systemctl reload nginx`).
* **Manejo de archivos vacíos:** `logrotate` puede configurarse para no rotar archivos de log que están vacíos (`notifempty`).
* **Creación de nuevos archivos:** Después de rotar un log, `logrotate` puede crear un nuevo archivo vacío con los permisos correctos (`create`).

La retención, por su parte, se gestiona junto con la rotación, especificando el número de versiones a mantener. Para logs centralizados en sistemas como ELK, la retención se gestiona a nivel del sistema de almacenamiento (ej. políticas de ciclo de vida de índices en Elasticsearch). Implementar una buena estrategia de rotación y retención es clave para una gestión de logs sostenible y conforme a las políticas.
''',
    'code_example': r'''
# Ejemplo: Rotación y retención de logs con logrotate

# 1. Archivo de configuración de logrotate (ej. /etc/logrotate.d/nginx)
# Este ejemplo rota los logs de Nginx diariamente, los comprime y mantiene 7 versiones.

# /var/log/nginx/*.log {
#     daily # Rotar diariamente
#     missingok # No dar error si el archivo no existe
#     rotate 7 # Mantener 7 versiones anteriores
#     compress # Comprimir los logs rotados
#     delaycompress # Comprimir la versión anterior en el siguiente ciclo
#     notifempty # No rotar si el archivo está vacío
#     create 0640 www-data adm # Crear un nuevo archivo con estos permisos
#     sharedscripts # Ejecutar scripts solo una vez por ciclo, incluso si hay múltiples logs
#     postrotate # Script a ejecutar después de la rotación
#         if [ -f /var/run/nginx.pid ]; then
#             kill -USR1 `cat /var/run/nginx.pid`
#         fi
#     endscript
# }

# 2. Ejecutar logrotate manualmente (para probar la configuración)
# Esto simula la ejecución diaria o semanal que hace cron.
# sudo logrotate --force /etc/logrotate.d/nginx

# 3. Verificar el estado de logrotate (para ver cuándo fue la última vez que se rotó)
# cat /var/lib/logrotate/status

# Ejemplo incorrecto: No configurar la rotación para logs grandes.
# Esto llevará al llenado del disco y fallos del sistema o aplicaciones.
# Por ejemplo, dejar un archivo de log de base de datos o de aplicación sin rotación.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Monitoreo y Registro',
    'topic': 'Sistemas de Logging',
    'subtopic': 'Análisis de logs',
    'definition': r'''
El análisis de logs es el proceso de examinar los datos contenidos en los archivos de log para extraer información útil sobre el rendimiento del sistema, errores de aplicación, eventos de seguridad, patrones de uso y mucho más. Es como ser un detective que busca pistas en los registros de actividad para entender qué pasó o qué está pasando.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en un error misterioso en tu aplicación que solo ocurre a veces, o en un intento de ataque de seguridad. Sin un análisis sistemático de los logs, encontrar la causa raíz sería casi imposible. El análisis de logs te permite detectar problemas, identificar vulnerabilidades, optimizar el rendimiento, comprender el comportamiento de los usuarios y cumplir con los requisitos de auditoría. Es una habilidad crucial para la depuración, la seguridad y la optimización en cualquier entorno de TI.

Las técnicas y herramientas para el análisis de logs incluyen:
* **Herramientas de línea de comandos (grep, awk, sed, less, tail):** Son las herramientas básicas y más rápidas para buscar patrones, filtrar líneas y extraer información de logs directamente en la terminal. Son excelentes para análisis ad-hoc y en servidores individuales.
* **Herramientas de análisis de logs estructurados (jq para JSON, xmlstarlet para XML):** Cuando los logs están en formatos estructurados (como JSON o XML), estas herramientas permiten parsear y consultar los datos de forma más precisa que `grep`.
* **Centralización de logs (ELK Stack, Splunk, Loki):** Para entornos con múltiples servidores o aplicaciones, centralizar los logs en una plataforma permite búsquedas y análisis a gran escala en tiempo real, correlacionar eventos de diferentes fuentes y visualizar tendencias.
* **Herramientas de análisis de patrones/anomalías:** Algunas herramientas avanzadas utilizan técnicas estadísticas o de aprendizaje automático para identificar patrones inusuales en los logs que podrían indicar problemas (ej. una tasa inusual de errores 5xx).
* **Visualización y paneles de control:** Herramientas como Kibana o Grafana permiten crear paneles interactivos para visualizar tendencias en los logs (ej. errores por minuto, tráfico de usuarios, tiempo de respuesta de la API), lo que facilita la detección de problemas.
* **Alertas basadas en logs:** Configurar alertas que se disparen cuando ciertos patrones o umbrales se cumplen en los logs (ej. demasiados intentos de login fallidos, errores específicos de la aplicación).

El análisis de logs es una disciplina que combina la automatización con la capacidad humana de interpretación, permitiendo transformar montañas de datos en información útil para la toma de decisiones y la mejora continua de los sistemas.
''',
    'code_example': r'''
# Ejemplo: Análisis de logs con herramientas de línea de comandos

# Suponiendo un archivo de log llamado /var/log/nginx/access.log con formato de log de acceso de Nginx

# 1. Buscar todas las ocurrencias de errores 404
# grep " 404 " /var/log/nginx/access.log

# 2. Contar el número de errores 500 en el último día
# grep " 500 " /var/log/nginx/access.log | wc -l

# 3. Ver las 10 IPs que más accesos han hecho al servidor
# awk '{print $1}' /var/log/nginx/access.log | sort | uniq -c | sort -nr | head -n 10

# 4. Extraer solo las URL de las solicitudes GET
# grep "GET" /var/log/nginx/access.log | awk '{print $7}' | sort | uniq

# 5. Filtrar logs que contienen una palabra clave específica y ver las últimas 20 líneas
# tail -n 20 /var/log/myapp/app.log | grep "failed authentication"

# 6. Analizar un log JSON con `jq` (si tu log está en formato JSON)
# Suponiendo un log.json con líneas como: {"timestamp": "...", "level": "ERROR", "message": "..."}
# cat log.json | jq 'select(.level == "ERROR")' # Filtrar solo los mensajes de error
# cat log.json | jq -r '.message' | sort | uniq -c # Contar mensajes únicos

# Ejemplo incorrecto: No usar un parser cuando los logs tienen formato estructurado.
# grep "user failed to login" /var/log/auth.json # Si es JSON, es mejor usar `jq` para un filtrado preciso.
# Esto podría dar falsos positivos o no encontrar todas las ocurrencias si el formato JSON cambia ligeramente.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Monitoreo y Registro',
    'topic': 'Rendimiento del Sistema',
    'subtopic': 'Tuning del kernel',
    'definition': r'''
El tuning del kernel en Linux es el proceso de ajustar los parámetros de configuración del núcleo del sistema operativo para optimizar su rendimiento, estabilidad o comportamiento para una carga de trabajo específica. Es como afinar un motor para que funcione de la manera más eficiente y potente posible para una tarea determinada.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en un servidor que maneja una gran cantidad de conexiones de red, una base de datos con muchas operaciones de E/S de disco, o una aplicación que consume mucha memoria. El kernel por defecto puede no estar configurado para estas cargas de trabajo extremas, lo que lleva a un rendimiento subóptimo, latencia alta o incluso inestabilidad. El tuning del kernel te permite exprimir el máximo rendimiento de tu hardware y software, lo cual es fundamental para aplicaciones de alto rendimiento, servidores web concurridos y bases de datos intensivas.

La mayoría de los parámetros del kernel se pueden ajustar en tiempo de ejecución a través del sistema de archivos `sysctl` (generalmente en `/proc/sys`). Algunos de los parámetros comunes que se suelen tunear incluyen:
* **Redes:**
    * `net.ipv4.tcp_tw_reuse`, `net.ipv4.tcp_fin_timeout`: Para la gestión de conexiones TCP y evitar el agotamiento de puertos.
    * `net.core.somaxconn`: Aumenta la cola de conexiones pendientes.
    * `net.ipv4.tcp_max_syn_backlog`: Aumenta la cola para solicitudes SYN.
* **Memoria virtual (VM):**
    * `vm.swappiness`: Controla la tendencia del kernel a usar espacio de swap. Un valor bajo (ej. 10) significa que el kernel intentará usar el swap lo menos posible, manteniendo más datos en RAM.
    * `vm.dirty_ratio`, `vm.dirty_background_ratio`: Controlan cuándo el kernel empieza a escribir datos "sucios" (en caché) al disco.
* **Descriptores de archivos (File Descriptors):**
    * `fs.file-max`: El número máximo de descriptores de archivos que el kernel puede asignar. Crucial para servidores que manejan muchas conexiones o archivos abiertos.
* **Optimización del planificador:**
    * Aunque menos común para el ajuste general, los planificadores de CPU y E/S pueden influir en el rendimiento para cargas de trabajo específicas (ej. CFS para CPU, CFQ/deadline/noop para E/S).

Los cambios en los parámetros de `sysctl` son temporales hasta el reinicio. Para hacerlos permanentes, debes añadirlos a `/etc/sysctl.conf` o a un archivo en `/etc/sysctl.d/`. El tuning del kernel debe hacerse con cautela y con pruebas exhaustivas, ya que un ajuste incorrecto puede degradar el rendimiento o la estabilidad.
''',
    'code_example': r'''
# Ejemplo: Tuning del kernel con sysctl

# 1. Ver el valor actual de un parámetro del kernel
sysctl net.ipv4.tcp_tw_reuse
# Salida: net.ipv4.tcp_tw_reuse = 0

# 2. Cambiar un parámetro del kernel temporalmente (hasta el reinicio)
# Habilitar la reutilización de sockets TIME-WAIT (útil para servidores web de alta concurrencia)
sudo sysctl -w net.ipv4.tcp_tw_reuse=1
# Salida: net.ipv4.tcp_tw_reuse = 1

# Cambiar la tendencia del kernel a usar swap (mantener más en RAM)
sudo sysctl -w vm.swappiness=10

# Aumentar la cola de conexiones pendientes
sudo sysctl -w net.core.somaxconn=65535

# 3. Hacer los cambios permanentes
# Abrir el archivo de configuración de sysctl
# sudo nano /etc/sysctl.conf

# Añadir las líneas al final del archivo:
# net.ipv4.tcp_tw_reuse = 1
# vm.swappiness = 10
# net.core.somaxconn = 65535

# Guardar el archivo y aplicar los cambios (sin reiniciar)
sudo sysctl -p

# 4. Aumentar el límite de descriptores de archivos abiertos (para un proceso específico, ej. para un servicio)
# Esto se hace a nivel de usuario/proceso, no de kernel global.
# Editar el archivo de límites: sudo nano /etc/security/limits.conf
# Añadir líneas como:
# * soft nofile 65535
# * hard nofile 65535
# Para que estos cambios surtan efecto, el usuario debe cerrar la sesión y volver a iniciarla,
# o el servicio debe reiniciarse.

# Ejemplo incorrecto: Ajustar parámetros al azar sin entender su impacto.
# Por ejemplo, establecer vm.swappiness=0 (no usar swap en absoluto) en un servidor con poca RAM,
# puede llevar a fallos de memoria cuando la RAM se agota.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Monitoreo y Registro',
    'topic': 'Rendimiento del Sistema',
    'subtopic': 'Análisis de cuellos de botella',
    'definition': r'''
El análisis de cuellos de botella es el proceso de identificar los componentes o recursos de un sistema que están limitando su rendimiento general. Es como encontrar el punto estrecho en una tubería que impide que el agua fluya a su máxima capacidad.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una aplicación que va lenta, o un servidor que se congela ocasionalmente. Invertir en más RAM, una CPU más rápida o un disco SSD sin entender el problema real puede ser un desperdicio de recursos y no resolver el problema. El análisis de cuellos de botella te permite identificar la verdadera causa del bajo rendimiento, ya sea la CPU, la memoria, la E/S de disco, la red o la propia aplicación. Esto es fundamental para optimizar los recursos, mejorar la experiencia del usuario y escalar eficientemente tus sistemas.

Para realizar un análisis de cuellos de botella efectivo, se suele seguir un enfoque sistemático:
1.  **Monitoreo inicial:** Utilizar herramientas de monitoreo (ej. `top`, `htop`, `vmstat`, `iostat`, `netstat`, Prometheus) para obtener una visión general del uso de recursos. Esto ayuda a identificar dónde podría estar el problema principal (ej. CPU al 100%, disco con alta utilización, mucha E/S de red).
2.  **Identificación del recurso limitado:** Basado en el monitoreo, determinar qué recurso es el cuello de botella.
    * **CPU:** Si la carga del sistema es alta y la CPU está cerca del 100% de uso (especialmente userland). Herramientas como `top`, `htop`, `perf`.
    * **Memoria:** Si el sistema está usando mucha swap, o los procesos están siendo terminados por OOM Killer. Herramientas como `free`, `vmstat`, `top`.
    * **E/S de Disco:** Si la E/S de disco está saturada (alta `util` o `await` en `iostat`). Herramientas como `iostat`, `iotop`, `blktrace`.
    * **Red:** Si el ancho de banda está saturado, hay muchos errores de red, o alta latencia. Herramientas como `netstat`, `ss`, `iftop`, `iperf`.
    * **Aplicación/Software:** Si el problema no es de hardware, puede ser un problema de código (bucles infinitos, consultas ineficientes, bloqueos). Esto requiere perfiles de aplicación y análisis de logs.
3.  **Análisis profundo:** Una vez identificado el recurso, usar herramientas más específicas para profundizar. Por ejemplo, si es CPU, usar `perf` para ver qué funciones de la aplicación están consumiendo más CPU. Si es disco, ver qué procesos están generando más E/S.
4.  **Optimización y pruebas:** Implementar cambios basados en el análisis (ej. optimizar una consulta de base de datos, añadir un índice, ajustar parámetros del kernel, escalar vertical u horizontalmente) y luego volver a probar para verificar si el cuello de botella se ha resuelto o movido a otro lugar.

El análisis de cuellos de botella es un proceso iterativo que requiere una comprensión profunda del sistema y las herramientas adecuadas para diagnosticar el problema de rendimiento.
''',
    'code_example': r'''
# Ejemplo: Análisis de cuellos de botella con herramientas de línea de comandos

# 1. Monitoreo general de CPU y Memoria (top/htop)
# top
# htop # (más interactivo y visual)

# Verifique las columnas %CPU, %MEM, Load Average, Swap.

# 2. Monitoreo de E/S de Disco (iostat)
# Instalar sysstat si no está presente: sudo apt install sysstat -y
iostat -x 1 5 # Muestra estadísticas extendidas de E/S cada 1 segundo, 5 veces.
# Busque en las columnas:
# %util: Porcentaje de tiempo que el dispositivo está ocupado. Cerca de 100% indica saturación.
# r/s, w/s: Lecturas/escrituras por segundo.
# rkB/s, wkB/s: Kilobytes leídos/escritos por segundo.
# await: Tiempo promedio (en milisegundos) que las operaciones de E/S esperan. Valores altos indican latencia.

# 3. Monitoreo de Red (netstat / ss / iftop)
# netstat -tuln # Muestra los puertos abiertos (TCP/UDP, Listening/Numeric)
# ss -s # Muestra un resumen de las estadísticas de sockets
# Instalar iftop si no está presente: sudo apt install iftop -y
# sudo iftop -n -i eth0 # Muestra el uso de ancho de banda en tiempo real por conexión (ej. en eth0)
# Busque: Tx/Rx rates (transmisión/recepción), errores de red.

# 4. Identificar procesos que consumen recursos (pidstat, iotop)
# Instalar sysstat para pidstat: sudo apt install sysstat -y
# pidstat -u 5 # Muestra el uso de CPU por proceso cada 5 segundos
# pidstat -d 5 # Muestra el uso de E/S de disco por proceso cada 5 segundos
# Instalar iotop: sudo apt install iotop -y
# sudo iotop # Muestra el uso de E/S de disco por proceso en tiempo real

# 5. Ejemplo de un "cuello de botella" típico:
# Una aplicación Python está lenta.
# `top` muestra que la CPU está al 50% y `iostat` muestra que el disco está al 95% util.
# `pidstat -d` muestra que el proceso Python está haciendo muchas escrituras/lecturas de disco.
# Conclusión: El cuello de botella es la E/S de disco, no la CPU. La solución podría ser optimizar las operaciones de disco de la aplicación, usar un disco más rápido o una caché.

# Ejemplo incorrecto: Asumir que el problema es la CPU y comprar una más potente,
# cuando el verdadero problema es una base de datos mal indexada que causa mucha E/S de disco.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Monitoreo y Registro',
    'topic': 'Rendimiento del Sistema',
    'subtopic': 'Optimización de E/S',
    'definition': r'''
La optimización de E/S (Entrada/Salida) se refiere a las técnicas y estrategias utilizadas para mejorar el rendimiento de las operaciones de lectura y escritura de datos en el disco o en la red. Es decir, hacer que tu sistema acceda y maneje los datos de forma más rápida y eficiente.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una base de datos, un servidor de archivos o un sistema de virtualización. Estos sistemas dependen en gran medida de las operaciones de E/S. Si el subsistema de E/S es lento, toda la aplicación se verá afectada, sin importar cuán potente sea la CPU o cuánta RAM tenga. Optimizar la E/S es fundamental para reducir la latencia, aumentar el rendimiento de las transacciones y asegurar que las aplicaciones con uso intensivo de datos respondan rápidamente.

La optimización de E/S abarca varias capas del sistema:
* **Hardware:**
    * **Discos SSD/NVMe:** La mejora más significativa. Los SSDs son inherentemente mucho más rápidos que los HDDs tradicionales para E/S aleatoria y secuencial. Los NVMe son aún más rápidos al usar la interfaz PCIe.
    * **RAID:** Configurar arrays RAID (Redundant Array of Independent Disks) para mejorar el rendimiento (ej. RAID 0 para velocidad, RAID 10 para velocidad y redundancia) y la fiabilidad.
    * **Controladores de disco:** Usar controladores de disco dedicados (HBA) con cachés y que soporten las últimas tecnologías de E/S.
* **Sistema de archivos y kernel:**
    * **Elección del sistema de archivos:** Algunos sistemas de archivos (ej. XFS, ext4) tienen diferentes características de rendimiento para ciertas cargas de trabajo.
    * **Opciones de montaje:** Usar opciones de montaje adecuadas (ej. `noatime` para evitar escrituras innecesarias en los metadatos cada vez que un archivo es accedido).
    * **Planificadores de E/S:** El kernel de Linux ofrece diferentes planificadores de E/S (ej. `noop`, `deadline`, `CFQ`, `mq-deadline`, `bfq`). Elegir el planificador adecuado puede mejorar el rendimiento para cargas de trabajo específicas (ej. `noop` para SSDs, `deadline` para HDDs con E/S secuencial).
    * **Ajuste del caché del kernel:** Parámetros de `sysctl` como `vm.dirty_ratio` y `vm.swappiness` influyen en cómo el kernel gestiona el caché de escritura y el uso de swap.
* **Aplicación:**
    * **Acceso a datos:** Optimizar las consultas de bases de datos, reducir el número de operaciones de E/S, usar cachés a nivel de aplicación (ej. Redis, Memcached).
    * **E/S asíncrona:** Utilizar E/S asíncrona para que la aplicación no se bloquee mientras espera que las operaciones de E/S se completen.

La optimización de E/S es un campo complejo que requiere un análisis cuidadoso de la carga de trabajo y una comprensión de cómo interactúan las diferentes capas del stack de almacenamiento.
''',
    'code_example': r'''
# Ejemplo: Optimización de E/S en Linux

# 1. Verificar el tipo de disco (SSD vs HDD)
# lsblk -o NAME,ROTA
# ROTA=0 indica SSD/NVMe, ROTA=1 indica HDD.

# 2. Cambiar el planificador de E/S para un disco (temporalmente)
# Ver el planificador actual para sda:
# cat /sys/block/sda/queue/scheduler
# Salida: [mq-deadline] kyber bfq none
# Cambiar a noop (ideal para SSDs, ya que el disco gestiona el orden de E/S)
# sudo echo noop > /sys/block/sda/queue/scheduler

# Para hacer el cambio permanente, añade una regla udev (ej. /etc/udev/rules.d/60-schedulers.rules):
# ACTION=="add|change", KERNEL=="sd[a-z]|nvme[0-9]*", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="noop"

# 3. Optimizar opciones de montaje del sistema de archivos (ej. /etc/fstab)
# Cambiar las opciones de montaje para una partición (ej. /dev/sdb1)
# /dev/sdb1  /mnt/data  ext4  defaults,noatime,data=writeback  0  2
# noatime: Evita la actualización del tiempo de acceso de los archivos cada vez que se leen, reduciendo escrituras.
# data=writeback: Mejora el rendimiento de escritura al permitir que los datos se escriban después que los metadatos, pero con riesgo de corrupción en fallo. data=journal es más seguro.

# 4. Ajustar parámetros del kernel relacionados con la memoria virtual y el caché (sysctl)
# sudo nano /etc/sysctl.conf
# vm.swappiness = 10 # Reducir el uso de swap
# vm.dirty_background_ratio = 5 # Iniciar la escritura de datos sucios cuando el 5% de la RAM está sucia
# vm.dirty_ratio = 10 # Bloquear escrituras cuando el 10% de la RAM está sucia

# sudo sysctl -p # Aplicar los cambios

# Ejemplo incorrecto: Configurar el planificador de E/S `noop` para HDDs.
# El planificador `noop` asume que el dispositivo gestiona bien la cola, lo cual es cierto para SSDs,
# pero para HDDs con latencia mecánica, un planificador como `deadline` o `bfq` puede ser más eficiente
# al optimizar el orden de las operaciones de E/S para reducir los movimientos del cabezal.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Monitoreo y Registro',
    'topic': 'Rendimiento del Sistema',
    'subtopic': 'Pruebas de rendimiento',
    'definition': r'''
Las pruebas de rendimiento son el proceso de evaluar cómo se comporta un sistema, una aplicación o un componente bajo una carga de trabajo particular. No se trata solo de ver si algo funciona, sino de medir cuán rápido, estable y eficiente lo hace, y dónde están sus límites.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una aplicación web que se lanza al público. Si no se ha probado su rendimiento, podría colapsar con solo unos pocos usuarios concurrentes, arruinando la experiencia o causando pérdidas económicas. Las pruebas de rendimiento te permiten identificar cuellos de botella antes de que afecten a los usuarios, validar la escalabilidad de tus sistemas, asegurar que cumplen con los requisitos de velocidad y capacidad, y optimizar el uso de recursos. Son fundamentales para la fiabilidad, la experiencia del usuario y la planificación de la capacidad.

Hay varios tipos de pruebas de rendimiento:
* **Pruebas de carga (Load Testing):** Simular el número esperado de usuarios o solicitudes para ver cómo se comporta el sistema bajo una carga normal o picos previsibles.
* **Pruebas de estrés (Stress Testing):** Empujar el sistema más allá de sus límites normales para ver cómo se comporta bajo cargas extremas y cómo se recupera.
* **Pruebas de escalabilidad (Scalability Testing):** Evaluar si el sistema puede manejar un aumento en la carga de trabajo de manera eficiente, ya sea añadiendo más recursos (escalado vertical) o más instancias (escalado horizontal).
* **Pruebas de resistencia (Soak Testing / Endurance Testing):** Mantener el sistema bajo una carga continua durante un período prolongado para detectar problemas de fuga de memoria, degradación del rendimiento a largo plazo o manejo incorrecto de recursos.
* **Pruebas de pico (Spike Testing):** Evaluar cómo el sistema reacciona a un aumento repentino y masivo de la carga.

Herramientas comunes para pruebas de rendimiento en Linux:
* **`ab` (ApacheBench):** Una herramienta simple para pruebas de carga HTTP.
* **`JMeter` (Apache JMeter):** Una herramienta robusta y gráfica para pruebas de carga de aplicaciones web y otros servicios.
* **`wrk`:** Una herramienta moderna de pruebas de carga HTTP, muy rápida y eficiente.
* **`iperf`:** Para probar el rendimiento de la red (ancho de banda y latencia).
* **`fio` (Flexible I/O Tester):** Para pruebas de E/S de disco intensivas y personalizables.
* **`sysbench`:** Una herramienta modular para pruebas de referencia de la CPU, la base de datos y la E/S.

Realizar pruebas de rendimiento de forma regular es una parte crucial del ciclo de vida de desarrollo de software y de la gestión de la infraestructura, proporcionando información valiosa para optimizar y asegurar la calidad de tus sistemas.
''',
    'code_example': r'''
# Ejemplo: Pruebas de rendimiento con ab, iperf y fio

# 1. Pruebas de carga HTTP con ApacheBench (ab)
# Instalar apache2-utils si no está presente: sudo apt install apache2-utils -y
# Probar 1000 solicitudes, con una concurrencia de 100, al servidor web local
ab -n 1000 -c 100 http://localhost/

# Resultados clave a buscar:
# Requests per second: El número de solicitudes procesadas por segundo.
# Time per request: Tiempo promedio por solicitud.
# Transfer rate: Tasa de transferencia de datos.
# Percentage of the requests served within a certain time: Distribución de latencia.

# 2. Pruebas de rendimiento de red con iperf3
# Instalar iperf3: sudo apt install iperf3 -y

# En el servidor (server mode):
# iperf3 -s

# En el cliente (client mode, probando hacia el servidor):
# iperf3 -c <IP_DEL_SERVIDOR> -t 10 # Ejecutar durante 10 segundos
# iperf3 -c <IP_DEL_SERVIDOR> -P 5 # Usar 5 flujos paralelos

# 3. Pruebas de rendimiento de E/S de disco con fio
# Instalar fio: sudo apt install fio -y

# Ejemplo: Escribir un archivo de 1GB secuencialmente (prueba de escritura secuencial)
fio --name=seqwrite --ioengine=libaio --rw=write --bs=4k --size=1g --numjobs=1 --iodepth=1 --filename=/tmp/fio_test_file

# Ejemplo: Leer un archivo de 1GB aleatoriamente (prueba de lectura aleatoria)
fio --name=randread --ioengine=libaio --rw=randread --bs=4k --size=1g --numjobs=1 --iodepth=1 --filename=/tmp/fio_test_file

# Resultados clave a buscar:
# IOPS: Operaciones de E/S por segundo.
# Bandwidth: Ancho de banda (MB/s o GB/s).
# Latency: Latencia de las operaciones.

# Ejemplo incorrecto: Ejecutar pruebas de rendimiento en un entorno de producción sin planificación.
# Esto puede causar degradación del servicio o interrupciones para los usuarios reales.
# Siempre usar entornos de prueba o staging que sean lo más parecidos posible a producción.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Monitoreo y Registro',
    'topic': 'Alta Disponibilidad',
    'subtopic': 'Keepalived',
    'definition': r'''
Keepalived es un enrutador de software de código abierto que proporciona alta disponibilidad para servicios críticos. Su principal función es gestionar la asignación de una dirección IP virtual (VIP) entre un grupo de servidores, asegurando que si el servidor primario falla, un servidor secundario tome el control sin interrupciones para el cliente.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en un servidor web o de base de datos que es crítico para tu negocio. Si ese servidor se cae, tu servicio estará inaccesible, lo que se traduce en pérdidas económicas y de reputación. Keepalived soluciona este problema creando un "cluster" de servidores (generalmente dos) donde solo uno está activo para una IP virtual en un momento dado. Si el activo falla, el otro toma su lugar automáticamente, minimizando el tiempo de inactividad. Es fundamental para asegurar la continuidad del servicio en aplicaciones de producción.

Keepalived utiliza el protocolo **VRRP (Virtual Router Redundancy Protocol)** para su funcionamiento. Aquí sus características clave:
* **Dirección IP virtual (VIP):** Se asigna una dirección IP flotante que "se mueve" entre los servidores. Los clientes siempre se conectan a esta VIP, no a las IPs físicas de los servidores.
* **Master/Backup:** Los servidores se configuran en un rol de Maestro (activo) y uno o más Backup (pasivos). El Maestro es el que posee la VIP y responde a las solicitudes.
* **Prioridad:** Cada servidor tiene una prioridad asignada. El servidor con la prioridad más alta se convierte en el Maestro. Si el Maestro actual falla, el Backup con la siguiente prioridad más alta toma el rol.
* **Chequeos de salud (Health Checks):** Keepalived puede monitorear no solo la disponibilidad del servidor (a través de VRRP), sino también la salud de servicios específicos (ej. un servidor web o una base de datos) que se ejecutan en el servidor. Si un servicio crítico falla, Keepalived puede forzar un `failover` incluso si el servidor sigue encendido.
* **Notificaciones:** Puede ejecutar scripts personalizados cuando hay un cambio de estado (ej. un servidor se convierte en Maestro o Backup), lo que permite integrarse con otros sistemas o enviar alertas.

Keepalived es una solución sencilla pero muy efectiva para proporcionar alta disponibilidad a nivel de IP, a menudo utilizada junto con balanceadores de carga como HAProxy o directamente con servidores de aplicaciones.
''',
    'code_example': r'''
# Ejemplo: Keepalived - Configuración básica de Master y Backup

# 1. Configuración para el servidor Master (ej. /etc/keepalived/keepalived.conf)
# vrrp_instance VI_1 {
#     state MASTER             # Este nodo es el Master inicial
#     interface eth0           # Interfaz de red a monitorear
#     virtual_router_id 51     # ID único del router virtual (debe ser el mismo para Master y Backup)
#     priority 101             # Prioridad más alta que el Backup (ej. 101 vs 100)
#     advert_int 1             # Frecuencia de envío de anuncios VRRP (segundos)
#     authentication {
#         auth_type PASS       # Tipo de autenticación (PASS para contraseña simple)
#         auth_pass mysecret   # Contraseña de autenticación (misma en Master y Backup)
#     }
#     virtual_ipaddress {
#         192.168.1.100/24     # La IP virtual (VIP)
#     }
#     notify_master "/etc/keepalived/scripts/notify_master.sh"
#     notify_backup "/etc/keepalived/scripts/notify_backup.sh"
#     notify_fault "/etc/keepalived/scripts/notify_fault.sh"
# }

# 2. Configuración para el servidor Backup (ej. /etc/keepalived/keepalived.conf)
# vrrp_instance VI_1 {
#     state BACKUP             # Este nodo es el Backup
#     interface eth0           # Interfaz de red a monitorear
#     virtual_router_id 51     # ID único del router virtual (debe ser el mismo para Master y Backup)
#     priority 100             # Prioridad más baja que el Master (ej. 100 vs 101)
#     advert_int 1             # Frecuencia de envío de anuncios VRRP (segundos)
#     authentication {
#         auth_type PASS
#         auth_pass mysecret
#     }
#     virtual_ipaddress {
#         192.168.1.100/24     # La IP virtual (VIP)
#     }
#     notify_master "/etc/keepalived/scripts/notify_master.sh"
#     notify_backup "/etc/keepalived/scripts/notify_backup.sh"
#     notify_fault "/etc/keepalived/scripts/notify_fault.sh"
# }

# Script de ejemplo para notify_master.sh (para cuando un nodo se convierte en MASTER)
# #!/bin/bash
# # echo "Soy el nuevo MASTER!" | systemd-cat -t keepalived_notify

# Iniciar o reiniciar Keepalived
# sudo systemctl restart keepalived

# 3. Ejemplo de chequeo de salud (para un servicio Nginx)
# vrrp_script check_nginx {
#     script "killall -0 nginx"  # Check if nginx process is running
#     interval 2                 # Run every 2 seconds
#     weight -20                 # Decrease priority by 20 if check fails
# }
# vrrp_instance VI_1 {
#     ...
#     track_script {
#         check_nginx
#     }
#     ...
# }

# Ejemplo incorrecto: Usar la misma prioridad en Master y Backup.
# Esto podría llevar a una "split-brain" (ambos pensando que son Master)
# o a un comportamiento impredecible. Siempre asegúrate de que el Master tenga una prioridad más alta.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Monitoreo y Registro',
    'topic': 'Alta Disponibilidad',
    'subtopic': 'HAProxy',
    'definition': r'''
HAProxy (High Availability Proxy) es un balanceador de carga de software de código abierto y un proxy TCP/HTTP de alto rendimiento. Se utiliza para distribuir el tráfico de red de manera eficiente entre múltiples servidores, mejorando la disponibilidad, el rendimiento y la fiabilidad de las aplicaciones web y servicios.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en un sitio web muy popular o en una API con millones de usuarios. Un solo servidor no podría manejar toda esa carga. Si ese servidor falla, el servicio se cae. HAProxy soluciona esto distribuyendo las solicitudes entre varios servidores backend, asegurando que ninguna instancia se sobrecargue y que si una falla, el tráfico se redirija automáticamente a las instancias saludables. Es una pieza clave en la arquitectura de cualquier aplicación de alta disponibilidad y escalable.

Las características clave de HAProxy incluyen:
* **Balanceo de carga:** Utiliza varios algoritmos de balanceo de carga (ej. round-robin, least-conn para enviar tráfico al servidor con menos conexiones, source para persistencia de sesión por IP) para distribuir las solicitudes.
* **Chequeos de salud (Health Checks):** Monitorea continuamente la salud de los servidores backend. Si un servidor deja de responder o falla los chequeos, HAProxy lo saca del pool y deja de enviarle tráfico hasta que se recupere.
* **Alta disponibilidad:** Puede configurarse en un modo activo/pasivo (usando Keepalived para la IP virtual) para eliminar un único punto de fallo en el propio balanceador de carga.
* **SSL/TLS Offloading:** Puede terminar las conexiones SSL/TLS en el propio HAProxy, liberando a los servidores backend de esa carga computacional.
* **Conmutación por error (Failover):** Redirige automáticamente el tráfico a los servidores saludables si una instancia falla.
* **Persistencia de sesión:** Puede mantener las conexiones de un usuario al mismo servidor backend, lo cual es importante para aplicaciones que no son "sin estado" (stateless).
* **Capas de red:** Opera en la capa 4 (TCP) para servicios no HTTP (ej. bases de datos) y en la capa 7 (HTTP) para aplicaciones web, permitiendo reglas de enrutamiento basadas en encabezados HTTP, rutas URL, etc.

HAProxy es una herramienta poderosa y versátil, conocida por su rendimiento y estabilidad, siendo una elección popular para balancear el tráfico en la mayoría de los entornos de producción.
''',
    'code_example': r'''
# Ejemplo: HAProxy - Configuración básica de balanceo de carga HTTP

# 1. Configuración de HAProxy (ej. /etc/haproxy/haproxy.cfg)
# global
#     log /dev/log    local0 info
#     chroot /var/lib/haproxy
#     stats socket /run/haproxy/admin.sock mode 660 level admin expose-fd listeners
#     stats timeout 30s
#     user haproxy
#     group haproxy
#     daemon
#     maxconn 20000

# defaults
#     mode http
#     log global
#     option httplog
#     option dontlognull
#     timeout connect 5000ms
#     timeout client 50000ms
#     timeout server 50000ms
#     errorfile 400 /etc/haproxy/errors/400.http
#     errorfile 403 /etc/haproxy/errors/403.http
#     errorfile 408 /etc/haproxy/errors/408.http
#     errorfile 500 /etc/haproxy/errors/500.http
#     errorfile 502 /etc/haproxy/errors/502.http
#     errorfile 503 /etc/haproxy/errors/503.http
#     errorfile 504 /etc/haproxy/errors/504.http

# frontend http_front
#     bind *:80                             # Escuchar en el puerto 80
#     stats uri /haproxy?stats              # Habilitar página de estadísticas
#     stats enable
#     default_backend web_servers           # Backend por defecto

# backend web_servers
#     balance roundrobin                     # Algoritmo de balanceo de carga
#     option httpchk GET /health            # Chequeo de salud HTTP en la ruta /health
#     server web1 192.168.1.10:80 check     # Servidor web 1
#     server web2 192.168.1.11:80 check     # Servidor web 2
#     server web3 192.168.1.12:80 check backup # Servidor web 3 como backup (solo se usa si web1 y web2 fallan)

# 2. Iniciar o reiniciar HAProxy
# sudo systemctl restart haproxy

# 3. Acceder a la página de estadísticas (si está habilitada)
# http://<IP_DE_HAPROXY>/haproxy?stats

# Ejemplo incorrecto: No configurar chequeos de salud.
# HAProxy seguirá enviando tráfico a un servidor caído, lo que resultará en errores para los usuarios.
# También, no configurar un backend de respaldo (`backup`) puede dejar el servicio inaccesible si todos los servidores activos fallan.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Monitoreo y Registro',
    'topic': 'Alta Disponibilidad',
    'subtopic': 'Cluster básico',
    'definition': r'''
Un cluster básico en el contexto de la alta disponibilidad se refiere a un grupo de servidores que trabajan juntos para proporcionar un servicio continuo, incluso si uno o más de ellos fallan. La idea es eliminar los "puntos únicos de fallo" (Single Point of Failure - SPOF) en tu infraestructura.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una base de datos que solo se ejecuta en un servidor. Si ese servidor tiene un fallo de hardware, una interrupción de energía o necesita mantenimiento, la base de datos (y todas las aplicaciones que dependen de ella) dejará de funcionar. Un cluster básico soluciona esto al tener múltiples nodos que pueden tomar el control del servicio si el nodo primario se vuelve inactivo. Esto es fundamental para garantizar que tus aplicaciones y servicios críticos estén siempre disponibles.

Las características clave de un cluster básico para alta disponibilidad incluyen:
* **Nodos (Nodes):** Múltiples servidores que forman parte del cluster. Pueden ser físicos o virtuales.
* **Recursos (Resources):** Los servicios o aplicaciones que se quieren proteger (ej. una IP virtual, un servicio web, un sistema de archivos compartido, una base de datos).
* **Gestor de recursos del cluster:** Una herramienta que coordina los nodos y gestiona los recursos, decidiendo qué nodo es el propietario de un recurso en un momento dado y manejando los `failovers`. Herramientas comunes son Pacemaker/Corosync.
* **Corosync:** Proporciona los mecanismos de comunicación de grupo y de mensajería para que los nodos del cluster se mantengan informados sobre el estado de los demás y formen un quórum.
* **Pacemaker:** Es el gestor de recursos del cluster. Depende de Corosync para la comunicación y se encarga de iniciar, detener, monitorear y migrar los recursos entre los nodos del cluster. Define reglas para los recursos (ej. que un recurso solo pueda ejecutarse en un nodo a la vez, o que dos recursos deban ejecutarse siempre juntos).
* **Cercado (Fencing / STONITH - Shoot The Other Node In The Head):** Un mecanismo crítico para evitar el "cerebro dividido" (split-brain). Si un nodo pierde comunicación con el resto del cluster, el cercado asegura que ese nodo no pueda seguir accediendo a los recursos compartidos (ej. forzando un reinicio del nodo fallido o apagando su puerto de red), evitando la corrupción de datos.

Un cluster básico con Pacemaker y Corosync es una solución robusta y flexible para proporcionar alta disponibilidad a servicios y aplicaciones críticas en entornos Linux.
''',
    'code_example': r'''
# Ejemplo: Cluster básico con Pacemaker y Corosync (conceptual)

# La configuración de Pacemaker y Corosync es compleja y requiere un entorno de laboratorio.
# Este ejemplo ilustra los componentes principales.

# 1. Instalar Corosync y Pacemaker en ambos nodos del cluster
# En sistemas basados en Debian/Ubuntu:
# sudo apt install pacemaker corosync -y
# En sistemas basados en RHEL/CentOS:
# sudo yum install pacemaker corosync -y

# 2. Configuración de Corosync (ej. /etc/corosync/corosync.conf)
# Este archivo define la comunicación entre los nodos.
# totem {
#     version: 2
#     cluster_name: my_ha_cluster
#     secauth: on
#     crypto_cipher: aes256
#     crypto_hash: sha256
#     interface {
#         ring_number: 0
#         bindnetaddr: 192.168.1.0 # La red del cluster
#         mcastaddr: 239.255.1.1
#         mcastport: 5405
#     }
# }
# logging {
#     fileline: off
#     to_syslog: yes
#     to_stderr: no
#     syslog_facility: daemon
#     debug: off
# }
# service {
#     ver: 0
#     name: pacemaker
#     use_mgm: yes
# }

# 3. Configuración de Pacemaker (gestionada con `pcs`)
# Autenticar nodos (en un nodo)
# sudo pcs host auth node1 node2 -u hacluster -p <password_hacluster>

# Crear y habilitar el cluster (en un nodo)
# sudo pcs cluster setup my_ha_cluster node1 node2
# sudo pcs cluster start --all
# sudo pcs property set stonith-enabled=false # Deshabilitar STONITH para pruebas, ¡habilitar en producción!
# sudo pcs property set no-quorum-policy=ignore # Para clusters de 2 nodos, ¡cuidado en producción!

# Añadir un recurso de IP virtual (VIP)
# sudo pcs resource create ClusterIP ocf:heartbeat:IPaddr2 ip=192.168.1.200 cidr_netmask=24 op monitor interval=10s

# Añadir un recurso de servidor web (ej. Nginx)
# sudo pcs resource create WebServer systemd:nginx op monitor interval=20s

# Añadir una restricción de colocación (colocar IP y WebServer en el mismo nodo)
# sudo pcs constraint colocation add WebServer with ClusterIP INFINITY

# Añadir una restricción de orden (iniciar IP antes que WebServer)
# sudo pcs constraint order ClusterIP then WebServer

# Verificar el estado del cluster
# sudo pcs status

# Ejemplo incorrecto: No configurar STONITH (fencing) en un entorno de producción.
# Sin STONITH, en caso de "split-brain" (cuando los nodos pierden comunicación pero siguen funcionando),
# ambos nodos podrían intentar controlar los mismos recursos, llevando a la corrupción de datos o la inestabilidad.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Monitoreo y Registro',
    'topic': 'Alta Disponibilidad',
    'subtopic': 'Failover automático',
    'definition': r'''
El failover automático es la capacidad de un sistema o servicio para cambiar automáticamente de un componente fallido a un componente en espera o redundante, sin intervención manual y con una interrupción mínima o nula para el usuario final. Es la culminación de todas las estrategias de alta disponibilidad.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en un servicio bancario o una plataforma de comercio electrónico. Cualquier tiempo de inactividad, incluso breve, puede significar millones en pérdidas o una gran insatisfacción del cliente. El failover automático es la promesa de la alta disponibilidad: que tus servicios más críticos permanezcan operativos incluso ante fallos inesperados. Es fundamental para la resiliencia del negocio, la satisfacción del cliente y para evitar el pánico en el equipo de operaciones.

El failover automático se logra mediante la combinación de varias tecnologías y estrategias:
* **Detección de fallos:** Un sistema de monitoreo robusto (como Prometheus, chequeos de salud de HAProxy, o monitoreo de recursos en Pacemaker) es crucial para detectar rápidamente cuando un componente falla o su rendimiento se degrada.
* **Redundancia:** Tener múltiples componentes para cada parte crítica de tu infraestructura (ej. dos servidores, dos bases de datos, múltiples instancias de una aplicación). Esto puede ser en configuración activo/pasivo (uno primario, otro en espera) o activo/activo (todos procesando tráfico simultáneamente).
* **Sincronización de datos:** Para componentes con estado (ej. bases de datos, sistemas de archivos), es vital que los datos se repliquen o sincronicen entre los nodos, para que el nodo de respaldo tenga la información más reciente al momento del `failover`.
* **Mecanismos de conmutación (Switchover):** Las herramientas que orquestan el cambio del tráfico o de la propiedad del recurso del componente fallido al componente saludable. Ejemplos incluyen:
    * **Keepalived:** Mueve una IP virtual.
    * **HAProxy:** Saca servidores backend poco saludables del pool.
    * **Pacemaker/Corosync:** Mueve recursos (IPs, servicios) entre nodos del cluster.
    * **DNS Failover:** Cambiar el registro DNS para apuntar a una IP o un balanceador de carga diferente.
    * **Bases de datos:** Replicación maestra-esclava con promoción automática de esclavo a maestro.
* **Manejo de "split-brain":** Como se mencionó en clusters, es fundamental tener mecanismos (fencing/STONITH) para evitar que dos nodos intenten controlar el mismo recurso si pierden comunicación entre sí.
* **Pruebas de `failover`:** Realizar pruebas periódicas de `failover` es tan importante como tener la configuración en su lugar. Esto asegura que el proceso funciona como se espera y que el equipo está preparado para responder.

El failover automático es un objetivo clave en la ingeniería de sistemas distribuidos y DevOps, requiriendo un diseño cuidadoso y una implementación robusta.
''',
    'code_example': r'''
# Ejemplo: Configuración de failover automático (conceptual)

# Un escenario común de failover automático es el de un balanceador de carga
# (HAProxy) con servidores web backend y un cluster de base de datos
# (PostgreSQL con replicación y un failover manager como Patroni).

# 1. Failover a nivel de Balanceador de Carga (HAProxy)
# Configuración en haproxy.cfg (revisado del subtema HAProxy):
# backend web_servers
#     balance roundrobin
#     option httpchk GET /health
#     server web1 192.168.1.10:80 check # Si /health falla, HAProxy saca web1 del pool
#     server web2 192.168.1.11:80 check # HAProxy redirige el tráfico a web2

# 2. Failover de IP virtual para el Balanceador de Carga (Keepalived)
# En el servidor primario de HAProxy (Master):
# vrrp_instance VI_HAPROXY {
#     state MASTER
#     interface eth0
#     virtual_router_id 10
#     priority 101
#     virtual_ipaddress {
#         192.168.1.50/24 # VIP para HAProxy
#     }
#     track_script {
#         check_haproxy_process # Script para verificar si HAProxy está corriendo
#     }
# }

# En el servidor secundario de HAProxy (Backup):
# vrrp_instance VI_HAPROXY {
#     state BACKUP
#     interface eth0
#     virtual_router_id 10
#     priority 100
#     virtual_ipaddress {
#         192.168.1.50/24
#     }
#     track_script {
#         check_haproxy_process
#     }
# }

# Script check_haproxy_process:
# #!/bin/bash
# # if pgrep haproxy > /dev/null; then exit 0; else exit 1; fi

# 3. Failover de Base de Datos (ej. PostgreSQL con Patroni)
# Patroni es un gestor de alta disponibilidad para PostgreSQL que automatiza
# el failover. Se configura con un archivo YAML para cada nodo.

# patroni.yaml (ejemplo simplificado para un nodo)
# scope: my_cluster
# namespace: /service/patroni
# restapi:
#   listen: 0.0.0.0:8008
# postgres:
#   listen: 0.0.0.0:5432
#   data_dir: /var/lib/postgresql/data
#   parameters:
#     max_wal_senders: 10
#     wal_keep_size: 1024MB
# replication:
#   username: replicator
#   password: <replicator_password>
#   network_address: <IP_DEL_NODO>
# tags:
#   nofailover: false # Si es true, el nodo no participará en el failover
#   noloadbalance: false

# Para iniciar Patroni:
# patroni my_patroni_config.yaml

# Patroni monitoreará el estado de los nodos, gestionará la replicación y, si el maestro cae,
# promoverá automáticamente un réplica a nuevo maestro.

# Ejemplo incorrecto: Confiar en el failover manual.
# En situaciones críticas, cada segundo cuenta. Un failover manual puede tardar minutos u horas,
# lo que es inaceptable para la mayoría de los servicios de producción.
'''
  });
}

Future<void> insertMidLevel5DataLinux(Database db) async {
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Automatización y CI/CD',
    'topic': 'Pipelines de CI/CD',
    'subtopic': 'Jenkins básico',
    'definition': r'''
Jenkins es un servidor de automatización de código abierto que facilita la Integración Continua (CI) y la Entrega Continua (CD). Permite automatizar tareas relacionadas con el desarrollo de software, como la compilación de código, la ejecución de pruebas, el despliegue de aplicaciones y la generación de informes.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en un equipo de desarrollo que compila y prueba su código manualmente antes de cada despliegue. Este proceso es tedioso, propenso a errores y ralentiza el ciclo de entrega. Jenkins automatiza todo esto, permitiendo a los desarrolladores integrar sus cambios de código con mayor frecuencia, detectar errores antes y desplegar software de manera más rápida y confiable. Es fundamental para equipos que buscan adoptar prácticas DevOps y acelerar su proceso de desarrollo.

En su nivel básico, Jenkins funciona como un "director de orquesta" para tus tareas de automatización:
* **Jobs/Proyectos:** En Jenkins, cada tarea de automatización se define como un "job" o "proyecto". Un job puede ser un "Freestyle project" (configuración manual), un "Pipeline" (código que define el pipeline) o un "Multibranch Pipeline" (detecta ramas en tu repositorio y crea pipelines para cada una).
* **Plugins:** Jenkins es altamente extensible gracias a su vasta comunidad de plugins. Hay plugins para integración con sistemas de control de versiones (Git, SVN), herramientas de compilación (Maven, Gradle), herramientas de prueba, servicios en la nube (AWS, Azure, GCP), notificaciones (Slack, email) y mucho más.
* **Master/Agent (antes Master/Slave):** Un servidor Jenkins Master gestiona los jobs y coordina la ejecución. Los Agentes son máquinas separadas que ejecutan las tareas reales, lo que permite escalar la capacidad de construcción y aislar entornos.
* **Build Triggers:** Define cuándo debe ejecutarse un job. Puede ser manual, programado, después de otro job, o cuando se detectan cambios en el repositorio de código (webhook).
* **Consola de Salida:** Cada ejecución de un job tiene una "Consola de Salida" donde puedes ver los logs en tiempo real de lo que está sucediendo.

Aunque Jenkins puede parecer abrumador al principio por su flexibilidad y cantidad de plugins, comprender sus conceptos básicos te permitirá automatizar una gran parte de tu flujo de trabajo de desarrollo y entrega.
''',
    'code_example': r'''
# Ejemplo: Jenkins básico - Configuración de un "Freestyle Project" (conceptual)

# No hay comandos de CLI directa para configurar un Freestyle Project en Jenkins,
# ya que se hace principalmente a través de la interfaz web.
# Sin embargo, aquí se describe el proceso que se podría automatizar con la API de Jenkins
# o un script de Groovy si se necesitara.

# Pasos típicos para configurar un Freestyle Project en la UI de Jenkins:

# 1. Crear un nuevo Job:
#    - En la interfaz web de Jenkins (ej. http://localhost:8080), haz clic en "New Item".
#    - Dale un nombre (ej. "MiPrimerProyectoCI").
#    - Selecciona "Freestyle project" y haz clic en "OK".

# 2. Configuración del Repositorio de Código Fuente:
#    - En la sección "Source Code Management", selecciona "Git".
#    - Introduce la URL de tu repositorio Git (ej. https://github.com/tu-usuario/tu-repo.git).
#    - (Opcional) Si el repositorio es privado, añade credenciales SSH o usuario/contraseña.
#    - Especifica la rama a construir (ej. `*/main` o `*/master`).

# 3. Configuración del Trigger de Construcción:
#    - En la sección "Build Triggers", marca "Poll SCM".
#    - En "Schedule", introduce un patrón de cron para verificar cambios en el repositorio (ej. `H/5 * * * *` para cada 5 minutos).
#    - (Alternativa) Para Integración Continua real, configura un webhook en tu repositorio de Git (GitHub, GitLab)
#      para que notifique a Jenkins sobre cada push.

# 4. Configuración del Paso de Construcción (Build Step):
#    - En la sección "Build", haz clic en "Add build step".
#    - Selecciona "Execute shell" (para Linux) o "Execute Windows batch command" (para Windows).
#    - Introduce los comandos que tu proyecto necesita para compilar y probar.
#      Por ejemplo, para un proyecto Python:
#      ```bash
#      echo "Compilando y ejecutando pruebas..."
#      pip install -r requirements.txt
#      python setup.py build
#      pytest tests/
#      echo "Construcción finalizada."
#      ```
#      Para un proyecto Java con Maven:
#      ```bash
#      echo "Compilando y ejecutando pruebas con Maven..."
#      mvn clean install
#      echo "Construcción finalizada."
#      ```

# 5. Post-build Actions (Opcional):
#    - Puedes añadir acciones después de la construcción, como enviar notificaciones por correo electrónico,
#      publicar resultados de pruebas, o desplegar artefactos.

# 6. Guardar y Construir:
#    - Haz clic en "Save".
#    - Luego, puedes hacer clic en "Build Now" para ejecutar el job manualmente y ver los resultados en la "Console Output".

# Ejemplo incorrecto: No instalar las herramientas necesarias (Java, Python, Maven, etc.) en el Jenkins Agent.
# El job fallará porque no encontrará los comandos para compilar o ejecutar las pruebas.
# También, no configurar la seguridad de Jenkins y dejarlo expuesto públicamente.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Automatización y CI/CD',
    'topic': 'Pipelines de CI/CD',
    'subtopic': 'GitLab CI',
    'definition': r'''
GitLab CI (Continuous Integration) es un servicio de CI/CD integrado directamente en GitLab. Permite definir pipelines de automatización para construir, probar y desplegar tu código directamente desde tu repositorio de GitLab, utilizando un archivo de configuración (`.gitlab-ci.yml`) en la raíz del proyecto.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en la fricción de tener un sistema de control de versiones y una herramienta de CI/CD por separado. GitLab CI elimina esa barrera, ofreciéndote una solución "todo en uno" que simplifica enormemente la configuración y gestión de tus pipelines. Los desarrolladores pueden ver el estado de su CI/CD directamente en las solicitudes de fusión (Merge Requests), lo cual es fundamental para flujos de trabajo eficientes y colaborativos.

GitLab CI opera a través de "Runners" que ejecutan las tareas definidas en tu pipeline:
* **`.gitlab-ci.yml`:** Es el corazón de tu pipeline. Este archivo YAML se coloca en la raíz de tu repositorio y define las etapas (stages), los jobs y las acciones a realizar en cada etapa.
* **Stages:** Son colecciones de jobs que se ejecutan en paralelo. Los stages se ejecutan en orden secuencial (ej. `build`, `test`, `deploy`). Si un job en un stage falla, el pipeline se detiene por defecto.
* **Jobs:** Son las unidades de trabajo individuales dentro de un stage. Un job define qué script se debe ejecutar, qué Docker image usar, qué dependencias necesita, etc.
* **Runners:** Son los agentes que ejecutan los jobs. GitLab proporciona "Shared Runners" que puedes usar, o puedes configurar tus propios "Specific Runners" (en tu infraestructura, en la nube, en Kubernetes) para tener más control o requisitos específicos.
* **Artifacts:** Los jobs pueden generar artefactos (archivos, reportes) que pueden ser descargados o pasados a jobs posteriores en el pipeline.
* **Cache:** Permite almacenar directorios para su reutilización entre ejecuciones de jobs, acelerando las compilaciones (ej. dependencias de paquetes).
* **Variables:** Puedes definir variables de entorno, tanto en el archivo `.gitlab-ci.yml` como en la configuración de CI/CD del proyecto en GitLab, para almacenar información sensible o configuraciones.

GitLab CI es una solución potente para equipos que ya utilizan GitLab para su control de versiones, proporcionando una experiencia de CI/CD fluida y altamente integrada.
''',
    'code_example': r'''
# Ejemplo: GitLab CI - Un pipeline básico para un proyecto Python

# Archivo: .gitlab-ci.yml (en la raíz de tu repositorio GitLab)

# Define la imagen base de Docker para todos los jobs
image: python:3.9-slim-buster

# Define las etapas (stages) del pipeline
stages:
  - build
  - test
  - deploy

# Job: build_app
# Se ejecuta en la etapa 'build'
build_app:
  stage: build
  script:
    - echo "Instalando dependencias..."
    - pip install -r requirements.txt
    - echo "Dependencias instaladas."
  artifacts:
    paths:
      - venv/ # Guardar el entorno virtual para que sea reutilizado en otros jobs
    expire_in: 1 hour # Caducidad de los artefactos
  cache:
    key: ${CI_COMMIT_REF_SLUG} # Clave de caché basada en la rama
    paths:
      - venv/ # Directorio a cachear
    policy: pull-push # Descargar si existe, subir al finalizar

# Job: run_tests
# Se ejecuta en la etapa 'test'
# Necesita los artefactos del job 'build_app'
run_tests:
  stage: test
  script:
    - echo "Ejecutando pruebas..."
    - source venv/bin/activate # Activar el entorno virtual si fue guardado como artefacto
    - pytest tests/
    - echo "Pruebas finalizadas."
  dependencies:
    - build_app # Depende del job 'build_app'

# Job: deploy_to_staging
# Se ejecuta en la etapa 'deploy'
# Solo se ejecuta en la rama 'main' (o 'master')
deploy_to_staging:
  stage: deploy
  script:
    - echo "Desplegando a staging..."
    - echo "Simulando comando de despliegue: ansible-playbook deploy.yml --extra-vars 'env=staging'"
  only:
    - main # Solo se ejecuta cuando hay un push a la rama 'main'

# Ejemplo incorrecto: No definir stages o poner jobs en el orden incorrecto.
# Si el job 'test' se ejecuta antes que el job 'build', fallará porque las dependencias no estarán instaladas.
# También, no especificar una imagen de Docker adecuada para el entorno del job.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Automatización y CI/CD',
    'topic': 'Pipelines de CI/CD',
    'subtopic': 'GitHub Actions',
    'definition': r'''
GitHub Actions es una plataforma de CI/CD nativa de GitHub que te permite automatizar flujos de trabajo de desarrollo de software directamente en tu repositorio. Con GitHub Actions, puedes construir, probar y desplegar código, así como automatizar cualquier tarea dentro de tu ciclo de vida de desarrollo.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en tener tu código en GitHub y tener que integrar una herramienta de CI/CD externa. GitHub Actions elimina esa complejidad al estar completamente integrado. Esto significa que puedes configurar tus pipelines directamente en tu repositorio, y los desarrolladores pueden ver el estado de sus construcciones y despliegues directamente en la interfaz de GitHub, lo que agiliza el desarrollo y la colaboración.

Las principales características de GitHub Actions se basan en "workflows":
* **Workflows:** Son los pipelines de CI/CD definidos en archivos YAML (`.github/workflows/*.yml`) dentro de tu repositorio. Un workflow se activa por eventos de GitHub (push, pull request, release, etc.).
* **Eventos:** Son los disparadores que inician un workflow. Los eventos comunes incluyen `push`, `pull_request`, `schedule`, `workflow_dispatch` (manual), `release`, etc.
* **Jobs:** Un workflow consta de uno o más jobs. Cada job se ejecuta en un entorno virtual nuevo y limpio (o en un `runner` auto-alojado). Los jobs pueden ejecutarse en paralelo o en secuencia (dependiendo de la configuración).
* **Steps:** Dentro de cada job, hay una secuencia de pasos. Un paso puede ejecutar comandos de shell o utilizar "Actions".
* **Actions:** Son unidades de código reutilizables y empaquetadas que realizan una tarea específica (ej. `actions/checkout` para clonar el repositorio, `actions/setup-node` para configurar Node.js). Puedes usar Actions de la comunidad, de GitHub o crear las tuyas propias.
* **Runners:** Son las máquinas virtuales o contenedores que ejecutan tus jobs. GitHub proporciona "GitHub-hosted runners" (Linux, Windows, macOS) que son máquinas virtuales en la nube, o puedes configurar "self-hosted runners" en tu propia infraestructura.
* **Secrets:** Para manejar información sensible (claves API, credenciales), GitHub Actions permite almacenar "secrets" en la configuración del repositorio, que se inyectan como variables de entorno en los jobs de forma segura.

GitHub Actions es una opción muy popular para equipos que ya están en el ecosistema de GitHub, ofreciendo una solución de CI/CD potente, flexible y bien integrada.
''',
    'code_example': r'''
# Ejemplo: GitHub Actions - Un workflow básico para un proyecto Node.js

# Archivo: .github/workflows/ci.yml (en la raíz de tu repositorio)

name: Node.js CI/CD # Nombre del workflow

on: # Eventos que disparan el workflow
  push:
    branches: [ "main" ] # Al hacer push a la rama 'main'
  pull_request:
    branches: [ "main" ] # Al abrir un pull request a la rama 'main'
  workflow_dispatch: {} # Permite ejecutar el workflow manualmente desde la interfaz de GitHub

jobs: # Define los jobs del workflow
  build-and-test: # Nombre del primer job
    runs-on: ubuntu-latest # El runner donde se ejecutará este job (VM Ubuntu de GitHub)

    steps: # Los pasos del job
    - uses: actions/checkout@v4 # Action para clonar el repositorio
    - name: Use Node.js # Nombre del paso
      uses: actions/setup-node@v4 # Action para configurar Node.js
      with:
        node-version: '20.x' # Versión de Node.js a usar
        cache: 'npm' # Habilitar caché para npm

    - name: Install dependencies
      run: npm ci # Instalar dependencias

    - name: Run tests
      run: npm test # Ejecutar pruebas

  deploy-to-staging: # Nombre del segundo job
    needs: build-and-test # Este job depende de que 'build-and-test' se complete con éxito
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/main' && github.event_name == 'push' # Condición para ejecutar este job
    environment: staging # Asocia este job a un entorno de despliegue en GitHub (para protección)

    steps:
    - uses: actions/checkout@v4
    - name: Deploy to Staging
      run: |
        echo "Desplegando a staging..."
        # Aquí irían los comandos de despliegue real, por ejemplo:
        # ssh -i ~/.ssh/deploy_key -o StrictHostKeyChecking=no user@your-staging-server "cd /var/www/app && git pull && npm install && pm2 restart app"
        # O un comando para desplegar a un servicio de la nube (AWS S3, Azure Web Apps, Google Cloud Run)
        echo "Despliegue a staging finalizado."
      env:
        # Ejemplo de cómo usar un secreto (definido en Settings -> Secrets del repositorio)
        # DEPLOY_KEY: ${{ secrets.SSH_PRIVATE_KEY }}
        STAGING_ENV_VAR: ${{ secrets.STAGING_API_KEY }}

# Ejemplo incorrecto: No usar 'needs' para encadenar jobs secuenciales.
# Si 'deploy-to-staging' no tuviera `needs: build-and-test`, podría intentar desplegar
# incluso si las pruebas fallaron en el job anterior.
# También, no usar secrets para credenciales sensibles y hardcodearlas en el archivo.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Automatización y CI/CD',
    'topic': 'Pipelines de CI/CD',
    'subtopic': 'Estrategias de despliegue',
    'definition': r'''
Las estrategias de despliegue son diferentes enfoques y técnicas para lanzar nuevas versiones de software en un entorno de producción. No se trata solo de "copiar y pegar" archivos, sino de minimizar el riesgo, el tiempo de inactividad y asegurar una transición suave para los usuarios.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una actualización de un sistema crítico que podría tener errores inesperados o romper la experiencia del usuario. Un mal despliegue puede resultar en horas de inactividad, pérdidas económicas y una mala reputación. Las estrategias de despliegue minimizan estos riesgos, permitiéndote liberar nuevas características y correcciones de errores de manera segura y eficiente, lo cual es fundamental para mantener la continuidad del negocio y la satisfacción del cliente.

Algunas de las estrategias de despliegue más comunes incluyen:
* **Despliegue Recrear (Recreate):** La estrategia más simple. La versión antigua de la aplicación se detiene completamente, se elimina, y luego se despliega la nueva versión.
    * **Ventajas:** Fácil de implementar, no requiere configuración compleja.
    * **Desventajas:** Hay tiempo de inactividad (downtime) durante el despliegue. No es adecuada para aplicaciones de misión crítica.
* **Despliegue Rolling Update (Actualización por fases):** La estrategia más común en entornos modernos. Las instancias de la nueva versión se despliegan gradualmente, reemplazando una por una las instancias de la versión antigua. Un balanceador de carga redirige el tráfico a las instancias actualizadas.
    * **Ventajas:** Cero tiempo de inactividad, control gradual del riesgo, fácil reversión.
    * **Desventajas:** Requiere que la nueva y la antigua versión sean compatibles (no romper la API o el esquema de la base de datos). El `rollback` puede ser lento si hay muchas instancias.
* **Despliegue Azul/Verde (Blue/Green Deployment):** Se mantienen dos entornos de producción idénticos: el "azul" (versión antigua) y el "verde" (nueva versión). El tráfico se cambia del azul al verde de una sola vez (o gradualmente).
    * **Ventajas:** `Rollback` instantáneo a la versión azul si hay problemas. Cero tiempo de inactividad.
    * **Desventajas:** Requiere el doble de infraestructura. La replicación de datos entre entornos puede ser compleja.
* **Despliegue Canary (Canary Release):** Una variante del Azul/Verde. Se despliega la nueva versión a un pequeño subconjunto de usuarios (o servidores) para probarla en producción real antes de lanzarla a todos. Si no hay problemas, se extiende gradualmente al resto.
    * **Ventajas:** Minimiza el impacto de posibles errores en una nueva versión. Permite pruebas en producción con un grupo limitado.
    * **Desventajas:** Requiere un monitoreo muy robusto para detectar problemas rápidamente. Puede ser complejo de implementar.
* **Despliegue por Característica (Feature Flag / Toggle):** En lugar de desplegar una versión completamente nueva, las características se habilitan o deshabilitan dinámicamente en tiempo de ejecución a través de "feature flags".
    * **Ventajas:** Despliegues continuos, riesgo mínimo por característica, control granular de quién ve qué.
    * **Desventajas:** Requiere una infraestructura de `feature flags` en la aplicación. Puede añadir complejidad al código.

Elegir la estrategia de despliegue adecuada depende de la tolerancia al riesgo, la complejidad de la aplicación y la infraestructura disponible. La automatización de estas estrategias a través de pipelines de CI/CD es clave para su éxito.
''',
    'code_example': r'''
# Ejemplo: Estrategias de despliegue - Ilustración conceptual en un pipeline CI/CD

# No hay un único comando de shell que represente una estrategia de despliegue
# completa, ya que estas son metodologías que involucran múltiples herramientas
# (balanceadores de carga, Kubernetes, etc.) y pasos en un pipeline.

# Aquí se ilustran fragmentos de código o lógica que podrían usarse en un pipeline
# (ej. en GitLab CI o GitHub Actions) para implementar diferentes estrategias.

# --- Estrategia: Recreate (simplificado, para un despliegue sin Docker) ---
# Este es un enfoque de "detener y reemplazar".
# deploy_recreate:
#   stage: deploy
#   script:
#     - echo "Deteniendo el servicio antiguo..."
#     - sudo systemctl stop mywebapp # Detener el servicio antiguo
#     - echo "Borrando versión antigua..."
#     - sudo rm -rf /var/www/mywebapp_old # Borrar archivos antiguos
#     - echo "Copiando nueva versión..."
#     - sudo cp -r ./build /var/www/mywebapp # Copiar la nueva versión
#     - echo "Iniciando el nuevo servicio..."
#     - sudo systemctl start mywebapp # Iniciar el nuevo servicio
#     - echo "Despliegue recrear completado. HUBI DOWNTIME."

# --- Estrategia: Rolling Update (con Kubernetes/kubectl) ---
# Kubernetes gestiona el rolling update por defecto para Deployments.
# deploy_rolling_update_kubernetes:
#   stage: deploy
#   script:
#     - echo "Aplicando actualización gradual a Kubernetes..."
#     - kubectl set image deployment/my-app my-app=my-repo/my-app:new-version # Kubernetes actualiza pods uno a uno
#     - kubectl rollout status deployment/my-app # Esperar a que el rollout termine
#     - echo "Rolling update completado (cero downtime)."

# --- Estrategia: Blue/Green Deployment (con balanceador de carga y dos entornos) ---
# Esto requeriría una configuración externa del balanceador de carga.
# Imaginemos que tenemos dos URLs/servicios, 'blue' y 'green'.

# deploy_blue_green:
#   stage: deploy
#   script:
#     - echo "Desplegando nueva versión al entorno 'green'..."
#     # Aquí irían los comandos para desplegar al entorno 'green'
#     - echo "Verificando el entorno 'green'..."
#     - curl -f http://green.my-app.com/health # Asegurarse de que 'green' está sano
#     - echo "Cambiando el tráfico del balanceador de carga de 'blue' a 'green'..."
#     # Este es el paso crítico. Aquí se ejecutaría un comando para el balanceador de carga (ej. HAProxy, Nginx, cloud load balancer)
#     # o una API para cambiar el enrutamiento.
#     # Por ejemplo (conceptual para un balanceador):
#     # api_call_to_loadbalancer switch_traffic_to_green_env
#     - echo "Tráfico cambiado. Blue/Green deployment completado."
#     - echo "Manteniendo entorno 'blue' como rollback."

# --- Estrategia: Canary Deployment (conceptual) ---
# Requiere un balanceador de carga avanzado o un service mesh (Istio, Linkerd).
# deploy_canary:
#   stage: deploy
#   script:
#     - echo "Desplegando nueva versión (canary) a un pequeño porcentaje de usuarios..."
#     # Desplegar a un conjunto de pods/servidores marcados como 'canary'
#     # Configurar el balanceador de carga para enviar 5% del tráfico a 'canary'
#     - echo "Monitoreando el rendimiento de 'canary' durante X minutos..."
#     - sleep 300 # Esperar 5 minutos para monitorear
#     # Aquí irían checks de monitoreo para decidir si el canary es exitoso
#     - if [ "$CANARY_SUCCESS" == "true" ]; then
#         echo "Canary exitoso. Escalando despliegue al 100%..."
#         # Comando para escalar el tráfico a la nueva versión
#       else
#         echo "Problemas detectados en canary. Revirtiendo..."
#         # Comando para revertir el tráfico a la versión antigua
#       fi

# Ejemplo incorrecto: No tener un plan de rollback para ninguna de estas estrategias.
# Si algo sale mal, necesitas poder revertir a la versión anterior de forma rápida y segura.
# Siempre piensa en cómo deshacer el despliegue si es necesario.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module':
        'Mid', // Asumo "Mid" ya que los niveles 4 y 5 del PDF son del módulo intermedio
    'level': 5,
    'title_level':
        'Automatización y CI/CD', // Título de nivel, siguiendo el ejemplo anterior
    'topic': 'Configuración Automatizada',
    'subtopic': 'Puppet básico',
    'definition': r'''
Puppet es una herramienta de código abierto para la gestión de configuración, diseñada para automatizar la administración de sistemas en grandes infraestructuras. Permite definir la configuración deseada de tus servidores (software a instalar, servicios a ejecutar, archivos a crear) en un lenguaje declarativo, y luego se asegura de que esos servidores cumplan y mantengan esa configuración.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en tener docenas o cientos de servidores que necesitan tener el mismo software instalado, las mismas configuraciones de red o los mismos permisos de archivos. Hacer esto manualmente es un dolor de cabeza, propenso a errores y muy lento. Puppet soluciona esto permitiéndote definir la configuración "una vez" y aplicarla a todos tus servidores de forma automatizada, garantizando consistencia, reduciendo errores y liberando tiempo para tareas más importantes. Es fundamental para la escalabilidad y la fiabilidad de tu infraestructura.

Puppet funciona con una arquitectura Maestro-Agente (Master-Agent):
* **Puppet Master:** Es el servidor central que almacena todas las configuraciones ("manifests"). Los agentes se conectan a él para solicitar su configuración.
* **Puppet Agent:** Es un demonio que se ejecuta en cada servidor cliente. Periódicamente (por defecto, cada 30 minutos), el agente se conecta al Master, envía información sobre su estado actual ("facter facts") y solicita su configuración.
* **Manifests (.pp files):** Son los archivos donde se define la configuración deseada de los nodos usando el lenguaje declarativo de Puppet. Contienen recursos (packages, services, files) y sus atributos.
* **Resources:** Son los elementos básicos que Puppet gestiona (ej. un paquete `nginx` debe estar instalado, un servicio `apache2` debe estar corriendo, un archivo `/etc/hosts` debe tener cierto contenido).
* **Facter:** Una herramienta que se ejecuta en el agente para recolectar "facts" (hechos) sobre el nodo (ej. sistema operativo, IP, memoria RAM). Estos hechos son enviados al Master y pueden ser usados para tomar decisiones de configuración.
* **Catalog:** El Master compila un "catalog" para cada agente, que es un documento JSON que describe el estado final deseado del nodo. El agente aplica este catalog.
* **Idempotencia:** Una característica clave de Puppet. Significa que aplicar la misma configuración múltiples veces siempre resultará en el mismo estado final, sin efectos secundarios no deseados.

Puppet es una herramienta robusta para la gestión de configuración a escala, ideal para entornos complejos donde la consistencia y la automatización son prioritarias.
''',
    'code_example': r'''
# Ejemplo: Puppet básico - Instalar Nginx y asegurar que el servicio esté corriendo

# 1. Archivo de configuración en el Puppet Master (ej. /etc/puppetlabs/code/environments/production/manifests/site.pp)

# Define el nodo 'webserver01.example.com' y aplica la clase 'nginx'
# node 'webserver01.example.com' {
#   include nginx
# }

# Define la clase 'nginx' que describe el estado deseado
# class nginx {
#   package { 'nginx': # Recurso de tipo 'package'
#     ensure => 'installed', # Asegurar que Nginx esté instalado
#   }

#   service { 'nginx': # Recurso de tipo 'service'
#     ensure => 'running',   # Asegurar que el servicio Nginx esté corriendo
#     enable => true,        # Asegurar que el servicio Nginx se inicie al arrancar
#     require => Package['nginx'], # Asegurar que el paquete Nginx esté instalado antes de iniciar el servicio
#   }

#   file { '/etc/nginx/nginx.conf': # Recurso de tipo 'file' para un archivo de configuración
#     ensure  => file,       # Asegurar que sea un archivo
#     owner   => 'root',
#     group   => 'root',
#     mode    => '0644',
#     content => template('nginx/nginx.conf.erb'), # Usar una plantilla ERB para el contenido
#     notify  => Service['nginx'], # Notificar al servicio Nginx si el archivo cambia (para reiniciar)
#   }
# }

# 2. Archivo de plantilla (ej. /etc/puppetlabs/code/environments/production/modules/nginx/templates/nginx.conf.erb)
# Este es un archivo de plantilla ERB (Embedded Ruby) para nginx.conf
# worker_processes <%= @facts['processors']['count'] %>;
# events {
#     worker_connections 1024;
# }
# http {
#     include       mime.types;
#     default_type  application/octet-stream;
#     sendfile        on;
#     keepalive_timeout  65;
#     server {
#         listen       80;
#         server_name  localhost;
#         location / {
#             root   /usr/share/nginx/html;
#             index  index.html index.htm;
#         }
#     }
# }

# 3. En el agente Puppet (servidor cliente):
# Instalar el agente Puppet (varía según la distribución)
# sudo apt install puppet-agent -y # En Debian/Ubuntu
# sudo yum install puppet-agent -y # En RHEL/CentOS

# Configurar el agente para que apunte al Master
# sudo puppet config set server puppet.example.com --section main

# Firmar el certificado del agente en el Master (una vez)
# sudo puppetserver ca sign --all # O por nombre de host

# Ejecutar el agente para aplicar la configuración
# sudo puppet agent -t

# Ejemplo incorrecto: No definir dependencias entre recursos (ej. service requiere package).
# Si el servicio Nginx intenta iniciarse antes de que el paquete esté instalado, el Puppet Agent fallará
# y no podrá aplicar la configuración deseada de manera consistente.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Automatización y CI/CD',
    'topic': 'Configuración Automatizada',
    'subtopic': 'Chef básico',
    'definition': r'''
Chef es una potente herramienta de automatización para la gestión de configuración, que utiliza un enfoque basado en código para definir, desplegar y gestionar la infraestructura. Permite describir la "receta" para tus servidores utilizando un DSL (Domain Specific Language) basado en Ruby, lo que te da una gran flexibilidad y control.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en la necesidad de tener tus servidores configurados de forma idéntica en diferentes entornos (desarrollo, staging, producción) o la complejidad de escalar tu infraestructura. Chef te permite tratar tu infraestructura como código (Infrastructure as Code - IaC), lo que significa que tus configuraciones son versionadas, probables y reproducibles. Esto es fundamental para la agilidad, la fiabilidad y la automatización de la infraestructura a gran escala.

Chef opera con un modelo Maestro-Agente (Chef Server - Chef Client) o en modo Standalone (Chef Solo):
* **Chef Server:** Es el hub central que almacena tus "cookbooks", "recipes" y "node attributes". Los "Chef Clients" se comunican con él para obtener sus configuraciones.
* **Chef Client (o `chef-client`):** Se ejecuta en cada servidor que se desea gestionar. Recoge información del nodo, la envía al Chef Server, descarga las "recipes" asignadas a ese nodo y las ejecuta para aplicar la configuración.
* **Cookbooks:** Son las unidades fundamentales de la configuración en Chef. Un cookbook es un directorio que contiene "recipes", archivos, plantillas, atributos y metadata, todo lo necesario para configurar un componente (ej. un cookbook para Nginx, otro para MySQL).
* **Recipes (.rb files):** Son los archivos Ruby dentro de un cookbook que contienen la lógica de configuración real. Definen los recursos (packages, services, files) y sus acciones.
* **Resources:** Son las primitivas que Chef usa para interactuar con el sistema (ej. `package 'apache2'`, `service 'nginx'`, `file '/etc/hosts'`). Chef es idempotente, lo que significa que si el estado deseado ya existe, no hará nada.
* **Attributes:** Son valores específicos que se pueden usar en las recipes para personalizar la configuración por nodo o por entorno.
* **Nodes:** Representan los servidores gestionados por Chef. Cada nodo tiene atributos que describen su estado (ej. IP, sistema operativo).
* **Run List:** Una lista de "recipes" y/o "cookbooks" que se aplicarán a un nodo.

Chef, con su enfoque de "infraestructura como código", ofrece un control muy granular y programático sobre tus configuraciones, lo que lo hace muy potente para entornos complejos y necesidades de automatización avanzadas.
''',
    'code_example': r'''
# Ejemplo: Chef básico - Instalar Apache y crear un archivo HTML simple

# 1. Crear un Cookbook (en tu máquina de desarrollo o Chef Workstation)
# chef generate cookbook webserver
# Esto crea la estructura de directorios:
# webserver/
# ├── recipes/
# │   └── default.rb
# ├── metadata.rb
# └── ... (otros directorios)

# 2. Definir la Recipe (ej. webserver/recipes/default.rb)
# Esto instala Apache y asegura que el servicio esté corriendo.
# package 'apache2' do # Recurso de tipo 'package'
#   action :install     # Asegurar que el paquete esté instalado
# end

# service 'apache2' do # Recurso de tipo 'service'
#   action [:enable, :start] # Habilitar para el inicio y asegurar que esté corriendo
# end

# file '/var/www/html/index.html' do # Recurso de tipo 'file' para crear un archivo
#   content '<h1>Hola desde Chef!</h1>' # Contenido del archivo
#   mode '0644' # Permisos del archivo
#   owner 'root'
#   group 'root'
# end

# 3. Actualizar metadata.rb (ej. webserver/metadata.rb)
# name 'webserver'
# version '0.1.0'
# description 'Installs and configures a basic webserver'

# 4. Subir el Cookbook al Chef Server (si estás usando Chef Server)
# knife cookbook upload webserver

# 5. Aplicar la Recipe a un nodo (en el nodo cliente)
# Primero, asegúrate de que el Chef Client está instalado y configurado para comunicarse con el Chef Server.
# Luego, añade la recipe al 'run list' del nodo:
# knife node run_list add mynode 'recipe[webserver]'

# Finalmente, ejecuta el Chef Client en el nodo:
# sudo chef-client

# --- Modo Standalone (Chef Solo) ---
# Si no usas un Chef Server, puedes ejecutarlo localmente con Chef Solo.
# Primero, descarga el cookbook a tu nodo y crea un archivo 'solo.rb' y 'node.json'.
# solo.rb:
# cookbook_path "/path/to/your/cookbooks"
# node.json:
# {
#   "run_list": ["recipe[webserver]"]
# }
# sudo chef-solo -c solo.rb -j node.json

# Ejemplo incorrecto: Intentar ejecutar una recipe sin que las dependencias necesarias
# (ej. Apache ya instalado para el servicio) estén resueltas por Chef.
# Aunque Chef es idempotente, si hay errores en los atributos o nombres de recursos,
# la configuración no se aplicará correctamente.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Automatización y CI/CD',
    'topic': 'Configuración Automatizada',
    'subtopic': 'SaltStack básico',
    'definition': r'''
SaltStack es una plataforma de automatización de código abierto basada en Python, conocida por su velocidad, escalabilidad y flexibilidad. Permite la gestión de configuración, la orquestación de tareas y la ejecución remota de comandos en miles de servidores de forma eficiente.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en la necesidad de ejecutar comandos instantáneamente en cientos de servidores o la gestión de configuración en tiempo real. SaltStack se diferencia por su comunicación basada en ZeroMQ, lo que le permite enviar comandos a gran velocidad a sus agentes. Esto es fundamental para despliegues rápidos, respuesta a incidentes y una gestión de infraestructura dinámica.

SaltStack opera principalmente con una arquitectura Maestro-Minion:
* **Salt Master:** Es el servidor central que controla la infraestructura. Envía comandos y configuraciones a los "minions".
* **Salt Minion:** Es un agente ligero que se ejecuta en cada servidor gestionado. Se comunica con el Master, recibe instrucciones y las ejecuta.
* **States (.sls files):** Son los archivos de configuración declarativos en formato YAML que describen el estado deseado de un sistema (ej. `nginx.sls` para instalar Nginx). Los estados son idempotentes.
* **Formulas:** Son colecciones de "states" y "pillars" organizadas en directorios, típicamente para configurar una aplicación o un servicio completo (ej. una fórmula Nginx).
* **Pillars:** Son datos estructurados (también en YAML) que se distribuyen de forma segura a los minions. Se utilizan para almacenar información sensible o específica del nodo (ej. contraseñas de bases de datos, nombres de usuario, IPs).
* **Grains:** Son datos estáticos sobre el minion (similares a los facts de Puppet o los attributes de Chef). Los minions reportan sus grains al Master (ej. sistema operativo, versión del kernel, CPU cores).
* **Jinja2:** Un motor de plantillas que se utiliza comúnmente en los "states" para hacer las configuraciones dinámicas usando "grains" y "pillars".
* **Execution Modules:** Son las funciones que Salt utiliza para realizar acciones específicas en el sistema (ej. `pkg.install`, `service.running`, `file.managed`).
* **Targeting:** La capacidad de seleccionar minions específicos para ejecutar comandos o aplicar estados, utilizando criterios como nombre de host, grains, IPs, etc.

SaltStack es una herramienta poderosa para la automatización, ideal para entornos que requieren alta velocidad, escalabilidad y una fuerte capacidad de ejecución remota.
''',
    'code_example': r'''
# Ejemplo: SaltStack básico - Instalar Nginx y asegurar que el servicio esté corriendo

# 1. Configuración de un Salt State (ej. /srv/salt/nginx/init.sls)

# Este archivo define que el paquete Nginx debe estar instalado y el servicio corriendo.
# nginx:
#   pkg.installed: [] # Asegurar que el paquete 'nginx' esté instalado
#   service.running: # Asegurar que el servicio 'nginx' esté corriendo
#     - enable: True # Habilitar para el inicio
#     - require: # Definir dependencia: el servicio requiere el paquete
#       - pkg: nginx

# 2. Configuración de un Pillar (ej. /srv/pillar/webapps.sls)
# Los pillars se usan para datos sensibles o variables.
# webapps:
#   nginx_port: 80
#   welcome_message: "Bienvenido a mi servidor web!"

# 3. Mapear Pillar al Minion (en /etc/salt/master, en la sección 'pillar_roots')
# pillar_roots:
#   base:
#     - /srv/pillar

# 4. En el Salt Master:
# Copiar el archivo del state (nginx/init.sls) a la carpeta de estados del Salt Master:
# sudo cp -r nginx /srv/salt/

# Sincronizar los pilares
# sudo salt '*' saltutil.refresh_pillar

# Aplicar el estado a un minion específico (ej. 'webserver01')
# sudo salt 'webserver01' state.apply nginx

# O aplicar a todos los minions:
# sudo salt '*' state.apply nginx

# 5. Ejemplo de uso de Pillars y Grains en un State (ej. /srv/salt/nginx/files/index.html.jinja)
# <h1>{{ pillar['webapps']['welcome_message'] }}</h1>
# <p>Este servidor está corriendo en {{ grains['os'] }} {{ grains['osrelease'] }}.</p>
# <p>Escuchando en el puerto {{ pillar['webapps']['nginx_port'] }}.</p>

# Para manejar este archivo con Salt:
# /srv/salt/nginx/init.sls (continua):
#   file.managed:
#     - name: /var/www/html/index.html
#     - source: salt://nginx/files/index.html.jinja
#     - template: jinja
#     - user: www-data
#     - group: www-data
#     - mode: 644

# Ejemplo incorrecto: No aceptar la clave del minion en el master.
# Los minions deben ser aceptados por el Master para poder comunicarse.
# sudo salt-key -A # En el Master, para aceptar todas las claves pendientes.
# También, no especificar la dependencia de un servicio a su paquete puede causar errores
# si el paquete no se instala antes de que el servicio intente arrancar.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Automatización y CI/CD',
    'topic': 'Configuración Automatizada',
    'subtopic': 'Comparativa de herramientas',
    'definition': r'''
Cuando hablamos de automatización de la configuración, herramientas como Puppet, Chef y SaltStack (y también Ansible, aunque no se cubra aquí a fondo) son las reinas del mambo. Cada una tiene su propio estilo y fortalezas, y entender sus diferencias es clave para elegir la que mejor se adapte a tu proyecto o empresa.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en la diversidad de proyectos de infraestructura que existen. Algunos necesitan mucha granularidad y control, otros una velocidad extrema, y otros prefieren la simplicidad. Elegir la herramienta equivocada puede llevar a frustraciones, sobrecarga de trabajo y una automatización ineficiente. Conocer las diferencias te permite tomar una decisión informada, lo cual es fundamental para una gestión de infraestructura exitosa y escalable.

Vamos a ver un "tête-à-tête" entre estas herramientas:

**1. Arquitectura:**
* **Puppet y Chef:** Son principalmente de tipo "Maestro-Agente". Necesitas un servidor central (Master) y agentes (Minions/Clients) instalados en cada nodo que quieres gestionar. Los agentes se comunican periódicamente con el Master.
    * **Ventajas:** Permite escalabilidad a gran escala, historial centralizado, cumplimiento de auditorías.
    * **Desventajas:** Requiere la instalación y gestión del agente en cada nodo.
* **SaltStack:** También es Maestro-Minion, pero su comunicación es mucho más rápida (basada en ZeroMQ). Permite ejecución remota instantánea.
    * **Ventajas:** Muy rápida para ejecución remota, excelente para orquestación.
    * **Desventajas:** También requiere agentes.

**2. Paradigma de Configuración:**
* **Puppet y Chef:** Son "declarativas". Defines el *estado deseado* del sistema (ej. "el paquete Nginx debe estar instalado"). La herramienta se encarga de averiguar cómo llegar a ese estado y es idempotente.
    * **Ventajas:** Más fácil de razonar sobre el estado final, robusto contra fallos intermedios.
* **SaltStack:** Es principalmente declarativo (`states`), pero también tiene una fuerte capacidad "imperativa" para ejecutar comandos remotos (`execution modules`) o scripts.
    * **Ventajas:** Flexibilidad para tareas declarativas y scripting directo.

**3. Lenguaje de Configuración:**
* **Puppet:** Utiliza su propio DSL (Domain Specific Language), que es bastante único.
* **Chef:** Usa Ruby como su DSL, lo que da a los usuarios familiarizados con Ruby una gran flexibilidad programática.
* **SaltStack:** Principalmente YAML para los `states`, y Python para los módulos de ejecución o `beacons`. Es relativamente fácil de aprender para quienes ya usan YAML.

**4. Curva de Aprendizaje:**
* **Puppet y Chef:** Pueden tener una curva de aprendizaje más pronunciada debido a sus DSLs específicos y la complejidad de sus conceptos (Cookbooks, Manifests, Run Lists, Facter, Attributes, Resources).
* **SaltStack:** Generalmente se considera un poco más fácil de empezar, especialmente si ya estás familiarizado con YAML y Python.

**5. Ejecución Remota / Orquestación:**
* **SaltStack:** Sobresale en la ejecución remota y la orquestación de tareas en miles de servidores gracias a su comunicación rápida.
* **Puppet y Chef:** Si bien pueden ejecutar tareas, su fuerte está más en la gestión de configuración a largo plazo y la aplicación de estados.

**6. Casos de Uso Comunes:**
* **Puppet:** Ideal para entornos de alta conformidad, estables, donde la auditoría y la consistencia son críticas.
* **Chef:** Excelente para equipos de desarrollo que quieren "infraestructura como código" con un alto grado de personalización programática.
* **SaltStack:** Preferido para entornos que requieren despliegues rápidos, ejecución de comandos en tiempo real y escalabilidad masiva.

No hay una "mejor" herramienta universal. La elección depende de tu equipo, tus requisitos de infraestructura, la escala, la cultura DevOps y las habilidades existentes. Lo importante es que, al usar cualquiera de ellas, estás dando un gran paso hacia una infraestructura más automatizada, fiable y escalable.
''',
    'code_example': r'''
# Ejemplo conceptual: Comparativa de sintaxis para instalar Nginx

# Este ejemplo solo muestra cómo se vería la declaración para instalar Nginx
# en cada herramienta. No es un código ejecutable completo.

# --- Puppet ---
# (En un archivo .pp, como en un 'class' o 'node' definición)
# package { 'nginx':
#   ensure => 'installed',
# }
# service { 'nginx':
#   ensure => 'running',
#   enable => true,
#   require => Package['nginx'],
# }

# --- Chef ---
# (En un archivo 'recipe.rb' dentro de un cookbook)
# package 'nginx' do
#   action :install
# end
# service 'nginx' do
#   action [:enable, :start]
# end

# --- SaltStack ---
# (En un archivo .sls, como 'nginx/init.sls')
# nginx:
#   pkg.installed: []
#   service.running:
#     - enable: True
#     - require:
#       - pkg: nginx

# --- Ansible (solo para comparación, aunque no es el foco del subtema) ---
# (En un archivo YAML de playbook)
# - name: Install and start Nginx
#   hosts: webservers
#   tasks:
#     - name: Install Nginx package
#       ansible.builtin.package:
#         name: nginx
#         state: present
#     - name: Start Nginx service
#       ansible.builtin.service:
#         name: nginx
#         state: started
#         enabled: true

# Ejemplo incorrecto: Intentar mezclar la sintaxis o los conceptos de una herramienta con otra.
# Cada herramienta tiene su propio ecosistema y forma de pensar.
# Por ejemplo, usar `require` de Puppet en una recipe de Chef, o `action :install` de Chef
# en un state de SaltStack. Esto simplemente no funcionará.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module':
        'Mid', // Asumo "Mid" ya que los niveles 4 y 5 del PDF son del módulo intermedio
    'level': 5,
    'title_level':
        'Automatización y CI/CD', // Título de nivel, siguiendo el ejemplo anterior
    'topic': 'Pruebas Automatizadas',
    'subtopic': 'Servidores de pruebas',
    'definition': r'''
Un servidor de pruebas es un entorno dedicado donde se despliega y se prueba el software antes de lanzarlo al entorno de producción. Es un espacio controlado que imita, en la medida de lo posible, las condiciones del entorno real, pero sin afectar a los usuarios finales.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en lanzar una nueva versión de tu aplicación directamente a producción sin probarla a fondo. Podría haber errores críticos, problemas de rendimiento o incompatibilidades que rompan el servicio para tus usuarios. Un servidor de pruebas te permite encontrar y solucionar estos problemas en un ambiente seguro antes de que afecten a tu negocio. Es fundamental para la calidad del software, la reducción de riesgos y la confianza en tus despliegues.

Las características clave de un buen servidor de pruebas incluyen:
* **Aislamiento:** El servidor de pruebas debe estar completamente separado del entorno de producción. Esto evita que las pruebas afecten a los usuarios reales y que los datos de prueba se mezclen con los datos de producción.
* **Reflejo de Producción:** Lo ideal es que el servidor de pruebas sea lo más parecido posible al entorno de producción en cuanto a hardware, sistema operativo, software instalado y configuración. Cuanto más se parezca, más representativos serán los resultados de las pruebas.
* **Acceso a datos de prueba:** Debe tener acceso a datos de prueba realistas, que a menudo son subconjuntos o versiones anonimizadas de los datos de producción.
* **Automatización:** Los despliegues y las ejecuciones de pruebas en el servidor de pruebas deben estar automatizados a través de pipelines de CI/CD, lo que asegura consistencia y eficiencia.
* **Monitoreo:** Al igual que en producción, el servidor de pruebas debe ser monitoreado para detectar problemas de rendimiento o estabilidad durante las pruebas.
* **Reversión/Reset:** La capacidad de restablecer el servidor de pruebas a un estado limpio y conocido rápidamente es crucial para ejecutar múltiples rondas de pruebas sin interferencias.

Aunque mantener un servidor de pruebas puede parecer un costo adicional, el ahorro en la prevención de errores en producción y la mejora en la calidad del software lo hacen una inversión invaluable para cualquier proyecto serio.
''',
    'code_example': r'''
# Ejemplo: Configuración básica de un servidor de pruebas con Ansible (conceptual)

# Un servidor de pruebas se configura típicamente mediante herramientas de Infraestructura como Código (IaC)
# como Ansible, Chef, Puppet o SaltStack para asegurar su consistencia y reproducibilidad.

# Archivo: deploy_test_server.yml (Playbook de Ansible)

# - name: Setup Test Server
#   hosts: test_server_group # Grupo de hosts definido en tu inventario de Ansible
#   become: yes # Ejecutar tareas con privilegios de superusuario

#   tasks:
#     - name: Update apt cache
#       apt:
#         update_cache: yes
#         cache_valid_time: 3600 # Cachear por 1 hora

#     - name: Install necessary packages for the application
#       apt:
#         name:
#           - nginx
#           - python3
#           - python3-pip
#           - virtualenv
#         state: present

#     - name: Create application directory
#       ansible.builtin.file:
#         path: /var/www/my_test_app
#         state: directory
#         owner: www-data
#         group: www-data
#         mode: '0755'

#     - name: Copy application code
#       ansible.builtin.copy:
#         src: ../app_code/ # Asume que el código está en una carpeta 'app_code' relativa al playbook
#         dest: /var/www/my_test_app/
#         owner: www-data
#         group: www-data

#     - name: Setup Python virtual environment
#       ansible.builtin.command:
#         cmd: virtualenv /var/www/my_test_app/venv
#         creates: /var/www/my_test_app/venv

#     - name: Install Python dependencies
#       ansible.builtin.pip:
#         requirements: /var/www/my_test_app/requirements.txt
#         virtualenv: /var/www/my_test_app/venv

#     - name: Configure Nginx for the test app
#       ansible.builtin.template:
#         src: nginx_test_app.conf.j2 # Plantilla Nginx para el entorno de pruebas
#         dest: /etc/nginx/sites-available/my_test_app.conf
#         owner: root
#         group: root
#         mode: '0644'
#       notify: Restart Nginx

#     - name: Enable Nginx site
#       ansible.builtin.file:
#         src: /etc/nginx/sites-available/my_test_app.conf
#         dest: /etc/nginx/sites-enabled/my_test_app.conf
#         state: link
#       notify: Restart Nginx

#   handlers:
#     - name: Restart Nginx
#       ansible.builtin.service:
#         name: nginx
#         state: restarted

# Para ejecutar este playbook:
# ansible-playbook -i inventory.ini deploy_test_server.yml

# Ejemplo incorrecto: Configurar un servidor de pruebas manualmente.
# Cada vez que se necesite replicar o restablecer el entorno, se introducirán errores y se perderá tiempo.
# Además, no habrá garantía de que el entorno sea idéntico en cada iteración.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Automatización y CI/CD',
    'topic': 'Pruebas Automatizadas',
    'subtopic': 'Infraestructura efímera',
    'definition': r'''
La infraestructura efímera se refiere a entornos de infraestructura que se crean bajo demanda para un propósito específico y luego se destruyen una vez que ese propósito ha sido cumplido. Son entornos temporales, descartables, que surgen de la nada y desaparecen sin dejar rastro.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en los "servidores zombie" que quedan olvidados, o en los problemas de consistencia entre entornos que surgen cuando los servidores de pruebas se "ensucian" con el tiempo. La infraestructura efímera soluciona esto garantizando que cada prueba (o despliegue) se ejecute en un entorno prístino y predecible. Esto es fundamental para la reproducibilidad, la fiabilidad de las pruebas y la optimización de costes, ya que solo pagas por la infraestructura mientras la usas.

Las características clave de la infraestructura efímera incluyen:
* **Creación bajo demanda:** Se provisiona un entorno completo (servidores, red, bases de datos) de forma automatizada solo cuando se necesita.
* **Descartes (Disposable):** Una vez que la tarea ha terminado (ej. las pruebas han finalizado), el entorno se destruye automáticamente. No se reutiliza.
* **Inmutabilidad:** Una vez creada, la infraestructura no se modifica. Si necesitas un cambio, se crea un nuevo entorno desde cero con la nueva configuración.
* **Automatización total:** La creación y destrucción de la infraestructura está completamente automatizada utilizando herramientas de Infraestructura como Código (IaC) y orquestadores.
* **Coste-efectividad:** Al ser temporal, solo pagas por los recursos mientras están activos, lo que puede generar ahorros significativos en comparación con mantener entornos estáticos.
* **Consistencia y Reproducibilidad:** Cada entorno efímero es idéntico al anterior, garantizando que las pruebas se ejecuten en las mismas condiciones cada vez.

Herramientas como Docker, Kubernetes, Terraform y CloudFormation son pilares para la construcción de infraestructura efímera. Permiten definir tu infraestructura como código, versionarla y desplegarla y destruirla con comandos simples. Es una práctica fundamental en DevOps moderno y un pilar para pipelines de CI/CD robustos.
''',
    'code_example': r'''
# Ejemplo: Infraestructura efímera con Docker Compose (para entorno de desarrollo/pruebas local)

# Docker Compose permite definir y ejecutar aplicaciones multi-contenedor Docker.
# Es ideal para levantar entornos de prueba efímeros localmente.

# Archivo: docker-compose.yml

# version: '3.8'
# services:
#   webapp:
#     build: . # Construye la imagen desde el Dockerfile en el directorio actual
#     ports:
#       - "8080:80"
#     environment:
#       DATABASE_URL: postgres://user:password@db:5432/myapp_test

#   db:
#     image: postgres:13
#     environment:
#       POSTGRES_DB: myapp_test
#       POSTGRES_USER: user
#       POSTGRES_PASSWORD: password
#     volumes:
#       - db_data:/var/lib/postgresql/data # persistir datos solo para esta sesión de prueba

# volumes:
#   db_data: {} # Declara el volumen para la base de datos

# Pasos para usar esta infraestructura efímera:

# 1. Levantar el entorno de prueba:
#    cd /ruta/a/tu/proyecto
#    docker-compose up -d # Levanta los servicios en segundo plano

# 2. Ejecutar pruebas (ej. con un comando en otro contenedor o desde el host):
#    docker-compose exec webapp pytest # Ejecuta pytest dentro del contenedor webapp

# 3. Una vez terminadas las pruebas, destruir el entorno:
#    docker-compose down # Detiene y elimina los contenedores, redes y volúmenes por defecto

# Ejemplo de Infraestructura efímera en la nube (conceptual con Terraform):

# resource "aws_instance" "test_server" {
#   ami           = "ami-0abcdef1234567890" # AMI de Linux (ej. Ubuntu)
#   instance_type = "t2.micro"
#   tags = {
#     Name        = "EphemeralTestServer"
#     Environment = "Test"
#   }
#   # Otros recursos como security groups, roles IAM, etc.
# }

# Para levantar: `terraform apply`
# Para destruir: `terraform destroy` (lo que hace que la infraestructura sea efímera)

# Ejemplo incorrecto: Reutilizar un entorno de pruebas sucio.
# Si no destruyes y recreas tu entorno de pruebas, los resultados de las pruebas
# podrían ser inconsistentes y no reflejarán fielmente el comportamiento de tu aplicación
# en un entorno de producción limpio.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Automatización y CI/CD',
    'topic': 'Pruebas Automatizadas',
    'subtopic': 'Pruebas de integración',
    'definition': r'''
Las pruebas de integración son un tipo de prueba de software que verifica cómo los diferentes módulos o componentes de una aplicación interactúan y funcionan juntos. En lugar de probar cada pieza de forma aislada, estas pruebas se centran en las interfaces entre los módulos y en el flujo de datos entre ellos.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una aplicación que tiene un módulo de autenticación, otro de gestión de usuarios y uno de base de datos. Cada módulo podría funcionar perfectamente por sí solo, pero ¿qué pasa cuando intentan hablar entre sí? Un error en cómo se comunican o en el formato de los datos que se pasan puede causar un fallo catastrófico. Las pruebas de integración descubren estos problemas de compatibilidad y comunicación, lo cual es fundamental para construir sistemas robustos y colaborativos.

Las pruebas de integración se suelen ejecutar después de las pruebas unitarias y antes de las pruebas de sistema completas. Aquí algunos puntos clave:
* **Enfoque:** Se centran en la interacción entre componentes, no en la lógica interna de un solo componente.
* **Ámbito:** Pueden ir desde la interacción de dos unidades pequeñas (ej. un servicio y su base de datos) hasta la integración de subsistemas completos.
* **Entorno:** A menudo requieren un entorno de pruebas que contenga al menos los servicios que se están integrando (ej. la aplicación, una base de datos real o mock, un servicio externo mockeado). Aquí es donde la infraestructura efímera brilla, ya que permite crear entornos de integración limpios para cada ejecución.
* **Tipos de Integración:**
    * **Big Bang:** Todos los módulos se combinan de una vez y se prueban como una unidad (menos recomendable para grandes sistemas).
    * **Top-down:** Se prueban los módulos de nivel superior primero, usando "stubs" para los módulos de nivel inferior.
    * **Bottom-up:** Se prueban los módulos de nivel inferior primero, usando "drivers" para simular la interacción con módulos de nivel superior.
    * **Sandwich:** Una combinación de top-down y bottom-up.
* **Automatización:** Son candidatas ideales para la automatización dentro de un pipeline de CI/CD. Cada vez que se fusiona código, se pueden ejecutar pruebas de integración para asegurar que los nuevos cambios no rompen las interacciones existentes.

Realizar pruebas de integración exhaustivas es como asegurarse de que todos los músicos en una orquesta no solo pueden tocar sus instrumentos, sino que también pueden tocar juntos en armonía para crear una melodía perfecta.
''',
    'code_example': r'''
# Ejemplo: Prueba de integración básica con Python (usando pytest y un servicio mock)

# Imagina una aplicación Python que se conecta a una API externa.
# Queremos probar si nuestra aplicación interactúa correctamente con esa API.
# Usaremos `pytest` para las pruebas y `requests_mock` para simular la API externa.

# 1. Código de la aplicación (ej. app.py)
# import requests

# def get_user_data(user_id):
#     """Simula obtener datos de un usuario de una API externa."""
#     api_url = f"https://api.example.com/users/{user_id}"
#     response = requests.get(api_url)
#     response.raise_for_status() # Lanza un error para códigos de estado 4xx/5xx
#     return response.json()

# 2. Prueba de integración (ej. test_integration.py)
# import pytest
# import requests_mock
# from app import get_user_data

# def test_get_user_data_success():
#     """
#     Prueba que get_user_data obtiene datos correctamente de la API.
#     Usamos requests_mock para simular la respuesta de la API externa.
#     """
#     with requests_mock.Mocker() as m:
#         # Definimos la respuesta simulada para la URL específica
#         m.get('https://api.example.com/users/123', json={'id': 123, 'name': 'John Doe'})
#         user_data = get_user_data(123)
#         assert user_data == {'id': 123, 'name': 'John Doe'}

# def test_get_user_data_not_found():
#     """
#     Prueba que get_user_data maneja correctamente un usuario no encontrado (404).
#     """
#     with requests_mock.Mocker() as m:
#         m.get('https://api.example.com/users/404', status_code=404)
#         with pytest.raises(requests.exceptions.HTTPError):
#             get_user_data(404)

# Para ejecutar estas pruebas:
# 1. Instalar las dependencias: `pip install pytest requests requests_mock`
# 2. Ejecutar pytest: `pytest`

# Ejemplo incorrecto: Intentar hacer una prueba de integración que realmente es una prueba unitaria o de sistema.
# Si mockeas *todos* los servicios externos, en realidad estás haciendo una prueba unitaria de tu función.
# Si no mockeas *ninguno* y te conectas a todos los servicios reales, es más una prueba de sistema.
# La clave de la integración es probar las interacciones entre un *conjunto* de componentes, no todos.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Automatización y CI/CD',
    'topic': 'Pruebas Automatizadas',
    'subtopic': 'Pruebas de regresión',
    'definition': r'''
Las pruebas de regresión son un tipo de prueba de software que se realiza para asegurar que los cambios recientes en el código (nuevas funcionalidades, correcciones de errores o refactorizaciones) no han introducido nuevos defectos en funcionalidades existentes o han provocado que funcionalidades que antes funcionaban dejen de hacerlo. Es como revisar un coche después de una reparación para asegurarse de que la reparación no ha afectado negativamente a otras partes del vehículo.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en un equipo que lanza nuevas características constantemente. Sin pruebas de regresión, cada nuevo cambio es una ruleta rusa: podría romper algo fundamental que ya funcionaba, causando una mala experiencia al usuario y retrasos. Las pruebas de regresión actúan como una red de seguridad, permitiendo a los desarrolladores hacer cambios con confianza, sabiendo que las funcionalidades existentes están protegidas. Esto es fundamental para mantener la estabilidad del software y acelerar el ritmo de desarrollo.

Las pruebas de regresión son una parte crucial de un pipeline de Integración Continua:
* **Propósito:** Asegurar la estabilidad de la aplicación después de cualquier cambio.
* **Conjunto de pruebas:** Consisten en ejecutar un subconjunto (o la totalidad) de las pruebas funcionales, unitarias, de integración, de sistema o de rendimiento existentes, para verificar la funcionalidad no modificada.
* **Automatización:** Son candidatas ideales para la automatización. Una vez que una prueba se crea, se puede ejecutar repetidamente con cada cambio de código, de forma rápida y consistente.
* **Momento de ejecución:** Se suelen ejecutar en cada `push` o `pull request` en el pipeline de CI/CD. En proyectos grandes, también pueden ejecutarse de forma programada diariamente o semanalmente.
* **Estrategias:**
    * **Re-pruebas completas (Retest All):** Ejecutar *todas* las pruebas existentes. Garantiza la cobertura, pero es lento y costoso para proyectos grandes.
    * **Selección de regresión:** Seleccionar un subconjunto de pruebas relevantes para el cambio específico o las áreas de mayor riesgo.
    * **Priorización de pruebas:** Priorizar las pruebas basadas en la criticidad de la funcionalidad, la frecuencia de uso o el riesgo de fallo.
* **Herramientas:** Se utilizan las mismas herramientas que para otras pruebas automatizadas (ej. pytest, JUnit para unitarias/integración; Cypress, Selenium para end-to-end; JMeter para rendimiento).

Las pruebas de regresión te dan la confianza para innovar, refactorizar y añadir nuevas características sin el temor constante de romper algo en la versión anterior. Son el baluarte de la calidad continua en el desarrollo de software.
''',
    'code_example': r'''
# Ejemplo: Pruebas de regresión en un pipeline de CI/CD (conceptual)

# Las pruebas de regresión no son un tipo de código nuevo, sino la ejecución
# de pruebas ya existentes (unitarias, de integración, end-to-end)
# en un contexto específico.

# Aquí se muestra cómo se integrarían en un archivo de pipeline (ej. .gitlab-ci.yml o .github/workflows/ci.yml)

# Archivo: .gitlab-ci.yml (fragmento)

# stages:
#   - build
#   - test # Aquí se ejecutarían las pruebas de regresión
#   - deploy

# # Job para ejecutar pruebas unitarias (parte de la regresión)
# unit_tests:
#   stage: test
#   script:
#     - echo "Ejecutando pruebas unitarias..."
#     - pip install -r requirements.txt
#     - pytest --junitxml=report-unit.xml unit_tests/ # Ejecutar tests de unidad
#   artifacts:
#     reports:
#       junit: report-unit.xml # Publicar informe de pruebas para GitLab UI

# # Job para ejecutar pruebas de integración (parte de la regresión)
# integration_tests:
#   stage: test
#   script:
#     - echo "Configurando entorno para pruebas de integración (Docker Compose)..."
#     - docker-compose up -d # Levantar servicios de DB, API mock, etc.
#     - echo "Ejecutando pruebas de integración..."
#     - pytest --junitxml=report-integration.xml integration_tests/ # Ejecutar tests de integración
#     - docker-compose down # Bajar servicios después de las pruebas
#   artifacts:
#     reports:
#       junit: report-integration.xml

# # Job para ejecutar pruebas End-to-End (E2E) con Cypress (parte de la regresión)
# e2e_tests:
#   stage: test
#   image: cypress/included:12.17.4 # Imagen Docker con Cypress preinstalado
#   script:
#     - echo "Construyendo la aplicación web..."
#     - npm install && npm run build
#     - echo "Sirviendo la aplicación para pruebas E2E..."
#     - npm run start & # Iniciar la aplicación en segundo plano
#     - sleep 5 # Esperar a que la app inicie
#     - echo "Ejecutando pruebas E2E con Cypress..."
#     - npx cypress run --record --key ${{ secrets.CYPRESS_RECORD_KEY }}
#   artifacts:
#     when: always
#     paths:
#       - cypress/videos/
#       - cypress/screenshots/
#     expire_in: 1 day

# Ejemplo incorrecto: No automatizar las pruebas de regresión.
# Si las pruebas de regresión se hacen manualmente, se vuelven costosas, lentas y propensas a errores u omisiones,
# lo que anula su propósito de asegurar la calidad continua y la velocidad de entrega.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid', // Asumo "Mid"
    'level': 5,
    'title_level': 'Automatización y CI/CD', // Título de nivel
    'topic': 'Observabilidad',
    'subtopic': 'OpenTelemetry básico',
    'definition': r'''
OpenTelemetry (o OTel para los amigos) es un conjunto de herramientas, APIs y SDKs de código abierto que estandariza la recopilación de telemetría (métricas, logs y trazas) de tus aplicaciones y servicios. Su objetivo es hacer que la instrumentación de tu código sea más fácil y coherente, para que puedas entender el comportamiento de tus sistemas.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una aplicación compleja, distribuida en varios microservicios. Si algo falla, ¿cómo sabes dónde está el problema? ¿Es el frontend, un servicio de autenticación, la base de datos? Sin datos de telemetría unificados, es como buscar una aguja en un pajar. OpenTelemetry te da los "ojos y oídos" necesarios para entender qué está pasando dentro de tu aplicación, permitiéndote diagnosticar problemas rápidamente, optimizar el rendimiento y mejorar la experiencia del usuario. Es fundamental para la gestión de sistemas distribuidos y complejos.

OpenTelemetry se basa en los tres pilares de la observabilidad:
* **Trazas (Traces):** Representan el flujo de ejecución de una solicitud a través de múltiples servicios. Una traza está compuesta por "spans", que son operaciones individuales dentro de la solicitud (ej. una llamada a una base de datos, una llamada a un microservicio).
* **Métricas (Metrics):** Son valores numéricos agregados a lo largo del tiempo, que representan el rendimiento o el estado de un sistema (ej. CPU usage, requests per second, error rates).
* **Logs (Logs):** Son eventos discretos y con marca de tiempo que describen lo que sucede dentro de una aplicación en un momento dado (ej. un usuario se ha autenticado, un error ha ocurrido).

Las principales características de OpenTelemetry incluyen:
* **Neutralidad del proveedor:** OTel no te encierra en una herramienta de monitoreo específica. Puedes instrumentar tu aplicación una vez y luego exportar los datos a cualquier backend compatible (Prometheus, Grafana, Jaeger, Zipkin, New Relic, Datadog, etc.).
* **SDKs y APIs:** Proporciona SDKs para varios lenguajes de programación (Java, Python, Go, Node.js, .NET, etc.) que permiten instrumentar tu código manualmente o automáticamente.
* **Collector:** Un componente opcional que puede recibir, procesar y exportar datos de telemetría. Es útil para añadir procesamiento intermedio, batching o enrutamiento de datos.
* **Context Propagation:** Permite que la información de la traza (como el ID de la traza) se propague a través de las llamadas de servicio, para que puedas unir todas las operaciones relacionadas con una sola solicitud.

OpenTelemetry es el estándar de facto para la instrumentación de telemetría, empoderando a los equipos para construir sistemas más transparentes y resilientes.
''',
    'code_example': r'''
# Ejemplo: OpenTelemetry básico - Instrumentación de una aplicación Python con trazas

# Este ejemplo muestra cómo instrumentar una función simple para generar trazas.
# Necesitas instalar los paquetes de OpenTelemetry:
# pip install opentelemetry-api opentelemetry-sdk opentelemetry-exporter-otlp-proto-grpc opentelemetry-instrumentation-requests

# 1. Configuración del exporter y tracer (ej. app.py o un archivo de inicialización)
# from opentelemetry import trace
# from opentelemetry.sdk.resources import Resource
# from opentelemetry.sdk.trace import TracerProvider
# from opentelemetry.sdk.trace.export import BatchSpanProcessor
# from opentelemetry.exporter.otlp.proto.grpc.trace_exporter import OTLPSpanExporter
# from opentelemetry.instrumentation.requests import RequestsInstrumentor

# # Resource define atributos sobre la entidad que genera telemetría (tu servicio)
# resource = Resource.create({
#     "service.name": "my-python-app",
#     "service.version": "1.0.0",
#     "environment": "development"
# })

# # Configura el proveedor de trazas
# provider = TracerProvider(resource=resource)
# trace.set_tracer_provider(provider)

# # Configura el exportador de OTLP (a dónde se enviarán las trazas, ej. un OpenTelemetry Collector)
# otlp_exporter = OTLPSpanExporter(endpoint="localhost:4317", insecure=True) # Usar 4317 para gRPC

# # Configura el procesador de spans (envía spans en lotes)
# span_processor = BatchSpanProcessor(otlp_exporter)
# provider.add_span_processor(span_processor)

# # Instrumenta la librería requests automáticamente (para trazar llamadas HTTP)
# RequestsInstrumentor().instrument()

# # Obtiene un tracer para tu aplicación
# tracer = trace.get_tracer(__name__)

# 2. Uso en una función de la aplicación (ej. en app.py)
# import requests

# def fetch_data_from_api(url):
#     with tracer.start_as_current_span("fetch_data_from_api_span") as span:
#         span.set_attribute("http.url", url)
#         try:
#             response = requests.get(url)
#             response.raise_for_status()
#             span.set_attribute("http.status_code", response.status_code)
#             return response.json()
#         except requests.exceptions.RequestException as e:
#             span.set_attribute("error", True)
#             span.set_attribute("exception.message", str(e))
#             raise

# if __name__ == "__main__":
#     # Ejecuta esto para probar la instrumentación
#     try:
#         print("Fetching data...")
#         data = fetch_data_from_api("https://jsonplaceholder.typicode.com/todos/1")
#         print(f"Data received: {data}")
#     except Exception as e:
#         print(f"Error: {e}")
#     finally:
#         # Asegúrate de que los spans se exporten antes de que la aplicación termine
#         provider.shutdown()

# Para ver las trazas, necesitas un OpenTelemetry Collector y un backend como Jaeger.
# Puedes ejecutar un Jaeger All-in-One con Docker:
# docker run -p 4317:4317 -p 16686:16686 jaegertracing/all-in-one:latest

# Ejemplo incorrecto: No llamar a `provider.shutdown()` en aplicaciones de corta duración.
# Si tu script finaliza antes de que los spans se envíen (en un BatchSpanProcessor),
# algunas trazas podrían no exportarse, y no las verás en tu backend de monitoreo.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Automatización y CI/CD',
    'topic': 'Observabilidad',
    'subtopic': 'Trazado distribuido',
    'definition': r'''
El trazado distribuido (Distributed Tracing) es una técnica de observabilidad que te permite seguir la ruta completa de una solicitud (o transacción) a medida que viaja a través de múltiples servicios, microservicios, bases de datos y colas de mensajes en un sistema distribuido. Proporciona una vista de punta a punta del ciclo de vida de una solicitud.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una aplicación que va lenta, o un error que solo ocurre bajo ciertas condiciones. En un sistema monolítico, podrías depurar el código en un solo lugar. Pero en una arquitectura de microservicios, una sola solicitud puede tocar docenas de servicios. Sin el trazado distribuido, encontrar la causa raíz de un problema es un verdadero dolor de cabeza, porque no puedes ver dónde se está gastando el tiempo o dónde se produce el error entre los diferentes servicios. El trazado distribuido te da la visibilidad para identificar cuellos de botella, latencias y errores en cualquier punto del flujo de la solicitud, lo cual es fundamental para diagnosticar problemas rápidamente y optimizar el rendimiento de sistemas complejos.

Los conceptos clave del trazado distribuido son:
* **Traza (Trace):** Representa una única transacción o flujo de trabajo completo a través de uno o más servicios. Es un gráfico acíclico dirigido (DAG) de spans.
* **Span:** Es una operación individual dentro de una traza. Cada span representa una unidad de trabajo (ej. una llamada a una función, una solicitud HTTP, una consulta a la base de datos). Un span tiene un nombre, una marca de tiempo de inicio, una marca de tiempo de fin y atributos (metadatos clave-valor).
* **Parent-Child Relationships:** Los spans pueden tener relaciones padre-hijo, lo que permite visualizar la jerarquía de las operaciones dentro de una traza. Por ejemplo, un span de "manejar solicitud web" podría tener spans hijos para "llamar a servicio de autenticación" y "consultar base de datos".
* **Context Propagation:** Es el mecanismo vital que permite que la información de la traza (el ID de la traza y el ID del span padre) se pase de un servicio a otro a través de los límites de la red (ej. en encabezados HTTP como `traceparent`). Esto asegura que todos los spans relacionados con la misma solicitud se agrupen en la misma traza.
* **Instrumentación:** El proceso de añadir código a tus aplicaciones para generar y exportar datos de trazas. OpenTelemetry es la herramienta líder para esto, ya que proporciona APIs y SDKs estandarizados para varios lenguajes.
* **Backend de Trazas:** Un sistema que ingesta, almacena, indexa y visualiza los datos de trazas (ej. Jaeger, Zipkin, Grafana Tempo).

El trazado distribuido transforma la depuración de sistemas distribuidos de un "acto de fe" a una ciencia, proporcionando una visión clara del comportamiento de tus aplicaciones en producción.
''',
    'code_example': r'''
# Ejemplo: Trazado distribuido - Propagación de contexto HTTP

# Este ejemplo conceptual muestra cómo el ID de la traza y el ID del span se pasan
# a través de las cabeceras HTTP entre dos servicios, permitiendo al sistema
# de trazado reconstruir la secuencia completa de la solicitud.

# Para que esto funcione, ambos servicios deben estar instrumentados con una librería
# de trazado distribuido (ej. OpenTelemetry SDK) y configurados para usar el mismo
# formato de propagación (ej. W3C Trace Context).

# --- Servicio A (el que inicia la llamada) ---
# import requests
# from opentelemetry import trace, propagate
# from opentelemetry.propagate import set_global_textmap

# # Suponiendo que ya configuraste tu TracerProvider y Exporter (como en el ejemplo de OpenTelemetry básico)
# tracer = trace.get_tracer(__name__)
# set_global_textmap(propagate.get_current_global_textmap()) # Esto es clave para la propagación

# def call_service_b():
#     with tracer.start_as_current_span("call_service_b_from_a") as span_a:
#         print(f"Service A: Starting span {span_a.context.span_id:x}, trace {span_a.context.trace_id:x}")

#         # Injecta el contexto de la traza actual en las cabeceras HTTP
#         headers = {}
#         propagate.inject(headers)
#         print(f"Service A: Injecting headers: {headers}")

#         try:
#             response = requests.get("http://localhost:5001/api/data", headers=headers)
#             response.raise_for_status()
#             print(f"Service A: Received response: {response.json()}")
#         except Exception as e:
#             print(f"Service A: Error calling Service B: {e}")
#             span_a.set_attribute("error", True)
#             span_a.set_attribute("exception.message", str(e))
#         finally:
#             # Asegúrate de que el span finaliza y se envía al exportador
#             pass # Handled by 'with' statement

# if __name__ == "__main__":
#     # Simular llamada
#     call_service_b()
#     # shutdown del provider aquí si es una aplicación de corta duración
#     trace.get_tracer_provider().shutdown()


# --- Servicio B (el que recibe la llamada) ---
# from flask import Flask, request
# from opentelemetry import trace, propagate
# from opentelemetry.propagate import set_global_textmap
# from opentelemetry.sdk.trace import TracerProvider
# from opentelemetry.sdk.trace.export import BatchSpanProcessor
# from opentelemetry.exporter.otlp.proto.grpc.trace_exporter import OTLPSpanExporter
# from opentelemetry.sdk.resources import Resource

# app = Flask(__name__)

# # Configuración del TracerProvider y Exporter para el Servicio B (similar a Servicio A)
# resource_b = Resource.create({"service.name": "my-python-service-b"})
# provider_b = TracerProvider(resource=resource_b)
# trace.set_tracer_provider(provider_b)
# otlp_exporter_b = OTLPSpanExporter(endpoint="localhost:4317", insecure=True)
# span_processor_b = BatchSpanProcessor(otlp_exporter_b)
# provider_b.add_span_processor(span_processor_b)
# set_global_textmap(propagate.get_current_global_textmap())
# tracer_b = trace.get_tracer(__name__)

# @app.route("/api/data")
# def get_data():
#     # Extraer el contexto de la traza de las cabeceras HTTP
#     # Esto crea un span hijo del span que inició la llamada en el Servicio A
#     ctx = propagate.extract(request.headers)
#     with tracer_b.start_as_current_span("get_data_from_service_b", context=ctx) as span_b:
#         print(f"Service B: Received span {span_b.context.span_id:x}, trace {span_b.context.trace_id:x}")
#         # Aquí iría la lógica de negocio del Servicio B,
#         # quizás haciendo una llamada a una base de datos o a otro servicio.
#         # Cada una de esas operaciones internas también podría generar sus propios spans.
#         return {"message": "Data from Service B"}

# if __name__ == "__main__":
#     # Para ejecutar Flask (ej. con Gunicorn o simplemente `python app.py` para desarrollo)
#     # app.run(port=5001)
#     # Para apagar el provider_b (importante en aplicaciones de larga duración,
#     # típicamente manejado por un hook de shutdown del servidor web)
#     pass

# Para ejecutar:
# 1. Asegúrate de tener un Jaeger/Collector corriendo en localhost:4317.
# 2. Guarda el código del Servicio B como `service_b.py` y ejecútalo (ej. `flask --app service_b run --port 5001`).
# 3. Guarda el código del Servicio A como `service_a.py` y ejecútalo (`python service_a.py`).
# 4. Ve a la UI de Jaeger (ej. http://localhost:16686) y busca el servicio "my-python-app". Verás una traza que
#    muestra la llamada de `service_a` a `service_b`.

# Ejemplo incorrecto: No pasar el contexto de la traza entre servicios.
# Si los servicios no propagan el contexto de la traza en sus comunicaciones (ej. las cabeceras HTTP),
# el sistema de trazado no podrá correlacionar las operaciones y verás múltiples trazas separadas
# en lugar de una única traza de punta a punta.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Automatización y CI/CD',
    'topic': 'Observabilidad',
    'subtopic': 'Métricas de negocio',
    'definition': r'''
Las métricas de negocio son valores cuantificables que reflejan el rendimiento de los aspectos clave de tu negocio o aplicación desde una perspectiva empresarial, no solo técnica. Van más allá del uso de CPU o la latencia de la red, para medir cosas que realmente importan a los dueños del negocio.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una tienda online. Si el servidor de bases de datos está al 100% de CPU, es un problema técnico. Pero, ¿qué significa eso para el negocio? Quizás el número de pedidos por minuto ha bajado drásticamente. Las métricas técnicas te dicen *qué* está pasando en tu infraestructura, pero las métricas de negocio te dicen *cómo* eso impacta en tus objetivos empresariales. Son fundamentales para alinear los equipos técnicos con los objetivos de negocio, tomar decisiones estratégicas basadas en datos y demostrar el valor del trabajo de ingeniería.

Algunos ejemplos comunes de métricas de negocio incluyen:
* **Conversión:** Número de registros, ventas completadas, descargas de aplicaciones por período de tiempo.
* **Compromiso de usuario:** Usuarios activos diarios (DAU), usuarios activos mensuales (MAU), tiempo promedio en la aplicación, clics en funcionalidades clave.
* **Retención:** Porcentaje de usuarios que regresan después de un cierto período.
* **Rendimiento financiero:** Ingresos por usuario (ARPU), valor del tiempo de vida del cliente (LTV).
* **Calidad del servicio:** Tasas de error por transacción de negocio (ej. errores al procesar un pago), tiempo de respuesta para operaciones críticas (ej. tiempo para cargar la página de un producto).
* **Adquisición:** Nuevos usuarios, coste por adquisición de cliente (CAC).

Implementar métricas de negocio requiere:
* **Identificación:** Trabajar con stakeholders de negocio para identificar qué métricas son las más importantes para medir el éxito.
* **Instrumentación:** Añadir código a la aplicación para emitir estas métricas (usando librerías de métricas como Prometheus client libraries, OpenTelemetry, etc.).
* **Colección y Almacenamiento:** Utilizar sistemas de monitoreo de métricas (ej. Prometheus, Grafana Mimir, Datadog) para recolectar y almacenar estos datos.
* **Visualización y Alertamiento:** Crear dashboards claros (ej. en Grafana) que muestren estas métricas y configurar alertas cuando los umbrales de rendimiento de negocio se crucen.

Las métricas de negocio son el puente entre el mundo técnico y el mundo empresarial, permitiendo que la tecnología sea no solo un facilitador, sino un motor de crecimiento para el negocio.
''',
    'code_example': r'''
# Ejemplo: Métricas de negocio con Prometheus Python Client (y cómo se verían en Grafana)

# Necesitas instalar el cliente de Prometheus para Python:
# pip install prometheus_client

# 1. Código de la aplicación instrumentada (ej. app.py con Flask)
# from flask import Flask, request, jsonify
# from prometheus_client import start_http_server, Counter, Histogram
# import random
# import time

# app = Flask(__name__)

# # ---------------- Métricas de Negocio ----------------

# # Contador: Número total de registros de usuario
# USER_REGISTRATIONS_TOTAL = Counter(
#     'user_registrations_total',
#     'Total number of user registrations',
#     ['source'] # Etiqueta para diferenciar la fuente (ej. 'web', 'mobile')
# )

# # Histograma: Duración del proceso de pago en segundos
# PAYMENT_PROCESSING_DURATION_SECONDS = Histogram(
#     'payment_processing_duration_seconds',
#     'Duration of payment processing in seconds',
#     ['status'] # Etiqueta para diferenciar el estado (ej. 'success', 'failed')
# )

# # Contador: Número de órdenes completadas
# ORDERS_COMPLETED_TOTAL = Counter(
#     'orders_completed_total',
#     'Total number of completed orders'
# )

# # ---------------- Rutas de la aplicación ----------------

# @app.route('/register', methods=['POST'])
# def register_user():
#     source = request.json.get('source', 'unknown')
#     # Lógica de registro de usuario
#     # ...
#     USER_REGISTRATIONS_TOTAL.labels(source=source).inc() # Incrementar el contador
#     return jsonify({"message": "User registered successfully"}), 201

# @app.route('/checkout', methods=['POST'])
# def checkout():
#     start_time = time.time()
#     status = 'success'
#     try:
#         # Lógica de procesamiento de pago
#         # Simula un retraso o un fallo
#         if random.random() < 0.1: # 10% de probabilidad de fallo
#             raise ValueError("Payment failed for some reason")
#         time.sleep(random.uniform(0.1, 1.5)) # Simula tiempo de procesamiento
#         ORDERS_COMPLETED_TOTAL.inc() # Incrementar órdenes completadas
#     except Exception as e:
#         status = 'failed'
#         return jsonify({"message": f"Checkout failed: {e}"}), 500
#     finally:
#         duration = time.time() - start_time
#         PAYMENT_PROCESSING_DURATION_SECONDS.labels(status=status).observe(duration) # Observar la duración
#     return jsonify({"message": "Checkout successful"}), 200

# @app.route('/metrics')
# def metrics():
#     # Prometheus scrape endpoint
#     from prometheus_client import generate_latest
#     return generate_latest(), 200, {'Content-Type': 'text/plain; version=0.0.4; charset=utf-8'}

# if __name__ == '__main__':
#     # Inicia el servidor HTTP de métricas en un puerto diferente al de la aplicación
#     start_http_server(8000)
#     print("Prometheus metrics server started on port 8000")
#     app.run(port=5000)

# Para ejecutar:
# 1. Guarda el código como `app.py`.
# 2. `python app.py`
# 3. Envía solicitudes:
#    `curl -X POST -H "Content-Type: application/json" -d '{"source": "web"}' http://localhost:5000/register`
#    `curl -X POST http://localhost:5000/checkout`
# 4. Accede a las métricas: `http://localhost:8000/metrics`

# --- Configuración conceptual en Prometheus ---
# En prometheus.yml, añadir la configuración de scrape:
# scrape_configs:
#   - job_name: 'my_app_metrics'
#     static_configs:
#       - targets: ['localhost:8000'] # IP y puerto donde expone las métricas tu app

# --- Cómo se verían las métricas en PromQL (para Grafana) ---
# Suma total de registros: `sum(user_registrations_total)`
# Registros por fuente: `sum by (source) (user_registrations_total)`
# Tasa de órdenes completadas: `rate(orders_completed_total[5m])`
# Percentil 95 de la duración del pago exitoso: `histogram_quantile(0.95, sum by (le) (rate(payment_processing_duration_seconds_bucket{status="success"}[5m])))`

# Ejemplo incorrecto: Medir solo métricas técnicas (CPU, RAM) y no tener visibilidad
# del impacto de los problemas en el negocio.
# O, tener métricas de negocio pero no configurarlas para alertar cuando los umbrales
# de negocio importantes se cruzan (ej. si las ventas por minuto bajan del 10%).
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Automatización y CI/CD',
    'topic': 'Observabilidad',
    'subtopic': 'Dashboards ejecutivos',
    'definition': r'''
Los dashboards ejecutivos son paneles de visualización de datos de alto nivel, diseñados para proporcionar a la dirección y a los stakeholders clave una visión rápida y concisa del rendimiento del negocio y de la salud de las operaciones. A diferencia de los dashboards técnicos detallados, estos se enfocan en las métricas más críticas y en tendencias generales, permitiendo una toma de decisiones informada.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en un Director de Tecnología o un CEO que necesita entender el estado de la plataforma de la empresa. No tienen tiempo para bucear en logs detallados o en gráficos de latencia de red. Necesitan ver rápidamente si las ventas están bien, si hay un problema importante de rendimiento que afecta a los clientes o si una nueva característica está siendo adoptada. Los dashboards ejecutivos traducen la complejidad técnica en información accionable para el negocio, lo cual es fundamental para alinear los equipos, comunicar el valor de TI y responder proactivamente a los desafíos del mercado.

Las características clave de los dashboards ejecutivos son:
* **Orientación al negocio:** Priorizan las métricas de negocio (ventas, registros, usuarios activos, conversión, etc.) sobre las métricas puramente técnicas.
* **Simplicidad y claridad:** Evitan la sobrecarga de información. Muestran solo los datos más relevantes, presentados de forma clara y fácil de entender, a menudo con gráficos simples (líneas, barras, KPIs grandes).
* **Visión consolidada:** Agregan datos de múltiples fuentes (monitoreo de aplicaciones, datos de ventas, CRM, marketing) para dar una imagen completa.
* **Tendencias y comparaciones:** Suelen mostrar tendencias a lo largo del tiempo (ej. ventas diarias, semanales, mensuales) y permiten comparar el rendimiento actual con períodos anteriores o con objetivos.
* **Capacidad de "drill-down" (opcional):** Aunque de alto nivel, idealmente deberían permitir a un usuario interesado hacer clic en una métrica para acceder a dashboards más detallados si se requiere una investigación más profunda.
* **Alertamiento visible:** Aunque no se muestran las alertas individuales, los dashboards pueden usar indicadores visuales (colores, iconos) para señalar problemas o desviaciones de los umbrales.
* **Accesibilidad:** Deben ser fáciles de acceder por la dirección, a menudo a través de una URL simple o incrustados en portales internos.

Herramientas como Grafana son excelentes para construir dashboards ejecutivos, ya que permiten integrar datos de diversas fuentes (Prometheus, bases de datos, APIs) y construir visualizaciones personalizadas que se adaptan a las necesidades específicas de la dirección.
''',
    'code_example': r'''
# Ejemplo: Configuración conceptual de un Dashboard Ejecutivo en Grafana

# Grafana es una herramienta de código abierto muy popular para crear dashboards.
# No hay "código" directo para un dashboard en la línea de comandos,
# pero se puede exportar un dashboard de Grafana como JSON.
# Este JSON es la "definición como código" de tu dashboard.

# Un fragmento conceptual de un dashboard JSON (simplificado):

# {
#   "annotations": {
#     "list": []
#   },
#   "panels": [
#     {
#       "datasource": {
#         "type": "prometheus",
#         "uid": "P1234ABCD"
#       },
#       "fieldConfig": {
#         "defaults": {
#           "unit": "short",
#           "color": {
#             "mode": "thresholds"
#           },
#           "mappings": []
#         }
#       },
#       "gridPos": {
#         "h": 4,
#         "w": 6,
#         "x": 0,
#         "y": 0
#       },
#       "id": 1,
#       "options": {
#         "colorMode": "background",
#         "graphMode": "area",
#         "justifyMode": "auto",
#         "textMode": "value"
#       },
#       "pluginVizId": "stat",
#       "targets": [
#         {
#           "expr": "sum(orders_completed_total)", # Métrica de negocio: órdenes completadas
#           "refId": "A"
#         }
#       ],
#       "title": "Órdenes Completadas (Últimas 24h)",
#       "type": "stat"
#     },
#     {
#       "datasource": {
#         "type": "prometheus",
#         "uid": "P1234ABCD"
#       },
#       "fieldConfig": {
#         "defaults": {
#           "unit": "short"
#         }
#       },
#       "gridPos": {
#         "h": 8,
#         "w": 12,
#         "x": 6,
#         "y": 0
#       },
#       "id": 2,
#       "options": {
#         "legend": {
#           "calcs": [],
#           "displayMode": "list",
#           "placement": "right"
#         },
#         "tooltip": {
#           "mode": "single"
#         }
#       },
#       "pluginVizId": "timeseries",
#       "targets": [
#         {
#           "expr": "rate(user_registrations_total{source='web'}[$__interval])", # Tasa de registros web
#           "legendFormat": "Registros Web",
#           "refId": "A"
#         },
#         {
#           "expr": "rate(user_registrations_total{source='mobile'}[$__interval])", # Tasa de registros mobile
#           "legendFormat": "Registros Mobile",
#           "refId": "B"
#         }
#       ],
#       "title": "Tasa de Registros por Fuente",
#       "type": "timeseries"
#     }
#     # ... otros paneles para métricas clave ...
#   ],
#   "schemaVersion": 38,
#   "style": "dark",
#   "tags": [
#     "executive",
#     "business"
#   ],
#   "templating": {
#     "list": []
#   },
#   "time": {
#     "from": "now-24h",
#     "to": "now"
#   },
#   "timepicker": {},
#   "timezone": "",
#   "title": "Dashboard Ejecutivo de Negocio - MiApp",
#   "uid": "my-executive-dashboard",
#   "version": 1
# }

# Pasos conceptuales para crear/gestionar en Grafana:
# 1. Configurar una fuente de datos en Grafana (ej. Prometheus que scrapea tus métricas de negocio).
# 2. En la UI de Grafana, crear un nuevo dashboard y añadir paneles.
# 3. Para cada panel, selecciona la fuente de datos y escribe la consulta PromQL (o SQL, etc.) para tu métrica de negocio.
# 4. Personaliza la visualización (tipo de gráfico, colores, umbrales).
# 5. Guarda el dashboard y, opcionalmente, expórtalo como JSON para control de versiones (GitOps).
# 6. Puedes usar la API de Grafana o herramientas como Grafana Tanka para automatizar el despliegue de dashboards.

# Ejemplo incorrecto: Llenar un dashboard ejecutivo con métricas técnicas como "CPU Usage" o "Disk I/O".
# Aunque estas métricas son importantes, no son lo que un ejecutivo necesita ver directamente.
# El dashboard ejecutivo debe contar una historia de negocio, no una historia de infraestructura.
# También, dashboards que no se actualizan automáticamente o que son difíciles de entender.
'''
  });
}

Future<void> insertMidLevel6DataLinux(Database db) async {
  await db.insert('programming_content', {
    'language': 'Linux',
    'module':
        'Mid', // Manteniendo "Mid" como el módulo del Nivel 5, y asumiendo que el Nivel 6 "intermedio" también cae aquí.
    'level': 6,
    'title_level': 'Preparación para Certificaciones Intermedias',
    'topic': 'LFCE (Linux Foundation Certified Engineer)',
    'subtopic': 'Requisitos',
    'definition': r'''
La certificación LFCE (Linux Foundation Certified Engineer) es un examen práctico que valida tus habilidades como ingeniero de sistemas Linux en un entorno real. No es un examen de opción múltiple, sino que te colocan en un servidor Linux y te piden que resuelvas problemas y realices configuraciones específicas.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en las certificaciones de TI que a menudo solo requieren memorizar conceptos. La LFCE, al ser práctica, demuestra que realmente sabes "hacer" las cosas, no solo hablar de ellas. Esto es fundamental para los empleadores, ya que buscan ingenieros capaces de resolver problemas en el día a día. Obtener esta certificación valida tu experiencia y te posiciona como un profesional competente en el campo de la administración de sistemas Linux, abriendo puertas a mejores oportunidades laborales.

Para el examen LFCE, los requisitos clave no son tanto de prerrequisitos formales de otras certificaciones, sino de **experiencia y conocimientos prácticos** en áreas específicas. Aquí te detallo lo que se espera de ti:
* **Dominio de la línea de comandos:** Debes sentirte completamente cómodo trabajando exclusivamente desde la terminal. Esto incluye manejo avanzado de comandos (grep, awk, sed, find), redirecciones, tuberías, y expresiones regulares.
* **Gestión de software:** Saber instalar, actualizar, y remover paquetes usando herramientas como `yum`, `dnf`, `apt`, `zypper`. Esto incluye la gestión de repositorios y la resolución de dependencias.
* **Gestión de procesos y servicios:** Entender `systemd` a fondo: cómo iniciar, detener, reiniciar, habilitar y deshabilitar servicios. También la gestión de procesos (background, foreground, `nice`, `renice`, `kill`).
* **Redes:** Configuración de interfaces de red (IPv4/IPv6), resolución de nombres (DNS), enrutamiento estático, firewall (`firewalld`, `iptables`), y servicios de red básicos como SSH.
* **Almacenamiento:** Gestión de sistemas de archivos (creación, montaje, resizing), LVM (Logical Volume Management), RAID (software RAID), y cuotas de disco.
* **Seguridad:** Gestión de usuarios y grupos, permisos de archivos (`chmod`, `chown`), ACLs, auditorías básicas, y configuración de SSH para mayor seguridad.
* **Scripting:** Capacidad para escribir scripts básicos en Bash para automatizar tareas.
* **Solución de problemas:** Esta es quizás la habilidad más importante. El examen está diseñado para que encuentres y corrijas errores. Debes ser capaz de depurar problemas de red, arranque, servicios, etc.

Básicamente, la LFCE valida que puedes tomar un servidor Linux y configurarlo, mantenerlo y solucionar problemas de forma autónoma y eficiente.
''',
    'code_example': r'''
# Ejemplo: Requisitos - Verificación de conocimientos básicos (conceptual)

# No hay un "código" para los requisitos en sí, pero estos son ejemplos de comandos
# que deberías dominar para pasar el examen LFCE.

# 1. Gestión de paquetes (ej. en un sistema basado en Debian/Ubuntu):
#    # Instalar un paquete
#    sudo apt update
#    sudo apt install nginx -y

#    # Remover un paquete
#    sudo apt remove apache2 -y

#    # Buscar un paquete
#    apt search htop

# 2. Gestión de servicios con systemd:
#    # Iniciar un servicio
#    sudo systemctl start apache2

#    # Detener un servicio
#    sudo systemctl stop nginx

#    # Habilitar un servicio para que inicie en el arranque
#    sudo systemctl enable sshd

#    # Ver el estado de un servicio
#    systemctl status sshd

# 3. Configuración de red (ej. con netplan en Ubuntu/Debian moderno):
#    # Ver la configuración de red (conceptual, el archivo real es YAML)
#    # Contenido de /etc/netplan/01-netcfg.yaml:
#    # network:
#    #   version: 2
#    #   renderer: networkd
#    #   ethernets:
#    #     enp0s3:
#    #       dhcp4: no
#    #       addresses: [192.168.1.10/24]
#    #       gateway4: 192.168.1.1
#    #       nameservers:
#    #           addresses: [8.8.8.8, 8.8.4.4]

#    # Aplicar la configuración de red
#    sudo netplan apply

#    # Mostrar configuración de interfaces
#    ip a

# 4. Gestión de almacenamiento (LVM básico):
#    # Ver grupos de volúmenes
#    sudo vgdisplay

#    # Crear un nuevo volumen lógico
#    # sudo lvcreate -L 10G -n my_logical_volume my_volume_group

#    # Formatear el volumen lógico
#    # sudo mkfs.ext4 /dev/my_volume_group/my_logical_volume

#    # Montar el volumen
#    # sudo mount /dev/my_volume_group/my_logical_volume /mnt/data

# 5. Bash Scripting (ejemplo simple):
#    # Contenido de mi_script.sh
#    #!/bin/bash
#    echo "Hola, el usuario actual es: $(whoami)"
#    df -h /var/log/ | grep -v 'Filesystem' | awk '{print "Uso de /var/log/: "$5}'

#    # Hacerlo ejecutable
#    chmod +x mi_script.sh

#    # Ejecutar el script
#    ./mi_script.sh

# Ejemplo incorrecto: No saber qué comando usar para una tarea específica.
# Por ejemplo, intentar usar `service` para gestionar servicios cuando el sistema usa `systemctl` y requiere su uso,
# o intentar instalar paquetes con `apt` en una distribución basada en Red Hat que usa `yum` o `dnf`.
# El examen espera que uses las herramientas correctas para el entorno dado.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Preparación para Certificaciones Intermedias',
    'topic': 'LFCE (Linux Foundation Certified Engineer)',
    'subtopic': 'Servicios avanzados',
    'definition': r'''
Los servicios avanzados en Linux son aquellos que van más allá de la simple instalación de paquetes o la gestión de usuarios básicos. Se refieren a la configuración, mantenimiento y solución de problemas de componentes clave que permiten a los servidores Linux funcionar como parte de una infraestructura de red compleja y robusta. Para un ingeniero certificado, entender y dominar estos servicios es fundamental.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en un escenario empresarial: un servidor necesita servir páginas web, un servidor de nombres debe traducir dominios a IPs, o los usuarios deben poder iniciar sesión de forma segura y compartir archivos en red. Sin un conocimiento profundo de estos servicios avanzados, no podrías construir, mantener o solucionar problemas en una infraestructura real. Son la base de casi cualquier aplicación o servicio moderno que se ejecute en Linux, y un dominio de ellos te diferencia como un profesional capaz de gestionar sistemas productivos.

Algunos de los servicios avanzados que un LFCE debe dominar incluyen:
* **Servidores Web (Apache HTTPD, Nginx):** Saber configurar hosts virtuales, SSL/TLS, redirecciones, módulos, y optimizar el rendimiento. Esto implica editar archivos de configuración, gestionar certificados y entender el flujo de las peticiones HTTP.
* **Servidores de Nombres de Dominio (DNS - BIND):** Configurar zonas primarias y secundarias, registros (A, AAAA, CNAME, MX, PTR), y asegurar la resolución de nombres. Es la "guía telefónica" de Internet y de tu red local.
* **Servicios de Archivos Compartidos (NFS, Samba):** Configurar exportaciones NFS para sistemas Linux/Unix y compartir archivos Samba para clientes Windows, gestionando permisos de acceso y seguridad.
* **Servicios de Autenticación (LDAP, Kerberos):** Entender cómo integrar sistemas Linux con directorios centralizados para la autenticación y autorización de usuarios, simplificando la gestión de identidades en entornos grandes.
* **Servicios de Correo Electrónico (Postfix, Dovecot):** Aunque no siempre se configura desde cero en el examen, es crucial entender los conceptos de MTA (Mail Transfer Agent) y MDA (Mail Delivery Agent), y cómo funcionan para enviar y recibir correos.
* **Bases de Datos (MySQL/MariaDB, PostgreSQL):** Saber cómo instalar, configurar los parámetros básicos, asegurar, hacer backups y restaurar bases de datos. No se espera ser un DBA, pero sí un administrador de sistemas que pueda gestionar el servicio de BD.
* **Servicios de Proxy (Squid):** Configurar proxies para caché web o para controlar el acceso a Internet.
* **Servicios de Monitoreo (Nagios, Zabbix, Prometheus):** Si bien no se espera que se configuren estos sistemas completos, sí se espera que el ingeniero pueda configurar agentes en los servidores y entender cómo se recolectan las métricas.

El dominio de estos servicios no solo implica su instalación, sino también su configuración, securización, optimización y, crucialmente, la capacidad de diagnosticar y resolver problemas cuando algo no funciona como debería.
''',
    'code_example': r'''
# Ejemplo: Servicios Avanzados - Configuración básica de Nginx como servidor web

# Este es un ejemplo simplificado de una configuración de Nginx para un sitio web básico.
# Un LFCE debería ser capaz de crear y modificar este tipo de archivos.

# 1. Archivo de configuración principal de Nginx (ej. /etc/nginx/nginx.conf - fragmento)
# user nginx;
# worker_processes auto;
# error_log /var/log/nginx/error.log;
# pid /run/nginx.pid;

# events {
#     worker_connections 1024;
# }

# http {
#     include       mime.types;
#     default_type  application/octet-stream;

#     log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
#                       '$status $body_bytes_sent "$http_referer" '
#                       '"$http_user_agent" "$http_x_forwarded_for"';

#     access_log  /var/log/nginx/access.log  main;

#     sendfile        on;
#     keepalive_timeout  65;

#     include /etc/nginx/conf.d/*.conf; # Incluir archivos de configuración adicionales
#     include /etc/nginx/sites-enabled/*; # Incluir configuraciones de sitios (Virtual Hosts)
# }

# 2. Configuración de un Virtual Host para un sitio web (ej. /etc/nginx/sites-available/mi_sitio.conf)
# server {
#     listen 80; # Escuchar en el puerto 80 (HTTP)
#     listen [::]:80; # Escuchar en IPv6

#     server_name mi-sitio.com www.mi-sitio.com; # Nombres de dominio para este host virtual

#     root /var/www/mi_sitio/html; # Directorio raíz de los archivos del sitio
#     index index.html index.htm; # Archivos por defecto a servir

#     location / {
#         try_files $uri $uri/ =404; # Intentar servir archivo, luego directorio, sino 404
#     }

#     # Configuración para servir archivos estáticos con caché (ejemplo)
#     location ~* \.(jpg|jpeg|gif|png|css|js|ico|xml)$ {
#         expires 30d;
#         access_log off;
#         log_not_found off;
#     }

#     error_page 500 502 503 504 /50x.html;
#     location = /50x.html {
#         root /usr/share/nginx/html;
#     }
# }

# 3. Habilitar el Virtual Host y recargar Nginx:
#    # Crear un enlace simbólico desde sites-available a sites-enabled
#    sudo ln -s /etc/nginx/sites-available/mi_sitio.conf /etc/nginx/sites-enabled/

#    # Probar la configuración de Nginx antes de recargar
#    sudo nginx -t

#    # Recargar el servicio Nginx para aplicar los cambios
#    sudo systemctl reload nginx

# 4. Crear un archivo HTML simple (ej. /var/www/mi_sitio/html/index.html)
#    # <h1>Hola desde mi sitio Nginx!</h1>
#    # <p>Este es un sitio de prueba.</p>

# Ejemplo incorrecto: No verificar la sintaxis de la configuración antes de recargar el servicio.
# `sudo nginx -t` es crucial para evitar que el servicio falle al iniciar con una configuración errónea.
# También, olvidar crear el enlace simbólico para habilitar el sitio en `sites-enabled`.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Preparación para Certificaciones Intermedias',
    'topic': 'LFCE (Linux Foundation Certified Engineer)',
    'subtopic': 'Configuraciones complejas',
    'definition': r'''
Las configuraciones complejas en el contexto del LFCE se refieren a escenarios que combinan múltiples servicios y funcionalidades, requiriendo un entendimiento profundo de cómo interactúan los diferentes componentes de un sistema Linux. No es solo configurar un servicio, sino integrar varios para lograr un objetivo específico y solucionar los problemas que inevitablemente surgen.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en la vida real de un ingeniero de sistemas: rara vez configuras un servicio de forma aislada. Generalmente, necesitas que un servidor web hable con una base de datos, que se autentique contra un directorio centralizado, y que esté protegido por un firewall. Un problema en cualquiera de esas integraciones puede paralizar el sistema. Las configuraciones complejas demuestran tu habilidad para diseñar, implementar y depurar soluciones integradas, lo cual es fundamental para gestionar infraestructuras robustas y escalables en entornos de producción.

Algunos ejemplos de configuraciones complejas que podrías encontrar en el examen LFCE o en la vida real incluyen:
* **Servidor Web con SSL/TLS y Virtual Hosts:** Configurar Nginx o Apache para servir múltiples sitios web seguros (HTTPS) usando certificados SSL/TLS, con diferentes configuraciones para cada dominio.
* **Configuración de Firewall avanzada:** Utilizar `firewalld` o `iptables` para permitir/denegar tráfico basado en puertos, IPs de origen/destino, interfaces, y establecer reglas de NAT (Network Address Translation).
* **LVM y RAID en conjunto:** Crear volúmenes lógicos sobre un arreglo RAID (ej. RAID 1 o RAID 5) para asegurar la redundancia y flexibilidad del almacenamiento.
* **Servidor DHCP con PXE Boot:** Configurar un servidor DHCP para asignar IPs, y habilitar el arranque por red (PXE) para instalar sistemas operativos automáticamente en nuevos servidores.
* **Autenticación centralizada con LDAP/FreeIPA:** Integrar clientes Linux para autenticarse contra un servidor LDAP o FreeIPA, gestionando usuarios, grupos y políticas de seguridad desde una ubicación central.
* **Servidor NFS/Samba con autenticación de usuarios:** Configurar un recurso compartido de archivos que requiera autenticación de usuario y gestione permisos a nivel de sistema de archivos y de red.
* **Contenedores y Orquestación Básica (Docker):** Aunque LFCE no es de Kubernetes, se espera entender el uso básico de Docker: correr contenedores, construir imágenes simples, gestionar volúmenes y redes de contenedores para aplicaciones simples.
* **Resolución de problemas de red:** Diagnosticar problemas de conectividad que involucran DNS, firewall, rutas o interfaces, usando herramientas como `ping`, `traceroute`, `ss`, `dig`, `nmap`.

La clave para dominar estas configuraciones es entender no solo los comandos y archivos de configuración de cada servicio individual, sino también cómo interactúan entre sí y cómo depurar los problemas que surgen en esa interacción.
''',
    'code_example': r'''
# Ejemplo: Configuraciones complejas - Configuración básica de Nginx con SSL (Conceptual)

# Este ejemplo asume que ya tienes un certificado SSL/TLS (mi_sitio.crt y mi_sitio.key).
# En un examen real, podrías tener que generar uno o trabajar con uno dado.

# 1. Configuración de Virtual Host para HTTPS (ej. /etc/nginx/sites-available/mi_sitio_ssl.conf)
# server {
#     listen 443 ssl http2; # Escuchar en el puerto 443 (HTTPS), habilitar SSL y HTTP/2
#     listen [::]:443 ssl http2;

#     server_name mi-sitio.com www.mi-sitio.com;

#     ssl_certificate /etc/nginx/ssl/mi_sitio.crt; # Ruta a tu certificado
#     ssl_certificate_key /etc/nginx/ssl/mi_sitio.key; # Ruta a tu clave privada

#     # Configuración SSL/TLS recomendada para seguridad
#     ssl_protocols TLSv1.2 TLSv1.3;
#     ssl_prefer_server_ciphers on;
#     ssl_ciphers 'ECDHE+AESGCM:ECDHE+AES256:AES256+EECDH:AES256:+AES256';
#     ssl_session_cache shared:SSL:10m;
#     ssl_session_timeout 10m;
#     ssl_stapling on;
#     ssl_stapling_verify on;
#     resolver 8.8.8.8 8.8.4.4 valid=300s;
#     resolver_timeout 5s;

#     root /var/www/mi_sitio/html;
#     index index.html index.htm;

#     location / {
#         try_files $uri $uri/ =404;
#     }

#     # Redireccionar HTTP a HTTPS (opcional, pero buena práctica)
#     # Este bloque iría en /etc/nginx/sites-available/mi_sitio.conf o un archivo separado
#     # server {
#     #     listen 80;
#     #     listen [::]:80;
#     #     server_name mi-sitio.com www.mi-sitio.com;
#     #     return 301 https://$host$request_uri;
#     # }
# }

# 2. Pasos para la implementación (conceptual):
#    # Crear el directorio para los certificados
#    sudo mkdir -p /etc/nginx/ssl/

#    # Copiar tus archivos de certificado y clave privada
#    sudo cp mi_sitio.crt /etc/nginx/ssl/
#    sudo cp mi_sitio.key /etc/nginx/ssl/
#    sudo chmod 600 /etc/nginx/ssl/mi_sitio.key # Asegurar permisos estrictos para la clave

#    # Habilitar el nuevo virtual host
#    sudo ln -s /etc/nginx/sites-available/mi_sitio_ssl.conf /etc/nginx/sites-enabled/

#    # Probar la configuración de Nginx
#    sudo nginx -t

#    # Recargar el servicio Nginx
#    sudo systemctl reload nginx

# 3. Verificación de LVM sobre RAID (conceptual, pasos resumidos):
#    # Asegurar que los discos físicos están presentes y en buen estado.
#    # Crear un arreglo RAID (ej. mdadm --create /dev/md0 --level=1 --raid-devices=2 /dev/sdb1 /dev/sdc1)
#    # Crear un Volumen Físico (PV) en el arreglo RAID (pvcreate /dev/md0)
#    # Crear un Grupo de Volumen (VG) (vgcreate my_vg /dev/md0)
#    # Crear un Volumen Lógico (LV) (lvcreate -L 10G -n my_lv my_vg)
#    # Formatear el LV (mkfs.ext4 /dev/my_vg/my_lv)
#    # Montar y añadir al fstab para persistencia.

# Ejemplo incorrecto: No gestionar los permisos de los archivos de certificado y clave.
# Si la clave privada de SSL tiene permisos demasiado laxos, Nginx no iniciará por razones de seguridad.
# También, no entender la cadena de configuración (ej. dónde colocar los archivos `.conf` o cómo `include`s funcionan).
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Preparación para Certificaciones Intermedias',
    'topic': 'LFCE (Linux Foundation Certified Engineer)',
    'subtopic': 'Simulacros prácticos',
    'definition': r'''
Los simulacros prácticos son, sin duda, la parte más crucial de la preparación para un examen como el LFCE. Dado que es un examen completamente práctico, sentarse a leer libros y ver videos no es suficiente. Necesitas ensuciarte las manos, enfrentarte a escenarios realistas y, lo más importante, aprender a solucionar problemas bajo presión de tiempo.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en un piloto que solo ha leído manuales de vuelo. Por mucha teoría que sepa, si nunca ha volado un avión en un simulador o en la vida real, no estará preparado para una emergencia. De la misma manera, la certificación LFCE no evalúa lo que sabes, sino lo que puedes *hacer*. Los simulacros te exponen a fallos, configuraciones erróneas y situaciones inesperadas, entrenando tu mente para diagnosticar y resolver problemas de forma eficiente, lo cual es fundamental para aprobar el examen y, más importante aún, para ser un ingeniero de sistemas competente.

Aquí te dejo algunos consejos y tipos de simulacros que te ayudarán:
* **Máquinas virtuales descartables:** Usa VirtualBox, Vagrant o Docker para crear y destruir entornos de pruebas rápidamente. Así, puedes intentar y fallar sin miedo a estropear tu sistema principal. La infraestructura efímera es tu mejor amiga aquí.
* **Escenarios basados en problemas:** No solo practiques "cómo instalar Nginx". Practica "Nginx no está sirviendo páginas, ¿qué está pasando y cómo lo arreglo?". Enfócate en la depuración.
* **Limitaciones de tiempo:** Intenta resolver los problemas en un tiempo limitado, similar al examen. Esto te ayudará a gestionar la presión y a priorizar tareas.
* **Documentación oficial:** Familiarízate con la documentación `man` pages y `info` pages. En el examen, tendrás acceso a ellas, pero no a internet. Saber buscar información rápidamente es una habilidad vital.
* **Comandos de diagnóstico:** Domina herramientas como `journalctl`, `dmesg`, `ss`, `netstat`, `dig`, `nslookup`, `route`, `ip`, `strace`, `lsof`, `df`, `du`.
* **Restablecer el entorno:** Después de cada intento en un simulacro, restablece tu máquina virtual a un estado inicial limpio. Esto garantiza que cada práctica sea consistente y que no estés construyendo sobre errores anteriores.
* **Practicar en diferentes distribuciones:** Aunque el examen de LFCE se centra en una distribución genérica basada en RHEL/CentOS o Debian/Ubuntu (dependiendo de la versión o foco), practicar en ambas te da una base más sólida.

Los simulacros prácticos son tu campo de batalla. Cuantas más "batallas" libres, mejor preparado estarás para el examen y para los desafíos reales de la administración de sistemas Linux.
''',
    'code_example': r'''
# Ejemplo: Simulacros prácticos - Escenario de solución de problemas de red

# Un escenario común de examen es que un servicio no es accesible desde la red.
# Aquí se muestra un flujo de depuración con comandos clave.

# Escenario: El servidor web Nginx no es accesible desde otra máquina.

# 1. ¿El servicio Nginx está corriendo en el servidor?
#    sudo systemctl status nginx
#    # Si no está 'active (running)', intentar iniciarlo: sudo systemctl start nginx
#    # Revisar logs si no inicia: sudo journalctl -u nginx.service

# 2. ¿Nginx está escuchando en el puerto correcto (80 o 443)?
#    # Usar 'ss' (socket statistics) para ver puertos abiertos
#    sudo ss -tuln | grep 80
#    sudo ss -tuln | grep 443
#    # Si no está escuchando, revisar la configuración de Nginx (nginx -t y sus conf.d/sites-enabled)

# 3. ¿El firewall está bloqueando el tráfico?
#    # Para firewalld (RHEL/CentOS/Fedora)
#    sudo firewall-cmd --list-all # Ver zonas y reglas activas
#    sudo firewall-cmd --get-active-zones # Ver zonas activas por interfaz
#    # Si el puerto 80/443 no está permitido, añadirlo:
#    # sudo firewall-cmd --zone=public --add-port=80/tcp --permanent
#    # sudo firewall-cmd --zone=public --add-port=443/tcp --permanent
#    # sudo firewall-cmd --reload

#    # Para iptables (distribuciones más antiguas o configuración manual)
#    # sudo iptables -L -n -v # Listar reglas
#    # sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT # Ejemplo de añadir regla (temporal)
#    # sudo service iptables save # Para guardar reglas (varía según la distro)

# 4. ¿Hay problemas de enrutamiento o conectividad a nivel de red?
#    # Desde el servidor web, hacer ping a la máquina cliente y viceversa
#    ping <IP_de_cliente>
#    ping 8.8.8.8 # Probar conectividad externa

#    # Revisar la tabla de enrutamiento del servidor web
#    ip route show
#    # Asegurarse de que hay una ruta por defecto y que apunta al gateway correcto

#    # Verificar la configuración IP de la interfaz de red
#    ip a show eth0 # O el nombre de tu interfaz

# 5. ¿Hay problemas de resolución de nombres (DNS)?
#    # Si estás intentando acceder por nombre de host, ¿resuelve correctamente?
#    dig mi-sitio.com
#    nslookup mi-sitio.com
#    # Revisar /etc/resolv.conf en el cliente y servidor

# Ejemplo incorrecto: Saltarse pasos o asumir la causa del problema.
# Un error común es asumir que es el firewall cuando en realidad el servicio ni siquiera está iniciado.
# Siempre sigue un enfoque sistemático: ¿el servicio está corriendo? ¿está escuchando? ¿el firewall lo permite? ¿la red es accesible?
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Preparación para Certificaciones Intermedias',
    'topic': 'RHCE (Red Hat Certified Engineer)',
    'subtopic': 'Automatización con Ansible',
    'definition': '''
Aquí vamos a meternos de lleno en cómo la automatización con Ansible es fundamental para el examen RHCE. Ansible es una herramienta súper potente que te permite gestionar y configurar múltiples servidores de forma centralizada y eficiente. Es una de esas habilidades que, una vez que la dominas, te ahorra muchísimo tiempo y esfuerzo en la administración de sistemas.

¿Te estás preguntando por qué esto importa? 

En el mundo real, nadie quiere configurar manualmente 100 servidores uno por uno. La automatización es clave para escalar, reducir errores y asegurar la consistencia. Para el RHCE, no es solo saber usar Ansible, sino entender por qué es la herramienta preferida en los entornos Red Hat y cómo aplicarla para resolver problemas complejos de administración.

Cuando hablamos de automatización con Ansible en el contexto del RHCE, nos referimos a la capacidad de escribir playbooks que definan el estado deseado de tus sistemas. Esto incluye la instalación de paquetes, la configuración de servicios, la gestión de usuarios, y mucho más. Ansible se basa en SSH, lo que lo hace muy ligero y no requiere agentes en los nodos gestionados, lo cual es una gran ventaja. Pensemos por un momento en cómo esto simplifica la gestión de la infraestructura: en lugar de ejecutar comandos uno por uno en cada máquina, describes lo que quieres que suceda en un archivo YAML y Ansible se encarga del resto. La idempotencia es otro concepto crucial aquí, significa que puedes ejecutar el mismo playbook varias veces y el resultado siempre será el mismo, sin causar efectos no deseados si el sistema ya está en el estado deseado. Esto es vital para la fiabilidad y la previsibilidad de tus operaciones.
''',
    'code_example': r'''
// Ejemplo correcto de un playbook Ansible para instalar Nginx y asegurar que el servicio esté corriendo
// Este playbook asegura que Nginx esté instalado y activo en los servidores web.
---
- name: Instalar y configurar Nginx
  hosts: webservers
  become: yes # Ejecutar con privilegios de root
  tasks:
    - name: Asegurar que Nginx esté instalado
      ansible.builtin.yum:
        name: nginx
        state: present

    - name: Asegurar que Nginx esté corriendo y habilitado
      ansible.builtin.service:
        name: nginx
        state: started
        enabled: yes

// Ejemplo incorrecto: Intentar instalar Nginx con 'apt' en un sistema RHEL/CentOS
// Esto fallaría porque 'apt' es para sistemas basados en Debian/Ubuntu, no Red Hat.
---
- name: Intentar instalar Nginx con apt (Incorrecto para RHEL)
  hosts: webservers
  become: yes
  tasks:
    - name: Instalar Nginx usando apt
      ansible.builtin.apt:
        name: nginx
        state: present
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Preparación para Certificaciones Intermedias',
    'topic': 'RHCE (Red Hat Certified Engineer)',
    'subtopic': 'Servicios avanzados',
    'definition': '''
Cuando hablamos de servicios avanzados en el contexto del examen RHCE, estamos subiendo un escalón desde lo básico que vimos en el nivel Jr. Aquí no solo se trata de saber iniciar o detener un servicio, sino de entender cómo funcionan internamente, cómo configurarlos para que sean robustos y seguros, y cómo depurar problemas complejos. Piensa en servicios como Apache HTTP Server, Postfix para correo, o NFS para compartición de archivos en red.

Seguramente pensarás de qué va todo esto... 

La profundidad en la configuración de servicios es lo que distingue a un administrador de sistemas intermedio. No es suficiente con que un servicio esté corriendo; debe estar optimizado para el rendimiento, asegurado contra accesos no autorizados y configurado para registrar información útil para la auditoría y el monitoreo. En el RHCE, se espera que seas capaz de configurar estos servicios para cumplir con requisitos específicos, lo que a menudo implica editar archivos de configuración, gestionar firewalls, y entender cómo interactúan los diferentes componentes. Por ejemplo, configurar un servidor web para servir contenido dinámico, asegurar las comunicaciones con SSL/TLS, o montar comparticiones de red de forma persistente y con permisos adecuados. Se trata de dominar el ciclo de vida completo de un servicio, desde su instalación y configuración hasta su monitoreo y resolución de problemas.
''',
    'code_example': r'''
// Ejemplo de configuración avanzada para Apache (HTTPD) en RHEL
// Este fragmento de código muestra cómo crear un Virtual Host para un sitio web específico
// y asegurar que el módulo SSL esté cargado para HTTPS.
# Archivo de configuración de Virtual Host (ejemplo: /etc/httpd/conf.d/mi_sitio.conf)
<VirtualHost *:80>
    ServerName www.ejemplo.com
    DocumentRoot /var/www/html/mi_sitio
    ErrorLog /var/log/httpd/mi_sitio_error.log
    CustomLog /var/log/httpd/mi_sitio_access.log combined
</VirtualHost>

<VirtualHost *:443>
    ServerName www.ejemplo.com
    DocumentRoot /var/www/html/mi_sitio
    ErrorLog /var/log/httpd/mi_sitio_ssl_error.log
    CustomLog /var/log/httpd/mi_sitio_ssl_access.log combined
    SSLEngine on
    SSLCertificateFile /etc/pki/tls/certs/localhost.crt
    SSLCertificateKeyFile /etc/pki/tls/private/localhost.key
</VirtualHost>

// Ejemplo incorrecto: Intentar configurar un servicio sin reiniciar o recargar después de cambios
// Después de modificar un archivo de configuración, es crucial aplicar los cambios.
// Por ejemplo, modificar /etc/httpd/conf/httpd.conf sin ejecutar 'systemctl reload httpd' o 'systemctl restart httpd'.
// Esto no aplicaría los cambios y el servicio seguiría operando con la configuración antigua.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Preparación para Certificaciones Intermedias',
    'topic': 'RHCE (Red Hat Certified Engineer)',
    'subtopic': 'Seguridad avanzada',
    'definition': '''
En el RHCE, la seguridad avanzada no es un tema aparte, sino que permea todas las demás áreas. Se trata de ir más allá de lo básico, como configurar un firewall, y adentrarse en cómo proteger tu sistema a un nivel más granular. Esto incluye entender y aplicar SELinux, gestionar correctamente las credenciales, proteger SSH de manera robusta, y realizar auditorías de seguridad básicas.

¿Te estás preguntando por qué esto importa? 

Porque un sistema no es útil si no es seguro. Una brecha de seguridad puede tener consecuencias devastadoras para una organización. Por eso, el examen RHCE pone un fuerte énfasis en que los administradores de sistemas sean capaces de proteger los entornos Red Hat de amenazas comunes. Esto significa no solo saber cómo funciona SELinux, sino cómo interpretar sus logs, solucionar problemas de permisos y escribir políticas simples. También implica asegurar los servicios de red, como SSH, utilizando autenticación basada en claves en lugar de contraseñas, deshabilitando el acceso de root directo y limitando los usuarios que pueden acceder. La seguridad avanzada también abarca la gestión de actualizaciones de seguridad, la monitorización de logs en busca de actividades sospechosas, y la implementación de buenas prácticas de "hardening" del sistema para minimizar la superficie de ataque.
''',
    'code_example': r'''
// Ejemplo correcto de configuración de SSH para mayor seguridad
// Deshabilitar la autenticación con contraseña y permitir solo la autenticación con clave SSH.
// También se deshabilita el acceso directo como root.
# Archivo: /etc/ssh/sshd_config
# Permitir solo autenticación por clave pública
PasswordAuthentication no
ChallengeResponseAuthentication no
UsePAM yes
# Deshabilitar el acceso directo como root
PermitRootLogin no
# Permitir el acceso solo a usuarios específicos (opcional)
AllowUsers miusuario

// Después de modificar, siempre reiniciar el servicio SSH
// systemctl restart sshd

// Ejemplo incorrecto: Dejar la autenticación por contraseña habilitada y permitir el acceso de root.
// Esto expone el servidor a ataques de fuerza bruta y aumenta el riesgo de compromiso.
# Archivo: /etc/ssh/sshd_config
# Permitir autenticación por contraseña (INSEGURO para entornos de producción)
PasswordAuthentication yes
# Permitir acceso directo como root (INSEGURO)
PermitRootLogin yes
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Preparación para Certificaciones Intermedias',
    'topic': 'RHCE (Red Hat Certified Engineer)',
    'subtopic': 'Estrategias de examen',
    'definition': '''
Las estrategias de examen para el RHCE son cruciales porque no es un examen de opción múltiple; es completamente práctico. Esto significa que no solo necesitas saber la teoría, sino que tienes que ser capaz de aplicar tus conocimientos en un entorno de laboratorio real, resolviendo problemas específicos y logrando configuraciones funcionales. La diferencia entre pasar y no pasar a menudo recae en una buena estrategia, más allá del mero conocimiento.

No sé tú, pero a mí esto al principio me costó... 

La clave para el RHCE es la práctica, mucha práctica. Debes familiarizarte con el entorno del examen, que es un sistema Red Hat real, y sentirte cómodo ejecutando comandos y resolviendo tareas bajo presión. Una estrategia fundamental es leer cuidadosamente cada pregunta y entender exactamente lo que se te pide. A veces, las preguntas pueden tener "trampas" o detalles que, si se pasan por alto, pueden llevarte a una solución incorrecta. Otro punto vital es la gestión del tiempo: no te quedes atascado en una sola pregunta. Si algo te parece muy difícil, déjalo para el final y pasa a la siguiente. Asegúrate de verificar tu trabajo; no asumas que una configuración es correcta solo porque la hiciste. Prueba tus soluciones. Por ejemplo, si configuras un servicio web, intenta acceder a él desde la línea de comandos o un navegador. Si configuras un usuario, intenta iniciar sesión con él. La documentación oficial de Red Hat es tu mejor amiga durante el examen, aprende a navegar por ella rápidamente para encontrar la información que necesitas.
''',
    'code_example': r'''
// Ejemplo de estrategia: Verificar la conectividad de red después de una configuración.
// Antes de pasar a la siguiente tarea, es buena idea verificar si la configuración de red
// que acabas de hacer funciona correctamente.
// Comando para verificar si un servidor web recién configurado es accesible.
ping www.ejemplo.com
curl http://www.ejemplo.com/

// Ejemplo de estrategia: Verificar el estado de un servicio.
// Después de configurar o reiniciar un servicio, siempre verifica su estado.
systemctl status nombre_del_servicio
journalctl -xeu nombre_del_servicio

// Ejemplo incorrecto: No verificar las soluciones.
// Asumir que un servicio se inició correctamente sin verificarlo, o que una configuración
// de firewall está bien sin probarla. Esto puede llevar a que una tarea sea marcada como incompleta
// o incorrecta sin que te des cuenta.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Preparación para Certificaciones Intermedias',
    'topic': 'LPIC-2',
    'subtopic': 'Objetivos del examen',
    'definition': '''
Los objetivos del examen LPIC-2 te dan una idea clara de lo que se espera de ti para esta certificación, que es un paso adelante significativo después del LPIC-1. Aquí la meta es demostrar que tienes las habilidades necesarias para administrar sistemas Linux mixtos de tamaño pequeño a mediano, es decir, entornos donde Linux coexiste con otros sistemas operativos. Esto incluye temas como la seguridad, la red, el mantenimiento y la resolución de problemas avanzados.

Seguramente pensarás de qué va todo esto... 

Pues bien, los objetivos del LPIC-2 no son un secreto; el LPI (Linux Professional Institute) los publica de forma detallada. La idea es que sepas qué temas estudiar a fondo para no llevarte sorpresas. Te vas a encontrar con que el examen se divide en dos partes: el examen 201 y el examen 202. Cada uno cubre áreas específicas, y es crucial que revises cada objetivo individualmente. Por ejemplo, en el examen 201, se abordan temas como la capacidad del sistema, el kernel de Linux, el arranque del sistema, los sistemas de archivos y el almacenamiento avanzado. En el 202, te centras en DNS, servicios web, compartición de archivos, gestión de clientes y servicios de correo electrónico. Es como un mapa que te guía por todo el territorio que necesitas dominar. La clave es no solo memorizar, sino entender el "por qué" detrás de cada configuración y cómo solucionar problemas cuando las cosas no salen como esperabas.
''',
    'code_example': r'''
// No aplica un ejemplo de código directo para "Objetivos del examen",
// ya que este subtema se refiere a la estructura y el contenido del examen en sí.
// Sin embargo, podemos simular cómo uno podría revisar los objetivos.

// Pasos para revisar los objetivos del examen LPIC-2:
// 1. Visita la página oficial de LPI (Linux Professional Institute).
// 2. Busca la sección de certificaciones y selecciona "LPIC-2: Linux Engineer".
// 3. Descarga o revisa los "Objetivos del Examen" para el examen 201 y 202.

// Ejemplo de un posible objetivo del examen (hipotético):
// "201.1: Configurar el arranque del sistema"
// Esto implicaría saber sobre GRUB, systemd, runlevels, etc.

// Un "ejemplo incorrecto" sería no revisar los objetivos,
// y estudiar temas que no son relevantes para el examen,
// lo que resultaría en una preparación ineficiente.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Preparación para Certificaciones Intermedias',
    'topic': 'LPIC-2',
    'subtopic': 'Administración avanzada',
    'definition': '''
En la administración avanzada para el LPIC-2, ya no estamos hablando de los comandos básicos de `ls` o `cd`. Aquí nos metemos con la gestión profunda del sistema, lo que incluye el mantenimiento del kernel, la gestión de procesos a un nivel más complejo, la configuración de la seguridad del sistema y el manejo de los sistemas de archivos avanzados. Es el tipo de conocimiento que te permite diagnosticar y resolver problemas complejos en entornos de producción.

Vamos a ver de que se trata todo esto... 

Piensa en la diferencia entre saber conducir un coche y ser un mecánico experimentado. En la administración avanzada, te conviertes en ese mecánico del sistema operativo. Esto significa que debes entender cómo compilar un kernel o sus módulos, cómo utilizar herramientas avanzadas para la gestión de procesos como `nice` y `renice` para ajustar las prioridades, o `strace` para depurar problemas de aplicaciones. También se profundiza en la configuración de SELinux o AppArmor para una seguridad a nivel de kernel, y en la gestión de volúmenes lógicos con LVM. No es solo saber cómo usar `fdisk`, sino cómo diseñar esquemas de particionamiento robustos y cómo recuperar datos de sistemas de archivos corruptos. La administración avanzada también abarca la gestión de copias de seguridad y restauración, la planificación de la capacidad y el monitoreo detallado del rendimiento para asegurar que los sistemas funcionen de manera óptima y estén siempre disponibles.
''',
    'code_example': r'''
// Ejemplo de administración avanzada: Gestión de LVM (Logical Volume Management)
// Crear un volumen lógico para ampliar el espacio de un sistema de archivos sin desmontarlo.
// Este ejemplo asume que ya tienes un grupo de volúmenes (VG) llamado 'my_vg'.

// 1. Extender el tamaño del volumen lógico 'data_lv' en 'my_vg' por 5GB.
//    Primero, asegúrate de tener espacio libre en el VG.
//    lvextend -L +5G /dev/my_vg/data_lv

// 2. Redimensionar el sistema de archivos (ej. XFS) para que ocupe el nuevo espacio.
//    xfs_growfs /mnt/data # Si es XFS

//    O para ext4:
//    resize2fs /dev/my_vg/data_lv # Si es ext4

// Ejemplo incorrecto: Intentar redimensionar un sistema de archivos sin extender primero el volumen lógico subyacente.
// O intentar redimensionar un volumen lógico sin espacio suficiente en el grupo de volúmenes.
// Esto podría resultar en errores y, en el peor de los casos, en pérdida de datos.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Preparación para Certificaciones Intermedias',
    'topic': 'LPIC-2',
    'subtopic': 'Networking avanzado',
    'definition': '''
Cuando hablamos de networking avanzado para el LPIC-2, nos referimos a ir más allá de simplemente configurar una IP. Aquí te sumerges en el diseño y la implementación de redes Linux complejas, lo que incluye la configuración de enrutamiento avanzado, firewalls con `iptables` o `nftables`, servicios de red como DNS y DHCP, y la implementación de VPNs. Es el nivel en el que puedes asegurar y optimizar la comunicación entre servidores.

¿Te estás preguntando por qué esto importa? 

Porque en la mayoría de los entornos empresariales, los sistemas Linux no viven aislados; son parte de una red compleja y deben comunicarse de forma segura y eficiente. Para el LPIC-2, se espera que puedas configurar un servidor Linux para que actúe como un router, manejar múltiples interfaces de red, y configurar reglas de firewall para controlar el tráfico. Esto también implica entender los diferentes tipos de registros DNS (A, MX, CNAME, etc.) y cómo un servidor DNS se integra en una red. No se trata solo de hacer que los sistemas hablen entre sí, sino de asegurarse de que lo hagan de manera segura y confiable. Esto puede incluir configurar OpenVPN o WireGuard para conexiones seguras a través de redes públicas, o utilizar herramientas de monitoreo de red para diagnosticar problemas de rendimiento o conectividad. En resumen, la sección de networking avanzado del LPIC-2 te prepara para ser un arquitecto de red Linux, no solo un usuario.
''',
    'code_example': r'''
// Ejemplo de networking avanzado: Configuración de iptables para NAT (Network Address Translation)
// Permitir que los hosts en una red interna accedan a Internet a través de un servidor Linux.
// Este ejemplo asume que eth0 es la interfaz externa y eth1 es la interna.

// Habilitar el reenvío de IP en el kernel (persisten los cambios en /etc/sysctl.conf)
// sysctl -w net.ipv4.ip_forward=1
// echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf

// Reglas de iptables para NAT saliente (masquerading)
// iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

// Reglas para permitir el tráfico de reenvío
// iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
// iptables -A FORWARD -i eth0 -o eth1 -m state --state RELATED,ESTABLISHED -j ACCEPT

// Guardar las reglas (dependiendo de la distribución, ej. iptables-save > /etc/sysconfig/iptables)

// Ejemplo incorrecto: Olvidar habilitar el reenvío de IP (`net.ipv4.ip_forward`)
// Si no se habilita el reenvío de IP, el enrutamiento y NAT no funcionarán,
// y los hosts internos no podrán acceder a Internet a través de este servidor.
'''
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Preparación para Certificaciones Intermedias',
    'topic': 'LPIC-2',
    'subtopic': 'Plan de estudio',
    'definition': '''
Un buen plan de estudio para el LPIC-2 es tu hoja de ruta para el éxito. Dada la amplitud y profundidad de los temas, no puedes simplemente lanzarte a estudiar sin una estrategia. Un plan bien estructurado te ayudará a organizar tu tiempo, identificar tus puntos débiles y asegurarte de cubrir todo el material necesario de manera efectiva. No es solo sentarse a leer; es una combinación de teoría, práctica y autoevaluación.

No sé tú, pero a mí esto al principio me costó... 

La clave para un plan de estudio efectivo para el LPIC-2 es la consistencia y la práctica. Primero, desglosa los objetivos del examen (que vimos antes) en bloques manejables. Dedica tiempo a cada uno, alternando entre la lectura de material teórico (libros, documentación oficial, cursos en línea) y la práctica intensiva en un entorno de laboratorio. Monta máquinas virtuales o usa contenedores Docker para replicar los escenarios del examen. Por ejemplo, si estás estudiando redes, configura servidores DNS y DHCP en tus VMs. Si estás viendo almacenamiento, practica con LVM. No olvides la importancia de la repetición espaciada: repasa los temas periódicamente para consolidar tu conocimiento. Además, haz simulacros de examen. Esto te ayudará a familiarizarte con el formato de las preguntas, a gestionar tu tiempo y a identificar las áreas donde necesitas mejorar. Finalmente, únete a comunidades en línea o foros de estudio. Compartir experiencias y resolver dudas con otros estudiantes puede ser increíblemente útil.
''',
    'code_example': r'''
// Un plan de estudio no se traduce directamente en código,
// pero podemos ilustrar los pasos que lo componen como si fueran un script.

// Pseudo-código para un plan de estudio efectivo para LPIC-2:

// Función para estudiar un módulo
// function study_module(module_name, duration_hours):
//     print("Estudiando teoría de " + module_name + " por " + duration_hours + " horas.")
//     // Leer libros, documentación, ver tutoriales.

// Función para practicar un módulo
// function practice_module(module_name, duration_hours):
//     print("Practicando escenarios de " + module_name + " por " + duration_hours + " horas.")
//     // Configurar VMs, resolver ejercicios, simular problemas.

// Función para realizar un simulacro de examen
// function take_mock_exam():
//     print("Realizando simulacro de examen LPIC-2.")
//     // Evaluar tiempo, identificar puntos débiles.

// main_study_plan():
//     // Fase 1: Dominar el examen 201
//     study_module("Kernel y Sistema de Arranque", 20)
//     practice_module("Kernel y Sistema de Arranque", 30)
//     study_module("Sistemas de Archivos y Almacenamiento", 25)
//     practice_module("Sistemas de Archivos y Almacenamiento", 35)
//     // ... y así sucesivamente para todos los objetivos del 201

//     take_mock_exam() // Evaluar progreso del 201

//     // Fase 2: Dominar el examen 202
//     study_module("DNS y Servicios Web", 20)
//     practice_module("DNS y Servicios Web", 30)
//     // ... y así sucesivamente para todos los objetivos del 202

//     take_mock_exam() // Evaluar progreso del 202

//     // Fase 3: Repaso general y simulacros finales
//     study_module("Repaso General", 40)
//     practice_module("Repaso General", 40)
//     take_mock_exam()
//     take_mock_exam()

// El "ejemplo incorrecto" sería un estudio desorganizado:
// - Saltar de un tema a otro sin un orden lógico.
// - Solo leer sin practicar en un entorno real.
// - No hacer simulacros de examen para evaluar el progreso.
'''
  });
}
