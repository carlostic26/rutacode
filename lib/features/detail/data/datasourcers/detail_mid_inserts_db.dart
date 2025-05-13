import 'package:flutter/material.dart';
import 'package:sqflite_common/sqlite_api.dart';

class DetailMidLocalDatabaseHelper {
  Future<void> insertDetailsMid(Database db) async {
    try {
      await insertDetailsMidLevel1(db);
      await insertDetailsMidLevel2(db);
      await insertDetailsMidLevel3(db);
      await insertDetailsMidLevel4(db);
      await insertDetailsMidLevel5(db);
      await insertDetailsMidLevel6(db);
      await insertDetailsMidLevel7(db);
      await insertDetailsMidLevel8(db);
      await insertDetailsMidLevel9(db);
      await insertDetailsMidLevel10(db);
    } catch (e) {
      debugPrint("Error inserting details mid: $e");
    }
  }

  Future<void> insertDetailsMidLevel1(Database db) async {
    try {
      await _insertDetailsMidTopic1Level1(db); // Riverpod
      await _insertDetailsMidTopic2Level1(db); // Tipos de providers
      await _insertDetailsMidTopic3Level1(db); // Notificar cambios
      await _insertDetailsMidTopic4Level1(db); // Ejemplos prácticos
    } catch (e) {
      debugPrint("Error inserting details mid level 1: $e");
    }
  }

  Future<void> _insertDetailsMidTopic1Level1(Database db) async {
    // Qué es Riverpod
    await db.insert('detail', {
      'id': 1,
      'subtopic_id': 's01t01l01',
      'module': 'Mid',
      'definition':
          'Riverpod es una biblioteca de gestión de estado para Flutter que mejora el concepto original de Provider. Es como tener un supermercado bien organizado donde cada producto (estado) está en su lugar correcto y es fácil de encontrar.\n\n'
              '¿Por qué es útil?\n'
              '- Evita el "prop drilling" (pasar datos por muchos widgets)\n'
              '- Facilita el testing\n'
              '- Es más seguro en tiempo de compilación\n\n'
              'Sin Riverpod, tendrías que manejar el estado manualmente o usar soluciones menos eficientes, lo que llevaría a código más complicado y difícil de mantener.\n\n'
              'Imagina construir una casa sin herramientas eléctricas. Podrías hacerlo, pero sería mucho más lento y propenso a errores. Riverpod es como tu taladro eléctrico para el desarrollo Flutter.',
      'img_url': '',
      'code_example': '''
final counterProvider = StateProvider<int>((ref) => 0);

class MyWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    return Text('Count: \$count');
  }
}
''',
    });

    // Ventajas de uso
    await db.insert('detail', {
      'id': 2,
      'subtopic_id': 's02t01l01',
      'module': 'Mid',
      'definition': 'Las principales ventajas de Riverpod son:\n\n'
          '1. **Seguridad en tiempo de compilación**: Te avisa de errores antes de que la app se ejecute.\n'
          '2. **Flexibilidad**: Puedes usar diferentes tipos de providers según tus necesidades.\n'
          '3. **Independencia de Flutter**: Puedes usarlo incluso fuera de widgets.\n'
          '4. **Fácil testing**: Mockear dependencias es sencillo.\n\n'
          'Sin estas ventajas, pasarías más tiempo depurando errores y menos construyendo características. Es como tener un GPS en lugar de un mapa de papel: ambos te llevan a tu destino, pero uno lo hace de manera más eficiente y con menos errores.',
      'img_url': '',
      'code_example': '''
// Ejemplo de testing con Riverpod
void main() {
  test('counter increments', () {
    final container = ProviderContainer();
    final counter = container.read(counterProvider.notifier);
    
    expect(container.read(counterProvider), 0);
    counter.state++;
    expect(container.read(counterProvider), 1);
  });
}
''',
    });

    // Gestionar estado en Flutter
    await db.insert('detail', {
      'id': 3,
      'subtopic_id': 's03t01l01',
      'module': 'Mid',
      'definition':
          'Gestionar el estado significa controlar cómo los datos cambian y fluyen en tu app. Con Riverpod, es como tener un sistema central de climatización que mantiene cada habitación a la temperatura perfecta.\n\n'
              '**Problemas sin Riverpod**:\n'
              '- Datos desincronizados\n'
              '- Rebuilds innecesarios\n'
              '- Código difícil de mantener\n\n'
              'Riverpod soluciona esto permitiendo:\n'
              '- Acceso al estado desde cualquier lugar\n'
              '- Actualizaciones eficientes\n'
              '- Una sola fuente de verdad\n\n'
              'Es como la diferencia entre llevar cuentas en papel versus usar un software contable. Ambos funcionan, pero uno es claramente mejor.',
      'img_url': '',
      'code_example': '''
// Estado compartido entre múltiples widgets
final userProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  return UserNotifier();
});

class ProfileHeader extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Text(user.name);
  }
}

class ProfileScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Column(
      children: [
        ProfileHeader(),
        Text(user.email),
      ],
    );
  }
}
''',
    });
  }

  Future<void> _insertDetailsMidTopic2Level1(Database db) async {
    // StateProvider
    await db.insert('detail', {
      'id': 1,
      'subtopic_id': 's01t02l01',
      'module': 'Mid',
      'definition':
          'StateProvider es el provider más simple, perfecto para estados pequeños que cambian con frecuencia, como un contador.\n\n'
              '**¿Cuándo usarlo?**\n'
              '- Para valores simples (números, strings, booleans)\n'
              '- Cuando no necesitas lógica compleja\n\n'
              '**Sin StateProvider** tendrías que usar StatefulWidgets, lo que haría tu código más verboso y difícil de compartir entre widgets.\n\n'
              'Piensa en StateProvider como un bloc de notas compartido donde cualquier widget puede leer y escribir, pero Riverpod se encarga de avisar a todos cuando hay cambios.',
      'img_url': '',
      'code_example': '''
final themeProvider = StateProvider<bool>((ref) => false); // false = light, true = dark

void toggleTheme(WidgetRef ref) {
  ref.read(themeProvider.notifier).state = !ref.read(themeProvider);
}

class ThemeToggle extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(themeProvider);
    return Switch(
      value: isDark,
      onChanged: (_) => toggleTheme(ref),
    );
  }
}
''',
    });

    // NotifierProvider
    await db.insert('detail', {
      'id': 2,
      'subtopic_id': 's02t02l01',
      'module': 'Mid',
      'definition':
          'NotifierProvider es para estados más complejos que necesitan lógica de negocio. Es como tener un asistente personal que maneja todas las operaciones relacionadas con un estado específico.\n\n'
              '**Ventajas**:\n'
              '- Separa la lógica de la UI\n'
              '- Fácil de testear\n'
              '- Mantiene el código organizado\n\n'
              '**Sin NotifierProvider**, mezclarías la lógica con los widgets, creando un "spaghetti code" difícil de mantener.\n\n'
              'Ejemplo práctico: Imagina gestionar una lista de tareas. Sin NotifierProvider, tendrías la lógica de añadir/eliminar tareas en tus widgets. Con NotifierProvider, esta lógica vive en su propia clase, limpia y reutilizable.',
      'img_url': '',
      'code_example': '''
class TodoNotifier extends StateNotifier<List<Todo>> {
  TodoNotifier() : super([]);

  void addTodo(String text) {
    state = [...state, Todo(text: text, completed: false)];
  }

  void toggleTodo(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id) todo.copyWith(completed: !todo.completed) else todo,
    ];
  }
}

final todosProvider = StateNotifierProvider<TodoNotifier, List<Todo>>((ref) {
  return TodoNotifier();
});

class TodoList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todosProvider);
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) => TodoItem(todo: todos[index]),
    );
  }
}
''',
    });

    // FutureProvider
    await db.insert('detail', {
      'id': 3,
      'subtopic_id': 's03t02l01',
      'module': 'Mid',
      'definition':
          'FutureProvider es ideal para operaciones asíncronas como llamadas a APIs. Es como un mensajero confiable que va por tus datos y te los trae cuando están listos.\n\n'
              '**Beneficios**:\n'
              '- Maneja automáticamente los estados de carga/error\n'
              '- Fácil refresco de datos\n'
              '- Cache automática\n\n'
              '**Sin FutureProvider**, tendrías que manejar manualmente los estados de loading/error/data, lo que lleva a código repetitivo y propenso a errores.\n\n'
              'Ejemplo: Al cargar datos de usuario desde una API, FutureProvider te da los tres estados (loading, error, data) sin esfuerzo.',
      'img_url': '',
      'code_example': '''
final userProfileProvider = FutureProvider<UserProfile>((ref) async {
  final response = await http.get(Uri.parse('https://api.example.com/user'));
  if (response.statusCode == 200) {
    return UserProfile.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load user profile');
  }
});

class ProfileScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfile = ref.watch(userProfileProvider);
    
    return userProfile.when(
      loading: () => CircularProgressIndicator(),
      error: (error, stack) => Text('Error: \$error'),
      data: (profile) => Column(
        children: [
          Text(profile.name),
          Text(profile.email),
        ],
      ),
    );
  }
}
''',
    });

    // StreamProvider
    await db.insert('detail', {
      'id': 4,
      'subtopic_id': 's04t02l01',
      'module': 'Mid',
      'definition':
          'StreamProvider es para datos que cambian con el tiempo, como mensajes en un chat o actualizaciones en tiempo real. Imagínalo como una tubería que constantemente lleva agua fresca (datos) a tu app.\n\n'
              '**Casos de uso**:\n'
              '- Chat en tiempo real\n'
              '- Actualizaciones de precios\n'
              '- Monitoreo de sensores\n\n'
              '**Sin StreamProvider**, tendrías que manejar manualmente las suscripciones a streams, lo que puede llevar a fugas de memoria si no se hace correctamente.\n\n'
              'Riverpod se encarga de suscribirse y cancelar la suscripción automáticamente cuando el widget no está visible.',
      'img_url': '',
      'code_example': '''
final chatMessagesProvider = StreamProvider<List<Message>>((ref) {
  return FirebaseFirestore.instance
      .collection('chats')
      .doc('room1')
      .collection('messages')
      .orderBy('timestamp')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => Message.fromJson(doc.data())).toList());
});

class ChatScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(chatMessagesProvider);
    
    return messages.when(
      loading: () => CircularProgressIndicator(),
      error: (error, stack) => Text('Error: \$error'),
      data: (messages) => ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) => MessageBubble(message: messages[index]),
      ),
    );
  }
}
''',
    });

    // Diferencias entre providers
    await db.insert('detail', {
      'id': 5,
      'subtopic_id': 's05t02l01',
      'module': 'Mid',
      'definition': 'Cada provider en Riverpod tiene su propósito específico. Elegir el correcto es como seleccionar la herramienta adecuada para un trabajo:\n\n'
          '1. **StateProvider**: Martillo - simple pero efectivo para trabajos básicos\n'
          '2. **NotifierProvider**: Taladro eléctrico - más potencia para trabajos complejos\n'
          '3. **FutureProvider**: Mensajero - trae datos una vez\n'
          '4. **StreamProvider**: Tubería - trae datos continuamente\n\n'
          '**Consecuencias de elegir mal**:\n'
          '- Código innecesariamente complejo\n'
          '- Problemas de rendimiento\n'
          '- Dificultad para mantener\n\n'
          'Regla general: Empieza con el provider más simple que satisfaga tus necesidades y escala solo cuando sea necesario.',
      'img_url': '',
      'code_example': '''
// Ejemplos de cuándo usar cada uno:

// 1. StateProvider - Tema claro/oscuro
final themeProvider = StateProvider<bool>((ref) => false);

// 2. NotifierProvider - Carrito de compras
final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) => CartNotifier());

// 3. FutureProvider - Datos de usuario
final userProvider = FutureProvider<User>((ref) => fetchUser());

// 4. StreamProvider - Mensajes en tiempo real
final messagesProvider = StreamProvider<List<Message>>((ref) => chatStream());
''',
    });
  }

  Future<void> _insertDetailsMidTopic3Level1(Database db) async {
    // watch
    await db.insert('detail', {
      'id': 1,
      'subtopic_id': 's01t03l01',
      'module': 'Mid',
      'definition':
          '`ref.watch()` es como suscribirte a un periódico - recibes actualizaciones cada vez que hay un nuevo número (cambio en el estado).\n\n'
              '**Cómo funciona**:\n'
              '- Reconstruye el widget cuando el estado cambia\n'
              '- Ideal para datos que cambian frecuentemente\n'
              '- Usado dentro del método build\n\n'
              '**Si no usas watch**:\n'
              '- Tu UI no se actualizaría con los cambios de estado\n'
              '- Tendrías que manejar manualmente las actualizaciones\n\n'
              'Ejemplo práctico: Imagina un contador. Sin watch, el número en pantalla no cambiaría aunque el valor del contador sí lo haga.',
      'img_url': '',
      'code_example': '''
final counterProvider = StateProvider<int>((ref) => 0);

class CounterText extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // El widget se reconstruye cada vez que counter cambia
    final count = ref.watch(counterProvider);
    return Text('Count: \$count');
  }
}

class IncrementButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // No necesitamos watch aquí porque solo necesitamos el notifier
    final counter = ref.read(counterProvider.notifier);
    return ElevatedButton(
      onPressed: () => counter.state++,
      child: Text('Increment'),
    );
  }
}
''',
    });

    // read
    await db.insert('detail', {
      'id': 2,
      'subtopic_id': 's02t03l01',
      'module': 'Mid',
      'definition':
          '`ref.read()` es como comprar un periódico una sola vez - obtienes el valor actual pero no recibes actualizaciones futuras.\n\n'
              '**Cuándo usarlo**:\n'
              '- En callbacks (onPressed, etc.)\n'
              '- Para acceder a notifiers\n'
              '- Cuando no necesitas reconstruir el widget\n\n'
              '**Peligro de usarlo mal**:\n'
              'Si usas read en build para mostrar datos, tu UI no se actualizará cuando el estado cambie. Es un error común que lleva a bugs difíciles de encontrar.\n\n'
              'Regla de oro: Usa watch para mostrar datos, read para actuar sobre ellos.',
      'img_url': '',
      'code_example': '''
final counterProvider = StateProvider<int>((ref) => 0);

class CounterScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Correcto: watch para mostrar el valor
    final count = ref.watch(counterProvider);
    
    return Column(
      children: [
        Text('Count: \$count'),
        ElevatedButton(
          onPressed: () {
            // Correcto: read en callback
            ref.read(counterProvider.notifier).state++;
          },
          child: Text('Increment'),
        ),
      ],
    );
  }
}

// MAL USO (no hagas esto):
class BadExample extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Incorrecto: usando read en build para mostrar datos
    final count = ref.read(counterProvider);
    return Text('Count: \$count'); // ¡No se actualizará!
  }
}
''',
    });
  }

  Future<void> _insertDetailsMidTopic4Level1(Database db) async {
    // Contador simple con StateProvider
    await db.insert('detail', {
      'id': 1,
      'subtopic_id': 's01t04l01',
      'module': 'Mid',
      'definition':
          'El contador es el "Hola Mundo" de la gestión de estado. Con Riverpod, es sorprendentemente simple pero muestra conceptos poderosos.\n\n'
              '**Qué aprendemos**:\n'
              '- Cómo crear un provider\n'
              '- Cómo leer el estado\n'
              '- Cómo modificar el estado\n\n'
              '**Sin Riverpod**, este simple ejemplo requeriría:\n'
              '- Un StatefulWidget\n'
              '- Métodos setState\n'
              '- Posiblemente un InheritedWidget para compartir el estado\n\n'
              'Con Riverpod, el estado es fácil de compartir entre widgets sin crear jerarquías complicadas.',
      'img_url': '',
      'code_example': '''
// 1. Define el provider (fuera de cualquier clase)
final counterProvider = StateProvider<int>((ref) => 0);

// 2. Widget que muestra el contador
class CounterDisplay extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    return Text('Count: \$count');
  }
}

// 3. Widget que incrementa el contador
class IncrementButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () => ref.read(counterProvider.notifier).state++,
      child: Text('Increment'),
    );
  }
}

// 4. Usarlos juntos
class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CounterDisplay(),
            SizedBox(height: 20),
            IncrementButton(),
          ],
        ),
      ),
    );
  }
}
''',
    });

    // Gestión de autenticación con NotifierProvider
    await db.insert('detail', {
      'id': 2,
      'subtopic_id': 's02t04l01',
      'module': 'Mid',
      'definition':
          'La autenticación es un caso de uso perfecto para NotifierProvider porque:\n'
              '- Involucra múltiples pasos (login, logout, etc.)\n'
              '- Tiene estados complejos (loading, error, authenticated)\n'
              '- Es accedido desde muchas partes de la app\n\n'
              '**Sin Riverpod**, la autenticación se convertiría rápidamente en un desorden:\n'
              '- Lógica duplicada\n'
              '- Dificultad para sincronizar el estado\n'
              '- Problemas con la inyección de dependencias\n\n'
              'Con Riverpod, centralizas toda la lógica de autenticación en un solo lugar accesible desde cualquier widget.',
      'img_url': '',
      'code_example': '''
// 1. Define el estado de autenticación
class AuthState {
  final User? user;
  final bool isLoading;
  final String? error;

  AuthState({this.user, this.isLoading = false, this.error});
}

// 2. Crea el notifier
class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState());

  Future<void> login(String email, String password) async {
    state = AuthState(isLoading: true);
    try {
      final user = await AuthService.login(email, password);
      state = AuthState(user: user);
    } catch (e) {
      state = AuthState(error: e.toString());
    }
  }

  Future<void> logout() async {
    await AuthService.logout();
    state = AuthState();
  }
}

// 3. Crea el provider
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});

// 4. Usar en la UI
class LoginScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    
    if (authState.isLoading) return CircularProgressIndicator();
    if (authState.error != null) return Text('Error: {authState.error}');
    if (authState.user != null) return HomeScreen();

    return Column(
      children: [
        TextField(/* email */),
        TextField(/* password */),
        ElevatedButton(
          onPressed: () {
            ref.read(authProvider.notifier).login('email', 'password');
          },
          child: Text('Login'),
        ),
      ],
    );
  }
}
''',
    });
  }

  Future<void> insertDetailsMidLevel2(Database db) async {
    try {
      await _insertDetailsMidTopic1Level2(db); // Streams
      await _insertDetailsMidTopic2Level2(db); // Futures
    } catch (e) {
      debugPrint("Error inserting details mid level 2: $e");
    }
  }

  Future<void> _insertDetailsMidTopic1Level2(Database db) async {
    // Introducción a los Streams en Dart
    await db.insert('detail', {
      'id': 1,
      'subtopic_id': 's01t01l02',
      'module': 'Mid',
      'definition':
          'Los Streams en Dart son como tuberías de datos que fluyen continuamente. Imagina un grifo de agua que nunca se cierra: los datos son el agua que sigue llegando cuando hay nuevos disponibles.\n\n'
              '**Por qué son útiles**:\n'
              '- Manejan datos en tiempo real (chats, actualizaciones)\n'
              '- Son eficientes en memoria\n'
              '- Permiten operaciones complejas con datos asíncronos\n\n'
              '**Problemas sin Streams**:\n'
              '- Polling constante a APIs (ineficiente)\n'
              '- Dificultad para manejar flujos continuos\n'
              '- Código más complejo para actualizaciones en tiempo real\n\n'
              'Ejemplo práctico: Un chat sin streams requeriría preguntar constantemente "¿hay mensajes nuevos?", mientras que con streams los mensajes llegan solos cuando están disponibles.',
      'img_url': '',
      'code_example': '''
// Stream básico que emite números del 1 al 5 cada segundo
Stream<int> countStream() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

void main() async {
  await for (final number in countStream()) {
   debugPrint('Número recibido: \$number');
  }
 debugPrint('¡Stream completado!');
}

/* Salida:
Número recibido: 1 (después de 1 segundo)
Número recibido: 2 (después de 2 segundos)
...
Número recibido: 5 (después de 5 segundos)
¡Stream completado!
*/
''',
    });

    // Uso de StreamControllers y StreamBuilders
    await db.insert('detail', {
      'id': 2,
      'subtopic_id': 's02t01l02',
      'module': 'Mid',
      'definition':
          'StreamController es el "grifo maestro" que controla el flujo de datos, mientras que StreamBuilder es el "fontanero" que conecta esos datos a tu interfaz de usuario.\n\n'
              '**Componentes clave**:\n'
              '- StreamController: Gestiona la fuente del stream\n'
              '- Stream: La tubería por donde fluyen los datos\n'
              '- StreamBuilder: Widget que reacciona a los datos\n\n'
              '**Sin estos elementos**:\n'
              '- Tendrías que gestionar manualmente las suscripciones\n'
              '- Mayor riesgo de fugas de memoria\n'
              '- UI no actualizada automáticamente\n\n'
              'Ejemplo: Un contador en tiempo real sería mucho más complejo sin StreamBuilder para actualizar la UI automáticamente.',
      'img_url': '',
      'code_example': '''
// Ejemplo completo de StreamController + StreamBuilder
final streamController = StreamController<int>();
int counter = 0;

class StreamExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Parte 1: StreamBuilder para mostrar datos
        StreamBuilder<int>(
          stream: streamController.stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Text('Esperando datos...');
            return Text('Valor actual: {snapshot.data}');
          },
        ),
        // Parte 2: Botón para añadir datos al stream
        ElevatedButton(
          onPressed: () {
            counter++;
            streamController.add(counter); // Envía nuevo valor al stream
          },
          child: Text('Incrementar'),
        ),
      ],
    );
  }
}

// Importante: Cerrar el controller cuando no se use
// streamController.close();
''',
    });

    // Transformación de Streams con operadores
    await db.insert('detail', {
      'id': 3,
      'subtopic_id': 's03t01l02',
      'module': 'Mid',
      'definition':
          'Los operadores de Streams son como filtros y tuberías especializadas que transforman los datos mientras fluyen. Puedes modificar, filtrar, combinar o reaccionar a los datos sin alterar la fuente original.\n\n'
              '**Operadores comunes**:\n'
              '- map: Transforma cada elemento\n'
              '- where: Filtra elementos\n'
              '- debounce: Espera una pausa\n'
              '- combineLatest: Combina múltiples streams\n\n'
              '**Sin operadores**:\n'
              '- Código más verboso\n'
              '- Lógica de transformación mezclada\n'
              '- Difícil reutilización\n\n'
              'Ejemplo práctico: Un buscador con autocompletado sería muy ineficiente sin debounce para esperar que el usuario termine de escribir.',
      'img_url': '',
      'code_example': '''
// Ejemplo con múltiples operadores
void main() async {
  // Stream original: números del 1 al 10
  final stream = Stream.fromIterable([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
  
  // Stream transformado:
  // - Solo pares (where)
  // - Multiplicados por 10 (map)
  // - Saltar los 2 primeros (skip)
  final transformed = stream
      .where((n) => n % 2 == 0)
      .map((n) => n * 10)
      .skip(2);
  
  await for (final n in transformed) {
   debugPrint(n); 
  }
}

/* Salida:
40 (porque 4 es el 3er par, 4*10=40)
60
80
100
*/
''',
    });
  }

  Future<void> _insertDetailsMidTopic2Level2(Database db) async {
    // Introducción a los Futures en Dart
    await db.insert('detail', {
      'id': 1,
      'subtopic_id': 's01t02l02',
      'module': 'Mid',
      'definition':
          'Los Futures representan valores que estarán disponibles en el futuro, como una promesa de que tendrás algo más tarde. Imagina pedir comida a domicilio: el Future es el recibo que te dan, no la comida en sí.\n\n'
              '**Casos de uso típicos**:\n'
              '- Llamadas a APIs\n'
              '- Lectura/escritura de archivos\n'
              '- Cálculos costosos\n\n'
              '**Problemas sin Futures**:\n'
              '- Apps se congelan durante operaciones largas\n'
              '- Dificultad para manejar operaciones asíncronas\n'
              '- Código anidado difícil de mantener (callback hell)\n\n'
              'Ejemplo: Una app que carga datos de internet sin Futures se congelaría completamente hasta terminar la descarga.',
      'img_url': '',
      'code_example': '''
// Future básico que simula una llamada a API
Future<String> fetchUserName() async {
  await Future.delayed(Duration(seconds: 2)); // Simula demora de red
  return 'Juan Pérez'; // Datos "recibidos" de la API
}

void main() async {
 debugPrint('Cargando nombre de usuario...');
  final name = await fetchUserName();
 debugPrint('Nombre recibido: \$name');
}

/* Salida:
Cargando nombre de usuario...
(2 segundos después)
Nombre recibido: Juan Pérez
*/
''',
    });

    // Uso de async y await
    await db.insert('detail', {
      'id': 2,
      'subtopic_id': 's02t02l02',
      'module': 'Mid',
      'definition':
          'async/await es como tener un asistente que te avisa cuando tu comida a domicilio llega, para que no tengas que estar revisando la puerta constantemente.\n\n'
              '**Cómo funciona**:\n'
              '- async: Marca una función como asíncrona\n'
              '- await: Pausa la ejecución hasta que el Future se complete\n'
              '- El código sigue siendo lineal y fácil de leer\n\n'
              '**Alternativas menos eficientes**:\n'
              '- Callbacks anidados (callback hell)\n'
              '- Then() encadenado\n'
              '- Esperar sincrónicamente (bloquea la app)\n\n'
              'Ejemplo: Cargar datos y luego procesarlos sería mucho más complicado sin async/await.',
      'img_url': '',
      'code_example': '''
// Ejemplo completo con manejo de errores
Future<void> loadUserData() async {
  try {
   debugPrint('Iniciando carga de datos...');
    
    // Esperar múltiples Futures de forma secuencial
    final user = await fetchUser();
    final posts = await fetchUserPosts(user.id);
    final friends = await fetchUserFriends(user.id);
    
    // Procesar los datos recibidos
   debugPrint(''Datos cargados:  Usuario: {user.name} Posts: {posts.length} Amigos: {friends.length}'');
    
  } catch (e) {
   debugPrint('Error al cargar datos: \$e');
  } finally {
   debugPrint('Carga de datos completada');
  }
}

// Funciones simuladas
Future<User> fetchUser() async {
  await Future.delayed(Duration(seconds: 1));
  return User(id: 1, name: 'Ana López');
}

Future<List<Post>> fetchUserPosts(int userId) async {
  await Future.delayed(Duration(seconds: 2));
  return [Post(), Post()];
}

Future<List<User>> fetchUserFriends(int userId) async {
  await Future.delayed(Duration(seconds: 1));
  return [User(id: 2, name: 'Carlos Ruiz')];
}
''',
    });

    // Manejo de errores en Futures
    await db.insert('detail', {
      'id': 3,
      'subtopic_id': 's03t02l02',
      'module': 'Mid',
      'definition':
          'Manejar errores en Futures es como tener un plan B cuando las cosas salen mal. Imagina que el restaurante no tiene tu pedido: ¿cancelas toda la cena o pides otra cosa?\n\n'
              '**Enfoques para manejar errores**:\n'
              '- try/catch: El método clásico\n'
              '- onError en then(): Alternativa funcional\n'
              '- catchError: Para cadenas de Futures\n\n'
              '**Consecuencias de no manejar errores**:\n'
              '- Apps que crashean inesperadamente\n'
              '- Usuarios ven errores técnicos\n'
              '- Flujos rotos en la aplicación\n\n'
              'Ejemplo: Una app que no maneja errores de red mostraría mensajes crípticos o se cerraría cuando el servidor no responda.',
      'img_url': '',
      'code_example': '''
// Diferentes formas de manejar errores:

// 1. try/catch (recomendado para código lineal)
Future<void> loadData() async {
  try {
    final data = await fetchDataFromInternet();
   debugPrint('Datos recibidos: \$data');
  } on SocketException catch (e) {
   debugPrint('Error de conexión: \$e');
    showErrorMessage('No hay internet');
  } on FormatException {
   debugPrint('Datos corruptos');
    showErrorMessage('Datos inválidos');
  } catch (e) {
   debugPrint('Error inesperado: \$e');
    showErrorMessage('Error desconocido');
  }
}

// 2. then() con onError
fetchDataFromInternet()
    .then((data) =>debugPrint('Datos: \$data'))
    .onError((error, stack) {
     debugPrint('Error: \$error');
      return null; // Valor alternativo
    });

// 3. catchError en cadenas
fetchDataFromInternet()
    .then(processData)
    .catchError(handleError);

// Función simulada que puede fallar
Future<String> fetchDataFromInternet() async {
  await Future.delayed(Duration(seconds: 1));
  final random = Random().nextInt(10);
  
  if (random < 3) throw SocketException('No connection');
  if (random < 6) throw FormatException('Invalid data');
  
  return 'Datos válidos';
}
''',
    });
  }

  Future<void> insertDetailsMidLevel3(Database db) async {
    try {
      await _insertDetailsMidTopic1Level3(db); // Principios SOLID
      await _insertDetailsMidTopic2Level3(db); // Patrones de diseño
    } catch (e) {
      debugPrint("Error inserting details mid level 3: $e");
    }
  }

  Future<void> _insertDetailsMidTopic1Level3(Database db) async {
    // Principio de Responsabilidad Única (SRP)
    await db.insert('detail', {
      'id': 1,
      'subtopic_id': 's01t01l03',
      'module': 'Mid',
      'definition':
          'SRP: Una clase debe tener una sola razón para cambiar. Imagina un restaurante donde el mismo lavaplatos también cocina, sirve y cobra - sería un caos. Cada clase debe hacer una sola cosa bien.\n\n'
              '**Beneficios**:\n'
              '- Código más fácil de mantener\n'
              '- Menos efectos secundarios al cambiar código\n'
              '- Mejor organización del proyecto\n\n'
              '**Violación común**:\n'
              'Clases "Dios" que hacen de todo. Ejemplo: Una clase User que:\n'
              '- Valida credenciales\n'
              '- Guarda en base de datos\n'
              '- Envía emails\n'
              '- Genera reportes\n\n'
              'Solución: Dividir en UserAuth, UserRepository, EmailService, etc.',
      'img_url': '',
      'code_example': '''
// MAL: Una clase con múltiples responsabilidades
class UserManager {
  void authenticate(String user, String pass) { /* ... */ }
  void saveToDatabase(User user) { /* ... */ }
  void sendWelcomeEmail(User user) { /* ... */ }
  void generateUserReport(User user) { /* ... */ }
}

// BIEN: Responsabilidades separadas
class UserAuthenticator {
  void authenticate(String user, String pass) { /* ... */ }
}

class UserRepository {
  void save(User user) { /* ... */ }
}

class EmailService {
  void sendWelcome(User user) { /* ... */ }
}

class ReportGenerator {
  void generateUserReport(User user) { /* ... */ }
}
''',
    });

    // Principio Abierto/Cerrado (OCP)
    await db.insert('detail', {
      'id': 2,
      'subtopic_id': 's02t01l03',
      'module': 'Mid',
      'definition':
          'OCP: Las clases deben estar abiertas para extensión pero cerradas para modificación. Como un teléfono: puedes añadir apps (extensión) sin modificar su sistema operativo.\n\n'
              '**Cómo aplicarlo**:\n'
              '- Usar herencia/interfaces\n'
              '- Composición sobre herencia\n'
              '- Patrón Strategy para comportamientos variables\n\n'
              '**Problema sin OCP**:\n'
              'Si necesitas añadir un nuevo tipo, modificas la clase original, arriesgando romper lo que ya funcionaba. Ejemplo: Un procesador de pagos que hay que modificar cada vez que añades un nuevo método.',
      'img_url': '',
      'code_example': '''
// MAL: Necesitas modificar la clase para añadir nuevos tipos
class PaymentProcessor {
  void process(String paymentType) {
    if (paymentType == 'credit') { /* ... */ }
    else if (paymentType == 'paypal') { /* ... */ }
    // Añadir nuevo elif para cada nuevo tipo
  }
}

// BIEN: Extensible sin modificar la clase base
abstract class PaymentMethod {
  void process();
}

class CreditCard implements PaymentMethod {
  void process() { /* ... */ }
}

class PayPal implements PaymentMethod {
  void process() { /* ... */ }
}

class PaymentProcessor {
  void process(PaymentMethod method) {
    method.process();
  }
}

// Para añadir nuevo tipo:
class Bitcoin implements PaymentMethod {
  void process() { /* ... */ }
}
// No necesitas modificar PaymentProcessor
''',
    });

    // Principio de Sustitución de Liskov (LSP)
    await db.insert('detail', {
      'id': 3,
      'subtopic_id': 's03t01l03',
      'module': 'Mid',
      'definition':
          'LSP: Las clases derivadas deben poder sustituir a sus clases base sin romper el comportamiento. Si tienes un pájaro de juguete y un pájaro real, ambos deberían "volar" de alguna forma.\n\n'
              '**Violación común**:\n'
              '- Lanzar excepciones inesperadas en subclases\n'
              '- Devolver tipos diferentes\n'
              '- Cambiar precondiciones/postcondiciones\n\n'
              '**Ejemplo mal diseñado**:\n'
              'Clase Rectangle con setWidth/setHeight, y Square que hereda pero cambia el comportamiento (al setWidth también cambia height). Esto rompe LSP porque no son intercambiables.',
      'img_url': '',
      'code_example': '''
// MAL: Square rompe LSP porque cambia el comportamiento de Rectangle
class Rectangle {
  double width, height;
  
  void setWidth(double w) { width = w; }
  void setHeight(double h) { height = h; }
  
  double get area => width * height;
}

class Square extends Rectangle {
  @override
  void setWidth(double w) {
    super.setWidth(w);
    super.setHeight(w); // Comportamiento inesperado
  }
  
  @override
  void setHeight(double h) {
    super.setWidth(h); // Comportamiento inesperado
    super.setHeight(h);
  }
}

void testRectangle(Rectangle r) {
  r.setWidth(5);
  r.setHeight(4);
  assert(r.area == 20); // Falla con Square
}

// SOLUCIÓN: No hacer Square heredar de Rectangle
''',
    });

    // Principio de Segregación de Interfaces (ISP)
    await db.insert('detail', {
      'id': 4,
      'subtopic_id': 's04t01l03',
      'module': 'Mid',
      'definition':
          'ISP: Los clientes no deben depender de interfaces que no usan. Es como un menú à la carte vs. buffet: ¿por qué pagar por comida que no comes?\n\n'
              '**Problema común**:\n'
              '- Interfaces "gordas" con muchos métodos\n'
              '- Clases que implementan métodos vacíos ("no aplica")\n'
              '- Acoplamiento innecesario\n\n'
              '**Ejemplo real**:\n'
              'Interfaz Worker con métodos work/eat/sleep. Robot implementa Worker pero no come ni duerme - viola ISP. Mejor dividir en Workable y Feedable.',
      'img_url': '',
      'code_example': '''
// MAL: Interfaz demasiado grande
abstract class Worker {
  void work();
  void eat();
  void sleep();
}

class Human implements Worker {
  void work() { /* ... */ }
  void eat() { /* ... */ }
  void sleep() { /* ... */ }
}

class Robot implements Worker {
  void work() { /* ... */ }
  void eat() { /* no aplica */ } // Violación ISP
  void sleep() { /* no aplica */ } // Violación ISP
}

// BIEN: Interfaces segregadas
abstract class Workable {
  void work();
}

abstract class Feedable {
  void eat();
}

abstract class Sleepable {
  void sleep();
}

class Human implements Workable, Feedable, Sleepable {
  void work() { /* ... */ }
  void eat() { /* ... */ }
  void sleep() { /* ... */ }
}

class Robot implements Workable {
  void work() { /* ... */ }
}
''',
    });

    // Principio de Inversión de Dependencias (DIP)
    await db.insert('detail', {
      'id': 5,
      'subtopic_id': 's05t01l03',
      'module': 'Mid',
      'definition':
          'DIP: Depende de abstracciones, no de implementaciones concretas. Es como enchufar dispositivos: dependes del estándar USB, no de un cable específico.\n\n'
              '**Beneficios**:\n'
              '- Fácil cambiar implementaciones\n'
              '- Menos acoplado\n'
              '- Más testeable\n\n'
              '**Violación común**:\n'
              'Crear instancias concretas directamente en clases (new MySQLDatabase() en UserService). Mejor inyectar IDatabase.',
      'img_url': '',
      'code_example': '''
// MAL: Dependencia concreta
class UserService {
  final MySQLDatabase db = MySQLDatabase(); // Acoplado a MySQL
  
  void saveUser(User user) {
    db.save(user);
  }
}

// BIEN: Depende de abstracción
abstract class Database {
  void save(User user);
}

class UserService {
  final Database db;
  
  UserService(this.db); // Inyectamos la dependencia
  
  void saveUser(User user) {
    db.save(user);
  }
}

// Ahora puedes usar MySQL, SQLite, etc. sin modificar UserService
class MySQLDatabase implements Database {
  void save(User user) { /* ... */ }
}

class SQLiteDatabase implements Database {
  void save(User user) { /* ... */ }
}
''',
    });
  }

  Future<void> _insertDetailsMidTopic2Level3(Database db) async {
    // Introducción a los Patrones de Diseño
    await db.insert('detail', {
      'id': 1,
      'subtopic_id': 's01t02l03',
      'module': 'Mid',
      'definition':
          'Los patrones de diseño son soluciones probadas a problemas comunes, como planos arquitectónicos para problemas de software. No son código listo, sino guías para organizar tu código.\n\n'
              '**Por qué usarlos**:\n'
              '- Evitan reinventar la rueda\n'
              '- Proporcionan vocabulario común\n'
              '- Soluciones optimizadas\n\n'
              '**Riesgos**:\n'
              '- Usarlos donde no corresponden\n'
              '- Implementaciones demasiado complejas\n'
              '- "Patronitis" (usar patrones por moda)\n\n'
              'Ejemplo: Usar Singleton para una conexión a BD (bueno) vs. usarlo para todo (malo).',
      'img_url': '',
      'code_example': '''
// Analogía: Construir una casa
class House {
  // Sin patrones: todo mezclado
  void buildFoundation() { /* ... */ }
  void buildWalls() { /* ... */ }
  void installPlumbing() { /* ... */ }
}

// Con patrones:
abstract class ConstructionPattern {
  void build();
}

class FoundationBuilder implements ConstructionPattern { /* ... */ }
class WallBuilder implements ConstructionPattern { /* ... */ }
class PlumbingInstaller implements ConstructionPattern { /* ... */ }

// Más organizado, extensible y mantenible
''',
    });

    // Patrón Singleton en Dart
    await db.insert('detail', {
      'id': 2,
      'subtopic_id': 's02t02l03',
      'module': 'Mid',
      'definition':
          'Singleton asegura que una clase tenga solo una instancia, con acceso global. Útil para recursos compartidos como configuraciones o conexiones a BD.\n\n'
              '**Cuándo usarlo**:\n'
              '- Recursos costosos (ej. conexión BD)\n'
              '- Configuración global\n'
              '- Cuando múltiples instancias causarían problemas\n\n'
              '**Cuándo evitarlo**:\n'
              '- Para objetos con estado mutable\n'
              '- Cuando dificulta testing\n'
              '- Como solución para todo\n\n'
              'Implementación en Dart es sencilla gracias a constructores factory y static.',
      'img_url': '',
      'code_example': '''
// Implementación clásica de Singleton en Dart
class DatabaseConnection {
  static final DatabaseConnection _instance = DatabaseConnection._internal();
  
  // Constructor privado
  DatabaseConnection._internal() {
   debugPrint('Creando nueva conexión a BD');
  }
  
  // Factory constructor para devolver la única instancia
  factory DatabaseConnection() {
    return _instance;
  }
  
  // Métodos de ejemplo
  void query(String sql) { /* ... */ }
}

void main() {
  final db1 = DatabaseConnection();
  final db2 = DatabaseConnection();
  
 debugPrint(identical(db1, db2)); // true - misma instancia
}

/* Salida:
Creando nueva conexión a BD
true
*/
''',
    });

    // Patrón Factory en Dart
    await db.insert('detail', {
      'id': 3,
      'subtopic_id': 's03t02l03',
      'module': 'Mid',
      'definition':
          'Factory es un patrón creacional que delega la creación de objetos a un método especial (la fábrica), en lugar de usar constructores directamente.\n\n'
              '**Ventajas**:\n'
              '- Encapsula la lógica de creación\n'
              '- Permite devolver subtipos\n'
              '- Puede cachear instancias\n'
              '- Más flexible que constructores\n\n'
              '**Casos de uso**:\n'
              '- Creación compleja (ej. diferentes tipos de usuarios)\n'
              '- Cuando el tipo exacto no se conoce de antemano\n'
              '- Para ocultar detalles de implementación\n\n'
              'En Dart se implementa con factory constructors.',
      'img_url': '',
      'code_example': '''
// Ejemplo: Sistema de notificaciones con diferentes tipos
abstract class Notification {
  void send();
}

class EmailNotification implements Notification {
  void send() =>debugPrint('Enviando email...');
}

class SMSNotification implements Notification {
  void send() =>debugPrint('Enviando SMS...');
}

class PushNotification implements Notification {
  void send() =>debugPrint('Enviando push notification...');
}

class NotificationFactory {
  // Factory method
  static Notification create(String type) {
    switch (type.toLowerCase()) {
      case 'email':
        return EmailNotification();
      case 'sms':
        return SMSNotification();
      case 'push':
        return PushNotification();
      default:
        throw ArgumentError('Tipo de notificación desconocido');
    }
  }
}

void main() {
  final notification = NotificationFactory.create('email');
  notification.send(); // Enviando email...
}
''',
    });
  }

  Future<void> insertDetailsMidLevel4(Database db) async {
    try {
      await _insertDetailsMidTopic1Level4(db); // Serialización JSON
      await _insertDetailsMidTopic2Level4(db); // APIs RESTful
    } catch (e) {
      debugPrint("Error inserting details mid level 4: $e");
    }
  }

  Future<void> _insertDetailsMidTopic1Level4(Database db) async {
    // Introducción a JSON en Dart
    await db.insert('detail', {
      'id': 1,
      'subtopic_id': 's01t01l04',
      'module': 'Mid',
      'definition':
          'JSON es el lenguaje universal para intercambiar datos entre apps y servidores. En Dart, trabajar con JSON es como traducir entre idiomas: necesitas convertir los datos brutos en algo que tu app pueda entender.\n\n'
              '**Problemas sin JSON**:\n'
              '- Datos imposibles de estructurar\n'
              '- Dificultad para comunicarse con APIs\n'
              '- Mayor tamaño de transferencia\n\n'
              '**Flujo de trabajo típico**:\n'
              '1. Recibir JSON de una API\n'
              '2. Decodificar a Map<String, dynamic>\n'
              '3. Convertir a objetos de Dart\n'
              '4. Trabajar con los datos\n'
              '5. Codificar de vuelta a JSON cuando sea necesario',
      'img_url': '',
      'code_example': '''
// Ejemplo básico de JSON en Dart
import 'dart:convert';

void main() {
  // JSON como string
  final jsonString = ''
  {
    "name": "Juan Pérez",
    "email": "juan@example.com",
    "age": 30,
    "isPremium": true,
    "courses": ["Flutter", "Dart"]
  }
  '';
  
  // 1. Decodificar JSON a Map
  final userMap = jsonDecode(jsonString);
 debugPrint(userMap['name']); // Juan Pérez
  
  // 2. Convertir a objeto Dart
  final user = User.fromJson(userMap);
  
  // 3. Usar el objeto
 debugPrint(user.email); // juan@example.com
  
  // 4. Codificar de vuelta a JSON
  final newJson = jsonEncode(user.toJson());
 debugPrint(newJson);
}

class User {
  final String name;
  final String email;
  final int age;
  final bool isPremium;
  final List<String> courses;
  
  User({required this.name, required this.email, required this.age, 
        required this.isPremium, required this.courses});
  
  // Constructor fromJson
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      age: json['age'],
      isPremium: json['isPremium'],
      courses: List<String>.from(json['courses']),
    );
  }
  
  // Método toJson
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'age': age,
      'isPremium': isPremium,
      'courses': courses,
    };
  }
}
''',
    });

    // Serialización de Objetos a JSON
    await db.insert('detail', {
      'id': 2,
      'subtopic_id': 's02t01l04',
      'module': 'Mid',
      'definition':
          'Serializar es convertir tus objetos Dart en JSON para enviarlos a un servidor o almacenarlos. Es como empaquetar una caja antes de enviarla por correo.\n\n'
              '**Enfoques comunes**:\n'
              '- Manual: Implementar toJson() como en el ejemplo anterior\n'
              '- Automática: Usar paquetes como json_serializable\n\n'
              '**Consideraciones importantes**:\n'
              '- Tipos complejos requieren conversión manual\n'
              '- Los nombres de campos deben coincidir con el API\n'
              '- Manejar valores nulos adecuadamente\n\n'
              'Ejemplo avanzado: Serializar fechas, enumeraciones o objetos anidados requiere atención especial.',
      'img_url': '',
      'code_example': '''
// Ejemplo con json_serializable (más eficiente para clases complejas)

// 1. Añadir dependencias en pubspec.yaml:
// dependencies:
//   json_annotation: ^4.8.0
//
// dev_dependencies:
//   build_runner: ^2.4.4
//   json_serializable: ^6.7.0

// 2. Clase con anotaciones (@JsonSerializable)
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart'; // Archivo generado

@JsonSerializable()
class Product {
  final String id;
  final String name;
  final double price;
  final DateTime createdAt;
  
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.createdAt,
  });
  
  // 3. Generar los métodos (ejecutar en terminal):
  // flutter pub run build_runner build
  
  factory Product.fromJson(Map<String, dynamic> json) => _ProductFromJson(json);
  Map<String, dynamic> toJson() => _ProductToJson(this);
}

// Uso:
void main() {
  final product = Product(
    id: '123',
    name: 'Laptop',
    price: 999.99,
    createdAt: DateTime.now(),
  );
  
  final json = product.toJson();
 debugPrint(json); // Map correctamente formateado
  
  final product2 = Product.fromJson(json);
 debugPrint(product2.name); // Laptop
}
''',
    });

    // Deserialización de JSON a Objetos
    await db.insert('detail', {
      'id': 3,
      'subtopic_id': 's03t01l04',
      'module': 'Mid',
      'definition':
          'Deserializar es el proceso inverso: convertir JSON en objetos Dart. Es como desempaquetar una caja que recibiste y organizar su contenido.\n\n'
              '**Retos comunes**:\n'
              '- Campos opcionales o nulos\n'
              '- Tipos de datos inesperados\n'
              '- Fechas en diferentes formatos\n'
              '- Anidamiento profundo de objetos\n\n'
              '**Buenas prácticas**:\n'
              '- Validar datos antes de convertirlos\n'
              '- Usar try/catch para manejar errores\n'
              '- Considerar valores por defecto para campos opcionales\n\n'
              'Ejemplo: APIs mal diseñadas pueden devolver el mismo campo como string o número dependiendo del caso.',
      'img_url': '',
      'code_example': '''
// Ejemplo robusto de deserialización con manejo de errores
class UserProfile {
  final String id;
  final String name;
  final int? age; // Campo opcional
  final DateTime signUpDate;
  final List<String> permissions;
  
  UserProfile({
    required this.id,
    required this.name,
    this.age,
    required this.signUpDate,
    required this.permissions,
  });
  
  factory UserProfile.fromJson(Map<String, dynamic> json) {
    // Validación básica
    if (json['id'] == null || json['name'] == null) {
      throw FormatException('Campos requeridos faltantes');
    }
    
    // Manejo de campos opcionales
    int? age;
    if (json['age'] != null) {
      age = int.tryParse(json['age'].toString());
    }
    
    // Conversión de fecha
    DateTime signUpDate;
    try {
      signUpDate = DateTime.parse(json['signUpDate']);
    } catch (e) {
      signUpDate = DateTime.now(); // Valor por defecto
    }
    
    // Lista con valor por defecto
    final permissions = json['permissions'] is List
        ? List<String>.from(json['permissions'])
        : <String>[];
    
    return UserProfile(
      id: json['id'],
      name: json['name'],
      age: age,
      signUpDate: signUpDate,
      permissions: permissions,
    );
  }
}

void main() {
  final json = ''{
    "id": "user123",
    "name": "Ana López",
    "age": "30", // ¡Número como string!
    "signUpDate": "2023-05-15",
    "permissions": ["read", "write"]
  }
  '';
  

''',
    });
  }

  Future<void> _insertDetailsMidTopic2Level4(Database db) async {
    // Introducción a las APIs RESTful
    await db.insert('detail', {
      'id': 1,
      'subtopic_id': 's01t02l04',
      'module': 'Mid',
      'definition':
          'REST es el estándar para diseñar APIs web. Imagina un restaurante: tú (cliente) haces pedidos (requests) al mesero (API) que interactúa con la cocina (servidor).\n\n'
              '**Principios REST**:\n'
              '- URLs como recursos (/users, /posts)\n'
              '- Verbos HTTP (GET, POST, PUT, DELETE)\n'
              '- Stateless: cada request es independiente\n'
              '- Representación JSON (generalmente)\n\n'
              '**Ventajas**:\n'
              '- Escalable\n'
              '- Simple de entender\n'
              '- Compatible con muchos lenguajes\n\n'
              'Sin REST, cada API tendría su propio estilo, haciendo el desarrollo más lento y propenso a errores.',
      'img_url': '',
      'code_example': '''
// Ejemplo de endpoints REST típicos:
/*
GET    /users       - Listar usuarios
POST   /users       - Crear usuario
GET    /users/{id}  - Obtener usuario específico
PUT    /users/{id}  - Actualizar usuario
DELETE /users/{id}  - Eliminar usuario
*/

// Ejemplo con el paquete http
import 'package:http/http.dart' as http;

Future<void> fetchUsers() async {
  final response = await http.get(
    Uri.parse('https://api.example.com/users'),
    headers: {'Authorization': 'Bearer token123'},
  );
  
  if (response.statusCode == 200) {
    final List<dynamic> users = jsonDecode(response.body);
   debugPrint('Usuarios: \$users');
  } else {
    throw Exception('Error al cargar usuarios');
  }
}

// Uso de parámetros de query
Future<void> searchProducts(String query) async {
  final url = Uri.parse('https://api.example.com/products')
      .replace(queryParameters: {'q': query, 'limit': '10'});
  
  final response = await http.get(url);
  // ... manejar respuesta
}
''',
    });

    // Uso de http para consumir APIs RESTful
    await db.insert('detail', {
      'id': 2,
      'subtopic_id': 's02t02l04',
      'module': 'Mid',
      'definition':
          'El paquete http es la forma más básica de hacer requests en Dart. Es como un teléfono básico: hace lo esencial sin complicaciones.\n\n'
              '**Operaciones básicas**:\n'
              '- GET: Obtener datos\n'
              '- POST: Crear recursos\n'
              '- PUT/PATCH: Actualizar\n'
              '- DELETE: Eliminar\n\n'
              '**Mejores prácticas**:\n'
              '- Usar async/await\n'
              '- Verificar statusCode\n'
              '- Manejar errores adecuadamente\n'
              '- Usar headers para autenticación\n\n'
              'Para apps complejas, considera paquetes como dio que ofrecen más funcionalidades.',
      'img_url': '',
      'code_example': '''
// Ejemplo completo con POST y manejo de errores
class ApiService {
  static const String _baseUrl = 'https://api.example.com';
  static const Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
  
  static Future<Map<String, dynamic>> post(
    String endpoint,
    Map<String, dynamic> body,
    String? token,
  ) async {
    try {
      final headers = {..._headers};
      if (token != null) {
        headers['Authorization'] = 'Bearer \$token';
      }
      
      final response = await http.post(
        Uri.parse('_baseUrl/\$endpoint'),
        headers: headers,
        body: jsonEncode(body),
      );
      
      final responseData = jsonDecode(response.body);
      
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return responseData;
      } else {
        throw ApiException(
          statusCode: response.statusCode,
          message: responseData['message'] ?? 'Error desconocido',
        );
      }
    } on SocketException {
      throw ApiException(message: 'No hay conexión a internet');
    } on FormatException {
      throw ApiException(message: 'Respuesta inválida del servidor');
    } catch (e) {
      throw ApiException(message: 'Error inesperado: \$e');
    }
  }
}

class ApiException implements Exception {
  final int? statusCode;
  final String message;
  
  ApiException({this.statusCode, required this.message});
  
  @override
  String toString() => 'ApiException: \$message (\$statusCode)';
}

// Uso:
void createUser() async {
  try {
    final data = await ApiService.post('users', {
      'name': 'Carlos',
      'email': 'carlos@example.com',
    }, null);
    
   debugPrint('Usuario creado: {data['id']}');
  } on ApiException catch (e) {
   debugPrint('Error: {e.message}');
  }
}
''',
    });

    // Manejo de Respuestas y Errores en APIs RESTful
    await db.insert('detail', {
      'id': 3,
      'subtopic_id': 's03t02l04',
      'module': 'Mid',
      'definition':
          'Manejar correctamente las respuestas y errores es crucial para una buena UX. Es como conducir: necesitas saber reaccionar ante semáforos (respuestas) y obstáculos (errores).\n\n'
              '**Tipos comunes de respuestas**:\n'
              '- 2xx: Éxito (200 OK, 201 Created)\n'
              '- 4xx: Errores del cliente (400 Bad Request, 401 Unauthorized)\n'
              '- 5xx: Errores del servidor (500 Internal Server Error)\n\n'
              '**Estrategias de manejo**:\n'
              '- Mostrar feedback al usuario\n'
              '- Loggear errores para debug\n'
              '- Reintentar peticiones fallidas cuando sea apropiado\n'
              '- Cachear respuestas exitosas\n\n'
              'Ejemplo: Un error 401 debería redirigir al login, mientras que un 500 podría mostrar un mensaje amigable.',
      'img_url': '',
      'code_example': '''
// Ejemplo avanzado de manejo de errores
enum ApiErrorType {
  network,
  unauthorized,
  notFound,
  server,
  validation,
  unknown,
}

class ApiResponse<T> {
  final T? data;
  final ApiError? error;
  final bool isSuccess;
  
  ApiResponse.success(this.data) 
      : error = null, isSuccess = true;
  
  ApiResponse.failure(this.error) 
      : data = null, isSuccess = false;
}

class ApiError {
  final ApiErrorType type;
  final String message;
  final int? statusCode;
  final dynamic details;
  
  ApiError({
    required this.type,
    required this.message,
    this.statusCode,
    this.details,
  });
}

class UserRepository {
  final ApiService api;
  
  UserRepository(this.api);
  
  Future<ApiResponse<User>> getUser(String userId) async {
    try {
      final data = await api.get('users/\$userId');
      return ApiResponse.success(User.fromJson(data));
    } on ApiException catch (e) {
      ApiErrorType type;
      
      switch (e.statusCode) {
        case 401:
          type = ApiErrorType.unauthorized;
          break;
        case 404:
          type = ApiErrorType.notFound;
          break;
        case 422:
          type = ApiErrorType.validation;
          break;
        case 500:
          type = ApiErrorType.server;
          break;
        default:
          type = ApiErrorType.unknown;
      }
      
      return ApiResponse.failure(
        ApiError(
          type: type,
          message: e.message,
          statusCode: e.statusCode,
        ),
      );
    } on SocketException {
      return ApiResponse.failure(
        ApiError(
          type: ApiErrorType.network,
          message: 'No hay conexión a internet',
        ),
      );
    }
  }
}

// Uso en UI
class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final UserRepository _repo = UserRepository(ApiService());
  late ApiResponse<User> _response;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    setState(() => _response = ApiResponse.loading());
    _response = await _repo.getUser('123');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _response.when(
          loading: () => CircularProgressIndicator(),
          success: (user) => UserProfileView(user: user),
          failure: (error) => ErrorView(
            error: error,
            onRetry: _loadUser,
          ),
        ),
      ),
    );
  }
}
''',
    });
  }

  Future<void> insertDetailsMidLevel5(Database db) async {
    try {
      await _insertDetailsMidTopic1Level5(db); // Firestore
      await _insertDetailsMidTopic2Level5(db); // Autenticación
      await _insertDetailsMidTopic3Level5(db); // Notificaciones Push
      await _insertDetailsMidTopic4Level5(db); // Configuración Remota
      await _insertDetailsMidTopic5Level5(db); // Cloud Functions
    } catch (e) {
      debugPrint("Error inserting details mid level 5: $e");
    }
  }

  Future<void> _insertDetailsMidTopic1Level5(Database db) async {
    // Introducción a Firestore
    await db.insert('detail', {
      'id': 1,
      'subtopic_id': 's01t01l05',
      'module': 'Mid',
      'definition':
          'Firestore es una base de datos NoSQL en la nube que sincroniza datos en tiempo real entre clientes. Imagínalo como un Google Docs para datos de tu app - todos ven los cambios al instante.\n\n'
              '**Características clave**:\n'
              '- Datos organizados en colecciones/documentos\n'
              '- Sincronización en tiempo real\n'
              '- Escalabilidad automática\n'
              '- Offline support\n\n'
              '**Diferencias con SQL**:\n'
              '- Sin tablas fijas\n'
              '- Sin joins complejos\n'
              '- Optimizado para escalar horizontalmente\n\n'
              'Ejemplo típico: Una app de chat donde todos ven los nuevos mensajes inmediatamente sin necesidad de refrescar.',
      'img_url': '',
      'code_example': '''
// Configuración básica en main.dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// Ejemplo de operaciones CRUD con Firestore
class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Crear documento
  Future<void> addUser(User user) async {
    await _firestore.collection('users').doc(user.id).set(user.toMap());
  }

  // Leer documento
  Future<User?> getUser(String userId) async {
    final doc = await _firestore.collection('users').doc(userId).get();
    return doc.exists ? User.fromMap(doc.data()!) : null;
  }

  // Actualizar documento
  Future<void> updateUserEmail(String userId, String newEmail) async {
    await _firestore.collection('users').doc(userId).update({'email': newEmail});
  }

  // Eliminar documento
  Future<void> deleteUser(String userId) async {
    await _firestore.collection('users').doc(userId).delete();
  }

  // Escuchar cambios en tiempo real
  Stream<List<User>> listenToUsers() {
    return _firestore.collection('users').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => User.fromMap(doc.data())).toList());
  }
}

// Modelo de usuario
class User {
  final String id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'email': email};
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
    );
  }
}
''',
    });

    // Creación y Gestión de Colecciones
    await db.insert('detail', {
      'id': 2,
      'subtopic_id': 's02t01l05',
      'module': 'Mid',
      'definition':
          'Las colecciones en Firestore son como carpetas que contienen documentos (archivos). La estructura típica es: `colección > documento > subcolección > subdocumento`.\n\n'
              '**Mejores prácticas**:\n'
              '- Planifica tu estructura de datos primero\n'
              '- Evite anidamiento demasiado profundo (max 3-5 niveles)\n'
              '- Usa IDs significativos cuando sea posible\n'
              '- Considera duplicar datos para evitar joins costosos\n\n'
              '**Patrones comunes**:\n'
              '1. Raíz: `users/{userId}`\n'
              '2. Subcolecciones: `users/{userId}/posts/{postId}`\n'
              '3. Colecciones separadas: `posts/{postId}` con referencia a usuario\n\n'
              'Ejemplo avanzado: Una app de blog podría tener posts como subcolecciones de usuarios o como colección separada con campo userId.',
      'img_url': '',
      'code_example': '''
// Estructura de datos para app de e-commerce
class FirestoreStructure {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Obtener todos los productos de una categoría
  Stream<List<Product>> getProductsByCategory(String categoryId) {
    return _firestore
        .collection('categories')
        .doc(categoryId)
        .collection('products')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Product.fromMap(doc.data()))
            .toList());
  }

  // Obtener órdenes de un usuario
  Stream<List<Order>> getUserOrders(String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('orders')
        .orderBy('createdAt', descending: true)
        .limit(20)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Order.fromMap(doc.data()))
            .toList());
  }

  // Búsqueda de productos con filtros
  Future<List<Product>> searchProducts({
    String? query,
    double? minPrice,
    double? maxPrice,
  }) async {
    Query productsQuery = _firestore.collectionGroup('products');
    
    if (query != null) {
      productsQuery = productsQuery
          .where('keywords', arrayContains: query.toLowerCase());
    }
    
    if (minPrice != null) {
      productsQuery = productsQuery.where('price', isGreaterThanOrEqualTo: minPrice);
    }
    
    if (maxPrice != null) {
      productsQuery = productsQuery.where('price', isLessThanOrEqualTo: maxPrice);
    }
    
    final snapshot = await productsQuery.limit(50).get();
    return snapshot.docs.map((doc) => Product.fromMap(doc.data())).toList();
  }
}

// Modelos
class Product {
  final String id;
  final String name;
  final double price;
  // ... otros campos

  // fromMap/toMap similares a User
}

class Order {
  final String id;
  final DateTime createdAt;
  // ... otros campos

  // fromMap/toMap
}
''',
    });

    // Consultas Básicas y Avanzadas
    await db.insert('detail', {
      'id': 3,
      'subtopic_id': 's03t01l05',
      'module': 'Mid',
      'definition':
          'Firestore permite consultas flexibles pero con limitaciones importantes. Es como un buscador avanzado con reglas específicas sobre cómo puedes buscar.\n\n'
              '**Limitaciones clave**:\n'
              '- Solo un campo de desigualdad por consulta (<, >, <=, >=)\n'
              '- Las consultas compuestas necesitan índices\n'
              '- Los OR lógicos requieren múltiples consultas\n'
              '- Límite de 1MB por resultado\n\n'
              '**Técnicas avanzadas**:\n'
              '- Paginación con startAfter\n'
              '- Uso de collectionGroup para buscar en todas las subcolecciones\n'
              '- Prefiltrado en el cliente cuando sea posible\n'
              '- Denormalización de datos para consultas eficientes\n\n'
              'Ejemplo: Para buscar productos entre \$10 y \$50 con rating >4, necesitarías estructurar tus datos cuidadosamente.',
      'img_url': '',
      'code_example': '''
// Ejemplos de consultas avanzadas
class FirestoreQueries {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Paginación
  Future<List<Product>> getProductsPaginated({
    required int limit,
    Product? lastProduct,
  }) async {
    Query query = _firestore
        .collection('products')
        .orderBy('price')
        .limit(limit);
    
    if (lastProduct != null) {
      query = query.startAfter([lastProduct.price]);
    }
    
    final snapshot = await query.get();
    return snapshot.docs.map((doc) => Product.fromMap(doc.data())).toList();
  }

  // Consulta compuesta con índice
  Future<List<Product>> getFeaturedProducts() async {
    // Requiere índice en Firestore: category ASC, isFeatured DESC, rating DESC
    final snapshot = await _firestore
        .collection('products')
        .where('category', isEqualTo: 'electronics')
        .where('isFeatured', isEqualTo: true)
        .orderBy('rating', descending: true)
        .limit(10)
        .get();
    
    return snapshot.docs.map((doc) => Product.fromMap(doc.data())).toList();
  }

  // Consulta con arrayContains
  Future<List<Product>> getProductsWithTags(List<String> tags) async {
    final snapshot = await _firestore
        .collection('products')
        .where('tags', arrayContainsAny: tags)
        .get();
    
    return snapshot.docs.map((doc) => Product.fromMap(doc.data())).toList();
  }

  // Consulta geográfica (usando Geohash)
  Future<List<Store>> getNearbyStores(double lat, double lng, double radiusInKm) async {
    // Implementación requiere geohash y cálculos adicionales
    // Ver: https://firebase.google.com/docs/firestore/solutions/geoqueries
  }
}

// Técnica de "query splitting" para OR lógico
Future<List<Product>> getProductsOnSaleOrFeatured() async {
  final featured = await _firestore
      .collection('products')
      .where('isFeatured', isEqualTo: true)
      .get();
  
  final onSale = await _firestore
      .collection('products')
      .where('isOnSale', isEqualTo: true)
      .get();
  
  // Combinar resultados y eliminar duplicados
  final all = [...featured.docs, ...onSale.docs];
  final uniqueIds = <String>{};
  final uniqueProducts = <Product>[];
  
  for (final doc in all) {
    if (uniqueIds.add(doc.id)) {
      uniqueProducts.add(Product.fromMap(doc.data()));
    }
  }
  
  return uniqueProducts;
}
''',
    });
  }

  Future<void> _insertDetailsMidTopic2Level5(Database db) async {
    // Introducción a Firebase Authentication
    await db.insert('detail', {
      'id': 1,
      'subtopic_id': 's01t02l05',
      'module': 'Mid',
      'definition':
          'Firebase Auth proporciona autenticación lista para usar. Es como un portero digital que maneja el registro y acceso de usuarios por ti.\n\n'
              '**Características**:\n'
              '- Múltiples proveedores (email, Google, Facebook, etc.)\n'
              '- Administración de usuarios en Firebase Console\n'
              '- Funciones de seguridad (verificación email, recuperación contraseña)\n'
              '- Integración con otros servicios Firebase\n\n'
              '**Flujo típico**:\n'
              '1. Usuario inicia sesión\n'
              '2. Firebase devuelve un token JWT\n'
              '3. Token se usa para autenticar con Firestore/Storage\n'
              '4. Reglas de seguridad protegen los datos\n\n'
              'Sin Firebase Auth, tendrías que implementar todo esto manualmente, incluyendo la seguridad.',
      'img_url': '',
      'code_example': '''
// Configuración básica
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Estado de autenticación
  Stream<User?> get user => _auth.authStateChanges();

  // Registro con email/contraseña
  Future<UserCredential> signUpWithEmail(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromFirebase(e);
    }
  }

  // Inicio de sesión
  Future<UserCredential> signInWithEmail(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromFirebase(e);
    }
  }

  // Cerrar sesión
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Proveedores externos (Google)
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
    
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    
    return await _auth.signInWithCredential(credential);
  }
}

// Manejo de errores personalizado
class AuthException implements Exception {
  final String code;
  final String message;

  AuthException({required this.code, required this.message});

  factory AuthException.fromFirebase(FirebaseAuthException e) {
    String message;
    switch (e.code) {
      case 'email-already-in-use':
        message = 'Este email ya está registrado';
        break;
      case 'invalid-email':
        message = 'Email inválido';
        break;
      case 'weak-password':
        message = 'La contraseña es muy débil';
        break;
      case 'user-not-found':
        message = 'Usuario no encontrado';
        break;
      case 'wrong-password':
        message = 'Contraseña incorrecta';
        break;
      default:
        message = 'Error desconocido';
    }
    return AuthException(code: e.code, message: message);
  }
}

// Uso en UI
class LoginScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(controller: _emailController),
            TextField(controller: _passwordController, obscureText: true),
            ElevatedButton(
              onPressed: () async {
                try {
                  await _auth.signInWithEmail(
                    _emailController.text,
                    _passwordController.text,
                  );
                  Navigator.pushReplacementNamed(context, '/home');
                } on AuthException catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(e.message)),
                  );
                }
              },
              child: Text('Iniciar sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
''',
    });

    // Autenticación con Correo y Contraseña
    await db.insert('detail', {
      'id': 2,
      'subtopic_id': 's02t02l05',
      'module': 'Mid',
      'definition':
          'El método más tradicional pero aún importante. Firebase maneja todo el flujo seguro por ti:\n\n'
              '1. Hash seguro de contraseñas\n'
              '2. Verificación de email\n'
              '3. Prevención de ataques por fuerza bruta\n'
              '4. Funciones de recuperación\n\n'
              '**Consideraciones de seguridad**:\n'
              '- Nunca almacenes contraseñas en texto plano\n'
              '- Usa HTTPS siempre\n'
              '- Implementa verificación de email\n'
              '- Considera 2FA para datos sensibles\n\n'
              '**Flujo recomendado**:\n'
              'Registro > Email de verificación > Inicio de sesión > Acceso a datos protegidos',
      'img_url': '',
      'code_example': '''
// Extensión del AuthService para manejo completo
extension EmailAuth on AuthService {
  // Enviar email de verificación
  Future<void> sendEmailVerification() async {
    final user = _auth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  // Restablecer contraseña
  Future<void> sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  // Verificar si el email está verificado
  bool get isEmailVerified {
    return _auth.currentUser?.emailVerified ?? false;
  }

  // Actualizar email
  Future<void> updateEmail(String newEmail) async {
    final user = _auth.currentUser;
    if (user != null) {
      await user.verifyBeforeUpdateEmail(newEmail);
    }
  }

  // Actualizar contraseña
  Future<void> updatePassword(String newPassword) async {
    final user = _auth.currentUser;
    if (user != null) {
      await user.updatePassword(newPassword);
    }
  }
}

// Ejemplo de flujo completo
class AuthFlowScreen extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: _auth.user,
      builder: (context, snapshot) {
        final user = snapshot.data;
        
        if (user == null) {
          return LoginScreen();
        } else if (!user.emailVerified) {
          return EmailVerificationScreen(user: user);
        } else {
          return HomeScreen(user: user);
        }
      },
    );
  }
}

class EmailVerificationScreen extends StatelessWidget {
  final User user;
  
  EmailVerificationScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Por favor verifica tu email: {user.email}'),
            ElevatedButton(
              onPressed: () async {
                await user.reload(); // Refrescar estado de verificación
                if (user.emailVerified) {
                  Navigator.pushReplacementNamed(context, '/home');
                }
              },
              child: Text('Ya verifiqué mi email'),
            ),
            TextButton(
              onPressed: () => AuthService().sendEmailVerification(),
              child: Text('Reenviar email de verificación'),
            ),
          ],
        ),
      ),
    );
  }
}
''',
    });

    // Autenticación con Proveedores Externos
    await db.insert('detail', {
      'id': 3,
      'subtopic_id': 's03t02l05',
      'module': 'Mid',
      'definition':
          'Los proveedores externos (OAuth) permiten inicio de sesión con cuentas existentes. Ventajas:\n\n'
              '- Mayor conversión (menos fricción)\n'
              '- Sin manejo de contraseñas\n'
              '- Datos básicos del perfil automáticos\n'
              '- Más seguro (credenciales gestionadas por expertos)\n\n'
              '**Proveedores soportados**:\n'
              '- Google, Facebook, Twitter, GitHub\n'
              '- Apple (requerido para apps iOS)\n'
              '- Microsoft, Yahoo, y más\n\n'
              '**Flujo OAuth típico**:\n'
              '1. App redirige al proveedor\n'
              '2. Usuario inicia sesión y da permisos\n'
              '3. Proveedor redirige de vuelta con token\n'
              '4. Firebase valida el token y crea sesión',
      'img_url': '',
      'code_example': '''
// Configuración para múltiples proveedores
extension ExternalAuth on AuthService {
  Future<UserCredential> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      final credential = FacebookAuthProvider.credential(result.accessToken!.token);
      return _auth.signInWithCredential(credential);
    }
    throw AuthException(code: result.status.toString(), message: 'Error en login con Facebook');
  }

  Future<UserCredential> signInWithApple() async {
    final appleProvider = AppleAuthProvider();
    if (Platform.isIOS) {
      return await _auth.signInWithProvider(appleProvider);
    }
    throw AuthException(code: 'unsupported-platform', message: 'Apple Sign-In solo disponible en iOS');
  }

  Future<UserCredential> signInWithTwitter() async {
    final twitterAuth = TwitterAuth(
      apiKey: 'your_api_key',
      apiSecretKey: 'your_api_secret',
      redirectURI: 'your_redirect_uri',
    );
    final authClient = await twitterAuth.loginV2();
    final credential = TwitterAuthProvider.credential(
      accessToken: authClient.authToken!,
      secret: authClient.authTokenSecret!,
    );
    return _auth.signInWithCredential(credential);
  }
}

// Pantalla de selección de proveedores
class ProviderLoginScreen extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                try {
                  await _auth.signInWithGoogle();
                  Navigator.pushReplacementNamed(context, '/home');
                } on AuthException catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(e.message)),
                  );
                }
              },
              child: Text('Continuar con Google'),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  await _auth.signInWithFacebook();
                  Navigator.pushReplacementNamed(context, '/home');
                } on AuthException catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(e.message)),
                  );
                }
              },
              child: Text('Continuar con Facebook'),
            ),
            if (Platform.isIOS)
              ElevatedButton(
                onPressed: () async {
                  try {
                    await _auth.signInWithApple();
                    Navigator.pushReplacementNamed(context, '/home');
                  } on AuthException catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(e.message)),
                    );
                  }
                },
                child: Text('Continuar con Apple'),
              ),
          ],
        ),
      ),
    );
  }
}

// Vinculación de múltiples proveedores
Future<void> linkGoogleAccount() async {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await user.linkWithCredential(credential);
  }
}
''',
    });
  }

  Future<void> _insertDetailsMidTopic3Level5(Database db) async {
    // Introducción a las Notificaciones Push
    await db.insert('detail', {
      'id': 1,
      'subtopic_id': 's01t03l05',
      'module': 'Mid',
      'definition':
          'Las notificaciones push son mensajes que llegan a tu app incluso cuando no está en uso. Firebase Cloud Messaging (FCM) es el servicio que maneja este proceso.\n\n'
              '**Casos de uso comunes**:\n'
              '- Recordatorios y alertas\n'
              '- Actualizaciones en tiempo real\n'
              '- Promociones y marketing\n'
              '- Mensajes entre usuarios\n\n'
              '**Componentes clave**:\n'
              '- Dispositivo: Instala la app y recibe tokens únicos\n'
              '- Servidor: Envía mensajes a través de FCM\n'
              '- FCM: Gestiona la entrega a dispositivos\n'
              '- App cliente: Maneja la recepción y visualización',
      'img_url': '',
      'code_example': '''
// Configuración básica en main.dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  // Configurar FCM
  final fcmToken = await FirebaseMessaging.instance.getToken();
 debugPrint('FCM Token: \$fcmToken'); // Guardar este token en tu backend
  
  // Manejar mensajes en segundo plano
  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessage);
  
  runApp(MyApp());
}

// Manejador de mensajes en segundo plano
@pragma('vm:entry-point')
Future<void> _firebaseBackgroundMessage(RemoteMessage message) async {
  await Firebase.initializeApp();
 debugPrint('Mensaje en background: {message.notification?.title}');
}

// En tu clase de mensajería
class MessagingService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  // Configurar notificaciones
  Future<void> setup() async {
    // Solicitar permisos (iOS/macOS)
    final settings = await _fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    
   debugPrint('Permisos: {settings.authorizationStatus}');
    
    // Escuchar mensajes en primer plano
    FirebaseMessaging.onMessage.listen((message) {
     debugPrint('Mensaje en primer plano: {message.notification?.body}');
      // Mostrar notificación local
      showFlutterNotification(message);
    });
    
    // Manejar cuando se toca la notificación
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
     debugPrint('Notificación abierta: {message.data}');
      // Navegar a pantalla relevante
    });
    
    // Obtener mensaje inicial cuando la app se abre desde terminada
    final initialMessage = await _fcm.getInitialMessage();
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }
  }
  
  void showFlutterNotification(RemoteMessage message) {
    LocalNotifications.show(
      message.notification?.title ?? 'Nueva notificación',
      message.notification?.body ?? '',
      payload: jsonEncode(message.data),
    );
  }
  
  void _handleMessage(RemoteMessage message) {
    // Implementar lógica de navegación basada en message.data
  }
}

// Ejemplo de envío desde tu backend (Node.js)
/*
const admin = require('firebase-admin');
admin.initializeApp();

const message = {
  notification: {
    title: '¡Oferta especial!',
    body: 'Tienes un 20% de descuento hoy'
  },
  token: 'FCM_TOKEN_DEL_DISPOSITIVO'
};

admin.messaging().send(message)
  .then(response => console.log('Enviado:', response))
  .catch(error => console.error('Error:', error));
*/
''',
    });

    // Configuración de Firebase Cloud Messaging
    await db.insert('detail', {
      'id': 2,
      'subtopic_id': 's02t03l05',
      'module': 'Mid',
      'definition':
          'Configurar FCM correctamente requiere varios pasos en diferentes plataformas. Es como instalar un sistema de correo interno que necesita permisos especiales en cada departamento (plataforma).\n\n'
              '**Pasos esenciales**:\n'
              '1. Android: Añadir google-services.json y configurar el canal de notificaciones\n'
              '2. iOS: Configurar APNs y permisos en Info.plist\n'
              '3. Web: Configurar el manifiesto y service worker\n'
              '4. Flutter: Añadir paquetes y manejar permisos\n\n'
              '**Configuración avanzada**:\n'
              '- Temas (topics) para enviar a grupos de usuarios\n'
              '- Mensajes condicionales con data payload\n'
              '- Notificaciones programadas\n'
              '- Imágenes y acciones en notificaciones',
      'img_url': '',
      'code_example': '''
// Configuración avanzada de FCM
extension AdvancedFCM on MessagingService {
  // Suscribir a temas
  Future<void> subscribeToTopic(String topic) async {
    await _fcm.subscribeToTopic(topic);
  }

  // Cancelar suscripción
  Future<void> unsubscribeFromTopic(String topic) async {
    await _fcm.unsubscribeFromTopic(topic);
  }

  // Manejar tokens de dispositivo
  Future<void> monitorTokenRefresh() async {
    _fcm.onTokenRefresh.listen((newToken) {
     debugPrint('Nuevo FCM token: \$newToken');
      // Actualizar token en tu backend
      _updateTokenOnServer(newToken);
    });
  }

  // Enviar mensajes con data payload
  Future<void> sendDataMessage({
    required String token,
    required Map<String, String> data,
  }) async {
    // En implementación real, esto se haría desde tu backend
   debugPrint('Simulando envío de mensaje con data: \$data');
  }

  // Configurar canal de notificaciones (Android)
  Future<void> setupNotificationChannel() async {
    if (Platform.isAndroid) {
      const channel = AndroidNotificationChannel(
        'high_importance_channel',
        'Notificaciones importantes',
        importance: Importance.max,
      );
      
      await _fcm.createNotificationChannel(channel);
    }
  }
}

// Ejemplo de mensaje con data payload
void sendOrderUpdateNotification(String userId, String orderId, String status) {
  final message = {
    'notification': {
      'title': 'Actualización de pedido',
      'body': 'Tu pedido #\$orderId está ahora en estado: \$status',
    },
    'data': {
      'type': 'order_update',
      'order_id': orderId,
      'status': status,
      'click_action': 'FLUTTER_NOTIFICATION_CLICK',
    },
    'token': 'USER_FCM_TOKEN',
  };
  
  // Enviar a través de tu backend
}

// Manejo de acciones en notificaciones
void handleNotificationActions() {
  FirebaseMessaging.onMessageOpenedApp.listen((message) {
    final data = message.data;
    if (data['type'] == 'order_update') {
      Navigator.pushNamed(
        context,
        '/order',
        arguments: data['order_id'],
      );
    }
  });
}
''',
    });

    // Recepción y Manejo de Notificaciones Push
    await db.insert('detail', {
      'id': 3,
      'subtopic_id': 's03t03l05',
      'module': 'Mid',
      'definition':
          'Manejar correctamente las notificaciones es crucial para la experiencia de usuario. Debes considerar:\n\n'
              '- Primer plano: Mostrar notificaciones cuando la app está activa\n'
              '- Segundo plano: Manejar el clic en la notificación\n'
              '- App terminada: Recuperar el mensaje inicial\n'
              '- Personalización: Iconos, sonidos, vibración\n\n'
              '**Problemas comunes**:\n'
              '- Notificaciones duplicadas\n'
              '- Navegación incorrecta al hacer clic\n'
              '- Permisos no solicitados en iOS\n'
              '- Iconos blancos en Android\n\n'
              'Solución: Usar paquetes como flutter_local_notifications para un control más fino.',
      'img_url': '',
      'code_example': '''
// Configuración completa con flutter_local_notifications
class LocalNotifications {
  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const ios = DarwinInitializationSettings();
    const settings = InitializationSettings(android: android, iOS: ios);
    
    await _plugin.initialize(
      settings,
      onDidReceiveNotificationResponse: (response) {
        // Manejar clic en notificación local
        final payload = response.payload;
        if (payload != null) {
          _handleNotificationPayload(payload);
        }
      },
    );
  }

  static Future<void> show(String title, String body, {String? payload}) async {
    const android = AndroidNotificationDetails(
      'channel_id',
      'Channel Name',
      importance: Importance.max,
      priority: Priority.high,
    );
    
    const ios = DarwinNotificationDetails();
    const details = NotificationDetails(android: android, iOS: ios);
    
    await _plugin.show(
      Random().nextInt(1000), // ID único
      title,
      body,
      details,
      payload: payload,
    );
  }

  static void _handleNotificationPayload(String payload) {
    try {
      final data = jsonDecode(payload) as Map<String, dynamic>;
      // Navegar según el tipo de notificación
      if (data['type'] == 'chat') {
        navigatorKey.currentState?.pushNamed('/chat', arguments: data['chat_id']);
      }
    } catch (e) {
     debugPrint('Error al manejar payload: \$e');
    }
  }
}

// Integración con FCM
void setupFCMWithLocalNotifications() {
  final messaging = FirebaseMessaging.instance;
  
  // Configurar FCM para mostrar notificaciones locales
  FirebaseMessaging.onMessage.listen((message) {
    final notification = message.notification;
    if (notification != null) {
      LocalNotifications.show(
        notification.title ?? 'Nueva notificación',
        notification.body ?? '',
        payload: jsonEncode(message.data),
      );
    }
  });
  
  // Manejar clic en notificaciones
  FirebaseMessaging.onMessageOpenedApp.listen((message) {
    _handleNotificationData(message.data);
  });
}

void _handleNotificationData(Map<String, dynamic> data) {
  // Implementar lógica de navegación basada en los datos
  if (data['screen'] == 'profile') {
    navigatorKey.currentState?.pushNamed('/profile', arguments: data['user_id']);
  }
}

// En main.dart
final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  // Inicializar notificaciones locales
  await LocalNotifications.initialize();
  
  // Configurar FCM
  setupFCMWithLocalNotifications();
  
  runApp(
    MaterialApp(
      navigatorKey: navigatorKey,
      home: MyApp(),
    ),
  );
}
''',
    });
  }

  Future<void> _insertDetailsMidTopic4Level5(Database db) async {
    // Introducción a Firebase Remote Config
    await db.insert('detail', {
      'id': 1,
      'subtopic_id': 's01t04l05',
      'module': 'Mid',
      'definition':
          'Remote Config te permite cambiar el comportamiento y apariencia de tu app sin publicar actualizaciones. Es como un panel de control remoto para tu aplicación.\n\n'
              '**Casos de uso típicos**:\n'
              '- Pruebas A/B de características\n'
              '- Activación/desactivación de funciones\n'
              '- Cambios de texto o estilos\n'
              '- Lógica condicional sin actualizar\n\n'
              '**Cómo funciona**:\n'
              '1. Defines parámetros en Firebase Console\n'
              '2. Configuras valores por defecto en la app\n'
              '3. La app busca actualizaciones periódicamente\n'
              '4. Los cambios se aplican sin necesidad de update\n\n'
              'Limitación: Los cambios no son instantáneos (pueden tardar hasta 12 horas en propagarse).',
      'img_url': '',
      'code_example': '''
// Configuración básica de Remote Config
class RemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;
  
  Future<void> initialize() async {
    // Configurar valores por defecto
    await _remoteConfig.setDefaults({
      'welcome_message': 'Bienvenido a nuestra app',
      'feature_enabled': false,
      'main_color': '#4285F4',
    });
    
    // Configurar tiempos de expiración (en segundos)
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10).inSeconds,
      minimumFetchInterval: const Duration(hours: 1).inSeconds,
    ));
    
    // Buscar y activar configuraciones
    await _fetchAndActivate();
  }
  
  Future<void> _fetchAndActivate() async {
    try {
      await _remoteConfig.fetchAndActivate();
    } catch (e) {
     debugPrint('Error al obtener Remote Config: \$e');
    }
  }
  
  // Obtener valores
  String get welcomeMessage => _remoteConfig.getString('welcome_message');
  bool get isFeatureEnabled => _remoteConfig.getBool('feature_enabled');
  Color get mainColor => _parseColor(_remoteConfig.getString('main_color'));
  
  Color _parseColor(String hexColor) {
    hexColor = hexColor.replaceAll('#', '');
    return Color(int.parse('FF\$hexColor', radix: 16));
  }
}

// Uso en la app
class MyApp extends StatelessWidget {
  final RemoteConfigService _remoteConfig = RemoteConfigService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _remoteConfig.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            theme: ThemeData(
              primaryColor: _remoteConfig.mainColor,
            ),
            home: HomeScreen(
              welcomeMessage: _remoteConfig.welcomeMessage,
              showNewFeature: _remoteConfig.isFeatureEnabled,
            ),
          );
        }
        return LoadingScreen();
      },
    );
  }
}

// Ejemplo de configuración en Firebase Console:
/*
Parámetro            | Valor          | Condición
welcome_message      | "¡Hola!"       | Sin condición
feature_enabled      | true           | Usuarios en grupo A/B test
main_color           | "#EA4335"      | Durante temporada navideña
*/
''',
    });

    // Configuración de Parámetros Remotos
    await db.insert('detail', {
      'id': 2,
      'subtopic_id': 's02t04l05',
      'module': 'Mid',
      'definition':
          'Configurar parámetros efectivos requiere planificación. Cada parámetro debe tener:\n\n'
              '- Nombre descriptivo (snake_case)\n'
              '- Valor por defecto (en caso de error)\n'
              '- Tipo correcto (string, number, boolean)\n'
              '- Condiciones opcionales (A/B testing, audiencias)\n\n'
              '**Buenas prácticas**:\n'
              '- Agrupar parámetros relacionados\n'
              '- Documentar cada parámetro\n'
              '- Usar convenciones de nombres consistentes\n'
              '- Probar cambios en un entorno de staging\n\n'
              'Ejemplo avanzado: Configuración para pruebas A/B donde el grupo A ve una funcionalidad y el grupo B otra.',
      'img_url': '',
      'code_example': '''
// Configuración avanzada con condiciones y A/B testing
class AdvancedRemoteConfig extends RemoteConfigService {
  // Valores específicos para diferentes condiciones
  String get personalizedWelcome {
    if (_remoteConfig.getString('user_type') == 'premium') {
      return _remoteConfig.getString('welcome_premium');
    }
    return _remoteConfig.getString('welcome_regular');
  }
  
  // Configuración para pruebas A/B
  bool get isFeatureEnabledForUser {
    // Usar el ID de usuario o instancia para consistencia en la prueba
    final userId = AuthService().currentUserId;
    final experimentGroup = _remoteConfig.getString('feature_experiment_\$userId');
    return experimentGroup == 'enabled';
  }
  
  // Actualización forzada
  Future<void> fetchConfig() async {
    await _remoteConfig.fetch();
    await _remoteConfig.activate();
    
    // Opcional: Forzar actualización de UI
    configUpdatedController.add(true);
  }
  
  // Stream para escuchar cambios
  final configUpdatedController = StreamController<bool>.broadcast();
  Stream<bool> get configUpdated => configUpdatedController.stream;
}

// Uso con Riverpod para estado reactivo
final remoteConfigProvider = FutureProvider<RemoteConfigService>((ref) async {
  final config = AdvancedRemoteConfig();
  await config.initialize();
  
  // Escuchar actualizaciones
  config.configUpdated.listen((_) {
    ref.invalidateSelf(); // Forzar recarga del provider
  });
  
  return config;
});

class FeatureFlag extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(remoteConfigProvider);
    
    return config.when(
      loading: () => CircularProgressIndicator(),
      error: (err, stack) => Text('Error: \$err'),
      data: (config) {
        return config.isFeatureEnabledForUser
            ? NewFeature()
            : OldFeature();
      },
    );
  }
}

// En Firebase Console:
/*
Experimento: "Nueva UI"
- Grupo Control (50%): feature_experiment = "control"
- Grupo Variante (50%): feature_experiment = "enabled"
Duración: 2 semanas
Métrica objetivo: Tasa de conversión
*/
''',
    });

    // Uso de Remote Config para Personalización
    await db.insert('detail', {
      'id': 3,
      'subtopic_id': 's03t04l05',
      'module': 'Mid',
      'definition':
          'Remote Config brinda poderosas opciones de personalización:\n\n'
              '1. **Basada en audiencia**:\n'
              '   - Usuarios premium vs gratuitos\n'
              '   - Segmentos por ubicación o dispositivo\n'
              '2. **Temporal**:\n'
              '   - Promociones de temporada\n'
              '   - Eventos especiales\n'
              '3. **Pruebas A/B**:\n'
              '   - Comparar diferentes flujos de UI\n'
              '   - Optimizar tasas de conversión\n\n'
              '**Ejemplo avanzado**:\n'
              'Mostrar diferentes mensajes de bienvenida según:\n'
              '- Si es primera vez del usuario\n'
              '- Si completó el onboarding\n'
              '- Si es un usuario frecuente',
      'img_url': '',
      'code_example': '''
// Sistema completo de personalización
class PersonalizedConfig {
  final AdvancedRemoteConfig _config;
  final UserRepository _userRepo;
  
  PersonalizedConfig(this._config, this._userRepo);
  
  Future<String> getWelcomeMessage() async {
    final user = await _userRepo.getCurrentUser();
    
    // Primera prioridad: Mensaje personalizado para el usuario
    if (user.isPremium) {
      return _config.getString('welcome_premium');
    }
    
    // Segunda prioridad: Mensaje basado en comportamiento
    if (user.completedOnboarding) {
      return _config.getString('welcome_returning');
    }
    
    // Tercera prioridad: Mensaje basado en temporada
    if (_isHolidaySeason()) {
      return _config.getString('welcome_holiday');
    }
    
    // Valor por defecto
    return _config.getString('welcome_default');
  }
  
  Future<Color> getPrimaryColor() async {
    final experimentGroup = await _getColorExperimentGroup();
    return _config.getColor('primary_color_\$experimentGroup');
  }
  
  Future<String> _getColorExperimentGroup() async {
    final user = await _userRepo.getCurrentUser();
    // Grupo consistente basado en user ID
    return user.id.hashCode % 2 == 0 ? 'group_a' : 'group_b';
  }
  
  bool _isHolidaySeason() {
    final now = DateTime.now();
    return now.month == 12; // Diciembre
  }
}

// Integración con UI
class PersonalizedApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(remoteConfigProvider);
    final user = ref.watch(userProvider);
    
    return config.when(
      loading: () => LoadingScreen(),
      error: (err, stack) => ErrorScreen(error: err),
      data: (config) {
        final personalizer = PersonalizedConfig(config, ref.read(userRepoProvider));
        
        return FutureBuilder(
          future: personalizer.getWelcomeMessage(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomeScreen(
                welcomeMessage: snapshot.data!,
              );
            }
            return LoadingScreen();
          },
        );
      },
    );
  }
}

// Configuración en Firebase Console:
/*
Parámetro            | Valor                  | Condición
welcome_premium      | "¡Bienvenido Premium!"  | user_type == "premium"
welcome_returning    | "¡Hola de nuevo!"      | completed_onboarding == true
welcome_holiday      | "¡Felices fiestas!"    | season == "holiday"
welcome_default      | "Bienvenido"           | Sin condición

primary_color_group_a | "#4285F4" (azul)
primary_color_group_b | "#EA4335" (rojo)
*/
''',
    });
  }

  Future<void> _insertDetailsMidTopic5Level5(Database db) async {
    // Introducción a Firebase Cloud Functions
    await db.insert('detail', {
      'id': 1,
      'subtopic_id': 's01t05l05',
      'module': 'Mid',
      'definition':
          'Cloud Functions son código backend que se ejecuta en respuesta a eventos de Firebase. Ventajas:\n\n'
              '- Sin administrar servidores\n'
              '- Escala automáticamente\n'
              '- Integración directa con Firebase\n'
              '- Solo pagas por lo que usas\n\n'
              '**Casos de uso comunes**:\n'
              '- Procesamiento después de escrituras en Firestore\n'
              '- Autenticación de usuarios personalizada\n'
              '- Tareas programadas\n'
              '- Webhooks y integraciones con terceros\n\n'
              'Ejemplo: Cuando un usuario se registra, una función puede:\n'
              '1. Verificar su dominio de email\n'
              '2. Crear un perfil en Firestore\n'
              '3. Enviar un email de bienvenida',
      'img_url': '',
      'code_example': '''
// Ejemplo básico de Cloud Function (Node.js)
/*
const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

// Función HTTP básica
exports.helloWorld = functions.https.onRequest((req, res) => {
  res.send('Hello from Firebase!');
});

// Función desencadenada por Firestore
exports.onUserCreate = functions.firestore
  .document('users/{userId}')
  .onCreate(async (snapshot, context) => {
    const user = snapshot.data();
    
    // 1. Verificar dominio de email
    const emailDomain = user.email.split('@')[1];
    const allowedDomains = ['example.com', 'company.com'];
    
    if (!allowedDomains.includes(emailDomain)) {
      await snapshot.ref.update({ status: 'rejected' });
      return;
    }
    
    // 2. Crear perfil público
    await admin.firestore().collection('profiles').doc(context.params.userId).set({
      name: user.name,
      email: user.email,
      createdAt: admin.firestore.FieldValue.serverTimestamp(),
    });
    
    // 3. Enviar email de bienvenida (usando SendGrid, Mailgun, etc.)
    // ...
    
    return snapshot.ref.update({ status: 'active' });
  });

// Llamar desde Flutter
final result = await FirebaseFunctions.instance
  .httpsCallable('helloWorld')
  .call();
*/
''',
    });

    // Creación y Despliegue de Cloud Functions
    await db.insert('detail', {
      'id': 2,
      'subtopic_id': 's02t05l05',
      'module': 'Mid',
      'definition':
          'El flujo de desarrollo de Cloud Functions sigue estos pasos:\n\n'
              '1. Configurar Firebase CLI\n'
              '2. Inicializar proyecto con `firebase init functions`\n'
              '3. Escribir funciones en /functions\n'
              '4. Probar localmente con emuladores\n'
              '5. Desplegar con `firebase deploy`\n\n'
              '**Mejores prácticas**:\n'
              '- Usar TypeScript para mejor seguridad de tipos\n'
              '- Separar funciones en múltiples archivos\n'
              '- Manejar errores adecuadamente\n'
              '- Usar variables de entorno para datos sensibles\n'
              '- Monitorear ejecuciones en Firebase Console\n\n'
              'Ejemplo avanzado: Configuración de un proyecto completo con funciones modularizadas.',
      'img_url': '',
      'code_example': '''
// Estructura de proyecto recomendada
/*
functions/
├── src/
│   ├── auth/            # Funciones de autenticación
│   │   └── onUserCreate.ts
│   ├── firestore/       # Funciones de Firestore
│   │   └── onPostCreate.ts
│   ├── http/            # Endpoints HTTP
│   │   └── stripeWebhook.ts
│   ├── scheduled/       # Tareas programadas
│   │   └── dailyReport.ts
│   └── index.ts         # Exportación central
├── package.json
├── tsconfig.json
└── .env                 # Variables de entorno (no committear)
*/

// Ejemplo de función modularizada (TypeScript)
/*
// functions/src/auth/onUserCreate.ts
import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
import { sendWelcomeEmail } from '../lib/email';
import { createUserProfile } from '../lib/profiles';

export const onUserCreate = functions.auth
  .user()
  .onCreate(async (user) => {
    try {
      // 1. Crear perfil público
      await createUserProfile(user);
      
      // 2. Enviar email de verificación
      if (user.email) {
        await sendWelcomeEmail(user.email);
      }
      
      // 3. Inicializar datos del usuario
      await admin.firestore().doc(`users/{user.uid}`).set({
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
        status: 'active',
      });
      
      functions.logger.info(`Usuario creado: {user.uid}`);
    } catch (error) {
      functions.logger.error('Error en onUserCreate:', error);
      throw error;
    }
  });

// functions/src/index.ts
export { onUserCreate } from './auth/onUserCreate';
*/

// Llamar función desde Flutter
Future<void> createStripePayment() async {
  try {
    final callable = FirebaseFunctions.instance.httpsCallable(
      'createStripePayment',
      options: HttpsCallableOptions(
        timeout: const Duration(seconds: 30),
      ),
    );
    
    final result = await callable.call({
      'amount': 1000,
      'currency': 'usd',
      'description': 'Compra en la app',
    });
    
   debugPrint('Resultado: {result.data}');
  } on FirebaseFunctionsException catch (e) {
   debugPrint('Error en la función: {e.code} - {e.message}');
  }
}
''',
    });

    // Uso de Cloud Functions para Lógica del Servidor
    await db.insert('detail', {
      'id': 3,
      'subtopic_id': 's03t05l05',
      'module': 'Mid',
      'definition':
          'Cloud Functions es ideal para lógica que no debe ejecutarse en el cliente:\n\n'
              '- **Procesamiento intensivo**:\n'
              '  - Análisis de imágenes/video\n'
              '  - Procesamiento de datos\n'
              '- **Seguridad**:\n'
              '  - Validaciones complejas\n'
              '  - Acceso a APIs con claves secretas\n'
              '- **Integraciones**:\n'
              '  - Pasarelas de pago\n'
              '  - Servicios de email/SMS\n'
              '  - APIs de terceros\n\n'
              'Ejemplo avanzado: Cuando se crea un post, una función puede:\n'
              '1. Analizar el texto por contenido inapropiado\n'
              '2. Extraer hashtags y mencionados\n'
              '3. Generar miniaturas de imágenes\n'
              '4. Notificar a usuarios mencionados',
      'img_url': '',
      'code_example': '''
// Ejemplo avanzado: Procesamiento de posts
/*
exports.onPostCreate = functions.firestore
  .document('posts/{postId}')
  .onCreate(async (snapshot, context) => {
    const post = snapshot.data();
    const batch = admin.firestore().batch();
    
    // 1. Moderación de contenido
    const isApproved = await moderateContent(post.text);
    batch.update(snapshot.ref, { status: isApproved ? 'approved' : 'pending' });
    
    // 2. Extraer hashtags y mencionados
    const { hashtags, mentions } = parsePostContent(post.text);
    
    if (hashtags.length > 0) {
      batch.set(
        admin.firestore().doc(`posts/{context.params.postId}/metadata/hashtags`),
        { hashtags },
      );
    }
    
    // 3. Notificar mencionados
    await Promise.all(mentions.map(async (username) => {
      const user = await findUserByUsername(username);
      if (user) {
        batch.set(
          admin.firestore().collection(`users/{user.id}/notifications`).doc(),
          {
            type: 'mention',
            postId: context.params.postId,
            createdAt: admin.firestore.FieldValue.serverTimestamp(),
            read: false,
          },
        );
      }
    }));
    
    // 4. Generar miniaturas si hay imágenes
    if (post.imageUrl) {
      const thumbnailUrl = await generateThumbnail(post.imageUrl);
      batch.update(snapshot.ref, { thumbnailUrl });
    }
    
    await batch.commit();
    
    // 5. Actualizar contadores (transacción segura)
    await updateCounters(post.authorId, hashtags.length);
  });

async function moderateContent(text) {
  // Usar API de moderación (ej. Perspective API)
  // ...
}

async function generateThumbnail(imageUrl) {
  // Usar Sharp o ImageMagick
  // ...
}
*/

// Ejemplo de función llamable para pagos
Future<void> processPayment(PaymentData data) async {
  try {
    final callable = FirebaseFunctions.instanceFor(region: 'us-central1')
      .httpsCallable('processPayment');
    
    final result = await callable.call(data.toMap());
    return PaymentResult.fromMap(result.data);
  } on FirebaseFunctionsException catch (e) {
    throw PaymentException(e.code, e.message ?? 'Error en el pago');
  }
}

// Modelos de datos
class PaymentData {
  final double amount;
  final String currency;
  final String paymentMethodId;
  
  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'currency': currency,
      'paymentMethodId': paymentMethodId,
    };
  }
}

class PaymentResult {
  final bool success;
  final String transactionId;
  
  factory PaymentResult.fromMap(Map<String, dynamic> map) {
    return PaymentResult(
      success: map['success'],
      transactionId: map['transactionId'],
    );
  }
}
''',
    });
  }

  Future<void> insertDetailsMidLevel6(Database db) async {
    try {
      await _insertDetailsMidTopic1Level6(db); // Provider
      await _insertDetailsMidTopic2Level6(db); // Riverpod
      await _insertDetailsMidTopic3Level6(db); // BLoC
      await _insertDetailsMidTopic4Level6(db); // GetX
    } catch (e) {
      debugPrint("Error inserting details mid level 6: $e");
    }
  }

  Future<void> _insertDetailsMidTopic1Level6(Database db) async {
    // Introducción a Provider
    await db.insert('detail', {
      'id': 1,
      'subtopic_id': 's01t01l06',
      'module': 'Mid',
      'definition':
          'Provider es la solución oficial de Flutter para gestión de estado e inyección de dependencias. Funciona como un "transportador de valores" que hace que los datos estén disponibles en cualquier parte del árbol de widgets.\n\n'
              '**Beneficios clave**:\n'
              '- Simple de entender e implementar\n'
              '- Reduce la necesidad de StatefulWidgets\n'
              '- Fomenta la separación de lógica y UI\n'
              '- Integración natural con Flutter\n\n'
              '**Casos de uso ideales**:\n'
              '- Compartir datos entre widgets distantes\n'
              '- Gestión de temas o configuración\n'
              '- Estado de UI que necesita ser accesible en múltiples lugares\n\n'
              'Sin Provider, terminarías pasando datos a través de múltiples constructores (prop drilling) o usando soluciones más complejas de lo necesario.',
      'img_url': '',
      'code_example': '''
// Ejemplo básico: Contador con Provider
class Counter with ChangeNotifier {
  int _count = 0;
  
  int get count => _count;
  
  void increment() {
    _count++;
    notifyListeners(); // Notifica a los listeners que el estado cambió
  }
}

// En el punto más alto del árbol de widgets
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Counter(),
      child: MyApp(),
    ),
  );
}

// Widget que lee el estado
class CounterDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    return Text('Count: {counter.count}');
  }
}

// Widget que modifica el estado
class IncrementButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Provider.of<Counter>(context, listen: false).increment();
      },
      child: Text('Increment'),
    );
  }
}

// Consumer para optimización
class OptimizedCounterDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Counter>(
      builder: (context, counter, child) {
        return Text('Count: {counter.count}');
      },
    );
  }
}
''',
    });

    // Uso de Provider para Gestionar el Estado
    await db.insert('detail', {
      'id': 2,
      'subtopic_id': 's02t01l06',
      'module': 'Mid',
      'definition':
          'Provider brinda varias opciones para diferentes necesidades de estado:\n\n'
              '1. **ChangeNotifierProvider**: Para objetos que extienden ChangeNotifier (el más común)\n'
              '2. **Provider**: Para valores inmutables que no cambian\n'
              '3. **FutureProvider**: Para exponer un Future a la UI\n'
              '4. **StreamProvider**: Para exponer un Stream a la UI\n'
              '5. **MultiProvider**: Para registrar múltiples providers\n\n'
              '**Patrones avanzados**:\n'
              '- Provider de providers\n'
              '- ProxyProvider para derivar estado\n'
              '- Familia de providers para parametrización\n\n'
              'Ejemplo: Un e-commerce podría usar Provider para el carrito de compras, preferencias de usuario y estado de autenticación.',
      'img_url': '',
      'code_example': '''
// Ejemplo avanzado: E-commerce con múltiples providers
class CartModel with ChangeNotifier {
  final List<Product> _items = [];
  
  List<Product> get items => _items;
  double get total => _items.fold(0, (sum, item) => sum + item.price);
  
  void add(Product product) {
    _items.add(product);
    notifyListeners();
  }
  
  void remove(Product product) {
    _items.remove(product);
    notifyListeners();
  }
}

class UserPreferences with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  Locale _locale = const Locale('es');
  
  ThemeMode get themeMode => _themeMode;
  Locale get locale => _locale;
  
  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
  
  void changeLocale(Locale newLocale) {
    _locale = newLocale;
    notifyListeners();
  }
}

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartModel()),
        ChangeNotifierProvider(create: (_) => UserPreferences()),
        Provider(create: (_) => ApiService()),
      ],
      child: MyApp(),
    ),
  );
}

// Widget que consume múltiples providers
class AppSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = Provider.of<UserPreferences>(context);
    final cart = Provider.of<CartModel>(context);
    
    return Column(
      children: [
        SwitchListTile(
          title: Text('Modo oscuro'),
          value: prefs.themeMode == ThemeMode.dark,
          onChanged: (_) => prefs.toggleTheme(),
        ),
        Text('Items en carrito: {cart.items.length}'),
      ],
    );
  }
}

// ProxyProvider example
class PriceCalculator {
  final double taxRate;
  
  PriceCalculator(this.taxRate);
  
  double calculateTotal(double subtotal) => subtotal * (1 + taxRate);
}

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<double>(create: (_) => 0.19), // IVA 19%
        ProxyProvider<double, PriceCalculator>(
          create: (_, taxRate, __) => PriceCalculator(taxRate),
        ),
      ],
      child: MyApp(),
    ),
  );
}
''',
    });

    // Combinación de Provider con otros Patrones
    await db.insert('detail', {
      'id': 3,
      'subtopic_id': 's03t01l06',
      'module': 'Mid',
      'definition':
          'Provider puede combinarse con otros patrones arquitectónicos para soluciones más robustas:\n\n'
              '**Con Repository Pattern**:\n'
              '- Provider expone los repositorios\n'
              '- Los repositorios manejan el acceso a datos\n'
              '- Los widgets solo interactúan con los repositorios\n\n'
              '**Con BLoC**:\n'
              '- Provider puede exponer instancias de BLoC\n'
              '- Los widgets acceden al BLoC a través de Provider\n'
              '- Combina la simplicidad de Provider con el poder de BLoC\n\n'
              '**Con Clean Architecture**:\n'
              '- Provider inyecta casos de uso\n'
              '- Las dependencias fluyen desde los providers\n'
              '- Los widgets son completamente ajenos a la implementación',
      'img_url': '',
      'code_example': '''
// Ejemplo con Repository Pattern
abstract class UserRepository {
  Future<User> getUser(String id);
  Future<void> saveUser(User user);
}

class FirebaseUserRepository implements UserRepository {
  @override
  Future<User> getUser(String id) async {
    // Implementación con Firebase
  }
  
  @override
  Future<void> saveUser(User user) async {
    // Implementación con Firebase
  }
}

void main() {
  runApp(
    Provider<UserRepository>(
      create: (_) => FirebaseUserRepository(),
      child: MyApp(),
    ),
  );
}

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<UserRepository>(context);
    
    return FutureBuilder<User>(
      future: repository.getUser('123'),
      builder: (context, snapshot) {
        // Mostrar UI basada en el estado del Future
      },
    );
  }
}

// Ejemplo combinando con BLoC
class CounterBloc {
  final _counterController = StreamController<int>.broadcast();
  int _count = 0;
  
  Stream<int> get count => _counterController.stream;
  
  void increment() {
    _counterController.add(++_count);
  }
  
  void dispose() {
    _counterController.close();
  }
}

void main() {
  runApp(
    Provider<CounterBloc>(
      create: (_) => CounterBloc(),
      dispose: (_, bloc) => bloc.dispose(),
      child: MyApp(),
    ),
  );
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CounterBloc>(context);
    
    return StreamBuilder<int>(
      stream: bloc.count,
      builder: (context, snapshot) {
        return Column(
          children: [
            Text('Count: {snapshot.data ?? 0}'),
            ElevatedButton(
              onPressed: bloc.increment,
              child: Text('Increment'),
            ),
          ],
        );
      },
    );
  }
}
''',
    });
  }

  Future<void> _insertDetailsMidTopic2Level6(Database db) async {
    // Introducción a Riverpod
    await db.insert('detail', {
      'id': 1,
      'subtopic_id': 's01t02l06',
      'module': 'Mid',
      'definition':
          'Riverpod es la evolución de Provider, diseñado para resolver sus limitaciones. Es como Provider pero con superpoderes:\n\n'
              '**Ventajas sobre Provider**:\n'
              '- Compilación segura (menos errores en runtime)\n'
              '- Más flexible en la organización del código\n'
              '- Mejor manejo de dependencias\n'
              '- Soporte nativo para testing\n'
              '- No necesita un BuildContext\n\n'
              '**Conceptos clave**:\n'
              '- Provider: Define cómo se crea un estado\n'
              '- Ref: Objeto para interactuar con providers\n'
              '- WidgetRef: Similar a Ref pero para widgets\n'
              '- Scopes: Control de ciclo de vida\n\n'
              'Riverpod es ideal para aplicaciones complejas que necesitan escalar.',
      'img_url': '',
      'code_example': '''
// Configuración básica
void main() {
  runApp(
    ProviderScope( // Similar a MultiProvider pero para Riverpod
      child: MyApp(),
    ),
  );
}

// Definición de providers (fuera de las clases)
final counterProvider = StateProvider<int>((ref) => 0);

// Widget que consume el provider
class CounterDisplay extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    return Text('Count: \$count');
  }
}

// Widget que modifica el estado
class IncrementButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () => ref.read(counterProvider.notifier).state++,
      child: Text('Increment'),
    );
  }
}

// Provider con lógica más compleja
final userRepositoryProvider = Provider<UserRepository>((ref) {
  return FirebaseUserRepository();
});

final userProvider = FutureProvider<User>((ref) async {
  final repository = ref.read(userRepositoryProvider);
  return repository.getUser('123');
});

// Consumiendo el FutureProvider
class UserProfile extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userProvider);
    
    return userAsync.when(
      loading: () => CircularProgressIndicator(),
      error: (err, stack) => Text('Error: \$err'),
      data: (user) => Text('Welcome {user.name}'),
    );
  }
}
''',
    });

    // Uso de Riverpod para Gestionar el Estado
    await db.insert('detail', {
      'id': 2,
      'subtopic_id': 's02t02l06',
      'module': 'Mid',
      'definition':
          'Riverpod ofrece varios tipos de providers para diferentes necesidades:\n\n'
              '1. **Provider**: Para objetos inmutables\n'
              '2. **StateProvider**: Para estado simple\n'
              '3. **StateNotifierProvider**: Para lógica más compleja\n'
              '4. **FutureProvider**: Para async/await\n'
              '5. **StreamProvider**: Para streams\n'
              '6. **ChangeNotifierProvider**: Para migración desde Provider\n\n'
              '**Patrones avanzados**:\n'
              '- Familia de providers (providers parametrizados)\n'
              '- Auto-dispose para manejo automático de recursos\n'
              '- Dependencias entre providers\n'
              '- Overrides para testing\n\n'
              'Ejemplo: Un provider puede depender de otro, y Riverpod maneja automáticamente las actualizaciones.',
      'img_url': '',
      'code_example': '''
// Ejemplo avanzado: E-commerce con Riverpod
class CartItem {
  final Product product;
  final int quantity;
  
  CartItem(this.product, this.quantity);
}

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);
  
  void add(Product product) {
    state = [...state, CartItem(product, 1)];
  }
  
  void remove(Product product) {
    state = state.where((item) => item.product.id != product.id).toList();
  }
  
  void updateQuantity(String productId, int newQuantity) {
    state = state.map((item) {
      return item.product.id == productId
          ? CartItem(item.product, newQuantity)
          : item;
    }).toList();
  }
}

// Providers
final productsProvider = FutureProvider<List<Product>>((ref) async {
  final response = await http.get(Uri.parse('https://api.example.com/products'));
  return (jsonDecode(response.body) as List).map((e) => Product.fromJson(e)).toList();
});

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});

final totalProvider = Provider<double>((ref) {
  final cart = ref.watch(cartProvider);
  return cart.fold(0, (sum, item) => sum + (item.product.price * item.quantity));
});

// Widget que usa múltiples providers
class ProductList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(productsProvider);
    final cart = ref.watch(cartProvider);
    
    return productsAsync.when(
      loading: () => CircularProgressIndicator(),
      error: (err, stack) => Text('Error: \$err'),
      data: (products) => ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          final inCart = cart.any((item) => item.product.id == product.id);
          
          return ListTile(
            title: Text(product.name),
            subtitle: Text('{product.price}'),
            trailing: IconButton(
              icon: Icon(inCart ? Icons.remove : Icons.add),
              onPressed: () {
                inCart
                    ? ref.read(cartProvider.notifier).remove(product)
                    : ref.read(cartProvider.notifier).add(product);
              },
            ),
          );
        },
      ),
    );
  }
}

// Familia de providers
final productProvider = FutureProvider.family<Product, String>((ref, productId) async {
  final response = await http.get(Uri.parse('https://api.example.com/products/\$productId'));
  return Product.fromJson(jsonDecode(response.body));
});

// Uso
class ProductDetail extends ConsumerWidget {
  final String productId;
  
  ProductDetail(this.productId);
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productProvider(productId));
    
    return productAsync.when(
      // ... manejar los diferentes estados
    );
  }
}
''',
    });

    // Diferencias entre Provider y Riverpod
    await db.insert('detail', {
      'id': 3,
      'subtopic_id': 's03t02l06',
      'module': 'Mid',
      'definition':
          'Aunque similares, Provider y Riverpod tienen diferencias clave:\n\n'
              '**Provider**:\n'
              '- Basado en BuildContext\n'
              '- Más simple para casos básicos\n'
              '- Menos verboso para migraciones de setState\n'
              '- Menos seguro en tiempo de compilación\n\n'
              '**Riverpod**:\n'
              '- No necesita BuildContext\n'
              '- Más flexible y potente\n'
              '- Mejor organización del código\n'
              '- Más seguro en tiempo de compilación\n'
              '- Soporte avanzado para testing\n\n'
              '**Cuándo usar cada uno**:\n'
              '- Provider: Apps pequeñas o para migrar gradualmente\n'
              '- Riverpod: Apps complejas o nuevas implementaciones\n\n'
              'Ejemplo: Riverpod es mejor para apps con:\n'
              '- Múltiples dependencias\n'
              '- Necesidad de testing robusto\n'
              '- Estado complejo compartido',
      'img_url': '',
      'code_example': '''
// Comparación lado a lado

// ---------- PROVIDER ----------
// Definición
class Counter with ChangeNotifier {
  int _count = 0;
  int get count => _count;
  void increment() {
    _count++;
    notifyListeners();
  }
}

// Registro
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Counter(),
      child: MyApp(),
    ),
  );
}

// Consumo
class CounterDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    return Text('{counter.count}');
  }
}

// ---------- RIVERPOD ----------
// Definición
final counterProvider = StateNotifierProvider<CounterNotifier, int>((ref) {
  return CounterNotifier();
});

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);
  void increment() => state++;
}

// Registro
void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

// Consumo
class CounterDisplay extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    return Text('\$count');
  }
}

// ---------- VENTAJAS RIVERPOD ----------
// 1. Sin dependencia de BuildContext
void someFunction(WidgetRef ref) {
  final count = ref.read(counterProvider);
 debugPrint(count);
}

// 2. Testing más fácil
void main() {
  test('counter increments', () {
    final container = ProviderContainer();
    final notifier = container.read(counterProvider.notifier);
    
    expect(container.read(counterProvider), 0);
    notifier.increment();
    expect(container.read(counterProvider), 1);
  });
}

// 3. Mejor manejo de dependencias
final repositoryProvider = Provider<Repository>((ref) {
  return Repository();
});

final serviceProvider = Provider<Service>((ref) {
  final repository = ref.watch(repositoryProvider);
  return Service(repository);
});
''',
    });
  }

  Future<void> _insertDetailsMidTopic3Level6(Database db) async {
    // Introducción a BLoC
    await db.insert('detail', {
      'id': 1,
      'subtopic_id': 's01t03l06',
      'module': 'Mid',
      'definition':
          'BLoC (Business Logic Component) es un patrón de diseño creado por Google que separa la lógica de negocio de la interfaz de usuario usando Streams. Es especialmente útil para aplicaciones complejas que manejan múltiples fuentes de datos.\n\n'
              '**Conceptos clave**:\n'
              '- Eventos: Acciones que disparan cambios de estado\n'
              '- Estados: Representación del estado actual de la aplicación\n'
              '- Bloc: Gestiona la transformación de eventos a estados\n'
              '- Streams: Flujo de datos asíncrono\n\n'
              '**Ventajas**:\n'
              '- Separación clara entre UI y lógica\n'
              '- Fácil de testear\n'
              '- Reutilizable\n'
              '- Manejo de estados complejos\n'
              '- Ideal para aplicaciones con múltiples fuentes de datos',
      'img_url': '',
      'code_example': '''
// Configuración básica
dependencies:
  flutter_bloc: ^8.1.1
  bloc: ^8.1.0

// Definición de estados
abstract class CounterState {
  const CounterState();
}

class CounterInitial extends CounterState {
  const CounterInitial();
}

class CounterIncrement extends CounterState {
  final int value;
  const CounterIncrement(this.value);
}

// Definición de eventos
abstract class CounterEvent {
  const CounterEvent();
}

class IncrementCounter extends CounterEvent {
  const IncrementCounter();
}

// Implementación del BLoC
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial()) {
    on<IncrementCounter>((event, emit) {
      final currentValue = state is CounterIncrement 
          ? (state as CounterIncrement).value 
          : 0;
      emit(CounterIncrement(currentValue + 1));
    });
  }
}

// Configuración en la app
void main() {
  runApp(
    BlocProvider(
      create: (context) => CounterBloc(),
      child: MyApp(),
    ),
  );
}

// Widget que consume el BLoC
class CounterDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        if (state is CounterIncrement) {
          return Text('Count: {state.value}');
        }
        return const Text('Count: 0');
      },
    );
  }
}

// Widget que dispara eventos
class IncrementButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.read<CounterBloc>().add(const IncrementCounter()),
      child: const Text('Increment'),
    );
  }
}
''',
    });

    // Uso de BLoC para Gestionar el Estado
    await db.insert('detail', {
      'id': 2,
      'subtopic_id': 's02t03l06',
      'module': 'Mid',
      'definition': 'BLoC ofrece varias herramientas para manejar estados complejos:\n\n'
          '1. **BlocProvider**: Provee una instancia de BLoC al árbol de widgets\n'
          '2. **BlocBuilder**: Reconstruye la UI en respuesta a cambios de estado\n'
          '3. **BlocListener**: Ejecuta acciones en respuesta a cambios de estado\n'
          '4. **BlocConsumer**: Combina BlocBuilder y BlocListener\n'
          '5. **RepositoryProvider**: Para inyectar repositorios\n\n'
          '**Patrones avanzados**:\n'
          '- MultiBlocProvider para múltiples BLoCs\n'
          '- Bloc-to-Bloc communication\n'
          '- Cubits para casos más simples\n'
          '- Hydrated BLoC para persistencia\n\n'
          'Ejemplo: Un e-commerce podría usar BLoC para:\n'
          '- Autenticación\n'
          '- Carrito de compras\n'
          '- Búsqueda de productos\n'
          '- Pedidos',
      'img_url': '',
      'code_example': '''
// Ejemplo avanzado: E-commerce con BLoC
// Estados de autenticación
abstract class AuthState {}
class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthSuccess extends AuthState {
  final User user;
  AuthSuccess(this.user);
}
class AuthFailure extends AuthState {
  final String error;
  AuthFailure(this.error);
}

// Eventos de autenticación
abstract class AuthEvent {}
class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  LoginEvent(this.email, this.password);
}
class LogoutEvent extends AuthEvent {}

// BLoC de autenticación
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;
  
  AuthBloc(this.repository) : super(AuthInitial()) {
    on<LoginEvent>(_mapLoginEventToState);
    on<LogoutEvent>(_mapLogoutEventToState);
  }
  
  Future<void> _mapLoginEventToState(
    LoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final user = await repository.login(event.email, event.password);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
  
  void _mapLogoutEventToState(
    LogoutEvent event,
    Emitter<AuthState> emit,
  ) {
    repository.logout();
    emit(AuthInitial());
  }
}

// BLoC del carrito
class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    // Manejadores de eventos
  }
}

// Configuración de la app
void main() {
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => AuthRepository()),
        RepositoryProvider(create: (_) => ProductRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthBloc(context.read<AuthRepository>())),
          BlocProvider(create: (context) => CartBloc())),
        ],
        child: MyApp(),
      ),
    ),
  );
}

// Widget que usa múltiples BLoCs
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      builder: (context, authState) {
        if (authState is AuthSuccess) {
          return Column(
            children: [
              Text('Welcome {authState.user.name}'),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, cartState) {
                  if (cartState is CartLoaded) {
                    return Text('Items in cart: {cartState.items.length}');
                  }
                  return const Text('Loading cart...');
                },
              ),
              ElevatedButton(
                onPressed: () => context.read<AuthBloc>().add(LogoutEvent()),
                child: const Text('Logout'),
              ),
            ],
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}

// Bloc-to-Bloc communication
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final CartBloc cartBloc;
  
  ProductBloc(this.cartBloc) : super(ProductInitial()) {
    on<AddToCartEvent>((event, emit) {
      cartBloc.add(AddItemToCart(event.product));
    });
  }
}
''',
    });

    // Implementación de BLoC en una Aplicación Flutter
    await db.insert('detail', {
      'id': 3,
      'subtopic_id': 's03t03l06',
      'module': 'Mid',
      'definition':
          'Para implementar BLoC efectivamente en una aplicación Flutter:\n\n'
              '**Estructura recomendada**:\n'
              '1. features/\n'
              '   - auth/\n'
              '     - bloc/\n'
              '     - models/\n'
              '     - repository/\n'
              '     - views/\n'
              '   - products/\n'
              '     - bloc/\n'
              '     - ...\n\n'
              '**Buenas prácticas**:\n'
              '- Un BLoC por feature\n'
              '- Estados inmutables\n'
              '- Eventos descriptivos\n'
              '- Repository pattern para acceso a datos\n'
              '- Testing exhaustivo\n\n'
              '**Comparación con otros patrones**:\n'
              '- vs Provider: BLoC es más adecuado para lógica compleja\n'
              '- vs Riverpod: BLoC tiene más boilerplate pero estructura más clara\n'
              '- vs GetX: BLoC es más escalable para equipos grandes\n\n'
              'Ejemplo completo: Aplicación de clima con:\n'
              '- BLoC para estado\n'
              '- Repository para API\n'
              '- Localización',
      'img_url': '',
      'code_example': '''
// Ejemplo completo: Aplicación de clima

// Modelos
class Weather {
  final String city;
  final double temperature;
  final String condition;
  
  Weather({required this.city, required this.temperature, required this.condition});
}

// Estados
abstract class WeatherState {}
class WeatherInitial extends WeatherState {}
class WeatherLoading extends WeatherState {}
class WeatherLoaded extends WeatherState {
  final Weather weather;
  WeatherLoaded(this.weather);
}
class WeatherError extends WeatherState {
  final String message;
  WeatherError(this.message);
}

// Eventos
abstract class WeatherEvent {}
class FetchWeather extends WeatherEvent {
  final String city;
  FetchWeather(this.city);
}

// BLoC
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository repository;
  
  WeatherBloc(this.repository) : super(WeatherInitial()) {
    on<FetchWeather>(_onFetchWeather);
  }
  
  Future<void> _onFetchWeather(
    FetchWeather event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoading());
    try {
      final weather = await repository.getWeather(event.city);
      emit(WeatherLoaded(weather));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }
}

// Repositorio
class WeatherRepository {
  final WeatherApiClient apiClient;
  
  WeatherRepository({required this.apiClient});
  
  Future<Weather> getWeather(String city) async {
    final weatherData = await apiClient.fetchWeather(city);
    return Weather(
      city: weatherData['city'],
      temperature: weatherData['temp'],
      condition: weatherData['condition'],
    );
  }
}

// Configuración de la app
void main() {
  runApp(
    RepositoryProvider(
      create: (context) => WeatherRepository(
        apiClient: WeatherApiClient(),
      ),
      child: BlocProvider(
        create: (context) => WeatherBloc(
          context.read<WeatherRepository>(),
        ),
        child: MyApp(),
      ),
    ),
  );
}

// Pantalla principal
class WeatherScreen extends StatelessWidget {
  final _cityController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(
                labelText: 'City',
                hintText: 'Enter a city',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<WeatherBloc>().add(
                  FetchWeather(_cityController.text),
                );
              },
              child: const Text('Get Weather'),
            ),
            const SizedBox(height: 20),
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherLoading) {
                  return const CircularProgressIndicator();
                } else if (state is WeatherLoaded) {
                  return Column(
                    children: [
                      Text(
                        '{state.weather.city}',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text(
                        '{state.weather.temperature}°C',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Text(
                        state.weather.condition,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  );
                } else if (state is WeatherError) {
                  return Text(
                    state.message,
                    style: const TextStyle(color: Colors.red),
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Testing del BLoC
void main() {
  group('WeatherBloc', () {
    late WeatherBloc weatherBloc;
    late MockWeatherRepository mockRepository;
    
    setUp(() {
      mockRepository = MockWeatherRepository();
      weatherBloc = WeatherBloc(mockRepository);
    });
    
    tearDown(() {
      weatherBloc.close();
    });
    
    test('initial state is WeatherInitial', () {
      expect(weatherBloc.state, isA<WeatherInitial>());
    });
    
    test('emits [Loading, Loaded] when FetchWeather succeeds', () {
      when(mockRepository.getWeather('London'))
          .thenAnswer((_) async => Weather(city: 'London', temperature: 15.0, condition: 'Cloudy'));
      
      expectLater(
        weatherBloc.stream,
        emitsInOrder([
          isA<WeatherLoading>(),
          isA<WeatherLoaded>(),
        ]),
      );
      
      weatherBloc.add(FetchWeather('London'));
    });
  });
}
''',
    });
  }

  Future<void> _insertDetailsMidTopic4Level6(Database db) async {
    // Introducción a GetX
    await db.insert('detail', {
      'id': 1,
      'subtopic_id': 's01t04l06',
      'module': 'Mid',
      'definition':
          'GetX es un paquete todo-en-uno para Flutter que ofrece:\n\n'
              '- **Gestión de estado** (reactivo y simple)\n'
              '- **Inyección de dependencias**\n'
              '- **Navegación** (sin necesidad de context)\n'
              '- **Manejo de rutas**\n'
              '- **Internacionalización**\n'
              '- **Validación de formularios**\n\n'
              '**Ventajas clave**:\n'
              '- Mínimo boilerplate\n'
              '- Alto rendimiento\n'
              '- Fácil de aprender\n'
              '- Todo integrado en un solo paquete\n'
              '- No necesita context en muchos casos\n\n'
              '**Casos de uso ideales**:\n'
              '- Aplicaciones pequeñas a medianas\n'
              '- Prototipado rápido\n'
              '- Cuando se quiere evitar mucho código\n'
              '- Proyectos con pocos desarrolladores',
      'img_url': '',
      'code_example': '''
// Configuración básica
dependencies:
  get: ^4.6.5

// Ejemplo básico: Contador con GetX
class CounterController extends GetxController {
  var count = 0.obs; // .obs hace la variable observable
  
  void increment() => count++;
}

// En el punto más alto del árbol de widgets
void main() {
  runApp(
    GetMaterialApp( // Reemplaza MaterialApp
      home: MyHomePage(),
    ),
  );
}

// Pantalla que usa el controlador
class MyHomePage extends StatelessWidget {
  final CounterController controller = Get.put(CounterController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GetX Counter')),
      body: Center(
        child: Obx(() => Text(
          'Count: {controller.count}',
          style: TextStyle(fontSize: 24),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: Icon(Icons.add),
      ),
    );
  }
}

// Navegación sin context
class OtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Other Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Get.back(), // Navegación con GetX
          child: Text('Go Back'),
        ),
      ),
    );
  }
}

// Desde cualquier lugar:
Get.to(OtherPage()); // Navegar
Get.back(); // Regresar
Get.snackbar('Title', 'Message'); // Mostrar snackbar
Get.dialog(AlertDialog(title: Text('Dialog'))); // Mostrar diálogo
''',
    });

    // Uso de GetX para Gestionar el Estado
    await db.insert('detail', {
      'id': 2,
      'subtopic_id': 's02t04l06',
      'module': 'Mid',
      'definition': 'GetX ofrece dos enfoques para gestión de estado:\n\n'
          '1. **Reactivo (Rx)**: Usando .obs y Obx()\n'
          '2. **Simple (GetBuilder)**: Similar a Provider\n\n'
          '**Características avanzadas**:\n'
          '- Workers: Reaccionar a cambios de estado\n'
          '- Bindings: Inyección de dependencias\n'
          '- Rutas nombradas\n'
          '- Internacionalización\n'
          '- Almacenamiento local\n'
          '- Validación de formularios\n\n'
          'Ejemplo: Un e-commerce podría usar GetX para:\n'
          '- Autenticación\n'
          '- Carrito de compras\n'
          '- Perfil de usuario\n'
          '- Búsqueda de productos',
      'img_url': '',
      'code_example': '''
// Ejemplo avanzado: E-commerce con GetX

// Modelos
class Product {
  final String id;
  final String name;
  final double price;
  
  Product({required this.id, required this.name, required this.price});
}

// Controlador reactivo
class CartController extends GetxController {
  var products = <Product>[].obs;
  var total = 0.0.obs;
  
  void addProduct(Product product) {
    products.add(product);
    calculateTotal();
  }
  
  void removeProduct(Product product) {
    products.remove(product);
    calculateTotal();
  }
  
  void calculateTotal() {
    total.value = products.fold(0, (sum, product) => sum + product.price);
  }
}

// Controlador con Bindings
class AuthController extends GetxController {
  var isLoggedIn = false.obs;
  var user = Rxn<User>();
  
  Future<void> login(String email, String password) async {
    try {
      isLoggedIn.value = false;
      user.value = await AuthService.login(email, password);
      isLoggedIn.value = true;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
  
  void logout() {
    user.value = null;
    isLoggedIn.value = false;
  }
}

// Configuración de la app
void main() {
  runApp(
    GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/cart', page: () => CartPage()),
      ],
      initialBinding: AppBindings(),
    ),
  );
}

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => CartController());
    Get.put(ProductRepository(), permanent: true);
  }
}

// Pantalla de productos
class ProductPage extends StatelessWidget {
  final CartController cartController = Get.find();
  final ProductRepository repository = Get.find();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          IconButton(
            icon: Obx(() => Badge(
              child: Icon(Icons.shopping_cart),
              count: cartController.products.length,
            )),
            onPressed: () => Get.toNamed('/cart'),
          ),
        ],
      ),
      body: FutureBuilder<List<Product>>(
        future: repository.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final product = snapshot.data![index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text('{product.price}'),
                  trailing: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () => cartController.addProduct(product),
                  ),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

// Pantalla de carrito
class CartPage extends StatelessWidget {
  final CartController controller = Get.find();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shopping Cart')),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ListView.builder(
              itemCount: controller.products.length,
              itemBuilder: (context, index) {
                final product = controller.products[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text('{product.price}'),
                  trailing: IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () => controller.removeProduct(product),
                  ),
                );
              },
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx(() => Text(
              'Total: {controller.total}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
          ),
        ],
      ),
    );
  }
}

// Workers - Reaccionar a cambios
class AuthController extends GetxController {
  final user = Rxn<User>();
  
  @override
  void onInit() {
    ever(user, (_) =>debugPrint('User changed: \$user'));
    once(user, (_) =>debugPrint('First user change'));
    debounce(user, (_) =>debugPrint('User stopped changing after 1 second'), 
      time: Duration(seconds: 1));
    interval(user, (_) =>debugPrint('User changed every 1 second'), 
      time: Duration(seconds: 1));
    
    super.onInit();
  }
}
''',
    });

    // Ventajas y Desventajas de GetX
    await db.insert('detail', {
      'id': 3,
      'subtopic_id': 's03t04l06',
      'module': 'Mid',
      'definition': '**Ventajas de GetX**:\n\n'
          '- Todo-en-uno: Estado, navegación, DI, etc.\n'
          '- Mínimo boilerplate\n'
          '- Fácil de aprender y usar\n'
          '- Alto rendimiento\n'
          '- No necesita context en muchos casos\n'
          '- Excelente para prototipado rápido\n\n'
          '**Desventajas de GetX**:\n\n'
          '- Menos popular en grandes empresas\n'
          '- Puede fomentar malas prácticas en proyectos grandes\n'
          '- Menos escalable que BLoC para equipos grandes\n'
          '- Menos documentación oficial que Provider/BLoC\n\n'
          '**Comparación con otros patrones**:\n'
          '- vs Provider: GetX es más poderoso pero menos "Flutter-way"\n'
          '- vs BLoC: GetX es más simple pero menos estructurado\n'
          '- vs Riverpod: GetX ofrece más funcionalidades integradas\n\n'
          '**Cuándo usar GetX**:\n'
          '- Aplicaciones pequeñas/medianas\n'
          '- Prototipos rápidos\n'
          '- Cuando necesitas muchas funcionalidades en un solo paquete\n'
          '- Proyectos con pocos desarrolladores\n\n'
          '**Cuándo evitar GetX**:\n'
          '- Aplicaciones muy grandes\n'
          '- Equipos grandes que necesitan estructura clara\n'
          '- Cuando quieres seguir estrictamente las prácticas recomendadas por Flutter',
      'img_url': '',
      'code_example': '''
// Comparación lado a lado

// ---------- PROVIDER ----------
// Definición
class Counter with ChangeNotifier {
  int _count = 0;
  int get count => _count;
  void increment() {
    _count++;
    notifyListeners();
  }
}

// Consumo
class CounterDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    return Text('{counter.count}');
  }
}

// ---------- BLoC ----------
// Definición
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<IncrementEvent>((event, emit) {
      emit(CounterChanged(state.count + 1));
    });
  }
}

// Consumo
class CounterDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return Text('{state.count}');
      },
    );
  }
}

// ---------- GETX ----------
// Definición
class CounterController extends GetxController {
  var count = 0.obs;
  void increment() => count++;
}

// Consumo
class CounterDisplay extends StatelessWidget {
  final controller = Get.put(CounterController());
  
  @override
  Widget build(BuildContext context) {
    return Obx(() => Text('{controller.count}'));
  }
}

// ---------- VENTAJAS GETX ----------
// 1. Navegación sin context
void navigate() {
  Get.to(NextScreen());
  Get.offAll(HomeScreen());
  Get.back();
}

// 2. Diálogos, snackbars sin context
void showDialog() {
  Get.defaultDialog(title: 'Hello');
  Get.snackbar('Title', 'Message');
}

// 3. Inyección de dependencias
class MyController extends GetxController {
  final repository = Get.find<Repository>();
}

// 4. Internacionalización
Text('hello'.tr);

// 5. Validación de formularios
final formKey = GlobalKey<FormState>();
void validate() {
  if (formKey.currentState!.validate()) {
    // Form is valid
  }
}

// 6. Almacenamiento local
final box = GetStorage();
box.write('key', 'value');
var value = box.read('key');

// 7. Workers para reaccionar a cambios
class Controller extends GetxController {
  final count = 0.obs;
  
  @override
  void onInit() {
    ever(count, (_) =>debugPrint('count changed'));
    super.onInit();
  }
}
''',
    });
  }

  Future<void> insertDetailsMidLevel7(Database db) async {
    try {
      await _insertDetailsMidTopic1Level7(db);
      await _insertDetailsMidTopic2Level7(db);
      await _insertDetailsMidTopic3Level7(db);
      await _insertDetailsMidTopic4Level7(db);
      await _insertDetailsMidTopic5Level7(db);
    } catch (e) {
      debugPrint("Error inserting details mid level 6: $e");
    }
  }

  Future<void> _insertDetailsMidTopic1Level7(Database db) async {
    // Introducción a las Animaciones Hero
    await db.insert('detail', {
      'id': 1,
      'subtopic_id': 's01t01l07',
      'module': 'Mid',
      'definition':
          'Las animaciones Hero permiten crear transiciones fluidas entre widgets que existen en diferentes rutas. Cuando navegas entre pantallas, el widget Hero "vuela" de una pantalla a otra, creando un efecto visual atractivo.\n\n'
              '**Características clave**:\n'
              '- Transición suave entre pantallas\n'
              '- Efecto visual de "vuelo" del widget\n'
              '- Fácil implementación\n'
              '- Ideal para imágenes o elementos destacados\n\n'
              '**Casos de uso comunes**:\n'
              '- Galerías de imágenes\n'
              '- Elementos de lista a vista detalle\n'
              '- Tarjetas que se expanden\n'
              '- Transiciones entre pantallas relacionadas',
      'img_url': '',
      'code_example': '''
// Ejemplo básico de animación Hero
class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Primera Pantalla')),
      body: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => SecondScreen()));
        },
        child: Hero(
          tag: 'imageHero',
          child: Image.network('https://picsum.photos/250?image=9'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Segunda Pantalla')),
      body: Center(
        child: Hero(
          tag: 'imageHero',
          child: Image.network('https://picsum.photos/250?image=9'),
        ),
      ),
    );
  }
}

// Uso con diferentes tamaños
class HeroDifferentSizes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Hero(
              tag: 'item-index',
              child: Icon(Icons.image, size: 40),
            ),
            title: Text('Item \$index'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(index: index),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final int index;

  DetailsScreen({required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalles del Item \$index')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'item-\$index',
              child: Icon(Icons.image, size: 200),
            ),
            SizedBox(height: 20),
            Text('Detalles completos del item \$index'),
          ],
        ),
      ),
    );
  }
}
''',
    });

    // Uso de Hero para Transiciones entre Pantallas
    await db.insert('detail', {
      'id': 2,
      'subtopic_id': 's02t01l07',
      'module': 'Mid',
      'definition': 'Para implementar correctamente animaciones Hero:\n\n'
          '1. **Mismo tag**: Ambos widgets Hero deben usar el mismo tag\n'
          '2. **Tipos compatibles**: Los widgets deben ser del mismo tipo (ambos Image, ambos Icon, etc.)\n'
          '3. **Árbol de widgets**: Deben estar en diferentes rutas\n\n'
          '**Buenas prácticas**:\n'
          '- Usar tags únicos para cada animación\n'
          '- Evitar muchos elementos Hero simultáneos\n'
          '- Probar en dispositivos reales (el emulador puede no mostrar bien la animación)\n\n'
          '**Problemas comunes y soluciones**:\n'
          '- Animación no funciona: Verificar que los tags coincidan\n'
          '- Flickering: Asegurarse que los widgets sean del mismo tipo\n'
          '- Rendimiento: Limitar el número de animaciones Hero simultáneas',
      'img_url': '',
      'code_example': '''
// Ejemplo avanzado con múltiples Heroes
class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(id: 1, name: 'Zapatos', price: 59.99, imageUrl: 'https://...'),
    Product(id: 2, name: 'Camisa', price: 29.99, imageUrl: 'https://...'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Productos')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: ListTile(
              leading: Hero(
                tag: 'product-image-{product.id}',
                child: Image.network(product.imageUrl, width: 50, height: 50),
              ),
              title: Hero(
                tag: 'product-title-{product.id}',
                child: Material(
                  type: MaterialType.transparency,
                  child: Text(product.name),
                ),
              ),
              subtitle: Text('{product.price}€'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(product: product),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Hero(
        tag: 'product-title-{product.id}',
        child: Material(
          type: MaterialType.transparency,
          child: Text(product.name),
        ),
      )),
      body: Column(
        children: [
          Hero(
            tag: 'product-image-{product.id}',
            child: Image.network(product.imageUrl),
          ),
          Text('{product.price}€', style: TextStyle(fontSize: 24)),
          Text('Descripción detallada del producto...'),
        ],
      ),
    );
  }
}

// Solución para widgets de diferente tipo
class CustomHero extends StatelessWidget {
  final String tag;
  final Widget child;

  CustomHero({required this.tag, required this.child});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Material(
        type: MaterialType.transparency,
        child: child,
      ),
    );
  }
}
''',
    });

    // Personalización de Animaciones Hero
    await db.insert('detail', {
      'id': 3,
      'subtopic_id': 's03t01l07',
      'module': 'Mid',
      'definition':
          'Puedes personalizar las animaciones Hero usando FlightShuttleBuilder y CreateRectTween:\n\n'
              '1. **FlightShuttleBuilder**: Controla el widget durante la transición\n'
              '2. **CreateRectTween**: Define cómo se anima el tamaño y posición\n'
              '3. **PlaceholderBuilder**: Widget a mostrar durante la carga\n\n'
              '**Opciones avanzadas**:\n'
              '- Custom Tween para rutas no lineales\n'
              '- Transformaciones durante el vuelo\n'
              '- Combinación con otras animaciones\n'
              '- Control de duración y curva',
      'img_url': '',
      'code_example': '''
// Personalización avanzada de Hero
class CustomHeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animación Personalizada')),
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => SecondScreen()));
          },
          child: Hero(
            tag: 'customHero',
            flightShuttleBuilder: (flightContext, animation, flightDirection,
                fromHeroContext, toHeroContext) {
              return AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: animation.value * 2 * math.pi,
                    child: child,
                  );
                },
                child: fromHeroContext.widget,
              );
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              child: Icon(Icons.star, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Segunda Pantalla')),
      body: Center(
        child: Hero(
          tag: 'customHero',
          child: Container(
            width: 200,
            height: 200,
            color: Colors.red,
            child: Icon(Icons.star, color: Colors.white, size: 50),
          ),
        ),
      ),
    );
  }
}

// Usando MaterialRectArcTween para animación curva
class CurvedHeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'curvedHero',
          createRectTween: (begin, end) {
            return MaterialRectArcTween(begin: begin, end: end);
          },
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => SecondScreen()));
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}

// Combinación con PageRouteBuilder para mayor control
void _navigateWithCustomTransition(BuildContext context) {
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SecondScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      transitionDuration: Duration(milliseconds: 1000),
    ),
  );
}
''',
    });
  }

  Future<void> _insertDetailsMidTopic2Level7(Database db) async {
    // Introducción a las Animaciones de Opacidad
    await db.insert('detail', {
      'id': 1,
      'subtopic_id': 's01t02l07',
      'module': 'Mid',
      'definition':
          'Las animaciones de opacidad permiten crear transiciones suaves de aparición y desaparición de widgets. Flutter proporciona AnimatedOpacity para implementar fácilmente este tipo de animaciones.\n\n'
              '**Características clave**:\n'
              '- Transiciones suaves de visibilidad\n'
              '- Fácil de implementar\n'
              '- Control preciso de la duración y curva\n'
              '- Optimizado para rendimiento\n\n'
              '**Casos de uso comunes**:\n'
              '- Mostrar/ocultar elementos de UI\n'
              '- Transiciones entre estados\n'
              '- Efectos de carga\n'
              '- Indicadores de progreso',
      'img_url': '',
      'code_example': '''
// Ejemplo básico de AnimatedOpacity
class OpacityExample extends StatefulWidget {
  @override
  _OpacityExampleState createState() => _OpacityExampleState();
}

class _OpacityExampleState extends State<OpacityExample> {
  double _opacity = 0.0;

  void _changeOpacity() {
    setState(() {
      _opacity = _opacity == 0.0 ? 1.0 : 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedOpacity(
          opacity: _opacity,
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
            child: Center(
              child: Text(
                'Hola Mundo!',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _changeOpacity,
          child: Text(_opacity == 0.0 ? 'Mostrar' : 'Ocultar'),
        ),
      ],
    );
  }
}

// Uso con condicionales
class ConditionalOpacity extends StatefulWidget {
  @override
  _ConditionalOpacityState createState() => _ConditionalOpacityState();
}

class _ConditionalOpacityState extends State<ConditionalOpacity> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Opacidad Condicional')),
      body: Center(
        child: Column(
          children: [
            AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              child: Container(
                padding: EdgeInsets.all(20),
                color: Colors.green,
                child: Text('Este texto aparece/desaparece'),
              ),
            ),
            CheckboxListTile(
              title: Text('Mostrar elemento'),
              value: _isVisible,
              onChanged: (value) {
                setState(() {
                  _isVisible = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
''',
    });

    // Uso de AnimatedOpacity para Transiciones Suaves
    await db.insert('detail', {
      'id': 2,
      'subtopic_id': 's02t02l07',
      'module': 'Mid',
      'definition':
          'AnimatedOpacity es ideal para crear interfaces más dinámicas y fluidas:\n\n'
              '**Ventajas**:\n'
              '- Simplifica las animaciones de opacidad\n'
              '- Maneja automáticamente la interpolación\n'
              '- Optimiza el rendimiento\n'
              '- Soporta curvas de animación personalizadas\n\n'
              '**Parámetros clave**:\n'
              '1. opacity: Valor entre 0.0 (invisible) y 1.0 (completamente visible)\n'
              '2. duration: Cuánto dura la transición\n'
              '3. curve: Cómo progresa la animación (linear, easeIn, bounce, etc.)\n'
              '4. onEnd: Callback cuando termina la animación\n'
              '5. alwaysIncludeSemantics: Para accesibilidad\n\n'
              '**Buenas prácticas**:\n'
              '- Usar duraciones entre 200ms y 500ms para la mayoría de casos\n'
              '- Evitar cambios bruscos de estado\n'
              '- Probar diferentes curvas para el efecto deseado',
      'img_url': '',
      'code_example': '''
// Ejemplo avanzado con múltiples animaciones
class AdvancedOpacity extends StatefulWidget {
  @override
  _AdvancedOpacityState createState() => _AdvancedOpacityState();
}

class _AdvancedOpacityState extends State<AdvancedOpacity> {
  double _opacity1 = 0.0;
  double _opacity2 = 0.0;
  double _opacity3 = 0.0;

  void _startAnimations() async {
    setState(() => _opacity1 = 1.0);
    await Future.delayed(Duration(milliseconds: 300));
    setState(() => _opacity2 = 1.0);
    await Future.delayed(Duration(milliseconds: 300));
    setState(() => _opacity3 = 1.0);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _startAnimations());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animaciones Encadenadas')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: _opacity1,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOutBack,
              child: _buildAnimatedBox(Colors.red, 'Paso 1'),
            ),
            SizedBox(height: 20),
            AnimatedOpacity(
              opacity: _opacity2,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOutBack,
              child: _buildAnimatedBox(Colors.green, 'Paso 2'),
            ),
            SizedBox(height: 20),
            AnimatedOpacity(
              opacity: _opacity3,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOutBack,
              child: _buildAnimatedBox(Colors.blue, 'Paso 3'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _opacity1 = 0.0;
            _opacity2 = 0.0;
            _opacity3 = 0.0;
          });
          _startAnimations();
        },
        child: Icon(Icons.replay),
      ),
    );
  }

  Widget _buildAnimatedBox(Color color, String text) {
    return Container(
      width: 200,
      height: 60,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
    );
  }
}

// Uso con onEnd
class OpacityWithCallback extends StatefulWidget {
  @override
  _OpacityWithCallbackState createState() => _OpacityWithCallbackState();
}

class _OpacityWithCallbackState extends State<OpacityWithCallback> {
  double _opacity = 0.0;
  String _status = 'Invisible';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Callback al terminar')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(seconds: 1),
              onEnd: () {
                setState(() {
                  _status = _opacity == 1.0 ? 'Visible' : 'Invisible';
                });
              },
              child: Container(
                width: 200,
                height: 200,
                color: Colors.purple,
              ),
            ),
            SizedBox(height: 20),
            Text('Estado: \$_status'),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _opacity = _opacity == 0.0 ? 1.0 : 0.0;
                });
              },
              child: Text('Alternar Visibilidad'),
            ),
          ],
        ),
      ),
    );
  }
}
''',
    });

    // Combinación de Opacidad con otras Animaciones
    await db.insert('detail', {
      'id': 3,
      'subtopic_id': 's03t02l07',
      'module': 'Mid',
      'definition':
          'Las animaciones de opacidad se pueden combinar con otros tipos de animaciones para crear efectos más complejos y atractivos:\n\n'
              '**Combinaciones comunes**:\n'
              '1. **Opacidad + Escala**: Para efectos de zoom y aparición\n'
              '2. **Opacidad + Traslación**: Para elementos que entran/salen de la pantalla\n'
              '3. **Opacidad + Rotación**: Para efectos de giro y desvanecimiento\n'
              '4. **Opacidad + Color**: Para cambios suaves de color\n\n'
              '**Técnicas avanzadas**:\n'
              '- Usar AnimationController para mayor control\n'
              '- Combinar con Transform para efectos 3D\n'
              '- Usar Tween para interpolación personalizada\n'
              '- Aplicar múltiples transformaciones simultáneas',
      'img_url': '',
      'code_example': '''
// Combinación de opacidad y escala
class OpacityAndScale extends StatefulWidget {
  @override
  _OpacityAndScaleState createState() => _OpacityAndScaleState();
}

class _OpacityAndScaleState extends State<OpacityAndScale> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _opacity = Tween(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _scale = Tween(begin: 0.5, end: 1.5).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Opacidad + Escala')),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Opacity(
              opacity: _opacity.value,
              child: Transform.scale(
                scale: _scale.value,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Combinación de opacidad, rotación y traslación
class ComplexAnimation extends StatefulWidget {
  @override
  _ComplexAnimationState createState() => _ComplexAnimationState();
}

class _ComplexAnimationState extends State<ComplexAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<double> _rotation;
  late Animation<Offset> _position;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _opacity = Tween(begin: 0.2, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _rotation = Tween(begin: 0.0, end: 2 * math.pi).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _position = Tween<Offset>(
      begin: Offset(-0.5, 0.0),
      end: Offset(0.5, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animación Compleja')),
      body: Center(
        child: SlideTransition(
          position: _position,
          child: RotationTransition(
            turns: _rotation,
            child: FadeTransition(
              opacity: _opacity,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Uso con AnimatedContainer para múltiples propiedades
class AnimatedContainerExample extends StatefulWidget {
  @override
  _AnimatedContainerExampleState createState() => _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedContainer')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                width: _expanded ? 300 : 100,
                height: _expanded ? 300 : 100,
                decoration: BoxDecoration(
                  color: _expanded ? Colors.blueAccent : Colors.red,
                  borderRadius: BorderRadius.circular(_expanded ? 30 : 10),
                ),
                child: Center(
                  child: AnimatedOpacity(
                    duration: Duration(seconds: 1),
                    opacity: _expanded ? 1.0 : 0.0,
                    child: Text(
                      'Contenido',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('Toque para alternar'),
          ],
        ),
      ),
    );
  }
}
''',
    });
  }

  Future<void> _insertDetailsMidTopic3Level7(Database db) async {
    // Introducción a los Controladores de Animación
    await db.insert('detail', {
      'id': 1,
      'subtopic_id': 's01t03l07',
      'module': 'Mid',
      'definition':
          'AnimationController es la clase fundamental para crear animaciones personalizadas en Flutter. Proporciona control preciso sobre:\n\n'
              '- Duración de la animación\n'
              '- Dirección (forward/reverse)\n'
              '- Estado (completed/dismissed)\n'
              '- Valor actual (entre 0.0 y 1.0)\n\n'
              '**Características clave**:\n'
              '- Requiere un TickerProvider (usualmente SingleTickerProviderStateMixin)\n'
              '- Controla la progresión de la animación\n'
              '- Puede repetir, invertir o detener animaciones\n'
              '- Notifica a los listeners cuando el valor cambia\n\n'
              '**Casos de uso**:\n'
              '- Animaciones complejas\n'
              '- Secuencias de animación\n'
              '- Animaciones sincronizadas\n'
              '- Efectos personalizados',
      'img_url': '',
      'code_example': '''
// Ejemplo básico de AnimationController
class BasicAnimationController extends StatefulWidget {
  @override
  _BasicAnimationControllerState createState() => _BasicAnimationControllerState();
}

class _BasicAnimationControllerState extends State<BasicAnimationController> 
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Controlador Básico')),
      body: Center(
        child: RotationTransition(
          turns: _controller,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}

// Control manual de la animación
class ManualControlAnimation extends StatefulWidget {
  @override
  _ManualControlAnimationState createState() => _ManualControlAnimationState();
}

class _ManualControlAnimationState extends State<ManualControlAnimation> 
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Control Manual')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _animation,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _controller.forward(),
                  child: Text('Avanzar'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _controller.reverse(),
                  child: Text('Reversa'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _controller.stop(),
                  child: Text('Detener'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
''',
    });

    // Uso de AnimationController para Controlar Animaciones
    await db.insert('detail', {
      'id': 2,
      'subtopic_id': 's02t03l07',
      'module': 'Mid',
      'definition':
          'AnimationController se combina con otras clases para crear animaciones complejas:\n\n'
              '1. **Tween**: Interpola entre valores (ej. 0 a 100, rojo a azul)\n'
              '2. **CurvedAnimation**: Aplica curvas de animación no lineales\n'
              '3. **AnimationBuilder**: Reconstruye widgets cuando la animación cambia\n\n'
              '**Patrones avanzados**:\n'
              '- Animaciones encadenadas (usando then)\n'
              '- Animaciones superpuestas\n'
              '- Control de velocidad\n'
              '- Reutilización de controladores\n\n'
              '**Buenas prácticas**:\n'
              '- Siempre dispose() el controller\n'
              '- Usar SingleTickerProviderStateMixin para un controlador\n'
              '- Usar TickerProviderStateMixin para múltiples controladores\n'
              '- Evitar recrear controladores en build()',
      'img_url': '',
      'code_example': '''
// Ejemplo avanzado con Tween y CurvedAnimation
class AdvancedAnimationController extends StatefulWidget {
  @override
  _AdvancedAnimationControllerState createState() => _AdvancedAnimationControllerState();
}

class _AdvancedAnimationControllerState extends State<AdvancedAnimationController> 
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    
    _sizeAnimation = Tween(begin: 50.0, end: 200.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );
    
    _colorAnimation = ColorTween(
      begin: Colors.red,
      end: Colors.blue,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );
    
    _rotationAnimation = Tween(begin: 0.0, end: 2 * math.pi).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animación Avanzada')),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.rotate(
              angle: _rotationAnimation.value,
              child: Container(
                width: _sizeAnimation.value,
                height: _sizeAnimation.value,
                decoration: BoxDecoration(
                  color: _colorAnimation.value,
                  shape: BoxShape.circle,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Animaciones encadenadas
class ChainedAnimations extends StatefulWidget {
  @override
  _ChainedAnimationsState createState() => _ChainedAnimationsState();
}

class _ChainedAnimationsState extends State<ChainedAnimations> 
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _firstAnimation;
  late Animation<double> _secondAnimation;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this,
    );
    
    _firstAnimation = Tween(begin: 50.0, end: 200.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );
    
    _secondAnimation = Tween(begin: 200.0, end: 50.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );
    
    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animaciones Encadenadas')),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final size = _controller.value <= 0.5
                ? _firstAnimation.value
                : _secondAnimation.value;
                
            return Container(
              width: size,
              height: size,
              color: Colors.purple,
            );
          },
        ),
      ),
    );
  }
}
''',
    });

    // Sincronización de Animaciones con el Estado de la Aplicación
    await db.insert('detail', {
      'id': 3,
      'subtopic_id': 's03t03l07',
      'module': 'Mid',
      'definition': 'Las animaciones pueden sincronizarse con el estado de la aplicación para crear interfaces más dinámicas:\n\n'
          '**Técnicas comunes**:\n'
          '1. **Control basado en estado**: Iniciar/detener animaciones según el estado\n'
          '2. **Animaciones condicionales**: Diferentes animaciones para diferentes estados\n'
          '3. **Transiciones de estado**: Animaciones entre cambios de estado\n'
          '4. **Animaciones controladas por scroll**: Sync con ScrollController\n\n'
          '**Patrones avanzados**:\n'
          '- Animaciones basadas en gestos\n'
          '- Física en animaciones (usando SpringSimulation)\n'
          '- Animaciones coordinadas entre múltiples widgets\n'
          '- Integración con BLoC o Provider para gestión de estado',
      'img_url': '',
      'code_example': '''
// Animación controlada por estado
class StateControlledAnimation extends StatefulWidget {
  @override
  _StateControlledAnimationState createState() => _StateControlledAnimationState();
}

class _StateControlledAnimationState extends State<StateControlledAnimation> 
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleAnimation() {
    setState(() {
      _isPlaying = !_isPlaying;
      if (_isPlaying) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animación Controlada por Estado')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _animation,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleAnimation,
              child: Text(_isPlaying ? 'Detener' : 'Iniciar'),
            ),
          ],
        ),
      ),
    );
  }
}

// Animación sincronizada con scroll
class ScrollSyncAnimation extends StatefulWidget {
  @override
  _ScrollSyncAnimationState createState() => _ScrollSyncAnimationState();
}

class _ScrollSyncAnimationState extends State<ScrollSyncAnimation> 
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late ScrollController _scrollController;
  double _scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController.offset;
          _controller.value = (_scrollOffset % 500) / 500;
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animación con Scroll')),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Center(
              child: RotationTransition(
                turns: _controller,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.teal,
                  margin: EdgeInsets.symmetric(vertical: 50),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  title: Text('Item \$index'),
                );
              },
              childCount: 50,
            ),
          ),
        ],
      ),
    );
  }
}

// Animación con simulación física
class PhysicsAnimation extends StatefulWidget {
  @override
  _PhysicsAnimationState createState() => _PhysicsAnimationState();
}

class _PhysicsAnimationState extends State<PhysicsAnimation> 
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController.unbounded(
      vsync: this,
    );
    
    _controller.animateWith(
      SpringSimulation(
        SpringDescription.withDampingRatio(
          mass: 1.0,
          stiffness: 100.0,
          ratio: 0.5,
        ),
        0.0,   // starting point
        300.0, // ending point
        0.0,   // starting velocity
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animación con Física')),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _controller.value),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.indigo,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.animateWith(
            SpringSimulation(
              SpringDescription.withDampingRatio(
                mass: 1.0,
                stiffness: 100.0,
                ratio: 0.5,
              ),
              _controller.value,
              0.0,
              0.0,
            ),
          );
        },
        child: Icon(Icons.replay),
      ),
    );
  }
}
''',
    });
  }

  Future<void> _insertDetailsMidTopic4Level7(Database db) async {
    // Introducción a los Constructores Animados
    await db.insert('detail', {
      'id': 1,
      'subtopic_id': 's01t04l07',
      'module': 'Mid',
      'definition':
          'AnimatedBuilder es un widget que reconstruye su subtree cuando la animación cambia, permitiendo optimizar el rendimiento al reconstruir solo lo necesario.\n\n'
              '**Ventajas clave**:\n'
              '- Optimiza el rendimiento de las animaciones\n'
              '- Separa la lógica de animación de la UI\n'
              '- Permite reutilización de animaciones\n'
              '- Más eficiente que setState para animaciones complejas\n\n'
              '**Casos de uso**:\n'
              '- Widgets complejos con partes animadas\n'
              '- Cuando solo una parte del widget necesita animarse\n'
              '- Para evitar reconstrucciones innecesarias\n'
              '- En combinación con AnimationController',
      'img_url': '',
      'code_example': '''
// Ejemplo básico de AnimatedBuilder
class BasicAnimatedBuilder extends StatefulWidget {
  @override
  _BasicAnimatedBuilderState createState() => _BasicAnimatedBuilderState();
}

class _BasicAnimatedBuilderState extends State<BasicAnimatedBuilder> 
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedBuilder Básico')),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.rotate(
              angle: _animation.value * 2 * math.pi,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            );
          },
        ),
      ),
    );
  }
}

// Optimización con child
class OptimizedAnimatedBuilder extends StatefulWidget {
  @override
  _OptimizedAnimatedBuilderState createState() => _OptimizedAnimatedBuilderState();
}

class _OptimizedAnimatedBuilderState extends State<OptimizedAnimatedBuilder> 
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    
    _sizeAnimation = Tween(begin: 50.0, end: 200.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedBuilder Optimizado')),
      body: Center(
        child: AnimatedBuilder(
          animation: _sizeAnimation,
          builder: (context, child) {
            return Container(
              width: _sizeAnimation.value,
              height: _sizeAnimation.value,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: child,
            );
          },
          child: Center( // Esta parte no se reconstruye
            child: Text(
              'Tamaño variable',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
''',
    });

    // Uso de AnimatedBuilder para Crear Animaciones Personalizadas
    await db.insert('detail', {
      'id': 2,
      'subtopic_id': 's02t04l07',
      'module': 'Mid',
      'definition': 'AnimatedBuilder permite crear animaciones altamente personalizadas con un excelente rendimiento:\n\n'
          '**Técnicas avanzadas**:\n'
          '1. **Widgets hijos estáticos**: Usar el parámetro child para partes no animadas\n'
          '2. **Múltiples animaciones**: Combinar varios Animation objects\n'
          '3. **Transformaciones complejas**: Aplicar múltiples transformaciones\n'
          '4. **Personalización extrema**: Cualquier propiedad puede ser animada\n\n'
          '**Buenas prácticas**:\n'
          '- Separar la lógica de animación de la UI\n'
          '- Usar el parámetro child para optimizar\n'
          '- Evitar reconstrucciones innecesarias\n'
          '- Preferir sobre setState para animaciones complejas',
      'img_url': '',
      'code_example': '''
// Animación personalizada compleja
class ComplexCustomAnimation extends StatefulWidget {
  @override
  _ComplexCustomAnimationState createState() => _ComplexCustomAnimationState();
}

class _ComplexCustomAnimationState extends State<ComplexCustomAnimation> 
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _size;
  late Animation<Color?> _color;
  late Animation<double> _rotation;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    
    _size = Tween(begin: 50.0, end: 200.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );
    
    _color = ColorTween(
      begin: Colors.red,
      end: Colors.blue,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );
    
    _rotation = Tween(begin: 0.0, end: 2 * math.pi).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 1.0, curve: Curves.linear),
      ),
    );
    
    _opacity = Tween(begin: 0.2, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animación Personalizada Compleja')),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Opacity(
              opacity: _opacity.value,
              child: Transform.rotate(
                angle: _rotation.value,
                child: Container(
                  width: _size.value,
                  height: _size.value,
                  decoration: BoxDecoration(
                    color: _color.value,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Animación',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: _size.value / 10,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Animación de tarjeta personalizada
class CardFlipAnimation extends StatefulWidget {
  @override
  _CardFlipAnimationState createState() => _CardFlipAnimationState();
}

class _CardFlipAnimationState extends State<CardFlipAnimation> 
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _frontRotation;
  late Animation<double> _backRotation;
  bool _isFront = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    
    _frontRotation = Tween(begin: 0.0, end: 0.5).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );
    
    _backRotation = Tween(begin: 1.5, end: 2.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 1.0, curve: Curves.easeOut),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleCard() {
    if (_isFront) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    _isFront = !_isFront;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animación de Tarjeta')),
      body: Center(
        child: GestureDetector(
          onTap: _toggleCard,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final angle = _isFront 
                  ? _frontRotation.value 
                  : _backRotation.value;
              final transform = Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(angle * math.pi);
              
              return Transform(
                transform: transform,
                alignment: Alignment.center,
                child: _isFront ? _buildFrontCard() : _buildBackCard(),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildFrontCard() {
    return Container(
      width: 200,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          'Frente',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }

  Widget _buildBackCard() {
    return Container(
      width: 200,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          'Atrás',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
''',
    });

    // Combinación de Constructores Animados con otros Widgets
    await db.insert('detail', {
      'id': 3,
      'subtopic_id': 's03t04l07',
      'module': 'Mid',
      'definition':
          'AnimatedBuilder puede combinarse con otros widgets animados para crear efectos complejos:\n\n'
              '**Combinaciones comunes**:\n'
              '1. **Con Hero**: Para transiciones personalizadas\n'
              '2. **Con AnimatedList**: Para animaciones en listas\n'
              '3. **Con PageView**: Para transiciones entre páginas\n'
              '4. **Con Slivers**: Para efectos de scroll avanzados\n\n'
              '**Técnicas avanzadas**:\n'
              '- Animar propiedades de layout\n'
              '- Efectos parallax\n'
              '- Transiciones coordinadas\n'
              '- Integración con widgets de terceros',
      'img_url': '',
      'code_example': '''
// Combinación con Hero
class HeroWithAnimatedBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hero + AnimatedBuilder')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => SecondHeroScreen()));
          },
          child: Hero(
            tag: 'animatedHero',
            flightShuttleBuilder: (flightContext, animation, flightDirection,
                fromHeroContext, toHeroContext) {
              return AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: 1.0 + (animation.value * 0.5),
                    child: child,
                  );
                },
                child: fromHeroContext.widget,
              );
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.purple,
              child: Center(
                child: Text(
                  'Toque',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SecondHeroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Segunda Pantalla')),
      body: Center(
        child: Hero(
          tag: 'animatedHero',
          child: Container(
            width: 200,
            height: 200,
            color: Colors.deepPurple,
            child: Center(
              child: Text(
                'Contenido ampliado',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Combinación con AnimatedList
class AnimatedListBuilder extends StatefulWidget {
  @override
  _AnimatedListBuilderState createState() => _AnimatedListBuilderState();
}

class _AnimatedListBuilderState extends State<AnimatedListBuilder> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  final List<String> _items = [];
  int _counter = 0;

  void _addItem() {
    _items.insert(0, 'Item {++_counter}');
    _listKey.currentState!.insertItem(0);
  }

  void _removeItem(int index) {
    final removedItem = _items.removeAt(index);
    _listKey.currentState!.removeItem(
      index,
      (context, animation) => _buildRemovedItem(removedItem, animation),
    );
  }

  Widget _buildRemovedItem(String item, Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return SizeTransition(
          sizeFactor: animation,
          child: child,
        );
      },
      child: ListTile(
        title: Text(item),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedList + AnimatedBuilder')),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: _items.length,
        itemBuilder: (context, index, animation) {
          return AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            child: ListTile(
              title: Text(_items[index]),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => _removeItem(index),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        child: Icon(Icons.add),
      ),
    );
  }
}

// Combinación con PageView
class AnimatedPageView extends StatefulWidget {
  @override
  _AnimatedPageViewState createState() => _AnimatedPageViewState();
}

class _AnimatedPageViewState extends State<AnimatedPageView> {
  final PageController _pageController = PageController();
  double _currentPage = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PageView Animado')),
      body: PageView.builder(
        controller: _pageController,
        itemCount: 5,
        itemBuilder: (context, index) {
          final difference = (index - _currentPage).abs();
          final scale = 1.0 - (difference * 0.2);
          
          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              return Transform.scale(
                scale: scale,
                child: child,
              );
            },
            child: Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.primaries[index % Colors.primaries.length],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  'Página \$index',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
''',
    });
  }

  Future<void> _insertDetailsMidTopic5Level7(Database db) async {
    // Introducción a los Widgets Animados
    await db.insert('detail', {
      'id': 1,
      'subtopic_id': 's01t05l07',
      'module': 'Mid',
      'definition':
          'AnimatedWidget es una clase base que ayuda a crear widgets animados reutilizables. Simplifica el proceso de creación de widgets que dependen de animaciones.\n\n'
              '**Ventajas clave**:\n'
              '- Reduce el boilerplate\n'
              '- Crea widgets animados reutilizables\n'
              '- Separa la lógica de animación de la UI\n'
              '- Optimiza el rendimiento\n\n'
              '**Comparación con AnimatedBuilder**:\n'
              '- AnimatedWidget es más simple para widgets dedicados\n'
              '- AnimatedBuilder es más flexible para casos complejos\n'
              '- Ambos evitan reconstrucciones innecesarias\n\n'
              '**Casos de uso**:\n'
              '- Widgets animados reutilizables\n'
              '- Componentes UI con animaciones integradas\n'
              '- Librerías de widgets animados',
      'img_url': '',
      'code_example': '''
// Ejemplo básico de AnimatedWidget
class SpinningContainer extends AnimatedWidget {
  const SpinningContainer({
    Key? key,
    required Animation<double> animation,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Transform.rotate(
      angle: animation.value * 2 * math.pi,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.blue,
      ),
    );
  }
}

class BasicAnimatedWidget extends StatefulWidget {
  @override
  _BasicAnimatedWidgetState createState() => _BasicAnimatedWidgetState();
}

class _BasicAnimatedWidgetState extends State<BasicAnimatedWidget> 
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedWidget Básico')),
      body: Center(
        child: SpinningContainer(animation: _controller),
      ),
    );
  }
}

// Widget animado reutilizable
class BouncingBox extends AnimatedWidget {
  final Color color;
  
  BouncingBox({
    Key? key,
    required Animation<double> animation,
    this.color = Colors.blue,
  }) : super(key: key, listenable: animation);
  
  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Transform.translate(
      offset: Offset(0, animation.value * 100),
      child: Container(
        width: 100,
        height: 100,
        color: color,
      ),
    );
  }
}

class ReusableAnimatedWidget extends StatefulWidget {
  @override
  _ReusableAnimatedWidgetState createState() => _ReusableAnimatedWidgetState();
}

class _ReusableAnimatedWidgetState extends State<ReusableAnimatedWidget> 
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    
    _bounceAnimation = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Widget Animado Reutilizable')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BouncingBox(animation: _bounceAnimation, color: Colors.red),
            SizedBox(height: 20),
            BouncingBox(animation: _bounceAnimation, color: Colors.green),
            SizedBox(height: 20),
            BouncingBox(animation: _bounceAnimation, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}
''',
    });

    // Uso de AnimatedWidget para Crear Animaciones Reutilizables
    await db.insert('detail', {
      'id': 2,
      'subtopic_id': 's02t05l07',
      'module': 'Mid',
      'definition':
          'AnimatedWidget es ideal para crear componentes animados reutilizables:\n\n'
              '**Patrones de implementación**:\n'
              '1. **Widget dedicado**: Extender AnimatedWidget para un comportamiento específico\n'
              '2. **Configurable**: Aceptar parámetros para personalizar la animación\n'
              '3. **Componible**: Integrar con otros widgets animados\n'
              '4. **Documentado**: Incluir ejemplos de uso\n\n'
              '**Buenas prácticas**:\n'
              '- Nombrar descriptivamente (ej. FadeInWidget, SlideUpAnimation)\n'
              '- Documentar los parámetros de animación\n'
              '- Proporcionar valores por defecto razonables\n'
              '- Permitir la personalización de duración y curva\n\n'
              'Ejemplo: Crear una librería de widgets animados para:\n'
              '- Efectos de entrada/salida\n'
              '- Transiciones entre estados\n'
              '- Feedback de interacción',
      'img_url': '',
      'code_example': '''
// Librería de widgets animados reutilizables
class FadeInWidget extends AnimatedWidget {
  final Widget child;
  final Duration duration;
  
  FadeInWidget({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
  }) : super(
          key: key,
          listenable: Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: AnimationController(vsync: _AlwaysDisabledAnimationController(), duration: duration),
              curve: Curves.easeIn,
            ),
          ),
        );
  
  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Opacity(
      opacity: animation.value,
      child: child,
    );
  }
}

// Widget de deslizamiento
class SlideInWidget extends AnimatedWidget {
  final Widget child;
  final Duration duration;
  final Offset begin;
  final Offset end;
  
  SlideInWidget({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.begin = const Offset(0, 1),
    this.end = Offset.zero,
  }) : super(
          key: key,
          listenable: Tween(begin: begin, end: end).animate(
            CurvedAnimation(
              parent: AnimationController(vsync: _AlwaysDisabledAnimationController(), duration: duration),
              curve: Curves.easeOut,
            ),
          ),
        );
  
  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<Offset>;
    return Transform.translate(
      offset: animation.value,
      child: child,
    );
  }
}

// Widget de escala
class ScaleInWidget extends AnimatedWidget {
  final Widget child;
  final Duration duration;
  final double begin;
  final double end;
  
  ScaleInWidget({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.begin = 0.5,
    this.end = 1.0,
  }) : super(
          key: key,
          listenable: Tween(begin: begin, end: end).animate(
            CurvedAnimation(
              parent: AnimationController(vsync: _AlwaysDisabledAnimationController(), duration: duration),
              curve: Curves.elasticOut,
            ),
          ),
        );
  
  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Transform.scale(
      scale: animation.value,
      child: child,
    );
  }
}

// Implementación de uso
class AnimationLibraryExample extends StatefulWidget {
  @override
  _AnimationLibraryExampleState createState() => _AnimationLibraryExampleState();
}

class _AnimationLibraryExampleState extends State<AnimationLibraryExample> 
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _showWidgets = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleWidgets() {
    setState(() {
      _showWidgets = !_showWidgets;
      if (_showWidgets) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Librería de Widgets Animados')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_showWidgets) ...[
              FadeInWidget(
                duration: Duration(milliseconds: 800),
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                  margin: EdgeInsets.all(10),
                ),
              ),
              SlideInWidget(
                begin: Offset(-1, 0),
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.green,
                  margin: EdgeInsets.all(10),
                ),
              ),
              ScaleInWidget(
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                  margin: EdgeInsets.all(10),
                ),
              ),
            ],
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleWidgets,
              child: Text(_showWidgets ? 'Ocultar Widgets' : 'Mostrar Widgets'),
            ),
          ],
        ),
      ),
    );
  }
}

// Clase auxiliar para widgets que no necesitan controlador externo
class _AlwaysDisabledAnimationController extends AnimationController {
  _AlwaysDisabledAnimationController()
      : super.unbounded(
          duration: const Duration(seconds: 1),
          debugLabel: 'AlwaysDisabledAnimationController',
          vsync: const _AlwaysTickerProvider(),
        );
  
  @override
  void dispose() {}
}

class _AlwaysTickerProvider implements TickerProvider {
  const _AlwaysTickerProvider();
  
  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick, debugLabel: 'const Ticker');
  }
}
''',
    });

    // Personalización de Widgets Animados
    await db.insert('detail', {
      'id': 3,
      'subtopic_id': 's03t05l07',
      'module': 'Mid',
      'definition':
          'Los widgets animados pueden personalizarse extensamente para adaptarse a diferentes necesidades:\n\n'
              '**Áreas de personalización**:\n'
              '1. **Apariencia**: Forma, color, tamaño\n'
              '2. **Comportamiento**: Duración, curva, dirección\n'
              '3. **Disparadores**: Automático, por interacción, por estado\n'
              '4. **Composición**: Combinación con otros widgets\n\n'
              '**Técnicas avanzadas**:\n'
              '- Parámetros para personalizar la animación\n'
              '- Soporte para diferentes tipos de curvas\n'
              '- Control de la animación desde el padre\n'
              '- Integración con gestos\n'
              '- Soporte para temas y estilos\n\n'
              'Ejemplo: Widget de carga altamente personalizable con:\n'
              '- Diferentes estilos visuales\n'
              '- Variaciones de animación\n'
              '- Control de velocidad\n'
              '- Eventos de finalización',
      'img_url': '',
      'code_example': '''
// Widget de carga altamente personalizable
enum LoadingStyle { circular, linear, dots, bouncing }

class CustomLoadingWidget extends AnimatedWidget {
  final LoadingStyle style;
  final Color color;
  final double size;
  final int count;
  final bool isAnimating;
  
  CustomLoadingWidget({
    Key? key,
    required Animation<double> animation,
    this.style = LoadingStyle.circular,
    this.color = Colors.blue,
    this.size = 40.0,
    this.count = 3,
    this.isAnimating = true,
  }) : super(key: key, listenable: animation);
  
  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    
    switch (style) {
      case LoadingStyle.circular:
        return _buildCircularLoading(animation);
      case LoadingStyle.linear:
        return _buildLinearLoading(animation);
      case LoadingStyle.dots:
        return _buildDotsLoading(animation);
      case LoadingStyle.bouncing:
        return _buildBouncingLoading(animation);
    }
  }
  
  Widget _buildCircularLoading(Animation<double> animation) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        value: style == LoadingStyle.circular ? null : animation.value,
        valueColor: AlwaysStoppedAnimation<Color>(color),
        strokeWidth: size / 10,
      ),
    );
  }
  
  Widget _buildLinearLoading(Animation<double> animation) {
    return SizedBox(
      width: size * 2,
      height: size / 3,
      child: LinearProgressIndicator(
        value: animation.value,
        valueColor: AlwaysStoppedAnimation<Color>(color),
        backgroundColor: color.withOpacity(0.2),
      ),
    );
  }
  
  Widget _buildDotsLoading(Animation<double> animation) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final dotAnimation = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: ReverseAnimation(
              Interval(
                index / count,
                (index + 1) / count,
                curve: Curves.easeInOut,
              ).animate(animation),
            ),
            curve: Curves.easeInOut,
          ),
        );
        
        return AnimatedBuilder(
          animation: dotAnimation,
          builder: (context, child) {
            return Opacity(
              opacity: dotAnimation.value,
              child: Container(
                width: size / 3,
                height: size / 3,
                margin: EdgeInsets.all(size / 10),
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              ),
            );
          },
        );
      }),
    );
  }
  
  Widget _buildBouncingLoading(Animation<double> animation) {
    return SizedBox(
      height: size,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(count, (index) {
          final dotAnimation = Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: Interval(
                index / count,
                (index + 1) / count,
                curve: Curves.easeInOut,
              ).animate(animation),
              curve: Curves.elasticOut,
            ),
          );
          
          return AnimatedBuilder(
            animation: dotAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, -dotAnimation.value * size / 2),
                child: Container(
                  width: size / 3,
                  height: size / 3,
                  margin: EdgeInsets.all(size / 10),
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}

// Ejemplo de uso
class CustomLoadingExample extends StatefulWidget {
  @override
  _CustomLoadingExampleState createState() => _CustomLoadingExampleState();
}

class _CustomLoadingExampleState extends State<CustomLoadingExample> 
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  LoadingStyle _style = LoadingStyle.circular;
  Color _color = Colors.blue;
  double _size = 40.0;
  int _count = 3;
  bool _isAnimating = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleAnimation() {
    setState(() {
      _isAnimating = !_isAnimating;
      if (_isAnimating) {
        _controller.repeat();
      } else {
        _controller.stop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Widget de Carga Personalizable')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomLoadingWidget(
              animation: _controller,
              style: _style,
              color: _color,
              size: _size,
              count: _count,
              isAnimating: _isAnimating,
            ),
            SizedBox(height: 40),
            DropdownButton<LoadingStyle>(
              value: _style,
              onChanged: (value) {
                setState(() {
                  _style = value!;
                });
              },
              items: LoadingStyle.values.map((style) {
                return DropdownMenuItem(
                  value: style,
                  child: Text(style.toString().split('.').last),
                );
              }).toList(),
            ),
            Slider(
              value: _size,
              min: 20,
              max: 100,
              onChanged: (value) {
                setState(() {
                  _size = value;
                });
              },
            ),
            ColorPicker(
              color: _color,
              onColorChanged: (color) {
                setState(() {
                  _color = color;
                });
              },
            ),
            ElevatedButton(
              onPressed: _toggleAnimation,
              child: Text(_isAnimating ? 'Detener' : 'Iniciar'),
            ),
          ],
        ),
      ),
    );
  }
}

// Selector de color simple
class ColorPicker extends StatelessWidget {
  final Color color;
  final ValueChanged<Color> onColorChanged;
  
  ColorPicker({required this.color, required this.onColorChanged});
  
  final List<Color> _colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
  ];
  
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: _colors.map((c) {
        return GestureDetector(
          onTap: () => onColorChanged(c),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: c,
              shape: BoxShape.circle,
              border: Border.all(
                color: color == c ? Colors.black : Colors.transparent,
                width: 2,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
''',
    });
  }

  Future<void> insertDetailsMidLevel8(Database db) async {
    try {
      await _insertDetailsMidTopic1Level8(db); // Introducción a RxDart
    } catch (e) {
      debugPrint("Error inserting details mid level 8: $e");
    }
  }

  Future<void> _insertDetailsMidTopic1Level8(Database db) async {
    // Introducción a RxDart
    await db.insert('detail', {
      'id': 1,
      'subtopic_id': 's01t01l08',
      'module': 'Mid',
      'definition':
          'RxDart es una librería que extiende las capacidades de los Streams nativos de Dart, añadiendo operadores y tipos de streams adicionales inspirados en ReactiveX.\n\n'
              '**Características principales**:\n'
              '- Más de 30 operadores adicionales\n'
              '- Tipos de Stream especializados (BehaviorSubject, ReplaySubject)\n'
              '- Compatible con los Streams nativos de Dart\n'
              '- Patrón Observer mejorado\n\n'
              '**Beneficios**:\n'
              '- Manejo más poderoso de flujos de datos\n'
              '- Operaciones complejas con menos código\n'
              '- Ideal para gestión de estado reactivo\n'
              '- Ampliamente usado con BLoC\n\n'
              '**Casos de uso**:\n'
              '- Gestión de estado reactivo\n'
              '- Manejo de eventos complejos\n'
              '- Combinación de múltiples fuentes de datos\n'
              '- Debounce y throttle de eventos',
      'img_url': '',
      'code_example': '''
// Configuración básica
dependencies:
  rxdart: ^0.27.7

// Ejemplo básico de Subject
import 'package:rxdart/rxdart.dart';

void main() {
  // Crear un Subject (similar a StreamController pero con más funcionalidades)
  final subject = BehaviorSubject<int>();
  
  // Escuchar los valores emitidos
  final subscription = subject.stream.listen(
    (value) =>debugPrint('Valor recibido: \$value'),
  );
  
  // Emitir valores
  subject.add(1);
  subject.add(2);
  subject.add(3);
  
  // No olvidar cerrar el subject y las suscripciones
  subscription.cancel();
  subject.close();
}

// Ejemplo con operadores RxDart
void rxdartOperatorsExample() {
  final subject = PublishSubject<int>();
  
  subject
    .where((number) => number % 2 == 0) // Filtra números pares
    .map((number) => number * 2)        // Multiplica por 2
    .debounceTime(Duration(milliseconds: 500)) // Espera 500ms sin eventos
    .listen((number) =>debugPrint('Número procesado: \$number'));
  
  // Simular entrada de datos
  subject.add(1);
  subject.add(2);
  subject.add(3);
  subject.add(4);
  
  Future.delayed(Duration(milliseconds: 600), () {
    subject.add(5); // Solo este llegará al listener por el debounce
    subject.close();
  });
}

// Comparación entre Stream nativo y RxDart
void compareWithNativeStream() {
  // Stream nativo
  final nativeController = StreamController<int>();
  nativeController.stream
    .where((n) => n > 5)
    .listen(print);
  
  // RxDart
  final rxSubject = BehaviorSubject<int>();
  rxSubject
    .where((n) => n > 5)
    .debounceTime(Duration(milliseconds: 300))
    .listen(print);
  
  // RxDart ofrece muchos más operadores como:
  // debounce, throttle, buffer, combineLatest, switchMap, etc.
}
''',
    });

    // Uso de Streams y Observables en RxDart
    await db.insert('detail', {
      'id': 1,
      'subtopic_id': 's02t01l08',
      'module': 'Mid',
      'definition':
          'RxDart extiende los Streams nativos de Dart con el concepto de Observables, que son Streams con operadores adicionales.\n\n'
              '**Diferencias clave**:\n'
              '- Observable es una clase wrapper alrededor de Stream\n'
              '- Todos los operadores de Stream están disponibles\n'
              '- Añade operadores adicionales de ReactiveX\n'
              '- Permite composición más declarativa\n\n'
              '**Conversión entre Stream y Observable**:\n'
              '- Stream.toObservable(): Convierte un Stream en Observable\n'
              '- Observable.stream: Obtiene el Stream subyacente\n\n'
              '**Ventajas de Observables**:\n'
              '- Sintaxis más fluida para operadores\n'
              '- Mejor manejo de errores\n'
              '- Operadores especializados para casos comunes\n'
              '- Compatibilidad con otras librerías ReactiveX',
      'img_url': '',
      'code_example': '''
// Creación de Observables
void createObservables() {
  // Desde valores
  Observable.just(42).listen(print);
  
  // Desde iterable
  Observable.fromIterable([1, 2, 3]).listen(print);
  
  // Desde Future
  Observable.fromFuture(Future.value('Hola')).listen(print);
  
  // Desde Stream
  final stream = Stream.periodic(Duration(seconds: 1), (i) => i);
  Observable(stream)
    .take(5)
    .listen(print); // 0, 1, 2, 3, 4
    
  // Creación con timer
  Observable.timer('Retrasado', Duration(seconds: 2)).listen(print);
  
  // Creación con intervalo
  Observable.interval(Duration(seconds: 1))
    .map((i) => 'Tick \$i')
    .take(3)
    .listen(print); // Tick 0, Tick 1, Tick 2
}

// Operadores exclusivos de Observable
void observableOperators() {
  // 1. concatWith - Concatena múltiples observables
  Observable.just(1)
    .concatWith([Observable.just(2), Observable.just(3)])
    .listen(print); // 1, 2, 3
  
  // 2. exhaustMap - Ignora nuevos items mientras procesa uno actual
  Observable.interval(Duration(milliseconds: 500))
    .take(5)
    .exhaustMap((i) => Observable.timer(i, Duration(seconds: 1)))
    .listen(print); // Solo emite 0 y 4
  
  // 3. bufferCount - Agrupa en buffers de tamaño fijo
  Observable.range(1, 10)
    .bufferCount(3)
    .listen(print); // [1,2,3], [4,5,6], [7,8,9], [10]
  
  // 4. flatMapLatest - Similar a switchMap
  Observable.interval(Duration(milliseconds: 800))
    .take(3)
    .flatMapLatest((i) => Observable.interval(Duration(milliseconds: 200)).take(3))
    .listen(print); // 0,0,1,0,1,2
}

// Manejo avanzado de errores
void errorHandling() {
  Observable(Stream.error(Exception('Error!')))
    .onErrorResumeNext(Observable.just('Recuperado'))
    .listen(print); // Emite 'Recuperado'
    
  Observable.range(1, 5)
    .map((i) {
      if (i == 3) throw Exception('Error en 3');
      return i;
    })
    .retryWhen((errors, _) => errors.delay(Duration(seconds: 1)).take(5))
    .listen(print, onError: print); // 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, Error
}

// Ejemplo real: Autocomplete con RxDart
class SearchBloc {
  final _searchQuery = PublishSubject<String>();
  final _results = BehaviorSubject<List<String>>.seeded([]);
  
  SearchBloc() {
    _searchQuery
      .debounceTime(Duration(milliseconds: 300))
      .distinct()
      .switchMap(_search)
      .listen(_results.add);
  }
  
  Observable<List<String>> get results => _results.stream;
  
  void search(String query) => _searchQuery.add(query);
  
  Observable<List<String>> _search(String query) {
    if (query.isEmpty) return Observable.just([]);
    
    return Observable.fromFuture(_fetchSuggestions(query))
      .startWith(['Buscando...'])
      .onErrorReturnWith((e) => ['Error: \$e']);
  }
  
  Future<List<String>> _fetchSuggestions(String query) async {
    // Simular API call
    await Future.delayed(Duration(milliseconds: 500));
    return List.generate(3, (i) => '\$query sugerencia \$i');
  }
  
  void dispose() {
    _searchQuery.close();
    _results.close();
  }
}
''',
    });

    // Combinación de RxDart con BLoC
    await db.insert('detail', {
      'id': 1,
      'subtopic_id': 's03t01l08',
      'module': 'Mid',
      'definition':
          'RxDart y BLoC son una combinación poderosa para la gestión de estado en Flutter:\n\n'
              '**Cómo se integran**:\n'
              '- BLoC maneja la lógica de negocio\n'
              '- RxDart proporciona los streams reactivos\n'
              '- Los widgets escuchan los streams del BLoC\n\n'
              '**Ventajas de la combinación**:\n'
              '- Separación clara de responsabilidades\n'
              '- Código más declarativo\n'
              '- Manejo poderoso de eventos asíncronos\n'
              '- Fácil de testear\n\n'
              '**Patrón típico**:\n'
              '1. Eventos entran al BLoC a través de Sinks\n'
              '2. BLoC procesa y transforma los eventos\n'
              '3. Estados salen del BLoC a través de Streams\n'
              '4. Widgets se reconstruyen con los nuevos estados',
      'img_url': '',
      'code_example': '''
// Implementación básica de BLoC con RxDart
class CounterBloc {
  // Sinks para entrada de eventos
  final _incrementController = PublishSubject<void>();
  final _decrementController = PublishSubject<void>();
  
  // Streams para salida de estado
  final _count = BehaviorSubject<int>.seeded(0);
  
  CounterBloc() {
    // Manejar incrementos con debounce
    _incrementController
      .debounceTime(Duration(milliseconds: 300))
      .listen((_) => _count.add(_count.value + 1));
    
    // Manejar decrementos
    _decrementController
      .debounceTime(Duration(milliseconds: 300))
      .listen((_) => _count.add(_count.value - 1));
  }
  
  // Entradas públicas
  Sink<void> get increment => _incrementController.sink;
  Sink<void> get decrement => _decrementController.sink;
  
  // Salidas públicas
  Stream<int> get count => _count.stream;
  
  void dispose() {
    _incrementController.close();
    _decrementController.close();
    _count.close();
  }
}

// Uso en Flutter
class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CounterBloc>();
    
    return Scaffold(
      appBar: AppBar(title: Text('Counter BLoC')),
      body: Center(
        child: StreamBuilder<int>(
          stream: bloc.count,
          builder: (context, snapshot) {
            return Text(
              'Count: {snapshot.data ?? 0}',
              style: TextStyle(fontSize: 24),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => bloc.increment.add(null),
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => bloc.decrement.add(null),
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

// Configuración del BLoC
void main() {
  runApp(
    Provider(
      create: (context) => CounterBloc(),
      dispose: (context, bloc) => bloc.dispose(),
      child: MyApp(),
    ),
  );
}

// Ejemplo avanzado: BLoC para búsqueda
class SearchBloc {
  final _queryController = PublishSubject<String>();
  final _results = BehaviorSubject<List<String>>.seeded([]);
  final _isLoading = BehaviorSubject<bool>.seeded(false);
  final _api = SearchApi();
  
  SearchBloc() {
    _queryController
      .debounceTime(Duration(milliseconds: 300))
      .distinct()
      .switchMap(_search)
      .listen(_results.add);
  }
  
  Stream<List<String>> _search(String query) {
    if (query.isEmpty) return Stream.value([]);
    
    _isLoading.add(true);
    
    return _api.search(query)
      .asStream()
      .doOnData((_) => _isLoading.add(false))
      .doOnError((_, __) => _isLoading.add(false))
      .onErrorReturnWith((e) => ['Error: \$e']);
  }
  
  // Entradas
  Sink<String> get search => _queryController.sink;
  
  // Salidas
  Stream<List<String>> get results => _results.stream;
  Stream<bool> get isLoading => _isLoading.stream;
  
  void dispose() {
    _queryController.close();
    _results.close();
    _isLoading.close();
  }
}

class SearchApi {
  Future<List<String>> search(String query) async {
    await Future.delayed(Duration(milliseconds: 500));
    return List.generate(3, (i) => '\$query resultado \$i');
  }
}
''',
    });
  }

  Future<void> insertDetailsMidLevel9(Database db) async {
    try {
      // Topic 1: Fastlane
      await _insertDetailsMidTopic1Level9(db); // Fastlane

      // Topic 2: Codemagic
      await _insertDetailsMidTopic2Level9(db); // Codemagic

      // Topic 3: Bitrise
      await _insertDetailsMidTopic3Level9(db); // Bitrise

      // Topic 4: GitHub Actions
      await _insertDetailsMidTopic4Level9(db); // GitHub Actions

      // Topic 5: Firebase App Distribution
      await _insertDetailsMidTopic5Level9(db); // Firebase App Distribution
    } catch (e) {
      debugPrint("Error inserting details mid level 9: $e");
    }
  }

  // Topic 1: Fastlane
  Future<void> _insertDetailsMidTopic1Level9(Database db) async {
    // Introducción a Fastlane
    await db.insert('detail', {
      'id': 1,
      'subtopic_id': 's01t01l09',
      'module': 'Mid',
      'definition':
          'Fastlane es una herramienta de automatización para desarrolladores móviles que simplifica los procesos de despliegue y publicación de aplicaciones.\n\n'
              '**Características principales**:\n'
              '- Automatización de builds y deployments\n'
              '- Gestión de certificados y perfiles de provisioning\n'
              '- Publicación en App Store y Google Play\n'
              '- Integración con otras herramientas CI/CD\n\n'
              '**Ventajas**:\n'
              '- Ahorra tiempo en procesos repetitivos\n'
              '- Reduce errores humanos en despliegues\n'
              '- Configuración como código (Ruby)\n'
              '- Gran ecosistema de plugins\n\n'
              '**Casos de uso**:\n'
              '- Automatización de builds de producción\n'
              '- Gestión de certificados iOS\n'
              '- Despliegues continuos en stores\n'
              '- Generación de screenshots para stores',
      'img_url': '',
      'code_example': '''
# Instalación de Fastlane
# Requiere Ruby 2.5 o superior
sudo gem install fastlane -NV

# Configuración inicial en proyecto Flutter
cd your_flutter_project/ios
fastlane init
# O para Android:
cd your_flutter_project/android
fastlane init

# Fastfile ejemplo (ios/fastlane/Fastfile)
default_platform(:ios)

platform :ios do
  desc "Push a new beta build to TestFlight"
  lane :beta do
    increment_build_number
    build_app(workspace: "Runner.xcworkspace", scheme: "Runner")
    upload_to_testflight
  end

  desc "Deploy a new version to the App Store"
  lane :release do
    increment_build_number
    build_app(workspace: "Runner.xcworkspace", scheme: "Runner")
    upload_to_app_store
  end
end

# Ejecución de lanes
fastlane ios beta
fastlane ios release
''',
    });

    // Automatización de Despliegues con Fastlane
    await db.insert('detail', {
      'id': 2,
      'subtopic_id': 's02t01l09',
      'module': 'Mid',
      'definition':
          'Fastlane permite automatizar todo el proceso de despliegue para aplicaciones Flutter:\n\n'
              '**Flujo típico de automatización**:\n'
              '1. Incrementar números de versión\n'
              '2. Generar builds firmados\n'
              '3. Subir a plataformas de distribución\n'
              '4. Gestionar metadatos de la app\n\n'
              '**Componentes clave**:\n'
              '- **Actions**: Tareas individuales (ej. increment_build_number)\n'
              '- **Lanes**: Flujos de trabajo que combinan actions\n'
              '- **Plugins**: Funcionalidades extendidas\n'
              '- **Envs**: Variables de entorno\n\n'
              '**Buenas prácticas**:\n'
              '- Usar match para gestión de certificados\n'
              '- Automatizar la generación de screenshots\n'
              '- Implementar CI/CD con Fastlane\n'
              '- Usar lanes separadas para diferentes entornos',
      'img_url': '',
      'code_example': '''
# Fastfile avanzado para Flutter (iOS y Android)
default_platform(:ios)

platform :ios do
  before_all do
    setup_circle_ci
  end

  desc "Build and deploy to TestFlight"
  lane :beta do
    # Actualizar versión/build
    increment_build_number(
      build_number: number_of_commits
    )
    
    # Build Flutter
    flutter_build_ios
    
    # Subir a TestFlight
    upload_to_testflight(
      skip_waiting_for_build_processing: true
    )
    
    # Notificar equipo
    slack(message: "Nuevo beta desplegado: #{lane_context[SharedValues::VERSION_NUMBER]}")
  end
end

platform :android do
  desc "Deploy a new beta version to Firebase App Distribution"
  lane :beta do
    # Build Flutter
    flutter_build_android(
      flavor: "prod",
      build_type: "release"
    )
    
    # Subir a Firebase
    firebase_app_distribution(
      app: "com.example.app",
      groups: "testers",
      release_notes_file: "../release_notes.txt"
    )
  end
end

# Plugin para builds Flutter
fastlane add_plugin flutter

# Matchfile para gestión de certificados
git_url("https://github.com/your-company/certificates-repo")
storage_mode("git")
type("development") # También 'appstore' y 'adhoc'
app_identifier(["com.example.app"])
username("user@company.com")
''',
    });

    // Configuración de Fastlane para iOS y Android
    await db.insert('detail', {
      'id': 3,
      'subtopic_id': 's03t01l09',
      'module': 'Mid',
      'definition':
          'La configuración de Fastlane varía entre plataformas, pero sigue principios similares:\n\n'
              '**Para iOS**:\n'
              '- Requiere Xcode y herramientas de desarrollador\n'
              '- Necesita gestión de certificados/provisioning\n'
              '- Uso de match recomendado para equipo\n\n'
              '**Para Android**:\n'
              '- Require Keystore de firma\n'
              '- Más simple que iOS en general\n'
              '- Integración directa con Google Play\n\n'
              '**Configuración común**:\n'
              '1. **Appfile**: Configuración básica de la app\n'
              '2. **Fastfile**: Lógicas de automatización\n'
              '3. **Matchfile**: Gestión de certificados (iOS)\n'
              '4. **Pluginfile**: Plugins adicionales\n\n'
              '**Consideraciones Flutter**:\n'
              '- Builds Flutter antes de plataforma nativa\n'
              '- Configurar ambos proyectos (ios/ y android/)',
      'img_url': '',
      'code_example': '''
# Configuración iOS (ios/Appfile)
app_identifier("com.example.app") # Bundle identifier
apple_id("user@company.com") # Apple ID
team_id("TEAM12345") # Team ID
itc_team_id("TEAM67890") # App Store Connect Team ID

# Configuración Android (android/Appfile)
json_key_file("~/path/to/google-play-key.json") # Clave API Google Play
package_name("com.example.app")

# Matchfile para iOS (ios/Matchfile)
git_url("https://github.com/your-company/certificates-repo")
storage_mode("git")
type("appstore")
app_identifier(["com.example.app"])
username("user@company.com")

# Ejemplo de lane para Flutter iOS
lane :flutter_build_ios do
  # Ejecutar build Flutter
  sh("flutter", "build", "ios", "--release", "--no-codesign")
  
  # Firmar y preparar para distribución
  build_app(
    workspace: "Runner.xcworkspace",
    scheme: "Runner",
    export_method: "app-store",
    export_options: {
      provisioningProfiles: {
        "com.example.app" => "match AppStore com.example.app"
      }
    }
  )
end

# Ejemplo de lane para Flutter Android
lane :flutter_build_android do |options|
  flavor = options[:flavor] || "prod"
  build_type = options[:build_type] || "release"
  
  # Ejecutar build Flutter
  sh("flutter", "build", "apk", "--#{build_type}", "--flavor", flavor)
  
  # Firmar APK (alternativa al firmado automático de Flutter)
  android_sign(
    keystore_path: "path/to/keystore.jks",
    keystore_password: ENV["KEYSTORE_PASSWORD"],
    key_alias: ENV["KEY_ALIAS"],
    key_password: ENV["KEY_PASSWORD"],
    apk_path: "../build/app/outputs/flutter-apk/app-#{flavor}-#{build_type}.apk"
  )
end

# Integración con Flutter
desc "Build and deploy both platforms"
lane :deploy_all do
  # iOS
  flutter_build_ios
  upload_to_testflight
  
  # Android
  flutter_build_android
  upload_to_play_store
end
''',
    });
  }

  // Topic 2: Codemagic
  Future<void> _insertDetailsMidTopic2Level9(Database db) async {
    // Introducción a Codemagic
    await db.insert('detail', {
      'id': 1,
      'subtopic_id': 's01t02l09',
      'module': 'Mid',
      'definition':
          'Codemagic es un servicio de CI/CD especializado en aplicaciones móviles, con soporte nativo para Flutter.\n\n'
              '**Características principales**:\n'
              '- Configuración como código (YAML)\n'
              '- Máquinas virtuales con entorno preconfigurado\n'
              '- Builds simultáneos para iOS y Android\n'
              '- Integración con stores y servicios de distribución\n\n'
              '**Ventajas**:\n'
              '- Fácil configuración para Flutter\n'
              '- No requiere mantenimiento de infraestructura\n'
              '- Soporte para builds iOS sin Mac local\n'
              '- Generación automática de changelogs\n\n'
              '**Casos de uso**:\n'
              '- CI/CD para equipos Flutter\n'
              '- Builds automatizados en cada commit\n'
              '- Distribución a testers\n'
              '- Publicación automática en stores',
      'img_url': '',
      'code_example': '''
# Configuración básica (codemagic.yaml)
workflows:
  flutter-app:
    name: Flutter App CI
    environment:
      groups:
        - keystore
      vars:
        FLAVOR: "prod"
    scripts:
      - flutter pub get
      - flutter analyze
      - flutter test
    artifacts:
      - build/**/outputs/**/*.apk
      - build/ios/ipa/*.ipa
    publishing:
      email:
        recipients:
          - team@example.com
''',
    });

    // Configuración de CI/CD con Codemagic
    await db.insert('detail', {
      'id': 2,
      'subtopic_id': 's02t02l09',
      'module': 'Mid',
      'definition':
          'Configurar CI/CD en Codemagic implica definir flujos de trabajo en YAML que especifican:\n\n'
              '1. **Entorno**: Versiones de Flutter, Xcode, etc.\n'
              '2. **Scripts**: Comandos para ejecutar\n'
              '3. **Artefactos**: Archivos a guardar\n'
              '4. **Publicación**: Destinos de despliegue\n\n'
              '**Componentes clave**:\n'
              '- **Workflows**: Configuraciones independientes\n'
              '- **Environment variables**: Datos sensibles\n'
              '- **Triggers**: Eventos que inician builds\n'
              '- **Caching**: Para acelerar builds\n\n'
              '**Buenas prácticas**:\n'
              '- Usar grupos de variables para credenciales\n'
              '- Separar workflows por propósito\n'
              '- Implementar pruebas automáticas\n'
              '- Notificar resultados al equipo',
      'img_url': '',
      'code_example': '''
# codemagic.yaml avanzado
workflows:
  development:
    name: Dev Build
    triggering:
      events:
        - push
      branch_patterns:
        - pattern: develop
          include: true
          build_on: every_commit
    environment:
      flutter: stable
      xcode: latest
      cocoapods: default
      groups:
        - app_credentials
    scripts:
      - name: Install dependencies
        script: |
          flutter pub get
          cd ios && pod install
      - name: Run tests
        script: flutter test
      - name: Build Android
        script: flutter build apk --flavor dev
      - name: Build iOS
        script: flutter build ios --flavor dev --no-codesign
    artifacts:
      - build/**/outputs/**/*.apk
      - build/ios/**/*.ipa
    publishing:
      email:
        recipients:
          - dev-team@example.com

  production:
    name: Prod Release
    triggering:
      events:
        - tag
    environment:
      flutter: stable
      groups:
        - app_credentials
        - prod_keystore
    scripts:
      - flutter pub get
      - flutter analyze
      - flutter test
      - flutter build appbundle --flavor prod --release
      - flutter build ios --release --no-codesign
    publishing:
      app_store_connect:
        api_key: APP_STORE_CONNECT_PRIVATE_KEY
        key_id: APP_STORE_CONNECT_KEY_IDENTIFIER
        issuer_id: APP_STORE_CONNECT_ISSUER_ID
      google_play:
        credentials: GCLOUD_SERVICE_ACCOUNT_CREDENTIALS
        track: production
''',
    });

    // Automatización de Pruebas y Despliegues con Codemagic
    await db.insert('detail', {
      'id': 3,
      'subtopic_id': 's03t02l09',
      'module': 'Mid',
      'definition':
          'Codemagic permite automatizar pruebas y despliegues en un flujo completo:\n\n'
              '**Flujo típico**:\n'
              '1. Ejecutar pruebas unitarias y de widget\n'
              '2. Generar builds de desarrollo para testers\n'
              '3. Publicar builds beta en TestFlight/Firebase\n'
              '4. Desplegar a producción en stores\n\n'
              '**Características avanzadas**:\n'
              '- **Pruebas en dispositivos virtuales**: Android emulator\n'
              '- **Análisis de código**: Flutter analyze\n'
              '- **Generación de changelogs**: Desde commits\n'
              '- **Notificaciones**: Slack, email, etc.\n\n'
              '**Integraciones**:\n'
              '- Firebase App Distribution\n'
              '- App Store Connect\n'
              '- Google Play Console\n'
              '- Slack/MS Teams\n'
              '- GitHub Releases',
      'img_url': '',
      'code_example': '''
# Ejemplo completo con pruebas y despliegues
workflows:
  test-and-deploy:
    name: Test & Deploy
    environment:
      flutter: stable
      groups:
        - firebase_credentials
        - app_store_credentials
    scripts:
      # Paso 1: Pruebas
      - name: Run tests
        script: |
          flutter analyze
          flutter test
          flutter test integration_test
      
      # Paso 2: Build Android
      - name: Build Android
        script: flutter build apk --release --flavor prod
      
      # Paso 3: Build iOS
      - name: Build iOS
        script: |
          flutter build ios --release --no-codesign
          cd ios
          fastlane beta
        
      # Paso 4: Subir a Firebase
      - name: Deploy to Firebase
        script: |
          flutter pub run flutterfire_cli:flutterfire distribute 
            --release-notes-file release_notes.txt 
            --groups testers
        
    publishing:
      app_store_connect:
        api_key: APP_STORE_CONNECT_PRIVATE_KEY
        key_id: APP_STORE_CONNECT_KEY_IDENTIFIER
        issuer_id: APP_STORE_CONNECT_ISSUER_ID
      firebase:
        firebase_token: FIREBASE_TOKEN
        app_id: FIREBASE_APP_ID
      slack:
        channel: '#releases'
        notify_on_build_start: true
''',
    });
  }

  // Topic 3: Bitrise
  Future<void> _insertDetailsMidTopic3Level9(Database db) async {
    // Introducción a Bitrise
    await db.insert('detail', {
      'id': 1,
      'subtopic_id': 's01t03l09',
      'module': 'Mid',
      'definition':
          'Bitrise es una plataforma de CI/CD especializada en desarrollo móvil con soporte para Flutter.\n\n'
              '**Características principales**:\n'
              '- Entornos preconfigurados para iOS/Android\n'
              '- Workflows visuales y configurables\n'
              '- Gran colección de steps (acciones)\n'
              '- Soporte para máquinas macOS y Linux\n\n'
              '**Ventajas**:\n'
              '- Interfaz visual intuitiva\n'
              '- Integración con múltiples herramientas\n'
              '- Escalable para equipos grandes\n'
              '- Soporte para workflows complejos\n\n'
              '**Casos de uso**:\n'
              '- CI/CD para aplicaciones híbridas\n'
              '- Flujos de trabajo multi-plataforma\n'
              '- Distribución interna de apps\n'
              '- Automatización de certificados',
      'img_url': '',
      'code_example': '''
# bitrise.yml (configuración generada)
format_version: '13'
default_step_lib_source: https://github.com/bitrise-io/bitrise-steplib.git
project_type: flutter

workflows:
  primary:
    steps:
    - activate-ssh-key:
        run_if: '{{getenv "SSH_RSA_PRIVATE_KEY" | ne ""}}'
    - git-clone: {}
    - flutter-installer:
        inputs:
        - flutter_version: 3.7.0
    - flutter-analyze: {}
    - flutter-test: {}
    - flutter-build:
        inputs:
        - platform: both
        - ios_output_type: archive
    - deploy-to-bitrise-io: {}
''',
    });

    // Configuración de CI/CD con Bitrise
    await db.insert('detail', {
      'id': 2,
      'subtopic_id': 's02t03l09',
      'module': 'Mid',
      'definition':
          'Configurar CI/CD en Bitrise implica definir workflows con steps específicos:\n\n'
              '**Componentes principales**:\n'
              '1. **Apps**: Configuración por proyecto\n'
              '2. **Workflows**: Secuencias de pasos\n'
              '3. **Steps**: Acciones individuales\n'
              '4. **Triggers**: Eventos que inician builds\n\n'
              '**Pasos comunes para Flutter**:\n'
              '- flutter-installer: Configura versión de Flutter\n'
              '- flutter-analyze: Ejecuta análisis de código\n'
              '- flutter-test: Ejecuta pruebas\n'
              '- flutter-build: Genera artefactos\n'
              '- deploy: Publica resultados\n\n'
              '**Buenas prácticas**:\n'
              '- Usar variables de entorno para datos sensibles\n'
              '- Separar workflows por propósito\n'
              '- Implementar caching para dependencias\n'
              '- Monitorear tiempos de build',
      'img_url': '',
      'code_example': '''
# Workflow avanzado para Flutter (bitrise.yml)
workflows:
  test-and-deploy:
    envs:
    - FLAVOR: "prod"
    - BUILD_TYPE: "release"
    steps:
    # Configuración inicial
    - git-clone: {}
    - flutter-installer:
        inputs:
        - flutter_version: stable
    - cache-pull: {}
    
    # Dependencias
    - script:
        title: Install dependencies
        inputs:
        - content: |
            flutter pub get
            cd ios && pod install
    
    # Pruebas
    - flutter-analyze: {}
    - flutter-test:
        inputs:
        - additional_params: "--coverage"
    - script:
        title: Upload coverage
        inputs:
        - content: bash <(curl -s https://codecov.io/bash)
    
    # Build Android
    - flutter-build:
        title: Build Android
        inputs:
        - platform: android
        - entry_file: "lib/main_prod.dart"
        - build_params: "--flavor FLAVOR --BUILD_TYPE"
    
    # Build iOS
    - certificate-and-profile-installer: {}
    - flutter-build:
        title: Build iOS
        inputs:
        - platform: ios
        - entry_file: "lib/main_prod.dart"
        - build_params: "--flavor FLAVOR --BUILD_TYPE --no-codesign"
        - ios_output_type: archive
    
    # Despliegue
    - deploy-to-bitrise-io: {}
    - firebase-app-distribution:
        inputs:
        - app_path: "BITRISE_FLUTTER_APK_PATH"
        - firebase_token: "FIREBASE_TOKEN"
        - groups: "testers"
''',
    });

    // Automatización de Pruebas y Despliegues con Bitrise
    await db.insert('detail', {
      'id': 3,
      'subtopic_id': 's03t03l09',
      'module': 'Mid',
      'definition':
          'Bitrise permite implementar flujos completos de CI/CD para Flutter:\n\n'
              '**Flujo avanzado típico**:\n'
              '1. **Preparación**: Clonar repo, configurar entorno\n'
              '2. **Pruebas**: Unitarias, de widget, integración\n'
              '3. **Build**: Generar APK/IPA firmados\n'
              '4. **Despliegue**: Distribuir a testers o stores\n\n'
              '**Features avanzadas**:\n'
              '- **Pruebas en dispositivos reales**: Firebase Test Lab\n'
              '- **Análisis de código**: SonarQube integration\n'
              '- **Gestión de dependencias**: Caching inteligente\n'
              '- **Notificaciones**: Slack, email, webhooks\n\n'
              '**Integraciones clave**:\n'
              '- App Store Connect\n'
              '- Google Play Console\n'
              '- Firebase App Distribution\n'
              '- TestFlight\n'
              '- DeployGate',
      'img_url': '',
      'code_example': '''
# Workflow completo con pruebas en dispositivos reales
workflows:
  full-pipeline:
    envs:
    - FLAVOR: "prod"
    - BUILD_TYPE: "release"
    steps:
    # Configuración inicial
    - git-clone: {}
    - flutter-installer:
        inputs:
        - flutter_version: stable
    - cache-pull: {}
    
    # Instalar dependencias
    - script:
        title: Install dependencies
        inputs:
        - content: |
            flutter pub get
            cd ios && pod install
    
    # Pruebas estáticas
    - flutter-analyze: {}
    - dart-format-check: {}
    
    # Pruebas unitarias
    - flutter-test:
        inputs:
        - additional_params: "--coverage"
    
    # Pruebas de integración en Firebase Test Lab
    - flutter-test:
        title: Run integration tests
        inputs:
        - additional_params: "--flavor FLAVOR -t integration_test/app_test.dart"
    - firebase-test-lab-for-android:
        inputs:
        - gcloud_service_account_json_key_path: "GCLOUD_SERVICE_ACCOUNT_JSON_KEY_PATH"
        - device_type: "physical"
        - device_ids: "model=redfin,version=30"
        - test_app_path: "BITRISE_TEST_APK_PATH"
    
    # Builds
    - certificate-and-profile-installer: {}
    - flutter-build:
        title: Build Android App Bundle
        inputs:
        - platform: android
        - build_params: "--flavor FLAVOR --BUILD_TYPE --target=lib/main_prod.dart"
        - android_output_type: appbundle
    - flutter-build:
        title: Build iOS Archive
        inputs:
        - platform: ios
        - build_params: "--flavor FLAVOR --BUILD_TYPE --no-codesign --target=lib/main_prod.dart"
        - ios_output_type: archive
    
    # Despliegues
    - deploy-to-bitrise-io: {}
    - google-play-deploy:
        inputs:
        - package_name: "com.example.app"
        - service_account_json_key_path: "GCLOUD_SERVICE_ACCOUNT_JSON_KEY_PATH"
        - track: "internal"
    - app-store-connect-deploy:
        inputs:
        - itunescon_user: "ITUNES_CONNECT_USER"
        - itunescon_password: "ITUNES_CONNECT_PASSWORD"
        - app_path: "BITRISE_IPA_PATH"
    
    # Notificaciones
    - slack:
        inputs:
        - webhook_url: "SLACK_WEBHOOK_URL"
        - channel: "#releases"
        - message: "Nueva versión desplegada: BITRISE_GIT_TAG"
''',
    });
  }

  // Topic 4: GitHub Actions
  Future<void> _insertDetailsMidTopic4Level9(Database db) async {
    // Introducción a GitHub Actions
    await db.insert('detail', {
      'id': 1,
      'subtopic_id': 's01t04l09',
      'module': 'Mid',
      'definition':
          'GitHub Actions es la solución de CI/CD integrada en GitHub, ideal para proyectos Flutter.\n\n'
              '**Características principales**:\n'
              '- Integración nativa con repositorios GitHub\n'
              '- Ejecución en runners GitHub o self-hosted\n'
              '- Marketplace con acciones preconstruidas\n'
              '- Soporte para matrices de builds\n\n'
              '**Ventajas**:\n'
              '- Configuración como código (YAML)\n'
              '- Gratis para proyectos públicos\n'
              '- Fácil integración con el workflow GitHub\n'
              '- Soporte para múltiples sistemas operativos\n\n'
              '**Casos de uso**:\n'
              '- CI/CD para proyectos open source\n'
              '- Ejecución de pruebas en cada PR\n'
              '- Despliegues automáticos\n'
              '- Generación de documentación',
      'img_url': '',
      'code_example': '''
# Ejemplo básico (.github/workflows/flutter-ci.yml)
name: Flutter CI

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    - uses: subosito/flutter-action@v2
      with:
        flutter-version: '3.7.0'
    - run: flutter pub get
    - run: flutter analyze
    - run: flutter test
''',
    });

    // Configuración de CI/CD con GitHub Actions
    await db.insert('detail', {
      'id': 2,
      'subtopic_id': 's02t04l09',
      'module': 'Mid',
      'definition':
          'Configurar CI/CD con GitHub Actions implica crear workflows en YAML:\n\n'
              '**Estructura básica**:\n'
              '1. **on**: Eventos que disparan el workflow\n'
              '2. **jobs**: Tareas a ejecutar\n'
              '3. **steps**: Acciones individuales\n'
              '4. **env**: Variables de entorno\n\n'
              '**Componentes clave**:\n'
              '- **Runners**: Máquinas que ejecutan los jobs\n'
              '- **Actions**: Pasos reutilizables\n'
              '- **Artifacts**: Archivos resultantes\n'
              '- **Secrets**: Datos sensibles\n\n'
              '**Buenas prácticas**:\n'
              '- Usar matrices para builds multiplataforma\n'
              '- Implementar caching para dependencias\n'
              '- Separar workflows por propósito\n'
              '- Proteger ramas principales',
      'img_url': '',
      'code_example': '''
# Workflow avanzado para Flutter
name: Flutter Build & Deploy

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]
  workflow_dispatch:

env:
  FLUTTER_VERSION: '3.7.0'

jobs:
  test:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - uses: subosito/flutter-action@v2
      with:
        flutter-version: env.FLUTTER_VERSION}
    
    - name: Install dependencies
      run: flutter pub get
      
    - name: Analyze code
      run: flutter analyze
      
    - name: Run tests
      run: flutter test --coverage
      
    - name: Upload coverage
      uses: codecov/codecov-action@v3

  build-android:
    needs: test
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - uses: subosito/flutter-action@v2
      with:
        flutter-version: {{env.FLUTTER_VERSION}}
    
    - name: Setup Java
      uses: actions/setup-java@v3
      with:
        distribution: 'zulu'
        java-version: '11'
    
    - name: Build APK
      run: flutter build apk --release
      
    - name: Upload APK
      uses: actions/upload-artifact@v3
      with:
        name: release-apk
        path: build/app/outputs/flutter-apk/app-release.apk

  build-ios:
    needs: test
    runs-on: macos-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - uses: subosito/flutter-action@v2
      with:
        flutter-version: {{env.FLUTTER_VERSION}}
    
    - name: Install CocoaPods
      run: |
        cd ios
        pod install
        cd ..
    
    - name: Build iOS
      run: flutter build ios --release --no-codesign
      
    - name: Upload IPA
      uses: actions/upload-artifact@v3
      with:
        name: release-ipa
        path: build/ios/iphoneos/Runner.app
''',
    });

    // Automatización de Pruebas y Despliegues con GitHub Actions
    await db.insert('detail', {
      'id': 3,
      'subtopic_id': 's03t04l09',
      'module': 'Mid',
      'definition':
          'GitHub Actions permite implementar pipelines completos para Flutter:\n\n'
              '**Flujo avanzado típico**:\n'
              '1. **Pruebas**: Análisis, unitarias, integración\n'
              '2. **Build**: Generar artefactos firmados\n'
              '3. **Despliegue**: Distribuir a testers o stores\n\n'
              '**Features avanzadas**:\n'
              '- **Matrices de builds**: Múltiples versiones/entornos\n'
              '- **Reusable workflows**: Para compartir lógica común\n'
              '- **Environments**: Con aprobaciones requeridas\n'
              '- **Self-hosted runners**: Para builds especiales\n\n'
              '**Integraciones clave**:\n'
              '- Firebase App Distribution\n'
              '- App Store Connect\n'
              '- Google Play Console\n'
              '- Slack/Microsoft Teams\n'
              '- SonarCloud',
      'img_url': '',
      'code_example': '''
# Workflow completo con despliegues
name: Flutter Full Pipeline

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]
  release:
    types: [ created ]

env:
  FLUTTER_VERSION: '3.7.0'

jobs:
  test:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - uses: subosito/flutter-action@v2
      with:
        flutter-version: {{env.FLUTTER_VERSION}}
    
    - name: Install dependencies
      run: flutter pub get
      
    - name: Analyze code
      run: flutter analyze
      
    - name: Run tests
      run: flutter test --coverage --test-randomize-ordering-seed random
      
    - name: Upload coverage
      uses: codecov/codecov-action@v3

  build-android:
    needs: test
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - uses: subosito/flutter-action@v2
      with:
        flutter-version: {{env.FLUTTER_VERSION}}
    
    - name: Setup Java
      uses: actions/setup-java@v3
      with:
        distribution: 'zulu'
        java-version: '11'
    
    - name: Build App Bundle
      run: flutter build appbundle --release
      
    - name: Upload Bundle
      uses: actions/upload-artifact@v3
      with:
        name: app-bundle
        path: build/app/outputs/bundle/release/app-release.aab
        
    - name: Deploy to Firebase App Distribution
      if: github.event_name == 'push' && github.ref == 'refs/heads/main'
      uses: wzieba/Firebase-Distribution-Github-Action@v1
      with:
        appId: {{secrets.FIREBASE_APP_ID}}
        token: {{secrets.FIREBASE_TOKEN}}
        groups: testers
        file: build/app/outputs/bundle/release/app-release.aab

  build-ios:
    needs: test
    runs-on: macos-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - uses: subosito/flutter-action@v2
      with:
        flutter-version: {{env.FLUTTER_VERSION}}
    
    - name: Install CocoaPods
      run: |
        cd ios
        pod install
        cd ..
    
    - name: Build IPA
      run: |
        flutter build ios --release --no-codesign
        cd ios
        xcodebuild -workspace Runner.xcworkspace -scheme Runner -archivePath RunnerArchive.xcarchive archive
        xcodebuild -exportArchive -archivePath RunnerArchive.xcarchive -exportOptionsPlist ExportOptions.plist -exportPath .
        cd ..
      
    - name: Upload IPA
      uses: actions/upload-artifact@v3
      with:
        name: app-ipa
        path: ios/Runner.ipa
        
    - name: Deploy to TestFlight
      if: github.event_name == 'release'
      uses: apple-actions/upload-testflight-build@v1
      with:
        app-path: ios/Runner.ipa
        apple-id: {{secrets.APPLE_ID}}
        apple-id-password: {{secrets.APPLE_PASSWORD}}
        app-store-connect-api-issuer-id: {{secrets.APPSTORE_ISSUER_ID}}
        app-store-connect-api-key-id: {{secrets.APPSTORE_KEY_ID}}
        app-store-connect-api-private-key: {{secrets.APPSTORE_PRIVATE_KEY}}
''',
    });
  }

  // Topic 5: Firebase App Distribution
  Future<void> _insertDetailsMidTopic5Level9(Database db) async {
    // Introducción a Firebase App Distribution
    await db.insert('detail', {
      'id': 1,
      'subtopic_id': 's01t05l09',
      'module': 'Mid',
      'definition':
          'Firebase App Distribution es un servicio para distribuir aplicaciones a testers durante el desarrollo.\n\n'
              '**Características principales**:\n'
              '- Distribución rápida a testers\n'
              '- Notificaciones automáticas\n'
              '- Feedback integrado\n'
              '- Compatible con iOS y Android\n\n'
              '**Ventajas**:\n'
              '- Fácil configuración\n'
              '- Integración con Firebase Crashlytics\n'
              '- No requiere aprobación de stores\n'
              '- Ideal para pruebas beta\n\n'
              '**Casos de uso**:\n'
              '- Distribución interna a equipos\n'
              '- Pruebas con clientes\n'
              '- Validación de nuevas features\n'
              '- Flujos de CI/CD',
      'img_url': '',
      'code_example': '''
# Configuración básica en Firebase Console
1. Ir a Firebase Console (console.firebase.google.com)
2. Seleccionar tu proyecto
3. Navegar a "App Distribution" en el menú
4. Agregar testers manualmente o importar grupos

# Configuración en Android (app/build.gradle)
android {
    buildTypes {
        release {
            firebaseAppDistribution {
                appId="1:1234567890:android:abcd1234"
                serviceCredentialsFile="path/to/service-account.json"
                releaseNotesFile="release_notes.txt"
                groups="testers"
            }
        }
    }
}

# Configuración en iOS (Fastlane)
lane :distribute_to_firebase do
  firebase_app_distribution(
    app: "1:1234567890:ios:abcd1234",
    firebase_cli_token: "your_token",
    groups: "testers",
    release_notes: "Nueva versión para pruebas"
  )
end
''',
    });

    // Configuración de Firebase App Distribution
    await db.insert('detail', {
      'id': 2,
      'subtopic_id': 's02t05l09',
      'module': 'Mid',
      'definition': 'Configurar Firebase App Distribution requiere:\n\n'
          '**Para Android**:\n'
          '1. Archivo de credenciales de servicio\n'
          '2. Configuración en build.gradle\n'
          '3. Grupos de testers definidos\n\n'
          '**Para iOS**:\n'
          '1. Configuración en App Store Connect\n'
          '2. UDIDs de dispositivos registrados\n'
          '3. Certificados de desarrollo\n\n'
          '**Pasos comunes**:\n'
          '1. Crear proyecto Firebase\n'
          '2. Registrar apps iOS/Android\n'
          '3. Configurar grupos de testers\n'
          '4. Integrar con flujo de build\n\n'
          '**Consideraciones Flutter**:\n'
          '- Configurar ambos proyectos nativos\n'
          '- Usar flavors para diferentes entornos\n'
          '- Integrar con CI/CD',
      'img_url': '',
      'code_example': '''
# Configuración avanzada para Android (app/build.gradle)
android {
    flavorDimensions "environment"
    productFlavors {
        dev {
            dimension "environment"
            firebaseAppDistribution {
                appId="1:1234567890:android:abcd1234"
                serviceCredentialsFile="firebase-dev-key.json"
                groups="dev-testers"
                releaseNotes="Versión de desarrollo"
            }
        }
        prod {
            dimension "environment"
            firebaseAppDistribution {
                appId="1:1234567890:android:wxyz5678"
                serviceCredentialsFile="firebase-prod-key.json"
                groups="prod-testers"
                releaseNotes="Versión de producción"
            }
        }
    }
}

# Configuración avanzada para iOS (Fastlane)
lane :distribute_to_testers do |options|
  firebase_app_distribution(
    app: options[:app_id],
    firebase_cli_token: options[:firebase_token],
    groups: options[:groups] || "testers",
    release_notes: options[:notes] || "Nueva versión para pruebas",
    ipa_path: "./build/ios/ipa/App.ipa"
  )
end

# Integración con Flutter en CI/CD
- name: Distribute Android to Firebase
  run: |
    flutter build apk --flavor prod --release
    cd android
    ./gradlew app:assembleProdRelease app:uploadFirebaseAppDistributionProdRelease
    
- name: Distribute iOS to Firebase
  run: |
    flutter build ios --flavor prod --release --no-codesign
    cd ios
    fastlane distribute_to_testers 
      app_id:{{secrets.IOS_APP_ID}} 
      firebase_token:{{secrets.FIREBASE_TOKEN}} 
      groups:"testers" 
      notes:"Build {{github.run_number}}"
''',
    });

    // Distribución de Aplicaciones a Testers
    await db.insert('detail', {
      'id': 3,
      'subtopic_id': 's03t05l09',
      'module': 'Mid',
      'definition': 'El proceso de distribución a testers implica:\n\n'
          '1. **Preparación de builds**:\n'
          '   - Firmar correctamente las apps\n'
          '   - Incluir metadatos necesarios\n'
          '   - Generar notas de versión\n\n'
          '2. **Gestión de testers**:\n'
          '   - Crear grupos lógicos\n'
          '   - Invitar nuevos testers\n'
          '   - Gestionar dispositivos iOS\n\n'
          '3. **Distribución**:\n'
          '   - Subir builds a Firebase\n'
          '   - Asignar a grupos\n'
          '   - Enviar notificaciones\n\n'
          '4. **Feedback**:\n'
          '   - Recopilar comentarios\n'
          '   - Monitorear crashes\n'
          '   - Iterar rápidamente\n\n'
          '**Integración con CI/CD**:\n'
          '- Automatizar distribución en cada build\n'
          '- Generar notas de versión desde commits\n'
          '- Notificar al equipo\n'
          '- Monitorear adopción',
      'img_url': '',
      'code_example': '''
# Workflow completo de distribución
name: Distribute to Testers

on:
  push:
    branches: [ develop ]

jobs:
  distribute-android:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - uses: subosito/flutter-action@v2
      with:
        flutter-version: '3.7.0'
    
    - name: Build Android APK
      run: flutter build apk --flavor dev --release
      
    - name: Distribute to Firebase
      uses: wzieba/Firebase-Distribution-Github-Action@v1
      with:
        appId: {{secrets.FIREBASE_ANDROID_APP_ID}}
        token: {{secrets.FIREBASE_TOKEN}}
        groups: "dev-testers"
        file: build/app/outputs/flutter-apk/app-dev-release.apk
        releaseNotes: |
          Build #{{github.run_number}}
          Commit: {{github.sha}}
          Changes:
          {{github.event.commits[0].message}}

  distribute-ios:
    needs: distribute-android
    runs-on: macos-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - uses: subosito/flutter-action@v2
      with:
        flutter-version: '3.7.0'
    
    - name: Install CocoaPods
      run: |
        cd ios
        pod install
        cd ..
    
    - name: Build iOS IPA
      run: |
        flutter build ios --flavor dev --release --no-codesign
        cd ios
        xcodebuild -workspace Runner.xcworkspace -scheme Runner-dev -archivePath RunnerArchive.xcarchive archive
        xcodebuild -exportArchive -archivePath RunnerArchive.xcarchive -exportOptionsPlist ExportOptions-dev.plist -exportPath .
        cd ..
      
    - name: Distribute to Firebase
      uses: wzieba/Firebase-Distribution-Github-Action@v1
      with:
        appId: {{secrets.FIREBASE_IOS_APP_ID}}
        token: {{secrets.FIREBASE_TOKEN}}
        groups: "dev-testers,internal-team"
        file: ios/Runner.ipa
        releaseNotes: "iOS version of build #{{github.run_number}}"
        
    - name: Notify Slack
      uses: slackapi/slack-github-action@v1
      with:
        channel-id: 'C12345678'
        slack-message: 'Nueva versión para testers: {{github.server_url}}/{{
        github.repository
      }}/actions/runs/{{github.run_id}}'
      env:
        SLACK_BOT_TOKEN: {{secrets.SLACK_BOT_TOKEN}}
''',
    });
  }

  Future<void> insertDetailsMidLevel10(Database db) async {
    try {
      // Topic 1: Flutter Inspector
      await _insertDetailsMidTopic1Level10(db); // Flutter Inspector

      // Topic 2: Flutter Outline
      await _insertDetailsMidTopic2Level10(db); // Flutter Outline

      // Topic 3: Asignación de memoria
      await _insertDetailsMidTopic3Level10(db); // Asignación de memoria
    } catch (e) {
      debugPrint("Error inserting details mid level 10: $e");
    }
  }

  // Topic 1: Flutter Inspector
  Future<void> _insertDetailsMidTopic1Level10(Database db) async {
    // Introducción a Flutter Inspector
    await db.insert('detail', {
      'id': 1,
      'subtopic_id': 's01t01l10',
      'module': 'Mid',
      'definition':
          'Flutter Inspector es una herramienta poderosa integrada en DevTools que permite inspeccionar y analizar la estructura de widgets de una aplicación Flutter.\n\n'
              '**Características principales**:\n'
              '- Visualización del árbol de widgets\n'
              '- Diagnóstico de problemas de layout\n'
              '- Modo de selección de widgets\n'
              '- Análisis de renderizado\n\n'
              '**Ventajas**:\n'
              '- Identificar widgets problemáticos\n'
              '- Depurar problemas de UI\n'
              '- Optimizar el árbol de widgets\n'
              '- Entender la estructura de la app\n\n'
              '**Casos de uso**:\n'
              '- Depurar layouts complejos\n'
              '- Identificar widgets redundantes\n'
              '- Analizar problemas de rendimiento\n'
              '- Entender widgets de terceros',
      'img_url': '',
      'code_example': '''
// Cómo iniciar Flutter Inspector:
1. Ejecuta la aplicación en modo debug
2. Abre DevTools (puedes correr `flutter pub global run devtools`)
3. Haz clic en la pestaña "Flutter Inspector"

// Funcionalidades clave:
- **Select Widget Mode**: Permite seleccionar widgets en el emulador/dispositivo
- **Widget Tree**: Muestra la jerarquía completa de widgets
- **Layout Explorer**: Visualiza cómo se organizan los widgets en el layout
- **Render Tree**: Muestra el árbol de renderizado subyacente

// Ejemplo de problema identificable:
// Widgets innecesariamente reconstruidos pueden detectarse con:
- Highlight repaints: Resalta widgets que se repintan frecuentemente
- Highlight rebuilds: Muestra widgets que se reconstruyen

// Comandos útiles:
- debugDumpApp(): Imprime el árbol de widgets a la consola
- debugDumpRenderTree(): Imprime el árbol de renderizado
- debugDumpLayerTree(): Imprime el árbol de capas
''',
    });

    // Uso de Flutter Inspector para Depurar Interfaces
    await db.insert('detail', {
      'id': 2,
      'subtopic_id': 's02t01l10',
      'module': 'Mid',
      'definition': 'Flutter Inspector es invaluable para depurar interfaces complejas:\n\n'
          '**Técnicas de depuración**:\n'
          '1. **Identificar overflow errors**: Resalta áreas donde el contenido excede los límites\n'
          '2. **Analizar constraints**: Muestra las restricciones de layout\n'
          '3. **Detectar widgets invisibles**: Revela widgets que no se muestran como esperado\n'
          '4. **Optimizar el árbol**: Identifica widgets redundantes\n\n'
          '**Herramientas avanzadas**:\n'
          '- **Layout Explorer**: Para Flex, Row, Column\n'
          '- **Paint Baselines**: Para alineación de texto\n'
          '- **Repaint Rainbow**: Para identificar repintados excesivos\n'
          '- **Slow Animations**: Para depurar animaciones\n\n'
          '**Buenas prácticas**:\n'
          '- Usar el modo selección frecuentemente\n'
          '- Revisar el árbol de widgets periódicamente\n'
          '- Verificar constraints en layouts complejos\n'
          '- Monitorear repintados/reconstrucciones',
      'img_url': '',
      'code_example': '''
// Ejemplo práctico de depuración:

// Problema: Texto no se alinea como se espera
// Solución con Inspector:
1. Activar "Select Widget Mode"
2. Seleccionar el widget de texto problemático
3. Verificar sus constraints en el panel de detalles
4. Identificar el widget padre que impone restricciones no deseadas

// Problema: Layout overflow (error amarillo/negro)
// Solución:
1. Buscar widgets con overflow en el árbol
2. Usar Layout Explorer para Row/Column
3. Ajustar flex factors o usar widgets de scrolling

// Problema: Animación entre widgets no funciona
// Solución:
1. Activar "Slow Animations"
2. Verificar estructura de widgets durante transición
3. Identificar widgets faltantes en el árbol

// Código para ayudar en la depuración:
class MyProblematicWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // debugPrint: Para ver cuándo se reconstruye
    debugPrint('MyProblematicWidget rebuilt');
    
    return Container(
      // Añadir key única para identificar widget
      key: ValueKey('problematic-container'),
      child: /* ... */
    );
  }
}

// Widget para forzar overflow y probar el inspector:
Widget build(BuildContext context) {
  return SizedBox(
    width: 100,
    height: 100,
    child: Column(
      children: [
        Container(height: 60, color: Colors.red),
        Container(height: 60, color: Colors.green),
      ],
    ),
  );
}
''',
    });

    // Análisis de Widgets y Render Trees con Flutter Inspector
    await db.insert('detail', {
      'id': 3,
      'subtopic_id': 's03t01l10',
      'module': 'Mid',
      'definition': 'Flutter Inspector permite analizar en profundidad la estructura de widgets y renderizado:\n\n'
          '**Árbol de Widgets vs Árbol de Renderizado**:\n'
          '- **Widget Tree**: Representación declarativa de la UI (liviana, se reconstruye)\n'
          '- **Render Tree**: Representación de bajo nivel para pintado (persistente, costosa)\n\n'
          '**Análisis avanzado**:\n'
          '1. **Identificar widgets innecesarios**: Widgets que no afectan el render final\n'
          '2. **Detectar repintados excesivos**: Con RepaintBoundary\n'
          '3. **Optimizar el árbol de render**: Reducir profundidad donde sea posible\n'
          '4. **Analizar capas de composición**: Evitar sobrecarga de layers\n\n'
          '**Indicadores de problemas**:\n'
          '- Demasiados nodos en el render tree\n'
          '- Repintados frecuentes de áreas grandes\n'
          '- Cambios de capas innecesarios\n'
          '- Widgets que se reconstruyen pero no cambian visualmente',
      'img_url': '',
      'code_example': '''
// Ejemplos de análisis avanzado:

// 1. Identificar widgets innecesarios
Widget build(BuildContext context) {
  return Column(
    children: [
      // Widget innecesario que no afecta el layout
      Visibility(
        visible: false,
        child: HeavyWidget(), // ¡Aún se construye!
      ),
      // Mejor alternativa:
      if (false) HeavyWidget(), // No se instancia
    ],
  );
}

// 2. Optimizar repintados con RepaintBoundary
Widget build(BuildContext context) {
  return RepaintBoundary( // Aísla el repintado de este widget
    child: MyAnimatedWidget(),
  );
}

// 3. Reducir profundidad del árbol
// Antes:
Widget build(BuildContext context) {
  return Container(
    child: Padding(
      child: Center(
        child: Container(
          child: Text('Demasiada profundidad'),
        ),
      ),
    ),
  );
}

// Después:
Widget build(BuildContext context) {
  return Center(
    child: Container(
      padding: EdgeInsets.all(8),
      child: Text('Menos profundidad'),
    ),
  );
}

// 4. Debugging de capas
void main() {
  debugPrintLayerTreeEnabled = true; // Habilita logging de capas
  runApp(MyApp());
}

// Comandos para análisis en caliente:
- En la consola de depuración:
  - debugDumpApp(): Imprime el árbol de widgets
  - debugDumpRenderTree(): Imprime el árbol de renderizado
  - debugDumpLayerTree(): Imprime el árbol de capas
''',
    });
  }

  // Topic 2: Flutter Outline
  Future<void> _insertDetailsMidTopic2Level10(Database db) async {
    // Introducción a Flutter Outline
    await db.insert('detail', {
      'id': 1,
      'subtopic_id': 's01t02l10',
      'module': 'Mid',
      'definition':
          'Flutter Outline es una herramienta visual en IDEs como Android Studio y VS Code que muestra la estructura jerárquica de widgets de un archivo Dart.\n\n'
              '**Características principales**:\n'
              '- Vista esquemática del árbol de widgets\n'
              '- Navegación rápida entre widgets\n'
              '- Refactorización asistida\n'
              '- Identificación de problemas estructurales\n\n'
              '**Ventajas**:\n'
              '- Comprender rápidamente layouts complejos\n'
              '- Identificar anidamiento excesivo\n'
              '- Refactorizar widgets más fácilmente\n'
              '- Detectar widgets faltantes o mal ubicados\n\n'
              '**Casos de uso**:\n'
              '- Explorar estructuras de widgets complejas\n'
              '- Refactorizar componentes grandes\n'
              '- Enseñar/aprender estructura de widgets\n'
              '- Depurar layouts anidados',
      'img_url': '',
      'code_example': '''
// Cómo acceder a Flutter Outline:
// En Android Studio/IntelliJ:
1. Abre un archivo que contenga widgets Flutter
2. Haz clic en la pestaña "Flutter Outline" en el panel derecho

// En VS Code:
1. Abre un archivo Dart con widgets
2. Usa el comando "View: Toggle Flutter Outline" o
3. Busca el ícono de Flutter Outline en la barra de actividades

// Ejemplo de estructura visible en Flutter Outline:
- Scaffold
  - AppBar
  - Body: Column
    - Container
    - Row
      - Text
      - Icon
    - Expanded
      - ListView
        - ListTile (x5)
  - FloatingActionButton

// Operaciones comunes:
- Expandir/colapsar subárboles
- Navegar a la definición de un widget
- Refactorizar extracción de widget
- Identificar widgets profundamente anidados
''',
    });

    // Uso de Flutter Outline para Visualizar la Estructura de Widgets
    await db.insert('detail', {
      'id': 2,
      'subtopic_id': 's02t02l10',
      'module': 'Mid',
      'definition':
          'Flutter Outline es particularmente útil para visualizar y comprender estructuras de widgets complejas:\n\n'
              '**Técnicas de visualización**:\n'
              '1. **Identificar anidamiento excesivo**: Profundidad del árbol\n'
              '2. **Detectar widgets clave faltantes**: Como MaterialApp o Scaffold\n'
              '3. **Analizar relaciones padre-hijo**: Comprender el flujo de constraints\n'
              '4. **Localizar widgets específicos**: Buscar en la jerarquía\n\n'
              '**Patrones identificables**:\n'
              '- Widgets de layout mal organizados\n'
              '- Anidamiento innecesario que afecta rendimiento\n'
              '- Falta de widgets clave para funcionalidad\n'
              '- Estructuras redundantes o repetitivas\n\n'
              '**Buenas prácticas**:\n'
              '- Usar nombres semánticos para widgets\n'
              '- Extraer widgets complejos a componentes\n'
              '- Minimizar niveles de anidamiento\n'
              '- Revisar estructura periódicamente',
      'img_url': '',
      'code_example': '''
// Ejemplo de análisis de estructura:

// Problema: Anidamiento excesivo
Widget build(BuildContext context) {
  return Container(
    child: Padding(
      padding: EdgeInsets.all(8),
      child: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              // 5 niveles de anidamiento antes del contenido real
              Text('Contenido')
            ],
          ),
        ),
      ),
    ),
  );
}

// Solución con Flutter Outline:
1. Identificar la profundidad excesiva en el outline
2. Extraer widgets intermedios a componentes
3. Simplificar la estructura:

Widget build(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(8),
    child: ContentWidget(), // Extraído a otro widget
  );
}

// Ejemplo de detección de widgets faltantes:
// Flutter Outline mostrará advertencias si faltan:
- MaterialApp/CupertinoApp
- Scaffold
- MediaQuery
- Navigator

// Código para probar en Flutter Outline:
class ComplexLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Outline Demo')),
        body: ListView(
          children: [
            _buildHeader(),
            _buildContent(),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() => /* ... */;
  Widget _buildContent() => /* ... */;
  Widget _buildFooter() => /* ... */;
}
''',
    });

    // Optimización de Interfaces con Flutter Outline
    await db.insert('detail', {
      'id': 3,
      'subtopic_id': 's03t02l10',
      'module': 'Mid',
      'definition': 'Flutter Outline no solo ayuda a visualizar, sino también a optimizar estructuras de widgets:\n\n'
          '**Técnicas de optimización**:\n'
          '1. **Extracción de widgets**: Convertir subárboles en widgets independientes\n'
          '2. **Eliminación de redundancias**: Identificar widgets duplicados\n'
          '3. **Reorganización de layouts**: Simplificar estructuras complejas\n'
          '4. **Identificación de cuellos de botella**: Widgets que reconstruyen demasiado\n\n'
          '**Herramientas complementarias**:\n'
          '- **Refactor → Extract Widget**: Crear nuevos componentes\n'
          '- **Find Usages**: Ver dónde se usa un widget\n'
          '- **Rename**: Cambiar nombres para mejor claridad\n'
          '- **Move**: Reubicar widgets entre archivos\n\n'
          '**Indicadores de optimización**:\n'
          '- Subárboles que se repiten\n'
          '- Widgets con muchos hijos\n'
          '- Componentes con múltiples responsabilidades\n'
          '- Widgets que aparecen en muchos lugares',
      'img_url': '',
      'code_example': '''
// Ejemplo de optimización con Flutter Outline:

// Antes: Widget grande y complejo
Widget build(BuildContext context) {
  return Column(
    children: [
      // Header complejo
      Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(/*...*/),
        child: Row(/*...*/),
      ),
      
      // Lista de items
      ListView.builder(
        itemCount: 20,
        itemBuilder: (ctx, i) => ListTile(/*...*/),
      ),
      
      // Footer complejo
      Container(/*...*/),
    ],
  );
}

// Después de optimización usando Flutter Outline:
// 1. Identificar subárboles en el outline
// 2. Extraer a widgets independientes

Widget build(BuildContext context) {
  return Column(
    children: [
      AppHeader(),  // Extraído
      AppList(),    // Extraído
      AppFooter(),  // Extraído
    ],
  );
}

// Cómo extraer un widget con Flutter Outline:
1. Seleccionar el subárbol en el outline
2. Clic derecho → Refactor → Extract → Flutter Widget
3. Asignar nombre semántico al nuevo widget

// Ejemplo de widget optimizable:
class MyLargeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // 1. Seleccionar este bloque en Outline
          Row(
            children: [
              Icon(Icons.star),
              SizedBox(width: 8),
              Text('Puntuación:'),
              SizedBox(width: 8),
              Text('4.5'),
            ],
          ),
          
          // 2. Extraer como "RatingWidget"
          // ... resto del widget
        ],
      ),
    );
  }
}

// Uso de Outline para identificar reconstrucciones:
class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    // En Flutter Outline, este widget aparecerá como reconstruido
    return GestureDetector(
      onTap: () => setState(() => _count++),
      child: Text("Count: _count"),
    );
  }
}
''',
    });
  }

  // Topic 3: Asignación de memoria
  Future<void> _insertDetailsMidTopic3Level10(Database db) async {
    // Introducción a la Asignación de Memoria en Flutter
    await db.insert('detail', {
      'id': 1,
      'subtopic_id': 's01t03l10',
      'module': 'Mid',
      'definition':
          'Flutter gestiona la memoria automáticamente, pero entender su asignación es clave para optimizar aplicaciones.\n\n'
              '**Conceptos clave**:\n'
              '- **Dart Heap**: Donde se asignan objetos Dart\n'
              '- **Skia**: Motor gráfico que maneja memoria de renderizado\n'
              '- **Garbage Collection**: Liberación automática de memoria no usada\n'
              '- **Memory Pressure**: Situaciones de alto uso de memoria\n\n'
              '**Fuentes comunes de uso de memoria**:\n'
              '- Imágenes grandes\n'
              '- Listas con muchos elementos\n'
              '- Cachés no gestionados\n'
              '- Streams/subscripciones no cerradas\n'
              '- Estados globales muy grandes\n\n'
              '**Síntomas de problemas**:\n'
              '- App lenta o con lag\n'
              '- Crashes inesperados\n'
              '- Advertencias en consola sobre memoria\n'
              '- Calentamiento excesivo del dispositivo',
      'img_url': '',
      'code_example': '''
// Ejemplo de código que puede causar problemas de memoria:

// 1. Listas muy grandes en memoria
final allItems = List.generate(1000000, (i) => i); // ¡1 millón de enteros!

// 2. Imágenes no optimizadas
Image.network(
  'https://example.com/large-image.jpg',
  width: 5000, 
  height: 5000, // Imagen muy grande en memoria
)

// 3. Streams no cancelados
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final _stream = Stream.periodic(Duration(seconds: 1));
  StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = _stream.listen((_) {
      // Si no se cancela, sigue consumiendo memoria
    });
  }
  
  // ¡Falta dispose()!
}

// 4. Caché no limitado
final _imageCache = <String, Image>{};

void loadImage(String url) {
  _imageCache[url] = Image.network(url); // Sin límite de tamaño
}

// Herramientas para monitorear:
- DevTools Memory tab
- Android Studio Profiler
- Xcode Instruments
''',
    });

    // Uso de Herramientas para Monitorear el Uso de Memoria
    await db.insert('detail', {
      'id': 2,
      'subtopic_id': 's02t03l10',
      'module': 'Mid',
      'definition':
          'Flutter y los IDEs proporcionan herramientas para monitorear y analizar el uso de memoria:\n\n'
              '**Herramientas principales**:\n'
              '1. **Flutter DevTools - Memory Tab**:\n'
              '   - Gráficos de uso de heap\n'
              '   - Instantáneas de memoria\n'
              '   - Análisis de objetos\n\n'
              '2. **Android Studio Profiler**:\n'
              '   - Uso de memoria en tiempo real\n'
              '   - Asignaciones por tipo\n'
              '   - Eventos de garbage collection\n\n'
              '3. **Xcode Instruments**:\n'
              '   - Allocations tracker\n'
              '   - Memory leaks\n'
              '   - Uso de memoria gráfica\n\n'
              '**Técnicas de monitoreo**:\n'
              '- Tomar instantáneas antes/después de operaciones\n'
              '- Comparar uso de memoria en diferentes estados\n'
              '- Buscar patrones de crecimiento continuo\n'
              '- Identificar objetos retenidos innecesariamente',
      'img_url': '',
      'code_example': '''
// Cómo usar DevTools para memoria:
1. Ejecutar app en modo debug
2. Abrir DevTools (`flutter pub global run devtools`)
3. Ir a pestaña "Memory"
4. Tomar snapshot (Heap Snapshot)
5. Analizar objetos en memoria

// Comandos útiles para profiling:
- En la consola debug:
  - debugPrint('Total memory: {ServicesBinding.instance.memoryPressure.value}');
  - debugDumpApp(): Para contexto actual
  - debugInstrumentationEnabled = true; // Más logging

// Ejemplo de código para probar memoria:
class MemoryIntensiveWidget extends StatefulWidget {
  @override
  _MemoryIntensiveWidgetState createState() => _MemoryIntensiveWidgetState();
}

class _MemoryIntensiveWidgetState extends State<MemoryIntensiveWidget> {
  List<Uint8List> _largeData = [];

  void _addData() {
    setState(() {
      _largeData.add(Uint8List(1000000)); // 1MB cada vez
    });
  }

  void _clearData() {
    setState(() {
      _largeData.clear();
    });
    // Forzar GC para ver efecto en DevTools
    SystemNavigator.routeInformationUpdated(location: '/');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _addData,
          child: Text('Add 1MB'),
        ),
        ElevatedButton(
          onPressed: _clearData,
          child: Text('Clear Data'),
        ),
        Text('Total MB: {_largeData.length}'),
      ],
    );
  }
}

// Configuración para detectar leaks:
void main() {
  // Habilita logging detallado de memoria
  debugPrintBeginFrameBanner = true;
  debugPrintEndFrameBanner = true;
  debugPrintScheduleFrameStacks = true;
  
  runApp(MyApp());
}
''',
    });

    // Optimización del Uso de Memoria en Aplicaciones Flutter
    await db.insert('detail', {
      'id': 3,
      'subtopic_id': 's03t03l10',
      'module': 'Mid',
      'definition':
          'Optimizar la memoria en Flutter requiere técnicas específicas y buen entendimiento del ciclo de vida:\n\n'
              '**Estrategias clave**:\n'
              '1. **Manejo de imágenes**:\n'
              '   - Usar cacheWidth/cacheHeight\n'
              '   - Implementar paginación para listas\n'
              '   - Liberar recursos con dispose()\n\n'
              '2. **Gestión de estados**:\n'
              '   - Limpiar controllers y streams\n'
              '   - Evitar almacenar datos innecesarios\n'
              '   - Usar paginación para datos grandes\n\n'
              '3. **Estructuras de datos**:\n'
              '   - Usar ListView.builder para listas largas\n'
              '   - Implementar lazy loading\n'
              '   - Liberar recursos no usados\n\n'
              '4. **Widgets**:\n'
              '   - Usar const widgets donde sea posible\n'
              '   - Implementar dispose() correctamente\n'
              '   - Evitar reconstrucciones innecesarias\n\n'
              '**Herramientas de validación**:\n'
              '- Memory tab en DevTools\n'
              '- Leak tracking en profile mode\n'
              '- Memory pressure warnings',
      'img_url': '',
      'code_example': '''
// Ejemplos de optimización de memoria:

// 1. Optimización de imágenes
Image.network(
  'https://example.com/large-image.jpg',
  width: 300,
  height: 300,
  cacheWidth: 600,  // Reduce memoria para imagen retina
  cacheHeight: 600,
  frameBuilder: (ctx, child, frame, wasSync) {
    if (wasSync) return child;
    return AnimatedOpacity(
      child: child,
      opacity: frame == null ? 0 : 1,
      duration: Duration(seconds: 1),
    );
  },
)

// 2. Gestión correcta de controllers
class VideoPlayerWidget extends StatefulWidget {
  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network('https://example.com/video.mp4')
      ..initialize().then((_) => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose(); // ¡Importante liberar recursos!
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        : Center(child: CircularProgressIndicator());
  }
}

// 3. Listas optimizadas
ListView.builder(
  itemCount: 1000000,
  itemBuilder: (ctx, index) => ListTile(
    title: Text('Item index'),
  ),
  // Mejor que ListView(children: [...] para listas grandes
)

// 4. Widgets const
Widget build(BuildContext context) {
  return const DecoratedBox( // Const evita reconstrucciones
    decoration: BoxDecoration(),
    child: const Padding( // Multiples const
      padding: EdgeInsets.all(8),
      child: const Text('Hello'),
    ),
  );
}

// 5. Lazy loading para datos grandes
FutureBuilder<List<Item>>(
  future: _fetchPage(page),
  builder: (ctx, snapshot) {
    if (!snapshot.hasData) return LoadingWidget();
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (ctx, i) => ItemWidget(snapshot.data[i]),
    );
  },
)

// 6. Liberación explícita de recursos
class ResourceOwner extends StatefulWidget {
  @override
  _ResourceOwnerState createState() => _ResourceOwnerState();
}

class _ResourceOwnerState extends State<ResourceOwner> {
  final _resources = <StreamSubscription>[];
  final _cache = <String, Uint8List>{};
  
  void _loadResource(String url) {
    final subscription = _downloadStream(url).listen((data) {
      _cache[url] = data;
    });
    _resources.add(subscription);
  }

  @override
  void dispose() {
    // Limpiar todos los recursos
    for (final sub in _resources) {
      sub.cancel();
    }
    _cache.clear();
    super.dispose();
  }
}
''',
    });
  }
}
