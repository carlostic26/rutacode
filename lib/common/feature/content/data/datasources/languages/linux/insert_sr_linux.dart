import 'package:sqflite_common/sqlite_api.dart';

Future<void> insertSrLevel1DataLinux(Database db) async {
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Arquitectura de Sistemas',
    'topic': 'Diseño de Infraestructura',
    'subtopic': 'Patrones arquitectónicos',
    'definition': '''
Cuando hablamos de patrones arquitectónicos en sistemas, nos referimos a soluciones comunes que se han ido consolidando con el tiempo para resolver problemas complejos de diseño en la infraestructura de software y hardware.

Pensemos por un momento en cómo se construyen los edificios. No todos son iguales, pero muchos comparten estructuras similares: columnas, cimientos, techos. En sistemas pasa algo parecido: usamos patrones como cliente-servidor, microservicios, o arquitectura en capas para ordenar cómo se comunican las piezas entre sí.

Cada patrón tiene sus ventajas y desventajas. Por ejemplo, los microservicios ofrecen escalabilidad y autonomía, pero también pueden complicar el monitoreo y la depuración. Otros, como el patrón monolítico, son más simples de implementar, pero escalan peor y pueden volverse difíciles de mantener.

Comprender estos patrones no es solo teoría: te ayuda a tomar mejores decisiones cuando diseñás infraestructuras reales, evitando reinventar la rueda o cometer errores costosos.
''',
    'code_example': r'''
# Este es un esquema simple de patrón cliente-servidor

# Servidor
import socket

server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind(('localhost', 9000))
server.listen(1)
conn, addr = server.accept()
print(f'Conexión establecida con {addr}')
conn.send(b'Hola desde el servidor')
conn.close()

# Cliente
import socket

client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client.connect(('localhost', 9000))
print(client.recv(1024).decode())  # Espera: Hola desde el servidor
client.close()
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Arquitectura de Sistemas',
    'topic': 'Diseño de Infraestructura',
    'subtopic': 'Escalabilidad horizontal/vertical',
    'definition': '''
Escalar un sistema significa hacerlo crecer para que soporte más usuarios o mayor carga sin explotar en el intento. Y hay dos formas clásicas de hacerlo: horizontal y vertical.

¿La diferencia? Escalabilidad vertical es mejorar "el mismo servidor", como si le pusieras más RAM, mejor CPU o discos más rápidos. En cambio, escalabilidad horizontal es sumar "más servidores", repartiéndose la carga entre varios.

Lo vertical puede parecer más fácil, pero tiene un límite físico y es caro. Lo horizontal es más flexible y usado en arquitecturas modernas tipo microservicios o clústeres de contenedores, como en Kubernetes.

Claro que escalar horizontalmente requiere que tu software esté diseñado para ello: sin dependencias compartidas, con buen manejo de estados, y capacidad de balanceo de carga. No todo se puede escalar horizontalmente sin refactorizar.
''',
    'code_example': r'''
# Escalabilidad vertical: agregar recursos al mismo servidor
# Supón que aumentás la RAM de 8GB a 32GB en una máquina con PostgreSQL

# Escalabilidad horizontal: añadir nodos
# Un ejemplo simple con Nginx como balanceador:

# nginx.conf
upstream backend {
  server app1.local;
  server app2.local;
}

server {
  listen 80;
  location / {
    proxy_pass http://backend;
  }
}

# Ahora hay dos instancias (app1, app2) atendiendo solicitudes
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Arquitectura de Sistemas',
    'topic': 'Diseño de Infraestructura',
    'subtopic': 'Tolerancia a fallos',
    'definition': '''
Tolerancia a fallos significa que un sistema sigue funcionando, aunque algo dentro de él se rompa. No se trata de evitar los errores, sino de prepararse para que no sean catastróficos.

Seguramente ya te topaste con sitios web que no cargan por completo, pero no tiran error 500. Tal vez un microservicio falló, pero el resto siguió respondiendo. Eso es tolerancia a fallos.

Se logra con estrategias como redundancia (varios servidores haciendo lo mismo), replicación de bases de datos, balanceadores de carga que detectan nodos caídos, o incluso watchdogs que reinician procesos automáticamente.

Esta filosofía se vuelve vital cuando estás en producción: un fallo no puede frenar a toda la empresa. Netflix, por ejemplo, usa algo llamado "Chaos Monkey" que rompe servicios a propósito para verificar que su infraestructura lo soporte. Hardcore, pero efectivo.
''',
    'code_example': r'''
# Un ejemplo básico de supervisión con systemd

# /etc/systemd/system/mi-servicio.service
[Unit]
Description=Mi Servicio Tolerante
After=network.target

[Service]
ExecStart=/usr/bin/python3 /opt/mi_app.py
Restart=always  # Si falla, se reinicia automáticamente
RestartSec=5

[Install]
WantedBy=multi-user.target

# Esto permite que el sistema reinicie el servicio si se cae
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Arquitectura de Sistemas',
    'topic': 'Diseño de Infraestructura',
    'subtopic': 'Planes de capacidad',
    'definition': '''
Los planes de capacidad son estrategias que ayudan a anticipar cuántos recursos vas a necesitar a medida que tu sistema crece. No es magia, es proyección basada en datos.

Capacidad no significa solo servidores. También incluye ancho de banda, espacio en disco, uso de CPU y RAM, licencias, incluso equipos humanos. Y sí, si no planificás, te puede agarrar el pico de tráfico sin tener cómo responder.

Esto tiene una explicación: los sistemas no escalan solos. Si ya sabés que tu tráfico se duplica cada Black Friday o que vas a lanzar una nueva función que va a atraer usuarios, necesitás preverlo. A esto se le llama “capacity planning”.

La idea es monitorear el comportamiento actual, identificar cuellos de botella, y hacer simulaciones o pruebas de carga para proyectar necesidades futuras. Así podés decidir si te alcanza con subir recursos o necesitás rediseñar la arquitectura.
''',
    'code_example': r'''
# Simulación de carga con Apache Benchmark (ab)

# 1000 peticiones, 100 concurrentes:
ab -n 1000 -c 100 http://miapp.local/

# Resultado incluye:
# - Requests por segundo
# - Tiempo promedio de respuesta
# - Fallos (si los hay)

# Con esta info se puede estimar cuánto aguanta tu servidor actual y si es hora de escalar.
''',
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Arquitectura de Sistemas',
    'topic': 'Cloud Nativo',
    'subtopic': 'Kubernetes avanzado',
    'definition': '''
Kubernetes ya no es ninguna novedad, pero dominarlo a fondo es otra historia. Cuando hablamos de “avanzado”, nos referimos a ir más allá de levantar pods y servicios básicos.

Quizás te estés preguntando qué puede haber más allá de lo que ya usás. La respuesta: bastante. Por ejemplo, afinar los *probes* de salud, personalizar controladores, manejar políticas de red, crear operadores personalizados, o gestionar recursos con QoS.

También entran en juego conceptos como affinities, tolerations, y taints, que te permiten controlar con precisión dónde se ejecutan los pods. O el uso de CRDs (Custom Resource Definitions) para extender Kubernetes según tus necesidades.

Otro nivel es observar cómo hacen empresas como Spotify o Airbnb, que implementan cientos de microservicios en clústeres masivos y necesitan herramientas como ArgoCD, Prometheus o Kustomize para gestionar todo sin volverse locos.
''',
    'code_example': r'''
# Un pod con afinidad a ciertos nodos y tolerancia a taints
apiVersion: v1
kind: Pod
metadata:
  name: app-avanzada
spec:
  containers:
    - name: nginx
      image: nginx
  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
          - matchExpressions:
              - key: kubernetes.io/e2e-az-name
                operator: In
                values:
                  - zona-1
  tolerations:
    - key: "tipo"
      operator: "Equal"
      value: "carga-alta"
      effect: "NoSchedule"
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Arquitectura de Sistemas',
    'topic': 'Cloud Nativo',
    'subtopic': 'Service Mesh (Istio, Linkerd)',
    'definition': '''
Un Service Mesh es como un coordinador de tráfico entre microservicios, pero con superpoderes. No modifica el código de tus aplicaciones, sino que intercepta y gestiona el tráfico desde afuera, añadiendo seguridad, trazabilidad y control.

Puede sonar complejo al principio, y lo es un poco. Herramientas como Istio o Linkerd se encargan de tareas como: balanceo inteligente, mTLS (encriptación entre servicios), retries, circuit breaking y monitoreo.

El truco está en que estas funcionalidades no se escriben en el código de cada microservicio. En su lugar, se usan *sidecars* —contenedores extra que se acoplan a tus pods y se encargan de esas tareas.

Es como tener un proxy dentro del clúster que sabe todo lo que pasa y te deja aplicar reglas sin tocar el código. Ideal cuando tenés decenas o cientos de servicios interactuando constantemente.
''',
    'code_example': r'''
# En Istio, puedes definir un circuit breaker con DestinationRule

apiVersion: networking.istio.io/v1alpha3
kind: DestinationRule
metadata:
  name: reviews-cb
spec:
  host: reviews
  trafficPolicy:
    connectionPool:
      tcp:
        maxConnections: 1
      http:
        http1MaxPendingRequests: 1
        maxRequestsPerConnection: 1
    outlierDetection:
      consecutive5xxErrors: 1
      interval: 1s
      baseEjectionTime: 30s
      maxEjectionPercent: 100
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Arquitectura de Sistemas',
    'topic': 'Cloud Nativo',
    'subtopic': 'Infraestructura inmutable',
    'definition': '''
La idea de infraestructura inmutable suena radical al principio, pero tiene mucho sentido. En lugar de "cambiar cosas en producción", lo que hacés es destruir y recrear desde cero cada vez que hay un cambio.

¿Te suena drástico? La razón es simple: evita errores humanos y asegura consistencia. Si algo anda mal, no lo parcheás en caliente: volvés a desplegar una imagen nueva con el fix incluido. Nada de “acá le hice un cambio manual”.

Esto se logra gracias a contenedores, imágenes preconstruidas, automatización con herramientas como Terraform o Ansible, y pipelines que regeneran todo el stack en cuestión de minutos.

Empresas como Netflix y Google hacen esto todo el tiempo. No hay que andar preguntando “¿qué cambió en el servidor?”. El estado deseado se versiona y se aplica completo. Eso simplifica pruebas, debugging y rollback.
''',
    'code_example': r'''
# Imagen inmutable con Dockerfile

FROM ubuntu:22.04
RUN apt update && apt install -y nginx
COPY index.html /var/www/html/

# Si querés cambiar algo, modificás este Dockerfile
# y generás una nueva imagen en vez de tocar el contenedor en vivo

# Construcción:
# docker build -t mi-nginx:v2 .

# Despliegue (el anterior se elimina):
# kubectl set image deployment/web web=mi-nginx:v2
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Arquitectura de Sistemas',
    'topic': 'Cloud Nativo',
    'subtopic': 'GitOps',
    'definition': '''
GitOps es una forma moderna (y bastante elegante) de gestionar la infraestructura. Se basa en un principio simple: todo el estado deseado del sistema está versionado en Git. Lo que hay en producción debería coincidir exactamente con lo que está en el repositorio.

No hace falta SSH, ni ejecutar comandos a mano. Una herramienta (como ArgoCD o Flux) vigila el repositorio y se asegura de que el clúster esté sincronizado con él. Si alguien mete mano fuera de Git, se revierte o se avisa.

Esto tiene muchas ventajas: trazabilidad (todo queda registrado), posibilidad de rollback, revisiones por PRs, y una capa extra de seguridad. Además, se integra fácilmente con pipelines CI/CD, creando una experiencia limpia y predecible.

En pocas palabras, GitOps es lo que ocurre cuando la infraestructura se trata como código y se gestiona con las mismas buenas prácticas que el desarrollo.
''',
    'code_example': r'''
# Estructura básica de GitOps con ArgoCD

# En el repo Git:
infra/
├── kustomization.yaml
├── deployment.yaml
└── service.yaml

# ArgoCD apuntará a este repo y sincronizará con el clúster

# Ejemplo de App:
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: mi-app
spec:
  destination:
    namespace: default
    server: https://kubernetes.default.svc
  source:
    repoURL: https://github.com/mi-org/infra
    targetRevision: HEAD
    path: infra
  project: default
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Arquitectura de Sistemas',
    'topic': 'Seguridad Avanzada',
    'subtopic': 'Auditoría de seguridad',
    'definition': '''
La auditoría de seguridad es como hacerle una revisión técnica a tu sistema. No se trata de asumir que todo anda bien, sino de verificar, con datos en mano, si hay huecos, malas configuraciones o accesos sospechosos.

Ahora bien, ¿para qué auditar si ya está todo funcionando? Porque las amenazas no avisan, y los errores humanos tampoco. Revisar logs, cambios de archivos críticos, o accesos de usuarios privilegiados es clave para anticiparse a problemas o detectar ataques.

En Linux podés usar herramientas como `auditd`, que registra eventos del sistema según reglas que definís. También se combina con reportes manuales y escaneos de vulnerabilidades. Incluso podés automatizar alertas si pasa algo fuera de lo común.

Una buena auditoría no solo detecta lo malo: también sirve para demostrar que estás haciendo las cosas bien, especialmente si trabajás con empresas o sectores donde la seguridad es crítica.
''',
    'code_example': r'''
# Regla de auditd para monitorear cambios en /etc/passwd
# Se define en /etc/audit/rules.d/seguridad.rules

-w /etc/passwd -p wa -k passwd_changes

# Luego se aplica:
auditctl -R /etc/audit/rules.d/seguridad.rules

# Ver logs relacionados:
ausearch -k passwd_changes
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Arquitectura de Sistemas',
    'topic': 'Seguridad Avanzada',
    'subtopic': 'Cumplimiento normativo',
    'definition': '''
El cumplimiento normativo (o *compliance*) no es solo una formalidad legal. En sistemas, significa asegurarse de que tus servidores, procesos y accesos siguen reglas específicas impuestas por normativas como GDPR, HIPAA, PCI-DSS, entre otras.

¿Te suena burocrático? Puede parecerlo, pero es necesario, sobre todo si manejás datos sensibles. Estas normas te obligan a aplicar medidas concretas: cifrado, gestión de accesos, auditorías, backups, y control de incidentes.

Esto tiene un impacto real: si no cumplís, podés tener consecuencias legales o perder contratos. Muchas empresas exigen cumplir normativas para poder colaborar.

En Linux podés usar herramientas como OpenSCAP para escanear configuraciones y verificar si cumplís con una guía de seguridad específica. También es común usar benchmarks como los de CIS.
''',
    'code_example': r'''
# Escaneo de cumplimiento con OpenSCAP (ej. guía de Red Hat 7)

oscap xccdf eval \
  --profile xccdf_org.ssgproject.content_profile_standard \
  --results resultados.xml \
  --report reporte.html \
  /usr/share/xml/scap/ssg/content/ssg-rhel7-ds.xml

# El reporte muestra qué controles están bien y cuáles requieren atención
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Arquitectura de Sistemas',
    'topic': 'Seguridad Avanzada',
    'subtopic': 'Forensic básico',
    'definition': '''
El análisis forense en sistemas no es solo cosa de películas. En el mundo real, sirve para entender qué pasó después de un incidente de seguridad. ¿Quién entró? ¿Qué tocó? ¿Cómo lo hizo?

La clave del forensic es recolectar evidencia sin contaminarla. Es decir, capturar información tal como estaba al momento del evento: logs, procesos activos, conexiones abiertas, archivos modificados.

Seguramente te preguntes por dónde empezar si descubrís algo raro en tu servidor. Primero: no reinicies. Segundo: hacé una copia de la RAM (si podés), del disco, y guardá todo lo que esté relacionado con el momento del incidente.

Herramientas como `volatility` para memoria o `log2timeline` para líneas de tiempo son muy utilizadas en análisis post-mortem. No hace falta ser experto, pero conocer lo básico te puede ayudar mucho a documentar y entender lo ocurrido.
''',
    'code_example': r'''
# Comando para crear una imagen forense del disco (bit a bit)
# usando dd

dd if=/dev/sda of=/mnt/externo/imagen_sda.dd bs=4M conv=sync,noerror

# Luego, se puede montar como solo lectura:
mount -o ro,loop imagen_sda.dd /mnt/analisis
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Arquitectura de Sistemas',
    'topic': 'Seguridad Avanzada',
    'subtopic': 'Hardening extremo',
    'definition': '''
Hacer hardening es reforzar la seguridad de tu sistema para que sea lo menos vulnerable posible. El "extremo" implica llevar esa práctica al límite: eliminar todo lo innecesario, cerrar cada punto de ataque, y aplicar políticas estrictas.

Esto tiene una lógica muy clara: cuanto más complejo el sistema, más chances hay de que algo falle. Por eso, una buena estrategia de hardening extremo parte desde la instalación mínima y configura todo con la menor exposición posible.

Algunas prácticas comunes incluyen: desactivar servicios no usados, restringir accesos SSH, aplicar SELinux o AppArmor con reglas estrictas, configurar firewalls en modo deny-all, y habilitar logs detallados.

Este tipo de configuraciones se usa en servidores críticos, entornos militares, bancarios, o donde un error puede tener consecuencias muy serias. Requiere tiempo y testing, pero vale cada segundo si la seguridad es prioridad.
''',
    'code_example': r'''
# Deshabilitar servicios innecesarios y asegurar SSH

# Ver servicios activos:
systemctl list-unit-files --type=service

# Desactivar uno que no usás:
systemctl disable bluetooth.service

# Hardening básico de SSH:
# /etc/ssh/sshd_config
PermitRootLogin no
PasswordAuthentication no
AllowUsers adminseguro
Port 2222

# Aplicar cambios:
systemctl restart sshd
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Arquitectura de Sistemas',
    'topic': 'Alta Disponibilidad Avanzada',
    'subtopic': 'Clusters avanzados',
    'definition': '''
Un clúster avanzado de alta disponibilidad es como tener un equipo de servidores trabajando en conjunto para asegurar que un servicio esté siempre disponible, incluso si uno de ellos falla.

Pensemos por un momento en un servicio crítico que no puede permitirse tiempos de inactividad. Aquí es donde entran los clústeres avanzados. Utilizando herramientas como Pacemaker y Corosync, se puede configurar un grupo de servidores que monitorizan constantemente el estado de los servicios y, en caso de fallo, transfieren automáticamente las tareas a otro nodo del clúster sin interrupciones perceptibles para el usuario.

Además, estos clústeres pueden gestionar recursos compartidos, como sistemas de archivos y direcciones IP virtuales, garantizando que los servicios se mantengan consistentes y disponibles. Implementar un clúster avanzado requiere una planificación cuidadosa, pero los beneficios en términos de resiliencia y continuidad del servicio son significativos.
''',
    'code_example': r'''
# Instalación de los paquetes necesarios en sistemas basados en Debian
sudo apt-get install pacemaker corosync

# Iniciar y habilitar los servicios
sudo systemctl start corosync
sudo systemctl enable corosync
sudo systemctl start pacemaker
sudo systemctl enable pacemaker

# Verificar el estado del clúster
sudo crm status
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Arquitectura de Sistemas',
    'topic': 'Alta Disponibilidad Avanzada',
    'subtopic': 'Replicación de datos',
    'definition': '''
La replicación de datos es esencial para garantizar que la información esté disponible incluso si uno de los servidores falla. Se trata de mantener copias sincronizadas de los datos en múltiples ubicaciones.

Esto tiene una explicación, y es porque los datos son el corazón de muchos servicios. Herramientas como DRBD (Distributed Replicated Block Device) permiten replicar datos a nivel de bloque entre servidores Linux, asegurando que cada cambio en un servidor se refleje inmediatamente en su par. Esta replicación puede ser síncrona o asíncrona, dependiendo de las necesidades de consistencia y rendimiento.

Implementar la replicación de datos correctamente es crucial para evitar pérdidas de información y garantizar una recuperación rápida en caso de fallos. Además, facilita tareas como el mantenimiento y las actualizaciones, ya que se puede trabajar en un nodo mientras el otro sigue operando.
''',
    'code_example': r'''
# Instalación de DRBD en sistemas basados en Debian
sudo apt-get install drbd-utils

# Crear el archivo de configuración /etc/drbd.d/r0.res
resource r0 {
  on nodo1 {
    device /dev/drbd0;
    disk /dev/sdb1;
    address 192.168.1.1:7788;
    meta-disk internal;
  }
  on nodo2 {
    device /dev/drbd0;
    disk /dev/sdb1;
    address 192.168.1.2:7788;
    meta-disk internal;
  }
}

# Inicializar y arrancar el recurso
sudo drbdadm create-md r0
sudo drbdadm up r0
sudo drbdadm -- --overwrite-data-of-peer primary r0
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Arquitectura de Sistemas',
    'topic': 'Alta Disponibilidad Avanzada',
    'subtopic': 'Balanceo de carga global',
    'definition': '''
El balanceo de carga global distribuye el tráfico de red entre múltiples servidores ubicados en diferentes regiones geográficas, mejorando la disponibilidad y el rendimiento de los servicios.

Seguramente pensarás de qué va todo esto... Cuando los usuarios acceden a un servicio, es ideal que sean dirigidos al servidor más cercano o menos congestionado. Herramientas como HAProxy o soluciones de DNS inteligentes permiten implementar estrategias de balanceo que consideran la ubicación del usuario, la carga del servidor y otros factores para tomar decisiones óptimas de enrutamiento.

Este enfoque no solo mejora la experiencia del usuario al reducir la latencia, sino que también proporciona redundancia, asegurando que si un servidor o una región falla, el tráfico se redirija automáticamente a otros servidores disponibles.
''',
    'code_example': r'''
# Configuración básica de HAProxy para balanceo de carga
global
  log /dev/log local0
  maxconn 2000
  daemon

defaults
  mode http
  timeout connect 5000ms
  timeout client 50000ms
  timeout server 50000ms

frontend http_front
  bind *:80
  default_backend http_back

backend http_back
  balance roundrobin
  server web1 192.168.1.101:80 check
  server web2 192.168.1.102:80 check
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Arquitectura de Sistemas',
    'topic': 'Alta Disponibilidad Avanzada',
    'subtopic': 'DRP (Disaster Recovery Planning)',
    'definition': '''
El Plan de Recuperación ante Desastres (DRP) es una estrategia detallada para restaurar sistemas críticos y datos después de eventos inesperados que interrumpen las operaciones normales.

Vamos a ver de qué se trata todo esto... Un DRP bien elaborado identifica los recursos esenciales, define procedimientos de respaldo y recuperación, y establece roles y responsabilidades claras para el equipo de TI. Incluye la planificación de copias de seguridad regulares, pruebas de restauración, y la documentación de procesos para garantizar una respuesta rápida y eficiente ante incidentes.

Implementar un DRP no solo minimiza el tiempo de inactividad, sino que también protege la integridad de los datos y mantiene la confianza de los usuarios y clientes en la continuidad del servicio.
''',
    'code_example': r'''
# Script básico para respaldar una base de datos MySQL
#!/bin/bash
fecha=$(date +%F)
mkdir -p /backups/$fecha
mysqldump -u usuario -pcontraseña basededatos > /backups/$fecha/basededatos.sql

# Comprimir el respaldo
tar -czf /backups/$fecha.tar.gz /backups/$fecha

# Eliminar respaldos antiguos (más de 7 días)
find /backups/ -type d -mtime +7 -exec rm -rf {} \;
''',
  });
}

Future<void> insertSrLevel2DataLinux(Database db) async {
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 2,
    'title_level': 'DevOps Avanzado',
    'topic': 'Plataformas CI/CD Avanzadas',
    'subtopic': 'ArgoCD',
    'definition': '''
ArgoCD es una herramienta de entrega continua (CD) basada en GitOps para Kubernetes. Permite sincronizar automáticamente el estado deseado de las aplicaciones, definido en repositorios Git, con el estado actual del clúster, asegurando coherencia y facilitando despliegues declarativos.

Esto tiene una explicación, y es porque ArgoCD actúa como un controlador que monitorea los repositorios y aplica los cambios necesarios para mantener el clúster alineado con la configuración deseada. Ofrece una interfaz gráfica intuitiva, soporte para múltiples clústeres y estrategias de despliegue como canary y blue/green. Es especialmente útil para equipos que buscan una solución visual y centralizada para gestionar aplicaciones en Kubernetes.
''',
    'code_example': r'''
# Crear un namespace para ArgoCD
kubectl create namespace argocd

# Instalar ArgoCD en el clúster
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Acceder a la interfaz web de ArgoCD
kubectl port-forward svc/argocd-server -n argocd 8080:443

# Iniciar sesión en la interfaz web
# Usuario: admin
# Contraseña: obtenida con el siguiente comando
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 2,
    'title_level': 'DevOps Avanzado',
    'topic': 'Plataformas CI/CD Avanzadas',
    'subtopic': 'Tekton',
    'definition': '''
Tekton es un framework de integración y entrega continua (CI/CD) nativo de Kubernetes. Proporciona componentes reutilizables para construir pipelines de CI/CD, permitiendo definir tareas y flujos de trabajo como recursos de Kubernetes.

Seguramente pensarás de qué va todo esto... Tekton permite a los desarrolladores crear pipelines personalizadas que se ejecutan dentro del clúster, aprovechando la escalabilidad y resiliencia de Kubernetes. Su arquitectura modular y extensible lo hace adecuado para entornos complejos que requieren flexibilidad y control detallado sobre los procesos de construcción y despliegue.
''',
    'code_example': r'''
# Instalar Tekton Pipelines en el clúster
kubectl apply -f https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml

# Definir una tarea simple en Tekton
cat <<EOF | kubectl apply -f -
apiVersion: tekton.dev/v1beta1
kind: Task
metadata:
  name: hello-world
spec:
  steps:
    - name: echo
      image: alpine
      script: |
        #!/bin/sh
        echo "Hola, mundo desde Tekton"
EOF

# Ejecutar la tarea
cat <<EOF | kubectl apply -f -
apiVersion: tekton.dev/v1beta1
kind: TaskRun
metadata:
  name: hello-world-run
spec:
  taskRef:
    name: hello-world
EOF
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 2,
    'title_level': 'DevOps Avanzado',
    'topic': 'Plataformas CI/CD Avanzadas',
    'subtopic': 'Flux',
    'definition': '''
Flux es una herramienta de entrega continua (CD) basada en GitOps para Kubernetes. Se enfoca en mantener el estado del clúster sincronizado con las configuraciones almacenadas en repositorios Git, utilizando una arquitectura basada en controladores de Kubernetes.

Esto tiene una lógica muy clara: Flux monitorea los repositorios y aplica automáticamente los cambios al clúster, asegurando que la infraestructura y las aplicaciones estén siempre alineadas con el estado deseado. Es especialmente útil para equipos que prefieren una solución CLI-first y desean una integración profunda con Kubernetes sin depender de interfaces gráficas.
''',
    'code_example': r'''
# Instalar Flux CLI
curl -s https://fluxcd.io/install.sh | sudo bash

# Inicializar Flux en el clúster
flux install

# Conectar un repositorio Git para sincronización
flux create source git mi-repo \
  --url=https://github.com/usuario/mi-repo \
  --branch=main \
  --interval=1m

# Aplicar una configuración desde el repositorio
flux create kustomization mi-app \
  --source=mi-repo \
  --path="./deploy" \
  --prune=true \
  --interval=10m
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 2,
    'title_level': 'DevOps Avanzado',
    'topic': 'Plataformas CI/CD Avanzadas',
    'subtopic': 'Comparativa de herramientas',
    'definition': '''
Al evaluar herramientas de CI/CD como ArgoCD, Tekton y Flux, es esencial comprender sus enfoques y casos de uso:

- **ArgoCD**: Enfocado en CD con GitOps, ofrece una interfaz gráfica y es ideal para equipos que buscan visibilidad y control centralizado sobre despliegues en Kubernetes.

- **Tekton**: Proporciona una solución completa de CI/CD, permitiendo definir pipelines personalizadas dentro de Kubernetes. Es adecuado para entornos que requieren flexibilidad y control detallado sobre los procesos de construcción y despliegue.

- **Flux**: Se centra en CD con GitOps, utilizando una arquitectura basada en controladores y una interfaz CLI. Es ideal para equipos que prefieren una integración profunda con Kubernetes y una solución más ligera sin interfaz gráfica.

La elección entre estas herramientas dependerá de las necesidades específicas del equipo, la complejidad del entorno y las preferencias en cuanto a interfaces y flujos de trabajo.
''',
    'code_example': r'''
# Comparativa rápida de herramientas CI/CD

| Herramienta | Enfoque     | Interfaz | CI/CD        | Integración Kubernetes |
|-------------|-------------|----------|--------------|------------------------|
| ArgoCD      | CD (GitOps) | Gráfica  | CD           | Alta                   |
| Tekton      | CI/CD       | CLI      | CI y CD      | Nativa                 |
| Flux        | CD (GitOps) | CLI      | CD           | Profunda               |

# Nota: La elección dependerá de los requisitos específicos del proyecto y del equipo.
''',
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 2,
    'title_level': 'DevOps Avanzado',
    'topic': 'Infraestructura como Código Avanzada',
    'subtopic': 'Terraform avanzado',
    'definition': '''
Terraform es una herramienta de infraestructura como código (IaC) desarrollada por HashiCorp que permite definir, aprovisionar y gestionar infraestructura de forma declarativa y reproducible. En su uso avanzado, Terraform permite gestionar entornos complejos y multi-nube, aplicar módulos reutilizables, y establecer políticas de seguridad y cumplimiento mediante Sentinel.

Esto tiene una explicación, y es porque Terraform utiliza el lenguaje de configuración de HashiCorp (HCL), que facilita la escritura y comprensión de la infraestructura como código. Además, permite la integración con sistemas de control de versiones, automatización de despliegues y gestión del estado de la infraestructura, lo que lo convierte en una herramienta poderosa para equipos DevOps.
''',
    'code_example': r'''
# Definición de un módulo reutilizable en Terraform
module "vpc" {
  source = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
  region = "us-east-1"
}

# Aplicación de políticas con Sentinel (requiere configuración adicional)
# sentinel.hcl
policy "require-tags" {
  enforcement_level = "hard-mandatory"
  source = "require-tags.sentinel"
}
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 2,
    'title_level': 'DevOps Avanzado',
    'topic': 'Infraestructura como Código Avanzada',
    'subtopic': 'Crossplane',
    'definition': '''
Crossplane es una plataforma de código abierto que permite gestionar infraestructura como código utilizando la API de Kubernetes. Extiende el clúster de Kubernetes con recursos personalizados (CRDs) para aprovisionar y gestionar recursos de múltiples proveedores de nube de forma declarativa.

Seguramente pensarás de qué va todo esto... Crossplane permite a los equipos de plataforma definir configuraciones de infraestructura como código y exponerlas a los desarrolladores como APIs personalizadas, facilitando la adopción de prácticas de GitOps y mejorando la gobernanza de la infraestructura.
''',
    'code_example': r'''
# Instalación de Crossplane en un clúster de Kubernetes
kubectl create namespace crossplane-system
helm repo add crossplane-stable https://charts.crossplane.io/stable
helm install crossplane --namespace crossplane-system crossplane-stable/crossplane

# Definición de un recurso gestionado (Managed Resource)
apiVersion: database.example.org/v1alpha1
kind: PostgreSQLInstance
metadata:
  name: example-db
spec:
  parameters:
    storageGB: 20
    version: "12"
  writeConnectionSecretToRef:
    name: db-conn
  providerConfigRef:
    name: example-provider
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 2,
    'title_level': 'DevOps Avanzado',
    'topic': 'Infraestructura como Código Avanzada',
    'subtopic': 'Pulumi',
    'definition': '''
Pulumi es una plataforma de infraestructura como código que permite definir y gestionar infraestructura utilizando lenguajes de programación convencionales como TypeScript, Python, Go, C#, Java o YAML. Esto facilita la integración con herramientas de desarrollo y permite aplicar principios de ingeniería de software a la gestión de infraestructura.

Esto tiene una lógica muy clara: al utilizar lenguajes de programación conocidos, los desarrolladores pueden aprovechar características como el tipado estático, la reutilización de código y las pruebas automatizadas, lo que mejora la calidad y mantenibilidad de la infraestructura como código.
''',
    'code_example': r'''
# Ejemplo de definición de infraestructura con Pulumi en TypeScript
import * as pulumi from "@pulumi/pulumi";
import * as aws from "@pulumi/aws";

const bucket = new aws.s3.Bucket("my-bucket", {
  acl: "private",
});

export const bucketName = bucket.id;
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 2,
    'title_level': 'DevOps Avanzado',
    'topic': 'Infraestructura como Código Avanzada',
    'subtopic': 'Pruebas avanzadas',
    'definition': '''
Las pruebas avanzadas en infraestructura como código (IaC) son fundamentales para garantizar que las configuraciones y despliegues sean seguros, eficientes y cumplan con las políticas establecidas. Estas pruebas incluyen validación sintáctica, pruebas unitarias, integración continua y escaneos de seguridad.

Vamos a ver de qué se trata todo esto... Herramientas como Terratest, Checkov y TFLint permiten automatizar la validación de la infraestructura como código, detectar errores antes del despliegue y asegurar el cumplimiento de estándares de seguridad y buenas prácticas.
''',
    'code_example': r'''
# Ejemplo de uso de Checkov para escanear configuraciones de Terraform
# Instalación de Checkov
pip install checkov

# Escaneo de un directorio con configuraciones de Terraform
checkov -d ./terraform-configs

# Ejemplo de uso de TFLint para analizar código Terraform
# Instalación de TFLint
brew install tflint

# Análisis de un archivo de configuración
tflint main.tf
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 2,
    'title_level': 'DevOps Avanzado',
    'topic': 'Observabilidad Avanzada',
    'subtopic': 'Prometheus avanzado',
    'definition': '''
Prometheus es una herramienta de monitoreo y alerta diseñada para entornos cloud-native. En su uso avanzado, Prometheus permite monitorear clústeres de Kubernetes, recolectar métricas de aplicaciones y sistemas, y configurar alertas complejas mediante Alertmanager.

Esto tiene una explicación, y es porque Prometheus utiliza un modelo de datos basado en series temporales y un lenguaje de consulta flexible (PromQL), lo que facilita el análisis detallado del comportamiento del sistema. Además, su integración con Kubernetes permite descubrir automáticamente servicios y endpoints para monitoreo.
''',
    'code_example': r'''
# Crear un namespace para monitoreo
kubectl create namespace monitoring

# Agregar el repositorio de Helm de Prometheus
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

# Instalar Prometheus usando Helm
helm install prometheus prometheus-community/kube-prometheus-stack --namespace monitoring

# Acceder a la interfaz web de Prometheus
kubectl port-forward svc/prometheus-kube-prometheus-prometheus -n monitoring 9090:9090
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 2,
    'title_level': 'DevOps Avanzado',
    'topic': 'Observabilidad Avanzada',
    'subtopic': 'Loki para logs',
    'definition': '''
Grafana Loki es un sistema de agregación de logs diseñado para almacenar y consultar registros de aplicaciones e infraestructura. A diferencia de otras soluciones, Loki indexa solo un conjunto de etiquetas para cada flujo de logs, lo que lo hace más eficiente y escalable.

Seguramente pensarás de qué va todo esto... Loki se integra fácilmente con Grafana para visualizar logs y permite correlacionar registros con métricas y trazas, proporcionando una visión completa del estado del sistema.
''',
    'code_example': r'''
# Crear un namespace para Loki
kubectl create namespace loki

# Agregar el repositorio de Helm de Grafana
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update

# Instalar Loki usando Helm
helm install loki grafana/loki-stack --namespace loki

# Acceder a la interfaz web de Grafana
kubectl port-forward svc/loki-grafana -n loki 3000:80
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 2,
    'title_level': 'DevOps Avanzado',
    'topic': 'Observabilidad Avanzada',
    'subtopic': 'Tempo para tracing',
    'definition': '''
Grafana Tempo es un backend de trazado distribuido de código abierto, fácil de usar y altamente escalable. Es eficiente en costos, ya que solo requiere almacenamiento de objetos para operar, y está profundamente integrado con Grafana, Prometheus y Loki.

Esto tiene una lógica muy clara: Tempo permite buscar trazas, generar métricas a partir de spans y vincular datos de trazado con logs y métricas, proporcionando una observabilidad completa del sistema.
''',
    'code_example': r'''
# Crear un namespace para Tempo
kubectl create namespace tempo

# Agregar el repositorio de Helm de Grafana
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update

# Instalar Tempo usando Helm
helm install tempo grafana/tempo --namespace tempo

# Acceder a la interfaz web de Grafana
kubectl port-forward svc/tempo-grafana -n tempo 3000:80
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 2,
    'title_level': 'DevOps Avanzado',
    'topic': 'Observabilidad Avanzada',
    'subtopic': 'SLOs y SLIs',
    'definition': '''
Los Indicadores de Nivel de Servicio (SLIs) y los Objetivos de Nivel de Servicio (SLOs) son métricas clave para medir y garantizar la calidad del servicio. Los SLIs son métricas cuantitativas que reflejan aspectos específicos del rendimiento del servicio, como la latencia o la disponibilidad. Los SLOs son metas establecidas para estos indicadores, definiendo el nivel aceptable de rendimiento.

Vamos a ver de qué se trata todo esto... Implementar SLIs y SLOs permite a los equipos alinear las expectativas del servicio con los objetivos comerciales, facilitando la toma de decisiones basada en datos y mejorando la confiabilidad del sistema.
''',
    'code_example': r'''
# Ejemplo de definición de un SLO en YAML
apiVersion: monitoring.googleapis.com/v1
kind: ServiceLevelObjective
metadata:
  name: slo-latency
spec:
  displayName: "SLO de Latencia"
  goal: 0.95
  rollingPeriod:
    duration: "30d"
  serviceLevelIndicator:
    basicSli:
      latency:
        threshold: "300ms"
        experience: "LATENCY"
''',
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 2,
    'title_level': 'DevOps Avanzado',
    'topic': 'Plataformas Internas',
    'subtopic': 'Backstage',
    'definition': '''
Backstage es un framework de código abierto desarrollado por Spotify para construir portales internos de desarrolladores (IDPs). Permite centralizar herramientas, servicios y documentación en una única interfaz, mejorando la experiencia del desarrollador y promoviendo la autonomía.

Esto tiene una explicación, y es porque Backstage proporciona un catálogo de software centralizado, plantillas para la creación de nuevos proyectos y una arquitectura de plugins que facilita la integración con herramientas existentes. Su adopción ayuda a reducir la fragmentación tecnológica y los silos de conocimiento dentro de las organizaciones.
''',
    'code_example': r'''
# Clonar el repositorio de Backstage
npx @backstage/create-app

# Ingresar al directorio de la aplicación
cd my-backstage-app

# Iniciar la aplicación
yarn dev
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 2,
    'title_level': 'DevOps Avanzado',
    'topic': 'Plataformas Internas',
    'subtopic': 'Developer Portals',
    'definition': '''
Los Developer Portals son interfaces centralizadas que permiten a los desarrolladores descubrir, acceder y gestionar herramientas, servicios y documentación dentro de una organización. Actúan como una capa de experiencia del desarrollador sobre las plataformas internas, facilitando la colaboración y el autoservicio.

Seguramente pensarás de qué va todo esto... Los Developer Portals integran diversas herramientas y servicios, proporcionando una experiencia unificada que mejora la eficiencia y reduce la carga cognitiva de los desarrolladores. Ejemplos de herramientas para construir estos portales incluyen Backstage, Compass de Atlassian y Cortex.
''',
    'code_example': r'''
# Ejemplo de definición de un componente en Backstage
apiVersion: backstage.io/v1alpha1
kind: Component
metadata:
  name: my-service
  description: Servicio de ejemplo
spec:
  type: service
  owner: equipo-devops
  lifecycle: production
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 2,
    'title_level': 'DevOps Avanzado',
    'topic': 'Plataformas Internas',
    'subtopic': 'Autoservicio',
    'definition': '''
El autoservicio en plataformas internas permite a los desarrolladores ejecutar tareas comunes, como el aprovisionamiento de recursos o la creación de nuevos servicios, sin intervención manual de otros equipos. Esto se logra mediante la automatización y la exposición de funcionalidades a través de portales o APIs.

Esto tiene una lógica muy clara: al empoderar a los desarrolladores con capacidades de autoservicio, se reduce la dependencia de equipos centrales, se acelera el ciclo de desarrollo y se mejora la eficiencia operativa. Herramientas como Backstage facilitan la implementación de estas capacidades mediante plantillas y flujos de trabajo automatizados.
''',
    'code_example': r'''
# Ejemplo de plantilla de Backstage para crear un nuevo servicio
apiVersion: scaffolder.backstage.io/v1beta3
kind: Template
metadata:
  name: create-service
  title: Crear nuevo servicio
spec:
  owner: equipo-devops
  type: service
  parameters:
    - title: Nombre del servicio
      required: true
      type: string
      name: serviceName
  steps:
    - id: fetch-base
      name: Obtener plantilla base
      action: fetch:template
      input:
        url: ./templates/service
    - id: publish
      name: Publicar en GitHub
      action: publish:github
      input:
        repoUrl: github.com/mi-org/${{ parameters.serviceName }}
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 2,
    'title_level': 'DevOps Avanzado',
    'topic': 'Plataformas Internas',
    'subtopic': 'Catálogos de servicios',
    'definition': '''
Los catálogos de servicios son registros centralizados que enumeran y describen los servicios disponibles dentro de una organización. Facilitan la visibilidad, el descubrimiento y la gestión de servicios, promoviendo la reutilización y la coherencia en el desarrollo.

Vamos a ver de qué se trata todo esto... Al mantener un catálogo actualizado de servicios, los equipos pueden evitar la duplicación de esfuerzos, identificar dependencias y comprender mejor el ecosistema de software de la organización. Herramientas como Backstage ofrecen funcionalidades para construir y mantener estos catálogos de manera eficiente.
''',
    'code_example': r'''
# Ejemplo de entrada en el catálogo de servicios de Backstage
apiVersion: backstage.io/v1alpha1
kind: Component
metadata:
  name: servicio-pagos
  description: Servicio de procesamiento de pagos
  tags:
    - pagos
    - financiero
spec:
  type: service
  owner: equipo-finanzas
  lifecycle: production
  providesApis:
    - pagos-api
''',
  });
}

Future<void> insertSrLevel3DataLinux(Database db) async {
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Rendimiento y Optimización',
    'topic': 'Tuning Avanzado',
    'subtopic': 'Kernel tuning extremo',
    'definition': '''
El ajuste extremo del kernel en Linux implica la modificación avanzada de parámetros del sistema para optimizar el rendimiento en escenarios específicos. Esto incluye la configuración de buffers de red, tamaños de ventanas TCP, políticas de programación de procesos y ajustes de memoria. Estas optimizaciones son esenciales para aplicaciones de alto rendimiento, como servidores de bases de datos, sistemas de trading de alta frecuencia y servicios de streaming a gran escala.

Esto tiene una explicación, y es porque el kernel de Linux es altamente configurable, permitiendo adaptar el comportamiento del sistema a las necesidades particulares de cada entorno. Sin embargo, es crucial realizar pruebas exhaustivas antes de aplicar estos ajustes en entornos de producción, ya que configuraciones inapropiadas pueden degradar el rendimiento o comprometer la estabilidad del sistema.
''',
    'code_example': r'''
# Ver el valor actual de tcp_rmem
cat /proc/sys/net/ipv4/tcp_rmem

# Establecer nuevos valores para tcp_rmem
sudo sysctl -w net.ipv4.tcp_rmem="4096 87380 6291456"

# Hacer persistente el cambio en /etc/sysctl.conf
echo "net.ipv4.tcp_rmem = 4096 87380 6291456" | sudo tee -a /etc/sysctl.conf
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Rendimiento y Optimización',
    'topic': 'Tuning Avanzado',
    'subtopic': 'Optimización de redes',
    'definition': '''
La optimización de redes en Linux se centra en mejorar el rendimiento de la pila de red mediante ajustes en parámetros como los buffers de socket, colas de red y políticas de encolamiento. Estas optimizaciones son fundamentales para aplicaciones que requieren alta capacidad de transferencia y baja latencia, como servicios de streaming, servidores web de alto tráfico y sistemas de comunicación en tiempo real.

Seguramente pensarás de qué va todo esto... Ajustar adecuadamente estos parámetros permite maximizar el rendimiento de la red, reducir la latencia y evitar cuellos de botella, asegurando una experiencia de usuario fluida y eficiente.
''',
    'code_example': r'''
# Aumentar el tamaño máximo de los buffers de recepción y envío
sudo sysctl -w net.core.rmem_max=134217728
sudo sysctl -w net.core.wmem_max=134217728

# Ajustar los buffers TCP
sudo sysctl -w net.ipv4.tcp_rmem="4096 87380 134217728"
sudo sysctl -w net.ipv4.tcp_wmem="4096 65536 134217728"

# Habilitar TCP window scaling
sudo sysctl -w net.ipv4.tcp_window_scaling=1
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Rendimiento y Optimización',
    'topic': 'Tuning Avanzado',
    'subtopic': 'Rendimiento de almacenamiento',
    'definition': '''
Optimizar el rendimiento de almacenamiento en Linux implica ajustar configuraciones del sistema de archivos, seleccionar el planificador de E/S adecuado y configurar opciones de montaje específicas. Estas optimizaciones son esenciales para aplicaciones que manejan grandes volúmenes de datos o requieren acceso rápido al disco, como bases de datos, sistemas de archivos distribuidos y servidores de archivos.

Esto tiene una lógica muy clara: al seleccionar el planificador de E/S apropiado y ajustar las opciones de montaje, se puede mejorar significativamente la eficiencia en las operaciones de lectura y escritura, reduciendo la latencia y aumentando el rendimiento general del sistema.
''',
    'code_example': r'''
# Verificar el planificador de E/S actual
cat /sys/block/sdX/queue/scheduler

# Cambiar al planificador 'deadline'
echo deadline | sudo tee /sys/block/sdX/queue/scheduler

# Montar un sistema de archivos ext4 con opciones optimizadas
sudo mount -o defaults,noatime,nodiratime,data=writeback /dev/sdX1 /mnt/data
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Rendimiento y Optimización',
    'topic': 'Tuning Avanzado',
    'subtopic': 'Benchmarking avanzado',
    'definition': '''
El benchmarking avanzado en Linux consiste en utilizar herramientas especializadas para medir y analizar el rendimiento del sistema en diferentes aspectos, como CPU, memoria, almacenamiento y red. Estas pruebas permiten identificar cuellos de botella, evaluar el impacto de cambios en la configuración y comparar el rendimiento entre diferentes sistemas o configuraciones.

Vamos a ver de qué se trata todo esto... Al realizar pruebas de rendimiento detalladas, los administradores pueden tomar decisiones informadas sobre optimizaciones, actualizaciones de hardware o ajustes en la configuración del sistema para mejorar la eficiencia y capacidad de respuesta.
''',
    'code_example': r'''
# Instalar Phoronix Test Suite
sudo apt install phoronix-test-suite

# Ejecutar una prueba de rendimiento de CPU
phoronix-test-suite benchmark c-ray

# Instalar y ejecutar IOzone para pruebas de E/S de disco
sudo apt install iozone3
iozone -a -g 2G -i 0 -i 1 -i 2
''',
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Rendimiento y Optimización',
    'topic': 'Troubleshooting Avanzado',
    'subtopic': 'Análisis de core dumps',
    'definition': '''
El análisis de core dumps en Linux permite diagnosticar fallos críticos en aplicaciones al examinar el estado de la memoria en el momento del fallo. Estas imágenes de memoria son generadas automáticamente cuando un proceso se termina de forma inesperada debido a señales como SIGSEGV o SIGABRT.

Esto tiene una explicación, y es porque los core dumps contienen información detallada sobre el estado del proceso en el momento del fallo, incluyendo el stack de llamadas, variables locales y registros. Herramientas como `gdb` y `crash` permiten analizar estos archivos para identificar la causa raíz del problema. Es importante configurar adecuadamente el sistema para permitir la generación de core dumps, ajustando parámetros como `ulimit -c` y `kernel.core_pattern`.
''',
    'code_example': r'''
# Habilitar la generación de core dumps
ulimit -c unlimited
echo "/var/crash/core.%e.%p.%t" | sudo tee /proc/sys/kernel/core_pattern

# Analizar un core dump con gdb
gdb /ruta/al/ejecutable /var/crash/core.1234
(gdb) bt
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Rendimiento y Optimización',
    'topic': 'Troubleshooting Avanzado',
    'subtopic': 'Depuración de red',
    'definition': '''
La depuración de red avanzada en Linux implica el uso de herramientas y técnicas para analizar y resolver problemas complejos de conectividad, rendimiento y seguridad en redes. Esto incluye la captura y análisis de paquetes, monitoreo de tráfico y diagnóstico de configuraciones erróneas.

Seguramente pensarás de qué va todo esto... Herramientas como `tcpdump`, `wireshark`, `netstat`, `ss`, `iperf3` y `bpftrace` permiten inspeccionar el tráfico de red en tiempo real, identificar cuellos de botella, detectar paquetes malformados y analizar patrones de comunicación. Estas herramientas son esenciales para mantener la integridad y eficiencia de las redes en entornos de producción.
''',
    'code_example': r'''
# Capturar tráfico en la interfaz eth0 y guardar en un archivo
sudo tcpdump -i eth0 -w captura.pcap

# Analizar conexiones de red activas
ss -tuln

# Medir el rendimiento de la red con iperf3
# En el servidor:
iperf3 -s
# En el cliente:
iperf3 -c <IP_del_servidor>
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Rendimiento y Optimización',
    'topic': 'Troubleshooting Avanzado',
    'subtopic': 'Problemas de concurrencia',
    'definition': '''
Los problemas de concurrencia en sistemas Linux surgen cuando múltiples procesos o hilos acceden simultáneamente a recursos compartidos sin la debida sincronización, lo que puede provocar condiciones de carrera, bloqueos y otros comportamientos indeseados.

Esto tiene una lógica muy clara: en entornos multihilo, la falta de mecanismos adecuados de sincronización, como mutexes o semáforos, puede llevar a estados inconsistentes o fallos en la aplicación. Herramientas como `strace`, `lsof`, `perf` y `bpftrace` permiten monitorear y analizar la interacción entre procesos y recursos, facilitando la identificación y resolución de estos problemas.
''',
    'code_example': r'''
# Monitorear llamadas al sistema de un proceso
strace -p <PID>

# Listar archivos abiertos por un proceso
lsof -p <PID>

# Analizar bloqueos de hilos con perf
sudo perf record -g -p <PID>
sudo perf report
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Rendimiento y Optimización',
    'topic': 'Troubleshooting Avanzado',
    'subtopic': 'Técnicas forenses',
    'definition': '''
Las técnicas forenses en sistemas Linux se utilizan para investigar y analizar incidentes de seguridad, recopilando y examinando evidencia digital sin alterar el estado del sistema. Esto incluye la adquisición de imágenes de disco, análisis de logs, recuperación de archivos eliminados y detección de actividades maliciosas.

Vamos a ver de qué se trata todo esto... Herramientas como `The Sleuth Kit`, `Autopsy`, `dd`, `chkrootkit` y `rkhunter` permiten realizar análisis exhaustivos del sistema, identificando posibles compromisos y preservando la integridad de la evidencia para su uso en investigaciones o procesos legales.
''',
    'code_example': r'''
# Crear una imagen forense de un disco
sudo dd if=/dev/sdX of=/ruta/a/imagen.dd bs=4M conv=noerror,sync

# Analizar la imagen con The Sleuth Kit
fls -r -m / imagen.dd > timeline.txt
mactime -b timeline.txt > mactime_report.txt

# Escanear el sistema en busca de rootkits
sudo chkrootkit
sudo rkhunter --check
''',
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Rendimiento y Optimización',
    'topic': 'Virtualización Avanzada',
    'subtopic': 'KubeVirt',
    'definition': '''
KubeVirt es un proyecto de código abierto que extiende Kubernetes para gestionar máquinas virtuales (VMs) junto con contenedores en un entorno unificado. Permite a los equipos operar cargas de trabajo tradicionales basadas en VMs dentro de clústeres de Kubernetes, facilitando la transición hacia arquitecturas nativas de la nube.

Esto tiene una explicación, y es porque KubeVirt integra las VMs como recursos nativos de Kubernetes, lo que permite aplicar las mismas herramientas y procesos de orquestación, monitoreo y escalado utilizados para contenedores. Esta unificación simplifica la gestión de infraestructuras híbridas y acelera la modernización de aplicaciones legadas.
''',
    'code_example': r'''
# Crear un VirtualMachineInstance (VMI) en KubeVirt
apiVersion: kubevirt.io/v1
kind: VirtualMachineInstance
metadata:
  name: test-vmi
spec:
  domain:
    devices:
      disks:
      - disk:
          bus: virtio
        name: containerdisk
    resources:
      requests:
        memory: 512Mi
  volumes:
  - name: containerdisk
    containerDisk:
      image: kubevirt/cirros-container-disk-demo
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Rendimiento y Optimización',
    'topic': 'Virtualización Avanzada',
    'subtopic': 'Firecracker',
    'definition': '''
Firecracker es un monitor de máquinas virtuales (VMM) de código abierto desarrollado por AWS para ejecutar microVMs ligeras y seguras. Diseñado específicamente para cargas de trabajo serverless y de contenedores, combina la velocidad y eficiencia de los contenedores con el aislamiento de las máquinas virtuales tradicionales.

Esto tiene una lógica muy clara: Firecracker utiliza KVM para crear microVMs con un conjunto mínimo de dispositivos virtuales, lo que reduce la superficie de ataque y mejora los tiempos de arranque (aproximadamente 125 ms). Su diseño minimalista permite ejecutar miles de microVMs en un solo host, optimizando la utilización de recursos sin comprometer la seguridad.
''',
    'code_example': r'''
# Iniciar Firecracker con una imagen de kernel y rootfs
firecracker --api-sock /tmp/firecracker.socket

# Configurar la microVM mediante la API REST
curl -X PUT --unix-socket /tmp/firecracker.socket \
  -H "Content-Type: application/json" \
  -d '{
        "boot-source": {
          "kernel_image_path": "./vmlinux",
          "boot_args": "console=ttyS0 reboot=k panic=1 pci=off"
        },
        "drives": [
          {
            "drive_id": "rootfs",
            "path_on_host": "./rootfs.ext4",
            "is_root_device": true,
            "is_read_only": false
          }
        ]
      }' \
  http://localhost/boot-source
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Rendimiento y Optimización',
    'topic': 'Virtualización Avanzada',
    'subtopic': 'Unikernels',
    'definition': '''
Los Unikernels son sistemas operativos especializados que combinan la aplicación y las bibliotecas necesarias en una única imagen binaria que se ejecuta directamente sobre un hipervisor. Esta arquitectura elimina capas innecesarias, resultando en imágenes extremadamente ligeras, rápidas y seguras.

Vamos a ver de qué se trata todo esto... Al incluir solo los componentes esenciales para una aplicación específica, los Unikernels reducen significativamente la superficie de ataque y el consumo de recursos. Sin embargo, su adopción requiere un esfuerzo considerable en el desarrollo y mantenimiento, ya que cada Unikernel debe ser construido y adaptado para su aplicación particular.
''',
    'code_example': r'''
# Crear un Unikernel con Unikraft para una aplicación en C
# Clonar el repositorio de Unikraft
git clone https://github.com/unikraft/unikraft.git

# Crear una aplicación base
cd unikraft
./kraft list
./kraft init -m helloworld

# Configurar y compilar la aplicación
cd helloworld
./kraft configure
./kraft build

# Ejecutar la aplicación en QEMU
./kraft run
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Rendimiento y Optimización',
    'topic': 'Virtualización Avanzada',
    'subtopic': 'Comparativa de tecnologías',
    'definition': '''
La virtualización avanzada abarca diversas tecnologías, cada una con características específicas en términos de rendimiento, aislamiento y casos de uso. A continuación, se presenta una comparativa entre KubeVirt, Firecracker y Unikernels:

- **KubeVirt**: Ideal para entornos que requieren gestionar simultáneamente contenedores y máquinas virtuales, facilitando la transición de aplicaciones legadas a arquitecturas nativas de la nube mediante Kubernetes.

- **Firecracker**: Diseñado para ejecutar microVMs ligeras con tiempos de arranque rápidos y bajo consumo de recursos, siendo una excelente opción para cargas de trabajo serverless y de contenedores que requieren un alto grado de aislamiento.

- **Unikernels**: Ofrecen un rendimiento y seguridad superiores al eliminar componentes innecesarios del sistema operativo, siendo adecuados para aplicaciones específicas donde la eficiencia y la seguridad son críticas, aunque con una complejidad de desarrollo mayor.

La elección entre estas tecnologías dependerá de los requisitos específicos de cada proyecto, considerando factores como la necesidad de aislamiento, el rendimiento, la compatibilidad y la facilidad de integración en el ecosistema existente.
''',
    'code_example': r'''
# Comparativa de características

| Característica       | KubeVirt           | Firecracker        | Unikernels        |
|----------------------|--------------------|--------------------|-------------------|
| Integración Kubernetes | Alta               | Media              | Baja              |
| Tiempo de arranque   | Segundos           | ~125 ms            | 1-40 ms           |
| Consumo de recursos  | Alto               | Bajo               | Muy bajo          |
| Aislamiento          | Medio              | Alto               | Muy alto          |
| Facilidad de desarrollo | Alta               | Media              | Baja              |
| Casos de uso         | Modernización de aplicaciones legadas | Serverless, microservicios | Aplicaciones embebidas, IoT |
''',
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Rendimiento y Optimización',
    'topic': 'Automatización Extrema',
    'subtopic': 'Automatización de seguridad',
    'definition': '''
La automatización de seguridad implica el uso de software y procesos automatizados para detectar, prevenir, investigar y responder a amenazas cibernéticas sin intervención humana directa. Esta práctica busca reducir la cantidad y gravedad de los problemas de seguridad en la infraestructura de TI, disminuyendo la necesidad de intervención manual y acelerando la respuesta ante incidentes.

Esto tiene una explicación, y es porque al automatizar tareas repetitivas y propensas a errores, como la aplicación de parches, la gestión de configuraciones y la respuesta a alertas, se mejora la eficiencia operativa y se fortalece la postura de seguridad de la organización. Herramientas como SOAR (Security Orchestration, Automation, and Response) permiten integrar y automatizar flujos de trabajo de seguridad, facilitando una respuesta coordinada y eficaz a las amenazas.
''',
    'code_example': r'''
# Ejemplo de automatización de respuesta a incidentes con Ansible y SOAR
- name: Responder a alerta de seguridad
  hosts: all
  tasks:
    - name: Obtener detalles de la alerta desde SOAR
      uri:
        url: "https://soar.example.com/api/alerts/{{ alert_id }}"
        method: GET
        headers:
          Authorization: "Bearer {{ soar_api_token }}"
      register: alert_details

    - name: Aplicar medidas de contención si se detecta una amenaza crítica
      when: alert_details.json.severity == "critical"
      block:
        - name: Aislar host comprometido
          command: "iptables -A INPUT -s {{ inventory_hostname }} -j DROP"

        - name: Notificar al equipo de seguridad
          mail:
            to: security-team@example.com
            subject: "Host {{ inventory_hostname }} aislado por amenaza crítica"
            body: "Se ha aislado el host {{ inventory_hostname }} debido a una amenaza crítica detectada."
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Rendimiento y Optimización',
    'topic': 'Automatización Extrema',
    'subtopic': 'Auto-reparación',
    'definition': '''
La auto-reparación en sistemas Linux se refiere a la capacidad de detectar y corregir automáticamente fallos o anomalías sin intervención humana. Esto incluye la aplicación automática de parches, reinicios de servicios fallidos y restauración de configuraciones predeterminadas en caso de corrupción o mal funcionamiento.

Seguramente pensarás de qué va todo esto... La auto-reparación mejora la resiliencia del sistema, reduce el tiempo de inactividad y minimiza la necesidad de intervención manual, lo que es crucial en entornos de producción donde la disponibilidad continua es esencial. Herramientas como IBM Concert permiten implementar flujos de trabajo de corrección automática para sistemas operativos como Red Hat Enterprise Linux, agilizando la gestión de vulnerabilidades mediante la aplicación de parches automatizados.
''',
    'code_example': r'''
# Script de monitoreo y auto-reparación de servicios en Linux
#!/bin/bash

SERVICE="nginx"

if systemctl is-active --quiet $SERVICE; then
  echo "$SERVICE está funcionando correctamente."
else
  echo "$SERVICE está detenido. Intentando reiniciar..."
  systemctl restart $SERVICE
  sleep 5
  if systemctl is-active --quiet $SERVICE; then
    echo "$SERVICE se ha reiniciado exitosamente."
  else
    echo "Error: No se pudo reiniciar $SERVICE. Notificando al administrador."
    echo "$SERVICE no se pudo reiniciar en $(hostname) a las $(date)" | mail -s "$SERVICE falló en $(hostname)" admin@example.com
  fi
fi
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Rendimiento y Optimización',
    'topic': 'Automatización Extrema',
    'subtopic': 'Sistemas autónomos',
    'definition': '''
Los sistemas autónomos son tecnologías capaces de realizar tareas específicas sin intervención humana directa. Utilizan sensores, algoritmos de inteligencia artificial y procesamiento de datos en tiempo real para percibir su entorno, tomar decisiones y ejecutar acciones. Estos sistemas están diseñados para adaptarse a cambios en su entorno y mejorar su rendimiento con el tiempo a través del aprendizaje automático.

Esto tiene una lógica muy clara: al operar de manera independiente, los sistemas autónomos pueden responder rápidamente a condiciones cambiantes, optimizar procesos y reducir la carga de trabajo humano. Se aplican en diversas áreas, desde vehículos autónomos hasta operaciones de TI, donde pueden gestionar infraestructuras complejas y responder a incidentes sin intervención manual.
''',
    'code_example': r'''
# Ejemplo de implementación de un sistema autónomo básico en Python
import time
import random

def monitor_system():
    # Simula la lectura de un sensor o métrica del sistema
    return random.choice(["OK", "WARNING", "CRITICAL"])

def take_action(status):
    if status == "OK":
        print("Sistema funcionando correctamente.")
    elif status == "WARNING":
        print("Advertencia detectada. Monitoreando de cerca.")
    elif status == "CRITICAL":
        print("Estado crítico detectado. Ejecutando acciones de mitigación.")
        # Aquí se podrían agregar acciones como reiniciar servicios, aislar componentes, etc.
    else:
        print("Estado desconocido.")

while True:
    system_status = monitor_system()
    take_action(system_status)
    time.sleep(10)  # Espera 10 segundos antes de la siguiente verificación
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Rendimiento y Optimización',
    'topic': 'Automatización Extrema',
    'subtopic': 'IA para operaciones',
    'definition': '''
La Inteligencia Artificial para Operaciones de TI (AIOps) es la aplicación de aprendizaje automático y análisis de grandes volúmenes de datos para automatizar y mejorar la gestión de las operaciones de TI. AIOps permite detectar anomalías, predecir problemas y automatizar respuestas, reduciendo el tiempo de resolución y mejorando la eficiencia operativa.

Vamos a ver de qué se trata todo esto... AIOps combina big data y aprendizaje automático para automatizar las operaciones de TI, incluidas la correlación de eventos, la detección de anomalías y la determinación de causalidades. Esto ayuda a las organizaciones de TI a monitorear, analizar y administrar sus infraestructuras con mayor rapidez y precisión.
''',
    'code_example': r'''
# Ejemplo de uso de AIOps con una herramienta ficticia en Python
import aiops_toolkit

# Inicializar la herramienta de AIOps
aiops = aiops_toolkit.initialize(api_key="your_api_key")

# Recopilar datos de logs y métricas
logs = aiops.collect_logs(source="system_logs")
metrics = aiops.collect_metrics(source="system_metrics")

# Analizar los datos para detectar anomalías
anomalies = aiops.detect_anomalies(logs=logs, metrics=metrics)

# Automatizar la respuesta a las anomalías detectadas
for anomaly in anomalies:
    aiops.respond_to_anomaly(anomaly_id=anomaly.id)
''',
  });
}

Future<void> insertSrLevel4DataLinux(Database db) async {
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 4,
    'title_level': 'Liderazgo y Estrategia',
    'topic': 'Gestión de Equipos',
    'subtopic': 'Liderazgo técnico',
    'definition': '''
El liderazgo técnico combina habilidades técnicas profundas con capacidades de gestión para guiar equipos hacia la excelencia en proyectos tecnológicos. Un líder técnico no solo domina las herramientas y tecnologías relevantes, sino que también inspira, comunica efectivamente y toma decisiones estratégicas que alinean los objetivos técnicos con los del negocio.

Esto tiene una explicación, y es porque un liderazgo técnico efectivo asegura que las decisiones técnicas se tomen considerando tanto la viabilidad técnica como el impacto en el negocio, fomentando un entorno de innovación, colaboración y mejora continua.
''',
    'code_example': r'''
# Ejemplo de liderazgo técnico en la implementación de una nueva herramienta
# Supongamos que se decide migrar a una nueva herramienta de CI/CD
# El líder técnico debe:

1. Evaluar las opciones disponibles considerando las necesidades del equipo.
2. Presentar las ventajas y desventajas de cada opción al equipo y stakeholders.
3. Planificar la migración minimizando interrupciones en el flujo de trabajo.
4. Capacitar al equipo en el uso de la nueva herramienta.
5. Monitorear y ajustar la implementación según el feedback recibido.
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 4,
    'title_level': 'Liderazgo y Estrategia',
    'topic': 'Gestión de Equipos',
    'subtopic': 'Metodologías ágiles',
    'definition': '''
Las metodologías ágiles, como Scrum y Kanban, son enfoques de gestión de proyectos que promueven la entrega incremental, la colaboración continua y la adaptabilidad al cambio. En equipos de infraestructura, la adopción de metodologías ágiles facilita la respuesta rápida a las necesidades del negocio y mejora la eficiencia operativa.

Esto tiene una lógica muy clara: al dividir el trabajo en iteraciones cortas y enfocarse en la retroalimentación constante, los equipos pueden identificar y resolver problemas más rápidamente, adaptarse a cambios en los requisitos y entregar valor de manera continua.
''',
    'code_example': r'''
# Ejemplo de implementación de Scrum en un equipo de infraestructura

- Sprint de 2 semanas:
  - Planificación del sprint: definir tareas como actualización de servidores, implementación de nuevas políticas de seguridad.
  - Reuniones diarias: seguimiento del progreso y obstáculos encontrados.
  - Revisión del sprint: demostrar las mejoras implementadas.
  - Retrospectiva: discutir qué funcionó bien y qué puede mejorarse.

# Uso de herramientas como Jira o Trello para gestionar el backlog y las tareas del sprint.
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 4,
    'title_level': 'Liderazgo y Estrategia',
    'topic': 'Gestión de Equipos',
    'subtopic': 'OKRs para infraestructura',
    'definition': '''
Los OKRs (Objectives and Key Results) son un marco de trabajo para establecer y monitorear objetivos claros y medibles. En equipos de infraestructura, los OKRs ayudan a alinear las metas del equipo con las prioridades estratégicas de la organización, fomentando la transparencia y el enfoque en resultados clave.

Esto tiene una explicación, y es porque al definir objetivos ambiciosos y resultados clave específicos, los equipos pueden concentrarse en lo que realmente importa, medir el progreso de manera objetiva y ajustar sus esfuerzos para maximizar el impacto.
''',
    'code_example': r'''
# Ejemplo de OKRs para un equipo de infraestructura

Objective: Mejorar la disponibilidad del sistema

Key Results:
1. Reducir el tiempo promedio de inactividad mensual a menos de 30 minutos.
2. Implementar monitoreo proactivo en el 100% de los servicios críticos.
3. Completar la migración a una arquitectura de alta disponibilidad para fin de trimestre.

# Seguimiento mensual del progreso y ajustes según sea necesario.
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 4,
    'title_level': 'Liderazgo y Estrategia',
    'topic': 'Gestión de Equipos',
    'subtopic': 'Cultura DevOps',
    'definition': '''
La cultura DevOps es un enfoque que promueve la colaboración estrecha entre los equipos de desarrollo y operaciones, con el objetivo de mejorar la eficiencia, la calidad y la velocidad en la entrega de software. Esta cultura se basa en principios como la automatización, la integración continua y la responsabilidad compartida.

Esto tiene una lógica muy clara: al eliminar silos entre equipos y fomentar una comunicación abierta, las organizaciones pueden responder más rápidamente a las necesidades del mercado, reducir errores y crear un entorno de trabajo más cohesivo y productivo.
''',
    'code_example': r'''
# Prácticas para fomentar una cultura DevOps

1. Implementar pipelines de CI/CD para automatizar pruebas y despliegues.
2. Fomentar la colaboración mediante reuniones conjuntas y herramientas de comunicación integradas.
3. Establecer métricas compartidas para evaluar el rendimiento y la calidad del software.
4. Promover la responsabilidad compartida en la resolución de incidentes y la mejora continua.
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 4,
    'title_level': 'Liderazgo y Estrategia',
    'topic': 'Estrategia Tecnológica',
    'subtopic': 'Roadmap tecnológico',
    'definition': '''
Un roadmap tecnológico es una herramienta de planificación estratégica que alinea los recursos tecnológicos de una organización con sus objetivos de negocio a corto y largo plazo. Actúa como una guía visual que describe las tecnologías necesarias, el calendario de desarrollo e implementación, los recursos requeridos y los posibles retos a enfrentar. Este enfoque permite una visión compartida entre equipos diversos, facilitando la toma de decisiones informadas y la gestión proactiva de riesgos.

Esto tiene una explicación, y es porque al establecer un roadmap tecnológico, las organizaciones pueden identificar las tecnologías clave que impulsarán su crecimiento, asignar recursos de manera eficiente y adaptarse a las tendencias del mercado. Además, fomenta la innovación al proporcionar una estructura clara para la evolución tecnológica y la transformación digital.
''',
    'code_example': r'''
# Ejemplo de estructura de un roadmap tecnológico en formato YAML
roadmap:
  - fase: Evaluación
    objetivos:
      - Analizar tecnologías emergentes
      - Identificar necesidades del negocio
    duración: 3 meses
  - fase: Planificación
    objetivos:
      - Seleccionar tecnologías prioritarias
      - Definir recursos y presupuesto
    duración: 2 meses
  - fase: Implementación
    objetivos:
      - Desarrollar e integrar soluciones tecnológicas
      - Capacitar al personal
    duración: 6 meses
  - fase: Revisión
    objetivos:
      - Evaluar resultados
      - Ajustar estrategias según feedback
    duración: 1 mes
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 4,
    'title_level': 'Liderazgo y Estrategia',
    'topic': 'Estrategia Tecnológica',
    'subtopic': 'Evaluación de tecnologías',
    'definition': '''
La evaluación de tecnologías es el proceso sistemático de analizar y comparar diferentes soluciones tecnológicas para determinar su idoneidad en función de criterios específicos, como rendimiento, costo, escalabilidad y compatibilidad. Este análisis permite a las organizaciones tomar decisiones informadas sobre la adopción, actualización o reemplazo de tecnologías, alineando las inversiones con los objetivos estratégicos.

Esto tiene una lógica muy clara: al evaluar tecnologías de manera estructurada, se minimizan los riesgos asociados a la implementación de soluciones inadecuadas y se optimiza el retorno de inversión. Además, facilita la identificación de oportunidades de innovación y mejora continua en los procesos empresariales.
''',
    'code_example': r'''
# Ejemplo de matriz de evaluación de tecnologías en formato Markdown

| Tecnología | Costo | Escalabilidad | Compatibilidad | Puntaje Total |
|------------|-------|---------------|----------------|---------------|
| Tech A     | Bajo  | Alta          | Media          | 8.5           |
| Tech B     | Medio | Alta          | Alta           | 9.0           |
| Tech C     | Alto  | Media         | Alta           | 7.5           |

# La tecnología con el puntaje más alto se considera la más adecuada según los criterios establecidos.
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 4,
    'title_level': 'Liderazgo y Estrategia',
    'topic': 'Estrategia Tecnológica',
    'subtopic': 'Migraciones complejas',
    'definition': '''
Las migraciones complejas implican la transferencia de sistemas, aplicaciones o datos desde un entorno a otro, como de infraestructuras locales a la nube, o entre diferentes plataformas tecnológicas. Este proceso requiere una planificación meticulosa, evaluación de riesgos, pruebas exhaustivas y una ejecución cuidadosa para garantizar la continuidad del negocio y la integridad de los datos.

Esto tiene una explicación, y es porque las migraciones mal gestionadas pueden resultar en interrupciones significativas, pérdida de datos o vulnerabilidades de seguridad. Al abordar migraciones complejas con una estrategia bien definida, se asegura una transición fluida, se minimizan los riesgos y se optimiza el rendimiento en el nuevo entorno.
''',
    'code_example': r'''
# Pasos clave en una migración compleja

1. Evaluación inicial:
   - Identificar sistemas y datos a migrar
   - Analizar dependencias y compatibilidades

2. Planificación:
   - Establecer cronograma y recursos necesarios
   - Definir estrategias de respaldo y recuperación

3. Pruebas:
   - Realizar pruebas en entornos de desarrollo o staging
   - Validar integridad de datos y funcionalidad

4. Ejecución:
   - Implementar la migración según el plan establecido
   - Monitorear el proceso en tiempo real

5. Post-migración:
   - Verificar el éxito de la migración
   - Documentar lecciones aprendidas y ajustes necesarios
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 4,
    'title_level': 'Liderazgo y Estrategia',
    'topic': 'Estrategia Tecnológica',
    'subtopic': 'Presupuestos técnicos',
    'definition': '''
Los presupuestos técnicos son estimaciones financieras detalladas que asignan recursos económicos a proyectos o iniciativas tecnológicas dentro de una organización. Incluyen costos asociados a hardware, software, personal, capacitación, mantenimiento y contingencias. Un presupuesto técnico bien elaborado permite una gestión eficiente de los recursos, garantiza la viabilidad de los proyectos y facilita la toma de decisiones estratégicas.

Esto tiene una lógica muy clara: al establecer presupuestos técnicos precisos, las organizaciones pueden priorizar inversiones, evitar sobrecostos y asegurar que los proyectos tecnológicos se alineen con los objetivos financieros y estratégicos generales.
''',
    'code_example': r'''
# Ejemplo de desglose de un presupuesto técnico en formato JSON
{
  "proyecto": "Implementación de sistema ERP",
  "presupuesto": {
    "hardware": 50000,
    "software": 75000,
    "personal": 120000,
    "capacitación": 15000,
    "mantenimiento": 10000,
    "contingencias": 10000
  },
  "total": 280000
}
''',
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 4,
    'title_level': 'Liderazgo y Estrategia',
    'topic': 'Contribución Open Source',
    'subtopic': 'Contribución al kernel',
    'definition': '''
Contribuir al kernel de Linux implica participar en el desarrollo y mejora del núcleo del sistema operativo. Este proceso requiere comprender la arquitectura del kernel, familiarizarse con el flujo de trabajo de desarrollo y seguir las directrices establecidas por la comunidad. Las contribuciones pueden variar desde la corrección de errores hasta la implementación de nuevas funcionalidades.

Esto tiene una explicación, y es porque el kernel de Linux es un proyecto de código abierto mantenido por una comunidad global. Participar en su desarrollo no solo mejora el sistema operativo, sino que también permite a los desarrolladores adquirir experiencia valiosa y colaborar con expertos en el campo.
''',
    'code_example': r'''
# Pasos para contribuir al kernel de Linux

1. Clonar el repositorio oficial:
   git clone https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

2. Crear una rama para tu trabajo:
   git checkout -b mi_contribucion

3. Realizar los cambios necesarios en el código fuente.

4. Compilar y probar el kernel modificado.

5. Generar un parche con tus cambios:
   git format-patch origin/master --stdout > mi_parche.patch

6. Enviar el parche a la lista de correo correspondiente siguiendo las directrices de envío.
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 4,
    'title_level': 'Liderazgo y Estrategia',
    'topic': 'Contribución Open Source',
    'subtopic': 'Mantenimiento de paquetes',
    'definition': '''
El mantenimiento de paquetes en proyectos de código abierto implica la responsabilidad de actualizar, corregir errores y garantizar la compatibilidad de un paquete de software. Los mantenedores deben revisar las contribuciones de otros, gestionar las versiones y comunicarse con la comunidad para asegurar la calidad y estabilidad del software.

Esto tiene una lógica muy clara: un mantenimiento adecuado asegura que los usuarios tengan acceso a versiones estables y seguras del software, fomentando la confianza y la adopción en la comunidad.
''',
    'code_example': r'''
# Ejemplo de flujo de trabajo para el mantenimiento de un paquete

1. Revisar las solicitudes de extracción (pull requests) pendientes.

2. Probar los cambios propuestos en un entorno controlado.

3. Comentar y solicitar modificaciones si es necesario.

4. Fusionar los cambios aprobados en la rama principal.

5. Actualizar la versión del paquete y generar una nueva versión:
   - Modificar el archivo de versión.
   - Crear una etiqueta (tag) en el sistema de control de versiones.

6. Publicar la nueva versión en el repositorio correspondiente.
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 4,
    'title_level': 'Liderazgo y Estrategia',
    'topic': 'Contribución Open Source',
    'subtopic': 'Comunidades técnicas',
    'definition': '''
Las comunidades técnicas de código abierto son grupos de individuos que colaboran en el desarrollo, mantenimiento y promoción de proyectos de software. Estas comunidades fomentan la colaboración, el aprendizaje compartido y la innovación, proporcionando un entorno donde los miembros pueden contribuir, aprender y crecer profesionalmente.

Esto tiene una explicación, y es porque las comunidades técnicas son el núcleo del movimiento de código abierto, facilitando la creación de software de alta calidad y promoviendo una cultura de colaboración y transparencia.
''',
    'code_example': r'''
# Formas de participar en comunidades técnicas

1. Unirse a listas de correo o foros de discusión del proyecto.

2. Participar en canales de chat o plataformas de comunicación en tiempo real.

3. Contribuir con código, documentación o pruebas.

4. Asistir a reuniones virtuales o presenciales de la comunidad.

5. Organizar o participar en eventos locales relacionados con el proyecto.
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 4,
    'title_level': 'Liderazgo y Estrategia',
    'topic': 'Contribución Open Source',
    'subtopic': 'Eventos y conferencias',
    'definition': '''
Los eventos y conferencias de código abierto son encuentros donde desarrolladores, usuarios y entusiastas se reúnen para compartir conocimientos, experiencias y avances en proyectos de software libre. Estos eventos fomentan la colaboración, el aprendizaje y la creación de redes profesionales, siendo fundamentales para el crecimiento y la sostenibilidad de las comunidades de código abierto.

Esto tiene una lógica muy clara: al reunir a miembros de la comunidad, se fortalecen los lazos, se comparten mejores prácticas y se impulsa la innovación en el ecosistema de software libre.
''',
    'code_example': r'''
# Ejemplos de eventos y conferencias de código abierto

- Open Source Summit: Conferencia global organizada por la Linux Foundation.

- FOSDEM: Evento anual en Bruselas centrado en el desarrollo de software libre.

- PyCon: Conferencia para la comunidad de Python.

- DebConf: Reunión anual de desarrolladores de Debian.

- OpenSouthCode: Evento en Málaga que reúne a comunidades de software libre y hardware abierto.
''',
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 4,
    'title_level': 'Liderazgo y Estrategia',
    'topic': 'Arquitectura Empresarial',
    'subtopic': 'Alineación con negocio',
    'definition': '''
La alineación con el negocio en el contexto de la arquitectura empresarial se refiere a la capacidad de sincronizar las estrategias de tecnología de la información (TI) con los objetivos y necesidades del negocio. Esta alineación asegura que las inversiones y desarrollos tecnológicos apoyen directamente las metas empresariales, mejorando la eficiencia y la competitividad.

Esto tiene una explicación, y es porque una arquitectura empresarial bien alineada permite que las decisiones tecnológicas se tomen considerando el impacto en el negocio, facilitando la adaptación a cambios del mercado y optimizando los recursos disponibles.
''',
    'code_example': r'''
# Ejemplo de alineación entre TI y negocio

Objetivo del negocio: Expandir la presencia en línea para aumentar las ventas.

Estrategia de TI alineada:
- Implementar una plataforma de comercio electrónico escalable.
- Integrar sistemas de gestión de inventario en tiempo real.
- Utilizar análisis de datos para personalizar la experiencia del cliente.

Resultado esperado: Incremento del 25% en las ventas en línea en el próximo año.
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 4,
    'title_level': 'Liderazgo y Estrategia',
    'topic': 'Arquitectura Empresarial',
    'subtopic': 'Gobierno de TI',
    'definition': '''
El gobierno de TI es el marco que establece la estructura y los procesos para asegurar que la tecnología de la información se utilice de manera efectiva y eficiente en el cumplimiento de los objetivos empresariales. Incluye la definición de roles, responsabilidades, políticas y procedimientos para la toma de decisiones y la supervisión de las actividades de TI.

Esto tiene una lógica muy clara: un gobierno de TI sólido garantiza que las inversiones tecnológicas generen valor, gestionen los riesgos asociados y cumplan con las regulaciones y estándares aplicables.
''',
    'code_example': r'''
# Componentes clave del gobierno de TI

1. Comité de gobernanza de TI: Grupo responsable de la supervisión estratégica de TI.
2. Políticas de seguridad de la información: Directrices para proteger los activos digitales.
3. Gestión de riesgos de TI: Identificación y mitigación de riesgos tecnológicos.
4. Auditorías de cumplimiento: Evaluaciones periódicas para asegurar la adherencia a normas y regulaciones.
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 4,
    'title_level': 'Liderazgo y Estrategia',
    'topic': 'Arquitectura Empresarial',
    'subtopic': 'Gestión de riesgos',
    'definition': '''
La gestión de riesgos en arquitectura empresarial implica la identificación, evaluación y mitigación de riesgos que puedan afectar la capacidad de la organización para alcanzar sus objetivos estratégicos. Esto abarca riesgos tecnológicos, operativos, financieros y de cumplimiento.

Esto tiene una explicación, y es porque una gestión de riesgos efectiva permite a la organización anticipar problemas potenciales, reducir impactos negativos y tomar decisiones informadas para asegurar la resiliencia y sostenibilidad del negocio.
''',
    'code_example': r'''
# Proceso de gestión de riesgos

1. Identificación de riesgos: Detectar posibles amenazas a los activos y procesos.
2. Evaluación de riesgos: Analizar la probabilidad y el impacto de cada riesgo.
3. Planificación de respuestas: Desarrollar estrategias para mitigar o aceptar riesgos.
4. Monitoreo y revisión: Supervisar los riesgos y ajustar las estrategias según sea necesario.
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 4,
    'title_level': 'Liderazgo y Estrategia',
    'topic': 'Arquitectura Empresarial',
    'subtopic': 'Transformación digital',
    'definition': '''
La transformación digital es el proceso de integrar tecnologías digitales en todas las áreas de una organización, cambiando fundamentalmente la forma en que opera y ofrece valor a sus clientes. En el contexto de la arquitectura empresarial, esto implica rediseñar procesos, estructuras y modelos de negocio para aprovechar al máximo las capacidades digitales.

Esto tiene una lógica muy clara: al adoptar la transformación digital, las organizaciones pueden mejorar la eficiencia operativa, responder más rápidamente a las demandas del mercado y crear nuevas oportunidades de crecimiento e innovación.
''',
    'code_example': r'''
# Ejemplo de iniciativas de transformación digital

1. Automatización de procesos: Implementar sistemas que reduzcan la intervención manual.
2. Análisis de datos: Utilizar big data y analytics para tomar decisiones basadas en datos.
3. Experiencia del cliente: Desarrollar plataformas digitales que mejoren la interacción con el cliente.
4. Cultura digital: Fomentar una mentalidad abierta al cambio y la innovación tecnológica entre los empleados.
''',
  });
}

Future<void> insertSrLevel5DataLinux(Database db) async {
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Especializaciones Avanzadas',
    'topic': 'Seguridad Ofensiva',
    'subtopic': 'Pentesting básico',
    'definition': '''
El pentesting básico, o prueba de penetración, consiste en simular ataques controlados a sistemas, redes o aplicaciones para identificar vulnerabilidades explotables. Esta práctica permite evaluar la seguridad desde la perspectiva de un atacante y fortalecer las defensas antes de que ocurran incidentes reales.

Esto tiene una lógica muy clara: al adoptar el enfoque de un atacante ético, se pueden descubrir y corregir debilidades que podrían ser aprovechadas por ciberdelincuentes, mejorando así la postura de seguridad de la organización.
''',
    'code_example': r'''
# Ejemplo de pentesting básico en Linux

1. Escaneo de puertos con Nmap:
   nmap -sS -T4 -p- 192.168.1.100

2. Enumeración de servicios:
   nmap -sV -p 22,80,443 192.168.1.100

3. Detección de vulnerabilidades con Nikto:
   nikto -h http://192.168.1.100

4. Prueba de acceso con Metasploit:
   msfconsole
   use exploit/unix/ftp/vsftpd_234_backdoor
   set RHOST 192.168.1.100
   run
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Especializaciones Avanzadas',
    'topic': 'Seguridad Ofensiva',
    'subtopic': 'Análisis de vulnerabilidades',
    'definition': '''
El análisis de vulnerabilidades es el proceso de identificar, clasificar y priorizar debilidades en sistemas informáticos que podrían ser explotadas por atacantes. A diferencia del pentesting, este análisis no implica la explotación activa de las vulnerabilidades, sino su detección y evaluación para una posterior mitigación.

Esto tiene una explicación, y es porque al conocer las vulnerabilidades existentes, las organizaciones pueden tomar medidas proactivas para corregirlas, reduciendo así la superficie de ataque y mejorando la seguridad general.
''',
    'code_example': r'''
# Ejemplo de análisis de vulnerabilidades en Linux

1. Escaneo con OpenVAS:
   openvas-start
   Acceder a la interfaz web en https://localhost:9392
   Crear y ejecutar un nuevo escaneo contra el objetivo deseado.

2. Escaneo con Nessus:
   /etc/init.d/nessusd start
   Acceder a la interfaz web en https://localhost:8834
   Configurar y ejecutar un escaneo de vulnerabilidades.

3. Uso de Lynis para auditoría del sistema:
   lynis audit system
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Especializaciones Avanzadas',
    'topic': 'Seguridad Ofensiva',
    'subtopic': 'Red Team básico',
    'definition': '''
El Red Team básico se refiere a un grupo de profesionales que simulan ataques cibernéticos avanzados para evaluar la eficacia de las defensas de una organización. A diferencia del pentesting, que se centra en identificar vulnerabilidades específicas, el Red Teaming busca probar la detección, respuesta y resiliencia de la organización ante amenazas persistentes.

Esto tiene una lógica muy clara: al emular tácticas, técnicas y procedimientos de atacantes reales, se pueden identificar brechas en la seguridad que podrían no ser evidentes mediante pruebas convencionales, fortaleciendo así la postura defensiva.
''',
    'code_example': r'''
# Fases de un ejercicio de Red Team básico

1. Reconocimiento:
   - Recolección de información pública sobre la organización.
   - Identificación de empleados y tecnologías utilizadas.

2. Enumeración:
   - Escaneo de redes y servicios expuestos.
   - Identificación de posibles vectores de ataque.

3. Explotación:
   - Uso de herramientas como Metasploit para aprovechar vulnerabilidades.
   - Implementación de payloads personalizados.

4. Persistencia:
   - Establecimiento de accesos persistentes en sistemas comprometidos.
   - Uso de técnicas de evasión para evitar detección.

5. Exfiltración:
   - Simulación de extracción de datos sensibles.
   - Evaluación de la capacidad de detección y respuesta del equipo de seguridad.

6. Informe:
   - Documentación detallada de hallazgos y recomendaciones.
   - Presentación de resultados a las partes interesadas.
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Especializaciones Avanzadas',
    'topic': 'Seguridad Ofensiva',
    'subtopic': 'Hardening extremo',
    'definition': '''
El hardening extremo consiste en aplicar medidas avanzadas para reforzar la seguridad de sistemas y redes, reduciendo al mínimo su superficie de ataque. Esto incluye la desactivación de servicios innecesarios, la configuración estricta de políticas de seguridad y la implementación de controles de acceso robustos.

Esto tiene una explicación, y es porque al minimizar las posibles vías de ataque, se dificulta la labor de los atacantes, aumentando la resistencia del sistema frente a intrusiones y compromisos.
''',
    'code_example': r'''
# Ejemplo de hardening extremo en Linux

1. Desactivar servicios innecesarios:
   systemctl disable bluetooth.service
   systemctl disable avahi-daemon.service

2. Configurar políticas de contraseñas:
   Editar /etc/login.defs y establecer parámetros como PASS_MAX_DAYS, PASS_MIN_DAYS, PASS_MIN_LEN.

3. Implementar listas de control de acceso (ACLs):
   setfacl -m u:usuario:r-- archivo.txt

4. Configurar firewall con iptables:
   iptables -P INPUT DROP
   iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
   iptables -A INPUT -p tcp --dport 22 -j ACCEPT

5. Auditar el sistema con Lynis:
   lynis audit system
''',
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Especializaciones Avanzadas',
    'topic': 'Data Engineering',
    'subtopic': 'Big Data en Linux',
    'definition': '''
Big Data en Linux se refiere al manejo y procesamiento de grandes volúmenes de datos utilizando herramientas y tecnologías compatibles con el sistema operativo Linux. Esto incluye el uso de frameworks como Apache Hadoop y Apache Spark, que permiten distribuir y procesar datos a gran escala de manera eficiente.:contentReference[oaicite:8]{index=8}

:contentReference[oaicite:10]{index=10}:contentReference[oaicite:12]{index=12}
''',
    'code_example': r'''
# Ejemplo: Instalación básica de Apache Hadoop en Linux

1. Descargar Hadoop:
   wget https://downloads.apache.org/hadoop/common/hadoop-3.3.0/hadoop-3.3.0.tar.gz

2. Extraer el archivo:
   tar -xzvf hadoop-3.3.0.tar.gz

3. Configurar variables de entorno en ~/.bashrc:
   export HADOOP_HOME=~/hadoop-3.3.0
   export PATH=$PATH:$HADOOP_HOME/bin

4. Verificar la instalación:
   hadoop version
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Especializaciones Avanzadas',
    'topic': 'Data Engineering',
    'subtopic': 'Pipelines de datos',
    'definition': '''
:contentReference[oaicite:14]{index=14} :contentReference[oaicite:17]{index=17}:contentReference[oaicite:19]{index=19}

:contentReference[oaicite:21]{index=21}:contentReference[oaicite:23]{index=23}
''',
    'code_example': r'''
# Ejemplo: Pipeline simple en Linux

cat datos.txt | grep "error" | sort | uniq -c | sort -nr > resumen_errores.txt

# Descripción:
# 1. cat datos.txt: Lee el archivo de datos.
# 2. grep "error": Filtra las líneas que contienen la palabra "error".
# 3. sort: Ordena las líneas.
# 4. uniq -c: Cuenta las ocurrencias únicas.
# 5. sort -nr: Ordena numéricamente en orden descendente.
# 6. > resumen_errores.txt: Guarda el resultado en un archivo.
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Especializaciones Avanzadas',
    'topic': 'Data Engineering',
    'subtopic': 'Optimización para analytics',
    'definition': '''
:contentReference[oaicite:25]{index=25} :contentReference[oaicite:28]{index=28}:contentReference[oaicite:30]{index=30}

:contentReference[oaicite:32]{index=32}:contentReference[oaicite:34]{index=34}
''',
    'code_example': r'''
# Ejemplo: Ajuste de parámetros del kernel para mejorar el rendimiento

1. Verificar el valor actual de swappiness:
   cat /proc/sys/vm/swappiness

2. Establecer un nuevo valor (por ejemplo, 10):
   sudo sysctl vm.swappiness=10

3. Hacer el cambio permanente editando /etc/sysctl.conf:
   vm.swappiness=10

# Descripción:
# El parámetro swappiness controla la tendencia del sistema a usar swap.
# Un valor más bajo reduce el uso de swap, lo que puede mejorar el rendimiento en cargas analíticas intensivas.
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Especializaciones Avanzadas',
    'topic': 'Data Engineering',
    'subtopic': 'Almacenamiento masivo',
    'definition': '''
:contentReference[oaicite:36]{index=36} :contentReference[oaicite:39]{index=39}:contentReference[oaicite:41]{index=41}

:contentReference[oaicite:43]{index=43}:contentReference[oaicite:45]{index=45}
''',
    'code_example': r'''
# Ejemplo: Crear un volumen lógico con LVM en Linux

1. Crear un volumen físico:
   sudo pvcreate /dev/sdb

2. Crear un grupo de volúmenes:
   sudo vgcreate datos_vg /dev/sdb

3. Crear un volumen lógico:
   sudo lvcreate -L 100G -n datos_lv datos_vg

4. Formatear el volumen lógico:
   sudo mkfs.ext4 /dev/datos_vg/datos_lv

5. Montar el volumen:
   sudo mkdir /mnt/datos
   sudo mount /dev/datos_vg/datos_lv /mnt/datos

# Descripción:
# Este proceso configura un volumen lógico de 100GB utilizando LVM,
# permitiendo una gestión flexible del almacenamiento.
''',
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Especializaciones Avanzadas',
    'topic': 'Edge Computing',
    'subtopic': 'Kubernetes en edge',
    'definition': '''
Kubernetes en el edge se refiere a la implementación y gestión de clústeres de Kubernetes en entornos de computación perimetral, donde los recursos son limitados y la conectividad puede ser intermitente. Herramientas como KubeEdge y K3s permiten extender las capacidades de orquestación de contenedores de Kubernetes a dispositivos y nodos en el edge, facilitando el despliegue y la administración de aplicaciones en estos entornos.:contentReference[oaicite:4]{index=4}

:contentReference[oaicite:6]{index=6}:contentReference[oaicite:8]{index=8}
''',
    'code_example': r'''
# Ejemplo: Instalación de K3s en un dispositivo edge

1. Descargar e instalar K3s:
   curl -sfL https://get.k3s.io | sh -

2. Verificar el estado del servicio:
   sudo systemctl status k3s

3. Consultar los nodos del clúster:
   sudo k3s kubectl get nodes

# Descripción:
# K3s es una distribución ligera de Kubernetes optimizada para entornos edge,
# permitiendo una implementación sencilla en dispositivos con recursos limitados.
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Especializaciones Avanzadas',
    'topic': 'Edge Computing',
    'subtopic': 'Dispositivos IoT',
    'definition': '''
:contentReference[oaicite:10]{index=10} :contentReference[oaicite:13]{index=13}:contentReference[oaicite:15]{index=15}

:contentReference[oaicite:17]{index=17}:contentReference[oaicite:19]{index=19}
''',
    'code_example': r'''
# Ejemplo: Instalación de Ubuntu Core en un dispositivo IoT

1. Descargar la imagen de Ubuntu Core para el dispositivo específico desde:
   https://ubuntu.com/download/core

2. Grabar la imagen en una tarjeta SD o unidad USB:
   sudo dd if=ubuntu-core.img of=/dev/sdX bs=4M

3. Insertar la tarjeta SD o unidad USB en el dispositivo y encenderlo.

4. Seguir las instrucciones en pantalla para completar la configuración inicial.

# Descripción:
# Ubuntu Core es una versión minimalista de Ubuntu diseñada para dispositivos IoT,
# ofreciendo actualizaciones automáticas y seguridad mejorada.
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Especializaciones Avanzadas',
    'topic': 'Edge Computing',
    'subtopic': 'Redes descentralizadas',
    'definition': '''
:contentReference[oaicite:21]{index=21} :contentReference[oaicite:24]{index=24}:contentReference[oaicite:26]{index=26}

:contentReference[oaicite:28]{index=28}:contentReference[oaicite:30]{index=30}
''',
    'code_example': r'''
# Ejemplo: Configuración de una red mesh con batman-adv en Linux

1. Instalar batman-adv:
   sudo apt-get install batctl

2. Cargar el módulo del kernel:
   sudo modprobe batman-adv

3. Configurar la interfaz de red:
   sudo ip link set wlan0 down
   sudo iwconfig wlan0 mode ad-hoc
   sudo iwconfig wlan0 essid 'mesh-network'
   sudo ip link set wlan0 up

4. Agregar la interfaz a batman-adv:
   sudo batctl if add wlan0
   sudo ip link set up dev bat0

# Descripción:
# batman-adv permite la creación de redes mesh descentralizadas,
# ideales para entornos donde la infraestructura de red es limitada o inexistente.
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Especializaciones Avanzadas',
    'topic': 'Edge Computing',
    'subtopic': 'Casos de uso industriales',
    'definition': '''
:contentReference[oaicite:32]{index=32} :contentReference[oaicite:35]{index=35}:contentReference[oaicite:37]{index=37}

:contentReference[oaicite:39]{index=39}:contentReference[oaicite:41]{index=41}
''',
    'code_example': r'''
# Ejemplo: Monitoreo de sensores industriales con Node-RED en Linux

1. Instalar Node-RED:
   sudo npm install -g --unsafe-perm node-red

2. Iniciar Node-RED:
   node-red

3. Acceder a la interfaz web:
   http://localhost:1880

4. Crear un flujo que lea datos de sensores conectados y los visualice en tiempo real.

# Descripción:
# Node-RED es una herramienta basada en flujo para programar aplicaciones IoT,
# facilitando la integración y visualización de datos en entornos industriales.
''',
  });
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Especializaciones Avanzadas',
    'topic': 'HPC (High Performance Computing)',
    'subtopic': 'Clusters HPC',
    'definition': '''
Un clúster de HPC (High Performance Computing) es un conjunto de computadoras interconectadas (nodos) que trabajan de manera coordinada para realizar cálculos complejos a altas velocidades. Cada nodo actúa como una unidad independiente con sus propios recursos, pero al estar conectados mediante una red de alta velocidad y gestionados por un sistema central, pueden combinar su potencia de procesamiento para abordar tareas que serían inabordables para una sola máquina.:contentReference[oaicite:8]{index=8}

:contentReference[oaicite:10]{index=10}:contentReference[oaicite:12]{index=12}
''',
    'code_example': r'''
# Ejemplo: Configuración básica de un clúster HPC con OpenHPC

1. Instalar el repositorio de OpenHPC:
   sudo yum install -y epel-release
   sudo yum install -y https://repos.openhpc.community/OpenHPC/2/EL_8/x86_64/ohpc-release-2-1.el8.x86_64.rpm

2. Instalar los paquetes base:
   sudo yum groupinstall -y ohpc-base

3. Configurar el nodo de administración y los nodos de cómputo según la documentación oficial de OpenHPC.

# Nota:
# OpenHPC proporciona una colección de componentes precompilados para facilitar la implementación de clústeres HPC en entornos Linux.
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Especializaciones Avanzadas',
    'topic': 'HPC (High Performance Computing)',
    'subtopic': 'MPI y OpenMP',
    'definition': '''
:contentReference[oaicite:14]{index=14}:contentReference[oaicite:16]{index=16}

- **MPI**: :contentReference[oaicite:18]{index=18} :contentReference[oaicite:21]{index=21}:contentReference[oaicite:23]{index=23}

- **OpenMP**: :contentReference[oaicite:25]{index=25} :contentReference[oaicite:28]{index=28}:contentReference[oaicite:30]{index=30}

:contentReference[oaicite:32]{index=32} :contentReference[oaicite:35]{index=35}:contentReference[oaicite:37]{index=37}
''',
    'code_example': r'''
# Ejemplo: Programa paralelo utilizando MPI en C

#include <mpi.h>
#include <stdio.h>

int main(int argc, char** argv) {
    MPI_Init(NULL, NULL);

    int world_rank;
    MPI_Comm_rank(MPI_COMM_WORLD, &world_rank);

    int world_size;
    MPI_Comm_size(MPI_COMM_WORLD, &world_size);

    printf("Hola desde el proceso %d de %d\n", world_rank, world_size);

    MPI_Finalize();
    return 0;
}

# Compilar:
mpicc -o hola_mpi hola_mpi.c

# Ejecutar con 4 procesos:
mpirun -np 4 ./hola_mpi
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Especializaciones Avanzadas',
    'topic': 'HPC (High Performance Computing)',
    'subtopic': 'Optimización científica',
    'definition': '''
:contentReference[oaicite:39]{index=39} :contentReference[oaicite:42]{index=42}:contentReference[oaicite:44]{index=44}

:contentReference[oaicite:46]{index=46} :contentReference[oaicite:49]{index=49}:contentReference[oaicite:51]{index=51}
''',
    'code_example': r'''
# Ejemplo: Uso de la herramienta 'perf' para analizar el rendimiento de una aplicación

1. Ejecutar la aplicación con 'perf':
   perf stat ./mi_aplicacion

2. Analizar los resultados para identificar cuellos de botella, como:
   - Número de instrucciones ejecutadas
   - Fallos de caché
   - Ciclos de CPU

3. Basado en el análisis, aplicar optimizaciones como:
   - Reescritura de algoritmos ineficientes
   - Uso de bibliotecas optimizadas (por ejemplo, BLAS, LAPACK)
   - Paralelización de secciones críticas del código
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Especializaciones Avanzadas',
    'topic': 'HPC (High Performance Computing)',
    'subtopic': 'Gestión de recursos',
    'definition': '''
:contentReference[oaicite:53]{index=53} :contentReference[oaicite:56]{index=56}:contentReference[oaicite:58]{index=58}

:contentReference[oaicite:60]{index=60}:contentReference[oaicite:62]{index=62}
''',
    'code_example': r'''
# Ejemplo: Envío de un trabajo al gestor de colas SLURM

1. Crear un script de envío (trabajo.slurm):

#!/bin/bash
#SBATCH --job-name=mi_trabajo
#SBATCH --output=salida.txt
#SBATCH --error=error.txt
#SBATCH --ntasks=4
#SBATCH --time=01:00:00
#SBATCH --partition=general

srun ./mi_aplicacion

2. Enviar el trabajo al clúster:
   sbatch trabajo.slurm

# Descripción:
# Este script solicita 4 tareas (procesos) para ejecutar 'mi_aplicacion' durante un máximo de 1 hora en la partición 'general'.
''',
  });
}

Future<void> insertSrLevel6DataLinux(Database db) async {
  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Preparación para Certificaciones Senior',
    'topic': 'CKA (Certified Kubernetes Administrator)',
    'subtopic': 'Kubernetes en producción',
    'definition': '''
Kubernetes en producción va más allá de simplemente desplegar contenedores. Se trata de gestionar cargas de trabajo reales con requisitos de disponibilidad, escalabilidad y seguridad.

Si nunca has trabajado con Kubernetes en entornos productivos, puede parecer abrumador al principio. La diferencia entre un cluster de desarrollo y uno de producción es significativa.

En producción necesitarás considerar aspectos como alta disponibilidad (múltiples nodos maestros), políticas de recursos (requests/limits), redes seguras (NetworkPolicies), actualizaciones sin downtime (rolling updates) y monitorización exhaustiva. Empresas como Spotify o Adidas han migrado sus cargas de trabajo críticas a Kubernetes, pero no fue un proceso sencillo - requirió planificación cuidadosa y pruebas rigurosas.

La clave está en entender que cada decisión de configuración afecta la estabilidad del sistema. Desde cómo configuras tus HPA (Horizontal Pod Autoscalers) hasta las estrategias de drenado de nodos para mantenimiento, todo debe estar documentado y probado.
''',
    'code_example': '''
# Ejemplo de Deployment para producción
apiVersion: apps/v1
kind: Deployment
metadata:
  name: webapp-prod
spec:
  replicas: 3
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxUnavailable: 1
      maxSurge: 1
  selector:
    matchLabels:
      app: webapp
  template:
    metadata:
      labels:
        app: webapp
    spec:
      containers:
      - name: webapp
        image: myrepo/webapp:v1.2.3
        resources:
          requests:
            cpu: "500m"
            memory: "512Mi"
          limits:
            cpu: "1000m"
            memory: "1Gi"
        readinessProbe:
          httpGet:
            path: /health
            port: 8080
          initialDelaySeconds: 5
          periodSeconds: 10
        livenessProbe:
          httpGet:
            path: /live
            port: 8080
          initialDelaySeconds: 15
          periodSeconds: 20
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Preparación para Certificaciones Senior',
    'topic': 'CKA (Certified Kubernetes Administrator)',
    'subtopic': 'Troubleshooting avanzado',
    'definition': '''
El troubleshooting en Kubernetes puede ser complejo debido a su naturaleza distribuida. Cuando algo falla, el problema podría estar en cualquier capa del sistema.

Muchos administradores novatos se frustran cuando los pods no se inician o los servicios no son accesibles. La realidad es que Kubernetes proporciona todas las herramientas necesarias para diagnosticar problemas, pero hay que saber usarlas estratégicamente.

Un enfoque metódico es crucial: comenzar verificando el estado de los pods (kubectl get pods --all-namespaces), luego examinar los eventos (kubectl get events --sort-by=.metadata.creationTimestamp), revisar logs (kubectl logs -f <pod>) y finalmente inspeccionar la configuración de los recursos. Problemas comunes incluyen quotas de recursos agotadas, problemas de montaje de volúmenes persistentes o configuraciones incorrectas de NetworkPolicies.

Herramientas como kube-bench y kube-hunter pueden ayudar a identificar problemas de seguridad, mientras que k9s proporciona una interfaz más amigable para la inspección visual del cluster.
''',
    'code_example': r'''
# Comandos útiles para troubleshooting
# Ver estado detallado de un pod (incluye razones de fallos)
kubectl describe pod <pod-name>

# Ver logs de un contenedor específico
kubectl logs <pod-name> -c <container-name>

# Ver eventos del cluster ordenados por tiempo
kubectl get events --sort-by=.metadata.creationTimestamp

# Ejecutar shell en un pod fallando para diagnóstico
kubectl exec -it <pod-name> -- /bin/sh

# Ver configuración actual de un recurso
kubectl get <resource-type> <resource-name> -o yaml

# Comprobar conectividad de red entre pods
kubectl run tmp-shell --rm -i --tty --image nicolaka/netshoot -- /bin/bash
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Preparación para Certificaciones Senior',
    'topic': 'CKA (Certified Kubernetes Administrator)',
    'subtopic': 'Seguridad en Kubernetes',
    'definition': '''
La seguridad en Kubernetes es un tema multifacético que abarca desde la configuración del cluster hasta las políticas de runtime de los contenedores. No es algo que puedas dejar para después.

Cuando empresas como Tesla sufrieron brechas de seguridad por clusters Kubernetes mal configurados, quedó claro que la seguridad no es opcional. El modelo de seguridad de Kubernetes sigue el principio de defensa en profundidad.

Los aspectos clave incluyen: autenticación y autorización (RBAC), seguridad a nivel de red (NetworkPolicies), hardening de pods (SecurityContexts), gestión de secretos (no almacenarlos en configmaps), y escaneo de imágenes. Además, herramientas como OPA Gatekeeper permiten implementar políticas personalizadas.

No subestimes la importancia de rotar certificados regularmente, auditar los accesos al cluster y mantener todos los componentes actualizados. Un cluster seguro es un proceso continuo, no un estado fijo.
''',
    'code_example': r'''
# Ejemplo de SecurityContext para un pod
apiVersion: v1
kind: Pod
metadata:
  name: security-context-demo
spec:
  securityContext:
    runAsUser: 1000
    runAsGroup: 3000
    fsGroup: 2000
  containers:
  - name: sec-ctx-demo
    image: busybox
    command: ["sh", "-c", "sleep 1h"]
    securityContext:
      allowPrivilegeEscalation: false
      capabilities:
        drop: ["ALL"]
      readOnlyRootFilesystem: true

# Ejemplo de NetworkPolicy que restringe el tráfico
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: default-deny-all
spec:
  podSelector: {}
  policyTypes:
  - Ingress
  - Egress
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Preparación para Certificaciones Senior',
    'topic': 'CKA (Certified Kubernetes Administrator)',
    'subtopic': 'Simulacros prácticos',
    'definition': '''
Los simulacros prácticos son la mejor preparación para el examen CKA. Este examen es completamente práctico, donde te piden resolver problemas reales en un entorno limitado por tiempo.

Algunos candidatos cometen el error de solo estudiar teoría. La diferencia entre aprobar y reprobar a menudo está en la familiaridad con el entorno de examen y la velocidad para ejecutar comandos bajo presión.

Practica escenarios como: recuperar un nodo caído, diagnosticar problemas de networking entre pods, configurar RBAC para nuevos usuarios, o implementar actualizaciones sin downtime. Herramientas como Killer.sh ofrecen entornos de práctica muy similares al examen real.

Recuerda que durante el examen puedes acceder a la documentación oficial de Kubernetes, pero el tiempo es limitado. La clave está en saber exactamente qué buscar y cómo aplicar rápidamente las soluciones.
''',
    'code_example': r'''
# Ejemplo de tarea práctica típica del CKA:
# Tarea: Crear un deployment llamado nginx-deploy con 3 réplicas usando la imagen nginx:1.14.2
# Luego actualizar la imagen a nginx:1.19.0 usando rolling update

# Solución:
kubectl create deployment nginx-deploy --image=nginx:1.14.2 --replicas=3
kubectl set image deployment/nginx-deploy nginx=nginx:1.19.0
kubectl rollout status deployment/nginx-deploy

# Tarea: Crear un pod llamado multi-container con dos contenedores:
# - busybox (imagen: busybox) que ejecute "sleep 3600"
# - nginx (imagen: nginx)

# Solución:
apiVersion: v1
kind: Pod
metadata:
  name: multi-container
spec:
  containers:
  - name: busybox
    image: busybox
    command: ["sleep", "3600"]
  - name: nginx
    image: nginx
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Preparación para Certificaciones Senior',
    'topic': 'RHCA (Red Hat Certified Architect)',
    'subtopic': 'Especializaciones disponibles',
    'definition': '''
El RHCA no es una certificación única, sino un conjunto de especializaciones avanzadas que permiten personalizar tu ruta de aprendizaje. Red Hat ofrece diferentes caminos según tu área de enfoque profesional.

Al principio puede resultar confuso entender la variedad de opciones disponibles. Cada especialización está diseñada para resolver problemas específicos en entornos empresariales reales.

Las principales rutas son:
- Infraestructura: Centrada en sistemas, virtualización y almacenamiento (EX342, EX413)
- Cloud y Automatización: Orientada a OpenShift y Ansible (EX280, EX407)
- Desarrollo: Para arquitectos de aplicaciones empresariales (EX288)
- Seguridad: Especialización en hardening y compliance (EX415)

Empresas como IBM y Accenture valoran especialmente estas especializaciones al diseñar arquitecturas complejas para sus clientes.
''',
    'code_example': '''
# Ejemplo de estructura de certificaciones RHCA
Infraestructura:
  - EX342: Troubleshooting avanzado
  - EX413: Hardening de sistemas
  - EX436: Clusters HA

Cloud:
  - EX280: OpenShift Administration
  - EX407: Ansible Automation
  - EX447: Cloud-Native Development
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Preparación para Certificaciones Senior',
    'topic': 'RHCA (Red Hat Certified Architect)',
    'subtopic': 'Rutas de certificación',
    'definition': '''
La ruta hacia el RHCA es un viaje estratégico que requiere planificación cuidadosa. No se trata simplemente de aprobar exámenes, sino de construir un perfil profesional coherente.

Muchos profesionales se preguntan por dónde comenzar. La respuesta depende de tu experiencia actual y objetivos profesionales. Red Hat exige tener al menos un RHCE vigente como requisito previo.

Las rutas típicas incluyen:
1. Obtener el RHCE (base obligatoria)
2. Elegir 5 exámenes adicionales de la lista de especializaciones
3. Completarlos en un plazo máximo de 3 años
4. Mantener la certificación con renovaciones periódicas

Lo interesante es que puedes mezclar especializaciones de diferentes áreas, creando un perfil único como arquitecto.
''',
    'code_example': '''
# Ejemplo de ruta de certificación progresiva
Año 1:
  - RHCE (EX294)
  - EX280 (OpenShift)
  
Año 2:
  - EX342 (Troubleshooting)
  - EX407 (Ansible)
  
Año 3:
  - EX413 (Security)
  - EX442 (Performance)
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Preparación para Certificaciones Senior',
    'topic': 'RHCA (Red Hat Certified Architect)',
    'subtopic': 'Exámenes de nivel experto',
    'definition': '''
Los exámenes RHCA son de los más desafiantes en el mundo Linux. No son pruebas teóricas, sino evaluaciones prácticas de 4-8 horas donde debes resolver problemas reales.

Si piensas que son como los exámenes de certificación tradicionales, te llevarás una sorpresa. Estos exámenes simulan escenarios empresariales complejos donde debes demostrar pensamiento arquitectónico.

Algunas características clave:
- Entornos aislados con sistemas reales para configurar
- Escenarios que combinan múltiples tecnologías Red Hat
- Requieren toma de decisiones bajo presión de tiempo
- Se evalúa tanto el resultado final como el proceso

Empresas como Boeing y Lockheed Martin usan estos exámenes como benchmark para sus equipos de infraestructura crítica.
''',
    'code_example': '''
# Ejemplo de tarea típica de examen RHCA
"Configure un cluster de alta disponibilidad usando:
- Pacemaker/Corosync para gestión de recursos
- iSCSI para almacenamiento compartido
- VLANs para aislamiento de red
- Firewall con reglas específicas

Documente todas las decisiones tomadas"
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Preparación para Certificaciones Senior',
    'topic': 'RHCA (Red Hat Certified Architect)',
    'subtopic': 'Preparación estratégica',
    'definition': '''
Prepararse para el RHCA requiere un enfoque diferente a otras certificaciones. No se trata de memorizar comandos, sino de desarrollar intuición arquitectónica.

Es común que los candidatos subestimen el tiempo necesario. La preparación efectiva implica combinar estudio teórico con práctica intensiva en laboratorios reales.

Estrategias comprobadas:
1. Construir un laboratorio personal con KVM/libvirt
2. Practicar escenarios de fallos complejos
3. Dominar el arte de documentar decisiones técnicas
4. Participar en proyectos open source relacionados
5. Usar materiales oficiales de Red Hat (ningún curso tercero cubre todo)

Los arquitectos de Red Hat recomiendan dedicar al menos 100 horas de práctica por examen, enfocándose en entender el "por qué" detrás de cada solución.
''',
    'code_example': '''
# Estructura recomendada de preparación
1. Mes 1-2:
   - Estudiar objetivos oficiales
   - Configurar entorno de práctica
   
2. Mes 3-4:
   - Realizar laboratorios guiados
   - Practicar troubleshooting
   
3. Mes 5:
   - Simulacros de examen cronometrados
   - Revisar áreas débiles
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Preparación para Certificaciones Senior',
    'topic': 'LPIC-3',
    'subtopic': 'Especializaciones disponibles',
    'definition': '''
El LPIC-3 es la certificación más avanzada de LPI, pero a diferencia de otras certificaciones de nivel experto, ofrece tres especializaciones independientes que validan habilidades distintas en entornos Linux empresariales.

Al considerar el LPIC-3, muchos profesionales se sorprenden al descubrir que no existe un "LPIC-3 genérico". Cada especialización tiene su propio examen y enfoque profesional particular.

Las tres rutas disponibles son:
1. **Mixed Environments** (Examen 300): Centrado en integración Linux-Windows, SAMBA y directorios LDAP
2. **Security** (Examen 303): Profundiza en hardening, criptografía y control de acceso avanzado
3. **Virtualization & High Availability** (Examen 304): Cubre clusters, almacenamiento compartido y virtualización empresarial

Cada una sirve para diferentes roles profesionales, desde administradores de sistemas hasta arquitectos de seguridad cloud.
''',
    'code_example': '''
# Mapa de especializaciones LPIC-3:
1. Mixed Environments (300):
   - Integración con Active Directory
   - Servicios de archivos heterogéneos
   - Autenticación cruzada

2. Security (303):
   - Criptografía aplicada
   - Control de acceso obligatorio
   - Detección de intrusiones

3. Virtualization (304):
   - Clusters HA
   - Virtualización a escala
   - Recuperación ante desastres
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Preparación para Certificaciones Senior',
    'topic': 'LPIC-3',
    'subtopic': 'Seguridad avanzada',
    'definition': '''
La especialización en Seguridad del LPIC-3 (303) va mucho más allá de los conceptos básicos de hardening, abordando protección de sistemas en entornos empresariales reales con requisitos de compliance estrictos.

Quienes hayan trabajado con seguridad básica en Linux podrían subestimar la profundidad de este examen. La seguridad avanzada implica tomar decisiones arquitectónicas que afectan toda la organización.

Temas clave incluyen:
- Implementación de PKI empresarial y certificados x.509
- Configuración de sistemas de detección de intrusiones como AIDE
- Control de acceso obligatorio (MAC) usando SELinux/AppArmor
- Cifrado de discos y sistemas de archivos (LUKS, eCryptfs)
- Auditorías de seguridad y cumplimiento normativo

Empresas financieras y gubernamentales suelen requerir estas habilidades para proteger infraestructuras críticas.
''',
    'code_example': r'''
# Ejemplo de configuración de seguridad avanzada
# Configuración de auditoría con auditd
auditctl -a always,exit -F arch=b64 -S open,truncate,write -F path=/etc/passwd
auditctl -a always,exit -F arch=b64 -S bind,connect -F auid>=1000

# Política SELinux personalizada
module myapp 1.0;
require {
    type unconfined_t;
    class file { read write execute };
}
allow unconfined_t myapp_exec_t:file { execute };

# Configuración de LUKS para cifrado
cryptsetup luksFormat /dev/sdb1
cryptsetup luksOpen /dev/sdb1 secure_volume
mkfs.ext4 /dev/mapper/secure_volume
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Preparación para Certificaciones Senior',
    'topic': 'LPIC-3',
    'subtopic': 'Virtualización empresarial',
    'definition': '''
La virtualización a nivel empresarial, cubierta en el LPIC-3 304, trata sobre cómo diseñar infraestructuras virtualizadas confiables, escalables y de alto rendimiento para entornos de misión crítica.

Quienes vienen de usar VirtualBox o VMware Workstation podrían sorprenderse por la complejidad de la virtualización a escala empresarial. Aquí no hablamos de máquinas virtuales aisladas, sino de ecosistemas completos.

Componentes clave incluyen:
- Plataformas de virtualización empresarial (KVM, Xen, VMware ESXi)
- Configuración de redes virtuales complejas (VLANs, bridges, OVS)
- Almacenamiento compartido para clusters (iSCSI, Fibre Channel)
- Soluciones de alta disponibilidad (Pacemaker, Corosync)
- Migración en caliente y balanceo de carga

Compañías como Netflix y Airbnb dependen de estas tecnologías para mantener sus servicios globales disponibles 24/7.
''',
    'code_example': r'''
# Configuración avanzada de KVM para entornos empresariales
# Creación de un pool de almacenamiento compartido
virsh pool-define-as --name cluster_storage --type iscsi --source-host 192.168.1.100 --source-dev iqn.2023-01.com.example:storage.target00
virsh pool-start cluster_storage

# Configuración de migración en caliente
virsh migrate --live vm01 qemu+ssh://hypervisor2.example.com/system --undefinesource --persistent

# Definición de un cluster HA con Pacemaker
pcs cluster setup --name web_cluster node1 node2 node3
pcs cluster start --all
pcs resource create virtual_ip ocf:heartbeat:IPaddr2 ip=192.168.1.200 cidr_netmask=24 op monitor interval=30s
''',
  });

  await db.insert('programming_content', {
    'language': 'Linux',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Preparación para Certificaciones Senior',
    'topic': 'LPIC-3',
    'subtopic': 'Casos de estudio',
    'definition': '''
Los casos de estudio en LPIC-3 no son ejemplos hipotéticos, sino escenarios reales que enfrentan las organizaciones al implementar soluciones Linux a gran escala. Estos integran múltiples tecnologías en configuraciones complejas.

Algunos candidatos cometen el error de estudiar tecnologías de forma aislada. La verdadera preparación viene de entender cómo interactúan estos componentes en sistemas reales.

Ejemplos notables incluyen:
1. Migración de un directorio corporativo de Windows AD a OpenLDAP con integración SAMBA
2. Diseño de una infraestructura bancaria cumpliendo PCI DSS usando SELinux y cifrado completo
3. Implementación de un cluster de alta disponibilidad para comercio electrónico durante Black Friday
4. Arquitectura multi-tenant segura para un proveedor cloud usando KVM y Ceph

Estos casos ayudan a desarrollar el pensamiento sistémico necesario para resolver problemas donde no hay una única respuesta correcta, sino soluciones balanceadas.
''',
    'code_example': r'''
# Ejemplo parcial de solución para caso de estudio:
# "Implementar HA para servicio web con 99.99% disponibilidad"

1. Infraestructura:
   - 3 nodos en diferentes racks
   - Almacenamiento: DRBD + iSCSI
   - Red: Bonding 2x10Gbps

2. Configuración cluster:
pcs resource create WebServer systemd:httpd --clone
pcs constraint location WebServer-clone prefers node1=50 node2=30 node3=20

3. Monitoreo:
   - Prometheus + Grafana
   - Alertas en Slack para:
     - Failover events
     - Latencia > 200ms
     - Error rate > 0.1%
''',
  });
}
