import 'package:sqflite_common/sqlite_api.dart';

Future<void> insertSrLevel1AwsData(Database db) async {
  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Arquitectura Empresarial',
    'topic': 'Migración a Cloud',
    'subtopic': 'AWS Migration Hub',
    'definition': r'''
El AWS Migration Hub es tu centro de control para todas las migraciones a la nube de AWS. Piensa en él como un dashboard centralizado donde puedes ver el progreso de tus migraciones, desde el descubrimiento de servidores hasta el seguimiento del estado de cada aplicación.

No sé tú, pero a mí esto al principio me costó un poco ubicarme, ¿por qué tener un hub solo para migraciones? Aquí te va la aclaración: Cuando estás moviendo un montón de servidores y aplicaciones, necesitas una forma de saber qué está pasando con cada una, y el Migration Hub te da esa visibilidad.

Este servicio te permite agrupar tus servidores en aplicaciones, lo que es super útil porque al final del día no estás migrando servidores individuales, sino las aplicaciones que residen en ellos. Puedes ver métricas clave, el estado de las herramientas de migración que estás usando (como AWS Application Migration Service o AWS Database Migration Service) y hasta el historial de migraciones. Es como tener una torre de control para tus proyectos de migración, asegurando que nada se quede en el aire y que puedas identificar rápidamente cualquier cuello de botella o problema. Permite una planificación más estratégica y una ejecución más fluida de tus proyectos de migración a la nube.
''',
    'code_example': r'''
// Ejemplo de cómo interactuar con AWS Migration Hub (conceptual, ya que es más una interfaz de gestión)

// No hay un "código" directo para el Migration Hub en sí mismo
// ya que es una consola de gestión y un servicio de orquestación.
// Sin embargo, aquí te muestro cómo podrías obtener el ARN de una aplicación
// migrada usando el AWS CLI, que es una forma programática de interactuar.

// Para ver el estado de las aplicaciones en Migration Hub usando AWS CLI
// Primero, asegúrate de tener configurado tu AWS CLI.
// Puedes listar las aplicaciones registradas en Migration Hub:
// aws migrationhub-config describe-application-state

// Ejemplo de una salida de la API (simplificada):
/*
{
    "ApplicationStateList": [
        {
            "ApplicationId": "arn:aws:migrationhub:us-east-1:123456789012:application/app-xxxxxxxxxxxxx",
            "ApplicationStatus": "NOT_STARTED",
            "LastUpdatedTime": 1678886400.0,
            "ApplicationName": "MiAplicacionWeb"
        }
    ]
}
*/

// Para actualizar el estado de una aplicación (ejemplo, si usas una herramienta externa)
// aws migrationhub-config update-application-status --application-id "arn:aws:migrationhub:us-east-1:123456789012:application/app-xxxxxxxxxxxxx" --status "COMPLETED"

// Esto es más para entender cómo se ve la información en el hub,
// el trabajo real se hace con otras herramientas de migración
// que se integran con Migration Hub.
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Arquitectura Empresarial',
    'topic': 'Migración a Cloud',
    'subtopic': 'AWS Application Discovery Service',
    'definition': r'''
El AWS Application Discovery Service es como el detective privado que te ayuda a conocer a fondo tu infraestructura on-premise antes de mudarla a la nube. Su misión es recopilar datos sobre tus servidores, procesos, rendimiento y dependencias de red, todo para que la planificación de la migración sea mucho más precisa y menos estresante.

Seguramente pensarás de qué va todo esto. Bueno, antes de mover tu casa, necesitas saber cuántas cajas tienes, qué hay dentro de ellas y dónde van. Con tus aplicaciones y servidores es lo mismo, no puedes simplemente copiarlos y pegarlos sin saber qué hace cada uno. Este servicio te da esa visibilidad profunda.

Este servicio utiliza agentes ligeros que instalas en tus servidores o un conector sin agente para VMware. Una vez recopila los datos, los envía al AWS Migration Hub, donde puedes visualizarlos y usarlos para planificar tu estrategia de migración. Imagina que tienes un grupo de aplicaciones que dependen unas de otras; Application Discovery Service te mostrará esas conexiones, ayudándote a evitar sorpresas desagradables una vez que comiences la migración. Te permite tomar decisiones informadas sobre qué aplicaciones migrar primero, qué herramientas usar y cómo optimizar los costos. Es un paso crucial para cualquier migración a gran escala, ya que te proporciona la inteligencia necesaria para una transición exitosa y minimiza el riesgo de interrupciones.
''',
    'code_example': r'''
// Ejemplo conceptual de uso del AWS Application Discovery Service (ADS)

// Como ADS es principalmente un servicio de recopilación de datos a través de agentes
// o conectores, no hay un "código" directo para su funcionamiento como tal.
// Sin embargo, puedes usar el AWS CLI para interactuar con los datos
// que ADS ha descubierto.

// Aquí te mostramos cómo podrías listar los servidores descubiertos
// y exportar la configuración para análisis:

// 1. Listar los servidores (agentes) descubiertos:
// aws discovery describe-agents

// Ejemplo de salida (simplificada):
/*
{
    "agentsInfo": [
        {
            "agentId": "EXAMPLE_AGENT_ID1",
            "hostName": "my-onprem-server-1",
            "agentVersion": "2.0.123",
            "health": "HEALTHY",
            "lastHealthPingTime": "2025-05-20T10:00:00Z"
        }
    ]
}
*/

// 2. Exportar la información de descubrimiento a un bucket S3:
// aws discovery start-export-task

// Después de ejecutar esto, se generará un archivo de exportación en tu bucket S3
// que contendrá detalles sobre los servidores, aplicaciones y sus dependencias.
// Este archivo suele estar en formato CSV o JSON y es lo que utilizas
// para la planificación detallada de la migración.

// La interacción con ADS es más a nivel de configuración y monitoreo
// a través de la consola de AWS o el CLI, para asegurar que los datos
// se están recolectando correctamente.
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Arquitectura Empresarial',
    'topic': 'Migración a Cloud',
    'subtopic': 'AWS Database Migration Service avanzado',
    'definition': r'''
El AWS Database Migration Service (DMS) es la herramienta de AWS para mover tus bases de datos, ya sean homogéneas (del mismo tipo, por ejemplo, Oracle a Oracle) o heterogéneas (de un tipo a otro, como Oracle a PostgreSQL). En un nivel avanzado, DMS no solo migra los datos iniciales, sino que también puede replicar cambios de forma continua, asegurando que tu base de datos de origen y destino permanezcan sincronizadas durante la migración.

Esto tiene una explicación, y es que cuando estás migrando una base de datos grande, no puedes simplemente apagarla por horas o días para hacer el traspaso. La continuidad del negocio es clave. Ahí es donde DMS brilla.

Avanzado, DMS ofrece capacidades como la validación de datos para asegurar la integridad de los datos migrados, la migración de esquemas complejos y la capacidad de realizar transformaciones de datos durante el proceso. Puedes usarlo para consolidar bases de datos, replicar datos para fines analíticos o de reporting, o incluso para configurar entornos de recuperación de desastres. Su flexibilidad permite adaptarse a casi cualquier escenario de migración de bases de datos, desde las más sencillas hasta las más exigentes, garantizando una mínima interrupción del servicio. También puedes aplicar reglas de filtrado o transformaciones sencillas a los datos en tránsito, lo que es útil si necesitas ajustar algo sobre la marcha sin modificar la fuente original. Esto es especialmente útil para empresas que manejan grandes volúmenes de datos y no pueden permitirse tiempos de inactividad significativos durante la transición.
''',
    'code_example': r'''
// Ejemplo conceptual de cómo configurar una tarea de replicación continua en AWS DMS

// Para una configuración avanzada de AWS DMS, el proceso implica:
// 1. Crear instancias de replicación.
// 2. Definir puntos de conexión (endpoints) para el origen y el destino.
// 3. Crear una tarea de migración que especifique qué tablas migrar y el tipo de migración.

// Aunque gran parte de la configuración se hace a través de la consola de AWS,
// puedes interactuar con DMS usando el AWS CLI o SDKs para automatizar.

// Ejemplo de comando CLI para crear una tarea de migración (simplificado):
// aws dms create-replication-task \
//    --replication-task-identifier "mi-tarea-dms-avanzada" \
//    --source-endpoint-arn "arn:aws:dms:us-east-1:123456789012:endpoint/fuente-arn" \
//    --target-endpoint-arn "arn:aws:dms:us-east-1:123456789012:endpoint/destino-arn" \
//    --replication-instance-arn "arn:aws:dms:us-east-1:123456789012:rep-instance/instancia-arn" \
//    --migration-type "cdc" \ // Change Data Capture para replicación continua
//    --table-mappings "file://table-mappings.json" \
//    --replication-task-settings "file://task-settings.json"

// Contenido de table-mappings.json (ejemplo):
/*
{
    "rules": [
        {
            "rule-type": "selection",
            "schema-name": "mi_esquema",
            "object-name": "%",
            "filter-conditions": [],
            "action": "include"
        },
        {
            "rule-type": "transformation",
            "schema-name": "mi_esquema",
            "object-name": "mi_tabla",
            "rule-action": "rename",
            "new-object-name": "nueva_tabla_en_destino"
        }
    ]
}
*/

// Contenido de task-settings.json (ejemplo para validación de datos):
/*
{
    "ValidationSettings": {
        "EnableValidation": true,
        "ValidationMode": "ROW_LEVEL" // O FULL_LOB_MODE
    },
    "Logging": {
        "EnableLogging": true,
        "CloudWatchLogGroup": "dms-logs",
        "CloudWatchLogStream": "mi-tarea-stream"
    }
}
*/

// Este ejemplo muestra la complejidad y el control que puedes tener
// al usar DMS de manera avanzada, definiendo reglas de transformación
// y validación de datos.
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Arquitectura Empresarial',
    'topic': 'Migración a Cloud',
    'subtopic': 'AWS Server Migration Service',
    'definition': r'''
El AWS Server Migration Service (SMS) es tu aliado para migrar máquinas virtuales on-premise (de VMware vSphere, Microsoft Hyper-V o Azure) a AWS de forma sencilla y automatizada. No se enfoca en la migración de datos de bases de datos, sino en mover servidores completos, incluyendo sus sistemas operativos, aplicaciones y configuraciones.

Pensemos por un momento en: ¿Por qué no simplemente crear una nueva instancia en AWS y copiar los archivos? Aquí te va la explicación: Reconstruir un servidor desde cero puede ser una pesadilla, especialmente si tiene muchas aplicaciones, dependencias y configuraciones complejas. SMS simplifica esto enormemente.

SMS automatiza la replicación incremental de tus máquinas virtuales. Esto significa que una vez que haces la configuración inicial, SMS toma una "foto" de tu VM y luego solo replica los cambios que ocurren en ella. Esto minimiza el tiempo de inactividad, ya que puedes seguir usando tu servidor on-premise mientras se replica a AWS. Una vez que la replicación está completa, puedes lanzar una instancia EC2 en AWS a partir de esa VM replicada, lista para usar. Es especialmente útil para migraciones a gran escala o para servidores legacy que no son fáciles de reconstruir. Facilita la creación de planes de migración, la automatización del seguimiento y la programación de las replicaciones, haciendo que todo el proceso sea mucho más manejable y eficiente.
''',
    'code_example': r'''
// Ejemplo conceptual de interacción con AWS Server Migration Service (SMS)

// Similar a Application Discovery Service, AWS SMS es un servicio que
// gestionas principalmente a través de la consola de AWS o el AWS CLI.
// Implica la configuración de un conector en tu entorno virtualizado
// (VMware, Hyper-V) que se comunica con AWS SMS.

// Aquí te mostramos comandos CLI para listar jobs de replicación
// y crear un job de replicación (conceptual, ya que el proceso
// de configuración del conector es previo).

// 1. Listar los servidores importados en SMS:
// aws sms get-servers

// Ejemplo de salida (simplificada):
/*
{
    "serverList": [
        {
            "serverId": "s-xxxxxxxxxxxxxxxxx",
            "serverType": "VIRTUAL_MACHINE",
            "vmServer": {
                "vmPath": "/vm/vmfs/volumes/datastore1/my-vm/my-vm.vmx",
                "vmManagerName": "vcenter.example.com",
                "vmName": "my-legacy-app-server",
                "vmManagerType": "VSPHERE"
            }
        }
    ]
}
*/

// 2. Crear un trabajo de replicación (Replication Job) para un servidor:
// aws sms create-replication-job \
//    --server-id "s-xxxxxxxxxxxxxxxxx" \
//    --frequency 24 \ // Replicación cada 24 horas
//    --run-once \ // Para una migración única, o dejar en blanco para continua
//    --license-type "AWS" \ // O "BYOL" (Bring Your Own License)
//    --role-arn "arn:aws:iam::123456789012:role/sms-role" \
//    --description "Migracion del servidor de aplicacion legacy"

// 3. Para ver el progreso de los trabajos de replicación:
// aws sms get-replication-jobs

// La configuración y el seguimiento de las migraciones se gestionan
// a través de estos comandos o la interfaz de la consola de AWS.
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Arquitectura Empresarial',
    'topic': 'Multi-account Strategy',
    'subtopic': 'AWS Control Tower',
    'definition': r'''
AWS Control Tower es una herramienta que te ayuda a establecer y gobernar un entorno seguro y bien arquitecturado en la nube, especialmente si manejas múltiples cuentas de AWS. Piensa en ella como tu centro de comando para lanzar una "landing zone" o zona de aterrizaje segura, que es un entorno preconfigurado y listo para que despliegues tus cargas de trabajo.

Seguramente pensarás de qué va todo esto. Bueno, cuando tu organización empieza a crecer y a usar más y más cuentas de AWS, la complejidad para mantener la seguridad, el cumplimiento y la gobernanza se dispara. Control Tower viene a solucionar ese dolor de cabeza.

Control Tower automatiza la configuración de una landing zone que sigue las mejores prácticas de AWS Well-Architected Framework[cite: 10]. Esto incluye la creación de cuentas de AWS Organizations, la implementación de políticas de seguridad (Service Control Policies - SCPs), y la configuración de servicios como AWS CloudTrail para auditoría y AWS Config para monitoreo de cumplimiento. Te proporciona una interfaz de usuario simplificada para crear nuevas cuentas de AWS de forma segura (lo que se conoce como "account vending"), aplicar "guardrails" (mecanismos preventivos o detectivos para asegurar el cumplimiento) y monitorear el estado de tu entorno. Es una solución ideal para empresas que necesitan una base sólida y escalable para su presencia en la nube, garantizando que todas las cuentas cumplan con los estándares de seguridad y operacionales desde el día uno.
''',
    'code_example': r'''
// Ejemplo conceptual de AWS Control Tower

// AWS Control Tower se gestiona principalmente a través de su consola
// o usando la API para automatizar tareas específicas, pero no hay
// un "código" directo para "usar" Control Tower en el sentido de una aplicación.
// Más bien, se trata de configurarlo para que provisione y gobierne tus cuentas.

// Sin embargo, aquí te mostramos cómo podrías interactuar con algunos
// de sus componentes o cómo se vería la salida de ciertas acciones.

// 1. Un ejemplo de un "guardrail" detectivo que podría aplicar Control Tower.
//    Este guardrail podría detectar si un bucket S3 se hace público.
//    (Esto sería una regla de AWS Config, que Control Tower configura):

// aws configservice describe-config-rules --config-rule-names s3-bucket-public-read-prohibited

// 2. Un ejemplo de cómo provisionar una nueva cuenta a través de Control Tower
//    (esto se hace a través de su interfaz de "account vending" o API):
// aws controltower provision-product --product-id "prod-xxxxxxxxxxxx" \
//    --provisioning-artifact-id "pa-xxxxxxxxxxxx" \
//    --path-id "path-xxxxxxxxxxxx" \
//    --provisioned-product-name "nueva-cuenta-dev" \
//    --provisioning-parameters \
//        Key=AccountName,Value=NuevaCuentaDesarrollo \
//        Key=AccountEmail,Value=dev@example.com

// 3. Un ejemplo de cómo ver el estado de tu landing zone:
// aws controltower get-landing-zone-status

// Estos comandos ilustran la naturaleza de Control Tower como una herramienta
// de orquestación y gobernanza de alto nivel, más que un servicio de desarrollo
// con el que interactúas directamente en tu código de aplicación.
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Arquitectura Empresarial',
    'topic': 'Multi-account Strategy',
    'subtopic': 'AWS Organizations avanzado',
    'definition': r'''
AWS Organizations es el servicio que te permite gestionar y consolidar múltiples cuentas de AWS dentro de una estructura jerárquica unificada. En un nivel avanzado, Organizations va mucho más allá de la simple agrupación de cuentas; te permite aplicar políticas de forma centralizada, gestionar el acceso y la facturación, y asegurar el cumplimiento en todo tu entorno de nube[cite: 16].

¿Te estás preguntando por qué esto importa? Imagina que eres una empresa con diferentes departamentos (desarrollo, producción, pruebas) y cada uno necesita su propia cuenta de AWS. Sin Organizations, sería un caos gestionar permisos, facturación y seguridad de forma consistente.

Con AWS Organizations avanzado, puedes crear Unidades Organizacionales (OUs) para agrupar tus cuentas por función, equipo o entorno. Esto te permite aplicar Service Control Policies (SCPs) a nivel de OU o incluso a la raíz de tu organización, lo que te da un control granular sobre qué acciones pueden realizar los usuarios y roles en tus cuentas. Por ejemplo, puedes usar un SCP para denegar a todas las cuentas de desarrollo la capacidad de lanzar instancias en regiones específicas, o para asegurar que nadie pueda deshabilitar AWS CloudTrail. Además, Organizations facilita la facturación consolidada, lo que significa que recibes una única factura para todas tus cuentas, simplificando la gestión de costos. También es fundamental para implementar estrategias de seguridad robustas, ya que permite la segregación de responsabilidades y la aplicación de políticas de seguridad de forma centralizada en todo tu panorama de AWS.
''',
    'code_example': r'''
// Ejemplo conceptual de AWS Organizations avanzado usando AWS CLI

// AWS Organizations se gestiona principalmente a través de la consola
// o el AWS CLI para automatizar la creación y gestión de OUs y SCPs.

// 1. Listar las Unidades Organizacionales (OUs) en tu organización:
// aws organizations list-organizational-units-for-parent --parent-id r-xxxxxxxx

// Ejemplo de salida (simplificada):
/*
{
    "OrganizationalUnits": [
        {
            "Id": "ou-xxxx-xxxxxxxx",
            "Arn": "arn:aws:organizations::123456789012:ou/o-xxxxxxxx/ou-xxxx-xxxxxxxx",
            "Name": "Desarrollo"
        },
        {
            "Id": "ou-xxxx-yyyyyyyy",
            "Arn": "arn:aws:organizations::123456789012:ou/o-xxxxxxxx/ou-xxxx-yyyyyyyy",
            "Name": "Produccion"
        }
    ]
}
*/

// 2. Adjuntar una Service Control Policy (SCP) a una OU:
// aws organizations attach-policy \
//    --policy-id p-xxxxxxxxxx \
//    --target-id ou-xxxx-xxxxxxxx

// 3. Crear una nueva cuenta bajo una OU específica (parte de "account vending"):
// aws organizations create-account \
//    --email "nueva.cuenta@example.com" \
//    --account-name "MiNuevaCuentaProyecto" \
//    --role-name "OrganizationAccountAccessRole" \
//    --parent-id "ou-xxxx-xxxxxxxx"

// Estos comandos ilustran cómo puedes automatizar la estructura
// y gobernanza de tus cuentas de AWS utilizando AWS Organizations.
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Arquitectura Empresarial',
    'topic': 'Multi-account Strategy',
    'subtopic': 'Service Control Policies',
    'definition': r'''
Las Service Control Policies (SCPs) son un tipo de política de AWS Organizations que te permite definir los permisos máximos que pueden tener los usuarios y roles dentro de una o más cuentas de AWS[cite: 16]. Es como si fueran las "reglas de la casa" a nivel de la organización, que limitan lo que se puede hacer, incluso antes de que las políticas IAM individuales entren en juego.

No sé tú, pero a mí esto al principio me costó un poco diferenciarlo de IAM. Aquí te va la aclaración: A diferencia de las políticas IAM que *otorgan* permisos, las SCPs *restringen* los permisos. Si un SCP deniega una acción, ningún usuario o rol en las cuentas afectadas podrá realizar esa acción, incluso si sus políticas IAM individuales intentan permitírselo.

Los SCPs son increíblemente potentes para aplicar gobernanza y seguridad a nivel de la organización. Puedes usarlas para asegurar el cumplimiento regulatorio, por ejemplo, denegando el uso de servicios específicos en regiones no permitidas, o para evitar que se deshabiliten los servicios de auditoría como CloudTrail. Por ejemplo, podrías tener un SCP que impida que cualquier cuenta dentro de la OU de "desarrollo" lance instancias EC2 de un tipo muy costoso, o que prohíba la eliminación de buckets S3 con ciertos tags. Son preventivas por naturaleza, lo que significa que detienen las acciones antes de que ocurran, en lugar de solo detectarlas después. Esto es crucial para mantener la seguridad y el control en entornos de múltiples cuentas, asegurando que todos los equipos operen dentro de los límites definidos por la organización.
''',
    'code_example': r'''
// Ejemplo de una Service Control Policy (SCP) en AWS Organizations

// Un SCP es un documento JSON, similar a una política IAM,
// pero su efecto es de restricción global en las cuentas adjuntas.

// SCP de ejemplo para denegar la eliminación de buckets S3 en todas las cuentas
// dentro de una OU, a menos que el bucket tenga un tag específico.
// Esto es un ejemplo de cómo se vería el JSON de la política.

/*
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "DenyDeleteS3BucketsUnlessTagged",
            "Effect": "Deny",
            "Action": [
                "s3:DeleteBucket"
            ],
            "Resource": "*",
            "Condition": {
                "Null": {
                    "aws:RequestTag/Protected": "true"
                }
            }
        },
        {
            "Sid": "AllowAllOtherActions",
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
}
*/

// Otro ejemplo: SCP para denegar el uso de EC2 en todas las regiones excepto us-east-1 y eu-west-1.
/*
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "RestrictEC2Regions",
            "Effect": "Deny",
            "Action": "ec2:*",
            "Resource": "*",
            "Condition": {
                "StringNotEquals": {
                    "aws:RequestedRegion": [
                        "us-east-1",
                        "eu-west-1"
                    ]
                }
            }
        }
    ]
}
*/

// Para adjuntar una SCP (esto se hace a través de AWS CLI o consola):
// aws organizations attach-policy --policy-id p-xxxxxxxxxx --target-id ou-xxxx-xxxxxxxx
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Arquitectura Empresarial',
    'topic': 'Multi-account Strategy',
    'subtopic': 'Account vending',
    'definition': r'''
El "account vending" o provisión de cuentas, es el proceso automatizado y estandarizado de crear nuevas cuentas de AWS dentro de tu organización. En lugar de crear cuentas manualmente una por una, lo que puede llevar a errores y configuraciones inconsistentes, el account vending te permite desplegar nuevas cuentas que ya vienen configuradas con las mejores prácticas de seguridad, gobernanza y cumplimiento.

¿Te estás preguntando por qué esto importa? Imagina que tu empresa necesita lanzar decenas o incluso cientos de nuevas cuentas para diferentes proyectos o equipos. Hacerlo manualmente sería una pesadilla. Esto se convierte en una necesidad a medida que una empresa escala su uso de la nube.

Este proceso generalmente se implementa a través de servicios como AWS Control Tower, que proporciona una interfaz de usuario para solicitar nuevas cuentas, o utilizando AWS Service Catalog o AWS CloudFormation para automatizar la creación y configuración. Una cuenta "vendida" puede incluir ya la integración con AWS Organizations, Service Control Policies (SCPs) aplicadas, la configuración de AWS CloudTrail para auditoría, la activación de AWS Config para el monitoreo de cumplimiento, y la configuración de una red básica como una VPC. La clave es la automatización y la estandarización. Esto no solo acelera el proceso de provisión de cuentas, sino que también asegura que cada nueva cuenta cumpla con los estándares de seguridad y gobernanza de la empresa desde el momento de su creación, reduciendo el riesgo y la complejidad operativa. Es una práctica esencial para una estrategia de múltiples cuentas madura y escalable.
''',
    'code_example': r'''
// Ejemplo conceptual de Account Vending usando AWS Service Catalog

// AWS Service Catalog es una forma común de implementar el "account vending"
// permitiendo a los usuarios lanzar productos (como una "nueva cuenta")
// que han sido pre-aprobados por la organización.

// 1. Un administrador de AWS Service Catalog define un "producto" (ej. "Nueva Cuenta AWS")
//    que es una plantilla de CloudFormation para una cuenta de AWS.

// 2. Un usuario (desarrollador, equipo) navega al Service Catalog y "lanza" ese producto.
//    El proceso detrás de escena podría ser algo así:

// Ejemplo de una plantilla CloudFormation (simplificada) para crear una cuenta
// (Esto se usaría como parte del producto en Service Catalog):
/*
{
    "AWSTemplateFormatVersion": "2010-09-09",
    "Description": "Plantilla para crear una nueva cuenta de AWS en AWS Organizations",
    "Resources": {
        "NewAWSAccount": {
            "Type": "AWS::Organizations::Account",
            "Properties": {
                "AccountName": { "Fn::GetAtt": ["ProvisionedProduct", "AccountName"] },
                "Email": { "Fn::GetAtt": ["ProvisionedProduct", "AccountEmail"] },
                "RoleName": "OrganizationAccountAccessRole",
                "ParentIds": [ { "Fn::GetAtt": ["ProvisionedProduct", "ParentId"] } ]
            }
        }
    }
}
*/

// 3. El usuario podría lanzar el producto a través de la CLI (o la consola de Service Catalog):
// aws servicecatalog provision-product \
//    --product-id "prod-xxxxxxxxxxxx" \
//    --provisioning-artifact-id "pa-xxxxxxxxxxxx" \
//    --provisioned-product-name "mi-proyecto-cuenta" \
//    --provisioning-parameters \
//        Key=AccountName,Value=MiProyectoCuenta \
//        Key=AccountEmail,Value=mi.proyecto@example.com \
//        Key=ParentId,Value=ou-xxxx-xxxxxxxx // OU donde se creará la cuenta

// El resultado es una nueva cuenta de AWS creada de forma automatizada y
// conforme a las políticas predefinidas por la organización.
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Arquitectura Empresarial',
    'topic': 'Networking Avanzado',
    'subtopic': 'AWS Transit Gateway',
    'definition': r'''
AWS Transit Gateway es un concentrador de red que simplifica enormemente la conectividad entre tus redes virtuales privadas (VPCs) en AWS y tus redes on-premise, incluso a través de diferentes cuentas de AWS. En lugar de establecer conexiones punto a punto entre cada VPC o con tu centro de datos, Transit Gateway actúa como un "router" centralizado, permitiendo que todas tus redes se conecten a él y se comuniquen entre sí.

Seguramente pensarás de qué va todo esto. Bueno, antes de Transit Gateway, si tenías 10 VPCs y querías que todas se comunicaran entre sí, necesitabas 45 conexiones de VPC Peering. ¡Una locura! Además, si querías conectarte a tu centro de datos, necesitabas una conexión Direct Connect o VPN para cada VPC. Esto se volvía inmanejable muy rápido.

Transit Gateway elimina esta complejidad. Conecta tus VPCs, tus VPNs de sitio a sitio, y tus conexiones de AWS Direct Connect al Transit Gateway, y luego configuras las tablas de ruteo para controlar el flujo de tráfico. Esto no solo simplifica tu arquitectura de red, sino que también mejora la escalabilidad y la gestión. Puedes segmentar el tráfico, aplicar políticas de red y tener una visibilidad centralizada. Es ideal para organizaciones grandes con muchas VPCs y una presencia híbrida en la nube, ya que reduce la sobrecarga operativa y te permite expandir tu huella en la nube sin que la red se convierta en un cuello de botella. Además, facilita la implementación de arquitecturas de red hub-and-spoke eficientes y robustas.
''',
    'code_example': r'''
// Ejemplo conceptual de cómo interactuar con AWS Transit Gateway usando AWS CLI

// AWS Transit Gateway se configura a través de la consola o el AWS CLI.
// Los pasos básicos son crear el Transit Gateway, adjuntar tus VPCs
// y/o VPNs/Direct Connect, y configurar las tablas de ruteo.

// 1. Crear un AWS Transit Gateway:
// aws ec2 create-transit-gateway \
//    --description "Mi-Transit-Gateway-Central" \
//    --options '{"AmazonSideAsn":64512,"AutoAcceptSharedAttachments": "enable", "DefaultRouteTableAssociation": "enable", "DefaultRouteTablePropagation": "enable", "VpnEcmpSupport": "enable", "DnsSupport": "enable"}'

// Ejemplo de salida (simplificada):
/*
{
    "TransitGateway": {
        "TransitGatewayId": "tgw-0abcdef1234567890",
        "State": "pending",
        "Description": "Mi-Transit-Gateway-Central"
        // ... otros detalles
    }
}
*/

// 2. Adjuntar una VPC al Transit Gateway:
// aws ec2 create-transit-gateway-vpc-attachment \
//    --transit-gateway-id "tgw-0abcdef1234567890" \
//    --vpc-id "vpc-0abcdef1234567890" \
//    --subnet-ids "subnet-0abcdef1234567890" "subnet-0fedcba9876543210"

// 3. Crear una ruta en la tabla de ruteo del Transit Gateway (opcional, si no usas propagación automática):
// aws ec2 create-transit-gateway-route \
//    --destination-cidr-block "10.0.0.0/16" \
//    --transit-gateway-route-table-id "tgw-rtb-0abcdef1234567890" \
//    --transit-gateway-attachment-id "tgw-attach-0abcdef1234567890"

// Estos comandos ilustran la facilidad con la que puedes empezar a construir
// una red centralizada y escalable en AWS utilizando Transit Gateway.
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Arquitectura Empresarial',
    'topic': 'Networking Avanzado',
    'subtopic': 'VPC endpoints',
    'definition': r'''
Los VPC endpoints (puntos de enlace de VPC) te permiten conectar tu Virtual Private Cloud (VPC) de forma privada a servicios de AWS (como S3, DynamoDB, SQS, etc.) y a servicios de punto de enlace de VPC alojados por otros clientes de AWS (servicios de PrivateLink) sin necesidad de una puerta de enlace a Internet, un dispositivo NAT, una conexión VPN o AWS Direct Connect. Esto significa que el tráfico entre tu VPC y estos servicios permanece dentro de la red de AWS.

Esto tiene una explicación, y es que sin VPC endpoints, para acceder a servicios públicos de AWS (como S3) desde una instancia en una subred privada, el tráfico tendría que ir a través de una NAT Gateway o una Internet Gateway. Esto puede introducir latencia, costos y un posible punto de exposición a Internet.

Los VPC endpoints se dividen en dos tipos: de interfaz y de puerta de enlace. Los **endpoints de puerta de enlace** (Gateway Endpoints) son para S3 y DynamoDB, y actúan como una puerta de enlace de ruta que se añade a tu tabla de ruteo de VPC. Los **endpoints de interfaz** (Interface Endpoints) son más recientes y soportan una gama mucho más amplia de servicios de AWS, y se implementan con Elastic Network Interfaces (ENIs) con direcciones IP privadas en tus subredes. Esto garantiza que el tráfico a los servicios de AWS no abandone la red de Amazon, lo que mejora la seguridad, reduce la latencia y evita costos de transferencia de datos de salida asociados con el tráfico a través de una Internet Gateway. Son esenciales para arquitecturas que requieren la máxima seguridad y aislamiento de red, así como para cumplir con estrictas regulaciones de cumplimiento.
''',
    'code_example': r'''
// Ejemplo conceptual de cómo crear un VPC Endpoint de interfaz para SQS usando AWS CLI

// 1. Crear un VPC Endpoint de interfaz para Amazon SQS:
// aws ec2 create-vpc-endpoint \
//    --vpc-id "vpc-0abcdef1234567890" \
//    --vpc-endpoint-type "Interface" \
//    --service-name "com.amazonaws.us-east-1.sqs" \
//    --subnet-ids "subnet-0abcdef1234567890" \
//    --security-group-ids "sg-0abcdef1234567890" \
//    --private-dns-enabled

// Ejemplo de salida (simplificada):
/*
{
    "VpcEndpoint": {
        "VpcEndpointId": "vpce-0abcdef1234567890",
        "VpcEndpointType": "Interface",
        "ServiceName": "com.amazonaws.us-east-1.sqs",
        "State": "pending",
        // ... otros detalles
    }
}
*/

// 2. Un ejemplo de política de punto de enlace para controlar el acceso
//    (esto se adjunta al endpoint en la consola o vía CLI):
/*
{
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": [
        "sqs:SendMessage",
        "sqs:ReceiveMessage"
      ],
      "Resource": "arn:aws:sqs:us-east-1:123456789012:MyQueue"
    }
  ]
}
*/

// Ejemplo de cómo crear un VPC Endpoint de puerta de enlace para S3:
// aws ec2 create-vpc-endpoint \
//    --vpc-id "vpc-0abcdef1234567890" \
//    --vpc-endpoint-type "Gateway" \
//    --service-name "com.amazonaws.us-east-1.s3" \
//    --route-table-ids "rtb-0abcdef1234567890"

// Estos comandos demuestran cómo asegurar que el tráfico a servicios de AWS
// permanezca dentro de tu red privada, mejorando la seguridad y el rendimiento.
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Arquitectura Empresarial',
    'topic': 'Networking Avanzado',
    'subtopic': 'PrivateLink',
    'definition': r'''
AWS PrivateLink es una tecnología que te permite acceder de forma privada a servicios alojados en AWS (ya sean servicios de AWS como S3, servicios de terceros o tus propios servicios) desde tu VPC, sin exponer el tráfico a Internet. La magia aquí es que PrivateLink establece un "enlace" privado entre tu VPC y el servicio, utilizando solo direcciones IP privadas.

¿Te estás preguntando por qué esto importa? Antes de PrivateLink, si querías consumir un servicio SaaS o un servicio de un tercero en AWS desde tu VPC privada, a menudo necesitabas enrutar el tráfico a través de una Internet Gateway, lo que comprometía la seguridad y la latencia.

PrivateLink resuelve esto creando un punto de enlace de interfaz (un tipo de VPC endpoint) en tu VPC, que luego se conecta al servicio de destino. Esto significa que el tráfico entre tu VPC y el servicio nunca sale de la red de Amazon, lo que proporciona una seguridad de red significativamente mejorada y una latencia más baja. Es ideal para escenarios en los que necesitas consumir servicios de forma segura, como bases de datos gestionadas por terceros, APIs de socios o tus propios microservicios alojados en otras VPCs (incluso en diferentes cuentas). Para los proveedores de SaaS, PrivateLink les permite ofrecer sus servicios a los clientes de AWS sin que estos tengan que exponer sus VPCs a Internet, lo que es un gran atractivo para la seguridad y el cumplimiento. Es una pieza clave para construir arquitecturas de nube híbridas y multi-cuenta altamente seguras y eficientes.
''',
    'code_example': r'''
// Ejemplo conceptual de cómo usar AWS PrivateLink

// AWS PrivateLink implica dos partes: un "proveedor de servicio" (quien expone el servicio)
// y un "consumidor de servicio" (quien accede al servicio).

// Para el PROVEEDOR del servicio (ej. una empresa SaaS que ofrece un servicio a través de PrivateLink):
// 1. Crear un Network Load Balancer (NLB) que balancee el tráfico a sus servicios.
// 2. Crear un servicio de punto de enlace de VPC (VPC Endpoint Service) que apunte al NLB.
// aws ec2 create-vpc-endpoint-service-configuration \
//    --network-load-balancer-arns "arn:aws:elasticloadbalancing:us-east-1:123456789012:loadbalancer/net/my-nlb/abcdef1234567890" \
//    --acceptance-required \
//    --tag-specifications 'ResourceType=vpc-endpoint-service,Tags=[{Key=Name,Value=MiServicioPrivateLink}]'

// Para el CONSUMIDOR del servicio (quien quiere acceder al servicio del proveedor):
// 1. Crear un VPC Endpoint de interfaz en su propia VPC, especificando el nombre del servicio
//    del punto de enlace que el proveedor ha compartido (ej. com.amazonaws.vpce.us-east-1.vpce-svc-xxxxxxxxxxxxxxxxx).
// aws ec2 create-vpc-endpoint \
//    --vpc-id "vpc-0fedcba9876543210" \
//    --vpc-endpoint-type "Interface" \
//    --service-name "com.amazonaws.vpce.us-east-1.vpce-svc-xxxxxxxxxxxxxxxxx" \
//    --subnet-ids "subnet-0fedcba9876543210" \
//    --security-group-ids "sg-0fedcba9876543210" \
//    --private-dns-enabled

// Después de que el consumidor crea el endpoint, el proveedor debe "aceptar"
// la conexión del endpoint (si `acceptance-required` es true).
// aws ec2 accept-vpc-endpoint-connections \
//    --service-id "vpce-svc-xxxxxxxxxxxxxxxxx" \
//    --vpc-endpoint-id "vpce-0fedcba9876543210"

// Esto establece una conexión de red privada, permitiendo que las aplicaciones
// del consumidor se conecten al servicio del proveedor usando IPs privadas
// en la VPC del consumidor, sin tráfico público.
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Arquitectura Empresarial',
    'topic': 'Networking Avanzado',
    'subtopic': 'AWS Direct Connect avanzado',
    'definition': r'''
AWS Direct Connect es un servicio que te permite establecer una conexión de red dedicada y privada desde tu centro de datos, oficina o entorno de colocation directamente a AWS. A diferencia de las conexiones VPN que utilizan la Internet pública, Direct Connect proporciona una conexión de red consistente y de alto ancho de banda, con una latencia reducida y mayor seguridad.

Pensemos por un momento en: ¿Por qué no simplemente usar VPNs? Aquí te va la aclaración: Si bien las VPNs son excelentes para la conectividad segura a través de Internet, su rendimiento puede variar y están sujetas a la congestión de la red pública. Para cargas de trabajo críticas que requieren un rendimiento predecible y un gran volumen de datos, una VPN simplemente no es suficiente.

En un nivel avanzado, AWS Direct Connect ofrece características como el uso de múltiples conexiones para redundancia y alta disponibilidad (lo que se conoce como "resilience" o "tolerancia a fallos"), la configuración de rutas BGP (Border Gateway Protocol) para un ruteo dinámico, y la capacidad de crear múltiples interfaces virtuales (VIFs) sobre una única conexión física. Estas VIFs pueden ser privadas (para tu VPC), públicas (para servicios públicos de AWS como S3 o DynamoDB) o de tránsito (para conectarse a un AWS Transit Gateway). Esto te permite segmentar tu tráfico y optimizar el ruteo. Para las empresas que buscan construir una verdadera arquitectura de nube híbrida, Direct Connect es una pieza fundamental. Permite migrar grandes volúmenes de datos de forma más eficiente, ejecutar aplicaciones híbridas con baja latencia y garantizar un acceso fiable a tus recursos en la nube, cumpliendo con los requisitos de rendimiento y seguridad más exigentes.
''',
    'code_example': r'''
// Ejemplo conceptual de configuración de AWS Direct Connect (avanzado)

// AWS Direct Connect requiere una configuración física con un socio de AWS Direct Connect
// o en una ubicación de Direct Connect. La configuración de red y la creación
// de interfaces virtuales (VIFs) se gestionan a través de la consola o CLI.

// 1. Crear una interfaz virtual privada (Private VIF) para una VPC:
// aws directconnect create-private-virtual-interface \
//    --connection-id "dxcon-abcdef123456789" \
//    --new-private-virtual-interface '{"VirtualInterfaceName": "MiVPC-VIF", "Vlan": 100, "AmazonAddress": "169.254.10.1/30", "CustomerAddress": "169.254.10.2/30", "Asn": 65000, "AuthKey": "mysecretkey", "VirtualGatewayId": "vgw-0abcdef1234567890"}'

// 2. Crear una interfaz virtual de tránsito (Transit VIF) para un Transit Gateway:
// aws directconnect create-transit-virtual-interface \
//    --connection-id "dxcon-abcdef123456789" \
//    --new-transit-virtual-interface '{"VirtualInterfaceName": "TransitGateway-VIF", "Vlan": 200, "AmazonAddress": "169.254.20.1/30", "CustomerAddress": "169.254.20.2/30", "Asn": 65001, "AuthKey": "anothersecretkey", "DirectConnectGatewayId": "dxgateway-0abcdef1234567890"}'

// 3. Asociar un Direct Connect Gateway a un Transit Gateway:
// aws ec2 create-transit-gateway-dx-gateway-association \
//    --transit-gateway-id "tgw-0abcdef1234567890" \
//    --dx-gateway-id "dxgateway-0abcdef1234567890"

// Estos comandos ilustran la flexibilidad de Direct Connect para conectar
// diferentes recursos de AWS a tu red on-premise con conexiones dedicadas
// y de alto rendimiento.
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Arquitectura Empresarial',
    'topic': 'Cost Optimization',
    'subtopic': 'AWS Cost and Usage Report',
    'definition': r'''
El AWS Cost and Usage Report (CUR) es una herramienta de informes muy detallada que te proporciona la información más completa sobre tus costos y uso de AWS. Piensa en él como una hoja de cálculo gigante (o un conjunto de archivos CSV) que contiene cada línea de gasto de tu cuenta de AWS, por cada servicio, cada recurso y cada hora. Es el informe más granular que puedes obtener.

No sé tú, pero a mí esto al principio me costó un poco entender su poder. Aquí te va la aclaración: A diferencia de los informes de costos básicos que ves en la consola de facturación, el CUR te da un nivel de detalle que te permite analizar hasta el último centavo de tus gastos.

El CUR se almacena en un bucket de Amazon S3 de tu elección y puede actualizarse varias veces al día. Contiene cientos de columnas de datos, incluyendo información sobre el uso, los costos estimados, los metadatos de los recursos, los detalles de precios, las etiquetas personalizadas y mucho más. Este nivel de detalle es crucial para la optimización de costos avanzada, ya que te permite identificar patrones de gasto, atribuciones de costos por equipo o proyecto usando etiquetas, y realizar análisis de costos profundos. Puedes integrar el CUR con otras herramientas de AWS como Amazon Athena y Amazon QuickSight para consultar y visualizar los datos, o con herramientas de terceros. Esto te permite tomar decisiones informadas sobre dónde y cómo puedes ahorrar dinero, identificar recursos infrautilizados o identificar anomalías en el gasto. Es la base para cualquier estrategia de optimización de costos seria en AWS.
''',
    'code_example': r'''
// Ejemplo conceptual de cómo trabajar con el AWS Cost and Usage Report (CUR)

// El CUR se configura en la consola de AWS Billing. Una vez configurado,
// AWS empieza a entregar archivos CSV al bucket S3 que especifiques.

// No hay un "código" directo para generar el CUR, ya que es un servicio de AWS.
// Sin embargo, el ejemplo de código se centrará en cómo puedes consultar y analizar
// los datos del CUR una vez que estén en S3, típicamente usando Amazon Athena
// para consultar los datos y Amazon QuickSight para visualizarlos.

// Pasos para configurar el CUR (conceptual):
// 1. Ir a la consola de AWS Billing.
// 2. Navegar a "Cost & Usage Reports".
// 3. Crear un nuevo reporte, especificando el bucket S3 y las preferencias de entrega.

// Ejemplo de una consulta SQL en Amazon Athena para analizar los datos del CUR:
// Suponiendo que has creado una tabla en Athena sobre tu CUR (ej. `my_cur_data`):

/*
SELECT
    line_item_product_code,
    line_item_resource_id,
    sum(line_item_unblended_cost) AS total_cost
FROM
    my_cur_data
WHERE
    line_item_usage_start_date BETWEEN '2024-01-01' AND '2024-01-31'
    AND line_item_usage_type LIKE '%EC2%'
GROUP BY
    line_item_product_code,
    line_item_resource_id
ORDER BY
    total_cost DESC
LIMIT 10;
*/

// Este es un ejemplo de cómo podrías encontrar los 10 recursos EC2 más costosos
// en un mes específico usando SQL sobre los datos del CUR.

// Otro ejemplo: Costo por etiqueta (si tus recursos están etiquetados)
/*
SELECT
    resource_tags_user_project, -- Asumiendo que tienes una etiqueta 'project'
    sum(line_item_unblended_cost) AS total_cost
FROM
    my_cur_data
WHERE
    line_item_usage_start_date BETWEEN '2024-01-01' AND '2024-01-31'
GROUP BY
    resource_tags_user_project
ORDER BY
    total_cost DESC;
*/

// La clave es el análisis de los datos del CUR para identificar oportunidades de optimización.
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Arquitectura Empresarial',
    'topic': 'Cost Optimization',
    'subtopic': 'Reserved Instances vs Savings Plans',
    'definition': r'''
Cuando hablamos de optimización de costos en AWS para cargas de trabajo estables, la conversación inevitablemente llega a las Reserved Instances (RIs) y los Savings Plans. Ambos te permiten obtener descuentos significativos a cambio de un compromiso de uso, pero tienen diferencias clave que los hacen adecuados para diferentes escenarios.

No sé tú, pero a mí esto al principio me costó un poco diferenciarlo. Aquí te va la aclaración: las RIs son más "rígidas" en su compromiso, mientras que los Savings Plans son más "flexibles" y cubren una gama más amplia de servicios.

Las **Reserved Instances (RIs)** te permiten comprometerte con un tipo de instancia EC2 específico (ej. `m5.large`) en una región o zona de disponibilidad, por un período de 1 o 3 años, a cambio de un descuento considerable (hasta un 75% comparado con el precio bajo demanda). Hay RIs estándar y convertibles; las convertibles ofrecen más flexibilidad para cambiar el tipo de instancia o la familia. Las **Savings Plans** son una alternativa más moderna y flexible. Te comprometes a gastar una cantidad específica por hora (ej. $10/hora) durante 1 o 3 años, y a cambio, obtienes descuentos en el uso de EC2, Fargate y Lambda. Los Savings Plans son más flexibles que las RIs porque no se vinculan a un tipo de instancia específico o una región; cubren tu gasto por hora, sin importar qué tipos de instancias o servicios de computación compatibles uses. Para la mayoría de los casos, los Savings Plans son la opción preferida por su flexibilidad y la cobertura más amplia de servicios. Sin embargo, si tienes una carga de trabajo muy estable con un tipo de instancia EC2 constante, una RI bien planificada aún puede ofrecer el mayor descuento.
''',
    'code_example': r'''
// Ejemplo conceptual de cómo se ven las recomendaciones para RIs y Savings Plans

// No hay un "código" directo para "crear" RIs o Savings Plans desde el código de tu aplicación,
// ya que son contratos de facturación que se gestionan a nivel de cuenta/organización
// a través de la consola de AWS Cost Explorer o la API de Billing Conductor.

// Sin embargo, AWS proporciona recomendaciones sobre RIs y Savings Plans
// que puedes obtener programáticamente.

// 1. Obtener recomendaciones de Reserved Instances (ej. EC2):
// aws ce get-reservation-purchase-recommendation \
//    --account-id "123456789012" \
//    --service "Amazon EC2"

// Ejemplo de una parte de la salida (simplificada):
/*
{
    "Recommendations": [
        {
            "EstimatedSavings": "123.45",
            "CurrencyCode": "USD",
            "LookbackPeriodInDays": "30",
            "TermInYears": "ONE_YEAR",
            "PaymentOption": "NO_UPFRONT",
            "RecommendationDetails": [
                {
                    "Region": "us-east-1",
                    "InstanceFamily": "m5",
                    "RecommendedNumberOfInstances": 5,
                    "EstimatedMonthlySavings": "10.23",
                    // ... otros detalles
                }
            ]
        }
    ]
}
*/

// 2. Obtener recomendaciones de Savings Plans:
// aws ce get-savings-plan-purchase-recommendation \
//    --account-id "123456789012" \
//    --savings-plans-type "EC2_INSTANCE_FAMILY"

// Ejemplo de una parte de la salida (simplificada):
/*
{
    "SavingsPlansPurchaseRecommendation": [
        {
            "SavingsPlansDetails": [
                {
                    "Region": "us-east-1",
                    "SavingsPlansType": "EC2_INSTANCE_FAMILY",
                    "HourlyCommitment": "10.00",
                    "EstimatedOnDemandCost": "1000.00",
                    "EstimatedSavings": "300.00",
                    // ...
                }
            ]
        }
    ]
}
*/

// Estos comandos te ayudarán a tomar decisiones informadas sobre qué tipo de compromiso
// es el mejor para tus patrones de uso y cómo optimizar tus costos.
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Arquitectura Empresarial',
    'topic': 'Cost Optimization',
    'subtopic': 'Spot Instances estrategias',
    'definition': r'''
Las Spot Instances de AWS son una forma de aprovechar la capacidad de computación EC2 no utilizada en la nube, a un precio significativamente más bajo (hasta un 90% de descuento) que las instancias bajo demanda. La "trampa" es que AWS puede recuperar estas instancias con poca antelación si necesita la capacidad, lo que las hace ideales para cargas de trabajo flexibles y tolerantes a fallos.

Esto tiene una explicación, y es que si tienes tareas que pueden pausarse y reanudarse, o que no son críticas en el tiempo, las Spot Instances son una mina de oro para la optimización de costos. No las uses para tu base de datos de producción o tu servidor web principal, a menos que tengas una estrategia de alta disponibilidad muy robusta.

Para usar Spot Instances de forma efectiva, necesitas implementar ciertas estrategias. Una clave es la **tolerancia a interrupciones**: tus aplicaciones deben estar diseñadas para manejar la interrupción y terminación de una instancia Spot. Esto a menudo implica guardar el estado de forma externa (ej. en S3 o DynamoDB) y ser capaz de reanudar el trabajo en una nueva instancia. Otra estrategia es el **uso de grupos de instancias Spot** que solicitan diferentes tipos de instancias en múltiples zonas de disponibilidad, aumentando la probabilidad de obtener capacidad. Puedes usar **Spot Fleet** o **EC2 Auto Scaling con Spot Instances** para automatizar la gestión y el escalado de tus cargas de trabajo Spot. También es crucial monitorear los **precios de Spot** y las **recomendaciones de interrupción** que AWS proporciona para evitar sorpresas. Son perfectas para tareas como procesamiento de big data, pruebas de CI/CD, rendering de video, simulaciones científicas, y otras cargas de trabajo que pueden ser tolerantes a interrupciones y que buscan maximizar el ahorro.
''',
    'code_example': r'''
// Ejemplo conceptual de cómo lanzar una Spot Instance con el AWS CLI

// Las Spot Instances se solicitan a través de solicitudes de Spot (Spot Instance Requests)
// o configurando grupos de Auto Scaling para usar Spot Instances.

// 1. Solicitar una Spot Instance simple:
// aws ec2 request-spot-instances \
//    --instance-count 1 \
//    --type "one-time" \
//    --launch-specification '{"ImageId": "ami-0abcdef1234567890", "InstanceType": "c5.large", "KeyName": "my-key-pair", "SecurityGroupIds": ["sg-0abcdef1234567890"], "Placement":{"AvailabilityZone":"us-east-1a"}}' \
//    --spot-price "0.03" // Precio máximo que estás dispuesto a pagar por hora

// Ejemplo de la salida (simplificada):
/*
{
    "SpotInstanceRequests": [
        {
            "SpotInstanceRequestId": "sir-abcdef1234567890",
            "State": "open",
            "LaunchSpecification": {
                // ...
            },
            "SpotPrice": "0.030000",
            "Type": "one-time"
        }
    ]
}
*/

// 2. Para cargas de trabajo más avanzadas, usar Spot Fleet para solicitar múltiples tipos de instancias:
// aws ec2 request-spot-fleet --spot-fleet-request-config file://spot-fleet-config.json

// Contenido de spot-fleet-config.json (ejemplo):
/*
{
  "SpotPrice": "0.05",
  "TargetCapacity": 10,
  "IamFleetRole": "arn:aws:iam::123456789012:role/aws-ec2-spot-fleet-role",
  "LaunchSpecifications": [
    {
      "ImageId": "ami-0abcdef1234567890",
      "InstanceType": "c5.large",
      "SubnetId": "subnet-0abcdef1234567890",
      "WeightedCapacity": 1 // 1 unidad de capacidad
    },
    {
      "ImageId": "ami-0abcdef1234567890",
      "InstanceType": "c5a.large", // Diferente tipo de instancia
      "SubnetId": "subnet-0abcdef1234567890",
      "WeightedCapacity": 1
    }
  ]
}
*/

// Implementar una estrategia de Spot Instances requiere considerar
// la tolerancia a fallos y la automatización para maximizar los ahorros.
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Arquitectura Empresarial',
    'topic': 'Cost Optimization',
    'subtopic': 'Rightsizing',
    'definition': r'''
El "Rightsizing" en AWS es el proceso de analizar tu uso de recursos y ajustarlos al tamaño óptimo para tus necesidades. La idea es asegurarse de que no estás pagando por más capacidad de la que realmente utilizas (lo que se conoce como "over-provisioning"), ni tampoco por menos, lo que podría afectar el rendimiento. Es un balance entre costo y performance.

Aquí te va la aclaración: muchas veces, cuando lanzamos una instancia EC2 o configuramos un servicio, tendemos a elegir un tamaño mayor "por si acaso" o basándonos en estimaciones iniciales. Con el tiempo, las necesidades cambian y esos recursos pueden quedar infrautilizados.

El Rightsizing implica monitorear métricas clave como el uso de CPU, memoria, disco y red de tus instancias EC2, bases de datos RDS, contenedores, etc. AWS proporciona herramientas como AWS Cost Explorer y AWS Compute Optimizer que te dan recomendaciones específicas sobre cómo reducir el tamaño de tus recursos sin afectar el rendimiento, o incluso cómo aumentar el tamaño si detectan cuellos de botella. Por ejemplo, Compute Optimizer podría sugerirte cambiar una instancia `m5.xlarge` a una `m5.large` si su uso de CPU y memoria promedio es bajo, lo que resultaría en ahorros significativos. También puede recomendar la migración a diferentes tipos de instancias (como de la familia `m` a `c` si tu carga de trabajo es intensiva en CPU). La clave es un monitoreo continuo y un ajuste proactivo. Al optimizar el tamaño de tus recursos, no solo reduces tus costos de AWS, sino que también mejoras la eficiencia general de tu infraestructura en la nube. Es un pilar fundamental de la optimización de costos en AWS.
''',
    'code_example': r'''
// Ejemplo conceptual de cómo usar AWS Compute Optimizer para Rightsizing

// AWS Compute Optimizer es un servicio que analiza tu uso de recursos
// y proporciona recomendaciones de rightsizing. No hay un "código" directo
// para "hacer rightsizing", ya que es un proceso de análisis y ajuste.

// Sin embargo, puedes obtener las recomendaciones de Compute Optimizer
// programáticamente usando el AWS CLI o SDKs.

// 1. Obtener las recomendaciones de optimización para instancias EC2:
// aws compute-optimizer get-ec2-recommendations \
//    --filters '{"Name":"Finding","Values":["Underprovisioned","Overprovisioned"]}'

// Ejemplo de una parte de la salida (simplificada):
/*
{
    "Ec2Recommendations": [
        {
            "AccountId": "123456789012",
            "InstanceArn": "arn:aws:ec2:us-east-1:123456789012:instance/i-0abcdef1234567890",
            "CurrentInstanceType": "m5.xlarge",
            "Finding": "Overprovisioned",
            "RecommendationOptions": [
                {
                    "InstanceType": "m5.large",
                    "ProjectedMetrics": [
                        {
                            "Name": "CPU",
                            "Timestamps": ["2024-01-01T00:00:00Z"],
                            "Values": [30.0]
                        }
                    ],
                    "PerformanceRisk": "Low",
                    "SavingsOpportunity": {
                        "EstimatedMonthlySavings": {
                            "Value": 50.0,
                            "Unit": "USD"
                        }
                    }
                }
            ],
            // ... otros detalles
        }
    ]
}
*/

// 2. Obtener las métricas de uso de una instancia EC2 (ej. CPU) para entender por qué
//    Compute Optimizer podría haber hecho una recomendación:
// aws cloudwatch get-metric-statistics \
//    --namespace "AWS/EC2" \
//    --metric-name "CPUUtilization" \
//    --dimensions "Name=InstanceId,Value=i-0abcdef1234567890" \
//    --start-time "2024-01-01T00:00:00Z" \
//    --end-time "2024-01-31T23:59:59Z" \
//    --period 3600 \
//    --statistic "Average"

// La clave del rightsizing es analizar estos datos y recomendaciones para
// ajustar el tamaño de tus recursos y optimizar los costos.
'''
  });
}

Future<void> insertSrLevel2AwsData(Database db) async {
  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 2,
    'title_level': 'Seguridad a Nivel Empresarial',
    'topic': 'Identity Federation',
    'subtopic': 'AWS SSO',
    'definition': r'''
AWS Single Sign-On (SSO) es un servicio de AWS que te permite gestionar el acceso a múltiples cuentas de AWS y aplicaciones empresariales (como Salesforce, Office 365, etc.) desde un único lugar. En esencia, facilita la federación de identidades, permitiendo que tus usuarios utilicen sus credenciales corporativas existentes para acceder a todos los recursos que necesitan en la nube.

Seguramente pensarás de qué va todo esto. Bueno, antes de AWS SSO, si un usuario necesitaba acceso a varias cuentas de AWS o a diferentes aplicaciones SaaS, tenía que recordar múltiples nombres de usuario y contraseñas. Era un dolor de cabeza para la productividad y la seguridad.

AWS SSO simplifica esto al integrarse con tu directorio existente (como AWS Directory Service para Microsoft Active Directory, o un proveedor de identidad externo como Okta o Azure AD a través de SAML). Una vez configurado, tus usuarios pueden iniciar sesión una vez en un portal de usuario centralizado y acceder a todas las cuentas y aplicaciones asignadas sin necesidad de credenciales adicionales. Esto no solo mejora la experiencia del usuario, sino que también refuerza la seguridad al centralizar la gestión de accesos y la aplicación de políticas. Permite a los administradores asignar permisos a grupos de usuarios y aprovisionar acceso a recursos de forma granular, asegurando que cada usuario tenga el nivel de acceso correcto a lo que necesita. Es una pieza fundamental para implementar una estrategia de seguridad robusta y una gobernanza de identidades eficiente en entornos de múltiples cuentas de AWS.
''',
    'code_example': r'''
// Ejemplo conceptual de cómo interactuar con AWS SSO usando AWS CLI

// AWS SSO se configura principalmente a través de su consola para integrar
// con directorios de identidad y asignar permisos. No hay un "código" directo
// para "usar" AWS SSO como un servicio de aplicación, sino para gestionarlo.

// Sin embargo, puedes usar el AWS CLI para listar los conjuntos de permisos
// y las asignaciones en AWS SSO.

// 1. Listar los conjuntos de permisos en AWS SSO:
// aws sso-admin list-permission-sets \
//    --instance-arn "arn:aws:sso:::instance/ssoins-xxxxxxxxxxxxxxxxx"

// Ejemplo de la salida (simplificada):
/*
{
    "PermissionSets": [
        {
            "PermissionSetArn": "arn:aws:sso:::permissionSet/ssoins-xxxxxxxxxxxxxxxxx/ps-yyyyyyyyyyyyyyy",
            "Name": "Administrador"
        },
        {
            "PermissionSetArn": "arn:aws:sso:::permissionSet/ssoins-xxxxxxxxxxxxxxxxx/ps-zzzzzzzzzzzzzzz",
            "Name": "Desarrollador"
        }
    ]
}
*/

// 2. Listar las asignaciones de acceso para una cuenta específica:
// aws sso-admin list-account-assignments \
//    --instance-arn "arn:aws:sso:::instance/ssoins-xxxxxxxxxxxxxxxxx" \
//    --account-id "123456789012"

// Ejemplo de la salida (simplificada):
/*
{
    "AccountAssignments": [
        {
            "AccountId": "123456789012",
            "PermissionSetArn": "arn:aws:sso:::permissionSet/ssoins-xxxxxxxxxxxxxxxxx/ps-yyyyyyyyyyyyyyy",
            "PrincipalId": "user/juan.perez",
            "PrincipalType": "USER"
        }
    ]
}
*/

// 3. Crear una nueva asignación de acceso (conceptual):
// aws sso-admin create-account-assignment \
//    --instance-arn "arn:aws:sso:::instance/ssoins-xxxxxxxxxxxxxxxxx" \
//    --target-id "123456789012" \
//    --target-type "AWS_ACCOUNT" \
//    --permission-set-arn "arn:aws:sso:::permissionSet/ssoins-xxxxxxxxxxxxxxxxx/ps-zzzzzzzzzzzzzzz" \
//    --principal-type "USER" \
//    --principal-id "user/maria.gomez"

// Estos comandos ilustran cómo se puede gestionar el acceso a escala
// usando AWS SSO, facilitando la gobernanza y el cumplimiento.
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 2,
    'title_level': 'Seguridad a Nivel Empresarial',
    'topic': 'Identity Federation',
    'subtopic': 'SAML 2.0 integration',
    'definition': r'''
La integración con SAML 2.0 (Security Assertion Markup Language 2.0) es un estándar abierto que permite a los proveedores de identidad (IdP) autenticar a los usuarios y enviar aserciones de autenticación a los proveedores de servicios (SP). En el contexto de AWS, esto significa que puedes usar tu sistema de identidad existente (como Okta, Azure AD, o un IdP local) para que tus usuarios inicien sesión en la consola de AWS o accedan a recursos de AWS programáticamente, sin que AWS necesite almacenar sus credenciales.

Esto tiene una explicación, y es que si tu empresa ya tiene un sistema de gestión de identidades robusto, replicar todos esos usuarios y sus permisos en AWS IAM sería ineficiente y propenso a errores. SAML 2.0 es el puente que une ambos mundos.

El proceso implica configurar tu IdP para que confíe en AWS como un SP y configurar AWS IAM para que confíe en tu IdP. Cuando un usuario intenta iniciar sesión en AWS, es redirigido a tu IdP para la autenticación. Una vez autenticado, el IdP emite una aserción SAML que se envía a AWS. AWS consume esta aserción y, basándose en las reglas de mapeo que hayas configurado en IAM, asigna temporalmente un rol de IAM al usuario. Esto no solo simplifica la gestión de identidades para los usuarios, ya que pueden usar un inicio de sesión único (SSO), sino que también mejora la seguridad al centralizar la autenticación y el control de acceso en tu IdP. Además, las credenciales temporales emitidas por AWS reducen el riesgo de exposición de credenciales a largo plazo. Es una práctica estándar para la federación de identidades en entornos empresariales.
''',
    'code_example': r'''
// Ejemplo conceptual de la configuración de una relación de confianza SAML 2.0 en AWS IAM

// La integración de SAML 2.0 es principalmente una configuración en la consola de AWS
// IAM y en tu proveedor de identidad (IdP). No hay código ejecutable directo.
// Sin embargo, aquí te mostramos el JSON de una política de confianza de IAM
// que se usaría para permitir que un proveedor de identidad SAML asuma un rol.

// 1. Crear un proveedor de identidad SAML en IAM:
// (Esto se hace en la consola o usando aws iam create-saml-provider)
// Necesitarás el XML de metadatos de tu IdP.

// 2. Crear un rol de IAM que los usuarios federados asumirán.
//    La política de confianza de este rol especifica tu proveedor SAML.

// Ejemplo de política de confianza de IAM para un rol federado con SAML:
/*
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::123456789012:saml-provider/MiIdPSAML"
      },
      "Action": "sts:AssumeRoleWithSAML",
      "Condition": {
        "StringEquals": {
          "SAML:aud": "https://signin.aws.amazon.com/saml"
        }
      }
    }
  ]
}
*/

// Este JSON de política de confianza permite que cualquier usuario autenticado
// por "MiIdPSAML" asuma este rol.

// 3. (Opcional) Ejemplo de cómo un usuario podría iniciar sesión usando la CLI (conceptual, requiere configuración previa):
// aws configure sso
// Esto iniciaría el flujo de autenticación SSO/SAML a través de tu navegador.

// La clave de la integración SAML es la configuración de la confianza
// entre AWS y tu proveedor de identidad, permitiendo un inicio de sesión
// seguro y centralizado.
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 2,
    'title_level': 'Seguridad a Nivel Empresarial',
    'topic': 'Identity Federation',
    'subtopic': 'AWS Cognito avanzado',
    'definition': r'''
AWS Cognito es un servicio de gestión de identidades para tus aplicaciones móviles y web. En un nivel avanzado, Cognito va más allá de la simple autenticación, permitiéndote gestionar el acceso de usuarios, sincronizar datos de usuario entre dispositivos y federar identidades con proveedores sociales y empresariales, todo a escala masiva.

Pensemos por un momento en: ¿Por qué no simplemente construir mi propio sistema de autenticación? Aquí te va la aclaración: Construir y mantener un sistema de autenticación seguro y escalable es complejo, costoso y propenso a errores. Cognito se encarga de todo eso por ti.

Cognito tiene dos componentes principales: **User Pools** y **Identity Pools**. Los User Pools son directorios de usuarios gestionados donde puedes crear y gestionar usuarios directamente, o integrarlos con proveedores de identidad (como Google, Facebook, Apple, o SAML/OpenID Connect para identidades corporativas). Ofrecen funcionalidades como registro de usuarios, inicio de sesión, recuperación de contraseñas, MFA (autenticación multifactor) y protección contra ataques de fuerza bruta. Los Identity Pools, por otro lado, te permiten obtener credenciales de AWS temporales y con privilegios limitados para tus usuarios autenticados, lo que les permite acceder a otros servicios de AWS (como S3, DynamoDB, Lambda) directamente desde tu aplicación. Esto es crucial para aplicaciones que necesitan interactuar con los recursos de AWS de forma segura y sin exponer credenciales. A nivel avanzado, puedes personalizar flujos de autenticación con funciones Lambda, integrar con servicios de análisis y auditoría, y gestionar millones de usuarios, todo ello mientras te adhieres a los estándares de seguridad y cumplimiento.
''',
    'code_example': r'''
// Ejemplo conceptual de uso de AWS Cognito (avanzado) con un User Pool y un Identity Pool

// Este ejemplo muestra cómo una aplicación podría usar el SDK de AWS para JavaScript
// para autenticarse con Cognito User Pool y luego obtener credenciales temporales
// para acceder a un servicio de AWS a través de un Identity Pool.

// Configuración inicial del AWS SDK (ej. en una aplicación web):
// import { Amplify, Auth } from 'aws-amplify';

// Amplify.configure({
//   Auth: {
//     region: 'us-east-1',
//     userPoolId: 'us-east-1_abcdef123', // Tu User Pool ID
//     userPoolWebClientId: 'xxxxxxxxxxxxxxxxx', // Tu App Client ID
//     identityPoolId: 'us-east-1:abcdef12-3456-7890-abcd-ef1234567890', // Tu Identity Pool ID
//   }
// });

// 1. Registrar un nuevo usuario (User Pool):
/*
async function signUpUser(username, password, email) {
  try {
    const { user } = await Auth.signUp({
      username,
      password,
      attributes: {
        email,
      }
    });
    console.log('Usuario registrado:', user);
  } catch (error) {
    console.error('Error al registrar usuario:', error);
  }
}
*/

// 2. Iniciar sesión de un usuario (User Pool):
/*
async function signInUser(username, password) {
  try {
    const user = await Auth.signIn(username, password);
    console.log('Sesión iniciada:', user);

    // Una vez autenticado, Cognito Identity Pool se encarga de obtener
    // las credenciales temporales de AWS para el usuario.
    const credentials = await Auth.currentCredentials();
    console.log('Credenciales de AWS temporales:', credentials);
    // Ahora puedes usar estas credenciales para acceder a otros servicios de AWS (ej. S3)
  } catch (error) {
    console.error('Error al iniciar sesión:', error);
  }
}
*/

// 3. (Opcional) Ejemplo de cómo se vería la configuración del Identity Pool
//    para federar con Google, Facebook, etc. (se hace en la consola):
//    En el Identity Pool, defines los proveedores de autenticación que usarás.
//    Esto mapea los usuarios autenticados a roles de IAM.

// Cognito simplifica enormemente la gestión de la autenticación y autorización
// para tus aplicaciones, permitiéndote escalar sin preocuparte por la infraestructura.
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 2,
    'title_level': 'Seguridad a Nivel Empresarial',
    'topic': 'Identity Federation',
    'subtopic': 'Custom Identity Broker',
    'definition': r'''
Un Custom Identity Broker, o intermediario de identidad personalizado, es una solución que construyes tú mismo para manejar la autenticación y autorización de usuarios, especialmente cuando tus necesidades de federación de identidades son muy específicas y no se ajustan perfectamente a los servicios gestionados de AWS como AWS SSO o Cognito. Actúa como una capa intermedia entre tus usuarios y los servicios de AWS, traduciendo las identidades de tu sistema interno a credenciales que AWS puede entender.

Aquí te va la aclaración: A veces, las soluciones listas para usar no cubren todos los escenarios de autenticación complejos que una empresa puede tener, especialmente si hay sistemas heredados o requisitos de seguridad muy particulares.

Un Custom Identity Broker típicamente se implementa usando servicios como AWS Lambda para la lógica de autenticación, Amazon API Gateway para exponer los endpoints de autenticación, y quizás DynamoDB o RDS para almacenar información de sesión o metadatos de usuario. El flujo general sería: un usuario intenta acceder a un recurso de AWS, tu aplicación lo redirige a tu Custom Identity Broker, este broker autentica al usuario contra tu sistema de identidad interno, y si la autenticación es exitosa, el broker utiliza AWS Security Token Service (STS) para asumir un rol de IAM y generar credenciales temporales. Estas credenciales temporales son luego devueltas a la aplicación del usuario, permitiéndole acceder a los recursos de AWS. Esta flexibilidad te permite implementar lógica de autorización muy granular, integrar con sistemas de identidad no estándar y tener un control completo sobre el flujo de autenticación, aunque a expensas de la complejidad de desarrollo y mantenimiento. Es una opción para organizaciones con requisitos de identidad muy únicos que no pueden ser satisfechos por soluciones estándar.
''',
    'code_example': r'''
// Ejemplo conceptual de un Custom Identity Broker usando AWS Lambda y STS

// Este es un flujo simplificado de cómo un Custom Identity Broker podría funcionar.
// La autenticación real contra el sistema interno (ej. LDAP, base de datos de usuarios)
// no se muestra aquí, pero sería el primer paso en la función Lambda.

// 1. Una función AWS Lambda que actúa como el "broker" para asumir un rol de IAM.
//    Esta función sería invocada por tu aplicación después de autenticar al usuario.

// `lambda_handler.py` (pseudocódigo Python para la función Lambda)
/*
import json
import boto3

def lambda_handler(event, context):
    # Paso 1: Autenticar al usuario contra tu sistema de identidad interno (no mostrado)
    # Suponemos que el usuario ya está autenticado y tenemos su ID o grupo.
    user_id = event.get('userId') # O obtener del token de autenticación

    if not user_id:
        return {
            'statusCode': 401,
            'body': json.dumps({'message': 'No autorizado'})
        }

    # Paso 2: Determinar el rol de IAM que el usuario debe asumir
    # Basado en la lógica de tu negocio o los grupos del usuario
    iam_role_arn = "arn:aws:iam::123456789012:role/MiRolDeAplicacion" # Ejemplo de ARN de rol

    sts_client = boto3.client('sts')

    try:
        # Paso 3: Asumir el rol de IAM y obtener credenciales temporales
        assumed_role = sts_client.assume_role(
            RoleArn=iam_role_arn,
            RoleSessionName=f"AppSession-{user_id}",
            DurationSeconds=3600 # Duración de las credenciales en segundos (1 hora)
        )

        credentials = assumed_role['Credentials']

        return {
            'statusCode': 200,
            'headers': {
                'Content-Type': 'application/json',
                'Access-Control-Allow-Origin': '*' // Cuidado con CORS en producción
            },
            'body': json.dumps({
                'AccessKeyId': credentials['AccessKeyId'],
                'SecretAccessKey': credentials['SecretAccessKey'],
                'SessionToken': credentials['SessionToken'],
                'Expiration': credentials['Expiration'].isoformat()
            })
        }
    except Exception as e:
        print(f"Error al asumir rol: {e}")
        return {
            'statusCode': 500,
            'body': json.dumps({'message': 'Error interno al obtener credenciales'})
        }
*/

// 2. Tu aplicación cliente luego recibiría estas credenciales y las usaría para
//    firmar solicitudes a otros servicios de AWS (ej. S3, DynamoDB).
//    Esto se haría utilizando el SDK de AWS en el cliente.

// La creación de un Custom Identity Broker ofrece la máxima flexibilidad
// pero también requiere más desarrollo y mantenimiento.
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 2,
    'title_level': 'Seguridad Híbrida',
    'topic': 'Seguridad Híbrida',
    'subtopic': 'AWS Directory Service',
    'definition': r'''
AWS Directory Service es un servicio gestionado de AWS que te permite ejecutar directorios estándar de Microsoft Active Directory (AD) en la nube, o conectar tus cargas de trabajo de AWS a tu Active Directory existente on-premise. Es la pieza clave para extender tus identidades y grupos de usuarios actuales a la nube de forma segura y sin problemas.

Aquí te va la aclaración: Si tu empresa ya usa Active Directory para gestionar usuarios, equipos y políticas en tu centro de datos, replicar esa funcionalidad en la nube de cero sería un dolor de cabeza. Directory Service te evita eso.

AWS Directory Service ofrece varias opciones. La más común para entornos híbridos es **AWS Managed Microsoft AD**, que te proporciona un Active Directory completo y gestionado por AWS, con confianza bidireccional hacia tu AD on-premise. Esto significa que los usuarios y grupos de tu AD local pueden autenticarse y acceder a recursos en AWS (como instancias EC2 unidas al dominio, RDS SQL Server, WorkSpaces, etc.) sin problemas. Otra opción es **AD Connector**, que actúa como un proxy y redirige las solicitudes de directorio a tu AD on-premise, sin replicar ningún dato de directorio en la nube. Esto es útil si solo necesitas que los servicios de AWS utilicen tu AD existente sin la necesidad de un AD en la nube. Directory Service simplifica la gestión de identidades y accesos en entornos híbridos, asegurando que tus usuarios tengan una experiencia de inicio de sesión consistente y que puedas aplicar tus políticas de seguridad de AD existentes a los recursos en la nube.
''',
    'code_example': r'''
// Ejemplo conceptual de cómo interactuar con AWS Directory Service usando AWS CLI

// AWS Directory Service se gestiona principalmente a través de la consola
// o el AWS CLI para crear y configurar directorios.

// 1. Crear un Directorio Activo gestionado por AWS (Managed Microsoft AD):
// aws ds create-microsoft-ad \
//    --name "mydomain.com" \
//    --vpc-settings '{"VpcId": "vpc-0abcdef1234567890", "SubnetIds": ["subnet-0abcdef1234567890", "subnet-0fedcba9876543210"]}' \
//    --edition "Standard" \
//    --description "Mi Directorio Activo Gestionado para la nube"

// Ejemplo de salida (simplificada):
/*
{
    "DirectoryId": "d-abcdef1234",
    "DnsIpAddrs": [
        "10.0.0.100",
        "10.0.1.100"
    ]
    // ...
}
*/

// 2. Obtener información sobre un directorio existente:
// aws ds describe-directories \
//    --directory-ids "d-abcdef1234"

// 3. Crear una confianza bidireccional con un AD on-premise (conceptual, se hace en el AD y AWS):
// aws ds create-trust \
//    --directory-id "d-abcdef1234" \
//    --remote-domain-name "onprem.com" \
//    --trust-type "Forest" \
//    --trust-direction "Two-Way" \
//    --trust-password "MyStrongPassword123!"

// Estos comandos ilustran cómo AWS Directory Service facilita la extensión
// de tu Active Directory existente a la nube, o la creación de uno nuevo gestionado por AWS.
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 2,
    'title_level': 'Seguridad Híbrida',
    'topic': 'Seguridad Híbrida',
    'subtopic': 'AWS Secrets Manager',
    'definition': r'''
AWS Secrets Manager es un servicio que te ayuda a proteger el acceso a tus aplicaciones, servicios y recursos al permitirte rotar, administrar y recuperar credenciales de bases de datos, claves de API y otros secretos a lo largo de su ciclo de vida. Piensa en él como una bóveda segura para todos tus secretos, pero con la capacidad mágica de cambiarlos automáticamente.

No sé tú, pero a mí esto al principio me costó un poco entender por qué es tan importante. Aquí te va la aclaración: En un entorno de nube, manejar credenciales de forma manual (hardcodeadas o en archivos de configuración) es una receta para el desastre. Es inseguro, tedioso y no escala.

Secrets Manager resuelve esto almacenando tus secretos de forma segura y encriptada. Su característica estrella es la **rotación automática**. Por ejemplo, puede rotar automáticamente las credenciales de tu base de datos de RDS sin tiempo de inactividad, mejorando drásticamente tu postura de seguridad al reducir el riesgo de credenciales comprometidas. También puedes usarlo para rotar claves de API para servicios de terceros. Tus aplicaciones recuperan los secretos en tiempo de ejecución utilizando una llamada de API a Secrets Manager, lo que significa que los secretos nunca se almacenan directamente en tu código o en archivos de configuración, sino que se recuperan dinámicamente cuando se necesitan. Además, puedes configurar permisos de acceso granulares a los secretos usando IAM, monitorear el acceso y la rotación a través de CloudTrail, y cifrar los secretos con AWS KMS. Es un servicio esencial para cualquier arquitectura segura en la nube que maneje información sensible.
''',
    'code_example': r'''
// Ejemplo de cómo una aplicación podría recuperar un secreto de AWS Secrets Manager

// Este ejemplo muestra cómo usar el SDK de AWS para Python (Boto3) para
// recuperar un secreto. La idea es que la aplicación no almacena el secreto
// directamente, sino que lo solicita a Secrets Manager en tiempo de ejecución.

// `get_secret.py`
/*
import boto3
from botocore.exceptions import ClientError

def get_secret(secret_name):
    region_name = "us-east-1" # Reemplaza con tu región

    # Crea un cliente de Secrets Manager
    session = boto3.session.Session()
    client = session.client(
        service_name='secretsmanager',
        region_name=region_name
    )

    try:
        get_secret_value_response = client.get_secret_value(
            SecretId=secret_name
        )
    except ClientError as e:
        if e.response['Error']['Code'] == 'DecryptionFailureException':
            # Secrets Manager no puede descifrar el secreto
            raise e
        elif e.response['Error']['Code'] == 'InternalServiceErrorException':
            # Ocurrió un error interno del servicio
            raise e
        elif e.response['Error']['Code'] == 'InvalidParameterException':
            # Parámetro de solicitud no válido
            raise e
        elif e.response['Error']['Code'] == 'InvalidRequestException':
            # Solicitud no válida, por ejemplo, secreto marcado para eliminación
            raise e
        elif e.response['Error']['Code'] == 'ResourceNotFoundException':
            # Secreto no encontrado
            raise e
    else:
        # El secreto puede estar en SecretString o SecretBinary
        if 'SecretString' in get_secret_value_response:
            secret = get_secret_value_response['SecretString']
            return secret
        else:
            # secret_binary está en Bytes, necesitarás decodificarlo
            secret = get_secret_value_response['SecretBinary']
            return secret.decode('utf-8')

# Uso de la función
# if __name__ == "__main__":
#     db_credentials = get_secret("MyDatabaseCredentials")
#     print(f"Credenciales de la base de datos: {db_credentials}")
#     # Aquí podrías usar estas credenciales para conectar a la base de datos
*/

// La rotación automática es una de las características clave de Secrets Manager.
// Por ejemplo, para RDS, configuras la rotación en la consola de Secrets Manager,
// y AWS se encarga de cambiar las credenciales de la base de datos y actualizar el secreto.
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 2,
    'title_level': 'Seguridad Híbrida',
    'topic': 'Seguridad Híbrida',
    'subtopic': 'AWS Systems Manager Parameter Store avanzado',
    'definition': r'''
AWS Systems Manager Parameter Store es un servicio para el almacenamiento seguro y jerárquico de datos de configuración y gestión de secretos. En un nivel avanzado, va más allá de un simple almacén de clave-valor; te permite gestionar parámetros sensibles como contraseñas o claves de API con cifrado de KMS, así como configuraciones de aplicaciones y scripts, todo ello con versionado y notificaciones.

Aquí te va la aclaración: A menudo, las aplicaciones necesitan acceder a configuraciones o credenciales que varían entre entornos (desarrollo, pruebas, producción) o que necesitan ser actualizadas sin desplegar nuevo código. Parameter Store es ideal para esto.

Parameter Store te permite almacenar datos como texto plano, texto cifrado (con KMS) o como `StringList` (lista de strings). Puedes organizar tus parámetros en una jerarquía (ej. `/mi-aplicacion/dev/db-password`, `/mi-aplicacion/prod/api-key`), lo que facilita la gestión de configuraciones para diferentes entornos o microservicios. A nivel avanzado, puedes integrarlo con otros servicios de Systems Manager para automatizar tareas, configurar alertas cuando un parámetro cambia, y usarlo para la entrega de configuración centralizada a tus instancias EC2 o contenedores. Una diferencia clave con Secrets Manager es que Parameter Store está diseñado para almacenar tanto datos no sensibles como sensibles, y su uso es gratuito para los parámetros estándar (hasta un cierto límite). Secrets Manager está diseñado específicamente para secretos que requieren rotación y tiene un costo por secreto y por rotación. Parameter Store es excelente para configuraciones de aplicación, nombres de usuario, y credenciales que no requieren rotación automática pero sí seguridad y versionado.
''',
    'code_example': r'''
// Ejemplo de cómo una aplicación podría recuperar parámetros de AWS Systems Manager Parameter Store

// Este ejemplo muestra cómo usar el SDK de AWS para Python (Boto3) para
// recuperar un parámetro sensible (cifrado) y un parámetro no sensible.

// `get_parameters.py`
/*
import boto3
from botocore.exceptions import ClientError

def get_ssm_parameter(parameter_name, with_decryption=False):
    region_name = "us-east-1" # Reemplaza con tu región

    client = boto3.client('ssm', region_name=region_name)

    try:
        response = client.get_parameter(
            Name=parameter_name,
            WithDecryption=with_decryption # Establecer a True para parámetros cifrados
        )
        return response['Parameter']['Value']
    except ClientError as e:
        print(f"Error al obtener el parámetro '{parameter_name}': {e}")
        raise e

# Uso de las funciones:

# if __name__ == "__main__":
#     # Parámetro no sensible (ej. URL de la API)
#     api_url = get_ssm_parameter("/mi-aplicacion/dev/api-url")
#     print(f"URL de la API: {api_url}")

#     # Parámetro sensible (ej. clave de API, cifrada con KMS)
#     api_key = get_ssm_parameter("/mi-aplicacion/prod/api-key", with_decryption=True)
#     print(f"Clave de API (sensible): {api_key}") # Asegúrate de no loguear secretos en prod
*/

// Para crear estos parámetros en la CLI (conceptual):
// aws ssm put-parameter \
//    --name "/mi-aplicacion/dev/api-url" \
//    --value "https://dev.api.example.com" \
//    --type "String"

// aws ssm put-parameter \
//    --name "/mi-aplicacion/prod/api-key" \
//    --value "mi-super-clave-secreta-prod" \
//    --type "SecureString" \
//    --key-id "alias/aws/ssm" # O el ARN de tu clave KMS custom

// Parameter Store es una herramienta flexible y segura para gestionar configuraciones
// y secretos, ideal para automatizar la entrega de configuraciones a tus aplicaciones.
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 2,
    'title_level': 'Seguridad Híbrida',
    'topic': 'Seguridad Híbrida',
    'subtopic': 'Hybrid DNS con Route 53',
    'definition': r'''
La implementación de un Hybrid DNS (Sistema de Nombres de Dominio híbrido) con Amazon Route 53 es crucial para que tus recursos tanto en la nube de AWS como en tu centro de datos on-premise puedan resolverse entre sí de forma transparente. Esto significa que una aplicación en AWS puede encontrar un servidor en tu data center y viceversa, sin que tengas que gestionar dos sistemas DNS completamente separados o realizar configuraciones manuales complejas.

Aquí te va la aclaración: Si tienes recursos en la nube y on-premise, y ambos necesitan comunicarse por nombre (no por IP), necesitas una forma de que los servidores DNS de cada entorno conozcan los registros del otro. Sin una solución híbrida, esto puede volverse una pesadilla administrativa.

Amazon Route 53 es el servicio DNS web escalable y de alta disponibilidad de AWS. Para un DNS híbrido, se utiliza una combinación de Route 53, **Route 53 Resolver** y tus servidores DNS on-premise. Route 53 Resolver te permite configurar puntos de enlace (endpoints) de DNS en tu VPC. Puedes crear **reglas de reenvío de Route 53 Resolver** para que las consultas DNS de tu VPC para ciertos dominios (ej. tu dominio interno on-premise como `corp.local`) sean reenviadas a tus servidores DNS on-premise. A la inversa, puedes configurar tus servidores DNS on-premise para que reenvíen las consultas de dominios de AWS (ej. `ec2.internal` o tus dominios públicos alojados en Route 53) a los puntos de enlace de Route 53 Resolver en tu VPC. Esto crea un "puente" DNS bidireccional, permitiendo que la resolución de nombres funcione sin problemas en ambos entornos. Es fundamental para la conectividad de aplicaciones en arquitecturas híbridas y para la gestión centralizada de nombres.
''',
    'code_example': r'''
// Ejemplo conceptual de configuración de Hybrid DNS con Amazon Route 53 Resolver

// La configuración de Hybrid DNS implica la creación de Route 53 Resolver Endpoints
// y reglas de reenvío. Esto se gestiona a través de la consola o el AWS CLI.

// 1. Crear un Route 53 Resolver Endpoint de entrada (Inbound Endpoint) en tu VPC.
//    Esto permite que las consultas DNS de tu red on-premise lleguen a Route 53 Resolver.
// aws route53resolver create-resolver-endpoint \
//    --name "InboundResolverEndpoint" \
//    --direction "INBOUND" \
//    --ip-addresses 'IpSubnetId=subnet-0abcdef1234567890,IpAddress=10.0.0.5' \
//    --security-group-ids "sg-0abcdef1234567890" \
//    --tags 'Key=Environment,Value=Hybrid'

// 2. Crear un Route 53 Resolver Endpoint de salida (Outbound Endpoint) en tu VPC.
//    Esto permite que las consultas DNS de tu VPC sean reenviadas a servidores DNS on-premise.
// aws route53resolver create-resolver-endpoint \
//    --name "OutboundResolverEndpoint" \
//    --direction "OUTBOUND" \
//    --ip-addresses 'IpSubnetId=subnet-0fedcba9876543210,IpAddress=10.0.1.5' \
//    --security-group-ids "sg-0fedcba9876543210" \
//    --tags 'Key=Environment,Value=Hybrid'

// 3. Crear una regla de reenvío (Forwarding Rule) para Route 53 Resolver.
//    Esto le dice a Route 53 Resolver que reenvíe las consultas para "corp.local"
//    a tus servidores DNS on-premise a través del Outbound Endpoint.
// aws route53resolver create-resolver-rule \
//    --name "OnPremDomainForwarding" \
//    --rule-type "FORWARD" \
//    --domain-name "corp.local" \
//    --target-ips 'Ip=192.168.1.10,Ip=192.168.1.11' \
//    --resolver-endpoint-id "rslvr-out-xxxxxxxxxxxxxxxxx" \
//    --tags 'Key=Purpose,Value=HybridDNS'

// 4. Asociar la regla a una o más VPCs:
// aws route53resolver associate-resolver-rule \
//    --resolver-rule-id "rslvr-rule-xxxxxxxxxxxxxxxxx" \
//    --vpc-id "vpc-0abcdef1234567890"

// Además de esto, en tus servidores DNS on-premise, necesitarías configurar
// "conditional forwarders" para que reenvíen las consultas de dominios de AWS
// (ej. *.amazonaws.com) a la IP del Inbound Resolver Endpoint en tu VPC de AWS.
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 2,
    'title_level': 'Seguridad a Nivel Empresarial',
    'topic': 'Network Security',
    'subtopic': 'AWS Network Firewall',
    'definition': r'''
AWS Network Firewall es un servicio de firewall de red gestionado que te permite desplegar protecciones de firewall de red fácilmente en todas tus Virtual Private Clouds (VPCs). Proporciona capacidades de inspección de tráfico de red para filtrado de paquetes con estado, filtrado de nombres de dominio y prevención de intrusiones.

Seguramente pensarás de qué va todo esto. Bueno, antes de Network Firewall, tenías que desplegar y gestionar firewalls de terceros en tus VPCs, lo que añadía complejidad operativa y costos. Network Firewall te da una solución nativa de AWS para la seguridad de red a escala.

Network Firewall te permite definir políticas de firewall centralizadas y aplicarlas a través de tus VPCs. Puedes configurar reglas para permitir o denegar el tráfico basándose en direcciones IP, puertos, protocolos, nombres de dominio y patrones de tráfico. Es un firewall "con estado", lo que significa que rastrea el estado de las conexiones de red y puede aplicar reglas basadas en el contexto de la sesión. Una de sus mayores ventajas es la integración nativa con AWS Firewall Manager, lo que te permite gestionar y desplegar políticas de firewall de forma centralizada en toda tu organización de AWS. También puedes integrarlo con servicios de inteligencia de amenazas de terceros y exportar registros de flujo para análisis. Es ideal para organizaciones que necesitan una protección de red avanzada y escalable para sus aplicaciones en la nube, asegurando el cumplimiento y la seguridad en toda su infraestructura de red.
''',
    'code_example': r'''
// Ejemplo conceptual de cómo configurar AWS Network Firewall usando AWS CLI

// La configuración de Network Firewall implica crear una política de firewall,
// grupos de reglas (rule groups) y luego asociar el firewall a las VPCs.

// 1. Crear un grupo de reglas con estado (Stateful Rule Group) para filtrar dominios:
// aws network-firewall create-rule-group \
//    --rule-group-name "BlockBadDomains" \
//    --type "STATEFUL" \
//    --capacity 100 \
//    --rule-group '{"StatefulRules":[{"Header":{"Protocol":"TLS","Source":"Any","SourcePort":"Any","Destination":"Any","DestinationPort":"Any","Direction":"FORWARD"},"Action":"DROP","RuleOptions":[{"Keyword":"tls_sni","Settings":["badsite.com","malicious.org"]}]}]}' \
//    --tags 'Key=Purpose,Value=Security'

// 2. Crear una política de firewall:
// aws network-firewall create-firewall-policy \
//    --firewall-policy-name "CentralNetworkPolicy" \
//    --firewall-policy '{"StatelessDefaultActions":["aws:forward_to_sfe"],"StatelessFragmentDefaultActions":["aws:forward_to_sfe"],"StatefulRuleGroupReferences":[{"ResourceArn":"arn:aws:network-firewall:us-east-1:123456789012:stateful-rule-group/BlockBadDomains"}]}' \
//    --tags 'Key=Environment,Value=Production'

// 3. Crear el firewall y asociarlo a una VPC y subredes:
// aws network-firewall create-firewall \
//    --firewall-name "ProdVPC-Firewall" \
//    --firewall-policy-arn "arn:aws:network-firewall:us-east-1:123456789012:firewall-policy/CentralNetworkPolicy" \
//    --vpc-id "vpc-0abcdef1234567890" \
//    --subnet-mappings '{"SubnetId":"subnet-0abcdef1234567890"}' \
//    --tags 'Key=Environment,Value=Production'

// Estos comandos ilustran cómo se puede desplegar un firewall gestionado
// para proteger tus VPCs en AWS, aplicando políticas de seguridad de red centralizadas.
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 2,
    'title_level': 'Seguridad a Nivel Empresarial',
    'topic': 'Network Security',
    'subtopic': 'AWS Gateway Load Balancer',
    'definition': r'''
AWS Gateway Load Balancer (GWLB) es un servicio de balanceo de carga especializado que te permite desplegar, escalar y gestionar fácilmente electrodomésticos de red de terceros (como firewalls, sistemas de prevención de intrusiones, optimizadores de WAN) de forma transparente en tu arquitectura de red en la nube. Actúa como un punto central para insertar estos dispositivos de seguridad o de red en la ruta del tráfico, sin que tengas que redirigir manualmente los paquetes.

Esto tiene una explicación, y es que antes de GWLB, integrar dispositivos de terceros en tu arquitectura de red de AWS era complejo. A menudo implicaba rutas estáticas, interfaces de red adicionales o configuraciones manuales para forzar el tráfico a través de tus aparatos.

GWLB simplifica esto al combinar las funciones de un balanceador de carga transparente (que es un punto de entrada único para todo el tráfico) y un dispositivo de red de capa 3 que envía y recibe tráfico de red a tus aparatos. Cuando el tráfico llega a GWLB, lo envía a un "grupo objetivo" de tus aparatos de red (que pueden ser instancias EC2 con software de firewall o dispositivos virtuales). Después de que el aparato inspecciona y procesa el tráfico, lo devuelve a GWLB, que luego lo reenvía a su destino original. Esto permite escalar horizontalmente tus aparatos de red, aumentar la resiliencia y tener una visión centralizada de tu postura de seguridad. Es ideal para entornos empresariales que ya han invertido en soluciones de seguridad de red específicas de terceros y desean integrarlas de forma eficiente en su infraestructura de AWS sin comprometer la escalabilidad o la disponibilidad.
''',
    'code_example': r'''
// Ejemplo conceptual de cómo configurar AWS Gateway Load Balancer (GWLB)

// La configuración de GWLB implica crear el GWLB, un grupo objetivo
// que apunta a tus electrodomésticos de red (ej. EC2 con firewall),
// y luego configurar tablas de ruteo para dirigir el tráfico a GWLB.

// 1. Crear un grupo objetivo (Target Group) para tus instancias de firewall/dispositivos:
// aws elbv2 create-target-group \
//    --name "FirewallTargetGroup" \
//    --protocol "GENEVE" \
//    --port 6081 \
//    --vpc-id "vpc-0abcdef1234567890" \
//    --target-type "instance" # O "ip" si tus dispositivos tienen IPs específicas

// 2. Registrar tus instancias de firewall/dispositivos en el grupo objetivo:
// aws elbv2 register-targets \
//    --target-group-arn "arn:aws:elasticloadbalancing:us-east-1:123456789012:targetgroup/FirewallTargetGroup/abcdef1234567890" \
//    --targets Id=i-0abcdef1234567890 Id=i-0fedcba9876543210

// 3. Crear el Gateway Load Balancer:
// aws elbv2 create-load-balancer \
//    --name "MyGatewayLoadBalancer" \
//    --type "gateway" \
//    --subnets "subnet-0abcdef1234567890" \
//    --tags 'Key=Purpose,Value=SecurityAppliance'

// 4. Crear un Listener para el GWLB que reenvíe el tráfico al grupo objetivo:
// aws elbv2 create-listener \
//    --load-balancer-arn "arn:aws:elasticloadbalancing:us-east-1:123456789012:loadbalancer/gwlb/MyGatewayLoadBalancer/abcdef1234567890" \
//    --default-actions Type=forward,TargetGroupArn="arn:aws:elasticloadbalancing:us-east-1:123456789012:targetgroup/FirewallTargetGroup/abcdef1234567890"

// 5. Configurar las tablas de ruteo de tus subredes para enviar el tráfico a GWLB.
//    Esto implica crear un "Gateway Load Balancer Endpoint" en la VPC
//    y apuntar las rutas al `Interface Load Balancer Endpoint`.
//    (Este paso es más complejo y a menudo se hace con CloudFormation o en la consola).

// GWLB es fundamental para orquestar la seguridad de red avanzada y de terceros
// en tus arquitecturas de AWS.
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 2,
    'title_level': 'Seguridad a Nivel Empresarial',
    'topic': 'Network Security',
    'subtopic': 'VPC Flow Logs avanzado',
    'definition': r'''
VPC Flow Logs registran el tráfico de red de entrada y salida de las interfaces de red en tu Virtual Private Cloud (VPC). En un nivel avanzado, va más allá de la simple recopilación de logs; te permite obtener insights profundos sobre el comportamiento del tráfico de red, identificar anomalías de seguridad, solucionar problemas de conectividad y cumplir con requisitos de auditoría y cumplimiento.

No sé tú, pero a mí esto al principio me costó un poco entender su verdadero potencial. Aquí te va la aclaración: los logs son solo datos crudos. El valor real está en cómo los analizas y qué acciones tomas basándote en ellos.

A nivel avanzado, no solo activas VPC Flow Logs, sino que los envías a destinos que permiten análisis complejos, como Amazon CloudWatch Logs, Amazon S3 o Amazon Kinesis Data Firehose (para streaming a herramientas de SIEM como Splunk o ELK Stack). Una vez en S3, puedes usar herramientas como Amazon Athena para consultarlos con SQL, o Amazon QuickSight para visualizarlos. Esto te permite identificar patrones de tráfico inusuales (ej. intentos de escaneo de puertos, conexiones a IPs maliciosas), depurar problemas de conectividad de red, validar las reglas de tus Security Groups y Network ACLs, y demostrar el cumplimiento al auditar el flujo de tráfico. Por ejemplo, podrías crear un panel de control que muestre las fuentes de tráfico más activas, los puertos más utilizados, o las conexiones denegadas. Es una herramienta indispensable para la visibilidad y la seguridad de la red en AWS.
''',
    'code_example': r'''
// Ejemplo conceptual de cómo configurar y analizar VPC Flow Logs de forma avanzada

// La configuración de Flow Logs se realiza en la consola de VPC o usando el AWS CLI.
// El análisis avanzado implica enviar los logs a un destino y luego consultarlos.

// 1. Crear un Flow Log para una VPC, enviándolo a CloudWatch Logs:
// aws ec2 create-flow-logs \
//    --resource-type "VPC" \
//    --resource-ids "vpc-0abcdef1234567890" \
//    --traffic-type "ALL" \
//    --log-destination-type "cloud-watch-logs" \
//    --log-destination "arn:aws:logs:us-east-1:123456789012:log-group:my-flow-logs" \
//    --deliver-logs-permission-arn "arn:aws:iam::123456789012:role/FlowLogsRole"

// 2. Opcional: Crear un Flow Log a un bucket S3 para análisis con Athena:
// aws ec2 create-flow-logs \
//    --resource-type "VPC" \
//    --resource-ids "vpc-0fedcba98766543210" \
//    --traffic-type "ALL" \
//    --log-destination-type "s3" \
//    --log-destination "arn:aws:s3:::my-flow-logs-bucket/flow-logs/" \
//    --deliver-logs-permission-arn "arn:aws:iam::123456789012:role/FlowLogsRole"

// 3. Ejemplo de consulta en Amazon Athena sobre los Flow Logs en S3 (conceptual):
// Suponiendo que has creado una tabla en Athena sobre tu bucket de Flow Logs.

/*
SELECT
    srcaddr,
    dstaddr,
    dstport,
    action,
    bytes,
    packets
FROM
    "vpc_flow_logs_db"."flow_logs_table"
WHERE
    action = 'REJECT' -- Mostrar tráfico denegado
    AND log_status = 'OK'
ORDER BY
    start_time DESC
LIMIT 100;
*/

// Este es un ejemplo de cómo puedes identificar conexiones de red fallidas
// o denegadas. Puedes adaptar las consultas para detectar anomalías,
// uso inusual de puertos, etc.

// La clave para un uso avanzado de VPC Flow Logs es una estrategia robusta
// de ingesta y análisis de logs.
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 2,
    'title_level': 'Seguridad a Nivel Empresarial',
    'topic': 'Network Security',
    'subtopic': 'AWS Network Access Analyzer',
    'definition': r'''
AWS Network Access Analyzer es una herramienta de AWS que te ayuda a identificar las rutas de red que permiten el acceso a tus recursos en AWS. Te permite realizar análisis sofisticados para determinar si tus configuraciones de red cumplen con tus requisitos de seguridad y cumplimiento, respondiendo a preguntas como: "¿Es posible que mi instancia EC2 de producción acceda a mi base de datos de desarrollo?" o "¿Puede esta subred acceder a Internet?".

Esto tiene una explicación, y es que en arquitecturas de red complejas en la nube, con múltiples VPCs, Security Groups, Network ACLs, Transit Gateways y VPNs, es extremadamente difícil entender todas las posibles rutas de red manualmente. Un pequeño cambio puede tener un gran impacto en la seguridad.

Network Access Analyzer te permite especificar un recurso de origen y un recurso de destino (ej. una instancia EC2 a un puerto específico de una base de datos) y luego analiza todas las posibles rutas de red entre ellos, considerando todas las configuraciones de red involucradas (tablas de ruteo, Security Groups, Network ACLs, etc.). Te muestra si una ruta es posible y, si lo es, detalla el camino que tomaría el tráfico, incluyendo cada componente de red que lo permite o lo bloquea. Esto es invaluable para auditar tus configuraciones de seguridad de red, validar segmentación de red, asegurar el cumplimiento y solucionar problemas de conectividad. A nivel avanzado, puedes integrarlo en tus pipelines de CI/CD para validar automáticamente la seguridad de la red con cada cambio en la infraestructura, asegurando que los cambios no introduzcan vulnerabilidades inesperadas o accesos no deseados.
''',
    'code_example': r'''
// Ejemplo conceptual de cómo usar AWS Network Access Analyzer con AWS CLI

// Network Access Analyzer se utiliza para realizar análisis de rutas de red.
// No hay código de aplicación directo, sino comandos para iniciar y obtener análisis.

// 1. Crear una ruta de acceso (Path) para analizar.
//    Esto define el origen, el destino y el protocolo/puerto.
// aws network-access-analyzer create-analysis \
//    --network-insights-path '{"Source":"i-0abcdef1234567890", "Destination":"i-0fedcba9876543210", "Protocol":"tcp", "DestinationPortRange":{"From":3306,"To":3306}}' \
//    --tags 'Key=Name,Value=DBAccessAnalysis'

// Ejemplo de la salida (simplificada):
/*
{
    "NetworkInsightsAnalysis": {
        "NetworkInsightsAnalysisArn": "arn:aws:network-access-analyzer:us-east-1:123456789012:network-insights-analysis/nia-xxxxxxxxxxxxxxxxx",
        "Status": "RUNNING",
        // ...
    }
}
*/

// 2. Obtener los resultados del análisis una vez completado:
// aws network-access-analyzer get-network-insights-analysis \
//    --network-insights-analysis-arn "arn:aws:network-access-analyzer:us-east-1:123456789012:network-insights-analysis/nia-xxxxxxxxxxxxxxxxx"

// Ejemplo de una parte de la salida (simplificada, si la ruta es "reachable"):
/*
{
    "NetworkInsightsAnalysis": {
        "Status": "SUCCEEDED",
        "PathFound": true,
        "ForwardPathComponents": [
            // Detalles de cada componente de red en la ruta (ej. ENI, Security Group, Route Table)
            {
                "ComponentType": "NetworkInterface",
                "Component": {"Arn": "arn:aws:ec2:us-east-1:123456789012:network-interface/eni-0abcdef1234567890"},
                "SequenceNumber": 1
            },
            {
                "ComponentType": "SecurityGroup",
                "Component": {"Arn": "arn:aws:ec2:us-east-1:123456789012:security-group/sg-0abcdef1234567890"},
                "SequenceNumber": 2,
                "Explanations": [
                    {"ExplanationCode": "security-group-rule","ExplanationMessage": "Security group sg-0abcdef1234567890 allows traffic.  Rule:  Allow TCP from 0.0.0.0/0 on port 3306."}
                ]
            }
            // ... y así sucesivamente para cada hop
        ],
        // ...
    }
}
*/

// Network Access Analyzer es una herramienta poderosa para auditar y validar
// la postura de seguridad de tu red en AWS, especialmente en arquitecturas complejas.
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 2,
    'title_level': 'Seguridad a Nivel Empresarial',
    'topic': 'Compliance Avanzado',
    'subtopic': 'AWS Audit Manager',
    'definition': r'''
AWS Audit Manager es un servicio que te ayuda a recopilar automáticamente la evidencia de cumplimiento de AWS para tus auditorías. Simplifica la forma en que auditas el uso de AWS frente a estándares de la industria y regulaciones, ayudándote a preparar tus auditorías de forma más rápida y con menos esfuerzo manual.

No sé tú, pero a mí esto al principio me costó un poco entender su valor. Aquí te va la aclaración: Reunir evidencia para una auditoría (ej. SOC 2, HIPAA, GDPR) puede ser una tarea muy tediosa, manual y propensa a errores. Audit Manager automatiza gran parte de este proceso.

Audit Manager te permite seleccionar un marco de cumplimiento predefinido (ej. CIS AWS Foundations Benchmark, GDPR, HIPAA) o crear uno personalizado. Luego, recopila automáticamente la evidencia relevante de tus cuentas de AWS. Esta evidencia incluye configuraciones de recursos (de AWS Config), actividades de usuario (de AWS CloudTrail), y resultados de evaluaciones de AWS Security Hub. Organiza la evidencia en colecciones listas para auditorías, que puedes revisar y gestionar. Puedes agregar evidencia manual si es necesario, y también puedes delegar tareas a otros miembros de tu equipo. Una vez que la evidencia está lista, puedes exportarla a un paquete de evaluación que tus auditores pueden revisar fácilmente. Esto no solo acelera el ciclo de auditoría, sino que también te da confianza de que tus controles de AWS cumplen con los estándares requeridos. Es una herramienta esencial para mantener una postura de cumplimiento sólida en entornos regulados.
''',
    'code_example': r'''
// Ejemplo conceptual de cómo interactuar con AWS Audit Manager usando AWS CLI

// AWS Audit Manager se configura principalmente a través de su consola para
// crear evaluaciones y recopilar evidencia. No hay "código" directo para "usar"
// Audit Manager en el sentido de una aplicación, sino para gestionarlo.

// 1. Listar los marcos de cumplimiento disponibles en Audit Manager:
// aws auditmanager list-assessment-frameworks \
//    --framework-type "Standard"

// Ejemplo de la salida (simplificada):
/*
{
    "Frameworks": [
        {
            "Id": "arn:aws:auditmanager:us-east-1:aws:framework/aws-pci-dss-3.2.1",
            "Name": "PCI DSS 3.2.1"
        },
        {
            "Id": "arn:aws:auditmanager:us-east-1:aws:framework/aws-soc-2-type-2",
            "Name": "SOC 2 Type 2"
        }
    ]
}
*/

// 2. Crear una evaluación basada en un marco (conceptual):
// aws auditmanager create-assessment \
//    --name "MiEvaluacionSOC2" \
//    --description "Evaluación de cumplimiento SOC 2 para mi aplicación" \
//    --framework-id "arn:aws:auditmanager:us-east-1:aws:framework/aws-soc-2-type-2" \
//    --scope '{"AwsAccounts":[{"Id":"123456789012"}]}' \
//    --roles '{"roleType":"PROCESS_OWNER","roleArn":"arn:aws:iam::123456789012:role/AuditManagerProcessOwner"}' \
//    --tags 'Key=Environment,Value=Production'

// 3. Generar un paquete de evaluación para exportar la evidencia:
// aws auditmanager create-assessment-report \
//    --assessment-id "arn:aws:auditmanager:us-east-1:123456789012:assessment/asmt-xxxxxxxxxxxxxxxxx" \
//    --name "ReporteSOC2-Q1-2024"

// Audit Manager automatiza la recopilación de evidencia, lo que reduce
// significativamente el esfuerzo y el tiempo dedicado a las auditorías de cumplimiento.
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 2,
    'title_level': 'Seguridad a Nivel Empresarial',
    'topic': 'Compliance Avanzado',
    'subtopic': 'AWS Control Tower',
    'definition': r'''
AWS Control Tower es una herramienta que te ayuda a establecer y gobernar un entorno seguro y bien arquitecturado en la nube, especialmente si manejas múltiples cuentas de AWS. Piensa en ella como tu centro de comando para lanzar una "landing zone" o zona de aterrizaje segura, que es un entorno preconfigurado y listo para que despliegues tus cargas de trabajo. En el contexto de cumplimiento avanzado, Control Tower es fundamental porque aplica **guardrails** preventivos y detectivos que te ayudan a mantener el cumplimiento desde el día uno.

Seguramente pensarás de qué va todo esto. Bueno, cuando tu organización empieza a crecer y a usar más y más cuentas de AWS, la complejidad para mantener la seguridad, el cumplimiento y la gobernanza se dispara. Control Tower viene a solucionar ese dolor de cabeza.

Control Tower automatiza la configuración de una landing zone que sigue las mejores prácticas de AWS Well-Architected Framework. Esto incluye la creación de cuentas de AWS Organizations, la implementación de políticas de seguridad (Service Control Policies - SCPs), y la configuración de servicios como AWS CloudTrail para auditoría y AWS Config para monitoreo de cumplimiento. Te proporciona una interfaz de usuario simplificada para crear nuevas cuentas de AWS de forma segura (lo que se conoce como "account vending"), aplicar "guardrails" (mecanismos preventivos o detectivos para asegurar el cumplimiento) y monitorear el estado de tu entorno. Es una solución ideal para empresas que necesitan una base sólida y escalable para su presencia en la nube, garantizando que todas las cuentas cumplan con los estándares de seguridad y operacionales desde el día uno. En un nivel avanzado de cumplimiento, los **guardrails** de Control Tower son clave, ya que pueden denegar acciones que violarían el cumplimiento (preventivos) o alertar si ocurre una violación (detectivos).
''',
    'code_example': r'''
// Ejemplo conceptual de AWS Control Tower (repite el ejemplo anterior,
// pero enfatiza su rol en el cumplimiento)

// AWS Control Tower se gestiona principalmente a través de su consola
// o usando la API para automatizar tareas específicas, pero no hay
// un "código" directo para "usar" Control Tower en el sentido de una aplicación.
// Más bien, se trata de configurarlo para que provisione y gobierne tus cuentas.

// Sin embargo, aquí te mostramos cómo podrías interactuar con algunos
// de sus componentes o cómo se vería la salida de ciertas acciones,
// específicamente en el contexto de cumplimiento a través de "guardrails".

// 1. Un ejemplo de un "guardrail" detectivo que Control Tower podría aplicar.
//    Este guardrail podría detectar si un bucket S3 se hace público.
//    (Esto sería una regla de AWS Config, que Control Tower configura):

// aws configservice describe-config-rules --config-rule-names s3-bucket-public-read-prohibited

// 2. Un ejemplo de cómo ver los "guardrails" habilitados en tu landing zone
//    y su estado de cumplimiento:
// aws controltower list-enabled-controls \
//    --target-identifier "arn:aws:organizations::123456789012:ou/o-xxxxxxxx/ou-xxxx-xxxxxxxx"

// Ejemplo de salida (simplificada):
/*
{
    "EnabledControls": [
        {
            "ControlIdentifier": "arn:aws:controltower:us-east-1::control/AWS-GR-RESTRICT_S3_BUCKET_PUBLIC_READ_WRITE",
            "TargetIdentifier": "arn:aws:organizations::123456789012:ou/o-xxxxxxxx/ou-xxxx-xxxxxxxx",
            "Status": "SUCCEEDED"
        },
        {
            "ControlIdentifier": "arn:aws:controltower:us-east-1::control/AWS-GR-DENY_EC2_PUBLIC_IP",
            "TargetIdentifier": "arn:aws:organizations::123456789012:ou/o-xxxxxxxx/ou-xxxx-xxxxxxxx",
            "Status": "SUCCEEDED"
        }
    ]
}
*/

// 3. Un ejemplo de cómo provisionar una nueva cuenta a través de Control Tower
//    (esto se hace a través de su interfaz de "account vending" o API),
//    donde la cuenta ya nace con guardrails de cumplimiento aplicados:
// aws controltower provision-product --product-id "prod-xxxxxxxxxxxx" \
//    --provisioning-artifact-id "pa-xxxxxxxxxxxx" \
//    --path-id "path-xxxxxxxxxxxx" \
//    --provisioned-product-name "nueva-cuenta-compliant" \
//    --provisioning-parameters \
//        Key=AccountName,Value=NuevaCuentaCumplimiento \
//        Key=AccountEmail,Value=compliant@example.com

// Estos comandos ilustran la naturaleza de Control Tower como una herramienta
// de orquestación y gobernanza de alto nivel, crucial para el cumplimiento a escala.
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 2,
    'title_level': 'Seguridad a Nivel Empresarial',
    'topic': 'Compliance Avanzado',
    'subtopic': 'Custom Config Rules',
    'definition': r'''
Las Custom Config Rules (Reglas de AWS Config personalizadas) te permiten definir tus propias reglas de cumplimiento para evaluar si tus recursos de AWS cumplen con tus estándares de seguridad, operativos o de gobernanza específicos. Mientras que AWS Config ofrece muchas reglas gestionadas predefinidas, las reglas personalizadas te dan la flexibilidad de cubrir escenarios de cumplimiento muy particulares de tu organización.

No sé tú, pero a mí esto al principio me costó un poco diferenciarlo de las Managed Rules. Aquí te va la aclaración: Las Managed Rules son reglas genéricas proporcionadas por AWS; las Custom Config Rules son las que tú escribes para tus necesidades únicas.

Una Custom Config Rule se implementa típicamente como una función AWS Lambda. Esta función es invocada por AWS Config cuando un recurso cambia de estado (o de forma periódica) y evalúa si el recurso cumple con la lógica que has definido en la función Lambda. Por ejemplo, podrías escribir una regla personalizada para verificar que todas las instancias EC2 en una cuenta tienen una etiqueta específica, o que ningún Security Group tiene una regla de entrada "0.0.0.0/0" en ciertos puertos, o que los buckets S3 con un tag particular siempre tienen cifrado. Si la función Lambda determina que un recurso no cumple, la regla se marca como "NON_COMPLIANT" en el tablero de AWS Config, lo que te permite identificar rápidamente las desviaciones. Las Custom Config Rules son esenciales para entornos con requisitos de cumplimiento muy específicos, automatizando la auditoría de configuraciones y asegurando que tu infraestructura de AWS se mantenga alineada con tus políticas internas.
''',
    'code_example': r'''
// Ejemplo conceptual de una Custom Config Rule (función AWS Lambda en Python)

// Una Custom Config Rule se define con una función Lambda que evalúa el recurso
// y reporta el estado de cumplimiento.

// `config_rule_lambda.py` (ejemplo de función Lambda para una Custom Config Rule)
/*
import json
import boto3

APPLICABLE_RESOURCE_TYPES = ["AWS::EC2::Instance"] # Tipos de recursos que esta regla evalúa

def lambda_handler(event, context):
    invoking_event = json.loads(event['invokingEvent'])
    configuration_item = invoking_event['configurationItem']
    rule_parameters = json.loads(event['ruleParameters'])

    # Extraer el ResourceId del ConfigurationItem
    resource_id = configuration_item['resourceId']
    resource_type = configuration_item['resourceType']

    # Solo procesar los tipos de recursos aplicables
    if resource_type not in APPLICABLE_RESOURCE_TYPES:
        print(f"Skipping non-applicable resource type {resource_type}")
        return

    # Lógica de evaluación de la regla:
    # Ejemplo: Asegurarse de que las instancias EC2 tienen un tag "Environment"
    tags = configuration_item.get('tags', {})
    environment_tag = tags.get('Environment')

    compliance_status = "NON_COMPLIANT"
    annotation = f"La instancia {resource_id} no tiene la etiqueta 'Environment'."

    if environment_tag:
        # Aquí podrías añadir lógica para validar el valor de la etiqueta
        # Por simplicidad, solo verificamos su existencia
        compliance_status = "COMPLIANT"
        annotation = f"La instancia {resource_id} tiene la etiqueta 'Environment': {environment_tag}."

    # Enviar el resultado de cumplimiento a AWS Config
    config_client = boto3.client('config')
    config_client.put_evaluations(
        Evaluations=[
            {
                'ComplianceResourceType': resource_type,
                'ComplianceResourceId': resource_id,
                'ComplianceStatus': compliance_status,
                'Annotation': annotation,
                'OrderingTimestamp': configuration_item['configurationItemCaptureTime']
            },
        ],
        ResultToken=event['resultToken']
    )

    return {
        'statusCode': 200,
        'body': json.dumps('Evaluación completada')
    }
*/

// Para desplegar esta regla en AWS Config (conceptual, usando AWS CLI):
// aws configservice put-config-rule \
//    --config-rule-name "EC2-HasEnvironmentTag" \
//    --description "Verifica que las instancias EC2 tienen una etiqueta 'Environment'." \
//    --source '{"Owner":"CUSTOM_LAMBDA","SourceIdentifier":"arn:aws:lambda:us-east-1:123456789012:function:config-rule-lambda-function","EventSource":"aws.config","MessageType":"ConfigurationItemChangeNotification"}'

// Las Custom Config Rules son poderosas para adaptar AWS Config a tus
// requisitos de cumplimiento específicos.
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 2,
    'title_level': 'Seguridad a Nivel Empresarial',
    'topic': 'Compliance Avanzado',
    'subtopic': 'Automatización de compliance',
    'definition': r'''
La automatización del compliance (cumplimiento) en AWS se refiere a la aplicación de tecnologías y procesos para garantizar que tu infraestructura y tus operaciones en la nube cumplan continuamente con los requisitos regulatorios, los estándares de la industria y las políticas internas, con la mínima intervención manual. Va más allá de simplemente generar informes, buscando integrar la seguridad y el cumplimiento directamente en el ciclo de vida de desarrollo y operación.

Pensemos por un momento en: ¿Por qué no simplemente confiar en auditorías manuales periódicas? Aquí te va la aclaración: Los entornos en la nube cambian rápidamente. Las auditorías manuales son costosas, consumen mucho tiempo y solo proporcionan una "fotografía" en un momento dado, dejando vulnerabilidades abiertas entre auditorías.

La automatización de compliance utiliza una combinación de servicios de AWS para lograr una postura de cumplimiento continua. Esto incluye:
* **AWS Config**: Para monitorear continuamente la configuración de los recursos y evaluar su cumplimiento con reglas predefinidas o personalizadas (como las Custom Config Rules).
* **AWS CloudFormation / AWS CDK**: Para definir la infraestructura como código (IaC), asegurando que los recursos se desplieguen de forma consistente y conforme desde el principio.
* **AWS Security Hub**: Para agregar, organizar y priorizar los hallazgos de seguridad de varios servicios de AWS (Config, GuardDuty, Macie, etc.) y socios.
* **AWS Organizations y Service Control Policies (SCPs)**: Para establecer barreras preventivas a nivel de organización, asegurando que ciertas acciones no conformes no puedan realizarse en ninguna cuenta.
* **AWS Systems Manager Automation**: Para remediar automáticamente las no conformidades detectadas.
* **AWS Lambda**: Para crear funciones que reaccionen a eventos de incumplimiento y automaticen acciones correctivas.
* **AWS Audit Manager**: Para automatizar la recopilación de evidencia para las auditorías.

Al automatizar el compliance, las organizaciones pueden reducir significativamente el riesgo, acelerar la entrega de software, reducir la carga de auditoría y operar con mayor confianza en entornos dinámicos de la nube. Es un pilar fundamental de la estrategia de "Security by Design" y "Compliance as Code".
''',
    'code_example': r'''
// Ejemplo conceptual de automatización de compliance con AWS Config y Lambda

// Este ejemplo muestra cómo una regla de AWS Config detecta una no conformidad
// y una función Lambda de Systems Manager Automation remedia automáticamente el problema.

// Paso 1: Una Custom Config Rule detecta que un bucket S3 no está cifrado.
// (Ver `Custom Config Rules` subtopic para un ejemplo de la función Lambda de la regla).

// Paso 2: Configurar una regla de CloudWatch Events para que reaccione a un evento de no conformidad
// de AWS Config y dispare una función de Systems Manager Automation.

// 1. Configurar una regla de CloudWatch Events (ahora Amazon EventBridge) para una regla de Config:
// aws events put-rule \
//    --name "ConfigRuleNonCompliantEvent" \
//    --event-pattern '{"source":["aws.config"],"detail-type":["Config Rules Compliance Change"],"detail":{"configRuleName":["S3-BUCKET-ENCRYPTED"],"newEvaluationResult":{"complianceType":["NON_COMPLIANT"]}}}' \
//    --description "Dispara automatización para buckets S3 no cifrados"

// 2. Crear un documento de Systems Manager Automation para cifrar el bucket S3.
//    `encrypt_s3_bucket.yaml`
/*
description: Encrypts an S3 bucket.
schemaVersion: '0.3'
parameters:
  BucketName:
    type: String
    description: (Required) The name of the S3 bucket to encrypt.
mainSteps:
  - name: EncryptS3Bucket
    action: aws:executeAwsApi
    inputs:
      Service: s3
      Api: PutBucketEncryption
      Bucket: "{{ BucketName }}"
      ServerSideEncryptionConfiguration:
        Rules:
          - ApplyServerSideEncryptionByDefault:
              SSEAlgorithm: AES256
*/

// 3. Crear el destino de la regla de EventBridge para invocar la automatización de SSM.
// aws events put-targets \
//    --rule "ConfigRuleNonCompliantEvent" \
//    --targets "Id"="1", "Arn"="arn:aws:ssm:us-east-1:123456789012:document/encrypt_s3_bucket", "RoleArn"="arn:aws:iam::123456789012:role/AutomationExecutionRole", "InputTemplate"="{ \"BucketName\": \"$.detail.resourceId\" }"

// Este flujo automatizado permite que, cuando AWS Config detecta un bucket S3 no cifrado,
// automáticamente se ejecute un proceso para cifrarlo, garantizando el cumplimiento.
'''
  });
}

Future<void> insertSrLevel3AwsData(Database db) async {
  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Arquitectura Empresarial',
    'topic': 'Migración a Cloud',
    'subtopic': 'AWS Migration Hub',
    'definition': '''
AWS Migration Hub es un servicio centralizado que te permite monitorear y gestionar la migración de aplicaciones a AWS. Funciona como un panel de control donde puedes rastrear el progreso de tus migraciones, sin importar qué herramientas de AWS o de terceros estés utilizando.

Pensemos por un momento en lo que implica mover cientos de servidores a la nube. Sin una herramienta como Migration Hub, estarías navegando entre múltiples consolas y reportes, perdiendo visibilidad del panorama completo. Este servicio agrega datos de diversas fuentes, como AWS Application Discovery Service o Server Migration Service, para darte una vista unificada.

Detrás de escena, Migration Hub recopila métricas clave como el estado de las migraciones, recursos descubiertos y dependencias entre aplicaciones. Puedes crear grupos de aplicaciones para organizar tu estrategia de migración y definir hitos. Empresas como Siemens han utilizado este servicio para coordinar migraciones complejas a gran escala, reduciendo el tiempo de planificación en semanas.
''',
    'code_example': r'''
// Ejemplo de cómo integrar Migration Hub con AWS CLI para rastrear migraciones
aws migrationhub create-migration-task \
  --progress-update-stream "MyStream" \
  --migration-task-name "WebAppMigration" \
  --task "{\\"status\\":\\"IN_PROGRESS\\",\\"percentComplete\\":50}"

// Consultar estado de migración
aws migrationhub describe-migration-task \
  --progress-update-stream "MyStream" \
  --migration-task-name "WebAppMigration"
''',
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Arquitectura Empresarial',
    'topic': 'Migración a Cloud',
    'subtopic': 'AWS Application Discovery Service',
    'definition': '''
AWS Application Discovery Service es como un explorador minucioso que mapea tu infraestructura on-premise antes de migrar a la nube. Recopila datos detallados sobre servidores, redes y dependencias entre aplicaciones, creando un inventario completo de tu entorno actual.

Esto tiene una explicación importante: migrar sin entender las dependencias entre sistemas es como mover piezas de dominó sin saber cómo están conectadas. Application Discovery Service evita sorpresas desagradables revelando conexiones críticas entre servidores y aplicaciones.

El servicio opera de dos formas: el agente Discovery Agent se instala en servidores para recopilar datos de configuración y rendimiento, mientras que Discovery Connector recoge información de herramientas de virtualización como VMware. Los datos se almacenan en Migration Hub, donde puedes visualizar topologías de aplicaciones complejas. Empresas financieras lo usan para mapear entornos con cientos de servidores interconectados antes de planificar su transición a AWS.
''',
    'code_example': r'''
# Ejemplo de configuración del Discovery Agent en Linux
sudo ./install-discovery-agent \
  --region us-west-2 \
  --group-name "FinanceServers" \
  --activation-key "your-activation-key"

# Consultar servidores descubiertos via AWS CLI
aws discovery describe-continuous-exports \
  --max-results 10
''',
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Arquitecturas Distribuidas',
    'topic': 'Microservicios',
    'subtopic': 'Amazon ECS/EKS para microservicios',
    'definition': '''
Implementar microservicios en AWS requiere orquestación contenedorizada, y aquí es donde ECS (Elastic Container Service) y EKS (Elastic Kubernetes Service) entran en juego. Estos servicios permiten desplegar, escalar y gestionar microservicios como contenedores independientes pero coordinados.

La diferencia clave está en la abstracción: ECS ofrece una solución AWS-nativa más sencilla, mientras que EKS proporciona Kubernetes completo para quienes necesitan su ecosistema. Netflix, por ejemplo, usa EKS para gestionar miles de microservicios que requieren escalado automático basado en tráfico.

Con ECS/EKS, cada microservicio vive en su propio contenedor con recursos aislados. Puedes definir políticas de autoescalado por servicio, balanceo de carga granular y actualizaciones sin downtime. El secreto está en diseñar imágenes ligeras (como Alpine Linux) y configurar health checks precisos para que el orquestador sepa cuándo reiniciar instancias problemáticas.
''',
    'code_example': r'''
# Ejemplo de task definition para microservicio en ECS
{
  "family": "payment-service",
  "networkMode": "awsvpc",
  "executionRoleArn": "arn:aws:iam::123456789012:role/ecsTaskExecutionRole",
  "containerDefinitions": [
    {
      "name": "payment-api",
      "image": "account-id.dkr.ecr.region.amazonaws.com/payment-service:v1.2",
      "essential": true,
      "portMappings": [{ "containerPort": 8080, "protocol": "tcp" }],
      "environment": [
        { "name": "DB_HOST", "value": "payment-db.internal" },
        { "name": "LOG_LEVEL", "value": "INFO" }
      ],
      "healthCheck": {
        "command": ["CMD-SHELL", "curl -f http://localhost:8080/health || exit 1"],
        "interval": 30,
        "timeout": 5,
        "retries": 3
      }
    }
  ],
  "cpu": "1024",
  "memory": "2048"
}
''',
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Arquitecturas Distribuidas',
    'topic': 'Microservicios',
    'subtopic': 'Service Mesh con App Mesh',
    'definition': '''
AWS App Mesh es un service mesh que gestiona la comunicación entre microservicios mediante proxies Envoy. Resuelve desafíos complejos como enrutamiento avanzado, observabilidad distribuida y seguridad entre servicios sin modificar tu código.

Pensemos en esto: cuando tienes decenas de microservicios comunicándose, gestionar timeouts, retries o canary deployments se vuelve caótico. App Mesh introduce una capa de control que abstrae esta complejidad. Lyft emplea patrones similares para manejar 100+ microservicios con confiabilidad.

Configuras App Mesh definiendo virtual services (abstracciones lógicas), virtual nodes (representaciones de servicios reales) y routes (reglas de enrutamiento). Los proxies Envoy sidecar se encargan de implementar estas reglas, proporcionando métricas detalladas mediante CloudWatch y X-Ray. La magia está en cómo simplifica operaciones como migrar tráfico gradualmente entre versiones.
''',
    'code_example': r'''
# Definición de Virtual Node para App Mesh (YAML)
VirtualNode:
  - Name: checkout-service
    MeshName: ecommerce-mesh
    Spec:
      Listeners:
        - PortMapping:
            Port: 8080
            Protocol: http
      ServiceDiscovery:
        AWSCloudMap:
          NamespaceName: services.internal
          ServiceName: checkout
          Attributes:
            - Key: version
              Value: v2
      Backends:
        - VirtualService:
            VirtualServiceName: payment.service.local
''',
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Arquitecturas Distribuidas',
    'topic': 'Microservicios',
    'subtopic': 'Circuit Breaker pattern',
    'definition': '''
El patrón Circuit Breaker es un mecanismo de resiliencia que previene fallos en cascada cuando un microservicio falla repetidamente. AWS lo implementa mediante librerías como Resilience4j o directamente en App Mesh con políticas de retry.

Esto tiene una explicación técnica importante: en arquitecturas distribuidas, una dependencia lenta puede agotar recursos de toda la aplicación. El Circuit Breaker "abre" el circuito tras cierto umbral de fallos, desviando solicitudes a fallback mechanisms. Netflix Hystrix popularizó este patrón para manejar picos de tráfico.

En AWS, configuras circuit breakers definiendo umbrales de errores (como 5 fallos en 30 segundos) y timeout policies. Cuando se activa, puedes redirigir tráfico a una versión estable anterior o devolver respuestas cacheadas. La clave está en ajustar los thresholds según el SLA de cada servicio y monitorear estados mediante CloudWatch.
''',
    'code_example': r'''
// Ejemplo de Circuit Breaker en Java con Resilience4j
CircuitBreakerConfig config = CircuitBreakerConfig.custom()
    .failureRateThreshold(50)
    .waitDurationInOpenState(Duration.ofMillis(1000))
    .slidingWindowType(SlidingWindowType.COUNT_BASED)
    .slidingWindowSize(5)
    .build();

CircuitBreakerRegistry registry = CircuitBreakerRegistry.of(config);
CircuitBreaker circuitBreaker = registry.circuitBreaker("paymentService");

Supplier<String> decoratedSupplier = CircuitBreaker.decorateSupplier(
    circuitBreaker, 
    () -> paymentService.process(order) // Llamada riesgosa
);

Try.ofSupplier(decoratedSupplier)
    .recover(throwable -> "Fallback response") // Plan B
    .get();
''',
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Arquitecturas Distribuidas',
    'topic': 'Microservicios',
    'subtopic': 'Service Discovery',
    'definition': '''
El Service Discovery en AWS resuelve un problema fundamental: cómo encuentran los microservicios dinámicos entre sí en entornos efímeros donde las IPs cambian constantemente. AWS ofrece dos enfoques: Cloud Map para registros DNS y ECS/EKS integrados para discovery interno.

Vamos a profundizar: en lugar de hardcodear IPs o URLs, los servicios se registran con nombres lógicos ("payment-service.prod"). Amazon Cloud Map mantiene un registro actualizado de endpoints saludables, incluso para instancias que escalan automáticamente. Expedia gestiona así su ecosistema de 500+ microservicios.

Configuras Service Discovery definiendo namespaces (como "production.internal") y servicios. Cada tarea ECS o pod EKS puede registrarse automáticamente al iniciar. La ventaja clave es la integración con Health Checks: si un contenedor falla, se elimina del registro, evitando que el balanceador envíe tráfico a instancias no saludables.
''',
    'code_example': r'''
# Configuración de Service Discovery en ECS (CloudFormation)
PaymentService:
  Type: AWS::ECS::Service
  Properties:
    ServiceName: payment-service
    Cluster: !Ref ECSCluster
    TaskDefinition: !Ref PaymentTaskDefinition
    ServiceRegistries:
      - RegistryArn: !GetAtt ServiceDiscovery.RegistryArn
    DeploymentConfiguration:
      DeploymentCircuitBreaker:
        Enable: true
        Rollback: true

ServiceDiscovery:
  Type: AWS::ServiceDiscovery::Service
  Properties:
    Name: payment
    NamespaceId: !Ref PrivateNamespace
    DnsConfig:
      RoutingPolicy: MULTIVALUE
      DnsRecords:
        - Type: A
          TTL: 60
''',
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Arquitecturas Distribuidas',
    'topic': 'Event-driven Architectures',
    'subtopic': 'Amazon EventBridge avanzado',
    'definition': r'''
EventBridge es el servicio de event bus de AWS que lleva las arquitecturas dirigidas por eventos a otro nivel. Más allá de simples publicaciones, permite enrutamiento complejo basado en contenido, transformaciones en vuelo e integración con 90+ servicios SaaS.

Aquí está el detalle clave: EventBridge desacopla completamente productores de consumidores mediante un esquema centralizado. Puedes definir reglas como "cuando un pedido supere $1000 y venga de la región X, notificar al equipo de fraudes y al ERP". Fintechs como Monzo usan este patrón para procesar millones de transacciones diarias.

Las características avanzadas incluyen Archive (para replay de eventos), Schema Registry (para validación) y API Destinations (para integraciones HTTP). La potencia real está en cómo combinas múltiples buses para segregar flujos (p.ej., core-events vs audit-events) y aplicas filtros granulares antes de invocar Lambdas, Step Functions o SQS.
''',
    'code_example': r'''
# Regla avanzada de EventBridge con transformación
aws events put-rule \
  --name "HighValueOrders" \
  --event-pattern '{
    "source": ["com.orders.placed"],
    "detail-type": ["NewOrder"],
    "detail": {
      "amount": [{ "numeric": [">", 1000] }],
      "region": ["EMEA"]
    }
  }'

# Transformación de eventos antes de enviar a SQS
aws events put-targets \
  --rule "HighValueOrders" \
  --targets '[{
    "Id": "FraudQueue",
    "Arn": "arn:aws:sqs:us-east-1:123456789012:fraud-alerts",
    "InputTransformer": {
      "InputPathsMap": {
        "orderId": "$.detail.orderId",
        "customer": "$.detail.customerEmail"
      },
      "InputTemplate": "{\"alertType\":\"HIGH_VALUE\",\"id\":<orderId>,\"customer\":<customer>}"
    }
  }]'
''',
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Arquitecturas Distribuidas',
    'topic': 'Event-driven Architectures',
    'subtopic': 'Amazon SNS avanzado',
    'definition': '''
Amazon SNS (Simple Notification Service) avanzado va más allá de enviar SMS o emails. Es el núcleo de sistemas pub/sub escalables que permiten fan-out masivo a múltiples suscriptores con filtrado avanzado de mensajes.

La evolución de SNS es interesante: de ser un simple notificador, ahora soporta FIFO topics para orden garantizado, mensajes grandes (hasta 2GB) mediante S3, y filtrado basado en atributos. The New York Times lo usa para distribuir contenido a sus sistemas de caché global en milisegundos.

Configuraciones avanzadas incluyen políticas de reintento personalizadas, dead-letter queues para mensajes fallidos, y encriptación con claves KMS. Un patrón potente es combinar SNS con Lambda Destinations para procesar resultados asíncronos, o usar topicos FIFO cuando necesitas garantizar que las actualizaciones de estado lleguen en orden preciso.
''',
    'code_example': r'''
# Creación de topic SNS FIFO con filtrado avanzado
aws sns create-topic --name order-updates.fifo --attributes FifoTopic=true

# Suscripción con filtro por atributo
aws sns subscribe \
  --topic-arn arn:aws:sns:us-east-1:123456789012:order-updates.fifo \
  --protocol sqs \
  --notification-endpoint arn:aws:sqs:us-east-1:123456789012:inventory-updates \
  --attributes '{
    "FilterPolicy": "{\"status\":[\"SHIPPED\",\"DELIVERED\"],\"warehouse\":[\"EAST\"]}",
    "RedrivePolicy": "{\"deadLetterTargetArn\":\"arn:aws:sqs:us-east-1:123456789012:dlq\"}"
  }'

# Publicación con atributos personalizados
aws sns publish \
  --topic-arn arn:aws:sns:us-east-1:123456789012:order-updates.fifo \
  --message "Order #12345 shipped" \
  --message-group-id "order-12345" \
  --message-deduplication-id "ship-67890" \
  --message-attributes '{
    "status": { "DataType": "String", "StringValue": "SHIPPED" },
    "warehouse": { "DataType": "String", "StringValue": "EAST" }
  }'
''',
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Arquitecturas Distribuidas',
    'topic': 'Event-driven Architectures',
    'subtopic': 'Amazon SQS avanzado',
    'definition': '''
SQS (Simple Queue Service) avanzado es mucho más que colas básicas. Ofrece características empresariales como colas FIFO para orden garantizado, procesamiento por lotes, delay queues controlables y alta durabilidad con replicación entre AZs.

Esto tiene implicaciones profundas: las colas FIFO mantienen orden exacto (crucial para transacciones financieras) y evitan duplicados mediante deduplication IDs. Capital One procesa así millones de transacciones bancarias con consistencia garantizada.

Las técnicas avanzadas incluyen usar Visibility Timeouts para evitar reprocesamiento prematuro, Dead Letter Queues para aislar mensajes problemáticos, y Lambda Event Source Mappings para consumo serverless. Un truco profesional es combinar SQS con SNS para patrones fan-out donde múltiples sistemas consumen el mismo mensaje con sus propias colas dedicadas.
''',
    'code_example': r'''
# Creación de cola FIFO con configuración avanzada
aws sqs create-queue \
  --queue-name transactions.fifo \
  --attributes '{
    "FifoQueue": "true",
    "ContentBasedDeduplication": "false",
    "VisibilityTimeout": "300",
    "RedrivePolicy": "{
      \"deadLetterTargetArn\":\"arn:aws:sqs:us-east-1:123456789012:dlq\",
      \"maxReceiveCount\":\"3\"
    }"
  }'

# Envío de mensaje con deduplication ID
aws sqs send-message \
  --queue-url https://sqs.us-east-1.amazonaws.com/123456789012/transactions.fifo \
  --message-body "{\"txId\":\"tx-123\",\"amount\":150.00}" \
  --message-group-id "account-456" \
  --message-deduplication-id "tx-123-001"

# Configuración de Lambda para procesar por lotes
aws lambda create-event-source-mapping \
  --function-name ProcessTransactions \
  --batch-size 10 \
  --maximum-batching-window-in-seconds 30 \
  --event-source-arn arn:aws:sqs:us-east-1:123456789012:transactions.fifo
''',
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Arquitecturas Distribuidas',
    'topic': 'Event-driven Architectures',
    'subtopic': 'Patrón Saga',
    'definition': '''
El patrón Saga maneja transacciones distribuidas de larga duración mediante una serie de pasos compensables. En AWS, se implementa típicamente con Step Functions para orquestación o combinando SQS/Lambda para coreografía.

La complejidad surge cuando necesitas atomicidad entre múltiples servicios sin bloqueos distribuidos. Una Saga divide la transacción en sub-operaciones, cada una con su correspondiente acción de compensación. Expedia coordina así reservas de vuelos, hoteles y autos que pueden tardar minutos en completarse.

Step Functions es ideal para Sagas orquestadas, permitiendo definir flujos como "reservar vuelo → si falla → cancelar hotel". Para Sagas coreografiadas, cada servicio publica eventos (via EventBridge) que desencadenan los siguientes pasos. La clave está en diseñar compensaciones idempotentes y mecanismos de reconciliación para casos de fallo parcial.
''',
    'code_example': r'''
// Saga orquestada con Step Functions (ASL)
{
  "Comment": "Reserva de viaje - Patrón Saga",
  "StartAt": "ReservarVuelo",
  "States": {
    "ReservarVuelo": {
      "Type": "Task",
      "Resource": "arn:aws:lambda:us-east-1:123456789012:function:reservar-vuelo",
      "Next": "ReservarHotel",
      "Catch": [
        {
          "ErrorEquals": ["States.TaskFailed"],
          "Next": "CompensarVuelo"
        }
      ]
    },
    "ReservarHotel": {
      "Type": "Task",
      "Resource": "arn:aws:lambda:us-east-1:123456789012:function:reservar-hotel",
      "Next": "ReservarAuto",
      "Catch": [
        {
          "ErrorEquals": ["States.TaskFailed"],
          "Next": "CompensarHotel"
        }
      ]
    },
    "CompensarVuelo": {
      "Type": "Task",
      "Resource": "arn:aws:lambda:us-east-1:123456789012:function:cancelar-vuelo",
      "End": true
    },
    "CompensarHotel": {
      "Type": "Task",
      "Resource": "arn:aws:lambda:us-east-1:123456789012:function:cancelar-hotel",
      "Next": "CompensarVuelo"
    }
  }
}
''',
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Arquitecturas Distribuidas',
    'topic': 'Serverless Avanzado',
    'subtopic': 'Lambda layers',
    'definition': '''
Las Lambda layers son una característica fascinante que te permite empaquetar librerías, runtimes personalizados y otros recursos en un solo archivo, para luego adjuntarlos a tus funciones Lambda. Esto es super útil para mantener tus funciones más pequeñas y reutilizar código entre ellas.

Ahora, pensemos un momento en la utilidad de todo esto. Imagina que tienes varias funciones Lambda que usan la misma librería de procesamiento de imágenes o el mismo conector de base de datos. Sin las layers, tendrías que incluir esa librería en el paquete de despliegue de cada función, lo que aumentaría su tamaño y haría más lento el despliegue.

Con las capas, solo subes la librería una vez a una capa y luego simplemente "adjuntas" esa capa a todas las funciones que la necesiten. Esto no solo reduce el tamaño de tus paquetes de despliegue, sino que también facilita la gestión de dependencias y la actualización de librerías. Si una librería tiene una nueva versión, solo actualizas la capa, y todas las funciones que la usan se benefician de la actualización automáticamente. Es una forma muy eficiente de manejar tus dependencias en el mundo serverless, permitiéndote construir arquitecturas más limpias y mantenibles.
''',
    'code_example': r'''
// Ejemplo de cómo una función Lambda usaría una librería de una capa
// (Este es un ejemplo conceptual, la implementación real varía según el runtime)

// Supongamos que tenemos una capa llamada 'my-utility-layer' que contiene
// una librería para manipulación de cadenas (ej. Apache Commons Lang en Java)

// En tu código Lambda (por ejemplo, en Python)
import json
import os
// Si tu capa añade un directorio al PYTHONPATH, puedes importarlo directamente
// import my_custom_utility_module 

def lambda_handler(event, context):
    # Asumiendo que 'my_custom_utility_module' está disponible gracias a la capa
    # print(my_custom_utility_module.reverse_string("Hello Layers!")) 
    
    message = "Hello from Lambda!"
    
    # Un ejemplo más concreto si la capa incluye una librería externa ya conocida
    # Por ejemplo, si la capa tiene la librería requests para Python
    try:
        import requests
        response = requests.get("https://www.example.com")
        print(f"Status Code: {response.status_code}")
    except ImportError:
        print("Requests library not found. Make sure it's in a Lambda Layer.")

    return {
        'statusCode': 200,
        'body': json.dumps('Function executed successfully!')
    }

// Para crear la capa (usando AWS CLI):
// aws lambda publish-layer-version \
//   --layer-name my-utility-layer \
//   --description "My custom utility layer" \
//   --zip-file fileb://layer.zip \
//   --compatible-runtimes python3.8 nodejs14.x

// Para adjuntar la capa a una función Lambda (usando AWS CLI):
// aws lambda update-function-configuration \
//   --function-name MyLambdaFunction \
//   --layers arn:aws:lambda:REGION:ACCOUNT_ID:layer:my-utility-layer:1
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Arquitecturas Distribuidas',
    'topic': 'Serverless Avanzado',
    'subtopic': 'Provisioned Concurrency',
    'definition': '''
Provisioned Concurrency en AWS Lambda es una característica que te permite mantener tus funciones "calientes" y listas para responder inmediatamente. Sin ella, cuando una función Lambda no ha sido invocada por un tiempo, entra en un estado "frío". La primera vez que se invoca después de estar fría, hay una pequeña demora mientras AWS inicializa el entorno de ejecución, descarga el código y realiza otras configuraciones. A esto se le conoce como "cold start" o "arranque en frío".

Seguramente te preguntas por qué esto importa. Para muchas aplicaciones, un pequeño retraso de unos cientos de milisegundos puede no ser un problema. Sin embargo, para aplicaciones sensibles a la latencia, como APIs en tiempo real, sistemas de trading, o interfaces de usuario interactivas, los "cold starts" pueden afectar negativamente la experiencia del usuario. Por ejemplo, en una aplicación web, un cold start podría significar que un usuario tiene que esperar un segundo o dos más para que una página cargue, lo cual puede ser frustrante.

Aquí te va la aclaración: Provisioned Concurrency te permite especificar un número de instancias de tu función Lambda que siempre estarán pre-inicializadas y listas para procesar solicitudes. Esto elimina los "cold starts" para esas invocaciones, asegurando que tus usuarios experimenten una latencia mínima y consistente. Es como tener un equipo de tus funciones siempre despierto y listo para la acción, garantizando un rendimiento óptimo cuando la velocidad es crucial. Ten en cuenta que, a diferencia de las invocaciones "bajo demanda" del Free Tier, la concurrencia aprovisionada tiene un costo, ya que estás reservando recursos de antemano.
''',
    'code_example': r'''
// No hay un ejemplo de código directo para "Provisioned Concurrency"
// ya que es una configuración que se aplica a la función Lambda.
// Se configura a través de la consola de AWS, AWS CLI, o CloudFormation.

// Ejemplo usando AWS CLI para configurar Provisioned Concurrency:
// Este comando configura 500 unidades de concurrencia aprovisionada
// para la versión $LATEST de tu función Lambda.

// aws lambda put-provisioned-concurrency-config \
//   --function-name MyLambdaFunction \
//   --qualifier $LATEST \
//   --provisioned-concurrent-executions 500

// Ejemplo para una versión específica de la función:
// aws lambda put-provisioned-concurrency-config \
//   --function-name MyLambdaFunction \
//   --qualifier 1 \
//   --provisioned-concurrent-executions 100

// Ejemplo de cómo verificar la configuración de Provisioned Concurrency:
// aws lambda get-provisioned-concurrency-config \
//   --function-name MyLambdaFunction \
//   --qualifier $LATEST

// Consideraciones importantes:
// - La concurrencia aprovisionada se aplica a una versión o alias específico de tu función.
// - Pagas por el tiempo que la concurrencia aprovisionada está configurada,
//   incluso si no hay invocaciones a la función.
// - Es ideal para funciones con patrones de tráfico predecibles
//   y requisitos de baja latencia.
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Arquitecturas Distribuidas',
    'topic': 'Serverless Avanzado',
    'subtopic': 'Lambda Destinations',
    'definition': '''
Lambda Destinations es una característica genial que te permite especificar a dónde quieres que Lambda envíe el resultado de una invocación asíncrona, ya sea exitosa o fallida. Antes de Destinations, manejar las respuestas y los errores de invocaciones asíncronas de Lambda requería configurar colas SQS, temas SNS o configurar CloudWatch Events para capturar los errores, lo que añadía complejidad.

¿Te estás preguntando por qué esto importa? Cuando invocas una función Lambda de forma asíncrona (por ejemplo, a través de S3, SNS o directamente con un evento), la invocación se pone en una cola interna. La función se ejecuta y, si todo va bien, termina. Pero, ¿qué pasa si falla? O ¿cómo consumes el resultado si es exitosa? Sin Destinations, necesitabas mecanismos adicionales para manejar estos escenarios, lo que podía volverse un poco enredado con la lógica de reintentos y el manejo de errores.

Con Lambda Destinations, puedes configurar directamente un destino para los eventos exitosos y otro para los eventos fallidos. Puedes enviar los resultados a un tema SNS, una cola SQS, otra función Lambda, o incluso a EventBridge. Esto simplifica enormemente el diseño de arquitecturas basadas en eventos y el manejo de flujos de trabajo asíncronos, porque no necesitas escribir código adicional para manejar las respuestas o los errores después de la invocación. Es como decirle a Lambda: "Oye, cuando termines, pase lo que pase, envía la información aquí y aquí", lo que te ahorra mucho trabajo y hace tus arquitecturas mucho más robustas y fáciles de entender.
''',
    'code_example': r'''
// No hay un ejemplo de código directo para "Lambda Destinations"
// dentro de la función Lambda, ya que es una configuración
// de la función misma. Se configura a través de la consola de AWS,
// AWS CLI, o CloudFormation.

// Ejemplo de cómo configurar Lambda Destinations usando AWS CLI:

// Configurar un destino SQS para invocaciones exitosas
// aws lambda update-function-configuration \
//   --function-name MyAsyncLambdaFunction \
//   --function-url-config '{"InvokeMode": "BUFFERED", "AuthType": "NONE", "Cors": {"AllowCredentials": false, "AllowHeaders": ["content-type"], "AllowMethods": ["*"], "AllowOrigins": ["*"]}}' \
//   --destination-config '{
//       "OnSuccess": {
//           "Destination": "arn:aws:sqs:REGION:ACCOUNT_ID:MySuccessQueue"
//       },
//       "OnFailure": {
//           "Destination": "arn:aws:sns:REGION:ACCOUNT_ID:MyFailureTopic"
//       }
//   }'

// La función Lambda en sí solo se enfoca en su lógica de negocio:
exports.handler = async (event) => {
    try {
        // Simular una operación exitosa
        const result = {
            message: "Operation successful!",
            data: event
        };
        console.log("Function executed successfully:", result);
        return result; // Este resultado será enviado al destino OnSuccess
    } catch (error) {
        // Simular una operación fallida
        console.error("Function execution failed:", error);
        throw new Error("Failed to process event."); // Este error será enviado al destino OnFailure
    }
};

// En este ejemplo, el objeto de retorno de la función (en caso de éxito)
// o el error (en caso de fallo) serán enviados automáticamente
// a la cola SQS o al tema SNS configurado como destino.
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Arquitecturas Distribuidas',
    'topic': 'Serverless Avanzado',
    'subtopic': 'Observabilidad serverless',
    'definition': '''
La observabilidad serverless se refiere a la capacidad de entender y diagnosticar el comportamiento de tus aplicaciones construidas con tecnologías serverless, como AWS Lambda, API Gateway, DynamoDB, etc. En un entorno serverless, donde no gestionas los servidores, es crucial tener herramientas y prácticas que te permitan ver qué está pasando con tus funciones, cómo están interactuando entre sí y con otros servicios, y si hay algún problema de rendimiento o errores.

Esto tiene una explicación, y es que en las arquitecturas serverless, tus funciones son efímeras y gestionadas por el proveedor de la nube. No puedes simplemente iniciar sesión en un servidor para revisar los logs o el uso de CPU. Las aplicaciones serverless a menudo se componen de muchas funciones pequeñas que interactúan de maneras complejas, lo que hace que la depuración y el monitoreo sean un desafío si no tienes la estrategia correcta.

Aquí la clave: La observabilidad serverless se logra combinando métricas (como el número de invocaciones, errores, latencia), logs (registros detallados de lo que sucede dentro de tus funciones) y trazas (el camino que sigue una solicitud a través de múltiples servicios). Servicios como Amazon CloudWatch, AWS X-Ray y Amazon EventBridge son fundamentales para esto. CloudWatch te da métricas y logs agregados. X-Ray te permite seguir una solicitud de principio a fin a través de múltiples componentes serverless y de microservicios, lo que es increíblemente útil para identificar cuellos de botella o puntos de fallo. Implementar una buena estrategia de observabilidad te permite detectar problemas rápidamente, entender la causa raíz y optimizar el rendimiento de tus aplicaciones serverless, asegurando que tus usuarios tengan una experiencia fluida.
''',
    'code_example': r'''
// No hay un "código de observabilidad" que se ejecute directamente
// en una función Lambda como tal. La observabilidad se implementa
// mediante la instrumentación (logs, métricas, trazas) dentro del código
// y la configuración de servicios de monitoreo.

// Ejemplo de una función Lambda simple con logging (CloudWatch Logs)
const AWS = require('aws-sdk');
const comprehend = new AWS.Comprehend();

exports.handler = async (event) => {
    console.log("Received event:", JSON.stringify(event, null, 2)); // Esto irá a CloudWatch Logs

    const params = {
        LanguageCode: 'en', /* required */
        Text: event.text || 'Default text for analysis' /* required */
    };

    try {
        const data = await comprehend.detectSentiment(params).promise();
        console.log("Sentiment analysis result:", JSON.stringify(data, null, 2)); // Más logs
        return {
            statusCode: 200,
            body: JSON.stringify(data),
        };
    } catch (error) {
        console.error("Error during sentiment analysis:", error); // Logs de errores
        throw error; // Lanzar el error para que CloudWatch detecte un fallo
    }
};

// Para trazas con AWS X-Ray, se requiere configurar el SDK de X-Ray
// y habilitar el tracing en la configuración de la función Lambda.

// Ejemplo de configuración de X-Ray en Node.js Lambda:
// const AWS = require('aws-sdk');
// const AWSXRay = require('aws-xray-sdk'); // Instalar el SDK de X-Ray

// // Envuelve los clientes de AWS para que X-Ray trace las llamadas
// AWSXRay.captureAWS(AWS);

// exports.handler = async (event) => {
//     // ... tu lógica de negocio ...
//     // Las llamadas a servicios de AWS (ej. s3.getObject()) serán automáticamente trazadas por X-Ray
// };

// Habilitar X-Ray en la consola de AWS o con AWS CLI:
// aws lambda update-function-configuration \
//   --function-name MyLambdaFunction \
//   --tracing-config Mode=Active
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Arquitecturas Distribuidas',
    'topic': 'Caching Strategies',
    'subtopic': 'Amazon ElastiCache avanzado',
    'definition': '''
Amazon ElastiCache es un servicio de caché en memoria completamente administrado que facilita la implementación, operación y escalado de cachés en la nube. En un nivel avanzado, ElastiCache va más allá de ser un simple almacenamiento de clave-valor. Nos permite optimizar el rendimiento de nuestras aplicaciones web y móviles al recuperar información de cachés en memoria de alta velocidad, en lugar de depender únicamente de bases de datos más lentas y costosas.

Ahora, pensemos por un momento en la importancia de esto. Cuando tienes una aplicación con mucho tráfico, las solicitudes a la base de datos pueden convertirse en un cuello de botella. Esto no solo ralentiza la respuesta de la aplicación, sino que también aumenta la carga en tu base de datos, lo que puede llevar a problemas de escalabilidad y costos elevados.

Aquí te va la aclaración: Amazon ElastiCache soporta dos motores de caché de código abierto muy populares: Redis y Memcached. Redis ofrece características avanzadas como persistencia de datos, replicación, clustering, soporte para estructuras de datos complejas (listas, sets, hashes), y la capacidad de actuar como un broker de mensajes. Memcached, por otro lado, es más simple, ideal para casos de uso de caching puro y fácil de escalar horizontalmente. A nivel avanzado, no solo se trata de poner datos en caché, sino de diseñar estrategias de caché inteligentes: cómo invalidar la caché, cómo mantener la consistencia entre la caché y la base de datos subyacente, y cómo aprovechar las capacidades de clustering para manejar grandes volúmenes de datos y tráfico. Las empresas más grandes, como la que usa la aplicación que probablemente usas para pedir comida o el sitio web que visitas para ver videos, usan cachés extensivamente para asegurar que miles o millones de usuarios puedan acceder a la información rápidamente sin sobrecargar sus sistemas backend.
''',
    'code_example': r'''
// Ejemplo conceptual de uso de ElastiCache (Redis) con un cliente en Java
// Esto asume que tienes un cliente Jedis o similar configurado.

// import redis.clients.jedis.Jedis;

public class ElastiCacheAdvancedExample {

    // private static final String REDIS_HOST = "your-elasticache-cluster.xxxxxx.clustercfg.usw2.cache.amazonaws.com";
    // private static final int REDIS_PORT = 6379;

    public static void main(String[] args) {
        // En un entorno real, la conexión debería ser gestionada por un pool
        // y con mecanismos de reintento.
        // Jedis jedis = new Jedis(REDIS_HOST, REDIS_PORT);

        try {
            // System.out.println("Conectado a ElastiCache (Redis)!");

            // // Ejemplo de caché de lectura (Cache-Aside Pattern)
            // String userId = "user:123";
            // String userData = jedis.get(userId); // Intentar obtener de caché

            // if (userData == null) {
            //     System.out.println("Datos no encontrados en caché. Obteniendo de la base de datos...");
            //     // Simular una llamada a la base de datos
            //     userData = getUserFromDatabase(userId);
            //     if (userData != null) {
            //         jedis.setex(userId, 3600, userData); // Almacenar en caché por 1 hora
            //         System.out.println("Datos de usuario guardados en caché.");
            //     }
            // } else {
            //     System.out.println("Datos de usuario obtenidos de caché: " + userData);
            // }

            // // Ejemplo de una operación avanzada con Redis (por ejemplo, una lista)
            // jedis.lpush("recent_activities", "user:123 logged in");
            // jedis.lpush("recent_activities", "user:456 viewed product X");
            // List<String> activities = jedis.lrange("recent_activities", 0, 9);
            // System.out.println("Últimas actividades: " + activities);

        } catch (Exception e) {
            System.err.println("Error al interactuar con ElastiCache: " + e.getMessage());
            // Manejo de errores adecuado
        } finally {
            // if (jedis != null) {
            //     jedis.close();
            // }
        }
    }

    private static String getUserFromDatabase(String userId) {
        // Simulación de una llamada a la base de datos
        try {
            Thread.sleep(500); // Simula un retraso de la DB
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
        return "{\"id\": \"" + userId + "\", \"name\": \"John Doe\", \"email\": \"john.doe@example.com\"}";
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Arquitecturas Distribuidas',
    'topic': 'Caching Strategies',
    'subtopic': 'DAX para DynamoDB',
    'definition': '''
DAX, que significa DynamoDB Accelerator, es un servicio de caché totalmente administrado, de alta disponibilidad y compatible con la API de Amazon DynamoDB. Su objetivo principal es acelerar el rendimiento de tus lecturas de DynamoDB, especialmente para aplicaciones con patrones de tráfico intensivo de lectura. DAX funciona como una capa de caché en memoria frente a tus tablas de DynamoDB, lo que significa que en lugar de que tus aplicaciones hagan solicitudes directamente a DynamoDB, las hacen a DAX.

Seguramente pensarás de qué va todo esto... DynamoDB es increíblemente rápido, pero para casos de uso con un volumen de lectura extremadamente alto y patrones de acceso repetitivos, incluso DynamoDB puede ver incrementos en la latencia y costos si se excede la capacidad provisionada o se realizan muchas lecturas de elementos pequeños y calientes.

Aquí te va la aclaración: DAX está diseñado para ser una solución de "plug-and-play" que reduce drásticamente los tiempos de respuesta de milisegundos a microsegundos para operaciones de lectura. Cuando una aplicación solicita datos, DAX primero verifica su caché. Si los datos están allí, los devuelve inmediatamente (cache hit), lo que es súper rápido. Si no están (cache miss), DAX los busca en DynamoDB, los almacena en su caché y luego los devuelve a la aplicación. Además, DAX también maneja la invalidación de la caché, ya que es consciente de los cambios en la base de datos subyacente. Esto lo hace ideal para casos de uso como juegos en línea, aplicaciones de comercio electrónico y cualquier sistema que requiera una latencia de lectura extremadamente baja y picos de tráfico intensos. La magia de DAX es que es compatible con la API de DynamoDB, lo que significa que puedes cambiar tus aplicaciones para usar DAX con cambios mínimos en el código.
''',
    'code_example': r'''
// Ejemplo conceptual de cómo una aplicación Java usaría DAX con el SDK de AWS
// Esto asume que tienes el SDK de AWS para Java y el SDK de DAX configurado.

// import com.amazonaws.services.dynamodbv2.AmazonDynamoDB;
// import com.amazonaws.services.dynamodbv2.model.GetItemRequest;
// import com.amazonaws.services.dynamodbv2.model.GetItemResult;
// import com.amazon.dax.AmazonDaxClientBuilder;

// import java.util.HashMap;
// import java.util.Map;

public class DaxForDynamoDBExample {

    // private static final String DAX_ENDPOINT = "your-dax-cluster-endpoint.xxxxxx.dax-clusters.us-west-2.amazonaws.com";
    // private static final String TABLE_NAME = "MyProductTable";
    // private static final String PRIMARY_KEY_NAME = "ProductId";

    public static void main(String[] args) {
        // Configurar el cliente DAX
        // AmazonDynamoDB client = AmazonDaxClientBuilder.standard()
        //         .withEndpointConfiguration(DAX_ENDPOINT)
        //         .build();

        try {
            // String productId = "P12345";
            // Map<String, com.amazonaws.services.dynamodbv2.model.AttributeValue> key = new HashMap<>();
            // key.put(PRIMARY_KEY_NAME, new com.amazonaws.services.dynamodbv2.model.AttributeValue().withS(productId));

            // GetItemRequest request = new GetItemRequest()
            //         .withTableName(TABLE_NAME)
            //         .withKey(key);

            // System.out.println("Intentando obtener el item de DAX...");
            // GetItemResult result = client.getItem(request);

            // if (result.getItem() != null) {
            //     System.out.println("Item obtenido de DAX/DynamoDB: " + result.getItem());
            // } else {
            //     System.out.println("Item no encontrado.");
            // }

            // // Para un ejemplo real, se mediría el tiempo de respuesta
            // // para ver el beneficio de DAX.
            // // DAX cachea automáticamente las lecturas. Las escrituras van directamente a DynamoDB
            // // y DAX se encarga de invalidar la caché cuando se modifican los datos.

        } catch (Exception e) {
            System.err.println("Error al interactuar con DAX/DynamoDB: " + e.getMessage());
        } finally {
            // if (client != null) {
            //     client.shutdown();
            // }
        }
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Arquitecturas Distribuidas',
    'topic': 'Caching Strategies',
    'subtopic': 'Cache invalidation patterns',
    'definition': '''
Los patrones de invalidación de caché son estrategias que usamos para asegurarnos de que los datos en nuestra caché se mantengan actualizados y consistentes con la fuente de datos original (generalmente una base de datos). Piénsalo así: la caché es una copia temporal de los datos para que sean más rápidos de acceder. Pero, ¿qué pasa si el dato original cambia? Si la caché sigue sirviendo la versión antigua, tu aplicación mostrará información desactualizada, lo cual es un problema.

No sé tú, pero a mí esto al principio me costó entenderlo bien. La clave es que no queremos servir datos "stale" (obsoletos), pero tampoco queremos invalidar la caché tan a menudo que pierda su propósito de acelerar las cosas. Es un equilibrio delicado.

Aquí te va la aclaración: existen varios patrones para abordar esto. Uno común es el **"Write-Through"** (escritura a través), donde cada vez que escribes datos en la base de datos, también los escribes en la caché. Esto asegura que la caché siempre tenga los datos más recientes. Otro es el **"Write-Back"** (escritura aplazada), donde los datos se escriben primero en la caché y luego se escriben en la base de datos de forma asíncrona; esto es súper rápido para escrituras, pero hay un riesgo de pérdida de datos si la caché falla antes de la escritura a la DB. Para la invalidación de lecturas, el patrón **"Cache-Aside"** (cache al lado) es popular: la aplicación primero intenta leer de la caché; si no está, lee de la base de datos y luego actualiza la caché. Cuando se modifican los datos, la aplicación es responsable de eliminar explícitamente el elemento de la caché. También existe la invalidación basada en TTL (Time-To-Live), donde los elementos de la caché expiran automáticamente después de un cierto tiempo. Elegir el patrón correcto depende de tus requisitos de consistencia, latencia y volumen de datos. Las aplicaciones de redes sociales, por ejemplo, deben equilibrar la inmediatez de la información con la eficiencia de la caché, usando una combinación de estas estrategias para mantener los feeds actualizados.
''',
    'code_example': r'''
// Ejemplo conceptual de un patrón de invalidación (Cache-Aside con invalidación explícita)
// usando un hipotético cliente de caché y una base de datos.

// import com.example.cache.CacheClient; // Suponemos una interfaz para el cliente de caché
// import com.example.database.DatabaseClient; // Suponemos una interfaz para el cliente de base de datos

public class CacheInvalidationExample {

    // private CacheClient cacheClient;
    // private DatabaseClient dbClient;

    // public CacheInvalidationExample(CacheClient cacheClient, DatabaseClient dbClient) {
    //     this.cacheClient = cacheClient;
    //     this.dbClient = dbClient;
    // }

    public String getUserData(String userId) {
        // 1. Intentar leer de la caché
        // String userData = cacheClient.get(userId);
        // if (userData != null) {
        //     System.out.println("Datos obtenidos de la caché para usuario: " + userId);
        //     return userData;
        // }

        // 2. Si no está en caché, leer de la base de datos
        // System.out.println("Datos no encontrados en caché. Obteniendo de la base de datos...");
        // userData = dbClient.getUserFromDatabase(userId);

        // 3. Almacenar en caché para futuras solicitudes
        // if (userData != null) {
        //     cacheClient.put(userId, userData);
        //     System.out.println("Datos de usuario '" + userId + "' cargados en caché.");
        // }
        // return userData;
        return "Simulated user data";
    }

    public void updateUserData(String userId, String newData) {
        // 1. Actualizar la base de datos
        // dbClient.updateUserInDatabase(userId, newData);
        // System.out.println("Datos de usuario '" + userId + "' actualizados en la base de datos.");

        // 2. Invalidar (eliminar) el item de la caché para forzar una recarga en la próxima lectura
        // cacheClient.invalidate(userId);
        // System.out.println("Item de caché para usuario '" + userId + "' invalidado.");
    }

    // Ejemplo de un patrón incorrecto (no invalidar la caché después de una actualización)
    public void updateUserDataIncorrect(String userId, String newData) {
        // dbClient.updateUserInDatabase(userId, newData);
        // System.out.println("Datos de usuario '" + userId + "' actualizados en la base de datos. (Caché no invalidada)");
        // Esto dejaría datos obsoletos en la caché si no se invalida.
    }

    // Interfaz hipotética de cliente de caché y DB para el ejemplo
    // interface CacheClient {
    //     String get(String key);
    //     void put(String key, String value);
    //     void invalidate(String key);
    // }

    // interface DatabaseClient {
    //     String getUserFromDatabase(String userId);
    //     void updateUserInDatabase(String userId, String newData);
    // }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Arquitecturas Distribuidas',
    'topic': 'Caching Strategies',
    'subtopic': 'Multi-layer caching',
    'definition': '''
El caching de múltiples capas, o "multi-layer caching", es una estrategia avanzada donde se utilizan varias capas de caché en diferentes puntos de una arquitectura para optimizar aún más la velocidad de acceso a los datos. En lugar de tener una única caché, se distribuyen las cachés más cerca del cliente y en diferentes niveles de la aplicación o la infraestructura.

¿Te estás preguntando por qué esto importa? Una sola caché, aunque efectiva, puede tener sus limitaciones. Si el cliente está geográficamente lejos de la caché, la latencia de red sigue siendo un factor. Además, una única caché puede convertirse en un punto de contención si el tráfico es extremadamente alto, o si se necesita almacenar una cantidad masiva de datos.

Aquí te va la aclaración: una estrategia de caché de múltiples capas aborda estos problemas creando una jerarquía. Por ejemplo, podrías tener una capa de caché muy cerca del usuario final, como una CDN (Content Delivery Network) para archivos estáticos o resultados de API comunes. Esta sería la "caché de borde". Luego, más cerca de tu lógica de aplicación, podrías tener una caché distribuida en memoria (como Amazon ElastiCache) que almacene datos de uso frecuente. Finalmente, tu base de datos también podría tener su propia caché interna o una caché dedicada (como DAX para DynamoDB) para operaciones de lectura intensivas. Cada capa sirve a un propósito específico, reduciendo la latencia y la carga en las capas inferiores. Por ejemplo, una solicitud podría ser respondida por la CDN, si no, por ElastiCache, y si aún no está allí, finalmente por la base de datos (quizás acelerada por DAX). Esta superposición de cachés asegura que la mayoría de las solicitudes se resuelvan lo más rápido posible y reduce significativamente la presión sobre los servicios de backend más costosos o con mayor latencia. Piensa en cómo servicios como Netflix o Spotify entregan contenido a millones de usuarios: no es solo una base de datos, sino una orquestación de múltiples cachés en todo el mundo.
''',
    'code_example': r'''
// No hay un ejemplo de código "multi-layer caching" como tal,
// ya que es un concepto arquitectónico que implica la interacción
// de múltiples componentes de caché y servicios.

// En su lugar, ilustramos la idea a través de la secuencia de acceso.

// Pseudocódigo de cómo una solicitud podría fluir a través de múltiples cachés:

// Funcion para obtener datos de producto
// public Product getProductData(String productId) {

//     // Capa 1: Caché de borde (CDN o caché de gateway API)
//     // if (CDN.hasCachedData(productId)) {
//     //     return CDN.getData(productId);
//     // }

//     // Capa 2: Caché en memoria distribuida (ej. Amazon ElastiCache)
//     // Product product = ElastiCacheClient.get("product:" + productId);
//     // if (product != null) {
//     //     System.out.println("Obtenido de ElastiCache");
//     //     return product;
//     // }

//     // Capa 3: Caché de base de datos (ej. DAX para DynamoDB o caché interna de RDS)
//     // product = DaxDynamoDBClient.getProduct(productId);
//     // if (product != null) {
//     //     System.out.println("Obtenido de DAX/DB Cache");
//     //     // Opcional: Almacenar en ElastiCache si no estaba
//     //     // ElastiCacheClient.put("product:" + productId, product);
//     //     return product;
//     // }

//     // Capa 4: Base de datos principal
//     // product = DatabaseClient.getProduct(productId);
//     // System.out.println("Obtenido de la Base de Datos principal");
//     // if (product != null) {
//     //     // Opcional: Almacenar en ElastiCache y DAX si no estaba
//     //     // ElastiCacheClient.put("product:" + productId, product);
//     //     // DaxDynamoDBClient.putProduct(productId, product); // DAX lo hace automáticamente al leer
//     // }
//     // return product;
//     return new Product("Simulated Product");
// }

// Clase de ejemplo para Producto
class Product {
    String id;
    String name;

    public Product(String id) {
        this.id = id;
        this.name = "Product " + id;
    }

    @Override
    public String toString() {
        return "Product{id='" + id + "', name='" + name + "'}";
    }
}
'''
  });
}

Future<void> insertSrLevel4AwsData(Database db) async {
  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 4,
    'title_level': 'DevOps Avanzado',
    'topic': 'GitOps en AWS',
    'subtopic': 'AWS Proton',
    'definition': '''
AWS Proton es un servicio de implementación de aplicaciones totalmente administrado para equipos de contenedores y sin servidor. Suena complejo, ¿verdad? En esencia, Proton te ayuda a estandarizar y automatizar el aprovisionamiento de infraestructura y el despliegue de código para tus microservicios y aplicaciones, especialmente en entornos donde tienes muchos equipos trabajando en diferentes servicios.

Vamos a ver de qué se trata todo esto... En muchas organizaciones, a medida que crecen, los equipos de desarrollo necesitan lanzar nuevos servicios o características rápidamente. Esto a menudo implica que cada equipo tenga que configurar su propia infraestructura (bases de datos, colas, contenedores, funciones Lambda, etc.) y pipelines de CI/CD. Esto puede ser un proceso repetitivo, propenso a errores y que consume mucho tiempo, además de que la infraestructura puede volverse inconsistente entre los equipos.

Aquí te va la aclaración: AWS Proton resuelve este problema permitiendo a los equipos de plataforma (o DevOps) crear "plantillas" estandarizadas para la infraestructura y los pipelines. Estas plantillas definen cómo se deben aprovisionar y desplegar los servicios. Los equipos de desarrollo, entonces, simplemente eligen una plantilla de servicio y Proton se encarga de aprovisionar toda la infraestructura necesaria y configurar el pipeline de CI/CD automáticamente. Esto garantiza la consistencia, acelera el desarrollo, reduce la carga operativa y permite que los desarrolladores se centren en escribir código en lugar de gestionar la infraestructura. Es como tener un "catálogo" de servicios pre-aprobados y listos para usar, con toda la complejidad de la infraestructura abstraída para los desarrolladores.
''',
    'code_example': r'''
// AWS Proton se gestiona principalmente a través de la consola de AWS,
// AWS CLI, o CloudFormation, definiendo plantillas.
// No hay un código de aplicación directo que interactúe con Proton en tiempo de ejecución.

// Ejemplo conceptual de cómo se vería una plantilla de servicio (YAML para CloudFormation/Proton)
// Esto es simplificado y representa un fragmento de lo que AWS Proton esperaría.

/*
// proton-service-template.yaml
AWSTemplateFormatVersion: '2010-09-09'
Description: AWS Proton Service Template for a web service

Resources:
  Service:
    Type: AWS::Proton::ServiceTemplate
    Properties:
      Name: my-web-service-template
      DisplayName: "Web Service with Fargate"
      Description: "A standard web service deployed on AWS Fargate."
      PipelineConfig:
        Template: # Referencia a una plantilla de pipeline
          Name: my-standard-pipeline
          MajorVersion: "1.0"
      Inputs: # Parámetros que el desarrollador puede configurar
        - Name: desired_cpu
          Type: Number
          Description: "CPU units for the Fargate task."
          Default: 256
        - Name: desired_memory
          Type: Number
          Description: "Memory (MB) for the Fargate task."
          Default: 512
        - Name: dockerfile
          Type: String
          Description: "Path to the Dockerfile in the source repository."
          Default: "Dockerfile"

// Luego, los desarrolladores usarían la CLI de Proton para desplegar
// un nuevo servicio basado en esta plantilla:
// aws proton create-service \
//   --name my-new-web-app \
//   --template-major-version 1 \
//   --template-minor-version 0 \
//   --template-name my-web-service-template \
//   --cli-input-json '{ "parameters": [{"key": "desired_cpu", "value": "512"}] }'
*/

// Este ejemplo muestra cómo los equipos de plataforma definen los estándares,
// y los equipos de desarrollo consumen esos estándares para acelerar sus despliegues.
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 4,
    'title_level': 'DevOps Avanzado',
    'topic': 'GitOps en AWS',
    'subtopic': 'AWS CDK',
    'definition': '''
El AWS Cloud Development Kit (CDK) es un framework de código abierto para definir tus recursos de infraestructura en la nube usando lenguajes de programación conocidos como TypeScript, Python, Java, C# y Go. En lugar de escribir plantillas de CloudFormation (YAML o JSON) directamente, con CDK escribes código para describir tu infraestructura, y luego el CDK "sintetiza" esas definiciones en plantillas de CloudFormation, que son las que finalmente se despliegan en AWS.

Seguramente te estás preguntando por qué esto importa. Las plantillas de CloudFormation son poderosas, pero pueden volverse bastante grandes y difíciles de manejar a medida que tu infraestructura crece. Escribir YAML o JSON repetidamente para recursos similares o para aplicar lógica compleja puede ser tedioso y propenso a errores. Además, la programación imperativa que ofrecen los lenguajes de programación tradicionales te permite usar bucles, condicionales, funciones y abstracciones para crear plantillas de infraestructura más dinámicas y reutilizables.

Aquí te va la aclaración: AWS CDK cambia el juego de la Infraestructura como Código (IaC). Te permite usar las herramientas de desarrollo con las que ya estás familiarizado, como IDEs, depuradores y pruebas unitarias, para construir tu infraestructura. Esto significa que puedes aplicar principios de ingeniería de software a tu infraestructura, como la modularidad, la reutilización de código y la composición. Por ejemplo, puedes crear "constructs" reutilizables que encapsulen patrones de infraestructura comunes (como una función Lambda con una API Gateway y una tabla DynamoDB asociada), y luego tus equipos pueden usar esos constructs en sus propias aplicaciones, lo que acelera el desarrollo y garantiza la consistencia. Empresas como la que creó tu aplicación de streaming de video favorita probablemente usen herramientas de IaC para gestionar su vasta infraestructura, y el CDK es una excelente opción para eso en AWS.
''',
    'code_example': r'''
// Ejemplo conceptual de AWS CDK en TypeScript (el mismo concepto aplica a Java)
// Este código define una función Lambda y una tabla DynamoDB.

/*
// lib/my-app-stack.ts
import * as cdk from 'aws-cdk-lib';
import * as lambda from 'aws-cdk-lib/aws-lambda';
import * as dynamodb from 'aws-cdk-lib/aws-dynamodb';
import { Construct } from 'constructs';

export class MyAppStack extends cdk.Stack {
  constructor(scope: Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    // Define una tabla DynamoDB
    const myTable = new dynamodb.Table(this, 'MyTable', {
      partitionKey: { name: 'id', type: dynamodb.AttributeType.STRING },
      billingMode: dynamodb.BillingMode.PAY_PER_REQUEST, // Pagamos por uso
      removalPolicy: cdk.RemovalPolicy.DESTROY, // Eliminar la tabla al destruir el stack (¡cuidado en producción!)
    });

    // Define una función AWS Lambda
    const myLambda = new lambda.Function(this, 'MyHandler', {
      runtime: lambda.Runtime.NODEJS_18_X, // Entorno de ejecución
      handler: 'index.handler', // Archivo y función de entrada
      code: lambda.Code.fromAsset('lambda-handler'), // Ruta al código de la función
      environment: {
        TABLE_NAME: myTable.tableName, // Pasar el nombre de la tabla como variable de entorno
      },
    });

    // Otorgar permisos a la función Lambda para leer/escribir en la tabla DynamoDB
    myTable.grantReadWriteData(myLambda);
  }
}

// lambda-handler/index.js (código de la función Lambda)
// const AWS = require('aws-sdk');
// const docClient = new AWS.DynamoDB.DocumentClient();

// exports.handler = async (event) => {
//   const tableName = process.env.TABLE_NAME;
//   const params = {
//     TableName: tableName,
//     Key: { id: '123' }
//   };

//   try {
//     const data = await docClient.get(params).promise();
//     console.log('Successfully retrieved item:', data.Item);
//     return {
//       statusCode: 200,
//       body: JSON.stringify(data.Item),
//     };
//   } catch (err) {
//     console.error('Error', err);
//     return {
//       statusCode: 500,
//       body: JSON.stringify({ error: err.message }),
//     };
//   }
// };
*/

// Para desplegar este stack, se usaría `cdk deploy` después de compilar.
// El CDK convertiría este código en una plantilla de CloudFormation y la desplegaría.
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 4,
    'title_level': 'DevOps Avanzado',
    'topic': 'GitOps en AWS',
    'subtopic': 'Terraform en AWS',
    'definition': '''
Terraform es una herramienta de código abierto de HashiCorp para construir, cambiar y versionar la infraestructura de manera segura y eficiente. Es una herramienta de "Infraestructura como Código" (IaC) que te permite definir tus recursos de infraestructura (servidores, bases de datos, redes, etc.) en archivos de configuración declarativos. Luego, Terraform genera un plan de ejecución para alcanzar el estado deseado y lo aplica a la infraestructura.

No sé tú, pero a mí esto al principio me costó 🤯 entenderlo bien. La idea principal es que defines lo que quieres que tu infraestructura sea, y Terraform se encarga de cómo llegar a ese estado, ya sea en AWS, Azure, Google Cloud o incluso en tu propio centro de datos.

Aquí te va la aclaración: A diferencia de herramientas específicas de la nube como CloudFormation (para AWS) o ARM Templates (para Azure), Terraform es "agnóstico a la nube". Esto significa que puedes usar el mismo lenguaje y flujo de trabajo para gestionar recursos en múltiples proveedores de nube, lo cual es una ventaja enorme para organizaciones que operan en entornos híbridos o multi-nube. En el contexto de AWS, Terraform se comunica con las APIs de AWS para provisionar y gestionar recursos como instancias EC2, buckets S3, bases de datos RDS, funciones Lambda y mucho más. Utiliza un lenguaje de configuración llamado HCL (HashiCorp Configuration Language), que es fácil de leer y escribir. Puedes modularizar tu infraestructura, crear componentes reutilizables y gestionar el estado de tu infraestructura para evitar "drift" (cuando la infraestructura real difiere de tu configuración definida). Muchas empresas grandes y startups confían en Terraform para gestionar su infraestructura a escala, ya que les permite automatizar despliegues, replicar entornos y mantener un control de versiones de toda su infraestructura.
''',
    'code_example': r'''
// Ejemplo conceptual de un archivo de configuración de Terraform para AWS
// (main.tf)

/*
// Define el proveedor de AWS
provider "aws" {
  region = "us-east-1" # Región de AWS
}

// Crea una instancia EC2 de tipo t2.micro
resource "aws_instance" "web_server" {
  ami           = "ami-0abcdef1234567890" # ID de la AMI de Amazon Linux 2 (ejemplo)
  instance_type = "t2.micro"             # Tipo de instancia
  tags = {
    Name = "MyWebServer"                # Etiqueta para la instancia
  }
}

// Crea un bucket S3
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-application-bucket-12345" # El nombre del bucket debe ser globalmente único
  acl    = "private"                              # Acceso privado

  tags = {
    Environment = "Development"
  }
}

// Un ejemplo incorrecto o a evitar (hardcoding credenciales en el código)
// provider "aws" {
//   access_key = "YOUR_ACCESS_KEY" // ¡NO HACER ESTO EN PRODUCCIÓN!
//   secret_key = "YOUR_SECRET_KEY" // ¡NO HACER ESTO EN PRODUCCIÓN!
// }
*/

// Para aplicar esta configuración:
// 1. `terraform init`   (Inicializa el directorio de trabajo, descarga el proveedor de AWS)
// 2. `terraform plan`   (Muestra un plan de los cambios que Terraform realizará)
// 3. `terraform apply`  (Ejecuta el plan y provisiona los recursos en AWS)
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 4,
    'title_level': 'DevOps Avanzado',
    'topic': 'GitOps en AWS',
    'subtopic': 'Crossplane',
    'definition': '''
Crossplane es un framework de código abierto que extiende Kubernetes para gestionar y aprovisionar infraestructura desde cualquier proveedor de nube o sistema on-premises. En pocas palabras, te permite usar el mismo lenguaje declarativo de Kubernetes (YAML) para definir y controlar recursos externos a tu clúster de Kubernetes, como bases de datos en la nube, colas de mensajes, buckets de almacenamiento, ¡y más!

Esto tiene una explicación, y es que hoy en día, muchas aplicaciones se despliegan en Kubernetes, pero a menudo dependen de servicios externos que están fuera del clúster, como bases de datos en la nube (RDS, DynamoDB), servicios de mensajería (SQS, Kafka) o servicios de caché (ElastiCache). Gestionar estos recursos externos generalmente implica usar herramientas separadas, como las CLI de los proveedores de nube, Terraform, o la consola web, lo que rompe la experiencia de "controlarlo todo desde Kubernetes".

Aquí te va la aclaración: Crossplane trae la "API de la nube" directamente a tu clúster de Kubernetes. Lo hace a través de Custom Resource Definitions (CRDs) y controladores que entienden cómo interactuar con los APIs de los diferentes proveedores de nube. Esto significa que un desarrollador o un equipo de DevOps puede simplemente crear un archivo YAML en Kubernetes para solicitar, por ejemplo, una base de datos RDS, y Crossplane se encargará de aprovisionarla en AWS. Esto es la esencia de GitOps llevado a un nuevo nivel: tu código de infraestructura (en YAML) reside en tu repositorio Git, y Kubernetes (a través de Crossplane) se asegura de que el estado real de tu infraestructura coincida con lo que está definido en Git. Es como tener un "panel de control unificado" para toda tu infraestructura, tanto dentro como fuera de Kubernetes, lo que simplifica enormemente la gestión y la automatización, especialmente en entornos híbridos o multi-nube.
''',
    'code_example': r'''
// Ejemplo conceptual de cómo definir un recurso de AWS RDS usando Crossplane
// (my-rds-instance.yaml)

/*
apiVersion: rds.aws.crossplane.io/v1beta1
kind: DBInstance
metadata:
  name: my-app-db
spec:
  forProvider:
    region: us-east-1
    dbInstanceClass: db.t3.micro
    masterUsername: admin
    masterUserPasswordSecretRef:
      name: rds-master-password
      key: password
    engine: postgres
    engineVersion: "13.5"
    skipFinalSnapshotBeforeDelete: true # ¡Cuidado en producción!
    publiclyAccessible: false
    allocatedStorage: 20
  writeConnectionSecretToRef:
    name: my-app-db-connection
    namespace: default
*/

// Este archivo YAML se aplicaría a un clúster de Kubernetes donde Crossplane
// y el proveedor de AWS para Crossplane estén instalados:
// kubectl apply -f my-rds-instance.yaml

// Crossplane entonces aprovisionaría una instancia RDS de PostgreSQL en AWS
// con las especificaciones dadas.

// El secret 'rds-master-password' contendría la contraseña, y Crossplane
// crearía un secret 'my-app-db-connection' con los detalles de conexión
// para que la aplicación en Kubernetes pueda usarla.

// Este ejemplo ilustra cómo Crossplane permite que los desarrolladores
// soliciten recursos de infraestructura externa usando la misma API de Kubernetes.
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 4,
    'title_level': 'DevOps Avanzado',
    'topic': 'Pipeline Avanzados',
    'subtopic': 'Multi-region deployments',
    'definition': '''
Los despliegues multi-región, o "multi-region deployments", se refieren a la práctica de desplegar tu aplicación o servicio en múltiples regiones geográficas de la nube. En lugar de tener toda tu infraestructura en una sola ubicación (por ejemplo, solo en el este de EE. UU.), la duplicas o distribuyes en varias regiones (como este de EE. UU., Europa y Asia).

Ahora, pensemos por un momento en la utilidad de todo esto. ¿Por qué querrías complicarte la vida desplegando en varias regiones? La razón principal es la resiliencia y la disponibilidad. Si una región completa de la nube sufre una interrupción importante (lo cual es raro, pero posible), tu aplicación seguiría funcionando en las otras regiones. Esto es crucial para aplicaciones críticas que no pueden permitirse ningún tiempo de inactividad, como los servicios bancarios en línea o las plataformas de streaming.

Aquí te va la aclaración: Además de la resiliencia, los despliegues multi-región también pueden mejorar la latencia para tus usuarios. Si tienes usuarios en diferentes partes del mundo, servirles desde una región más cercana geográficamente reducirá el tiempo que tardan los datos en viajar de un lado a otro, mejorando significativamente la experiencia del usuario. Implementar un despliegue multi-región implica desafíos como la replicación de datos (cómo mantener las bases de datos sincronizadas entre regiones), el enrutamiento del tráfico (cómo dirigir a los usuarios a la región más cercana o saludable) y la gestión de la consistencia. Esto puede hacerse de varias maneras, desde un enfoque activo-pasivo (una región está activa, las otras en espera) hasta activo-activo (todas las regiones están sirviendo tráfico simultáneamente). Empresas como Amazon (con su propio e-commerce) o Google (con sus servicios globales) utilizan estas estrategias a gran escala para garantizar que sus servicios estén siempre disponibles y sean rápidos para millones de usuarios en todo el mundo.
''',
    'code_example': r'''
// No hay un ejemplo de código directo para "Multi-region deployments"
// ya que es un concepto arquitectónico y de despliegue que implica
// la configuración de recursos en múltiples regiones.

// Sin embargo, podemos ilustrar la idea de cómo se podría configurar
// una aplicación simple para ser desplegada en múltiples regiones
// utilizando herramientas de Infraestructura como Código (IaC).

// Ejemplo conceptual usando pseudocódigo o un fragmento de IaC (ej. Terraform)
/*
// main.tf (o un archivo similar para definir la infraestructura)

// Define el proveedor de AWS para la región 1
provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

// Define el proveedor de AWS para la región 2
provider "aws" {
  alias  = "eu_west_1"
  region = "eu-west-1"
}

// Módulo o recurso para desplegar una aplicación web en la región de EE. UU.
module "web_app_us" {
  source = "./modules/web_app" # Ruta a tu módulo de aplicación web
  providers = {
    aws = aws.us_east_1
  }
  app_name = "my-global-app-us"
  # ... otras configuraciones específicas de la aplicación
}

// Módulo o recurso para desplegar la misma aplicación web en la región de la UE
module "web_app_eu" {
  source = "./modules/web_app" # Reutiliza el mismo módulo
  providers = {
    aws = aws.eu_west_1
  }
  app_name = "my-global-app-eu"
  # ... otras configuraciones específicas de la aplicación
}

// modules/web_app/main.tf (ejemplo simplificado de un módulo de aplicación web)
// resource "aws_instance" "app_server" {
//   ami           = "ami-..."
//   instance_type = "t2.micro"
//   tags = {
//     Name = var.app_name
//   }
// }
// resource "aws_lb" "app_lb" {
//   name               = "${var.app_name}-lb"
//   internal           = false
//   load_balancer_type = "application"
//   # ...
// }
// variable "app_name" {}
*/

// Adicionalmente, para enrutar el tráfico a la región más cercana, se usaría
// un servicio como Amazon Route 53 con políticas de enrutamiento basadas en latencia
// o geolocalización.
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 4,
    'title_level': 'DevOps Avanzado',
    'topic': 'Pipeline Avanzados',
    'subtopic': 'Canary deployments automatizados',
    'definition': '''
Los despliegues canary, o "canary deployments", son una estrategia de despliegue de software que te permite lanzar una nueva versión de tu aplicación a un pequeño subconjunto de usuarios o servidores antes de que esté disponible para todos. Piénsalo como el "canario en la mina de carbón": si el canario muere (la nueva versión tiene problemas), sabes que no es seguro enviar a los mineros (el resto de los usuarios).

Seguramente te estás preguntando por qué esto importa. Cuando lanzas una nueva versión de tu aplicación, siempre existe el riesgo de introducir errores o regresiones que podrían afectar a todos tus usuarios. Un despliegue tradicional "big bang" (donde la nueva versión reemplaza completamente a la antigua de una vez) es arriesgado. Si hay un problema, afecta a todos y la reversión puede ser complicada.

Aquí te va la aclaración: Los despliegues canary te permiten mitigar ese riesgo. Empiezas por dirigir un pequeño porcentaje del tráfico (por ejemplo, el 1-5%) a la nueva versión. Monitoreas de cerca el rendimiento, los errores, la latencia y el comportamiento del usuario para este grupo "canario". Si todo se ve bien después de un período de observación, gradualmente aumentas el tráfico a la nueva versión hasta que el 100% de los usuarios la estén usando. Si detectas problemas, puedes revertir rápidamente el tráfico al 100% a la versión antigua con un impacto mínimo para la mayoría de tus usuarios. La automatización es clave aquí: herramientas de CI/CD, junto con servicios de monitoreo y enrutamiento de tráfico (como AWS CodeDeploy con un balanceador de carga o un API Gateway), pueden orquestar este proceso de manera segura y eficiente, permitiéndote liberar nuevas características con confianza y reducir el estrés en los equipos de operaciones. Grandes empresas que necesitan un despliegue continuo de características, como plataformas de redes sociales o servicios de comercio electrónico, usan despliegues canary extensivamente para asegurar que sus actualizaciones no afecten negativamente la experiencia del usuario.
''',
    'code_example': r'''
// Los despliegues canary son una estrategia orquestada a nivel de pipeline CI/CD
// y con servicios de enrutamiento de tráfico (Load Balancers, API Gateway).
// No hay un código de aplicación directo para un despliegue canary en sí.

// Sin embargo, podemos ilustrar los puntos clave del proceso
// en pseudocódigo o con referencias a herramientas.

// Ejemplo conceptual de un pipeline de despliegue canary automatizado:

/*
// FASE 1: Construir y Probar (tradicional)
// - Obtener código de Git
// - Ejecutar pruebas unitarias, de integración, de seguridad
// - Construir artefacto (ej. imagen Docker, ZIP de Lambda)
// - Almacenar artefacto (ej. ECR, S3)

// FASE 2: Despliegue Canary
// - Paso 1: Desplegar la nueva versión (V2) en un pequeño subconjunto de instancias
//          o dirigir un pequeño % del tráfico a V2 usando un Load Balancer (ej. ALB)
//          o un API Gateway (ej. con Lambda Aliases/Weights).

// Pseudocódigo de configuración de enrutamiento de tráfico (ej. en un Load Balancer)
// function deploy_canary_traffic(new_version_target_group, old_version_target_group, percentage_to_new) {
//     // Configurar el Listener del Load Balancer para enviar 'percentage_to_new'
//     // del tráfico a new_version_target_group y el resto a old_version_target_group.
//     // Ejemplo para ALB:
//     // Update Listener Rule (Actions: forward to new_target_group with weight X,
//     //                         forward to old_target_group with weight 100-X)
// }

// - Paso 2: Monitoreo (durante un tiempo definido o hasta que métricas sean estables)
//   - Verificar métricas de rendimiento (latencia, errores, CPU, memoria)
//   - Monitorear logs (buscar errores o anomalías)
//   - Si se detectan problemas:
//     - revert_traffic_to_old_version(old_version_target_group); // Revertir al 100% a la versión antigua
//     - notify_on_failure();
//     - exit_pipeline_with_failure();
//   - Si todo está bien:
//     - proceed_to_next_phase();

// FASE 3: Despliegue Completo (si canary fue exitoso)
// - Paso 1: Incrementar gradualmente el tráfico a la nueva versión (V2)
//          hasta alcanzar el 100% del tráfico.
// - Paso 2: Descomisionar la versión antigua (V1) si ya no es necesaria.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 4,
    'title_level': 'DevOps Avanzado',
    'topic': 'Pipeline Avanzados',
    'subtopic': 'Blue/Green deployments automatizados',
    'definition': '''
Los despliegues Blue/Green, o "Blue/Green deployments", son una estrategia de despliegue de software que minimiza el tiempo de inactividad y reduce el riesgo al tener dos entornos de producción idénticos y separados: uno "Blue" (el actual, que está en vivo) y uno "Green" (la nueva versión, que está en preparación). Cuando estás listo para lanzar una nueva versión, la despliegas en el entorno "Green" mientras el entorno "Blue" sigue sirviendo el tráfico a los usuarios.

No sé tú, pero a mí esto al principio me costó 🤯. La clave es que no estás actualizando la infraestructura en sitio, sino que estás creando una nueva infraestructura con la nueva versión y luego conmutando el tráfico. Esto lo hace super seguro.

Aquí te va la aclaración: Una vez que el entorno "Green" ha sido probado y verificado para que funcione correctamente con la nueva versión, simplemente cambias el enrutamiento del tráfico (por ejemplo, actualizando un balanceador de carga o un DNS) para que apunte del entorno "Blue" al "Green". Si surge algún problema con la nueva versión, puedes revertir el tráfico rápidamente al entorno "Blue" (que sigue intacto y funcionando con la versión anterior) con un tiempo de inactividad mínimo o nulo. Esto es diferente de un despliegue "in-place" que actualiza los servidores existentes, lo que puede ser más lento y arriesgado. El entorno "Blue" se mantiene como una opción de "rollback" hasta que estés seguro de que la nueva versión es estable, o puede ser desmantelado si todo va bien. Esta estrategia es ampliamente utilizada por empresas con altas demandas de disponibilidad y que necesitan lanzar actualizaciones frecuentes sin afectar la experiencia del usuario, ya que proporciona una forma muy segura de liberar nuevas versiones y reduce el estrés de los equipos de operaciones.
''',
    'code_example': r'''
// Los despliegues Blue/Green son una estrategia a nivel de arquitectura y pipeline CI/CD.
// El código de la aplicación no cambia, pero la forma en que se despliega sí.

// Aquí un ejemplo conceptual de cómo se orquestaría un despliegue Blue/Green
// utilizando un balanceador de carga (ej. AWS Elastic Load Balancer / ALB)
// y grupos de Auto Scaling.

// Pseudocódigo del proceso de despliegue Blue/Green:

/*
// Supongamos que tenemos dos Target Groups para el ALB:
// - Blue_TG (apunta a las instancias/servicios de la versión actual V1)
// - Green_TG (apunta a las instancias/servicios de la nueva versión V2)

// FASE 1: Desplegar nueva versión en entorno Green
// - Crear un nuevo grupo de Auto Scaling (ASG_Green) con la nueva versión de la aplicación (V2).
// - Asociar ASG_Green al Green_TG.
// - Realizar pruebas automatizadas en el entorno Green (pruebas de integración, rendimiento, etc.).
//   Si las pruebas fallan:
//     - Eliminar ASG_Green y Green_TG.
//     - Notificar fallo y detener el pipeline.

// FASE 2: Conmutar el tráfico
// - Actualizar la regla del Listener del ALB para dirigir el 100% del tráfico del Blue_TG al Green_TG.
//   // Ejemplo con AWS CLI para ALB:
//   // aws elbv2 modify-listener \
//   //   --listener-arn "arn:aws:elasticloadbalancing:..." \
//   //   --default-actions Type=forward,TargetGroupArn=arn:aws:elasticloadbalancing:...:targetgroup/Green_TG

// FASE 3: Monitoreo Post-Despliegue
// - Monitorear el entorno Green en producción.
//   Si se detectan problemas graves:
//     - Revertir el tráfico: Actualizar la regla del Listener del ALB
//       para dirigir el 100% del tráfico de vuelta al Blue_TG.
//       // aws elbv2 modify-listener \
//       //   --listener-arn "arn:aws:elasticloadbalancing:..." \
//       //   --default-actions Type=forward,TargetGroupArn=arn:aws:elasticloadbalancing:...:targetgroup/Blue_TG
//     - Notificar revertido.
//   Si todo está estable después de un período:
//     - Desmantelar el entorno Blue (ASG_Blue y sus instancias).
//     - Opcional: renombrar Green a Blue para el siguiente ciclo.
*/

// La ventaja clave es que el rollback es instantáneo al cambiar el puntero del tráfico.
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 4,
    'title_level': 'DevOps Avanzado',
    'topic': 'Pipeline Avanzados',
    'subtopic': 'Feature flags a escala',
    'definition': '''
Los "feature flags", también conocidos como "feature toggles" o "feature switches", son una técnica de desarrollo que te permite activar o desactivar funcionalidades de tu aplicación sin necesidad de desplegar nuevo código. Piensa en ellos como interruptores en tu código: puedes encender o apagar una característica en tiempo real, incluso después de que la aplicación esté en producción.

No sé tú, pero a mí esto al principio me costó 🤯 entenderlo bien. La idea es que el código para una nueva funcionalidad está en tu aplicación, pero su visibilidad o comportamiento está controlado por una configuración externa.

Aquí te va la aclaración: A escala, los feature flags se vuelven increíblemente poderosos para varias cosas. Primero, te permiten desacoplar el despliegue de código del lanzamiento de características. Puedes desplegar código nuevo varias veces al día con características deshabilitadas, y luego activarlas para diferentes grupos de usuarios o en diferentes momentos. Esto es fundamental para el **despliegue continuo**. Segundo, facilitan las pruebas A/B, donde puedes mostrar diferentes versiones de una característica a distintos segmentos de usuarios para ver cuál funciona mejor. Tercero, son una herramienta de mitigación de riesgos: si una nueva característica causa problemas en producción, simplemente la desactivas con un flag sin tener que revertir un despliegue completo. Cuarto, permiten los "canary releases" de una manera más granular, donde puedes activar una característica solo para un pequeño porcentaje de usuarios antes de un lanzamiento completo. La gestión de feature flags a escala a menudo implica un servicio centralizado (como AWS AppConfig o herramientas de terceros como LaunchDarkly) que administra el estado de los flags y los distribuye a tus aplicaciones. Empresas como Facebook o Google utilizan esta técnica masivamente para experimentar, lanzar y controlar el acceso a nuevas funcionalidades a millones de usuarios en todo el mundo de manera fluida y segura.
''',
    'code_example': r'''
// Ejemplo conceptual de cómo una aplicación usaría un feature flag
// Esto asume que tienes un cliente de feature flags configurado.

// import com.example.featureflags.FeatureFlagClient; // Suponemos una interfaz

public class FeatureFlagExample {

    // private FeatureFlagClient flagClient;

    // public FeatureFlagExample(FeatureFlagClient flagClient) {
    //     this.flagClient = flagClient;
    // }

    public String getCheckoutExperience(String userId) {
        // Asume que "new_checkout_flow" es el nombre de tu feature flag
        // if (flagClient.isFeatureEnabled("new_checkout_flow", userId)) {
        //     System.out.println("Usuario " + userId + " está viendo el NUEVO flujo de checkout.");
        //     return "new_checkout_flow_ui";
        // } else {
        //     System.out.println("Usuario " + userId + " está viendo el ANTIGUO flujo de checkout.");
        //     return "old_checkout_flow_ui";
        // }
        return "Simulated checkout flow";
    }

    public void displayPromotionalBanner() {
        // Otro ejemplo: activar/desactivar un banner promocional
        // if (flagClient.isFeatureEnabled("promotional_banner_active")) {
        //     System.out.println("Mostrando banner promocional.");
        //     // Código para mostrar el banner
        // } else {
        //     System.out.println("Banner promocional deshabilitado.");
        // }
    }

    // Un ejemplo de cómo NO usar un feature flag (código duplicado o demasiado complejo)
    public void processOrderIncorrect(String userId) {
        // if (flagClient.isFeatureEnabled("complex_order_logic")) {
        //     // Duplicar y modificar mucha lógica aquí
        //     System.out.println("Procesando orden con lógica compleja.");
        // } else {
        //     // Lógica antigua
        //     System.out.println("Procesando orden con lógica estándar.");
        // }
        // Se debe buscar una abstracción o un patrón de diseño para evitar la duplicación.
    }

    // Interfaz hipotética para el cliente de feature flags
    // interface FeatureFlagClient {
    //     boolean isFeatureEnabled(String flagName);
    //     boolean isFeatureEnabled(String flagName, String userContext);
    // }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 4,
    'title_level': 'DevOps Avanzado',
    'topic': 'Observabilidad Avanzada',
    'subtopic': 'AWS X-Ray avanzado',
    'definition': '''
AWS X-Ray es un servicio que te ayuda a analizar y depurar aplicaciones distribuidas, como las construidas con microservicios o funciones serverless. En un nivel avanzado, X-Ray va más allá de solo mostrarte si algo falló; te permite entender el "por qué" y el "dónde" de esos fallos, e identificar cuellos de botella en el rendimiento a través de todo tu ecosistema de servicios.

Ahora, pensemos un momento en la utilidad de todo esto... Cuando tu aplicación es un monolito, depurar es relativamente sencillo porque todo está en un solo lugar. Pero si tu aplicación está compuesta por docenas o cientos de microservicios que se comunican entre sí y con otros servicios de AWS, rastrear una solicitud de principio a fin se convierte en un verdadero rompecabezas. Es como intentar seguir el rastro de una sola gota de agua en un río caudaloso.

Aquí te va la aclaración: X-Ray recolecta datos sobre las solicitudes que tu aplicación maneja, generando "rastros" (traces) que muestran una vista de extremo a extremo de cómo una solicitud viaja a través de todos los componentes de tu aplicación y los servicios de AWS que utiliza. Cada componente en la ruta de la solicitud se representa como un "segmento" en el rastreo. Puedes ver el tiempo que cada segmento tarda, los errores, las excepciones, y los metadatos relevantes. A nivel avanzado, no solo usas X-Ray para ver rastros individuales, sino para analizar mapas de servicio que visualizan las conexiones entre tus servicios y te permiten identificar servicios con alta latencia o tasas de error. Puedes configurar muestreo para controlar qué solicitudes se trazan, y usar grupos para enfocar el análisis en segmentos específicos de tu aplicación. Es una herramienta indispensable para mantener la salud y el rendimiento de arquitecturas distribuidas complejas, permitiéndote diagnosticar problemas de forma proactiva antes de que afecten a tus usuarios, como lo hacen las grandes compañías de tecnología para sus servicios en la nube.
''',
    'code_example': r'''
// Para usar AWS X-Ray, necesitas instrumentar tu código con el SDK de X-Ray
// y habilitar el tracing en tus recursos de AWS (ej. funciones Lambda, EC2).

// Ejemplo de cómo instrumentar una función Lambda en Java con AWS X-Ray
// Esto requiere añadir la dependencia `aws-xray-sdk-java` a tu proyecto.

/*
// pom.xml (fragmento)
<dependency>
    <groupId>com.amazonaws</groupId>
    <artifactId>aws-xray-sdk-java</artifactId>
    <version>2.x.x</version>
</dependency>
<dependency>
    <groupId>com.amazonaws</groupId>
    <artifactId>aws-xray-sdk-java-aws-sdk</artifactId>
    <version>2.x.x</version>
</dependency>
*/

// import com.amazonaws.xray.AWSXRay;
// import com.amazonaws.xray.proxies.apache.http.HttpClientBuilder;
// import com.amazonaws.xray.entities.Subsegment;

// import com.amazonaws.services.lambda.runtime.Context;
// import com.amazonaws.services.lambda.runtime.RequestHandler;
// import com.amazonaws.services.lambda.runtime.events.APIGatewayProxyRequestEvent;
// import com.amazonaws.services.lambda.runtime.events.APIGatewayProxyResponseEvent;

// import org.apache.http.client.methods.HttpGet;
// import org.apache.http.impl.client.CloseableHttpClient;
// import org.apache.http.util.EntityUtils;

// public class AdvancedXRayLambda implements RequestHandler<APIGatewayProxyRequestEvent, APIGatewayProxyResponseEvent> {

//     private final CloseableHttpClient httpClient;

//     public AdvancedXRayLambda() {
//         // Instrumentar HttpClient para que las llamadas HTTP se tracen con X-Ray
//         this.httpClient = HttpClientBuilder.create().build();
//     }

//     @Override
//     public APIGatewayProxyResponseEvent handleRequest(APIGatewayProxyRequestEvent request, Context context) {
//         // Iniciar un subsegmento para una lógica específica dentro de la función Lambda
//         Subsegment subsegment = AWSXRay.beginSubsegment("## MyCustomLogic");

//         APIGatewayProxyResponseEvent response = new APIGatewayProxyResponseEvent();
//         try {
//             String url = "https://www.example.com";
//             HttpGet httpGet = new HttpGet(url);
//             org.apache.http.HttpResponse httpResponse = httpClient.execute(httpGet);
//             String responseBody = EntityUtils.toString(httpResponse.getEntity());

//             response.setStatusCode(200);
//             response.setBody("Successfully fetched: " + responseBody.substring(0, Math.min(responseBody.length(), 100)) + "...");

//             // Añadir metadatos al subsegmento
//             subsegment.putMetadata("external_call_url", url);
//             subsegment.putAnnotation("status_code", String.valueOf(httpResponse.getStatusLine().getStatusCode()));

//         } catch (Exception e) {
//             // Registrar la excepción en el subsegmento
//             subsegment.addException(e);
//             response.setStatusCode(500);
//             response.setBody("Error processing request: " + e.getMessage());
//         } finally {
//             // Finalizar el subsegmento
//             AWSXRay.endSubsegment();
//         }

//         return response;
//     }
// }

// Para habilitar X-Ray en la función Lambda, también debes activarlo en la configuración
// de la función en la consola de AWS o a través de la CLI/CloudFormation.
// aws lambda update-function-configuration --function-name MyLambdaFunction --tracing-config Mode=Active
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 4,
    'title_level': 'DevOps Avanzado',
    'topic': 'Observabilidad Avanzada',
    'subtopic': 'Amazon Managed Grafana',
    'definition': '''
Amazon Managed Grafana es un servicio completamente administrado de AWS que facilita la creación, gestión y escalado de cuadros de mando (dashboards) y visualizaciones para tus datos de monitoreo. En esencia, te permite usar la popular plataforma de código abierto Grafana sin tener que preocuparte por la infraestructura subyacente, la instalación, las actualizaciones o la escalabilidad.

Seguramente pensarás de qué va todo esto... Recolectar datos de observabilidad (métricas, logs, trazas) es solo la mitad de la batalla. La otra mitad es hacer que esos datos sean comprensibles y útiles para tomar decisiones. Grafana es excelente para visualizar datos de múltiples fuentes, pero configurarlo y mantenerlo por tu cuenta puede ser una tarea ardua, especialmente a medida que tu infraestructura crece.

Aquí te va la aclaración: Amazon Managed Grafana te quita esa carga operativa. Puedes conectar fácilmente Grafana a diversas fuentes de datos de AWS como Amazon CloudWatch (para métricas y logs), Amazon Managed Service for Prometheus (para métricas Prometheus), AWS X-Ray (para trazas), Amazon Timestream, e incluso fuentes de datos externas como bases de datos o servicios de monitoreo de terceros. Una vez conectado, puedes construir dashboards interactivos que te permiten visualizar el rendimiento de tu aplicación, identificar tendencias, depurar problemas y monitorear la salud de tus sistemas en tiempo real. Esto es crucial para los equipos de DevOps que necesitan una vista holística de su infraestructura sin la complejidad de gestionar sus propias herramientas de monitoreo, permitiéndoles centrarse en la entrega de valor. Piensa en esto como tu centro de comando visual para toda tu operación en la nube, dándote la capacidad de ver el pulso de tu aplicación de un vistazo.
''',
    'code_example': r'''
// Amazon Managed Grafana es un servicio de plataforma y no se interactúa
// directamente con él a través de código de aplicación en tiempo de ejecución.
// La interacción es a través de la consola de AWS, AWS CLI, o herramientas IaC
// para su configuración y conexión a fuentes de datos.

// Ejemplo conceptual de cómo se podría configurar un Workspace de Grafana
// y vincularlo a una fuente de datos de CloudWatch usando AWS CLI:

/*
// Paso 1: Crear un nuevo Workspace de Grafana (conceptual)
// aws grafana create-workspace \
//   --account-access-type CURRENT_ACCOUNT \
//   --authentication-providers AWS_SSO \
//   --permission-type SERVICE_MANAGED \
//   --workspace-name "MyApplicationDashboard" \
//   --workspace-data-sources "CLOUDWATCH"

// Paso 2: Configurar roles de IAM para que Grafana pueda acceder a las fuentes de datos.
// Esto implicaría crear un rol de IAM con permisos de lectura para CloudWatch,
// Prometheus, X-Ray, etc., y asociarlo al Workspace de Grafana.

// Ejemplo de una política de IAM para CloudWatch (para el rol de Grafana):
// {
//     "Version": "2012-10-17",
//     "Statement": [
//         {
//             "Effect": "Allow",
//             "Action": [
//                 "cloudwatch:DescribeAlarms",
//                 "cloudwatch:GetMetricData",
//                 "cloudwatch:ListMetrics"
//             ],
//             "Resource": "*"
//         }
//     ]
// }

// Desde la UI de Amazon Managed Grafana:
// 1. Navegar al Workspace.
// 2. Añadir una fuente de datos (ej. Amazon CloudWatch).
// 3. Crear un Dashboard y añadir paneles, seleccionando métricas
//    y visualizaciones de CloudWatch.

// Este es un proceso de configuración de infraestructura, no de código de aplicación.
// La magia ocurre cuando los datos fluyen de tus aplicaciones instrumentadas (con logs, métricas, trazas)
// a servicios como CloudWatch o Prometheus, y Grafana los visualiza.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 4,
    'title_level': 'DevOps Avanzado',
    'topic': 'Observabilidad Avanzada',
    'subtopic': 'Amazon Managed Prometheus',
    'definition': '''
Amazon Managed Service for Prometheus (AMP) es un servicio de monitoreo compatible con Prometheus que te permite monitorear tus aplicaciones en contenedores y sin servidor a escala. Prometheus es una herramienta de código abierto muy popular para la recolección y consulta de métricas, y AMP es la versión de AWS que gestiona toda la infraestructura subyacente por ti.

Ahora, pensemos un momento en la utilidad de todo esto... Las aplicaciones modernas, especialmente las que usan Kubernetes o ECS (contenedores) y Lambda (serverless), generan una cantidad enorme de métricas. Monitorear estas aplicaciones eficazmente requiere una solución robusta para recolectar, almacenar y consultar esas métricas. Si intentas gestionar tu propio clúster de Prometheus, te enfrentarás a desafíos como la escalabilidad, la alta disponibilidad y la gestión del almacenamiento de datos a largo plazo.

Aquí te va la aclaración: Amazon Managed Prometheus resuelve estos problemas operacionales. Te permite usar Prometheus para la recolección de métricas sin tener que operar los servidores de Prometheus tú mismo. Puedes usar los mismos agentes (exporters) y lenguajes de consulta (PromQL) que ya conoces de Prometheus. AMP se escala automáticamente para manejar grandes volúmenes de métricas, proporciona alta disponibilidad y retiene tus datos durante períodos prolongados. Se integra perfectamente con Amazon Managed Grafana para la visualización de datos y con otros servicios de AWS para la configuración y el descubrimiento de objetivos de monitoreo. Esto es crucial para equipos de DevOps que operan microservicios y contenedores a gran escala, ya que les permite tener una observabilidad granular de sus aplicaciones sin la sobrecarga de gestionar su propia infraestructura de monitoreo, liberando tiempo para centrarse en la entrega de nuevas características. Empresas que operan plataformas de juegos, servicios de streaming o cualquier sistema distribuido intensivo en datos se benefician enormemente de este tipo de servicio.
''',
    'code_example': r'''
// Amazon Managed Prometheus es un servicio de backend para métricas,
// y se interactúa con él a través de agentes (exporters) que recolectan métricas
// y clientes que consultan datos (ej. Grafana).
// No hay un código de aplicación directo para interactuar con AMP.

// Ejemplo conceptual de cómo una aplicación podría exponer métricas
// en formato Prometheus para que un agente las recoja.

// En una aplicación Java usando Micrometer con el exporter de Prometheus:

/*
// pom.xml (fragmento)
<dependency>
    <groupId>io.micrometer</groupId>
    <artifactId>micrometer-core</artifactId>
    <version>1.x.x</version>
</dependency>
<dependency>
    <groupId>io.micrometer</groupId>
    <artifactId>micrometer-registry-prometheus</artifactId>
    <version>1.x.x</version>
</dependency>
*/

// import io.micrometer.core.instrument.Counter;
// import io.micrometer.core.instrument.MeterRegistry;
// import io.micrometer.prometheus.PrometheusConfig;
// import io.micrometer.prometheus.PrometheusMeterRegistry;
// import com.sun.net.httpserver.HttpServer; // Para exponer el endpoint /metrics

// import java.io.IOException;
// import java.io.OutputStream;
// import java.net.InetSocketAddress;

// public class PrometheusMetricsExample {

//     private static PrometheusMeterRegistry prometheusRegistry;
//     private static Counter processedRequestsCounter;

//     public static void main(String[] args) throws IOException {
//         prometheusRegistry = new PrometheusMeterRegistry(PrometheusConfig.DEFAULT);

//         // Registrar una métrica de contador
//         processedRequestsCounter = Counter.builder("http_requests_processed_total")
//                 .description("Total number of HTTP requests processed")
//                 .tag("endpoint", "/api/data")
//                 .register(prometheusRegistry);

//         // Simular procesamiento de solicitudes y aumento del contador
//         for (int i = 0; i < 10; i++) {
//             processedRequestsCounter.increment();
//             System.out.println("Processed request. Counter: " + processedRequestsCounter.count());
//             try {
//                 Thread.sleep(1000);
//             } catch (InterruptedException e) {
//                 Thread.currentThread().interrupt();
//             }
//         }

//         // Exponer el endpoint /metrics para que Prometheus lo scrapee
//         HttpServer server = HttpServer.create(new InetSocketAddress(8080), 0);
//         server.createContext("/metrics", httpExchange -> {
//             String prometheusMetrics = prometheusRegistry.scrape();
//             httpExchange.sendResponseHeaders(200, prometheusMetrics.length());
//             OutputStream os = httpExchange.getResponseBody();
//             os.write(prometheusMetrics.getBytes());
//             os.close();
//         });
//         new Thread(server::start).start();
//         System.out.println("Prometheus metrics available at http://localhost:8080/metrics");

//         // En un entorno de contenedores (ej. Kubernetes), un `sidecar` o el propio Kubelet
//         // pueden ser configurados para recolectar estas métricas y enviarlas a AMP.
//     }
// }
*/

// Para usar AMP, configurarías tus cargas de trabajo (ej. en EKS)
// para enviar sus métricas a tu workspace de AMP.
// Esto a menudo implica configurar `kube-prometheus-stack` o agentes como `Prometheus Agent`.
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 4,
    'title_level': 'DevOps Avanzado',
    'topic': 'Observabilidad Avanzada',
    'subtopic': 'OpenTelemetry',
    'definition': '''
OpenTelemetry es un proyecto de código abierto que proporciona un conjunto unificado de APIs, SDKs y herramientas para instrumentar, generar, recolectar y exportar datos de telemetría (métricas, logs y trazas) desde tu software. Su objetivo principal es resolver el problema de la "observabilidad fragmentada", donde cada herramienta de monitoreo tiene su propia forma de recolectar datos, lo que dificulta la integración y la portabilidad.

Vamos a ver de qué se trata todo esto... En el mundo actual de microservicios y arquitecturas distribuidas, las aplicaciones pueden estar construidas con diferentes lenguajes de programación, ejecutarse en diferentes entornos (contenedores, serverless, VMs) y utilizar diversos servicios en la nube. Cada uno de estos componentes puede generar datos de observabilidad de formas incompatibles, lo que hace que obtener una vista completa y coherente del sistema sea un dolor de cabeza.

Aquí te va la aclaración: OpenTelemetry estandariza cómo se recolectan estos datos. En lugar de que cada desarrollador tenga que aprender y usar SDKs específicos para CloudWatch, X-Ray, Prometheus, o cualquier otra herramienta, OpenTelemetry ofrece un conjunto común de bibliotecas. Tú instrumentas tu código una vez usando OpenTelemetry, y luego puedes exportar esos datos a una variedad de backends de observabilidad sin cambiar el código de tu aplicación. Esto te da una flexibilidad enorme: puedes cambiar tu proveedor de monitoreo, combinar datos de diferentes servicios, o incluso enviar datos a múltiples sistemas simultáneamente, sin tener que re-instrumentar tu aplicación. Es como un lenguaje universal para la observabilidad, permitiéndote construir sistemas más resilientes y fáciles de monitorear sin atarte a un proveedor específico. Empresas que adoptan una estrategia multi-nube o que necesitan flexibilidad en sus herramientas de monitoreo encuentran en OpenTelemetry una solución clave.
''',
    'code_example': r'''
// Ejemplo conceptual de cómo instrumentar una aplicación Java con OpenTelemetry
// Esto requiere añadir las dependencias de OpenTelemetry SDK a tu proyecto.

/*
// pom.xml (fragmento - añadir dependencias para SDK, exportadores, etc.)
<dependency>
    <groupId>io.opentelemetry</groupId>
    <artifactId>opentelemetry-api</artifactId>
    <version>1.x.x</version>
</dependency>
<dependency>
    <groupId>io.opentelemetry</groupId>
    <artifactId>opentelemetry-sdk</artifactId>
    <version>1.x.x</version>
</dependency>
<dependency>
    <groupId>io.opentelemetry</groupId>
    <artifactId>opentelemetry-exporter-otlp</artifactId>
    <version>1.x.x</version>
</dependency>
<dependency>
    <groupId>io.opentelemetry.instrumentation</groupId>
    <artifactId>opentelemetry-instrumentation-annotations</artifactId>
    <version>1.x.x</version>
</dependency>
*/

// import io.opentelemetry.api.GlobalOpenTelemetry;
// import io.opentelemetry.api.trace.Span;
// import io.opentelemetry.api.trace.Tracer;
// import io.opentelemetry.context.Scope;
// import io.opentelemetry.sdk.OpenTelemetrySdk;
// import io.opentelemetry.sdk.trace.SdkTracerProvider;
// import io.opentelemetry.sdk.trace.export.BatchSpanProcessor;
// import io.opentelemetry.exporter.otlp.trace.OtlpGrpcSpanExporter;

// public class OpenTelemetryExample {

//     private static final String SERVICE_NAME = "my-java-app";
//     private static Tracer tracer;

//     public static void main(String[] args) {
//         // Paso 1: Configurar el SDK de OpenTelemetry
//         // Configurar el exportador (ej. a un colector OpenTelemetry o directamente a un backend)
//         // OtlpGrpcSpanExporter spanExporter = OtlpGrpcSpanExporter.builder()
//         //         .setEndpoint("http://localhost:4317") // Dirección del colector OpenTelemetry
//         //         .build();

//         // SdkTracerProvider tracerProvider = SdkTracerProvider.builder()
//         //         .addSpanProcessor(BatchSpanProcessor.builder(spanExporter).build())
//         //         .build();

//         // OpenTelemetrySdk.builder().setTracerProvider(tracerProvider).buildAndRegisterGlobal();

//         // tracer = GlobalOpenTelemetry.getTracer(SERVICE_NAME);

//         // Paso 2: Instrumentar el código
//         // myBusinessLogicMethod("user123");
//     }

//     // @WithSpan("myBusinessLogicMethod") // Usando anotación para crear un Span
//     public static void myBusinessLogicMethod(String userId) {
//         // Span span = tracer.spanBuilder("processUserData").startSpan();
//         // try (Scope scope = span.makeCurrent()) {
//             // Lógica de negocio aquí
//             // System.out.println("Processing data for user: " + userId);
//             // span.setAttribute("user.id", userId);
//             // throw new RuntimeException("Simulated error!"); // Ejemplo de error
//         // } catch (Throwable t) {
//         //     span.recordException(t);
//         //     span.setStatus(io.opentelemetry.api.trace.StatusCode.ERROR, "Processing failed");
//         //     throw t;
//         // } finally {
//         //     span.end();
//         // }
//     }
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 4,
    'title_level': 'DevOps Avanzado',
    'topic': 'Performance Testing',
    'subtopic': 'AWS Distributed Load Testing',
    'definition': '''
AWS Distributed Load Testing es una solución de arquitectura de referencia de AWS que te permite simular un alto volumen de tráfico para probar el rendimiento de tus aplicaciones. En lugar de depender de una sola máquina para generar carga (lo cual sería limitado), esta solución distribuye la generación de carga a través de múltiples instancias en la nube.

Ahora, pensemos un momento en la utilidad de todo esto... ¿Alguna vez has lanzado una aplicación que funciona perfectamente con unos pocos usuarios, pero se ralentiza o incluso se cae cuando un gran número de personas intentan usarla al mismo tiempo? Esto es un problema común de rendimiento y escalabilidad. Las pruebas de carga son cruciales para entender cómo tu aplicación se comporta bajo presión, pero generar una carga significativa puede ser complicado y costoso si no tienes las herramientas adecuadas.

Aquí te va la aclaración: AWS Distributed Load Testing utiliza servicios como AWS Fargate, AWS Step Functions y Amazon S3 para orquestar la ejecución de pruebas de carga a escala. Puedes especificar cuántos usuarios concurrentes quieres simular, la tasa de solicitudes, y los patrones de acceso. La solución desplegará automáticamente la infraestructura necesaria para generar esa carga distribuida, sin que tengas que preocuparte por aprovisionar y gestionar cientos de máquinas de carga. Esto te permite identificar cuellos de botella en tu aplicación, validar la escalabilidad de tu infraestructura y asegurarte de que tu aplicación pueda manejar el tráfico esperado antes de un lanzamiento importante. Es una herramienta poderosa para cualquier equipo que necesite garantizar que su aplicación sea robusta y tenga un rendimiento óptimo bajo cualquier condición de carga, tal como lo hacen las grandes compañías de comercio electrónico para prepararse para eventos como el Black Friday.
''',
    'code_example': r'''
// AWS Distributed Load Testing es una solución preconstruida de AWS,
// no un código que se escriba en una aplicación. Se configura a través
// de una plantilla de CloudFormation que despliega los recursos necesarios.

// La interacción principal es a través de una interfaz web (Solution Console)
// o la API de AWS después de desplegar la solución.

// Pseudocódigo de cómo se usaría la solución (conceptual):

/*
// PASO 1: Desplegar la solución de AWS Distributed Load Testing (una vez)
// Esto se hace típicamente a través de la plantilla de CloudFormation proporcionada por AWS.
// `aws cloudformation create-stack --stack-name distributed-load-testing-solution --template-body file://solution.yaml ...`

// PASO 2: Configurar una prueba de carga a través de la consola de la solución
// - Seleccionar el tipo de prueba (ej. JMeter, Artillery, custom HTTP requests)
// - Definir los parámetros de la prueba:
//   - Número de usuarios virtuales concurrentes
//   - Tasa de solicitudes por segundo
//   - Duración de la prueba
//   - Endpoint de la aplicación a probar
//   - Cuerpo de las solicitudes (si aplica)
// - Subir el script de prueba (ej. JMeter .jmx file) si se usa uno.

// PASO 3: Ejecutar la prueba
// La solución orquestará el lanzamiento de tareas de Fargate
// que ejecutarán los generadores de carga definidos.

// PASO 4: Analizar los resultados
// Los resultados se publicarán en Amazon S3 y se podrán visualizar en
// Amazon CloudWatch (métricas) o en el dashboard de la solución.

// Ejemplo conceptual de un script de JMeter que la solución podría ejecutar:
// (Este sería un archivo .jmx subido a la solución)
// <?xml version="1.0" encoding="UTF-8"?>
// <jmeterTestPlan version="1.2" properties="5.0" jmeter="5.5">
//   <hashTree>
//     <TestPlan guiclass="TestPlanGui" testclass="TestPlan" testname="Web Test Plan">
//       <stringProp name="TestPlan.comments"></stringProp>
//       <boolProp name="TestPlan.functional_mode">false</boolProp>
//       <boolProp name="TestPlan.tearDown_on_shutdown">true</boolProp>
//       <elementProp name="TestPlan.user_defined_variables" elementType="Arguments" guiclass="ArgumentsPanel" testclass="Arguments" testname="User Defined Variables">
//         <collectionProp name="Arguments.arguments">
//           <elementProp name="baseURL" elementType="Argument">
//             <stringProp name="Argument.name">baseURL</stringProp>
//             <stringProp name="Argument.value">http://your-app-endpoint.com</stringProp>
//             <stringProp name="Argument.metadata">=</stringProp>
//           </elementProp>
//         </collectionProp>
//       </elementProp>
//     </TestPlan>
//     <hashTree>
//       <ThreadGroup guiclass="ThreadGroupGui" testclass="ThreadGroup" testname="Users">
//         <stringProp name="ThreadGroup.num_threads">100</stringProp>
//         <stringProp name="ThreadGroup.ramp_time">10</stringProp>
//         <boolProp name="ThreadGroup.scheduler">false</boolProp>
//         <stringProp name="ThreadGroup.duration"></stringProp>
//         <stringProp name="ThreadGroup.delay"></stringProp>
//       </ThreadGroup>
//       <hashTree>
//         <HTTPSamplerProxy guiclass="HttpTestSampleGui" testclass="HTTPSamplerProxy" testname="HTTP Request">
//           <elementProp name="HTTPsampler.Arguments" elementType="Arguments" guiclass="HTTPArgumentsPanel" testclass="Arguments" testname="User Defined Variables">
//             <collectionProp name="Arguments.arguments"/>
//           </elementProp>
//           <stringProp name="HTTPSampler.domain">${baseURL}</stringProp>
//           <stringProp name="HTTPSampler.port"></stringProp>
//           <stringProp name="HTTPSampler.protocol">http</stringProp>
//           <stringProp name="HTTPSampler.contentEncoding"></stringProp>
//           <stringProp name="HTTPSampler.path">/</stringProp>
//           <stringProp name="HTTPSampler.method">GET</stringProp>
//           <boolProp name="HTTPSampler.follow_redirects">true</boolProp>
//           <boolProp name="HTTPSampler.auto_redirects">false</boolProp>
//           <boolProp name="HTTPSampler.use_keepalive">true</boolProp>
//           <boolProp name="HTTPSampler.DO_MULTIPART_POST">false</boolProp>
//           <stringProp name="HTTPSampler.embedded_url_regexp"></stringProp>
//           <stringProp name="HTTPSampler.connect_timeout"></stringProp>
//           <stringProp name="HTTPSampler.response_timeout"></stringProp>
//         </HTTPSamplerProxy>
//       </hashTree>
//     </hashTree>
// </jmeterTestPlan>
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 4,
    'title_level': 'DevOps Avanzado',
    'topic': 'Performance Testing',
    'subtopic': 'CI/CD para performance tests',
    'definition': '''
Integrar pruebas de rendimiento en tu pipeline de CI/CD (Integración Continua/Entrega Continua) significa que estas pruebas se ejecutan de forma automática como parte de cada cambio de código o despliegue. En lugar de esperar a que una aplicación esté casi terminada para hacer una prueba de carga grande, las pruebas de rendimiento se ejecutan de forma incremental y continua a lo largo del ciclo de desarrollo.

Seguramente te estás preguntando por qué esto importa. Tradicionalmente, las pruebas de rendimiento eran una actividad manual y costosa que se realizaba al final del ciclo de desarrollo, a menudo antes de un lanzamiento importante. Si se encontraban problemas de rendimiento, el costo de solucionarlos era muy alto porque implicaba reingeniería significativa, y el lanzamiento podría retrasarse.

Aquí te va la aclaración: Al integrar las pruebas de rendimiento en CI/CD, puedes detectar problemas de rendimiento mucho antes, cuando son más fáciles y baratos de solucionar. Cada vez que se integra un cambio de código, el pipeline puede ejecutar un conjunto de pruebas de rendimiento ligeras para detectar regresiones. Por ejemplo, si una nueva característica introduce un cuello de botella, lo sabrás casi de inmediato, no días o semanas después. Esto se logra usando herramientas de prueba de carga (como JMeter, Gatling, K6) integradas en el pipeline de CI/CD (ej. AWS CodePipeline, Jenkins, GitLab CI). Puedes definir umbrales de rendimiento (ej. latencia máxima, tasa de errores) y configurar el pipeline para que falle si esos umbrales se superan. Esto no solo mejora la calidad del software al garantizar un rendimiento consistente, sino que también acelera los ciclos de entrega y reduce el riesgo de fallas en producción debido a problemas de rendimiento. Las empresas que practican DevOps de alto rendimiento siempre tienen pruebas de rendimiento automatizadas como una parte integral de sus pipelines.
''',
    'code_example': r'''
// Integrar pruebas de rendimiento en CI/CD implica configurar el pipeline
// para ejecutar scripts de prueba de carga y evaluar sus resultados.
// No es un código de aplicación, sino una configuración de pipeline.

// Ejemplo conceptual de un paso en un pipeline de CI/CD (YAML para GitLab CI/GitHub Actions, etc.)
// que ejecuta una prueba de rendimiento con JMeter.

/*
# .gitlab-ci.yml o .github/workflows/main.yml (fragmento)

stages:
  - build
  - test
  - performance_test
  - deploy

build_job:
  stage: build
  script:
    - echo "Building application..."
    # ... comandos de construcción ...
  artifacts:
    paths:
      - ./build/app.jar

performance_test_job:
  stage: performance_test
  image: jmeter:latest # Usar una imagen Docker con JMeter preinstalado
  script:
    - echo "Starting performance tests..."
    # Ejecutar JMeter en modo no-GUI con un script de prueba
    - jmeter -n -t ./tests/my_performance_test.jmx -l ./results/results.jtl -e -o ./results/html_report
    # Verificar los resultados (ej. tasa de errores, latencia media)
    # y fallar el pipeline si los umbrales no se cumplen.
    # Esto puede implicar un script custom para parsear results.jtl
    - |
      # Ejemplo de un chequeo simple de errores desde el JTL (pseudocódigo)
      # ERROR_COUNT=$(grep "false" ./results/results.jtl | wc -l)
      # if [ "$ERROR_COUNT" -gt 0 ]; then
      #   echo "Performance test failed: errors detected!"
      #   exit 1
      # fi
      echo "Performance test completed successfully."
  artifacts:
    paths:
      - ./results/html_report/ # Guardar el reporte HTML de JMeter
    expire_in: 1 week
  needs:
    - build_job # Depende del job de construcción para obtener el artefacto

deploy_job:
  stage: deploy
  script:
    - echo "Deploying application..."
    # ... comandos de despliegue ...
  needs:
    - performance_test_job # Solo despliega si las pruebas de rendimiento pasaron
*/

// La clave es que el job `performance_test_job` se ejecuta automáticamente
// y puede detener el pipeline si se detectan regresiones de rendimiento.
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 4,
    'title_level': 'DevOps Avanzado',
    'topic': 'Performance Testing',
    'subtopic': 'Benchmarking automatizado',
    'definition': '''
El benchmarking automatizado es el proceso de ejecutar pruebas de rendimiento de manera repetible y sin intervención humana para comparar el rendimiento de tu aplicación o sistema a lo largo del tiempo, o entre diferentes versiones o configuraciones. No es solo una prueba de carga, sino una comparación sistemática de cómo tu aplicación se desempeña bajo condiciones controladas.

Seguramente pensarás de qué va todo esto... Imagina que mejoras un algoritmo o cambias una versión de base de datos. ¿Cómo sabes si realmente es más rápido o más eficiente? Si solo haces pruebas manuales, es difícil obtener resultados consistentes y comparables. La automatización es la clave para la precisión y la eficiencia.

Aquí te va la aclaración: El benchmarking automatizado implica establecer un conjunto de métricas de rendimiento (como latencia, rendimiento, uso de CPU/memoria) y luego ejecutar pruebas de carga o escenarios específicos en un entorno controlado y reproducible. Los resultados se capturan y se comparan con una "línea base" (el rendimiento de una versión anterior o un estado conocido). Herramientas de automatización pueden ejecutar estas pruebas regularmente (ej. cada noche, o en cada pull request) y generar informes que alerten sobre cualquier degradación del rendimiento. Esto es increíblemente útil para identificar "regresiones de rendimiento" (cuando un cambio en el código empeora el rendimiento), validar mejoras de optimización, y tomar decisiones informadas sobre la escalabilidad. Por ejemplo, si estás evaluando dos proveedores de servicios de base de datos o dos configuraciones de servidor, el benchmarking automatizado te daría datos objetivos para elegir la mejor opción. Muchas empresas utilizan esto como parte de su estrategia de "rendimiento continuo" para asegurar que sus aplicaciones siempre cumplan con las expectativas de velocidad y eficiencia.
''',
    'code_example': r'''
// El benchmarking automatizado es un proceso que orquesta herramientas de prueba
// y recolección de métricas. No hay un "código de benchmarking" de aplicación,
// sino scripts y configuraciones que impulsan el proceso.

// Ejemplo conceptual de un script de automatización (ej. en Python)
// que podría ser parte de un pipeline de CI/CD para benchmarking.

/*
# python/run_benchmarks.py

import os
import requests
import time
import json

# URL de la aplicación a probar
APP_URL = os.environ.get("APP_URL", "http://localhost:8080")
# Umbral de latencia máxima para fallar el benchmark
LATENCY_THRESHOLD_MS = 200

def run_simple_benchmark():
    print(f"Running benchmark against {APP_URL}...")
    latencies = []
    num_requests = 100

    for i in range(num_requests):
        start_time = time.time()
        try:
            response = requests.get(f"{APP_URL}/api/data")
            response.raise_for_status() # Lanza excepción para códigos de estado HTTP erróneos
            end_time = time.time()
            latency_ms = (end_time - start_time) * 1000
            latencies.append(latency_ms)
            print(f"Request {i+1}: Latency = {latency_ms:.2f} ms")
        except requests.exceptions.RequestException as e:
            print(f"Request {i+1} failed: {e}")
            return False, 0, [] # Fallar si hay errores HTTP

    if not latencies:
        print("No successful requests to calculate latency.")
        return False, 0, []

    avg_latency = sum(latencies) / len(latencies)
    max_latency = max(latencies)
    print(f"\nBenchmark results:")
    print(f"  Average Latency: {avg_latency:.2f} ms")
    print(f"  Max Latency: {max_latency:.2f} ms")

    if avg_latency > LATENCY_THRESHOLD_MS:
        print(f"ERROR: Average latency {avg_latency:.2f} ms exceeds threshold {LATENCY_THRESHOLD_MS} ms!")
        return False, avg_latency, latencies
    
    print("Benchmark passed!")
    return True, avg_latency, latencies

if __name__ == "__main__":
    passed, avg_lat, all_latencies = run_simple_benchmark()
    
    # Guardar resultados para análisis posterior o comparación
    results = {
        "timestamp": time.time(),
        "app_url": APP_URL,
        "passed": passed,
        "avg_latency_ms": avg_lat,
        "max_latency_ms": max(all_latencies) if all_latencies else 0
    }
    with open("benchmark_results.json", "w") as f:
        json.dump(results, f, indent=2)

    if not passed:
        exit(1) # Fallar el script si el benchmark no pasó
*/

// Este script se ejecutaría como parte de un pipeline de CI/CD.
// Se pueden usar herramientas más sofisticadas como JMeter o Gatling para pruebas de carga
// más complejas y luego un script Python para analizar sus resultados.
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 4,
    'title_level': 'DevOps Avanzado',
    'topic': 'Performance Testing',
    'subtopic': 'Capacity planning',
    'definition': '''
El Capacity Planning, o planificación de capacidad, es el proceso de predecir y planificar los recursos de infraestructura (computación, almacenamiento, red, etc.) que tu aplicación necesitará para manejar el tráfico esperado y mantener un rendimiento óptimo en el futuro. Esencialmente, se trata de asegurarse de que tu aplicación tenga suficiente "espacio" para crecer sin que el rendimiento se vea afectado o los costos se disparen.

Esto tiene una explicación, y es porque en el mundo de las aplicaciones, el éxito puede ser una bendición y una maldición. Si tu aplicación se vuelve popular de repente (un pico de tráfico por una campaña de marketing, un evento viral, etc.), y no estás preparado, el rendimiento se degradará, los usuarios se frustrarán y podrías perder ingresos. Por otro lado, sobreaprovisionar recursos de forma constante sin una base, puede llevar a gastos innecesarios en la nube.

Aquí te va la aclaración: La planificación de capacidad no es solo un acto puntual; es un proceso continuo. Implica varios pasos clave: primero, **monitorear el rendimiento actual** de tu aplicación y la utilización de recursos (CPU, memoria, IOPS de disco, ancho de banda de red, latencia). Segundo, **analizar tendencias** históricas para identificar patrones de crecimiento y picos estacionales. Tercero, **pronosticar el tráfico futuro** basándose en proyecciones de crecimiento del negocio, eventos planificados o campañas de marketing. Cuarto, **realizar pruebas de carga y estrés** para entender el límite superior de tu infraestructura actual y ver cómo se comporta tu aplicación bajo condiciones extremas. Finalmente, **ajustar el aprovisionamiento de recursos** (escalar instancias, optimizar bases de datos, etc.) para satisfacer las necesidades futuras. En la nube, esto se traduce en usar Auto Scaling para manejar picos inesperados, elegir los tipos de instancia correctos, y optimizar las configuraciones de bases de datos y otros servicios. Una buena planificación de capacidad evita problemas de rendimiento, optimiza los costos y garantiza que tu aplicación siempre esté lista para manejar la demanda, tal como lo hacen servicios en línea masivos para evitar caídas durante eventos de alta demanda.
''',
    'code_example': r'''
// La planificación de capacidad es una disciplina de ingeniería y gestión,
// no se traduce directamente en un bloque de código de aplicación.
// Sin embargo, las decisiones de Capacity Planning se basan en datos y herramientas
// que sí están relacionadas con el código y la infraestructura.

// Lo que podemos mostrar son ejemplos de cómo la aplicación o la infraestructura
// se instrumentan para proporcionar los datos necesarios para la planificación.

// Ejemplo conceptual de métricas que serían clave para la planificación de capacidad:

// 1. Métricas de uso de recursos (ej. CloudWatch metrics para EC2/Lambda)
//    - CPUUtilization (uso de CPU)
//    - MemoryUtilization (uso de memoria)
//    - NetworkIn/NetworkOut (tráfico de red)
//    - DiskReadBytes/DiskWriteBytes (rendimiento del disco)

// 2. Métricas de rendimiento de la aplicación
//    - Latency (tiempo de respuesta de las API o páginas web)
//    - RequestCount (número de solicitudes por segundo/minuto)
//    - ErrorCount/ErrorRate (tasa de errores)
//    - DatabaseConnections (conexiones activas a la base de datos)

// 3. Herramientas y configuraciones relacionadas:

//    - AWS CloudWatch Alarms: Para alertar cuando las métricas exceden umbrales.
//      // Ejemplo de AWS CLI para crear una alarma de CPU
//      // aws cloudwatch put-metric-alarm \
//      //   --alarm-name "HighCPUUtilization" \
//      //   --metric-name CPUUtilization \
//      //   --namespace AWS/EC2 \
//      //   --statistic Average \
//      //   --period 300 \
//      //   --threshold 80 \
//      //   --comparison-operator GreaterThanThreshold \
//      //   --dimensions "Name=InstanceId,Value=i-0abcdef1234567890" \
//      //   --evaluation-periods 2 \
//      //   --alarm-actions arn:aws:sns:REGION:ACCOUNT_ID:MyNotificationTopic

//    - AWS Auto Scaling Groups: Para escalar automáticamente la capacidad en respuesta a la demanda.
//      // Ejemplo de configuración de política de escalado con CLI
//      // aws autoscaling put-scaling-policy \
//      //   --policy-name "ScaleOutCPU" \
//      //   --auto-scaling-group-name "MyWebAppASG" \
//      //   --policy-type TargetTrackingScaling \
//      //   --target-tracking-configuration "PredefinedMetricSpecification={PredefinedMetricType=ASGAverageCPUUtilization},TargetValue=60.0"

//    - Pruebas de carga (como AWS Distributed Load Testing, visto anteriormente)
//      para simular tráfico futuro y validar la capacidad actual.

// La esencia del Capacity Planning es usar los datos de observabilidad para tomar
// decisiones informadas sobre cómo escalar y optimizar tu infraestructura.
'''
  });
}

Future<void> insertSrLevel5AwsData(Database db) async {
  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Data Engineering',
    'topic': 'Data Lakes',
    'subtopic': 'Amazon S3 como data lake',
    'definition': '''
Amazon S3 (Simple Storage Service) es un servicio de almacenamiento de objetos en la nube altamente escalable, duradero y seguro. Cuando hablamos de usar S3 como un "data lake", nos referimos a utilizarlo como un repositorio centralizado para almacenar grandes volúmenes de datos brutos y procesados, de cualquier formato, a escala petabytes. Es la base fundamental para la mayoría de los data lakes en AWS.

No sé tú, pero a mí esto al principio me costó 🤯. La idea principal es que S3 no es una base de datos tradicional; es un lugar donde puedes guardar cualquier tipo de archivo sin necesidad de definir un esquema por adelantado. Esto lo hace increíblemente flexible.

Aquí te va la aclaración: S3 es ideal para un data lake por varias razones clave. Primero, su **escalabilidad ilimitada**: puedes almacenar literalmente una cantidad infinita de datos sin preocuparte por la capacidad. Segundo, su **durabilidad extrema**: los datos se replican automáticamente en múltiples dispositivos y Availability Zones dentro de una región, ofreciendo una durabilidad del 99.999999999%. Tercero, su **rentabilidad**: S3 ofrece diferentes clases de almacenamiento (Estándar, Infrequent Access, Glacier) que te permiten optimizar costos según la frecuencia con la que accedes a los datos. Cuarto, su **seguridad**: S3 proporciona potentes características de seguridad, como cifrado en reposo y en tránsito, control de acceso a nivel de bucket y objeto, y compatibilidad con auditorías. Finalmente, y crucial para un data lake, S3 se integra de forma nativa con una vasta gama de servicios de análisis y procesamiento de AWS, como AWS Glue para ETL, Amazon Athena para consultas ad-hoc, Amazon Redshift Spectrum para consultas federadas, Amazon EMR para procesamiento Big Data, y AWS Lake Formation para gobernanza. Esta integración fluida es lo que convierte a S3 de un simple almacenamiento en el corazón de una arquitectura de data lake.
''',
    'code_example': r'''
// Amazon S3 es un servicio de almacenamiento. La interacción con él
// a menudo se realiza a través de los SDK de AWS, la CLI, o la consola.
// El "código" de un data lake en S3 es más sobre la organización de datos
// y la integración con otros servicios.

// Ejemplo conceptual de cómo subir un archivo a S3 usando el SDK de Java
// y cómo se podría organizar un data lake con prefijos/carpetas.

/*
// pom.xml (fragmento)
<dependency>
    <groupId>com.amazonaws</groupId>
    <artifactId>aws-java-sdk-s3</artifactId>
    <version>1.12.x</version>
</dependency>
*/

// import com.amazonaws.auth.AWSStaticCredentialsProvider;
// import com.amazonaws.auth.BasicAWSCredentials;
// import com.amazonaws.regions.Regions;
// import com.amazonaws.services.s3.AmazonS3;
// import com.amazonaws.services.s3.AmazonS3ClientBuilder;
// import com.amazonaws.services.s3.model.PutObjectRequest;

// import java.io.File;
// import java.io.IOException;
// import java.nio.file.Files;

public class S3DataLakeExample {

    // private static final String BUCKET_NAME = "my-company-data-lake-raw"; // Tu bucket S3
    // private static final String RAW_DATA_PREFIX = "raw/sales/2023/11/01/"; // Prefijo para datos crudos

    public static void main(String[] args) throws IOException {
        // En un entorno real, usarías roles de IAM o credenciales gestionadas
        // BasicAWSCredentials credentials = new BasicAWSCredentials("YOUR_ACCESS_KEY", "YOUR_SECRET_KEY");
        // AmazonS3 s3Client = AmazonS3ClientBuilder.standard()
        //         .withCredentials(new AWSStaticCredentialsProvider(credentials))
        //         .withRegion(Regions.US_EAST_1)
        //         .build();

        // Crear un archivo de ejemplo
        // File rawDataFile = createTempFile("sales_data_001.csv", "timestamp,product_id,amount\n2023-11-01 10:00:00,P123,100.50\n...");

        // Subir el archivo al "raw data zone" del data lake
        // String s3Key = RAW_DATA_PREFIX + rawDataFile.getName();
        // s3Client.putObject(new PutObjectRequest(BUCKET_NAME, s3Key, rawDataFile));
        // System.out.println("Archivo subido a S3: s3://" + BUCKET_NAME + "/" + s3Key);

        // La organización del data lake en S3 a menudo sigue una estructura de zonas:
        // - raw/: datos tal como vienen de la fuente
        // - curated/: datos limpios y transformados, listos para análisis
        // - sandboxes/: para exploración de datos por científicos de datos
        // y particiones basadas en tiempo (ej. /year=YYYY/month=MM/day=DD/)
    }

    // private static File createTempFile(String filename, String content) throws IOException {
    //     File tempFile = File.createTempFile(filename, ".tmp");
    //     Files.write(tempFile.toPath(), content.getBytes());
    //     tempFile.deleteOnExit(); // Asegurarse de que el archivo se elimine al salir
    //     return tempFile;
    // }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Data Engineering',
    'topic': 'Data Lakes',
    'subtopic': 'AWS Lake Formation',
    'definition': '''
AWS Lake Formation es un servicio que facilita la construcción, gestión y seguridad de data lakes en Amazon S3. Su objetivo principal es simplificar la creación de tu data lake y, lo que es más importante, centralizar la gobernanza de datos y el control de acceso, algo que puede ser extremadamente complejo de manejar manualmente en un gran data lake.

No sé tú, pero a mí esto al principio me costó 🤯 entenderlo bien. La idea es que construir un data lake es una cosa, pero saber quién tiene acceso a qué datos, auditar ese acceso y garantizar la seguridad a nivel granular es un desafío enorme, especialmente con datos sensibles.

Aquí te va la aclaración: Lake Formation te permite definir políticas de seguridad en un solo lugar, que luego se aplican a través de múltiples servicios de análisis de AWS (como Athena, Glue, Redshift Spectrum, EMR). Puedes definir permisos a nivel de tabla, columna e incluso fila, lo cual es vital para la privacidad y el cumplimiento normativo. Lake Formation también ayuda a automatizar muchas de las tareas manuales involucradas en la creación de un data lake, como el rastreo de datos (para descubrir esquemas), la limpieza y la transformación. Actúa como un orquestador, gestionando los permisos de manera consistente en todo tu ecosistema de análisis, eliminando la necesidad de configurar permisos individualmente en cada servicio. Esto acelera el tiempo de valor de tu data lake, reduce los errores de configuración y proporciona un marco de gobernanza robusto para tus datos, crucial para empresas que manejan grandes volúmenes de información sensible y necesitan cumplir con estrictas regulaciones de datos.
''',
    'code_example': r'''
// AWS Lake Formation es un servicio de plataforma y gobernanza.
// La interacción con él es principalmente a través de la consola de AWS,
// AWS CLI, o herramientas de Infraestructura como Código (IaC) como CloudFormation.
// No hay un código de aplicación directo que interactúe con Lake Formation en tiempo de ejecución.

// Ejemplo conceptual de cómo se configurarían los permisos en Lake Formation
// usando la AWS CLI.

/*
// Paso 1: Registrar una ubicación de S3 como parte del data lake
// aws lakeformation register-resource \
//   --resource-arn "arn:aws:s3:::my-company-data-lake-raw" \
//   --use-service-linked-role

// Paso 2: Conceder permisos a un usuario/rol de IAM sobre una tabla específica en el data catalog
// Supongamos que ya tienes una base de datos y una tabla descubiertas por AWS Glue/Lake Formation.

// Conceder permisos de SELECT a un rol de IAM en una tabla
// aws lakeformation grant-permissions \
//   --principal DataLakePrincipalIdentifier=arn:aws:iam::ACCOUNT_ID:role/analyst-role \
//   --permissions SELECT DESCRIBE \
//   --resource '{ "Table": { "DatabaseName": "sales_db", "Name": "raw_transactions" } }'

// Conceder permisos a nivel de columna (excluyendo una columna sensible)
// aws lakeformation grant-permissions \
//   --principal DataLakePrincipalIdentifier=arn:aws:iam::ACCOUNT_ID:role/analyst-role \
//   --permissions SELECT DESCRIBE \
//   --resource '{ "TableWithColumns": { "DatabaseName": "sales_db", "Name": "raw_transactions", "ColumnWildcard": {}, "ExcludedColumnNames": ["credit_card_number"] } }'

// Opcional: Para permitir que AWS Glue/Athena acceda a los datos:
// aws lakeformation grant-permissions \
//   --principal DataLakePrincipalIdentifier=arn:aws:iam::ACCOUNT_ID:role/AWSGlueServiceRole \
//   --permissions ALL \
//   --resource '{ "DataLakeResource": {} }' # O a recursos específicos

// La gestión granular de acceso se realiza a través de estas configuraciones,
// y luego los servicios de análisis como Athena o Redshift Spectrum
// respetarán estos permisos automáticamente.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Data Engineering',
    'topic': 'Data Lakes',
    'subtopic': 'Data catalog avanzado',
    'definition': '''
Un "data catalog avanzado" es mucho más que un simple índice de dónde están tus datos. Es un repositorio centralizado de metadatos (datos sobre datos) que no solo describe la ubicación y el esquema de tus conjuntos de datos, sino que también incluye información sobre su calidad, linaje (de dónde vienen y cómo se transforman), quién los posee, y su sensibilidad o clasificaciones de seguridad.

No sé tú, pero a mí esto al principio me costó 🤯 entenderlo bien. En un data lake masivo, es fácil perderse. Sin un buen catálogo, los científicos de datos y analistas pasan la mayor parte de su tiempo buscando y tratando de entender los datos, en lugar de analizarlos.

Aquí te va la aclaración: En un entorno de data lake, los datos llegan en muchos formatos y de muchas fuentes, y pueden ser transformados en múltiples etapas. Un data catalog avanzado (como el que se puede construir con AWS Glue Data Catalog, a menudo extendido con herramientas de terceros o características como AWS Lake Formation para seguridad) organiza toda esta información de manera significativa. Permite la **búsqueda y descubrimiento** de datos, haciendo que sea fácil para los usuarios encontrar lo que necesitan. Ofrece **linaje de datos**, mostrando cómo los datos fluyen y se transforman a través de los pipelines de ETL. Facilita la **gobernanza y el cumplimiento** al registrar la propiedad, las clasificaciones de seguridad y las reglas de acceso. Y, crucialmente, soporta el **auto-descubrimiento de esquemas** para datos semi-estructurados y no estructurados, adaptándose a la naturaleza cambiante de los datos en un data lake. Es como una "biblioteca inteligente" para todos los datos de tu organización, empoderando a los usuarios de datos para que confíen en la información que están utilizando y aceleren sus proyectos de análisis y aprendizaje automático.
''',
    'code_example': r'''
// Un Data Catalog es una capacidad de plataforma, no algo que se implemente
// con código de aplicación directamente. AWS Glue Data Catalog es el servicio
// fundamental para esto en AWS, y se gestiona a través de la consola, CLI o IaC.

// Ejemplo conceptual de cómo AWS Glue Crawler podría "rastrear" datos en S3
// y poblar el Data Catalog.

/*
// Paso 1: Configurar un Crawler de AWS Glue (conceptual)
// Esto se haría típicamente a través de la consola de AWS o un script de CloudFormation.

// Configuración del Crawler:
// - Nombre: `my-sales-data-crawler`
// - Rol de IAM: Un rol con permisos para leer S3 y escribir en el Data Catalog.
// - Origen de datos: `s3://my-company-data-lake-raw/sales/`
// - Frecuencia: Diaria o bajo demanda
// - Base de datos de destino en Glue Catalog: `sales_db`

// Luego, ejecutas el crawler:
// aws glue start-crawler --name my-sales-data-crawler

// Una vez que el crawler se ejecuta, detectaría archivos en S3 como:
// s3://my-company-data-lake-raw/sales/2023/11/01/data.csv
// s3://my-company-data-lake-raw/sales/2023/11/02/data.json
// Y crearía tablas en el AWS Glue Data Catalog, por ejemplo:
// - Base de datos: `sales_db`
// - Tabla: `raw_sales_csv` (con el esquema inferido de data.csv)
// - Tabla: `raw_sales_json` (con el esquema inferido de data.json)

// Paso 2: Consultar el Data Catalog (ej. con Athena)
// Los analistas o científicos de datos usarían Athena para consultar estas tablas,
// sin necesidad de saber dónde están los datos en S3 o su formato.

// SELECT * FROM "sales_db"."raw_sales_csv" LIMIT 10;
// SELECT product_id, sum(amount) FROM "sales_db"."raw_sales_csv" GROUP BY product_id;

// Un "data catalog avanzado" iría más allá, quizás usando etiquetas, descripciones
// y la integración con herramientas de gobernanza para añadir contexto y reglas
// de seguridad a estas tablas en el catálogo.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Data Engineering',
    'topic': 'Data Lakes',
    'subtopic': 'Governanza de datos',
    'definition': '''
La gobernanza de datos (Data Governance) se refiere al conjunto de políticas, procesos, roles y estándares que aseguran que los datos de una organización se gestionen de manera efectiva, segura, consistente y conforme a las regulaciones. En el contexto de un data lake, la gobernanza de datos es crucial para mantener la calidad, seguridad, privacidad, y usabilidad de los vastos volúmenes de información.

No sé tú, pero a mí esto al principio me costó 🤯. Puede sonar a algo muy abstracto y burocrático, pero en realidad es fundamental para que los datos sean un activo valioso y no un riesgo.

Aquí te va la aclaración: Sin una gobernanza adecuada, un data lake puede convertirse rápidamente en un "data swamp" (pantano de datos), donde los datos son difíciles de encontrar, no son fiables, o plantean riesgos de seguridad y cumplimiento. La gobernanza de datos en un data lake aborda varias áreas clave:

1.  **Seguridad y Acceso**: Definir quién puede acceder a qué datos, a qué nivel de granularidad (base de datos, tabla, columna, fila) y para qué propósito. Esto se logra con herramientas como AWS Lake Formation.
2.  **Calidad de Datos**: Establecer reglas y procesos para asegurar que los datos sean precisos, completos, consistentes y estén actualizados. Esto puede implicar la implementación de perfiles de datos, validaciones y procedimientos de limpieza.
3.  **Linaje de Datos**: Rastrear el origen de los datos y cómo se transforman a lo largo de los pipelines de procesamiento, lo cual es vital para la auditoría y la resolución de problemas.
4.  **Cumplimiento Normativo**: Asegurar que el manejo de los datos cumpla con regulaciones como GDPR, HIPAA, LGPD, etc., especialmente para datos sensibles o PII (Información Personal Identificable).
5.  **Propiedad y Responsabilidad**: Asignar roles y responsabilidades claras para la gestión de diferentes conjuntos de datos.
6.  **Retención de Datos**: Establecer políticas para cuánto tiempo se deben almacenar los datos.

Al implementar una gobernanza de datos sólida, las organizaciones pueden maximizar el valor de su data lake, mitigar riesgos, mejorar la confianza en los datos y tomar decisiones empresariales más acertadas. Las grandes corporaciones, especialmente en sectores regulados, invierten fuertemente en esto para proteger sus datos y su reputación.
''',
    'code_example': r'''
// La gobernanza de datos es principalmente un conjunto de políticas, procesos
// y la configuración de herramientas de plataforma, más que código de aplicación.
// No hay un "código de gobernanza de datos" como tal.

// Sin embargo, podemos ilustrar cómo ciertas herramientas y configuraciones de AWS
// contribuyen a la gobernanza de datos en un data lake.

// 1. Control de acceso con AWS Lake Formation (ya visto, pero reiterar su rol clave aquí)
//    - Definir permisos a nivel de tabla/columna/fila para usuarios y roles de IAM.

// 2. Cifrado de datos (en S3 para datos en reposo, en tránsito para comunicaciones)
//    - Cifrado del bucket S3:
//      // aws s3api put-bucket-encryption \
//      //   --bucket my-company-data-lake-raw \
//      //   --server-side-encryption-configuration '{"Rules":[{"ApplyServerSideEncryptionByDefault":{"SSEAlgorithm":"AES256"}}]}'

// 3. Auditoría con AWS CloudTrail
//    - CloudTrail registra las llamadas a la API de AWS, lo que permite auditar
//      quién accedió a qué datos y cuándo.
//      // aws cloudtrail create-trail --name MyDataLakeTrail --s3-bucket-name my-cloudtrail-logs-bucket

// 4. Clasificación de datos sensibles con AWS Macie
//    - Macie descubre y clasifica automáticamente datos sensibles (ej. PII) en S3.
//      Esto ayuda a aplicar las políticas de gobernanza adecuadas.
//      // No hay una CLI simple para "activar" Macie y sus resultados se ven en la consola.

// 5. Gestión de la calidad de datos (parte del pipeline ETL, ej. con AWS Glue)
//    - Implementar validaciones y transformaciones de limpieza en los scripts de Glue.
//      // Ejemplo conceptual dentro de un script de AWS Glue (Python PySpark):
//      // from awsglue.transforms import *
//      //
//      // # Aplicar una regla de calidad: eliminar filas con valores nulos en una columna clave
//      // # df = df.filter("product_id IS NOT NULL")
//      //
//      // # Validar el formato de una columna
//      // # df = df.withColumn("email_valid", regexp_extract(col("email"), "REGEX_EMAIL_PATTERN", 0) != "")
//      // # df = df.filter(col("email_valid") == True)

// La gobernanza de datos es la capa de gestión que asegura que todas estas capacidades
// técnicas se utilicen de manera coherente y efectiva.
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Data Engineering',
    'topic': 'ETL Avanzado',
    'subtopic': 'AWS Glue avanzado',
    'definition': '''
AWS Glue es un servicio de extracción, transformación y carga (ETL) sin servidor y completamente administrado. En un nivel avanzado, Glue va más allá de ser una simple herramienta de arrastrar y soltar; te permite construir pipelines de datos complejos y escalables, integrar diversas fuentes de datos y gestionar metadatos con el AWS Glue Data Catalog, todo sin tener que aprovisionar o administrar servidores.

No sé tú, pero a mí esto al principio me costó 🤯. La idea principal es que no tienes que preocuparte por la infraestructura subyacente para ejecutar tus trabajos de ETL, y puedes procesar cantidades masivas de datos de forma eficiente.

Aquí te va la aclaración: A nivel avanzado, AWS Glue se utiliza para tareas de ETL mucho más sofisticadas. Esto incluye:
1.  **Escalabilidad dinámica**: Glue escala automáticamente la capacidad de computación (usando Spark) para manejar grandes conjuntos de datos, lo que es ideal para data lakes.
2.  **Desarrollo con Python/Scala**: Aunque ofrece una interfaz visual, los trabajos avanzados de Glue se escriben en PySpark (Python) o Scala, permitiendo lógica de transformación compleja, manejo de errores y personalización.
3.  **AWS Glue Data Catalog**: Es el corazón de Glue, un repositorio central de metadatos que almacena información sobre tablas, esquemas, ubicaciones de datos. Glue usa "crawlers" para descubrir automáticamente los esquemas en tus fuentes de datos y poblar el catálogo.
4.  **Glue Studio**: Una interfaz visual para crear, ejecutar y monitorear trabajos de ETL, que puede ser útil para prototipos rápidos o trabajos menos complejos, pero el verdadero poder está en los scripts personalizados.
5.  **Integración con otros servicios**: Se integra perfectamente con S3 (para data lakes), Athena (para consultas ad-hoc), Redshift (para data warehousing) y Lake Formation (para gobernanza).
6.  **Data Quality**: Glue proporciona funciones para mejorar la calidad de los datos, deduplicación y coincidencias.

Las empresas usan AWS Glue avanzado para transformar datos de muchas fuentes (bases de datos relacionales, S3, streaming) en formatos optimizados para análisis (ej. Parquet, ORC) y cargarlos en un data lake o un data warehouse, habilitando así el análisis y el aprendizaje automático a escala.
''',
    'code_example': r'''
// AWS Glue Jobs se escriben en Python (PySpark) o Scala.
// Este es un ejemplo conceptual de un script PySpark para un trabajo de AWS Glue,
// que leería datos de S3, los transformaría y los escribiría de vuelta a S3.

/*
// my_glue_job.py (Ejemplo de script de trabajo de AWS Glue)

import sys
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job

## @params --JOB_NAME
args = getResolvedOptions(sys.argv, ['JOB_NAME'])

sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init(args['JOB_NAME'], args)

# 1. Leer datos de una fuente (ej. S3 - datos crudos)
# Se asume que esta tabla 'raw_sales' ya está definida en el AWS Glue Data Catalog
# por un Glue Crawler o manualmente.
datasource0 = glueContext.create_dynamic_frame.from_catalog(
    database="sales_db",
    table_name="raw_sales",
    transformation_ctx="datasource0"
)

# 2. Aplicar transformaciones (ej. limpiar, filtrar, agregar, cambiar tipo de datos)
# Convertir a DataFrame de Spark para usar operaciones de DataFrame
df = datasource0.toDF()

# Ejemplo de transformación:
# - Filtrar filas donde 'amount' sea nulo
# - Convertir 'timestamp' a formato de fecha
# - Agregar una nueva columna 'revenue_usd'
from pyspark.sql.functions import col, to_date, sum as spark_sum

df_transformed = df.filter(col("amount").isNotNull()) \
                   .withColumn("transaction_date", to_date(col("timestamp"), "yyyy-MM-dd HH:mm:ss")) \
                   .withColumn("revenue_usd", col("amount") * 0.85) # Simulación de conversión

# 3. Escribir los datos transformados a un destino (ej. S3 - zona curada, en formato Parquet)
# Se particionaría por fecha para optimizar consultas futuras
output_path = "s3://my-company-data-lake-curated/sales_processed/"
df_transformed.write \
              .mode("overwrite") \
              .partitionBy("transaction_date") \
              .parquet(output_path)

print(f"Successfully processed data and wrote to {output_path}")

job.commit()

// Para ejecutar este trabajo, lo subirías a AWS Glue y lo configurarías allí,
// especificando el rol de IAM, las librerías necesarias y los parámetros.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Data Engineering',
    'topic': 'ETL Avanzado',
    'subtopic': 'AWS Step Functions para ETL',
    'definition': '''
AWS Step Functions es un servicio de flujo de trabajo sin servidor que te permite construir aplicaciones distribuidas y orquestar flujos de trabajo complejos que involucran múltiples servicios de AWS. Cuando se aplica a ETL (Extracción, Transformación y Carga), Step Functions se convierte en una herramienta poderosa para orquestar pipelines de datos complejos que pueden involucrar AWS Glue, AWS Lambda, Amazon S3, Amazon Athena y otros.

No sé tú, pero a mí esto al principio me costó 🤯 entenderlo bien. La idea es que puedes visualizar y gestionar cada paso de tu pipeline de datos como un estado en una "máquina de estados", lo que lo hace muy robusto y fácil de depurar.

Aquí te va la aclaración: A diferencia de los trabajos ETL monolíticos, los pipelines de datos modernos suelen ser modulares, con diferentes pasos (extracción, limpieza, transformación, carga) realizados por servicios especializados. Step Functions te permite:
1.  **Orquestación Visual**: Defines tu flujo de trabajo como una máquina de estados en un lenguaje JSON llamado Amazon States Language, que es fácil de entender y visualizar.
2.  **Manejo de Errores y Reintentos**: Puedes configurar lógica de reintentos, capturar errores específicos y definir rutas alternativas en caso de fallos, lo que aumenta la robustez de tu pipeline de datos.
3.  **Paralelización**: Ejecutar múltiples pasos en paralelo para acelerar el procesamiento de grandes conjuntos de datos.
4.  **Integración nativa**: Se integra directamente con más de 200 servicios de AWS, lo que facilita invocar funciones Lambda, iniciar trabajos de Glue, ejecutar consultas de Athena, enviar notificaciones SNS, etc.
5.  **Pausas y Esperas**: Puedes pausar un flujo de trabajo para esperar la aprobación humana o que un evento externo ocurra.
6.  **Sin servidor**: No tienes que gestionar ningún servidor para ejecutar tus flujos de trabajo; AWS Step Functions se encarga de todo.

Esto hace que Step Functions sea ideal para orquestar pipelines de datos que requieren múltiples etapas, dependencias entre pasos, manejo de errores sofisticado y escalabilidad elástica, permitiendo a los ingenieros de datos construir flujos de trabajo ETL altamente fiables y complejos.
''',
    'code_example': r'''
// AWS Step Functions se define usando el lenguaje Amazon States Language (JSON).
// Este es un ejemplo conceptual de una máquina de estados para un pipeline ETL simple.

/*
// my_etl_workflow.asl.json (Amazon States Language)
{
  "Comment": "Un flujo de trabajo ETL simple para procesar datos de ventas",
  "StartAt": "ExtractRawData",
  "States": {
    "ExtractRawData": {
      "Type": "Task",
      "Resource": "arn:aws:states:::glue:startJobRun.sync", // Invocar un trabajo de Glue
      "Parameters": {
        "JobName": "glue-job-extract-sales-data",
        "Arguments": {
          "--source_bucket": "$.Input.SourceBucket",
          "--source_key": "$.Input.SourceKey"
        }
      },
      "Catch": [
        {
          "ErrorEquals": [ "States.ALL" ],
          "Next": "HandleExtractionFailure"
        }
      ],
      "Next": "TransformData"
    },
    "TransformData": {
      "Type": "Task",
      "Resource": "arn:aws:states:::glue:startJobRun.sync",
      "Parameters": {
        "JobName": "glue-job-transform-sales-data",
        "Arguments": {
          "--input_path": "$.Output.JobRun.Execution.Output.DataPath"
        }
      },
      "Catch": [
        {
          "ErrorEquals": [ "States.ALL" ],
          "Next": "HandleTransformationFailure"
        }
      ],
      "Next": "LoadDataToWarehouse"
    },
    "LoadDataToWarehouse": {
      "Type": "Task",
      "Resource": "arn:aws:states:::aws-sdk:redshiftdata:executeStatement", // Ejecutar consulta en Redshift
      "Parameters": {
        "ClusterIdentifier": "my-redshift-cluster",
        "Database": "dev",
        "DbUser": "awsuser",
        "Sql": "COPY sales_table FROM '$.Output.JobRun.Execution.Output.ProcessedDataPath' IAM_ROLE 'arn:aws:iam::ACCOUNT_ID:role/RedshiftCopyRole' FORMAT AS PARQUET;"
      },
      "Catch": [
        {
          "ErrorEquals": [ "States.ALL" ],
          "Next": "HandleLoadFailure"
        }
      ],
      "End": true
    },
    "HandleExtractionFailure": {
      "Type": "Task",
      "Resource": "arn:aws:states:::sns:publish", // Enviar notificación SNS
      "Parameters": {
        "TopicArn": "arn:aws:sns:REGION:ACCOUNT_ID:ETLFailureNotification",
        "Message": "ExtractRawData job failed!"
      },
      "End": true
    },
    "HandleTransformationFailure": {
      "Type": "Task",
      "Resource": "arn:aws:states:::sns:publish",
      "Parameters": {
        "TopicArn": "arn:aws:sns:REGION:ACCOUNT_ID:ETLFailureNotification",
        "Message": "TransformData job failed!"
      },
      "End": true
    },
    "HandleLoadFailure": {
      "Type": "Task",
      "Resource": "arn:aws:states:::sns:publish",
      "Parameters": {
        "TopicArn": "arn:aws:sns:REGION:ACCOUNT_ID:ETLFailureNotification",
        "Message": "LoadDataToWarehouse job failed!"
      },
      "End": true
    }
  }
}
*/

// Para desplegar y ejecutar este flujo de trabajo, lo definirías en la consola de AWS Step Functions
// o mediante AWS CLI/CloudFormation, y luego lo iniciarías con un input JSON.
// aws stepfunctions start-execution --state-machine-arn "arn:aws:states:..." --input '{"SourceBucket": "my-raw-data", "SourceKey": "sales_2023.csv"}'
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Data Engineering',
    'topic': 'ETL Avanzado',
    'subtopic': 'AWS Data Pipeline',
    'definition': '''
AWS Data Pipeline es un servicio web que te ayuda a procesar y mover datos entre diferentes servicios de AWS de manera fiable y a intervalos regulares. Aunque AWS Glue y Step Functions son más modernos y flexibles para muchos casos de uso, Data Pipeline sigue siendo una opción válida para flujos de trabajo de datos recurrentes, especialmente si tienes necesidades de mover datos desde o hacia fuentes on-premises o integrar con servicios específicos de AWS que no tienen una integración tan directa con Glue o Step Functions.

No sé tú, pero a mí esto al principio me costó 🤯. La idea principal es que es una herramienta para programar y automatizar el movimiento y la transformación de datos.

Aquí te va la aclaración: Data Pipeline te permite definir una serie de actividades de datos, como copiar datos de una ubicación a otra, ejecutar scripts de Hive o Pig en un clúster de EMR, ejecutar funciones SQL en una base de datos o ejecutar comandos shell. Puedes programar estas actividades para que se ejecuten en intervalos de tiempo definidos (ej. cada hora, cada día). A diferencia de Glue (que se enfoca en el procesamiento de Spark) o Step Functions (que es un orquestador de flujos de trabajo de propósito general), Data Pipeline está más centrado en la **programación y el movimiento de datos** entre fuentes y destinos. Sus características clave incluyen:
1.  **Programación**: Define cuándo se ejecutan tus pipelines de datos.
2.  **Manejo de dependencias**: Puedes especificar que una actividad solo se ejecute después de que otra haya finalizado con éxito.
3.  **Manejo de errores y reintentos**: Soporta reintentos automáticos y lógica de manejo de errores.
4.  **Integración con EC2/EMR**: Permite lanzar instancias EC2 o clústeres EMR para ejecutar tus tareas.

Aunque en muchos escenarios modernos AWS Glue y Step Functions son las opciones preferidas por su escalabilidad sin servidor y su flexibilidad, Data Pipeline sigue siendo útil para ciertas cargas de trabajo heredadas, escenarios híbridos (on-premises a la nube) o cuando necesitas una orquestación muy específica de recursos de computación gestionados por ti (como EC2).
''',
    'code_example': r'''
// AWS Data Pipeline se define mediante una plantilla JSON que describe
// los componentes (actividades, programaciones, recursos).
// No hay un código de aplicación directo que interactúe con Data Pipeline.

// Ejemplo conceptual de una definición de pipeline de datos en JSON:

/*
// my_data_pipeline_definition.json
{
  "objects": [
    {
      "id": "Default",
      "type": "Default",
      "pipelineLogUri": "s3://my-pipeline-logs/", // Dónde guardar los logs
      "resourceRole": "arn:aws:iam::ACCOUNT_ID:role/DataPipelineDefaultResourceRole",
      "role": "arn:aws:iam::ACCOUNT_ID:role/DataPipelineDefaultRole"
    },
    {
      "id": "DailySchedule",
      "type": "Schedule",
      "startDateTime": "2023-01-01T00:00:00",
      "endDateTime": "2024-01-01T00:00:00",
      "period": "1 day" // Ejecutar cada día
    },
    {
      "id": "Ec2Resource",
      "type": "Ec2Resource",
      "instanceType": "m5.large",
      "keyPair": "my-ec2-keypair",
      "terminateAfter": "1 hour" // Terminar después de 1 hora si no se usa
    },
    {
      "id": "S3ToS3CopyActivity",
      "type": "CopyActivity",
      "input": {
        "ref": "S3InputDataNode"
      },
      "output": {
        "ref": "S3OutputDataNode"
      },
      "runsOn": {
        "ref": "Ec2Resource"
      },
      "schedule": {
        "ref": "DailySchedule"
      }
    },
    {
      "id": "S3InputDataNode",
      "type": "S3DataNode",
      "directoryPath": "s3://my-source-bucket/raw_data/#{myDPConditionalId}/",
      "dataFormat": {
        "ref": "CsvDataFormat"
      }
    },
    {
      "id": "S3OutputDataNode",
      "type": "S3DataNode",
      "directoryPath": "s3://my-destination-bucket/processed_data/#{myDPConditionalId}/",
      "dataFormat": {
        "ref": "CsvDataFormat"
      }
    },
    {
      "id": "CsvDataFormat",
      "type": "CsvDataFormat",
      "columnSeparator": ","
    }
  ]
}
*/

// Para crear y activar este pipeline:
// aws datapipeline create-pipeline --name "MyDailyS3Copy" --unique-id "my-daily-s3-copy-pipeline"
// aws datapipeline put-pipeline-definition --pipeline-id "PIPELINE_ID_FROM_ABOVE" --pipeline-definition file://my_data_pipeline_definition.json
// aws datapipeline activate-pipeline --pipeline-id "PIPELINE_ID_FROM_ABOVE"
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Data Engineering',
    'topic': 'ETL Avanzado',
    'subtopic': 'Custom transforms',
    'definition': '''
Las "custom transforms", o transformaciones personalizadas, en el contexto de ETL avanzado, se refieren a la capacidad de escribir lógica de procesamiento de datos hecha a medida cuando las transformaciones estándar (como filtros, agregaciones o uniones) no son suficientes. Esto implica usar código de programación (como Python/PySpark, Scala, Java, u otros) para manipular los datos de formas complejas que abordan requisitos de negocio únicos o escenarios de datos desafiantes.

No sé tú, pero a mí esto al principio me costó 🤯 entenderlo bien. La idea es que, si bien las herramientas ETL ofrecen muchas transformaciones predefinidas, el mundo real de los datos a menudo tiene "curvas" inesperadas que solo el código puede manejar.

Aquí te va la aclaración: En un pipeline de ETL avanzado, a menudo te encuentras con datos que necesitan:
1.  **Limpieza compleja**: Más allá de eliminar nulos, como estandarizar direcciones, corregir errores tipográficos en nombres, o manejar formatos de fecha inconsistentes de múltiples fuentes.
2.  **Lógica de negocio específica**: Calcular métricas únicas, aplicar reglas de negocio complejas que dependen de múltiples campos o de datos históricos, o enriquecer datos con información de fuentes externas.
3.  **Manejo de datos semi-estructurados/no estructurados**: Parsear JSON anidados, XML complejos, o incluso texto libre para extraer información relevante.
4.  **Desduplicación sofisticada**: Identificar y fusionar registros duplicados utilizando algoritmos avanzados que pueden no ser simples coincidencias exactas.
5.  **Transformaciones condicionales**: Aplicar diferentes lógicas de transformación basándose en el valor de ciertos campos o en las características de los datos.

En servicios como AWS Glue, las "custom transforms" se implementan escribiendo scripts PySpark o Scala que se ejecutan en un entorno distribuido. Esto te da la flexibilidad y el poder de un lenguaje de programación completo para abordar cualquier reto de transformación de datos, permitiéndote construir pipelines ETL altamente sofisticados que pueden manejar los conjuntos de datos más complejos y las necesidades de negocio más exigentes. La capacidad de escribir estas transformaciones personalizadas es lo que realmente diferencia un ingeniero de datos avanzado y permite a las empresas desbloquear el valor de sus datos más complejos.
''',
    'code_example': r'''
// Las transformaciones personalizadas en ETL se implementan directamente en los scripts
// que ejecutan el proceso ETL. Para AWS Glue, esto significa PySpark o Scala.

// Ejemplo conceptual de una transformación personalizada en un script PySpark de AWS Glue.
// Este ejemplo simula una limpieza y enriquecimiento de datos de ventas.

/*
# my_custom_transform_job.py

import sys
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job
from pyspark.sql.functions import col, udf, when, lit
from pyspark.sql.types import StringType, DoubleType

## @params --JOB_NAME
args = getResolvedOptions(sys.argv, ['JOB_NAME'])

sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init(args['JOB_NAME'], args)

# Leer datos de una fuente (ej. S3)
# Simular un DataFrame de PySpark como si viniera de un DynamicFrame de Glue
data = [
    ("order_1", "  Product A  ", "ONLINE ", "100.50", "USA", "email@example.com"),
    ("order_2", "Product B", "  STORE ", "50.25", "canada", "invalid-email"),
    ("order_3", "Product C", "ONLINE", "75", "mexico", "another@example.com"),
    ("order_4", "Product D", "WEB", None, "USA", "test@test.com")
]
columns = ["order_id", "product_name", "channel", "amount", "country", "customer_email"]
df = spark.createDataFrame(data, columns)

print("DataFrame Original:")
df.show()
df.printSchema()

# --- Custom Transformaciones ---

# 1. Limpieza de strings (trim y mayúsculas/minúsculas)
df_cleaned = df.withColumn("product_name", col("product_name").trim()) \
               .withColumn("channel", col("channel").trim()) \
               .withColumn("country", col("country").trim().alias("country_code")) # Renombrar para mayor claridad

# 2. Estandarización de valores (ej. convertir "WEB" a "ONLINE")
df_standardized_channel = df_cleaned.withColumn(
    "channel",
    when(col("channel") == "WEB", lit("ONLINE"))
    .otherwise(col("channel"))
)

# 3. Validación y cast de tipos de datos (convertir monto a Double, manejar nulos)
# También, simular una validación de email con un UDF (User Defined Function)
@udf(returnType=StringType())
def validate_email_udf(email):
    if email is None:
        return "INVALID"
    if "@" in email and "." in email: # Validación simple, usar regex para robustez
        return "VALID"
    return "INVALID"

df_validated_types = df_standardized_channel \
    .withColumn("amount", col("amount").cast(DoubleType())) \
    .withColumn("email_status", validate_email_udf(col("customer_email")))

# 4. Enriquecimiento de datos (ej. añadir una columna basada en una lookup o lógica compleja)
# Aquí, una simulación simple de asignación de región basada en país
df_enriched = df_validated_types.withColumn(
    "region",
    when(col("country").isin("USA", "canada", "mexico"), lit("NORTH_AMERICA"))
    .otherwise(lit("OTHER"))
)

print("\nDataFrame Transformado:")
df_enriched.show()
df_enriched.printSchema()

# Escribir los datos transformados a un destino (ej. S3 en formato Parquet)
# output_path = "s3://my-processed-data/etl_custom_transform/"
# df_enriched.write.mode("overwrite").parquet(output_path)

job.commit()
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Data Engineering',
    'topic': 'Streaming Avanzado',
    'subtopic': 'Amazon Kinesis avanzado',
    'definition': r'''
Amazon Kinesis es un servicio de AWS que te permite trabajar con grandes volúmenes de datos en tiempo real. Pensemos en un río de datos que fluye constantemente, y Kinesis te da las herramientas para recolectar, procesar y analizar ese río en el mismo momento en que los datos aparecen.

Seguramente te preguntarás por qué esto es tan útil en un mundo donde todo sucede al instante. Aquí te va la aclaración: las redes sociales, los sensores IoT, los logs de aplicaciones... todos generan una avalancha de información que, si la procesas en tiempo real, te puede dar una ventaja competitiva brutal, permitiéndote reaccionar a eventos en el momento exacto en que ocurren.

Kinesis no es solo un servicio, es una suite de servicios. Tienes Kinesis Data Streams para capturar y almacenar datos de streaming a gran escala, Kinesis Data Firehose para entregar esos datos a otros servicios de AWS como S3, Redshift o Splunk de forma sencilla, y Kinesis Data Analytics para ejecutar consultas SQL o Apache Flink en tus flujos de datos en tiempo real. También está Kinesis Video Streams, que está enfocado en la captura y procesamiento de video en vivo. La idea es que puedas construir arquitecturas complejas que reaccionen a eventos casi al instante, desde detectar fraudes en transacciones hasta monitorear el rendimiento de tus aplicaciones en vivo. Por ejemplo, una empresa de e-commerce podría usar Kinesis para analizar el comportamiento de los usuarios en su sitio web en tiempo real y ofrecer recomendaciones personalizadas al instante, o una empresa de logística para monitorear la ubicación de sus camiones y detectar retrasos a medida que ocurren.
''',
    'code_example': r'''
// Ejemplo básico de cómo un productor podría enviar datos a Kinesis Data Stream
// Esto es pseudocódigo Java para ilustrar el concepto.

import com.amazonaws.services.kinesis.AmazonKinesis;
import com.amazonaws.services.kinesis.AmazonKinesisClientBuilder;
import com.amazonaws.services.kinesis.model.PutRecordRequest;
import com.amazonaws.services.kinesis.model.PutRecordResult;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;

public class KinesisProducer {
    public static void main(String[] args) {
        final String streamName = "MyDataStream"; // Reemplaza con el nombre de tu stream
        final String region = "us-east-1"; // Reemplaza con tu región

        AmazonKinesis kinesisClient = AmazonKinesisClientBuilder.standard()
                .withRegion(region)
                .build();

        String data = "{\"event\":\"user_login\", \"timestamp\":" + System.currentTimeMillis() + "}";
        ByteBuffer dataBytes = ByteBuffer.wrap(data.getBytes(StandardCharsets.UTF_8));

        PutRecordRequest putRecordRequest = new PutRecordRequest();
        putRecordRequest.setStreamName(streamName);
        putRecordRequest.setData(dataBytes);
        putRecordRequest.setPartitionKey("user123"); // Clave de partición para distribuir los datos

        try {
            PutRecordResult putRecordResult = kinesisClient.putRecord(putRecordRequest);
            System.out.println("Registro enviado exitosamente. Secuencia: " + putRecordResult.getSequenceNumber());
        } catch (Exception e) {
            System.err.println("Error al enviar el registro: " + e.getMessage());
        }
    }
}

// Ejemplo de una configuración incorrecta común: no manejar excepciones o no cerrar el cliente.
// public class BadKinesisProducer {
//     public static void main(String[] args) {
//         AmazonKinesis kinesisClient = AmazonKinesisClientBuilder.standard().build();
//         // Falta manejo de excepciones y el cliente no se cierra, lo que puede llevar a problemas de recursos.
//         kinesisClient.putRecord(new PutRecordRequest());
//     }
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Data Engineering',
    'topic': 'Streaming Avanzado',
    'subtopic': 'Apache Flink en AWS',
    'definition': r'''
Apache Flink es un framework de procesamiento de flujos de datos distribuido, lo que significa que está diseñado para manejar cantidades masivas de datos que llegan de forma continua. Piensa en Flink como una fábrica superrápida que procesa y transforma los datos a medida que llegan, sin necesidad de esperar a que se acumule un gran lote. Es especialmente bueno para tareas que requieren una baja latencia y una alta tolerancia a fallos.

Quizás te estés preguntando dónde encaja esto en el ecosistema de AWS. La verdad es que Flink es el motor detrás de Kinesis Data Analytics para Apache Flink, lo que te permite ejecutar aplicaciones de Flink directamente en AWS sin tener que preocuparte por la gestión de la infraestructura subyacente. Esto es una ventaja enorme, ya que te liberas de la complejidad de configurar y mantener clústeres de Flink, permitiéndote concentrarte en escribir la lógica de tu aplicación para procesar los datos.

Con Apache Flink en AWS, puedes construir aplicaciones de streaming muy sofisticadas. Por ejemplo, puedes realizar agregaciones en tiempo real para cuadros de mando, detectar anomalías en flujos de datos (como transacciones fraudulentas o fallos en equipos), o incluso enriquecer tus datos de streaming conectándolos con bases de datos. Su capacidad para manejar tanto procesamiento por lotes como por flujos lo hace increíblemente versátil. Empresas como Uber o Netflix, aunque no necesariamente usando Flink en AWS para todo, sí utilizan conceptos similares de procesamiento de streaming a gran escala para sus operaciones críticas, demostrando el poder de estas arquitecturas.
''',
    'code_example': r'''
// Ejemplo conceptual de una aplicación Apache Flink en Java (solo la estructura básica)
// Esto sería ejecutado dentro del entorno de Kinesis Data Analytics para Apache Flink

import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.streaming.api.datastream.DataStream;
import org.apache.flink.api.common.serialization.SimpleStringSchema;
import org.apache.flink.streaming.connectors.kinesis.FlinkKinesisConsumer;
import java.util.Properties;

public class BasicFlinkKinesisApp {
    public static void main(String[] args) throws Exception {
        // Configura el entorno de ejecución de Flink
        final StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();

        // Propiedades para conectar con Kinesis
        Properties consumerConfig = new Properties();
        consumerConfig.setProperty("aws.region", "us-east-1"); // Reemplaza con tu región
        consumerConfig.setProperty("flink.stream.initpos", "LATEST"); // Leer desde el último registro

        // Crea un consumidor de Kinesis
        DataStream<String> kinesisStream = env.addSource(new FlinkKinesisConsumer<>(
                "MyInputStream", // Nombre de tu Kinesis Data Stream
                new SimpleStringSchema(),
                consumerConfig
        ));

        // Procesa los datos: por ejemplo, imprímelos o realiza alguna transformación
        kinesisStream.map(String::toUpperCase) // Convierte a mayúsculas
                     .print(); // Imprime en la consola del log (o a un sink real)

        // Ejecuta el trabajo de Flink
        env.execute("MyFirstFlinkKinesisApp");
    }
}

// Un error común: olvidar ejecutar el entorno de Flink (env.execute()) al final del programa.
// Esto haría que la aplicación no se inicie y no procese ningún dato.
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Data Engineering',
    'topic': 'Streaming Avanzado',
    'subtopic': 'Kafka en AWS (MSK)',
    'definition': r'''
Apache Kafka es una plataforma distribuida de streaming de eventos de código abierto, conocida por su alta capacidad para manejar flujos de datos en tiempo real. Imagina un sistema de mensajería superpotente donde los datos se publican en "topics" y luego son consumidos por diferentes aplicaciones, todo de manera asíncrona y muy eficiente. Es la columna vertebral de muchas arquitecturas modernas basadas en eventos.

Aquí te va la aclaración: ejecutar y mantener un clúster de Kafka por tu cuenta puede ser un dolor de cabeza, ya que implica gestionar servidores, monitoreo, escalado, y copias de seguridad. AWS lo resuelve con Amazon Managed Streaming for Apache Kafka (MSK). MSK es un servicio totalmente administrado que facilita la configuración, ejecución y escalado de clústeres de Kafka en AWS, lo que te permite enfocarte en construir tus aplicaciones de streaming en lugar de lidiar con la infraestructura.

Con MSK, puedes construir arquitecturas que manejan datos en tiempo real para análisis, monitoreo, o incluso para sincronizar bases de datos. Por ejemplo, una empresa de juegos en línea podría usar MSK para recopilar los eventos de los jugadores en tiempo real, lo que le permitiría analizar el comportamiento y detectar trampas al instante. También es ideal para sistemas de logs centralizados, donde todos los logs de tus aplicaciones se envían a Kafka para su posterior procesamiento y análisis. Es robusto, escalable y muy confiable, lo que lo convierte en una opción excelente para cargas de trabajo de streaming críticas.
''',
    'code_example': r'''
// Ejemplo conceptual de cómo un productor Java se conecta a Kafka (MSK)
// y envía un mensaje.

import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.clients.producer.RecordMetadata;

import java.util.Properties;
import java.util.concurrent.Future;

public class KafkaProducerExample {
    public static void main(String[] args) {
        Properties props = new Properties();
        // Reemplaza con los brokers de tu clúster MSK
        props.put("bootstrap.servers", "b-1.your-msk-cluster.xyz.kafka.us-east-1.amazonaws.com:9092");
        props.put("key.serializer", "org.apache.kafka.common.serialization.StringSerializer");
        props.put("value.serializer", "org.apache.kafka.common.serialization.StringSerializer");

        KafkaProducer<String, String> producer = new KafkaProducer<>(props);
        String topicName = "my-test-topic"; // Nombre de tu topic de Kafka
        String key = "messageKey";
        String value = "Este es un mensaje de prueba para Kafka en MSK.";

        ProducerRecord<String, String> record = new ProducerRecord<>(topicName, key, value);

        try {
            Future<RecordMetadata> future = producer.send(record);
            RecordMetadata metadata = future.get(); // Espera a que el mensaje sea enviado
            System.out.println("Mensaje enviado exitosamente a topic " + metadata.topic() +
                               ", partición " + metadata.partition() +
                               ", offset " + metadata.offset());
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            producer.close(); // Cierra el productor para liberar recursos
        }
    }
}

// Un error común: no configurar correctamente los 'bootstrap.servers' o los serializadores.
// Esto impediría que el productor se conecte al clúster o que los datos sean interpretados correctamente.
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Data Engineering',
    'topic': 'Streaming Avanzado',
    'subtopic': 'Stream processing patterns',
    'definition': r'''
Los patrones de procesamiento de streaming son arquitecturas y enfoques probados que se utilizan para diseñar sistemas que manejan datos en tiempo real. No se trata de una tecnología específica, sino de cómo combinas diferentes herramientas y servicios para construir soluciones eficientes para datos que fluyen continuamente. Son como los planos de una casa, te dicen cómo organizar las habitaciones (tus servicios) para que todo funcione bien.

Seguramente pensarás de qué va todo esto o por qué son importantes. Aquí te va la aclaración: el procesamiento de streaming puede ser complejo, y estos patrones te ofrecen una guía para evitar errores comunes y construir sistemas robustos y escalables. Por ejemplo, no es lo mismo querer detectar una anomalía que querer calcular el promedio de eventos en el último minuto. Cada uno requiere un enfoque diferente, y los patrones nos dan esas "recetas".

Existen varios patrones comunes. Uno es el patrón "Filter-and-Transform", donde simplemente filtras los datos irrelevantes y transformas los útiles. Otro es el patrón "Aggregation", donde acumulas datos durante un período de tiempo para calcular métricas (por ejemplo, el número total de clics en un sitio web cada 5 minutos). El patrón "Join" es para combinar flujos de datos de diferentes fuentes en tiempo real, lo que es útil si tienes datos de clientes y datos de productos fluyendo por separado. Y no podemos olvidar el patrón "Enrichment", donde se añaden más datos a un flujo existente, como adjuntar información del cliente a un evento de compra usando una base de datos de referencia. Aplicaciones como las plataformas de detección de fraude, los sistemas de recomendación en tiempo real o los dashboards de monitoreo en vivo son ejemplos perfectos donde estos patrones se aplican constantemente para darle sentido a la inmensa cantidad de datos que recibimos a cada segundo.
''',
    'code_example': r'''
// Este ejemplo es conceptual y no es código ejecutable en Dart o un lenguaje específico.
// Ilustra la lógica detrás de un patrón de "Filter-and-Transform" para un flujo de eventos.

/*
  // Diagrama conceptual de un flujo de procesamiento de streaming:

  Fuente de Datos (ej. Kinesis Stream)
       |
       V
  [Servicio de Procesamiento (ej. Flink / Lambda)]
       |
       |  (Patrón: Filter-and-Transform)
       |    - Filtra eventos donde 'status' no sea 'SUCCESS'
       |    - Transforma el formato del 'timestamp'
       V
  [Sink de Datos (ej. S3 / DynamoDB)]


// Pseudocódigo que representa la lógica de un "Filter-and-Transform"
// (similar a cómo se vería en una función Lambda o Flink)

function processStreamEvent(event):
    // 1. Deserializar el evento (asumimos JSON)
    parsedEvent = JSON.parse(event.data);

    // 2. Patrón de FILTRO: Ignorar eventos que no son de éxito
    if (parsedEvent.status != "SUCCESS"):
        log("Evento no exitoso, ignorando: " + parsedEvent.id);
        return; // No procesar más este evento

    // 3. Patrón de TRANSFORMACIÓN: Cambiar el formato de la fecha
    let originalTimestamp = parsedEvent.timestamp;
    let newTimestamp = formatTimestamp(originalTimestamp, "YYYY-MM-DD HH:mm:ss"); // Función de utilidad

    // 4. Enriquecer o modificar el evento
    parsedEvent.processed_at = Date.now();
    parsedEvent.readable_timestamp = newTimestamp;

    // 5. Publicar el evento transformado en otro lugar (ej. otro stream, base de datos)
    publishToOutput(parsedEvent);
    log("Evento procesado y transformado: " + parsedEvent.id);

function formatTimestamp(timestamp, format):
    // Lógica real para formatear la fecha
    // (Ejemplo: new Date(timestamp).toISOString().slice(0, 19).replace('T', ' '))
    return "formatted_" + timestamp; // Placeholder
*/

// Un error común en los patrones de streaming es no considerar la idempotencia
// (que procesar un mensaje varias veces no cause efectos secundarios indeseados)
// o no manejar errores de forma robusta, lo que puede llevar a pérdida de datos o inconsistencias.
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Data Engineering',
    'topic': 'Analytics Avanzado',
    'subtopic': 'Amazon Athena avanzado',
    'definition': r'''
Amazon Athena es un servicio de consultas interactivo que te permite analizar datos directamente en Amazon S3 utilizando SQL estándar. Piensa en Athena como una lupa superpotente que puedes apuntar a tus archivos en S3 para extraer información sin necesidad de cargar los datos a una base de datos tradicional. ¡Es totalmente serverless, lo que significa que no tienes que preocuparte por gestionar servidores!

Seguramente te preguntarás por qué esto es tan importante en el mundo del análisis de datos. Aquí te va la aclaración: muchas empresas almacenan enormes volúmenes de datos en S3 (data lakes), y poder consultarlos de forma ad-hoc, rápida y económica es fundamental para la toma de decisiones. Athena te permite hacer justamente eso, pagando solo por las consultas que ejecutas, lo que lo hace muy rentable.

En un nivel avanzado, Amazon Athena va más allá de las consultas básicas. Puedes usarlo para trabajar con formatos de datos complejos como JSON, Parquet o ORC, optimizando tus consultas para reducir los datos escaneados y, por ende, el costo. También puedes integrar Athena con AWS Glue Data Catalog, que actúa como un catálogo de metadatos centralizado, permitiéndote definir esquemas para tus datos en S3 y luego consultarlos fácilmente. Esto es crucial cuando tienes diferentes equipos o aplicaciones que necesitan acceder a los mismos datos en tu data lake. Además, Athena se puede integrar con otras herramientas de BI (Business Intelligence) como Amazon QuickSight o Tableau, para visualizaciones más potentes. De hecho, muchas empresas de análisis de datos utilizan Athena como la capa de consulta principal para sus data lakes, facilitando que científicos de datos y analistas exploren grandes volúmenes de información rápidamente.
''',
    'code_example': r'''
// Ejemplo conceptual de una consulta SQL avanzada en Amazon Athena
// No es código ejecutable en Dart, sino una consulta SQL típica.

/*
-- Creación de una tabla externa en Athena que apunta a datos Parquet en S3
-- Esto define cómo Athena interpreta los datos en tu bucket S3.
CREATE EXTERNAL TABLE IF NOT EXISTS transactions_parquet (
  transaction_id STRING,
  user_id STRING,
  amount DOUBLE,
  transaction_date TIMESTAMP,
  product_category STRING
)
PARTITIONED BY (year INT, month INT, day INT) -- Si tus datos están particionados en S3
ROW FORMAT SERDE 'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
WITH SERDEPROPERTIES (
  'serialization.format' = '1'
)
LOCATION 's3://your-data-lake-bucket/transactions/parquet/'; -- Ruta a tus datos Parquet en S3

-- Ejemplo de una consulta compleja para analizar el promedio de transacciones por categoría
-- para un período específico, usando particiones para optimización.
SELECT
  product_category,
  AVG(amount) AS average_transaction_amount,
  COUNT(DISTINCT user_id) AS distinct_users
FROM
  transactions_parquet
WHERE
  year = 2024 AND month = 10 AND day BETWEEN 1 AND 7 -- Filtrado por particiones para rendimiento
  AND amount > 0 -- Ejemplo de filtro adicional
GROUP BY
  product_category
HAVING
  COUNT(*) > 100 -- Solo categorías con más de 100 transacciones
ORDER BY
  average_transaction_amount DESC;

-- Un error común en Athena:
-- No particionar los datos en S3, lo que obliga a Athena a escanear más datos de los necesarios,
-- aumentando el tiempo de consulta y el costo.
-- Otro error: No usar formatos de columnares como Parquet/ORC, que son más eficientes.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Data Engineering',
    'topic': 'Analytics Avanzado',
    'subtopic': 'Amazon QuickSight avanzado',
    'definition': r'''
Amazon QuickSight es un servicio de Business Intelligence (BI) basado en la nube de AWS que te permite crear paneles de control interactivos, visualizaciones de datos y realizar análisis de datos de forma sencilla. Imagina que tienes un montón de números y datos por todos lados, y QuickSight es la herramienta que te ayuda a transformarlos en gráficos bonitos y fáciles de entender, para que puedas ver las tendencias y tomar decisiones rápidamente.

Aquí te va la aclaración: mientras que Athena te ayuda a consultar los datos, QuickSight se encarga de presentarlos de una manera visual e intuitiva. Es crucial para democratizar los datos dentro de una organización, permitiendo que incluso personas sin conocimientos técnicos profundos puedan explorar y entender la información.

En un nivel avanzado, Amazon QuickSight te ofrece capacidades mucho más potentes. Puedes utilizar SPICE (Super-fast, Parallel, In-memory Calculation Engine), que es el motor de memoria de QuickSight, para acelerar drásticamente el rendimiento de tus dashboards, incluso con conjuntos de datos muy grandes. Esto significa que tus informes se cargarán casi al instante, ofreciendo una experiencia de usuario fluida. También puedes crear paneles de control personalizados con una gran cantidad de opciones de formato y diseño, y compartirlos de forma segura con tu equipo o clientes. Una característica clave es la capacidad de usar "Q" (QuickSight Q), una función de lenguaje natural que te permite hacer preguntas a tus datos en inglés simple (ej. "Ventas totales del último trimestre por región"), y QuickSight generará la visualización correspondiente automáticamente. Esto cambia por completo la forma en que los usuarios interactúan con los datos, haciendo el análisis más accesible. Muchas empresas usan QuickSight para monitorear sus KPIs (Key Performance Indicators), ventas, o rendimiento de marketing en tiempo real, adaptándose rápidamente a los cambios del mercado.
''',
    'code_example': r'''
// Amazon QuickSight es una herramienta de BI basada en la interfaz gráfica de usuario (GUI)
// y no se interactúa con ella directamente mediante código como en una aplicación.
// Sin embargo, podemos conceptualizar los pasos para su uso avanzado.

/*
// Pasos conceptuales para usar Amazon QuickSight de forma avanzada:

1.  **Conexión a Fuentes de Datos Múltiples:**
    - Conectar QuickSight a Amazon S3 (para Data Lakes).
    - Conectar a Amazon Athena (para consultas directas sobre S3).
    - Conectar a Amazon Redshift (para Data Warehouses).
    - Conectar a Amazon RDS, DynamoDB, y otros.

2.  **Preparación de Datos (Data Prep):**
    - En la interfaz de QuickSight, realizar transformaciones de datos:
        - Uniones (Joins) entre diferentes tablas/fuentes.
        - Cálculos personalizados (ej. margen de beneficio, ratio de conversión).
        - Filtrados y agregaciones.

3.  **Uso de SPICE:**
    - Importar datos a SPICE para un rendimiento de consulta ultrarrápido.
    - Configurar programaciones de actualización de SPICE para mantener los datos frescos.

4.  **Creación de Visualizaciones Avanzadas:**
    - Selección de tipos de gráficos avanzados (mapas, gráficos de dispersión, embudos).
    - Uso de "parámetros" para permitir a los usuarios filtrar datos dinámicamente en el dashboard.
    - Creación de "controles" en el dashboard para interactividad del usuario.

5.  **Creación de Dashboards Interactivos:**
    - Diseño de layouts de dashboard intuitivos y estéticos.
    - Enlazar visualizaciones para que el clic en una filtre las demás.
    - Publicar y compartir el dashboard con permisos específicos de usuario/grupo.

6.  **Uso de Amazon QuickSight Q (Lenguaje Natural):**
    - Entrenar a Q con términos y sinónimos específicos de tu negocio.
    - Los usuarios finales pueden escribir preguntas como: "Ventas de productos en Europa el último mes por vendedor".

// Un error común al usar QuickSight de forma avanzada:
// No optimizar las fuentes de datos subyacentes (ej. consultas Athena ineficientes o datos no particionados en S3),
// lo que puede ralentizar la ingesta a SPICE o las consultas directas.
// Otro error: Sobrecargar SPICE con datos innecesarios, lo que aumenta los costos.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Data Engineering',
    'topic': 'Analytics Avanzado',
    'subtopic': 'Embedded analytics',
    'definition': r'''
La analítica embebida (Embedded Analytics) es la integración de capacidades de Business Intelligence (BI) y visualización de datos directamente dentro de tus aplicaciones, portales web o flujos de trabajo existentes. En lugar de que tus usuarios tengan que ir a una herramienta de BI separada para ver sus informes, la analítica embebida trae esos informes y dashboards directamente a la aplicación que ya están usando. Pensemos por un momento en una tienda online donde, como vendedor, puedes ver tus métricas de ventas directamente en tu panel de administración, sin tener que abrir un software de análisis aparte.

Esto tiene una explicación, y es porque es una forma poderosa de hacer que los datos sean más accesibles y accionables. Al integrar los insights directamente en el contexto del usuario, reduces la fricción y aumentas la probabilidad de que los datos se utilicen para tomar decisiones. Ya no se trata solo de ver números, sino de tomar acciones basadas en esos números en el mismo lugar de trabajo.

Con AWS, puedes lograr la analítica embebida principalmente a través de Amazon QuickSight, que ofrece capacidades robustas para incrustar dashboards y visualizaciones. Esto implica generar URLs o snippets de código que puedes insertar en tu aplicación web o móvil. Puedes controlar el aspecto y la sensación de los dashboards incrustados para que coincidan con la marca de tu aplicación, y también gestionar los permisos de los usuarios para que solo vean los datos relevantes para ellos. Esto es especialmente útil para proveedores de SaaS (Software as a Service) que quieren ofrecer capacidades de reporting a sus clientes sin construir una solución de BI desde cero. Permite una experiencia de usuario fluida y coherente, ya que la analítica se siente como una parte nativa de la aplicación. Además, al estar basada en la nube, la solución es escalable y se gestiona fácilmente, sin la necesidad de preocuparte por la infraestructura subyacente.
''',
    'code_example': r'''
// Este ejemplo es conceptual y muestra cómo se generaría una URL de incrustación
// para un dashboard de QuickSight desde una aplicación backend (ej. Node.js con AWS SDK).

/*
// Pseudocódigo de backend (ej. Node.js con AWS SDK) para generar una URL de incrustación de QuickSight

const AWS = require('aws-sdk');

// Configura tu región y credenciales
AWS.config.update({ region: 'us-east-1' });

const quicksight = new AWS.QuickSight();

async function getEmbeddedDashboardUrl(dashboardId, userArn) {
    const params = {
        AwsAccountId: 'YOUR_AWS_ACCOUNT_ID', // Tu ID de cuenta de AWS
        DashboardId: dashboardId,
        IdentityType: 'IAM', // o 'QUICKSIGHT' si usas usuarios de QuickSight
        SessionLifetimeInMinutes: 60, // Duración de la sesión del dashboard embebido
        // Opcional: para permitir que el usuario filtre o interactúe con el dashboard
        // UndoRedoDisabled: false,
        // ResetDisabled: false,
        // UserArn: userArn, // ARN del usuario de IAM o QuickSight que verá el dashboard
        // Si no se especifica UserArn, QuickSight crea un usuario temporal no persistente.
        // Se recomienda especificar UserArn para control de acceso detallado.
    };

    try {
        const response = await quicksight.getDashboardEmbedUrl(params).promise();
        console.log('URL de incrustación generada:', response.EmbedUrl);
        return response.EmbedUrl;
    } catch (error) {
        console.error('Error al generar la URL de incrustación:', error);
        throw error;
    }
}

// Cómo llamar a esta función desde tu aplicación web
// (Ejemplo: cuando un usuario autenticado accede a una página que muestra el dashboard)
// const dashboardIdToEmbed = 'your-quick-sight-dashboard-id';
// const currentUserArn = 'arn:aws:iam::YOUR_AWS_ACCOUNT_ID:user/your-app-user'; // ARN del usuario logueado en tu app
//
// getEmbeddedDashboardUrl(dashboardIdToEmbed, currentUserArn)
//     .then(url => {
//         // Renderiza esta URL en un iframe en tu frontend
//         // <iframe width="100%" height="600px" src={url} frameborder="0" allowfullscreen></iframe>
//     })
//     .catch(err => {
//         // Manejar el error
//     });

// Un error común en embedded analytics:
// No configurar correctamente los permisos de IAM o QuickSight para el usuario que ve el dashboard embebido,
// lo que puede resultar en errores de acceso o datos no autorizados.
// Otro error: Exponer directamente el ID de la cuenta AWS o el DashboardId en el frontend sin un backend seguro.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Data Engineering',
    'topic': 'Analytics Avanzado',
    'subtopic': 'ML en analytics',
    'definition': r'''
Integrar Machine Learning (ML) en tus flujos de análisis significa usar algoritmos de aprendizaje automático para extraer insights más profundos, hacer predicciones o descubrir patrones que no serían obvios con el análisis tradicional. Ya no se trata solo de ver qué pasó, sino de predecir qué pasará o por qué pasó algo, de una forma mucho más sofisticada. Pensemos por un momento en una empresa de marketing que no solo ve sus ventas pasadas, sino que predice las ventas futuras con alta precisión.

Esto tiene una explicación, y es porque el ML permite ir más allá del análisis descriptivo y diagnóstico, abriendo las puertas al análisis predictivo y prescriptivo. Es decir, no solo entiendes el "qué" y el "por qué", sino también el "qué pasará" y el "qué hacer al respecto". Esto es crucial para la toma de decisiones proactiva en un entorno empresarial dinámico.

En el contexto de AWS, tienes varias herramientas para integrar ML en tu pipeline de análisis. Amazon SageMaker es el servicio principal para construir, entrenar y desplegar modelos de ML, pero no es el único. Servicios como Amazon Comprehend (para análisis de texto), Amazon Forecast (para predicciones de series temporales) o Amazon Personalize (para recomendaciones personalizadas) te permiten aplicar ML sin necesidad de ser un experto en ciencia de datos. Puedes tomar los datos que has procesado con Athena o que visualizas en QuickSight, pasarlos a un modelo de ML (ya sea entrenado en SageMaker o usando un servicio pre-entrenado de AWS), y luego alimentar los resultados de ese modelo de vuelta a tus dashboards o aplicaciones de análisis. Esto permite casos de uso avanzados como la segmentación automática de clientes, la detección de anomalías en tiempo real en flujos de datos, la predicción de la demanda de productos o la optimización de precios. La combinación de tus datos en S3, las capacidades de consulta de Athena y la potencia de servicios de ML de AWS crea un ecosistema muy robusto para análisis de vanguardia.
''',
    'code_example': r'''
// Este ejemplo es conceptual y no es código ejecutable en Dart.
// Ilustra la integración de ML (ej. Amazon Forecast) en un flujo de análisis.

/*
// Flujo conceptual de ML en Analytics con servicios AWS:

// 1. Datos históricos en S3 (ej. ventas diarias)
//    s3://your-data-lake-bucket/sales_data/daily_sales.csv

// 2. Preparación de datos (usando Athena o Glue)
//    - Limpiar datos.
//    - Asegurar el formato correcto para ML (ej. series temporales para Forecast).
-- Ejemplo de consulta Athena para preparar datos para Forecast (simplificado)
-- CREATE TABLE sales_for_forecast AS
-- SELECT
--   CAST(sale_date AS VARCHAR) AS timestamp,
--   CAST(amount AS DOUBLE) AS demand,
--   product_id AS item_id
-- FROM
--   raw_sales_data
-- WHERE
--   sale_date >= '2023-01-01';

// 3. Entrenamiento y despliegue del modelo ML (ej. Amazon Forecast)
//    - Crear un dataset group en Forecast.
//    - Importar los datos preparados de S3 al dataset group.
//    - Entrenar un predictor (modelo de ML) en Forecast.
//    - Crear un pronóstico usando el predictor.

// Pseudocódigo para interactuar con Amazon Forecast (ej. desde un script Python con Boto3)
// import boto3
//
// forecast_client = boto3.client('forecast')
//
// # Ejemplo: Crear un pronóstico (requiere un predictor ya entrenado y un dataset group)
// response = forecast_client.create_forecast(
//     ForecastName='MyProductDemandForecast',
//     PredictorArn='arn:aws:forecast:us-east-1:YOUR_ACCOUNT_ID:predictor/MySalesPredictor',
//     ForecastTypes=['0.1', '0.5', '0.9'], # Percentiles de predicción
//     TimeSeriesSelector={
//         'TimeSeriesIdentifiers': {
//             'DataSource': {
//                 'S3Config': {
//                     'Path': 's3://your-forecast-input-bucket/items_to_forecast.csv',
//                     'RoleArn': 'arn:aws:iam::YOUR_ACCOUNT_ID:role/ForecastRole'
//                 }
//             },
//             'Schema': {
//                 'Attributes': [
//                     {'AttributeName': 'item_id', 'AttributeType': 'string'}
//                 ]
//             }
//         }
//     }
// )
//
// print(f"Forecast ARN: {response['ForecastArn']}")

// 4. Integrar los resultados del ML de vuelta en el análisis (ej. en QuickSight)
//    - Exportar los resultados del pronóstico de Forecast a S3.
//    - Crear una nueva tabla en Athena sobre estos resultados de pronóstico.
//    - Conectar QuickSight a esta nueva tabla de Athena para visualizar las predicciones junto con los datos reales.

// Un error común en ML en analytics:
// No tener suficientes datos de calidad para entrenar modelos de ML, lo que lleva a predicciones inexactas.
// Otro error: No reentrenar los modelos de ML periódicamente con datos nuevos, lo que puede causar que las predicciones se vuelvan obsoletas con el tiempo.
*/
'''
  });
}

Future<void> insertSrLevel6AwsData(Database db) async {
  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Innovación y Tendencias',
    'topic': 'Machine Learning Avanzado',
    'subtopic': 'Amazon SageMaker avanzado',
    'definition': r'''
Amazon SageMaker es un servicio completamente administrado de AWS que facilita a los desarrolladores y científicos de datos la creación, entrenamiento y despliegue de modelos de Machine Learning (ML) a escala. Es como tu taller personal y supercompleto para todo lo relacionado con el ML, desde la preparación de los datos hasta tener tu modelo funcionando en producción.

No sé tú, pero a mí esto al principio me costó 🤯 entender la magnitud de lo que ofrece. Aquí te va la aclaración: cuando hablamos de ML, hay muchas etapas, y cada una puede ser un dolor de cabeza. SageMaker busca eliminar esos dolores de cabeza, ofreciendo herramientas para cada fase del ciclo de vida del ML, permitiéndote concentrarte en la innovación del modelo en lugar de la infraestructura.

En un nivel avanzado, Amazon SageMaker va mucho más allá de lo básico. Puedes utilizar SageMaker Studio, un IDE (Entorno de Desarrollo Integrado) unificado para ML, que te da una interfaz visual para todas tus actividades de ML. SageMaker Edge Manager te permite optimizar y desplegar modelos en dispositivos de borde (Edge devices), lo cual es crucial para IoT. SageMaker Feature Store es como un repositorio centralizado para almacenar y compartir características de ML, asegurando la consistencia y reutilización. Además, puedes emplear SageMaker Pipelines para orquestar y automatizar tus flujos de trabajo de ML (MLOps), y SageMaker Clarify para detectar sesgos en tus modelos y entender su interpretabilidad. Empresas como la NFL usan SageMaker para predecir el resultado de jugadas en tiempo real y mejorar la experiencia de los espectadores, mostrando cómo SageMaker se utiliza para resolver problemas complejos y a gran escala.
''',
    'code_example': r'''
// Este ejemplo es conceptual y muestra un flujo simplificado de entrenamiento en SageMaker
// usando el AWS SDK para Python (boto3). No es código Dart directo.

/*
import sagemaker
from sagemaker.estimator import Estimator
import boto3

# 1. Configurar la sesión de SageMaker
sagemaker_session = sagemaker.Session()
bucket = sagemaker_session.default_bucket()
role = sagemaker.get_execution_role()

# 2. Subir datos de entrenamiento a S3
# Este paso normalmente se haría con SageMaker Data Wrangler o con scripts de preprocesamiento
# input_data_path = sagemaker_session.upload_data(path='path/to/your/training_data.csv', bucket=bucket, key_prefix='training_data')

# 3. Definir el estimador (el modelo y el script de entrenamiento)
# Usaremos un algoritmo preconstruido de SageMaker para regresión lineal como ejemplo
container = sagemaker.image_uris.retrieve("linear-learner", boto3.Session().region_name, "latest")

linear_learner = Estimator(
    container,
    role,
    instance_count=1,
    instance_type='ml.m5.xlarge',
    output_path=f's3://{bucket}/output',
    sagemaker_session=sagemaker_session
)

# 4. Configurar hiperparámetros (ejemplo para linear-learner)
linear_learner.set_hyperparameters(predictor_type='regressor', mini_batch_size='32')

# 5. Entrenar el modelo
# training_data_location = sagemaker.inputs.TrainingInput(input_data_path, content_type='text/csv')
# linear_learner.fit({'train': training_data_location})
# Nota: La línea anterior está comentada porque requiere datos reales.
# En un escenario real, 'input_data_path' sería la ruta S3 de tus datos de entrenamiento.

# 6. Desplegar el modelo (crear un endpoint para inferencia)
# predictor = linear_learner.deploy(initial_instance_count=1, instance_type='ml.m5.xlarge')
# print(f"Endpoint name: {predictor.endpoint_name}")

# Un error común en SageMaker:
# No configurar correctamente los permisos de IAM para el rol de ejecución,
# lo que impide que SageMaker acceda a S3 o a otros recursos necesarios.
# Otro error: Elegir un tipo de instancia de cómputo inadecuado para el entrenamiento,
# lo que puede llevar a entrenamientos muy lentos o costosos.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Innovación y Tendencias',
    'topic': 'Machine Learning Avanzado',
    'subtopic': 'AutoML',
    'definition': r'''
AutoML (Automated Machine Learning) es una rama del Machine Learning que busca automatizar las tareas más tediosas y que consumen más tiempo en el ciclo de vida del desarrollo de modelos de ML. Imagina que quieres construir un modelo de ML, pero no eres un experto en seleccionar el mejor algoritmo, optimizar los hiperparámetros o preprocesar los datos. AutoML es como tener un asistente inteligente que hace gran parte de ese trabajo por ti.

Aquí te va la aclaración: desarrollar modelos de ML de alto rendimiento puede ser increíblemente complejo y requiere conocimientos especializados. AutoML democratiza el ML, permitiendo que personas con menos experiencia en ciencia de datos puedan crear modelos efectivos y en menos tiempo.

En AWS, el servicio principal que ofrece capacidades de AutoML es Amazon SageMaker Autopilot. Con Autopilot, simplemente le das tus datos, y él se encarga de todo lo demás: desde la ingeniería de características (transformar los datos crudos en variables útiles), la selección del mejor algoritmo, la optimización de los hiperparámetros, hasta la construcción de los modelos y la generación de un informe de los mejores. Te presenta una clasificación de los mejores modelos encontrados y te permite desplegar el que mejor se adapte a tus necesidades. Esto es extremadamente útil para equipos que necesitan prototipar modelos rápidamente, o para empresas que quieren integrar capacidades de ML en sus aplicaciones sin una gran inversión en ciencia de datos. Por ejemplo, una startup podría usar Autopilot para construir un modelo de predicción de la rotación de clientes sin necesidad de contratar un equipo completo de científicos de datos desde el inicio.
''',
    'code_example': r'''
// Este ejemplo es conceptual y muestra cómo se iniciaría un experimento de Autopilot
// usando el AWS SDK para Python (boto3). No es código Dart directo.

/*
import sagemaker
import boto3

# 1. Configurar la sesión de SageMaker
sagemaker_session = sagemaker.Session()
bucket = sagemaker_session.default_bucket()
role = sagemaker.get_execution_role()

# 2. Definir rutas de entrada y salida para Autopilot
input_data_uri = f's3://{bucket}/your-data-folder/train.csv' # Tus datos de entrenamiento en S3
output_data_uri = f's3://{bucket}/autopilot-output/' # Donde Autopilot guardará los resultados

# 3. Especificar el nombre de la columna objetivo (lo que quieres predecir)
target_attribute_name = 'target_column_name' # Reemplaza con el nombre de tu columna objetivo

# 4. Crear un trabajo de Autopilot
# Esto le dice a SageMaker que inicie el proceso de AutoML.
try:
    autopilot_job_name = f'autopilot-job-{sagemaker.utils.sagemaker_timestamp()}'
    print(f"Starting Autopilot job: {autopilot_job_name}")

    sagemaker_session.create_auto_ml_job(
        job_name=autopilot_job_name,
        input_data_config=[{
            'DataSource': {'S3DataSource': {'S3DataType': 'S3Prefix', 'S3Uri': input_data_uri}},
            'TargetAttributeName': target_attribute_name
        }],
        output_data_config={'S3OutputLocation': output_data_uri},
        role=role,
        # Opcional: especificar el tipo de problema (Classification, Regression)
        # AutoMLJobConfig={
        #     'CompletionCriteria': {'MaxRuntimeInSeconds': 3600}, # Máximo tiempo de ejecución
        #     'AutoMLJobObjective': {'MetricName': 'Accuracy'}
        # }
    )
    print("Autopilot job started successfully!")
except Exception as e:
    print(f"Error starting Autopilot job: {e}")

# Después de que el trabajo termina, puedes obtener los mejores modelos y desplegarlos.
# Esto se haría a través de la interfaz de SageMaker Studio o con más llamadas a la API.

# Un error común en AutoML:
# Proporcionar datos de entrada de mala calidad o con el formato incorrecto,
# lo que puede llevar a que Autopilot no pueda generar modelos o que los modelos sean ineficaces.
# Otro error: No entender las limitaciones de AutoML para problemas muy específicos o complejos
# que aún requieren una intervención humana experta.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Innovación y Tendencias',
    'topic': 'Machine Learning Avanzado',
    'subtopic': 'MLOps',
    'definition': r'''
MLOps (Machine Learning Operations) es un conjunto de prácticas que combinan el desarrollo de Machine Learning (ML) con las operaciones (Ops), de forma similar a como DevOps hace con el desarrollo de software. Su objetivo es unificar el ciclo de vida de desarrollo de sistemas de ML, desde la experimentación y el entrenamiento hasta el despliegue, el monitoreo y el mantenimiento, de manera eficiente y automatizada. Es como la orquesta que asegura que todos los instrumentos del ML suenen en armonía en producción.

¿Te estás preguntando por qué esto importa? Aquí te va la aclaración: a diferencia del software tradicional, los modelos de ML tienen una dependencia adicional de los datos. Necesitan ser reentrenados y actualizados constantemente con nuevos datos para mantener su rendimiento. Sin MLOps, este proceso puede volverse un caos manual, lento y propenso a errores, especialmente a medida que aumentas el número de modelos en producción.

Con MLOps en AWS, puedes construir pipelines CI/CD (Integración Continua/Despliegue Continuo) para tus modelos de ML. Esto implica usar servicios como AWS CodePipeline para orquestar los flujos de trabajo, AWS CodeBuild para ejecutar los scripts de entrenamiento y validación, y Amazon SageMaker Pipelines para la orquestación de los pasos específicos de ML. SageMaker Model Monitor te ayuda a detectar desviaciones en el rendimiento del modelo o cambios en los datos (deriva de datos) una vez que están en producción, alertándote para que puedas reentrenar o ajustar tus modelos. Esto permite a las empresas como Netflix (quienes son pioneros en la automatización de la entrega de modelos) lanzar nuevas versiones de sus algoritmos de recomendación de forma rápida y segura, asegurando que siempre ofrezcan la mejor experiencia a sus usuarios. MLOps es fundamental para escalar el uso del ML en una organización, garantizando que los modelos no solo se construyan, sino que también se mantengan efectivos y confiables a largo plazo.
''',
    'code_example': r'''
// Este ejemplo es conceptual y representa un fragmento de un pipeline MLOps en AWS
// utilizando SageMaker Pipelines y Python. No es código Dart directo.

/*
from sagemaker.workflow.pipeline import Pipeline
from sagemaker.workflow.steps import ProcessingStep, TrainingStep
from sagemaker.processing import Processor, ScriptProcessor
from sagemaker.estimator import Estimator
from sagemaker.workflow.parameters import ParameterString, ParameterInteger

# 1. Definir parámetros del pipeline
processing_instance_count = ParameterInteger(name="ProcessingInstanceCount", default_value=1)
training_instance_count = ParameterInteger(name="TrainingInstanceCount", default_value=1)
model_approval_status = ParameterString(name="ModelApprovalStatus", default_value="PendingManualApproval")

# 2. Paso de preprocesamiento de datos (ProcessingStep)
# Utiliza un procesador de SageMaker para ejecutar un script de preprocesamiento
processor = ScriptProcessor(
    role=sagemaker_session.get_execution_role(),
    instance_count=processing_instance_count,
    instance_type="ml.m5.xlarge",
    command=["python3"],
    # Aquí iría tu script de preprocesamiento
    code="preprocess.py"
)

step_process = ProcessingStep(
    name="PreprocessData",
    processor=processor,
    inputs=[sagemaker.processing.ProcessingInput(source="s3://your-raw-data/", destination="/opt/ml/processing/input")],
    outputs=[
        sagemaker.processing.ProcessingOutput(output_name="train", source="/opt/ml/processing/train"),
        sagemaker.processing.ProcessingOutput(output_name="test", source="/opt/ml/processing/test")
    ]
)

# 3. Paso de entrenamiento del modelo (TrainingStep)
estimator = Estimator(
    image_uri="your-custom-training-image" if you have one else sagemaker.image_uris.retrieve("xgboost", region, "latest"),
    role=sagemaker_session.get_execution_role(),
    instance_count=training_instance_count,
    instance_type="ml.m5.xlarge",
    output_path=f"s3://{sagemaker_session.default_bucket()}/output",
    sagemaker_session=sagemaker_session
)

step_train = TrainingStep(
    name="TrainModel",
    estimator=estimator,
    inputs={
        "train": sagemaker.inputs.TrainingInput(s3_data=step_process.properties.ProcessingOutputConfig.Outputs["train"].S3Output.S3Uri),
        "test": sagemaker.inputs.TrainingInput(s3_data=step_process.properties.ProcessingOutputConfig.Outputs["test"].S3Output.S3Uri)
    }
)

# 4. Crear el pipeline de SageMaker
pipeline_name = "MyMLOpsPipeline"
pipeline = Pipeline(
    name=pipeline_name,
    parameters=[
        processing_instance_count,
        training_instance_count,
        model_approval_status
    ],
    steps=[step_process, step_train]
)

# 5. Desplegar el pipeline (esto se haría en tu CI/CD)
# pipeline.upsert(role_arn=sagemaker_session.get_execution_role())
# pipeline.start()

# Un error común en MLOps:
# No establecer un sistema de versionado claro para modelos y datos,
# lo que dificulta la trazabilidad y la reproducibilidad de los resultados.
# Otro error: No automatizar la monitorización del modelo en producción,
# lo que puede llevar a que los modelos funcionen mal sin que nadie se dé cuenta.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Innovación y Tendencias',
    'topic': 'Machine Learning Avanzado',
    'subtopic': 'Edge ML',
    'definition': r'''
Edge ML, o Machine Learning en el borde, se refiere a la práctica de ejecutar modelos de Machine Learning directamente en dispositivos "de borde" o "Edge devices", que son aquellos que están cerca de la fuente de los datos (por ejemplo, cámaras de seguridad, sensores IoT, smartphones, robots). En lugar de enviar todos los datos a la nube para su procesamiento, el análisis se realiza localmente en el dispositivo.

Seguramente te preguntarás por qué esto importa. Aquí te va la aclaración: enviar grandes volúmenes de datos a la nube puede ser costoso, lento y, en algunos casos, problemático por cuestiones de privacidad o conectividad. El Edge ML resuelve esto, permitiendo inferencias (predicciones del modelo) casi en tiempo real, incluso sin conexión a internet, y reduciendo la latencia y el ancho de banda.

Con AWS, Amazon SageMaker Edge Manager es el servicio principal que te permite optimizar, empaquetar, desplegar y monitorear modelos de ML en dispositivos de borde. Esto significa que puedes entrenar tu modelo en la nube usando SageMaker, luego usar Edge Manager para reducir su tamaño y optimizarlo para el hardware del dispositivo de borde, y finalmente desplegarlo. Un ejemplo clásico es una cámara de seguridad inteligente que puede detectar personas o vehículos directamente en el dispositivo, sin enviar cada fotograma de video a la nube. Esto no solo ahorra ancho de banda, sino que también permite una respuesta más rápida para, por ejemplo, activar una alarma. Otro caso de uso podría ser el mantenimiento predictivo en fábricas, donde los sensores en la maquinaria detectan anomalías en tiempo real sin depender de una conexión constante a la nube. Empresas como Tesla, aunque tienen su propio ecosistema, utilizan principios de Edge ML en sus vehículos para el procesamiento de visión por computadora en tiempo real.
''',
    'code_example': r'''
// Este ejemplo es conceptual y representa los pasos para el Edge ML con SageMaker Edge Manager.
// No es código Dart directo, sino una descripción del flujo.

/*
// Flujo conceptual de Edge ML con Amazon SageMaker Edge Manager:

// 1. **Entrenamiento del Modelo en la Nube (SageMaker):**
//    - Se entrena un modelo de ML (ej. un modelo de visión por computadora) en Amazon SageMaker
//      usando datos de entrenamiento en S3.

// 2. **Compilación y Optimización para el Borde (SageMaker Neo o Edge Manager):**
//    - Una vez entrenado, el modelo se compila para el hardware específico del dispositivo de borde
//      (ej. Raspberry Pi, NVIDIA Jetson). Esto reduce el tamaño del modelo y lo optimiza
//      para el rendimiento en dispositivos con recursos limitados.
//    - Amazon SageMaker Neo es parte de este proceso de compilación.

// Pseudocódigo (Python con AWS SDK / SageMaker SDK):
// from sagemaker.pytorch import PyTorch
//
// estimator = PyTorch(
//     entry_point='train_script.py',
//     role=sagemaker_session.get_execution_role(),
//     instance_count=1,
//     instance_type='ml.m5.xlarge',
//     framework_version='1.6.0',
//     py_version='py3'
// )
// estimator.fit({'training': training_input_uri})
//
// # Compilar el modelo para un dispositivo específico (ej. "jetson_xavier")
// compiled_model = estimator.compile_model(
//     target_instance_family='ml_inference', # O un tipo de dispositivo específico
//     input_shape={'input_image': [1, 3, 224, 224]}, # Forma de la entrada del modelo
//     output_path=f's3://{bucket}/compiled_models/',
//     framework='PYTORCH'
// )
//
// print(f"Compiled model S3 URI: {compiled_model.model_data}")

// 3. **Despliegue en el Dispositivo de Borde (AWS IoT Greengrass / Edge Manager):**
//    - El modelo optimizado se empaqueta y se despliega de forma remota a los dispositivos de borde.
//    - AWS IoT Greengrass se utiliza a menudo para gestionar este despliegue en flotas de dispositivos.
//    - SageMaker Edge Manager proporciona un agente en el dispositivo para gestionar las versiones del modelo
//      y recopilar métricas de rendimiento.

// 4. **Inferencia y Monitoreo en el Borde:**
//    - El modelo ejecuta inferencias directamente en el dispositivo con los datos locales.
//    - SageMaker Edge Manager también permite monitorear el rendimiento del modelo en el dispositivo y
//      enviar métricas de vuelta a la nube para análisis.

// Un error común en Edge ML:
// No optimizar el modelo para el hardware del dispositivo de borde, lo que puede resultar en un bajo rendimiento
// o que el modelo sea demasiado grande para el dispositivo.
// Otro error: No tener un mecanismo robusto para actualizar los modelos en los dispositivos de borde,
// lo que puede llevar a que los modelos se vuelvan obsoletos o a problemas de seguridad.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Innovación y Tendencias',
    'topic': 'IoT',
    'subtopic': 'AWS IoT Core',
    'definition': r'''
AWS IoT Core es un servicio administrado que permite que tus dispositivos conectados (los "dispositivos IoT") se conecten de forma segura a la nube de AWS y se comuniquen con otras aplicaciones y entre sí. Imagina que tienes miles de sensores, electrodomésticos inteligentes o maquinaria en una fábrica, y IoT Core es el cerebro que los conecta a internet de forma segura y eficiente.

Seguramente pensarás de qué va todo esto y por qué es tan importante. Aquí te va la aclaración: conectar dispositivos a la nube puede ser un desafío enorme debido a la seguridad, la escala y la diversidad de los dispositivos. IoT Core simplifica esto, proporcionando la infraestructura necesaria para que los dispositivos envíen datos, reciban comandos y se gestionen de manera centralizada.

AWS IoT Core proporciona varias funcionalidades clave. El "Device Gateway" permite que miles de millones de dispositivos se conecten y desconecten de forma segura. El "Message Broker" (MQTT, HTTP, WebSockets) se encarga de que los dispositivos puedan enviar y recibir mensajes de manera confiable. El "Device Shadow" mantiene un estado virtual de cada dispositivo, lo que permite a las aplicaciones interactuar con ellos incluso cuando el dispositivo no está conectado. Además, las "Rules Engine" te permiten definir acciones que se activan cuando los datos de los dispositivos cumplen ciertas condiciones (ej. "si la temperatura supera X, envía una alerta a Lambda"). Empresas como iRobot (los creadores de Roomba) utilizan AWS IoT para conectar sus aspiradoras robot, lo que les permite recopilar datos, enviar actualizaciones de firmware y permitir a los usuarios controlar sus dispositivos de forma remota. IoT Core es la base para cualquier solución IoT escalable en AWS.
''',
    'code_example': r'''
// Este ejemplo es conceptual y muestra cómo un dispositivo IoT podría publicar un mensaje a AWS IoT Core
// usando el protocolo MQTT. No es código Dart directo, sino pseudocódigo.

/*
// Pseudocódigo de un dispositivo IoT (ej. en Python para un Raspberry Pi)
// que publica datos de temperatura a AWS IoT Core.

import paho.mqtt.client as mqtt
import time
import json
import ssl # Para la conexión segura

# Configuración de AWS IoT Core
MQTT_BROKER_HOST = "a1b2c3d4e5f6g7.iot.us-east-1.amazonaws.com" # Tu endpoint de AWS IoT
MQTT_PORT = 8883
ROOT_CA_PATH = "path/to/AmazonRootCA1.pem" # Certificado raíz de Amazon
CERT_PATH = "path/to/device.pem.crt" # Certificado de tu dispositivo
PRIVATE_KEY_PATH = "path/to/private.pem.key" # Clave privada de tu dispositivo
MQTT_TOPIC = "sensors/temperature" # Topic MQTT al que se publicarán los datos
DEVICE_ID = "my_temperature_sensor_001" # ID único del dispositivo

def on_connect(client, userdata, flags, rc):
    print("Conectado a AWS IoT Core con código de resultado: " + str(rc))
    if rc == 0:
        print("Suscrito al topic: " + MQTT_TOPIC)
        client.subscribe(MQTT_TOPIC) # El dispositivo también puede suscribirse para recibir comandos

def on_message(client, userdata, msg):
    print(f"Mensaje recibido en topic '{msg.topic}': {msg.payload.decode()}")

client = mqtt.Client(client_id=DEVICE_ID)
client.on_connect = on_connect
client.on_message = on_message

# Configurar SSL/TLS para una conexión segura
client.tls_set(
    ca_certs=ROOT_CA_PATH,
    certfile=CERT_PATH,
    keyfile=PRIVATE_KEY_PATH,
    tls_version=ssl.PROTOCOL_TLSv1_2
)

try:
    client.connect(MQTT_BROKER_HOST, MQTT_PORT, 60)
    client.loop_start() # Iniciar el bucle de MQTT en segundo plano

    while True:
        temperature = 25.5 + (time.time() % 10) / 5 # Simulación de datos
        payload = {
            "device_id": DEVICE_ID,
            "temperature": round(temperature, 2),
            "timestamp": int(time.time())
        }
        client.publish(MQTT_TOPIC, json.dumps(payload), qos=1)
        print(f"Publicado: {json.dumps(payload)}")
        time.sleep(5)

except KeyboardInterrupt:
    print("Desconectando...")
finally:
    client.loop_stop()
    client.disconnect()

// Un error común en AWS IoT Core:
// No configurar correctamente los certificados y claves de seguridad del dispositivo,
// lo que impide que el dispositivo se autentique y se conecte a IoT Core.
// Otro error: Definir políticas de IAM o políticas de IoT con permisos demasiado amplios o demasiado restrictivos.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Innovación y Tendencias',
    'topic': 'IoT',
    'subtopic': 'AWS IoT Greengrass',
    'definition': r'''
AWS IoT Greengrass es un software y servicio de AWS que extiende la funcionalidad de la nube de AWS a los dispositivos de borde (Edge devices) de IoT. Básicamente, permite que los dispositivos de IoT puedan ejecutar código de AWS Lambda, sincronizar datos y comunicarse con otros dispositivos localmente, incluso sin una conexión constante a la nube. Piensa en ello como una "mini-nube" que resides directamente en tus dispositivos IoT.

Esto tiene una explicación, y es porque no todos los datos necesitan ir a la nube para ser procesados. A veces, necesitas una respuesta instantánea, o tienes datos sensibles que no deben salir del sitio, o simplemente la conectividad a internet es limitada. Greengrass permite que tus dispositivos sean más inteligentes y autónomos, tomando decisiones localmente y enviando a la nube solo lo que realmente importa.

Con AWS IoT Greengrass, puedes desplegar funciones de AWS Lambda directamente en tus dispositivos. Esto significa que puedes ejecutar lógica de negocio, realizar filtrado de datos, agregar información o incluso ejecutar modelos de Machine Learning (ML) en el dispositivo. También permite que los dispositivos se comuniquen entre sí localmente usando MQTT sin tener que ir a la nube, lo que es ideal para entornos como fábricas o granjas inteligentes donde la latencia es crítica. Además, Greengrass puede sincronizar datos con la nube de AWS y permite el despliegue de componentes preconstruidos o personalizados. Por ejemplo, una empresa de automatización industrial podría usar Greengrass para procesar datos de sensores en tiempo real en una máquina, detectar anomalías y tomar acciones inmediatas (como apagar la máquina) sin depender de una conexión a internet, y solo enviar resúmenes de datos a la nube para análisis a largo plazo.
''',
    'code_example': r'''
// Este ejemplo es conceptual y muestra cómo se podría desplegar una función Lambda a un dispositivo Greengrass.
// No es código Dart directo, sino una descripción del flujo.

/*
// Flujo conceptual para usar AWS IoT Greengrass:

// 1. **Crear una Función Lambda:**
//    - Primero, desarrollas tu lógica de negocio en una función AWS Lambda en la nube.
//    - Ejemplo de una función Lambda Python que procesa un mensaje:
//
//      import json
//
//      def lambda_handler(event, context):
//          message = event.get('message', 'No message provided')
//          print(f"Greengrass Lambda received: {message}")
//          # Puedes procesar el mensaje, realizar inferencia ML, etc.
//          return {
//              'statusCode': 200,
//              'body': json.dumps('Message processed by Greengrass Lambda!')
//          }

// 2. **Crear un Grupo Greengrass:**
//    - En la consola de AWS IoT Greengrass, creas un "Grupo Greengrass", que es una forma de organizar
//      tus dispositivos de borde y configuraciones.

// 3. **Configurar el Dispositivo Central (Core Device):**
//    - Descargas y despliegas el software de AWS IoT Greengrass en tu dispositivo de borde (ej. Raspberry Pi, servidor edge).
//    - Este dispositivo se convierte en el "Core Device" de tu grupo Greengrass.

// 4. **Añadir la Función Lambda al Grupo Greengrass:**
//    - Asocias la función Lambda que creaste al grupo Greengrass.
//    - Puedes configurar cómo se activa la función (ej. al recibir un mensaje MQTT en un topic específico).

// 5. **Desplegar la Configuración:**
//    - Despliegas la configuración del grupo Greengrass al Core Device.
//    - Esto incluye la función Lambda y cualquier otro componente que hayas configurado.

// 6. **Comunicación Local y Ejecución en el Borde:**
//    - Los dispositivos en el borde pueden publicar mensajes a un topic MQTT local.
//    - La función Lambda en el Core Device puede suscribirse a ese topic y ejecutarse localmente.
//    - También puede interactuar con sensores locales o otros dispositivos en la red local.

// Ejemplo de cómo un dispositivo cliente se comunicaría con el Core Device localmente (MQTT):
// (Simulando un sensor enviando datos a la Lambda en el Core)

// import paho.mqtt.client as mqtt
// import json
// import time
//
// local_broker_address = "localhost" # La dirección IP del Core Device
// local_broker_port = 8883 # Puerto MQTT de Greengrass
//
// client = mqtt.Client()
// client.connect(local_broker_address, local_broker_port, 60)
// client.loop_start()
//
// try:
//     for i in range(5):
//         message = {"sensor_id": "temp_001", "reading": 22.5 + i}
//         client.publish("local/sensor/data", json.dumps(message))
//         print(f"Publicado a Greengrass Core localmente: {message}")
//         time.sleep(2)
// finally:
//     client.loop_stop()
//     client.disconnect()

// Un error común en AWS IoT Greengrass:
// Problemas de conectividad entre el Core Device y la nube de AWS (si se requiere sincronización).
// Otro error: Permisos de IAM incorrectos para el rol de Greengrass Core, lo que impide que el Core acceda a recursos de AWS.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Innovación y Tendencias',
    'topic': 'IoT',
    'subtopic': 'IoT Analytics',
    'definition': r'''
IoT Analytics, o Analítica de IoT, se refiere al proceso de recolectar, limpiar, transformar y analizar grandes volúmenes de datos generados por dispositivos de Internet de las Cosas (IoT). La idea es extraer información valiosa y patrones de estos datos para mejorar operaciones, optimizar procesos o crear nuevas experiencias. Pensemos por un momento en una flota de camiones con sensores que generan datos de ubicación, velocidad, consumo de combustible, y temperatura de carga; IoT Analytics es la disciplina que nos permite darle sentido a toda esa avalancha de información.

Esto tiene una explicación, y es porque los datos de IoT son únicos: suelen ser voluminosos, generados a alta velocidad, y a menudo provienen de sensores con diferentes formatos y calidades. Las herramientas de análisis tradicionales a veces no son suficientes, y necesitas una solución diseñada específicamente para manejar esta complejidad.

AWS IoT Analytics es un servicio totalmente administrado de AWS que facilita el análisis de datos de IoT a gran escala. Proporciona una suite completa de capacidades: desde la ingesta de datos de dispositivos (integrándose con AWS IoT Core), el procesamiento y enriquecimiento de esos datos (limpieza, normalización, agregación), hasta su almacenamiento en un almacén de datos optimizado para series temporales. Lo que lo hace realmente potente es la capacidad de ejecutar consultas SQL complejas sobre tus datos de IoT, e incluso integrar modelos de Machine Learning (ML) para análisis predictivos. Por ejemplo, una empresa de energía podría usar IoT Analytics para recopilar datos de miles de medidores inteligentes, analizar patrones de consumo en diferentes vecindarios y predecir picos de demanda para optimizar la distribución. También puedes integrar los resultados con Amazon QuickSight para crear dashboards interactivos o enviarlos a otros servicios de AWS para acciones automatizadas. Es la solución perfecta cuando necesitas ir más allá de la simple recolección de datos y realmente quieres extraer valor de tu ecosistema IoT.
''',
    'code_example': r'''
// Este ejemplo es conceptual y describe un flujo de AWS IoT Analytics.
// No es código Dart directo, sino una representación de cómo interactúan los servicios.

/*
// Flujo conceptual de AWS IoT Analytics:

// 1. **Ingesta de Datos:**
//    - Los dispositivos IoT envían datos a AWS IoT Core (usando MQTT, HTTP, etc.).
//    - Una "Regla de IoT" en IoT Core reenvía los mensajes a un "Canal" de AWS IoT Analytics.

// 2. **Canales (Channels):**
//    - Un Canal de IoT Analytics recopila los datos sin procesar de IoT Core.
//    - Es como un buzón de entrada temporal para tus datos crudos.

// 3. **Pipes (Pipelines):**
//    - Un Pipe es donde transformas, filtras y enriqueces tus datos.
//    - Puedes agregar actividades como:
//        - `Filter`: Eliminar datos no deseados.
//        - `Math`: Realizar cálculos (ej. convertir unidades).
//        - `Lambda`: Invocar una función Lambda para transformaciones complejas.
//        - `Datastore`: Enviar los datos procesados a un Datastore.

// Pseudocódigo conceptual para una "Rule Engine" en AWS IoT Core (JSON):
// {
//   "sql": "SELECT temperature, humidity, device_id FROM 'sensors/data' WHERE temperature > 20",
//   "ruleDisabled": false,
//   "actions": [
//     {
//       "iotAnalytics": {
//         "channelName": "my_sensor_channel",
//         "roleArn": "arn:aws:iam::YOUR_ACCOUNT_ID:role/IoTRuleRole"
//       }
//     }
//   ]
// }

// 4. **Almacenes de Datos (Datastores):**
//    - Un Datastore almacena los datos procesados en un formato optimizado para consultas.
//    - Es un tipo de base de datos de series temporales, ideal para datos de IoT.

// 5. **Conjuntos de Datos (Datasets):**
//    - Un Dataset es el resultado de ejecutar una consulta SQL en un Datastore.
//    - Puedes definir consultas SQL para extraer subsets de datos o agregaciones.
//    - Los Datasets pueden ser actualizados por programación.

// Ejemplo conceptual de consulta SQL en un Dataset de IoT Analytics:
// SELECT
//   from_unixtime(timestamp / 1000) AS event_time,
//   device_id,
//   AVG(temperature) AS avg_temp
// FROM
//   my_sensor_datastore
// WHERE
//   timestamp BETWEEN 1672531200000 AND 1675209600000 -- Rango de tiempo en milisegundos
// GROUP BY
//   window(event_time, '1 hour'), device_id
// ORDER BY
//   event_time;

// 6. **Análisis y Visualización:**
//    - Los Datasets pueden ser consumidos por Amazon QuickSight para crear dashboards.
//    - También puedes integrar con Amazon SageMaker para aplicar modelos de ML.

// Un error común en IoT Analytics:
// No limpiar o normalizar los datos de los dispositivos antes de almacenarlos,
// lo que puede llevar a análisis inconsistentes o erróneos.
// Otro error: Ignorar el costo de la ingesta de datos y el almacenamiento si los volúmenes son muy altos sin una buena estrategia de filtrado.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Innovación y Tendencias',
    'topic': 'IoT',
    'subtopic': 'IoT Security',
    'definition': r'''
La seguridad en IoT (IoT Security) se refiere a todas las medidas y prácticas implementadas para proteger los dispositivos de Internet de las Cosas, las redes a las que se conectan y los datos que generan y procesan. Piensa en ello como el escudo que protege tu ejército de dispositivos inteligentes de ataques, accesos no autorizados o fallos que puedan comprometer su funcionamiento o la privacidad de la información.

Esto tiene una explicación, y es porque los dispositivos IoT son puntos de entrada potenciales para los atacantes. A menudo, tienen capacidades de cómputo limitadas, pueden estar en ubicaciones remotas y, si no se aseguran correctamente, pueden convertirse en parte de botnets, ser usados para espionaje o simplemente fallar, causando interrupciones en el servicio. No sé tú, pero a mí me preocuparía que mi cafetera inteligente fuera hackeada para atacar un servidor... 😅

AWS ofrece un conjunto robusto de servicios para abordar la seguridad en IoT. **AWS IoT Core** proporciona autenticación mutua y cifrado para garantizar que solo los dispositivos y servicios autorizados puedan conectarse y comunicarse. Utiliza certificados X.509 y políticas de IAM para controlar el acceso. **AWS IoT Device Defender** es clave para auditar las configuraciones de seguridad de tus dispositivos (ej. si los certificados son válidos, si los puertos están abiertos) y detectar comportamientos anómalos (ej. si un dispositivo empieza a enviar tráfico inusual). Si se detecta una anomalía, Device Defender puede activar alertas o acciones automatizadas para mitigar el riesgo. Además, puedes usar **AWS IoT Greengrass** para ejecutar la lógica de seguridad directamente en el dispositivo, como el cifrado de datos antes de enviarlos a la nube o la validación de la autenticidad de los mensajes. La seguridad en IoT es un enfoque multicapa que va desde el dispositivo hasta la nube, y AWS te proporciona las herramientas para construir una defensa sólida en cada nivel.
''',
    'code_example': r'''
// Este ejemplo es conceptual y describe los principios de seguridad en AWS IoT.
// No es código Dart directo, sino una descripción de cómo se aplican los conceptos.

/*
// Principios y Componentes de Seguridad en AWS IoT:

// 1. **Autenticación y Autorización del Dispositivo (AWS IoT Core):**
//    - Cada dispositivo IoT debe tener un certificado X.509 único y una clave privada.
//    - Estos certificados se registran en AWS IoT Core.
//    - Las políticas de IoT (similares a las políticas de IAM) se adjuntan al certificado para definir
//      qué acciones puede realizar el dispositivo (ej. publicar en ciertos topics, suscribirse a otros).

// Ejemplo conceptual de una política de IoT (JSON):
// {
//   "Version": "2012-10-17",
//   "Statement": [
//     {
//       "Effect": "Allow",
//       "Action": [
//         "iot:Publish"
//       ],
//       "Resource": [
//         "arn:aws:iot:us-east-1:YOUR_ACCOUNT_ID:topic/devices/${iot:ClientId}/data"
//       ]
//     },
//     {
//       "Effect": "Allow",
//       "Action": [
//         "iot:Receive"
//       ],
//       "Resource": [
//         "arn:aws:iot:us-east-1:YOUR_ACCOUNT_ID:topic/devices/${iot:ClientId}/commands"
//       ]
//     },
//     {
//       "Effect": "Allow",
//       "Action": [
//         "iot:Connect"
//       ],
//       "Resource": [
//         "arn:aws:iot:us-east-1:YOUR_ACCOUNT_ID:client/${iot:ClientId}"
//       ]
//     }
//   ]
// }

// 2. **Cifrado en Tránsito y en Reposo:**
//    - Todas las comunicaciones entre los dispositivos y AWS IoT Core se cifran con TLS.
//    - Los datos almacenados en S3 (por ejemplo, por reglas de IoT) pueden cifrarse en reposo.

// 3. **Monitoreo de Seguridad (AWS IoT Device Defender):**
//    - **Auditoría de Configuración:** Device Defender puede auditar tus configuraciones de IoT
//      para identificar desviaciones de las mejores prácticas de seguridad (ej. certificados caducados, políticas demasiado permisivas).
//    - **Detección de Comportamiento Anómalo:** Crea perfiles de comportamiento normal para tus dispositivos
//      y detecta actividades inusuales (ej. un dispositivo que de repente envía una cantidad masiva de datos).
//      Si se detecta una anomalía, puede disparar alarmas en CloudWatch o activar acciones (ej. desconectar el dispositivo).

// 4. **Actualizaciones Seguras de Firmware (AWS IoT Device Management / OTA Updates):**
//    - Capacidad para desplegar actualizaciones de firmware de forma segura y remota a flotas de dispositivos,
//      lo cual es crucial para parchear vulnerabilidades.

// Un error común en IoT Security:
// Reutilizar el mismo certificado y clave privada para múltiples dispositivos,
// lo que compromete la seguridad de toda la flota si uno de ellos es comprometido.
// Otro error: No implementar un monitoreo constante del comportamiento del dispositivo,
// lo que puede permitir que ataques o compromisos pasen desapercibidos.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Innovación y Tendencias',
    'topic': 'Blockchain',
    'subtopic': 'Amazon Managed Blockchain',
    'definition': r'''
Amazon Managed Blockchain es un servicio completamente administrado que facilita la creación y gestión de redes de blockchain escalables utilizando frameworks populares como Hyperledger Fabric o Ethereum. Imagina que quieres construir una red donde varias partes (empresas, organizaciones) puedan registrar transacciones de forma inmutable y transparente, sin necesidad de una autoridad central. Managed Blockchain se encarga de toda la complejidad de configurar y mantener esa infraestructura por ti.

Aquí te va la aclaración: las redes de blockchain son inherentemente distribuidas y pueden ser difíciles de configurar, escalar y operar. Requieren gestionar nodos, certificados, accesos y la complejidad subyacente del protocolo. Managed Blockchain simplifica esto drásticamente, permitiéndote enfocarte en las aplicaciones de tu blockchain en lugar de en la gestión de la infraestructura.

Con Amazon Managed Blockchain, puedes lanzar rápidamente una red de blockchain e invitar a otros miembros a unirse. Soporta Hyperledger Fabric, que es ideal para casos de uso empresariales donde se necesita control de acceso y privacidad de las transacciones (blockchain de "permiso"), y Ethereum, que es más adecuado para aplicaciones públicas y descentralizadas (dApps) con contratos inteligentes. El servicio se encarga de la gestión de certificados, el escalado automático de los nodos, el monitoreo y las copias de seguridad, asegurando la alta disponibilidad y la resiliencia de tu red. Esto significa que puedes usar blockchain para casos como la trazabilidad de la cadena de suministro, la gestión de registros médicos, o la liquidación de transacciones financieras, sin preocuparte por la infraestructura subyacente. Un ejemplo de uso podría ser una red de proveedores y minoristas que utilizan blockchain para rastrear el origen de los productos y verificar su autenticidad.
''',
    'code_example': r'''
// Este ejemplo es conceptual y muestra cómo se podría interactuar con Amazon Managed Blockchain
// para una red Hyperledger Fabric usando el AWS SDK. No es código Dart directo.

/*
// Pseudocódigo (Python con Boto3) para crear un miembro en una red de Hyperledger Fabric
// en Amazon Managed Blockchain.

import boto3

blockchain_client = boto3.client('managedblockchain')

# Asume que ya tienes una red creada y conoces su ID
NETWORK_ID = 'n-YOURNETWORKID' # Reemplaza con el ID de tu red

def create_network_member(member_name, member_id, invitation_id):
    try:
        response = blockchain_client.create_member(
            ClientRequestToken=member_id, # Un token único para asegurar la idempotencia
            InvitationId=invitation_id, # La invitación recibida para unirse a la red
            NetworkId=NETWORK_ID,
            MemberConfiguration={
                'Name': member_name,
                'Description': f'Member {member_name} for testing',
                'FrameworkConfiguration': {
                    'Fabric': {
                        'AdminUsername': 'adminuser',
                        'AdminPassword': 'YourStrongPassword123!', # ¡Usa AWS Secrets Manager en producción!
                    }
                }
            }
        )
        print(f"Miembro '{member_name}' creado. MemberId: {response['MemberId']}")
        return response['MemberId']
    except Exception as e:
        print(f"Error al crear el miembro: {e}")
        return None

# Ejemplo de uso (estos valores vendrían de tu lógica de aplicación o invitación)
# member_name = "AcmeCorporation"
# member_id = "acmecorp-member-12345"
# invitation_id = "inv-SOMEINVITATIONID"
# new_member_id = create_network_member(member_name, member_id, invitation_id)

# Después de crear un miembro, se desplegarían los nodos, se instalarían los chaincodes, etc.
# Todo esto se gestionaría a través de la API de Managed Blockchain o la consola.

// Un error común en Managed Blockchain:
// No gestionar correctamente los certificados y claves de acceso para los usuarios y aplicaciones,
// lo que puede impedir la interacción segura con la red.
// Otro error: No entender las diferencias entre Hyperledger Fabric y Ethereum antes de elegir un framework.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Innovación y Tendencias',
    'topic': 'Blockchain',
    'subtopic': 'Hyperledger Fabric',
    'definition': r'''
Hyperledger Fabric es un framework de blockchain de código abierto, diseñado específicamente para casos de uso empresariales y consorcios. A diferencia de las blockchains públicas como Bitcoin o Ethereum (que son "sin permiso"), Fabric es una blockchain "con permiso", lo que significa que los participantes en la red son conocidos y las transacciones pueden ser privadas entre las partes involucradas. Es como una red privada y muy segura donde empresas confiables pueden colaborar y compartir información de forma inmutable.

Aquí te va la aclaración: las empresas a menudo necesitan control sobre quién participa en su red y la privacidad de sus transacciones. Fabric permite esto al ofrecer componentes modulares y la capacidad de crear "canales" privados para subconjuntos de participantes. No sé tú, pero a mí la idea de una blockchain donde cada transacción no sea visible para todos me parece genial para el mundo empresarial.

Fabric se diferencia por varias características clave. Utiliza una arquitectura modular que permite a las organizaciones configurar sus redes con diferentes componentes según sus necesidades. Soporta "chaincode" (contratos inteligentes), que son programas que se ejecutan en la blockchain y contienen la lógica de negocio para las transacciones. Estos chaincodes pueden escribirse en lenguajes de programación populares como Go, Node.js o Java. La privacidad se logra a través de canales, que permiten que un grupo de miembros realice transacciones en un libro mayor separado, visible solo para ellos. Además, su modelo de consenso es configurable, lo que lo hace flexible para diversas necesidades empresariales. Amazon Managed Blockchain ofrece soporte para Hyperledger Fabric, lo que simplifica enormemente el despliegue y la gestión de estas redes en la nube de AWS. Empresas en la cadena de suministro, finanzas y salud utilizan Fabric para mejorar la transparencia, la trazabilidad y la eficiencia en sus procesos.
''',
    'code_example': r'''
// Este ejemplo es conceptual y muestra cómo se invocaría un chaincode en Hyperledger Fabric
// utilizando el SDK de Fabric (ej. Node.js SDK). No es código Dart directo.

/*
// Pseudocódigo (Node.js) para invocar un chaincode (contrato inteligente) en Hyperledger Fabric.
// Esto interactuaría con un nodo de Fabric que forma parte de una red,
// potencialmente gestionada por Amazon Managed Blockchain.

const { Gateway, Wallets } = require('fabric-network');
const path = require('path');
const fs = require('fs');

async function invokeChaincode(orgName, walletPath, userId, channelName, chaincodeName, fcn, args) {
    // Cargar el perfil de conexión de la organización
    const ccpPath = path.resolve(__dirname, 'connection-org1.json'); // Archivo de configuración de la red
    const ccp = JSON.parse(fs.readFileSync(ccpPath, 'utf8'));

    // Configurar la billetera de identidades
    const wallet = await Wallets.newFileSystemWallet(walletPath);

    // Comprobar si la identidad del usuario ya existe en la billetera
    const identity = await wallet.get(userId);
    if (!identity) {
        console.log(`La identidad de usuario "${userId}" no existe en la billetera. Registre/importe primero.`);
        return;
    }

    // Crear una nueva pasarela (gateway) para conectar con el Fabric
    const gateway = new Gateway();
    try {
        await gateway.connect(ccp, {
            wallet,
            identity: userId,
            discovery: { enabled: true, asLocalhost: true } // Descubrimiento de peers
        });

        // Obtener la red y el contrato (chaincode)
        const network = await gateway.getNetwork(channelName);
        const contract = network.getContract(chaincodeName);

        // Invocar la función del chaincode
        console.log(`Invoking chaincode function: ${fcn} with args: ${args.join(', ')}`);
        const result = await contract.submitTransaction(fcn, ...args);
        console.log(`Transaction has been submitted. Result: ${result.toString()}`);
        return result.toString();

    } catch (error) {
        console.error(`Error al invocar el chaincode: ${error}`);
    } finally {
        gateway.disconnect();
    }
}

// Ejemplo de uso:
// invokeChaincode(
//     'Org1',
//     './wallet',        // Ruta a la billetera de identidades
//     'user1',           // ID del usuario registrado en la billetera
//     'mychannel',       // Nombre del canal
//     'mychaincode',     // Nombre del chaincode
//     'createAsset',     // Función del chaincode a invocar
//     ['asset1', 'blue', '300', 'Tom', '100'] // Argumentos de la función
// );

// Un error común en Hyperledger Fabric:
// Problemas con la configuración de certificados y el registro de identidades de usuario,
// lo que puede llevar a errores de autenticación y autorización al intentar interactuar con la red.
// Otro error: No entender el modelo de aprobación de transacciones y el consenso,
// lo que puede resultar en transacciones que no son validadas por los pares suficientes.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Innovación y Tendencias',
    'topic': 'Blockchain',
    'subtopic': 'Ethereum en AWS',
    'definition': r'''
Ethereum es una plataforma de blockchain de código abierto que permite la creación de aplicaciones descentralizadas (dApps) y contratos inteligentes. A diferencia de Bitcoin, que se enfoca principalmente en transacciones de criptomonedas, Ethereum es una "computadora mundial" que puede ejecutar cualquier programa, lo que la hace muy versátil para construir soluciones complejas.

Aquí te va la aclaración: ejecutar un nodo Ethereum por tu cuenta puede ser complejo, ya que requiere gestionar la infraestructura, mantener la sincronización con la red y asegurar la disponibilidad. AWS simplifica esto al ofrecer formas de desplegar y gestionar nodos Ethereum, principalmente a través de Amazon Managed Blockchain para redes privadas (Ethereum privada) o mediante la gestión manual de instancias EC2 para nodos públicos.

Con Ethereum en AWS, puedes construir y desplegar tus contratos inteligentes y dApps. Los contratos inteligentes son como acuerdos auto-ejecutables que se almacenan y se ejecutan en la blockchain de Ethereum, garantizando que los términos del acuerdo se cumplan automáticamente sin la necesidad de intermediarios. Esto es fundamental para aplicaciones de finanzas descentralizadas (DeFi), NFTs (Tokens No Fungibles) o gestión de identidad. Si bien Managed Blockchain se centra en redes de Ethereum con permiso (donde los participantes son conocidos), también puedes desplegar nodos Ethereum públicos en EC2 para interactuar con la red principal de Ethereum. AWS te proporciona la flexibilidad y la infraestructura para escalar tus aplicaciones basadas en Ethereum, desde la creación de un nuevo token hasta el despliegue de una compleja dApp que interactúa con millones de usuarios.
''',
    'code_example': r'''
// Este ejemplo es conceptual y muestra cómo se interactuaría con un contrato inteligente de Ethereum
// utilizando la librería web3.js en Node.js. No es código Dart directo.

/*
// Pseudocódigo (Node.js) para interactuar con un contrato inteligente de Ethereum.
// Esto asume que tienes un nodo Ethereum accesible (ej. en una instancia EC2 o a través de un servicio).

const Web3 = require('web3');

// 1. Configurar la conexión al nodo Ethereum
// Reemplaza con la URL de tu nodo Ethereum (ej. desde un nodo en EC2 o Managed Blockchain)
const web3 = new Web3(new Web3.providers.HttpProvider('http://localhost:8545'));

// 2. Definir la ABI (Application Binary Interface) del contrato inteligente
// La ABI describe las funciones y eventos del contrato.
const contractABI = [
    // ... parte de tu ABI (array de objetos JSON) ...
    {
        "constant": false,
        "inputs": [
            { "name": "newValue", "type": "uint256" }
        ],
        "name": "setValue",
        "outputs": [],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "function"
    },
    {
        "constant": true,
        "inputs": [],
        "name": "getValue",
        "outputs": [
            { "name": "", "type": "uint256" }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    }
];

// 3. Definir la dirección del contrato inteligente desplegado
const contractAddress = '0x123...abc'; // Reemplaza con la dirección de tu contrato desplegado

// 4. Crear una instancia del contrato
const myContract = new web3.eth.Contract(contractABI, contractAddress);

async function interactWithContract() {
    // Obtener las cuentas disponibles (ej. para enviar transacciones)
    const accounts = await web3.eth.getAccounts();
    const senderAddress = accounts[0];

    console.log(`Valor actual del contrato: ${await myContract.methods.getValue().call()}`);

    // Invocar una función que cambia el estado del contrato (requiere una transacción)
    // Se necesita una cuenta con Ether para pagar el gas.
    console.log('Enviando transacción para cambiar el valor...');
    const receipt = await myContract.methods.setValue(42).send({ from: senderAddress, gas: 100000 });
    console.log('Transacción enviada. Hash de la transacción:', receipt.transactionHash);

    console.log(`Nuevo valor del contrato: ${await myContract.methods.getValue().call()}`);
}

// interactWithContract();

// Un error común al trabajar con Ethereum en AWS:
// No gestionar adecuadamente las claves privadas de las cuentas (se debe usar AWS Secrets Manager).
// Otro error: No entender el concepto de "gas" y su importancia para las transacciones en Ethereum,
// lo que puede llevar a transacciones fallidas o costos inesperados.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Innovación y Tendencias',
    'topic': 'Blockchain',
    'subtopic': 'Casos de uso empresariales',
    'definition': r'''
Los casos de uso empresariales de blockchain van más allá de las criptomonedas y se centran en cómo esta tecnología puede resolver problemas del mundo real para las organizaciones. Se trata de aprovechar la inmutabilidad, la transparencia (selectiva) y la descentralización para mejorar la eficiencia, la seguridad y la confianza en diversas industrias.

Aquí te va la aclaración: las empresas no adoptan blockchain solo por la novedad, sino porque ofrece soluciones únicas para desafíos como la falta de confianza entre partes, la ineficiencia de los procesos manuales o la dificultad de rastrear activos. Blockchain no es la solución para todo, pero en ciertos escenarios, es increíblemente poderosa.

Existen varios ejemplos claros de cómo las empresas están utilizando blockchain. Uno de los más comunes es la **trazabilidad en la cadena de suministro**. Imagina una empresa de alimentos que necesita verificar el origen y el recorrido de sus productos desde la granja hasta el estante; blockchain permite registrar cada paso de forma inmutable, aumentando la confianza del consumidor y facilitando la detección de fraudes o contaminaciones. Otro caso es la **gestión de registros y credenciales**, como historiales médicos o diplomas universitarios, donde blockchain puede garantizar la autenticidad y la inmutabilidad de los datos, permitiendo a los individuos controlar su información de forma segura. En el **sector financiero**, se utiliza para la liquidación de transacciones transfronterizas, la tokenización de activos (convertir activos del mundo real en tokens digitales) o la financiación comercial, reduciendo intermediarios y acelerando los procesos. Finalmente, la **gestión de derechos de autor y propiedad intelectual** también se beneficia, permitiendo a los creadores registrar y probar la propiedad de sus obras de forma inmutable. Empresas como Walmart han explorado blockchain para la trazabilidad de alimentos, demostrando el impacto práctico de esta tecnología en grandes operaciones.
''',
    'code_example': r'''
// Los casos de uso empresariales de blockchain son implementaciones de alto nivel,
// por lo que un "ejemplo de código" directo sería el código de la aplicación
// que interactúa con la blockchain, no la blockchain en sí.
// Sin embargo, podemos conceptualizar un "flujo de negocio" para uno de estos casos.

/*
// Flujo conceptual de un caso de uso de Blockchain para Trazabilidad de la Cadena de Suministro:

// Actores: Granjero, Procesador, Transportista, Minorista, Consumidor.
// Blockchain: Hyperledger Fabric (con canales privados para ciertas transacciones)
// Contrato Inteligente (Chaincode): 'SupplyChainContract' con funciones para:
//    - `registerProduct(productId, origin, farmId)`
//    - `recordProcessing(productId, processorId, date, method)`
//    - `recordShipment(productId, shipmentId, transporterId, originLoc, destLoc)`
//    - `recordSale(productId, retailerId, customerId)`
//    - `queryProductHistory(productId)`

// Pseudocódigo de una aplicación que interactúa con la blockchain:

// 1. **Granjero registra el producto:**
//    Cuando el granjero cosecha un lote de tomates:
//    app.invokeChaincode(
//        'SupplyChainContract', 'registerProduct',
//        ['TOMATO-BATCH-001', 'GranjaElSol', 'FARM001']
//    );
//    // Esto crea un registro inmutable del origen del tomate en la blockchain.

// 2. **Procesador registra el procesamiento:**
//    Cuando los tomates llegan a la planta de procesamiento:
//    app.invokeChaincode(
//        'SupplyChainContract', 'recordProcessing',
//        ['TOMATO-BATCH-001', 'PROCESSOR001', '2024-06-01', 'WASHED_PACKED']
//    );
//    // Añade un nuevo evento al historial del tomate en la blockchain.

// 3. **Transportista registra el envío:**
//    Cuando los tomates son cargados en un camión para el minorista:
//    app.invokeChaincode(
//        'SupplyChainContract', 'recordShipment',
//        ['TOMATO-BATCH-001', 'SHIPMENT-XYZ', 'TRUCK005', 'ProcessorLoc', 'RetailerLoc']
//    );
//    // Se registra el movimiento físico del producto.

// 4. **Consumidor verifica la historia del producto (lectura):**
//    El consumidor escanea un código QR en el paquete del tomate en la tienda.
//    La aplicación del consumidor hace una consulta a la blockchain:
//    const history = app.queryChaincode('SupplyChainContract', 'queryProductHistory', ['TOMATO-BATCH-001']);
//    // La aplicación muestra al consumidor todo el historial verificado del tomate:
//    // "Origen: Granja El Sol, Procesado el 2024-06-01, Transportado por TRUCK005..."

// Ventajas clave:
// - Transparencia: Todos los participantes autorizados pueden ver la historia completa.
// - Inmutabilidad: Los registros no pueden ser alterados una vez que están en la blockchain.
// - Confianza: Reduce la necesidad de confianza en un intermediario central.

// Un error común al implementar casos de uso empresariales de blockchain:
// Intentar usar blockchain para resolver problemas que pueden ser resueltos de forma más simple y económica
// con bases de datos tradicionales. Blockchain no es una bala de plata.
// Otro error: No involucrar a todos los stakeholders clave en el diseño de la red y los contratos inteligentes.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Innovación y Tendencias',
    'topic': 'Computación Cuántica',
    'subtopic': 'Amazon Braket',
    'definition': r'''
Amazon Braket es un servicio completamente administrado de AWS que te permite explorar, experimentar y construir algoritmos para computación cuántica. Si la computación tradicional usa bits que son 0 o 1, la computación cuántica usa "qubits" que pueden ser 0, 1, o ambos a la vez (superposición), lo que abre la puerta a resolver problemas que son intratables para los ordenadores clásicos. Braket es como un laboratorio virtual donde puedes jugar con computadoras cuánticas reales y simuladores.

Aquí te va la aclaración: la computación cuántica es un campo emergente y muy complejo. No se trata solo de tener una computadora cuántica, sino de saber cómo programarla. Braket simplifica este proceso al proporcionarte un entorno de desarrollo unificado y acceso a diferentes tipos de hardware cuántico (simuladores y procesadores cuánticos reales de diferentes proveedores) a través de una interfaz común.

Con Amazon Braket, puedes escribir tu código cuántico utilizando frameworks populares como PennyLane o Cirq, y luego ejecutarlo en simuladores cuánticos (para probar tus algoritmos sin costo en hardware real) o en computadoras cuánticas reales de proveedores como IonQ, Rigetti o QuEra. Braket se encarga de la gestión de la infraestructura subyacente, lo que te permite concentrarte en el diseño de tus algoritmos cuánticos. Esto es especialmente útil para investigadores, científicos y empresas que están explorando el potencial de la computación cuántica para problemas complejos en áreas como la química (diseño de nuevos materiales), la optimización (logística, finanzas) o el descubrimiento de fármacos. Braket democratiza el acceso a esta tecnología de vanguardia, permitiendo que más personas experimenten y contribuyan a su desarrollo.
''',
    'code_example': r'''
// Este ejemplo es conceptual y muestra un programa cuántico simple en Python usando Qiskit (un framework compatible con Braket)
// o conceptualmente cómo se interactuaría con Braket. No es código Dart directo.

/*
# Pseudocódigo (Python) para un programa cuántico simple en Amazon Braket
# utilizando el SDK de PennyLane (un framework compatible).

import pennylane as qml
from pennylane import numpy as np

# 1. Definir el dispositivo cuántico en Braket
# Puedes usar un simulador local o un dispositivo de hardware real de Braket
# device = qml.device("braket.local.qubit", wires=2) # Simulador local
# device = qml.device("braket.aws.qubit", wires=2, device_arn="arn:aws:braket:::device/qpu/ionq/ionQdevice") # IonQ QPU
# device = qml.device("braket.aws.qubit", wires=2, device_arn="arn:aws:braket:::device/quantum-simulator/amazon/sv1") # Simulador SV1

# Para este ejemplo, usaremos un simulador local para que sea ejecutable conceptualmente.
device = qml.device("default.qubit", wires=2)

# 2. Definir el circuito cuántico
@qml.qnode(device)
def quantum_circuit(x):
    # Aplicar una compuerta de Hadamard al primer qubit
    qml.Hadamard(wires=0)
    # Aplicar una compuerta CNOT (control-NOT) con el primer qubit como control y el segundo como objetivo
    qml.CNOT(wires=[0, 1])
    # Rotar el primer qubit en el eje Y por un ángulo 'x'
    qml.RY(x, wires=0)
    # Medir ambos qubits
    return qml.expval(qml.PauliZ(0)), qml.expval(qml.PauliZ(1)) # Expectation values of Pauli-Z operator

# 3. Ejecutar el circuito con un valor de entrada
# angle_value = np.array(0.5, requires_grad=True)
# results = quantum_circuit(angle_value)

# print(f"Resultados de la medición: {results}")

# Cómo se ejecutaría esto en Braket (conceptual):
# En un Jupyter Notebook de SageMaker con el entorno Braket, ejecutarías estas líneas.
# Braket se encargaría de enviar el circuito al dispositivo cuántico o simulador configurado.

# Un error común en computación cuántica:
# No entender los principios básicos de la mecánica cuántica (superposición, entrelazamiento),
# lo que dificulta el diseño de algoritmos cuánticos efectivos.
# Otro error: Intentar resolver problemas que son eficientes para computadoras clásicas con computación cuántica,
# donde las computadoras clásicas aún son superiores.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Innovación y Tendencias',
    'topic': 'Computación Cuántica',
    'subtopic': 'Conceptos básicos de QC',
    'definition': r'''
Los conceptos básicos de la Computación Cuántica (QC) son los fundamentos que rigen cómo funcionan estas máquinas radicalmente diferentes. A diferencia de los ordenadores clásicos que procesan información utilizando bits (que son 0 o 1), los ordenadores cuánticos utilizan "qubits", que son la unidad fundamental de información cuántica.

Aquí te va la aclaración: entender estos conceptos es como aprender un nuevo idioma para programar. No es solo una cuestión de tecnología, sino de una física totalmente diferente. No sé tú, pero a mí al principio me pareció una locura, pero luego de asimilarlo, es fascinante.

El concepto más fundamental es el **Qubit**. Un qubit no solo puede ser 0 o 1, sino que también puede ser una superposición de ambos estados al mismo tiempo. Imagina que un qubit es una moneda girando en el aire: hasta que no cae, está en una superposición de cara y cruz. Solo al medirla se "colapsa" a un estado definido. Esto permite que los ordenadores cuánticos exploren múltiples posibilidades simultáneamente. Otro concepto clave es el **Entrelazamiento**. Cuando dos o más qubits están entrelazados, el estado de un qubit depende instantáneamente del estado de los otros, sin importar la distancia entre ellos. Es como si dos monedas, una vez que giran juntas y están entrelazadas, si una cae cara, la otra cae cruz, sin importar si están en diferentes habitaciones. Este fenómeno permite a los ordenadores cuánticos realizar cálculos que serían imposibles para los clásicos. Finalmente, la **Interferencia** es la capacidad de los qubits de influir en las probabilidades de los resultados finales, permitiendo que los algoritmos cuánticos amplifiquen las soluciones correctas y cancelen las incorrectas. Estos tres principios (superposición, entrelazamiento e interferencia) son la base de cómo los ordenadores cuánticos pueden superar a los clásicos en ciertos tipos de problemas.
''',
    'code_example': r'''
// Este es un ejemplo conceptual para ilustrar Superposición y Entrelazamiento usando un "lenguaje" cuántico.
// No es un código ejecutable en Dart o Python directamente, sino una representación didáctica.

/*
// Representación conceptual de Superposición y Entrelazamiento:

// Imagine un sistema de qubits:
// Qubit 0: |0>  (estado clásico, como un bit 0)
// Qubit 1: |0>  (estado clásico, como un bit 0)

// **1. Superposición:**
// Para poner Qubit 0 en superposición, aplicamos una compuerta Hadamard (H).
// Esto es como girar la moneda.
//
// Compuerta H (Qubit 0)
// |0> ---[H]--->  |0> + |1>
//
// Después de H, Qubit 0 está en un estado que es 50% probabilidad de |0> y 50% de |1>.
// No es 0 ni 1 hasta que lo medimos.

// **2. Entrelazamiento:**
// Ahora, entrelazamos Qubit 0 con Qubit 1 usando una compuerta CNOT (control-NOT).
// Qubit 0 es el control, Qubit 1 es el objetivo.
// Si Qubit 0 es |1>, Qubit 1 se voltea.
//
// Qubit 0: |0> ---[H]----@---
//                       |
// Qubit 1: |0> ----------X---
//
// Si Qubit 0 (después de H) es en superposición (|0> + |1>),
// y luego aplicamos CNOT:
//
// El sistema Qubit 0 y Qubit 1 estará en una superposición de:
// (|00> + |11>) / sqrt(2)  (estado de Bell)
//
// Esto significa que, si medimos Qubit 0 y obtenemos |0>, automáticamente sabemos que Qubit 1 también es |0>.
// Si medimos Qubit 0 y obtenemos |1>, automáticamente sabemos que Qubit 1 también es |1>.
// Sus estados están "entrelazados", no son independientes.

// Un error común:
// Confundir un ordenador cuántico con un ordenador clásico muy rápido.
// Los ordenadores cuánticos no son simplemente más rápidos para todas las tareas;
// son radicalmente diferentes y solo sobresalen en tipos muy específicos de problemas
// que aprovechan la superposición y el entrelazamiento.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Innovación y Tendencias',
    'topic': 'Computación Cuántica',
    'subtopic': 'Algoritmos cuánticos',
    'definition': r'''
Los algoritmos cuánticos son conjuntos de instrucciones paso a paso diseñadas para ser ejecutadas en una computadora cuántica, aprovechando sus principios fundamentales como la superposición, el entrelazamiento y la interferencia para resolver ciertos problemas de manera más eficiente que los algoritmos clásicos. No es como escribir código para una computadora normal, sino pensar en cómo manipular estados cuánticos.

Aquí te va la aclaración: desarrollar un algoritmo cuántico no es trivial. Requiere una comprensión profunda de cómo los fenómenos cuánticos pueden ser utilizados para acelerar o incluso hacer posible la solución de problemas que son intratables para las computadoras clásicas. No sé tú, pero para mí es como diseñar una nueva forma de pensar para la computación.

Aunque la computación cuántica aún está en sus primeras etapas, ya existen algunos algoritmos cuánticos famosos que prometen revolucionar campos específicos. El **Algoritmo de Shor** es uno de los más conocidos; puede factorizar números grandes de manera exponencialmente más rápida que cualquier algoritmo clásico. Esto tiene implicaciones enormes para la criptografía moderna, ya que muchos esquemas de seguridad actuales se basan en la dificultad de factorizar números grandes. Otro es el **Algoritmo de Grover**, que puede buscar en una base de datos no estructurada (sin orden) de manera cuadráticamente más rápida que los algoritmos clásicos. Es como encontrar una aguja en un pajar mucho más rápido. También existen algoritmos cuánticos para **simulación cuántica**, que son fundamentales para la química cuántica y la ciencia de materiales, permitiendo modelar el comportamiento de moléculas complejas con una precisión inalcanzable para las computadoras clásicas. Otros algoritmos se enfocan en **optimización**, buscando la mejor solución entre un gran número de posibilidades, útil para problemas logísticos o financieros. Aunque todavía no tenemos computadoras cuánticas capaces de romper el cifrado moderno a gran escala, estos algoritmos son la prueba del potencial transformador de esta tecnología.
''',
    'code_example': r'''
// Este es un ejemplo conceptual de un algoritmo cuántico muy simple (superposición de un qubit).
// No es código ejecutable en Dart, sino una representación usando Qiskit (Python), un framework popular.

/*
# Pseudocódigo (Python) para un Algoritmo Cuántico Simple (Crear Superposición)
# usando la librería Qiskit, que es un framework de programación cuántica.

from qiskit import QuantumCircuit, transpile
from qiskit.providers.aer import AerSimulator

# 1. Crear un circuito cuántico con 1 qubit y 1 bit clásico para la medición.
# Un qubit para el estado cuántico, un bit clásico para almacenar el resultado de la medición.
qc = QuantumCircuit(1, 1)

# 2. Aplicar una compuerta Hadamard (H) al qubit.
# Esto pone el qubit en un estado de superposición: 50% de probabilidad de ser 0, 50% de ser 1.
# Es el "lanzamiento de moneda cuántico".
qc.h(0) # Aplica Hadamard al qubit en el índice 0

# 3. Medir el qubit y almacenar el resultado en el bit clásico.
# La medición "colapsa" el estado de superposición a 0 o 1.
qc.measure(0, 0) # Mide el qubit 0 y lo guarda en el bit clásico 0

# 4. Simular el circuito (conceptual, en Braket esto se enviaría a un simulador o QPU)
simulator = AerSimulator()
compiled_circuit = transpile(qc, simulator)
job = simulator.run(compiled_circuit, shots=1024) # Ejecutar 1024 veces
result = job.result()
counts = result.get_counts(qc)

# print(f"Resultados de la simulación (counts): {counts}")
# Salida esperada: {'0': ~512, '1': ~512} (aproximadamente 50% de cada uno)

# Otro ejemplo conceptual (pero más complejo): Entrelazamiento (Estado de Bell)
# qc_bell = QuantumCircuit(2, 2)
# qc_bell.h(0) # Pone el primer qubit en superposición
# qc_bell.cx(0, 1) # Entrelaza el primer y segundo qubit con una compuerta CNOT
# qc_bell.measure([0, 1], [0, 1])
#
# job_bell = simulator.run(transpile(qc_bell, simulator), shots=1024)
# counts_bell = job_bell.result().get_counts(qc_bell)
# print(f"Resultados de Bell (counts): {counts_bell}")
# Salida esperada: {'00': ~512, '11': ~512} (aproximadamente 50% de 00 y 50% de 11, nunca 01 o 10)

// Un error común al pensar en algoritmos cuánticos:
// Pensar que "fuerza bruta" es lo que los hace rápidos. En realidad, explotan las propiedades cuánticas
// para encontrar patrones o soluciones de manera más inteligente, no solo probando más opciones.
// Otro error: Asumir que la computación cuántica es para todos los problemas; es para problemas muy específicos.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Aws',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Innovación y Tendencias',
    'topic': 'Computación Cuántica',
    'subtopic': 'Simuladores cuánticos',
    'definition': r'''
Los simuladores cuánticos son programas de software que imitan el comportamiento de una computadora cuántica real en una computadora clásica. Dado que las computadoras cuánticas reales son escasas, costosas y aún muy experimentales, los simuladores cuánticos son herramientas esenciales para que los desarrolladores y científicos puedan diseñar, probar y depurar algoritmos cuánticos sin necesidad de acceder a hardware físico. Imagina que quieres aprender a conducir un coche de carreras muy avanzado, y el simulador te permite practicar en un entorno seguro antes de subirte al real.

¿Te estás preguntando por qué esto importa? Aquí te va la aclaración: las computadoras cuánticas actuales son ruidosas (propensas a errores) y tienen un número limitado de qubits. Los simuladores permiten experimentar con circuitos cuánticos "ideales" o con un mayor número de qubits que los disponibles en el hardware actual, lo que acelera la investigación y el desarrollo de nuevos algoritmos.

Amazon Braket, el servicio de computación cuántica de AWS, incluye varios simuladores cuánticos robustos. El **Simulador SV1** (State Vector Simulator) puede simular circuitos cuánticos de hasta 34 qubits, lo que es impresionante para una máquina clásica, manteniendo el estado completo del sistema cuántico. Esto es ideal para depurar algoritmos complejos y entender cómo se comportan los qubits. Otro simulador es el **DM1** (Density Matrix Simulator), que es útil para simular sistemas cuánticos ruidosos (que tienen errores), lo que es más cercano a las limitaciones de las computadoras cuánticas actuales. También tienes la opción de usar simuladores locales de código abierto como `qiskit_aer` o `pennylane-qchem` directamente en tu entorno de desarrollo. Los simuladores son cruciales para el desarrollo de algoritmos, la educación en computación cuántica y la validación de la lógica de un circuito antes de invertir tiempo y dinero en el hardware cuántico real, que se cobra por el tiempo de uso.
''',
    'code_example': r'''
// Este ejemplo es conceptual y muestra cómo se usaría un simulador cuántico local en Python.
// No es código Dart directo, pero ilustra la interacción con un simulador.

/*
# Pseudocódigo (Python) para usar un simulador cuántico local con Qiskit
# y ejecutar un circuito simple.

from qiskit import QuantumCircuit, transpile
from qiskit.providers.aer import AerSimulator # Importa el simulador de Qiskit Aer

# 1. Crear un circuito cuántico (ej. un estado de Bell)
qc_bell = QuantumCircuit(2, 2) # 2 qubits, 2 bits clásicos
qc_bell.h(0) # Hadamard en el primer qubit (superposición)
qc_bell.cx(0, 1) # CNOT con el primer qubit como control (entrelazamiento)
qc_bell.measure([0, 1], [0, 1]) # Medir ambos qubits

# 2. Elegir un simulador cuántico
# AerSimulator es un simulador de uso general de Qiskit que corre en tu máquina local.
simulator = AerSimulator()

# 3. Transpilar el circuito para el simulador (optimización)
compiled_circuit = transpile(qc_bell, simulator)

# 4. Ejecutar el circuito en el simulador
# 'shots' es el número de veces que se ejecuta el circuito para obtener estadísticas.
job = simulator.run(compiled_circuit, shots=1000)

# 5. Obtener los resultados
result = job.result()
counts = result.get_counts(qc_bell) # Obtener las cuentas de los resultados de medición

print(f"Resultados de la simulación del estado de Bell (1000 shots): {counts}")
# Salida esperada: {'00': ~500, '11': ~500} (aproximadamente 50% para cada estado entrelazado)

# Cómo se usaría en Amazon Braket:
# En lugar de `AerSimulator()`, usarías `qml.device("braket.local.qubit", wires=...)`
# o `qml.device("braket.aws.qubit", wires=..., device_arn="arn:aws:braket:::device/quantum-simulator/amazon/sv1")`
# para los simuladores de Braket. La lógica del circuito cuántico (Hadamard, CNOT, etc.)
# seguiría siendo la misma, pero la ejecución se delegaría a Braket.

// Un error común al usar simuladores cuánticos:
// Asumir que un simulador con muchos qubits es equivalente a una computadora cuántica real con el mismo número de qubits.
// Los simuladores tienen limitaciones de memoria y tiempo en computadoras clásicas,
// y no replican los "ruidos" y errores del hardware cuántico real.
// Otro error: No usar simuladores para probar y depurar tus algoritmos antes de enviarlos a hardware real.
*/
'''
  });
}
