import 'package:sqflite_common/sqlite_api.dart';

Future<void> insertJrLevel1AwsData(Database db) async {
  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Fundamentos de AWS',
    'topic': 'Introducción a Cloud Computing',
    'subtopic': '¿Qué es Cloud Computing?',
    'definition': '''
El Cloud Computing, o computación en la nube, es como tener un montón de computadoras, servidores y bases de datos gigantes a tu disposición a través de internet, en lugar de tenerlos físicamente en tu casa u oficina. Pagas solo por lo que usas, como si fuera un servicio de luz o agua.

Seguramente te preguntarás por qué esto es tan útil o por qué deberías considerarlo... 

Pensemos por un momento en una empresa pequeña que necesita una infraestructura robusta para su sitio web. Si tuvieran que comprar todos los servidores, almacenar información, asegurar la red, sería una inversión enorme y un quebradero de cabeza en mantenimiento.

Aquí te va la aclaración: el Cloud Computing elimina esa necesidad. En vez de comprar y mantener tu propio hardware y software, accedes a ellos como un servicio. AWS (Amazon Web Services), por ejemplo, te permite alquilar estos recursos, escalarlos hacia arriba o hacia abajo según tus necesidades, y olvidarte de la parte tediosa del mantenimiento físico. Esto significa que puedes lanzar una aplicación global en minutos, sin preocuparte por la compra de servidores en diferentes continentes o la configuración de redes complejas. Es una forma increíblemente flexible y eficiente de manejar la tecnología hoy en día.
''',
    'code_example': r'''
// Esto no es un código programático, sino una representación conceptual de cómo podrías "usar" la nube.

// Ejemplo conceptual de cómo una empresa "alquila" servicios en la nube
// En lugar de comprar un servidor físico para una base de datos:
// Servidor Físico: Costo inicial alto, mantenimiento constante, espacio físico, consumo energético.
// new ServidorFisico("baseDeDatosApp", "Intel Xeon", "256GB RAM", "10TB SSD");

// Con Cloud Computing (ej. AWS RDS para bases de datos):
// Solo "solicitas" una instancia de base de datos, AWS se encarga del hardware, mantenimiento, etc.
// await aws.requestService("RDS", {
//   databaseType: "PostgreSQL",
//   instanceSize: "db.t3.medium",
//   storage: "500GB",
//   region: "us-east-1"
// });

// La ventaja clave es la escalabilidad y el pago por uso.
// Si tu aplicación tiene más usuarios, simplemente "solicitas" más recursos.
// await aws.scaleService("RDS", { newInstanceSize: "db.r5.large" });

// Ejemplo incorrecto (conceptual) - Intentar manejar todo manualmente cuando la nube ofrece automatización
// new ServidorFisico("servidorWeb", "Intel i7", "32GB RAM", "1TB SSD");
// instalarSistemaOperativo();
// instalarServidorWeb();
// configurarFirewallManualmente();
// monitorearHardware24_7(); // ¡Esto es agotador y propenso a errores!
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Fundamentos de AWS',
    'topic': 'Introducción a Cloud Computing',
    'subtopic': 'Modelos de servicio (IaaS, PaaS, SaaS)',
    'definition': '''
Cuando hablamos de Cloud Computing, no todo es igual. Existen diferentes "sabores" o modelos de servicio que te permiten elegir cuánto quieres gestionar tú y cuánto dejas en manos del proveedor de la nube.

Seguramente pensarás de qué va todo esto y por qué importan estas distinciones... 

Simplificar la gestión y reducir la carga operativa es clave, y estos modelos son precisamente para eso.

Vamos a ver de qué se trata todo esto:

* **IaaS (Infrastructure as a Service)**: Imagina que alquilas el terreno, los cimientos y las paredes de una casa (servidores, redes, almacenamiento), pero tú eres el encargado de amueblarla y decorarla por completo (sistemas operativos, aplicaciones, bases de datos). Tienes mucho control, pero también más responsabilidad. Un ejemplo claro es Amazon EC2, donde alquilas máquinas virtuales y decides qué instalar en ellas.

* **PaaS (Platform as a Service)**: Aquí ya alquilas una casa semi-amueblada. El proveedor de la nube te da un entorno completo para desarrollar, ejecutar y gestionar aplicaciones, sin que te preocupes por la infraestructura subyacente. Piensa en servicios como AWS Elastic Beanstalk. Tú solo subes tu código, y AWS se encarga de la infraestructura, el servidor web, las bases de datos, etc. Es perfecto si quieres enfocarte solo en escribir código.

* **SaaS (Software as a Service)**: Este es el modelo más conocido y el que probablemente ya usas a diario. Es como alquilar una casa completamente amueblada y lista para vivir. Accedes directamente a una aplicación a través de internet, sin preocuparte por la infraestructura o el desarrollo. Ejemplos populares son Gmail, Dropbox o Salesforce. Simplemente lo usas y disfrutas de sus funcionalidades.

La elección del modelo depende de tus necesidades: si quieres control total, IaaS; si quieres enfocarte en el desarrollo, PaaS; y si solo necesitas usar una aplicación, SaaS.
''',
    'code_example': r'''
// Estos son ejemplos conceptuales para ilustrar los modelos de servicio.
// No son bloques de código ejecutables en el sentido tradicional.

// IaaS (Infrastructure as a Service) - Ej: Amazon EC2
// Aquí "alquilas" una máquina virtual. Tú controlas el OS, el software, etc.
/*
  "crear_instancia_ec2": {
    "tipo": "t2.micro",
    "sistema_operativo": "Ubuntu Server 20.04 LTS",
    "almacenamiento": "30GB EBS",
    "seguridad": "Grupo de seguridad con puerto 80 y 22 abiertos"
  }
*/

// PaaS (Platform as a Service) - Ej: AWS Elastic Beanstalk
// Tú subes tu aplicación y la plataforma se encarga de todo lo demás.
/*
  "desplegar_aplicacion_beanstalk": {
    "nombre_aplicacion": "mi-app-web",
    "entorno": "Node.js 18",
    "codigo_fuente": "mi-app-web.zip"
  }
*/

// SaaS (Software as a Service) - Ej: Google Workspace (Gmail, Drive) o Salesforce
// Simplemente usas el software a través de un navegador web.
/*
  "usar_servicio_saas": {
    "nombre_servicio": "Gmail",
    "acceso": "via_navegador_web",
    "gestion_infraestructura": "gestionado_por_proveedor"
  }
*/

// La idea principal es que cada modelo te quita una capa de responsabilidad.
// Con IaaS, manejas casi todo. Con PaaS, te enfocas en el código.
// Con SaaS, solo usas el producto final.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Fundamentos de AWS',
    'topic': 'Introducción a Cloud Computing',
    'subtopic': 'Modelos de despliegue (Público, Privado, Híbrido)',
    'definition': '''
Así como hay diferentes modelos de servicio, también existen diversas formas de "desplegar" tu infraestructura en la nube. Esto se refiere a dónde y cómo se aloja y se gestiona tu infraestructura de Cloud Computing.

¿Te estás preguntando por qué esto importa? 

Porque cada modelo tiene sus propias ventajas en términos de seguridad, control y costos, y la elección adecuada puede marcar una gran diferencia para tu proyecto o empresa.

Aquí te va la aclaración:

* **Nube Pública**: Es el modelo más común. Los servicios y la infraestructura son propiedad de un proveedor de la nube (como AWS, Google Cloud o Azure) y se ofrecen al público en general a través de internet. Compartes el hardware subyacente con otros usuarios (aunque tus datos y aplicaciones están aislados). Es altamente escalable y costo-efectivo, ya que solo pagas por lo que consumes. Piénsalo como un gran edificio de apartamentos donde cada inquilino tiene su propio espacio, pero comparten la infraestructura del edificio.

* **Nube Privada**: Aquí, la infraestructura de la nube es operada exclusivamente para una sola organización. Puede estar ubicada físicamente en el centro de datos de la empresa o gestionada por un tercero. Ofrece un mayor control y seguridad, lo que es ideal para organizaciones con requisitos regulatorios estrictos o datos muy sensibles. Sería como tener tu propia mansión con todos los servicios solo para ti. Sin embargo, requiere una mayor inversión inicial y un equipo dedicado para su gestión.

* **Nube Híbrida**: Este modelo combina lo mejor de ambos mundos: una mezcla de nube pública y privada. Permite que los datos y las aplicaciones se muevan entre ellas. Por ejemplo, podrías usar la nube privada para datos sensibles y aplicaciones críticas, mientras que la nube pública se utiliza para tareas menos sensibles o para manejar picos de demanda. Esto te da la flexibilidad de escalar y a la vez mantener un alto nivel de seguridad. Un ejemplo podría ser una empresa que mantiene sus datos de clientes en un centro de datos privado, pero usa la nube pública para su sitio web de comercio electrónico que experimenta fluctuaciones de tráfico.

Comprender estos modelos te ayuda a tomar decisiones informadas sobre dónde y cómo alojar tus recursos tecnológicos.
''',
    'code_example': r'''
// Estos son ejemplos conceptuales para ilustrar los modelos de despliegue.
// No son bloques de código ejecutable.

// Nube Pública - Ej: Desplegar un sitio web en AWS (EC2, S3)
/*
  "despliegue_sitio_web_publico": {
    "proveedor": "AWS",
    "recursos": ["Amazon EC2", "Amazon S3", "Amazon RDS"],
    "acceso": "internet",
    "modelo_pago": "pago_por_uso"
  }
*/

// Nube Privada - Ej: Una empresa con su propio centro de datos interno
/*
  "despliegue_aplicacion_privada": {
    "ubicacion": "centro_de_datos_empresa",
    "gestion": "equipo_IT_interno",
    "uso_exclusivo": true,
    "seguridad": "altamente_controlada"
  }
*/

// Nube Híbrida - Ej: Usar la nube privada para datos sensibles y la pública para web
/*
  "estrategia_nube_hibrida": {
    "aplicacion_critica_datos_sensibles": {
      "despliegue": "nube_privada",
      "base_de_datos": "Oracle_DB_on_premise"
    },
    "sitio_web_marketing_escalable": {
      "despliegue": "nube_publica",
      "servicios_aws": ["Amazon EC2 Auto Scaling", "Elastic Load Balancing"],
      "conexion_privada": "AWS_Direct_Connect_o_VPN" // Conexión segura entre nubes
    }
  }
*/

// La elección de un modelo de despliegue depende de factores como la seguridad, el cumplimiento
// normativo, el costo y la escalabilidad requerida.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Fundamentos de AWS',
    'topic': 'Introducción a Cloud Computing',
    'subtopic': 'Ventajas de AWS',
    'definition': '''
Cuando hablamos de Cloud Computing, AWS (Amazon Web Services) es uno de los pesos pesados. Pero, ¿por qué es tan popular y qué ventajas te ofrece? No es solo una moda; hay razones de peso detrás de su adopción masiva.

No sé tú, pero a mí esto al principio me costó entender la magnitud de lo que ofrecía AWS... 

No es solo un lugar donde guardar archivos, es un ecosistema completo para construir casi cualquier cosa.

Aquí te va la aclaración:

* **Flexibilidad y Escalabilidad**: Imagina que de repente tu aplicación se vuelve viral. Con AWS, puedes escalar tus recursos (servidores, bases de datos, etc.) en cuestión de minutos, adaptándote a la demanda sin interrupciones. Cuando el tráfico baja, los reduces para ahorrar costos. Esta elasticidad es una de sus mayores fortalezas.

* **Pago por Uso (Pay-as-you-go)**: En lugar de invertir grandes sumas de dinero en hardware que quizás no uses al máximo, en AWS solo pagas por los recursos que consumes. Esto transforma los gastos de capital en gastos operativos, lo que es genial para startups y empresas que buscan optimizar su flujo de caja. Es como pagar la luz o el agua, solo lo que usas.

* **Amplia Oferta de Servicios**: AWS tiene una cantidad impresionante de servicios, desde cómputo (EC2, Lambda) y almacenamiento (S3, EBS) hasta bases de datos (RDS, DynamoDB), inteligencia artificial, machine learning y mucho más. Esto te permite construir soluciones muy complejas y personalizadas sin tener que recurrir a múltiples proveedores.

* **Alcance Global**: AWS tiene infraestructura en todo el mundo, dividida en Regiones y Zonas de Disponibilidad. Esto te permite desplegar tus aplicaciones cerca de tus usuarios finales para reducir la latencia, y también te da la posibilidad de construir arquitecturas altamente disponibles y resistentes a desastres.

* **Seguridad Robusta**: AWS se toma la seguridad muy en serio. Ofrecen una infraestructura altamente segura y una gran cantidad de servicios para proteger tus datos y aplicaciones, como AWS IAM para la gestión de identidades y accesos, y AWS Shield para protección DDoS.

* **Innovación Constante**: Amazon está constantemente lanzando nuevos servicios y mejorando los existentes, lo que significa que siempre tienes acceso a las últimas tecnologías y herramientas sin tener que hacer grandes inversiones en investigación y desarrollo por tu cuenta.

En resumen, AWS te da la potencia, la flexibilidad y la seguridad para innovar y crecer sin las limitaciones de la infraestructura tradicional.
''',
    'code_example': r'''
// Estos son conceptos y no bloques de código ejecutables directamente,
// pero ilustran las ventajas de AWS.

// Ventaja 1: Flexibilidad y Escalabilidad (conceptual)
// Aumentar la capacidad de servidores en respuesta a un pico de tráfico:
/*
  "escalar_servidores": {
    "desde_instancias": "2",
    "a_instancias": "10",
    "tiempo_estimado": "5 minutos"
  }
*/
// Reducir la capacidad cuando el tráfico baja:
/*
  "reducir_servidores": {
    "desde_instancias": "10",
    "a_instancias": "2",
    "tiempo_estimado": "5 minutos",
    "ahorro_costos": "inmediato"
  }
*/

// Ventaja 2: Pago por Uso (conceptual)
// No hay costo inicial por hardware.
/*
  "modelo_financiero_aws": {
    "inversion_inicial_hardware": "0$",
    "costo_mensual": "variable_segun_uso"
  }
*/

// Ventaja 3: Amplia Oferta de Servicios (conceptual)
// Capacidad de combinar diversos servicios para una solución completa.
/*
  "arquitectura_ejemplo": {
    "web_hosting": "Amazon S3",
    "logica_backend": "AWS Lambda",
    "base_de_datos": "Amazon DynamoDB",
    "cdn": "Amazon CloudFront"
  }
*/

// Ventaja 4: Alcance Global (conceptual)
// Desplegar aplicaciones en diferentes geografías para baja latencia.
/*
  "despliegue_global": {
    "region_europa": "eu-west-1",
    "region_asia": "ap-southeast-2",
    "region_america": "us-east-1"
  }
*/

// Ventaja 5: Seguridad Robusta (conceptual)
// Servicios de seguridad incorporados.
/*
  "seguridad_en_aws": {
    "gestion_identidades": "AWS IAM",
    "proteccion_ddos": "AWS Shield",
    "encriptacion_datos": "AWS KMS"
  }
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Fundamentos de AWS',
    'topic': 'Cuenta y Facturación AWS',
    'subtopic': 'Creación de cuenta AWS',
    'definition': '''
El primer paso para sumergirte en el mundo de AWS es, obviamente, crear una cuenta. Es como abrir una cuenta en un banco, pero en lugar de dinero, gestionas recursos de computación.

Seguramente te preguntarás por qué esto es un "subtopic" aparte y no algo trivial. La verdad es que, aunque el proceso es guiado, hay algunas cosas importantes que debes tener en cuenta para evitar sorpresas más adelante.

Vamos a ver de qué se trata todo esto:

Crear una cuenta de AWS es bastante sencillo y te guiarán paso a paso. Necesitarás una dirección de correo electrónico, una contraseña segura y los datos de una tarjeta de crédito o débito. ¡No te asustes por la tarjeta! AWS tiene una capa gratuita (el famoso Free Tier) que te permite usar muchos servicios sin costo durante un tiempo. Pero la tarjeta es necesaria para verificar tu identidad y para los cargos que puedan generarse si superas los límites del Free Tier o usas servicios de pago.

Durante el proceso, también se te pedirá un número de teléfono para verificación. Una vez creada la cuenta, es fundamental que configures la autenticación multifactor (MFA) para una mayor seguridad. Esto es como tener una doble cerradura en tu casa: además de la contraseña, necesitas un código de tu teléfono o un dispositivo de seguridad. Es una práctica recomendada para proteger tu cuenta de accesos no autorizados. También es una buena idea configurar alarmas de facturación para no llevarte sorpresas.
''',
    'code_example': r'''
// La creación de una cuenta AWS no implica código programático directamente,
// sino más bien un proceso guiado a través de la interfaz de usuario.
// Este "código" representa los pasos conceptuales.

// Paso 1: Ir al sitio web de AWS
// Abre tu navegador y navega a: https://aws.amazon.com/es/
/*
  navegador.abrir_url("https://aws.amazon.com/es/");
*/

// Paso 2: Hacer clic en "Crear una cuenta de AWS"
/*
  interfaz_usuario.clic_en_boton("Crear una cuenta de AWS");
*/

// Paso 3: Proporcionar la información requerida
/*
  formulario_registro.completar({
    "email": "tu_email@ejemplo.com",
    "contrasena": "TuContrasenaSegura123!",
    "confirmar_contrasena": "TuContrasenaSegura123!",
    "nombre_cuenta_aws": "MiCuentaPersonalAWS",
    "tipo_cuenta": "Personal" // o "Profesional"
  });
*/

// Paso 4: Información de pago (tarjeta de crédito/débito)
// ¡Importante!: La tarjeta es para verificación y para cargos si superas el Free Tier.
/*
  formulario_pago.ingresar_datos_tarjeta({
    "numero_tarjeta": "xxxx-xxxx-xxxx-xxxx",
    "fecha_vencimiento": "MM/AA",
    "codigo_seguridad": "XXX"
  });
*/

// Paso 5: Verificación de identidad (teléfono)
/*
  verificacion.enviar_sms_a_telefono("555-123-4567");
  verificacion.ingresar_codigo_sms("123456");
*/

// Paso 6: Seleccionar un plan de soporte (generalmente "Básico Gratuito" al inicio)
/*
  seleccion_plan.elegir("Básico Gratuito");
*/

// Paso 7: Completar el registro
/*
  interfaz_usuario.clic_en_boton("Completar registro");
*/

// Después de la creación: Configurar MFA (Multi-Factor Authentication) para seguridad adicional
// Esto no es parte del proceso de registro, pero es CRÍTICO para la seguridad.
/*
  aws_consola.navegar_a("IAM > Usuarios > TuUsuario > Credenciales de seguridad");
  aws_consola.configurar_mfa("Autenticador virtual");
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Fundamentos de AWS',
    'topic': 'Cuenta y Facturación AWS',
    'subtopic': 'Estructura de costos en AWS',
    'definition': '''
Entender cómo te cobra AWS es fundamental para evitar sorpresas en tu factura. A diferencia de comprar un servidor físico donde el costo es fijo, en la nube es mucho más dinámico y, si no lo manejas bien, puede volverse complejo.

Esto tiene una explicación, y es porque AWS se basa en un modelo de pago por uso muy granular. 

Imagina que en lugar de pagar una tarifa plana por la electricidad en tu casa, pagas exactamente por cada kilovatio-hora que consumes, y además por el tipo de bombilla, la potencia de tu nevera, y hasta por el tiempo que dejas la luz encendida. Así funciona AWS, pero con recursos de computación, almacenamiento, redes y bases de datos.

Aquí te va la aclaración:

La estructura de costos de AWS se basa en varios principios clave:

* **Pago por uso**: Es el más importante. Solo pagas por los recursos que realmente utilizas. Si apagas un servidor, dejas de pagar por él. Si tu base de datos solo se usa por la noche, solo pagas por esas horas. Esto reduce el desperdicio y te permite optimizar costos.
* **Sin costos iniciales ni compromisos a largo plazo**: No hay que comprar hardware upfront ni firmar contratos por años (a menos que quieras optar por descuentos). Puedes empezar a usar un servicio inmediatamente y cancelar en cualquier momento.
* **Escalabilidad elástica**: Como pagas por lo que usas, puedes escalar tus recursos hacia arriba o hacia abajo según la demanda. Esto es más eficiente que comprar hardware para el pico más alto de uso, que luego estaría infrautilizado.
* **Precios por volumen**: A medida que consumes más de un servicio, el precio por unidad suele disminuir. Por ejemplo, el almacenamiento en S3 se vuelve más barato por GB si almacenas terabytes.
* **Regiones y precios diferenciados**: Los precios pueden variar ligeramente entre las diferentes Regiones de AWS debido a factores como el costo de la energía, los impuestos locales o la infraestructura. Siempre es bueno revisar la página de precios específica de la región que te interese.

Cada servicio de AWS tiene su propia lógica de precios. Por ejemplo, en Amazon EC2 pagas por hora (o segundo) de uso de la instancia y por el tipo de instancia. En Amazon S3, pagas por el almacenamiento, por las solicitudes de datos y por la transferencia de datos. Entender estos detalles para los servicios que vas a usar es crucial para gestionar tu factura.
''',
    'code_example': r'''
// La estructura de costos en AWS no se representa con código programático,
// sino con la forma en que se te factura por el uso de los servicios.
// Estos son ejemplos conceptuales de cómo se calculan los costos.

// Principio 1: Pago por Uso (conceptual)
// Instancia EC2 (servidor virtual) encendida por 500 horas en un mes.
/*
  costo_ec2 = tipo_instancia.costo_por_hora * horas_encendida;
  // Ejemplo: t2.micro a 0.0116 USD/hora * 500 horas = 5.80 USD
*/

// Almacenamiento S3 (conceptual)
// Pago por GB almacenado al mes + costo por solicitudes (GET/PUT).
/*
  costo_s3 = (gb_almacenados * costo_por_gb) + (solicitudes_get * costo_por_get) + (solicitudes_put * costo_por_put);
  // Ejemplo: 100 GB almacenados a 0.023 USD/GB + 1000 GETs a 0.0004 USD/1000 + 100 PUTs a 0.005 USD/1000
*/

// Principio 2: Sin Costos Iniciales (conceptual)
// No hay un "costo_hardware_inicial" o "tarifa_activacion" al usar servicios.
/*
  inversion_inicial = 0;
  costo_operativo_mensual = suma_de_costos_servicios_usados;
*/

// Principio 3: Escalabilidad Elástica y Costos (conceptual)
// Si la demanda sube, pagas más, pero solo por el tiempo que necesitas los recursos extra.
/*
  // Días normales
  costo_diario_bajo_trafico = ec2.costo_t2_micro * 24;
  // Días de pico (ej. Black Friday)
  costo_diario_alto_trafico = ec2.costo_t2_large * 24; // Usas una instancia más grande temporalmente
  // Al volver a la normalidad, el costo se reduce automáticamente si configuras Auto Scaling.
*/

// Principio 4: Precios por Volumen (conceptual)
// Ejemplo de S3: el precio por GB disminuye a medida que almacenas más.
/*
  // Primeros 50 TB/mes: 0.023 USD por GB
  // Siguientes 450 TB/mes: 0.022 USD por GB
  // Más de 500 TB/mes: 0.021 USD por GB
*/

// Para obtener los costos exactos, siempre consulta la página de precios de AWS:
// https://aws.amazon.com/es/pricing/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Fundamentos de AWS',
    'topic': 'Cuenta y Facturación AWS',
    'subtopic': 'AWS Free Tier',
    'definition': '''
El AWS Free Tier es una de las mejores características para quienes están empezando con la nube. Es básicamente una capa gratuita que te permite explorar y experimentar con muchos servicios de AWS sin incurrir en costos. Piénsalo como una prueba gratuita extendida.

¿Te estás preguntando por qué esto importa? 

Porque el Free Tier te quita el miedo a experimentar. Puedes lanzar un servidor virtual, crear una base de datos pequeña o almacenar archivos sin preocuparte de que te llegue una factura inesperada al final del mes, siempre y cuando te mantengas dentro de los límites establecidos.

Aquí te va la aclaración:

El AWS Free Tier está diseñado para darte manos a la obra con la plataforma de AWS sin costo. Se divide en tres tipos de ofertas:

* **Gratis por 12 meses**: Esto incluye una serie de servicios con límites específicos que puedes usar de forma gratuita durante los primeros 12 meses desde la fecha de creación de tu cuenta de AWS. Por ejemplo, te dan 750 horas al mes de instancias EC2 (suficiente para una instancia t2.micro funcionando 24/7), 5 GB de almacenamiento estándar en S3, o 750 horas de Amazon RDS.
* **Siempre gratis**: Algunos servicios tienen una oferta que nunca expira y está disponible para todos los clientes de AWS. Esto es ideal para aplicaciones de bajo tráfico o para aprender. Por ejemplo, 1 millón de solicitudes de AWS Lambda al mes o 25 GB de almacenamiento en DynamoDB.
* **Pruebas gratuitas a corto plazo**: Son ofertas de prueba para servicios específicos que comienzan cuando activas el servicio por primera vez. Por ejemplo, un número determinado de consultas gratuitas en Amazon Redshift por un período de tiempo.

Es crucial entender los límites de cada servicio dentro del Free Tier. Si los excedes, se te cobrará por el uso adicional a las tarifas estándar. AWS te enviará alertas de facturación si los configuras, lo cual es altamente recomendado. El Free Tier es una herramienta poderosa para aprender, prototipar y desplegar aplicaciones pequeñas de bajo costo.
''',
    'code_example': r'''
// El AWS Free Tier no se representa con código programático,
// sino con los límites de uso gratuitos que AWS ofrece en sus servicios.
// Estos son ejemplos conceptuales de los límites del Free Tier.

// Tipo 1: Gratis por 12 meses (ejemplos comunes)
/*
  "limites_free_tier_12_meses": {
    "Amazon_EC2": "750 horas/mes de instancia t2.micro (o t3.micro)",
    "Amazon_S3": "5 GB de almacenamiento estándar",
    "Amazon_RDS": "750 horas/mes de instancia db.t2.micro (o db.t3.micro)"
  }
*/
// Significa que si usas una instancia t2.micro durante todo un mes (aprox. 730 horas),
// estarás dentro del límite. Si usas dos, excederías las 750 horas.

// Tipo 2: Siempre gratis (ejemplos comunes)
/*
  "limites_free_tier_siempre_gratis": {
    "AWS_Lambda": "1 millón de solicitudes/mes y 400.000 GB-seg de cómputo",
    "Amazon_DynamoDB": "25 GB de almacenamiento, 25 unidades de capacidad de lectura y escritura"
  }
*/
// Esto es ideal para funciones serverless o bases de datos NoSQL de bajo uso que siempre serán gratuitas.

// Tipo 3: Pruebas gratuitas a corto plazo (ejemplo)
/*
  "limites_free_tier_prueba": {
    "Amazon_Redshift": "2 meses de prueba gratuita para un clúster dc2.large"
  }
*/

// MUY IMPORTANTE: Monitorea tu uso para no exceder los límites del Free Tier.
// Puedes configurar alertas de facturación en la consola de AWS.
/*
  // Esto es un recordatorio conceptual de lo que debes hacer.
  configurar_alerta_facturacion("si_uso_supera_X_dolares_o_X_limite_free_tier", "enviar_email_a_mi@ejemplo.com");
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Fundamentos de AWS',
    'topic': 'Cuenta y Facturación AWS',
    'subtopic': 'Herramientas de monitoreo de costos (Cost Explorer, Budgets)',
    'definition': r'''
Como ya hablamos, la estructura de costos de AWS puede ser muy granular, y si no la controlas, tu factura podría dispararse. Por eso, AWS te ofrece herramientas súper útiles para que puedas ver y gestionar tus gastos.

Seguramente te estarás preguntando, "¿y cómo evito la sorpresa de una factura gigante?". 

Afortunadamente, AWS no solo te da la cuerda para colgarte, sino también el mapa para no perderte.

Aquí te va la aclaración:

* **AWS Cost Explorer**: Esta es tu herramienta visual para entender tus gastos. Piensa en ella como un panel de control muy detallado donde puedes ver qué servicios estás usando, cuánto te están costando y cómo evolucionan tus gastos a lo largo del tiempo. Puedes filtrar por servicio, por región, por etiquetas, e incluso ver previsiones de gastos. Te permite identificar rápidamente qué parte de tu infraestructura está consumiendo más recursos y, por lo tanto, más dinero. Puedes ver gráficos bonitos que te muestran si tus gastos aumentaron o disminuyeron por día o por mes.

* **AWS Budgets**: Si Cost Explorer es para analizar lo que ya pasó, Budgets es para planificar el futuro. Con AWS Budgets, puedes establecer límites de gasto para tu cuenta o para servicios específicos. Por ejemplo, puedes decir: "No quiero gastar más de $500 al mes en EC2" o "Si mi gasto total supera los $1000, avísame". Lo mejor es que puedes configurar alertas que te notifican por correo electrónico o SMS cuando te acercas a tu presupuesto, o incluso cuando lo superas. Esto te da un control proactivo para mantener tus gastos bajo control y evitar sorpresas desagradables al final del mes.

Usar ambas herramientas de manera conjunta es la estrategia ganadora. Primero, usa Cost Explorer para entender tu patrón de gastos actual. Luego, con esa información, crea Budgets para establecer límites y recibir alertas, asegurándote de que no te desvíes de tu plan financiero.
''',
    'code_example': r'''
// Las herramientas de monitoreo de costos (Cost Explorer, Budgets)
// se usan principalmente a través de la consola de administración de AWS,
// no con código programático directo para su configuración.
// Sin embargo, se pueden conceptualizar sus funcionalidades.

// Funcionalidad 1: AWS Cost Explorer (Conceptual)
// Ver un informe de gastos históricos y proyecciones.
/*
  aws_consola.navegar_a("Facturación > Cost Explorer");
  cost_explorer.generar_informe({
    "periodo": "Últimos 3 meses",
    "agrupamiento_por": "Servicio",
    "filtrar_por": {"Region": "us-east-1"}
  });
  // El resultado sería un gráfico y una tabla mostrando costos por servicio.
*/

// Funcionalidad 2: AWS Budgets (Conceptual)
// Crear una alarma si los costos exceden un umbral.
/*
  aws_consola.navegar_a("Facturación > Presupuestos");
  budgets.crear_presupuesto({
    "nombre_presupuesto": "Presupuesto Mensual General",
    "tipo_presupuesto": "Costo",
    "periodo": "Mensual",
    "umbral_monto": "1000 USD",
    "alertas": [
      {
        "umbral_porcentaje": 80, // Alerta al 80% del presupuesto
        "contactos": ["tu_email@ejemplo.com"]
      },
      {
        "umbral_porcentaje": 100, // Alerta al 100% del presupuesto
        "contactos": ["tu_email@ejemplo.com", "gerente@ejemplo.com"]
      }
    ]
  });
*/

// Ejemplo de cómo AWS podría notificar si el presupuesto se excede (conceptual)
/*
  // Simulación de un evento de sobrepresupuesto
  if (costo_actual_mes > presupuesto_mensual * 0.80) {
    notificacion_sistema.enviar_alerta("¡Atención! Has alcanzado el 80% de tu presupuesto de AWS.");
  }
  if (costo_actual_mes > presupuesto_mensual) {
    notificacion_sistema.enviar_alerta_critica("¡ALERTA! Has superado tu presupuesto de AWS este mes.");
  }
*/

// Estas herramientas son clave para una buena gestión financiera en la nube.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Fundamentos de AWS',
    'topic': 'AWS Global Infrastructure',
    'subtopic': 'Regiones y Availability Zones',
    'definition': '''
Cuando hablamos de AWS, no estamos hablando de un solo centro de datos en algún lugar perdido. AWS tiene una infraestructura global enorme, y entender cómo está organizada es clave para diseñar aplicaciones robustas y de alto rendimiento.

Seguramente te preguntarás por qué esto es tan importante y por qué AWS se ha tomado la molestia de construir esta red tan compleja. Pensemos por un momento en la resistencia a fallos y la latencia. Si todo estuviera en un solo lugar, un desastre natural o un corte de energía masivo podría dejar a millones de usuarios sin servicio.

Aquí te va la aclaración:

* **Regiones**: Una Región de AWS es un área geográfica independiente donde Amazon ha agrupado centros de datos. Actualmente hay docenas de Regiones alrededor del mundo (América del Norte, Europa, Asia, etc.). Cada Región es una entidad completamente aislada, lo que significa que un problema en una Región no debería afectar a otra. Esto es vital para la soberanía de datos (donde los datos deben residir en un país específico) y para reducir la latencia al acercar tus aplicaciones a tus usuarios finales. Por ejemplo, si tus usuarios están en Europa, querrás desplegar tus servicios en una Región europea para que la comunicación sea más rápida.

* **Zonas de Disponibilidad (Availability Zones - AZs)**: Dentro de cada Región de AWS, existen múltiples Zonas de Disponibilidad. Una AZ es uno o más centros de datos discretos con energía, redes y conectividad redundantes. Están lo suficientemente separadas geográficamente como para estar aisladas de fallos que puedan afectar a otras AZs dentro de la misma Región, pero lo suficientemente cerca como para tener una latencia de red baja. Es como tener varios edificios súper seguros, cada uno con su propia infraestructura, pero conectados por autopistas de alta velocidad. Desplegar tus aplicaciones a través de múltiples AZs dentro de una Región es la forma más efectiva de lograr alta disponibilidad y tolerancia a fallos. Si una AZ tiene un problema, tu aplicación sigue funcionando en las otras.

En resumen, las Regiones te permiten elegir la ubicación geográfica de tus datos y aplicaciones, mientras que las Zonas de Disponibilidad dentro de esas Regiones te aseguran que tu servicio esté siempre disponible, incluso si un centro de datos entero falla. Es un diseño genial para la fiabilidad.
''',
    'code_example': r'''
// Estos son conceptos de infraestructura y no código programático directo,
// pero ilustran cómo la elección de Regiones y AZs afecta el despliegue.

// Elección de Región para la aplicación principal (conceptual)
// Basado en la ubicación de la mayoría de tus usuarios.
/*
  aplicacion_web.desplegar_en_region("us-east-1"); // Por ejemplo, para usuarios en Norteamérica
  aplicacion_web.desplegar_en_region("eu-west-1"); // Para usuarios en Europa
*/

// Desplegar recursos en múltiples Zonas de Disponibilidad para alta disponibilidad (conceptual)
// Si la AZ 'a' falla, la aplicación sigue funcionando en la AZ 'b'.
/*
  servidor_web_1.desplegar_en_az("us-east-1a");
  servidor_web_2.desplegar_en_az("us-east-1b");
  base_de_datos.replicar_en_az("us-east-1a", "us-east-1b"); // Replicación Multi-AZ
*/

// Ejemplo conceptual de cómo una falla en una AZ no afecta a otra en la misma Región
/*
  function simularFallaAZ(az_afectada) {
    if (az_afectada === "us-east-1a") {
      console.log("Simulando falla en us-east-1a...");
      // Los servidores en us-east-1a dejan de responder.
    }
    // Pero los recursos en us-east-1b siguen operativos.
    console.log("Aplicación sigue funcionando gracias a us-east-1b.");
  }

  // simularFallaAZ("us-east-1a"); // Si ejecutaramos esto
*/

// Este diseño global es la base de la robustez de las aplicaciones en AWS.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Fundamentos de AWS',
    'topic': 'AWS Global Infrastructure',
    'subtopic': 'Edge Locations y AWS Global Accelerator',
    'definition': '''
Además de las Regiones y Zonas de Disponibilidad, AWS tiene otra capa de infraestructura global: las Edge Locations (o ubicaciones de borde). Estas son fundamentales para mejorar la velocidad y el rendimiento de tus aplicaciones, especialmente para usuarios que están muy lejos de tus Regiones principales.

Esto tiene una explicación, y es porque la velocidad en internet es crucial. ¿A quién le gusta que una página web tarde en cargar o que un video se detenga constantemente? Las Edge Locations y AWS Global Accelerator están diseñados precisamente para combatir la latencia y ofrecer una experiencia de usuario fluida.

Aquí te va la aclaración:

* **Edge Locations (Ubicaciones de Borde)**: Piensa en las Edge Locations como pequeños centros de datos de AWS que están distribuidos por todo el mundo, mucho más cerca de los usuarios finales que las Regiones principales. Su propósito principal es almacenar en caché contenido (como imágenes, videos, archivos estáticos de tu sitio web) y servirlo rápidamente a los usuarios. Cuando alguien solicita tu sitio web, el contenido se entrega desde la Edge Location más cercana, reduciendo significativamente la latencia. Esto es lo que potencia servicios como Amazon CloudFront (la red de entrega de contenido o CDN de AWS) y AWS WAF (Web Application Firewall). Si un usuario en Australia quiere ver tu sitio web alojado en la Región de Virginia (EE.UU.), CloudFront enviará el contenido desde una Edge Location en Australia en lugar de tener que ir hasta EE.UU. y volver.

* **AWS Global Accelerator**: Si bien las Edge Locations son excelentes para el contenido estático, ¿qué pasa con el tráfico dinámico o las aplicaciones que necesitan conexiones de red más rápidas y consistentes? Aquí es donde entra AWS Global Accelerator. Esta herramienta mejora el rendimiento de tu aplicación dirigiendo el tráfico de tus usuarios a través de la red global de AWS de alto rendimiento. En lugar de que el tráfico de tus usuarios viaje por la internet pública (que puede ser lenta y congestionada), Global Accelerator lo enruta a través de la infraestructura optimizada de AWS hasta llegar a tus puntos finales en una Región de AWS. Esto es especialmente útil para aplicaciones que requieren baja latencia y alta disponibilidad global, como juegos multijugador o aplicaciones de comercio electrónico con clientes en todo el mundo. Te asigna direcciones IP estáticas que "siempre" apuntan a la mejor ubicación de tu aplicación, incluso si tus endpoints cambian o fallan.

En resumen, las Edge Locations y Global Accelerator trabajan juntos para asegurar que tus usuarios tengan la mejor experiencia posible, entregando contenido rápidamente y enrutando el tráfico de manera eficiente a través de la red global de AWS.
''',
    'code_example': r'''
// Estos son servicios de red a nivel de infraestructura y no se configuran con código típico de aplicación.
// Sin embargo, podemos conceptualizar su uso.

// Edge Locations y Amazon CloudFront (conceptual)
// Configuración de una distribución CloudFront para servir contenido desde Edge Locations.
/*
  cloud_front_distribution.crear({
    "origen_contenido": "s3://tu-bucket-de-imagenes-estaticas",
    "comportamiento_cache": {
      "politica_cache": "optimizado_para_imagenes",
      "ttl_minimo": "600_segundos" // Tiempo que el contenido permanece en la Edge Location
    },
    "dominios_alternativos": ["www.tu-sitio.com"]
  });

  // Cuando un usuario solicita una imagen, CloudFront la sirve desde la Edge Location más cercana.
  // Antes: usuario -> internet pública -> Región AWS -> S3 -> imagen
  // Con CloudFront: usuario -> Edge Location (si está en caché) -> imagen (mucho más rápido)
*/

// AWS Global Accelerator (conceptual)
// Dirigir el tráfico a tus endpoints de aplicación a través de la red global de AWS.
/*
  global_accelerator.crear({
    "direcciones_ip_estaticas": ["203.0.113.1", "203.0.113.2"], // IPs asignadas por Global Accelerator
    "listener_puertos": [{"puerto": 80}, {"puerto": 443}],
    "grupos_de_endpoints": [
      {
        "region": "us-east-1",
        "endpoints": ["arn:aws:elbv2:us-east-1:123456789012:loadbalancer/app/my-alb/...", "arn:aws:ec2:us-east-1:instance/i-0abcdef1234567890"]
      },
      {
        "region": "eu-west-1",
        "endpoints": ["arn:aws:elbv2:eu-west-1:123456789012:loadbalancer/app/my-alb-eu/..."]
      }
    ]
  });

  // El tráfico del usuario se enruta a través de la red de AWS al endpoint más cercano y saludable.
  // Usuario -> Edge Location (Global Accelerator) -> Red Privada de AWS -> Tu Aplicación
*/

// Estas herramientas son clave para ofrecer una experiencia rápida y confiable a nivel global.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Fundamentos de AWS',
    'topic': 'AWS Global Infrastructure',
    'subtopic': 'AWS Local Zones',
    'definition': '''
Si ya entendiste el concepto de Regiones y Zonas de Disponibilidad, las AWS Local Zones son un paso más allá para llevar la infraestructura de AWS *aún más cerca* de donde tus usuarios o tus aplicaciones lo necesitan, especialmente en áreas metropolitanas densamente pobladas.

No sé tú, pero a mí esto al principio me costó un poco entender su propósito exacto, ya que parecían similares a las Edge Locations. La clave está en el tipo de cargas de trabajo que buscan optimizar.

Aquí te va la aclaración:

Una AWS Local Zone es una extensión de una Región de AWS que está ubicada en una ciudad o área metropolitana importante, fuera de la Región principal. Su objetivo principal es permitirte desplegar aplicaciones que necesitan una latencia ultrabaja para usuarios o instalaciones locales, pero que aún requieren conectividad directa y de baja latencia a los servicios de la Región de AWS más cercana.

Piensa en esto: si tu aplicación tiene usuarios en una ciudad específica que necesitan una respuesta en tiempo real (por ejemplo, para juegos online, realidad aumentada/virtual, o aplicaciones industriales), llevar tus servicios a una Local Zone en esa ciudad reduce drásticalmente la latencia en comparación con desplegar todo en la Región principal, que podría estar a cientos o miles de kilómetros de distancia.

Las Local Zones son ideales para cargas de trabajo que son sensibles a la latencia, pero que aún se benefician de la amplia gama de servicios y la robustez de una Región de AWS. Ofrecen servicios de cómputo (como instancias EC2), almacenamiento (como EBS) y redes básicas dentro de la Local Zone, mientras que otros servicios (como bases de datos complejas o servicios de inteligencia artificial) siguen estando en la Región de origen, a la que la Local Zone tiene una conexión de muy baja latencia.

En esencia, te permiten extender tu nube de AWS a ubicaciones más periféricas para satisfacer necesidades específicas de latencia, sin tener que construir y mantener tu propio centro de datos local.
''',
    'code_example': r'''
// AWS Local Zones son extensiones de las Regiones y no se configuran directamente con código de aplicación.
// Sin embargo, puedes seleccionar una Local Zone para desplegar recursos.

// Despliegue de una instancia EC2 en una Local Zone (conceptual)
// Esto sería similar a seleccionar una AZ, pero eligiendo una Local Zone.
/*
  // Asumiendo que tu Región principal es us-east-1 (N. Virginia)
  // Y hay una Local Zone en Los Ángeles (us-west-2-lax-1a)
  instancia_web_juegos.desplegar({
    "tipo_instancia": "c5.xlarge",
    "ubicacion": "us-west-2-lax-1a", // Especificando la Local Zone
    "ami_id": "ami-0abcdef1234567890",
    "grupo_seguridad": "sg-1234567890abcdef0"
  });

  // Los usuarios en Los Ángeles experimentarán menor latencia al acceder a esta instancia.
  // Mientras que otros servicios (ej. base de datos) pueden residir en la Región principal (us-west-2).
  base_de_datos_rds.desplegar({
    "tipo_motor": "PostgreSQL",
    "ubicacion": "us-west-2a", // En la Zona de Disponibilidad de la Región principal
    "conectividad": "VPC Peering o Direct Connect entre Local Zone y Región"
  });
*/

// Ejemplo conceptual de beneficios de latencia con Local Zones
/*
  latencia_sin_local_zone = "100ms"; // De Los Ángeles a la Región de Oregón (us-west-2)
  latencia_con_local_zone = "10ms"; // De Los Ángeles a la Local Zone en Los Ángeles
*/

// Las Local Zones son para escenarios donde la latencia es extremadamente crítica
// y la ubicación física del recurso importa mucho.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Fundamentos de AWS',
    'topic': 'AWS Global Infrastructure',
    'subtopic': 'AWS Wavelength',
    'definition': '''
AWS Wavelength lleva el concepto de "acercar la nube" a un nivel totalmente nuevo, integrando los servicios de AWS directamente en el corazón de las redes 5G de los operadores de telecomunicaciones. Esto es algo súper emocionante para aplicaciones que necesitan una latencia *extremadamente* baja, casi en tiempo real.

Seguramente pensarás de qué va todo esto y por qué es diferente a las Local Zones o Edge Locations. 

La clave es el "5G" y la "latencia del milisegundo". Pensemos por un momento en las aplicaciones que no pueden permitirse ni un instante de retraso.

Aquí te va la aclaración:

AWS Wavelength está diseñado específicamente para cargas de trabajo que requieren latencia de milisegundos o menos, como aplicaciones de realidad virtual (VR) y aumentada (AR), juegos inmersivos, automatización industrial, vehículos autónomos y análisis de video en tiempo real.

Imagina que tu aplicación necesita procesar datos de un sensor en un robot en una fábrica, o que estás jugando un juego online donde cada milisegundo cuenta. En estos casos, incluso la latencia de una Local Zone podría ser demasiado alta.

AWS Wavelength resuelve esto al incrustar recursos de computación y almacenamiento de AWS directamente en el perímetro de las redes 5G de los proveedores de telecomunicaciones (como Verizon en EE.UU., Vodafone en Europa, etc.). Esto significa que tus datos no tienen que viajar hasta una Región de AWS o incluso a una Local Zone lejana; se procesan *justo donde se generan*, en la red 5G.

Esto es posible porque los dispositivos 5G se conectan a un Wavelength Zone (que es un despliegue de AWS Wavelength dentro de la red 5G del operador) y el tráfico de la aplicación permanece dentro de la red del operador. Esto minimiza el número de saltos de red y, por ende, la latencia. Puedes desplegar servicios como EC2 o ECS directamente en estas Wavelength Zones, aprovechando la ultra-baja latencia del 5G y la familiaridad de la infraestructura de AWS. Es la frontera entre la nube y el dispositivo.
''',
    'code_example': r'''
// AWS Wavelength es una infraestructura especializada integrada en redes 5G.
// Su uso implica seleccionar una Wavelength Zone para el despliegue de recursos.

// Despliegue de una aplicación de juego en una Wavelength Zone (conceptual)
// Para ofrecer latencia ultrabaja a los jugadores en una ciudad específica.
/*
  aplicacion_juegos.desplegar({
    "tipo_instancia": "g4dn.xlarge", // Instancia optimizada para gráficos
    "ubicacion": "us-east-1-wl1-nyc-1", // Ejemplo de Wavelength Zone en Nueva York
    "ami_id": "ami-0abcdef1234567890",
    "grupo_seguridad": "sg-1234567890abcdef0"
  });

  // El tráfico de los jugadores 5G en NYC se enruta directamente a esta instancia
  // dentro de la red del operador, minimizando la latencia.
  // Latencia típica sin Wavelength: 50ms+
  // Latencia con Wavelength: 10ms o menos
*/

// Integración de dispositivos IoT (Internet de las Cosas) en Wavelength Zone (conceptual)
// Para procesamiento de datos en tiempo real en la periferia.
/*
  dispositivo_iot.enviar_datos_sensor({
    "destino": "aws-wavelength-endpoint-id",
    "frecuencia": "cada_milisegundo",
    "tipo_red": "5G"
  });

  aws_lambda_en_wavelength.ejecutar_funcion({
    "trigger": "datos_sensor_recibidos",
    "logica_procesamiento": "analisis_en_tiempo_real",
    "ubicacion": "us-west-2-wl1-sf-1" // Wavelength Zone en San Francisco
  });
*/

// AWS Wavelength es para el futuro de las aplicaciones de baja latencia y alta demanda de ancho de banda.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Fundamentos de AWS',
    'topic': 'Interfaz de AWS',
    'subtopic': 'AWS Management Console',
    'definition': '''
La AWS Management Console es, sin duda, el punto de partida para la mayoría de los usuarios que interactúan con AWS. Es una interfaz web gráfica que te permite acceder y gestionar todos tus servicios de AWS de una manera visual e intuitiva.

Seguramente te preguntarás por qué esto es tan fundamental. Pensemos por un momento en un panel de control para un avión. Si no tuvieras los diales, botones e indicadores, ¿cómo sabrías qué está pasando o cómo controlarías la nave? La consola es eso para AWS.

Aquí te va la aclaración:

La AWS Management Console es el "cerebro" visual de tu cuenta de AWS. Cuando inicias sesión, te encuentras con un dashboard personalizable que te muestra los servicios que has usado recientemente, recursos importantes y enlaces rápidos. Desde aquí, puedes navegar a cualquiera de los cientos de servicios que ofrece AWS.

Cada servicio tiene su propia sección dentro de la consola donde puedes:

* **Lanzar y configurar recursos**: Por ejemplo, iniciar una nueva instancia de EC2 (un servidor virtual), crear un bucket de S3 (almacenamiento), o configurar una base de datos en RDS.
* **Monitorear y depurar**: Ver métricas de rendimiento, registros de actividad, y solucionar problemas.
* **Gestionar usuarios y permisos**: Utilizar IAM para controlar quién tiene acceso a qué recursos.
* **Verificar la facturación**: Revisar tus gastos y el uso del Free Tier, como ya vimos.

La consola está diseñada para ser amigable, incluso para principiantes. Puedes buscar servicios por nombre, crear favoritos para acceder rápidamente a los que más usas, y cuenta con una barra de búsqueda global para encontrar recursos específicos. Es tu ventanilla única para interactuar con la vasta infraestructura de AWS sin necesidad de escribir una sola línea de código, lo que la hace indispensable para tareas de administración y monitoreo.
''',
    'code_example': r'''
// La AWS Management Console es una interfaz de usuario web, no un código programable en sí misma.
// Este ejemplo conceptualiza las acciones que realizarías en la consola.

// Acción 1: Iniciar sesión en la consola
/*
  navegador.abrir_url("https://aws.amazon.com/console/");
  formulario_login.ingresar_credenciales({
    "nombre_usuario": "tu_usuario_iam_o_root",
    "contrasena": "tu_contrasena"
  });
  // Si tienes MFA, ingresar el código MFA.
*/

// Acción 2: Navegar a un servicio específico (ej. EC2)
/*
  aws_consola.buscar_servicio("EC2"); // Usar la barra de búsqueda
  // O
  aws_consola.seleccionar_servicio_del_menu("Cómputo", "EC2");
*/

// Acción 3: Lanzar una instancia EC2 a través de la consola
/*
  ec2_dashboard.clic_en_boton("Lanzar instancia");
  wizard_lanzamiento.seleccionar_ami("Ubuntu Server");
  wizard_lanzamiento.elegir_tipo_instancia("t2.micro");
  wizard_lanzamiento.configurar_grupo_seguridad(["HTTP", "SSH"]);
  wizard_lanzamiento.seleccionar_par_de_claves("mi-key-pair.pem");
  wizard_lanzamiento.clic_en_boton("Lanzar");
*/

// Acción 4: Monitorear el uso de S3 (conceptual)
/*
  s3_dashboard.ver_metricas_uso("mi-bucket-de-imagenes");
  // Gráficos mostrando espacio usado, número de objetos, solicitudes GET/PUT.
*/

// La consola es tu principal herramienta para el día a día en AWS.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Fundamentos de AWS',
    'topic': 'Interfaz de AWS',
    'subtopic': 'AWS CLI básico',
    'definition': '''
Aunque la AWS Management Console es fantástica para empezar, a medida que tus operaciones en la nube crecen, querrás una forma más rápida y automatizada de interactuar con AWS. Aquí es donde entra en juego la AWS Command Line Interface, o AWS CLI.

Esto tiene una explicación, y es porque no siempre es eficiente hacer clic en docenas de botones en una interfaz gráfica, especialmente si necesitas realizar la misma tarea repetidamente o automatizar procesos. La CLI te permite controlar tus servicios de AWS usando comandos de texto.

Aquí te va la aclaración:

La AWS CLI es una herramienta unificada que te permite gestionar tus servicios de AWS desde la línea de comandos de tu sistema operativo (Windows, macOS, Linux). Una vez que la instalas y la configuras con tus credenciales de AWS, puedes ejecutar comandos directamente en tu terminal para realizar casi cualquier operación que harías en la consola, pero de una manera mucho más eficiente y programática.

Por ejemplo, en lugar de navegar a la consola de S3, hacer clic en "Crear bucket", escribir el nombre, y seleccionar la región, con la CLI podrías simplemente escribir:

`aws s3 mb s3://nombre-de-mi-bucket-unico --region us-east-1`

¡Y listo! El bucket se crea.

Las ventajas de usar la AWS CLI son enormes:

* **Automatización**: Puedes escribir scripts que realicen secuencias de comandos AWS, lo que es invaluable para tareas de despliegue, copias de seguridad, o administración rutinaria.
* **Rapidez**: Es mucho más rápido escribir un comando que navegar por menús y formularios en la web.
* **Flexibilidad**: Permite realizar operaciones complejas y detalladas que a veces son difíciles de lograr con la interfaz gráfica.
* **Integración**: Fácil de integrar en tus propios scripts o flujos de trabajo de CI/CD (Integración Continua/Despliegue Continuo).

Aunque al principio puede parecer un poco intimidante si no estás familiarizado con la línea de comandos, una vez que te acostumbras, la AWS CLI se convierte en una herramienta indispensable para cualquier profesional de la nube.
''',
    'code_example': r'''
# La AWS CLI se usa directamente en tu terminal.
# Primero, asegúrate de tenerla instalada y configurada con 'aws configure'.

# Comando 1: Verificar la configuración de la CLI
# Muestra la versión de la CLI instalada.
# aws --version

# Comando 2: Listar todos los buckets de S3 en tu cuenta
# Es equivalente a ir a la consola de S3 y ver la lista.
# aws s3 ls

# Comando 3: Crear un nuevo bucket de S3
# 'mb' significa 'make bucket'. El nombre del bucket debe ser globalmente único.
# aws s3 mb s3://mi-nuevo-bucket-super-unico-2025 --region us-east-1

# Comando 4: Subir un archivo a un bucket S3
# El archivo 'mi_documento.txt' en tu máquina local se subirá al bucket.
# aws s3 cp mi_documento.txt s3://mi-nuevo-bucket-super-unico-2025/

# Comando 5: Listar instancias EC2 en ejecución
# 'describe-instances' es un comando poderoso para obtener detalles.
# aws ec2 describe-instances --filters "Name=instance-state-name,Values=running"

# Comando 6: Detener una instancia EC2 (¡Cuidado con esto en producción!)
# Reemplaza 'i-0abcdef1234567890' con el ID de tu instancia.
# aws ec2 stop-instances --instance-ids i-0abcdef1234567890

# La AWS CLI es tu puerta de entrada a la automatización y gestión programática de AWS.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Fundamentos de AWS',
    'topic': 'Interfaz de AWS',
    'subtopic': 'AWS SDKs',
    'definition': '''
Si la AWS CLI es para scripts y automatización a nivel de comandos, los AWS SDKs (Software Development Kits) son para integrar directamente los servicios de AWS en tus aplicaciones programáticas, sin importar el AWS que uses.

¿Te estás preguntando por qué esto importa? Porque como desarrollador, no siempre querrás ejecutar comandos de terminal o hacer clic en una consola para que tu aplicación interactúe con la nube. Quieres que tu código hable directamente con AWS.

Aquí te va la aclaración:

Los AWS SDKs son bibliotecas de código que AWS proporciona para que los desarrolladores puedan interactuar con los servicios de AWS utilizando AWSs de programación populares como Python, Java, Node.js, .NET, PHP, Ruby, Go, y muchos más. Piensa en ellos como un conjunto de herramientas preconstruidas que simplifican enormemente la comunicación con la API de AWS.

En lugar de tener que lidiar con las complejidades de las solicitudes HTTP, la autenticación y el manejo de errores de bajo nivel, los SDKs te ofrecen objetos y métodos familiares en tu AWS de programación preferido. Por ejemplo, si estás desarrollando una aplicación en Python y necesitas subir un archivo a S3, en lugar de construir manualmente una solicitud HTTP con encabezados de autenticación, simplemente usarías el SDK de Python (Boto3) para llamar a una función como `s3.upload_file()`.

Las ventajas de usar los AWS SDKs son:

* **Productividad del desarrollador**: Te permite enfocarte en la lógica de tu aplicación en lugar de en la interacción con la API de AWS.
* **Manejo de errores y reintentos**: Los SDKs a menudo incluyen lógica para manejar errores de la red o de la API, y reintentar automáticamente las operaciones fallidas.
* **Autenticación simplificada**: Se encargan de la compleja autenticación y firma de solicitudes a AWS.
* **Actualizaciones**: AWS mantiene los SDKs actualizados con los últimos servicios y características.

Si estás construyendo una aplicación web, móvil, de escritorio o un backend que necesita interactuar con la infraestructura de AWS (ya sea para almacenamiento, cómputo, bases de datos o machine learning), los SDKs son la forma estándar y recomendada de hacerlo.
''',
    'code_example': r'''
// Los AWS SDKs te permiten interactuar con AWS directamente desde tu código.
// Aquí un ejemplo conceptual usando Python con Boto3 (el SDK de Python para AWS).

// Asegúrate de tener Boto3 instalado: pip install boto3
// Y tus credenciales de AWS configuradas (ej. via 'aws configure' o variables de entorno).

# Código Python para subir un archivo a S3 usando Boto3

import boto3
import os

# Crear un cliente S3
# Esto se conecta a la API de S3 usando tus credenciales configuradas.
s3_client = boto3.client('s3')

# Nombre del bucket y archivo
bucket_name = 'mi-bucket-de-ejemplo-con-sdk-2025'
file_name = 'mi_documento_desde_python.txt'
object_name = 'documentos/' + file_name # Ruta dentro del bucket

# Crear un archivo de prueba local (para este ejemplo)
with open(file_name, 'w') as f:
    f.write('Este es un documento subido usando el AWS SDK para Python.')

try:
    # Subir el archivo al bucket S3
    s3_client.upload_file(file_name, bucket_name, object_name)
    print(f"'{file_name}' subido exitosamente a '{bucket_name}/{object_name}'")

except Exception as e:
    print(f"Error al subir el archivo: {e}")

# Limpiar el archivo local (opcional)
os.remove(file_name)

# Otro ejemplo conceptual: Listar instancias EC2 usando el SDK de Java
/*
// Java (con AWS SDK para Java)
import software.amazon.awssdk.services.ec2.Ec2Client;
import software.amazon.awssdk.services.ec2.model.DescribeInstancesRequest;
import software.amazon.awssdk.services.ec2.model.Instance;
import software.amazon.awssdk.regions.Region;

public class Ec2Lister {
    public static void main(String[] args) {
        Ec2Client ec2 = Ec2Client.builder()
            .region(Region.US_EAST_1)
            .build();

        DescribeInstancesRequest request = DescribeInstancesRequest.builder().build();
        ec2.describeInstances(request).reservations().forEach(
            r -> r.instances().forEach(
                instance -> System.out.println("Instance ID: " + instance.instanceId() +
                                             ", State: " + instance.state().name())
            )
        );
        ec2.close();
    }
}
*/

# Los SDKs son la columna vertebral de la interacción programática con AWS.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Fundamentos de AWS',
    'topic': 'Interfaz de AWS',
    'subtopic': 'Mobile App de AWS',
    'definition': '''
En la era móvil en la que vivimos, era casi obvio que AWS también tendría una aplicación para tu teléfono. La Mobile App de AWS te permite monitorear y gestionar tus recursos clave de AWS directamente desde la palma de tu mano, estés donde estés.

No sé tú, pero a mí me ha salvado de un apuro más de una vez. Imagina que estás fuera de la oficina, cenando, y de repente recibes una alerta de que uno de tus servidores críticos está fallando. ¿Qué haces? Sacas el teléfono y la Mobile App de AWS.

Aquí te va la aclaración:

La Mobile App de AWS no está diseñada para hacer despliegues complejos o configuraciones detalladas, para eso están la Consola y la CLI. Su propósito principal es ofrecerte visibilidad y control rápido sobre tus servicios más importantes en AWS. Es como tener un control remoto para tus operaciones en la nube.

Con la aplicación móvil, puedes:

* **Monitorear el estado de tus recursos**: Ver rápidamente el estado de tus instancias EC2, el uso de tus bases de datos RDS, el estado de tus alarmas de CloudWatch, y más. Si algo está en rojo, lo sabrás de inmediato.
* **Ver métricas y alarmas**: Acceder a gráficos de métricas de CloudWatch para entender el rendimiento de tus servicios y recibir notificaciones de alarmas.
* **Realizar acciones rápidas**: Puedes iniciar, detener o reiniciar instancias EC2, lo cual es increíblemente útil si necesitas reaccionar a una emergencia. También puedes ver la facturación actual y configurar alertas de presupuesto.
* **Cambiar de región**: Acceder a los recursos en diferentes Regiones de AWS.

Es importante recordar que, por seguridad, la Mobile App tiene limitaciones. No tiene todas las funcionalidades de la consola web, pero sí las más críticas para una gestión de emergencia o un monitoreo rápido. Es una herramienta muy valiosa para los administradores y desarrolladores de la nube que necesitan estar al tanto del estado de sus sistemas 24/7, incluso cuando no están frente a una computadora.
''',
    'code_example': r'''
// La Mobile App de AWS es una aplicación para smartphone, no se configura con código programático.
// Este "código" conceptualiza las acciones que podrías realizar en la app.

// Acción 1: Iniciar sesión y ver el dashboard
/*
  // En la app de AWS Mobile:
  mobile_app.abrir_app();
  mobile_app.ingresar_credenciales_aws();
  // Ver el "Resumen de la cuenta" con el estado de servicios y alertas.
*/

// Acción 2: Monitorear el estado de una instancia EC2
/*
  mobile_app.navegar_a_servicio("EC2");
  ec2_seccion.seleccionar_instancia("mi-servidor-web-prod");
  // Ver el estado (running/stopped/terminated), métricas de CPU/RAM.
*/

// Acción 3: Detener una instancia EC2 (ejemplo de acción rápida)
/*
  mobile_app.navegar_a_servicio("EC2");
  ec2_seccion.seleccionar_instancia("mi-servidor-web-prod");
  ec2_seccion.clic_en_accion("Detener instancia");
  mobile_app.confirmar_accion("Sí, detener instancia");
  // La instancia pasará a estado 'stopping' y luego 'stopped'.
*/

// Acción 4: Consultar el uso de la factura (conceptual)
/*
  mobile_app.navegar_a_seccion("Facturación");
  facturacion_seccion.ver_uso_actual();
  // Se muestra un resumen de los gastos del mes actual y el Free Tier.
*/

// La Mobile App es una herramienta de conveniencia y monitoreo en movimiento.
'''
  });
}

Future<void> insertJrLevel2AwsData(Database db) async {
  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Servicios Básicos de Computación',
    'topic': 'Amazon EC2',
    'subtopic': 'Instancias EC2 y tipos',
    'definition': '''
Amazon EC2 (Elastic Compute Cloud) es uno de los servicios más fundamentales de AWS y probablemente uno de los primeros con los que interactuarás. En pocas palabras, te permite alquilar servidores virtuales en la nube de AWS.

¿Te estás preguntando por qué esto importa? Pensemos por un momento en si necesitaras un nuevo servidor para tu aplicación. La opción tradicional sería comprar uno, esperar a que llegue, instalarlo, configurarlo... Con EC2, tienes un servidor listo en minutos, y lo apagas cuando ya no lo necesitas, pagando solo por el tiempo que lo usas.

Aquí te va la aclaración:

Una "instancia EC2" es básicamente un servidor virtual. Cuando lanzas una instancia, estás creando una máquina virtual con un sistema operativo (Linux, Windows, etc.) y la capacidad de cómputo (CPU, RAM) que elijas. Es como si te dieran una computadora nueva lista para usar, pero en la nube.

Lo interesante es que hay muchos "tipos de instancias" EC2, cada uno optimizado para diferentes propósitos:

* **Propósito general (General Purpose)**: Son un buen balance de cómputo, memoria y red, ideales para la mayoría de las aplicaciones web, servidores de desarrollo o bases de datos pequeñas (ej. tipos `t2`, `t3`, `m5`). Son como el "todoterreno".
* **Optimizadas para cómputo (Compute Optimized)**: Tienen una alta relación CPU-memoria, perfectas para aplicaciones que necesitan mucha potencia de procesamiento, como servidores web de alto tráfico o análisis de datos intensivo (ej. tipos `c5`, `c6g`). Piensa en ellas como el "cerebro" de la operación.
* **Optimizadas para memoria (Memory Optimized)**: Con mucha RAM, son ideales para bases de datos de alto rendimiento, análisis de Big Data en memoria o cachés distribuidas (ej. tipos `r5`, `x1`). Son el "almacén" de información.
* **Optimizadas para almacenamiento (Storage Optimized)**: Diseñadas para cargas de trabajo que necesitan un acceso de lectura/escritura muy rápido a conjuntos de datos grandes, como bases de datos NoSQL o almacenes de datos (ej. tipos `i3`, `d2`). Son el "disco duro de alta velocidad".
* **Aceleradas (Accelerated Computing)**: Incluyen hardware como GPUs o FPGAs, ideales para machine learning, diseño gráfico o análisis de datos complejos (ej. tipos `p3`, `g4dn`). Son como los "músculos" para tareas pesadas.

Elegir el tipo de instancia correcto es crucial para el rendimiento y el costo de tu aplicación. Si eliges una muy potente para una tarea pequeña, gastarás de más; si eliges una débil para una tarea exigente, tu aplicación será lenta.
''',
    'code_example': r'''
# Esto es un ejemplo conceptual de cómo lanzarías una instancia EC2 usando la AWS CLI.
# En la vida real, necesitarías configurar la AMI, Security Group y Key Pair.

# Comando para listar tipos de instancias (conceptual)
# aws ec2 describe-instance-types --filters "Name=instance-type,Values=t2.*,m5.*" --query "InstanceTypes[*].{InstanceType:InstanceType,VCpuInfo:VCpuInfo.DefaultVCpus,MemoryInfo:MemoryInfo.SizeInMiB}"

# Comando para lanzar una instancia EC2 (ejemplo simplificado)
# Reemplaza 'ami-xxxxxxxxxxxxxxxxx' con un ID de AMI válido para tu región
# Reemplaza 'sg-xxxxxxxxxxxxxxxxx' con un ID de Security Group válido
# Reemplaza 'nombre_de_tu_key_pair' con el nombre de tu par de claves

# aws ec2 run-instances \
#   --image-id ami-0abcdef1234567890 \
#   --instance-type t2.micro \
#   --count 1 \
#   --key-name nombre_de_tu_key_pair \
#   --security-group-ids sg-0abcdef1234567890 \
#   --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=MiPrimerServidorWeb}]'

# Ejemplo de código incorrecto (conceptual)
# Usar un tipo de instancia excesivamente grande para una tarea simple, lo que resulta en alto costo.
# aws ec2 run-instances \
#   --image-id ami-0abcdef1234567890 \
#   --instance-type p3.8xlarge \ # ¡Muy costoso para un servidor web básico!
#   --count 1 \
#   --key-name nombre_de_tu_key_pair \
#   --security-group-ids sg-0abcdef1234567890

# Este es el primer paso para tener tu propio servidor en la nube.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Servicios Básicos de Computación',
    'topic': 'Amazon EC2',
    'subtopic': 'AMIs (Amazon Machine Images)',
    'definition': '''
Una AMI, o Amazon Machine Image, es como una plantilla o un "molde" preconfigurado que usas para lanzar tus instancias EC2. Contiene el sistema operativo (como Linux o Windows), el software que necesites (servidores web, bases de datos), configuraciones de red, ¡todo lo que necesitas para que tu servidor virtual esté listo para funcionar!

Seguramente pensarás de qué va todo esto y por qué es tan útil. Pensemos por un momento en si tuvieras que configurar un servidor desde cero cada vez: instalar el sistema operativo, los programas, las dependencias... Sería una pesadilla. Las AMIs resuelven eso.

Aquí te va la aclaración:

Cuando lanzas una instancia EC2, siempre eliges una AMI. Esta AMI es la base sobre la que se construye tu servidor virtual. Puedes elegir entre varios tipos de AMIs:

* **AMIs proporcionadas por AWS**: Son las más comunes. AWS te ofrece AMIs con sistemas operativos populares (Amazon Linux, Ubuntu, Windows Server, etc.) preinstalados y listos para usar. Son una excelente opción para empezar.
* **AMIs de la Comunidad**: Otros usuarios de AWS o vendedores de software publican sus propias AMIs preconfiguradas en el AWS Marketplace. Puedes encontrar AMIs con software específico ya instalado, lo que te ahorra tiempo de configuración. ¡Siempre verifica la fiabilidad de la fuente antes de usarlas!
* **AMIs personalizadas**: Lo más poderoso es que puedes crear tus propias AMIs. Una vez que configuras una instancia EC2 exactamente como la quieres (instalando tus aplicaciones, ajustando configuraciones, etc.), puedes crear una AMI a partir de ella. Esto es increíblemente útil para:
    * **Consistencia**: Aseguras que todas tus instancias nuevas sean idénticas.
    * **Despliegue rápido**: Lanzas nuevas instancias con todo listo, reduciendo el tiempo de configuración.
    * **Copias de seguridad**: Una AMI es, en cierto modo, una instantánea de tu servidor.

Pensemos por un momento en una empresa como Netflix. Ellos no configuran cada servidor individualmente. Crean AMIs personalizadas con todo su software y configuraciones, y luego lanzan miles de instancias a partir de esas AMIs, asegurando que todo funcione de manera consistente.
''',
    'code_example': r'''
# Las AMIs se seleccionan al lanzar una instancia EC2.
# Aquí un ejemplo conceptual de cómo una AMI es una plantilla.

# Comando para buscar AMIs de Amazon Linux (conceptual)
# aws ec2 describe-images --owners amazon --filters "Name=name,Values=amzn2-ami-hvm-2.0.????????.?-x86_64-gp2" --query "Images[*].ImageId"

# Comando para lanzar una instancia usando una AMI específica
# aws ec2 run-instances \
#   --image-id ami-0abcdef1234567890 \ # <--- Este es el ID de la AMI
#   --instance-type t2.micro \
#   --count 1 \
#   --key-name tu_key_pair \
#   --security-group-ids sg-tu_security_group

# Crear una AMI personalizada a partir de una instancia existente (conceptual)
# Primero, asegúrate de que tu instancia EC2 (ej. i-0abcdef1234567890) esté configurada como quieres.
# aws ec2 create-image \
#   --instance-id i-0abcdef1234567890 \
#   --name "MiAMIWebPersonalizada" \
#   --description "AMI con servidor web preinstalado y configurado"

# Ejemplo de uso incorrecto (conceptual)
# Usar una AMI desactualizada o de una fuente no confiable, lo que podría generar problemas de seguridad.
# aws ec2 run-instances --image-id ami-maliciosa-o-vieja --instance-type t2.micro

# Las AMIs son esenciales para la automatización y la consistencia en AWS.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Servicios Básicos de Computación',
    'topic': 'Amazon EC2',
    'subtopic': 'Security Groups',
    'definition': '''
Los Security Groups, o Grupos de Seguridad, son como los firewalls virtuales para tus instancias EC2. Deciden qué tipo de tráfico de red se permite entrar (inbound) y salir (outbound) de tus servidores virtuales. Son una capa fundamental de seguridad en AWS.

¿Te estás preguntando por qué esto importa? Pensemos por un momento en tu casa. No dejarías la puerta principal abierta para que cualquiera entre, ¿verdad? Un Security Group hace lo mismo por tus servidores, controlando el acceso.

Aquí te va la aclaración:

Cuando lanzas una instancia EC2, siempre debes asignarle uno o más Security Groups. Cada Security Group tiene un conjunto de reglas que especifican:

* **Tipo de tráfico**: ¿Es tráfico web (HTTP), SSH (para acceso remoto), HTTPS, etc.?
* **Protocolo**: TCP, UDP, ICMP.
* **Rango de puertos**: Por ejemplo, puerto 80 para HTTP, puerto 22 para SSH.
* **Fuente/Destino**: Desde qué direcciones IP o rangos de IP se permite el tráfico, o a qué direcciones IP se permite que tu instancia envíe tráfico. Esto puede ser una IP específica, un rango de IPs (CIDR), o incluso otro Security Group.

**Reglas Inbound (Entrada)**: Estas reglas definen qué tráfico se permite *entrar* a tu instancia. Por ejemplo, si tienes un servidor web, necesitas una regla que permita el tráfico HTTP (puerto 80) desde cualquier IP (0.0.0.0/0). Si quieres acceder por SSH, necesitarías permitir el tráfico SSH (puerto 22) desde tu IP o un rango de IPs específico.

**Reglas Outbound (Salida)**: Estas reglas definen qué tráfico se permite *salir* de tu instancia. Por defecto, los Security Groups suelen permitir todo el tráfico saliente, pero puedes restringirlo si tu aplicación solo necesita comunicarse con ciertos servicios.

Lo importante de los Security Groups es que son **stateful**. Esto significa que si permites tráfico entrante, la respuesta saliente se permite automáticamente sin necesidad de una regla explícita de salida. Por ejemplo, si permites que tu servidor web reciba una solicitud HTTP, la respuesta a esa solicitud se permitirá automáticamente salir.

Además, los Security Groups actúan a nivel de instancia, lo que significa que controlan el tráfico hacia y desde tus instancias, no a nivel de subred (como las ACLs de red). Son la primera línea de defensa para tus servidores en la nube.
''',
    'code_example': r'''
# Los Security Groups se configuran a través de la AWS Management Console o la AWS CLI.

# Ejemplo 1: Crear un Security Group para un servidor web (conceptual)
# aws ec2 create-security-group \
#   --group-name "WebServerSecurityGroup" \
#   --description "Security group for web servers" \
#   --vpc-id vpc-0abcdef1234567890 # Reemplaza con tu VPC ID

# Ejemplo 2: Añadir una regla de entrada (inbound) para HTTP (puerto 80)
# Esto permite que el tráfico web (HTTP) de cualquier parte del mundo acceda al servidor.
# aws ec2 authorize-security-group-ingress \
#   --group-id sg-0abcdef1234567890 \ # Reemplaza con el ID de tu Security Group
#   --protocol tcp \
#   --port 80 \
#   --cidr 0.0.0.0/0 \
#   --description "Allow HTTP from anywhere"

# Ejemplo 3: Añadir una regla de entrada (inbound) para SSH (puerto 22) desde tu IP
# Esto permite que solo tú puedas acceder por SSH a la instancia.
# Reemplaza 'tu_ip_publica/32' con tu dirección IP pública actual.
# aws ec2 authorize-security-group-ingress \
#   --group-id sg-0abcdef1234567890 \
#   --protocol tcp \
#   --port 22 \
#   --cidr tu_ip_publica/32 \
#   --description "Allow SSH from my IP"

# Ejemplo de Security Group mal configurado (conceptual)
# Permitir SSH (puerto 22) desde cualquier IP del mundo (¡RIESGO DE SEGURIDAD!).
# aws ec2 authorize-security-group-ingress \
#   --group-id sg-0abcdef1234567890 \
#   --protocol tcp \
#   --port 22 \
#   --cidr 0.0.0.0/0 \ # ¡EVITA ESTO EN PRODUCCIÓN!
#   --description "Allow SSH from everywhere (BAD PRACTICE)"

# Los Security Groups son cruciales para la seguridad de tus instancias EC2.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Servicios Básicos de Computación',
    'topic': 'Amazon EC2',
    'subtopic': 'Key Pairs',
    'definition': '''
Los Key Pairs, o Pares de Claves, son un componente de seguridad esencial para acceder a tus instancias EC2 de forma segura, especialmente si son Linux. Piensa en ellos como la llave digital que te permite desbloquear y conectarte a tu servidor virtual.

¿Te estás preguntando por qué esto importa? Pensemos por un momento en una contraseña. Son buenas, pero un par de claves es mucho más seguro para el acceso a servidores, ya que no se transmite por la red y es casi imposible de adivinar.

Aquí te va la aclaración:

Un Key Pair consiste en dos partes:

1.  **Clave pública (.pub)**: Esta clave se almacena en AWS y se inyecta en tu instancia EC2 cuando la lanzas. Es como el candado que se coloca en la puerta de tu servidor.
2.  **Clave privada (.pem)**: Esta clave la descargas y la guardas de forma segura en tu computadora local. Es la "llave" que usas para abrir ese candado.

Cuando intentas conectarte a tu instancia EC2 (por ejemplo, usando SSH para instancias Linux o RDP para Windows, aunque para Windows también se puede generar una contraseña a partir de la clave privada), el sistema de la instancia usa la clave pública para verificar que la clave privada que estás presentando es la correcta. Si coinciden, te concede acceso.

**Características importantes:**

* **Seguridad**: Es un método de autenticación mucho más seguro que las contraseñas, ya que la clave privada nunca se envía por la red.
* **Unicidad**: Cada par de claves es único.
* **Confidencialidad**: La clave privada (`.pem`) debe mantenerse estrictamente confidencial. Si alguien más obtiene tu clave privada, podría acceder a tus instancias. Por eso, AWS solo te permite descargar la clave privada una vez, justo después de crearla. Si la pierdes, no hay forma de recuperarla, y tendrás que crear una nueva y asociarla a futuras instancias.
* **Asociación a instancias**: Debes especificar qué Key Pair usarás cuando lanzas una instancia EC2. Una vez lanzada, no puedes cambiar el Key Pair asociado a esa instancia. Si necesitas cambiar la seguridad, tendrías que lanzar una nueva instancia con un nuevo Key Pair.

Para instancias Linux, el Key Pair se usa para la autenticación SSH. Para instancias Windows, puedes usarlo para descifrar la contraseña de administrador inicial. Sin un Key Pair, no podrás acceder a tus instancias EC2 de forma remota. Es un elemento de seguridad que no puedes pasar por alto.
''',
    'code_example': r'''
# Los Key Pairs se gestionan a través de la AWS Management Console o la AWS CLI.

# Ejemplo 1: Crear un nuevo Key Pair (conceptual)
# Esto generará un archivo .pem que debes descargar y guardar de forma segura.
# aws ec2 create-key-pair --key-name MiPrimerKeySSH --query 'KeyMaterial' --output text > MiPrimerKeySSH.pem

# Una vez creado, asegúrate de cambiar los permisos del archivo .pem (en Linux/macOS)
# chmod 400 MiPrimerKeySSH.pem
# Esto asegura que solo tú puedas leer el archivo.

# Ejemplo 2: Lanzar una instancia EC2 usando el Key Pair creado
# aws ec2 run-instances \
#   --image-id ami-0abcdef1234567890 \
#   --instance-type t2.micro \
#   --count 1 \
#   --key-name MiPrimerKeySSH \ # <--- Aquí se especifica el nombre del Key Pair
#   --security-group-ids sg-0abcdef1234567890 \
#   --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=ServidorConMiLlave}]'

# Ejemplo 3: Conectarse a una instancia Linux usando SSH y el Key Pair
# ssh -i MiPrimerKeySSH.pem ec2-user@tu.direccion.ip.publica
# 'ec2-user' es el usuario por defecto para Amazon Linux AMIs. Otros AMIs pueden usar 'ubuntu', 'centos', etc.

# Ejemplo de error común (conceptual)
# Intentar conectarse sin especificar el Key Pair o con el Key Pair incorrecto.
# ssh ec2-user@tu.direccion.ip.publica # Error: Permission denied (publickey)

# Los Key Pairs son tus llaves maestras para acceder a tus servidores en AWS.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Servicios Básicos de Computación',
    'topic': 'Elastic Load Balancing',
    'subtopic': 'Tipos de Load Balancers (ALB, NLB, GLB)',
    'definition': '''
Cuando tienes varias instancias EC2 manejando tu aplicación, ¿cómo distribuyes el tráfico entre ellas de manera eficiente? Aquí es donde entra Elastic Load Balancing (ELB). ELB es un servicio de AWS que distribuye automáticamente el tráfico de red entrante entre múltiples destinos, como instancias EC2, contenedores, direcciones IP e incluso funciones Lambda.

¿Te estás preguntando por qué esto importa? 

Porque si tienes una sola instancia, esta podría colapsar si hay mucho tráfico; un balanceador de carga asegura que tu aplicación siempre esté disponible y responda rápido.

Aquí te va la aclaración:

AWS ofrece diferentes tipos de Load Balancers, cada uno diseñado para necesidades específicas:

* **Application Load Balancer (ALB)**: Este es el balanceador de carga más flexible y popular. Opera a nivel de capa de aplicación (capa 7 del modelo OSI), lo que significa que entiende las solicitudes HTTP/HTTPS. Es ideal para balancear cargas de aplicaciones web modernas, microservicios y contenedores. Un ALB puede enrutar el tráfico basándose en el contenido de la solicitud (por ejemplo, enviar peticiones a `/api` a un grupo de servidores y peticiones a `/imagenes` a otro), y también soporta HTTP/2 y WebSockets. Puedes tener un solo ALB para manejar múltiples aplicaciones en el mismo puerto, lo cual es muy eficiente.

* **Network Load Balancer (NLB)**: A diferencia del ALB, el NLB opera a nivel de capa de red (capa 4 del modelo OSI), es decir, maneja tráfico TCP, UDP y TLS. Es extremadamente rápido y eficiente para cargas de trabajo que requieren un rendimiento ultraalto, latencia ultra-baja y una cantidad masiva de conexiones por segundo. Es ideal para juegos, telecomunicaciones o cualquier aplicación donde cada milisegundo cuenta y el tráfico es de tipo raw TCP/UDP. Si tu aplicación necesita IPs estáticas, el NLB también las ofrece.

* **Gateway Load Balancer (GLB)**: Este es el más nuevo de los tres y está diseñado para casos de uso muy específicos: insertar, escalar y encadenar dispositivos de red virtual (como firewalls de terceros, sistemas de detección de intrusiones o pasarelas de seguridad) de forma transparente. Opera a nivel de capa de red (capa 3 del modelo OSI). Si tu arquitectura requiere que todo el tráfico pase por una cadena de dispositivos de seguridad o de inspección antes de llegar a tus aplicaciones, el GLB es la solución. No es para balancear tráfico de aplicaciones directamente, sino para balancear el tráfico a servicios de red de terceros.

Elegir el tipo correcto de Load Balancer es crucial para el rendimiento, la disponibilidad y el costo de tu arquitectura.
''',
    'code_example': r'''
# Los Load Balancers se configuran en la consola de AWS o con la AWS CLI.
# Aquí presentamos una conceptualización de su creación y uso.

# Crear un Application Load Balancer (ALB) - conceptual
# aws elbv2 create-load-balancer \
#   --name mi-aplicacion-alb \
#   --subnets subnet-0abcdef1234567890 subnet-0fedcba9876543210 \
#   --security-groups sg-0abcdef1234567890 \
#   --scheme internet-facing \
#   --type application

# Crear un Listener para el ALB (conceptual)
# Esto define cómo el ALB escucha el tráfico (ej. HTTP en puerto 80)
# aws elbv2 create-listener \
#   --load-balancer-arn arn:aws:elasticloadbalancing:us-east-1:123456789012:loadbalancer/app/mi-aplicacion-alb/... \
#   --protocol HTTP \
#   --port 80 \
#   --default-actions Type=forward,TargetGroupArn=arn:aws:elasticloadbalancing:us-east-1:123456789012:targetgroup/mi-grupo-objetivo/...

# Crear un Network Load Balancer (NLB) - conceptual
# aws elbv2 create-load-balancer \
#   --name mi-juego-nlb \
#   --subnets subnet-0abcdef1234567890 subnet-0fedcba9876543210 \
#   --scheme internet-facing \
#   --type network

# Crear un Listener para el NLB (conceptual)
# aws elbv2 create-listener \
#   --load-balancer-arn arn:aws:elasticloadbalancing:us-east-1:123456789012:loadbalancer/net/mi-juego-nlb/... \
#   --protocol TCP \
#   --port 8080 \
#   --default-actions Type=forward,TargetGroupArn=arn:aws:elasticloadbalancing:us-east-1:123456789012:targetgroup/mi-grupo-objetivo-tcp/...

# Ejemplo de uso incorrecto: Usar un NLB para routing basado en URL.
# Un NLB no entiende HTTP, por lo que no puede hacer este tipo de enrutamiento avanzado.
# if (request.path === "/api") {
#   send_to_api_server(); // Un NLB no puede hacer esto.
# } else if (request.path === "/images") {
#   send_to_image_server(); // Esto es una función de ALB.
# }

# La elección del balanceador correcto es clave para la arquitectura de tu aplicación.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Servicios Básicos de Computación',
    'topic': 'Elastic Load Balancing',
    'subtopic': 'Configuración básica',
    'definition': '''
Configurar un Elastic Load Balancer (ELB) es el primer paso para distribuir el tráfico de tu aplicación de manera eficiente y asegurar su alta disponibilidad. Aunque los tipos de ELB varían, los conceptos básicos de configuración son bastante similares.

¿Te estás preguntando por qué una buena configuración es crucial? 

Pensemos por un momento en si el balanceador no estuviera bien ajustado; esto podría generar que algunas instancias reciban demasiado tráfico, mientras otras estén ociosas, o incluso que fallen las verificaciones de salud y tu aplicación se caiga.

Aquí te va la aclaración:

La configuración básica de cualquier Load Balancer en AWS generalmente implica los siguientes pasos:

1.  **Seleccionar el Tipo de Load Balancer**: Como ya vimos, lo primero es decidir si necesitas un ALB, NLB o GLB, dependiendo de tu tipo de tráfico y requisitos de rendimiento.

2.  **Definir las Subredes**: El Load Balancer necesita ser desplegado en al menos dos Zonas de Disponibilidad (AZs) dentro de tu VPC (Virtual Private Cloud) para asegurar alta disponibilidad. Si una AZ falla, el balanceador seguirá funcionando en la otra. Debes seleccionar las subredes públicas donde se desplegará el ELB.

3.  **Configurar Security Groups (para ALB)**: Para los Application Load Balancers, necesitas asociar Security Groups que controlen el tráfico de entrada y salida al propio balanceador. Esto es como el firewall para el ELB. Por ejemplo, permitir tráfico HTTP/HTTPS en el puerto 80/443 desde internet. Los NLBs no usan Security Groups a nivel de Load Balancer, sino en los grupos objetivo.

4.  **Crear Listeners**: Un Listener es el proceso que comprueba las solicitudes de conexión. Defines el protocolo y el puerto en el que el Load Balancer escuchará el tráfico entrante (ej. HTTP en puerto 80, HTTPS en puerto 443). Cada Listener tiene una o más "reglas" que le dicen al balanceador qué hacer con el tráfico que recibe, como reenviarlo a un grupo objetivo específico.

5.  **Crear Target Groups (Grupos Objetivo)**: Un Target Group es una colección de recursos (instancias EC2, IPs, Lambda, etc.) que pueden recibir tráfico del Load Balancer. Aquí es donde registras tus servidores. Cada Target Group tiene una configuración de "Health Checks" (verificaciones de salud) que el balanceador usa para determinar si los destinos están sanos y pueden recibir tráfico. Si un destino no pasa el Health Check, el balanceador deja de enviarle tráfico.

Una vez que estos componentes están configurados, el ELB comenzará a distribuir el tráfico a los destinos sanos dentro de los grupos objetivo. Es un proceso de configuración lógica que asegura que tu aplicación sea escalable y resistente a fallos.
''',
    'code_example': r'''
# Configuración básica de un ALB usando AWS CLI (conceptual y simplificado)

# Paso 1: Crear el Load Balancer
# aws elbv2 create-load-balancer \
#   --name mi-aplicacion-alb \
#   --subnets subnet-0abcdef1234567890 subnet-0fedcba9876543210 \
#   --security-groups sg-0abcdef1234567890 \
#   --scheme internet-facing \
#   --type application
# (Esto devuelve el ARN del Load Balancer: LB_ARN)

# Paso 2: Crear un Target Group
# Aquí defines el puerto y el protocolo para el tráfico que llega a tus instancias.
# aws elbv2 create-target-group \
#   --name mi-aplicacion-tg \
#   --protocol HTTP \
#   --port 80 \
#   --vpc-id vpc-0abcdef1234567890 \
#   --health-check-protocol HTTP \
#   --health-check-path /health \ # Ruta para la verificación de salud
#   --healthy-threshold 2 \
#   --unhealthy-threshold 2 \
#   --interval 30 \
#   --timeout 5
# (Esto devuelve el ARN del Target Group: TG_ARN)

# Paso 3: Registrar instancias EC2 en el Target Group
# Puedes registrar una o varias instancias que manejarán el tráfico.
# aws elbv2 register-targets \
#   --target-group-arn $TG_ARN \
#   --targets Id=i-0abcdef1234567890 Id=i-0fedcba9876543210

# Paso 4: Crear un Listener para el Load Balancer
# Esto conecta el Load Balancer al Target Group.
# aws elbv2 create-listener \
#   --load-balancer-arn $LB_ARN \
#   --protocol HTTP \
#   --port 80 \
#   --default-actions Type=forward,TargetGroupArn=$TG_ARN

# Ejemplo de error común: No especificar al menos dos subredes para alta disponibilidad.
# aws elbv2 create-load-balancer \
#   --name mi-aplicacion-alb-malo \
#   --subnets subnet-0abcdef1234567890 \ # Solo una subred, ¡no es altamente disponible!
#   --security-groups sg-0abcdef1234567890 \
#   --scheme internet-facing \
#   --type application

# Una configuración correcta asegura que tu aplicación sea resiliente.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Servicios Básicos de Computación',
    'topic': 'Elastic Load Balancing',
    'subtopic': 'Health Checks',
    'definition': '''
Los Health Checks, o verificaciones de salud, son una característica vital de Elastic Load Balancing. Son el mecanismo que el balanceador de carga utiliza para determinar si las instancias o destinos que reciben tráfico están funcionando correctamente y son capaces de procesar solicitudes.

¿Te estás preguntando por qué una buena configuración es crucial? 

Pensemos por un momento en si el balanceador enviara tráfico a un servidor que ya está caído o no responde; esto generaría errores para tus usuarios y una mala experiencia.

Aquí te va la aclaración:

Cuando configuras un Target Group para tu Load Balancer, le especificas cómo realizar los Health Checks. El balanceador de carga periódicamente envía solicitudes a cada destino (instancia EC2, IP, etc.) en el grupo objetivo y espera una respuesta que indique que el destino está "sano".

Los parámetros clave que configuras para un Health Check incluyen:

* **Protocolo de la verificación**: Puede ser HTTP, HTTPS, TCP, o SSL. Para aplicaciones web, HTTP/HTTPS es lo más común, ya que verifica que el servidor web esté respondiendo a peticiones.
* **Ruta de la verificación (para HTTP/HTTPS)**: Una URL específica (ej. `/health` o `/`) a la que el balanceador enviará la solicitud. Tu aplicación debería tener un endpoint en esa ruta que devuelva una respuesta exitosa si todo está bien.
* **Puerto de la verificación**: El puerto en el que el balanceador debe contactar al destino para la verificación.
* **Tiempo de espera (Timeout)**: El tiempo que el balanceador esperará una respuesta antes de considerar que el destino no está sano.
* **Intervalo (Interval)**: Con qué frecuencia el balanceador realiza las verificaciones.
* **Umbral de estado bueno (Healthy Threshold)**: El número consecutivo de verificaciones exitosas que un destino debe pasar para ser considerado "sano" y recibir tráfico.
* **Umbral de estado malo (Unhealthy Threshold)**: El número consecutivo de verificaciones fallidas que un destino debe tener para ser considerado "no sano" y ser retirado del balanceo de carga.

Si un destino falla los Health Checks el número de veces especificado por el "Umbral de estado malo", el Load Balancer automáticamente dejará de enviarle tráfico. Una vez que el destino comience a pasar los Health Checks el número de veces especificado por el "Umbral de estado bueno", el balanceador lo volverá a incluir en el grupo de destinos que reciben tráfico.

Esto es fundamental para la resiliencia de tu aplicación. Te asegura que solo las instancias que están realmente funcionando reciban las solicitudes de tus usuarios, mejorando la fiabilidad y la experiencia general.
''',
    'code_example': r'''
# La configuración de Health Checks es parte de la creación de un Target Group.
# Aquí un ejemplo de cómo se definen en la AWS CLI.

# Creación de un Target Group con Health Checks definidos (conceptual)
# aws elbv2 create-target-group \
#   --name mi-aplicacion-tg-con-healthcheck \
#   --protocol HTTP \
#   --port 80 \
#   --vpc-id vpc-0abcdef1234567890 \
#   --health-check-protocol HTTP \
#   --health-check-port 80 \ # El puerto en la instancia para el health check
#   --health-check-path /status \ # La URL que el ALB debe consultar
#   --healthy-threshold 3 \       # 3 verificaciones exitosas consecutivas para ser "sano"
#   --unhealthy-threshold 3 \     # 3 verificaciones fallidas consecutivas para ser "no sano"
#   --interval 30 \               # Realizar verificación cada 30 segundos
#   --timeout 5 \                 # Esperar 5 segundos para una respuesta
#   --matcher HttpCode=200,302    # Códigos de respuesta HTTP que se consideran "sanos"
# (Esto devuelve el ARN del Target Group)

# Ejemplo conceptual de cómo una aplicación web respondería a un Health Check
# En tu código (ej. Node.js con Express):
/*
app.get('/status', (req, res) => {
  // Aquí podrías agregar lógica para verificar dependencias, DB, etc.
  // Si todo está bien, responder 200 OK.
  if (servidorEstaFuncionandoBien()) {
    res.status(200).send('OK');
  } else {
    res.status(500).send('ERROR'); // Forzar fallo para pruebas
  }
});
*/

# Ejemplo de Health Check mal configurado:
# Un health check que siempre devuelve éxito, incluso si la base de datos está caída.
# Esto haría que el Load Balancer envíe tráfico a un servidor que no puede funcionar.
# app.get('/status', (req, res) => {
#   res.status(200).send('Siempre OK'); // ¡No verifica dependencias!
# });

# Los Health Checks son tu salvavidas para la alta disponibilidad.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Servicios Básicos de Computación',
    'topic': 'Elastic Load Balancing',
    'subtopic': 'Cross-zone load balancing',
    'definition': '''
El "Cross-zone load balancing", o balanceo de carga entre zonas, es una característica de Elastic Load Balancing que distribuye el tráfico equitativamente entre las instancias de tus Target Groups, incluso si están en diferentes Zonas de Disponibilidad (AZs).

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en si el tráfico se concentrara en una sola AZ, dejando otras con capacidad ociosa, o incluso si una AZ se sobrecargara.

Aquí te va la aclaración:

Por defecto, los Load Balancers en AWS operan con un principio llamado "balanceo de carga a nivel de Zona de Disponibilidad". Esto significa que un balanceador de carga distribuye el tráfico que recibe en una AZ *solo* a las instancias que residen en esa misma AZ. Si tienes 10 instancias en AZ-A y 2 instancias en AZ-B, y el tráfico llega 50/50 a cada AZ del balanceador, las 10 instancias en AZ-A recibirán el doble de tráfico que las 2 instancias en AZ-B. Esto podría generar que algunas instancias se sobrecarguen mientras otras están subutilizadas.

El **Cross-zone load balancing** cambia esta dinámica. Cuando está habilitado, el Load Balancer distribuye el tráfico de entrada de manera uniforme a *todas* las instancias registradas en el Target Group, sin importar en qué Zona de Disponibilidad se encuentren. Es decir, si tienes 10 instancias en AZ-A y 2 instancias en AZ-B, cada instancia recibirá aproximadamente 1/12 del tráfico total, independientemente de la AZ de origen. Esto mejora enormemente la utilización de recursos y la resistencia a fallos.

**Consideraciones importantes:**

* **ALB (Application Load Balancer)**: El Cross-zone load balancing está **habilitado por defecto** y no tiene costo adicional por el tráfico de balanceo entre AZs. Es la configuración recomendada para la mayoría de los casos.
* **NLB (Network Load Balancer)**: Para el NLB, el Cross-zone load balancing está **deshabilitado por defecto**. Si lo habilitas, AWS comienza a cobrar por el tráfico que se mueve entre las AZs para el balanceo de carga. Esto es importante porque los NLBs manejan volúmenes muy altos de tráfico, y los costos de transferencia de datos entre AZs pueden acumularse rápidamente. Sin embargo, para la mayoría de los escenarios de alta disponibilidad, es recomendable habilitarlo.

Habilitar el Cross-zone load balancing mejora la elasticidad de tu aplicación y asegura que la carga se distribuya de la manera más óptima posible, aprovechando toda la capacidad disponible en tus Zonas de Disponibilidad.
''',
    'code_example': r'''
# El Cross-zone load balancing se configura al crear o modificar un Target Group
# o directamente en el Load Balancer, dependiendo del tipo.

# Habilitar Cross-zone load balancing para un Network Load Balancer (NLB) (conceptual)
# Para NLB, viene deshabilitado por defecto y tiene costo por transferencia de datos entre AZs.
# aws elbv2 modify-target-group-attributes \
#   --target-group-arn arn:aws:elasticloadbalancing:us-east-1:123456789012:targetgroup/mi-juego-nlb-tg/... \
#   --attributes Key=load_balancing.cross_zone.enabled,Value=true

# Deshabilitar Cross-zone load balancing para un ALB (conceptual)
# Para ALB, viene habilitado por defecto y generalmente se recomienda mantenerlo así.
# aws elbv2 modify-load-balancer-attributes \
#   --load-balancer-arn arn:aws:elasticloadbalancing:us-east-1:123456789012:loadbalancer/app/mi-aplicacion-alb/... \
#   --attributes Key=load_balancing.cross_zone.enabled,Value=false # ¡Generalmente no recomendado para ALB!

# Ejemplo de cómo el tráfico se distribuye (conceptual)
# Sin Cross-zone load balancing (para NLB por defecto):
#   - Tráfico llega a AZ-A: solo se distribuye a instancias en AZ-A.
#   - Tráfico llega a AZ-B: solo se distribuye a instancias en AZ-B.
#   - Si AZ-A tiene 10 instancias y AZ-B tiene 2, las instancias en AZ-A trabajan más si la mayoría del tráfico entra por esa AZ.

# Con Cross-zone load balancing habilitado:
#   - Tráfico llega a cualquier AZ del Load Balancer.
#   - El Load Balancer distribuye el tráfico a todas las instancias en el Target Group de forma equitativa,
#     sin importar la AZ de origen del tráfico o la AZ de la instancia.
#   - Si AZ-A tiene 10 instancias y AZ-B tiene 2, cada instancia recibe 1/12 del tráfico total.

# El Cross-zone load balancing mejora la utilización de recursos y la resiliencia.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Servicios Básicos de Computación',
    'topic': 'Auto Scaling',
    'subtopic': 'Grupos de Auto Scaling',
    'definition': '''
Los Grupos de Auto Scaling (Auto Scaling Groups o ASG) son el corazón del servicio Auto Scaling de AWS. Su propósito es asegurar que tengas el número correcto de instancias EC2 para manejar la carga de tu aplicación de manera automática.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en si el tráfico de tu sitio web aumenta drásticamente. Si no tuvieras un ASG, tus servidores podrían colapsar por la sobrecarga, y tu sitio dejaría de funcionar. Un ASG evita este dolor de cabeza.

Aquí te va la aclaración:

Un Grupo de Auto Scaling es una colección de instancias EC2 que AWS gestiona para que actúen como una única unidad. Cuando creas un ASG, defines:

* **Capacidad deseada (Desired Capacity)**: El número de instancias que deseas que el ASG mantenga en ejecución en todo momento. AWS se asegurará de que este número se cumpla.
* **Capacidad mínima (Minimum Capacity)**: El número mínimo de instancias que el ASG puede tener, incluso cuando la carga es muy baja. Esto asegura que siempre tengas una base para tu aplicación.
* **Capacidad máxima (Maximum Capacity)**: El número máximo de instancias que el ASG puede escalar. Esto te protege de gastos excesivos y asegura que no lances más instancias de las que puedes o quieres manejar.

El ASG se encarga de:

* **Lanzar instancias**: Si la carga aumenta y se necesitan más servidores (según tus políticas de escalado), el ASG lanzará nuevas instancias automáticamente.
* **Terminar instancias**: Si la carga disminuye y hay demasiados servidores, el ASG terminará instancias automáticamente para ahorrar costos.
* **Reemplazar instancias fallidas**: Si una instancia deja de estar saludable (no pasa los Health Checks del ELB, por ejemplo), el ASG la detectará y lanzará una nueva para reemplazarla, manteniendo tu capacidad deseada.

Pensemos por un momento en una tienda online en el Black Friday. El tráfico se dispara, y el ASG detecta esto y lanza más servidores para manejarlo. Una vez que termina el evento y el tráfico vuelve a la normalidad, el ASG reduce el número de servidores, lo que te ahorra mucho dinero. Es una herramienta indispensable para la resiliencia y la eficiencia de costos en la nube.
''',
    'code_example': r'''
# La creación de un Auto Scaling Group se realiza a través de la consola o la AWS CLI.
# Necesitas una 'Launch Template' (o 'Launch Configuration' legacy) para definir qué instancia lanzar.

# Comando para crear un Auto Scaling Group (conceptual)
# aws autoscaling create-auto-scaling-group \
#   --auto-scaling-group-name MiASGWeb \
#   --launch-template "LaunchTemplateName=MiLaunchTemplateWeb,Version=1" \
#   --min-size 2 \                 # Mínimo 2 instancias siempre
#   --max-size 10 \                # Máximo 10 instancias
#   --desired-capacity 2 \         # Empezar con 2 instancias
#   --vpc-zone-identifier "subnet-0abcdef1234567890,subnet-0fedcba9876543210" \ # Subredes en distintas AZs
#   --health-check-type ELB \      # Usar Health Checks del Load Balancer
#   --health-check-grace-period 300 \ # Esperar 300 segundos antes de chequear salud
#   --target-group-arns arn:aws:elasticloadbalancing:us-east-1:123456789012:targetgroup/mi-aplicacion-tg/... \ # Asociar a un Target Group de ELB
#   --tags Key=Environment,Value=Production,PropagateAtLaunch=true \
#          Key=Application,Value=WebApp,PropagateAtLaunch=true

# Ejemplo de comportamiento del ASG (conceptual)
# Si una instancia en el ASG falla:
#   ASG detecta instancia "Unhealthy".
#   ASG termina la instancia fallida.
#   ASG lanza una nueva instancia para mantener la 'Desired Capacity'.

# Los ASGs son el pilar de la escalabilidad automática en AWS.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Servicios Básicos de Computación',
    'topic': 'Auto Scaling',
    'subtopic': 'Políticas de escalado',
    'definition': '''
Los Grupos de Auto Scaling (ASGs) son fantásticos para mantener un número deseado de instancias, pero para que escalen de forma dinámica en función de la demanda, necesitas definir "políticas de escalado". Estas políticas le dicen a tu ASG cuándo debe añadir o quitar instancias.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en si tu aplicación recibiera un pico de tráfico inesperado, y si no tuvieras políticas de escalado, tus servidores podrían quedarse sin recursos, llevando a una mala experiencia de usuario o incluso a la caída del servicio.

Aquí te va la aclaración:

Las políticas de escalado determinan cómo y cuándo un ASG ajusta su capacidad. AWS ofrece varios tipos de políticas:

1.  **Simple Scaling (Escalado Simple)**:
    * **Cómo funciona**: Responde a una única alarma de CloudWatch. Cuando la alarma se activa, el ASG añade o quita un número fijo de instancias, o un porcentaje de la capacidad actual.
    * **Ejemplo**: "Si el uso de CPU supera el 70% durante 5 minutos, añadir 2 instancias."
    * **Consideraciones**: Una vez que se activa, la política entra en "cooldown" (período de enfriamiento) para dar tiempo a que los cambios surtan efecto y evitar oscilaciones. Durante este tiempo, la política no se activa de nuevo.

2.  **Step Scaling (Escalado por Pasos)**:
    * **Cómo funciona**: También responde a alarmas de CloudWatch, pero permite definir diferentes "pasos" o ajustes de capacidad en función de cuán lejos esté la métrica del umbral.
    * **Ejemplo**: "Si el uso de CPU supera el 70%, añadir 2 instancias. Si supera el 90%, añadir 4 instancias."
    * **Consideraciones**: Más flexible que el escalado simple, ideal para respuestas más matizadas a cambios de carga. También usa un período de enfriamiento.

3.  **Target Tracking Scaling (Escalado de Rastreo de Destino)**:
    * **Cómo funciona**: Este es el tipo de política más recomendado para la mayoría de los casos. Le dices a AWS la métrica que quieres mantener en un objetivo específico (ej. "mantener el uso de CPU en 50%"). AWS Auto Scaling se encarga de ajustar el número de instancias para que la métrica se mantenga lo más cerca posible de ese objetivo.
    * **Ejemplo**: "Mantener el uso promedio de CPU en 60%."
    * **Consideraciones**: Es muy potente porque se ajusta automáticamente sin que necesites definir los umbrales de escalado. AWS calcula cuánto escalar.

4.  **Scheduled Scaling (Escalado Programado)**:
    * **Cómo funciona**: Permite escalar en función de un horario predefinido. Es útil para picos de demanda predecibles (ej. cada lunes por la mañana o durante eventos de temporada).
    * **Ejemplo**: "Todos los viernes a las 18:00, aumentar la capacidad mínima a 10 instancias."

La elección de la política de escalado adecuada depende de la naturaleza de tu carga de trabajo. Para la mayoría de las aplicaciones, el Target Tracking es un excelente punto de partida. Estas políticas son lo que hace que tu aplicación sea verdaderamente elástica y eficiente en costos.
''',
    'code_example': r'''
# Las políticas de escalado se asocian a un Auto Scaling Group.

# Comando para crear una política de escalado de Target Tracking (conceptual)
# Este es el tipo más recomendado para la mayoría de los casos.
# aws autoscaling put-scaling-policy \
#   --policy-name "CPU_Target_Tracking_Policy" \
#   --auto-scaling-group-name MiASGWeb \
#   --policy-type TargetTrackingScaling \
#   --target-tracking-configuration "PredefinedMetricSpecification={PredefinedMetricType=ASGAverageCPUUtilization},TargetValue=60.0" \
#   --estimated-instance-warmup 300 # Tiempo en segundos para que una instancia recién lanzada esté lista

# Comando para crear una política de escalado Simple (conceptual)
# aws autoscaling put-scaling-policy \
#   --policy-name "CPU_Scaling_Up_Simple" \
#   --auto-scaling-group-name MiASGWeb \
#   --policy-type SimpleScaling \
#   --scaling-adjustment 2 \  # Añadir 2 instancias
#   --cooldown 300 \          # Esperar 300 segundos antes de otra acción
#   --adjustment-type ChangeInCapacity

# Para que la política Simple Scaling funcione, necesitas una alarma de CloudWatch que la active:
# aws cloudwatch put-metric-alarm \
#   --alarm-name "High_CPU_Alarm" \
#   --metric-name "CPUUtilization" \
#   --namespace "AWS/EC2" \
#   --statistic "Average" \
#   --period 300 \
#   --threshold 70 \
#   --comparison-operator "GreaterThanOrEqualToThreshold" \
#   --dimensions "Name=AutoScalingGroupName,Value=MiASGWeb" \
#   --evaluation-periods 1 \
#   --alarm-actions "arn:aws:autoscaling:us-east-1:123456789012:scalingPolicy:..." # ARN de la política de escalado

# Ejemplo de escalado programado (conceptual)
# aws autoscaling put-scheduled-update-group-action \
#   --auto-scaling-group-name MiASGWeb \
#   --scheduled-action-name "Aumento_Fin_Semana" \
#   --start-time "2025-06-07T00:00:00Z" \
#   --recurrence "0 0 * * SAT" \ # Cada sábado a medianoche (UTC)
#   --min-size 4 \
#   --max-size 15 \
#   --desired-capacity 8

# Las políticas de escalado son lo que hace que tu aplicación sea verdaderamente elástica.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Servicios Básicos de Computación',
    'topic': 'Auto Scaling',
    'subtopic': 'Launch Templates',
    'definition': '''
Si recuerdas las AMIs como "moldes" para tus instancias EC2, un Launch Template (Plantilla de Lanzamiento) es el siguiente nivel de sofisticación para definir cómo deben lanzarse tus instancias. Es un contenedor que especifica todos los detalles necesarios para crear una instancia.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en si necesitaras lanzar cientos de servidores idénticos con una configuración muy específica; usar una plantilla asegura consistencia y evita errores manuales.

Aquí te va la aclaración:

Mientras que las antiguas "Launch Configurations" eran más simples, los Launch Templates son la forma moderna y más flexible de definir los parámetros para lanzar instancias EC2, especialmente con los Auto Scaling Groups.

Un Launch Template puede incluir, entre otras cosas:

* **ID de AMI**: La Amazon Machine Image que se usará como base.
* **Tipo de instancia**: El tipo de EC2 que deseas (ej. `t2.micro`, `m5.large`).
* **Key Pair**: El par de claves SSH para acceder a la instancia.
* **Security Groups**: Los grupos de seguridad para controlar el tráfico de red.
* **Volúmenes de almacenamiento (EBS)**: El tamaño y tipo de los discos que se adjuntarán.
* **Datos de usuario (User Data)**: Scripts que se ejecutan cuando la instancia se inicia por primera vez. Esto es increíblemente poderoso para automatizar la instalación de software, configuración de servicios o descargar código de tu aplicación.
* **Roles de IAM**: Permisos que la instancia tendrá para interactuar con otros servicios de AWS.
* **Configuraciones de red**: Detalles como la subred o si la instancia debe tener una IP pública.

**Ventajas clave de los Launch Templates:**

* **Versioning (Versionado)**: Puedes crear diferentes versiones de una misma plantilla. Esto te permite probar nuevas configuraciones, revertir a versiones anteriores fácilmente, y mantener un historial de tus cambios. Si necesitas actualizar un parámetro (ej. cambiar a un nuevo tipo de instancia), creas una nueva versión sin afectar a las existentes.
* **Flexibilidad**: Son más completos que las Launch Configurations, permitiendo especificar muchos más parámetros.
* **Reutilización**: Puedes usar el mismo Launch Template para crear instancias EC2 de forma manual o para que tus Auto Scaling Groups lancen nuevas instancias.

Al usar Launch Templates, te aseguras de que todas las instancias que lanza tu Auto Scaling Group (o las que lanzas manualmente) sean coherentes y estén configuradas de la misma manera, lo que simplifica la gestión y reduce los errores.
''',
    'code_example': r'''
# Los Launch Templates se crean y gestionan a través de la AWS Management Console o la AWS CLI.

# Ejemplo 1: Crear un Launch Template básico (conceptual)
# aws ec2 create-launch-template \
#   --launch-template-name MiPlantillaWeb \
#   --version-description "Version 1 for Web Servers" \
#   --launch-template-data '{
#       "ImageId": "ami-0abcdef1234567890",
#       "InstanceType": "t2.micro",
#       "KeyName": "MiPrimerKeySSH",
#       "SecurityGroupIds": ["sg-0abcdef1234567890"],
#       "UserData": "IyEvYmluL2Jhc2gNCnN1ZG8gYXB0LXBhY2tldCB1cGRhdGUNCnN1ZG8gYXB0LWdldCBpbnN0YWxsIC15IG5naW54DQpzdWRvIHN5c3RlbWN0bCBzdGFydCBuZ2lueA0K", # Base64 encoded: #!/bin/bash\nsudo apt-package update\nsudo apt-get install -y nginx\nsudo systemctl start nginx\n
#       "TagSpecifications": [
#           {"ResourceType": "instance", "Tags": [{"Key": "Purpose", "Value": "WebServer"}]}
#       ]
#   }'

# Ejemplo 2: Lanzar una instancia EC2 usando el Launch Template (conceptual)
# aws ec2 run-instances \
#   --launch-template "LaunchTemplateName=MiPlantillaWeb,Version=1" \
#   --count 1

# Ejemplo 3: Actualizar un Launch Template (crear una nueva versión) (conceptual)
# aws ec2 create-launch-template-version \
#   --launch-template-name MiPlantillaWeb \
#   --version-description "Version 2 - Updated Instance Type" \
#   --source-version 1 \ # Basado en la versión anterior
#   --launch-template-data '{
#       "InstanceType": "t3.medium" # Cambiar a un tipo de instancia más potente
#   }'

# Los Launch Templates son esenciales para la gestión de instancias y el Auto Scaling.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Servicios Básicos de Computación',
    'topic': 'Auto Scaling',
    'subtopic': 'Lifecycle Hooks',
    'definition': '''
Los Lifecycle Hooks, o Ganchos de Ciclo de Vida, en Auto Scaling son una característica avanzada que te permite pausar el lanzamiento o la terminación de instancias dentro de tu Auto Scaling Group. Esto te da la oportunidad de realizar acciones personalizadas en las instancias antes de que estén completamente disponibles o después de que se les haya ordenado terminar.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en si necesitas instalar software crítico, configurar un servidor web o hacer una copia de seguridad de datos justo antes de que un servidor se apague; los Lifecycle Hooks te dan ese control.

Aquí te va la aclaración:

Normalmente, cuando un Auto Scaling Group lanza o termina una instancia, lo hace de forma automática y rápida. Pero a veces, necesitas intervenir en ese proceso para realizar tareas específicas que no se pueden manejar solo con los datos de usuario o las políticas de escalado. Los Lifecycle Hooks te permiten hacer precisamente eso.

Hay dos tipos principales de Lifecycle Hooks:

1.  **`autoscaling:EC2_INSTANCE_LAUNCHING`**: Este gancho se activa cuando una instancia está a punto de ser lanzada por el ASG. La instancia se lanza, pero el ASG la mantiene en un estado "Pendiente de espera" (Pending:Wait) hasta que tú le indiques que puede continuar.
    * **Casos de uso**: Instalar software adicional que no está en la AMI base, registrar la instancia en un sistema de monitoreo externo, ejecutar pruebas de integración antes de que la instancia reciba tráfico, o configurar unirse a un dominio corporativo.

2.  **`autoscaling:EC2_INSTANCE_TERMINATING`**: Este gancho se activa cuando una instancia está a punto de ser terminada por el ASG. La instancia se detiene en un estado "Terminando:Espera" (Terminating:Wait) hasta que tú le indiques que puede proceder con la terminación.
    * **Casos de uso**: Drenar las conexiones activas para que los usuarios no se vean afectados (desregistrarla de un Load Balancer), guardar datos importantes, enviar registros a un sistema centralizado, o realizar un backup final de la instancia.

Cuando una instancia entra en el estado "Pendiente de espera" o "Terminando:Espera", el ASG envía una notificación (por ejemplo, a un tema de SNS o una cola SQS) para que tu lógica personalizada (como una función Lambda o un script) pueda actuar. Una vez que tu lógica termina, debes enviar una señal al ASG (complete-lifecycle-action) para que la instancia pueda continuar su ciclo de vida. Si no envías la señal dentro de un tiempo configurado (el tiempo de heartbeat), el ASG eventualmente forzará la continuación.

Los Lifecycle Hooks añaden un nivel de control y personalización a la automatización de Auto Scaling, lo que te permite manejar escenarios complejos de manera robusta.
''',
    'code_example': r'''
# Los Lifecycle Hooks se configuran en el Auto Scaling Group y se interactúan con ellos
# mediante notificaciones y comandos.

# Ejemplo 1: Crear un Lifecycle Hook para el lanzamiento de instancias (conceptual)
# aws autoscaling put-lifecycle-hook \
#   --lifecycle-hook-name "InstallSoftwareHook" \
#   --auto-scaling-group-name MiASGWeb \
#   --lifecycle-transition "autoscaling:EC2_INSTANCE_LAUNCHING" \
#   --notification-target-arn "arn:aws:sns:us-east-1:123456789012:MiTopicSNSParaHooks" \ # Donde se enviará la notificación
#   --default-result CONTINUE \ # Qué hacer si el hook falla o no se completa a tiempo
#   --heartbeat-timeout 300 # Tiempo en segundos para que tu lógica responda

# Cuando una instancia se lanza y el hook se activa, el ASG envía un evento SNS.
# Tu función Lambda (o script) que escucha este SNS se activaría.

# Ejemplo 2: Función Lambda para manejar el hook de lanzamiento (pseudocódigo Python)
# Esto se ejecutaría en respuesta a la notificación del Lifecycle Hook.
/*
import boto3

def lambda_handler(event, context):
    asg_client = boto3.client('autoscaling')
    # Parsear el evento SNS para obtener detalles del hook y la instancia
    message = json.loads(event['Records'][0]['Sns']['Message'])
    instance_id = message['EC2InstanceId']
    lifecycle_action_token = message['LifecycleActionToken']
    lifecycle_hook_name = message['LifecycleHookName']
    asg_name = message['AutoScalingGroupName']

    print(f"Instancia {instance_id} en estado LAUNCHING. Realizando tareas personalizadas...")

    try:
        # Aquí iría tu lógica personalizada, por ejemplo:
        # 1. Conectarse a la instancia y ejecutar un script de instalación
        # 2. Registrar la instancia en un DNS externo
        # 3. Realizar pruebas de pre-lanzamiento
        # time.sleep(60) # Simular una tarea larga

        # Una vez completado, enviar la señal al ASG para continuar
        asg_client.complete_lifecycle_action(
            LifecycleHookName=lifecycle_hook_name,
            AutoScalingGroupName=asg_name,
            LifecycleActionToken=lifecycle_action_token,
            InstanceId=instance_id,
            LifecycleActionResult='CONTINUE'
        )
        print(f"Señal 'CONTINUE' enviada para instancia {instance_id}")

    except Exception as e:
        print(f"Error procesando hook para instancia {instance_id}: {e}")
        # En caso de error, puedes optar por ABORT o CONTINUE
        asg_client.complete_lifecycle_action(
            LifecycleHookName=lifecycle_hook_name,
            AutoScalingGroupName=asg_name,
            LifecycleActionToken=lifecycle_action_token,
            InstanceId=instance_id,
            LifecycleActionResult='ABANDON' # Si la tarea falló y no quieres que la instancia se use
        )
*/

# Los Lifecycle Hooks te dan un control preciso sobre el ciclo de vida de tus instancias.
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Servicios Básicos de Computación',
    'topic': 'AWS Lambda',
    'subtopic': 'Conceptos de serverless',
    'definition': r'''
Pensemos por un momento en un mundo ideal donde no tienes que preocuparte por servidores. Imagina que tu aplicación simplemente existe en la nube, escalando automáticamente para manejar cualquier cantidad de tráfico, y solo pagas por el tiempo de ejecución real de tu código. Eso es precisamente lo que te ofrece el concepto de "serverless" en AWS Lambda.

Seguramente te estarás preguntando, ¿significa esto que no hay servidores? La realidad es que sí hay servidores, pero la gestión de la infraestructura subyacente corre por cuenta de AWS. Tú como desarrollador te enfocas únicamente en tu código y en la lógica de negocio, sin tener que provisionar, escalar, parchear o mantener servidores. Esto libera una cantidad considerable de tiempo y recursos, permitiéndote innovar más rápido y reducir costos operativos.

La filosofía serverless se basa en eventos. Esto significa que tu código (una función Lambda) se ejecuta en respuesta a un evento específico, como la carga de una imagen a un bucket de S3, una solicitud HTTP a través de API Gateway, o un mensaje en una cola de SQS. Cuando el evento ocurre, AWS Lambda "despierta" tu función, la ejecuta, y una vez que termina, la "duerme" de nuevo. Este modelo de pago por uso (pay-per-execution) es increíblemente eficiente y rentable, especialmente para cargas de trabajo impredecibles o picos de tráfico. Es una forma de construir aplicaciones altamente escalables y resilientes, sin la complejidad tradicional de la administración de servidores.
''',
    'code_example': r'''
// Ejemplo conceptual de una función Lambda en Node.js
exports.handler = async (event) => {
  // El 'event' contiene los datos que activaron la función
  console.log('Evento recibido:', JSON.stringify(event, null, 2));

  let responseBody = '';
  let statusCode = 200;

  try {
    if (event.httpMethod === 'GET') {
      responseBody = '¡Hola desde tu función Lambda serverless!';
    } else if (event.httpMethod === 'POST') {
      const requestBody = JSON.parse(event.body);
      responseBody = `Recibido POST con datos: ${requestBody.message}`;
    } else {
      throw new Error(`Método HTTP no soportado: ${event.httpMethod}`);
    }
  } catch (error) {
    statusCode = 400;
    responseBody = `Error: ${error.message}`;
    console.error('Error en la función:', error);
  }

  const response = {
    statusCode: statusCode,
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify(responseBody)
  };

  return response;
};

/*
Este ejemplo muestra cómo una función Lambda puede manejar diferentes tipos de solicitudes HTTP.
Lo importante es que no hay un servidor web ejecutándose constantemente; la función se activa
solo cuando llega una solicitud.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Servicios Básicos de Computación',
    'topic': 'AWS Lambda',
    'subtopic': 'Creación de funciones Lambda',
    'definition': r'''
Crear una función Lambda es un proceso bastante directo en la consola de AWS, aunque también puedes hacerlo a través de la AWS CLI o con herramientas de Infrastructure as Code como AWS CloudFormation o AWS SAM. Cuando vas a crear una, lo primero que harás es darle un nombre y elegir el "runtime", que es el entorno de ejecución para tu código. Esto puede ser Node.js, Python, Java, C#, Go, Ruby, o incluso un custom runtime si necesitas algo más específico.

Aquí te va la aclaración: una vez que defines el runtime, tienes que subir tu código. Puedes hacerlo directamente en la consola para funciones pequeñas, o empaquetarlo en un archivo ZIP si es más complejo y tiene dependencias. También es crucial configurar la memoria y el tiempo de espera (timeout) que tendrá tu función. Estos parámetros son importantes porque afectan directamente el costo y el rendimiento. Si tu función necesita procesar una gran cantidad de datos, le darás más memoria; si esperas que termine rápido, un timeout corto es suficiente.

Un aspecto fundamental en la creación es el "rol de ejecución". Este rol de IAM es lo que le da a tu función Lambda los permisos necesarios para interactuar con otros servicios de AWS, como escribir en un bucket de S3, leer de una tabla de DynamoDB, o enviar logs a CloudWatch. Sin los permisos adecuados, tu función no podrá realizar sus tareas. Es una práctica recomendada seguir el principio de mínimo privilegio al configurar este rol, dándole solo los permisos que realmente necesita.
''',
    'code_example': r'''
// Ejemplo conceptual de una función Lambda en Python
// Archivo: lambda_function.py
import json

def lambda_handler(event, context):
    """
    Este es el handler de la función Lambda.
    'event': Contiene los datos de entrada que activaron la función.
    'context': Proporciona métodos y propiedades para acceder a información de invocación,
               función y entorno.
    """
    print(f"Evento recibido: {json.dumps(event)}")

    # Simulación de una operación de procesamiento
    message = "Procesamiento completado por Lambda."
    if 'queryStringParameters' in event and 'name' in event['queryStringParameters']:
        name = event['queryStringParameters']['name']
        message = f"Hola, {name}! {message}"
    elif 'body' in event:
        try:
            body_data = json.loads(event['body'])
            if 'action' in body_data:
                message = f"Acción '{body_data['action']}' procesada. {message}"
        except json.JSONDecodeError:
            pass

    return {
        'statusCode': 200,
        'headers': {
            'Content-Type': 'application/json'
        },
        'body': json.dumps({
            'message': message,
            'event_received': event
        })
    }

# Para probar localmente (no se ejecuta en Lambda):
if __name__ == '__main__':
    test_event_get = {
        "httpMethod": "GET",
        "queryStringParameters": {"name": "Mundo"}
    }
    test_event_post = {
        "httpMethod": "POST",
        "body": '{"action": "saludar"}'
    }

    print("\n--- Resultado GET ---")
    print(lambda_handler(test_event_get, {}))

    print("\n--- Resultado POST ---")
    print(lambda_handler(test_event_post, {}))

/*
Este código de Python es un ejemplo básico de cómo se estructura una función Lambda.
El 'lambda_handler' es el punto de entrada que AWS Lambda invoca.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Servicios Básicos de Computación',
    'topic': 'AWS Lambda',
    'subtopic': 'Triggers básicos',
    'definition': r'''
Si pensamos en las funciones Lambda como pequeñas piezas de código, los "triggers" son el botón que las activa. Un trigger es el evento o la fuente de datos que invoca tu función Lambda. Sin un trigger, tu función simplemente estaría esperando, sin hacer nada. La belleza de Lambda reside en su integración nativa con una vasta cantidad de servicios de AWS, lo que permite que tu función reaccione a casi cualquier cosa que suceda en tu entorno en la nube.

Seguramente pensarás de qué va todo esto... pues bien, un trigger puede ser tan simple como una nueva imagen subida a un bucket de S3, lo que automáticamente activa una función Lambda para procesarla y, por ejemplo, crear miniaturas. O puede ser un mensaje que llega a una cola de SQS, haciendo que tu función procese ese mensaje. Otros triggers comunes incluyen: solicitudes HTTP entrantes a través de Amazon API Gateway, cambios en una tabla de Amazon DynamoDB (mediante DynamoDB Streams), eventos programados (como una tarea cron) usando Amazon EventBridge, o incluso métricas de Amazon CloudWatch que superan un umbral.

La configuración de un trigger es vital porque define cuándo y cómo se ejecutará tu función. Por ejemplo, al configurar un trigger de S3, especificarás qué bucket y qué tipos de eventos (creación, eliminación de objetos, etc.) deben invocar tu función. Para un trigger de API Gateway, definirás la ruta y el método HTTP. Entender cómo funcionan los triggers y cómo configurarlos correctamente es fundamental para diseñar arquitecturas serverless eficientes y reactivas.
''',
    'code_example': r'''
// No hay código directo para "triggers" ya que son configuraciones en AWS.
// Sin embargo, aquí hay un ejemplo conceptual de cómo un evento S3 podría
// ser recibido por una función Lambda (como se vería en el 'event' objeto).

/*
Ejemplo de un objeto 'event' cuando una imagen es subida a S3:
{
  "Records": [
    {
      "eventVersion": "2.1",
      "eventSource": "aws:s3",
      "awsRegion": "us-east-1",
      "eventTime": "2025-06-02T15:00:00.000Z",
      "eventName": "ObjectCreated:Put",
      "userIdentity": {
        "principalId": "AWS:AIDACKCEVSQ6EXAMPLE"
      },
      "requestParameters": {
        "sourceIPAddress": "192.0.2.1"
      },
      "responseElements": {
        "x-amz-request-id": "C3D13FE58DE4C810",
        "x-amz-id-2": "FMyUVOpzG6kseK3XJxYc...",
      },
      "s3": {
        "s3SchemaVersion": "1.0",
        "configurationId": "testConfigRule",
        "bucket": {
          "name": "my-example-bucket", // Nombre del bucket donde se subió el objeto
          "ownerIdentity": {
            "principalId": "A3NL1KPKR0EXAMPLE"
          },
          "arn": "arn:aws:s3:::my-example-bucket"
        },
        "object": {
          "key": "photos/image.jpg", // Ruta y nombre del objeto subido
          "size": 1024,
          "eTag": "b2f1e2f7c0d5a3f2b1c0d5e6a7f8b9c0",
          "sequencer": "0065F6B4C4C1087F84"
        }
      }
    }
  ]
}

Este JSON representa los datos que AWS Lambda pasa a tu función
cuando se activa por un evento de creación de objeto en S3.
Tu código de Lambda procesaría la información dentro de este 'event' para saber qué hacer.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Servicios Básicos de Computación',
    'topic': 'AWS Lambda',
    'subtopic': 'Configuración básica',
    'definition': r'''
La configuración básica de una función Lambda implica una serie de ajustes que definen cómo se comportará y operará tu código en la nube. Más allá de solo subir tu código, necesitas afinar detalles que impactan directamente el rendimiento, los costos y la capacidad de tu función para interactuar con otros servicios. Esto tiene una explicación, y es porque Lambda, aunque es serverless, necesita saber los límites y permisos bajo los cuales debe operar.

Entre los ajustes más importantes está la "Memoria" asignada a tu función. Esto no solo determina la RAM disponible, sino que también afecta directamente la CPU que se le asigna. Más memoria generalmente significa un rendimiento más rápido, pero también un costo más alto. El "Tiempo de espera" (Timeout) es otro parámetro crítico; es el tiempo máximo que tu función esperará para completarse antes de ser terminada. Es fundamental establecerlo adecuadamente para evitar que las funciones se ejecuten indefinidamente (y generen costos innecesarios) o que se detengan prematuramente.

Adicionalmente, el "Rol de ejecución" de IAM, como ya mencionamos, es lo que le otorga a tu función los permisos para acceder a otros servicios de AWS. Puedes configurar variables de entorno para pasar información dinámica a tu código sin tener que modificarlo, lo cual es muy útil para entornos de desarrollo, pruebas y producción. También puedes habilitar y configurar la "Red" (VPC) si tu función necesita acceder a recursos privados dentro de tu Virtual Private Cloud, como bases de datos RDS o instancias EC2. Finalmente, la gestión de "Logs" y "Métricas" es esencial para monitorear el comportamiento de tu función; AWS Lambda se integra automáticamente con Amazon CloudWatch para esto.
''',
    'code_example': r'''
// No hay código de programación directo para la "configuración básica" de Lambda.
// Esto se maneja a través de la consola de AWS, AWS CLI o IaC (Infrastructure as Code).

/*
Ejemplo de cómo se vería la configuración en la consola de AWS (conceptual):

- **Nombre de la función:** my-image-processor-function
- **Runtime:** Node.js 20.x
- **Arquitectura:** arm64 (Graviton2)
- **Controlador:** index.handler (archivo.método)
- **Memoria (MB):** 256 MB (configurable de 128 MB a 10240 MB)
- **Tiempo de espera (segundos):** 30 segundos (configurable hasta 15 minutos)
- **Rol de ejecución:** Crear un nuevo rol con permisos básicos de Lambda (o usar uno existente)
  - Permisos: S3 ReadOnlyAccess, CloudWatchPutMetricData
- **Variables de entorno:**
  - BUCKET_NAME: my-processed-images-bucket
  - LOG_LEVEL: INFO
- **VPC:** No configurada (o configurada si necesita acceso a recursos privados)
- **Concurrencia:** Sin límite (o con un límite específico para controlar el escalado)
- **Capas:** Ninguna (o capas para dependencias y código compartido)
- **Destinos:** No configurado (o configurado para enviar resultados a otro servicio)

Esta es una representación de los parámetros que se ajustarían al configurar una función Lambda.
*/
'''
  });
}

Future<void> insertJrLevel3AwsData(Database db) async {
  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Almacenamiento en AWS',
    'topic': 'Amazon S3',
    'subtopic': 'Conceptos de almacenamiento de objetos',
    'definition': r'''
Pensemos en cómo guardamos las cosas en la nube. Amazon S3, que significa Simple Storage Service, es el servicio de almacenamiento de objetos estrella de AWS. No es como el disco duro de tu computadora donde organizas archivos en carpetas dentro de un sistema de archivos tradicional; en S3, todo se guarda como "objetos".

Aquí te va la aclaración: un objeto en S3 es simplemente un archivo (puede ser una imagen, un video, un documento, una copia de seguridad, etc.) junto con algunos metadatos, que son datos sobre ese archivo, como la fecha de creación, el tipo de contenido, etc. Todos estos objetos se guardan dentro de "buckets". Puedes ver un bucket como un contenedor lógico para tus objetos. El nombre de cada bucket debe ser único a nivel global en S3, lo que asegura que no haya confusiones.

La gran ventaja del almacenamiento de objetos es su escalabilidad casi ilimitada y su durabilidad. Puedes guardar petabytes de datos sin preocuparte por la infraestructura subyacente. Además, S3 está diseñado para una durabilidad del 99.999999999% (once nueves), lo que significa que tus datos están replicados en múltiples ubicaciones dentro de una región, minimizando el riesgo de pérdida. Es ideal para almacenar contenido web estático, copias de seguridad, archivos para aplicaciones móviles y como base para data lakes. Cuando necesitas acceder a un objeto, lo haces a través de una URL única, lo que lo hace muy accesible desde cualquier lugar con conexión a internet.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart, sino una representación de
// cómo interactuarías con S3 usando un SDK (por ejemplo, AWS SDK for Python - Boto3)

// Ejemplo conceptual: Subir un objeto a S3
/*
import boto3

s3 = boto3.client('s3')
bucket_name = 'mi-bucket-unico-de-ejemplo'
file_name = 'documento.txt'
object_key = 'mis_archivos/documento.txt' # La "ruta" o clave del objeto

try:
    # Crear el bucket (si no existe)
    s3.create_bucket(Bucket=bucket_name)
    print(f"Bucket '{bucket_name}' creado exitosamente.")
except s3.exceptions.BucketAlreadyOwnedByYou:
    print(f"Bucket '{bucket_name}' ya existe, continuando.")
except Exception as e:
    print(f"Error al crear bucket: {e}")

# Subir el archivo
try:
    s3.upload_file(file_name, bucket_name, object_key)
    print(f"Archivo '{file_name}' subido a s3://{bucket_name}/{object_key}")
except Exception as e:
    print(f"Error al subir archivo: {e}")

# Ejemplo conceptual: Descargar un objeto de S3
download_file_name = 'documento_descargado.txt'
try:
    s3.download_file(bucket_name, object_key, download_file_name)
    print(f"Archivo '{object_key}' descargado como '{download_file_name}'")
except Exception as e:
    print(f"Error al descargar archivo: {e}")

// Ejemplo de un error común: Intentar acceder a un objeto con una clave incorrecta
try:
    s3.download_file(bucket_name, 'mis_archivos/archivo_no_existente.txt', 'temp.txt')
except s3.exceptions.ClientError as e:
    if e.response['Error']['Code'] == "404":
        print("Error: El objeto no existe en S3.")
    else:
        print(f"Otro error de S3: {e}")
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Almacenamiento en AWS',
    'topic': 'Amazon S3',
    'subtopic': 'Clases de almacenamiento S3',
    'definition': r'''
Cuando hablamos de Amazon S3, no solo es un lugar para guardar tus archivos, sino que también te ofrece diferentes "clases de almacenamiento". Esto es súper útil porque no todos tus datos tienen las mismas necesidades de acceso o el mismo presupuesto, y AWS lo sabe.

¿Te estás preguntando por qué esto importa? Pues bien, la idea principal es que pagues solo por lo que necesitas. Si tienes datos a los que accedes muy a menudo, querrás una clase de almacenamiento que te dé un acceso rápido. Si, por el contrario, tienes datos que apenas tocas (como copias de seguridad de hace años o archivos para cumplir regulaciones), hay clases más baratas que están optimizadas para un acceso infrecuente. La elección de la clase de almacenamiento correcta puede significar un ahorro considerable en tus facturas de AWS.

Vamos a ver de qué se trata todo esto con las clases más comunes:
* **S3 Standard**: Es la clase por defecto y la más versátil. Ideal para datos a los que accedes frecuentemente, como sitios web, aplicaciones móviles o contenido dinámico. Ofrece alta durabilidad, disponibilidad y rendimiento.
* **S3 Intelligent-Tiering**: Esta clase es un poco mágica. Mueve automáticamente tus datos entre dos niveles de acceso (frecuente e infrecuente) basándose en tus patrones de uso. Si dejas de acceder a un objeto, lo mueve a un nivel más barato; si vuelves a acceder, lo devuelve al nivel más costoso pero rápido. Es perfecto si tus patrones de acceso son impredecibles.
* **S3 Standard-IA (Infrequent Access)**: Pensada para datos a los que accedes con poca frecuencia, pero que cuando los necesitas, los requieres rápidamente. Es más barata que S3 Standard, pero tiene un pequeño costo por recuperación de datos. Funciona bien para copias de seguridad de largo plazo o datos de archivo a los que podrías necesitar acceso ocasional.
* **S3 One Zone-IA**: Similar a Standard-IA, pero los datos se almacenan en una sola Zona de Disponibilidad. Es aún más económica, pero si esa Zona de Disponibilidad sufre una interrupción, podrías perder los datos. Útil para datos no críticos que puedes recrear fácilmente.
* **S3 Glacier y S3 Glacier Deep Archive**: Estas son las clases para el archivo a largo plazo. Son las más baratas, pero la recuperación de datos toma más tiempo (desde minutos hasta horas). Son ideales para cumplimiento normativo, copias de seguridad históricas o cualquier dato que rara vez necesites acceder.

Elegir la clase adecuada al subir tus objetos es clave para optimizar tus costos y asegurarte de que tus datos estén disponibles cuando los necesitas.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart, sino un ejemplo conceptual en Python (boto3)
// de cómo especificar una clase de almacenamiento al subir un archivo.

/*
import boto3

s3 = boto3.client('s3')
bucket_name = 'mi-bucket-ejemplo-clases'
file_to_upload = 'mi_informe_anual.pdf'
object_key = 'informes/2024/informe_anual.pdf'

# Subir un archivo usando S3 Standard (por defecto)
try:
    s3.upload_file(file_to_upload, bucket_name, object_key)
    print(f"Subido a S3 Standard: s3://{bucket_name}/{object_key}")
except Exception as e:
    print(f"Error al subir a S3 Standard: {e}")

# Subir el mismo archivo pero con la clase de almacenamiento S3 Standard-IA
object_key_ia = 'informes/2024/informe_anual_ia.pdf'
try:
    s3.upload_file(
        file_to_upload,
        bucket_name,
        object_key_ia,
        ExtraArgs={'StorageClass': 'STANDARD_IA'} # Aquí se define la clase
    )
    print(f"Subido a S3 Standard-IA: s3://{bucket_name}/{object_key_ia}")
except Exception as e:
    print(f"Error al subir a S3 Standard-IA: {e}")

# Ejemplo de cómo podrías enviar algo a GLACIER (no con upload_file directamente)
# Normalmente, se usaría un lifecycle policy para mover objetos a Glacier automáticamente
# o un método específico para subir a Glacier (put_object con StorageClass 'GLACIER')

# INCORRECTO: Intentar usar una clase de almacenamiento no válida o mal escrita
# try:
#     s3.upload_file(
#         file_to_upload,
#         bucket_name,
#         'bad_class.pdf',
#         ExtraArgs={'StorageClass': 'SUPER_ARCHIVE'} # 'SUPER_ARCHIVE' no existe
#     )
# except Exception as e:
#     print(f"Error (esperado) por clase de almacenamiento inválida: {e}")
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Almacenamiento en AWS',
    'topic': 'Amazon S3',
    'subtopic': 'Versionado',
    'definition': r'''
Pensemos por un momento que estás trabajando en un documento importante y, por accidente, lo sobrescribes con una versión antigua o simplemente lo borras. ¡Qué desastre! En un sistema de archivos normal, eso sería un gran problema. Pero en Amazon S3, gracias al "versionado", eso es mucho menos probable que suceda.

El versionado en S3 te permite mantener múltiples versiones de un objeto dentro del mismo bucket. Cuando habilitas el versionado en un bucket, cada vez que modificas o eliminas un objeto, S3 no lo sobrescribe ni lo borra de forma permanente de inmediato. En su lugar, guarda una nueva versión del objeto o marca la versión actual como "eliminada". Esto significa que tienes un historial completo de todas las versiones de tus objetos.

¿Te estás preguntando por qué esto importa? Esto tiene una explicación, y es porque el versionado es una herramienta increíblemente poderosa para la recuperación de datos y la protección contra eliminaciones accidentales o sobrescrituras no deseadas. Si un usuario sube una versión incorrecta de un archivo, o incluso lo elimina por error, puedes simplemente revertir a una versión anterior del objeto o recuperar una versión "eliminada". Cada versión de un objeto tiene un ID de versión único, lo que te permite identificar y recuperar versiones específicas. Eso sí, ten en cuenta que almacenar múltiples versiones de un objeto puede incrementar tus costos de almacenamiento, así que úsalo cuando la recuperación de datos sea crucial. Muchas empresas lo utilizan para sus copias de seguridad de aplicaciones web, asegurando que siempre haya un punto de restauración.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart, sino un ejemplo conceptual en Python (boto3)
// para mostrar cómo funciona el versionado en S3.

/*
import boto3

s3 = boto3.client('s3')
bucket_name = 'mi-bucket-con-versionado'
object_key = 'documento_importante.txt'

# NOTA: El versionado se habilita a nivel de bucket en la consola de AWS
# o programáticamente una vez.
# s3.put_bucket_versioning(Bucket=bucket_name, VersioningConfiguration={'Status': 'Enabled'})

# Crear la primera versión del objeto
content_v1 = "Esta es la versión 1 de mi documento."
s3.put_object(Bucket=bucket_name, Key=object_key, Body=content_v1)
print(f"Subida Versión 1 de '{object_key}'")

# Crear una segunda versión (sobrescribe lógicamente la anterior, pero la v1 se mantiene)
content_v2 = "Esta es la versión 2 de mi documento, con cambios."
s3.put_object(Bucket=bucket_name, Key=object_key, Body=content_v2)
print(f"Subida Versión 2 de '{object_key}'")

# Listar todas las versiones del objeto
print("\nVersiones de mi_documento.txt:")
response = s3.list_object_versions(Bucket=bucket_name, Prefix=object_key)
for version in response.get('Versions', []):
    print(f"- VersionId: {version['VersionId']}, LastModified: {version['LastModified']}, IsLatest: {version['IsLatest']}")

# Recuperar una versión específica (necesitas el VersionId de la versión 1)
# Para este ejemplo, simularíamos que conocemos el ID de la primera versión.
# En un escenario real, lo obtendrías del listado anterior.
# Supongamos que version_id_v1 es el ID de la primera versión
# s3.get_object(Bucket=bucket_name, Key=object_key, VersionId=version_id_v1)
# print(f"Recuperada Versión 1 de '{object_key}'")

# Ejemplo de "eliminación": S3 agrega un marcador de eliminación
# El objeto no se elimina realmente, sino que se crea una nueva versión (marcador)
s3.delete_object(Bucket=bucket_name, Key=object_key)
print(f"\nSe ha 'eliminado' lógicamente '{object_key}'.")

# Listar de nuevo para ver el marcador de eliminación
print("Versiones después de la 'eliminación':")
response = s3.list_object_versions(Bucket=bucket_name, Prefix=object_key)
for version in response.get('Versions', []):
    print(f"- VersionId: {version['VersionId']}, LastModified: {version['LastModified']}, IsLatest: {version['IsLatest']}, IsDeleteMarker: {version.get('IsDeleteMarker', False)}")

# INCORRECTO: Intentar deshabilitar el versionado directamente
# Una vez habilitado, solo se puede suspender. Deshabilitarlo borraría todas las versiones pasadas.
# s3.put_bucket_versioning(Bucket=bucket_name, VersioningConfiguration={'Status': 'Suspended'})
# print("Versionado suspendido.")
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Almacenamiento en AWS',
    'topic': 'Amazon S3',
    'subtopic': 'Políticas de acceso',
    'definition': r'''
Pensemos en S3 no solo como un lugar para guardar tus fotos de las vacaciones, sino como un almacén gigantesco donde podrías tener desde datos confidenciales de clientes hasta archivos públicos de un sitio web. La pregunta clave es: ¿cómo controlas quién puede ver qué y quién puede hacer qué con tus objetos? Aquí es donde entran las "Políticas de acceso" en Amazon S3.

No sé tú, pero a mí esto al principio me costó 🤯. Las políticas de acceso son como las reglas de seguridad de tu almacén. Son documentos en formato JSON que defines para especificar permisos, quién tiene esos permisos y qué acciones puede realizar sobre qué recursos. Hay dos tipos principales de políticas que usarás con S3:

1.  **Políticas de Bucket (Bucket Policies)**: Estas políticas se adjuntan directamente a un bucket de S3. Son perfectas para controlar el acceso a nivel de bucket y a los objetos dentro de él. Por ejemplo, podrías crear una política de bucket para permitir que solo ciertos usuarios de IAM de tu cuenta puedan subir archivos, o para hacer que todos los objetos en un bucket sean públicos (como un sitio web estático). Son muy potentes porque controlan el acceso para todos los objetos en el bucket al que están adjuntas.

2.  **Políticas de IAM (Identity and Access Management)**: Estas políticas se adjuntan a usuarios, grupos o roles de IAM. En lugar de adjuntarse al bucket, se adjuntan a la "identidad" que intenta acceder a S3. Por ejemplo, podrías tener una política de IAM que le dé a un usuario específico permiso para leer objetos de un bucket, pero no para eliminarlos. Las políticas de IAM son más granulares a nivel de usuario/rol, mientras que las de bucket son más amplias para el bucket en sí.

Además de estas, existen las "Listas de Control de Acceso (ACLs)" y "Query String Authentication", pero las políticas de bucket y las de IAM son las formas más comunes y recomendadas para gestionar la seguridad en S3 debido a su flexibilidad y poder. Entender cómo se combinan estas políticas es crucial para asegurar tus datos y garantizar que solo las entidades autorizadas tengan acceso.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart, sino un ejemplo conceptual de una política de bucket S3.

/*
// Ejemplo de una Política de Bucket S3 para hacer que los objetos sean públicos (lectura)
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject", // Identificador de la declaración
      "Effect": "Allow",          // Permitir la acción
      "Principal": "*",           // A cualquier persona (público)
      "Action": "s3:GetObject",   // La acción permitida es leer objetos
      "Resource": "arn:aws:s3:::your-unique-bucket-name/*" // En este bucket y todos sus objetos
                                                         // Reemplaza 'your-unique-bucket-name'
    }
  ]
}

// Ejemplo de una Política IAM para permitir a un usuario subir y eliminar objetos en un bucket específico
// Esta política se adjuntaría a un usuario o rol de IAM, NO al bucket.
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowS3UploadAndDelete",
      "Effect": "Allow",
      "Action": [
        "s3:PutObject",       // Permite subir objetos
        "s3:DeleteObject"     // Permite eliminar objetos
      ],
      "Resource": "arn:aws:s3:::my-specific-bucket-for-uploads/*"
    }
  ]
}

// Ejemplo INCORRECTO de una política: Dar permisos de escritura a todos (muy peligroso)
// {
//   "Version": "2012-10-17",
//   "Statement": [
//     {
//       "Sid": "PublicWriteAccess",
//       "Effect": "Allow",
//       "Principal": "*",
//       "Action": "s3:PutObject", // ¡Permite que cualquiera suba archivos!
//       "Resource": "arn:aws:s3:::your-bucket-name/*"
//     }
//   ]
// }
// Esto es un error de seguridad grave si no es intencional y controlado.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Almacenamiento en AWS',
    'topic': 'Amazon EBS',
    'subtopic': 'Tipos de volúmenes EBS',
    'definition': r'''
Pensemos por un momento que tienes un servidor virtual en la nube (una instancia EC2 de AWS) y necesitas un disco duro para guardar tus programas, la base de datos de tu aplicación o simplemente tus archivos. Ahí es donde entran en juego los "Volúmenes EBS". Amazon EBS, que significa Elastic Block Store, es como el disco duro de la nube para tus instancias EC2.

Aquí te va la aclaración: a diferencia de S3, que es para almacenamiento de objetos, EBS es un almacenamiento a nivel de bloque, lo que significa que se comporta como un disco duro tradicional que puedes adjuntar a una sola instancia EC2. Lo interesante es que AWS te ofrece diferentes "tipos de volúmenes EBS", cada uno optimizado para distintas cargas de trabajo y necesidades de rendimiento. Esto es súper útil porque no todas las aplicaciones necesitan el mismo tipo de "disco", y elegir el correcto te ayuda a optimizar tanto el rendimiento como el costo.

Vamos a ver de qué se trata todo esto con los tipos más comunes:

* **SSD de propósito general (gp2/gp3)**: Estos son los caballos de batalla. Ideales para la mayoría de las cargas de trabajo transaccionales, como servidores web, bases de datos de desarrollo/prueba y entornos de arranque. Ofrecen un buen equilibrio entre precio y rendimiento. `gp3` es la versión más nueva y generalmente recomendada, ya que te permite provisionar IOPS y rendimiento de manera independiente.
* **SSD de IOPS aprovisionadas (io1/io2)**: Cuando el rendimiento es crítico y necesitas una cantidad garantizada de operaciones de entrada/salida por segundo (IOPS), estos son tus volúmenes. Son perfectos para bases de datos transaccionales grandes y de alto rendimiento, como SQL o NoSQL, donde cada milisegundo cuenta. `io2 Block Express` es la opción de mayor rendimiento y con mayor durabilidad.
* **HDD optimizados para rendimiento (st1)**: Diseñados para cargas de trabajo secuenciales grandes, como data warehousing, procesamiento de logs o aplicaciones de big data que requieren un alto throughput (rendimiento de datos). No son ideales para operaciones de lectura/escritura aleatorias rápidas.
* **HDD en frío (sc1)**: La opción más económica para datos a los que se accede con poca frecuencia y que no necesitan un rendimiento alto. Útiles para copias de seguridad de datos grandes o archivos que rara vez se acceden y donde el costo es la prioridad principal.

Elegir el tipo de volumen EBS correcto es una decisión importante que impactará directamente la capacidad de respuesta de tu aplicación y tu factura de AWS.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart, sino una representación conceptual
// de cómo se especificaría un tipo de volumen EBS al lanzar una instancia EC2
// usando el AWS SDK (por ejemplo, con Python Boto3 o AWS CLI).

/*
# Ejemplo conceptual con AWS CLI (Command Line Interface)
# Para crear una instancia EC2 con un volumen gp3 de 100 GB

# aws ec2 run-instances \
#   --image-id ami-0abcdef1234567890 \ # Reemplaza con una AMI válida
#   --instance-type t2.micro \
#   --key-name my-key-pair \ # Reemplaza con tu par de claves
#   --block-device-mappings \
#     "DeviceName=/dev/sda1,Ebs={VolumeSize=100,VolumeType=gp3,Iops=3000,Throughput=125}" \
#   --count 1

# Explicación del --block-device-mappings:
# DeviceName: El nombre del dispositivo en el sistema operativo de la instancia.
# Ebs: Bloque de configuración para el volumen EBS.
#   VolumeSize: Tamaño del volumen en GB (aquí, 100 GB).
#   VolumeType: Tipo de volumen (aquí, gp3).
#   Iops: Operaciones de entrada/salida por segundo (solo para gp3, io1, io2).
#   Throughput: Rendimiento en MB/s (solo para gp3).

# Ejemplo de un error común: Especificar IOPS para un tipo de volumen que no lo soporta
# aws ec2 run-instances \
#   --image-id ami-0abcdef1234567890 \
#   --instance-type t2.micro \
#   --block-device-mappings \
#     "DeviceName=/dev/sda1,Ebs={VolumeSize=500,VolumeType=st1,Iops=1000}" \
#   --count 1
# Esto fallaría porque 'st1' (HDD optimizado para rendimiento) no permite IOPS aprovisionadas,
# ya que está diseñado para throughput secuencial. Los IOPS solo son relevantes para los tipos SSD.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Almacenamiento en AWS',
    'topic': 'Amazon EBS',
    'subtopic': 'Snapshots',
    'definition': r'''
Pensemos en los "snapshots" de EBS como las fotos que le tomas a tus discos duros en la nube. Un snapshot es una copia de seguridad puntual de tu volumen EBS en un momento específico. Es una forma increíblemente útil de crear puntos de restauración de tus datos.

¿Te estás preguntando por qué esto importa? Esto tiene una explicación, y es que los snapshots son cruciales para la recuperación ante desastres, la migración de datos y la creación de entornos de desarrollo/prueba consistentes. Si tu servidor EC2 sufre un problema o tus datos se corrompen, puedes restaurar un volumen EBS a partir de un snapshot anterior, volviendo a un estado funcional. Además, los snapshots son incrementales, lo que significa que solo se guardan los bloques de datos que han cambiado desde el último snapshot. Esto hace que sean eficientes en el almacenamiento y, por lo tanto, en el costo.

Cuando creas un snapshot, no detiene tu instancia EC2 ni desmonta el volumen, lo que permite que tu aplicación siga funcionando mientras se realiza la copia de seguridad (aunque para aplicaciones con muchas escrituras, es buena práctica pausar la escritura por un momento para asegurar la consistencia). Los snapshots se guardan en Amazon S3, lo que les da la durabilidad y disponibilidad de S3, pero tú no los gestionas directamente en S3; los manejas a través de la interfaz de EBS. Desde un snapshot, puedes crear un nuevo volumen EBS de cualquier tamaño dentro de la misma Región de AWS, o incluso copiar el snapshot a otra Región para fines de recuperación ante desastres en múltiples ubicaciones.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart, sino un ejemplo conceptual con AWS CLI
// de cómo trabajar con snapshots de EBS.

/*
# aws ec2 describe-volumes # Obtener el ID de tu volumen EBS

# Ejemplo: Crear un snapshot de un volumen EBS
# Reemplaza 'vol-0abcdef1234567890' con el ID de tu volumen EBS
# aws ec2 create-snapshot \
#   --volume-id vol-0abcdef1234567890 \
#   --description "Snapshot para respaldo diario de base de datos" \
#   --tag-specifications 'ResourceType=snapshot,Tags=[{Key=Name,Value=DailyBackup}]'

# Ejemplo: Listar los snapshots de tus volúmenes
# aws ec2 describe-snapshots --owner-ids self

# Ejemplo: Restaurar un nuevo volumen a partir de un snapshot
# Reemplaza 'snap-0abcdef1234567890' con el ID de tu snapshot
# Reemplaza 'us-east-1a' con tu Availability Zone
# aws ec2 create-volume \
#   --snapshot-id snap-0abcdef1234567890 \
#   --availability-zone us-east-1a \
#   --volume-type gp3 \
#   --size 100 \
#   --tag-specifications 'ResourceType=volume,Tags=[{Key=Name,Value=RestoredVolume}]'

# Ejemplo de un error común: Intentar crear un snapshot de un volumen que no existe
# aws ec2 create-snapshot --volume-id vol-no-existente --description "Esto fallará"
# Este comando resultaría en un error porque el ID del volumen no es válido.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Almacenamiento en AWS',
    'topic': 'Amazon EBS',
    'subtopic': 'Encryption',
    'definition': r'''
Pensemos en la seguridad de tus datos. Cuando guardas información en un disco duro, quieres asegurarte de que nadie más pueda acceder a ella, incluso si logran poner sus manos en el disco físico o una copia de él. En la nube, esa "protección" se logra con el "Encryption" o cifrado de tus volúmenes EBS.

Aquí te va la aclaración: la encriptación de EBS significa que tus datos en reposo (cuando están almacenados) y en tránsito (cuando se mueven entre el volumen EBS y la instancia EC2) están protegidos mediante cifrado. Esto añade una capa crucial de seguridad, asegurando que si alguien no autorizado lograra acceder a tus datos, estos serían ilegibles sin la clave de cifrado. AWS se encarga de todo el proceso de cifrado y descifrado de forma transparente, lo que significa que no necesitas hacer cambios en tu código o en tus aplicaciones para que funcionen con volúmenes cifrados.

Puedes cifrar un volumen EBS al crearlo, o incluso cifrar un snapshot y luego restaurar un volumen cifrado a partir de él. AWS utiliza AWS Key Management Service (KMS) para gestionar las claves de cifrado. Puedes usar claves administradas por AWS o crear tus propias claves KMS. Esto es súper importante para el cumplimiento de normativas de seguridad (como GDPR, HIPAA, etc.) y para proteger datos sensibles. Una vez que un volumen EBS está cifrado, todos los snapshots creados a partir de él también estarán cifrados, y cualquier volumen restaurado de esos snapshots también lo estará. Es una práctica recomendada cifrar tus volúmenes EBS siempre que sea posible, especialmente si manejas datos confidenciales.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart, sino un ejemplo conceptual con AWS CLI
// de cómo crear un volumen EBS cifrado.

/*
# Ejemplo: Crear un nuevo volumen EBS con cifrado
# aws ec2 create-volume \
#   --volume-type gp3 \
#   --size 50 \
#   --availability-zone us-east-1a \ # Reemplaza con tu AZ
#   --encrypted \                   # Aquí se habilita el cifrado
#   --tag-specifications 'ResourceType=volume,Tags=[{Key=Name,Value=EncryptedDataVolume}]'

# Si quieres usar una clave KMS específica (en lugar de la clave por defecto de AWS)
# Reemplaza 'arn:aws:kms:us-east-1:123456789012:key/your-kms-key-id' con tu ARN de clave KMS
# aws ec2 create-volume \
#   --volume-type gp3 \
#   --size 50 \
#   --availability-zone us-east-1a \
#   --encrypted \
#   --kms-key-id arn:aws:kms:us-east-1:123456789012:key/your-kms-key-id \
#   --tag-specifications 'ResourceType=volume,Tags=[{Key=Name,Value=CustomKMSVolume}]'

# Ejemplo: Copiar un snapshot y cifrarlo en el proceso (si el original no estaba cifrado)
# Reemplaza 'snap-0abcdef1234567890' con el ID de tu snapshot original
# aws ec2 copy-snapshot \
#   --source-snapshot-id snap-0abcdef1234567890 \
#   --destination-region us-east-1 \
#   --encrypted \
#   --description "Copia cifrada de snapshot"

# Ejemplo de un error común: Intentar descifrar un volumen cifrado directamente
# No puedes "descifrar" un volumen una vez que está cifrado en AWS.
# Si necesitas una copia sin cifrar, tendrías que restaurarlo a una instancia EC2,
# copiar los datos a un nuevo volumen sin cifrar y luego eliminar el volumen cifrado original.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Almacenamiento en AWS',
    'topic': 'Amazon EBS',
    'subtopic': 'Rendimiento EBS',
    'definition': r'''
Pensemos en cómo de rápido responde tu disco duro en la nube. El "rendimiento de EBS" se refiere a la velocidad y eficiencia con la que tus volúmenes EBS pueden leer y escribir datos. No es solo cuestión de capacidad de almacenamiento, sino de cuán rápido pueden fluir esos datos entre tu instancia EC2 y el volumen. Un buen rendimiento es clave para que tus aplicaciones respondan rápidamente y tus bases de datos funcionen sin problemas.

Aquí te va la aclaración: el rendimiento de un volumen EBS se mide principalmente en dos métricas:
* **IOPS (Operaciones de entrada/salida por segundo)**: Esto es la cantidad de operaciones de lectura o escritura pequeñas que el volumen puede manejar en un segundo. Es crucial para cargas de trabajo transaccionales, como bases de datos, donde hay muchas operaciones pequeñas y aleatorias.
* **Throughput (Rendimiento)**: Esto es la cantidad de datos que el volumen puede transferir por segundo, medido en MB/s (Megabytes por segundo). Es importante para cargas de trabajo secuenciales grandes, como análisis de datos, streaming de video o copias de seguridad, donde se mueven bloques grandes de datos.

El rendimiento de un volumen EBS depende de varios factores: el tipo de volumen que elijas (como vimos antes, SSD vs. HDD, gp3 vs. io2), el tamaño del volumen (volúmenes más grandes de ciertos tipos ofrecen más IOPS/throughput base), y si has aprovisionado IOPS o throughput adicionales. También es importante considerar las capacidades de red de la instancia EC2 a la que está adjunto el volumen, ya que esto puede ser un cuello de botella. Monitorear el rendimiento de tus volúmenes EBS a través de Amazon CloudWatch es una buena práctica para identificar cuellos de botella y ajustar tu configuración si es necesario. Ajustar el rendimiento te permite afinar el balance entre el costo y lo que realmente necesita tu aplicación.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart, sino una representación conceptual
// de cómo monitorearías el rendimiento de EBS y ajustarías el volumen.

/*
# Ejemplo de métricas de CloudWatch para EBS (conceptual)
# Puedes ver estas métricas en la consola de CloudWatch:
# - VolumeReadBytes: Bytes leídos de un volumen.
# - VolumeWriteBytes: Bytes escritos en un volumen.
# - VolumeReadOps: Operaciones de lectura por segundo.
# - VolumeWriteOps: Operaciones de escritura por segundo.
# - VolumeQueueLength: Número de solicitudes de E/S pendientes.
# - VolumeIdleTime: Porcentaje del tiempo que el volumen estuvo inactivo.

# Ejemplo: Modificar un volumen EBS existente para aumentar IOPS y Throughput (en gp3)
# aws ec2 modify-volume \
#   --volume-id vol-0abcdef1234567890 \ # Reemplaza con el ID de tu volumen
#   --iops 6000 \ # Aumentar a 6000 IOPS
#   --throughput 250 # Aumentar a 250 MB/s

# Esto se aplica a volúmenes gp3. Para io1/io2, solo ajustarías IOPS.
# Para st1/sc1, no puedes modificar IOPS de esta manera, solo el tamaño afecta el rendimiento.

# Ejemplo de un error común: Intentar modificar parámetros de rendimiento en un tipo de volumen no compatible
# aws ec2 modify-volume \
#   --volume-id vol-0abcdef1234567890 \ # Suponiendo que es un volumen st1
#   --iops 1000 # Esto fallaría si el volumen es st1 o sc1, ya que no soportan IOPS aprovisionadas.
# El sistema te daría un error indicando que el parámetro 'Iops' no es válido para el tipo de volumen.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Almacenamiento en AWS',
    'topic': 'Amazon EFS',
    'subtopic': 'Sistema de archivos elástico',
    'definition': r'''
Pensemos por un momento en una situación en la que necesitas que varios de tus servidores (instancias EC2) compartan acceso al mismo sistema de archivos al mismo tiempo. Aquí es donde Amazon EFS, o Elastic File System, brilla. A diferencia de EBS, que es un disco duro para una sola instancia, EFS es un sistema de archivos de red compartido que puede ser montado por múltiples instancias EC2 simultáneamente.

Aquí te va la aclaración: EFS es un almacenamiento de archivos que se escala automáticamente. Esto significa que a medida que añades más datos, EFS crece para acomodarlos, y si los borras, se encoge. No tienes que preocuparte por aprovisionar espacio de antemano. Es como tener una carpeta compartida gigante en la nube a la que todos tus servidores pueden acceder, leer y escribir datos al mismo tiempo, sin importar en qué Zona de Disponibilidad se encuentren.

La elasticidad de EFS es una de sus mayores ventajas. Puedes empezar con gigabytes de datos y crecer hasta petabytes sin interrupciones. Además, EFS está diseñado para ser altamente disponible y duradero, replicando tus datos en múltiples Zonas de Disponibilidad dentro de una región. Es una solución ideal para casos de uso que requieren acceso compartido a archivos, como entornos de desarrollo compartidos, alojamiento de sitios web o aplicaciones que necesitan un sistema de archivos común para sus datos. También es compatible con el protocolo NFSv4 (Network File System version 4), lo que lo hace fácil de integrar con sistemas operativos Linux.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart, sino una representación conceptual
// de cómo se montarían un sistema de archivos EFS en una instancia EC2 Linux.

/*
# Comandos conceptuales en una instancia EC2 Linux para montar EFS:

# 1. Instalar el cliente NFS
# sudo yum install -y nfs-utils # Para Amazon Linux
# sudo apt-get install -y nfs-common # Para Ubuntu

# 2. Crear un directorio para montar el EFS
# sudo mkdir /mnt/efs_shared

# 3. Montar el sistema de archivos EFS
# Reemplaza 'fs-xxxxxxxxxxxxxxxxx' con el ID de tu sistema de archivos EFS
# Reemplaza 'us-east-1a' con la Availability Zone donde está tu instancia EC2
# sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport \
#   fs-xxxxxxxxxxxxxxxxx.efs.us-east-1.amazonaws.com:/ \
#   /mnt/efs_shared

# Explicación de las opciones de montaje:
# -t nfs4: Tipo de sistema de archivos (NFSv4).
# nfsvers=4.1: Versión de NFS.
# rsize/wsize: Tamaño de los búferes de lectura/escritura para optimizar el rendimiento.
# hard: Reintentos de E/S hasta que la operación se complete.
# timeo: Tiempo de espera para la respuesta del servidor.
# retrans: Número de retransmisiones.
# noresvport: Permite usar cualquier puerto de origen disponible.
# fs-xxxxxxxxxxxxxxxxx.efs.us-east-1.amazonaws.com/: La DNS de tu sistema de archivos EFS.
# /: Directorio raíz del EFS que se va a montar.
# /mnt/efs_shared: El punto de montaje local en la instancia EC2.

# Ejemplo de un error común: Intentar montar EFS sin el cliente NFS instalado
# sudo mount -t nfs4 fs-xxxxxxxxxxxxxxxxx.efs.us-east-1.amazonaws.com:/ /mnt/efs_shared
# Esto daría un error como "mount: mount point /mnt/efs_shared does not exist"
# o "mount: wrong fs type, bad option, bad superblock on fs-xxxxxxxxxxxxxxxxx.efs.us-east-1.amazonaws.com:/".
# Es crucial instalar 'nfs-utils' o 'nfs-common' primero.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Almacenamiento en AWS',
    'topic': 'Amazon EFS',
    'subtopic': 'Configuración básica',
    'definition': r'''
Configurar un sistema de archivos EFS es un proceso bastante intuitivo en la consola de AWS, y es vital para que tus aplicaciones puedan usarlo correctamente. No es solo cuestión de "crear un volumen", sino de asegurarte de que tus servidores puedan acceder a él de forma segura y eficiente.

Seguramente te estarás preguntando de qué va todo esto... pues bien, lo primero que harás al crear un EFS es elegir el "modo de rendimiento". Tienes dos opciones principales: "General Purpose" (propósito general) y "Max I/O". General Purpose es adecuado para la mayoría de las cargas de trabajo de uso común, mientras que Max I/O es para aplicaciones que requieren una mayor concurrencia y un rendimiento de IOPS masivo, aunque puede tener una latencia ligeramente mayor para operaciones individuales. Elegir el correcto depende de las necesidades de tu aplicación.

Luego, viene la parte crucial de la conectividad: las "targets de montaje" y los "grupos de seguridad". Un target de montaje es un punto de entrada a tu sistema de archivos EFS dentro de una subred específica de tu VPC. Necesitas crear un target de montaje en cada Zona de Disponibilidad donde tengas instancias EC2 que necesiten acceder al EFS. Cada target de montaje se asocia con un "grupo de seguridad", que es como un firewall virtual que controla el tráfico de red. Este grupo de seguridad debe permitir el tráfico de NFS (puerto 2049) desde tus instancias EC2 hacia el EFS. Sin los targets de montaje y los grupos de seguridad correctamente configurados, tus instancias simplemente no podrán "ver" o conectar con el sistema de archivos EFS. Es un error común olvidar o configurar mal estos permisos, lo que lleva a problemas de conectividad.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart, sino una representación conceptual
// de cómo se especificaría la configuración de EFS al crearlo o modificarlo
// (usando AWS CLI o un SDK).

/*
# Ejemplo conceptual con AWS CLI: Creación de un sistema de archivos EFS
# aws efs create-file-system \
#   --performance-mode generalPurpose \ # O maxIo
#   --throughput-mode bursting \       # O provisioned, con --provisioned-throughput-in-mibps
#   --encrypted \                     # Habilitar cifrado si es necesario
#   --tags Key=Name,Value=MySharedFileSystem

# Ejemplo conceptual: Creación de un target de montaje para EFS
# (Necesitas el FileSystemId del EFS creado y la SubnetId de tu VPC)
# aws efs create-mount-target \
#   --file-system-id fs-xxxxxxxxxxxxxxxxx \ # Tu ID de EFS
#   --subnet-id subnet-0abcdef1234567890 \ # ID de una subred en tu VPC
#   --security-groups sg-0abcdef1234567890 # ID de tu grupo de seguridad que permite NFS

# Ejemplo conceptual de una regla de grupo de seguridad para permitir tráfico NFS
# (Esta regla se añadiría al Security Group asociado a tu Mount Target)
# aws ec2 authorize-security-group-ingress \
#   --group-id sg-0abcdef1234567890 \ # Tu ID de grupo de seguridad del Mount Target
#   --protocol tcp \
#   --port 2049 \                   # Puerto estándar de NFS
#   --source-group sg-your-ec2-instance-security-group # ID del grupo de seguridad de tus instancias EC2
#                                                      # O --cidr 10.0.0.0/16 (el rango de IPs de tu VPC)

# Errores comunes de configuración:
# - No crear un mount target en la AZ donde está tu instancia EC2.
# - El grupo de seguridad del mount target no permite el tráfico NFS (puerto 2049)
#   desde el grupo de seguridad de tus instancias EC2 o el CIDR de tu VPC.
# - Las reglas de entrada/salida de los grupos de seguridad de las instancias EC2
#   no permiten el tráfico NFS saliente/entrante.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Almacenamiento en AWS',
    'topic': 'Amazon EFS',
    'subtopic': 'Casos de uso',
    'definition': r'''
Pensemos en situaciones donde la colaboración y el acceso simultáneo a archivos son clave. Amazon EFS no es una solución de almacenamiento para todo, pero brilla en casos de uso muy específicos donde necesitas un sistema de archivos compartido que escale y sea altamente disponible.

¿Te estás preguntando por qué esto importa? Porque elegir la herramienta de almacenamiento adecuada en AWS es fundamental para la eficiencia y el costo de tu arquitectura. Si intentas usar EBS para un escenario de acceso compartido, no funcionará; si usas S3 para un sistema de archivos POSIX, es mucho más complejo. EFS llena un nicho importante.

Vamos a ver de qué se trata todo esto con algunos de los casos de uso más comunes para EFS:

* **Entornos de desarrollo y prueba**: Imagina un equipo de desarrolladores trabajando en el mismo código base. Con EFS, pueden compartir un único repositorio de código, librerías o dependencias entre varias instancias de desarrollo, asegurando que todos trabajan con los mismos archivos.
* **Contenido web y aplicaciones con estado**: Si tienes un sitio web o una aplicación que genera y necesita acceder a archivos estáticos (imágenes, CSS, JS) o dinámicos (uploads de usuarios, logs) que deben ser accesibles por varios servidores web al mismo tiempo, EFS es una excelente opción. Permite que múltiples servidores compartan el mismo almacenamiento para el contenido, lo que simplifica la escalabilidad y el balanceo de carga.
* **Análisis de Big Data**: Aplicaciones como Apache Hadoop o Spark a menudo necesitan acceder a grandes conjuntos de datos de forma concurrente desde múltiples nodos de procesamiento. EFS puede servir como un almacenamiento de archivos compartidos de alto rendimiento para estos clúmenes.
* **Almacenamiento de contenedores**: Para orquestadores de contenedores como Amazon ECS o Kubernetes, EFS puede proporcionar almacenamiento persistente y compartido para tus contenedores. Esto es crucial para aplicaciones con estado que se ejecutan en contenedores y necesitan que sus datos sobrevivan al ciclo de vida del contenedor.
* **Copias de seguridad y recuperación ante desastres**: Aunque S3 es el rey para copias de seguridad a largo plazo, EFS puede ser útil para almacenar copias de seguridad de volúmenes EBS o de bases de datos que necesiten un sistema de archivos para su restauración rápida. También se puede replicar EFS a otra región para DR.

En resumen, si necesitas que múltiples servidores Linux accedan y escriban en el mismo conjunto de archivos de forma concurrente, EFS es probablemente la solución que estás buscando.
''',
    'code_example': r'''
// No hay código de programación directo para "casos de uso", ya que son patrones de arquitectura.
// Sin embargo, aquí hay un ejemplo conceptual de cómo un script podría interactuar
// con un sistema de archivos EFS una vez montado.

/*
# Ejemplo conceptual: Script Python escribiendo y leyendo de un EFS montado
# Suponiendo que EFS está montado en /mnt/efs_app_data

import os

efs_path = "/mnt/efs_app_data"
log_file = os.path.join(efs_path, "app_logs.txt")
config_file = os.path.join(efs_path, "config.json")

def write_log(message):
    with open(log_file, "a") as f:
        f.write(f"[{os.uname()[1]}] {message}\n") # Añade el nombre del host EC2 al log
    print(f"Log escrito desde {os.uname()[1]}: {message}")

def read_config():
    if os.path.exists(config_file):
        with open(config_file, "r") as f:
            content = f.read()
            print(f"Configuración leída: {content}")
            return content
    else:
        print("Archivo de configuración no encontrado.")
        return None

# Ejemplo de uso en una aplicación web distribuida
# Cada instancia web puede escribir sus logs en el mismo archivo compartido EFS
write_log("Procesando solicitud de usuario XYZ.")

# Todas las instancias pueden leer la misma configuración centralizada
app_config = read_config()
if app_config:
    # Lógica de la aplicación basada en la configuración compartida
    pass

# INCORRECTO: Intentar usar EFS como si fuera un almacenamiento de objetos (no lo es)
# No puedes acceder a EFS directamente por URL como S3.
# Necesitas una instancia EC2 (o compatible) para montarlo y accederlo a través de un sistema de archivos.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Almacenamiento en AWS',
    'topic': 'Amazon EFS',
    'subtopic': 'Seguridad EFS',
    'definition': r'''
Pensemos en la importancia de mantener tus archivos compartidos seguros. Así como no dejarías la puerta de tu almacén abierta, necesitas asegurar tu sistema de archivos EFS para que solo las personas y aplicaciones autorizadas puedan acceder a él. La "Seguridad EFS" se aborda en varias capas en AWS.

Aquí te va la aclaración: la seguridad en EFS no es solo una cosa, sino una combinación de mecanismos. Primero, a nivel de red, los "grupos de seguridad" juegan un papel fundamental. Ya lo mencionamos, pero es crucial que el grupo de seguridad asociado a tus targets de montaje EFS permita solo el tráfico de red NFS (puerto 2049) desde las instancias EC2 que realmente necesitan acceso. Si abres el puerto 2049 a todo internet, estarías dejando tu EFS vulnerable.

Luego, a nivel de datos, EFS ofrece "cifrado" de datos en reposo y en tránsito. Puedes habilitar el cifrado al crear tu sistema de archivos EFS, y este se encargará de cifrar los datos en el disco y durante la transmisión entre EFS y tus instancias. Esto se integra con AWS Key Management Service (KMS), permitiéndote usar tus propias claves o las claves administradas por AWS. Esto es vital para el cumplimiento normativo y para proteger datos sensibles.

Finalmente, a nivel de acceso, puedes usar "Políticas de IAM" para controlar quién puede crear, modificar o eliminar sistemas de archivos EFS. Y a nivel de sistema de archivos, dado que EFS es compatible con NFS, puedes usar los "permisos POSIX estándar" (lectura, escritura, ejecución) en tus directorios y archivos, tal como lo harías en un sistema de archivos Linux tradicional. Esto significa que puedes controlar el acceso de los usuarios y grupos de Linux a archivos específicos dentro de tu EFS, complementando la seguridad de red y el cifrado.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart, sino una representación conceptual
// de cómo se vería una política de IAM para EFS o cómo se aplicarían permisos POSIX.

/*
# Ejemplo conceptual: Política IAM para permitir la creación y descripción de sistemas de archivos EFS
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "elasticfilesystem:CreateFileSystem",
        "elasticfilesystem:DescribeFileSystems",
        "elasticfilesystem:DescribeMountTargets",
        "elasticfilesystem:DeleteFileSystem"
      ],
      "Resource": "*" # O un ARN de EFS específico si quieres ser más granular
    }
  ]
}

# Ejemplo conceptual de comandos Linux para gestionar permisos POSIX en un EFS montado
# Suponiendo que EFS está montado en /mnt/efs_data

# Crear un directorio para un usuario específico y darle permisos solo a él
# sudo mkdir /mnt/efs_data/user_data
# sudo chown myuser:mygroup /mnt/efs_data/user_data # Cambiar propietario
# sudo chmod 700 /mnt/efs_data/user_data          # Solo propietario puede leer/escribir/ejecutar

# Crear un directorio compartido con permisos de escritura para un grupo
# sudo mkdir /mnt/efs_data/shared_docs
# sudo chown root:mydevgroup /mnt/efs_data/shared_docs
# sudo chmod 770 /mnt/efs_data/shared_docs # Propietario y grupo pueden leer/escribir/ejecutar

# Ejemplo INCORRECTO: Dejar permisos demasiado abiertos a nivel de seguridad de red
# Un grupo de seguridad que permite NFS (puerto 2049) desde 0.0.0.0/0 (todo el internet)
# Esto expondría tu EFS públicamente si no hay otras capas de seguridad.
# Siempre restringe el tráfico a las IPs o grupos de seguridad de tus instancias EC2.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Almacenamiento en AWS',
    'topic': 'AWS Storage Gateway',
    'subtopic': 'Tipos de gateways',
    'definition': r'''
Pensemos por un momento que tienes tus datos en tu centro de datos local, pero quieres aprovechar la escalabilidad, durabilidad y los beneficios de costo del almacenamiento en la nube de AWS. Aquí es donde entra en juego AWS Storage Gateway. Es un servicio híbrido que te permite conectar tu infraestructura local a la nube de AWS para un almacenamiento prácticamente ilimitado.

Aquí te va la aclaración: AWS Storage Gateway es un dispositivo virtual o físico que instalas en tu centro de datos. Actúa como un puente entre tus aplicaciones locales y el almacenamiento en la nube de AWS (principalmente S3 y EBS). La genialidad es que hace que el almacenamiento en la nube parezca un almacenamiento local para tus aplicaciones, simplificando la migración y el uso de la nube sin reescribir tu código. AWS Storage Gateway ofrece varios "tipos de gateways", cada uno diseñado para un caso de uso específico, optimizando cómo se gestionan tus datos.

Vamos a ver de qué se trata todo esto con los tipos más comunes:

* **Gateway de archivos (File Gateway)**: Este tipo te permite almacenar archivos en S3 mientras los presentas a tus aplicaciones locales a través de protocolos de archivos estándar como NFS o SMB. Es ideal si tienes aplicaciones que necesitan acceder a archivos compartidos y quieres que esos archivos se almacenen en S3. Funciona como un caché local de tus archivos más accedidos, lo que mejora el rendimiento.
* **Gateway de volúmenes (Volume Gateway)**: Este es para cuando necesitas un almacenamiento a nivel de bloque (como un disco duro) para tus aplicaciones locales. Viene en dos modos:
    * **Volúmenes almacenados (Stored Volumes)**: Aquí, tus datos completos se almacenan localmente en tu gateway, pero se hacen copias de seguridad asíncronas en S3 como snapshots de EBS. Es bueno para aplicaciones que necesitan acceso de baja latencia a todos sus datos localmente, con una copia de seguridad robusta en la nube.
    * **Volúmenes en caché (Cached Volumes)**: En este modo, tus datos se almacenan principalmente en S3, y el gateway local mantiene una caché de los datos más accedidos. Esto es ideal si quieres aprovechar al máximo el almacenamiento de bajo costo de S3 y no necesitas que todos tus datos estén localmente.
* **Gateway de cintas (Tape Gateway)**: Diseñado para reemplazar la infraestructura de cintas físicas. Presenta una interfaz de unidad de cinta virtual (VTL) a tu software de copia de seguridad local. Tus copias de seguridad se almacenan en S3 y luego se pueden archivar en S3 Glacier o Glacier Deep Archive, lo que reduce drásticamente los costos de almacenamiento a largo plazo y la complejidad de gestionar cintas físicas.

Elegir el tipo de gateway correcto es fundamental para alinear tus necesidades de almacenamiento local con los beneficios del almacenamiento en la nube de AWS.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart. AWS Storage Gateway es un servicio
// configurado principalmente a través de la consola de AWS o AWS CLI.
// Los "tipos de gateways" se eligen durante la creación del gateway.

/*
# Comandos conceptuales de AWS CLI para crear un Storage Gateway (ejemplo de File Gateway)

# 1. Activación del Gateway (se realiza una vez que el OVA/hardware está desplegado)
# aws storagegateway activate-gateway \
#   --activation-key "TXXX-XXXX-XXXX-XXXXX" \ # Clave generada por el gateway local
#   --gateway-type FILE_GATEWAY \
#   --gateway-name MyFileGateway \
#   --gateway-timezone "GMT-05:00" \
#   --gateway-region us-east-1 # Región donde operará el gateway

# 2. Creación de un recurso compartido de archivos NFS (para File Gateway)
# aws storagegateway create-nfs-file-share \
#   --client-list "192.168.1.0/24" \ # CIDR de tus clientes NFS locales
#   --default-storage-class S3_STANDARD \ # Clase de almacenamiento S3 por defecto
#   --file-system-default-for-inheritance true \
#   --gateway-arn "arn:aws:storagegateway:us-east-1:123456789012:gateway/sgw-xxxxxxxx" \
#   --kms-encrypted false \
#   --location-arn "arn:aws:s3:::my-file-gateway-bucket" \ # Bucket S3 de destino
#   --role-arn "arn:aws:iam::123456789012:role/StorageGatewayS3Role" # Rol IAM para acceder a S3

# Ejemplo de un error común: Intentar configurar un tipo de gateway para un caso de uso incorrecto.
# Por ejemplo, usar un File Gateway para una aplicación que necesita un almacenamiento de bloques (disco).
# En ese caso, la aplicación local esperaría un disco SCSI/iSCSI, y un File Gateway solo presenta NFS/SMB.
# La aplicación simplemente no podría ver ni usar el almacenamiento correctamente.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Almacenamiento en AWS',
    'topic': 'AWS Storage Gateway',
    'subtopic': 'Configuración básica',
    'definition': r'''
Pensemos en cómo pones a funcionar tu puente entre el centro de datos y la nube. La "configuración básica" de AWS Storage Gateway implica varios pasos clave para asegurarte de que tu gateway esté operativo y tus aplicaciones locales puedan empezar a usar el almacenamiento de AWS. No es simplemente instalar un software, sino también definir cómo se conectará y qué recursos usará.

Seguramente pensarás de qué va todo esto... pues bien, el primer paso es desplegar el software del gateway. Esto generalmente implica descargar una máquina virtual (OVA) de AWS e instalarla en tu hipervisor local (VMware ESXi, Microsoft Hyper-V, KVM) o adquirir un dispositivo de hardware si lo prefieres. Una vez desplegado, lo activas con una clave de activación que obtienes de la consola de AWS. Esta activación vincula tu gateway local con tu cuenta de AWS.

Luego, viene la asignación de recursos locales. Necesitas designar discos locales para que el gateway los use como caché (para los datos más accedidos) y como buffer de carga (para los datos en tránsito hacia la nube). La cantidad de caché que asignes es crucial para el rendimiento, especialmente para los gateways de archivo y de volumen en caché. Sin suficiente caché, el rendimiento puede degradarse. También necesitas configurar las redes, asegurándote de que tu gateway tenga conectividad a Internet (para comunicarse con AWS) y a tu red local (para que tus servidores puedan acceder a él). Finalmente, crearás los "recursos compartidos de archivos" (para File Gateway) o los "volúmenes" (para Volume Gateway) que tus aplicaciones locales verán y usarán, definiendo qué bucket de S3 o qué tipo de volumen de EBS respaldará ese recurso. Es un error común no asignar suficientes recursos locales o tener problemas de conectividad de red, lo que impide que el gateway funcione correctamente.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart. La configuración básica es un proceso manual
// o automatizado con herramientas de infraestructura como código (CloudFormation, Terraform).

/*
# Pasos conceptuales de la configuración básica en la consola de AWS para un File Gateway:

# 1. Desplegar Gateway (OVA) en tu hipervisor local.
# 2. Conectarse a la consola del gateway local (IP asignada) y configurar red.
# 3. Activar el Gateway en la consola de AWS, obteniendo una clave de activación.
#    - Seleccionar el tipo de Gateway (File Gateway, Volume Gateway, Tape Gateway).
#    - Asociar a la región AWS deseada.
# 4. Configurar el almacenamiento local del Gateway:
#    - Asignar discos locales para el "Buffer de carga" (upload buffer) y "Caché" (cache storage).
#      (Ej: disco de 150 GB para caché, disco de 80 GB para buffer).
# 5. Crear un recurso compartido de archivos (File Share)
#    - Elegir el protocolo (NFS o SMB).
#    - Seleccionar el bucket S3 al que se mapeará el recurso compartido.
#    - Configurar permisos de acceso (quién puede montar el recurso).
#    - Revisar opciones avanzadas como cifrado, ACLs, etc.

# Ejemplo conceptual de un problema de configuración:
# Si asignas un tamaño de caché muy pequeño para un File Gateway con muchos datos
# o accesos frecuentes, verías un rendimiento pobre y latencia elevada, ya que
# el gateway tendría que ir constantemente a S3 para obtener datos.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Almacenamiento en AWS',
    'topic': 'AWS Storage Gateway',
    'subtopic': 'Casos de uso',
    'definition': r'''
Pensemos en dónde brilla AWS Storage Gateway en el mundo real. Este servicio es una herramienta poderosa, pero no es para todas las situaciones. Sus "casos de uso" se centran en escenarios donde necesitas cerrar la brecha entre tu infraestructura local y el vasto almacenamiento de la nube de AWS.

¿Te estás preguntando por qué esto importa? Porque te ayuda a evitar el costoso y complejo proceso de migrar todos tus datos y aplicaciones a la nube de una sola vez, o a mantener operativas aplicaciones legacy que requieren acceso a sistemas de archivos locales.

Vamos a ver de qué se trata todo esto con algunos de los casos de uso más comunes para AWS Storage Gateway:

* **Migración de datos a la nube**: Puedes usar un Volume Gateway para migrar bases de datos o volúmenes de máquinas virtuales a la nube creando snapshots en S3 y luego restaurándolos como volúmenes EBS. O usar un File Gateway para mover archivos a S3 de forma gradual.
* **Almacenamiento en la nube de bajo costo para archivos locales**: Si tienes grandes cantidades de archivos que se generan localmente (por ejemplo, logs de aplicaciones, documentos de usuario, archivos de diseño) y quieres archivarlos en S3 de forma eficiente y económica, un File Gateway es ideal. Tus usuarios acceden a través de NFS/SMB localmente, y el gateway se encarga de la replicación a S3.
* **Copia de seguridad y recuperación ante desastres (DR)**: Las organizaciones a menudo utilizan Tape Gateway para reemplazar sus bibliotecas de cintas físicas. Envían sus copias de seguridad de software de terceros directamente a Tape Gateway, que luego las almacena en S3 y las archiva automáticamente en Glacier o Glacier Deep Archive, reduciendo los costos y la gestión de cintas. Para DR, Volume Gateway permite que tus datos locales sean respaldados en S3 y estén listos para ser restaurados como volúmenes EBS en AWS si hay una interrupción local.
* **Soporte para aplicaciones legacy que requieren almacenamiento de archivos o bloques**: Hay muchas aplicaciones antiguas que esperan un sistema de archivos o un disco duro local para funcionar. Storage Gateway permite que estas aplicaciones se conecten a la nube sin cambios, facilitando la modernización.
* **Data Lakes e integración con análisis**: Un File Gateway puede ser utilizado para enviar grandes volúmenes de datos generados localmente directamente a un bucket de S3, que luego puede servir como un data lake para análisis con servicios como Amazon Athena o Amazon Redshift Spectrum.

En resumen, AWS Storage Gateway es perfecto para escenarios híbridos donde necesitas extender tu almacenamiento local a la nube de AWS de manera transparente y eficiente.
''',
    'code_example': r'''
// No hay código de programación directo para "casos de uso", ya que son descripciones
// de patrones de arquitectura. Los ejemplos se enfocan en la lógica de cómo se usaría
// el gateway en un entorno.

/*
# Ejemplo conceptual: Uso de File Gateway para un servidor de archivos local
# Un usuario local guarda un archivo en una unidad de red mapeada a un File Gateway.
# El sistema operativo local no necesita saber que el archivo eventualmente termina en S3.

# Cliente local (ej. Windows Explorer o comando Linux)
# mount -t cifs //192.168.1.100/myshare /mnt/fileserver # Montar recurso SMB/NFS
# cp /local/path/document.docx /mnt/fileserver/reports/Q1_report.docx
# echo "Datos de log de la aplicación" >> /mnt/fileserver/logs/app.log

# En segundo plano, el AWS File Gateway (desplegado en el centro de datos)
# tomaría 'document.docx' y 'app.log' y los subiría al bucket S3 configurado,
# manteniendo una caché local para accesos frecuentes.

# Ejemplo conceptual de un problema común: Usar Storage Gateway para acceso de baja latencia a datos globales.
# Storage Gateway está diseñado para "extender" el almacenamiento local a la nube,
# no para proporcionar acceso de baja latencia a datos que ya están en S3 en otra región,
# o para aplicaciones que son nativas de la nube y no tienen requisitos de almacenamiento local.
# Para eso, S3 o EFS directamente serían más adecuados.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Almacenamiento en AWS',
    'topic': 'AWS Storage Gateway',
    'subtopic': 'Integración con S3',
    'definition': r'''
Pensemos en cómo AWS Storage Gateway logra su magia. El corazón de su funcionamiento, especialmente para los tipos de File Gateway y Volume Gateway, es su profunda "integración con S3". Amazon S3 es el servicio de almacenamiento fundamental de AWS, y Storage Gateway lo usa para almacenar tus datos de manera duradera y escalable en la nube.

Aquí te va la aclaración: para un File Gateway, la integración con S3 es bastante directa. Cada recurso compartido de archivos (NFS o SMB) que creas en tu gateway se mapea directamente a un bucket de S3. Cuando los usuarios locales guardan archivos en ese recurso compartido, el gateway los sube a S3 como objetos. Cuando los usuarios solicitan un archivo, el gateway lo descarga de S3 (si no está en la caché) y lo presenta localmente. Esto significa que S3 es el almacenamiento principal y duradero para todos tus archivos, mientras que el gateway actúa como una caché de alto rendimiento y una interfaz de sistema de archivos local.

Para un Volume Gateway en modo de volúmenes en caché, tus datos de bloques se almacenan en S3 como bloques, y el gateway mantiene una caché local. En el modo de volúmenes almacenados, las copias de seguridad de tus volúmenes locales se envían a S3 como snapshots de EBS. Incluso el Tape Gateway guarda tus cintas virtuales en S3, antes de archivarlas opcionalmente en Glacier. La integración con S3 permite que Storage Gateway aproveche la durabilidad de once nueves de S3, su escalabilidad ilimitada, y sus diferentes clases de almacenamiento para optimizar costos. Sin esta integración, Storage Gateway no podría ofrecer los beneficios de la nube manteniendo una interfaz local.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart. La integración se gestiona internamente
// por el servicio Storage Gateway. Los comandos son para configurar el gateway
// para usar S3.

/*
# Ejemplo conceptual de cómo se ve la integración con S3 al crear un recurso compartido de archivos
# (como se haría en la consola de AWS o con AWS CLI)

# Comando conceptual para crear un recurso compartido de archivos NFS:
# aws storagegateway create-nfs-file-share \
#   --client-list "10.0.0.0/16" \
#   --default-storage-class S3_STANDARD \ # Aquí especificas la clase S3 para los objetos
#   --file-system-default-for-inheritance true \
#   --gateway-arn "arn:aws:storagegateway:us-east-1:123456789012:gateway/sgw-xxxxxxxx" \
#   --location-arn "arn:aws:s3:::my-efs-integration-bucket" \ # ¡El bucket S3 de destino!
#   --role-arn "arn:aws:iam::123456789012:role/StorageGatewayS3AccessRole" \ # Rol con permisos a S3
#   --read-only true # Ejemplo: Hacer el recurso compartido de solo lectura

# Roles IAM para Storage Gateway y S3:
# Es crucial que el rol IAM asignado a tu Storage Gateway tenga los permisos
# adecuados para leer y escribir en el bucket S3 al que está conectado.
# Si el rol no tiene permisos como `s3:PutObject`, `s3:GetObject`, `s3:ListBucket`,
# o `s3:DeleteObject`, el gateway no podrá sincronizar los datos con S3,
# lo que resultaría en errores de E/S desde tus aplicaciones locales.

# Política IAM conceptual para el rol de Storage Gateway:
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Action": [
#         "s3:PutObject",
#         "s3:GetObject",
#         "s3:DeleteObject",
#         "s3:ListBucket",
#         "s3:GetBucketLocation"
#       ],
#       "Resource": [
#         "arn:aws:s3:::my-efs-integration-bucket",
#         "arn:aws:s3:::my-efs-integration-bucket/*"
#       ]
#     }
#   ]
# }

# Ejemplo de un error común: Problemas de permisos entre Storage Gateway y S3.
# Si el gateway no tiene los permisos correctos para escribir en el bucket S3,
# los archivos que los usuarios intenten guardar localmente se quedarían en el buffer de carga
# del gateway y nunca se subirían a S3, eventualmente causando un error o un desbordamiento del buffer.
*/
'''
  });
}

Future<void> insertJrLevel4AwsData(Database db) async {
  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Bases de Datos en AWS',
    'topic': 'Amazon RDS',
    'subtopic': 'Motores de base de datos soportados',
    'definition': r'''
Pensemos en el corazón de muchas aplicaciones: las bases de datos relacionales. Amazon RDS, que significa Relational Database Service, es el servicio de AWS que te permite configurar, operar y escalar una base de datos relacional en la nube de una manera muy sencilla. La gran ventaja es que AWS se encarga de las tareas pesadas como el aprovisionamiento de hardware, el parcheo, las copias de seguridad y la replicación.

Seguramente te estarás preguntando por qué esto importa. Pues bien, la clave de RDS es que no te obliga a cambiar el motor de base de datos que ya conoces y amas. RDS soporta una variedad de "motores de base de datos", lo que significa que puedes migrar tus bases de datos existentes a la nube sin reescribir tu aplicación. Es como tener tu motor favorito, pero con superpoderes de la nube.

Vamos a ver de qué se trata todo esto con los motores más comunes que soporta:

* **Amazon Aurora**: Este es el motor de base de datos relacional propio de AWS, diseñado para la nube. Es compatible con MySQL y PostgreSQL, pero ofrece hasta 5 veces el rendimiento de MySQL y 3 veces el de PostgreSQL, con la seguridad, disponibilidad y durabilidad de una base de datos comercial a una fracción de su costo. Es una opción muy potente para nuevas aplicaciones o para migrar bases de datos que exigen alto rendimiento.
* **MySQL**: Uno de los motores de base de datos de código abierto más populares del mundo. Ideal para aplicaciones web y móviles, comercio electrónico y muchas otras cargas de trabajo. RDS te permite ejecutar versiones de MySQL conocidas, sin tener que gestionar el servidor subyacente.
* **PostgreSQL**: Otro motor de base de datos de código abierto robusto y avanzado, conocido por su extensibilidad y compatibilidad con estándares. Es excelente para aplicaciones empresariales, sistemas GIS y análisis.
* **MariaDB**: Un fork compatible con MySQL, también de código abierto. Ofrece características y mejoras que a menudo lo hacen preferible para algunos desarrolladores.
* **Oracle Database**: Si ya tienes licencias de Oracle o tus aplicaciones están construidas sobre este motor, RDS te permite ejecutar Oracle en la nube, gestionando la infraestructura por ti. Puedes usar tus propias licencias (BYOL) o pagar por ellas a través de AWS.
* **Microsoft SQL Server**: Para las organizaciones que dependen del ecosistema de Microsoft, RDS soporta varias ediciones y versiones de SQL Server, desde Web Edition hasta Enterprise Edition, facilitando la migración y operación de tus bases de datos SQL Server en la nube.

La flexibilidad de elegir el motor de base de datos adecuado te permite aprovechar la nube sin un cambio radical en tus tecnologías actuales.
''',
    'code_example': r'''
// No hay código de programación directo para "motores de base de datos soportados",
// ya que es una característica de configuración de AWS RDS.
// Sin embargo, este es un ejemplo conceptual de cómo seleccionarías el motor
// al crear una instancia RDS usando AWS CLI.

/*
# Ejemplo conceptual con AWS CLI para crear una instancia RDS (MySQL)

# aws rds create-db-instance \
#   --db-instance-identifier my-mysql-db \
#   --db-instance-class db.t3.micro \ # Tipo de instancia (tamaño del servidor)
#   --engine mysql \                 # Aquí especificas el motor de base de datos
#   --master-username admin \
#   --master-user-password myStrongPassword! \
#   --allocated-storage 20 \         # Tamaño del almacenamiento en GB
#   --db-name myapplicationdb \      # Nombre de la base de datos inicial
#   --vpc-security-group-ids sg-0abcdef1234567890 \ # Grupo de seguridad para acceso
#   --db-subnet-group-name my-db-subnet-group \ # Grupo de subredes para alta disponibilidad
#   --no-multi-az \                  # Por ahora no Multi-AZ
#   --engine-version 8.0.28          # Versión específica del motor

# Ejemplo de un error común: Intentar usar un motor no soportado o una versión incorrecta.
# aws rds create-db-instance --engine NoSQLDB --engine-version 1.0 # Esto fallaría
# RDS solo soporta los motores relacionales específicos que ha integrado.
# Usar una versión de motor que no es compatible con RDS para esa región o tipo de instancia
# también generaría un error. Siempre revisa la documentación de AWS para compatibilidad de versiones.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Bases de Datos en AWS',
    'topic': 'Amazon RDS',
    'subtopic': 'Creación de instancias RDS',
    'definition': r'''
Crear una instancia de base de datos en Amazon RDS es el primer paso para tener tu base de datos relacional funcionando en la nube, y es un proceso bastante guiado que te quita mucho peso de encima. No es solo "hacer clic y listo", pero AWS simplifica enormemente lo que sería la gestión de un servidor de base de datos tradicional.

Aquí te va la aclaración: cuando creas una instancia RDS, estás esencialmente aprovisionando un servidor de base de datos en la nube. Primero, elegirás el "motor de base de datos" (como MySQL, PostgreSQL, etc.) y la "versión" específica. Luego, seleccionas el "tipo de instancia de base de datos", que es el tamaño del servidor virtual en términos de CPU y memoria RAM. Esto es crucial, ya que impactará directamente el rendimiento de tu base de datos. Una instancia más grande ofrece más recursos, pero también cuesta más.

También definirás el "almacenamiento" para tu base de datos, incluyendo su tamaño (en GB) y el tipo de almacenamiento (SSD de propósito general o SSD de IOPS aprovisionadas, similar a los volúmenes EBS). Necesitas especificar un "nombre de usuario y contraseña" para el administrador de la base de datos, y darle un "identificador" único a tu instancia RDS. Un paso muy importante es la configuración de red y seguridad. Asignarás tu instancia a una "VPC" (nube privada virtual) y a un "grupo de seguridad", que controlará quién y desde dónde puede acceder a tu base de datos. Finalmente, configurarás la "ventana de mantenimiento" para actualizaciones automáticas y el "periodo de retención de copias de seguridad", que determina por cuánto tiempo se guardarán tus copias automáticas. Todo esto se puede hacer desde la consola de AWS, lo que te facilita mucho el proceso.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart, sino un ejemplo conceptual con AWS CLI
// para crear una instancia de base de datos RDS.

/*
# aws rds create-db-instance \
#   --db-instance-identifier my-app-database \  # Nombre único para tu instancia
#   --db-instance-class db.t3.small \            # Tipo de instancia (CPU y RAM)
#   --engine postgres \                        # Motor de la base de datos
#   --master-username dbadmin \
#   --master-user-password SuperSecretPassword123! \
#   --allocated-storage 50 \                   # Tamaño del almacenamiento en GB
#   --storage-type gp2 \                       # Tipo de almacenamiento (gp2 o io1/io2)
#   --db-name mywebappdb \                     # Nombre de la base de datos inicial a crear
#   --vpc-security-group-ids sg-0abcdef1234567890 \ # ID de tu Security Group
#   --db-subnet-group-name my-rds-subnet-group \ # ID del DB Subnet Group para alta disponibilidad
#   --publicly-accessible false \              # Muy importante: generalmente FALSE para seguridad
#   --multi-az \                               # Habilitar Multi-AZ para alta disponibilidad
#   --backup-retention-period 7 \              # Retención de backups automáticos (7 días)
#   --preferred-backup-window "03:00-04:00" \  # Ventana para backups
#   --preferred-maintenance-window "sat:05:00-sat:06:00" # Ventana de mantenimiento
#   --tags Key=Environment,Value=Production

# Ejemplo de un error común: No especificar un grupo de seguridad que permita conexiones.
# Si tu grupo de seguridad de la instancia RDS no tiene una regla de entrada (inbound rule)
# que permita el tráfico desde la IP de tu aplicación o de tu red, no podrás conectarte a la base de datos.
# Por ejemplo, si tu aplicación está en una EC2, el grupo de seguridad de RDS debe permitir el tráfico
# desde el grupo de seguridad de la EC2, o desde el CIDR de tu VPC.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Bases de Datos en AWS',
    'topic': 'Amazon RDS',
    'subtopic': 'Multi-AZ deployments',
    'definition': r'''
Pensemos en la disponibilidad de tu base de datos. ¿Qué pasa si la zona de disponibilidad donde está tu base de datos sufre una interrupción? Si solo tienes una instancia, tu aplicación se caería. Para evitar esto, Amazon RDS ofrece la opción de "Multi-AZ deployments", que es la forma de AWS de darte alta disponibilidad y tolerancia a fallos para tus bases de datos relacionales.

Aquí te va la aclaración: cuando configuras una instancia RDS como Multi-AZ, AWS automáticamente crea una réplica síncrona de tu base de datos en una Zona de Disponibilidad diferente dentro de la misma región. Esto no es una réplica para lectura, sino una copia exacta y en tiempo real de tu base de datos principal. Los datos se replican de forma síncrona, lo que significa que cada escritura en la base de datos principal se confirma solo después de que se ha replicado con éxito en la réplica secundaria.

¿Te estás preguntando por qué esto importa? Porque si la instancia principal de tu base de datos falla (debido a un problema de hardware, una interrupción de la AZ o un parcheo), RDS automáticamente conmuta (failover) a la réplica en espera en otra Zona de Disponibilidad. Este proceso es automático y generalmente toma entre 1 y 2 minutos, con un impacto mínimo en tu aplicación. Es una forma de asegurar la continuidad del negocio y reducir el tiempo de inactividad de tu base de datos, sin que tengas que gestionar la replicación o el failover manualmente. Si bien tiene un costo ligeramente mayor por la réplica adicional y el almacenamiento, la tranquilidad que ofrece para aplicaciones críticas suele valer la pena.
''',
    'code_example': r'''
// No hay código de programación directo para "Multi-AZ deployments",
// ya que es una opción de configuración de la instancia RDS.

/*
# Ejemplo conceptual con AWS CLI para crear una instancia RDS con Multi-AZ habilitado

# aws rds create-db-instance \
#   --db-instance-identifier my-multi-az-db \
#   --db-instance-class db.m5.large \
#   --engine mysql \
#   --master-username admin \
#   --master-user-password AnotherStrongPassword! \
#   --allocated-storage 100 \
#   --multi-az \                     # ¡Esta es la clave para habilitar Multi-AZ!
#   --db-name productiondb \
#   --vpc-security-group-ids sg-0abcdef1234567890 \
#   --db-subnet-group-name my-db-subnet-group

# Si ya tienes una instancia y quieres modificarla para ser Multi-AZ:
# aws rds modify-db-instance \
#   --db-instance-identifier my-existing-db \
#   --multi-az \
#   --apply-immediately # Aplica el cambio inmediatamente (puede causar una breve interrupción)

# Ejemplo de un error común: Confundir Multi-AZ con réplicas de lectura.
# Multi-AZ es para alta disponibilidad y recuperación de desastres (failover automático).
# Las réplicas de lectura (Read Replicas) son para escalar el rendimiento de lectura de tu base de datos,
# y no proporcionan failover automático en caso de fallo de la instancia principal.
# Una instancia Multi-AZ solo tiene una base de datos principal activa en un momento dado,
# mientras que una réplica de lectura es una instancia de base de datos separada a la que tu aplicación
# puede enviar consultas de lectura.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Bases de Datos en AWS',
    'topic': 'Amazon RDS',
    'subtopic': 'Snapshots RDS',
    'definition': r'''
Pensemos en cómo proteges tus bases de datos de la pérdida de datos. Los "snapshots" en Amazon RDS son una forma de crear copias de seguridad completas de tu instancia de base de datos en un momento específico. Son esenciales para la recuperación ante desastres y para mover tus bases de datos.

Aquí te va la aclaración: un snapshot de RDS es una copia de seguridad completa de tu volumen de base de datos. AWS RDS realiza automáticamente snapshots de tu base de datos en un período de retención que tú defines (por ejemplo, 7 días). Esto significa que puedes restaurar tu base de datos a cualquier punto en el tiempo dentro de ese período de retención, con una granularidad de hasta 5 minutos. Además de estos snapshots automáticos, puedes crear "snapshots manuales" en cualquier momento. Los snapshots manuales se retienen hasta que los elimines explícitamente, lo que los hace ideales para puntos de restauración importantes, como antes de una actualización mayor o una migración.

¿Te estás preguntando por qué esto importa? Esto tiene una explicación, y es porque los snapshots son la columna vertebral de la estrategia de recuperación de datos en RDS. Si algo sale mal con tu base de datos (por ejemplo, una corrupción de datos, una eliminación accidental o un ataque), puedes restaurar una nueva instancia de base de datos a partir de un snapshot anterior. Esto te da la tranquilidad de saber que tus datos están seguros y que puedes volver a un estado conocido. También son útiles para crear entornos de desarrollo o prueba. Puedes tomar un snapshot de tu base de datos de producción y restaurarla en una nueva instancia para que los desarrolladores trabajen con datos reales sin afectar el entorno de producción. Los snapshots se almacenan en S3, lo que les da la durabilidad y disponibilidad de S3, pero se gestionan a través de la interfaz de RDS.
''',
    'code_example': r'''
// No hay código de programación directo para "Snapshots RDS",
// ya que se gestionan a través de la consola de AWS o AWS CLI/SDK.

/*
# Ejemplo conceptual con AWS CLI para gestionar snapshots de RDS

# 1. Crear un snapshot manual de una instancia RDS
# Reemplaza 'my-app-database' con el identificador de tu instancia RDS
# aws rds create-db-snapshot \
#   --db-snapshot-identifier my-app-database-pre-upgrade-snapshot \
#   --db-instance-identifier my-app-database \
#   --tags Key=Purpose,Value=PreUpgradeBackup

# 2. Listar los snapshots disponibles para una instancia
# aws rds describe-db-snapshots \
#   --db-instance-identifier my-app-database

# 3. Restaurar una nueva instancia RDS a partir de un snapshot
# Reemplaza 'my-app-database-pre-upgrade-snapshot' con el ID del snapshot
# Reemplaza 'my-restored-db-instance' con el nuevo identificador de la instancia
# aws rds restore-db-instance-from-db-snapshot \
#   --db-instance-identifier my-restored-db-instance \
#   --db-snapshot-identifier my-app-database-pre-upgrade-snapshot \
#   --db-instance-class db.t3.medium \
#   --multi-az \ # Si quieres que la nueva instancia sea Multi-AZ
#   --publicly-accessible false \
#   --vpc-security-group-ids sg-0abcdef1234567890 \
#   --db-subnet-group-name my-db-subnet-group

# Ejemplo de un error común: Depender únicamente de snapshots manuales.
# Los snapshots automáticos son cruciales para tener puntos de restauración finos
# en el tiempo (PITR - Point-In-Time Recovery). Si solo creas snapshots manuales,
# podrías perder datos entre el último snapshot manual y el momento del fallo.
# Es una buena práctica combinar ambos: automáticos para PITR y manuales para puntos de
# restauración importantes que necesiten retención indefinida.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Bases de Datos en AWS',
    'topic': 'Amazon DynamoDB',
    'subtopic': 'Conceptos de NoSQL',
    'definition': r'''
Pensemos por un momento en las bases de datos tradicionales, las que usan tablas con filas y columnas y relaciones entre ellas (como MySQL o PostgreSQL). Ahora, imaginemos un tipo de base de datos que no sigue esas reglas estrictas. Eso es lo que se conoce como una base de datos "NoSQL", y Amazon DynamoDB es la implementación de AWS de una base de datos NoSQL de tipo clave-valor y documental, diseñada para un rendimiento a cualquier escala.

Aquí te va la aclaración: "NoSQL" no significa "sin SQL", sino "no solo SQL". Estas bases de datos fueron creadas para resolver problemas que las bases de datos relacionales no manejan tan bien, como la escalabilidad masiva, la flexibilidad del esquema y el rendimiento ultra rápido para cargas de trabajo específicas. A diferencia de las bases de datos relacionales con su esquema fijo, las bases de datos NoSQL ofrecen una flexibilidad mucho mayor. Puedes almacenar datos de diferentes tipos en la misma "tabla" sin tener que definir un esquema estricto de antemano.

¿Te estás preguntando por qué esto importa? Esto tiene una explicación, y es porque las bases de datos NoSQL son ideales para aplicaciones que necesitan manejar grandes volúmenes de datos con latencia de milisegundos, como aplicaciones móviles, gaming, IoT, publicidad en tiempo real, microservicios y personalización. DynamoDB, en particular, ofrece un rendimiento consistente a cualquier escala, lo que significa que a medida que tu aplicación crece, DynamoDB puede escalar automáticamente para manejar millones de solicitudes por segundo. Su diseño sin esquema fijo permite que tus aplicaciones evolucionen rápidamente, sin la necesidad de realizar complejas migraciones de esquema cada vez que necesites añadir un nuevo tipo de dato o un atributo a tus elementos. Es una solución de base de datos totalmente administrada, lo que te libera de la carga de operar y escalar servidores.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart, sino una representación conceptual
// de cómo se verían datos en una base de datos NoSQL como DynamoDB.

/*
// Ejemplo de datos en una tabla DynamoDB (colección de "ítems")

// Ítem 1 (usuario con email y teléfono)
{
  "UserId": "user123",
  "Username": "alice",
  "Email": "alice@example.com",
  "Phone": "555-1234"
}

// Ítem 2 (otro usuario que solo tiene email)
{
  "UserId": "user456",
  "Username": "bob",
  "Email": "bob@example.com"
}

// Ítem 3 (un producto, en la misma "tabla" o colección si el diseño lo permite)
// Nota: en DynamoDB, esto sería una tabla diferente, ya que el "Partition Key" (clave primaria)
// sería distinto. Este ejemplo es más general de NoSQL.
// En DynamoDB, típicamente tendrías tablas separadas como 'Users' y 'Products'.
{
  "ProductId": "prod001",
  "Name": "Laptop X1",
  "Category": "Electronics",
  "Price": 1200.00,
  "Features": ["lightweight", "long battery life"]
}

// En una base de datos relacional, necesitarías una tabla 'Users' y otra 'Products',
// con esquemas fijos para cada una. En NoSQL, especialmente documentales, puedes tener
// documentos con estructuras variadas dentro de la misma colección (aunque en DynamoDB
// los ítems en una tabla comparten la misma clave primaria y una estructura base).

// Ejemplo de un error común: Intentar aplicar joins complejos entre "tablas"
// como lo harías en SQL.
// DynamoDB no está diseñado para joins complejos. Si tu aplicación necesita
// muchas relaciones y joins, una base de datos relacional (como RDS) podría ser mejor.
// En NoSQL, la desnormalización es común, o se manejan relaciones a nivel de aplicación.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Bases de Datos en AWS',
    'topic': 'Amazon DynamoDB',
    'subtopic': 'Tablas e índices',
    'definition': r'''
Pensemos en cómo organizas tus datos en una base de datos NoSQL como Amazon DynamoDB. En lugar de las tablas relacionales tradicionales, en DynamoDB trabajas con "tablas" donde cada entrada es un "ítem" (similar a una fila en SQL) y cada ítem tiene "atributos" (similares a columnas). Pero lo más importante para el rendimiento y la forma en que consultas tus datos son las "claves primarias" y los "índices".

Aquí te va la aclaración: cada tabla en DynamoDB debe tener una "clave primaria". Esta clave puede ser de dos tipos:
* **Clave de partición (Partition Key)**: Es una clave simple. DynamoDB usa este valor para distribuir los datos entre sus nodos de almacenamiento. Es fundamental para las operaciones de lectura y escritura de alta concurrencia. Si solo usas una clave de partición, puedes recuperar ítems muy rápidamente si conoces su valor exacto.
* **Clave de partición y clave de clasificación (Partition Key y Sort Key)**: Esto es una clave compuesta. La clave de partición sigue funcionando igual, pero la clave de clasificación te permite ordenar los ítems dentro de una misma partición. Esto es increíblemente poderoso para consultar rangos de datos de forma eficiente. Por ejemplo, si tu clave de partición es `UserID` y tu clave de clasificación es `Timestamp`, puedes encontrar todos los eventos de un usuario dentro de un rango de tiempo.

¿Te estás preguntando por qué esto importa? Esto tiene una explicación, y es porque el diseño de tus claves primarias es lo más crítico para el rendimiento y la escalabilidad en DynamoDB. Si tu aplicación necesita consultar datos de formas que no están cubiertas por tu clave primaria, ahí es donde entran en juego los "índices". DynamoDB ofrece dos tipos de índices secundarios:
* **Índices secundarios globales (Global Secondary Indexes - GSI)**: Son como nuevas "tablas" con una clave primaria diferente a la de tu tabla principal. Te permiten consultar la tabla principal usando atributos que no son parte de tu clave primaria original. Por ejemplo, si tu tabla principal está indexada por `UserID`, pero necesitas buscar por `Email`, puedes crear un GSI en el atributo `Email`. Los GSI son "globales" porque pueden abarcar todas las particiones de la tabla principal.
* **Índices secundarios locales (Local Secondary Indexes - LSI)**: Estos índices también te permiten consultar con una clave de clasificación diferente, pero deben usar la misma clave de partición que la tabla principal. Son "locales" porque el ámbito del índice se limita a una única partición de la tabla principal. Son útiles para ofrecer diferentes opciones de clasificación dentro de la misma partición.

El buen diseño de tablas e índices es la clave para desbloquear el rendimiento y la escalabilidad de DynamoDB. Si tus claves no están bien pensadas, tus consultas pueden volverse lentas o costosas.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart, sino una representación conceptual
// de cómo se crearían tablas e índices en DynamoDB (usando AWS CLI o SDK).

/*
// Ejemplo conceptual con AWS CLI: Crear una tabla con clave primaria simple (Partition Key)
# aws dynamodb create-table \
#   --table-name Users \
#   --attribute-definitions AttributeName=UserId,AttributeType=S \ # S=String
#   --key-schema AttributeName=UserId,KeyType=HASH \               # HASH = Partition Key
#   --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 # Capacidad (ver subtema siguiente)

// Ejemplo conceptual: Crear una tabla con clave primaria compuesta (Partition Key + Sort Key)
# aws dynamodb create-table \
#   --table-name Orders \
#   --attribute-definitions AttributeName=CustomerId,AttributeType=S \
#                          AttributeName=OrderId,AttributeType=S \
#   --key-schema AttributeName=CustomerId,KeyType=HASH \
#              AttributeName=OrderId,KeyType=RANGE \ # RANGE = Sort Key
#   --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5

// Ejemplo conceptual: Añadir un Índice Secundario Global (GSI) a la tabla Users
# aws dynamodb update-table \
#   --table-name Users \
#   --attribute-definitions AttributeName=Email,AttributeType=S \
#   --global-secondary-index-updates \
#     '[
#       {
#         "Create": {
#           "IndexName": "Email-Index",
#           "KeySchema": [
#             {"AttributeName": "Email", "KeyType": "HASH"}
#           ],
#           "Projection": {
#             "ProjectionType": "ALL" # Proyectar todos los atributos al índice
#           },
#           "ProvisionedThroughput": {
#             "ReadCapacityUnits": 5, "WriteCapacityUnits": 5
#           }
#         }
#       }
#     ]'

# Ejemplo de un error común: Intentar consultar por un atributo sin un índice adecuado.
# Si tienes una tabla de 'Products' con 'ProductId' como Partition Key,
# e intentas buscar todos los productos por 'Category' sin un GSI en 'Category',
# tendrías que hacer un 'Scan' completo de la tabla, lo cual es ineficiente y costoso
# para tablas grandes. El error no sería de sintaxis, sino de rendimiento.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Bases de Datos en AWS',
    'topic': 'Amazon DynamoDB',
    'subtopic': 'Capacidad provisionada vs on-demand',
    'definition': r'''
Pensemos en cómo pagas por el rendimiento de tu base de datos en Amazon DynamoDB. A diferencia de otros servicios donde pagas por el tamaño del servidor o los recursos, en DynamoDB pagas por la capacidad de lectura y escritura. Y aquí es donde tienes que elegir entre dos modelos: "capacidad provisionada" y "on-demand".

No sé tú, pero a mí esto al principio me costó 🤯. La elección entre estos dos modelos es crucial para optimizar tus costos y asegurarte de que tu base de datos pueda manejar el tráfico de tu aplicación. Ambos modelos están diseñados para darte escalabilidad, pero la forma en que gestionas y pagas por esa escala es diferente.

Vamos a ver de qué se trata todo esto:

* **Capacidad Provisionada**: En este modelo, tú le dices a DynamoDB cuántas unidades de capacidad de lectura (RCU - Read Capacity Units) y escritura (WCU - Write Capacity Units) necesitas por adelantado. Cada RCU te permite realizar una lectura fuertemente consistente por segundo (o dos lecturas eventualmente consistentes) para ítems de hasta 4KB. Cada WCU te permite realizar una escritura por segundo para ítems de hasta 1KB. Tú "provisionas" esta capacidad, y pagas por ella, ya sea que la uses o no.
    * **Cuándo usarla**: Es ideal para cargas de trabajo predecibles donde sabes cuánta capacidad de lectura/escritura vas a necesitar, o para cargas de trabajo constantes. Es más económico a escala si puedes prever tu tráfico. Puedes usar el Auto Scaling de DynamoDB para ajustar automáticamente la capacidad provisionada dentro de un rango que definas.

* **Capacidad On-Demand**: Este es un modelo de pago por uso puro. No tienes que predecir tu capacidad; DynamoDB escala automáticamente para manejar cualquier carga de trabajo. Pagas por cada lectura y escritura que realizas.
    * **Cuándo usarla**: Es perfecto para cargas de trabajo impredecibles, con picos de tráfico repentinos o patrones de uso irregulares. También es genial para nuevas aplicaciones donde aún no conoces bien tus patrones de acceso, o para desarrolladores que quieren simplicidad. Puede ser un poco más caro por unidad de capacidad si tienes un tráfico muy constante y alto, pero te libera completamente de la gestión de la capacidad.

La elección entre estos dos modelos se basa en el patrón de tráfico de tu aplicación y tu necesidad de controlar los costos. Si tu tráfico es como una autopista con flujo constante, la capacidad provisionada con Auto Scaling puede ser más eficiente. Si es como una calle con tráfico impredecible, la capacidad on-demand te da flexibilidad y despreocupación.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart, sino una representación conceptual
// de cómo se elegiría el modo de capacidad al crear o modificar una tabla DynamoDB.

/*
# Ejemplo conceptual con AWS CLI: Crear una tabla con capacidad PROVISIONADA
# aws dynamodb create-table \
#   --table-name MyProvisionedTable \
#   --attribute-definitions AttributeName=Id,AttributeType=S \
#   --key-schema AttributeName=Id,KeyType=HASH \
#   --billing-mode PROVISIONED \ # Aquí especificas el modo de facturación
#   --provisioned-throughput ReadCapacityUnits=10,WriteCapacityUnits=10

# Ejemplo conceptual: Crear una tabla con capacidad ON-DEMAND
# aws dynamodb create-table \
#   --table-name MyOnDemandTable \
#   --attribute-definitions AttributeName=Id,AttributeType=S \
#   --key-schema AttributeName=Id,KeyType=HASH \
#   --billing-mode PAY_PER_REQUEST # Esto habilita el modo on-demand

# Ejemplo: Modificar una tabla existente de provisionada a on-demand
# aws dynamodb update-table \
#   --table-name MyProvisionedTable \
#   --billing-mode PAY_PER_REQUEST

# Ejemplo de un error común: Subestimar la capacidad provisionada.
# Si provisionas muy pocas RCUs/WCUs y tu aplicación excede esa capacidad,
# DynamoDB empezará a "limitar" tus solicitudes (throttling), lo que significa
# que las solicitudes fallarán o tardarán más. Esto se vería como errores
# o latencia alta en tu aplicación. Tienes que monitorear las métricas de CloudWatch
# para ajustar la capacidad o considerar Auto Scaling.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Bases de Datos en AWS',
    'topic': 'Amazon DynamoDB',
    'subtopic': 'Consultas básicas',
    'definition': r'''
Pensemos en cómo obtienes los datos de tu base de datos NoSQL. En Amazon DynamoDB, las formas más comunes y eficientes de recuperar datos son a través de "consultas básicas" como `GetItem`, `Query` y `Scan`. No usas SQL tradicional con `SELECT * FROM tabla WHERE...`, sino operaciones específicas que están optimizadas para el modelo de datos de DynamoDB.

Aquí te va la aclaración: la forma en que consultas tus datos en DynamoDB está directamente ligada al diseño de tus claves primarias y tus índices. Entender esto es fundamental para obtener un buen rendimiento.

Vamos a ver de qué se trata todo esto con las operaciones principales:

* **`GetItem`**: Esta es la operación más sencilla y eficiente. La usas cuando conoces la clave primaria completa (tanto la clave de partición como, si aplica, la clave de clasificación) de un ítem que quieres recuperar. Es como ir directamente a buscar un libro por su título y autor exactos en una biblioteca bien organizada. `GetItem` es ideal para acceder a un único ítem rápidamente.
* **`Query`**: Esta operación te permite recuperar múltiples ítems de una "partición" específica. Necesitas especificar el valor exacto de la "clave de partición". Luego, puedes añadir condiciones a la "clave de clasificación" (si tienes una) para filtrar los resultados. Por ejemplo, si tienes una clave de partición `UserID` y una clave de clasificación `Timestamp`, puedes consultar todos los eventos de un usuario (UserID) que ocurrieron entre dos fechas (Timestamp). `Query` es muy eficiente porque solo trabaja dentro de una partición o un grupo de particiones relacionadas.
* **`Scan`**: Esta operación es la más flexible, pero también la menos eficiente para tablas grandes. Un `Scan` lee todos los ítems de una tabla (o de un índice) y luego filtra los resultados en el lado del cliente (o en el servidor de DynamoDB antes de enviarlos). Es como revisar todos los libros de la biblioteca uno por uno para encontrar los que cumplen ciertas características.
    * **Cuándo usarla**: Evita `Scan` en tablas grandes o en rutas críticas de tu aplicación si es posible, ya que consume mucha capacidad de lectura y puede ser lento. Es más adecuado para operaciones ocasionales de auditoría, exportación de datos, o para tablas pequeñas.

El uso de `GetItem` y `Query` es siempre preferible a `Scan` para operaciones de lectura frecuentes, ya que aprovechan el diseño distribuido de DynamoDB y sus índices para un rendimiento óptimo. Si necesitas consultar por atributos que no forman parte de tu clave primaria, recuerda que los Índices Secundarios Globales (GSI) son la herramienta para eso, y al consultarlos, usarías operaciones `Query` o `Scan` sobre el índice en lugar de la tabla principal.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart, sino un ejemplo conceptual con AWS SDK para JavaScript (o similar)
// de cómo realizar consultas básicas en DynamoDB.

/*
// Suponiendo una tabla 'Products' con Partition Key: 'ProductId'
// y Sort Key: 'Category' (un diseño de clave compuesta un poco inusual, pero para ejemplo)

// const AWS = require('aws-sdk');
// const dynamodb = new AWS.DynamoDB.DocumentClient();

// 1. Operación GetItem: Obtener un ítem específico
// (Ideal cuando conoces la clave primaria completa)
// async function getProduct(productId, category) {
//   const params = {
//     TableName: 'Products',
//     Key: {
//       'ProductId': productId,
//       'Category': category
//     }
//   };
//   try {
//     const data = await dynamodb.get(params).promise();
//     console.log('GetItem Result:', data.Item);
//     return data.Item;
//   } catch (error) {
//     console.error('Error GetItem:', error);
//   }
// }
// getProduct('LAPTOP001', 'Electronics');

// 2. Operación Query: Obtener ítems basados en la clave de partición (y opcionalmente Sort Key)
// (Ideal para obtener colecciones de ítems en una partición)
// Suponiendo que 'Category' es la Partition Key y 'Price' la Sort Key
// async function getProductsByCategory(category, minPrice) {
//   const params = {
//     TableName: 'ProductsByCategory', // Otra tabla con Category como PK y Price como SK
//     KeyConditionExpression: 'Category = :cat AND Price >= :minP',
//     ExpressionAttributeValues: {
//       ':cat': category,
//       ':minP': minPrice
//     }
//   };
//   try {
//     const data = await dynamodb.query(params).promise();
//     console.log('Query Result:', data.Items);
//     return data.Items;
//   } catch (error) {
//     console.error('Error Query:', error);
//   }
// }
// getProductsByCategory('Electronics', 500);

// 3. Operación Scan: Escanear toda la tabla (usar con precaución en producción)
// (Solo si realmente necesitas revisar todos los ítems o para tablas pequeñas)
// async function getAllProducts() {
//   const params = {
//     TableName: 'Products',
//     FilterExpression: 'Price > :p', // Opcional: filtrar resultados después de leer
//     ExpressionAttributeValues: {
//       ':p': 100
//     }
//   };
//   try {
//     const data = await dynamodb.scan(params).promise();
//     console.log('Scan Result:', data.Items);
//     return data.Items;
//   } catch (error) {
//     console.error('Error Scan:', error);
//   }
// }
// getAllProducts();

// Ejemplo de un error común: Intentar hacer un Query sin especificar la clave de partición.
// No puedes hacer un Query por un atributo que no es la clave de partición (a menos que uses un GSI).
// Si tu clave de partición es 'ProductId' y intentas hacer un query solo por 'Price', fallaría.
// Necesitarías un GSI sobre 'Price' para eso, o hacer un 'Scan' (menos eficiente).
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Bases de Datos en AWS',
    'topic': 'Amazon ElastiCache',
    'subtopic': 'Redis vs Memcached',
    'definition': r'''
Pensemos por un momento en cómo las aplicaciones web y móviles manejan un montón de solicitudes al mismo tiempo. Para que todo sea súper rápido, se utiliza un "cache" o caché, que es como una memoria temporal donde se guardan los datos más usados para no tener que ir a la base de datos principal cada vez. Amazon ElastiCache es el servicio de AWS que te permite desplegar, operar y escalar sistemas de caché en memoria de alto rendimiento.

Aquí te va la aclaración: ElastiCache te ofrece dos motores de caching populares: "Redis" y "Memcached". Aunque ambos sirven para acelerar tus aplicaciones guardando datos en memoria, tienen diferencias importantes que los hacen más adecuados para ciertos escenarios. Elegir el motor correcto es clave para el éxito de tu estrategia de caché.

Vamos a ver de qué se trata todo esto con las diferencias principales:

* **Redis (REmote DIctionary Server)**:
    * **¿Qué es?** Es más que un simple caché; es una estructura de datos en memoria versátil. Soporta una variedad de estructuras de datos como strings, hashes, listas, sets, sorted sets.
    * **Funcionalidades**: Permite persistencia de datos (guardar los datos en disco para que no se pierdan si el caché se reinicia), replicación (para alta disponibilidad y lectura escalable), transacciones atómicas, y pub/sub (publicar/suscribir mensajes).
    * **Casos de uso**: Ideal para tablas de clasificación de juegos, conteo en tiempo real, colas de mensajes, sesiones de usuario complejas y caching general donde la persistencia o estructuras de datos avanzadas son necesarias. Es excelente cuando necesitas más que un simple almacenamiento clave-valor.
    * **Escalabilidad**: Soporta clústeres para escalar tanto en lectura como en escritura.

* **Memcached**:
    * **¿Qué es?** Es un sistema de almacenamiento distribuido de objetos de caché de clave-valor. Es más sencillo y está diseñado específicamente para el caching.
    * **Funcionalidades**: Es multi-hilo, lo que significa que puede aprovechar múltiples núcleos de CPU. Su enfoque es la simplicidad y la velocidad para operaciones básicas de clave-valor. No ofrece persistencia ni replicación nativa.
    * **Casos de uso**: Muy bueno para caching de objetos simples y sesiones de usuario cuando la durabilidad no es una prioridad y tu aplicación maneja muchos accesos a la misma caché. Es ideal para escalabilidad horizontal masiva (simplemente añades más nodos).
    * **Escalabilidad**: Escala horizontalmente añadiendo más nodos para distribuir la carga.

En resumen, si necesitas funcionalidades avanzadas, persistencia de datos o estructuras de datos complejas, Redis es probablemente tu elección. Si buscas una caché simple, escalable y rápida para objetos básicos, Memcached podría ser suficiente y más económico.
''',
    'code_example': r'''
// No hay código de programación directo para "Redis vs Memcached" aquí,
// ya que la elección se hace durante la configuración de ElastiCache.
// Sin embargo, este es un ejemplo conceptual en Python de cómo interactuarías
// con ambos motores desde tu aplicación.

/*
// Ejemplo conceptual con Redis (usando la librería 'redis-py')
// import redis

// r = redis.Redis(host='my-redis-cache.xxxx.ng.0001.use1.cache.amazonaws.com', port=6379, db=0)

// r.set('user:123:name', 'Alice Smith')
// r.expire('user:123:name', 3600) # Expira en 1 hora
// print(f"Nombre del usuario 123: {r.get('user:123:name').decode()}")

// r.hset('product:456', mapping={'name': 'Laptop', 'price': 1200, 'stock': 50})
// print(f"Detalles del producto 456: {r.hgetall('product:456')}")

// Ejemplo conceptual con Memcached (usando la librería 'python-memcached')
// import memcache

// mc = memcache.Client(['my-memcached-cache.xxxx.ng.0001.use1.cache.amazonaws.com:11211'])

// mc.set('session_id_xyz', {'user_id': '789', 'login_time': '2025-06-02T10:00:00'}, time=300) # Expira en 5 min
// print(f"Datos de sesión: {mc.get('session_id_xyz')}")

// mc.set('popular_article_content', '<html>...</html>')
// print(f"Contenido del artículo: {mc.get('popular_article_content')}")

// Ejemplo de un error común: Usar Redis para un caso de uso que Memcached maneja mejor,
// o viceversa, lo que lleva a un sobreprovisionamiento o subutilización de funcionalidades.
// Por ejemplo, usar Redis con persistencia habilitada si solo necesitas una caché volátil
// para objetos simples y no te importa perderlos en un reinicio, estaría incurriendo
// en costos de almacenamiento y complejidad innecesarios.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Bases de Datos en AWS',
    'topic': 'Amazon ElastiCache',
    'subtopic': 'Casos de uso',
    'definition': r'''
Pensemos en dónde puedes usar Amazon ElastiCache para hacer que tus aplicaciones vuelen. Este servicio es una herramienta poderosa para acelerar el acceso a datos, pero es importante entender sus "casos de uso" clave para aplicarlo correctamente. No es una base de datos principal, sino una capa de aceleración.

¿Te estás preguntando por qué esto importa? 

Porque el caching es una técnica fundamental para mejorar el rendimiento, reducir la carga en tus bases de datos y APIs, y disminuir la latencia para tus usuarios. Si identificas los casos de uso adecuados, puedes transformar la experiencia de tu aplicación.

Vamos a ver de qué se trata todo esto con algunos de los casos de uso más comunes para ElastiCache:

* **Caching de bases de datos**: Este es el caso de uso más clásico. Si tienes una base de datos (como RDS o DynamoDB) que recibe muchas consultas de lectura para los mismos datos (por ejemplo, perfiles de usuario, productos populares, resultados de búsquedas frecuentes), puedes almacenar esos resultados en ElastiCache. La próxima vez que alguien solicite esos datos, se servirán desde la memoria ultra-rápida del caché en lugar de ir a la base de datos más lenta.
* **Caching de sesiones**: Para aplicaciones web con muchos usuarios, almacenar los datos de sesión de los usuarios (como información de login, preferencias del carrito de compras) en un caché como ElastiCache (especialmente Redis por su persistencia opcional y replicación) permite que las sesiones sean consistentes en múltiples servidores web. Si un servidor falla, la sesión aún está disponible para otro servidor.
* **Contadores y tablas de clasificación en tiempo real**: En aplicaciones de juegos o redes sociales, necesitas contadores que se actualicen muy rápido (número de "me gusta", vistas, etc.) o tablas de clasificación que cambien constantemente. Redis, con sus estructuras de datos atómicas y de alto rendimiento, es perfecto para este tipo de operaciones.
* **Aceleración de APIs**: Si tu aplicación consume APIs externas que tienen límites de tasa o son lentas, puedes almacenar las respuestas de esas APIs en ElastiCache. Esto reduce la dependencia de la API externa y acelera las respuestas para tus usuarios.
* **Colas de mensajes simples/pub-sub**: Aunque no es un servicio de cola de mensajes dedicado como SQS, Redis tiene funcionalidades de pub/sub que pueden ser útiles para escenarios simples de comunicación entre componentes de tu aplicación en tiempo real.

En resumen, si tu aplicación sufre de latencia, si tus bases de datos están sobrecargadas por lecturas repetitivas, o si necesitas acceso a datos ultra-rápido para contadores o sesiones, ElastiCache es tu amigo.
''',
    'code_example': r'''
// No hay código de programación directo para "casos de uso", ya que son patrones de arquitectura.
// Sin embargo, aquí hay un ejemplo conceptual de cómo el código de tu aplicación
// usaría ElastiCache para caching de base de datos.

/*
// Ejemplo conceptual en Python usando ElastiCache para caching de DB

// import redis # O import memcache, dependiendo del motor
// import database_connector # Tu módulo para interactuar con la DB real

// # Configuración del caché
// redis_client = redis.Redis(host='my-cache-endpoint.xxxx.cache.amazonaws.com', port=6379)

// def get_user_profile(user_id):
//     # 1. Intentar obtener el perfil del usuario desde el caché
//     cache_key = f'user_profile:{user_id}'
//     cached_profile = redis_client.get(cache_key)

//     if cached_profile:
//         print(f"Perfil de usuario {user_id} encontrado en caché.")
//         return json.loads(cached_profile) # Asumiendo que guardamos JSON

//     # 2. Si no está en caché, ir a la base de datos
//     print(f"Perfil de usuario {user_id} NO encontrado en caché. Consultando DB...")
//     db_profile = database_connector.fetch_user_from_db(user_id)

//     if db_profile:
//         # 3. Guardar el perfil en caché para futuras solicitudes (con expiración)
//         redis_client.set(cache_key, json.dumps(db_profile), ex=3600) # Cache por 1 hora
//         print(f"Perfil de usuario {user_id} guardado en caché.")
//         return db_profile
//     else:
//         print(f"Perfil de usuario {user_id} no encontrado en la DB.")
//         return None

// # Uso:
// # profile1 = get_user_profile("user123") # Primera vez, va a DB y cachea
// # profile2 = get_user_profile("user123") # Segunda vez, viene del caché
// # profile3 = get_user_profile("user456") # Nuevo usuario, va a DB

// Ejemplo de un error común: No invalidar la caché cuando los datos cambian.
// Si actualizas el perfil de un usuario en la base de datos, pero no eliminas o actualizas
// la entrada correspondiente en la caché, tu aplicación seguirá sirviendo datos antiguos
// del caché. Esto se llama "stale data" y es un problema común en el caching.
// Necesitas una estrategia para invalidar la caché (ej. eliminar la clave 'user_profile:123'
// cada vez que el perfil de user123 se actualice en la DB).
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Bases de Datos en AWS',
    'topic': 'Amazon ElastiCache',
    'subtopic': 'Configuración básica',
    'definition': r'''
Configurar Amazon ElastiCache es el primer paso para integrar una capa de caching de alto rendimiento en tus aplicaciones. Aunque AWS gestiona la mayor parte de la infraestructura, necesitas tomar algunas decisiones clave para asegurarte de que tu caché funcione de manera óptima para tus necesidades.

No sé tú, pero a mí esto al principio me costó. 

Lo primero que harás es elegir el "motor de caché" (Redis o Memcached), como vimos antes. Esta decisión impactará las funcionalidades y las capacidades de tu caché. Luego, seleccionarás el "tipo de nodo", que es el tamaño del servidor que ejecutará tu caché (similar a los tipos de instancia EC2, con diferentes combinaciones de CPU y memoria). Un tipo de nodo más grande te dará más capacidad de memoria y un mejor rendimiento.

También configurarás el "número de nodos" en tu clúster. Para Redis, puedes tener nodos de réplica para alta disponibilidad y escalabilidad de lectura. Para Memcached, simplemente añades más nodos para escalar horizontalmente la capacidad. Es importante definir el "grupo de subredes", que es un conjunto de subredes dentro de tu VPC donde se desplegarán tus nodos de caché. Esto asegura que tus instancias EC2 puedan comunicarse con ElastiCache. Finalmente, establecerás los "grupos de seguridad" para controlar el acceso a tu clúster de ElastiCache, asegurándote de que solo tus aplicaciones autorizadas puedan conectarse. Un error común es dejar el puerto del caché abierto a IPs no autorizadas o, por el contrario, no abrirlo a tus instancias EC2.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart, sino un ejemplo conceptual con AWS CLI
// para crear un clúster de ElastiCache.

/*
# Ejemplo conceptual con AWS CLI: Creación de un clúster de ElastiCache (Redis)

# 1. Crear un grupo de subredes (si no tienes uno existente)
# Necesitas al menos dos subredes en diferentes Availability Zones para alta disponibilidad.
# aws elasticache create-cache-subnet-group \
#   --cache-subnet-group-name my-redis-subnet-group \
#   --cache-subnet-group-description "Subnet group for Redis cluster" \
#   --subnet-ids subnet-0abcdef1234567890 subnet-0fedcba9876543210

# 2. Crear un clúster de ElastiCache Redis
# aws elasticache create-cache-cluster \
#   --cache-cluster-id my-redis-cluster \
#   --cache-node-type cache.t3.micro \         # Tipo de nodo (ej. t3.micro)
#   --engine redis \
#   --num-cache-nodes 1 \                     # Número de nodos inicial
#   --cache-subnet-group-name my-redis-subnet-group \
#   --security-group-ids sg-0abcdef1234567890 \ # Tu Security Group para acceso
#   --port 6379 \                              # Puerto estándar de Redis
#   --preferred-maintenance-window "sun:03:00-sun:04:00"

# Si quieres un clúster de Redis con replicación (para alta disponibilidad):
# aws elasticache create-replication-group \
#   --replication-group-id my-redis-replication-group \
#   --replication-group-description "My highly available Redis cluster" \
#   --engine redis \
#   --cache-node-type cache.m5.large \
#   --num-cache-clusters 3 \ # Un primario y dos réplicas
#   --cache-subnet-group-name my-redis-subnet-group \
#   --security-group-ids sg-0abcdef1234567890 \
#   --automatic-failover enabled \
#   --port 6379

# Ejemplo de un error común: No configurar correctamente los grupos de seguridad.
# Si tu grupo de seguridad del clúster ElastiCache no permite el tráfico de entrada
# desde el grupo de seguridad de tus instancias EC2 (o sus IPs/CIDR), tus aplicaciones
# no podrán conectarse al caché, resultando en errores de conexión o timeouts.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Bases de Datos en AWS',
    'topic': 'Amazon ElastiCache',
    'subtopic': 'Seguridad',
    'definition': r'''
Pensemos en cómo aseguras que tus datos en caché estén protegidos. La "seguridad" en Amazon ElastiCache es una capa crucial para evitar el acceso no autorizado a tu información sensible y asegurar la integridad de tus datos en memoria. No se trata solo de la red, sino también de la autenticación y el cifrado.

Aquí te va la aclaración: la seguridad en ElastiCache se aborda en varias dimensiones. 

Primero, a nivel de red, los "grupos de seguridad" son tu primera línea de defensa. Debes configurar el grupo de seguridad asociado a tu clúster de ElastiCache para que solo permita conexiones desde las instancias EC2 o subredes específicas que necesitan acceder a la caché. Exponer tu caché a todo el mundo es un riesgo enorme.

Luego, para Redis (que es más robusto en seguridad que Memcached), tienes opciones de "autenticación" y "cifrado":
* **Autenticación (AUTH token/IAM)**: Puedes configurar un clúster de Redis para requerir un token de autenticación (similar a una contraseña) o usar autenticación basada en IAM, lo que te permite gestionar el acceso a través de roles y políticas de AWS. Esto es fundamental para asegurar que solo las aplicaciones con las credenciales correctas puedan leer o escribir en la caché.
* **Cifrado en tránsito (Encryption in Transit)**: Esto asegura que los datos estén cifrados mientras viajan entre tu aplicación y los nodos de ElastiCache. Es esencial si manejas datos sensibles y necesitas cumplir con normativas.
* **Cifrado en reposo (Encryption at Rest)**: Para los motores Redis que soportan persistencia, puedes cifrar los datos cuando se guardan en el disco. Esto protege los datos si el almacenamiento subyacente es comprometido.

Finalmente, las "políticas de IAM" también juegan un papel importante para controlar quién puede crear, modificar o eliminar tus clústeres de ElastiCache. Implementar una estrategia de seguridad en capas, combinando grupos de seguridad, autenticación y cifrado, es la mejor práctica para proteger tus datos en ElastiCache.
''',
    'code_example': r'''
// No hay código de programación directo para "Seguridad" en sí,
// sino ejemplos de cómo configurar las características de seguridad
// al crear o modificar un clúster de ElastiCache.

/*
# Ejemplo conceptual con AWS CLI: Crear un clúster Redis con cifrado en tránsito y autenticación
# aws elasticache create-cache-cluster \
#   --cache-cluster-id my-secure-redis-cluster \
#   --cache-node-type cache.t3.micro \
#   --engine redis \
#   --num-cache-nodes 1 \
#   --cache-subnet-group-name my-redis-subnet-group \
#   --security-group-ids sg-0abcdef1234567890 \
#   --transit-encryption-enabled \         # Habilitar cifrado en tránsito
#   --auth-token "MySuperSecureCacheToken123!" \ # Token de autenticación (contraseña)
#   --port 6379

# Para habilitar el cifrado en reposo (solo para Redis con persistencia):
# aws elasticache modify-replication-group \
#   --replication-group-id my-redis-replication-group \
#   --transit-encryption-enabled \
#   --at-rest-encryption-enabled \ # Habilitar cifrado en reposo
#   --apply-immediately

# Ejemplo de un error común de seguridad: Exponer el puerto del caché públicamente.
# Si abres el puerto 6379 (Redis) o 11211 (Memcached) en el grupo de seguridad
# del clúster ElastiCache a '0.0.0.0/0' (cualquier IP), tu caché sería accesible
# desde internet. Esto es una vulnerabilidad grave y expone tus datos a cualquiera
# que conozca la dirección IP de tu caché. Siempre restringe el acceso solo a las
# IPs o grupos de seguridad de tus aplicaciones.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Bases de Datos en AWS',
    'topic': 'AWS Database Migration Service',
    'subtopic': 'Migraciones homogéneas y heterogéneas',
    'definition': r'''
Pensemos por un momento que tienes una base de datos funcionando en un lugar y quieres moverla a otro, quizás a la nube de AWS. AWS Database Migration Service (DMS) es un servicio que facilita esta tarea, permitiéndote migrar bases de datos de forma rápida y segura, con un tiempo de inactividad mínimo o incluso nulo. La clave de DMS es que soporta diferentes tipos de migraciones.

Aquí te va la aclaración: las migraciones de bases de datos pueden ser de dos tipos principales: "homogéneas" y "heterogéneas". La diferencia radica en si cambias el motor de base de datos o no.

Vamos a ver de qué se trata todo esto:

* **Migraciones Homogéneas**:
    * **¿Qué son?** Estas migraciones ocurren cuando el motor de la base de datos de origen y el de destino son el mismo. Por ejemplo, migrar de una base de datos MySQL en tu centro de datos local a una instancia de Amazon RDS para MySQL, o de SQL Server en una EC2 a RDS para SQL Server.
    * **Ventaja**: Son generalmente más sencillas y rápidas porque el esquema y los tipos de datos son compatibles. No necesitas convertir el código SQL ni los procedimientos almacenados, lo que reduce la complejidad y el riesgo de errores.
    * **DMS en acción**: Para migraciones homogéneas, DMS se enfoca en replicar los datos y asegurar la consistencia. Puede manejar la réplica de datos en tiempo real entre las dos bases de datos.

* **Migraciones Heterogéneas**:
    * **¿Qué son?** Aquí es donde el motor de la base de datos de origen y el de destino son diferentes. Por ejemplo, migrar de Oracle a Amazon Aurora (compatible con PostgreSQL o MySQL), o de SQL Server a PostgreSQL en RDS.
    * **Desafío**: Estas migraciones son mucho más complejas porque el esquema, los tipos de datos, los procedimientos almacenados, las funciones y el código SQL pueden ser incompatibles entre los motores. Requieren un proceso de "conversión de esquema".
    * **DMS en acción**: Para ayudar con esto, AWS DMS se integra con la "AWS Schema Conversion Tool (SCT)". La SCT analiza el esquema de la base de datos de origen y el código de la aplicación, y luego genera un informe de evaluación y convierte automáticamente gran parte del esquema y el código al formato del motor de destino. Las partes que no puede convertir automáticamente deben ser revisadas y modificadas manualmente. DMS luego se encarga de la migración de los datos.

¿Te estás preguntando por qué esto importa? Esto tiene una explicación, y es porque comprender la diferencia entre estos tipos de migración te permite planificar mejor tu proyecto de migración y elegir las herramientas adecuadas. Si tu objetivo es modernizar y cambiar de motor de base de datos, una migración heterogénea te da esa flexibilidad, pero también conlleva un mayor esfuerzo de planificación y conversión. Si solo quieres mover tu base de datos a la nube manteniendo el mismo motor, una migración homogénea con DMS es tu mejor apuesta.
''',
    'code_example': r'''
// No hay código de programación directo para "migraciones homogéneas y heterogéneas"
// ya que es una característica de diseño y servicio de AWS DMS.
// Sin embargo, este es un ejemplo conceptual de cómo usarías la AWS CLI
// para iniciar una tarea de replicación que soporta ambos tipos.

/*
# Ejemplo conceptual con AWS CLI para crear una tarea de replicación en DMS

# El tipo de migración (homogénea o heterogénea) se infiere por los endpoints
# de origen y destino y el tipo de motor de DB que configures en ellos.

# 1. Crear un endpoint de origen (ej. MySQL local)
# aws dms create-endpoint \
#   --endpoint-identifier my-source-mysql \
#   --endpoint-type source \
#   --engine-name mysql \
#   --username root \
#   --password yourpassword \
#   --server-name 192.168.1.100 \
#   --port 3306 \
#   --database-name mydb

# 2. Crear un endpoint de destino (ej. PostgreSQL en RDS)
# aws dms create-endpoint \
#   --endpoint-identifier my-target-postgres \
#   --endpoint-type target \
#   --engine-name postgres \
#   --username postgres \
#   --password yourpassword \
#   --server-name my-rds-postgres.xxxx.us-east-1.rds.amazonaws.com \
#   --port 5432 \
#   --database-name mydb

# Si el origen es MySQL y el destino es PostgreSQL, DMS reconocerá que es una
# migración heterogénea y requerirá la AWS Schema Conversion Tool (SCT) para la conversión del esquema.

# 3. Crear una instancia de replicación (el servidor que ejecuta la migración)
# aws dms create-replication-instance \
#   --replication-instance-identifier my-dms-instance \
#   --replication-instance-class dms.t3.medium \
#   --allocated-storage 50 \
#   --vpc-security-group-ids sg-0abcdef1234567890 \
#   --replication-subnet-group-identifier my-dms-subnet-group # Un grupo de subredes DMS

# 4. Crear una tarea de replicación
# aws dms create-replication-task \
#   --replication-task-identifier my-migration-task \
#   --source-endpoint-arn arn:aws:dms:us-east-1:123456789012:endpoint:my-source-mysql \
#   --target-endpoint-arn arn:aws:dms:us-east-1:123456789012:endpoint:my-target-postgres \
#   --replication-instance-arn arn:aws:dms:us-east-1:123456789012:rep:my-dms-instance \
#   --migration-type full-load-and-cdc \ # Full load (carga inicial) + CDC (cambios continuos)
#   --table-mappings "file://table-mappings.json" # Archivo JSON con mapeos de tablas

# Contenido de table-mappings.json (ejemplo básico para una tabla 'users' en 'mydb'):
# {
#   "rules": [
#     {
#       "rule-type": "selection",
#       "schema-name": "mydb",
#       "object-pattern": "users",
#       "include-columns": [
#         {"name": "id"},
#         {"name": "username"},
#         {"name": "email"}
#       ]
#     }
#   ]
# }

# Ejemplo de un error común: Intentar realizar una migración heterogénea compleja sin usar AWS SCT.
# Si intentas migrar de Oracle a PostgreSQL sin pasar por la SCT para convertir el esquema
# y el código, la tarea de DMS probablemente fallará o generará errores de datos porque los
# tipos de datos y las funciones no coinciden. SCT es esencial para la fase de preparación de estas migraciones.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Bases de Datos en AWS',
    'topic': 'AWS Database Migration Service',
    'subtopic': 'Configuración básica',
    'definition': r'''
Pensemos en los componentes que necesitas para poner en marcha una migración de base de datos con AWS DMS. La "configuración básica" de DMS implica establecer varios elementos clave que trabajan juntos para mover tus datos de un lugar a otro. No es una herramienta de un solo clic, pero AWS abstrae mucha de la complejidad.

Aquí te va la aclaración: para usar DMS, necesitas tres componentes principales:

1.  **Instancia de replicación (Replication Instance)**: Piensa en esto como el "motor" o el "servidor" que ejecuta el proceso de migración de datos. Es una instancia EC2 administrada por AWS que se encarga de conectar con la base de datos de origen y destino, leer los datos, transformarlos si es necesario y escribirlos en el destino. Tú eliges el tamaño de esta instancia (su tipo, como `dms.t3.medium`), lo cual afectará el rendimiento y la velocidad de tu migración. Una instancia más potente puede mover más datos más rápido.

2.  **Endpoints de origen y destino (Source and Target Endpoints)**: Estos son los "puntos de conexión" que DMS usa para comunicarse con tus bases de datos. Para el "endpoint de origen", le proporcionas a DMS la información de conexión de tu base de datos actual (tipo de motor, dirección IP/nombre de host, puerto, nombre de usuario y contraseña). Lo mismo haces para el "endpoint de destino", que será tu base de datos en AWS (como una instancia RDS o una tabla DynamoDB, etc.). La configuración de los permisos adecuados para que DMS pueda acceder a ambas bases de datos es crucial.

3.  **Tarea de replicación (Replication Task)**: Esta es la "instrucción" o "plan" que le das a DMS sobre qué datos migrar y cómo. Aquí defines:
    * **Tipo de migración**: ¿Quieres una "carga completa" (Full Load) de todos los datos existentes? ¿O solo quieres replicar "cambios de datos continuos" (Change Data Capture - CDC) que ocurran después de un cierto punto? ¿O quizás una combinación de ambos (carga completa + CDC para mantener sincronizado)?
    * **Mapeo de tablas (Table Mappings)**: Aquí especificas qué tablas y esquemas quieres migrar. Puedes seleccionar todas las tablas, tablas específicas, o incluso filtrar filas si es necesario. Para migraciones heterogéneas, aquí también se considera cómo se transforman los datos entre los motores.

Una vez que estos tres componentes están configurados, inicias la tarea de replicación, y DMS se encarga del resto, haciendo el proceso de migración mucho más manejable. Un error común es que la instancia de replicación no tiene la conectividad de red adecuada (por ejemplo, el grupo de seguridad no permite el tráfico al puerto de la base de datos) o los permisos de IAM necesarios para leer/escribir en los endpoints.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart. La configuración básica de DMS
// se realiza a través de la consola de AWS o AWS CLI.

/*
# Comandos conceptuales de AWS CLI para la configuración básica de DMS (ejemplo simplificado)

# 1. Crear la instancia de replicación
# aws dms create-replication-instance \
#   --replication-instance-identifier my-dms-instance \
#   --replication-instance-class dms.t3.medium \ # Elige el tamaño adecuado
#   --allocated-storage 50 \ # Almacenamiento para logs y cachés del DMS
#   --vpc-security-group-ids sg-0abcdef1234567890 \ # SG que permite acceso a DBs
#   --replication-subnet-group-identifier my-dms-subnet-group # Define subredes para DMS

# 2. Crear el endpoint de origen (ej. una DB Oracle local)
# aws dms create-endpoint \
#   --endpoint-identifier my-onprem-oracle \
#   --endpoint-type source \
#   --engine-name oracle \
#   --server-name 192.168.1.50 \
#   --port 1521 \
#   --database-name ORCL \
#   --username dms_user \
#   --password dms_password \
#   --extra-connection-attributes "sid=ORCL"

# 3. Crear el endpoint de destino (ej. una DB PostgreSQL en RDS)
# aws dms create-endpoint \
#   --endpoint-identifier my-rds-postgres \
#   --endpoint-type target \
#   --engine-name postgres \
#   --server-name my-rds-db.xxxx.us-east-1.rds.amazonaws.com \
#   --port 5432 \
#   --database-name migrated_db \
#   --username rds_admin \
#   --password rds_password

# 4. Crear la tarea de replicación
# aws dms create-replication-task \
#   --replication-task-identifier oracle-to-postgres-migration \
#   --source-endpoint-arn arn:aws:dms:us-east-1:123456789012:endpoint:my-onprem-oracle \
#   --target-endpoint-arn arn:aws:dms:us-east-1:123456789012:endpoint:my-rds-postgres \
#   --replication-instance-arn arn:aws:dms:us-east-1:123456789012:rep:my-dms-instance \
#   --migration-type full-load-and-cdc \ # Carga inicial y replicación continua
#   --table-mappings "file://table-mappings.json" \ # Archivo JSON con qué tablas migrar

# Ejemplo de un error común: Credenciales incorrectas para los endpoints.
# Si el usuario y contraseña que DMS usa para conectarse a la base de datos de origen
# o destino no tienen los permisos correctos (ej. SELECT en todas las tablas del origen,
# INSERT/UPDATE/DELETE en el destino), la tarea de migración fallará con errores de acceso.
# Siempre verifica los permisos de la cuenta de usuario de la base de datos que usa DMS.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Bases de Datos en AWS',
    'topic': 'AWS Database Migration Service',
    'subtopic': 'Continuous replication',
    'definition': r'''
Pensemos en mantener dos bases de datos sincronizadas, incluso cuando una está en tu centro de datos y la otra en la nube, y los datos no paran de cambiar. La "replicación continua" o "Change Data Capture (CDC)" en AWS DMS es una característica superpotente que te permite hacer precisamente eso: capturar y replicar los cambios de datos de una base de datos a otra en tiempo real.

Aquí te va la aclaración: cuando configuras una tarea de DMS con replicación continua, DMS no solo hace una carga inicial de todos los datos existentes (lo que se llama "carga completa" o Full Load), sino que también monitoriza la base de datos de origen para detectar cualquier cambio (inserciones, actualizaciones, eliminaciones). Estos cambios se capturan de los logs de transacciones de la base de datos de origen y se aplican al destino con una latencia mínima. Es como tener un espejo en tiempo real de tu base de datos, reflejando cada movimiento.

¿Te estás preguntando por qué esto importa? Esto tiene una explicación, y es porque la replicación continua es fundamental para migraciones con "tiempo de inactividad casi nulo" (near-zero downtime). Con esta característica, puedes mantener tu aplicación de producción funcionando en la base de datos de origen mientras DMS replica los datos al destino. Una vez que el destino está completamente sincronizado, puedes cortar el tráfico de tu aplicación del origen al destino, logrando una transición suave con un impacto mínimo en tus usuarios. También es útil para escenarios como la consolidación de bases de datos, la distribución de datos a diferentes bases de datos para análisis, o la creación de una réplica para recuperación ante desastres. Sin la replicación continua, cualquier migración de una base de datos activa requeriría una ventana de inactividad considerable para copiar todos los datos, lo cual no es viable para muchas aplicaciones críticas.
''',
    'code_example': r'''
// No hay código de programación directo para "Continuous replication" en sí,
// ya que es una opción de configuración de la tarea de replicación en DMS.

/*
# Ejemplo conceptual con AWS CLI: Crear una tarea de replicación con carga completa y CDC

# aws dms create-replication-task \
#   --replication-task-identifier my-continuous-replication-task \
#   --source-endpoint-arn arn:aws:dms:us-east-1:123456789012:endpoint:my-source-db \
#   --target-endpoint-arn arn:aws:dms:us-east-1:123456789012:endpoint:my-target-db \
#   --replication-instance-arn arn:aws:dms:us-east-1:123456789012:rep:my-dms-instance \
#   --migration-type full-load-and-cdc \ # ¡Esta es la clave para la replicación continua!
#   --table-mappings "file://table-mappings.json" \
#   --cdc-start-position "now" # O puedes especificar una fecha/hora o un log sequence number

# Opciones para --migration-type:
# - full-load: Solo carga inicial de datos existentes.
# - cdc: Solo replicación de cambios (asume que la carga inicial ya se hizo o no es necesaria).
# - full-load-and-cdc: Carga inicial seguida de replicación continua de cambios.

# Monitoreo de la latencia de replicación:
# En la consola de AWS DMS o con AWS CLI, puedes ver métricas como 'CDCLatencySource'
# y 'CDCLatencyTarget' para saber qué tan atrasada está la réplica.
# aws dms describe-replication-tasks --replication-task-identifier my-continuous-replication-task

# Ejemplo de un error común: No habilitar los logs de transacciones adecuados en la base de datos de origen.
# Para que DMS pueda realizar CDC, la base de datos de origen debe tener los logs de transacciones
# (como bin logs en MySQL, redo logs en Oracle, o WAL en PostgreSQL) habilitados y configurados
# de manera que DMS pueda leerlos. Si esto no está configurado correctamente, la replicación continua
# fallará o no podrá seguir los cambios. AWS tiene documentación específica para cada motor sobre cómo
# preparar la base de datos de origen para CDC.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Bases de Datos en AWS',
    'topic': 'AWS Database Migration Service',
    'subtopic': 'Validación de datos',
    'definition': r'''
Pensemos en lo crítico que es asegurarse de que, después de una migración, todos tus datos estén en el lugar correcto y sean exactamente los mismos que en el origen. La "validación de datos" en AWS DMS es una característica crucial que te ayuda a confirmar que tus datos se migraron de manera precisa y sin corrupción entre el origen y el destino. No puedes simplemente mover los datos y esperar que todo esté bien; necesitas verificarlo.

Aquí te va la aclaración: la validación de datos en DMS se asegura de que los datos en el destino coincidan byte a byte con los datos en el origen. Esto se hace comparando las filas y columnas entre ambas bases de datos. Puedes habilitar la validación durante la creación o modificación de una tarea de replicación. DMS realiza comparaciones periódicas y te informa si encuentra alguna inconsistencia.

¿Te estás preguntando por qué esto importa? Esto tiene una explicación, y es porque la integridad de tus datos es primordial. Un error en la migración, por pequeño que sea, puede tener consecuencias graves para tu aplicación y tu negocio. La validación de datos te da la confianza de que tu migración fue exitosa y que no se perdió ni se corrompió información en el proceso. Es especialmente importante en migraciones de bases de datos críticas donde la precisión de los datos es vital, como en sistemas financieros o de inventario. Si se detectan inconsistencias, DMS las reporta, y puedes optar por que DMS intente corregirlas automáticamente o puedes investigarlas y corregirlas manualmente. Este paso es el cierre de cualquier proceso de migración para asegurar que todo el esfuerzo valió la pena y tus datos están sanos y salvos en su nuevo hogar en la nube.
''',
    'code_example': r'''
// No hay código de programación directo para "Validación de datos",
// ya que es una opción de configuración de la tarea de replicación en DMS.

/*
# Ejemplo conceptual con AWS CLI: Habilitar la validación de datos en una tarea de replicación

# aws dms create-replication-task \
#   --replication-task-identifier my-validated-migration-task \
#   --source-endpoint-arn arn:aws:dms:us-east-1:123456789012:endpoint:my-source-db \
#   --target-endpoint-arn arn:aws:dms:us-east-1:123456789012:endpoint:my-target-db \
#   --replication-instance-arn arn:aws:dms:us-east-1:123456789012:rep:my-dms-instance \
#   --migration-type full-load-and-cdc \
#   --table-mappings "file://table-mappings.json" \
#   --enable-data-validation # ¡Aquí se habilita la validación de datos!

# Para una tarea existente, puedes modificarla para habilitar la validación:
# aws dms modify-replication-task \
#   --replication-task-identifier my-existing-task \
#   --enable-data-validation \
#   --apply-immediately

# Monitoreo de la validación:
# En la consola de AWS DMS, en la sección de tareas de replicación, puedes ver
# el estado de la validación de datos. Se mostrará si la validación está en curso,
# si ha terminado y si se encontraron inconsistencias. También puedes ver los detalles
# de las tablas y las inconsistencias encontradas.

# Ejemplo de un error común: Omitir la validación de datos en migraciones críticas.
# No habilitar la validación en una migración de producción o una base de datos
# con datos sensibles es un riesgo significativo. Si hay un problema en la migración
# (ej. un tipo de dato no mapeado correctamente, una fila perdida), no lo sabrías hasta
# que tu aplicación encuentre un error o detecte una inconsistencia en sus propios reportes,
# lo cual puede ser mucho más costoso de corregir post-migración.
*/
'''
  });
}

Future<void> insertJrLevel5AwsData(Database db) async {
  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Redes y Seguridad Básica',
    'topic': 'Amazon VPC',
    'subtopic': 'Componentes de VPC (Subnets, Route Tables)',
    'definition': r'''
Pensemos en tu propia red privada en la nube de AWS. Amazon Virtual Private Cloud (VPC) es el servicio que te permite lanzar recursos de AWS en una red virtual aislada lógicamente, que tú defines. Es como tener tu propio centro de datos virtual, con control total sobre tus direcciones IP, subredes, tablas de ruteo y más.

Aquí te va la aclaración: cuando creas una VPC, estás estableciendo los cimientos de tu infraestructura de red en AWS. Dentro de esa VPC, hay varios "componentes" que son esenciales para su funcionamiento y para cómo se conectan tus recursos. Los más importantes son las "subredes" y las "tablas de ruteo".

Vamos a ver de qué se trata todo esto:

* **Subredes (Subnets)**: Las subredes son divisiones de tu VPC que te permiten organizar tus recursos. Cada subred reside completamente dentro de una única Zona de Disponibilidad (Availability Zone - AZ). Esto es crucial para la alta disponibilidad: si una AZ tiene un problema, los recursos en subredes de otras AZs no se ven afectados. Las subredes pueden ser "públicas" (si tienen un Internet Gateway asociado y una ruta a él) o "privadas" (sin una ruta directa a Internet). La elección de dónde colocar tus recursos (bases de datos, servidores web, etc.) en subredes públicas o privadas es fundamental para la seguridad y la conectividad. Por ejemplo, querrás poner tus servidores web en una subred pública y tus bases de datos en una privada para protegerlas de accesos directos desde Internet.
* **Tablas de ruteo (Route Tables)**: Estas son las reglas que controlan cómo el tráfico de red sale de tus subredes. Cada subred debe estar asociada a una tabla de ruteo. La tabla de ruteo contiene un conjunto de "rutas", que son reglas que le dicen a la red a dónde enviar el tráfico con base en su dirección IP de destino. Por ejemplo, una ruta podría decir: "si el tráfico va a Internet (0.0.0.0/0), envíalo al Internet Gateway", o "si el tráfico va a otra VPC, envíalo a una conexión de Peering". La tabla de ruteo por defecto de tu VPC es la principal, pero puedes crear tablas de ruteo personalizadas y asociarlas a subredes específicas para tener un control más granular del tráfico.

La correcta configuración de tus subredes y tablas de ruteo es la base para asegurar que tus aplicaciones puedan comunicarse entre sí y con el mundo exterior de forma segura y eficiente. Un error común es configurar mal una tabla de ruteo, lo que lleva a problemas de conectividad donde tus recursos no pueden alcanzar sus destinos esperados.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart, sino una representación conceptual
// de cómo se crearían estos componentes usando AWS CLI.

/*
# Ejemplo conceptual con AWS CLI: Creación de VPC, subredes y tablas de ruteo

# 1. Crear una VPC
# aws ec2 create-vpc --cidr-block 10.0.0.0/16 --query Vpc.VpcId --output text
# (Salida: vpc-0abcdef1234567890)
# Export VpcId='vpc-0abcdef1234567890' # Guardar el ID de la VPC

# 2. Crear una subred pública en la primera AZ
# aws ec2 create-subnet \
#   --vpc-id $VpcId \
#   --cidr-block 10.0.1.0/24 \
#   --availability-zone us-east-1a \
#   --query Subnet.SubnetId --output text
# (Salida: subnet-0123456789abcdef0)
# Export PublicSubnet1Id='subnet-0123456789abcdef0'

# 3. Crear una subred privada en la primera AZ
# aws ec2 create-subnet \
#   --vpc-id $VpcId \
#   --cidr-block 10.0.2.0/24 \
#   --availability-zone us-east-1a \
#   --query Subnet.SubnetId --output text
# (Salida: subnet-0abcdef1234567891)
# Export PrivateSubnet1Id='subnet-0abcdef1234567891'

# 4. Crear una tabla de ruteo personalizada para la subred pública
# aws ec2 create-route-table --vpc-id $VpcId --query RouteTable.RouteTableId --output text
# (Salida: rtb-0fedcba9876543210)
# Export PublicRouteTableId='rtb-0fedcba9876543210'

# 5. Asociar la subred pública a su tabla de ruteo personalizada
# aws ec2 associate-route-table \
#   --route-table-id $PublicRouteTableId \
#   --subnet-id $PublicSubnet1Id

# NOTA: La tabla de ruteo principal (Main Route Table) de la VPC
# se asocia automáticamente a cualquier subred que no tenga una asociación explícita.
# Generalmente, quieres que tus subredes privadas usen la Main Route Table
# o una personalizada que no tenga ruta a Internet Gateway.

# Ejemplo de un error común: Olvidar asociar una subred a una tabla de ruteo específica.
# Si creas una subred y no la asocias explícitamente a una tabla de ruteo,
# automáticamente se asociará a la tabla de ruteo principal de la VPC.
# Si esa tabla principal tiene una ruta a Internet Gateway y tu subred
# se supone que es privada, ¡entonces tu "subred privada" no sería privada!
# Siempre verifica las asociaciones de las tablas de ruteo.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Redes y Seguridad Básica',
    'topic': 'Amazon VPC',
    'subtopic': 'Internet Gateway',
    'definition': r'''
Pensemos en cómo tus recursos en la nube pueden comunicarse con el vasto mundo de Internet. Si tienes un servidor web en una subred pública y quieres que los usuarios puedan acceder a tu sitio, necesitas un "Internet Gateway". Es el componente que permite la comunicación entre tu VPC y el Internet.

Aquí te va la aclaración: un Internet Gateway (IGW) es una puerta de enlace escalable horizontalmente y redundante que permite la comunicación bidireccional entre las instancias de tu VPC y el Internet. Es decir, permite que el tráfico de Internet entre a tu VPC y que el tráfico de tu VPC salga a Internet. Un solo Internet Gateway puede servir a múltiples subredes públicas dentro de tu VPC. Sin un Internet Gateway, tus subredes públicas no pueden ser verdaderamente públicas.

¿Te estás preguntando por qué esto importa? Esto tiene una explicación, y es porque el IGW es fundamental para cualquier recurso que necesite ser accesible desde Internet o que necesite acceder a servicios en Internet. Para que un recurso en una subred pública pueda comunicarse con Internet, necesitas dos cosas:
1.  Un Internet Gateway adjunto a tu VPC.
2.  Una "ruta" en la tabla de ruteo de la subred que dirija el tráfico destinado a Internet (0.0.0.0/0) hacia el Internet Gateway.
3.  Una dirección IP pública (ya sea una IP pública asignada directamente o una Elastic IP) en la instancia EC2.

Es importante entender que el Internet Gateway no es un firewall ni un dispositivo NAT (Network Address Translation) en sí mismo; simplemente es el punto de entrada y salida para el tráfico de Internet. La seguridad la manejas con Grupos de Seguridad y Network ACLs. Si olvidas adjuntar el IGW a tu VPC o no configuras la tabla de ruteo correctamente, tus instancias EC2 en subredes "públicas" no podrán comunicarse con Internet.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart, sino una representación conceptual
// de cómo se crearía y adjuntaría un Internet Gateway usando AWS CLI.

/*
# Ejemplo conceptual con AWS CLI: Creación y configuración de un Internet Gateway

# Export VpcId='vpc-0abcdef1234567890' # Asegúrate de que esta variable esté definida
# Export PublicRouteTableId='rtb-0fedcba9876543210' # Asegúrate de que esta variable esté definida

# 1. Crear un Internet Gateway
# aws ec2 create-internet-gateway --query InternetGateway.InternetGatewayId --output text
# (Salida: igw-0abcdef1234567890)
# Export IgwId='igw-0abcdef1234567890'

# 2. Adjuntar el Internet Gateway a tu VPC
# aws ec2 attach-internet-gateway --vpc-id $VpcId --internet-gateway-id $IgwId

# 3. Añadir una ruta al Internet Gateway en la tabla de ruteo de la subred pública
# aws ec2 create-route \
#   --route-table-id $PublicRouteTableId \
#   --destination-cidr-block 0.0.0.0/0 \ # Tráfico a cualquier destino (Internet)
#   --gateway-id $IgwId # Dirigirlo al Internet Gateway

# Ejemplo de un error común: La instancia EC2 no tiene una IP pública.
# Incluso si tienes un Internet Gateway adjunto a tu VPC y la ruta configurada,
# una instancia EC2 en una subred pública no podrá acceder a Internet (o ser accesible)
# si no tiene una dirección IP pública asociada. Asegúrate de asignar una IP pública
# al lanzar la instancia o de asociarle una Elastic IP después.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Redes y Seguridad Básica',
    'topic': 'Amazon VPC',
    'subtopic': 'NAT Gateway',
    'definition': r'''
Pensemos por un momento que tienes recursos en una subred privada (como una base de datos o un servidor de aplicaciones interno) que necesitan hacer actualizaciones de software, acceder a un repositorio de paquetes o comunicarse con servicios de AWS fuera de tu VPC (como S3 o DynamoDB), pero *sin* exponerse directamente a Internet. Ahí es donde entra en juego el "NAT Gateway".

Aquí te va la aclaración: un NAT Gateway (Network Address Translation Gateway) es un servicio de AWS que permite que las instancias en una subred privada se conecten a Internet o a otros servicios de AWS fuera de tu VPC, pero impide que las conexiones se inicien desde Internet hacia esas instancias. Es un servicio administrado por AWS, altamente disponible y escalable, que hace todo el trabajo de traducción de direcciones IP por ti. Las instancias en la subred privada envían su tráfico saliente al NAT Gateway, que reemplaza la dirección IP privada de la instancia con su propia dirección IP pública (o la de su Elastic IP asociada) antes de enviarlo a Internet.

¿Te estás preguntando por qué esto importa? Esto tiene una explicación, y es porque el NAT Gateway es un componente clave para mantener la seguridad en tus subredes privadas. Te permite mantener tus bases de datos y servidores de aplicaciones críticos aislados de Internet, reduciendo su superficie de ataque, mientras les das la capacidad de realizar comunicaciones salientes necesarias. Para que funcione, necesitas:
1.  Un NAT Gateway desplegado en una *subred pública*.
2.  Una dirección IP elástica (Elastic IP) asociada al NAT Gateway.
3.  Una "ruta" en la tabla de ruteo de la *subred privada* que dirija el tráfico destinado a Internet (0.0.0.0/0) hacia el NAT Gateway.

Si tus instancias privadas necesitan acceder a Internet, pero no ser accesibles desde él, el NAT Gateway es la solución estándar y recomendada en AWS. Un error común es intentar que las instancias de una subred privada se conecten a Internet sin un NAT Gateway (o una instancia NAT), lo que simplemente no funcionará.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart, sino una representación conceptual
// de cómo se crearía y configuraría un NAT Gateway usando AWS CLI.

/*
# Ejemplo conceptual con AWS CLI: Creación y configuración de un NAT Gateway

# Export PublicSubnetId='subnet-0123456789abcdef0' # ID de tu subred pública
# Export PrivateRouteTableId='rtb-0fedcba9876543210' # ID de la tabla de ruteo de tu subred privada

# 1. Asignar una Elastic IP para el NAT Gateway
# aws ec2 allocate-address --domain vpc --query AllocationId --output text
# (Salida: eipalloc-0abcdef1234567890)
# Export EipAllocId='eipalloc-0abcdef1234567890'

# 2. Crear el NAT Gateway en una SUBRED PÚBLICA
# aws ec2 create-nat-gateway \
#   --subnet-id $PublicSubnetId \
#   --allocation-id $EipAllocId \
#   --query NatGateway.NatGatewayId --output text
# (Salida: nat-0abcdef1234567890)
# Export NatGatewayId='nat-0abcdef1234567890'

# Esperar unos minutos a que el NAT Gateway esté disponible (estado 'available')
# aws ec2 describe-nat-gateways --nat-gateway-ids $NatGatewayId

# 3. Añadir una ruta al NAT Gateway en la tabla de ruteo de la SUBRED PRIVADA
# aws ec2 create-route \
#   --route-table-id $PrivateRouteTableId \
#   --destination-cidr-block 0.0.0.0/0 \ # Tráfico a cualquier destino (Internet)
#   --nat-gateway-id $NatGatewayId # Dirigirlo al NAT Gateway

# Ejemplo de un error común: Colocar el NAT Gateway en una subred privada.
# Un NAT Gateway debe estar en una subred pública porque necesita una dirección IP pública
# para comunicarse con Internet. Si lo colocas en una subred privada, no podrá funcionar,
# ya que él mismo no tendría una ruta de salida a Internet.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Redes y Seguridad Básica',
    'topic': 'Amazon VPC',
    'subtopic': 'VPC Peering básico',
    'definition': r'''
Pensemos en la necesidad de conectar dos redes privadas distintas en la nube, como si fueran una sola, pero sin que el tráfico pase por Internet. "VPC Peering" es una conexión de red entre dos VPCs que te permite enrutar el tráfico entre ellas usando direcciones IPv4 o IPv6 privadas. Es como crear un puente directo de red entre tus VPCs.

¿Te estás preguntando por qué esto importa? Esto tiene una explicación, y es porque VPC Peering es fundamental para escenarios donde necesitas que las aplicaciones o recursos en diferentes VPCs se comuniquen de forma segura y eficiente, sin exponerlas a Internet. Esto puede ser útil si:
1.  Tienes diferentes entornos (producción, desarrollo, pruebas) en VPCs separadas para mayor aislamiento.
2.  Colaboras con otra empresa que tiene sus recursos en su propia VPC de AWS y necesitas una comunicación privada.
3.  Estás consolidando o dividiendo aplicaciones y necesitas que se comuniquen a través de límites de VPCs.

Vamos a ver de qué se trata todo esto: cuando creas una conexión de Peering, no es un Gateway ni un VPN; es una conexión directa que usa la infraestructura global de AWS. El tráfico entre las VPCs no sale de la red de AWS, lo que lo hace más seguro y rápido.

Para configurar VPC Peering, necesitas:
1.  **Solicitar la conexión**: Una VPC (la "solicitante") envía una solicitud de Peering a otra VPC (la "aceptante").
2.  **Aceptar la conexión**: El propietario de la VPC aceptante debe aceptar la solicitud.
3.  **Actualizar las tablas de ruteo**: Este es el paso más crucial y a menudo el que causa más confusión. En *ambas* VPCs, debes añadir rutas a sus tablas de ruteo que dirijan el tráfico destinado al CIDR de la otra VPC hacia la conexión de Peering. Si no se configuran las rutas en ambas direcciones, el tráfico no podrá fluir.

Es importante destacar que el VPC Peering no es transitivo. Si la VPC A tiene Peering con la VPC B, y la VPC B tiene Peering con la VPC C, la VPC A *no* puede comunicarse directamente con la VPC C a través de la VPC B. Tendrías que crear una conexión de Peering directa entre A y C. Además, las VPCs conectadas por Peering no pueden tener rangos de CIDR superpuestos; si los tienen, la conexión no funcionará.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart, sino una representación conceptual
// de cómo se configuraría un VPC Peering usando AWS CLI.

/*
# Ejemplo conceptual con AWS CLI: Configuración de VPC Peering

# Export VpcIdA='vpc-0abcdef1234567890' # Tu VPC (10.0.0.0/16)
# Export VpcIdB='vpc-0fedcba9876543210' # La otra VPC (10.1.0.0/16)
# Export RouteTableAId='rtb-1234567890abcdef0' # Tabla de ruteo de VPC A
# Export RouteTableBId='rtb-fedcba9876543210a' # Tabla de ruteo de VPC B

# 1. Crear la solicitud de VPC Peering (desde VPC A a VPC B)
# aws ec2 create-vpc-peering-connection \
#   --vpc-id $VpcIdA \
#   --peer-vpc-id $VpcIdB \
#   --query VpcPeeringConnection.VpcPeeringConnectionId --output text
# (Salida: pcx-0abcdef1234567890)
# Export PcxId='pcx-0abcdef1234567890'

# 2. Aceptar la solicitud de VPC Peering (desde la cuenta/VPC B)
# aws ec2 accept-vpc-peering-connection --vpc-peering-connection-id $PcxId

# 3. Añadir rutas en la tabla de ruteo de VPC A para alcanzar VPC B
# aws ec2 create-route \
#   --route-table-id $RouteTableAId \
#   --destination-cidr-block 10.1.0.0/16 \ # CIDR de VPC B
#   --vpc-peering-connection-id $PcxId

# 4. Añadir rutas en la tabla de ruteo de VPC B para alcanzar VPC A
# aws ec2 create-route \
#   --route-table-id $RouteTableBId \
#   --destination-cidr-block 10.0.0.0/16 \ # CIDR de VPC A
#   --vpc-peering-connection-id $PcxId

# Ejemplo de un error común: Rangos de CIDR superpuestos.
# Si la VPC A es 10.0.0.0/16 y la VPC B también es 10.0.0.0/16 (o cualquier superposición),
# la solicitud de VPC Peering no se podrá establecer o las rutas no funcionarán
# correctamente porque no se puede determinar la dirección IP de destino de forma única.
# Siempre planifica tus rangos de CIDR para que sean únicos entre VPCs que se conectarán.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Redes y Seguridad Básica',
    'topic': 'Seguridad en AWS',
    'subtopic': 'IAM básico (Usuarios, Grupos, Roles)',
    'definition': r'''
Pensemos en quién tiene permiso para hacer qué en tu cuenta de AWS. La gestión de identidades y accesos es uno de los pilares de la seguridad en la nube, y AWS Identity and Access Management (IAM) es el servicio de AWS que te permite gestionar de forma segura quién se autentica y autoriza a usar tus recursos de AWS. Es como la central de control de acceso de tu casa en la nube.

Aquí te va la aclaración: IAM te permite controlar el acceso a tus recursos de AWS de forma granular. Para entender cómo funciona, es crucial comprender sus componentes básicos: "usuarios", "grupos" y "roles".

Vamos a ver de qué se trata todo esto:

* **Usuarios IAM (IAM Users)**: Un usuario IAM representa a una persona o una aplicación que necesita interactuar con AWS. Cada usuario tiene sus propias credenciales (nombre de usuario y contraseña para la consola, o claves de acceso programáticas para el CLI/SDK). Lo más importante es que un usuario IAM es una identidad única con permisos específicos. No es una buena práctica usar el usuario raíz (root user) de tu cuenta de AWS para tareas diarias; siempre crea usuarios IAM con los permisos mínimos necesarios.
* **Grupos IAM (IAM Groups)**: Un grupo IAM es una colección de usuarios IAM. En lugar de asignar permisos a cada usuario individualmente, puedes asignar permisos a un grupo, y todos los usuarios de ese grupo heredarán esos permisos. Esto simplifica mucho la gestión de permisos, especialmente en equipos grandes. Por ejemplo, podrías tener un grupo "Desarrolladores" con permisos para lanzar instancias EC2 y acceder a ciertos buckets de S3, y otro grupo "Auditores" con solo permisos de lectura para los logs.
* **Roles IAM (IAM Roles)**: Este es un concepto un poco diferente, pero súper poderoso. Un rol IAM es una identidad que no tiene credenciales permanentes, sino que se asume temporalmente por una entidad (como una instancia EC2, un servicio de AWS como Lambda, o incluso un usuario IAM en otra cuenta). Piensa en un rol como un sombrero que te pones para realizar una tarea específica, que te da ciertos permisos mientras lo llevas puesto, y luego te lo quitas.
    * **Cuándo usar roles**: Son ideales para dar permisos a servicios de AWS (ej. que una función Lambda acceda a DynamoDB), a instancias EC2 (ej. que una instancia EC2 lea de S3), o para permitir que usuarios de otra cuenta de AWS accedan a tus recursos de forma segura (cross-account access). Los roles son más seguros que las claves de acceso, ya que no requieren credenciales de larga duración en tus aplicaciones.

Entender cómo interactúan estos componentes es la base para construir una estrategia de seguridad sólida en AWS. Un error común es asignar demasiados permisos, lo que se conoce como el "principio de privilegio mínimo"; siempre debes otorgar solo los permisos necesarios para realizar una tarea.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart, sino una representación conceptual
// de cómo se crearían usuarios, grupos y roles usando AWS CLI.

/*
# Ejemplo conceptual con AWS CLI: Creación de usuarios, grupos y roles IAM

# 1. Crear un usuario IAM
# aws iam create-user --user-name my-dev-user
# (Una vez creado, generar claves de acceso para uso programático o contraseña para consola)

# 2. Crear un grupo IAM
# aws iam create-group --group-name Developers

# 3. Añadir un usuario al grupo
# aws iam add-user-to-group --user-name my-dev-user --group-name Developers

# 4. Crear un rol IAM para una instancia EC2 que necesita acceder a S3
# Primero, definir una política de confianza (trust policy) que permita a EC2 asumir este rol.
# Guarda esto en un archivo llamado 'ec2-trust-policy.json':
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "ec2.amazonaws.com"
#       },
#       "Action": "sts:AssumeRole"
#     }
#   ]
# }
# aws iam create-role --role-name S3AccessRoleForEC2 --assume-role-policy-document file://ec2-trust-policy.json

# 5. Adjuntar una política de permisos al rol (ej. S3 ReadOnly)
# aws iam attach-role-policy --role-name S3AccessRoleForEC2 --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess

# Ejemplo de un error común: Usar el usuario raíz (root user) de la cuenta AWS.
# El usuario raíz tiene permisos ilimitados en toda tu cuenta. Nunca debes usarlo para tareas diarias.
# Si tus credenciales de usuario raíz son comprometidas, toda tu cuenta de AWS estaría en riesgo.
# Siempre crea usuarios IAM con los permisos mínimos necesarios y usa la autenticación multifactor (MFA).
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Redes y Seguridad Básica',
    'topic': 'Seguridad en AWS',
    'subtopic': 'Políticas IAM',
    'definition': r'''
Pensemos en cómo le dices a AWS exactamente qué puede y qué no puede hacer un usuario, un grupo o un rol. Las "políticas IAM" son el lenguaje de AWS para definir permisos. Son documentos JSON que especifican quién puede acceder a qué recursos y bajo qué condiciones.

Aquí te va la aclaración: una política IAM es una declaración formal de permisos. Cada política se compone de uno o más "declaraciones" (statements). Cada declaración incluye:

* **`Effect`**: Esto puede ser `Allow` (permitir) o `Deny` (denegar). Si un permiso es denegado explícitamente, siempre prevalece sobre cualquier permiso de permitir.
* **`Action`**: Aquí especificas las acciones específicas de AWS que se permiten o deniegan. Por ejemplo, `s3:GetObject` (para leer un objeto de S3), `ec2:RunInstances` (para lanzar una instancia EC2) o `lambda:*` (para todas las acciones de Lambda).
* **`Resource`**: Esto define sobre qué recursos se aplica la acción. Puedes especificar un recurso específico (como un bucket de S3 particular, `arn:aws:s3:::my-bucket-name/*`) o usar un comodín `*` para todos los recursos de un tipo (ej. `arn:aws:s3:::*`). El uso de ARNs (Amazon Resource Names) es común aquí.
* **`Principal`**: (Solo en políticas basadas en recursos, como las políticas de bucket S3 o políticas de confianza de roles IAM). Es la identidad (usuario, rol, cuenta) a la que se le otorgan o deniegan permisos. En las políticas que adjuntas a usuarios, grupos o roles, el principal es implícitamente el propio usuario/grupo/rol.
* **`Condition`**: (Opcional) Esto te permite especificar condiciones bajo las cuales una política es efectiva. Por ejemplo, permitir una acción solo si la solicitud proviene de una dirección IP específica, o en un momento determinado del día, o si se usa MFA.

¿Te estás preguntando por qué esto importa? Esto tiene una explicación, y es porque las políticas IAM son el corazón de la seguridad de acceso en AWS. Una política bien diseñada sigue el "principio de privilegio mínimo", lo que significa que otorgas la menor cantidad de permisos necesarios para que un usuario o servicio realice su trabajo. Esto reduce la superficie de ataque y limita el daño en caso de que las credenciales sean comprometidas. El mal diseño de políticas (por ejemplo, dar `*` para todas las acciones y recursos) es una de las fallas de seguridad más comunes en AWS.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart, sino un ejemplo de cómo se vería
// una política IAM en formato JSON.

/*
// Ejemplo de una política IAM que permite leer de un bucket S3 específico
// y listar todos los buckets, pero deniega eliminar cualquier bucket.

{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",        // Permite leer objetos
        "s3:ListBucket"        // Permite listar el contenido del bucket
      ],
      "Resource": [
        "arn:aws:s3:::my-app-data-bucket",      // Aplica al bucket en sí
        "arn:aws:s3:::my-app-data-bucket/*"     // Aplica a todos los objetos dentro del bucket
      ]
    },
    {
      "Effect": "Allow",
      "Action": "s3:ListAllMyBuckets", // Permite listar todos los buckets en la cuenta
      "Resource": "*"
    },
    {
      "Effect": "Deny",
      "Action": "s3:DeleteBucket",     // ¡Deniega explícitamente la eliminación de buckets!
      "Resource": "*"                  // Aplica a todos los buckets
    }
  ]
}

// Ejemplo de un error común: Dar "s3:*" como acción.
// Si asignas una política con "s3:*" en el campo "Action",
// estás dando permisos para *todas* las operaciones de S3, incluyendo crear,
// modificar y *eliminar* buckets, lo cual es muy peligroso en entornos de producción.
// Siempre sé lo más específico posible con las acciones y recursos.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Redes y Seguridad Básica',
    'topic': 'Seguridad en AWS',
    'subtopic': 'AWS Organizations',
    'definition': r'''
Pensemos en cómo gestionas múltiples cuentas de AWS de manera centralizada. Si tu empresa tiene más de una cuenta de AWS (lo cual es una práctica recomendada para aislamiento de entornos, facturación, o seguridad), "AWS Organizations" es el servicio que te permite gestionar y consolidar esas cuentas bajo una única unidad administrativa. Es como un paraguas para todas tus cuentas de AWS.

Aquí te va la aclaración: AWS Organizations te permite agrupar tus cuentas de AWS en una jerarquía, formando una "organización". Tienes una cuenta maestra (master account) que es la cuenta raíz de la organización, y luego puedes invitar o crear otras cuentas (member accounts) para que formen parte de ella. Esto te permite aplicar políticas de forma centralizada y simplificar la facturación.

¿Te estás preguntando por qué esto importa? Esto tiene una explicación, y es porque AWS Organizations resuelve varios desafíos comunes en entornos empresariales:

* **Gestión Centralizada**: Permite ver y gestionar todas tus cuentas de AWS desde un solo lugar.
* **Facturación Consolidada**: Puedes consolidar la facturación de todas tus cuentas en una única factura mensual, lo que simplifica la administración y te permite aprovechar los descuentos por volumen (por ejemplo, el nivel gratuito de S3 se acumula entre cuentas).
* **Control de Políticas Centralizado (Service Control Policies - SCPs)**: Las SCPs son un tipo de política que puedes aplicar a Unidades Organizacionales (OUs) o a cuentas individuales dentro de tu organización. A diferencia de las políticas IAM que *otorgan* permisos, las SCPs *establecen los permisos máximos disponibles* para cualquier usuario o rol dentro de la cuenta afectada. Por ejemplo, puedes usar una SCP para denegar explícitamente la posibilidad de que cualquier recurso (usuarios o roles) en una cuenta de desarrollo pueda crear una instancia EC2 de tipo "ml.p3.2xlarge" (muy cara). Esto ayuda a asegurar la conformidad y a evitar costos inesperados.
* **Creación de Cuentas Automatizada**: Puedes crear nuevas cuentas de AWS directamente desde Organizations, integrándolas automáticamente en tu estructura.

El uso de AWS Organizations es una de las mejores prácticas para empresas que operan con AWS, ya que proporciona la base para una estrategia de seguridad y gobernanza sólida a escala. Un error común es no usar Organizations cuando se tienen múltiples cuentas, lo que lleva a una gestión de seguridad y costos fragmentada y menos eficiente.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart, sino una representación conceptual
// de cómo se interactuaría con AWS Organizations usando AWS CLI.

/*
# Ejemplo conceptual con AWS CLI: Configuración básica de AWS Organizations

# Asumiendo que ya tienes una organización creada.

# 1. Listar las cuentas en tu organización
# aws organizations list-accounts

# 2. Crear una Unidad Organizacional (OU)
# aws organizations create-organizational-unit \
#   --parent-id r-xxxx \ # ID de la raíz de tu organización o de otra OU
#   --name Development

# 3. Mover una cuenta a una OU
# aws organizations move-account \
#   --account-id 123456789012 \ # ID de la cuenta a mover
#   --source-parent-id r-xxxx \ # O el ID de la OU actual de la cuenta
#   --destination-parent-id ou-xxxx-yyyyyyyyy # ID de la OU de destino

# 4. Adjuntar una Service Control Policy (SCP) a una OU (ej. denegar región Asia-Pacífico Sydney)
# Primero, el JSON de la SCP (guárdalo en 'deny-sydney.json'):
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Deny",
#       "Action": "*",
#       "Resource": "*",
#       "Condition": {
#         "StringNotEquals": {
#           "aws:RequestedRegion": [
#             "us-east-1",
#             "us-east-2",
#             "us-west-1",
#             "us-west-2",
#             "eu-west-1"
#             // etc. - solo las regiones que quieres permitir
#           ]
#         }
#       }
#     }
#   ]
# }
# aws organizations create-policy \
#   --content file://deny-sydney.json \
#   --name "Deny-AP-Sydney" \
#   --type SERVICE_CONTROL_POLICY \
#   --description "Denies all actions in Sydney region"
# (Salida: p-xxxxxxxxxx)
# Export PolicyId='p-xxxxxxxxxx'

# aws organizations attach-policy \
#   --policy-id $PolicyId \
#   --target-id ou-xxxx-yyyyyyyyy # ID de la OU a la que adjuntar la política

# Ejemplo de un error común: Confundir SCPs con políticas IAM.
# Las SCPs *no otorgan permisos*. Ellas *limitan* los permisos máximos.
# Si una SCP deniega una acción, ninguna política IAM en esa cuenta podrá permitirla.
# Si una SCP permite una acción, aún necesitas una política IAM en la cuenta
# para otorgar explícitamente ese permiso a un usuario o rol.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Redes y Seguridad Básica',
    'topic': 'Seguridad en AWS',
    'subtopic': 'AWS Shield Standard',
    'definition': r'''
Pensemos en cómo proteges tus aplicaciones de ataques de denegación de servicio distribuidos (DDoS), que intentan abrumar tus sistemas con tráfico malicioso para dejarlos inoperativos. AWS ofrece varios niveles de protección contra estos ataques, y "AWS Shield Standard" es el nivel de protección base que ya tienes activado por defecto.

Aquí te va la aclaración: AWS Shield Standard es un servicio de protección contra DDoS gestionado que se incluye automáticamente sin costo adicional para todos los clientes de AWS. Proporciona protección para la mayoría de los ataques DDoS comunes y frecuentes a nivel de red y transporte (Capas 3 y 4 del modelo OSI). Esto significa que AWS Shield Standard ayuda a proteger tus instancias EC2, balanceadores de carga ELB, distribuciones de CloudFront, y otras funciones y recursos de AWS de ataques como inundaciones SYN, inundaciones UDP y ataques de reflexión, sin que tengas que hacer nada.

¿Te estás preguntando por qué esto importa? Esto tiene una explicación, y es porque los ataques DDoS son una amenaza real y constante en Internet. AWS Shield Standard te da una capa de protección fundamental que filtra y mitiga automáticamente estos ataques comunes antes de que lleguen a tus recursos. Sin esta protección, tus aplicaciones podrían volverse inaccesibles para tus usuarios legítimos, lo que podría tener un impacto significativo en tu negocio y reputación. Para la gran mayoría de las organizaciones, la protección de Shield Standard es suficiente para mitigar los ataques más comunes. Sin embargo, para aplicaciones de misión crítica que requieren una protección más avanzada contra ataques DDoS sofisticados y visibilidad mejorada, AWS ofrece AWS Shield Advanced, que es un servicio de pago con características adicionales.
''',
    'code_example': r'''
// No hay código ejecutable en Dart ni comandos AWS CLI específicos para "AWS Shield Standard"
// porque es una protección que está habilitada por defecto y es automática para todos los clientes de AWS.
// No tienes que "activarlo" ni "configurarlo" como tal.

/*
# AWS Shield Standard: No hay comandos CLI para activarlo, ya está activo.
#
# aws shield get-subscription # Esto te mostrará si tienes suscripción a Shield Advanced,
#                              # pero Shield Standard siempre está presente.

# Monitoreo conceptual:
# Puedes ver las métricas relacionadas con DDoS en AWS CloudWatch para tus recursos
# (ej., CloudFront o ELB). Si hay un ataque, verías un aumento en el tráfico
# que es absorbido por la capa de Shield.

# Ejemplo: Cómo un ataque sería mitigado (conceptualmente)
#
# Usuarios legítimos ----> Tráfico limpio
# Atacantes -----------> Tráfico de ataque
#                           |
#                           V
#              +-----------------------------+
#              |   AWS Shield Standard       |
#              | (Mitigación automática      |
#              |  de ataques L3/L4 comunes)  |
#              +-----------------------------+
#                           |
#                           V
#                 +---------------------+
#                 |  Tu Load Balancer   |
#                 |  (ELB) / CloudFront |
#                 +---------------------+
#                           |
#                           V
#                Tus instancias EC2 / Aplicación

# Ejemplo de un error común: Creer que Shield Standard protege contra todo tipo de ataque.
# AWS Shield Standard protege contra ataques DDoS a nivel de red y transporte (L3/L4).
# No protege contra ataques a nivel de aplicación (L7), como inyecciones SQL,
# ataques de scripts entre sitios (XSS) o vulnerabilidades de tu código.
# Para esos, necesitas otros servicios como AWS WAF (Web Application Firewall).
# Además, Shield Standard no proporciona la respuesta de expertos de AWS ni garantías de SLA
# durante un ataque, que sí ofrece Shield Advanced.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Redes y Seguridad Básica',
    'topic': 'AWS Direct Connect',
    'subtopic': 'Conceptos básicos',
    'definition': r'''
Pensemos en la necesidad de una conexión de red súper rápida, dedicada y segura entre tu centro de datos local y la nube de AWS. Si el tráfico de tu aplicación es crítico y sensible al rendimiento, y no quieres que pase por la Internet pública, entonces "AWS Direct Connect" es la solución. Es como tener tu propio carril exclusivo de alta velocidad que va directamente de tu oficina a los servidores de AWS.

Aquí te va la aclaración: AWS Direct Connect es un servicio de red que te permite establecer una conexión de red dedicada desde tu infraestructura local (tu centro de datos, una oficina o un entorno colocation) hasta una ubicación de AWS Direct Connect. A diferencia de una VPN que usa la Internet pública y está cifrada, Direct Connect proporciona una conexión de red privada.

¿Te estás preguntando por qué esto importa? Esto tiene una explicación, y es porque las conexiones de Direct Connect ofrecen varios beneficios clave que no se consiguen con una conexión a Internet estándar:

* **Rendimiento Consistente**: Dado que es una conexión dedicada y privada, no estás sujeto a la congestión de la Internet pública. Esto se traduce en un rendimiento de red más predecible y consistente, con menor latencia y mayor ancho de banda.
* **Seguridad Mejorada**: El tráfico de tus datos no viaja por la Internet pública, lo que reduce la exposición a amenazas externas y mejora la seguridad de tus comunicaciones. Es un camino privado, no una autopista compartida.
* **Ancho de Banda Elevado**: Puedes aprovisionar conexiones de 1 Gbps, 10 Gbps, y hasta 100 Gbps, lo que es ideal para transferir grandes volúmenes de datos o para aplicaciones que requieren mucho ancho de banda.
* **Reducción de Costos**: Para grandes volúmenes de datos, el costo de transferirlos a través de Direct Connect suele ser significativamente menor que a través de Internet, ya que la transferencia de datos salientes de AWS a través de Direct Connect es más barata que a través de Internet.

El concepto fundamental es que estás extendiendo tu red local a la VPC de AWS como si fuera una extensión de tu propio centro de datos, pero sin los riesgos y la imprevisibilidad de Internet. Esto es crucial para cargas de trabajo híbridas, recuperación de desastres, y migraciones de grandes volúmenes de datos.
''',
    'code_example': r'''
// No hay código de programación directo para "Conceptos básicos" de Direct Connect,
// ya que es un servicio de infraestructura de red que se configura principalmente
// a través de la consola de AWS o AWS CLI.

/*
# Ejemplo conceptual de los pasos para establecer una conexión Direct Connect:
# (Esto se hace en la consola de AWS o con la CLI, no es código de aplicación)

# 1. Elegir una ubicación de Direct Connect:
#    Seleccionar un partner de AWS Direct Connect o una ubicación de AWS Direct Connect
#    cercana a tu centro de datos.

# 2. Crear una conexión física (o solicitar a un partner):
#    Especificar el tipo de conexión (dedicada o alojada) y el ancho de banda.

# 3. Crear Interfaces Virtuales (VIFs):
#    Una vez que la conexión física está lista, creas VIFs para conectarte a tu VPCs.
#    Hay dos tipos principales de VIFs:
#    - Public VIF: Para acceder a servicios públicos de AWS (S3, DynamoDB, etc.)
#      a través de la conexión Direct Connect.
#    - Private VIF: Para acceder a recursos privados dentro de tu VPC.

# Ejemplo con AWS CLI (Conceptual - los pasos reales son más complejos e involucran al proveedor de red):

# Crear una conexión Direct Connect (primer paso de aprovisionamiento)
# aws directconnect create-connection \
#   --location "DX-US-EAST-1" \
#   --bandwidth "1Gbps" \
#   --connection-name "MyOnPremiseConnection"

# Crear una Interfaz Virtual Privada (Private VIF)
# (Una vez que la conexión física esté provisionada y disponible)
# aws directconnect create-private-virtual-interface \
#   --connection-id dxcon-xxxxxxxx \ # ID de tu conexión Direct Connect
#   --new-private-virtual-interface \
#     vifName="MyPrivateVIF", \
#     vlan=100, \
#     asn=65000, \ # ASN de tu lado de la red
#     amazonAddress="169.254.30.1/30", \
#     customerAddress="169.254.30.2/30", \
#     authKey="your_auth_key", \
#     virtualGatewayId="vgw-xxxxxxxx", \ # O el ID de tu Direct Connect Gateway
#     addressFamily="ipv4"

# Ejemplo de un error común: Confundir Direct Connect con una VPN sobre Internet.
# Direct Connect no usa la Internet pública y ofrece un rendimiento predecible.
# Una VPN (como AWS Site-to-Site VPN) utiliza la Internet pública y es susceptible
# a la latencia y variabilidad de rendimiento de Internet. Direct Connect es para
# conexiones de mayor ancho de banda y menor latencia donde la consistencia es clave.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Redes y Seguridad Básica',
    'topic': 'AWS Direct Connect',
    'subtopic': 'Beneficios',
    'definition': r'''
Pensemos en por qué una empresa invertiría en una conexión dedicada a la nube de AWS en lugar de simplemente usar Internet. Los "beneficios" de AWS Direct Connect van más allá de la simple conectividad; impactan directamente en el rendimiento, la seguridad, la fiabilidad y el costo de operar tus aplicaciones híbridas.

Aquí te va la aclaración: Direct Connect no es solo otra forma de conectarse a AWS; es una solución de red empresarial que resuelve problemas críticos para cargas de trabajo específicas. Sus ventajas son significativas si tu negocio depende de una comunicación fluida entre tu infraestructura local y la nube.

Vamos a ver de qué se trata todo esto con los beneficios clave:

* **Rendimiento mejorado y predecible**: A diferencia de la Internet pública, que puede sufrir de congestión, Direct Connect te proporciona una conexión de ancho de banda fijo y dedicado. Esto significa una latencia más baja y un rendimiento más consistente para tus aplicaciones, lo cual es vital para bases de datos, aplicaciones empresariales críticas o cargas de trabajo de alto rendimiento. Pensemos en un banco que necesita transferir millones de transacciones de forma segura y rápida; la predictibilidad es oro.
* **Mayor seguridad**: El tráfico de tus datos no pasa por la Internet pública. Esto reduce drásticamente la exposición a ataques de red y mejora la postura de seguridad general de tus comunicaciones. Para sectores regulados o con datos muy sensibles, esta es una característica imprescindible.
* **Reducción de costos a gran escala**: Aunque Direct Connect tiene un costo inicial de configuración, para volúmenes de datos elevados (especialmente las transferencias salientes de AWS), a menudo resulta más económico que pagar por la transferencia de datos a través de Internet. AWS cobra menos por gigabyte de datos salientes a través de Direct Connect.
* **Experiencia de red híbrida simplificada**: Direct Connect extiende tu red local a la nube de AWS, haciendo que tus recursos en la VPC se sientan como una extensión de tu propio centro de datos. Esto facilita la construcción de arquitecturas híbridas, permitiendo que tus aplicaciones locales y en la nube se comuniquen sin problemas.
* **Mayor fiabilidad y disponibilidad**: Al ser una conexión dedicada y respaldada por SLAs, Direct Connect ofrece una mayor fiabilidad que las conexiones a Internet. Además, puedes configurar redundancia (múltiples conexiones Direct Connect) para una disponibilidad aún mayor.

Estos beneficios hacen de AWS Direct Connect una opción atractiva para empresas que buscan optimizar su conectividad a la nube para cargas de trabajo exigentes y sensibles a la seguridad.
''',
    'code_example': r'''
// No hay código de programación directo para "Beneficios" de Direct Connect.
// Este es un concepto de alto nivel sobre las ventajas arquitectónicas.

/*
# Las acciones y configuraciones de Direct Connect se hacen a través de la consola de AWS
# o AWS CLI, como se vio en el subtema anterior.

# Ejemplos conceptuales de escenarios donde los beneficios de Direct Connect son claros:

# Escenario 1: Migración de bases de datos on-premise a RDS/EC2
# - Sin Direct Connect: Grandes volúmenes de datos se transfieren por Internet, lento e impredecible.
# - Con Direct Connect: Transferencia rápida, segura y consistente, minimizando el tiempo de migración.

# Escenario 2: Aplicaciones híbridas (ej. bases de datos on-premise, front-end en AWS)
# - Sin Direct Connect: La latencia de Internet afecta la experiencia del usuario y el rendimiento de la app.
# - Con Direct Connect: Baja latencia y rendimiento predecible para que la app responda rápidamente.

# Escenario 3: Backup y recuperación de desastres a S3/Glacier
# - Sin Direct Connect: Costos elevados de transferencia de datos salientes de S3 a on-premise si necesitas restaurar.
# - Con Direct Connect: Menores costos por la transferencia de datos optimizada y mayor velocidad de recuperación.

# Ejemplo de un error común: Subestimar los costos o la complejidad de la implementación de Direct Connect.
# Aunque los beneficios son grandes, Direct Connect requiere una inversión inicial (hardware, configuración con tu proveedor de red)
# y tiempo para su implementación. No es una solución instantánea como una VPN. Es importante evaluar si los beneficios
# justifican la inversión para tu caso de uso específico.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Redes y Seguridad Básica',
    'topic': 'AWS Direct Connect',
    'subtopic': 'Configuración básica',
    'definition': r'''
Pensemos en los pasos clave para poner en marcha una conexión dedicada a AWS. La "configuración básica" de AWS Direct Connect implica coordinar entre AWS, tu proveedor de red (o tu propio equipo de networking) y tus equipos internos. No es algo que se configure solo desde la consola de AWS; requiere una planificación y ejecución colaborativa.

Aquí te va la aclaración: la configuración de Direct Connect no es un proceso de un solo clic como lanzar una instancia EC2. Implica fases de preparación y aprovisionamiento.

Vamos a ver de qué se trata todo esto:

1.  **Elegir una Ubicación de Direct Connect**: Lo primero es identificar una "ubicación de Direct Connect" cercana a tu centro de datos o colocation. Estas son instalaciones donde AWS tiene presencia de red y donde puedes establecer la conexión física. Puedes hacerlo directamente con AWS o a través de un "partner de AWS Direct Connect".
2.  **Crear una Conexión de Direct Connect**: Desde la consola de AWS Direct Connect, solicitas una nueva conexión. Aquí especificas la ubicación, el ancho de banda deseado (1 Gbps, 10 Gbps, etc.) y si es una "conexión dedicada" (tú tienes el equipo de red) o una "conexión alojada" (un partner la gestiona). AWS te proporcionará una "carta de autorización y solicitud de conexión" (LOA-CFA) que deberás entregar a tu proveedor de co-ubicación o de red.
3.  **Establecer la Conexión Física**: Tu proveedor de red o tu equipo implementará el cableado físico (fibra óptica) desde tu router hasta el equipo de AWS en la ubicación de Direct Connect, utilizando la información de la LOA-CFA. Este es a menudo el paso que más tiempo toma.
4.  **Crear Interfaces Virtuales (VIFs)**: Una vez que la conexión física está establecida y lista, puedes crear "Interfaces Virtuales" (VIFs) en la consola de AWS. Las VIFs son la forma en que tu conexión Direct Connect se conecta a tus recursos de AWS. Hay dos tipos principales:
    * **Private VIF**: Para acceder a tus recursos dentro de una o más VPCs en tu cuenta de AWS. Se establece una sesión BGP (Border Gateway Protocol) entre tu router y un router de AWS para el intercambio de rutas.
    * **Public VIF**: Para acceder a servicios públicos de AWS (como S3, DynamoDB, SQS) a través de tu conexión Direct Connect en lugar de Internet.
5.  **Configurar el enrutamiento**: Este es un paso crítico. En tu router local, debes configurar el enrutamiento (generalmente BGP) para enviar el tráfico destinado a tus rangos de IP de VPC hacia la conexión de Direct Connect. Y en tus tablas de ruteo de VPC en AWS, debes asegurarte de que las rutas para tu red local apunten a la VIF de Direct Connect.

La configuración básica de Direct Connect es un proceso que requiere coordinación y conocimientos de red, pero una vez establecida, proporciona una conectividad robusta y de alto rendimiento. Un error común es no coordinar adecuadamente con el proveedor de telecomunicaciones, lo que puede retrasar significativamente la puesta en marcha de la conexión física.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart. La configuración básica de Direct Connect
// se realiza a través de la consola de AWS o AWS CLI.

/*
# Pasos conceptuales con AWS CLI para la configuración de Direct Connect:

# 1. Crear una conexión Direct Connect (primer paso, se genera la LOA-CFA)
# aws directconnect create-connection \
#   --location "DX-SIN-01" \ # Elegir una ubicación de Direct Connect
#   --bandwidth "10Gbps" \
#   --connection-name "MyCorpToAWS"

# 2. Después de que la conexión física esté aprovisionada, crear una Private VIF
# aws directconnect create-private-virtual-interface \
#   --connection-id dxcon-xxxxxxxx \ # ID de la conexión física
#   --new-private-virtual-interface \
#     vifName="MyVPC1VIF", \
#     vlan=10, \ # VLAN ID que usarás
#     asn=65000, \ # Tu ASN
#     amazonAddress="169.254.1.1/30", \ # IPs de enlace en la conexión
#     customerAddress="169.254.1.2/30", \
#     authKey="your_bgp_auth_key", \ # Clave de autenticación BGP
#     virtualGatewayId="vgw-yyyyyyyyy" \ # ID de tu Virtual Private Gateway o Direct Connect Gateway

# Nota: Para conexiones a múltiples VPCs o VPCs en otras cuentas, se usa un Direct Connect Gateway.
# aws directconnect create-direct-connect-gateway --direct-connect-gateway-name MyDXGateway --amazon-side-asn 64512

# 3. Configurar el enrutamiento en tu tabla de ruteo de VPC
# Asumiendo que tu VPC tiene un CIDR de 10.0.0.0/16 y tu red on-premise es 192.168.0.0/16
# aws ec2 create-route \
#   --route-table-id rtb-0abcdef1234567890 \ # Tu tabla de ruteo de VPC
#   --destination-cidr-block 192.168.0.0/16 \ # Tu red on-premise
#   --vpc-peering-connection-id pcx-xxxxxxx \ # Si usas DX Gateway, sería el ID del gateway
#   --gateway-id vgw-yyyyyyyyy # ID del Virtual Private Gateway (para VIF privada)

# Ejemplo de un error común: No configurar el enrutamiento BGP en tu router local.
# Si la conexión física está establecida y la VIF creada, pero tu router local no está configurado
# para anunciar tus prefijos de red a AWS a través de BGP, o para recibir los prefijos de AWS,
# el tráfico no fluirá. Es un error de red común en este tipo de configuración.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Redes y Seguridad Básica',
    'topic': 'AWS Direct Connect',
    'subtopic': 'Comparación con VPN',
    'definition': r'''
Pensemos en las dos formas principales de conectar tu infraestructura local a la nube de AWS: "AWS Direct Connect" y "VPN". Ambas cumplen el objetivo de conectar redes, pero lo hacen de maneras muy diferentes, y la elección entre una y otra dependerá de tus necesidades de rendimiento, seguridad y presupuesto.

Aquí te va la aclaración: la "VPN" (Virtual Private Network), específicamente AWS Site-to-Site VPN, crea un túnel cifrado sobre la Internet pública entre tu red local y tu VPC de AWS. Es como usar un túnel seguro que atraviesa una autopista concurrida. "AWS Direct Connect", por otro lado, crea una conexión de red privada y dedicada que no utiliza la Internet pública en absoluto. Es como tener tu propia carretera privada.

Vamos a ver de qué se trata todo esto con una comparación directa:

* **Rendimiento y Fiabilidad**:
    * **VPN**: El rendimiento y la fiabilidad pueden variar porque el tráfico viaja a través de la Internet pública, que es impredecible y está sujeta a congestión. La latencia puede fluctuar.
    * **Direct Connect**: Ofrece un rendimiento consistente y predecible con menor latencia y mayor ancho de banda, ya que es una conexión dedicada que no pasa por Internet.

* **Seguridad**:
    * **VPN**: El tráfico está cifrado, lo que lo protege mientras atraviesa la Internet pública. Sin embargo, sigue expuesto a la Internet.
    * **Direct Connect**: El tráfico no sale de la red global de AWS y la red del proveedor, lo que reduce la exposición a amenazas de Internet. Es una conexión inherentemente más segura.

* **Ancho de Banda**:
    * **VPN**: Generalmente limitado por el ancho de banda de tu conexión a Internet y el rendimiento de tus dispositivos VPN. Típicamente adecuado para anchos de banda más bajos (hasta unos pocos Gbps, pero con variabilidad).
    * **Direct Connect**: Soporta anchos de banda muy altos (1 Gbps, 10 Gbps, hasta 100 Gbps), ideal para grandes transferencias de datos o aplicaciones muy exigentes.

* **Costo**:
    * **VPN**: Generalmente más económico de configurar y usar para volúmenes de datos bajos a moderados, ya que se basa en tu conexión a Internet existente. Pagas por el uso del servicio VPN de AWS y la transferencia de datos estándar.
    * **Direct Connect**: Requiere una inversión inicial (hardware, costos del proveedor de red) y un costo fijo por puerto, pero los costos de transferencia de datos salientes de AWS son significativamente más bajos, lo que lo hace más rentable para grandes volúmenes de datos.

* **Complejidad de Implementación**:
    * **VPN**: Relativamente más fácil y rápida de configurar, a menudo puedes tenerla funcionando en minutos u horas.
    * **Direct Connect**: Requiere más planificación, coordinación con proveedores de red y un tiempo de aprovisionamiento más largo (semanas o meses).

En resumen, elige VPN para menor costo, implementaciones rápidas, y cuando el rendimiento no es una preocupación crítica o los volúmenes de datos son moderados. Elige Direct Connect para aplicaciones críticas que necesitan alto rendimiento, baja latencia, mayor seguridad y transferencias de datos masivas.
''',
    'code_example': r'''
// No hay código de programación directo para "Comparación con VPN",
// ya que es una discusión de arquitectura y diseño.
// Sin embargo, aquí hay un ejemplo conceptual de cómo se vería la configuración
// de una Site-to-Site VPN en AWS CLI para contrastar con Direct Connect.

/*
# Ejemplo conceptual con AWS CLI: Creación de una Site-to-Site VPN

# 1. Crear un Virtual Private Gateway (VGW) en tu VPC
# aws ec2 create-vpn-gateway --type ipsec.1 --amazon-side-asn 64512 --query VpnGateway.VpnGatewayId --output text
# (Salida: vgw-0abcdef1234567890)
# Export VgwId='vgw-0abcdef1234567890'

# 2. Adjuntar el VGW a tu VPC
# aws ec2 attach-vpn-gateway --vpc-id vpc-0abcdef1234567890 --vpn-gateway-id $VgwId

# 3. Crear un Customer Gateway (CGW) - representa tu dispositivo VPN local
# aws ec2 create-customer-gateway \
#   --public-ip 203.0.113.123 \ # IP pública de tu dispositivo VPN local
#   --bgp-asn 65000 \ # Tu ASN local (o un ASN privado)
#   --type ipsec.1 \
#   --query CustomerGateway.CustomerGatewayId --output text
# (Salida: cgw-0abcdef1234567890)
# Export CgwId='cgw-0abcdef1234567890'

# 4. Crear la conexión VPN Site-to-Site
# aws ec2 create-vpn-connection \
#   --type ipsec.1 \
#   --customer-gateway-id $CgwId \
#   --vpn-gateway-id $VgwId \
#   --options "{\"StaticRoutesOnly\":true}" # Opciones para rutas estáticas o BGP
# (Esta operación te devuelve un archivo de configuración para tu dispositivo VPN local)

# 5. Configurar las rutas en tu tabla de ruteo de VPC para la VPN (propagación de rutas o rutas estáticas)
# aws ec2 create-route \
#   --route-table-id rtb-yourvpcrouter \
#   --destination-cidr-block 192.168.0.0/16 \ # Tu red local
#   --vpn-gateway-id $VgwId

# Ejemplo de un error común: Usar VPN para transferencias de datos masivas.
# Aunque una VPN puede manejar ciertos volúmenes de datos, no es ideal para migraciones masivas
# o cargas de trabajo que requieren un ancho de banda sostenido de gigabytes, debido a la sobrecarga
# del cifrado y la variabilidad de Internet. Intentar esto podría resultar en transferencias
# extremadamente lentas, costosas y poco fiables.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Redes y Seguridad Básica',
    'topic': 'AWS WAF y Shield',
    'subtopic': 'Protección contra ataques web',
    'definition': r'''
Pensemos en cómo defendemos nuestras aplicaciones web de los malos de Internet que intentan explotar vulnerabilidades o simplemente tumbar nuestros servicios. Aquí es donde entran en juego AWS WAF (Web Application Firewall) y AWS Shield. Juntos, forman una capa de defensa robusta para tus aplicaciones que están expuestas a la web.

Aquí te va la aclaración: mientras que AWS Shield se enfoca principalmente en la protección contra ataques de denegación de servicio distribuido (DDoS) a nivel de red (Capas 3 y 4) y transporte (Capas 7 para Shield Advanced), AWS WAF está diseñado específicamente para proteger tus aplicaciones web de ataques que explotan vulnerabilidades a nivel de la capa de aplicación (Capa 7 del modelo OSI).

Vamos a ver de qué se trata todo esto:

* **AWS WAF (Web Application Firewall)**: Es un firewall de aplicaciones web que te permite monitorear las solicitudes HTTP(S) que llegan a tus aplicaciones web y filtrar o bloquear aquellas que cumplen con criterios específicos. Piensa en WAF como un portero inteligente que inspecciona cada visitante (solicitud web) antes de que entre a tu casa (aplicación). Puedes configurar reglas para bloquear ataques comunes como:
    * **Inyección SQL**: Intentos de manipular tu base de datos a través de campos de entrada.
    * **Scripting entre sitios (XSS)**: Ataques que inyectan scripts maliciosos en sitios web.
    * **Inclusión de archivos locales/remotos**: Intentos de acceder a archivos o recursos no autorizados.
    * **Bots maliciosos**: Tráfico automatizado que intenta raspar tu sitio, forzar inicios de sesión, etc.
    * **Violaciones de protocolos HTTP**: Solicitudes mal formadas que buscan explotar debilidades.
    * **Ataques de fuerza bruta o escaneo de vulnerabilidades**: Intentos repetitivos y automatizados de encontrar puntos débiles.

* **AWS Shield**: Como vimos en el tema anterior, Shield Standard (gratuito y automático) protege contra los ataques DDoS de nivel de red y transporte. AWS Shield Advanced (servicio de pago) extiende esta protección a los ataques DDoS más sofisticados a nivel de aplicación (L7) y ofrece monitoreo 24/7 por el equipo de respuesta a DDoS de AWS (DRT).

La combinación de AWS WAF (para vulnerabilidades L7) y AWS Shield (para DDoS L3/L4 y L7 en Advanced) proporciona una defensa integral para tus aplicaciones web. Un error común es pensar que un solo servicio cubre todas las amenazas; la seguridad web requiere una estrategia en capas.
''',
    'code_example': r'''
// No hay código de programación directo para "Protección contra ataques web" como concepto,
// ya que es una función de servicio. Sin embargo, se pueden mostrar ejemplos
// de cómo se interactuaría con WAF usando AWS CLI.

/*
# Ejemplo conceptual con AWS CLI: Configurar un Web ACL (conjunto de reglas) en WAF

# 1. Crear un Web ACL (Web Access Control List)
# aws wafv2 create-web-acl \
#   --name MyWebAppProtection \
#   --scope REGIONAL \ # O CLOUDFRONT si lo asocias a una distribución de CloudFront
#   --default-action Allow \ # Por defecto, permitir todo lo que no coincida con una regla
#   --visibility-config CloudWatchMetricsEnabled=true,SampledRequestsEnabled=true,MetricName=MyWebAppProtectionMetric \
#   --query Summary.ARN --output text
# (Salida: arn:aws:wafv2:us-east-1:123456789012:webacl/MyWebAppProtection/xxxx-xxxx-xxxx)
# Export WebAclArn='arn:aws:wafv2:us-east-1:123456789012:webacl/MyWebAppProtection/xxxx-xxxx-xxxx'

# 2. Asociar el Web ACL a un Application Load Balancer (ALB)
# aws wafv2 associate-web-acl \
#   --web-acl-arn $WebAclArn \
#   --resource-arn arn:aws:elasticloadbalancing:us-east-1:123456789012:loadbalancer/app/my-alb/xxxx-xxxx-xxxx

# Ejemplo de un error común: Confiar solo en WAF para la protección DDoS.
# WAF es excelente para ataques a nivel de aplicación, pero no es la primera línea de defensa
# contra ataques DDoS masivos de capa 3 o 4 (como inundaciones SYN o UDP). Para esos,
# necesitas AWS Shield (Standard o Advanced). Utilizar WAF y Shield juntos es lo ideal.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Redes y Seguridad Básica',
    'topic': 'AWS WAF y Shield',
    'subtopic': 'Reglas básicas',
    'definition': r'''
Pensemos en cómo le decimos a nuestro firewall de aplicaciones web (AWS WAF) exactamente qué tipo de tráfico queremos bloquear o permitir. Las "reglas" son el corazón de AWS WAF; son las instrucciones que definen el comportamiento de tu firewall. Puedes combinarlas en "grupos de reglas" y "listas de control de acceso web" (Web ACLs) para proteger tus aplicaciones.

No sé tú, pero a mí esto al principio me costó 🤯. Entender la lógica de las reglas es fundamental para que WAF proteja tu aplicación sin bloquear a los usuarios legítimos. Cada regla especifica cómo inspeccionar una solicitud web y qué acción tomar si esa solicitud coincide con los criterios.

Vamos a ver de qué se trata todo esto con los tipos de reglas básicas:

* **Declaraciones de reglas (Rule Statements)**: Son el "qué buscar" en una solicitud. Puedes configurar declaraciones basadas en:
    * **Condiciones de IP**: Bloquear o permitir tráfico de direcciones IP específicas o rangos de CIDR.
    * **Condiciones de HTTP Headers**: Inspeccionar valores en encabezados como `User-Agent`, `Referer`, etc.
    * **Condiciones de cadenas de consulta (Query String)** o **cuerpo de la solicitud (Body)**: Buscar patrones específicos, como cadenas de inyección SQL.
    * **Condiciones de longitud**: Bloquear solicitudes que excedan un cierto tamaño (por ejemplo, URLs demasiado largas).
    * **Condiciones de expresión regular (Regex)**: Utilizar patrones complejos para identificar tráfico malicioso.
    * **Declaraciones de tasas (Rate-based rules)**: Bloquear automáticamente direcciones IP que envíen un número excesivo de solicitudes en un corto período de tiempo (útil contra ataques de fuerza bruta o escaneo).

* **Acciones de reglas (Rule Actions)**: Una vez que una solicitud coincide con una declaración, le dices a WAF qué hacer:
    * **`Allow`**: Permite que la solicitud continúe hacia tu aplicación.
    * **`Block`**: Impide que la solicitud llegue a tu aplicación y devuelve un error (generalmente HTTP 403 Forbidden).
    * **`Count`**: Simplemente cuenta las solicitudes que coinciden con la regla, sin bloquearlas. Esto es excelente para probar nuevas reglas en modo "solo monitoreo" antes de aplicarlas en producción, o para generar métricas.

* **Grupos de reglas administrados por AWS (Managed Rule Groups)**: AWS y sus partners ofrecen conjuntos de reglas predefinidas para proteger contra ataques comunes como OWASP Top 10, amenazas comunes de WordPress, o ataques específicos de bots. Usar estos grupos es una forma rápida y efectiva de obtener protección sin tener que escribir todas las reglas desde cero. Es una práctica recomendada combinarlos con tus propias reglas personalizadas.

El orden de las reglas en un Web ACL es importante, ya que se evalúan en secuencia. Una regla de `Deny` explícita siempre anula cualquier regla de `Allow`. La configuración de reglas básicas es un proceso iterativo de monitoreo, ajuste y refinamiento para encontrar el equilibrio adecuado entre seguridad y disponibilidad.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart, sino una representación conceptual
// de cómo se añadirían reglas a un Web ACL usando AWS CLI.

/*
# Ejemplo conceptual con AWS CLI: Añadir reglas a un Web ACL de WAF

# Export WebAclId='my-web-acl-id' # ID de tu Web ACL
# Export WebAclLockToken='your-current-lock-token' # Obtener el lock token de la API

# 1. Añadir una regla basada en IP (ej. bloquear una IP específica)
# aws wafv2 update-web-acl \
#   --name MyWebAppProtection \
#   --scope REGIONAL \
#   --id $WebAclId \
#   --lock-token $WebAclLockToken \
#   --default-action Allow \
#   --rules '[
#       {
#         "Name": "BlockBadIP",
#         "Priority": 1,
#         "Action": {"Block": {}},
#         "Statement": {
#           "IpSetReferenceStatement": {
#             "Arn": "arn:aws:wafv2:us-east-1:123456789012:ipset/my-bad-ips/xxxx-xxxx-xxxx"
#           }
#         },
#         "VisibilityConfig": {
#           "CloudWatchMetricsEnabled": true,
#           "SampledRequestsEnabled": true,
#           "MetricName": "BlockBadIPMetric"
#         }
#       }
#     ]' # ... y otras reglas existentes oManaged Rule Groups aquí

# 2. Añadir un Managed Rule Group (ej. Core Rule Set de AWS)
# aws wafv2 update-web-acl \
#   --name MyWebAppProtection \
#   --scope REGIONAL \
#   --id $WebAclId \
#   --lock-token $WebAclLockToken \
#   --default-action Allow \
#   --rules '[
#       {
#         "Name": "AWSManagedRulesCommonRuleSet",
#         "Priority": 10, # Asegúrate de que la prioridad sea correcta
#         "Statement": {
#           "ManagedRuleGroupStatement": {
#             "VendorName": "AWS",
#             "Name": "AWSManagedRulesCommonRuleSet"
#           }
#         },
#         "OverrideAction": {
#           "None": {} # Las acciones dentro del Managed Rule Group se aplican
#         },
#         "VisibilityConfig": {
#           "CloudWatchMetricsEnabled": true,
#           "SampledRequestsEnabled": true,
#           "MetricName": "AWSManagedRulesCommonRuleSetMetric"
#         }
#       }
#     ]' # ... y otras reglas existentes o personalizadas

# Ejemplo de un error común: Orden incorrecto de las reglas.
# Si tienes una regla `Allow` con prioridad baja y una regla `Block` con prioridad más alta,
# la regla `Allow` podría procesar el tráfico antes de que la regla `Block` tenga la oportunidad
# de actuar. Si tienes una regla `Block` con prioridad baja y una `Allow` con prioridad alta,
# la regla `Block` podría denegar tráfico legítimo. Siempre considera el orden de evaluación
# de las reglas y la acción por defecto del Web ACL.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Redes y Seguridad Básica',
    'topic': 'AWS WAF y Shield',
    'subtopic': 'Configuración con ALB',
    'definition': r'''
Pensemos en cómo integramos nuestro firewall de aplicaciones web (AWS WAF) con nuestra infraestructura de balanceo de carga para proteger las aplicaciones que están detrás. La "configuración con ALB" (Application Load Balancer) es un caso de uso muy común y recomendado para AWS WAF, ya que el ALB es el punto de entrada para muchas aplicaciones web en AWS.

Aquí te va la aclaración: un Application Load Balancer (ALB) opera en la capa 7 (HTTP/HTTPS) del modelo OSI, al igual que AWS WAF. Esto significa que el ALB entiende el contenido de las solicitudes web, lo que lo convierte en el lugar ideal para que WAF inspeccione el tráfico antes de que llegue a tus servidores o contenedores. Cuando asocias un Web ACL de WAF a tu ALB, todas las solicitudes que pasan por el balanceador de carga son evaluadas por las reglas de WAF.

¿Te estás preguntando por qué esto importa? Esto tiene una explicación, y es porque al integrar WAF con un ALB, obtienes una capa de seguridad en el borde de tu red de aplicación. Las reglas de WAF se aplican *antes* de que el tráfico llegue a tus instancias EC2 o contenedores, lo que significa que el tráfico malicioso se bloquea temprano, reduciendo la carga en tus servidores de origen y protegiéndolos de intentos de explotación.

El proceso de configuración es bastante sencillo:
1.  **Crear el Web ACL en WAF**: Primero, defines tu Web ACL en AWS WAF, incluyendo todas las reglas que quieres aplicar (reglas personalizadas, Managed Rule Groups, etc.).
2.  **Asociar el Web ACL al ALB**: Luego, simplemente asocias este Web ACL a tu Application Load Balancer. Esto se hace en la consola de WAF (en la configuración del Web ACL, eliges los recursos de AWS a proteger) o directamente en la consola del ALB (en la sección de Integraciones).

Una vez asociado, WAF intercepta el tráfico que llega al ALB, evalúa cada solicitud contra las reglas configuradas y solo permite que el tráfico limpio pase al ALB, que luego lo distribuye a tus objetivos (instancias, contenedores, etc.). Es una forma eficiente y efectiva de añadir una capa de seguridad a tus aplicaciones web. Un error común es olvidarse de configurar las reglas en WAF o no asociar el Web ACL al ALB, dejando tu aplicación expuesta.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart, sino una representación conceptual
// de cómo se asociaría un Web ACL a un ALB usando AWS CLI.

/*
# Ejemplo conceptual con AWS CLI: Asociar un Web ACL de WAF a un ALB

# Export WebAclArn='arn:aws:wafv2:us-east-1:123456789012:webacl/MyWebAppProtection/xxxx-xxxx-xxxx'
# Export AlbArn='arn:aws:elasticloadbalancing:us-east-1:123456789012:loadbalancer/app/my-alb/yyyy-yyyy-yyyy'

# 1. Asociar el Web ACL a un Application Load Balancer
# aws wafv2 associate-web-acl \
#   --web-acl-arn $WebAclArn \
#   --resource-arn $AlbArn

# Para desasociar (si es necesario):
# aws wafv2 disassociate-web-acl \
#   --web-acl-arn $WebAclArn \
#   --resource-arn $AlbArn

# Ejemplo de un error común: Asociar el Web ACL a un Network Load Balancer (NLB).
# Los NLBs operan en la capa 4 (TCP/UDP), mientras que WAF opera en la capa 7 (HTTP/HTTPS).
# Por lo tanto, no puedes asociar un Web ACL de WAF directamente a un NLB.
# WAF solo se puede asociar a recursos que operan en la capa 7 y entienden el tráfico HTTP/HTTPS,
# como Application Load Balancers (ALB), Amazon CloudFront, o Amazon API Gateway.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Redes y Seguridad Básica',
    'topic': 'AWS WAF y Shield',
    'subtopic': 'AWS Shield Advanced',
    'definition': r'''
Pensemos en la protección definitiva contra los ataques de denegación de servicio distribuido (DDoS) para las aplicaciones más críticas de tu negocio. Si AWS Shield Standard es la armadura básica que ya tienes, "AWS Shield Advanced" es el escudo de élite, diseñado para las organizaciones que necesitan la máxima protección y un soporte proactivo.

Aquí te va la aclaración: AWS Shield Advanced es un servicio de pago que va más allá de la protección automática que ofrece Shield Standard. Está diseñado para aplicaciones de misión crítica y de alto perfil que podrían ser objetivos de ataques DDoS sofisticados y persistentes. Es un servicio que se activa por suscripción y está pensado para empresas que no pueden permitirse ningún tiempo de inactividad o degradación del rendimiento debido a DDoS.

¿Te estás preguntando por qué esto importa? Esto tiene una explicación, y es porque Shield Advanced te ofrece una serie de beneficios adicionales que no están disponibles en la versión Standard:

* **Protección Mejorada contra DDoS Sofisticados**: Ofrece capacidades de mitigación DDoS más avanzadas y personalizadas, incluyendo la mitigación automática de ataques de capa 7 (aplicación) en recursos como CloudFront, Route 53, ELB y Global Accelerator.
* **Visibilidad y Monitoreo Avanzados**: Proporciona telemetría y detección mejoradas para detectar ataques más rápido y con mayor precisión. Puedes ver métricas detalladas y reportes de eventos DDoS en tiempo casi real.
* **Acceso al Equipo de Respuesta a DDoS (DRT)**: Este es uno de los mayores valores añadidos. Tienes acceso 24/7 a expertos en DDoS de AWS que pueden ayudarte durante un ataque, proporcionando asistencia de mitigación personalizada y guiándote en la configuración de reglas de WAF para proteger tus aplicaciones.
* **Garantías de SLA (Service Level Agreement)**: Shield Advanced ofrece un SLA para la disponibilidad de tus aplicaciones durante un ataque DDoS.
* **Protección de costos de escalado**: Te protege contra los cargos de escalado de infraestructura que podrían ocurrir debido a un ataque DDoS masivo (por ejemplo, cargos por el uso de un ALB que escala automáticamente para absorber el tráfico del ataque).

AWS Shield Advanced es una inversión significativa, pero para negocios donde la disponibilidad y la resiliencia de la aplicación son absolutamente críticas (como servicios financieros, e-commerce de alto volumen o gaming), los beneficios superan con creces el costo. Un error común es subestimar la sofisticación de los ataques DDoS y creer que Shield Standard es suficiente para todas las amenazas.
''',
    'code_example': r'''
// No hay código de programación directo para "AWS Shield Advanced" más allá de la suscripción,
// ya que es un servicio gestionado. La mayoría de las interacciones serían a través de la consola
// de AWS para la suscripción y el monitoreo.

/*
# Ejemplo conceptual con AWS CLI: Suscribirse a AWS Shield Advanced

# aws shield create-subscription # Para suscribirse a Shield Advanced
# (Esto es una acción de suscripción y tiene costos asociados. No hay parámetros adicionales aquí,
#  la suscripción se gestiona a través de la consola y la facturación).

# Después de suscribirse, puedes proteger recursos específicos:
# aws shield protect create-protection \
#   --name MyCriticalWebAppProtection \
#   --resource-arn arn:aws:elasticloadbalancing:us-east-1:123456789012:loadbalancer/app/my-critical-alb/xxxx-xxxx-xxxx

# Para ver el estado de protección:
# aws shield protect describe-protection --protection-id xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx

# Interacción con el DRT (Conceptual):
# En caso de un ataque, el equipo de respuesta a DDoS (DRT) de AWS se pondría en contacto
# contigo (o tú los contactarías) para coordinar las estrategias de mitigación. Esto no
# se hace con comandos CLI, sino a través de canales de soporte.

# Ejemplo de un error común: Asumir que Shield Advanced es un reemplazo de WAF.
# Si bien Shield Advanced ofrece mitigación de L7 para DDoS, WAF sigue siendo
# esencial para la protección contra exploits de aplicaciones web (inyección SQL, XSS, etc.).
# AWS recomienda usar WAF *en conjunto* con Shield Advanced para una defensa en capas
# y protección integral contra una amplia gama de amenazas. Shield Advanced se enfoca
# en la disponibilidad durante ataques DDoS, mientras que WAF se enfoca en la seguridad
# contra vulnerabilidades y exploits de aplicación.
*/
'''
  });
}

Future<void> insertJrLevel6AwsData(Database db) async {
  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Monitoreo y Gestión',
    'topic': 'Amazon CloudWatch',
    'subtopic': 'Métricas básicas',
    'definition': r'''
Pensemos en cómo podemos saber qué está pasando dentro de nuestros servicios de AWS. Si tienes una instancia EC2, ¿está la CPU trabajando mucho? Si tienes una base de datos RDS, ¿se está quedando sin espacio? Para responder a estas preguntas, AWS nos da "métricas básicas" a través de Amazon CloudWatch. Son como los indicadores en el tablero de tu auto, dándote información clave sobre el rendimiento y la salud de tus recursos.

Aquí te va la aclaración: Amazon CloudWatch es un servicio de monitoreo y observabilidad para AWS. Su función principal es recopilar métricas, que son puntos de datos numéricos que representan un valor a lo largo del tiempo. AWS recopila automáticamente métricas de muchos de sus servicios, como EC2, RDS, S3, Lambda y muchos más.

Vamos a ver de qué se trata todo esto:

Cada métrica tiene un "espacio de nombres" (namespace) que actúa como un contenedor para las métricas de un servicio específico (ej. `AWS/EC2`, `AWS/RDS`). Dentro de cada espacio de nombres, las métricas tienen "dimensiones", que son pares clave-valor que identifican de forma única una métrica. Por ejemplo, la métrica de uso de CPU (`CPUUtilization`) para una instancia EC2 tendrá la dimensión `InstanceId`, que identifica la instancia específica.

Algunos ejemplos de métricas básicas que CloudWatch recopila son:
* **Para EC2**: `CPUUtilization` (uso de CPU), `NetworkIn` (bytes de red entrantes), `NetworkOut` (bytes de red salientes), `DiskReadBytes`, `DiskWriteBytes`.
* **Para RDS**: `CPUUtilization`, `FreeStorageSpace` (espacio de almacenamiento libre), `DatabaseConnections` (número de conexiones a la base de datos), `ReadIOPS`, `WriteIOPS`.
* **Para S3**: `BucketSizeBytes` (tamaño total de los objetos en un bucket), `NumberOfObjects` (número de objetos), `Requests` (número de solicitudes al bucket).
* **Para Lambda**: `Invocations` (número de veces que se invoca la función), `Errors` (errores en la función), `Duration` (tiempo de ejecución de la función).

Estas métricas son publicadas a CloudWatch cada cierto tiempo (por defecto, cada 5 minutos para la mayoría de los servicios en "Basic Monitoring", y cada 1 minuto para "Detailed Monitoring", que puede tener un costo adicional). Poder ver estas métricas en gráficos te permite identificar tendencias, detectar anomalías y entender cómo se están comportando tus aplicaciones y recursos. Es la primera línea de defensa para saber si algo no anda bien.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart, sino un ejemplo conceptual de cómo
// se obtendrían métricas básicas usando AWS CLI.

/*
# Ejemplo conceptual con AWS CLI: Obtener métricas de CloudWatch

# 1. Listar los namespaces disponibles (para ver qué servicios tienen métricas)
# aws cloudwatch list-metrics --output table --query 'Metrics[].Namespace' | sort | uniq

# 2. Obtener métricas específicas de una instancia EC2 (ej. uso de CPU)
# Nota: Necesitas el ID de tu instancia EC2.

# aws cloudwatch get-metric-statistics \
#   --namespace AWS/EC2 \
#   --metric-name CPUUtilization \
#   --dimensions Name=InstanceId,Value=i-0abcdef1234567890 \
#   --start-time 2024-05-01T00:00:00Z \
#   --end-time 2024-05-01T23:59:00Z \
#   --period 3600 \
#   --statistics Average \
#   --unit Percent

# Ejemplo de un error común: Intentar obtener métricas con dimensiones incorrectas.
# Cada métrica requiere dimensiones específicas para identificar el recurso.
# Por ejemplo, para CPUUtilization de EC2, necesitas la dimensión 'InstanceId'.
# Si usas una dimensión incorrecta o te falta una, CloudWatch no podrá encontrar la métrica.
# Consulta la documentación de AWS para saber qué dimensiones son necesarias para cada métrica.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Monitoreo y Gestión',
    'topic': 'Amazon CloudWatch',
    'subtopic': 'Alarmas',
    'definition': r'''
Pensemos en qué pasaría si la CPU de tu servidor web llega al 90% de uso, o si tu base de datos se queda sin espacio, y tú no estás mirando el tablero de métricas. Ahí es donde las "alarmas" de CloudWatch entran en acción. Son como un sistema de alerta temprana que te notifica o toma acciones automáticas cuando una métrica cruza un umbral que tú defines.

Aquí te va la aclaración: una alarma de CloudWatch monitorea una métrica específica y, cuando esa métrica se desvía de un valor predefinido durante un período de tiempo determinado, la alarma cambia de estado y puede activar una acción. Por ejemplo, puede enviarte una notificación por correo electrónico, activar una función Lambda, o incluso iniciar una acción de Auto Scaling para añadir más servidores.

Vamos a ver de qué se trata todo esto:

Cada alarma tiene tres estados posibles:
* **`OK`**: La métrica está dentro de los límites definidos.
* **`ALARM`**: La métrica ha cruzado el umbral y está en un estado de alarma.
* **`INSUFFICIENT_DATA`**: No hay suficientes datos para determinar el estado de la alarma (por ejemplo, si la instancia está detenida o la métrica no se está publicando).

Cuando configuras una alarma, defines:
* **La métrica a monitorear**: ¿Qué quieres observar? (ej. `CPUUtilization`, `FreeStorageSpace`).
* **El período de evaluación**: ¿Con qué frecuencia se evalúa la métrica? (ej. cada 5 minutos, cada 1 minuto).
* **El umbral**: ¿Cuál es el valor límite? (ej. > 80% de CPU, < 10 GB de espacio libre).
* **El número de puntos de datos que violan el umbral**: ¿Cuántos puntos de datos consecutivos deben cruzar el umbral antes de que la alarma se active? (ej. 3 puntos de datos consecutivos de CPU > 80%). Esto evita falsos positivos por picos momentáneos.
* **Acciones a tomar**: ¿Qué debe hacer la alarma cuando entra en estado `ALARM`?
    * **Notificaciones**: Enviar un mensaje a un tema de Amazon SNS (que puede enviar correos electrónicos, SMS, etc.).
    * **Auto Scaling**: Añadir o quitar instancias de un grupo de Auto Scaling.
    * **EC2 Actions**: Detener, terminar, reiniciar o recuperar una instancia EC2.
    * **AWS Systems Manager OpsCenter**: Crear un ítem de OpsItem.

Configurar alarmas es crucial para la observabilidad y la gestión proactiva de tus recursos de AWS. Te permite reaccionar rápidamente a problemas antes de que afecten gravemente a tus usuarios, o incluso automatizar la respuesta.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart, sino un ejemplo conceptual de cómo
// se crearían alarmas usando AWS CLI.

/*
# Ejemplo conceptual con AWS CLI: Crear una alarma de CloudWatch

# 1. Crear un tema SNS para notificaciones (si aún no tienes uno)
# aws sns create-topic --name MyAlarmNotifications --query TopicArn --output text
# (Salida: arn:aws:sns:us-east-1:123456789012:MyAlarmNotifications)
# Export SNSTopicArn='arn:aws:sns:us-east-1:123456789012:MyAlarmNotifications'

# 2. Suscribirse a este tema SNS (ej. por correo electrónico)
# aws sns subscribe \
#   --topic-arn $SNSTopicArn \
#   --protocol email \
#   --notification-endpoint your_email@example.com
# (Asegúrate de confirmar la suscripción en tu bandeja de entrada)

# 3. Crear una alarma para CPU Utilization alta en una instancia EC2
# aws cloudwatch put-metric-alarm \
#   --alarm-name "High-CPU-Alarm" \
#   --alarm-description "Alarma si la CPU de la instancia excede el 80% por 5 minutos" \
#   --metric-name CPUUtilization \
#   --namespace AWS/EC2 \
#   --statistic Average \
#   --period 300 \ # 300 segundos = 5 minutos
#   --threshold 80 \
#   --comparison-operator GreaterThanOrEqualToThreshold \
#   --dimensions Name=InstanceId,Value=i-0abcdef1234567890 \
#   --evaluation-periods 1 \ # Una vez que cruza el umbral en un período
#   --datapoints-to-alarm 1 \ # Cuántos puntos de datos deben estar en ALARMA
#   --alarm-actions $SNSTopicArn # La acción a tomar (enviar a SNS)

# Ejemplo de un error común: Configurar demasiados "evaluation-periods" o "datapoints-to-alarm" altos.
# Si configuras la alarma para que requiera, por ejemplo, 10 períodos consecutivos de alta CPU
# antes de dispararse, podrías perder valiosos minutos (o incluso horas) para reaccionar a un problema real.
# Debes encontrar un equilibrio entre la sensibilidad de la alarma y la prevención de falsos positivos.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Monitoreo y Gestión',
    'topic': 'Amazon CloudWatch',
    'subtopic': 'Dashboards',
    'definition': r'''
Pensemos en la cantidad de métricas y alarmas que puedes tener en una infraestructura de AWS compleja. Verlas una por una sería una locura. Ahí es donde los "Dashboards" de CloudWatch se vuelven tus mejores amigos. Son como un centro de comando visual que te permite agrupar y visualizar tus métricas y alarmas más importantes en una sola pantalla.

No sé tú, pero a mí esto al principio me costó 🤯 organizarlo bien. Un buen dashboard te cuenta la historia de tu aplicación o infraestructura de un vistazo.

Aquí te va la aclaración: un dashboard de CloudWatch es una página personalizable donde puedes crear y organizar widgets que muestran tus métricas como gráficos, tus alarmas, logs y otros datos de monitoreo. Puedes tener múltiples dashboards, cada uno enfocado en una aplicación, un equipo o un conjunto de recursos específico.

Vamos a ver de qué se trata todo esto:

Los dashboards te permiten:
* **Visualizar métricas en gráficos**: Puedes añadir gráficos de líneas, barras o áreas para métricas clave como uso de CPU, latencia de red, solicitudes a Lambda, errores de base de datos, etc. Puedes personalizar el rango de tiempo, la granularidad y las estadísticas (promedio, máximo, mínimo, suma).
* **Monitorear el estado de las alarmas**: Puedes incluir widgets que muestran el estado actual de tus alarmas de CloudWatch (OK, ALARM, INSUFFICIENT_DATA), lo que te permite ver rápidamente si hay algo que necesita atención.
* **Ver logs en tiempo real**: Es posible incrustar widgets de CloudWatch Logs para ver eventos de log recientes de tus aplicaciones, lo que es útil para la depuración en tiempo real.
* **Agrupar recursos lógicos**: Puedes crear dashboards para tu aplicación de comercio electrónico, tu backend de microservicios, o tu entorno de desarrollo, y ver todas las métricas relevantes para ese grupo específico.
* **Compartir dashboards**: Puedes compartir tus dashboards con otros miembros de tu equipo o con partes interesadas, facilitando la colaboración y la visibilidad.

Los dashboards son una herramienta poderosa para la observabilidad. Te ayudan a obtener una visión general rápida de la salud de tu sistema, a identificar tendencias, a depurar problemas y a tomar decisiones informadas. La clave es construir dashboards que sean significativos y que te muestren la información más relevante para tu rol.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart, sino un ejemplo conceptual de cómo
// se crearía un dashboard usando AWS CLI (el contenido del dashboard es JSON).

/*
# Ejemplo conceptual con AWS CLI: Crear un Dashboard de CloudWatch

# Contenido JSON del dashboard (guardar en 'my-dashboard.json'):
# Este es un ejemplo simple que muestra la CPU de una EC2 y una alarma.
# En la práctica, este JSON puede ser muy complejo con múltiples widgets.

# {
#   "widgets": [
#     {
#       "type": "metric",
#       "x": 0,
#       "y": 0,
#       "width": 12,
#       "height": 6,
#       "properties": {
#         "metrics": [
#           [ "AWS/EC2", "CPUUtilization", "InstanceId", "i-0abcdef1234567890" ]
#         ],
#         "view": "timeSeries",
#         "stacked": false,
#         "region": "us-east-1",
#         "title": "Uso de CPU de Instancia Principal",
#         "period": 300,
#         "stat": "Average"
#       }
#     },
#     {
#       "type": "alarm",
#       "x": 12,
#       "y": 0,
#       "width": 6,
#       "height": 3,
#       "properties": {
#         "title": "Estado de Alarma de CPU",
#         "alarms": [
#           "arn:aws:cloudwatch:us-east-1:123456789012:alarm:High-CPU-Alarm"
#         ],
#         "sortBy": "stateUpdatedTimestamp",
#         "states": ["ALARM", "OK", "INSUFFICIENT_DATA"]
#       }
#     }
#   ]
# }

# aws cloudwatch put-dashboard \
#   --dashboard-name "MyApplicationDashboard" \
#   --dashboard-body file://my-dashboard.json

# Para obtener el JSON de un dashboard existente (para editarlo, por ejemplo):
# aws cloudwatch get-dashboard --dashboard-name "MyApplicationDashboard"

# Ejemplo de un error común: Widgets de dashboard que no muestran datos.
# Si los gráficos en tu dashboard no muestran datos, puede ser por varias razones:
# 1. El rango de tiempo seleccionado no incluye datos recientes.
# 2. Las dimensiones o el nombre de la métrica en la configuración del widget son incorrectos.
# 3. La región del dashboard no coincide con la región de los recursos.
# Siempre verifica la configuración del widget y las dimensiones de la métrica.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Monitoreo y Gestión',
    'topic': 'Amazon CloudWatch',
    'subtopic': 'Logs básicos',
    'definition': r'''
Pensemos en la información que generan tus aplicaciones y servicios: mensajes de error, eventos, registros de acceso, etc. Estos son los "logs", y son vitales para depurar problemas, auditar actividades y entender el comportamiento de tus sistemas. Amazon CloudWatch no solo maneja métricas y alarmas, sino que también es un servicio centralizado para la gestión de logs.

Aquí te va la aclaración: CloudWatch Logs te permite centralizar logs de diversas fuentes de AWS (EC2, Lambda, CloudTrail, Route 53, etc.) y tus propias aplicaciones. Es como un gran archivo donde se guardan todos los mensajes que tus sistemas generan, y luego puedes buscar, filtrar, almacenar y analizar esos logs.

Vamos a ver de qué se trata todo esto:

Los componentes básicos de CloudWatch Logs son:
* **Grupos de logs (Log Groups)**: Son contenedores para los logs de una aplicación, un servicio o un conjunto de recursos en particular. Por ejemplo, podrías tener un grupo de logs para tu aplicación web, otro para tus funciones Lambda, y otro para los logs de sistema de tus instancias EC2.
* **Flujos de logs (Log Streams)**: Dentro de un grupo de logs, un flujo de logs es una secuencia de eventos de log que comparten la misma fuente. Por ejemplo, en un grupo de logs de EC2, cada instancia podría tener su propio flujo de logs.
* **Eventos de log (Log Events)**: Son los registros individuales de log, cada uno con un mensaje y una marca de tiempo.

¿Te estás preguntando por qué esto importa? Esto tiene una explicación, y es porque centralizar tus logs en CloudWatch Logs te da una serie de ventajas:
* **Almacenamiento escalable y duradero**: No tienes que preocuparte por el espacio en disco de tus servidores para logs; CloudWatch Logs puede almacenar grandes volúmenes de datos de logs de forma indefinida o por el período que definas.
* **Búsqueda y filtrado potentes**: Puedes buscar patrones específicos en tus logs (ej. errores, IPs, mensajes de depuración) utilizando su lenguaje de consultas, lo que acelera la resolución de problemas.
* **Monitoreo y alarmas en base a logs**: Puedes crear métricas personalizadas a partir de patrones en tus logs (filtros de métricas) y luego configurar alarmas de CloudWatch basadas en esas métricas. Por ejemplo, si detectas 100 errores en un minuto, puedes disparar una alarma.
* **Integración con otros servicios**: CloudWatch Logs se integra con CloudWatch Metrics y CloudWatch Alarms, así como con AWS Lambda (para procesar logs) y Amazon Kinesis (para análisis de logs en tiempo real).

La gestión de logs es un componente vital de cualquier estrategia de monitoreo y solución de problemas en la nube. Centralizar tus logs en CloudWatch Logs simplifica enormemente esta tarea.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart, sino un ejemplo conceptual de cómo
// se interactuaría con CloudWatch Logs usando AWS CLI.

/*
# Ejemplo conceptual con AWS CLI: Configuración y uso de CloudWatch Logs

# 1. Crear un grupo de logs
# aws logs create-log-group --log-group-name /aws/lambda/MyLambdaFunctionLogs

# 2. Enviar un evento de log a un flujo de log específico
# (Normalmente, tus aplicaciones o servicios de AWS envían logs automáticamente.
# Esto es solo un ejemplo manual.)

# Primero, necesitas un flujo de log (se crea si no existe al enviar el primer evento)
# aws logs create-log-stream \
#   --log-group-name /aws/lambda/MyLambdaFunctionLogs \
#   --log-stream-name 2024/05/01/[$LATEST]abcdef123456

# Ahora, envía un evento. Necesitarás el 'sequenceToken' de la respuesta anterior
# si el flujo ya existe y tiene eventos. Para el primer evento, no es necesario.
# aws logs put-log-events \
#   --log-group-name /aws/lambda/MyLambdaFunctionLogs \
#   --log-stream-name 2024/05/01/[$LATEST]abcdef123456 \
#   --log-events '[{"timestamp": 1714608000000, "message": "INFO: Application started successfully."}]'
# (El timestamp debe ser en milisegundos Unix)

# 3. Buscar eventos de log en un grupo de logs
# aws logs filter-log-events \
#   --log-group-name /aws/lambda/MyLambdaFunctionLogs \
#   --start-time 1714608000000 \
#   --end-time 1714694400000 \
#   --filter-pattern "INFO" # Buscar mensajes que contengan "INFO"

# Ejemplo de un error común: Olvidar configurar los permisos de IAM para enviar logs a CloudWatch.
# Si tu instancia EC2, función Lambda u otro servicio no tiene los permisos de IAM
# adecuados (ej. `logs:CreateLogGroup`, `logs:CreateLogStream`, `logs:PutLogEvents`),
# no podrá enviar logs a CloudWatch. Esto es una causa común de "logs que no aparecen".
# Siempre verifica los roles de IAM asociados a tus recursos.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Monitoreo y Gestión',
    'topic': 'AWS CloudTrail',
    'subtopic': 'Registro de actividad',
    'definition': r'''
Pensemos en la importancia de saber quién hizo qué, dónde y cuándo en tu cuenta de AWS. Si alguien elimina un recurso crítico, cambia los permisos de seguridad o lanza una nueva instancia, ¿cómo lo averiguas? Aquí es donde entra en juego "AWS CloudTrail", el servicio que registra la actividad de la cuenta, actuando como la caja negra de tus operaciones en la nube.

Aquí te va la aclaración: AWS CloudTrail es un servicio que registra la actividad de la API de AWS y los eventos relacionados en tu cuenta. Es decir, cada vez que un usuario, rol o servicio de AWS interactúa con los servicios de AWS (ya sea a través de la consola de administración, la AWS CLI, los SDKs de AWS o incluso otros servicios de AWS que llaman a APIs), CloudTrail captura esa actividad como un "evento". Estos eventos son registros que contienen información sobre la acción realizada, la identidad del actor, la hora de la acción, la dirección IP de origen, los recursos afectados y mucho más.

¿Te estás preguntando por qué esto importa? Esto tiene una explicación, y es porque el registro de actividad es fundamental para la seguridad, el cumplimiento y la auditoría. Con CloudTrail puedes:

* **Auditoría de seguridad**: Identificar quién realizó acciones no autorizadas o sospechosas.
* **Seguimiento de cambios en los recursos**: Saber cuándo se creó, modificó o eliminó un recurso.
* **Análisis de problemas operativos**: Ayuda a diagnosticar problemas al ver qué acciones se realizaron antes de que ocurriera un fallo.
* **Cumplimiento normativo**: Muchas regulaciones de seguridad requieren el registro de la actividad del usuario y el acceso a los recursos.

CloudTrail está habilitado por defecto en tu cuenta de AWS, pero solo registra la actividad de los últimos 90 días en el historial de eventos. Para un registro a largo plazo y avanzado, necesitas configurar un "trail" (sendero) para que los eventos se envíen a un bucket de S3. Sin este registro, es como intentar resolver un crimen sin testigos ni pistas; es prácticamente imposible.
''',
    'code_example': r'''
// No hay código de programación directo para "Registro de actividad" como concepto,
// ya que es una función intrínseca de CloudTrail. Sin embargo, se puede
// mostrar un ejemplo de cómo ver el historial de eventos.

/*
# Ejemplo conceptual con AWS CLI: Ver eventos en CloudTrail

# 1. Ver los últimos eventos registrados en CloudTrail (historial de eventos)
# aws cloudtrail lookup-events \
#   --lookup-attributes AttributeKey=EventName,AttributeValue=RunInstances \
#   --start-time 2024-05-01T00:00:00Z \
#   --end-time 2024-05-01T23:59:59Z \
#   --max-results 5 \
#   --output json

# Ejemplo de la salida de un evento (simplificado):
# {
#   "Events": [
#     {
#       "EventId": "abcdefg-1234-hijklm-5678-nopqrstuvwxyz",
#       "EventName": "RunInstances",
#       "EventSource": "ec2.amazonaws.com",
#       "EventTime": 1714608000.0,
#       "Username": "your_iam_user",
#       "Resources": [
#         {
#           "ResourceType": "AWS::EC2::Instance",
#           "ResourceName": "i-0abcdef1234567890"
#         }
#       ],
#       "CloudTrailEvent": "{... JSON completo del evento ...}"
#     }
#   ]
# }

# Ejemplo de un error común: Asumir que el historial de eventos de CloudTrail es suficiente para la auditoría a largo plazo.
# El historial de eventos solo guarda los últimos 90 días de actividad.
# Para un registro de actividad a largo plazo, cumplimiento normativo y análisis avanzado,
# necesitas configurar un "trail" para que los logs se almacenen en un bucket de S3.
# Sin un trail, perderás la información después de 90 días.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Monitoreo y Gestión',
    'topic': 'AWS CloudTrail',
    'subtopic': 'Configuración básica',
    'definition': r'''
Pensemos en cómo pasamos de tener un simple historial de 90 días a una auditoría completa y continua de nuestra cuenta de AWS. La "configuración básica" de AWS CloudTrail implica crear un "trail" (o sendero de registro) para que los eventos de tu cuenta se almacenen de forma duradera y se puedan consultar fácilmente.

Aquí te va la aclaración: un "trail" de CloudTrail es una configuración que te permite especificar qué eventos de CloudTrail quieres registrar y dónde quieres que se entreguen esos logs. Puedes crear un trail que se aplique a una sola región de AWS o un trail que registre eventos de todas las regiones de AWS (lo cual es lo más común y recomendado para la mayoría de los casos de uso).

Vamos a ver de qué se trata todo esto:

Cuando configuras un trail, los puntos clave son:
1.  **Tipo de eventos a registrar**:
    * **Eventos de administración (Management events)**: Estos son los eventos que registran operaciones de gestión en tu cuenta, como la creación de recursos (ej. `RunInstances` de EC2, `CreateBucket` de S3), cambios en la configuración de seguridad (ej. `PutRolePolicy` de IAM), o llamadas a la API de AWS en general. Son la mayoría de las operaciones que realizas en la consola o con la CLI. Puedes elegir entre solo "Lectura" (read-only), solo "Escritura" (write-only) o ambos.
    * **Eventos de datos (Data events)**: Estos son eventos de alto volumen que registran operaciones de acceso a los datos de ciertos recursos, como la lectura/escritura de objetos en buckets de S3 o la invocación de funciones Lambda. Los eventos de datos son mucho más detallados y pueden generar un gran volumen de logs, y tienen un costo adicional.
    * **Eventos de Insights**: Permiten que CloudTrail analice los patrones normales de la actividad de gestión y detecte cambios inusuales que podrían indicar amenazas a la seguridad o problemas operativos.

2.  **Destino de los logs**: El destino principal y más común para los logs de un trail es un bucket de Amazon S3. AWS recomienda usar un bucket dedicado para los logs de CloudTrail para mantenerlos separados y seguros. También puedes configurar CloudWatch Logs para que reciba los eventos, lo que facilita el monitoreo en tiempo real y la creación de alarmas basadas en los logs.

3.  **Habilitar el registro en todas las regiones**: Es una práctica recomendada configurar un solo trail para que registre eventos de todas las regiones. Esto garantiza que captures la actividad de la cuenta sin importar en qué región ocurra, y los logs se consolidan en un único bucket de S3.

La configuración básica de un trail de CloudTrail es un paso fundamental para tener una estrategia de seguridad y auditoría robusta en AWS. Sin un trail bien configurado, te faltaría visibilidad crítica sobre lo que sucede en tu entorno.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart, sino un ejemplo conceptual de cómo
// se crearía un trail básico usando AWS CLI.

/*
# Ejemplo conceptual con AWS CLI: Crear un Trail de CloudTrail

# 1. Crear un bucket S3 para almacenar los logs de CloudTrail
# (Es una buena práctica que el bucket esté en una región diferente a la de tus recursos críticos
#  y que tenga políticas de seguridad restrictivas).
# aws s3api create-bucket --bucket my-cloudtrail-logs-123456789012 --region us-east-1
# (Asegúrate de que el nombre del bucket sea globalmente único)
# Export S3BucketName='my-cloudtrail-logs-123456789012'

# 2. Crear un trail que envíe eventos a ese bucket S3
# aws cloudtrail create-trail \
#   --name MyOrganizationTrail \
#   --s3-bucket-name $S3BucketName \
#   --is-multi-region-trail \ # Registra eventos de todas las regiones
#   --include-global-service-events # Incluye eventos de servicios globales (IAM, S3, CloudFront)
#   --query TrailARN --output text
# (Salida: arn:aws:cloudtrail:us-east-1:123456789012:trail/MyOrganizationTrail)
# Export TrailArn='arn:aws:cloudtrail:us-east-1:123456789012:trail/MyOrganizationTrail'

# 3. (Opcional) Configurar la entrega de logs a CloudWatch Logs para monitoreo en tiempo real
# Primero, necesitas un rol de IAM que CloudTrail pueda asumir para enviar logs a CloudWatch Logs.
# (Crear el rol y adjuntar la política 'AWSCloudTrail_CloudWatchLogs_Management' y 'CloudWatchLogsFullAccess')
# Export IAMRoleArn='arn:aws:iam::123456789012:role/CloudTrailCloudWatchLogsRole'

# aws cloudtrail update-trail \
#   --name MyOrganizationTrail \
#   --cloud-watch-logs-log-group-arn arn:aws:logs:us-east-1:123456789012:log-group:/aws/cloudtrail/MyOrganizationTrail:* \
#   --cloud-watch-logs-role-arn $IAMRoleArn

# Ejemplo de un error común: No habilitar 'is-multi-region-trail' o 'include-global-service-events'.
# Si no habilitas 'is-multi-region-trail', solo verás eventos de la región donde creaste el trail.
# Si no incluyes 'global-service-events', te perderás eventos críticos de servicios como IAM (que es global)
# o S3. Es crucial para una auditoría completa.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Monitoreo y Gestión',
    'topic': 'AWS CloudTrail',
    'subtopic': 'Integración con S3',
    'definition': r'''
Pensemos en el destino a largo plazo de todos esos valiosos eventos de actividad de tu cuenta de AWS. Después de que CloudTrail los captura, ¿dónde se almacenan de forma segura y duradera? La "integración con S3" es la forma estándar y recomendada de almacenar los logs de CloudTrail, proporcionando un archivo confiable y accesible para auditorías y análisis.

Aquí te va la aclaración: cuando configuras un "trail" en AWS CloudTrail, le indicas un bucket de Amazon S3 como el destino para todos los eventos de log que recopila. CloudTrail escribe archivos de log (en formato JSON) en este bucket S3, organizados por año, mes, día y cuenta. Es como tener un archivador digital seguro para todos los registros de lo que sucede en tu cuenta de AWS.

¿Te estás preguntando por qué esto importa? Esto tiene una explicación, y es porque la integración con S3 ofrece beneficios clave:

* **Durabilidad y escalabilidad**: Amazon S3 es un servicio de almacenamiento de objetos altamente duradero y escalable. Puede manejar el enorme volumen de logs que CloudTrail puede generar y garantiza que tus logs estén seguros y disponibles cuando los necesites, incluso años después.
* **Rentabilidad**: El almacenamiento en S3 es muy rentable, especialmente para datos a los que no accedes con mucha frecuencia. Puedes usar las clases de almacenamiento de S3 (como S3 Glacier o S3 Intelligent-Tiering) para optimizar aún más los costos de almacenamiento a largo plazo.
* **Seguridad**: Puedes aplicar políticas de bucket S3 estrictas para controlar quién puede acceder a los logs de CloudTrail. AWS recomienda habilitar el cifrado del lado del servidor (SSE-S3 o SSE-KMS) para proteger los logs en reposo y también puedes configurar Multi-Factor Authentication (MFA) Delete para evitar la eliminación accidental del bucket o de los logs.
* **Análisis y procesamiento**: Una vez que los logs están en S3, se convierten en una fuente de datos accesible para otros servicios de AWS para análisis. Puedes usar Amazon Athena para realizar consultas SQL sobre tus logs directamente en S3, o AWS Glue para transformarlos, o incluso AWS Lambda para procesarlos en tiempo real.

Es crucial configurar correctamente la política de bucket S3 para asegurar que CloudTrail tenga los permisos necesarios para escribir en el bucket, pero también para evitar que otros usuarios o cuentas no autorizadas puedan acceder o modificar los logs. La integridad de estos logs es vital para fines de auditoría.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart. La integración se configura
// al crear o actualizar un trail de CloudTrail.

/*
# Ejemplo conceptual de la política de bucket S3 para CloudTrail (importante para la seguridad)

# Esta política se aplica al bucket S3 donde CloudTrail guarda los logs.
# Asegura que solo el servicio CloudTrail de tu cuenta pueda escribir en el bucket
# y que nadie más pueda sobrescribir o eliminar los logs.

# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "cloudtrail.amazonaws.com"
#       },
#       "Action": "s3:GetBucketAcl",
#       "Resource": "arn:aws:s3:::my-cloudtrail-logs-123456789012"
#     },
#     {
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "cloudtrail.amazonaws.com"
#       },
#       "Action": "s3:PutObject",
#       "Resource": "arn:aws:s3:::my-cloudtrail-logs-123456789012/AWSLogs/123456789012/*",
#       "Condition": {
#         "StringEquals": {
#           "s3:x-amz-acl": "bucket-owner-full-control"
#         }
#       }
#     }
#   ]
# }

# Ejemplo de un error común: No habilitar la protección contra la eliminación de logs en S3.
# Incluso con permisos restrictivos, si un atacante obtiene acceso a las credenciales de la cuenta raíz,
# podría eliminar el bucket S3 o los objetos de log. Habilitar el "MFA Delete" en el bucket S3
# para los logs de CloudTrail es una capa de seguridad adicional que requiere autenticación
# multifactor para eliminar objetos o cambiar la configuración del bucket.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Monitoreo y Gestión',
    'topic': 'AWS CloudTrail',
    'subtopic': 'Análisis básico',
    'definition': r'''
Pensemos en tener millones de registros de actividad en tu bucket de S3. ¿Cómo encuentras la aguja en el pajar cuando necesitas investigar un incidente de seguridad o depurar un problema? El "análisis básico" de los logs de CloudTrail te permite buscar y filtrar esa información, convirtiendo los datos brutos en información útil.

Aquí te va la aclaración: una vez que los logs de CloudTrail están almacenados en tu bucket de S3, puedes utilizar varias herramientas de AWS para realizar un análisis básico. El objetivo es identificar rápidamente eventos específicos, tendencias o actividades sospechosas sin tener que procesar manualmente archivos JSON gigantes.

Vamos a ver de qué se trata todo esto:

Las herramientas principales para el análisis básico son:

1.  **Historial de eventos de CloudTrail (para los últimos 90 días)**: Como mencionamos, la consola de CloudTrail te permite buscar y filtrar los eventos de los últimos 90 días de forma interactiva. Puedes filtrar por nombre de evento, nombre de usuario, tipo de recurso y más. Es excelente para investigaciones rápidas y recientes.

2.  **Amazon S3 (para logs a largo plazo)**: Si bien S3 es el destino de almacenamiento, puedes navegar por los archivos de log directamente en el bucket de S3. Los logs se organizan en carpetas por año, mes, día y cuenta, lo que te ayuda a localizar periodos de tiempo específicos. Sin embargo, buscar dentro de los archivos JSON directamente no es práctico.

3.  **Amazon Athena**: Esta es la herramienta más poderosa para el análisis básico de logs de CloudTrail almacenados en S3. Athena es un servicio de consultas interactivo que te permite analizar datos en S3 utilizando SQL estándar.
    * **¿Cómo funciona?**: Primero, creas una tabla en Athena que "apunta" a la ubicación de tus logs de CloudTrail en S3. AWS proporciona plantillas para esto. Luego, puedes escribir consultas SQL como si estuvieras consultando una base de datos tradicional. Por ejemplo, puedes consultar todos los eventos `DeleteBucket`, o ver todos los intentos de inicio de sesión fallidos, o identificar las IPs desde las que se realizaron ciertas acciones.
    * **Ventaja**: No necesitas cargar los datos ni aprovisionar servidores. Athena es sin servidor y pagas solo por la cantidad de datos escaneados por tus consultas. Es increíblemente eficiente para análisis ad-hoc.

4.  **Amazon CloudWatch Logs Insights**: Si has configurado tu trail para enviar logs a CloudWatch Logs (además de S3), CloudWatch Logs Insights te permite realizar búsquedas y análisis interactivos con un lenguaje de consultas especializado. Es muy útil para depurar aplicaciones, ya que puedes correlacionar logs de CloudTrail con logs de tus aplicaciones.

El análisis básico de CloudTrail es crucial para mantener la seguridad y el cumplimiento de tu entorno de AWS. Te permite responder preguntas como: "¿Quién lanzó esta instancia EC2?", "¿Cuándo se eliminó ese bucket S3?" o "¿Hubo intentos de acceso no autorizado en mi cuenta?".
''',
    'code_example': r'''
// Este no es código ejecutable en Dart. El análisis se realiza
// con servicios de AWS como Athena o CloudWatch Logs Insights.

/*
# Ejemplo conceptual con AWS CLI: Consulta de logs de CloudTrail con Amazon Athena

# Primero, necesitas configurar Athena para que apunte a tus logs de CloudTrail.
# AWS proporciona un script de Python en la documentación para crear automáticamente la tabla.
# Aquí un ejemplo conceptual de cómo se vería la consulta SQL en Athena.

# Suponiendo que ya creaste la tabla 'cloudtrail_logs' en Athena que apunta a tu bucket S3:

# Consulta 1: Encontrar todos los eventos de 'DeleteBucket' (eliminación de buckets S3)
# SELECT
#     eventtime,
#     eventsource,
#     eventname,
#     useridentity.arn,
#     useridentity.type,
#     sourceipaddress,
#     resources[1].resourcename AS bucket_name
# FROM
#     cloudtrail_logs
# WHERE
#     eventname = 'DeleteBucket'
# ORDER BY
#     eventtime DESC
# LIMIT 10;

# Consulta 2: Encontrar intentos de inicio de sesión fallidos desde IPs específicas
# SELECT
#     eventtime,
#     useridentity.arn,
#     sourceipaddress,
#     errorcode,
#     errormessage
# FROM
#     cloudtrail_logs
# WHERE
#     eventname = 'ConsoleLogin'
#     AND additionaleventdata LIKE '%"MFAUsed":"No"%'
#     AND errorcode = 'Client.UnauthorizedOperation'
#     AND sourceipaddress NOT IN ('192.168.1.0/24', '172.16.0.0/16') -- Excluir IPs de confianza
# ORDER BY
#     eventtime DESC;

# Ejemplo de un error común: No habilitar el log de eventos de datos si necesitas auditar el acceso a objetos S3.
# Los eventos de administración por defecto de CloudTrail no registran el acceso a objetos S3 (ej. `GetObject`, `PutObject`).
# Si necesitas auditar quién lee o escribe objetos en tus buckets S3, debes habilitar el registro de "eventos de datos"
# para S3 en la configuración de tu trail. Estos eventos tienen un costo adicional, así que habilítalos selectivamente.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Monitoreo y Gestión',
    'topic': 'AWS Systems Manager',
    'subtopic': 'Session Manager',
    'definition': r'''
Pensemos en cómo accedemos de forma segura a nuestras instancias EC2 sin necesidad de abrir puertos SSH o RDP, gestionar claves SSH, o usar bastión hosts. Si alguna vez te has preocupado por la seguridad de tus accesos a servidores, "Session Manager" de AWS Systems Manager es una solución que te va a encantar. Es como una puerta secreta y segura a tus servidores, sin la necesidad de abrir las ventanas principales.

Aquí te va la aclaración: Session Manager es una capacidad de AWS Systems Manager que te permite administrar tus instancias EC2 (y también máquinas on-premise) a través de una sesión basada en navegador o desde la AWS CLI. Lo más importante es que no requiere que abras ningún puerto de entrada (como 22 para SSH o 3389 para RDP) en tus Security Groups, lo que reduce drásticamente la superficie de ataque.

¿Te estás preguntando por qué esto importa? Esto tiene una explicación, y es porque Session Manager resuelve varios desafíos de seguridad y gestión:

* **Seguridad mejorada**: Al no requerir puertos SSH/RDP abiertos, eliminas un vector de ataque común. No necesitas gestionar claves SSH o credenciales RDP para cada instancia.
* **Auditoría y control**: Todas las sesiones de Session Manager se registran en CloudTrail, proporcionando un registro detallado de quién accedió a qué instancia y qué comandos se ejecutaron. También puedes registrar la salida de la sesión en CloudWatch Logs o S3 para una auditoría más profunda.
* **Acceso basado en IAM**: Los permisos para usar Session Manager se controlan mediante políticas de IAM, lo que significa que puedes definir quién puede acceder a qué instancias de forma granular, usando las mismas credenciales de AWS que ya utilizas.
* **Conveniencia**: Puedes iniciar sesiones directamente desde la consola de AWS sin necesidad de clientes SSH/RDP locales, lo que es muy útil para equipos distribuidos o para acceso rápido.

Para que Session Manager funcione, tus instancias EC2 deben tener el agente de Systems Manager (SSM Agent) instalado y en ejecución (viene preinstalado en muchas AMIs de Amazon Linux y Windows Server) y un rol de IAM adjunto con los permisos necesarios para comunicarse con el servicio Systems Manager. Es una de esas herramientas que, una vez que la usas, te preguntas cómo vivías sin ella.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart. La interacción con Session Manager
// se realiza principalmente a través de la consola de AWS o AWS CLI.

/*
# Ejemplo conceptual con AWS CLI: Iniciar una sesión con Session Manager

# Antes de esto, tu instancia EC2 debe tener:
# 1. El SSM Agent instalado y funcionando.
# 2. Un rol de IAM adjunto con permisos para Systems Manager (ej. política 'AmazonSSMManagedInstanceCore').

# 1. Listar las instancias gestionadas por Systems Manager (para encontrar el ID de la instancia)
# aws ssm describe-instance-information --query 'InstanceInformationList[*].[InstanceId,ComputerName]' --output table

# 2. Iniciar una sesión interactiva con una instancia EC2
# aws ssm start-session --target i-0abcdef1234567890

# Después de ejecutar este comando, se abrirá una sesión de shell directamente en tu terminal,
# conectada a la instancia EC2, sin necesidad de SSH.

# Puedes ver las sesiones activas:
# aws ssm describe-sessions --state Active

# Ejemplo de un error común: La instancia no aparece como "Managed Instance".
# Si tu instancia EC2 no aparece en la lista de instancias gestionadas o Session Manager no puede conectarse,
# las razones más comunes son:
# 1. El SSM Agent no está instalado o no se está ejecutando en la instancia.
# 2. El rol de IAM de la instancia no tiene los permisos necesarios (ej. le falta 'AmazonSSMManagedInstanceCore').
# 3. No hay conectividad de red saliente desde la instancia a los puntos de enlace de Systems Manager (SSM Endpoints).
# Siempre revisa los logs del SSM Agent en la instancia y los permisos de IAM.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Monitoreo y Gestión',
    'topic': 'AWS Systems Manager',
    'subtopic': 'Run Command',
    'definition': r'''
Pensemos en la necesidad de ejecutar comandos o scripts en muchas de tus instancias EC2 (o servidores on-premise) al mismo tiempo, sin tener que conectarte a cada una individualmente. Si tienes un parque de servidores y necesitas aplicar un parche, instalar software, o recolectar información de manera masiva, "Run Command" de AWS Systems Manager es tu herramienta ideal. Es como tener un control remoto universal para ejecutar tareas en todos tus servidores a la vez.

No sé tú, pero a mí esto al principio me costó 🤯 entender lo potente que era para la automatización.

Aquí te va la aclaración: Run Command te permite ejecutar comandos a distancia en una o varias instancias de AWS o máquinas locales configuradas con Systems Manager. Puedes ejecutar comandos shell, scripts de PowerShell, o incluso documentos de Systems Manager (SSM Documents) predefinidos o personalizados.

¿Te estás preguntando por qué esto importa? Esto tiene una explicación, y es porque Run Command ofrece beneficios significativos para la gestión de flotas de servidores:

* **Automatización a escala**: Ejecuta comandos en cientos o miles de instancias simultáneamente, ahorrando tiempo y reduciendo errores manuales.
* **Seguridad**: No necesitas SSH/RDP para ejecutar comandos. Los comandos se ejecutan a través del SSM Agent, y los permisos se controlan con IAM. Los resultados de los comandos se registran en CloudWatch Logs o S3 para auditoría.
* **Flexibilidad**: Puedes usar comandos simples, o scripts complejos, o SSM Documents que encapsulan flujos de trabajo completos (como instalar actualizaciones o configurar un servidor web).
* **Control y monitoreo**: Puedes especificar qué usuarios o roles de IAM tienen permiso para ejecutar qué comandos en qué instancias. Además, puedes monitorear el estado de la ejecución de comandos y ver los resultados (salida estándar, errores) en tiempo real.

Para usar Run Command, al igual que Session Manager, tus instancias deben tener el SSM Agent instalado y un rol de IAM adjunto con los permisos necesarios para comunicarse con Systems Manager. Es una herramienta poderosa para la automatización de operaciones, especialmente útil para tareas de mantenimiento, despliegues o resolución de problemas en un gran número de servidores.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart. La interacción con Run Command
// se realiza principalmente a través de la consola de AWS o AWS CLI.

/*
# Ejemplo conceptual con AWS CLI: Ejecutar un comando en una instancia EC2

# Antes de esto, tu instancia EC2 debe tener:
# 1. El SSM Agent instalado y funcionando.
# 2. Un rol de IAM adjunto con permisos para Systems Manager (ej. política 'AmazonSSMManagedInstanceCore').

# 1. Ejecutar un comando simple (ej. `ls -l /tmp`) en una instancia específica
# aws ssm send-command \
#   --instance-ids "i-0abcdef1234567890" \
#   --document-name "AWS-RunShellScript" \
#   --parameters 'commands=["ls -l /tmp"]' \
#   --comment "List files in /tmp directory" \
#   --query Command.CommandId --output text
# (Salida: id_del_comando_ejecutado)
# Export CommandId='id_del_comando_ejecutado'

# 2. Obtener la salida del comando ejecutado
# aws ssm list-command-invocations \
#   --command-id $CommandId \
#   --details \
#   --query "CommandInvocations[0].CommandPlugins[0].Output" --output text

# 3. Ejecutar un comando en múltiples instancias basadas en etiquetas
# aws ssm send-command \
#   --targets Key=tag:Environment,Values=Development \
#   --document-name "AWS-RunShellScript" \
#   --parameters 'commands=["sudo apt-get update -y"]' \
#   --comment "Update packages in Development environment"

# Ejemplo de un error común: Ejecutar comandos como 'root' sin considerar los riesgos.
# Si el SSM Agent se ejecuta como 'root' en Linux o 'System' en Windows, los comandos
# se ejecutarán con esos privilegios. Aunque es conveniente, siempre asegúrate de que
# los comandos que ejecutas son seguros y que solo los usuarios autorizados pueden
# ejecutarlos. Un comando malicioso ejecutado con privilegios elevados puede causar
# un daño significativo.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Monitoreo y Gestión',
    'topic': 'AWS Systems Manager',
    'subtopic': 'Parameter Store',
    'definition': r'''
Pensemos en cómo gestionamos la información sensible o los datos de configuración que nuestras aplicaciones necesitan para funcionar: contraseñas de bases de datos, claves de API, URLs de servicios, etc. Si guardas esto directamente en tu código o en archivos de configuración en tus servidores, estás cometiendo un error de seguridad grave. Aquí es donde "Parameter Store" de AWS Systems Manager te ayuda. Es como una caja fuerte digital para todos tus secretos y configuraciones.

Aquí te va la aclaración: Parameter Store es un servicio de Systems Manager que proporciona un almacenamiento jerárquico y seguro para la gestión de datos de configuración y secretos. Puedes almacenar datos como texto plano, texto cifrado (usando AWS KMS) o como un tipo de cadena.

¿Te estás preguntando por qué esto importa? Esto tiene una explicación, y es porque Parameter Store aborda varios problemas clave en la gestión de configuraciones:

* **Centralización**: Almacena todos tus parámetros en un lugar centralizado, lo que facilita la gestión y el acceso para múltiples aplicaciones o entornos.
* **Seguridad**: Puedes almacenar secretos (como contraseñas o claves de API) como parámetros cifrados. Parameter Store se integra con AWS Key Management Service (KMS) para cifrar automáticamente estos valores, de modo que solo los usuarios o servicios con los permisos adecuados pueden descifrarlos.
* **Separación de configuración y código**: Tus aplicaciones pueden obtener sus parámetros en tiempo de ejecución de Parameter Store, sin necesidad de tenerlos "hardcodeados" en el código o en archivos de configuración que podrían exponerse. Esto hace que tu código sea más portable y seguro.
* **Versionamiento**: Cada parámetro tiene un historial de versiones, lo que te permite ver cambios a lo largo del tiempo y revertir a versiones anteriores si es necesario.
* **Jerarquía**: Puedes organizar los parámetros en una estructura jerárquica (ej. `/my-app/dev/database/password`, `/my-app/prod/api-key`), lo que facilita la gestión de configuraciones para diferentes entornos o módulos de tu aplicación.

Muchos servicios de AWS (como Lambda, ECS, EC2) pueden integrarse directamente con Parameter Store para obtener los valores de configuración. Es una práctica fundamental de seguridad y devops para cualquier aplicación en la nube.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart. La interacción con Parameter Store
// se realiza principalmente a través de la consola de AWS, AWS CLI o SDKs.

/*
# Ejemplo conceptual con AWS CLI: Usar Parameter Store

# 1. Almacenar un parámetro de texto plano
# aws ssm put-parameter \
#   --name "/my-app/dev/database/url" \
#   --value "jdbc:mysql://devdb.example.com:3306/mydb" \
#   --type String \
#   --overwrite # Si el parámetro ya existe, lo sobrescribe

# 2. Almacenar un secreto cifrado (ej. contraseña de base de datos)
# aws ssm put-parameter \
#   --name "/my-app/dev/database/password" \
#   --value "supersecretpassword123" \
#   --type SecureString \
#   --key-id alias/aws/ssm # O tu propio CMK de KMS
#   --overwrite

# 3. Obtener un parámetro (sin descifrar)
# aws ssm get-parameter \
#   --name "/my-app/dev/database/url" \
#   --query Parameter.Value --output text

# 4. Obtener un secreto cifrado (con descifrado)
# aws ssm get-parameter \
#   --name "/my-app/dev/database/password" \
#   --with-decryption \
#   --query Parameter.Value --output text

# Ejemplo de código Python para obtener un parámetro cifrado:
# import boto3

# ssm_client = boto3.client('ssm', region_name='us-east-1')

# try:
#     response = ssm_client.get_parameter(
#         Name='/my-app/dev/database/password',
#         WithDecryption=True
#     )
#     db_password = response['Parameter']['Value']
#     print(f"Database Password: {db_password}")
# except Exception as e:
#     print(f"Error getting parameter: {e}")

# Ejemplo de un error común: No usar 'SecureString' para datos sensibles.
# Si almacenas contraseñas, claves API o tokens como parámetros de tipo `String`
# en lugar de `SecureString`, no estarán cifrados en reposo, lo que es un riesgo de seguridad.
# Siempre usa `SecureString` y una clave KMS adecuada para datos sensibles.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Monitoreo y Gestión',
    'topic': 'AWS Systems Manager',
    'subtopic': 'Maintenance Windows',
    'definition': r'''
Pensemos en la necesidad de realizar tareas de mantenimiento en tus servidores (como aplicar parches del sistema operativo, instalar actualizaciones de software o reiniciar servicios) sin afectar el funcionamiento normal de tus aplicaciones o causar interrupciones inesperadas. Si tienes un entorno de producción que necesita alta disponibilidad, "Maintenance Windows" de AWS Systems Manager es la solución perfecta. Es como programar una ventana de tiempo específica en la que puedes realizar trabajos de mantenimiento de forma segura y controlada.

Aquí te va la aclaración: Maintenance Windows te permite definir un período de tiempo recurrente en el que se pueden ejecutar acciones de mantenimiento no disruptivas en tus instancias EC2 o máquinas on-premise gestionadas por Systems Manager. Dentro de esta ventana, puedes registrar tareas específicas (como Run Command, automatizaciones, o funciones Lambda) para que se ejecuten automáticamente.

¿Te estás preguntando por qué esto importa? Esto tiene una explicación, y es porque Maintenance Windows resuelve varios desafíos críticos en la gestión de operaciones:

* **Control de cambios**: Asegura que las actividades de mantenimiento se realicen solo durante las horas permitidas, minimizando el riesgo de interrupciones inesperadas.
* **Reducción de riesgos**: Al concentrar las tareas de mantenimiento en períodos predefinidos, puedes coordinar mejor con otros equipos y reducir la posibilidad de que los cambios causen problemas en momentos críticos.
* **Automatización**: Puedes automatizar tareas repetitivas y propensas a errores, como la aplicación de parches de seguridad, la actualización de agentes o la recolección de logs, sin intervención manual.
* **Consistencia**: Garantiza que las mismas tareas de mantenimiento se apliquen a todos los recursos de manera consistente, lo que es vital para mantener la uniformidad en tu infraestructura.
* **Gestión de flotas**: Es ideal para entornos con cientos o miles de instancias, donde la aplicación manual de parches sería imposible.

Para configurar una Maintenance Window, defines la duración, la frecuencia (ej. cada miércoles a las 2 AM), y qué recursos se verán afectados. Luego, registras "tareas" dentro de esa ventana, especificando qué se debe ejecutar (ej. un `Run Command` para instalar actualizaciones) y cuándo dentro de la ventana. Es una herramienta poderosa para DevOps y SREs que buscan mejorar la confiabilidad y la eficiencia de las operaciones.
''',
    'code_example': r'''
// Este no es código ejecutable en Dart. La interacción con Maintenance Windows
// se realiza principalmente a través de la consola de AWS o AWS CLI.

/*
# Ejemplo conceptual con AWS CLI: Configurar una Maintenance Window

# 1. Crear una Maintenance Window
# aws ssm create-maintenance-window \
#   --name "WeeklyPatchingWindow" \
#   --schedule "cron(0 2 ? * WED *)" \ # Cada miércoles a las 2 AM (hora UTC)
#   --duration 3 \ # Ventana de 3 horas
#   --cutoff 1 \ # Detener nuevas tareas 1 hora antes del final de la ventana
#   --allow-unassociated-targets \ # Permite objetivos que no están explícitamente asociados
#   --description "Ventana de mantenimiento semanal para aplicar parches" \
#   --query WindowId --output text
# (Salida: mw-0abcdef1234567890)
# Export WindowId='mw-0abcdef1234567890'

# 2. Registrar objetivos para la Maintenance Window (ej. instancias con una etiqueta específica)
# aws ssm register-target-with-maintenance-window \
#   --window-id $WindowId \
#   --resource-type INSTANCE \
#   --targets '[{"Key":"tag:PatchGroup","Values":["ProductionWebServers"]}]' \
#   --owner-information "Team A" \
#   --name "ProductionWebServersTarget" \
#   --description "Servidores web de producción" \
#   --query WindowTargetId --output text

# 3. Registrar una tarea de Run Command en la Maintenance Window (ej. ejecutar un script de parches)
# aws ssm register-task-with-maintenance-window \
#   --window-id $WindowId \
#   --task-type RUN_COMMAND \
#   --task-arn "AWS-RunPatchBaseline" \ # Un SSM Document para aplicar parches
#   --targets '[{"Key":"WindowTargetId","Values":["ID_DEL_TARGET_REGISTRADO_ARRIBA"]}]' \
#   --priority 1 \ # Prioridad de la tarea dentro de la ventana
#   --max-errors 1 \
#   --max-concurrency 10 \
#   --parameters 'PatchBaselineId="pb-0abcdef1234567890",InstallOverrideList=[]' \
#   --service-role-arn "arn:aws:iam::123456789012:role/AutomationServiceRole" # Rol de IAM para la tarea
#   --query WindowTaskId --output text

# Ejemplo de un error común: No considerar la duración de las tareas dentro de la ventana.
# Si tus tareas de mantenimiento (ej. aplicar parches a muchas instancias) tardan más de la
# duración de la ventana o del 'cutoff', las tareas podrían ser terminadas antes de completarse
# o no iniciarse. Siempre estima el tiempo necesario para tus tareas y ajusta la duración
# y el 'cutoff' de la ventana de mantenimiento en consecuencia.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Monitoreo y Gestión',
    'topic': 'AWS Trusted Advisor',
    'subtopic': 'Recomendaciones básicas',
    'definition': r'''
Pensemos en si estamos usando nuestra cuenta de AWS de la mejor manera posible, no solo en términos de eficiencia, sino también de seguridad, costo y rendimiento. ¿Hay algo que podríamos optimizar sin saberlo? Aquí es donde entra en juego "AWS Trusted Advisor", un servicio que actúa como un consultor personalizado de AWS, dándote "recomendaciones básicas" para mejorar tu entorno.

Aquí te va la aclaración: AWS Trusted Advisor es un servicio en la nube que evalúa tu entorno de AWS y te proporciona recomendaciones en cinco categorías clave, basándose en las mejores prácticas de AWS. Es como tener un experto a tu lado que revisa constantemente tu configuración y te señala áreas de mejora.

¿Te estás preguntando por qué esto importa? Esto tiene una explicación, y es porque Trusted Advisor te ayuda a:

* **Reducir costos**: Identifica recursos no utilizados o infrautilizados, como instancias EC2 inactivas, volúmenes EBS sin adjuntar o balanceadores de carga sin tráfico, que podrías eliminar para ahorrar dinero.
* **Mejorar el rendimiento**: Sugiere mejoras para tus servicios, como el uso de tipos de instancias EC2 más eficientes o la configuración óptima de tus bases de datos, para que tus aplicaciones funcionen más rápido.
* **Aumentar la seguridad**: Revisa las configuraciones de seguridad, como permisos de IAM excesivos, puertos de Security Group abiertos al mundo, o el uso de MFA en la cuenta raíz, para proteger tus datos y recursos.
* **Mejorar la tolerancia a fallos**: Busca oportunidades para mejorar la resiliencia de tus aplicaciones, como el uso de múltiples Availability Zones para tus ALB o la configuración de copias de seguridad de RDS.
* **Controlar los límites de servicio**: Te alerta cuando estás cerca de alcanzar los límites de servicio para recursos específicos, ayudándote a evitar interrupciones antes de que ocurran.

Trusted Advisor te presenta estas recomendaciones en un panel fácil de entender, con indicadores de estado (verde, amarillo, rojo) y detalles sobre cómo resolver cada problema. Es una herramienta muy útil para cualquier persona que gestione recursos en AWS, desde un desarrollador individual hasta un arquitecto de soluciones en una gran empresa. La versión gratuita de Trusted Advisor te da acceso a un conjunto limitado de cheques, mientras que una suscripción a un plan de soporte de AWS (Business o Enterprise) desbloquea todas las recomendaciones.
''',
    'code_example': r'''
// No hay código ejecutable en Dart. Las recomendaciones de Trusted Advisor
// se acceden y gestionan a través de la consola de AWS.

/*
# Ejemplo conceptual: Acceder a las recomendaciones de Trusted Advisor en la consola de AWS.
# (No hay comandos CLI directos para "get-recommendations" en tiempo real como tal,
# las métricas de Trusted Advisor se exponen en CloudWatch para planes avanzados.)

# 1. Inicia sesión en la Consola de Administración de AWS.
# 2. Navega al servicio "Trusted Advisor" (puedes buscarlo en la barra de búsqueda).
# 3. En el panel principal de Trusted Advisor, verás un resumen de las recomendaciones
#    divididas en las cinco categorías: Cost Optimization, Performance, Security,
#    Fault Tolerance, y Service Limits.
# 4. Haz clic en cada categoría para ver las recomendaciones específicas.
#    Por ejemplo, en "Cost Optimization" podrías ver "Underutilized EC2 Instances".
#    Al hacer clic, verás los detalles de la instancia y los pasos para resolverlo.

# Ejemplo de un error común: Ignorar las recomendaciones de "elementos excluidos".
# A veces, Trusted Advisor te dirá que tienes elementos (ej. instancias) que están excluidos
# de ciertas comprobaciones. Esto suele ocurrir si los has excluido manualmente.
# Es importante revisar estas exclusiones regularmente para asegurarte de que son válidas
# y que no estás pasando por alto posibles optimizaciones o riesgos de seguridad.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Monitoreo y Gestión',
    'topic': 'AWS Trusted Advisor',
    'subtopic': 'Categorías de chequeo',
    'definition': r'''
Pensemos en cómo un servicio como AWS Trusted Advisor puede darte recomendaciones tan diversas, desde ahorrar dinero hasta mejorar la seguridad. Esto se debe a que organiza sus análisis en "categorías de chequeo" bien definidas, cada una enfocada en un pilar específico de las mejores prácticas de AWS.

Aquí te va la aclaración: AWS Trusted Advisor clasifica sus hallazgos y sugerencias en cinco categorías principales, que se alinean con los pilares del AWS Well-Architected Framework. Esto te ayuda a entender el tipo de impacto que cada recomendación puede tener en tu entorno y a priorizar tus acciones.

Vamos a ver de qué se trata todo esto:

1.  **Optimización de Costos (Cost Optimization)**: Esta categoría se centra en identificar oportunidades para reducir tus gastos en AWS. Busca recursos inactivos o subutilizados que aún te están generando costos, como instancias EC2 con bajo uso de CPU, volúmenes EBS sin adjuntar, direcciones IP elásticas no asociadas o balanceadores de carga sin tráfico.
    * **Ejemplo de chequeo**: "Underutilized Amazon EC2 Instances" o "Idle Load Balancers".

2.  **Rendimiento (Performance)**: Aquí, Trusted Advisor se enfoca en mejorar la velocidad y eficiencia de tus aplicaciones. Busca configuraciones que podrían estar ralentizando tus servicios o que no están optimizadas para la carga de trabajo, como el uso de tipos de instancias antiguos, la falta de optimización de S3 para alto rendimiento, o la configuración inadecuada de CloudFront.
    * **Ejemplo de chequeo**: "High Utilization Amazon EC2 Instances" (sugiere escalar o usar una instancia más potente) o "CloudFront Content Delivery Optimization".

3.  **Seguridad (Security)**: Esta es una de las categorías más críticas. Trusted Advisor identifica configuraciones que podrían hacer que tu cuenta o tus recursos sean vulnerables a ataques. Esto incluye comprobaciones para el uso de Multi-Factor Authentication (MFA) en la cuenta raíz, la configuración de Security Groups (puertos abiertos, reglas permisivas), el uso de CloudTrail, la configuración de políticas de bucket S3 y más.
    * **Ejemplo de chequeo**: "MFA on Root Account", "Security Groups - Specific Ports Unrestricted", o "S3 Bucket Permissions".

4.  **Tolerancia a Fallos (Fault Tolerance)**: Se centra en la resiliencia y disponibilidad de tus aplicaciones. Trusted Advisor busca configuraciones que podrían causar un único punto de fallo o que no están diseñadas para recuperarse de interrupciones. Esto incluye comprobaciones para el despliegue de recursos en una sola Availability Zone, la falta de copias de seguridad de RDS o la no configuración de Health Checks en balanceadores de carga.
    * **Ejemplo de chequeo**: "Amazon EBS Snapshots", "RDS Backups", o "Load Balancer Optimization" (para asegurar AZs múltiples).

5.  **Límites de Servicio (Service Limits)**: Esta categoría te alerta cuando estás cerca de alcanzar los límites predeterminados para recursos de AWS en una región específica (ej. número máximo de instancias EC2, volúmenes EBS, IPs elásticas). Esto es crucial para evitar que tus operaciones se vean afectadas por el agotamiento de recursos.
    * **Ejemplo de chequeo**: "EC2 Instance Limits" o "VPC Limits".

Entender estas categorías te permite tener una visión holística de la salud de tu entorno de AWS y priorizar las acciones en función de tus objetivos de negocio, ya sea reducir costos, mejorar la seguridad o garantizar la disponibilidad.
''',
    'code_example': r'''
// No hay código ejecutable en Dart. Las categorías de chequeo son
// una forma de organizar las recomendaciones en la consola de AWS.

/*
# Las categorías son un concepto de la interfaz de usuario y la lógica interna de Trusted Advisor.
# No se interactúa directamente con ellas a través de la CLI con comandos específicos de categoría.
# Cuando ejecutas 'aws support describe-trusted-advisor-checks', obtendrás una lista de todos los cheques
# y su categoría asociada.

# Ejemplo conceptual con AWS CLI: Describir los cheques de Trusted Advisor
# aws support describe-trusted-advisor-checks \
#   --language es \ # Puedes especificar el idioma
#   --query 'checks[].{Name:name,Category:category,Id:id}' --output table

# Salida parcial (ejemplo):
# | Name                               | Category            | Id                                     |
# |------------------------------------|---------------------|----------------------------------------|
# | S3 Bucket Permissions              | security            | 074f63c8-TADVICE                        |
# | MFA on Root Account                | security            | 6d2673d3-TADVICE                        |
# | Underutilized EC2 Instances        | cost_optimizing     | 1e06test-TADVICE                        |
# | Amazon EBS Snapshots               | fault_tolerance     | 53a2efd0-TADVICE                        |
# | VPC Limits                         | service_limits      | 152d19f8-TADVICE                        |
# | High Utilization Amazon EC2 Instances | performance         | 77274f8a-TADVICE                        |

# Ejemplo de un error común: Ignorar las recomendaciones de una categoría específica.
# Algunos equipos pueden enfocarse solo en "Cost Optimization" y descuidar "Security" o "Fault Tolerance".
# Una estrategia de nube madura requiere un enfoque equilibrado en todas las categorías
# para construir una arquitectura robusta, segura y eficiente.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Monitoreo y Gestión',
    'topic': 'AWS Trusted Advisor',
    'subtopic': 'Implementación de recomendaciones',
    'definition': r'''
Pensemos en que Trusted Advisor nos ha dado un montón de sugerencias útiles. El siguiente paso crucial es tomar acción. La "implementación de recomendaciones" es donde conviertes esos consejos en mejoras reales en tu infraestructura de AWS. No basta con saber qué hacer; hay que hacerlo.

Aquí te va la aclaración: implementar las recomendaciones de Trusted Advisor significa seguir los pasos sugeridos por el servicio para optimizar tus recursos, mejorar tu seguridad o aumentar la resiliencia. Trusted Advisor no realiza cambios por ti; simplemente te señala las áreas de mejora y te guía sobre cómo abordarlas.

Vamos a ver de qué se trata todo esto:

El proceso de implementación generalmente implica:

1.  **Revisión y priorización**: No todas las recomendaciones tendrán la misma prioridad para tu negocio. Revisa los detalles de cada recomendación (el impacto potencial, los recursos afectados) y decide cuáles son las más importantes para abordar primero. Por ejemplo, una recomendación de seguridad crítica (como puertos de seguridad abiertos) probablemente tenga mayor prioridad que una optimización de costos menor.

2.  **Comprensión de los pasos**: Para cada recomendación, Trusted Advisor proporciona información detallada y, a menudo, enlaces directos a la documentación de AWS o a la consola de servicio relevante. Esto te indica exactamente qué necesitas hacer. Por ejemplo, si te recomienda terminar una instancia EC2 subutilizada, te dirá el ID de la instancia y te guiará a la consola de EC2 para realizar la acción.

3.  **Ejecución de los cambios**: Aquí es donde tú o tu equipo realizan las acciones necesarias. Esto podría implicar:
    * Modificar Security Groups.
    * Terminar o detener instancias EC2.
    * Configurar copias de seguridad de RDS.
    * Habilitar MFA para el usuario raíz.
    * Ajustar políticas de IAM.
    * Solicitar aumentos de límites de servicio.

4.  **Verificación y monitoreo**: Después de implementar un cambio, es fundamental verificar que el problema se ha resuelto y que no se han introducido nuevos problemas. Trusted Advisor volverá a evaluar tus recursos periódicamente, y si la recomendación se ha implementado correctamente, su estado cambiará a "verde" (resuelto). También puedes monitorear tus métricas de CloudWatch para asegurarte de que los cambios no impacten negativamente el rendimiento o la disponibilidad.

5.  **Excluir elementos (opcional)**: En algunos casos, una recomendación puede no ser aplicable a tu situación particular (por ejemplo, si tienes una instancia subutilizada que solo se usa para pruebas ocasionales). En estos casos, puedes "excluir" el elemento de la comprobación de Trusted Advisor para que no siga apareciendo como una advertencia. Sin embargo, haz esto con precaución y solo cuando estés seguro de que la recomendación no es relevante o se ha abordado de otra manera.

La implementación continua de las recomendaciones de Trusted Advisor es parte de un ciclo de mejora constante en la nube. Te ayuda a mantener un entorno de AWS optimizado, seguro y eficiente a lo largo del tiempo.
''',
    'code_example': r'''
// No hay código ejecutable en Dart. La implementación de recomendaciones
// implica acciones manuales o automatizadas en otros servicios de AWS.

/*
# Ejemplo conceptual: Pasos para implementar una recomendación de Trusted Advisor
# Asumamos que Trusted Advisor te recomienda "Terminar instancias EC2 subutilizadas".

# 1. Identificar la instancia:
#    Trusted Advisor te mostrará el ID de la instancia, la región y el porcentaje de uso de CPU.
#    Ejemplo: i-0abcdef1234567890 (us-east-1, 1% CPU Average)

# 2. Verificar la instancia (manualmente o con CLI):
#    Asegúrate de que la instancia realmente no es necesaria.
#    aws ec2 describe-instances --instance-ids i-0abcdef1234567890 --query "Reservations[].Instances[].State.Name"

# 3. Detener o Terminar la instancia (si estás seguro):
#    Si no necesitas la instancia, puedes terminarla para dejar de incurrir en costos.
#    aws ec2 terminate-instances --instance-ids i-0abcdef1234567890

# 4. Verificar la recomendación en Trusted Advisor:
#    Después de un tiempo (generalmente unas horas), Trusted Advisor reevaluará y la recomendación
#    debería pasar de "rojo" a "verde" para esa instancia específica.

# Ejemplo de un error común: Implementar recomendaciones sin comprender el impacto.
# Por ejemplo, terminar una instancia EC2 "subutilizada" sin saber que es un servidor de desarrollo
# que solo se usa ocasionalmente puede causar problemas.
# Siempre investiga a fondo cada recomendación y su impacto potencial antes de realizar cambios,
# especialmente en entornos de producción.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'AWS',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Monitoreo y Gestión',
    'topic': 'AWS Trusted Advisor',
    'subtopic': 'Límites de Free Tier',
    'definition': r'''
Pensemos en cómo AWS ayuda a los nuevos usuarios a experimentar con sus servicios sin preocuparse por los costos iniciales. El "AWS Free Tier" es un gran punto de partida, pero como todo programa gratuito, tiene sus "límites". Aquí es donde AWS Trusted Advisor juega un papel importante al ayudarte a no sobrepasar esos límites de forma inesperada.

Aquí te va la aclaración: el AWS Free Tier te permite usar ciertos servicios de AWS de forma gratuita hasta un umbral de uso determinado durante un período específico (generalmente 12 meses desde la creación de la cuenta, o de forma indefinida para algunos servicios). Una vez que superas ese umbral, comienzas a incurrir en costos. AWS Trusted Advisor incluye cheques específicos que te alertan cuando te acercas o ya has superado estos límites.

¿Te estás preguntando por qué esto importa? Esto tiene una explicación, y es porque es muy fácil, especialmente para los principiantes, exceder los límites del Free Tier sin darse cuenta, lo que puede llevar a facturas inesperadas. Trusted Advisor te ayuda a:

* **Evitar costos inesperados**: Te proporciona advertencias tempranas sobre el uso de tus recursos que se acerca a los límites del Free Tier. Por ejemplo, te puede alertar si estás utilizando una instancia EC2 que no es de nivel gratuito, o si has superado las horas gratuitas de EC2 o el almacenamiento de S3.
* **Gestión proactiva**: Con estas alertas, puedes tomar medidas antes de que se te cobre. Esto podría significar reducir el uso, cambiar a un tipo de instancia de nivel gratuito, o simplemente estar consciente de que incurrirás en costos y ajustar tu presupuesto.
* **Optimización del aprendizaje**: Te permite experimentar con más servicios de AWS sin el temor constante de recibir una factura alta, siempre y cuando monitorees el uso con Trusted Advisor.

Trusted Advisor te muestra un cheque específico llamado "Service Limits" en la categoría "Service Limits", y dentro de ese cheque, encontrarás los límites asociados al Free Tier. Es importante recordar que, aunque Trusted Advisor te ayuda a monitorear el uso del Free Tier, también es tu responsabilidad revisar la página de facturación de AWS y la documentación del Free Tier para comprender completamente los límites y las condiciones. Es la mejor manera de aprender y construir en AWS sin sorpresas económicas.
''',
    'code_example': r'''
// No hay código ejecutable en Dart. La supervisión de los límites de Free Tier
// se realiza a través de la consola de Trusted Advisor y Facturación.

/*
# Ejemplo conceptual: Cómo Trusted Advisor te alerta sobre los límites de Free Tier.
# Trusted Advisor te muestra las "Comprobaciones de límites de servicio" en la consola.
# Dentro de estas, verás información sobre el uso del Free Tier.

# 1. Accede a la consola de AWS Trusted Advisor.
# 2. Ve a la categoría "Límites de servicio".
# 3. Busca el cheque "Uso de Free Tier".

# La información que verás es similar a:
# - "EC2 Instances" (uso de horas, tipos de instancia fuera del Free Tier)
# - "S3 Storage" (cantidad de almacenamiento utilizado vs. límite gratuito)
# - "RDS Database Instances" (uso de horas y tipo de instancia)

# Ejemplo de un error común: Confiar ciegamente en el Free Tier sin monitorear.
# El Free Tier es muy útil, pero no todos los servicios o todas las configuraciones
# están cubiertas. Por ejemplo, algunos tipos de instancias EC2 nunca son gratuitas,
# o si dejas un volumen EBS adjunto a una instancia detenida, te seguirá costando
# almacenamiento. Siempre debes monitorear activamente tu uso y la facturación,
# además de usar Trusted Advisor, para evitar cargos inesperados.
*/
'''
  });
}
