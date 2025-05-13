import 'package:flutter/material.dart';
import 'package:sqflite_common/sqlite_api.dart';

class DetailSrLocalDatabaseHelper {
  Future<void> insertDetailsSr(Database db) async {
    try {
      await insertDetailsSrLevel1(db);
      await insertDetailsSrLevel2(db);
      await insertDetailsSrLevel3(db);
      await insertDetailsSrLevel4(db);
      await insertDetailsSrLevel5(db);
      await insertDetailsSrLevel6(db);
    } catch (e) {
      debugPrint("Error inserting details sr: $e");
    }
  }

  Future<void> insertDetailsSrLevel1(Database db) async {
    try {
      await _insertDetailsSrTopic1Level1(db); // Web Sockets
      await _insertDetailsSrTopic2Level1(db); // GraphQL
    } catch (e) {
      debugPrint("Error inserting details sr level 1: $e");
    }
  }

  Future<void> _insertDetailsSrTopic1Level1(Database db) async {
    // Introducción a Web Sockets
    await db.insert('detail', {
      'id': 101,
      'subtopic_id': 's01t01l01',
      'module': 'Sr',
      'definition':
          'WebSockets proporcionan un canal de comunicación bidireccional y persistente entre un cliente y un servidor. A diferencia de HTTP, que es unidireccional, WebSockets permiten que el servidor envíe datos al cliente sin que este tenga que solicitarlos primero.\n\n'
              '**Características clave**:\n'
              '- Conexión persistente\n'
              'Baja latencia\n'
              '-Comunicación full-duplex\n'
              '-Eficiente para actualizaciones en tiempo real\n\n'
              'Los desarrolladores senior a veces subestiman la importancia de manejar correctamente los estados de conexión (conectado, reconectando, desconectado) y la gestión de errores, lo que puede llevar a experiencias de usuario pobres en aplicaciones que dependen de datos en tiempo real.',
      'img_url': '',
      'code_example': '''
// Ejemplo básico de WebSocket en Dart
final channel = IOWebSocketChannel.connect('ws://echo.websocket.org');

// Escuchar mensajes
channel.stream.listen((message) {
 debugPrint('Received: \$message');
});

// Enviar mensaje
channel.sink.add('Hello WebSocket!');

// Cerrar conexión
channel.sink.close();
''',
    });

    // Uso para Comunicación en Tiempo Real
    await db.insert('detail', {
      'id': 102,
      'subtopic_id': 's02t01l01',
      'module': 'Sr',
      'definition':
          'WebSockets son ideales para aplicaciones que requieren actualizaciones en tiempo real como chats, dashboards financieros, juegos multijugador o sistemas de notificaciones.\n\n'
              '**Consideraciones avanzadas**:\n'
              '- Manejo de reconexiones automáticas\n'
              '-Serialización/deserialización eficiente de mensajes\n'
              '-Balanceo de carga con conexiones persistentes\n'
              '-Optimización para redes móviles intermitentes\n\n'
              'Un error común es no implementar un mecanismo de "heartbeat" para detectar conexiones caídas, lo que puede hacer que la aplicación parezca conectada cuando en realidad no lo está.',
      'img_url': '',
      'code_example': '''
// Implementación avanzada con reconexión automática
class WebSocketService {
  final String url;
  IOWebSocketChannel? _channel;
  StreamController<String> _messageController = StreamController.broadcast();
  
  WebSocketService(this.url);
  
  void connect() {
    _channel = IOWebSocketChannel.connect(url);
    _channel!.stream.listen(
      (message) => _messageController.add(message),
      onDone: () => _reconnect(),
      onError: (error) => _reconnect(),
    );
  }
  
  void _reconnect() {
    Future.delayed(Duration(seconds: 2), () => connect());
  }
  
  Stream<String> get messages => _messageController.stream;
  
  void send(String message) {
    _channel?.sink.add(message);
  }
  
  void dispose() {
    _channel?.sink.close();
    _messageController.close();
  }
}
''',
    });

    // Implementación en Flutter
    await db.insert('detail', {
      'id': 103,
      'subtopic_id': 's03t01l01',
      'module': 'Sr',
      'definition':
          'Integrar WebSockets en Flutter requiere considerar la arquitectura de la aplicación y cómo manejar los estados de conexión y los datos recibidos.\n\n'
              '**Patrones recomendados**:\n'
              '- Usar un servicio singleton para gestionar la conexión\n'
              '-Integrar con Riverpod/Provider para manejo de estado\n'
              '-Implementar un sistema de suscripción/desuscripción\n'
              '-Considerar el uso de BLoC para lógica compleja\n\n'
              'Un error frecuente es no desconectar adecuadamente los listeners cuando el widget se destruye, lo que puede causar memory leaks y comportamientos inesperados.',
      'img_url': '',
      'code_example': '''
// Integración con Riverpod
final webSocketProvider = Provider<WebSocketService>((ref) {
  final service = WebSocketService('wss://api.example.com/realtime');
  service.connect();
  ref.onDispose(() => service.dispose());
  return service;
});

class RealTimeDataWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(webSocketProvider.select((s) => s.messages));
    
    return StreamBuilder<String>(
      stream: messages,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text('Datos en tiempo real: \${snapshot.data}');
        }
        return CircularProgressIndicator();
      },
    );
  }
}
''',
    });
  }

  Future<void> _insertDetailsSrTopic2Level1(Database db) async {
    // Introducción a GraphQL
    await db.insert('detail', {
      'id': 104,
      'subtopic_id': 's01t02l01',
      'module': 'Sr',
      'definition':
          'GraphQL es un lenguaje de consulta para APIs que permite a los clientes solicitar exactamente los datos que necesitan, evitando sobre-fetching o under-fetching común en REST.\n\n'
              '**Ventajas clave**:\n'
              '- Consultas específicas que reducen el payload\n'
              '-Obtención de múltiples recursos en una sola solicitud\n'
              '-Tipado fuerte y auto-documentación\n'
              '-Flexibilidad para evolucionar la API sin versionado\n\n'
              'Los desarrolladores senior a veces confunden GraphQL con una solución mágica que no requiere diseño cuidadoso del esquema, lo que puede llevar a problemas de rendimiento con consultas anidadas profundas.',
      'img_url': '',
      'code_example': '''
// Ejemplo de consulta GraphQL
const query = r''
  query GetUser(id: ID!) {
    user(id: id) {
      name
      email
      posts(limit: 5) {
        title
        comments {
          text
          author {
            name
          }
        }
      }
    }
  }
'';

// Variables
final variables = {'id': '123'};
''',
    });

    // Consultas y Mutaciones
    await db.insert('detail', {
      'id': 105,
      'subtopic_id': 's02t02l01',
      'module': 'Sr',
      'definition':
          'GraphQL distingue entre operaciones de lectura (consultas) y escritura (mutaciones), proporcionando una estructura clara para interactuar con la API.\n\n'
              '**Mejores prácticas**:\n'
              '- Diseñar mutaciones para operaciones atómicas\n'
              '-Usar fragmentos para reutilizar selecciones de campos\n'
              '-Implementar paginación basada en cursores\n'
              '-Considerar el uso de suscripciones para datos en tiempo real\n\n'
              'Un error común es crear mutaciones demasiado genéricas que intentan cubrir muchos casos de uso, lo que dificulta el mantenimiento y la optimización.',
      'img_url': '',
      'code_example': '''
// Ejemplo de mutación con variables
const mutation = r''
  mutation CreatePost(title: String!, content: String!) {
    createPost(title: title, content: content) {
      id
      title
      createdAt
    }
  }
'';

// Ejecución con el cliente GraphQL
final result = await client.mutate(
  MutationOptions(
    document: gql(mutation),
    variables: {
      'title': 'Nuevo Post',
      'content': 'Contenido del post...',
    },
  ),
);
''',
    });

    // Integración en Flutter
    await db.insert('detail', {
      'id': 106,
      'subtopic_id': 's03t02l01',
      'module': 'Sr',
      'definition':
          'Integrar GraphQL en Flutter requiere elegir un cliente adecuado (como graphql_flutter) y diseñar una arquitectura que maneje eficientemente el caching y las actualizaciones de UI.\n\n'
              '**Consideraciones avanzadas**:\n'
              '- Configuración del cache (normalización, políticas)\n'
              '-Gestión de estado combinada con Riverpod/Bloc\n'
              '-Manejo de errores y estados de carga\n'
              '-Optimización para consultas repetidas\n\n'
              'Los desarrolladores a veces olvidan que el cache de GraphQL necesita ser actualizado manualmente después de mutaciones para mantener la UI consistente, especialmente para datos que pueden haber cambiado.',
      'img_url': '',
      'code_example': '''
// Configuración del cliente GraphQL en Flutter
final HttpLink httpLink = HttpLink('https://api.example.com/graphql');
final AuthLink authLink = AuthLink(getToken: () => 'Bearer \$token');

final Link link = authLink.concat(httpLink);

final ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
    cache: GraphQLCache(store: InMemoryStore()),
    link: link,
  ),
);

// Uso con Widgets
class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: Query(
        options: QueryOptions(
          document: gql(query),
          variables: {'id': '123'},
          pollInterval: Duration(seconds: 10),
        ),
        builder: (result, {fetchMore, refetch}) {
          if (result.isLoading) return LoadingIndicator();
          if (result.hasException) return ErrorView(result.exception);
          
          final user = result.data!['user'];
          return ProfileView(user: user);
        },
      ),
    );
  }
}
''',
    });
  }

  Future<void> insertDetailsSrLevel2(Database db) async {
    try {
      await _insertDetailsSrTopic1Level2(db);
      await _insertDetailsSrTopic2Level2(db);
    } catch (e) {
      debugPrint("Error inserting details sr level 2: $e");
    }
  }

  Future<void> _insertDetailsSrTopic1Level2(Database db) async {
    // Optimización de Consultas en Firestore
    await db.insert('detail', {
      'id': 107,
      'subtopic_id': 's01t01l02',
      'module': 'Sr',
      'definition':
          'Optimizar consultas en Firestore es crucial para mantener bajos costos y buena performance, especialmente a medida que la aplicación escala.\n\n'
              '**Técnicas avanzadas**:\n'
              '- Uso adecuado de índices compuestos\n'
              '-Limitación de reads mediante selectivas de campos\n'
              '-Paginación eficiente con query cursors\n'
              '-Estrategias de denormalización para evitar joins costosos\n\n'
              'Un error común es realizar consultas que escanean muchos documentos cuando solo se necesitan unos pocos, o no aprovechar las capacidades de caching que ofrece Firestore.',
      'img_url': '',
      'code_example': '''
// Consulta optimizada en Firestore
final optimizedQuery = FirebaseFirestore.instance
    .collection('posts')
    .where('published', isEqualTo: true)
    .where('category', isEqualTo: 'tech')
    .orderBy('createdAt', descending: true)
    .limit(10)
    .select(['title', 'summary', 'authorId']); // Solo campos necesarios

// Usando cursor para paginación
final nextPage = FirebaseFirestore.instance
    .collection('posts')
    .orderBy('createdAt', descending: true)
    .startAfterDocument(lastVisibleDocument)
    .limit(10);
''',
    });

    // Transacciones y Operaciones Atómicas
    await db.insert('detail', {
      'id': 108,
      'subtopic_id': 's02t01l02',
      'module': 'Sr',
      'definition':
          'Las transacciones en Firestore aseguran que operaciones múltiples se completen atómicamente, evitando estados inconsistentes cuando falla alguna parte de la operación.\n\n'
              '**Casos de uso clave**:\n'
              '- Actualizaciones contables (likes, votos, balances)\n'
              '-Reservas con disponibilidad limitada\n'
              '-Sistemas donde la consistencia es crítica\n\n'
              'Los desarrolladores senior a veces sobreutilizan transacciones cuando operaciones por lotes (batch writes) serían suficientes, incurriendo en mayor latencia y costos.',
      'img_url': '',
      'code_example': '''
// Ejemplo de transacción atómica
Future<void> transferFunds(String fromId, String toId, double amount) async {
  final db = FirebaseFirestore.instance;
  
  await db.runTransaction((transaction) async {
    final fromDoc = await transaction.get(db.collection('accounts').doc(fromId));
    final toDoc = await transaction.get(db.collection('accounts').doc(toId));
    
    final fromBalance = fromDoc.data()!['balance'];
    final toBalance = toDoc.data()!['balance'];
    
    if (fromBalance < amount) {
      throw Exception('Fondos insuficientes');
    }
    
    transaction.update(fromDoc.reference, {'balance': fromBalance - amount});
    transaction.update(toDoc.reference, {'balance': toBalance + amount});
  });
}

// Operación por lotes (menos costosa cuando no se necesita atomicidad)
final batch = db.batch();
batch.update(db.collection('users').doc('user1'), {'status': 'active'});
batch.update(db.collection('users').doc('user2'), {'status': 'inactive'});
await batch.commit();
''',
    });

    // Seguridad y Reglas en Firestore
    await db.insert('detail', {
      'id': 109,
      'subtopic_id': 's03t01l02',
      'module': 'Sr',
      'definition':
          'Las reglas de seguridad en Firestore son fundamentales para proteger los datos y solo permitir acceso autorizado, funcionando como un firewall para tu base de datos.\n\n'
              '**Patrones avanzados**:\n'
              '- Validación de esquemas de datos\n'
              '-Control de acceso basado en roles (RBAC)\n'
              '-Seguridad a nivel de campo\n'
              '-Reglas recursivas para estructuras jerárquicas\n\n'
              'Un error frecuente es confiar únicamente en reglas de seguridad sin implementar validaciones adicionales en el backend, lo que puede dejar vulnerabilidades cuando se accede desde Cloud Functions.',
      'img_url': '',
      'code_example': '''
// Ejemplo de reglas avanzadas de Firestore
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Validación de esquema y RBAC
    match /posts/{postId} {
      allow read: if request.auth != null;
      allow create: if request.auth != null 
                   && request.resource.data.keys().hasAll(['title', 'content'])
                   && request.resource.data.title is string
                   && request.resource.data.title.size() < 100
                   && isEditor(request.auth.token);
      
      // Seguridad a nivel de campo
      match /comments/{commentId} {
        allow read: if true;
        allow create: if request.auth != null
                     && request.resource.data.text is string;
        allow update, delete: if request.auth != null 
                             && request.auth.uid == resource.data.authorId;
      }
    }
    
    // Función de ayuda para RBAC
    function isEditor(token) {
      return token.claims.editor == true;
    }
  }
}
''',
    });
  }

  Future<void> _insertDetailsSrTopic2Level2(db) async {
    // Optimización para Escalabilidad
    await db.insert('detail', {
      'id': 110,
      'subtopic_id': 's01t02l02',
      'module': 'Sr',
      'definition':
          'Optimizar Cloud Functions para escalabilidad implica diseñar funciones que puedan manejar picos de carga sin degradar el rendimiento o aumentar excesivamente los costos.\n\n'
              '**Estrategias clave**:\n'
              '- Minimizar el tiempo de ejecución\n'
              '-Evitar estados innecesarios entre ejecuciones\n'
              '-Usar triggers específicos en lugar de amplios\n'
              '-Implementar procesamiento por lotes cuando sea posible\n\n'
              'Los desarrolladores senior a veces no consideran el "cold start" problem al diseñar funciones críticas para la latencia, lo que puede afectar la experiencia del usuario.',
      'img_url': '',
      'code_example': '''
// Función optimizada para escalabilidad
exports.processUserUpload = functions
  .runWith({
    timeoutSeconds: 30,
    memory: '256MB',
    minInstances: 1 // Evita cold starts para funciones críticas
  })
  .storage.object()
  .onFinalize(async (object) => {
    // Solo procesar archivos en la carpeta uploads/
    if (!object.name.startsWith('uploads/')) return null;
    
    const bucket = admin.storage().bucket(object.bucket);
    const file = bucket.file(object.name);
    
    // Procesamiento eficiente por lotes
    await processFileInBatches(file, {batchSize: 100});
    
    // Mover a carpeta procesada
    await file.move('processed/' + object.name.split('/').pop());
    
    return true;
  });

async function processFileInBatches(file, {batchSize}) {
  // Implementación de procesamiento por lotes
}
''',
    });

    // Procesamiento en Segundo Plano
    await db.insert('detail', {
      'id': 111,
      'subtopic_id': 's02t02l02',
      'module': 'Sr',
      'definition':
          'Cloud Functions es ideal para tareas en segundo plano que no requieren interacción inmediata del usuario, como procesamiento de datos, generación de reportes o envío de notificaciones.\n\n'
              '**Patrones avanzados**:\n'
              '- Encadenamiento de funciones (chaining)\n'
              '-Uso de Pub/Sub para desacoplar componentes\n'
              '-Implementación de colas de tareas\n'
              '-Manejo de trabajos de larga duración\n\n'
              'Un error común es no implementar mecanismos adecuados de reintento para funciones fallidas, lo que puede llevar a pérdida de datos o procesos incompletos.',
      'img_url': '',
      'code_example': '''
// Ejemplo de procesamiento en segundo plano con cola
exports.generateUserReport = functions
  .firestore.document('reportRequests/{reportId}')
  .onCreate(async (snap, context) => {
    const reportData = snap.data();
    const userId = reportData.userId;
    
    // Validar entrada
    if (!userId) {
      throw new functions.https.HttpsError(
        'invalid-argument', 'Se requiere userId');
    }
    
    // Publicar en cola PubSub para procesamiento asíncrono
    const pubsub = new PubSub();
    const dataBuffer = Buffer.from(JSON.stringify({
      userId: userId,
      reportId: context.params.reportId,
      requestedAt: new Date().toISOString()
    }));
    
    await pubsub.topic('report-generation').publish(dataBuffer);
    
    return {status: 'queued'};
  });

// Función que procesa desde la cola
exports.processReportGeneration = functions
  .pubsub.topic('report-generation')
  .onPublish(async (message) => {
    const data = JSON.parse(message.data.toString());
    
    try {
      const report = await generateComprehensiveReport(data.userId);
      
      await admin.firestore()
        .collection('reports')
        .doc(data.reportId)
        .update({
          status: 'completed',
          reportUrl: report.url,
          completedAt: admin.firestore.FieldValue.serverTimestamp()
        });
    } catch (error) {
      await admin.firestore()
        .collection('reports')
        .doc(data.reportId)
        .update({
          status: 'failed',
          error: error.message
        });
    }
  });
''',
    });

    // Seguridad en Cloud Functions
    await db.insert('detail', {
      'id': 112,
      'subtopic_id': 's03t02l02',
      'module': 'Sr',
      'definition':
          'La seguridad en Cloud Functions debe abordarse en múltiples niveles: autenticación, validación de entrada, control de acceso y protección de datos sensibles.\n\n'
              '**Consideraciones críticas**:\n'
              '- Validar todas las entradas\n'
              '-Implementar CORS adecuadamente\n'
              '-Manejar tokens de autenticación de forma segura\n'
              '-Rotar credenciales y secretos regularmente\n'
              '-Monitorear y registrar actividades sospechosas\n\n'
              'Los desarrolladores senior a veces asumen que las funciones HTTP son seguras por defecto, olvidando implementar validación de autenticación y autorización.',
      'img_url': '',
      'code_example': '''
// Función HTTP segura
exports.secureApiEndpoint = functions
  .runWith({
    secrets: ['API_SECRET_KEY'] // Usar secrets management
  })
  .https.onRequest(async (req, res) => {
    // Validar CORS
    const cors = require('cors')({origin: true});
    cors(req, res, () => {});
    
    // Validar método HTTP
    if (req.method !== 'POST') {
      res.status(405).send('Method Not Allowed');
      return;
    }
    
    // Validar autenticación
    const authHeader = req.headers.authorization;
    if (!authHeader || !authHeader.startsWith('Bearer ')) {
      res.status(401).send('Unauthorized');
      return;
    }
    
    const token = authHeader.split('Bearer ')[1];
    try {
      const decoded = await admin.auth().verifyIdToken(token);
      
      // Validar entrada
      if (!req.body || !req.body.action) {
        res.status(400).send('Bad Request');
        return;
      }
      
      // Procesar según rol de usuario
      switch (req.body.action) {
        case 'getData':
          if (decoded.role !== 'admin') {
            res.status(403).send('Forbidden');
            return;
          }
          const data = await getSensitiveData();
          res.status(200).json(data);
          break;
          
        case 'updateProfile':
          const result = await updateUserProfile(decoded.uid, req.body.data);
          res.status(200).json(result);
          break;
          
        default:
          res.status(400).send('Invalid Action');
      }
    } catch (error) {
      console.error('Error:', error);
      res.status(500).send('Internal Server Error');
    }
  });
''',
    });
  }

  Future<void> insertDetailsSrLevel3(Database db) async {
    try {
      await _insertDetailsSrTopic1Level3(db);
    } catch (e) {
      debugPrint("Error inserting details sr level 3: $e");
    }
  }

  Future<void> _insertDetailsSrTopic1Level3(Database db) async {
    // Introducción a Animaciones Curvas
    await db.insert('detail', {
      'id': 113,
      'subtopic_id': 's01t01l03',
      'module': 'Sr',
      'definition':
          'Las animaciones curvas en Flutter definen cómo progresa una animación a lo largo del tiempo, permitiendo crear movimientos más naturales y atractivos que las lineales.\n\n'
              '**Conceptos clave**:\n'
              '- Curvas predefinidas (easeIn, easeOut, bounce, elastic)\n'
              '-Curvas personalizadas usando Cubic\n'
              '-Relación entre el valor t (tiempo) y la transformación\n'
              '-Uso combinado con Tween para diferentes propiedades\n\n'
              'Los desarrolladores senior a veces subestiman el impacto psicológico de las animaciones bien diseñadas, que pueden mejorar significativamente la percepción de calidad de una app.',
      'img_url': '',
      'code_example': '''
// Ejemplo básico de animación con curva
AnimationController controller = AnimationController(
  duration: const Duration(seconds: 2),
  vsync: this,
);

final Animation<double> animation = Tween<double>(begin: 0, end: 300).animate(
  CurvedAnimation(
    parent: controller,
    curve: Curves.easeInOut,
  ),
);

// Uso en un widget
AnimatedBuilder(
  animation: animation,
  builder: (context, child) {
    return Container(
      margin: EdgeInsets.only(left: animation.value),
      child: child,
    );
  },
  child: FlutterLogo(size: 100),
);

controller.forward();
''',
    });

    // Curvas Personalizadas
    await db.insert('detail', {
      'id': 114,
      'subtopic_id': 's02t01l03',
      'module': 'Sr',
      'definition':
          'Crear curvas personalizadas permite diseñar animaciones únicas que se ajustan exactamente a la identidad de tu aplicación y a las expectativas de los usuarios.\n\n'
              '**Técnicas avanzadas**:\n'
              '-Uso de Cubic(p1x, p1y, p2x, p2y) para curvas Bézier\n'
              '-Creación de curvas escalonadas (step)\n'
              '-Animaciones con pausas intencionales\n'
              '-Curvas asimétricas para mayor realismo\n\n'
              'Un error común es crear curvas demasiado complejas que no aportan valor real o que incluso distraen al usuario de la experiencia principal.',
      'img_url': '',
      'code_example': '''
// Curva personalizada con Cubic
class CustomCurve extends Curve {
  @override
  double transform(double t) {
    // Implementación personalizada
    return t < 0.5 ? 2 * t * t : -1 + (4 - 2 * t) * t;
  }
}

// Curva Bézier cúbica
final customAnimation = Tween(begin: 0.0, end: 1.0).animate(
  CurvedAnimation(
    parent: controller,
    curve: Cubic(0.17, 0.67, 0.83, 0.67), // Valores personalizados
  ),
);

// Curva con pausa
class PausedCurve extends Curve {
  @override
  double transform(double t) {
    if (t < 0.3) return t * 1.5;
    if (t < 0.7) return 0.45; // Pausa
    return 0.45 + (t - 0.7) * 1.833;
  }
}
''',
    });

    // Combinación con otros Efectos
    await db.insert('detail', {
      'id': 115,
      'subtopic_id': 's03t01l03',
      'module': 'Sr',
      'definition':
          'Las animaciones curvas se vuelven más poderosas cuando se combinan con otros efectos como transformaciones 3D, cambios de color, clipping paths o efectos de partículas.\n\n'
              '**Combinaciones efectivas**:\n'
              '-Curvas con transformaciones de perspectiva\n'
              '-Animaciones de color sincronizadas con movimiento\n'
              '-Efectos de parallax usando múltiples curvas\n'
              '-Transiciones fluidas entre estados complejos\n\n'
              'Los desarrolladores senior a veces abusan de las animaciones complejas, olvidando que la simplicidad y la coherencia suelen ser más importantes que el efecto técnico en sí.',
      'img_url': '',
      'code_example': '''
// Animación combinada: movimiento, escala y color
final Animation<double> moveAnim = Tween(begin: 0.0, end: 100.0).animate(
  CurvedAnimation(parent: controller, curve: Curves.easeOutBack),
);

final Animation<double> scaleAnim = Tween(begin: 1.0, end: 1.5).animate(
  CurvedAnimation(parent: controller, curve: Curves.elasticOut),
);

final Animation<Color?> colorAnim = ColorTween(
  begin: Colors.blue,
  end: Colors.purple,
).animate(
  CurvedAnimation(parent: controller, curve: Curves.easeIn),
);

AnimatedBuilder(
  animation: controller,
  builder: (context, child) {
    return Transform.translate(
      offset: Offset(moveAnim.value, 0),
      child: Transform.scale(
        scale: scaleAnim.value,
        child: Container(
          width: 100,
          height: 100,
          color: colorAnim.value,
          child: child,
        ),
      ),
    );
  },
  child: Icon(Icons.star, color: Colors.white),
);

// Animación secuencial usando Interval
final Animation<double> firstPart = Tween(begin: 0.0, end: 1.0).animate(
  CurvedAnimation(
    parent: controller,
    curve: Interval(0.0, 0.5, curve: Curves.easeIn),
  ),
);

final Animation<double> secondPart = Tween(begin: 0.0, end: 1.0).animate(
  CurvedAnimation(
    parent: controller,
    curve: Interval(0.5, 1.0, curve: Curves.easeOut),
  ),
);
''',
    });
  }

  Future<void> insertDetailsSrLevel4(Database db) async {
    try {
      await _insertDetailsSrTopic1Level4(db);
      await _insertDetailsSrTopic2Level4(db);
      await _insertDetailsSrTopic3Level4(db);
    } catch (e) {
      debugPrint("Error inserting details sr level 4: $e");
    }
  }

  Future<void> _insertDetailsSrTopic1Level4(Database db) async {
    // Introducción a Render Objects
    await db.insert('detail', {
      'id': 116,
      'subtopic_id': 's01t01l04',
      'module': 'Sr',
      'definition':
          'Los Render Objects son los componentes de bajo nivel en Flutter responsables del layout, pintado y composición de los widgets en pantalla.\n\n'
              '**Conceptos clave**:\n'
              '-Responsables del layout y painting\n'
              '-Forman el árbol de renderizado\n'
              '-Optimizados para operaciones eficientes\n'
              '-Base para todos los widgets estándar\n\n'
              'Los desarrolladores senior a veces intentan crear Render Objects personalizados cuando widgets compuestos serían suficientes, incurriendo en complejidad innecesaria.',
      'img_url': '',
      'code_example': '''
// Esqueleto básico de un Render Object personalizado
class CustomRenderBox extends RenderBox {
  @override
  void performLayout() {
    // Implementación del layout
    size = constraints.biggest;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    // Implementación del pintado
    final canvas = context.canvas;
    final paint = Paint()..color = Colors.blue;
    canvas.drawRect(offset & size, paint);
  }

  @override
  bool hitTestSelf(Offset position) => true;
}

// Uso con un SingleChildRenderObjectWidget
class CustomWidget extends SingleChildRenderObjectWidget {
  @override
  RenderObject createRenderObject(BuildContext context) {
    return CustomRenderBox();
  }
}
''',
    });

    // Widgets Personalizados con Render Objects
    await db.insert('detail', {
      'id': 117,
      'subtopic_id': 's02t01l04',
      'module': 'Sr',
      'definition':
          'Crear widgets personalizados usando Render Objects directamente permite un control total sobre el layout y rendering, útil para efectos visuales complejos o necesidades de performance crítica.\n\n'
              '**Casos de uso adecuados**:\n'
              '-Efectos visuales únicos\n'
              '-Layouts altamente optimizados\n'
              '-Integración con bibliotecas nativas\n'
              '-Widgets con requerimientos de renderizado específicos\n\n'
              'Un error frecuente es no manejar correctamente los dirty flags (needsLayout, needsCompositing, needsPaint) lo que puede llevar a renders innecesarios o falta de actualizaciones.',
      'img_url': '',
      'code_example': '''
// Widget circular con sombra usando Render Object
class CircleShadowRenderBox extends RenderBox {
  final Color color;
  final double blurRadius;
  
  CircleShadowRenderBox({
    required this.color,
    required this.blurRadius,
  });

  @override
  void performLayout() {
    size = Size(
      constraints.maxWidth,
      constraints.maxHeight,
    );
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;
    final center = offset + size.center(Offset.zero);
    final radius = size.shortestSide / 2;
    
    // Sombra
    final shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.2)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurRadius);
    
    canvas.drawCircle(center, radius, shadowPaint);
    
    // Círculo principal
    final circlePaint = Paint()..color = color;
    canvas.drawCircle(center, radius, circlePaint);
  }
}

class CircleShadowWidget extends LeafRenderObjectWidget {
  final Color color;
  final double blurRadius;
  
  const CircleShadowWidget({
    required this.color,
    this.blurRadius = 10.0,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return CircleShadowRenderBox(
      color: color,
      blurRadius: blurRadius,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context, 
    CircleShadowRenderBox renderObject,
  ) {
    renderObject
      ..color = color
      ..blurRadius = blurRadius
      ..markNeedsPaint();
  }
}
''',
    });

    // Optimización de Render Objects
    await db.insert('detail', {
      'id': 118,
      'subtopic_id': 's03t01l04',
      'module': 'Sr',
      'definition':
          'Optimizar Render Objects es clave para lograr interfaces fluidas, especialmente en listas largas o animaciones complejas.\n\n'
              '**Técnicas avanzadas**:\n'
              '-Uso inteligente de repaint boundaries\n'
              '-Implementación de shouldRepaint y shouldRelayout\n'
              '-Caching de objetos Paint y Path\n'
              '-Minimizar invalidaciones del árbol de renderizado\n\n'
              'Los desarrolladores senior a veces optimizan prematuramente sin antes identificar cuellos de botella reales mediante profiling.',
      'img_url': '',
      'code_example': '''
// Render Object optimizado
class OptimizedRenderBox extends RenderBox {
  final Color color;
  final List<Offset> points;
  Paint? _cachedPaint;
  Path? _cachedPath;
  
  OptimizedRenderBox({
    required this.color,
    required this.points,
  });

  @override
  void performLayout() {
    size = constraints.biggest;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    _cachedPaint ??= Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    
    _cachedPath ??= _buildPath();
    
    context.canvas.drawPath(
      _cachedPath!.shift(offset),
      _cachedPaint!,
    );
  }
  
  Path _buildPath() {
    final path = Path();
    if (points.isEmpty) return path;
    
    path.moveTo(points[0].dx, points[0].dy);
    for (final point in points.skip(1)) {
      path.lineTo(point.dx, point.dy);
    }
    return path;
  }

  @override
  bool shouldRepaint(covariant OptimizedRenderBox oldDelegate) {
    return color != oldDelegate.color || 
           !listEquals(points, oldDelegate.points);
  }

  @override
  bool shouldRelayout(covariant OptimizedRenderBox oldDelegate) => false;
}
''',
    });
  }

  Future<void> _insertDetailsSrTopic2Level4(Database db) async {
    // Introducción a los 3 Árboles
    await db.insert('detail', {
      'id': 119,
      'subtopic_id': 's01t02l04',
      'module': 'Sr',
      'definition':
          'Flutter mantiene tres árboles principales durante la ejecución: Widget tree, Element tree y RenderObject tree, cada uno con responsabilidades específicas.\n\n'
              '**Funciones de cada árbol**:\n'
              '-Widget tree: Describe la configuración de la UI (inmutable)\n'
              '-Element tree: Gestiona el ciclo de vida y referencias (mutable)\n'
              '-RenderObject tree: Maneja layout y rendering (mutable)\n\n'
              'Los desarrolladores senior a veces confunden cuándo se reconstruye cada árbol, lo que puede llevar a optimizaciones incorrectas o bugs sutiles.',
      'img_url': '',
      'code_example': '''
// Ejemplo que muestra la relación entre los árboles
class ThreeTreesExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Este widget forma parte del widget tree
    return Container(
      // Container crea un RenderObject (RenderDecoratedBox)
      color: Colors.blue,
      child: Builder(
        // Builder crea un Element que puede ser referenciado
        builder: (context) {
          // El contexto es el Element
          final renderObject = context.findRenderObject();
         debugPrint('RenderObject: \$renderObject');
          
          return Text('Hello Trees');
        },
      ),
    );
  }
}

// Widget personalizado que muestra la jerarquía
class TreeDebugger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final element = context as Element;
   debugPrint('Element: \$element');
    
    final renderObject = element.renderObject;
   debugPrint('RenderObject: \$renderObject');
    
    return Container();
  }
}
''',
    });

    // Depuración con los 3 Árboles
    await db.insert('detail', {
      'id': 120,
      'subtopic_id': 's02t02l04',
      'module': 'Sr',
      'definition':
          'Entender los tres árboles permite depurar problemas complejos de rendimiento, actualización de UI o comportamiento inesperado de widgets.\n\n'
              '**Técnicas de depuración**:\n'
              '-Uso de debugDumpApp() para inspeccionar el widget tree\n'
              '-debugDumpRenderTree() para el árbol de renderizado\n'
              '-Inspect widget en Flutter DevTools\n'
              '-Seguimiento del lifecycle de los elementos\n\n'
              'Un error común es no aprovechar estas herramientas hasta que surgen problemas graves, en lugar de usarlas proactivamente durante el desarrollo.',
      'img_url': '',
      'code_example': '''
// Ejemplo de depuración con los árboles
void debugTrees() {
  // Imprime el widget tree completo
  debugPrint(WidgetsBinding.instance.renderViewElement?.toStringDeep());
  
  // Imprime el render tree
  debugPrint(WidgetsBinding.instance.renderView?.toStringDeep());
}

class DebuggingExample extends StatefulWidget {
  @override
  _DebuggingExampleState createState() => _DebuggingExampleState();
}

class _DebuggingExampleState extends State<DebuggingExample> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    // Depurar reconstrucciones
    debugPrint('Building with counter: \$_counter');
    
    return Column(
      children: [
        Text('Counter: \$_counter'),
        ElevatedButton(
          onPressed: () {
            setState(() => _counter++);
            // Inspeccionar después de actualizar
            WidgetsBinding.instance.addPostFrameCallback((_) {
              debugPrint('--- After build --'-);
              debugTrees();
            });
          },
          child: Text('Increment'),
        ),
      ],
    );
  }
}
''',
    });

    // Optimización con los 3 Árboles
    await db.insert('detail', {
      'id': 121,
      'subtopic_id': 's03t02l04',
      'module': 'Sr',
      'definition':
          'Optimizar el rendimiento basado en el entendimiento de los tres árboles permite construir interfaces más eficientes con reconstrucciones mínimas.\n\n'
              '**Estrategias clave**:\n'
              '-Minimizar reconstrucciones con const widgets\n'
              '-Uso adecuado de GlobalKey vs ValueKey\n'
              '-Implementación correcta de updateShouldNotify\n'
              '-Estructuración del widget tree para boundaries efectivos\n\n'
              'Los desarrolladores senior a veces optimizan el árbol equivocado (por ejemplo, enfocándose solo en widgets cuando el cuello de botella está en el render tree).',
      'img_url': '',
      'code_example': '''
// Widget optimizado usando const y keys
class OptimizedList extends StatelessWidget {
  final List<String> items;
  
  const OptimizedList({required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        // Usar const para widgets que no cambian
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: OptimizedItem(
            // Key estable para mantener el estado
            key: ValueKey('item_\${items[index]}'),
            item: items[index],
          ),
        );
      },
    );
  }
}

// Widget hoja optimizado
class OptimizedItem extends StatelessWidget {
  final String item;
  
  const OptimizedItem({
    required Key key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Widget simple que no necesita reconstruirse si item no cambia
    return Text(item);
  }
}

// Ejemplo con updateShouldNotify
class CustomInheritedWidget extends InheritedWidget {
  final int data;
  
  CustomInheritedWidget({
    required this.data,
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(CustomInheritedWidget oldWidget) {
    // Solo notificar si data cambió
    return data != oldWidget.data;
  }
}
''',
    });
  }

  Future<void> _insertDetailsSrTopic3Level4(Database db) async {
    // Introducción a la Inmutabilidad
    await db.insert('detail', {
      'id': 122,
      'subtopic_id': 's01t03l04',
      'module': 'Sr',
      'definition':
          'La inmutabilidad en Flutter se refiere a la práctica de crear objetos que no pueden modificarse después de su creación, favoreciendo la creación de nuevas instancias en lugar de la mutación.\n\n'
              '**Beneficios clave**:\n'
              '-Predictibilidad del estado\n'
              '-Facilita la comparación de objetos\n'
              '-Hace el código más seguro para hilos\n'
              '-Simplifica el debugging\n\n'
              'Los desarrolladores senior a veces resisten la inmutabilidad por el supuesto overhead de performance, sin considerar las optimizaciones del framework y los beneficios a largo plazo.',
      'img_url': '',
      'code_example': '''
// Ejemplo de clase inmutable
class ImmutableUser {
  final String id;
  final String name;
  final List<String> roles;
  
  const ImmutableUser({
    required this.id,
    required this.name,
    required this.roles,
  });
  
  // Método copyWith para "modificaciones"
  ImmutableUser copyWith({
    String? id,
    String? name,
    List<String>? roles,
  }) {
    return ImmutableUser(
      id: id ?? this.id,
      name: name ?? this.name,
      roles: roles ?? this.roles,
    );
  }
  
  // Sobreescribir == y hashCode para comparación
  @override
  bool operator ==(Object other) {
    return identical(this, other) || 
      (other is ImmutableUser &&
        runtimeType == other.runtimeType &&
        id == other.id &&
        name == other.name &&
        listEquals(roles, other.roles));
  }
  
  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ roles.hashCode;
}

// Uso
final user1 = ImmutableUser(
  id: '1',
  name: 'Alice',
  roles: ['admin'],
);

final user2 = user1.copyWith(name: 'Alice Smith');
''',
    });

    // Mejorar Rendimiento con Inmutabilidad
    await db.insert('detail', {
      'id': 123,
      'subtopic_id': 's02t03l04',
      'module': 'Sr',
      'definition':
          'La inmutabilidad puede mejorar el rendimiento en Flutter al permitir comparaciones rápidas de objetos y minimizar reconstrucciones innecesarias.\n\n'
              '**Patrones de optimización**:\n'
              '-Uso de const constructors para widgets\n'
              '-Implementación eficiente de == y hashCode\n'
              '-Estructuras de datos persistentes para colecciones\n'
              '-Memoización de cálculos costosos\n\n'
              'Un error común es implementar == y hashCode de manera ineficiente o incorrecta, lo que anula los beneficios de la inmutabilidad.',
      'img_url': '',
      'code_example': '''
// Widget optimizado con const
class OptimizedWidget extends StatelessWidget {
  final String title;
  final int count;
  
  const OptimizedWidget({
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Widgets const cuando sea posible
          const Divider(),
          Text('\$title: \$count'),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

// Ejemplo con memoización
class ExpensiveCalculation {
  final ImmutableUser user;
  final List<int> data;
  
  // Cache para resultados
  static final _cache = <ExpensiveCalculation, String>{};
  
  ExpensiveCalculation(this.user, this.data);
  
  String get result {
    return _cache.putIfAbsent(this, () => _calculate());
  }
  
  String _calculate() {
    // Cálculo costoso basado en user y data
    return 'Result for \${user.name}';
  }
  
  @override
  bool operator ==(Object other) {
    return identical(this, other) || 
      (other is ExpensiveCalculation &&
        user == other.user &&
        listEquals(data, other.data));
  }
  
  @override
  int get hashCode => user.hashCode ^ data.hashCode;
}
''',
    });

    // Comparación Inmutabilidad vs Mutabilidad
    await db.insert('detail', {
      'id': 124,
      'subtopic_id': 's03t03l04',
      'module': 'Sr',
      'definition':
          'La elección entre inmutabilidad y mutabilidad depende del contexto, y un desarrollador senior debe saber cuándo cada enfoque es apropiado.\n\n'
              '**Cuándo usar inmutabilidad**:\n'
              '-Modelos de datos en gestión de estado\n'
              '-Props de widgets\n'
              '-Configuraciones que no cambian\n\n'
              '**Cuándo considerar mutabilidad**:\n'
              '-Objetos de larga vida con cambios frecuentes\n'
              '-Estructuras de datos muy grandes\n'
              '-Código performance-critical\n\n'
              'Los desarrolladores senior a veces adoptan dogmáticamente uno u otro enfoque sin considerar los trade-offs específicos de cada situación.',
      'img_url': '',
      'code_example': '''
// Ejemplo híbrido: estructura mutable con interfaz inmutable
class MutableButEncapsulated {
  List<int> _items = [];
  
  List<int> get items => List.unmodifiable(_items);
  
  void addItem(int item) {
    _items.add(item);
    _cleanup();
  }
  
  void _cleanup() {
    // Operación interna que muta el estado
    _items.removeWhere((item) => item < 0);
  }
}

// Uso en Flutter con Riverpod
final hybridProvider = StateNotifierProvider<HybridNotifier, HybridState>((ref) {
  return HybridNotifier();
});

class HybridNotifier extends StateNotifier<HybridState> {
  HybridNotifier() : super(HybridState.initial());
  
  void update() {
    // Mutación interna para performance
    final data = state.data.toList();
    data.add(DateTime.now().millisecondsSinceEpoch);
    
    // Nueva instancia para el estado
    state = state.copyWith(
      data: data,
      updatedAt: DateTime.now(),
    );
  }
}

@immutable
class HybridState {
  final List<int> data;
  final DateTime updatedAt;
  
  const HybridState({
    required this.data,
    required this.updatedAt,
  });
  
  factory HybridState.initial() {
    return HybridState(
      data: const [],
      updatedAt: DateTime.now(),
    );
  }
  
  HybridState copyWith({
    List<int>? data,
    DateTime? updatedAt,
  }) {
    return HybridState(
      data: data ?? this.data,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
''',
    });
  }

  Future<void> insertDetailsSrLevel5(Database db) async {
    try {
      await _insertDetailsSrTopic1Level5(db);
    } catch (e) {
      debugPrint("Error inserting details sr level 5: $e");
    }
  }

  Future<void> _insertDetailsSrTopic1Level5(Database db) async {
    // Introducción a CI/CD Avanzado
    await db.insert('detail', {
      'id': 125,
      'subtopic_id': 's01t01l05',
      'module': 'Sr',
      'definition':
          'CI/CD avanzado para Flutter implica pipelines sofisticados que automatizan no solo la construcción y despliegue, sino también pruebas, análisis de código, gestión de versiones y monitoreo.\n\n'
              '**Componentes clave**:\n'
              '-Build matrices para múltiples plataformas\n'
              '-Pruebas instrumentadas en emuladores\n'
              '-Análisis estático y dinámico\n'
              '-Despliegues progresivos (canary, staged)\n'
              '-Rollbacks automáticos\n\n'
              'Los desarrolladores senior a veces subestiman la importancia de un CI/CD robusto hasta que enfrentan problemas en producción que podrían haberse detectado antes.',
      'img_url': '',
      'code_example': '''
# Ejemplo de configuración de GitHub Actions para Flutter
name: Flutter CI

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        flutter: ['3.13.0']
        platform: [android, ios, web]
    
    steps:
      - uses: actions/checkout@v2
      
      - name: Set up Flutter
        uses: subosito/flutter-action@v2
        with:
          flutter-version: \${{ matrix.flutter }}
          
      - name: Analyze code
        run: flutter analyze
          
      - name: Run tests
        run: flutter test --coverage
          
      - name: Build APK
        if: matrix.platform == 'android'
        run: flutter build apk --release
          
      - name: Build IPA
        if: matrix.platform == 'ios'
        run: |
          flutter build ios --release --no-codesign
          cd ios
          xcodebuild -workspace Runner.xcworkspace -scheme Runner -sdk iphoneos -configuration Release archive -archivePath PWD/build/Runner.xcarchive
          
      - name: Build Web
        if: matrix.platform == 'web'
        run: flutter build web --release
          
      - name: Upload artifacts
        uses: actions/upload-artifact@v2
        with:
          name: build-\${{ matrix.platform }}
          path: |
            build/app/outputs/flutter-apk/app-release.apk
            build/ios/archive/Runner.xcarchive
            build/web
''',
    });

    // Protocolos Avanzados para Automatización
    await db.insert('detail', {
      'id': 126,
      'subtopic_id': 's02t01l05',
      'module': 'Sr',
      'definition':
          'Los protocolos avanzados de automatización incluyen estrategias como feature flags, despliegues progresivos, A/B testing y monitoreo activo que permiten lanzamientos más seguros y controlados.\n\n'
              '**Técnicas avanzadas**:\n'
              '-Feature toggles para activación gradual\n'
              '-Canary releases a porcentajes de usuarios\n'
              '-Dark launches para probar infraestructura\n'
              '-Circuit breakers para fallas en producción\n'
              '-Blue-green deployments para migración sin downtime\n\n'
              'Un error común es implementar estos protocolos sin la instrumentación adecuada para medir su impacto, convirtiéndolos en soluciones ciegas.',
      'img_url': '',
      'code_example': '''
// Ejemplo de feature flags con Firebase Remote Config
class FeatureFlags {
  static final _remoteConfig = FirebaseRemoteConfig.instance;
  
  static Future<void> init() async {
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: Duration(seconds: 10),
      minimumFetchInterval: Duration(hours: 1),
    ));
    
    await _remoteConfig.fetchAndActivate();
  }
  
  static bool get isNewCheckoutEnabled {
    return _remoteConfig.getBool('new_checkout_enabled');
  }
  
  static double get newCheckoutRolloutPercent {
    return _remoteConfig.getDouble('new_checkout_rollout');
  }
  
  static bool shouldShowNewCheckoutForUser(String userId) {
    if (!isNewCheckoutEnabled) return false;
    
    // Canary release basado en hash del userId
    final userHash = _hashUserId(userId);
    return userHash <= newCheckoutRolloutPercent;
  }
  
  static double _hashUserId(String userId) {
    // Hash consistente para asignación canary
    return (userId.hashCode % 100).abs() / 100;
  }
}

// Uso en la app
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FeatureFlags.init();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userId = AuthService.currentUserId;
    
    return MaterialApp(
      home: FeatureFlags.shouldShowNewCheckoutForUser(userId)
        ? NewCheckoutScreen()
        : OldCheckoutScreen(),
    );
  }
}
''',
    });

    // Optimización de Pipelines
    await db.insert('detail', {
      'id': 127,
      'subtopic_id': 's03t01l05',
      'module': 'Sr',
      'definition':
          'Optimizar pipelines de CI/CD reduce tiempos de feedback, costos de ejecución y mejora la confiabilidad del proceso de entrega.\n\n'
              '**Estrategias de optimización**:\n'
              '-Caching de dependencias y builds\n'
              '-Ejecución paralela de jobs independientes\n'
              '-Pruebas sharding para distribución balanceada\n'
              '-Builds incrementales cuando sea posible\n'
              '-Uso de máquinas más potentes para pasos críticos\n\n'
              'Los desarrolladores senior a veces optimizan el pipeline prematuramente sin identificar primero los cuellos de botella reales mediante métricas.',
      'img_url': '',
      'code_example': '''
# Pipeline optimizado con caching y paralelismo
name: Optimized Flutter CI

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

env:
  FLUTTER_VERSION: '3.13.0'

jobs:
  setup:
    runs-on: ubuntu-latest
    outputs:
      flutter_version: \${{ env.FLUTTER_VERSION }}
    steps:
      - uses: actions/checkout@v2
      - uses: actions/cache@v2
        id: flutter-cache
        with:
          path: /opt/hostedtoolcache/flutter
          key: flutter-\${{ env.FLUTTER_VERSION }}
          
  analyze:
    needs: setup
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: subosito/flutter-action@v2
        with:
          flutter-version: \${{ needs.setup.outputs.flutter_version }}
          cache: true
      - run: flutter analyze
          
  test:
    needs: setup
    runs-on: ubuntu-latest
    strategy:
      matrix:
        shard: [1, 2, 3, 4]
    steps:
      - uses: actions/checkout@v2
      - uses: subosito/flutter-action@v2
        with:
          flutter-version: \${{ needs.setup.outputs.flutter_version }}
          cache: true
      - run: flutter test --total-shards 4 --shard-index \${{ matrix.shard }}
          
  build-android:
    needs: [analyze, test]
    runs-on: macos-latest
    steps:
      - uses: actions/checkout@v2
      - uses: subosito/flutter-action@v2
        with:
          flutter-version: \${{ needs.setup.outputs.flutter_version }}
          cache: true
      - run: flutter build apk --release --split-per-abi
      - uses: actions/upload-artifact@v2
        with:
          name: android-build
          path: build/app/outputs/flutter-apk/*.apk
          
  build-ios:
    needs: [analyze, test]
    runs-on: macos-latest
    steps:
      - uses: actions/checkout@v2
      - uses: subosito/flutter-action@v2
        with:
          flutter-version: \${{ needs.setup.outputs.flutter_version }}
          cache: true
      - run: flutter build ios --release --no-codesign
      - run: cd ios && xcodebuild -workspace Runner.xcworkspace -scheme Runner -sdk iphoneos -configuration Release archive -archivePath PWD/build/Runner.xcarchive
      - uses: actions/upload-artifact@v2
        with:
          name: ios-build
          path: ios/build/Runner.xcarchive
''',
    });
  }

  Future<void> insertDetailsSrLevel6(Database db) async {
    try {
      await _insertDetailsSrTopic1Level6(db);
      await _insertDetailsSrTopic2Level6(db);
      await _insertDetailsSrTopic3Level6(db);
      await _insertDetailsSrTopic4Level6(db);
    } catch (e) {
      debugPrint("Error inserting details sr level 6: $e");
    }
  }

  Future<void> _insertDetailsSrTopic1Level6(db) async {
    // Introducción a Segment
    await db.insert('detail', {
      'id': 128,
      'subtopic_id': 's01t01l06',
      'module': 'Sr',
      'definition':
          'Segment es una plataforma de gestión de datos de clientes (CDP) que actúa como capa intermedia entre tus aplicaciones y tus herramientas de analytics, marketing y data warehouses.\n\n'
              '**Ventajas clave**:\n'
              '-Single API para múltiples destinos\n'
              '-Elimina la necesidad de integrar cada herramienta por separado\n'
              '-Permite cambiar herramientas sin modificar el código\n'
              '-Ofrece transformación y enrutamiento de datos\n\n'
              'Los desarrolladores senior a veces no aprovechan completamente las capacidades de Segment, usándolo solo como un proxy sin implementar su lógica de transformación y filtrado.',
      'img_url': '',
      'code_example': '''
// Configuración básica de Segment en Flutter
await analytics.configure(
  SegmentConfig(
    writeKey: 'YOUR_WRITE_KEY',
    trackApplicationLifecycleEvents: true,
    debug: kDebugMode,
  ),
);

// Identificación de usuario
await analytics.identify(
  userId: 'user123',
  traits: {
    'name': 'John Doe',
    'email': 'john@example.com',
    'plan': 'premium',
    'signupDate': DateTime.now().toIso8601String(),
  },
);

// Trackeo de evento
await analytics.track(
  eventName: 'Product Viewed',
  properties: {
    'productId': '123',
    'category': 'Electronics',
    'price': 99.99,
  },
);

// Screen tracking
await analytics.screen(
  screenName: 'ProductScreen',
  properties: {
    'productId': '123',
  },
);
''',
    });

    // Seguimiento de Eventos con Segment
    await db.insert('detail', {
      'id': 129,
      'subtopic_id': 's02t01l06',
      'module': 'Sr',
      'definition':
          'El seguimiento de eventos con Segment debe ser consistente, significativo y diseñado para responder preguntas de negocio específicas.\n\n'
              '**Mejores prácticas**:\n'
              '-Establecer un schema de eventos claro\n'
              '-Usar nombres de eventos descriptivos y consistentes\n'
              '-Incluir metadata relevante pero no excesiva\n'
              '-Implementar eventos funnel para flujos clave\n'
              '-Validar datos antes del envío\n\n'
              'Un error común es implementar tracking sin un plan claro, resultando en datos inconsistentes o difíciles de analizar.',
      'img_url': '',
      'code_example': '''
// Ejemplo de tracking estructurado con Segment
class AnalyticsService {
  final Analytics _analytics;
  
  AnalyticsService(this._analytics);
  
  // Eventos de negocio bien definidos
  Future<void> trackProductView(String productId, String category, double price) async {
    await _analytics.track(
      eventName: 'Product Viewed',
      properties: {
        'product_id': productId,
        'category': category,
        'price': price,
        'currency': 'USD',
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }
  
  Future<void> trackCheckoutStarted(List<CartItem> items) async {
    await _analytics.track(
      eventName: 'Checkout Started',
      properties: {
        'cart_size': items.length,
        'total_value': items.fold(0.0, (sum, item) => sum + item.price),
        'items': items.map((item) => item.toAnalyticsJson()).toList(),
        'user_type': await _getUserType(),
      },
    );
  }
  
  Future<void> trackPurchase(Order order) async {
    await _analytics.track(
      eventName: 'Order Completed',
      properties: order.toAnalyticsJson(),
    );
  }
  
  Future<String> _getUserType() async {
    // Lógica para determinar tipo de usuario
    return 'returning';
  }
}

// Uso en la aplicación
final analytics = AnalyticsService(SegmentAnalytics());
await analytics.trackProductView('123', 'Electronics', 99.99);
''',
    });

    // Integración en Flutter
    await db.insert('detail', {
      'id': 130,
      'subtopic_id': 's03t01l06',
      'module': 'Sr',
      'definition':
          'Integrar Segment en Flutter requiere considerar arquitectura, rendimiento y privacidad, especialmente para aplicaciones a gran escala.\n\n'
              '**Consideraciones avanzadas**:\n'
              '-Inyección de dependencias para el cliente de analytics\n'
              '-Middleware para enriquecer eventos\n'
              '-Muestreo para alta volumetría\n'
              '-Validación de schemas de eventos\n'
              '-Control de privacidad y opt-out\n\n'
              'Los desarrolladores senior a veces no implementan mecanismos para manejar offline-first o eventos fallidos, lo que puede llevar a pérdida de datos valiosos.',
      'img_url': '',
      'code_example': '''
// Implementación avanzada con Riverpod y offline support
final analyticsProvider = Provider<AnalyticsService>((ref) {
  final analytics = SegmentAnalytics();
  final storage = ref.watch(storageProvider);
  return AnalyticsService(analytics, storage);
});

class AnalyticsService {
  final Analytics _analytics;
  final AnalyticsStorage _storage;
  final _queue = Queue<AnalyticsEvent>();
  bool _isOnline = true;
  
  AnalyticsService(this._analytics, this._storage) {
    _loadPendingEvents();
    _setupConnectivityListener();
  }
  
  Future<void> track(AnalyticsEvent event) async {
    if (_isOnline) {
      try {
        await _sendEvent(event);
      } catch (e) {
        await _storeEvent(event);
      }
    } else {
      await _storeEvent(event);
    }
  }
  
  Future<void> _sendEvent(AnalyticsEvent event) async {
    switch (event.type) {
      case EventType.track:
        await _analytics.track(
          eventName: event.name,
          properties: event.properties,
        );
        break;
      case EventType.screen:
        await _analytics.screen(
          screenName: event.name,
          properties: event.properties,
        );
        break;
      case EventType.identify:
        await _analytics.identify(
          userId: event.userId,
          traits: event.properties,
        );
        break;
    }
  }
  
  Future<void> _storeEvent(AnalyticsEvent event) async {
    _queue.add(event);
    await _storage.saveEvents(_queue.toList());
  }
  
  Future<void> _loadPendingEvents() async {
    final events = await _storage.getPendingEvents();
    if (events.isNotEmpty && _isOnline) {
      for (final event in events) {
        await _sendEvent(event);
      }
      await _storage.clearEvents();
    }
  }
  
  void _setupConnectivityListener() {
    Connectivity().onConnectivityChanged.listen((status) {
      _isOnline = status != ConnectivityResult.none;
      if (_isOnline) _loadPendingEvents();
    });
  }
}

// Uso con Riverpod
class ProductScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analytics = ref.read(analyticsProvider);
    
    useEffect(() {
      analytics.track(AnalyticsEvent.screen('ProductScreen'));
      return null;
    }, []);
    
    return Scaffold(
      body: ...,
    );
  }
}
''',
    });
  }

  Future<void> _insertDetailsSrTopic2Level6(db) async {
    // Introducción a MixPanel
    await db.insert('detail', {
      'id': 131,
      'subtopic_id': 's01t02l06',
      'module': 'Sr',
      'definition':
          'MixPanel es una plataforma de analytics enfocada en el análisis de comportamiento de usuarios, permitiendo crear cohorts, funnels y análisis de retención.\n\n'
              '**Fortalezas clave**:\n'
              '-Análisis de retención y engagement\n'
              '-Funnels para conversión de usuarios\n'
              '-Cohorts basados en comportamiento\n'
              '-A/B testing integrado\n'
              '-Capacidades de data science\n\n'
              'Los desarrolladores senior a veces no configuran adecuadamente las propiedades de usuario que permiten segmentación avanzada, limitando el potencial analítico.',
      'img_url': '',
      'code_example': '''
// Configuración básica de MixPanel en Flutter
final mixpanel = await Mixpanel.init('YOUR_PROJECT_TOKEN',
  optOutTrackingDefault: false,
  trackAutomaticEvents: true,
);

// Identificación de usuario
mixpanel.identify('USER_ID');
mixpanel.getPeople().set({
  '\$first_name': 'John',
  '\$last_name': 'Doe',
  '\$email': 'john@example.com',
  'Plan': 'Premium',
  'Signup Date': DateTime.now(),
});

// Trackeo de evento
mixpanel.track('Product Viewed', {
  'Product ID': '123',
  'Category': 'Electronics',
  'Price': 99.99,
});

// Eventos con timing
final stopwatch = Stopwatch()..start();
// ... acción a medir ...
mixpanel.trackWithTime('Task Completed', stopwatch.elapsedMilliseconds, {
  'Task Type': 'Import',
  'Items Processed': 42,
});
''',
    });

    // Análisis de Usuarios con MixPanel
    await db.insert('detail', {
      'id': 132,
      'subtopic_id': 's02t02l06',
      'module': 'Sr',
      'definition':
          'MixPanel brinda herramientas poderosas para analizar el comportamiento de usuarios a lo largo del tiempo, identificando patrones y oportunidades de mejora.\n\n'
              '**Técnicas avanzadas**:\n'
              '-Creación de cohorts basados en acciones\n'
              '-Análisis de retención por características\n'
              '-Funnels para identificar cuellos de botella\n'
              '-Flujos de usuario entre eventos\n'
              '-Impact analysis para cambios de features\n\n'
              'Un error común es no definir eventos clave (key events) que midan el éxito real del producto, enfocándose solo en métricas superficiales.',
      'img_url': '',
      'code_example': '''
// Implementación para análisis avanzado
class MixPanelAnalytics {
  final Mixpanel _mixpanel;
  
  MixPanelAnalytics(this._mixpanel);
  
  Future<void> trackSignup(String source) async {
    await _mixpanel.track('Signup Completed', {
      'Signup Source': source,
      'Device Type': Platform.isIOS ? 'iOS' : 'Android',
    });
    
    await _mixpanel.getPeople().setOnce({
      'Signup Date': DateTime.now(),
      'Initial Source': source,
    });
    
    await _mixpanel.getPeople().increment('Signup Count', 1);
  }
  
  Future<void> trackSubscription(String plan) async {
    await _mixpanel.track('Subscription Started', {
      'Plan': plan,
      'Billing Cycle': 'Monthly',
    });
    
    await _mixpanel.getPeople().set({
      'Current Plan': plan,
      'Last Subscription Date': DateTime.now(),
      'Is Paid User': true,
    });
    
    // Para funnels de conversión
    await _mixpanel.timeEvent('Subscription Funnel');
  }
  
  Future<void> trackFeatureUsage(String feature, Duration duration) async {
    await _mixpanel.track('Feature Used', {
      'Feature Name': feature,
      'Usage Duration (ms)': duration.inMilliseconds,
    });
    
    await _mixpanel.getPeople().append('Features Used', feature);
    
    // Para análisis de retención
    await _mixpanel.getPeople().set({
      'Last Used Feature': feature,
      'Last Active Date': DateTime.now(),
    });
  }
  
  Future<void> trackRevenue(double amount, String product) async {
    await _mixpanel.track('Revenue', {
      'Amount': amount,
      'Product': product,
    });
    
    await _mixpanel.getPeople().trackCharge(amount, {
      'Product': product,
    });
  }
}
''',
    });

    // Integración en Flutter
    await db.insert('detail', {
      'id': 133,
      'subtopic_id': 's03t02l06',
      'module': 'Sr',
      'definition':
          'Integrar MixPanel en Flutter de manera efectiva requiere una arquitectura que permita capturar eventos de manera consistente sin impactar el rendimiento.\n\n'
              '**Patrones recomendados**:\n'
              '-Service layer para centralizar lógica de tracking\n'
              '-Auto-tracking de screens y eventos comunes\n'
              '-Middleware para enriquecer eventos\n'
              '-Mecanismos de batching para reducir llamadas\n'
              '-Control de privacidad y data sampling\n\n'
              'Los desarrolladores senior a veces no consideran el impacto en batería y datos móviles que puede tener un tracking demasiado agresivo.',
      'img_url': '',
      'code_example': '''
// Arquitectura avanzada con Riverpod y MixPanel
final mixpanelProvider = Provider<MixPanelService>((ref) {
  final mixpanel = Mixpanel.init('YOUR_TOKEN');
  final storage = ref.watch(storageProvider);
  return MixPanelService(mixpanel, storage);
});

class MixPanelService {
  final Mixpanel _mixpanel;
  final AnalyticsStorage _storage;
  final _maxBatchSize = 10;
  final _batchQueue = <Map<String, dynamic>>[];
  
  MixPanelService(this._mixpanel, this._storage);
  
  Future<void> trackEvent(String name, [Map<String, dynamic>? props]) async {
    final event = {
      'event': name,
      'properties': {
        ...?props,
        'timestamp': DateTime.now().toIso8601String(),
        'os': Platform.operatingSystem,
        'os_version': Platform.operatingSystemVersion,
      },
    };
    
    _batchQueue.add(event);
    
    if (_batchQueue.length >= _maxBatchSize) {
      await _flushBatch();
    }
  }
  
  Future<void> _flushBatch() async {
    if (_batchQueue.isEmpty) return;
    
    try {
      // MixPanel no soporta batching nativo, pero podríamos implementar nuestro propio endpoint
      await _sendToBackend(_batchQueue);
      _batchQueue.clear();
    } catch (e) {
      await _storage.saveEvents(_batchQueue);
    }
  }
  
  Future<void> _sendToBackend(List<Map<String, dynamic>> events) async {
    // Implementación de envío por lotes
  }
  
  Future<void> identifyUser(String userId, Map<String, dynamic> traits) async {
    await _mixpanel.identify(userId);
    await _mixpanel.getPeople().set(traits);
  }
  
  Future<void> trackScreen(String name) async {
    await trackEvent('Screen View', {'screen_name': name});
  }
  
  @override
  Future<void> dispose() async {
    await _flushBatch();
  }
}

// Middleware para auto-tracking
class AnalyticsObserver extends NavigatorObserver {
  final MixPanelService _analytics;
  
  AnalyticsObserver(this._analytics);
  
  @override
  void didPush(Route route, Route? previousRoute) {
    _trackScreen(route);
  }
  
  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    if (newRoute != null) _trackScreen(newRoute);
  }
  
  void _trackScreen(Route route) {
    final name = route.settings.name;
    if (name != null) {
      _analytics.trackScreen(name);
    }
  }
}

// Uso en la app
void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        navigatorObservers: [
          AnalyticsObserver(ProviderScope.containerOf(context).read(mixpanelProvider)),
        ],
        home: MyApp(),
      ),
    ),
  );
}
''',
    });
  }

  Future<void> _insertDetailsSrTopic3Level6(db) async {
    // Introducción a Firebase Analytics
    await db.insert('detail', {
      'id': 134,
      'subtopic_id': 's01t03l06',
      'module': 'Sr',
      'definition':
          'Firebase Analytics es la solución de Google para el análisis de aplicaciones móviles, integrada con el ecosistema Firebase y Google BigQuery.\n\n'
              '**Características principales**:\n'
              '-Eventos automáticos y personalizados\n'
              '-Audiencias basadas en comportamiento\n'
              '-Integración con otras herramientas Firebase\n'
              '-Exportación a BigQuery para análisis avanzado\n'
              '-Atribución de conversión\n\n'
              'Los desarrolladores senior a veces no aprovechan las capacidades de exportación a BigQuery, limitándose a los informes predefinidos.',
      'img_url': '',
      'code_example': '''
// Configuración básica de Firebase Analytics
await Firebase.initializeApp();
final analytics = FirebaseAnalytics.instance;

// Habilitar/deshabilitar colección
await analytics.setAnalyticsCollectionEnabled(true);

// Configurar propiedades de usuario
await analytics.setUserId(id: 'USER_ID');
await analytics.setUserProperty(name: 'favorite_category', value: 'sports');

// Trackear evento
await analytics.logEvent(
  name: 'select_content',
  parameters: {
    'content_type': 'product',
    'content_id': '123',
    'currency': 'USD',
    'value': 9.99,
  },
);

// Trackear screen view
await analytics.logScreenView(
  screenClass: 'ProductScreen',
  screenName: 'product_view',
);
''',
    });

    // Seguimiento de Eventos con Firebase Analytics
    await db.insert('detail', {
      'id': 135,
      'subtopic_id': 's02t03l06',
      'module': 'Sr',
      'definition':
          'Firebase Analytics permite un seguimiento detallado de eventos personalizados, pero requiere un diseño cuidadoso para obtener insights accionables.\n\n'
              '**Mejores prácticas**:\n'
              '-Usar eventos recomendados cuando sea posible\n'
              '-Definir parámetros consistentes\n'
              '-Limitar el número de eventos únicos\n'
              '-Agrupar eventos similares con parámetros\n'
              '-Documentar el schema de eventos\n\n'
              'Un error común es crear demasiados eventos únicos en lugar de usar parámetros para categorizar, lo que dificulta el análisis posterior.',
      'img_url': '',
      'code_example': '''
// Implementación estructurada de eventos
class FirebaseAnalyticsService {
  final FirebaseAnalytics _analytics;
  
  FirebaseAnalyticsService(this._analytics);
  
  Future<void> logProductView(String productId, String category, double price) async {
    await _analytics.logEvent(
      name: 'view_item',
      parameters: {
        'item_id': productId,
        'item_category': category,
        'price': price,
        'currency': 'USD',
      },
    );
  }
  
  Future<void> logAddToCart(String productId, int quantity) async {
    await _analytics.logEvent(
      name: 'add_to_cart',
      parameters: {
        'item_id': productId,
        'quantity': quantity,
      },
    );
  }
  
  Future<void> logCheckout(List<CartItem> items) async {
    await _analytics.logEvent(
      name: 'begin_checkout',
      parameters: {
        'items': items.length,
        'value': items.fold(0.0, (sum, item) => sum + item.price),
        'currency': 'USD',
      },
    );
  }
  
  Future<void> logPurchase(Order order) async {
    await _analytics.logEvent(
      name: 'purchase',
      parameters: {
        'transaction_id': order.id,
        'value': order.total,
        'currency': 'USD',
        'items': order.items.length,
        'coupon': order.coupon,
      },
    );
    
    // Evento de conversión para Ads
    await _analytics.logPurchase(
      currency: 'USD',
      value: order.total,
      items: order.items.map((item) => AnalyticsEventItem(
        itemName: item.name,
        itemId: item.id,
        itemCategory: item.category,
        price: item.price,
      )).toList(),
    );
  }
  
  Future<void> setUserProperties(User user) async {
    await _analytics.setUserId(id: user.id);
    await _analytics.setUserProperty(
      name: 'subscription_status',
      value: user.subscriptionStatus,
    );
    await _analytics.setUserProperty(
      name: 'signup_method',
      value: user.signupMethod,
    );
  }
}
''',
    });

    // Personalización de Eventos
    await db.insert('detail', {
      'id': 136,
      'subtopic_id': 's03t03l06',
      'module': 'Sr',
      'definition':
          'Personalizar eventos en Firebase Analytics permite adaptar la solución a las necesidades específicas de tu aplicación y modelo de negocio.\n\n'
              '**Técnicas avanzadas**:\n'
              '-Definir parámetros personalizados\n'
              '-Implementar eventos funnel para flujos clave\n'
              '-Usar parámetros de evento como dimensiones\n'
              '-Crear audiencias basadas en comportamiento\n'
              '-Exportar a BigQuery para SQL personalizado\n\n'
              'Los desarrolladores senior a veces no configuran los parámetros de evento como dimensiones personalizadas en la consola de Firebase, limitando su capacidad de filtrado.',
      'img_url': '',
      'code_example': '''
// Ejemplo avanzado con eventos personalizados
class CustomAnalyticsEvents {
  final FirebaseAnalytics _analytics;
  
  CustomAnalyticsEvents(this._analytics);
  
  Future<void> trackFeatureExperiment(
    String featureName,
    String variant,
    bool isFirstExposure,
  ) async {
    await _analytics.logEvent(
      name: 'feature_experiment',
      parameters: {
        'feature_name': featureName,
        'variant': variant,
        'first_exposure': isFirstExposure,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      },
    );
  }
  
  Future<void> trackPerformanceMetric(
    String metricName,
    double value,
    String unit,
    Map<String, dynamic>? context,
  ) async {
    await _analytics.logEvent(
      name: 'performance_metric',
      parameters: {
        'metric': metricName,
        'value': value,
        'unit': unit,
        ...?context,
      },
    );
  }
  
  Future<void> trackError(
    String errorCode,
    String errorMessage,
    String screen,
    String? feature,
  ) async {
    await _analytics.logEvent(
      name: 'error_occurred',
      parameters: {
        'error_code': errorCode,
        'message': errorMessage,
        'screen': screen,
        'feature': feature,
        'os': Platform.operatingSystem,
        'os_version': Platform.operatingSystemVersion,
        'app_version': await _getAppVersion(),
      },
    );
  }
  
  Future<void> trackUserEngagement(
    String engagementType,
    Duration duration,
    String? contentId,
  ) async {
    await _analytics.logEvent(
      name: 'user_engagement',
      parameters: {
        'type': engagementType,
        'duration_seconds': duration.inSeconds,
        'content_id': contentId,
      },
    );
  }
  
  Future<String> _getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return '\${packageInfo.version} (\${packageInfo.buildNumber})';
  }
}

// Uso con parámetros personalizados
final analytics = CustomAnalyticsEvents(FirebaseAnalytics.instance);
await analytics.trackFeatureExperiment('new_checkout', 'variant_b', true);
await analytics.trackPerformanceMetric(
  'screen_load',
  450,
  'ms',
  {'screen_name': 'ProductDetail'},
);
''',
    });
  }

  Future<void> _insertDetailsSrTopic4Level6(db) async {
    // Introducción a Google Analytics
    await db.insert('detail', {
      'id': 137,
      'subtopic_id': 's01t04l06',
      'module': 'Sr',
      'definition':
          'Google Analytics para aplicaciones móviles (GA4) es la evolución de Universal Analytics, ofreciendo un modelo de eventos más flexible y análisis entre plataformas.\n\n'
              '**Características principales**:\n'
              '-Modelo basado en eventos\n'
              '-Análisis entre app y web\n'
              '-Audiencias integradas con Google Ads\n'
              '-Machine learning integrado\n'
              '-Custom funnels y paths\n\n'
              'Los desarrolladores senior a veces no configuran correctamente el data stream entre Firebase Analytics y Google Analytics, perdiendo capacidades de análisis cruzado.',
      'img_url': '',
      'code_example': '''
// Configuración para GA4 (normalmente a través de Firebase)
await Firebase.initializeApp();
final analytics = FirebaseAnalytics.instance;

// Habilitar Google Analytics
await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);

// Configuración de propiedades
await analytics.setUserId(id: 'USER_ID');
await analytics.setUserProperty(name: 'user_level', value: 'premium');

// Eventos estándar
await analytics.logAppOpen();
await analytics.logLogin(method: 'google');

// Evento personalizado
await analytics.logEvent(
  name: 'achievement_unlocked',
  parameters: {
    'achievement_id': 'high_score',
    'value': 1000,
  },
);

// Screen view
await analytics.setCurrentScreen(
  screenName: 'ProductScreen',
  screenClassOverride: 'ProductScreen',
);
''',
    });

    // Análisis de Usuarios con Google Analytics
    await db.insert('detail', {
      'id': 138,
      'subtopic_id': 's02t04l06',
      'module': 'Sr',
      'definition':
          'Google Analytics proporciona herramientas poderosas para analizar el comportamiento de los usuarios, incluyendo retención, engagement y conversión.\n\n'
              '**Técnicas avanzadas**:\n'
              '-Creación de audiencias complejas\n'
              '-Análisis de cohortes\n'
              '-Funnels personalizados\n'
              '-Análisis de paths\n'
              '-Integración con BigQuery\n\n'
              'Un error común es no alinear los eventos de la app con los informes y dashboards en GA4, resultando en datos difíciles de interpretar.',
      'img_url': '',
      'code_example': '''
// Implementación para análisis avanzado
class GoogleAnalyticsService {
  final FirebaseAnalytics _analytics;
  
  GoogleAnalyticsService(this._analytics);
  
  Future<void> trackUserJourney(String step, [int? stepNumber]) async {
    await _analytics.logEvent(
      name: 'user_journey',
      parameters: {
        'step': step,
        if (stepNumber != null) 'step_number': stepNumber,
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }
  
  Future<void> trackContentEngagement(
    String contentType,
    String contentId,
    Duration duration,
  ) async {
    await _analytics.logEvent(
      name: 'content_engagement',
      parameters: {
        'content_type': contentType,
        'content_id': contentId,
        'engagement_time': duration.inSeconds,
      },
    );
  }
  
  Future<void> setUserSegment(String segment) async {
    await _analytics.setUserProperty(
      name: 'user_segment',
      value: segment,
    );
  }
  
  Future<void> trackConversion(String goalName, double value) async {
    await _analytics.logEvent(
      name: 'conversion',
      parameters: {
        'goal': goalName,
        'value': value,
        'currency': 'USD',
      },
    );
  }
  
  Future<void> trackException(String error, bool fatal) async {
    await _analytics.logEvent(
      name: 'exception',
      parameters: {
        'description': error,
        'fatal': fatal,
        'stack_trace': StackTrace.current.toString(),
      },
    );
  }
}

// Configuración de eventos en la consola de GA4
// 1. Crear evento personalizado 'user_journey'
// 2. Definir parámetros 'step' y 'step_number' como dimensiones personalizadas
// 3. Crear funnel con los pasos clave del journey
// 4. Configurar audiencia para usuarios que completan el funnel
''',
    });

    // Integración en Flutter
    await db.insert('detail', {
      'id': 139,
      'subtopic_id': 's03t04l06',
      'module': 'Sr',
      'definition':
          'Integrar Google Analytics en Flutter eficientemente requiere considerar arquitectura, rendimiento y la relación con Firebase Analytics.\n\n'
              '**Consideraciones clave**:\n'
              '-Uso de Firebase Analytics como intermediario\n'
              '-Mapeo de eventos a GA4\n'
              '-Consistencia entre plataformas\n'
              '-Manejo de sesiones y tiempo de usuario\n'
              '-Control de datos sensibles\n\n'
              'Los desarrolladores senior a veces no verifican que los eventos se estén enviando correctamente a GA4, asumiendo que la integración con Firebase es suficiente.',
      'img_url': '',
      'code_example': '''
// Arquitectura completa con GA4 y Firebase
final analyticsProvider = Provider<AnalyticsRepository>((ref) {
  final firebaseAnalytics = FirebaseAnalytics.instance;
  return AnalyticsRepository(firebaseAnalytics);
});

class AnalyticsRepository {
  final FirebaseAnalytics _firebaseAnalytics;
  final _enabled = true;
  
  AnalyticsRepository(this._firebaseAnalytics);
  
  Future<void> logEvent(String name, [Map<String, dynamic>? params]) async {
    if (!_enabled) return;
    
    try {
      // Firebase Analytics envía automáticamente a GA4
      await _firebaseAnalytics.logEvent(
        name: name,
        parameters: _sanitizeParams(params),
      );
    } catch (e) {
      // Fallback storage o logging
    }
  }
  
  Map<String, dynamic>? _sanitizeParams(Map<String, dynamic>? params) {
    if (params == null) return null;
    
    // Eliminar datos sensibles
    final sensitiveKeys = ['password', 'token', 'credit_card'];
    return params..removeWhere((key, value) => sensitiveKeys.contains(key));
  }
  
  Future<void> setUserProperties(Map<String, dynamic> properties) async {
    if (!_enabled) return;
    
    for (final entry in properties.entries) {
      await _firebaseAnalytics.setUserProperty(
        name: entry.key,
        value: entry.value?.toString(),
      );
    }
  }
  
  Future<void> setCurrentScreen(String screenName) async {
    if (!_enabled) return;
    
    await _firebaseAnalytics.setCurrentScreen(
      screenName: screenName,
      screenClassOverride: screenName,
    );
  }
}

// Uso con Riverpod
class AnalyticsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analytics = ref.read(analyticsProvider);
    
    useEffect(() {
      analytics.setCurrentScreen('AnalyticsScreen');
      analytics.logEvent('screen_view', {'screen': 'Analytics'});
      return null;
    }, []);
    
    return Scaffold(
      appBar: AppBar(title: Text('Analytics')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await analytics.logEvent('button_click', {
              'button_id': 'main_cta',
              'screen': 'Analytics',
            });
          },
          child: Text('Track Event'),
        ),
      ),
    );
  }
}

// Verificación en GA4
// 1. Ir a Realtime > Events en la consola de GA4
// 2. Verificar que los eventos aparecen al interactuar con la app
// 3. Configurar DebugView en dispositivo de desarrollo
''',
    });
  }
}
