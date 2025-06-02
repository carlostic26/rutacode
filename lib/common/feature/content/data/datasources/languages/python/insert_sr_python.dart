import 'package:sqflite_common/sqlite_api.dart';

Future<void> insertPythonSrLevel1Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Patrones de Diseño',
    'topic': 'Patrones Creacionales',
    'subtopic': 'Singleton',
    'definition': '''
El patrón Singleton es uno de los patrones creacionales más conocidos, y su objetivo es garantizar que una clase tenga una única instancia durante toda la ejecución del programa. Es útil cuando necesitas un punto de acceso global a un recurso compartido, como una conexión a una base de datos o un archivo de configuración.

Pensemos por un momento en un escenario donde múltiples partes de tu aplicación intentan acceder a la misma configuración. Sin Singleton, podrías terminar con varias instancias cargando los mismos datos, lo que sería ineficiente y hasta peligroso si hay escritura involucrada. Aquí es donde Singleton entra en juego, asegurando que todos accedan a la misma instancia.

La implementación clásica en Python implica sobrescribir el método `__new__` para controlar la creación de instancias. También se suele usar un atributo de clase para almacenar la única instancia. Es importante destacar que Singleton no es siempre la mejor solución; su mal uso puede llevar a un acoplamiento excesivo en el código. Empresas como Instagram lo han utilizado para gestionar conexiones a bases de datos de manera eficiente, pero también han tenido que refactorizar cuando el patrón empezó a complicar las pruebas unitarias.
''',
    'code_example': '''
# Ejemplo correcto de Singleton en Python
class DatabaseConnection:
    _instance = None

    def __new__(cls):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
            cls._instance.initialize_connection()
        return cls._instance

    def initialize_connection(self):
        print("Conexión a la base de datos establecida")

# Uso
db1 = DatabaseConnection()
db2 = DatabaseConnection()
print(db1 is db2)  # True, ambas variables apuntan a la misma instancia

# Ejemplo incorrecto (sin Singleton)
class ConfigManager:
    pass

config1 = ConfigManager()
config2 = ConfigManager()
print(config1 is config2)  # False, son instancias diferentes
''',
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Patrones de Diseño',
    'topic': 'Patrones Creacionales',
    'subtopic': 'Factory',
    'definition': '''
El patrón Factory es otro de los patrones creacionales, y su propósito es proporcionar una interfaz para crear objetos sin especificar sus clases concretas. Es especialmente útil cuando la lógica de creación de objetos es compleja o cuando quieres desacoplar el código que usa los objetos del código que los crea.

¿Te estás preguntando por qué esto importa? Imagina que estás desarrollando una aplicación que necesita soportar múltiples tipos de bases de datos (MySQL, PostgreSQL, SQLite). Sin Factory, tendrías condicionales por todos lados para instanciar la clase correcta. Con Factory, encapsulas esa lógica en un solo lugar, haciendo el código más mantenible y escalable.

En Python, este patrón se puede implementar de varias formas: desde funciones simples que devuelven objetos hasta clases abstractas con métodos de fábrica. Un detalle interesante es que Django utiliza este patrón en su ORM para crear instancias de modelos dinámicamente. La flexibilidad que ofrece Factory es una de las razones por las que es tan popular en frameworks y librerías grandes.
''',
    'code_example': '''
# Ejemplo correcto de Factory en Python
class Database:
    def connect(self):
        pass

class MySQL(Database):
    def connect(self):
        return "Conectado a MySQL"

class PostgreSQL(Database):
    def connect(self):
        return "Conectado a PostgreSQL"

def database_factory(db_type):
    if db_type == "mysql":
        return MySQL()
    elif db_type == "postgresql":
        return PostgreSQL()
    else:
        raise ValueError("Tipo de base de datos no soportado")

# Uso
db = database_factory("mysql")
print(db.connect())  # "Conectado a MySQL"

# Ejemplo incorrecto (sin Factory)
db_type = "mysql"
if db_type == "mysql":
    db = MySQL()
elif db_type == "postgresql":
    db = PostgreSQL()
else:
    raise ValueError("Tipo de base de datos no soportado")
''',
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Patrones de Diseño',
    'topic': 'Patrones Creacionales',
    'subtopic': 'Builder',
    'definition': '''
El patrón Builder es un patrón creacional que te permite construir objetos complejos paso a paso. A diferencia de otros patrones creacionales, Builder no requiere que todos los atributos del objeto sean proporcionados de una vez. Esto es especialmente útil cuando estás trabajando con objetos que tienen muchos parámetros opcionales o configuraciones complejas.

No sé tú, pero a mí esto al principio me costó 🤯. La idea de separar la construcción de un objeto de su representación parecía innecesaria, hasta que me encontré con clases que tenían constructores con docenas de parámetros. Builder resuelve este problema permitiendo que configures solo las partes del objeto que necesitas.

En Python, este patrón se puede implementar usando una clase Builder separada o métodos encadenados (method chaining). Un caso de uso clásico es la construcción de consultas SQL complejas, donde cada método del Builder añade una cláusula diferente. Empresas como Elasticsearch utilizan este patrón en sus clientes oficiales para construir consultas de búsqueda de manera fluida y legible.
''',
    'code_example': '''
# Ejemplo correcto de Builder en Python
class Pizza:
    def __init__(self):
        self.tamaño = None
        self.masa = None
        self.queso = False
        self.pepperoni = False
        self.champiñones = False

    def __str__(self):
        return f"Pizza: {self.tamaño}', masa {self.masa}, queso: {self.queso}, pepperoni: {self.pepperoni}, champiñones: {self.champiñones}"

class PizzaBuilder:
    def __init__(self):
        self.pizza = Pizza()

    def set_tamaño(self, tamaño):
        self.pizza.tamaño = tamaño
        return self

    def set_masa(self, masa):
        self.pizza.masa = masa
        return self

    def add_queso(self):
        self.pizza.queso = True
        return self

    def add_pepperoni(self):
        self.pizza.pepperoni = True
        return self

    def add_champiñones(self):
        self.pizza.champiñones = True
        return self

    def build(self):
        return self.pizza

# Uso
builder = PizzaBuilder()
pizza = (builder.set_tamaño('mediana')
               .set_masa('delgada')
               .add_queso()
               .add_pepperoni()
               .build())
print(pizza)

# Ejemplo incorrecto (sin Builder)
pizza = Pizza()
pizza.tamaño = 'mediana'
pizza.masa = 'delgada'
pizza.queso = True
pizza.pepperoni = True
# ¿Qué pasa si olvido configurar un atributo?
''',
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Patrones de Diseño',
    'topic': 'Patrones Estructurales',
    'subtopic': 'Adapter',
    'definition': '''
El patrón Adapter actúa como un puente entre dos interfaces incompatibles, permitiendo que trabajen juntas sin modificar su código fuente. Es como un traductor que ayuda a dos personas que hablan idiomas diferentes a entenderse.

Seguramente pensarás que esto suena abstracto, pero es más común de lo que crees. ¿Alguna vez has usado un cargador universal para conectar un dispositivo con un enchufe diferente? Eso es exactamente lo que hace el Adapter en programación: adapta una interfaz para que otra pueda usarla sin problemas.

En Python, este patrón se implementa creando una clase que "envuelve" el objeto con la interfaz incompatible y expone los métodos que el cliente espera. Un caso real es cuando bibliotecas de terceros cambian su API y necesitas mantener compatibilidad con versiones anteriores. Empresas como PayPal han utilizado este patrón para integrar sistemas legacy con nuevas tecnologías sin romper funcionalidad existente.
''',
    'code_example': '''
# Ejemplo correcto de Adapter en Python
class EuropeanSocket:
    def voltage(self):
        return 230

    def live(self):
        return 1

    def neutral(self):
        return -1

class USASocket:
    def voltage(self):
        return 120

    def live(self):
        return 1

    def neutral(self):
        return -1
    def ground(self):
        return 0

class SocketAdapter:
    def __init__(self, socket):
        self.socket = socket

    def voltage(self):
        return self.socket.voltage()

    def live(self):
        return self.socket.live()

    def neutral(self):
        return self.socket.neutral()

    def ground(self):
        return 0  # Valor por defecto para sockets sin tierra

# Uso
european_socket = EuropeanSocket()
adapter = SocketAdapter(european_socket)
print(f"Voltaje: {adapter.voltage()}, Tierra: {adapter.ground()}")

# Ejemplo incorrecto (sin Adapter)
try:
    usa_socket = USASocket()
    print(usa_socket.ground())  # Funciona
    print(european_socket.ground())  # Error: EuropeanSocket no tiene ground()
except AttributeError as e:
    print(f"Error: {e}")
''',
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Patrones de Diseño',
    'topic': 'Patrones Estructurales',
    'subtopic': 'Decorator',
    'definition': '''
El patrón Decorator permite añadir funcionalidad a un objeto dinámicamente sin alterar su estructura. A diferencia de la herencia, que es estática, los decoradores ofrecen una forma flexible de extender comportamiento en tiempo de ejecución.

Vamos a ver de qué se trata todo esto. Imagina que tienes un café básico y quieres añadir leche, azúcar o canela. En lugar de crear clases como "CaféConLeche", "CaféConAzúcar", etc., el patrón Decorator te permite "decorar" el café base con los extras que quieras, combinándolos como prefieras.

En Python, este patrón tiene una implementación nativa con la sintaxis @decorator, pero también puede implementarse mediante clases. Un uso avanzado es en frameworks web como Flask, donde los decoradores se usan para definir rutas (@app.route). Instagram utiliza este patrón extensivamente para añadir funcionalidades como logging o caching a sus servicios sin modificar el código core.
''',
    'code_example': '''
# Ejemplo correcto de Decorator en Python (implementación con clases)
class Coffee:
    def cost(self):
        return 5

class MilkDecorator:
    def __init__(self, coffee):
        self._coffee = coffee

    def cost(self):
        return self._coffee.cost() + 2

class SugarDecorator:
    def __init__(self, coffee):
        self._coffee = coffee

    def cost(self):
        return self._coffee.cost() + 1

# Uso
simple_coffee = Coffee()
print(f"Café simple: {simple_coffee.cost()}")

coffee_with_milk = MilkDecorator(simple_coffee)
print(f"Café con leche: {coffee_with_milk.cost()}")

coffee_with_milk_and_sugar = SugarDecorator(coffee_with_milk)
print(f"Café con leche y azúcar: {coffee_with_milk_and_sugar.cost()}")

# Ejemplo con sintaxis Python @decorator
def logger(func):
    def wrapper(*args, **kwargs):
        print(f"Llamando a {func.__name__}")
        return func(*args, **kwargs)
    return wrapper

@logger
def say_hello(name):
    print(f"Hola {name}")

say_hello("Mundo")
''',
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Patrones de Diseño',
    'topic': 'Patrones Estructurales',
    'subtopic': 'Facade',
    'definition': '''
El patrón Facade proporciona una interfaz simplificada a un sistema complejo. Es como el panel de control de una nave espacial: oculta la complejidad de los subsistemas y ofrece una interfaz sencilla para operar todo.

¿Te estás preguntando cuándo usar esto? Piensa en cómo inicias tu computadora: solo presionas un botón, pero detrás ocurren cientos de procesos complejos. Facade hace lo mismo en software: esconde la complejidad detrás de una fachada simple.

En Python, este patrón se implementa creando una clase que coordina los subsistemas subyacentes. Un ejemplo clásico es el uso en bibliotecas como Requests, que ocultan la complejidad de HTTP detrás de métodos simples como get() y post(). Empresas como Uber utilizan este patrón para simplificar sus APIs internas, permitiendo que equipos diferentes trabajen con interfaces sencillas en lugar de sistemas complejos.
''',
    'code_example': '''
# Ejemplo correcto de Facade en Python
class CPU:
    def execute(self):
        print("Ejecutando instrucciones")

class Memory:
    def load(self):
        print("Cargando en memoria")

class HardDrive:
    def read(self):
        print("Leyendo disco")

class ComputerFacade:
    def __init__(self):
        self.cpu = CPU()
        self.memory = Memory()
        self.hard_drive = HardDrive()

    def start(self):
        self.hard_drive.read()
        self.memory.load()
        self.cpu.execute()

# Uso
computer = ComputerFacade()
computer.start()

# Ejemplo incorrecto (sin Facade)
cpu = CPU()
memory = Memory()
hard_drive = HardDrive()

# El cliente necesita conocer todos los subsistemas
hard_drive.read()
memory.load()
cpu.execute()
''',
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Patrones de Diseño',
    'topic': 'Patrones de Comportamiento',
    'subtopic': 'Observer',
    'definition': '''
Este patrón se usa cuando un objeto necesita mantener informados a otros objetos sobre ciertos cambios o eventos.

¿Te ha pasado que quieres que varias cosas reaccionen cuando algo cambia? 🤔

El patrón Observer resuelve justo eso. Funciona como un sistema de suscripción: un objeto (llamado "sujeto") mantiene una lista de observadores que quieren recibir actualizaciones cuando algo ocurre. Lo bueno es que el sujeto no necesita saber quiénes son exactamente esos observadores, ni qué hacen con la información.

Este patrón es muy común en interfaces gráficas, sistemas de notificaciones, o cualquier lugar donde el cambio en un lugar debe reflejarse en varios otros lados. En Python, podemos implementarlo de forma simple usando listas y métodos personalizados, aunque también podrías usar herramientas más sofisticadas como `Observable` en librerías externas. 
''',
    'code_example': '''
# Sujeto
class Subject:
    def __init__(self):
        self._observers = []

    def attach(self, observer):
        self._observers.append(observer)

    def detach(self, observer):
        self._observers.remove(observer)

    def notify(self, data):
        for observer in self._observers:
            observer.update(data)

# Observador
class Observer:
    def update(self, data):
        print(f'Recibido: {data}')

# Uso
subject = Subject()
obs1 = Observer()
obs2 = Observer()

subject.attach(obs1)
subject.attach(obs2)

subject.notify("Hay cambios importantes")
# Comentario: Ambos observadores reaccionan sin que el sujeto sepa qué hacen exactamente.
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Patrones de Diseño',
    'topic': 'Patrones de Comportamiento',
    'subtopic': 'Strategy',
    'definition': '''
Este patrón se trata de definir una familia de algoritmos y hacer que sean intercambiables en tiempo de ejecución.

¿Te estás preguntando por qué esto importa? Bueno, imagina que tienes varias formas de hacer algo, como ordenar datos, y quieres poder cambiar entre ellas sin tocar el resto del código.

Strategy te permite encapsular comportamientos distintos y usarlos sin modificar el cliente que los utiliza. Lo genial es que puedes elegir la estrategia que mejor se adapte a la situación, y cambiarla sobre la marcha si hace falta. En Python, gracias a las funciones como ciudadanos de primera clase, implementar Strategy es muy sencillo y flexible.

Este patrón es útil en juegos (por ejemplo, estrategias de IA), sistemas de autenticación (contraseña, huella, token), o procesamiento de datos con distintas reglas según el contexto.
''',
    'code_example': '''
# Estrategias
def estrategia_a(data):
    return sorted(data)

def estrategia_b(data):
    return sorted(data, reverse=True)

# Contexto
class Procesador:
    def __init__(self, estrategia):
        self.estrategia = estrategia

    def procesar(self, datos):
        return self.estrategia(datos)

# Uso
datos = [5, 2, 9, 1]
proc = Procesador(estrategia_a)
print(proc.procesar(datos))  # [1, 2, 5, 9]

proc.estrategia = estrategia_b
print(proc.procesar(datos))  # [9, 5, 2, 1]

# Comentario: Puedes cambiar el algoritmo sin cambiar la clase principal.
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 1,
    'title_level': 'Patrones de Diseño',
    'topic': 'Patrones de Comportamiento',
    'subtopic': 'Command',
    'definition': '''
Este patrón encapsula una petición como un objeto, permitiendo parametrizar acciones, hacer colas de comandos o incluso deshacer operaciones.

Seguramente pensarás: ¿no basta con llamar funciones directamente?

Sí, pero si encapsulas las acciones en objetos, puedes almacenarlas, enviarlas a otros lugares, ejecutarlas después, o incluso deshacerlas. El patrón Command es muy usado en interfaces gráficas (cada clic puede ser un comando), menús, editores con deshacer/rehacer, o incluso sistemas de colas de tareas.

En Python puedes implementar comandos como objetos con un método `execute`, o simplemente como funciones si no necesitas tanta estructura. Pero cuando la cosa se pone más compleja, tener una estructura tipo comando te ayuda a organizar mejor las responsabilidades.
''',
    'code_example': '''
# Comando base
class Command:
    def execute(self):
        pass

# Comando concreto
class SaludarCommand(Command):
    def execute(self):
        print("Hola, mundo")

class DespedirCommand(Command):
    def execute(self):
        print("Adiós, mundo")

# Invocador
class Boton:
    def __init__(self, command):
        self.command = command

    def click(self):
        self.command.execute()

# Uso
boton_saludo = Boton(SaludarCommand())
boton_despedida = Boton(DespedirCommand())

boton_saludo.click()     # Hola, mundo
boton_despedida.click()  # Adiós, mundo

# Comentario: Cada botón ejecuta un comando diferente sin saber qué hace exactamente.
'''
  });
}

Future<void> insertPythonSrLevel2Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 2,
    'title_level': 'Rendimiento y Optimización',
    'topic': 'Profiling',
    'subtopic': 'cProfile',
    'definition': '''
El módulo cProfile es la herramienta estándar de Python para análisis de rendimiento. Proporciona estadísticas detalladas sobre el tiempo de ejecución de cada función en tu código, ayudándote a identificar cuellos de botella.

Pensemos por un momento en cómo optimizarías una aplicación sin datos concretos. Sería como intentar mejorar un motor con los ojos cerrados. cProfile te da las métricas exactas: cuántas veces se llama cada función y cuánto tiempo consume en total y por llamada.

Este módulo funciona mediante instrumentación, añadiendo pequeñas llamadas que registran el tiempo durante la ejecución. Aunque introduce cierta sobrecarga (típicamente del 5-10%), la información que proporciona vale la pena. Empresas como Dropbox han utilizado cProfile para optimizar sus clientes de sincronización, logrando mejoras de rendimiento significativas en operaciones críticas.
''',
    'code_example': '''
# Ejemplo correcto de uso de cProfile
import cProfile
import re

def test_func():
    for i in range(10000):
        re.compile("foo|bar")

# Ejecutar profiling
profiler = cProfile.Profile()
profiler.enable()
test_func()
profiler.disable()
profiler.print_stats(sort='time')

# Ejemplo de salida (comentada):
# ncalls  tottime  percall  cumtime  percall filename:lineno(function)
# 10000    0.038    0.000    0.038    0.000 {built-in method re.compile}
# 1        0.000    0.000    0.038    0.038 ejemplo.py:3(test_func)

# Ejemplo incorrecto (sin profiling)
def slow_func():
    data = [i**2 for i in range(10**6)]
    return sum(data)

# ¿Cómo saber qué parte es lenta sin medir?
''',
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 2,
    'title_level': 'Rendimiento y Optimización',
    'topic': 'Profiling',
    'subtopic': 'timeit',
    'definition': '''
El módulo timeit está diseñado específicamente para medir el tiempo de ejecución de pequeños fragmentos de código Python. A diferencia de cProfile, timeit está optimizado para proporcionar mediciones precisas de micro-benchmarks.

¿Te estás preguntando por qué necesitarías otra herramienta de medición? Mientras cProfile analiza programas completos, timeit es ideal para comparar implementaciones alternativas de una función específica. Elimina fuentes de ruido como el garbage collection y usa la mejor temporización disponible en el sistema operativo.

Una característica clave de timeit es que ejecuta el código múltiples veces (por defecto 1 millón) para obtener una medición estadísticamente significativa. Esto lo hace ideal para comparar operaciones muy rápidas. La comunidad científica Python (NumPy, SciPy) usa extensivamente timeit para optimizar operaciones matemáticas básicas donde nanosegundos importan.
''',
    'code_example': '''
# Ejemplo correcto de uso de timeit
import timeit

# Comparando dos métodos para concatenar strings
setup = 's = "example"; t = "string"'
method1 = 's + t'
method2 = '"-".join((s, t))'

time1 = timeit.timeit(method1, setup, number=1000000)
time2 = timeit.timeit(method2, setup, number=1000000)

print(f"Concatenación con +: {time1:.4f} segundos")
print(f"Concatenación con join: {time2:.4f} segundos")

# Ejemplo avanzado con funciones
def test_list():
    return [i for i in range(1000)]

def test_range():
    return list(range(1000))

print("List comprehension:", timeit.timeit(test_list, number=10000))
print("Range conversion:", timeit.timeit(test_range, number=10000))

# Ejemplo incorrecto (medición manual)
import time
start = time.time()
sum(range(1000000))
end = time.time()
print(f"Tiempo: {end - start}")  # Menos preciso que timeit
''',
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 2,
    'title_level': 'Rendimiento y Optimización',
    'topic': 'Profiling',
    'subtopic': 'memory_profiler',
    'definition': '''
El memory_profiler es una herramienta esencial para analizar el consumo de memoria en Python. Mientras cProfile y timeit miden tiempo de ejecución, memory_profiler te muestra exactamente cuánta memoria usa cada parte de tu código.

Vamos a ver de qué se trata todo esto. En aplicaciones que procesan grandes volúmenes de datos o que corren por largos períodos, las fugas de memoria pueden ser tan críticas como los cuellos de botella de CPU. Este módulo te permite ver línea por línea cómo evoluciona el uso de memoria, identificando dónde se asignan y liberan los recursos.

La herramienta funciona decorando funciones con @profile y luego ejecutando un script especial. Es particularmente útil para encontrar memory leaks en aplicaciones de larga duración. Empresas como Pinterest han usado memory_profiler para optimizar sus servicios de recomendación, reduciendo el uso de memoria en hasta un 40% en algunos casos.
''',
    'code_example': '''
# Ejemplo correcto de memory_profiler
# Requiere instalación: pip install memory_profiler

from memory_profiler import profile

@profile
def process_large_data():
    # Versión con posible problema de memoria
    data = [i for i in range(1000000)]  # 1. Lista grande
    result = sum(data)
    del data  # Eliminar referencia explícitamente
    return result

@profile
def optimized_process():
    # Versión optimizada
    return sum(range(1000000))  # 2. Usando generador

if __name__ == "__main__":
    process_large_data()
    optimized_process()

# Ejecutar con: python -m memory_profiler ejemplo.py

# Salida esperada (comentada):
# Line #    Mem usage    Increment  Occurrences   Line Contents
# 5     16.1 MiB     16.1 MiB           1   data = [i for i in range(1000000)]
# 6     16.1 MiB      0.0 MiB           1   result = sum(data)
# ...
# Versión optimizada muestra menor uso de memoria

# Ejemplo incorrecto (sin memory_profiler)
def load_big_file():
    with open('large.txt') as f:
        return f.readlines()  # ¿Cuánta memoria usa esto?
''',
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 2,
    'title_level': 'Rendimiento y Optimización',
    'topic': 'Optimización',
    'subtopic': 'Cython',
    'definition': '''
Cython es una herramienta que permite escribir código Python que se compila en C para mejorar el rendimiento.

¿No te pasa que a veces Python se siente un poco lento cuando haces muchas operaciones en bucles? 😓

Cython te permite escribir casi el mismo código de siempre, pero anotando tipos estáticos, para que pueda ser compilado y correr mucho más rápido. De hecho, es tan eficiente que librerías como Pandas y scikit-learn lo usan por debajo. Lo genial es que no tienes que abandonar Python, solo haces pequeñas adaptaciones. Ideal cuando ya tienes código funcional pero quieres acelerarlo sin reescribirlo todo en C++.

Eso sí, para compilar con Cython necesitarás un compilador C en tu sistema. Pero una vez configurado, puedes empezar a convertir tus scripts lentos en versiones turbo.
''',
    'code_example': '''
# archivo: mi_modulo.pyx

def suma(int a, int b):
    return a + b

# Luego compilas este archivo con setup.py para que sea una extensión C
# Comentario: Notar que se anotan tipos estáticos para que Cython genere código optimizado.
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 2,
    'title_level': 'Rendimiento y Optimización',
    'topic': 'Optimización',
    'subtopic': 'Numba',
    'definition': '''
Numba es una librería que permite acelerar código Python con decoradores, convirtiendo funciones en versiones compiladas en tiempo real.

¿Te suena a magia usar un decorador para hacer que tu código vaya más rápido? Pues eso hace Numba.

Basta con importar el decorador `@jit` y aplicarlo a una función intensiva en cálculos. En muchos casos, puedes lograr mejoras de rendimiento de 2x hasta 100x, sin cambiar prácticamente nada del código original. Es especialmente útil en tareas numéricas o científicas donde se trabaja con arrays y bucles.

Además, Numba se integra muy bien con NumPy y es multiplataforma. Una solución rápida y efectiva para exprimir más jugo a tu CPU sin volverte loco optimizando a mano.
''',
    'code_example': '''
from numba import jit
import numpy as np

@jit(nopython=True)
def suma_lenta(arr):
    total = 0
    for i in arr:
        total += i
    return total

datos = np.arange(1000000)
print(suma_lenta(datos))  # Se ejecuta mucho más rápido gracias a Numba

# Comentario: Con solo un decorador, la función se compila a código máquina.
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 2,
    'title_level': 'Rendimiento y Optimización',
    'topic': 'Optimización',
    'subtopic': 'Vectorización con NumPy',
    'definition': '''
La vectorización es una técnica para operar sobre arreglos sin usar bucles explícitos, aprovechando operaciones de bajo nivel mucho más rápidas.

¿Alguna vez sentiste que tus `for` en Python son lentos cuando procesas grandes volúmenes de datos?

Con NumPy puedes reemplazar esos bucles por operaciones vectorizadas. Es decir, en lugar de recorrer cada elemento, trabajas con todo el arreglo a la vez. Esto no solo mejora la velocidad, sino también hace que el código sea más corto y legible.

La magia está en que NumPy usa código en C por debajo. Así que cuando haces `array1 + array2`, no es solo azúcar sintáctico: es eficiencia real. Esta técnica es clave en ciencia de datos, machine learning y simulaciones numéricas.
''',
    'code_example': '''
import numpy as np

# Sin vectorización (forma lenta)
a = [1, 2, 3, 4]
b = [5, 6, 7, 8]
c = []
for i in range(len(a)):
    c.append(a[i] + b[i])
print(c)

# Con vectorización (forma rápida)
a_np = np.array([1, 2, 3, 4])
b_np = np.array([5, 6, 7, 8])
c_np = a_np + b_np
print(c_np)

# Comentario: La segunda forma no solo es más limpia, también es mucho más rápida con grandes volúmenes de datos.
'''
  });
}

Future<void> insertPythonSrLevel3Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Frameworks Web',
    'topic': 'Django',
    'subtopic': 'MTV architecture',
    'definition': '''
Django sigue el patrón MTV (Model-Template-View), una variación del clásico MVC. Este diseño separa claramente las responsabilidades: los modelos manejan los datos, las templates controlan la presentación y las views gestionan la lógica de negocio.

Seguramente pensarás que esto suena similar a otros frameworks, pero Django implementa esta separación de forma particularmente rigurosa. El modelo define la estructura de la base de datos usando clases Python, la template se encarga del HTML con un sistema de plantillas especial, y la view actúa como intermediario entre ambos.

Esta arquitectura permite escalar aplicaciones complejas manteniendo el código organizado. Plataformas como Instagram y Pinterest han basado su éxito en esta estructura, permitiendo a equipos grandes trabajar en diferentes partes del sistema sin conflictos. La clave está en cómo Django promueve la reutilización de componentes a través de apps independientes.
''',
    'code_example': '''
# Ejemplo básico de estructura MTV en Django

# models.py (Capa Model)
from django.db import models

class Article(models.Model):
    title = models.CharField(max_length=100)
    content = models.TextField()
    published_date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.title

# views.py (Capa View)
from django.shortcuts import render
from .models import Article

def article_list(request):
    articles = Article.objects.all()
    return render(request, 'blog/article_list.html', {'articles': articles})

# templates/blog/article_list.html (Capa Template)
''
<h1>Artículos</h1>
<ul>
{% for article in articles %}
    <li>{{ article.title }} - {{ article.published_date }}</li>
{% endfor %}
</ul>
''

# urls.py (Configuración de URLs)
from django.urls import path
from . import views

urlpatterns = [
    path('articles/', views.article_list, name='article_list'),
]
''',
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Frameworks Web',
    'topic': 'Django',
    'subtopic': 'ORM',
    'definition': '''
El ORM (Object-Relational Mapping) de Django es una de sus características más poderosas, permitiendo interactuar con la base de datos usando Python puro, sin escribir SQL directamente. Traduce clases Python a tablas de base de datos y métodos a consultas SQL.

No sé tú, pero a mí esto al principio me pareció magia negra 🤯. ¿Cómo es posible que `Article.objects.filter(title__contains='django')` se convierta en un SQL eficiente? El ORM de Django no solo genera consultas optimizadas, sino que también protege contra inyecciones SQL y maneja las diferencias entre motores de bases de datos.

Este sistema soporta relaciones complejas (uno-a-muchos, muchos-a-muchos), transacciones, migraciones de esquema y optimizaciones como select_related y prefetch_related. El Washington Post lo usa para manejar millones de artículos, demostrando que un ORM bien diseñado puede escalar a aplicaciones de alto tráfico.
''',
    'code_example': '''
# Ejemplos avanzados del ORM de Django

# Creación de objetos
new_article = Article(title='Django ORM', content='Es increíble...')
new_article.save()  # INSERT INTO blog_article...

# Consultas complejas
from django.db.models import Q

# SELECT * FROM blog_article WHERE title LIKE '%django%' OR content LIKE '%django%'
articles = Article.objects.filter(
    Q(title__contains='django') | Q(content__contains='django')
)

# Actualizaciones en lote
# UPDATE blog_article SET title = UPPER(title) WHERE published_date > '2023-01-01'
Article.objects.filter(
    published_date__year=2023
).update(
    title=Upper('title')
)

# Relaciones entre modelos
class Author(models.Model):
    name = models.CharField(max_length=100)

class Book(models.Model):
    title = models.CharField(max_length=100)
    author = models.ForeignKey(Author, on_delete=models.CASCADE)

# Obtener todos los libros de un autor (relación inversa)
author = Author.objects.get(name='Gabriel García Márquez')
books = author.book_set.all()  # SELECT * FROM library_book WHERE author_id = ?
''',
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Frameworks Web',
    'topic': 'Django',
    'subtopic': 'Views y URLs',
    'definition': '''
El sistema de views y URLs en Django es el corazón que maneja las peticiones HTTP y decide qué código ejecutar para cada ruta. Las views pueden ser funciones (FBV) o clases (CBV), mientras que el sistema de URLs usa expresiones regulares para enrutamiento.

¿Te estás preguntando por qué Django usa este enfoque dual? Las function-based views son simples para casos básicos, mientras que las class-based views ofrecen herencia y mixins para funcionalidad compleja. Juntas, permiten desde endpoints API REST hasta páginas tradicionales server-rendered.

El sistema de URLs de Django es particularmente potente, soportando parámetros nombrados, conversores de tipo y namespaces. Plataformas como Eventbrite manejan millones de peticiones diarias usando este sistema, demostrando su escalabilidad. La magia está en cómo Django combina simplicidad para casos básicos con flexibilidad para necesidades complejas.
''',
    'code_example': '''
# Ejemplos de views y URLs en Django

# Function-Based View (FBV)
from django.http import HttpResponse
from django.shortcuts import render

def simple_view(request):
    return HttpResponse("Hola Mundo")

def article_detail(request, article_id):
    article = Article.objects.get(id=article_id)
    return render(request, 'blog/detail.html', {'article': article})

# Class-Based View (CBV)
from django.views.generic import ListView, DetailView

class ArticleListView(ListView):
    model = Article
    template_name = 'blog/article_list.html'
    context_object_name = 'articles'
    paginate_by = 10

class ArticleDetailView(DetailView):
    model = Article
    template_name = 'blog/article_detail.html'

# URLs config
from django.urls import path
from .views import simple_view, article_detail, ArticleListView, ArticleDetailView

urlpatterns = [
    path('', simple_view),
    path('articles/', ArticleListView.as_view(), name='article-list'),
    path('articles/<int:article_id>/', article_detail, name='article-detail'),
    path('articles/cbv/<int:pk>/', ArticleDetailView.as_view(), name='article-cbv'),
    path('articles/<str:slug>/', ArticleDetailView.as_view(), name='article-slug'),
]

# URLs avanzadas con include y namespaces
from django.urls import include, path

urlpatterns += [
    path('api/v1/', include([
        path('articles/', include('blog.api.urls', namespace='api-articles')),
    ])),
]
''',
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Frameworks Web',
    'topic': 'Django',
    'subtopic': 'Templates',
    'definition': '''
El sistema de templates de Django es un motor de plantillas seguro y amigable para diseñadores, que permite generar HTML dinámico separando claramente la lógica de la presentación. Combina tags especiales, filtros y herencia de plantillas para crear interfaces reutilizables.

Vamos a ver de qué se trata todo esto. A diferencia de otros sistemas que permiten código Python arbitrario en las plantillas, Django deliberadamente limita lo que se puede hacer en las templates, forzando a mantener la lógica compleja en las views. Esto no es una limitación, sino una filosofía de diseño que ha ayudado a equipos grandes a mantener proyectos por años.

El sistema incluye características potentes como herencia de plantillas ({% extends %}), inclusión de componentes ({% include %}), y un sistema de filtros para transformar datos. The Guardian usa este sistema para servir millones de páginas personalizadas diariamente, demostrando que las templates de Django pueden manejar carga a gran escala.
''',
    'code_example': '''
# Ejemplos avanzados de templates Django

# base.html (plantilla base)
''
<!DOCTYPE html>
<html>
<head>
    <title>{% block title %}Mi Sitio{% endblock %}</title>
</head>
<body>
    <header>{% include "_navbar.html" %}</header>
    <main>{% block content %}{% endblock %}</main>
    <footer>{% block footer %}{% endblock %}</footer>
</body>
</html>
''

# article_detail.html (hereda de base)
''
{% extends "base.html" %}

{% block title %}{{ article.title }} - Mi Sitio{% endblock %}

{% block content %}
    <h1>{{ article.title|title }}</h1>
    <p class="date">Publicado: {{ article.published_date|date:"F j, Y" }}</p>
    <div class="content">
        {{ article.content|linebreaks }}
    </div>
    
    {% if user.is_authenticated %}
        <div class="actions">
            <a href="{% url 'article-edit' article.id %}">Editar</a>
        </div>
    {% endif %}
{% endblock %}

{% block footer %}
    <div class="related">
        <h3>Artículos relacionados</h3>
        <ul>
        {% for related in article.tags.similar_objects %}
            <li><a href="{{ related.get_absolute_url }}">{{ related.title }}</a></li>
        {% empty %}
            <li>No hay artículos relacionados</li>
        {% endfor %}
        </ul>
    </div>
{% endblock %}
''

# _navbar.html (componente incluido)
''
<nav>
    <ul>
        <li><a href="{% url 'home' %}">Inicio</a></li>
        <li><a href="{% url 'article-list' %}">Blog</a></li>
        {% if user.is_authenticated %}
            <li><a href="{% url 'logout' %}">Salir</a></li>
        {% else %}
            <li><a href="{% url 'login' %}">Entrar</a></li>
        {% endif %}
    </ul>
</nav>
''
''',
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Frameworks Web',
    'topic': 'FastAPI',
    'subtopic': 'Async',
    'definition': '''
FastAPI está diseñado desde cero para funcionar con código asíncrono, usando `async` y `await`, lo cual lo hace muy rápido y eficiente.

¿Te preguntas por qué tanta gente habla de FastAPI y su rendimiento?

Una de las razones es su soporte nativo para programación asíncrona. Esto permite manejar muchas peticiones al mismo tiempo sin bloquear el servidor, lo que es ideal para APIs que hacen múltiples llamadas a bases de datos, servicios externos o procesamiento concurrente.

Usar `async def` en tus rutas le dice a FastAPI que puede seguir atendiendo otras peticiones mientras espera una respuesta, lo cual es perfecto en aplicaciones modernas con alta carga o APIs en tiempo real. Solo recuerda que si usas `async`, también debes trabajar con librerías compatibles (como `httpx` en vez de `requests`, o `asyncpg` en lugar de `psycopg2`).
''',
    'code_example': '''
from fastapi import FastAPI
import asyncio

app = FastAPI()

@app.get("/lenta")
async def proceso_lento():
    await asyncio.sleep(3)  # Simula una tarea que tarda
    return {"mensaje": "Terminó después de 3 segundos"}

# Comentario: Mientras esta ruta espera, otras peticiones pueden seguir atendiéndose.
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Frameworks Web',
    'topic': 'FastAPI',
    'subtopic': 'Pydantic models',
    'definition': '''
En FastAPI, los modelos de datos se definen usando Pydantic, una librería potente para validación de datos y manejo de tipos.

¿Alguna vez te has peleado con validaciones manuales en tus APIs?

Con Pydantic, puedes definir tus modelos como clases, y FastAPI se encarga automáticamente de validar los datos entrantes. Si el usuario envía algo mal, la API responde con un error detallado y bien formateado. Además, puedes añadir tipos complejos, validaciones personalizadas y documentación automática sin esfuerzo extra.

Esto hace que trabajar con datos sea mucho más seguro y limpio. También te obliga (en el buen sentido) a pensar mejor en la estructura y restricciones de tus datos.
''',
    'code_example': '''
from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

class Usuario(BaseModel):
    nombre: str
    edad: int
    email: str

@app.post("/usuarios/")
def crear_usuario(usuario: Usuario):
    return {"mensaje": f"Usuario {usuario.nombre} registrado"}

# Comentario: Si el cliente envía una edad como string o se olvida del email, FastAPI devuelve un error automático.
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Frameworks Web',
    'topic': 'FastAPI',
    'subtopic': 'OpenAPI',
    'definition': '''
FastAPI genera automáticamente documentación interactiva de tu API utilizando el estándar OpenAPI.

¿Nunca te ha pasado que quieres probar tu API sin abrir Postman o escribir curl?

Con FastAPI, solo abres `/docs` en el navegador y tienes una interfaz lista para probar todas tus rutas, enviar datos y ver respuestas. Todo esto lo hace posible OpenAPI, un estándar que describe cómo debe ser una API REST. FastAPI no solo lo cumple, sino que lo aprovecha para darte documentación bonita, funcional y siempre actualizada.

Y si quieres personalizarla, también puedes agregar descripciones, ejemplos, validaciones adicionales y más. Esto ahorra mucho tiempo en pruebas, soporte y colaboración con otros devs o equipos.
''',
    'code_example': '''
from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI(title="Mi API", version="1.0.0")

class Producto(BaseModel):
    nombre: str
    precio: float

@app.post("/productos/", response_model=Producto)
def crear_producto(producto: Producto):
    return producto

# Comentario: Al entrar a /docs verás un formulario para crear productos, generado automáticamente.
'''
  });
  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Frameworks Web',
    'topic': 'Flask',
    'subtopic': 'Blueprints',
    'definition': '''
Los Blueprints en Flask son una forma de organizar aplicaciones grandes en componentes modulares y reutilizables. Funcionan como "mini-aplicaciones" que pueden registrar sus propias rutas, templates y static files, y luego ser integradas en la aplicación principal.

Pensemos por un momento en una aplicación compleja con múltiples módulos como autenticación, blog y dashboard. Sin Blueprints, todo estaría en un solo archivo, creando un caos mantenible. Los Blueprints permiten dividir esta lógica en paquetes independientes que pueden incluso ser reutilizados entre proyectos.

Este patrón es especialmente útil cuando trabajas con equipos grandes, ya que diferentes desarrolladores pueden trabajar en Blueprints separados sin conflictos. Empresas como LinkedIn han utilizado este enfoque para mantener sus microservicios Flask organizados y escalables. La clave está en cómo Flask combina simplicidad con flexibilidad para proyectos de cualquier tamaño.
''',
    'code_example': '''
# Ejemplo de Blueprint en Flask
# auth/__init__.py
from flask import Blueprint

auth_bp = Blueprint('auth', __name__, url_prefix='/auth')

@auth_bp.route('/login')
def login():
    return "Página de login"

@auth_bp.route('/logout')
def logout():
    return "Página de logout"

# app.py (aplicación principal)
from flask import Flask
from auth import auth_bp

app = Flask(__name__)
app.register_blueprint(auth_bp)

if __name__ == '__main__':
    app.run()

# Estructura de directorios recomendada:
''
/myapp
    /auth
        __init__.py  # Contiene el Blueprint
        routes.py    # Rutas adicionales
        models.py    # Modelos específicos
    /templates
        /auth        # Templates específicos
            login.html
    /static
        /auth        # Archivos estáticos
    app.py           # Aplicación principal
''
''',
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Frameworks Web',
    'topic': 'Flask',
    'subtopic': 'Extensiones',
    'definition': '''
El ecosistema de extensiones es una de las mayores fortalezas de Flask. Estas bibliotecas oficiales y de terceros añaden funcionalidades complejas como ORM, autenticación o APIs REST manteniendo la filosofía minimalista de Flask.

Seguramente pensarás: ¿por qué no incluir estas características directamente en Flask? La respuesta está en la filosofía "micro" del framework. En lugar de imponer soluciones, Flask te permite elegir las herramientas que mejor se adapten a tu proyecto. SQLAlchemy para bases de datos, Flask-Login para autenticación, Flask-RESTful para APIs - cada extensión está especializada en su dominio.

Algunas extensiones populares como Flask-SQLAlchemy son utilizadas por empresas como Netflix para sus servicios internos. La clave está en cómo estas extensiones mantienen consistencia con la API de Flask mientras añaden capacidades empresariales. Este enfoque modular ha permitido a Flask escalar desde pequeños proyectos hasta aplicaciones complejas.
''',
    'code_example': '''
# Ejemplo de uso de extensiones Flask
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager
from flask_migrate import Migrate

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///app.db'
app.config['SECRET_KEY'] = 'tu-clave-secreta'

# Inicializar extensiones
db = SQLAlchemy(app)
login_manager = LoginManager(app)
migrate = Migrate(app, db)

# Configuración básica de Flask-Login
@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))

# Modelo de usuario con SQLAlchemy
class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True, nullable=False)
    password = db.Column(db.String(120), nullable=False)

# Ruta protegida
@app.route('/dashboard')
@login_required
def dashboard():
    return "Área privada"

if __name__ == '__main__':
    app.run()

# Extensiones comunes:
# - Flask-SQLAlchemy: ORM para bases de datos
# - Flask-Login: Manejo de sesiones de usuario
# - Flask-WTF: Formularios web
# - Flask-Mail: Envío de emails
# - Flask-RESTful: Creación de APIs REST
# - Flask-Migrate: Migraciones de base de datos
''',
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 3,
    'title_level': 'Frameworks Web',
    'topic': 'Flask',
    'subtopic': 'WSGI',
    'definition': '''
Flask está construido sobre WSGI (Web Server Gateway Interface), el estándar de Python para aplicaciones web. Esta interfaz define cómo los servidores web se comunican con aplicaciones Python, permitiendo que Flask funcione con diferentes servidores como Gunicorn, uWSGI o Waitress.

Vamos a ver de qué se trata todo esto. Cuando un usuario visita tu aplicación Flask, el servidor web recibe la petición HTTP y la convierte en un diccionario Python que sigue el formato WSGI. Flask procesa esta petición y devuelve una respuesta que el servidor convierte nuevamente a HTTP. Esta abstracción permite que tu aplicación funcione igual en desarrollo (con el servidor integrado) que en producción (con servidores optimizados).

Entender WSGI es crucial para desplegar aplicaciones Flask en producción. Plataformas como Pinterest usan esta capa para manejar miles de peticiones por segundo. La magia está en cómo Flask simplifica este proceso sin ocultar el poder del estándar WSGI cuando lo necesitas.
''',
    'code_example': '''
# Ejemplo de aplicación WSGI básica (sin Flask)
def simple_app(environ, start_response):
    """La aplicación WSGI más simple"""
    status = '200 OK'
    headers = [('Content-type', 'text/plain; charset=utf-8')]
    start_response(status, headers)
    return [b"Hola Mundo WSGI"]

# Ejemplo de cómo Flask usa WSGI internamente
from flask import Flask, request

app = Flask(__name__)

@app.route('/')
def hello():
    return f"Hola {request.remote_addr}"

# La aplicación Flask es un objeto WSGI válido
wsgi_app = app.wsgi_app

# Despliegue con Gunicorn (comando)
# gunicorn -w 4 -b :8000 mi_app:app

# Configuración para producción típica:
''
1. Servidor web (Nginx/Apache) ← HTTP
2. Servidor WSGI (Gunicorn/uWSGI) ← WSGI
3. Tu aplicación Flask
''

# Ejemplo de archivo wsgi.py para producción
from myapp import app

if __name__ == "__main__":
    app.run()
''',
  });
}

Future<void> insertPythonSrLevel4Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 4,
    'title_level': 'Arquitectura Avanzada',
    'topic': 'Microservicios',
    'subtopic': 'Introducción a los Microservicios',
    'definition': '''
Los microservicios son una forma de estructurar aplicaciones dividiéndolas en pequeños servicios independientes que se comunican entre sí mediante APIs bien definidas.

¿Te preguntas por qué tanto alboroto con los microservicios?

Este enfoque permite que cada servicio se desarrolle, implemente y escale de forma independiente, lo que facilita la actualización y mantenimiento del sistema. Por ejemplo, si tienes una aplicación de comercio electrónico, podrías tener servicios separados para usuarios, productos, pagos y envíos. Cada uno puede ser desarrollado por diferentes equipos, usando distintas tecnologías, y escalar según su demanda específica.

Además, si un servicio falla, los demás pueden seguir funcionando, lo que mejora la resiliencia del sistema. Sin embargo, también introduce desafíos como la complejidad en la comunicación entre servicios y la necesidad de una infraestructura más robusta para gestionarlos eficazmente.
''',
    'code_example': '''
# Ejemplo de estructura de microservicios:

# Servicio de Usuarios
# Servicio de Productos
# Servicio de Pedidos

# Cada uno con su propia base de datos y API REST.
# Comunicación entre servicios mediante HTTP o mensajería asincrónica.
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 4,
    'title_level': 'Arquitectura Avanzada',
    'topic': 'Microservicios',
    'subtopic': 'Ventajas de los Microservicios',
    'definition': '''
Adoptar una arquitectura de microservicios ofrece múltiples beneficios que pueden mejorar la eficiencia y escalabilidad de una aplicación.

¿Te preguntas qué ventajas concretas aportan los microservicios?

Algunas de las principales son:

- **Escalabilidad independiente**: Puedes escalar solo los servicios que lo necesiten, optimizando recursos.
- **Desarrollo paralelo**: Equipos diferentes pueden trabajar en distintos servicios simultáneamente sin interferencias.
- **Flexibilidad tecnológica**: Cada servicio puede usar el lenguaje y tecnología que mejor se adapte a sus necesidades.
- **Resiliencia**: Si un servicio falla, los demás pueden seguir funcionando, mejorando la disponibilidad del sistema.
- **Despliegue más rápido**: Los servicios se pueden implementar de forma independiente, facilitando actualizaciones y mejoras continuas.

Estas ventajas hacen que los microservicios sean una opción atractiva para aplicaciones que requieren alta disponibilidad y capacidad de adaptación rápida a cambios.
''',
    'code_example': '''
# Escalado independiente:
# Si el servicio de autenticación recibe más tráfico, se puede escalar sin afectar a los demás servicios.

# Despliegue independiente:
# Se puede actualizar el servicio de pagos sin necesidad de redeployar toda la aplicación.
'''
  });
  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 4,
    'title_level': 'Arquitectura Avanzada',
    'topic': 'Microservicios',
    'subtopic': 'Desventajas de los Microservicios',
    'definition': '''
Aunque los microservicios ofrecen muchas ventajas, también presentan ciertos desafíos que es importante considerar.

¿Te preguntas qué complicaciones podrían surgir al implementar microservicios?

Algunas de las principales desventajas son:

- **Complejidad operativa**: Gestionar múltiples servicios requiere una infraestructura más compleja y herramientas especializadas.
- **Comunicación entre servicios**: La interacción entre servicios puede introducir latencia y puntos de fallo adicionales.
- **Consistencia de datos**: Mantener la coherencia entre bases de datos distribuidas es más complicado.
- **Pruebas más complejas**: Probar una aplicación compuesta por muchos servicios requiere estrategias y herramientas específicas.
- **Mayor consumo de recursos**: Cada servicio necesita su propio entorno de ejecución, lo que puede aumentar los costos.

Es fundamental evaluar estos aspectos y contar con un equipo capacitado y herramientas adecuadas para mitigar estos desafíos al adoptar una arquitectura de microservicios.
''',
    'code_example': '''
# Comunicación entre servicios:
# Si el servicio de pedidos depende del servicio de inventario, una falla en este último puede afectar al primero.

# Consistencia de datos:
# Actualizar el estado de un pedido y el inventario correspondiente requiere mecanismos para asegurar la coherencia entre servicios.
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 4,
    'title_level': 'Arquitectura Avanzada',
    'topic': 'Microservicios',
    'subtopic': 'Event-driven architecture',
    'definition': '''
Una arquitectura orientada a eventos permite que los servicios se comuniquen entre sí mediante eventos, en lugar de llamadas directas.

¿Te preguntas cómo esto mejora la escalabilidad y flexibilidad de tu aplicación?

En lugar de que un servicio llame directamente a otro, emite un evento que otros servicios pueden escuchar y manejar según sea necesario. Esto desacopla los servicios, permitiendo que evolucionen de forma independiente y respondan de manera asíncrona a los cambios. Por ejemplo, cuando un usuario realiza una compra, el servicio de pedidos emite un evento "PedidoCreado", que puede ser procesado por servicios de facturación, inventario o notificaciones, cada uno reaccionando según su lógica específica.

Este enfoque mejora la escalabilidad, ya que los servicios pueden manejar eventos a su propio ritmo, y aumenta la resiliencia, ya que la falla de un servicio no afecta directamente a los demás.
''',
    'code_example': '''
# Ejemplo utilizando RabbitMQ y pika en Python

import pika
import json

# Conexión al broker
connection = pika.BlockingConnection(pika.ConnectionParameters('localhost'))
channel = connection.channel()

# Declarar la cola
channel.queue_declare(queue='pedidos')

# Publicar un evento
evento = {'tipo': 'PedidoCreado', 'id_pedido': 123, 'monto': 49.99}
channel.basic_publish(exchange='',
                      routing_key='pedidos',
                      body=json.dumps(evento))

print("Evento 'PedidoCreado' enviado.")
connection.close()

# Comentario: Otros servicios pueden suscribirse a la cola 'pedidos' y procesar este evento según su lógica.
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 4,
    'title_level': 'Arquitectura Avanzada',
    'topic': 'Microservicios',
    'subtopic': 'gRPC',
    'definition': '''
gRPC es un framework de comunicación de alto rendimiento desarrollado por Google, que utiliza HTTP/2 y Protocol Buffers para permitir llamadas a procedimientos remotos entre servicios.

¿Te preguntas por qué elegir gRPC sobre REST en ciertos casos?

gRPC ofrece varias ventajas: es más eficiente en la serialización de datos gracias a Protocol Buffers, soporta comunicación bidireccional y streaming, y permite una definición clara de servicios mediante archivos .proto. Esto lo hace ideal para microservicios que requieren alta eficiencia y comunicación en tiempo real. Además, gRPC genera automáticamente código cliente y servidor en múltiples lenguajes, facilitando la interoperabilidad entre servicios escritos en diferentes tecnologías.
''',
    'code_example': '''
// Definición del servicio en un archivo .proto

syntax = "proto3";

service Calculadora {
  rpc Sumar (Operacion) returns (Resultado);
}

message Operacion {
  int32 a = 1;
  int32 b = 2;
}

message Resultado {
  int32 resultado = 1;
}

//Este archivo .proto se compila para generar el código necesario en Python y otros lenguajes, permitiendo la comunicación entre servicios mediante gRPC.
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 4,
    'title_level': 'Arquitectura Avanzada',
    'topic': 'Microservicios',
    'subtopic': 'REST avanzado',
    'definition': '''
REST avanzado implica aplicar prácticas y patrones que van más allá de las operaciones CRUD básicas, para diseñar APIs más robustas y escalables.

¿Te preguntas cómo mejorar tus APIs REST más allá de lo básico?

Algunas prácticas incluyen:

- **Versionado de APIs**: Permite introducir cambios sin afectar a los clientes existentes.
- **HATEOAS (Hypermedia as the Engine of Application State)**: Proporciona enlaces en las respuestas para guiar a los clientes a través de las posibles acciones.
- **Paginación, filtrado y ordenamiento**: Mejora el rendimiento y la usabilidad al manejar grandes conjuntos de datos.
- **Manejo adecuado de errores**: Utilizar códigos de estado HTTP y mensajes de error claros.
- **Autenticación y autorización**: Implementar mecanismos como OAuth 2.0 para proteger los recursos.

Estas prácticas ayudan a construir APIs más mantenibles, seguras y fáciles de consumir por diferentes clientes.
''',
    'code_example': '''
# Ejemplo de una API REST avanzada con Flask

from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route('/api/v1/productos', methods=['GET'])
def obtener_productos():
    # Implementar paginación y filtrado
    pagina = int(request.args.get('pagina', 1))
    tamaño = int(request.args.get('tamaño', 10))
    categoria = request.args.get('categoria')

    # Lógica para obtener productos según los parámetros
    productos = obtener_productos_desde_bd(pagina, tamaño, categoria)

    return jsonify({
        'pagina': pagina,
        'tamaño': tamaño,
        'productos': productos,
        'enlaces': {
            'siguiente': f'/api/v1/productos?pagina={pagina + 1}&tamaño={tamaño}',
            'anterior': f'/api/v1/productos?pagina={pagina - 1}&tamaño={tamaño}' if pagina > 1 else None
        }
    })

# Comentario: Esta implementación incluye paginación, filtrado por categoría y enlaces HATEOAS para navegar entre páginas.
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 4,
    'title_level': 'Arquitectura Avanzada',
    'topic': 'Seguridad',
    'subtopic': 'JWT',
    'definition': '''
Los **JSON Web Tokens (JWT)** son como pases VIP digitales que se usan mucho hoy en día para asegurar la comunicación entre un cliente y un servidor. En lugar de que el servidor tenga que verificar tus credenciales cada vez que haces algo, te da un JWT después de tu primer inicio de sesión exitoso. Este token, que es una cadena de caracteres codificada, contiene información sobre ti (como tu ID de usuario o los permisos que tienes) y está firmado digitalmente.

Seguramente te preguntarás de qué va todo esto y por qué es importante. Pues bien, piensa en un escenario donde una aplicación móvil necesita hablar constantemente con un servidor para obtener datos o enviar información. Si cada vez que la app pide algo, el servidor tuviera que ir a la base de datos a revisar tu usuario y contraseña, la cosa se pondría lenta y sería un estrés para el servidor. Los JWT solucionan esto al permitir que el servidor verifique la autenticidad del token de forma rápida y eficiente, sin necesidad de consultar la base de datos en cada petición.

El JWT tiene tres partes: una cabecera que indica el tipo de token y el algoritmo de cifrado, una carga útil donde va la información del usuario (¡cuidado con lo que pones aquí, no es para datos sensibles!) y una firma. La firma es crucial porque garantiza que el token no ha sido alterado. Si alguien intenta modificar la información del token, la firma ya no coincidirá y el servidor lo rechazará. Esto lo hace una herramienta muy potente para la autenticación y autorización en aplicaciones web y APIs, permitiendo un flujo de trabajo más fluido y seguro.
''',
    'code_example': '''
# pip install PyJWT
import jwt
import datetime

# Clave secreta para firmar el token (mantén esta clave MUY segura)
SECRET_KEY = "tu_super_secreta_clave_aqui"

# Información que queremos incluir en el token
payload = {
    'user_id': 123,
    'username': 'ejemplo_usuario',
    'exp': datetime.datetime.now(datetime.timezone.utc) + datetime.timedelta(hours=1) # Expiración en 1 hora
}

# Crear el token JWT
token = jwt.encode(payload, SECRET_KEY, algorithm="HS256")
print(f"Token JWT generado: {token}")

# --- Ejemplo de verificación (simulación en el servidor) ---
try:
    decoded_payload = jwt.decode(token, SECRET_KEY, algorithms=["HS256"])
    print(f"Token decodificado exitosamente: {decoded_payload}")
except jwt.ExpiredSignatureError:
    print("El token ha expirado.")
except jwt.InvalidTokenError:
    print("Token inválido.")

# --- Ejemplo de token inválido (cambiando un caracter para que la firma no coincida) ---
malformed_token = token[:-1] + 'A' # Cambiamos el último caracter
try:
    jwt.decode(malformed_token, SECRET_KEY, algorithms=["HS256"])
except jwt.InvalidTokenError:
    print("\\nIntento de decodificar token malformado: ¡Firma inválida, token rechazado!")
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 4,
    'title_level': 'Arquitectura Avanzada',
    'topic': 'Seguridad',
    'subtopic': 'OAuth',
    'definition': '''
**OAuth** (Open Authorization) es un protocolo de autorización que permite a una aplicación acceder a recursos de otra aplicación en nombre de un usuario, sin necesidad de que el usuario comparta sus credenciales directamente con la primera aplicación. Pensemos por un momento en las veces que has visto el botón de "Iniciar sesión con Google" o "Iniciar sesión con Facebook" en alguna aplicación. Eso, mi amigo, es OAuth en acción. No es un método de autenticación en sí, sino un medio para que una aplicación obtenga permisos limitados para acceder a la información de tu cuenta en otra aplicación, como tu perfil de Google o tus fotos de Facebook.

¿Te estás preguntando por qué esto importa? Pues bien, antes de OAuth, si una aplicación quería acceder a tus datos de Facebook, por ejemplo, tendrías que darle tu nombre de usuario y contraseña de Facebook directamente a esa aplicación. Imagina el riesgo de seguridad: esa aplicación tendría acceso total a tu cuenta y tus credenciales. OAuth resuelve este problema al introducir un intermediario de confianza. En lugar de dar tus credenciales, autorizas a una aplicación a obtener un "token de acceso" de un proveedor de servicios (como Google o Facebook). Este token tiene permisos específicos y limitados que tú mismo controlas, y lo más importante, ¡nunca compartes tus credenciales con la aplicación que los solicita!

Este sistema es fundamental en la seguridad moderna de las aplicaciones, ya que mejora enormemente la privacidad y reduce el riesgo de compromiso de credenciales. Además, permite a los usuarios revocar fácilmente el acceso a las aplicaciones sin tener que cambiar sus contraseñas principales. Es una solución elegante y segura que ha transformado la forma en que interactuamos con múltiples servicios online.
''',
    'code_example': '''
# OAuth es un protocolo de autorización, no se implementa directamente con código Python
# para una demostración sencilla. Requiere interacción con servicios externos (Google, Facebook, etc.).
# Sin embargo, aquí te muestro un ejemplo conceptual de cómo un flujo OAuth2 se vería en un servidor Flask
# usando la biblioteca 'Authlib' (una implementación común de OAuth en Python).

# pip install Flask Authlib

from flask import Flask, redirect, url_for, session, request
from authlib.integrations.flask_client import OAuth

app = Flask(__name__)
app.secret_key = 'tu_super_secreta_clave_de_sesion' # Clave de sesión para Flask
oauth = OAuth(app)

# Configuración de un proveedor OAuth (ej. Google)
# Necesitarías obtener CLIENT_ID y CLIENT_SECRET de la consola de desarrolladores de Google
google = oauth.register(
    name='google',
    client_id='TU_CLIENT_ID_DE_GOOGLE',
    client_secret='TU_CLIENT_SECRET_DE_GOOGLE',
    access_token_url='https://oauth2.googleapis.com/token',
    access_token_params=None,
    authorize_url='https://accounts.google.com/o/oauth2/auth',
    authorize_params=None,
    api_base_url='https://www.googleapis.com/oauth2/v1/',
    client_kwargs={'scope': 'openid email profile'},
)

@app.route('/')
def index():
    user = session.get('user')
    if user:
        return f'Hola, {user["name"]}! <a href="/logout">Cerrar sesión</a>'
    return '<a href="/login/google">Iniciar sesión con Google</a>'

@app.route('/login/google')
def login_google():
    # Redirige al usuario a la página de inicio de sesión de Google
    redirect_uri = url_for('authorize_google', _external=True)
    return google.authorize_redirect(redirect_uri)

@app.route('/login/google/authorize')
def authorize_google():
    # Maneja la respuesta de Google después de la autorización
    token = google.authorize_access_token()
    user_info = google.get('userinfo').json() # Obtiene la información del usuario
    session['user'] = user_info
    return redirect('/')

@app.route('/logout')
def logout():
    session.pop('user', None)
    return redirect('/')

# Este es un ejemplo conceptual. En una aplicación real, se manejarían
# errores, estados de sesión y se interactuaría con una base de datos.
# Este código NO ES EJECUTABLE directamente sin credenciales válidas y un entorno web.
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 4,
    'title_level': 'Arquitectura Avanzada',
    'topic': 'Seguridad',
    'subtopic': 'Hashing (bcrypt)',
    'definition': '''
El **hashing** es una técnica fundamental en seguridad informática, especialmente cuando hablamos de almacenar contraseñas. En lugar de guardar tu contraseña tal cual en una base de datos (lo cual sería un desastre si alguien lograra acceder a ella), lo que se hace es aplicar una función de hash a tu contraseña. Esta función toma tu contraseña original y genera una cadena de caracteres de longitud fija que parece aleatoria, conocida como "hash" o "resumen criptográfico". Un buen algoritmo de hashing, como **bcrypt**, tiene propiedades muy importantes: es unidireccional (es decir, es prácticamente imposible obtener la contraseña original a partir del hash) y produce hashes diferentes incluso si la entrada varía ligeramente (por ejemplo, "contraseña1" y "contraseña2" tendrán hashes completamente distintos).

No sé tú, pero a mí esto al principio me costó 🤯 entender por qué no se pueden simplemente encriptar y desencriptar las contraseñas. La clave está en la "unidireccionalidad". Cuando te registras en un sitio, tu contraseña se hashea y ese hash se guarda. Cuando intentas iniciar sesión, el sistema toma la contraseña que ingresaste, le aplica la misma función de hash, y luego compara el hash resultante con el que está guardado. Si coinciden, ¡bingo! Has iniciado sesión. Nunca se desencripta nada. Esto es crucial porque si la base de datos es comprometida, los atacantes solo obtendrán los hashes, no las contraseñas reales. Intentar "romper" un hash de bcrypt para obtener la contraseña original es computacionalmente muy costoso y, por ende, inviable en la práctica.

**Bcrypt** es un algoritmo de hashing de contraseñas particularmente robusto porque está diseñado para ser lento. Sí, leíste bien, lento. Esto es una característica, no un error. Su lentitud hace que los ataques de fuerza bruta (intentar millones de contraseñas por segundo) sean muchísimo más difíciles y costosos para los atacantes. Además, bcrypt incorpora un "salt" (una cadena de caracteres aleatoria) que se añade a la contraseña antes de hashearla, asegurando que incluso dos usuarios con la misma contraseña tengan hashes completamente diferentes, lo que frustra los ataques de tablas arcoíris. Es una de las mejores prácticas para la gestión segura de contraseñas hoy en día.
''',
    'code_example': '''
# pip install bcrypt
import bcrypt

# Contraseña que un usuario podría ingresar
password = "MiSuperContrasenaSecreta123"

# --- Hashing de la contraseña (lo que harías al registrar un usuario) ---
# bcrypt.gensalt() genera un salt (cadena aleatoria) y bcrypt lo incluye en el hash final.
# Cuanto mayor sea el "rounds" (costo), más lento y seguro será el hashing.
# El valor por defecto suele ser 12, que es un buen balance.
hashed_password = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(rounds=12))
print(f"Contraseña original: {password}")
print(f"Contraseña hasheada (almacenada en la DB): {hashed_password.decode('utf-8')}")

# --- Verificación de la contraseña (lo que harías al iniciar sesión) ---
# Cuando un usuario intenta iniciar sesión, tomamos la contraseña ingresada y la comparamos con el hash almacenado.
# bcrypt.checkpw se encarga de re-hashear la contraseña ingresada con el salt del hash almacenado y compara.
entered_password = "MiSuperContrasenaSecreta123"
if bcrypt.checkpw(entered_password.encode('utf-8'), hashed_password):
    print("\\n¡Contraseña correcta! Usuario autenticado.")
else:
    print("\\nContraseña incorrecta. Acceso denegado.")

# --- Ejemplo de contraseña incorrecta ---
incorrect_password = "ContrasenaIncorrecta"
if bcrypt.checkpw(incorrect_password.encode('utf-8'), hashed_password):
    print("Esto no debería imprimirse para una contraseña incorrecta.")
else:
    print(f"\\nIntento de verificar con '{incorrect_password}': Contraseña incorrecta. Acceso denegado.")

# --- Importancia del 'salt' (ejemplo, no harías esto en la práctica) ---
# bcrypt genera un salt único para cada hash, lo que significa que la misma contraseña
# hasheada dos veces tendrá dos hashes diferentes.
hashed_password_2 = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(rounds=12))
print(f"\\nMismo password, diferente hash debido al salt: {hashed_password_2.decode('utf-8')}")
# Esto es fundamental para prevenir ataques de tablas arcoíris.
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 4,
    'title_level': 'Arquitectura Avanzada',
    'topic': 'Mensajería',
    'subtopic': 'RabbitMQ',
    'definition': '''
RabbitMQ es un sistema de mensajería de código abierto que implementa el protocolo AMQP (Advanced Message Queuing Protocol). Permite la comunicación entre aplicaciones y servicios mediante el intercambio de mensajes.

¿Te preguntas cómo facilita RabbitMQ la comunicación entre componentes?

RabbitMQ actúa como intermediario entre productores y consumidores de mensajes, almacenando los mensajes en colas hasta que son consumidos. Esto permite una comunicación asíncrona y desacoplada entre los diferentes componentes de un sistema. Por ejemplo, una aplicación web puede enviar un mensaje a RabbitMQ para procesar una tarea intensiva, y un servicio separado puede consumir ese mensaje y realizar la tarea sin afectar la capacidad de respuesta de la aplicación web.

Además, RabbitMQ ofrece características como enrutamiento flexible de mensajes, alta disponibilidad y soporte para múltiples protocolos de mensajería, lo que lo convierte en una opción robusta para arquitecturas de microservicios y sistemas distribuidos.
''',
    'code_example': '''
# Ejemplo básico de productor y consumidor con RabbitMQ en Python usando la biblioteca pika

import pika

# Conexión al servidor RabbitMQ
conexion = pika.BlockingConnection(pika.ConnectionParameters('localhost'))
canal = conexion.channel()

# Declarar una cola llamada 'tareas'
canal.queue_declare(queue='tareas')

# Enviar un mensaje a la cola
canal.basic_publish(exchange='',
                    routing_key='tareas',
                    body='Procesar datos de usuario')
print("Mensaje enviado a la cola 'tareas'.")

conexion.close()

# Comentario: Este ejemplo muestra cómo un productor puede enviar mensajes a una cola en RabbitMQ. Un consumidor separado puede leer de esta cola y procesar los mensajes de forma asíncrona.
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 4,
    'title_level': 'Arquitectura Avanzada',
    'topic': 'Mensajería',
    'subtopic': 'Kafka',
    'definition': '''
Apache Kafka es una plataforma de mensajería distribuida diseñada para manejar flujos de datos en tiempo real con alta tolerancia a fallos y escalabilidad.

¿Te preguntas cómo Kafka gestiona grandes volúmenes de datos de manera eficiente?

Kafka organiza los mensajes en temas (topics), que a su vez se dividen en particiones. Los productores envían mensajes a estos temas, y los consumidores los leen de las particiones. Esta arquitectura permite que múltiples consumidores lean mensajes en paralelo, mejorando el rendimiento y la escalabilidad.

Además, Kafka almacena los mensajes en disco durante un período configurable, lo que permite a los consumidores leer mensajes pasados y garantiza la durabilidad de los datos. Es ampliamente utilizado en sistemas que requieren procesamiento de eventos en tiempo real, como monitoreo de sistemas, análisis de logs y transmisión de datos en aplicaciones financieras.
''',
    'code_example': '''
# Ejemplo básico de productor y consumidor con Kafka en Python usando la biblioteca kafka-python

from kafka import KafkaProducer, KafkaConsumer

# Crear un productor que envía mensajes al tema 'eventos'
productor = KafkaProducer(bootstrap_servers='localhost:9092')
productor.send('eventos', b'Usuario registrado')
productor.close()

# Crear un consumidor que lee mensajes del tema 'eventos'
consumidor = KafkaConsumer('eventos', bootstrap_servers='localhost:9092')
for mensaje in consumidor:
    print(f"Mensaje recibido: {mensaje.value.decode('utf-8')}")

# Comentario: Este ejemplo muestra cómo un productor puede enviar mensajes a un tema en Kafka, y un consumidor puede leer esos mensajes para procesarlos en tiempo real.
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 4,
    'title_level': 'Arquitectura Avanzada',
    'topic': 'Mensajería',
    'subtopic': 'Celery',
    'definition': '''
Celery es una biblioteca de Python para la ejecución de tareas asíncronas y la programación de trabajos periódicos, utilizando un sistema de colas de mensajes.

¿Te preguntas cómo Celery ayuda a manejar tareas en segundo plano?

Celery permite que una aplicación delegue tareas que pueden ejecutarse de forma asíncrona, como el envío de correos electrónicos o el procesamiento de imágenes, a trabajadores (workers) que las ejecutan en segundo plano. Esto mejora la capacidad de respuesta de la aplicación principal y permite escalar el procesamiento de tareas según la demanda.

Celery se integra fácilmente con brokers de mensajes como RabbitMQ o Redis, y ofrece características como el reintento automático de tareas fallidas, seguimiento del estado de las tareas y programación de tareas periódicas, lo que lo convierte en una herramienta poderosa para gestionar cargas de trabajo asíncronas en aplicaciones Python.
''',
    'code_example': '''
# Ejemplo básico de uso de Celery con Redis como broker

# archivo: tareas.py
from celery import Celery

app = Celery('tareas', broker='redis://localhost:6379/0')

@app.task
def sumar(a, b):
    return a + b

# archivo: main.py
from tareas import sumar

# Enviar una tarea para sumar 4 y 6
resultado = sumar.delay(4, 6)

# Obtener el resultado de la tarea
print(f"Resultado: {resultado.get(timeout=10)}")

# Comentario: Este ejemplo muestra cómo definir una tarea asíncrona con Celery y cómo invocarla desde otra parte de la aplicación. La tarea se ejecuta en segundo plano, y el resultado se puede obtener posteriormente.
'''
  });
}

Future<void> insertPythonSrLevel5Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 5,
    'title_level': 'DevOps para Python',
    'topic': 'CI/CD',
    'subtopic': 'GitHub Actions',
    'definition': '''
**GitHub Actions** es una plataforma de Integración Continua y Entrega Continua (CI/CD) directamente integrada en GitHub. Piensa en ella como tu asistente personal de desarrollo automatizado. Permite automatizar tareas directamente en tus repositorios de GitHub, como construir, probar y desplegar tu código cada vez que haces un cambio. Esto es fundamental para el desarrollo moderno porque te ayuda a asegurarte de que tu código siempre esté funcionando y listo para ser entregado, minimizando errores humanos y acelerando el ciclo de lanzamiento.

¿Te estás preguntando por qué esto importa y cómo funciona? Pues bien, imagina que trabajas en un proyecto con un equipo. Cada vez que alguien sube código, quieres asegurarte de que no rompe nada y que se integra bien con el resto del proyecto. Antes, esto significaba hacer muchas pruebas manuales, lo cual es lento y propenso a errores. GitHub Actions resuelve esto permitiéndote definir "workflows" (flujos de trabajo) en archivos YAML. Estos workflows son una serie de pasos que se ejecutan automáticamente en respuesta a eventos específicos, como un 'push' a una rama o la creación de un 'pull request'. Puedes configurar estos workflows para que, por ejemplo, instalen las dependencias de tu proyecto, ejecuten tus pruebas unitarias y de integración, construyan tus artefactos de despliegue y, si todo va bien, incluso desplieguen tu aplicación en un servidor.

La belleza de GitHub Actions radica en su simplicidad y su integración nativa con el ecosistema de GitHub. Puedes usar "actions" predefinidas de la comunidad (como las que instalan versiones específicas de Python) o crear las tuyas propias. Esto significa que puedes construir pipelines de CI/CD muy potentes con relativamente poco esfuerzo, manteniendo tu código de alta calidad y reduciendo el tiempo desde que escribes una línea de código hasta que está en producción.
''',
    'code_example': '''
# Ejemplo de un flujo de trabajo básico de GitHub Actions para un proyecto Python
# Guarda esto como .github/workflows/python_ci.yml en tu repositorio

name: Python CI

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest # El sistema operativo donde se ejecutará el workflow

    steps:
    - name: Checkout del código
      uses: actions/checkout@v3 # Acción para obtener el código del repositorio

    - name: Configurar Python
      uses: actions/setup-python@v4
      with:
        python-version: '3.9' # La versión de Python a usar

    - name: Instalar dependencias
      run: |
        python -m pip install --upgrade pip
        pip install -r requirements.txt # Asume que tienes un requirements.txt

    - name: Ejecutar pruebas
      run: |
        pytest # Asume que usas pytest para tus pruebas
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 5,
    'title_level': 'DevOps para Python',
    'topic': 'CI/CD',
    'subtopic': 'Dockerización',
    'definition': '''
La **Dockerización** es el proceso de empaquetar una aplicación y todas sus dependencias (bibliotecas, configuraciones, etc.) en un contenedor Docker. Piensa en un contenedor Docker como una pequeña caja estandarizada y autónoma que contiene todo lo necesario para que tu aplicación se ejecute, sin importar dónde se encuentre. Esto significa que si tu aplicación funciona en tu máquina local dentro de Docker, funcionará exactamente igual en cualquier otro lugar donde Docker esté instalado: en un servidor de pruebas, en producción, o en la máquina de otro desarrollador.

Seguramente te preguntarás de qué va todo esto y por qué es tan revolucionario. Antes de Docker, era común que las aplicaciones "funcionaran en mi máquina, pero no en la tuya" o en el servidor. Esto se debía a diferencias en los sistemas operativos, versiones de bibliotecas o configuraciones. Docker resuelve este problema de "funciona en mi máquina" al crear un entorno aislado y reproducible. Al encapsular tu aplicación en un contenedor, eliminas las inconsistencias del entorno. Esto es un cambio radical para el desarrollo, las pruebas y el despliegue.

Además, la dockerización facilita enormemente la escalabilidad y la gestión de aplicaciones. Puedes ejecutar múltiples instancias de tu aplicación en un mismo servidor sin que interfieran entre sí, y desplegar nuevas versiones o retroceder a versiones anteriores de manera mucho más rápida y segura. Para los desarrolladores de Python, esto significa que pueden garantizar que sus entornos de desarrollo y producción sean idénticos, evitando dolores de cabeza relacionados con la compatibilidad de versiones de Python, dependencias, o configuraciones del sistema operativo. Es una herramienta esencial en cualquier pipeline de CI/CD moderno.
''',
    'code_example': '''
# Ejemplo de un Dockerfile simple para una aplicación Python
# Guarda esto en la raíz de tu proyecto como 'Dockerfile'

# Usa una imagen base oficial de Python
FROM python:3.9-slim-buster

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el archivo de requisitos e instala las dependencias
# Esto se hace primero para aprovechar el cache de Docker si los requisitos no cambian
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia el resto del código de la aplicación al contenedor
COPY . .

# Expone el puerto en el que la aplicación escuchará (si es una app web)
EXPOSE 8000

# Comando para ejecutar la aplicación cuando el contenedor se inicie
# Asume que tienes un archivo 'main.py' y un servidor Gunicorn para una app Flask/Django/FastAPI
# CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:8000", "main:app"]
# O si es un script simple:
CMD ["python", "app.py"]

# --- Cómo construir y ejecutar la imagen (comandos en tu terminal) ---

# 1. Construir la imagen Docker desde el Dockerfile:
#    docker build -t mi-app-python .
#    (-t asigna un nombre/tag a la imagen, el '.' indica que el Dockerfile está en el directorio actual)

# 2. Ejecutar la aplicación en un contenedor:
#    docker run -p 8000:8000 mi-app-python
#    (-p mapea el puerto 8000 del host al puerto 8000 del contenedor)

# 3. Listar las imágenes Docker disponibles:
#    docker images

# 4. Listar los contenedores en ejecución:
#    docker ps
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 5,
    'title_level': 'DevOps para Python',
    'topic': 'CI/CD',
    'subtopic': 'Testing en CI',
    'definition': '''
El **Testing en CI** se refiere a la práctica de ejecutar automáticamente las pruebas de tu código como parte de tu pipeline de Integración Continua (CI). Esto significa que cada vez que se envía un cambio de código a tu repositorio, el sistema de CI (como GitHub Actions que acabamos de ver) se encarga de ejecutar todas tus pruebas unitarias, de integración e incluso funcionales. El objetivo principal es detectar errores y regresiones lo antes posible, idealmente antes de que el código se fusione con la rama principal del proyecto.

¿Te estás preguntando por qué esto importa? Pensemos por un momento en un escenario de desarrollo tradicional donde los desarrolladores prueban su código localmente y solo ocasionalmente se ejecuta un conjunto completo de pruebas. Esto puede llevar a que los errores se detecten tarde en el ciclo de desarrollo, cuando ya se han acumulado muchos cambios, haciendo que sea mucho más difícil y costoso identificar la causa raíz y solucionarla. Al integrar el testing en el proceso de CI, cualquier error introducido por un nuevo cambio se detecta casi de inmediato. Si las pruebas fallan, el pipeline de CI se detiene y notifica al equipo, lo que permite corregir el problema rápidamente.

Implementar el testing en CI con Python es bastante directo. Utilizas tus frameworks de prueba existentes (como `pytest` o `unittest`), y los configuras para que se ejecuten en tu plataforma de CI/CD. La plataforma se encargará de configurar el entorno (instalar Python, dependencias), ejecutar los comandos de prueba y reportar los resultados. Esto no solo mejora la calidad del código al atrapar bugs temprano, sino que también da a los desarrolladores la confianza de que sus cambios no están rompiendo la funcionalidad existente, lo que acelera la entrega de nuevas características y mantiene un ritmo de desarrollo saludable.
''',
    'code_example': '''
# No hay un "código de testing en CI" per se, ya que es la ejecución de tus pruebas existentes
# dentro de un entorno de CI. El ejemplo más relevante es cómo se configura un pipeline CI
# para ejecutar esas pruebas.

# Retomando el ejemplo de GitHub Actions (ver subtopic 'GitHub Actions'):

# .github/workflows/python_ci.yml
name: Python CI

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout del código
      uses: actions/checkout@v3

    - name: Configurar Python
      uses: actions/setup-python@v4
      with:
        python-version: '3.9'

    - name: Instalar dependencias
      run: |
        python -m pip install --upgrade pip
        pip install -r requirements.txt

    - name: Ejecutar pruebas # Este es el paso clave para el "Testing en CI"
      run: |
        pytest # Ejecuta todas las pruebas encontradas por pytest
        # También podrías ejecutar:
        # python -m unittest discover # Si usas el módulo unittest

# --- Archivo de ejemplo para pytest (tests/test_calculator.py) ---
# Necesitarías un archivo de pruebas en tu proyecto, por ejemplo:
#
# # tests/test_calculator.py
# class Calculator:
#     def add(self, a, b):
#         return a + b
#
#     def subtract(self, a, b):
#         return a - b
#
# def test_add():
#     calc = Calculator()
#     assert calc.add(1, 2) == 3
#
# def test_subtract():
#     calc = Calculator()
#     assert calc.subtract(5, 2) == 3
#
# --- Archivo de ejemplo para unittest (tests/test_operations.py) ---
#
# # tests/test_operations.py
# import unittest
#
# class Operations:
#     def multiply(self, a, b):
#         return a * b
#
# class TestOperations(unittest.TestCase):
#     def test_multiply(self):
#         op = Operations()
#         self.assertEqual(op.multiply(2, 3), 6)
#
#     def test_multiply_by_zero(self):
#         op = Operations()
#         self.assertEqual(op.multiply(5, 0), 0)
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 5,
    'title_level': 'DevOps para Python',
    'topic': 'Cloud',
    'subtopic': 'AWS Lambda',
    'definition': '''
AWS Lambda es un servicio de computación sin servidor que permite ejecutar código en respuesta a eventos sin necesidad de aprovisionar o administrar servidores. Con Lambda, puedes ejecutar funciones escritas en Python en respuesta a eventos como cambios en datos de S3, actualizaciones en DynamoDB o solicitudes HTTP a través de API Gateway.

¿Te preguntas cómo comenzar con AWS Lambda y Python?

Para crear una función Lambda en Python:

1. Accede a la consola de AWS Lambda.
2. Haz clic en "Crear función".
3. Selecciona "Autor desde cero".
4. Asigna un nombre a la función y elige Python 3.13 como entorno de ejecución.
5. Escribe tu código en el editor integrado o carga un archivo .zip con tus dependencias.
6. Configura un desencadenador, como una solicitud HTTP mediante API Gateway.
7. Haz clic en "Crear función" para desplegarla.

Una vez creada, puedes probar la función directamente desde la consola o mediante herramientas como Postman si configuraste un endpoint HTTP.
''',
    'code_example': '''
# Ejemplo básico de función Lambda en Python

def lambda_handler(event, context):
    nombre = event.get('nombre', 'Mundo')
    return {
        'statusCode': 200,
        'body': f'¡Hola, {nombre}!'
    }

# Comentario: Esta función responde con un saludo personalizado. Puedes probarla enviando un evento con el campo "nombre".
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 5,
    'title_level': 'DevOps para Python',
    'topic': 'Cloud',
    'subtopic': 'Google Cloud Functions',
    'definition': '''
Google Cloud Functions es una plataforma sin servidor que permite ejecutar funciones en respuesta a eventos, como cambios en Cloud Storage, mensajes en Pub/Sub o solicitudes HTTP. Con soporte para Python, puedes desarrollar y desplegar funciones fácilmente sin preocuparte por la infraestructura subyacente.

¿Te preguntas cómo implementar una función en Google Cloud Functions usando Python?

Para crear una función HTTP en Python:

1. Accede a la consola de Google Cloud y navega a Cloud Functions.
2. Haz clic en "Crear función".
3. Asigna un nombre a la función y selecciona "HTTP" como tipo de desencadenador.
4. En "Entorno de ejecución", elige Python 3.13.
5. Escribe tu código en el archivo main.py y especifica las dependencias en requirements.txt.
6. Define el nombre de la función a ejecutar.
7. Haz clic en "Implementar" para desplegar la función.

Una vez desplegada, se proporcionará una URL que puedes utilizar para invocar la función mediante solicitudes HTTP.
''',
    'code_example': '''
# main.py
def hola_mundo(request):
    nombre = request.args.get('nombre', 'Mundo')
    return f'¡Hola, {nombre}!'

# requirements.txt
# (Este archivo puede estar vacío si no hay dependencias adicionales)

# Comentario: Esta función responde con un saludo personalizado basado en el parámetro "nombre" de la solicitud HTTP.
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 5,
    'title_level': 'DevOps para Python',
    'topic': 'Cloud',
    'subtopic': 'Azure Functions',
    'definition': '''
Azure Functions es un servicio de computación sin servidor que permite ejecutar código en respuesta a eventos, como solicitudes HTTP, mensajes en colas o cambios en bases de datos. Con soporte para Python, puedes desarrollar funciones utilizando el modelo de programación v2, que ofrece una experiencia más integrada con decoradores y una estructura de proyecto simplificada.

¿Te preguntas cómo crear y desplegar una función en Azure Functions usando Python?

Para crear una función HTTP en Python:

1. Instala Visual Studio Code junto con las extensiones de Azure Functions y Python.
2. Abre Visual Studio Code y presiona F1, luego selecciona "Azure Functions: Crear nuevo proyecto".
3. Elige Python como lenguaje y selecciona el modelo de programación v2.
4. Selecciona un desencadenador HTTP y asigna un nombre a la función.
5. Escribe tu código en el archivo function_app.py.
6. Para probar localmente, presiona F5.
7. Para desplegar, utiliza la opción "Azure Functions: Desplegar a la función de Azure" desde la paleta de comandos.

Una vez desplegada, Azure proporcionará una URL que puedes utilizar para invocar la función mediante solicitudes HTTP.
''',
    'code_example': '''
# function_app.py
import azure.functions as func

app = func.FunctionApp()

@app.function_name(name="HolaMundo")
@app.route(route="saludo")
def hola_mundo(req: func.HttpRequest) -> func.HttpResponse:
    nombre = req.params.get('nombre', 'Mundo')
    return func.HttpResponse(f'¡Hola, {nombre}!', status_code=200)

# Comentario: Esta función responde con un saludo personalizado basado en el parámetro "nombre" de la solicitud HTTP.
'''
  });
}

Future<void> insertPythonSrLevel6Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Tópicos Avanzados',
    'topic': 'Data Science',
    'subtopic': 'NumPy básico',
    'definition': '''
**NumPy** (Numerical Python) es la biblioteca fundamental en el ecosistema de Python para la computación numérica, especialmente para trabajar con arrays (arreglos) y matrices multidimensionales. Piensa en NumPy como el músculo detrás de muchas operaciones matemáticas y científicas que realizas en Python. Proporciona un objeto de array llamado `ndarray` que es increíblemente eficiente para almacenar y manipular grandes volúmenes de datos numéricos. Esto es crucial porque las listas de Python, aunque versátiles, no son tan eficientes para operaciones matemáticas a gran escala.

Seguramente te preguntarás de qué va todo esto y por qué es tan importante. Pues bien, la clave de NumPy es su velocidad y eficiencia. A diferencia de las listas de Python, los arrays de NumPy están implementados en C, lo que les permite realizar operaciones mucho más rápido. Cuando trabajas con ciencia de datos, machine learning o cualquier tipo de análisis numérico, te enfrentarás a conjuntos de datos enormes. Realizar cálculos con listas Python estándar sería extremadamente lento. NumPy optimiza estas operaciones, permitiendo realizar cálculos complejos en segundos que de otra forma tomarían horas o incluso días.

Además de su velocidad, NumPy ofrece una vasta colección de funciones matemáticas para operar con estos arrays, desde operaciones aritméticas básicas hasta álgebra lineal, transformadas de Fourier y generación de números aleatorios. Esto lo convierte en la base sobre la que se construyen muchas otras bibliotecas de ciencia de datos populares, como Pandas y Scikit-learn. Si estás metiéndote en el mundo de los datos con Python, dominar NumPy es un paso esencial y te abrirá las puertas a un sinfín de posibilidades para analizar y manipular información.
''',
    'code_example': '''
import numpy as np

# --- Creación de arrays NumPy ---

# Crear un array a partir de una lista de Python
arr1 = np.array([1, 2, 3, 4, 5])
print(f"Array 1D: {arr1}")
print(f"Tipo de arr1: {type(arr1)}")
print(f"Forma de arr1: {arr1.shape}") # (5,) indica 5 elementos en 1 dimensión

# Crear un array 2D (matriz)
arr2d = np.array([[1, 2, 3], [4, 5, 6]])
print(f"\\nArray 2D:\\n{arr2d}")
print(f"Forma de arr2d: {arr2d.shape}") # (2, 3) indica 2 filas y 3 columnas

# Crear arrays con valores específicos
zeros_arr = np.zeros((2, 3)) # Array de ceros
ones_arr = np.ones((3, 2))   # Array de unos
full_arr = np.full((2, 2), 7) # Array lleno de un valor específico
print(f"\\nArray de ceros:\\n{zeros_arr}")
print(f"Array de unos:\\n{ones_arr}")
print(f"Array lleno de 7:\\n{full_arr}")

# Rango de valores (similar a range(), pero para arrays)
range_arr = np.arange(0, 10, 2) # Start, Stop (excluido), Step
print(f"\\nArray con rango: {range_arr}")

# --- Operaciones básicas con arrays ---

arr_a = np.array([10, 20, 30])
arr_b = np.array([1, 2, 3])

# Suma elemento a elemento
sum_arr = arr_a + arr_b
print(f"\\nSuma de arrays: {sum_arr}")

# Multiplicación elemento a elemento
prod_arr = arr_a * arr_b
print(f"Producto de arrays: {prod_arr}")

# Multiplicación escalar (cada elemento multiplicado por un número)
scaled_arr = arr_a * 2
print(f"Array escalado: {scaled_arr}")

# Operaciones matemáticas en un solo array
sqrt_arr = np.sqrt(arr_a)
print(f"Raíz cuadrada de arr_a: {sqrt_arr}")

# --- Indexación y Slicing ---

# Acceder a elementos
print(f"\\nPrimer elemento de arr1: {arr1[0]}")
print(f"Elemento en arr2d[0, 1]: {arr2d[0, 1]}") # Fila 0, Columna 1

# Slicing (seleccionar sub-arrays)
slice_arr1 = arr1[1:4] # Elementos desde el índice 1 hasta el 3 (4 excluido)
print(f"Slice de arr1: {slice_arr1}")

slice_arr2d = arr2d[:, 1:3] # Todas las filas, columnas 1 y 2
print(f"Slice de arr2d (columnas 1 y 2):\\n{slice_arr2d}")
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Tópicos Avanzados',
    'topic': 'Data Science',
    'subtopic': 'Pandas básico',
    'definition': '''
**Pandas** es una biblioteca de Python construida sobre NumPy, y es la herramienta de facto para el análisis y la manipulación de datos tabulares. Si NumPy es el músculo para los arrays numéricos, Pandas es el cerebro para las hojas de cálculo, proporcionando dos estructuras de datos principales: `Series` (para datos unidimensionales, como una columna de una hoja de cálculo) y `DataFrame` (para datos bidimensionales, como una tabla completa con filas y columnas).

¿Te estás preguntando por qué esto importa? Pensemos por un momento en cualquier conjunto de datos que encuentres en tu vida diaria: un archivo CSV con ventas, una hoja de Excel con registros de clientes, datos de una base de datos. Todos estos son datos tabulares. Pandas facilita enormemente la lectura, limpieza, transformación y análisis de estos datos. Sin Pandas, tendrías que lidiar con listas de listas o diccionarios anidados, lo cual se vuelve rápidamente inmanejable para conjuntos de datos grandes. Pandas simplifica estas operaciones con una sintaxis intuitiva y eficiente, permitiendo que te concentres más en el análisis y menos en la manipulación de la estructura de los datos.

Con Pandas, puedes leer datos de diferentes formatos (CSV, Excel, bases de datos), manejar valores faltantes, filtrar y seleccionar subconjuntos de datos, combinar diferentes conjuntos de datos, agrupar y agregar información, y mucho más. Es la navaja suiza de los científicos de datos, y una vez que te acostumbras a su forma de trabajar, te preguntarás cómo pudiste vivir sin ella. Es una herramienta indispensable para cualquier persona que trabaje con datos en Python, desde el análisis exploratorio hasta la preparación de datos para modelos de machine learning.
''',
    'code_example': '''
import pandas as pd
import numpy as np

# --- Creación de Series y DataFrames ---

# Crear una Serie (una columna de datos)
s = pd.Series([1, 3, 5, np.nan, 6, 8]) # np.nan representa un valor nulo
print(f"Serie de Pandas:\\n{s}")

# Crear un DataFrame a partir de un diccionario
data = {
    'nombre': ['Ana', 'Juan', 'María', 'Pedro'],
    'edad': [28, 34, 29, 42],
    'ciudad': ['Madrid', 'Barcelona', 'Valencia', 'Sevilla'],
    'puntuacion': [85, 92, 78, np.nan]
}
df = pd.DataFrame(data)
print(f"\\nDataFrame de Pandas:\\n{df}")

# --- Lectura de datos (ej. desde un archivo CSV) ---
# df_csv = pd.read_csv('tu_archivo.csv')
# print(f"\\nDataFrame desde CSV (ejemplo):\\n{df_csv.head()}") # Muestra las primeras 5 filas

# --- Exploración básica del DataFrame ---

print(f"\\nPrimeras 3 filas:\\n{df.head(3)}")
print(f"Últimas 2 filas:\\n{df.tail(2)}")
print(f"Información del DataFrame:\\n")
df.info() # Información sobre las columnas, tipos de datos y valores no nulos

print(f"\\nEstadísticas descriptivas:\\n{df.describe()}") # Estadísticas para columnas numéricas

# --- Selección de datos ---

# Seleccionar una columna (devuelve una Serie)
nombres = df['nombre']
print(f"\\nColumna 'nombre':\\n{nombres}")

# Seleccionar múltiples columnas (devuelve un DataFrame)
sub_df = df[['nombre', 'edad']]
print(f"\\nColumnas 'nombre' y 'edad':\\n{sub_df}")

# Selección por filas (iloc para índice numérico, loc para etiquetas)
print(f"\\nPrimera fila (iloc):\\n{df.iloc[0]}")
print(f"Fila donde 'nombre' es 'Juan' (loc):\\n{df.loc[df['nombre'] == 'Juan']}")

# Filtrado de datos
mayores_de_30 = df[df['edad'] > 30]
print(f"\\nPersonas mayores de 30:\\n{mayores_de_30}")

# --- Manejo de valores nulos ---
print(f"\\nDataFrame con nulos:\\n{df}")
df_cleaned = df.dropna() # Elimina filas con cualquier valor nulo
print(f"DataFrame sin nulos (dropna):\\n{df_cleaned}")

# Rellenar valores nulos
df_filled = df.fillna({'puntuacion': df['puntuacion'].mean()}) # Rellenar puntuacion con la media
print(f"DataFrame con nulos rellenados:\\n{df_filled}")

# --- Operaciones con columnas ---
df['edad_en_años'] = df['edad'] # Crear una nueva columna (ejemplo)
print(f"\\nDataFrame con nueva columna 'edad_en_años':\\n{df}")

# Filtrado incorrecto: Intentar acceder a una columna que no existe
# Esto lanzaría un KeyError:
try:
    df['email']
except KeyError as e:
    print(f"\\nError esperado: {e}. 'email' no es una columna existente.")
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Tópicos Avanzados',
    'topic': 'Data Science',
    'subtopic': 'Visualización básica (Matplotlib)',
    'definition': '''
**Matplotlib** es una biblioteca de trazado para Python que te permite crear una amplia variedad de gráficos estáticos, interactivos y animados en 2D. Es la base para muchas otras bibliotecas de visualización en Python, como Seaborn. Piensa en Matplotlib como tu lienzo digital y tus herramientas para pintar gráficos, desde simples líneas hasta complejos histogramas y diagramas de dispersión.

Seguramente te preguntarás de qué va todo esto y por qué es tan importante para la ciencia de datos. Pues bien, los números por sí solos rara vez cuentan toda la historia. La visualización de datos es fundamental para entender patrones, tendencias y valores atípicos en grandes conjuntos de datos que serían invisibles si solo miraras las tablas. Matplotlib te permite transformar esos datos abstractos en representaciones visuales claras y comprensibles, lo que facilita el análisis exploratorio de datos, la comunicación de tus hallazgos a otros y la validación de hipótesis.

Aunque su sintaxis puede parecer un poco verbosa al principio (requiere más líneas de código para gráficos simples en comparación con otras bibliotecas), su flexibilidad es inigualable. Puedes controlar casi todos los aspectos de un gráfico: desde el tipo de línea, el color de los puntos, las etiquetas de los ejes, los títulos, las leyendas, hasta la resolución y el formato de salida. Esta capacidad de personalización la convierte en una herramienta muy potente para crear visualizaciones que no solo sean informativas sino también estéticamente agradables y adecuadas para publicaciones o presentaciones. Es una habilidad esencial para cualquier científico de datos que necesite explorar y comunicar sus descubrimientos de manera efectiva.
''',
    'code_example': '''
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

# --- Gráfico de Líneas Básico ---
x = np.linspace(0, 10, 100) # 100 puntos entre 0 y 10
y = np.sin(x) # Función seno
plt.figure(figsize=(8, 4)) # Tamaño de la figura
plt.plot(x, y)
plt.title('Gráfico de la Función Seno')
plt.xlabel('Eje X')
plt.ylabel('Eje Y (sin(x))')
plt.grid(True) # Añadir una cuadrícula
plt.show() # Muestra el gráfico

# --- Gráfico de Dispersión (Scatter Plot) ---
np.random.seed(42) # Para reproducibilidad
num_puntos = 50
x_scatter = np.random.rand(num_puntos) * 10
y_scatter = np.random.rand(num_puntos) * 10
colors = np.random.rand(num_puntos) # Colores aleatorios para los puntos
sizes = np.random.rand(num_puntos) * 200 # Tamaños aleatorios para los puntos

plt.figure(figsize=(8, 5))
plt.scatter(x_scatter, y_scatter, c=colors, s=sizes, alpha=0.7, cmap='viridis')
plt.title('Gráfico de Dispersión')
plt.xlabel('Característica 1')
plt.ylabel('Característica 2')
plt.colorbar(label='Valor de Color') # Barra de color
plt.show()

# --- Histograma ---
data_hist = np.random.randn(1000) # 1000 números aleatorios de una distribución normal
plt.figure(figsize=(8, 5))
plt.hist(data_hist, bins=30, edgecolor='black', alpha=0.7)
plt.title('Histograma de Datos Normales')
plt.xlabel('Valor')
plt.ylabel('Frecuencia')
plt.show()

# --- Gráfico de Barras con Pandas (ejemplo simple) ---
# Aunque Matplotlib es la base, Pandas tiene métodos .plot() que usan Matplotlib internamente
data_bar = {'Categoría A': 20, 'Categoría B': 35, 'Categoría C': 15}
series_bar = pd.Series(data_bar)

plt.figure(figsize=(7, 4))
series_bar.plot(kind='bar', color=['skyblue', 'lightcoral', 'lightgreen'])
plt.title('Gráfico de Barras de Categorías')
plt.xlabel('Categoría')
plt.ylabel('Cantidad')
plt.xticks(rotation=0) # Evita que las etiquetas del eje x se superpongan
plt.show()

# --- Ejemplo de un error común: no llamar a plt.show() ---
# Si no llamas a plt.show(), el gráfico puede no aparecer o aparecer en un momento inesperado
# plt.plot([1, 2, 3], [4, 5, 6])
# print("Este gráfico no se mostrará hasta que se llame a plt.show() o se cierre el script.")
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Tópicos Avanzados',
    'topic': 'Machine Learning',
    'subtopic': 'scikit-learn básico',
    'definition': '''
scikit-learn es una biblioteca de código abierto en Python que proporciona herramientas eficientes para el aprendizaje automático y el análisis predictivo. Ofrece una amplia gama de algoritmos para clasificación, regresión, clustering y reducción de dimensionalidad.

¿Te preguntas cómo comenzar con scikit-learn?

Para empezar, es esencial comprender el flujo de trabajo típico en scikit-learn:

1. **Carga de datos**: Utilizar conjuntos de datos disponibles o cargar los propios.
2. **Preprocesamiento**: Escalar, normalizar o transformar los datos según sea necesario.
3. **División de datos**: Separar los datos en conjuntos de entrenamiento y prueba.
4. **Selección de modelo**: Elegir un algoritmo adecuado para el problema.
5. **Entrenamiento**: Ajustar el modelo a los datos de entrenamiento.
6. **Evaluación**: Medir el rendimiento del modelo utilizando métricas apropiadas.
7. **Predicción**: Utilizar el modelo entrenado para hacer predicciones sobre nuevos datos.

scikit-learn se integra fácilmente con otras bibliotecas como NumPy y pandas, facilitando el manejo y manipulación de datos.
''',
    'code_example': '''
# Ejemplo básico de uso de scikit-learn para clasificación

from sklearn.datasets import load_iris
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score

# Cargar el conjunto de datos Iris
iris = load_iris()
X = iris.data
y = iris.target

# Dividir en conjuntos de entrenamiento y prueba
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Crear y entrenar el modelo
modelo = RandomForestClassifier(n_estimators=100)
modelo.fit(X_train, y_train)

# Realizar predicciones
y_pred = modelo.predict(X_test)

# Evaluar la precisión
precision = accuracy_score(y_test, y_pred)
print(f'Precisión del modelo: {precision:.2f}')
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Tópicos Avanzados',
    'topic': 'Machine Learning',
    'subtopic': 'Entrenamiento de modelos',
    'definition': '''
El entrenamiento de modelos en scikit-learn implica ajustar un algoritmo de aprendizaje automático a un conjunto de datos para que pueda hacer predicciones precisas sobre datos nuevos. Este proceso incluye:

1. **Selección del modelo**: Elegir el algoritmo adecuado (por ejemplo, regresión lineal, árboles de decisión, SVM).
2. **Ajuste del modelo**: Utilizar el método `fit()` para entrenar el modelo con los datos de entrenamiento.
3. **Optimización de hiperparámetros**: Ajustar los parámetros del modelo para mejorar su rendimiento.
4. **Validación cruzada**: Evaluar la capacidad de generalización del modelo mediante técnicas como la validación cruzada k-fold.

Es fundamental evitar el sobreajuste, donde el modelo se ajusta demasiado a los datos de entrenamiento y no generaliza bien a datos nuevos.
''',
    'code_example': '''
# Ejemplo de entrenamiento de un modelo de regresión lineal

from sklearn.datasets import make_regression
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split

# Generar un conjunto de datos sintético
X, y = make_regression(n_samples=100, n_features=1, noise=10, random_state=42)

# Dividir en conjuntos de entrenamiento y prueba
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Crear y entrenar el modelo
modelo = LinearRegression()
modelo.fit(X_train, y_train)

# Coeficientes del modelo
print(f'Coeficiente: {modelo.coef_[0]:.2f}')
print(f'Intercepción: {modelo.intercept_:.2f}')
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Tópicos Avanzados',
    'topic': 'Machine Learning',
    'subtopic': 'Evaluación',
    'definition': '''
La evaluación de modelos en scikit-learn es crucial para medir su rendimiento y capacidad de generalización. Algunas métricas comunes incluyen:

- **Precisión**: Proporción de predicciones correctas sobre el total de casos.
- **Recall (Sensibilidad)**: Capacidad del modelo para identificar correctamente las instancias positivas.
- **F1-score**: Media armónica entre precisión y recall.
- **Matriz de confusión**: Tabla que muestra las predicciones correctas e incorrectas clasificadas por clase.

Además, scikit-learn ofrece herramientas como la validación cruzada para evaluar el rendimiento del modelo en diferentes particiones del conjunto de datos.
''',
    'code_example': '''
# Ejemplo de evaluación de un modelo de clasificación

from sklearn.datasets import load_breast_cancer
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import classification_report, confusion_matrix

# Cargar el conjunto de datos
datos = load_breast_cancer()
X = datos.data
y = datos.target

# Dividir en conjuntos de entrenamiento y prueba
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Crear y entrenar el modelo
modelo = DecisionTreeClassifier()
modelo.fit(X_train, y_train)

# Realizar predicciones
y_pred = modelo.predict(X_test)

# Evaluar el modelo
print('Matriz de confusión:')
print(confusion_matrix(y_test, y_pred))
print('\nInforme de clasificación:')
print(classification_report(y_test, y_pred))
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Tópicos Avanzados',
    'topic': 'Web Scraping',
    'subtopic': 'BeautifulSoup',
    'definition': '''
**BeautifulSoup** es una biblioteca de Python que se utiliza para "raspar" información de páginas web, lo que significa extraer datos estructurados de documentos HTML y XML. Piensa en ella como una herramienta que te ayuda a navegar por la estructura de una página web, como si estuvieras leyendo un libro y quisieras encontrar todos los títulos o todos los párrafos que contienen una palabra específica. BeautifulSoup es excelente para analizar el código HTML o XML y encontrar la información que necesitas de manera sencilla y eficiente.

¿Te estás preguntando por qué esto importa? Pues bien, la web está llena de datos valiosos, pero a menudo están encerrados dentro de páginas web diseñadas para ser leídas por humanos, no por programas. El web scraping, usando herramientas como BeautifulSoup, te permite acceder a esta información de forma programática. Imagina que quieres recolectar los precios de productos de una tienda online, las noticias de varios periódicos, o los datos de un directorio. BeautifulSoup te facilita el trabajo al ofrecer métodos intuitivos para buscar, seleccionar y extraer elementos específicos dentro del árbol HTML de una página, como etiquetas (`<div>`, `<a>`), atributos (`id`, `class`) o incluso el texto dentro de ellas.

Aunque BeautifulSoup por sí misma no descarga la página web (para eso necesitarías algo como la biblioteca `requests`), es la compañera perfecta para analizar el contenido una vez que lo tienes. Es muy flexible y tolerante con HTML mal formado, lo que la hace ideal para trabajar con la "web real" donde el código no siempre es perfecto. Es una herramienta poderosa para tareas de recolección de datos y automatización de procesos que implican interactuar con la información en la web.
''',
    'code_example': '''
# pip install beautifulsoup4 requests

import requests
from bs4 import BeautifulSoup

# URL de la página web que queremos "raspar"
url = 'http://quotes.toscrape.com/' # Una página diseñada para web scraping

# Realizar una petición HTTP GET para obtener el contenido de la página
response = requests.get(url)

# Verificar que la petición fue exitosa (código de estado 200)
if response.status_code == 200:
    # Parsear el contenido HTML de la página con BeautifulSoup
    soup = BeautifulSoup(response.text, 'html.parser')

    print("--- Títulos de las citas ---")
    # Encontrar todos los divs con la clase 'quote'
    quotes = soup.find_all('div', class_='quote')

    for quote in quotes:
        # Dentro de cada cita, encontrar el texto de la cita y el autor
        text = quote.find('span', class_='text').text
        author = quote.find('small', class_='author').text
        print(f'"{text}" - {author}')

    print("\\n--- Enlaces (URLs) en la página ---")
    # Encontrar todos los enlaces (etiquetas 'a')
    links = soup.find_all('a')
    for link in links:
        href = link.get('href') # Obtener el valor del atributo 'href'
        if href and not href.startswith('#'): # Ignorar enlaces internos
            print(f"Enlace: {link.text.strip()} -> {href}")

else:
    print(f"Error al obtener la página: {response.status_code}")

# --- Ejemplo de un error común: intentar acceder a un elemento que no existe ---
# Si intentas encontrar un elemento que no está presente, `.find()` devolverá `None`.
# Acceder a un atributo o método de `None` causará un error.
# wrong_element = soup.find('div', class_='clase_inexistente')
# try:
#     print(wrong_element.text) # Esto causaría un AttributeError
# except AttributeError as e:
#     print(f"\\nError esperado: {e}. El elemento no fue encontrado.")
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Tópicos Avanzados',
    'topic': 'Web Scraping',
    'subtopic': 'Scrapy',
    'definition': '''
**Scrapy** es un framework de Python de alto rendimiento y código abierto para web scraping y crawling. A diferencia de BeautifulSoup, que es una biblioteca para parsear HTML, Scrapy es un marco de trabajo completo que maneja todo el ciclo de vida del scraping: desde la descarga de las páginas web, el manejo de peticiones asíncronas, la extracción de datos estructurados, hasta el almacenamiento de la información. Piensa en Scrapy como una fábrica automatizada de recolección de datos web, donde tú defines qué quieres recolectar y Scrapy se encarga de todo el proceso de producción.

¿Te estás preguntando por qué esto importa? Si tu proyecto de web scraping es pequeño y puntual, BeautifulSoup es suficiente. Pero si necesitas raspar grandes cantidades de datos de muchos sitios web, lidiar con el manejo de sesiones, evitar bloqueos de IP, seguir enlaces complejos, y almacenar los datos de manera estructurada, Scrapy es la herramienta ideal. Ofrece funcionalidades integradas para gestionar la concurrencia (descargar varias páginas a la vez), reintentar peticiones fallidas, usar proxies, y simular el comportamiento de un navegador web. Esto lo hace increíblemente potente para proyectos de recolección de datos a escala.

Scrapy sigue un modelo de "Spiders" (arañas), que son clases que tú defines para instruir a Scrapy cómo navegar por un sitio web y cómo extraer los datos. Las Spiders saben cómo enviar peticiones, cómo parsear las respuestas (a menudo usando selectores CSS o XPath, aunque también se integra con BeautifulSoup), y cómo guardar los datos en formatos como CSV, JSON o bases de datos. Es una curva de aprendizaje un poco más pronunciada que BeautifulSoup, pero la inversión vale la pena para cualquier proyecto serio de web scraping.
''',
    'code_example': '''
# pip install scrapy

# Este ejemplo no es un script de Python ejecutable directamente,
# sino una representación de la estructura de una Spider de Scrapy.
# Para ejecutar Scrapy, normalmente se usa el comando 'scrapy crawl nombre_de_tu_spider'.

# --- Ejemplo de una Spider de Scrapy (guardado como 'myproject/myproject/spiders/quotes_spider.py') ---

import scrapy

class QuotesSpider(scrapy.Spider):
    name = 'quotes' # Nombre único para tu spider
    start_urls = [ # URLs desde donde la spider comenzará a raspar
        'http://quotes.toscrape.com/page/1/',
        'http://quotes.toscrape.com/page/2/',
    ]

    def parse(self, response):
        # Este método es llamado para manejar cada respuesta descargada por la spider.
        # 'response' contiene el contenido de la página.

        # Itera sobre los divs que contienen las citas
        for quote in response.css('div.quote'):
            yield { # 'yield' es como 'return' pero para generar múltiples ítems
                'text': quote.css('span.text::text').get(), # Extrae el texto de la cita
                'author': quote.css('small.author::text').get(), # Extrae el autor
                'tags': quote.css('div.tags a.tag::text').getall(), # Extrae todas las etiquetas
            }

        # Sigue el enlace a la siguiente página (paginación)
        next_page = response.css('li.next a::attr(href)').get()
        if next_page is not None:
            yield response.follow(next_page, callback=self.parse) # Envía una nueva petición y la maneja con el mismo método 'parse'

# --- Cómo ejecutar esta Spider (desde la terminal, dentro de la raíz de tu proyecto Scrapy) ---
# 1. Crear un nuevo proyecto Scrapy:
#    scrapy startproject myproject
# 2. Navegar al directorio del proyecto:
#    cd myproject
# 3. Crear el archivo de la spider (ej. myproject/spiders/quotes_spider.py) y pegar el código de arriba.
# 4. Ejecutar la spider y guardar la salida en un archivo JSON:
#    scrapy crawl quotes -o quotes.json

# --- Ejemplo de un error común: Selectores CSS/XPath incorrectos ---
# Si los selectores CSS o XPath (como 'span.text::text') no coinciden con la estructura HTML,
# los datos extraídos serán 'None' o listas vacías. Esto requiere inspeccionar el HTML de la página.
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Sr',
    'level': 6,
    'title_level': 'Tópicos Avanzados',
    'topic': 'Web Scraping',
    'subtopic': 'APIs REST',
    'definition': '''
Las **APIs REST** (Representational State Transfer Application Programming Interfaces) son un conjunto de principios arquitectónicos para diseñar servicios web. En el contexto de la extracción de datos, una API REST es como una "puerta trasera" o un "contrato" que un servidor web ofrece para que otras aplicaciones puedan interactuar con sus datos y funcionalidades de una manera estructurada y predecible. A diferencia del web scraping tradicional, donde "raspas" el HTML de una página, con una API REST ya te están dando los datos listos en un formato estructurado (generalmente JSON o XML).

¿Te estás preguntando por qué esto importa y cómo se compara con el web scraping? Pensemos por un momento en un escenario donde quieres obtener información del clima. Podrías intentar raspar una página web del pronóstico, pero sería complicado lidiar con la estructura HTML que cambia constantemente. Sin embargo, muchos proveedores de clima ofrecen una API REST. Tú simplemente envías una petición a una URL específica de la API, y a cambio recibes los datos del clima en un formato fácil de leer por tu programa, como un objeto JSON. Esto es mucho más robusto y fiable que el web scraping, ya que la API está diseñada explícitamente para el consumo programático.

Trabajar con APIs REST es generalmente la forma preferida de obtener datos de un servicio web, siempre que esté disponible. Es más eficiente, menos propenso a errores (porque el formato de los datos es consistente) y respeta las políticas del proveedor del servicio. La mayoría de los servicios modernos, desde redes sociales hasta plataformas de comercio electrónico, ofrecen APIs REST para que los desarrolladores puedan construir aplicaciones que se integren con ellos. Dominar cómo interactuar con estas APIs es una habilidad invaluable para cualquier desarrollador que necesite acceder a datos o funcionalidades de servicios externos.
''',
    'code_example': '''
# pip install requests

import requests
import json

# URL de una API REST pública de ejemplo (datos de usuarios de JSONPlaceholder)
api_url = 'https://jsonplaceholder.typicode.com/users'

# --- Realizar una petición GET para obtener datos de usuarios ---
print("--- Obteniendo todos los usuarios ---")
response_get = requests.get(api_url)

if response_get.status_code == 200:
    users = response_get.json() # Parsear la respuesta JSON a un objeto Python (lista de diccionarios)
    for user in users[:3]: # Imprimir los primeros 3 usuarios para no saturar la salida
        print(f"ID: {user['id']}, Nombre: {user['name']}, Email: {user['email']}")
else:
    print(f"Error al obtener usuarios: {response_get.status_code}")

# --- Realizar una petición GET para obtener un usuario específico por ID ---
user_id = 1
specific_user_url = f'{api_url}/{user_id}'
print(f"\\n--- Obteniendo usuario con ID {user_id} ---")
response_single_user = requests.get(specific_user_url)

if response_single_user.status_code == 200:
    user = response_single_user.json()
    print(f"ID: {user['id']}, Nombre: {user['name']}, Teléfono: {user['phone']}")
else:
    print(f"Error al obtener usuario {user_id}: {response_single_user.status_code}")

# --- Realizar una petición POST para crear un nuevo recurso (ejemplo) ---
# Algunas APIs requieren autenticación para POST/PUT/DELETE
new_user_data = {
    'name': 'Mi Nuevo Usuario',
    'username': 'nuevo_user',
    'email': 'nuevo.user@ejemplo.com'
}
print("\\n--- Creando un nuevo usuario (POST) ---")
response_post = requests.post(api_url, json=new_user_data)

if response_post.status_code == 201: # El código 201 Created indica que el recurso fue creado
    created_user = response_post.json()
    print(f"Usuario creado exitosamente: {created_user}")
else:
    print(f"Error al crear usuario: {response_post.status_code}, {response_post.text}")

# --- Ejemplo de error: URL incorrecta o recurso no encontrado ---
invalid_url = 'https://jsonplaceholder.typicode.com/nonexistent_resource'
try:
    response_invalid = requests.get(invalid_url)
    print(f"\\nRespuesta para URL inválida: {response_invalid.status_code}")
except requests.exceptions.RequestException as e:
    print(f"\\nError de conexión o petición: {e}")
'''
  });
}
