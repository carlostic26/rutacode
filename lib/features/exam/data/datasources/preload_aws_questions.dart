import 'package:sqflite_common/sqlite_api.dart';
import 'package:rutacode/features/exam/data/models/exam_question_model.dart';

Future<void> preloadAwsJrQuestions(Database db, tableName) async {
  final preloadedAwsJrQuestions = [
    ExamQuestionModel(
      id: 'aws_jr_01',
      questionText:
          '¿Cuál de los siguientes no es un modelo de servicio de Cloud Computing?',
      options: ['A) IaaS', 'B) PaaS', 'C) SaaS', 'D) BaaS'],
      correctAnswer: 'D',
      language: 'AWS',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'aws_jr_02',
      questionText:
          '¿Qué modelo de despliegue de Cloud Computing implica que la infraestructura es propiedad de un único cliente y se mantiene en sus instalaciones?',
      options: [
        'A) Nube Pública',
        'B) Nube Híbrida',
        'C) Nube Privada',
        'D) Nube Comunitaria'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'aws_jr_03',
      questionText:
          '¿Cuáles son los tres modelos de servicio principales en Cloud Computing?',
      options: [
        'A) Computing, Storage, Networking',
        'B) IaaS, PaaS, SaaS',
        'C) Public, Private, Hybrid',
        'D) Development, Testing, Production'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Jr',
    ),
    // Topic 2: Cuenta y Facturación AWS
    ExamQuestionModel(
      id: 'aws_jr_04',
      questionText:
          '¿Qué herramienta de AWS te permite ver una previsión de tus costos en los próximos meses?',
      options: [
        'A) AWS Budgets',
        'B) AWS Cost Explorer',
        'C) AWS Billing Dashboard',
        'D) AWS Trusted Advisor'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'aws_jr_05',
      questionText:
          '¿Qué servicio de AWS te permite configurar alertas cuando tus costos superan un umbral definido?',
      options: [
        'A) Cost Explorer',
        'B) Budgets',
        'C) CloudWatch',
        'D) Billing Dashboard'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Jr',
    ),
    // Topic 3: AWS Global Infrastructure
    ExamQuestionModel(
      id: 'aws_jr_06',
      questionText: '¿Qué son las Availability Zones en AWS?',
      options: [
        'A) Ubicaciones geográficas separadas donde AWS aloja sus servicios.',
        'B) Centros de datos distintos y aislados dentro de una Región de AWS.',
        'C) Puntos de presencia para entregar contenido de forma rápida.',
        'D) Áreas para clientes específicos en ubicaciones on-premises.'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'aws_jr_07',
      questionText:
          '¿Qué servicio de AWS mejora el rendimiento de las aplicaciones mediante el enrutamiento del tráfico de los usuarios a la ubicación más cercana en la red global de AWS?',
      options: [
        'A) AWS Direct Connect',
        'B) AWS VPN',
        'C) AWS Global Accelerator',
        'D) AWS Transit Gateway'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'aws_jr_08',
      questionText: '¿Cuál es el propósito de las Edge Locations de AWS?',
      options: [
        'A) Alojar instancias EC2 de alto rendimiento.',
        'B) Proporcionar servicios de base de datos relacionales.',
        'C) Almacenar copias en caché del contenido para reducir la latencia.',
        'D) Realizar migraciones de grandes volúmenes de datos.'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Jr',
    ),
    // Topic 4: Interfaz de AWS
    ExamQuestionModel(
      id: 'aws_jr_09',
      questionText:
          '¿Cuál es la interfaz gráfica de usuario basada en web para acceder y administrar los servicios de AWS?',
      options: [
        'A) AWS CLI',
        'B) AWS SDKs',
        'C) AWS Management Console',
        'D) AWS CloudFormation'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'aws_jr_10',
      questionText:
          '¿Qué herramienta de AWS permite interactuar con los servicios de AWS mediante comandos en una terminal?',
      options: [
        'A) AWS Management Console',
        'B) AWS SDKs',
        'C) AWS CLI',
        'D) AWS Mobile App'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Jr',
    ),

    // Nivel 2: Servicios Básicos de Computación
    // Topic 1: Amazon EC2
    ExamQuestionModel(
      id: 'aws_jr_11',
      questionText:
          '¿Qué componente de EC2 controla el tráfico de entrada y salida permitido a las instancias EC2?',
      options: [
        'A) Key Pairs',
        'B) AMIs',
        'C) Security Groups',
        'D) EBS Volumes'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'aws_jr_12',
      questionText: '¿Qué son las AMIs (Amazon Machine Images) en EC2?',
      options: [
        'A) Plantillas de hardware para instancias EC2.',
        'B) Imágenes preconfiguradas que incluyen un sistema operativo, aplicaciones y configuraciones.',
        'C) Discos de almacenamiento persistente para instancias EC2.',
        'D) Reglas de firewall para proteger instancias EC2.'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Jr',
    ),
    // Topic 2: Elastic Load Balancing
    ExamQuestionModel(
      id: 'aws_jr_13',
      questionText:
          '¿Qué tipo de Load Balancer es el más adecuado para equilibrar el tráfico HTTP y HTTPS?',
      options: [
        'A) Network Load Balancer (NLB)',
        'B) Classic Load Balancer (CLB)',
        'C) Application Load Balancer (ALB)',
        'D) Gateway Load Balancer (GLB)'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'aws_jr_14',
      questionText:
          '¿Qué característica de Elastic Load Balancing distribuye el tráfico equitativamente entre las instancias en diferentes Availability Zones?',
      options: [
        'A) Health Checks',
        'B) Target Groups',
        'C) Cross-zone load balancing',
        'D) Stickiness'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Jr',
    ),
    // Topic 3: Auto Scaling
    ExamQuestionModel(
      id: 'aws_jr_15',
      questionText:
          '¿Qué componente de Auto Scaling define el número mínimo y máximo de instancias EC2?',
      options: [
        'A) Launch Templates',
        'B) Scaling Policies',
        'C) Auto Scaling Groups',
        'D) Lifecycle Hooks'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'aws_jr_16',
      questionText:
          '¿Qué se utiliza para especificar cómo el grupo de Auto Scaling debe escalar hacia arriba o hacia abajo en respuesta a la demanda?',
      options: [
        'A) Launch Templates',
        'B) Scaling Policies',
        'C) Health Checks',
        'D) Instance Types'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Jr',
    ),
    // Topic 4: AWS Lambda
    ExamQuestionModel(
      id: 'aws_jr_17',
      questionText:
          '¿Qué concepto de computación implica que no necesitas aprovisionar ni administrar servidores?',
      options: [
        'A) Contenedores',
        'B) Máquinas virtuales',
        'C) Serverless',
        'D) Bases de datos autogestionadas'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'aws_jr_18',
      questionText: 'En AWS Lambda, ¿qué es un "Trigger"?',
      options: [
        'A) Un evento que invoca la ejecución de una función Lambda.',
        'B) El código de la función Lambda.',
        'C) Un mecanismo de seguridad para las funciones Lambda.',
        'D) Una herramienta para monitorear el rendimiento de Lambda.'
      ],
      correctAnswer: 'A',
      language: 'AWS',
      module: 'Jr',
    ),

    // Nivel 3: Almacenamiento en AWS
    // Topic 1: Amazon S3
    ExamQuestionModel(
      id: 'aws_jr_19',
      questionText: '¿Qué concepto de almacenamiento se utiliza en Amazon S3?',
      options: [
        'A) Almacenamiento de bloques',
        'B) Almacenamiento de archivos',
        'C) Almacenamiento de objetos',
        'D) Almacenamiento de bases de datos'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'aws_jr_20',
      questionText:
          '¿Qué clase de almacenamiento S3 es ideal para datos a los que se accede con poca frecuencia pero que requieren un acceso rápido cuando es necesario, con un costo más bajo que S3 Standard?',
      options: [
        'A) S3 Glacier',
        'B) S3 Standard-IA',
        'C) S3 One Zone-IA',
        'D) S3 Intelligent-Tiering'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'aws_jr_21',
      questionText:
          '¿Qué característica de S3 permite mantener múltiples variantes de un objeto en el mismo bucket?',
      options: [
        'A) Replicación',
        'B) Cifrado',
        'C) Versionado',
        'D) Ciclo de vida'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Jr',
    ),
    // Topic 2: Amazon EBS
    ExamQuestionModel(
      id: 'aws_jr_22',
      questionText:
          '¿Qué tipo de volumen EBS es el más adecuado para cargas de trabajo transaccionales con alta demanda de IOPS, como bases de datos?',
      options: [
        'A) Cold HDD (sc1)',
        'B) Throughput Optimized HDD (st1)',
        'C) General Purpose SSD (gp2/gp3)',
        'D) Provisioned IOPS SSD (io1/io2)'
      ],
      correctAnswer: 'D',
      language: 'AWS',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'aws_jr_23',
      questionText:
          '¿Qué se utiliza para crear una copia de seguridad puntual de un volumen EBS?',
      options: [
        'A) Réplicas',
        'B) Snapshots',
        'C) Clones',
        'D) Backups automáticos'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Jr',
    ),
    // Topic 3: Amazon EFS
    ExamQuestionModel(
      id: 'aws_jr_24',
      questionText:
          '¿Qué servicio de almacenamiento de AWS proporciona un sistema de archivos elástico y escalable que puede ser montado por múltiples instancias EC2 simultáneamente?',
      options: [
        'A) Amazon S3',
        'B) Amazon EBS',
        'C) Amazon EFS',
        'D) AWS Storage Gateway'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'aws_jr_25',
      questionText:
          '¿Cuál de los siguientes es un caso de uso común para Amazon EFS?',
      options: [
        'A) Almacenamiento de objetos estáticos para sitios web.',
        'B) Bases de datos relacionales.',
        'C) Contenido web compartido para aplicaciones escalables.',
        'D) Volúmenes de arranque para instancias EC2.'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Jr',
    ),

    ExamQuestionModel(
      id: 'aws_jr_26',
      questionText:
          '¿Qué tipo de Storage Gateway proporciona un almacenamiento basado en archivos en S3 a través de un punto de conexión NFS o SMB?',
      options: [
        'A) Tape Gateway',
        'B) Volume Gateway',
        'C) File Gateway',
        'D) Cache Gateway'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'aws_jr_27',
      questionText: '¿Cuál es un caso de uso común para AWS Storage Gateway?',
      options: [
        'A) Almacenar archivos para una aplicación web estática.',
        'B) Extender el almacenamiento on-premises a la nube.',
        'C) Ejecutar bases de datos relacionales de alto rendimiento.',
        'D) Distribuir contenido a nivel mundial.'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Jr',
    ),

    // Nivel 4: Bases de Datos en AWS
    // Topic 1: Amazon RDS
    ExamQuestionModel(
      id: 'aws_jr_28',
      questionText:
          '¿Qué opción de despliegue en Amazon RDS proporciona alta disponibilidad y conmutación por error automática a una instancia en espera en otra Availability Zone?',
      options: [
        'A) Single-AZ deployment',
        'B) Multi-AZ deployment',
        'C) Read Replica',
        'D) Automated Backups'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'aws_jr_29',
      questionText:
          '¿Cuál de los siguientes motores de base de datos no es soportado por Amazon RDS?',
      options: ['A) MySQL', 'B) PostgreSQL', 'C) Oracle', 'D) MongoDB'],
      correctAnswer: 'D',
      language: 'AWS',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'aws_jr_30',
      questionText:
          '¿Qué se utiliza en Amazon RDS para crear copias de seguridad de sus instancias de base de datos que se pueden restaurar en un nuevo punto en el tiempo?',
      options: [
        'A) Replicación',
        'B) Snapshots RDS',
        'C) Copias de seguridad manuales',
        'D) Logs de transacciones'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Jr',
    ),
    // Topic 2: Amazon DynamoDB
    ExamQuestionModel(
      id: 'aws_jr_31',
      questionText: '¿Qué tipo de base de datos es Amazon DynamoDB?',
      options: [
        'A) Relacional',
        'B) NoSQL',
        'C) Gráfica',
        'D) Almacén de datos'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'aws_jr_32',
      questionText:
          'En DynamoDB, ¿qué modelo de capacidad te permite pagar por la capacidad de lectura y escritura a medida que tu aplicación la necesita, sin necesidad de especificar la capacidad de antemano?',
      options: [
        'A) Capacidad Provisionada',
        'B) Capacidad On-Demand',
        'C) Capacidad Estándar',
        'D) Capacidad Reservada'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'aws_jr_33',
      questionText:
          '¿Qué componente de DynamoDB se utiliza para optimizar las consultas y proporcionar acceso rápido a diferentes patrones de acceso a los datos?',
      options: ['A) Tablas', 'B) Atributos', 'C) Índices', 'D) Particiones'],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Jr',
    ),
    // Topic 3: Amazon ElastiCache
    ExamQuestionModel(
      id: 'aws_jr_34',
      questionText:
          '¿Cuál de los siguientes motores de caché es compatible con Amazon ElastiCache y es conocido por su persistencia de datos y estructuras de datos más complejas?',
      options: ['A) Memcached', 'B) Redis', 'C) Varnish', 'D) Nginx'],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'aws_jr_35',
      questionText: '¿Cuál es un caso de uso común para Amazon ElastiCache?',
      options: [
        'A) Almacenamiento primario para bases de datos relacionales.',
        'B) Caching de bases de datos para reducir la carga y mejorar el rendimiento.',
        'C) Almacenamiento de datos de archivo.',
        'D) Procesamiento de grandes volúmenes de datos para análisis.'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Jr',
    ),
    // Topic 4: AWS Database Migration Service
    ExamQuestionModel(
      id: 'aws_jr_36',
      questionText:
          '¿Qué tipo de migración con AWS DMS implica migrar una base de datos de Oracle a PostgreSQL?',
      options: [
        'A) Migración homogénea',
        'B) Migración heterogénea',
        'C) Migración en frío',
        'D) Migración en caliente'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'aws_jr_37',
      questionText:
          '¿Qué característica de AWS DMS permite que los cambios de datos en la base de datos de origen se repliquen continuamente en la base de datos de destino?',
      options: [
        'A) One-time migration',
        'B) Full load',
        'C) Continuous replication',
        'D) Schema conversion'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Jr',
    ),

    // Nivel 5: Redes y Seguridad Básica
    // Topic 1: Amazon VPC
    ExamQuestionModel(
      id: 'aws_jr_38',
      questionText:
          '¿Qué componente de una VPC permite la conectividad de las instancias en una subred privada a Internet?',
      options: [
        'A) Internet Gateway',
        'B) Route Table',
        'C) Security Group',
        'D) NAT Gateway'
      ],
      correctAnswer: 'D',
      language: 'AWS',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'aws_jr_39',
      questionText:
          '¿Qué se utiliza para permitir la comunicación entre dos VPCs diferentes?',
      options: [
        'A) Internet Gateway',
        'B) NAT Gateway',
        'C) VPC Peering',
        'D) VPN Connection'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'aws_jr_40',
      questionText:
          '¿Qué componente de una VPC es una red virtual aislada lógicamente dentro de la nube de AWS?',
      options: [
        'A) Subnet',
        'B) Route Table',
        'C) Virtual Private Cloud (VPC)',
        'D) Internet Gateway'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Jr',
    ),
    // Topic 2: Seguridad en AWS
    ExamQuestionModel(
      id: 'aws_jr_41',
      questionText:
          '¿Qué entidad de IAM se utiliza para otorgar permisos a servicios de AWS para interactuar con otros servicios en su nombre?',
      options: ['A) Usuarios', 'B) Grupos', 'C) Roles', 'D) Políticas'],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'aws_jr_42',
      questionText:
          '¿Qué servicio de AWS ofrece protección estándar contra los ataques DDoS más comunes?',
      options: [
        'A) AWS WAF',
        'B) Amazon GuardDuty',
        'C) AWS Shield Standard',
        'D) AWS Security Hub'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'aws_jr_43',
      questionText:
          '¿Qué tipo de política de IAM permite especificar lo que una identidad (usuario, grupo, rol) puede o no puede hacer en AWS?',
      options: [
        'A) Service Control Policy',
        'B) Resource-based Policy',
        'C) Identity-based Policy',
        'D) Session Policy'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Jr',
    ),
    // Topic 3: AWS Direct Connect
    ExamQuestionModel(
      id: 'aws_jr_44',
      questionText:
          '¿Qué servicio de AWS proporciona una conexión de red dedicada desde sus instalaciones a AWS, a menudo resultando en una mayor fiabilidad y menor latencia que una conexión VPN estándar?',
      options: [
        'A) AWS VPN',
        'B) AWS Transit Gateway',
        'C) AWS Direct Connect',
        'D) AWS Global Accelerator'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Jr',
    ),
    // Topic 4: AWS WAF y Shield
    ExamQuestionModel(
      id: 'aws_jr_45',
      questionText:
          '¿Qué servicio de AWS ayuda a proteger sus aplicaciones web de vulnerabilidades web comunes y ataques de bots?',
      options: [
        'A) AWS Shield',
        'B) Amazon GuardDuty',
        'C) AWS WAF',
        'D) AWS Security Hub'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Jr',
    ),

    // Nivel 6: Monitoreo y Gestión
    // Topic 1: Amazon CloudWatch
    ExamQuestionModel(
      id: 'aws_jr_46',
      questionText: '¿Qué son las "Métricas" en Amazon CloudWatch?',
      options: [
        'A) Registros de eventos de la aplicación.',
        'B) Variables que miden el rendimiento de los recursos y aplicaciones.',
        'C) Notificaciones de seguridad.',
        'D) Dashboards de visualización de datos.'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'aws_jr_47',
      questionText:
          '¿Qué característica de CloudWatch te notifica cuando una métrica supera un umbral especificado?',
      options: ['A) Dashboards', 'B) Logs', 'C) Eventos', 'D) Alarmas'],
      correctAnswer: 'D',
      language: 'AWS',
      module: 'Jr',
    ),
    // Topic 2: AWS CloudTrail
    ExamQuestionModel(
      id: 'aws_jr_48',
      questionText:
          '¿Qué servicio de AWS registra la actividad de la cuenta, incluyendo las llamadas a la API realizadas por usuarios, roles o servicios de AWS?',
      options: [
        'A) Amazon CloudWatch',
        'B) AWS Config',
        'C) AWS CloudTrail',
        'D) AWS Systems Manager'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Jr',
    ),
    ExamQuestionModel(
      id: 'aws_jr_49',
      questionText:
          '¿Con qué servicio de almacenamiento se integra comúnmente CloudTrail para almacenar los registros de actividad de forma duradera?',
      options: [
        'A) Amazon EBS',
        'B) Amazon EFS',
        'C) Amazon S3',
        'D) Amazon Glacier'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Jr',
    ),
    // Topic 3: AWS Systems Manager
    ExamQuestionModel(
      id: 'aws_jr_50',
      questionText:
          '¿Qué componente de AWS Systems Manager permite la administración segura de la configuración y las credenciales, como contraseñas y claves de API?',
      options: [
        'A) Session Manager',
        'B) Run Command',
        'C) Parameter Store',
        'D) Maintenance Windows'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Jr',
    ),
  ];

  // Insertar las preguntas en la base de datos
  for (final question in preloadedAwsJrQuestions) {
    await db.insert(tableName, question.toMap());
  }
}

Future<void> preloadAwsMidQuestions(Database db, tableName) async {
  final preloadedAwsMidQuestions = [
    ExamQuestionModel(
      id: 'aws_mid_01',
      questionText:
          '¿Cuál de los siguientes no es un pilar del AWS Well-Architected Framework?',
      options: [
        'A) Excelencia Operacional',
        'B) Seguridad',
        'C) Optimización de Costos',
        'D) Complejidad de Integración'
      ],
      correctAnswer: 'D',
      language: 'AWS',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'aws_mid_02',
      questionText:
          '¿Qué herramienta de AWS ayuda a evaluar las arquitecturas de sus cargas de trabajo frente a las mejores prácticas de AWS?',
      options: [
        'A) AWS Config',
        'B) AWS Trusted Advisor',
        'C) Well-Architected Tool',
        'D) AWS Audit Manager'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'aws_mid_03',
      questionText:
          '¿Qué pilar del Well-Architected Framework se enfoca en la capacidad de un sistema para recuperarse de fallas y mantener la funcionalidad?',
      options: [
        'A) Excelencia Operacional',
        'B) Fiabilidad',
        'C) Eficiencia del Rendimiento',
        'D) Optimización de Costos'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Mid',
    ),
    // Topic 2: High Availability
    ExamQuestionModel(
      id: 'aws_mid_04',
      questionText:
          '¿Qué patrón de despliegue de alta disponibilidad implica ejecutar su aplicación en dos entornos idénticos (uno en vivo y otro inactivo) y cambiar todo el tráfico a un nuevo entorno para las actualizaciones?',
      options: [
        'A) Multi-AZ deployments',
        'B) Blue/Green deployments',
        'C) Canary deployments',
        'D) Auto Scaling'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'aws_mid_05',
      questionText:
          '¿Qué despliegue permite que su aplicación esté disponible en múltiples centros de datos distintos dentro de la misma región?',
      options: [
        'A) Single-AZ deployment',
        'B) Multi-AZ deployments',
        'C) Multi-Region deployment',
        'D) Edge Location deployment'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'aws_mid_06',
      questionText:
          '¿Qué patrón de despliegue introduce una nueva versión de una aplicación a un pequeño subconjunto de usuarios antes de un despliegue completo?',
      options: [
        'A) Blue/Green deployments',
        'B) Rolling updates',
        'C) Canary deployments',
        'D) All-at-once deployment'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Mid',
    ),
    // Topic 3: Escalabilidad
    ExamQuestionModel(
      id: 'aws_mid_07',
      questionText:
          '¿Qué tipo de escalado implica aumentar la capacidad de una única instancia (CPU, RAM)?',
      options: [
        'A) Escalado Horizontal',
        'B) Escalado Vertical',
        'C) Auto Scaling',
        'D) Elasticidad'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'aws_mid_08',
      questionText:
          '¿Qué tipo de arquitectura es intrínsecamente escalable al eliminar la necesidad de administrar servidores y escalar automáticamente en respuesta a la demanda?',
      options: [
        'A) Monolítica',
        'B) Serverless architectures',
        'C) Cliente-Servidor',
        'D) Peer-to-Peer'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'aws_mid_09',
      questionText:
          '¿Qué estrategia de escalabilidad se basa en almacenar copias de datos o respuestas en un lugar de acceso rápido para reducir la carga de la base de datos o el servicio de backend?',
      options: [
        'A) Sharding',
        'B) Load Balancing',
        'C) Caching strategies',
        'D) Database Replication'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Mid',
    ),
    // Topic 4: Disaster Recovery
    ExamQuestionModel(
      id: 'aws_mid_10',
      questionText:
          '¿Qué estrategia de Disaster Recovery implica tener un entorno de respaldo en otra región que solo ejecuta una parte mínima de los servicios y escala bajo demanda durante un desastre?',
      options: [
        'A) Backup y restore',
        'B) Pilot light',
        'C) Warm standby',
        'D) Multi-site active/active'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'aws_mid_11',
      questionText:
          '¿Qué estrategia de DR implica tener una versión a pequeña escala completamente funcional de su entorno en una segunda región?',
      options: [
        'A) Backup y restore',
        'B) Pilot light',
        'C) Warm standby',
        'D) Cold standby'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Mid',
    ),

    // Nivel 2: Seguridad Avanzada
    // Topic 1: IAM Avanzado
    ExamQuestionModel(
      id: 'aws_mid_12',
      questionText:
          '¿Qué tipo de políticas de IAM se adjuntan directamente a los recursos de AWS (como buckets S3 o colas SQS) para controlar el acceso a ese recurso?',
      options: [
        'A) Identity-based Policies',
        'B) Resource-based Policies',
        'C) Managed Policies',
        'D) Inline Policies'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'aws_mid_13',
      questionText:
          '¿Qué elemento de las políticas IAM permite especificar condiciones bajo las cuales un permiso es efectivo?',
      options: ['A) Action', 'B) Effect', 'C) Resource', 'D) Conditions'],
      correctAnswer: 'D',
      language: 'AWS',
      module: 'Mid',
    ),
    // Topic 2: Encriptación
    ExamQuestionModel(
      id: 'aws_mid_14',
      questionText:
          '¿Qué servicio de AWS facilita la creación y el control de las claves de cifrado utilizadas para cifrar sus datos?',
      options: [
        'A) AWS Secrets Manager',
        'B) AWS Certificate Manager',
        'C) AWS KMS (Key Management Service)',
        'D) AWS WAF'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'aws_mid_15',
      questionText:
          '¿Qué tipo de clave de cifrado generada en KMS es creada y es de su propiedad, lo que le da control total sobre su uso?',
      options: [
        'A) AWS managed CMK',
        'B) Customer managed CMK',
        'C) AWS owned CMK',
        'D) CloudHSM key'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'aws_mid_16',
      questionText:
          '¿Qué servicio de AWS le ayuda a aprovisionar, administrar e implementar certificados SSL/TLS para sus aplicaciones?',
      options: [
        'A) AWS KMS',
        'B) AWS Secrets Manager',
        'C) AWS Certificate Manager',
        'D) AWS WAF'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Mid',
    ),
    // Topic 3: Detección de Amenazas
    ExamQuestionModel(
      id: 'aws_mid_17',
      questionText:
          '¿Qué servicio de detección de amenazas monitorea continuamente su cuenta de AWS en busca de actividades maliciosas y comportamientos no autorizados?',
      options: [
        'A) AWS Config',
        'B) Amazon GuardDuty',
        'C) Amazon Inspector',
        'D) AWS Security Hub'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'aws_mid_18',
      questionText:
          '¿Qué servicio de AWS ayuda a evaluar la vulnerabilidad de sus aplicaciones en instancias EC2?',
      options: [
        'A) Amazon GuardDuty',
        'B) AWS Config',
        'C) Amazon Inspector',
        'D) AWS Security Hub'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Mid',
    ),
    // Topic 4: Compliance
    ExamQuestionModel(
      id: 'aws_mid_19',
      questionText:
          '¿Qué servicio de AWS proporciona acceso bajo demanda a los informes de seguridad y cumplimiento de AWS y acuerdos en línea?',
      options: [
        'A) AWS Security Hub',
        'B) AWS Audit Manager',
        'C) AWS Artifact',
        'D) AWS Trusted Advisor'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'aws_mid_20',
      questionText:
          '¿Qué benchmark de seguridad es una guía fundamental para configurar de forma segura los recursos de AWS?',
      options: [
        'A) PCI DSS',
        'B) HIPAA',
        'C) GDPR',
        'D) CIS AWS Foundations Benchmark'
      ],
      correctAnswer: 'D',
      language: 'AWS',
      module: 'Mid',
    ),

    // Nivel 3: Contenedores y Serverless
    // Topic 1: Amazon ECS
    ExamQuestionModel(
      id: 'aws_mid_21',
      questionText:
          'En Amazon ECS, ¿qué componente define la configuración de uno o más contenedores para su aplicación, incluyendo el sistema operativo y los recursos necesarios?',
      options: [
        'A) ECS Cluster',
        'B) Service',
        'C) Task Definition',
        'D) Container Instance'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'aws_mid_22',
      questionText: '¿Qué es un "ECS Cluster" en Amazon ECS?',
      options: [
        'A) Una colección de definiciones de tareas.',
        'B) Una agrupación lógica de instancias EC2 o instancias de Fargate donde se ejecutan las tareas.',
        'C) Un servicio de balanceo de carga para contenedores.',
        'D) Una herramienta para monitorear el rendimiento de los contenedores.'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Mid',
    ),
    // Topic 2: Amazon EKS
    ExamQuestionModel(
      id: 'aws_mid_23',
      questionText:
          '¿Qué servicio de AWS le permite ejecutar Kubernetes en AWS sin necesidad de instalar, operar y mantener su propio plano de control de Kubernetes?',
      options: [
        'A) Amazon ECS',
        'B) AWS Fargate',
        'C) Amazon EKS',
        'D) AWS App Runner'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'aws_mid_24',
      questionText: 'En EKS, ¿qué representan los "nodos de trabajo"?',
      options: [
        'A) Los servidores que ejecutan el plano de control de Kubernetes.',
        'B) Las instancias EC2 o Fargate donde se ejecutan sus Pods de Kubernetes.',
        'C) Los servicios de balanceo de carga para EKS.',
        'D) Los volúmenes de almacenamiento persistente para EKS.'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Mid',
    ),
    // Topic 3: AWS Fargate
    ExamQuestionModel(
      id: 'aws_mid_25',
      questionText:
          '¿Qué servicio de AWS le permite ejecutar contenedores sin tener que aprovisionar o administrar servidores ni clusters de EC2?',
      options: [
        'A) Amazon EC2',
        'B) Amazon ECS',
        'C) AWS Fargate',
        'D) Amazon EKS'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'aws_mid_26',
      questionText:
          '¿Cuál es el principal beneficio de usar AWS Fargate para sus contenedores?',
      options: [
        'A) Control total sobre la infraestructura subyacente.',
        'B) Elimina la necesidad de administrar servidores.',
        'C) Requiere configuraciones de red complejas.',
        'D) Solo es compatible con aplicaciones monolíticas.'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Mid',
    ),
    // Topic 4: Serverless Avanzado
    ExamQuestionModel(
      id: 'aws_mid_27',
      questionText:
          '¿Qué servicio de AWS se utiliza para coordinar los componentes de aplicaciones distribuidas utilizando flujos de trabajo visuales, permitiendo la creación de máquinas de estado para funciones Lambda y otras cargas de trabajo?',
      options: [
        'A) AWS SQS',
        'B) AWS SNS',
        'C) AWS Step Functions',
        'D) Amazon EventBridge'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'aws_mid_28',
      questionText:
          '¿Qué servicio de AWS es un bus de eventos sin servidor que facilita la conexión de aplicaciones de diferentes fuentes y las dirige a diferentes objetivos?',
      options: [
        'A) AWS SNS',
        'B) AWS SQS',
        'C) Amazon EventBridge',
        'D) AWS Lambda'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'aws_mid_29',
      questionText:
          '¿Qué servicio de AWS se utiliza para monitorear y analizar el rendimiento de aplicaciones distribuidas, incluyendo funciones Lambda?',
      options: [
        'A) Amazon CloudWatch',
        'B) AWS CloudTrail',
        'C) AWS X-Ray',
        'D) AWS Trusted Advisor'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Mid',
    ),

    // Nivel 4: DevOps en AWS
    // Topic 1: CI/CD
    ExamQuestionModel(
      id: 'aws_mid_30',
      questionText:
          '¿Qué servicio de AWS crea un pipeline de CI/CD para automatizar el lanzamiento de software?',
      options: [
        'A) AWS CodeBuild',
        'B) AWS CodeDeploy',
        'C) AWS CodePipeline',
        'D) AWS CodeCommit'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'aws_mid_31',
      questionText:
          '¿Qué servicio de AWS compila el código fuente y ejecuta pruebas?',
      options: [
        'A) AWS CodePipeline',
        'B) AWS CodeDeploy',
        'C) AWS CodeBuild',
        'D) AWS CodeCommit'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'aws_mid_32',
      questionText:
          '¿Qué servicio de AWS automatiza los despliegues de código a una variedad de servicios de cómputo, incluyendo EC2 y Lambda?',
      options: [
        'A) AWS CodeBuild',
        'B) AWS CodePipeline',
        'C) AWS CodeDeploy',
        'D) AWS CodeCommit'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Mid',
    ),
    // Topic 2: Infrastructure as Code
    ExamQuestionModel(
      id: 'aws_mid_33',
      questionText:
          '¿Qué servicio de AWS permite modelar sus recursos de AWS, aprovisionarlos rápidamente y gestionarlos durante todo su ciclo de vida utilizando plantillas?',
      options: [
        'A) AWS Systems Manager',
        'B) AWS CloudFormation',
        'C) AWS OpsWorks',
        'D) AWS Config'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'aws_mid_34',
      questionText:
          '¿Qué característica de CloudFormation le permite ver los cambios propuestos en su stack antes de implementarlos?',
      options: [
        'A) Stack Policies',
        'B) Templates',
        'C) Change Sets',
        'D) Drift Detection'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Mid',
    ),
    // Topic 3: Configuración Automatizada
    ExamQuestionModel(
      id: 'aws_mid_35',
      questionText:
          '¿Qué servicio de AWS se utiliza para la configuración automatizada de instancias EC2, a menudo utilizando Chef o Puppet?',
      options: [
        'A) AWS Systems Manager',
        'B) AWS CloudFormation',
        'C) AWS OpsWorks',
        'D) AWS AppConfig'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Mid',
    ),
    // Topic 4: Monitoreo Avanzado
    ExamQuestionModel(
      id: 'aws_mid_36',
      questionText:
          '¿Qué característica de CloudWatch le permite analizar y depurar los logs de sus aplicaciones utilizando una sintaxis de consulta potente?',
      options: [
        'A) CloudWatch Metrics',
        'B) CloudWatch Alarms',
        'C) CloudWatch Logs Insights',
        'D) CloudWatch Dashboards'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'aws_mid_37',
      questionText:
          '¿Qué servicio de CloudWatch le permite crear scripts sintéticos para monitorear sus endpoints y APIs desde ubicaciones geográficas específicas?',
      options: [
        'A) CloudWatch Logs',
        'B) CloudWatch Metrics',
        'C) CloudWatch Synthetics',
        'D) CloudWatch ServiceLens'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Mid',
    ),

    // Nivel 5: Bases de Datos Avanzadas
    // Topic 1: Amazon Aurora
    ExamQuestionModel(
      id: 'aws_mid_38',
      questionText:
          '¿Cuál es una característica clave de la arquitectura de Amazon Aurora que la hace altamente disponible y duradera?',
      options: [
        'A) Utiliza un solo nodo de base de datos.',
        'B) Almacena el volumen de la base de datos en múltiples Availability Zones y lo replica seis veces.',
        'C) Requiere que los datos se repliquen manualmente.',
        'D) Se basa en almacenamiento local para todas las copias de los datos.'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'aws_mid_39',
      questionText:
          '¿Qué característica de Aurora permite que la base de datos escale la capacidad de manera automática, sin la necesidad de aprovisionar o administrar instancias, ideal para cargas de trabajo intermitentes e impredecibles?',
      options: [
        'A) Aurora Global Database',
        'B) Aurora Serverless',
        'C) Aurora Multi-Master',
        'D) Aurora Read Replicas'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Mid',
    ),
    // Topic 2: Amazon Redshift
    ExamQuestionModel(
      id: 'aws_mid_40',
      questionText: '¿Qué tipo de base de datos es Amazon Redshift?',
      options: [
        'A) Relacional OLTP',
        'B) NoSQL',
        'C) Data Warehousing (OLAP)',
        'D) Gráfica'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'aws_mid_41',
      questionText:
          'En Redshift, ¿qué característica permite ejecutar consultas directamente sobre datos almacenados en Amazon S3 sin cargarlos en Redshift?',
      options: [
        'A) Redshift Spectrum',
        'B) Redshift ML',
        'C) Redshift Materialized Views',
        'D) Redshift Concurrency Scaling'
      ],
      correctAnswer: 'A',
      language: 'AWS',
      module: 'Mid',
    ),
    // Topic 3: Amazon Neptune
    ExamQuestionModel(
      id: 'aws_mid_42',
      questionText: '¿Qué tipo de base de datos es Amazon Neptune?',
      options: [
        'A) Relacional',
        'B) Clave-valor',
        'C) Documental',
        'D) Gráfica'
      ],
      correctAnswer: 'D',
      language: 'AWS',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'aws_mid_43',
      questionText:
          '¿Qué lenguaje de consulta se utiliza comúnmente con Amazon Neptune para grafos de propiedades?',
      options: ['A) SQL', 'B) SPARQL', 'C) Gremlin', 'D) Cypher'],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Mid',
    ),
    // Topic 4: Amazon QLDB
    ExamQuestionModel(
      id: 'aws_mid_44',
      questionText:
          '¿Qué tipo de base de datos es Amazon QLDB (Quantum Ledger Database)?',
      options: [
        'A) Relacional',
        'B) NoSQL de documentos',
        'C) Ledger database inmutable y transparente',
        'D) Gráfica'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'aws_mid_45',
      questionText:
          '¿Qué característica principal de Amazon QLDB garantiza la integridad de los datos y permite verificar la historia completa de los cambios de datos?',
      options: [
        'A) Escalabilidad automática',
        'B) Inmutabilidad y criptografía',
        'C) Flexibilidad de esquemas',
        'D) Alta disponibilidad'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Mid',
    ),

    // Nivel 6: Big Data y Machine Learning
    // Topic 1: Amazon S3 Avanzado
    ExamQuestionModel(
      id: 'aws_mid_46',
      questionText:
          '¿Qué característica de S3 permite ejecutar consultas SQL directamente sobre los datos en S3 sin necesidad de cargarlos en una base de datos?',
      options: [
        'A) S3 Batch Operations',
        'B) S3 Select',
        'C) S3 Object Lambda',
        'D) S3 Storage Lens'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'aws_mid_47',
      questionText:
          '¿Qué servicio de S3 se utiliza para realizar operaciones a escala en millones o miles de millones de objetos, como copiar, etiquetar o restaurar desde Glacier?',
      options: [
        'A) S3 Select',
        'B) S3 Versioning',
        'C) S3 Batch Operations',
        'D) S3 Replication'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Mid',
    ),
    // Topic 2: AWS Glue
    ExamQuestionModel(
      id: 'aws_mid_48',
      questionText:
          '¿Qué servicio de AWS es un servicio de ETL (Extract, Transform, Load) sin servidor que facilita la preparación y carga de datos para análisis?',
      options: [
        'A) Amazon Athena',
        'B) AWS Glue',
        'C) Amazon EMR',
        'D) AWS Data Pipeline'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Mid',
    ),
    ExamQuestionModel(
      id: 'aws_mid_49',
      questionText:
          'En AWS Glue, ¿qué componente es un repositorio de metadatos centralizado para descubrir y organizar los datos?',
      options: ['A) Crawlers', 'B) Jobs', 'C) Data Catalog', 'D) Triggers'],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Mid',
    ),
    // Topic 3: Amazon SageMaker
    ExamQuestionModel(
      id: 'aws_mid_50',
      questionText:
          '¿Qué servicio de AWS proporciona a los desarrolladores y científicos de datos la capacidad de construir, entrenar y desplegar modelos de Machine Learning de manera rápida a escala?',
      options: [
        'A) Amazon Rekognition',
        'B) Amazon Comprehend',
        'C) Amazon SageMaker',
        'D) Amazon Polly'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Mid',
    ),
  ];

  // Insertar las preguntas en la base de datos
  for (final question in preloadedAwsMidQuestions) {
    await db.insert(tableName, question.toMap());
  }
}

Future<void> preloadAwsSrQuestions(Database db, tableName) async {
  final preloadedAwsSrQuestions = [
    ExamQuestionModel(
      id: 'aws_sr_01',
      questionText:
          '¿Qué servicio de AWS actúa como un router central en la nube para gestionar la conectividad de múltiples VPCs, cuentas y redes on-premises?',
      options: [
        'A) VPC Peering',
        'B) AWS Direct Connect',
        'C) AWS Transit Gateway',
        'D) AWS Site-to-Site VPN'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'aws_sr_02',
      questionText:
          '¿Qué tipo de conexión VPN de AWS proporciona una conexión cifrada entre su red on-premises y su VPC de AWS a través de Internet?',
      options: [
        'A) AWS Direct Connect',
        'B) AWS Transit Gateway',
        'C) AWS Site-to-Site VPN',
        'D) AWS Client VPN'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'aws_sr_03',
      questionText: '¿Qué es una "VPC Compartida" (Shared VPC) en AWS?',
      options: [
        'A) Una VPC que se extiende a múltiples regiones de AWS.',
        'B) Una característica que permite a varias cuentas de AWS crear y administrar sus recursos dentro de una VPC centralmente controlada.',
        'C) Una VPC que está disponible públicamente para todos los usuarios de AWS.',
        'D) Una VPC que se utiliza exclusivamente para fines de pruebas.'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Sr',
    ),
    // Topic 2: DNS y Balanceo de Carga Avanzado
    ExamQuestionModel(
      id: 'aws_sr_04',
      questionText:
          '¿Qué tipo de política de enrutamiento en Route 53 distribuye el tráfico a múltiples recursos de AWS en proporciones especificadas?',
      options: [
        'A) Simple routing',
        'B) Latency routing',
        'C) Weighted routing',
        'D) Geolocation routing'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'aws_sr_05',
      questionText:
          '¿Qué tipo de política de enrutamiento en Route 53 dirige el tráfico a los recursos en función de la ubicación geográfica del usuario que realiza la consulta DNS?',
      options: [
        'A) Failover routing',
        'B) Geolocation routing',
        'C) Geoproximity routing',
        'D) Multi-value answer routing'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'aws_sr_06',
      questionText:
          '¿Qué característica de un Application Load Balancer permite enrutar el tráfico a diferentes grupos de destino basándose en la URL o los encabezados de la solicitud HTTP?',
      options: [
        'A) Health checks',
        'B) Sticky sessions',
        'C) Path-based routing',
        'D) Listener rules'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Sr',
    ),
    // Topic 3: Conectividad Híbrida Avanzada
    ExamQuestionModel(
      id: 'aws_sr_07',
      questionText:
          '¿Qué tipo de "Virtual Interface" (VIF) en AWS Direct Connect se utiliza para conectarse a sus VPCs en la nube de AWS?',
      options: [
        'A) Public VIF',
        'B) Private VIF',
        'C) Transit VIF',
        'D) Hosted VIF'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'aws_sr_08',
      questionText:
          '¿Qué servicio de AWS se utiliza para extender su VPC a sus centros de datos on-premises, proporcionando una forma híbrida de ejecutar aplicaciones con la misma experiencia de red?',
      options: [
        'A) AWS Direct Connect',
        'B) AWS Site-to-Site VPN',
        'C) AWS Outposts',
        'D) AWS Local Zones'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Sr',
    ),
    // Topic 4: Seguridad de Red Avanzada
    ExamQuestionModel(
      id: 'aws_sr_09',
      questionText:
          '¿Qué servicio de AWS le permite inspeccionar y filtrar el tráfico de red de forma centralizada en todas sus VPCs y redes on-premises?',
      options: [
        'A) Security Groups',
        'B) Network ACLs',
        'C) AWS Network Firewall',
        'D) AWS Firewall Manager'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'aws_sr_10',
      questionText:
          '¿Qué servicio de AWS centraliza las reglas de seguridad de AWS WAF, AWS Shield Advanced y AWS Firewall Manager en todas sus cuentas y VPCs?',
      options: [
        'A) AWS Security Hub',
        'B) AWS Config',
        'C) AWS Firewall Manager',
        'D) Amazon GuardDuty'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Sr',
    ),

    // Nivel 2: Migración y Modernización
    // Topic 1: Estrategias de Migración
    ExamQuestionModel(
      id: 'aws_sr_11',
      questionText:
          '¿Qué estrategia de migración se refiere a la reingeniería o modificación de una aplicación para aprovechar al máximo las capacidades nativas de la nube?',
      options: [
        'A) Rehost',
        'B) Replatform',
        'C) Refactor/Rearchitect',
        'D) Repurchase'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'aws_sr_12',
      questionText:
          '¿Qué estrategia de migración implica simplemente mover las aplicaciones existentes a la nube sin cambios significativos?',
      options: ['A) Replatform', 'B) Rehost', 'C) Refactor', 'D) Retire'],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Sr',
    ),
    // Topic 2: Herramientas de Migración
    ExamQuestionModel(
      id: 'aws_sr_13',
      questionText:
          '¿Qué servicio de AWS se utiliza para migrar servidores físicos, virtuales o basados en la nube a AWS?',
      options: [
        'A) AWS Database Migration Service',
        'B) AWS Snowball',
        'C) AWS Server Migration Service (SMS)',
        'D) AWS Migration Hub'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'aws_sr_14',
      questionText:
          '¿Qué servicio de AWS es una familia de dispositivos de transferencia de datos físicos que permiten a los clientes mover terabytes o petabytes de datos hacia y desde AWS?',
      options: [
        'A) AWS Storage Gateway',
        'B) AWS DataSync',
        'C) AWS Snow Family',
        'D) AWS Transfer Family'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Sr',
    ),
    // Topic 3: Modernización de Aplicaciones
    ExamQuestionModel(
      id: 'aws_sr_15',
      questionText:
          '¿Qué arquitectura de aplicación se considera moderna y se enfoca en componentes pequeños, acoplados libremente, y a menudo desplegados como contenedores o funciones serverless?',
      options: [
        'A) Monolítica',
        'B) Cliente-Servidor',
        'C) Microservicios',
        'D) N-Tier'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'aws_sr_16',
      questionText:
          '¿Qué servicio de AWS permite a los desarrolladores y equipos de operaciones desplegar y escalar aplicaciones web y APIs rápidamente en un entorno sin servidor y con contenedores?',
      options: [
        'A) Amazon ECS',
        'B) AWS Lambda',
        'C) AWS App Runner',
        'D) Amazon EC2'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Sr',
    ),
    // Topic 4: Despliegue de Contenedores Avanzado
    ExamQuestionModel(
      id: 'aws_sr_17',
      questionText:
          '¿Qué herramienta de orquestación de contenedores se utiliza comúnmente para gestionar aplicaciones contenerizadas a gran escala, y es compatible con Amazon EKS?',
      options: [
        'A) Docker Swarm',
        'B) Apache Mesos',
        'C) Kubernetes',
        'D) Nomad'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'aws_sr_18',
      questionText:
          '¿Qué concepto en Kubernetes representa un conjunto de réplicas de Pods idénticas que se pueden escalar y actualizar de forma controlada?',
      options: ['A) Pod', 'B) Deployment', 'C) Service', 'D) Namespace'],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Sr',
    ),

    // Nivel 3: Gestión de Operaciones en la Nube
    // Topic 1: Automatización Avanzada
    ExamQuestionModel(
      id: 'aws_sr_19',
      questionText:
          '¿Qué servicio de AWS permite automatizar tareas operativas comunes, como el parcheo de instancias, la configuración de software y la recopilación de inventario?',
      options: [
        'A) AWS CloudFormation',
        'B) AWS Config',
        'C) AWS Systems Manager',
        'D) AWS OpsWorks'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'aws_sr_20',
      questionText:
          '¿Qué capacidad de AWS Systems Manager permite ejecutar comandos de forma remota y segura en sus instancias, sin necesidad de SSH?',
      options: [
        'A) Parameter Store',
        'B) Session Manager',
        'C) Run Command',
        'D) Automation'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Sr',
    ),
    // Topic 2: Gestión de Configuración y Cumplimiento
    ExamQuestionModel(
      id: 'aws_sr_21',
      questionText:
          '¿Qué servicio de AWS le permite evaluar, auditar y evaluar las configuraciones de sus recursos de AWS para el cumplimiento normativo y las mejores prácticas?',
      options: [
        'A) AWS CloudTrail',
        'B) Amazon CloudWatch',
        'C) AWS Config',
        'D) AWS Systems Manager'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'aws_sr_22',
      questionText:
          '¿Qué se utiliza en AWS Config para evaluar continuamente las configuraciones de los recursos frente a reglas predefinidas o personalizadas?',
      options: [
        'A) Recursos',
        'B) Grabadores',
        'C) Reglas de Config',
        'D) Remediation actions'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Sr',
    ),
    // Topic 3: Respaldo y Recuperación Avanzada
    ExamQuestionModel(
      id: 'aws_sr_23',
      questionText:
          '¿Qué servicio de AWS le permite centralizar y automatizar las políticas de copia de seguridad para todos sus recursos de AWS, incluyendo EBS, RDS, DynamoDB, etc.?',
      options: [
        'A) AWS Backup',
        'B) AWS Storage Gateway',
        'C) AWS DataSync',
        'D) AWS Snowball'
      ],
      correctAnswer: 'A',
      language: 'AWS',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'aws_sr_24',
      questionText:
          '¿Qué se refiere al "Recovery Point Objective" (RPO) en la recuperación ante desastres?',
      options: [
        'A) El tiempo objetivo para recuperar la funcionalidad después de un desastre.',
        'B) La cantidad máxima aceptable de pérdida de datos medida en tiempo.',
        'C) El costo de implementar una solución de recuperación ante desastres.',
        'D) La capacidad de un sistema para escalar durante un desastre.'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Sr',
    ),
    // Topic 4: Observabilidad Avanzada
    ExamQuestionModel(
      id: 'aws_sr_25',
      questionText:
          '¿Qué servicio de AWS proporciona un análisis de trazas de extremo a extremo para sus aplicaciones distribuidas, ayudando a identificar cuellos de botella y errores?',
      options: [
        'A) Amazon CloudWatch',
        'B) AWS CloudTrail',
        'C) AWS X-Ray',
        'D) Amazon GuardDuty'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'aws_sr_26',
      questionText:
          '¿Qué herramienta de código abierto se utiliza a menudo para la visualización de métricas y dashboards, y puede integrarse con Amazon Managed Prometheus?',
      options: ['A) Kibana', 'B) Grafana', 'C) Splunk', 'D) Tableau'],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'aws_sr_27',
      questionText:
          '¿Qué estándar de instrumentación de código abierto se menciona para la recopilación de telemetría (métricas, logs, trazas) en aplicaciones?',
      options: [
        'A) Prometheus',
        'B) Grafana',
        'C) OpenTelemetry',
        'D) Fluentd'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Sr',
    ),

    // Nivel 4: Big Data y Machine Learning Avanzado
    // Topic 1: Data Lakes Avanzados
    ExamQuestionModel(
      id: 'aws_sr_28',
      questionText:
          '¿Qué servicio de AWS facilita la construcción, el aseguramiento y la gestión de data lakes en S3, con capacidades de gobernanza y seguridad integradas?',
      options: [
        'A) AWS Glue',
        'B) Amazon Athena',
        'C) AWS Lake Formation',
        'D) Amazon EMR'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'aws_sr_29',
      questionText:
          '¿Qué componente esencial en un data lake avanzado se encarga de organizar, comprender y buscar metadatos de los datos almacenados?',
      options: [
        'A) Data Ingestion',
        'B) Data Storage',
        'C) Data Catalog',
        'D) Data Transformation'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Sr',
    ),
    // Topic 2: ETL Avanzado
    ExamQuestionModel(
      id: 'aws_sr_30',
      questionText:
          '¿Qué característica de AWS Glue permite a los científicos de datos trabajar con sus datos de manera interactiva utilizando notebooks o entornos de desarrollo integrados?',
      options: [
        'A) Glue Crawlers',
        'B) Glue Jobs',
        'C) Glue DataBrew',
        'D) Glue Interactive Sessions'
      ],
      correctAnswer: 'D',
      language: 'AWS',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'aws_sr_31',
      questionText:
          '¿Qué tipo de transformaciones en ETL son a menudo personalizadas y requieren código para lógicas de negocio complejas?',
      options: [
        'A) Standard transforms',
        'B) Custom transforms',
        'C) Built-in transforms',
        'D) Automated transforms'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Sr',
    ),
    // Topic 3: Streaming Avanzado
    ExamQuestionModel(
      id: 'aws_sr_32',
      questionText:
          '¿Qué servicio de AWS en la familia Kinesis se utiliza para construir aplicaciones de procesamiento de datos en tiempo real que pueden procesar grandes flujos de datos?',
      options: [
        'A) Kinesis Data Streams',
        'B) Kinesis Firehose',
        'C) Kinesis Analytics',
        'D) Kinesis Video Streams'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'aws_sr_33',
      questionText:
          '¿Qué tecnología de código abierto es una plataforma de procesamiento de flujo distribuido, compatible con Kinesis Analytics Studio, para aplicaciones de streaming de datos complejos?',
      options: [
        'A) Apache Spark',
        'B) Apache Flink',
        'C) Apache Storm',
        'D) Apache Cassandra'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'aws_sr_34',
      questionText:
          '¿Qué servicio de AWS proporciona clústeres de Apache Kafka completamente administrados?',
      options: [
        'A) Amazon Kinesis',
        'B) Amazon SQS',
        'C) Amazon MSK (Managed Streaming for Kafka)',
        'D) Amazon MQ'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Sr',
    ),
    // Topic 4: Analytics Avanzado
    ExamQuestionModel(
      id: 'aws_sr_35',
      questionText:
          '¿Qué característica de Amazon Athena permite ejecutar consultas SQL federadas en datos de múltiples fuentes, como S3, RDS, y DynamoDB, sin mover los datos?',
      options: [
        'A) Federated Queries',
        'B) Saved Queries',
        'C) Data Catalog Integration',
        'D) Views'
      ],
      correctAnswer: 'A',
      language: 'AWS',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'aws_sr_36',
      questionText:
          '¿Qué servicio de BI (Business Intelligence) de AWS permite crear visualizaciones interactivas y dashboards a partir de sus datos en la nube?',
      options: [
        'A) Amazon Redshift',
        'B) Amazon EMR',
        'C) Amazon QuickSight',
        'D) AWS Glue'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Sr',
    ),

    // Nivel 5: Innovación y Tendencias
    // Topic 1: Machine Learning Avanzado
    ExamQuestionModel(
      id: 'aws_sr_37',
      questionText:
          '¿Qué capacidad de Amazon SageMaker le permite automatizar el proceso de construcción, entrenamiento y ajuste de modelos de Machine Learning, incluso para usuarios no expertos en ML?',
      options: [
        'A) SageMaker Studio',
        'B) SageMaker Autopilot',
        'C) SageMaker Ground Truth',
        'D) SageMaker Canvas'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'aws_sr_38',
      questionText:
          '¿Qué disciplina en Machine Learning se enfoca en operacionalizar modelos de ML, abarcando desde el desarrollo hasta el despliegue, el monitoreo y la gobernanza?',
      options: [
        'A) Data Science',
        'B) MLOps',
        'C) Data Engineering',
        'D) AI Research'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'aws_sr_39',
      questionText:
          '¿Qué concepto se refiere a la ejecución de modelos de Machine Learning directamente en dispositivos de borde (edge devices) en lugar de en la nube, para inferencia de baja latencia y alta eficiencia?',
      options: [
        'A) Cloud ML',
        'B) Edge ML',
        'C) Centralized ML',
        'D) Hybrid ML'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Sr',
    ),
    // Topic 2: IoT
    ExamQuestionModel(
      id: 'aws_sr_40',
      questionText:
          '¿Qué servicio de AWS IoT permite que los dispositivos de borde ejecuten funciones de Lambda localmente y se comuniquen de forma segura con la nube de AWS?',
      options: [
        'A) AWS IoT Core',
        'B) AWS IoT Device Management',
        'C) AWS IoT Greengrass',
        'D) AWS IoT Analytics'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'aws_sr_41',
      questionText:
          '¿Qué servicio de AWS IoT se utiliza para recopilar, procesar y analizar grandes volúmenes de datos de IoT para descubrir insights?',
      options: [
        'A) AWS IoT Core',
        'B) AWS IoT Device Defender',
        'C) AWS IoT Analytics',
        'D) AWS IoT Events'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'aws_sr_42',
      questionText:
          '¿Qué servicio de AWS IoT le permite gestionar, monitorear y actualizar flotas de dispositivos IoT de forma remota?',
      options: [
        'A) AWS IoT Core',
        'B) AWS IoT Device Management',
        'C) AWS IoT Greengrass',
        'D) AWS IoT SiteWise'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Sr',
    ),
    // Topic 3: Blockchain
    ExamQuestionModel(
      id: 'aws_sr_43',
      questionText:
          '¿Qué servicio de AWS proporciona una plataforma de blockchain completamente administrada que le permite unirse a redes públicas de blockchain o crear redes de blockchain privadas escalables?',
      options: [
        'A) Amazon QLDB',
        'B) Amazon Neptune',
        'C) Amazon Managed Blockchain',
        'D) AWS Blockchain Explorer'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'aws_sr_44',
      questionText:
          '¿Qué framework de código abierto es compatible con Amazon Managed Blockchain y es ampliamente utilizado para crear redes de blockchain privadas con contratos inteligentes?',
      options: [
        'A) Bitcoin',
        'B) Ethereum',
        'C) Hyperledger Fabric',
        'D) Corda'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Sr',
    ),
    // Topic 4: Quantum Computing
    ExamQuestionModel(
      id: 'aws_sr_45',
      questionText:
          '¿Qué servicio de AWS proporciona acceso a hardware de computación cuántica de diferentes proveedores y permite a los desarrolladores y científicos experimentar con algoritmos cuánticos?',
      options: [
        'A) AWS SageMaker Quantum',
        'B) Amazon Braket',
        'C) AWS Quantum Lab',
        'D) AWS Quantum Accelerator'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Sr',
    ),
    // Topic 5: Realidad Virtual/Aumentada
    ExamQuestionModel(
      id: 'aws_sr_46',
      questionText:
          '¿Qué servicio de AWS permite a los desarrolladores crear rápidamente experiencias de realidad virtual (VR), realidad aumentada (AR) y 3D interactivas sin necesidad de conocimientos especializados en gráficos 3D?',
      options: [
        'A) Amazon Sumerian',
        'B) Amazon Polly',
        'C) Amazon Rekognition',
        'D) Amazon Comprehend'
      ],
      correctAnswer: 'A',
      language: 'AWS',
      module: 'Sr',
    ),

    // Nivel 6: Gobernanza y Gestión de Cuentas Avanzadas
    // Topic 1: AWS Organizations
    ExamQuestionModel(
      id: 'aws_sr_47',
      questionText:
          '¿Qué característica de AWS Organizations le permite aplicar políticas de control de permisos a nivel de cuenta o grupo de cuentas, restringiendo los servicios y acciones que los usuarios y roles pueden usar?',
      options: [
        'A) Service Control Policies (SCPs)',
        'B) Organization Units (OUs)',
        'C) Account management',
        'D) Consolidated billing'
      ],
      correctAnswer: 'A',
      language: 'AWS',
      module: 'Sr',
    ),
    ExamQuestionModel(
      id: 'aws_sr_48',
      questionText:
          '¿Qué es una "Unidad Organizativa" (OU) en AWS Organizations?',
      options: [
        'A) Una sola cuenta de AWS.',
        'B) Un grupo lógico de cuentas dentro de una organización.',
        'C) Un servicio de AWS para gestionar presupuestos.',
        'D) Un tipo de política de seguridad.'
      ],
      correctAnswer: 'B',
      language: 'AWS',
      module: 'Sr',
    ),
    // Topic 2: AWS Control Tower
    ExamQuestionModel(
      id: 'aws_sr_49',
      questionText:
          '¿Qué servicio de AWS proporciona un "landing zone" multi-cuenta bien arquitecturado que sigue las mejores prácticas de AWS para la gobernanza, seguridad y cumplimiento?',
      options: [
        'A) AWS Organizations',
        'B) AWS Config',
        'C) AWS Control Tower',
        'D) AWS Security Hub'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Sr',
    ),
    // Topic 3: Cost Optimization Avanzada
    ExamQuestionModel(
      id: 'aws_sr_50',
      questionText:
          '¿Qué modelo de precios de EC2 es ideal para cargas de trabajo tolerantes a fallos con patrones de uso flexibles, ya que ofrecen la mayor reducción de costos?',
      options: [
        'A) On-Demand Instances',
        'B) Reserved Instances',
        'C) Spot Instances',
        'D) Savings Plans'
      ],
      correctAnswer: 'C',
      language: 'AWS',
      module: 'Sr',
    ),
  ];

  // Insertar las preguntas en la base de datos
  for (final question in preloadedAwsSrQuestions) {
    await db.insert(tableName, question.toMap());
  }
}
