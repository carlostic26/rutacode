import 'package:sqflite_common/sqlite_api.dart';

Future<void> insertMidLevel1AwsData(Database db) async {
  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Arquitectura Avanzada',
    'topic': 'Well-Architected Framework',
    'subtopic': 'Pilares del Well-Architected Framework',
    'definition': '''
El Well-Architected Framework es como una guía de buenas prácticas que AWS nos da para construir arquitecturas robustas y eficientes en la nube. No es algo que debas seguir al pie de la letra como una ley, sino más bien un conjunto de principios que te ayudan a diseñar sistemas que funcionen bien, sean seguros y no te cuesten un ojo de la cara.

Seguramente pensarás de qué va todo esto y por qué es relevante. Pues bien, si construyes algo en la nube sin considerar estos pilares, es como construir una casa sin cimientos sólidos: puede que funcione un tiempo, pero tarde o temprano se vienen los problemas.

Este framework se compone de seis pilares fundamentales, cada uno enfocado en un aspecto crucial de tu arquitectura en la nube. Primero, tenemos la **Excelencia Operacional**, que se centra en cómo operar y monitorear los sistemas, y cómo mejorar continuamente. Es la base para asegurarte de que tus procesos son eficientes y que puedes responder rápidamente a cualquier incidente. Luego, está la **Seguridad**, un pilar obvio pero vital. Aquí se trata de proteger tus datos y sistemas, implementando controles de acceso, encriptación y detectando amenazas de forma proactiva. Piensa en la tranquilidad de saber que tu información está a salvo. Después viene la **Fiabilidad**, que se enfoca en cómo asegurar que tu sistema funcione de manera consistente y se recupere de fallos automáticamente. Esto implica diseñar para la redundancia, la resiliencia y tener planes de recuperación ante desastres. Si tu aplicación se cae, la fiabilidad te asegura que se levantará rápido.

El cuarto pilar es la **Eficiencia del Rendimiento**. Aquí, la clave es usar los recursos de manera inteligente para cumplir con los requisitos de rendimiento. Esto no solo significa que tu aplicación sea rápida, sino que también escale eficientemente para manejar la demanda. Finalmente, tenemos la **Optimización de Costos**, que se dedica a gastar lo justo y necesario. Se trata de elegir los servicios adecuados, dimensionarlos correctamente y aprovechar las ofertas de precios para minimizar tus gastos sin sacrificar rendimiento ni fiabilidad. Un sexto pilar, que ha sido añadido más recientemente, es la **Sostenibilidad**, que busca reducir el impacto ambiental de tus cargas de trabajo en la nube, optimizando el uso de recursos y seleccionando regiones y servicios que minimicen el consumo energético. La idea es construir pensando en el futuro.
''',
    'code_example': r'''
// Este es un ejemplo conceptual, ya que el Well-Architected Framework es una guía de diseño, no código.
// Representa la aplicación de principios, no una función o método.

// Principio de Excelencia Operacional: Implementar monitoreo y alarmas.
// Un buen patrón sería configurar CloudWatch para métricas de una instancia EC2.
// CORRECTO: Monitoreo adecuado
// 
// var AWS = require('aws-sdk');
// var cloudwatch = new AWS.CloudWatch();
// var params = {
//   MetricData: [
//     {
//       MetricName: 'CPUUtilization',
//       Dimensions: [
//         {
//           Name: 'InstanceId',
//           Value: 'i-0abcdef1234567890'
//         },
//       ],
//       Unit: 'Percent',
//       Value: 80
//     },
//   ],
//   Namespace: 'AWS/EC2'
// };
// cloudwatch.putMetricData(params, function(err, data) {
//   if (err) console.log(err, err.stack);
//   else     console.log(data);
// });
//
// INCORRECTO: Falta de monitoreo (no se muestra código, ya que la ausencia de código es el problema)
// Un ejemplo incorrecto sería no tener configurado ningún monitoreo para tus recursos críticos,
// dejando a tu equipo sin visibilidad del rendimiento o los problemas.
//
// Principio de Seguridad: Uso de IAM Roles en lugar de credenciales hardcodeadas.
// CORRECTO: Usar roles para acceso
// 
// // En una instancia EC2, se asigna un rol de IAM con los permisos necesarios.
// // El SDK de AWS asume automáticamente el rol de la instancia.
// const S3 = require('aws-sdk/clients/s3');
// const s3 = new S3();
//
// async function listMyBuckets() {
//   try {
//     const data = await s3.listBuckets().promise();
//     console.log('Mis buckets:', data.Buckets.map(b => b.Name));
//   } catch (err) {
//     console.error('Error al listar buckets:', err);
//   }
// }
// listMyBuckets();
//
// INCORRECTO: Credenciales hardcodeadas (mala práctica de seguridad)
// // NO HACER ESTO EN PRODUCCIÓN: Guardar credenciales directamente en el código
// const S3 = require('aws-sdk/clients/s3');
// const s3 = new S3({
//   accessKeyId: 'AKIAIOSFODNN7EXAMPLE',
//   secretAccessKey: 'wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY'
// });
// 
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Arquitectura Avanzada',
    'topic': 'Well-Architected Framework',
    'subtopic': 'Herramienta Well-Architected Tool',
    'definition': '''
La Well-Architected Tool de AWS es una herramienta super útil que te ayuda a evaluar tus cargas de trabajo en la nube siguiendo los principios del Well-Architected Framework. Pensemos por un momento en cómo esto puede ser un salvavidas para tus proyectos. En lugar de adivinar si tu arquitectura es buena o no, esta herramienta te ofrece una forma estructurada de revisarla.

Aquí te va la aclaración: la herramienta te guía a través de una serie de preguntas basadas en los seis pilares del framework (excelencia operacional, seguridad, fiabilidad, eficiencia del rendimiento, optimización de costos y sostenibilidad). Al responder estas preguntas sobre tu carga de trabajo específica, la herramienta identifica posibles riesgos y te da recomendaciones concretas sobre cómo mejorar. No se trata de un examen que tienes que pasar, sino de una oportunidad para aprender y fortalecer tu diseño. Por ejemplo, si estás construyendo una aplicación web, la herramienta podría preguntarte sobre cómo manejas los picos de tráfico (relacionado con la fiabilidad y eficiencia del rendimiento) o cómo proteges los datos de usuario (seguridad).

Lo interesante de esta herramienta es que te permite hacer un seguimiento de tu progreso a lo largo del tiempo. Puedes guardar las evaluaciones, ver cómo han evolucionado tus puntuaciones y si las mejoras que implementaste realmente tuvieron un impacto positivo. Además, no es solo para expertos; cualquier persona que esté diseñando o gestionando una carga de trabajo en AWS puede beneficiarse de ella. Es como tener un consultor de arquitectura de AWS a tu disposición, pero sin el costo asociado. Te ayuda a entender mejor tus puntos débiles y te da un plan de acción claro para corregirlos, asegurando que tu arquitectura sea más robusta y rentable.
''',
    'code_example': '''
// La Well-Architected Tool es una herramienta de consola de AWS, no una API o SDK que se codifique.
// Sin embargo, para ilustrar cómo interactuarías con ella, podríamos pensar en los pasos lógicos.

// ACCIÓN: Iniciar una nueva evaluación en la Well-Architected Tool.
// Esto se haría a través de la Consola de Administración de AWS, no con código.
// Imagina los pasos:
// 1. Ir a la consola de AWS.
// 2. Buscar "Well-Architected Tool".
// 3. Hacer clic en "Define a workload" o "Start a new review".
// 4. Seleccionar los pilares a evaluar (normalmente todos).
// 5. Responder las preguntas guiadas para cada pilar.

// CORRECTO: (Representación conceptual de un proceso de evaluación)
// Comentarios en la herramienta:
// "Hemos revisado el pilar de Seguridad y notado que no hay MFA (Autenticación Multifactor)
// configurada para los usuarios root. Recomendación: Habilitar MFA."
//
// "En el pilar de Optimización de Costos, se observó que hay instancias EC2
// aprovisionadas en exceso. Recomendación: Considerar el rightsizing o el uso de Savings Plans."

// INCORRECTO: (Representación conceptual de ignorar la herramienta)
// No utilizar la Well-Architected Tool y basar las decisiones de arquitectura solo en suposiciones.
// Esto podría llevar a:
// - Sobreaprovisionamiento de recursos sin darse cuenta.
// - Brechas de seguridad desconocidas.
// - Problemas de fiabilidad no anticipados que solo se descubren en producción.
//
// Un ejemplo incorrecto en la vida real sería:
// "No necesitamos revisar esto, la aplicación ya está funcionando bien."
// Sin una revisión proactiva, los problemas ocultos pueden surgir en el peor momento.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Arquitectura Avanzada',
    'topic': 'Well-Architected Framework',
    'subtopic': 'Patrones de diseño comunes',
    'definition': '''
Cuando hablamos de patrones de diseño en el contexto de AWS y el Well-Architected Framework, nos referimos a soluciones probadas y reutilizables para problemas comunes de arquitectura en la nube. No es que tengas que inventar la rueda cada vez que construyes algo; más bien, puedes apoyarte en la sabiduría colectiva de ingenieros que ya han resuelto desafíos similares.

Aquí te va la aclaración: Estos patrones son como los "planos" para construir componentes o sistemas que son fiables, seguros, eficientes y económicos en la nube. Por ejemplo, uno muy conocido es el patrón de **desacoplamiento**. La idea es que los componentes de tu sistema no dependan directamente unos de otros. Imagina que tienes una aplicación de comercio electrónico: el servicio de pedidos no debería fallar si el servicio de inventario tiene un pequeño problema. Puedes usar colas de mensajes como Amazon SQS o servicios de eventos como Amazon EventBridge para que los servicios se comuniquen de forma asíncrona, sin acoplamiento directo.

Otro patrón esencial es la **redundancia y alta disponibilidad**. Esto significa que tu sistema debe seguir funcionando incluso si una parte falla. Esto lo logras desplegando tus recursos en múltiples Zonas de Disponibilidad dentro de una región, usando servicios como Elastic Load Balancing para distribuir el tráfico y Auto Scaling para reemplazar automáticamente instancias fallidas. Piensa en el patrón de **carga equilibrada**, donde distribuyes el tráfico entre varias instancias para que ninguna se sobrecargue, mejorando así el rendimiento y la fiabilidad. O el patrón de **tolerancia a fallos**, donde diseñas tu sistema para que pueda soportar fallos sin que toda la aplicación se caiga. Patrones como el **Circuit Breaker** (cortacircuitos) son excelentes para evitar que una falla en un servicio se propague a otros, abriendo temporalmente la conexión para dar tiempo a que el servicio se recupere, como un interruptor de luz que salta para proteger el circuito.

Estos patrones te ayudan a implementar los pilares del Well-Architected Framework de forma práctica. No solo te dicen *qué* hacer (como "ser fiable"), sino *cómo* hacerlo usando servicios de AWS. Adoptar estos patrones no solo te ahorra tiempo y esfuerzo, sino que también reduce el riesgo de errores comunes y te permite construir sistemas más robustos desde el principio.
''',
    'code_example': '''
// Ejemplo de patrón de Desacoplamiento usando SQS (Amazon Simple Queue Service)
// Un servicio de procesamiento de pedidos envía un mensaje a una cola,
// y otro servicio de inventario lo consume de forma asíncrona.

// CORRECTO: Desacoplamiento con SQS
// // Servicio de pedidos (productor)
// const AWS = require('aws-sdk');
// const sqs = new AWS.SQS({region: 'us-east-1'});
//
// async function sendOrderToQueue(orderData) {
//   const params = {
//     MessageBody: JSON.stringify(orderData),
//     QueueUrl: 'https://sqs.us-east-1.amazonaws.com/123456789012/OrderProcessingQueue'
//   };
//   try {
//     await sqs.sendMessage(params).promise();
//     console.log('Pedido enviado a la cola.');
//   } catch (err) {
//     console.error('Error al enviar pedido:', err);
//   }
// }
//
// // Llamada de ejemplo
// // sendOrderToQueue({ orderId: '12345', item: 'Laptop', quantity: 1 });
//
// // Servicio de inventario (consumidor - idealmente una función Lambda o EC2)
// // Este servicio consultaría la cola y procesaría los mensajes.
// // (El código del consumidor es más complejo y no se muestra aquí en su totalidad,
// // pero implicaría pollQueue y deleteMessage)
//
// INCORRECTO: Acoplamiento fuerte (petición directa y síncrona que puede fallar si un servicio cae)
// // Servicio de pedidos haciendo una llamada HTTP directa y síncrona al servicio de inventario
// // Si el servicio de inventario falla, el servicio de pedidos también podría fallar.
// // Esto es una simplificación, pero ilustra el concepto.
// async function processOrderSynchronously(orderData) {
//   try {
//     // Imagina una llamada HTTP directa a un endpoint de inventario
//     // const inventoryResponse = await fetch('http://inventory-service.com/deduct-stock', {
//     //   method: 'POST',
//     //   body: JSON.stringify(orderData)
//     // });
//     // if (!inventoryResponse.ok) {
//     //   throw new Error('Error en el servicio de inventario');
//     // }
//     // console.log('Inventario actualizado y pedido procesado.');
//   } catch (err) {
//     console.error('Fallo crítico: No se pudo procesar el pedido debido a un error de inventario.', err);
//   }
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Arquitectura Avanzada',
    'topic': 'Well-Architected Framework',
    'subtopic': 'Optimización de costos',
    'definition': '''
La optimización de costos en AWS no es solo sobre gastar menos, es sobre gastar *inteligentemente*. Pensemos por un momento en esto: es maximizar el valor que obtienes de tu inversión en la nube, asegurándote de que los recursos que usas sean los adecuados para tu carga de trabajo y que no haya desperdicios.

¿Te estás preguntando por qué esto importa tanto? 

Pues bien, la nube te da una flexibilidad increíble, pero si no la gestionas bien, los costos pueden salirse de control. Un ejemplo clásico es dejar instancias EC2 corriendo 24/7 que solo se usan unas pocas horas al día, o tener buckets de S3 llenos de datos que ya no necesitas. La optimización de costos busca eliminar esos "gastos fantasma" y asegurar que cada dólar que inviertes en AWS te dé el mayor rendimiento.

Hay varias estrategias clave para esto. Primero, el **Rightsizing**: consiste en elegir el tamaño y tipo de recurso (como una instancia EC2 o una base de datos RDS) que mejor se adapte a tus necesidades de rendimiento, sin sobredimensionar. Esto es como elegir la talla correcta de ropa; no quieres algo que te quede enorme y estés pagando por tela que no usas. Luego, está el uso de **Instancias Reservadas (RIs)** y **Savings Plans**, que te permiten comprometerte a un cierto uso de AWS por un periodo de tiempo (1 o 3 años) a cambio de descuentos significativos. Si sabes que vas a necesitar ciertos recursos de forma continua, esta es una forma excelente de ahorrar.

Otra estrategia es aprovechar las **Instancias Spot**, que son capacidad de EC2 no utilizada por AWS y que puedes usar con descuentos muy altos (hasta un 90%), siempre y cuando tu carga de trabajo sea tolerante a interrupciones (AWS puede recuperarlas con poca antelación). Son perfectas para tareas que no son críticas en el tiempo, como el procesamiento por lotes. También es vital la **gestión de la elasticidad**: usar Auto Scaling para que tus recursos se ajusten automáticamente a la demanda, escalando hacia arriba cuando se necesita y hacia abajo cuando la demanda baja, así solo pagas por lo que usas. Finalmente, la **monitorización y análisis de costos** con herramientas como AWS Cost Explorer y AWS Budgets te permite visualizar tus gastos, identificar tendencias y establecer alertas para no exceder tus límites. La optimización de costos es un proceso continuo que requiere revisión y ajuste constantes.
''',
    'code_example': '''
// Ejemplos conceptuales de cómo el código o la configuración se relacionan con la optimización de costos.

// CORRECTO: Usar Auto Scaling para eficiencia de costos (pago por uso)
// // Configuración de un grupo de Auto Scaling para escalar dinámicamente
// // Esto asegura que solo pagas por la capacidad necesaria en cada momento.
// {
//   "AutoScalingGroupName": "MyWebAppASG",
//   "MinSize": 1,
//   "MaxSize": 10,
//   "DesiredCapacity": 1,
//   "LaunchConfigurationName": "MyWebAppLaunchConfig",
//   "VPCZoneIdentifier": "subnet-a123,subnet-b456",
//   "TargetGroupARNs": ["arn:aws:elasticloadbalancing:us-east-1:123456789012:targetgroup/my-web-tg/abcdef1234567890"],
//   "Tags": [
//     {
//       "Key": "Environment",
//       "Value": "Production",
//       "PropagateAtLaunch": true
//     }
//   ]
// }
//
// // Política de escalado para CPU
// {
//   "PolicyName": "ScaleOutOnCPU",
//   "AutoScalingGroupName": "MyWebAppASG",
//   "PolicyType": "TargetTrackingScaling",
//   "TargetTrackingConfiguration": {
//     "PredefinedMetricSpecification": {
//       "PredefinedMetricType": "ASGAverageCPUUtilization"
//     },
//     "TargetValue": 50.0 // Mantener la CPU promedio en 50%
//   }
// }
//
// INCORRECTO: Sobredimensionamiento o instancias inactivas (desperdicio de costos)
// // Una instancia EC2 de tipo "m5.xlarge" corriendo 24/7 para una aplicación que
// // solo recibe tráfico durante 8 horas al día y que podría funcionar en una "t3.medium".
// // O una base de datos RDS con una capacidad de IOPS mucho mayor a la necesaria.
// //
// // No hay código que represente esto directamente, ya que es una mala decisión
// // de configuración o arquitectura.
// //
// // El problema es la elección de recursos, no el código en sí.
// // Ejemplo de un recurso que podría estar sobredimensionado:
// // Recurso: Instancia EC2
// // Tipo actual: m5.xlarge (4 vCPU, 16 GiB RAM)
// // Uso real: Promedio 10% CPU, 2 GiB RAM
// // Oportunidad de optimización: Cambiar a t3.medium (2 vCPU, 4 GiB RAM) o usar Auto Scaling.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Arquitectura Avanzada',
    'topic': 'High Availability',
    'subtopic': 'Patrones de HA',
    'definition': '''
Los patrones de Alta Disponibilidad (HA) son como los "trucos" o estrategias que usamos para asegurarnos de que nuestras aplicaciones y servicios sigan funcionando incluso cuando algo falla. En el mundo de la nube, donde la infraestructura puede ser elástica y distribuida, la HA es crucial para no dejar a nuestros usuarios en el limbo.

¿Por qué es esto tan importante en una arquitectura?

Aquí te va la aclaración: Pensemos en un sitio web de comercio electrónico. Si el sitio se cae, los clientes no pueden comprar, y eso se traduce en pérdida de ingresos y frustración. Los patrones de HA buscan minimizar ese tiempo de inactividad. Uno de los principios fundamentales es la **redundancia**, que significa tener copias de tus componentes. Si un servidor falla, hay otro listo para tomar su lugar. Esto no solo aplica a servidores, sino también a bases de datos, redes y hasta regiones geográficas. Otro patrón común es la **recuperación automática de fallos**, donde el sistema detecta un problema y toma medidas para corregirlo sin intervención humana, como reiniciar una instancia o redirigir el tráfico.

También encontramos el concepto de **distribución de carga**, donde el tráfico se reparte entre múltiples recursos para evitar que uno solo se sobrecargue y se convierta en un punto único de fallo. AWS nos ofrece servicios como Elastic Load Balancing (ELB) que hacen esto de manera nativa. Otro patrón interesante es la **desconexión graciosa** o "graceful degradation", donde si un servicio tiene problemas, la aplicación puede seguir funcionando, quizás con funcionalidades limitadas, en lugar de colapsar por completo. Por ejemplo, si el servicio de recomendaciones falla en un sitio de streaming, los videos aún se reproducen. Estos patrones no solo nos dan tranquilidad, sino que también mejoran la experiencia del usuario, ya que la aplicación se mantiene en línea y receptiva, incluso frente a imprevistos. Implementarlos requiere un buen entendimiento de tus cargas de trabajo y los posibles puntos de fallo, pero el beneficio de tener un sistema siempre disponible bien lo vale.
''',
    'code_example': '''
// Los patrones de HA son conceptos de diseño, no código ejecutable directamente.
// Sin embargo, podemos mostrar cómo los servicios de AWS ayudan a implementarlos.

// CORRECTO: Uso de Elastic Load Balancing (ELB) para distribución de carga y HA.
// El ELB distribuye el tráfico a múltiples instancias sanas, asegurando la disponibilidad.
// // Configuración de un Application Load Balancer (ALB) con un grupo de destino
// // Este es un ejemplo conceptual de CloudFormation o Terraform para definir un ALB.
// Resources:
//   MyALB:
//     Type: AWS::ElasticLoadBalancingV2::LoadBalancer
//     Properties:
//       Scheme: internet-facing
//       Subnets:
//         - subnet-aaaaa # Subnet en AZ1
//         - subnet-bbbbb # Subnet en AZ2
//   MyTargetGroup:
//     Type: AWS::ElasticLoadBalancingV2::TargetGroup
//     Properties:
//       Port: 80
//       Protocol: HTTP
//       VpcId: vpc-cccccccc
//       HealthCheckPath: /health
//       HealthCheckIntervalSeconds: 30
//       HealthCheckTimeoutSeconds: 5
//       HealthyThresholdCount: 2
//       Targets:
//         - Id: i-0abcdef1234567890 # Instancia en AZ1
//         - Id: i-0fedcba9876543210 # Instancia en AZ2
//
// INCORRECTO: Un único punto de fallo (Single Point of Failure - SPOF)
// No hay un código directo para esto, ya que es la ausencia de HA.
// Un ejemplo sería tener una sola instancia EC2 sin ELB ni Auto Scaling,
// o una base de datos sin Multi-AZ. Si esa única instancia o base de datos falla,
// toda la aplicación se cae.
//
// Un sistema con SPOF no implementa patrones de HA.
// Por ejemplo, tener toda tu aplicación ejecutándose en una única instancia
// de base de datos sin réplicas o backups.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Arquitectura Avanzada',
    'topic': 'High Availability',
    'subtopic': 'Multi-AZ deployments',
    'definition': '''
Las implementaciones Multi-AZ en AWS son una de las formas más directas y efectivas de lograr alta disponibilidad para tus aplicaciones. Piensa en ellas como una estrategia de respaldo geográfico dentro de una misma región de AWS, pero a nivel de centro de datos.

¿Por qué esta configuración es tan valiosa?

Aquí te va la aclaración: AWS divide sus regiones en varias "Zonas de Disponibilidad" (AZs). Cada AZ es un centro de datos o un grupo de centros de datos discretos con energía, redes y conectividad redundantes, aislados de fallos en otras AZs. Cuando configuras una implementación Multi-AZ, estás desplegando tus recursos (como instancias EC2, bases de datos RDS o balanceadores de carga) en al menos dos de estas zonas de disponibilidad. La magia es que si una AZ experimenta un problema (un corte de energía, un desastre natural localizado, un fallo de hardware masivo), tu aplicación o base de datos sigue funcionando sin interrupciones significativas, ya que el tráfico se redirige automáticamente a los recursos en la AZ sana.

Un ejemplo clásico es Amazon RDS (Relational Database Service). Al crear una instancia de base de datos RDS con la opción Multi-AZ habilitada, AWS provisiona automáticamente una réplica síncrona de tu base de datos en una AZ diferente. Si la instancia principal falla, RDS realiza un failover automático a la réplica en cuestión de minutos (a veces segundos), y tu aplicación no necesita cambiar su endpoint de conexión. Es transparente para el usuario final. Lo mismo ocurre con los balanceadores de carga; un Application Load Balancer (ALB) por defecto distribuye el tráfico entre las AZs que configures, y si una instancia falla en una AZ, el ALB solo envía tráfico a las instancias sanas en otras AZs. Esto no solo mejora la fiabilidad, sino que también proporciona una base sólida para la recuperación ante desastres dentro de una misma región, reduciendo drásticamente el riesgo de un tiempo de inactividad prolongado.
''',
    'code_example': '''
// Ejemplo conceptual de cómo se configura un despliegue Multi-AZ para una base de datos RDS.
// Este no es código ejecutable completo, sino una representación de la configuración clave.

// CORRECTO: Configuración de RDS Multi-AZ usando AWS CLI o CloudFormation/Terraform
// // Comando AWS CLI para crear una instancia RDS PostgreSQL con Multi-AZ
// aws rds create-db-instance \\
//   --db-instance-identifier my-multi-az-db \\
//   --db-instance-class db.t3.medium \\
//   --engine postgres \\
//   --master-username admin \\
//   --master-user-password mypassword \\
//   --allocated-storage 20 \\
//   --availability-zone us-east-1a \\ # Zona de disponibilidad primaria
//   --multi-az # Habilitar Multi-AZ para que se cree una réplica en otra AZ
//
// // En CloudFormation, se vería similar:
// Resources:
//   MyRDSInstance:
//     Type: AWS::RDS::DBInstance
//     Properties:
//       DBInstanceIdentifier: my-multi-az-db
//       DBInstanceClass: db.t3.medium
//       Engine: postgres
//       MasterUsername: admin
//       MasterUserPassword: mypassword
//       AllocatedStorage: 20
//       MultiAZ: true # La propiedad clave para Multi-AZ
//       VPCSecurityGroups:
//         - sg-xxxxxxxx
//       DBSubnetGroupName: my-db-subnet-group # Debe contener subnets en múltiples AZs
//
// INCORRECTO: Despliegue de un solo punto de fallo en una única AZ
// // Crear una instancia RDS sin la opción Multi-AZ, o desplegar todas tus instancias
// // EC2 en una única Zona de Disponibilidad.
// //
// // Comando AWS CLI para una instancia RDS sin Multi-AZ (menos fiable)
// aws rds create-db-instance \\
//   --db-instance-identifier my-single-az-db \\
//   --db-instance-class db.t3.medium \\
//   --engine postgres \\
//   --master-username admin \\
//   --master-user-password mypassword \\
//   --allocated-storage 20 \\
//   --availability-zone us-east-1a # Solo se especifica una AZ
//
// // En CloudFormation:
// Resources:
//   MySingleAZRDSInstance:
//     Type: AWS::RDS::DBInstance
//     Properties:
//       DBInstanceIdentifier: my-single-az-db
//       DBInstanceClass: db.t3.medium
//       Engine: postgres
//       MasterUsername: admin
//       MasterUserPassword: mypassword
//       AllocatedStorage: 20
//       # MultiAZ: false (o simplemente omitido)
//       AvailabilityZone: us-east-1a # Explicitamente en una sola AZ
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Arquitectura Avanzada',
    'topic': 'High Availability',
    'subtopic': 'Blue/Green deployments',
    'definition': '''
Los despliegues Blue/Green son una técnica de despliegue que nos permite actualizar aplicaciones con cero tiempo de inactividad y un riesgo mínimo. La idea principal es tener dos entornos de producción idénticos, a los que llamamos "Blue" y "Green".

¿De qué manera esto nos ayuda a dormir más tranquilos por la noche?

Aquí te va la aclaración: Pensemos que tu versión actual de la aplicación está corriendo en el entorno "Blue". Cuando tienes una nueva versión (la "Green"), en lugar de actualizar directamente el entorno "Blue", provisionas un nuevo entorno "Green" con la nueva versión de tu aplicación. Este entorno "Green" es idéntico al "Blue" en infraestructura, pero con el nuevo código. Una vez que el entorno "Green" está completamente probado y listo, simplemente rediriges todo el tráfico de los usuarios del entorno "Blue" al "Green". Esto se hace típicamente cambiando la configuración de un balanceador de carga o de un DNS.

La gran ventaja de esto es que, si algo sale mal con la nueva versión en "Green" después de que el tráfico ha sido redirigido, puedes revertir la situación de manera instantánea y con un solo clic. Simplemente rediriges el tráfico de vuelta al entorno "Blue" original, que sigue ejecutándose con la versión anterior y conocida como estable. Esto reduce drásticamente el riesgo asociado a los despliegues y te da un "botón de pánico" muy efectivo. Además, el entorno "Blue" (la versión anterior) puede mantenerse como respaldo en caso de emergencia, o puede ser dado de baja para ahorrar costos una vez que la versión "Green" demuestre ser estable. Servicios de AWS como Elastic Beanstalk, Amazon ECS/EKS con un Application Load Balancer, o incluso AWS CodeDeploy facilitan la implementación de este patrón, convirtiéndolo en una estrategia de despliegue muy popular y robusta para garantizar la alta disponibilidad y la continuidad del servicio.
''',
    'code_example': '''
// Los despliegues Blue/Green son una estrategia de despliegue, no código de aplicación.
// Se implementan a través de la configuración de infraestructura y herramientas CI/CD.
// Un ejemplo conceptual de cómo AWS CodeDeploy facilita esto.

// CORRECTO: Configuración de AWS CodeDeploy para un despliegue Blue/Green
// // Ejemplo de una configuración de despliegue en CodeDeploy para un entorno Blue/Green
// // Esto se define en un AppSpec file o a través de la consola de CodeDeploy.
// version: 0.0
// os: linux
// hooks:
//   BeforeInstall:
//     - location: scripts/install_dependencies.sh
//       timeout: 300
//       runas: root
//   AfterInstall:
//     - location: scripts/start_application.sh
//       timeout: 300
//       runas: root
//   ApplicationStart:
//     - location: scripts/validate_service.sh
//       timeout: 300
//       runas: root
// # Traffic shifting (el corazón del Blue/Green con CodeDeploy)
// # Esto moverá el tráfico del "ambiente original" (Blue) al "ambiente de reemplazo" (Green)
// # Después de la validación, o rollback si la validación falla.
// # El ALB se encarga de la redirección.
//   AfterAllowTraffic:
//     - location: scripts/run_post_deployment_tests.sh
//       timeout: 600
//       runas: root
//   BeforeAllowTraffic:
//     - location: scripts/run_pre_traffic_tests.sh
//       timeout: 600
//       runas: root
//
// INCORRECTO: Despliegue in-place (riesgo de tiempo de inactividad y rollback complejo)
// // Actualizar directamente las instancias existentes con el nuevo código,
// // sin un entorno de respaldo. Esto implica tiempo de inactividad mientras
// // se actualizan las instancias y un rollback manual y complejo si algo falla.
// //
// // Esto no es un "código incorrecto", sino una estrategia de despliegue con
// // mayores riesgos que Blue/Green.
// //
// // Pasos típicos de un despliegue in-place:
// // 1. Detener el servicio en la instancia.
// // 2. Desplegar el nuevo código.
// // 3. Instalar dependencias si es necesario.
// // 4. Iniciar el servicio.
// // 5. Repetir para cada instancia.
// // Durante este proceso, la aplicación puede estar no disponible o inestable.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Arquitectura Avanzada',
    'topic': 'High Availability',
    'subtopic': 'Canary deployments',
    'definition': '''
Los despliegues Canary son una estrategia de lanzamiento de software que nos permite introducir nuevas versiones de una aplicación a un pequeño subconjunto de usuarios o tráfico antes de implementarla por completo. Imagina que es como enviar a un "canario a la mina" para ver si hay algún peligro antes de que entre todo el equipo.

¿Cómo se diferencia esto de un despliegue Blue/Green y por qué es útil?

Aquí te va la aclaración: A diferencia del Blue/Green, donde cambias todo el tráfico de golpe, el Canary deployment es gradual. Pensemos que tu aplicación actual está recibiendo el 100% del tráfico. Cuando tienes una nueva versión, solo envías un pequeño porcentaje (por ejemplo, 5% o 10%) de tu tráfico a la nueva versión. El resto del tráfico sigue yendo a la versión estable anterior. Durante este período, monitoreas de cerca la nueva versión para detectar cualquier error, regresión de rendimiento o comportamiento inesperado. Si todo va bien, aumentas gradualmente el porcentaje de tráfico hacia la nueva versión (por ejemplo, a 25%, luego 50%, y así sucesivamente) hasta que el 100% del tráfico esté en la nueva versión. Si detectas un problema en cualquier punto, puedes revertir fácilmente el tráfico a la versión antigua para evitar un impacto masivo en todos tus usuarios.

Este método es excelente para reducir el riesgo en despliegues, especialmente en aplicaciones de gran escala con millones de usuarios o donde los errores pueden ser costosos. Te permite probar tu nueva versión en un entorno de producción real, con tráfico real, pero con un impacto limitado en caso de fallos. Servicios de AWS como Amazon Route 53 (con políticas de enrutamiento basadas en ponderación), Application Load Balancers con grupos de destino ponderados, y herramientas como AWS CodeDeploy (específicamente para Lambda o EC2/ECS) soportan patrones de despliegue Canary. Es una forma de ser cauteloso, probar las aguas y asegurarte de que tu nueva característica o mejora no causará un terremoto digital para tus usuarios.
''',
    'code_example': '''
// Los despliegues Canary se implementan configurando cómo se enruta el tráfico.
// Un ejemplo conceptual de cómo se podría configurar un enrutamiento Canary usando un ALB.

// CORRECTO: Configuración de un Application Load Balancer (ALB) con grupos de destino ponderados para Canary.
// Esto permite enviar un porcentaje del tráfico a la nueva versión.
// // Configuración de un Listener Rule en un ALB para distribuir tráfico a dos Target Groups (versiones)
// // Version Estable (Old) en Target Group A, Nueva Version (Canary) en Target Group B.
// Resources:
//   MyALBListenerRule:
//     Type: AWS::ElasticLoadBalancingV2::ListenerRule
//     Properties:
//       ListenerArn: arn:aws:elasticloadbalancing:us-east-1:123456789012:listener/app/my-alb/listener-id
//       Priority: 10
//       Actions:
//         - Type: forward
//           ForwardConfig:
//             TargetGroups:
//               - TargetGroupArn: arn:aws:elasticloadbalancing:us-east-1:123456789012:targetgroup/tg-old/1234567890ab # Versión estable
//                 Weight: 90 # 90% del tráfico
//               - TargetGroupArn: arn:aws:elasticloadbalancing:us-east-1:123456789012:targetgroup/tg-new/fedcba98765432 # Nueva versión (Canary)
//                 Weight: 10 # 10% del tráfico inicial para el Canary
//
// INCORRECTO: Despliegue completo sin fases (riesgo alto si hay errores)
// // Desplegar la nueva versión directamente a todo el entorno de producción,
// // sin una fase de prueba gradual o "canary".
// //
// // Esto significa que el 100% de los usuarios o el tráfico se ven afectados
// // inmediatamente si hay un problema con la nueva versión.
// //
// // Ejemplo conceptual:
// // Se actualiza la configuración de un balanceador de carga para apuntar 100%
// // a un nuevo grupo de instancias sin una fase gradual.
// //
// // Resources:
// //   MyALBListenerRule:
// //     Type: AWS::ElasticLoadBalancingV2::ListenerRule
// //     Properties:
// //       ListenerArn: ...
// //       Priority: 10
// //       Actions:
// //         - Type: forward
// //           ForwardConfig:
// //             TargetGroups:
// //               - TargetGroupArn: arn:aws:elasticloadbalancing:us-east-1:123456789012:targetgroup/tg-new/fedcba98765432
// //                 Weight: 100 # Todo el tráfico a la nueva versión de golpe
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Arquitectura Avanzada',
    'topic': 'Escalabilidad',
    'subtopic': 'Horizontal vs vertical scaling',
    'definition': '''
Cuando hablamos de escalabilidad en la nube, nos referimos a la capacidad de un sistema para manejar un aumento en la carga de trabajo. Básicamente, es cómo tu aplicación puede crecer para atender a más usuarios o procesar más datos sin morir en el intento. Hay dos enfoques principales para esto: el escalado horizontal y el escalado vertical.

¿Cuál de estos dos enfoques es el más conveniente para tu aplicación?

Aquí te va la aclaración: Pensemos en el **escalado vertical** (también conocido como "scale up"). Esto es como mejorar un solo componente de tu sistema para hacerlo más potente. Imagina que tienes un servidor y está recibiendo mucho tráfico; escalarlo verticalmente significaría darle más CPU, más memoria RAM o un disco duro más grande. Es una forma sencilla de aumentar la capacidad, pero tiene un límite: eventualmente, no podrás añadir más recursos a un solo servidor (o la tecnología simplemente no lo permite). Además, si ese único servidor falla, tu aplicación se cae por completo. Es más fácil de gestionar al principio, pero menos resistente a fallos y con un techo de crecimiento.

Por otro lado, el **escalado horizontal** (también conocido como "scale out") es como añadir más servidores o componentes idénticos a tu sistema. En lugar de hacer un solo servidor más potente, añades más servidores más pequeños que trabajan en conjunto. Siguiendo la analogía del tráfico, si un servidor está muy ocupado, simplemente añades otro servidor igual para compartir la carga. La nube es ideal para esto, ya que puedes provisionar y desaprovisionar recursos rápidamente. Esto no solo te da una capacidad casi ilimitada (puedes seguir añadiendo servidores), sino que también mejora la resiliencia: si un servidor falla, los demás siguen funcionando y la aplicación sigue disponible. Es más complejo de implementar al principio porque requiere que tu aplicación sea "sin estado" (stateless) o que la gestión del estado sea externa, para que cualquier solicitud pueda ser atendida por cualquier servidor disponible. Sin embargo, para aplicaciones web modernas y distribuidas, el escalado horizontal es casi siempre la opción preferida por su flexibilidad, resistencia y eficiencia en costos.
''',
    'code_example': r'''
// Ejemplos conceptuales de cómo el escalado se implementa en AWS.

// CORRECTO: Escalado Horizontal con Auto Scaling Group (ASG) y Load Balancer (ALB)
// Esto permite que las instancias se añadan o eliminen automáticamente según la demanda.
// // Definición de un Auto Scaling Group que escala según la CPU promedio
// Resources:
//   MyAutoScalingGroup:
//     Type: AWS::AutoScaling::AutoScalingGroup
//     Properties:
//       AutoScalingGroupName: MyWebAppASG
//       LaunchTemplate:
//         LaunchTemplateId: !Ref MyLaunchTemplate
//         Version: "$Latest"
//       MinSize: '2' # Mínimo de 2 instancias para empezar con redundancia
//       MaxSize: '10' # Máximo de 10 instancias
//       DesiredCapacity: '2'
//       VPCZoneIdentifier:
//         - subnet-aaaaa
//         - subnet-bbbbb
//       TargetGroupARNs:
//         - !Ref MyALBTargetGroup
//
//   CPUScalingPolicy:
//     Type: AWS::AutoScaling::ScalingPolicy
//     Properties:
//       PolicyType: TargetTrackingScaling
//       AutoScalingGroupName: !Ref MyAutoScalingGroup
//       TargetTrackingConfiguration:
//         PredefinedMetricSpecification:
//           PredefinedMetricType: ASGAverageCPUUtilization
//         TargetValue: 60.0 # Escalar si la CPU promedio excede el 60%
//
// INCORRECTO: Simulación de Escalado Vertical Manual en AWS (Limitado y con Downtime)
// Esto no es un patrón ideal en la nube para el crecimiento continuo.
// // Si una instancia EC2 se queda sin recursos, el escalado vertical implicaría
// // detenerla, cambiar el tipo de instancia a una más grande y luego iniciarla.
// // Esto genera tiempo de inactividad (downtime).
//
// // Comando AWS CLI para detener y cambiar el tipo de instancia (conceptual)
// // aws ec2 stop-instances --instance-ids i-0abcdef1234567890
// // aws ec2 modify-instance-attribute --instance-id i-0abcdef1234567890 --instance-type '{"Value": "m5.large"}'
// // aws ec2 start-instances --instance-ids i-0abcdef1234567890
//
// // Este proceso es manual, tiene tiempo de inactividad y un límite inherente.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Arquitectura Avanzada',
    'topic': 'Escalabilidad',
    'subtopic': 'Serverless architectures',
    'definition': '''
Las arquitecturas serverless, o "sin servidor", son un modelo de computación en la nube donde AWS (o cualquier proveedor de nube) gestiona por completo la infraestructura subyacente. Esto significa que tú te olvidas de aprovisionar servidores, gestionar parches, escalar la capacidad o preocuparte por la infraestructura. Solo escribes tu código y lo despliegas.

¿En qué se traduce esto en beneficios reales para el desarrollo de aplicaciones?

Aquí te va la aclaración: Piensa que, en lugar de preocuparte por un servidor que siempre esté encendido esperando peticiones, con serverless tu código se ejecuta solo cuando es necesario, en respuesta a un evento. El servicio más conocido en AWS para esto es AWS Lambda, que te permite ejecutar código sin aprovisionar ni administrar servidores. Cuando una función Lambda es invocada (por ejemplo, por una petición HTTP, una subida de un archivo a S3, o un mensaje en una cola), AWS la ejecuta, le asigna los recursos necesarios, y tú solo pagas por el tiempo de computación real que se consume. Si tu función no se usa, no pagas nada.

La escalabilidad es casi automática con serverless. Si de repente tienes un pico de tráfico, AWS escala tu función Lambda automáticamente para manejar miles de ejecuciones concurrentes sin que tú hagas nada. Esto es un cambio de paradigma brutal: pasas de gestionar infraestructura a centrarte únicamente en la lógica de negocio de tu aplicación. Además de Lambda, hay otros servicios serverless en AWS como Amazon S3 (almacenamiento de objetos), Amazon DynamoDB (base de datos NoSQL), Amazon API Gateway (para crear APIs), y Amazon EventBridge (para routing de eventos). Al combinar estos servicios, puedes construir aplicaciones complejas que son altamente escalables, disponibles, y con un costo muy optimizado, ya que solo pagas por el uso real. Es una forma de innovar más rápido, ya que el equipo de desarrollo no se distrae con las complejidades de la infraestructura.
''',
    'code_example': r'''
// Ejemplo de una función AWS Lambda (Node.js) que simula el procesamiento de un pedido.
// Las arquitecturas Serverless se centran en el código de la función y la configuración de eventos.

// CORRECTO: Función Lambda simple con un handler
// // index.js (código de la función Lambda)
// exports.handler = async (event) => {
//   console.log('Evento recibido:', JSON.stringify(event, null, 2));
//
//   // Simular procesamiento de un pedido
//   const orderId = event.detail.orderId;
//   const customerId = event.detail.customerId;
//
//   console.log(`Procesando pedido ${orderId} para el cliente ${customerId}...`);
//
//   // Aquí iría la lógica real de negocio, como guardar en una base de datos
//   // o llamar a otro servicio.
//
//   const response = {
//     statusCode: 200,
//     body: JSON.stringify(`Pedido ${orderId} procesado exitosamente.`),
//   };
//   return response;
// };
//
// // Configuración conceptual de un Trigger (ej. EventBridge rule)
// // Esto se haría en la consola de Lambda o con CloudFormation/Terraform.
// // Cuando un evento específico ocurre (ej. "newOrder" en EventBridge),
// // esta función Lambda se invoca automáticamente.
//
// INCORRECTO: Aprovisionar y gestionar manualmente un servidor para una tarea esporádica
// // Lanzar una instancia EC2 solo para ejecutar un script que procesa un pedido
// // una vez al día. Esto resulta en pagar por un servidor que está inactivo la
// // mayor parte del tiempo, lo cual es ineficiente en costos y gestión.
//
// // Aunque no es "código incorrecto", es una mala práctica para un caso de uso serverless.
// // Piense en los costos de mantener un EC2 24/7 vs. pagar solo por milisegundos de Lambda.
// //
// // aws ec2 run-instances \\
// //   --image-id ami-0abcdef1234567890 \\
// //   --count 1 \\
// //   --instance-type t2.micro \\
// //   --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=OrderProcessorServer}]'
// //
// // Luego, SSH al servidor, ejecutar el script, y asegurarse de que esté siempre disponible.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Arquitectura Avanzada',
    'topic': 'Escalabilidad',
    'subtopic': 'Event-driven architectures',
    'definition': '''
Las arquitecturas orientadas a eventos (Event-driven architectures - EDA) son un paradigma de diseño donde la comunicación entre los componentes de un sistema se basa en la producción, detección y consumo de eventos. En lugar de que los componentes se llamen directamente unos a otros, emiten "eventos" que describen lo que ha sucedido, y otros componentes interesados reaccionan a esos eventos.

¿Cuál es la ventaja de este enfoque frente a los sistemas tradicionales?

Aquí te va la aclaración: Pensemos en un sistema de comercio electrónico. En una arquitectura tradicional, cuando un cliente hace un pedido, el servicio de pedidos podría llamar directamente al servicio de inventario, al servicio de pagos, y al servicio de envío. Si uno de esos servicios falla, todo el proceso de pedido podría detenerse. En una EDA, el servicio de pedidos simplemente emite un evento como "PedidoCreado". Este evento es enviado a un bus de eventos (como Amazon EventBridge o Apache Kafka en AWS), y otros servicios (inventario, pagos, envío) que están interesados en el evento "PedidoCreado" lo escuchan y actúan sobre él de forma independiente. Si el servicio de envío está temporalmente inactivo, el pedido aún se crea y el pago se procesa; el envío se intentará una vez que el servicio de envío vuelva a estar en línea o el evento sea reintentado.

Esto introduce un fuerte **desacoplamiento** entre los componentes, lo que significa que pueden evolucionar, escalar y fallar de forma independiente, sin afectar a todo el sistema. Esta es una de las grandes claves para la escalabilidad y la resiliencia. Además, facilita la adición de nuevas funcionalidades: si quieres añadir un servicio de notificaciones por email cuando se crea un pedido, simplemente lo conectas al bus de eventos para que reaccione al evento "PedidoCreado", sin modificar el servicio de pedidos original. AWS ofrece servicios como Amazon EventBridge, Amazon SQS (Simple Queue Service), Amazon SNS (Simple Notification Service) y AWS Lambda que son fundamentales para construir arquitecturas orientadas a eventos. Esta flexibilidad y capacidad de evolución son cruciales para sistemas modernos que necesitan adaptarse rápidamente a los cambios y demandas.
''',
    'code_example': r'''
// Ejemplo conceptual de una arquitectura basada en eventos usando Amazon EventBridge y Lambda.
// Un servicio publica un evento, y otro lo consume.

// CORRECTO: Publicar y Consumir un Evento con EventBridge y Lambda
// // Código de un productor de eventos (ej. un servicio de pedidos)
// const AWS = require('aws-sdk');
// const eventbridge = new AWS.EventBridge({region: 'us-east-1'});
//
// async function publishOrderCreatedEvent(orderData) {
//   const params = {
//     Entries: [
//       {
//         Source: 'com.mycompany.orders', // Fuente del evento
//         DetailType: 'OrderCreated',    // Tipo de detalle del evento
//         Detail: JSON.stringify(orderData), // Contenido del evento
//         EventBusName: 'default',       // Bus de eventos (puedes usar uno personalizado)
//       },
//     ],
//   };
//   try {
//     await eventbridge.putEvents(params).promise();
//     console.log('Evento "OrderCreated" publicado en EventBridge.');
//   } catch (err) {
//     console.error('Error al publicar evento:', err);
//   }
// }
//
// // Ejemplo de uso:
// // publishOrderCreatedEvent({ orderId: 'ABC-123', customerId: 'CUS-456', amount: 99.99 });
//
// // Código de un consumidor de eventos (ej. una función Lambda de notificaciones)
// // (Este es el handler de la función Lambda que EventBridge invoca)
// exports.handler = async (event) => {
//   console.log('Evento de EventBridge recibido por la función de notificaciones:', JSON.stringify(event, null, 2));
//   const order = JSON.parse(event.detail);
//   console.log(`Enviando notificación para el pedido ${order.orderId} al cliente ${order.customerId}.`);
//   // Lógica para enviar un email, SMS, etc.
//   return 'Notificación procesada.';
// };
//
// INCORRECTO: Acoplamiento fuerte entre servicios (llamadas directas)
// // Un servicio de pedidos haciendo llamadas HTTP directas y síncronas a otros servicios.
// // Si el servicio de notificaciones falla, podría afectar el proceso de pedido.
// async function createOrderWithDirectCalls(orderData) {
//   try {
//     // Llama directamente al servicio de inventario
//     // await fetch('http://inventory-service.com/deduct-stock', { method: 'POST', body: JSON.stringify(orderData) });
//     // Llama directamente al servicio de pagos
//     // await fetch('http://payment-service.com/process-payment', { method: 'POST', body: JSON.stringify(orderData) });
//     // Llama directamente al servicio de notificaciones
//     // await fetch('http://notification-service.com/send-email', { method: 'POST', body: JSON.stringify(orderData) });
//
//     console.log('Pedido creado y todos los servicios llamados directamente.');
//   } catch (err) {
//     console.error('Fallo en el proceso de pedido debido a un servicio acoplado:', err);
//   }
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Arquitectura Avanzada',
    'topic': 'Escalabilidad',
    'subtopic': 'Caching strategies',
    'definition': '''
Las estrategias de caching son esenciales para mejorar el rendimiento de tus aplicaciones y reducir la carga sobre tus bases de datos o servicios de backend. Básicamente, el caching implica almacenar copias de datos a los que se accede con frecuencia en una ubicación de acceso rápido, para que futuras solicitudes de esos mismos datos puedan ser atendidas más rápidamente sin tener que ir a la fuente original.

¿De qué manera esto nos ayuda a que nuestras aplicaciones se sientan más rápidas?

Aquí te va la aclaración: Pensemos en una página web popular que muestra los productos más vendidos. Sin caching, cada vez que un usuario visita esa página, la aplicación tendría que consultar la base de datos para obtener esa lista de productos. Si tienes millones de usuarios, esto generaría una carga enorme en tu base de datos y haría que la página cargue lentamente. Con caching, la primera vez que se consulta la lista, se guarda una copia en una caché (como Amazon ElastiCache, que soporta Redis y Memcached). Las siguientes veces, la aplicación verifica primero la caché; si los datos están allí, los devuelve al instante, sin tocar la base de datos. Esto reduce la latencia, mejora el tiempo de respuesta y disminuye la carga en los sistemas de backend.

Existen diferentes estrategias de caching, como el **Cache-Aside**, donde la aplicación es responsable de comprobar si los datos están en la caché antes de ir a la base de datos y de actualizar la caché cuando los datos cambian. Otra es el **Write-Through**, donde los datos se escriben simultáneamente en la caché y en la base de datos. La elección de la estrategia depende del tipo de datos, la frecuencia de actualización y los requisitos de consistencia. Por ejemplo, para datos que no cambian mucho, puedes usar un TTL (Time To Live) largo, lo que significa que los datos permanecen en caché por más tiempo. Para datos muy dinámicos, el TTL será corto o incluso se invalidará la caché activamente cuando los datos cambien. Implementar una buena estrategia de caching es un pilar fundamental para la escalabilidad y el rendimiento en la nube.
''',
    'code_example': r'''
// Ejemplo conceptual de estrategia Cache-Aside usando Redis (con ElastiCache).
// La aplicación intenta leer de la caché primero, y si no está, lee de la DB y la actualiza.

// CORRECTO: Implementación de Cache-Aside (Lectura)
// // Asume que 'redisClient' está configurado para conectarse a tu instancia ElastiCache Redis
// // Asume que 'dbClient' está configurado para conectar a tu base de datos (ej. DynamoDB, RDS)
//
// async function getProductById(productId) {
//   // 1. Intentar obtener el producto de la caché
//   let product = await redisClient.get(`product:${productId}`);
//
//   if (product) {
//     console.log('Producto encontrado en caché.');
//     return JSON.parse(product);
//   }
//
//   // 2. Si no está en caché, obtener de la base de datos
//   console.log('Producto no encontrado en caché, obteniendo de la base de datos...');
//   product = await dbClient.query(`SELECT * FROM Products WHERE id = '${productId}'`);
//
//   if (product) {
//     // 3. Almacenar el producto en caché para futuras solicitudes (con un TTL, ej. 1 hora)
//     await redisClient.setEx(`product:${productId}`, 3600, JSON.stringify(product));
//     console.log('Producto almacenado en caché.');
//     return product;
//   }
//
//   return null; // Producto no encontrado en ninguna parte
// }
//
// INCORRECTO: No usar caché o ignorar la caché (consultas directas a la DB en cada petición)
// // Obtener el producto directamente de la base de datos en cada solicitud,
// // incluso si los datos son accedidos con frecuencia y no cambian a menudo.
// // Esto genera una carga innecesaria en la DB y mayor latencia.
//
// async function getProductByIdWithoutCache(productId) {
//   console.log('Obteniendo producto directamente de la base de datos (sin caché)...');
//   const product = await dbClient.query(`SELECT * FROM Products WHERE id = '${productId}'`);
//   return product;
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Arquitectura Avanzada',
    'topic': 'Disaster Recovery',
    'subtopic': 'Estrategias de DR',
    'definition': '''
Las estrategias de Disaster Recovery (DR), o recuperación ante desastres, son planes y procesos que implementamos para asegurar que nuestras aplicaciones y datos sigan disponibles y operativos después de un evento catastrófico, como un desastre natural, un fallo de infraestructura a gran escala, o un ciberataque importante. No se trata de "si" ocurrirá un desastre, sino de "cuándo".

¿Por qué es crucial tener una estrategia sólida de DR?

Aquí te va la aclaración: Pensemos en un banco online. Si sus sistemas principales se caen debido a un desastre, la gente no podría acceder a su dinero, realizar transacciones, o incluso pagar facturas. El impacto económico y de reputación sería enorme. Las estrategias de DR buscan minimizar el *RTO* (Recovery Time Objective), que es el tiempo máximo que una aplicación puede estar inactiva después de un desastre, y el *RPO* (Recovery Point Objective), que es la cantidad máxima de datos que se pueden perder. No es solo recuperar la aplicación, sino también los datos.

Existen varias estrategias de DR, cada una con diferentes compensaciones entre costo y tiempo de recuperación:

* **Backup y Restore:** Esta es la estrategia más económica y con un RPO y RTO más altos. Consiste en hacer copias de seguridad regulares de tus datos y aplicaciones, y restaurarlas en una nueva ubicación si ocurre un desastre. Es como tener una copia de seguridad en un disco duro externo y, si tu computadora se daña, compras una nueva y restauras desde allí.
* **Pilot Light:** Aquí, se mantienen los servicios esenciales en una región secundaria, funcionando con recursos mínimos (como un piloto de gas en un calentador de agua). Cuando ocurre un desastre, se "enciende" el resto de la infraestructura necesaria y se escala para manejar la carga completa. El RTO y RPO son mucho mejores que el backup y restore.
* **Warm Standby:** Una versión más avanzada del "pilot light". Mantienes una versión a escala reducida de tu entorno de producción en la región de recuperación. Ya tienes algunos servidores ejecutándose y replicando datos casi en tiempo real. Cuando ocurre un desastre, solo necesitas escalar los recursos restantes para alcanzar la capacidad total. RTO y RPO son aún mejores.
* **Multi-Site Active/Active (Hot Standby):** Esta es la estrategia más avanzada y costosa, pero con el RTO y RPO más bajos (casi cero). Implica tener tu aplicación funcionando en dos o más regiones activamente, procesando tráfico en ambas. Si una región falla, el tráfico se redirige automáticamente a la otra sin ninguna interrupción perceptible para el usuario. Empresas como Netflix utilizan patrones similares para asegurar una disponibilidad extrema.

La elección de la estrategia de DR adecuada depende de la criticidad de tu aplicación y de cuánto tiempo de inactividad o pérdida de datos puedes permitirte.
''',
    'code_example': r'''
// Las estrategias de DR son principalmente de diseño y configuración de infraestructura.
// No hay un "código de DR" universal, pero los servicios de AWS lo facilitan.

// CORRECTO: Utilizando AWS Backup para implementar una estrategia de Backup y Restore.
// Esto es esencial para el RPO/RTO en el nivel más básico.
// // Configuración conceptual de un plan de backup con AWS Backup
// // Esto se haría a través de la consola de AWS Backup o CloudFormation.
// Resources:
//   MyBackupPlan:
//     Type: AWS::Backup::BackupPlan
//     Properties:
//       BackupPlan:
//         BackupPlanName: DailyDBBackupPlan
//         BackupPlanRule:
//           - RuleName: DailyRule
//             TargetBackupVault: MyBackupVault
//             ScheduleExpression: cron(0 12 * * ? *) # Cada día a las 12 PM UTC
//             StartWindowMinutes: 60
//             CompletionWindowMinutes: 120
//             Lifecycle:
//               DeleteAfterDays: 7 # Retener por 7 días
//       BackupPlanTags:
//         - Key: Environment
//           Value: Production
//   MyBackupSelection:
//     Type: AWS::Backup::BackupSelection
//     Properties:
//       BackupPlanId: !Ref MyBackupPlan
//       BackupSelection:
//         SelectionName: MyRDSSelection
//         IamRoleArn: !GetAtt BackupServiceRole.Arn
//         Resources:
//           - ResourceType: "RDS" # Seleccionar todas las bases de datos RDS
//             Conditions:
//               StringEquals:
//                 - ConditionKey: "aws:resourcetag/Environment"
//                   ConditionValue: "Production"
//
// INCORRECTO: No tener ninguna estrategia de DR
// No hay código para esto, ya que la ausencia de un plan es el problema.
// Esto significa que en caso de un desastre, no hay un plan definido para recuperar
// las operaciones, lo que resulta en un tiempo de inactividad prolongado y posible
// pérdida de datos irrecuperable.
//
// Un ejemplo conceptual de un escenario sin DR:
// - Tus bases de datos no tienen backups automáticos.
// - Tus servidores están en una única región/AZ sin réplicas.
// - No hay un plan para recrear el entorno desde cero en caso de fallo.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Arquitectura Avanzada',
    'topic': 'Disaster Recovery',
    'subtopic': 'Backup y restore',
    'definition': '''
La estrategia de "Backup y Restore" es la base de cualquier plan de recuperación ante desastres. Es la forma más fundamental de proteger tus datos y asegurar que, en caso de un evento inesperado, puedas recuperar tu información y restaurar el funcionamiento de tus sistemas.

¿Te estás preguntando cómo funciona esto en la práctica?

Aquí te va la aclaración: Pensemos que tienes una aplicación web que guarda datos de clientes en una base de datos. Con una estrategia de backup y restore, lo que haces es tomar copias periódicas de esa base de datos (y de cualquier otro dato crítico de tu aplicación, como archivos, configuraciones, etc.) y almacenarlas de forma segura, preferiblemente en una ubicación diferente a la original. En AWS, puedes usar servicios como AWS Backup para automatizar las copias de seguridad de tus bases de datos (RDS, DynamoDB), volúmenes EC2, archivos en EFS, etc., y almacenarlas en bóvedas de backup. También puedes copiar esos backups a otra región de AWS para mayor resiliencia.

Cuando ocurre un desastre (por ejemplo, tu base de datos principal se corrompe o la región donde está alojada tiene un problema), entras en la fase de "restore". Esto implica tomar la última copia de seguridad válida y usarla para recrear tus datos y/o tu infraestructura en una nueva ubicación o en un nuevo recurso. El *RPO* (Recovery Point Objective) es el tiempo entre tu último backup y el momento del desastre, lo que indica cuántos datos podrías perder. Si haces backups cada 24 horas, podrías perder hasta un día de datos. El *RTO* (Recovery Time Objective) es el tiempo que te lleva restaurar los datos y poner la aplicación en funcionamiento. Con esta estrategia, el RPO y el RTO suelen ser los más altos de todas las estrategias de DR, lo que significa que puedes tener más pérdida de datos y más tiempo de inactividad. Sin embargo, es la opción más sencilla y económica de implementar, y es fundamental incluso para aplicaciones que usan estrategias de DR más avanzadas, ya que los backups siempre son un último recurso invaluable.
''',
    'code_example': r'''
// Ejemplos de cómo se configura el backup y el restore en AWS.

// CORRECTO: Configuración de backups automáticos para una base de datos RDS.
// // Esto se configura al crear o modificar una instancia RDS en la consola o CLI.
// // ElastiCache Redis y Memcached también tienen opciones de backup.
// aws rds modify-db-instance \\
//   --db-instance-identifier my-db-instance \\
//   --backup-retention-period 7 \\ # Guardar backups por 7 días
//   --preferred-backup-window "03:00-04:00" \\ # Ventana de backup diaria
//   --apply-immediately
//
// // Para EBS volumes, puedes crear snapshots:
// aws ec2 create-snapshot --volume-id vol-0abcdef1234567890 --description "Daily backup of root volume"
//
// // Para S3, puedes configurar versioning y S3 Replication:
// {
//   "VersioningConfiguration": {
//     "Status": "Enabled"
//   }
// }
// {
//   "ReplicationConfiguration": {
//     "Role": "arn:aws:iam::123456789012:role/s3-replication-role",
//     "Rules": [
//       {
//         "ID": "MyReplicationRule",
//         "Status": "Enabled",
//         "Destination": {
//           "Bucket": "arn:aws:s3:::my-backup-bucket-in-another-region"
//         },
//         "SourceSelectionCriteria": {
//           "ReplicaModifications": {
//             "Status": "Enabled"
//           }
//         }
//       }
//     ]
//   }
// }
//
// INCORRECTO: No realizar backups o confiar solo en la infraestructura activa.
// // No hay código para no hacer backups. La ausencia de configuración de backup
// // es la incorrecta. Esto deja tus datos vulnerables a la pérdida permanente.
// //
// // Un ejemplo de la vida real sería:
// // - Configurar una base de datos RDS sin especificar un "backup retention period".
// // - No tomar snapshots de tus volúmenes EBS.
// // - No habilitar el versionado en tus buckets S3 para proteger contra eliminaciones accidentales.
// //
// // Este enfoque conlleva un RPO y RTO infinitos, ya que no hay forma de recuperar.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Arquitectura Avanzada',
    'topic': 'Disaster Recovery',
    'subtopic': 'Pilot light',
    'definition': r'''
La estrategia de "Pilot Light" es un enfoque de recuperación ante desastres que se encuentra en un punto medio entre el simple "backup y restore" y las opciones más complejas y costosas como "warm standby" o "multi-site active/active". Su nombre viene de la llama piloto de un calentador de agua, que está siempre encendida pero consume muy poca energía, lista para encender el quemador principal cuando se necesita.

¿De qué manera esta estrategia nos ayuda a reducir el tiempo de recuperación sin romper el banco?

Aquí te va la aclaración: En la estrategia Pilot Light, mantienes una versión mínima de tu entorno de producción en una región de recuperación, pero con recursos muy limitados. Esto significa que los componentes clave de tu aplicación, especialmente aquellos que tardan más en encenderse o restaurarse (como una base de datos), ya están corriendo y replicando datos desde tu región principal. Otros componentes, como las instancias de aplicación, pueden estar apagados o en forma de AMIs (Amazon Machine Images) listas para ser lanzadas rápidamente. La idea es que los datos y las configuraciones críticas ya estén replicados y disponibles en la región de DR.

Cuando ocurre un desastre en la región principal, el plan de DR implica dos pasos principales: primero, enciendes y escalas los recursos de aplicación que estaban inactivos en la región de recuperación. Luego, rediriges el tráfico de los usuarios a este nuevo entorno. El *RPO* (Recovery Point Objective) es bajo porque los datos se replican continuamente. El *RTO* (Recovery Time Objective) es significativamente más bajo que el de "backup y restore" porque la infraestructura base ya está provisionada y los datos están listos; solo necesitas encender los servidores de aplicación y redirigir el tráfico. Esto hace que el Pilot Light sea una excelente opción para aplicaciones que no requieren una disponibilidad casi instantánea, pero donde cada minuto de inactividad cuenta, ofreciendo un buen equilibrio entre costo y rendimiento de DR.
''',
    'code_example': '''
// Ejemplo conceptual de cómo configurar una estrategia Pilot Light en AWS.
// Se centra en replicar la base de datos y tener AMIs listas para los servidores de aplicación.

// CORRECTO: Configuración de RDS Cross-Region Replication y AMIs para EC2.
// // Paso 1: Replicación de la base de datos a la región de DR (bajo RPO)
// // Esto se haría creando una réplica de lectura de RDS en otra región.
// aws rds create-db-cluster-read-replica \\
//   --db-cluster-identifier my-source-db-cluster \\
//   --db-cluster-read-replica-identifier my-dr-replica \\
//   --source-region us-east-1 \\
//   --destination-region us-west-2 \\
//   --copy-tags-to-snapshot
//
// // Paso 2: Crear AMIs de tus servidores de aplicación para lanzamiento rápido (bajo RTO)
// // Las AMIs se pueden copiar a la región de DR.
// aws ec2 create-image \\
//   --instance-id i-0abcdef1234567890 \\
//   --name "MyWebAppAMI-Daily" \\
//   --description "Daily AMI for DR"
// aws ec2 copy-image \\
//   --source-image-id ami-xxxxxxxxxxxxxxxxx \\
//   --source-region us-east-1 \\
//   --destination-region us-west-2 \\
//   --name "MyWebAppAMI-DR"
//
// // Paso 3 (durante el desastre): Lanzar instancias desde la AMI en la región de DR
// // aws ec2 run-instances --image-id ami-dr-id --count 3 --instance-type t3.medium ...
// // Paso 4 (durante el desastre): Redirigir el DNS (Route 53)
// // aws route53 change-resource-record-sets --hosted-zone-id Z1PXXX --change-batch file://change-batch.json
//
// INCORRECTO: Reconstrucción manual completa del entorno de DR (alto RTO).
// // En lugar de tener una réplica de DB o AMIs listas, se requiere construir todo
// // desde cero en la región de DR. Esto implica tiempo y esfuerzo manual.
// //
// // Un ejemplo de la vida real sería:
// // - En caso de desastre, primero se descarga un backup de la DB de S3.
// // - Luego, se crea una nueva instancia de DB desde cero.
// // - Después, se restauran los datos en esa nueva DB.
// // - Posteriormente, se lanzan instancias EC2 con AMIs básicas y se instala
// //   todo el software de la aplicación manualmente.
// // - Finalmente, se configuran las redes y balanceadores de carga.
// // Este proceso es propenso a errores y lleva mucho tiempo.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Arquitectura Avanzada',
    'topic': 'Disaster Recovery',
    'subtopic': 'Warm standby',
    'definition': '''
La estrategia de "Warm Standby" es un paso más allá del "Pilot Light" en el espectro de la recuperación ante desastres, ofreciendo un RTO y RPO aún menores. Es como tener un motor auxiliar del coche ya encendido y a bajas revoluciones, listo para acelerar y tomar el control si el motor principal falla.

¿Qué lo hace una opción más rápida que Pilot Light, pero aún más rentable que un Active/Active?

Aquí te va la aclaración: En un entorno Warm Standby, mantienes una versión a escala reducida (o "warm") de tu entorno de producción en una región de recuperación secundaria. Esto significa que los recursos no solo están aprovisionados y los datos replicados, sino que una parte de tu aplicación ya está ejecutándose, aunque con una capacidad limitada para manejar la carga completa de producción. Por ejemplo, podrías tener un grupo de Auto Scaling configurado con un número mínimo de instancias funcionando, o bases de datos con réplicas de lectura que pueden ser promovidas rápidamente a instancias principales.

Cuando ocurre un desastre en tu región principal, el proceso de failover es más rápido que con Pilot Light. Como ya tienes parte de la infraestructura activa y el tráfico es mínimo o nulo hacia ella, solo necesitas escalar los recursos existentes en la región de DR para manejar la carga completa de producción y luego redirigir el tráfico. El *RPO* (Recovery Point Objective) es muy bajo porque los datos se replican de forma continua y casi en tiempo real. El *RTO* (Recovery Time Objective) también es muy bajo, ya que la mayor parte de la infraestructura ya está en funcionamiento y solo necesita ser escalada, no lanzada desde cero. Esto la convierte en una estrategia adecuada para aplicaciones críticas que requieren una recuperación rápida, pero donde un failover completamente instantáneo (como en Active/Active) no es estrictamente necesario o el costo de tener dos entornos de producción completos es demasiado alto. Es un excelente equilibrio entre costo, RPO y RTO.
''',
    'code_example': r'''
// Ejemplo conceptual de cómo configurar una estrategia Warm Standby en AWS.
// Implica tener recursos operativos a escala reducida y listos para escalar.

// CORRECTO: Configuración de un entorno Warm Standby con RDS Read Replicas y ASG con minSize > 0.
// // Paso 1: Replicación de la base de datos (con una réplica de lectura activa en la región de DR)
// // Esto permite que los datos estén al día y listos para promoción.
// aws rds create-db-instance-read-replica \\
//   --db-instance-identifier my-source-db \\
//   --db-instance-read-replica-identifier my-dr-replica \\
//   --source-region us-east-1 \\
//   --destination-region us-west-2 \\
//   --db-instance-class db.t3.medium # Misma clase o una ligeramente inferior
//
// // Paso 2: Grupo de Auto Scaling con un 'minSize' > 0 (instancias "warm")
// // Estas instancias están ejecutándose y listas para escalar.
// Resources:
//   MyDRAutoScalingGroup:
//     Type: AWS::AutoScaling::AutoScalingGroup
//     Properties:
//       AutoScalingGroupName: MyWebAppDR_ASG
//       LaunchTemplate:
//         LaunchTemplateId: !Ref MyLaunchTemplateDR
//         Version: "$Latest"
//       MinSize: '2' # Por ejemplo, 2 instancias siempre funcionando
//       MaxSize: '10'
//       DesiredCapacity: '2'
//       VPCZoneIdentifier:
//         - subnet-dr-a
//         - subnet-dr-b
//       TargetGroupARNs:
//         - !Ref MyDRALBTargetGroup # Asociado a un ALB en la región de DR
//
// // Paso 3 (durante el desastre): Aumentar el 'DesiredCapacity' y 'MaxSize'
// // aws autoscaling update-auto-scaling-group --auto-scaling-group-name MyWebAppDR_ASG --desired-capacity 8 --max-size 10
// // Paso 4 (durante el desastre): Redirigir el DNS (Route 53)
// // aws route53 change-resource-record-sets --hosted-zone-id Z1PXXX --change-batch file://change-batch-dr.json
//
// INCORRECTO: Confiar en backups obsoletos o en la configuración manual de la infraestructura en DR.
// // Un escenario donde el "warm standby" no está configurado correctamente sería:
// // - La réplica de lectura de RDS no está al día (sincronización lenta o pausada).
// // - El Auto Scaling Group en la región de DR tiene un 'minSize' de 0, lo que significa
// //   que no hay instancias corriendo y el "encendido" sería similar a un Pilot Light.
// // - Los scripts para escalar o redirigir el tráfico son manuales y propensos a errores.
// //
// // Esto aumentaría el RTO y el RPO, anulando los beneficios de un Warm Standby.
'''
  });
}

Future<void> insertMidLevel2AwsData(Database db) async {
  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Seguridad Avanzada',
    'topic': 'IAM Avanzado',
    'subtopic': 'Políticas personalizadas',
    'definition': '''
Las políticas personalizadas de IAM (Identity and Access Management) en AWS son la forma en que defines exactamente qué pueden hacer los usuarios, roles y grupos dentro de tu cuenta de AWS. Son como el manual de reglas de tu cuenta, donde escribes línea por línea los permisos específicos.

¿Qué tan potentes son estas políticas para controlar el acceso a tus recursos?

Aquí te va la aclaración: Pensemos en un escenario donde necesitas que un desarrollador pueda ver el contenido de un bucket de S3 específico, pero no pueda eliminar nada, y que además pueda iniciar y detener solo ciertas instancias EC2 de desarrollo, sin tocar las de producción. Con las políticas personalizadas, puedes crear un documento JSON que detalle cada una de estas reglas. A diferencia de las políticas administradas por AWS (que son genéricas y muy útiles para empezar), las personalizadas te dan una granularidad extrema. Puedes especificar acciones (como `s3:GetObject`, `ec2:StartInstances`), recursos (`arn:aws:s3:::my-dev-bucket/*`, `arn:aws:ec2:us-east-1:123456789012:instance/i-xxxxxxxxxxxxxxxxx`), y si se permite o se deniega esa acción.

Dominar las políticas personalizadas es fundamental para implementar el principio del "mínimo privilegio", que es una práctica de seguridad crucial. Esto significa dar solo los permisos estrictamente necesarios para realizar una tarea, y nada más. Esto reduce la superficie de ataque y el riesgo en caso de que una credencial caiga en manos equivocadas. Por ejemplo, si un desarrollador solo necesita leer de un bucket, no le das permisos de escritura o eliminación. Esto es más complejo que usar las políticas predefinidas, pero te da un control total y una seguridad mucho más ajustada a tus necesidades específicas. Es un conocimiento que te diferenciará en el mundo de la seguridad en la nube.
''',
    'code_example': r'''
// Ejemplo de una política IAM personalizada que permite acceso de lectura a un bucket S3 específico
// y acciones limitadas en instancias EC2 con un tag específico.

// CORRECTO: Política de mínimo privilegio para un desarrollador
// {
//     "Version": "2012-10-17",
//     "Statement": [
//         {
//             "Effect": "Allow",
//             "Action": [
//                 "s3:GetObject",
//                 "s3:ListBucket"
//             ],
//             "Resource": [
//                 "arn:aws:s3:::my-dev-bucket",
//                 "arn:aws:s3:::my-dev-bucket/*"
//             ],
//             "Condition": {
//                 "StringEquals": {
//                     "s3:prefix": [
//                         "dev-logs/",
//                         "dev-data/"
//                     ]
//                 }
//             }
//         },
//         {
//             "Effect": "Allow",
//             "Action": [
//                 "ec2:DescribeInstances",
//                 "ec2:StartInstances",
//                 "ec2:StopInstances"
//             ],
//             "Resource": "*",
//             "Condition": {
//                 "StringEquals": {
//                     "ec2:ResourceTag/Environment": "Development"
//                 }
//             }
//         }
//     ]
// }
//
// INCORRECTO: Política con permisos excesivos (viola el principio de mínimo privilegio)
// // Una política que otorga permisos amplios sin necesidad.
// // Por ejemplo, dar acceso completo a S3 o EC2 a un rol que solo necesita leer.
// {
//     "Version": "2012-10-17",
//     "Statement": [
//         {
//             "Effect": "Allow",
//             "Action": "s3:*", // Permisos de S3 excesivos (lectura, escritura, eliminación)
//             "Resource": "*"    // Acceso a TODOS los buckets
//         },
//         {
//             "Effect": "Allow",
//             "Action": "ec2:*", // Permisos de EC2 excesivos
//             "Resource": "*"
//         }
//     ]
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Seguridad Avanzada',
    'topic': 'IAM Avanzado',
    'subtopic': 'Permisos basados en recursos',
    'definition': '''
Los permisos basados en recursos son una forma súper potente de controlar el acceso a tus recursos de AWS directamente desde el recurso mismo, en lugar de hacerlo solo a través de las políticas adjuntas a usuarios o roles. Imagina que es como poner un candado inteligente directamente en tu caja fuerte, y no solo tener una llave en el bolsillo de alguien.

¿Qué flexibilidad adicional nos dan estos permisos que las políticas de IAM tradicionales no?

Aquí te va la aclaración: Normalmente, con IAM, adjuntas una política a una identidad (un usuario, rol o grupo) para decirle qué puede hacer. Con los permisos basados en recursos, la política (llamada política de recurso) está adjunta al recurso en sí. El ejemplo más común es con Amazon S3 (Bucket Policies), pero también se usan en servicios como SQS (Queue Policies), SNS (Topic Policies), y KMS (Key Policies). Una política de bucket S3, por ejemplo, puede especificar quién (usuarios o roles de tu cuenta, o incluso de otras cuentas de AWS) puede acceder a los objetos en ese bucket y qué acciones pueden realizar.

La gran ventaja es que estos permisos pueden definir quién puede acceder al recurso *desde cualquier lugar*, incluso si el acceso es de otra cuenta de AWS o un servicio. Esto es crucial para escenarios de compartición de datos o integración entre cuentas. Por ejemplo, puedes tener un bucket S3 que almacena logs y quieres que otra cuenta de AWS (quizás la de un socio o un equipo de análisis) pueda escribir en ese bucket. En lugar de dar un rol con permisos de escritura a esa otra cuenta (lo cual implicaría que la otra cuenta lo asuma), simplemente configuras una política de bucket que explícitamente le da permiso de escritura a la otra cuenta para ese bucket específico. Esto simplifica la gestión de accesos entre cuentas y te da un control muy preciso sobre quién puede hacer qué con tus recursos.
''',
    'code_example': r'''
// Ejemplo de una política de bucket S3 que permite a una cuenta externa subir objetos.

// CORRECTO: Política de Bucket S3 para acceso entre cuentas (permisos basados en recursos)
// {
//     "Version": "2012-10-17",
//     "Statement": [
//         {
//             "Sid": "AllowExternalAccountUploads",
//             "Effect": "Allow",
//             "Principal": {
//                 "AWS": "arn:aws:iam::222222222222:root" // ID de la cuenta externa
//             },
//             "Action": [
//                 "s3:PutObject",
//                 "s3:PutObjectAcl"
//             ],
//             "Resource": "arn:aws:s3:::my-logs-bucket/*" // Acceso a objetos dentro del bucket
//         },
//         {
//             "Sid": "AllowExternalAccountListBucket",
//             "Effect": "Allow",
//             "Principal": {
//                 "AWS": "arn:aws:iam::222222222222:root"
//             },
//             "Action": "s3:ListBucket",
//             "Resource": "arn:aws:s3:::my-logs-bucket" // Acceso para listar el bucket en sí
//         }
//     ]
// }
//
// INCORRECTO: Confiar solo en políticas de identidad para acceso entre cuentas (menos seguro/flexible)
// // En lugar de usar una política de bucket, intentar dar permiso a un usuario/rol de la cuenta externa
// // a través de una política de identidad en la cuenta dueña del bucket. Esto no funciona directamente
// // si la otra cuenta intenta acceder al bucket sin que la política de bucket lo permita.
// //
// // Una forma incorrecta sería no tener política de bucket y esperar que una política de identidad
// // en la cuenta 222222222222 que dice "permitir acceso a s3:::my-logs-bucket" sea suficiente.
// // Requiere una combinación de políticas de identidad y de recurso para el acceso entre cuentas.
// //
// // Policy en la cuenta 222222222222 (Identidad):
// // {
// //     "Version": "2012-10-17",
// //     "Statement": [
// //         {
// //             "Effect": "Allow",
// //             "Action": "s3:PutObject",
// //             "Resource": "arn:aws:s3:::my-logs-bucket/*"
// //         }
// //     ]
// // }
// // Aunque esta política permite a la identidad hacer la acción, el bucket debe permitirla explícitamente.
// // Sin la política de bucket, el acceso DENY-by-default toma precedencia.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Seguridad Avanzada',
    'topic': 'IAM Avanzado',
    'subtopic': 'IAM Conditions',
    'definition': '''
Las condiciones de IAM son la cereza del pastel en la granularidad de permisos de AWS. Te permiten especificar con qué condiciones o en qué circunstancias se otorga o se deniega un permiso. Piensa que son como los "filtros" de tus reglas de acceso: la acción solo se permite si se cumplen ciertas condiciones.

¿Cómo te permiten estas condiciones un control de acceso super preciso y dinámico?

Aquí te va la aclaración: Una política IAM básica dice "quién" puede hacer "qué" con "qué recurso". Las condiciones añaden el "cuándo", "dónde", "cómo", y "por qué". Por ejemplo, puedes permitir que un usuario acceda a un bucket de S3 *solamente* si su dirección IP de origen pertenece a un rango específico de tu oficina, o si la solicitud se realiza en un horario determinado del día. También puedes controlar el acceso basándote en tags de recursos, el tipo de cifrado utilizado, o incluso si la solicitud proviene de un servicio específico de AWS.

Las condiciones se definen usando bloques `Condition` dentro de una declaración de política. Utilizan operadores de condición (como `StringEquals`, `NumericLessThan`, `IpAddress`, `ForAllValues:StringLike`, etc.) y claves de condición (como `aws:SourceIp`, `s3:Prefix`, `ec2:ResourceTag/Environment`, `aws:RequestedRegion`). Esto es increíblemente útil para implementar seguridad de "contexto". Por ejemplo, puedes asegurar que los recursos de producción solo puedan ser accedidos desde una VPC específica o que ciertas acciones de administración (como borrar una base de datos) solo puedan ser realizadas por usuarios que también tienen la autenticación multifactor (MFA) habilitada. Es una herramienta poderosa para aplicar políticas de seguridad detalladas que se adaptan a situaciones específicas, reduciendo el riesgo de accesos no autorizados y reforzando tu postura de seguridad en la nube.
''',
    'code_example': r'''
// Ejemplo de una política IAM que permite acciones de S3 y EC2 solo bajo ciertas condiciones.

// CORRECTO: Política con condiciones para restringir acceso por IP y por tag
// {
//     "Version": "2012-10-17",
//     "Statement": [
//         {
//             "Effect": "Allow",
//             "Action": "s3:GetObject",
//             "Resource": "arn:aws:s3:::my-secure-bucket/*",
//             "Condition": {
//                 "IpAddress": {
//                     "aws:SourceIp": "203.0.113.0/24" // Permite acceso solo desde este rango de IP
//                 }
//             }
//         },
//         {
//             "Effect": "Allow",
//             "Action": [
//                 "ec2:StartInstances",
//                 "ec2:StopInstances"
//             ],
//             "Resource": "*",
//             "Condition": {
//                 "StringEquals": {
//                     "ec2:ResourceTag/Project": "Phoenix", // Solo instancias con este tag
//                     "aws:PrincipalTag/Department": "Engineering" // Y el usuario tiene este tag
//                 },
//                 "Bool": {
//                     "aws:MultiFactorAuthPresent": "true" // Requiere MFA para estas acciones
//                 }
//             }
//         }
//     ]
// }
//
// INCORRECTO: Política sin condiciones cuando son necesarias (permisos demasiado amplios)
// // Una política que permite acciones sensibles sin ninguna condición, lo que aumenta el riesgo.
// // Por ejemplo, permitir a cualquier usuario iniciar o detener instancias en cualquier red.
// {
//     "Version": "2012-10-17",
//     "Statement": [
//         {
//             "Effect": "Allow",
//             "Action": [
//                 "ec2:StartInstances",
//                 "ec2:StopInstances"
//             ],
//             "Resource": "*" // Permite estas acciones en CUALQUIER instancia sin restricciones
//         }
//     ]
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Seguridad Avanzada',
    'topic': 'IAM Avanzado',
    'subtopic': 'Delegación de permisos',
    'definition': '''
La delegación de permisos en AWS es el arte de permitir que una entidad (como un usuario o un rol en una cuenta A) asuma o utilice los permisos de otra entidad (generalmente un rol en una cuenta B). Es como darle a alguien la capacidad de actuar en tu nombre, pero solo con los permisos que tú le has concedido específicamente.

¿De qué manera esto facilita la gestión de accesos en entornos multi-cuenta o para integrar servicios?

Aquí te va la aclaración: Pensemos en una organización grande que tiene varias cuentas de AWS (por ejemplo, una para desarrollo, otra para producción, y otra para auditoría). En lugar de crear usuarios individuales en cada cuenta y gestionar sus credenciales por separado, puedes usar la delegación de permisos. Un patrón común es que un usuario en la cuenta de desarrollo pueda "asumir" un rol en la cuenta de producción. Este rol en la cuenta de producción tendría los permisos específicos necesarios para trabajar allí (por ejemplo, desplegar código, monitorear métricas). El usuario de desarrollo solo necesita tener permiso para asumir ese rol, y una vez que lo hace, opera bajo los permisos del rol de producción.

Esto es increíblemente útil por varias razones: Primero, centraliza la gestión de usuarios en una cuenta (o usando AWS SSO), lo que simplifica la administración de credenciales y la aplicación de políticas de contraseñas. Segundo, mejora la seguridad porque los usuarios nunca tienen credenciales de larga duración para las cuentas de producción; en su lugar, obtienen credenciales temporales al asumir el rol. Tercero, facilita la integración entre servicios y cuentas. Por ejemplo, puedes configurar un rol en una cuenta de producción para que un servicio de AWS (como AWS Lambda o un CodePipeline) en otra cuenta pueda ejecutar acciones en la cuenta de producción. La delegación de permisos es un pilar fundamental para construir arquitecturas seguras y eficientes en entornos multi-cuenta en AWS, permitiendo la colaboración y la automatización sin sacrificar el control de acceso.
''',
    'code_example': r'''
// Ejemplo conceptual de delegación de permisos: un rol en la Cuenta A puede asumir un rol en la Cuenta B.

// CORRECTO: Rol en la Cuenta B (Target Role) con una política de confianza.
// Esta política permite que el rol de la Cuenta A (Source Role) asuma este rol.
// // aws_account_id_B/role/ProductionDeployerRole
// {
//   "Version": "2012-10-17",
//   "Statement": [
//     {
//       "Effect": "Allow",
//       "Principal": {
//         "AWS": "arn:aws:iam::111111111111:role/DevDeployerRole" // ARN del rol en la Cuenta A
//       },
//       "Action": "sts:AssumeRole",
//       "Condition": {} // Se pueden añadir condiciones para mayor seguridad (ej. SourceIp)
//     }
//   ]
// }
//
// // Política adjunta al rol de la Cuenta B (ej. permisos de despliegue en EC2 o S3)
// {
//     "Version": "2012-10-17",
//     "Statement": [
//         {
//             "Effect": "Allow",
//             "Action": [
//                 "ec2:StartInstances",
//                 "ec2:StopInstances",
//                 "s3:PutObject"
//             ],
//             "Resource": "*"
//         }
//     ]
// }
//
// // Comando de la CLI para asumir el rol desde la Cuenta A (como el DevDeployerRole)
// // aws sts assume-role --role-arn "arn:aws:iam::222222222222:role/ProductionDeployerRole" --role-session-name "MyDeploymentSession"
//
// INCORRECTO: Compartir credenciales de usuario root o de IAM de larga duración entre cuentas.
// // Dar a un desarrollador las credenciales de un usuario IAM con acceso completo a la cuenta de producción.
// // Esto es una práctica de seguridad muy pobre.
// //
// // El código no representaría esto directamente, sino la ausencia de una buena práctica de delegación.
// // Imagina un archivo '.aws/credentials' con claves de acceso de producción directamente:
// // [production-dev-user]
// // aws_access_key_id = AKIAXXXXXXXXXXXXXXXX
// // aws_secret_access_key = YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY
// //
// // Esto es riesgoso porque:
// // 1. Las credenciales son de larga duración y no se rotan automáticamente.
// // 2. No hay trazabilidad granular de quién las usó para qué.
// // 3. Violenta el principio del mínimo privilegio si se da acceso total.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Seguridad Avanzada',
    'topic': 'Encriptación',
    'subtopic': 'KMS (Key Management Service)',
    'definition': '''
AWS Key Management Service (KMS) es un servicio que te permite crear y controlar las claves de cifrado que usas para proteger tus datos. Piensa en KMS como tu propia caja fuerte digital supersegura para guardar las llaves maestras que abren tus datos cifrados.

¿Por qué es vital usar un servicio como KMS en lugar de gestionar tus propias claves?

Aquí te va la aclaración: Cifrar tus datos es un paso crucial para la seguridad, pero si no gestionas las claves de cifrado de forma segura, todo el esfuerzo se viene abajo. KMS resuelve este problema ofreciendo un servicio altamente disponible y seguro para generar, almacenar y gestionar tus claves. KMS se integra con muchos otros servicios de AWS, lo que facilita el cifrado de datos almacenados en S3, RDS, EBS, Lambda, etc., sin que tengas que preocuparte por el proceso de cifrado o la gestión de claves. Por ejemplo, al cifrar un bucket de S3 con KMS, cada vez que subes un archivo, KMS lo cifra automáticamente, y cuando lo descargas, KMS lo descifra. Tú, como usuario o desarrollador, solo ves el archivo sin cifrar.

Lo más importante de KMS es que tus claves nunca salen del servicio sin cifrar. Todas las operaciones con las claves (generación, cifrado, descifrado) se realizan dentro de un módulo de seguridad de hardware (HSM) certificado, lo que ofrece un nivel de seguridad altísimo. Además, KMS te permite auditar el uso de tus claves a través de AWS CloudTrail, lo que te da un registro completo de quién, cuándo y cómo se usó una clave. Esto es fundamental para cumplir con regulaciones y para mantener la visibilidad sobre tus datos más sensibles. En resumen, KMS simplifica la gestión de claves de cifrado y eleva la seguridad de tus datos en la nube a un nivel empresarial.
''',
    'code_example': r'''
// Ejemplo conceptual de cómo usar KMS para cifrar y descifrar datos con el SDK de AWS.

// CORRECTO: Cifrar y descifrar datos usando una CMK de KMS
// // Asume que tienes configurado el SDK de AWS y una CMK en KMS.
// const AWS = require('aws-sdk');
// const kms = new AWS.KMS({region: 'us-east-1'});
//
// const CMK_ID = 'arn:aws:kms:us-east-1:123456789012:key/your-cmk-id';
// const PLAIN_TEXT_DATA = 'Mi información secreta';
//
// async function encryptAndDecryptData() {
//   try {
//     // Cifrar datos
//     const encryptParams = {
//       KeyId: CMK_ID,
//       Plaintext: Buffer.from(PLAIN_TEXT_DATA)
//     };
//     const encryptedResult = await kms.encrypt(encryptParams).promise();
//     const cipherTextBlob = encryptedResult.CiphertextBlob;
//     console.log('Datos cifrados (Blob):', cipherTextBlob.toString('base64'));
//
//     // Descifrar datos
//     const decryptParams = {
//       CiphertextBlob: cipherTextBlob
//     };
//     const decryptedResult = await kms.decrypt(decryptParams).promise();
//     const decryptedPlaintext = decryptedResult.Plaintext.toString('utf8');
//     console.log('Datos descifrados:', decryptedPlaintext);
//
//     if (decryptedPlaintext === PLAIN_TEXT_DATA) {
//       console.log('¡Cifrado y descifrado exitosos!');
//     }
//   } catch (err) {
//     console.error('Error en operación KMS:', err);
//   }
// }
//
// // Ejecutar la función
// // encryptAndDecryptData();
//
// INCORRECTO: Hardcodear claves de cifrado en el código o no usar un servicio de gestión de claves.
// // NO HACER ESTO: Usar una clave de cifrado fija y almacenada directamente en la aplicación.
// // Esto expone la clave y la hace difícil de rotar o invalidar.
// const SECRET_KEY = 'EsteEsMiSecretoSuperSeguroQueNadieDebeVer'; // ¡Mala práctica!
//
// function simpleEncrypt(data, key) {
//   // Lógica de cifrado simplificada (NO SEGURA PARA PRODUCCIÓN)
//   return Buffer.from(data).map(byte => byte ^ key.charCodeAt(0)).toString('base64');
// }
//
// function simpleDecrypt(encryptedData, key) {
//   // Lógica de descifrado simplificada (NO SEGURA PARA PRODUCCIÓN)
//   const buffer = Buffer.from(encryptedData, 'base64');
//   return buffer.map(byte => byte ^ key.charCodeAt(0)).toString('utf8');
// }
//
// // const encrypted = simpleEncrypt('Mi información secreta', SECRET_KEY);
// // const decrypted = simpleDecrypt(encrypted, SECRET_KEY);
// // console.log('Encriptado (inseguro):', encrypted);
// // console.log('Desencriptado (inseguro):', decrypted);
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Seguridad Avanzada',
    'topic': 'Encriptación',
    'subtopic': 'CMKs (Customer Master Keys)',
    'definition': '''
Las CMKs, o Customer Master Keys (ahora más comúnmente llamadas Customer Managed Keys), son las claves de cifrado que tú, como cliente de AWS, puedes crear, controlar y gestionar dentro de AWS KMS. Son el corazón de tu estrategia de cifrado cuando necesitas un control más granular sobre la seguridad de tus datos.

¿Cuál es la diferencia clave entre una CMK y otras claves en KMS?

Aquí te va la aclaración: En KMS, hay varios tipos de claves. Las más comunes son las "AWS Managed Keys" (claves gestionadas por AWS), que son claves que AWS crea y gestiona automáticamente para ti cuando habilitas el cifrado en servicios como S3 o EBS sin especificar una clave propia. Son convenientes, pero tú no tienes control directo sobre su ciclo de vida. Las CMKs son diferentes: tú las creas, defines sus políticas de acceso, puedes habilitar y deshabilitar, rotarlas manual o automáticamente, e incluso importarlas desde tu propio HSM local si tienes requisitos de seguridad específicos. Es tu llave maestra personal en la caja fuerte de KMS.

Tener control sobre tus CMKs te da un nivel superior de seguridad y cumplimiento. Por ejemplo, puedes definir políticas de clave que especifiquen exactamente qué usuarios o roles pueden usar esa CMK para cifrar o descifrar datos, o incluso restringir el acceso a la clave solo a ciertos servicios. Si en algún momento sospechas que una clave ha sido comprometida, puedes deshabilitarla instantáneamente, impidiendo que se utilice para cualquier operación de cifrado/descifrado, lo que te da un control de emergencia total. Las CMKs son ideales para datos altamente sensibles, para cumplir con regulaciones específicas (como HIPAA o PCI DSS), o cuando necesitas una pista de auditoría detallada de cada uso de la clave. Son el "go-to" para una gestión de cifrado robusta y bajo tu propio control.
''',
    'code_example': r'''
// Ejemplo de una política de clave (Key Policy) para una CMK en KMS.
// Esta política define quién puede usar o administrar la CMK.

// CORRECTO: Política de clave CMK que permite a un rol específico usarla y a un administrador gestionarla.
// {
//     "Version": "2012-10-17",
//     "Id": "key-default-1",
//     "Statement": [
//         {
//             "Sid": "Enable IAM User Permissions",
//             "Effect": "Allow",
//             "Principal": {
//                 "AWS": "arn:aws:iam::123456789012:root" // Permite al root de la cuenta gestionar la clave
//             },
//             "Action": "kms:*",
//             "Resource": "*"
//         },
//         {
//             "Sid": "Allow use of the key for encryption/decryption",
//             "Effect": "Allow",
//             "Principal": {
//                 "AWS": [
//                     "arn:aws:iam::123456789012:role/MyApplicationRole", // Un rol de aplicación puede usar la CMK
//                     "arn:aws:iam::123456789012:user/MyDevUser" // Un usuario específico puede usar la CMK
//                 ]
//             },
//             "Action": [
//                 "kms:Encrypt",
//                 "kms:Decrypt",
//                 "kms:ReEncrypt*",
//                 "kms:GenerateDataKey*",
//                 "kms:DescribeKey"
//             ],
//             "Resource": "*"
//         },
//         {
//             "Sid": "Allow key administrators to administer the key",
//             "Effect": "Allow",
//             "Principal": {
//                 "AWS": "arn:aws:iam::123456789012:group/KMSAdmins" // Un grupo puede administrar la CMK
//             },
//             "Action": [
//                 "kms:Create*",
//                 "kms:Describe*",
//                 "kms:Enable*",
//                 "kms:List*",
//                 "kms:Put*",
//                 "kms:Update*",
//                 "kms:Disable*",
//                 "kms:Get*",
//                 "kms:Delete*",
//                 "kms:ScheduleKeyDeletion",
//                 "kms:CancelKeyDeletion"
//             ],
//             "Resource": "*"
//         }
//     ]
// }
//
// INCORRECTO: CMK con una política de clave demasiado permisiva o sin las restricciones adecuadas.
// // Una política que permite a "todos" usar la CMK, lo que elimina el propósito de su control.
// {
//     "Version": "2012-10-17",
//     "Id": "key-default-1",
//     "Statement": [
//         {
//             "Sid": "AllowEveryoneToUseKey",
//             "Effect": "Allow",
//             "Principal": "*", // ¡ERROR! Permite a CUALQUIERA (incluyendo usuarios anónimos si la política lo permite)
//             "Action": "kms:*",
//             "Resource": "*"
//         }
//     ]
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Seguridad Avanzada',
    'topic': 'Encriptación',
    'subtopic': 'Encriptación en tránsito y en reposo',
    'definition': '''
La encriptación es una de las piedras angulares de la seguridad en la nube, y es crucial entender que no toda la encriptación es igual. Se divide principalmente en dos categorías: encriptación en tránsito (o en vuelo) y encriptación en reposo (o en almacenamiento). Ambas son fundamentales para proteger tus datos de diferentes tipos de amenazas.

¿Cuál es la importancia de proteger tus datos en ambos estados?

Aquí te va la aclaración: Pensemos en un paquete que envías por correo. La **encriptación en tránsito** es como sellar y asegurar el paquete mientras viaja de un lugar a otro. Se refiere a proteger tus datos mientras se mueven a través de una red, por ejemplo, cuando un usuario accede a tu sitio web, cuando los datos se mueven entre servicios de AWS, o cuando se replican entre regiones. Esto se logra típicamente usando protocolos de seguridad como TLS (Transport Layer Security) o SSL (Secure Sockets Layer), que garantizan que los datos no puedan ser interceptados y leídos por terceros. Servicios de AWS como Elastic Load Balancing (ELB), API Gateway, y CloudFront soportan y recomiendan fuertemente el uso de HTTPS/TLS para la encriptación en tránsito.

Por otro lado, la **encriptación en reposo** es como asegurar el paquete una vez que ha llegado a su destino y está guardado en una bóveda. Se trata de proteger tus datos cuando están almacenados en algún lugar, como en bases de datos (RDS, DynamoDB), almacenamiento de objetos (S3), o volúmenes de disco (EBS). Esto se logra mediante algoritmos de cifrado que transforman los datos en un formato ilegible, a menos que tengas la clave de descifrado correcta. AWS ofrece varias opciones para la encriptación en reposo, incluyendo el cifrado del lado del servidor (SSE) para S3, el cifrado de volúmenes de EBS y las bases de datos RDS, a menudo integrado con AWS KMS para la gestión de claves. Al combinar ambas, te aseguras de que tus datos estén protegidos en todo momento, ya sea que estén viajando por la red o guardados en un disco.
''',
    'code_example': r'''
// Ejemplos conceptuales de cómo se implementa la encriptación en tránsito y en reposo en AWS.

// CORRECTO: Encriptación en Tránsito (HTTPS con ALB) y Encriptación en Reposo (S3 con SSE-KMS)
// // Configuración de un Listener de Application Load Balancer (ALB) para HTTPS (encriptación en tránsito)
// // Esto redirige el tráfico HTTP a HTTPS y usa un certificado SSL/TLS.
// Resources:
//   MyALBListener:
//     Type: AWS::ElasticLoadBalancingV2::Listener
//     Properties:
//       LoadBalancerArn: !Ref MyALB
//       Port: 443
//       Protocol: HTTPS
//       Certificates:
//         - CertificateArn: arn:aws:acm:us-east-1:123456789012:certificate/your-cert-id # Certificado de ACM
//       DefaultActions:
//         - Type: forward
//           TargetGroupArn: !Ref MyTargetGroup
//   MyHTTPListener:
//     Type: AWS::ElasticLoadBalancingV2::Listener
//     Properties:
//       LoadBalancerArn: !Ref MyALB
//       Port: 80
//       Protocol: HTTP
//       DefaultActions:
//         - Type: redirect
//           RedirectConfig:
//             Protocol: HTTPS
//             Port: '443'
//             StatusCode: HTTP_301
//
// // Configuración de un Bucket S3 con cifrado del lado del servidor (SSE-KMS) (encriptación en reposo)
// // Los objetos se cifran automáticamente con una CMK de KMS al ser subidos.
// Resources:
//   MyEncryptedS3Bucket:
//     Type: AWS::S3::Bucket
//     Properties:
//       BucketName: my-secure-data-bucket-12345
//       BucketEncryption:
//         ServerSideEncryptionConfiguration:
//           - ServerSideEncryptionByDefault:
//               SSEAlgorithm: aws:kms
//               KMSMasterKeyID: arn:aws:kms:us-east-1:123456789012:key/your-cmk-id
//
// INCORRECTO: No usar encriptación en tránsito (HTTP) o encriptación en reposo.
// // Lanzar un ALB con un listener solo en HTTP (no encriptado en tránsito).
// Resources:
//   MyInsecureALBListener:
//     Type: AWS::ElasticLoadBalancingV2::Listener
//     Properties:
//       LoadBalancerArn: !Ref MyALB
//       Port: 80
//       Protocol: HTTP
//       DefaultActions:
//         - Type: forward
//           TargetGroupArn: !Ref MyTargetGroup
//
// // Crear un bucket S3 sin ninguna configuración de cifrado (datos sin cifrar en reposo).
// Resources:
//   MyUnencryptedS3Bucket:
//     Type: AWS::S3::Bucket
//     Properties:
//       BucketName: my-insecure-data-bucket-abc
//       # No hay "BucketEncryption" aquí
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Seguridad Avanzada',
    'topic': 'Encriptación',
    'subtopic': 'AWS Certificate Manager',
    'definition': '''
AWS Certificate Manager (ACM) es un servicio que facilita la gestión, el despliegue y la renovación de certificados SSL/TLS para tus aplicaciones en AWS. Piensa en ACM como tu gestor de pasaportes digitales para tus sitios web y servicios, asegurando que sus comunicaciones sean siempre seguras.

¿Qué tan sencillo puede ser manejar certificados SSL/TLS con ACM en comparación con la gestión manual?

Aquí te va la aclaración: Los certificados SSL/TLS son esenciales para la encriptación en tránsito (HTTPS) y para establecer la identidad de tu sitio web. Sin ellos, los navegadores mostrarían advertencias de seguridad a tus usuarios. Tradicionalmente, obtener y renovar estos certificados era un proceso manual, propenso a errores y que requería estar pendiente de las fechas de vencimiento. ACM automatiza todo este dolor de cabeza. Puedes solicitar certificados SSL/TLS gratuitos directamente desde ACM, y AWS se encarga de la validación (ya sea por DNS o por email) y, lo mejor de todo, de la renovación automática.

Una vez que un certificado es emitido por ACM, puedes asociarlo fácilmente con otros servicios de AWS como Elastic Load Balancing (ALB, NLB, CLB), Amazon CloudFront, Amazon API Gateway, y AWS Elastic Beanstalk. Esto significa que tu tráfico entre el usuario final y tu aplicación estará cifrado sin que tú tengas que instalar o configurar certificados en servidores individuales. Si usas CloudFront para tu CDN, el certificado de ACM puede usarse para asegurar la comunicación entre los usuarios y los Edge Locations de CloudFront. La automatización de la renovación es una característica que te salva de muchos dolores de cabeza y posibles caídas de servicio, ya que los certificados vencidos son una causa común de interrupciones. En resumen, ACM simplifica la seguridad de la comunicación, permitiéndote centrarte en tu aplicación y no en la burocracia de los certificados.
''',
    'code_example': r'''
// Ejemplo conceptual de cómo solicitar un certificado en ACM y asociarlo a un Application Load Balancer (ALB).

// CORRECTO: Solicitar un certificado en ACM (DNS validation) y adjuntarlo a un ALB Listener.
// // Comando AWS CLI para solicitar un certificado (DNS Validation)
// aws acm request-certificate \\
//   --domain-name example.com \\
//   --validation-method DNS \\
//   --subject-alternative-names www.example.com
//
// // Una vez solicitado, ACM te dará un CNAME para añadir a tu DNS para validar el dominio.
// // Luego, al configurar un Application Load Balancer (ALB) Listener:
// Resources:
//   MyALBListenerHTTPS:
//     Type: AWS::ElasticLoadBalancingV2::Listener
//     Properties:
//       LoadBalancerArn: !Ref MyALB
//       Port: 443
//       Protocol: HTTPS
//       Certificates:
//         - CertificateArn: arn:aws:acm:us-east-1:123456789012:certificate/your-acm-certificate-id-from-request # ARN del certificado de ACM
//       DefaultActions:
//         - Type: forward
//           TargetGroupArn: !Ref MyTargetGroup
//
// INCORRECTO: Gestión manual de certificados SSL/TLS en cada servidor.
// // Comprar un certificado de un proveedor externo, subirlo a cada servidor web,
// // configurarlo en Nginx/Apache, y recordar renovarlo manualmente cada año.
// //
// // Esto no es un código AWS, sino una representación de la práctica manual y propensa a errores.
// //
// // Ejemplo conceptual de configuración manual en Nginx:
// // server {
// //     listen 443 ssl;
// //     server_name example.com;
// //     ssl_certificate /etc/nginx/ssl/example.com.crt;  # Requiere gestión manual
// //     ssl_certificate_key /etc/nginx/ssl/example.com.key; # Requiere gestión manual
// //     ssl_protocols TLSv1.2 TLSv1.3;
// //     location / {
// //         proxy_pass http://localhost:8080;
// //     }
// // }
// //
// // Fallo común: Olvidar renovar el certificado y la aplicación se cae.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Seguridad Avanzada',
    'topic': 'Detección de Amenazas',
    'subtopic': 'Amazon GuardDuty',
    'definition': '''
Amazon GuardDuty es un servicio de detección de amenazas que monitorea continuamente tu cuenta de AWS y tus recursos para identificar actividades maliciosas o no autorizadas. Piensa en GuardDuty como un guardia de seguridad con inteligencia artificial, siempre vigilando cualquier movimiento sospechoso en tu entorno AWS.

¿Qué tan efectivo es para detectar lo que un ojo humano podría pasar por alto?

Aquí te va la aclaración: A veces, los atacantes intentan ser sigilosos, o simplemente hay configuraciones que, sin darte cuenta, abren puertas traseras. GuardDuty utiliza machine learning, inteligencia de amenazas y detección de anomalías para identificar patrones de comportamiento inusuales. Por ejemplo, si una instancia EC2 que normalmente solo usa el puerto 80 de repente intenta comunicarse con una dirección IP conocida por ser un servidor de comando y control de malware, GuardDuty lo detecta. Si un rol de IAM que nunca antes había accedido a un bucket de S3 de repente empieza a enumerar su contenido a una velocidad anormal, GuardDuty te avisará.

No necesitas desplegar agentes en tus instancias ni hacer configuraciones complejas; GuardDuty es completamente serverless y se habilita con un clic. Monitorea flujos de VPC (tráfico de red), registros de CloudTrail (actividad de la API) y registros de DNS. Cuando detecta algo sospechoso, genera un "hallazgo" (finding) que te proporciona detalles sobre la amenaza, el recurso afectado y las acciones recomendadas. Estos hallazgos pueden ser enviados a AWS Security Hub, Amazon EventBridge o a servicios de notificación como SNS, permitiéndote automatizar respuestas. GuardDuty es una herramienta proactiva fundamental para la seguridad, ayudándote a identificar y responder rápidamente a posibles incidentes de seguridad antes de que se conviertan en problemas mayores.
''',
    'code_example': r'''
// Amazon GuardDuty se habilita y configura principalmente a través de la consola de AWS o AWS CLI.
// No hay un "código de aplicación" directo para usar GuardDuty, sino más bien configuraciones.

// CORRECTO: Habilitar GuardDuty y configurar una regla de EventBridge para enviar hallazgos a SNS.
// // Comando AWS CLI para habilitar GuardDuty
// aws guardduty create-detector --enable
//
// // Ejemplo de CloudFormation para una regla de EventBridge que captura hallazgos de GuardDuty
// Resources:
//   GuardDutyFindingRule:
//     Type: AWS::Events::Rule
//     Properties:
//       Name: GuardDutyFindingsToSNS
//       Description: "Route GuardDuty findings to an SNS topic for notifications"
//       EventBusName: default
//       EventPattern:
//         source:
//           - aws.guardduty
//         detail-type:
//           - GuardDuty Finding
//       Targets:
//         - Arn: !Ref GuardDutyNotificationTopic # ARN de tu tópico SNS
//           Id: GuardDutySNSTarget
//
//   GuardDutyNotificationTopic:
//     Type: AWS::SNS::Topic
//     Properties:
//       DisplayName: GuardDutyNotifications
//       TopicName: GuardDutySecurityAlerts
//
//   SNSTopicPolicy:
//     Type: AWS::SNS::TopicPolicy
//     Properties:
//       PolicyDocument:
//         Statement:
//           - Effect: Allow
//             Principal:
//               Service: events.amazonaws.com # Permite a EventBridge publicar en este tópico
//             Action: "sns:Publish"
//             Resource: !Ref GuardDutyNotificationTopic
//       Topics:
//         - !Ref GuardDutyNotificationTopic
//
// INCORRECTO: Ignorar la detección de amenazas y no habilitar servicios de monitoreo de seguridad.
// No hay código para esto, ya que es la ausencia de acción la que es incorrecta.
// Esto dejaría tu entorno AWS vulnerable a actividades maliciosas que pasarían desapercibidas.
//
// Un ejemplo sería:
// - No habilitar GuardDuty.
// - No revisar los logs de CloudTrail manualmente o automáticamente.
// - Depender solo de la seguridad perimetral sin monitoreo interno de anomalías.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Seguridad Avanzada',
    'topic': 'Detección de Amenazas',
    'subtopic': 'AWS Config',
    'definition': '''
AWS Config es un servicio que te permite evaluar, auditar y revisar las configuraciones de tus recursos de AWS. Piensa en AWS Config como tu contabilidad detallada de la infraestructura: lleva un registro de cada cambio, cómo se configuró cada recurso en un momento dado, y te ayuda a ver si tus configuraciones cumplen con las mejores prácticas o con tus propias políticas de seguridad.

¿Qué tan útil es para mantener tu entorno seguro y conforme?

Aquí te va la aclaración: En un entorno de nube dinámico, los recursos se crean, modifican y eliminan constantemente. Si no llevas un registro, es fácil que las configuraciones se desvíen de tus estándares de seguridad o de cumplimiento. AWS Config registra automáticamente todos los cambios de configuración de tus recursos de AWS (como instancias EC2, buckets S3, grupos de seguridad, etc.). Puedes ver un historial de cambios para cada recurso, lo que es invaluable para la resolución de problemas, auditorías forenses y para entender cómo evolucionó tu infraestructura.

Pero AWS Config va más allá del simple registro. También te permite definir "reglas" de Config, que son condiciones que tus recursos deben cumplir. Por ejemplo, puedes tener una regla que verifique que ningún bucket de S3 esté configurado como público, o que todas tus instancias EC2 tengan cifrado de volumen habilitado. Si un recurso no cumple con una regla, Config lo marca como "no conforme" y te notifica. Esto te permite identificar rápidamente posibles vulnerabilidades de seguridad o incumplimientos normativos. Puedes usar reglas predefinidas de AWS o escribir tus propias reglas personalizadas usando AWS Lambda. AWS Config es una herramienta poderosa para la gobernanza de la seguridad y el cumplimiento, dándote visibilidad y control sobre la configuración de tu infraestructura a lo largo del tiempo.
''',
    'code_example': r'''
// Ejemplo de cómo configurar una regla de AWS Config para asegurar que los buckets S3 no sean públicos.

// CORRECTO: Regla de AWS Config para detectar buckets S3 públicos.
// // Configuración de una regla de AWS Config en CloudFormation
// Resources:
//   S3BucketPublicReadProhibited:
//     Type: AWS::Config::ConfigRule
//     Properties:
//       ConfigRuleName: s3-bucket-public-read-prohibited
//       Description: Checks if S3 buckets are publicly readable.
//       Scope:
//         ComplianceResourceTypes:
//           - AWS::S3::Bucket
//       Source:
//         Owner: AWS # Una regla gestionada por AWS
//         SourceIdentifier: S3_BUCKET_PUBLIC_READ_PROHIBITED # Identificador de la regla predefinida
//         SourceDetails:
//           - EventSource: aws.config
//             MessageType: ConfigurationItemChangeNotification
//           - EventSource: aws.config
//             MessageType: OversizedConfigurationItemChangeNotification
//           - EventSource: aws.config
//             MessageType: ScheduledNotification
//             MaximumExecutionFrequency: TwentyFour_Hours # Frecuencia de evaluación
//
// INCORRECTO: No usar AWS Config o no definir reglas de seguridad básicas.
// No hay un "código incorrecto" como tal, sino la omisión de la configuración.
// Esto resultaría en una falta de visibilidad sobre los cambios de configuración y
// en la incapacidad de auditar y hacer cumplir las políticas de seguridad de forma automática.
//
// Un ejemplo sería:
// - Habilitar AWS Config pero no definir ninguna regla, perdiendo el beneficio de la auditoría de cumplimiento.
// - Depender de auditorías manuales o revisiones puntuales que no escalan con la infraestructura.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Seguridad Avanzada',
    'topic': 'Detección de Amenazas',
    'subtopic': 'Amazon Inspector',
    'definition': '''
Amazon Inspector es un servicio automatizado de evaluación de seguridad que te ayuda a mejorar la postura de seguridad y el cumplimiento de tus aplicaciones implementadas en AWS. Piensa en Inspector como un auditor de seguridad incansable que revisa tus sistemas y te alerta sobre vulnerabilidades y desviaciones de las mejores prácticas.

¿Qué lo hace tan valioso para una detección proactiva de riesgos?

Aquí te va la aclaración: Inspector funciona evaluando tus instancias EC2 y tus imágenes de contenedor (en ECR, por ejemplo) en busca de vulnerabilidades de software y configuraciones incorrectas. No se basa solo en un escaneo de puertos; utiliza una base de datos de vulnerabilidades conocidas (CVEs - Common Vulnerabilities and Exposures) y un conjunto de reglas de seguridad de AWS para identificar problemas. Por ejemplo, puede detectar si una instancia EC2 tiene paquetes de software obsoletos con vulnerabilidades conocidas, si los parches de seguridad no se han aplicado, o si una configuración de red permite el acceso no autorizado a puertos sensibles.

La magia de Inspector es su capacidad para automatizar las evaluaciones. Puedes configurar escaneos continuos o programados, y cuando Inspector encuentra un problema, genera un "hallazgo" detallado. Este hallazgo incluye una descripción de la vulnerabilidad, su nivel de severidad, una recomendación de remediación y referencias a la CVE o a la mejor práctica de seguridad de AWS. Esto te permite priorizar y corregir los problemas más críticos rápidamente. Inspector también puede evaluar la conformidad con estándares como el CIS Benchmarks o el estándar de seguridad de AWS, lo cual es fundamental para el cumplimiento normativo. Al integrar Inspector en tu flujo de trabajo de seguridad, puedes reducir significativamente la superficie de ataque de tus aplicaciones y mantener un alto nivel de seguridad.
''',
    'code_example': r'''
// Amazon Inspector se configura principalmente a través de la consola o AWS CLI.
// No hay un "código de aplicación" directo para Inspector, sino más bien configuraciones.

// CORRECTO: Habilitar Amazon Inspector y configurar un escaneo continuo de instancias EC2.
// // Comando AWS CLI para habilitar Inspector para EC2 (en la nueva versión de Inspector v2)
// aws inspector2 enable --resource-types EC2
//
// // Puedes configurar filtros para tus escaneos, por ejemplo, para un ambiente específico.
// // aws inspector2 create-filter --name "DevelopmentInstances" --description "Filter for Development EC2 instances" \
// //   --filter-criteria "resource-tags.Environment=Development" --action "NONE"
//
// // Los hallazgos de Inspector se pueden visualizar en la consola o exportar.
// // Para automatizar, puedes usar EventBridge para reaccionar a nuevos hallazgos.
// Resources:
//   InspectorFindingRule:
//     Type: AWS::Events::Rule
//     Properties:
//       Name: InspectorNewFindingsRule
//       Description: "Captures new critical Inspector findings"
//       EventBusName: default
//       EventPattern:
//         source:
//           - aws.inspector2
//         detail-type:
//           - Inspector2 Finding
//         detail:
//           severity:
//             - CRITICAL
//             - HIGH
//       Targets:
//         - Arn: !Ref SecurityAlertsSNS # ARN de tu tópico SNS para alertas de seguridad
//           Id: InspectorSNSTarget
//
//   SecurityAlertsSNS:
//     Type: AWS::SNS::Topic
//     Properties:
//       TopicName: SecurityAlerts
//
// INCORRECTO: Realizar escaneos de vulnerabilidades manuales e infrecuentes.
// No hay código para esto, ya que es la ausencia de automatización el problema.
// Esto significa que las nuevas vulnerabilidades en tu entorno podrían pasar desapercibidas
// durante largos períodos, aumentando el riesgo de un ataque.
//
// Un ejemplo sería:
// - No usar una herramienta automatizada como Inspector.
// - Depender de escaneos manuales realizados esporádicamente (ej. una vez al mes).
// - No tener un proceso para aplicar parches o corregir configuraciones automáticamente.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Seguridad Avanzada',
    'topic': 'Detección de Amenazas',
    'subtopic': 'AWS Security Hub',
    'definition': '''
AWS Security Hub es un servicio que te ofrece una vista integral de la postura de seguridad de tu cuenta de AWS. Piensa en Security Hub como tu centro de comando unificado para la seguridad en la nube: consolida, prioriza y te ayuda a tomar acción sobre los hallazgos de seguridad de múltiples servicios de AWS y de socios.

¿Cómo te ayuda a no perderte en un mar de alertas de seguridad?

Aquí te va la aclaración: A medida que tu entorno AWS crece, también lo hace el número de servicios de seguridad que utilizas (GuardDuty, Inspector, Config, etc.). Cada uno de estos servicios genera sus propios "hallazgos" o alertas. El problema es que gestionar y correlacionar todas estas alertas de diferentes fuentes puede ser abrumador y llevar a que se pasen por alto amenazas críticas. Security Hub resuelve esto al actuar como un agregador: recolecta los hallazgos de todos esos servicios (y también de socios de seguridad de AWS), los normaliza a un formato estándar (AWS Security Finding Format - ASFF), y los presenta en un solo panel.

Además de agregar, Security Hub te ayuda a priorizar. Evalúa continuamente tu entorno con respecto a estándares de la industria (como el CIS AWS Foundations Benchmark) y las mejores prácticas de AWS, dándote puntuaciones de seguridad y recomendaciones accionables. Si GuardDuty detecta actividad maliciosa, Inspector encuentra una vulnerabilidad y Config identifica una configuración incorrecta, Security Hub te mostrará todo esto en un solo lugar, correlacionado y con un nivel de severidad unificado. Esto te permite tener una visibilidad completa de tu postura de seguridad, identificar rápidamente los problemas más críticos, y automatizar respuestas a través de integraciones con Amazon EventBridge o AWS Systems Manager. Security Hub es esencial para la gestión de la seguridad a escala, convirtiendo un montón de datos dispares en inteligencia de seguridad accionable.
''',
    'code_example': r'''
// AWS Security Hub se habilita y gestiona a través de la consola o AWS CLI.
// Su valor principal es la agregación y visualización, y su integración con otros servicios.

// CORRECTO: Habilitar Security Hub y configurar una regla de EventBridge para nuevos hallazgos de alta severidad.
// // Comando AWS CLI para habilitar Security Hub
// aws securityhub enable-security-hub --enable-default-standards
//
// // Se puede configurar la integración con otros servicios (GuardDuty, Inspector, Config)
// // automáticamente o manualmente.
//
// // Ejemplo de CloudFormation para una regla de EventBridge que captura hallazgos de Security Hub
// Resources:
//   SecurityHubCriticalFindingRule:
//     Type: AWS::Events::Rule
//     Properties:
//       Name: SecurityHubCriticalFindingsToNotification
//       Description: "Route critical Security Hub findings to a notification system"
//       EventBusName: default
//       EventPattern:
//         source:
//           - aws.securityhub
//         detail-type:
//           - Security Hub Findings - Imported
//         detail:
//           findings:
//             - Severity:
//                 Label:
//                   - CRITICAL
//                   - HIGH
//       Targets:
//         - Arn: !Ref SecurityAlertsSNS # ARN de tu tópico SNS para alertas de seguridad
//           Id: SecurityHubSNSTarget
//
//   SecurityAlertsSNS:
//     Type: AWS::SNS::Topic
//     Properties:
//       TopicName: AllCriticalSecurityAlerts
//
// INCORRECTO: No usar un agregador de hallazgos de seguridad.
// No hay código para esto, ya que es la ausencia de una solución centralizada el problema.
// Esto llevaría a la "fatiga de alertas" y a que los equipos de seguridad tengan que revisar
// múltiples consolas y logs para obtener una visión completa de la postura de seguridad,
// aumentando el tiempo de respuesta ante incidentes.
//
// Un ejemplo sería:
// - Cada equipo revisa los hallazgos solo en sus propios servicios (GuardDuty, Inspector, etc.).
// - No hay una vista consolidada de los riesgos globales de la cuenta.
// - La correlación de eventos entre diferentes servicios se realiza manualmente.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Seguridad Avanzada',
    'topic': 'Compliance',
    'subtopic': 'AWS Artifact',
    'definition': '''
AWS Artifact es tu portal de acceso a los informes de conformidad y seguridad de AWS, así como a acuerdos clave relacionados con el cumplimiento normativo y la seguridad de datos. Piensa en AWS Artifact como la biblioteca central donde puedes encontrar toda la documentación que necesitas para demostrar que tu uso de AWS cumple con diversos estándares.

¿Qué tan crucial es esta herramienta para auditorías y requisitos de cumplimiento?

Aquí te va la aclaración: Cuando trabajas con datos sensibles o en industrias reguladas (como finanzas, salud o gobierno), no solo es importante que AWS cumpla con ciertos estándares de seguridad y privacidad, sino que tú también debes demostrar que tu aplicación y tu configuración en AWS cumplen con ellos. AWS Artifact simplifica este proceso. En lugar de buscar informes en diferentes lugares, puedes descargarlos directamente desde aquí. Esto incluye informes de auditoría de terceros (como SOC 1, SOC 2, SOC 3, PCI DSS, ISO 27001, HIPAA, GDPR), que demuestran que AWS cumple con los controles de seguridad y cumplimiento en su infraestructura.

Además de los informes, en Artifact también encontrarás acuerdos de cumplimiento específicos que puedes necesitar firmar con AWS, como el Business Associate Addendum (BAA) para HIPAA, si estás manejando información de salud protegida (PHI). Tener acceso fácil a estos documentos es vital para tus propias auditorías internas y externas, ya que te permite proporcionar la evidencia necesaria a tus auditores o reguladores. AWS Artifact es una pieza fundamental para la gobernanza y el cumplimiento en la nube, ahorrándote tiempo y esfuerzo en la recolección de pruebas de conformidad, y ayudándote a construir confianza con tus clientes y socios al demostrar un compromiso sólido con la seguridad y la privacidad.
''',
    'code_example': r'''
// AWS Artifact es un servicio basado en la consola de AWS. No hay código de aplicación directo
// para interactuar con él, ya que su propósito es proporcionar documentos para descarga.

// CORRECTO: Acceder a AWS Artifact a través de la consola para descargar informes de cumplimiento.
// No hay un snippet de código real, pero la acción es:
// 1. Iniciar sesión en la Consola de AWS.
// 2. Navegar a "AWS Artifact".
// 3. Seleccionar la pestaña "Informes" o "Acuerdos".
// 4. Buscar el informe/acuerdo deseado (ej. "SOC 2 Type II", "PCI DSS AOC", "HIPAA BAA").
// 5. Descargar el documento.
//
// Es un proceso manual o parte de los procedimientos de auditoría de tu organización.
//
// INCORRECTO: No usar AWS Artifact y no tener acceso a la documentación de cumplimiento de AWS.
// No hay código para esto, ya que es la ausencia de acción la que es incorrecta.
// Esto podría resultar en:
// - Dificultad para demostrar el cumplimiento en auditorías.
// - Incumplimiento de requisitos regulatorios que exigen acceso a estos informes.
// - Pérdida de tiempo buscando documentos dispersos o desactualizados.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Seguridad Avanzada',
    'topic': 'Compliance',
    'subtopic': 'CIS AWS Foundations Benchmark',
    'definition': '''
El CIS AWS Foundations Benchmark es un conjunto de mejores prácticas de seguridad, universalmente reconocidas, diseñadas para ayudarte a proteger tu cuenta de AWS. Piensa en él como una lista de verificación de "seguridad básica pero crucial" para tu infraestructura en la nube, recomendada por el Center for Internet Security (CIS).

¿Por qué es este benchmark un excelente punto de partida para cualquier estrategia de seguridad en AWS?

Aquí te va la aclaración: Cuando empiezas en AWS, o incluso si ya llevas un tiempo, es fácil pasar por alto configuraciones de seguridad críticas. El CIS AWS Foundations Benchmark aborda esto proporcionando recomendaciones claras y accionables en áreas clave como IAM, logging y monitoreo, redes y almacenamiento. Por ejemplo, te recomendará:
* **IAM:** Asegurarte de que no haya usuarios root con claves de acceso activas, habilitar MFA para todos los usuarios, rotar las claves de acceso regularmente.
* **Logging y Monitoreo:** Habilitar CloudTrail para registrar la actividad de la API, configurar alarmas para actividades inusuales, y centralizar los logs.
* **Redes:** Restringir el acceso a puertos de administración (SSH/RDP) solo a rangos de IP específicos.
* **Almacenamiento:** Asegurarte de que los buckets S3 no sean públicos.

Lo importante es que estas son directrices prácticas, no teóricas. Puedes usar herramientas como AWS Security Hub o AWS Config para evaluar automáticamente tu cuenta frente a este benchmark, identificar desviaciones y recibir recomendaciones para corregirlas. Seguir estas recomendaciones no solo fortalece significativamente la seguridad de tu entorno, sino que también es un requisito común o una base para cumplir con otros estándares de cumplimiento más complejos. Adoptar el CIS AWS Foundations Benchmark es una de las primeras y más importantes acciones que puedes tomar para asegurar tu infraestructura en la nube.
''',
    'code_example': r'''
// El CIS AWS Foundations Benchmark se aplica mediante la configuración de servicios de AWS.
// AWS Security Hub puede evaluar automáticamente tu cuenta contra este estándar.

// CORRECTO: Habilitar el estándar CIS AWS Foundations Benchmark en Security Hub.
// Esto se hace a través de la consola de Security Hub o AWS CLI.
// // Comando AWS CLI para habilitar Security Hub y el estándar CIS.
// // Nota: 'enable-security-hub' por defecto habilita los estándares de seguridad predeterminados,
// // incluyendo el CIS AWS Foundations Benchmark.
// aws securityhub enable-security-hub --enable-default-standards
//
// // Para verificar el cumplimiento en la consola, navega a Security Hub -> Security standards -> CIS AWS Foundations Benchmark.
// // Aquí verás una lista de controles y si tu cuenta es conforme o no.
//
// // Ejemplo de una regla de AWS Config que podría ser parte del cumplimiento de CIS:
// // s3-bucket-public-read-prohibited
// // (ya visto en el subtopic de AWS Config)
// Resources:
//   S3BucketPublicReadProhibitedRule:
//     Type: AWS::Config::ConfigRule
//     Properties:
//       ConfigRuleName: s3-bucket-public-read-prohibited
//       Description: "Checks if S3 buckets are publicly readable. (CIS 2.1)"
//       Scope:
//         ComplianceResourceTypes: ["AWS::S3::Bucket"]
//       Source:
//         Owner: AWS
//         SourceIdentifier: S3_BUCKET_PUBLIC_READ_PROHIBITED
//
// INCORRECTO: Ignorar el CIS AWS Foundations Benchmark y no aplicar sus recomendaciones.
// No hay código para esto, ya que es la omisión de la aplicación de estas mejores prácticas.
// Esto resultaría en una cuenta de AWS con configuraciones inseguras y vulnerabilidades
// comunes, aumentando el riesgo de un incidente de seguridad.
//
// Un ejemplo sería:
// - Dejar el usuario root con claves de acceso activas.
// - No habilitar la autenticación multifactor (MFA) para usuarios privilegiados.
// - Tener grupos de seguridad que permiten acceso SSH/RDP desde cualquier IP (0.0.0.0/0).
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Seguridad Avanzada',
    'topic': 'Compliance',
    'subtopic': 'PCI DSS compliance',
    'definition': '''
La conformidad con PCI DSS (Payment Card Industry Data Security Standard) es un conjunto de requisitos de seguridad obligatorios para cualquier organización que almacene, procese o transmita datos de titulares de tarjetas de crédito. Piensa en PCI DSS como un conjunto de reglas muy estrictas que debes seguir si quieres manejar tarjetas de crédito de forma segura.

¿Por qué es esto tan crítico para cualquier negocio que maneje pagos con tarjeta?

Aquí te va la aclaración: Si tu empresa acepta pagos con tarjetas de crédito, entonces estás obligado a cumplir con PCI DSS. No es algo opcional; es un estándar global que busca proteger la información sensible de los titulares de tarjetas. PCI DSS no es solo una lista de verificación técnica, sino un marco completo que abarca la seguridad de la red, la protección de datos de titulares de tarjetas, la gestión de vulnerabilidades, la implementación de medidas de control de acceso sólidas, el monitoreo y las pruebas regulares de las redes, y el mantenimiento de una política de seguridad de la información. Por ejemplo, te exige:
* Construir y mantener una red segura con firewalls.
* Proteger los datos de los titulares de tarjetas (cifrándolos).
* Mantener un programa de gestión de vulnerabilidades.
* Implementar fuertes medidas de control de acceso.
* Monitorear y probar regularmente las redes.
* Mantener una política de seguridad de la información.

AWS, como proveedor de la infraestructura, es compatible con PCI DSS y tiene sus propias certificaciones (disponibles en AWS Artifact). Sin embargo, tú, como usuario de AWS, eres responsable del "cumplimiento compartido". Esto significa que AWS se encarga de la seguridad "de la nube" (la infraestructura subyacente), y tú eres responsable de la seguridad "en la nube" (tus aplicaciones, datos, configuraciones, sistemas operativos, etc.). Para lograr la conformidad con PCI DSS en AWS, debes diseñar tu arquitectura, configurar tus servicios y operar tus sistemas de acuerdo con los 12 requisitos de PCI DSS, utilizando los servicios de seguridad de AWS (como VPC, Security Groups, KMS, CloudTrail, etc.) para ayudarte a cumplir con esos controles. Es un esfuerzo continuo que requiere un compromiso total con la seguridad.
''',
    'code_example': r'''
// PCI DSS es un estándar amplio que afecta a toda tu arquitectura y procesos.
// No se traduce directamente en un único fragmento de código, sino en la aplicación de
// múltiples controles de seguridad en toda tu infraestructura AWS.

// CORRECTO: Ejemplo de un control que contribuye a PCI DSS: Cifrado de datos en reposo (Requisito 3).
// // Configuración de un volumen EBS cifrado con KMS para una instancia EC2.
// // Esto ayuda a cumplir el requisito de proteger los datos de titulares de tarjetas en reposo.
// Resources:
//   MyPCICompliantEC2Instance:
//     Type: AWS::EC2::Instance
//     Properties:
//       ImageId: ami-0abcdef1234567890
//       InstanceType: t3.medium
//       BlockDeviceMappings:
//         - DeviceName: /dev/sda1
//           Ebs:
//             VolumeSize: 30
//             Encrypted: true # Habilitar cifrado del volumen
//             KmsKeyId: arn:aws:kms:us-east-1:123456789012:key/your-cmk-for-pci # Usar una CMK gestionada
//       Tags:
//         - Key: PCI-Scope
//           Value: Yes
//
// // Otro ejemplo: Grupo de Seguridad restringido (Requisito 1 - Firewall)
// // Permitir solo tráfico necesario para la aplicación.
//   MyPCICompliantSecurityGroup:
//     Type: AWS::EC2::SecurityGroup
//     Properties:
//       GroupDescription: Security group for PCI compliant application
//       VpcId: !Ref MyVPC
//       SecurityGroupIngress:
//         - IpProtocol: tcp
//           FromPort: 443
//           ToPort: 443
//           CidrIp: 0.0.0.0/0 # Solo para HTTPS público
//         - IpProtocol: tcp
//           FromPort: 22
//           ToPort: 22
//           CidrIp: 192.168.1.0/24 # Acceso SSH restringido a la red interna
//
// INCORRECTO: No implementar controles de seguridad o tener datos de tarjeta sin cifrar.
// No hay código para esto, ya que es la ausencia de los controles requeridos por PCI DSS.
// Esto resultaría en un incumplimiento de PCI DSS, lo que puede llevar a multas,
// pérdida de la capacidad de procesar pagos con tarjeta, y daños a la reputación.
//
// Un ejemplo sería:
// - Almacenar números de tarjetas de crédito sin cifrar en una base de datos.
// - Tener una base de datos con datos de tarjetas accesible públicamente.
// - No tener un registro de auditoría de quién accede a los datos sensibles.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Seguridad Avanzada',
    'topic': 'Compliance',
    'subtopic': 'HIPAA compliance',
    'definition': '''
La conformidad con HIPAA (Health Insurance Portability and Accountability Act) es un requisito legal en Estados Unidos para cualquier entidad que maneje Información de Salud Protegida (PHI), como hospitales, clínicas, aseguradoras de salud y sus asociados de negocio. Piensa en HIPAA como un marco legal estricto diseñado para proteger la privacidad y la seguridad de los datos de salud de los pacientes.

¿Por qué es absolutamente crucial para cualquier organización en el sector de la salud?

Aquí te va la aclaración: Si tu aplicación o servicio maneja cualquier tipo de información de salud de pacientes (registros médicos, historial de tratamientos, datos de facturación médica, etc.), entonces estás sujeto a HIPAA. Incumplir con HIPAA puede resultar en multas masivas, demandas legales y un daño severo a la reputación. HIPAA no es solo un conjunto de reglas técnicas; es una ley compleja que abarca salvaguardias administrativas, físicas y técnicas. Por ejemplo, te exige:
* **Salvaguardias Técnicas:** Cifrar la PHI en reposo y en tránsito, implementar controles de acceso, usar auditorías de seguridad, y proteger la integridad de los datos.
* **Salvaguardias Físicas:** Proteger las instalaciones y los equipos que almacenan PHI.
* **Salvaguardias Administrativas:** Designar un responsable de seguridad y privacidad, implementar políticas y procedimientos de seguridad, y realizar evaluaciones de riesgo regulares.

AWS, como proveedor de la infraestructura, es compatible con HIPAA y ofrece un Business Associate Addendum (BAA) que puedes firmar con ellos (disponible en AWS Artifact). Sin embargo, al igual que con PCI DSS, la responsabilidad de cumplimiento es compartida: AWS es responsable de la seguridad "de la nube", y tú eres responsable de la seguridad "en la nube". Esto significa que debes diseñar tu arquitectura, configurar tus servicios y operar tus aplicaciones de manera que cumplan con todos los requisitos de HIPAA. Esto incluye el uso de servicios que admitan HIPAA (como EC2, S3, RDS, DynamoDB, Lambda, KMS, GuardDuty, CloudTrail, etc.) y asegurarte de configurarlos adecuadamente para proteger la PHI, como cifrar todos los datos sensibles, usar redes privadas y restringir el acceso solo a personal autorizado. Es un compromiso serio que requiere una comprensión profunda y una implementación rigurosa de las medidas de seguridad.
''',
    'code_example': r'''
// HIPAA es un estándar legal que impacta profundamente el diseño arquitectónico y las operaciones.
// Se cumple a través de la aplicación de múltiples controles técnicos y de procesos.

// CORRECTO: Ejemplo de un control que contribuye a HIPAA: Cifrado de datos en reposo y en tránsito.
// // Configuración de una base de datos RDS MySQL con cifrado en reposo y conexiones SSL/TLS (encriptación en tránsito).
// // Esto es crucial para proteger la PHI.
// Resources:
//   MyHIPAACompliantRDS:
//     Type: AWS::RDS::DBInstance
//     Properties:
//       DBInstanceIdentifier: hipaa-db-instance
//       AllocatedStorage: '20'
//       DBInstanceClass: db.t3.medium
//       Engine: mysql
//       EngineVersion: '8.0'
//       MasterUsername: admin
//       MasterUserPassword: 'MySecurePassword123!' # En producción, usar AWS Secrets Manager
//       DBSubnetGroupName: !Ref MyDBSubnetGroup
//       VPCSecurityGroups: [!Ref MyDBAccessSecurityGroup]
//       StorageEncrypted: true # Habilitar cifrado en reposo
//       KmsKeyId: arn:aws:kms:us-east-1:123456789012:key/your-hipaa-cmk # Usar una CMK dedicada
//       PubliclyAccessible: false # IMPRESCINDIBLE: No accesible públicamente
//       # Para encriptación en tránsito: Forzar SSL/TLS en la conexión a la base de datos
//       # Esto se hace en la configuración de la base de datos y la aplicación cliente.
//       # En MySQL, por ejemplo, puedes configurar require_secure_transport=ON en el grupo de parámetros.
//
// // Ejemplo de un bucket S3 con cifrado y restricción de acceso para PHI.
// Resources:
//   MyHIPAACompliantS3Bucket:
//     Type: AWS::S3::Bucket
//     Properties:
//       BucketName: my-hipaa-phi-data
//       PublicAccessBlockConfiguration: # Bloquear acceso público (esencial para HIPAA)
//         BlockPublicAcls: true
//         BlockPublicPolicy: true
//         IgnorePublicAcls: true
//         RestrictPublicBuckets: true
//       BucketEncryption: # Cifrado en reposo (esencial para HIPAA)
//         ServerSideEncryptionConfiguration:
//           - ServerSideEncryptionByDefault:
//               SSEAlgorithm: aws:kms
//               KMSMasterKeyID: arn:aws:kms:us-east-1:123456789012:key/your-hipaa-cmk
//       VersioningConfiguration: # Habilitar versionado para recuperación de datos
//         Status: Enabled
//
// INCORRECTO: Manejar PHI sin cifrado, sin control de acceso o sin un BAA con AWS.
// No hay código para esto, ya que es la ausencia de los controles requeridos por HIPAA.
// Esto resultaría en un incumplimiento de HIPAA, con graves consecuencias legales y económicas.
//
// Un ejemplo sería:
// - Almacenar PHI en un bucket S3 sin cifrar o accesible públicamente.
// - Tener una base de datos con PHI sin cifrado o sin forzar conexiones seguras.
// - No firmar el BAA con AWS antes de procesar PHI.
'''
  });
}

Future<void> insertMidLevel3AwsData(Database db) async {
  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Contenedores y Serverless',
    'topic': 'Amazon ECS',
    'subtopic': 'Conceptos de ECS',
    'definition': '''
Amazon Elastic Container Service (ECS) es un servicio de orquestación de contenedores altamente escalable y de alto rendimiento que soporta contenedores Docker. Básicamente, ECS te permite ejecutar, detener y gestionar contenedores en un clúster de servidores de AWS, sin que tengas que preocuparte por la infraestructura subyacente que los soporta.

¿Te estás preguntando por qué esto importa y cómo te facilita la vida con los contenedores?

Aquí te va la aclaración: Pensemos en un escenario donde tienes una aplicación grande dividida en microservicios, y cada microservicio está empaquetado en un contenedor Docker. Sin un orquestador, tendrías que gestionar dónde se ejecuta cada contenedor, cómo se comunican entre sí, cómo se escalan, y qué hacer si uno falla. Es un dolor de cabeza. ECS entra aquí como tu director de orquesta. Te permite definir qué contenedores necesitas ejecutar, cuántas copias de cada uno, y cómo deben estar conectados, y luego ECS se encarga de todo el trabajo pesado. Se encarga de lanzar las instancias EC2 (si usas el tipo de lanzamiento EC2) o de usar Fargate (si prefieres la opción serverless donde AWS gestiona los servidores por completo) y de colocar tus contenedores de manera eficiente.

Los componentes principales de ECS incluyen:
* **Tasks (Tareas):** Una tarea es una instancia de una definición de tarea. Es la unidad de trabajo mínima en ECS, que puede contener uno o más contenedores.
* **Task Definitions (Definiciones de Tarea):** Son como los planos de tu aplicación en contenedor. Aquí describes qué imágenes de Docker usar, cuánta CPU y memoria necesita cada contenedor, qué puertos expone, y cómo se enlazan.
* **Services (Servicios):** Un servicio de ECS mantiene un número deseado de tareas ejecutándose simultáneamente en un clúster. Si una tarea falla o se detiene, el servicio lanza otra automáticamente. También puede integrarse con Elastic Load Balancing (ELB) para distribuir el tráfico a tus contenedores.
* **Clusters (Clústeres):** Un clúster de ECS es un grupo lógico de instancias EC2 o Fargate donde se ejecutan tus tareas y servicios.

Con ECS, te olvidas de las complejidades de Kubernetes si lo prefieres, y obtienes una integración nativa y profunda con otros servicios de AWS. Te permite centrarte en escribir tu código y en empaquetarlo en contenedores, dejando que AWS gestione la infraestructura de orquestación. Es una opción muy potente para desplegar y escalar aplicaciones en contenedores en la nube de forma eficiente.
''',
    'code_example': r'''
// Los conceptos de ECS son la base de su funcionamiento. No hay un "código de concepto" per se,
// pero el siguiente ejemplo ilustra cómo se interconectan algunos componentes.

// CORRECTO: Arquitectura conceptual de un despliegue ECS.
// No es un código ejecutable, sino un pseudocódigo o una representación de la infraestructura.
// // Paso 1: Crear un Cluster ECS (grupo de servidores o capacidad de Fargate)
// // aws ecs create-cluster --cluster-name MyWebAppCluster
//
// // Paso 2: Definir una Task Definition (el plano de tu contenedor)
// // JSON de la definición de tarea (ver subtopic "Task Definitions" para más detalles)
// /*
// {
//   "family": "my-web-app",
//   "cpu": "256",
//   "memory": "512",
//   "networkMode": "awsvpc",
//   "containerDefinitions": [
//     {
//       "name": "web",
//       "image": "my-docker-repo/my-web-app:latest",
//       "portMappings": [
//         {
//           "containerPort": 80,
//           "hostPort": 80
//         }
//       ]
//     }
//   ]
// }
// */
// // aws ecs register-task-definition --cli-input-json file://my-web-app-task-definition.json
//
// // Paso 3: Crear un Servicio ECS (para mantener las tareas ejecutándose y escalar)
// // aws ecs create-service --cluster MyWebAppCluster \
// //   --service-name MyWebAppService \
// //   --task-definition my-web-app \
// //   --desired-count 3 \ // Mantener 3 copias de la tarea
// //   --launch-type FARGATE \ // O EC2
// //   --network-configuration "awsvpcConfiguration={subnets=[subnet-xxxx,subnet-yyyy],securityGroups=[sg-zzzz]}" \
// //   --load-balancers "loadBalancerName=my-app-alb,containerName=web,containerPort=80"
//
// // Paso 4: (Opcional) Configurar Auto Scaling para el servicio
// // aws application-autoscaling register-scalable-target ...
// // aws application-autoscaling put-scaling-policy ...
//
// INCORRECTO: Gestionar contenedores manualmente en instancias EC2 individuales sin un orquestador.
// // Lanzar una instancia EC2 y luego instalar Docker e iniciar contenedores manualmente.
// // Esto es muy difícil de escalar, gestionar y recuperar de fallos.
// //
// // aws ec2 run-instances --image-id ami-xxxx --instance-type t3.medium
// //
// // // Después de SSH:
// // // sudo yum install docker -y
// // // sudo systemctl start docker
// // // sudo docker run -d -p 80:80 my-docker-repo/my-web-app:latest
// // //
// // // Para escalar, habría que repetir el proceso en nuevas instancias.
// // // Para manejar fallos, habría que monitorear manualmente y reiniciar.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Contenedores y Serverless',
    'topic': 'Amazon ECS',
    'subtopic': 'Task Definitions',
    'definition': '''
Una "Task Definition" en Amazon ECS es, de forma sencilla, un plano de cómo se ejecutará tu aplicación en contenedores. Es el equivalente a un archivo `docker-compose.yml` o un manifiesto de Kubernetes, pero diseñado específicamente para ECS. Aquí es donde describes los detalles de uno o más contenedores que forman tu aplicación.

Seguramente pensarás de qué va todo esto y por qué es tan importante.

Aquí te va la aclaración: Pensemos en una receta de cocina. Una Task Definition es como esa receta para tu aplicación. En ella, especificas qué "ingredientes" (imágenes de Docker) necesitas, cuánta "energía" (CPU) y "espacio" (memoria) requiere cada uno, qué "puertas" (puertos) deben estar abiertas, y cómo se comportarán juntos. Por ejemplo, si tienes una aplicación web que consiste en un contenedor Nginx y un contenedor Node.js, tu Task Definition describiría ambos:
* **`containerDefinitions`**: Aquí es donde detallas cada contenedor. Para Nginx, especificarías la imagen `nginx:latest`, los mapeos de puertos (ej. 80 para HTTP). Para Node.js, su imagen, cuánta CPU y memoria reservar, y quizás variables de entorno como la conexión a la base de datos.
* **`cpu` y `memory`**: Estos campos definen los recursos totales que la tarea necesita. Puedes asignarlos a nivel de tarea o a nivel de contenedor.
* **`networkMode`**: Cómo se maneja la red para los contenedores dentro de la tarea. `awsvpc` es el más común y recomendado, ya que le da a cada tarea su propia interfaz de red ENI, integrándose mejor con Security Groups y VPC.
* **`family`**: Un nombre único para tu Task Definition, permitiéndote tener múltiples revisiones de la misma definición. Cada vez que actualizas una Task Definition, ECS crea una nueva revisión.

Las Task Definitions son inmutables una vez que se registran. Si necesitas cambiar algo (ej. una nueva versión de la imagen Docker), registras una nueva revisión. Esto es genial porque te permite tener un control de versiones de la configuración de tu aplicación. Es el punto de partida para desplegar cualquier cosa en ECS, y definirla correctamente es clave para el rendimiento y la estabilidad de tus contenedores.
''',
    'code_example': r'''
// Ejemplo de un archivo JSON que representa una Task Definition para una aplicación web simple.

// CORRECTO: Definición de una tarea ECS para una aplicación web con un solo contenedor.
// {
//   "family": "my-web-app-family", // Nombre de la familia de la Task Definition
//   "networkMode": "awsvpc",      // Modo de red recomendado para Fargate y EC2
//   "cpu": "256",                 // 0.25 vCPU
//   "memory": "512",              // 512MB de RAM
//   "executionRoleArn": "arn:aws:iam::123456789012:role/ecsTaskExecutionRole", // Rol para que ECS pueda lanzar la tarea
//   "containerDefinitions": [
//     {
//       "name": "web-container", // Nombre del contenedor
//       "image": "nginx:latest",   // Imagen Docker a usar
//       "cpu": 256,                // CPU asignada a este contenedor
//       "memory": 512,             // Memoria asignada a este contenedor
//       "essential": true,         // Si este contenedor falla, toda la tarea se considera fallida
//       "portMappings": [
//         {
//           "containerPort": 80,   // Puerto expuesto por el contenedor
//           "protocol": "tcp"
//           // Con awsvpc, no se necesita hostPort, el tráfico se mapea directamente al ENI de la tarea
//         }
//       ],
//       "environment": [          // Variables de entorno para el contenedor
//         {
//           "name": "APP_ENV",
//           "value": "production"
//         }
//       ],
//       "logConfiguration": {
//         "logDriver": "awslogs",
//         "options": {
//           "awslogs-group": "/ecs/my-web-app-logs", // Grupo de logs en CloudWatch
//           "awslogs-region": "us-east-1",
//           "awslogs-stream-prefix": "ecs"
//         }
//       }
//     }
//   ]
// }
//
// INCORRECTO: Definición de tarea con recursos insuficientes o sin puertos mapeados para una aplicación web.
// // Una Task Definition que asigna muy poca CPU/memoria o no expone los puertos necesarios.
// {
//   "family": "my-broken-app",
//   "networkMode": "awsvpc",
//   "cpu": "64",     // Muy poca CPU
//   "memory": "128",   // Muy poca memoria
//   "containerDefinitions": [
//     {
//       "name": "web-container",
//       "image": "my-web-app-image:latest",
//       // No hay portMappings aquí, la aplicación no sería accesible
//       "essential": true
//     }
//   ]
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Contenedores y Serverless',
    'topic': 'Amazon ECS',
    'subtopic': 'ECS Clusters',
    'definition': r'''
Un "ECS Cluster" (Clúster de ECS) es una agrupación lógica de recursos en la que ejecutas tus tareas y servicios de Amazon ECS. Es, por decirlo de alguna manera, el "estacionamiento" donde tus contenedores toman vida y operan, y donde ECS orquesta su funcionamiento.

¿Te estás preguntando por qué necesitamos un clúster y cómo facilita la gestión de nuestros contenedores?

Aquí te va la aclaración: Pensemos en un centro de datos. Un clúster de ECS es tu centro de datos virtual para contenedores. No es un servidor físico, sino un concepto abstracto que agrupa la capacidad de computación necesaria para tus contenedores. Esta capacidad puede provenir de dos tipos principales de lanzamiento:
* **Tipo de lanzamiento EC2:** En este modo, tú gestionas las instancias EC2 que forman el clúster. ECS se encarga de orquestar los contenedores en esas instancias, pero tú eres responsable de la gestión de las EC2 (parches, escalado de las instancias).
* **Tipo de lanzamiento AWS Fargate:** Esta es la opción serverless. Aquí, AWS gestiona la capacidad de computación por completo. Tú solo especificas la CPU y memoria que necesita tu tarea, y Fargate lanza y gestiona las máquinas virtuales subyacentes. Es mucho más sencillo de operar porque te abstrae de toda la infraestructura.

La elección del tipo de lanzamiento depende de tus necesidades: Fargate es ideal si quieres la máxima abstracción y no quieres gestionar servidores, mientras que EC2 te da más control si necesitas configuraciones de red o software específico en tus instancias. Un clúster de ECS te permite tener un punto de control centralizado para tus despliegues de contenedores. Puedes tener múltiples servicios y tareas ejecutándose en el mismo clúster, lo que mejora la utilización de recursos y simplifica la administración. Además, es dentro del clúster donde se aplican las políticas de escalado y donde se monitorea el estado de tus contenedores. Es el lienzo sobre el cual ECS despliega y mantiene tu aplicación en contenedores.
''',
    'code_example': r'''
// Crear un cluster ECS es el primer paso antes de desplegar cualquier tarea o servicio.

// CORRECTO: Creación de un cluster ECS (sin tipo de lanzamiento específico al inicio).
// Este cluster luego podrá ser usado con tareas de tipo Fargate o con instancias EC2 registradas.
// // Comando AWS CLI para crear un cluster ECS simple
// aws ecs create-cluster --cluster-name MyProductionCluster
//
// // Ejemplo de CloudFormation para un cluster ECS y un grupo de Auto Scaling para instancias EC2 (ECS Managed)
// Resources:
//   MyECSCluster:
//     Type: AWS::ECS::Cluster
//     Properties:
//       ClusterName: MyEC2BasedECSCluster
//
//   # Opcional: Grupo de Auto Scaling para las instancias EC2 que se registrarán en el cluster
//   MyEC2AutoScalingGroup:
//     Type: AWS::AutoScaling::AutoScalingGroup
//     Properties:
//       AutoScalingGroupName: MyECSContainerInstances
//       LaunchConfigurationName: !Ref MyEC2LaunchConfig
//       MinSize: '2'
//       MaxSize: '5'
//       VPCZoneIdentifier:
//         - subnet-aaaaa
//         - subnet-bbbbb
//       Tags:
//         - Key: Name
//           Value: !Sub ${AWS::StackName}-ECS-Instance
//         - Key: !Sub "ecs.cluster.name" # Etiqueta requerida para que las instancias se registren en el cluster
//           Value: !Ref MyECSCluster
//
//   MyEC2LaunchConfig:
//     Type: AWS::AutoScaling::LaunchConfiguration
//     Properties:
//       ImageId: ami-0abcdef1234567890 # AMI optimizada para ECS (Amazon Linux 2 con ECS Agent)
//       InstanceType: t3.medium
//       IamInstanceProfile: !Ref EC2InstanceProfile # Rol IAM para que la instancia se una al cluster
//       SecurityGroups: [!Ref ECSInstanceSecurityGroup]
//       UserData: # Script para configurar el agente ECS para unirse al cluster
//         Fn::Base64: !Sub |
//           #!/bin/bash
//           echo ECS_CLUSTER=${MyECSCluster} >> /etc/ecs/ecs.config
//           sudo yum install -y ecs-init
//           sudo service docker start
//           sudo start ecs
//
// INCORRECTO: Intentar ejecutar tareas de ECS sin un cluster definido.
// No hay un "código incorrecto" real para esto, porque la API de ECS te lo impediría.
// Simplemente, las tareas y servicios ECS necesitan un cluster para existir.
// Intentar desplegar sin un cluster es como intentar construir una casa sin terreno.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Contenedores y Serverless',
    'topic': 'Amazon ECS',
    'subtopic': 'Service Auto Scaling',
    'definition': '''
Service Auto Scaling en Amazon ECS es la capacidad de tus servicios de contenedores para ajustar automáticamente el número de tareas (y por ende, la capacidad de tus aplicaciones) en respuesta a la demanda. Es como tener un equipo que, de forma autónoma, añade o quita "cocineros" a tu restaurante de microservicios según cuántos clientes lleguen.

¿Por qué es esto fundamental para la eficiencia y el rendimiento de tus aplicaciones en la nube?

Aquí te va la aclaración: Pensemos en una aplicación de comercio electrónico durante el Black Friday. El tráfico se dispara, y si tu aplicación no escala, tus usuarios experimentarán lentitud o errores. Después del evento, el tráfico vuelve a la normalidad, y si mantienes muchos recursos, estarás pagando de más. Service Auto Scaling resuelve esto. Te permite definir políticas que automáticamente aumentan o disminuyen el número de tareas para un servicio ECS basándose en métricas.

Las métricas más comunes para escalar incluyen:
* **Uso de CPU promedio:** Si el uso de CPU de tus tareas supera un umbral (ej. 70%), se añaden más tareas.
* **Uso de memoria promedio:** Similar a la CPU.
* **Conexiones de balanceador de carga:** Si hay un número excesivo de conexiones activas en tu ALB, ECS puede añadir más tareas para manejar la carga.
* **Métricas personalizadas:** Puedes definir tus propias métricas en CloudWatch (ej. mensajes en una cola SQS, transacciones por segundo) y usar Service Auto Scaling para reaccionar a ellas.

Puedes configurar diferentes tipos de políticas de escalado:
* **Target Tracking Scaling:** La más recomendada. Mantienes una métrica en un valor objetivo (ej. mantener la CPU al 50%).
* **Step Scaling:** Ajusta la capacidad en pasos predefinidos en respuesta a una métrica que cruza un umbral.
* **Scheduled Scaling:** Escala en base a un horario predecible (ej. aumentar capacidad antes de las horas pico).

Al automatizar el escalado, tus aplicaciones mantienen un buen rendimiento durante los picos de demanda y optimizas costos al reducir la capacidad durante los períodos de baja actividad. Service Auto Scaling es una pieza crítica para construir aplicaciones elásticas y eficientes en AWS.
''',
    'code_example': r'''
// Ejemplo de configuración de Service Auto Scaling para un servicio ECS usando CloudFormation.

// CORRECTO: Política de escalado de seguimiento de objetivo para un servicio ECS.
// Escalamos el servicio en función del uso promedio de CPU.
// Resources:
//   MyECSService:
//     Type: AWS::ECS::Service
//     Properties:
//       ServiceName: MyWebAppService
//       Cluster: !Ref MyECSCluster
//       TaskDefinition: !Ref MyWebAppTaskDefinition
//       DesiredCount: 2 # Número inicial de tareas
//       LaunchType: FARGATE
//       NetworkConfiguration:
//         AwsvpcConfiguration:
//           Subnets:
//             - subnet-xxxx
//             - subnet-yyyy
//           SecurityGroups:
//             - sg-zzzz
//           AssignPublicIp: ENABLED
//       LoadBalancers: # Opcional: si el servicio está detrás de un ALB
//         - ContainerName: web-container
//           ContainerPort: 80
//           TargetGroupArn: !Ref MyALBTargetGroup
//
//   # Definición del objetivo escalable (el número de tareas del servicio ECS)
//   MyECSServiceScalableTarget:
//     Type: AWS::ApplicationAutoScaling::ScalableTarget
//     Properties:
//       MaxCapacity: 10 # Máximo de tareas
//       MinCapacity: 2  # Mínimo de tareas
//       ResourceId: !Sub "service/${MyECSCluster}/${MyECSService}" # Referencia al servicio ECS
//       RoleARN: !Sub "arn:aws:iam::${AWS::AccountId}:role/aws-service-role/ecs.application-autoscaling.amazonaws.com/AWSServiceRoleForApplicationAutoScaling_ECSService"
//       ServiceNamespace: ecs
//       ScalableDimension: ecs:service:DesiredCount # Qué escalar
//
//   # Política de escalado de seguimiento de objetivo (Target Tracking Scaling)
//   MyECSServiceScalingPolicy:
//     Type: AWS::ApplicationAutoScaling::ScalingPolicy
//     Properties:
//       PolicyName: MyWebAppCPUUtilizationScaling
//       PolicyType: TargetTrackingScaling
//       ScalingTargetId: !Ref MyECSServiceScalableTarget
//       TargetTrackingScalingPolicyConfiguration:
//         PredefinedMetricSpecification:
//           PredefinedMetricType: ECSServiceAverageCPUUtilization # Métrica predefinida
//         TargetValue: 60.0 # Mantener la CPU promedio en 60%
//         ScaleInCooldown: 60 # Cooldown para reducir tareas (segundos)
//         ScaleOutCooldown: 60 # Cooldown para añadir tareas (segundos)
//
// INCORRECTO: No configurar Service Auto Scaling y depender de escalado manual o de un número fijo de tareas.
// // Definir un servicio ECS con un número fijo de tareas sin ninguna política de autoescalado.
// // Esto no se adapta a los cambios de demanda, llevando a bajo rendimiento o sobrecostos.
// Resources:
//   MyFixedCapacityECSService:
//     Type: AWS::ECS::Service
//     Properties:
//       ServiceName: MyFixedWebAppService
//       Cluster: !Ref MyECSCluster
//       TaskDefinition: !Ref MyWebAppTaskDefinition
//       DesiredCount: 5 # Siempre 5 tareas, sin importar la carga
//       LaunchType: FARGATE
//       NetworkConfiguration:
//         AwsvpcConfiguration:
//           Subnets:
//             - subnet-xxxx
//             - subnet-yyyy
//           SecurityGroups:
//             - sg-zzzz
//           AssignPublicIp: ENABLED
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Contenedores y Serverless',
    'topic': 'Amazon EKS',
    'subtopic': 'Conceptos de Kubernetes',
    'definition': '''
Kubernetes es una plataforma de orquestación de contenedores de código abierto que automatiza el despliegue, escalado y gestión de aplicaciones en contenedores. Piensa en Kubernetes como el director de una orquesta gigantesca, donde cada músico es un contenedor y Kubernetes se asegura de que todos toquen en armonía y al ritmo adecuado.

¿Te estás preguntando por qué Kubernetes es tan popular y qué problemas resuelve en el mundo de los contenedores?

Aquí te va la aclaración: A medida que las aplicaciones se vuelven más complejas y se dividen en microservicios empaquetados en contenedores Docker, gestionarlas manualmente se convierte en una pesadilla. Imagina tener que lanzar cientos o miles de contenedores, asegurarte de que estén saludables, que se comuniquen entre sí, que se escalen automáticamente cuando la demanda aumente, y que se reinicien si fallan. Kubernetes hace todo esto y más.

Sus componentes principales incluyen:
* **Pods:** La unidad más pequeña de despliegue en Kubernetes. Un Pod contiene uno o más contenedores que comparten recursos de red y almacenamiento. Si tienes una aplicación y un sidecar (un contenedor auxiliar), van juntos en un Pod.
* **Nodes (Nodos):** Las máquinas virtuales o físicas donde se ejecutan tus Pods. Un clúster de Kubernetes tiene un "nodo maestro" (que gestiona el clúster) y "nodos de trabajo" (donde se ejecutan tus aplicaciones).
* **Deployments:** Un objeto que describes para Kubernetes para que gestione el estado deseado de tus aplicaciones. Le dices cuántos Pods quieres de una aplicación y Kubernetes se asegura de que ese número se mantenga.
* **Services:** Un método abstracto para exponer un conjunto de Pods como un servicio de red. Un servicio en Kubernetes le da una IP estable y un nombre DNS a tu grupo de Pods, incluso si los Pods subyacen cambian.
* **Ingress:** Gestiona el acceso externo a los servicios en un clúster, ofreciendo enrutamiento basado en host o path, y terminación SSL/TLS.

Kubernetes es una plataforma poderosa que te ofrece una abstracción completa sobre la infraestructura subyacente. Te permite definir tu aplicación de una manera declarativa (diciéndole a Kubernetes "qué" quieres, no "cómo" hacerlo), y él se encarga de lograr ese estado deseado. Es un estándar de facto para la orquestación de contenedores a escala, y servicios como Amazon EKS facilitan su uso en la nube de AWS.
''',
    'code_example': r'''
// Ejemplo de un manifiesto de Kubernetes (YAML) para un despliegue y un servicio simples.

// CORRECTO: Despliegue y Servicio Kubernetes para una aplicación Nginx.
// # Deployment para la aplicación Nginx
// apiVersion: apps/v1
// kind: Deployment
// metadata:
//   name: nginx-deployment
//   labels:
//     app: nginx
// spec:
//   replicas: 3 # Queremos 3 réplicas del Pod
//   selector:
//     matchLabels:
//       app: nginx
//   template:
//     metadata:
//       labels:
//         app: nginx
//     spec:
//       containers:
//       - name: nginx
//         image: nginx:1.14.2 # Imagen Docker a usar
//         ports:
//         - containerPort: 80 # Puerto que expone el contenedor
// ---
// # Service para exponer el Deployment de Nginx
// apiVersion: v1
// kind: Service
// metadata:
//   name: nginx-service
// spec:
//   selector:
//     app: nginx # Selecciona los Pods con esta etiqueta
//   ports:
//     - protocol: TCP
//       port: 80       # Puerto del servicio
//       targetPort: 80 # Puerto al que se mapea en los Pods
//   type: LoadBalancer # Crea un Load Balancer externo para acceder al servicio
//
// INCORRECTO: Despliegue de un solo contenedor sin orquestación ni servicio.
// # Esto sería equivalente a ejecutar un "docker run" directamente, sin las ventajas de Kubernetes.
// # No hay escalabilidad, recuperación de fallos automática ni descubrimiento de servicios.
// # Aunque técnicamente es un manifiesto de Pod, no es como se gestionan las aplicaciones en K8s a escala.
// apiVersion: v1
// kind: Pod
// metadata:
//   name: my-single-pod
// spec:
//   containers:
//   - name: myapp
//     image: myapp:latest
//     ports:
//     - containerPort: 8080
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Contenedores y Serverless',
    'topic': 'Amazon EKS',
    'subtopic': 'Nodos de trabajo',
    'definition': '''
En un clúster de Kubernetes, los "nodos de trabajo" (worker nodes) son las máquinas donde realmente se ejecutan tus aplicaciones en contenedores. Son los "motores" o las "unidades de procesamiento" que proporcionan la capacidad de computación para tus Pods.

¿Qué función cumplen estos nodos y por qué son una parte fundamental de un clúster de Kubernetes?

Aquí te va la aclaración: Pensemos en un equipo de construcción. Los nodos de trabajo son los obreros que hacen el trabajo pesado: ejecutan los contenedores, almacenan los datos persistentes y manejan el tráfico de red de tu aplicación. Cada nodo de trabajo tiene varios componentes clave:
* **Kubelet:** Un agente que se ejecuta en cada nodo y se comunica con el nodo maestro de Kubernetes. Es responsable de asegurarse de que los contenedores definidos en los Pods se ejecuten y estén saludables.
* **Container Runtime:** Un software que permite a Kubernetes ejecutar contenedores (por ejemplo, Docker o containerd).
* **Kube-proxy:** Un proxy de red que mantiene las reglas de red en el nodo y permite la comunicación de red hacia y desde tus Pods.

En Amazon EKS, los nodos de trabajo son generalmente instancias EC2 que tú lanzas y configuras para que se unan al clúster de Kubernetes. Puedes gestionarlos de varias maneras:
* **Grupos de nodos administrados por EKS:** La forma más sencilla y recomendada. EKS se encarga de aprovisionar y gestionar las instancias EC2 por ti, incluyendo las actualizaciones, los parches y el registro con el clúster.
* **Nodos autoadministrados:** Tú gestionas las instancias EC2 por completo, incluyendo el lanzamiento, la configuración, las actualizaciones y los parches. Esto te da más control pero también más responsabilidad.
* **AWS Fargate:** Una opción serverless donde no gestionas nodos en absoluto. Simplemente lanzas Pods, y Fargate se encarga de la infraestructura subyacente.

Los nodos de trabajo son críticos porque es donde reside tu aplicación. La correcta configuración, el escalado y la salud de estos nodos son esenciales para la disponibilidad y el rendimiento de tus aplicaciones desplegadas en Kubernetes. EKS simplifica gran parte de la gestión de estos nodos, permitiéndote centrarte más en tus aplicaciones y menos en la infraestructura.
''',
    'code_example': r'''
// En EKS, los nodos de trabajo se gestionan a través de grupos de nodos.

// CORRECTO: Creación de un grupo de nodos administrados por EKS usando `eksctl`.
// # Comando eksctl para crear un clúster EKS con un grupo de nodos administrados
// # Esto simplifica la creación de los nodos de trabajo y su unión al cluster.
// # asg-access:true asegura que el rol del nodo tenga los permisos necesarios para autoescalado.
// eksctl create cluster \
//   --name my-eks-cluster \
//   --region us-east-1 \
//   --nodegroup-name my-nodegroup \
//   --node-type t3.medium \
//   --nodes 2 \
//   --nodes-min 1 \
//   --nodes-max 5 \
//   --managed \
//   --asg-access
//
// # Manifiesto CloudFormation para un grupo de nodos administrados (EKS Managed Node Group)
// Resources:
//   MyManagedNodeGroup:
//     Type: AWS::EKS::Nodegroup
//     Properties:
//       ClusterName: !Ref MyEKSCluster # Referencia al Cluster EKS existente
//       NodegroupName: my-managed-nodegroup
//       NodeRole: !GetAtt NodeInstanceRole.Arn # Rol IAM para las instancias del nodo
//       Subnets:
//         - subnet-aaaaa
//         - subnet-bbbbb
//       InstanceTypes:
//         - t3.medium
//       ScalingConfig:
//         MinSize: 1
//         MaxSize: 5
//         DesiredSize: 2
//       AmiType: AL2_x86_64 # Tipo de AMI (Amazon Linux 2)
//       Labels: # Etiquetas para el grupo de nodos
//         role: worker
//
// INCORRECTO: Intentar lanzar instancias EC2 regulares y esperar que se unan automáticamente a EKS sin la configuración adecuada.
// # Lanzar una instancia EC2 sin la AMI optimizada para EKS y sin el script de usuario correcto.
// # Esto resultaría en que la instancia no se registraría con el clúster de Kubernetes.
// aws ec2 run-instances \
//   --image-id ami-0abcdef1234567890 \ # Una AMI que NO es la optimizada para EKS
//   --instance-type t3.medium \
//   --count 1 \
//   --key-name my-key-pair \
//   --security-group-ids sg-xxxx \
//   --subnet-id subnet-yyyy
//
// # La instancia se lanzaría, pero el kubelet no se configuraría para apuntar al clúster EKS,
// # y no se uniría como un nodo de trabajo funcional.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Contenedores y Serverless',
    'topic': 'Amazon EKS',
    'subtopic': 'Kubernetes Dashboard',
    'definition': '''
El Kubernetes Dashboard es una interfaz de usuario web que te permite gestionar y monitorear tus aplicaciones que se ejecutan en un clúster de Kubernetes. Piensa en él como una consola gráfica para tu clúster, donde puedes ver y manipular tus Pods, Deployments, Services y otros recursos de Kubernetes sin tener que usar comandos de línea.

¿Te estás preguntando por qué una interfaz gráfica puede ser tan útil en un entorno como Kubernetes?

Aquí te va la aclaración: Si bien `kubectl` (la herramienta de línea de comandos de Kubernetes) es increíblemente potente, a veces una vista visual puede hacer la vida mucho más fácil, especialmente para depurar o simplemente para obtener una visión rápida del estado de tu clúster. Con el Dashboard, puedes:
* **Desplegar aplicaciones:** Subir un manifiesto YAML directamente o usar un asistente.
* **Monitorear recursos:** Ver el estado de tus Pods, Nodes, Deployments y Services. Puedes ver el uso de CPU y memoria, los logs de los contenedores, y los eventos.
* **Diagnosticar problemas:** Si un Pod no se inicia, puedes ver sus logs y eventos asociados para entender rápidamente qué está fallando.
* **Gestionar recursos:** Escalar Deployments, editar configuraciones de recursos, o eliminar Pods.

Instalar el Dashboard requiere algunos pasos, incluyendo la configuración de un proxy para acceder a él de forma segura y la creación de una cuenta de servicio con los permisos adecuados dentro de Kubernetes. Aunque la tendencia moderna es hacia el uso de herramientas de CLI, GitOps y observabilidad más avanzadas, el Dashboard sigue siendo una herramienta muy útil para una visión rápida y la gestión interactiva, especialmente para quienes están aprendiendo o para tareas de depuración puntuales. Es una excelente manera de visualizar la complejidad de Kubernetes.
''',
    'code_example': r'''
// La instalación y acceso al Kubernetes Dashboard requiere varios pasos.

// CORRECTO: Pasos básicos para desplegar el Kubernetes Dashboard y crear una cuenta de servicio con acceso de lectura.
// # 1. Desplegar el Kubernetes Dashboard
// # (Usar la versión recomendada por el proyecto Kubernetes)
// # kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
//
// # 2. Crear una cuenta de servicio y un ClusterRoleBinding para acceso de solo lectura (seguridad)
// # dashboard-read-only-user.yaml
// # apiVersion: v1
// # kind: ServiceAccount
// # metadata:
// #   name: dashboard-read-only
// #   namespace: kubernetes-dashboard
// # ---
// # apiVersion: rbac.authorization.k8s.io/v1
// # kind: ClusterRoleBinding
// # metadata:
// #   name: dashboard-read-only-binding
// # roleRef:
// #   apiGroup: rbac.authorization.k8s.io
// #   kind: ClusterRole
// #   name: view # Un ClusterRole predefinido para acceso de solo lectura
// # subjects:
// # - kind: ServiceAccount
// #   name: dashboard-read-only
// #   namespace: kubernetes-dashboard
// #
// # kubectl apply -f dashboard-read-only-user.yaml
//
// # 3. Obtener el token de la cuenta de servicio para iniciar sesión en el Dashboard
// # kubectl -n kubernetes-dashboard create token dashboard-read-only
//
// # 4. Acceder al Dashboard a través de un proxy de kubectl (en tu máquina local)
// # kubectl proxy
// # Luego, abrir en el navegador: http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
//
// INCORRECTO: Crear un ClusterRoleBinding que otorga permisos de administrador al Dashboard.
// # NO HACER ESTO en producción: Dar permisos excesivos al Dashboard
// # Esto es un riesgo de seguridad enorme, ya que cualquiera con acceso al Dashboard
// # tendría control total sobre tu clúster.
// # apiVersion: rbac.authorization.k8s.io/v1
// # kind: ClusterRoleBinding
// # metadata:
// #   name: dashboard-admin-binding
// # roleRef:
// #   apiGroup: rbac.authorization.k8s.io
// #   kind: ClusterRole
// #   name: cluster-admin # ¡Otorga permisos de administrador de clúster!
// # subjects:
// # - kind: ServiceAccount
// #   name: kubernetes-dashboard
// #   namespace: kubernetes-dashboard
// #
// # kubectl apply -f dashboard-admin-binding.yaml
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Contenedores y Serverless',
    'topic': 'Amazon EKS',
    'subtopic': 'Auto Scaling',
    'definition': '''
El Auto Scaling en Kubernetes (y por extensión en Amazon EKS) se refiere a la capacidad de tu clúster para ajustar automáticamente la capacidad de computación y el número de Pods de tus aplicaciones en respuesta a la demanda. Es como tener un gerente que, sin intervención humana, añade más servidores o más instancias de tu aplicación cuando el trabajo aumenta, y las retira cuando la carga disminuye.

¿Por qué esta automatización es tan vital para la eficiencia y la resiliencia en un entorno de contenedores?

Aquí te va la aclaración: Pensemos en un servicio de streaming de video. Durante las horas pico, la demanda de recursos es altísima; fuera de esas horas, es mucho menor. Sin Auto Scaling, tendrías que aprovisionar capacidad para el pico máximo, lo que significa un desperdicio enorme de recursos y costos durante las horas valle. O, peor aún, si subestima la demanda, tu aplicación se saturaría y fallaría. El Auto Scaling en Kubernetes maneja estos escenarios de forma inteligente.

Hay tres componentes principales de Auto Scaling en Kubernetes que a menudo trabajan juntos:
* **Horizontal Pod Autoscaler (HPA):** Este componente escala el número de Pods en tu Deployment (o ReplicaSet) basándose en métricas como el uso de CPU, uso de memoria, o métricas personalizadas (ej. el número de solicitudes por segundo). Si la CPU de tus Pods supera un umbral, HPA añade más Pods.
* **Cluster Autoscaler:** Este componente escala el número de nodos de trabajo en tu clúster. Si hay Pods pendientes de ser programados porque no hay suficientes recursos (CPU/memoria) en los nodos existentes, el Cluster Autoscaler añade más nodos al clúster. Cuando los nodos están subutilizados, los elimina. En EKS, esto se integra con los Auto Scaling Groups de EC2.
* **Vertical Pod Autoscaler (VPA):** (Aunque menos común y más complejo en producción). Recomienda (o ajusta automáticamente) los recursos (CPU/memoria) de contenedores individuales dentro de un Pod basándose en su uso real a lo largo del tiempo.

Implementar el Auto Scaling correctamente es fundamental para la optimización de costos y para garantizar que tu aplicación siempre tenga la capacidad necesaria para manejar la carga de usuarios. Es una característica que lleva la elasticidad de la nube a un nivel de granularidad de contenedores, haciendo tus aplicaciones más robustas y económicas de operar.
''',
    'code_example': r'''
// Ejemplos de manifiestos de Kubernetes para Horizontal Pod Autoscaler (HPA) y configuración para Cluster Autoscaler en EKS.

// CORRECTO: Configuración de Horizontal Pod Autoscaler (HPA).
// # horizontal-pod-autoscaler.yaml
// apiVersion: autoscaling/v2
// kind: HorizontalPodAutoscaler
// metadata:
//   name: my-app-hpa
// spec:
//   scaleTargetRef:
//     apiVersion: apps/v1
//     kind: Deployment
//     name: my-app-deployment # El Deployment al que se le aplicará el escalado
//   minReplicas: 2 # Número mínimo de Pods
//   maxReplicas: 10 # Número máximo de Pods
//   metrics:
//   - type: Resource
//     resource:
//       name: cpu
//       target:
//         type: Utilization
//         averageUtilization: 50 # Mantener la utilización promedio de CPU en 50%
//
// # kubectl apply -f horizontal-pod-autoscaler.yaml
//
// # Configuración conceptual para Cluster Autoscaler en EKS:
// # Instalar el Cluster Autoscaler en el clúster y configurar el rol IAM de los nodos
// # para que puedan modificar los Auto Scaling Groups de EC2.
// # Se integra con los Auto Scaling Groups de tus nodos de trabajo (managed node groups o self-managed).
// # El comando eksctl create cluster --asg-access (visto en Nodos de trabajo) ya prepara esto.
//
// INCORRECTO: No definir HPA o Cluster Autoscaler, confiando en un número fijo de réplicas/nodos.
// # Un Deployment sin HPA, lo que significa que el número de réplicas siempre será fijo.
// # Esto no se adapta a los cambios en la demanda.
// apiVersion: apps/v1
// kind: Deployment
// metadata:
//   name: my-fixed-app-deployment
// spec:
//   replicas: 5 # Número fijo de réplicas
//   selector:
//     matchLabels:
//       app: my-app
//   template:
//     metadata:
//       labels:
//         app: my-app
//     spec:
//       containers:
//       - name: my-container
//         image: my-app-image:latest
//         ports:
//         - containerPort: 80
//
// # La falta de Cluster Autoscaler significa que si los nodos están llenos,
// # los Pods pendientes no podrán ser programados.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Contenedores y Serverless',
    'topic': 'AWS Fargate',
    'subtopic': 'Serverless containers',
    'definition': '''
AWS Fargate es una tecnología que te permite ejecutar contenedores Docker sin tener que gestionar la infraestructura subyacente de servidores. Piensa en Fargate como si fuera un restaurante donde solo pides la comida (tus contenedores) y el chef (AWS) se encarga de todo lo demás: comprar los ingredientes, cocinar, lavar los platos, mantener la cocina limpia, etc. Tú solo te preocupas por lo que quieres comer.

¿Te estás preguntando cómo esto simplifica el despliegue de aplicaciones en contenedores?

Aquí te va la aclaración: Cuando trabajas con contenedores en servicios como Amazon ECS o Amazon EKS, tradicionalmente tenías dos opciones: gestionar tus propias instancias EC2 (el tipo de lanzamiento EC2) o dejar que AWS se encargara de los servidores por ti (Fargate). La diferencia clave es que con Fargate, te abstraes completamente de los servidores. No hay instancias EC2 que aprovisionar, parchar, monitorear o escalar. AWS se encarga de todo eso por ti.

Esto tiene varias ventajas importantes:
* **Menos sobrecarga operativa:** No tienes que preocuparte por la gestión de la infraestructura de los nodos. Esto libera a tu equipo para centrarse en el desarrollo y la lógica de negocio de tus aplicaciones.
* **Escalabilidad automática:** Fargate escala automáticamente la capacidad de computación para tus contenedores en respuesta a la demanda. Si necesitas más tareas, Fargate aprovisiona automáticamente la capacidad subyacente.
* **Pago por uso:** Solo pagas por los recursos de CPU y memoria que tus contenedores realmente utilizan, desde el momento en que empiezan a descargarse la imagen Docker hasta que la tarea termina. No pagas por instancias EC2 ociosas.
* **Seguridad inherente:** AWS gestiona la seguridad de la infraestructura subyacente de Fargate, asegurando que tus contenedores se ejecuten en un entorno aislado y seguro.

Fargate es ideal para microservicios, aplicaciones web, trabajos de procesamiento por lotes y cualquier carga de trabajo en contenedores donde quieres maximizar la agilidad y minimizar la sobrecarga de gestión de infraestructura. Es el futuro de la computación en contenedores, permitiendo a los desarrolladores centrarse puramente en su código.
''',
    'code_example': r'''
// AWS Fargate se utiliza como un tipo de lanzamiento dentro de servicios como ECS o EKS.
// No hay un "código Fargate" independiente, sino que se especifica en la definición del servicio.

// CORRECTO: Ejemplo de cómo especificar Fargate como tipo de lanzamiento en un servicio ECS.
// # Definición de un Servicio ECS que usa AWS Fargate como tipo de lanzamiento.
// Resources:
//   MyFargateService:
//     Type: AWS::ECS::Service
//     Properties:
//       ServiceName: MyServerlessApp
//       Cluster: !Ref MyECSCluster # Requiere un clúster ECS existente
//       TaskDefinition: !Ref MyTaskDefinition # Requiere una definición de tarea
//       DesiredCount: 1
//       LaunchType: FARGATE # ¡Aquí está la magia de Fargate!
//       NetworkConfiguration:
//         AwsvpcConfiguration:
//           Subnets:
//             - subnet-0abcdef1234567890 # Subnet privada donde Fargate lanzará la tarea
//           SecurityGroups:
//             - sg-0fedcba9876543210 # Grupo de seguridad para la tarea
//           AssignPublicIp: DISABLED # Generalmente se deshabilita para Fargate en subredes privadas
//       # No hay Auto Scaling Group de EC2 porque Fargate maneja la infraestructura.
//
// # Comando AWS CLI para ejecutar una tarea standalone con Fargate
// # aws ecs run-task \
// #   --cluster MyECSCluster \
// #   --task-definition MyTaskDefinition \
// #   --launch-type FARGATE \
// #   --network-configuration "awsvpcConfiguration={subnets=[subnet-0abcdef1234567890],securityGroups=[sg-0fedcba9876543210],assignPublicIp=DISABLED}"
//
// INCORRECTO: Intentar gestionar las instancias EC2 subyacentes cuando se usa Fargate.
// # Si especificas Fargate como tipo de lanzamiento, no debes intentar crear y gestionar
// # un Auto Scaling Group de EC2 para los nodos del clúster ECS.
// # Esto sería una redundancia y un error conceptual, ya que Fargate lo gestiona por ti.
// Resources:
//   MyFargateService:
//     Type: AWS::ECS::Service
//     Properties:
//       ServiceName: MyConfusedService
//       Cluster: !Ref MyECSCluster
//       TaskDefinition: !Ref MyTaskDefinition
//       DesiredCount: 1
//       LaunchType: FARGATE # Se especifica Fargate
//       # ... (otras propiedades) ...
//
//   MyEC2AutoScalingGroup: # ERROR: Esto no es necesario ni compatible con Fargate
//     Type: AWS::AutoScaling::AutoScalingGroup
//     Properties:
//       AutoScalingGroupName: MyFargateEC2Instances # No tiene sentido con Fargate
//       # ... (otras propiedades de EC2) ...
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Contenedores y Serverless',
    'topic': 'AWS Fargate',
    'subtopic': 'Configuración con ECS',
    'definition': '''
Configurar AWS Fargate con Amazon ECS es el escenario más común y directo para desplegar tus contenedores de forma serverless en AWS. Fargate es un tipo de lanzamiento dentro del servicio ECS, lo que significa que lo utilizas como una opción para ejecutar tus tareas y servicios en lugar de gestionar tus propias instancias EC2.

¿Te estás preguntando cómo funciona esta integración y qué pasos debes seguir para ponerla en marcha?

Aquí te va la aclaración: Pensemos en un barco y su motor. ECS es el barco (el orquestador de contenedores), y Fargate es el motor que lo propulsa, pero sin que tú tengas que ser el ingeniero mecánico. El proceso generalmente implica tres pasos clave:
1.  **Definir la Task Definition (Definición de Tarea):** Primero, creas tu plano de aplicación (Task Definition) donde especificas los contenedores, los recursos de CPU y memoria que necesitan, y el modo de red. Aquí es crucial que los requisitos de CPU y memoria sean compatibles con Fargate.
2.  **Crear un Servicio ECS:** Luego, creas un Servicio ECS y, al hacerlo, seleccionas `FARGATE` como el tipo de lanzamiento. También defines el número deseado de tareas (`desiredCount`), las subredes de VPC donde se lanzarán tus tareas, y los grupos de seguridad. Si tu aplicación es una web, puedes integrar un Load Balancer (ALB) aquí para distribuir el tráfico a tus tareas Fargate.
3.  **Lanzar y Escalar:** Una vez que el servicio está configurado, ECS se encarga de lanzar las tareas de Fargate por ti. Fargate gestionará automáticamente la infraestructura subyacente. Puedes configurar Auto Scaling para el servicio ECS (basado en CPU, memoria, solicitudes, etc.) y Fargate escalará las tareas de forma transparente.

La belleza de esta combinación es que ECS se encarga de la orquestación de alto nivel (qué tareas ejecutar, cuántas, cómo balancear la carga), mientras que Fargate se ocupa de la infraestructura de cómputo de bajo nivel (aprovisionar, parchar, escalar los servidores). Esto te permite tener una solución de contenedores robusta, altamente disponible y sin la sobrecarga operativa de gestionar máquinas virtuales. Es una forma excelente de desplegar aplicaciones en contenedores en AWS.
''',
    'code_example': r'''
// Ejemplo de un servicio ECS configurado para usar AWS Fargate.

// CORRECTO: Despliegue de un servicio ECS con Fargate.
// # Manifiesto CloudFormation para una Task Definition compatible con Fargate
// Resources:
//   MyFargateTaskDefinition:
//     Type: AWS::ECS::TaskDefinition
//     Properties:
//       Family: my-fargate-app
//       Cpu: "256" # CPU en unidades (1024 = 1 vCPU)
//       Memory: "512" # Memoria en MiB
//       NetworkMode: awsvpc # Requerido para Fargate
//       RequiresCompatibilities:
//         - FARGATE # Requerido para Fargate
//       ExecutionRoleArn: arn:aws:iam::123456789012:role/ecsTaskExecutionRole
//       ContainerDefinitions:
//         - Name: my-app-container
//           Image: public.ecr.aws/nginx/nginx:latest
//           PortMappings:
//             - ContainerPort: 80
//           LogConfiguration:
//             LogDriver: awslogs
//             Options:
//               awslogs-group: /ecs/my-fargate-logs
//               awslogs-region: !Ref "AWS::Region"
//               awslogs-stream-prefix: ecs
//
// # Manifiesto CloudFormation para un Servicio ECS que usa la Task Definition con Fargate
//   MyFargateService:
//     Type: AWS::ECS::Service
//     Properties:
//       ServiceName: MyWebAppFargateService
//       Cluster: !Ref MyECSCluster # Asegúrate de que este cluster exista
//       TaskDefinition: !Ref MyFargateTaskDefinition
//       DesiredCount: 2 # Número de tareas a mantener
//       LaunchType: FARGATE # ¡Especifica Fargate aquí!
//       NetworkConfiguration:
//         AwsvpcConfiguration:
//           Subnets:
//             - subnet-0abcdef1234567890 # Subnet privada donde Fargate lanzará la tarea
//           SecurityGroups:
//             - sg-0fedcba9876543210 # Grupo de seguridad para la tarea
//           AssignPublicIp: DISABLED # Buena práctica para la seguridad en subredes privadas
//       LoadBalancers:
//         - ContainerName: my-app-container
//           ContainerPort: 80
//           TargetGroupArn: !Ref MyALBTargetGroup # Si usas un ALB
//
// INCORRECTO: Especificar un tipo de lanzamiento EC2 mientras se espera la gestión de Fargate.
// # Esto causaría un conflicto o un error, ya que Fargate no se usaría.
// Resources:
//   MyMisconfiguredService:
//     Type: AWS::ECS::Service
//     Properties:
//       ServiceName: MyMistakeService
//       Cluster: !Ref MyECSCluster
//       TaskDefinition: !Ref MyFargateTaskDefinition
//       DesiredCount: 1
//       LaunchType: EC2 # ERROR: Intentando usar EC2, no Fargate
//       # ... (otras propiedades) ...
//
// # Si se usa EC2, se esperaría la configuración de un Auto Scaling Group de EC2 para los nodos,
// # lo cual sería incompatible con la idea de usar Fargate.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Contenedores y Serverless',
    'topic': 'AWS Fargate',
    'subtopic': 'Configuración con EKS',
    'definition': '''
AWS Fargate también se puede utilizar como un tipo de infraestructura serverless para tus Pods en Amazon EKS, el servicio de Kubernetes gestionado por AWS. Esto te permite beneficiarte de la potencia de Kubernetes para la orquestación, mientras Fargate se encarga de la gestión de los nodos de trabajo subyacentes.

¿Te estás preguntando cómo Fargate se integra con Kubernetes y cuándo tiene sentido usarlo con EKS?

Aquí te va la aclaración: Pensemos que Kubernetes es una ciudad (tu clúster) y los nodos son los edificios donde viven los ciudadanos (tus Pods). Tradicionalmente, tú tenías que construir y mantener esos edificios. Con Fargate en EKS, AWS se encarga de la construcción y el mantenimiento de los edificios por ti, mientras tú sigues siendo el alcalde de la ciudad (gestionando Kubernetes).

Para usar Fargate con EKS, necesitas configurar un "perfil de Fargate". Este perfil es una configuración que le dice a EKS qué Pods deben ejecutarse en Fargate en lugar de en instancias EC2. Puedes especificar Pods basándote en su namespace (espacio de nombres) o en sus etiquetas. Por ejemplo, puedes decir que todos los Pods en el `namespace: production` se ejecuten en Fargate, o que los Pods con la etiqueta `env: critical` se ejecuten en Fargate.

Las ventajas de usar Fargate con EKS son similares a las de ECS:
* **Abstracción de la infraestructura:** No gestionas nodos de trabajo EC2. AWS se encarga de la capacidad, el escalado, los parches y la seguridad del sistema operativo.
* **Modelo de pago por uso:** Pagas por los recursos de CPU y memoria que tus Pods realmente utilizan, sin pagar por el tiempo de inactividad de las instancias.
* **Aislamiento de seguridad:** Cada Pod en Fargate se ejecuta en su propia máquina virtual dedicada, lo que proporciona un mayor aislamiento de seguridad.

Fargate es una excelente opción para Pods que necesitan un alto aislamiento de seguridad, Pods que no necesitan acceso directo a las instancias subyacentes (como los que necesitan DaemonSets), o si simplemente quieres la máxima sencillez operativa y estás dispuesto a pagar un poco más por esa comodidad. Es la combinación perfecta si quieres lo mejor de ambos mundos: la potencia de Kubernetes y la sencillez serverless.
''',
    'code_example': r'''
// Para usar Fargate con EKS, se define un "Fargate Profile".

// CORRECTO: Creación de un Fargate Profile para un clúster EKS.

// # Comando eksctl para crear un Fargate Profile
// eksctl create fargateprofile \
//   --cluster my-eks-cluster \
//   --name my-fargate-profile \
//   --namespace my-app-namespace # Los Pods en este namespace se ejecutarán en Fargate
//   # También puedes especificar selectores por etiquetas, ej.: --labels env=production
//
// # Manifiesto CloudFormation para un Fargate Profile
// Resources:
//   MyEKSFargateProfile:
//     Type: AWS::EKS::FargateProfile
//     Properties:
//       ClusterName: !Ref MyEKSCluster # Referencia al clúster EKS existente
//       FargateProfileName: my-app-fargate-profile
//       PodExecutionRoleArn: arn:aws:iam::123456789012:role/eksFargatePodExecutionRole # Rol para que Fargate ejecute los Pods
//       Subnets: # Subredes donde Fargate lanzará los Pods
//         - subnet-0abcdef1234567890
//         - subnet-0fedcba9876543210
//       Selectors: # Qué Pods deben ejecutarse en Fargate
//         - Namespace: my-app-namespace
//         - Labels:
//             env: production # Los Pods con esta etiqueta también irán a Fargate
//
// INCORRECTO: Intentar especificar un tipo de lanzamiento Fargate directamente en los manifiestos de Pods de Kubernetes.
// # En Kubernetes, no especificas "Fargate" directamente en el Pod o Deployment.
// # La programación en Fargate se decide por el Fargate Profile.
// # El siguiente YAML no funcionaría para forzar Fargate:
// apiVersion: v1
// kind: Pod
// metadata:
//   name: my-fargate-pod
//   labels:
//     app: my-app
// spec:
//   containers:
//   - name: my-container
//     image: my-image:latest
//   # No existe un campo "fargate" o "launchType" aquí para el Pod.
//   # El scheduling a Fargate se hace a través del Fargate Profile y el Kube-scheduler.
//   # launchType: FARGATE # ¡ERROR! Esto no es un campo válido en el manifiesto de Pod.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Contenedores y Serverless',
    'topic': 'AWS Fargate',
    'subtopic': 'Costos y optimización',
    'definition': '''
Entender los costos de AWS Fargate y cómo optimizarlos es clave para aprovechar al máximo este servicio serverless. Aunque Fargate elimina la gestión de servidores, el modelo de precios es diferente al de las instancias EC2 y es importante saber dónde mirar para evitar sorpresas en tu factura.

¿Te estás preguntando cómo se calcula el costo de Fargate y qué estrategias puedes usar para reducirlo?

Aquí te va la aclaración: Pensemos en una factura de electricidad. Con Fargate, no pagas por el tiempo que la luz está encendida en una casa entera, sino por el tiempo y la potencia exacta que usa cada electrodoméstico. El costo de Fargate se basa en la cantidad de vCPU y memoria (GiB) que tu tarea de Fargate consume, medida por segundo, con un mínimo de un minuto. Es decir, pagas por:
1.  **vCPU-segundo:** La capacidad de procesamiento utilizada.
2.  **GiB-segundo:** La memoria utilizada.

Esto significa que, si tu tarea se ejecuta durante 10 segundos, pagarás por 1 minuto de uso de vCPU y GiB. Después del primer minuto, la facturación es por segundo.

Para optimizar los costos de Fargate, considera lo siguiente:
* **Tamaño correcto de las tareas:** No sobreaprovisiones. Asigna solo la cantidad de CPU y memoria que tus contenedores realmente necesitan. Monitorea el uso de recursos de tus tareas con CloudWatch para ajustar su tamaño. Si una tarea solo usa 0.25 vCPU y 0.5 GiB de memoria, no le asignes 1 vCPU y 2 GiB.
* **Escalado automático eficiente:** Configura políticas de Auto Scaling en tus servicios ECS o HPA en EKS para que tus tareas escalen hacia arriba y hacia abajo rápidamente en respuesta a la demanda. Esto evita pagar por capacidad ociosa.
* **Considera los requisitos de CPU y memoria:** Algunas combinaciones de CPU y memoria son más rentables que otras. Consulta la tabla de precios de Fargate para ver las combinaciones disponibles y sus costos asociados.
* **Precios de Fargate Spot:** Para cargas de trabajo tolerantes a interrupciones (como procesamiento por lotes, tareas de desarrollo/pruebas), puedes usar Fargate Spot, que ofrece descuentos significativos (hasta el 70%) a cambio de la posibilidad de que tus tareas sean interrumpidas.
* **Desplegar en regiones más económicas:** Si la latencia no es un factor crítico, desplegar en una región de AWS con costos más bajos para Fargate puede ayudar.
* **Limpieza de tareas y servicios no utilizados:** Asegúrate de que no tienes tareas o servicios de Fargate ejecutándose innecesariamente en entornos de desarrollo/prueba.

Dominar la optimización de costos en Fargate te permite aprovechar su flexibilidad serverless sin incurrir en gastos innecesarios, asegurando que pagas solo por lo que realmente consumes.
''',
    'code_example': r'''
// La optimización de costos de Fargate no es directamente código, sino más bien decisiones de configuración
// y monitoreo. El siguiente ejemplo ilustra la definición de recursos y el escalado que influyen en el costo.

// CORRECTO: Configuración de Task Definition con recursos ajustados y Auto Scaling para optimización.
// # Task Definition con recursos de CPU y memoria ajustados a las necesidades reales (ej. 0.25 vCPU, 0.5 GiB)
// Resources:
//   MyOptimizedFargateTaskDefinition:
//     Type: AWS::ECS::TaskDefinition
//     Properties:
//       Family: my-cost-optimized-app
//       Cpu: "256" # 0.25 vCPU
//       Memory: "512" # 0.5 GiB
//       NetworkMode: awsvpc
//       RequiresCompatibilities: [FARGATE]
//       ExecutionRoleArn: arn:aws:iam::123456789012:role/ecsTaskExecutionRole
//       ContainerDefinitions:
//         - Name: my-app-container
//           Image: my-app-image:latest
//           PortMappings:
//             - ContainerPort: 80
//           # ... (otras configuraciones) ...
//
// # Configuración de Auto Scaling para el servicio (ver subtopic "Service Auto Scaling" de ECS)
// # Esto asegura que solo pagas por la capacidad necesaria en momentos de alta demanda.
// Resources:
//   MyOptimizedFargateService:
//     Type: AWS::ECS::Service
//     Properties:
//       ServiceName: MyCostEfficientService
//       Cluster: !Ref MyECSCluster
//       TaskDefinition: !Ref MyOptimizedFargateTaskDefinition
//       DesiredCount: 1 # Iniciar con un número mínimo bajo
//       LaunchType: FARGATE
//       NetworkConfiguration:
//         AwsvpcConfiguration:
//           Subnets: [subnet-0abcdef1234567890]
//           SecurityGroups: [sg-0fedcba9876543210]
//           AssignPublicIp: DISABLED
//       # ... (Configurar políticas de autoescalado aquí, como se vio en el subtopic de Service Auto Scaling) ...
//
// INCORRECTO: Sobreaprovisionar recursos en la Task Definition o no usar Auto Scaling.
// # Task Definition con recursos excesivos para una aplicación pequeña (ej. 4 vCPU, 8 GiB para una API simple)
// Resources:
//   MyOverprovisionedFargateTaskDefinition:
//     Type: AWS::ECS::TaskDefinition
//     Properties:
//       Family: my-expensive-app
//       Cpu: "4096" # 4 vCPU, cuando quizás solo necesite 0.25
//       Memory: "8192" # 8 GiB, cuando quizás solo necesite 0.5
//       NetworkMode: awsvpc
//       RequiresCompatibilities: [FARGATE]
//       ExecutionRoleArn: arn:aws:iam::123456789012:role/ecsTaskExecutionRole
//       ContainerDefinitions:
//         - Name: my-app-container
//           Image: my-app-image:latest
//           PortMappings:
//             - ContainerPort: 80
//
// # Un servicio sin Auto Scaling, que mantendrá un número fijo de tareas costosas.
// Resources:
//   MyFixedExpensiveFargateService:
//     Type: AWS::ECS::Service
//     Properties:
//       ServiceName: MyHighCostService
//       Cluster: !Ref MyECSCluster
//       TaskDefinition: !Ref MyOverprovisionedFargateTaskDefinition
//       DesiredCount: 5 # Mantener 5 tareas con recursos excesivos, incluso con baja demanda
//       LaunchType: FARGATE
//       # ... (sin Auto Scaling Policy) ...
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Contenedores y Serverless',
    'topic': 'Serverless Avanzado',
    'subtopic': 'Step Functions',
    'definition': '''
AWS Step Functions es un servicio serverless que te permite orquestar flujos de trabajo complejos y distribuir aplicaciones de forma visual y programática. Pensemos en Step Functions como un coreógrafo digital que organiza una serie de pasos (tus funciones Lambda, actividades, etc.) para que se ejecuten en una secuencia lógica, manejando errores, reintentos y esperas automáticamente.

¿Te estás preguntando por qué esto es tan útil cuando tus procesos se vuelven complicados?

Aquí te va la aclaración: Cuando construyes aplicaciones serverless, a menudo necesitas coordinar múltiples funciones Lambda, servicios de AWS o incluso sistemas externos para completar una tarea. Si intentas manejar esta lógica de orquestación dentro de una sola función Lambda, esta puede volverse muy grande, difícil de mantener y propensa a errores (el famoso "callback hell" o tener que manejar la persistencia del estado entre pasos). Step Functions resuelve esto.

Te permite definir "máquinas de estado" (state machines) usando un lenguaje basado en JSON llamado Amazon States Language. En esta definición, describes los pasos de tu flujo de trabajo, cómo se conectan, qué hacer si un paso falla (reintentos), si necesitas esperar un tiempo o si un paso es condicional. Por ejemplo, podrías tener un flujo de trabajo para procesar un pedido de e-commerce:
1.  **Validar Pedido** (función Lambda)
2.  **Procesar Pago** (integración con un servicio de pago)
3.  **Enviar Notificación** (función Lambda)
4.  **Actualizar Inventario** (base de datos)

Step Functions se encarga de:
* **Gestión del estado:** Mantiene el estado de tu flujo de trabajo, así que no necesitas gestionarlo tú.
* **Manejo de errores y reintentos:** Puedes definir reintentos automáticos y lógica de compensación si algo sale mal.
* **Paralelismo:** Ejecutar pasos en paralelo para acelerar el procesamiento.
* **Visualización:** Ofrece una interfaz gráfica que muestra el progreso de cada ejecución, lo que facilita la depuración.

Es una herramienta poderosa para construir aplicaciones distribuidas y automatizar procesos empresariales complejos sin tener que escribir mucho código de orquestación, simplificando enormemente la gestión de flujos de trabajo asíncronos y de larga duración.
''',
    'code_example': r'''
// Ejemplo de una máquina de estado simple en AWS Step Functions (Amazon States Language - JSON).

// CORRECTO: Máquina de estado para un flujo de trabajo simple de aprobación.
// {
//   "Comment": "Una máquina de estado para procesar un pedido",
//   "StartAt": "ValidateOrder",
//   "States": {
//     "ValidateOrder": {
//       "Type": "Task",
//       "Resource": "arn:aws:lambda:us-east-1:123456789012:function:ValidateOrderLambda",
//       "Next": "ProcessPayment"
//     },
//     "ProcessPayment": {
//       "Type": "Task",
//       "Resource": "arn:aws:states:::aws-sdk:sfn:startSyncExecution",
//       "Parameters": {
//         "StateMachineArn": "arn:aws:states:::stateMachine:ProcessPaymentStateMachine",
//         "Input": {
//           "payload.$": "$"
//         }
//       },
//       "ResultSelector": {
//         "paymentStatus.$": "$.Output.paymentStatus"
//       },
//       "Catch": [
//         {
//           "ErrorEquals": ["States.TaskFailed"],
//           "Next": "PaymentFailed"
//         }
//       ],
//       "Next": "UpdateInventory"
//     },
//     "UpdateInventory": {
//       "Type": "Task",
//       "Resource": "arn:aws:lambda:us-east-1:123456789012:function:UpdateInventoryLambda",
//       "End": true
//     },
//     "PaymentFailed": {
//       "Type": "Pass",
//       "Result": {"status": "payment_failed", "message": "Payment could not be processed."},
//       "End": true
//     }
//   }
// }
//
// INCORRECTO: Intentar manejar flujos de trabajo complejos con múltiples llamadas anidadas dentro de una sola función Lambda.
// // Esto es un pseudocódigo que representa una mala práctica:
// /*
// exports.handler = async (event) => {
//   // Lógica para validar el pedido
//   const validationResult = await validateOrder(event.order);
//   if (!validationResult.isValid) {
//     return { statusCode: 400, body: 'Order invalid' };
//   }
//
//   // Lógica para procesar el pago (pueden haber reintentos manuales y manejo de estado)
//   let paymentSuccess = false;
//   for (let i = 0; i < 3; i++) {
//     try {
//       const paymentResponse = await processPayment(event.order.amount);
//       if (paymentResponse.status === 'SUCCESS') {
//         paymentSuccess = true;
//         break;
//       }
//     } catch (e) {
//       console.error('Payment failed, retrying...', e);
//       await new Promise(resolve => setTimeout(resolve, 1000 * (i + 1))); // Retardo manual
//     }
//   }
//
//   if (!paymentSuccess) {
//     return { statusCode: 500, body: 'Payment failed' };
//   }
//
//   // Lógica para actualizar el inventario
//   await updateInventory(event.order.items);
//
//   // Mucho estado y manejo de errores dentro de una sola función.
//   // Difícil de leer, mantener y escalar.
//   return { statusCode: 200, body: 'Order processed' };
// };
// */
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Contenedores y Serverless',
    'topic': 'Serverless Avanzado',
    'subtopic': 'EventBridge',
    'definition': '''
Amazon EventBridge es un servicio serverless que actúa como un bus de eventos, facilitando la creación de arquitecturas basadas en eventos a gran escala. Piensa en EventBridge como una central de correos super eficiente donde diferentes partes de tu aplicación (o incluso aplicaciones externas) envían mensajes (eventos), y EventBridge los entrega a los destinatarios correctos que están interesados en esos mensajes.

¿Te estás preguntando cómo esto cambia la forma en que tus componentes se comunican y se vuelven más flexibles?

Aquí te va la aclaración: En una arquitectura tradicional, los componentes a menudo se comunican directamente entre sí, lo que crea un acoplamiento fuerte y hace que sea difícil modificar o añadir nuevas funcionalidades sin afectar a otras partes. EventBridge introduce el concepto de "arquitectura dirigida por eventos", donde los componentes no necesitan saber nada el uno del otro. Simplemente publican eventos cuando algo sucede, y otros componentes (los "consumidores") pueden suscribirse a esos eventos para reaccionar.

EventBridge tiene tres componentes principales:
* **Fuentes de eventos:** De dónde provienen los eventos. Pueden ser servicios de AWS (ej. S3, Lambda, EC2), tus propias aplicaciones (eventos personalizados) o aplicaciones SaaS de terceros (ej. Shopify, Zendesk).
* **Buses de eventos:** Donde se reciben, filtran y enrutan los eventos. Tienes un bus por defecto, y puedes crear buses personalizados para organizar tus eventos.
* **Reglas:** Patrones que defines para filtrar eventos en un bus y enviarlos a objetivos específicos. Una regla puede decir "cuando un evento de S3 diga que se subió un nuevo archivo .jpg, envíalo a esta función Lambda".
* **Objetivos (Targets):** Los servicios de AWS o endpoints externos que reciben los eventos (ej. funciones Lambda, Step Functions, SQS, SNS, Kinesis, etc.).

La belleza de EventBridge es que desacopla tus componentes, haciéndolos más resilientes, escalables y fáciles de evolucionar. Si mañana decides que un evento de "pedido completado" debe disparar también una notificación a un sistema de CRM, solo necesitas añadir una nueva regla en EventBridge sin modificar tu servicio de procesamiento de pedidos. Esto es fundamental para construir aplicaciones modernas, flexibles y resilientes.
''',
    'code_example': r'''
// Ejemplo de una regla de EventBridge para reaccionar a un evento de S3.

// CORRECTO: Regla de EventBridge que detecta la subida de un nuevo objeto a un bucket S3 específico y lo envía a una función Lambda.
// # Manifiesto CloudFormation para una regla de EventBridge
// Resources:
//   S3ObjectCreatedRule:
//     Type: AWS::Events::Rule
//     Properties:
//       Name: DetectNewS3ObjectUpload
//       Description: "Envía un evento a Lambda cuando se sube un objeto a un bucket específico"
//       EventBusName: default # O tu bus personalizado
//       EventPattern:
//         source:
//           - aws.s3 # La fuente del evento es S3
//         detail-type:
//           - AWS API Call via CloudTrail
//         detail:
//           eventSource:
//             - s3.amazonaws.com
//           eventName:
//             - PutObject # El evento específico es PutObject
//           requestParameters:
//             bucketName:
//               - my-data-processing-bucket-123 # El nombre del bucket
//       Targets: # A dónde enviar el evento
//         - Arn: !GetAtt ProcessS3ObjectLambdaFunction.Arn # ARN de la función Lambda
//           Id: ProcessS3ObjectLambdaTarget
//
//   # Permiso para que EventBridge invoque la función Lambda
//   LambdaInvokePermission:
//     Type: AWS::Lambda::Permission
//     Properties:
//       FunctionName: !GetAtt ProcessS3ObjectLambdaFunction.Arn
//       Action: "lambda:InvokeFunction"
//       Principal: "events.amazonaws.com"
//       SourceArn: !GetAtt S3ObjectCreatedRule.Arn
//
// # Ejemplo de la función Lambda (Node.js) que procesaría el evento
// # exports.handler = async (event) => {
// #   console.log('Evento recibido de S3:', JSON.stringify(event, null, 2));
// #   const bucketName = event.detail.requestParameters.bucketName;
// #   const objectKey = event.detail.requestParameters.key;
// #   console.log(`Nuevo objeto subido: ${objectKey} en el bucket ${bucketName}`);
// #   // Lógica de procesamiento aquí...
// #   return 'Processed S3 object event';
// # };
//
// INCORRECTO: Acoplamiento fuerte entre servicios llamándose directamente o a través de APIs específicas.
// // En lugar de usar un bus de eventos, la aplicación sube el objeto a S3 y luego
// // directamente llama a una API de otro servicio para notificar que un nuevo objeto está disponible.
// // Esto acopla fuertemente el servicio de subida con el servicio de procesamiento.
//
// /*
// // Pseudocódigo para una aplicación que sube a S3 y luego notifica directamente a un microservicio
// const AWS = require('aws-sdk');
// const s3 = new AWS.S3();
// const axios = require('axios'); // Para hacer llamadas HTTP a otro servicio
//
// async function uploadAndNotify(fileContent, fileName) {
//   const params = {
//     Bucket: 'my-data-bucket',
//     Key: fileName,
//     Body: fileContent
//   };
//   await s3.putObject(params).promise();
//   console.log('Archivo subido a S3:', fileName);
//
//   // Llama directamente a la API de otro servicio para procesar el archivo
//   try {
//     await axios.post('https://api.myprocessorservice.com/process-file', {
//       bucket: 'my-data-bucket',
//       key: fileName
//     });
//     console.log('Notificación enviada al servicio de procesamiento.');
//   } catch (error) {
//     console.error('Error al notificar al servicio de procesamiento:', error);
//     // ¿Qué pasa si el servicio de procesamiento está caído? El flujo se rompe.
//   }
// }
// */
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Contenedores y Serverless',
    'topic': 'Serverless Avanzado',
    'subtopic': 'API Gateway con Lambda',
    'definition': '''
AWS API Gateway es un servicio serverless que te permite crear, publicar, mantener, monitorear y asegurar APIs REST, HTTP y WebSocket a escala. Cuando lo combinas con AWS Lambda, tienes una arquitectura serverless robusta para tus backends de aplicaciones web o móviles. Piensa en API Gateway como el portero y traductor de tu edificio serverless: recibe a los visitantes (solicitudes HTTP), los dirige al apartamento correcto (tu función Lambda) y traduce sus peticiones para que los habitantes las entiendan.

¿Te estás preguntando por qué esta combinación es tan potente y cómo transforma la forma en que construyes APIs?

Aquí te va la aclaración: Tradicionalmente, para tener una API, necesitabas configurar servidores web, balanceadores de carga, manejar certificados SSL, y escalar toda esa infraestructura. Con API Gateway y Lambda, todo eso desaparece. API Gateway se encarga de recibir las solicitudes HTTP de tus clientes, validar la autenticación y autorización, aplicar transformaciones a los datos, y luego invocar tu función Lambda. La función Lambda, por su parte, ejecuta tu lógica de negocio sin que tú tengas que gestionar ningún servidor.

Los beneficios de esta combinación son muchos:
* **Completamente serverless:** No gestionas servidores, lo que significa menos sobrecarga operativa y escalado automático.
* **Escalabilidad:** API Gateway escala automáticamente para manejar millones de solicitudes, y Lambda escala automáticamente para ejecutar tu código en paralelo.
* **Autenticación y autorización:** Integración nativa con IAM, Amazon Cognito, y Lambda authorizers para proteger tus APIs.
* **Manejo de versiones y etapas:** Puedes tener múltiples versiones de tu API (ej. `v1`, `v2`) y etapas (ej. `dev`, `prod`).
* **Manejo de errores y latencia:** Puedes configurar políticas de reintentos, caché y limitación de solicitudes (throttling).
* **Monitoreo:** Integración con CloudWatch para monitorear el rendimiento y los errores de tus APIs.

Es la arquitectura de referencia para construir backends escalables, eficientes y de bajo costo para aplicaciones web, móviles y SaaS. Compañías como Netflix usan arquitecturas de microservicios impulsadas por APIs para manejar su inmensa carga de tráfico, y API Gateway es la puerta de entrada a ese tipo de escalabilidad.
''',
    'code_example': r'''
// Ejemplo de cómo configurar una API REST en API Gateway que invoca una función Lambda usando CloudFormation.

// CORRECTO: Una API Gateway REST API con un recurso, método y proxy a una función Lambda.
// Resources:
//   MyLambdaFunction:
//     Type: AWS::Lambda::Function
//     Properties:
//       FunctionName: MyBackendLambda
//       Handler: index.handler
//       Role: arn:aws:iam::123456789012:role/lambda-excecution-role # Rol para la función Lambda
//       Runtime: nodejs18.x
//       Code:
//         ZipFile: |
//           exports.handler = async (event) => {
//             console.log('Received event:', JSON.stringify(event, null, 2));
//             const response = {
//               statusCode: 200,
//               headers: { "Content-Type": "application/json" },
//               body: JSON.stringify({ message: 'Hello from Lambda!', path: event.path }),
//             };
//             return response;
//           };
//
//   MyApiGateway:
//     Type: AWS::ApiGateway::RestApi
//     Properties:
//       Name: MyServerlessApi
//       Description: API Gateway para mi aplicación serverless
//
//   ApiGatewayResource:
//     Type: AWS::ApiGateway::Resource
//     Properties:
//       ParentId: !GetAtt MyApiGateway.RootResourceId
//       PathPart: '{proxy+}' # Recurso proxy para manejar cualquier path debajo de la raíz
//       RestApiId: !Ref MyApiGateway
//
//   ApiGatewayMethod:
//     Type: AWS::ApiGateway::Method
//     Properties:
//       HttpMethod: ANY # Permite cualquier método HTTP (GET, POST, PUT, etc.)
//       ResourceId: !Ref ApiGatewayResource
//       RestApiId: !Ref MyApiGateway
//       AuthorizationType: NONE # Sin autorización (para ejemplo, en prod se usa IAM, Cognito, Lambda Authorizer)
//       Integration:
//         IntegrationHttpMethod: POST # Método de la integración (Lambda se invoca con POST)
//         Type: AWS_PROXY # Integración de proxy Lambda
//         Uri: !Sub
//           - arn:aws:apigateway:${AWS::Region}:lambda:path/2015-03-31/functions/${LambdaArn}/invocations
//           - LambdaArn: !GetAtt MyLambdaFunction.Arn
//
//   ApiGatewayDeployment:
//     Type: AWS::ApiGateway::Deployment
//     Properties:
//       RestApiId: !Ref MyApiGateway
//       Description: Initial deployment
//     DependsOn: ApiGatewayMethod # Asegura que el método se cree antes del despliegue
//
//   ApiGatewayStage:
//     Type: AWS::ApiGateway::Stage
//     Properties:
//       StageName: prod
//       Description: Production stage
//       RestApiId: !Ref MyApiGateway
//       DeploymentId: !Ref ApiGatewayDeployment
//
//   LambdaApiGatewayPermission:
//     Type: AWS::Lambda::Permission
//     Properties:
//       FunctionName: !GetAtt MyLambdaFunction.Arn
//       Action: lambda:InvokeFunction
//       Principal: apigateway.amazonaws.com
//       SourceArn: !Sub "arn:aws:execute-api:${AWS::Region}:${AWS::AccountId}:${MyApiGateway}/*/*"
//
// INCORRECTO: Crear una API REST y configurar una instancia EC2 como backend en lugar de una función Lambda.
// # Si bien es posible, no es serverless y pierde las ventajas de escalado automático y pago por uso de Lambda.
// Resources:
//   MyTraditionalApiGateway:
//     Type: AWS::ApiGateway::RestApi
//     Properties:
//       Name: MyTraditionalApi
//
//   MyTraditionalApiResource:
//     Type: AWS::ApiGateway::Resource
//     Properties:
//       ParentId: !GetAtt MyTraditionalApiGateway.RootResourceId
//       PathPart: 'data'
//       RestApiId: !Ref MyTraditionalApiGateway
//
//   MyTraditionalApiMethod:
//     Type: AWS::ApiGateway::Method
//     Properties:
//       HttpMethod: GET
//       ResourceId: !Ref MyTraditionalApiResource
//       RestApiId: !Ref MyTraditionalApiGateway
//       AuthorizationType: NONE
//       Integration:
//         Type: HTTP # ERROR: Integración HTTP directa a un servidor, no serverless.
//         IntegrationHttpMethod: GET
//         Uri: http://my-ec2-instance-ip/api/data # Depende de una IP fija o de un Load Balancer gestionado por ti.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Contenedores y Serverless',
    'topic': 'Serverless Avanzado',
    'subtopic': 'X-Ray para monitoreo',
    'definition': '''
AWS X-Ray es un servicio que te ayuda a analizar y depurar aplicaciones distribuidas, especialmente aquellas construidas con microservicios y funciones serverless como Lambda. Pensemos en X-Ray como un detective forense de alto nivel para tus transacciones, que traza el camino que sigue una solicitud a través de todos los componentes de tu aplicación, revelando dónde se producen cuellos de botella o errores.

¿Te estás preguntando cómo X-Ray te da una visibilidad profunda donde las métricas tradicionales no llegan?

Aquí te va la aclaración: En una arquitectura serverless o de microservicios, una sola solicitud de usuario puede pasar por API Gateway, invocar varias funciones Lambda, interactuar con DynamoDB, S3, y quizás llamar a servicios externos. Si algo falla o es lento, es increíblemente difícil saber exactamente dónde está el problema solo mirando los logs o métricas individuales de cada servicio. X-Ray lo resuelve con el "trazado distribuido".

X-Ray recopila datos sobre las solicitudes que tu aplicación maneja y te permite visualizar un "mapa de servicio" que muestra las relaciones entre tus componentes. Por cada solicitud, X-Ray genera un "trazo" (trace) que incluye "segmentos" de cada componente por el que pasa. Por ejemplo:
* Un segmento para la solicitud en API Gateway.
* Un segmento para la invocación de la función Lambda.
* Sub-segmentos dentro de la Lambda para llamadas a DynamoDB o a una API externa.

Con X-Ray, puedes:
* **Identificar cuellos de botella:** Ver qué componentes están añadiendo latencia a tus solicitudes.
* **Detectar errores:** Rastrear una solicitud fallida hasta el componente exacto que causó el problema.
* **Visualizar dependencias:** Entender cómo interactúan tus microservicios.
* **Analizar el rendimiento:** Obtener datos de latencia agregados para diferentes rutas o servicios.

Integrar X-Ray en tus funciones Lambda o contenedores es relativamente sencillo. Para Lambda, a menudo solo necesitas habilitar el "tracing" en la configuración de la función. Para otros servicios o aplicaciones, puedes usar el SDK de X-Ray o el X-Ray Daemon. Es una herramienta indispensable para mantener la observabilidad en arquitecturas serverless y distribuidas, permitiéndote depurar y optimizar el rendimiento de tu aplicación con una facilidad que antes era impensable.
''',
    'code_example': r'''
// Para habilitar X-Ray para monitoreo en servicios serverless.

// CORRECTO: Habilitar el tracing de X-Ray para una función Lambda y API Gateway.
// # Configuración de una función Lambda para enviar trazas a X-Ray
// Resources:
//   MyXRayLambdaFunction:
//     Type: AWS::Lambda::Function
//     Properties:
//       FunctionName: MyXRayLambda
//       Handler: index.handler
//       Role: !GetAtt LambdaExecutionRole.Arn
//       Runtime: nodejs18.x
//       Code:
//         ZipFile: |
//           const AWS = require('aws-sdk');
//           const docClient = new AWS.DynamoDB.DocumentClient();
//           // Habilita el SDK de X-Ray para que instrumente las llamadas de AWS SDK
//           const AWSXRay = require('aws-xray-sdk-core');
//           AWSXRay.captureAWS(AWS);
//
//           exports.handler = async (event) => {
//             console.log('Event:', JSON.stringify(event));
//             // Simula una llamada a DynamoDB que X-Ray trazaría
//             await docClient.get({ TableName: 'MyTable', Key: { id: '123' } }).promise();
//             return {
//               statusCode: 200,
//               body: JSON.stringify('Hello from X-Ray enabled Lambda!'),
//             };
//           };
//       TracingConfig:
//         Mode: Active # ¡Habilitar el tracing de X-Ray!
//
// # Configuración de API Gateway para enviar trazas a X-Ray
// Resources:
//   MyXRayApiGateway:
//     Type: AWS::ApiGateway::RestApi
//     Properties:
//       Name: MyXRayApi
//       Description: API Gateway with X-Ray tracing
//       TracingEnabled: true # ¡Habilitar el tracing de X-Ray para la API!
//
//   # ... (Configuración de recursos, métodos, integración con la Lambda, similar al ejemplo anterior) ...
//
// INCORRECTO: Basar el monitoreo solo en logs de CloudWatch y métricas sin trazas distribuidas.
// # Una función Lambda sin X-Ray Tracing y una API Gateway sin Tracing.
// # Esto significa que solo verás los logs y métricas de cada componente de forma aislada,
// # sin la capacidad de trazar una solicitud completa a través de la arquitectura.
//
// Resources:
//   MyNoXRayLambdaFunction:
//     Type: AWS::Lambda::Function
//     Properties:
//       FunctionName: MyNoXRayLambda
//       Handler: index.handler
//       Role: !GetAtt LambdaExecutionRole.Arn
//       Runtime: nodejs18.x
//       Code:
//         ZipFile: |
//           exports.handler = async (event) => {
//             console.log('Event:', JSON.stringify(event));
//             // No hay instrumentación de X-Ray SDK aquí
//             return {
//               statusCode: 200,
//               body: JSON.stringify('Hello from non-X-Ray Lambda!'),
//             };
//           };
//       # TracingConfig no está presente o está en 'PassThrough'
//
//   MyNoXRayApiGateway:
//     Type: AWS::ApiGateway::RestApi
//     Properties:
//       Name: MyNoXRayApi
//       # TracingEnabled no está presente o está en false
'''
  });
}

Future<void> insertMidLevel4AwsData(Database db) async {
  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 4,
    'title_level': 'DevOps en AWS',
    'topic': 'CI/CD',
    'subtopic': 'AWS CodePipeline',
    'definition': '''
AWS CodePipeline es un servicio de entrega continua (Continuous Delivery) que automatiza las fases de tu proceso de lanzamiento de software. Piensa en CodePipeline como una línea de ensamblaje para tu código: cada vez que realizas un cambio, CodePipeline lo toma, lo construye, lo prueba y lo despliega automáticamente a tus entornos de producción, todo de manera fluida y sin intervención manual.

¿Te estás preguntando por qué esto es tan crucial para acelerar la entrega de software y mantener la calidad?

Aquí te va la aclaración: En el desarrollo de software, es vital que los cambios de código lleguen a producción de forma rápida y confiable. Hacer esto manualmente es lento, propenso a errores y no escala. CodePipeline automatiza este viaje de tu código, desde el repositorio hasta el despliegue final.

Una tubería (pipeline) en CodePipeline se compone de diferentes "etapas" (stages), y cada etapa contiene "acciones" (actions). Las etapas comunes incluyen:
* **Source (Fuente):** Aquí es donde tu código se origina. CodePipeline puede integrarse con repositorios como AWS CodeCommit, GitHub, S3 o Bitbucket. Cada vez que hay un cambio en el repositorio, la tubería se activa.
* **Build (Construcción):** En esta etapa, el código fuente se compila, se ejecutan pruebas unitarias y se empaquetan los artefactos. AWS CodeBuild es el servicio que suele usarse aquí.
* **Test (Pruebas):** Se ejecutan pruebas de integración, pruebas de aceptación o cualquier otra prueba automatizada para validar el software. Puedes usar CodeBuild o Lambda para esto.
* **Deploy (Despliegue):** Los artefactos construidos se despliegan en tus entornos. AWS CodeDeploy se utiliza comúnmente para desplegar en EC2 o instancias on-premise, mientras que AWS ECS, EKS, Lambda o CloudFormation son opciones para despliegues serverless o en contenedores.

CodePipeline te da visibilidad en cada paso del proceso, y puedes configurar aprobaciones manuales en cualquier etapa para tener control. Esto significa que puedes lanzar nuevas características y correcciones de errores con mucha más frecuencia y confianza, reduciendo el riesgo y mejorando la calidad de tu software. Es la columna vertebral para una estrategia de CI/CD efectiva en AWS.
''',
    'code_example': r'''
# Ejemplo de una definición básica de AWS CodePipeline en CloudFormation.

# CORRECTO: Una CodePipeline simple con etapas de Source, Build y Deploy.
# Resources:
#   MyWebAppPipeline:
#     Type: AWS::CodePipeline::Pipeline
#     Properties:
#       Name: MyWebAppCI_CDPipeline
#       RoleArn: arn:aws:iam::123456789012:role/CodePipelineServiceRole # Rol IAM para CodePipeline
#       ArtifactStore: # Dónde se almacenan los artefactos entre etapas
#         Type: S3
#         Location: my-codepipeline-artifacts-bucket-12345 # Tu bucket S3
#       Stages:
#         - Name: Source # Etapa 1: Fuente del código
#           Actions:
#             - Name: Source
#               ActionTypeId:
#                 Category: Source
#                 Owner: AWS
#                 Provider: CodeCommit # O GitHub, S3, Bitbucket
#                 Version: '1'
#               OutputArtifacts:
#                 - Name: SourceCode # Nombre del artefacto de salida
#               Configuration:
#                 RepositoryName: MyWebAppRepo # Tu repositorio CodeCommit
#                 BranchName: main
#               RunOrder: 1
#         - Name: Build # Etapa 2: Construcción del código
#           Actions:
#             - Name: Build
#               ActionTypeId:
#                 Category: Build
#                 Owner: AWS
#                 Provider: CodeBuild
#                 Version: '1'
#               InputArtifacts:
#                 - Name: SourceCode
#               OutputArtifacts:
#                 - Name: BuildOutput # Nombre del artefacto de salida
#               Configuration:
#                 ProjectName: MyCodeBuildProject # Tu proyecto CodeBuild
#               RunOrder: 1
#         - Name: Deploy # Etapa 3: Despliegue
#           Actions:
#             - Name: Deploy
#               ActionTypeId:
#                 Category: Deploy
#                 Owner: AWS
#                 Provider: CodeDeploy # O ECS, EKS, Lambda, CloudFormation
#                 Version: '1'
#               InputArtifacts:
#                 - Name: BuildOutput
#               Configuration:
#                 ApplicationName: MyCodeDeployApplication
#                 DeploymentGroupName: MyCodeDeployDeploymentGroup
#               RunOrder: 1
#
# # INCORRECTO: Intentar ejecutar manualmente los pasos de CI/CD uno por uno.
# # Esto no es automatización y es propenso a errores humanos y lentitud.
# # No hay un ejemplo de código para esto, ya que es la ausencia de una tubería automatizada.
# # Sería algo como:
# # 1. Hacer pull del código.
# # 2. Ejecutar comandos de construcción localmente.
# # 3. Ejecutar pruebas manualmente.
# # 4. Copiar archivos a un servidor o subir imágenes a un registro.
# # 5. Reiniciar el servicio en el servidor.
# # Un proceso manual que CodePipeline automatiza.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 4,
    'title_level': 'DevOps en AWS',
    'topic': 'CI/CD',
    'subtopic': 'AWS CodeBuild',
    'definition': '''
AWS CodeBuild es un servicio de integración continua (CI) completamente gestionado que compila tu código fuente, ejecuta pruebas y produce paquetes de software listos para el despliegue. Piensa en CodeBuild como una fábrica de software automatizada y bajo demanda: le das tu código, y él te devuelve el producto terminado (tu aplicación compilada y probada), sin que tú tengas que gestionar las máquinas de la fábrica.

¿Te estás preguntando por qué esto es tan útil en un flujo de CI/CD y cómo te libera de las complejidades de la compilación?

Aquí te va la aclaración: Construir software no es solo escribir código. Implica compilarlo (transformar el código fuente en un ejecutable), ejecutar pruebas unitarias, empaquetar dependencias, y crear los artefactos finales (como archivos `.jar`, imágenes Docker, etc.). Hacer esto en tu máquina local o en servidores dedicados puede ser problemático: las máquinas pueden ser lentas, los entornos de construcción inconsistentes, o tienes que gestionarlos y escalarlos manualmente. CodeBuild resuelve todo esto.

CodeBuild elimina la necesidad de aprovisionar, gestionar y escalar servidores de compilación. Simplemente configuras un proyecto de compilación, le indicas dónde está tu código fuente (GitHub, CodeCommit, S3, etc.) y qué comandos debe ejecutar. Utiliza un archivo llamado `buildspec.yml` (que puedes incluir en tu repositorio) para definir los pasos de compilación, prueba y empaquetado.

Un `buildspec.yml` típico tiene fases como:
* **`install`**: Instalar dependencias necesarias (ej. `npm install`, `pip install`).
* **`pre_build`**: Ejecutar comandos antes de la compilación (ej. autenticación en repositorios privados).
* **`build`**: Ejecutar los comandos de compilación principales (ej. `mvn package`, `docker build`).
* **`post_build`**: Ejecutar comandos después de la compilación, como pruebas unitarias, escaneo de seguridad o subir artefactos a S3.
* **`artifacts`**: Especificar qué archivos deben ser los artefactos de salida.

CodeBuild se integra de forma nativa con AWS CodePipeline para automatizar todo tu flujo de CI/CD. Solo pagas por los minutos de computación que tu compilación consume, lo que lo hace muy rentable. Es una herramienta esencial para asegurar que tu código se compila y prueba de manera consistente y eficiente en la nube.
''',
    'code_example': r'''
# Ejemplo de un archivo `buildspec.yml` para un proyecto de CodeBuild.

# CORRECTO: Un `buildspec.yml` para una aplicación Node.js que instala dependencias, construye y empaqueta.
# version: 0.2 # Versión del formato buildspec
#
# phases:
#   install:
#     runtime-versions:
#       nodejs: 18 # Especifica la versión de Node.js a usar
#     commands:
#       - echo "Instalando dependencias de Node.js..."
#       - npm install
#   pre_build:
#     commands:
#       - echo "Ejecutando pruebas unitarias..."
#       - npm test
#   build:
#     commands:
#       - echo "Compilando la aplicación..."
#       - npm run build # Asumiendo un script 'build' en package.json
#   post_build:
#     commands:
#       - echo "Construcción completada. Creando artefactos..."
# artifacts:
#   files:
#     - '**/*' # Incluir todos los archivos de la carpeta de construcción en el artefacto
#   base-directory: build # La carpeta donde se encuentran los artefactos generados
#
# # INCORRECTO: Intentar un proceso de compilación manual sin herramientas de automatización.
# # Esto lleva a entornos inconsistentes y errores difíciles de depurar.
# # No hay un ejemplo de código para esto, ya que es la falta de uso de CodeBuild.
# # Sería algo como:
# # 1. Clonar el repositorio en una máquina local.
# # 2. Ejecutar `npm install` (y esperar que todas las versiones de dependencias sean correctas).
# # 3. Ejecutar `npm test`.
# # 4. Ejecutar `npm run build`.
# # 5. Copiar manualmente los archivos resultantes.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 4,
    'title_level': 'DevOps en AWS',
    'topic': 'CI/CD',
    'subtopic': 'AWS CodeDeploy',
    'definition': '''
AWS CodeDeploy es un servicio de despliegue completamente gestionado que automatiza el lanzamiento de software en una variedad de servicios de computación, incluyendo instancias de Amazon EC2, servidores on-premise, funciones AWS Lambda y Amazon ECS. Piensa en CodeDeploy como tu equipo de "operaciones de despliegue" automatizado, que se encarga de que tu nueva versión de software llegue de forma segura a su destino sin interrupciones.

¿Te estás preguntando por qué este servicio es vital para un despliegue sin problemas y con alta disponibilidad?

Aquí te va la aclaración: El despliegue de una nueva versión de tu aplicación puede ser un proceso delicado. Necesitas asegurar que la aplicación esté disponible durante el despliegue, manejar retrocesos si algo sale mal, y actualizar solo un subconjunto de servidores a la vez para minimizar el riesgo. CodeDeploy se encarga de todo esto.

CodeDeploy utiliza un archivo `appspec.yml` (que resides en tu repositorio junto con tu código) para definir el proceso de despliegue, incluyendo qué archivos copiar, qué scripts ejecutar en cada fase del despliegue (ej. detener el servicio, descargar la nueva versión, iniciar el servicio), y cómo manejar los ganchos del ciclo de vida del despliegue.

CodeDeploy soporta varios tipos de despliegue:
* **In-place deployment:** La aplicación en cada instancia se detiene, la nueva versión se instala, las pruebas se ejecutan y la nueva versión se inicia. Esto puede causar un tiempo de inactividad.
* **Blue/Green deployment:** Un enfoque más avanzado donde la nueva versión se despliega en un entorno completamente nuevo ("verde") sin afectar al entorno actual ("azul"). Una vez que el entorno verde es validado, el tráfico se redirige a este. Si hay problemas, el tráfico puede revertirse rápidamente al entorno azul. Esto ofrece cero tiempo de inactividad.

CodeDeploy se integra perfectamente con AWS CodePipeline para automatizar la fase de despliegue de tu tubería de CI/CD. También soporta estrategias de despliegue como "All at once" (todo a la vez), "Half at a time" (la mitad a la vez) o "One at a time" (uno a la vez), dándote control sobre la velocidad y el riesgo de tus lanzamientos. Es una herramienta esencial para asegurar que tus despliegues son rápidos, repetibles y fiables.
''',
    'code_example': r'''
# Ejemplo de un archivo `appspec.yml` para un despliegue de CodeDeploy en instancias EC2.

# CORRECTO: Un `appspec.yml` para desplegar una aplicación web en EC2.
# version: 0.0 # Versión del formato appspec
# os: linux # O 'windows'
# files:
#   - source: / # El directorio raíz del artefacto de despliegue
#     destination: /var/www/html # Dónde se copiarán los archivos en la instancia
# hooks: # Scripts a ejecutar en diferentes fases del despliegue
#   BeforeInstall:
#     - location: scripts/install_dependencies.sh # Script para instalar paquetes
#       timeout: 300
#       runas: root
#   AfterInstall:
#     - location: scripts/configure_application.sh # Script para configurar la app
#       timeout: 300
#       runas: root
#   ApplicationStart:
#     - location: scripts/start_server.sh # Script para iniciar el servidor web
#       timeout: 300
#       runas: root
#   ValidateService:
#     - location: scripts/validate_service.sh # Script para ejecutar pruebas de salud
#       timeout: 300
#       runas: root
#
# # INCORRECTO: Realizar despliegues manuales en instancias EC2 a través de SSH.
# # Esto es propenso a errores, consume tiempo y no escala.
# # No hay un ejemplo de código directo para esto, ya que es la falta de automatización.
# # Sería algo como:
# # 1. Conectarse vía SSH a cada instancia.
# # 2. Detener el servicio (ej. `sudo systemctl stop nginx`).
# # 3. Descargar la nueva versión o copiar los archivos manualmente.
# # 4. Iniciar el servicio (ej. `sudo systemctl start nginx`).
# # 5. Repetir para cada instancia, manejando errores manualmente.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 4,
    'title_level': 'DevOps en AWS',
    'topic': 'CI/CD',
    'subtopic': 'Integración con GitHub',
    'definition': '''
La integración de tus herramientas de CI/CD en AWS con GitHub es una práctica común y muy efectiva para mantener tu flujo de trabajo de desarrollo ágil y automatizado. Esto permite que los cambios de código en tu repositorio de GitHub activen automáticamente tuberías de integración y entrega continua en AWS, asegurando que tu código se construya, pruebe y despliegue cada vez que haces un `push`.

¿Te estás preguntando cómo funciona esta conexión entre tu código en GitHub y los servicios de AWS?

Aquí te va la aclaración: Pensemos en GitHub como el centro de control de tu código fuente, y los servicios de AWS CI/CD (CodePipeline, CodeBuild) como los motores de tu proceso de despliegue. La integración establece un puente de comunicación para que, cada vez que hay un evento importante en GitHub (como un `push` a una rama específica o la creación de un `pull request`), se desencadene una acción en AWS.

La forma más común de integrar GitHub con los servicios de AWS es a través de:
* **AWS CodePipeline:** CodePipeline tiene una acción de `Source` integrada con GitHub. Cuando configuras esta acción, CodePipeline te pedirá autorización para acceder a tus repositorios de GitHub. Una vez concedido, puedes seleccionar el repositorio y la rama, y CodePipeline configurará un "webhook" en GitHub. Este webhook es lo que notifica a CodePipeline sobre los cambios en tu repositorio.
* **AWS CodeBuild:** También puedes configurar un proyecto de CodeBuild para que su fuente sea directamente un repositorio de GitHub. De manera similar, CodeBuild puede usar webhooks para iniciar compilaciones automáticamente en respuesta a cambios de código.

Los beneficios de esta integración son claros:
* **Automatización total:** Cada cambio en el código activa una tubería CI/CD, reduciendo el riesgo de errores manuales.
* **Flujo de trabajo centralizado:** Los desarrolladores trabajan en GitHub como de costumbre, sin necesidad de interactuar directamente con AWS para iniciar despliegues.
* **Despliegues más rápidos:** La automatización reduce significativamente el tiempo desde que el código se escribe hasta que llega a producción.
* **Colaboración mejorada:** Las solicitudes de extracción (pull requests) en GitHub pueden disparar pruebas en CodeBuild, dando retroalimentación temprana a los desarrolladores.

Esta integración te permite mantener el código en tu plataforma preferida (GitHub) mientras aprovechas la robusta infraestructura de CI/CD de AWS. Es un patrón esencial para equipos que buscan una alta velocidad de desarrollo y una entrega de software confiable.
''',
    'code_example': r'''
# La integración con GitHub se configura a través de la consola de AWS CodePipeline/CodeBuild
# o mediante CloudFormation con las propiedades de Source Action.

# CORRECTO: Configuración de una etapa de Source en CodePipeline para un repositorio de GitHub.
# Resources:
#   MyGitHubSourcePipeline:
#     Type: AWS::CodePipeline::Pipeline
#     Properties:
#       Name: MyGitHubAppPipeline
#       RoleArn: arn:aws:iam::123456789012:role/CodePipelineServiceRole
#       ArtifactStore:
#         Type: S3
#         Location: my-codepipeline-artifacts-bucket-12345
#       Stages:
#         - Name: Source
#           Actions:
#             - Name: GitHubSource
#               ActionTypeId:
#                 Category: Source
#                 Owner: ThirdParty # Indica que es un proveedor externo (GitHub)
#                 Provider: GitHub
#                 Version: '1'
#               OutputArtifacts:
#                 - Name: SourceCode
#               Configuration:
#                 Owner: YourGitHubOrgOrUser # Tu organización o nombre de usuario de GitHub
#                 Repo: YourGitHubRepoName # Nombre de tu repositorio en GitHub
#                 Branch: main
#                 # OAuthToken: "{{resolve:secretsmanager:GitHubOAuthToken:SecretString:token}}" # Token de GitHub, idealmente desde Secrets Manager
#                 PollForSourceChanges: false # Configurar webhook en GitHub para disparar el pipeline
#                 # Nota: AWS CodePipeline se encargará de crear el webhook en GitHub automáticamente
#                 # cuando conectas el repositorio a través de la consola o la CLI.
#               RunOrder: 1
#         # ... (siguientes etapas de Build, Test, Deploy) ...
#
# # INCORRECTO: Descargar manualmente el código de GitHub y subirlo a S3 para que lo tome CodePipeline.
# # Esto introduce pasos manuales innecesarios y elimina la automatización de la integración continua.
# # # Una acción de Source que usa S3, pero requiriendo que alguien suba el código manualmente primero.
# # Resources:
# #   MyS3ManualSourcePipeline:
# #     Type: AWS::CodePipeline::Pipeline
# #     Properties:
# #       Name: MyManualS3Pipeline
# #       RoleArn: arn:aws:iam::123456789012:role/CodePipelineServiceRole
# #       ArtifactStore:
# #         Type: S3
# #         Location: my-codepipeline-artifacts-bucket-12345
# #       Stages:
# #         - Name: Source
# #           Actions:
# #             - Name: S3Source
# #               ActionTypeId:
# #                 Category: Source
# #                 Owner: AWS
# #                 Provider: S3
# #                 Version: '1'
# #               OutputArtifacts:
# #                 - Name: SourceCode
# #               Configuration:
# #                 S3Bucket: my-manual-source-bucket
# #                 S3ObjectKey: my-app-source.zip
# #                 # Esto requiere que alguien ejecute: aws s3 cp my-app-source.zip s3://my-manual-source-bucket/
# #                 # cada vez que haya un cambio.
# #               RunOrder: 1
# #         # ... (siguientes etapas) ...
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 4,
    'title_level': 'DevOps en AWS',
    'topic': 'Infrastructure as Code',
    'subtopic': 'AWS CloudFormation',
    'definition': '''
AWS CloudFormation es un servicio que te permite modelar y aprovisionar tus recursos de infraestructura de AWS de forma declarativa, utilizando código. Pensemos en CloudFormation como un arquitecto que crea planos detallados de todo lo que necesitas en tu entorno de AWS (servidores, bases de datos, redes, etc.), y luego construye automáticamente todo eso por ti, exactamente como lo definiste.

¿Te estás preguntando por qué esto es tan importante en la nube y cómo cambia la forma en que gestionas tu infraestructura?

Aquí te va la aclaración: Tradicionalmente, configurar tu infraestructura en la nube implicaba hacer clic en la consola de AWS, lanzar instancias, configurar redes, crear bases de datos, etc. Esto es manual, propenso a errores, difícil de replicar y complicado de auditar. CloudFormation resuelve estos problemas al permitirte definir tu infraestructura como un archivo de texto (JSON o YAML), que luego puedes versionar en un sistema de control de versiones (como Git), revisar y desplegar de forma consistente.

Los beneficios de usar CloudFormation son significativos:
* **Infraestructura como Código (IaC):** Gestionas tu infraestructura de la misma manera que gestionas tu código de aplicación. Esto significa que puedes usar las mismas prácticas de DevOps, como el control de versiones, la revisión de código y la automatización.
* **Consistencia:** Asegura que tus entornos (desarrollo, pruebas, producción) sean idénticos, eliminando las inconsistencias que a menudo causan problemas.
* **Automatización:** Aprovisiona y actualiza todos los recursos de AWS en un solo paso, eliminando tareas manuales.
* **Reversión sencilla:** Si algo sale mal durante un despliegue, CloudFormation puede revertir el stack a su estado anterior de forma automática o manual.
* **Control de versiones:** Al ser archivos de texto, tus plantillas de CloudFormation pueden almacenarse en Git, permitiéndote ver el historial de cambios, quién hizo qué y cuándo.
* **Optimización de costos:** Puedes ver los costos de los recursos antes de crearlos y asegurar que solo se aprovisionan los recursos necesarios.

Es una herramienta fundamental para la automatización, la estandarización y la escalabilidad de tus entornos en AWS, permitiéndote construir y gestionar infraestructuras complejas con confianza y eficiencia. Empresas que operan a gran escala, como Amazon mismo, utilizan intensamente la IaC para gestionar sus vastos entornos.
''',
    'code_example': r'''
# Ejemplo de una plantilla básica de AWS CloudFormation para crear una instancia EC2.

# CORRECTO: Plantilla de CloudFormation que crea una instancia EC2 y un Security Group.
# AWSTemplateFormatVersion: '2010-09-09'
# Description: Una plantilla simple para crear una instancia EC2
#
# Resources:
#   MyEC2SecurityGroup:
#     Type: AWS::EC2::SecurityGroup
#     Properties:
#       GroupDescription: Habilita SSH y HTTP
#       SecurityGroupIngress:
#         - IpProtocol: tcp
#           FromPort: 22
#           ToPort: 22
#           CidrIp: 0.0.0.0/0 # ¡Advertencia: no recomendado para producción!
#         - IpProtocol: tcp
#           FromPort: 80
#           ToPort: 80
#           CidrIp: 0.0.0.0/0
#
#   MyEC2Instance:
#     Type: AWS::EC2::Instance
#     Properties:
#       ImageId: ami-0abcdef1234567890 # Reemplazar con una AMI válida para tu región
#       InstanceType: t2.micro
#       KeyName: MyKeyPair # Reemplazar con tu Key Pair existente
#       SecurityGroupIds:
#         - !GetAtt MyEC2SecurityGroup.GroupId # Referencia al Security Group
#       Tags:
#         - Key: Name
#           Value: MyCloudFormationInstance
#
# Outputs:
#   InstanceId:
#     Description: ID de la instancia EC2 creada
#     Value: !Ref MyEC2Instance
#   PublicIp:
#     Description: Dirección IP pública de la instancia
#     Value: !GetAtt MyEC2Instance.PublicIp
#
# # INCORRECTO: Aprovisionar recursos manualmente a través de la consola de AWS.
# # Esto carece de consistencia, es lento y no permite la automatización.
# # No hay un ejemplo de código para esto, ya que es la ausencia de usar CloudFormation.
# # Sería el proceso de:
# # 1. Ir a la consola de EC2.
# # 2. Hacer clic en "Lanzar instancia".
# # 3. Seleccionar AMI, tipo de instancia, par de claves.
# # 4. Configurar un grupo de seguridad manualmente.
# # 5. Lanzar la instancia y luego configurar otras cosas, todo con clics.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 4,
    'title_level': 'DevOps en AWS',
    'topic': 'Infrastructure as Code',
    'subtopic': 'Templates básicos',
    'definition': '''
Una plantilla (template) en AWS CloudFormation es un archivo de texto plano, generalmente en formato JSON o YAML, que describe los recursos de AWS que deseas aprovisionar y sus configuraciones. Piensa en estas plantillas como las recetas o los planos de construcción para tu infraestructura en la nube: defines exactamente qué ingredientes (recursos) necesitas y cómo deben combinarse para construir tu sistema.

¿Te estás preguntando por qué definir tu infraestructura en un archivo es tan poderoso y qué elementos clave componen una de estas plantillas?

Aquí te va la aclaración: La fuerza de CloudFormation reside en su enfoque declarativo. En lugar de decirle a AWS "cómo" crear algo (paso a paso), le dices "qué" quieres que exista, y CloudFormation se encarga de los detalles. Esto hace que tus despliegues sean repetibles y consistentes.

Los componentes principales de una plantilla de CloudFormation son:
* **`AWSTemplateFormatVersion`**: La versión del formato de la plantilla.
* **`Description`**: Una descripción opcional de la plantilla.
* **`Metadata`**: Información adicional sobre la plantilla.
* **`Parameters`**: Entradas personalizables que puedes especificar cuando creas o actualizas un stack. Esto te permite hacer tus plantillas reutilizables (ej., tipo de instancia EC2, nombre de la base de datos).
* **`Mappings`**: Un mapa de claves y valores que puedes usar para buscar valores condicionalmente (ej., diferentes AMIs para diferentes regiones).
* **`Conditions`**: Bloques para definir cuándo se crean ciertos recursos o propiedades, basados en parámetros de entrada.
* **`Resources`**: La sección más importante, donde declaras los recursos de AWS que deseas crear (ej., `AWS::EC2::Instance`, `AWS::S3::Bucket`, `AWS::Lambda::Function`). Cada recurso tiene un tipo, un nombre lógico y propiedades específicas.
* **`Outputs`**: Valores que CloudFormation devuelve después de que el stack se ha creado. Esto es útil para pasar información de un stack a otro, o para obtener URLs de tus aplicaciones.

Estas plantillas son el corazón de la Infraestructura como Código. Permiten a los equipos de DevOps modelar entornos complejos, desde una simple instancia EC2 hasta una arquitectura de microservicios completa, y desplegarlos en segundos. Una vez que dominas la creación de estas plantillas, la gestión de tu infraestructura en AWS se vuelve un proceso mucho más predecible y eficiente.
''',
    'code_example': r'''
# Ejemplo de una plantilla básica de CloudFormation que usa Parámetros y Salidas.

# CORRECTO: Plantilla de CloudFormation con parámetros y salidas para una instancia EC2.
# AWSTemplateFormatVersion: '2010-09-09'
# Description: |
#   Esta plantilla crea una instancia EC2 con un Security Group asociado.
#   Demuestra el uso de parámetros para personalización y salidas para información útil.
#
# Parameters:
#   InstanceTypeParameter:
#     Type: String
#     Default: t2.micro
#     AllowedValues:
#       - t2.micro
#       - t2.small
#     Description: Tipo de instancia EC2 a desplegar.
#   LatestAmiId:
#     Type: AWS::EC2::Image::Id
#     Description: El ID de la AMI a usar para la instancia EC2.
#   KeyNameParameter:
#     Type: AWS::EC2::KeyPair::KeyName
#     Description: El nombre de un KeyPair existente para acceso SSH.
#
# Resources:
#   WebServerSecurityGroup:
#     Type: AWS::EC2::SecurityGroup
#     Properties:
#       GroupDescription: Habilita acceso SSH y HTTP desde cualquier IP
#       SecurityGroupIngress:
#         - IpProtocol: tcp
#           FromPort: 22
#           ToPort: 22
#           CidrIp: 0.0.0.0/0
#         - IpProtocol: tcp
#           FromPort: 80
#           ToPort: 80
#           CidrIp: 0.0.0.0/0
#
#   WebServerInstance:
#     Type: AWS::EC2::Instance
#     Properties:
#       ImageId: !Ref LatestAmiId # Usando el parámetro AMI
#       InstanceType: !Ref InstanceTypeParameter # Usando el parámetro de tipo de instancia
#       KeyName: !Ref KeyNameParameter # Usando el parámetro de Key Pair
#       SecurityGroupIds:
#         - !GetAtt WebServerSecurityGroup.GroupId
#       Tags:
#         - Key: Name
#           Value: !Sub "${AWS::StackName}-WebServer" # Nombre dinámico basado en el Stack
#
# Outputs:
#   WebsiteURL:
#     Description: La URL pública para acceder a la aplicación web.
#     Value: !Sub "http://${WebServerInstance.PublicIp}"
#   SSHCommand:
#     Description: Comando SSH para conectarse a la instancia.
#     Value: !Sub "ssh -i ${KeyNameParameter}.pem ec2-user@${WebServerInstance.PublicIp}"
#
# # INCORRECTO: Plantilla con errores de sintaxis o lógica, o que omite secciones críticas.
# # AWSTemplateFormatVersion: '2010-09-09'
# # Description: Una plantilla mal formada o incompleta.
# #
# # # Falta la sección Resources o está vacía, no se crea nada.
# # # O errores tipográficos como 'Resorces' en lugar de 'Resources'.
# # # O intentar usar un tipo de recurso incorrecto, ej. 'AWS::EC2::S3Bucket'.
# # # O no definir los tipos de parámetros correctamente.
# #
# # Parameters:
# #   MyParam:
# #     Type: String # Error: falta Default o un valor válido si no es opcional
# #
# # Outputs:
# #   MyOutput:
# #     Value: !Ref NonExistentResource # Error: referencia a un recurso que no existe
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 4,
    'title_level': 'DevOps en AWS',
    'topic': 'Infrastructure as Code',
    'subtopic': 'Change Sets',
    'definition': '''
Los Change Sets (Conjuntos de Cambios) en AWS CloudFormation te permiten previsualizar los cambios que se realizarán en tu infraestructura de AWS antes de aplicarlos a tu stack. Piensa en un Change Set como una "vista previa" o un "borrador" de lo que sucederá cuando actualices tu infraestructura. Te muestra exactamente qué recursos se añadirán, modificarán o eliminarán.

¿Te estás preguntando por qué esta previsualización es tan crucial antes de actualizar un entorno en producción?

Aquí te va la aclaración: Modificar la infraestructura existente, especialmente en entornos de producción, puede ser riesgoso. Un cambio inesperado puede causar interrupciones o incluso eliminar recursos críticos. Con CloudFormation, puedes crear un Change Set para cualquier actualización de plantilla.

Cuando creas un Change Set, CloudFormation compara tu nueva plantilla con la plantilla actual del stack y genera un informe detallado de las diferencias. Este informe te muestra:
* **Recursos que se añadirán:** Nuevos recursos que se crearán.
* **Recursos que se modificarán:** Recursos existentes que verán cambios en sus propiedades.
* **Recursos que se eliminarán:** Recursos existentes que serán eliminados del stack (¡esto es especialmente importante para detectar eliminaciones accidentales!).
* **Reemplazos de recursos:** Algunos cambios en las propiedades de un recurso (ej., el tipo de instancia de una EC2) pueden requerir que CloudFormation elimine el recurso viejo y cree uno nuevo con la nueva configuración. Los Change Sets te lo advierten.

Una vez que has revisado el Change Set y estás satisfecho con los cambios propuestos, puedes ejecutarlo para aplicar esas modificaciones a tu stack. Si el Change Set muestra algo inesperado, puedes cancelarlo y revisar tu plantilla antes de causar un problema. Esta capacidad de "vista previa" es invaluable para prevenir errores en la infraestructura, mejorar la confianza en tus despliegues y mantener la estabilidad de tus entornos. Es una práctica de seguridad fundamental en el manejo de la infraestructura como código.
''',
    'code_example': r'''
# Los Change Sets se gestionan principalmente a través de la AWS CLI o la consola de CloudFormation.
# No hay un bloque directo de CloudFormation para definir un Change Set en sí, sino comandos para crearlo y ejecutarlo.

# CORRECTO: Comandos de AWS CLI para crear y ejecutar un Change Set.
# # Paso 1: Crear un Change Set para una actualización de stack
# # Esto no aplica los cambios, solo genera el informe de diferencias.
# aws cloudformation create-change-set \
#   --stack-name MyProductionStack \
#   --change-set-name AddNewWebServer \
#   --template-body file://new-template.yaml \
#   --parameters ParameterKey=InstanceTypeParameter,ParameterValue=t2.medium \
#   --capabilities CAPABILITY_IAM # Necesario si la plantilla crea/modifica roles IAM
#
# # Paso 2: Describir el Change Set para ver los cambios propuestos
# aws cloudformation describe-change-set \
#   --change-set-name AddNewWebServer \
#   --stack-name MyProductionStack
#
# # Paso 3: Ejecutar el Change Set si los cambios son aceptables
# aws cloudformation execute-change-set \
#   --change-set-name AddNewWebServer \
#   --stack-name MyProductionStack
#
# # Paso 4 (Opcional): Eliminar el Change Set si no se va a ejecutar o después de ejecutarse
# aws cloudformation delete-change-set \
#   --change-set-name AddNewWebServer \
#   --stack-name MyProductionStack
#
# # INCORRECTO: Actualizar un stack directamente sin previsualizar los cambios.
# # Esto puede llevar a cambios inesperados o eliminaciones accidentales de recursos.
# # # Actualizar el stack directamente, sin un Change Set previo.
# # # Esto aplica los cambios inmediatamente sin darte la oportunidad de revisarlos.
# # aws cloudformation update-stack \
# #   --stack-name MyProductionStack \
# #   --template-body file://new-template.yaml \
# #   --parameters ParameterKey=InstanceTypeParameter,ParameterValue=t2.medium \
# #   --capabilities CAPABILITY_IAM
# #
# # # Si new-template.yaml tiene un error o un cambio no intencional (ej. elimina un recurso),
# # # este comando lo ejecutará sin advertencia explícita.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 4,
    'title_level': 'DevOps en AWS',
    'topic': 'Infrastructure as Code',
    'subtopic': 'Stack Policies',
    'definition': '''
Las Stack Policies (Políticas de Stack) en AWS CloudFormation son reglas de seguridad que te permiten proteger recursos específicos dentro de un stack de cambios o eliminaciones accidentales durante las actualizaciones del stack. Piensa en una Stack Policy como un "seguro" o una "cerradura" que colocas en tus recursos más críticos para evitar que sean modificados o borrados sin una aprobación explícita o solo bajo ciertas condiciones.

¿Te estás preguntando por qué esto es tan vital, especialmente en entornos de producción donde un error puede tener consecuencias graves?

Aquí te va la aclaración: Cuando actualizas un stack de CloudFormation, todos los recursos definidos en la plantilla están sujetos a cambios. Si, por ejemplo, modificas accidentalmente el nombre lógico de una base de datos en tu plantilla, CloudFormation podría interpretarlo como una eliminación de la base de datos antigua y la creación de una nueva, lo que podría borrar tus datos. Las Stack Policies están diseñadas para prevenir este tipo de desastres.

Una Stack Policy es un documento JSON que defines para tu stack. En este documento, especificas qué acciones (como `Update:Replace`, `Update:Delete`, `Update:Modify`) están permitidas o denegadas para ciertos recursos (identificados por su ID lógico o su tipo).

Por ejemplo, podrías tener una política de stack que diga:
* "Denegar la eliminación de cualquier recurso de base de datos (`AWS::RDS::DBInstance`)."
* "Permitir todas las modificaciones a recursos que no sean bases de datos."
* "Permitir la eliminación de la base de datos solo si el ID lógico es 'MyTestDB'."

Cuando una Stack Policy está activa, CloudFormation evalúa cada cambio propuesto (por ejemplo, a través de un Change Set) contra esta política. Si un cambio viola la política (ej., intenta eliminar un recurso protegido), la operación de actualización falla. Para actualizar un recurso protegido, tendrías que sobrescribir temporalmente la Stack Policy para esa actualización específica, lo que requiere un paso consciente y explícito, y no ocurre por accidente.

Las Stack Policies son una capa de seguridad adicional crucial para la infraestructura como código. Te dan un control granular sobre las operaciones de actualización, especialmente en entornos de producción, reduciendo el riesgo de errores humanos y protegiendo tus recursos más valiosos de modificaciones no deseadas. Son una herramienta indispensable para cualquier estrategia de DevOps madura.
''',
    'code_example': r'''
# Las Stack Policies se configuran al crear o actualizar un stack, no dentro de la plantilla.
# Son un documento JSON separado.

# CORRECTO: Ejemplo de una Stack Policy que protege una tabla DynamoDB de ser eliminada.
# # Stack Policy (save-my-db-policy.json)
# {
#   "Statement": [
#     {
#       "Effect": "Deny", # Denegar la acción
#       "Action": [
#         "Update:Delete",  # Denegar la eliminación
#         "Update:Replace"  # Denegar el reemplazo (que también implica una eliminación)
#       ],
#       "Principal": "*", # Aplica a cualquier usuario
#       "Resource": "LogicalResourceId/MyProductionDynamoDBTable", # El ID lógico de la tabla en tu plantilla
#       "Condition": {
#         "StringEquals": {
#           "ResourceType": [
#             "AWS::DynamoDB::Table" # Solo aplica a recursos de tipo DynamoDB Table
#           ]
#         }
#       }
#     },
#     {
#       "Effect": "Allow", # Permitir todas las demás acciones por defecto
#       "Action": "Update:*",
#       "Principal": "*",
#       "Resource": "*"
#     }
#   ]
# }
#
# # Comandos AWS CLI para aplicar la Stack Policy al crear o actualizar un stack.
# # Crear un stack con una Stack Policy:
# # aws cloudformation create-stack \
# #   --stack-name MyProtectedAppStack \
# #   --template-body file://my-app-template.yaml \
# #   --stack-policy-body file://save-my-db-policy.json
#
# # Actualizar un stack y aplicar una Stack Policy (si no tiene una):
# # aws cloudformation set-stack-policy \
# #   --stack-name MyProtectedAppStack \
# #   --stack-policy-body file://save-my-db-policy.json
#
# # Actualizar un recurso protegido (requiere sobrescribir la política temporalmente)
# # aws cloudformation update-stack \
# #   --stack-name MyProtectedAppStack \
# #   --template-body file://updated-template.yaml \
# #   --stack-policy-during-update-body file://allow-temp-delete-policy.json # Una política más permisiva solo para esta actualización
#
# # INCORRECTO: No usar Stack Policies y depender solo de permisos IAM para la protección.
# # Aunque IAM es crucial, una Stack Policy añade una capa de protección en el nivel del stack.
# # Un usuario con permisos IAM para eliminar un recurso de CloudFormation podría hacerlo
# # si no hay una Stack Policy activa para evitarlo durante una actualización de stack.
# #
# # # Esto no es código, sino la omisión de una práctica de seguridad importante.
# # # Si no hay Stack Policy, cualquier cambio accidental que implique una eliminación
# # # o reemplazo se ejecutaría si el usuario que realiza la actualización tiene permisos.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 4,
    'title_level': 'DevOps en AWS',
    'topic': 'Configuración Automatizada',
    'subtopic': 'AWS OpsWorks',
    'definition': '''
AWS OpsWorks es un servicio de gestión de configuración que te permite operar aplicaciones de forma repetible y automatizada, utilizando Chef o Puppet. Piensa en OpsWorks como si tuvieras un chef de cocina o un titiritero que no solo prepara y sirve tus platos (tus aplicaciones), sino que también mantiene la cocina (tu infraestructura) en perfecto orden, siguiendo recetas (código de Chef) o guiones (código de Puppet) predefinidos.

¿Te estás preguntando cómo OpsWorks puede simplificar la gestión de servidores y el despliegue de aplicaciones, incluso si usas configuraciones complejas?

Aquí te va la aclaración: A medida que tu infraestructura crece, mantener la consistencia en la configuración de los servidores, desplegar nuevas versiones de software y asegurar que todo funcione como se espera se convierte en un desafío enorme. OpsWorks aborda esto proporcionando una forma de automatizar estas tareas.

OpsWorks ofrece dos tipos principales de stacks:
* **OpsWorks for Chef Automate:** Proporciona un servidor Chef totalmente gestionado. Chef es una plataforma de automatización que utiliza "recetas" (scripts de Ruby) para describir cómo debe ser configurado un servidor. Con este servicio, te concentras en escribir tus recetas, y AWS se encarga de la infraestructura del servidor Chef. Esto es ideal si ya estás familiarizado con Chef o necesitas un control muy granular sobre la configuración de tus instancias.
* **OpsWorks Stacks:** Es un servicio de gestión de configuración de aplicaciones que te permite modelar tus aplicaciones como "stacks" (pilas) de capas (layers) de instancias. Cada capa tiene un propósito específico (ej., una capa de servidor web, una capa de base de datos). Puedes usar Chef (y sus recetas) o Puppet para automatizar la configuración y el despliegue de software en las instancias de estas capas.

OpsWorks maneja el aprovisionamiento de instancias EC2, la instalación del sistema operativo y los paquetes, el despliegue de código, y la configuración de los servicios. Es una solución de gestión de configuración que se integra bien con el ecosistema de AWS y es útil para equipos que buscan un alto grado de automatización en la configuración de sus servidores, especialmente si ya tienen experiencia con Chef o Puppet. Ofrece un buen equilibrio entre flexibilidad y gestión.
''',
    'code_example': r'''
# AWS OpsWorks se configura a través de la consola o la AWS CLI.
# Aquí no hay un "código de OpsWorks" per se, sino la interacción con el servicio.
# El "código" principal serían los Chef Cookbooks o Puppet Manifests.

# CORRECTO: Ejemplo conceptual de cómo se definiría una "receta" de Chef (parte de un Cookbook).
# Esta receta instalaría Nginx.

# # Ejemplo de una receta Chef (default.rb en un cookbook llamado 'nginx')
# # Este archivo iría en tu repositorio de Chef Cookbooks, no directamente en CloudFormation.
#
# package 'nginx' do # Asegura que el paquete Nginx esté instalado
#   action :install
# end
#
# service 'nginx' do # Asegura que el servicio Nginx esté corriendo y habilitado al inicio
#   action [:enable, :start]
# end
#
# template '/etc/nginx/nginx.conf' do # Crea o actualiza el archivo de configuración de Nginx
#   source 'nginx.conf.erb' # Usa una plantilla ERB para el archivo de configuración
#   owner 'root'
#   group 'root'
#   mode '0644'
#   notifies :reload, 'service[nginx]' # Recarga Nginx si el archivo de configuración cambia
# end
#
# # Para desplegar esto con OpsWorks, configurarías un Layer (Capa) para Nginx
# # en tu Stack de OpsWorks y le asociarías este Cookbook y receta.
#
# # INCORRECTO: Realizar la configuración de servidores y el despliegue de software manualmente.
# # Esto es lento, propenso a errores y no escala, anulando los beneficios de OpsWorks.
# # No hay un ejemplo de código para esto, ya que es la ausencia de automatización.
# # Sería el proceso de:
# # 1. Lanzar una instancia EC2.
# # 2. Conectarse vía SSH.
# # 3. Ejecutar comandos `apt-get install nginx`, `cp nginx.conf`, `systemctl start nginx`.
# # 4. Repetir manualmente para cada servidor.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 4,
    'title_level': 'DevOps en AWS',
    'topic': 'Configuración Automatizada',
    'subtopic': 'Chef y Puppet en AWS',
    'definition': '''
Chef y Puppet son dos de las herramientas de gestión de configuración más populares y robustas en el ámbito de DevOps. En AWS, se integran para ayudarte a automatizar la configuración de servidores, el despliegue de aplicaciones y la aplicación de políticas de seguridad. Piensa en Chef y Puppet como arquitectos que no solo diseñan edificios (tu infraestructura), sino que también supervisan cada paso de la construcción para asegurarse de que todo esté exactamente como lo planearon, desde los cimientos hasta el último detalle.

¿Te estás preguntando cómo estas herramientas te dan un control tan preciso sobre la configuración de tu infraestructura?

Aquí te va la aclaración: Mantener un conjunto consistente de configuraciones en cientos o miles de servidores es una pesadilla manual. Chef y Puppet resuelven esto permitiéndote definir el "estado deseado" de tus servidores en un código declarativo.

* **Chef:** Utiliza "recetas" (escritas en Ruby) que se agrupan en "cookbooks". Una receta describe un conjunto de recursos (paquetes, servicios, archivos, usuarios) y su estado deseado. El "Chef Client" se ejecuta en cada servidor y se comunica con un "Chef Server" para obtener las recetas y aplicarlas, llevando el servidor a su estado deseado. AWS ofrece OpsWorks for Chef Automate como un servicio gestionado.
* **Puppet:** Utiliza "manifiestos" (escritos en un lenguaje declarativo propio) para describir la configuración del sistema. El "Puppet Agent" se ejecuta en cada servidor y se comunica con un "Puppet Master" para obtener y aplicar los manifiestos, asegurando la consistencia del estado del servidor. AWS también soporta Puppet Enterprise en sus servicios.

Ambas herramientas permiten:
* **Idempotencia:** Puedes ejecutar el código de configuración varias veces en el mismo servidor y siempre producirá el mismo resultado, sin causar efectos secundarios no deseados.
* **Control de versiones:** El código de configuración se gestiona en sistemas como Git.
* **Escalabilidad:** Configuran rápidamente nuevos servidores a gran escala.
* **Auditoría y cumplimiento:** Proporcionan un registro de los cambios de configuración.

Al usar Chef o Puppet en AWS, ya sea con OpsWorks o auto-gestionando tus servidores de Chef/Puppet en EC2, puedes automatizar la configuración y el despliegue a una escala masiva, asegurando la consistencia, reduciendo los errores manuales y acelerando tus procesos de DevOps. Son pilares fundamentales para la gestión de infraestructura compleja y crítica.
''',
    'code_example': r'''
# Ejemplos simplificados de código de Chef (receta) y Puppet (manifiesto).

# CORRECTO:
# # Ejemplo de una receta Chef (install_apache.rb)
# # Esto instalaría el servidor web Apache
# package 'apache2' do
#   action :install
# end
#
# service 'apache2' do
#   action [:enable, :start]
# end
#
# template '/var/www/html/index.html' do
#   source 'index.html.erb'
#   owner 'www-data'
#   group 'www-data'
#   mode '0644'
# end
#
# # Ejemplo de un manifiesto Puppet (apache.pp)
# # Esto también instalaría Apache y aseguraría que el servicio esté corriendo.
# class apache {
#   package { 'apache2':
#     ensure => installed,
#   }
#
#   service { 'apache2':
#     ensure => running,
#     enable => true,
#     require => Package['apache2'], # Asegura que el paquete se instale primero
#   }
#
#   file { '/var/www/html/index.html':
#     ensure  => file,
#     content => '<h1>Hello from Puppet!</h1>',
#     owner   => 'www-data',
#     group   => 'www-data',
#     mode    => '0644',
#     require => Package['apache2'],
#   }
# }
#
# # INCORRECTO: Realizar configuraciones ad-hoc o manuales en servidores individuales.
# # Esto conduce a "desfase de configuración" (configuration drift) y dificulta la replicación.
# # No hay un bloque de código para esto, ya que es la falta de uso de Chef/Puppet.
# # Sería similar a los ejemplos INCORRECTOS de OpsWorks, donde se realizan comandos SSH manuales.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 4,
    'title_level': 'DevOps en AWS',
    'topic': 'Configuración Automatizada',
    'subtopic': 'AWS AppConfig',
    'definition': '''
AWS AppConfig es un servicio que te permite gestionar y desplegar configuraciones de aplicaciones rápidamente y de forma controlada, separándolas de tu código. Piensa en AppConfig como un centro de control remoto para las características y el comportamiento de tu aplicación: puedes cambiar la configuración de tus aplicaciones en tiempo real, sin necesidad de desplegar nuevo código o reiniciar tus servidores.

¿Te estás preguntando por qué esta separación entre código y configuración es tan valiosa, especialmente en entornos dinámicos?

Aquí te va la aclaración: A menudo, las aplicaciones tienen parámetros que cambian con frecuencia (ej., un umbral para una alarma, la URL de un servicio externo, un porcentaje para un descuento promocional). Si estos parámetros están codificados o requieren un nuevo despliegue de software cada vez que cambian, el proceso puede ser lento y riesgoso. AppConfig resuelve esto al permitirte almacenar tu configuración en un lugar centralizado y desplegarla de forma segura.

AppConfig funciona con varios componentes clave:
* **Aplicaciones (Applications):** Un contenedor lógico para tus configuraciones.
* **Entornos (Environments):** Representa un entorno de despliegue lógico (ej., desarrollo, pruebas, producción). Puedes desplegar diferentes configuraciones en diferentes entornos.
* **Perfiles de configuración (Configuration profiles):** Define los datos de configuración que tu aplicación consumirá, apuntando a una fuente de datos (ej., un documento JSON en S3, AWS Systems Manager Parameter Store).
* **Despliegues (Deployments):** Cuando quieres actualizar una configuración, creas un "despliegue" en AppConfig. Lo genial es que puedes definir estrategias de despliegue:
    * **Validación:** AppConfig puede ejecutar una función Lambda o una expresión CloudWatch para validar la nueva configuración antes de desplegarla.
    * **Despliegues escalonados:** Puedes desplegar la configuración a un pequeño porcentaje de tus instancias primero, luego gradualmente a más, y monitorear si hay errores. Si detecta un problema, puede revertir automáticamente.
    * **Rollbacks:** Si algo sale mal, AppConfig puede revertir a la configuración anterior conocida y funcional.

AppConfig es especialmente útil para gestionar feature flags, umbrales de servicio, o cualquier parámetro que necesite ser ajustado dinámicamente sin la sobrecarga y el riesgo de un despliegue de código completo. Esto te permite tener una mayor agilidad y seguridad en la gestión de tu aplicación en producción.
''',
    'code_example': r'''
# Configuración de AWS AppConfig implica la creación de una aplicación, entorno, perfil de configuración,
# y luego un despliegue.

# CORRECTO: Ejemplo de definición de una aplicación AppConfig y un perfil de configuración que apunta a un documento S3.
# Resources:
#   MyAppConfigApplication:
#     Type: AWS::AppConfig::Application
#     Properties:
#       Name: MyWebApp
#       Description: Aplicación para gestionar configuraciones de MyWebApp
#
#   MyAppConfigEnvironment:
#     Type: AWS::AppConfig::Environment
#     Properties:
#       ApplicationId: !Ref MyAppConfigApplication
#       Name: Production
#       Description: Entorno de producción para MyWebApp
#
#   MyAppConfigConfigurationProfile:
#     Type: AWS::AppConfig::ConfigurationProfile
#     Properties:
#       ApplicationId: !Ref MyAppConfigApplication
#       Name: FeatureFlagsProfile
#       Description: Perfil para gestionar feature flags
#       LocationUri: arn:aws:s3:::my-appconfig-bucket/feature-flags.json # Fuente de la configuración
#       RetrievalRoleArn: arn:aws:iam::123456789012:role/AppConfigS3AccessRole # Rol para acceder a S3
#       # Opcional: Para validación de la configuración
#       # Validators:
#       #   - Type: LAMBDA
#       #     Content: arn:aws:lambda:us-east-1:123456789012:function:ValidateFeatureFlagsLambda
#
# # Ejemplo de cómo un código de aplicación leería la configuración (pseudocódigo Python)
# # import boto3
# # appconfig = boto3.client('appconfigdata')
# #
# # def get_feature_flags():
# #     # Iniciar una sesión de configuración
# #     start_config_session_response = appconfig.start_configuration_session(
# #         ApplicationIdentifier='MyWebApp',
# #         ConfigurationProfileIdentifier='FeatureFlagsProfile',
# #         EnvironmentIdentifier='Production',
# #         RequiredMinimumPollIntervalInSeconds=15
# #     )
# #     initial_token = start_config_session_response['InitialConfigurationToken']
# #
# #     # Obtener la configuración
# #     get_config_response = appconfig.get_latest_configuration(
# #         ConfigurationToken=initial_token
# #     )
# #     # La configuración está en get_config_response['Configuration']['Body']
# #     # Aquí se procesaría el JSON
# #     return json.loads(get_config_response['Configuration']['Body'].read().decode('utf-8'))
#
#
# # INCORRECTO: Codificar la configuración directamente en el código de la aplicación.
# # Esto requiere un nuevo despliegue de código para cada cambio de configuración.
# # # Ejemplo de configuración codificada en el código (Node.js)
# # // exports.handler = async (event) => {
# # //   const FEATURE_A_ENABLED = true; // Hardcoded, requires code redeploy to change
# # //   const DISCOUNT_PERCENTAGE = 0.10; // Hardcoded
# # //
# # //   if (FEATURE_A_ENABLED) {
# # //     console.log('Feature A is active!');
# # //   }
# # //
# # //   // ...
# # // };
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 4,
    'title_level': 'DevOps en AWS',
    'topic': 'Configuración Automatizada',
    'subtopic': 'Feature Flags',
    'definition': '''
Los Feature Flags (también conocidos como Feature Toggles o Feature Switches) son una técnica de desarrollo que te permite activar o desactivar funcionalidades de tu aplicación en tiempo de ejecución, sin tener que desplegar nuevo código. Piensa en ellos como interruptores de luz individuales para cada característica de tu aplicación: puedes encender o apagar una característica para un grupo de usuarios o en un entorno específico, en cualquier momento.

¿Te estás preguntando por qué esto es un "superpoder" en el desarrollo y despliegue de software moderno?

Aquí te va la aclaración: Los Feature Flags son fundamentales para la entrega continua y el despliegue de DevOps, ya que desacoplan el despliegue de código de la liberación de características. Tradicionalmente, cuando una nueva característica está lista, tienes que desplegar todo el código para que sea visible para todos los usuarios. Si algo sale mal, el rollback es costoso.

Con los Feature Flags, puedes:
* **Despliegues más seguros:** Despliegas tu código con la nueva característica desactivada por defecto. Una vez en producción, la activas gradualmente para un pequeño porcentaje de usuarios (despliegue canario) o un grupo de pruebas. Si hay problemas, simplemente desactivas el flag sin necesidad de un rollback de código.
* **Pruebas A/B:** Puedes mostrar diferentes versiones de una característica a distintos segmentos de usuarios para ver cuál funciona mejor.
* **Personalización y segmentación:** Activar características específicas para usuarios premium, por región, o por cualquier otro criterio.
* **Despliegues oscuros (Dark Launches):** Lanzar una característica al 100% de los usuarios, pero mantenerla "oscura" (desactivada) mientras se monitorea su rendimiento en producción, y luego activarla cuando estés listo.
* **Eliminación de ramas de características:** Reduce la complejidad de la gestión de ramas en Git, ya que las características incompletas pueden integrarse en la rama principal pero mantenerse desactivadas.

AWS AppConfig es un servicio excelente para gestionar Feature Flags a escala, ya que te permite almacenar las configuraciones de tus flags y desplegarlas de forma controlada y segura, con validación y reversión automática. Esta técnica te da una agilidad sin precedentes para lanzar nuevas funcionalidades, experimentar con tu base de usuarios y mitigar riesgos en un entorno de producción. Es una herramienta poderosa para cualquier equipo que busque innovar rápidamente y con confianza.
''',
    'code_example': r'''
# Los Feature Flags se gestionan a través de un servicio (como AWS AppConfig) y se consultan desde el código de la aplicación.

# CORRECTO: Ejemplo de cómo una aplicación podría usar un Feature Flag para activar una nueva característica.
# # Pseudocódigo Python para consumir un Feature Flag (asumiendo que AppConfig ya entregó la configuración)
#
# # feature_flags_config = {
# #     "new_checkout_experience": True,
# #     "promo_discount_enabled": False,
# #     "beta_features_group": ["user_id_123", "user_id_456"]
# # }
#
# def render_checkout_page(user_id):
#     # Aquí, la configuración de feature flags sería obtenida de AWS AppConfig
#     # (ej. a través del SDK o un cliente local que cachea la config)
#     feature_flags = get_latest_feature_flags_from_appconfig()
#
#     if feature_flags.get("new_checkout_experience", False):
#         print("Mostrando la nueva experiencia de checkout.")
#         # Lógica para mostrar la nueva UI/flujo de checkout
#     else:
#         print("Mostrando la experiencia de checkout clásica.")
#         # Lógica para mostrar la UI/flujo antiguo
#
#     if feature_flags.get("promo_discount_enabled", False):
#         print("Descuento promocional activo.")
#         # Aplicar lógica de descuento
#     else:
#         print("Descuento promocional inactivo.")
#
#     if user_id in feature_flags.get("beta_features_group", []):
#         print(f"Usuario {user_id} en el grupo de beta features.")
#         # Activar características beta para este usuario
#
# # Ejemplo de uso:
# # render_checkout_page("user_id_789") # Podría ver el checkout clásico
# # render_checkout_page("user_id_123") # Podría ver la nueva experiencia y características beta
#
# # INCORRECTO: Desplegar el código de una característica incompleta o experimental directamente a producción.
# # Esto puede exponer funcionalidades inestables a los usuarios finales o causar errores.
# #
# # # Si no usas Feature Flags, el código de la nueva característica se activaría
# # # para todos los usuarios tan pronto como se despliegue.
# # # No hay un bloque de código para esto, ya que es la ausencia de la técnica.
# # # Sería simplemente el código de la característica sin ninguna condición
# # # que lo habilite o deshabilite dinámicamente.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 4,
    'title_level': 'DevOps en AWS',
    'topic': 'Monitoreo Avanzado',
    'subtopic': 'CloudWatch Logs Insights',
    'definition': '''
CloudWatch Logs Insights es una potente herramienta interactiva de AWS que te permite buscar, analizar y visualizar logs de forma eficiente. Pensemos en Logs Insights como un detective de datos ultra rápido para tus logs: en lugar de buscar manualmente a través de terabytes de texto, puedes hacer preguntas complejas a tus logs y obtener respuestas en segundos, descubriendo patrones y anomalías.

¿Te estás preguntando por qué esto es un salto gigante frente a la revisión manual de logs y cómo te ayuda a resolver problemas más rápido?

Aquí te va la aclaración: En un entorno de nube moderno, tus aplicaciones y servicios generan una cantidad masiva de datos de logs. Intentar encontrar la causa raíz de un problema o detectar tendencias de rendimiento revisando miles o millones de líneas de logs es prácticamente imposible. Logs Insights revoluciona esto.

Logs Insights utiliza un lenguaje de consulta potente pero sencillo de aprender, similar a SQL. Puedes usarlo para:
* **Búsqueda rápida:** Encuentra eventos específicos, errores o patrones en tus logs en cuestión de segundos, incluso a través de múltiples grupos de logs.
* **Análisis de rendimiento:** Consulta los tiempos de latencia, el uso de memoria o cualquier otra métrica que expongan tus logs.
* **Identificación de errores:** Agrupa logs por tipo de error, cuenta la frecuencia de ciertos mensajes o filtra por niveles de severidad.
* **Visualización de datos:** Los resultados de tus consultas pueden ser visualizados en gráficos de barras, gráficos de líneas o tablas, lo que facilita la identificación de tendencias.
* **Campos automáticos:** Logs Insights detecta automáticamente los campos en tus logs, lo que facilita la consulta sin necesidad de parsear manualmente.

Puedes usar Logs Insights con logs de casi cualquier servicio de AWS que envíe logs a CloudWatch Logs (Lambda, EC2, ECS, VPC Flow Logs, etc.). Es una herramienta indispensable para equipos de DevOps y desarrolladores que necesitan depurar aplicaciones, monitorear el rendimiento y asegurar la salud de sus sistemas en la nube de forma proactiva y eficiente. Empresas que operan a gran escala confían en herramientas como esta para mantener la observabilidad de sus sistemas.
''',
    'code_example': r'''
# CloudWatch Logs Insights se usa principalmente a través de la consola de AWS o la AWS CLI.
# Aquí no hay una plantilla de CloudFormation para ello, sino ejemplos de consultas.

# CORRECTO: Ejemplos de consultas de CloudWatch Logs Insights.
# # Consulta 1: Contar la frecuencia de errores en un grupo de logs de Lambda
# fields @timestamp, @message
# | filter @message like /ERROR/ or @message like /Exception/
# | stats count() as errorCount by bin(5m) # Contar errores cada 5 minutos
# | sort @timestamp desc
#
# # Consulta 2: Analizar la latencia de una función Lambda
# # Asume que tus logs de Lambda tienen un campo 'duration' o puedes extraerlo del mensaje.
# fields @timestamp, @message, @requestId
# | filter @message like /^REPORT/
# | parse @message "Duration: * ms" as duration
# | stats avg(duration) as avgDuration, max(duration) as maxDuration by bin(1h)
# | sort @timestamp asc
#
# # Consulta 3: Encontrar los 10 principales IPs que acceden a un API Gateway (desde VPC Flow Logs)
# # Asume que estás consultando logs de flujo de VPC (VPC Flow Logs)
# fields @timestamp, @message, srcAddr, action
# | filter logStatus = "OK" and action = "ACCEPT"
# | stats count() as accessCount by srcAddr
# | sort accessCount desc
# | limit 10
#
# # INCORRECTO: Revisar los logs línea por línea en la consola de CloudWatch o descargándolos.
# # Esto es extremadamente ineficiente y no permite un análisis rápido de grandes volúmenes de datos.
# # No hay un ejemplo de código para esto, ya que es la falta de uso de Logs Insights.
# # Sería el proceso de:
# # 1. Abrir un grupo de logs en CloudWatch.
# # 2. Filtrar manualmente por texto o ID.
# # 3. Desplazarse por las páginas de logs para encontrar información.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 4,
    'title_level': 'DevOps en AWS',
    'topic': 'Monitoreo Avanzado',
    'subtopic': 'CloudWatch Alarms avanzadas',
    'definition': '''
Las CloudWatch Alarms avanzadas te permiten monitorear métricas, logs o eventos de AWS y activar acciones automáticas cuando se cumplen ciertos umbrales complejos. Piensa en estas alarmas como un sistema de seguridad inteligente para tu infraestructura: en lugar de solo sonar una sirena cuando algo se rompe, pueden detectar patrones más sutiles de problemas o incluso predecir fallos, y luego tomar medidas, como escalar un servicio o revertir un despliegue.

¿Te estás preguntando cómo estas alarmas van más allá de un simple "CPU alto" y te permiten una observabilidad proactiva y automatizada?

Aquí te va la aclaración: Las alarmas básicas de CloudWatch son útiles, pero las avanzadas te dan mucha más flexibilidad. Puedes combinar múltiples métricas, usar funciones matemáticas, monitorear anomalías o incluso basar alarmas en los resultados de consultas de logs.

Algunas características de las CloudWatch Alarms avanzadas incluyen:
* **Alarmas compuestas:** Puedes combinar el estado de múltiples alarmas simples usando lógica booleana (`AND`, `OR`, `NOT`). Por ejemplo, podrías tener una alarma que se dispare solo si el "CPU está alto" **Y** el "número de solicitudes fallidas" también está alto. Esto reduce el "ruido" de falsos positivos.
* **Alarmas de anomalías:** CloudWatch puede aprender el comportamiento normal de una métrica y luego disparar una alarma si el valor de la métrica se desvía significativamente de lo que se espera. Esto es genial para detectar problemas inesperados antes de que se conviertan en incidentes mayores.
* **Alarmas basadas en consultas de Logs Insights:** Puedes crear una consulta en Logs Insights y luego usar los resultados de esa consulta como la base para tu alarma. Por ejemplo, una alarma que se dispare si el número de mensajes de error de un log excede un umbral en un período de tiempo.
* **Métricas matemáticas:** Puedes crear métricas combinando otras métricas usando operaciones matemáticas. Por ejemplo, dividir el número de errores por el número total de solicitudes para obtener una tasa de error.
* **Configuración de acciones:** Cuando una alarma se dispara, puede:
    * Enviar notificaciones a través de Amazon SNS (ej., correo electrónico, SMS, Slack).
    * Auto-escalar tus instancias EC2 o tus servicios ECS.
    * Detener, terminar o reiniciar instancias EC2.
    * Ejecutar acciones de Systems Manager.

Al usar CloudWatch Alarms avanzadas, puedes construir un sistema de monitoreo robusto y proactivo que no solo te alerta sobre problemas, sino que también puede tomar medidas correctivas automáticamente. Esto es fundamental para mantener la estabilidad, el rendimiento y la disponibilidad de tus aplicaciones en la nube.
''',
    'code_example': r'''
# Las CloudWatch Alarms avanzadas se definen en CloudFormation o a través de la consola/CLI.

# CORRECTO: Ejemplo de una alarma compuesta en CloudFormation.
# Resources:
#   # Alarma de CPU alto para un Auto Scaling Group
#   HighCpuAlarm:
#     Type: AWS::CloudWatch::Alarm
#     Properties:
#       AlarmName: WebAppHighCpuUtilization
#       ComparisonOperator: GreaterThanOrEqualToThreshold
#       EvaluationPeriods: 2
#       MetricName: CPUUtilization
#       Namespace: AWS/EC2
#       Period: 300 # 5 minutos
#       Statistic: Average
#       Threshold: 80
#       Dimensions:
#         - Name: AutoScalingGroupName
#           Value: MyWebAppAutoScalingGroup
#       AlarmDescription: "CPU promedio mayor o igual a 80% por 10 minutos."
#       TreatMissingData: notBreaching # No disparar si faltan datos
#
#   # Alarma de errores en el balanceador de carga (HTTPCode_Target_5XX_Count)
#   Target5xxErrorsAlarm:
#     Type: AWS::CloudWatch::Alarm
#     Properties:
#       AlarmName: WebAppTarget5xxErrors
#       ComparisonOperator: GreaterThanOrEqualToThreshold
#       EvaluationPeriods: 1
#       MetricName: HTTPCode_Target_5XX_Count
#       Namespace: AWS/ApplicationELB
#       Period: 60 # 1 minuto
#       Statistic: Sum
#       Threshold: 10 # Más de 10 errores 5xx en 1 minuto
#       Dimensions:
#         - Name: LoadBalancer
#           Value: !GetAtt MyAlb.LoadBalancerFullName # Tu ALB
#         - Name: TargetGroup
#           Value: !GetAtt MyTargetGroup.TargetGroupFullName # Tu Target Group
#       AlarmDescription: "Más de 10 errores 5xx en el Target Group por minuto."
#       TreatMissingData: notBreaching
#
#   # Alarma Compuesta: Se dispara solo si AMBAS alarmas anteriores están en estado ALARM
#   CompositeWebAppIssueAlarm:
#     Type: AWS::CloudWatch::CompositeAlarm
#     Properties:
#       AlarmName: WebAppMajorIncident
#       AlarmRule: !Sub "ALARM(\"${HighCpuAlarm}\") AND ALARM(\"${Target5xxErrorsAlarm}\")"
#       AlarmDescription: "Indica un problema mayor de rendimiento (CPU alto Y errores 5xx)."
#       ActionsEnabled: true
#       AlarmActions:
#         - !Ref SNSTopicForCriticalAlerts # Un tópico SNS para enviar notificaciones críticas
#
# # INCORRECTO: Usar solo alarmas simples con umbrales fijos sin considerar la correlación
# # o el comportamiento normal de la métrica. Esto lleva a muchos falsos positivos (ruido)
# # o a no detectar problemas sutiles.
# # # Alarma de CPU simple sin contexto.
# # Resources:
# #   SimpleCpuAlarm:
# #     Type: AWS::CloudWatch::Alarm
# #     Properties:
# #       AlarmName: SimpleCpuAlarm
# #       ComparisonOperator: GreaterThanOrEqualToThreshold
# #       EvaluationPeriods: 1
# #       MetricName: CPUUtilization
# #       Namespace: AWS/EC2
# #       Period: 60
# #       Statistic: Average
# #       Threshold: 70 # Siempre 70%, sin importar patrones normales.
# #       # ... (restos de propiedades) ...
# #
# # # Esta alarma podría dispararse constantemente si el 70% es el uso normal
# # # o si hay picos temporales no problemáticos, generando "fatiga de alertas".
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 4,
    'title_level': 'DevOps en AWS',
    'topic': 'Monitoreo Avanzado',
    'subtopic': 'CloudWatch Synthetics',
    'definition': '''
CloudWatch Synthetics te permite crear "canarios" (canaries) que son scripts configurables para monitorear tus endpoints y APIs web desde la perspectiva de tus usuarios finales. Piensa en CloudWatch Synthetics como un explorador robótico que simula el viaje de un usuario a través de tu aplicación: visita tus páginas web, hace clic en botones, completa formularios, y te alerta si algo no funciona o es lento, incluso antes de que tus usuarios lo noten.

¿Te estás preguntando por qué este monitoreo activo es tan valioso y cómo te da una visión diferente a la que obtendrías de los logs o métricas de back-end?

Aquí te va la aclaración: Los logs y las métricas te dicen lo que está pasando en el interior de tu infraestructura. Pero, ¿qué pasa si tu servidor funciona, pero un recurso de frontend no carga, o si el botón de "comprar" está roto solo en un navegador específico? CloudWatch Synthetics te da la "perspectiva del usuario final".

Los "canarios" de Synthetics son funciones Lambda escritas en Node.js o Python que se ejecutan a intervalos regulares. Puedes configurarlos para:
* **Monitorear la disponibilidad de URL:** Asegurarse de que tu página de inicio o cualquier endpoint de API esté accesible.
* **Probar el flujo de usuario:** Simular un usuario iniciando sesión, añadiendo un artículo al carrito, o completando un proceso de pago.
* **Verificar el rendimiento de carga de la página:** Medir cuánto tiempo tarda en cargar una página web, incluyendo el tiempo de carga de recursos estáticos.
* **Detectar contenido inactivo:** Buscar texto o elementos específicos en la página para asegurarse de que todo está donde debe estar.
* **Monitoreo desde múltiples ubicaciones:** Ejecutar canarios desde diferentes regiones de AWS para entender la experiencia del usuario globalmente.

Cada vez que un canario se ejecuta, registra información como capturas de pantalla, archivos HAR (HTTP Archive Format) que muestran las solicitudes de red, y logs. Estos artefactos son increíblemente útiles para depurar problemas. Si un canario falla o tarda demasiado, CloudWatch Synthetics puede disparar alarmas, lo que te permite reaccionar rápidamente a problemas que impactan directamente a tus usuarios antes de que ellos los reporten. Es una herramienta poderosa para asegurar la disponibilidad y el rendimiento de tus aplicaciones web.
''',
    'code_example': r'''
# CloudWatch Synthetics se configura a través de la consola de AWS o la AWS CLI.
# El "código" principal es el script del canario (JavaScript o Python).

# CORRECTO: Ejemplo simplificado de un script de canario (Node.js) para verificar una URL.
# /*
#  * Ejemplo de script de canario de CloudWatch Synthetics (Node.js)
#  * para verificar la disponibilidad de una URL.
#  */
# const synthetics = require('Synthetics');
# const log = require('SyntheticsLogger');
#
# const pageLoadBlueprint = async function () {
#   const URL = 'https://www.example.com'; // Reemplazar con tu URL
#
#   const page = await synthetics.getPage();
#
#   // Navegar a la URL y medir el tiempo de carga
#   const response = await page.goto(URL, { waitUntil: 'domcontentloaded', timeout: 30000 });
#   if (response.status() !== 200) {
#     throw new Error('Falló la carga de la página con código de estado: ' + response.status());
#   }
#   log.info('Página cargada con éxito, status: ' + response.status());
#
#   // Opcional: Verificar que un texto específico esté presente en la página
#   const pageContent = await page.content();
#   if (!pageContent.includes('Welcome to Example')) {
#     throw new Error('Contenido esperado "Welcome to Example" no encontrado en la página.');
#   }
#   log.info('Contenido esperado encontrado.');
#
#   // Captura de pantalla al final de la ejecución
#   await synthetics.takeScreenshot('loadedPage', 'afterLoaded');
# };
#
# exports.handler = async () => {
#   return await pageLoadBlueprint();
# };
#
# # INCORRECTO: Depender únicamente del monitoreo pasivo (logs y métricas del servidor)
# # para evaluar la experiencia del usuario final.
# # Esto puede llevar a no detectar problemas de frontend, errores de red o CDN,
# # o problemas de rendimiento que afectan la percepción del usuario pero no se reflejan
# # directamente en las métricas de back-end.
# # No hay un bloque de código para esto, ya que es la falta de uso de Synthetics.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 4,
    'title_level': 'DevOps en AWS',
    'topic': 'Monitoreo Avanzado',
    'subtopic': 'CloudWatch ServiceLens',
    'definition': '''
CloudWatch ServiceLens es una característica de CloudWatch que mejora la observabilidad de tus aplicaciones al integrar trazas de AWS X-Ray, métricas de CloudWatch y logs en un solo lugar. Piensa en ServiceLens como un panel de control unificado que te da una vista holística de tu aplicación distribuida: no solo ves lo que cada pieza hace individualmente, sino cómo todas interactúan, permitiéndote diagnosticar problemas complejos más rápidamente.

¿Te estás preguntando cómo ServiceLens transforma la forma en que entiendes y depuras tus microservicios?

Aquí te va la aclaración: En arquitecturas de microservicios y serverless, una solicitud de usuario puede fluir a través de decenas de servicios. Si un usuario reporta un problema, encontrar la causa raíz puede ser una pesadilla si tienes que saltar entre diferentes herramientas (una para logs, otra para métricas, otra para trazas). ServiceLens consolida esta información.

ServiceLens te proporciona un "Mapa de Servicio" interactivo que visualiza las relaciones entre tus servicios. Este mapa no es estático; se construye dinámicamente a partir de los datos de trazas de X-Ray. Puedes ver:
* **Interacciones entre servicios:** Qué servicios se llaman entre sí y en qué orden.
* **Salud del servicio:** Indicadores visuales de latencia, errores y tasas de éxito para cada servicio.
* **Cuellos de botella:** Identifica dónde se está ralentizando una solicitud a medida que fluye a través de tus servicios.

Lo más potente de ServiceLens es su capacidad para hacer "drilling down" (profundizar). Desde el Mapa de Servicio, puedes seleccionar un nodo (un servicio) y ver al instante:
* **Trazas de X-Ray relacionadas:** Accede a los trazas de solicitudes individuales que pasaron por ese servicio, con detalles de sub-segmentos.
* **Métricas de CloudWatch:** Ver métricas clave para ese servicio (ej., invocaciones de Lambda, errores de API Gateway).
* **Logs de CloudWatch Logs:** Acceder directamente a los logs relevantes generados por ese servicio.

Al tener logs, métricas y trazas correlacionadas en un solo panel, ServiceLens reduce drásticamente el tiempo necesario para identificar, aislar y resolver problemas en aplicaciones distribuidas. Es una herramienta indispensable para equipos de DevOps que buscan una observabilidad integral y una depuración eficiente en la nube de AWS.
''',
    'code_example': r'''
# CloudWatch ServiceLens es una característica de visualización y correlación.
# No se configura con código directo, sino que se "activa" al habilitar
# y configurar AWS X-Ray, CloudWatch Logs y CloudWatch Metrics para tus servicios.

# CORRECTO: Asegurarse de que tus servicios estén enviando datos a X-Ray, Logs y Métricas.
# Por ejemplo, para Lambda, se habilita el tracing de X-Ray.

# # Configuración de una función Lambda con X-Ray Tracing y logs.
# Resources:
#   MyServiceLensLambdaFunction:
#     Type: AWS::Lambda::Function
#     Properties:
#       FunctionName: MyServiceLensLambda
#       Handler: index.handler
#       Role: arn:aws:iam::123456789012:role/MyLambdaExecutionRole # Rol con permisos para X-Ray y Logs
#       Runtime: nodejs18.x
#       Code:
#         ZipFile: |
#           const AWS = require('aws-sdk');
#           const AWSXRay = require('aws-xray-sdk-core');
#           AWSXRay.captureAWS(AWS); // Instrumentar el SDK de AWS para X-Ray
#
#           exports.handler = async (event) => {
#             console.log('Received event:', JSON.stringify(event, null, 2));
#             // Simular una llamada a un servicio de AWS (ej. DynamoDB)
#             const ddb = new AWS.DynamoDB.DocumentClient();
#             await ddb.get({ TableName: 'MyTable', Key: { id: 'some_id' } }).promise();
#             return {
#               statusCode: 200,
#               body: JSON.stringify('Hello from ServiceLens enabled Lambda!'),
#             };
#           };
#       TracingConfig:
#         Mode: Active # Habilitar el tracing de X-Ray
#       # La configuración por defecto envía logs a CloudWatch Logs
#
#   # Configuración de API Gateway con X-Ray Tracing.
#   MyServiceLensApiGateway:
#     Type: AWS::ApiGateway::RestApi
#     Properties:
#       Name: MyServiceLensApi
#       Description: API Gateway for ServiceLens demo
#       TracingEnabled: true # Habilitar el tracing de X-Ray
#       # ... (restantes propiedades de API Gateway, recursos y métodos) ...
#
# # INCORRECTO: No habilitar el tracing de X-Ray o no enviar logs y métricas
# # a CloudWatch, lo que impediría que ServiceLens correlacione la información.
# # Sin estos datos, el Mapa de Servicio y las capacidades de profundización
# # de ServiceLens no funcionarían correctamente, dejando una brecha de observabilidad.
# # No hay un bloque de código para esto, ya que es la omisión de configuraciones clave.
'''
  });
}

Future<void> insertMidLevel5AwsData(Database db) async {
  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Bases de Datos Avanzadas',
    'topic': 'Amazon Aurora',
    'subtopic': 'Arquitectura Aurora',
    'definition': '''
Amazon Aurora es un motor de base de datos relacional compatible con MySQL y PostgreSQL, diseñado específicamente para la nube, que combina la velocidad y disponibilidad de las bases de datos comerciales de alta gama con la simplicidad y rentabilidad de las bases de datos de código abierto. Piensa en Aurora como si hubieran tomado lo mejor de dos mundos: la capacidad de crecer sin parar y la velocidad de un auto de carreras, pero con un precio de coche de diario.

¿Te estás preguntando cómo logra Aurora ser tan rápido y confiable, sin ser un servicio costoso como otras bases de datos propietarias?

Aquí te va la aclaración: La clave de la magia de Aurora radica en su arquitectura única que lo diferencia de las bases de datos relacionales tradicionales. No utiliza un modelo de almacenamiento tradicional donde el servidor de base de datos también gestiona el almacenamiento. En su lugar, separa el cómputo del almacenamiento de forma fundamental.

Las características principales de su arquitectura incluyen:
* **Almacenamiento Distribuido y de Auto-Reparación:** El almacenamiento de Aurora no es un disco adjunto a una instancia. Es un servicio de almacenamiento compartido y distribuido que replica tus datos seis veces en tres zonas de disponibilidad. Esto le permite ser extremadamente duradero y tolerante a fallos. Si un nodo de almacenamiento falla, Aurora se auto-repara utilizando una de las copias replicadas, sin impacto para tu base de datos.
* **Diseñado para la Nube:** El motor de la base de datos de Aurora está optimizado para funcionar directamente sobre esta capa de almacenamiento distribuido. Operaciones como la replicación, las copias de seguridad y la recuperación de fallos se gestionan a nivel del servicio de almacenamiento, lo que libera al motor de la base de datos para concentrarse en las consultas.
* **Crecimiento Automático:** El volumen de almacenamiento de Aurora crece automáticamente en incrementos de 10GB hasta 128TB, sin interrupciones en la aplicación. No necesitas pre-aprovisionar espacio de almacenamiento.
* **Replicación Rápida:** La forma en que Aurora maneja los "redos logs" (registros de transacciones) es altamente optimizada, lo que permite una replicación de datos casi instantánea a través de las réplicas de lectura.
* **Manejo de Fallos Rápido:** En caso de un fallo de la instancia principal, Aurora puede conmutar por error a una de sus réplicas de lectura en cuestión de segundos (típicamente menos de 30 segundos), lo que minimiza el tiempo de inactividad.

Esta arquitectura innovadora es lo que permite a Aurora ofrecer un rendimiento que puede ser hasta 5 veces superior al de MySQL estándar y 3 veces superior al de PostgreSQL estándar, con una durabilidad excepcional y sin la complejidad de gestionar manualmente la infraestructura de bases de datos. Muchas empresas que necesitan alta disponibilidad y rendimiento para sus aplicaciones críticas eligen Aurora.
''',
    'code_example': r'''
# La arquitectura de Aurora se gestiona por AWS. Aquí no hay un "código" directo
# de arquitectura en sí, sino comandos para interactuar con la creación de clusters.

# CORRECTO: Creación de un cluster de Aurora MySQL usando AWS CLI.
# Esto demuestra la abstracción de la arquitectura subyacente.
# # Paso 1: Crear el cluster de base de datos Aurora (esto crea la capa de almacenamiento)
# aws rds create-db-cluster \
#   --db-cluster-identifier my-aurora-cluster \
#   --engine aurora-mysql \
#   --engine-version 8.0.mysql_aurora.3.02.0 \
#   --database-name mydb \
#   --master-username admin \
#   --master-user-password yourpassword \
#   --backup-retention-period 7 \
#   --vpc-security-group-ids sg-0abcdef1234567890 \
#   --db-subnet-group-name my-db-subnet-group \
#   --port 3306
#
# # Paso 2: Crear una instancia de escritor (reader/writer instance) para el cluster
# # Esta es la instancia a la que tu aplicación se conectará para leer y escribir.
# aws rds create-db-instance \
#   --db-cluster-identifier my-aurora-cluster \
#   --db-instance-identifier my-aurora-instance-1 \
#   --engine aurora-mysql \
#   --db-instance-class db.r5.large \
#   --publicly-accessible --no-publicly-accessible # Elegir uno, usualmente no público
#
# # Para PostgreSQL, sería similar, pero con 'engine aurora-postgresql'
#
# # INCORRECTO: Intentar configurar manualmente la replicación a nivel de sistema operativo
# # o gestión de discos RAID para lograr alta disponibilidad, como se haría en un servidor on-premise
# # o una base de datos EC2 tradicional.
# # Esto ignora los beneficios de la arquitectura gestionada y distribuida de Aurora.
# # No hay un ejemplo de código para esto, ya que es la práctica que Aurora busca reemplazar.
# # Sería el proceso de:
# # 1. Lanzar múltiples instancias EC2.
# # 2. Instalar MySQL/PostgreSQL en cada una.
# # 3. Configurar replicación maestro-esclavo manualmente.
# # 4. Gestionar el almacenamiento y los backups con scripts.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Bases de Datos Avanzadas',
    'topic': 'Amazon Aurora',
    'subtopic': 'Clusters y réplicas',
    'definition': '''
En Amazon Aurora, la forma en que organizas y escalas tu base de datos se centra en los conceptos de "clusters" y "réplicas". Pensemos en un cluster de Aurora como la base de tu sistema de base de datos, que maneja el almacenamiento compartido, y las réplicas como las diferentes "ventanillas" donde tu aplicación puede interactuar con esos datos para leerlos o escribirlos, de forma escalable y altamente disponible.

¿Te estás preguntando por qué esta separación es tan crucial para el rendimiento y la tolerancia a fallos en una base de datos moderna?

Aquí te va la aclaración: A diferencia de una base de datos tradicional de una sola instancia, Aurora está diseñada para una escalabilidad y resiliencia extremas. Esto se logra mediante la distinción entre el volumen de almacenamiento del cluster y las instancias de la base de datos que acceden a ese almacenamiento.

* **Cluster de Base de Datos (DB Cluster):** Este es el corazón de tu implementación de Aurora. El cluster es donde resides tu volumen de almacenamiento distribuido y de auto-reparación, que se replica en seis vías en tres zonas de disponibilidad. El cluster maneja la persistencia de los datos, las copias de seguridad automáticas y la recuperación de fallos a nivel de almacenamiento. Cuando creas un cluster, obtienes un "endpoint de cluster" (un DNS) que siempre apunta a la instancia de escritor principal.
* **Instancias de Base de Datos (DB Instances) dentro del Cluster:** Dentro de un cluster, puedes tener dos tipos de instancias:
    * **Instancia de Escritor (Primary Instance):** Solo puede haber una instancia de escritor en el cluster a la vez. Esta es la instancia que maneja todas las operaciones de escritura (INSERT, UPDATE, DELETE) y también puede manejar lecturas. Si esta instancia falla, Aurora promueve automáticamente una de las réplicas de lectura (si existen) para que se convierta en la nueva instancia de escritor.
    * **Réplicas de Lectura de Aurora (Aurora Replicas):** Puedes añadir hasta 15 réplicas de lectura a un cluster. Estas réplicas comparten el mismo volumen de almacenamiento que la instancia de escritor, lo que significa que la replicación es casi instantánea (latencia de milisegundos). Se utilizan para escalar el rendimiento de lectura de tu aplicación. Si tu aplicación tiene muchas operaciones de lectura, puedes distribuir esas cargas de trabajo entre varias réplicas de lectura. Tienen su propio "endpoint de lector" (un DNS) que distribuye las conexiones entre todas las réplicas de lectura disponibles.

Esta arquitectura de cluster y réplicas permite que tu base de datos escale el rendimiento de lectura y escritura de forma independiente, y que sea altamente tolerante a fallos. Si una instancia falla, las demás pueden tomar el relevo rápidamente. Es la razón por la que Aurora es una opción tan atractiva para aplicaciones que demandan alta disponibilidad y escalabilidad de bases de datos.
''',
    'code_example': r'''
# Creación y gestión de clusters y réplicas de Aurora usando AWS CLI.

# CORRECTO: Configuración de un cluster de Aurora con una instancia de escritor y una réplica de lectura.
# # Paso 1: Crear el cluster de base de datos Aurora (capa de almacenamiento)
# aws rds create-db-cluster \
#   --db-cluster-identifier my-app-aurora-cluster \
#   --engine aurora-mysql \
#   --engine-version 8.0.mysql_aurora.3.02.0 \
#   --database-name myappdb \
#   --master-username admin \
#   --master-user-password supersecurepassword \
#   --db-subnet-group-name my-db-subnet-group \
#   --vpc-security-group-ids sg-0abcdef1234567890
#
# # Esperar a que el cluster esté disponible...
#
# # Paso 2: Crear la instancia de escritor (primary instance)
# aws rds create-db-instance \
#   --db-cluster-identifier my-app-aurora-cluster \
#   --db-instance-identifier my-app-writer-instance \
#   --engine aurora-mysql \
#   --db-instance-class db.r5.large \
#   --publicly-accessible --no-publicly-accessible # Elegir uno
#
# # Esperar a que la instancia de escritor esté disponible...
#
# # Paso 3: Crear una réplica de lectura de Aurora (Aurora Replica)
# aws rds create-db-instance \
#   --db-cluster-identifier my-app-aurora-cluster \
#   --db-instance-identifier my-app-reader-instance-1 \
#   --engine aurora-mysql \
#   --db-instance-class db.r5.large \
#   --publicly-accessible --no-publicly-accessible # Elegir uno
#
# # Describe el cluster para obtener los endpoints
# # aws rds describe-db-clusters --db-cluster-identifier my-app-aurora-cluster

#
# # INCORRECTO: Intentar escalar la lectura usando una única instancia o gestionando réplicas
# # como se haría en una base de datos tradicional, sin aprovechar el almacenamiento compartido
# # y la conmutación por error automática de Aurora.
# # Esto sería crear una instancia EC2 separada y replicar datos a nivel de aplicación o con MySQL/PostgreSQL nativo.
# # # Ejemplo de enfoque "incorrecto" (no recomendado para Aurora) - usar replicación lógica de MySQL/PostgreSQL
# # # Esto NO es cómo Aurora maneja sus réplicas de lectura.
# # # Se necesitaría configurar `CHANGE MASTER TO` en MySQL o `primary_conninfo` en PostgreSQL.
# # # Esto añade complejidad, latencia en la replicación y menos resiliencia en comparación con Aurora.
# #
# # # Ejemplo conceptual de MySQL:
# # # En la instancia primaria:
# # # mysql> SHOW MASTER STATUS;
# # # En la réplica:
# # # mysql> CHANGE MASTER TO MASTER_HOST='primary_ip', MASTER_USER='repl_user', MASTER_PASSWORD='repl_pass', MASTER_LOG_FILE='mysql-bin.00000X', MASTER_LOG_POS=Y;
# # # mysql> START SLAVE;
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Bases de Datos Avanzadas',
    'topic': 'Amazon Aurora',
    'subtopic': 'Aurora Serverless',
    'definition': '''
Aurora Serverless es una opción de despliegue de Amazon Aurora que escala automáticamente la capacidad de la base de datos según la demanda de tu aplicación, y te cobra solo por la capacidad que usas. Pensemos en Aurora Serverless como una "base de datos elástica" que se expande y contrae por sí misma, como un acordeón, sin que tú tengas que pensar en los tamaños de las instancias o en la gestión de la capacidad.

¿Te estás preguntando por qué esta capacidad de autoescalado es un cambio de juego para aplicaciones con cargas de trabajo impredecibles o intermitentes?

Aquí te va la aclaración: Las bases de datos tradicionales (y las instancias provisionadas de Aurora) requieren que elijas un tamaño de instancia (ej., `db.r5.large`) y pagues por ella, incluso si no la estás utilizando a plena capacidad. Si la demanda aumenta repentinamente, podrías quedarte sin capacidad o tener que escalar manualmente, lo que introduce tiempo de inactividad. Aurora Serverless resuelve esto.

Con Aurora Serverless, no aprovisionas instancias de base de datos individuales. En su lugar, configuras un "cluster de Aurora Serverless" y especificas un rango de capacidad (unidades de capacidad de Aurora, o ACUs). Aurora Serverless se encarga del resto:
* **Autoescalado:** Si tu aplicación experimenta un pico de tráfico, Aurora Serverless escala instantáneamente su capacidad en incrementos finos. Si la demanda disminuye, también se reduce, incluso hasta cero ACUs (pausando la base de datos) si no hay actividad durante un tiempo. Esto es ideal para cargas de trabajo intermitentes, como entornos de desarrollo/pruebas, o aplicaciones con patrones de uso impredecibles.
* **Pago por Uso:** Solo pagas por la capacidad de base de datos que consume tu aplicación por segundo, lo que puede resultar en ahorros significativos en comparación con el aprovisionamiento de capacidad fija.
* **Conexión simple:** Te conectas a Aurora Serverless a través de un "endpoint de datos" al que puedes acceder desde tu aplicación.
* **Pausado automático:** Si la base de datos está inactiva durante un período configurable (ej., 5 minutos), Aurora Serverless puede pausar la base de datos por completo. Cuando llega una nueva conexión, se reanuda automáticamente en segundos.

Aurora Serverless es una excelente opción para desarrolladores y empresas que buscan una base de datos relacional de alta disponibilidad y rendimiento sin la carga operativa de gestionar instancias. Es perfecto para nuevas aplicaciones, sitios web con tráfico variable, entornos de desarrollo/pruebas, y cualquier carga de trabajo donde el costo y la agilidad de la capacidad son clave. Es una forma de tener una base de datos robusta, pero con la mentalidad "serverless" de pagar solo por lo que usas y sin preocuparte por la infraestructura.
''',
    'code_example': r'''
# Creación de un cluster de Aurora Serverless con AWS CLI.

# CORRECTO: Creación de un cluster Aurora Serverless v2.
# # Creación de un cluster Aurora Serverless v2 (Recomendado sobre v1 para nuevas cargas)
# aws rds create-db-cluster \
#   --db-cluster-identifier my-aurora-serverless-v2-cluster \
#   --engine aurora-mysql \
#   --engine-version 8.0.mysql_aurora.3.02.0 \
#   --engine-mode serverless \
#   --database-name myappdb_serverless \
#   --master-username admin \
#   --master-user-password yourstrongpassword \
#   --db-subnet-group-name my-db-subnet-group \
#   --vpc-security-group-ids sg-0abcdef1234567890 \
#   --scaling-configuration MinCapacity=0.5,MaxCapacity=16,AutoPause=false # Rango de ACUs, sin auto-pausa (v2 no usa auto-pausa de v1)
#
# # Nota: Para Aurora Serverless v1 (anterior), la configuración de scaling era diferente
# # y permitía `AutoPause`. V2 es más granular y no tiene pausa automática.
# # aws rds create-db-cluster \
# #   --db-cluster-identifier my-aurora-serverless-v1-cluster \
# #   --engine aurora-mysql \
# #   --engine-version 5.6.mysql_aurora.1.22.2 \
# #   --engine-mode serverless \
# #   --scaling-configuration AutoPause=true,SecondsUntilAutoPause=300,MinCapacity=1,MaxCapacity=16
#
# # La conexión a Aurora Serverless desde aplicaciones a menudo se realiza a través de
# # la API de Data API de Aurora para evitar la gestión de conexiones de base de datos tradicionales,
# # especialmente desde Lambda.
# #
# # Ejemplo de conexión desde una función Lambda (Python pseudocódigo)
# # import boto3
# # rds_data = boto3.client('rds-data')
# #
# # def lambda_handler(event, context):
# #     cluster_arn = "arn:aws:rds:us-east-1:123456789012:cluster:my-aurora-serverless-v2-cluster"
# #     secret_arn = "arn:aws:secretsmanager:us-east-1:123456789012:secret:my/rds/creds"
# #
# #     response = rds_data.execute_statement(
# #         resourceArn=cluster_arn,
# #         secretArn=secret_arn,
# #         database='myappdb_serverless',
# #         sql='SELECT * FROM users WHERE id = :id',
# #         parameters=[{'name': 'id', 'value': {'longValue': 1}}]
# #     )
# #     print(response)
# #     return {'statusCode': 200, 'body': 'Query executed'}
#
# # INCORRECTO: Provisión manual de instancias de base de datos para cargas de trabajo
# # altamente variables, lo que lleva a un sobreaprovisionamiento o falta de capacidad.
# # Esto implicaría cambiar manualmente el tamaño de las instancias RDS (o EC2 con DB).
# # # Intentar escalar una instancia RDS provisionada manualmente:
# # # aws rds modify-db-instance \
# # #   --db-instance-identifier my-provisioned-db \
# # #   --db-instance-class db.r5.xlarge \
# # #   --apply-immediately
# # #
# # # Esto causa tiempo de inactividad durante el cambio de tamaño y no es automático.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Bases de Datos Avanzadas',
    'topic': 'Amazon Aurora',
    'subtopic': 'Migración a Aurora',
    'definition': '''
Migrar tus bases de datos existentes a Amazon Aurora es un paso estratégico que muchas empresas toman para mejorar el rendimiento, la escalabilidad y la disponibilidad de sus aplicaciones, aprovechando las ventajas de la nube. Pensemos en la migración a Aurora como modernizar un antiguo edificio que sigue en pie pero que no puede manejar la demanda actual; en lugar de demolerlo, lo actualizas con cimientos más fuertes y una estructura más eficiente, mientras mantienes sus funciones principales.

¿Te estás preguntando por qué la gente migra a Aurora y qué herramientas y pasos necesitas considerar para que este proceso sea lo más fluido posible?

Aquí te va la aclaración: Las bases de datos MySQL o PostgreSQL, ya sea en servidores on-premise, en instancias EC2, o incluso en RDS estándar, pueden enfrentar limitaciones de rendimiento, escalabilidad o resiliencia a medida que las aplicaciones crecen. Aurora ofrece una solución robusta a estos desafíos.

El proceso de migración a Aurora generalmente implica varias etapas y herramientas:
1.  **Evaluación:** Analiza tu base de datos actual para entender su tamaño, carga de trabajo, características específicas (ej., procedimientos almacenados, triggers) y dependencias.
2.  **Planificación:** Define la versión de Aurora (MySQL o PostgreSQL) y la capacidad (instancia provisionada o Serverless) que necesitas. Planifica el tiempo de inactividad aceptable y la estrategia de migración.
3.  **Herramientas de Migración:**
    * **AWS Database Migration Service (DMS):** Esta es la herramienta estrella para migraciones de bases de datos. DMS es un servicio gestionado que te permite migrar datos de tu base de datos fuente a Aurora con un tiempo de inactividad mínimo. Soporta migraciones homogéneas (MySQL a Aurora MySQL) y heterogéneas (Oracle a Aurora MySQL/PostgreSQL). DMS puede realizar una carga completa de datos inicial y luego replicar los cambios continuos (CDC - Change Data Capture) para mantener la base de datos destino sincronizada.
    * **Mysqldump/Pg_dump y S3:** Para bases de datos más pequeñas, puedes exportar tus datos a archivos `dump` (usando `mysqldump` para MySQL o `pg_dump` para PostgreSQL), subirlos a S3, y luego importarlos en tu cluster de Aurora.
    * **Snapshots de RDS:** Si ya tienes una base de datos MySQL o PostgreSQL en Amazon RDS, puedes crear un snapshot de esa base de datos y restaurarlo directamente como un cluster de Aurora. Esta es la forma más sencilla para migraciones dentro de RDS.
4.  **Pruebas:** Realiza pruebas exhaustivas de la aplicación contra el nuevo cluster de Aurora para asegurar que todo funciona correctamente, incluyendo rendimiento, funcionalidad y compatibilidad.
5.  **Corte (Cutover):** Una vez que estés satisfecho con las pruebas, redirige el tráfico de tu aplicación al nuevo cluster de Aurora. Esto a menudo implica cambiar la cadena de conexión de tu aplicación.
6.  **Optimización Post-Migración:** Ajusta el rendimiento y monitorea la nueva base de datos.

La migración a Aurora, especialmente con DMS, está diseñada para ser lo más indolora posible, incluso para bases de datos críticas que requieren un tiempo de inactividad mínimo. Empresas como Expedia y Capital One han migrado sus bases de datos a Aurora para manejar sus cargas de trabajo masivas con mayor eficiencia y resiliencia.
''',
    'code_example': r'''
# La migración a Aurora se realiza a menudo con AWS DMS o herramientas nativas.
# Aquí se muestran ejemplos de cómo usar DMS y un volcado de datos.

# CORRECTO: Configuración conceptual de una tarea de migración de DMS (no es CloudFormation completo, sino los componentes).
# # Paso 1: Configurar un Endpoint de Origen (Source Endpoint) para tu DB existente (ej. MySQL on-premise)
# aws dms create-endpoint \
#   --endpoint-identifier my-source-mysql \
#   --endpoint-type source \
#   --engine-name mysql \
#   --username myuser \
#   --password mypassword \
#   --server-name myonpremdb.com \
#   --port 3306 \
#   --ssl-mode require \
#   --kms-key-id arn:aws:kms:us-east-1:123456789012:key/my-dms-key
#
# # Paso 2: Configurar un Endpoint de Destino (Target Endpoint) para tu cluster de Aurora
# aws dms create-endpoint \
#   --endpoint-identifier my-target-aurora \
#   --endpoint-type target \
#   --engine-name mysql \
#   --username admin \
#   --password yourpassword \
#   --server-name my-aurora-cluster.cluster-abcdef123456.us-east-1.rds.amazonaws.com \
#   --port 3306 \
#   --ssl-mode require \
#   --kms-key-id arn:aws:kms:us-east-1:123456789012:key/my-dms-key
#
# # Paso 3: Crear una instancia de replicación de DMS
# aws dms create-replication-instance \
#   --replication-instance-identifier my-dms-replication-instance \
#   --replication-instance-class dms.t3.medium \
#   --vpc-security-group-ids sg-0abcdef1234567890 \
#   --replication-subnet-group-identifier my-dms-subnet-group \
#   --publicly-accessible --no-publicly-accessible # Elegir uno
#
# # Paso 4: Crear una Tarea de Migración de Base de Datos
# aws dms create-replication-task \
#   --replication-task-identifier my-full-load-and-cdc \
#   --source-endpoint-arn arn:aws:dms:us-east-1:123456789012:endpoint:my-source-mysql-arn \
#   --target-endpoint-arn arn:aws:dms:us-east-1:123456789012:endpoint:my-target-aurora-arn \
#   --replication-instance-arn arn:aws:dms:us-east-1:123456789012:rep:my-dms-replication-instance-arn \
#   --migration-type full-load-and-cdc \
#   --table-mappings file://table-mappings.json # Archivo JSON con las tablas a migrar
#
# # table-mappings.json ejemplo:
# # [
# #   {
# #     "rule-type": "selection",
# #     "rule-id": "1",
# #     "object-locator": {
# #       "schema-name": "mydb",
# #       "table-name": "%"
# #     },
# #     "data-filter": "id > 0"
# #   }
# # ]
#
# # Ejemplo de volcado y restauración con mysqldump (para bases de datos pequeñas)
# # 1. Exportar datos desde la fuente:
# # mysqldump -h <source_host> -u <user> -p <database_name> > dump.sql
# # 2. Cargar en Aurora:
# # mysql -h <aurora_cluster_endpoint> -u <admin_user> -p <database_name> < dump.sql
#
# # INCORRECTO: Migrar datos copiando archivos de base de datos directamente o sin validación.
# # Esto puede resultar en inconsistencias de datos, corrupción o tiempos de inactividad prolongados.
# # No hay un ejemplo de código para esto, ya que es una mala práctica.
# # Sería algo como:
# # 1. Detener la base de datos fuente.
# # 2. Copiar físicamente los archivos de datos (ej. .ibd, .frm) de MySQL.
# # 3. Intentar pegarlos en la nueva instancia de Aurora (lo cual no funciona debido a la arquitectura).
# # O migrar sin replicación de cambios, causando pérdida de datos.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Bases de Datos Avanzadas',
    'topic': 'Amazon Redshift',
    'subtopic': 'Data Warehousing',
    'definition': '''
El Data Warehousing, o Almacenamiento de Datos, es un concepto fundamental en el mundo de los datos y el análisis. Se trata de construir una base de datos centralizada, a menudo llamada "data warehouse", que está diseñada específicamente para el análisis y la elaboración de informes, en lugar de para el procesamiento de transacciones diarias. Pensemos en un data warehouse como un archivo gigantesco y organizado de todos los datos históricos de una empresa, un lugar donde los analistas pueden ir a buscar respuestas a preguntas de negocio complejas sin afectar el rendimiento de los sistemas operativos.

¿Te estás preguntando por qué no se usa simplemente la base de datos de tu aplicación para hacer análisis y por qué un data warehouse es tan diferente?

Aquí te va la aclaración: Las bases de datos transaccionales (OLTP, como PostgreSQL o MySQL) están optimizadas para lecturas y escrituras rápidas de pequeñas cantidades de datos, típicas de las operaciones diarias de una aplicación (guardar un pedido, actualizar un perfil de usuario). Un data warehouse (OLAP - Online Analytical Processing), por otro lado, está optimizado para consultas complejas que involucran grandes volúmenes de datos históricos, como "cuántos productos de la categoría X se vendieron en el último trimestre en la región Y y qué campañas publicitarias influyeron".

Las características clave de un Data Warehouse incluyen:
* **Orientado a temas:** Los datos se organizan en torno a temas importantes del negocio (clientes, productos, ventas), no en torno a procesos transaccionales.
* **Integrado:** Los datos provienen de múltiples fuentes operacionales (CRM, ERP, web, etc.) y se limpian, transforman e integran en un formato consistente.
* **No volátil:** Una vez que los datos entran al data warehouse, no se modifican ni se eliminan. Se mantienen como un registro histórico para el análisis.
* **Variante en el tiempo:** Se mantiene un registro histórico de los cambios de los datos a lo largo del tiempo, lo que permite el análisis de tendencias.

Servicios como Amazon Redshift están diseñados específicamente para ser data warehouses en la nube, ofreciendo un rendimiento excepcional para cargas de trabajo analíticas masivas. Un data warehouse es el cerebro detrás de la inteligencia de negocio y la toma de decisiones basada en datos, permitiendo a las empresas entender el pasado, analizar el presente y predecir el futuro.
''',
    'code_example': r'''
# El Data Warehousing es un concepto arquitectónico y no un bloque de código ejecutable.
# Sin embargo, el "código" asociado sería el SQL analítico y las ETLs (Extract, Transform, Load).

# CORRECTO: Ejemplo de una consulta analítica típica en un data warehouse (SQL).
# # Consulta en un Data Warehouse: Ventas totales por producto y región en el último año
# SELECT
#     p.product_name,
#     l.region,
#     SUM(s.sales_amount) AS total_sales,
#     COUNT(DISTINCT s.customer_id) AS unique_customers
# FROM
#     sales s
# JOIN
#     products p ON s.product_id = p.product_id
# JOIN
#     locations l ON s.location_id = l.location_id
# WHERE
#     s.sale_date BETWEEN '2024-01-01' AND '2024-12-31'
# GROUP BY
#     p.product_name, l.region
# ORDER BY
#     total_sales DESC;
#
# # Un ejemplo conceptual de una tabla de hechos (fact table) y tablas de dimensiones (dimension tables)
# # en un esquema estrella (Star Schema), común en data warehousing.
#
# # CREATE TABLE fact_sales (
# #     sale_id VARCHAR(50) PRIMARY KEY,
# #     sale_date DATE,
# #     product_id INT,
# #     customer_id INT,
# #     location_id INT,
# #     sales_amount DECIMAL(10, 2),
# #     quantity INT
# # );
#
# # CREATE TABLE dim_products (
# #     product_id INT PRIMARY KEY,
# #     product_name VARCHAR(255),
# #     category VARCHAR(100),
# #     brand VARCHAR(100)
# # );
# # ... y así sucesivamente para otras dimensiones como clientes y ubicaciones.
#
# # INCORRECTO: Intentar ejecutar consultas analíticas complejas directamente en una base de datos OLTP.
# # Esto puede ralentizar gravemente las operaciones transaccionales de la aplicación
# # porque las consultas analíticas consumen muchos recursos de CPU y E/S.
# # # Ejemplo de cómo una consulta analítica en una DB transaccional ralentizaría las operaciones
# # # (asumiendo que 'orders' es una tabla transaccional masiva)
# # SELECT
# #     product_id,
# #     SUM(quantity * price) AS total_revenue
# # FROM
# #     orders
# # WHERE
# #     order_date BETWEEN '2023-01-01' AND '2024-01-01'
# # GROUP BY
# #     product_id
# # ORDER BY
# #     total_revenue DESC;
# #
# # # Si esta consulta se ejecuta en la misma base de datos que maneja la creación de nuevos pedidos,
# # # podría bloquear las escrituras o consumir demasiados recursos, afectando la experiencia del usuario.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Bases de Datos Avanzadas',
    'topic': 'Amazon Redshift',
    'subtopic': 'Clusters y nodos',
    'definition': '''
En Amazon Redshift, la forma en que se construye y escala tu data warehouse se basa en "clusters" y "nodos". Piensa en un cluster de Redshift como una orquesta entera, donde cada músico (nodo) toca una parte del instrumento, pero todos trabajan juntos para interpretar una sinfonía compleja (tu consulta de datos masiva), lo que permite que el sonido sea mucho más grande y poderoso que si cada uno tocara solo.

¿Te estás preguntando por qué Redshift necesita esta estructura distribuida y cómo se diferencia de una base de datos relacional tradicional?

Aquí te va la aclaración: A diferencia de las bases de datos relacionales estándar que escalan "hacia arriba" (aumentando el tamaño de una única máquina), Redshift está diseñado para escalar "horizontalmente" (distribuyendo la carga entre muchas máquinas). Esto es crucial para manejar petabytes de datos y ejecutar consultas analíticas increíblemente rápidas.

Un cluster de Redshift se compone de uno o más nodos:
* **Nodo Líder (Leader Node):** Hay un único nodo líder en cada cluster de Redshift. Su función principal es recibir las consultas de SQL de tu aplicación, analizarlas, optimizar el plan de ejecución y luego coordinar el trabajo entre los nodos de cómputo. No almacena datos del usuario directamente, sino metadatos sobre dónde se encuentran los datos en los nodos de cómputo.
* **Nodos de Cómputo (Compute Nodes):** Estos son los "caballos de batalla" de tu data warehouse. Los nodos de cómputo almacenan los datos del usuario y realizan la mayor parte del procesamiento de la consulta (filtrado, agregación, uniones). Cada nodo de cómputo tiene su propia CPU, memoria y almacenamiento en disco adjunto. La magia de Redshift es que distribuye automáticamente los datos entre estos nodos para permitir el procesamiento paralelo.

Cuando ejecutas una consulta en Redshift:
1.  La consulta llega al nodo líder.
2.  El nodo líder descompone la consulta en partes más pequeñas.
3.  Cada parte se envía a los nodos de cómputo relevantes.
4.  Los nodos de cómputo procesan sus porciones de datos en paralelo.
5.  Los resultados parciales se envían de vuelta al nodo líder, que los consolida y envía el resultado final a tu aplicación.

Puedes elegir diferentes tipos de nodos (como DC2 o RA3) que varían en CPU, memoria y capacidad de almacenamiento, según tus necesidades. Al añadir más nodos de cómputo a tu cluster, aumentas tanto la capacidad de almacenamiento como la potencia de procesamiento, lo que permite a Redshift manejar volúmenes de datos masivos y consultas complejas en segundos, algo impensable para una base de datos relacional OLTP.
''',
    'code_example': r'''
# La creación y gestión de clusters y nodos en Redshift se hace a través de la consola de AWS, AWS CLI o CloudFormation.

# CORRECTO: Creación de un cluster de Amazon Redshift con un nodo líder y nodos de cómputo.
# # Creación de un cluster de Redshift con 2 nodos de cómputo dc2.large
# aws redshift create-cluster \
#   --db-cluster-identifier my-redshift-cluster \
#   --node-type dc2.large \
#   --number-of-nodes 2 \
#   --master-username admin \
#   --master-user-password yourpassword \
#   --db-name dev \
#   --cluster-type multi-node \
#   --publicly-accessible --no-publicly-accessible # Elegir uno
#   --vpc-security-group-ids sg-0abcdef1234567890 \
#   --cluster-subnet-group-name my-redshift-subnet-group
#
# # Ejemplo de cómo cambiar el número de nodos de un cluster existente
# # aws redshift modify-cluster \
# #   --cluster-identifier my-redshift-cluster \
# #   --number-of-nodes 4 \
# #   --apply-immediately # Aplica los cambios inmediatamente
#
# # Conectar a Redshift (usando psql, por ejemplo)
# # psql -h my-redshift-cluster.abcdef123456.us-east-1.redshift.amazonaws.com \
# #   -p 5439 \
# #   -U admin \
# #   -d dev
#
# # INCORRECTO: Intentar instalar y configurar un almacén de datos distribuido desde cero
# # en instancias EC2, sin las optimizaciones de Redshift.
# # Esto sería un esfuerzo de ingeniería muy complejo, que requiere gestionar la distribución de datos,
# # la replicación, la resiliencia y la optimización de consultas manualmente.
# # No hay un ejemplo de código para esto, ya que es la complejidad que Redshift abstrae.
# # Sería el proceso de:
# # 1. Lanzar múltiples instancias EC2.
# # 2. Instalar una base de datos como PostgreSQL en cada una.
# # 3. Implementar manualmente una solución de sharding o particionamiento de datos.
# # 4. Configurar herramientas de coordinación como Apache Zookeeper o similar.
# # 5. Desarrollar un "nodo líder" personalizado para distribuir y agregar consultas.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Bases de Datos Avanzadas',
    'topic': 'Amazon Redshift',
    'subtopic': 'Redshift Spectrum',
    'definition': '''
Redshift Spectrum es una característica de Amazon Redshift que te permite ejecutar consultas SQL directamente sobre datos almacenados en Amazon S3, sin necesidad de cargar esos datos en tu cluster de Redshift. Piensa en Spectrum como un "traductor universal" que te permite hablar el lenguaje de SQL con tus datos en S3, sin importar el formato en que estén (CSV, Parquet, ORC, JSON, etc.), como si esos datos ya estuvieran en tu data warehouse.

¿Te estás preguntando por qué esto es tan innovador y cómo te ayuda a analizar conjuntos de datos masivos sin la necesidad de moverlos o transformarlos previamente?

Aquí te va la aclaración: Antes de Spectrum, para analizar datos en S3 con Redshift, tenías que usar procesos ETL (Extract, Transform, Load) para cargar esos datos en tu cluster. Esto es costoso en tiempo y recursos, especialmente para petabytes de datos o para datos que no necesitas analizar con mucha frecuencia. Spectrum cambia el juego.

Con Redshift Spectrum, puedes:
* **Consultar datos en S3 en su lugar:** No necesitas cargar datos en Redshift. Esto es ideal para "data lakes" donde almacenas cantidades masivas de datos brutos o semi-estructurados en S3.
* **Escalabilidad masiva:** Spectrum puede escalar hasta miles de instancias de computación bajo demanda para acelerar las consultas, independientemente del tamaño de tu cluster de Redshift o de los datos en S3. Solo pagas por los datos que Spectrum escanea.
* **Compatibilidad de formatos:** Soporta una amplia gama de formatos de datos, incluyendo Parquet, ORC, CSV, JSON, Avro, TextFile, y más.
* **Integración con AWS Glue Data Catalog:** Spectrum utiliza el AWS Glue Data Catalog para almacenar los metadatos y el esquema de tus datos en S3. Así, cuando apuntas a una tabla externa en Spectrum, Redshift sabe cómo interpretar los datos en S3.
* **Unión de datos:** Puedes unir datos que resides en tu cluster de Redshift con datos externos en S3 en la misma consulta SQL. Esto es increíblemente potente para análisis combinados.

Redshift Spectrum es una extensión poderosa de tu data warehouse, que te permite abarcar tanto datos "cálidos" (frecuentemente consultados, dentro del cluster de Redshift) como datos "fríos" o "de archivo" (menos consultados, en S3) con la misma interfaz SQL. Esto democratiza el acceso a grandes conjuntos de datos y simplifica enormemente los flujos de trabajo de análisis de datos a escala de terabytes y petabytes.
''',
    'code_example': r'''
# Redshift Spectrum se utiliza a través de SQL en tu cluster de Redshift,
# después de configurar tablas externas que apuntan a S3.

# CORRECTO: Ejemplo de creación de una tabla externa en Redshift Spectrum y una consulta.
# # Paso 1: Crear un rol IAM que Redshift Spectrum pueda asumir para leer desde S3
# # (Este rol debe tener permisos de lectura para el bucket S3 y de acceso a Glue Data Catalog)
# # Ejemplo de ARN de rol: arn:aws:iam::123456789012:role/RedshiftSpectrumRole
#
# # Paso 2: Crear un esquema externo en Redshift que apunte al Glue Data Catalog
# CREATE EXTERNAL SCHEMA spectrum_schema
# FROM DATA CATALOG
# DATABASE 'my_glue_database' # La base de datos en Glue Data Catalog donde resides tus tablas
# IAM_ROLE 'arn:aws:iam::123456789012:role/RedshiftSpectrumRole'
# CREATE EXTERNAL DATABASE IF NOT EXISTS;
#
# # Paso 3: Crear una tabla externa en Redshift Spectrum (o usar una ya definida en Glue)
# # Esta tabla apunta a un prefijo de S3 y define el esquema de los datos.
# CREATE EXTERNAL TABLE spectrum_schema.external_sales (
#     sale_id VARCHAR(50),
#     sale_date DATE,
#     product_id INT,
#     customer_id INT,
#     sales_amount DECIMAL(10, 2)
# )
# ROW FORMAT DELIMITED
# FIELDS TERMINATED BY ','
# STORED AS TEXTFILE # O PARQUET, ORC, etc.
# LOCATION 's3://my-data-lake-bucket/raw_sales_data/'; # Tu ruta en S3
#
# # Paso 4: Ejecutar una consulta que combine datos internos de Redshift con datos externos de S3
# SELECT
#     t1.product_name,
#     SUM(t2.sales_amount) AS total_external_sales
# FROM
#     internal_products_table t1 # Una tabla que reside en tu cluster de Redshift
# JOIN
#     spectrum_schema.external_sales t2 ON t1.product_id = t2.product_id
# WHERE
#     t2.sale_date BETWEEN '2024-01-01' AND '2024-01-31'
# GROUP BY
#     t1.product_name
# ORDER BY
#     total_external_sales DESC;
#
# # INCORRECTO: Cargar manualmente grandes volúmenes de datos desde S3 a Redshift para cada análisis.
# # Esto es lento, costoso y requiere duplicación de datos.
# # # Intentar cargar datos de S3 en Redshift sin usar Spectrum (requiere CREATE TABLE e INSERT/COPY).
# # # CREATE TABLE raw_sales_temp (
# # #     sale_id VARCHAR(50),
# # #     sale_date DATE,
# # #     product_id INT,
# # #     customer_id INT,
# # #     sales_amount DECIMAL(10, 2)
# # # );
# # #
# # # COPY raw_sales_temp FROM 's3://my-data-lake-bucket/raw_sales_data/'
# # # CREDENTIALS 'aws_iam_role=arn:aws:iam::123456789012:role/RedshiftCopyRole'
# # # DELIMITER ','
# # # CSV;
# # #
# # # # Luego tendrías que hacer la consulta sobre raw_sales_temp.
# # # # Esto duplica los datos y es ineficiente si los datos en S3 cambian frecuentemente o son muy grandes.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Bases de Datos Avanzadas',
    'topic': 'Amazon Redshift',
    'subtopic': 'Concurrencia en Redshift',
    'definition': '''
La concurrencia en Amazon Redshift se refiere a la capacidad de la base de datos para manejar múltiples consultas ejecutándose al mismo tiempo de manera eficiente, sin que se interfieran negativamente entre sí. Pensemos en la concurrencia como la gestión de un restaurante muy concurrido: si todos los chefs (nodos de cómputo) y camareros (conexiones) tienen que atender a cada cliente (consulta) de forma individual y desorganizada, todo se vuelve un caos. La concurrencia optimizada es como tener un sistema donde los pedidos se priorizan y se procesan en paralelo para que todos los clientes estén satisfechos.

¿Te estás preguntando por qué la concurrencia es un desafío particular en los data warehouses y cómo Redshift lo aborda?

Aquí te va la aclaración: A diferencia de las bases de datos transaccionales (OLTP) que manejan muchas transacciones pequeñas, los data warehouses (OLAP) manejan un número menor de consultas, pero estas consultas son mucho más grandes y complejas, a menudo escaneando terabytes de datos. Si muchas de estas consultas grandes intentan ejecutarse al mismo tiempo, pueden competir por los recursos y ralentizar todo el sistema.

Redshift aborda la concurrencia con varias características clave:
* **Administración de Carga de Trabajo (WLM - Workload Management):** Es la característica principal para la concurrencia. WLM te permite definir "colas de consulta" (query queues) y asignar recursos (memoria, ranuras de concurrencia) a cada cola. Puedes tener colas para consultas cortas y rápidas (ej., paneles de control), y colas separadas para consultas complejas de informes que tardan más.
    * Puedes asignar usuarios o grupos de usuarios a colas específicas.
    * Establecer la prioridad de las colas.
    * Definir cuántas consultas pueden ejecutarse simultáneamente en cada cola.
    * Usar WLM automático, que ajusta dinámicamente la concurrencia y la asignación de recursos.
* **Concurrencia Escalonada (Concurrency Scaling):** Esta es una característica más avanzada que permite a Redshift añadir automáticamente capacidad de cómputo temporal adicional para manejar picos de concurrencia. Si tu cluster está muy ocupado, Redshift puede lanzar clusters temporales "escalados" para procesar las consultas desbordadas, sin afectar el rendimiento de tu cluster principal. Esto es útil para cargas de trabajo impredecibles y altamente concurrentes, y solo pagas por el tiempo que usas esta capacidad extra.
* **Diseño de Tablas (Distribution Keys, Sort Keys):** Un buen diseño de tablas (cómo se distribuyen y ordenan los datos en tus nodos) es fundamental para que las consultas se ejecuten eficientemente en paralelo, lo que indirectamente mejora la concurrencia.

Al implementar estrategias de WLM y, si es necesario, utilizar la Concurrencia Escalonada, puedes asegurar que tu data warehouse de Redshift mantenga un alto rendimiento incluso bajo cargas de trabajo concurrentes, garantizando que tus usuarios de negocio obtengan sus informes y análisis a tiempo.
''',
    'code_example': r'''
# La concurrencia en Redshift se gestiona principalmente a través de la configuración de WLM (Workload Management).
# Esto se hace con comandos SQL en Redshift o a través de la consola/CLI.

# CORRECTO: Ejemplo de configuración de WLM en Redshift para gestionar la concurrencia.
# # Ejemplo de configuración de WLM para crear dos colas: una para consultas rápidas y otra para informes.
# # Esto se haría a través de la consola de Redshift o con la AWS CLI.
# # Un ejemplo conceptual de configuración usando SQL (aplicada a través de la CLI o consola):
#
# # Crear una nueva configuración de WLM
# ALTER SYSTEM SET wlm_json_configuration = '{
#   "query_queues": [
#     {
#       "queue_name": "short_queries",
#       "service_class": 0,
#       "concurrency_level": 5,  # 5 consultas pueden ejecutarse a la vez en esta cola
#       "query_group": "short_queries",
#       "max_execution_time": 60, # Tiempo máximo de ejecución en segundos
#       "query_monitoring_rules": [
#         {"query_length": 1, "action_type": "abort"}, # Abortar consultas muy largas
#         {"query_length": 60, "action_type": "log"}
#       ]
#     },
#     {
#       "queue_name": "long_reports",
#       "service_class": 1,
#       "concurrency_level": 2, # Solo 2 consultas a la vez para informes pesados
#       "query_group": "long_reports"
#     }
#   ],
#   "default_queue": "long_reports" # Cola por defecto si no se asigna un grupo
# }';
#
# # Asignar un grupo de consultas a una cola (ejecutado por el usuario o en la aplicación)
# # SET query_group TO 'short_queries';
# # SELECT * FROM small_table WHERE id = 1;
#
# # SET query_group TO 'long_reports';
# # SELECT complex_analytics_query FROM large_fact_table;
#
# # Habilitar la concurrencia escalada (se configura en la consola o con la CLI/CloudFormation)
# # Esto activaría la capacidad de escalar temporalmente para manejar picos.
# # aws redshift modify-cluster --cluster-identifier my-redshift-cluster --enable-cluster-capability "ConcurrencyScaling"
#
# # INCORRECTO: No configurar WLM o dejar que Redshift maneje la concurrencia por defecto
# # para cargas de trabajo mixtas (cortas y largas).
# # Esto puede llevar a que las consultas cortas se queden atascadas detrás de las consultas largas,
# # o a que el cluster se sature y se ralentice para todos los usuarios.
# # # Ejecutar todas las consultas sin distinción en una única cola por defecto.
# # # Esto puede llevar a un rendimiento impredecible cuando hay muchas consultas concurrentes.
# # # Si no se configura WLM, Redshift usa una configuración predeterminada que puede no ser óptima.
# # # No hay un código SQL "incorrecto" per se, sino la ausencia de una configuración estratégica.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Bases de Datos Avanzadas',
    'topic': 'Amazon Neptune',
    'subtopic': 'Grafos y bases de datos de grafos',
    'definition': r'''
Pensemos por un momento en las relaciones de nuestros datos. Las bases de datos de grafos se enfocan en esto: cómo se conectan los puntos de información, y lo hacen de una manera que te permite explorar esas conexiones de forma muy eficiente. Amazon Neptune es una base de datos de grafos que te ayuda a almacenar y consultar grandes volúmenes de datos altamente conectados.

¿Te estás preguntando por qué esto importa? 

Porque muchas de las preguntas que queremos hacerle a nuestros datos no son sobre elementos individuales, sino sobre cómo se relacionan entre sí. Piensa en redes sociales, sistemas de recomendación, o incluso el análisis de fraude. En estos escenarios, las bases de datos relacionales tradicionales pueden volverse muy lentas y complejas con uniones (JOINs) interminables.

Una base de datos de grafos, como Amazon Neptune, no solo almacena tus datos como nodos (las "cosas" o entidades) y aristas (las "relaciones" entre esas cosas), sino que también optimiza las consultas para recorrer esas conexiones. Esto significa que puedes preguntar cosas como "¿Quiénes son los amigos de mis amigos?", "¿Cuál es la ruta más corta entre dos ciudades?", o "¿Qué transacciones están conectadas a una actividad sospechosa en menos de tres pasos?" y obtener respuestas muy rápidamente. Neptune soporta dos modelos populares para grafos: Property Graph (que usa lenguajes de consulta como Gremlin) y RDF (que usa SPARQL), dándote flexibilidad para elegir el que mejor se adapte a tu problema. Esto lo hace una herramienta poderosa para analizar redes complejas y descubrir patrones ocultos en tus datos.
''',
    'code_example': '''
// Ejemplo conceptual de cómo se definirían nodos y aristas en un grafo
// (Esto no es código real de Neptune, sino una representación de su lógica subyacente)

// Nodo: Persona
// ID: 1
// Propiedades: { nombre: "Ana", edad: 30 }

// Nodo: Película
// ID: 101
// Propiedades: { titulo: "Matrix", anio: 1999 }

// Arista: Relación "vio"
// Origen: Persona (ID: 1)
// Destino: Película (ID: 101)
// Propiedades: { calificacion: 5, fecha: "2024-03-10" }

// En un lenguaje de consulta de grafos como Gremlin, podríamos hacer algo como:
// g.V().has('nombre', 'Ana').out('vio').values('titulo')
// Esto encontraría a Ana, seguiría las aristas "vio" desde ella, y devolvería los títulos de las películas que vio.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Bases de Datos Avanzadas',
    'topic': 'Amazon Neptune',
    'subtopic': 'Casos de uso',
    'definition': r'''
Seguramente pensarás de qué va todo esto y en qué situaciones de la vida real podrías usar una base de datos de grafos como Amazon Neptune. Los casos de uso son tan variados como las relaciones que existen en el mundo.

Vamos a ver de que se trata todo esto con algunos ejemplos claros. Imagina que tienes una red social. ¿Cómo encuentras rápidamente los amigos en común entre dos personas, o sugieres nuevas conexiones? Una base de datos de grafos es perfecta para esto porque las personas son nodos y las amistades son aristas. Las consultas para encontrar "caminos" entre usuarios son muy rápidas. Otro ejemplo clásico es la detección de fraude. Si una serie de transacciones sospechosas están conectadas a una misma cuenta bancaria o dirección IP a través de múltiples saltos, una base de datos de grafos puede revelar esa red de relaciones que de otra forma sería muy difícil de detectar con bases de datos tradicionales.

Piensa también en los sistemas de recomendación. Si a un usuario le gustaron ciertas películas o productos, y otros usuarios con gustos similares también disfrutaron de otros, una base de datos de grafos puede modelar estas relaciones y sugerir nuevos ítems de forma inteligente. Otro uso fascinante es el análisis de redes de conocimiento o grafos de conocimiento, donde se conectan entidades como personas, lugares, eventos e ideas. Google, por ejemplo, utiliza un grafo de conocimiento masivo para entender mejor las relaciones entre las cosas en el mundo y mejorar sus resultados de búsqueda. En resumen, si tu problema principal gira en torno a las relaciones complejas entre datos, Amazon Neptune es una excelente candidata.
''',
    'code_example': '''
// Ejemplo conceptual de cómo una consulta de grafo podría funcionar en un caso de uso

// Caso de uso: Detección de fraude
// Queremos encontrar todas las transacciones vinculadas a una dirección IP fraudulenta en menos de 3 pasos.

// Supongamos que tenemos nodos como:
// (IP_Address)-[:USED_BY]->(Account)-[:MADE_TRANSACTION]->(Transaction)

// En Gremlin, una consulta podría verse así:
// g.V().has('type', 'IP_Address').has('value', '192.168.1.100') // Encontrar la IP fraudulenta
//  .repeat(bothE().subgraph('s').outV()).times(3) // Recorrer relaciones hasta 3 pasos
//  .cap('s').unfold().has('type', 'Transaction') // Devolver solo las transacciones encontradas

// Este tipo de consulta es muy eficiente en un grafo porque no requiere uniones complejas en el código de la aplicación.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Bases de Datos Avanzadas',
    'topic': 'Amazon Neptune',
    'subtopic': 'Consultas Gremlin',
    'definition': r'''
Las bases de datos de grafos no son como las relacionales, que usan SQL. Para interactuar con Amazon Neptune y las bases de datos de grafos en general, se utiliza un lenguaje de consulta específico. Cuando hablamos de grafos de propiedades (Property Graphs), el lenguaje más popular y ampliamente adoptado es Gremlin.

No sé tú, pero a mí esto al principio me costó entender cómo se "piensan" las consultas en un grafo. Olvídate de tablas, filas y uniones. Con Gremlin, piensas en "atravesar" el grafo. Imagina que eres un explorador moviéndote de un nodo a otro a través de las aristas, recogiendo información a medida que avanzas. Una consulta Gremlin es una secuencia de "pasos" que le dicen a la base de datos cómo moverse a través del grafo. Cada paso realiza una operación, como seleccionar nodos de inicio, seguir aristas, filtrar resultados o extraer propiedades. Por ejemplo, puedes empezar con un nodo específico (un usuario), luego seguir todas sus relaciones de "amigo", y luego filtrar a esos amigos por su edad. Gremlin es muy expresivo y permite construir consultas complejas de manera intuitiva, reflejando la forma en que los datos están conectados en el grafo. Es la herramienta principal para interactuar con tus datos de grafo en Amazon Neptune si estás usando el modelo de Property Graph.
''',
    'code_example': r'''
// Ejemplo de consulta Gremlin para encontrar amigos de Ana
// Supongamos que tenemos personas (nodos con la etiqueta 'person') y relaciones de amistad (aristas con la etiqueta 'friendOf').

// 1. Encontrar a la persona llamada 'Ana'
// g.V().has('person', 'name', 'Ana')

// 2. Desde Ana, seguir las aristas 'friendOf' para encontrar a sus amigos
// g.V().has('person', 'name', 'Ana').out('friendOf')

// 3. Obtener el nombre de esos amigos
// g.V().has('person', 'name', 'Ana').out('friendOf').values('name')

// Otro ejemplo: Contar cuántas películas vio un usuario específico
// g.V().has('person', 'name', 'Carlos').out('watched').count()

// Ejemplo incorrecto (pensando como SQL, sin pasos de grafo):
// SELECT * FROM users WHERE name = 'Ana' JOIN friendships ON users.id = friendships.user_id;
// Esto no funcionaría directamente en un entorno Gremlin, ya que su paradigma es diferente.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Bases de Datos Avanzadas',
    'topic': 'Amazon Neptune',
    'subtopic': 'Consultas SPARQL',
    'definition': r'''
Así como Gremlin es el lenguaje para los grafos de propiedades, SPARQL (pronunciado "sparkle") es el lenguaje de consulta estándar para los grafos RDF (Resource Description Framework). Amazon Neptune soporta ambos modelos de grafos y, por lo tanto, puedes usar SPARQL si tus datos están modelados como RDF.

Seguramente pensarás de qué va todo esto y en qué se diferencia de Gremlin. Mientras que Gremlin se centra en "recorrer" el grafo a través de pasos, SPARQL se parece más a SQL en el sentido de que utilizas patrones para "emparejar" datos. Pensemos por un momento en un grafo RDF como un conjunto de "triples" (sujeto, predicado, objeto). Por ejemplo: "Ana (sujeto) conoce (predicado) a Juan (objeto)". Una consulta SPARQL define un patrón de estos triples que quieres encontrar en tu grafo. Puedes buscar todos los triples que tienen un sujeto específico, o un predicado específico, o cualquier combinación.

La potencia de SPARQL reside en su capacidad para expresar consultas complejas sobre datos interconectados utilizando un lenguaje declarativo. Es muy utilizado en el ámbito de la web semántica y los linked data, donde la estandarización y la interoperabilidad son clave. Si tu proyecto requiere modelar conocimiento de una manera muy estructurada y necesitas interoperar con otros sistemas que utilizan estándares web semánticos, entonces el modelo RDF y las consultas SPARQL en Amazon Neptune son una opción robusta.
''',
    'code_example': r'''
// Ejemplo de consulta SPARQL para encontrar los nombres de todas las personas
// que tienen el rol de "developer" en un grafo RDF.

// Prefijos se usan para acortar URIs largos
// PREFIX ex: <http://example.org/ontology#>

// SELECT ?personName
// WHERE {
//   ?person a ex:Developer .  // Encuentra cualquier recurso que sea un "Developer" (sujeto ?person, predicado a, objeto ex:Developer)
//   ?person ex:hasName ?personName . // Encuentra el nombre asociado a esa persona (sujeto ?person, predicado ex:hasName, objeto ?personName)
// }

// Otro ejemplo: Encontrar todas las relaciones de una persona específica
// PREFIX ex: <http://example.org/ontology#>
// SELECT ?predicate ?object
// WHERE {
//   ex:JohnDoe ?predicate ?object . // Donde ex:JohnDoe es el sujeto, y buscamos cualquier predicado y objeto.
// }

// Ejemplo de una consulta incorrecta (intentando usar sintaxis de Gremlin en SPARQL):
// g.V().has('name', 'JohnDoe').out('knows').values('name')
// Esto no funcionaría en un motor SPARQL, ya que los paradigmas de consulta son distintos.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Bases de Datos Avanzadas',
    'topic': 'Amazon QLDB',
    'subtopic': 'Ledger databases',
    'definition': r'''
Pensemos por un momento en la necesidad de tener un registro de datos que sea inmutable y verificable. Aquí es donde entran las bases de datos de tipo ledger, y Amazon QLDB (Quantum Ledger Database) es la propuesta de AWS en este espacio.

¿Te estás preguntando por qué esto importa y en qué se diferencia de una base de datos tradicional?

A diferencia de una base de datos relacional o NoSQL convencional, donde los datos pueden ser modificados o eliminados sin dejar rastro de los cambios anteriores, un ledger database como QLDB está diseñado para ser un registro completo, transparente e inmutable de todas las transacciones de datos. Esto significa que cada cambio es añadido como un nuevo "bloque" o entrada en una cadena, y una vez que algo se registra, no se puede alterar ni borrar. QLDB utiliza una función criptográfica (hash) para encadenar cada bloque de datos, creando un historial que es a prueba de manipulaciones. Piensa en el libro contable de una empresa, donde cada entrada es un registro permanente. Esta característica de inmutabilidad es crucial para aplicaciones que requieren un historial auditable y confiable de los datos, como registros financieros, cadenas de suministro, o cualquier escenario donde la integridad de los datos a lo largo del tiempo sea primordial.
''',
    'code_example': r'''
// Ejemplo conceptual de cómo una ledger database funciona
// (No es código de QLDB, sino una representación de su lógica)

// Registro inicial
// Documento 1: { "id": "cuentaA", "saldo": 100 }
// Hash: H1

// Primera actualización (transacción de $20)
// Nuevo documento: { "id": "cuentaA", "saldo": 80 }
// Enlazado a H1
// Nuevo Hash: H2

// Segunda actualización (transacción de $50)
// Nuevo documento: { "id": "cuentaA", "saldo": 30 }
// Enlazado a H2
// Nuevo Hash: H3

// Si alguien intentara modificar el saldo a 90 en el historial original (H1),
// el hash de H2 y H3 no coincidiría, revelando la manipulación.

// A diferencia de una base de datos normal donde simplemente harías:
// UPDATE accounts SET balance = 80 WHERE id = 'cuentaA'; // Sin historial de cambio
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Bases de Datos Avanzadas',
    'topic': 'Amazon QLDB',
    'subtopic': 'Transacciones verificables',
    'definition': r'''
Una de las características más potentes y diferenciadoras de Amazon QLDB es la capacidad de realizar transacciones verificables. Esto va más allá de simplemente tener un historial inmutable; te permite demostrar criptográficamente que los datos no han sido alterados.

¿Te estás preguntando por qué esto importa más allá de la inmutabilidad?

La inmutabilidad por sí sola significa que no puedes reescribir el historial. La verificabilidad, en cambio, significa que puedes probar a cualquier parte interesada (un auditor, un socio comercial, un cliente) que los datos que les estás mostrando son exactamente los que se registraron y que no han sido manipulados desde entonces. Amazon QLDB logra esto utilizando un "journal" (un diario) que registra cada cambio como una serie de bloques enlazados criptográficamente, muy similar a cómo funciona la tecnología blockchain subyacente. Cada transacción produce una "prueba de inclusión" o un "hash de digestión" que es como una huella digital única de un momento específico en el tiempo. Tú puedes tomar este hash y, utilizando las APIs de QLDB, verificar que los datos en tu base de datos corresponden exactamente a ese hash. Esto proporciona un nivel de confianza y transparencia que es difícil de replicar con bases de datos tradicionales, y es crucial en industrias reguladas o donde la auditoría es frecuente.
''',
    'code_example': r'''
// Ejemplo conceptual de verificación en QLDB
// (No es código real, sino una representación de la idea)

// 1. Un cliente realiza una transacción y el sistema la registra en QLDB.
// 2. QLDB devuelve un "digest" (hash criptográfico) de esa transacción.
//    Este digest es la "prueba" de que la transacción existe en el journal.
//    Por ejemplo: digest_transaccion_X = "abc123def456..."

// 3. Más tarde, un auditor quiere verificar la transacción X.
//    El auditor toma el documento de la transacción X del sistema.
//    Le pide a QLDB una prueba criptográfica para ese documento.
//    QLDB calcula un nuevo hash basado en el estado actual del journal y el documento.
//    Si el hash calculado coincide con "abc123def456...", la transacción es verificada como inalterada.

// Si el documento original o cualquier parte del historial que lo precede
// hubiera sido manipulado, los hashes no coincidirían, y la verificación fallaría.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Bases de Datos Avanzadas',
    'topic': 'Amazon QLDB',
    'subtopic': 'Casos de uso',
    'definition': r'''
Seguramente pensarás de qué va todo esto y en qué situaciones de la vida real Amazon QLDB sería una herramienta útil. Los casos de uso giran en torno a la necesidad de tener un registro de datos inmutable, transparente y verificable.

Vamos a ver de que se trata todo esto con algunos ejemplos. 

Imagina una aplicación para gestionar la cadena de suministro, donde necesitas un registro inalterable de cada paso de un producto: desde su origen, pasando por cada transportista, hasta el minorista final. QLDB puede registrar cada transferencia y estado del producto, asegurando que nadie pueda alterar el historial de propiedad o condición. Otro caso de uso clásico es en finanzas, para el registro de transacciones bancarias, la gestión de préstamos, o el seguimiento de activos digitales. La capacidad de QLDB para proporcionar un historial criptográficamente verificable es esencial para cumplir con las regulaciones de auditoría. También es ideal para sistemas de gestión de registros de pacientes en salud, donde la integridad del historial médico es crítica, o para registros de votaciones en sistemas de gobierno electrónico, donde la transparencia y la inmutabilidad son primordiales. Cualquier aplicación que necesite un registro "verdadero" de eventos a lo largo del tiempo, donde la manipulación no sea una opción y la auditoría sea fácil, es un candidato ideal para Amazon QLDB.
''',
    'code_example': '''
// Ejemplo conceptual de cómo se usaría QLDB en una cadena de suministro
// (Esto no es código, sino una representación de cómo se registrarían los eventos)

// Evento 1: Fabricación
// { "productId": "XYZ123", "status": "manufactured", "timestamp": "2024-03-01T10:00:00Z", "location": "FactoryA" }
// QLDB registra este evento.

// Evento 2: Envío
// { "productId": "XYZ123", "status": "shipped", "timestamp": "2024-03-02T14:30:00Z", "carrier": "CarrierB" }
// QLDB añade este evento al historial de "XYZ123".

// Evento 3: Recepción en almacén
// { "productId": "XYZ123", "status": "received", "timestamp": "2024-03-05T09:00:00Z", "location": "WarehouseC" }
// QLDB añade este evento, y así sucesivamente.

// En cualquier momento, puedes consultar el historial completo de "XYZ123" en QLDB
// y tener la certeza criptográfica de que ningún evento ha sido omitido o alterado.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Bases de Datos Avanzadas',
    'topic': 'Amazon QLDB',
    'subtopic': 'Comparación con blockchain',
    'definition': r'''
Cuando hablamos de bases de datos ledger y en particular de Amazon QLDB, es casi inevitable que surja la comparación con la tecnología blockchain. Ambos tienen la inmutabilidad y la verificabilidad como pilares, pero operan bajo principios y escenarios de uso diferentes.

No sé tú, pero a mí esto al principio me costó distinguirlo claramente. La diferencia fundamental radica en la **descentralización**. Un blockchain, por su diseño, es una tecnología distribuida y descentralizada. Múltiples partes (nodos) mantienen copias idénticas del ledger, y todas deben acordar las transacciones (consenso) antes de que se añadan al registro. Esto significa que ninguna entidad tiene control único sobre los datos, lo que es ideal para escenarios donde no hay una autoridad central de confianza. Bitcoin es el ejemplo más famoso.

Por otro lado, Amazon QLDB es un ledger **centralizado** y **controlado por una única autoridad** (en este caso, tú o tu organización). AWS gestiona la infraestructura y la integridad criptográfica del ledger, pero la base de datos es tuya. No hay necesidad de un mecanismo de consenso entre múltiples partes desconocidas, lo que simplifica la operación y suele resultar en un rendimiento mucho mayor y costos más predecibles en comparación con las redes blockchain distribuidas. QLDB es ideal cuando necesitas la inmutabilidad y verificabilidad de un ledger, pero eres la única parte responsable de la integridad del registro, o cuando trabajas en un entorno empresarial con una autoridad central clara. Es una base de datos, no una red de consorcio.
''',
    'code_example': '''
// No hay un ejemplo de código directo para "comparación" ya que es un concepto.
// Sin embargo, podemos contrastar los enfoques:

// En QLDB (centralizado):
// Una aplicación se conecta directamente a un endpoint de QLDB en AWS.
// Todas las escrituras y lecturas son manejadas por este servicio centralizado.
// La verificación se hace contra el historial gestionado por AWS.

// En Blockchain (descentralizado):
// Una aplicación se conecta a un nodo de la red blockchain (ej. Ethereum).
// Las transacciones se envían a la red y son validadas por múltiples nodos.
// Una vez validadas, se añaden a un bloque que se propaga por la red.
// La verificación de la cadena se basa en el consenso de los participantes de la red.

// La elección entre QLDB y blockchain depende de si necesitas un modelo de confianza centralizado (QLDB)
// o uno descentralizado donde ninguna entidad tiene control total (blockchain).
'''
  });
}

Future<void> insertMidLevel6AwsData(Database db) async {
  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Big Data y Machine Learning',
    'topic': 'Amazon S3 Avanzado',
    'subtopic': 'S3 Select',
    'definition': r'''
Pensemos por un momento en un escenario donde tienes gigabytes o terabytes de datos almacenados en Amazon S3, quizás en formato CSV, JSON o Apache Parquet. Normalmente, para analizar esos datos, tendrías que descargarlos completamente y luego procesarlos en tu aplicación o en otro servicio. S3 Select cambia eso.

¿Te estás preguntando por qué esto importa y cómo te puede hacer la vida más fácil?

Con S3 Select, puedes recuperar solo el subconjunto de datos que realmente necesitas de un objeto S3, aplicando una consulta SQL directamente sobre el archivo. Esto significa que en lugar de descargar un archivo de 1 GB para sacar 100 KB de información relevante, S3 Select procesa la consulta en el mismo S3 y solo te envía los 100 KB que pediste. Esto no solo reduce drásticamente la cantidad de datos transferidos (lo que se traduce en costos más bajos), sino que también acelera el tiempo de respuesta de tus aplicaciones porque no tienen que esperar a descargar y luego filtrar una cantidad masiva de datos. Es súper útil para análisis ad-hoc, para alimentar aplicaciones con conjuntos de datos pequeños de archivos grandes, o para trabajos de ETL (Extract, Transform, Load) donde solo te interesa una parte específica del archivo.
''',
    'code_example': '''
// Ejemplo conceptual de cómo usar S3 Select
// (Esto no es código ejecutable directo, sino la lógica de una consulta S3 Select)

// Supongamos que tienes un archivo CSV en S3 llamado 'ventas.csv' con columnas: id, producto, cantidad, precio, fecha
// Y solo quieres las ventas de "Laptop"

// Consulta SQL que enviarías a S3 Select:
// SELECT s.id, s.producto, s.cantidad, s.precio
// FROM S3Object s
// WHERE s.producto = 'Laptop'

// Cómo se vería en un SDK de AWS (ejemplo conceptual en Python boto3):
// import boto3
// s3_client = boto3.client('s3')
// response = s3_client.select_object_content(
//     Bucket='mi-bucket-de-datos',
//     Key='ventas.csv',
//     ExpressionType='SQL',
//     Expression="SELECT s.id, s.producto, s.cantidad, s.precio FROM S3Object s WHERE s.producto = 'Laptop'",
//     InputSerialization={'CSV': {'FileHeaderInfo': 'USE'}},
//     OutputSerialization={'CSV': {}},
// )

// for event in response['Payload']:
//     if 'Records' in event:
//         print(event['Records']['Payload'].decode('utf-8'))

// Esto devolvería solo las filas que cumplen la condición, sin descargar el archivo completo.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Big Data y Machine Learning',
    'topic': 'Amazon S3 Avanzado',
    'subtopic': 'S3 Batch Operations',
    'definition': r'''
Pensemos por un momento en la necesidad de realizar una acción masiva sobre miles, o incluso millones, de objetos en Amazon S3. ¿Qué pasaría si necesitas copiar, etiquetar, restaurar desde Glacier, o cambiar permisos de un subconjunto enorme de tus archivos? Hacerlo manualmente sería una pesadilla, y escribir scripts complejos podría llevar mucho tiempo y recursos. Aquí es donde S3 Batch Operations se convierte en tu mejor amigo.

¿Te estás preguntando por qué esto importa y cómo simplifica la gestión de tu almacenamiento?

S3 Batch Operations es una característica que te permite realizar operaciones a gran escala en objetos S3 con unos pocos clics en la consola de AWS o a través de una simple llamada a la API. Básicamente, tú le proporcionas a S3 una lista de los objetos sobre los que quieres actuar (generalmente un archivo CSV con la ruta de cada objeto), le dices qué operación quieres realizar (por ejemplo, "copiar objetos" o "poner etiquetas"), y S3 se encarga de ejecutar esa tarea de forma distribuida y totalmente gestionada. Esto te libera de tener que manejar el escalado, los reintentos en caso de fallos, o la gestión de errores para cada objeto individualmente. Es súper eficiente para tareas como migrar datos entre buckets, aplicar nuevas políticas de retención, o cualquier acción que necesite ser aplicada a un gran número de objetos de S3 de una sola vez.
''',
    'code_example': '''
// Ejemplo conceptual de cómo funciona S3 Batch Operations
// (Esto no es código directo, sino la representación de la configuración de un trabajo)

// 1. Crear un manifiesto (archivo CSV) con los objetos a procesar:
//    bucket-origen,clave-objeto-1
//    bucket-origen,clave-objeto-2
//    ...

// 2. Definir la operación:
//    - Copiar objetos: especificar bucket de destino, prefijo, etc.
//    - Reemplazar etiquetas: especificar las nuevas etiquetas.
//    - Restaurar desde Glacier: especificar días de retención.
//    - Invocar una función Lambda: para lógica personalizada por objeto.

// 3. Crear el trabajo de S3 Batch Operations (mediante consola o SDK):
//    Especificar el bucket del manifiesto, el tipo de operación, roles de IAM, etc.

// Pseudocódigo para iniciar un trabajo de copia (conceptual):
// s3_client.create_job(
//     ConfirmationRequired=False,
//     Operation={
//         'S3PutObjectCopy': {
//             'TargetBucket': 'arn:aws:s3:::mi-bucket-destino',
//             'NewObjectTagging': [{'Key': 'estado', 'Value': 'procesado'}],
//         }
//     },
//     Report={'Bucket': 'arn:aws:s3:::mi-bucket-de-logs'},
//     Manifest={'Location': {'Bucket': 'arn:aws:s3:::mi-bucket-manifiestos', 'Key': 'lista_objetos.csv'}},
//     Priority=10,
//     RoleArn='arn:aws:iam::123456789012:role/S3BatchOperationsRole',
//     Description='Copiar y etiquetar objetos antiguos',
//     Tags=[{'Key': 'Proyecto', 'Value': 'Migracion'}]
// )
// S3 se encargaría de copiar cada objeto listado y aplicar las etiquetas.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Big Data y Machine Learning',
    'topic': 'Amazon S3 Avanzado',
    'subtopic': 'S3 Access Points',
    'definition': r'''
Pensemos por un momento en cómo accedes a los datos en tus buckets de S3. Tradicionalmente, usas el nombre del bucket y la clave del objeto. Pero, ¿qué pasa si tienes un bucket gigante con miles de aplicaciones o usuarios diferentes que necesitan acceder a subconjuntos específicos de datos, cada uno con políticas de acceso distintas? Gestionar todas esas políticas directamente en el bucket puede volverse complicado. Aquí es donde S3 Access Points entra en juego.

¿Te estás preguntando por qué esto importa y cómo simplifica la gestión de accesos?

S3 Access Points te permiten crear puntos de acceso de red dedicados para un bucket S3. Cada Access Point tiene un nombre de host único y una política de acceso propia, que puede ser más restrictiva que la política del bucket subyacente. Es como crear un alias personalizado con sus propias reglas de seguridad para un bucket específico. Esto es súper útil porque puedes definir políticas de acceso muy granulares para diferentes aplicaciones o usuarios sin tener que modificar la política principal del bucket. Por ejemplo, podrías tener un Access Point para tu equipo de análisis que solo puede leer datos de una carpeta específica, y otro Access Point para tu aplicación web que solo puede escribir en otra carpeta. Esto simplifica la gestión de permisos, mejora la seguridad al limitar el alcance de cada punto de acceso y hace que sea más fácil escalar la forma en que interactúas con un bucket grande.
''',
    'code_example': '''
// Ejemplo conceptual de S3 Access Points
// (No es código ejecutable, sino la lógica de configuración)

// Un bucket S3 existente: 'mi-bucket-de-datos-empresa'

// 1. Crear un S3 Access Point para el equipo de "Analistas":
//    Nombre del Access Point: 'analisis-ventas-access-point'
//    Policy para este Access Point:
//    {
//      "Version": "2012-10-17",
//      "Statement": [
//        {
//          "Effect": "Allow",
//          "Principal": { "AWS": "arn:aws:iam::123456789012:role/AnalistasRole" },
//          "Action": "s3:GetObject",
//          "Resource": "arn:aws:s3:us-east-1:123456789012:accesspoint/analisis-ventas-access-point/object/ventas/*"
//        }
//      ]
//    }
//    Los analistas usarían 's3://arn:aws:s3:us-east-1:123456789012:accesspoint/analisis-ventas-access-point/ventas/...'

// 2. Crear un S3 Access Point para la aplicación de "Ingesta de datos":
//    Nombre del Access Point: 'ingesta-logs-access-point'
//    Policy para este Access Point:
//    {
//      "Version": "2012-10-17",
//      "Statement": [
//        {
//          "Effect": "Allow",
//          "Principal": { "AWS": "arn:aws:iam::123456789012:role/AplicacionIngestaRole" },
//          "Action": ["s3:PutObject", "s3:AbortMultipartUpload"],
//          "Resource": "arn:aws:s3:us-east-1:123456789012:accesspoint/ingesta-logs-access-point/object/logs/*"
//        }
//      ]
//    }
//    La aplicación usaría 's3://arn:aws:s3:us-east-1:123456789012:accesspoint/ingesta-logs-access-point/logs/...'

// Esto permite que el bucket 'mi-bucket-de-datos-empresa' tenga una política general más abierta
// o incluso vacía, y la granularidad de los permisos se maneja a nivel de los Access Points.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Big Data y Machine Learning',
    'topic': 'Amazon S3 Avanzado',
    'subtopic': 'S3 Object Lambda',
    'definition': r'''
Pensemos por un momento en cómo podrías procesar datos que lees de S3 *antes* de que lleguen a tu aplicación. Tradicionalmente, si querías transformar un objeto S3 (por ejemplo, redimensionar una imagen, redactar información sensible de un documento, o convertir un formato de archivo), tenías que descargarlo, procesarlo con tu lógica de aplicación, y luego usar la versión procesada. S3 Object Lambda cambia ese flujo por completo.

¿Te estás preguntando por qué esto importa y cómo transforma la lectura de datos?

S3 Object Lambda te permite añadir tu propio código de AWS Lambda para procesar datos directamente desde S3 mientras se solicitan. Funciona creando un "Access Point" especial (un S3 Object Lambda Access Point) que, cuando se utiliza para solicitar un objeto, invoca automáticamente una función Lambda. Esta función Lambda recibe el objeto de S3, lo procesa según tu lógica (por ejemplo, elimina información de identificación personal, convierte un CSV a JSON, o incluso agrega datos de otra fuente), y luego devuelve la versión modificada del objeto al solicitante. Esto es increíblemente poderoso porque tus aplicaciones siguen viendo S3 como la fuente de datos, pero los datos se transforman de forma transparente en tiempo real. Es perfecto para casos de uso como la redacción de datos sensibles para diferentes usuarios, la normalización de datos en diferentes formatos, o la personalización de contenido entregado desde S3. Es como tener un "proxy inteligente" para tus objetos S3.
''',
    'code_example': r'''
// Ejemplo conceptual de S3 Object Lambda
// (No es código directo de implementación, sino la lógica y el flujo)

// 1. Objeto original en S3:
//    Bucket: 'mi-bucket-original'
//    Key: 'documento.csv'
//    Contenido: "nombre,email,telefono\nAna,ana@ejemplo.com,123456789\n..."

// 2. Función AWS Lambda (ej. en Python):
//    def lambda_handler(event, context):
//        s3_url = event['x-amz-s3-url'] // URL pre-firmada para obtener el objeto original
//        # Descargar el objeto original de S3
//        original_object_data = download_from_s3(s3_url)

//        # Procesar/transformar el objeto (ej. redactar emails)
//        processed_data = original_object_data.replace('@ejemplo.com', '***REDACTED***')

//        // Subir el objeto procesado de vuelta a un S3 Object Lambda response stream
//        upload_to_s3_object_lambda_response(processed_data, event['outputRoute'], event['outputToken'])
//        return {'statusCode': 200}

// 3. Configurar S3 Object Lambda Access Point:
//    - Enlazarlo al bucket original ('mi-bucket-original').
//    - Apuntar a la función Lambda anterior.

// 4. Una aplicación solicita 'documento.csv' a través del S3 Object Lambda Access Point:
//    GET s3://arn:aws:s3:us-east-1:123456789012:accesspoint/mi-object-lambda-ap/documento.csv

// Flujo:
// Aplicación -> S3 Object Lambda Access Point -> Invoca Función Lambda
// Función Lambda -> Descarga 'documento.csv' de 'mi-bucket-original'
// Función Lambda -> Procesa los datos (redacta email)
// Función Lambda -> Envía los datos redactados de vuelta al S3 Object Lambda Access Point
// S3 Object Lambda Access Point -> Envía los datos redactados a la Aplicación

// La aplicación recibe el contenido de 'documento.csv' con los emails redactados,
// sin necesidad de lógica de procesamiento en la aplicación cliente.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Big Data y Machine Learning',
    'topic': 'AWS Glue',
    'subtopic': 'ETL serverless',
    'definition': r'''
Pensemos por un momento en el procesamiento de datos a gran escala. Muchas veces, los datos no vienen en el formato o la estructura que necesitas para tus análisis o aplicaciones. Aquí es donde entra en juego el ETL (Extract, Transform, Load), y AWS Glue es la respuesta de AWS para hacer esto de forma serverless.

¿Te estás preguntando por qué esto importa y cómo te puede hacer la vida más fácil al procesar datos?

Un proceso ETL tradicional puede ser complejo y requerir mucha infraestructura: servidores dedicados para ejecutar tus trabajos de extracción, transformación y carga, con todo el mantenimiento y escalado que eso implica. AWS Glue es un servicio ETL completamente serverless, lo que significa que no tienes que preocuparte por aprovisionar, configurar o gestionar ningún servidor. Tú simplemente le das tus scripts de ETL (normalmente en Python o Scala), le indicas dónde están tus datos de origen y dónde quieres que vayan los datos transformados, y Glue se encarga de todo lo demás: escalar los recursos necesarios, ejecutar el código, y manejar las interacciones con otros servicios de AWS. Esto te permite enfocarte en la lógica de transformación de tus datos en lugar de la infraestructura subyacente. Es como tener un equipo de ingenieros de datos trabajando para ti, pero sin la necesidad de contratarlos o pagar sus salarios fijos, solo por lo que usan.
''',
    'code_example': '''
// Ejemplo conceptual de un script de AWS Glue ETL (Python - PySpark)

// Importar las librerías necesarias
import sys
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job

# Inicializar Spark y Glue Context
sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init("mi_job_etl_ejemplo", {}) # Reemplaza "mi_job_etl_ejemplo" con el nombre de tu Job

# 1. Extraer (Extract): Leer datos de un origen (ej. S3)
datasource0 = glueContext.create_dynamic_frame.from_options(
    connection_type="s3",
    connection_options={"paths": ["s3://mi-bucket-origen/datos_crudos/"]},
    format="json",
    transformation_ctx="datasource0"
)

# 2. Transformar (Transform): Aplicar lógica de negocio
# Por ejemplo, seleccionar algunas columnas y convertir a mayúsculas
applymapping1 = ApplyMapping.apply(
    frame=datasource0,
    mappings=[
        ("id", "long", "id", "long"),
        ("nombre", "string", "nombre_completo", "string"),
        ("email", "string", "email_contacto", "string")
    ],
    transformation_ctx="applymapping1"
)

resolvechoice2 = ResolveChoice.apply(
    frame=applymapping1,
    choice="make_cols_string",
    transformation_ctx="resolvechoice2"
)

dropnullfields3 = DropNullFields.apply(
    frame=resolvechoice2,
    transformation_ctx="dropnullfields3"
)

# Convertir un campo a mayúsculas
# Esto es un ejemplo simplificado, en PySpark se haría de otra manera.
# Si tuviéramos un DataFrame, sería algo como:
# from pyspark.sql.functions import upper
# df = dropnullfields3.toDF()
# df = df.withColumn("nombre_completo", upper(df["nombre_completo"]))
# final_dynamic_frame = DynamicFrame.fromDF(df, glueContext, "final_df")

# 3. Cargar (Load): Escribir los datos transformados a un destino (ej. S3)
datasink4 = glueContext.write_dynamic_frame.from_options(
    frame=dropnullfields3, # O final_dynamic_frame si aplicaste más transformaciones
    connection_type="s3",
    connection_options={"path": "s3://mi-bucket-destino/datos_procesados/", "partitionKeys": []},
    format="parquet",
    transformation_ctx="datasink4"
)

job.commit()

// Este script sería subido a Glue y ejecutado por el servicio.
// No necesitas gestionar servidores ni clústeres de Spark por tu cuenta.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Big Data y Machine Learning',
    'topic': 'AWS Glue',
    'subtopic': 'Data Catalog',
    'definition': r'''
Pensemos por un momento en tener una "biblioteca" centralizada para todos los metadatos de tus datos en AWS. Cuando trabajas con Big Data, tus datos pueden estar dispersos en S3, RDS, Redshift, etc., en diferentes formatos y estructuras. Recordar dónde está cada cosa y qué contiene es un verdadero dolor de cabeza. El AWS Glue Data Catalog es la solución a este problema.

¿Te estás preguntando por qué esto importa y cómo te ayuda a encontrar y entender tus datos?

El Data Catalog es un repositorio de metadatos persistente y gestionado por AWS. No almacena tus datos reales, sino información sobre ellos: su ubicación, su esquema (qué columnas tiene una tabla, qué tipo de datos son), su formato (CSV, Parquet, JSON), y otra información descriptiva. Es como el índice de una gran biblioteca. Cuando otros servicios de AWS, como Amazon Athena, Amazon Redshift Spectrum, o incluso otros trabajos de Glue, necesitan acceder a tus datos, consultan el Data Catalog para entender cómo están estructurados y dónde encontrarlos. Esto elimina la necesidad de definir esquemas cada vez que accedes a un conjunto de datos, lo que ahorra tiempo y reduce errores. Al tener un catálogo centralizado, todos en tu organización pueden tener una vista consistente y unificada de tus activos de datos, lo que facilita el descubrimiento y el análisis de información.
''',
    'code_example': '''
// Ejemplo conceptual de cómo interactúa el Data Catalog
// (No es código directo, sino una representación del uso)

// 1. Un "Crawler" de Glue (ver subtema siguiente) escanea tu bucket S3.
//    Encuentra un archivo CSV llamado 'clientes.csv' y determina su esquema:
//    - id: INT
//    - nombre: STRING
//    - email: STRING

// 2. El Crawler crea una entrada en el Glue Data Catalog:
//    Base de datos: 'mi_data_lake'
//    Tabla: 'clientes'
//    Ubicación: 's3://mi-bucket-datos/clientes.csv'
//    Formato: 'CSV'
//    Columnas: id (int), nombre (string), email (string)

// 3. Ahora, puedes consultar tus datos con Amazon Athena sin definir el esquema:
//    En la consola de Athena, seleccionas la base de datos 'mi_data_lake' y la tabla 'clientes'.
//    SELECT nombre, email FROM clientes WHERE id > 100;
//    Athena usa la información del Data Catalog para saber cómo leer el archivo CSV en S3.

// Sin el Data Catalog, cada servicio que quisiera leer 'clientes.csv'
// necesitaría que le definieras el esquema manualmente, lo que sería propenso a errores y duplicidad.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Big Data y Machine Learning',
    'topic': 'AWS Glue',
    'subtopic': 'Crawlers',
    'definition': r'''
Pensemos por un momento en la tarea de descubrir la estructura de tus datos cuando no la conoces de antemano o cuando tus datos cambian con frecuencia. Imagina que tienes un montón de archivos en S3 y no sabes exactamente qué columnas tienen o en qué formato están. Aquí es donde los "Crawlers" de AWS Glue se vuelven indispensables.

¿Te estás preguntando por qué esto importa y cómo te ahorra tiempo en la gestión de esquemas?

Un AWS Glue Crawler es un programa que puedes configurar para conectarse a un origen de datos (como un bucket S3, una base de datos RDS, etc.), escanear tus datos, y automáticamente inferir su esquema y formato. Una vez que el crawler ha terminado de escanear, crea o actualiza las tablas de metadatos correspondientes en el AWS Glue Data Catalog. Esto es increíblemente útil porque no tienes que definir manualmente los esquemas de tus tablas, lo cual puede ser tedioso y propenso a errores, especialmente con conjuntos de datos grandes y complejos. Puedes programar los crawlers para que se ejecuten periódicamente, asegurando que tu Data Catalog esté siempre actualizado con la estructura más reciente de tus datos. Esto es fundamental para mantener tu data lake organizado y hacer que tus datos sean fácilmente consultables por otros servicios.
''',
    'code_example': '''
// Ejemplo conceptual de configuración de un AWS Glue Crawler
// (Esto no es código, sino una descripción de los pasos en la consola o API)

// 1. Definir el origen de datos (Source):
//    - Tipo de origen: S3
//    - Ruta S3: s3://mi-bucket-de-datos/logs/ (El crawler escaneará los archivos aquí)
//    - Incluir/Excluir patrones (opcional): *.json, **/*.gz

// 2. Definir el destino del Crawler:
//    - Base de datos en el Data Catalog: 'mi_data_lake_logs'
//    - Prefijo de tabla: 'web_logs_' (Las tablas generadas se llamarán 'web_logs_2024_01_01', etc.)

// 3. Configurar la frecuencia de ejecución:
//    - Cada hora
//    - Cada día
//    - Bajo demanda

// 4. Seleccionar un rol de IAM:
//    Un rol con permisos para leer de S3 y escribir en el Data Catalog.

// Cuando el crawler se ejecuta:
// - Escanea los archivos en 's3://mi-bucket-de-datos/logs/'.
// - Identifica archivos JSON, determina sus campos y tipos de datos.
// - Si los datos están particionados (ej. /logs/año=2024/mes=01/), el crawler también detecta las particiones.
// - Crea o actualiza una tabla en el Glue Data Catalog (ej. 'web_logs_2024') con el esquema inferido.

// Esto automatiza la gestión de metadatos y asegura que las herramientas de análisis
// siempre tengan la información de esquema correcta para tus datos.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Big Data y Machine Learning',
    'topic': 'AWS Glue',
    'subtopic': 'Jobs y triggers',
    'definition': r'''
Pensemos por un momento en cómo orquestas y automatizas tus procesos ETL en AWS Glue. Tener scripts de transformación es genial, pero necesitas una forma de ejecutarlos, monitorearlos y hacer que se activen en el momento adecuado. Aquí es donde los "Jobs" y "Triggers" de AWS Glue entran en acción.

¿Te estás preguntando por qué esto importa y cómo te ayuda a automatizar tus flujos de datos?

Un "Job" en AWS Glue es la unidad de trabajo ejecutable que contiene tu script ETL (ya sea un script de Python/PySpark, Scala/Spark, o incluso un notebook de Zeppelin). Tú defines el Job, le asocias tu script, especificas los recursos que necesita (como el tipo de trabajador y la cantidad de DPU – Data Processing Units), y le indicas dónde leer y escribir datos. El Job se encarga de ejecutar ese script en un entorno serverless.

Pero, ¿cómo se inician estos Jobs? Ahí es donde los "Triggers" son fundamentales. Un Trigger es un mecanismo que inicia un Job de Glue. Puedes configurarlos de varias maneras:
* **Basados en tiempo:** Un Trigger programado para ejecutarse a intervalos regulares (ej. cada día a medianoche, cada hora). Esto es perfecto para ETLs diarios o por lotes.
* **Basados en eventos:** Un Trigger que se activa cuando ocurre un evento específico, como la carga de un nuevo archivo en un bucket de S3. Esto es ideal para procesar datos tan pronto como llegan.
* **Basados en demanda:** Ejecutar el Job manualmente.
* **Basados en trabajos completados:** Un Job puede activarse después de que otro Job o un Crawler haya terminado con éxito.

La combinación de Jobs y Triggers te permite construir pipelines ETL robustos y completamente automatizados sin tener que gestionar la infraestructura subyacente.
''',
    'code_example': '''
// Ejemplo conceptual de un Job y un Trigger en AWS Glue
// (Esto no es código, sino una representación de la configuración en la consola o API)

// Configuración de un Job de Glue:
// Nombre del Job: 'etl_procesar_ventas_diarias'
// Tipo de Job: Spark
// Script de ETL: s3://mi-bucket-scripts/scripts/procesar_ventas.py
// Roles de IAM: un rol que permita a Glue acceder a S3 y al Data Catalog
// DPU: 5 (Unidades de procesamiento de datos para la capacidad de Spark)
// Argumentos: --input_path s3://mi-bucket-origen/ventas/ --output_path s3://mi-bucket-destino/ventas_procesadas/

// Configuración de un Trigger para este Job:

// Opción 1: Trigger basado en tiempo (ej. ejecución diaria)
// Nombre del Trigger: 'diario_ventas_trigger'
// Tipo: Programado
// Frecuencia: Cron expression (ej. "cron(0 0 * * ? *)" para cada medianoche UTC)
// Acción: Iniciar el Job 'etl_procesar_ventas_diarias'

// Opción 2: Trigger basado en evento (ej. nuevo archivo en S3)
// Nombre del Trigger: 'nuevo_archivo_ventas_trigger'
// Tipo: Evento
// Origen: S3 (bucket 'mi-bucket-origen', prefijo 'ventas/')
// Evento: s3:ObjectCreated:*
// Acción: Iniciar el Job 'etl_procesar_ventas_diarias'

// Cuando el Trigger se activa, invoca el Job de Glue, el cual:
// 1. Provisiona los recursos de Spark automáticamente.
// 2. Descarga y ejecuta el script 'procesar_ventas.py'.
// 3. Una vez terminado, libera los recursos, y solo pagas por el tiempo de ejecución.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Big Data y Machine Learning',
    'topic': 'Amazon SageMaker',
    'subtopic': 'Conceptos básicos de ML',
    'definition': r'''
Pensemos por un momento en el Machine Learning (ML), que es básicamente la habilidad de las computadoras para aprender de los datos y tomar decisiones o hacer predicciones sin ser programadas explícitamente para cada tarea. Amazon SageMaker es una plataforma de AWS que simplifica todo el ciclo de vida del ML, pero antes de sumergirnos en la herramienta, es bueno tener claras algunas ideas clave.

¿Te estás preguntando por qué esto importa y qué es lo mínimo que deberías saber?

En el corazón del ML hay algunos conceptos fundamentales. Primero, los **datos**: el ML vive y respira a través de los datos. Necesitas datos de calidad, y en buena cantidad, para que un modelo aprenda. Luego, el **entrenamiento**: es el proceso donde un algoritmo de ML "estudia" tus datos, buscando patrones y relaciones. Durante este paso, el algoritmo ajusta sus parámetros para minimizar el error en sus predicciones. El resultado de este entrenamiento es un **modelo** entrenado, que es como el "conocimiento" que el algoritmo ha adquirido. Finalmente, la **inferencia** o **predicción**: una vez que tienes un modelo entrenado, puedes alimentarlo con nuevos datos (que no ha visto antes) y el modelo usará lo que aprendió para hacer una predicción o clasificación. Por ejemplo, si entrenaste un modelo para reconocer gatos en fotos, la inferencia sería mostrarle una nueva foto y que el modelo diga "es un gato". Comprender estos pasos básicos es clave para entender cómo funciona cualquier herramienta de ML, incluyendo SageMaker.
''',
    'code_example': '''
// Este no es código de SageMaker, sino un ejemplo conceptual de ML con Python puro.

// 1. Datos (simulados)
// Supongamos que queremos predecir si una persona comprará un producto
// en base a su edad y si ha visitado la página antes.
// [Edad, VisitasPrevias], CompraProducto (0=No, 1=Sí)
var training_data = [
    [25, 1, 0], // Ana, 25 años, 1 visita, No compró
    [30, 5, 1], // Juan, 30 años, 5 visitas, Sí compró
    [40, 2, 0], // Pedro, 40 años, 2 visitas, No compró
    [35, 7, 1], // Maria, 35 años, 7 visitas, Sí compró
    [22, 0, 0], // Luis, 22 años, 0 visitas, No compró
    [45, 6, 1]  // Elena, 45 años, 6 visitas, Sí compró
];

// 2. Un algoritmo (muy simplificado, una especie de "regla" manual para ilustrar)
// def simple_prediction_model(age, previous_visits):
//     if previous_visits >= 4 and age >= 30:
//         return 1 # Comprará
//     else:
//         return 0 # No comprará

// 3. Entrenamiento (en la vida real, el algoritmo aprendería estas reglas automáticamente)
// Aquí, el "entrenamiento" es conceptualmente derivar la regla simple anterior
// a partir de los `training_data`.

// 4. Inferencia/Predicción
// print(simple_prediction_model(28, 3)); // Output: 0 (No comprará)
// print(simple_prediction_model(33, 5)); // Output: 1 (Comprará)

// En un entorno de ML real con SageMaker, el modelo sería mucho más complejo
// y el "aprendizaje" sería automático, usando algoritmos avanzados.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Big Data y Machine Learning',
    'topic': 'Amazon SageMaker',
    'subtopic': 'Notebook instances',
    'definition': r'''
Pensemos por un momento en el espacio de trabajo que un científico de datos o un ingeniero de ML necesita para experimentar, desarrollar y probar modelos. Necesitan un entorno interactivo donde puedan escribir código, ejecutarlo paso a paso, visualizar resultados y documentar su proceso. Las Notebook Instances de Amazon SageMaker son precisamente eso.

¿Te estás preguntando por qué esto importa y cómo te proporciona un entorno de desarrollo ideal?

Una Notebook Instance de SageMaker es un servidor virtual preconfigurado y gestionado por AWS, que viene con todo lo que necesitas para el desarrollo de ML: entornos de Python y R, librerías populares como TensorFlow, PyTorch, scikit-learn, y por supuesto, el entorno Jupyter Notebook o JupyterLab. Esto es súper útil porque no tienes que preocuparte por configurar tu propio entorno de desarrollo, instalar dependencias o gestionar la infraestructura subyacente. Simplemente lanzas una Notebook Instance, abres un notebook y empiezas a escribir tu código de ML. Puedes usar estas instancias para limpiar datos, explorar conjuntos de datos, prototipar modelos, entrenar modelos pequeños y probar tus algoritmos antes de escalar a entrenamientos más grandes. Es tu laboratorio personal de ML en la nube, listo para usar en cuestión de minutos.
''',
    'code_example': '''
// Ejemplo de código Python que ejecutarías en un Jupyter Notebook en SageMaker

// Importar librerías comunes de ciencia de datos
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

// Cargar datos (ej. desde un bucket S3)
// import sagemaker
// sagemaker_session = sagemaker.Session()
// bucket = sagemaker_session.default_bucket()
// data_path = f's3://{bucket}/mi_dataset.csv'
// df = pd.read_csv(data_path)

// Mostrar las primeras filas del DataFrame
// print(df.head())

// Realizar algunas visualizaciones básicas
// df['feature_column'].hist(bins=50)
// plt.title('Distribución de Feature')
// plt.show()

// Realizar un preprocesamiento básico de datos
// df['nueva_columna'] = df['otra_columna'] * 2

// Este código se ejecutaría interactivamente en celdas de un Jupyter Notebook,
// permitiéndote ver los resultados de cada paso inmediatamente.
// No necesitas configurar un entorno Python local o gestionar servidores.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Big Data y Machine Learning',
    'topic': 'Amazon SageMaker',
    'subtopic': 'Built-in algorithms',
    'definition': r'''
Pensemos por un momento en la diversidad de algoritmos de Machine Learning que existen y la complejidad de implementarlos desde cero o incluso de optimizarlos para un alto rendimiento. Desde regresiones lineales hasta redes neuronales profundas, cada uno tiene sus particularidades. Amazon SageMaker te facilita la vida al ofrecer una serie de algoritmos "built-in" o pre-construidos.

¿Te estás preguntando por qué esto importa y cómo te acelera el desarrollo de modelos?

Los algoritmos built-in de SageMaker son algoritmos de ML populares (como XGBoost, K-Means, Linear Learner, Image Classification, etc.) que AWS ha optimizado y pre-entrenado o pre-configurado para funcionar de manera eficiente y escalable en la infraestructura de AWS. Esto es súper útil por varias razones: primero, no necesitas ser un experto en la implementación de estos algoritmos; simplemente los seleccionas, proporcionas tus datos de entrenamiento, y SageMaker se encarga del resto. Segundo, están optimizados para el rendimiento, lo que significa que pueden manejar grandes volúmenes de datos y entrenar modelos más rápido que una implementación genérica. Esto acelera drásticamente el proceso de experimentación y desarrollo de modelos, permitiéndote concentrarte en la calidad de tus datos y la evaluación del modelo, en lugar de en la ingeniería del algoritmo en sí. Es como tener una caja de herramientas de ML de alto rendimiento lista para usar.
''',
    'code_example': '''
// Ejemplo conceptual de cómo usar un algoritmo built-in de SageMaker (Python SDK)

// Importar SageMaker SDK
// import sagemaker
// from sagemaker.amazon.amazon_estimator import get_image_uri

// 1. Obtener la sesión de SageMaker y el bucket predeterminado
// sagemaker_session = sagemaker.Session()
// bucket = sagemaker_session.default_bucket()
// role = sagemaker.get_execution_role()

// 2. Especificar el algoritmo built-in (ej. XGBoost)
// container = get_image_uri(sagemaker_session.boto_region_name, 'xgboost', 'latest')

// 3. Crear un Estimador (representa el algoritmo y su configuración)
// xgb = sagemaker.estimator.Estimator(
//     container,
//     role,
//     instance_count=1,
//     instance_type='ml.m5.xlarge', // Tipo de instancia para el entrenamiento
//     output_path=f's3://{bucket}/output',
//     sagemaker_session=sagemaker_session
// )

// 4. Configurar hiperparámetros del algoritmo
// xgb.set_hyperparameters(
//     objective='binary:logistic',
//     num_round=100,
//     eval_metric='auc'
// )

// 5. Preparar los datos de entrenamiento (ej. ubicados en S3)
// train_data_path = f's3://{bucket}/data/train.csv'
// validation_data_path = f's3://{bucket}/data/validation.csv'
// s3_input_train = sagemaker.inputs.TrainingInput(
//     s3_data=train_data_path,
//     content_type='csv'
// )
// s3_input_validation = sagemaker.inputs.TrainingInput(
//     s3_data=validation_data_path,
//     content_type='csv'
// )

// 6. Lanzar el trabajo de entrenamiento
// xgb.fit({'train': s3_input_train, 'validation': s3_input_validation})

// SageMaker se encarga de lanzar las instancias de entrenamiento,
// ejecutar el algoritmo XGBoost con tus datos y guardar el modelo entrenado.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Big Data y Machine Learning',
    'topic': 'Amazon SageMaker',
    'subtopic': 'Model deployment',
    'definition': r'''
Pensemos por un momento en lo que sucede después de que has entrenado un modelo de Machine Learning y estás contento con su rendimiento. El modelo por sí solo no es muy útil si no puedes ponerlo a trabajar. Necesitas una forma de que tus aplicaciones puedan usarlo para hacer predicciones en tiempo real o en lotes. Aquí es donde el "despliegue de modelos" en Amazon SageMaker se vuelve crucial.

¿Te estás preguntando por qué esto importa y cómo te permite usar tus modelos en producción?

El despliegue de modelos es el proceso de tomar tu modelo entrenado y ponerlo a disposición para la inferencia, es decir, para que haga predicciones con datos nuevos. SageMaker simplifica enormemente este proceso. Puedes desplegar tu modelo como un **endpoint en tiempo real**, que es básicamente una API REST que tu aplicación puede llamar. SageMaker se encarga de provisionar la infraestructura subyacente (instancias, balanceadores de carga, etc.), escalarla automáticamente según la demanda, y gestionar el monitoreo del endpoint. Esto es súper útil para aplicaciones que necesitan predicciones rápidas y de baja latencia, como sistemas de recomendación, detección de fraude o análisis de sentimiento en tiempo real. También puedes configurar **transformaciones por lotes** para procesar grandes volúmenes de datos de forma asíncrona. La capacidad de SageMaker para desplegar y gestionar modelos en producción de forma sencilla te libera de la complejidad operativa, permitiéndote poner tus innovaciones de ML en manos de los usuarios rápidamente.
''',
    'code_example': '''
// Ejemplo conceptual de despliegue de un modelo en SageMaker (Python SDK)

// Continuando con el ejemplo de entrenamiento de XGBoost:
// xgb.fit(...) (Asumimos que este paso ya se ejecutó y el modelo está entrenado)

// 1. Desplegar el modelo entrenado como un endpoint en tiempo real
// predictor = xgb.deploy(
//     initial_instance_count=1,
//     instance_type='ml.m5.xlarge' // Tipo de instancia para el endpoint de inferencia
// )

// El comando .deploy() hará lo siguiente por ti:
// - Crear un modelo de SageMaker (que apunta al artefacto de tu modelo entrenado en S3).
// - Crear una configuración de endpoint (especifica el tipo de instancia y el número de instancias para el endpoint).
// - Crear el endpoint en sí, que es la URL a la que tus aplicaciones harán solicitudes de inferencia.

// 2. Realizar una predicción usando el endpoint
// Asumamos que 'new_data' es un array numpy o una lista de características para la predicción.
// import numpy as np
// new_data = np.array([[28, 3]]) // Ejemplo de datos para predecir (edad, visitas previas)

// response = predictor.predict(new_data.tobytes()) // Enviar los datos al endpoint
// print(response.decode('utf-8')) // Decodificar la respuesta

// 3. Eliminar el endpoint cuando ya no lo necesites (para evitar costos)
// predictor.delete_endpoint()

// Para transformación por lotes (Batch Transform Job):
// transformer = xgb.transformer(
//     instance_count=1,
//     instance_type='ml.m5.xlarge',
//     output_path=f's3://{bucket}/batch_output'
// )
// transformer.transform(
//     data=f's3://{bucket}/data/test.csv',
//     content_type='csv',
//     split_type='Line'
// )
// transformer.wait() // Esperar a que el job termine
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Big Data y Machine Learning',
    'topic': 'Amazon Kinesis',
    'subtopic': 'Kinesis Data Streams',
    'definition': r'''
Pensemos por un momento en la necesidad de procesar grandes volúmenes de datos en tiempo real. Imagina que tienes una avalancha constante de información, como clics en una web, datos de sensores de IoT, o logs de aplicaciones, y necesitas capturarlos y procesarlos a medida que llegan. Amazon Kinesis Data Streams es la solución de AWS para este desafío.

¿Te estás preguntando por qué esto importa y cómo te ayuda a manejar flujos de datos continuos?

Kinesis Data Streams es un servicio que te permite capturar, almacenar y procesar flujos de datos masivos en tiempo real. Funciona como un "túnel" de datos de alta capacidad: tú envías tus datos al stream, y múltiples aplicaciones pueden leer esos datos simultáneamente y de forma independiente. Los datos se almacenan temporalmente (hasta por un año) en el stream, lo que te da flexibilidad para procesarlos de inmediato o más tarde. Esto es súper útil para construir aplicaciones de análisis en tiempo real, tableros de control en vivo, o para alimentar otros servicios de AWS con datos frescos. Kinesis Data Streams maneja automáticamente el escalado, la durabilidad y la disponibilidad de tus flujos de datos, liberándote de la complejidad de gestionar tu propia infraestructura de streaming. Es la base para cualquier arquitectura de procesamiento de datos en tiempo real en AWS.
''',
    'code_example': r'''
// Ejemplo conceptual de cómo interactuar con Kinesis Data Streams
// (Esto no es código completo, sino la lógica para productores y consumidores)

// Lado del Productor (ej. una aplicación enviando datos):
// import boto3
// import json
// import datetime

// kinesis_client = boto3.client('kinesis')

// data_record = {
//     'event_type': 'click',
//     'user_id': 'user_abc',
//     'timestamp': str(datetime.datetime.now()),
//     'page_url': '/products/item123'
// }

// # Enviar el registro al stream
// # 'PartitionKey' es importante para distribuir los datos entre los shards del stream
// response = kinesis_client.put_record(
//     StreamName='mi-kinesis-stream',
//     Data=json.dumps(data_record),
//     PartitionKey='user_abc' # Podría ser un ID de usuario, de dispositivo, etc.
// )
// # print(f"Registro enviado: {response}")

// Lado del Consumidor (ej. una función Lambda o una aplicación de Kinesis Client Library):
// # Los consumidores leen los datos del stream en 'shards'
// # Un consumidor obtendría un 'shard_iterator' para empezar a leer desde un punto
// # y luego haría llamadas GetRecords repetidamente.

// # Ejemplo conceptual de lectura (simplificado):
// # response = kinesis_client.get_records(ShardIterator='...', Limit=100)
// # for record in response['Records']:
// #    print(json.loads(record['Data'].decode('utf-8')))

// Kinesis Data Streams se encarga de la distribución y el orden de los datos dentro de cada shard.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Big Data y Machine Learning',
    'topic': 'Amazon Kinesis',
    'subtopic': 'Kinesis Data Firehose',
    'definition': r'''
Pensemos por un momento en la tarea de mover datos de un punto A a un punto B, especialmente cuando el punto B es un almacenamiento o un servicio de análisis en AWS, y queremos que esta transferencia sea lo más sencilla y automatizada posible, sin tener que escribir código de consumidor. Aquí es donde Amazon Kinesis Data Firehose se convierte en tu aliado.

¿Te estás preguntando por qué esto importa y cómo te simplifica la entrega de datos?

Mientras Kinesis Data Streams te da un control muy granular para construir tus propios consumidores, Kinesis Data Firehose es un servicio de entrega de datos gestionado que te permite cargar flujos de datos de manera fiable a destinos como Amazon S3, Amazon Redshift, Amazon OpenSearch Service, o Splunk, sin necesidad de escribir aplicaciones de consumidor. Es súper útil porque lo configuras una vez, y Firehose se encarga de todo el proceso de entrega: escalado automático para manejar los volúmenes de datos, buffering de datos (agrupando pequeños registros para optimizar el rendimiento y reducir costos), compresión, y opcionalmente, la transformación de datos con funciones Lambda antes de la entrega. Esto te libera de la complejidad de construir y mantener conectores de datos, permitiéndote concentrarte en generar los datos y analizarlos una vez que llegan a su destino final. Es ideal para casos de uso donde la latencia de unos pocos minutos es aceptable y la simplicidad de la entrega es prioritaria.
''',
    'code_example': r'''
// Ejemplo conceptual de cómo enviar datos a Kinesis Data Firehose
// (Similar a Data Streams en el lado del productor, pero el destino es Firehose)

// Lado del Productor (ej. una aplicación enviando datos a Firehose):
// import boto3
// import json
// import datetime

// firehose_client = boto3.client('firehose')

// data_record = {
//     'sensor_id': 'sensor_001',
//     'temperature': 25.5,
//     'humidity': 60,
//     'timestamp': str(datetime.datetime.now())
// }

// # Enviar el registro a un Delivery Stream de Firehose
// response = firehose_client.put_record(
//     DeliveryStreamName='mi-firehose-stream',
//     Record={'Data': json.dumps(data_record)}
// )
// # print(f"Registro enviado a Firehose: {response}")

// Configuración en AWS (no es código, sino los pasos a seguir):
// 1. Crear un Delivery Stream de Kinesis Data Firehose.
// 2. Seleccionar el origen (ej. Direct Put o Kinesis Data Stream).
// 3. Seleccionar el destino (ej. Amazon S3).
// 4. Opcionalmente, configurar transformaciones con AWS Lambda.
// 5. Configurar el tamaño del búfer y el intervalo de búfer.

// Firehose recibe los datos, los agrupa según la configuración, y los entrega al destino (ej. un archivo en S3).
// No necesitas escribir código para leer del stream y escribir a S3.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Big Data y Machine Learning',
    'topic': 'Amazon Kinesis',
    'subtopic': 'Kinesis Data Analytics',
    'definition': r'''
Pensemos por un momento en la necesidad de analizar tus datos en tiempo real mientras fluyen. Imagina que quieres detectar patrones, calcular métricas o generar alertas instantáneas a partir de un stream de datos. Amazon Kinesis Data Analytics es el servicio diseñado para hacer esto de forma sencilla y escalable.

¿Te estás preguntando por qué esto importa y cómo te permite obtener información al instante?

Kinesis Data Analytics te permite procesar y analizar datos de streaming en tiempo real utilizando SQL estándar o Apache Flink. Es súper útil porque puedes ejecutar consultas SQL continuas directamente sobre tus Kinesis Data Streams o Kinesis Data Firehose sin necesidad de aprender lenguajes de programación complejos para streaming. Por ejemplo, podrías contar el número de clics por minuto en tu sitio web, detectar anomalías en los datos de sensores, o filtrar eventos específicos para un dashboard en tiempo real. Kinesis Data Analytics se encarga de la infraestructura de procesamiento subyacente, escalando automáticamente para manejar el volumen de datos. Además, al soportar Apache Flink, ofrece una gran flexibilidad para construir aplicaciones de streaming más complejas y con estado, abriendo la puerta a análisis avanzados como la detección de sesiones o el enriquecimiento de datos en tiempo real. Es tu herramienta para transformar flujos de datos en información procesable al instante.
''',
    'code_example': r'''
// Ejemplo conceptual de una aplicación de Kinesis Data Analytics con SQL
// (Esto es una consulta SQL continua que ejecutarías en Kinesis Data Analytics)

// Supongamos que tu Kinesis Data Stream se llama 'mi_stream_clicks'
// y tiene datos JSON con campos como 'event_time' y 'user_id'.

// Ejemplo: Contar el número de clicks por minuto
// CREATE OR REPLACE STREAM "DESTINATION_SQL_STREAM" (
//     "event_minute" TIMESTAMP,
//     "click_count" INTEGER
// );

// CREATE OR REPLACE PUMP "STREAM_PUMP" AS INSERT INTO "DESTINATION_SQL_STREAM"
// SELECT STREAM STEPMINUTE(TO_TIMESTAMP(FROM_UNIXTIME("event_time"/1000))), COUNT(*)
// FROM "mi_stream_clicks"
// GROUP BY STEPMINUTE(TO_TIMESTAMP(FROM_UNIXTIME("event_time"/1000)));

// Otra consulta SQL: Filtrar eventos de error y enviarlos a otro stream
// CREATE OR REPLACE STREAM "ERROR_STREAM" (
//     "event_id" VARCHAR(20),
//     "error_message" VARCHAR(256),
//     "timestamp" TIMESTAMP
// );

// CREATE OR REPLACE PUMP "ERROR_PUMP" AS INSERT INTO "ERROR_STREAM"
// SELECT STREAM
//     "event_id",
//     "message" as "error_message",
//     TO_TIMESTAMP(FROM_UNIXTIME("event_time"/1000)) as "timestamp"
// FROM "mi_stream_clicks"
// WHERE "event_type" = 'error';

// Estos resultados pueden ser enviados a otro Kinesis Stream, Firehose, Lambda, etc.
// No necesitas escribir código de programación para estas transformaciones; solo SQL.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Big Data y Machine Learning',
    'topic': 'Amazon Kinesis',
    'subtopic': 'Kinesis Video Streams',
    'definition': r'''
Pensemos por un momento en la complejidad de capturar, procesar y almacenar transmisiones de video en vivo de dispositivos conectados, como cámaras de seguridad, drones o cámaras corporales. El video es un tipo de dato enorme y requiere un manejo especializado. Aquí es donde Amazon Kinesis Video Streams entra en juego.

¿Te estás preguntando por qué esto importa y cómo te ayuda a trabajar con video en tiempo real?

Kinesis Video Streams es un servicio completamente gestionado que facilita la captura, el procesamiento y el almacenamiento seguro de flujos de video para análisis, reproducción, aprendizaje automático (ML) y otras aplicaciones. Es súper útil porque se encarga de toda la infraestructura necesaria para la ingesta de video: la codificación, la indexación por tiempo, el almacenamiento duradero y el acceso en tiempo real a los flujos de video. Esto te libera de tener que construir y mantener una compleja infraestructura de video. Puedes usarlo para enviar video desde millones de dispositivos, grabar video para reproducción bajo demanda, o alimentar servicios de ML como Amazon Rekognition para análisis de video en tiempo real (por ejemplo, detección de objetos o personas). Es la pieza clave para construir aplicaciones que dependan de datos de video en vivo o grabados en la nube.
''',
    'code_example': r'''
// Ejemplo conceptual de cómo Kinesis Video Streams funciona
// (Esto no es código de cliente, sino la lógica del servicio)

// Lado del Productor (ej. una cámara de seguridad con un SDK de Kinesis Video Streams):
// El dispositivo de la cámara utiliza un SDK o GStreamer para enviar el flujo de video a Kinesis Video Streams.
// El SDK maneja la fragmentación, el buffering y la transmisión segura del video.

// srtp_client.put_media(
//     StreamName='mi-camara-seguridad',
//     Payload=video_data_chunk, // Chunk de video
//     # Otras propiedades como ContentType, StartSelector, etc.
// )

// Kinesis Video Streams en el lado de AWS:
// - Recibe los fragmentos de video.
// - Indexa el video por tiempo (timestamp).
// - Almacena el video de forma duradera y escalable.
// - Proporciona APIs para acceder al video en vivo o grabado.

// Lado del Consumidor/Aplicación (ej. una aplicación de monitoreo, o un trabajo de ML):
// Una aplicación puede usar la API GetMedia para recuperar el flujo de video en tiempo real.
// import boto3

// kvs_client = boto3.client('kinesisvideo')
// endpoint = kvs_client.get_data_endpoint(
//     StreamName='mi-camara-seguridad',
//     APIName='GET_MEDIA'
// )['DataEndpoint']

// kvs_media_client = boto3.client('kinesis-video-media', endpoint_url=endpoint)

// # Ejemplo conceptual de cómo se leería el video
// # response = kvs_media_client.get_media(
// #     StreamName='mi-camara-seguridad',
// # #    StartSelector={'StartSelectorType': 'NOW'} # Para empezar a leer desde ahora
// # )

// # for chunk in response['Payload']:
// #    # Procesar el chunk de video (ej. enviar a un modelo de ML para análisis de objetos)
// #    pass

// Esto permite que tu aplicación o servicio de ML acceda al video sin tener que gestionar la infraestructura subyacente.
'''
  });
}
