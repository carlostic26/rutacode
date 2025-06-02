import 'package:sqflite_common/sqlite_api.dart';

Future<void> insertSrLevel1DataCpp(Database db) async {
  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 1,
    'tittle_level': 'Diseño y Arquitectura de Software',
    'topic': 'Patrones de Diseño Avanzados',
    'subtopic': 'Singleton',
    'definition': '''
El patrón Singleton es uno de los patrones de diseño más conocidos, y su objetivo es garantizar que una clase tenga solo una instancia durante toda la vida útil de la aplicación, proporcionando un punto de acceso global a ella.

Pensemos por un momento en situaciones donde tener múltiples instancias de una clase podría causar problemas, como en la gestión de configuraciones o conexiones a bases de datos. Aquí es donde Singleton brilla. 

El patrón funciona restringiendo la creación de nuevas instancias de la clase y proporcionando un método estático para acceder a la única instancia existente. Esto se logra haciendo el constructor privado y almacenando la instancia en una variable estática. Aunque es útil, hay que usarlo con cuidado, ya que puede introducir acoplamiento global en el código si se abusa de él. Empresas como Google lo utilizan en sistemas donde la consistencia de un único punto de acceso es crítica, como en servicios de logging.
''',
    'code_example': r'''
// Ejemplo correcto de Singleton en C++
class Singleton {
private:
    static Singleton* instance; // Puntero a la única instancia
    Singleton() {} // Constructor privado

public:
    // Método estático para acceder a la instancia
    static Singleton* getInstance() {
        if (instance == nullptr) {
            instance = new Singleton();
        }
        return instance;
    }

    // Ejemplo de método de la clase
    void doSomething() {
        std::cout << "Haciendo algo..." << std::endl;
    }
};

// Inicialización del puntero estático
Singleton* Singleton::instance = nullptr;

// Uso:
Singleton* s = Singleton::getInstance();
s->doSomething();

// Ejemplo incorrecto: No usar Singleton cuando no es necesario
class ConfigManager {
public:
    ConfigManager() {} // Constructor público permite múltiples instancias
    void loadConfig() { /* ... */ }
};

// Esto puede llevar a inconsistencias si se crean múltiples instancias.
''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 1,
    'tittle_level': 'Diseño y Arquitectura de Software',
    'topic': 'Patrones de Diseño Avanzados',
    'subtopic': 'Factory',
    'definition': '''
El patrón Factory es un patrón de diseño creacional que se utiliza para delegar la creación de objetos a una clase especializada, en lugar de instanciarlos directamente. Esto promueve un código más flexible y desacoplado.

¿Te estás preguntando por qué esto importa? Bueno, imagina que estás desarrollando un juego y necesitas crear diferentes tipos de enemigos. En lugar de tener código condicional por todas partes para instanciar cada tipo, el patrón Factory centraliza esta lógica en un solo lugar.

La idea es simple: una clase Factory tiene un método que, según los parámetros recibidos, decide qué tipo de objeto crear y lo devuelve. Esto facilita la extensión del código, ya que agregar un nuevo tipo de objeto solo requiere modificar la Factory, no todo el código que lo usa. Empresas como Unity Technologies utilizan este patrón en sus motores de juego para gestionar la creación de objetos de manera eficiente.
''',
    'code_example': r'''
// Ejemplo correcto de Factory en C++
class Enemy {
public:
    virtual void attack() = 0;
};

class Goblin : public Enemy {
public:
    void attack() override {
        std::cout << "Goblin attacks with a club!" << std::endl;
    }
};

class Dragon : public Enemy {
public:
    void attack() override {
        std::cout << "Dragon breathes fire!" << std::endl;
    }
};

class EnemyFactory {
public:
    static Enemy* createEnemy(const std::string& type) {
        if (type == "goblin") {
            return new Goblin();
        } else if (type == "dragon") {
            return new Dragon();
        }
        return nullptr;
    }
};

// Uso:
Enemy* enemy = EnemyFactory::createEnemy("dragon");
if (enemy) {
    enemy->attack();
    delete enemy;
}

// Ejemplo incorrecto: Crear objetos directamente sin Factory
Enemy* badEnemy = new Dragon(); // Acopla el código a una clase concreta.
''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 1,
    'tittle_level': 'Diseño y Arquitectura de Software',
    'topic': 'Patrones de Diseño Avanzados',
    'subtopic': 'Abstract Factory',
    'definition': '''
El patrón Abstract Factory lleva el concepto de Factory un paso más allá, proporcionando una interfaz para crear familias de objetos relacionados sin especificar sus clases concretas. Es especialmente útil cuando el sistema necesita ser independiente de cómo se crean, componen o representan sus objetos.

Vamos a ver de qué se trata todo esto. Supongamos que estás desarrollando una aplicación multiplataforma que necesita crear controles de UI específicos para cada sistema operativo. En lugar de tener condicionales por todas partes, Abstract Factory te permite tener una fábrica para Windows, otra para macOS, etc., cada una produciendo los controles adecuados.

Este patrón es ampliamente utilizado en frameworks gráficos y aplicaciones empresariales. Por ejemplo, Qt utiliza un enfoque similar para manejar estilos y temas en diferentes plataformas.
''',
    'code_example': r'''
// Ejemplo correcto de Abstract Factory en C++
class Button {
public:
    virtual void render() = 0;
};

class WindowsButton : public Button {
public:
    void render() override {
        std::cout << "Rendering a Windows-style button" << std::endl;
    }
};

class MacButton : public Button {
public:
    void render() override {
        std::cout << "Rendering a Mac-style button" << std::endl;
    }
};

class GUIFactory {
public:
    virtual Button* createButton() = 0;
};

class WindowsFactory : public GUIFactory {
public:
    Button* createButton() override {
        return new WindowsButton();
    }
};

class MacFactory : public GUIFactory {
public:
    Button* createButton() override {
        return new MacButton();
    }
};

// Uso:
GUIFactory* factory = new MacFactory(); // Cambiar a WindowsFactory para Windows
Button* button = factory->createButton();
button->render();

delete button;
delete factory;

// Ejemplo incorrecto: No usar Abstract Factory cuando se necesita consistencia
Button* winButton = new WindowsButton();
Button* macButton = new MacButton(); // Mezcla estilos, mala práctica.
''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 1,
    'tittle_level': 'Diseño y Arquitectura de Software',
    'topic': 'Patrones de Diseño Avanzados',
    'subtopic': 'Observer',
    'definition': '''
El patrón Observer establece una relación de uno-a-muchos entre objetos, donde cuando un objeto cambia su estado, todos sus dependientes son notificados automáticamente. Es como el sistema de suscripciones que usamos a diario, pero aplicado a objetos.

No sé tú, pero a mí esto al principio me costó visualizar 🤯. Hasta que pensé en cómo funcionan las notificaciones en una app: cuando ocurre un evento importante (como un nuevo mensaje), todos los componentes interesados reciben la actualización sin necesidad de estar consultando constantemente.

Este patrón es fundamental en arquitecturas basadas en eventos. Sistemas como los de cotizaciones bursátiles o los modelos MVC lo utilizan extensivamente. La clave está en que el sujeto (observable) mantiene una lista de observadores y les notifica los cambios, manteniendo un acoplamiento mínimo entre ellos.
''',
    'code_example': r'''
// Ejemplo correcto de Observer en C++
#include <iostream>
#include <vector>
#include <algorithm>

class Observer {
public:
    virtual void update(const std::string& message) = 0;
};

class Subject {
    std::vector<Observer*> observers;
public:
    void attach(Observer* observer) {
        observers.push_back(observer);
    }
    
    void detach(Observer* observer) {
        observers.erase(std::remove(observers.begin(), observers.end(), observer), observers.end());
    }
    
    void notify(const std::string& message) {
        for (Observer* observer : observers) {
            observer->update(message);
        }
    }
};

class ConcreteObserver : public Observer {
    std::string name;
public:
    ConcreteObserver(const std::string& name) : name(name) {}
    
    void update(const std::string& message) override {
        std::cout << name << " recibió: " << message << std::endl;
    }
};

// Uso:
Subject newsAgency;
ConcreteObserver observer1("Suscriptor1");
ConcreteObserver observer2("Suscriptor2");

newsAgency.attach(&observer1);
newsAgency.attach(&observer2);
newsAgency.notify("Nueva actualización disponible");

// Ejemplo incorrecto: Acoplamiento directo sin patrón Observer
class BadSubject {
public:
    void update() {
        // Lógica que actualiza directamente a los dependientes
        // Esto crea un alto acoplamiento
    }
};
''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 1,
    'tittle_level': 'Diseño y Arquitectura de Software',
    'topic': 'Patrones de Diseño Avanzados',
    'subtopic': 'Strategy',
    'definition': '''
El patrón Strategy define una familia de algoritmos, encapsula cada uno y los hace intercambiables. Permite que el algoritmo varíe independientemente de los clientes que lo utilizan. Es como tener un conjunto de herramientas donde puedes cambiar la llave según la tuerca que necesites ajustar.

Seguramente pensarás de qué va todo esto... Pues imagina que estás desarrollando un sistema de navegación que puede calcular rutas de diferentes maneras: la más rápida, la más corta, la más económica. Con Strategy, puedes cambiar el algoritmo de cálculo en tiempo de ejecución sin modificar el código que lo usa.

Este patrón es ampliamente usado en frameworks de pago (donde se pueden intercambiar proveedores como PayPal o Stripe) y en motores de juegos (para cambiar IA de personajes). La belleza está en que los algoritmos pueden variar independientemente de los clientes que los usan.
''',
    'code_example': r'''
// Ejemplo correcto de Strategy en C++
#include <iostream>

class SortingStrategy {
public:
    virtual void sort(std::vector<int>& data) = 0;
};

class QuickSort : public SortingStrategy {
public:
    void sort(std::vector<int>& data) override {
        std::cout << "Ordenando con QuickSort" << std::endl;
        // Implementación real de QuickSort iría aquí
    }
};

class MergeSort : public SortingStrategy {
public:
    void sort(std::vector<int>& data) override {
        std::cout << "Ordenando con MergeSort" << std::endl;
        // Implementación real de MergeSort iría aquí
    }
};

class Sorter {
    SortingStrategy* strategy;
public:
    Sorter(SortingStrategy* strategy) : strategy(strategy) {}
    
    void setStrategy(SortingStrategy* newStrategy) {
        strategy = newStrategy;
    }
    
    void sortDataCpp(std::vector<int>& data) {
        strategy->sort(data);
    }
};

// Uso:
std::vector<int> data = {5, 2, 7, 1, 3};
QuickSort quickSort;
MergeSort mergeSort;

Sorter sorter(&quickSort);
sorter.sortDataCpp(data); // Usa QuickSort

sorter.setStrategy(&mergeSort);
sorter.sortDataCpp(data); // Cambia a MergeSort

// Ejemplo incorrecto: Usar condicionales en lugar de Strategy
class BadSorter {
public:
    void sort(std::vector<int>& data, const std::string& type) {
        if (type == "quick") {
            // QuickSort
        } else if (type == "merge") {
            // MergeSort
        }
        // Difícil de mantener y extender
    }
};
''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 1,
    'tittle_level': 'Diseño y Arquitectura de Software',
    'topic': 'Patrones de Diseño Avanzados',
    'subtopic': 'Command',
    'definition': '''
El patrón Command encapsula una solicitud como un objeto, permitiendo parametrizar clientes con diferentes solicitudes, hacer cola o registrar solicitudes, y soportar operaciones reversibles. En esencia, convierte acciones en objetos que pueden ser manipulados y almacenados.

¿Te estás preguntando por qué esto importa? Considera un editor de texto con funciones de deshacer/rehacer. Command permite encapsular cada acción (como escribir o borrar texto) en un objeto que puede almacenarse y ejecutarse cuando sea necesario, incluso meses después.

Este patrón es fundamental en interfaces gráficas (para manejar eventos de UI), sistemas de transacciones y operaciones por lotes. La implementación típica incluye una interfaz Command con un método execute(), y comandos concretos que implementan operaciones específicas. Muchos IDEs modernos usan este patrón para su funcionalidad de macros y scripting.
''',
    'code_example': r'''
// Ejemplo correcto de Command en C++
#include <iostream>
#include <vector>

class Command {
public:
    virtual void execute() = 0;
    virtual void undo() = 0;
};

class Light {
public:
    void on() { std::cout << "Luz encendida" << std::endl; }
    void off() { std::cout << "Luz apagada" << std::endl; }
};

class LightOnCommand : public Command {
    Light& light;
public:
    LightOnCommand(Light& light) : light(light) {}
    
    void execute() override { light.on(); }
    void undo() override { light.off(); }
};

class LightOffCommand : public Command {
    Light& light;
public:
    LightOffCommand(Light& light) : light(light) {}
    
    void execute() override { light.off(); }
    void undo() override { light.on(); }
};

class RemoteControl {
    std::vector<Command*> history;
public:
    void executeCommand(Command* cmd) {
        cmd->execute();
        history.push_back(cmd);
    }
    
    void undoLastCommand() {
        if (!history.empty()) {
            Command* lastCmd = history.back();
            lastCmd->undo();
            history.pop_back();
        }
    }
};

// Uso:
Light livingRoomLight;
LightOnCommand lightOn(livingRoomLight);
LightOffCommand lightOff(livingRoomLight);

RemoteControl remote;
remote.executeCommand(&lightOn);  // Enciende la luz
remote.executeCommand(&lightOff); // Apaga la luz
remote.undoLastCommand();         // Deshace: enciende la luz

// Ejemplo incorrecto: Implementación directa sin patrón Command
class BadRemote {
    Light& light;
public:
    BadRemote(Light& light) : light(light) {}
    
    void pressOnButton() { light.on(); } // No soporta deshacer/registro
};
''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 1,
    'tittle_level': 'Diseño y Arquitectura de Software',
    'topic': 'Patrones de Diseño Avanzados',
    'subtopic': 'Adapter',
    'definition': '''
El patrón Adapter actúa como puente entre dos interfaces incompatibles, permitiendo que trabajen juntas sin modificar su código fuente. Es el equivalente en programación a un adaptador de corriente que te permite conectar dispositivos con enchufes diferentes.

Pensemos por un momento en sistemas legacy que necesitan integrarse con componentes modernos. El Adapter viene al rescate, envolviendo la interfaz antigua y exponiendo una nueva que el cliente puede entender. No cambia el comportamiento del objeto adaptado, solo su interfaz.

Este patrón es especialmente útil cuando:
- Necesitas usar una clase existente pero su interfaz no es compatible
- Quieres reutilizar código legacy en nuevos sistemas
- Trabajas con bibliotecas de terceros que necesitan integrarse

Empresas como PayPal lo utilizan para adaptar sus APIs antiguas a nuevos estándares sin romper la compatibilidad con sistemas existentes.
''',
    'code_example': r'''
// Ejemplo correcto de Adapter en C++
// Interfaz antigua (incompatible)
class LegacyPrinter {
public:
    void printDocument(const std::string& text) {
        std::cout << "Legacy Printing: " << text << std::endl;
    }
};

// Nueva interfaz deseada
class ModernPrinter {
public:
    virtual void print(const std::string& content) = 0;
};

// Adapter que hace compatible LegacyPrinter con ModernPrinter
class PrinterAdapter : public ModernPrinter {
    LegacyPrinter legacyPrinter;
public:
    void print(const std::string& content) override {
        // Adaptamos la llamada
        legacyPrinter.printDocument(content);
    }
};

// Uso:
ModernPrinter* printer = new PrinterAdapter();
printer->print("Hello Adapter Pattern");

// Ejemplo incorrecto: Modificar directamente la clase legacy
class BadLegacyPrinter : public LegacyPrinter {
public:
    void print(const std::string& content) {
        printDocument(content); // Viola el principio abierto/cerrado
    }
};
''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 1,
    'tittle_level': 'Diseño y Arquitectura de Software',
    'topic': 'Patrones de Diseño Avanzados',
    'subtopic': 'Decorator',
    'definition': '''
El patrón Decorator permite añadir funcionalidad a objetos de forma dinámica sin usar herencia. Es como añadir capas a una cebolla - cada decorador agrega nueva funcionalidad manteniendo la interfaz original.

¿Te estás preguntando por qué esto es mejor que la herencia múltiple? La respuesta está en la flexibilidad. Mientras la herencia establece relaciones estáticas en tiempo de compilación, Decorator permite composiciones dinámicas en tiempo de ejecución.

Este patrón es ideal cuando:
- Necesitas extender funcionalidad de forma modular
- Quieres evitar una explosión de subclases
- La funcionalidad adicional puede combinarse de diferentes formas

Sistemas como los de Starbucks lo usan para modelar sus combinaciones de café, donde cada ingrediente adicional (leche, chocolate, etc.) es un decorador que modifica el precio y descripción.
''',
    'code_example': r'''
// Ejemplo correcto de Decorator en C++
class Coffee {
public:
    virtual std::string getDescription() = 0;
    virtual double cost() = 0;
};

class SimpleCoffee : public Coffee {
public:
    std::string getDescription() override {
        return "Café simple";
    }
    
    double cost() override {
        return 1.0;
    }
};

class CoffeeDecorator : public Coffee {
protected:
    Coffee* decoratedCoffee;
public:
    CoffeeDecorator(Coffee* coffee) : decoratedCoffee(coffee) {}
    
    std::string getDescription() override {
        return decoratedCoffee->getDescription();
    }
    
    double cost() override {
        return decoratedCoffee->cost();
    }
};

class MilkDecorator : public CoffeeDecorator {
public:
    MilkDecorator(Coffee* coffee) : CoffeeDecorator(coffee) {}
    
    std::string getDescription() override {
        return decoratedCoffee->getDescription() + ", con leche";
    }
    
    double cost() override {
        return decoratedCoffee->cost() + 0.5;
    }
};

// Uso:
Coffee* myCoffee = new SimpleCoffee();
myCoffee = new MilkDecorator(myCoffee); // Decora con leche

std::cout << myCoffee->getDescription() << ": $" << myCoffee->cost();

// Ejemplo incorrecto: Usar herencia para cada combinación
class MilkCoffee : public SimpleCoffee {
    // Esto llevaría a una explosión de clases
    // (SugarCoffee, MilkSugarCoffee, etc.)
};
''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 1,
    'tittle_level': 'Diseño y Arquitectura de Software',
    'topic': 'Patrones de Diseño Avanzados',
    'subtopic': 'Composite',
    'definition': '''
El patrón Composite permite tratar objetos individuales y composiciones de objetos de manera uniforme. Crea estructuras en forma de árbol donde cada nodo puede ser un objeto simple o una colección compleja.

Vamos a ver de qué se trata todo esto. Imagina un sistema de archivos: tanto los archivos individuales como las carpetas (que contienen otros archivos) pueden ser tratados de la misma manera para operaciones como calcular tamaño o listar contenido. Ese es el poder del Composite.

Este patrón es particularmente útil cuando:
- Quieres representar jerarquías parte-todo
- Necesitas tratar componentes individuales y compuestos de la misma forma
- Deseas operaciones que se apliquen recursivamente a toda la estructura

Frameworks como Qt lo utilizan para su sistema de widgets, donde contenedores pueden tener tanto widgets simples como otros contenedores anidados.
''',
    'code_example': r'''
// Ejemplo correcto de Composite en C++
#include <vector>

class FileSystemComponent {
public:
    virtual void display(int indent = 0) = 0;
    virtual void add(FileSystemComponent* component) {
        throw std::runtime_error("Operación no soportada");
    }
};

class File : public FileSystemComponent {
    std::string name;
public:
    File(const std::string& name) : name(name) {}
    
    void display(int indent) override {
        std::cout << std::string(indent, ' ') << "- " << name << std::endl;
    }
};

class Directory : public FileSystemComponent {
    std::string name;
    std::vector<FileSystemComponent*> children;
public:
    Directory(const std::string& name) : name(name) {}
    
    void add(FileSystemComponent* component) override {
        children.push_back(component);
    }
    
    void display(int indent = 0) override {
        std::cout << std::string(indent, ' ') << "+ " << name << std::endl;
        for (auto child : children) {
            child->display(indent + 2);
        }
    }
};

// Uso:
Directory* root = new Directory("Raíz");
Directory* docs = new Directory("Documentos");
File* file1 = new File("archivo1.txt");
File* file2 = new File("archivo2.txt");

root->add(docs);
docs->add(file1);
root->add(file2);

root->display(); // Muestra toda la estructura jerárquica

// Ejemplo incorrecto: Tratar compuestos e individuales de forma diferente
class BadFileSystem {
    // Requiere lógica diferente para archivos y directorios
    // Rompe el principio de sustitución de Liskov
};
''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 1,
    'tittle_level': 'Diseño y Arquitectura de Software',
    'topic': 'Principios SOLID y Buenas Prácticas',
    'subtopic': 'Responsabilidad Única',
    'definition': '''
Este principio dice que una clase debería tener una única razón para cambiar. En otras palabras, cada clase debería encargarse de una sola cosa.

¿Te estás preguntando por qué esto importa tanto? 

Cuando una clase tiene más de una responsabilidad, se vuelve difícil de mantener y fácil de romper. Cambiar una parte puede afectar sin querer a otra. Al dividir responsabilidades, el código se vuelve más claro, más reutilizable y mucho más fácil de testear.

Por ejemplo, si tienes una clase `Reporte` que genera reportes *y* también los guarda en disco, estás mezclando responsabilidades. Lo mejor sería separar esa lógica: una clase que se encargue del contenido del reporte, y otra que maneje la persistencia. Este principio es uno de los pilares del diseño limpio y es muy usado en empresas como Google, que promueven la mantenibilidad del código a gran escala.
''',
    'code_example': r'''
// ✅ Ejemplo correcto
class ReporteContenido {
  std::string generar();
};

class ReporteGuardado {
  void guardarEnDisco(const std::string& contenido);
};

// ❌ Ejemplo incorrecto
class Reporte {
  std::string generar();
  void guardarEnDisco(); // responsabilidad adicional
};

// El primer enfoque separa bien las responsabilidades
''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 1,
    'tittle_level': 'Diseño y Arquitectura de Software',
    'topic': 'Principios SOLID y Buenas Prácticas',
    'subtopic': 'Abierto/Cerrado',
    'definition': '''
El principio de Abierto/Cerrado sugiere que una clase debe estar abierta a la extensión, pero cerrada a la modificación.

Seguramente pensarás: ¿cómo diablos se logra eso?

La idea es que puedas agregar nuevas funcionalidades sin tener que tocar el código ya escrito. Esto se logra usando herencia o composición. Si cada vez que agregas una nueva funcionalidad debes cambiar clases existentes, estás corriendo el riesgo de romper cosas que ya funcionaban.

Un clásico ejemplo son los sistemas de pagos. En lugar de modificar una clase `ProcesadorDePago` para cada nuevo método de pago, puedes hacer que herede de una interfaz y agregar nuevos procesadores sin tocar el original. Así tu sistema escala sin caos.
''',
    'code_example': r'''
// ✅ Correcto: clase abierta a extensión, cerrada a modificación
class Pago {
 public:
  virtual void procesar() = 0;
};

class PagoConTarjeta : public Pago {
 public:
  void procesar() override {
    // lógica de tarjeta
  }
};

class PagoConPaypal : public Pago {
 public:
  void procesar() override {
    // lógica de PayPal
  }
};

// ❌ Incorrecto: cada nuevo pago requiere modificar esta clase
class ProcesadorDePago {
 public:
  void procesarPago(std::string tipo) {
    if (tipo == "tarjeta") { /*...*/ }
    else if (tipo == "paypal") { /*...*/ }
    // y así sucesivamente...
  }
};
''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 1,
    'tittle_level': 'Diseño y Arquitectura de Software',
    'topic': 'Principios SOLID y Buenas Prácticas',
    'subtopic': 'Sustitución de Liskov',
    'definition': '''
Este principio dice que los objetos de una subclase deben poder usarse como si fueran de la clase base sin que el programa se rompa.

¿Te suena complicado? Tranquilo, es más simple de lo que parece.

La clave es que las subclases no deben romper las expectativas que tienes de la clase base. Si tienes una clase `Ave` con un método `volar()`, y creas una subclase `Pingüino`, pero el pingüino no vuela... ahí estás violando Liskov. El código que espera un `Ave` probablemente intentará llamarle `volar()` al pingüino y boom: error conceptual.

Aplicar este principio evita bugs sutiles, mejora la claridad y hace que tus clases sean verdaderamente intercambiables.
''',
    'code_example': r'''
class Ave {
 public:
  virtual void volar() = 0;
};

class Gorrion : public Ave {
 public:
  void volar() override {
    // vuela normal
  }
};

// ❌ Esta subclase viola Liskov
class Pinguino : public Ave {
 public:
  void volar() override {
    throw std::logic_error("Los pingüinos no vuelan");
  }
};

// ✅ Mejor solución: nueva jerarquía
class Animal {};
class AveVoladora : public Animal {
 public:
  virtual void volar() = 0;
};
class AveNoVoladora : public Animal {};
''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 1,
    'tittle_level': 'Diseño y Arquitectura de Software',
    'topic': 'Principios SOLID y Buenas Prácticas',
    'subtopic': 'Segregación de Interfaces',
    'definition': '''
Este principio indica que no deberíamos forzar a las clases a depender de métodos que no usan.

Vamos a ver de qué se trata todo esto...

Imagina que tienes una interfaz `IMultifuncion` con métodos para imprimir, escanear y enviar fax. Ahora tienes una clase `ImpresoraBasica` que solo imprime. Si la obligas a implementar los métodos de fax y escaneo, estás sobrecargando responsabilidades innecesarias.

La segregación de interfaces dice: divide y vencerás. Mejor crea interfaces más pequeñas, específicas para cada responsabilidad. Esto hace que las clases sean más ligeras, comprensibles y mucho más flexibles.
''',
    'code_example': r'''
// ❌ Interfaz demasiado grande
class IMultifuncion {
 public:
  virtual void imprimir() = 0;
  virtual void escanear() = 0;
  virtual void enviarFax() = 0;
};

// ✅ Interfaces separadas
class IImpresora {
 public:
  virtual void imprimir() = 0;
};

class IEscaner {
 public:
  virtual void escanear() = 0;
};

class ImpresoraBasica : public IImpresora {
 public:
  void imprimir() override {
    // solo imprime
  }
};
''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 1,
    'tittle_level': 'Diseño y Arquitectura de Software',
    'topic': 'Principios SOLID y Buenas Prácticas',
    'subtopic': 'Inversión de Dependencias',
    'definition': '''
Este principio sugiere que los módulos de alto nivel no deberían depender directamente de módulos de bajo nivel, sino de abstracciones.

No sé tú, pero a mí esto al principio me costó 🤯

La idea es que el código más importante (como la lógica de negocio) no dependa directamente de detalles concretos (como cómo se guarda un archivo). En su lugar, ambos dependen de interfaces. Así puedes cambiar la implementación sin afectar la lógica principal.

¿Un ejemplo? En lugar de tener una clase `Controlador` que use directamente un `RepositorioEnArchivo`, crea una interfaz `IRepositorio` que ambos usen. Así puedes reemplazar el almacenamiento por base de datos, memoria o la nube sin cambiar la lógica del `Controlador`.
''',
    'code_example': r'''
// Abstracción
class IRepositorio {
 public:
  virtual void guardar(std::string dato) = 0;
};

// Implementación concreta
class RepositorioArchivo : public IRepositorio {
 public:
  void guardar(std::string dato) override {
    // guardar en archivo
  }
};

// Módulo de alto nivel
class Controlador {
 private:
  IRepositorio* repo;

 public:
  Controlador(IRepositorio* r) : repo(r) {}

  void ejecutar(std::string input) {
    repo->guardar(input);
  }
};
''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 1,
    'tittle_level': 'Diseño y Arquitectura de Software',
    'topic': 'Arquitecturas de Software',
    'subtopic': 'Arquitectura en Capas',
    'definition': '''
La arquitectura en capas es una de las formas más tradicionales y utilizadas para estructurar aplicaciones complejas. Se basa en dividir el sistema en capas jerárquicas donde cada capa tiene una responsabilidad específica y se comunica solo con la inmediatamente superior o inferior.

¿Te estás preguntando por qué tanta separación?

Este enfoque ayuda a reducir el acoplamiento y mejorar la cohesión del código. Al dividir el sistema en secciones bien definidas, es más fácil de mantener, testear, modificar e incluso escalar. Si tienes que hacer un cambio en cómo se accede a la base de datos, puedes hacerlo sin tocar el código que muestra los datos en pantalla. Lo mismo ocurre si decides cambiar cómo se presenta la interfaz de usuario: mientras respetes la interfaz con la lógica de negocio, puedes hacer cambios libremente.

Una arquitectura en capas clásica suele estar compuesta por:

- **Capa de Presentación (UI)**: la que interactúa directamente con el usuario. Puede ser una consola, una aplicación gráfica o una API web.
- **Capa de Lógica de Negocio (Servicio)**: donde se encuentra la “inteligencia” del sistema. Aquí van las reglas del negocio, las validaciones, el flujo de operaciones, etc.
- **Capa de Acceso a Datos (Repositorio)**: encargada de la comunicación con la base de datos o sistemas externos. Aquí se hacen las consultas, inserciones, actualizaciones, etc.

Además, se pueden agregar otras capas como la de seguridad, infraestructura, caching, etc., dependiendo de la complejidad del sistema.

Este enfoque sigue siendo común incluso en sistemas modernos, sobre todo en sectores que priorizan estabilidad y control, como el financiero, aeroespacial o industrial. Muchas aplicaciones en C++ que corren en servidores backend, sistemas SCADA o software de control de procesos industriales siguen utilizando este modelo.

Eso sí, como todo, también tiene desafíos: si las capas no se diseñan con cuidado, puedes terminar con dependencias cíclicas o una lógica de negocio muy dispersa entre capas. Pero cuando se aplica bien, puede ser una solución muy elegante y poderosa.
''',
    'code_example': r'''
// Capa de datos: Acceso a la base de datos o fuente de información
class UsuarioRepositorio {
 public:
  std::string obtenerNombre() {
    // En una app real, aquí podrías conectarte a una base de datos
    return "Carlos";
  }
};

// Capa de lógica: aplica reglas y decisiones de negocio
class UsuarioServicio {
 private:
  UsuarioRepositorio repo;

 public:
  std::string saludar() {
    std::string nombre = repo.obtenerNombre();

    // Regla de negocio: si el nombre está vacío, usar genérico
    if (nombre.empty()) {
      return "Hola, invitado";
    }
    return "Hola, " + nombre;
  }
};

// Capa de presentación: interfaz de usuario o API externa
void mostrarSaludo() {
  UsuarioServicio servicio;
  std::string saludo = servicio.saludar();

  // Aquí se muestra el resultado al usuario final
  std::cout << saludo << std::endl;
}

// Este código respeta la separación de responsabilidades: 
// cada clase hace una cosa y no se mete con las otras capas.
''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 1,
    'tittle_level': 'Diseño y Arquitectura de Software',
    'topic': 'Arquitecturas de Software',
    'subtopic': 'Microservicios',
    'definition': '''
Los microservicios son un enfoque de arquitectura donde una aplicación se divide en múltiples servicios pequeños, independientes y desplegables por separado. Cada servicio se centra en una funcionalidad específica del negocio y se comunica con los demás a través de protocolos como HTTP, gRPC o colas de mensajes.

Vamos a ver de qué se trata todo esto...

En lugar de construir un sistema monolítico donde todo el código está en un solo proyecto (lo que complica el mantenimiento, las pruebas y los despliegues), los microservicios proponen que cada parte del sistema viva por su cuenta. Por ejemplo, el servicio de usuarios se encarga solo de los usuarios, el de pagos de los pagos, y así sucesivamente. Esto permite que equipos diferentes trabajen en paralelo sin pisarse el código.

Cada microservicio puede tener su propio repositorio, su propia base de datos (si es necesario), y puede estar escrito incluso en un lenguaje distinto al del resto del sistema. En C++, este enfoque es especialmente útil para sistemas que requieren alto rendimiento y eficiencia, como servidores de videojuegos, procesamiento financiero o control industrial en tiempo real.

Entre los beneficios más destacados están:

- **Escalabilidad independiente**: solo escalarás el servicio que necesita más recursos.
- **Despliegues autónomos**: puedes actualizar un servicio sin detener todo el sistema.
- **Resiliencia**: un fallo en un servicio no tiene por qué derribar toda la app.
- **Mejor organización de equipos**: cada equipo puede trabajar como una "startup interna", con total control sobre su microservicio.

¿Y los retos? Bueno, no todo es color de rosa. Hay desafíos como:

- Mayor complejidad operativa (más cosas que monitorear, desplegar y versionar).
- Gestión de la comunicación entre servicios.
- Consistencia de datos entre servicios que usan diferentes bases.

En C++, puedes implementar microservicios utilizando bibliotecas como:

- **Pistache**: un framework HTTP moderno para construir APIs REST.
- **gRPC**: ideal para comunicación eficiente binaria entre servicios.
- **ZeroMQ o nanomsg**: para arquitecturas distribuidas que necesitan bajo nivel y alta velocidad.
- **Boost.Beast** o **Crow**: como opciones ligeras para servidores web.

Empresas como Amazon, Uber o Netflix han llevado este modelo a la perfección, construyendo cientos de microservicios que interactúan entre sí para dar soporte a sus plataformas globales.
''',
    'code_example': r'''
// Servicio de usuarios (simplificado con separación clara)
// En la vida real, este servicio se expondría mediante una API REST o RPC

class Usuario {
 public:
  int id;
  std::string nombre;
};

class ServicioUsuario {
 public:
  Usuario obtenerUsuario(int id) {
    // Este servicio podría consultar una base de datos o un archivo
    return Usuario{id, "Usuario_" + std::to_string(id)};
  }
};

// En otro servicio (ej: ServicioDeCompras), podrías hacer:
void usarServicioUsuario() {
  ServicioUsuario usuarioSvc;
  Usuario u = usuarioSvc.obtenerUsuario(7);
  std::cout << "Consultando datos de: " << u.nombre << std::endl;
}

// En un entorno real, esta comunicación sería por red usando HTTP, gRPC o mensajería
''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 1,
    'tittle_level': 'Diseño y Arquitectura de Software',
    'topic': 'Arquitecturas de Software',
    'subtopic': 'Event-Driven Architecture',
    'definition': '''
La arquitectura orientada a eventos es un enfoque en el que los componentes del sistema reaccionan a eventos en lugar de depender de llamadas directas entre ellos. Es como pasar de un "llámame cuando necesites algo" a "avisaré cuando algo ocurra".

¿Te estás preguntando cómo esto mejora un sistema?

Imagina una aplicación donde, al registrarse un usuario, no solo se guarda en la base de datos, sino que también se le envía un correo de bienvenida, se actualizan las estadísticas y se notifica al equipo de soporte. En lugar de tener un método gigante que lo haga todo, cada parte reacciona al evento “UsuarioRegistrado”.

Este enfoque trae múltiples beneficios:

- **Desacoplamiento**: los emisores de eventos no necesitan saber quién los escucha.
- **Escalabilidad**: puedes añadir nuevos listeners sin modificar la lógica original.
- **Flexibilidad**: los eventos pueden venir de múltiples fuentes (clics de usuario, sensores, APIs...).
- **Reactividad**: el sistema reacciona en tiempo real a lo que pasa.

En C++, puedes aplicar esta arquitectura usando sistemas de colas de mensajes (como ZeroMQ, nanomsg, RabbitMQ), eventos internos entre objetos o incluso sistemas basados en callbacks, señales y slots (como en Qt).

Es muy común en sistemas embebidos, videojuegos, procesamiento en tiempo real y microservicios. Incluso grandes plataformas como Spotify y Uber dependen de arquitecturas basadas en eventos para reaccionar rápido y escalar de forma natural.

Eso sí, debes tener cuidado con el **orden de eventos**, la **trazabilidad** (saber qué pasó y cuándo), y los **efectos colaterales** inesperados si los handlers no están bien aislados. Una buena gestión de logs y métricas se vuelve fundamental.
''',
    'code_example': r'''
// Simulación de un bus de eventos simple en C++
#include <iostream>
#include <vector>
#include <functional>

class Evento {
 public:
  std::string tipo;
  std::string payload;
};

class BusDeEventos {
 private:
  std::vector<std::function<void(Evento)>> suscriptores;

 public:
  void suscribir(std::function<void(Evento)> callback) {
    suscriptores.push_back(callback);
  }

  void publicar(const Evento& evento) {
    for (auto& cb : suscriptores) {
      cb(evento);
    }
  }
};

void manejarUsuarioRegistrado(Evento evento) {
  std::cout << "Notificación: Nuevo usuario registrado - " << evento.payload << std::endl;
}

int main() {
  BusDeEventos bus;
  bus.suscribir(manejarUsuarioRegistrado);

  Evento nuevoUsuario{"UsuarioRegistrado", "user42"};
  bus.publicar(nuevoUsuario);
}
''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 1,
    'tittle_level': 'Diseño y Arquitectura de Software',
    'topic': 'Arquitecturas de Software',
    'subtopic': 'Domain-Driven Design (DDD)',
    'definition': '''
Domain-Driven Design, o DDD, es un enfoque para diseñar software centrado en reflejar de forma precisa el dominio del problema en el código. En lugar de estructurar la aplicación alrededor de tecnologías (como bases de datos o redes), la organizamos en torno a cómo el negocio realmente funciona.

¿Te preguntas por qué no basta con tener solo clases y métodos bien nombrados?

DDD busca algo más profundo: que el lenguaje del código y el del negocio sean el mismo. Es decir, si alguien que entiende el negocio pero no sabe programar, lee tu modelo de dominio, debería decir “esto representa bien lo que hacemos”. Esto reduce errores, mejora la comunicación entre equipos técnicos y no técnicos, y permite que el software evolucione junto con el negocio.

En DDD se manejan conceptos clave como:

- **Entidades**: objetos con identidad única (como una orden o un usuario).
- **Value Objects**: representan conceptos sin identidad (como una dirección).
- **Agregados**: grupo de objetos que se tratan como una unidad (por ejemplo, una orden y sus ítems).
- **Repositorios**: encapsulan el acceso a persistencia.
- **Servicios de dominio**: lógica del dominio que no encaja dentro de una entidad.
- **Ubiquitous Language**: lenguaje compartido entre devs y expertos del negocio.

En C++ puedes aplicar DDD separando tu sistema en capas como: `Dominio`, `Aplicación`, `Infraestructura`, y `Presentación`. La clave está en mantener el **dominio puro y libre de dependencias técnicas**. Eso permite testear sin necesidad de levantar una base de datos, por ejemplo.

DDD se vuelve especialmente útil cuando trabajas en sistemas complejos, como plataformas financieras, sistemas de reservas o e-commerce. Empresas como Amazon y Spotify han aplicado principios de DDD para modelar mejor su lógica de negocio y escalar sin que su código se vuelva caótico.
''',
    'code_example': r'''
// Entidad con identidad propia
class Orden {
 private:
  int id;
  bool pagada;

 public:
  Orden(int id_) : id(id_), pagada(false) {}

  void pagar() {
    if (!pagada) {
      pagada = true;
    }
  }

  bool estaPagada() const {
    return pagada;
  }

  int obtenerId() const {
    return id;
  }
};

// Servicio de aplicación que usa el dominio
class ServicioOrden {
 public:
  void procesarPago(Orden& orden) {
    // Aquí se aplican reglas del negocio
    if (!orden.estaPagada()) {
      orden.pagar();
      std::cout << "Pago procesado para orden #" << orden.obtenerId() << std::endl;
    }
  }
};

int main() {
  Orden o(1001);
  ServicioOrden servicio;
  servicio.procesarPago(o);
}
''',
  });
}

Future<void> insertSrLevel2DataCpp(Database db) async {
  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 2,
    'tittle_level': 'Metaprogramación y Plantillas Avanzadas',
    'topic': 'Metaprogramación con Templates',
    'subtopic': 'SFINAE (Substitution Failure Is Not An Error)',
    'definition': '''
SFINAE es una de esas siglas que suenan a hechizo, pero es un pilar de la metaprogramación en C++. Significa “Substitution Failure Is Not An Error”, y permite que el compilador descarte una sobrecarga de función cuando los tipos no encajan, sin lanzar un error de compilación.

¿Te preguntas por qué esto sería útil?

SFINAE te permite escribir código que se adapta a diferentes tipos automáticamente. En lugar de crear docenas de `if constexpr` o usar `enable_if` en todas partes, puedes dejar que el compilador elija la función correcta basado en lo que *sí* funciona con ese tipo.

Un ejemplo clásico: tienes una función que solo debería existir si el tipo tiene cierto método o propiedad. Si no lo tiene, el compilador simplemente ignora esa función y busca otra alternativa.

Este mecanismo es base para librerías como Boost y para muchos componentes de la STL. Es poderoso, pero puede volverse críptico si no se usa con cuidado. A partir de C++20, conceptos y `requires` ofrecen alternativas más legibles, pero SFINAE sigue vigente en código moderno.
''',
    'code_example': r'''
#include <iostream>
#include <type_traits>

template <typename T>
typename std::enable_if<std::is_integral<T>::value, void>::type
imprimirTipo(T valor) {
  std::cout << "Tipo integral: " << valor << std::endl;
}

template <typename T>
typename std::enable_if<std::is_floating_point<T>::value, void>::type
imprimirTipo(T valor) {
  std::cout << "Tipo flotante: " << valor << std::endl;
}

int main() {
  imprimirTipo(42);       // Llama a la versión integral
  imprimirTipo(3.14f);    // Llama a la versión flotante
}
''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 2,
    'tittle_level': 'Metaprogramación y Plantillas Avanzadas',
    'topic': 'Metaprogramación con Templates',
    'subtopic': 'Traits y Type Traits',
    'definition': '''
Los *type traits* son herramientas que permiten inspeccionar y manipular tipos en tiempo de compilación. Vienen del mundo de la metaprogramación y son claves cuando quieres que tu código sea más genérico, seguro y expresivo.

¿Nunca te pasó que querías saber si un tipo es entero, flotante, puntero o incluso si tiene un método específico?

Ahí entran los traits. La STL de C++ proporciona una serie de herramientas bajo `<type_traits>` que te permiten preguntar cosas como: "¿es este tipo un puntero?", "¿puedo hacerle una copia?", "¿es trivialmente constructible?"… todo en tiempo de compilación.

También puedes crear tus propios traits personalizados. Esto es muy útil cuando trabajas con plantillas genéricas y quieres cambiar el comportamiento dependiendo del tipo.

Los traits se usan en frameworks de testeo, bibliotecas genéricas y librerías como Boost o Eigen. Entenderlos bien te permite crear código más robusto y expresivo.
''',
    'code_example': r'''
#include <iostream>
#include <type_traits>

template <typename T>
void describirTipo() {
  if (std::is_integral<T>::value) {
    std::cout << "Tipo integral" << std::endl;
  } else if (std::is_floating_point<T>::value) {
    std::cout << "Tipo de punto flotante" << std::endl;
  } else {
    std::cout << "Tipo desconocido" << std::endl;
  }
}

int main() {
  describirTipo<int>();
  describirTipo<double>();
  describirTipo<std::string>(); // Tipo desconocido
}
''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 2,
    'tittle_level': 'Metaprogramación y Plantillas Avanzadas',
    'topic': 'Metaprogramación con Templates',
    'subtopic': 'Plantillas Variádicas',
    'definition': '''
Las plantillas variádicas permiten definir funciones o clases que aceptan un número indefinido de argumentos de diferentes tipos. Esto es extremadamente útil para construir funciones genéricas como `printf`, `loggers`, tuplas, etc.

¿Te estás preguntando cómo funciona esto detrás del telón?

En lugar de escribir una sobrecarga para cada número de argumentos, defines una plantilla que acepta `Args...` (pack de tipos) y luego la expandes usando recursión o `fold expressions`. A partir de C++17, los *fold expressions* hacen esto mucho más limpio y legible.

Se usan mucho en bibliotecas modernas como `std::tuple`, `std::format`, sistemas de logging y wrappers genéricos. También son la base de muchos sistemas de eventos y delegados dinámicos.

Cuando dominas las plantillas variádicas, puedes escribir código más flexible y elegante sin sacrificar rendimiento.
''',
    'code_example': r'''
#include <iostream>

// Función recursiva variádica
void imprimir() {
  std::cout << std::endl;
}

template <typename T, typename... Args>
void imprimir(T primero, Args... resto) {
  std::cout << primero << " ";
  imprimir(resto...);
}

int main() {
  imprimir(1, "hola", 3.14, true);
}
''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 2,
    'tittle_level': 'Metaprogramación y Plantillas Avanzadas',
    'topic': 'Concepts y Constraints (C++20)',
    'subtopic': 'Introducción a Concepts',
    'definition': '''
Los Concepts en C++20 representan una revolución en la programación genérica, permitiendo expresar restricciones claras sobre los tipos que pueden usarse con templates. Son como contratos que definen qué propiedades debe tener un tipo para ser válido en un contexto determinado.

No sé tú, pero a mí los mensajes de error de templates me daban pesadillas antes de Concepts 🤯. Ahora podemos definir requisitos explícitos que hacen los errores más comprensibles y el código más seguro.

Un Concept es esencialmente un predicado que evalúa si un tipo cumple ciertos requisitos en tiempo de compilación. Esto soluciona varios problemas:
- Mensajes de error incomprensibles con templates
- Validación tardía de requisitos de tipos
- Documentación pobre de requisitos en templates

Empresas como Microsoft y Google han adoptado Concepts rápidamente en sus codebases para hacer el código genérico más robusto y mantenible.
''',
    'code_example': r'''
// Ejemplo correcto de Concept básico
template<typename T>
concept Numeric = std::integral<T> || std::floating_point<T>;

template<Numeric T>
T add(T a, T b) {
    return a + b;
}

// Uso válido:
add(5, 3);      // OK - int cumple con Numeric
add(2.5, 3.7);  // OK - double cumple con Numeric

// Uso inválido (genera error legible):
// add("hello", "world"); // Error: no satisface 'Numeric'

// Ejemplo antiguo sin Concepts (menos claro):
template<typename T>
auto old_add(T a, T b) -> decltype(a + b) {
    return a + b;
}
''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 2,
    'tittle_level': 'Metaprogramación y Plantillas Avanzadas',
    'topic': 'Concepts y Constraints (C++20)',
    'subtopic': 'Uso de Constraints en Templates',
    'definition': '''
Las Constraints son la forma práctica de aplicar Concepts para restringir templates, mejorando significativamente la seguridad de tipos y la claridad del código. Piensa en ellas como filtros que garantizan que solo los tipos adecuados pasan por tus templates.

Seguramente pensarás que esto añade complejidad, pero en realidad simplifica el código genérico a largo plazo. Las constraints permiten:
- Especificar múltiples requisitos combinados
- Crear sobrecargas basadas en capacidades de tipos
- Documentar claramente las expectativas del template

Existen varias formas de aplicar constraints:
- Sintaxis abreviada (auto y Concept)
- Clausulas requires
- Combinación lógica de Concepts

Sistemas como la STL moderna usan extensivamente constraints para garantizar comportamiento seguro en contenedores y algoritmos.
''',
    'code_example': r'''
// Ejemplo correcto de Constraints
template<typename T>
concept Printable = requires(T t) {
    { std::cout << t } -> std::same_as<std::ostream&>;
};

template<typename T>
concept SequenceContainer = requires(T container) {
    typename T::value_type;
    { container.begin() } -> std::input_iterator;
    { container.end() } -> std::input_iterator;
    { container.size() } -> std::integral;
};

// Función constrained
template<Printable T>
void print(const T& value) {
    std::cout << value << std::endl;
}

// Función con requires clause
template<typename T>
    requires SequenceContainer<T> && Printable<typename T::value_type>
void printAll(const T& container) {
    for (const auto& item : container) {
        print(item);
    }
}

// Uso:
std::vector<int> nums = {1, 2, 3};
printAll(nums); // OK

// std::vector<std::thread> threads;
// printAll(threads); // Error claro: thread no es Printable
''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 2,
    'tittle_level': 'Metaprogramación y Plantillas Avanzadas',
    'topic': 'Concepts y Constraints (C++20)',
    'subtopic': 'Mejora de la legibilidad y mantenibilidad',
    'definition': '''
La verdadera potencia de Concepts y Constraints no está solo en la seguridad de tipos, sino en cómo transforman la legibilidad y mantenibilidad del código genérico. Es como pasar de jeroglíficos a un manual bien escrito.

¿Te estás preguntando cómo exactamente mejoran el código? Veamos los beneficios concretos:
1. Documentación autocontenida: Los requisitos están explícitos en la firma
2. Errores comprensibles: Los mensajes indican exactamente qué Concept falló
3. Sobrecarga intuitiva: Puedes tener múltiples versiones de templates para diferentes capacidades
4. Refactorización segura: Cambios en requisitos se verifican en compilación

Proyectos grandes como LLVM y Clang han reportado reducciones significativas en tiempo de depuración de templates gracias a Concepts. Además, herramientas como Doxygen pueden extraer automáticamente documentación de los requisitos.
''',
    'code_example': r'''
// Ejemplo que muestra mejoras de legibilidad
// Antes (C++17):
template<typename Iter>
auto distance(Iter first, Iter last) {
    // Documentación en comentarios sobre requisitos
    static_assert(
        std::is_base_of_v<
            std::input_iterator_tag,
            typename std::iterator_traits<Iter>::iterator_category
        >,
        "Iter must be at least input iterator"
    );
    return std::distance(first, last);
}

// Ahora (C++20):
template<std::input_iterator Iter>
auto distance(Iter first, Iter last) {
    // Los requisitos son parte de la firma
    return std::distance(first, last);
}

// Ejemplo de sobrecarga basada en capacidades
template<std::random_access_iterator Iter>
void sort(Iter first, Iter last) {
    std::sort(first, last); // Algoritmo óptimo
}

template<std::forward_iterator Iter>
void sort(Iter first, Iter last) {
    std::list tmp(first, last);
    tmp.sort();
    std::copy(tmp.begin(), tmp.end(), first);
}

// El compilador elige la versión adecuada automáticamente
// basado en las capacidades del iterador
''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 2,
    'tittle_level': 'Metaprogramación y Plantillas Avanzadas',
    'topic': 'Técnicas Avanzadas de Plantillas',
    'subtopic': 'CRTP (Curiously Recurring Template Pattern)',
    'definition': '''
El patrón CRTP (Curiously Recurring Template Pattern) es una técnica de metaprogramación en C++ donde una clase base es una plantilla que toma como parámetro la clase derivada. Esto permite lograr polimorfismo en tiempo de compilación, evitando el costo de las funciones virtuales.

¿Te preguntas cómo funciona esto?

La clase base define una interfaz que llama a métodos de la clase derivada mediante `static_cast`. De esta manera, se puede invocar el comportamiento específico de la clase derivada sin necesidad de funciones virtuales, lo que mejora el rendimiento y permite al compilador optimizar mejor el código.

CRTP se utiliza en diversas bibliotecas y patrones de diseño para implementar funcionalidades como contadores de instancias, clonación de objetos y más, todo en tiempo de compilación.
''',
    'code_example': r'''
#include <iostream>

// Clase base usando CRTP
template <typename Derived>
class Base {
public:
    void interface() {
        // Llama al método implementation() de la clase derivada
        static_cast<Derived*>(this)->implementation();
    }
};

// Clase derivada
class Derived : public Base<Derived> {
public:
    void implementation() {
        std::cout << "Implementación en Derived" << std::endl;
    }
};

int main() {
    Derived d;
    d.interface(); // Salida: Implementación en Derived
    return 0;
}
''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 2,
    'tittle_level': 'Metaprogramación y Plantillas Avanzadas',
    'topic': 'Técnicas Avanzadas de Plantillas',
    'subtopic': 'Policy-Based Design',
    'definition': '''
El diseño basado en políticas (Policy-Based Design) es una técnica que permite crear clases altamente configurables y reutilizables mediante la composición de comportamientos a través de plantillas. Cada política encapsula un aspecto específico del comportamiento, y la clase principal (host) combina estas políticas para definir su funcionalidad.

¿Te preguntas por qué usar este enfoque?

Esta técnica permite una gran flexibilidad y personalización en tiempo de compilación, evitando el uso de herencia múltiple compleja y mejorando la mantenibilidad del código. Es especialmente útil en bibliotecas genéricas y sistemas donde se requiere un alto grado de configurabilidad.

Un ejemplo clásico es un sistema de logging donde puedes definir políticas para diferentes estrategias de salida (consola, archivo, red) y mensajes, y luego combinarlas según sea necesario.
''',
    'code_example': r'''
#include <iostream>
#include <fstream>
#include <string>

// Política para logging en consola
struct ConsoleLogger {
    void log(const std::string& message) {
        std::cout << "Consola: " << message << std::endl;
    }
};

// Política para logging en archivo
struct FileLogger {
    std::ofstream file;
    FileLogger(const std::string& filename) : file(filename) {}
    void log(const std::string& message) {
        file << "Archivo: " << message << std::endl;
    }
};

// Clase Logger que utiliza una política
template <typename LoggerPolicy>
class Logger : public LoggerPolicy {
public:
    using LoggerPolicy::LoggerPolicy; // Hereda el constructor
    void logMessage(const std::string& message) {
        this->log(message);
    }
};

int main() {
    Logger<ConsoleLogger> consoleLogger;
    consoleLogger.logMessage("Mensaje a la consola");

    Logger<FileLogger> fileLogger("log.txt");
    fileLogger.logMessage("Mensaje al archivo");

    return 0;
}
''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 2,
    'tittle_level': 'Metaprogramación y Plantillas Avanzadas',
    'topic': 'Técnicas Avanzadas de Plantillas',
    'subtopic': 'Plantillas Recursivas',
    'definition': '''
Las plantillas recursivas son una técnica de metaprogramación en C++ donde una plantilla se define en términos de sí misma, permitiendo realizar cálculos y transformaciones en tiempo de compilación. Esta técnica es fundamental en la creación de estructuras de metaprogramación como listas de tipos, tuplas y más.

¿Te preguntas cómo se aplica esto?

Un ejemplo clásico es el cálculo del factorial en tiempo de compilación. Al definir una plantilla que se llama a sí misma con un parámetro decreciente, el compilador puede resolver el valor final durante la compilación, eliminando la necesidad de cálculos en tiempo de ejecución.

Esta técnica es poderosa, pero debe usarse con cuidado para evitar recursiones infinitas y errores de compilación complejos.
''',
    'code_example': r'''
#include <iostream>

// Plantilla recursiva para calcular el factorial
template <int N>
struct Factorial {
    static constexpr int value = N * Factorial<N - 1>::value;
};

// Caso base
template <>
struct Factorial<0> {
    static constexpr int value = 1;
};

int main() {
    std::cout << "Factorial de 5: " << Factorial<5>::value << std::endl; // Salida: 120
    return 0;
}
''',
  });
}

Future<void> insertSrLevel3DataCpp(Database db) async {
  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 3,
    'tittle_level': 'Concurrencia y Programación Paralela',
    'topic': 'Programación Multihilo Avanzada',
    'subtopic': 'std::thread, std::async, std::future',
    'definition': '''
En C++, la programación multihilo permite ejecutar múltiples tareas simultáneamente, aprovechando los núcleos múltiples de los procesadores modernos.

- **`std::thread`**: Permite crear y gestionar hilos directamente. Requiere manejar manualmente la sincronización y la gestión de recursos compartidos.
- **`std::async`**: Lanza tareas asincrónicas que se ejecutan en hilos separados. Devuelve un `std::future` que se puede utilizar para obtener el resultado de la tarea.
- **`std::future`**: Representa un valor que estará disponible en el futuro. Se utiliza para recuperar el resultado de una operación asincrónica.

Estas herramientas permiten estructurar programas concurrentes de manera más sencilla y segura, delegando la gestión de hilos y sincronización al sistema.
''',
    'code_example': r'''
#include <iostream>
#include <thread>
#include <future>
#include <chrono>

int tarea_larga() {
    std::this_thread::sleep_for(std::chrono::seconds(2));
    return 42;
}

int main() {
    // Usando std::async para ejecutar una tarea asincrónica
    std::future<int> resultado = std::async(std::launch::async, tarea_larga);

    std::cout << "Esperando resultado...\n";
    int valor = resultado.get(); // Bloquea hasta que la tarea termine
    std::cout << "Resultado: " << valor << std::endl;

    return 0;
}
''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 3,
    'tittle_level': 'Concurrencia y Programación Paralela',
    'topic': 'Programación Multihilo Avanzada',
    'subtopic': 'std::mutex, std::lock_guard, std::unique_lock',
    'definition': '''
La sincronización es crucial en la programación multihilo para evitar condiciones de carrera y garantizar la coherencia de los datos compartidos.

- **`std::mutex`**: Proporciona exclusión mutua, permitiendo que solo un hilo acceda a una sección crítica a la vez.
- **`std::lock_guard`**: Es un wrapper RAII que bloquea un mutex al construirse y lo desbloquea al destruirse. Es útil para secciones críticas simples.
- **`std::unique_lock`**: Ofrece más flexibilidad que `std::lock_guard`, permitiendo bloquear y desbloquear manualmente, y es necesario para usar con `std::condition_variable`.

Estas herramientas ayudan a gestionar el acceso concurrente a recursos compartidos de manera segura y eficiente.
''',
    'code_example': r'''
#include <iostream>
#include <thread>
#include <mutex>

std::mutex mtx;
int contador = 0;

void incrementar() {
    for (int i = 0; i < 1000; ++i) {
        std::lock_guard<std::mutex> lock(mtx);
        ++contador;
    }
}

int main() {
    std::thread t1(incrementar);
    std::thread t2(incrementar);

    t1.join();
    t2.join();

    std::cout << "Contador final: " << contador << std::endl;
    return 0;
}
''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 3,
    'tittle_level': 'Concurrencia y Programación Paralela',
    'topic': 'Programación Multihilo Avanzada',
    'subtopic': 'std::condition_variable',
    'definition': '''
`std::condition_variable` es una herramienta de sincronización que permite a los hilos esperar hasta que se cumpla una condición específica. Se utiliza junto con `std::mutex` y `std::unique_lock` para coordinar la ejecución de hilos.

Un uso común es en el patrón productor-consumidor, donde un hilo espera a que otro produzca datos antes de continuar.

Es importante utilizar un predicado al llamar a `wait` para evitar despertares espurios, asegurando que la condición deseada realmente se cumple antes de continuar.
''',
    'code_example': r'''
#include <iostream>
#include <thread>
#include <mutex>
#include <condition_variable>
#include <queue>

std::mutex mtx;
std::condition_variable cv;
std::queue<int> cola;

void productor() {
    for (int i = 0; i < 5; ++i) {
        std::this_thread::sleep_for(std::chrono::milliseconds(500));
        std::lock_guard<std::mutex> lock(mtx);
        cola.push(i);
        std::cout << "Producido: " << i << std::endl;
        cv.notify_one();
    }
}

void consumidor() {
    for (int i = 0; i < 5; ++i) {
        std::unique_lock<std::mutex> lock(mtx);
        cv.wait(lock, [] { return !cola.empty(); });
        int valor = cola.front();
        cola.pop();
        std::cout << "Consumido: " << valor << std::endl;
    }
}

int main() {
    std::thread t1(productor);
    std::thread t2(consumidor);

    t1.join();
    t2.join();

    return 0;
}
''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 2,
    'tittle_level': 'Metaprogramación y Plantillas Avanzadas',
    'topic': 'Paralelismo y SIMD',
    'subtopic': 'Paralelismo con std::execution (C++17)',
    'definition': '''
C++17 introdujo las políticas de ejecución (`std::execution`) que permiten especificar cómo se deben ejecutar los algoritmos estándar: de forma secuencial, paralela o vectorizada. Esto facilita la paralelización de algoritmos sin necesidad de gestionar manualmente los hilos.

Las principales políticas son:

- `std::execution::seq`: ejecución secuencial.
- `std::execution::par`: ejecución paralela utilizando múltiples hilos.
- `std::execution::par_unseq`: ejecución paralela y vectorizada, permitiendo una mayor optimización en hardware compatible.

Al utilizar estas políticas, los algoritmos estándar como `std::for_each`, `std::sort` y `std::reduce` pueden aprovechar automáticamente las capacidades de hardware para mejorar el rendimiento.
''',
    'code_example': r'''
#include <iostream>
#include <vector>
#include <execution>
#include <algorithm>

int main() {
    std::vector<int> datos(1'000'000, 1);

    // Suma secuencial
    int suma_seq = std::reduce(std::execution::seq, datos.begin(), datos.end());

    // Suma paralela
    int suma_par = std::reduce(std::execution::par, datos.begin(), datos.end());

    std::cout << "Suma secuencial: " << suma_seq << std::endl;
    std::cout << "Suma paralela: " << suma_par << std::endl;

    return 0;
}
''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 2,
    'tittle_level': 'Metaprogramación y Plantillas Avanzadas',
    'topic': 'Paralelismo y SIMD',
    'subtopic': 'SIMD y Vectorización',
    'definition': '''
SIMD (Single Instruction, Multiple Data) es una técnica que permite ejecutar una misma instrucción sobre múltiples datos simultáneamente, aprovechando las capacidades de vectorización del hardware. Esto es especialmente útil en operaciones que se repiten sobre grandes conjuntos de datos, como procesamiento de imágenes, señales o cálculos científicos.

En C++, la vectorización puede lograrse mediante:

- **Autovectorización del compilador**: activada con opciones como `-O3` en GCC o Clang.
- **Intrínsecos SIMD**: funciones específicas que permiten un control fino sobre las instrucciones SIMD.
- **Bibliotecas especializadas**: como Intel SIMD Data Layout Template (SDLT), que facilita la conversión de estructuras de datos para una mejor vectorización.

Utilizar SIMD adecuadamente puede resultar en mejoras significativas de rendimiento, pero requiere una comprensión detallada del hardware y del comportamiento del compilador.
''',
    'code_example': r'''
#include <iostream>
#include <vector>
#include <chrono>

int main() {
    const size_t N = 1'000'000;
    std::vector<float> a(N, 1.0f), b(N, 2.0f), c(N);

    auto start = std::chrono::high_resolution_clock::now();

    // Operación vectorizada (si el compilador lo permite)
    for (size_t i = 0; i < N; ++i) {
        c[i] = a[i] + b[i];
    }

    auto end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> duracion = end - start;

    std::cout << "Tiempo de ejecución: " << duracion.count() << " segundos" << std::endl;

    return 0;
}
''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 2,
    'tittle_level': 'Metaprogramación y Plantillas Avanzadas',
    'topic': 'Paralelismo y SIMD',
    'subtopic': 'Bibliotecas como Intel TBB y OpenMP',
    'definition': '''
Para facilitar la programación paralela en C++, existen bibliotecas como Intel Threading Building Blocks (TBB) y OpenMP:

- **Intel TBB**: es una biblioteca basada en plantillas que permite la programación paralela a través de tareas. TBB gestiona automáticamente la asignación y sincronización de tareas, proporcionando estructuras de datos concurrentes y algoritmos paralelos.

- **OpenMP**: es una API que utiliza directivas de compilador para paralelizar secciones de código. Es especialmente útil para paralelizar bucles y se integra fácilmente en código existente.

Ambas herramientas permiten aprovechar los procesadores multinúcleo sin necesidad de gestionar manualmente los hilos, facilitando el desarrollo de aplicaciones paralelas eficientes y escalables.
''',
    'code_example': r'''
// Ejemplo con OpenMP
#include <iostream>
#include <vector>
#include <omp.h>

int main() {
    const size_t N = 1'000'000;
    std::vector<int> datos(N, 1);
    long long suma = 0;

    #pragma omp parallel for reduction(+:suma)
    for (size_t i = 0; i < N; ++i) {
        suma += datos[i];
    }

    std::cout << "Suma total: " << suma << std::endl;

    return 0;
}
''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 3,
    'tittle_level': 'Programación Orientada a Objetos Avanzada',
    'topic': 'Diseño de Sistemas Concurrentes',
    'subtopic': 'Modelos de Memoria',
    'definition': '''
Cuando hablamos de programación concurrente, es decir, cuando varias partes de nuestro programa se ejecutan "al mismo tiempo", uno de los conceptos más cruciales (y a veces confusos) es el Modelo de Memoria. Básicamente, se refiere a las reglas que definen cómo los diferentes hilos o procesos ven los cambios que otros hilos hacen en la memoria. No es tan simple como "lo que escribes, lo lees", porque la forma en que los procesadores y el compilador optimizan las operaciones puede cambiar el orden de las cosas.

Seguramente pensarás de qué va todo esto y por qué te deberías preocupar si ya estás usando `std::thread` o `std::mutex`. Bueno, la realidad es que sin entender el modelo de memoria, tus programas concurrentes pueden tener comportamientos inesperados y muy difíciles de depurar, lo que se conoce como "bugs de concurrencia".

En C++, el modelo de memoria se rige por el estándar C++11 y posteriores. Este estándar define cómo las operaciones de lectura y escritura en memoria se hacen visibles entre diferentes hilos. No se trata solo de la coherencia de caché del hardware, sino también de las optimizaciones del compilador que pueden reordenar instrucciones. Para manejar esto, C++ nos da "órdenes de memoria" (memory orders) que podemos aplicar a operaciones atómicas. Por ejemplo, `std::memory_order_seq_cst` (sequential consistency) es la más sencilla y garantiza que todas las operaciones atómicas aparezcan en el mismo orden para todos los hilos, como si hubiera un único orden global. Sin embargo, es la más lenta. Otros órdenes como `std::memory_order_acquire` y `std::memory_order_release` permiten optimizaciones al relajar estas garantías, pero requieren un entendimiento más profundo de cuándo y cómo se propaga la información. Comprender estos modelos es esencial para escribir código concurrente robusto y eficiente en C++, evitando condiciones de carrera sutiles que pueden surgir incluso cuando crees que has protegido tus datos con exclusiones mutuas. Es un tema complejo, pero dominarlo te abrirá las puertas a sistemas concurrentes verdaderamente estables.
''',
    'code_example': '''
#include <atomic>
#include <thread>
#include <iostream>

std::atomic<bool> ready{false};
int data = 0;

void writer() {
    data = 42;
    // std::atomic_thread_fence(std::memory_order_release); // Una barrera de memoria explícita
    ready.store(true, std::memory_order_release); // 'release' garantiza que 'data' sea visible antes que 'ready'
}

void reader() {
    while (!ready.load(std::memory_order_acquire)) { // 'acquire' garantiza que ve 'data' si ve 'ready'
        std::this_thread::yield(); // Cede el control de la CPU
    }
    std::cout << "Data: " << data << std::endl; // Esperamos ver 42
}

int main() {
    std::thread t1(writer);
    std::thread t2(reader);

    t1.join();
    t2.join();

    // Ejemplo INCORRECTO sin órdenes de memoria adecuadas (o con variables no atómicas):
    /*
    bool ready_bad = false;
    int data_bad = 0;

    auto writer_bad = [&]() {
        data_bad = 42;
        ready_bad = true; // El compilador o CPU podría reordenar esto, haciendo que data_bad no sea 42 cuando se lea.
    };

    auto reader_bad = [&]() {
        while (!ready_bad) {
            std::this_thread::yield();
        }
        // std::cout << "Data (bad): " << data_bad << std::endl; // Podría imprimir 0
    };

    std::thread tb1(writer_bad);
    std::thread tb2(reader_bad);
    tb1.join();
    tb2.join();
    */
    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 3,
    'tittle_level': 'Programación Orientada a Objetos Avanzada',
    'topic': 'Diseño de Sistemas Concurrentes',
    'subtopic': 'Evitación de Deadlocks',
    'definition': '''
Los deadlocks, o interbloqueos, son uno de los problemas más frustrantes y difíciles de depurar en la programación concurrente. Imagina dos personas intentando cruzar un pasillo estrecho al mismo tiempo, pero cada una se niega a moverse hasta que la otra lo haga. Resultado: nadie avanza. En programación, un deadlock ocurre cuando dos o más hilos están esperando indefinidamente por un recurso que está siendo retenido por otro hilo en el mismo conjunto de espera. Es un callejón sin salida donde tu programa simplemente se congela.

¿Te estás preguntando por qué esto importa y si no es suficiente con usar mutexes? Pues no, no lo es. Los mutexes son para proteger recursos compartidos, pero si los usas sin una estrategia clara, puedes caer fácilmente en un deadlock. Por ejemplo, si el Hilo A bloquea el recurso X y luego intenta bloquear el recurso Y, mientras que el Hilo B bloquea el recurso Y y luego intenta bloquear el recurso X, ¡boom!, tienes un deadlock.

Para evitar deadlocks, hay varias estrategias que podemos aplicar. Una de las más comunes es el **ordenamiento de recursos**: si todos los hilos adquieren los recursos en el mismo orden preestablecido, es mucho más difícil que se produzca un ciclo de espera. Por ejemplo, siempre adquiere mutex A antes que mutex B. Otra estrategia es el **tiempo de espera limitado** (timeout): intenta adquirir un mutex con un tiempo máximo de espera; si no lo consigues, liberas los recursos que ya tienes y vuelves a intentarlo. `std::unique_lock` en C++ con `try_lock_for` o `try_lock_until` es perfecto para esto. También podemos usar la **detección y recuperación de deadlocks**, aunque esto es más complejo y a menudo implica monitorear los estados de los hilos para identificar el ciclo de espera y luego "matar" uno de los hilos para romperlo (lo cual puede tener efectos secundarios). Finalmente, y a veces la mejor opción, es **diseñar sin necesidad de adquirir múltiples recursos simultáneamente** o usar algoritmos sin bloqueos (lock-free), aunque esto último es significativamente más complejo de implementar correctamente. La clave es pensar cuidadosamente en las dependencias de los recursos y cómo tus hilos interactúan con ellos antes de que ocurra el problema.
''',
    'code_example': '''
#include <iostream>
#include <thread>
#include <mutex>
#include <chrono> // Para std::chrono::milliseconds

std::mutex mutexA;
std::mutex mutexB;

// Ejemplo INCORRECTO: Posible deadlock
void thread_func_deadlock_1() {
    std::lock_guard<std::mutex> lockA(mutexA);
    std::this_thread::sleep_for(std::chrono::milliseconds(10)); // Simula trabajo
    std::lock_guard<std::mutex> lockB(mutexB);
    std::cout << "Thread 1 (deadlock) entered critical section." << std::endl;
}

void thread_func_deadlock_2() {
    std::lock_guard<std::mutex> lockB(mutexB);
    std::this_thread::sleep_for(std::chrono::milliseconds(10)); // Simula trabajo
    std::lock_guard<std::mutex> lockA(mutexA);
    std::cout << "Thread 2 (deadlock) entered critical section." << std::endl;
}

// Ejemplo CORRECTO: Evitando deadlock con std::lock (adquiere múltiples mutexes atómicamente)
void thread_func_no_deadlock_1() {
    std::lock(mutexA, mutexB); // Adquiere ambos mutexes sin posibilidad de deadlock mutuo
    std::lock_guard<std::mutex> lockA(mutexA, std::adopt_lock); // std::adopt_lock para indicar que ya está bloqueado
    std::lock_guard<std::mutex> lockB(mutexB, std::adopt_lock);
    std::cout << "Thread 1 (no deadlock) entered critical section." << std::endl;
}

void thread_func_no_deadlock_2() {
    // También usa std::lock para el mismo orden o evita el cruce de dependencias
    std::lock(mutexA, mutexB);
    std::lock_guard<std::mutex> lockA(mutexA, std::adopt_lock);
    std::lock_guard<std::mutex> lockB(mutexB, std::adopt_lock);
    std::cout << "Thread 2 (no deadlock) entered critical section." << std::endl;
}

int main() {
    // Demostración de posible deadlock (ejecutar varias veces para observar)
    // std::thread t1(thread_func_deadlock_1);
    // std::thread t2(thread_func_deadlock_2);
    // t1.join();
    // t2.join();
    // std::cout << "Deadlock example finished (or got stuck)." << std::endl;

    // Demostración de evitación de deadlock
    std::thread t3(thread_func_no_deadlock_1);
    std::thread t4(thread_func_no_deadlock_2);
    t3.join();
    t4.join();
    std::cout << "No deadlock example finished." << std::endl;

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 3,
    'tittle_level': 'Programación Orientada a Objetos Avanzada',
    'topic': 'Diseño de Sistemas Concurrentes',
    'subtopic': 'Diseño de Sistemas Reactivos',
    'definition': '''
Un sistema reactivo es aquel que responde de forma rápida, flexible y robusta a los eventos. Pensemos por un momento en una aplicación que debe manejar un flujo constante de datos entrantes, como un servidor web que recibe miles de peticiones por segundo, o un sistema de trading de alta frecuencia. Estos sistemas no pueden simplemente esperar a que una operación termine antes de procesar la siguiente; necesitan reaccionar a cada evento a medida que ocurre. La programación reactiva no es solo una moda, es una necesidad para construir aplicaciones modernas que sean resilientes y elásticas.

Seguramente pensarás de qué va todo esto más allá de la concurrencia tradicional. El diseño de sistemas reactivos va un paso más allá de simplemente usar hilos o mutexes. Se centra en el flujo de datos y la propagación de cambios.

En C++, el diseño reactivo a menudo se logra a través de patrones como la **programación asíncrona**, el uso de **futuros y promesas** (`std::future`, `std::promise`), y la implementación de **patrones de diseño** como el Observador. También existen bibliotecas como `RxCpp` (Reactive Extensions para C++) que implementan los principios de la programación reactiva funcional, donde te suscribes a flujos de datos (`observables`) y los transformas y combinas usando operadores. Esto permite construir pipelines de procesamiento de eventos de una manera muy declarativa y expresiva. Un sistema reactivo bien diseñado también debe ser **elástico** (capaz de escalar hacia arriba y hacia abajo según la carga), **resiliente** (tolerante a fallos, capaz de recuperarse sin morir), y **orientado a mensajes** (la comunicación entre componentes se realiza a través de mensajes asíncronos para evitar acoplamientos fuertes). Aunque C++ no tiene un soporte nativo tan "directo" para la programación reactiva como lenguajes como JavaScript (con sus frameworks) o Java (con Reactor/RxJava), es perfectamente posible construir sistemas reactivos de alto rendimiento en C++ aprovechando sus características de bajo nivel y bibliotecas especializadas. Esto es crucial para aplicaciones donde la baja latencia y la alta disponibilidad son primordiales, como en los videojuegos, sistemas embebidos, o infraestructura de red.
''',
    'code_example': '''
#include <iostream>
#include <thread>
#include <future> // Para std::async, std::future
#include <chrono>

// Ejemplo simple de programación reactiva con std::async y std::future
// Simula un "observable" de un evento que produce un resultado.

int long_running_task(int value) {
    std::cout << "Procesando tarea con valor: " << value << "..." << std::endl;
    std::this_thread::sleep_for(std::chrono::seconds(2)); // Simula un trabajo pesado
    return value * 2;
}

void reactive_consumer(std::future<int>& result_future) {
    std::cout << "Consumidor: Esperando resultado..." << std::endl;
    int result = result_future.get(); // Bloquea hasta que el resultado esté disponible
    std::cout << "Consumidor: Resultado recibido: " << result << std::endl;
}

int main() {
    // El "productor" del evento inicia una tarea asíncrona
    std::future<int> async_result = std::async(std::launch::async, long_running_task, 10);

    // El "consumidor" puede seguir haciendo otras cosas mientras espera el evento
    std::cout << "Main: Haciendo otras cosas mientras la tarea se ejecuta..." << std::endl;
    std::this_thread::sleep_for(std::chrono::milliseconds(500));

    // El consumidor se "suscribe" o "espera" el resultado
    reactive_consumer(async_result);

    std::cout << "Main: Programa terminado." << std::endl;

    // Ejemplo INCORRECTO o menos reactivo (bloqueo directo):
    /*
    std::cout << "Main: Ejecutando tarea de forma bloqueante..." << std::endl;
    int result_sync = long_running_task(5); // Bloquea el hilo principal
    std::cout << "Main: Resultado bloqueante: " << result_sync << std::endl;
    */

    return 0;
}
'''
  });
}

Future<void> insertSrLevel4DataCpp(Database db) async {
  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 4,
    'tittle_level': 'Manejo Avanzado de Memoria',
    'topic': 'Punteros Inteligentes y RAII',
    'subtopic': 'std::unique_ptr, std::shared_ptr, std::weak_ptr',
    'definition': '''
En C++, los punteros inteligentes son objetos que gestionan la vida de un puntero crudo (raw pointer) y el recurso al que apunta. Los tres tipos principales son:

- **std::unique_ptr**: Representa una propiedad exclusiva de un recurso. No puede ser copiado, solo movido. Se destruye automáticamente cuando sale de su alcance.
- **std::shared_ptr**: Permite la propiedad compartida de un recurso. Utiliza un contador de referencias para determinar cuándo el recurso puede ser destruido.
- **std::weak_ptr**: Observa un recurso gestionado por un `shared_ptr` sin incrementar su contador de referencias, evitando ciclos de referencia.

Estos punteros inteligentes implementan el principio RAII (Resource Acquisition Is Initialization), donde la adquisición y liberación de recursos se gestionan automáticamente con el ciclo de vida del objeto.


''',
    'code_example': '''
#include <iostream>
#include <memory>

void ejemplo_unique_ptr() {
  std::unique_ptr<int> ptr(new int(10));
  std::cout << "Valor: " << *ptr << std::endl;
  // ptr se destruye automáticamente al salir del alcance
}

void ejemplo_shared_ptr() {
  std::shared_ptr<int> ptr1 = std::make_shared<int>(20);
  std::shared_ptr<int> ptr2 = ptr1; // ptr1 y ptr2 comparten la propiedad
  std::cout << "Valor: " << *ptr1 << ", Contador de referencias: " << ptr1.use_count() << std::endl;
  // ptr1 y ptr2 se destruyen automáticamente cuando ambos salen del alcance
}

void ejemplo_weak_ptr() {
  std::shared_ptr<int> ptr1 = std::make_shared<int>(30);
  std::weak_ptr<int> ptr2 = ptr1; // ptr2 observa ptr1 sin incrementar el contador de referencias
  if (auto spt = ptr2.lock()) { // Intenta obtener un shared_ptr
    std::cout << "Valor: " << *spt << std::endl;
  } else {
    std::cout << "El recurso ya ha sido destruido." << std::endl;
  }
}

int main() {
  ejemplo_unique_ptr();
  ejemplo_shared_ptr();
  ejemplo_weak_ptr();
  return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 4,
    'tittle_level': 'Manejo Avanzado de Memoria',
    'topic': 'Punteros Inteligentes y RAII',
    'subtopic': 'Gestión de Recursos con RAII',
    'definition': '''
RAII (Resource Acquisition Is Initialization) es un patrón de diseño en C++ que garantiza la liberación automática de recursos cuando un objeto sale de su alcance. Este patrón es fundamental para la gestión de memoria y otros recursos como archivos o mutexes.

En C++, los punteros inteligentes implementan RAII al gestionar la vida de los objetos dinámicamente asignados. Por ejemplo, un `std::unique_ptr` libera automáticamente la memoria cuando el objeto al que apunta sale de su alcance, evitando fugas de memoria.

''',
    'code_example': '''
#include <iostream>
#include <memory>

class Recurso {
public:
  Recurso() { std::cout << "Recurso adquirido." << std::endl; }
  ~Recurso() { std::cout << "Recurso liberado." << std::endl; }
};

void ejemplo_RAII() {
  std::unique_ptr<Recurso> ptr(new Recurso());
  // El recurso se libera automáticamente cuando ptr sale de su alcance
}

int main() {
  ejemplo_RAII();
  return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 4,
    'tittle_level': 'Manejo Avanzado de Memoria',
    'topic': 'Punteros Inteligentes y RAII',
    'subtopic': 'Ciclo de Vida de Objetos',
    'definition': '''
El ciclo de vida de un objeto en C++ se refiere a su creación, uso y destrucción. Los punteros inteligentes gestionan este ciclo de vida automáticamente, asegurando que los recursos se liberen cuando ya no son necesarios.

Por ejemplo, un `std::shared_ptr` mantiene un contador de referencias que asegura que el objeto al que apunta se destruya cuando ya no haya punteros que lo referencien.

''',
    'code_example': '''
#include <iostream>
#include <memory>

void ejemplo_shared_ptr() {
  std::shared_ptr<int> ptr1 = std::make_shared<int>(100);
  std::cout << "Valor: " << *ptr1 << std::endl;
  {
    std::shared_ptr<int> ptr2 = ptr1; // ptr2 comparte la propiedad
    std::cout << "Valor: " << *ptr2 << ", Contador de referencias: " << ptr2.use_count() << std::endl;
  }
  // ptr2 sale de su alcance, el contador de referencias disminuye
  std::cout << "Contador de referencias: " << ptr1.use_count() << std::endl;
  // El recurso se libera automáticamente cuando ptr1 sale de su alcance
}

int main() {
  ejemplo_shared_ptr();
  return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 4,
    'tittle_level': 'Manejo Avanzado de Memoria',
    'topic': 'Gestión de Recursos Personalizada',
    'subtopic': 'Allocators Personalizados',
    'definition': '''
Cuando trabajamos con C++, la forma en que se gestiona la memoria puede tener un impacto gigante en el rendimiento y la eficiencia de nuestras aplicaciones. Los allocators personalizados nos permiten tomar el control total sobre cómo y dónde se asigna la memoria, en lugar de depender siempre del sistema por defecto.

¿Te preguntas para qué querrías complicarte la vida con esto? Pues, piensa en aplicaciones donde la asignación y liberación de memoria es tan frecuente que usar el allocator estándar se vuelve un cuello de botella. En esos casos, un allocator a medida puede optimizar el uso de memoria y acelerar la ejecución.

Un allocator personalizado es una clase que define cómo asignar, liberar y gestionar bloques de memoria. Puedes optimizar patrones específicos de uso, reutilizar memoria, mejorar la localización de datos en caché o implementar técnicas específicas para tu aplicación. Por ejemplo, juegos como Unreal Engine o motores gráficos suelen usar allocators personalizados para maximizar el rendimiento en escenarios con muchísima gestión de objetos dinámicos.
  ''',
    'code_example': r'''
#include <memory>
#include <iostream>
#include <vector>

// Allocator personalizado simple que usa un buffer estático
template <typename T, std::size_t Size>
struct SimpleAllocator {
    using value_type = T;

    SimpleAllocator() = default;

    T* allocate(std::size_t n) {
        std::cout << "Asignando " << n << " objetos.\n";
        return static_cast<T*>(::operator new(n * sizeof(T)));
    }

    void deallocate(T* p, std::size_t n) {
        std::cout << "Liberando " << n << " objetos.\n";
        ::operator delete(p);
    }
};

int main() {
    std::vector<int, SimpleAllocator<int, 10>> vec;
    vec.push_back(42);
    std::cout << "Valor guardado: " << vec[0] << std::endl;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 4,
    'tittle_level': 'Manejo Avanzado de Memoria',
    'topic': 'Gestión de Recursos Personalizada',
    'subtopic': 'Pool de Memoria',
    'definition': '''
Vamos a ver de qué se trata todo esto de los pools de memoria. Básicamente, un pool de memoria es un bloque grande de memoria preasignada que se divide en partes más pequeñas para su reutilización. Esto evita la fragmentación frecuente y mejora el rendimiento al reducir la cantidad de llamadas al sistema para asignar y liberar memoria.

¿Por qué esto importa? En sistemas con muchas operaciones de memoria dinámica, hacer llamadas constantes a `new` y `delete` puede ser muy costoso. Un pool nos permite administrar un conjunto de bloques de memoria y reciclarlos, lo que significa que la asignación y liberación se vuelven mucho más rápidas y predecibles.

Este método es muy usado en juegos, servidores y sistemas embebidos donde la latencia y el control sobre la memoria son clave. Además, implementar un pool es un buen ejercicio para entender mejor la gestión de memoria a bajo nivel.
''',
    'code_example': r'''
#include <iostream>

class MemoryPool {
    static const int POOL_SIZE = 1024;
    char pool[POOL_SIZE];
    bool used[POOL_SIZE] = {false};

public:
    void* allocate(size_t size) {
        for (int i = 0; i < POOL_SIZE - size; ++i) {
            bool freeBlock = true;
            for (size_t j = 0; j < size; ++j) {
                if (used[i + j]) {
                    freeBlock = false;
                    break;
                }
            }
            if (freeBlock) {
                for (size_t j = 0; j < size; ++j) {
                    used[i + j] = true;
                }
                return &pool[i];
            }
        }
        return nullptr; // No hay espacio libre
    }

    void deallocate(void* ptr, size_t size) {
        size_t offset = static_cast<char*>(ptr) - pool;
        for (size_t i = offset; i < offset + size; ++i) {
            used[i] = false;
        }
    }
};

int main() {
    MemoryPool pool;
    void* p1 = pool.allocate(10);
    if (p1) {
        std::cout << "Memoria asignada con pool\n";
        pool.deallocate(p1, 10);
    } else {
        std::cout << "No hay memoria disponible\n";
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 4,
    'tittle_level': 'Manejo Avanzado de Memoria',
    'topic': 'Gestión de Recursos Personalizada',
    'subtopic': 'Técnicas de Optimización de Memoria',
    'definition': '''
La optimización del uso de memoria es un punto crucial en aplicaciones que requieren alto rendimiento o tienen recursos limitados. Vamos a ver algunas técnicas para manejar mejor la memoria y hacer que tu programa sea más eficiente.

¿No te ha pasado que tu app se vuelve lenta o consume más memoria de la necesaria? Bueno, muchas veces esto se debe a una mala gestión de memoria o a asignaciones innecesarias. Técnicas como el uso de allocators personalizados, pools de memoria, uso inteligente de la pila frente al heap, y evitar fragmentación pueden marcar la diferencia.

Entre las técnicas más comunes están:
- Reutilización de memoria mediante pools
- Minimización de copias y movimientos de objetos
- Uso adecuado de punteros inteligentes para controlar ciclos de vida
- Alineación y agrupamiento de datos para mejorar la caché

Optimizar memoria no es solo para aplicaciones enormes, sino que también mejora la estabilidad y velocidad de cualquier programa.
''',
    'code_example': r'''
#include <iostream>
#include <vector>
#include <memory>

void optimizacion_basica() {
    std::vector<int> v;
    v.reserve(1000); // Reservar memoria evita reallocaciones frecuentes
    for(int i = 0; i < 1000; ++i) {
        v.push_back(i);
    }
    std::cout << "Vector tamaño: " << v.size() << std::endl;
}

int main() {
    optimizacion_basica();
    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 3,
    'tittle_level': 'Programación Orientada a Objetos Avanzada',
    'topic': 'Diagnóstico y Depuración de Memoria',
    'subtopic': 'Herramientas como Valgrind y AddressSanitizer',
    'definition': '''
El manejo de memoria en C++ es una de sus mayores fortalezas, pero también una de sus mayores fuentes de problemas si no se hace correctamente. Errores como acceder a memoria no válida, fugas de memoria o usar memoria después de liberarla (use-after-free) pueden ser increíblemente difíciles de detectar. Aquí es donde entran herramientas poderosísimas como Valgrind y AddressSanitizer. Son como superhéroes que escanean tu código en tiempo de ejecución para encontrar estos errores ocultos de memoria.

Seguramente pensarás de qué va todo esto si ya eres cuidadoso con `new` y `delete`. La verdad es que incluso los programadores más experimentados cometen errores de memoria porque son muy sutiles y a menudo no causan un "crash" inmediato, sino un comportamiento errático mucho después.

Valgrind es una suite de herramientas de depuración y perfilado. Memcheck, su herramienta más conocida, es fantástica para detectar una amplia gama de errores de memoria, incluyendo:
* **Fugas de memoria**: cuando asignas memoria pero nunca la liberas.
* **Accesos a memoria no inicializada**: usar valores basura que pueden llevar a comportamientos impredecibles.
* **Lecturas/escrituras fuera de límites**: acceder a un array más allá de su tamaño.
* **Uso de memoria después de ser liberada (use-after-free)**: intentar acceder a una zona de memoria que ya ha sido devuelta al sistema.

Valgrind instrumenta tu programa, lo que significa que lo ejecuta en un entorno virtualizado y monitorea todas las operaciones de memoria. Esto lo hace muy preciso, pero también ralentiza la ejecución de tu programa considerablemente.

AddressSanitizer (ASan), por otro lado, es una herramienta de detección de errores de memoria más moderna, desarrollada por Google y ahora integrada en compiladores como GCC y Clang. A diferencia de Valgrind, ASan no interpreta tu código; en su lugar, el compilador inserta instrumentación directamente en tu ejecutable. Esto hace que sea mucho más rápido que Valgrind (generalmente ralentiza tu programa solo por un factor de 2x) y es ideal para usar en CI/CD o incluso en producción con un overhead manejable. ASan detecta errores similares a Memcheck, pero su enfoque basado en el compilador lo hace especialmente bueno para errores de "use-after-free" y "heap-buffer-overflow". Ambas herramientas son indispensables para cualquier desarrollador de C++ serio que quiera asegurar la robustez y estabilidad de sus aplicaciones.
''',
    'code_example': r'''
#include <iostream>
#include <vector>
#include <memory> // Para std::unique_ptr

// Ejemplo de código con errores de memoria
void demonstrate_memory_errors() {
    // 1. Fuga de memoria (Memory Leak)
    int* leaked_ptr = new int(10);
    // delete leaked_ptr; // Olvidamos liberar la memoria

    // 2. Acceso fuera de límites (Out-of-bounds access)
    std::vector<int> my_vec(5);
    // my_vec[5] = 10; // Acceso fuera de límites (válido de 0 a 4)

    // 3. Uso de memoria después de liberarla (Use-after-free)
    int* dangling_ptr = new int(20);
    delete dangling_ptr;
    // *dangling_ptr = 30; // Acceso a memoria liberada

    // 4. Doble liberación (Double Free)
    int* double_free_ptr = new int(40);
    delete double_free_ptr;
    // delete double_free_ptr; // Liberar dos veces la misma memoria

    // Para ejecutar esto con Valgrind:
    // g++ -g your_code.cpp -o your_code
    // valgrind --leak-check=full ./your_code

    // Para ejecutar con AddressSanitizer (GCC/Clang):
    // g++ -fsanitize=address -g your_code.cpp -o your_code
    // ./your_code
}

int main() {
    demonstrate_memory_errors();
    std::cout << "Programa finalizado." << std::endl;
    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 3,
    'tittle_level': 'Programación Orientada a Objetos Avanzada',
    'topic': 'Diagnóstico y Depuración de Memoria',
    'subtopic': 'Detección de Fugas de Memoria',
    'definition': '''
Las fugas de memoria, o "memory leaks", son como pequeños fantasmas en tu programa que, con el tiempo, se van comiendo toda la memoria disponible hasta que tu aplicación (o incluso todo el sistema) se vuelve lenta o se cuelga. Suceden cuando tu programa asigna memoria dinámicamente (con `new` en C++, por ejemplo) pero olvida liberarla (con `delete`). Esa memoria queda "perdida" porque el programa ya no tiene una referencia a ella y el sistema operativo no puede recuperarla hasta que el programa termina.

¿Te estás preguntando por qué esto es tan problemático si tu programa no se cae de inmediato? Bueno, en aplicaciones de larga ejecución, como servidores o videojuegos, una fuga de memoria puede causar una degradación gradual del rendimiento que es muy difícil de diagnosticar para los usuarios, o puede llevar a un colapso total después de horas o días de uso.

La detección de fugas de memoria es un arte y una ciencia. La primera línea de defensa es, por supuesto, el **uso inteligente de los punteros inteligentes** en C++ (`std::unique_ptr`, `std::shared_ptr`). Estos objetos gestionan automáticamente la liberación de memoria cuando ya no se necesitan, haciendo que las fugas de memoria sean mucho menos probables. Si usas punteros crudos, la responsabilidad de `delete` recae totalmente en ti.

Más allá de las buenas prácticas de codificación, existen herramientas especializadas que son salvavidas. **Valgrind con su herramienta Memcheck** es el estándar de oro en Linux para esto. Ejecutas tu programa bajo Valgrind, y al finalizar, te dará un informe detallado de cualquier bloque de memoria asignado que nunca fue liberado, indicando incluso dónde se asignó. **AddressSanitizer (ASan)**, integrado en GCC y Clang, también puede detectar fugas de memoria, especialmente las más obvias, aunque su enfoque principal es la detección de errores de acceso a memoria. En Windows, herramientas como **Dr. Memory** (basado en el motor de Valgrind) o el depurador de **Visual Studio** con sus herramientas de diagnóstico de memoria son muy útiles. La clave es integrar estas herramientas en tu ciclo de desarrollo, ejecutándolas regularmente para atrapar las fugas antes de que lleguen a producción y se conviertan en un dolor de cabeza gigante.
''',
    'code_example': r'''
#include <iostream>
#include <memory> // Para std::unique_ptr

// Función que crea una fuga de memoria
void create_leak() {
    int* data = new int[10]; // Se asignan 10 enteros
    // No se llama a 'delete[] data;' aquí.
    // La memoria 'data' se fuga al salir de esta función.
    std::cout << "Memoria asignada y fugada intencionalmente." << std::endl;
}

// Función que usa punteros inteligentes para evitar fugas
void avoid_leak_with_smart_ptr() {
    // std::unique_ptr se encarga de liberar la memoria automáticamente
    std::unique_ptr<int[]> data = std::make_unique<int[]>(10);
    std::cout << "Memoria asignada y gestionada por unique_ptr." << std::endl;
    // 'data' se libera automáticamente cuando sale del alcance.
}

int main() {
    std::cout << "Iniciando prueba de fugas de memoria..." << std::endl;

    create_leak(); // Esto causará una fuga de memoria

    // Para ver esta fuga con Valgrind:
    // g++ -g your_program.cpp -o your_program
    // valgrind --leak-check=full --show-leak-kinds=all ./your_program

    avoid_leak_with_smart_ptr(); // Esto no causará una fuga de memoria

    std::cout << "Prueba finalizada." << std::endl;

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 3,
    'tittle_level': 'Programación Orientada a Objetos Avanzada',
    'topic': 'Diagnóstico y Depuración de Memoria',
    'subtopic': 'Análisis de Uso de Memoria',
    'definition': '''
Más allá de encontrar fugas de memoria, entender cómo tu programa usa la memoria es vital para la optimización y la estabilidad. El análisis de uso de memoria no solo busca errores, sino que te ayuda a identificar patrones de consumo de memoria, a optimizar el rendimiento de la caché, y a reducir la huella de memoria de tu aplicación. Es decir, te permite ver cuánto y cómo se están usando tus valiosos bytes de RAM.

Vamos a ver de qué se trata todo esto. ¿Alguna vez has notado que una aplicación se vuelve lenta con el tiempo o consume una cantidad de RAM que no parece lógica? Eso puede ser señal de un uso ineficiente de la memoria, no necesariamente una fuga.

El análisis de uso de memoria implica entender dónde se asigna la memoria, qué tan grande es, por cuánto tiempo se retiene, y cómo se accede a ella. Herramientas como **Valgrind con Massif** (para heap profiling) o **DHAT** (otra herramienta de Valgrind), y los **perfiladores de memoria integrados en IDEs como Visual Studio o CLion**, son tus mejores amigos aquí.

Massif, por ejemplo, te muestra un gráfico del consumo total de memoria de tu aplicación a lo largo del tiempo, y lo que es más importante, un desglose de dónde se está asignando esa memoria (qué funciones o líneas de código son las "culpables"). Esto es invaluable para identificar si tienes estructuras de datos que crecen demasiado, si estás cargando en memoria más de lo necesario, o si tus algoritmos están creando demasiados objetos temporales.

Las herramientas de análisis de memoria también pueden ayudarte a optimizar la localidad de los datos. Pensemos por un momento en cómo funcionan los caches de la CPU: acceder a datos que están cerca en memoria es mucho más rápido que acceder a datos dispersos. Un buen análisis de memoria puede revelar si tus estructuras de datos están organizadas de una manera que favorece (o perjudica) el rendimiento de la caché. Al comprender y actuar sobre estos insights, puedes hacer que tus programas C++ no solo sean más estables, sino también significativamente más rápidos y eficientes en el uso de recursos, lo cual es crítico en sistemas con limitaciones de hardware o en aplicaciones de alto rendimiento.
''',
    'code_example': r'''
#include <iostream>
#include <vector>
#include <map>
#include <string>

// Función que simula un uso de memoria ineficiente
void create_inefficient_memory_use() {
    // Un vector que crece dinámicamente y puede reubicarse muchas veces
    std::vector<int> large_vector;
    large_vector.reserve(100000); // Pre-reservar mejora, pero sin ella, reasignaría mucho
    for (int i = 0; i < 100000; ++i) {
        large_vector.push_back(i);
    }

    // Un mapa que almacena muchas cadenas, lo que puede fragmentar la memoria
    std::map<int, std::string> string_map;
    for (int i = 0; i < 10000; ++i) {
        string_map[i] = "Esta es una cadena de ejemplo para el mapa " + std::to_string(i);
    }

    std::cout << "Simulando uso de memoria ineficiente." << std::endl;
    // La memoria de large_vector y string_map se libera al salir de la función,
    // pero el patrón de asignación puede ser ineficiente durante la ejecución.
}

int main() {
    std::cout << "Iniciando análisis de uso de memoria..." << std::endl;

    create_inefficient_memory_use();

    // Para perfilar el uso de memoria con Valgrind/Massif:
    // g++ -g your_program.cpp -o your_program
    // valgrind --tool=massif ./your_program
    // ms_print massif.out.<pid> > massif_report.txt
    // (Luego revisa 'massif_report.txt' para ver el pico de uso de memoria y los call stacks)

    std::cout << "Análisis finalizado." << std::endl;

    return 0;
}
'''
  });
}

Future<void> insertSrLevel5DataCpp(Database db) async {
  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Desarrollo de Bibliotecas y Frameworks',
    'topic': 'Creación de Bibliotecas Reutilizables',
    'subtopic': 'Diseño de APIs Estables',
    'definition': '''
Cuando hablamos de bibliotecas reutilizables, el diseño de una API clara y estable es lo primero que debería estar en tu radar. Una buena API es como una promesa: debe ser fácil de entender, consistente en su comportamiento y mantenerse en el tiempo sin romper el código de quienes la usan.

¿Te estás preguntando por qué esto importa tanto? Bueno, imagina que alguien construye su app encima de tu biblioteca. Si decides cambiar cómo funcionan tus funciones o clases sin avisar, puedes romperle todo. Literalmente. Por eso, diseñar con estabilidad en mente desde el inicio es clave.

Algunos principios esenciales son:
- Define funciones y estructuras con propósitos claros.
- No expongas más de lo necesario: mantén detalles internos ocultos.
- Usa nombres coherentes y bien pensados.
- Piensa en el futuro: ¿podrás extender esta API sin romperla?

Grandes bibliotecas como STL en C++ han sobrevivido tanto tiempo justamente por ese compromiso con la estabilidad y la claridad. Si diseñas tu API pensando en el usuario y en la mantenibilidad, ya estás un paso adelante.
''',
    'code_example': r'''
// Interfaz pública bien diseñada
class Logger {
public:
    void log(const std::string& message);
    void setLevel(int level);
private:
    int currentLevel;
};

// Interfaz mal diseñada
class LoggerV2 {
public:
    void lol(const std::string&); // nombre poco claro
    void foo(int);                // sin contexto ni documentación
};
  ''',
  });
  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Desarrollo de Bibliotecas y Frameworks',
    'topic': 'Creación de Bibliotecas Reutilizables',
    'subtopic': 'Control de Versiones Semántico',
    'definition': '''
El control de versiones semántico (o SemVer) no es solo un sistema de numeritos. Es una forma de comunicar claramente los cambios en tu biblioteca a quienes la usan. Básicamente, dice qué tan seguro es actualizar de una versión a otra.

Vamos a ver de qué se trata todo esto...

SemVer funciona con tres números: MAJOR.MINOR.PATCH. Por ejemplo, 2.3.1:
- Si cambias el primer número (2 → 3), significa que hay cambios incompatibles.
- El segundo número (3) sube cuando agregas funcionalidades sin romper nada.
- El tercero (1) indica correcciones o mejoras pequeñas.

Esto ayuda a los usuarios de tu biblioteca a decidir si deben actualizar, y qué riesgos hay al hacerlo. Por ejemplo, si pasas de la 1.2.0 a la 1.3.0, deberían poder hacerlo sin miedo. Pero si vas de la 1.x.x a la 2.0.0, es mejor leer el changelog con cuidado.

Usar SemVer muestra profesionalismo y respeto por quienes integran tu código en sus proyectos.
''',
    'code_example': r'''
// Versión actual de la biblioteca
#define LIBRARY_VERSION "1.2.3"

// Ejemplo de cambio de versión
// v1.2.3 → v2.0.0  (cambio incompatible)

// Changelog típico:
/*
  [2.0.0] - Se eliminó la función `legacyParse`
           - Se renombró `Logger::logToFile` a `Logger::writeToFile`
  [1.3.0] - Se agregó `Logger::setFormat`
  [1.2.4] - Se corrigió bug en `Logger::log`
*/
  ''',
  });
  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Desarrollo de Bibliotecas y Frameworks',
    'topic': 'Creación de Bibliotecas Reutilizables',
    'subtopic': 'Documentación y Ejemplos de Uso',
    'definition': '''
Una biblioteca sin documentación es como una caja sin etiquetas: podrías tener algo útil adentro, pero nadie sabrá cómo usarlo. La documentación y los ejemplos no son opcionales si quieres que tu biblioteca sea adoptada por otros.

No sé tú, pero a mí esto al principio me costó 🤯. Escribir código es divertido; escribir sobre ese código, no tanto... pero es lo que realmente marca la diferencia.

Una buena documentación incluye:
- Qué hace cada clase o función.
- Qué parámetros acepta y qué retorna.
- Qué casos de uso resuelve.
- Ejemplos reales de cómo se integra con otros proyectos.

Los ejemplos de uso, además, muestran tu código en acción. Es la mejor forma de enseñar sin explicar tanto. GitHub, por ejemplo, valora mucho los proyectos que incluyen README completos, diagramas o incluso tutoriales paso a paso.

Si usas herramientas como Doxygen, puedes generar documentación directamente desde los comentarios del código. Una pequeña inversión que te ahorra muchas preguntas en el futuro.
''',
    'code_example': r'''
// Comentario para Doxygen
/**
 * Clase para gestionar logs.
 * Permite escribir mensajes a consola o archivo.
 */
class Logger {
public:
    /**
     * Escribe un mensaje en el log.
     * @param message El texto a registrar.
     */
    void log(const std::string& message);
};

// Ejemplo de uso en un README.md
/*
#include "Logger.h"

int main() {
    Logger logger;
    logger.log("Inicio del programa");
    return 0;
}
*/
  ''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Desarrollo de Bibliotecas y Frameworks',
    'topic': 'Integración y Distribución',
    'subtopic': 'Sistemas de Build como CMake',
    'definition': '''
Cuando los proyectos crecen y ya no son solo un archivo .cpp, llega el momento de automatizar el proceso de compilación. Ahí es donde entra CMake, una herramienta que te permite definir cómo construir tu proyecto sin preocuparte por detalles específicos del sistema operativo o del compilador.

¿Te estás preguntando por qué no usar simplemente Make o compilar a mano? Claro, eso sirve al principio, pero cuando tienes que compilar en Linux, Windows y macOS, con diferentes configuraciones, compilar “a lo manual” se vuelve insostenible.

CMake te permite escribir un archivo `CMakeLists.txt` con toda la lógica de construcción: qué archivos usar, qué bibliotecas incluir, qué versiones exigir. Luego, genera automáticamente los archivos que el sistema de construcción del entorno necesite (Makefiles, proyectos de Visual Studio, etc.).

Una de sus mayores ventajas es su compatibilidad con proyectos grandes y su facilidad para integrarse con herramientas modernas como vcpkg o Conan. Si estás pensando en distribuir tu biblioteca de forma profesional, dominar CMake no es opcional.
''',
    'code_example': r'''
// CMakeLists.txt simple para una biblioteca
cmake_minimum_required(VERSION 3.10)
project(MyLibrary)

add_library(MyLibrary SHARED Logger.cpp Logger.h)
target_include_directories(MyLibrary PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

// En consola:
// mkdir build && cd build
// cmake ..
// cmake --build .
  ''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Desarrollo de Bibliotecas y Frameworks',
    'topic': 'Integración y Distribución',
    'subtopic': 'Gestión de Paquetes con Conan y vcpkg',
    'definition': '''
En el mundo moderno del desarrollo, depender de bibliotecas externas es casi inevitable. Pero descargarlas, compilarlas y mantenerlas manualmente... suena a pesadilla. Por suerte existen gestores de paquetes como **Conan** y **vcpkg** que te salvan de ese caos.

Vamos a ver de qué se trata todo esto...

Conan y vcpkg te permiten instalar bibliotecas con una sola línea de comando, con sus dependencias resueltas automáticamente. Además, se integran fácilmente con CMake, lo que hace que incluir algo como Boost o fmt sea cuestión de segundos.

¿Diferencias clave?
- Conan es más flexible y multiplataforma, ideal para entornos complejos.
- vcpkg es más sencillo de usar, especialmente en proyectos con Visual Studio.

Ambas opciones mejoran muchísimo la mantenibilidad y portabilidad de tus proyectos. Si estás pensando en distribuir tu propia biblioteca, también puedes crear tus propios paquetes y compartirlos con la comunidad o dentro de tu equipo.
''',
    'code_example': r'''
# Usando Conan para instalar fmt
conan install fmt/9.1.0@

# Usando vcpkg para instalar fmt
vcpkg install fmt

# Integración con CMake usando vcpkg
# En tu CMakeLists.txt
find_package(fmt CONFIG REQUIRED)
target_link_libraries(MyApp PRIVATE fmt::fmt)
  ''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Desarrollo de Bibliotecas y Frameworks',
    'topic': 'Integración y Distribución',
    'subtopic': 'Distribución en Repositorios Públicos',
    'definition': '''
Crear una buena biblioteca es solo el primer paso. El verdadero impacto ocurre cuando la compartes con el mundo, y para eso están los repositorios públicos. Ya sea en GitHub, GitLab o Bitbucket, distribuir tu código es una forma poderosa de colaborar, recibir feedback y aportar a la comunidad.

Seguramente pensarás: “¿Pero qué tan difícil puede ser subir mi repo a GitHub?”. Técnicamente es sencillo, pero distribuir bien una biblioteca va más allá de hacer un `git push`. Implica:
- Escribir un README claro y útil.
- Tener una estructura de carpetas coherente.
- Versionado semántico.
- Documentación y ejemplos.
- Tal vez un script de instalación o integración con Conan/vcpkg.

Si además publicas tu biblioteca en repos públicos como el Center de Conan o el registry de vcpkg, cualquiera podrá instalarla con una sola línea. Eso sí que es comodidad.

Al final, compartir tu trabajo puede abrirte muchas puertas: colaboraciones, ofertas de trabajo e incluso reconocimiento dentro del ecosistema C++.
''',
    'code_example': r'''
// Estructura típica de una biblioteca lista para publicar
MyLibrary/
├── include/
│   └── MyLibrary/
│       └── Logger.h
├── src/
│   └── Logger.cpp
├── CMakeLists.txt
├── README.md
├── conanfile.py  // para Conan
├── LICENSE
└── .gitignore

// README.md puede incluir:
# MyLibrary
Una biblioteca para gestión de logs.
#include <MyLibrary/Logger.h>
Logger log;
log.log("Hola mundo");
   ''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Desarrollo de Bibliotecas y Frameworks',
    'topic': 'Testing y Mantenimiento',
    'subtopic': 'Pruebas Unitarias con Google Test y Catch2',
    'definition': '''
Tener una biblioteca sin pruebas unitarias es como construir un puente sin hacer cálculos. Puede parecer que todo funciona… hasta que algo se rompe y no sabes por qué. Para eso existen frameworks como **Google Test** y **Catch2**, que facilitan escribir y mantener tests automáticos.

¿Te preguntas si vale la pena? Créeme, lo vale. Especialmente cuando otros empiecen a usar tu código y esperen que se comporte igual cada vez.

Google Test es uno de los más usados: bien documentado, potente y con integración en muchos IDEs. Catch2, por otro lado, tiene una sintaxis más simple y amigable, ideal para empezar rápido. Ambos permiten verificar que tus funciones hacen lo que deben, incluso cuando las condiciones cambian o los inputs no son los esperados.

La clave es empezar con lo esencial: probar las funciones críticas, validar casos límite, y automatizar esas pruebas. Así, cada vez que hagas cambios, tendrás la tranquilidad de que no rompiste nada sin darte cuenta.
''',
    'code_example': r'''
// Ejemplo con Google Test
#include <gtest/gtest.h>
#include "MathUtils.h"

TEST(MathUtilsTest, AddsCorrectly) {
    EXPECT_EQ(add(2, 3), 5);
}

// Ejemplo con Catch2
#define CATCH_CONFIG_MAIN
#include <catch2/catch.hpp>
#include "MathUtils.h"

TEST_CASE("Addition works", "[math]") {
    REQUIRE(add(2, 3) == 5);
}
  ''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Desarrollo de Bibliotecas y Frameworks',
    'topic': 'Testing y Mantenimiento',
    'subtopic': 'Integración Continua',
    'definition': '''
Cada vez que haces cambios a tu biblioteca, existe el riesgo de introducir errores. Y si varias personas trabajan contigo, ese riesgo se multiplica. Ahí es donde entra la **Integración Continua (CI)**, una práctica que automatiza la validación del código nuevo cada vez que se sube al repositorio.

¿Seguramente estás pensando: más trabajo, más configuraciones…? Bueno, al principio sí. Pero una vez que lo configuras, todo el equipo se beneficia. Con una buena pipeline de CI, puedes compilar tu proyecto, correr los tests, verificar estilo de código, y hasta publicar paquetes… todo automáticamente.

Herramientas como **GitHub Actions**, **GitLab CI**, o **Jenkins** permiten definir workflows que se ejecutan cada vez que haces un push o un pull request. Esto te ayuda a detectar errores antes de que lleguen a producción, y te asegura que tu código se mantiene en buen estado, incluso con el paso del tiempo.

Una biblioteca que usa CI transmite confianza. Y en el ecosistema open source, eso es oro puro.
''',
    'code_example': r'''
# .github/workflows/build.yml (GitHub Actions)

name: Build & Test

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Configurar CMake
        run: cmake -S . -B build
      - name: Compilar
        run: cmake --build build
      - name: Ejecutar Tests
        run: ./build/tests
  ''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 5,
    'title_level': 'Desarrollo de Bibliotecas y Frameworks',
    'topic': 'Testing y Mantenimiento',
    'subtopic': 'Mantenimiento y Soporte de Bibliotecas',
    'definition': '''
Crear una biblioteca es solo el comienzo. El verdadero reto está en mantenerla útil y funcional con el paso del tiempo. El mantenimiento incluye corregir errores, mejorar el rendimiento, actualizar dependencias y escuchar a quienes la usan.

Seguramente pensarás que eso suena a trabajo infinito... y en parte lo es. Pero también es una oportunidad para mejorar constantemente y construir una comunidad a tu alrededor.

El soporte implica responder issues, revisar pull requests y estar atento a las nuevas versiones del lenguaje o de otras bibliotecas relacionadas. ¿Un consejo? Automatiza todo lo que puedas (tests, builds, distribución), pero mantén siempre una actitud abierta a los aportes de otros.

Las bibliotecas que más perduran son las que se mantienen activas y bien cuidadas. Algunas como Boost o fmt llevan años evolucionando, justamente por tener un mantenimiento consistente y una base de usuarios comprometida.

Ser mantenedor también te obliga a escribir código claro, documentado y testeado. En otras palabras: te convierte en mejor programador.
''',
    'code_example': r'''
// Ejemplo de cambios de mantenimiento
// Antes
void log(std::string msg);

// Después, para mejorar eficiencia y evitar copias innecesarias
void log(const std::string& msg);

// Documentación del cambio (changelog)
/*
  [1.4.0] - Se actualizó la firma de log() para optimizar el rendimiento.
           - Deprecado log(std::string) en favor de log(const std::string&).
*/
  ''',
  });
}

Future<void> insertSrLevel6DataCpp(Database db) async {
  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Herramientas y Ecosistema de C++',
    'topic': 'Compiladores y Estándares',
    'subtopic': 'GCC, Clang, MSVC',
    'definition': '''
El ecosistema de C++ se sostiene sobre tres compiladores principales: GCC (GNU Compiler Collection), Clang (parte del proyecto LLVM) y MSVC (Microsoft Visual C++). Cada uno tiene sus fortalezas y contextos donde brilla más.

Si estás eligiendo un compilador, la decisión no es trivial. GCC es el más maduro y ampliamente soportado, Clang destaca por sus mensajes de error más claros y tiempos de compilación rápidos, mientras que MSVC se integra perfectamente con el ecosistema de Windows. 

GCC domina en entornos Linux y es la opción por defecto para muchos proyectos open source. Clang, desarrollado originalmente por Apple, se ha popularizado por su modularidad y se usa como base para herramientas de análisis estático. MSVC, aunque históricamente tenía un soporte estándar más lento, ha mejorado significativamente en los últimos años. Lo interesante es que estos compiladores a menudo se usan en conjunto para validar la portabilidad del código.
''',
    'code_example': '''
// Ejemplo de compilación con diferentes compiladores:
// GCC: g++ -std=c++20 -O2 main.cpp -o programa
// Clang: clang++ -std=c++20 -stdlib=libc++ main.cpp -o programa
// MSVC (Visual Studio): Configurar en propiedades del proyecto -> C++ -> Estándar del lenguaje
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Herramientas y Ecosistema de C++',
    'topic': 'Compiladores y Estándares',
    'subtopic': 'Estándares C++11, C++14, C++17, C++20, C++23',
    'definition': '''
C++ evoluciona a través de estándares publicados cada 3 años aproximadamente. Desde C++11 (antes conocido como C++0x), el lenguaje ha experimentado transformaciones significativas que han modernizado su sintaxis y capacidades.

Cuando trabajas con código legacy, es común encontrarte con diferencias notables entre versiones. C++11 introdujo características revolucionarias como auto, lambdas y smart pointers. C++14 y 17 fueron evoluciones incrementales, mientras que C++20 trajo conceptos, rangos y corrutinas. C++23, el estándar más reciente, completa muchas de estas características.

La adopción de estos estándares varía según el compilador y el proyecto. Empresas como Google y Microsoft tienen políticas específicas sobre qué versión usar. Por ejemplo, el código de Chromium tardó años en migrar completamente a C++11 debido a su enorme base de código y requisitos de estabilidad.
''',
    'code_example': '''
// Ejemplo de características por estándar:
// C++11: auto, ranged-for, lambdas
auto suma = [](int a, int b) { return a + b; };

// C++14: literales binarios, variables template
auto binary = 0b1010;

// C++17: structured bindings, std::optional
auto [x, y] = std::make_pair(1, 2);

// C++20: concepts, ranges, spaceship operator
template<typename T>
concept Integral = std::is_integral_v<T>;
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Herramientas y Ecosistema de C++',
    'topic': 'Compiladores y Estándares',
    'subtopic': 'Flags y Opciones de Compilación',
    'definition': '''
Las flags de compilación son el panel de control del compilador, permitiendo ajustar optimizaciones, advertencias y comportamiento del lenguaje. Dominarlas es esencial para desarrollo profesional.

Al principio puede parecer abrumador tanta opción, pero en la práctica un conjunto básico cubre la mayoría de necesidades. Flags como -Wall (habilitar todas las advertencias) o -O2 (optimización balanceada) deberían ser estándar en cualquier proyecto.

Las flags más útiles caen en varias categorías: control de estándar (-std=c++20), optimizaciones (-O3, -Os), generación de debug info (-g), y tratamiento de advertencias (-Werror para tratar warnings como errores). Proyectos grandes a menudo usan configuraciones personalizadas: Firefox, por ejemplo, compila con más de 200 flags específicas para equilibrar rendimiento y tamaño del binario.
''',
    'code_example': r'''
// Ejemplo de flags comunes y su efecto:

# Nivel de optimización (GCC/Clang):
-O0 # Sin optimización (debugging)
-O2 # Optimización balanceada (producción)
-O3 # Optimización agresiva (puede aumentar tamaño binario)

# Tratamiento de advertencias:
-Wall # Habilita las advertencias más comunes
-Wextra # Advertencias adicionales
-Werror # Convierte advertencias en errores

# Flags específicas para seguridad:
-fstack-protector-strong # Protección contra buffer overflows
-D_FORTIFY_SOURCE=2 # Chequeos adicionales en tiempo de ejecución

// Ejemplo de compilación con flags de seguridad:
// g++ -std=c++20 -O2 -Wall -Wextra -Werror -fstack-protector-strong main.cpp
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Herramientas y Ecosistema de C++',
    'topic': 'Análisis Estático y Dinámico',
    'subtopic': 'Herramientas como Cppcheck, Clang-Tidy',
    'definition': '''
El análisis estático es como tener un revisor de código disponible 24/7. Herramientas como Cppcheck y Clang-Tidy examinan tu código sin ejecutarlo, buscando patrones problemáticos, posibles bugs y violaciones de buenas prácticas.

Al principio puede parecer que estas herramientas generan demasiadas advertencias, pero con el tiempo te das cuenta que atrapan errores sutiles que podrían pasar desapercibidos en revisiones humanas. Cppcheck es excelente para detectar memory leaks y undefined behavior, mientras que Clang-Tidy, al estar basado en el AST de Clang, puede hacer verificaciones más sofisticadas de estilo y modernización de código.

Empresas como Google y Microsoft integran estas herramientas en sus pipelines de CI. Un caso interesante es el proyecto Chromium, donde Clang-Tidy ayuda a mantener la coherencia en millones de líneas de código. La clave está en configurarlas adecuadamente - empezar con las comprobaciones básicas e ir añadiendo reglas gradualmente.
''',
    'code_example': r'''
# Ejecución básica de herramientas:
cppcheck --enable=all --suppress=missingIncludeSystem .
clang-tidy --checks='-*,modernize-*' main.cpp -- -std=c++17

# Ejemplo de salida de Clang-Tidy:
warning: use auto when initializing with new [modernize-use-auto]
    std::string* str = new std::string("hello");
            ^
            auto

# Configuración en CMake:
find_program(CLANG_TIDY_EXE NAMES "clang-tidy")
if(CLANG_TIDY_EXE)
  set(CMAKE_CXX_CLANG_TIDY "${CLANG_TIDY_EXE}")
endif()
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Herramientas y Ecosistema de C++',
    'topic': 'Análisis Estático y Dinámico',
    'subtopic': 'Análisis de Código y Métricas',
    'definition': '''
Las métricas de código van más allá de encontrar bugs - miden la salud del software a largo plazo. Complejidad ciclomática, acoplamiento entre clases, profundidad de herencia y líneas de código por función son algunas de las métricas clave.

Estos números cuentan una historia sobre tu código. Una función con alta complejidad ciclomática probablemente sea difícil de mantener. Un módulo con alto acoplamiento será frágil ante cambios. Herramientas como SonarQube o Understand C++ proporcionan dashboards visuales de estas métricas.

Un estudio de la NASA encontró que módulos con complejidad ciclomática mayor a 15 tenían significativamente más defectos. Muchas empresas establecen límites similares en sus guías de estilo. La clave está en usar estas métricas como indicadores, no como absolutos - a veces una función compleja está justificada, pero debería ser la excepción, no la regla.
''',
    'code_example': '''
# Ejemplo de métricas comunes y rangos recomendados:

- Complejidad ciclomática: 
  * 1-10: Simple (ideal)
  * 10-20: Moderada
  * 20+: Compleja (requiere revisión)

- Líneas de código por función:
  * 1-20: Ideal
  * 20-50: Aceptable
  * 50+: Demasiado larga

- Profundidad de herencia:
  * 1-2: Bueno
  * 3-4: Aceptable
  * 5+: Problema de diseño

# Herramientas para medir:
lizard -l cpp .  # Analiza complejidad ciclomática
metrix++ collect # Recolecta múltiples métricas
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Herramientas y Ecosistema de C++',
    'topic': 'Análisis Estático y Dinámico',
    'subtopic': 'Integración en el Proceso de Desarrollo',
    'definition': '''
Integrar análisis estático en tu flujo de trabajo es como añadir un sistema de seguridad continua a tu código. El enfoque más efectivo es aplicar estas herramientas en tres puntos: durante el desarrollo local, en commits/pull requests, y en el pipeline de CI/CD.

Muchos equipos cometen el error de activar todas las comprobaciones de golpe, lo que genera cientos de errores que nunca se arreglan. La estrategia correcta es incremental: empezar con las reglas más críticas, arreglar esos problemas, y luego añadir gradualmente más comprobaciones.

Proyectos como LLVM usan pre-commit hooks para ejecutar clang-format y clang-tidy antes de cada commit. En GitHub, acciones como `run-clang-tidy` pueden bloquear merges si encuentran problemas. La integración ideal es invisible cuando el código está bien escrito, pero atrapa errores temprano cuando no lo está.
''',
    'code_example': r'''
# Ejemplo de configuración en Git pre-commit hook (.git/hooks/pre-commit):
#!/bin/sh
set -e
clang-format -i --style=file $(git diff --cached --name-only -- '*.cpp' '*.h')
clang-tidy --fix $(git diff --cached --name-only -- '*.cpp' '*.h')

# Ejemplo de GitHub Action:
name: Lint
on: [push, pull_request]
jobs:
  clang-tidy:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - run: sudo apt-get install -y clang-tidy
    - run: clang-tidy --checks=* src/*.cpp -- -std=c++17

# Integración con CMake:
option(ENABLE_CLANG_TIDY "Enable clang-tidy" ON)
if(ENABLE_CLANG_TIDY)
  find_program(CLANG_TIDY_EXE clang-tidy)
  if(CLANG_TIDY_EXE)
    set(CMAKE_CXX_CLANG_TIDY "${CLANG_TIDY_EXE}")
  endif()
endif()
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Herramientas y Ecosistema de C++',
    'topic': 'Entornos de Desarrollo y Depuración',
    'subtopic': 'IDEs como Visual Studio, CLion',
    'definition': '''
El IDE adecuado puede marcar la diferencia entre una experiencia de desarrollo fluida y una lucha constante. Visual Studio (Windows) y CLion (multiplataforma) representan los entornos más completos para C++ moderno, cada uno con su enfoque particular.

Visual Studio ha evolucionado para ofrecer una de las experiencias más pulidas en Windows, con excelente soporte para CMake y herramientas de diagnóstico integradas. CLion, por su parte, destaca por su inteligente análisis de código en tiempo real y su consistencia entre plataformas. JetBrains, creadores de CLion, han llevado su experiencia en IDEs como IntelliJ al mundo C++.

Lo interesante es que muchos desarrolladores profesionales usan combinaciones: Visual Studio para desarrollo en Windows, CLion para proyectos multiplataforma, y a menudo VSCode como editor ligero complementario. La elección depende del sistema operativo, tipo de proyecto y preferencias personales de flujo de trabajo.
''',
    'code_example': '''
// Ejemplo de características clave por IDE:

// Visual Studio:
- IntelliSense avanzado
- Profiler integrado
- Excelente depurador visual
- Soporte nativo para proyectos MSBuild

// CLion:
- Análisis de código en tiempo real
- Soporte profundo para CMake
- Refactorizaciones seguras
- Integración con herramientas como Valgrind

// Configuración recomendada:
1. Habilitar clangd como backend de análisis
2. Configurar format-on-save
3. Personalizar atajos de teclado
4. Integrar con sistemas de control de versiones
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Herramientas y Ecosistema de C++',
    'topic': 'Entornos de Desarrollo y Depuración',
    'subtopic': 'Depuración con GDB y LLDB',
    'definition': '''
Dominar la depuración desde línea de comandos es una habilidad esencial cuando trabajas en entornos remotos o sistemas integrados. GDB (GNU Debugger) y LLDB (debugger de LLVM) ofrecen capacidades poderosas que van más allá de los depuradores gráficos.

A primera vista, la interfaz de comandos puede parecer intimidante, pero una vez que aprendes los comandos básicos, descubres que estos depuradores pueden hacer casi cualquier cosa: desde modificar variables en tiempo de ejecución hasta ejecutar scripts de depuración complejos. LLDB, siendo más moderno, tiene una sintaxis más limpia y mejor integración con Clang.

Un truco profesional poco conocido es usar Python para extender estos depuradores. Facebook, por ejemplo, ha desarrollado scripts personalizados para GDB que ayudan a depurar sus estructuras de datos internas. La capacidad de crear breakpoints condicionales y comandos personalizados puede ahorrar horas de depuración tediosa.
''',
    'code_example': r'''
# Comandos esenciales de GDB/LLDB:
break main.cpp:15       # Punto de interrupción en línea 15
run                     # Iniciar programa
next (n)                # Paso a paso por procedimiento
step (s)                # Paso a paso por instrucción
print variable          # Mostrar valor de variable
backtrace (bt)          # Mostrar pila de llamadas
watch variable          # Parar cuando variable cambie

# Ejemplo avanzado (LLDB):
(lldb) break set -n main -C "frame variable" -c "i < 5"
# Breakpoint que muestra variables y solo se activa cuando i < 5

# Depuración de memoria:
(lldb) memory read -t int -c 10 0x12345678
# Lee 10 enteros de la memoria en 0x12345678

# Integración con Python:
(lldb) script import lldb
(lldb) script print(lldb.frame.FindVariable("myVar").GetValue())
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Herramientas y Ecosistema de C++',
    'topic': 'Entornos de Desarrollo y Depuración',
    'subtopic': 'Perfiles de Rendimiento',
    'definition': '''
El profiling es el arte de encontrar cuellos de botella en tu código. Herramientas como perf (Linux), VTune (Intel) y los profilers integrados en Visual Studio te permiten ver exactamente dónde tu programa gasta tiempo y recursos.

Muchos desarrolladores adivinan qué partes del código optimizar, pero sin datos reales, estas optimizaciones a menudo son inefectivas. Un buen perfilado sigue el principio 80/20: usualmente el 80% del tiempo de ejecución se gasta en el 20% del código.

Técnicas como el muestreo estadístico (que perf implementa) tienen bajo overhead y pueden usarse en producción. Google, por ejemplo, ejecuta perf continuamente en sus servicios críticos para identificar regresiones de rendimiento. La clave está en enfocarse primero en los hotspots más significativos, optimizar, y luego volver a medir para validar la mejora.
''',
    'code_example': r'''
# Uso básico de perf (Linux):
perf record -g ./mi_programa  # Grabar perfil
perf report -n                # Mostrar resultados

# Ejemplo de salida:
# Overhead  Samples  Command  Shared Object  Symbol
#   58.34%    10234  mi_programa  mi_programa  [.] _Z9hot_func1v
#   23.12%     4056  mi_programa  mi_programa  [.] _Z9hot_func2v

# Uso de gprof:
g++ -pg -O2 mi_programa.cpp -o mi_programa
./mi_programa
gprof mi_programa gmon.out > analisis.txt

# Perfilado con callgrind (Valgrind):
valgrind --tool=callgrind ./mi_programa
kcachegrind callgrind.out.*  # Visualización gráfica

# Perfilado de memoria:
valgrind --tool=massif ./mi_programa
ms_print massif.out.* | less
'''
  });
}

Future<void> insertSrLevel7DataCpp(Database db) async {
  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 7,
    'title_level': 'Interoperabilidad y Lenguajes Mixtos',
    'topic': 'Interoperabilidad con C y Otros Lenguajes',
    'subtopic': 'Enlace con Código C',
    'definition': '''
La interoperabilidad entre C y C++ es fundamental dado que gran parte de las bibliotecas del sistema y muchas bibliotecas populares están escritas en C. C++ fue diseñado para ser compatible con C, pero hay diferencias importantes en el name mangling y la gestión de tipos que requieren atención.

Cuando mezclas código C y C++, el compilador necesita saber cómo manejar las funciones y estructuras de datos. El problema principal surge porque C++ realiza name mangling (decoración de nombres) para soportar sobrecarga de funciones, mientras que C no. Esto significa que si llamas directamente a una función C desde C++ sin preparación, el linker no podrá encontrar el símbolo.

La solución está en usar el enlace externo apropiado. Muchas bibliotecas populares como OpenSSL y SQLite usan este enfoque para ser accesibles tanto desde C como desde C++. Un detalle importante es que las estructuras de datos compartidas deben usar tipos compatibles y evitar características específicas de C++ como clases o templates.
''',
    'code_example': r'''
// Ejemplo de header compatible con C/C++ (ejemplo.h):
#ifdef __cplusplus
extern "C" {
#endif

// Declaraciones compatibles con C
void funcion_c(int parametro);
struct EstructuraSimple {
    int x;
    double y;
};

#ifdef __cplusplus
} // extern "C"
#endif

// Implementación en C (ejemplo.c):
#include "ejemplo.h"
void funcion_c(int parametro) {
    printf("Valor: %d\n", parametro);
}

// Uso desde C++ (main.cpp):
#include "ejemplo.h"
int main() {
    funcion_c(42); // Llamada correctamente vinculada
    EstructuraSimple s{1, 3.14}; // Inicialización C++
    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 7,
    'title_level': 'Interoperabilidad y Lenguajes Mixtos',
    'topic': 'Interoperabilidad con C y Otros Lenguajes',
    'subtopic': 'Uso de extern "C"',
    'definition': '''
La directiva extern "C" es el mecanismo fundamental para garantizar la interoperabilidad entre C y C++. Le indica al compilador C++ que no realice name mangling en las declaraciones especificadas, permitiendo que el linker encuentre los símbolos tal como fueron compilados en C.

Aunque la sintaxis parece simple, hay varios matices importantes. Por ejemplo, solo puedes usar extern "C" con funciones que sigan la convención de llamadas de C, lo que significa que no pueden ser métodos de clase o usar características específicas de C++ como sobrecarga o templates. También es común ver patrones de header guards combinados con extern "C" para crear headers que funcionen tanto en C como en C++.

Proyectos grandes como el kernel de Linux usan extensivamente este patrón para sus APIs exportadas. Un consejo profesional es agrupar todas las declaraciones que necesiten enlace C dentro de un solo bloque extern "C", en lugar de decorar cada función individualmente, lo que hace el código más mantenible.
''',
    'code_example': r'''
// Forma típica de usar extern "C" en un header:
#ifdef __cplusplus
extern "C" {
#endif

// Función que podrá ser llamada desde C
int procesar_datos(const char* input, char* output);

// Estructura compatible con C
struct Configuracion {
    int version;
    int modo;
};

#ifdef __cplusplus
} // extern "C"
#endif

// Implementación en C++ que mantiene compatibilidad:
extern "C" int procesar_datos(const char* input, char* output) {
    try {
        std::string result = procesamiento_cpp(input);
        std::strcpy(output, result.c_str());
        return 0;
    } catch (...) {
        return -1; // Código de error compatible con C
    }
}

// Ejemplo de uso incorrecto:
// extern "C" {
//    class MiClase { ... }; // ERROR: clases no son compatibles con C
//    template<typename T>    // ERROR: templates son específicos de C++
//    void funcion_template(T param);
// }
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 7,
    'title_level': 'Interoperabilidad y Lenguajes Mixtos',
    'topic': 'Interoperabilidad con C y Otros Lenguajes',
    'subtopic': 'Integración con Python mediante pybind11',
    'definition': '''
Pybind11 es una biblioteca ligera que permite exponer funciones y clases C++ a Python con sintaxis minimalista. Es particularmente útil cuando necesitas combinar la velocidad de C++ con la flexibilidad y ecosistema de Python.

A diferencia de las herramientas más antiguas como Boost.Python, pybind11 es header-only y tiene un overhead mínimo. Proyectos como TensorFlow y OpenCV lo usan extensivamente para sus bindings Python. La magia de pybind11 está en cómo abstrae las complejidades de la API Python C tradicional, permitiéndote definir bindings con una sintaxis que parece casi como C++ puro.

Un aspecto poderoso es que pybind11 maneja automáticamente la conversión entre tipos Python y C++, incluyendo contenedores estándar como std::vector y std::map. También soporta características avanzadas como herencia cruzada (Python/C++), funciones lambda como callbacks, y gestión automática de memoria con smart pointers.
''',
    'code_example': r'''
#include <pybind11/pybind11.h>
namespace py = pybind11;

// Función simple C++ a exponer
int suma(int a, int b) {
    return a + b;
}

// Clase C++ a exponer
class MiClase {
public:
    MiClase(double valor) : valor_(valor) {}
    void incrementar(double x) { valor_ += x; }
    double obtener() const { return valor_; }
private:
    double valor_;
};

// Módulo Python
PYBIND11_MODULE(ejemplo, m) {
    m.doc() = "Módulo ejemplo pybind11";
    
    // Exponer función
    m.def("suma", &suma, "Suma dos números");
    
    // Exponer clase
    py::class_<MiClase>(m, "MiClase")
        .def(py::init<double>())
        .def("incrementar", &MiClase::incrementar)
        .def("obtener", &MiClase::obtener);
}

// Uso en Python:
// import ejemplo
// print(ejemplo.suma(2, 3))  # 5
// obj = ejemplo.MiClase(5.0)
// obj.incrementar(2.5)
// print(obj.obtener())  # 7.5

// Ejemplo avanzado con numpy:
#include <pybind11/numpy.h>
void procesar_array(py::array_t<double> input) {
    py::buffer_info buf = input.request();
    double* ptr = static_cast<double*>(buf.ptr);
    // ... procesamiento ...
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 7,
    'title_level': 'Interoperabilidad y Lenguajes Mixtos',
    'topic': 'Llamadas a Bibliotecas Externas',
    'subtopic': 'Uso de DLLs y Shared Libraries',
    'definition': '''
Las bibliotecas compartidas (DLL en Windows, `.so` en Linux, `.dylib` en macOS) permiten distribuir funcionalidades sin tener que recompilar todo desde cero. Básicamente, encapsulan código que puede ser utilizado por múltiples programas al mismo tiempo, lo que ahorra recursos y facilita las actualizaciones.

¿Te estás preguntando por qué usarlas en lugar de incluir directamente el código fuente? Porque reutilizar binarios compilados reduce el acoplamiento y mejora el mantenimiento. Además, puedes mantener partes cerradas o privadas sin entregar el código.

En C++, al compilar una biblioteca compartida defines qué funciones o clases serán visibles públicamente, y luego desde otros programas puedes enlazarla dinámicamente al momento de ejecución o enlace.

Esto se usa todo el tiempo. Por ejemplo, muchas bibliotecas de drivers gráficos o audio vienen como DLLs que los juegos cargan al iniciar. Así puedes mejorar o cambiar funcionalidades sin tocar el programa principal.
''',
    'code_example': r'''
// Definición de una función exportada desde una DLL (Windows)
__declspec(dllexport) void greet();

// En el cliente que la usa
__declspec(dllimport) void greet();

int main() {
    greet(); // Llamada a la función dentro de la DLL
    return 0;
}
  ''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 7,
    'title_level': 'Interoperabilidad y Lenguajes Mixtos',
    'topic': 'Llamadas a Bibliotecas Externas',
    'subtopic': 'Carga Dinámica de Bibliotecas',
    'definition': '''
Cargar bibliotecas dinámicamente significa que no necesitas enlazarlas en tiempo de compilación. Puedes hacerlo en tiempo de ejecución, y eso te da mucha flexibilidad: desde plugins que se activan según el usuario, hasta cargar módulos bajo demanda para ahorrar memoria.

Vamos a ver de qué se trata todo esto...

En C++, esto se puede lograr con funciones del sistema operativo como `dlopen` y `dlsym` en Linux, o `LoadLibrary` y `GetProcAddress` en Windows. Con ellas puedes abrir una biblioteca externa y llamar funciones desde ella, todo mientras el programa ya está corriendo.

Esto es muy usado en juegos, navegadores o IDEs que soportan plugins. Incluso puedes construir tu propia arquitectura modular a partir de esto.

Eso sí: como no hay verificación de tipos en tiempo de compilación, debes tener cuidado al manejar punteros y conversiones. Pero si se hace bien, es una herramienta muy poderosa.
''',
    'code_example': r'''
// Linux: Cargar una biblioteca dinámica manualmente
#include <dlfcn.h>
#include <iostream>

int main() {
    void* lib = dlopen("./libmath.so", RTLD_LAZY);
    if (!lib) {
        std::cerr << "No se pudo cargar la biblioteca\n";
        return 1;
    }

    // Obtener función sumar
    typedef int (*SumFunc)(int, int);
    SumFunc sumar = (SumFunc) dlsym(lib, "sumar");
    std::cout << "Resultado: " << sumar(2, 3) << "\n";

    dlclose(lib);
    return 0;
}
  ''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 7,
    'title_level': 'Interoperabilidad y Lenguajes Mixtos',
    'topic': 'Llamadas a Bibliotecas Externas',
    'subtopic': 'Gestión de Dependencias Externas',
    'definition': '''
Cuando tu proyecto empieza a usar varias bibliotecas externas, la gestión de esas dependencias se vuelve crítica. No solo debes saber qué versiones estás usando, sino también cómo instalarlas, actualizarlas y mantenerlas sincronizadas entre todo tu equipo.

¿Te estás preguntando si realmente necesitas eso? Si alguna vez tuviste que compilar algo que pedía “Boost 1.70 o superior” y no sabías por dónde empezar... sí, lo necesitas.

Herramientas como **Conan** y **vcpkg** te permiten definir todas tus dependencias en un archivo, y luego instalarlas automáticamente en cualquier entorno. Además, ayudan a evitar conflictos de versiones y te permiten reproducir builds de forma consistente.

Una buena gestión de dependencias incluye:
- No mezclar versiones incompatibles.
- Fijar versiones cuando sea necesario.
- Documentar claramente lo que se necesita.

Es una de esas cosas que parecen tediosas, pero que cuando están bien hechas... hacen la vida mucho más fácil.
''',
    'code_example': r'''
# conanfile.txt (usando Conan para declarar dependencias)
[requires]
fmt/9.1.0
spdlog/1.11.0

[generators]
cmake

# Instalación:
conan install . --output-folder=build --build=missing
  ''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 7,
    'title_level': 'Interoperabilidad y Lenguajes Mixtos',
    'topic': 'Integración con Sistemas y Plataformas',
    'subtopic': 'Llamadas al Sistema Operativo',
    'definition': '''
En ciertos casos, tu aplicación necesita interactuar directamente con el sistema operativo. Ya sea para obtener información del entorno, manejar procesos, acceder a archivos especiales o ejecutar comandos, las llamadas al sistema te dan ese control más “cercano al metal”.

¿No sabes si alguna vez lo hiciste? Pues si usaste `system("cls")` o `system("clear")`... ya lo hiciste.

En C++, puedes usar funciones estándar como `system`, pero también tienes APIs más avanzadas como la WinAPI en Windows o las llamadas POSIX en sistemas Unix. Por ejemplo, puedes lanzar procesos, leer variables de entorno, o modificar permisos de archivos.

Esto es súper útil en herramientas de sistema, instaladores, aplicaciones que requieren permisos especiales o utilidades de depuración.
''',
    'code_example': r'''
// Ejecutar un comando del sistema (portable)
#include <cstdlib>

int main() {
#ifdef _WIN32
    system("cls"); // Limpiar consola en Windows
#else
    system("clear"); // En Linux/macOS
#endif
    return 0;
}
  ''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 7,
    'title_level': 'Interoperabilidad y Lenguajes Mixtos',
    'topic': 'Integración con Sistemas y Plataformas',
    'subtopic': 'Programación de Bajo Nivel',
    'definition': '''
La programación de bajo nivel en C++ te permite interactuar directamente con la memoria, el hardware y las instrucciones del procesador. Esto no es algo que necesites todos los días, pero es esencial si estás desarrollando controladores, sistemas embebidos o herramientas con requerimientos extremos de rendimiento.

¿Te estás preguntando si esto es peligroso? Sí, un poco. Pero también es donde C++ muestra todo su poder. Te permite manipular direcciones de memoria, acceder a registros, usar instrucciones SIMD y hasta escribir código en ensamblador incrustado.

En este nivel es importante entender cómo funciona realmente tu sistema: qué significa alinear memoria, cómo evitar condiciones de carrera, qué hacen los flags del compilador o cómo optimizar acceso a caché.

Este tipo de programación se usa mucho en motores de videojuegos, sistemas operativos, firmware, y herramientas de profiling. Requiere cuidado, pero también te da un control quirúrgico sobre el comportamiento del programa.
''',
    'code_example': r'''
// Uso de memoria sin inicialización (no recomendado, pero ilustrativo)
#include <iostream>
#include <cstring>

int main() {
    char* buffer = (char*) malloc(100); // asignación sin inicializar
    strcpy(buffer, "Hola bajo nivel");
    std::cout << buffer << std::endl;
    free(buffer);
    return 0;
}

// También puedes incluir ensamblador en línea (compilador específico)
// asm ("movl $1, %eax"); // solo ejemplo (no portable)
  ''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 7,
    'title_level': 'Interoperabilidad y Lenguajes Mixtos',
    'topic': 'Integración con Sistemas y Plataformas',
    'subtopic': 'Desarrollo Multiplataforma',
    'definition': '''
Escribir código C++ que funcione igual en Windows, Linux y macOS puede parecer un reto, pero con las herramientas y prácticas correctas es totalmente posible. El desarrollo multiplataforma busca reducir las partes específicas del sistema operativo y hacer que tu código se ejecute sin cambios en distintos entornos.

¿Te preguntas si vale la pena? Si alguna vez quisiste distribuir tu app a más de un sistema operativo, ya tienes tu respuesta.

La clave está en usar bibliotecas y herramientas compatibles con múltiples sistemas. CMake, por ejemplo, permite generar archivos de build específicos para cada plataforma. Bibliotecas como SDL, Qt o Boost abstraen detalles del sistema, y puedes usar macros como `#ifdef _WIN32` para manejar casos especiales.

Un buen enfoque multiplataforma también implica:
- No usar rutas absolutas o separadores específicos.
- Evitar llamadas al sistema sin comprobaciones.
- Probar en diferentes entornos (no solo “compila en mi máquina”).

Muchas grandes aplicaciones como Chrome, OBS o incluso Unreal Engine aplican estos principios para correr en cualquier parte con una sola base de código.
''',
    'code_example': r'''
// Uso de #ifdef para manejar diferencias de plataforma
#include <iostream>

int main() {
#ifdef _WIN32
    std::cout << "Ejecutando en Windows\n";
#elif __linux__
    std::cout << "Ejecutando en Linux\n";
#elif __APPLE__
    std::cout << "Ejecutando en macOS\n";
#else
    std::cout << "Plataforma no identificada\n";
#endif
    return 0;
}
  ''',
  });
}

Future<void> insertSrLevel8DataCpp(Database db) async {
  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 8,
    'title_level': 'Seguridad y Buenas Prácticas',
    'topic': 'Seguridad en C++',
    'subtopic': 'Prevención de Desbordamientos de Búfer',
    'definition': '''
El desbordamiento de búfer es uno de los errores más comunes y peligrosos en C++. Ocurre cuando escribes más datos de los que una variable puede almacenar, sobrescribiendo memoria adyacente. Eso puede causar desde fallos en tiempo de ejecución hasta vulnerabilidades de seguridad.

¿Te estás preguntando cómo pasa esto en la práctica? Pasa más seguido de lo que crees, especialmente cuando se manejan arreglos o cadenas sin verificar tamaños.

Para prevenirlo:
- Usa funciones seguras como `strncpy` en vez de `strcpy`.
- Prefiere contenedores como `std::string` o `std::vector`.
- Siempre valida la longitud de los datos antes de copiarlos o escribirlos en buffers.

Evitar estos errores no es solo buena práctica, es una necesidad. Muchas brechas de seguridad han ocurrido por algo tan simple como no verificar los límites de un arreglo.
''',
    'code_example': r'''
// Desbordamiento (inseguro)
char nombre[10];
strcpy(nombre, "Este texto es demasiado largo"); // sobrescribe memoria

// Alternativa segura
char nombre[10];
strncpy(nombre, "Juan", sizeof(nombre) - 1);
nombre[sizeof(nombre) - 1] = '\0'; // aseguramos terminación
  ''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 8,
    'title_level': 'Seguridad y Buenas Prácticas',
    'topic': 'Seguridad en C++',
    'subtopic': 'Validación de Entradas',
    'definition': '''
Validar la entrada del usuario (o de cualquier fuente externa) es una regla básica de seguridad. Nunca deberías confiar en que los datos que recibes tienen el formato o contenido esperado. Incluso en aplicaciones locales, una mala validación puede generar fallos o ser explotada con fines maliciosos.

¿No sabes por dónde empezar? Lo más importante es comprobar que los valores estén dentro de un rango aceptable y que no contengan caracteres o estructuras inesperadas.

Algunas buenas prácticas:
- Verifica tamaños antes de copiar a buffers.
- Comprueba que los números estén dentro de los límites válidos.
- Filtra o escapa caracteres peligrosos si trabajas con archivos o comandos del sistema.

Un sistema robusto trata todas las entradas externas como potencialmente corruptas. Es mejor validar de más que asumir que todo está bien.
''',
    'code_example': r'''
#include <iostream>
#include <limits>

int leerEdad() {
    int edad;
    std::cout << "Ingrese su edad: ";
    std::cin >> edad;

    if (std::cin.fail() || edad < 0 || edad > 130) {
        std::cerr << "Edad no válida.\n";
        return -1;
    }
    return edad;
}
  ''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 8,
    'title_level': 'Seguridad y Buenas Prácticas',
    'topic': 'Seguridad en C++',
    'subtopic': 'Uso Seguro de Punteros',
    'definition': '''
Los punteros son una herramienta poderosa en C++, pero también una fuente común de errores si se usan mal. Acceder a memoria liberada, desreferenciar punteros nulos o hacer cálculos erróneos con direcciones puede causar fallos difíciles de rastrear.

¿Te estás preguntando si eso todavía pasa en proyectos modernos? Claro que sí. Incluso grandes compañías han tenido errores por punteros mal manejados.

Para evitar problemas:
- Inicializa siempre tus punteros.
- Libéralos correctamente (y solo una vez).
- Usa punteros inteligentes (`unique_ptr`, `shared_ptr`) cuando sea posible.
- Verifica siempre si un puntero es `nullptr` antes de usarlo.

Adoptar estas prácticas reduce enormemente los riesgos y te ahorra muchas horas de depuración.
''',
    'code_example': r'''
// Puntero crudo sin inicializar (peligroso)
int* ptr;
*ptr = 10; // comportamiento indefinido

// Alternativa segura con puntero inteligente
#include <memory>
std::unique_ptr<int> ptr = std::make_unique<int>(10);
*ptr = 20;
  ''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 8,
    'title_level': 'Seguridad y Buenas Prácticas',
    'topic': 'Buenas Prácticas de Codificación',
    'subtopic': 'Estilo de Código Consistente',
    'definition': '''
Mantener un estilo de código consistente no es cuestión de estética: ayuda a leer, entender, revisar y mantener el código a largo plazo. En equipos grandes, esto se vuelve aún más crítico, ya que cada desarrollador tiene sus propias preferencias.

Seguramente has visto proyectos donde cada archivo parece escrito por una persona diferente. Leer eso es un caos. Por eso se recomienda definir reglas claras desde el inicio y seguirlas siempre.

Buenas prácticas incluyen:
- Usar nombres descriptivos y coherentes.
- Indentar de forma uniforme.
- Elegir un estilo de llaves y respetarlo.
- Evitar líneas demasiado largas o anidadas.

Puedes usar herramientas como `clang-format` o `astyle` para automatizar la aplicación de estas reglas. En muchas empresas, el código no pasa a producción si no está correctamente formateado.
''',
    'code_example': r'''
// Código inconsistente (malo)
int f( int x ){return x+1;}

// Estilo consistente (bueno)
int sumarUno(int numero) {
    return numero + 1;
}
  ''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 8,
    'title_level': 'Seguridad y Buenas Prácticas',
    'topic': 'Buenas Prácticas de Codificación',
    'subtopic': 'Revisión de Código',
    'definition': '''
La revisión de código (code review) es una de las prácticas más valiosas en desarrollo profesional. No solo ayuda a encontrar errores antes de que lleguen a producción, también mejora la calidad general del proyecto y promueve el aprendizaje dentro del equipo.

¿Crees que tu código está perfecto? Puede ser. Pero otro par de ojos siempre ve cosas que se te escaparon.

Una buena revisión:
- Verifica que el código cumpla con los estándares del proyecto.
- Evalúa claridad, mantenibilidad y posibles bugs.
- Puede incluir sugerencias sobre nombres, estructura o lógica.

Herramientas como GitHub, GitLab o Bitbucket tienen flujos integrados de revisión a través de pull/merge requests. Y aunque toma tiempo, casi siempre vale la pena.
''',
    'code_example': r'''
// Ejemplo de comentario útil en revisión:
void procesarUsuario(std::string id) {
    // ¿Qué pasa si id está vacío?
    // ¿Debería usar const std::string& para evitar copia?
}
  ''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 8,
    'title_level': 'Seguridad y Buenas Prácticas',
    'topic': 'Buenas Prácticas de Codificación',
    'subtopic': 'Documentación Clara y Concisa',
    'definition': '''
La documentación clara y concisa es el mejor regalo que le puedes dejar a tu yo del futuro... y a cualquier otra persona que tenga que leer tu código. No se trata de escribir un libro, sino de explicar lo justo y necesario para entender qué hace el código y cómo se usa.

Vamos a ser honestos: nadie disfruta mantener código mal documentado. Es frustrante, lento, y lleva a errores que se podrían evitar.

Tips útiles:
- Comenta el *por qué*, no solo el *qué*.
- Usa bloques descriptivos en funciones y clases.
- Mantén actualizada la documentación (evita que quede obsoleta).
- Apóyate en herramientas como Doxygen.

Una buena documentación puede ser la diferencia entre una biblioteca abandonada y una adoptada por miles.
''',
    'code_example': r'''
/**
 * Calcula el total de impuestos para una compra.
 * @param precioBase El precio sin impuestos.
 * @param tasaImpuesto El porcentaje de impuesto (0-1).
 * @return Total con impuestos aplicados.
 */
double calcularImpuesto(double precioBase, double tasaImpuesto) {
    return precioBase * (1 + tasaImpuesto);
}
  ''',
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 8,
    'title_level': 'Seguridad y Buenas Prácticas',
    'topic': 'Cumplimiento de Estándares',
    'subtopic': 'MISRA C++',
    'definition': '''
MISRA C++ es un conjunto de reglas y directrices pensadas para escribir código más seguro y confiable, especialmente en sistemas críticos como los del sector automotriz, aeroespacial o médico. Está basado en buenas prácticas que limitan ciertas construcciones del lenguaje que pueden ser problemáticas o propensas a errores.

¿Te estás preguntando si esto aplica fuera de un avión o un coche autónomo? Sí, aunque no lo creas, estas reglas ayudan a reducir errores graves también en software común.

MISRA no es un compilador, ni un lenguaje nuevo. Es un estándar que te dice: “mejor evita esto”, “haz esto otro”, y “verifica esto aquí”. Por ejemplo:
- Evita el uso de funciones como `malloc` sin control.
- Prohíbe el uso de `goto`.
- Restringe el uso de herencia múltiple y polimorfismo innecesario.

Lo bueno es que muchas herramientas (como cppcheck, clang-tidy o PC-lint) permiten verificar si tu código cumple con MISRA. Si trabajas con sistemas embebidos o software de alta integridad, aprender estas reglas es más que recomendable.
''',
    'code_example': r'''
// Violación de MISRA C++: uso de goto (prohibido)
int process(int a) {
    if (a < 0) goto error; // regla violada
    return a * 2;
error:
    return -1;
}

// Cumpliendo con MISRA C++:
int process(int a) {
    if (a < 0) {
        return -1;
    }
    return a * 2;
}
  ''',
  });
  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 8,
    'title_level': 'Seguridad y Buenas Prácticas',
    'topic': 'Cumplimiento de Estándares',
    'subtopic': 'CERT C++',
    'definition': '''
El estándar CERT C++ está enfocado en la seguridad. A diferencia de otros como MISRA, que se centran en confiabilidad general, CERT busca evitar vulnerabilidades concretas como desbordamientos de búfer, uso de punteros nulos, fugas de memoria y condiciones de carrera.

¿No sé tú, pero yo antes pensaba que esas fallas eran raras...? Hasta que ves que aparecen en software real y causan problemas serios. Desde pérdidas de datos hasta brechas de seguridad.

CERT C++ tiene una colección de reglas como:
- Siempre inicializa tus variables.
- Nunca uses `strcpy` sin validar tamaños.
- No ignores los valores de retorno de funciones críticas.

Su objetivo es que escribas C++ de manera defensiva, pensando en lo que podría salir mal. Grandes compañías como Cisco, Intel o Siemens aplican estas reglas en sus procesos de revisión de código.

Además, herramientas como Clang Static Analyzer o SonarQube pueden ayudarte a detectar automáticamente violaciones al estándar.
''',
    'code_example': r'''
// Violación del estándar CERT: uso inseguro de strcpy
char buffer[10];
strcpy(buffer, "Este string es demasiado largo"); // posible overflow

// Cumple CERT C++: uso seguro con strncpy y verificación
char buffer[10];
strncpy(buffer, "Hola", sizeof(buffer) - 1);
buffer[sizeof(buffer) - 1] = '\0'; // aseguramos terminación
  ''',
  });
  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 8,
    'title_level': 'Seguridad y Buenas Prácticas',
    'topic': 'Cumplimiento de Estándares',
    'subtopic': 'Normativas de la Industria',
    'definition': '''
En el desarrollo profesional, no basta con que el código funcione. También debe seguir ciertas **normativas y estándares** que garanticen seguridad, portabilidad y calidad. Estas normativas varían según el sector: lo que se exige en un videojuego no es lo mismo que en un software de control médico.

¿Te preguntas si estas normas son “obligatorias”? En muchos casos, sí. Y en otros, te dan una ventaja enorme a nivel profesional.

Algunas de las más reconocidas:
- **ISO/IEC 26262**: para sistemas automotrices.
- **DO-178C**: para software en aeronáutica.
- **IEC 62304**: para software médico.
- **SEI CERT** y **MISRA**: para sistemas embebidos y críticos.

Aplicar estas normas implica escribir documentación, hacer análisis estático, cumplir con estándares de codificación y a veces hasta someter tu software a auditorías externas.

Aunque parezca mucho trabajo, estas prácticas elevan el nivel de calidad del código y reducen el riesgo de errores catastróficos. Y sí, muchas empresas piden esto como parte de sus procesos de certificación.
''',
    'code_example': r'''
// Ejemplo: regla de ISO 26262 — evitar múltiples responsabilidades por función

// No recomendable (violación de principio de responsabilidad única)
void processAndLog(int a) {
    // procesamiento de datos
    int result = a * 2;
    // logging
    std::cout << "Resultado: " << result << std::endl;
}

// Recomendado: separación clara de responsabilidades
int process(int a) {
    return a * 2;
}

void log(int result) {
    std::cout << "Resultado: " << result << std::endl;
}
  ''',
  });
}
