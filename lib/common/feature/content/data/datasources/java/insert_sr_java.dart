import 'package:sqflite_common/sqlite_api.dart';

Future<void> insertSrLevel1Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 1,
    'tittle_level': 'Patrones de Diseño',
    'topic': 'Patrones Creacionales',
    'subtopic': 'Singleton',
    'definition': '''
El patrón Singleton es como el guardián de una única instancia. Imagina que tienes una configuración global en tu app: no quieres que cada clase cree su propia copia, sino que todas usen la misma. Ahí entra Singleton.

¿Te estás preguntando por qué no usar simplemente variables estáticas? Bueno, Singleton va más allá: controla cómo y cuándo se crea esa instancia única, y puede ser perezoso (se crea solo cuando se necesita). ¡Ah, y es thread-safe! 🛡️

Un Singleton en Java tiene tres reglas de oro:
1. Constructor privado (para que nadie más pueda crear instancias)
2. Variable estática privada que guarda la única instancia
3. Método público estático para acceder a esa instancia

La magia está en que aunque llames a getInstance() mil veces, siempre obtendrás el mismo objeto. Perfecto para conexiones a BD, loggers, o configuraciones globales. Pero ojo: no abuses de él, porque puede hacer tu código difícil de testear.
''',
    'code_example': '''
// Implementación correcta (thread-safe y lazy)
public class DatabaseConnection {
    private static DatabaseConnection instance;
    
    private DatabaseConnection() {} // Constructor privado
    
    public static synchronized DatabaseConnection getInstance() {
        if (instance == null) {
            instance = new DatabaseConnection();
        }
        return instance;
    }
}

// Uso:
DatabaseConnection conn = DatabaseConnection.getInstance();

// ❌ Error común: no hacerlo thread-safe
public static DatabaseConnection getInstance() {
    if (instance == null) {
        instance = new DatabaseConnection(); // Problema si múltiples threads entran aquí
    }
    return instance;
}
'''
  });

// Patrones Creacionales - Factory Method
  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 1,
    'tittle_level': 'Patrones de Diseño',
    'topic': 'Patrones Creacionales',
    'subtopic': 'Factory Method',
    'definition': '''
El Factory Method es como un menú de restaurante: tú pides un plato (objeto) y la cocina (fábrica) decide cómo prepararlo. No necesitas saber los detalles de creación, solo pedir lo que quieres.

¿Alguna vez has visto código lleno de "new ClaseX()" por todas partes? Eso es acoplamiento fuerte. El Factory Method te ayuda a delegar la creación de objetos, haciendo tu código más flexible. ¿Por qué? Porque si mañana cambias cómo se crean los objetos, solo modificas la fábrica, no todo tu código.

El truco está en:
1. Una interfaz común para los productos
2. Una clase creadora con el método fábrica (abstracto o no)
3. Implementaciones concretas que deciden qué objeto crear

Es especialmente útil cuando:
- No sabes de antemano qué tipos exactos de objetos necesitarás
- Quieres centralizar la lógica de creación
- El sistema necesita ser extensible para nuevos tipos
''',
    'code_example': '''
// Interfaz común
interface Transporte {
    void entregar();
}

// Productos concretos
class Camion implements Transporte {
    public void entregar() {
        System.out.println("Entregando por tierra...");
    }
}

class Barco implements Transporte {
    public void entregar() {
        System.out.println("Entregando por mar...");
    }
}

// Fábrica
abstract class Logistica {
    abstract Transporte crearTransporte();
    
    public void planificarEntrega() {
        Transporte t = crearTransporte();
        t.entregar();
    }
}

// Fábricas concretas
class LogisticaTerrestre extends Logistica {
    Transporte crearTransporte() {
        return new Camion();
    }
}

class LogisticaMaritima extends Logistica {
    Transporte crearTransporte() {
        return new Barco();
    }
}

// Uso:
Logistica logistica = new LogisticaTerrestre();
logistica.planificarEntrega(); // Crea y usa un Camion
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 1,
    'tittle_level': 'Patrones de Diseño',
    'topic': 'Patrones Creacionales',
    'subtopic': 'Abstract Factory',
    'definition': '''
El Abstract Factory es como una fábrica de fábricas. Mientras el Factory Method te da un menú, Abstract Factory te da todo un restaurante temático completo (con platos, decoración y música acorde). Es útil cuando necesitas crear familias de objetos relacionados.

¿Alguna vez has tenido que cambiar todo el look-and-feel de una app? Con Abstract Factory, puedes cambiar entre "families" completas (como temas claro/oscuro) sin modificar cada creación individual.

Cómo funciona:
1. Declaras interfaces abstractas para cada producto (Ej: Button, Checkbox)
2. Creas fábricas concretas que implementan esas interfaces (Ej: LightThemeFactory, DarkThemeFactory)
3. El cliente usa las interfaces abstractas, sin conocer las implementaciones concretas

Ventajas:
- Mantiene la consistencia entre productos relacionados
- Facilita el cambio entre familias de productos
- Cumple con el principio de inversión de dependencias
''',
    'code_example': '''
// Interfaces abstractas
interface Button {
    void render();
}

interface Checkbox {
    void tick();
}

// Fábrica abstracta
interface GUIFactory {
    Button createButton();
    Checkbox createCheckbox();
}

// Familia Windows
class WindowsButton implements Button {
    public void render() {
        System.out.println("Windows style button");
    }
}

class WindowsCheckbox implements Checkbox {
    public void tick() {
        System.out.println("Windows style checkbox");
    }
}

class WindowsFactory implements GUIFactory {
    public Button createButton() {
        return new WindowsButton();
    }
    public Checkbox createCheckbox() {
        return new WindowsCheckbox();
    }
}

// Familia MacOS
class MacOSButton implements Button {
    public void render() {
        System.out.println("MacOS style button");
    }
}

// Uso:
GUIFactory factory = new WindowsFactory(); // Cambia a MacOSFactory para otro tema
Button btn = factory.createButton();
btn.render();
'''
  });

// Patrones Creacionales - Builder
  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 1,
    'tittle_level': 'Patrones de Diseño',
    'topic': 'Patrones Creacionales',
    'subtopic': 'Builder',
    'definition': '''
El patrón Builder es como pedir una pizza: eliges cada ingrediente paso a paso hasta tener exactamente lo que quieres, sin necesidad de memorizar combinaciones complejas. Es ideal para crear objetos con muchos parámetros opcionales.

¿Cansado de constructores con 10 parámetros donde siempre olvidas el orden? ¿O de múltiples constructores para diferentes combinaciones? Builder resuelve esto permitiéndote construir objetos pieza por pieza.

Componentes clave:
- Director: opcional, orquesta el proceso de construcción
- Builder: interfaz con métodos para construir cada parte
- ConcreteBuilder: implementación concreta, mantiene el objeto en construcción
- Product: el objeto complejo resultante

Ventajas:
- Permite diferentes representaciones del mismo proceso de construcción
- Aísla código complejo de construcción
- Permite construir objetos paso a paso
''',
    'code_example': '''
// Producto complejo
class Pizza {
    private String masa;
    private String salsa;
    private List<String> toppings = new ArrayList<>();
    
    public void setMasa(String masa) { this.masa = masa; }
    public void setSalsa(String salsa) { this.salsa = salsa; }
    public void addTopping(String topping) { toppings.add(topping); }
}

// Builder abstracto
interface PizzaBuilder {
    void buildMasa();
    void buildSalsa();
    void buildToppings();
    Pizza getPizza();
}

// ConcreteBuilder
class HawaianaBuilder implements PizzaBuilder {
    private Pizza pizza = new Pizza();
    
    public void buildMasa() { pizza.setMasa("suave"); }
    public void buildSalsa() { pizza.setSalsa("dulce"); }
    public void buildToppings() {
        pizza.addTopping("jamón");
        pizza.addTopping("piña");
    }
    public Pizza getPizza() { return pizza; }
}

// Director (opcional)
class Cocina {
    public Pizza hacerPizza(PizzaBuilder builder) {
        builder.buildMasa();
        builder.buildSalsa();
        builder.buildToppings();
        return builder.getPizza();
    }
}

// Uso:
PizzaBuilder builder = new HawaianaBuilder();
Cocina cocina = new Cocina();
Pizza pizza = cocina.hacerPizza(builder);
'''
  });

// Patrones Estructurales - Adapter
  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 1,
    'tittle_level': 'Patrones de Diseño',
    'topic': 'Patrones Estructurales',
    'subtopic': 'Adapter',
    'definition': '''
El patrón Adapter es el traductor de tu código. Imagina que tienes un enchufe europeo (tu interfaz) y un tomacorriente americano (la interfaz que necesitas). El Adapter es ese conversor que te permite conectar ambos mundos.

¿Te ha pasado que quieres usar una clase genial, pero su interfaz no coincide con lo que espera tu código? ¡Bingo! Ahí necesitas un Adapter. No modifiques la clase existente (abrirías la caja de Pandora), mejor crea un adaptador.

Hay dos tipos:
1. Adapter de clase (usa herencia)
2. Adapter de objeto (usa composición)

Funciona así:
- Target: la interfaz que tu sistema espera
- Adaptee: la clase existente que quieres usar
- Adapter: la clase que hace la traducción

Es perfecto para integrar librerías de terceros, APIs legadas, o cuando refactorizas partes de un sistema sin romper todo lo demás.
''',
    'code_example': '''
// Interfaz que espera tu sistema (Target)
interface Reproductor {
    void reproducir(String tipo, String nombreArchivo);
}

// Clase existente con interfaz incompatible (Adaptee)
class ReproductorAvanzado {
    public void playMp3(String archivo) {
        System.out.println("Reproduciendo MP3: " + archivo);
    }
    
    public void playMp4(String archivo) {
        System.out.println("Reproduciendo MP4: " + archivo);
    }
}

// Adapter
class ReproductorAdapter implements Reproductor {
    private ReproductorAvanzado avanzado = new ReproductorAvanzado();
    
    public void reproducir(String tipo, String nombreArchivo) {
        if (tipo.equalsIgnoreCase("mp3")) {
            avanzado.playMp3(nombreArchivo);
        } else if (tipo.equalsIgnoreCase("mp4")) {
            avanzado.playMp4(nombreArchivo);
        }
    }
}

// Uso:
Reproductor reproductor = new ReproductorAdapter();
reproductor.reproducir("mp3", "cancion.mp3"); // Ahora funciona con tu interfaz
'''
  });

// Patrones Estructurales - Decorator
  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 1,
    'tittle_level': 'Patrones de Diseño',
    'topic': 'Patrones Estructurales',
    'subtopic': 'Decorator',
    'definition': '''
El patrón Decorator es como poner capas a una cebolla 🧅 (pero sin llorar). Te permite añadir funcionalidad a un objeto dinámicamente, sin modificar su clase original. Es la alternativa elegante a la herencia cuando necesitas ampliar comportamiento.

¿Quieres añadir funcionalidad a un objeto pero heredar no es una opción (porque es final o rompería LSP)? Decorator al rescate. Envuelves el objeto original y añades lo que necesites, manteniendo la misma interfaz.

Cómo funciona:
1. Tienes un Componente (interfaz común)
2. Un ConcreteComponent (implementación básica)
3. Decoradores que implementan la misma interfaz y envuelven al componente
4. Puedes anidar decoradores como capas

Se usa mucho en:
- Streams de Java (BufferedInputStream decorando FileInputStream)
- GUI (añadir bordes, scrolls a componentes visuales)
- Middleware (añadir logging, caching, etc.)
''',
    'code_example': '''
// Componente
interface Cafe {
    String getDescripcion();
    double getCosto();
}

// ConcreteComponent
class CafeSimple implements Cafe {
    public String getDescripcion() { return "Cafe simple"; }
    public double getCosto() { return 2.0; }
}

// Decorator abstracto
abstract class DecoradorCafe implements Cafe {
    protected Cafe cafeDecorado;
    
    public DecoradorCafe(Cafe cafe) {
        this.cafeDecorado = cafe;
    }
}

// ConcreteDecorators
class Leche extends DecoradorCafe {
    public Leche(Cafe cafe) { super(cafe); }
    
    public String getDescripcion() {
        return cafeDecorado.getDescripcion() + ", con leche";
    }
    
    public double getCosto() {
        return cafeDecorado.getCosto() + 0.5;
    }
}

class Chocolate extends DecoradorCafe {
    public Chocolate(Cafe cafe) { super(cafe); }
    
    public String getDescripcion() {
        return cafeDecorado.getDescripcion() + ", con chocolate";
    }
    
    public double getCosto() {
        return cafeDecorado.getCosto() + 1.0;
    }
}

// Uso:
Cafe miCafe = new Chocolate(new Leche(new CafeSimple()));
System.out.println(miCafe.getDescripcion() + ": " + miCafe.getCosto());
// Output: Cafe simple, con leche, con chocolate: 3.5
'''
  });

// Patrones Estructurales - Facade
  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 1,
    'tittle_level': 'Patrones de Diseño',
    'topic': 'Patrones Estructurales',
    'subtopic': 'Facade',
    'definition': '''
El patrón Facade es como el botón "Easy" de tu sistema. Oculta la complejidad de múltiples subsistemas detrás de una interfaz simple. Es ese amigo que te explica algo complicado en términos que entiendes.

¿Alguna vez has tenido que hacer 10 llamadas en orden específico para realizar una tarea? Facade te da un único punto de entrada que maneja toda esa complejidad por ti.

Por qué usarlo:
- Simplifica la interfaz para clientes
- Reduce el acoplamiento entre subsistemas
- Proporciona un punto único de acceso
- Mejora la legibilidad y mantenibilidad

No es:
- Un reemplazo para la funcionalidad existente
- Una simplificación excesiva que pierde capacidades

Ejemplos reales:
- APIs simplificadas sobre sistemas complejos
- Wrappers para librerías complicadas
- Puntos de entrada para subsistemas legacy
''',
    'code_example': '''
// Subsistemas complejos
class SistemaDeArchivos {
    public byte[] leerArchivo(String ruta) {
        System.out.println("Leyendo archivo: " + ruta);
        return new byte[0];
    }
}

class Compresor {
    public byte[] comprimir(byte[] datos) {
        System.out.println("Comprimiendo datos...");
        return datos;
    }
}

class Encriptador {
    public byte[] encriptar(byte[] datos) {
        System.out.println("Encriptando datos...");
        return datos;
    }
}

// Facade
class SistemaSeguro {
    private SistemaDeArchivos sistemaArchivos = new SistemaDeArchivos();
    private Compresor compresor = new Compresor();
    private Encriptador encriptador = new Encriptador();
    
    public byte[] cargarArchivoSeguro(String ruta) {
        byte[] datos = sistemaArchivos.leerArchivo(ruta);
        byte[] comprimido = compresor.comprimir(datos);
        return encriptador.encriptar(comprimido);
    }
}

// Uso:
SistemaSeguro sistema = new SistemaSeguro();
byte[] archivo = sistema.cargarArchivoSeguro("datos.txt");
// El cliente no necesita saber nada de los subsistemas internos
'''
  });

// Patrones Estructurales - Proxy
  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 1,
    'tittle_level': 'Patrones de Diseño',
    'topic': 'Patrones Estructurales',
    'subtopic': 'Proxy',
    'definition': '''
El patrón Proxy es como un asistente personal: controla el acceso a un objeto, añadiendo capas de funcionalidad cuando sea necesario. Es un "placeholder" que representa a otro objeto.

¿Necesitas controlar cuándo se crea un objeto pesado? ¿O añadir seguridad, logging o caching? Proxy te permite hacerlo sin modificar el objeto original.

Tipos comunes:
- Virtual Proxy: pospone la creación de objetos costosos
- Protection Proxy: controla acceso
- Remote Proxy: representa objetos en otro espacio de direcciones
- Smart Proxy: añade lógica adicional (logging, caching)

Cómo funciona:
1. Misma interfaz que el objeto real
2. Mantiene referencia al objeto real
3. Controla el acceso, delegando cuando sea necesario

Java lo usa en:
- java.lang.reflect.Proxy
- RMI (Remote Method Invocation)
- Hibernate (para lazy loading)
''',
    'code_example': '''
// Interfaz común
interface Imagen {
    void mostrar();
}

// Objeto real (costoso)
class ImagenReal implements Imagen {
    private String archivo;
    
    public ImagenReal(String archivo) {
        this.archivo = archivo;
        cargarDesdeDisco();
    }
    
    private void cargarDesdeDisco() {
        System.out.println("Cargando imagen pesada: " + archivo);
    }
    
    public void mostrar() {
        System.out.println("Mostrando imagen: " + archivo);
    }
}

// Proxy
class ProxyImagen implements Imagen {
    private ImagenReal imagenReal;
    private String archivo;
    
    public ProxyImagen(String archivo) {
        this.archivo = archivo;
    }
    
    public void mostrar() {
        if (imagenReal == null) {
            imagenReal = new ImagenReal(archivo); // Carga perezosa
        }
        imagenReal.mostrar();
    }
}

// Uso:
Imagen imagen = new ProxyImagen("foto_10MB.jpg");
// La imagen real no se carga hasta que se necesita
imagen.mostrar(); // Aquí se carga y muestra
'''
  });

// Patrones de Comportamiento - Strategy
  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 1,
    'tittle_level': 'Patrones de Diseño',
    'topic': 'Patrones de Comportamiento',
    'subtopic': 'Strategy',
    'definition': '''
El patrón Strategy es como tener un juego de herramientas: seleccionas exactamente la que necesitas para cada trabajo. Define una familia de algoritmos, los encapsula y los hace intercambiables.

¿Tienes múltiples formas de realizar una tarea (como diferentes tipos de ordenamiento o formatos de exportación)? Strategy te permite cambiar el algoritmo usado en runtime sin modificar el código que lo usa.

Componentes:
- Context: mantiene referencia a la estrategia actual
- Strategy: interfaz común para todos los algoritmos
- ConcreteStrategies: implementaciones específicas

Ventajas:
- Elimina condicionales complejos
- Facilita añadir nuevas estrategias
- Permite cambiar comportamiento en tiempo de ejecución
- Cumple con el principio Open/Closed

Ejemplos:
- Algoritmos de compresión (ZIP, RAR, 7z)
- Métodos de pago (PayPal, Tarjeta, Bitcoin)
- Rutas de navegación (rápida, panorámica, económica)
''',
    'code_example': '''
// Strategy
interface EstrategiaPago {
    void pagar(double monto);
}

// ConcreteStrategies
class PagoPayPal implements EstrategiaPago {
    private String email;
    
    public PagoPayPal(String email) {
        this.email = email;
    }
    
    public void pagar(double monto) {
        System.out.println(monto + " pagado via PayPal (" + email + ")");
    }
}

class PagoTarjeta implements EstrategiaPago {
    private String numeroTarjeta;
    
    public PagoTarjeta(String numeroTarjeta) {
        this.numeroTarjeta = numeroTarjeta;
    }
    
    public void pagar(double monto) {
        System.out.println(monto + " pagado con tarjeta terminada en " 
            + numeroTarjeta.substring(numeroTarjeta.length() - 4));
    }
}

// Context
class CarritoCompras {
    private EstrategiaPago estrategia;
    
    public void setEstrategia(EstrategiaPago estrategia) {
        this.estrategia = estrategia;
    }
    
    public void pagar(double monto) {
        if (estrategia == null) {
            throw new IllegalStateException("Estrategia no configurada");
        }
        estrategia.pagar(monto);
    }
}

// Uso:
CarritoCompras carrito = new CarritoCompras();
carrito.setEstrategia(new PagoPayPal("usuario@example.com"));
carrito.pagar(100.50);

carrito.setEstrategia(new PagoTarjeta("1234567890123456"));
carrito.pagar(75.25);
'''
  });

// Patrones de Comportamiento - Observer
  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 1,
    'tittle_level': 'Patrones de Diseño',
    'topic': 'Patrones de Comportamiento',
    'subtopic': 'Observer',
    'definition': '''
El patrón Observer es como un sistema de suscripción a newsletters. Tienes un sujeto (la lista de correos) y observadores (los suscriptores). Cuando el sujeto cambia (nuevo newsletter), todos los observadores son notificados automáticamente. 📨

¿No odias cuando tienes que estar revisando constantemente si algo ha cambiado? Con Observer, los objetos interesados se registran y son notificados solo cuando pasa algo importante. ¡Decimos adiós al polling!

Componentes clave:
- Subject: mantiene la lista de observers y notifica cambios
- Observer: interfaz que define el método de actualización
- ConcreteObservers: implementan acciones específicas ante notificaciones

Se usa mucho en:
- Sistemas de eventos GUI (botones que notifican clicks)
- Actualizaciones en tiempo real (como feeds de redes sociales)
- Mecanismos de publish/subscribe

Java incluso tiene clases built-in para esto (java.util.Observer), pero entender el patrón te permite implementarlo de formas más flexibles.
''',
    'code_example': '''
// Interfaz Observer
interface Observer {
    void actualizar(String mensaje);
}

// Subject (Observable)
class Newsletter {
    private List<Observer> suscriptores = new ArrayList<>();
    private String ultimoPost;
    
    public void agregarSuscriptor(Observer o) {
        suscriptores.add(o);
    }
    
    public void nuevoPost(String post) {
        this.ultimoPost = post;
        notificarSuscriptores();
    }
    
    private void notificarSuscriptores() {
        for (Observer o : suscriptores) {
            o.actualizar(ultimoPost);
        }
    }
}

// ConcreteObserver
class Usuario implements Observer {
    private String nombre;
    
    public Usuario(String nombre) {
        this.nombre = nombre;
    }
    
    public void actualizar(String mensaje) {
        System.out.println(nombre + " recibió: " + mensaje);
    }
}

// Uso:
Newsletter blog = new Newsletter();
Usuario ana = new Usuario("Ana");
Usuario luis = new Usuario("Luis");

blog.agregarSuscriptor(ana);
blog.agregarSuscriptor(luis);

blog.nuevoPost("¡Nuevo patrón de diseño publicado!");
// Salida:
// Ana recibió: ¡Nuevo patrón de diseño publicado!
// Luis recibió: ¡Nuevo patrón de diseño publicado!
'''
  });

// Patrones de Comportamiento - Command
  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 1,
    'tittle_level': 'Patrones de Diseño',
    'topic': 'Patrones de Comportamiento',
    'subtopic': 'Command',
    'definition': '''
El patrón Command es como dejar una nota con instrucciones: encapsula una solicitud como un objeto, permitiéndote parametrizar clientes con diferentes solicitudes. Es el patrón detrás de los sistemas de "undo", colas de trabajo y operaciones remotas.

¿Necesitas desacoplar quién invoca una operación de cómo se ejecuta? Command te permite empaquetar una acción con toda su información en un objeto independiente.

Elementos clave:
- Command: interfaz con método execute()
- ConcreteCommand: implementa execute(), llama al receiver
- Invoker: pide al command que ejecute la solicitud
- Receiver: sabe cómo realizar la operación

Casos de uso:
- Sistemas de deshacer/rehacer
- Operaciones en cola o programadas
- Transacciones
- Menús y botones en GUIs
- Operaciones remotas (RPC)
''',
    'code_example': '''
// Command
interface Comando {
    void ejecutar();
    void deshacer();
}

// Receiver
class Luz {
    public void encender() {
        System.out.println("Luz encendida");
    }
    
    public void apagar() {
        System.out.println("Luz apagada");
    }
}

// ConcreteCommand
class ComandoEncender implements Comando {
    private Luz luz;
    
    public ComandoEncender(Luz luz) {
        this.luz = luz;
    }
    
    public void ejecutar() {
        luz.encender();
    }
    
    public void deshacer() {
        luz.apagar();
    }
}

// Invoker
class ControlRemoto {
    private Comando comando;
    
    public void setComando(Comando comando) {
        this.comando = comando;
    }
    
    public void presionarBoton() {
        comando.ejecutar();
    }
    
    public void presionarDeshacer() {
        comando.deshacer();
    }
}

// Uso:
Luz luz = new Luz();
ControlRemoto control = new ControlRemoto();
control.setComando(new ComandoEncender(luz));

control.presionarBoton(); // Enciende la luz
control.presionarDeshacer(); // Apaga la luz
'''
  });

  // Patrones de Comportamiento - Template Method
  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 1,
    'tittle_level': 'Patrones de Diseño',
    'topic': 'Patrones de Comportamiento',
    'subtopic': 'Template Method',
    'definition': '''
El Template Method es como una receta con pasos opcionales: define el esqueleto de un algoritmo en una clase base, pero permite que subclases redefinan ciertos pasos sin cambiar la estructura general.

¿Tienes algoritmos que son casi idénticos pero con pequeñas variaciones? En lugar de copiar y pegar código, Template Method te ayuda a reutilizar la estructura común mientras personalizas los detalles.

Cómo funciona:
1. Clase abstracta define el "template" (método con pasos fijos)
2. Algunos pasos son implementados en la clase base
3. Otros son abstractos o tienen implementación por defecto
4. Subclases concretas implementan los pasos variables

Ventajas:
- Elimina duplicación de código
- Centraliza el control de la estructura del algoritmo
- Permite flexibilidad en ciertos pasos
- Cumple con el principio Hollywood ("No nos llames, nosotros te llamamos")

Ejemplos:
- Frameworks (Spring, Hibernate)
- Flujos de procesamiento estándar
- Algoritmos con variaciones conocidas
''',
    'code_example': '''
// Clase abstracta con template method
abstract class ProcesadorDePedidos {
    // Template method (final para que no se sobrescriba)
    public final void procesarPedido() {
        verificarDisponibilidad();
        calcularTotal();
        if (requiereEnvio()) {
            prepararEnvio();
        }
        realizarPago();
        confirmarPedido();
    }
    
    // Pasos implementados
    private void verificarDisponibilidad() {
        System.out.println("Verificando disponibilidad...");
    }
    
    private void confirmarPedido() {
        System.out.println("Pedido confirmado. Gracias!");
    }
    
    // Pasos abstractos
    abstract void calcularTotal();
    abstract void realizarPago();
    
    // Hook (método opcional que puede sobrescribirse)
    boolean requiereEnvio() {
        return true;
    }
    
    void prepararEnvio() {
        System.out.println("Preparando envío estándar...");
    }
}

// Implementación concreta
class PedidoFisico extends ProcesadorDePedidos {
    void calcularTotal() {
        System.out.println("Calculando total con envío...");
    }
    
    void realizarPago() {
        System.out.println("Procesando pago con tarjeta...");
    }
}

class PedidoDigital extends ProcesadorDePedidos {
    void calcularTotal() {
        System.out.println("Calculando total sin envío...");
    }
    
    void realizarPago() {
        System.out.println("Procesando pago con PayPal...");
    }
    
    boolean requiereEnvio() {
        return false; // Sobrescribe el hook
    }
}

// Uso:
ProcesadorDePedidos pedido1 = new PedidoFisico();
pedido1.procesarPedido(); // Incluye envío

ProcesadorDePedidos pedido2 = new PedidoDigital();
pedido2.procesarPedido(); // Sin envío
'''
  });
}

Future<void> insertSrLevel2Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 2,
    'tittle_level': 'Rendimiento y Optimización',
    'topic': 'JVM Internals',
    'subtopic': 'Modelo de memoria de Java',
    'definition': '''
El modelo de memoria de Java es como el plano arquitectónico que define cómo la JVM organiza y gestiona la memoria durante la ejecución de un programa. Es fundamental entenderlo para escribir código eficiente y evitar problemas como memory leaks.

¿Alguna vez te has preguntado por qué tu aplicación consume más memoria de la esperada? La respuesta suele estar en cómo interactúas con este modelo de memoria.

La JVM divide la memoria en varias áreas clave: el Heap (donde van los objetos), el Stack (para llamadas a métodos y variables locales), el Metaspace (antes PermGen, para clases y métodos), y otros espacios más especializados. Cada uno tiene su propósito y reglas de gestión. El Heap a su vez se divide en Generaciones (Young, Old) que permiten a la JVM optimizar la recolección de basura. Entender esta estructura te ayuda a tomar decisiones como cuándo usar tipos primitivos vs objetos, o cómo configurar los tamaños de memoria al lanzar tu aplicación.
''',
    'code_example': '''
// Ejemplo de configuración de memoria al iniciar la JVM
// Esto se hace con parámetros de línea de comandos
public class MemoryDemo {
    public static void main(String[] args) {
        // -Xms512m -Xmx1024m -XX:MaxMetaspaceSize=256m
        System.out.println("Ejemplo de configuración de memoria");
    }
}

// Ejemplo problemático - Creación innecesaria de objetos
public class MemoryProblem {
    public static void main(String[] args) {
        while(true) {
            String s = new String("Hello"); // Mal: crea un nuevo objeto cada vez
            // Mejor: String s = "Hello";
        }
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 2,
    'tittle_level': 'Rendimiento y Optimización',
    'topic': 'JVM Internals',
    'subtopic': 'Recolectores de basura (GC)',
    'definition': '''
El recolector de basura (Garbage Collector o GC) es el sistema de limpieza automática de Java que libera memoria ocupada por objetos que ya no son necesarios. Es una de las características más poderosas de Java, pero también una de las más malentendidas.

¿Sabías que elegir el GC adecuado puede mejorar el rendimiento de tu aplicación hasta en un 50%? No todos los recolectores funcionan igual para todos los casos de uso.

Java ofrece varios tipos de GC: Serial GC (simple pero lento), Parallel GC (usa múltiples hilos), CMS (Concurrent Mark Sweep), G1 (Garbage First, el predeterminado desde Java 9), y ZGC/Shenandoah (para heaps enormes). Cada uno hace compromisos diferentes entre throughput (cantidad de trabajo realizado), latencia (tiempo de pausa), y uso de CPU. Por ejemplo, G1 intenta balancear estos factores dividiendo el heap en regiones, mientras que ZGC está diseñado para pausas extremadamente cortas incluso con terabytes de memoria.
''',
    'code_example': '''
// Ejemplo de configuración del Garbage Collector
public class GCDemo {
    public static void main(String[] args) {
        // Usar G1 GC (predeterminado desde Java 9)
        // -XX:+UseG1GC
        
        // Configurar tamaño máximo de pausa deseado
        // -XX:MaxGCPauseMillis=200
        
        System.out.println("Ejemplo de configuración GC");
    }
}

// Ejemplo que puede causar problemas de GC
public class GCProblem {
    public static void main(String[] args) {
        List<byte[]> list = new ArrayList<>();
        while(true) {
            list.add(new byte[1024 * 1024]); // Llena el heap rápidamente
            // Sin control, puede forzar GC frecuentes
        }
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 2,
    'tittle_level': 'Rendimiento y Optimización',
    'topic': 'JVM Internals',
    'subtopic': 'JIT compilation',
    'definition': '''
La compilación JIT (Just-In-Time) es uno de los secretos mejor guardados del rendimiento en Java. A diferencia de los lenguajes compilados tradicionalmente, Java convierte el bytecode en código nativo en tiempo de ejecución, justo cuando se necesita.

¿Te has preguntado cómo Java puede competir en rendimiento con lenguajes como C++? La magia está en el JIT y sus optimizaciones adaptativas.

El compilador JIT (como C1 y C2 en HotSpot) analiza el código mientras se ejecuta y aplica optimizaciones agresivas a los métodos más usados (los "hot spots"). Algunas técnicas incluyen: inline de métodos pequeños, eliminación de código muerto, o incluso desoptimización si las suposiciones cambian. Esto permite que Java tenga la portabilidad del bytecode pero con rendimiento cercano al nativo. El JIT aprende del comportamiento real de tu aplicación, por eso los benchmarks deben incluir fases de calentamiento.
''',
    'code_example': '''
// Ejemplo donde el JIT puede optimizar
public class JITExample {
    public static void main(String[] args) {
        for (int i = 0; i < 10_000; i++) {
            calculate(); // Después de muchas iteraciones, el JIT compilará este método
        }
    }
    
    private static void calculate() {
        // Método pequeño que puede ser inlined por el JIT
        int result = 2 + 2;
    }
}

// Ejemplo que dificulta la optimización
public class JITProblem {
    public static void main(String[] args) {
        for (int i = 0; i < 10_000; i++) {
            // Método grande con muchas ramas dificulta el JIT
            complexCalculation(i);
        }
    }
    
    private static void complexCalculation(int n) {
        if (n % 2 == 0) {
            // Muchas ramas diferentes
        } else {
            // Código alternativo
        }
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 2,
    'tittle_level': 'Rendimiento y Optimización',
    'topic': 'JVM Internals',
    'subtopic': 'Herramientas de monitoreo (jvisualvm, jconsole)',
    'definition': '''
jvisualvm y jconsole son las navajas suizas para cualquier desarrollador Java que necesite entender qué está pasando dentro de su aplicación en tiempo real. Son herramientas oficiales de Oracle incluidas en el JDK.

¿Alguna vez has tenido que solucionar un problema de rendimiento sin poder detener la aplicación? Estas herramientas te permiten conectarte a procesos Java en ejecución para obtener insights valiosos.

jvisualvm (la más completa) ofrece: monitoreo de CPU y memoria, profiling de métodos, análisis de heap para encontrar memory leaks, y hasta sampler de CPU. jconsole es más básica pero más ligera, ideal para monitoreo remoto. Ambas se conectan via JMX y pueden mostrar información detallada sobre threads, GC activity, y consumo de clases. Para producción, muchas empresas usan versiones adaptadas de estas herramientas conectadas a sus sistemas de monitoreo centralizados.
''',
    'code_example': '''
// Ejemplo de cómo habilitar JMX para monitoreo remoto
public class JMXEnabledApp {
    public static void main(String[] args) {
        // Parámetros comunes para habilitar JMX:
        // -Dcom.sun.management.jmxremote
        // -Dcom.sun.management.jmxremote.port=9010
        // -Dcom.sun.management.jmxremote.authenticate=false
        // -Dcom.sun.management.jmxremote.ssl=false
        
        while(true) {
            // Aplicación en ejecución que puede ser monitoreada
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}

// No hay ejemplo incorrecto para este tema, pero un error común es
// no habilitar JMX en producción cuando se necesita monitoreo
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 2,
    'tittle_level': 'Rendimiento y Optimización',
    'topic': 'Optimización',
    'subtopic': 'Benchmarking con JMH',
    'definition': '''
JMH (Java Microbenchmark Harness) es la herramienta estándar para medir el rendimiento de pequeños fragmentos de código Java. Es especialmente útil cuando necesitas comparar diferentes implementaciones para encontrar la más eficiente.

¿Por qué no simplemente medir con System.currentTimeMillis()? Porque el JIT, la optimización en tiempo de ejecución y otros factores pueden distorsionar completamente tus resultados.

JMH maneja automáticamente el calentamiento de la JVM (warmup), ejecuta múltiples iteraciones, y contrarresta optimizaciones engañosas. Para usarlo, defines métodos anotados con @Benchmark y JMH se encarga de ejecutarlos en condiciones controladas. Puedes medir throughput (operaciones por tiempo), tiempo promedio, o incluso detalles a nivel de nanosegundos. Es la herramienta que usan los desarrolladores del JDK para optimizar Java mismo.
''',
    'code_example': '''
// Ejemplo básico de benchmark con JMH
@BenchmarkMode(Mode.Throughput)
@OutputTimeUnit(TimeUnit.SECONDS)
@State(Scope.Thread)
public class StringConcatBenchmark {
    private String a = "Hello";
    private String b = "World";
    
    @Benchmark
    public String concatWithPlus() {
        return a + " " + b;  // Usa StringBuilder internamente
    }
    
    @Benchmark
    public String concatWithBuilder() {
        return new StringBuilder().append(a).append(" ").append(b).toString();
    }
}

// Para ejecutar:
// mvn clean install
// java -jar target/benchmarks.jar
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 2,
    'tittle_level': 'Rendimiento y Optimización',
    'topic': 'Optimización',
    'subtopic': 'Memory leaks',
    'definition': '''
Un memory leak en Java ocurre cuando objetos ya no necesarios siguen siendo referenciados, impidiendo que el garbage collector los libere. A diferencia de lenguajes sin GC, en Java los leaks son más sutiles y difíciles de detectar.

¿Te ha pasado que tu aplicación Java consume cada vez más memoria hasta que finalmente crashea? Eso suele ser un memory leak clásico.

Los leaks comunes incluyen: colecciones estáticas que nunca se limpian, listeners que no se desregistran, caches sin límite de tamaño, o hilos que no terminan. Herramientas como VisualVM o YourKit pueden ayudarte a identificar estos problemas mostrando qué objetos están ocupando memoria y qué los mantiene referenciados. La clave está en buscar objetos que deberían haber sido recolectados pero su número sigue creciendo. A veces la solución es tan simple como usar WeakReference o limpiar colecciones manualmente en momentos estratégicos.
''',
    'code_example': '''
// Ejemplo clásico de memory leak
public class LeakyClass {
    private static final List<byte[]> LEAK = new ArrayList<>();
    
    public void leakMemory() {
        while(true) {
            LEAK.add(new byte[1024 * 1024]); // Los bytes se añaden pero nunca se eliminan
        }
    }
}

// Solución: Limitar el tamaño o limpiar periódicamente
public class FixedClass {
    private static final int MAX_SIZE = 100;
    private static final List<byte[]> CACHE = new ArrayList<>();
    
    public void addToCache(byte[] data) {
        if(CACHE.size() >= MAX_SIZE) {
            CACHE.clear(); // Limpiamos cuando llega al límite
        }
        CACHE.add(data);
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 2,
    'tittle_level': 'Rendimiento y Optimización',
    'topic': 'Optimización',
    'subtopic': 'Optimización de colecciones',
    'definition': '''
Elegir la colección adecuada puede marcar la diferencia entre una aplicación rápida y una que se arrastra. Java ofrece una amplia variedad de estructuras de datos en el Collections Framework, cada una con sus fortalezas y debilidades.

¿Sabías que usar un ArrayList donde necesitas frecuentes inserciones/eliminaciones en medio puede ser hasta 1000 veces más lento que una LinkedList? Pero en la mayoría de casos, ArrayList es la mejor opción.

Las claves para optimizar colecciones son: entender los patrones de acceso (más lecturas que escrituras?), el tamaño esperado de los datos, y la concurrencia. Por ejemplo, HashMap es genérico pero LinkedHashMap mantiene orden de inserción, EnumMap es ultra-rápido para enums, y ConcurrentSkipListMap escala mejor con muchos hilos. Para casos extremos, a veces la mejor "colección" es un simple array primitivo. También considera colecciones inmutables cuando los datos no cambian - son más seguras y a veces más eficientes.
''',
    'code_example': '''
// Ejemplo de selección óptima de colecciones
public class CollectionChoices {
    public static void main(String[] args) {
        // Caso 1: Muchas búsquedas por clave
        Map<String, User> userCache = new HashMap<>(); 
        
        // Caso 2: Necesitas orden de inserción
        Map<String, User> loggedInUsers = new LinkedHashMap<>();
        
        // Caso 3: Concurrencia alta
        Map<String, User> concurrentUsers = new ConcurrentHashMap<>();
        
        // Caso 4: Rangos frecuentes (floor, ceiling)
        NavigableSet<Integer> sortedIds = new TreeSet<>();
    }
}

// Ejemplo problemático
public class BadCollectionChoice {
    public static void main(String[] args) {
        // LinkedList para acceso aleatorio frecuente
        List<Data> dataList = new LinkedList<>(); 
        for (int i = 0; i < 10000; i++) {
            dataList.get(i); // O(n) cada vez - muy lento!
        }
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 2,
    'tittle_level': 'Rendimiento y Optimización',
    'topic': 'Optimización',
    'subtopic': 'Caching strategies',
    'definition': '''
El caching es una de las técnicas más efectivas para mejorar el rendimiento, almacenando resultados costosos para reutilizarlos después. Pero implementar un buen sistema de cache no es tan simple como parece.

¿Por qué no cachear todo entonces? Porque el caching tiene sus propios problemas: consumo de memoria, consistencia de datos, y complejidad añadida.

Java ofrece varias opciones para caching: desde simples HashMaps sincronizados (para casos básicos), hasta soluciones avanzadas como Caffeine o Ehcache con expiración por tiempo, tamaño, o referencia. La estrategia adecuada depende de tu caso: cachear resultados de bases de datos, respuestas HTTP, o cálculos intensivos. También debes decidir políticas como LRU (Least Recently Used) o FIFO (First In First Out) para gestionar el espacio. Spring Cache abstrae mucho de esta complejidad con anotaciones como @Cacheable, pero entender lo que ocurre bajo el capó es crucial para evitar problemas.
''',
    'code_example': '''
// Ejemplo básico de cache con HashMap
public class SimpleCache<K, V> {
    private final Map<K, V> cache = new HashMap<>();
    
    public synchronized V get(K key, Supplier<V> supplier) {
        return cache.computeIfAbsent(key, k -> supplier.get());
    }
}

// Ejemplo con Caffeine (librería moderna de caching)
public class AdvancedCache {
    private final Cache<String, Data> cache = Caffeine.newBuilder()
        .maximumSize(1000)
        .expireAfterWrite(1, TimeUnit.HOURS)
        .build();
        
    public Data getData(String id) {
        return cache.get(id, this::loadDataFromDatabase);
    }
    
    private Data loadDataFromDatabase(String id) {
        // Operación costosa
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 2,
    'tittle_level': 'Rendimiento y Optimización',
    'topic': 'Optimización',
    'subtopic': 'Memory leaks',
    'definition': '''
Un memory leak en Java ocurre cuando objetos ya no necesarios siguen siendo referenciados, impidiendo que el garbage collector los libere. A diferencia de lenguajes sin GC, en Java los leaks son más sutiles y difíciles de detectar.

¿Te ha pasado que tu aplicación Java consume cada vez más memoria hasta que finalmente crashea? Eso suele ser un memory leak clásico.

Los leaks comunes incluyen: colecciones estáticas que nunca se limpian, listeners que no se desregistran, caches sin límite de tamaño, o hilos que no terminan. Herramientas como VisualVM o YourKit pueden ayudarte a identificar estos problemas mostrando qué objetos están ocupando memoria y qué los mantiene referenciados. La clave está en buscar objetos que deberían haber sido recolectados pero su número sigue creciendo. A veces la solución es tan simple como usar WeakReference o limpiar colecciones manualmente en momentos estratégicos.
''',
    'code_example': '''
// Ejemplo clásico de memory leak
public class LeakyClass {
    private static final List<byte[]> LEAK = new ArrayList<>();
    
    public void leakMemory() {
        while(true) {
            LEAK.add(new byte[1024 * 1024]); // Los bytes se añaden pero nunca se eliminan
        }
    }
}

// Solución: Limitar el tamaño o limpiar periódicamente
public class FixedClass {
    private static final int MAX_SIZE = 100;
    private static final List<byte[]> CACHE = new ArrayList<>();
    
    public void addToCache(byte[] data) {
        if(CACHE.size() >= MAX_SIZE) {
            CACHE.clear(); // Limpiamos cuando llega al límite
        }
        CACHE.add(data);
    }
}
'''
  });
}

Future<void> insertSrLevel3Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Spring Framework',
    'topic': 'Spring Core',
    'subtopic': 'Inversión de Control (IoC)',
    'definition': '''
La Inversión de Control (IoC) es uno de los principios fundamentales en Spring que cambia la forma tradicional de manejar las dependencias entre componentes. En lugar de que cada objeto cree o gestione sus propias dependencias, delega esa responsabilidad al contenedor de Spring.

¿Te has preguntado por qué esto es tan revolucionario? Piénsalo así: en desarrollo tradicional, cada clase que necesita otra dependencia debe crearla o buscarla manualmente. Con IoC, Spring se encarga de inyectar esas dependencias donde se necesitan, lo que hace el código más limpio, testeable y mantenible.

El contenedor IoC de Spring es el núcleo del framework. Administra el ciclo de vida de los objetos (llamados beans) y sus dependencias. Cuando defines un bean (usando anotaciones como @Component o @Service), Spring lo registra en su contenedor. Luego, cuando otro componente lo necesita (usando @Autowired), Spring lo inyecta automáticamente. Esto elimina el acoplamiento fuerte entre clases y facilita cambios futuros. Además, permite configuraciones flexibles mediante XML, anotaciones o Java Config.
''',
    'code_example': '''
// Ejemplo correcto usando IoC con Spring
@Service
public class UserService {
    private final UserRepository userRepository;
    
    @Autowired  // Spring inyecta la dependencia automáticamente
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }
}

// Ejemplo incorrecto (sin IoC)
public class UserService {
    private UserRepository userRepository = new UserRepository();  // Acoplamiento fuerte
    
    public UserService() {
        // Problema: difícil de testear y cambiar implementación
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Spring Framework',
    'topic': 'Spring Core',
    'subtopic': 'Inyección de Dependencias (DI)',
    'definition': '''
La Inyección de Dependencias (DI) es el mecanismo práctico que implementa el principio de IoC en Spring. Consiste en proporcionar las dependencias que un objeto necesita desde el exterior, en lugar de que el objeto las cree internamente.

¿Por qué esto es tan importante? Porque transforma la forma en que diseñamos aplicaciones. Imagina tener que cambiar una implementación en 50 clases diferentes porque no usabas DI... 😅 Con Spring, solo cambias la configuración en un lugar.

Spring ofrece tres formas principales de DI:
1. Inyección por constructor (la más recomendada): Las dependencias se pasan como parámetros al constructor.
2. Inyección por setter: Dependencias se asignan mediante métodos setter.
3. Inyección por campo: Usando @Autowired directamente sobre campos (menos recomendado).

La DI no solo hace el código más limpio, sino que también facilita las pruebas unitarias (puedes mockear dependencias fácilmente) y promueve el principio de inversión de dependencias (D de SOLID). Además, Spring maneja automáticamente el alcance (scope) de las dependencias, como singleton o prototype.
''',
    'code_example': '''
// Ejemplo correcto: Inyección por constructor (recomendado)
@RestController
public class UserController {
    private final UserService userService;
    
    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }
}

// Ejemplo aceptable: Inyección por setter
@RestController
public class UserController {
    private UserService userService;
    
    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}

// Ejemplo no recomendado: Inyección directa en campo
@RestController
public class UserController {
    @Autowired  // Evitar esto en producción
    private UserService userService;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Spring Framework',
    'topic': 'Spring Core',
    'subtopic': 'Anotaciones (@Component, @Service, @Repository)',
    'definition': '''
Spring utiliza anotaciones para identificar y clasificar los diferentes tipos de componentes en tu aplicación. Las principales son @Component, @Service y @Repository, cada una con un propósito específico pero con un funcionamiento similar bajo el capó.

¿Notas cómo estas anotaciones parecen iguales pero tienen nombres diferentes? No es solo por capricho. Cada una comunica una intención específica sobre el rol que juega esa clase en tu aplicación, lo que mejora la legibilidad y permite comportamientos especializados.

@Component es la anotación genérica para cualquier bean gestionado por Spring. @Service se usa específicamente para clases que contienen lógica de negocio. @Repository es para clases que acceden a datos (como DAOs), y tiene un beneficio adicional: Spring traduce automáticamente las excepciones específicas de persistencia en DataAccessException. 

Aunque técnicamente podrías usar solo @Component para todo, usar las anotaciones específicas:
- Mejora la legibilidad del código
- Permite que Spring aplique comportamientos especiales
- Facilita el uso de pointcuts en AOP
- Ayuda en la documentación automática
''',
    'code_example': '''
// Ejemplo correcto usando las anotaciones adecuadas
@Repository  // Indica que esta clase accede a datos
public class UserRepositoryImpl implements UserRepository {
    // implementación
}

@Service  // Indica lógica de negocio
public class UserService {
    private final UserRepository userRepository;
    
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }
}

@Component  // Componente genérico
public class CustomComponent {
    // implementación
}

// Ejemplo incorrecto: Uso inapropiado de anotaciones
@Service  // Incorrecto: Esto no es lógica de negocio
public class UserDao {
    // implementación de acceso a datos
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Spring Framework',
    'topic': 'Spring Core',
    'subtopic': 'Configuración (XML vs Anotaciones vs Java Config)',
    'definition': '''
Spring ofrece tres enfoques principales para configurar tu aplicación: XML, anotaciones y Java Config. Cada uno tiene sus ventajas y casos de uso ideales, y en aplicaciones modernas es común ver una mezcla de ellos.

¿Recuerdas los primeros días de Spring cuando todo era XML? Afortunadamente, las cosas han evolucionado. Pero aunque las anotaciones y Java Config son más modernas, el XML todavía tiene su lugar en ciertos escenarios.

XML fue el primer método de configuración en Spring. Es verboso pero explícito, y permite cambiar configuraciones sin recompilar. Las anotaciones (como @Component, @Autowired) hacen el código más conciso pero lo acoplan a Spring. Java Config (usando clases @Configuration) ofrece lo mejor de ambos: configuración type-safe en código Java sin acoplamiento directo en tus clases de negocio.

En aplicaciones modernas, la tendencia es:
- Usar Java Config para la configuración principal
- Anotaciones para convenciones simples
- XML solo para configuraciones muy dinámicas o legacy
Spring Boot ha adoptado fuertemente este enfoque, usando Java Config internamente pero permitiendo sobreescritura con propiedades simples.
''',
    'code_example': '''
// Ejemplo Java Config (moderno)
@Configuration
public class AppConfig {
    @Bean
    public UserService userService(UserRepository userRepository) {
        return new UserServiceImpl(userRepository);
    }
}

<!-- Ejemplo XML (legacy pero aún útil) -->
<beans>
    <bean id="userService" class="com.example.UserServiceImpl">
        <constructor-arg ref="userRepository"/>
    </bean>
</beans>

// Ejemplo con anotaciones (más conciso)
@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Spring Framework',
    'topic': 'Spring Boot',
    'subtopic': 'Auto-configuración',
    'definition': '''
Una de las características más poderosas de Spring Boot es su capacidad de auto-configuración. Basándose en las dependencias que tengas en tu classpath y en ciertas convenciones, Spring Boot puede configurar automáticamente tu aplicación con valores sensatos por defecto.

¿Te imaginas tener que configurar manualmente cada integración con bases de datos, servidores web o sistemas de mensajería? Spring Boot elimina esa carga, permitiéndote enfocarte en lo que realmente importa: tu lógica de negocio.

La auto-configuración funciona mediante condiciones (@Conditional). Por ejemplo, si tienve spring-boot-starter-data-jpa en tu classpath, Spring Boot:
1. Detecta que quieres usar JPA
2. Configura automáticamente un DataSource
3. Configura Hibernate como proveedor JPA por defecto
4. Configura transacciones
Todo esto con valores sensatos, pero que puedes sobrescribir fácilmente. La magia está en el archivo spring.factories dentro de spring-boot-autoconfigure, donde se definen todas las configuraciones automáticas posibles. Lo mejor es que si no necesitas algo, simplemente no lo incluyes en tus dependencias y Spring Boot no lo configurará.
''',
    'code_example': '''
// Ejemplo: Cómo sobrescribir una auto-configuración
@Configuration
public class MyDataSourceConfig {
    @Bean
    @ConfigurationProperties(prefix="app.datasource")
    public DataSource dataSource() {
        return DataSourceBuilder.create().build();
    }
}

// application.properties para personalizar
app.datasource.url=jdbc:mysql://localhost:3306/mydb
app.datasource.username=myuser
app.datasource.password=mypass

// Ejemplo incorrecto: Deshabilitar toda auto-configuración
@SpringBootApplication(exclude={DataSourceAutoConfiguration.class})
public class MyApp {
    // Esto dejará tu aplicación sin DataSource a menos que lo configures manualmente
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Spring Framework',
    'topic': 'Spring Boot',
    'subtopic': 'Spring Boot Starters',
    'definition': '''
Los Spring Boot Starters son una de las características más apreciadas del ecosistema Spring Boot. Son dependencias que agrupan todo lo necesario para integrar una tecnología específica en tu aplicación, simplificando enormemente la gestión de dependencias.

¿Alguna vez has intentado configurar JPA manualmente y te has perdido en un mar de dependencias conflictivas? Los starters resuelven exactamente ese problema, proporcionando conjuntos de dependencias probadas y compatibles entre sí.

Cada starter (como spring-boot-starter-web o spring-boot-starter-data-jpa) incluye:
- Las dependencias principales
- Cualquier dependencia transitiva necesaria
- Configuraciones automáticas adecuadas
- Versiones compatibles probadas

Por ejemplo, spring-boot-starter-web incluye todo lo necesario para construir una aplicación web:
- Spring MVC
- Un servidor embebido (Tomcat por defecto)
- Jackson para JSON
- Validación
- Y otras dependencias relacionadas

La convención de nombres es simple: spring-boot-starter-{nombre}. Esto hace extremadamente fácil añadir funcionalidades a tu proyecto sin preocuparte por conflictos de versiones.
''',
    'code_example': '''
// Ejemplo de pom.xml usando starters
<dependencies>
    <!-- Starter para aplicaciones web -->
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-web</artifactId>
    </dependency>
    
    <!-- Starter para JPA y bases de datos -->
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-data-jpa</artifactId>
    </dependency>
</dependencies>

// Ejemplo incorrecto: Incluir dependencias manualmente junto con starters
<dependency>
    <groupId>org.hibernate</groupId>
    <artifactId>hibernate-core</artifactId> <!-- Redundante con starter-data-jpa -->
    <version>5.4.32.Final</version> <!-- Podría causar conflictos -->
</dependency>
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Spring Framework',
    'topic': 'Spring Boot',
    'subtopic': 'Configuración de propiedades',
    'definition': '''
Spring Boot ofrece un sistema flexible y potente para gestionar la configuración de tu aplicación mediante propiedades. Estas propiedades pueden definirse en múltiples fuentes y se unifican en un único entorno de configuración accesible desde cualquier parte de tu código.

¿Alguna vez has tenido que manejar docenas de archivos .properties para diferentes entornos? Spring Boot simplifica esto con un sistema jerárquico donde las propiedades pueden sobreescribirse según el entorno, con valores predeterminados sensatos y una sintaxis consistente.

El orden de precedencia de las propiedades en Spring Boot es:
1. Propiedades específicas de tests (@TestPropertySource)
2. Argumentos de línea de comandos (--server.port=8080)
3. Variables de entorno
4. application-{profile}.yml/.properties
5. application.yml/.properties (configuración base)

Puedes acceder a estas propiedades usando:
- @Value para inyección directa
- @ConfigurationProperties para agrupar propiedades relacionadas
- Environment API para acceso programático

Además, Spring Boot soporta YAML (mejor para configuraciones jerárquicas) y propiedades tipo Relaxed Binding (server.port equivale a SERVER_PORT en variables de entorno).
''',
    'code_example': '''
// Ejemplo con @ConfigurationProperties
@ConfigurationProperties(prefix = "app.mail")
public class MailProperties {
    private String host;
    private int port;
    private String username;
    // getters y setters
}

// application.yml
app:
  mail:
    host: smtp.example.com
    port: 587
    username: admin@example.com

// Ejemplo con @Value
@Service
public class NotificationService {
    @Value("{app.notification.enabled}")
    private boolean enabled;
}

// Ejemplo incorrecto: Hardcodeo de valores
@Service
public class PaymentService {
    private String apiUrl = "https://prod.api.com"; // Debería ser configurable
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Spring Framework',
    'topic': 'Spring Boot',
    'subtopic': 'Spring Boot Actuator',
    'definition': '''
Spring Boot Actuator es tu ventana al interior de tu aplicación en producción. Proporciona endpoints HTTP y JMX que te permiten monitorizar y gestionar tu aplicación, exponiendo métricas, información de salud y otras características operacionales.

¿Cómo sabes si tu aplicación está realmente sana en producción? No basta con que esté en ejecución. Actuator te da visibilidad real sobre el estado de tus conexiones a BD, espacio en disco, uso de memoria y mucho más, todo a través de una API estandarizada.

Los endpoints principales de Actuator incluyen:
- /health: Estado de salud de la aplicación (BD, discos, etc.)
- /metrics: Métricas de JVM, sistema y personalizadas
- /info: Información general de la aplicación (versión, descripción)
- /env: Variables de entorno y propiedades de configuración
- /loggers: Configuración y niveles de logging

Para usar Actuator, solo necesitas añadir la dependencia spring-boot-starter-actuator. Puedes configurar qué endpoints exponer (HTTP/JMX), su visibilidad (solo admin o públicos) y hasta agregar endpoints personalizados. En entornos cloud, esta información se integra automáticamente con plataformas como Kubernetes para tomar decisiones de escalado y recuperación.
''',
    'code_example': '''
// Ejemplo: Configuración básica de Actuator
# application.properties
management.endpoints.web.exposure.include=health,info,metrics
management.endpoint.health.show-details=always
management.metrics.tags.application=myapp

// Ejemplo: Endpoint personalizado
@Component
@Endpoint(id = "features")
public class CustomActuatorEndpoint {
    @ReadOperation
    public Map<String, Boolean> features() {
        return Map.of("newCheckout", true, "legacyMode", false);
    }
}

// Ejemplo incorrecto: Exponer todos los endpoints en producción
# application-prod.properties
management.endpoints.web.exposure.include=*  // ¡Peligroso!
management.endpoint.env.enabled=true  // Expone configuraciones sensibles
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Spring Framework',
    'topic': 'Spring Data',
    'subtopic': 'Repositorios JPA',
    'definition': '''
Spring Data JPA te permite trabajar con bases de datos de una forma mucho más sencilla y elegante, sin tener que escribir SQL todo el tiempo. Usando interfaces y anotaciones, podés tener operaciones CRUD (crear, leer, actualizar y eliminar) funcionando en minutos.

¿Pero entonces qué significa eso de "repositorio JPA"?

Básicamente, vos definís una interfaz que extiende `JpaRepository`, y automáticamente Spring genera la implementación por vos. No tenés que preocuparte por abrir conexiones, preparar sentencias SQL ni manejar el resultado manualmente. Solo definís tu entidad, el tipo de su clave primaria, y Spring se encarga del resto. Esto hace que trabajar con persistencia en Java sea mucho más limpio y mantenible. 
  ''',
    'code_example': '''
// Una entidad simple
@Entity
public class Producto {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;
  private String nombre;
  private Double precio;
}

// Repositorio asociado
public interface ProductoRepository extends JpaRepository<Producto, Long> {
  // No necesitas escribir nada más para tener métodos como save(), findAll(), findById(), deleteById()...
}
  ''',
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Spring Framework',
    'topic': 'Spring Data',
    'subtopic': 'Consultas derivadas de métodos',
    'definition': '''
Una de las cosas más potentes (y mágicas) de Spring Data es que puede generar consultas automáticamente basándose en los nombres de los métodos. No necesitas escribir SQL ni JPQL para tareas comunes, solo crear métodos con nombres bien descriptivos.

¿Te estás preguntando cómo sabe Spring qué consulta hacer solo con el nombre del método?

Spring analiza el nombre del método, y si sigue una convención como `findByNombre`, automáticamente crea una consulta que busca por el campo `nombre`. Podés encadenar condiciones (`findByNombreAndPrecio`), usar palabras clave como `Containing`, `Between`, `GreaterThan`, etc. Eso sí, hay que ser cuidadoso con los nombres largos y seguir bien las reglas.

Esta técnica ahorra mucho tiempo y hace que tu código sea más legible, pero no es una solución mágica para todo. Para consultas más complejas, es mejor usar `@Query` o incluso Criteria API.
  ''',
    'code_example': '''
public interface ProductoRepository extends JpaRepository<Producto, Long> {

  // Buscar por nombre exacto
  List<Producto> findByNombre(String nombre);

  // Buscar productos con precio mayor a un valor
  List<Producto> findByPrecioGreaterThan(Double precio);

  // Buscar por nombre que contenga una palabra
  List<Producto> findByNombreContaining(String fragmento);

  // Esto es válido, pero demasiado largo puede volverse ilegible:
  // List<Producto> findByNombreAndPrecioBetweenAndDisponibleTrueOrderByPrecioDesc(...);
}
  ''',
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Spring Framework',
    'topic': 'Spring Data',
    'subtopic': '@Query personalizadas',
    'definition': '''
Aunque los métodos derivados son súper útiles, hay momentos en los que necesitás más control sobre las consultas. Ahí entra en juego la anotación `@Query`. Con ella podés escribir consultas JPQL o SQL directamente dentro de tu repositorio, de forma clara y precisa.

¿No te pasa que querés algo más complejo y los nombres de método ya no alcanzan?

Con `@Query` podés hacer joins, subconsultas, filtros personalizados y todo lo que necesites. Además, podés combinarlo con parámetros y usar expresiones dinámicas. También hay soporte para consultas nativas (usando `nativeQuery = true`) si lo necesitas.

Eso sí, al usar `@Query` perdés un poco de la "magia" automática de Spring, pero ganás mucha más flexibilidad.
  ''',
    'code_example': '''
public interface ProductoRepository extends JpaRepository<Producto, Long> {

  // Consulta con JPQL
  @Query("SELECT p FROM Producto p WHERE p.precio > :precioMinimo")
  List<Producto> buscarCaros(@Param("precioMinimo") Double precio);

  // Consulta nativa
  @Query(value = "SELECT * FROM producto WHERE nombre LIKE %:texto%", nativeQuery = true)
  List<Producto> buscarPorNombreLike(@Param("texto") String texto);
}
  ''',
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Spring Framework',
    'topic': 'Spring Data',
    'subtopic': 'Auditoría',
    'definition': '''
La auditoría en aplicaciones es clave cuando necesitás rastrear "quién hizo qué y cuándo". En Spring Data, esto se puede hacer de forma automática usando anotaciones y configuración mínima.

¿Te interesa saber quién creó o actualizó un registro? Spring te cubre.

Spring Data ofrece soporte de auditoría para capturar datos como fecha de creación, fecha de última modificación, usuario que creó o modificó un registro, etc. Solo tenés que usar anotaciones como `@CreatedDate`, `@LastModifiedDate`, `@CreatedBy` y `@LastModifiedBy`. Además, necesitás habilitar la auditoría en tu configuración y proporcionar un auditor-aware para capturar el usuario activo.

Esto es muy útil en aplicaciones donde hay varios usuarios y querés llevar trazabilidad de todo.
  ''',
    'code_example': '''
@EntityListeners(AuditingEntityListener.class)
@Entity
public class Producto {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  private String nombre;

  @CreatedDate
  private LocalDateTime fechaCreacion;

  @LastModifiedDate
  private LocalDateTime fechaModificacion;

  @CreatedBy
  private String creadoPor;

  @LastModifiedBy
  private String modificadoPor;
}

// En tu configuración principal
@EnableJpaAuditing
public class ConfiguracionAuditoria {
  // También necesitas un AuditorAware para registrar el usuario actual
}
  ''',
  });
}

Future<void> insertSrLevel4Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 4,
    'title_level': 'Arquitectura Avanzada',
    'topic': 'Microservicios',
    'subtopic': 'Principios de microservicios',
    'definition': '''
Los microservicios son una forma de estructurar una aplicación grande como un conjunto de servicios pequeños, independientes y enfocados en una funcionalidad específica. A diferencia del enfoque monolítico, acá cada pieza puede evolucionar por separado.

¿Te estás preguntando si vale la pena complicarse así?

La idea es que al dividir una aplicación en servicios pequeños, podés escalar, desplegar, mantener y hasta reescribir partes sin tocar el resto. Cada servicio puede estar desarrollado por un equipo distinto, en diferentes tecnologías incluso, y se comunican generalmente por HTTP o mensajería. Eso sí, no todo es color de rosas: se gana flexibilidad, pero se suma complejidad en infraestructura, monitoreo y comunicación entre servicios. Por eso es importante aplicar principios como: responsabilidad única, independencia de despliegue, resiliencia y observabilidad desde el diseño.
  ''',
    'code_example': '''
// No hay código directo, pero el principio sería dividir tu app en servicios:

// Servicio de Autenticación -> maneja login y JWT
// Servicio de Productos -> maneja catálogo y stock
// Servicio de Pedidos -> maneja órdenes y pagos

// Cada uno tiene su base de datos y API independiente.
  ''',
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 4,
    'title_level': 'Arquitectura Avanzada',
    'topic': 'Microservicios',
    'subtopic': 'Spring Cloud',
    'definition': '''
Spring Cloud es una colección de herramientas diseñadas para hacer tu vida más fácil cuando trabajás con microservicios. Te ayuda a manejar cosas como configuración centralizada, descubrimiento de servicios, tolerancia a fallos, rutas dinámicas y más.

¿No te pasa que tener 5 microservicios ya te hace sentir que todo se va de las manos?

Con Spring Cloud, podés tener un *config server* que centraliza las propiedades de todos tus servicios, usar Eureka para el descubrimiento automático de endpoints, habilitar reintentos automáticos con Resilience4j, y definir rutas dinámicas con Spring Cloud Gateway. Lo mejor: todo se integra fluido con Spring Boot, así que la curva de aprendizaje es mucho más amigable que armarlo todo desde cero.
  ''',
    'code_example': '''
// Ejemplo simple de Config Server

@SpringBootApplication
@EnableConfigServer
public class ConfigServerApplication {
  public static void main(String[] args) {
    SpringApplication.run(ConfigServerApplication.class, args);
  }
}

// application.properties
server.port=8888
spring.cloud.config.server.git.uri=https://github.com/tu-org/config-repo
  ''',
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 4,
    'title_level': 'Arquitectura Avanzada',
    'topic': 'Microservicios',
    'subtopic': 'Service discovery (Eureka)',
    'definition': '''
Eureka es el componente de Spring Cloud que permite a los servicios encontrarse entre sí sin necesidad de conocer direcciones IP o puertos de antemano. Actúa como una especie de "guía telefónica" de servicios.

¿Te imaginás tener que configurar manualmente las direcciones de cada microservicio cada vez?

Con Eureka, cada servicio se registra automáticamente cuando arranca, y otros servicios pueden consultarlo para saber cómo comunicarse. Esto permite balanceo de carga, alta disponibilidad y una arquitectura más dinámica. Spring Boot lo soporta de forma nativa con solo agregar unas dependencias y anotaciones.
  ''',
    'code_example': '''
// Servidor Eureka
@EnableEurekaServer
@SpringBootApplication
public class EurekaServer {
  public static void main(String[] args) {
    SpringApplication.run(EurekaServer.class, args);
  }
}

// Cliente Eureka
@EnableEurekaClient
@SpringBootApplication
public class ProductoService {
  public static void main(String[] args) {
    SpringApplication.run(ProductoService.class, args);
  }
}
  ''',
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 4,
    'title_level': 'Arquitectura Avanzada',
    'topic': 'Microservicios',
    'subtopic': 'API Gateway (Spring Cloud Gateway)',
    'definition': '''
Un API Gateway es la puerta de entrada a tu sistema de microservicios. En vez de que el cliente se conecte directamente a cada servicio, lo hace a través del Gateway, que enruta las peticiones y agrega funcionalidades como seguridad, logging, rate limiting y más.

¿Y por qué no dejar que el frontend hable con cada microservicio directamente?

Porque con el tiempo vas a necesitar más control: autenticación centralizada, transformar respuestas, manejar rutas dinámicas, etc. Spring Cloud Gateway es una solución reactiva, liviana y fácil de configurar que hace todo esto y más. Es el reemplazo moderno de Zuul, con soporte para programación funcional y filtros personalizados.
  ''',
    'code_example': '''
// Ejemplo de configuración en application.yml

spring:
  cloud:
    gateway:
      routes:
        - id: producto-service
          uri: lb://producto-service
          predicates:
            - Path=/productos/**
          filters:
            - AddRequestHeader=X-Request-Foo, Bar
      discovery:
        locator:
          enabled: true

// Esto enruta /productos/** al microservicio "producto-service" registrado en Eureka
  ''',
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 4,
    'title_level': 'Arquitectura Avanzada',
    'topic': 'Seguridad',
    'subtopic': 'Spring Security',
    'definition': '''
Spring Security es el estándar de facto para implementar seguridad en aplicaciones Spring. Proporciona autenticación, autorización y protección contra vulnerabilidades comunes de manera declarativa.

¿Sabías que el 70% de las vulnerabilidades en aplicaciones web están relacionadas con fallos de seguridad? Spring Security actúa como un filtro robusto que intercepta cada petición, verificando identidades y permisos antes de permitir el acceso a tus recursos.

Los componentes clave incluyen:
- SecurityFilterChain: Define el flujo de seguridad
- UserDetailsService: Carga información específica del usuario
- PasswordEncoder: Para el hashing seguro de contraseñas
- AuthenticationProvider: Lógica personalizada de autenticación

Configurarlo correctamente implica:
1. Definir reglas de autorización por URL
2. Configurar el manejo de autenticación
3. Establecer políticas de sesión
4. Proteger contra CSRF y XSS
5. Configurar CORS adecuadamente

Spring Security sigue el principio de "secure by default", bloqueando todo acceso hasta que se configure explícitamente. Su arquitectura modular permite adaptarlo desde simples autenticaciones en memoria hasta complejas integraciones con OAuth2 y proveedores de identidad empresariales.
''',
    'code_example': '''
// Configuración básica de seguridad
@Configuration
@EnableWebSecurity
public class SecurityConfig {
    
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .authorizeHttpRequests(auth -> auth
                .requestMatchers("/public/**").permitAll()
                .requestMatchers("/admin/**").hasRole("ADMIN")
                .anyRequest().authenticated()
            )
            .formLogin(form -> form
                .loginPage("/login")
                .permitAll()
            )
            .logout(logout -> logout
                .permitAll()
            );
        return http.build();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}

// Ejemplo incorrecto: Configuración insegura
@Configuration
@EnableWebSecurity
public class InsecureConfig {
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http.authorizeHttpRequests().anyRequest().permitAll(); // ¡Peligro! Acceso total
        return http.build();
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 4,
    'title_level': 'Arquitectura Avanzada',
    'topic': 'Seguridad',
    'subtopic': 'Autenticación (JWT, OAuth2)',
    'definition': '''
La autenticación moderna en aplicaciones Spring va más allá del usuario/contraseña. JWT y OAuth2 son estándares que permiten autenticación stateless y federada, esencial para arquitecturas distribuidas y aplicaciones móviles.

¿Por qué JWT se ha vuelto tan popular? Porque resuelve el problema de escalabilidad en sistemas distribuidos. En lugar de almacenar sesiones en el servidor, toda la información necesaria viaja en un token firmado que el cliente presenta en cada petición.

Spring Security soporta:
- JWT (JSON Web Tokens): Tokens autocontenidos con firma digital
- OAuth2: Flujos de autorización estándar (authorization_code, client_credentials, etc.)
- OpenID Connect: Autenticación federada sobre OAuth2

Implementar JWT correctamente requiere:
1. Generar tokens firmados al login
2. Validar firmas en cada petición
3. Manejar renovación de tokens expirados
4. Incluir sólo información necesaria en claims

Para OAuth2, Spring Security 5+ provee integración con:
- Proveedores como Google, Facebook, GitHub
- Servidores de autorización (Keycloak, Okta)
- Resource servers para proteger APIs
''',
    'code_example': '''
// Configuración JWT con Spring Security
@Configuration
@EnableWebSecurity
public class JwtSecurityConfig {
    
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .csrf().disable()
            .authorizeHttpRequests(auth -> auth
                .requestMatchers("/auth/login").permitAll()
                .anyRequest().authenticated()
            )
            .addFilterBefore(jwtFilter(), UsernamePasswordAuthenticationFilter.class);
        return http.build();
    }

    @Bean
    public JwtAuthenticationFilter jwtFilter() {
        return new JwtAuthenticationFilter();
    }
}

// Ejemplo de generación JWT
public String generateToken(UserDetails userDetails) {
    Map<String, Object> claims = new HashMap<>();
    claims.put("roles", userDetails.getAuthorities());
    
    return Jwts.builder()
        .setClaims(claims)
        .setSubject(userDetails.getUsername())
        .setIssuedAt(new Date())
        .setExpiration(new Date(System.currentTimeMillis() + 3600000))
        .signWith(SignatureAlgorithm.HS256, secretKey)
        .compact();
}

// Ejemplo OAuth2 con Google
spring:
  security:
    oauth2:
      client:
        registration:
          google:
            client-id: your-client-id
            client-secret: your-client-secret
            scope: email, profile
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 4,
    'title_level': 'Arquitectura Avanzada',
    'topic': 'Seguridad',
    'subtopic': 'Autorización',
    'definition': '''
La autorización determina qué puede hacer un usuario autenticado en tu sistema. Spring Security ofrece múltiples enfoques para implementar controles de acceso granulares, desde simples roles hasta lógicas complejas basadas en dominios.

¿Has visto sistemas donde los usuarios pueden acceder a funcionalidades que no deberían? Eso es un fallo de autorización. Spring Security proporciona tres enfoques principales:

1. Autorización basada en roles:
   - @PreAuthorize("hasRole('ADMIN')")
   - .hasAuthority("ROLE_ADMIN") en config

2. Autorización basada en expresiones:
   - @PreAuthorize("hasPermission(#id, 'read')")
   - SpEL para lógica compleja

3. Autorización basada en dominios (ACL):
   - Acceso condicional a recursos específicos
   - Implementado con @PostAuthorize y consultas

Los métodos recomendados son:
- Usar @PreAuthorize para controles preventivos
- @PostAuthorize para verificaciones posteriores
- Method Security para proteger servicios
- Anotaciones personalizadas para reglas complejas

Spring Security también soporta:
- Autorización reactiva con WebFlux
- Integración con Spring Data para filtrado seguro
- Patrón RBAC (Role-Based Access Control)
''',
    'code_example': '''
// Ejemplo de autorización en métodos
@Service
public class OrderService {
    
    @PreAuthorize("hasRole('USER')")
    public Order createOrder(Order order) {
        // lógica
    }
    
    @PreAuthorize("hasRole('ADMIN') or #userId == authentication.principal.id")
    public List<Order> getUserOrders(Long userId) {
        // lógica
    }
    
    @PostAuthorize("returnObject.userId == authentication.principal.id")
    public Order getOrderDetails(Long orderId) {
        // lógica
    }
}

// Configuración global
@Configuration
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class MethodSecurityConfig {
    // Habilitar anotaciones @PreAuthorize
}

// Ejemplo incorrecto: Verificación manual insegura
@Service
public class InsecureService {
    public void deleteAccount(Long accountId) {
        // ¡Sin verificación de autorización!
        accountRepository.deleteById(accountId);
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 4,
    'title_level': 'Arquitectura Avanzada',
    'topic': 'Seguridad',
    'subtopic': 'CSRF y CORS',
    'definition': '''
CSRF (Cross-Site Request Forgery) y CORS (Cross-Origin Resource Sharing) son dos mecanismos de seguridad fundamentales para aplicaciones web modernas. Spring Security proporciona protección automática contra estos vectores de ataque.

¿Sabías que un ataque CSRF puede realizar acciones en nombre de un usuario sin su conocimiento? Y que una mala configuración CORS puede exponer tu API a usos maliciosos desde dominios no autorizados. Spring Security maneja ambos escenarios elegantemente.

Protección contra CSRF:
- Habilitada por defecto en Spring Security
- Usa tokens sincronizados (synchronizer tokens)
- Excluye automáticamente métodos seguros (GET, HEAD, etc.)
- Integración con Thymeleaf y formularios automática

Configuración CORS:
- Controla qué dominios pueden acceder a tu API
- Define métodos HTTP permitidos
- Configura headers expuestos
- Maneja credenciales (cookies, auth)

En APIs REST stateless (con JWT), normalmente:
- Se deshabilita CSRF (pues JWT es inmune a CSRF)
- Se configura CORS cuidadosamente
- Se protegen endpoints sensibles con autenticación
''',
    'code_example': '''
// Configuración CSRF y CORS típica para API REST
@Configuration
@EnableWebSecurity
public class ApiSecurityConfig {
    
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .csrf(csrf -> csrf.disable()) // Deshabilitado para APIs con JWT
            .cors(cors -> cors.configurationSource(corsConfigurationSource()))
            // resto de configuración
        return http.build();
    }
    
    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration config = new CorsConfiguration();
        config.setAllowedOrigins(List.of("https://trusted.com"));
        config.setAllowedMethods(List.of("GET", "POST", "PUT", "DELETE"));
        config.setAllowedHeaders(List.of("*"));
        config.setAllowCredentials(true);
        
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", config);
        return source;
    }
}

// Ejemplo incorrecto: Configuración CORS demasiado permisiva
@Bean
public CorsConfigurationSource insecureCorsConfig() {
    CorsConfiguration config = new CorsConfiguration();
    config.setAllowedOrigins(List.of("*")); // ¡Permite cualquier origen!
    config.setAllowedMethods(List.of("*"));
    // ...
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 4,
    'title_level': 'Arquitectura Avanzada',
    'topic': 'Eventos y Mensajería',
    'subtopic': 'Spring Events',
    'definition': '''
Los eventos en Spring permiten implementar el patrón Observer de forma nativa dentro del contexto de la aplicación. Este mecanismo facilita la comunicación entre componentes de manera desacoplada, donde los publicadores no necesitan conocer a los suscriptores.

¿Te has encontrado con código donde un servicio llama directamente a múltiples otros servicios para notificar cambios? Los eventos Spring resuelven este acoplamiento mediante un modelo de publicación-suscripción gestionado por el ApplicationContext.

Características clave:
- El publicador usa ApplicationEventPublisher
- Los listeners implementan ApplicationListener o usan @EventListener
- Soporte para eventos síncronos y asíncronos (@Async)
- Ordenación de listeners con @Order
- Eventos personalizados extendiendo ApplicationEvent

Los casos de uso ideales incluyen:
- Notificaciones después de operaciones críticas
- Actualizaciones de caché
- Logging y auditoría
- Iniciar procesos secundarios
- Integración con otros sistemas

Spring gestiona automáticamente el ciclo de vida de los eventos y garantiza que los listeners reciban las instancias adecuadas, incluso en contextos complejos con herencia de aplicaciones.
''',
    'code_example': '''
// Definición de evento personalizado
public class OrderCreatedEvent extends ApplicationEvent {
    private final Order order;
    
    public OrderCreatedEvent(Object source, Order order) {
        super(source);
        this.order = order;
    }
    // getter
}

// Publicador de eventos
@Service
public class OrderService {
    private final ApplicationEventPublisher publisher;
    
    public OrderService(ApplicationEventPublisher publisher) {
        this.publisher = publisher;
    }
    
    public Order createOrder(OrderRequest request) {
        Order order = // lógica de creación
        publisher.publishEvent(new OrderCreatedEvent(this, order));
        return order;
    }
}

// Listener con anotación (recomendado)
@Component
public class OrderEventListener {
    @EventListener
    @Async  // Para procesamiento asíncrono
    public void handleOrderCreated(OrderCreatedEvent event) {
        // Lógica de manejo del evento
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 4,
    'title_level': 'Arquitectura Avanzada',
    'topic': 'Eventos y Mensajería',
    'subtopic': 'RabbitMQ',
    'definition': '''
RabbitMQ es un broker de mensajería que implementa el protocolo AMQP, permitiendo comunicación asíncrona y confiable entre servicios. Spring AMQP proporciona una excelente integración con RabbitMQ, simplificando su uso en aplicaciones Spring.

¿Por qué usar RabbitMQ cuando ya tienes Spring Events? Cuando necesitas:
- Comunicación entre servicios distribuidos
- Garantía de entrecia de mensajes
- Tolerancia a fallos
- Escalabilidad horizontal
- Balanceo de carga

Conceptos clave:
- Exchanges: Donde se publican los mensajes (direct, fanout, topic, headers)
- Queues: Donde se almacenan los mensajes
- Bindings: Relaciones entre exchanges y queues
- Routing keys: Criterio de enrutamiento

Spring AMQP abstrae estos conceptos con:
- RabbitTemplate: Para enviar mensajes
- @RabbitListener: Para consumir mensajes
- RabbitAdmin: Para configuración declarativa
- MessageConverter: Para serialización

Configuración típica incluye:
- Definición de exchanges/queues
- Configuración de reintentos
- Manejo de errores
- Confirmaciones de publicación
''',
    'code_example': '''
// Configuración básica
@Configuration
public class RabbitConfig {
    public static final String QUEUE = "order.queue";
    public static final String EXCHANGE = "order.exchange";
    public static final String ROUTING_KEY = "order.created";
    
    @Bean
    public Queue queue() {
        return new Queue(QUEUE, true); // durable
    }
    
    @Bean
    public TopicExchange exchange() {
        return new TopicExchange(EXCHANGE);
    }
    
    @Bean
    public Binding binding(Queue queue, TopicExchange exchange) {
        return BindingBuilder.bind(queue).to(exchange).with(ROUTING_KEY);
    }
}

// Envío de mensajes
@Service
public class OrderNotifier {
    private final RabbitTemplate rabbitTemplate;
    
    public void sendOrderCreated(Order order) {
        rabbitTemplate.convertAndSend(
            RabbitConfig.EXCHANGE, 
            RabbitConfig.ROUTING_KEY, 
            order
        );
    }
}

// Consumidor
@Component
public class OrderCreatedListener {
    @RabbitListener(queues = RabbitConfig.QUEUE)
    public void processOrder(Order order) {
        // Procesar orden
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 4,
    'title_level': 'Arquitectura Avanzada',
    'topic': 'Eventos y Mensajería',
    'subtopic': 'Kafka',
    'definition': '''
Apache Kafka es una plataforma distribuida de streaming que maneja grandes volúmenes de datos con baja latencia. Spring for Apache Kafka proporciona una integración sólida para aplicaciones Spring, ideal para arquitecturas basadas en eventos.

¿Cuándo elegir Kafka sobre RabbitMQ? Cuando necesites:
- Alto throughput (cientos de miles de mensajes/segundo)
- Retención de mensajes a largo plazo
- Procesamiento de streams en tiempo real
- Reprocesamiento de mensajes
- Escalabilidad extrema

Conceptos clave:
- Topics: Categorías/feeds de mensajes
- Partitions: Paralelismo y escalabilidad
- Brokers: Nodos del cluster Kafka
- Producers: Publicadores de mensajes
- Consumers: Suscriptores a topics

Spring Kafka ofrece:
- KafkaTemplate: Para enviar mensajes
- @KafkaListener: Para consumir mensajes
- ListenerContainerFactory: Para configuración
- JsonSerializer/Deserializer: Para objetos JSON

Patrones comunes:
- Event Sourcing
- CQRS
- Change Data Capture
- Log aggregation
''',
    'code_example': '''
// Configuración del producer
@Configuration
public class KafkaProducerConfig {
    @Bean
    public ProducerFactory<String, Order> producerFactory() {
        Map<String, Object> config = new HashMap<>();
        config.put(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, "localhost:9092");
        config.put(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG, StringSerializer.class);
        config.put(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, JsonSerializer.class);
        return new DefaultKafkaProducerFactory<>(config);
    }
    
    @Bean
    public KafkaTemplate<String, Order> kafkaTemplate() {
        return new KafkaTemplate<>(producerFactory());
    }
}

// Configuración del consumer
@Configuration
public class KafkaConsumerConfig {
    @Bean
    public ConsumerFactory<String, Order> consumerFactory() {
        Map<String, Object> config = new HashMap<>();
        config.put(ConsumerConfig.BOOTSTRAP_SERVERS_CONFIG, "localhost:9092");
        config.put(ConsumerConfig.GROUP_ID_CONFIG, "order-group");
        // más configuraciones
        return new DefaultKafkaConsumerFactory<>(
            config,
            new StringDeserializer(),
            new JsonDeserializer<>(Order.class)
        );
    }
}

// Envío de mensajes
@Service
public class OrderEventPublisher {
    private final KafkaTemplate<String, Order> kafkaTemplate;
    
    public void publishOrderCreated(String topic, Order order) {
        kafkaTemplate.send(topic, order.getId(), order);
    }
}

// Consumidor
@Component
public class OrderEventListener {
    @KafkaListener(topics = "orders", groupId = "order-group")
    public void handleOrder(Order order) {
        // Procesar orden
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 4,
    'title_level': 'Arquitectura Avanzada',
    'topic': 'Eventos y Mensajería',
    'subtopic': 'Patrón Event Sourcing',
    'definition': '''
Event Sourcing es un patrón arquitectónico que almacena el estado de una aplicación como una secuencia de eventos. En lugar de guardar el estado actual, se guardan todos los eventos que llevaron a ese estado, permitiendo reconstruir el estado en cualquier momento.

¿Por qué considerar Event Sourcing? Porque proporciona:
- Historial completo de cambios (auditoría natural)
- Capacidad de viaje en el tiempo (reconstruir estado pasado)
- Resolución de conflictos (basado en eventos)
- Flexibilidad para cambiar modelos de lectura

Componentes clave:
- Event Store: Base de datos de eventos (Kafka, EventStoreDB)
- Aggregates: Entidades que procesan comandos y producen eventos
- Projections: Vistas derivadas del stream de eventos
- Command Handlers: Procesan comandos y generan eventos

Spring facilita la implementación con:
- Spring Data EventSourcing
- Integración con Kafka para event store
- Proyecciones con Spring Projections
- Serialización con Jackson

Consideraciones importantes:
- Diseño cuidadoso de eventos (inmutables, semánticos)
- Estrategias para snapshots (optimización)
- Separación de modelos de comando y consulta (CQRS)
- Manejo de concurrencia (versionado)
''',
    'code_example': '''
// Definición de evento base
public abstract class DomainEvent {
    private final String aggregateId;
    private final Instant occurredOn;
    
    // constructor, getters
}

// Evento específico
public class OrderCreatedEvent extends DomainEvent {
    private final String customerId;
    private final BigDecimal amount;
    // constructor, getters
}

// Aggregate root
public class OrderAggregate {
    private String id;
    private String customerId;
    private BigDecimal amount;
    private OrderStatus status;
    private Long version;
    
    public List<DomainEvent> process(CreateOrderCommand command) {
        // Validaciones
        return List.of(
            new OrderCreatedEvent(
                command.getOrderId(),
                command.getCustomerId(),
                command.getAmount()
            )
        );
    }
    
    public void apply(OrderCreatedEvent event) {
        this.id = event.getAggregateId();
        this.customerId = event.getCustomerId();
        this.amount = event.getAmount();
        this.status = OrderStatus.CREATED;
    }
}

// Repositorio de eventos
public interface EventStore {
    void save(String aggregateId, List<DomainEvent> events);
    List<DomainEvent> getEvents(String aggregateId);
}

// Proyección
@Component
public class OrderProjection {
    @EventHandler
    public void on(OrderCreatedEvent event) {
        // Actualizar vista de lectura
    }
}
'''
  });
}

Future<void> insertSrLevel5Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 5,
    'title_level': 'DevOps para Java',
    'topic': 'CI/CD',
    'subtopic': 'GitHub Actions para Java',
    'definition': '''
GitHub Actions es una herramienta de automatización que te permite ejecutar tareas como compilar, testear y desplegar tu aplicación directamente desde tu repositorio. Todo sucede en el mismo flujo donde ya vivís: GitHub.

¿Te gustaría que con solo hacer un push se compile tu app y se corran los tests automáticamente?

Eso es exactamente lo que GitHub Actions te permite hacer. Usás un archivo YAML para definir los pasos del flujo (workflow), que se ejecuta ante eventos como push, pull request o publicación de una release. Podés compilar con Maven o Gradle, ejecutar tests JUnit, generar artefactos e incluso subirlos a Docker Hub o a un servidor. Es súper flexible, gratis para proyectos públicos y fácil de empezar.
  ''',
    'code_example': '''
// .github/workflows/build.yml

name: Java CI

on:
  push:
    branches: [ "main" ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Set up JDK 17
        uses: actions/setup-java@v3
        with:
          java-version: '17'
          distribution: 'temurin'
      - name: Build with Maven
        run: mvn clean install
  ''',
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 5,
    'title_level': 'DevOps para Java',
    'topic': 'CI/CD',
    'subtopic': 'Jenkins pipelines',
    'definition': '''
Jenkins es una de las herramientas más conocidas en el mundo DevOps. Con Jenkins podés automatizar desde la compilación y pruebas hasta despliegues en producción, todo con pipelines configurables.

¿No sería ideal que todo el ciclo de vida de tu app esté automatizado?

Jenkins permite crear "pipelines" definidos como código, donde cada etapa representa un paso del proceso: checkout del código, build, test, análisis, despliegue, etc. Podés usar la interfaz gráfica o definir el pipeline como código con Groovy. Aunque requiere algo más de setup inicial (instalación, configuración de plugins), es muy potente y ampliamente usado en la industria.
  ''',
    'code_example': '''
// Jenkinsfile básico para una app Java con Maven

pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps {
        git 'https://github.com/usuario/proyecto-java.git'
      }
    }

    stage('Build') {
      steps {
        sh 'mvn clean package'
      }
    }

    stage('Test') {
      steps {
        sh 'mvn test'
      }
    }
  }
}
  ''',
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 5,
    'title_level': 'DevOps para Java',
    'topic': 'CI/CD',
    'subtopic': 'SonarQube para análisis estático',
    'definition': '''
SonarQube es una herramienta que analiza tu código fuente en busca de errores, vulnerabilidades, código duplicado y otros posibles problemas que pueden afectar la calidad o mantenibilidad de tu aplicación.

¿Te pasó alguna vez ver código viejo y pensar “¿quién escribió esto?”... y fuiste vos mismo?

Con SonarQube podés evitar ese tipo de situaciones. Integrado en tu pipeline de CI, escanea automáticamente tu base de código y te da un informe visual con métricas, recomendaciones y niveles de severidad. Funciona con Java y muchos otros lenguajes, y se puede usar tanto en un servidor propio como desde la nube. También se integra con GitHub para mostrar advertencias directamente en los pull requests.
  ''',
    'code_example': '''
// En tu pipeline Jenkinsfile podés integrarlo así:

stage('SonarQube Analysis') {
  steps {
    withSonarQubeEnv('SonarQube') {
      sh 'mvn sonar:sonar'
    }
  }
}

// En pom.xml debes agregar el plugin de sonar
<plugin>
  <groupId>org.sonarsource.scanner.maven</groupId>
  <artifactId>sonar-maven-plugin</artifactId>
  <version>3.9.1.2184</version>
</plugin>
  ''',
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 5,
    'title_level': 'DevOps para Java',
    'topic': 'CI/CD',
    'subtopic': 'Dockerización de aplicaciones Java',
    'definition': '''
Docker permite empacar tu aplicación Java con todo lo que necesita para ejecutarse, en un contenedor que podés correr en cualquier lugar: tu máquina, un servidor, o la nube. Es una de las herramientas más potentes en DevOps moderno.

¿Te gustaría que tu app funcione igual en todas partes, sin "pero en mi máquina sí anda"?

Con Docker creás una imagen que incluye tu app, el JDK, las dependencias, configuración... todo. Luego podés correrla como contenedor en local o en producción. En Java es muy común crear una imagen desde un archivo `.jar` y exponer un puerto para que otros servicios (o el navegador) se puedan conectar.
  ''',
    'code_example': '''
// Dockerfile para una app Java con Spring Boot

FROM openjdk:17-jdk-slim
VOLUME /tmp
COPY target/miapp.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]

// Para construir y correr:
 docker build -t miapp .
 docker run -p 8080:8080 miapp
  ''',
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 5,
    'title_level': 'DevOps para Java',
    'topic': 'Cloud',
    'subtopic': 'Despliegue en AWS (Elastic Beanstalk, ECS)',
    'definition': '''
Amazon Web Services (AWS) ofrece muchas formas de desplegar aplicaciones Java, pero dos de las más populares son Elastic Beanstalk y ECS. Ambas eliminan gran parte del trabajo de infraestructura y permiten centrarse en el código.

¿Y cuál es la diferencia entre ambas?

Elastic Beanstalk es ideal si querés subir tu app (por ejemplo, un `.jar` o `.war`) y dejar que AWS se encargue de todo: balanceadores, instancias EC2, escalado, monitoreo, etc. Es una solución PaaS muy cómoda para empezar. Por otro lado, ECS (Elastic Container Service) está más orientado a contenedores: subís una imagen Docker y definís cómo querés que se ejecute. Es más flexible y potente, pero también más complejo.

Ambas opciones se integran bien con CI/CD, y son compatibles con apps Spring Boot, JPA, Hibernate y demás.
  ''',
    'code_example': '''
// Para Elastic Beanstalk:
 mvn package
// Luego subís el .jar desde la consola de AWS o con EB CLI:
 eb init
 eb create mi-app-java-env
 eb deploy

// Para ECS necesitás una imagen Docker y definir una tarea y servicio:
 docker build -t miapp .
 aws ecr create-repository --repository-name miapp
 docker tag miapp:latest <repo-uri>
 docker push <repo-uri>
  ''',
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 5,
    'title_level': 'DevOps para Java',
    'topic': 'Cloud',
    'subtopic': 'Azure App Service',
    'definition': '''
Azure App Service es la plataforma de Microsoft para desplegar aplicaciones web sin tener que gestionar servidores. Es compatible con Java y permite correr apps Spring Boot, Jakarta EE o incluso contenedores.

¿Querés hacer deploy sin preocuparte por servidores, firewalls ni escalado?

App Service te permite eso. Solo subís tu `.jar`, `.war` o imagen Docker, y Azure se encarga del resto. Podés configurar la app desde el portal, usar GitHub Actions para automatizar el despliegue, y escalar horizontalmente sin modificar tu código. Además, tiene integración directa con otras herramientas como Azure DevOps, Application Insights y Key Vault.
  ''',
    'code_example': '''
// Para subir desde GitHub Actions:
- name: 'Deploy to Azure Web App'
  uses: azure/webapps-deploy@v2
  with:
    app-name: 'miapp-java'
    publish-profile: {{ secrets.AZURE_PUBLISH_PROFILE }}
    package: 'target/miapp.jar'

// También podés usar Maven plugin:
 mvn azure-webapp:deploy
  ''',
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 5,
    'title_level': 'DevOps para Java',
    'topic': 'Cloud',
    'subtopic': 'Google App Engine',
    'definition': '''
Google App Engine (GAE) es la plataforma PaaS de Google Cloud que te permite desplegar aplicaciones Java sin preocuparte por servidores, escalado o balanceadores. Solo subís tu app y Google la hace correr.

¿Querés que tu app escale automáticamente según la demanda sin tocar nada?

GAE lo hace. Podés usarlo en modo "estándar", que corre tu app en un sandbox altamente optimizado (ideal para apps Spring Boot livianas), o en modo "flexible", que usa contenedores para mayor compatibilidad. Se integra bien con Maven, Gradle y otros sistemas de CI/CD. Además, incluye cosas como logs centralizados, métricas automáticas y versiones paralelas para despliegues seguros.
  ''',
    'code_example': '''
// Estructura típica de app.yaml
runtime: java17
instance_class: F1
entrypoint: java -jar target/miapp.jar

// Para desplegar:
 gcloud app deploy
  ''',
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 5,
    'title_level': 'DevOps para Java',
    'topic': 'Cloud',
    'subtopic': 'Serverless (AWS Lambda)',
    'definition': '''
AWS Lambda es una plataforma serverless: vos escribís una función, y AWS se encarga de ejecutarla cuando se necesita, sin que tengas que pensar en servidores. En Java, podés escribir funciones como clases que se ejecutan ante ciertos eventos (como una petición HTTP o una entrada en S3).

¿Y para qué querrías hacer esto en vez de correr un servidor completo?

Porque en muchos casos no necesitás una aplicación entera corriendo todo el día. Con Lambda, tu función se activa cuando alguien la necesita, se ejecuta, y después "desaparece", lo que ahorra costos y escala muy bien. El desafío está en optimizar el tiempo de arranque de la JVM y manejar bien la serialización de datos. Ideal para microservicios ultra livianos o tareas automatizadas.
  ''',
    'code_example': '''
public class MiFuncionHandler implements RequestHandler<Map<String, Object>, String> {
  @Override
  public String handleRequest(Map<String, Object> input, Context context) {
    return "Hola desde AWS Lambda en Java!";
  }
}

// Para empaquetar:
 mvn package

// Para desplegar:
 aws lambda create-function 
  --function-name miFuncionJava 
  --runtime java17 
  --handler com.miempresa.MiFuncionHandler 
  --memory-size 512 
  --timeout 10 
  --zip-file fileb://target/miapp.zip 
  --role arn:aws:iam::tu-cuenta:role/lambda-role
  ''',
  });
}

Future<void> insertSrLevel6Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Tópicos Avanzados',
    'topic': 'Java Reactive',
    'subtopic': '¿Qué es la programación reactiva?',
    'definition': '''
La programación reactiva es un enfoque para manejar flujos de datos asincrónicos y sistemas orientados a eventos. En lugar de escribir código que espera respuestas (bloqueante), se trabaja con flujos de datos que reaccionan a los cambios y eventos en tiempo real.

¿Te preguntas por qué esto es relevante?

En aplicaciones modernas, especialmente aquellas que manejan múltiples usuarios o grandes volúmenes de datos, la programación tradicional puede volverse ineficiente. La programación reactiva permite construir sistemas más eficientes y escalables al manejar operaciones de manera no bloqueante y asincrónica.

Los principios clave de la programación reactiva incluyen:

- **Responsividad**: el sistema responde de manera oportuna.
- **Resiliencia**: el sistema permanece receptivo incluso en caso de fallos.
- **Elasticidad**: el sistema se adapta a la carga variable.
- **Orientación a mensajes**: la comunicación se basa en el intercambio de mensajes asincrónicos.

Estos principios ayudan a construir sistemas robustos y escalables, ideales para aplicaciones modernas y distribuidas.
  ''',
    'code_example': '''
// Ejemplo básico de flujo reactivo con RxJava

Observable<String> flujo = Observable.just("Hola", "Mundo");

flujo.subscribe(
  item -> System.out.println("Recibido: " + item),
  error -> System.err.println("Error: " + error),
  () -> System.out.println("Secuencia completada")
);
  ''',
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Tópicos Avanzados',
    'topic': 'Java Reactive',
    'subtopic': 'RxJava',
    'definition': '''
RxJava es una biblioteca para componer programas asincrónicos y basados en eventos utilizando secuencias observables. Permite manejar flujos de datos de manera declarativa y funcional.

¿Te has enfrentado a la complejidad de manejar múltiples hilos y callbacks?

RxJava simplifica este proceso al proporcionar una API basada en observables que permite componer operaciones asincrónicas de manera más legible y mantenible. Ofrece operadores para transformar, combinar y filtrar flujos de datos, facilitando la construcción de aplicaciones reactivas.

RxJava es especialmente útil en aplicaciones Android y sistemas donde la gestión eficiente de recursos y la capacidad de respuesta son cruciales.
  ''',
    'code_example': '''
// Ejemplo de RxJava con operadores

Observable<Integer> numeros = Observable.range(1, 5);

numeros
  .map(n -> n * n)
  .filter(n -> n % 2 == 0)
  .subscribe(
    item -> System.out.println("Recibido: " + item),
    error -> System.err.println("Error: " + error),
    () -> System.out.println("Secuencia completada")
  );
  ''',
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Tópicos Avanzados',
    'topic': 'Java Reactive',
    'subtopic': 'Project Reactor',
    'definition': '''
Project Reactor es una biblioteca para programación reactiva en Java, desarrollada por el equipo de Spring. Proporciona dos tipos principales: `Mono` (para 0 o 1 elemento) y `Flux` (para 0 o N elementos), y está basada en la especificación Reactive Streams.

¿Te preguntas cómo manejar flujos de datos de manera eficiente y no bloqueante?

Project Reactor permite construir aplicaciones que manejan flujos de datos asincrónicos de manera eficiente, con soporte para backpressure y una API fluida y funcional. Es la base de Spring WebFlux y se integra perfectamente con el ecosistema de Spring.

Con Project Reactor, puedes crear pipelines de procesamiento de datos que reaccionan a eventos y cambios, facilitando la construcción de aplicaciones reactivas y escalables.
  ''',
    'code_example': '''
// Ejemplo básico con Project Reactor

Flux<String> flujo = Flux.just("A", "B", "C");

flujo
  .map(String::toLowerCase)
  .subscribe(
    item -> System.out.println("Recibido: " + item),
    error -> System.err.println("Error: " + error),
    () -> System.out.println("Secuencia completada")
  );
  ''',
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Tópicos Avanzados',
    'topic': 'Java Reactive',
    'subtopic': 'Spring WebFlux',
    'definition': '''
Spring WebFlux es el módulo reactivo de Spring para construir aplicaciones web no bloqueantes. Utiliza Project Reactor como motor subyacente y permite desarrollar APIs reactivas y escalables.

¿Te gustaría construir aplicaciones web que manejen miles de solicitudes concurrentes sin bloquear hilos?

Con Spring WebFlux, puedes crear controladores que devuelven `Mono` o `Flux`, lo que permite manejar solicitudes de manera asincrónica y eficiente. Es ideal para microservicios y aplicaciones que requieren alta concurrencia y baja latencia.

Spring WebFlux se integra con otras partes del ecosistema Spring, como Spring Security y Spring Data, proporcionando una solución completa para aplicaciones reactivas.
  ''',
    'code_example': '''
// Controlador reactivo con Spring WebFlux

@RestController
public class UsuarioControlador {

  @GetMapping("/usuarios")
  public Flux<Usuario> obtenerUsuarios() {
    return servicioUsuario.obtenerTodos();
  }
}
  ''',
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Tópicos Avanzados',
    'topic': 'Java Reactive',
    'subtopic': 'R2DBC (Reactive Relational Database Connectivity)',
    'definition': '''
R2DBC es una especificación para acceder a bases de datos relacionales de manera reactiva y no bloqueante. A diferencia de JDBC, que es bloqueante, R2DBC permite integrar bases de datos SQL en aplicaciones reactivas.

¿Te has encontrado con cuellos de botella al acceder a la base de datos en aplicaciones reactivas?

Con R2DBC, puedes realizar operaciones de base de datos de manera asincrónica, manteniendo la naturaleza no bloqueante de tu aplicación. Se integra con Spring Data R2DBC y es compatible con bases de datos como PostgreSQL y MySQL.

Esto permite construir aplicaciones completamente reactivas, desde la capa web hasta la base de datos.
  ''',
    'code_example': '''
// Repositorio reactivo con Spring Data R2DBC

public interface UsuarioRepositorio extends ReactiveCrudRepository<Usuario, Long> {
  Flux<Usuario> findByNombre(String nombre);
}
  ''',
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Tópicos Avanzados',
    'topic': 'Native Image',
    'subtopic': 'GraalVM',
    'definition': '''
GraalVM es una máquina virtual universal de alto rendimiento que extiende la JVM de Java. Su objetivo principal es hacer que las aplicaciones corran más rápido y consuman menos recursos, pero no solo para Java, ¡también puede ejecutar JavaScript, Python, Ruby, R, y más! Es como la navaja suiza de las máquinas virtuales, optimizando el rendimiento de tus programas a un nivel que otras VMs solo pueden soñar[cite: 19].

¿Te estás preguntando por qué esto importa? Pensemos por un momento en esos momentos en los que necesitas que una aplicación Java arranque al instante o que ocupe muy poca memoria. Tradicionalmente, Java, aunque robusto, tiene una "carga inicial" (startup time) y un consumo de memoria más altos en comparación con lenguajes como C++ o Go. Ahí es donde GraalVM entra en juego, ofreciendo una solución elegante a estos desafíos.

GraalVM mejora el rendimiento de varias maneras. Una de las más destacadas es la "compilación AOT" (Ahead-Of-Time), que permite compilar el código Java directamente a un ejecutable nativo antes de que la aplicación se ejecute. Esto significa que no necesitas una JVM para correr tu aplicación; ya es un archivo ejecutable por sí mismo, como cualquier programa de Windows o Linux. Esto reduce drásticamente el tiempo de inicio y el consumo de memoria, lo cual es ideal para microservicios, funciones serverless o aplicaciones de línea de comandos. Además, GraalVM también incluye un compilador JIT (Just-In-Time) de próxima generación que puede optimizar el código en tiempo de ejecución de una manera más avanzada que la JVM tradicional. Es como tener lo mejor de ambos mundos: la velocidad de la compilación nativa y la flexibilidad de la JVM[cite: 19].
''',
    'code_example': '''
// Ejemplo básico de cómo GraalVM puede compilar una aplicación Java a un ejecutable nativo
// Primero, asegúrate de tener GraalVM instalado y configurado.
// Compila tu aplicación Java normalmente:
// javac MiAplicacion.java

// Luego, usa el comando 'native-image' de GraalVM para crear el ejecutable nativo:
// native-image -jar MiAplicacion.jar

// Después de esto, tendrás un archivo ejecutable (por ejemplo, MiAplicacion.exe en Windows, o MiAplicacion en Linux)
// que puedes ejecutar directamente sin necesidad de una JVM instalada.

// MiAplicacion.java
public class MiAplicacion {
    public static void main(String[] args) {
        System.out.println("¡Hola desde un ejecutable nativo de GraalVM!");
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Tópicos Avanzados',
    'topic': 'Native Image',
    'subtopic': 'Compilación nativa con Spring Native',
    'definition': '''
La compilación nativa con Spring Native es una extensión del framework Spring que te permite tomar tus aplicaciones Spring Boot y compilarlas en ejecutables nativos usando GraalVM. ¡Es una combinación explosiva! Piensa en toda la potencia de Spring Boot, con su auto-configuración y su ecosistema robusto, ahora con el beneficio adicional de arranques ultrarrápidos y un consumo de memoria mínimo, características intrínsecas de los ejecutables nativos[cite: 19].

¿Pero entonces qué significa eso para tu día a día como desarrollador? Significa que puedes seguir desarrollando tus aplicaciones Spring Boot de la manera que ya conoces y amas, pero con un "superpoder" adicional para la producción. Las aplicaciones Spring tradicionalmente pueden tardar unos segundos en arrancar, lo cual no es un problema para servicios de larga duración, pero en entornos de microservicios o serverless, donde la agilidad es clave, cada segundo cuenta. Spring Native, al aprovechar GraalVM, reduce ese tiempo de arranque a milisegundos, lo que permite escalar más rápidamente y optimizar el uso de recursos[cite: 19].

Bajo el capó, Spring Native hace un trabajo inteligente para que la compilación nativa sea posible y eficiente para las aplicaciones Spring. Spring es conocido por su uso extensivo de reflexión, proxies y generación dinámica de clases, características que pueden ser un desafío para la compilación AOT. Spring Native se encarga de analizar tu aplicación durante la compilación para entender qué partes del código necesitan ser incluidas en el ejecutable nativo y para configurar GraalVM correctamente. Esto incluye optimizaciones para los beans de Spring, las configuraciones, y todas esas convenciones que hacen a Spring tan productivo. Es un proceso que automatiza gran parte de la complejidad de hacer que una aplicación Java, con todas las características de Spring, se comporte como un ejecutable nativo de alto rendimiento[cite: 19].
''',
    'code_example': '''
// Para usar Spring Native, típicamente agregarías la dependencia a tu proyecto Spring Boot
// y luego usarías el plugin de Maven o Gradle para compilar la imagen nativa.

// En un pom.xml (Maven):
/*
<dependency>
    <groupId>org.springframework.experimental</groupId>
    <artifactId>spring-native</artifactId>
    <version>0.11.x</version> // Asegúrate de usar la versión compatible con tu Spring Boot
</dependency>

<plugin>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-maven-plugin</artifactId>
    <configuration>
        <image>
            <builder>paketobuildpacks/builder-jammy-base:latest</builder>
        </option>
    </configuration>
</plugin>
*/

// Ejemplo de una clase simple de Spring Boot
// MiAplicacionSpring.java
package com.ejemplo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class MiAplicacionSpring {

    public static void main(String[] args) {
        SpringApplication.run(MiAplicacionSpring.class, args);
    }

    @GetMapping("/")
    public String home() {
        return "¡Hola desde Spring Boot compilado nativamente!";
    }
}

// Para compilar a imagen nativa, usarías:
// mvn spring-boot:build-image
// Esto generaría una imagen Docker con tu aplicación compilada nativamente.
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Tópicos Avanzados',
    'topic': 'Native Image',
    'subtopic': 'Ventajas y limitaciones',
    'definition': '''
Cuando hablamos de las "Native Images" en Java, estamos tocando un tema fascinante que trae consigo una serie de ventajas impresionantes, pero como casi todo en tecnología, también tiene sus bemoles. Vamos a desglosarlo para entender bien dónde brilla y dónde debemos ser un poco más cautelosos.

**Ventajas:**

* **Arranque Rapidísimo:** ¡Esta es la estrella del show! Las aplicaciones compiladas nativamente inician en milisegundos. ¿Por qué es esto genial? Imagina microservicios que escalan en segundos o funciones serverless que se ejecutan al instante. Esto es un cambio de juego para la computación en la nube, donde el tiempo de arranque puede afectar los costos y la reactividad[cite: 19].
* **Menor Consumo de Memoria:** Al no necesitar una JVM completa en tiempo de ejecución, las aplicaciones nativas usan significativamente menos memoria. Esto es crucial para reducir los costos de infraestructura en la nube y para entornos con recursos limitados[cite: 19].
* **Distribución Simplificada:** Empaquetas tu aplicación en un solo ejecutable binario. ¡Se acabó el "problema de la JVM"! No necesitas asegurarte de que el entorno de destino tenga la versión correcta de Java instalada; simplemente copias y ejecutas el archivo[cite: 19].
* **Seguridad Mejorada:** Al eliminar la necesidad de la JVM y algunas de sus dependencias dinámicas, la superficie de ataque potencial de tu aplicación puede reducirse.

**Limitaciones:**

* **Tiempo de Compilación Más Largo:** El proceso de compilar una imagen nativa puede ser considerablemente más lento que la compilación estándar de Java. Esto se debe a que GraalVM realiza un análisis exhaustivo de todo el código de la aplicación y sus dependencias para optimizarlo[cite: 19].
* **Menos Optimización en Tiempo de Ejecución (a veces):** Aunque GraalVM es potente, las JVM tradicionales, con su compilación JIT y su capacidad de adaptarse dinámicamente al comportamiento del programa en tiempo de ejecución, a veces pueden alcanzar picos de rendimiento más altos en aplicaciones de muy larga duración. Para algunas cargas de trabajo muy específicas, la JVM "calentada" podría superar a una imagen nativa[cite: 19].
* **Restricciones de Reflectividad y Recursos Dinámicos:** Java es muy dinámico. Las imágenes nativas requieren que todo lo que se usa en tiempo de ejecución (como la reflexión, la carga dinámica de clases, o el acceso a recursos externos) sea conocido en tiempo de compilación. Esto significa que a veces necesitas configuraciones especiales (hint files) para "enseñarle" a GraalVM sobre estas partes dinámicas de tu código o de las librerías que usas. ¡No es imposible, pero añade una capa de complejidad!
* **Soporte Limitado para Algunas Librerías:** Aunque el ecosistema está creciendo rápidamente, no todas las librerías de Java están 100% listas para la compilación nativa sin ajustes. Algunas pueden usar características muy dinámicas que GraalVM no puede optimizar completamente de forma automática.
''',
    'code_example': '''
// Ejemplo conceptual: las ventajas y limitaciones no se representan directamente con código,
// sino con el comportamiento y la configuración de la aplicación.

// Para ver las ventajas, imagina el arranque de una aplicación Spring Boot:
// Con JVM estándar:
// java -jar my-spring-app.jar
// (Tiempo de arranque: 2-5 segundos, o más)

// Con Native Image (después de compilarla con 'native-image' o Spring Boot build-image):
// ./my-spring-app-native
// (Tiempo de arranque: ~50-100 milisegundos)

// Ejemplo de una limitación (reflexión):
// Si tienes un código que usa reflexión sin los hints adecuados para GraalVM,
// podría fallar en tiempo de ejecución cuando se compila a nativo.

/*
// Clase para la que se usa reflexión
public class MiClaseDinamica {
    public String mensaje() {
        return "Hola desde MiClaseDinamica";
    }
}

// Código que usa reflexión
public class ReflexionEjemplo {
    public static void main(String[] args) throws Exception {
        Class<?> clazz = Class.forName("MiClaseDinamica");
        Object instance = clazz.getDeclaredConstructor().newInstance();
        java.lang.reflect.Method method = clazz.getMethod("mensaje");
        System.out.println(method.invoke(instance));
    }
}
*/
// Para que el ejemplo de reflexión funcione en una Native Image,
// necesitarías un archivo 'reflection-config.json' para GraalVM
// que le diga que 'MiClaseDinamica' y su método 'mensaje' deben ser
// accesibles vía reflexión. Esto no es código Java, sino configuración de GraalVM.
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Tópicos Avanzados',
    'topic': 'Java en la Nube',
    'subtopic': 'Características de Java para la nube',
    'definition': '''
Java ha sido un pilar en el desarrollo de software durante décadas, y su adaptación a la nube no es la excepción. Su filosofía de "escribir una vez, ejecutar en cualquier lugar" facilita la portabilidad de aplicaciones en entornos de nube variados.

¿Te preguntas por qué Java sigue siendo relevante en la era de la computación en la nube?

Además de su portabilidad, Java ofrece características integradas de seguridad, como la verificación de clases y la gestión de permisos, que son esenciales en entornos donde la protección de datos es crítica. Su gestión automática de memoria contribuye a la estabilidad y eficiencia de las aplicaciones desplegadas en la nube.

Estas características hacen de Java una opción sólida para desarrollar aplicaciones escalables, seguras y eficientes en plataformas de nube modernas.
  ''',
    'code_example': '''
// Ejemplo de una clase Java simple que puede ejecutarse en diferentes entornos de nube

public class AplicacionNube {
  public static void main(String[] args) {
    System.out.println("Aplicación Java en la nube ejecutándose correctamente.");
  }
}
  ''',
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Tópicos Avanzados',
    'topic': 'Java en la Nube',
    'subtopic': 'Contenedores y orquestación',
    'definition': '''
El uso de contenedores, como Docker, ha revolucionado la forma en que se despliegan las aplicaciones. Java se integra eficientemente en estos entornos, permitiendo encapsular aplicaciones y sus dependencias de manera consistente.

¿Te has enfrentado a problemas de "funciona en mi máquina" al desplegar aplicaciones?

Con contenedores, puedes crear imágenes que aseguran que tu aplicación Java se ejecute de la misma manera en cualquier entorno. Además, herramientas de orquestación como Kubernetes facilitan la gestión, escalado y monitoreo de estas aplicaciones en producción.

Esta combinación permite una implementación más ágil, escalable y confiable de aplicaciones Java en la nube.
  ''',
    'code_example': '''
// Dockerfile básico para una aplicación Java

FROM openjdk:17-jdk-slim
COPY target/miapp.jar miapp.jar
ENTRYPOINT ["java", "-jar", "miapp.jar"]
  ''',
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Tópicos Avanzados',
    'topic': 'Java en la Nube',
    'subtopic': 'Microservicios y arquitecturas desacopladas',
    'definition': '''
La arquitectura de microservicios implica dividir una aplicación en componentes pequeños e independientes que se comunican entre sí. Java, con frameworks como Spring Boot y Micronaut, facilita la creación de estos servicios.

¿Te preguntas cómo manejar aplicaciones complejas de manera más eficiente?

Al adoptar microservicios, puedes desarrollar, desplegar y escalar cada componente de forma independiente, lo que mejora la agilidad y la resiliencia de la aplicación. Esta arquitectura es especialmente beneficiosa en entornos de nube, donde la escalabilidad y la disponibilidad son esenciales.

Java proporciona las herramientas necesarias para implementar microservicios robustos y eficientes que se integran perfectamente en ecosistemas de nube modernos.
  ''',
    'code_example': '''
// Ejemplo de un microservicio simple con Spring Boot

@RestController
public class SaludoControlador {

  @GetMapping("/saludo")
  public String saludar() {
    return "¡Hola desde el microservicio!";
  }
}
  ''',
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Tópicos Avanzados',
    'topic': 'Java en la Nube',
    'subtopic': 'Integración con servicios en la nube',
    'definition': '''
Los principales proveedores de servicios en la nube, como AWS, Azure y Google Cloud, ofrecen SDKs y herramientas que facilitan la integración de aplicaciones Java con sus servicios.

¿Te gustaría aprovechar servicios como almacenamiento, bases de datos o funciones sin servidor en tus aplicaciones Java?

Con las integraciones disponibles, puedes conectar tu aplicación Java a servicios como Amazon S3, Azure Blob Storage o Google Cloud Functions de manera sencilla. Esto permite ampliar las capacidades de tu aplicación sin tener que gestionar la infraestructura subyacente.

Estas integraciones agilizan el desarrollo y despliegue de aplicaciones Java modernas y escalables en la nube.
  ''',
    'code_example': '''
// Ejemplo de uso del SDK de AWS para subir un archivo a S3

AmazonS3 s3 = AmazonS3ClientBuilder.standard().build();
s3.putObject("mi-bucket", "archivo.txt", new File("archivo.txt"));
  ''',
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Tópicos Avanzados',
    'topic': 'Java en la Nube',
    'subtopic': 'Desafíos y consideraciones',
    'definition': '''
Aunque Java ofrece muchas ventajas en entornos de nube, también presenta desafíos que deben considerarse para asegurar un rendimiento óptimo.

¿Te has enfrentado a problemas de latencia o consumo de recursos en tus aplicaciones Java en la nube?

Algunos desafíos comunes incluyen la gestión eficiente de la memoria, tiempos de inicio de la aplicación y la necesidad de ajustar la configuración de la JVM para entornos de nube específicos. Además, la migración de aplicaciones legadas a la nube puede requerir refactorización y adaptación a nuevas arquitecturas.

Abordar estos desafíos con buenas prácticas y herramientas adecuadas es esencial para aprovechar al máximo las capacidades de Java en la nube.
  ''',
    'code_example': '''
// Configuración de parámetros de la JVM para optimizar el rendimiento en la nube

java -Xms512m -Xmx1024m -XX:+UseG1GC -jar miapp.jar
  ''',
  });
}
