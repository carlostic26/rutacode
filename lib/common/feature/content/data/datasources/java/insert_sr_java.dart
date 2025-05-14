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
