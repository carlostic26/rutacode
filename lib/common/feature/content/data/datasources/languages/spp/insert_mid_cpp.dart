import 'package:sqflite_common/sqlite_api.dart';

Future<void> insertMidLevel1DataCpp(Database db) async {
  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 1,
    'tittle_level': 'Programación Orientada a Objetos (OOP)',
    'topic': 'Clases y Objetos',
    'subtopic': 'Declaración y definición de clases',
    'definition': '''
En la programación orientada a objetos (OOP), las **clases** son como los planos o las plantillas que utilizamos para crear "cosas" (objetos) en nuestro programa. Pensemos por un momento en el plano de una casa: el plano en sí no es la casa real, pero describe exactamente cómo debe ser cada casa que se construya con ese plano (cuántas habitaciones, dónde va la cocina, etc.). Las clases cumplen esa misma función: describen las características (atributos) y los comportamientos (métodos o funciones) que tendrán los objetos que creamos a partir de ellas.

¿Alguna vez te has preguntado cómo se diseñan en el código las entidades del mundo real, como un "coche" o un "usuario", con sus propias propiedades y acciones?

Las clases son la respuesta. Una **declaración de clase** es donde le decimos al compilador que existe una nueva clase y cuáles son sus miembros (atributos y métodos). Se hace usando la palabra clave `class`, seguida del nombre que le daremos a nuestra plantilla. Dentro de la clase, declaramos sus miembros. Por ejemplo, una clase `Coche` podría declarar un atributo `color` y un método `acelerar()`.

La **definición de clase** es la parte donde realmente implementamos el comportamiento de los métodos declarados en la clase. A menudo, las declaraciones de clases y los prototipos de sus métodos se colocan en archivos de cabecera (`.h` o `.hpp`), mientras que las definiciones (la implementación del código de esos métodos) se colocan en archivos `.cpp` separados. Esto promueve la modularización y la organización del código. Al final, un **objeto** es una instancia concreta de una clase. Si la clase `Coche` es el plano, un `Coche` rojo específico que está estacionado afuera es un objeto, una "instancia" de ese plano. Podemos crear múltiples objetos de la misma clase, cada uno con sus propios valores para los atributos.
''',
    'code_example': r'''
#include <iostream>
#include <string>

// --- Declaración de la Clase 'Coche' ---
// Generalmente esto iría en un archivo de cabecera como "Coche.h"
class Coche {
public: // Los miembros publicos son accesibles desde fuera de la clase
    // Atributos (variables miembro)
    std::string marca;
    std::string modelo;
    int anio;
    std::string color;
    double velocidadActual; // Velocidad en km/h

    // Métodos (funciones miembro)
    // Declaración del constructor (especial para inicializar objetos)
    Coche(std::string _marca, std::string _modelo, int _anio, std::string _color);

    // Declaración de otros métodos
    void acelerar(double incremento);
    void frenar(double decremento);
    void mostrarInformacion();
};

// --- Definición de los Métodos de la Clase 'Coche' ---
// Generalmente esto iría en un archivo de implementación como "Coche.cpp"

// Definición del constructor
// Se usa el operador de resolución de ámbito (::) para indicar que el método pertenece a la clase Coche
Coche::Coche(std::string _marca, std::string _modelo, int _anio, std::string _color) {
    // Inicialización de los atributos del objeto
    marca = _marca;
    modelo = _modelo;
    anio = _anio;
    color = _color;
    velocidadActual = 0.0; // Un coche nuevo siempre empieza con velocidad cero
    std::cout << "Se ha construido un Coche: " << marca << " " << modelo << std::endl;
}

// Definición del método acelerar
void Coche::acelerar(double incremento) {
    if (incremento > 0) {
        velocidadActual += incremento;
        std::cout << "Acelerando... Velocidad actual: " << velocidadActual << " km/h" << std::endl;
    } else {
        std::cout << "El incremento debe ser positivo para acelerar." << std::endl;
    }
}

// Definición del método frenar
void Coche::frenar(double decremento) {
    if (decremento > 0 && velocidadActual - decremento >= 0) {
        velocidadActual -= decremento;
        std::cout << "Frenando... Velocidad actual: " << velocidadActual << " km/h" << std::endl;
    } else if (velocidadActual - decremento < 0) {
        velocidadActual = 0;
        std::cout << "Frenando... Coche detenido." << std::endl;
    } else {
        std::cout << "El decremento debe ser positivo para frenar." << std::endl;
    }
}

// Definición del método mostrarInformacion
void Coche::mostrarInformacion() {
    std::cout << "\n--- Informacion del Coche ---" << std::endl;
    std::cout << "Marca: " << marca << std::endl;
    std::cout << "Modelo: " << modelo << std::endl;
    std::cout << "Año: " << anio << std::endl;
    std::cout << "Color: " << color << std::endl;
    std::cout << "Velocidad Actual: " << velocidadActual << " km/h" << std::endl;
    std::cout << "---------------------------" << std::endl;
}


int main() {
    std::cout << "--- Declaracion y Definicion de Clases y Objetos ---" << std::endl;

    // --- Creación de Objetos (Instancias de la Clase 'Coche') ---
    // Coche miCoche; // Esto no compilaria si solo hay un constructor con parametros

    // Crear un objeto 'miCoche' usando el constructor
    Coche miCoche("Toyota", "Corolla", 2023, "Rojo");

    // Acceder a atributos del objeto
    // miCoche.marca = "Toyota"; // Si no usaramos constructor, inicializariamos asi
    // miCoche.modelo = "Corolla";
    // miCoche.anio = 2023;
    // miCoche.color = "Rojo";

    // Llamar a métodos del objeto
    miCoche.mostrarInformacion();
    miCoche.acelerar(50);
    miCoche.acelerar(20);
    miCoche.frenar(30);
    miCoche.mostrarInformacion();

    std::cout << std::endl;

    // Crear otro objeto 'otroCoche' de la misma clase
    Coche otroCoche("Honda", "Civic", 2024, "Azul");
    otroCoche.acelerar(80);
    otroCoche.mostrarInformacion();

    // Cada objeto tiene sus propios valores para los atributos
    std::cout << "\nMarca de miCoche: " << miCoche.marca << std::endl;
    std::cout << "Marca de otroCoche: " << otroCoche.marca << std::endl;


    // MAL EJEMPLO: Intentar acceder a miembros privados (si los tuvieramos)
    // class EjemploPrivado {
    // private:
    //     int datoSecreto;
    // public:
    //     EjemploPrivado(int d) : datoSecreto(d) {}
    // };
    // EjemploPrivado obj(10);
    // std::cout << obj.datoSecreto << std::endl; // ERROR: 'datoSecreto' es privado

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 1,
    'tittle_level': 'Programación Orientada a Objetos (OOP)',
    'topic': 'Clases y Objetos',
    'subtopic': 'Constructores y destructores',
    'definition': '''
En el mundo de la Programación Orientada a Objetos, los objetos no solo necesitan comportamientos (métodos) y características (atributos), sino también una forma de "nacer" y "morir" de manera controlada. Aquí es donde entran en juego los **constructores** y los **destructores**: son métodos especiales que se invocan automáticamente en momentos clave del ciclo de vida de un objeto.

¿Te has preguntado cómo se asegura un objeto de que sus atributos siempre tengan un valor inicial válido, o cómo limpia los recursos que utilizó antes de desaparecer de la memoria?

Un **constructor** es un método especial de una clase que se llama automáticamente cuando se crea un objeto de esa clase. Su propósito principal es inicializar el estado del nuevo objeto, asegurando que sus atributos tengan valores válidos y que cualquier recurso necesario (como memoria dinámica o archivos) se adquiera correctamente. El constructor tiene el mismo nombre que la clase y no tiene tipo de retorno (ni siquiera `void`). Una clase puede tener múltiples constructores (sobrecarga de constructores), siempre y cuando sus listas de parámetros sean diferentes. Esto permite crear objetos de diversas maneras (por ejemplo, un `Coche` con solo marca y modelo, o un `Coche` con todos los detalles).

Por otro lado, un **destructor** es otro método especial que se invoca automáticamente cuando un objeto está a punto de ser destruido (por ejemplo, cuando sale del ámbito donde fue declarado, o cuando se libera memoria asignada dinámicamente). Su propósito es liberar los recursos que el objeto adquirió durante su vida útil, como la memoria asignada con `new`, los archivos abiertos o las conexiones a bases de datos. El destructor tiene el mismo nombre que la clase, precedido por una tilde (`~`), y tampoco tiene tipo de retorno ni recibe parámetros. Una clase solo puede tener un destructor. Estos dos elementos son cruciales para la gestión de recursos y la prevención de fugas de memoria en aplicaciones C++.
''',
    'code_example': r'''
#include <iostream>
#include <string>

class Libro {
public:
    std::string titulo;
    std::string autor;
    int anioPublicacion;
    std::string* isbn; // Puntero para simular un recurso que necesita gestión (memoria dinámica)

    // --- CONSTRUCTORES ---

    // Constructor por defecto (sin parámetros)
    Libro() : titulo("Desconocido"), autor("Anonimo"), anioPublicacion(0) {
        isbn = new std::string("Sin ISBN"); // Inicializa recurso dinámico
        std::cout << "Constructor por defecto llamado para Libro: " << titulo << std::endl;
    }

    // Constructor con parámetros (sobrecarga de constructor)
    Libro(std::string _titulo, std::string _autor, int _anio, std::string _isbn)
        : titulo(_titulo), autor(_autor), anioPublicacion(_anio) {
        // Uso de lista de inicializadores para atributos (más eficiente)
        isbn = new std::string(_isbn); // Inicializa recurso dinámico
        std::cout << "Constructor con parametros llamado para Libro: " << titulo << std::endl;
    }

    // --- DESTRUCTOR ---
    // Se llama automáticamente cuando el objeto es destruido
    ~Libro() {
        // Liberar recursos adquiridos por el objeto (memoria dinámica)
        delete isbn; // Libera la memoria apuntada por 'isbn'
        isbn = nullptr; // Buenas practicas: evitar punteros dangling
        std::cout << "Destructor llamado para Libro: " << titulo << std::endl;
    }

    // Método para mostrar información del libro
    void mostrarInfo() {
        std::cout << "\n--- Info Libro ---" << std::endl;
        std::cout << "Titulo: " << titulo << std::endl;
        std::cout << "Autor: " << autor << std::endl;
        std::cout << "Año: " << anioPublicacion << std::endl;
        if (isbn) { // Asegurarse de que el puntero no sea nulo antes de acceder
            std::cout << "ISBN: " << *isbn << std::endl;
        }
        std::cout << "------------------" << std::endl;
    }
};

// Función para demostrar la destrucción de objetos al salir del ámbito
void crearYDestruirLibroTemporal() {
    std::cout << "\n--- Entrando en crearYDestruirLibroTemporal ---" << std::endl;
    Libro libroTemp("El Hobbit", "J.R.R. Tolkien", 1937, "978-0345339683");
    libroTemp.mostrarInfo();
    std::cout << "--- Saliendo de crearYDestruirLibroTemporal ---" << std::endl;
    // El destructor de 'libroTemp' se llama automáticamente aquí
}

int main() {
    std::cout << "--- Constructores y Destructores ---" << std::endl;

    // 1. Creación de objeto usando el constructor por defecto
    Libro miLibro1;
    miLibro1.mostrarInfo();

    std::cout << std::endl;

    // 2. Creación de objeto usando el constructor con parámetros
    Libro miLibro2("C++ Primer", "Stanley B. Lippman", 2012, "978-0321714114");
    miLibro2.mostrarInfo();

    // Demostrar cuándo se llama el destructor
    crearYDestruirLibroTemporal();

    std::cout << "\n--- Volviendo al main ---" << std::endl;
    std::cout << "Los destructores de miLibro1 y miLibro2 se llamaran al final de main." << std::endl;

    // Cuando main termina, los destructores de miLibro1 y miLibro2 se llamarán automáticamente.
    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 1,
    'tittle_level': 'Programación Orientada a Objetos (OOP)',
    'topic': 'Clases y Objetos',
    'subtopic': 'Encapsulamiento y acceso a miembros',
    'definition': '''
El **encapsulamiento** es uno de los pilares fundamentales de la Programación Orientada a Objetos (OOP). Pensemos por un momento en un control remoto de televisión: sabes cómo usarlo (cambiar canales, subir volumen), pero no necesitas saber cómo funciona internamente (qué circuitos tiene, cómo se codifica la señal). El control remoto "encapsula" su complejidad interna y te ofrece una interfaz simple para interactuar con él. En programación, el encapsulamiento es precisamente eso: agrupar los datos (atributos) y las funciones que operan sobre esos datos (métodos) dentro de una única unidad (la clase), y controlar el acceso a ellos.

¿Alguna vez te has encontrado con un objeto en tu código donde cualquiera podía cambiar sus datos internos de forma arbitraria, llevando a estados inconsistentes o errores difíciles de rastrear?

El encapsulamiento resuelve este problema al proteger los datos internos de una clase de accesos no autorizados o directos desde fuera de la clase. Esto se logra mediante **especificadores de acceso**:
* **`private`**: Los miembros declarados como `private` solo son accesibles desde dentro de la propia clase. Son los detalles de implementación internos que no deben ser manipulados directamente por el mundo exterior.
* **`protected`**: Los miembros `protected` son accesibles desde dentro de la propia clase y desde las clases que heredan de ella. Esto lo veremos más a fondo en el tema de herencia.
* **`public`**: Los miembros `public` son accesibles desde cualquier parte del programa. Estos son la interfaz de la clase, los "botones" del control remoto que los usuarios de la clase pueden usar.

Para interactuar con los datos privados de una clase, se utilizan métodos públicos especiales, conocidos como **métodos *getter*** (para obtener el valor de un atributo) y **métodos *setter*** (para modificar el valor de un atributo). Estos métodos permiten a la clase controlar cómo se accede y se modifica su estado interno, permitiendo validaciones o transformaciones si es necesario. El encapsulamiento no es solo ocultar datos; es proteger la integridad de los datos y simplificar el uso de la clase al exponer solo lo necesario.
''',
    'code_example': r'''
#include <iostream>
#include <string>

class CuentaBancaria {
private: // Miembros privados: solo accesibles desde dentro de la clase
    std::string numeroCuenta;
    double saldo; // El saldo no debe ser modificado directamente desde fuera

public: // Miembros publicos: forman la interfaz de la clase
    // Constructor
    CuentaBancaria(std::string numCuenta, double saldoInicial) {
        numeroCuenta = numCuenta;
        // Validacion inicial del saldo (buena practica de encapsulamiento)
        if (saldoInicial >= 0) {
            saldo = saldoInicial;
        } else {
            saldo = 0;
            std::cout << "Advertencia: Saldo inicial negativo. Estableciendo a 0." << std::endl;
        }
        std::cout << "Cuenta " << numeroCuenta << " creada con saldo: $" << saldo << std::endl;
    }

    // Método Getter: para obtener el saldo (solo lectura)
    double getSaldo() const { // 'const' indica que el metodo no modifica el estado del objeto
        return saldo;
    }

    // Método Getter: para obtener el numero de cuenta
    std::string getNumeroCuenta() const {
        return numeroCuenta;
    }

    // Método Setter: para depositar (modifica el saldo de forma controlada)
    void depositar(double cantidad) {
        if (cantidad > 0) {
            saldo += cantidad;
            std::cout << "Deposito de $" << cantidad << " realizado. Nuevo saldo: $" << saldo << std::endl;
        } else {
            std::cout << "Error: La cantidad a depositar debe ser positiva." << std::endl;
        }
    }

    // Método Setter: para retirar (modifica el saldo de forma controlada y con validacion)
    void retirar(double cantidad) {
        if (cantidad > 0 && cantidad <= saldo) {
            saldo -= cantidad;
            std::cout << "Retiro de $" << cantidad << " realizado. Nuevo saldo: $" << saldo << std::endl;
        } else if (cantidad <= 0) {
            std::cout << "Error: La cantidad a retirar debe ser positiva." << std::endl;
        } else {
            std::cout << "Error: Saldo insuficiente. Intento retirar $" << cantidad << ", saldo actual $" << saldo << std::endl;
        }
    }
};

int main() {
    std::cout << "--- Encapsulamiento y Acceso a Miembros ---" << std::endl;

    // Crear un objeto CuentaBancaria
    CuentaBancaria miCuenta("ABC12345", 1000.0);

    // Intentar acceder directamente a un miembro privado (esto resultaría en un error de compilación)
    // miCuenta.saldo = 5000.0; // ERROR: 'saldo' es privado

    // Acceder a miembros a través de métodos públicos (getters y setters)
    std::cout << "\nSaldo actual de la cuenta " << miCuenta.getNumeroCuenta() << ": $" << miCuenta.getSaldo() << std::endl;

    miCuenta.depositar(200.0);
    std::cout << "Saldo despues del deposito: $" << miCuenta.getSaldo() << std::endl;

    miCuenta.retirar(150.0);
    std::cout << "Saldo despues del retiro: $" << miCuenta.getSaldo() << std::endl;

    miCuenta.retirar(1500.0); // Intento de retiro con saldo insuficiente
    std::cout << "Saldo despues del intento de retiro fallido: $" << miCuenta.getSaldo() << std::endl;

    miCuenta.depositar(-50.0); // Intento de deposito invalido

    // Crear una cuenta con saldo inicial negativo (demostrando la validacion del constructor)
    CuentaBancaria otraCuenta("XYZ987", -50.0);
    std::cout << "Saldo de otra cuenta: $" << otraCuenta.getSaldo() << std::endl;

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 1,
    'tittle_level': 'Programación Orientada a Objetos (OOP)',
    'topic': 'Herencia',
    'subtopic': 'Herencia simple y múltiple',
    'definition': '''
La **herencia** es uno de los pilares más importantes de la Programación Orientada a Objetos (OOP). Nos permite crear nuevas clases que reutilizan, extienden y modifican el comportamiento y los atributos de clases existentes. Pensemos por un momento en la biología: un ser humano hereda características de sus padres (color de ojos, altura, etc.), pero también desarrolla sus propias características únicas. En programación, la herencia funciona de manera similar: una clase puede "heredar" propiedades y métodos de otra clase.

¿Alguna vez te has encontrado escribiendo código muy similar en diferentes clases, como si cada vez estuvieras "reinventando la rueda"?

La herencia resuelve este problema al permitirnos establecer una relación "es un tipo de" entre clases. La clase de la que se hereda se llama **clase base** (o clase padre/superclase), y la clase que hereda se llama **clase derivada** (o clase hija/subclase).

Existen dos tipos principales de herencia:

* **Herencia Simple**: Una clase derivada hereda de una única clase base. Este es el tipo de herencia más común y directo. Por ejemplo, una clase `CocheDeportivo` podría heredar de una clase `Coche`, ya que un coche deportivo "es un tipo de" coche. Esto significa que `CocheDeportivo` automáticamente tendrá los atributos y métodos de `Coche` (como `marca`, `modelo`, `acelerar()`), y además podrá añadir sus propias características (como `aleron`, `activarTurbo()`).

* **Herencia Múltiple**: Una clase derivada hereda de dos o más clases base. Esto significa que la clase hija adquiere las características y comportamientos de múltiples clases padres. Por ejemplo, una clase `Anfibio` podría heredar de `VehiculoTerrestre` y de `VehiculoAcuatico`, ya que un anfibio "es un tipo de" vehículo terrestre *y* "es un tipo de" vehículo acuático. Aunque potente, la herencia múltiple puede introducir complejidades y ambigüedades, lo que nos lleva al "problema del diamante" (que veremos a continuación) y a la preferencia por otras soluciones como la composición en muchos casos.

En C++, la herencia se especifica usando dos puntos (`:`) seguidos por el especificador de acceso (como `public`, `protected` o `private`) y el nombre de la clase base.
''',
    'code_example': r'''
#include <iostream>
#include <string>

// --- HERENCIA SIMPLE ---

// Clase Base: Vehiculo
class Vehiculo {
public:
    std::string marca;
    int anio;

    // Constructor de la clase base
    Vehiculo(std::string _marca, int _anio) : marca(_marca), anio(_anio) {
        std::cout << "Constructor de Vehiculo: " << marca << " (" << anio << ")" << std::endl;
    }

    void mostrarInfoVehiculo() const {
        std::cout << "  Marca: " << marca << ", Año: " << anio << std::endl;
    }

    // Destructor de la clase base
    ~Vehiculo() {
        std::cout << "Destructor de Vehiculo: " << marca << std::endl;
    }
};

// Clase Derivada: Coche (hereda publicamente de Vehiculo)
class Coche : public Vehiculo { // 'public' significa que los miembros publicos de Vehiculo son publicos en Coche
public:
    int numPuertas;
    std::string tipoCombustible;

    // Constructor de Coche: Debe llamar al constructor de la clase base
    Coche(std::string _marca, int _anio, int _numPuertas, std::string _tipoCombustible)
        : Vehiculo(_marca, _anio), numPuertas(_numPuertas), tipoCombustible(_tipoCombustible) {
        std::cout << "Constructor de Coche: " << _marca << " (" << _numPuertas << " puertas)" << std::endl;
    }

    void mostrarInfoCoche() const {
        mostrarInfoVehiculo(); // Reutiliza el método de la clase base
        std::cout << "  Numero de puertas: " << numPuertas << ", Combustible: " << tipoCombustible << std::endl;
    }

    // Destructor de Coche
    ~Coche() {
        std::cout << "Destructor de Coche: " << marca << std::endl;
    }
};

// --- HERENCIA MÚLTIPLE ---

// Clase Base 1: Nadador
class Nadador {
public:
    void nadar() const {
        std::cout << "  Capaz de nadar." << std::endl;
    }
    ~Nadador() { std::cout << "Destructor de Nadador." << std::endl; }
};

// Clase Base 2: Corredor
class Corredor {
public:
    void correr() const {
        std::cout << "  Capaz de correr." << std::endl;
    }
    ~Corredor() { std::cout << "Destructor de Corredor." << std::endl; }
};

// Clase Derivada: AtletaCompleto (hereda publicamente de Nadador y Corredor)
class AtletaCompleto : public Nadador, public Corredor {
public:
    std::string nombre;

    AtletaCompleto(std::string _nombre) : nombre(_nombre) {
        std::cout << "Constructor de AtletaCompleto: " << nombre << std::endl;
    }

    void mostrarHabilidades() const {
        std::cout << "Atleta: " << nombre << " posee las siguientes habilidades:" << std::endl;
        nadar(); // Reutiliza el método de Nadador
        correr(); // Reutiliza el método de Corredor
    }

    ~AtletaCompleto() {
        std::cout << "Destructor de AtletaCompleto: " << nombre << std::endl;
    }
};

int main() {
    std::cout << "--- Herencia Simple ---" << std::endl;
    Coche miCoche("Tesla", 2023, 4, "Electrico");
    miCoche.mostrarInfoCoche();
    std::cout << std::endl;

    std::cout << "--- Herencia Multiple ---" << std::endl;
    AtletaCompleto juan("Juan");
    juan.mostrarHabilidades();
    std::cout << std::endl;

    std::cout << "Observa el orden de llamada de los destructores (se llaman en orden inverso a la construccion)." << std::endl;
    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 1,
    'tittle_level': 'Programación Orientada a Objetos (OOP)',
    'topic': 'Herencia',
    'subtopic': 'Herencia virtual',
    'definition': '''
La **herencia virtual** en C++ es un mecanismo avanzado de herencia que se utiliza específicamente para resolver problemas de ambigüedad y duplicación de miembros en escenarios de herencia múltiple, particularmente en el conocido "problema del diamante". Pensemos por un momento en una familia con herencia múltiple, donde un bisnieto hereda la misma propiedad (por ejemplo, una reliquia familiar única) de dos abuelos diferentes, y ambos abuelos la heredaron de un mismo tatarabuelo. Si no hay un mecanismo para manejar esto, el bisnieto tendría dos "copias" de la misma reliquia, lo cual es redundante y confuso. La herencia virtual asegura que el bisnieto solo reciba una única copia de la reliquia compartida.

¿Alguna vez te has encontrado con clases que heredan de múltiples clases base, y te preocupa que alguna funcionalidad compartida se duplique o cause conflictos?

La herencia virtual aborda esto. Cuando una clase base se especifica como `virtual` durante la herencia, asegura que si esa clase base aparece múltiples veces en un árbol de herencia (a través de diferentes rutas de herencia), solo una única subobjeto (instancia) de esa clase base se incluirá en la clase más derivada. Esto evita la duplicación de datos y la ambigüedad en el acceso a los miembros de la clase base común.

El problema del diamante es el escenario clásico donde la herencia virtual es indispensable:
1.  Tienes una **Clase Base A**.
2.  Luego, dos clases, **Clase B** y **Clase C**, heredan ambas de la Clase A.
3.  Finalmente, una **Clase D** hereda tanto de la Clase B como de la Clase C.

Sin herencia virtual, la Clase D contendría dos subobjetos separados de la Clase A (uno a través de B y otro a través de C). Esto significaría que si A tiene un miembro de datos `int valor;`, Clase D tendría dos `valor` diferentes, lo que causaría ambigüedad al intentar acceder a `valor` directamente desde un objeto de Clase D. Al usar la herencia virtual (`class B : virtual public A`), se garantiza que solo habrá una única instancia de la Clase A compartida por B y C, y por lo tanto, una única instancia en D. Esto simplifica la gestión de datos y elimina ambigüedades.
''',
    'code_example': r'''
#include <iostream>
#include <string>

// --- PROBLEMA DEL DIAMANTE Y SU SOLUCIÓN CON HERENCIA VIRTUAL ---

// Clase Base A: Publicacion
class Publicacion {
public:
    std::string titulo;
    int anio;

    Publicacion(std::string _titulo = "Sin Titulo", int _anio = 0) : titulo(_titulo), anio(_anio) {
        std::cout << "  Constructor de Publicacion: " << titulo << std::endl;
    }

    void mostrarInfoPublicacion() const {
        std::cout << "    Titulo: " << titulo << ", Año: " << anio << std::endl;
    }

    ~Publicacion() { std::cout << "  Destructor de Publicacion: " << titulo << std::endl; }
};

// Clase B: Libro (hereda virtualmente de Publicacion)
class Libro : virtual public Publicacion { // <-- Uso de 'virtual' aquí
public:
    std::string autor;

    // Los constructores de clases virtuales se llaman desde la clase mas derivada
    Libro(std::string _titulo, int _anio, std::string _autor)
        : Publicacion(_titulo, _anio), autor(_autor) { // El constructor de Publicacion se llama indirectamente
        std::cout << "    Constructor de Libro: " << autor << std::endl;
    }

    void mostrarInfoLibro() const {
        // mostrarInfoPublicacion(); // Podría llamarse, pero mejor acceder directamente o desde Periodico
        std::cout << "      Autor: " << autor << std::endl;
    }

    ~Libro() { std::cout << "    Destructor de Libro: " << autor << std::endl; }
};

// Clase C: Periodico (hereda virtualmente de Publicacion)
class Periodico : virtual public Publicacion { // <-- Uso de 'virtual' aquí
public:
    std::string editor;

    // Los constructores de clases virtuales se llaman desde la clase mas derivada
    Periodico(std::string _titulo, int _anio, std::string _editor)
        : Publicacion(_titulo, _anio), editor(_editor) { // El constructor de Publicacion se llama indirectamente
        std::cout << "    Constructor de Periodico: " << editor << std::endl;
    }

    void mostrarInfoPeriodico() const {
        // mostrarInfoPublicacion(); // Podría llamarse
        std::cout << "      Editor: " << editor << std::endl;
    }

    ~Periodico() { std::cout << "    Destructor de Periodico: " << editor << std::endl; }
};

// Clase D: RevistaCientifica (hereda de Libro y Periodico)
class RevistaCientifica : public Libro, public Periodico {
public:
    std::string areaEstudio;

    RevistaCientifica(std::string _titulo, int _anio, std::string _autor,
                      std::string _editor, std::string _areaEstudio)
        // El constructor de Publicacion debe ser llamado directamente por la clase mas derivada (RevistaCientifica)
        : Publicacion(_titulo, _anio), // <-- Se encarga de construir la UNICA subobjeto de Publicacion
          Libro(_titulo, _anio, _autor),
          Periodico(_titulo, _anio, _editor),
          areaEstudio(_areaEstudio) {
        std::cout << "      Constructor de RevistaCientifica: " << areaEstudio << std::endl;
    }

    void mostrarInfoRevista() const {
        std::cout << "\n--- Informacion Completa de Revista Cientifica ---" << std::endl;
        // Acceso directo a miembros de Publicacion sin ambigüedad
        mostrarInfoPublicacion(); // Llama al método de la única Publicacion
        mostrarInfoLibro();
        mostrarInfoPeriodico();
        std::cout << "      Area de Estudio: " << areaEstudio << std::endl;
        std::cout << "-----------------------------------------------" << std::endl;
    }

    ~RevistaCientifica() {
        std::cout << "      Destructor de RevistaCientifica: " << areaEstudio << std::endl;
    }
};

int main() {
    std::cout << "--- Demostracion de Herencia Virtual ---" << std::endl;

    // Sin herencia virtual, tendríamos 2 copias de Publicacion dentro de RevistaCientifica.
    // Esto causaría:
    // 1. Ambigüedad al acceder a 'titulo' o 'anio' directamente.
    // 2. Duplicación innecesaria de datos.
    // 3. Dos llamadas al constructor y destructor de Publicacion.

    // Con herencia virtual, solo hay una copia de Publicacion.
    RevistaCientifica miRevista("Avances en IA", 2024, "Dra. Lopez", "Academic Press", "Inteligencia Artificial");
    miRevista.mostrarInfoRevista();

    std::cout << "\nObserva el orden de los constructores y destructores:" << std::endl;
    std::cout << "Los constructores de las bases virtuales (Publicacion) se llaman antes de las no-virtuales (Libro, Periodico)." << std::endl;
    std::cout << "El destructor de la base virtual se llama al final." << std::endl;

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 1,
    'tittle_level': 'Programación Orientada a Objetos (OOP)',
    'topic': 'Herencia',
    'subtopic': 'Problema del diamante',
    'definition': '''
El **problema del diamante** es una complicación clásica que surge en los lenguajes de programación que permiten la **herencia múltiple** (donde una clase puede heredar de dos o más clases base). Pensemos en un escenario de herencia familiar: imagina que tienes un tatarabuelo (`Clase Base A`) que posee una característica única (por ejemplo, "nariz respingona"). Luego, dos de sus hijos (`Clase B` y `Clase C`) heredan esa característica. Finalmente, un bisnieto (`Clase D`) hereda tanto de la `Clase B` como de la `Clase C`. El problema surge cuando este bisnieto `Clase D` intenta acceder a la característica "nariz respingona": ¿de cuál de sus "padres" (`B` o `C`) debería heredarla? ¿O debería tener dos "narices respingonas" diferentes? Esto es el problema del diamante.

¿Alguna vez te has preguntado qué sucede cuando una clase hereda la misma funcionalidad o atributo de dos clases base diferentes que, a su vez, lo heredaron de una base común?

Formalmente, el problema del diamante ocurre en la siguiente estructura de herencia:
1.  Tenemos una **Clase Base A** (el "pico superior" del diamante).
2.  Dos clases intermedias, **Clase B** y **Clase C**, heredan cada una de la Clase A. (Las "esquinas laterales" del diamante).
3.  Una **Clase D** final hereda de ambas, Clase B y Clase C. (El "pico inferior" del diamante).

Sin un mecanismo especial, la Clase D termina con *dos subobjetos* de la Clase A: uno heredado a través de B y otro a través de C. Esto lleva a dos problemas principales:

1.  **Ambigüedad**: Si la Clase A tiene un miembro (un atributo o un método) con un nombre `x`, entonces al intentar acceder a `x` desde un objeto de Clase D, el compilador no sabrá a cuál de las dos `x` (la de la ruta B o la de la ruta C) te refieres, resultando en un error de compilación.
2.  **Duplicación de datos**: Se estarían almacenando dos copias de los datos de la Clase A en cada objeto de Clase D, lo cual es ineficiente y puede llevar a inconsistencias si los dos `x` tienen valores diferentes.

En C++, la solución estándar y más elegante para el problema del diamante es el uso de la **herencia virtual**. Al declarar las clases intermedias (B y C) con `virtual public A` (por ejemplo, `class B : virtual public A`), le indicamos al compilador que, si estas clases participan en una herencia múltiple donde la Clase A es una base común, solo debe existir una única instancia compartida de la Clase A en la clase más derivada (Clase D). Esto resuelve la ambigüedad y la duplicación, asegurando que solo haya una "nariz respingona" y que el bisnieto sepa exactamente a cuál referirse.
''',
    'code_example': r'''
#include <iostream>
#include <string>

// --- Demostración del PROBLEMA DEL DIAMANTE ---

// Clase Base A
class Persona {
public:
    std::string nombre;

    Persona(std::string n = "Sin Nombre") : nombre(n) {
        std::cout << "  Constructor de Persona: " << nombre << std::endl;
    }

    void saludar() const {
        std::cout << "    Hola, soy " << nombre << "." << std::endl;
    }

    ~Persona() { std::cout << "  Destructor de Persona: " << nombre << std::endl; }
};

// Clase B (hereda de Persona)
class Profesor : public Persona { // No virtual, para mostrar el problema
public:
    Profesor(std::string n, std::string s = "Sin Asignatura") : Persona(n), asignatura(s) {
        std::cout << "    Constructor de Profesor: " << asignatura << std::endl;
    }
    std::string asignatura;

    void ensenar() const {
        std::cout << "      Enseñando " << asignatura << std::endl;
    }

    ~Profesor() { std::cout << "    Destructor de Profesor: " << asignatura << std::endl; }
};

// Clase C (hereda de Persona)
class Estudiante : public Persona { // No virtual, para mostrar el problema
public:
    Estudiante(std::string n, int c = 0) : Persona(n), codigo(c) {
        std::cout << "    Constructor de Estudiante: " << codigo << std::endl;
    }
    int codigo;

    void estudiar() const {
        std::cout << "      Estudiando con codigo " << codigo << std::endl;
    }

    ~Estudiante() { std::cout << "    Destructor de Estudiante: " << codigo << std::endl; }
};

// Clase D (hereda de Profesor y Estudiante)
// Esta clase causaría el problema del diamante si Persona no fuera una base virtual
class AyudanteDeCatedra : public Profesor, public Estudiante {
public:
    AyudanteDeCatedra(std::string n, std::string s, int c)
        : Profesor(n, s), Estudiante(n, c) { // Ambos constructores de Profesor y Estudiante intentan inicializar Persona
        std::cout << "      Constructor de AyudanteDeCatedra: " << n << std::endl;
    }

    // Aquí surgiría la ambigüedad sin herencia virtual
    // void mostrarRol() const {
    //     // ERROR DE COMPILACIÓN: 'nombre' es ambiguo
    //     // std::cout << "Soy " << nombre << " y soy un Ayudante de Catedra." << std::endl;
    //     // Necesitarias especificar: Profesor::nombre o Estudiante::nombre
    //     std::cout << "Soy " << Profesor::nombre << " y soy un Ayudante de Catedra." << std::endl;
    // }

    // Este es el problema. Sin herencia virtual, AyudanteDeCatedra tiene dos subobjetos 'Persona'.
    // Al llamar a 'saludar()' hay ambigüedad porque no sabe qué 'Persona' saludar.
    // void saludarDosVeces() const {
    //     Profesor::saludar(); // Llama a saludar de la Persona a través de Profesor
    //     Estudiante::saludar(); // Llama a saludar de la Persona a través de Estudiante
    // }

    ~AyudanteDeCatedra() {
        std::cout << "      Destructor de AyudanteDeCatedra." << std::endl;
    }
};


int main() {
    std::cout << "--- Demostracion del Problema del Diamante (Sin Herencia Virtual) ---" << std::endl;

    // Si intentaramos acceder directamente a un miembro de Persona desde AyudanteDeCatedra:
    // AyudanteDeCatedra ac("Pedro", "Matematicas", 123);
    // ac.nombre; // ERROR: miembro 'nombre' es ambiguo (existe en Profesor::Persona y Estudiante::Persona)

    // Para evitar la ambigüedad, tendríamos que usar la resolución de ámbito:
    // std::cout << "Nombre a traves de Profesor: " << ac.Profesor::nombre << std::endl;
    // std::cout << "Nombre a traves de Estudiante: " << ac.Estudiante::nombre << std::endl;

    // Esto demuestra la duplicidad. Si hubieramos usado Herencia Virtual (como en el tema anterior),
    // solo habria UNA copia de 'Persona' y el acceso seria directo y sin ambiguedades.

    std::cout << "\nCon la estructura actual (sin herencia virtual), una 'AyudanteDeCatedra' tiene dos sub-objetos 'Persona'." << std::endl;
    std::cout << "Esto causa: " << std::endl;
    std::cout << "1. Ambiguedad al acceder a miembros de Persona (ej. 'nombre')." << std::endl;
    std::cout << "2. Duplicacion de datos de Persona." << std::endl;
    std::cout << "3. Los constructores de Persona se llaman dos veces al construir AyudanteDeCatedra." << std::endl;
    std::cout << "4. Los destructores de Persona se llaman dos veces al destruir AyudanteDeCatedra." << std::endl;

    std::cout << "\nSi este codigo se compilara y ejecutara con la clase AyudanteDeCatedra descomentada," << std::endl;
    std::cout << "observarias los constructores de 'Persona' y sus destructores llamados dos veces." << std::endl;
    std::cout << "Ademas, las lineas 'ac.nombre' resultarian en un error de compilacion por ambiguedad." << std::endl;


    // Para ver el problema en acción, descomenta la creación de AyudanteDeCatedra
    // y el acceso a 'nombre' o llamadas a 'saludarTwoTimes()'.
    // Se recomienda usar herencia virtual para resolver esto, como se mostró en el subtema anterior.
    // AyudanteDeCatedra ac("Ricardo", "Informatica", 456);
    // ac.mostrarRol(); // Intentar llamar este metodo aqui causaria un error por ambiguedad si no se resuelve

    std::cout << "\nFin de la demostracion del problema del diamante." << std::endl;
    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 1,
    'tittle_level': 'Programación Orientada a Objetos (OOP)',
    'topic': 'Polimorfismo',
    'subtopic': 'Funciones virtuales y sobreescritura',
    'definition': '''
El **polimorfismo** es uno de los conceptos más poderosos y elegantes de la Programación Orientada a Objetos (OOP). La palabra "polimorfismo" significa "muchas formas". En C++, se refiere a la capacidad de los objetos de diferentes clases de responder a la misma llamada a un método de maneras diferentes, dependiendo de su tipo real en tiempo de ejecución. Pensemos por un momento en un botón en una interfaz de usuario: al hacer clic en él, un "botón de guardar" guarda el archivo, un "botón de imprimir" imprime el documento, y un "botón de cancelar" cierra la ventana. Aunque todos son "botones" y responden a un "clic", cada uno realiza una acción diferente y específica. El polimorfismo permite esa flexibilidad.

¿Alguna vez te has preguntado cómo puedes escribir código general que funcione con objetos de distintas clases, pero que cada objeto realice su propia acción específica cuando se le pide lo mismo?

Aquí es donde entran en juego las **funciones virtuales** y la **sobreescritura** (o *override*).

Una **función virtual** es una función miembro de una clase base que se declara con la palabra clave `virtual`. Al hacer una función virtual, le indicamos al compilador que la implementación de esa función debe resolverse en tiempo de ejecución (dinámicamente), basándose en el tipo real del objeto al que apunta un puntero o referencia, y no en el tipo del puntero o referencia en tiempo de compilación.

La **sobreescritura** es el proceso por el cual una clase derivada proporciona su propia implementación para una función virtual que hereda de su clase base. Para que una función sea considerada "sobreescrita", su firma (nombre, tipo de retorno y lista de parámetros) debe coincidir exactamente con la de la función virtual en la clase base. En C++11 y versiones posteriores, se recomienda usar el especificador `override` después de la firma de la función en la clase derivada. Esto no es obligatorio, pero ayuda al compilador a detectar errores (por ejemplo, si la firma no coincide) y mejora la legibilidad.

Cuando utilizas punteros o referencias a la clase base para apuntar a objetos de clases derivadas, y llamas a una función virtual, C++ utiliza un mecanismo llamado "enlace dinámico" (dynamic binding) para determinar qué versión de la función (la de la clase base o la de la clase derivada) debe ejecutarse. Este es el corazón del polimorfismo en tiempo de ejecución y es fundamental para diseñar sistemas flexibles y extensibles.
''',
    'code_example': r'''
#include <iostream>
#include <string>
#include <vector> // Para usar std::vector
#include <memory> // Para usar std::unique_ptr (buenas practicas con punteros)

// Clase Base: Animal
class Animal {
public:
    std::string nombre;

    Animal(std::string _nombre) : nombre(_nombre) {
        std::cout << "Constructor Animal: " << nombre << std::endl;
    }

    // Funcion virtual: Permite que las clases derivadas la sobreescriban
    // y que la version correcta se llame en tiempo de ejecucion.
    virtual void hacerSonido() const {
        std::cout << nombre << " hace un sonido generico." << std::endl;
    }

    // Otra funcion virtual
    virtual void moverse() const {
        std::cout << nombre << " se mueve de forma generica." << std::endl;
    }

    // Destructor virtual: ES CRÍTICO en herencia para asegurar la correcta limpieza
    // de recursos de las clases derivadas cuando se elimina a traves de un puntero base.
    virtual ~Animal() {
        std::cout << "Destructor Animal: " << nombre << std::endl;
    }
};

// Clase Derivada: Perro
class Perro : public Animal {
public:
    Perro(std::string _nombre) : Animal(_nombre) {
        std::cout << "Constructor Perro: " << nombre << std::endl;
    }

    // Sobreescritura de la funcion virtual hacerSonido()
    // El 'override' es opcional pero altamente recomendado para verificar la firma.
    void hacerSonido() const override {
        std::cout << nombre << " dice: ¡Guau! ¡Guau!" << std::endl;
    }

    // Sobreescritura de la funcion virtual moverse()
    void moverse() const override {
        std::cout << nombre << " corre rapidamente." << std::endl;
    }

    ~Perro() override {
        std::cout << "Destructor Perro: " << nombre << std::endl;
    }
};

// Clase Derivada: Gato
class Gato : public Animal {
public:
    Gato(std::string _nombre) : Animal(_nombre) {
        std::cout << "Constructor Gato: " << nombre << std::endl;
    }

    // Sobreescritura de la funcion virtual hacerSonido()
    void hacerSonido() const override {
        std::cout << nombre << " dice: ¡Miau! ¡Miau!" << std::endl;
    }

    // Sobreescritura de la funcion virtual moverse()
    void moverse() const override {
        std::cout << nombre << " camina sigilosamente." << std::endl;
    }

    ~Gato() override {
        std::cout << "Destructor Gato: " << nombre << std::endl;
    }
};

int main() {
    std::cout << "--- Funciones Virtuales y Sobreescritura ---" << std::endl;

    // Crear objetos de clases derivadas
    Perro miPerro("Fido");
    Gato miGato("Pelusa");
    Animal animalGenerico("Bestia"); // Objeto de la clase base

    std::cout << "\n--- Llamadas directas a objetos ---" << std::endl;
    miPerro.hacerSonido();
    miGato.hacerSonido();
    animalGenerico.hacerSonido();

    std::cout << "\n--- Polimorfismo en accion con punteros base ---" << std::endl;
    // Usamos punteros a la clase base Animal
    // Esto es donde el polimorfismo en tiempo de ejecución brilla.
    Animal* ptrAnimal1 = &miPerro;
    Animal* ptrAnimal2 = &miGato;
    Animal* ptrAnimal3 = &animalGenerico;

    ptrAnimal1->hacerSonido(); // Llama a Perro::hacerSonido()
    ptrAnimal2->hacerSonido(); // Llama a Gato::hacerSonido()
    ptrAnimal3->hacerSonido(); // Llama a Animal::hacerSonido()

    ptrAnimal1->moverse(); // Llama a Perro::moverse()
    ptrAnimal2->moverse(); // Llama a Gato::moverse()
    ptrAnimal3->moverse(); // Llama a Animal::moverse()

    std::cout << "\n--- Polimorfismo con std::vector de punteros (mejor con smart pointers) ---" << std::endl;
    // Un vector de punteros a Animal puede contener diferentes tipos de Animales
    std::vector<std::unique_ptr<Animal>> animales;
    animales.push_back(std::make_unique<Perro>("Max"));
    animales.push_back(std::make_unique<Gato>("Garfield"));
    animales.push_back(std::make_unique<Animal>("Pajaro")); // Un animal generico

    for (const auto& animalPtr : animales) {
        animalPtr->hacerSonido(); // Llamada polimórfica
        animalPtr->moverse();     // Llamada polimórfica
    } // Los destructores se llaman automaticamente al salir del scope del unique_ptr

    std::cout << "\n--- Fin del main ---" << std::endl;
    // Los destructores de miPerro, miGato y animalGenerico se llamarán al salir del ámbito de main.
    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 1,
    'tittle_level': 'Programación Orientada a Objetos (OOP)',
    'topic': 'Polimorfismo',
    'subtopic': 'Clases abstractas y funciones puramente virtuales',
    'definition': '''
En la Programación Orientada a Objetos, a veces necesitamos definir una interfaz común para un grupo de clases relacionadas, pero no queremos que la clase base sea instanciable por sí misma, porque no tiene sentido como un objeto completo y concreto. Pensemos por un momento en el concepto de "Figura Geométrica": sabemos que una figura tiene un área y un perímetro, pero ¿qué es una "Figura Geométrica" sin ser específicamente un Círculo, un Cuadrado o un Triángulo? Una "Figura Geométrica" genérica no se puede dibujar o calcular su área sin saber su forma. Aquí es donde entran en juego las **clases abstractas** y las **funciones puramente virtuales**.

¿Alguna vez has querido crear una clase base que sirva como un "contrato" o "plantilla" para otras clases, obligándolas a implementar ciertos comportamientos, pero sin permitir que la clase base sea un objeto por sí misma?

Una **clase abstracta** es una clase que no puede ser instanciada directamente (es decir, no puedes crear objetos de ella). Su propósito es servir como una clase base de la cual otras clases (clases derivadas concretas) pueden heredar. Una clase se convierte en abstracta si contiene al menos una **función puramente virtual**.

Una **función puramente virtual** es una función miembro de una clase base que se declara con la palabra clave `virtual` y se iguala a `0` (`= 0`) al final de su declaración. Esto le dice al compilador que la clase base no proporciona una implementación para esa función, y que cualquier clase derivada *concreta* (no abstracta) debe proporcionar su propia implementación para esa función. Si una clase derivada no implementa todas las funciones puramente virtuales de su clase base abstracta, entonces esa clase derivada también se convierte automáticamente en una clase abstracta.

Las clases abstractas y las funciones puramente virtuales son esenciales para:
* **Definir interfaces**: Obligan a las clases derivadas a seguir un contrato específico.
* **Lograr polimorfismo**: Permiten usar punteros o referencias a la clase base abstracta para operar polimórficamente sobre objetos de diferentes clases derivadas concretas.
* **Diseñar jerarquías de clases**: Proporcionan una base común para clases relacionadas que comparten un comportamiento general, pero difieren en su implementación específica.
* **Evitar la instanciación de clases incompletas**: Aseguran que solo se creen objetos de clases que tienen una implementación completa para todas las funcionalidades requeridas.
''',
    'code_example': r'''
#include <iostream>
#include <string>
#include <vector>
#include <cmath> // Para M_PI

// --- Clase Abstracta: FiguraGeometrica ---
// No se pueden crear objetos de esta clase directamente.
// Sirve como una interfaz para otras figuras.
class FiguraGeometrica {
public:
    std::string nombre;

    FiguraGeometrica(std::string _nombre) : nombre(_nombre) {
        std::cout << "Constructor de FiguraGeometrica: " << nombre << std::endl;
    }

    // Funcion puramente virtual: Obliga a las clases derivadas a implementarla.
    // No tiene implementacion en la clase base.
    virtual double calcularArea() const = 0; // = 0 la hace puramente virtual

    // Otra funcion puramente virtual
    virtual double calcularPerimetro() const = 0;

    // Una funcion virtual normal (con implementacion por defecto, que puede ser sobreescrita)
    virtual void mostrarInfo() const {
        std::cout << "Soy una figura geometrica: " << nombre << std::endl;
    }

    // Destructor virtual: Necesario para una correcta limpieza polimorfica.
    virtual ~FiguraGeometrica() {
        std::cout << "Destructor de FiguraGeometrica: " << nombre << std::endl;
    }
};

// Clase Concreta: Circulo (deriva de FiguraGeometrica)
// Debe implementar todas las funciones puramente virtuales de FiguraGeometrica
class Circulo : public FiguraGeometrica {
private:
    double radio;
public:
    Circulo(std::string _nombre, double _radio) : FiguraGeometrica(_nombre), radio(_radio) {
        std::cout << "Constructor de Circulo: " << nombre << " (radio: " << radio << ")" << std::endl;
    }

    // Implementacion de funcion puramente virtual
    double calcularArea() const override {
        return M_PI * radio * radio;
    }

    // Implementacion de funcion puramente virtual
    double calcularPerimetro() const override {
        return 2 * M_PI * radio;
    }

    // Sobreescritura opcional de funcion virtual normal
    void mostrarInfo() const override {
        std::cout << "Soy un circulo: " << nombre << ", Radio: " << radio << std::endl;
    }

    ~Circulo() override {
        std::cout << "Destructor de Circulo: " << nombre << std::endl;
    }
};

// Clase Concreta: Rectangulo (deriva de FiguraGeometrica)
class Rectangulo : public FiguraGeometrica {
private:
    double ancho;
    double alto;
public:
    Rectangulo(std::string _nombre, double _ancho, double _alto)
        : FiguraGeometrica(_nombre), ancho(_ancho), alto(_alto) {
        std::cout << "Constructor de Rectangulo: " << nombre << " (ancho: " << ancho << ", alto: " << alto << ")" << std::endl;
    }

    double calcularArea() const override {
        return ancho * alto;
    }

    double calcularPerimetro() const override {
        return 2 * (ancho + alto);
    }

    ~Rectangulo() override {
        std::cout << "Destructor de Rectangulo: " << nombre << std::endl;
    }
};

// Clase que NO implementa todas las funciones puramente virtuales, por lo tanto, es abstracta.
// class Triangulo : public FiguraGeometrica {
// public:
//     Triangulo(std::string _nombre) : FiguraGeometrica(_nombre) {}
//     // Falta implementar calcularArea() y calcularPerimetro(), asi que Triangulo seria abstracta
// };


int main() {
    std::cout << "--- Clases Abstractas y Funciones Puramente Virtuales ---" << std::endl;

    // MAL EJEMPLO: No se puede instanciar una clase abstracta directamente
    // FiguraGeometrica miFigura; // ERROR: no se puede crear instancia de clase abstracta

    // Podemos usar punteros o referencias a la clase abstracta para apuntar a objetos de clases concretas
    // Esto es el polimorfismo en accion.
    std::vector<FiguraGeometrica*> figuras;

    // Crear objetos de clases concretas y añadir a nuestro vector polimorfico
    figuras.push_back(new Circulo("Circulo Rojo", 5.0));
    figuras.push_back(new Rectangulo("Rectangulo Azul", 4.0, 6.0));
    figuras.push_back(new Circulo("Circulo Verde", 3.0));

    std::cout << "\n--- Procesando figuras polimorficamente ---" << std::endl;
    for (const auto& figura : figuras) {
        figura->mostrarInfo(); // Llama a la version especifica de mostrarInfo()
        std::cout << "  Area: " << figura->calcularArea() << std::endl;
        std::cout << "  Perimetro: " << figura->calcularPerimetro() << std::endl;
        std::cout << std::endl;
    }

    // IMPORTANTE: Liberar la memoria asignada dinámicamente
    std::cout << "--- Liberando memoria (destructores llamados) ---" << std::endl;
    for (auto& figura : figuras) {
        delete figura; // El destructor virtual asegura que se llama al destructor de la clase derivada
        figura = nullptr;
    }
    figuras.clear();

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 1,
    'tittle_level': 'Programación Orientada a Objetos (OOP)',
    'topic': 'Polimorfismo',
    'subtopic': 'Polimorfismo en tiempo de ejecución',
    'definition': '''
El **polimorfismo en tiempo de ejecución** (también conocido como polimorfismo dinámico o *runtime polymorphism*) es la capacidad del código de C++ para determinar qué versión de una función virtual debe ejecutarse basándose en el *tipo real del objeto* al que apunta un puntero o referencia, y no en el *tipo declarado* del puntero o referencia. Esto ocurre durante la ejecución del programa, no durante la compilación. Pensemos por un momento en una aplicación de dibujo donde tienes diferentes herramientas: lápiz, pincel, borrador. Todas son "herramientas de dibujo" y tienen un método `dibujar()`, pero cada una dibuja de una manera diferente. Cuando el usuario selecciona una herramienta, la aplicación no necesita saber si es un lápiz o un pincel; simplemente llama a `herramientaSeleccionada->dibujar()`, y la herramienta correcta hace su trabajo.

¿Alguna vez te has preguntado cómo los frameworks o las bibliotecas pueden manejar objetos de tipos muy diferentes de manera uniforme, sin necesidad de saber el tipo exacto de cada objeto de antemano?

El polimorfismo en tiempo de ejecución es la respuesta y se logra en C++ mediante:

1.  **Herencia**: Tener una jerarquía de clases donde una clase base tiene una o más clases derivadas.
2.  **Funciones virtuales**: Las funciones que queremos que se comporten polimórficamente deben ser declaradas como `virtual` en la clase base y sobreescritas en las clases derivadas. Es fundamental que el destructor de la clase base también sea `virtual` para asegurar una liberación de memoria correcta en escenarios polimórficos (`delete ptr_base`).
3.  **Punteros o referencias a la clase base**: La clave para el polimorfismo dinámico es utilizar un puntero o una referencia a la clase base para apuntar a un objeto de una clase derivada. Cuando se llama a una función virtual a través de este puntero o referencia, C++ utiliza una tabla de funciones virtuales (vtable) y un puntero virtual (vptr) asociados a cada objeto para determinar dinámicamente la función correcta a ejecutar.

Este tipo de polimorfismo es increíblemente útil para diseñar software flexible y extensible. Permite escribir código más genérico que opera sobre una interfaz común (la clase base), mientras que los detalles específicos de la implementación se manejan en las clases derivadas. Esto facilita añadir nuevas funcionalidades (nuevas clases derivadas) sin tener que modificar el código existente que utiliza la interfaz base. Es la base para el diseño de componentes, *plugins* y arquitecturas de software que pueden adaptarse y crecer fácilmente.
''',
    'code_example': r'''
#include <iostream>
#include <string>
#include <vector>
#include <memory> // Para std::unique_ptr

// Clase Base: Empleado
class Empleado {
public:
    std::string nombre;
    double salarioBase;

    Empleado(std::string _nombre, double _salarioBase) : nombre(_nombre), salarioBase(_salarioBase) {
        std::cout << "Constructor Empleado: " << nombre << std::endl;
    }

    // Funcion virtual para calcular el salario. Cada tipo de empleado lo hara diferente.
    virtual double calcularSalarioTotal() const {
        return salarioBase; // Implementacion basica por defecto
    }

    // Funcion virtual para mostrar informacion.
    virtual void mostrarInformacion() const {
        std::cout << "Empleado: " << nombre << ", Salario Base: $" << salarioBase << std::endl;
    }

    // Destructor virtual: ES CRÍTICO para asegurar que los destructores de las clases
    // derivadas se llamen correctamente cuando se elimina un objeto a través de un puntero a la base.
    virtual ~Empleado() {
        std::cout << "Destructor Empleado: " << nombre << std::endl;
    }
};

// Clase Derivada: Desarrollador
class Desarrollador : public Empleado {
public:
    double bonoRendimiento;

    Desarrollador(std::string _nombre, double _salarioBase, double _bono)
        : Empleado(_nombre, _salarioBase), bonoRendimiento(_bono) {
        std::cout << "Constructor Desarrollador: " << nombre << std::endl;
    }

    // Sobreescritura de calcularSalarioTotal
    double calcularSalarioTotal() const override {
        return salarioBase + bonoRendimiento;
    }

    // Sobreescritura de mostrarInformacion
    void mostrarInformacion() const override {
        std::cout << "Desarrollador: " << nombre << ", Salario Base: $" << salarioBase
                  << ", Bono: $" << bonoRendimiento << ", Salario Total: $" << calcularSalarioTotal() << std::endl;
    }

    ~Desarrollador() override {
        std::cout << "Destructor Desarrollador: " << nombre << std::endl;
    }
};

// Clase Derivada: Gerente
class Gerente : public Empleado {
public:
    double comisionVentas;

    Gerente(std::string _nombre, double _salarioBase, double _comision)
        : Empleado(_nombre, _salarioBase), comisionVentas(_comision) {
        std::cout << "Constructor Gerente: " << nombre << std::endl;
    }

    // Sobreescritura de calcularSalarioTotal
    double calcularSalarioTotal() const override {
        return salarioBase + comisionVentas;
    }

    // Sobreescritura de mostrarInformacion
    void mostrarInformacion() const override {
        std::cout << "Gerente: " << nombre << ", Salario Base: $" << salarioBase
                  << ", Comision: $" << comisionVentas << ", Salario Total: $" << calcularSalarioTotal() << std::endl;
    }

    ~Gerente() override {
        std::cout << "Destructor Gerente: " << nombre << std::endl;
    }
};


int main() {
    std::cout << "--- Polimorfismo en Tiempo de Ejecucion (Dynamic Polymorphism) ---" << std::endl;

    // Creamos un vector de punteros inteligentes a la clase base Empleado.
    // Esto nos permite almacenar diferentes tipos de empleados de forma polimórfica.
    std::vector<std::unique_ptr<Empleado>> personal;

    // Agregamos diferentes tipos de empleados al vector
    personal.push_back(std::make_unique<Empleado>("Juan Perez", 3000.0));
    personal.push_back(std::make_unique<Desarrollador>("Ana Garcia", 4000.0, 1000.0));
    personal.push_back(std::make_unique<Gerente>("Carlos Ruiz", 5000.0, 1500.0));
    personal.push_back(std::make_unique<Desarrollador>("Laura Martinez", 3500.0, 750.0));

    std::cout << "\n--- Calculando y mostrando salarios de todo el personal ---" << std::endl;
    // Iteramos sobre el vector. A pesar de que 'empleadoPtr' es un puntero a 'Empleado',
    // la llamada a 'calcularSalarioTotal()' y 'mostrarInformacion()' se resuelve
    // en tiempo de ejecución al método correcto de la clase derivada.
    for (const auto& empleadoPtr : personal) {
        empleadoPtr->mostrarInformacion(); // Llamada polimórfica
        // std::cout << "Salario Total: $" << empleadoPtr->calcularSalarioTotal() << std::endl;
    }

    std::cout << "\n--- Demostracion de flexibilidad ---" << std::endl;
    // Si mañana creamos una nueva clase 'Contador' que herede de 'Empleado',
    // el bucle de arriba funcionará automáticamente con ella sin modificarlo.
    // Eso es el poder del polimorfismo.

    std::cout << "\n--- Fin del main ---" << std::endl;
    // Los destructores de los objetos se llamarán automáticamente
    // cuando los unique_ptr salgan de ámbito y liberen la memoria.
    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 1,
    'tittle_level': 'Programación Orientada a Objetos (OOP)',
    'topic': 'Abstracción y Encapsulamiento',
    'subtopic': 'Interfaces y clases base',
    'definition': '''
        La **abstracción** y el **encapsulamiento** son dos pilares fundamentales de la Programación Orientada a Objetos (OOP) que trabajan en conjunto para organizar y simplificar la complejidad del código. Pensemos por un momento en un coche: como conductor, interactúas con la interfaz del coche (volante, pedales, palanca de cambios) sin necesidad de entender cómo funciona internamente el motor, la transmisión o el sistema de frenos. La abstracción se enfoca en *qué* hace el coche (transportarte), mientras que el encapsulamiento se enfoca en *cómo* lo hace (ocultando los detalles internos).

        ¿Alguna vez te has encontrado con un sistema complejo donde era difícil entender cómo interactuar con sus componentes, o donde los cambios internos rompían el código que dependía de ellos?

        La abstracción y el encapsulamiento resuelven estos problemas al permitirnos crear clases y objetos que son fáciles de usar y mantener.

        * **Abstracción**: Se centra en definir la *interfaz* de un objeto, es decir, qué métodos y propiedades son visibles y cómo interactúan los usuarios de la clase con ella. La abstracción nos permite enfocarnos en los aspectos esenciales de un objeto, ignorando los detalles irrelevantes. Esto reduce la complejidad y facilita el uso de la clase. En C++, las **clases base** a menudo juegan un papel importante en la abstracción, ya que definen una interfaz común para un grupo de clases derivadas relacionadas. Las clases base pueden ser abstractas (como vimos en el tema de polimorfismo) o concretas.

        * **Encapsulamiento**: Se centra en *ocultar* los detalles de implementación internos de una clase y controlar el acceso a sus datos (atributos). Esto se logra utilizando especificadores de acceso (`private`, `protected`, `public`). El encapsulamiento protege la integridad de los datos, evita el acceso no autorizado y permite que la implementación interna de una clase cambie sin afectar el código que la utiliza (siempre y cuando la interfaz pública permanezca constante). Los **métodos *getter*** (para obtener el valor de un atributo) y los **métodos *setter*** (para modificar el valor de un atributo) son herramientas clave para el encapsulamiento.

        En C++, no tenemos el concepto de "interfaces" como en Java o C#, pero podemos lograr una funcionalidad similar utilizando clases abstractas con funciones puramente virtuales. Estas clases definen un contrato que las clases derivadas deben cumplir.
        ''',
    'code_example': r'''
        #include <iostream>
        #include <string>
        #include <vector>

        // --- Abstraccion y Encapsulamiento ---

        // Clase Base Abstracta (simula una "Interfaz" en C++)
        // Define una interfaz para cualquier objeto que pueda ser "dibujado"
        class Dibujable {
        public:
            virtual void dibujar() const = 0; // Funcion puramente virtual
            virtual ~Dibujable() {} // Destructor virtual
        };

        // Clase Concreta: Circulo (implementa la interfaz Dibujable)
        class Circulo : public Dibujable {
        private:
            double radio;
            // Encapsulamiento: 'radio' es privado, solo accesible desde dentro de Circulo
        public:
            Circulo(double _radio) : radio(_radio) {}

            void dibujar() const override {
                std::cout << "Dibujando un circulo de radio " << radio << std::endl;
            }
        };

        // Clase Concreta: Rectangulo (implementa la interfaz Dibujable)
        class Rectangulo : public Dibujable {
        private:
            double ancho;
            double alto;
            // Encapsulamiento: 'ancho' y 'alto' son privados
        public:
            Rectangulo(double _ancho, double _alto) : ancho(_ancho), alto(_alto) {}

            void dibujar() const override {
                std::cout << "Dibujando un rectangulo de ancho " << ancho << " y alto " << alto << std::endl;
            }
        };

        // Clase que usa la abstraccion (solo le importa que sea Dibujable)
        class Lienzo {
        public:
            void agregarDibujable(Dibujable* d) { // Usa un puntero a la clase base abstracta
                dibujables.push_back(d);
            }

            void dibujarTodo() const {
                for (const auto* d : dibujables) {
                    d->dibujar(); // Llama al metodo dibujar() polimorficamente
                }
            }

            ~Lienzo() { // Destructor para liberar la memoria
                for (auto* d : dibujables) {
                    delete d;
                }
            }
        private:
            std::vector<Dibujable*> dibujables;
        };


        int main() {
            std::cout << "--- Abstraccion y Encapsulamiento ---" << std::endl;

            // Abstraccion: Lienzo no sabe (ni le importa) si dibuja circulos o rectangulos
            Lienzo miLienzo;
            miLienzo.agregarDibujable(new Circulo(5.0));
            miLienzo.agregarDibujable(new Rectangulo(4.0, 6.0));
            miLienzo.agregarDibujable(new Circulo(2.0));

            miLienzo.dibujarTodo(); // Dibuja todos los objetos en el lienzo

            // Encapsulamiento: Los detalles de como se dibuja un circulo o un rectangulo
            // estan ocultos dentro de sus respectivas clases.
            // El Lienzo solo interactua con la interfaz comun (Dibujable).

            return 0;
        }
        '''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 1,
    'tittle_level': 'Programación Orientada a Objetos (OOP)',
    'topic': 'Abstracción y Encapsulamiento',
    'subtopic': 'Ocultamiento de información',
    'definition': '''
        El **ocultamiento de información** es un principio fundamental del encapsulamiento en la Programación Orientada a Objetos (OOP). Se refiere a la práctica de restringir el acceso a los detalles de implementación internos de una clase y exponer solo una interfaz bien definida para interactuar con esa clase. Pensemos por un momento en una computadora: como usuario, interactúas con ella a través de la pantalla, el teclado y el ratón. No necesitas saber cómo funcionan internamente la CPU, la memoria o la tarjeta gráfica para usarla. La computadora *oculta* su complejidad interna y te proporciona una interfaz simple y fácil de usar.

        ¿Alguna vez te has encontrado con una clase donde podías modificar sus datos internos directamente, lo que llevaba a errores o inconsistencias? ¿O donde los cambios internos en una clase rompían el código que dependía de ella?

        El ocultamiento de información resuelve estos problemas al:

        1.  **Proteger la integridad de los datos**: Al hacer que los atributos de una clase sean `private` o `protected`, evitamos que el código externo los modifique directamente, lo que podría llevar a estados inválidos o inconsistentes. Los métodos *setter* proporcionan una forma controlada de modificar los atributos, permitiendo validaciones o transformaciones si es necesario.
        2.  **Reducir la complejidad**: Al ocultar los detalles de implementación, hacemos que la clase sea más fácil de entender y usar. Los usuarios de la clase solo necesitan conocer la interfaz pública.
        3.  **Permitir la evolución de la clase**: Podemos cambiar la implementación interna de una clase (por ejemplo, mejorar la eficiencia o corregir errores) sin afectar el código que la utiliza, siempre y cuando la interfaz pública permanezca constante. Esto facilita el mantenimiento y la evolución del software.
        4.  **Promover la modularidad**: El ocultamiento de información ayuda a crear componentes de software independientes y reutilizables. Cada clase se convierte en una "caja negra" con una interfaz clara, lo que facilita su integración en sistemas más grandes.

        En C++, el ocultamiento de información se logra principalmente mediante los **especificadores de acceso**:
        * `private`: Los miembros (atributos y métodos) declarados como `private` solo son accesibles desde dentro de la propia clase.
        * `protected`: Los miembros `protected` son accesibles desde dentro de la propia clase y desde las clases que heredan de ella.
        * `public`: Los miembros `public` son accesibles desde cualquier parte del programa.

        El ocultamiento de información es un principio clave para escribir código robusto, mantenible y extensible.
        ''',
    'code_example': r'''
        #include <iostream>
        #include <string>

        // --- Ocultamiento de Informacion (Information Hiding) ---

        class Coche {
        private: // Atributos privados: solo accesibles desde dentro de la clase
            std::string marca;
            std::string modelo;
            int anio;
            double velocidad; // en km/h

        public: // Metodos publicos: forman la interfaz de la clase
            // Constructor: inicializa el objeto con valores validos
            Coche(std::string _marca, std::string _modelo, int _anio)
                : marca(_marca), modelo(_modelo), anio(_anio), velocidad(0.0) {
                // El constructor asegura que el objeto se crea en un estado valido
                std::cout << "Coche construido: " << marca << " " << modelo << " (" << anio << ")" << std::endl;
            }

            // Metodo Getter: para obtener la marca (solo lectura)
            std::string getMarca() const {
                return marca;
            }

            // Metodo Getter: para obtener el modelo
            std::string getModelo() const {
                return modelo;
            }

            // Metodo Getter: para obtener el anio
            int getAnio() const {
                return anio;
            }

            // Metodo Getter: para obtener la velocidad
            double getVelocidad() const {
                return velocidad;
            }

            // Metodo Setter: para acelerar (modifica la velocidad de forma controlada)
            void acelerar(double incremento) {
                if (incremento > 0) {
                    velocidad += incremento;
                    std::cout << "Acelerando... Velocidad actual: " << velocidad << " km/h" << std::endl;
                } else {
                    std::cout << "Error: El incremento debe ser positivo." << std::endl;
                }
            }

            // Metodo Setter: para frenar (modifica la velocidad de forma controlada)
            void frenar(double decremento) {
                if (decremento > 0 && velocidad - decremento >= 0) {
                    velocidad -= decremento;
                    std::cout << "Frenando... Velocidad actual: " << velocidad << " km/h" << std::endl;
                } else if (decremento > 0) {
                    velocidad = 0.0;
                    std::cout << "Frenando... Coche detenido." << std::endl;
                } else {
                     std::cout << "Error: El decremento debe ser positivo." << std::endl;
                }
           }

            // Metodo para mostrar informacion del coche
            void mostrarInformacion() const {
                std::cout << "\n--- Informacion del Coche ---" << std::endl;
                std::cout << "Marca: " << marca << std::endl;
                std::cout << "Modelo: " << modelo << std::endl;
                std::cout << "Año: " << anio << std::endl;
                std::cout << "Velocidad: " << velocidad << " km/h" << std::endl;
                std::cout << "---------------------------" << std::endl;
            }
        };

        int main() {
            std::cout << "--- Ocultamiento de Informacion ---" << std::endl;

            // Crear un objeto Coche
            Coche miCoche("Toyota", "Corolla", 2023);

            // Intentar acceder directamente a un miembro privado (esto resultaria en un error de compilacion)
            // miCoche.velocidad = 150.0; // ERROR: 'velocidad' es privado

            // Acceder a miembros a traves de metodos publicos (getters y setters)
            std::cout << "Marca: " << miCoche.getMarca() << std::endl;
            std::cout << "Velocidad actual: " << miCoche.getVelocidad() << " km/h" << std::endl;

            miCoche.acelerar(50.0);
            miCoche.frenar(20.0);
            miCoche.frenar(100.0); // Intentar frenar mas de lo que se puede

            miCoche.mostrarInformacion();

            // El codigo externo no necesita saber como funciona internamente el Coche
            // solo necesita usar la interfaz publica (metodos getters y setters).
            return 0;
        }
        '''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 1,
    'tittle_level': 'Programación Orientada a Objetos (OOP)',
    'topic': 'Abstracción y Encapsulamiento',
    'subtopic': 'Buenas prácticas de diseño',
    'definition': '''
        Las **buenas prácticas de diseño** en la Programación Orientada a Objetos (OOP) son un conjunto de principios y directrices que nos ayudan a crear código robusto, mantenible, extensible y fácil de entender. No son reglas estrictas, sino recomendaciones que, cuando se siguen, conducen a un software de mayor calidad. Pensemos por un momento en la construcción de un edificio: un buen arquitecto no solo se preocupa por la apariencia, sino también por la estructura, la seguridad, la eficiencia y la facilidad de mantenimiento. De manera similar, un buen diseñador de software OOP se preocupa por la arquitectura de las clases y sus relaciones.

        ¿Alguna vez te has encontrado con un proyecto de software donde era difícil añadir nuevas funcionalidades, donde los errores eran difíciles de rastrear, o donde el código era tan complejo que nadie lo entendía?

        Las buenas prácticas de diseño en OOP nos ayudan a evitar estos problemas. Algunas de las más importantes son:

        1.  **Principio de Responsabilidad Única (SRP)**: Una clase debe tener una y solo una razón para cambiar. Esto significa que una clase debe tener una única responsabilidad bien definida. Si una clase hace demasiadas cosas, se vuelve difícil de mantener y modificar.
        2.  **Principio de Abierto/Cerrado (OCP)**: Las clases deben estar abiertas para la extensión (es decir, se debe poder añadir nueva funcionalidad sin modificar el código existente) pero cerradas para la modificación (el código existente no debe ser modificado). Esto se logra a menudo mediante el uso de herencia y polimorfismo.
        3.  **Principio de Sustitución de Liskov (LSP)**: Las subclases deben ser sustituibles por sus clases base sin alterar la corrección del programa. Esto significa que una subclase debe comportarse de manera consistente con la interfaz de su clase base.
        4.  **Principio de Segregación de la Interfaz (ISP)**: Es mejor tener muchas interfaces específicas para los clientes que una interfaz general grande. Esto evita que las clases implementen métodos que no necesitan.
        5.  **Principio de Inversión de Dependencias (DIP)**: Las dependencias deben ser abstractas. Las clases de alto nivel no deben depender de las clases de bajo nivel. Ambas deben depender de abstracciones. Las abstracciones no deben depender de los detalles. Los detalles deben depender de las abstracciones. Esto promueve el acoplamiento débil y la reutilización.
        6.  **Favor de la composición sobre la herencia**: En muchos casos, es mejor combinar objetos de diferentes clases para lograr la funcionalidad deseada (composición) en lugar de crear una jerarquía de herencia profunda. La composición suele ser más flexible y fácil de mantener.
        7.  **Usar la abstracción y el encapsulamiento**: Como ya hemos visto, la abstracción nos permite enfocarnos en lo esencial, y el encapsulamiento protege la integridad de los datos y simplifica el uso de las clases.
        8.  **Programar para una interfaz, no para una implementación**: Depender de interfaces o clases abstractas en lugar de clases concretas hace que el código sea más flexible y fácil de cambiar.
        9.  **Evitar el código duplicado (DRY - Don't Repeat Yourself)**: El código duplicado hace que el mantenimiento sea más difícil y aumenta la probabilidad de errores.
        10. **Mantener las clases pequeñas y enfocadas**: Una clase grande y compleja es difícil de entender y mantener.
        11. **Usar nombres descriptivos**: Los nombres de las clases, métodos y variables deben ser claros y descriptivos.
        12. **Comentar el código**: Los comentarios ayudan a entender el propósito del código y cómo funciona.

        Seguir estas buenas prácticas nos ayuda a crear software que es más fácil de entender, mantener, probar y extender.
        ''',
    'code_example': r'''
        #include <iostream>
        #include <string>
        #include <vector>

        // --- Buenas Practicas de Diseno en OOP ---

        // 1. Principio de Responsabilidad Unica (SRP)
        // MAL EJEMPLO: Una clase que hace demasiadas cosas
        // class Usuario {
        // public:
        //     std::string nombre;
        //     std::string email;

        //     void guardarEnBaseDeDatos() { /* ... */ }
        //     void enviarEmailDeBienvenida() { /* ... */ }
        //     void validarCredenciales() { /* ... */ }
        // };

        // BUEN EJEMPLO: Clases con responsabilidades separadas
        class Usuario {
        public:
            std::string nombre;
            std::string email;
        };

        class UsuarioRepositorio { // Responsable de la persistencia
        public:
            void guardar(const Usuario& usuario) { /* ... */ }
        };

        class EmailServicio { // Responsable de enviar emails
        public:
            void enviarEmailDeBienvenida(const Usuario& usuario) { /* ... */ }
        };

        class Autenticador { // Responsable de la autenticacion
        public:
            bool validarCredenciales(const std::string& email, const std::string& password) { /* ... */ return true; }
        };


        // 2. Principio de Abierto/Cerrado (OCP)
        // Usamos herencia y polimorfismo para extender el comportamiento sin modificar el codigo existente
        class Notificador { // Clase Base
        public:
            virtual void notificar(const std::string& mensaje) const = 0;
            virtual ~Notificador() {}
        };

        class NotificadorEmail : public Notificador { // Extension sin modificacion
        public:
            void notificar(const std::string& mensaje) const override {
                std::cout << "Enviando email: " << mensaje << std::endl;
            }
        };

        class NotificadorSMS : public Notificador { // Otra extension sin modificacion
        public:
            void notificar(const std::string& mensaje) const override {
                std::cout << "Enviando SMS: " << mensaje << std::endl;
            }
        };


        // 6. Favor de la composicion sobre la herencia
        // En lugar de una jerarquia de herencia compleja, usamos composicion
        class Motor { // Componente
        public:
            void arrancar() const { std::cout << "Motor arrancando..." << std::endl; }
        };

        class Ruedas { // Otro Componente
        public:
            void girar() const { std::cout << "Ruedas girando..." << std::endl; }
        };

        class Coche { // Clase que usa composicion
        private:
            Motor motor;
            Ruedas ruedas;
        public:
            void conducir() const {
                motor.arrancar();
                ruedas.girar();
                std::cout << "Coche en movimiento..." << std::endl;
            }
        };

        int main() {
            std::cout << "--- Buenas Practicas de Diseno en OOP ---" << std::endl;

            // Ejemplo de OCP
            std::vector<Notificador*> notificadores;
            notificadores.push_back(new NotificadorEmail());
            notificadores.push_back(new NotificadorSMS());

            for (const auto* notificador : notificadores) {
                notificador->notificar("¡Hola!"); // Funciona con cualquier tipo de notificador
            }

            // Ejemplo de Composicion
            Coche miCoche;
            miCoche.conducir();

            // Liberar memoria
            for (auto* notificador : notificadores) {
                delete notificador;
            }

            return 0;
        }
        '''
  });
}

Future<void> insertMidLevel2DataCpp(Database db) async {
  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 2,
    'tittle_level': 'Templates y Programación Genérica',
    'topic': 'Templates de Función y Clase',
    'subtopic': 'Definición y uso de templates',
    'definition': '''
Los templates en C++ son como planos que te permiten construir funciones o clases que operan con diferentes tipos de datos, sin necesidad de reescribir el código una y otra vez. Es una forma de escribir código "genérico" que se adapta a las necesidades de cada tipo.

¿Alguna vez te has encontrado escribiendo la misma lógica una y otra vez, solo cambiando el tipo de dato con el que trabajabas?

Los templates nos salvan de esa duplicidad. Imagina que quieres una función `maximo` que funcione tanto con `int` como con `double` o `std::string`. En lugar de crear `maximo_int`, `maximo_double`, etc., defines un solo template de función. El compilador de C++ es el encargado de generar el código específico para cada tipo que utilices. Esto se llama instanciación. Las clases template funcionan de manera similar, permitiéndote crear estructuras de datos como vectores o listas que pueden contener cualquier tipo de elemento. Esto no solo ahorra un montón de tiempo, sino que también hace que tu código sea más flexible y robusto, ya que el compilador se asegura de que todo encaje correctamente. En esencia, los templates son una de las bases de la programación genérica en C++, y son fundamentales para el desarrollo de bibliotecas como la Standard Template Library (STL).
''',
    'code_example': r'''
#include <iostream>
#include <string>
#include <vector>

// --- Templates de Funcion ---

// Funcion template para encontrar el maximo de dos valores
// 'T' es un parametro de tipo. Puede ser cualquier tipo para el cual tenga sentido el operador '>'
template <typename T>
T maximo(T a, T b) {
    return (a > b) ? a : b;
}

// Funcion template para imprimir los elementos de un vector
// Funciona con cualquier tipo de vector
template <typename T>
void imprimirVector(const std::vector<T>& vec) {
    std::cout << "[";
    for (size_t i = 0; i < vec.size(); ++i) {
        std::cout << vec[i];
        if (i < vec.size() - 1) {
            std::cout << ", ";
        }
    }
    std::cout << "]" << std::endl;
}

// --- Templates de Clase ---

// Clase template para un vector generico
// 'T' es el tipo de los elementos del vector
template <typename T>
class VectorTemplate {
private:
    std::vector<T> elementos; // Vector de elementos de tipo T

public:
    void agregar(T elemento) {
        elementos.push_back(elemento);
    }

    T obtener(size_t indice) const {
        if (indice < elementos.size()) {
            return elementos[indice];
        } else {
            throw std::out_of_range("Indice fuera de rango");
        }
    }

    size_t tamano() const {
        return elementos.size();
    }

    void imprimir() const {
        imprimirVector(elementos); // Reutilizamos la funcion template imprimirVector
    }
};


int main() {
    std::cout << "--- Templates de Funcion ---" << std::endl;

    // Uso de la funcion template maximo() con diferentes tipos
    std::cout << "Maximo de 5 y 10: " << maximo(5, 10) << std::endl;          // T es int
    std::cout << "Maximo de 5.5 y 10.2: " << maximo(5.5, 10.2) << std::endl;    // T es double
    std::cout << "Maximo de 'a' y 'z': " << maximo('a', 'z') << std::endl;      // T es char
    std::cout << "Maximo de 'manzana' y 'pera': " << maximo(std::string("manzana"), std::string("pera")) << std::endl; // T es std::string

    std::cout << "\n--- Templates de Clase ---" << std::endl;

    // Uso de la clase template VectorTemplate con diferentes tipos
    VectorTemplate<int> vectorDeEnteros;
    vectorDeEnteros.agregar(10);
    vectorDeEnteros.agregar(20);
    vectorDeEnteros.agregar(30);
    std::cout << "Vector de enteros: ";
    vectorDeEnteros.imprimir();

    VectorTemplate<std::string> vectorDeStrings;
    vectorDeStrings.agregar("hola");
    vectorDeStrings.agregar("mundo");
    std::cout << "Vector de strings: ";
    vectorDeStrings.imprimir();

    // Los templates permiten escribir codigo generico y reutilizable.
    // El compilador genera el codigo especifico para cada tipo utilizado.
    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 2,
    'tittle_level': 'Templates y Programación Genérica',
    'topic': 'Templates de Función y Clase',
    'subtopic': 'Especialización de templates',
    'definition': '''
La especialización de templates te da la posibilidad de decirle a C++: "Oye, para este tipo de dato específico, quiero que uses una versión ligeramente diferente (o completamente diferente) de mi template". Es como tener una regla general, pero con excepciones bien definidas.

¿Te estás preguntando por qué esto importa?

Aquí es donde entra la especialización. Puedes crear una versión del template diseñada específicamente para ese tipo particular. El compilador, al encontrarse con una instanciación de ese tipo, automáticamente elegirá tu versión especializada en lugar de la genérica. Hay dos sabores principales: la especialización explícita, donde se redefine por completo el template para un tipo, y la especialización parcial (solo para clases), donde se fija uno o más parámetros de tipo mientras otros se mantienen genéricos. Esto es increíblemente útil para optimizar el rendimiento, manejar comportamientos específicos de ciertos tipos o incluso corregir limitaciones de un template genérico. Es una herramienta potente, pero úsala con criterio para no complicar innecesariamente tu código.
''',
    'code_example': r'''
#include <iostream>
#include <string>
#include <vector>
#include <algorithm> // Para std::sort

// --- Especializacion de Templates de Funcion ---

// Template de funcion generico para encontrar el maximo
template <typename T>
T maximo(T a, T b) {
    std::cout << "Template generico de maximo" << std::endl;
    return (a > b) ? a : b;
}

// Especializacion explicita para std::string
// Compara por longitud de la cadena en lugar de alfabeticamente
template <>
std::string maximo(std::string a, std::string b) {
    std::cout << "Template especializado para string" << std::endl;
    return (a.length() > b.length()) ? a : b;
}

// --- Especializacion de Templates de Clase ---

// Template de clase generico para un contenedor
template <typename T>
class Contenedor {
private:
    T valor;
public:
    Contenedor(T v) : valor(v) {
        std::cout << "Contenedor generico" << std::endl;
    }
    T obtenerValor() const { return valor; }
};

// Especializacion explicita para Contenedor<std::string>
// Almacena la longitud de la cadena en lugar de la cadena en si
template <>
class Contenedor<std::string> {
private:
    size_t longitud;
public:
    Contenedor(std::string s) : longitud(s.length()) {
        std::cout << "Contenedor especializado para string" << std::endl;
    }
    size_t obtenerValor() const { return longitud; }
};

// --- Especializacion Parcial (solo para templates de clase) ---

// Template de clase con dos parametros de tipo
template <typename T, typename U>
class MiTemplate {
public:
    MiTemplate() { std::cout << "MiTemplate generico" << std::endl; }
};

// Especializacion parcial: solo se especializa el primer parametro de tipo (T = int)
// U sigue siendo un tipo generico
template <typename U>
class MiTemplate<int, U> {
public:
    MiTemplate() { std::cout << "MiTemplate especializado para int, U" << std::endl; }
};


int main() {
    std::cout << "--- Especializacion de Templates de Funcion ---" << std::endl;
    std::cout << "Maximo de 5 y 10: " << maximo(5, 10) << std::endl; // Llama al template generico
    std::cout << "Maximo de 'manzana' y 'pera': " << maximo(std::string("manzana"), std::string("pera")) << std::endl; // Llama al template especializado

    std::cout << "\n--- Especializacion de Templates de Clase ---" << std::endl;
    Contenedor<int> contenedorInt(10); // Llama al template generico
    std::cout << "Valor: " << contenedorInt.obtenerValor() << std::endl;
    Contenedor<std::string> contenedorString("hola"); // Llama al template especializado
    std::cout << "Longitud: " << contenedorString.obtenerValor() << std::endl;

    std::cout << "\n--- Especializacion Parcial ---" << std::endl;
    MiTemplate<double, double> obj1; // Llama al template generico
    MiTemplate<int, double> obj2;    // Llama al template parcialmente especializado

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 2,
    'tittle_level': 'Templates y Programación Genérica',
    'topic': 'Templates de Función y Clase',
    'subtopic': 'Templates y sobrecarga de funciones',
    'definition': '''
La sobrecarga de funciones es cuando tienes varias funciones con el mismo nombre, pero que se diferencian por los tipos o el número de sus parámetros. C++ sabe cuál llamar basándose en los argumentos que le pasas. Es una manera genial de tener la misma "acción" con diferentes "formas de hacerla".

No sé tú, pero a mí esto al principio me costó.

Los templates y la sobrecarga son conceptos distintos, pero se llevan bastante bien. Puedes sobrecargar funciones que sean templates, o incluso sobrecargar funciones normales con funciones template. El compilador tiene un conjunto de reglas para decidir qué función llamar. Primero, busca una función no-template que encaje perfectamente. Si no la encuentra, entonces intenta instanciar un template que cumpla con los requisitos. Si hay varios templates que podrían servir, el compilador tiene un sistema para determinar cuál es la "mejor" coincidencia. Esta interacción te da una flexibilidad tremenda para crear código que se adapte a muchos escenarios, pero también requiere que entiendas cómo C++ resuelve estas llamadas para evitar ambigüedades. Es un equilibrio entre potencia y comprensión de las reglas del lenguaje.
''',
    'code_example': r'''
#include <iostream>
#include <string>

// --- Sobrecarga de Funciones (no templates) ---

// Funcion para sumar dos enteros
int sumar(int a, int b) {
    std::cout << "Sumando dos enteros" << std::endl;
    return a + b;
}

// Funcion sobrecargada para sumar dos flotantes
double sumar(double a, double b) {
    std::cout << "Sumando dos flotantes" << std::endl;
    return a + b;
}

// Funcion sobrecargada para sumar tres enteros
int sumar(int a, int b, int c) {
    std::cout << "Sumando tres enteros" << std::endl;
    return a + b + c;
}

// --- Templates y Sobrecarga ---

// Template de funcion para imprimir un valor
template <typename T>
void imprimir(T valor) {
    std::cout << "Template: Imprimiendo un valor: " << valor << std::endl;
}

// Funcion no-template sobrecargada para imprimir cadenas
// Esta funcion se preferira cuando el argumento sea una cadena
void imprimir(const std::string& texto) {
    std::cout << "Sobrecarga no-template: Imprimiendo un string: " << texto << std::endl;
}

// Template de funcion sobrecargado para imprimir dos valores
template <typename T, typename U>
void imprimir(T valor1, U valor2) {
    std::cout << "Template sobrecargado: Imprimiendo dos valores: " << valor1 << ", " << valor2 << std::endl;
}

// --- Sobrecarga de Funciones dentro de una Clase Template ---

template <typename T>
class MiClase {
public:
    // Metodo sobrecargado para establecer el valor
    void establecerValor(T valor) {
        std::cout << "Estableciendo valor (template): " << valor << std::endl;
        this->valor = valor;
    }

    // Metodo sobrecargado para establecer el valor (para int)
    // Esta funcion se preferira cuando el argumento sea un int
    void establecerValor(int valor) {
        std::cout << "Estableciendo valor (int): " << valor << std::endl;
        this->valor = static_cast<T>(valor); // Conversion explicita a T
    }

private:
    T valor;
};


int main() {
    std::cout << "--- Sobrecarga de Funciones (no templates) ---" << std::endl;
    std::cout << "Suma de dos enteros: " << sumar(5, 10) << std::endl;
    std::cout << "Suma de dos flotantes: " << sumar(5.5, 10.2) << std::endl;
    std::cout << "Suma de tres enteros: " << sumar(5, 10, 15) << std::endl;

    std::cout << "\n--- Templates y Sobrecarga ---" << std::endl;
    imprimir(10);             // Llama al template imprimir(T)
    imprimir("hola");         // Llama a la sobrecarga no-template imprimir(const std::string&)
    imprimir(10, "mundo");    // Llama al template sobrecargado imprimir(T, U)

    std::cout << "\n--- Sobrecarga de Funciones dentro de una Clase Template ---" << std::endl;
    MiClase<double> objDouble;
    objDouble.establecerValor(5.5);   // Llama al template establecerValor(T)
    objDouble.establecerValor(10);    // Llama a la sobrecarga establecerValor(int)

    MiClase<std::string> objString;
    objString.establecerValor("hola"); // Llama al template establecerValor(T)
    objString.establecerValor(20);    // Llama a la sobrecarga establecerValor(int)

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 2,
    'tittle_level': 'Templates y Programación Genérica',
    'topic': 'Técnicas Avanzadas con Templates',
    'subtopic': 'SFINAE (Substitution Failure Is Not An Error)',
    'definition': '''
**SFINAE** es un concepto peculiar pero súper potente en C++ que significa "Substitution Failure Is Not An Error" (El Fallo de Sustitución No Es Un Error). En términos sencillos, cuando el compilador intenta reemplazar los parámetros de un template con tipos reales y esa sustitución falla (por ejemplo, porque una operación no tiene sentido para ese tipo), en lugar de lanzar un error y detener la compilación, simplemente ignora esa versión del template y busca otra que sí funcione.

Seguramente pensarás de qué va todo esto...

SFINAE es como un "control de acceso" sofisticado para tus templates. Es la razón por la que puedes tener múltiples templates que aparentemente hacen lo mismo, pero el compilador elige el correcto basándose en las propiedades de los tipos de datos que le pasas. Sin SFINAE, tendrías que hacer malabares con `if/else` preprocesador o simplemente escribir código mucho menos genérico y más restrictivo. Este principio es fundamental para implementar bibliotecas genéricas y para crear código extremadamente flexible, permitiendo que tus funciones o clases template se adapten de forma inteligente a diferentes tipos, o incluso que solo existan para ciertos tipos que cumplen con requisitos específicos. Es la magia detrás de cómo algunas funciones de la STL pueden comportarse de manera diferente (o ni siquiera compilar) dependiendo de si un tipo es "copiable", "movible", etc.
''',
    'code_example': r'''
#include <iostream>
#include <type_traits> // Para std::enable_if, std::is_integral, etc.
#include <string>

// --- Ejemplo Basico de SFINAE con std::enable_if ---

// 1. Template de funcion que solo compila para tipos integrales (int, char, long, etc.)
// std::enable_if<Condicion, Tipo>::type -> si Condicion es verdadera, define 'type' como Tipo.
// Si Condicion es falsa, 'type' no existe, lo que causa un fallo de sustitucion (SFINAE)
// y el compilador ignora esta sobrecarga.
template <typename T>
typename std::enable_if<std::is_integral<T>::value, T>::type
procesar(T valor) {
    std::cout << "Procesando integral: " << valor << std::endl;
    return valor * 2;
}

// 2. Template de funcion que solo compila para tipos de punto flotante (float, double, etc.)
template <typename T>
typename std::enable_if<std::is_floating_point<T>::value, T>::type
procesar(T valor) {
    std::cout << "Procesando flotante: " << valor << std::endl;
    return valor * 1.5;
}

// 3. Sobrecarga no-template para std::string (se preferira esta si el tipo es string)
void procesar(const std::string& valor) {
    std::cout << "Procesando string: " << valor << std::endl;
}

// --- Otro ejemplo de SFINAE: Detectando si un tipo tiene un metodo especifico ---

// Definicion de un trait para detectar si un tipo tiene un metodo 'draw()'
template <typename T>
struct HasDrawMethod {
private:
    template <typename C>
    static auto test(C*) -> decltype(std::declval<C>().draw(), std::true_type());

    template <typename C>
    static auto test(...) -> std::false_type;

public:
    static constexpr bool value = decltype(test<T>(nullptr))::value;
};

class Rectangulo {
public:
    void draw() { std::cout << "Dibujando Rectangulo" << std::endl; }
};

class Circulo {
public:
    void draw() { std::cout << "Dibujando Circulo" << std::endl; }
    void otraFuncion() {}
};

class Triangulo {}; // No tiene metodo draw()

// Funcion template que solo compila si el tipo tiene un metodo 'draw()'
template <typename T>
typename std::enable_if<HasDrawMethod<T>::value>::type
renderizar(T& objeto) {
    objeto.draw();
}

// Sobrecarga para tipos que NO tienen un metodo 'draw()'
template <typename T>
typename std::enable_if<!HasDrawMethod<T>::value>::type
renderizar(T& objeto) {
    std::cout << "No se puede dibujar este tipo de objeto." << std::endl;
}


int main() {
    std::cout << "--- Ejemplo con procesar() ---" << std::endl;
    procesar(10);        // Llama a la version para integrales
    procesar(3.14);      // Llama a la version para flotantes
    procesar(5L);        // Llama a la version para integrales (long es integral)
    procesar("Hello");   // Llama a la sobrecarga no-template para string

    // Ejemplo de fallo de sustitucion:
    // procesar(true); // bool es integral, asi que compilaria con el primer template
    // procesar(std::string("otro string")); // Llama a la sobrecarga no-template


    std::cout << "\n--- Ejemplo con renderizar() y HasDrawMethod ---" << std::endl;
    Rectangulo r;
    Circulo c;
    Triangulo t;

    renderizar(r); // Llama a la version que tiene draw()
    renderizar(c); // Llama a la version que tiene draw()
    renderizar(t); // Llama a la version que NO tiene draw()

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 2,
    'tittle_level': 'Templates y Programación Genérica',
    'topic': 'Técnicas Avanzadas con Templates',
    'subtopic': 'Traits y metaprogramación básica',
    'definition': '''
Los "**traits**" en C++ son como pequeños asistentes que te dan información sobre los tipos de datos en tiempo de compilación. No son funciones ni clases que ejecutan algo, sino más bien estructuras que, a través de la **metaprogramación** (código que manipula código), te permiten preguntar cosas sobre los tipos, como si son enteros, si pueden ser copiados, o si tienen ciertos métodos.

¿Te estás preguntando por qué esto importa?

Pensemos por un momento en las librerías estándar de C++ como la STL. Muchos de sus algoritmos y contenedores necesitan saber ciertas propiedades de los tipos con los que trabajan para ser eficientes o incluso para compilar. Por ejemplo, un algoritmo de ordenamiento podría optimizarse si sabe que los objetos se pueden mover eficientemente en lugar de copiarse. Los traits son la base de cómo C++ logra esta adaptabilidad sin penalizar el rendimiento. Permiten que los programadores de bibliotecas escriban código genérico que se especializa o se comporta de manera diferente según las características de los tipos utilizados, todo esto antes de que el programa se ejecute. Esto es metaprogramación básica: escribir código que genera o selecciona otro código en tiempo de compilación, lo que resulta en programas más optimizados y seguros. Es una de esas joyas de C++ que, aunque puede parecer un poco compleja al inicio, desbloquea un nivel de control y eficiencia fascinante.
''',
    'code_example': r'''
#include <iostream>
#include <type_traits> // La libreria estandar para traits

// --- Ejemplo de Traits de la STL ---

// 1. std::is_integral<T>::value
// Nos dice si T es un tipo entero (int, char, bool, long, etc.)
template <typename T>
void verificarTipoIntegral(T valor) {
    if (std::is_integral<T>::value) {
        std::cout << valor << " es un tipo integral." << std::endl;
    } else {
        std::cout << valor << " NO es un tipo integral." << std::endl;
    }
}

// 2. std::is_floating_point<T>::value
// Nos dice si T es un tipo de punto flotante (float, double, long double)
template <typename T>
void verificarTipoFlotante(T valor) {
    if (std::is_floating_point<T>::value) {
        std::cout << valor << " es un tipo de punto flotante." << std::endl;
    } else {
        std::cout << valor << " NO es un tipo de punto flotante." << std::endl;
    }
}

// 3. std::is_class<T>::value
// Nos dice si T es un tipo de clase
class MyClass {};
struct MyStruct {};

template <typename T>
void verificarTipoClase() {
    if (std::is_class<T>::value) {
        std::cout << "El tipo es una clase." << std::endl;
    } else {
        std::cout << "El tipo NO es una clase." << std::endl;
    }
}

// --- Metaprogramacion Basica: Calcular Factorial en tiempo de compilacion ---

// Template recursivo para calcular el factorial
template <int N>
struct Factorial {
    static const int value = N * Factorial<N - 1>::value;
};

// Caso base de la recursion para Factorial<0>
template <>
struct Factorial<0> {
    static const int value = 1;
};


int main() {
    std::cout << "--- Uso de Traits de la STL ---" << std::endl;
    verificarTipoIntegral(10);
    verificarTipoIntegral(3.14);
    verificarTipoIntegral('a');

    verificarTipoFlotante(10.0f);
    verificarTipoFlotante(5);

    std::cout << "Verificando tipos de clase:" << std::endl;
    std::cout << "int: "; verificarTipoClase<int>();
    std::cout << "MyClass: "; verificarTipoClase<MyClass>();
    std::cout << "MyStruct: "; verificarTipoClase<MyStruct>(); // structs tambien son clases para is_class

    std::cout << "\n--- Metaprogramacion Basica (Factorial en tiempo de compilacion) ---" << std::endl;
    // Estos calculos se realizan en tiempo de compilacion
    std::cout << "Factorial de 0: " << Factorial<0>::value << std::endl;
    std::cout << "Factorial de 3: " << Factorial<3>::value << std::endl; // 3 * 2 * 1 = 6
    std::cout << "Factorial de 5: " << Factorial<5>::value << std::endl; // 5 * 4 * 3 * 2 * 1 = 120

    // Los traits y la metaprogramacion permiten realizar computos y verificaciones
    // en tiempo de compilacion, lo que puede llevar a codigo mas eficiente y seguro.
    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 2,
    'tittle_level': 'Templates y Programación Genérica',
    'topic': 'Técnicas Avanzadas con Templates',
    'subtopic': 'Variadic templates',
    'definition': '''
Los **variadic templates**, o templates variádicos, son una característica de C++ que te permiten crear funciones o clases template que pueden aceptar un número *variable* de argumentos de template. Es decir, puedes tener cero, uno, dos, o la cantidad que quieras de tipos en tus parámetros de template, y tu código se adaptará.

Vamos a ver de que se trata todo esto...

Piensa en la función `printf` de C, o `std::cout` en C++. Ambas pueden tomar un número diferente de argumentos en cada llamada. Antes de los templates variádicos, lograr algo similar en C++ para tipos arbitrarios era un dolor de cabeza, involucrando recursión, herencia y un montón de código repetitivo. Los variadic templates simplifican drásticamente esto, permitiéndote manejar **paquetes de parámetros** de template que se "desempaquetan" recursivamente o con pliegues (folds) para procesar cada argumento. Son increíblemente útiles para implementar funciones de depuración, envoltorios de funciones (wrappers), constructores que reenenvían argumentos, y cualquier situación donde necesites flexibilidad en el número de argumentos de tipo. Es una de las características que realmente eleva la capacidad de la programación genérica en C++ a un nuevo nivel.
''',
    'code_example': r'''
#include <iostream>
#include <string>

// --- Ejemplo de Funcion Variadic Template ---

// Caso base de la recursion para la funcion 'imprimir'
// Se llama cuando ya no quedan mas argumentos que desempaquetar
void imprimir() {
    std::cout << std::endl; // Imprime un salto de linea al final
}

// Funcion variadic template para imprimir un numero variable de argumentos
// 'Args' es un paquete de parametros de tipo (variadic parameter pack)
template <typename T, typename... Args>
void imprimir(T primerArg, Args... argsRestantes) {
    std::cout << primerArg << " "; // Imprime el primer argumento
    imprimir(argsRestantes...); // Llamada recursiva con el resto de los argumentos
}

// --- Ejemplo de Clase Variadic Template (Tupla Simple) ---

// Caso base para la tupla vacia
template <>
class Tupla<> {
public:
    void mostrar() const {
        std::cout << "Tupla vacia." << std::endl;
    }
};

// Clase variadic template para una tupla que almacena un numero variable de tipos
template <typename T, typename... Resto>
class Tupla<T, Resto...> : public Tupla<Resto...> {
public:
    Tupla(T valor, Resto... resto_args)
        : m_valor(valor), Tupla<Resto...>(resto_args...) {
        // Constructor que pasa el resto de los argumentos a la clase base
    }

    T obtenerValor() const { return m_valor; }

    void mostrar() const {
        std::cout << m_valor << " ";
        Tupla<Resto...>::mostrar(); // Llama a la funcion mostrar de la clase base
    }

private:
    T m_valor;
};


int main() {
    std::cout << "--- Funcion Variadic Template 'imprimir' ---" << std::endl;
    imprimir("Hola", 123, 45.67, 'X', true);
    imprimir(1, 2, 3);
    imprimir("Solo un argumento");
    imprimir(); // Llama al caso base

    std::cout << "\n--- Clase Variadic Template 'Tupla' ---" << std::endl;
    Tupla<int, std::string, double> miTupla(10, "ejemplo", 3.14);
    std::cout << "Elementos de la tupla: ";
    miTupla.mostrar();

    Tupla<char, bool> otraTupla('A', false);
    std::cout << "Elementos de otra tupla: ";
    otraTupla.mostrar();

    // Podemos acceder a los elementos, pero la forma mas directa es a traves de la recursividad
    // en el metodo 'mostrar'. Acceder directamente a cada tipo requeriria mas metaprogramacion.
    // std::cout << "Primer elemento: " << miTupla.obtenerValor() << std::endl;

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 2,
    'tittle_level': 'Templates y Programación Genérica',
    'topic': 'Conceptos en C++20',
    'subtopic': 'Introducción a concepts',
    'definition': '''
Los **Concepts** son una de las características más emocionantes y útiles que llegaron con C++20. En esencia, son una forma de especificar requisitos para los parámetros de tus templates. Piensa en ellos como contratos o interfaces que un tipo debe cumplir para poder ser usado con tu template.

¿Te estás preguntando por qué esto importa?

Antes de los concepts, si el tipo que le pasabas a un template no era el adecuado, el compilador soltaba errores de sustitución crípticos y gigantes, difíciles de descifrar. Eran como rompecabezas con piezas que no encajaban, y el mensaje de error no te decía exactamente cuál era la pieza defectuosa. Los concepts resuelven este dolor de cabeza. Te permiten decir explícitamente: "Este template solo funciona con tipos que se puedan comparar", o "Este template solo acepta tipos que se puedan imprimir". Esto hace que los errores sean mucho más claros y tempranos, ya que el compilador te dirá directamente: "El tipo X no cumple con el concepto Y". Además, los concepts mejoran la legibilidad del código, porque ahora puedes ver de un vistazo qué tipo de operaciones se esperan de los parámetros de tus templates, lo que hace el código mucho más fácil de entender y mantener.
''',
    'code_example': r'''
#include <iostream>
#include <string>
#include <concepts> // Para usar concepts en C++20

// --- Introduccion a Concepts ---

// Concepto: Un tipo que es comparable usando el operador <
// (std::totally_ordered es un concepto predefinido en <concepts>)
// Podemos definir nuestros propios conceptos o usar los de la STL.
// Un tipo T cumple con std::totally_ordered si T se puede comparar con <, <=, >, >=
template <std::totally_ordered T>
T obtener_minimo(T a, T b) {
    return (a < b) ? a : b;
}

// Otro concepto: Un tipo que se puede imprimir en un ostream
// Este es un concepto personalizado
template <typename T>
concept Imprimible = requires(T valor) {
    { std::cout << valor } -> std::same_as<std::ostream&>; // Requisitos: std::cout << valor debe compilar y devolver ostream&
};

template <Imprimible T>
void saludar_y_imprimir(T mensaje) {
    std::cout << "Hola, aqui tienes tu mensaje: " << mensaje << std::endl;
}

// Ejemplo de un tipo que no es imprimible directamente sin sobrecarga
class MiClaseNoImprimible {};

// Ejemplo de un tipo que si es imprimible (sobrecargando el operador <<)
class MiClaseImprimible {
    std::string nombre;
public:
    MiClaseImprimible(std::string n) : nombre(n) {}
    // Sobrecarga del operador << para que MiClaseImprimible sea Imprimible
    friend std::ostream& operator<<(std::ostream& os, const MiClaseImprimible& obj) {
        return os << "MiClaseImprimible(" << obj.nombre << ")";
    }
};

int main() {
    std::cout << "--- Usando conceptos predefinidos (std::totally_ordered) ---" << std::endl;
    std::cout << "Minimo entre 5 y 10: " << obtener_minimo(5, 10) << std::endl;
    std::cout << "Minimo entre 3.14 y 2.71: " << obtener_minimo(3.14, 2.71) << std::endl;
    std::cout << "Minimo entre 'apple' y 'banana': " << obtener_minimo(std::string("apple"), std::string("banana")) << std::endl;

    // Esto generaria un error de compilacion porque MiClaseNoComparable no cumple con std::totally_ordered
    // class MiClaseNoComparable {};
    // std::cout << obtener_minimo(MiClaseNoComparable(), MiClaseNoComparable()) << std::endl;

    std::cout << "\n--- Usando conceptos personalizados (Imprimible) ---" << std::endl;
    saludar_y_imprimir("programacion!");
    saludar_y_imprimir(123);
    saludar_y_imprimir(true);

    MiClaseImprimible objImprimible("Concepto");
    saludar_y_imprimir(objImprimible);

    // Esto generaria un error de compilacion porque MiClaseNoImprimible no cumple con Imprimible
    // MiClaseNoImprimible objNoImprimible;
    // saludar_y_imprimir(objNoImprimible);

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 2,
    'tittle_level': 'Templates y Programación Genérica',
    'topic': 'Conceptos en C++20',
    'subtopic': 'Restricciones y validaciones en templates',
    'definition': '''
Las **restricciones y validaciones en templates** con Concepts en C++20 son como poner "filtros" o "requisitos" claros a los tipos de datos que pueden usar tus templates. En lugar de cruzar los dedos y esperar que el usuario del template pase un tipo compatible, tú puedes especificar exactamente qué capacidades debe tener ese tipo.

¿Te estás preguntando por qué esto importa?

Antes de Concepts, si un tipo no cumplía con las expectativas del template, el compilador lanzaba errores de compilación complejos y a menudo indescifrables, que aparecían en las profundidades de la instanciación del template. Esto era frustrante tanto para el que escribía el template como para el que lo usaba. Con Concepts, los errores son "frontales y centrales". El compilador te dirá directamente: "El tipo `X` no satisface el concepto `Y`", lo que facilita muchísimo la depuración. Puedes usar la palabra clave `requires` para definir un concepto que especifique operaciones válidas, tipos de retorno, excepciones, o incluso si un tipo tiene ciertos miembros. Esto te permite crear templates mucho más robustos y seguros, ya que garantizas desde el principio que los tipos con los que trabajas cumplen con las precondiciones necesarias. Es una mejora sustancial para la programación genérica en C++.
''',
    'code_example': r'''
#include <iostream>
#include <string>
#include <vector>
#include <concepts> // Para usar concepts en C++20

// --- Restricciones y Validaciones con Concepts ---

// Concepto 1: Tipo que se puede sumar y que es un numero
template <typename T>
concept SumableNumerico = std::is_arithmetic_v<T> && requires(T a, T b) {
    { a + b } -> std::same_as<T>; // a + b debe compilar y devolver un T
};

// Funcion template restringida por el concepto SumableNumerico
template <SumableNumerico T>
T sumar_numeros(T a, T b) {
    std::cout << "Sumando numeros con concepto SumableNumerico." << std::endl;
    return a + b;
}

// Concepto 2: Contenedor que tiene un metodo size() y es iterable
template <typename C>
concept ContenedorIterable = requires(C c) {
    { c.size() } -> std::convertible_to<size_t>; // c.size() debe compilar y ser convertible a size_t
    { c.begin() } -> std::input_or_output_iterator; // c.begin() debe devolver un iterador
    { c.end() } -> std::input_or_output_iterator;   // c.end() debe devolver un iterador
};

// Funcion template restringida por el concepto ContenedorIterable
template <ContenedorIterable C>
void procesar_contenedor(const C& contenedor) {
    std::cout << "Procesando contenedor con concepto ContenedorIterable. Tamano: " << contenedor.size() << std::endl;
    std::cout << "Elementos: [";
    for (const auto& elemento : contenedor) {
        std::cout << elemento << " ";
    }
    std::cout << "]" << std::endl;
}

// Clase que NO cumple con ContenedorIterable (no tiene size() ni begin()/end())
class MiClaseSinContenedor {};

// Clase que SI cumple con ContenedorIterable
class MiVectorPropio {
private:
    std::vector<int> datos;
public:
    void add(int val) { datos.push_back(val); }
    size_t size() const { return datos.size(); }
    auto begin() const { return datos.begin(); }
    auto end() const { return datos.end(); }
};


int main() {
    std::cout << "--- Restricciones con SumableNumerico ---" << std::endl;
    std::cout << "Suma de enteros: " << sumar_numeros(10, 20) << std::endl;
    std::cout << "Suma de flotantes: " << sumar_numeros(3.5, 2.1) << std::endl;
    // Esto causaria un error de compilacion porque std::string no es SumableNumerico
    // std::cout << sumar_numeros(std::string("hola"), std::string("mundo")) << std::endl;

    std::cout << "\n--- Restricciones con ContenedorIterable ---" << std::endl;
    std::vector<int> vec = {1, 2, 3, 4, 5};
    procesar_contenedor(vec);

    std::string str = "abcd"; // std::string tambien es un contenedor iterable
    procesar_contenedor(str);

    MiVectorPropio miVec;
    miVec.add(100);
    miVec.add(200);
    procesar_contenedor(miVec);

    // Esto causaria un error de compilacion porque MiClaseSinContenedor no cumple con ContenedorIterable
    // MiClaseSinContenedor objSinContenedor;
    // procesar_contenedor(objSinContenedor);

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 2,
    'tittle_level': 'Templates y Programación Genérica',
    'topic': 'Conceptos en C++20',
    'subtopic': 'Mejora de la legibilidad y mantenibilidad',
    'definition': '''
La **mejora de la legibilidad y mantenibilidad** gracias a los Concepts en C++20 es uno de sus mayores beneficios. Antes, cuando veías un template en C++, era común tener que investigar el cuerpo del template para entender qué tipo de operaciones se esperaban de sus parámetros. Era como un enigma que tenías que resolver.

¿Te estás preguntando por qué esto importa?

Con Concepts, esa incertidumbre desaparece. Ahora, cuando defines un template, puedes añadir una **restricción explícita** usando un concepto. Esto significa que la interfaz del template (cómo se supone que se use) se vuelve clara de inmediato. Por ejemplo, en lugar de `template <typename T>`, puedes escribir `template <Comparable T>`, lo que le dice al lector (y al compilador) que `T` debe ser un tipo comparable. Esta claridad no solo hace que el código sea más fácil de leer y entender para otros programadores (¡o para ti mismo en el futuro!), sino que también simplifica la depuración. Si un tipo no cumple con un concepto, el compilador te lo dirá de forma clara y concisa en el punto de uso, en lugar de generar una cascada de errores de instanciación indescifrables. Esto acelera el desarrollo, reduce errores y hace que el código sea inherentemente más mantenible y menos propenso a sorpresas desagradables. Es una mejora fundamental en la forma en que escribimos y entendemos el código genérico en C++.
''',
    'code_example': r'''
#include <iostream>
#include <string>
#include <vector>
#include <numeric> // Para std::accumulate
#include <concepts> // Para usar concepts en C++20

// --- Mejora de la Legibilidad y Mantenibilidad con Concepts ---

// Sin concepts: No es obvio a simple vista que 'T' debe ser un numero sumable
// template <typename T>
// T sumar_todo(const std::vector<T>& vec) {
//     T suma = T{};
//     for (const auto& val : vec) {
//         suma += val; // Que pasa si T no soporta += ? Error criptico.
//     }
//     return suma;
// }

// Con concepts: El requisito es claro gracias a std::integral o std::floating_point
template <typename T>
concept Numero = std::integral<T> || std::floating_point<T>;

template <Numero T>
T sumar_todo(const std::vector<T>& vec) {
    std::cout << "Sumando elementos de un vector de tipo numerico." << std::endl;
    T suma = T{}; // Inicializa con valor por defecto (0 para numeros)
    for (const auto& val : vec) {
        suma += val;
    }
    return suma;
}

// Otro ejemplo: Una funcion para encontrar el elemento mas grande
// Sin concepts:
// template <typename T>
// T encontrar_maximo(const std::vector<T>& vec) {
//     if (vec.empty()) return T{};
//     T max_val = vec[0];
//     for (size_t i = 1; i < vec.size(); ++i) {
//         if (vec[i] > max_val) { // Que pasa si T no soporta > ?
//             max_val = vec[i];
//         }
//     }
//     return max_val;
// }

// Con concepts: El requisito std::totally_ordered es explicito
template <std::totally_ordered T>
T encontrar_maximo(const std::vector<T>& vec) {
    std::cout << "Encontrando el maximo en un vector de tipo comparable." << std::endl;
    if (vec.empty()) {
        // En un caso real, podrias lanzar una excepcion o devolver un std::optional
        return T{};
    }
    T max_val = vec[0];
    for (size_t i = 1; i < vec.size(); ++i) {
        if (vec[i] > max_val) {
            max_val = vec[i];
        }
    }
    return max_val;
}

// Clase de ejemplo que no es totalmente_ordered (sin operador >)
class Punto {
public:
    int x, y;
    Punto(int px, int py) : x(px), y(py) {}
    // No hay operador > definido para Punto, asi que no cumple con std::totally_ordered
    // Si queremos que compile con encontrar_maximo, tendriamos que definirlo
};


int main() {
    std::cout << "--- Ejemplo de sumar_todo con Concept Numero ---" << std::endl;
    std::vector<int> ints = {1, 2, 3, 4, 5};
    std::cout << "Suma de ints: " << sumar_todo(ints) << std::endl;

    std::vector<double> doubles = {1.1, 2.2, 3.3};
    std::cout << "Suma de doubles: " << sumar_todo(doubles) << std::endl;

    // Esto causaria un error de compilacion claro, ya que std::string no es un Numero
    // std::vector<std::string> strings = {"a", "b"};
    // std::cout << sumar_todo(strings) << std::endl;

    std::cout << "\n--- Ejemplo de encontrar_maximo con Concept std::totally_ordered ---" << std::endl;
    std::vector<int> int_vals = {10, 5, 20, 15};
    std::cout << "Maximo int: " << encontrar_maximo(int_vals) << std::endl;

    std::vector<std::string> string_vals = {"banana", "apple", "cherry"};
    std::cout << "Maximo string: " << encontrar_maximo(string_vals) << std::endl;

    // Esto causaria un error de compilacion claro, ya que Punto no es std::totally_ordered
    // std::vector<Punto> puntos = {{1,1}, {2,2}};
    // std::cout << encontrar_maximo(puntos) << std::endl;

    return 0;
}
'''
  });
}

Future<void> insertMidLevel3DataCpp(Database db) async {
  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 3,
    'tittle_level': 'Manejo de Memoria y Recursos',
    'topic': 'Gestión de Memoria Dinámica',
    'subtopic': 'Operadores new y delete',
    'definition': '''
En C++, tienes la posibilidad de manejar la memoria de forma **dinámica**, lo que significa que puedes solicitar espacio de memoria mientras tu programa se está ejecutando, y no solo cuando lo compilas. Para hacer esto, usas los operadores `new` y `delete`.

Pensemos por un momento en las variables que declaras normalmente, como un `int x;`. Esa variable se crea cuando la función donde está declarada se ejecuta y se destruye automáticamente cuando la función termina. Pero, ¿qué pasa si necesitas una estructura de datos que solo se sepa su tamaño en tiempo de ejecución? O, ¿qué pasa si necesitas un objeto que persista más allá de la vida de la función que lo creó? Aquí es donde `new` y `delete` entran en juego.

El operador `new` se encarga de solicitar memoria al sistema operativo para que puedas almacenar tus datos o objetos. Cuando usas `new`, este te devuelve un puntero a la ubicación de memoria que te asignó. Si creas un objeto, `new` también se encarga de llamar a su constructor para inicializarlo correctamente. Es crucial recordar que, una vez que terminas de usar esa memoria, debes liberarla explícitamente. Aquí es donde entra el operador `delete`. Si no usas `delete` para liberar la memoria que solicitaste con `new`, esa memoria seguirá ocupada y no podrá ser usada por otras partes de tu programa ni por otros programas, lo que nos lleva a un problema que veremos a continuación: las fugas de memoria. Usar `new` y `delete` de manera correcta es fundamental para el buen rendimiento y la estabilidad de tus aplicaciones en C++.
''',
    'code_example': r'''
#include <iostream>
#include <string>

class Persona {
public:
    std::string nombre;
    int edad;

    Persona(std::string n, int e) : nombre(n), edad(e) {
        std::cout << "Constructor de Persona: " << nombre << std::endl;
    }

    ~Persona() {
        std::cout << "Destructor de Persona: " << nombre << std::endl;
    }

    void presentarse() const {
        std::cout << "Hola, soy " << nombre << " y tengo " << edad << " años." << std::endl;
    }
};

int main() {
    std::cout << "--- Usando new para un solo objeto ---" << std::endl;
    // Creamos un objeto Persona en el heap (memoria dinamica)
    Persona* p1 = new Persona("Alice", 30);
    p1->presentarse();
    // Liberamos la memoria asignada
    delete p1;
    p1 = nullptr; // Buena practica: apuntar el puntero a nullptr despues de delete

    std::cout << "\n--- Usando new[] y delete[] para un arreglo de objetos ---" << std::endl;
    // Creamos un arreglo de 3 objetos Persona en el heap
    Persona* personas = new Persona[3]{
        Persona("Bob", 25), // En C++11 y posteriores, se pueden inicializar asi
        Persona("Charlie", 35),
        Persona("David", 40)
    };

    for (int i = 0; i < 3; ++i) {
        personas[i].presentarse();
    }

    // Liberamos la memoria del arreglo. Es CRUCIAL usar delete[]
    delete[] personas;
    personas = nullptr; // Apuntar a nullptr

    std::cout << "\n--- Manejo de new con tipos primitivos ---" << std::endl;
    int* ptr_entero = new int; // Asigna memoria para un int
    *ptr_entero = 100;
    std::cout << "Valor de ptr_entero: " << *ptr_entero << std::endl;
    delete ptr_entero;
    ptr_entero = nullptr;

    double* ptr_double = new double(3.14); // Asigna e inicializa un double
    std::cout << "Valor de ptr_double: " << *ptr_double << std::endl;
    delete ptr_double;
    ptr_double = nullptr;

    // --- Ejemplo de uso incorrecto (fuga de memoria INTENCIONAL para ilustrar) ---
    // NO HAGAS ESTO EN TU CODIGO REAL
    // Persona* p_fuga = new Persona("Fuga", 99);
    // std::cout << "Se creo una persona que no se eliminara (fuga intencional)." << std::endl;
    // La memoria de p_fuga no se libera, causando una fuga.
    // El programa termina, pero en un programa de larga duracion, esto seria un problema.

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 3,
    'tittle_level': 'Manejo de Memoria y Recursos',
    'topic': 'Gestión de Memoria Dinámica',
    'subtopic': 'Fugas de memoria y cómo evitarlas',
    'definition': '''
Las **fugas de memoria** (o *memory leaks* en inglés) ocurren cuando tu programa solicita memoria dinámica (usando `new`), pero luego no la libera (con `delete`) cuando ya no la necesita. Imagina que tienes una biblioteca en la que pides prestados libros, pero nunca los devuelves; con el tiempo, la biblioteca se queda sin libros disponibles. En programación, si tu aplicación tiene fugas de memoria, gradualmente consume más y más RAM del sistema, lo que puede llevar a que el programa se ralentice, se congele o, en el peor de los casos, se cierre abruptamente porque el sistema operativo se queda sin memoria disponible.

¿Te estás preguntando por qué esto importa?

Las fugas de memoria son un problema serio en aplicaciones de larga duración, como servidores, videojuegos o software empresarial, ya que pueden degradar el rendimiento del sistema de forma significativa. Evitarlas es crucial para construir aplicaciones robustas y eficientes. La forma más básica de evitarlas es seguir la regla de que **cada `new` debe tener su correspondiente `delete`** y **cada `new[]` debe tener su `delete[]`**. Sin embargo, esto puede ser complicado en código complejo, especialmente si hay múltiples puntos de salida de una función o si ocurren excepciones. La solución moderna y recomendada en C++ es usar **punteros inteligentes** como `std::unique_ptr` y `std::shared_ptr`. Estos punteros gestionan automáticamente la liberación de memoria, siguiendo el principio RAII (Resource Acquisition Is Initialization), que básicamente dice que los recursos se adquieren en la inicialización de un objeto y se liberan automáticamente cuando el objeto se destruye. Al usar punteros inteligentes, el compilador se encarga de que la memoria se libere, incluso si hay excepciones, reduciendo drásticamente la posibilidad de fugas de memoria.
''',
    'code_example': r'''
#include <iostream>
#include <memory> // Para std::unique_ptr y std::shared_ptr
#include <vector>

class Recurso {
public:
    std::string id;
    Recurso(std::string i) : id(i) {
        std::cout << "Recurso '" << id << "' creado." << std::endl;
    }
    ~Recurso() {
        std::cout << "Recurso '" << id << "' destruido." << std::endl;
    }
    void usar() {
        std::cout << "Usando recurso '" << id << "'." << std::endl;
    }
};

// --- Ejemplos con Fugas de Memoria (MALAS PRACTICAS) ---

void funcion_con_fuga_simple() {
    std::cout << "\n--- Funcion con fuga de memoria simple (NO HACER) ---" << std::endl;
    Recurso* r = new Recurso("FugaSimple");
    // No se llama a delete r;
    std::cout << "Saliendo de funcion_con_fuga_simple. Recurso no liberado." << std::endl;
} // 'r' sale del scope, pero la memoria que apunta no se libera.

void funcion_con_fuga_y_excepcion() {
    std::cout << "\n--- Funcion con fuga de memoria por excepcion (NO HACER) ---" << std::endl;
    Recurso* r = new Recurso("FugaExcepcion");
    try {
        r->usar();
        // Simular una excepcion antes de liberar la memoria
        if (true) { // Condicion que siempre es verdadera para forzar la excepcion
            throw std::runtime_error("Error simulado!");
        }
        delete r; // Esta linea NUNCA se alcanza si hay excepcion
    } catch (const std::runtime_error& e) {
        std::cerr << "Capturada excepcion: " << e.what() << std::endl;
    }
    std::cout << "Saliendo de funcion_con_fuga_y_excepcion. Recurso no liberado si hubo excepcion." << std::endl;
}

// --- Ejemplos de como EVITAR Fugas de Memoria (BUENAS PRACTICAS) ---

void funcion_sin_fuga_con_unique_ptr() {
    std::cout << "\n--- Funcion sin fuga con std::unique_ptr ---" << std::endl;
    // std::unique_ptr gestiona la memoria automaticamente.
    // Cuando unique_ptr sale del scope, llama a delete por si mismo.
    std::unique_ptr<Recurso> r_ptr = std::make_unique<Recurso>("UniquePtr");
    r_ptr->usar();
    std::cout << "Saliendo de funcion_sin_fuga_con_unique_ptr. unique_ptr liberara el recurso." << std::endl;
} // r_ptr se destruye aqui, y llama a delete en el Recurso.

void funcion_sin_fuga_con_shared_ptr() {
    std::cout << "\n--- Funcion sin fuga con std::shared_ptr ---" << std::endl;
    // std::shared_ptr tambien gestiona la memoria automaticamente, contando referencias.
    // La memoria se libera cuando el ultimo shared_ptr que la apunta se destruye.
    std::shared_ptr<Recurso> r_ptr = std::make_shared<Recurso>("SharedPtr");
    r_ptr->usar();
    std::cout << "Saliendo de funcion_sin_fuga_con_shared_ptr. shared_ptr gestionara el recurso." << std::endl;
} // r_ptr se destruye aqui, y si es el ultimo, libera el Recurso.

void funcion_sin_fuga_con_excepcion_unique_ptr() {
    std::cout << "\n--- Funcion sin fuga con std::unique_ptr y excepcion ---" << std::endl;
    std::unique_ptr<Recurso> r_ptr = std::make_unique<Recurso>("UniquePtrExcepcion");
    try {
        r_ptr->usar();
        if (true) {
            throw std::runtime_error("Otro error simulado!");
        }
    } catch (const std::runtime_error& e) {
        std::cerr << "Capturada excepcion: " << e.what() << std::endl;
    }
    std::cout << "Saliendo de funcion_sin_fuga_con_excepcion_unique_ptr. unique_ptr liberara el recurso." << std::endl;
} // r_ptr se destruye aqui, y llama a delete en el Recurso, incluso si hubo excepcion.


int main() {
    funcion_con_fuga_simple();
    funcion_con_fuga_y_excepcion();

    funcion_sin_fuga_con_unique_ptr();
    funcion_sin_fuga_con_shared_ptr();
    funcion_sin_fuga_con_excepcion_unique_ptr();

    // Las fugas de memoria ocurren cuando el programa termina y la memoria asignada no se libera.
    // En este ejemplo, las funciones con fugas dejarán memoria sin liberar hasta que el programa finalice.
    // Los punteros inteligentes garantizan que la memoria se libere automáticamente.
    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 3,
    'tittle_level': 'Manejo de Memoria y Recursos',
    'topic': 'Gestión de Memoria Dinámica',
    'subtopic': 'Herramientas para detección de errores (Valgrind)',
    'definition': '''
Cuando hablamos de **fugas de memoria** y otros errores relacionados con el manejo de memoria en C++, a veces es muy difícil detectarlos solo con mirar el código. Para eso, existen herramientas especializadas que nos ayudan a encontrar estos problemas. Una de las más conocidas y potentes en entornos Linux/Unix es **Valgrind**.

¿Te estás preguntando por qué esto importa?

Valgrind es un *framework* de instrumentación que puede perfilar y depurar tus programas. Su herramienta más usada, **Memcheck**, es la que te permite detectar un montón de errores de memoria, como:

* **Fugas de memoria:** Te dirá cuánta memoria se asignó y nunca se liberó.
* **Accesos a memoria no inicializada:** Cuando intentas leer o usar datos en una parte de la memoria que no has inicializado.
* **Accesos inválidos a memoria:** Intentar escribir o leer fuera de los límites de un arreglo, o acceder a memoria que ya fue liberada.
* **Uso de memoria después de liberarla (use-after-free):** Intentar usar un puntero que ya apunta a memoria que fue `delete`-ada.
* **Liberación doble de memoria (double-free):** Intentar liberar la misma memoria dos veces, lo que puede corromper el heap.

Valgrind no solo te dice que hay un problema, sino que también intenta darte el rastro de la pila (stack trace) de dónde ocurrió la asignación o el acceso problemático, lo que es invaluable para depurar. Si bien Valgrind puede hacer que tu programa se ejecute mucho más lento (a veces 5 a 10 veces más lento), es una herramienta indispensable para garantizar que tu código C++ tenga un manejo de memoria impecable, especialmente en proyectos grandes y complejos. Usar Valgrind de forma regular durante el desarrollo te ayudará a escribir software mucho más estable y confiable.
''',
    'code_example': r'''
// Para compilar este ejemplo y usar Valgrind, necesitaras un compilador C++ (g++ o clang++)
// y tener Valgrind instalado en un sistema Linux/Unix.

// 1. Guarda este codigo como 'ejemplo_valgrind.cpp'
// 2. Compila con informacion de depuracion: g++ -g ejemplo_valgrind.cpp -o ejemplo_valgrind
// 3. Ejecuta con Valgrind: valgrind --leak-check=full --show-leak-kinds=all ./ejemplo_valgrind


#include <iostream>
#include <vector>
#include <string>

// Funcion con una fuga de memoria obvia
void fugaDeMemoriaObvia() {
    int* ptr = new int; // Memoria asignada
    *ptr = 10;
    std::cout << "Se creo un int en el heap con valor: " << *ptr << std::endl;
    // No hay 'delete ptr;', por lo tanto, hay una fuga.
}

// Funcion con acceso a memoria fuera de limites (errores de heap)
void accesoFueraDeLimites() {
    int* arreglo = new int[5]; // Arreglo de 5 enteros (indices 0 a 4)
    std::cout << "Accediendo fuera de limites del arreglo..." << std::endl;
    // Esto causara un error de Valgrind: Invalid write of size 4
    arreglo[5] = 100; // Intenta escribir en el indice 5, que esta fuera de los limites
    std::cout << "Valor fuera de limites (posiblemente corrupto): " << arreglo[5] << std::endl;
    delete[] arreglo;
}

// Funcion con uso de memoria despues de liberarla (use-after-free)
void usoDespuesDeLiberar() {
    int* dato = new int(20);
    std::cout << "Dato antes de liberar: " << *dato << std::endl;
    delete dato; // Memoria liberada
    std::cout << "Dato despues de liberar (ERROR): " << *dato << std::endl; // Acceso a memoria ya liberada
    // Esto causara un error de Valgrind: Invalid read of size 4
    // Tambien puede causar un error de Valgrind si intentas 'delete dato;' de nuevo (double free)
    // delete dato; // Esto causaria un "double free"
}

// Funcion con memoria no inicializada
void memoriaNoInicializada() {
    int* valor_no_inicializado = new int;
    // Esto causara un error de Valgrind: Use of uninitialised value of size 4
    // al intentar imprimirlo
    std::cout << "Valor no inicializado: " << *valor_no_inicializado << std::endl;
    delete valor_no_inicializado;
}

int main() {
    std::cout << "Iniciando ejemplos de errores de memoria para Valgrind..." << std::endl;

    fugaDeMemoriaObvia();
    accesoFueraDeLimites();
    usoDespuesDeLiberar();
    memoriaNoInicializada();

    std::cout << "Fin de los ejemplos. Ejecuta con Valgrind para ver los errores." << std::endl;
    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 3,
    'tittle_level': 'Manejo de Memoria y Recursos',
    'topic': 'Punteros Inteligentes',
    'subtopic': 'std::unique_ptr, std::shared_ptr, std::weak_ptr',
    'definition': '''
Los **punteros inteligentes** en C++ son una característica fundamental para la gestión automática y segura de la memoria. A diferencia de los punteros crudos (`raw pointers`) que requieren que tú, el programador, recuerdes `delete`ar la memoria, los punteros inteligentes lo hacen por ti, adhiriéndose al principio **RAII** (Resource Acquisition Is Initialization). Los tres tipos principales son `std::unique_ptr`, `std::shared_ptr` y `std::weak_ptr`, cada uno con su propio propósito y reglas de propiedad.

¿Te estás preguntando por qué esto importa?

En proyectos grandes y complejos, el manejo manual de memoria con `new` y `delete` se convierte rápidamente en una fuente de errores: fugas de memoria, accesos a memoria liberada, y liberaciones dobles. Los punteros inteligentes eliminan gran parte de esta carga y los errores asociados al automatizar la deasignación de memoria.

* Un **`std::unique_ptr`** representa una **propiedad exclusiva** sobre un recurso. Solo puede haber un `unique_ptr` que apunte a una pieza de memoria en un momento dado. No se pueden copiar (salvo si se mueve su propiedad), lo que asegura que no haya confusiones sobre quién es el responsable de liberar el recurso. Cuando el `unique_ptr` sale de su ámbito (scope), la memoria a la que apunta se libera automáticamente. Son ideales para escenarios donde la propiedad es clara y no compartida.
* Un **`std::shared_ptr`** representa una **propiedad compartida**. Múltiples `shared_ptr` pueden apuntar al mismo recurso. Internamente, `shared_ptr` mantiene una cuenta de referencias; la memoria se libera solo cuando el último `shared_ptr` que apunta a ese recurso es destruido o reiniciado. Son perfectos para cuando varios objetos necesitan acceder al mismo recurso dinámico y no hay un único "dueño" claro.
* Un **`std::weak_ptr`** es un puntero no propietario que trabaja junto con `std::shared_ptr`. No incrementa la cuenta de referencias de `shared_ptr`, lo que significa que no impide que el recurso sea liberado. Es útil para romper **ciclos de referencia circulares** entre `shared_ptr` (donde el objeto A tiene un `shared_ptr` a B, y B tiene un `shared_ptr` a A, impidiendo que ambos se liberen). Un `weak_ptr` debe convertirse a un `shared_ptr` temporal (`.lock()`) antes de poder usarse, y si el recurso ya fue liberado, `.lock()` devolverá un `nullptr` vacío, permitiéndote manejar esta situación con seguridad.

La elección del puntero inteligente adecuado depende del modelo de propiedad que necesites para tu recurso. Usarlos correctamente mejora significativamente la seguridad y fiabilidad de tu código C++.
''',
    'code_example': r'''
#include <iostream>
#include <memory> // Para std::unique_ptr, std::shared_ptr, std::weak_ptr
#include <vector>

class Recurso {
public:
    std::string nombre;
    Recurso(std::string n) : nombre(n) {
        std::cout << "  Recurso '" << nombre << "' CREADO." << std::endl;
    }
    ~Recurso() {
        std::cout << "  Recurso '" << nombre << "' DESTRUIDO." << std::endl;
    }
    void operacion() const {
        std::cout << "  Realizando operacion con Recurso '" << nombre << "'." << std::endl;
    }
};

// --- std::unique_ptr ---
void ejemploUniquePtr() {
    std::cout << "--- Ejemplo de std::unique_ptr ---" << std::endl;
    // Creacion de un unique_ptr
    // std::make_unique es la forma recomendada (C++14 en adelante)
    std::unique_ptr<Recurso> res1 = std::make_unique<Recurso>("Unico1");
    res1->operacion();

    // No se puede copiar un unique_ptr:
    // std::unique_ptr<Recurso> res2 = res1; // ERROR de compilacion

    // Se puede MOVER la propiedad
    std::unique_ptr<Recurso> res3 = std::move(res1); // res1 ahora es nullptr
    if (res1) { // Esto es falso, res1 es nullptr
        res1->operacion();
    } else {
        std::cout << "  res1 ha sido movido y ahora es nullptr." << std::endl;
    }
    res3->operacion();

    // Cuando res3 sale de scope, el Recurso "Unico1" se destruye automaticamente.
    std::cout << "Finalizando ejemploUniquePtr." << std::endl;
} // res3 se destruye aqui, liberando el Recurso "Unico1"

// --- std::shared_ptr ---
void ejemploSharedPtr() {
    std::cout << "\n--- Ejemplo de std::shared_ptr ---" << std::endl;

    std::shared_ptr<Recurso> resA = std::make_shared<Recurso>("CompartidoA");
    std::cout << "  Cuenta de referencias de resA: " << resA.use_count() << std::endl; // 1

    { // Nuevo scope para mostrar el ciclo de vida
        std::shared_ptr<Recurso> resB = resA; // Copia, incrementa la cuenta de referencias
        std::cout << "  Cuenta de referencias de resA (despues de resB): " << resA.use_count() << std::endl; // 2
        resB->operacion();

        std::vector<std::shared_ptr<Recurso>> vector_recursos;
        vector_recursos.push_back(resA); // Otra copia, cuenta de referencias: 3
        std::cout << "  Cuenta de referencias de resA (en vector): " << resA.use_count() << std::endl; // 3
        std::cout << "  Saliendo del scope interno." << std::endl;
    } // resB se destruye aqui, cuenta de referencias: 2 (Recurso "CompartidoA" sigue vivo)

    std::cout << "  Cuenta de referencias de resA (despues de scope interno): " << resA.use_count() << std::endl; // 2 (1 de resA, 1 del vector_recursos)

    // Si el vector_recursos se declarara y usara fuera de este scope, la cuenta de referencias seria diferente.
    // Para propositos de este ejemplo, asumimos que el vector se destruye con este scope.
    // En el codigo real, la destruccion del vector_recursos podria ocurrir mas tarde.

    // Cuando resA sale de scope, la cuenta de referencias de "CompartidoA" bajara a 1.
    // Asumiendo que vector_recursos tambien se destruye aqui, "CompartidoA" se destruira.
    std::cout << "Finalizando ejemploSharedPtr." << std::endl;
} // resA se destruye aqui, si la cuenta de referencias llega a 0, Recurso "CompartidoA" se destruye.


// --- std::weak_ptr y ciclos de referencia ---
class B; // Declaracion anticipada

class A {
public:
    std::shared_ptr<B> punteroB;
    A() { std::cout << "  Objeto A CREADO." << std::endl; }
    ~A() { std::cout << "  Objeto A DESTRUIDO." << std::endl; }
    void establecerPuntero(std::shared_ptr<B> b) { punteroB = b; }
};

class B {
public:
    std::weak_ptr<A> punteroA; // weak_ptr para evitar ciclo
    B() { std::cout << "  Objeto B CREADO." << std::endl; }
    ~B() { std::cout << "  Objeto B DESTRUIDO." << std::endl; }
    void establecerPuntero(std::shared_ptr<A> a) { punteroA = a; }
    void accederA() {
        if (std::shared_ptr<A> a_locked = punteroA.lock()) { // Intentar bloquear weak_ptr a shared_ptr
            std::cout << "  Accediendo a A desde B." << std::endl;
        } else {
            std::cout << "  El objeto A ya no existe." << std::endl;
        }
    }
};

void ejemploWeakPtr() {
    std::cout << "\n--- Ejemplo de std::weak_ptr (resolviendo ciclos de referencia) ---" << std::endl;
    std::shared_ptr<A> a_ptr = std::make_shared<A>();
    std::shared_ptr<B> b_ptr = std::make_shared<B>();

    a_ptr->establecerPuntero(b_ptr); // A apunta a B con shared_ptr
    b_ptr->establecerPuntero(a_ptr); // B apunta a A con weak_ptr (importante!)

    std::cout << "  Cuenta de referencias A: " << a_ptr.use_count() << std::endl; // Debería ser 1
    std::cout << "  Cuenta de referencias B: " << b_ptr.use_count() << std::endl; // Debería ser 1

    b_ptr->accederA(); // Acceso seguro

    // Cuando los shared_ptr a_ptr y b_ptr salen del scope, se destruyen.
    // Como b_ptr->punteroA es un weak_ptr, no mantiene vivo a 'A'.
    // Ambos A y B pueden ser destruidos correctamente.
    std::cout << "Finalizando ejemploWeakPtr. Ambos objetos A y B deberian destruirse." << std::endl;
} // a_ptr y b_ptr se destruyen aqui, liberando A y B.


int main() {
    ejemploUniquePtr();
    std::cout << "\n------------------------------------" << std::endl;
    ejemploSharedPtr();
    std::cout << "\n------------------------------------" << std::endl;
    ejemploWeakPtr();

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 3,
    'tittle_level': 'Manejo de Memoria y Recursos',
    'topic': 'Punteros Inteligentes',
    'subtopic': 'Ciclo de vida y gestión automática de recursos',
    'definition': '''
El **ciclo de vida y la gestión automática de recursos** con punteros inteligentes es el corazón de por qué son tan valiosos en C++. Se basan en el principio **RAII** (Resource Acquisition Is Initialization), que es una filosofía de diseño donde los recursos (como la memoria dinámica, archivos abiertos, bloqueos de mutex, etc.) se adquieren en el constructor de un objeto y se liberan automáticamente en su destructor.

¿Te estás preguntando por qué esto importa?

En el manejo manual de recursos (por ejemplo, con punteros crudos y `new`/`delete`), eres tú quien tiene que recordar liberar el recurso explícitamente. Esto es propenso a errores, especialmente en funciones complejas con múltiples rutas de salida, bucles o manejo de excepciones. Si olvidas un `delete`, tienes una **fuga de memoria**. Si lo llamas dos veces, tienes un **double-free**. Si accedes a la memoria después de liberarla, tienes un **use-after-free**. Todos estos son errores comunes y difíciles de depurar que pueden llevar a crasheos o comportamientos impredecibles del programa.

Los punteros inteligentes resuelven esto automatizando la liberación del recurso:

* **`std::unique_ptr`**: Cuando un `unique_ptr` sale de su ámbito (scope), su destructor se encarga de llamar a `delete` en el puntero que posee. Esto garantiza que el recurso sea liberado tan pronto como ya no sea necesario, sin importar cómo se abandone el ámbito (por una `return`, una excepción, o simplemente llegando al final de la función).
* **`std::shared_ptr`**: Este puntero utiliza un mecanismo de conteo de referencias. Cuando se copia un `shared_ptr`, la cuenta de referencias del recurso subyacente se incrementa. Cuando un `shared_ptr` se destruye (sale de ámbito), la cuenta de referencias se decrementa. Solo cuando la cuenta de referencias llega a cero (es decir, ningún `shared_ptr` más apunta a ese recurso), el destructor del `shared_ptr` final llama a `delete` para liberar el recurso. Esto asegura que el recurso permanezca vivo mientras al menos un `shared_ptr` lo esté referenciando, y se libere automáticamente cuando ya nadie lo necesite.
* **`std::weak_ptr`**: No participa en la gestión del ciclo de vida del recurso directamente. Solo observa un recurso gestionado por `shared_ptr`. Su propósito principal es evitar ciclos de referencia circulares que impedirían la liberación de memoria con `shared_ptr`.

Al integrar la gestión de recursos con el ciclo de vida de los objetos (creación y destrucción de objetos), los punteros inteligentes hacen que tu código sea intrínsecamente más seguro contra errores de memoria y más robusto, ya que la liberación de recursos está garantizada incluso frente a excepciones. Es la práctica recomendada para el manejo de memoria dinámica en C++ moderno.
''',
    'code_example': r'''
#include <iostream>
#include <memory> // Para punteros inteligentes
#include <vector>

// Clase de ejemplo que representa un recurso
class Recurso {
public:
    std::string id;
    Recurso(std::string i) : id(i) {
        std::cout << "  Recurso '" << id << "' CREADO." << std::endl;
    }
    ~Recurso() {
        std::cout << "  Recurso '" << id << "' DESTRUIDO." << std::endl;
    }
    void usar() const {
        std::cout << "  Usando Recurso '" << id << "'." << std::endl;
    }
};

// --- Ejemplo con std::unique_ptr ---
void funcion_con_unique_ptr() {
    std::cout << "\n--- Inicio: funcion_con_unique_ptr ---" << std::endl;
    // La memoria para "MiRecursoUnico" se asigna aquí.
    std::unique_ptr<Recurso> ptr = std::make_unique<Recurso>("MiRecursoUnico");
    ptr->usar();

    // Podemos mover la propiedad del recurso
    std::unique_ptr<Recurso> otro_ptr = std::move(ptr);
    if (!ptr) { // ptr ahora es nullptr
        std::cout << "  'ptr' ha sido movido." << std::endl;
    }
    otro_ptr->usar();

    std::cout << "--- Fin: funcion_con_unique_ptr ---" << std::endl;
} // Cuando 'otro_ptr' sale de ámbito, su destructor se llama y libera "MiRecursoUnico".

// --- Ejemplo con std::shared_ptr ---
void funcion_con_shared_ptr() {
    std::cout << "\n--- Inicio: funcion_con_shared_ptr ---" << std::endl;
    std::shared_ptr<Recurso> ptr1 = std::make_shared<Recurso>("MiRecursoCompartido");
    std::cout << "  Cuenta de referencias de ptr1: " << ptr1.use_count() << std::endl; // 1

    { // Nuevo ámbito interno
        std::shared_ptr<Recurso> ptr2 = ptr1; // Copia el shared_ptr, incrementa la cuenta
        std::cout << "  Cuenta de referencias de ptr1 (dentro de scope): " << ptr1.use_count() << std::endl; // 2
        ptr2->usar();

        std::vector<std::shared_ptr<Recurso>> v;
        v.push_back(ptr1); // Otra copia, cuenta incrementa
        std::cout << "  Cuenta de referencias de ptr1 (despues de push_back): " << ptr1.use_count() << std::endl; // 3
        
        // Simular una excepcion: el recurso se liberaria automaticamente
        // try {
        //     throw std::runtime_error("Simulando error!");
        // } catch (const std::runtime_error& e) {
        //     std::cerr << "  Excepcion capturada: " << e.what() << std::endl;
        // }

    } // Cuando ptr2 y el elemento del vector salen de ámbito, sus destructores se llaman,
      // decrementando la cuenta de referencias. El Recurso "MiRecursoCompartido" NO se destruye aún.
    std::cout << "  Cuenta de referencias de ptr1 (despues de scope interno): " << ptr1.use_count() << std::endl; // 1

    std::cout << "--- Fin: funcion_con_shared_ptr ---" << std::endl;
} // Cuando ptr1 sale de ámbito, su destructor se llama, la cuenta llega a 0, y "MiRecursoCompartido" se destruye.


// --- Ejemplo de RAII con un recurso no-memoria (Archivo) ---
// Normalmente, usarias std::fstream, pero esto ilustra el concepto.
class Archivo {
private:
    FILE* file_ptr;
    std::string nombre_archivo;
public:
    Archivo(const std::string& filename, const char* mode) : nombre_archivo(filename) {
        file_ptr = fopen(filename.c_str(), mode);
        if (!file_ptr) {
            throw std::runtime_error("No se pudo abrir el archivo: " + filename);
        }
        std::cout << "  Archivo '" << nombre_archivo << "' ABIERTO." << std::endl;
    }
    ~Archivo() {
        if (file_ptr) {
            fclose(file_ptr);
            std::cout << "  Archivo '" << nombre_archivo << "' CERRADO." << std::endl;
        }
    }
    void escribir(const std::string& texto) {
        if (file_ptr) {
            fputs(texto.c_str(), file_ptr);
            std::cout << "  Escribiendo en '" << nombre_archivo << "'." << std::endl;
        }
    }
};

void funcion_con_recurso_raii() {
    std::cout << "\n--- Inicio: funcion_con_recurso_raii (RAII con archivo) ---" << std::endl;
    try {
        Archivo miArchivo("mi_log.txt", "w"); // El archivo se abre en el constructor
        miArchivo.escribir("Este es un mensaje de prueba.\n");
        // Simular una excepcion antes de que la funcion termine normalmente
        // if (true) {
        //     throw std::runtime_error("Error durante escritura!");
        // }
        miArchivo.escribir("Otro mensaje.\n");
    } catch (const std::runtime_error& e) {
        std::cerr << "  Excepcion capturada: " << e.what() << std::endl;
    }
    std::cout << "--- Fin: funcion_con_recurso_raii ---" << std::endl;
} // El archivo se cierra automáticamente en el destructor de 'miArchivo', incluso si hay una excepcion.


int main() {
    funcion_con_unique_ptr();
    funcion_con_shared_ptr();
    funcion_con_recurso_raii(); // Muestra RAII con un recurso no-memoria

    std::cout << "\nTodos los recursos deberían haberse liberado automáticamente." << std::endl;
    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 3,
    'tittle_level': 'Manejo de Memoria y Recursos',
    'topic': 'Punteros Inteligentes',
    'subtopic': 'Comparación con punteros crudos',
    'definition': '''
La **comparación entre punteros inteligentes y punteros crudos (`raw pointers`)** en C++ es crucial para entender la evolución del lenguaje y las mejores prácticas en el manejo de memoria. Los punteros crudos (`int* ptr = new int;`) han sido parte de C++ desde sus inicios, ofreciendo un control directo y de bajo nivel sobre la memoria. Sin embargo, este control viene con una gran responsabilidad, mientras que los punteros inteligentes encapsulan esa responsabilidad para mayor seguridad.

¿Te estás preguntando por qué esto importa?

Aquí te doy un contraste clave:

| Característica        | **Punteros Crudos (`raw pointers`)** | **Punteros Inteligentes** |
| :-------------------- | :---------------------------------------------------- | :------------------------------------------------------- |
| **Gestión de Memoria** | **Manual**: Tú eres el único responsable de `new` y `delete`. | **Automática**: La memoria se libera automáticamente cuando el puntero inteligente sale de su ámbito o su contador de referencias llega a cero. |
| **Seguridad** | **Poco seguro**: Propenso a fugas de memoria, `double-free`, `use-after-free`, y `dangling pointers`. | **Seguro**: Elimina o reduce drásticamente los errores de memoria mencionados, gracias a RAII. |
| **Claridad de Propiedad** | **Ambiguo**: No queda claro quién es el "dueño" de la memoria y quién debe liberarla. | **Claro**: <br/>- `unique_ptr`: Propiedad exclusiva.<br/>- `shared_ptr`: Propiedad compartida.<br/>- `weak_ptr`: No propietario. |
| **Manejo de Excepciones** | **Problemático**: Si una excepción ocurre antes de `delete`, hay una fuga. | **Resistente a excepciones**: La liberación está garantizada incluso si se lanza una excepción. |
| **Rendimiento** | **Ligeramente más rápido**: Sin sobrecarga de gestión (pero a costa de seguridad). | **Ligera sobrecarga**: `unique_ptr` es casi tan eficiente como un puntero crudo. `shared_ptr` tiene una sobrecarga mínima por el contador de referencias. |
| **Sintaxis** | Más simple al declarar (`int* p;`), pero más compleja en el manejo de ciclo de vida. | Más verbosa al declarar (`std::unique_ptr<int> p;`), pero simplifica enormemente el manejo del ciclo de vida. |
| **Casos de Uso** | Interacción con APIs de C puro, drivers, o cuando se requiere control absoluto y se gestiona cuidadosamente el ciclo de vida. | Práctica estándar para la gestión de memoria dinámica en C++ moderno. Debería ser la opción predeterminada. |

En resumen, aunque los punteros crudos te dan un control granular, los punteros inteligentes te ofrecen una seguridad, claridad y robustez mucho mayores con una sobrecarga mínima. En C++ moderno, la regla de oro es **"preferir punteros inteligentes sobre punteros crudos"** a menos que tengas una razón muy específica y justificada para no hacerlo. Los punteros crudos se usan a menudo como referencias no propietarias a memoria gestionada por punteros inteligentes, o para interoperar con código que espera punteros C-style.
''',
    'code_example': r'''
#include <iostream>
#include <memory> // Para std::unique_ptr, std::shared_ptr
#include <vector>

class Dato {
public:
    int valor;
    Dato(int v) : valor(v) {
        std::cout << "  Dato " << valor << " CREADO." << std::endl;
    }
    ~Dato() {
        std::cout << "  Dato " << valor << " DESTRUIDO." << std::endl;
    }
};

// --- Ejemplo de Puntero Crudo (PROBLEMATICO) ---
void usarPunteroCrudo() {
    std::cout << "--- Usando Puntero Crudo (riesgos) ---" << std::endl;
    Dato* ptr_crudo = new Dato(10); // Asignacion de memoria
    std::cout << "  Valor (ptr_crudo): " << ptr_crudo->valor << std::endl;

    // Escenario 1: Fuga de memoria si no se llama a delete
    // delete ptr_crudo; // Si se olvida esta linea, hay una fuga de memoria

    // Escenario 2: Acceso despues de liberacion (use-after-free)
    // delete ptr_crudo;
    // std::cout << "  Valor despues de delete (use-after-free): " << ptr_crudo->valor << std::endl; // Comportamiento indefinido

    // Escenario 3: Doble liberacion (double-free)
    // delete ptr_crudo;
    // delete ptr_crudo; // Intentar liberar dos veces la misma memoria. CRASHEA o corrompe.

    std::cout << "  Saliendo de usarPunteroCrudo." << std::endl;
    // Si no se libero, aqui hay una fuga.
    delete ptr_crudo; // Asegurando la liberacion para este ejemplo.
}

// --- Ejemplo de std::unique_ptr (Seguro y Automatico) ---
void usarUniquePtr() {
    std::cout << "\n--- Usando std::unique_ptr (seguro y automatico) ---" << std::endl;
    { // Scope para mostrar el ciclo de vida
        std::unique_ptr<Dato> u_ptr = std::make_unique<Dato>(20); // Asignacion segura
        std::cout << "  Valor (u_ptr): " << u_ptr->valor << std::endl;

        // Propiedad unica:
        // std::unique_ptr<Dato> u_ptr2 = u_ptr; // ERROR de compilacion
        std::unique_ptr<Dato> u_ptr3 = std::move(u_ptr); // Mover propiedad
        if (!u_ptr) {
            std::cout << "  u_ptr fue movido y ahora es nullptr." << std::endl;
        }
        std::cout << "  Valor (u_ptr3): " << u_ptr3->valor << std::endl;

    } // u_ptr3 sale de scope, Dato(20) se destruye AUTOMATICAMENTE.
    std::cout << "  Saliendo de usarUniquePtr." << std::endl;
}

// --- Ejemplo de std::shared_ptr (Propiedad Compartida) ---
void usarSharedPtr() {
    std::cout << "\n--- Usando std::shared_ptr (propiedad compartida) ---" << std::endl;
    std::shared_ptr<Dato> s_ptr1 = std::make_shared<Dato>(30); // Asignacion segura
    std::cout << "  Valor (s_ptr1): " << s_ptr1->valor << ", Cnt: " << s_ptr1.use_count() << std::endl; // Cnt: 1

    { // Scope para mostrar la vida compartida
        std::shared_ptr<Dato> s_ptr2 = s_ptr1; // Copia, incrementa contador
        std::cout << "  Valor (s_ptr2): " << s_ptr2->valor << ", Cnt: " << s_ptr2.use_count() << std::endl; // Cnt: 2

        std::vector<std::shared_ptr<Dato>> vec_ptr;
        vec_ptr.push_back(s_ptr1); // Otra copia, Cnt: 3
        std::cout << "  Cnt (despues de push_back): " << s_ptr1.use_count() << std::endl; // Cnt: 3

    } // s_ptr2 y el elemento del vector salen de scope, Cnt: 1 (s_ptr1 todavia lo apunta)
    std::cout << "  Valor (s_ptr1, despues de scope interno): " << s_ptr1->valor << ", Cnt: " << s_ptr1.use_count() << std::endl; // Cnt: 1

    // Simular una excepcion:
    // try {
    //     throw std::runtime_error("Error simulado!");
    // } catch(...) {
    //     std::cerr << "  Excepcion capturada. Shared_ptr liberara de forma segura." << std::endl;
    // }

    std::cout << "  Saliendo de usarSharedPtr." << std::endl;
} // s_ptr1 sale de scope, Cnt: 0, Dato(30) se destruye AUTOMATICAMENTE.

int main() {
    // Descomentar solo una de las siguientes llamadas a la vez para ver el comportamiento
    // o ejecutar con Valgrind para ver las advertencias/errores de los punteros crudos.
    usarPunteroCrudo(); // Contiene riesgos. En un programa real, esto causaría problemas sin 'delete'.
    // Los mensajes de "Dato destruido" aparecerán solo si se gestiona correctamente el delete.

    usarUniquePtr(); // Muestra el manejo seguro y automático.
    usarSharedPtr(); // Muestra el manejo seguro con propiedad compartida.

    std::cout << "\nComparacion completada. Observe los mensajes de 'CREADO' y 'DESTRUIDO'." << std::endl;
    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 3,
    'tittle_level': 'Manejo de Memoria y Recursos',
    'topic': 'RAII (Resource Acquisition Is Initialization)',
    'subtopic': 'Principios de RAII',
    'definition': '''
**RAII** significa "**Resource Acquisition Is Initialization**" (Adquisición de Recursos es Inicialización). Es un pilar fundamental en el diseño de software C++ moderno, especialmente para garantizar la seguridad de los recursos. Este principio establece que la adquisición de un recurso (como la memoria dinámica, un archivo abierto, un bloqueo de un mutex, o una conexión a una base de datos) debe ocurrir en el **constructor** de un objeto, y la liberación o limpieza de ese recurso debe ocurrir automáticamente en el **destructor** del mismo objeto.

¿Te estás preguntando por qué esto importa?

La clave de RAII es que los destructores de los objetos locales (aquellos creados en el stack de una función) se llaman **automáticamente** cuando el objeto sale de su ámbito (scope), sin importar cómo salga de ese ámbito: si la función termina normalmente, si retorna un valor, o incluso si se lanza una excepción. Esto contrasta fuertemente con el manejo manual de recursos (como usar `new` y `delete` directamente), donde si se olvida liberar el recurso o si una excepción interrumpe la ejecución antes de la liberación, se produce una fuga de recursos. Al encapsular la gestión de recursos dentro de clases que siguen RAII, garantizamos que los recursos se limpien de forma determinística y segura, incluso en presencia de errores o rutas de código complejas. Es la base de la seguridad de la memoria y la robustez en C++ a través de los punteros inteligentes (`std::unique_ptr`, `std::shared_ptr`) y otros tipos de contenedores de recursos de la Standard Library.
''',
    'code_example': r'''
#include <iostream>
#include <fstream> // Para std::ofstream
#include <string>
#include <stdexcept> // Para std::runtime_error

// --- Clase que aplica el principio RAII para manejar un archivo ---
class FileWriter {
private:
    std::ofstream file_stream; // El recurso (flujo de archivo)
    std::string filename;
public:
    // Constructor: Adquiere el recurso (abre el archivo)
    FileWriter(const std::string& fname) : filename(fname) {
        file_stream.open(filename, std::ios_base::app); // Abre el archivo en modo "append"
        if (!file_stream.is_open()) {
            // Si la adquisicion falla, lanzar una excepcion
            throw std::runtime_error("No se pudo abrir el archivo: " + filename);
        }
        std::cout << "  Archivo '" << filename << "' ABIERTO (Recurso Adquirido)." << std::endl;
    }

    // Destructor: Libera el recurso (cierra el archivo)
    ~FileWriter() {
        if (file_stream.is_open()) {
            file_stream.close();
            std::cout << "  Archivo '" << filename << "' CERRADO (Recurso Liberado)." << std::endl;
        }
    }

    // Deshabilitar copia y asignacion para evitar problemas con la propiedad del archivo
    // En C++11+, se hace asi (o usar unique_ptr internamente)
    FileWriter(const FileWriter&) = delete;
    FileWriter& operator=(const FileWriter&) = delete;

    // Metodo para usar el recurso
    void write(const std::string& data) {
        if (file_stream.is_open()) {
            file_stream << data << std::endl;
            std::cout << "  Escribiendo en '" << filename << "': " << data << std::endl;
        } else {
            std::cerr << "  ERROR: El archivo no esta abierto para escritura." << std::endl;
        }
    }
};

// --- Clase de ejemplo SIN RAII (mala práctica) ---
class BadFileWriter {
private:
    FILE* raw_file_ptr; // Puntero crudo a un archivo C-style
    std::string filename;
public:
    BadFileWriter(const std::string& fname) : filename(fname) {
        raw_file_ptr = fopen(filename.c_str(), "a");
        if (!raw_file_ptr) {
            std::cerr << "  ERROR: No se pudo abrir el archivo (BadFileWriter)." << std::endl;
        } else {
            std::cout << "  Archivo '" << filename << "' ABIERTO (BadFileWriter)." << std::endl;
        }
    }
    // ¡FALTA EL DESTRUCTOR para cerrar el archivo! Esto causará una fuga de recursos.
    // ~BadFileWriter() { fclose(raw_file_ptr); std::cout << "Archivo CERRADO (BadFileWriter)." << std::endl; }
    void write(const std::string& data) {
        if (raw_file_ptr) {
            fputs((data + "\n").c_str(), raw_file_ptr);
        }
    }
    // Necesitas un método manual para liberar el recurso si no usas RAII
    void closeFile() {
        if (raw_file_ptr) {
            fclose(raw_file_ptr);
            std::cout << "  Archivo '" << filename << "' CERRADO MANUALMENTE (BadFileWriter)." << std::endl;
            raw_file_ptr = nullptr;
        }
    }
};


void funcion_con_raii() {
    std::cout << "--- Inicio funcion_con_raii ---" << std::endl;
    try {
        FileWriter logFile("mi_log_raii.txt"); // El recurso se adquiere aquí (archivo se abre)
        logFile.write("Mensaje 1 del log.");
        logFile.write("Mensaje 2 del log.");
        // Simular una excepcion: el destructor de logFile se llamará automáticamente
        // throw std::runtime_error("Error simulado dentro de funcion_con_raii!");
        logFile.write("Mensaje 3 del log (si no hubo excepcion).");
    } catch (const std::runtime_error& e) {
        std::cerr << "  Excepcion capturada en funcion_con_raii: " << e.what() << std::endl;
    }
    std::cout << "--- Fin funcion_con_raii ---" << std::endl;
} // 'logFile' sale de ámbito, su destructor es llamado, y el archivo se cierra.

void funcion_sin_raii_con_fuga() {
    std::cout << "\n--- Inicio funcion_sin_raii_con_fuga (PELIGRO) ---" << std::endl;
    BadFileWriter badLogFile("fuga_log.txt"); // Archivo abierto, pero no hay RAII
    badLogFile.write("Este mensaje puede causar una fuga.");
    // Si olvidamos badLogFile.closeFile(); aqui, o si ocurre una excepcion,
    // el archivo NUNCA se cerrara, y los recursos seran filtrados.
    // badLogFile.closeFile(); // Si se llama, el archivo se cierra.
    std::cout << "--- Fin funcion_sin_raii_con_fuga ---" << std::endl;
} // 'badLogFile' sale de ámbito, pero el destructor NO cierra el archivo. Fuga de recurso.


int main() {
    funcion_con_raii();
    funcion_sin_raii_con_fuga(); // Demuestra el problema de no usar RAII

    // Los punteros inteligentes (unique_ptr, shared_ptr) son el ejemplo mas comun de RAII para memoria.
    // Pero RAII aplica a CUALQUIER recurso que necesita ser adquirido y liberado.

    std::cout << "\nPrograma finalizado. Revisa los archivos 'mi_log_raii.txt' y 'fuga_log.txt'." << std::endl;
    std::cout << "Observa que 'mi_log_raii.txt' siempre se cierra. 'fuga_log.txt' solo si se llama a closeFile()." << std::endl;

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 3,
    'tittle_level': 'Manejo de Memoria y Recursos',
    'topic': 'RAII (Resource Acquisition Is Initialization)',
    'subtopic': 'Aplicación en manejo de recursos',
    'definition': '''
La **aplicación de RAII en el manejo de recursos** es donde este principio realmente brilla en C++. No se trata solo de memoria dinámica; RAII es una técnica fundamental para gestionar cualquier recurso limitado y que necesite ser liberado de forma determinística y segura. Esto incluye recursos del sistema operativo, como archivos, sockets de red, bloqueos de hilos (mutexes), o incluso recursos de hardware.

¿Te estás preguntando por qué esto importa?

Imagina un programa que abre un archivo para escribir datos. Si no cierra el archivo correctamente, podría dejar el archivo corrupto o inaccesible para otros programas, o incluso agotar los "file handles" disponibles en el sistema operativo. Lo mismo ocurre con los bloqueos de hilos: si un hilo adquiere un bloqueo y luego falla sin liberarlo, otros hilos podrían quedarse esperando indefinidamente, llevando a un *deadlock*.

RAII resuelve estos problemas al vincular la vida útil del recurso con la vida útil de un objeto C++. Cuando creas un objeto RAII, su constructor se encarga de adquirir el recurso. Lo más importante es que, cuando ese objeto sale de su ámbito (por una excepción, una `return`, o simplemente al final de la función), su destructor **garantiza** que el recurso se libere o se limpie adecuadamente. Esto es extremadamente potente porque:

1.  **Seguridad contra fugas**: No tienes que recordar liberar el recurso manualmente; el compilador se encarga de ello.
2.  **Manejo seguro de excepciones**: Incluso si tu código lanza una excepción, el stack se desenrolla y los destructores de los objetos locales se llaman, asegurando la liberación.
3.  **Claridad del código**: La gestión del recurso está encapsulada dentro de la clase, lo que hace que el código sea más modular y fácil de entender.

Los ejemplos más prominentes de RAII en la biblioteca estándar de C++ son los **punteros inteligentes** (`std::unique_ptr`, `std::shared_ptr`) para la memoria dinámica, pero también clases como `std::fstream` (para archivos), `std::lock_guard` y `std::unique_lock` (para bloqueos de hilos), y `std::thread` (para gestionar hilos). Adoptar RAII como patrón de diseño es esencial para escribir código C++ robusto, confiable y libre de errores de recursos.
''',
    'code_example': r'''
#include <iostream>
#include <fstream>      // Para std::ofstream
#include <string>
#include <mutex>        // Para std::mutex, std::lock_guard
#include <thread>       // Para std::thread
#include <vector>
#include <stdexcept>    // Para std::runtime_error

// --- 1. RAII para Archivos (std::ofstream) ---
// std::ofstream ya es una clase que implementa RAII
void escribirEnArchivoConRAII(const std::string& filename, const std::string& content) {
    std::cout << "\n--- Manejo de Archivo con RAII (std::ofstream) ---" << std::endl;
    try {
        // Constructor abre el archivo
        std::ofstream outFile(filename, std::ios_base::app); // std::ios_base::app para añadir al final
        if (!outFile.is_open()) {
            throw std::runtime_error("No se pudo abrir el archivo: " + filename);
        }
        std::cout << "  Archivo '" << filename << "' ABIERTO." << std::endl;

        outFile << content << std::endl;
        std::cout << "  Escrito: '" << content << "'" << std::endl;

        // Simular un error antes de terminar la funcion
        // if (true) {
        //     throw std::runtime_error("Error simulado durante escritura!");
        // }

        outFile << "Este mensaje se añade si no hubo excepcion." << std::endl;
        std::cout << "  Segundo mensaje escrito." << std::endl;

    } catch (const std::runtime_error& e) {
        std::cerr << "  Excepcion capturada: " << e.what() << std::endl;
    }
    // El destructor de 'outFile' se llama automaticamente aqui (al salir del scope),
    // cerrando el archivo de forma segura, incluso si hubo una excepcion.
    std::cout << "  Archivo '" << filename << "' CERRADO por RAII." << std::endl;
}

// --- 2. RAII para Bloqueos de Hilos (std::lock_guard) ---
std::mutex mtx; // Un mutex global para proteger un recurso compartido
int contador_compartido = 0;

void incrementarContadorSeguro() {
    std::cout << "\n--- Manejo de Bloqueo con RAII (std::lock_guard) ---" << std::endl;
    // Constructor de std::lock_guard adquiere el bloqueo
    std::lock_guard<std::mutex> lock(mtx); // Bloquea el mutex al crearse

    // Seccion critica: solo un hilo puede acceder a 'contador_compartido' a la vez
    contador_compartido++;
    std::cout << "  Contador incrementado a: " << contador_compartido << " (Hilo: " << std::this_thread::get_id() << ")" << std::endl;

    // Simular un error que podria dejar el mutex bloqueado sin RAII
    // if (true) {
    //     throw std::runtime_error("Error simulado dentro de seccion critica!");
    // }

    // El destructor de 'lock' se llama automaticamente aqui (al salir del scope),
    // liberando el mutex, incluso si hubo una excepcion.
    std::cout << "  Mutex LIBERADO por RAII." << std::endl;
} // 'lock' sale de scope, el mutex se desbloquea.

// --- 3. RAII para Memoria Dinámica (Punteros Inteligentes) ---
// (Ya visto en subtopic anterior, pero es el ejemplo mas clasico de RAII)
class Dato {
public:
    int valor;
    Dato(int v) : valor(v) { std::cout << "  Dato " << valor << " CREADO." << std::endl; }
    ~Dato() { std::cout << "  Dato " << valor << " DESTRUIDO." << std::endl; }
};

void manejarMemoriaConUniquePtr() {
    std::cout << "\n--- Manejo de Memoria con RAII (std::unique_ptr) ---" << std::endl;
    std::unique_ptr<Dato> miDato = std::make_unique<Dato>(123); // Recurso adquirido
    miDato->usar(); // Supongamos que Dato tiene un metodo 'usar'
    std::cout << "  Memoria gestionada por unique_ptr." << std::endl;
    // 'miDato' sale del ambito, su destructor libera la memoria.
} // 'miDato' se destruye aqui, llamando a delete en el 'Dato(123)'.


int main() {
    escribirEnArchivoConRAII("logs_app.txt", "Inicio de la aplicacion.");
    escribirEnArchivoConRAII("logs_app.txt", "Procesando datos.");

    // Demostracion de RAII con mutexes y hilos
    std::thread t1(incrementarContadorSeguro);
    std::thread t2(incrementarContadorSeguro);
    t1.join();
    t2.join();
    std::cout << "  Valor final del contador compartido: " << contador_compartido << std::endl;

    manejarMemoriaConUniquePtr();

    std::cout << "\nTodos los recursos deberían haberse gestionado de forma segura y automática." << std::endl;

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 3,
    'tittle_level': 'Manejo de Memoria y Recursos',
    'topic': 'RAII (Resource Acquisition Is Initialization)',
    'subtopic': 'Ejemplos prácticos',
    'definition': '''
Los **ejemplos prácticos** de RAII en C++ son innumerables y cubren casi todos los aspectos de la programación donde se manejan recursos. Es un patrón de diseño tan fundamental que muchas de las clases más importantes de la Standard Library de C++ lo utilizan internamente, lo que nos permite escribir código más seguro y robusto sin siquiera darnos cuenta de que estamos aplicando RAII.

¿Te estás preguntando por qué esto importa?

Ver RAII en acción te ayuda a entender su poder y por qué es la forma preferida de gestionar recursos en C++. No se trata solo de evitar fugas de memoria; se trata de construir un sistema donde los recursos se gestionan de forma automática y determinística, incluso en escenarios complejos como el manejo de excepciones.

Aquí tienes algunos de los ejemplos más comunes y vitales:

* **Punteros Inteligentes (`std::unique_ptr`, `std::shared_ptr`)**: Son el ejemplo canónico de RAII para la memoria dinámica. Cuando un objeto `std::unique_ptr` o `std::shared_ptr` sale de su ámbito, su destructor se encarga de llamar a `delete` en la memoria que gestionan, liberándola automáticamente.
* **Archivos (`std::ifstream`, `std::ofstream`, `std::fstream`)**: Cuando creas un objeto de estas clases para abrir un archivo, el archivo se abre en su constructor. Cuando el objeto sale de ámbito, su destructor lo cierra automáticamente, garantizando que no queden "file handles" abiertos y que los cambios se guarden.
* **Bloqueos de Hilos (`std::lock_guard`, `std::unique_lock`)**: En programación concurrente, necesitas bloquear mutexes para proteger datos compartidos. `std::lock_guard` y `std::unique_lock` adquieren el bloqueo en su constructor y lo liberan automáticamente en su destructor, evitando deadlocks si una función sale prematuramente (por ejemplo, debido a una excepción).
* **Sockets de Red, Conexiones a Bases de Datos, Manejadores de Eventos**: Aunque no siempre son clases de la STL, las bibliotecas suelen proporcionar clases RAII para estos recursos. Creas un objeto que representa la conexión/socket, y su destructor se encarga de cerrarlo limpiamente.

Estos ejemplos muestran que RAII simplifica drásticamente el manejo de errores y reduce la complejidad del código, ya que no tienes que preocuparte por liberar recursos manualmente en cada posible ruta de salida. Al dominar y aplicar RAII, no solo evitas problemas comunes, sino que también escribes código C++ más idiomático, limpio y profesional.
''',
    'code_example': r'''
#include <iostream>
#include <fstream>      // Para std::ofstream
#include <string>
#include <mutex>        // Para std::mutex, std::lock_guard
#include <thread>       // Para std::thread, std::this_thread
#include <vector>
#include <stdexcept>    // Para std::runtime_error
#include <memory>       // Para std::unique_ptr, std::shared_ptr

// --- Ejemplo 1: RAII con Archivos (std::ofstream) ---
// Ya implementado por la STL. El constructor abre, el destructor cierra.
void procesarArchivoLog(const std::string& logFileName, const std::string& message) {
    std::cout << "\n--- Procesando Archivo Log con std::ofstream (RAII) ---" << std::endl;
    try {
        std::ofstream logFile(logFileName, std::ios_base::app); // Constructor abre el archivo
        if (!logFile.is_open()) {
            throw std::runtime_error("No se pudo abrir el log: " + logFileName);
        }
        std::cout << "  Log '" << logFileName << "' ABIERTO." << std::endl;

        logFile << "[INFO] " << message << std::endl;
        std::cout << "  Mensaje escrito en log: '" << message << "'" << std::endl;

        // Simular un fallo que podría ocurrir en medio de la función
        // if (message == "FALLAR AQUI") {
        //     throw std::runtime_error("Fallo simulado en el proceso de log.");
        // }

        logFile << "[DEBUG] Proceso completado exitosamente." << std::endl;

    } catch (const std::runtime_error& e) {
        std::cerr << "  ERROR en procesarArchivoLog: " << e.what() << std::endl;
    }
    // El destructor de 'logFile' se llama automáticamente aquí.
    // Esto asegura que el archivo se cierre, sin importar si hubo una excepción.
    std::cout << "  Log '" << logFileName << "' CERRADO por RAII." << std::endl;
}

// --- Ejemplo 2: RAII con Bloqueos de Hilos (std::lock_guard) ---
// std::lock_guard garantiza que un mutex se libere, incluso con excepciones.
std::mutex g_mutex; // Mutex global para proteger 'g_data'
int g_data = 0;

void incrementarDatosCompartidos() {
    std::cout << "\n--- Incrementando Datos Compartidos con std::lock_guard (RAII) ---" << std::endl;
    // std::lock_guard adquiere el bloqueo del mutex en su constructor.
    std::lock_guard<std::mutex> lock(g_mutex); // g_mutex se bloquea aquí.
    std::cout << "  Hilo " << std::this_thread::get_id() << ": Mutex BLOQUEADO." << std::endl;

    g_data++; // Acceso seguro a los datos compartidos
    std::cout << "  Hilo " << std::this_thread::get_id() << ": g_data = " << g_data << std::endl;

    // Simular un error que podría dejar el mutex bloqueado sin RAII
    // if (g_data == 2) {
    //     throw std::runtime_error("Simulando crash de hilo!");
    // }

    // El destructor de 'lock' se llama automáticamente aquí (al salir del scope),
    // liberando el mutex.
    std::cout << "  Hilo " << std::this_thread::get_id() << ": Mutex LIBERADO por RAII." << std::endl;
} // 'lock' sale del scope y g_mutex se desbloquea automáticamente.

// --- Ejemplo 3: RAII con Memoria Dinámica (std::unique_ptr) ---
// Ya es el ejemplo más común y fundamental de RAII.
class RecursoCustom {
public:
    std::string id;
    RecursoCustom(std::string i) : id(i) {
        std::cout << "  Recurso Custom '" << id << "' ADQUIRIDO (CREADO)." << std::endl;
    }
    ~RecursoCustom() {
        std::cout << "  Recurso Custom '" << id << "' LIBERADO (DESTRUIDO)." << std::endl;
    }
    void doWork() const {
        std::cout << "  Recurso Custom '" << id << "' realizando trabajo." << std::endl;
    }
};

void usarRecursoCustom() {
    std::cout << "\n--- Usando Recurso Custom con std::unique_ptr (RAII) ---" << std::endl;
    try {
        std::unique_ptr<RecursoCustom> myResource = std::make_unique<RecursoCustom>("DB_Connection");
        myResource->doWork();
        // Simular un error en medio de la funcion
        // throw std::runtime_error("Error de DB simulado!");
        myResource->doWork(); // Esto no se ejecuta si hay excepcion
    } catch (const std::runtime_error& e) {
        std::cerr << "  ERROR en usarRecursoCustom: " << e.what() << std::endl;
    }
    // El destructor de 'myResource' se llama automáticamente aquí,
    // liberando el Recurso Custom.
    std::cout << "  Recurso Custom liberado por RAII." << std::endl;
}

int main() {
    procesarArchivoLog("app_activity.log", "Inicio de la sesion de usuario.");
    procesarArchivoLog("app_activity.log", "Operacion de guardado completada.");
    // procesarArchivoLog("app_activity.log", "FALLAR AQUI"); // Descomentar para probar la excepcion

    // Ejecutar la funcion con hilos para ver el mutex en accion
    std::vector<std::thread> threads;
    for (int i = 0; i < 3; ++i) {
        threads.emplace_back(incrementarDatosCompartidos);
    }
    for (auto& t : threads) {
        t.join();
    }
    std::cout << "\nValor final global: " << g_data << std::endl;

    usarRecursoCustom();

    std::cout << "\nTodos los recursos han sido gestionados de forma segura con RAII." << std::endl;

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 3,
    'tittle_level': 'Manejo de Memoria y Recursos',
    'topic': 'Move Semantics y Rvalue References',
    'subtopic': 'Constructores y operadores de movimiento',
    'definition': '''
Los **constructores y operadores de movimiento** son características clave de C++11 y posteriores que permiten a tus objetos "mover" recursos (como memoria asignada dinámicamente o descriptores de archivo) de un objeto a otro, en lugar de copiarlos. Esto se logra a través de las **rvalue references** (referencias a rvalues), que se denotan con un doble ampersand (`&&`). Un *rvalue* es típicamente un valor temporal, una expresión que no tiene una dirección de memoria permanente (como el resultado de una función o un literal).

¿Te estás preguntando por qué esto importa?

Piensa en una clase que gestiona un gran bloque de memoria, como un `std::vector` o `std::string`. Cuando copias un objeto de este tipo, se asigna un nuevo bloque de memoria y se copian todos los datos de un bloque a otro. Para objetos grandes, esto es costoso en términos de tiempo y memoria.

Los constructores y operadores de movimiento cambian esto:

* Un **constructor de movimiento** se invoca cuando creas un nuevo objeto a partir de un rvalue (un objeto temporal o uno que explícitamente se "mueve" usando `std::move`). En lugar de copiar los datos, el constructor de movimiento "roba" los recursos del objeto rvalue. Esto significa que el nuevo objeto toma posesión de la memoria asignada del objeto original, y el objeto original se deja en un estado "vacío" pero válido (por ejemplo, su puntero de datos se establece en `nullptr`), listo para ser destruido sin liberar los recursos que ahora posee el nuevo objeto.
* Un **operador de asignación de movimiento** (`operator=(&&)`) funciona de manera similar, pero para la asignación. Cuando asignas un rvalue a un objeto existente, el operador de movimiento "roba" los recursos del rvalue y luego libera los recursos que el objeto receptor ya poseía.

Al implementar constructores y operadores de movimiento para tus clases, permites que C++ optimice operaciones que de otro modo serían costosas copias profundas, transformándolas en transferencias de propiedad baratas. Esto es fundamental para la eficiencia en el manejo de recursos, especialmente cuando trabajas con colecciones de objetos grandes o cuando pasas objetos por valor.
''',
    'code_example': r'''
#include <iostream>
#include <vector>
#include <string>
#include <utility> // Para std::move

// Clase de ejemplo que gestiona un recurso dinamico (un arreglo de enteros)
class GranArreglo {
private:
    int* m_data;
    size_t m_size;

public:
    // Constructor normal
    GranArreglo(size_t size) : m_size(size) {
        m_data = new int[m_size];
        for (size_t i = 0; i < m_size; ++i) {
            m_data[i] = i;
        }
        std::cout << "Constructor NORMAL: Creado GranArreglo de " << m_size << " elementos en " << m_data << std::endl;
    }

    // Destructor
    ~GranArreglo() {
        if (m_data) {
            std::cout << "Destructor: Liberando GranArreglo de " << m_size << " elementos en " << m_data << std::endl;
            delete[] m_data;
        } else {
            std::cout << "Destructor: GranArreglo vacio o movido." << std::endl;
        }
    }

    // Constructor de copia (Lvalue reference 'const GranArreglo&')
    GranArreglo(const GranArreglo& other) : m_size(other.m_size) {
        m_data = new int[m_size];
        for (size_t i = 0; i < m_size; ++i) {
            m_data[i] = other.m_data[i]; // Copia elemento por elemento (costoso)
        }
        std::cout << "Constructor de COPIA: Copiado GranArreglo de " << m_size << " elementos de " << other.m_data << " a " << m_data << std::endl;
    }

    // Operador de asignacion de copia (Lvalue reference 'const GranArreglo&')
    GranArreglo& operator=(const GranArreglo& other) {
        if (this != &other) { // Evitar auto-asignacion
            // Liberar recursos existentes
            delete[] m_data;
            // Copiar desde el otro objeto
            m_size = other.m_size;
            m_data = new int[m_size];
            for (size_t i = 0; i < m_size; ++i) {
                m_data[i] = other.m_data[i];
            }
            std::cout << "Operador de ASIGNACION de COPIA: Copiado GranArreglo de " << m_size << " elementos." << std::endl;
        }
        return *this;
    }

    // --- Constructor de MOVIMIENTO (Rvalue reference 'GranArreglo&&') ---
    GranArreglo(GranArreglo&& other) noexcept : m_data(other.m_data), m_size(other.m_size) {
        // "Robar" los recursos del objeto 'other'
        other.m_data = nullptr; // Muy importante: dejar el origen en un estado valido pero vacio
        other.m_size = 0;
        std::cout << "Constructor de MOVIMIENTO: Movido GranArreglo de " << m_size << " elementos de " << m_data << " (anteriormente en " << other.m_data << ") a " << this << std::endl;
    }

    // --- Operador de ASIGNACION de MOVIMIENTO (Rvalue reference 'GranArreglo&&') ---
    GranArreglo& operator=(GranArreglo&& other) noexcept {
        if (this != &other) { // Evitar auto-asignacion
            // 1. Liberar nuestros propios recursos (si los tenemos)
            delete[] m_data;
            // 2. "Robar" los recursos del objeto 'other'
            m_data = other.m_data;
            m_size = other.m_size;
            // 3. Dejar el objeto 'other' en un estado valido pero vacio
            other.m_data = nullptr;
            other.m_size = 0;
            std::cout << "Operador de ASIGNACION de MOVIMIENTO: Movido GranArreglo de " << m_size << " elementos." << std::endl;
        }
        return *this;
    }

    // Metodo para ver el contenido (si no se ha movido)
    void printData() const {
        if (m_data) {
            std::cout << "Contenido (" << m_data << "): [";
            for (size_t i = 0; i < m_size; ++i) {
                std::cout << m_data[i] << (i == m_size - 1 ? "" : ", ");
            }
            std::cout << "]" << std::endl;
        } else {
            std::cout << "Contenido: (vacío / movido)" << std::endl;
        }
    }
};

// Funcion que retorna un objeto por valor (crea un rvalue temporal)
GranArreglo crearGranArreglo(size_t size) {
    return GranArreglo(size); // Retorna un rvalue temporal
}

int main() {
    std::cout << "--- Demostracion de Constructores y Operadores de Movimiento ---" << std::endl;

    // 1. Constructor de Copia vs. Constructor de Movimiento (al retornar de una funcion)
    std::cout << "\n--- Constructor al retornar de funcion ---" << std::endl;
    GranArreglo ga1 = crearGranArreglo(5); // Se llama al Constructor de MOVIMIENTO (o RVO/NRVO)
                                            // En muchos compiladores modernos, esto se optimiza (RVO/NRVO)
                                            // para evitar incluso el movimiento, pero conceptualmente es un movimiento.
    ga1.printData();


    // 2. Constructor de Movimiento (usando std::move explícitamente)
    std::cout << "\n--- Constructor de Movimiento con std::move ---" << std::endl;
    GranArreglo ga2(10);
    std::cout << "Original ga2: "; ga2.printData();
    
    // Explicitamente movemos ga2 a ga3. ga2 se convierte en un rvalue.
    GranArreglo ga3 = std::move(ga2); // Llama al Constructor de MOVIMIENTO
    std::cout << "Despues del movimiento:" << std::endl;
    std::cout << "  ga2 (original): "; ga2.printData(); // ga2 ahora está vacío
    std::cout << "  ga3 (movido a): "; ga3.printData();


    // 3. Operador de Asignacion de Movimiento
    std::cout << "\n--- Operador de Asignacion de Movimiento ---" << std::endl;
    GranArreglo ga4(7);
    std::cout << "Original ga4: "; ga4.printData();

    GranArreglo ga5(3); // Otro objeto preexistente
    std::cout << "Original ga5: "; ga5.printData();

    // Asignacion de movimiento: ga4 roba los recursos de ga5.
    // ga5 se convierte en un rvalue al usar std::move.
    ga4 = std::move(ga5); // Llama al Operador de ASIGNACION de MOVIMIENTO
    std::cout << "Despues de la asignacion de movimiento:" << std::endl;
    std::cout << "  ga4 (asignado a): "; ga4.printData();
    std::cout << "  ga5 (movido de): "; ga5.printData(); // ga5 ahora está vacío

    std::cout << "\n--- Comparacion con Asignacion de Copia (costoso) ---" << std::endl;
    GranArreglo ga6(4);
    GranArreglo ga7(2);
    ga6 = ga7; // Llama al Operador de ASIGNACION de COPIA (crea nueva memoria y copia datos)
    std::cout << "  ga6 (copiado): "; ga6.printData();
    std::cout << "  ga7 (original): "; ga7.printData();


    std::cout << "\nFin del programa. Los destructores se llamaran en orden inverso." << std::endl;
    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 3,
    'tittle_level': 'Manejo de Memoria y Recursos',
    'topic': 'Move Semantics y Rvalue References',
    'subtopic': 'Eficiencia en la transferencia de recursos',
    'definition': '''
La **eficiencia en la transferencia de recursos** es la razón principal de la existencia de *move semantics* y *rvalue references* en C++. Antes de C++11, transferir la propiedad de recursos costosos (como un gran bloque de memoria, un archivo abierto, un socket, etc.) de un objeto a otro implicaba casi siempre una **copia profunda**. Esto significaba asignar nueva memoria, copiar todos los datos del objeto original al nuevo, y luego liberar la memoria del objeto original. Para objetos grandes, esto era extremadamente ineficiente y a menudo innecesario.

¿Te estás preguntando por qué esto importa?

Considera un `std::vector` que contiene un millón de enteros. Si pasas este vector a una función *por valor*, o lo asignas a otra variable, sin *move semantics*, el compilador tendría que:

1.  Asignar un nuevo bloque de memoria para el nuevo vector.
2.  Copiar el millón de enteros del vector original al nuevo.
3.  Cuando el vector original (o el temporal) se destruya, liberar su memoria.

Esto es una cantidad significativa de trabajo (asignación, copia, liberación).

Con *move semantics*, si el compilador detecta que el objeto original es un **rvalue** (es decir, un objeto temporal que está a punto de ser destruido y cuyos recursos ya no se necesitarán, o un objeto que se ha marcado explícitamente para mover con `std::move`), en lugar de copiar:

1.  El nuevo objeto simplemente **"roba"** el puntero a la memoria asignada del objeto original.
2.  El objeto original se deja en un estado "vacío" pero válido (por ejemplo, su puntero de datos se establece en `nullptr`).

Esta "transferencia de propiedad" es una operación extremadamente barata (generalmente, solo el costo de copiar un puntero y un tamaño, y luego configurar el original a `nullptr`). Evita la asignación de memoria innecesaria, la copia de datos y la posterior liberación. Esto conduce a mejoras significativas en el rendimiento, especialmente en funciones que devuelven objetos grandes por valor, o cuando se reasignan elementos dentro de contenedores (`std::vector::push_back` con redimensionamiento, por ejemplo). La eficiencia es el motor detrás de *move semantics*.
''',
    'code_example': r'''
#include <iostream>
#include <vector>
#include <string>
#include <utility> // Para std::move
#include <chrono>  // Para medir el tiempo

// Clase de ejemplo que gestiona un recurso dinamico (un arreglo de enteros)
class GranArregloEficiente {
private:
    int* m_data;
    size_t m_size;

public:
    // Constructor
    GranArregloEficiente(size_t size) : m_size(size) {
        m_data = new int[m_size];
        for (size_t i = 0; i < m_size; ++i) {
            m_data[i] = i;
        }
        // std::cout << "Constructor NORMAL: Creado GranArreglo de " << m_size << std::endl;
    }

    // Destructor
    ~GranArregloEficiente() {
        if (m_data) {
            // std::cout << "Destructor: Liberando GranArreglo de " << m_size << std::endl;
            delete[] m_data;
        } else {
            // std::cout << "Destructor: GranArreglo vacio o movido." << std::endl;
        }
    }

    // Constructor de copia (COSTOSO)
    GranArregloEficiente(const GranArregloEficiente& other) : m_size(other.m_size) {
        m_data = new int[m_size];
        for (size_t i = 0; i < m_size; ++i) {
            m_data[i] = other.m_data[i];
        }
        // std::cout << "Constructor de COPIA: Copiado GranArreglo de " << m_size << std::endl;
    }

    // Constructor de MOVIMIENTO (EFICIENTE)
    GranArregloEficiente(GranArregloEficiente&& other) noexcept : m_data(other.m_data), m_size(other.m_size) {
        other.m_data = nullptr; // "Robar" el puntero
        other.m_size = 0;
        // std::cout << "Constructor de MOVIMIENTO: Movido GranArreglo de " << m_size << std::endl;
    }

    // (Opcional) Operadores de asignacion de copia y movimiento para un ejemplo completo
    GranArregloEficiente& operator=(const GranArregloEficiente& other) {
        if (this != &other) {
            delete[] m_data;
            m_size = other.m_size;
            m_data = new int[m_size];
            for (size_t i = 0; i < m_size; ++i) {
                m_data[i] = other.m_data[i];
            }
            // std::cout << "Operador de ASIGNACION de COPIA." << std::endl;
        }
        return *this;
    }

    GranArregloEficiente& operator=(GranArregloEficiente&& other) noexcept {
        if (this != &other) {
            delete[] m_data;
            m_data = other.m_data;
            m_size = other.m_size;
            other.m_data = nullptr;
            other.m_size = 0;
            // std::cout << "Operador de ASIGNACION de MOVIMIENTO." << std::endl;
        }
        return *this;
    }

    // Dummy method to prevent optimization from removing the object
    void do_something() const {
        if (m_data && m_size > 0) {
            volatile int temp = m_data[0]; // Access to prevent compiler from optimizing out
        }
    }
};

// Funcion que devuelve un GranArregloEficiente por valor
// Esto idealmente invoca el constructor de movimiento (o RVO/NRVO)
GranArregloEficiente crearYDevolverArreglo(size_t size) {
    return GranArregloEficiente(size);
}

// Funcion que toma un GranArregloEficiente por valor
// Esto idealmente invoca el constructor de movimiento
void consumirArreglo(GranArregloEficiente arr) {
    // arr es un objeto temporal, sus recursos se "movieron"
    arr.do_something(); // Para asegurar que el objeto no sea optimizado por el compilador
}

int main() {
    const size_t ARRAY_SIZE = 1000000; // Un millon de enteros

    std::cout << "--- Demostracion de Eficiencia con Move Semantics ---" << std::endl;

    // Medir tiempo para la construccion y retorno (esperamos movimiento o RVO/NRVO)
    auto start_create_return = std::chrono::high_resolution_clock::now();
    GranArregloEficiente ga1 = crearYDevolverArreglo(ARRAY_SIZE);
    ga1.do_something(); // Usar ga1 para evitar que sea optimizado
    auto end_create_return = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double, std::milli> duration_create_return = end_create_return - start_create_return;
    std::cout << "Tiempo para crear y devolver GranArreglo (con movimiento/RVO): " << duration_create_return.count() << " ms" << std::endl;


    // Medir tiempo para el paso por valor (esperamos movimiento)
    auto start_pass_by_value = std::chrono::high_resolution_clock::now();
    GranArregloEficiente ga2(ARRAY_SIZE);
    consumirArreglo(std::move(ga2)); // Forzamos el movimiento aquí
    // ga2.do_something(); // Esto ya no es seguro si ga2 se movio y ya no tiene datos.
    auto end_pass_by_value = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double, std::milli> duration_pass_by_value = end_pass_by_value - start_pass_by_value;
    std::cout << "Tiempo para pasar GranArreglo por valor (con std::move): " << duration_pass_by_value.count() << " ms" << std::endl;


    // Ejemplo de un vector que usa movimiento interno al redimensionar
    std::cout << "\n--- Ejemplo de std::vector usando movimiento interno ---" << std::endl;
    std::vector<GranArregloEficiente> vec_arr;
    vec_arr.reserve(2); // Pre-reservar capacidad

    // Al añadir el primer elemento, no hay redimensionamiento, se copia o construye
    auto start_push_back1 = std::chrono::high_resolution_clock::now();
    vec_arr.push_back(GranArregloEficiente(100)); // Constructor de movimiento (si el objeto es temporal)
    auto end_push_back1 = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double, std::milli> duration_push_back1 = end_push_back1 - start_push_back1;
    std::cout << "Tiempo para 1er push_back: " << duration_push_back1.count() << " ms" << std::endl;


    // Al añadir el segundo elemento, si la capacidad es excedida, std::vector
    // moverá los elementos existentes a una nueva ubicación.
    // En este caso, ya reservamos 2, asi que no habra redimensionamiento aqui,
    // pero si lo hubiera, el elemento existente se moveria.
    auto start_push_back2 = std::chrono::high_resolution_clock::now();
    vec_arr.push_back(GranArregloEficiente(100));
    auto end_push_back2 = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double, std::milli> duration_push_back2 = end_push_back2 - start_push_back2;
    std::cout << "Tiempo para 2do push_back: " << duration_push_back2.count() << " ms" << std::endl;

    // Para ver el movimiento de redimensionamiento:
    vec_arr.reserve(0); // Forzamos una capacidad baja
    vec_arr.clear();    // Borramos elementos

    vec_arr.push_back(GranArregloEficiente(ARRAY_SIZE)); // Primero elemento.
    std::cout << "Capacidad actual: " << vec_arr.capacity() << std::endl;

    auto start_redimension = std::chrono::high_resolution_clock::now();
    // Esto provocara una redimension y el movimiento del GranArregloEficiente anterior
    vec_arr.push_back(GranArregloEficiente(ARRAY_SIZE));
    auto end_redimension = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double, std::milli> duration_redimension = end_redimension - start_redimension;
    std::cout << "Tiempo para push_back con redimensionamiento (MOVER): " << duration_redimension.count() << " ms" << std::endl;
    std::cout << "Nueva capacidad: " << vec_arr.capacity() << std::endl;


    std::cout << "\nFin del programa. Los destructores se llamaran." << std::endl;
    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 3,
    'tittle_level': 'Manejo de Memoria y Recursos',
    'topic': 'Move Semantics y Rvalue References',
    'subtopic': 'Evitar copias innecesarias',
    'definition': r'''
El objetivo principal de *move semantics* y *rvalue references* es **evitar copias innecesarias** de datos y recursos. En la programación C++ tradicional, cuando se pasaba un objeto por valor, se creaba una copia completa de ese objeto, lo que podía ser muy costoso si el objeto gestionaba muchos datos. *Move semantics* ofrece una alternativa eficiente: en lugar de copiar, se "mueven" los recursos.

¿Te estás preguntando por qué esto importa?

Las copias son costosas porque implican:
1.  **Asignación de memoria**: Un nuevo bloque de memoria debe ser asignado para la copia.
2.  **Copia de datos**: Todos los datos del objeto original deben copiarse al nuevo bloque.
3.  **Desasignación**: La memoria original puede necesitar ser liberada (si es un objeto temporal).

Cuando trabajas con clases como `std::string`, `std::vector`, `std::unique_ptr`, `std::shared_ptr`, o tus propias clases que manejan recursos dinámicos, estas operaciones pueden consumir mucho tiempo y recursos de CPU, afectando el rendimiento de tu aplicación.

*Move semantics* resuelve este problema al introducir el concepto de **transferencia de propiedad**. Si un objeto es un *rvalue* (es decir, un objeto temporal que no se usará de nuevo o uno que explícitamente has marcado con `std::move` para indicar que sus recursos pueden ser "robados"), su constructor o operador de asignación de movimiento puede ser invocado. En lugar de una copia profunda, estos constructores/operadores simplemente:

* **Toman posesión** de los recursos del objeto origen (por ejemplo, copian el puntero a la memoria del origen).
* Dejan el objeto origen en un **estado válido pero vacío** (por ejemplo, establecen su puntero a `nullptr`) para que su destructor no intente liberar la memoria que ahora posee el nuevo objeto.

Esto convierte una operación potencialmente costosa en una operación de complejidad constante ($O(1)$), que es extremadamente rápida.

**Ejemplos clave donde se evitan copias innecesarias:**

* **Retorno de objetos por valor**: Cuando una función devuelve un objeto grande por valor, en lugar de copiarlo, el objeto se construye directamente en la ubicación del receptor usando el constructor de movimiento (o, más comúnmente, a través de optimizaciones del compilador como RVO/NRVO que evitan incluso el movimiento).
* **Paso de objetos por valor a funciones**: Si pasas un rvalue a una función que espera un objeto por valor, se invocará el constructor de movimiento, transfiriendo los recursos en lugar de copiarlos.
* **Contenedores de la STL**: Operaciones como `std::vector::push_back`, `emplace_back`, `resize`, o reasignación de elementos, utilizan *move semantics* para reubicaciones internas, moviendo elementos en lugar de copiarlos cuando sea posible.
* **`std::unique_ptr` y `std::shared_ptr`**: Estos punteros inteligentes solo permiten la transferencia de propiedad a través de `std::move` (`unique_ptr` es solo movible, no copiable), garantizando la eficiencia y la seguridad.

Al utilizar *move semantics* y *rvalue references* adecuadamente, puedes escribir código C++ que sea más eficiente, más rápido y que utilice menos memoria, especialmente en escenarios donde los objetos grandes se crean, pasan o reasignan con frecuencia.
''',
    'code_example': r'''
#include <iostream>
#include <vector>
#include <string>
#include <utility> // Para std::move

// Clase de ejemplo que gestiona un recurso dinamico (un arreglo de enteros)
class ContenedorRecursos {
private:
    int* m_data;
    size_t m_size;
    std::string m_name;

public:
    // Constructor normal
    ContenedorRecursos(size_t size, const std::string& name = "Anonimo")
        : m_size(size), m_name(name) {
        m_data = new int[m_size];
        for (size_t i = 0; i < m_size; ++i) {
            m_data[i] = i;
        }
        std::cout << "Constructor (NORMAL) " << m_name << ": Creado arreglo de " << m_size << " elementos." << std::endl;
    }

    // Destructor
    ~ContenedorRecursos() {
        if (m_data) {
            std::cout << "Destructor " << m_name << ": Liberando arreglo de " << m_size << " elementos." << std::endl;
            delete[] m_data;
        } else {
            std::cout << "Destructor " << m_name << ": Objeto vacio o movido." << std::endl;
        }
    }

    // Constructor de copia (Lvalue reference 'const ContenedorRecursos&')
    ContenedorRecursos(const ContenedorRecursos& other)
        : m_size(other.m_size), m_name(other.m_name + "_copy") {
        m_data = new int[m_size];
        for (size_t i = 0; i < m_size; ++i) {
            m_data[i] = other.m_data[i]; // Copia profunda: Costosa
        }
        std::cout << "Constructor de COPIA " << m_name << ": Copiado desde " << other.m_name << "." << std::endl;
    }

    // Operador de asignacion de copia (Lvalue reference 'const ContenedorRecursos&')
    ContenedorRecursos& operator=(const ContenedorRecursos& other) {
        if (this != &other) {
            delete[] m_data;
            m_size = other.m_size;
            m_name = other.m_name + "_assigned_copy";
            m_data = new int[m_size];
            for (size_t i = 0; i < m_size; ++i) {
                m_data[i] = other.m_data[i];
            }
            std::cout << "Operador de ASIGNACION de COPIA " << m_name << ": Asignado desde " << other.m_name << "." << std::endl;
        }
        return *this;
    }

    // Constructor de MOVIMIENTO (Rvalue reference 'ContenedorRecursos&&')
    ContenedorRecursos(ContenedorRecursos&& other) noexcept
        : m_data(other.m_data), m_size(other.m_size), m_name(other.m_name + "_moved") {
        other.m_data = nullptr; // Roba los recursos
        other.m_size = 0;
        other.m_name = "VACIO_POR_MOVIMIENTO"; // Marca el origen como vacio
        std::cout << "Constructor de MOVIMIENTO " << m_name << ": Movido desde " << other.m_name << "." << std::endl;
    }

    // Operador de ASIGNACION de MOVIMIENTO (Rvalue reference 'ContenedorRecursos&&')
    ContenedorRecursos& operator=(ContenedorRecursos&& other) noexcept {
        if (this != &other) {
            delete[] m_data; // Libera nuestros propios recursos
            m_data = other.m_data; // Roba los recursos
            m_size = other.m_size;
            m_name = other.m_name + "_moved_assigned";
            other.m_data = nullptr; // Deja el origen en estado valido pero vacio
            other.m_size = 0;
            other.m_name = "VACIO_POR_MOVIMIENTO";
            std::cout << "Operador de ASIGNACION de MOVIMIENTO " << m_name << ": Movido desde " << other.m_name << "." << std::endl;
        }
        return *this;
    }

    // Para evitar optimizaciones que puedan ocultar el comportamiento de movimiento
    void dummy_use() const {
        if (m_data && m_size > 0) {
            volatile int temp = m_data[0];
            (void)temp; // Para evitar advertencia de variable no utilizada
        }
    }
};

// --- Escenario 1: Retorno de objetos por valor ---
ContenedorRecursos crearYDevolver(size_t size) {
    std::cout << "\n--- Inicia crearYDevolver ---" << std::endl;
    ContenedorRecursos temp_obj(size, "Temporal_Funcion");
    std::cout << "--- Finaliza crearYDevolver ---" << std::endl;
    return temp_obj; // Debería invocar el constructor de movimiento (o RVO/NRVO)
}

// --- Escenario 2: Paso de objetos por valor a funciones ---
void consumirPorValor(ContenedorRecursos obj) {
    std::cout << "\n--- Inicia consumirPorValor ---" << std::endl;
    obj.dummy_use(); // Usar el objeto para que no se optimice
    std::cout << "--- Finaliza consumirPorValor ---" << std::endl;
} // 'obj' se destruye aquí, liberando el recurso que se movió.

int main() {
    std::cout << "=== Demostracion: Evitar Copias Innecesarias ===" << std::endl;

    // Escenario 1: Retorno por valor
    std::cout << "\n[MAIN] Llamando a crearYDevolver..." << std::endl;
    ContenedorRecursos cr1 = crearYDevolver(1000); // RVO/NRVO o Constructor de Movimiento
    std::cout << "[MAIN] cr1 existe." << std::endl;
    cr1.dummy_use();

    // Escenario 2: Paso por valor
    std::cout << "\n[MAIN] Llamando a consumirPorValor con un rvalue (objeto temporal)..." << std::endl;
    consumirPorValor(ContenedorRecursos(500, "ObjetoTemporal")); // Constructor de movimiento
    std::cout << "[MAIN] Despues de consumirPorValor con rvalue." << std::endl;

    std::cout << "\n[MAIN] Llamando a consumirPorValor con un lvalue usando std::move..." << std::endl;
    ContenedorRecursos cr2(700, "Original_Lvalue");
    std::cout << "[MAIN] cr2 antes de mover: "; cr2.dummy_use();
    consumirPorValor(std::move(cr2)); // Se invoca el constructor de movimiento
    std::cout << "[MAIN] cr2 despues de mover: "; cr2.dummy_use(); // cr2 ahora está en estado "movido de"

    // Escenario 3: std::vector::push_back y redimensionamiento
    std::cout << "\n[MAIN] Demostrando std::vector::push_back con movimiento..." << std::endl;
    std::vector<ContenedorRecursos> vec_recursos;
    vec_recursos.reserve(1); // Capacidad inicial 1

    std::cout << "[MAIN] Agregando primer elemento (no redimensiona, usa move-constructor para temporal)." << std::endl;
    vec_recursos.push_back(ContenedorRecursos(200, "Elemento1")); // Constructor de movimiento
    vec_recursos[0].dummy_use(); // Para que el objeto no se optimice

    std::cout << "[MAIN] Agregando segundo elemento (forza redimensionamiento y movimiento de Elemento1)." << std::endl;
    // Esto causara que 'Elemento1' se mueva a una nueva ubicacion interna del vector
    // usando su constructor de movimiento.
    vec_recursos.push_back(ContenedorRecursos(300, "Elemento2")); // Constructor de movimiento para Elemento2
    vec_recursos[0].dummy_use();
    vec_recursos[1].dummy_use();

    std::cout << "\n=== Fin de la Demostracion ===" << std::endl;

    // Los destructores de cr1 y los elementos de vec_recursos se llamaran al salir de main.
    return 0;
}
'''
  });
}

Future<void> insertMidLevel4DataCpp(Database db) async {
  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 4,
    'tittle_level': 'Excepciones y Manejo de Errores',
    'topic': 'Manejo de Excepciones',
    'subtopic': 'try, catch, throw',
    'definition': '''
El manejo de excepciones en C++ es un mecanismo robusto para gestionar errores y eventos inesperados que ocurren durante la ejecución de un programa, de una manera limpia y estructurada. Es una alternativa superior al uso de códigos de retorno de error (como `errno` o devolver valores especiales), ya que desacopla la lógica de manejo de errores de la lógica normal del programa. Los componentes principales son `try`, `catch` y `throw`.

¿Te estás preguntando por qué esto importa?

Imagina un programa donde cada función que podría fallar tuviera que devolver un código de error y cada llamada a esa función tuviera que verificar ese código. Esto resultaría en un código lleno de sentencias `if`, difícil de leer y mantener. Las excepciones resuelven esto al permitir que los errores "salten" a un manejador específico, sin interrumpir el flujo normal del programa en el punto donde ocurrió el error.

* **`try`**: Es un bloque de código donde se coloca el código que "intenta" realizar una operación que podría lanzar una excepción. Si una excepción ocurre dentro de este bloque, la ejecución se transfiere inmediatamente a un bloque `catch` asociado.
* **`throw`**: Se utiliza para "lanzar" una excepción. Cuando un problema irrecuperable (o un evento excepcional) ocurre, se crea un objeto de excepción y se lanza. Esto detiene la ejecución normal y busca un bloque `catch` adecuado. Puedes lanzar casi cualquier tipo de dato, pero es una buena práctica lanzar objetos de clases derivadas de `std::exception`.
* **`catch`**: Es un bloque de código que "captura" una excepción lanzada desde un bloque `try` (o desde una función llamada dentro de un bloque `try`). El `catch` especifica el tipo de excepción que puede manejar. Si el tipo de la excepción lanzada coincide (o es compatible polimórficamente) con el tipo especificado en el `catch`, ese bloque se ejecuta para manejar el error. Un bloque `try` puede tener múltiples bloques `catch` para manejar diferentes tipos de excepciones. Un `catch(...)` puede atrapar cualquier tipo de excepción, útil como un "catch-all" final.

El uso de `try`, `catch` y `throw` permite una separación clara entre el código que realiza el trabajo y el código que maneja los problemas, haciendo tus programas más organizados y fáciles de depurar.
''',
    'code_example': r'''
#include <iostream>
#include <string>
#include <vector>
#include <stdexcept> // Para excepciones estándar como std::runtime_error, std::out_of_range

// --- 1. Lanzar y Capturar una Excepcion Simple ---
double dividir(double numerador, double denominador) {
    if (denominador == 0) {
        // Lanzamos una excepcion si el denominador es cero
        throw std::runtime_error("Error: Division por cero no permitida.");
    }
    return numerador / denominador;
}

// --- 2. Multiples Bloques Catch ---
int obtenerElemento(const std::vector<int>& vec, int indice) {
    if (indice < 0 || indice >= vec.size()) {
        // Lanzamos una excepcion si el indice esta fuera de rango
        throw std::out_of_range("Error: Indice fuera de rango.");
    }
    return vec.at(indice); // std::vector::at() tambien lanza std::out_of_range
}

// --- 3. Catch-all (...) ---
void funcionQueLanzaCualquierCosa(int tipo) {
    if (tipo == 1) {
        throw "Esto es un char* literal."; // Lanzando un C-string
    } else if (tipo == 2) {
        throw 123; // Lanzando un entero
    } else if (tipo == 3) {
        throw std::string("Esto es un std::string."); // Lanzando un std::string
    } else {
        std::cout << "  No se lanzo ninguna excepcion." << std::endl;
    }
}

int main() {
    std::cout << "--- Ejemplo 1: Division por cero ---" << std::endl;
    try {
        double resultado = dividir(10.0, 2.0);
        std::cout << "10.0 / 2.0 = " << resultado << std::endl;

        resultado = dividir(5.0, 0.0); // Esto lanzara una excepcion
        std::cout << "5.0 / 0.0 = " << resultado << std::endl; // Esta linea no se ejecuta
    } catch (const std::runtime_error& e) {
        // Captura la excepcion de tipo std::runtime_error
        std::cerr << "  Excepcion capturada: " << e.what() << std::endl;
    }
    std::cout << "Continuacion del programa despues de la division.\n" << std::endl;


    std::cout << "--- Ejemplo 2: Acceso a elemento de vector ---" << std::endl;
    std::vector<int> numeros = {10, 20, 30};
    try {
        std::cout << "Elemento en indice 1: " << obtenerElemento(numeros, 1) << std::endl;
        std::cout << "Elemento en indice 5: " << obtenerElemento(numeros, 5) << std::endl; // Lanzara excepcion
    } catch (const std::out_of_range& e) {
        std::cerr << "  Excepcion de rango capturada: " << e.what() << std::endl;
    } catch (const std::exception& e) {
        // Un catch mas general para cualquier otra excepcion derivada de std::exception
        std::cerr << "  Excepcion generica capturada: " << e.what() << std::endl;
    }
    std::cout << "Continuacion del programa despues del acceso al vector.\n" << std::endl;


    std::cout << "--- Ejemplo 3: Catch-all ---" << std::endl;
    for (int i = 0; i <= 3; ++i) {
        try {
            std::cout << "Intentando lanzar tipo " << i << std::endl;
            funcionQueLanzaCualquierCosa(i);
        } catch (const char* msg) {
            std::cerr << "  Capturada C-string: " << msg << std::endl;
        } catch (int num) {
            std::cerr << "  Capturado entero: " << num << std::endl;
        } catch (const std::string& s) {
            std::cerr << "  Capturado std::string: " << s << std::endl;
        } catch (...) { // Catch-all: Captura cualquier otra excepcion
            std::cerr << "  Capturada una excepcion desconocida." << std::endl;
        }
    }
    std::cout << "Continuacion del programa despues del catch-all.\n" << std::endl;

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 4,
    'tittle_level': 'Excepciones y Manejo de Errores',
    'topic': 'Manejo de Excepciones',
    'subtopic': 'Jerarquía de excepciones estándar',
    'definition': '''
La **jerarquía de excepciones estándar** en C++ es una estructura de clases de excepciones predefinidas que proporciona la Standard Library. Todas estas clases derivan de una clase base común, `std::exception`. Esta jerarquía es crucial porque permite un manejo de errores más organizado y polimórfico, donde puedes capturar diferentes tipos de errores con diferentes niveles de especificidad.

¿Te estás preguntando por qué esto importa?

Usar la jerarquía estándar tiene varias ventajas:

1.  **Manejo polimórfico**: Puedes usar `catch (const std::exception& e)` para capturar cualquier excepción estándar, o un `catch` más específico (como `catch (const std::out_of_range& e)`) para un tipo particular de error. Esto permite que el código sea más flexible y reutilizable.
2.  **Mensajes de error estandarizados**: La mayoría de las clases derivadas de `std::exception` tienen un método `what()` (que es virtual) que devuelve una cadena de caracteres descriptiva sobre el error. Esto es muy útil para depurar y para mostrar mensajes informativos al usuario.
3.  **Consistencia**: Al adherirse a la jerarquía estándar, tu código es más coherente con el resto del ecosistema C++ y es más fácil de entender para otros desarrolladores.

La clase base `std::exception` se encuentra en el encabezado `<exception>`. Las clases derivadas más comunes se dividen generalmente en dos categorías principales:

* **`std::logic_error`**: Para errores que son el resultado de la lógica interna del programa, que podrían (y deberían) haber sido evitados con una programación cuidadosa. Ejemplos incluyen:
    * `std::invalid_argument`: Argumento no válido pasado a una función.
    * `std::out_of_range`: Intento de acceder a un elemento fuera de los límites (como en `std::vector::at`).
    * `std::length_error`: Se intentó crear un objeto demasiado grande.
* **`std::runtime_error`**: Para errores que no pueden ser detectados hasta el tiempo de ejecución, a menudo debido a factores externos (como errores de E/S, recursos del sistema). Ejemplos incluyen:
    * `std::overflow_error`: Desbordamiento aritmético.
    * `std::underflow_error`: Subdesbordamiento aritmético.
    * `std::range_error`: Resultado fuera del rango representable.
    * `std::bad_alloc`: Fallo en la asignación de memoria (lanzado por `new`).
    * `std::bad_cast`: Error en `dynamic_cast`.

Comprender y utilizar esta jerarquía te permite escribir código más robusto y con un manejo de errores más refinado.
''',
    'code_example': r'''
#include <iostream>
#include <string>
#include <vector>
#include <stdexcept> // Para la jerarquia de excepciones estandar

// Funcion que lanza una excepcion derivada de std::logic_error
void procesarNombre(const std::string& nombre) {
    if (nombre.empty()) {
        throw std::invalid_argument("El nombre no puede estar vacio.");
    }
    if (nombre.length() < 3) {
        throw std::length_error("El nombre debe tener al menos 3 caracteres.");
    }
    std::cout << "Nombre procesado: " << nombre << std::endl;
}

// Funcion que lanza una excepcion derivada de std::runtime_error
void cargarDatos(size_t cantidad) {
    if (cantidad == 0) {
        throw std::runtime_error("No se puede cargar una cantidad de datos nula.");
    }
    if (cantidad > 1000) {
        // Simulamos un error de recurso o capacidad
        throw std::bad_alloc("No hay suficiente memoria para cargar tantos datos."); // Aunque new lanza bad_alloc
                                                                                    // lo usamos para ilustrar runtime_error
    }
    std::cout << "Cargando " << cantidad << " datos..." << std::endl;
    // ... logica de carga de datos ...
    std::cout << "Datos cargados exitosamente." << std::endl;
}

// Funcion para demostrar std::out_of_range
int getVectorElement(const std::vector<int>& v, size_t index) {
    // std::vector::at() ya lanza std::out_of_range si el indice es invalido
    return v.at(index);
}


int main() {
    std::cout << "--- Ejemplos con std::logic_error ---" << std::endl;
    try {
        procesarNombre(""); // Lanza std::invalid_argument
    } catch (const std::invalid_argument& e) {
        std::cerr << "  Capturada invalid_argument: " << e.what() << std::endl;
    }

    try {
        procesarNombre("Jo"); // Lanza std::length_error
    } catch (const std::length_error& e) {
        std::cerr << "  Capturada length_error: " << e.what() << std::endl;
    }

    try {
        procesarNombre("Juan Perez");
    } catch (const std::logic_error& e) { // Captura cualquier logic_error
        std::cerr << "  Capturada logic_error (general): " << e.what() << std::endl;
    }


    std::cout << "\n--- Ejemplos con std::runtime_error ---" << std::endl;
    try {
        cargarDatos(0); // Lanza std::runtime_error
    } catch (const std::runtime_error& e) {
        std::cerr << "  Capturada runtime_error: " << e.what() << std::endl;
    }

    try {
        cargarDatos(2000); // Lanza std::bad_alloc (simulado)
    } catch (const std::bad_alloc& e) {
        std::cerr << "  Capturada bad_alloc: " << e.what() << std::endl;
    }

    try {
        cargarDatos(500);
    } catch (const std::runtime_error& e) { // Captura cualquier runtime_error
        std::cerr << "  Capturada runtime_error (general): " << e.what() << std::endl;
    }


    std::cout << "\n--- Ejemplo con std::out_of_range ---" << std::endl;
    std::vector<int> data = {1, 2, 3};
    try {
        int val = getVectorElement(data, 1);
        std::cout << "Elemento en indice 1: " << val << std::endl;
        val = getVectorElement(data, 5); // Lanza std::out_of_range
        std::cout << "Elemento en indice 5: " << val << std::endl;
    } catch (const std::out_of_range& e) {
        std::cerr << "  Capturada out_of_range: " << e.what() << std::endl;
    } catch (const std::exception& e) { // Captura cualquier std::exception
        std::cerr << "  Capturada excepcion generica: " << e.what() << std::endl;
    }

    std::cout << "\nFin del programa." << std::endl;

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 4,
    'tittle_level': 'Excepciones y Manejo de Errores',
    'topic': 'Manejo de Excepciones',
    'subtopic': 'Creación de excepciones personalizadas',
    'definition': '''
Aunque la jerarquía de excepciones estándar de C++ cubre muchos escenarios comunes, a menudo necesitarás **crear tus propias excepciones personalizadas** para representar errores específicos de tu aplicación. Esto te permite comunicar información de error más detallada y significativa que una excepción estándar, mejorando la robustez y la depurabilidad de tu código.

¿Te estás preguntando por qué esto importa?

Las excepciones personalizadas te permiten:

1.  **Mayor especificidad**: Puedes definir un tipo de excepción exacto para un error particular, lo que facilita a los bloques `catch` discriminar y manejar ese error de manera precisa.
2.  **Información detallada**: Tus excepciones pueden contener datos adicionales (como códigos de error específicos, mensajes detallados, nombres de archivos, etc.) que no estarían disponibles en una excepción estándar.
3.  **Claridad del código**: Al ver una excepción personalizada (`throw MiErrorDeRed;`), el lector del código entiende inmediatamente qué tipo de problema ocurrió.
4.  **Extensibilidad**: Puedes construir tu propia jerarquía de excepciones, derivando tus clases de `std::exception` o de sus subclases (`std::runtime_error`, `std::logic_error`) para mantener la compatibilidad con el sistema de excepciones estándar y permitir el manejo polimórfico.

La práctica recomendada para crear una excepción personalizada es:

* Derivar tu clase de excepción de una de las clases base de la Standard Library (generalmente `std::exception`, `std::runtime_error` o `std::logic_error`). Esto te permite aprovechar el polimorfismo y el método `what()`.
* Sobrescribir el método `virtual const char* what() const noexcept` para devolver un mensaje descriptivo del error.
* Puedes añadir miembros de datos adicionales a tu clase para almacenar información relevante sobre el error (códigos de error, nombres de archivos, etc.).
* Asegúrate de que el constructor de tu excepción personalizada inicialice correctamente la clase base.

Al diseñar tus propias excepciones, estás creando un sistema de manejo de errores que es tanto potente como expresivo, adaptado a las necesidades de tu aplicación.
''',
    'code_example': r'''
#include <iostream>
#include <string>
#include <stdexcept> // Para derivar de std::runtime_error

// --- 1. Excepcion Personalizada simple derivada de std::runtime_error ---
class ConfiguracionInvalida : public std::runtime_error {
public:
    // Constructor que llama al constructor de la clase base
    // std::runtime_error ya tiene un constructor que toma un C-string o std::string.
    ConfiguracionInvalida(const std::string& mensaje)
        : std::runtime_error("Error de Configuracion: " + mensaje) {
        // Puedes añadir logica adicional aqui si es necesario
    }
    // No necesitamos sobrescribir what() si la clase base ya lo maneja con el mensaje dado.
    // Pero si quisieras añadir mas informacion, lo harias asi:
    // virtual const char* what() const noexcept override {
    //     return std::runtime_error::what(); // o un mensaje mas complejo
    // }
};

// --- 2. Excepcion Personalizada con datos adicionales y jerarquia propia ---
class ErrorDeConexionBaseDatos : public std::runtime_error {
private:
    int codigo_error_db;
    std::string host_afectado;

public:
    // Constructor que toma el mensaje, codigo y host
    ErrorDeConexionBaseDatos(const std::string& mensaje, int codigo, const std::string& host)
        : std::runtime_error("DB_Error en " + host + ": " + mensaje + " (Codigo: " + std::to_string(codigo) + ")"),
          codigo_error_db(codigo),
          host_afectado(host) {
    }

    int getCodigoErrorDB() const {
        return codigo_error_db;
    }

    const std::string& getHostAfectado() const {
        return host_afectado;
    }

    // Opcional: Sobrescribir what() si quieres un formato mas especifico
    // virtual const char* what() const noexcept override {
    //     return std::runtime_error::what(); // Usa el mensaje base, o construye uno aqui
    // }
};

// --- 3. Una excepcion mas especifica, derivada de una personalizada ---
class AutenticacionFallida : public ErrorDeConexionBaseDatos {
private:
    std::string usuario_intento;
public:
    AutenticacionFallida(const std::string& host, const std::string& usuario)
        : ErrorDeConexionBaseDatos("Fallo de autenticacion para usuario: " + usuario, 401, host),
          usuario_intento(usuario) {
    }

    const std::string& getUsuarioIntento() const {
        return usuario_intento;
    }
};


// Funcion que simula la carga de configuracion
void cargarConfiguracion(int nivel) {
    if (nivel < 0) {
        throw ConfiguracionInvalida("El nivel de configuracion no puede ser negativo.");
    }
    if (nivel > 10) {
        throw ConfiguracionInvalida("El nivel de configuracion excede el maximo permitido (10).");
    }
    std::cout << "  Configuracion cargada con nivel: " << nivel << std::endl;
}

// Funcion que simula una operacion de base de datos
void conectarADatabase(const std::string& host, const std::string& usuario, const std::string& password) {
    std::cout << "  Intentando conectar a DB en " << host << " con usuario " << usuario << std::endl;
    if (host == "produccion.db") {
        throw ErrorDeConexionBaseDatos("Conexion fallida al host de produccion.", 500, host);
    }
    if (usuario == "admin" && password != "pass123") {
        throw AutenticacionFallida(host, usuario);
    }
    std::cout << "  Conexion a la base de datos exitosa." << std::endl;
}


int main() {
    std::cout << "--- Ejemplo de ConfiguracionInvalida ---" << std::endl;
    try {
        cargarConfiguracion(-1);
    } catch (const ConfiguracionInvalida& e) {
        std::cerr << "  Capturada ConfiguracionInvalida: " << e.what() << std::endl;
    }

    try {
        cargarConfiguracion(12);
    } catch (const ConfiguracionInvalida& e) {
        std::cerr << "  Capturada ConfiguracionInvalida: " << e.what() << std::endl;
    }

    try {
        cargarConfiguracion(5);
    } catch (const ConfiguracionInvalida& e) {
        std::cerr << "  Esto no deberia ejecutarse: " << e.what() << std::endl;
    }


    std::cout << "\n--- Ejemplo de ErrorDeConexionBaseDatos y AutenticacionFallida ---" << std::endl;
    try {
        conectarADatabase("produccion.db", "user1", "pass123");
    } catch (const ErrorDeConexionBaseDatos& e) {
        std::cerr << "  Capturada ErrorDeConexionBaseDatos: " << e.what() << std::endl;
        std::cerr << "    Codigo de Error DB: " << e.getCodigoErrorDB() << std::endl;
        std::cerr << "    Host afectado: " << e.getHostAfectado() << std::endl;
    }

    try {
        conectarADatabase("desarrollo.db", "admin", "wrong_pass");
    } catch (const AutenticacionFallida& e) {
        // Las excepciones mas especificas deben capturarse primero
        std::cerr << "  Capturada AutenticacionFallida: " << e.what() << std::endl;
        std::cerr << "    Usuario que intento: " << e.getUsuarioIntento() << std::endl;
        std::cerr << "    Host afectado: " << e.getHostAfectado() << std::endl;
    } catch (const ErrorDeConexionBaseDatos& e) {
        std::cerr << "  Capturada ErrorDeConexionBaseDatos (general): " << e.what() << std::endl;
    }

    try {
        conectarADatabase("test.db", "test_user", "test_pass");
    } catch (const ErrorDeConexionBaseDatos& e) {
        std::cerr << "  Esto no deberia ejecutarse: " << e.what() << std::endl;
    }

    std::cout << "\nFin del programa." << std::endl;

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 4,
    'tittle_level': 'Excepciones y Manejo de Errores',
    'topic': 'Buenas Prácticas en Excepciones',
    'subtopic': 'Excepciones vs códigos de error',
    'definition': '''
Cuando tu programa en C++ se topa con un problema, tienes dos formas principales de avisar: con códigos de error o con excepciones. Los códigos de error son como darle a una función un resultado numérico que dice "todo bien" o "algo falló". Las excepciones, por otro lado, son una forma de "lanzar" un aviso que detiene el flujo normal y busca a alguien que lo maneje.

¿Te estás preguntando por qué esto importa?

Elegir entre uno y otro es clave para un código limpio y robusto. Pensemos por un momento en las diferencias.

Los **códigos de error** son buenos para situaciones donde un fallo es esperado y parte del flujo normal, como cuando intentas abrir un archivo que no existe. Si usas códigos de error, cada vez que llamas a una función, tienes que poner un `if` para ver si todo salió bien. Esto puede llenar tu código de comprobaciones, haciendo que sea más difícil de leer y mantener, especialmente si el error tiene que pasar por muchas funciones antes de llegar a quien lo resuelva. Además, si olvidas revisar un código de error, tu programa podría seguir con datos erróneos, lo que es un problema silencioso y peligroso.

Las **excepciones**, en cambio, son para esos momentos donde algo realmente inesperado y grave pasa, algo que no debería ocurrir en el flujo normal de las cosas, como quedarse sin memoria o intentar dividir por cero. Cuando lanzas una excepción, el programa deja de ejecutar lo que estaba haciendo y "salta" directamente a un bloque `catch` que esté preparado para manejar ese tipo de error. Esto significa que tu código principal se mantiene limpio y centrado en la lógica de negocio, sin interrupciones por comprobaciones de errores. Si una excepción no se captura, el programa termina, lo cual es mejor que seguir ejecutándose con un estado corrupto.

La regla general es:
* Usa **códigos de error** para condiciones esperadas y recuperables que la función receptora debe manejar directamente como parte de su lógica de negocio (por ejemplo, "el usuario no tiene permiso").
* Usa **excepciones** para condiciones verdaderamente excepcionales e inesperadas que indican un fallo en el contrato de la función o un estado irrecuperable del sistema (por ejemplo, "memoria agotada", "índice fuera de límites"). Esto permite que el error se propague eficientemente a un punto donde pueda ser manejado o, si no se maneja, que el programa termine de forma segura.
''',
    'code_example': r'''
#include <iostream>
#include <string>
#include <optional> // Para un manejo de error mas moderno con std::optional

// --- Usando Codigos de Error ---
enum class EstadoOperacion {
    Exito,
    ArchivoNoEncontrado,
    PermisoDenegado,
    ErrorDesconocido
};

EstadoOperacion abrirArchivoConCodigo(const std::string& ruta) {
    if (ruta == "no_existe.txt") {
        std::cout << "  [Codigo de Error] Archivo '" << ruta << "' no encontrado." << std::endl;
        return EstadoOperacion::ArchivoNoEncontrado;
    }
    if (ruta == "solo_lectura.txt") {
        std::cout << "  [Codigo de Error] Permiso denegado para '" << ruta << "'." << std::endl;
        return EstadoOperacion::PermisoDenegado;
    }
    std::cout << "  [Codigo de Error] Archivo '" << ruta << "' abierto exitosamente." << std::endl;
    return EstadoOperacion::Exito;
}

void procesarArchivoConCodigo(const std::string& ruta) {
    EstadoOperacion estado = abrirArchivoConCodigo(ruta);
    if (estado == EstadoOperacion::Exito) {
        std::cout << "  [Codigo de Error] Procesando contenido del archivo..." << std::endl;
    } else if (estado == EstadoOperacion::ArchivoNoEncontrado) {
        std::cerr << "  [Codigo de Error] Fallo al procesar: El archivo no existe." << std::endl;
    } else if (estado == EstadoOperacion::PermisoDenegado) {
        std::cerr << "  [Codigo de Error] Fallo al procesar: No tiene permisos." << std::endl;
    } else {
        std::cerr << "  [Codigo de Error] Fallo al procesar: Error desconocido." << std::endl;
    }
}


// --- Usando Excepciones ---
#include <stdexcept> // Para std::runtime_error

void abrirArchivoConExcepcion(const std::string& ruta) {
    if (ruta == "no_existe.txt") {
        // Lanzamos una excepcion para indicar que el archivo no pudo ser abierto
        throw std::runtime_error("No se pudo encontrar el archivo: " + ruta);
    }
    if (ruta == "solo_lectura.txt") {
        throw std::runtime_error("Permiso denegado para el archivo: " + ruta);
    }
    std::cout << "  [Excepcion] Archivo '" << ruta << "' abierto exitosamente." << std::endl;
}

void procesarArchivoConExcepcion(const std::string& ruta) {
    try {
        abrirArchivoConExcepcion(ruta);
        std::cout << "  [Excepcion] Procesando contenido del archivo..." << std::endl;
    } catch (const std::runtime_error& e) {
        // La logica de manejo de errores esta centralizada aqui
        std::cerr << "  [Excepcion] Fallo al procesar: " << e.what() << std::endl;
    } catch (...) { // Un catch-all para cualquier otra cosa
        std::cerr << "  [Excepcion] Ocurrio un error inesperado." << std::endl;
    }
}

int main() {
    std::cout << "--- Demostracion con Codigos de Error ---" << std::endl;
    procesarArchivoConCodigo("mi_documento.txt");
    procesarArchivoConCodigo("no_existe.txt");
    procesarArchivoConCodigo("solo_lectura.txt");

    std::cout << "\n--- Demostracion con Excepciones ---" << std::endl;
    procesarArchivoConExcepcion("mi_documento.txt");
    procesarArchivoConExcepcion("no_existe.txt");
    procesarArchivoConExcepcion("solo_lectura.txt");

    std::cout << "\nObserva como las excepciones separan mejor la logica de error del flujo normal." << std::endl;

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 4,
    'tittle_level': 'Excepciones y Manejo de Errores',
    'topic': 'Buenas Prácticas en Excepciones',
    'subtopic': 'Garantías de excepción (strong, basic, no-throw)',
    'definition': '''
Cuando escribes código que puede lanzar excepciones, es fundamental pensar en qué estado quedará tu programa si una excepción ocurre. Esto es lo que llamamos **garantías de excepción**. Básicamente, son promesas sobre cómo se comportarán tus funciones en caso de que algo salga mal. Conocer y aplicar estas garantías es clave para construir sistemas robustos y confiables.

No sé tú, pero a mí esto al principio me costó entenderlo bien, así que vamos a verlo con calma.

Existen tres niveles principales de garantías de excepción:

1.  **Garantía Fuerte (Strong Guarantee)**: Esta es la promesa más ambiciosa. Significa que, si una función falla y lanza una excepción, el estado del programa **no cambia**. Es como si la operación nunca hubiera ocurrido: o se completa con éxito, o falla sin dejar rastro ni efectos secundarios visibles. Todos los datos y recursos se mantienen en su estado original. Esto es ideal, pero a menudo difícil de implementar porque requiere un manejo meticuloso de la reversión (rollback) o transacciones.

2.  **Garantía Básica (Basic Guarantee)**: Esta es una garantía más relajada. Si una función lanza una excepción, el programa sigue en un **estado válido**, aunque no necesariamente el original. Esto significa que no habrá corrupción de datos, no habrá fugas de recursos, y el programa podrá continuar ejecutándose, pero quizás los objetos involucrados estén en un estado intermedio o modificado que no se puede predecir fácilmente. Es un compromiso útil cuando la garantía fuerte es demasiado compleja de lograr.

3.  **Garantía Sin Lanzamiento (No-Throw Guarantee o `noexcept`)**: Esta es la promesa más sencilla: ¡la función **nunca lanzará una excepción**! Si una función está marcada con `noexcept` y, por alguna razón, una excepción se propaga desde ella (por un bug, por ejemplo), el programa terminará inmediatamente (se llamará a `std::terminate`). Esta garantía es vital para funciones de bajo nivel, destructores, y operaciones que no pueden fallar, ya que simplifica enormemente el manejo de errores en capas superiores.

Elegir la garantía adecuada para cada función depende de su propósito, su complejidad y el impacto de un fallo. Siempre que sea posible, aspira a la garantía fuerte, pero si no es factible, la básica es un buen respaldo. La garantía `noexcept` debe usarse con mucha cautela y solo cuando estés absolutamente seguro de que no habrá excepciones.
''',
    'code_example': r'''
#include <iostream>
#include <vector>
#include <string>
#include <stdexcept>
#include <algorithm> // Para std::swap

// Una clase simple que gestiona un recurso (memoria dinámica)
class DatoImportante {
private:
    int* m_data;
    size_t m_size;
public:
    DatoImportante(size_t size) : m_size(size), m_data(new int[size]) {
        std::cout << "  DatoImportante (size=" << m_size << ") creado." << std::endl;
        for (size_t i = 0; i < m_size; ++i) m_data[i] = i;
    }
    ~DatoImportante() {
        if (m_data) {
            std::cout << "  DatoImportante (size=" << m_size << ") destruido." << std::endl;
            delete[] m_data;
        } else {
            std::cout << "  DatoImportante (movido/vacio) destruido." << std::endl;
        }
    }
    // Constructor de movimiento para eficiencia (necesario para la strong guarantee)
    DatoImportante(DatoImportante&& other) noexcept
        : m_data(other.m_data), m_size(other.m_size) {
        other.m_data = nullptr;
        other.m_size = 0;
        std::cout << "  DatoImportante MOVIDO." << std::endl;
    }
    // Operador de asignacion de movimiento
    DatoImportante& operator=(DatoImportante&& other) noexcept {
        if (this != &other) {
            delete[] m_data;
            m_data = other.m_data;
            m_size = other.m_size;
            other.m_data = nullptr;
            other.m_size = 0;
            std::cout << "  DatoImportante ASIGNADO POR MOVIMIENTO." << std::endl;
        }
        return *this;
    }
    // Constructor de copia (para demostrar el costo de la copia)
    DatoImportante(const DatoImportante& other) : m_size(other.m_size), m_data(new int[other.m_size]) {
        std::cout << "  DatoImportante COPIADO." << std::endl;
        std::copy(other.m_data, other.m_data + other.m_size, m_data);
    }
    // Operador de asignacion de copia
    DatoImportante& operator=(const DatoImportante& other) {
        if (this != &other) {
            DatoImportante temp(other); // Usar copy-and-swap idiom para strong guarantee aqui
            std::swap(m_data, temp.m_data);
            std::swap(m_size, temp.m_size);
        }
        std::cout << "  DatoImportante ASIGNADO POR COPIA." << std::endl;
        return *this;
    }

    void printState() const {
        std::cout << "  Estado: " << (m_data ? "OK" : "Vacio/Movido") << ", Size: " << m_size << std::endl;
    }
};

// --- Garantía Fuerte ---
// Si falla, el estado original permanece.
// Se usa el "copy-and-swap idiom" o transacciones.
void modificarConGarantiaFuerte(DatoImportante& obj_a_modificar, size_t nuevo_tamano, bool lanzar_excepcion) {
    std::cout << "\n--- Intentando modificar con Garantia FUERTE ---" << std::endl;
    obj_a_modificar.printState();
    try {
        // Crear una copia temporal. Si esto falla, el original no se toca.
        DatoImportante temp_obj(nuevo_tamano); // Podría lanzar std::bad_alloc
        
        if (lanzar_excepcion) {
            std::cout << "  Simulando fallo ANTES de swap (strong guarantee)." << std::endl;
            throw std::runtime_error("Fallo simulado en Garantia Fuerte.");
        }

        // Si todo va bien hasta aqui, intercambiamos los recursos (no lanza excepciones)
        std::swap(obj_a_modificar, temp_obj); // std::swap es noexcept para DatoImportante
        std::cout << "  Modificacion EXITOSA con Garantia Fuerte." << std::endl;
    } catch (const std::exception& e) {
        std::cerr << "  ERROR (Garantia Fuerte): " << e.what() << std::endl;
        std::cout << "  Estado original de obj_a_modificar RESTAURADO (o no afectado)." << std::endl;
    }
    obj_a_modificar.printState();
}


// --- Garantía Básica ---
// Si falla, el objeto queda en un estado válido, pero no necesariamente el original.
void modificarConGarantiaBasica(DatoImportante& obj_a_modificar, size_t nuevo_tamano, bool lanzar_excepcion) {
    std::cout << "\n--- Intentando modificar con Garantia BASICA ---" << std::endl;
    obj_a_modificar.printState();
    try {
        // Realizar la modificacion in-place. Si falla, el objeto puede quedar medio modificado.
        // Simulamos la asignacion de nueva memoria directamente
        delete[] obj_a_modificar.m_data; // Paso 1: Liberar recursos viejos
        obj_a_modificar.m_data = nullptr; // Marcar como nulo para evitar doble free si falla la sig linea
        
        if (lanzar_excepcion) {
            std::cout << "  Simulando fallo DESPUES de liberar (basic guarantee)." << std::endl;
            throw std::runtime_error("Fallo simulado en Garantia Basica.");
        }

        obj_a_modificar.m_data = new int[nuevo_tamano]; // Paso 2: Asignar nuevos recursos (puede lanzar)
        obj_a_modificar.m_size = nuevo_tamano;
        for (size_t i = 0; i < obj_a_modificar.m_size; ++i) obj_a_modificar.m_data[i] = i;

        std::cout << "  Modificacion EXITOSA con Garantia Basica." << std::endl;
    } catch (const std::exception& e) {
        std::cerr << "  ERROR (Garantia Basica): " << e.what() << std::endl;
        std::cout << "  Estado de obj_a_modificar es VALIDO, pero puede no ser el original." << std::endl;
    }
    obj_a_modificar.printState();
}

// --- Garantía No-Throw (noexcept) ---
// La funcion promete que nunca lanzara una excepcion.
void funcionNoLanza(int valor) noexcept {
    std::cout << "\n--- Llamando a funcion con Garantia NO-THROW (noexcept) ---" << std::endl;
    try {
        if (valor < 0) {
            // Esto es INCORRECTO para una funcion noexcept.
            // Si una excepcion se propaga de una funcion noexcept, se llama a std::terminate.
            // throw std::runtime_error("ERROR interno en noexcept function!");
            std::cout << "  No se lanzara excepcion si valor es negativo (pero se podria si no fuera noexcept)." << std::endl;
        }
        std::cout << "  Proceso en funcion noexcept completado." << std::endl;
    } catch (const std::exception& e) {
        std::cerr << "  ESTO NO DEBERIA OCURRIR: Excepcion atrapada dentro de noexcept: " << e.what() << std::endl;
    }
}

int main() {
    DatoImportante mi_dato_fuerte(5);
    modificarConGarantiaFuerte(mi_dato_fuerte, 10, false); // Exito
    modificarConGarantiaFuerte(mi_dato_fuerte, 20, true);  // Falla, estado original

    DatoImportante mi_dato_basico(5);
    modificarConGarantiaBasica(mi_dato_basico, 10, false); // Exito
    modificarConGarantiaBasica(mi_dato_basico, 20, true);  // Falla, estado valido (pero no original)

    funcionNoLanza(10);
    // funcionNoLanza(-1); // Descomentar para ver std::terminate si lanzaras excepcion

    std::cout << "\nFin del programa. Los destructores se llamaran." << std::endl;
    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 4,
    'tittle_level': 'Excepciones y Manejo de Errores',
    'topic': 'Buenas Prácticas en Excepciones',
    'subtopic': 'Uso adecuado de RAII con excepciones',
    'definition': '''
Ya hablamos de RAII (Resource Acquisition Is Initialization), esa filosofía donde un recurso se adquiere en el constructor de un objeto y se libera automáticamente en su destructor. Ahora, ¿cómo se conecta esto con las excepciones? ¡La conexión es superpoderosa!

¿Te estás preguntando por qué esto importa?

Pues, piense por un momento en un escenario sin RAII: tienes una función que abre un archivo, luego hace un montón de cosas, y al final cierra el archivo. ¿Qué pasa si justo en medio de esas "cosas" se lanza una excepción? La ejecución salta a un `catch` y la línea para cerrar el archivo podría no ejecutarse nunca. ¡Boom! 💥 Tienes un archivo abierto que nadie va a cerrar, una fuga de recursos. Esto es un dolor de cabeza, especialmente con recursos como memoria, bloqueos de hilos o conexiones de red.

Aquí es donde **RAII brilla con las excepciones**. Cuando usas un objeto RAII para gestionar un recurso (como `std::unique_ptr` para memoria, `std::ofstream` para archivos o `std::lock_guard` para mutexes), el destructor de ese objeto **siempre se llama** cuando el objeto sale de su ámbito, sin importar si la función termina normalmente, si retorna un valor o si se lanza una excepción.

Esto significa que, con RAII, la limpieza de recursos está garantizada. Si una excepción ocurre, el "desenrollado de la pila" (stack unwinding) se encarga de destruir todos los objetos que estaban en el stack, y sus destructores se ejecutan liberando los recursos asociados. Es como tener un seguro automático para tus recursos. No tienes que preocuparte por añadir `try-catch` para cada recurso en cada función solo para asegurarte de que se libere; el patrón RAII lo hace por ti. Es un pilar fundamental para escribir código C++ seguro y robusto en entornos donde las excepciones son comunes.
''',
    'code_example': r'''
#include <iostream>
#include <fstream>      // Para std::ofstream
#include <memory>       // Para std::unique_ptr
#include <mutex>        // Para std::mutex y std::lock_guard
#include <string>
#include <stdexcept>    // Para std::runtime_error

// --- Clase que demuestra la falta de RAII y el problema con excepciones ---
class ArchivoMalo {
private:
    FILE* m_file; // Puntero a archivo C-style
    std::string m_filename;
public:
    ArchivoMalo(const std::string& filename) : m_filename(filename), m_file(nullptr) {
        m_file = fopen(m_filename.c_str(), "w");
        if (!m_file) {
            throw std::runtime_error("No se pudo abrir el archivo (Malo): " + filename);
        }
        std::cout << "  [MALO] Archivo '" << m_filename << "' abierto." << std::endl;
    }

    // No hay destructor para cerrar el archivo, lo que causara una fuga si no se llama 'close' manualmente.
    void escribir(const std::string& texto) {
        if (m_file) {
            fputs(texto.c_str(), m_file);
            fputs("\n", m_file);
            std::cout << "  [MALO] Escrito: '" << texto << "' en '" << m_filename << "'." << std::endl;
        }
    }

    void cerrar() {
        if (m_file) {
            fclose(m_file);
            std::cout << "  [MALO] Archivo '" << m_filename << "' CERRADO MANUALMENTE." << std::endl;
            m_file = nullptr;
        }
    }
};

// --- Funcion que usa la clase "mala" y demuestra la fuga ---
void operacionSinRAII(const std::string& filename, bool lanzar_excepcion) {
    std::cout << "\n--- Operacion SIN RAII (peligro de fuga) ---" << std::endl;
    ArchivoMalo* archivo = nullptr; // Se declara puntero aqui
    try {
        archivo = new ArchivoMalo(filename); // Se adquiere el recurso
        archivo->escribir("Primera linea.");
        
        if (lanzar_excepcion) {
            std::cout << "  [MALO] Lanzando excepcion, la funcion se abortara..." << std::endl;
            throw std::runtime_error("Error simulado a proposito!");
        }

        archivo->escribir("Segunda linea.");
        archivo->cerrar(); // Si no se lanza excepcion, se cierra
        delete archivo; // Se libera la memoria del objeto
        std::cout << "  [MALO] Operacion finalizada correctamente." << std::endl;

    } catch (const std::exception& e) {
        std::cerr << "  [MALO] Excepcion capturada: " << e.what() << std::endl;
        // Si no se llama 'archivo->cerrar()' ni 'delete archivo;' aqui, ¡fuga de recurso y memoria!
        if (archivo) {
           // archivo->cerrar(); // Necesitamos esto para limpiar
           // delete archivo;    // Y esto para liberar la memoria del puntero
        }
        std::cerr << "  [MALO] ¡Recurso 'ArchivoMalo' POTENCIALMENTE FILTRADO si no se limpio!" << std::endl;
    }
    std::cout << "--- Fin operacion SIN RAII ---" << std::endl;
}


// --- Clase que aplica RAII para un recurso de archivo (std::ofstream) ---
// std::ofstream ya es un ejemplo de RAII. Su constructor abre y su destructor cierra.
void operacionConRAII_ofstream(const std::string& filename, bool lanzar_excepcion) {
    std::cout << "\n--- Operacion CON RAII (std::ofstream) ---" << std::endl;
    try {
        std::ofstream outFile(filename, std::ios_base::out); // Recurso adquirido (archivo abierto)
        if (!outFile.is_open()) {
            throw std::runtime_error("No se pudo abrir el archivo (RAII): " + filename);
        }
        std::cout << "  [RAII] Archivo '" << filename << "' abierto." << std::endl;

        outFile << "Primera linea con RAII." << std::endl;
        std::cout << "  [RAII] Escrito: 'Primera linea con RAII'." << std::endl;

        if (lanzar_excepcion) {
            std::cout << "  [RAII] Lanzando excepcion, la funcion se abortara..." << std::endl;
            throw std::runtime_error("Error simulado a proposito con RAII!");
        }

        outFile << "Segunda linea con RAII." << std::endl;
        std::cout << "  [RAII] Escrito: 'Segunda linea con RAII'." << std::endl;
        std::cout << "  [RAII] Operacion finalizada correctamente." << std::endl;

    } catch (const std::exception& e) {
        std::cerr << "  [RAII] Excepcion capturada: " << e.what() << std::endl;
    }
    // El destructor de 'outFile' se llama AUTOMATICAMENTE aquí, cerrando el archivo.
    std::cout << "  [RAII] Recurso 'std::ofstream' LIBERADO automaticamente por RAII." << std::endl;
    std::cout << "--- Fin operacion CON RAII ---" << std::endl;
}

// --- Ejemplo de RAII con std::lock_guard para mutexes ---
std::mutex g_mutex;
int g_contador = 0;

void incrementarContadorRAII(bool lanzar_excepcion) {
    std::cout << "\n--- Operacion con std::lock_guard (RAII para mutex) ---" << std::endl;
    try {
        std::lock_guard<std::mutex> lock(g_mutex); // Mutex bloqueado (recurso adquirido)
        std::cout << "  [MUTEX_RAII] Mutex bloqueado." << std::endl;
        
        g_contador++;
        std::cout << "  [MUTEX_RAII] Contador incrementado a: " << g_contador << std::endl;

        if (lanzar_excepcion) {
            std::cout << "  [MUTEX_RAII] Lanzando excepcion, el mutex se desbloqueara de todas formas." << std::endl;
            throw std::runtime_error("Fallo simulado en seccion critica!");
        }
        std::cout << "  [MUTEX_RAII] Fin de seccion critica." << std::endl;

    } catch (const std::exception& e) {
        std::cerr << "  [MUTEX_RAII] Excepcion capturada: " << e.what() << std::endl;
    }
    // El destructor de 'lock' se llama automaticamente, desbloqueando el mutex.
    std::cout << "  [MUTEX_RAII] Mutex LIBERADO automaticamente por RAII." << std::endl;
    std::cout << "--- Fin operacion con std::lock_guard ---" << std::endl;
}


int main() {
    operacionSinRAII("log_malo.txt", false); // Exito, el archivo se cierra
    operacionSinRAII("log_malo_fuga.txt", true); // Falla, el archivo NO se cierra (fuga)

    operacionConRAII_ofstream("log_bueno.txt", false); // Exito, el archivo se cierra
    operacionConRAII_ofstream("log_bueno_seguro.txt", true); // Falla, el archivo se cierra de todas formas

    incrementarContadorRAII(false); // Exito, mutex se desbloquea
    incrementarContadorRAII(true);  // Falla, mutex se desbloquea de todas formas

    std::cout << "\nVerifica los archivos generados y los mensajes de la consola." << std::endl;
    std::cout << "El archivo 'log_malo_fuga.txt' puede quedar abierto si el programa no termina limpiamente." << std::endl;

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 4,
    'tittle_level': 'Excepciones y Manejo de Errores',
    'topic': 'Excepciones en Constructores y Destructores',
    'subtopic': 'Consideraciones especiales',
    'definition': '''
Cuando hablamos de excepciones en C++, los **constructores y destructores** tienen sus propias reglas y complejidades. No es lo mismo lanzar una excepción desde una función normal que hacerlo desde el constructor o destructor de un objeto. Aquí hay algunas consideraciones especiales que debes tener en cuenta.

¿Te estás preguntando por qué esto importa?

Pues bien, la forma en que los objetos se crean y se destruyen es fundamental para el manejo de recursos. Si una excepción ocurre en el constructor, el objeto podría no completarse su construcción. Si ocurre en el destructor, puede llevar a problemas mucho mayores.

1.  **Excepciones en Constructores**:
    * **Propósito**: Los constructores son el lugar ideal para adquirir recursos (memoria, archivos, conexiones, etc.). Si esta adquisición falla, el constructor debe lanzar una excepción.
    * **Manejo de recursos ya adquiridos**: Si un constructor adquiere múltiples recursos y falla en la mitad, solo los recursos **completamente construidos** hasta ese punto se destruirán automáticamente. Los recursos adquiridos antes del punto de fallo pero que no tienen un destructor llamado (por ejemplo, punteros crudos que se iban a envolver en un RAII pero la envoltura falló) pueden fugarse.
    * **Estado del objeto**: Si un constructor lanza una excepción, el objeto **nunca se considera completamente construido**. Esto significa que su destructor **nunca será llamado**. Es crucial que cualquier recurso ya adquirido dentro del constructor antes del punto de la excepción sea liberado correctamente (¡aquí es donde RAII es tu mejor amigo!).

2.  **Excepciones en Destructores**:
    * **¡Evítalo a toda costa!**: Es una regla casi universal en C++: **los destructores no deben lanzar excepciones**. Un destructor está ahí para limpiar. Si un destructor lanza una excepción mientras el stack ya se está desenrollando (quizás porque otra excepción ya se lanzó en el constructor o en una función normal), el programa terminará inmediatamente (`std::terminate`). Esto sucede porque el sistema no sabe cómo manejar dos excepciones activas a la vez.
    * **¿Qué hacer si un destructor falla?**: Si una operación dentro de un destructor *puede* fallar (como al vaciar un *buffer* en un archivo y ese fallo lanza una excepción), tienes que manejar ese fallo *dentro* del destructor y no permitir que la excepción se propague. Puedes registrar el error, ignorarlo, o intentar recuperarte, pero **nunca lanzar la excepción fuera del destructor**.

Comprender estas particularidades es esencial para escribir código C++ seguro y robusto, especialmente cuando trabajas con recursos del sistema o bibliotecas que pueden fallar durante la inicialización o limpieza.
''',
    'code_example': r'''
#include <iostream>
#include <string>
#include <stdexcept>
#include <vector>
#include <fstream> // Para std::ofstream
#include <memory>  // Para std::unique_ptr

// Clase de ejemplo que demuestra el manejo de recursos y excepciones en constructor
class RecursoCritico {
private:
    int* m_data;
    std::string m_name;
    bool m_open_file_success; // Para simular un recurso secundario

public:
    // Constructor: Adquiere recursos
    RecursoCritico(size_t size, const std::string& name, bool fail_file_open, bool fail_data_alloc)
        : m_data(nullptr), m_name(name), m_open_file_success(false) {
        std::cout << "  [Constructor " << m_name << "]: Intentando construir..." << std::endl;

        // Adquisicion del primer recurso (simulacion de archivo/conexion)
        if (fail_file_open) {
            std::cerr << "  [Constructor " << m_name << "]: Simulando fallo al abrir archivo." << std::endl;
            throw std::runtime_error("Fallo al abrir archivo para " + m_name);
        }
        m_open_file_success = true; // Recurso "archivo" adquirido exitosamente
        std::cout << "  [Constructor " << m_name << "]: Archivo/Conexion adquirida." << std::endl;

        // Adquisicion del segundo recurso (memoria dinamica)
        if (fail_data_alloc) {
            std::cerr << "  [Constructor " << m_name << "]: Simulando fallo al asignar memoria." << std::endl;
            // Si lanzamos aqui, el destructor NO se llamara, ¡fuga de m_open_file_success!
            // Esto es el problema que RAII resuelve.
            throw std::bad_alloc(); // Simula fallo de new
        }
        m_data = new int[size]; // Podria lanzar std::bad_alloc
        std::cout << "  [Constructor " << m_name << "]: Memoria asignada." << std::endl;

        // Si la construccion llega hasta aqui, el objeto esta completamente construido.
        std::cout << "  [Constructor " << m_name << "]: Objeto construido con exito." << std::endl;
    }

    // Destructor: Libera recursos
    ~RecursoCritico() {
        std::cout << "  [Destructor " << m_name << "]: Iniciando limpieza..." << std::endl;
        if (m_data) {
            delete[] m_data;
            m_data = nullptr;
            std::cout << "  [Destructor " << m_name << "]: Memoria liberada." << std::endl;
        }
        if (m_open_file_success) {
            // Aquí simularíamos cerrar el archivo/conexion
            std::cout << "  [Destructor " << m_name << "]: Archivo/Conexion cerrada." << std::endl;
        }
        std::cout << "  [Destructor " << m_name << "]: Limpieza finalizada." << std::endl;
    }

    // Metodo para simular una excepcion en tiempo de ejecucion
    void operacionQueFalla(bool lanzar) {
        if (lanzar) {
            std::cout << "  [Operacion " << m_name << "]: Simulando fallo en operacion normal." << std::endl;
            throw std::runtime_error("Fallo durante operacion normal de " + m_name);
        }
        std::cout << "  [Operacion " << m_name << "]: Operacion normal completada." << std::endl;
    }
};

// Clase que NO DEBERÍA lanzar en su destructor (mal ejemplo)
class PeligrosoDestructor {
private:
    std::string m_name;
public:
    PeligrosoDestructor(const std::string& name) : m_name(name) {
        std::cout << "  [PeligrosoDestructor " << m_name << "]: Construido." << std::endl;
    }
    ~PeligrosoDestructor() {
        std::cout << "  [PeligrosoDestructor " << m_name << "]: Destructor llamado." << std::endl;
        // ¡NO HACER ESTO EN PRODUCCION!
        // Lanzar una excepcion desde un destructor es una muy mala practica
        // y puede causar que std::terminate sea llamado si ya hay otra excepcion activa.
        // throw std::runtime_error("Excepcion lanzada desde destructor de " + m_name + "!");
        // En lugar de lanzar, deberias:
        std::cerr << "  [ADVERTENCIA] Error interno en destructor de " << m_name << std::endl;
    }
};


int main() {
    std::cout << "--- Excepciones en Constructores ---" << std::endl;

    // Caso 1: Constructor exitoso
    try {
        std::cout << "\nIntentando crear RecursoCritico 'R1' (exitoso):" << std::endl;
        RecursoCritico r1(10, "R1", false, false);
        r1.operacionQueFalla(false);
    } catch (const std::exception& e) {
        std::cerr << "  MAIN: Excepcion capturada: " << e.what() << std::endl;
    }
    std::cout << "------------------------------------" << std::endl;


    // Caso 2: Excepcion en constructor (primer recurso)
    try {
        std::cout << "\nIntentando crear RecursoCritico 'R2' (falla al abrir archivo):" << std::endl;
        RecursoCritico r2(10, "R2", true, false); // Falla en el primer paso
        r2.operacionQueFalla(false);
    } catch (const std::exception& e) {
        std::cerr << "  MAIN: Excepcion capturada: " << e.what() << std::endl;
        std::cerr << "  MAIN: Destructor de 'R2' NO FUE LLAMADO (objeto no construido)." << std::endl;
    }
    std::cout << "------------------------------------" << std::endl;


    // Caso 3: Excepcion en constructor (segundo recurso)
    try {
        std::cout << "\nIntentando crear RecursoCritico 'R3' (falla al asignar memoria):" << std::endl;
        RecursoCritico r3(1000000000, "R3", false, true); // Falla en el segundo paso (simulando bad_alloc)
        r3.operacionQueFalla(false);
    } catch (const std::bad_alloc& e) {
        std::cerr << "  MAIN: Excepcion bad_alloc capturada: " << e.what() << std::endl;
        std::cerr << "  MAIN: Destructor de 'R3' NO FUE LLAMADO (objeto no construido)." << std::endl;
        std::cerr << "  MAIN: ¡El recurso 'archivo/conexion' de 'R3' SE FUGÓ!" << std::endl; // Problema aqui
    } catch (const std::exception& e) {
        std::cerr << "  MAIN: Excepcion generica capturada: " << e.what() << std::endl;
    }
    std::cout << "------------------------------------" << std::endl;


    std::cout << "\n--- Excepciones en Destructores (MALAS PRACTICAS) ---" << std::endl;

    // Caso 4: Excepcion en destructor (peligro)
    try {
        std::cout << "\nCreando PeligrosoDestructor 'P1' y luego lanzando excepcion en operacion normal:" << std::endl;
        PeligrosoDestructor p1("P1");
        p1. ~PeligrosoDestructor(); // No hagas esto, solo para demostrar el punto
        // p1.operacionQueFalla(true); // Si p1 lanzara excepcion, y luego su destructor tambien, ¡terminate!
    } catch (const std::exception& e) {
        std::cerr << "  MAIN: Excepcion capturada: " << e.what() << std::endl;
    }
    std::cout << "------------------------------------" << std::endl;

    std::cout << "\nFin del programa." << std::endl;
    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 4,
    'tittle_level': 'Excepciones y Manejo de Errores',
    'topic': 'Excepciones en Constructores y Destructores',
    'subtopic': 'Prevención de fugas de recursos',
    'definition': '''
Prevenir las **fugas de recursos** es un objetivo primordial cuando se trabaja con excepciones, especialmente en los constructores. Una fuga de recursos ocurre cuando adquieres un recurso (memoria, archivo, conexión) pero, por alguna razón (como una excepción), nunca lo liberas, dejando el sistema en un estado inestable o consumiendo recursos innecesariamente.

¿Te estás preguntando por qué esto importa?

Si el constructor de un objeto es responsable de adquirir varios recursos, y falla a mitad de camino, aquellos recursos que ya se adquirieron pero que no han sido liberados porque el objeto no se construyó completamente (y por lo tanto su destructor nunca se llamó) se "fugarán". Es como si construyeras la mitad de una casa, pero luego algo falla y te vas sin limpiar los materiales que ya habías traído.

La estrategia principal para evitar estas fugas es el uso de **RAII (Resource Acquisition Is Initialization)**. Ya lo habíamos comentado antes, y aquí es donde se vuelve absolutamente vital:

* **Constructores y RAII**: Al envolver cada recurso adquirido dentro del constructor en su propio objeto RAII (como un `std::unique_ptr` para memoria, `std::ofstream` para archivos, o `std::lock_guard` para mutexes), te aseguras de que, incluso si una excepción se lanza en algún punto del constructor, los destructores de los objetos RAII **ya construidos** se llamarán automáticamente. Esto libera los recursos asociados a esos objetos RAII, evitando la fuga.
* **Orden de inicialización y destrucción**: Los miembros de una clase se construyen en el orden en que se declaran. Si la construcción de un miembro falla, los miembros ya construidos se destruyen automáticamente. Asegurarte de que tus miembros de clase sean tipos RAII (como `std::vector`, `std::string`, `std::unique_ptr`, etc.) en lugar de punteros crudos es la mejor defensa. Si un miembro no es RAII, eres tú quien debe garantizar su liberación manual en caso de excepción en la construcción.

En resumen, la clave para prevenir fugas de recursos con excepciones es confiar en el principio RAII y, siempre que sea posible, usar tipos de la Standard Library (o tus propias clases RAII) que ya implementen este patrón para gestionar tus recursos. De esta forma, el compilador se encarga de la limpieza por ti.
''',
    'code_example': r'''
#include <iostream>
#include <string>
#include <stdexcept>
#include <vector>
#include <fstream>
#include <memory> // Para std::unique_ptr

// --- Ejemplo de CLASE CON FUGA DE RECURSOS (sin RAII interno completo) ---
class RecursoConFuga {
private:
    FILE* m_archivo_crudo; // Recurso C-style que requiere manejo manual
    int* m_buffer_crudo;   // Memoria dinamica sin RAII
    std::string m_nombre;
    bool m_archivo_abierto;

public:
    RecursoConFuga(const std::string& nombre, bool fail_file, bool fail_buffer)
        : m_nombre(nombre), m_archivo_crudo(nullptr), m_buffer_crudo(nullptr), m_archivo_abierto(false) {
        std::cout << "  [CON FUGA " << m_nombre << "]: Constructor iniciando..." << std::endl;

        // Paso 1: Adquirir recurso de archivo
        m_archivo_crudo = fopen((m_nombre + ".txt").c_str(), "w");
        if (!m_archivo_crudo) {
            throw std::runtime_error("Fallo al abrir archivo para " + m_nombre);
        }
        m_archivo_abierto = true; // El archivo esta abierto
        std::cout << "  [CON FUGA " << m_nombre << "]: Archivo abierto." << std::endl;

        if (fail_file) {
            std::cerr << "  [CON FUGA " << m_nombre << "]: Simulando fallo *después* de abrir archivo." << std::endl;
            // ¡Si lanzamos aquí, m_archivo_crudo se fugara!
            throw std::runtime_error("Fallo simulado al inicio de RecursoConFuga.");
        }

        // Paso 2: Adquirir recurso de memoria
        try {
            m_buffer_crudo = new int[100]; // Podria lanzar std::bad_alloc
            std::cout << "  [CON FUGA " << m_nombre << "]: Buffer asignado." << std::endl;
        } catch (const std::bad_alloc&) {
            std::cerr << "  [CON FUGA " << m_nombre << "]: FALLO al asignar buffer." << std::endl;
            // Si esto falla, m_archivo_crudo sigue abierto. ¡FUGA!
            fclose(m_archivo_crudo); // Necesario para evitar la fuga del archivo
            m_archivo_crudo = nullptr;
            m_archivo_abierto = false;
            throw; // Relanzar la excepcion
        }

        if (fail_buffer) {
            std::cerr << "  [CON FUGA " << m_nombre << "]: Simulando fallo *después* de asignar buffer." << std::endl;
            // Si lanzamos aquí, m_archivo_crudo y m_buffer_crudo se fugaran si no se maneja
            fclose(m_archivo_crudo); // Necesario
            delete[] m_buffer_crudo; // Necesario
            m_archivo_crudo = nullptr;
            m_buffer_crudo = nullptr;
            m_archivo_abierto = false;
            throw std::runtime_error("Fallo simulado en medio de RecursoConFuga.");
        }

        std::cout << "  [CON FUGA " << m_nombre << "]: Constructor finalizado correctamente." << std::endl;
    }

    // Destructor: Solo se llama si el constructor termina completamente
    ~RecursoConFuga() {
        std::cout << "  [CON FUGA " << m_nombre << "]: Destructor iniciando..." << std::endl;
        if (m_buffer_crudo) {
            delete[] m_buffer_crudo;
            std::cout << "  [CON FUGA " << m_nombre << "]: Buffer liberado." << std::endl;
        }
        if (m_archivo_crudo) {
            fclose(m_archivo_crudo);
            std::cout << "  [CON FUGA " << m_nombre << "]: Archivo cerrado." << std::endl;
        }
        std::cout << "  [CON FUGA " << m_nombre << "]: Destructor finalizado." << std::endl;
    }
};


// --- Ejemplo de CLASE SIN FUGA DE RECURSOS (usando RAII internamente) ---
class RecursoSeguroRAII {
private:
    std::ofstream m_output_file; // std::ofstream es un tipo RAII
    std::unique_ptr<int[]> m_smart_buffer; // std::unique_ptr es un tipo RAII
    std::string m_nombre;

public:
    RecursoSeguroRAII(const std::string& nombre, bool fail_file, bool fail_buffer)
        : m_nombre(nombre) { // m_output_file y m_smart_buffer se inicializan por defecto
        std::cout << "  [SEGURO RAII " << m_nombre << "]: Constructor iniciando..." << std::endl;

        // Paso 1: Adquirir recurso de archivo (gestionado por std::ofstream)
        m_output_file.open(m_nombre + ".log"); // Puede lanzar si el constructor de ofstream falla
        if (!m_output_file.is_open()) {
            throw std::runtime_error("Fallo al abrir archivo para " + m_nombre);
        }
        std::cout << "  [SEGURO RAII " << m_nombre << "]: Archivo abierto (por std::ofstream)." << std::endl;

        if (fail_file) {
            std::cerr << "  [SEGURO RAII " << m_nombre << "]: Simulando fallo *después* de abrir archivo." << std::endl;
            // Si lanzamos aquí, el destructor de m_output_file se llamará automáticamente. ¡NO HAY FUGA!
            throw std::runtime_error("Fallo simulado al inicio de RecursoSeguroRAII.");
        }

        // Paso 2: Adquirir recurso de memoria (gestionado por std::unique_ptr)
        // Usamos std::make_unique para el buffer.
        // Si la asignacion falla, m_output_file se destruye automaticamente.
        try {
            m_smart_buffer = std::make_unique<int[]>(100);
            std::cout << "  [SEGURO RAII " << m_nombre << "]: Buffer asignado (por unique_ptr)." << std::endl;
        } catch (const std::bad_alloc&) {
            std::cerr << "  [SEGURO RAII " << m_nombre << "]: FALLO al asignar buffer." << std::endl;
            // m_output_file ya se cerrará por su destructor. ¡NO HAY FUGA!
            throw; // Relanzar la excepcion de asignacion de memoria
        }

        if (fail_buffer) {
            std::cerr << "  [SEGURO RAII " << m_nombre << "]: Simulando fallo *después* de asignar buffer." << std::endl;
            // Ambos m_output_file y m_smart_buffer se limpiaran automaticamente. ¡NO HAY FUGA!
            throw std::runtime_error("Fallo simulado en medio de RecursoSeguroRAII.");
        }

        std::cout << "  [SEGURO RAII " << m_nombre << "]: Constructor finalizado correctamente." << std::endl;
    }

    // El destructor implícito se encarga de llamar a los destructores de m_output_file y m_smart_buffer
    // garantizando que los recursos se liberen sin importar cómo salga del ámbito el objeto.
    ~RecursoSeguroRAII() {
        std::cout << "  [SEGURO RAII " << m_nombre << "]: Destructor llamado (liberacion automatica)." << std::endl;
    }
};


int main() {
    std::cout << "--- Demostracion de Fugas de Recursos en Constructores ---" << std::endl;

    // Caso 1: RecursoConFuga - falla temprano, fuga
    try {
        std::cout << "\nIntentando crear RecursoConFuga 'Fuga1' (falla al abrir archivo):" << std::endl;
        RecursoConFuga fuga1("fuga_ejemplo", true, false); // Falla despues de abrir archivo
    } catch (const std::exception& e) {
        std::cerr << "  MAIN: Excepcion capturada: " << e.what() << std::endl;
        std::cerr << "  MAIN: ¡ATENCION! El archivo 'fuga_ejemplo.txt' PUDO HABERSE FUGADO." << std::endl;
    }

    // Caso 2: RecursoConFuga - falla mas tarde, si no manejamos manualmente, fuga
    try {
        std::cout << "\nIntentando crear RecursoConFuga 'Fuga2' (falla despues de asignar buffer):" << std::endl;
        // Para demostrar la fuga: no añadas los fclose/delete[] en el catch del constructor
        RecursoConFuga fuga2("fuga_ejemplo2", false, true); // Falla despues de buffer
    } catch (const std::exception& e) {
        std::cerr << "  MAIN: Excepcion capturada: " << e.what() << std::endl;
        std::cerr << "  MAIN: ¡ATENCION! El archivo 'fuga_ejemplo2.txt' y la memoria PUDIERON HABERSE FUGADO." << std::endl;
    }


    std::cout << "\n--- Demostracion de Prevencion de Fugas con RAII ---" << std::endl;

    // Caso 3: RecursoSeguroRAII - falla temprano, NO fuga
    try {
        std::cout << "\nIntentando crear RecursoSeguroRAII 'Seguro1' (falla al abrir archivo):" << std::endl;
        RecursoSeguroRAII seguro1("seguro_ejemplo", true, false);
    } catch (const std::exception& e) {
        std::cerr << "  MAIN: Excepcion capturada: " << e.what() << std::endl;
        std::cerr << "  MAIN: ¡EXCELENTE! El archivo 'seguro_ejemplo.log' NO SE FUGÓ (gracias a std::ofstream)." << std::endl;
    }

    // Caso 4: RecursoSeguroRAII - falla mas tarde, NO fuga
    try {
        std::cout << "\nIntentando crear RecursoSeguroRAII 'Seguro2' (falla despues de asignar buffer):" << std::endl;
        RecursoSeguroRAII seguro2("seguro_ejemplo2", false, true);
    } catch (const std::exception& e) {
        std::cerr << "  MAIN: Excepcion capturada: " << e.what() << std::endl;
        std::cerr << "  MAIN: ¡EXCELENTE! Los recursos NO SE FUGARON (gracias a std::ofstream y std::unique_ptr)." << std::endl;
    }

    std::cout << "\nFin del programa. Observa los mensajes de limpieza y el estado de los recursos." << std::endl;
    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 4,
    'tittle_level': 'Excepciones y Manejo de Errores',
    'topic': 'Excepciones en Constructores y Destructores',
    'subtopic': 'Técnicas de manejo seguro',
    'definition': '''
El manejo seguro de excepciones en constructores y destructores se reduce a una filosofía principal: **RAII** y **la prohibición de excepciones en destructores**. Aplicar estas técnicas te ayudará a escribir un código C++ robusto y sin fugas de recursos, incluso en los escenarios de error más complicados.

¿Te estás preguntando por qué esto importa?

Si no sigues estas técnicas, te arriesgas a que tu programa se corrompa, tenga fugas de memoria o de otros recursos, o simplemente termine de forma abrupta e inesperada. Es como construir un puente sin planos de contingencia: si algo falla, todo se viene abajo.

Aquí te presento las técnicas clave para un manejo seguro:

1.  **Utiliza RAII para TODA adquisición de recursos**:
    * Este es el pilar. Siempre que adquieras un recurso (memoria, archivo, conexión de red, bloqueo de mutex), envuélvelo inmediatamente en un objeto cuya vida útil esté ligada a la del recurso. La biblioteca estándar de C++ ya te da herramientas perfectas para esto:
        * `std::unique_ptr` o `std::shared_ptr` para memoria dinámica.
        * `std::vector`, `std::string`, `std::map`, etc., para colecciones que gestionan su propia memoria.
        * `std::ifstream`, `std::ofstream`, `std::fstream` para archivos.
        * `std::lock_guard` o `std::unique_lock` para bloqueos de mutexes.
    * **Ventaja**: Si una excepción ocurre en el constructor de tu clase, los destructores de los miembros RAII que ya se inicializaron se llamarán automáticamente, garantizando que sus recursos se liberen. El constructor no necesita `try-catch` para limpiar sus propios recursos, ya que los miembros RAII lo hacen por él.

2.  **No lances excepciones desde destructores (hazlos `noexcept`)**:
    * Un destructor debe ser `noexcept` si es posible. Si una operación interna de tu destructor *puede* fallar (por ejemplo, escribir logs de errores a un archivo, o liberar una conexión de red que falla al cerrar), **debes capturar y manejar esa excepción dentro del destructor**. No permitas que la excepción salga del destructor.
    * **¿Por qué?**: Si una excepción ya está activa y un destructor lanza otra excepción, C++ no puede manejar dos excepciones simultáneamente y el programa terminará llamando a `std::terminate()`. Esto es un fallo catastrófico que debes evitar. Si hay un error al liberar un recurso en el destructor, lo mejor es registrar el error pero no propagar la excepción.

3.  **"Copy-and-Swap" Idiom para asignación (garantía fuerte)**:
    * Para operadores de asignación (`operator=`), el patrón "copy-and-swap" ayuda a proporcionar la garantía fuerte de excepción. Creas una copia temporal del objeto, realizas la asignación con esa copia, y luego intercambias (`std::swap`) los datos internos. Si la copia o la asignación falla, el objeto original no se toca.

Al aplicar estas técnicas, te aseguras de que tu código sea robusto, confiable y que gestione los recursos de manera impecable, incluso cuando las cosas se ponen difíciles y las excepciones hacen de las suyas.
''',
    'code_example': r'''
#include <iostream>
#include <string>
#include <stdexcept>
#include <vector>
#include <fstream>
#include <memory>       // Para std::unique_ptr
#include <mutex>        // Para std::mutex, std::lock_guard
#include <algorithm>    // Para std::swap

// --- Clase que demuestra manejo seguro con RAII en constructor ---
class GestorTareasSeguro {
private:
    std::unique_ptr<int[]> m_buffer; // Memoria gestionada por unique_ptr (RAII)
    std::ofstream m_log_file;       // Archivo gestionado por ofstream (RAII)
    std::mutex m_mutex_interno;     // Mutex para proteger algun recurso interno
    std::string m_id;
    bool m_init_success;

public:
    // Constructor: Adquiere recursos de forma segura
    GestorTareasSeguro(const std::string& id, size_t buffer_size, bool fail_log, bool fail_buffer)
        : m_id(id), m_init_success(false) {
        std::cout << "  [GestorTareasSeguro " << m_id << "]: Constructor iniciando..." << std::endl;

        // Paso 1: Adquirir recurso de log (gestionado por std::ofstream)
        m_log_file.open(m_id + "_log.txt");
        if (!m_log_file.is_open()) {
            throw std::runtime_error("No se pudo abrir log para " + m_id);
        }
        m_log_file << "Log inicializado." << std::endl;
        std::cout << "  [GestorTareasSeguro " << m_id << "]: Log file abierto." << std::endl;

        if (fail_log) {
            std::cerr << "  [GestorTareasSeguro " << m_id << "]: Simulando fallo *después* de abrir log." << std::endl;
            // Si lanzamos aquí, m_log_file se cerrará automáticamente por su destructor. ¡NO HAY FUGA!
            throw std::runtime_error("Fallo simulado al iniciar log.");
        }

        // Paso 2: Adquirir recurso de buffer (gestionado por std::unique_ptr)
        try {
            m_buffer = std::make_unique<int[]>(buffer_size); // Puede lanzar std::bad_alloc
            std::cout << "  [GestorTareasSeguro " << m_id << "]: Buffer asignado." << std::endl;
        } catch (const std::bad_alloc& e) {
            std::cerr << "  [GestorTareasSeguro " << m_id << "]: FALLO al asignar buffer: " << e.what() << std::endl;
            // m_log_file ya se cerrará por su destructor. ¡NO HAY FUGA!
            throw; // Relanzar la excepcion de asignacion de memoria
        }

        if (fail_buffer) {
            std::cerr << "  [GestorTareasSeguro " << m_id << "]: Simulando fallo *después* de asignar buffer." << std::endl;
            // Ambos m_log_file y m_buffer se limpiaran automáticamente. ¡NO HAY FUGA!
            throw std::runtime_error("Fallo simulado al llenar buffer.");
        }

        // Si llegamos aquí, todos los recursos se adquirieron con éxito.
        m_init_success = true;
        std::cout << "  [GestorTareasSeguro " << m_id << "]: Constructor finalizado con éxito." << std::endl;
    }

    // Destructor: Debería ser noexcept. No lanzar excepciones.
    // Los destructores de m_buffer, m_log_file, m_mutex_interno se llamarán automáticamente.
    ~GestorTareasSeguro() noexcept { // Marcado como noexcept
        std::cout << "  [GestorTareasSeguro " << m_id << "]: Destructor iniciando..." << std::endl;
        if (m_init_success) { // Solo si el objeto fue completamente construido
            m_log_file << "Cerrando log." << std::endl;
            // Si m_log_file.close() lanzara, deberíamos capturarla aquí
            // para evitar que la excepcion salga del destructor.
            try {
                // Aquí simular una operación que podría fallar pero que DEBE manejarse internamente.
                // Por ejemplo, forzar vaciado de buffers o cerrar conexiones de forma robusta.
                // std::cout << "  [GestorTareasSeguro " << m_id << "]: Intentando limpiar recurso extra (podria fallar)." << std::endl;
                // if (true) throw std::runtime_error("Fallo al cerrar recurso extra!"); // ¡NO HACER ESTO!
            } catch (const std::exception& e) {
                // Capturar y LOGEAR el error, pero NO relanzar.
                std::cerr << "  [GestorTareasSeguro " << m_id << "]: ERROR en destructor (MANEJADO): " << e.what() << std::endl;
            }
        } else {
             std::cout << "  [GestorTareasSeguro " << m_id << "]: Objeto no completamente construido, solo limpiando lo adquirido." << std::endl;
        }
        std::cout << "  [GestorTareasSeguro " << m_id << "]: Destructor finalizado." << std::endl;
    }

    void hacerAlgo() {
        std::lock_guard<std::mutex> lock(m_mutex_interno); // RAII para mutex
        std::cout << "  [GestorTareasSeguro " << m_id << "]: Haciendo algo seguro." << std::endl;
        m_log_file << "Algo hecho." << std::endl;
    }
};

int main() {
    std::cout << "--- Demostracion de Tecnicas de Manejo Seguro ---" << std::endl;

    // Caso 1: Constructor exitoso
    try {
        std::cout << "\nIntentando crear GestorTareasSeguro 'Task1' (exitoso):" << std::endl;
        GestorTareasSeguro task1("Task1", 100, false, false);
        task1.hacerAlgo();
    } catch (const std::exception& e) {
        std::cerr << "  MAIN: Excepcion capturada: " << e.what() << std::endl;
    }

    // Caso 2: Constructor falla en el primer recurso (log)
    try {
        std::cout << "\nIntentando crear GestorTareasSeguro 'Task2' (falla en log):" << std::endl;
        GestorTareasSeguro task2("Task2", 100, true, false);
        task2.hacerAlgo();
    } catch (const std::exception& e) {
        std::cerr << "  MAIN: Excepcion capturada: " << e.what() << std::endl;
        std::cerr << "  MAIN: Nota: El archivo de log de 'Task2' se cerro automaticamente." << std::endl;
    }

    // Caso 3: Constructor falla en el segundo recurso (buffer)
    try {
        std::cout << "\nIntentando crear GestorTareasSeguro 'Task3' (falla en buffer):" << std::endl;
        GestorTareasSeguro task3("Task3", 100, false, true); // buffer_size no causa fallo, pero fail_buffer si
        task3.hacerAlgo();
    } catch (const std::exception& e) {
        std::cerr << "  MAIN: Excepcion capturada: " << e.what() << std::endl;
        std::cerr << "  MAIN: Nota: El archivo de log y el buffer de 'Task3' se limpiaron automaticamente." << std::endl;
    }

    // Caso 4: Demostrando el destructor noexcept (no deberia lanzar)
    // Para probar un destructor noexcept lanzando, tendrias que descomentar
    // la linea "if (true) throw..." en el destructor de GestorTareasSeguro.
    // Al hacerlo, el programa llamaria a std::terminate().
    std::cout << "\n--- Demostrando Destructor noexcept ---" << std::endl;
    try {
        GestorTareasSeguro temp_task("TempTask", 10, false, false);
        // temp_task se destruira al salir de este bloque.
        // Si su destructor lanza, el programa terminara.
    } catch (const std::exception& e) {
        std::cerr << "  MAIN: Excepcion capturada despues de temp_task: " << e.what() << std::endl;
    }


    std::cout << "\nFin del programa. Todos los recursos fueron gestionados de forma segura." << std::endl;
    return 0;
}
'''
  });
}

Future<void> insertMidLevel5DataCpp(Database db) async {
  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 5,
    'tittle_level': 'STL (Standard Template Library)',
    'topic': 'Contenedores',
    'subtopic': 'vector, list, deque, set, map, unordered_map',
    'definition': '''
        La STL (Standard Template Library) de C++ te da un montón de herramientas para hacer la vida más fácil, y los **contenedores** son una de las más importantes. Piensa en ellos como estructuras de datos listas para usar, cada una con sus propias características y optimizaciones.

        ¿Te estás preguntando por qué esto importa?

        Pues, en lugar de reinventar la rueda cada vez que necesitas una lista, un conjunto o un diccionario, la STL te ofrece estas herramientas ya probadas y optimizadas. Esto te ahorra tiempo y te asegura un código más eficiente y mantenible.

        Aquí tienes un vistazo a los contenedores más comunes:

        * **`std::vector`**: Es como un array dinámico. Puedes añadir o quitar elementos al final, y acceder a cualquier elemento por su índice de forma rápida. Es ideal cuando necesitas un array que pueda crecer o cuando el acceso rápido a los elementos es clave.
        * **`std::list`**: Una lista doblemente enlazada. Insertar o eliminar elementos en cualquier posición es muy rápido, pero acceder a un elemento por su índice es lento. Úsala cuando necesites muchas inserciones/eliminaciones en el medio de la lista.
        * **`std::deque`**: Una "cola de dos extremos". Puedes añadir o quitar elementos tanto al principio como al final de forma eficiente. Es como un vector, pero también optimizado para añadir/quitar al principio.
        * **`std::set`**: Un conjunto ordenado. Almacena elementos únicos y los mantiene ordenados automáticamente. Buscar, insertar y eliminar elementos es rápido. Útil cuando necesitas mantener una colección ordenada sin duplicados.
        * **`std::map`**: Un diccionario (o "mapa"). Almacena pares clave-valor, donde cada clave es única. Buscar, insertar y eliminar elementos por clave es rápido. Perfecto para implementar diccionarios o tablas de búsqueda.
        * **`std::unordered_map`**: Similar a `std::map`, pero no ordena los elementos. Usa una tabla hash para un acceso aún más rápido (en promedio), pero el orden de los elementos no está definido.

        Cada uno de estos contenedores tiene sus propios métodos (como `push_back()`, `insert()`, `find()`, etc.) y sus propias características de rendimiento. Elegir el contenedor adecuado para cada situación es clave para un código eficiente.
        ''',
    'code_example': r'''
        #include <iostream>
        #include <vector>
        #include <list>
        #include <deque>
        #include <set>
        #include <map>
        #include <unordered_map>
        #include <string>

        int main() {
            std::cout << "--- std::vector (array dinamico) ---" << std::endl;
            std::vector<int> numeros = {10, 20, 30};
            numeros.push_back(40); // Añadir al final
            std::cout << "  Tamaño: " << numeros.size() << ", Elemento en [1]: " << numeros[1] << std::endl;

            std::cout << "\n--- std::list (lista doblemente enlazada) ---" << std::endl;
            std::list<std::string> nombres = {"Ana", "Beto"};
            nombres.push_back("Carlos");
            nombres.push_front("Diana");
            for (const auto& nombre : nombres) {
                std::cout << "  " << nombre << std::endl;
            }

            std::cout << "\n--- std::deque (cola de dos extremos) ---" << std::endl;
            std::deque<int> cola = {1, 2, 3};
            cola.push_front(0);
            cola.push_back(4);
            std::cout << "  Primer elemento: " << cola.front() << ", Ultimo elemento: " << cola.back() << std::endl;

            std::cout << "\n--- std::set (conjunto ordenado, sin duplicados) ---" << std::endl;
            std::set<int> conjunto = {3, 1, 4, 1, 5, 9, 2, 6, 5}; // El 1 y el 5 se ignoran por ser duplicados
            for (const auto& num : conjunto) {
                std::cout << "  " << num << std::endl; // Imprime ordenado: 1 2 3 4 5 6 9
            }

            std::cout << "\n--- std::map (diccionario ordenado por clave) ---" << std::endl;
            std::map<std::string, int> edades = {{"Ana", 25}, {"Beto", 30}};
            edades["Carlos"] = 28;
            std::cout << "  Edad de Beto: " << edades["Beto"] << std::endl;

            std::cout << "\n--- std::unordered_map (diccionario sin orden, mas rapido) ---" << std::endl;
            std::unordered_map<std::string, int> puntuaciones = {{"Jugador1", 100}, {"Jugador2", 150}};
            puntuaciones["Jugador3"] = 200;
            std::cout << "  Puntuacion de Jugador2: " << puntuaciones["Jugador2"] << std::endl;

            return 0;
        }
        '''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 5,
    'tittle_level': 'STL (Standard Template Library)',
    'topic': 'Contenedores',
    'subtopic': 'Características y casos de uso',
    'definition': '''
Los contenedores de la STL son como cajas especializadas que guardan tus datos. Cada una tiene su forma particular de almacenar y organizar la información, lo que las hace perfectas para diferentes situaciones. Entender sus características es clave para elegir la herramienta correcta para cada trabajo.

¿No sé tú, pero a mí esto al principio me costó? 

Es fundamental porque usar el contenedor equivocado puede hacer que tu programa sea lento o consuma demasiada memoria. Es como intentar clavar un tornillo con un martillo: puedes lograrlo, pero no es lo más eficiente ni lo ideal.

Vamos a ver de qué se trata cada uno y cuándo te conviene usarlos:

* **`std::vector`**
    * **Características**: Es una secuencia de elementos almacenados de forma contigua en memoria, como un array dinámico. Permite acceso aleatorio muy rápido a cualquier elemento (por su índice), inserciones y eliminaciones rápidas al final. Sin embargo, insertar o eliminar elementos en el medio es lento porque requiere mover muchos otros elementos. Cuando el vector crece, puede reasignar toda su memoria, lo que puede ser costoso.
    * **Casos de uso**: Es el contenedor "por defecto" para la mayoría de las situaciones. Ideal cuando necesitas un array que pueda crecer, acceso rápido a elementos por índice, y las inserciones/eliminaciones se dan principalmente al final. Por ejemplo, una lista de usuarios en una pantalla, una colección de puntos en un juego, o datos de una tabla en memoria.

* **`std::list`**
    * **Características**: Una lista doblemente enlazada. Los elementos no están necesariamente contiguos en memoria. Las inserciones y eliminaciones en cualquier posición (principio, medio o final) son extremadamente rápidas, ya que solo implican cambiar punteros. Sin embargo, el acceso a un elemento específico por su índice es lento porque hay que recorrer la lista desde el principio o el final.
    * **Casos de uso**: Cuando necesitas muchas inserciones y eliminaciones en el medio de la colección, y el acceso aleatorio no es una prioridad. Por ejemplo, para implementar una lista de tareas donde se añaden y se quitan elementos constantemente de cualquier parte, un historial de acciones que se actualiza frecuentemente, o para juegos donde los objetos se crean y destruyen en diferentes puntos del espacio.

* **`std::deque` (Double-Ended Queue)**
    * **Características**: Una cola de doble extremo, que permite añadir y quitar elementos de forma eficiente tanto al principio como al final. A diferencia del `std::vector`, no garantiza que los elementos estén contiguos en memoria, pero ofrece acceso aleatorio a los elementos por índice de forma casi tan eficiente como un `vector`.
    * **Casos de uso**: Cuando necesitas una cola donde puedas añadir y quitar elementos de ambos extremos rápidamente. Útil para implementar colas o pilas que necesitan crecer en ambas direcciones, o para escenarios donde necesitas acceso por índice y flexibilidad en los extremos, como un historial de comandos que se pueden deshacer (undo) y rehacer (redo).

* **`std::set`**
    * **Características**: Almacena elementos únicos y los mantiene ordenados automáticamente (usa un árbol binario de búsqueda balanceado, generalmente un árbol rojo-negro, lo que le da una complejidad logarítmica para inserción, búsqueda y eliminación). No permite elementos duplicados.
    * **Casos de uso**: Cuando necesitas una colección de elementos únicos que siempre deben estar ordenados y donde las operaciones de búsqueda, inserción y eliminación son frecuentes. Por ejemplo, para almacenar una lista de palabras únicas en un documento, un conjunto de IDs de usuario que deben ser únicos, o para implementar listas de prioridades donde el orden es importante.

* **`std::map`**
    * **Características**: Almacena pares clave-valor, donde las claves son únicas y se mantienen ordenadas. Al igual que `std::set`, suele implementarse con un árbol binario de búsqueda balanceado, lo que ofrece un rendimiento logarítmico para la búsqueda, inserción y eliminación basado en la clave.
    * **Casos de uso**: Cuando necesitas almacenar datos como pares clave-valor y el orden de las claves es importante, o cuando necesitas buscar rápidamente por clave y quieres que las claves estén ordenadas. Por ejemplo, para implementar un diccionario de sinónimos, un registro de puntajes de jugadores donde los nombres son las claves, o cualquier tipo de caché donde se accede a los datos por un identificador único.

* **`std::unordered_map`**
    * **Características**: También almacena pares clave-valor con claves únicas, pero no mantiene ningún orden. Utiliza una tabla hash para un acceso promedio de tiempo constante (muy rápido) para la búsqueda, inserción y eliminación. En el peor de los casos (colisiones de hash), el rendimiento puede degradarse a lineal.
    * **Casos de uso**: Es la opción preferida para diccionarios cuando el orden de las claves no importa y necesitas el rendimiento más rápido posible para la búsqueda, inserción y eliminación. Es ideal para implementar cachés de alta velocidad, tablas de conteo de frecuencias, o cualquier escenario donde la velocidad de acceso por clave es crítica y no hay necesidad de iterar las claves en un orden específico.
''',
    'code_example': r'''
#include <iostream>
#include <vector>
#include <list>
#include <deque>
#include <set>
#include <map>
#include <unordered_map>
#include <string>
#include <chrono> // Para medir tiempos (opcional, para demostracion de rendimiento)

// Funcion para medir tiempo de ejecucion (simplificada)
template<typename Func>
void medirTiempo(const std::string& mensaje, Func func) {
    auto start = std::chrono::high_resolution_clock::now();
    func();
    auto end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double, std::milli> duration = end - start;
    std::cout << "  " << mensaje << " tomó " << duration.count() << " ms." << std::endl;
}

int main() {
    // --- std::vector ---
    std::cout << "\n--- std::vector ---" << std::endl;
    std::vector<int> vec;
    medirTiempo("Push back 1M elementos (vector)", [&]() {
        for (int i = 0; i < 1000000; ++i) vec.push_back(i);
    });
    medirTiempo("Acceso aleatorio [500000] (vector)", [&]() {
        volatile int val = vec[500000]; // volatile para asegurar que no se optimice la lectura
    });
    // Insertar en medio es lento
    medirTiempo("Insertar en medio (pos 500000) (vector)", [&]() {
        vec.insert(vec.begin() + 500000, 999);
    });


    // --- std::list ---
    std::cout << "\n--- std::list ---" << std::endl;
    std::list<int> lista;
    medirTiempo("Push back 1M elementos (list)", [&]() {
        for (int i = 0; i < 1000000; ++i) lista.push_back(i);
    });
    // Acceso aleatorio es LENTO
    medirTiempo("Acceso aleatorio (rec. a pos 500000) (list)", [&]() {
        auto it = lista.begin();
        std::advance(it, 500000); // Esto es lento
        volatile int val = *it;
    });
    // Insertar en medio es RAPIDO
    medirTiempo("Insertar en medio (con iterador) (list)", [&]() {
        auto it = lista.begin();
        std::advance(it, 250000); // Lento para llegar al punto, pero la insercion es rapida
        lista.insert(it, 999);
    });


    // --- std::deque ---
    std::cout << "\n--- std::deque ---" << std::endl;
    std::deque<int> dq;
    medirTiempo("Push back 1M elementos (deque)", [&]() {
        for (int i = 0; i < 1000000; ++i) dq.push_back(i);
    });
    medirTiempo("Push front 1M elementos (deque)", [&]() {
        for (int i = 0; i < 1000000; ++i) dq.push_front(i);
    });
    medirTiempo("Acceso aleatorio [500000] (deque)", [&]() {
        volatile int val = dq[500000];
    });


    // --- std::set ---
    std::cout << "\n--- std::set ---" << std::endl;
    std::set<int> conjunto;
    medirTiempo("Insertar 1M elementos (set)", [&]() {
        for (int i = 0; i < 1000000; ++i) conjunto.insert(i);
    });
    medirTiempo("Buscar elemento 750000 (set)", [&]() {
        bool found = conjunto.count(750000);
    });
    medirTiempo("Eliminar elemento 250000 (set)", [&]() {
        conjunto.erase(250000);
    });


    // --- std::map ---
    std::cout << "\n--- std::map ---" << std::endl;
    std::map<int, std::string> mapa;
    medirTiempo("Insertar 1M pares (map)", [&]() {
        for (int i = 0; i < 1000000; ++i) mapa[i] = "valor_" + std::to_string(i);
    });
    medirTiempo("Buscar clave 750000 (map)", [&]() {
        std::string val = mapa[750000];
    });
    medirTiempo("Eliminar clave 250000 (map)", [&]() {
        mapa.erase(250000);
    });


    // --- std::unordered_map ---
    std::cout << "\n--- std::unordered_map ---" << std::endl;
    std::unordered_map<int, std::string> umapa;
    medirTiempo("Insertar 1M pares (unordered_map)", [&]() {
        for (int i = 0; i < 1000000; ++i) umapa[i] = "valor_" + std::to_string(i);
    });
    medirTiempo("Buscar clave 750000 (unordered_map)", [&]() {
        std::string val = umapa[750000];
    });
    medirTiempo("Eliminar clave 250000 (unordered_map)", [&]() {
        umapa.erase(250000);
    });
    std::cout << "  (Los tiempos pueden variar mucho, especialmente para unordered_map debido a colisiones)." << std::endl;


    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 5,
    'tittle_level': 'STL (Standard Template Library)',
    'topic': 'Contenedores',
    'subtopic': 'Comparación entre contenedores',
    'definition': '''
Ya hemos visto los principales contenedores de la STL y sus características individuales. Ahora, lo interesante es ponerlos uno al lado del otro para entender cuándo elegir uno sobre otro. La verdad es que no hay un contenedor "mejor" en general; todo depende de lo que necesites hacer con tus datos.

¿Te estás preguntando por qué esto importa?

Elegir el contenedor correcto es como elegir la herramienta adecuada para un trabajo. Si usas un destornillador de estrella para un tornillo plano, te va a costar más y podrías dañar el tornillo. Lo mismo ocurre con los contenedores: una buena elección puede significar un rendimiento excelente, mientras que una mala elección puede llevar a un programa lento y un consumo excesivo de memoria.

Aquí tienes una tabla comparativa y algunas pautas para ayudarte a decidir:

| Contenedor        | Acceso Aleatorio (por índice) | Inserción/Eliminación al Final/Principio | Inserción/Eliminación en Medio | Mantiene Orden | Elementos Únicos | Uso de Memoria   |
| :---------------- | :---------------------------- | :--------------------------------------- | :----------------------------- | :------------- | :--------------- | :--------------- |
| **`std::vector`** | Muy rápido (O(1))             | Muy rápido (O(1))                        | Lento (O(n))                   | Sí (orden de inserción) | No (permite duplicados) | Contiguo, eficiente |
| **`std::list`** | Lento (O(n))                  | Rápido (O(1))                            | Muy rápido (O(1))              | Sí (orden de inserción) | No (permite duplicados) | Disperso, más por punteros |
| **`std::deque`** | Rápido (O(1))                 | Rápido (O(1))                            | Lento (O(n))                   | Sí (orden de inserción) | No (permite duplicados) | Segmentado, razonable |
| **`std::set`** | No aplica                     | No aplica                                | Rápido (O(log n))              | Sí (orden ascendente) | Sí (solo únicos) | Más por nodos (árbol) |
| **`std::map`** | No aplica                     | No aplica                                | Rápido (O(log n))              | Sí (orden por clave) | Sí (claves únicas) | Más por nodos (árbol) |
| **`std::unordered_map`** | No aplica                  | No aplica                                | Muy rápido en promedio (O(1)) | No             | Sí (claves únicas) | Depende de la tabla hash |

**Pautas para elegir:**

* **¿Necesitas acceso rápido por índice?** Si tu principal operación es acceder a elementos por su posición (como `miVector[5]`), `std::vector` o `std::deque` son tus mejores amigos.
* **¿Necesitas insertar/eliminar frecuentemente en el medio?** Si tu lista cambia mucho en el centro, `std::list` es la opción más eficiente.
* **¿Necesitas añadir/quitar elementos rápidamente en ambos extremos?** `std::deque` es ideal para colas y pilas dinámicas.
* **¿Necesitas mantener los elementos ordenados y que sean únicos?** `std::set` te da un conjunto ordenado sin duplicados.
* **¿Necesitas almacenar pares clave-valor y el orden de las claves es importante?** `std::map` es la respuesta.
* **¿Necesitas la búsqueda por clave más rápida posible y el orden no importa?** `std::unordered_map` es tu ganador (¡cuidado con las colisiones del hash en el peor caso!).

Un error común es usar `std::list` cuando se podría usar `std::vector` por costumbre. Si no estás haciendo muchas inserciones/eliminaciones en el medio, `vector` casi siempre será más rápido debido a la localidad de caché y menos sobrecarga de memoria. De igual manera, si necesitas una tabla hash, casi siempre querrás `unordered_map` a menos que el orden de las claves sea crucial.
''',
    'code_example': r'''
#include <iostream>
#include <vector>
#include <list>
#include <map>
#include <unordered_map>
#include <string>
#include <algorithm> // Para std::find, std::sort (no aplicable a todos)
#include <chrono>

// Helper para medir tiempo
template<typename Func>
void medir_tiempo(const std::string& tarea, Func func) {
    auto start = std::chrono::high_resolution_clock::now();
    func();
    auto end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double, std::micro> duration = end - start;
    std::cout << "  " << tarea << ": " << duration.count() << " microsegundos." << std::endl;
}

int main() {
    const int NUM_ELEMENTOS = 10000; // Usamos un numero mas pequeño para ejemplos rapidos

    std::cout << "--- Comparacion de Acceso Aleatorio ---" << std::endl;
    std::vector<int> v(NUM_ELEMENTOS);
    std::list<int> l(NUM_ELEMENTOS);
    // Llenar para que tengan datos
    for(int i = 0; i < NUM_ELEMENTOS; ++i) {
        v[i] = i;
        l.push_back(i);
    }

    medir_tiempo("Vector - Acceso a elemento central", [&]() {
        volatile int x = v[NUM_ELEMENTOS / 2];
    });

    medir_tiempo("List - Acceso a elemento central (buscando)", [&]() {
        auto it = l.begin();
        std::advance(it, NUM_ELEMENTOS / 2);
        volatile int x = *it;
    });

    std::cout << "\n--- Comparacion de Insercion en el Medio ---" << std::endl;
    // Resetear contenedores para la insercion
    v.clear(); v.resize(NUM_ELEMENTOS); // Llenar con 0s
    l.clear(); for(int i=0; i<NUM_ELEMENTOS; ++i) l.push_back(0);

    medir_tiempo("Vector - Insertar en medio", [&]() {
        v.insert(v.begin() + NUM_ELEMENTOS / 2, 999);
    });

    medir_tiempo("List - Insertar en medio (con iterador pre-calculado)", [&]() {
        // En un caso real, el iterador se obtendria buscando o avanzando.
        // Simulamos que ya tenemos el iterador al medio.
        auto it_mid = l.begin();
        std::advance(it_mid, NUM_ELEMENTOS / 2); // Esta parte es lenta para list
        l.insert(it_mid, 999);
    });

    std::cout << "\n--- Comparacion de Busqueda por Clave ---" << std::endl;
    std::map<int, std::string> m;
    std::unordered_map<int, std::string> um;
    for(int i = 0; i < NUM_ELEMENTOS; ++i) {
        m[i] = "valor" + std::to_string(i);
        um[i] = "valor" + std::to_string(i);
    }

    medir_tiempo("Map - Buscar clave", [&]() {
        volatile std::string val = m[NUM_ELEMENTOS / 2];
    });

    medir_tiempo("Unordered_map - Buscar clave", [&]() {
        volatile std::string val = um[NUM_ELEMENTOS / 2];
    });
    std::cout << "  (Unordered_map suele ser mas rapido si el hash funciona bien)." << std::endl;

    std::cout << "\n--- Cuando el orden importa vs. no importa ---" << std::endl;
    std::set<int> my_set = {5, 1, 8, 3, 2};
    std::cout << "  std::set (ordenado):";
    for(int val : my_set) std::cout << " " << val; // Imprime 1 2 3 5 8
    std::cout << std::endl;

    std::unordered_map<std::string, int> my_unordered_map = {{"apple", 1}, {"banana", 2}, {"cherry", 3}};
    std::cout << "  std::unordered_map (sin orden garantizado):";
    for(auto const& [key, val] : my_unordered_map) std::cout << " {" << key << ":" << val << "}"; // Orden arbitrario
    std::cout << std::endl;


    // --- MAL EJEMPLO: Usar std::list para acceso por indice frecuente ---
    // Esto es un ejemplo de mal uso, ya que std::list es lento para esto.
    std::cout << "\n--- MAL USO: std::list para acceso por indice (LENTO) ---" << std::endl;
    std::list<int> bad_list;
    for(int i = 0; i < 1000; ++i) bad_list.push_back(i); // Un numero mas pequeno para que no tarde una eternidad

    medir_tiempo("List - Acceso repetido por indice (MALO)", [&]() {
        for (int i = 0; i < 100; ++i) { // Acceder 100 veces
            auto it = bad_list.begin();
            std::advance(it, 500); // Esto se repite y es ineficiente
            volatile int val = *it;
        }
    });
    std::cout << "  Si necesitas acceso por indice, NO uses std::list para esto." << std::endl;

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 5,
    'tittle_level': 'STL (Standard Template Library)',
    'topic': 'Iteradores y Algoritmos',
    'subtopic': 'Tipos de iteradores',
    'definition': '''
Si los contenedores son como las cajas donde guardas tus datos, los **iteradores** son las "llaves" o "punteros inteligentes" que te permiten recorrer y acceder a los elementos dentro de esas cajas. Son una pieza fundamental de la STL, porque proporcionan una forma unificada de interactuar con todos los contenedores, sin importar su tipo específico.

¿Te estás preguntando por qué esto importa?

Piensa en un control remoto universal. Un solo control te permite manejar diferentes televisores, reproductores de DVD o equipos de sonido. Los iteradores hacen algo similar: con una interfaz común, puedes moverte por un `std::vector`, un `std::list` o un `std::map`, sin tener que aprender una forma diferente de acceso para cada uno. Esto hace que tu código sea mucho más flexible y reutilizable.

Existen diferentes **tipos de iteradores**, cada uno con capacidades distintas:

1.  **Iteradores de entrada (Input Iterators)**: Son los más básicos. Solo puedes leer el elemento al que apuntan y avanzar una posición. Piensa en ellos como un lector de un solo paso: puedes leer un dato y luego pasar al siguiente, pero no puedes volver atrás ni modificar el dato.
    * **Ejemplo**: Leer datos de un flujo de entrada (`std::istream_iterator`).

2.  **Iteradores de salida (Output Iterators)**: Permiten escribir un elemento y avanzar una posición. Son lo opuesto a los de entrada.
    * **Ejemplo**: Escribir datos a un flujo de salida (`std::ostream_iterator`).

3.  **Iteradores hacia adelante (Forward Iterators)**: Combinan las capacidades de los iteradores de entrada y salida, y además te permiten avanzar varias veces por el contenedor desde la misma posición. No pueden ir hacia atrás.
    * **Ejemplo**: Los iteradores de `std::forward_list`.

4.  **Iteradores bidireccionales (Bidirectional Iterators)**: Aparte de todo lo que hacen los iteradores hacia adelante, ¡también pueden ir hacia atrás! Esto los hace muy útiles para recorrer estructuras en ambas direcciones.
    * **Ejemplo**: Los iteradores de `std::list`, `std::set`, `std::map`.

5.  **Iteradores de acceso aleatorio (Random Access Iterators)**: Son los más potentes. Además de poder leer, escribir y avanzar/retroceder, puedes "saltar" directamente a cualquier posición sumando o restando un número entero. Son como punteros normales de C en cuanto a sus capacidades de movimiento.
    * **Ejemplo**: Los iteradores de `std::vector`, `std::deque`, y arrays C-style.

Entender estos tipos es crucial porque los **algoritmos de la STL** (que veremos a continuación) a menudo requieren un tipo específico de iterador. Si un algoritmo necesita acceso aleatorio, no puedes pasárle un iterador de `std::list`. Es por esto que los iteradores son el pegamento que une los contenedores y los algoritmos en la STL.
''',
    'code_example': r'''
#include <iostream>
#include <vector>
#include <list>
#include <set>
#include <algorithm> // Para std::advance, std::copy
#include <iterator>  // Para std::ostream_iterator, std::istream_iterator

int main() {
    std::cout << "--- Demostrando Tipos de Iteradores ---" << std::endl;

    // --- Iteradores de Acceso Aleatorio (std::vector) ---
    std::vector<int> vec = {10, 20, 30, 40, 50};
    std::cout << "\nVector: ";
    for (int x : vec) std::cout << x << " ";
    std::cout << std::endl;

    auto it_vec = vec.begin();
    std::cout << "  Iterador de vector (acceso aleatorio): " << *it_vec << std::endl;
    it_vec += 2; // Podemos saltar directamente (acceso aleatorio)
    std::cout << "  Saltando 2 posiciones: " << *it_vec << std::endl;
    it_vec--;    // Podemos ir hacia atras
    std::cout << "  Retrocediendo 1 posicion: " << *it_vec << std::endl;


    // --- Iteradores Bidireccionales (std::list) ---
    std::list<std::string> lista = {"manzana", "banana", "cereza", "dátil"};
    std::cout << "\nLista: ";
    for (const std::string& s : lista) std::cout << s << " ";
    std::cout << std::endl;

    auto it_list = lista.begin();
    std::cout << "  Iterador de lista (bidireccional): " << *it_list << std::endl;
    // it_list += 2; // ERROR: No podemos saltar directamente con iteradores de lista
    std::advance(it_list, 2); // Debemos avanzar paso a paso
    std::cout << "  Avanzando 2 posiciones (std::advance): " << *it_list << std::endl;
    it_list--; // Podemos ir hacia atras
    std::cout << "  Retrocediendo 1 posicion: " << *it_list << std::endl;


    // --- Iteradores de Entrada (std::istream_iterator) ---
    // Usaremos un stringstream para simular una entrada para el ejemplo
    std::istringstream iss("100 200 300");
    std::cout << "\nLectura con Iteradores de Entrada (std::istream_iterator):" << std::endl;
    std::istream_iterator<int> input_it(iss);
    std::istream_iterator<int> eof_it; // Iterador de fin de flujo

    while(input_it != eof_it) {
        std::cout << "  Leido: " << *input_it << std::endl;
        ++input_it; // Solo podemos avanzar
    }

    // --- Iteradores de Salida (std::ostream_iterator) ---
    std::cout << "\nEscritura con Iteradores de Salida (std::ostream_iterator):" << std::endl;
    std::vector<double> precios = {1.99, 5.50, 10.25};
    // Escribe los elementos de precios a std::cout, separados por ", "
    std::copy(precios.begin(), precios.end(),
              std::ostream_iterator<double>(std::cout, ", "));
    std::cout << std::endl;

    std::cout << "\nFin de la demostracion de iteradores." << std::endl;

    /*
    // Ejemplo de MAL USO (intentar un operador no soportado por el tipo de iterador)
    std::set<int> my_set = {1,2,3};
    auto set_it = my_set.begin();
    // set_it += 1; // ERROR: std::set::iterator es Bidireccional, no de Acceso Aleatorio
    // set_it[0];   // ERROR: Tampoco permite acceso por indice directo
    */

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 5,
    'tittle_level': 'STL (Standard Template Library)',
    'topic': 'Iteradores y Algoritmos',
    'subtopic': 'Algoritmos estándar (sort, find, accumulate, etc.)',
    'definition': '''
La STL no solo te da contenedores para guardar datos y iteradores para moverte por ellos, sino también una colección impresionante de **algoritmos estándar**. Estos algoritmos son funciones genéricas que realizan operaciones comunes como buscar, ordenar, copiar o transformar datos. Lo genial es que trabajan con **iteradores**, lo que significa que puedes usarlos con *cualquier* contenedor de la STL (siempre que el tipo de iterador del contenedor cumpla los requisitos del algoritmo).

¿Te estás preguntando por qué esto importa?

Imagina tener que escribir tu propia función para ordenar una lista, luego otra para un array, y otra para un vector. Sería un desperdicio de tiempo y esfuerzo, y propenso a errores. Los algoritmos estándar resuelven esto: son como herramientas multiusos que funcionan en diferentes "superficies" (contenedores) gracias a los iteradores. Esto te ahorra un montón de trabajo y asegura que tu código sea robusto y eficiente, ya que estos algoritmos están altamente optimizados.

Aquí te presento algunos de los algoritmos más usados y sus casos de uso:

* **`std::sort`**: Este algoritmo te permite ordenar elementos en un rango específico.
    * **Características**: Necesita iteradores de acceso aleatorio. Por lo tanto, funciona con `std::vector`, `std::deque` y arrays C-style.
    * **Uso**: `std::sort(inicio, fin);` o `std::sort(inicio, fin, [](T a, T b){ return a > b; });` (para ordenar de forma personalizada).
    * **Caso de uso**: Ordenar una lista de números, nombres, o cualquier colección donde el orden secuencial sea importante.

* **`std::find`**: Busca el primer elemento que coincide con un valor dado en un rango.
    * **Características**: Necesita iteradores de entrada. Funciona con cualquier contenedor. Devuelve un iterador al elemento encontrado o al iterador `fin` si no lo encuentra.
    * **Uso**: `auto it = std::find(inicio, fin, valor_a_buscar);`
    * **Caso de uso**: Comprobar si un elemento existe en una colección.

* **`std::accumulate`**: Calcula la suma (o cualquier otra operación acumulativa) de los elementos en un rango, comenzando con un valor inicial.
    * **Características**: Necesita iteradores de entrada. Funciona con cualquier contenedor. Requiere incluir `<numeric>`.
    * **Uso**: `auto suma = std::accumulate(inicio, fin, valor_inicial);`
    * **Caso de uso**: Sumar todos los números en un vector, concatenar todas las cadenas en una lista, o calcular un producto de elementos.

* **`std::for_each`**: Aplica una función (o *lambda*) a cada elemento en un rango.
    * **Características**: Necesita iteradores de entrada. Funciona con cualquier contenedor.
    * **Uso**: `std::for_each(inicio, fin, [](T& elemento){ /* hacer algo */ });`
    * **Caso de uso**: Realizar una operación para cada elemento de una colección, como imprimir todos los elementos o modificarlos de alguna manera.

* **`std::copy`**: Copia elementos de un rango a otro.
    * **Características**: Necesita iteradores de entrada para la fuente y de salida para el destino.
    * **Uso**: `std::copy(inicio_fuente, fin_fuente, inicio_destino);`
    * **Caso de uso**: Copiar elementos de un vector a otro, o de un vector a una lista, o imprimir en la consola.

* **`std::count`**: Cuenta cuántas veces aparece un valor específico en un rango.
    * **Características**: Necesita iteradores de entrada.
    * **Uso**: `int veces = std::count(inicio, fin, valor_a_contar);`
    * **Caso de uso**: Saber cuántas veces se repite un número o una palabra en una colección.

Estos son solo unos pocos ejemplos. La `<algorithm>` cabecera es enorme y contiene una gran variedad de funciones para manipulación de rangos, transformaciones, búsquedas, reordenamientos, etc. Aprender a usarlos te permitirá escribir código más conciso, legible y eficiente.
''',
    'code_example': r'''
#include <iostream>
#include <vector>
#include <list>
#include <algorithm> // Para std::sort, std::find, std::copy, std::for_each, std::count
#include <numeric>   // Para std::accumulate
#include <string>

int main() {
    std::cout << "--- Demostrando Algoritmos Estándar ---" << std::endl;

    std::vector<int> numeros = {5, 2, 8, 1, 9, 4, 2, 7};
    std::cout << "\nVector original: ";
    for (int n : numeros) std::cout << n << " ";
    std::cout << std::endl;

    // --- std::sort ---
    // Ordena los elementos en un rango. Necesita iteradores de acceso aleatorio.
    std::sort(numeros.begin(), numeros.end());
    std::cout << "  Vector ordenado (std::sort): ";
    for (int n : numeros) std::cout << n << " ";
    std::cout << std::endl;

    // --- std::find ---
    // Busca el primer elemento con un valor especifico.
    auto it_find = std::find(numeros.begin(), numeros.end(), 8);
    if (it_find != numeros.end()) {
        std::cout << "  Elemento '8' encontrado en la posicion (aprox): " << std::distance(numeros.begin(), it_find) << std::endl;
    } else {
        std::cout << "  Elemento '8' no encontrado." << std::endl;
    }

    it_find = std::find(numeros.begin(), numeros.end(), 10);
    if (it_find == numeros.end()) {
        std::cout << "  Elemento '10' no encontrado (como se esperaba)." << std::endl;
    }

    // --- std::accumulate ---
    // Suma los elementos en un rango.
    int suma = std::accumulate(numeros.begin(), numeros.end(), 0); // 0 es el valor inicial
    std::cout << "  Suma de todos los elementos (std::accumulate): " << suma << std::endl;

    std::list<std::string> palabras = {"Hola", " ", "mundo", "!"};
    std::string frase_completa = std::accumulate(palabras.begin(), palabras.end(), std::string(""));
    std::cout << "  Concatenacion de palabras (std::accumulate): '" << frase_completa << "'" << std::endl;


    // --- std::for_each ---
    // Aplica una funcion (lambda) a cada elemento.
    std::cout << "  Aplicando funcion a cada elemento (std::for_each): ";
    std::for_each(numeros.begin(), numeros.end(), [](int n) {
        std::cout << n * 2 << " "; // Multiplica cada numero por 2 al imprimir
    });
    std::cout << std::endl;


    // --- std::copy ---
    // Copia elementos de un contenedor a otro (o a la salida).
    std::vector<int> numeros_copiados(numeros.size());
    std::copy(numeros.begin(), numeros.end(), numeros_copiados.begin());
    std::cout << "  Vector copiado (std::copy): ";
    for (int n : numeros_copiados) std::cout << n << " ";
    std::cout << std::endl;

    // Copiar a la salida estandar
    std::cout << "  Copiando a std::cout (std::copy con ostream_iterator): ";
    std::copy(numeros.begin(), numeros.end(), std::ostream_iterator<int>(std::cout, " | "));
    std::cout << std::endl;

    // --- std::count ---
    // Cuenta las ocurrencias de un valor.
    int count_dos = std::count(numeros.begin(), numeros.end(), 2);
    std::cout << "  El numero '2' aparece " << count_dos << " veces (std::count)." << std::endl;

    std::cout << "\nFin de la demostracion de algoritmos estandar." << std::endl;
    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 5,
    'tittle_level': 'STL (Standard Template Library)',
    'topic': 'Iteradores y Algoritmos',
    'subtopic': 'Uso eficiente de algoritmos con contenedores',
    'definition': '''
Usar los algoritmos de la STL es genial, pero usarlos de forma **eficiente** es aún mejor. La clave está en entender cómo interactúan los algoritmos con los diferentes tipos de contenedores y, más específicamente, con los **tipos de iteradores** que esos contenedores proporcionan. No todos los algoritmos son igual de eficientes con todos los contenedores.

¿Te estás preguntando por qué esto importa?

Imagina que tienes una caja de herramientas muy completa. Usar un algoritmo sin pensar en su eficiencia con el contenedor es como intentar clavar un clavo con una llave inglesa en lugar de un martillo: puede que funcione, pero va a ser más lento y tedioso. Elegir la combinación correcta de algoritmo y contenedor puede marcar una gran diferencia en el rendimiento de tu aplicación, especialmente con grandes volúmenes de datos.

Aquí algunas consideraciones para un uso eficiente:

1.  **Conoce los requisitos de los iteradores del algoritmo**: Cada algoritmo de la STL está diseñado para trabajar con un tipo mínimo de iterador.
    * **`std::sort`**: Requiere **iteradores de acceso aleatorio**. Por lo tanto, es muy eficiente con `std::vector` y `std::deque` (tiempo O(N log N)), pero **no se puede usar directamente** con `std::list` o `std::set`/`std::map` (estos tienen sus propias funciones `sort` o están ordenados por diseño). Si quieres ordenar una `std::list`, usa su método miembro `list::sort()`, que está optimizado para listas.
    * **Algoritmos de búsqueda (`std::find`, `std::count`)**: Funcionan con **iteradores de entrada**, así que son compatibles con cualquier contenedor. Sin embargo, para contenedores asociados (`std::set`, `std::map`, `std::unordered_set`, `std::unordered_map`), sus métodos miembros como `find()` o `count()` suelen ser **mucho más rápidos** (O(log N) o O(1) en promedio) que los algoritmos genéricos que tendrían que recorrer todo el contenedor (O(N)).
    * **Algoritmos de modificación (que reordenan o desplazan elementos)**: Ten cuidado con estos en `std::list` o `std::forward_list` porque modificar la estructura subyacente de la lista a través de un iterador no de acceso aleatorio puede ser costoso.

2.  **Aprovecha la localidad de la caché**:
    * Los contenedores como `std::vector` y `std::deque` almacenan sus elementos de forma más o menos contigua en memoria. Esto es excelente para el rendimiento porque aprovecha la **localidad de caché**. Cuando el procesador lee un elemento, es probable que los elementos cercanos también se carguen en la caché, haciendo que los accesos subsiguientes sean muy rápidos.
    * `std::list` y los contenedores basados en nodos (como `std::set`, `std::map`) almacenan elementos de forma dispersa. Acceder a un elemento en `std::list` puede implicar "saltar" a una nueva ubicación en memoria, lo que es más lento y genera más fallos de caché.

3.  **Preferir métodos miembros cuando existan**:
    * Muchos contenedores tienen métodos miembros que hacen lo mismo que algunos algoritmos globales (ej. `list::sort()`, `map::find()`, `vector::erase()`). Estos métodos miembros suelen estar **más optimizados** para la estructura interna de ese contenedor específico que los algoritmos genéricos. Siempre que exista un método miembro equivalente, úsalo.

4.  **Minimiza las operaciones de reasignación (para `vector` y `deque`)**:
    * Si sabes aproximadamente cuántos elementos va a contener tu `vector` o `deque`, usa `reserve()` al principio para preasignar memoria. Esto evita múltiples reasignaciones costosas que ocurren cuando el contenedor necesita más espacio.

5.  **Cuidado con `std::distance` o `std::advance` en iteradores lentos**:
    * Si necesitas mover un iterador de un `std::list` o `std::set` muchas posiciones, usar `std::advance` repetidamente o `std::distance` para calcular la distancia es una operación lineal (O(N)). Intenta evitar operaciones que requieran recorrer la lista para encontrar una posición si la eficiencia es crítica.

Al combinar un buen conocimiento de los tipos de iteradores con las características de rendimiento de los contenedores, y al preferir los métodos miembros optimizados, puedes escribir código C++ con la STL que no solo sea correcto, sino también excepcionalmente eficiente.
''',
    'code_example': r'''
#include <iostream>
#include <vector>
#include <list>
#include <set>
#include <map>
#include <unordered_map>
#include <algorithm> // Para std::sort, std::find, etc.
#include <chrono>    // Para medir tiempo
#include <numeric>   // Para std::iota (llenar con secuencia)

// Helper para medir tiempo
template<typename Func>
void medir_tiempo(const std::string& tarea, Func func) {
    auto start = std::chrono::high_resolution_clock::now();
    func();
    auto end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double, std::milli> duration = end - start;
    std::cout << "  " << tarea << ": " << duration.count() << " ms." << std::endl;
}

int main() {
    const int NUM_ELEMENTOS = 100000; // Un numero considerable para ver diferencias de rendimiento

    std::cout << "--- Uso Eficiente de Algoritmos con Contenedores ---" << std::endl;

    // --- Caso 1: Ordenar un Vector vs. una Lista ---
    std::vector<int> vec_sort(NUM_ELEMENTOS);
    std::iota(vec_sort.begin(), vec_sort.end(), 0); // Llenar con 0, 1, 2...
    std::random_shuffle(vec_sort.begin(), vec_sort.end()); // Desordenar

    std::list<int> list_sort(NUM_ELEMENTOS);
    std::iota(list_sort.begin(), list_sort.end(), 0);
    // std::random_shuffle no funciona directamente con list, requiere acceso aleatorio.
    // Para desordenar una lista, se podria copiar a vector, desordenar, y copiar de vuelta.
    // Simplificando: asumamos que la lista ya esta en algun orden para el ejemplo.

    std::cout << "\n--- Comparacion de Ordenamiento ---" << std::endl;
    medir_tiempo("std::sort en std::vector", [&]() {
        std::sort(vec_sort.begin(), vec_sort.end());
    });

    // std::sort no se puede usar directamente en std::list.
    // Necesitamos el metodo miembro list::sort().
    medir_tiempo("list::sort() en std::list", [&]() {
        list_sort.sort(); // Este es el metodo optimizado para list
    });
    std::cout << "  Nota: list::sort() esta optimizado para listas, std::sort no." << std::endl;


    // --- Caso 2: Busquedas en Contenedores Asociativos vs. Algoritmos Genericos ---
    std::vector<int> vec_find(NUM_ELEMENTOS);
    std::iota(vec_find.begin(), vec_find.end(), 0); // 0 a N-1
    int valor_a_buscar = NUM_ELEMENTOS / 2; // Un valor en el medio

    std::set<int> set_find;
    std::unordered_set<int> uset_find; // Para comparar hash
    for(int i = 0; i < NUM_ELEMENTOS; ++i) {
        set_find.insert(i);
        uset_find.insert(i);
    }

    std::cout << "\n--- Comparacion de Busqueda ---" << std::endl;
    medir_tiempo("std::find en std::vector (O(N))", [&]() {
        auto it = std::find(vec_find.begin(), vec_find.end(), valor_a_buscar);
    });

    medir_tiempo("set::find() en std::set (O(log N))", [&]() {
        auto it = set_find.find(valor_a_buscar);
    });

    medir_tiempo("unordered_set::find() en std::unordered_set (O(1) promedio)", [&]() {
        auto it = uset_find.find(valor_a_buscar);
    });
    std::cout << "  Observa como los metodos miembros de set/unordered_set son mucho mas rapidos." << std::endl;


    // --- Caso 3: Reserva de Memoria en Vector ---
    std::cout << "\n--- Comparacion con/sin std::vector::reserve ---" << std::endl;
    std::vector<int> vec_no_reserve;
    medir_tiempo("Vector - Push back 1M elementos (sin reserve)", [&]() {
        for (int i = 0; i < 1000000; ++i) {
            vec_no_reserve.push_back(i);
        }
    });

    std::vector<int> vec_with_reserve;
    medir_tiempo("Vector - Push back 1M elementos (con reserve)", [&]() {
        vec_with_reserve.reserve(1000000); // Pre-asigna memoria
        for (int i = 0; i < 1000000; ++i) {
            vec_with_reserve.push_back(i);
        }
    });
    std::cout << "  'reserve' reduce las reasignaciones y mejora el rendimiento para push_back." << std::endl;


    std::cout << "\nFin de la demostracion de uso eficiente." << std::endl;
    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 5,
    'tittle_level': 'STL (Standard Template Library)',
    'topic': 'Adaptadores y Funciones Lambda',
    'subtopic': 'stack, queue, priority_queue',
    'definition': '''
Además de los contenedores que almacenan datos directamente (como `vector` o `list`), la STL nos ofrece algo llamado **adaptadores de contenedor**. Estos no son contenedores nuevos en sí mismos, sino que "adaptan" la interfaz de un contenedor existente para que se comporte de una manera específica. Piensa en ellos como un envoltorio que le da una nueva "personalidad" a una caja ya conocida.

¿Te estás preguntando por qué esto importa?

A veces, no te interesa cómo se almacenan los datos internamente, sino cómo interactúas con ellos. Por ejemplo, en una fila de un supermercado, solo te importa que la primera persona que llega sea la primera en ser atendida. No te preocupan los detalles de cómo se forman la fila. Los adaptadores de contenedor te permiten enfocarte en ese comportamiento de alto nivel.

Aquí te presento los tres adaptadores de contenedor más comunes:

* **`std::stack` (Pila)**:
    * **Comportamiento**: Un `stack` implementa la lógica **LIFO (Last-In, First-Out)**, que significa "el último en entrar es el primero en salir". Es como una pila de platos: solo puedes añadir o quitar platos de la parte superior.
    * **Operaciones principales**: `push()` (añadir al tope), `pop()` (quitar del tope), `top()` (ver el elemento del tope).
    * **Contenedor subyacente por defecto**: `std::deque`. También puedes usar `std::vector` o `std::list`.
    * **Caso de uso**: Deshacer acciones en un editor de texto, historial de navegación web, evaluación de expresiones matemáticas (notación polaca inversa), manejo de llamadas a funciones en la memoria (la famosa "pila de llamadas").

* **`std::queue` (Cola)**:
    * **Comportamiento**: Una `queue` implementa la lógica **FIFO (First-In, First-Out)**, que significa "el primero en entrar es el primero en salir". Es como una fila de personas esperando.
    * **Operaciones principales**: `push()` (añadir al final), `pop()` (quitar del principio), `front()` (ver el elemento del principio), `back()` (ver el elemento del final).
    * **Contenedor subyacente por defecto**: `std::deque`. También puedes usar `std::list`.
    * **Caso de uso**: Simulación de líneas de espera, manejo de tareas en un sistema operativo, procesamiento de eventos en el orden en que ocurrieron.

* **`std::priority_queue` (Cola de Prioridad)**:
    * **Comportamiento**: A diferencia de la `queue` normal, en una cola de prioridad, el elemento "más alto" (según un criterio de ordenamiento, por defecto el más grande) siempre es el primero en ser recuperado. No es estrictamente FIFO; la prioridad manda.
    * **Operaciones principales**: `push()` (añadir un elemento), `pop()` (quitar el elemento de mayor prioridad), `top()` (ver el elemento de mayor prioridad).
    * **Contenedor subyacente por defecto**: `std::vector`. No puedes usar `std::list` directamente con `priority_queue`.
    * **Caso de uso**: Planificación de tareas en un sistema operativo (la tarea de mayor prioridad se ejecuta primero), algoritmos de búsqueda como Dijkstra o Prim, sistemas de simulación donde los eventos se procesan por su urgencia.

Estos adaptadores son fantásticos porque te permiten usar estructuras de datos complejas sin tener que preocuparte por cómo están implementadas internamente. Solo necesitas entender su comportamiento.
''',
    'code_example': r'''
#include <iostream>
#include <stack>          // Para std::stack
#include <queue>          // Para std::queue y std::priority_queue
#include <vector>         // Contenedor subyacente comun
#include <list>           // Contenedor subyacente opcional
#include <string>
#include <functional>     // Para std::greater (custom comparator para priority_queue)

int main() {
    std::cout << "--- Demostrando Adaptadores de Contenedores ---" << std::endl;

    // --- std::stack (LIFO) ---
    std::cout << "\n--- std::stack (Pila - LIFO) ---" << std::endl;
    std::stack<std::string> historial_navegacion;

    historial_navegacion.push("google.com");
    historial_navegacion.push("stackoverflow.com");
    historial_navegacion.push("cppreference.com");

    std::cout << "  Pagina actual (tope): " << historial_navegacion.top() << std::endl;
    historial_navegacion.pop(); // Volver a la pagina anterior
    std::cout << "  Volviendo, nueva pagina actual: " << historial_navegacion.top() << std::endl;

    historial_navegacion.push("myblog.dev"); // Navegar a otra pagina
    std::cout << "  Navegando a myblog.dev, nueva pagina actual: " << historial_navegacion.top() << std::endl;

    while (!historial_navegacion.empty()) {
        std::cout << "  Desapilando: " << historial_navegacion.top() << std::endl;
        historial_navegacion.pop();
    }


    // --- std::queue (FIFO) ---
    std::cout << "\n--- std::queue (Cola - FIFO) ---" << std::endl;
    std::queue<int> clientes_espera;

    clientes_espera.push(101); // Cliente 101 llega
    clientes_espera.push(102); // Cliente 102 llega
    clientes_espera.push(103); // Cliente 103 llega

    std::cout << "  Primer cliente en la fila: " << clientes_espera.front() << std::endl;
    clientes_espera.pop(); // Cliente 101 es atendido
    std::cout << "  Siguiente cliente en la fila: " << clientes_espera.front() << std::endl;

    clientes_espera.push(104); // Cliente 104 llega
    std::cout << "  Ultimo cliente en la fila: " << clientes_espera.back() << std::endl;

    while (!clientes_espera.empty()) {
        std::cout << "  Atendiendo cliente: " << clientes_espera.front() << std::endl;
        clientes_espera.pop();
    }


    // --- std::priority_queue ---
    std::cout << "\n--- std::priority_queue (Cola de Prioridad) ---" << std::endl;
    // Por defecto, es una cola de maxima prioridad (el numero mas grande es el top)
    std::priority_queue<int> tareas_urgentes;

    tareas_urgentes.push(30); // Tarea con prioridad 30
    tareas_urgentes.push(10); // Tarea con prioridad 10
    tareas_urgentes.push(50); // Tarea con prioridad 50
    tareas_urgentes.push(20); // Tarea con prioridad 20

    std::cout << "  Tarea de mayor prioridad: " << tareas_urgentes.top() << std::endl; // Debería ser 50
    tareas_urgentes.pop();
    std::cout << "  Siguiente tarea de mayor prioridad: " << tareas_urgentes.top() << std::endl; // Debería ser 30

    // Cola de prioridad con el elemento mas pequeño como top (min-heap)
    // Se usa std::greater<int> como comparador
    std::priority_queue<int, std::vector<int>, std::greater<int>> tareas_minima_prioridad;
    tareas_minima_prioridad.push(30);
    tareas_minima_prioridad.push(10);
    tareas_minima_prioridad.push(50);
    tareas_minima_prioridad.push(20);
    std::cout << "  Tarea de minima prioridad (con std::greater): " << tareas_minima_prioridad.top() << std::endl; // Debería ser 10

    while (!tareas_minima_prioridad.empty()) {
        std::cout << "  Procesando tarea (min): " << tareas_minima_prioridad.top() << std::endl;
        tareas_minima_prioridad.pop();
    }

    std::cout << "\nFin de la demostracion de adaptadores de contenedores." << std::endl;

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 5,
    'tittle_level': 'STL (Standard Template Library)',
    'topic': 'Adaptadores y Funciones Lambda',
    'subtopic': 'Funciones lambda y su integración con STL',
    'definition': '''
Las **funciones lambda** (o simplemente "lambdas") son una de las características más potentes y convenientes que llegaron a C++11. Piensa en ellas como pequeñas funciones anónimas (sin nombre) que puedes definir directamente en el lugar donde las necesitas. Son perfectas para escribir código conciso y para operaciones que solo se usan una vez.

¿Te estás preguntando por qué esto importa?

Antes de las lambdas, si necesitabas pasar una función a un algoritmo de la STL (como `std::sort` para un orden personalizado, o `std::for_each`), tenías que escribir una función separada o una clase con `operator()`. Esto podía ser engorroso y llenaba tu código de pequeñas funciones que solo se usaban una vez. Las lambdas simplifican esto enormemente, permitiéndote escribir la lógica de la función *justo donde la usas*.

La sintaxis básica de una función lambda es `[captura](parametros) -> tipo_retorno { cuerpo }`.

* **`[captura]`**: Esto es crucial. Define qué variables del ámbito circundante puede "ver" y usar la lambda. Más sobre esto en el siguiente subtema.
* **`(parametros)`**: La lista de parámetros que recibe la lambda, igual que una función normal.
* **`-> tipo_retorno` (opcional)**: El tipo de retorno de la lambda. Si el cuerpo de la lambda es simple y el compilador puede deducir el tipo de retorno, esto es opcional.
* **`{ cuerpo }`**: El código que ejecuta la lambda.

**Integración con STL**:
La verdadera magia de las lambdas se ve cuando las usas con los **algoritmos de la STL**. Muchos algoritmos aceptan un "predicado" o una "función de operación", que es precisamente el rol que las lambdas pueden llenar de forma elegante.

* **Personalizar algoritmos**: Puedes ordenar un `vector` de objetos complejos por un criterio específico, filtrar elementos, o transformar una colección, todo en línea sin necesidad de definir funciones auxiliares en otro lugar.
* **Menos código, más legibilidad**: Al mantener la lógica cerca de donde se usa, el código se vuelve más fácil de leer y entender, ya que no tienes que saltar a otra parte del archivo para ver qué hace esa función auxiliar.
* **Mayor eficiencia**: Aunque los compiladores son muy inteligentes con las funciones normales, las lambdas a menudo pueden optimizarse aún más porque el compilador tiene todo el contexto de su uso.

En resumen, las lambdas son una herramienta indispensable en C++ moderno. Te permiten escribir código más flexible, legible y potente, especialmente cuando trabajas con la vasta colección de algoritmos de la Standard Template Library.
''',
    'code_example': r'''
#include <iostream>
#include <vector>
#include <string>
#include <algorithm> // Para std::sort, std::for_each, std::find_if, std::count_if

struct Persona {
    std::string nombre;
    int edad;
};

int main() {
    std::cout << "--- Demostrando Funciones Lambda y STL ---" << std::endl;

    std::vector<int> numeros = {5, 2, 8, 1, 9, 4, 7, 3, 6};
    std::cout << "\nVector original: ";
    for (int n : numeros) std::cout << n << " ";
    std::cout << std::endl;

    // --- 1. Usando lambda con std::sort para ordenar en orden descendente ---
    // La lambda es el tercer argumento, un "comparador" personalizado.
    std::sort(numeros.begin(), numeros.end(), [](int a, int b) {
        return a > b; // Ordena de mayor a menor
    });
    std::cout << "  Vector ordenado descendente (lambda): ";
    for (int n : numeros) std::cout << n << " ";
    std::cout << std::endl;

    // --- 2. Usando lambda con std::for_each para imprimir elementos ---
    std::cout << "  Imprimiendo con std::for_each y lambda: ";
    std::for_each(numeros.begin(), numeros.end(), [](int n) {
        std::cout << n << "* " << n * 2 << " | ";
    });
    std::cout << std::endl;

    // --- 3. Usando lambda con std::find_if para buscar un elemento con condicion ---
    // Buscar el primer número par
    auto it_par = std::find_if(numeros.begin(), numeros.end(), [](int n) {
        return n % 2 == 0; // Condicion: el numero es par
    });
    if (it_par != numeros.end()) {
        std::cout << "  Primer numero par encontrado: " << *it_par << std::endl;
    } else {
        std::cout << "  No se encontraron numeros pares." << std::endl;
    }

    // --- 4. Usando lambda con std::count_if para contar elementos con condicion ---
    // Contar cuántos números son mayores que 5
    int count_gt_5 = std::count_if(numeros.begin(), numeros.end(), [](int n) {
        return n > 5;
    });
    std::cout << "  Numeros mayores que 5: " << count_gt_5 << std::endl;


    // --- 5. Lambda para ordenar objetos complejos ---
    std::vector<Persona> gente = {
        {"Carlos", 30},
        {"Ana", 25},
        {"Beto", 35}
    };
    std::cout << "\nPersonas original:" << std::endl;
    for(const auto& p : gente) std::cout << "  " << p.nombre << " (" << p.edad << ")" << std::endl;

    // Ordenar personas por edad
    std::sort(gente.begin(), gente.end(), [](const Persona& p1, const Persona& p2) {
        return p1.edad < p2.edad; // Ordena por edad ascendente
    });
    std::cout << "  Personas ordenadas por edad (lambda):" << std::endl;
    for(const auto& p : gente) std::cout << "  " << p.nombre << " (" << p.edad << ")" << std::endl;

    std::cout << "\nFin de la demostracion de lambdas con STL." << std::endl;
    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 5,
    'tittle_level': 'STL (Standard Template Library)',
    'topic': 'Adaptadores y Funciones Lambda',
    'subtopic': 'Captura de variables y closures',
    'definition': '''
El poder de las funciones lambda no se detiene en su capacidad de ser funciones anónimas; lo que realmente las eleva a otro nivel es su habilidad para **capturar variables** del ámbito en el que fueron definidas. Esto es lo que forma un **closure**: la combinación de la función lambda y el entorno (las variables capturadas) donde fue creada.

¿Te estás preguntando por qué esto importa?

Pensemos por un momento en un escenario. Si tuvieras que escribir una función normal para, digamos, filtrar números mayores que un cierto umbral, ese umbral tendría que ser un parámetro de la función. Pero con las lambdas, ese umbral puede ser una variable local que la lambda "captura" de su entorno, haciendo el código más conciso y expresivo. Es como si la pequeña función lambda pudiera "recordar" cosas del lugar donde nació.

La sección de **captura** de una lambda es lo que va entre los corchetes `[]` y es fundamental para los closures. Aquí las opciones más comunes:

* **`[]` (Captura vacía)**: La lambda no puede acceder a ninguna variable del ámbito circundante. Es una función puramente autocontenida.
* **`[variable]` (Captura por valor)**: La lambda hace una **copia** de la `variable` cuando se crea. Cualquier cambio posterior a la `variable` original no afectará la copia dentro de la lambda. Es como pasar la variable por valor a una función normal.
* **`[&variable]` (Captura por referencia)**: La lambda tiene un **referencia** a la `variable`. Los cambios en la `variable` original se reflejarán dentro de la lambda, y viceversa si la lambda la modifica. Es como pasar la variable por referencia.
* **`[this]` (Captura el puntero `this`)**: Permite a la lambda acceder a los miembros de la clase si la lambda se define dentro de un método miembro.
* **`[=]` (Captura implícita por valor)**: Captura **todas las variables** usadas en el cuerpo de la lambda por **valor**. Conveniente, pero puede ser menos eficiente si se capturan muchas variables innecesarias.
* **`[&]` (Captura implícita por referencia)**: Captura **todas las variables** usadas en el cuerpo de la lambda por **referencia**. Útil, pero ten cuidado con los problemas de *lifetime* (vida útil) de las variables, ya que si la lambda sobrevive a la variable original, tendrás una referencia colgante.

**Consideraciones importantes sobre la captura**:

* **Vida útil (Lifetime)**: Si capturas por referencia (`[&]`) y la lambda se usa más allá del ámbito de la variable original (por ejemplo, si la guardas en un `std::function` que se llama más tarde), la referencia se volverá "colgante" y apuntará a memoria inválida. Esto es un error común y peligroso. Para estos casos, la captura por valor (`[=]`) o la captura explícita de variables por valor (`[variable]`) es más segura.
* **Modificación de variables capturadas por valor**: Por defecto, las variables capturadas por valor son `const` dentro de la lambda. Para poder modificarlas, debes declarar la lambda como `mutable`: `[variable](parametros) mutable { /* modifica variable */ }`.

Las capturas y los closures hacen que las lambdas sean increíblemente flexibles y poderosas para trabajar con algoritmos STL, permitiéndote adaptar el comportamiento de los algoritmos de formas muy dinámicas y concisas.
''',
    'code_example': r'''
#include <iostream>
#include <vector>
#include <string>
#include <algorithm> // Para std::for_each, std::remove_if, std::transform
#include <functional> // Para std::function (si quieres almacenar lambdas)

int main() {
    std::cout << "--- Demostrando Captura de Variables y Closures ---" << std::endl;

    std::vector<int> numeros = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    int limite = 5; // Variable local que sera capturada

    std::cout << "\nVector original: ";
    for (int n : numeros) std::cout << n << " ";
    std::cout << std::endl;

    // --- 1. Captura por valor ([limite]) ---
    // La lambda hace una copia de 'limite' en el momento de su creacion.
    std::cout << "  Numeros mayores que " << limite << " (captura por valor):" << std::endl;
    std::for_each(numeros.begin(), numeros.end(), [limite](int n) {
        if (n > limite) { // 'limite' es la copia, no el original
            std::cout << "    " << n << std::endl;
        }
    });

    limite = 7; // Modificamos la variable original 'limite'
    std::cout << "  (Despues de cambiar 'limite' a 7)" << std::endl;
    std::cout << "  Numeros mayores que " << limite << " (captura por valor ANTERIOR):" << std::endl;
    std::for_each(numeros.begin(), numeros.end(), [captura_limite = limite](int n) {
        // Otra forma de captura por valor: renombrar la variable capturada si quieres
        // usar el valor actualizado despues de la modificacion de 'limite'
        if (n > captura_limite) { // 'captura_limite' es la copia de 7
            std::cout << "    " << n << std::endl;
        }
    });
    // Observa que la primera lambda sigue usando el 'limite' original (5),
    // mientras que la segunda lambda usa el 'limite' de 7 (si la definimos despues).

    // --- 2. Captura por referencia ([&limite]) ---
    // La lambda usa una referencia a 'limite'. Cualquier cambio en 'limite' afecta la lambda.
    std::cout << "\n  Numeros menores que " << limite << " (captura por referencia):" << std::endl;
    // Capturamos 'limite' por referencia. Ahora 'limite' es 7
    std::for_each(numeros.begin(), numeros.end(), [&](int n) {
        if (n < limite) { // 'limite' es la referencia al original (7)
            std::cout << "    " << n << std::endl;
        }
    });

    // --- 3. Captura por valor implicita ([=]) ---
    std::cout << "\n  Elementos multiplicados por 'factor' (captura implicita por valor):" << std::endl;
    int factor = 10;
    std::transform(numeros.begin(), numeros.end(), numeros.begin(), [=](int n) {
        return n * factor; // 'factor' se captura por valor
    });
    std::cout << "  Vector transformado: ";
    for (int n : numeros) std::cout << n << " ";
    std::cout << std::endl;
    factor = 20; // Esto no afecta la lambda ya usada.

    // --- 4. Captura mutable (para modificar una copia capturada por valor) ---
    std::cout << "\n  Contador en lambda (captura por valor + mutable):" << std::endl;
    int contador_global = 0;
    // Captura contador_global por valor. 'mutable' permite modificar la copia.
    auto incrementar_e_imprimir = [contador = 0](int n) mutable { // Renombramos 'contador_global' a 'contador'
        contador++;
        std::cout << "    Dentro de lambda, contador: " << contador << ", n: " << n << std::endl;
    };
    std::for_each(numeros.begin(), numeros.end(), incrementar_e_imprimir);
    std::cout << "  Valor final de contador_global (original): " << contador_global << std::endl; // Sigue siendo 0
    // La copia 'contador' dentro de la lambda fue modificada, no el 'contador_global' original.


    // --- 5. Peligro de captura por referencia con vida util (lifetime) ---
    std::function<void()> mi_lambda;
    { // Nuevo ambito para la variable local
        std::string mensaje = "Hola desde el ambito local.";
        // Captura 'mensaje' por referencia.
        // PELIGRO: 'mensaje' dejara de existir cuando salgamos de este bloque.
        mi_lambda = [&]() {
            std::cout << "  [PELIGRO] Intentando usar mensaje: " << mensaje << std::endl;
        };
    } // 'mensaje' es destruida aqui

    std::cout << "\n--- Probando lambda con referencia colgante (DANGER!) ---" << std::endl;
    // mi_lambda(); // ¡Al llamar esto, estamos accediendo a memoria invalida!
                  // Esto puede causar un fallo del programa o comportamiento indefinido.
    std::cout << "  (Comentado para evitar crash, pero el peligro es real)." << std::endl;

    std::cout << "\nFin de la demostracion de captura y closures." << std::endl;
    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 5,
    'tittle_level': 'STL (Standard Template Library)',
    'topic': 'Funciones y Objetos Funcionales',
    'subtopic': 'std::function, std::bind',
    'definition': '''
En C++, las **funciones** y los **objetos funcionales** son elementos clave para una programación más flexible y modular. Aunque una función simple es algo que ya conoces, en C++ tenemos herramientas avanzadas como `std::function` y `std::bind` que nos permiten tratar las funciones como "ciudadanos de primera clase", es decir, pasarlas como argumentos, almacenarlas en variables o devolverlas como resultados.

¿Te estás preguntando por qué esto importa?

Imagina que estás construyendo una casa. En lugar de tener una sola herramienta que haga todo (un martillo que también corte madera y apriete tornillos), tienes herramientas especializadas y un "adaptador universal" que te permite usar cualquier herramienta de diferentes maneras. `std::function` y `std::bind` son ese "adaptador universal" para las funciones. Te permiten escribir código más genérico y configurable, donde el comportamiento puede cambiarse fácilmente.

* **`std::function`**:
    * **¿Qué es?**: Es un **contenedor de propósito general para cualquier cosa que pueda ser invocada**. Puede almacenar punteros a funciones, objetos funcionales (functors), lambdas y punteros a métodos miembros.
    * **Sintaxis**: `std::function<tipo_retorno(parametros...)> nombre_variable;`
    * **Caso de uso**: Cuando necesitas una forma polimórfica de almacenar o pasar una función. Por ejemplo, en *callbacks*, *event handlers*, o cuando quieres que una clase pueda ejecutar diferentes acciones según la configuración. Es como una "interfaz" para cualquier callable.
    * **Ventajas**:
        * **Homogeneiza las llamadas**: No importa si lo que invocas es una lambda, un functor o un puntero a función; la sintaxis de llamada es siempre la misma.
        * **Almacenamiento**: Puedes guardar funciones en contenedores de la STL (ej. `std::vector<std::function<void()>>`).

* **`std::bind`**:
    * **¿Qué es?**: Es una utilidad que te permite **adaptar o "atar" argumentos** a una función o a un objeto invocable. Puedes reordenar argumentos, dejar algunos sin especificar (usando `std::placeholders`), o atar valores específicos a ciertos parámetros.
    * **Sintaxis**: `auto nueva_funcion = std::bind(funcion_original, arg1, arg2, ...);`
    * **Placeholders**: `std::placeholders::_1`, `std::placeholders::_2`, etc., representan los argumentos que se pasarán a la `nueva_funcion` cuando sea invocada.
    * **Caso de uso**: Cuando necesitas crear una nueva función a partir de una existente fijando algunos de sus argumentos, o reordenándolos. Es útil para adaptar funciones que no encajan directamente con la signatura requerida por un algoritmo o un callback.
    * **Ventajas**:
        * **Currying/Partial Application**: Permite crear funciones especializadas a partir de funciones más generales.
        * **Adaptación de signaturas**: Ajusta funciones con muchas variables para que encajen en interfaces que esperan menos argumentos.
        * **Métodos miembros**: Es la forma común de atar un método miembro a un objeto específico para pasarlo como un callable.

Aunque las **lambdas** han reducido el uso de `std::bind` en muchos escenarios (ya que las lambdas son a menudo más legibles para la captura de variables), `std::bind` sigue siendo útil para casos más complejos de reordenación de argumentos o cuando trabajas con funciones existentes de librerías de C.
''',
    'code_example': r'''
#include <iostream>
#include <functional> // Para std::function, std::bind, std::placeholders
#include <vector>
#include <algorithm>  // Para std::for_each
#include <string>

// Una funcion global simple
void saludar(const std::string& nombre) {
    std::cout << "  Hola, " << nombre << "!" << std::endl;
}

// Una funcion con multiples argumentos
void operar(int a, int b, const std::string& op) {
    if (op == "+") {
        std::cout << "  " << a << " + " << b << " = " << (a + b) << std::endl;
    } else if (op == "*") {
        std::cout << "  " << a << " * " << b << " = " << (a * b) << std::endl;
    } else {
        std::cout << "  Operacion desconocida: " << op << std::endl;
    }
}

// Una clase con un metodo miembro
class Calculadora {
public:
    void sumar(int a, int b) const {
        std::cout << "  Calculadora::sumar: " << a << " + " << b << " = " << (a + b) << std::endl;
    }
    int multiplicar(int a, int b) const {
        return a * b;
    }
};

int main() {
    std::cout << "--- Demostrando std::function y std::bind ---" << std::endl;

    // --- 1. Uso de std::function ---
    std::cout << "\n--- std::function ---" << std::endl;

    // a) Almacenar un puntero a funcion global
    std::function<void(const std::string&)> f1 = &saludar;
    f1("Alice");

    // b) Almacenar una lambda
    std::function<void(int)> f2 = [](int num) {
        std::cout << "  El numero es: " << num << std::endl;
    };
    f2(42);

    // c) Almacenar el metodo miembro de un objeto (usando std::bind)
    Calculadora calc;
    // std::bind se usa aqui para atar el metodo 'sumar' al objeto 'calc'
    // y para especificar los dos argumentos _1 y _2 que se pasaran despues.
    std::function<void(int, int)> f3 = std::bind(&Calculadora::sumar, &calc, std::placeholders::_1, std::placeholders::_2);
    f3(10, 20);

    // d) Almacenar el resultado de std::bind directamente
    auto f4 = std::bind(&Calculadora::multiplicar, &calc, 5, 6);
    std::cout << "  Resultado de multiplicar (bind directamente): " << f4() << std::endl;


    // --- 2. Uso de std::bind ---
    std::cout << "\n--- std::bind ---" << std::endl;

    // a) Fijar un argumento de una funcion global
    // Crea una nueva funcion 'saludar_bob' que siempre saluda a "Bob"
    auto saludar_bob = std::bind(&saludar, "Bob");
    saludar_bob(); // Llama a saludar("Bob")

    // b) Reordenar argumentos
    // La funcion 'operar' toma (a, b, op). Queremos una funcion que tome (op, a, b).
    using namespace std::placeholders; // Para usar _1, _2, _3

    auto operar_reordenado = std::bind(&operar, _2, _3, _1);
    operar_reordenado("*", 5, 4); // Esto llamara a operar(4, 5, "*")
    operar_reordenado("+", 10, 20); // Esto llamara a operar(20, 10, "+")

    // c) Atar argumentos parciales (currying)
    // Crear una funcion 'sumar_con_5' que siempre suma 5 al segundo argumento
    auto sumar_con_5 = std::bind(&operar, _1, 5, "+");
    sumar_con_5(10); // Llama a operar(10, 5, "+")

    // d) Atar un metodo miembro a un objeto y fijar un argumento
    auto calc_mult_por_10 = std::bind(&Calculadora::multiplicar, &calc, _1, 10);
    std::cout << "  Multiplicar 7 por 10 (con bind de metodo): " << calc_mult_por_10(7) << std::endl;


    // --- Integracion con algoritmos STL (std::bind y lambdas) ---
    std::cout << "\n--- Integracion con STL ---" << std::endl;
    std::vector<int> nums = {1, 2, 3, 4, 5};

    // Usando std::for_each con una lambda (mas comun y legible hoy en dia)
    std::cout << "  Vector original (for_each con lambda): ";
    std::for_each(nums.begin(), nums.end(), [](int n){
        std::cout << n << " ";
    });
    std::cout << std::endl;

    // Equivalente con std::bind (a veces mas verboso para casos simples)
    std::cout << "  Vector original (for_each con bind y funcion): ";
    std::function<void(int)> print_num = [](int n){ std::cout << n << " "; };
    std::for_each(nums.begin(), nums.end(), std::bind(print_num, _1));
    std::cout << std::endl;

    // Ejemplo de uso de std::bind para adaptar una funcion a un algoritmo
    // Supongamos que queremos multiplicar cada elemento por 2 y sumarle 1
    // y solo tenemos una funcion 'operar' que multiplica
    auto multiplicar_por_dos = std::bind(&Calculadora::multiplicar, &calc, _1, 2);
    std::vector<int> resultados(nums.size());
    std::transform(nums.begin(), nums.end(), resultados.begin(), multiplicar_por_dos);
    std::cout << "  Vector multiplicado por 2 (transform con bind): ";
    for (int n : resultados) std::cout << n << " ";
    std::cout << std::endl;


    std::cout << "\nFin de la demostracion." << std::endl;
    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 5,
    'tittle_level': 'STL (Standard Template Library)',
    'topic': 'Funciones y Objetos Funcionales',
    'subtopic': 'Predicados y funciones como objetos',
    'definition': '''
En la STL, muchos algoritmos esperan recibir una "función" que define un cierto comportamiento o una condición. Estas funciones que actúan como "test" o "criterio" son a menudo llamadas **predicados**. Cuando hablamos de "funciones como objetos" o **functors**, nos referimos a la capacidad de crear instancias de clases que se comportan como funciones.

¿Te estás preguntando por qué esto importa?

Esto es crucial porque permite una gran flexibilidad y personalización de los algoritmos de la STL. En lugar de tener un algoritmo `sort` que solo ordena de una forma, puedes pasarle un "objeto función" que le dice *cómo* ordenar. Es como darle al algoritmo un conjunto de instrucciones personalizadas para cada tarea.

### Predicados

Un **predicado** es cualquier función o callable que toma uno o más argumentos y devuelve un valor booleano (`true` o `false`). Se usan comúnmente en algoritmos para filtrar, buscar o comparar.

* **Tipos de predicados**:
    * **Unarios**: Toman un solo argumento y devuelven `bool`.
        * Ejemplo: `std::find_if` usa un predicado unario para encontrar el primer elemento que satisface una condición.
    * **Binarios**: Toman dos argumentos y devuelven `bool`.
        * Ejemplo: `std::sort` usa un predicado binario para comparar dos elementos y decidir su orden.

* **Implementación de predicados**:
    * **Funciones normales**: Una función `bool es_par(int n) { return n % 2 == 0; }`.
    * **Lambdas**: La forma más común y flexible hoy en día. `[](int n){ return n % 2 == 0; }`.
    * **Functors (Objetos Funcionales)**: Instancias de clases que sobrecargan el `operator()`.

### Funciones como Objetos (Functors)

Un **functor** (del inglés "function object") es una instancia de una clase que tiene sobrecargado el **operador de llamada a función (`operator()`)**. Esto hace que los objetos de esa clase puedan ser "llamados" como si fueran funciones.

* **Ventajas de los Functors**:
    * **Estado**: A diferencia de las funciones normales (que no tienen estado), un functor puede mantener un estado interno (variables miembro). Esto significa que puede recordar información entre llamadas. Por ejemplo, un functor para contar elementos que cumplen una condición.
    * **Flexibilidad**: Puedes tener múltiples instancias de un functor, cada una con su propio estado.
    * **Optimización**: A menudo, los compiladores pueden optimizar las llamadas a functors (especialmente si no tienen estado complejo) de manera similar a cómo lo hacen con las lambdas, lo que se conoce como "inlining".

**Caso de uso de Functors**:

* **Criterios de ordenamiento complejos**: Cuando el criterio de ordenamiento no es fijo, sino que depende de algún valor o estado.
* **Contadores/Acumuladores condicionales**: Functors que cuentan elementos basándose en un criterio y mantienen un recuento.
* **Generadores**: Functors que generan una secuencia de valores (ej. números aleatorios).

Con la llegada de las lambdas, el uso de functors definidos explícitamente ha disminuido, ya que las lambdas pueden capturar estado y en muchos casos son más concisas. Sin embargo, los functors siguen siendo una parte importante del paradigma de programación funcional en C++ y son la base de muchas de las funciones de la STL que existían antes de C++11 (como `std::less<T>`, `std::plus<T>`, etc.). Comprenderlos te da una visión más profunda de cómo la STL logra su flexibilidad.
''',
    'code_example': r'''
#include <iostream>
#include <vector>
#include <string>
#include <algorithm> // Para std::sort, std::find_if, std::for_each
#include <numeric>   // Para std::accumulate (con functor)

// --- 1. Predicado Binario (como funcion normal) para std::sort ---
bool compararPorLongitud(const std::string& a, const std::string& b) {
    return a.length() < b.length();
}

// --- 2. Predicado Unario (como functor) para std::find_if ---
class EsMayorQue {
private:
    int limite;
public:
    // Constructor para inicializar el estado del functor
    EsMayorQue(int l) : limite(l) {}
    // Sobrecarga del operador de llamada a funcion
    bool operator()(int n) const {
        return n > limite;
    }
};

// --- 3. Functor para acumular (contar ocurrencias) ---
class ContadorDePares {
private:
    int count;
public:
    ContadorDePares() : count(0) {}
    // Este functor modifica su estado interno, por lo tanto, el operator() no es const.
    void operator()(int n) {
        if (n % 2 == 0) {
            count++;
        }
    }
    int obtener_cuenta() const { return count; }
};

int main() {
    std::cout << "--- Demostrando Predicados y Funciones como Objetos ---" << std::endl;

    // --- Usando Predicados (funciones y lambdas) ---
    std::vector<std::string> palabras = {"manzana", "banana", "kiwi", "pera", "uva", "durazno"};
    std::cout << "\nPalabras originales: ";
    for (const auto& p : palabras) std::cout << p << " ";
    std::cout << std::endl;

    // a) Predicado binario (funcion normal) con std::sort
    std::sort(palabras.begin(), palabras.end(), compararPorLongitud);
    std::cout << "  Ordenado por longitud (funcion normal): ";
    for (const auto& p : palabras) std::cout << p << " ";
    std::cout << std::endl;

    // b) Predicado binario (lambda) con std::sort
    std::sort(palabras.begin(), palabras.end(), [](const std::string& a, const std::string& b) {
        return a.length() > b.length(); // Ahora orden descendente por longitud
    });
    std::cout << "  Ordenado descendente por longitud (lambda): ";
    for (const auto& p : palabras) std::cout << p << " ";
    std::cout << std::endl;

    // --- Usando Functors (Funciones como Objetos) ---
    std::vector<int> numeros = {10, 2, 8, 15, 3, 20, 7};
    std::cout << "\nNumeros originales: ";
    for (int n : numeros) std::cout << n << " ";
    std::cout << std::endl;

    // c) Predicado unario (functor) con std::find_if
    EsMayorQue mayor_que_12(12); // Creamos una instancia del functor con limite = 12
    auto it = std::find_if(numeros.begin(), numeros.end(), mayor_que_12);
    if (it != numeros.end()) {
        std::cout << "  Primer numero mayor que 12 (functor): " << *it << std::endl;
    } else {
        std::cout << "  No se encontro numero mayor que 12." << std::endl;
    }

    // Usando otra instancia del mismo functor con un limite diferente
    EsMayorQue mayor_que_5(5);
    it = std::find_if(numeros.begin(), numeros.end(), mayor_que_5);
    if (it != numeros.end()) {
        std::cout << "  Primer numero mayor que 5 (otra instancia functor): " << *it << std::endl;
    }


    // d) Functor para mantener estado con std::for_each
    ContadorDePares contador; // Creamos una instancia del functor
    std::for_each(numeros.begin(), numeros.end(), std::ref(contador)); // Pasamos por referencia para que se modifique el original
    std::cout << "  Cantidad de numeros pares (functor con estado): " << contador.obtener_cuenta() << std::endl;


    // --- Comparacion: Functor con estado vs. Lambda con captura mutable ---
    // El mismo ejemplo de ContadorDePares, pero con lambda
    std::cout << "\n--- Comparacion: Functor con estado vs. Lambda con captura mutable ---" << std::endl;
    int contador_lambda = 0;
    std::for_each(numeros.begin(), numeros.end(), [&](int n) mutable { // 'mutable' es clave
        if (n % 2 == 0) {
            contador_lambda++; // Modificamos la variable capturada por referencia
        }
    });
    std::cout << "  Cantidad de numeros pares (lambda con captura por ref): " << contador_lambda << std::endl;

    // Si la lambda captura por valor y es mutable:
    // int contador_lambda_val = 0;
    // auto lambda_con_estado = [conteo = 0](int n) mutable {
    //     if (n % 2 == 0) {
    //         conteo++;
    //     }
    //     std::cout << "  (interno lambda) conteo: " << conteo << std::endl;
    // };
    // std::for_each(numeros.begin(), numeros.end(), lambda_con_estado);
    // std::cout << "  Cantidad de numeros pares (lambda con captura por valor y mutable): " << lambda_con_estado.conteo << std::endl; // Error: 'conteo' no es accesible
    // Para acceder al estado de una lambda capturada por valor y mutable, necesitas almacenarla
    // en una std::function o una variable y luego acceder a su miembro.
    // Esto demuestra que el functor tradicional puede ser más explícito para el estado persistente.


    std::cout << "\nFin de la demostracion." << std::endl;
    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 5,
    'tittle_level': 'STL (Standard Template Library)',
    'topic': 'Funciones y Objetos Funcionales',
    'subtopic': 'Flexibilidad en la programación funcional',
    'definition': '''
La combinación de **`std::function`**, **`std::bind`**, **lambdas** y **functors** dota a C++ de una inmensa **flexibilidad en la programación funcional**. Este paradigma, que trata las funciones como valores (como datos), permite escribir código más conciso, expresivo y modular, lo que facilita el diseño de sistemas complejos.

¿Te estás preguntando por qué esto importa?

La flexibilidad es clave en el desarrollo de software. Nos permite adaptar nuestro código a nuevos requisitos sin tener que reescribirlo por completo. Cuando puedes pasar diferentes "comportamientos" (funciones) como argumentos a otras funciones o clases, estás construyendo un sistema donde las partes pueden configurarse dinámicamente. Es como tener un robot al que le puedes programar nuevas habilidades sobre la marcha, en lugar de uno que solo sabe hacer una cosa para siempre.

Aquí te mostramos cómo estas herramientas contribuyen a esa flexibilidad:

1.  **Abstracción de Callables (lo que se puede llamar)**:
    * **`std::function`** es el campeón de la abstracción. Puede almacenar cualquier cosa que se pueda llamar (`callable`) con una signatura específica: punteros a funciones, punteros a métodos (con `std::bind`), objetos funcionales (functors) y lambdas. Esto significa que puedes escribir funciones que aceptan `std::function` como parámetro, y esa función no necesita saber *cómo* se implementó el `callable` subyacente. Simplemente sabe que puede llamarlo.
    * **Ejemplo**: Un sistema de eventos que invoca una `std::function` cuando ocurre algo, sin importarle si el *handler* del evento es una función miembro, una lambda o un functor.

2.  **Personalización de Algoritmos**:
    * Los **algoritmos de la STL** están diseñados para ser genéricos. No tienen el comportamiento fijo para ordenar o buscar; en su lugar, aceptan predicados o funciones de operación.
    * Las **lambdas** (con su capacidad de captura) son la forma más poderosa y concisa de proporcionar estos predicados y operaciones personalizadas en línea, adaptándose al contexto específico donde se usan.
    * **`std::bind`** también puede personalizar algoritmos, especialmente cuando necesitas adaptar funciones existentes (por ejemplo, de una librería de C) que tienen una signatura diferente a la esperada por el algoritmo.
    * **Ejemplo**: `std::sort` con una lambda para ordenar objetos por un campo específico, o `std::for_each` para aplicar una operación compleja a cada elemento de un contenedor.

3.  **Modularidad y Diseño Orientado a Políticas**:
    * Puedes definir la "política" o el "comportamiento" de una clase o función pasándole un objeto funcional. Esto reduce el acoplamiento y aumenta la modularidad.
    * **Ejemplo**: Una clase `ProcesadorDeDatos` que toma una `std::function<void(int)>` para determinar cómo procesar cada número. Puedes pasar una lambda que lo imprima, otra que lo guarde en una base de datos, etc., sin cambiar la clase `ProcesadorDeDatos`.

4.  **Composición de Funciones**:
    * Con `std::bind` (y en menor medida con lambdas anidadas), puedes "componer" nuevas funciones a partir de funciones existentes, fijando argumentos o reordenándolos. Esto es útil para crear funciones más especializadas a partir de bloques de construcción más generales.

En esencia, la programación funcional en C++ (habilitada por estas características) te permite mover el "qué hacer" (el comportamiento) de tu código fuera de las estructuras de datos y pasarlo como un parámetro. Esto resulta en un código más flexible, reutilizable y fácil de mantener, ya que puedes cambiar el comportamiento sin modificar la estructura fundamental.
''',
    'code_example': r'''
#include <iostream>
#include <vector>
#include <string>
#include <algorithm>  // Para std::for_each, std::sort, std::count_if, std::transform
#include <functional> // Para std::function, std::bind, std::placeholders

// Una funcion "printer" generica que acepta cualquier funcion para imprimir un entero
void imprimir_elementos(const std::vector<int>& vec, std::function<void(int)> printer) {
    std::cout << "  Imprimiendo elementos (via std::function):" << std::endl;
    for (int n : vec) {
        printer(n); // Llama al callable pasado como parametro
    }
}

// Clase para demostrar el concepto de estrategia (patron de diseño)
class EstrategiaProcesamiento {
public:
    virtual void procesar(int dato) const = 0;
    virtual ~EstrategiaProcesamiento() = default;
};

class EstrategiaImprimir : public EstrategiaProcesamiento {
public:
    void procesar(int dato) const override {
        std::cout << "    [Imprimir] Dato: " << dato << std::endl;
    }
};

class EstrategiaDuplicar : public EstrategiaProcesamiento {
public:
    void procesar(int dato) const override {
        std::cout << "    [Duplicar] Dato procesado: " << dato * 2 << std::endl;
    }
};

int main() {
    std::cout << "--- Flexibilidad en la Programacion Funcional ---" << std::endl;

    std::vector<int> datos = {1, 2, 3, 4, 5};

    // --- 1. Usando std::function para pasar diferentes comportamientos ---
    std::cout << "\n--- std::function para Inyeccion de Comportamiento ---" << std::endl;

    // Comportamiento 1: Imprimir normalmente
    imprimir_elementos(datos, [](int n){ std::cout << "    Normal: " << n << std::endl; });

    // Comportamiento 2: Imprimir al cuadrado
    imprimir_elementos(datos, [](int n){ std::cout << "    Cuadrado: " << n * n << std::endl; });

    // Comportamiento 3: Usar una funcion global
    auto imprimir_con_prefijo = [](int n){ std::cout << "    Prefijo: " << n << std::endl; };
    imprimir_elementos(datos, imprimir_con_prefijo);


    // --- 2. Personalizacion de Algoritmos con Lambdas y Captura ---
    std::cout << "\n--- Personalizacion de Algoritmos ---" << std::endl;

    std::vector<std::string> nombres = {"ana", "BETO", "carlos", "Diana"};

    // a) Ordenar ignorando mayusculas/minusculas
    std::sort(nombres.begin(), nombres.end(), [](const std::string& a, const std::string& b) {
        std::string lower_a = a, lower_b = b;
        std::transform(lower_a.begin(), lower_a.end(), lower_a.begin(), ::tolower);
        std::transform(lower_b.begin(), lower_b.end(), lower_b.begin(), ::tolower);
        return lower_a < lower_b;
    });
    std::cout << "  Nombres ordenados (case-insensitive): ";
    for (const auto& n : nombres) std::cout << n << " ";
    std::cout << std::endl;

    // b) Contar elementos que cumplen una condicion con una variable capturada
    int umbral = 4;
    int count_long_names = std::count_if(nombres.begin(), nombres.end(), [umbral](const std::string& s) {
        return s.length() > umbral;
    });
    std::cout << "  Nombres con mas de " << umbral << " letras: " << count_long_names << std::endl;


    // --- 3. Composición de Funciones con std::bind (menos comun hoy en dia, pero posible) ---
    std::cout << "\n--- Composicion de Funciones con std::bind ---" << std::endl;
    using namespace std::placeholders;

    auto suma_y_doble = [](int a, int b){ return (a + b) * 2; };
    auto sumar_cinco_y_doble = std::bind(suma_y_doble, 5, _1); // f(x) = (5 + x) * 2

    std::cout << "  Sumar 5 y duplicar (bind): " << sumar_cinco_y_doble(10) << std::endl; // (5 + 10) * 2 = 30


    // --- 4. Polimorfismo de Comportamiento (Functors) ---
    // Aunque las lambdas son mas concisas, los functors tradicionales
    // son utiles para el polimorfismo o cuando se requiere una clase.
    std::cout << "\n--- Polimorfismo de Comportamiento (Functors/Estrategia) ---" << std::endl;

    std::vector<std::unique_ptr<EstrategiaProcesamiento>> estrategias;
    estrategias.push_back(std::make_unique<EstrategiaImprimir>());
    estrategias.push_back(std::make_unique<EstrategiaDuplicar>());

    for (int dato : datos) {
        for (const auto& estrategia : estrategias) {
            estrategia->procesar(dato);
        }
    }


    std::cout << "\nFin de la demostracion. La flexibilidad funcional permite codigo mas adaptable y expresivo." << std::endl;
    return 0;
}
'''
  });
}

Future<void> insertMidLevel6DataCpp(Database db) async {
  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 6,
    'tittle_level': 'Concurrencia y Programación Multihilo',
    'topic': 'Hilos en C++',
    'subtopic': 'std::thread y su uso básico',
    'definition': '''
¡Bienvenidos al mundo de la **concurrencia** en C++! A partir de C++11, el lenguaje nos dio herramientas estándar para trabajar con **hilos** (o *threads*), que nos permiten ejecutar múltiples partes de nuestro programa *simultáneamente*. La clase central para esto es `std::thread`.

¿Por qué es esto importante?

Imagina que tu programa es un chef. Sin hilos, es un chef que hace una cosa a la vez: pica la cebolla, luego corta los tomates, luego cocina la salsa. Con hilos, es un chef que puede picar la cebolla *mientras* otro asistente corta los tomates. Esto puede hacer que tu programa termine el trabajo mucho más rápido, especialmente en máquinas con múltiples núcleos de CPU. En resumen, los hilos son clave para aprovechar al máximo el hardware moderno y hacer que las aplicaciones respondan mejor.

### ¿Qué es un hilo?

Un **hilo** es la unidad más pequeña de procesamiento que un sistema operativo puede programar. Un solo programa (o proceso) puede tener múltiples hilos ejecutándose al mismo tiempo. Cada hilo comparte el mismo espacio de memoria del proceso, lo que les permite acceder a los mismos datos, pero cada uno tiene su propio contador de programa y pila de ejecución.

### `std::thread` y su uso básico

La clase `std::thread` en C++ te permite crear y gestionar hilos de una manera sencilla. Para usarla, necesitas incluir la cabecera `<thread>`.

Para crear un hilo, simplemente necesitas pasarle una función (o un objeto invocable, como una lambda o un functor) a su constructor. Esa función será la que se ejecute en el nuevo hilo.

**Pasos básicos:**

1.  **Incluir `<thread>`**: Para usar la clase `std::thread`.
2.  **Definir la tarea**: Crea una función normal, una lambda o un objeto funcional que contenga el código que quieres que se ejecute en el nuevo hilo.
3.  **Crear el hilo**: Instancia un objeto `std::thread` pasándole tu tarea. Esto inicia la ejecución del nuevo hilo.
4.  **Esperar (`join`) o Desconectar (`detach`)**:
    * **`join()`**: Espera a que el hilo termine su ejecución. Cuando llamas a `join()`, el hilo principal (el que creó el nuevo hilo) se bloquea hasta que el hilo secundario finaliza. Es la forma más segura de garantizar que un hilo ha completado su trabajo y que sus recursos se liberan correctamente.
    * **`detach()`**: Separa el hilo recién creado del objeto `std::thread` que lo lanzó. El hilo se convierte en un **hilo demonio** o **hilo en segundo plano**, y su ejecución continúa de forma independiente del hilo principal. Una vez separado, no puedes usar `join()` para esperar su finalización ni obtener su ID; el sistema operativo se encargará de liberar sus recursos cuando termine. Si no llamas a `join()` o `detach()`, tu programa terminará abruptamente cuando el objeto `std::thread` salga de ámbito, lo que resultará en un error en tiempo de ejecución.
''',
    'code_example': r'''
#include <iostream>
#include <thread> // Necesario para std::thread
#include <chrono> // Para std::chrono::seconds, std::this_thread::sleep_for
#include <string>

// 1. Una función simple que se ejecutará en un hilo
void tareaSimple() {
    std::cout << "  [Hilo Secundario 1]: Hola desde una funcion simple." << std::endl;
    std::this_thread::sleep_for(std::chrono::seconds(2)); // El hilo "duerme" por 2 segundos
    std::cout << "  [Hilo Secundario 1]: Tarea simple completada." << std::endl;
}

// 2. Una función lambda que se ejecutará en un hilo
auto tareaLambda = []() {
    std::cout << "  [Hilo Secundario 2]: Hola desde una lambda." << std::endl;
    std::this_thread::sleep_for(std::chrono::seconds(1));
    std::cout << "  [Hilo Secundario 2]: Tarea lambda completada." << std::endl;
};

// 3. Una clase con un operador de llamada de función (functor)
class TareaFunctor {
public:
    void operator()() const {
        std::cout << "  [Hilo Secundario 3]: Hola desde un functor." << std::endl;
        std::this_thread::sleep_for(std::chrono::seconds(3));
        std::cout << "  [Hilo Secundario 3]: Tarea functor completada." << std::endl;
    }
};

int main() {
    std::cout << "--- Demostrando std::thread y su uso basico ---" << std::endl;

    // Crear y lanzar el primer hilo usando una función normal
    std::cout << "  [Hilo Principal]: Lanzando Hilo Secundario 1..." << std::endl;
    std::thread hilo1(tareaSimple);

    // Crear y lanzar el segundo hilo usando una función lambda
    std::cout << "  [Hilo Principal]: Lanzando Hilo Secundario 2..." << std::endl;
    std::thread hilo2(tareaLambda);

    // Crear y lanzar el tercer hilo usando un objeto functor
    std::cout << "  [Hilo Principal]: Lanzando Hilo Secundario 3..." << std::endl;
    TareaFunctor miFunctor; // Se crea una instancia del functor
    std::thread hilo3(miFunctor); // Se pasa la instancia

    // El hilo principal puede seguir haciendo su trabajo mientras los hilos secundarios se ejecutan
    std::cout << "  [Hilo Principal]: Hilos secundarios lanzados. El hilo principal sigue trabajando..." << std::endl;
    std::this_thread::sleep_for(std::chrono::milliseconds(500)); // Hilo principal hace algo

    // Esperar a que los hilos secundarios terminen (join)
    // Es CRUCIAL llamar a join() o detach() antes de que el objeto std::thread se destruya
    // de lo contrario, el programa terminará con un error.
    std::cout << "  [Hilo Principal]: Esperando que Hilo Secundario 1 termine (join)..." << std::endl;
    hilo1.join(); // El hilo principal se bloquea aquí hasta que hilo1 termine
    std::cout << "  [Hilo Principal]: Hilo Secundario 1 ha terminado." << std::endl;

    std::cout << "  [Hilo Principal]: Esperando que Hilo Secundario 2 termine (join)..." << std::endl;
    hilo2.join(); // El hilo principal se bloquea aquí hasta que hilo2 termine
    std::cout << "  [Hilo Principal]: Hilo Secundario 2 ha terminado." << std::endl;

    std::cout << "  [Hilo Principal]: Esperando que Hilo Secundario 3 termine (join)..." << std::endl;
    hilo3.join(); // El hilo principal se bloquea aquí hasta que hilo3 termine
    std::cout << "  [Hilo Principal]: Hilo Secundario 3 ha terminado." << std::endl;

    std::cout << "  [Hilo Principal]: Todas las tareas de hilo completadas. Programa finalizado." << std::endl;

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 6,
    'tittle_level': 'Concurrencia y Programación Multihilo',
    'topic': 'Hilos en C++',
    'subtopic': 'Paso de argumentos a hilos',
    'definition': '''
Cuando creas un hilo, a menudo necesitas que la función que este ejecuta opere con ciertos datos. `std::thread` permite pasar **argumentos** a la función del hilo de manera sencilla y segura.

¿Por qué es importante el paso de argumentos?

Piensa en el chef de antes. Si el asistente va a cortar tomates, necesita que le digas *cuántos* tomates cortar o *qué tipo* de tomates. Los argumentos son esa información que le pasas al hilo para que pueda realizar su tarea específica. La forma en que pasas esos argumentos es crucial para evitar problemas como la **copia innecesaria** o, peor aún, **referencias colgantes**.

**Reglas clave para el paso de argumentos:**

* **Paso por valor**: Los argumentos pasados al constructor de `std::thread` se **copian** por defecto al nuevo hilo. Esto significa que la función del hilo recibirá una propia copia de los datos originales. Esto es generalmente seguro, ya que el hilo trabajará con su propia copia, pero puede ser ineficiente si los objetos son grandes (ej. un `std::vector` muy grande).
    * **Importante**: Si el tipo del argumento no es copiable (ej. `std::unique_ptr` o un `std::thread` movido), tendrás un error de compilación. Los argumentos se tratan como rvalues, lo que permite el *move semantics* si el tipo lo soporta.

* **Paso por referencia (`std::ref`)**: Si necesitas que el hilo trabaje directamente con el objeto original (es decir, que los cambios hechos por el hilo en el argumento se reflejen en el hilo principal), debes pasar el argumento **por referencia**. Para hacer esto, no uses el `&` directamente, sino que envuelve el argumento con `std::ref()` de la cabecera `<functional>`. `std::ref` devuelve un `std::reference_wrapper`, que es un tipo copiable que contiene una referencia.
    * **Cuidado**: Al pasar por referencia, debes asegurarte de que el objeto original **exista** durante todo el tiempo que el hilo secundario lo esté usando. Si el hilo principal libera o destruye el objeto mientras el hilo secundario aún lo usa, tendrás una **referencia colgante**, lo que lleva a un comportamiento indefinido o *crashes*. Esto es un error común en la programación concurrente.

* **Paso de punteros a métodos miembros**: Si la tarea del hilo es ejecutar un método miembro de una clase, el primer argumento después de la función del método debe ser un puntero al objeto en el que se llamará al método (o una referencia a ese objeto).

Elegir la forma correcta de pasar argumentos es vital para la seguridad y eficiencia de tus programas multihilo.
''',
    'code_example': r'''
#include <iostream>
#include <thread>
#include <string>
#include <vector>
#include <functional> // Necesario para std::ref

// 1. Función que toma un argumento por valor
void tareaConValor(int valor) {
    std::cout << "  [Hilo Valor]: Recibido valor: " << valor << std::endl;
    valor += 100; // Modificamos la copia local
    std::cout << "  [Hilo Valor]: Valor modificado a: " << valor << std::endl;
}

// 2. Función que toma un argumento por referencia
void tareaConReferencia(int& ref_valor) {
    std::cout << "  [Hilo Ref]: Recibida referencia a valor: " << ref_valor << std::endl;
    ref_valor *= 2; // Modificamos el valor original
    std::cout << "  [Hilo Ref]: Valor modificado via referencia a: " << ref_valor << std::endl;
}

// 3. Función que toma multiples argumentos
void tareaConMultiplesArgs(int a, double b, const std::string& mensaje) {
    std::cout << "  [Hilo Multi]: a=" << a << ", b=" << b << ", mensaje='" << mensaje << "'" << std::endl;
}

// 4. Clase con método miembro que se ejecutará en un hilo
class ProcesadorDeDatos {
public:
    void procesar(const std::string& datos) {
        std::cout << "  [Hilo Metodo]: Procesando datos: " << datos << " por el objeto ID " << id_ << std::endl;
    }
    // Constructor para darle un ID al procesador
    ProcesadorDeDatos(int id) : id_(id) {}
private:
    int id_;
};

int main() {
    std::cout << "--- Demostrando Paso de Argumentos a Hilos ---" << std::endl;

    // --- Paso por valor ---
    int num_valor = 50;
    std::cout << "\n  [Hilo Principal]: num_valor antes de hilo (valor): " << num_valor << std::endl;
    std::thread hilo_valor(tareaConValor, num_valor); // num_valor se COPIA al hilo
    hilo_valor.join();
    std::cout << "  [Hilo Principal]: num_valor despues de hilo (valor): " << num_valor << std::endl; // num_valor sigue siendo 50

    // --- Paso por referencia (usando std::ref) ---
    int num_referencia = 25;
    std::cout << "\n  [Hilo Principal]: num_referencia antes de hilo (referencia): " << num_referencia << std::endl;
    std::thread hilo_referencia(tareaConReferencia, std::ref(num_referencia)); // Se pasa una REFERENCIA
    hilo_referencia.join();
    std::cout << "  [Hilo Principal]: num_referencia despues de hilo (referencia): " << num_referencia << std::endl; // num_referencia ahora es 50

    // --- Paso de multiples argumentos ---
    std::string saludo = "Hola Hilo!";
    // Los argumentos se pasan despues de la funcion, separados por comas.
    // 'saludo' se copiará al hilo.
    std::thread hilo_multi(tareaConMultiplesArgs, 10, 3.14, saludo);
    hilo_multi.join();

    // --- Paso de metodo miembro ---
    ProcesadorDeDatos proc1(1);
    // El primer argumento despues del metodo es el objeto en el que se llama al metodo.
    // &ProcesadorDeDatos::procesar es el puntero al metodo miembro.
    // &proc1 es la direccion del objeto sobre el que se va a llamar el metodo.
    // "Datos para proc1" es el argumento para el metodo 'procesar'.
    std::thread hilo_metodo(&ProcesadorDeDatos::procesar, &proc1, "Datos para proc1");
    hilo_metodo.join();

    // --- CUIDADO CON REFERENCIAS COLGANTES ---
    // Este es un ejemplo peligroso si no se maneja correctamente.
    // La variable 'temporal_valor' es local al bloque y se destruye al salir.
    // Si el hilo_colgante no termina antes de que 'temporal_valor' se destruya,
    // estará usando una referencia a memoria inválida.
    std::thread hilo_colgante;
    {
        int temporal_valor = 1000;
        // NO HACER ESTO EN PRODUCCION sin garantizar que el hilo termine antes
        // de que temporal_valor salga de ambito.
        hilo_colgante = std::thread(tareaConReferencia, std::ref(temporal_valor));
        // Para evitar el error en este ejemplo, debemos hacer join AQUI.
        // hilo_colgante.join();
    } // temporal_valor se destruye aqui. Si hilo_colgante no ha terminado, ¡problemas!

    // Si no hicimos join en el bloque anterior, debemos hacer detach o join aqui.
    // Para propositos de demostracion, haremos detach para que el programa no falle si el hilo_colgante sigue vivo.
    // En un escenario real, deberias tener un mecanismo para garantizar la vida util.
    if (hilo_colgante.joinable()) { // Comprueba si el hilo aún puede ser joined/detached
        hilo_colgante.detach(); // Permitir que el hilo termine por si mismo (si no lo hizo ya)
        std::cout << "\n  [ADVERTENCIA]: Hilo colgante detachado. Cuidado con la vida util de las referencias!" << std::endl;
    }


    std::cout << "\n--- Fin de la demostracion de paso de argumentos. ---" << std::endl;
    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 6,
    'tittle_level': 'Concurrencia y Programación Multihilo',
    'topic': 'Hilos en C++',
    'subtopic': 'Gestión del ciclo de vida de hilos',
    'definition': '''
La gestión adecuada del **ciclo de vida** de los hilos es tan crucial como su creación. Si no gestionas los hilos correctamente, puedes enfrentarte a errores en tiempo de ejecución, fugas de recursos o incluso *crashes* de tu aplicación. El ciclo de vida de un hilo abarca desde su creación hasta su finalización y la liberación de sus recursos.

¿Por qué es importante gestionar el ciclo de vida?

Imagina un grupo de trabajadores que has contratado. Si simplemente los dejas trabajando sin supervisión y no los despides o te aseguras de que terminen sus tareas, podrían dejar herramientas tiradas, dejar tareas a medio hacer o incluso seguir consumiendo recursos inútilmente. En C++, los hilos son recursos del sistema, y si no los "limpias" (liberas sus recursos) correctamente, tu programa puede volverse inestable.

**Conceptos clave en la gestión del ciclo de vida:**

1.  **Creación**: Como ya vimos, un hilo se crea al instanciar `std::thread` con un `callable` (función, lambda, functor, etc.) y sus argumentos. El hilo comienza a ejecutarse inmediatamente después de su construcción.

2.  **Estado `joinable()`**: Un objeto `std::thread` es `joinable()` si representa un hilo de ejecución activo. Esto es cierto después de su construcción hasta que se llama a `join()` o `detach()`. Después de `join()` o `detach()`, el objeto `std::thread` deja de ser `joinable()`. Es una buena práctica usar `if (mi_hilo.joinable())` antes de llamar a `join()` o `detach()`.

3.  **`join()` (Esperar finalización)**:
    * **Propósito**: Asegura que un hilo ha terminado su ejecución y que sus recursos (pila, etc.) son liberados y se pueden unir al hilo principal.
    * **Bloqueo**: La llamada a `join()` bloquea el hilo que la invoca (normalmente el hilo principal) hasta que el hilo objetivo finaliza.
    * **Uso**: Es la forma más segura de sincronización básica, ya que garantiza que los datos procesados por el hilo estarán listos y que no habrá referencias colgantes a recursos locales del hilo si este ya se destruyó.

4.  **`detach()` (Desconectar)**:
    * **Propósito**: Separa el hilo del objeto `std::thread` que lo representa. El hilo se convierte en un **demonio** o un hilo en segundo plano, y continúa su ejecución de forma independiente.
    * **No bloqueo**: `detach()` no bloquea el hilo que lo llama.
    * **Uso**: Útil para tareas que deben ejecutarse de forma asíncrona y no necesitas esperar su finalización explícita, como tareas de logging, limpieza en segundo plano, etc.
    * **Cuidado**: Una vez que un hilo está `detached`, no puedes `join()`lo ni obtener su ID. Debes asegurarte de que el hilo tenga acceso a recursos que tengan una vida útil más larga que la suya o que no necesiten limpieza explícita. El sistema operativo se encarga de liberar los recursos del hilo cuando termina.

5.  **`join()` o `detach()` Obligatorio**: Es una regla **fundamental** de C++ que cada objeto `std::thread` que representa un hilo de ejecución debe ser unido (`join()`) o desatado (`detach()`) antes de que el objeto `std::thread` se destruya. Si no lo haces, el destructor de `std::thread` llamará a `std::terminate()`, causando que el programa finalice abruptamente. Esto se debe a que el destructor no sabe si el hilo sigue en ejecución y no puede ni bloquearse (join) ni dejarlo ir (detach) automáticamente sin tu instrucción.

6.  **`std::thread::hardware_concurrency()`**: Devuelve el número de núcleos de hardware (o el número de hilos de ejecución concurrentes) que el sistema puede soportar de manera eficiente. Esto es útil para decidir cuántos hilos crear para una tarea.

7.  **`std::this_thread::get_id()` / `std::this_thread::sleep_for()`**: Funciones auxiliares para obtener el ID del hilo actual y para pausar la ejecución del hilo, respectivamente.

La gestión del ciclo de vida de los hilos es una parte esencial de la programación concurrente segura y eficiente. Siempre piensa en cuándo y cómo se va a finalizar cada hilo que creas.
''',
    'code_example': r'''
#include <iostream>
#include <thread>
#include <chrono>
#include <vector>
#include <string>
#include <numeric> // Para std::iota
#include <algorithm> // Para std::for_each

// Función que simula una tarea de trabajo
void tarea(int id, int duracion_segundos) {
    std::cout << "  [Hilo " << id << "]: Iniciando tarea. ID de hilo: " << std::this_thread::get_id() << std::endl;
    std::this_thread::sleep_for(std::chrono::seconds(duracion_segundos));
    std::cout << "  [Hilo " << id << "]: Tarea completada en " << duracion_segundos << " segundos." << std::endl;
}

// Clase que gestiona su propio hilo (ejemplo de RAII para hilos)
class HiloPersonalizado {
public:
    HiloPersonalizado(int id, int duracion) : id_(id) {
        // Lanzamos el hilo en el constructor
        mi_hilo_ = std::thread(tarea, id_, duracion);
        std::cout << "  [Hilo Personalizado " << id_ << "]: Hilo creado." << std::endl;
    }

    // El destructor se asegura de que el hilo sea unido si es joinable
    ~HiloPersonalizado() {
        if (mi_hilo_.joinable()) {
            std::cout << "  [Hilo Personalizado " << id_ << "]: Uniendo hilo en el destructor..." << std::endl;
            mi_hilo_.join();
            std::cout << "  [Hilo Personalizado " << id_ << "]: Hilo unido en el destructor." << std::endl;
        } else {
            std::cout << "  [Hilo Personalizado " << id_ << "]: Hilo no joinable al destruir (quizas ya detachado o movido)." << std::endl;
        }
    }

    // Para evitar la copia y el doble join/detach, se hace movible
    HiloPersonalizado(HiloPersonalizado&& other) noexcept : mi_hilo_(std::move(other.mi_hilo_)), id_(other.id_) {}
    HiloPersonalizado& operator=(HiloPersonalizado&& other) noexcept {
        if (this != &other) {
            if (mi_hilo_.joinable()) { // Asegurarse de limpiar el hilo actual si existe
                mi_hilo_.join();
            }
            mi_hilo_ = std::move(other.mi_hilo_);
            id_ = other.id_;
        }
        return *this;
    }

    // Deshabilitar copia para evitar problemas de doble gestion de hilos
    HiloPersonalizado(const HiloPersonalizado&) = delete;
    HiloPersonalizado& operator=(const HiloPersonalizado&) = delete;

private:
    std::thread mi_hilo_;
    int id_;
};


int main() {
    std::cout << "--- Demostrando Gestion del Ciclo de Vida de Hilos ---" << std::endl;

    // --- 1. Usando join() para esperar hilos ---
    std::cout << "\n--- Ejemplo con join() ---" << std::endl;
    std::thread h1(tarea, 1, 3); // Tarea de 3 segundos
    std::thread h2(tarea, 2, 1); // Tarea de 1 segundo

    std::cout << "  [Hilo Principal]: Hilos 1 y 2 lanzados. ID principal: " << std::this_thread::get_id() << std::endl;

    std::cout << "  [Hilo Principal]: Esperando h1 (join)..." << std::endl;
    h1.join(); // Bloquea el hilo principal hasta que h1 termine
    std::cout << "  [Hilo Principal]: h1 ha terminado." << std::endl;

    std::cout << "  [Hilo Principal]: Esperando h2 (join)..." << std::endl;
    h2.join(); // Bloquea el hilo principal hasta que h2 termine
    std::cout << "  [Hilo Principal]: h2 ha terminado." << std::endl;


    // --- 2. Usando detach() para hilos en segundo plano ---
    std::cout << "\n--- Ejemplo con detach() ---" << std::endl;
    std::thread h_detach(tarea, 3, 2); // Tarea de 2 segundos
    std::cout << "  [Hilo Principal]: Hilo 3 lanzado (detached). No esperare su fin." << std::endl;
    h_detach.detach(); // El hilo 3 ahora se ejecuta independientemente del hilo principal.
                       // No podemos hacer join() en h_detach despues de esto.
    if (!h_detach.joinable()) {
        std::cout << "  [Hilo Principal]: h_detach ya no es joinable despues de detach()." << std::endl;
    }
    std::cout << "  [Hilo Principal]: El hilo principal continua su ejecucion inmediatamente." << std::endl;
    std::this_thread::sleep_for(std::chrono::seconds(3)); // Asegurarse de que el hilo 3 tenga tiempo de terminar.


    // --- 3. Evitando std::terminate() ---
    // Este bloque lanzaria std::terminate() si no se llama a join() o detach()
    std::cout << "\n--- Ejemplo de gestion RAII (HiloPersonalizado) ---" << std::endl;
    {
        HiloPersonalizado hp1(4, 1); // Hilo 4 se lanzara y se unira automaticamente al salir del scope
        std::cout << "  [Hilo Principal]: HiloPersonalizado 4 en scope." << std::endl;
        // El hilo principal puede hacer otras cosas aqui
        std::this_thread::sleep_for(std::chrono::milliseconds(500));
        std::cout << "  [Hilo Principal]: Saliendo del scope del HiloPersonalizado 4." << std::endl;
    } // El destructor de hp1 se llama aqui, y automaticamente hace join().


    std::cout << "\n--- Hilos en un vector (gestion con loop) ---" << std::endl;
    std::vector<std::thread> hilos_vector;
    for (int i = 0; i < 5; ++i) {
        hilos_vector.emplace_back(tarea, 10 + i, (i % 2) + 1); // Crear hilos con duraciones 1 o 2 segundos
    }

    std::cout << "  [Hilo Principal]: Lanzados 5 hilos en un vector." << std::endl;

    // Unir todos los hilos en el vector
    for (std::thread& t : hilos_vector) {
        if (t.joinable()) {
            t.join();
        }
    }
    std::cout << "  [Hilo Principal]: Todos los hilos del vector unidos." << std::endl;


    // --- 4. std::thread::hardware_concurrency() ---
    unsigned int num_hilos_optimos = std::thread::hardware_concurrency();
    if (num_hilos_optimos > 0) {
        std::cout << "\n  [Informacion]: Este sistema puede manejar " << num_hilos_optimos << " hilos de hardware concurrentes." << std::endl;
    } else {
        std::cout << "\n  [Informacion]: No se pudo determinar el numero de hilos de hardware concurrentes." << std::endl;
    }


    std::cout << "\n--- Fin de la demostracion de gestion del ciclo de vida. ---" << std::endl;
    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 6,
    'tittle_level': 'Concurrencia y Programación Multihilo',
    'topic': 'Sincronización',
    'subtopic': 'std::mutex, std::lock_guard, std::unique_lock',
    'definition': '''
Cuando en tus programas varios hilos intentan acceder y modificar los mismos datos al mismo tiempo, las cosas se pueden poner bastante feas. Es aquí donde entran los **mutexes** y sus herramientas aliadas como `std::lock_guard` y `std::unique_lock`, para poner orden en el caos.

¿Te estás preguntando por qué esto importa?

Piensa en una situación donde varios operarios trabajan en la misma estación de soldadura. Si no se ponen de acuerdo, uno podría estar soldando mientras el otro intenta desoldar, llevando a un desastre. Los mutexes son como un sistema de turnos para recursos compartidos, asegurando que solo un operario a la vez pueda manipular la estación de soldadura. Sin ellos, tendrías lo que llamamos "condiciones de carrera", que te explico en el siguiente punto.

**`std::mutex`** es el concepto más básico aquí. Es la "cerradura" que puedes poner a un recurso compartido. Cuando un hilo quiere acceder a ese recurso, intenta "bloquear" el mutex. Si está libre, lo bloquea y continúa. Si ya está bloqueado por otro hilo, el hilo que intenta bloquearlo se queda esperando hasta que se libere. Una vez que el hilo termina de usar el recurso, debe "desbloquear" el mutex para que otros puedan usarlo. Sus operaciones principales son `lock()` y `unlock()`. Es sencillo, pero si olvidas llamar a `unlock()` (por ejemplo, si ocurre una excepción), el mutex se quedará bloqueado para siempre, llevando a un *deadlock*.

Para evitar ese problema de "olvidar el `unlock()`", C++ nos da **`std::lock_guard`**. Esto es una joya porque sigue el principio RAII (Resource Acquisition Is Initialization). Cuando creas un `std::lock_guard`, automáticamente bloquea el mutex que le pasas. Lo mágico sucede cuando el `std::lock_guard` sale de su ámbito (ya sea que la función termine normalmente o por una excepción): su destructor se encarga automáticamente de desbloquear el mutex. Esto te quita un gran peso de encima y hace tu código más seguro y robusto. Es la opción preferida para la mayoría de los casos simples de bloqueo.

Luego tenemos **`std::unique_lock`**, que es como la versión "premium" y más flexible de `std::lock_guard`. También usa RAII, pero te da más control. Puedes construirlo sin bloquear el mutex de inmediato (`std::defer_lock`), puedes bloquearlo y desbloquearlo manualmente varias veces mientras está en el mismo ámbito, puedes pasarlo a otra función (mover su "propiedad"), y es esencial cuando trabajas con `std::condition_variable` (que veremos más adelante). Esa flexibilidad adicional lo hace ideal para escenarios más complejos, aunque con una ligera sobrecarga en comparación con `std::lock_guard`. Pensemos que si `std::lock_guard` es un interruptor simple de encendido/apagado, `std::unique_lock` es un atenuador de luz con temporizador y control remoto.
''',
    'code_example': r'''
#include <iostream>
#include <thread>
#include <mutex>          // Para std::mutex, std::lock_guard, std::unique_lock
#include <vector>
#include <chrono>         // Para std::chrono::milliseconds

// Variable global que sera compartida por los hilos
int contador_compartido = 0;
std::mutex mtx; // El mutex para proteger el acceso a contador_compartido

// Funcion que incrementa el contador de forma segura con std::lock_guard
void incrementar_con_lock_guard(int num_incrementos) {
    for (int i = 0; i < num_incrementos; ++i) {
        // Al crear lock_guard, el mutex se bloquea.
        // Al salir del scope (o por excepcion), el mutex se desbloquea automaticamente.
        std::lock_guard<std::mutex> lock(mtx);
        contador_compartido++;
    }
}

// Funcion que incrementa el contador con std::unique_lock para mas control
void incrementar_con_unique_lock(int num_incrementos) {
    for (int i = 0; i < num_incrementos; ++i) {
        std::unique_lock<std::mutex> lock(mtx); // Bloquea el mutex al construir
        contador_compartido++;
        // lock.unlock(); // Podemos desbloquear manualmente antes del fin del scope si es necesario
                       // Esto es una de las flexibilidades de unique_lock
        // lock.lock();   // Y volver a bloquearlo
    } // El destructor de unique_lock desbloquea el mutex (si esta bloqueado)
}

// Ejemplo de MAL USO (sin proteccion de mutex) - causara una condicion de carrera
void incrementar_sin_proteccion(int num_incrementos) {
    for (int i = 0; i < num_incrementos; ++i) {
        contador_compartido++; // Acceso no protegido
    }
}

int main() {
    std::cout << "--- Demostrando std::mutex, std::lock_guard, std::unique_lock ---" << std::endl;

    const int INCREMENTOS_POR_HILO = 100000;
    const int NUM_HILOS = 10;

    // --- Escenario 1: Sin proteccion (CONDICION DE CARRERA) ---
    std::cout << "\n--- Escenario sin proteccion (esperamos resultados INCORRECTOS) ---" << std::endl;
    contador_compartido = 0; // Resetear
    std::vector<std::thread> hilos_sin_proteccion;
    for (int i = 0; i < NUM_HILOS; ++i) {
        hilos_sin_proteccion.emplace_back(incrementar_sin_proteccion, INCREMENTOS_POR_HILO);
    }
    for (auto& h : hilos_sin_proteccion) {
        h.join();
    }
    std::cout << "  Valor final SIN PROTECCION: " << contador_compartido << " (Esperado: " << (INCREMENTOS_POR_HILO * NUM_HILOS) << ")" << std::endl;
    // El valor sera casi con toda seguridad menor al esperado debido a la condicion de carrera.

    // --- Escenario 2: Con std::lock_guard ---
    std::cout << "\n--- Escenario con std::lock_guard (esperamos resultados CORRECTOS) ---" << std::endl;
    contador_compartido = 0; // Resetear
    std::vector<std::thread> hilos_lock_guard;
    for (int i = 0; i < NUM_HILOS; ++i) {
        hilos_lock_guard.emplace_back(incrementar_con_lock_guard, INCREMENTOS_POR_HILO);
    }
    for (auto& h : hilos_lock_guard) {
        h.join();
    }
    std::cout << "  Valor final CON lock_guard:  " << contador_compartido << " (Esperado: " << (INCREMENTOS_POR_HILO * NUM_HILOS) << ")" << std::endl;
    // Este valor deberia ser el esperado.

    // --- Escenario 3: Con std::unique_lock ---
    std::cout << "\n--- Escenario con std::unique_lock (esperamos resultados CORRECTOS) ---" << std::endl;
    contador_compartido = 0; // Resetear
    std::vector<std::thread> hilos_unique_lock;
    for (int i = 0; i < NUM_HILOS; ++i) {
        hilos_unique_lock.emplace_back(incrementar_con_unique_lock, INCREMENTOS_POR_HILO);
    }
    for (auto& h : hilos_unique_lock) {
        h.join();
    }
    std::cout << "  Valor final CON unique_lock: " << contador_compartido << " (Esperado: " << (INCREMENTOS_POR_HILO * NUM_HILOS) << ")" << std::endl;
    // Este valor tambien deberia ser el esperado.

    std::cout << "\n--- Fin de la demostracion. ---" << std::endl;
    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 6,
    'tittle_level': 'Concurrencia y Programación Multihilo',
    'topic': 'Sincronización',
    'subtopic': 'Condiciones de carrera y cómo evitarlas',
    'definition': '''
En la programación multihilo, donde varios hilos pueden estar ejecutándose al mismo tiempo y compartiendo recursos, una de las situaciones más problemáticas son las **condiciones de carrera**. Ocurren cuando el resultado de tu programa depende del orden impredecible en que los hilos acceden y modifican un mismo recurso.

¿Te estás preguntando por qué esto importa?

Pensemos por un momento en el ejemplo clásico de un contador. Si tienes una variable `x` y dos hilos intentan incrementarla (`x++`) simultáneamente, el resultado podría no ser el esperado. Ambos hilos podrían leer el valor actual de `x` (digamos 10), luego ambos intentan incrementarlo a 11, y finalmente, ambos escriben 11 de vuelta. El incremento de uno de los hilos se perdió. Este tipo de errores son notoriamente difíciles de depurar porque no siempre se manifiestan; solo aparecen bajo ciertas condiciones de tiempo que son difíciles de replicar.

**¿Qué es una Condición de Carrera?**

Es una situación donde el resultado de una secuencia de operaciones en datos compartidos se vuelve dependiente del orden de ejecución de los hilos, y ese orden no está garantizado. Si cambias el orden de los hilos y obtienes un resultado diferente (y potencialmente incorrecto), tienes una condición de carrera. Los síntomas incluyen:

* Valores inconsistentes en datos compartidos.
* Resultados inesperados de cálculos.
* A veces, incluso *crashes* del programa.

**Cómo Evitarlas:**

La estrategia principal para evitar condiciones de carrera es proteger el acceso a los **recursos compartidos** para que solo un hilo a la vez pueda realizar operaciones de modificación en ellos. Esto se conoce como garantizar la **exclusión mutua** en las **secciones críticas**.

1.  **Mutexes (`std::mutex`, `std::lock_guard`, `std::unique_lock`)**:
    * Son la forma más común y efectiva de implementar la exclusión mutua. Un **mutex** actúa como una cerradura. Antes de que un hilo acceda a una sección crítica (donde se modifican los datos compartidos), debe intentar "bloquear" el mutex. Si lo consigue, tiene acceso exclusivo. Si otro hilo ya tiene el bloqueo, el hilo actual espera. Una vez que termina la operación, el mutex debe ser "desbloqueado".
    * **`std::lock_guard`** y **`std::unique_lock`** son clases RAII (Resource Acquisition Is Initialization) que simplifican enormemente el uso de mutexes. Ellos se encargan de bloquear el mutex en su constructor y de desbloquearlo automáticamente en su destructor. Esto es vital para la seguridad, ya que previene que olvides desbloquear el mutex (lo que causaría un *deadlock*) incluso si una excepción se lanza dentro de la sección crítica. `std::unique_lock` ofrece aún más flexibilidad que `std::lock_guard`, permitiendo desbloqueos y bloqueos manuales, o transferir la propiedad del bloqueo.

2.  **Operaciones Atómicas (`std::atomic`)**:
    * Para operaciones muy simples sobre tipos de datos básicos (como incrementos/decrementos de enteros, asignaciones booleanas), C++ ofrece **operaciones atómicas**. Un tipo `std::atomic<T>` garantiza que cualquier operación sobre él se realiza como una única e indivisible "unidad de trabajo" a nivel de hardware. No hay forma de que otro hilo interfiera a mitad de la operación.
    * Son más ligeras y eficientes que los mutexes para estas tareas específicas, ya que no implican la sobrecarga de un bloqueo/desbloqueo completo. Si solo necesitas operar sobre una variable simple, `std::atomic` es a menudo la mejor elección.

3.  **Diseño de Algoritmo**:
    * A veces, la mejor "sincronización" es no necesitarla. Esto se logra diseñando tu algoritmo de forma que se minimice el acceso a datos compartidos.
    * Por ejemplo, cada hilo puede trabajar con su propia copia de los datos y solo al final combinar los resultados de forma segura. O bien, usar estructuras de datos que ya son intrínsecamente "thread-safe" (que manejan su propia sincronización interna).

Evitar condiciones de carrera es el pan de cada día en la programación concurrente. Una comprensión sólida de estos mecanismos te permitirá escribir código multihilo robusto y predecible.
''',
    'code_example': r'''
#include <iostream>
#include <thread>
#include <vector>
#include <mutex> // Para std::mutex
#include <atomic> // Para std::atomic

// --- Ejemplo de Condicion de Carrera (PROBLEMATICO) ---
int contador_problema = 0; // Variable compartida
void tarea_sin_proteccion() {
    for (int i = 0; i < 100000; ++i) {
        contador_problema++; // Esta operacion no es atomica!
    }
}

// --- Ejemplo de Solucion con Mutex (std::mutex y std::lock_guard) ---
int contador_mutex = 0;
std::mutex mtx_contador; // Mutex para proteger contador_mutex

void tarea_con_mutex() {
    for (int i = 0; i < 100000; ++i) {
        std::lock_guard<std::mutex> lock(mtx_contador); // Bloquea el mutex al entrar al scope
        contador_mutex++; // Seccion critica: solo un hilo a la vez aqui
    } // El mutex se desbloquea automaticamente al salir del scope
}

// --- Ejemplo de Solucion con std::atomic ---
std::atomic<int> contador_atomic(0); // Variable atomica
void tarea_con_atomic() {
    for (int i = 0; i < 100000; ++i) {
        contador_atomic++; // Operacion atomica: garantizado para ser seguro con hilos
    }
}

int main() {
    std::cout << "--- Demostrando Condiciones de Carrera y Como Evitarlas ---" << std::endl;

    const int NUM_HILOS = 10;
    const int INCREMENTOS_TOTALES_ESPERADOS = 100000 * NUM_HILOS;

    // --- Escenario 1: Condicion de Carrera ---
    std::cout << "\n--- Escenario sin proteccion (Condicion de Carrera) ---" << std::endl;
    std::vector<std::thread> hilos_carrera;
    for (int i = 0; i < NUM_HILOS; ++i) {
        hilos_carrera.emplace_back(tarea_sin_proteccion);
    }
    for (auto& h : hilos_carrera) {
        h.join();
    }
    std::cout << "  Resultado final (sin proteccion): " << contador_problema << std::endl;
    std::cout << "  Esperado: " << INCREMENTOS_TOTALES_ESPERADOS << std::endl;
    if (contador_problema != INCREMENTOS_TOTALES_ESPERADOS) {
        std::cout << "  ¡INCORRECTO! Esto es una condicion de carrera." << std::endl;
    } else {
        std::cout << "  (Sorprendentemente, ha coincidido, pero es una coincidencia)." << std::endl;
    }


    // --- Escenario 2: Protegido con Mutex ---
    std::cout << "\n--- Escenario con Mutex (std::lock_guard) ---" << std::endl;
    std::vector<std::thread> hilos_mutex;
    for (int i = 0; i < NUM_HILOS; ++i) {
        hilos_mutex.emplace_back(tarea_con_mutex);
    }
    for (auto& h : hilos_mutex) {
        h.join();
    }
    std::cout << "  Resultado final (con mutex): " << contador_mutex << std::endl;
    std::cout << "  Esperado: " << INCREMENTOS_TOTALES_ESPERADOS << std::endl;
    if (contador_mutex == INCREMENTOS_TOTALES_ESPERADOS) {
        std::cout << "  ¡CORRECTO! El mutex protegio la seccion critica." << std::endl;
    } else {
        std::cout << "  ¡ERROR INESPERADO! Hubo un problema con el mutex." << std::endl;
    }


    // --- Escenario 3: Protegido con std::atomic ---
    std::cout << "\n--- Escenario con std::atomic ---" << std::endl;
    std::vector<std::thread> hilos_atomic;
    for (int i = 0; i < NUM_HILOS; ++i) {
        hilos_atomic.emplace_back(tarea_con_atomic);
    }
    for (auto& h : hilos_atomic) {
        h.join();
    }
    std::cout << "  Resultado final (con atomic): " << contador_atomic << std::endl;
    std::cout << "  Esperado: " << INCREMENTOS_TOTALES_ESPERADOS << std::endl;
    if (contador_atomic == INCREMENTOS_TOTALES_ESPERADOS) {
        std::cout << "  ¡CORRECTO! Las operaciones atomicas son seguras para hilos." << std::endl;
    } else {
        std::cout << "  ¡ERROR INESPERADO! Hubo un problema con atomic." << std::endl;
    }

    // Ejemplo de MAL USO: 'volatile' NO es para sincronizacion
    // volatile int no_es_thread_safe = 0;
    // void mal_uso_volatile() {
    //     for (int i = 0; i < 100000; ++i) {
    //         no_es_thread_safe++; // Esto sigue siendo una condicion de carrera
    //     }
    // }
    // std::cout << "\n--- ADVERTENCIA: volatile NO sincroniza hilos ---" << std::endl;
    // std::thread t_volatile(mal_uso_volatile);
    // t_volatile.join();
    // std::cout << "  Resultado con volatile (NO CONFIABLE): " << no_es_thread_safe << std::endl;
    // std::cout << "  (Comentado para evitar confusion, pero es un error comun)." << std::endl;


    std::cout << "\n--- Fin de la demostracion de condiciones de carrera. ---" << std::endl;
    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 6,
    'tittle_level': 'Concurrencia y Programación Multihilo',
    'topic': 'Sincronización',
    'subtopic': 'std::condition_variable y comunicación entre hilos',
    'definition': '''
Cuando hablamos de programación multihilo, no solo se trata de evitar que los hilos se pisen entre sí (que para eso están los mutexes), sino también de que puedan **comunicarse y coordinarse**. ¿Qué pasa si un hilo necesita esperar a que otro termine una tarea o a que se cumpla una condición específica antes de poder continuar? Aquí es donde entra en juego **`std::condition_variable`**.

¿Te estás preguntando por qué esto importa?

Pensemos por un momento en un escenario. Imagina que tienes un "productor" (un hilo) que genera datos y un "consumidor" (otro hilo) que procesa esos datos. El consumidor no puede trabajar si no hay datos disponibles, y el productor no debería seguir produciendo si el buffer de datos está lleno. Sin un `std::condition_variable`, el consumidor tendría que estar "preguntando" constantemente si hay datos (un ciclo de espera activo, que consume CPU inútilmente). Con una `condition_variable`, el consumidor puede "dormir" y solo despertarse cuando el productor le avise que hay datos.

**`std::condition_variable`** es un mecanismo de sincronización que permite a uno o más hilos **esperar pasivamente** hasta que otro hilo les notifique que una condición particular se ha cumplido. Es la forma más eficiente de coordinar el trabajo entre hilos.

**Cómo funciona (la tríada crucial):**

Para usar `std::condition_variable`, siempre necesitas tres elementos trabajando juntos:

1.  **Una variable compartida (`condición`)**: Esta variable es la que representa la "condición" que los hilos esperan. Por ejemplo, si un buffer está vacío o lleno, si una tarea ha finalizado, etc.
2.  **Un `std::mutex`**: ¡Fundamental! Este mutex siempre debe proteger la variable compartida. Cuando un hilo verifica la condición o llama a `wait()`, el mutex asegura que el acceso a la variable compartida sea seguro y atómico. Para que la `condition_variable` funcione correctamente con `wait()`, el mutex debe ser de tipo `std::unique_lock<std::mutex>`.
3.  **El `std::condition_variable` en sí**: Este objeto es el que los hilos usarán para ponerse a dormir y para ser despertados.

**Operaciones clave:**

* **`wait(unique_lock<mutex>& lock)` o `wait(unique_lock<mutex>& lock, Predicate pred)`**:
    * Un hilo que necesita esperar a que se cumpla una condición llama a este método.
    * Lo que hace `wait()` es un proceso atómico de tres pasos:
        1.  Libera el `unique_lock` que le pasaste (desbloquea el mutex).
        2.  Pone el hilo actual en un estado de espera (lo "duerme").
        3.  Cuando el hilo es despertado (por una notificación o un despertar espurio), vuelve a intentar adquirir el bloqueo del mutex antes de que `wait()` retorne.
    * La versión con `Predicate` (una función lambda o functor que devuelve `bool`) es la más segura. La `condition_variable` solo pondrá el hilo a esperar si el predicado devuelve `false`. Si devuelve `true`, `wait()` regresa inmediatamente. Esto es crucial para manejar los "despertares espurios" (cuando un hilo se despierta sin una `notify` explícita, algo que puede ocurrir en sistemas operativos multihilo). Sin el predicado, tendrías que usar un bucle `while (!condicion)` explícitamente después de `wait()`.

* **`notify_one()`**:
    * Este método despierta a **uno solo** de los hilos que están esperando en esa `condition_variable`. ¿Cuál? El sistema operativo decide.

* **`notify_all()`**:
    * Este método despierta a **todos** los hilos que están esperando en esa `condition_variable`.

**Flujo típico para un hilo que espera (el "consumidor" o "esperador"):**

1.  Adquiere un `std::unique_lock` sobre el mutex que protege la variable de condición.
2.  Llama a `cond_var.wait(lock, [this]{ return condicion_se_cumple; });`. El predicado es vital.
3.  Una vez que `wait` retorna (y el mutex está bloqueado de nuevo), el hilo sabe que la condición se cumple y puede procesar los datos compartidos.

**Flujo típico para un hilo que notifica (el "productor" o "notificador"):**

1.  Adquiere un `std::lock_guard` o `std::unique_lock` sobre el **mismo mutex**.
2.  Modifica la variable de condición compartida para que la condición que los otros hilos esperan se cumpla.
3.  Llama a `cond_var.notify_one()` o `cond_var.notify_all()`. La notificación debe ocurrir después de que la condición haya sido modificada y (preferiblemente) antes de liberar el bloqueo, o justo después.

`std::condition_variable` es una herramienta avanzada pero indispensable para construir sistemas concurrentes complejos donde los hilos necesitan coordinar sus acciones de forma eficiente y sin consumir recursos innecesarios.''',
    'code_example': r'''
#include <iostream>
#include <thread>
#include <mutex>
#include <condition_variable> // Para std::condition_variable
#include <queue>              // Para simular un buffer de datos
#include <string>
#include <chrono>

// Variables globales para la comunicacion entre hilos
std::queue<int> buffer_de_datos; // Buffer compartido
std::mutex mtx_buffer;           // Mutex para proteger el buffer
std::condition_variable cv_buffer_lleno; // CV para notificar cuando hay datos
std::condition_variable cv_buffer_vacio; // CV para notificar cuando hay espacio

const unsigned int MAX_BUFFER_SIZE = 5; // Tamaño maximo del buffer

// Hilo Productor: Genera datos y los pone en el buffer
void productor() {
    for (int i = 0; i < 10; ++i) { // Produciremos 10 elementos
        std::unique_lock<std::mutex> lock(mtx_buffer); // Bloquea el mutex del buffer

        // Espera si el buffer esta lleno (predicado)
        cv_buffer_vacio.wait(lock, []{ return buffer_de_datos.size() < MAX_BUFFER_SIZE; });

        // Buffer tiene espacio, producir y añadir dato
        int dato = i + 1;
        buffer_de_datos.push(dato);
        std::cout << "  [Productor]: Producido: " << dato << ". Tamano buffer: " << buffer_de_datos.size() << std::endl;
        
        lock.unlock(); // Desbloquea antes de notificar (opcional, pero buena practica a veces)
        cv_buffer_lleno.notify_one(); // Notifica a un consumidor que hay un nuevo dato
        
        std::this_thread::sleep_for(std::chrono::milliseconds(100)); // Simula tiempo de produccion
    }
    std::cout << "  [Productor]: Ha terminado de producir." << std::endl;
}

// Hilo Consumidor: Consume datos del buffer
void consumidor(int id) {
    for (int i = 0; i < 5; ++i) { // Cada consumidor consume 5 elementos
        std::unique_lock<std::mutex> lock(mtx_buffer); // Bloquea el mutex del buffer

        // Espera si el buffer esta vacio (predicado)
        cv_buffer_lleno.wait(lock, []{ return !buffer_de_datos.empty(); });

        // Buffer tiene datos, consumir
        int dato = buffer_de_datos.front();
        buffer_de_datos.pop();
        std::cout << "  [Consumidor " << id << "]: Consumido: " << dato << ". Tamano buffer: " << buffer_de_datos.size() << std::endl;

        lock.unlock(); // Desbloquea antes de notificar
        cv_buffer_vacio.notify_one(); // Notifica a un productor que hay espacio libre

        std::this_thread::sleep_for(std::chrono::milliseconds(300)); // Simula tiempo de consumo
    }
    std::cout << "  [Consumidor " << id << "]: Ha terminado de consumir." << std::endl;
}


int main() {
    std::cout << "--- Demostrando std::condition_variable y Comunicacion ---" << std::endl;

    std::thread hilo_productor(productor);
    std::thread hilo_consumidor1(consumidor, 1);
    std::thread hilo_consumidor2(consumidor, 2); // Un segundo consumidor

    hilo_productor.join();
    hilo_consumidor1.join();
    hilo_consumidor2.join();

    std::cout << "\n--- Fin de la demostracion. ---" << std::endl;
    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 6,
    'tittle_level': 'Concurrencia y Programación Multihilo',
    'topic': 'Herramientas Avanzadas de Concurrencia',
    'subtopic': 'std::future, std::promise, std::async',
    'definition': r'''
Estos tres componentes, `std::future`, `std::promise`, y `std::async`, son como un equipo de ensueño para manejar operaciones que tardan un rato en terminar, pero sin que tu programa se quede congelado esperando. Son la base para trabajar con asincronía en C++.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una aplicación que descarga una imagen pesada de Internet o que realiza un cálculo matemático complejo. Si la haces esperar a que eso termine para seguir, tu programa parecerá que se ha colgado. Con `std::future`, `std::promise` y `std::async`, podemos decirle a C++ que haga esa tarea en segundo plano mientras la interfaz de usuario sigue respondiendo y tu programa no se detiene.

`std::promise` es como una promesa que haces: "Te prometo que en algún momento te daré un resultado de esta operación". Tú le das una tarea a una `std::promise`, y ella se encarga de que el resultado de esa tarea (o una excepción si algo sale mal) esté disponible más tarde. La forma de obtener ese resultado es a través de un `std::future`. El `std::future` es el objeto que usarás para esperar y obtener el valor que la `std::promise` eventualmente establecerá. Piensa que el `std::future` es el "recibo" de esa promesa. Finalmente, `std::async` es una función de conveniencia que combina la creación de una `std::promise` y la ejecución de una función en un hilo separado, devolviendo directamente el `std::future` asociado. Es la forma más sencilla de empezar a ejecutar tareas en paralelo sin complicarse demasiado con la gestión manual de hilos. Con `std::async`, solo le pasas una función y sus argumentos, y él se encarga de todo el boilerplate para que puedas obtener el resultado cuando esté listo.
''',
    'code_example': r'''
#include <iostream>
#include <future>
#include <thread>
#include <chrono>

// Una función que simula una tarea pesada
int calcular_algo_pesado() {
    std::this_thread::sleep_for(std::chrono::seconds(3)); // Simula trabajo
    return 42;
}

int main() {
    // --- Usando std::async ---
    // Lanzar una tarea en segundo plano y obtener un future
    std::cout << "Iniciando tarea asíncrona con std::async..." << std::endl;
    std::future<int> future_resultado = std::async(std::launch::async, calcular_algo_pesado);

    // Mientras la tarea se ejecuta, podemos hacer otras cosas
    std::cout << "Haciendo otras cosas mientras esperamos..." << std::endl;

    // Esperar y obtener el resultado
    int resultado = future_resultado.get();
    std::cout << "Resultado de la tarea asíncrona: " << resultado << std::endl;

    std::cout << "\n-----------------------------------\n" << std::endl;

    // --- Usando std::promise y std::future directamente ---
    std::promise<int> p;
    std::future<int> f = p.get_future();

    std::cout << "Iniciando tarea con std::promise/std::future..." << std::endl;
    std::thread t([&p]() {
        try {
            // Realizar alguna operación
            std::this_thread::sleep_for(std::chrono::seconds(2));
            int valor = 100;
            p.set_value(valor); // Establecer el resultado de la promesa
        } catch (...) {
            p.set_exception(std::current_exception()); // Manejar excepciones
        }
    });

    std::cout << "Haciendo otras cosas mientras esperamos el promise..." << std::endl;

    // Esperar el resultado del future
    int valor_obtenido = f.get();
    std::cout << "Valor obtenido de la promesa: " << valor_obtenido << std::endl;

    t.join(); // Asegurarse de que el hilo termine
    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 6,
    'tittle_level': 'Concurrencia y Programación Multihilo',
    'topic': 'Herramientas Avanzadas de Concurrencia',
    'subtopic': 'Atomicidad y std::atomic',
    'definition': r'''
Cuando hablamos de atomicidad en programación concurrente, nos referimos a operaciones que se ejecutan completamente o no se ejecutan en absoluto; no hay un estado intermedio visible para otros hilos. Piensa que es como una transacción bancaria: o el dinero se transfiere por completo o no se transfiere nada, pero nunca se queda a medio camino.

Seguramente pensarás de qué va todo esto y por qué es tan importante... 

Imagina que varios hilos intentan modificar la misma variable al mismo tiempo. Sin atomicidad, podrías terminar con resultados inesperados y erróneos debido a las "condiciones de carrera", donde el resultado depende del orden impredecible en que se ejecutan los hilos. Aquí es donde entra `std::atomic`. Las operaciones con `std::atomic` están garantizadas para ser atómicas, lo que significa que no serán interrumpidas por otros hilos. Esto es crucial para mantener la integridad de los datos compartidos en entornos multihilo. `std::atomic` no solo asegura que las operaciones simples como leer o escribir sean atómicas, sino que también ofrece operaciones atómicas más complejas como "compare-and-swap", que te permiten actualizar un valor solo si su estado actual es el que esperas. Esto es un pilar fundamental para construir algoritmos concurrentes sin necesidad de bloqueos explícitos (como `std::mutex`) en cada operación, lo que puede mejorar significativamente el rendimiento en ciertos escenarios.
''',
    'code_example': r'''
#include <iostream>
#include <atomic>
#include <thread>
#include <vector>

std::atomic<int> contador_atomico(0); // Nuestro contador atómico

void incrementar() {
    for (int i = 0; i < 100000; ++i) {
        contador_atomico++; // Operación atómica de incremento
    }
}

int main() {
    std::vector<std::thread> hilos;
    for (int i = 0; i < 10; ++i) {
        hilos.emplace_back(incrementar);
    }

    for (auto& hilo : hilos) {
        hilo.join();
    }

    std::cout << "Valor final del contador atómico: " << contador_atomico << std::endl;

    // Ejemplo de operación incorrecta sin std::atomic (para mostrar el problema)
    int contador_no_atomico = 0;
    std::vector<std::thread> hilos_no_atomicos;

    auto incrementar_no_atomico = [&]() {
        for (int i = 0; i < 100000; ++i) {
            contador_no_atomico++; // Esto no es atómico y puede llevar a un resultado incorrecto
        }
    };

    for (int i = 0; i < 10; ++i) {
        hilos_no_atomicos.emplace_back(incrementar_no_atomico);
    }

    for (auto& hilo : hilos_no_atomicos) {
        hilo.join();
    }
    // El valor de contador_no_atomico probablemente no será 1,000,000 debido a condiciones de carrera
    std::cout << "Valor final del contador NO atómico (posiblemente incorrecto): " << contador_no_atomico << std::endl;
    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 6,
    'tittle_level': 'Concurrencia y Programación Multihilo',
    'topic': 'Herramientas Avanzadas de Concurrencia',
    'subtopic': 'Consideraciones de rendimiento y deadlocks',
    'definition': r'''
Cuando te aventuras en la programación concurrente, no todo es miel sobre hojuelas. Si bien el multihilo puede mejorar el rendimiento, también introduce desafíos significativos relacionados con el rendimiento y los famosos "deadlocks" (interbloqueos).

No sé tú, pero a mí esto al principio me costó... 

Entender que hacer las cosas en paralelo no siempre significa que serán más rápidas es contraintuitivo. Una de las primeras cosas a considerar es el *overhead* de la concurrencia. Crear y gestionar hilos, sincronizarlos con mutexes o variables de condición, y manejar los datos compartidos, todo esto tiene un costo en términos de tiempo de CPU y memoria. Si la tarea que quieres paralelizar es muy pequeña o el costo de sincronización es alto, podrías terminar con un programa más lento que su versión secuencial. Otro punto crucial es la contención de recursos: si muchos hilos intentan acceder al mismo recurso (por ejemplo, una base de datos o una variable compartida protegida por un mutex) con mucha frecuencia, pueden pasar más tiempo esperando que ejecutando, lo que reduce drásticamente el rendimiento.

Y luego están los deadlocks. Un deadlock ocurre cuando dos o más hilos están esperando indefinidamente por un recurso que otro hilo ha bloqueado y que ellos mismos necesitan para continuar. Imagina dos personas que necesitan una llave para abrir una puerta, pero cada una tiene la llave que la otra necesita para poder liberar la suya. Nadie puede avanzar. Los deadlocks son particularmente difíciles de depurar porque a menudo son intermitentes y dependen de la secuencia exacta de ejecución de los hilos. Evitarlos implica un diseño cuidadoso, siguiendo principios como el ordenamiento de los recursos (todos los hilos adquieren los recursos en el mismo orden), evitando los bloqueos mutuos o utilizando herramientas más avanzadas como `std::lock` que pueden adquirir múltiples mutexes sin riesgo de deadlock.
''',
    'code_example': r'''
#include <iostream>
#include <thread>
#include <mutex>
#include <chrono>

std::mutex mtx1;
std::mutex mtx2;

// Función que puede llevar a un deadlock
void funcion_hilo1() {
    std::cout << "Hilo 1: Intentando bloquear mtx1..." << std::endl;
    mtx1.lock();
    std::this_thread::sleep_for(std::chrono::milliseconds(100)); // Dar tiempo al otro hilo para bloquear mtx2
    std::cout << "Hilo 1: mtx1 bloqueado, intentando bloquear mtx2..." << std::endl;
    mtx2.lock();
    std::cout << "Hilo 1: Ambas mutexes bloqueadas." << std::endl;
    mtx2.unlock();
    mtx1.unlock();
    std::cout << "Hilo 1: Ambas mutexes desbloqueadas." << std::endl;
}

void funcion_hilo2() {
    std::cout << "Hilo 2: Intentando bloquear mtx2..." << std::endl;
    mtx2.lock();
    std::this_thread::sleep_for(std::chrono::milliseconds(100)); // Dar tiempo al otro hilo para bloquear mtx1
    std::cout << "Hilo 2: mtx2 bloqueado, intentando bloquear mtx1..." << std::endl;
    mtx1.lock();
    std::cout << "Hilo 2: Ambas mutexes bloqueadas." << std::endl;
    mtx1.unlock();
    mtx2.unlock();
    std::cout << "Hilo 2: Ambas mutexes desbloqueadas." << std::endl;
}

// Función para evitar el deadlock usando std::lock
void funcion_hilo1_sin_deadlock() {
    std::cout << "Hilo 1 (sin deadlock): Intentando bloquear mtx1 y mtx2..." << std::endl;
    // std::lock bloquea múltiples mutexes sin riesgo de deadlock
    std::lock(mtx1, mtx2);
    // Ahora podemos usar std::unique_lock con std::adopt_lock para gestionar el desbloqueo
    std::unique_lock<std::mutex> lock1(mtx1, std::adopt_lock);
    std::unique_lock<std::mutex> lock2(mtx2, std::adopt_lock);

    std::cout << "Hilo 1 (sin deadlock): Ambas mutexes bloqueadas." << std::endl;
    // Las mutexes se desbloquean automáticamente cuando lock1 y lock2 salen de ámbito
}

void funcion_hilo2_sin_deadlock() {
    std::cout << "Hilo 2 (sin deadlock): Intentando bloquear mtx2 y mtx1..." << std::endl;
    std::lock(mtx2, mtx1); // El orden no importa con std::lock
    std::unique_lock<std::mutex> lock2(mtx2, std::adopt_lock);
    std::unique_lock<std::mutex> lock1(mtx1, std::adopt_lock);

    std::cout << "Hilo 2 (sin deadlock): Ambas mutexes bloqueadas." << std::endl;
}


int main() {
    std::cout << "--- Demostración de Deadlock (puede colgarse) ---" << std::endl;
    std::thread t_dl1(funcion_hilo1);
    std::thread t_dl2(funcion_hilo2);

    // t_dl1.join(); // Si descomentas esto, el programa podría colgarse aquí
    // t_dl2.join(); // Si descomentas esto, el programa podría colgarse aquí

    // Para evitar que el programa se cuelgue indefinidamente en esta demostración,
    // puedes decidir no hacer join y dejar que los hilos con deadlock se queden esperando.
    // En un programa real, esto sería un problema.
    std::cout << "Esperando 2 segundos para observar el posible deadlock..." << std::endl;
    std::this_thread::sleep_for(std::chrono::seconds(2));
    std::cout << "Continuando..." << std::endl;

    // Puedes terminar el programa o manejar la situación.
    // Para una demostración real, el deadlock se mantendría.

    std::cout << "\n--- Demostración sin Deadlock (usando std::lock) ---" << std::endl;
    std::thread t_ndl1(funcion_hilo1_sin_deadlock);
    std::thread t_ndl2(funcion_hilo2_sin_deadlock);

    t_ndl1.join();
    t_ndl2.join();

    std::cout << "Programa finalizado sin deadlocks." << std::endl;

    return 0;
}
'''
  });
}

Future<void> insertMidLevel7DataCpp(Database db) async {
  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 7,
    'tittle_level': 'Entrada/Salida y Serialización',
    'topic': 'Flujo de Entrada/Salida',
    'subtopic': 'std::cin, std::cout, std::cerr',
    'definition': r'''
En C++, la interacción con el usuario y la visualización de información en la consola se manejan a través de objetos de flujo estándar. Los principales son `std::cin` para la entrada, `std::cout` para la salida, y `std::cerr` para los mensajes de error. Son los caballos de batalla para cualquier programa que necesite comunicarse con el exterior.

Seguramente pensarás de qué va todo esto o tal vez, ¿Te estás preguntando por qué esto importa? 

Pues bien, la capacidad de tu programa para recibir datos (entrada) y mostrar resultados o mensajes (salida) es fundamental. Sin estos flujos, tu programa sería como una caja negra, sin forma de interactuar con el mundo exterior. `std::cin` (abreviatura de "character input") te permite leer datos del teclado, o de cualquier otra fuente que se haya redirigido a la entrada estándar. Con él, puedes pedirle al usuario que ingrese su nombre, un número, o cualquier otro dato que tu programa necesite procesar. Por otro lado, `std::cout` (abreviatura de "character output") es tu herramienta para imprimir texto, números, y cualquier otra información en la consola. Es lo que usas para mostrar resultados de cálculos, mensajes de bienvenida, o simplemente para depurar tu código. Finalmente, `std::cerr` (abreviatura de "character error") es similar a `std::cout`, pero está diseñado específicamente para imprimir mensajes de error. La diferencia clave es que `std::cerr` suele ser un flujo no almacenado en búfer, lo que significa que los mensajes de error se escriben inmediatamente, sin demoras, algo crucial cuando tu programa falla y necesitas ver el error al instante.
''',
    'code_example': r'''
#include <iostream> // Necesario para std::cin, std::cout, std::cerr
#include <string>   // Necesario para std::string

int main() {
    // --- Usando std::cout para salida ---
    std::cout << "¡Hola, mundo desde std::cout!" << std::endl; // Imprime un mensaje

    // Imprimiendo variables
    int edad = 30;
    std::cout << "Mi edad es: " << edad << " años." << std::endl;

    // --- Usando std::cin para entrada ---
    std::string nombre;
    std::cout << "¿Cuál es tu nombre? ";
    std::cin >> nombre; // Lee una palabra del teclado

    std::cout << "¡Hola, " << nombre << "! Encantado de conocerte." << std::endl;

    int numero_favorito;
    std::cout << "Ingresa tu número favorito: ";
    std::cin >> numero_favorito; // Lee un número entero

    std::cout << "Tu número favorito es: " << numero_favorito << std::endl;

    // --- Usando std::cerr para mensajes de error ---
    // Imagina una condición de error
    bool error_detectado = true;
    if (error_detectado) {
        std::cerr << "ERROR: Se ha detectado un problema en la operación X." << std::endl;
        std::cerr << "Por favor, revisa el archivo de configuración." << std::endl;
    }

    // Ejemplo de entrada incorrecta (std::cin con tipos de datos)
    std::cout << "\n--- Demostración de entrada inválida ---" << std::endl;
    int input_incorrecto;
    std::cout << "Intenta ingresar un texto cuando se espera un número: ";
    std::cin >> input_incorrecto;
    if (std::cin.fail()) { // Verifica si la operación de lectura falló
        std::cerr << "¡Ups! Entrada inválida. Esperaba un número." << std::endl;
        std::cin.clear(); // Limpia el estado de error de std::cin
        std::cin.ignore(10000, '\n'); // Descarta el resto de la línea de entrada
    } else {
        std::cout << "Ingresaste el número: " << input_incorrecto << std::endl;
    }

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 7,
    'tittle_level': 'Entrada/Salida y Serialización',
    'topic': 'Flujo de Entrada/Salida',
    'subtopic': 'Formateo y manipulación de flujo',
    'definition': r'''
Formatear y manipular flujos en C++ es como ser el director de orquesta de cómo se presenta la información. No es solo imprimir datos, sino imprimirlos de una manera legible, organizada y estéticamente agradable. Esto incluye controlar la precisión de los números, el ancho de los campos, la alineación del texto y mucho más.

Pensemos por un momento en por qué esto importa... 

Imagina que estás generando un informe financiero o una tabla de datos. Si los números no están alineados, o si tienes demasiados decimales en un lugar donde solo necesitas dos, el informe se verá caótico y será difícil de leer. El formateo de flujos te permite tener un control granular sobre la presentación de tus datos. Puedes usar manipuladores como `std::fixed` y `std::setprecision` para controlar los decimales de los números de punto flotante, `std::setw` para establecer el ancho de un campo (útil para tablas), y `std::left` o `std::right` para alinear el texto dentro de esos campos. También existen banderas de formato para mostrar números en diferentes bases (hexadecimal, octal) o para activar/desactivar la visualización del signo positivo, entre otras cosas. Dominar estas herramientas te da la flexibilidad para que la salida de tu programa no solo sea correcta, sino también profesional y fácil de entender.
''',
    'code_example': r'''
#include <iostream>
#include <iomanip> // Necesario para manipuladores como std::setprecision, std::setw, etc.
#include <limits>  // Necesario para std::numeric_limits

int main() {
    double pi = 3.1415926535;
    double salario = 12345.6789;

    // --- Precisión de punto flotante ---
    std::cout << "--- Precisión ---" << std::endl;
    std::cout << "Pi (por defecto): " << pi << std::endl; // Salida por defecto

    std::cout << std::fixed << std::setprecision(2); // Fija a notación decimal y 2 decimales
    std::cout << "Pi (2 decimales): " << pi << std::endl;
    std::cout << "Salario (2 decimales): " << salario << std::endl;

    std::cout << std::setprecision(5); // Establece la precisión total de dígitos significativos (con std::fixed es decimales)
    std::cout << "Pi (5 decimales con fixed): " << pi << std::endl;

    std::cout << std::defaultfloat; // Vuelve al comportamiento por defecto para floats
    std::cout << "Pi (defaultfloat): " << pi << std::endl;

    // --- Ancho de campo y alineación ---
    std::cout << "\n--- Ancho de campo y Alineación ---" << std::endl;
    std::cout << std::setw(10) << "ID" << std::setw(15) << "Nombre" << std::setw(10) << "Edad" << std::endl;
    std::cout << std::setw(10) << 1 << std::setw(15) << "Alice" << std::setw(10) << 25 << std::endl;
    std::cout << std::setw(10) << 2 << std::setw(15) << "Bob Smith" << std::setw(10) << 30 << std::endl;

    std::cout << std::left; // Alineación a la izquierda
    std::cout << std::setw(10) << "ID" << std::setw(15) << "Nombre" << std::setw(10) << "Edad" << std::endl;
    std::cout << std::setw(10) << 3 << std::setw(15) << "Charlie" << std::setw(10) << 22 << std::endl;

    std::cout << std::right; // Vuelve a la alineación a la derecha (por defecto para números)

    // --- Relleno de caracteres ---
    std::cout << "\n--- Relleno ---" << std::endl;
    std::cout << std::setfill('*') << std::setw(10) << 123 << std::endl;
    std::cout << std::setfill(' ') << std::setw(10) << "Texto" << std::endl; // Vuelve al relleno por defecto

    // --- Bases numéricas ---
    std::cout << "\n--- Bases Numéricas ---" << std::endl;
    int numero = 255;
    std::cout << "Decimal: " << std::dec << numero << std::endl;
    std::cout << "Hexadecimal: " << std::hex << numero << std::endl;
    std::cout << "Octal: " << std::oct << numero << std::endl;
    std::cout << std::dec; // Volver a decimal

    // --- Mostrar punto decimal y signo positivo ---
    std::cout << "\n--- Mostrar punto y signo ---" << std::endl;
    std::cout << std::showpoint << 10.0 << std::endl; // Siempre muestra el punto decimal
    std::cout << std::noshowpoint << 10.0 << std::endl;

    std::cout << std::showpos << 5 << std::endl; // Muestra el signo positivo
    std::cout << std::noshowpos << 5 << std::endl; // No muestra el signo positivo

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 7,
    'tittle_level': 'Entrada/Salida y Serialización',
    'topic': 'Flujo de Entrada/Salida',
    'subtopic': 'Archivos y std::fstream',
    'definition': r'''
Hasta ahora, hemos hablado de leer y escribir en la consola, pero ¿qué pasa si quieres guardar información de forma persistente o leerla de un archivo? Aquí es donde entra en juego `std::fstream`, una clase poderosa que te permite trabajar con archivos en tu sistema. Con `std::fstream`, puedes abrir, leer, escribir y cerrar archivos de texto o binarios, haciendo que tu programa sea capaz de interactuar con el sistema de archivos del sistema operativo.

No sé tú, pero a mí esto al principio me costó... 

La idea de que el programa pudiera "recordar" cosas entre ejecuciones o cargar configuraciones era fascinante. `std::fstream` es una clase versátil porque puede actuar como `std::ifstream` (para entrada de archivos, es decir, lectura) y `std::ofstream` (para salida de archivos, es decir, escritura). Cuando trabajas con archivos, el proceso generalmente sigue unos pasos: primero, abres el archivo, especificando si lo harás para leer, escribir, o ambas cosas, y cómo se manejarán los datos (modo texto o binario). Luego, realizas las operaciones de lectura o escritura usando los mismos operadores `<<` y `>>` que ya conoces de `std::cout` y `std::cin`. Una vez que terminas de trabajar con el archivo, es crucial cerrarlo para liberar los recursos del sistema y asegurar que todos los cambios se guarden correctamente. No cerrarlo puede llevar a pérdida de datos o a que el archivo quede bloqueado. Manejar archivos es esencial para muchas aplicaciones, desde guardar preferencias de usuario hasta procesar grandes volúmenes de datos.
''',
    'code_example': r'''
#include <iostream>
#include <fstream> // Necesario para std::fstream, std::ifstream, std::ofstream
#include <string>
#include <vector>

int main() {
    const std::string nombre_archivo = "ejemplo.txt";

    // --- Escribiendo en un archivo (std::ofstream) ---
    std::ofstream archivo_salida(nombre_archivo); // Abre el archivo para escritura.
                                                  // Si no existe, lo crea. Si existe, lo trunca (borra contenido).

    if (archivo_salida.is_open()) { // Siempre verifica si el archivo se abrió correctamente
        archivo_salida << "Hola, este es un texto de prueba." << std::endl;
        archivo_salida << "Esta es la segunda línea." << std::endl;
        archivo_salida << "Un número: " << 12345 << std::endl;
        archivo_salida.close(); // Es importante cerrar el archivo
        std::cout << "Datos escritos en '" << nombre_archivo << "'." << std::endl;
    } else {
        std::cerr << "Error: No se pudo abrir el archivo para escritura." << std::endl;
    }

    // --- Leyendo de un archivo (std::ifstream) ---
    std::ifstream archivo_entrada(nombre_archivo); // Abre el archivo para lectura

    if (archivo_entrada.is_open()) {
        std::string linea;
        std::cout << "\nContenido de '" << nombre_archivo << "':" << std::endl;
        while (std::getline(archivo_entrada, linea)) { // Lee línea por línea
            std::cout << linea << std::endl;
        }
        archivo_entrada.close(); // Cerrar el archivo
    } else {
        std::cerr << "Error: No se pudo abrir el archivo para lectura." << std::endl;
    }

    // --- Escribiendo y leyendo con std::fstream (modo de añadir) ---
    std::fstream archivo_bidireccional(nombre_archivo, std::ios::app | std::ios::in | std::ios::out);
                                    // Abre para añadir al final, lectura y escritura.

    if (archivo_bidireccional.is_open()) {
        archivo_bidireccional << "\nEsta línea se añadió al final." << std::endl; // Añade al final
        std::cout << "\nNueva línea añadida al final del archivo." << std::endl;

        // Para leer después de añadir, hay que mover el puntero al inicio
        archivo_bidireccional.seekg(0); // Mueve el puntero de lectura al inicio del archivo

        std::string linea_leida;
        std::cout << "\nContenido actualizado de '" << nombre_archivo << "':" << std::endl;
        while (std::getline(archivo_bidireccional, linea_leida)) {
            std::cout << linea_leida << std::endl;
        }
        archivo_bidireccional.close();
    } else {
        std::cerr << "Error: No se pudo abrir el archivo en modo bidireccional." << std::endl;
    }

    // --- Ejemplo de archivo que no existe ---
    std::ifstream archivo_no_existente("no_existe.txt");
    if (!archivo_no_existente.is_open()) {
        std::cerr << "\nError esperado: 'no_existe.txt' no se pudo abrir." << std::endl;
    }

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 7,
    'tittle_level': 'Entrada/Salida y Serialización',
    'topic': 'Serialización de Datos',
    'subtopic': 'Serialización binaria y en texto',
    'definition': r'''
La serialización de datos es el proceso de convertir un objeto complejo (como una clase, una estructura de datos o incluso un gráfico de objetos) en un formato que pueda ser almacenado (en un archivo) o transmitido (a través de una red), y luego reconstruir ese objeto a partir de ese formato. Piensa que es como empaquetar algo para un viaje: lo conviertes en un formato transportable y luego, en el destino, lo desempaquetas y lo reconstruyes tal como era.

Seguramente pensarás de qué va todo esto o, ¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en un videojuego: si quieres guardar el progreso de un jugador, necesitas serializar el estado de su personaje, su inventario, la posición en el mapa, etc., para que pueda cargarlo más tarde. Aquí es donde la serialización se divide en dos tipos principales: binaria y en texto. La serialización en texto (como JSON, XML o CSV) es humana y máquina legible. Esto significa que puedes abrir el archivo con un editor de texto y entender lo que hay dentro, lo que facilita la depuración y la interoperabilidad con otros sistemas y lenguajes. Sin embargo, suelen ser menos eficientes en términos de espacio y más lentas de procesar. Por otro lado, la serialización binaria guarda los datos en su formato crudo, tal como están en la memoria. Esto los hace mucho más compactos y rápidos de leer y escribir. La desventaja es que no son legibles para humanos y pueden tener problemas de compatibilidad entre diferentes sistemas operativos o arquitecturas de hardware debido a las diferencias en la representación de datos. Elegir entre una u otra dependerá de tus necesidades: ¿priorizas la legibilidad y la interoperabilidad o la eficiencia y el tamaño?
''',
    'code_example': r'''
#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <sstream> // Necesario para std::stringstream

// Clase de ejemplo para serializar
struct Persona {
    std::string nombre;
    int edad;
    double altura;

    // Serialización a texto
    std::string to_string() const {
        std::stringstream ss;
        ss << "Nombre: " << nombre << ", Edad: " << edad << ", Altura: " << altura;
        return ss.str();
    }

    // Deserialización desde texto (simplificado)
    // En un caso real, esto sería más robusto con parsing.
    void from_string(const std::string& data) {
        // Ejemplo simplificado, no robusto para producción
        // Busca "Nombre: ", "Edad: ", "Altura: " y parsea los valores
        size_t pos_nombre = data.find("Nombre: ") + 8;
        size_t pos_edad = data.find(", Edad: ") + 8;
        size_t pos_altura = data.find(", Altura: ") + 10;

        nombre = data.substr(pos_nombre, pos_edad - 8 - pos_nombre);
        edad = std::stoi(data.substr(pos_edad, pos_altura - 10 - pos_edad));
        altura = std::stod(data.substr(pos_altura));
    }
};

int main() {
    Persona p1 = {"Alice", 30, 1.75};

    // --- Serialización en texto a un archivo ---
    std::ofstream archivo_texto("persona.txt");
    if (archivo_texto.is_open()) {
        archivo_texto << p1.nombre << std::endl;
        archivo_texto << p1.edad << std::endl;
        archivo_texto << p1.altura << std::endl;
        archivo_texto.close();
        std::cout << "Persona serializada en texto en 'persona.txt'." << std::endl;
    } else {
        std::cerr << "Error al abrir persona.txt para escritura." << std::endl;
    }

    // --- Deserialización desde texto de un archivo ---
    Persona p2;
    std::ifstream leer_archivo_texto("persona.txt");
    if (leer_archivo_texto.is_open()) {
        leer_archivo_texto >> p2.nombre;
        leer_archivo_texto >> p2.edad;
        leer_archivo_texto >> p2.altura;
        leer_archivo_texto.close();
        std::cout << "Persona deserializada de 'persona.txt':" << std::endl;
        std::cout << p2.to_string() << std::endl;
    } else {
        std::cerr << "Error al abrir persona.txt para lectura." << std::endl;
    }

    // --- Serialización binaria a un archivo ---
    // ¡Precaución! La serialización binaria no es portable sin un protocolo estricto.
    // Este es un ejemplo simplificado y no robusto para producción.
    std::ofstream archivo_binario("persona.bin", std::ios::binary);
    if (archivo_binario.is_open()) {
        archivo_binario.write(p1.nombre.c_str(), p1.nombre.size() + 1); // +1 para el nulo terminador
        archivo_binario.write(reinterpret_cast<const char*>(&p1.edad), sizeof(p1.edad));
        archivo_binario.write(reinterpret_cast<const char*>(&p1.altura), sizeof(p1.altura));
        archivo_binario.close();
        std::cout << "\nPersona serializada en binario en 'persona.bin'." << std::endl;
    } else {
        std::cerr << "Error al abrir persona.bin para escritura." << std::endl;
    }

    // --- Deserialización binaria de un archivo ---
    Persona p3;
    std::ifstream leer_archivo_binario("persona.bin", std::ios::binary);
    if (leer_archivo_binario.is_open()) {
        // Leer el nombre (necesitamos saber su longitud o leer carácter a carácter)
        // Este es un ejemplo simplificado; en la realidad se usaría un prefijo de longitud.
        char temp_nombre[256]; // Buffer temporal
        leer_archivo_binario.getline(temp_nombre, sizeof(temp_nombre), '\0'); // Leer hasta el nulo
        p3.nombre = temp_nombre;

        leer_archivo_binario.read(reinterpret_cast<char*>(&p3.edad), sizeof(p3.edad));
        leer_archivo_binario.read(reinterpret_cast<char*>(&p3.altura), sizeof(p3.altura));
        leer_archivo_binario.close();
        std::cout << "Persona deserializada de 'persona.bin':" << std::endl;
        std::cout << p3.to_string() << std::endl;
    } else {
        std::cerr << "Error al abrir persona.bin para lectura." << std::endl;
    }

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 7,
    'tittle_level': 'Entrada/Salida y Serialización',
    'topic': 'Serialización de Datos',
    'subtopic': 'Uso de bibliotecas como Boost.Serialization',
    'definition': r'''
La serialización manual, como la que vimos en el subtema anterior, puede ser un dolor de cabeza, especialmente cuando trabajas con estructuras de datos complejas o jerarquías de clases con herencia. Es fácil cometer errores, y el código se vuelve tedioso rápidamente. Es aquí donde brillan las bibliotecas de serialización, y entre ellas, `Boost.Serialization` es una de las más robustas y completas para C++.

Pensemos por un momento en por qué esto importa... 

Usar una biblioteca como Boost.Serialization te ahorra una cantidad enorme de trabajo repetitivo y propenso a errores. En lugar de escribir manualmente el código para guardar y cargar cada miembro de cada objeto, Boost.Serialization te permite definir cómo se serializan y deserializan tus clases con un código mínimo y declarativo. Su magia radica en que puede manejar automáticamente relaciones complejas como punteros, polimorfismo, herencia, contenedores de la STL (como `std::vector` o `std::map`), e incluso la serialización de datos binarios y XML. Aunque Boost.Serialization puede tener una curva de aprendizaje inicial un poco empinada debido a su flexibilidad y profundidad, la inversión vale la pena para proyectos grandes o donde la serialización es una parte fundamental. Si bien su tamaño y la necesidad de integrar la biblioteca Boost completa pueden ser una consideración, la tranquilidad de saber que tu serialización es robusta y manejada por un código probado y optimizado es un gran plus.
''',
    'code_example': r'''
// Para compilar este ejemplo, necesitarás tener la biblioteca Boost instalada
// y compilar con los flags adecuados para enlazarla, por ejemplo:
// g++ -std=c++17 -o main main.cpp -lboost_serialization

#include <iostream>
#include <fstream>
#include <string>

// Incluir los headers de Boost.Serialization
#include <boost/archive/text_oarchive.hpp>
#include <boost/archive/text_iarchive.hpp>
#include <boost/serialization/vector.hpp>
#include <boost/serialization/map.hpp>
#include <boost/serialization/shared_ptr.hpp> // Para punteros compartidos, si los usas
#include <boost/serialization/split_member.hpp> // Para customizar serialización

// Una clase simple para serializar
class Gato {
public:
    std::string nombre;
    int edad;
    std::string raza;

    Gato() : nombre(""), edad(0), raza("") {} // Constructor por defecto
    Gato(const std::string& n, int e, const std::string& r) : nombre(n), edad(e), raza(r) {}

    friend std::ostream& operator<<(std::ostream& os, const Gato& g) {
        os << "Nombre: " << g.nombre << ", Edad: " << g.edad << ", Raza: " << g.raza;
        return os;
    }

private:
    // Función de serialización para Boost
    // La plantilla archive es el tipo de archivo (text_oarchive, binary_oarchive, etc.)
    template<class Archive>
    void serialize(Archive & ar, const unsigned int version) {
        ar & nombre; // Serializa el miembro nombre
        ar & edad;   // Serializa el miembro edad
        ar & raza;   // Serializa el miembro raza
    }

    // Boost.Serialization necesita acceder a los miembros privados para serializarlos.
    // Se declara como friend para que tenga acceso.
    friend class boost::serialization::access;
};

int main() {
    Gato miGato("Whiskers", 5, "Siamés");
    std::cout << "Objeto original: " << miGato << std::endl;

    // --- Serializar a un archivo de texto ---
    { // Bloque para asegurar que el archivo_salida se cierre antes de leerlo
        std::ofstream archivo_salida("gato.txt");
        boost::archive::text_oarchive oa(archivo_salida);
        oa << miGato; // Serializa el objeto miGato al archivo
        std::cout << "Objeto serializado en 'gato.txt'." << std::endl;
    }

    // --- Deserializar desde un archivo de texto ---
    Gato gatoCargado;
    { // Bloque para asegurar que el archivo_entrada se cierre
        std::ifstream archivo_entrada("gato.txt");
        if (archivo_entrada.is_open()) {
            boost::archive::text_iarchive ia(archivo_entrada);
            ia >> gatoCargado; // Deserializa el objeto del archivo
            std::cout << "Objeto deserializado: " << gatoCargado << std::endl;
        } else {
            std::cerr << "Error: No se pudo abrir 'gato.txt' para lectura." << std::endl;
        }
    }

    // --- Serialización de un vector de objetos ---
    std::vector<Gato> gatos;
    gatos.emplace_back("Felix", 3, "Común");
    gatos.emplace_back("Luna", 7, "Persa");

    {
        std::ofstream archivo_salida_vec("gatos_vec.txt");
        boost::archive::text_oarchive oa_vec(archivo_salida_vec);
        oa_vec << gatos; // Serializa el vector completo
        std::cout << "\nVector de gatos serializado en 'gatos_vec.txt'." << std::endl;
    }

    std::vector<Gato> gatosCargados;
    {
        std::ifstream archivo_entrada_vec("gatos_vec.txt");
        if (archivo_entrada_vec.is_open()) {
            boost::archive::text_iarchive ia_vec(archivo_entrada_vec);
            ia_vec >> gatosCargados; // Deserializa el vector completo
            std::cout << "Vector de gatos deserializado:" << std::endl;
            for (const auto& g : gatosCargados) {
                std::cout << "- " << g << std::endl;
            }
        } else {
            std::cerr << "Error: No se pudo abrir 'gatos_vec.txt' para lectura." << std::endl;
        }
    }

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 7,
    'tittle_level': 'Entrada/Salida y Serialización',
    'topic': 'Serialización de Datos',
    'subtopic': 'Consideraciones de compatibilidad y versión',
    'definition': r'''
Cuando serializas datos, especialmente en sistemas que evolucionan con el tiempo, la compatibilidad y el versionado son cruciales. Piensa en ello como actualizar el software en tu teléfono: quieres que tus aplicaciones antiguas sigan funcionando con los datos que ya tenías, incluso después de una gran actualización. Ignorar estas consideraciones puede llevar a dolores de cabeza monumentales.

No sé tú, pero a mí esto al principio me costó... 

Es fácil pensar que una vez que serializas algo, siempre podrás deserializarlo, pero la realidad es más compleja. La compatibilidad se refiere a la capacidad de un programa para leer datos que fueron serializados por una versión diferente del mismo programa o por un programa completamente distinto. Los problemas surgen cuando la estructura de tus clases cambia: ¿qué pasa si añades un nuevo miembro, eliminas uno, o cambias el tipo de un campo? Si no manejas estas variaciones, intentar deserializar datos antiguos con un código nuevo (o viceversa) resultará en errores, datos corruptos, o incluso crashes. Para mitigar esto, entra en juego el versionado. Las bibliotecas de serialización robustas, como Boost.Serialization, permiten asociar un número de versión a tus clases serializables. Esto te permite escribir código de deserialización condicional que sabe cómo manejar diferentes versiones de tus datos. Por ejemplo, podrías añadir lógica para inicializar un nuevo campo a un valor por defecto si estás deserializando una versión antigua del objeto. La clave es planificar la evolución de tus datos y diseñar tu serialización para que sea adaptable, permitiendo que tu software sea más robusto y compatible a largo plazo.
''',
    'code_example': r'''
// Para compilar este ejemplo, necesitarás tener la biblioteca Boost instalada
// y compilar con los flags adecuados para enlazarla, por ejemplo:
// g++ -std=c++17 -o main main.cpp -lboost_serialization

#include <iostream>
#include <fstream>
#include <string>
#include <boost/archive/text_oarchive.hpp>
#include <boost/archive/text_iarchive.hpp>
#include <boost/serialization/version.hpp> // Importante para el versionado

// Versión 1 de la clase Persona
class PersonaV1 {
public:
    std::string nombre;
    int edad;

    PersonaV1() : nombre(""), edad(0) {}
    PersonaV1(const std::string& n, int e) : nombre(n), edad(e) {}

    friend std::ostream& operator<<(std::ostream& os, const PersonaV1& p) {
        os << "PersonaV1 - Nombre: " << p.nombre << ", Edad: " << p.edad;
        return os;
    }

private:
    friend class boost::serialization::access;
    template<class Archive>
    void serialize(Archive & ar, const unsigned int version) {
        ar & nombre;
        ar & edad;
    }
};

// Declarar la versión de la clase
// BOOST_CLASS_VERSION(PersonaV1, 1) // No es necesario si es la versión inicial por defecto 0 o 1


// Versión 2 de la clase Persona (con un nuevo campo 'pais')
class PersonaV2 {
public:
    std::string nombre;
    int edad;
    std::string pais; // Nuevo campo en la versión 2

    PersonaV2() : nombre(""), edad(0), pais("") {}
    PersonaV2(const std::string& n, int e, const std::string& p) : nombre(n), edad(e), pais(p) {}

    friend std::ostream& operator<<(std::ostream& os, const PersonaV2& p) {
        os << "PersonaV2 - Nombre: " << p.nombre << ", Edad: " << p.edad << ", País: " << p.pais;
        return os;
    }

private:
    friend class boost::serialization::access;
    template<class Archive>
    void serialize(Archive & ar, const unsigned int version) {
        ar & nombre;
        ar & edad;
        if (version > 0) { // Si la versión del archivo es mayor que 0, lee el nuevo campo
            ar & pais;
        } else {
            pais = "Desconocido"; // Valor por defecto para versiones antiguas
        }
    }
};

// Declarar la versión de la clase PersonaV2
BOOST_CLASS_VERSION(PersonaV2, 1) // La versión de esta clase es 1 (empezando desde 0, así que es la segunda versión)

int main() {
    // --- Crear y serializar una PersonaV1 ---
    PersonaV1 old_person("Carlos", 40);
    {
        std::ofstream ofs("person_v1.txt");
        boost::archive::text_oarchive oa(ofs);
        oa << old_person;
        std::cout << "PersonaV1 serializada: " << old_person << std::endl;
    }

    // --- Intentar deserializar PersonaV1 con PersonaV2 (manejo de versiones) ---
    PersonaV2 new_person_from_old;
    {
        std::ifstream ifs("person_v1.txt");
        if (ifs.is_open()) {
            boost::archive::text_iarchive ia(ifs);
            ia >> new_person_from_old; // Deserializa la V1 con la V2
            std::cout << "PersonaV2 deserializada de V1: " << new_person_from_old << std::endl;
            // El campo 'pais' debería ser "Desconocido"
        } else {
            std::cerr << "Error: No se pudo abrir 'person_v1.txt'." << std::endl;
        }
    }

    // --- Crear y serializar una PersonaV2 ---
    PersonaV2 current_person("Maria", 25, "España");
    {
        std::ofstream ofs("person_v2.txt");
        boost::archive::text_oarchive oa(ofs);
        oa << current_person;
        std::cout << "\nPersonaV2 serializada: " << current_person << std::endl;
    }

    // --- Deserializar PersonaV2 con PersonaV2 ---
    PersonaV2 loaded_current_person;
    {
        std::ifstream ifs("person_v2.txt");
        if (ifs.is_open()) {
            boost::archive::text_iarchive ia(ifs);
            ia >> loaded_current_person;
            std::cout << "PersonaV2 deserializada de V2: " << loaded_current_person << std::endl;
        } else {
            std::cerr << "Error: No se pudo abrir 'person_v2.txt'." << std::endl;
        }
    }

    // Ejemplo de cómo Boost.Serialization puede manejar clases base y derivadas
    // (requiere más configuración y headers de boost, pero muestra el concepto de compatibilidad)
    /*
    class Base {
    public:
        int base_val;
        template<class Archive>
        void serialize(Archive & ar, const unsigned int version) { ar & base_val; }
        friend class boost::serialization::access;
    };

    class Derived : public Base {
    public:
        int derived_val;
        template<class Archive>
        void serialize(Archive & ar, const unsigned int version) {
            ar & boost::serialization::base_object<Base>(*this); // Serializa la parte base
            ar & derived_val;
        }
        friend class boost::serialization::access;
    };
    */

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 7,
    'tittle_level': 'Entrada/Salida y Serialización',
    'topic': 'Manejo de Archivos Avanzado',
    'subtopic': 'Lectura y escritura eficiente',
    'definition': r'''
Cuando hablamos de leer y escribir archivos de forma eficiente en C++, estamos buscando formas de mover datos hacia y desde el disco duro lo más rápido y con la menor cantidad de recursos posible. Esto no es solo una cuestión de velocidad, sino también de optimizar el uso de la memoria y la CPU.

¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en una aplicación que procesa grandes volúmenes de datos, como un sistema de bases de datos o un programa de análisis de logs. Si cada operación de lectura o escritura de un archivo es ineficiente, el rendimiento general de la aplicación se verá drásticamente afectado. Para mejorar la eficiencia, C++ ofrece varias técnicas. Una es el uso de búferes. Por defecto, los flujos de C++ ya utilizan búferes, lo que significa que en lugar de escribir cada carácter individualmente en el disco, acumulan un bloque de datos en la memoria y luego los escriben de una sola vez. Esto reduce el número de costosas operaciones de entrada/salida. Puedes controlar el tamaño del búfer o incluso desactivarlo si necesitas una escritura inmediata (usando `std::unitbuf` o `std::nobuffer`). Otra técnica es elegir el modo de apertura correcto. Por ejemplo, `std::ios::binary` es crucial para archivos binarios, ya que evita las conversiones de caracteres que pueden ser lentas y corruptoras de datos. Para grandes volúmenes de datos, leer o escribir bloques enteros de datos con `read()` y `write()` en lugar de línea por línea o elemento por elemento puede ser significativamente más rápido, ya que reduce la sobrecarga de las llamadas a funciones y las conversiones. La clave para la eficiencia está en minimizar las interacciones directas con el hardware y aprovechar el búfer y las operaciones en bloque.
''',
    'code_example': r'''
#include <iostream>
#include <fstream>
#include <vector>
#include <chrono> // Para medir el tiempo

// Función para escribir datos eficientemente en binario
void escribir_binario_eficiente(const std::string& filename, const std::vector<int>& data) {
    std::ofstream ofs(filename, std::ios::binary | std::ios::out);
    if (!ofs.is_open()) {
        std::cerr << "Error: No se pudo abrir el archivo para escritura binaria eficiente." << std::endl;
        return;
    }
    // Escribir el tamaño del vector primero (opcional, pero buena práctica)
    size_t size = data.size();
    ofs.write(reinterpret_cast<const char*>(&size), sizeof(size_t));
    // Escribir todo el vector de una vez
    ofs.write(reinterpret_cast<const char*>(data.data()), data.size() * sizeof(int));
    ofs.close();
}

// Función para leer datos eficientemente en binario
std::vector<int> leer_binario_eficiente(const std::string& filename) {
    std::vector<int> data;
    std::ifstream ifs(filename, std::ios::binary | std::ios::in);
    if (!ifs.is_open()) {
        std::cerr << "Error: No se pudo abrir el archivo para lectura binaria eficiente." << std::endl;
        return data;
    }
    // Leer el tamaño del vector
    size_t size;
    ifs.read(reinterpret_cast<char*>(&size), sizeof(size_t));
    data.resize(size);
    // Leer todo el vector de una vez
    ifs.read(reinterpret_cast<char*>(data.data()), size * sizeof(int));
    ifs.close();
    return data;
}

int main() {
    const std::string archivo_binario = "datos.bin";
    const int num_elementos = 1000000; // Un millón de enteros

    std::vector<int> datos_a_escribir(num_elementos);
    for (int i = 0; i < num_elementos; ++i) {
        datos_a_escribir[i] = i;
    }

    // --- Medir tiempo de escritura eficiente ---
    auto start_write = std::chrono::high_resolution_clock::now();
    escribir_binario_eficiente(archivo_binario, datos_a_escribir);
    auto end_write = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> duration_write = end_write - start_write;
    std::cout << "Tiempo de escritura eficiente para " << num_elementos << " enteros: "
              << duration_write.count() << " segundos." << std::endl;

    // --- Medir tiempo de lectura eficiente ---
    auto start_read = std::chrono::high_resolution_clock::now();
    std::vector<int> datos_leidos = leer_binario_eficiente(archivo_binario);
    auto end_read = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> duration_read = end_read - start_read;
    std::cout << "Tiempo de lectura eficiente para " << datos_leidos.size() << " enteros: "
              << duration_read.count() << " segundos." << std::endl;

    // --- Demostración de escritura lenta (ejemplo ineficiente) ---
    // NO EJECUTAR ESTO PARA MILLONES DE ELEMENTOS EN PRODUCCIÓN
    // Este código es solo para demostrar la ineficiencia
    const std::string archivo_lento = "datos_lento.txt";
    auto start_write_slow = std::chrono::high_resolution_clock::now();
    std::ofstream ofs_slow(archivo_lento);
    if (ofs_slow.is_open()) {
        for (int i = 0; i < num_elementos / 100; ++i) { // Reducimos para que no tarde una eternidad
            ofs_slow << i << std::endl;
        }
        ofs_slow.close();
    }
    auto end_write_slow = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> duration_write_slow = end_write_slow - start_write_slow;
    std::cout << "\nTiempo de escritura ineficiente (texto, línea por línea) para "
              << num_elementos / 100 << " enteros: " << duration_write_slow.count() << " segundos." << std::endl;


    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 7,
    'tittle_level': 'Entrada/Salida y Serialización',
    'topic': 'Manejo de Archivos Avanzado',
    'subtopic': 'Manejo de errores en operaciones de archivo',
    'definition': r'''
Manejar errores en operaciones de archivo es tan crucial como saber leer y escribir. Imagina que tu programa intenta guardar el trabajo de un usuario, pero el disco duro está lleno o el archivo está protegido contra escritura. Si no manejas estos escenarios, tu aplicación podría colapsar, perder datos o simplemente no funcionar como se espera, dejando al usuario frustrado.

Pensemos por un momento en por qué esto importa... 

Un programa robusto no solo hace lo que se le pide cuando todo va bien, sino que también es capaz de recuperarse elegantemente cuando las cosas salen mal. En C++, los flujos de archivo (`std::ifstream`, `std::ofstream`, `std::fstream`) tienen un sistema de estado interno que refleja el éxito o fracaso de las operaciones. Puedes verificar este estado usando métodos como `is_open()`, `good()`, `eof()`, `fail()`, y `bad()`. `is_open()` te dice si el archivo se abrió correctamente. `good()` indica que el flujo está listo para la siguiente operación. `eof()` se activa cuando llegas al final del archivo. `fail()` y `bad()` son los más importantes para errores: `fail()` indica que una operación de entrada/salida falló (por ejemplo, intentar leer una letra en un `int`), y `bad()` señala un error más grave e irrecuperable (como un problema de hardware). Después de un error, el flujo se "bloquea" y no procesará más operaciones hasta que uses `clear()` para restablecer su estado. Además, puedes configurar el flujo para que lance excepciones en caso de error, lo que te permite manejar los problemas con bloques `try-catch`, similar a otros tipos de errores en C++. Un buen manejo de errores asegura que tu aplicación sea confiable y proporcione una experiencia de usuario sólida.
''',
    'code_example': r'''
#include <iostream>
#include <fstream>
#include <string>
#include <limits> // Para std::numeric_limits

int main() {
    const std::string archivo_ejemplo = "ejemplo_errores.txt";

    // --- Intentar abrir un archivo en una ruta inválida (error de apertura) ---
    std::ofstream archivo_invalido("/ruta/no/existente/archivo.txt");
    if (!archivo_invalido.is_open()) {
        std::cerr << "ERROR: No se pudo abrir el archivo en una ruta inválida." << std::endl;
        // El flujo está en estado de 'fail' o 'bad'
        std::cout << "Estado del flujo: good=" << archivo_invalido.good()
                  << ", eof=" << archivo_invalido.eof()
                  << ", fail=" << archivo_invalido.fail()
                  << ", bad=" << archivo_invalido.bad() << std::endl;
        // No es necesario limpiar si no lo vamos a usar más
    }

    // --- Escritura y verificación de errores ---
    std::ofstream ofs(archivo_ejemplo);
    if (ofs.is_open()) {
        ofs << "Primera línea." << std::endl;
        // Forzar un error (esto no es práctico en la realidad, solo para demostración)
        // En sistemas reales, un error podría ser disco lleno, permisos, etc.
        // Simulamos un error para fines de demostración, aunque no siempre es fácil forzarlo
        ofs.clear(std::ios::badbit); // Forzamos el bit 'bad' para simular un error grave

        if (ofs.fail()) {
            std::cerr << "ERROR: Fallo después de escribir la primera línea (simulado)." << std::endl;
            // Limpiar el estado de error para poder intentar operaciones futuras (si aplica)
            ofs.clear();
            std::cout << "Estado del flujo después de clear(): good=" << ofs.good() << std::endl;
        }

        ofs << "Segunda línea (puede que no se escriba si el error persiste)." << std::endl;
        ofs.close(); // Cerrar el archivo (esto también puede fallar y establecer bits de error)
        if (ofs.fail()) {
            std::cerr << "ERROR: Fallo al cerrar el archivo." << std::endl;
        }
    } else {
        std::cerr << "ERROR: No se pudo abrir '" << archivo_ejemplo << "' para escritura." << std::endl;
    }

    // --- Lectura y verificación de errores (ejemplo de lectura de tipo incorrecto) ---
    std::ifstream ifs(archivo_ejemplo);
    if (ifs.is_open()) {
        std::string s_val;
        int i_val;

        ifs >> s_val; // Lee "Primera"
        std::cout << "Leído string: " << s_val << std::endl;

        ifs >> s_val; // Lee "línea."
        std::cout << "Leído string: " << s_val << std::endl;

        // Intentar leer un int cuando lo siguiente es un texto
        ifs >> i_val;
        if (ifs.fail()) {
            std::cerr << "ERROR: Fallo al intentar leer un entero (se esperaba texto)." << std::endl;
            // Limpiar el estado de error
            ifs.clear();
            // Ignorar el resto de la línea para no caer en un bucle infinito si se lee en un bucle
            ifs.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
        } else {
            std::cout << "Leído int: " << i_val << std::endl;
        }

        std::string resto_linea;
        std::getline(ifs, resto_linea); // Leer el resto de la línea después del error
        std::cout << "Resto de la línea: '" << resto_linea << "'" << std::endl;

        ifs.close();
    } else {
        std::cerr << "ERROR: No se pudo abrir '" << archivo_ejemplo << "' para lectura." << std::endl;
    }

    // --- Configurar flujos para lanzar excepciones ---
    std::ofstream ofs_ex("excepciones.txt");
    ofs_ex.exceptions(std::ios::failbit | std::ios::badbit); // Lanza excepciones en fail y bad

    try {
        ofs_ex << "Esto se escribirá." << std::endl;
        // Simular un error que lanzaría una excepción
        // ofs_ex.clear(std::ios::badbit); // Esto lanzaría std::ios_base::failure
        ofs_ex.close();
        std::cout << "\nEscritura con excepciones completada." << std::endl;
    } catch (const std::ios_base::failure& e) {
        std::cerr << "ERROR (Excepción): Fallo en la operación de archivo: " << e.what() << std::endl;
    }


    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 7,
    'tittle_level': 'Entrada/Salida y Serialización',
    'topic': 'Manejo de Archivos Avanzado',
    'subtopic': 'Acceso aleatorio y mapeo de archivos',
    'definition': r'''
El acceso aleatorio y el mapeo de archivos son técnicas avanzadas para interactuar con el contenido de un archivo de una manera que va más allá de la simple lectura o escritura secuencial. Piensa en ellos como la diferencia entre leer un libro página por página desde el principio (acceso secuencial) y poder ir directamente a cualquier página que te interese (acceso aleatorio) o incluso tratar el libro entero como si fuera parte de tu memoria RAM (mapeo de archivos).

Seguramente pensarás de qué va todo esto. ¿Te estás preguntando por qué esto importa? 

Pues bien, para archivos grandes, o cuando necesitas leer o modificar pequeñas partes de un archivo sin cargarlo todo en memoria, estas técnicas son un salvavidas. El acceso aleatorio en C++ se logra con los métodos `seekg()` (seek get) para flujos de entrada y `seekp()` (seek put) para flujos de salida. Estos métodos te permiten mover el "puntero" de lectura o escritura a cualquier posición dentro del archivo. Puedes moverte a una posición absoluta desde el inicio del archivo, o moverte una cantidad relativa de bytes desde la posición actual o desde el final. Esto es increíblemente útil para bases de datos simples, archivos de registro con índices, o cualquier aplicación donde necesites saltar directamente a un fragmento de datos específico sin procesar todo lo anterior.

Por otro lado, el mapeo de archivos (o "memory-mapped files") es una técnica aún más avanzada que permite a un sistema operativo mapear un archivo del disco directamente a la memoria virtual de un proceso. Esto significa que puedes acceder al contenido del archivo como si fuera una gran matriz en tu programa, usando punteros normales para leer y escribir. El sistema operativo se encarga automáticamente de cargar partes del archivo en memoria cuando se acceden y de escribir los cambios de vuelta al disco. La ventaja principal es la simplicidad del código (trabajas con punteros en lugar de llamadas a `read`/`write`) y la posible mejora de rendimiento para ciertos patrones de acceso, ya que el SO puede optimizar las operaciones de E/S. Sin embargo, el mapeo de archivos es dependiente del sistema operativo y no es parte del estándar C++ directamente (requiere bibliotecas como Boost.Iostreams o APIs de sistema operativo).
''',
    'code_example': r'''
#include <iostream>
#include <fstream>
#include <string>
#include <vector>

// Para mapeo de archivos (ejemplo de la API de Posix, para Linux/macOS)
// En Windows se usarían CreateFileMapping y MapViewOfFile
#ifdef _WIN32
#include <windows.h>
#else
#include <sys/mman.h> // Para mmap
#include <fcntl.h>    // Para open
#include <unistd.h>   // Para close, ftruncate
#endif

int main() {
    const std::string archivo_random = "random_access.txt";

    // --- Preparar un archivo para acceso aleatorio ---
    std::ofstream ofs(archivo_random);
    if (ofs.is_open()) {
        ofs << "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        ofs.close();
        std::cout << "Archivo '" << archivo_random << "' creado para acceso aleatorio." << std::endl;
    } else {
        std::cerr << "Error: No se pudo crear el archivo para acceso aleatorio." << std::endl;
        return 1;
    }

    // --- Acceso aleatorio con std::fstream ---
    std::fstream file(archivo_random, std::ios::in | std::ios::out);
    if (!file.is_open()) {
        std::cerr << "Error: No se pudo abrir el archivo para acceso aleatorio." << std::endl;
        return 1;
    }

    // Mover el puntero de lectura a la posición 5 (0-indexed)
    file.seekg(5); // Apunta a 'F'
    char c;
    file.get(c);
    std::cout << "Carácter en posición 5: " << c << std::endl; // Debería ser 'F'

    // Mover el puntero de escritura a la posición 10 y escribir
    file.seekp(10); // Apunta a 'K'
    file << '#'; // Escribe '#'
    file.flush(); // Asegurarse de que el cambio se escriba en el archivo

    // Mover el puntero de lectura de nuevo para verificar el cambio
    file.seekg(10);
    file.get(c);
    std::cout << "Carácter en posición 10 después de escribir: " << c << std::endl; // Debería ser '#'

    // Mover el puntero al final y luego 3 posiciones hacia atrás
    file.seekg(-3, std::ios_base::end);
    file.get(c);
    std::cout << "Carácter 3 posiciones desde el final: " << c << std::endl; // Debería ser 'X' (XYZ)

    file.close();


    // --- Ejemplo de Mapeo de Archivos (dependiente del SO) ---
    // Este ejemplo es solo demostrativo y puede necesitar ajustes para tu OS.
    std::cout << "\n--- Demostración de Mapeo de Archivos (SO-dependiente) ---" << std::endl;

    const std::string mapped_file_name = "mapped_file.txt";
    const size_t mapped_file_size = 20; // Tamaño del archivo mapeado

#ifdef _WIN32
    // Windows API para mapeo de archivos
    HANDLE hFile = CreateFileA(mapped_file_name.c_str(), GENERIC_READ | GENERIC_WRITE, 0, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL);
    if (hFile == INVALID_HANDLE_VALUE) {
        std::cerr << "Error al crear/abrir archivo para mapeo." << std::endl;
        return 1;
    }
    HANDLE hMap = CreateFileMapping(hFile, NULL, PAGE_READWRITE, 0, mapped_file_size, NULL);
    if (hMap == NULL) {
        std::cerr << "Error al crear mapeo de archivo." << std::endl;
        CloseHandle(hFile);
        return 1;
    }
    char* data = (char*)MapViewOfFile(hMap, FILE_MAP_ALL_ACCESS, 0, 0, mapped_file_size);
    if (data == NULL) {
        std::cerr << "Error al mapear vista del archivo." << std::endl;
        CloseHandle(hMap);
        CloseHandle(hFile);
        return 1;
    }

    // Escribir en el archivo mapeado como si fuera memoria
    strncpy(data, "Hola Mapeo de Archivo!", mapped_file_size);
    std::cout << "Contenido escrito en el archivo mapeado: " << data << std::endl;

    // Leer del archivo mapeado
    std::cout << "Contenido leído del archivo mapeado: " << data << std::endl;

    UnmapViewOfFile(data);
    CloseHandle(hMap);
    CloseHandle(hFile);

#else // Posix (Linux/macOS)
    int fd = open(mapped_file_name.c_str(), O_RDWR | O_CREAT, 0666);
    if (fd == -1) {
        std::cerr << "Error al crear/abrir archivo para mapeo." << std::endl;
        return 1;
    }
    // Asegurarse de que el archivo tenga el tamaño correcto
    if (ftruncate(fd, mapped_file_size) == -1) {
        std::cerr << "Error al truncar el archivo." << std::endl;
        close(fd);
        return 1;
    }

    char* data = (char*)mmap(NULL, mapped_file_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    if (data == MAP_FAILED) {
        std::cerr << "Error al mapear el archivo." << std::endl;
        close(fd);
        return 1;
    }

    // Escribir en el archivo mapeado como si fuera memoria
    strncpy(data, "Hola Mapeo de Archivo!", mapped_file_size);
    std::cout << "Contenido escrito en el archivo mapeado: " << data << std::endl;

    // Leer del archivo mapeado
    std::cout << "Contenido leído del archivo mapeado: " << data << std::endl;

    munmap(data, mapped_file_size);
    close(fd);
#endif

    return 0;
}
'''
  });
}

Future<void> insertMidLevel8DataCpp(Database db) async {
  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 8,
    'tittle_level': 'Buenas Prácticas y Estilo de Código',
    'topic': 'Estándares de Codificación',
    'subtopic': 'Convenciones de nomenclatura',
    'definition': r'''
Las convenciones de nomenclatura en la programación son como las reglas de tráfico en una ciudad: no son obligatorias en el sentido legal, pero seguirlas hace que todo sea más seguro, predecible y fácil de entender para todos. En el mundo del código, esto significa tener un conjunto de reglas acordadas sobre cómo nombrar tus variables, funciones, clases, archivos y cualquier otra cosa que tenga un identificador.

¿Te estás preguntando por qué esto importa? 

Pues bien, la coherencia en la nomenclatura es vital para la legibilidad y el mantenimiento de tu código. Pensemos por un momento en un escenario donde cada desarrollador nombra las cosas a su antojo: `miVariable`, `my_variable`, `_mIVariable`, `MiVariable`. El código se convertiría rápidamente en un caos ilegible y difícil de entender, incluso para el propio autor después de un tiempo. Adoptar una convención de nomenclatura (como CamelCase, snake_case, PascalCase, o kebab-case, entre otras) y aplicarla de manera consistente, no solo en tu código, sino en todo un equipo o proyecto, reduce la carga cognitiva. Cuando ves un nombre, sabes qué tipo de entidad representa (¿es una clase, una función, una constante global?). Esto acelera la comprensión del código, reduce los errores y facilita la colaboración. Empresas como Google, Microsoft y Apple tienen sus propias guías de estilo, y muchas de ellas detallan exhaustivamente las convenciones de nomenclatura porque saben que un código legible es un código mantenible.
''',
    'code_example': r'''
#include <iostream>
#include <string>

// --- Convenciones de Nomenclatura Comunes en C++ ---

// PascalCase (para nombres de clases y structs)
class MiClaseDeEjemplo {
public:
    // camelCase (para nombres de variables y funciones miembro)
    int miVariableMiembro;
    void calcularResultado() {
        std::cout << "Calculando..." << std::endl;
    }
};

// snake_case (a menudo para variables locales, funciones globales, macros)
int mi_funcion_global(int primer_parametro, int segundo_parametro) {
    int resultado_temporal = primer_parametro + segundo_parametro;
    return resultado_temporal;
}

// UPPER_SNAKE_CASE (para constantes globales o macros #define)
const int MAX_INTENTOS = 3;
#define PI_VALOR 3.14159

// `m_` o `_` prefijo para miembros privados (una convención, no universal)
class OtraClase {
private:
    int m_privadoValor; // O _privadoValor
public:
    void setPrivadoValor(int valor) {
        m_privadoValor = valor;
    }
};

int main() {
    MiClaseDeEjemplo objetoEjemplo;
    objetoEjemplo.miVariableMiembro = 10;
    objetoEjemplo.calcularResultado();

    int suma = mi_funcion_global(5, 7);
    std::cout << "Suma global: " << suma << std::endl;

    OtraClase obj2;
    obj2.setPrivadoValor(20);
    // std::cout << obj2.m_privadoValor; // Error: m_privadoValor es privado

    std::cout << "Max intentos: " << MAX_INTENTOS << std::endl;
    std::cout << "Valor de PI: " << PI_VALOR << std::endl;

    // --- Ejemplo de nomenclatura inconsistente (MALO) ---
    // NO HAGAS ESTO EN TU CÓDIGO REAL
    int X;
    int var_y;
    int Zvalue;

    std::cout << "\nDemostración de mala práctica (ignorar):" << std::endl;
    std::cout << X << var_y << Zvalue << std::endl; // Solo para usar las variables

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 8,
    'tittle_level': 'Buenas Prácticas y Estilo de Código',
    'topic': 'Estándares de Codificación',
    'subtopic': 'Organización de archivos y proyectos',
    'definition': r'''
Organizar tus archivos y proyectos en C++ es como mantener tu espacio de trabajo ordenado: si todo está por todas partes, te costará encontrar lo que necesitas, y trabajar en él se volverá un fastidio. Una buena estructura de proyecto no solo mejora la legibilidad, sino que también facilita la navegación, la compilación y la colaboración en equipos.

Pensemos por un momento en por qué esto importa... 

Imagina un proyecto con cientos de archivos, todos mezclados en una sola carpeta. Encontrar un archivo específico, entender las dependencias entre diferentes partes del código, o incluso añadir una nueva funcionalidad, se convertiría en una pesadilla. Un proyecto bien organizado sigue una estructura lógica y predecible. Generalmente, esto implica separar los archivos de cabecera (`.h` o `.hpp`) de los archivos de implementación (`.cpp`). Los headers contienen las declaraciones de tus clases, funciones y variables (lo que "ofrecen" al mundo exterior), mientras que los archivos `.cpp` contienen las definiciones (cómo "funcionan"). Es común tener carpetas para `src` (código fuente), `include` (headers), `test` (pruebas unitarias), `doc` (documentación) y `build` (para archivos generados por el compilador). Además, los proyectos más grandes suelen dividirse en módulos o componentes lógicos, cada uno con su propia subestructura de directorios. Esta claridad en la organización facilita que nuevos desarrolladores se unan al proyecto, que las herramientas de construcción (como CMake o Make) funcionen eficientemente, y que el código sea más mantenible y escalable a largo plazo.
''',
    'code_example': r'''
// Este ejemplo no es un código ejecutable, sino una representación de la estructura de archivos.
// Imagina estas carpetas y archivos en tu sistema.

// Estructura de un proyecto típico en C++:
/*
mi_proyecto/
├── src/                  # Archivos fuente (.cpp)
│   ├── main.cpp          # Punto de entrada principal
│   ├── modulo_a/
│   │   ├── modulo_a.cpp  # Implementación del Módulo A
│   │   └── otra_func.cpp
│   └── modulo_b/
│       ├── modulo_b.cpp  # Implementación del Módulo B
│       └── sub_modulo_b.cpp
├── include/              # Archivos de cabecera (.h/.hpp)
│   ├── modulo_a/
│   │   └── modulo_a.h    # Declaraciones del Módulo A
│   └── modulo_b/
│       └── modulo_b.h    # Declaraciones del Módulo B
├── test/                 # Archivos de pruebas unitarias
│   ├── test_modulo_a.cpp
│   └── test_modulo_b.cpp
├── build/                # Directorio de construcción (generado por el sistema de construcción)
│   ├── (archivos .o, ejecutables, etc.)
├── docs/                 # Documentación del proyecto
│   └── README.md
│   └── design_document.pdf
├── CMakeLists.txt        # Archivo de configuración de CMake (o Makefile, etc.)
└── .gitignore            # Archivo para Git para ignorar archivos generados/temporales
*/

// Ejemplo de código dentro de un archivo de cabecera (include/modulo_a/modulo_a.h)
/*
#ifndef MODULO_A_H
#define MODULO_A_H

#include <string> // Si el módulo_a necesita std::string

namespace modulo_a {

class Calculadora {
public:
    int sumar(int a, int b);
    double restar(double a, double b);
    void mostrarMensaje(const std::string& msg);
};

} // namespace modulo_a

#endif // MODULO_A_H
*/

// Ejemplo de código dentro de un archivo de implementación (src/modulo_a/modulo_a.cpp)
/*
#include "modulo_a/modulo_a.h" // Incluye su propio header

#include <iostream> // Para std::cout en mostrarMensaje

namespace modulo_a {

int Calculadora::sumar(int a, int b) {
    return a + b;
}

double Calculadora::restar(double a, double b) {
    return a - b;
}

void Calculadora::mostrarMensaje(const std::string& msg) {
    std::cout << "Mensaje de Calculadora: " << msg << std::endl;
}

} // namespace modulo_a
*/

// Ejemplo de código dentro del archivo principal (src/main.cpp)
/*
#include "modulo_a/modulo_a.h" // Incluye el header del módulo A
#include "modulo_b/modulo_b.h" // Si existiera un módulo B

int main() {
    modulo_a::Calculadora calc;
    int resultado_suma = calc.sumar(10, 5);
    calc.mostrarMensaje("El resultado de la suma es: " + std::to_string(resultado_suma));

    // Si tuvieras un módulo B, lo usarías similarmente:
    // modulo_b::ProcesadorDatos proc;
    // proc.procesarAlgo();

    return 0;
}
*/
int main() {
    // Este main es solo un placeholder, el ejemplo es sobre la estructura de archivos.
    std::cout << "Ver el código de ejemplo como comentarios para la estructura de archivos." << std::endl;
    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 8,
    'tittle_level': 'Buenas Prácticas y Estilo de Código',
    'topic': 'Estándares de Codificación',
    'subtopic': 'Comentarios y documentación',
    'definition': r'''
Los comentarios y la documentación son la memoria externa de tu código. Son esenciales para explicar el "por qué" y el "cómo" de lo que haces, más allá de lo que el código mismo puede expresar. Un buen comentario es una inversión de tiempo que se paga mil veces en el futuro, especialmente cuando tú (o alguien más) tiene que volver a ese código después de meses o años.

Seguramente pensarás de qué va todo esto. ¿Te estás preguntando por qué esto importa? 

Pensemos por un momento en un código que funciona perfectamente, pero que no tiene ni un solo comentario. Al principio, tú lo entenderás, pero ¿qué pasa en seis meses? ¿O si un nuevo compañero de equipo tiene que hacerse cargo? Se convierte en un rompecabezas. Los comentarios no deben redundar en lo que el código ya dice (ej. `i++; // incrementar i`), sino explicar la *intención* detrás de una sección de código, la *razón* de una decisión de diseño particular, o cualquier peculiaridad que no sea obvia. Hay varios tipos de comentarios: los de una sola línea (`//`), los de múltiples líneas (`/* ... */`), y los comentarios de documentación. Estos últimos son los más estructurados y, a menudo, están diseñados para ser procesados por herramientas como Doxygen, que generan automáticamente documentación HTML, PDF, etc., a partir de tu código. Documentar las funciones (qué hacen, qué argumentos reciben, qué devuelven, qué errores pueden lanzar) y las clases (su propósito, sus relaciones) es una práctica fundamental para que tu código sea realmente usable y mantenible a largo plazo. Un buen equilibrio entre código autoexplicativo y comentarios concisos y relevantes es la clave.
''',
    'code_example': r'''
#include <iostream>
#include <string>
#include <vector>

/**
 * @brief Clase que representa a un usuario en el sistema.
 *
 * Contiene información básica del usuario como su ID, nombre y correo electrónico.
 * Esta clase es fundamental para la gestión de usuarios y sus perfiles.
 */
class Usuario {
public:
    /**
     * @brief Constructor por defecto de la clase Usuario.
     */
    Usuario() : id(0), nombre(""), email("") {}

    /**
     * @brief Constructor parametrizado de la clase Usuario.
     * @param _id El identificador único del usuario.
     * @param _nombre El nombre completo del usuario.
     * @param _email La dirección de correo electrónico del usuario.
     */
    Usuario(int _id, const std::string& _nombre, const std::string& _email)
        : id(_id), nombre(_nombre), email(_email) {}

    /**
     * @brief Obtiene el ID del usuario.
     * @return El identificador único del usuario.
     */
    int getId() const {
        return id;
    }

    // Comentario de una sola línea:
    // Método para mostrar la información completa del usuario en la consola.
    void mostrarInfo() const {
        std::cout << "ID: " << id
                  << ", Nombre: " << nombre
                  << ", Email: " << email << std::endl;
    }

private:
    int id;          ///< @brief El ID único del usuario.
    std::string nombre; ///< @brief El nombre completo del usuario.
    std::string email;  ///< @brief La dirección de correo electrónico del usuario.
};

/**
 * @brief Calcula el factorial de un número entero no negativo.
 *
 * Esta función es recursiva y puede causar un desbordamiento de pila
 * para números muy grandes.
 *
 * @param n El número entero del cual se calculará el factorial.
 * @return El factorial de n.
 * @throws std::invalid_argument Si n es negativo.
 */
long long factorial(int n) {
    // Comentario explicando una pre-condición o validación
    if (n < 0) {
        throw std::invalid_argument("El número debe ser no negativo para calcular el factorial.");
    }
    // Comentario explicando la lógica de la recursión
    if (n == 0 || n == 1) {
        return 1;
    }
    return n * factorial(n - 1);
}

int main() {
    // Inicialización de un objeto Usuario
    Usuario u1(1, "Alice Smith", "alice@example.com");
    u1.mostrarInfo();

    // Comentario explicando una sección de código importante
    /*
     * Esta sección del código demuestra el uso de la función factorial.
     * Es crucial manejar la excepción para valores negativos,
     * ya que la función factorial no está definida para ellos.
     */
    try {
        std::cout << "Factorial de 5: " << factorial(5) << std::endl;
        std::cout << "Factorial de 0: " << factorial(0) << std::endl;
        // Esto lanzará una excepción
        // std::cout << "Factorial de -3: " << factorial(-3) << std::endl;
    } catch (const std::invalid_argument& e) {
        std::cerr << "Error al calcular factorial: " << e.what() << std::endl;
    }

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 8,
    'tittle_level': 'Buenas Prácticas y Estilo de Código',
    'topic': 'Herramientas de Análisis Estático',
    'subtopic': 'Uso de linters y formatters (clang-tidy, cpplint)',
    'definition': r'''
Los linters y formatters son herramientas que ayudan a mantener tu código limpio y consistente, detectando errores potenciales y asegurando un estilo uniforme.

¿Te estás preguntando por qué esto importa?

En equipos, si cada desarrollador tiene su propio estilo, el código se vuelve inconsistente y difícil de leer. Herramientas como `clang-tidy` y `cpplint` automatizan la detección de problemas: `clang-tidy` realiza un análisis profundo buscando errores y malas prácticas, mientras que `cpplint` se enfoca en cumplir con convenciones de estilo específicas (como las de Google). Usarlos acelera el desarrollo al reducir las discusiones sobre estilo y los ciclos de depuración, mejorando la calidad general del código.
''',
    'code_example': r'''
// Para usar clang-tidy, primero necesitas un archivo compile_commands.json
// (generado por CMake u otros sistemas de construcción).
// Ejemplo de cómo se ejecutaría en la terminal:
// clang-tidy -checks='*' mi_codigo.cpp -- -std=c++17 -Wall

// Para cpplint, la ejecución es más simple:
// cpplint mi_codigo.cpp

#include <iostream>
#include <vector> // Necesario para std::vector
#include <string> // Necesario para std::string

// --- Ejemplo de código con posibles advertencias de linter y problemas de estilo ---

// Problema de estilo: Nombre de variable global en minúsculas (preferencia, no error)
int global_counter = 0;

// Problema de estilo: Nombre de función no sigue una convención (ej. CamelCase o snake_case)
void BadlyNamedFunction() { // Clang-tidy podría sugerir un cambio a snake_case
    // Operación que podría ser ineficiente si no se hace con cuidado
    // clang-tidy puede advertir sobre std::endl si no hay flush necesario.
    std::cout << "Esta es una función." << std::endl;
}

// Advertencia de linter: Variable sin usar
int unused_variable = 10;

// Advertencia de linter: Copia innecesaria de un parámetro grande
void processVector(std::vector<int> my_vec) { // Se copia el vector entero, mejor pasar por const referencia
    std::cout << "Procesando vector..." << std::endl;
    // unused_variable = 20; // Si se usara aquí, la advertencia desaparecería
}

// Problema de estilo: Espaciado inconsistente
int calculateSum ( int a , int b ) {
    return a+b;
}

int main() {
    BadlyNamedFunction();

    std::vector<int> numbers = {1, 2, 3};
    processVector(numbers); // Pasa el vector por copia

    int sum = calculateSum(5, 3);
    std::cout << "Suma: " << sum << std::endl;

    // Advertencia de linter: Uso de un literal mágico sin constante nombrada
    if (global_counter < 100) { // '100' es un literal mágico
        global_counter++;
    }

    return 0;
}

/*
Cómo se verían los errores/advertencias con clang-tidy:

$ clang-tidy your_file.cpp -- -std=c++17
...
your_file.cpp:11:5: warning: function 'BadlyNamedFunction' is not in snake_case [readability-identifier-naming]
void BadlyNamedFunction() {
    ^
    badly_named_function
your_file.cpp:16:9: warning: unused variable 'unused_variable' [clang-tidy]
int unused_variable = 10;
    ^
your_file.cpp:19:24: warning: do not pass a vector by value; take a const reference instead [performance-unnecessary-value-param]
void processVector(std::vector<int> my_vec) {
                       ^~~~~~~~~~~
                       const std::vector<int>&
your_file.cpp:27:1: warning: bad indent. found 4 expected 8 [whitespace/indent]
int calculateSum ( int a , int b ) {
^
your_file.cpp:35:19: warning: do not use magic numbers [readability/magic_numbers]
    if (global_counter < 100) {
                      ^
...

*/
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 8,
    'tittle_level': 'Buenas Prácticas y Estilo de Código',
    'topic': 'Herramientas de Análisis Estático',
    'subtopic': 'Integración en el flujo de trabajo',
    'definition': r'''
Integrar herramientas de análisis estático en tu flujo de trabajo es crucial para asegurar la calidad del código desde el inicio, automatizando revisiones.

¿Te estás preguntando por qué esto importa?

Si no automatizas, los problemas de estilo y errores se acumulan, creando "big bang" de correcciones. La clave es configurar tu IDE para que ejecute el linter y formatter al guardar, y lo más importante, integrar estas herramientas en tu sistema de integración continua (CI/CD). Así, el código se revisa automáticamente antes de fusionarse, detectando problemas temprano y fomentando una cultura de calidad "desde la fuente", haciendo el desarrollo más eficiente.
''',
    'code_example': r'''
// Este código no es directamente ejecutable, sino que ilustra conceptos
// de configuración y flujo de trabajo.

// --- Configuración de IDE (Ejemplo para VS Code settings.json) ---
/*
{
    "C_Cpp.clangTidy.enabled": true, // Habilitar clang-tidy
    "C_Cpp.clangTidy.checks": [
        "performance-*",
        "readability-*",
        "bugprone-*"
        // Otras checks que quieras habilitar/deshabilitar
    ],
    "C_Cpp.clangTidy.args": [
        "-std=c++17",
        "-D_DEBUG" // Si necesitas definir macros para clang-tidy
    ],
    "C_Cpp.clangFormat_enabled": true, // Habilitar clang-format
    "C_Cpp.clangFormat_fallbackStyle": "Google", // Estilo por defecto si no hay .clang-format
    "editor.formatOnSave": true, // Formatear automáticamente al guardar
    "editor.codeActionsOnSave": {
        "source.fixAll": "explicit" // Ejecutar correcciones automáticas (quick fixes) al guardar
    }
}
*/

// --- Archivo de configuración de Clang-Format (.clang-format en la raíz del proyecto) ---
/*
# Esto es un ejemplo de un archivo .clang-format
# Define el estilo de formateo para todo el proyecto

Language: Cpp
BasedOnStyle: Google # Puedes usar otros como LLVM, Mozilla, WebKit, etc.
IndentWidth: 4
UseTab: Never
AlwaysBreakBeforeMultilineStrings: true
BinPackParameters: false
ColumnLimit: 100
Standard: Cpp17
# Muchas más opciones disponibles para un control granular
*/

// --- Ejemplo de script para Integración Continua (Jenkinsfile, .github/workflows/main.yml, etc.) ---
/*
pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: 'your-git-credentials', url: 'your-repo-url'
            }
        }
        stage('Configure CMake') {
            steps {
                // Asumiendo que usas CMake para generar compile_commands.json
                sh 'cmake -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON'
            }
        }
        stage('Static Analysis') {
            steps {
                script {
                    // Ejecutar clang-tidy en todos los archivos .cpp relevantes
                    // Asegúrate de que tu build/compile_commands.json esté presente
                    def cpp_files = findFiles(glob: 'src/**/*.cpp')
                    cpp_files.each { f ->
                        sh "clang-tidy -p build -checks='-*,cppcoreguidelines-*,bugprone-*,performance-*,readability-*' ${f}"
                    }
                    // También podrías ejecutar cpplint
                    // sh 'cpplint --recursive src/'
                }
            }
        }
        stage('Build') {
            steps {
                sh 'cmake --build build'
            }
        }
        stage('Test') {
            steps {
                sh 'cd build && ctest --output-on-failure'
            }
        }
    }
}
*/

int main() {
    // Este código principal es solo un placeholder.
    // El ejemplo se centra en la configuración del flujo de trabajo.
    std::cout << "Ver el código de ejemplo como comentarios para la integración en el flujo de trabajo." << std::endl;
    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 8,
    'tittle_level': 'Buenas Prácticas y Estilo de Código',
    'topic': 'Herramientas de Análisis Estático',
    'subtopic': 'Mejora continua del código',
    'definition': r'''
La mejora continua del código es una mentalidad de evolución constante para elevar la calidad, legibilidad y mantenibilidad de tu base de código.

¿Te estás preguntando por qué esto importa?

Un código que no se mejora acumula "deuda técnica", lo que causa problemas futuros. Las herramientas de análisis estático ayudan a identificar patrones de mejora y sugerir refactorizaciones. Combinar esto con revisiones de código manuales crea un ciclo de retroalimentación potente, donde las máquinas detectan lo obvio y los humanos se enfocan en la lógica. Esta cultura de mejora asegura que cada commit haga tu código un poco mejor, resultando en menos bugs, mantenimiento más sencillo y un equipo más productivo.
''',
    'code_example': r'''
#include <iostream>
#include <string>
#include <vector>
#include <numeric> // Para std::accumulate

// --- Código original (con espacio para mejora) ---
// clang-tidy podría sugerir std::accumulate aquí
double calculateAverage(std::vector<double> numbers) { // Podría ser const std::vector<double>&
    double sum = 0.0;
    for (size_t i = 0; i < numbers.size(); ++i) { // Podría ser un range-based for
        sum += numbers[i];
    }
    if (numbers.empty()) {
        return 0.0;
    }
    return sum / numbers.size();
}

// Clase con posible mejora:
class DataProcessor {
public:
    void processData(int value) {
        // Lógica de procesamiento simple, puede crecer
        if (value > 100) {
            std::cout << "Valor grande." << std::endl;
        } else {
            std::cout << "Valor normal." << std::endl;
        }
    }
};

// --- Código mejorado después de aplicar sugerencias de análisis estático/refactorización ---

// Uso de const reference y std::accumulate para eficiencia y legibilidad
double calculateAverageImproved(const std::vector<double>& numbers) {
    if (numbers.empty()) {
        return 0.0;
    }
    // std::accumulate es más conciso y menos propenso a errores que un bucle manual
    return std::accumulate(numbers.begin(), numbers.end(), 0.0) / numbers.size();
}

// Clase refactorizada con función más específica si 'processData' crece mucho
class DataProcessorImproved {
public:
    void processValue(int value) {
        if (value > 100) {
            handleLargeValue(value);
        } else {
            handleNormalValue(value);
        }
    }

private:
    void handleLargeValue(int value) {
        std::cout << "Manejando valor grande: " << value << std::endl;
        // Lógica específica para valores grandes
    }

    void handleNormalValue(int value) {
        std::cout << "Manejando valor normal: " << value << std::endl;
        // Lógica específica para valores normales
    }
};


int main() {
    std::vector<double> scores = {90.5, 85.0, 92.5, 78.0};

    // Uso del código original (antes de la mejora)
    std::cout << "Promedio (original): " << calculateAverage(scores) << std::endl;

    // Uso del código mejorado
    std::cout << "Promedio (mejorado): " << calculateAverageImproved(scores) << std::endl;

    DataProcessor oldProcessor;
    oldProcessor.processData(50);
    oldProcessor.processData(150);

    DataProcessorImproved newProcessor;
    newProcessor.processValue(50);
    newProcessor.processValue(150);


    // Ejemplo de un error común que el linter podría detectar:
    // int x = 0;
    // if (x = 5) { // Error común: asignación en lugar de comparación
    //     std::cout << "Esto siempre será verdad." << std::endl;
    // }

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 8,
    'tittle_level': 'Buenas Prácticas y Estilo de Código',
    'topic': 'Testing y Depuración',
    'subtopic': 'Frameworks de testing (Google Test, Catch2)',
    'definition': r'''
Los frameworks de testing son herramientas que te permiten escribir pruebas automatizadas para tu código. Son como tener un laboratorio donde puedes verificar que cada pequeña parte de tu programa funciona exactamente como esperas.

¿Te estás preguntando por qué esto importa?

Desarrollar software sin pruebas es como construir un edificio sin inspecciones: puede que funcione al principio, pero los fallos son inevitables y difíciles de rastrear. Frameworks como Google Test y Catch2 simplifican el proceso de escritura de pruebas unitarias. Google Test es una biblioteca robusta y ampliamente utilizada por su flexibilidad y capacidad para manejar pruebas complejas, mientras que Catch2 se destaca por su facilidad de uso y su enfoque en hacer que las pruebas sean tan simples como escribir código normal. Ambos te permiten definir "casos de prueba" para funciones o clases específicas, verificar que los resultados sean los esperados, y reportar si algo salió mal. Usar estas herramientas te da confianza en tu código, te ayuda a detectar errores temprano y facilita la refactorización, ya que sabes si tus cambios rompen algo existente.
''',
    'code_example': r'''
// Para compilar con Google Test:
// Necesitas descargar y compilar Google Test, luego enlazarlo.
// Ejemplo: g++ -std=c++17 -I/path/to/googletest/include -L/path/to/googletest/lib -pthread your_test.cpp -lgtest -lgtest_main -o your_test

// Para compilar con Catch2:
// Generalmente, solo necesitas incluir el único archivo de cabecera de Catch2.
// Ejemplo: g++ -std=c++17 -o your_test your_test.cpp -lstdc++

// --- Ejemplo con Google Test ---
/*
#include "gtest/gtest.h" // Incluir la cabecera de Google Test

// Función simple a probar
int add(int a, int b) {
    return a + b;
}

// Un test suite (conjunto de pruebas) para la función 'add'
TEST(AddFunctionTest, HandlesPositiveNumbers) {
    // Expectativas (assertions)
    EXPECT_EQ(add(2, 3), 5);
    EXPECT_EQ(add(10, 20), 30);
}

TEST(AddFunctionTest, HandlesNegativeNumbers) {
    EXPECT_EQ(add(-2, -3), -5);
    EXPECT_EQ(add(-10, 5), -5);
}

// Otro ejemplo: probando una clase
class Calculator {
public:
    int multiply(int a, int b) {
        return a * b;
    }
};

TEST(CalculatorTest, MultiplyFunction) {
    Calculator calc;
    ASSERT_EQ(calc.multiply(2, 4), 8);
    ASSERT_EQ(calc.multiply(-2, 3), -6);
}

// El main lo proporciona Google Test (gtest_main)
// int main(int argc, char **argv) {
//     ::testing::InitGoogleTest(&argc, argv);
//     return RUN_ALL_TESTS();
// }
*/


// --- Ejemplo con Catch2 (Solo necesitas incluir el header) ---
#define CATCH_CONFIG_MAIN // Esto creará un main para tus pruebas
#include "catch2/catch_test_macros.hpp" // Para C++17+ usa catch_test_macros.hpp
                                     // Para versiones anteriores catch.hpp

// Función simple a probar
int subtract(int a, int b) {
    return a - b;
}

// Un caso de prueba para la función 'subtract'
TEST_CASE("Subtract function works correctly", "[math]") {
    // Diferentes secciones para organizar las pruebas
    SECTION("Positive numbers") {
        REQUIRE(subtract(5, 3) == 2);
        REQUIRE(subtract(10, 7) == 3);
    }

    SECTION("Negative numbers") {
        REQUIRE(subtract(-5, -3) == -2);
        REQUIRE(subtract(10, -5) == 15);
    }

    SECTION("Zero") {
        REQUIRE(subtract(5, 5) == 0);
        REQUIRE(subtract(0, 0) == 0);
    }
}

// Otro ejemplo: probando si una cadena es vacía
std::string getEmptyString() {
    return "";
}

TEST_CASE("Empty string check", "[string]") {
    // CHECK es más suave que REQUIRE (permite que la prueba continúe si falla)
    CHECK(getEmptyString().empty() == true);
    CHECK(getEmptyString().length() == 0);
}


/*
Cómo se verían los resultados de Catch2 al ejecutar:

$ ./your_test
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./your_test is a Catch2 v3.4.0 host application.
Run with --help for options

-------------------------------------------------------------------------------
Subtract function works correctly
  Positive numbers
-------------------------------------------------------------------------------
your_test.cpp:48: SECTION: Positive numbers

-------------------------------------------------------------------------------
Subtract function works correctly
  Negative numbers
-------------------------------------------------------------------------------
your_test.cpp:53: SECTION: Negative numbers

-------------------------------------------------------------------------------
Subtract function works correctly
  Zero
-------------------------------------------------------------------------------
your_test.cpp:58: SECTION: Zero

-------------------------------------------------------------------------------
Empty string check
-------------------------------------------------------------------------------
your_test.cpp:68:

All tests passed (6 assertions in 2 test cases)

*/
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 8,
    'tittle_level': 'Buenas Prácticas y Estilo de Código',
    'topic': 'Testing y Depuración',
    'subtopic': 'Técnicas de depuración (gdb, lldb)',
    'definition': r'''
La depuración es el arte de encontrar y corregir errores en tu código. Es como ser un detective que sigue pistas para descubrir por qué algo no funciona como debería.

¿Te estás preguntando por qué esto importa?

Cuando tu programa falla o produce resultados inesperados, leer el código no siempre revela el problema. Necesitas ver qué está ocurriendo *mientras* el programa se ejecuta. Aquí es donde entran los depuradores como GDB (GNU Debugger) y LLDB (parte del proyecto LLVM). Ambas son herramientas de línea de comandos que te permiten ejecutar tu programa paso a paso, inspeccionar el valor de las variables en cualquier punto, establecer "puntos de interrupción" (breakpoints) para pausar la ejecución en líneas específicas, y seguir el flujo de control. GDB es un clásico, muy potente y compatible con GCC. LLDB es más moderno y se integra bien con Clang y Xcode. Dominar estas herramientas es fundamental para cualquier desarrollador, ya que te permiten ir más allá de los mensajes de error simples y entender realmente la causa raíz de los fallos, ahorrándote horas de frustración.
''',
    'code_example': r'''
// Para compilar este código con información de depuración (necesario para gdb/lldb):
// g++ -g -o mi_programa_debug mi_programa_debug.cpp -std=c++17

// Para ejecutar con gdb:
// gdb ./mi_programa_debug
// (dentro de gdb)
//   break main      // Establecer un breakpoint en el inicio de main
//   run             // Ejecutar hasta el breakpoint
//   next            // Ir a la siguiente línea
//   step            // Entrar en una función
//   print variable  // Mostrar el valor de una variable
//   continue        // Continuar la ejecución
//   quit            // Salir

// Para ejecutar con lldb (similar a gdb):
// lldb ./mi_programa_debug
// (dentro de lldb)
//   b main          // Establecer un breakpoint en el inicio de main
//   r               // Ejecutar hasta el breakpoint
//   n               // Ir a la siguiente línea
//   s               // Entrar en una función
//   p variable      // Mostrar el valor de una variable
//   c               // Continuar la ejecución
//   q               // Salir


#include <iostream>
#include <vector>
#include <string>

int calculate_sum(int a, int b) {
    int sum = a + b; // Puedes poner un breakpoint aquí para ver 'a', 'b' y 'sum'
    return sum;
}

void process_data(const std::vector<std::string>& data) {
    for (size_t i = 0; i <= data.size(); ++i) { // OJO: Posible error aquí (<= en lugar de <)
        if (i < data.size()) { // Esta comprobación mitigará el crash, pero no el error lógico de iteración
            std::cout << "Procesando: " << data[i] << std::endl;
        } else {
            std::cout << "¡Intentando acceder fuera de límites en el índice " << i << "!" << std::endl;
            // Aquí un depurador te mostraría que 'i' es igual a data.size(), causando un acceso inválido
            // si la condición `if (i < data.size())` no existiera o se evaluara diferente.
        }
    }
}

int main() {
    int x = 10;
    int y = 5;
    int result = calculate_sum(x, y); // Llama a la función calculate_sum
    std::cout << "Resultado de la suma: " << result << std::endl;

    std::vector<std::string> names = {"Alice", "Bob", "Charlie"};
    process_data(names); // Llama a la función process_data

    std::cout << "Programa terminado." << std::endl;

    return 0;
}

/*
Ejemplo de sesión GDB (simplificada):

$ gdb ./mi_programa_debug
(gdb) break 11             // Breakpoint en 'int sum = a + b;'
Breakpoint 1 at 0x400877: file mi_programa_debug.cpp, line 11.
(gdb) run
Starting program: /home/user/mi_programa_debug

Breakpoint 1, calculate_sum (a=10, b=5) at mi_programa_debug.cpp:11
11          int sum = a + b;
(gdb) print a
$1 = 10
(gdb) print b
$2 = 5
(gdb) next               // Ejecuta la línea actual
12          return sum;
(gdb) print sum
$3 = 15
(gdb) break 18           // Breakpoint en el bucle de process_data
Breakpoint 2 at 0x4008d7: file mi_programa_debug.cpp, line 18.
(gdb) continue
Continuing.
Procesando: Alice
Procesando: Bob
Procesando: Charlie
¡Intentando acceder fuera de límites en el índice 3!
Breakpoint 2, process_data (data=std::vector of length 3, capacity 3 = {...}) at mi_programa_debug.cpp:18
18      for (size_t i = 0; i <= data.size(); ++i) {
(gdb) print i
$4 = 3                  // Aquí vemos que 'i' es 3, mientras que data.size() es 3
(gdb) continue
Continuing.
Programa terminado.
[Inferior 1 (process 23456) exited normally]
(gdb) quit

*/
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Mid',
    'level': 8,
    'tittle_level': 'Buenas Prácticas y Estilo de Código',
    'topic': 'Testing y Depuración',
    'subtopic': 'Estrategias de pruebas unitarias y de integración',
    'definition': r'''
Las estrategias de pruebas definen cómo y cuándo probar tu código, dividiéndolo en diferentes niveles de alcance. No es solo "hacer pruebas", sino saber qué tipo de prueba aplicar en cada situación.

¿Te estás preguntando por qué esto importa?

Confiar únicamente en pruebas manuales al final del ciclo de desarrollo es lento, costoso y propenso a errores. Por eso, distinguimos entre pruebas unitarias y de integración. Las **pruebas unitarias** se centran en la unidad más pequeña de código (una función, un método, una clase), probándola de forma aislada para asegurar que su lógica interna es correcta. Son rápidas, fáciles de escribir y te dan una retroalimentación inmediata sobre pequeños cambios. Las **pruebas de integración**, por otro lado, verifican que diferentes unidades o módulos de tu sistema trabajen juntos correctamente. Prueban las interacciones entre componentes, las interfaces, y cómo fluyen los datos entre ellos. No se centran en la lógica interna de cada componente, sino en cómo se comportan al interactuar. Una estrategia común es la "pirámide de pruebas": muchas pruebas unitarias, menos pruebas de integración, y aún menos pruebas de extremo a extremo (end-to-end). Esto te asegura una cobertura amplia y una detección temprana de errores, construyendo una base de código más robusta y fiable.
''',
    'code_example': r'''
#include <iostream>
#include <string>
#include <vector>
#include <stdexcept> // Para std::runtime_error

// --- Componente 1: Validador de Email (Unidad a probar) ---
namespace EmailValidator {
    bool isValid(const std::string& email) {
        // Lógica de validación muy simplificada para el ejemplo
        // En un caso real, esto sería mucho más complejo
        return email.find('@') != std::string::npos && email.find('.') != std::string::npos;
    }
}

// --- Componente 2: Registrador de Usuario (Unidad a probar, pero también involucra validación) ---
class UserRepository {
public:
    // Simula el almacenamiento de usuarios en una base de datos o archivo
    void saveUser(const std::string& username, const std::string& email) {
        // En un escenario real, aquí se guardarían los datos
        std::cout << "Guardando usuario: " << username << " con email: " << email << std::endl;
        savedUsers.push_back({username, email});
    }

    bool userExists(const std::string& username) const {
        for (const auto& user : savedUsers) {
            if (user.first == username) return true;
        }
        return false;
    }

private:
    std::vector<std::pair<std::string, std::string>> savedUsers;
};

// --- Servicio de Registro (Integra los componentes anteriores) ---
class RegistrationService {
public:
    RegistrationService(UserRepository& repo) : userRepo(repo) {}

    bool registerUser(const std::string& username, const std::string& email) {
        if (!EmailValidator::isValid(email)) {
            std::cerr << "Error: Email inválido." << std::endl;
            return false;
        }
        if (userRepo.userExists(username)) {
            std::cerr << "Error: Nombre de usuario ya existe." << std::endl;
            return false;
        }
        userRepo.saveUser(username, email);
        return true;
    }

private:
    UserRepository& userRepo;
};


// --- Ejemplos conceptuales de Pruebas ---
// (En un proyecto real, esto usaría un framework como Google Test o Catch2)

// --- Pruebas Unitarias (enfocadas en componentes individuales) ---
void runEmailValidatorUnitTests() {
    std::cout << "\n--- Ejecutando Pruebas Unitarias para EmailValidator ---" << std::endl;
    // Prueba unitaria 1: Email válido
    if (EmailValidator::isValid("test@example.com")) {
        std::cout << "[PASSED] Email válido: test@example.com" << std::endl;
    } else {
        std::cout << "[FAILED] Email válido: test@example.com" << std::endl;
    }

    // Prueba unitaria 2: Email sin '@'
    if (!EmailValidator::isValid("testexample.com")) {
        std::cout << "[PASSED] Email sin '@': testexample.com" << std::endl;
    } else {
        std::cout << "[FAILED] Email sin '@': testexample.com" << std::endl;
    }
    // ... más pruebas para diferentes escenarios del validador
}

void runUserRepositoryUnitTests() {
    std::cout << "\n--- Ejecutando Pruebas Unitarias para UserRepository ---" << std::endl;
    UserRepository repo;
    repo.saveUser("john_doe", "john@example.com");
    if (repo.userExists("john_doe")) {
        std::cout << "[PASSED] userExists después de guardar." << std::endl;
    } else {
        std::cout << "[FAILED] userExists después de guardar." << std::endl;
    }
    if (!repo.userExists("jane_doe")) {
        std::cout << "[PASSED] userExists para usuario no existente." << std::endl;
    } else {
        std::cout << "[FAILED] userExists para usuario no existente." << std::endl;
    }
}


// --- Pruebas de Integración (enfocadas en la interacción entre componentes) ---
void runRegistrationServiceIntegrationTests() {
    std::cout << "\n--- Ejecutando Pruebas de Integración para RegistrationService ---" << std::endl;
    UserRepository repo; // Usa una instancia real (o mock si es una prueba de integración más controlada)
    RegistrationService service(repo);

    // Prueba de integración 1: Registro exitoso
    if (service.registerUser("new_user", "new@email.com")) {
        std::cout << "[PASSED] Registro exitoso." << std::endl;
        if (repo.userExists("new_user")) {
            std::cout << "[PASSED] Usuario 'new_user' existe en el repositorio." << std::endl;
        } else {
            std::cout << "[FAILED] Usuario 'new_user' no existe en el repositorio después del registro." << std::endl;
        }
    } else {
        std::cout << "[FAILED] Registro exitoso." << std::endl;
    }

    // Prueba de integración 2: Email inválido
    if (!service.registerUser("another_user", "invalid-email")) {
        std::cout << "[PASSED] Rechazo de email inválido." << std::endl;
    } else {
        std::cout << "[FAILED] Aceptó email inválido." << std::endl;
    }

    // Prueba de integración 3: Nombre de usuario duplicado
    if (!service.registerUser("new_user", "other@email.com")) { // 'new_user' ya existe
        std::cout << "[PASSED] Rechazo de nombre de usuario duplicado." << std::endl;
    } else {
        std::cout << "[FAILED] Aceptó nombre de usuario duplicado." << std::endl;
    }
}


int main() {
    runEmailValidatorUnitTests();
    runUserRepositoryUnitTests();
    runRegistrationServiceIntegrationTests();

    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 8,
    'tittle_level': 'Buenas Prácticas y Estilo de Código',
    'topic': 'Gestión de Dependencias y Build Systems',
    'subtopic': 'Uso de CMake y Makefiles',
    'definition': r'''
Los "build systems" o sistemas de construcción como CMake y Makefiles son herramientas que automatizan el proceso de compilar tu código fuente en un programa ejecutable o una biblioteca. No solo compilan, sino que gestionan las dependencias entre tus archivos.

¿Te estás preguntando por qué esto importa?

Cuando tu proyecto crece y tiene muchos archivos fuente, bibliotecas externas y configuraciones complejas, compilarlo manualmente se vuelve una pesadilla. Makefiles son scripts que le dicen al compilador qué archivos dependen de cuáles y cómo deben compilarse. Son potentes, pero pueden volverse muy complejos y son dependientes del sistema operativo. CMake, por otro lado, es un "generador" de sistemas de construcción. Tú escribes un `CMakeLists.txt` de alto nivel, y CMake genera los archivos necesarios (como Makefiles o proyectos de Visual Studio) para tu sistema específico. Esto hace que tu proyecto sea portátil entre diferentes sistemas operativos y entornos de desarrollo. Usar estas herramientas no solo te ahorra tiempo y errores al compilar, sino que también estandariza el proceso para todo el equipo, facilitando la colaboración.
''',
    'code_example': r'''
// Este ejemplo no es un código C++ ejecutable, sino una representación de archivos
// de configuración para CMake y Make.

// --- Ejemplo de un Makefile simple (Makefile en la raíz del proyecto) ---
/*
# Variables
CXX = g++            # Compilador C++
CXXFLAGS = -Wall -std=c++17 # Flags del compilador

# Nombre del ejecutable final
TARGET = mi_programa

# Archivos fuente
SRCS = main.cpp funcion.cpp

# Archivos objeto (se generan a partir de los fuentes)
OBJS = $(SRCS:.cpp=.o)

# Regla por defecto: construye el objetivo
all: $(TARGET)

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) $(OBJS) -o $(TARGET)

# Regla para compilar archivos .cpp a .o
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Regla para limpiar los archivos generados
clean:
	rm -f $(OBJS) $(TARGET)
*/

// --- Ejemplo de un CMakeLists.txt simple (CMakeLists.txt en la raíz del proyecto) ---
/*
# Versión mínima de CMake requerida
cmake_minimum_required(VERSION 3.10)

# Nombre del proyecto
project(MiProyecto CXX)

# Establecer el estándar C++
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Añadir un ejecutable
# my_executable es el nombre del binario
# main.cpp funcion.cpp son los archivos fuente
add_executable(my_executable main.cpp funcion.cpp)

# Si tuvieras una biblioteca, podrías hacer algo como:
# add_library(my_library STATIC src/lib_func.cpp)
# target_link_libraries(my_executable my_library)

# Si necesitas añadir un directorio con headers
# include_directories(include)

# Para un proyecto más complejo con subdirectorios:
# add_subdirectory(src)
# add_subdirectory(tests)
*/

// --- Ejemplo de archivos fuente que usarían los build systems ---

// main.cpp
/*
#include <iostream>
#include "funcion.h" // Suponiendo que hay un funcion.h

int main() {
    std::cout << "Hola desde main!" << std::endl;
    say_hello_from_function();
    return 0;
}
*/

// funcion.h
/*
#ifndef FUNCION_H
#define FUNCION_H

void say_hello_from_function();

#endif // FUNCION_H
*/

// funcion.cpp
/*
#include "funcion.h"
#include <iostream>

void say_hello_from_function() {
    std::cout << "Hola desde la función!" << std::endl;
}
*/

int main() {
    // Este main es solo un placeholder.
    // El ejemplo se centra en la configuración de los build systems.
    std::cout << "Ver el código de ejemplo como comentarios para CMake y Makefiles." << std::endl;
    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 8,
    'tittle_level': 'Buenas Prácticas y Estilo de Código',
    'topic': 'Gestión de Dependencias y Build Systems',
    'subtopic': 'Gestión de paquetes (vcpkg, Conan)',
    'definition': r'''
Los gestores de paquetes son herramientas que simplifican enormemente el uso de bibliotecas de terceros en tus proyectos de C++. En lugar de descargar, compilar y configurar manualmente cada dependencia, ellos lo hacen por ti.

No sé tú, pero a mí esto al principio me costó. Solía perder horas descargando y configurando bibliotecas.

¿Te estás preguntando por qué esto importa?

C++ no tiene un gestor de paquetes estándar y universal como pip en Python o npm en Node.js, lo que históricamente ha sido un punto débil. Sin embargo, herramientas como vcpkg de Microsoft y Conan de JFrog han surgido para llenar este vacío. vcpkg es un gestor de paquetes centrado en la plataforma y el compilador, que facilita la adquisición y construcción de bibliotecas de código abierto para Windows, Linux y macOS. Conan, por otro lado, es un gestor de paquetes distribuido y agnóstico de la plataforma y el sistema de construcción, ideal para equipos grandes y entornos con muchas variantes de configuración. Ambas herramientas automatizan la descarga, compilación e integración de bibliotecas externas, resolviendo las dependencias transitivas y asegurando que las bibliotecas se compilen con las opciones correctas para tu proyecto. Esto reduce drásticamente el tiempo de configuración y los errores, permitiéndote concentrarte en escribir código, no en configurar bibliotecas.
''',
    'code_example': r'''
// Este ejemplo no es un código C++ ejecutable, sino que muestra cómo
// interactuarías con vcpkg o Conan desde la línea de comandos
// y conceptualmente cómo afecta tu CMakeLists.txt.

// --- Instalando una librería con vcpkg (Ejemplo de línea de comandos) ---
/*
// Instalar una librería (ej. jsoncpp) para Windows x64 estática
vcpkg install jsoncpp:x64-windows-static

// Instalar una librería para Linux
vcpkg install jsoncpp

// Listar las librerías instaladas
vcpkg list
*/

// --- Integrando vcpkg con CMake (ejemplo en CMakeLists.txt) ---
/*
# Al configurar CMake, se le puede decir que use vcpkg
# cmake -B build -DCMAKE_TOOLCHAIN_FILE=/path/to/vcpkg/scripts/buildsystems/vcpkg.cmake

cmake_minimum_required(VERSION 3.10)
project(MyJsonApp CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Buscar y enlazar la librería jsoncpp instalada por vcpkg
find_package(jsoncpp CONFIG REQUIRED)

add_executable(my_json_app main.cpp)

# Enlazar la librería a tu ejecutable
target_link_libraries(my_json_app PRIVATE jsoncpp)
*/

// --- Instalando una librería con Conan (Ejemplo de línea de comandos) ---
/*
// Crear un archivo conanfile.txt para especificar las dependencias
// conanfile.txt:
// [requires]
// jsoncpp/1.9.5
// [generators]
// CMakeDeps
// CMakeToolchain

// Instalar las dependencias (creará un perfil por defecto si no existe)
conan install . --output-folder=build --build=missing

// Después de instalar, puedes integrar con CMake:
// cmake -B build -DCMAKE_TOOLCHAIN_FILE=build/conan_toolchain.cmake
// cmake --build build
*/

// --- Integrando Conan con CMake (ejemplo en CMakeLists.txt) ---
/*
cmake_minimum_required(VERSION 3.10)
project(MyConanApp CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Si usas CMakeToolchain de Conan, esto ya estaría configurado
# include(conan_toolchain.cmake)

# Buscar y enlazar la librería jsoncpp
find_package(jsoncpp REQUIRED)

add_executable(my_conan_app main.cpp)

# Enlazar la librería a tu ejecutable
target_link_libraries(my_conan_app PRIVATE jsoncpp::jsoncpp)
*/


// --- Ejemplo de código C++ que usaría una librería gestionada (ej. jsoncpp) ---
// main.cpp
/*
#include <iostream>
#include <json/json.h> // De la librería JsonCpp

int main() {
    Json::Value root;
    root["name"] = "Alice";
    root["age"] = 30;

    Json::StreamWriterBuilder builder;
    builder["indentation"] = "   "; // Indentación para una salida bonita
    std::string json_string = Json::writeString(builder, root);

    std::cout << "JSON generado:\n" << json_string << std::endl;

    // Parsear el JSON de vuelta
    Json::CharReaderBuilder readerBuilder;
    Json::CharReader* reader = readerBuilder.newCharReader();
    Json::Value parsedRoot;
    std::string errs;
    bool parsingSuccessful = reader->parse(json_string.data(), json_string.data() + json_string.size(), &parsedRoot, &errs);
    delete reader;

    if (parsingSuccessful) {
        std::cout << "Nombre parseado: " << parsedRoot["name"].asString() << std::endl;
    } else {
        std::cerr << "Error al parsear JSON: " << errs << std::endl;
    }

    return 0;
}
*/
int main() {
    // Este main es solo un placeholder.
    // El ejemplo se centra en la gestión de paquetes.
    std::cout << "Ver el código de ejemplo como comentarios para vcpkg y Conan." << std::endl;
    return 0;
}
'''
  });

  await db.insert('programming_content', {
    'language': 'C++',
    'module': 'Sr',
    'level': 8,
    'tittle_level': 'Buenas Prácticas y Estilo de Código',
    'topic': 'Gestión de Dependencias y Build Systems',
    'subtopic': 'Automatización del proceso de construcción',
    'definition': r'''
La automatización del proceso de construcción se refiere a usar herramientas para compilar, enlazar, probar y empaquetar tu código de forma automática, sin intervención manual en cada paso.

¿Te estás preguntando por qué esto importa?

Cuando tu proyecto crece, el proceso de llevar el código fuente a un ejecutable final puede volverse un conjunto complejo de comandos y pasos. Realizar esto manualmente es tedioso, propenso a errores y un cuello de botella significativo. Automatizar significa que un solo comando o un sistema de CI/CD puede manejar todo el flujo: desde obtener las dependencias (con gestores de paquetes como vcpkg o Conan), compilar los archivos fuente (usando CMake o Make), ejecutar las pruebas (con frameworks como Google Test), hasta generar la documentación y crear los instaladores. Esto garantiza builds consistentes, acelera la entrega de nuevas características, facilita el trabajo en equipo y te permite detectar problemas mucho antes en el ciclo de desarrollo. La automatización es clave para proyectos C++ modernos y eficientes.
''',
    'code_example': r'''
// Este ejemplo es conceptual y combina las ideas de los subtemas anteriores
// en un flujo de trabajo automatizado.

// --- Flujo de trabajo automatizado típico en un entorno de CI/CD (ej. Jenkins, GitHub Actions) ---

// 1. Clonar el repositorio
/*
git clone https://github.com/your_user/your_cpp_project.git
cd your_cpp_project
*/

// 2. Instalar dependencias (usando un gestor de paquetes)
/*
// Si usas vcpkg:
// (Asume que vcpkg está configurado o se instala al inicio)
// vcpkg install --triplet x64-linux-static # o el triplet que necesites
*/
/*
// Si usas Conan:
// conan install . --output-folder=build --build=missing
*/

// 3. Configurar el sistema de construcción (ej. CMake)
/*
// Generar los archivos de construcción para tu sistema
// Incluye la toolchain de vcpkg o conan si aplica
// cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=/path/to/vcpkg/scripts/buildsystems/vcpkg.cmake
// cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=build/conan_toolchain.cmake
*/

// 4. Compilar el proyecto
/*
// Esto usará los Makefiles generados por CMake en Linux/macOS o Visual Studio en Windows
cmake --build build --config Release
*/

// 5. Ejecutar pruebas unitarias y de integración
/*
// Si usas CTest (integrado con CMake y Google Test/Catch2)
cd build
ctest --output-on-failure
*/

// 6. Ejecutar análisis estático (opcional, pero muy recomendado)
/*
// Si usas clang-tidy (requiere compile_commands.json, generado por CMake)
// clang-tidy -p build -checks='-*,cppcoreguidelines-*,bugprone-*,performance-*,readability-*' src/**/*.cpp
*/

// 7. Empaquetar el resultado (opcional)
/*
// Crear un instalador, un zip, etc.
// cmake --build build --target package
*/

// --- Concepto de un script simple para automatizar localmente (build.sh en Linux/macOS) ---
/*
#!/bin/bash

# Limpiar build anterior
rm -rf build

# Crear directorio de build
mkdir build
cd build

# Configurar CMake
cmake .. -DCMAKE_BUILD_TYPE=Debug

# Compilar
cmake --build .

# Ejecutar pruebas (si las hay)
./tests/my_test_runner # Asumiendo un ejecutable de pruebas

# Volver al directorio raíz
cd ..

echo "Proceso de construcción y prueba completado."
*/

int main() {
    // Este main es solo un placeholder.
    // El ejemplo se centra en la automatización del proceso de construcción.
    std::cout << "Ver el código de ejemplo como comentarios para la automatización del proceso de construcción." << std::endl;
    return 0;
}
'''
  });
}
