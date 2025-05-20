import 'package:sqflite_common/sqlite_api.dart';

Future<void> insertPythonMidLevel1Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Estructuras de Datos Avanzadas',
    'topic': 'Algoritmos',
    'subtopic': 'Recursión',
    'definition': '''
La recursión es una técnica de programación donde una función se llama a sí misma para resolver un problema. Piensa en ella como una muñeca rusa: cada muñeca contiene una versión más pequeña de sí misma, hasta que llegas a la más pequeña que ya no contiene nada.

¿Te estás preguntando por qué esto importa?

La recursión es una forma elegante y poderosa de resolver problemas que se pueden dividir en subproblemas más pequeños del mismo tipo. Es muy común en algoritmos de búsqueda, ordenamiento y procesamiento de estructuras de datos como árboles.

La clave de la recursión es tener una "condición base" que detenga la llamada recursiva. Sin una condición base, la función se llamaría a sí misma infinitamente, lo que provocaría un error de desbordamiento de la pila (Stack Overflow). Un ejemplo clásico es el cálculo del factorial de un número.
''',
    'code_example': '''
# Ejemplo: Factorial de un número usando recursión
def factorial(n):
    # Condición base: si n es 0 o 1, el factorial es 1
    if n == 0 or n == 1:
        return 1
    # Llamada recursiva: n * factorial de (n-1)
    else:
        return n * factorial(n - 1)

print(factorial(5))  # Salida: 120 (5 * 4 * 3 * 2 * 1)

# Ejemplo de un error común: recursión infinita sin condición base
# def bucle_infinito():
#     bucle_infinito()
# bucle_infinito()
# Esto resultaría en un RecursionError (maximum recursion depth exceeded)
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Estructuras de Datos Avanzadas',
    'topic': 'Algoritmos',
    'subtopic': 'Algoritmos de ordenamiento',
    'definition': '''
Los algoritmos de ordenamiento son procedimientos que organizan los elementos de una lista o array en un orden específico, ya sea ascendente o descendente.

¿Te estás preguntando por qué son importantes?

El ordenamiento es una operación fundamental en la informática. Facilita la búsqueda, la fusión y otras operaciones con datos. Pensemos por un momento en una base de datos de estudiantes; si los nombres están ordenados alfabéticamente, encontrar a un estudiante específico es mucho más rápido.

Existen muchos algoritmos de ordenamiento diferentes, cada uno con sus propias ventajas y desventajas en términos de rendimiento. Algunos de los más conocidos incluyen:

-   **Burbuja (Bubble Sort):** Un algoritmo simple que compara pares de elementos adyacentes y los intercambia si están en el orden incorrecto. Repite hasta que no haya más intercambios.
-   **Selección (Selection Sort):** Encuentra el elemento mínimo en la parte no ordenada y lo coloca al principio.
-   **Inserción (Insertion Sort):** Construye la lista ordenada un elemento a la vez, insertando cada nuevo elemento en su posición correcta.
-   **Fusión (Merge Sort):** Un algoritmo divide y vencerás que divide la lista en mitades, las ordena recursivamente y luego las fusiona.
-   **Rápido (Quick Sort):** Otro algoritmo divide y vencerás que selecciona un "pivote" y particiona la lista alrededor de él.
''',
    'code_example': '''
# Ejemplo: Algoritmo de ordenamiento de burbuja (Bubble Sort)
def bubble_sort(arr):
    n = len(arr)
    for i in range(n - 1):
        # Últimos i elementos ya están en su lugar
        for j in range(0, n - i - 1):
            # Recorre el array de 0 a n-i-1
            # Intercambia si el elemento encontrado es mayor
            # que el siguiente elemento
            if arr[j] > arr[j + 1]:
                arr[j], arr[j + 1] = arr[j + 1], arr[j]
    return arr

numeros = [64, 34, 25, 12, 22, 11, 90]
print("Lista desordenada:", numeros)
lista_ordenada = bubble_sort(numeros)
print("Lista ordenada:", lista_ordenada) # Salida: Lista ordenada: [11, 12, 22, 25, 34, 64, 90]
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Estructuras de Datos Avanzadas',
    'topic': 'Algoritmos',
    'subtopic': 'Búsqueda binaria',
    'definition': '''
La búsqueda binaria es un algoritmo de búsqueda eficiente para encontrar un elemento en una lista ordenada. A diferencia de la búsqueda lineal, que revisa cada elemento, la búsqueda binaria divide repetidamente la porción de la lista que podría contener el elemento.

¿Te estás preguntando por qué esto importa?

La eficiencia es clave, especialmente cuando se trabaja con grandes conjuntos de datos. Pensemos por un momento en buscar una palabra en un diccionario: no empiezas desde la primera página, sino que abres por la mitad, y si no está ahí, abres por la mitad de la mitad, y así sucesivamente. La búsqueda binaria opera de manera similar.

Para que la búsqueda binaria funcione, la lista *debe* estar ordenada. El algoritmo compara el elemento objetivo con el elemento central de la lista. Si son iguales, se ha encontrado el elemento. Si el elemento objetivo es menor, la búsqueda continúa en la mitad inferior de la lista; si es mayor, en la mitad superior. Este proceso se repite hasta que se encuentra el elemento o se determina que no está presente.
''',
    'code_example': '''
# Ejemplo: Búsqueda binaria
def busqueda_binaria(arr, objetivo):
    bajo = 0
    alto = len(arr) - 1

    while bajo <= alto:
        medio = (bajo + alto) // 2
        # Si el elemento del medio es el objetivo
        if arr[medio] == objetivo:
            return medio
        # Si el objetivo es mayor, ignorar la mitad izquierda
        elif arr[medio] < objetivo:
            bajo = medio + 1
        # Si el objetivo es menor, ignorar la mitad derecha
        else:
            alto = medio - 1
    return -1  # El elemento no fue encontrado

lista_ordenada = [11, 12, 22, 25, 34, 64, 90]
print("Índice de 25:", busqueda_binaria(lista_ordenada, 25)) # Salida: Índice de 25: 3
print("Índice de 100:", busqueda_binaria(lista_ordenada, 100)) # Salida: Índice de 100: -1
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Estructuras de Datos Avanzadas',
    'topic': 'Algoritmos',
    'subtopic': 'Complejidad algorítmica (Big-O)',
    'definition': '''
La complejidad algorítmica, a menudo expresada usando la notación Big-O (O), es una forma de describir qué tan bien se escala un algoritmo a medida que aumenta el tamaño de la entrada. No mide el tiempo exacto en segundos, sino cómo crece el tiempo de ejecución (o el espacio de memoria) del algoritmo en relación con el tamaño de los datos de entrada.

¿Te estás preguntando por qué esto importa?

Entender la complejidad algorítmica es crucial para escribir código eficiente, especialmente cuando se trabaja con grandes volúmenes de datos o en sistemas que requieren alto rendimiento. Pensemos por un momento en buscar un nombre en una guía telefónica; si la guía tiene 100 nombres, quizás un método lento funcione, pero si tiene millones, necesitas un método muy eficiente.

Algunos ejemplos comunes de notación Big-O incluyen:

-   **O(1) - Complejidad constante:** El tiempo de ejecución es el mismo, sin importar el tamaño de la entrada.
-   **O(log n) - Complejidad logarítmica:** El tiempo de ejecución disminuye a medida que la entrada crece. La búsqueda binaria es un ejemplo.
-   **O(n) - Complejidad lineal:** El tiempo de ejecución crece linealmente con el tamaño de la entrada. Recorrer una lista es un ejemplo.
-   **O(n log n) - Complejidad logarítmica lineal:** Común en algoritmos de ordenamiento eficientes como Merge Sort.
-   **O(n^2) - Complejidad cuadrática:** El tiempo de ejecución crece cuadráticamente con el tamaño de la entrada. Algoritmos como Bubble Sort a menudo tienen esta complejidad.
''',
    'code_example': '''
# Ejemplo: O(1) - Acceso a un elemento por índice
lista = [1, 2, 3, 4, 5]
elemento = lista[0] # Acceso constante, no importa el tamaño de la lista

# Ejemplo: O(n) - Recorrer una lista
def imprimir_lista(lista_items):
    for item in lista_items:
        print(item) # El tiempo crece linealmente con el número de items

# Ejemplo: O(n^2) - Bucles anidados
def pares_cuadraticos(n):
    for i in range(n):
        for j in range(n):
            print(f"{i},{j}") # El tiempo crece cuadráticamente con n
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Estructuras de Datos Avanzadas',
    'topic': 'Colecciones Avanzadas',
    'subtopic': 'defaultdict, OrderedDict',
    'definition': '''
Python ofrece algunas colecciones avanzadas en el módulo `collections` que extienden la funcionalidad de los tipos de datos básicos como los diccionarios. Dos de las más útiles son `defaultdict` y `OrderedDict`.

¿Te estás preguntando por qué son útiles?

`defaultdict` es como un diccionario normal, pero con una diferencia clave: si intentas acceder a una clave que no existe, no lanza un `KeyError`. En su lugar, inserta automáticamente la clave con un valor por defecto que tú especificas. Esto es increíblemente útil cuando estás construyendo diccionarios dinámicamente y no quieres preocuparte por verificar si una clave existe antes de intentar modificar su valor.

`OrderedDict`, por otro lado, es un tipo de diccionario que recuerda el orden en que se insertaron los elementos. Mientras que los diccionarios normales en Python 3.7+ conservan el orden de inserción por defecto, `OrderedDict` es explícito al respecto y ofrece algunas funcionalidades adicionales relacionadas con el orden. Antes de Python 3.7, `OrderedDict` era crucial cuando el orden de las claves importaba.
''',
    'code_example': '''
from collections import defaultdict, OrderedDict

# Ejemplo de defaultdict
# defaultdict con una lista como valor por defecto
diccionario_agrupado = defaultdict(list)
elementos = [('fruta', 'manzana'), ('vegetal', 'zanahoria'), ('fruta', 'plátano')]

for clave, valor in elementos:
    diccionario_agrupado[clave].append(valor)

print(diccionario_agrupado)
# Salida: defaultdict(<class 'list'>, {'fruta': ['manzana', 'plátano'], 'vegetal': ['zanahoria']})

# Ejemplo de OrderedDict
diccionario_ordenado = OrderedDict()
diccionario_ordenado['a'] = 1
diccionario_ordenado['c'] = 3
diccionario_ordenado['b'] = 2

for clave, valor in diccionario_ordenado.items():
    print(f"{clave}: {valor}")
# Salida:
# a: 1
# c: 3
# b: 2
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Estructuras de Datos Avanzadas',
    'topic': 'Colecciones Avanzadas',
    'subtopic': 'namedtuple',
    'definition': '''
`namedtuple` es una subclase de tupla que se encuentra en el módulo `collections`. Permite crear tuplas con campos nombrados, lo que hace que tu código sea más legible y autoexplicativo que usar índices numéricos.

¿Te estás preguntando por qué esto es mejor que una tupla normal?

Pensemos por un momento en representar un punto en un gráfico con coordenadas X e Y. Con una tupla normal, tendrías `punto = (10, 20)`, y accederías a las coordenadas como `punto[0]` y `punto[1]`. Con `namedtuple`, podrías definir `Punto = namedtuple('Punto', ['x', 'y'])` y luego `punto = Punto(10, 20)`, accediendo a las coordenadas como `punto.x` y `punto.y`. Esto mejora la claridad del código, especialmente cuando las tuplas tienen muchos elementos.

`namedtuple` es inmutable, como las tuplas regulares, lo que significa que una vez que se crea una instancia, no se pueden cambiar sus valores. Esto las hace ideales para representar registros de datos ligeros.
''',
    'code_example': '''
from collections import namedtuple

# Definir una namedtuple para representar un Punto
Punto = namedtuple('Punto', ['x', 'y'])

# Crear instancias de Punto
p1 = Punto(x=10, y=20)
p2 = Punto(30, 40) # También se pueden pasar argumentos posicionalmente

print(p1.x)       # Acceso por nombre: 10
print(p2.y)       # Acceso por nombre: 40

print(p1[0])      # Acceso por índice: 10

# Namedtuple es inmutable (esto generaría un error)
# p1.x = 15 # AttributeError: 'Punto' object has no attribute 'x'
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Estructuras de Datos Avanzadas',
    'topic': 'Colecciones Avanzadas',
    'subtopic': 'heapq module',
    'definition': '''
El módulo `heapq` en Python proporciona una implementación del algoritmo de cola de prioridad, también conocido como "heap" o montículo. Un heap es una estructura de datos basada en un árbol binario que cumple con la propiedad de heap: para cualquier nodo, el valor de ese nodo es mayor o igual (o menor o igual, dependiendo del tipo de heap) que el valor de sus hijos. Python implementa un min-heap por defecto.

¿Te estás preguntando para qué sirve esto?

El módulo `heapq` es extremadamente útil cuando necesitas acceder rápidamente al elemento más pequeño (o más grande, si lo inviertes) en una colección de datos, sin tener que ordenar la colección completa. Pensemos por un momento en un sistema de gestión de tareas donde siempre quieres procesar la tarea con la prioridad más alta (el número más pequeño). Con un heap, puedes extraer eficientemente la tarea de mayor prioridad.

Las operaciones principales con `heapq` son `heappush` (para agregar un elemento al heap) y `heappop` (para eliminar y devolver el elemento más pequeño del heap).
''',
    'code_example': '''
import heapq

# Crear una lista y "heapificarla" (convertirla en un heap)
numeros = [3, 1, 4, 1, 5, 9, 2, 6]
heapq.heapify(numeros) # La lista ahora es un heap

print(numeros) # La lista no está completamente ordenada visualmente, pero es un heap válido

# Extraer el elemento más pequeño (raíz del heap)
menor = heapq.heappop(numeros)
print(f"El elemento más pequeño extraído: {menor}") # Salida: El elemento más pequeño extraído: 1
print(f"Heap después de extraer: {numeros}")

# Agregar un nuevo elemento al heap
heapq.heappush(numeros, 0)
print(f"Heap después de agregar 0: {numeros}")

# Extraer el nuevo elemento más pequeño
menor_nuevo = heapq.heappop(numeros)
print(f"El nuevo elemento más pequeño extraído: {menor_nuevo}") # Salida: El nuevo elemento más pequeño extraído: 0
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Estructuras de Datos Avanzadas',
    'topic': 'Colecciones Avanzadas',
    'subtopic': 'bisect module',
    'definition': '''
El módulo `bisect` en Python es una herramienta para mantener listas ordenadas sin tener que reordenar la lista completa después de cada inserción. Proporciona funciones para realizar búsquedas binarias e inserciones en listas ordenadas de manera eficiente.

¿Te estás preguntando para qué sirve esto?

Pensemos por un momento en una lista de calificaciones de estudiantes que siempre debe estar ordenada. Si agregas una nueva calificación, podrías reordenar toda la lista, lo cual sería ineficiente para listas grandes. El módulo `bisect` te permite encontrar el punto de inserción correcto para un nuevo elemento de forma rápida, manteniendo la lista ordenada.

Las funciones principales son `bisect_left` (que devuelve el índice de inserción donde un elemento puede ser colocado para mantener el orden, asumiendo que los elementos duplicados van a la izquierda) y `insort_left` (que inserta el elemento directamente en la lista en la posición correcta).
''',
    'code_example': '''
import bisect

# Lista ordenada
mi_lista = [10, 20, 30, 40, 50]

# Encontrar el punto de inserción para el número 35
indice = bisect.bisect_left(mi_lista, 35)
print(f"El número 35 debería insertarse en el índice: {indice}") # Salida: El número 35 debería insertarse en el índice: 3

# Insertar el número 35 en la posición correcta
bisect.insort_left(mi_lista, 35)
print(f"Lista después de insertar 35: {mi_lista}") # Salida: Lista después de insertar 35: [10, 20, 30, 35, 40, 50]

# Encontrar el punto de inserción para un duplicado (20)
indice_duplicado = bisect.bisect_left(mi_lista, 20)
print(f"El número 20 (duplicado) debería insertarse en el índice: {indice_duplicado}") # Salida: El número 20 (duplicado) debería insertarse en el índice: 1

# Insertar el duplicado
bisect.insort_left(mi_lista, 20)
print(f"Lista después de insertar 20 (duplicado): {mi_lista}") # Salida: Lista después de insertar 20 (duplicado): [10, 20, 20, 30, 35, 40, 50]
'''
  });
}

Future<void> insertPythonMidLevel2Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Concurrencia y Paralelismo',
    'topic': 'Threads Básicos',
    'subtopic': 'threading module',
    'definition': '''
El módulo `threading` en Python permite implementar la programación concurrente utilizando hilos (threads). Un hilo es una unidad de ejecución dentro de un proceso. Permite que un programa realice múltiples tareas al mismo tiempo, lo que puede mejorar la capacidad de respuesta y el rendimiento en ciertas situaciones.

¿Te estás preguntando cómo funciona esto?

Pensemos por un momento en una aplicación que necesita descargar varias imágenes de internet y, al mismo tiempo, mantener su interfaz de usuario interactiva. Si solo tuviéramos un hilo, la interfaz se congelaría mientras se descargan las imágenes. Con hilos, podemos dedicar un hilo a la descarga de imágenes en segundo plano mientras el hilo principal maneja la interfaz de usuario.

El módulo `threading` proporciona una API de alto nivel para crear y gestionar hilos. Puedes crear un hilo pasando una función objetivo o heredando de la clase `threading.Thread` y sobrescribiendo su método `run()`.
''',
    'code_example': '''
import threading
import time

def tarea(nombre_tarea):
    print(f"Iniciando {nombre_tarea}")
    time.sleep(2) # Simula una operación que toma tiempo
    print(f"Finalizando {nombre_tarea}")

# Crear hilos
hilo1 = threading.Thread(target=tarea, args=("Tarea 1",))
hilo2 = threading.Thread(target=tarea, args=("Tarea 2",))

# Iniciar los hilos
hilo1.start()
hilo2.start()

# Esperar a que los hilos terminen
hilo1.join()
hilo2.join()

print("Todas las tareas han finalizado.")
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Concurrencia y Paralelismo',
    'topic': 'Threads Básicos',
    'subtopic': 'GIL (Global Interpreter Lock)',
    'definition': '''
El GIL (Global Interpreter Lock) es un mecanismo que utiliza el intérprete CPython (la implementación más común de Python) para asegurar que solo un hilo pueda ejecutar bytecode de Python a la vez.

¿Te estás preguntando por qué existe esto?

El GIL fue implementado para simplificar la gestión de la memoria en Python y para hacer la implementación del intérprete más fácil y segura. Sin embargo, tiene una implicación importante: aunque puedes tener múltiples hilos ejecutándose en un programa Python, el GIL impide que realmente ejecuten código Python en paralelo en múltiples núcleos de CPU. Es decir, los hilos parecen ser concurrentes, pero en realidad están tomando turnos muy rápidos para ejecutar el código Python.

Esto significa que para tareas intensivas en CPU (como cálculos matemáticos complejos), los hilos de Python no se beneficiarán del paralelismo real de múltiples núcleos. Sin embargo, para tareas que implican operaciones de E/S (entrada/salida) como leer archivos o hacer solicitudes de red, el GIL se libera, permitiendo que otros hilos se ejecuten mientras un hilo espera por una operación de E/S.
''',
    'code_example': '''
import threading
import time

# Función intensiva en CPU
def contar_cpu(n):
    while n > 0:
        n -= 1

# Función intensiva en E/S
def esperar_io():
    time.sleep(1) # Simula una operación de E/S

# Ejemplo para ilustrar el GIL (no verás paralelismo real en CPU-bound)
# Para una demostración más clara, se necesitarían herramientas de profiling o módulos especializados

# def run_threads_cpu():
#     t1 = threading.Thread(target=contar_cpu, args=(100_000_000,))
#     t2 = threading.Thread(target=contar_cpu, args=(100_000_000,))
#     start_time = time.time()
#     t1.start()
#     t2.start()
#     t1.join()
#     t2.join()
#     print(f"Tiempo total (CPU-bound con hilos): {time.time() - start_time:.4f}s")

# # Para una tarea I/O-bound, los hilos sí pueden mostrar concurrencia
# def run_threads_io():
#     t1 = threading.Thread(target=esperar_io)
#     t2 = threading.Thread(target=esperar_io)
#     start_time = time.time()
#     t1.start()
#     t2.start()
#     t1.join()
#     t2.join()
#     print(f"Tiempo total (I/O-bound con hilos): {time.time() - start_time:.4f}s")

# # Si ejecutas esto, notarás que la versión CPU-bound no se beneficia del paralelismo
# # mientras que la I/O-bound sí.
# # run_threads_cpu()
# # run_threads_io()
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Concurrencia y Paralelismo',
    'topic': 'Threads Básicos',
    'subtopic': 'Race conditions',
    'definition': '''
Las "race conditions" (condiciones de carrera) ocurren en la programación concurrente cuando múltiples hilos acceden a un recurso compartido (como una variable o un archivo) al mismo tiempo, y el resultado final depende del orden en que se ejecutan los hilos. Si el orden de ejecución no se controla, el resultado puede ser impredecible e incorrecto.

¿Te estás preguntando por qué esto es un problema?

Pensemos por un momento en dos personas intentando retirar dinero de la misma cuenta bancaria al mismo tiempo. Si no hay un control, ambas podrían leer el saldo original, luego ambas intentarían retirar dinero, y el saldo final podría ser incorrecto. En la programación, esto puede llevar a errores sutiles y difíciles de depurar, ya que la falla puede no ser reproducible de manera consistente.

Para evitar las condiciones de carrera, se utilizan mecanismos de sincronización como los bloqueos (locks), los semáforos o las variables de condición. Estos mecanismos aseguran que solo un hilo pueda acceder al recurso crítico a la vez, o que los hilos sigan un orden específico.
''',
    'code_example': '''
import threading
import time

saldo = 0
lock = threading.Lock() # Objeto de bloqueo para sincronización

def depositar():
    global saldo
    for _ in range(100_000):
        # Usar un bloqueo para evitar la condición de carrera
        lock.acquire() # Adquiere el bloqueo
        saldo += 1
        lock.release() # Libera el bloqueo

def retirar():
    global saldo
    for _ in range(100_000):
        lock.acquire() # Adquiere el bloqueo
        saldo -= 1
        lock.release() # Libera el bloqueo

# Sin bloqueos, el saldo final sería impredecible
# def depositar_sin_lock():
#     global saldo
#     for _ in range(100_000):
#         saldo += 1

# def retirar_sin_lock():
#     global saldo
#     for _ in range(100_000):
#         saldo -= 1

hilo_deposito = threading.Thread(target=depositar)
hilo_retiro = threading.Thread(target=retirar)

hilo_deposito.start()
hilo_retiro.start()

hilo_deposito.join()
hilo_retiro.join()

print(f"Saldo final esperado (con bloqueos): {saldo}") # Debería ser 0

# # Ejemplo de race condition sin bloqueos (descomentar para probar)
# saldo_sin_lock = 0
# hilo_deposito_sin_lock = threading.Thread(target=depositar_sin_lock)
# hilo_retiro_sin_lock = threading.Thread(target=retirar_sin_lock)
# hilo_deposito_sin_lock.start()
# hilo_retiro_sin_lock.start()
# hilo_deposito_sin_lock.join()
# hilo_retiro_sin_lock.join()
# print(f"Saldo final inesperado (sin bloqueos): {saldo_sin_lock}") # Probablemente no será 0
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Concurrencia y Paralelismo',
    'topic': 'Multiprocessing',
    'subtopic': 'multiprocessing module',
    'definition': '''
El módulo `multiprocessing` en Python permite la ejecución de programas utilizando procesos separados. A diferencia de los hilos, que comparten el mismo espacio de memoria, los procesos tienen sus propios espacios de memoria independientes.

¿Te estás preguntando por qué esto es relevante si ya tenemos hilos?

Si bien los hilos son útiles para tareas ligadas a E/S, el GIL (Global Interpreter Lock) de CPython restringe la ejecución paralela real de código Python en múltiples núcleos de CPU. Aquí es donde entra `multiprocessing`. Al usar procesos, el GIL ya no es una limitación, lo que permite que las tareas intensivas en CPU se ejecuten en paralelo en diferentes núcleos, aprovechando al máximo el hardware multinúcleo de tu máquina.

El módulo `multiprocessing` proporciona una API similar a la del módulo `threading`, lo que facilita la transición para quienes ya están familiarizados con los hilos. Puedes crear nuevos procesos instanciando la clase `Process` y llamando a su método `start()`.
''',
    'code_example': '''
import multiprocessing
import time

def tarea_proceso(nombre_tarea):
    print(f"Iniciando {nombre_tarea} en proceso {multiprocessing.current_process().name}")
    time.sleep(2) # Simula una operación que toma tiempo
    print(f"Finalizando {nombre_tarea} en proceso {multiprocessing.current_process().name}")

if __name__ == '__main__':
    # Crear procesos
    proceso1 = multiprocessing.Process(target=tarea_proceso, args=("Tarea A",))
    proceso2 = multiprocessing.Process(target=tarea_proceso, args=("Tarea B",))

    # Iniciar los procesos
    proceso1.start()
    proceso2.start()

    # Esperar a que los procesos terminen
    proceso1.join()
    proceso2.join()

    print("Todas las tareas de proceso han finalizado.")
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Concurrencia y Paralelismo',
    'topic': 'Multiprocessing',
    'subtopic': 'Pool',
    'definition': '''
La clase `Pool` del módulo `multiprocessing` proporciona una forma conveniente de ejecutar una función en paralelo en múltiples entradas de datos, distribuyendo las tareas entre un grupo de procesos de trabajo.

¿Te estás preguntando cuándo deberías usar un `Pool`?

Pensemos por un momento en un escenario donde necesitas aplicar la misma función a una gran cantidad de elementos, por ejemplo, procesar una lista de imágenes o calcular algo para cada fila de un archivo grande. Crear y gestionar procesos manualmente puede ser tedioso. Un `Pool` automatiza esta gestión, creando un grupo de procesos y distribuyendo las tareas entre ellos de manera eficiente.

Los métodos clave de `Pool` son `map()`, `apply()`, `map_async()` y `apply_async()`. El método `map()` es similar a la función `map()` incorporada de Python, pero distribuye las tareas entre los procesos del pool.
''',
    'code_example': '''
import multiprocessing
import os

def cuadrado(numero):
    # Simula una tarea intensiva en CPU
    print(f"Calculando cuadrado de {numero} en proceso {os.getpid()}")
    return numero * numero

if __name__ == '__main__':
    numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

    # Crear un pool de 4 procesos de trabajo
    with multiprocessing.Pool(processes=4) as pool:
        # Aplicar la función cuadrado a cada número en paralelo
        resultados = pool.map(cuadrado, numeros)

    print("Resultados:", resultados)
    # Salida esperada (el orden de los prints internos puede variar):
    # Calculando cuadrado de 1 en proceso XXXX
    # ...
    # Resultados: [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Concurrencia y Paralelismo',
    'topic': 'Multiprocessing',
    'subtopic': 'Queue',
    'definition': '''
La clase `Queue` del módulo `multiprocessing` proporciona un mecanismo seguro para el intercambio de mensajes entre procesos. Permite que los procesos se comuniquen y compartan datos de manera controlada, evitando condiciones de carrera.

¿Te estás preguntando por qué esto es importante?

Dado que los procesos tienen espacios de memoria separados, no pueden compartir variables directamente como lo hacen los hilos. Una `Queue` actúa como un conducto seguro para que los procesos puedan poner y obtener datos. Pensemos por un momento en una línea de ensamblaje donde diferentes estaciones (procesos) necesitan pasarse piezas (datos) de manera ordenada. Una `Queue` asegura que las piezas se pasen de forma correcta y que no se pierdan.

Las operaciones principales de una `Queue` son `put()` (para agregar un elemento a la cola) y `get()` (para recuperar un elemento de la cola). La cola gestiona automáticamente la sincronización necesaria para que múltiples procesos puedan acceder a ella de forma segura.
''',
    'code_example': '''
import multiprocessing
import time

def productor(cola):
    for i in range(5):
        mensaje = f"Dato {i}"
        print(f"Productor: Poniendo '{mensaje}' en la cola")
        cola.put(mensaje)
        time.sleep(0.5)
    cola.put(None) # Señal para el consumidor de que ha terminado

def consumidor(cola):
    while True:
        mensaje = cola.get()
        if mensaje is None:
            break
        print(f"Consumidor: Obteniendo '{mensaje}' de la cola")
        time.sleep(1) # Simula procesamiento

if __name__ == '__main__':
    q = multiprocessing.Queue()
    
    p = multiprocessing.Process(target=productor, args=(q,))
    c = multiprocessing.Process(target=consumidor, args=(q,))

    p.start()
    c.start()

    p.join()
    c.join()
    print("Comunicación entre procesos finalizada.")
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Concurrencia y Paralelismo',
    'topic': 'Asincronía',
    'subtopic': 'async/await',
    'definition': '''
`async` y `await` son palabras clave introducidas en Python 3.5 para facilitar la escritura de código concurrente de manera asíncrona. Nos permiten escribir código que "espera" la finalización de una operación sin bloquear la ejecución de otras tareas en el mismo hilo.

¿Te estás preguntando por qué esto importa?

Pensemos por un momento en una aplicación web que necesita hacer varias llamadas a bases de datos o APIs externas. Si cada llamada bloquea el programa hasta que se completa, la aplicación se sentiría lenta y poco responsiva. Con `async/await`, puedes iniciar una operación (por ejemplo, una solicitud a una API), y mientras esperas la respuesta, el programa puede cambiar a otra tarea útil en lugar de simplemente quedarse quieto.

La palabra clave `async` se usa para definir una función como una "coroutine" (o rutina concurrente), lo que significa que puede ser pausada y reanudada. La palabra clave `await` se usa dentro de una coroutine para "esperar" la finalización de otra coroutine o de una operación asíncrona.
''',
    'code_example': '''
import asyncio
import time

async def tarea_asincrona(nombre, duracion):
    print(f"Iniciando {nombre}...")
    await asyncio.sleep(duracion) # Simula una operación asíncrona (ej. I/O)
    print(f"Finalizando {nombre}.")

async def main():
    print("Iniciando el programa principal")
    # Ejecutar tareas asíncronas concurrentemente
    await asyncio.gather(
        tarea_asincrona("Descarga de datos", 3),
        tarea_asincrona("Procesamiento de imagen", 2)
    )
    print("Todas las tareas asíncronas completadas.")

if __name__ == "__main__":
    # Ejecutar la función principal asíncrona
    asyncio.run(main())
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Concurrencia y Paralelismo',
    'topic': 'Asincronía',
    'subtopic': 'asyncio',
    'definition': '''
El módulo `asyncio` es la biblioteca principal de Python para escribir código concurrente utilizando la sintaxis `async/await`. Proporciona la infraestructura para construir y ejecutar programas asíncronos que manejan múltiples operaciones de E/S de manera eficiente sin el uso de hilos o procesos adicionales.

¿Te estás preguntando cómo lo logra?

`asyncio` se basa en el concepto de un "bucle de eventos" (event loop), que veremos a continuación. Este bucle es el corazón de cualquier aplicación asíncrona de `asyncio`. Se encarga de gestionar y programar la ejecución de las "coroutine" cuando están listas para ejecutarse.

`asyncio` es especialmente adecuado para aplicaciones que son "I/O-bound", es decir, aquellas cuyo rendimiento está limitado por la velocidad de las operaciones de entrada/salida, como solicitudes de red, acceso a bases de datos o lectura/escritura de archivos. Permite que tu programa sea más receptivo y escale mejor para manejar un gran número de conexiones o tareas concurrentes.
''',
    'code_example': '''
import asyncio
import aiohttp # Se usa una biblioteca asíncrona para requests

async def fetch_url(url):
    print(f"Iniciando descarga de: {url}")
    async with aiohttp.ClientSession() as session:
        async with session.get(url) as response:
            await response.text() # Solo leer, no procesar para este ejemplo
            print(f"Descarga completada para: {url}")

async def main_asyncio():
    urls = [
        "https://www.python.org",
        "https://www.google.com",
        "https://www.wikipedia.org"
    ]
    tasks = [fetch_url(url) for url in urls]
    await asyncio.gather(*tasks)
    print("Todas las URLs descargadas.")

if __name__ == "__main__":
    asyncio.run(main_asyncio())
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Concurrencia y Paralelismo',
    'topic': 'Asincronía',
    'subtopic': 'Event loops',
    'definition': '''
El bucle de eventos (event loop) es el corazón de cualquier aplicación asíncrona basada en `asyncio`. Es un mecanismo que gestiona y distribuye las tareas asíncronas, permitiendo que un programa realice múltiples operaciones sin bloquearse.

¿Te estás preguntando cómo funciona?

Pensemos por un momento en un director de orquesta. El director (bucle de eventos) no toca todos los instrumentos a la vez. En su lugar, indica a cada músico (coroutine) cuándo es su turno de tocar, y cuando un músico necesita esperar (por ejemplo, para que otro termine una parte), el director pasa al siguiente músico disponible. Cuando el primero está listo de nuevo, el director vuelve a él.

El bucle de eventos se encarga de:

-   Registrar coroutines y operaciones asíncronas.
-   Ejecutar las partes de código de las coroutines hasta que encuentran una instrucción `await`.
-   Suspender la coroutine en `await` y pasar el control a otras coroutines que estén listas para ejecutarse.
-   Reanudar las coroutines suspendidas cuando la operación que estaban esperando se completa (por ejemplo, una descarga de red finaliza).

Es una forma de lograr concurrencia con un solo hilo, maximizando el uso del tiempo de espera de las operaciones de E/S.
''',
    'code_example': '''
import asyncio
import time

async def worker(name, delay):
    print(f"Worker {name}: Iniciando...")
    await asyncio.sleep(delay) # Pausa la ejecución de esta coroutine, pero el bucle de eventos sigue
    print(f"Worker {name}: Finalizando después de {delay} segundos.")

async def main_event_loop():
    print("Main: Programando workers...")
    # Crea coroutines y las añade al bucle de eventos para ser ejecutadas
    task1 = asyncio.create_task(worker("A", 3))
    task2 = asyncio.create_task(worker("B", 1))
    task3 = asyncio.create_task(worker("C", 2))

    # Espera a que todas las tareas se completen
    await task1
    await task2
    await task3
    print("Main: Todos los workers han terminado.")

if __name__ == "__main__":
    # Ejecuta la función principal asíncrona, que a su vez gestiona el bucle de eventos
    asyncio.run(main_event_loop())

# Salida esperada (el orden de inicio/fin puede variar para "A" y "C" ya que "B" es más rápido):
# Main: Programando workers...
# Worker A: Iniciando...
# Worker B: Iniciando...
# Worker C: Iniciando...
# Worker B: Finalizando después de 1 segundos.
# Worker C: Finalizando después de 2 segundos.
# Worker A: Finalizando después de 3 segundos.
# Main: Todos los workers han terminado.
'''
  });
}

Future<void> insertPythonMidLevel3Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Python Moderno',
    'topic': 'Tipado',
    'subtopic': 'Type hints',
    'definition': '''
Los "type hints" (indicaciones de tipo) son una característica de Python que permite especificar los tipos esperados de argumentos de funciones, valores de retorno y variables. Aunque Python sigue siendo un lenguaje de tipado dinámico, los type hints mejoran la legibilidad del código y facilitan la detección de errores.

¿Te estás preguntando por qué esto importa?

Pensemos por un momento en un equipo de desarrollo grande o en un proyecto complejo. Sin type hints, puede ser difícil saber qué tipo de datos espera una función o qué tipo de datos devolverá. Esto puede llevar a errores de tipo en tiempo de ejecución. Los type hints actúan como documentación en línea, haciendo que el propósito de tu código sea más claro y ayudando a herramientas externas (como los verificadores de tipo) a encontrar posibles problemas antes de que el código se ejecute.

Aunque Python no obliga a que los tipos se cumplan en tiempo de ejecución, son una herramienta poderosa para el desarrollo moderno, especialmente cuando se combina con herramientas como `mypy` (que veremos a continuación).
''',
    'code_example': '''
def saludar(nombre: str) -> str:
    """Función que saluda a una persona."""
    return f"Hola, {nombre}"

def sumar(a: int, b: int) -> int:
    """Función que suma dos números enteros."""
    return a + b

# Uso con type hints
print(saludar("Alice"))
print(sumar(5, 10))

# Python no fuerza el tipo en tiempo de ejecución, pero un verificador de tipo lo detectaría
# print(sumar("a", "b")) # Esto funcionaría pero mypy o un IDE con type hints lo señalaría como error
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Python Moderno',
    'topic': 'Tipado',
    'subtopic': 'mypy',
    'definition': '''
`mypy` es un verificador de tipo estático opcional para Python. Utiliza los "type hints" que agregas a tu código para analizarlo y encontrar posibles errores de tipo antes de que se ejecute.

¿Te estás preguntando cómo te ayuda esto?

Pensemos por un momento en depurar un error de tipo en un programa grande. Puede ser una tarea tediosa. `mypy` te ayuda a atrapar estos errores de forma temprana, incluso antes de que ejecutes tu código. Actúa como un "linter" de tipos, asegurando que los argumentos que pasas a las funciones y los valores que asignas a las variables coincidan con las indicaciones de tipo que has proporcionado.

Para usar `mypy`, lo instalas como un paquete de Python y luego lo ejecutas desde la línea de comandos sobre tus archivos Python. Te reportará cualquier inconsistencia de tipo que encuentre.
''',
    'code_example': '''
# Primero, instala mypy:
# pip install mypy

# Archivo: mi_modulo.py
# def procesar_numero(n: int) -> int:
#     return n * 2

# def mostrar_cadena(s: str):
#     print(s.upper())

# # Uso correcto
# resultado = procesar_numero(10)
# mostrar_cadena("hola")

# # Uso incorrecto (mypy lo detectaría)
# # resultado_error = procesar_numero("cinco")
# # mostrar_cadena(123)

# # Para ejecutar mypy desde la terminal:
# # mypy mi_modulo.py
# # Si hay errores, mypy los reportará:
# # mi_modulo.py:12: error: Argument "n" to "procesar_numero" has incompatible type "str"; expected "int"
# # mi_modulo.py:13: error: Argument "s" to "mostrar_cadena" has incompatible type "int"; expected "str"
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Python Moderno',
    'topic': 'Tipado',
    'subtopic': 'Pydantic',
    'definition': '''
Pydantic es una biblioteca de Python que se utiliza para la validación de datos y la gestión de la configuración. Permite definir la estructura de tus datos usando type hints estándar de Python, y luego valida automáticamente los datos cuando se crean instancias de esos modelos.

¿Te estás preguntando por qué esto es tan práctico?

Pensemos por un momento en una API que recibe datos de usuarios. Sin Pydantic, tendrías que escribir un montón de código manual para verificar que los datos tienen el tipo correcto, los rangos válidos, etc. Pydantic automatiza esta validación. Si los datos no cumplen con el esquema definido, Pydantic lanza una excepción clara.

Es ampliamente utilizado en frameworks web como FastAPI, donde los modelos de Pydantic definen la forma de las solicitudes y respuestas HTTP, asegurando que los datos entrantes sean válidos y que los datos salientes cumplan con las expectativas. Además de la validación, Pydantic también ofrece serialización y deserialización de datos, lo que facilita el trabajo con JSON, por ejemplo.
''',
    'code_example': '''
from pydantic import BaseModel, ValidationError
from typing import List, Optional

class Usuario(BaseModel):
    id: int
    nombre: str
    edad: int
    email: Optional[str] = None # Campo opcional, valor por defecto None
    habilidades: List[str] = [] # Lista de strings, por defecto vacía

try:
    # Creación de un usuario válido
    usuario1 = Usuario(id=1, nombre="Alice", edad=30, email="alice@example.com")
    print(usuario1.dict())

    # Creación de un usuario válido con valor por defecto
    usuario2 = Usuario(id=2, nombre="Bob", edad=25)
    print(usuario2.dict())

    # Intento de crear un usuario inválido (edad no es int)
    usuario_invalido = Usuario(id=3, nombre="Charlie", edad="veinte")
except ValidationError as e:
    print("Error de validación:")
    print(e.json())

# Output esperado para el error de validación:
# Error de validación:
# [
#   {
#     "loc": [
#       "edad"
#     ],
#     "msg": "value is not a valid integer",
#     "type": "type_error.integer"
#   }
# ]
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Python Moderno',
    'topic': 'Funcional',
    'subtopic': 'Lambda functions',
    'definition': '''
Las funciones lambda en Python son pequeñas funciones anónimas, es decir, funciones que no tienen un nombre definido. Se crean con la palabra clave `lambda`.

¿Te estás preguntando cuándo usarlas?

Pensemos por un momento en situaciones donde necesitas una función simple para una operación rápida y única, sin la necesidad de definir una función completa con `def`. Las lambdas son ideales para esto. Son concisas y se usan a menudo como argumentos para funciones de orden superior, como `map()`, `filter()` o `sorted()`, que esperan una función como entrada.

La sintaxis de una función lambda es `lambda argumentos: expresión`. El resultado de la `expresión` es el valor de retorno de la función lambda. Aunque son convenientes, las funciones lambda están limitadas a una única expresión y no pueden contener sentencias complejas como bucles o múltiples líneas de código.
''',
    'code_example': '''
# Lambda simple para sumar dos números
sumar = lambda a, b: a + b
print(sumar(5, 3)) # Salida: 8

# Lambda usada con sorted()
lista_pares = [(1, 'uno'), (3, 'tres'), (2, 'dos')]
# Ordenar la lista de tuplas basándose en el segundo elemento
lista_ordenada = sorted(lista_pares, key=lambda item: item[1])
print(lista_ordenada) # Salida: [(2, 'dos'), (1, 'uno'), (3, 'tres')]

# Comparación con una función normal (cuando una lambda es suficiente)
# def sumar_normal(a, b):
#     return a + b
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Python Moderno',
    'topic': 'Funcional',
    'subtopic': 'map, filter, reduce',
    'definition': '''
`map()`, `filter()` y `reduce()` son funciones de orden superior en Python que promueven un estilo de programación funcional, permitiendo procesar colecciones de datos de manera concisa y expresiva.

¿Te estás preguntando para qué sirve cada una?

-   **`map(funcion, iterable)`:** Aplica una `funcion` a cada elemento de un `iterable` (como una lista o una tupla) y devuelve un iterador con los resultados. Pensemos por un momento en transformar una lista de números en sus cuadrados; `map()` hace esto de forma elegante.

-   **`filter(funcion, iterable)`:** Construye un iterador con los elementos de un `iterable` para los que la `funcion` (que debe devolver `True` o `False`) es verdadera. Imagina que tienes una lista de números y solo quieres los pares; `filter()` te ayuda a "filtrar" esos elementos.

-   **`reduce(funcion, iterable)`:** Esta función, que se encuentra en el módulo `functools`, aplica una `funcion` acumulativa de forma sucesiva a los elementos de un `iterable` para reducir la secuencia a un único valor. Es como "plegar" una lista de valores en un solo resultado, por ejemplo, sumar todos los elementos de una lista.

Estas funciones son herramientas poderosas para manipular colecciones de datos sin necesidad de bucles explícitos, lo que a menudo lleva a código más limpio y legible.
''',
    'code_example': '''
# map(): aplica una función a cada elemento
numeros = [1, 2, 3, 4, 5]
cuadrados = list(map(lambda x: x * x, numeros))
print(f"Cuadrados: {cuadrados}") # Salida: Cuadrados: [1, 4, 9, 16, 25]

# filter(): selecciona elementos basados en una condición
pares = list(filter(lambda x: x % 2 == 0, numeros))
print(f"Números pares: {pares}") # Salida: Números pares: [2, 4]

from functools import reduce

# reduce(): aplica una función de forma acumulativa
suma_total = reduce(lambda x, y: x + y, numeros)
print(f"Suma total: {suma_total}") # Salida: Suma total: 15

# reduce() para multiplicar todos los elementos
producto_total = reduce(lambda x, y: x * y, numeros)
print(f"Producto total: {producto_total}") # Salida: Producto total: 120
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Python Moderno',
    'topic': 'Funcional',
    'subtopic': 'functools module',
    'definition': '''
El módulo `functools` en Python proporciona funciones de orden superior para trabajar con funciones, facilitando la programación funcional. Contiene herramientas para adaptar o decorar funciones, hacerlas más útiles y reutilizables.

¿Te estás preguntando cuáles son sus usos principales?

Pensemos por un momento en la necesidad de memorizar los resultados de funciones costosas o en cómo reusar funciones que solo necesitan algunos de sus argumentos preestablecidos. `functools` ofrece soluciones para estos escenarios.

Algunas de las funciones más destacadas son:

-   **`functools.reduce()`:** Ya la mencionamos, pero es crucial. Permite aplicar una función a una secuencia de forma acumulativa para reducirla a un solo valor.
-   **`functools.partial()`:** Permite crear una nueva función con algunos de los argumentos de una función existente "congelados" (preestablecidos). Esto es útil cuando quieres reutilizar una función compleja con ciertos parámetros fijos.
-   **`functools.lru_cache()`:** Es un decorador que implementa un caché "Least Recently Used" (menos usado recientemente). Es decir, almacena los resultados de las llamadas a una función y los devuelve directamente si la función se llama de nuevo con los mismos argumentos, lo que puede acelerar significativamente las funciones que realizan cálculos costosos y repetitivos.
''',
    'code_example': '''
from functools import reduce, partial, lru_cache
import time

# reduce ya lo vimos, pero para recordar:
numeros = [1, 2, 3, 4]
suma_reduce = reduce(lambda x, y: x + y, numeros)
print(f"Suma con reduce: {suma_reduce}") # Salida: Suma con reduce: 10

# partial(): crear una función con argumentos preestablecidos
def multiplicar(a, b):
    return a * b

duplicar = partial(multiplicar, 2)
print(f"Duplicar 5: {duplicar(5)}") # Salida: Duplicar 5: 10

# lru_cache(): memorizar resultados de funciones
@lru_cache(maxsize=None) # maxsize=None significa caché ilimitado
def fibonacci(n):
    if n <= 1:
        return n
    return fibonacci(n - 1) + fibonacci(n - 2)

# La primera vez toma tiempo, las siguientes son instantáneas (para los mismos n)
start_time = time.time()
print(f"Fibonacci de 30 (primera vez): {fibonacci(30)}")
print(f"Tiempo: {time.time() - start_time:.4f} segundos")

start_time = time.time()
print(f"Fibonacci de 30 (cached): {fibonacci(30)}")
print(f"Tiempo: {time.time() - start_time:.4f} segundos")
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Python Moderno',
    'topic': 'Iteradores y Generadores',
    'subtopic': 'yield',
    'definition': '''
`yield` es una palabra clave en Python que se utiliza para crear generadores. Cuando una función contiene la palabra clave `yield`, se convierte en una función generadora y, en lugar de devolver un solo valor y terminar, devuelve un iterador que produce una secuencia de valores uno por uno.

¿Te estás preguntando para qué sirve esto?

Pensemos por un momento en una situación donde necesitas procesar una lista de elementos que es demasiado grande para caber completamente en la memoria, como un archivo de log masivo o un flujo de datos continuo. Si cargaras todo en memoria, tu programa podría colapsar. `yield` te permite procesar los elementos "sobre la marcha", generando uno cada vez que se solicita, lo que ahorra memoria y mejora el rendimiento.

Cada vez que se llama a `next()` en el iterador del generador (o se itera sobre él con un bucle `for`), la ejecución de la función generadora se reanuda desde donde se detuvo, ejecuta el código hasta la siguiente sentencia `yield`, y devuelve ese valor. Cuando no hay más `yield`, el generador termina.
''',
    'code_example': '''
def mi_generador():
    n = 1
    print("Esto se imprime primero")
    yield n

    n += 1
    print("Esto se imprime después del primer yield")
    yield n

    n += 1
    print("Esto se imprime después del segundo yield")
    yield n

# Crear un objeto generador
gen = mi_generador()

# Obtener valores uno por uno
print(next(gen)) # Salida: Esto se imprime primero\n1
print(next(gen)) # Salida: Esto se imprime después del primer yield\n2
print(next(gen)) # Salida: Esto se imprime después del segundo yield\n3

# Intentar obtener un cuarto valor generará un StopIteration
# print(next(gen)) # Error: StopIteration
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Python Moderno',
    'topic': 'Iteradores y Generadores',
    'subtopic': 'Generators',
    'definition': '''
Los generadores son funciones especiales en Python que actúan como iteradores, pero con una forma más elegante y eficiente de producir una secuencia de valores. Se definen utilizando la palabra clave `yield` (como vimos antes) en lugar de `return`.

¿Te estás preguntando cuál es su ventaja principal?

La ventaja clave de los generadores es que producen valores "lazy" (perezosamente), es decir, generan los valores uno a la vez y solo cuando se solicitan, en lugar de generar todos los valores y almacenarlos en memoria de una sola vez. Esto los hace extremadamente eficientes en el uso de memoria, especialmente para secuencias de datos muy grandes o infinitas. Pensemos por un momento en un archivo de log que nunca termina; un generador podría leer línea por línea sin cargar todo el archivo.

Además de las funciones generadoras, Python también tiene "expresiones generadoras", que son una forma concisa de crear generadores sobre la marcha, similar a las comprensiones de lista, pero con paréntesis en lugar de corchetes.
''',
    'code_example': '''
# Función generadora para generar números pares
def generador_pares(limite):
    n = 0
    while n <= limite:
        yield n
        n += 2

# Usar el generador en un bucle for
print("Números pares usando generador:")
for num in generador_pares(10):
    print(num)
# Salida:
# Números pares usando generador:
# 0
# 2
# ...
# 10

# Expresión generadora para generar cuadrados
cuadrados_gen = (x * x for x in range(5))
print("Cuadrados usando expresión generadora:")
print(next(cuadrados_gen)) # Salida: 0
print(next(cuadrados_gen)) # Salida: 1

# Convertir la expresión generadora a una lista (consume todos los valores)
lista_cuadrados = list(cuadrados_gen)
print(f"Resto de cuadrados en lista: {lista_cuadrados}") # Salida: Resto de cuadrados en lista: [4, 9, 16]
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Python Moderno',
    'topic': 'Iteradores y Generadores',
    'subtopic': 'itertools module',
    'definition': '''
El módulo `itertools` de la biblioteca estándar de Python es una caja de herramientas muy potente para trabajar con iteradores de manera eficiente. Proporciona una colección de funciones que construyen iteradores complejos a partir de iteradores simples, a menudo de forma más optimizada que si lo hicieras manualmente con bucles.

¿Te estás preguntando para qué sirve esto?

Pensemos por un momento en operaciones comunes con secuencias de datos, como combinar listas, filtrar elementos repetidos o generar permutaciones. `itertools` te ofrece funciones preconstruidas que son rápidas y consumen poca memoria porque operan con iteradores (generadores implícitos), generando valores bajo demanda en lugar de crear listas intermedias completas. Esto es ideal para conjuntos de datos grandes o infinitos.

Algunas funciones populares de `itertools` incluyen:

-   **`count(start, step)`:** Crea un iterador que produce números que empiezan en `start` y se incrementan en `step`. (Generador infinito)
-   **`cycle(iterable)`:** Crea un iterador que repite los elementos de un `iterable` indefinidamente. (Generador infinito)
-   **`repeat(object, times)`:** Crea un iterador que repite un `object` un número específico de `times` (o indefinidamente).
-   **`chain(*iterables)`:** Combina varios iterables en uno solo.
-   **`permutations(iterable, r)`:** Devuelve todas las permutaciones de longitud `r` de los elementos del `iterable`.
-   **`combinations(iterable, r)`:** Devuelve todas las combinaciones de longitud `r` de los elementos del `iterable`.
''',
    'code_example': '''
from itertools import count, cycle, chain, permutations

# Ejemplo de count
for i in count(10, 2): # Empieza en 10, incrementa de 2 en 2
    if i > 20:
        break
    print(f"Count: {i}")
# Salida:
# Count: 10
# Count: 12
# ...
# Count: 20

# Ejemplo de cycle
colores = ['rojo', 'verde', 'azul']
iter_colores = cycle(colores)
print(f"Primer color: {next(iter_colores)}")  # Salida: Primer color: rojo
print(f"Segundo color: {next(iter_colores)}") # Salida: Segundo color: verde
print(f"Tercer color: {next(iter_colores)}")  # Salida: Tercer color: azul
print(f"Cuarto color (ciclo): {next(iter_colores)}") # Salida: Cuarto color (ciclo): rojo

# Ejemplo de chain
listas = [1, 2], ['a', 'b'], [True, False]
todos_los_elementos = list(chain(*listas))
print(f"Todos los elementos: {todos_los_elementos}") # Salida: Todos los elementos: [1, 2, 'a', 'b', True, False]

# Ejemplo de permutations
elementos = ['A', 'B', 'C']
todas_las_permutaciones = list(permutations(elementos, 2))
print(f"Permutaciones de 2: {todas_las_permutaciones}")
# Salida: Permutaciones de 2: [('A', 'B'), ('A', 'C'), ('B', 'A'), ('B', 'C'), ('C', 'A'), ('C', 'B')]
'''
  });
}

Future<void> insertPythonMidLevel4Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Bases de Datos',
    'topic': 'SQL Básico',
    'subtopic': 'sqlite3 module',
    'definition': '''
El módulo `sqlite3` en Python proporciona una interfaz para trabajar con bases de datos SQLite. SQLite es un sistema de gestión de bases de datos relacional ligero y autónomo, lo que significa que no necesita un servidor de base de datos separado; la base de datos se almacena en un solo archivo en el disco.

¿Te estás preguntando por qué esto es útil?

Pensemos por un momento en una aplicación que necesita almacenar datos localmente de forma persistente, como la configuración de un usuario, el historial de una aplicación o datos de una pequeña aplicación de escritorio. SQLite es perfecto para estos casos. No tienes que preocuparte por instalar y configurar un servidor de base de datos complejo, lo que lo hace ideal para el desarrollo rápido y para aplicaciones que no requieren una base de datos centralizada y escalable.

El módulo `sqlite3` te permite conectarte a una base de datos SQLite, ejecutar comandos SQL (como `CREATE TABLE`, `INSERT`, `SELECT`, `UPDATE`, `DELETE`) y gestionar transacciones.
''',
    'code_example': '''
import sqlite3

# Conectar a una base de datos (o crearla si no existe)
conn = sqlite3.connect('mi_base_de_datos.db')
cursor = conn.cursor()

# Crear una tabla
try:
    cursor.execute('''
        'CREATE TABLE IF NOT EXISTS usuarios ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT,'
        'nombre TEXT NOT NULL,'
        'edad INTEGER'
        ')'
        ''')
    conn.commit() # Confirmar los cambios
    print("Tabla 'usuarios' creada o ya existente.")
except sqlite3.Error as e:
    print(f"Error al crear la tabla: {e}")

# Cerrar la conexión
conn.close()
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Bases de Datos',
    'topic': 'SQL Básico',
    'subtopic': 'Consultas básicas',
    'definition': '''
Las consultas SQL son el lenguaje estándar para interactuar con bases de datos relacionales. Permiten realizar operaciones como insertar nuevos datos, recuperar información, actualizar registros existentes y eliminar datos.

¿Te estás preguntando cómo se construyen?

Pensemos por un momento en una tienda de libros. Necesitas añadir nuevos libros, buscar libros por autor o título, actualizar el precio de un libro o eliminar un libro que ya no está disponible. Las consultas SQL te permiten hacer todo esto.

Aquí te presento algunas de las consultas básicas más comunes:

-   **`INSERT INTO`**: Se usa para añadir nuevas filas (registros) a una tabla.
    Ejemplo: `INSERT INTO usuarios (nombre, edad) VALUES ('Alice', 30);`
-   **`SELECT`**: Se utiliza para recuperar datos de una o más tablas. Puedes especificar qué columnas quieres ver y qué filas (usando `WHERE`).
    Ejemplo: `SELECT nombre, edad FROM usuarios WHERE edad > 25;`
-   **`UPDATE`**: Modifica datos existentes en una tabla. Es crucial usar una cláusula `WHERE` para especificar qué filas actualizar.
    Ejemplo: `UPDATE usuarios SET edad = 31 WHERE nombre = 'Alice';`
-   **`DELETE FROM`**: Elimina filas de una tabla. Al igual que con `UPDATE`, la cláusula `WHERE` es vital para evitar borrar todos los registros.
    Ejemplo: `DELETE FROM usuarios WHERE nombre = 'Bob';`
''',
    'code_example': '''
import sqlite3

conn = sqlite3.connect('mi_base_de_datos.db')
cursor = conn.cursor()

# Insertar datos
try:
    cursor.execute("INSERT INTO usuarios (nombre, edad) VALUES (?, ?)", ('Alice', 30))
    cursor.execute("INSERT INTO usuarios (nombre, edad) VALUES (?, ?)", ('Bob', 25))
    conn.commit()
    print("Datos insertados correctamente.")
except sqlite3.Error as e:
    print(f"Error al insertar datos: {e}")

# Seleccionar datos
print("\\nUsuarios:")
cursor.execute("SELECT id, nombre, edad FROM usuarios")
usuarios = cursor.fetchall() # Obtener todos los resultados
for usuario in usuarios:
    print(usuario)

# Actualizar datos
cursor.execute("UPDATE usuarios SET edad = ? WHERE nombre = ?", (31, 'Alice'))
conn.commit()
print("\\nAlice actualizada:")
cursor.execute("SELECT id, nombre, edad FROM usuarios WHERE nombre = 'Alice'")
print(cursor.fetchone()) # Obtener un solo resultado

# Eliminar datos
cursor.execute("DELETE FROM usuarios WHERE nombre = 'Bob'")
conn.commit()
print("\\nUsuarios después de eliminar Bob:")
cursor.execute("SELECT id, nombre, edad FROM usuarios")
print(cursor.fetchall())

conn.close()
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Bases de Datos',
    'topic': 'SQL Básico',
    'subtopic': 'ORMs básicos (SQLAlchemy Core)',
    'definition': '''
Un ORM (Object-Relational Mapper o Mapeador Objeto-Relacional) es una técnica de programación que permite interactuar con una base de datos utilizando objetos del lenguaje de programación en lugar de escribir consultas SQL directamente. SQLAlchemy es uno de los ORMs más potentes y flexibles en Python. En su versión "Core", nos permite construir consultas SQL de forma programática.

¿Te estás preguntando por qué usar un ORM?

Pensemos por un momento en tener que escribir cadenas SQL con concatenaciones y escapar de caracteres, lo que puede ser propenso a errores y ataques de inyección SQL. Un ORM abstrae esta complejidad. En lugar de escribir `SELECT * FROM usuarios WHERE id = 1`, podrías escribir algo más parecido a `session.query(Usuario).filter_by(id=1).first()`. Esto hace que tu código sea más seguro, legible y a menudo más portable entre diferentes tipos de bases de datos.

SQLAlchemy Core se enfoca en la construcción de SQL de una manera programática y expresiva. Permite definir tablas, columnas y claves, y luego construir consultas complejas utilizando objetos Python, traduciéndolas a SQL en segundo plano. Esto es diferente de su ORM de alto nivel, que mapea clases de Python directamente a tablas de bases de datos.
''',
    'code_example': '''
from sqlalchemy import create_engine, MetaData, Table, Column, Integer, String, select, insert, update, delete

# 1. Conexión al motor de la base de datos
engine = create_engine('sqlite:///mi_base_de_datos_orm.db')

# 2. Definir la estructura de la tabla (metadata)
metadata = MetaData()
usuarios_table = Table(
    'usuarios_orm', metadata,
    Column('id', Integer, primary_key=True),
    Column('nombre', String(50)),
    Column('edad', Integer)
)

# 3. Crear la tabla en la base de datos
metadata.create_all(engine)
print("Tabla 'usuarios_orm' creada o ya existente.")

# 4. Insertar datos
with engine.connect() as conn:
    # Inserta un registro
    insert_stmt = insert(usuarios_table).values(nombre='Charlie', edad=28)
    conn.execute(insert_stmt)
    # Inserta múltiples registros
    insert_many_stmt = insert(usuarios_table)
    conn.execute(insert_many_stmt, [
        {'nombre': 'David', 'edad': 35},
        {'nombre': 'Eve', 'edad': 22}
    ])
    conn.commit()
    print("Datos insertados con SQLAlchemy Core.")

# 5. Seleccionar datos
with engine.connect() as conn:
    select_stmt = select(usuarios_table).where(usuarios_table.c.edad > 25)
    result = conn.execute(select_stmt)
    print("\\nUsuarios mayores de 25:")
    for row in result:
        print(row)

# 6. Actualizar datos
with engine.connect() as conn:
    update_stmt = update(usuarios_table).where(usuarios_table.c.nombre == 'Charlie').values(edad=29)
    conn.execute(update_stmt)
    conn.commit()
    print("\\nCharlie actualizada:")
    select_charlie = select(usuarios_table).where(usuarios_table.c.nombre == 'Charlie')
    print(conn.execute(select_charlie).fetchone())

# 7. Eliminar datos
with engine.connect() as conn:
    delete_stmt = delete(usuarios_table).where(usuarios_table.c.nombre == 'Eve')
    conn.execute(delete_stmt)
    conn.commit()
    print("\\nUsuarios después de eliminar Eve:")
    select_all = select(usuarios_table)
    for row in conn.execute(select_all):
        print(row)
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Bases de Datos',
    'topic': 'ORMs',
    'subtopic': 'SQLAlchemy ORM',
    'definition': '''
SQLAlchemy ORM (Object-Relational Mapper) es el componente de alto nivel de SQLAlchemy que permite mapear clases de Python directamente a tablas de bases de datos, y objetos de Python a filas en esas tablas.

¿Te estás preguntando por qué esto es una gran ventaja?

Mientras que SQLAlchemy Core te permite construir consultas SQL programáticamente, el ORM va un paso más allá al permitirte interactuar con tu base de datos utilizando objetos Python familiares. Pensemos por un momento en gestionar usuarios. En lugar de escribir SQL para cada `INSERT`, `SELECT`, `UPDATE` o `DELETE`, con el ORM puedes crear una clase `Usuario` y luego simplemente interactuar con objetos de esa clase. Esto hace que tu código sea mucho más intuitivo, orientado a objetos y, a menudo, más fácil de mantener.

El ORM de SQLAlchemy es conocido por su flexibilidad y potencia, lo que lo convierte en una opción robusta para aplicaciones de cualquier tamaño. Permite definir modelos (clases que representan tablas de la base de datos), realizar consultas complejas utilizando métodos de Python y gestionar relaciones entre tablas de forma elegante.
''',
    'code_example': '''
from sqlalchemy import create_engine, Column, Integer, String
from sqlalchemy.orm import declarative_base, sessionmaker

# 1. Definir la base declarativa
Base = declarative_base()

# 2. Definir el modelo (clase Python mapeada a una tabla)
class Usuario(Base):
    __tablename__ = 'usuarios_orm_full'
    id = Column(Integer, primary_key=True)
    nombre = Column(String(50), nullable=False)
    edad = Column(Integer)

    def __repr__(self):
        return f"<Usuario(id={self.id}, nombre='{self.nombre}', edad={self.edad})>"

# 3. Conectar al motor de la base de datos
engine = create_engine('sqlite:///mi_base_de_datos_full_orm.db')

# 4. Crear las tablas (si no existen)
Base.metadata.create_all(engine)
print("Tabla 'usuarios_orm_full' creada o ya existente.")

# 5. Crear una sesión para interactuar con la base de datos
Session = sessionmaker(bind=engine)
session = Session()

# 6. Insertar datos
nuevo_usuario = Usuario(nombre='Frank', edad=40)
session.add(nuevo_usuario)
session.commit() # Guardar los cambios en la base de datos
print(f"Usuario insertado: {nuevo_usuario}")

# 7. Seleccionar datos
print("\\nUsuarios en la base de datos:")
usuarios = session.query(Usuario).all() # Obtener todos los usuarios
for user in usuarios:
    print(user)

# 8. Actualizar datos
usuario_a_actualizar = session.query(Usuario).filter_by(nombre='Frank').first()
if usuario_a_actualizar:
    usuario_a_actualizar.edad = 41
    session.commit()
    print(f"Usuario actualizado: {usuario_a_actualizar}")

# 9. Eliminar datos
usuario_a_eliminar = session.query(Usuario).filter_by(nombre='Frank').first()
if usuario_a_eliminar:
    session.delete(usuario_a_eliminar)
    session.commit()
    print(f"Usuario eliminado: {usuario_a_eliminar}")

session.close()
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Bases de Datos',
    'topic': 'ORMs',
    'subtopic': 'Django ORM',
    'definition': '''
El Django ORM es el Object-Relational Mapper que viene integrado con el framework web Django. Está diseñado para ser muy fácil de usar y se integra perfectamente con el resto del ecosistema de Django.

¿Te estás preguntando qué lo hace especial?

El Django ORM se enfoca en la convención sobre la configuración, lo que significa que a menudo puedes definir tus modelos de datos con muy poco código y el ORM se encarga de gran parte de la magia detrás de escena (como la creación de tablas, la gestión de relaciones y las consultas básicas). Pensemos por un momento en un proyecto web que necesita gestionar usuarios, productos, pedidos, etc. El Django ORM te permite definir estas "entidades" como clases de Python y luego interactuar con ellas como si fueran objetos Python comunes, sin escribir SQL.

Una de las características más potentes del Django ORM es su sintaxis concisa y legible para realizar consultas complejas. Puedes encadenar métodos como `filter()`, `exclude()`, `order_by()`, `annotate()`, entre otros, para construir consultas que se traducen eficientemente a SQL. También maneja automáticamente las migraciones de la base de datos, lo que facilita la evolución del esquema de tu base de datos a medida que tu aplicación crece.
''',
    'code_example': '''
# Nota: Este código no es ejecutable directamente sin un proyecto Django configurado.
# Es para ilustrar la sintaxis del Django ORM.

# Asume que tienes un archivo models.py en una app de Django

# from django.db import models

# class Producto(models.Model):
#     nombre = models.CharField(max_length=100)
#     precio = models.DecimalField(max_digits=10, decimal_places=2)
#     stock = models.IntegerField(default=0)
#     fecha_creacion = models.DateTimeField(auto_now_add=True)

#     def __str__(self):
#         return self.nombre

# # Para interactuar con el ORM desde la shell de Django:
# # python manage.py shell

# # --- Dentro de la shell de Django ---

# # Crear un nuevo producto
# # producto = Producto.objects.create(nombre="Laptop", precio=1200.00, stock=50)
# # print(f"Producto creado: {producto}")

# # Consultar todos los productos
# # todos_los_productos = Producto.objects.all()
# # print("\\nTodos los productos:")
# # for p in todos_los_productos:
# #     print(p)

# # Filtrar productos por condición
# # productos_caros = Producto.objects.filter(precio__gt=1000) # __gt significa "greater than"
# # print("\\nProductos caros:")
# # for p in productos_caros:
# #     print(p)

# # Actualizar un producto
# # producto_a_actualizar = Producto.objects.get(nombre="Laptop")
# # producto_a_actualizar.precio = 1150.00
# # producto_a_actualizar.save()
# # print(f"Producto actualizado: {producto_a_actualizar}")

# # Eliminar un producto
# # producto_a_eliminar = Producto.objects.get(nombre="Laptop")
# # producto_a_eliminar.delete()
# # print("Producto eliminado.")
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Bases de Datos',
    'topic': 'ORMs',
    'subtopic': 'Modelos básicos',
    'definition': '''
En el contexto de los ORMs, los "modelos" son clases de Python que representan las tablas de tu base de datos. Cada instancia de un modelo corresponde a una fila en esa tabla. Definir modelos es el primer paso para interactuar con tu base de datos de manera orientada a objetos.

¿Te estás preguntando cómo se construyen?

Pensemos por un momento en una tabla de base de datos llamada `Clientes` con columnas como `id`, `nombre`, `email` y `fecha_registro`. Con un ORM, crearías una clase Python llamada `Cliente`. Cada atributo de esta clase (como `nombre` o `email`) se mapearía a una columna de la tabla de la base de datos.

Los modelos básicos en ORMs suelen incluir:

-   **Definición de la clase:** La clase hereda de una clase base proporcionada por el ORM (ej., `Base` en SQLAlchemy, `models.Model` en Django).
-   **Definición de atributos (campos):** Cada atributo de la clase se define con un tipo de dato específico del ORM que se mapea a un tipo de columna en la base de datos (ej., `Integer`, `String`, `CharField`, `DateTimeField`).
-   **Clave primaria:** Generalmente se define un campo como clave primaria (`primary_key=True`).
-   **Relaciones:** Aunque esto va más allá de los "modelos básicos", los ORMs también permiten definir relaciones entre modelos (ej., uno a muchos, muchos a muchos) de forma declarativa.

Estos modelos se convierten en la interfaz principal para realizar operaciones CRUD (Crear, Leer, Actualizar, Eliminar) en tu base de datos.
''',
    'code_example': '''
# Ejemplo usando SQLAlchemy ORM (para referencia)
from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import declarative_base

Base = declarative_base()

class Producto(Base):
    __tablename__ = 'productos' # Nombre de la tabla en la DB
    id = Column(Integer, primary_key=True)
    nombre = Column(String(255), nullable=False)
    precio = Column(Integer, default=0) # Asume centavos para evitar float issues

    def __repr__(self):
        return f"<Producto(id={self.id}, nombre='{self.nombre}', precio={self.precio})>"

# Ejemplo usando Django ORM (para referencia)
# from django.db import models

# class Categoria(models.Model):
#     nombre = models.CharField(max_length=50, unique=True)
#     descripcion = models.TextField(blank=True)

#     class Meta:
#         verbose_name_plural = "Categorías"

#     def __str__(self):
#         return self.nombre

# Ambos ejemplos muestran cómo se definen los modelos que luego el ORM utiliza
# para interactuar con la base de datos de forma abstracta.
'''
  });
}

Future<void> insertPythonMidLevel5Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Pruebas Avanzadas',
    'topic': 'Pruebas Unitarias',
    'subtopic': 'pytest avanzado',
    'definition': '''
`pytest` es un framework de pruebas robusto y extensible para Python que simplifica la escritura de pruebas, desde las más simples hasta las más complejas. Ya hemos visto lo básico de `pytest`, pero sus capacidades avanzadas lo convierten en una herramienta indispensable para el desarrollo moderno.

¿Te estás preguntando qué lo hace tan potente?

Pensemos por un momento en la necesidad de configurar un entorno de prueba complejo antes de ejecutar cada test, o en cómo ejecutar el mismo test con diferentes conjuntos de datos. `pytest` aborda estas necesidades con características como:

-   **Detección automática de pruebas:** Encuentra automáticamente pruebas en archivos que comienzan con `test_` o en clases que empiezan con `Test`.
-   **Fixtures:** Permiten configurar un entorno de prueba (por ejemplo, crear una conexión a una base de datos) y desmontarlo después de que las pruebas han terminado. Esto reduce la duplicación de código y asegura que las pruebas sean aisladas.
-   **Parametrización:** Permite ejecutar la misma prueba múltiples veces con diferentes conjuntos de datos de entrada, lo que es extremadamente útil para probar diferentes escenarios de manera eficiente.
-   **Plugins:** `pytest` tiene un rico ecosistema de plugins que extienden su funcionalidad, como cobertura de código, informes XML, etc.

Estas características avanzadas hacen que `pytest` sea una elección popular para pruebas unitarias y de integración en proyectos de Python.
''',
    'code_example': '''
# Primero, asegúrate de tener pytest instalado:
# pip install pytest

# Archivo: test_ejemplo_avanzado.py

# Ejemplo de un test simple (pytest lo detecta automáticamente)
def test_string_capitalizado():
    assert "hello".capitalize() == "Hello"

# Ejemplo de una función de prueba con una aserción básica
def test_suma_numeros():
    assert 2 + 2 == 4

# Para ejecutar desde la terminal:
# pytest

# La salida de pytest indicaría:
# ============================= test session starts ==============================
# ...
# collected 2 items
#
# test_ejemplo_avanzado.py ..                                             [100%]
#
# ============================== 2 passed in ...s ===============================
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Pruebas Avanzadas',
    'topic': 'Pruebas Unitarias',
    'subtopic': 'fixtures',
    'definition': '''
Las "fixtures" en `pytest` son funciones que se utilizan para preparar un entorno de prueba antes de que se ejecute una prueba, y opcionalmente, para limpiar ese entorno después. Son una parte fundamental del ecosistema de `pytest` y permiten una configuración de pruebas flexible y reutilizable.

¿Te estás preguntando por qué son tan útiles?

Pensemos por un momento en una prueba que necesita una conexión a una base de datos, o un objeto de configuración específico. Sin fixtures, tendrías que inicializar y limpiar estos recursos en cada prueba, lo que llevaría a código repetitivo y propenso a errores. Las fixtures abstraen esta configuración, asegurando que cada prueba reciba un entorno consistente y que los recursos se liberen adecuadamente.

Se definen usando el decorador `@pytest.fixture`. Una función de prueba simplemente declara el nombre de la fixture como un argumento, y `pytest` se encarga de inyectar el resultado de la fixture en la prueba. Las fixtures pueden tener diferentes alcances (función, clase, módulo, sesión), controlando cuándo se ejecutan y se limpian.
''',
    'code_example': '''
# Archivo: test_fixtures.py
import pytest

# Definir una fixture a nivel de función
@pytest.fixture
def datos_usuario():
    print("\\nSETUP: Creando datos de usuario...")
    user_data = {"nombre": "Alice", "edad": 30}
    yield user_data # Esto es lo que la fixture "devuelve" a la prueba
    print("TEARDOWN: Limpiando datos de usuario...") # Se ejecuta después de la prueba

# Una prueba que usa la fixture
def test_nombre_usuario(datos_usuario):
    print("EJECUTANDO: test_nombre_usuario")
    assert datos_usuario["nombre"] == "Alice"

def test_edad_usuario(datos_usuario):
    print("EJECUTANDO: test_edad_usuario")
    assert datos_usuario["edad"] == 30

# Para ejecutar desde la terminal:
# pytest -s test_fixtures.py (el -s es para ver los prints de setup/teardown)

# Salida esperada (el orden de los tests puede variar):
# SETUP: Creando datos de usuario...
# EJECUTANDO: test_nombre_usuario
# .TEARDOWN: Limpiando datos de usuario...
# SETUP: Creando datos de usuario...
# EJECUTANDO: test_edad_usuario
# .TEARDOWN: Limpiando datos de usuario...
# ============================= test session starts ==============================
# ...
# ============================== 2 passed in ...s ===============================
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Pruebas Avanzadas',
    'topic': 'Pruebas Unitarias',
    'subtopic': 'parametrización',
    'definition': '''
La parametrización en `pytest` es una característica poderosa que permite ejecutar la misma función de prueba varias veces con diferentes conjuntos de entradas y expectativas de salida. Esto es ideal para pruebas de "caja negra" donde quieres verificar el comportamiento de una función con una variedad de datos.

¿Te estás preguntando por qué es tan eficiente?

Pensemos por un momento en probar una función de suma. Necesitarías verificar que `1+1=2`, `2+3=5`, `-1+1=0`, etc. Sin parametrización, tendrías que escribir una función de prueba separada para cada caso. La parametrización elimina esta duplicación, haciendo que tu suite de pruebas sea más concisa, legible y fácil de mantener.

Para parametrizar una prueba, se utiliza el decorador `@pytest.mark.parametrize()`. Este decorador toma dos argumentos principales: una cadena con los nombres de los argumentos de la prueba que se van a parametrizar, y una lista de tuplas (o otras estructuras) donde cada tupla representa un conjunto de valores para esos argumentos. `pytest` creará y ejecutará una instancia de la prueba para cada conjunto de valores proporcionado.
''',
    'code_example': '''
# Archivo: test_parametrizacion.py
import pytest

# Función a probar
def sumar(a, b):
    return a + b

# Parametrizar la función de prueba
@pytest.mark.parametrize("num1, num2, resultado_esperado", [
    (1, 1, 2),
    (2, 3, 5),
    (-1, 1, 0),
    (0, 0, 0),
    (10, -5, 5)
])
def test_sumar_varios_casos(num1, num2, resultado_esperado):
    """
    Prueba la función sumar con diferentes combinaciones de números.
    """
    assert sumar(num1, num2) == resultado_esperado

# Función a probar
def es_par(numero):
    return numero % 2 == 0

@pytest.mark.parametrize("entrada, esperado", [
    (2, True),
    (4, True),
    (1, False),
    (0, True),
    (-3, False)
])
def test_es_par_varios_casos(entrada, esperado):
    """
    Prueba la función es_par con diferentes entradas.
    """
    assert es_par(entrada) == esperado

# Para ejecutar desde la terminal:
# pytest test_parametrizacion.py

# La salida mostrará que se ejecutan múltiples pruebas por cada función parametrizada:
# ============================= test session starts ==============================
# ...
# collected 10 items
#
# test_parametrizacion.py ..... .....                                      [100%]
#
# ============================== 10 passed in ...s ==============================
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Pruebas Avanzadas',
    'topic': 'Mocking',
    'subtopic': 'unittest.mock',
    'definition': '''
El módulo `unittest.mock` en la biblioteca estándar de Python proporciona herramientas para reemplazar partes de tu sistema con objetos "mock" o "simulados". El mocking es una técnica fundamental en las pruebas unitarias para aislar el código que estás probando de sus dependencias externas.

¿Te estás preguntando por qué esto es crucial?

Pensemos por un momento en una función que interactúa con una base de datos o una API externa. Cuando ejecutas pruebas unitarias para esta función, no quieres que las pruebas realmente golpeen la base de datos o la API, ya que esto las haría lentas, poco fiables (dependen de la disponibilidad del servicio) y difíciles de reproducir. El mocking te permite simular el comportamiento de estas dependencias externas, dándote control total sobre lo que devuelven y cómo se comportan, sin necesidad de que las dependencias reales estén disponibles.

`unittest.mock` ofrece la clase `Mock` (y su variante más poderosa `MagicMock`) y el decorador `patch` para realizar esta simulación.
''',
    'code_example': '''
# Este es un ejemplo conceptual para ilustrar el mocking.
# Normalmente, 'requests' sería una dependencia externa.
import unittest
from unittest.mock import Mock

# Supongamos que esta es la función que queremos probar
def obtener_datos_api(url):
    # En un escenario real, esto haría una solicitud HTTP
    # import requests
    # response = requests.get(url)
    # return response.json()
    
    # Para el ejemplo de mocking, simulamos la respuesta
    mock_response = Mock()
    mock_response.json.return_value = {"status": "success", "data": "datos simulados"}
    mock_response.status_code = 200
    return mock_response.json()

class TestObtenerDatosAPI(unittest.TestCase):
    def test_obtener_datos_correctos(self):
        # Aquí, 'obtener_datos_api' no llama a una API real,
        # sino que utilizamos un mock para simular su comportamiento.
        datos = obtener_datos_api("http://api.ejemplo.com/data")
        self.assertEqual(datos, {"status": "success", "data": "datos simulados"})

# if __name__ == '__main__':
#     unittest.main()
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Pruebas Avanzadas',
    'topic': 'Mocking',
    'subtopic': 'patch',
    'definition': '''
`patch` es una de las funciones más poderosas y utilizadas del módulo `unittest.mock`. Permite reemplazar temporalmente objetos o funciones en un módulo o clase durante la ejecución de una prueba.

¿Te estás preguntando cómo funciona y por qué es tan conveniente?

Pensemos por un momento en una función que utiliza `datetime.now()` para obtener la hora actual, o que llama a una función de una biblioteca externa. Si pruebas esa función, el resultado dependerá de la hora del sistema o de la respuesta de la biblioteca. Con `patch`, puedes reemplazar `datetime.now()` con un mock que siempre devuelve una fecha y hora específica, o reemplazar la función de la biblioteca externa con un mock que devuelve un valor predefinido. Esto hace que tus pruebas sean deterministas y aisladas.

`patch` se puede usar como un decorador de función (`@patch`), un gestor de contexto (`with patch(...)`), o directamente como una función para aplicar y revertir el parche manualmente. Cuando el bloque de código o la función decorada termina, el objeto original se restaura automáticamente.
''',
    'code_example': '''
from unittest.mock import patch
import datetime

# Supongamos que tenemos esta función que queremos probar
def es_hora_laboral():
    """Devuelve True si la hora actual está entre 9 AM y 5 PM."""
    ahora = datetime.datetime.now().hour
    return 9 <= ahora < 17

# Usando patch como decorador
@patch('datetime.datetime')
def test_es_hora_laboral_en_horario(MockDatetime):
    MockDatetime.now.return_value = datetime.datetime(2023, 1, 1, 10, 0, 0) # Mockeamos la hora a las 10 AM
    assert es_hora_laboral() is True

@patch('datetime.datetime')
def test_es_hora_laboral_fuera_horario(MockDatetime):
    MockDatetime.now.return_value = datetime.datetime(2023, 1, 1, 18, 0, 0) # Mockeamos la hora a las 6 PM
    assert es_hora_laboral() is False

# Usando patch como gestor de contexto
def test_es_hora_laboral_con_with():
    with patch('datetime.datetime') as MockDatetime:
        MockDatetime.now.return_value = datetime.datetime(2023, 1, 1, 14, 0, 0)
        assert es_hora_laboral() is True
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Pruebas Avanzadas',
    'topic': 'Mocking',
    'subtopic': 'MagicMock',
    'definition': '''
`MagicMock` es una subclase de `Mock` en el módulo `unittest.mock` que automáticamente implementa la mayoría de los métodos mágicos (métodos especiales que comienzan y terminan con doble guion bajo, como `__str__`, `__len__`, `__call__`, etc.).

¿Te estás preguntando por qué es "mágica"?

Pensemos por un momento en un objeto que se espera que se pueda llamar (como una función), que se pueda iterar, o que tenga un comportamiento de longitud. Con un `Mock` básico, tendrías que definir manualmente cómo se comportan estos métodos mágicos. `MagicMock` los implementa por defecto para que puedas usar tu mock de una manera más natural y cercana al objeto real que está simulando. Esto simplifica mucho la configuración de mocks para objetos complejos.

Por ejemplo, un `MagicMock` puede ser llamado como una función (`mock_obj()`), se le puede aplicar `len()` (`len(mock_obj)`), o se puede iterar sobre él (`for item in mock_obj:`), y puedes configurar sus valores de retorno o efectos secundarios de la misma manera que lo harías con un `Mock` normal.
''',
    'code_example': '''
from unittest.mock import MagicMock

# Crear un MagicMock
mock_objeto = MagicMock()

# Se puede llamar como una función
mock_objeto.return_value = "Resultado de llamada"
print(mock_objeto()) # Salida: Resultado de llamada
mock_objeto.assert_called_once()

# Se puede simular que es iterable
mock_objeto.__iter__.return_value = iter([1, 2, 3])
print(list(mock_objeto)) # Salida: [1, 2, 3]

# Se puede simular su longitud
mock_objeto.__len__.return_value = 5
print(len(mock_objeto)) # Salida: 5

# Simular acceso a atributos y métodos
mock_objeto.some_attribute = "valor_atributo"
mock_objeto.some_method.return_value = "resultado_metodo"

print(mock_objeto.some_attribute) # Salida: valor_atributo
print(mock_objeto.some_method()) # Salida: resultado_metodo

# Verificar llamadas
mock_objeto.some_method.assert_called_once()
'''
  });
}

Future<void> insertPythonMidLevel6Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Gestión de Dependencias',
    'topic': 'Entornos Virtuales',
    'subtopic': 'venv',
    'definition': '''
`venv` es un módulo de la biblioteca estándar de Python que se utiliza para crear entornos virtuales. Un entorno virtual es un directorio aislado que contiene una instalación de Python y sus dependencias.

¿Te estás preguntando por qué son importantes?

Pensemos por un momento en trabajar en múltiples proyectos de Python. Algunos pueden requerir versiones específicas de bibliotecas que son incompatibles entre sí. Sin entornos virtuales, instalarías todas las bibliotecas globalmente, lo que podría llevar a conflictos y roturas en tus proyectos. `venv` te permite crear entornos aislados para cada proyecto, asegurando que cada uno tenga sus propias dependencias sin interferir con otros.

Para crear un entorno virtual con `venv`, utilizas el comando `python -m venv <nombre_del_entorno>`. Luego, debes "activar" el entorno para usarlo. Una vez activado, cualquier paquete que instales con `pip` se instalará dentro de ese entorno, no globalmente.
''',
    'code_example': '''
# Crear un entorno virtual llamado "mi_entorno"
# python -m venv mi_entorno

# Activar el entorno (Linux/macOS)
# source mi_entorno/bin/activate

# Activar el entorno (Windows)
# mi_entorno\\Scripts\\activate

# Una vez activado, instala paquetes con pip:
# pip install requests

# Para desactivar el entorno:
# deactivate
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Gestión de Dependencias',
    'topic': 'Entornos Virtuales',
    'subtopic': 'pipenv',
    'definition': '''
`pipenv` es una herramienta para la gestión de dependencias en proyectos de Python. Combina las funcionalidades de `pip` y `venv`, facilitando la creación y gestión de entornos virtuales y la instalación/desinstalación de paquetes.

¿Te estás preguntando qué ventajas ofrece sobre `venv` y `pip` por separado?

`pipenv` simplifica el flujo de trabajo. En lugar de crear un entorno con `venv` y luego instalar paquetes con `pip`, `pipenv` lo hace todo en un solo paso. Además, gestiona un archivo `Pipfile` y un archivo `Pipfile.lock` para rastrear las dependencias del proyecto y asegurar builds reproducibles. El archivo `Pipfile` lista las dependencias de alto nivel, mientras que `Pipfile.lock` contiene las versiones exactas de todas las dependencias, incluyendo las transitivas (las dependencias de tus dependencias).

`pipenv` también ofrece otras características útiles, como la detección automática de entornos virtuales existentes, la gestión de dependencias de desarrollo y la verificación de vulnerabilidades de seguridad en los paquetes.
''',
    'code_example': '''
# Primero, instala pipenv (si no lo tienes):
# pip install pipenv

# Navega al directorio de tu proyecto y crea el entorno:
# pipenv install

# Esto crea un Pipfile y un Pipfile.lock (si no existen) y un entorno virtual.

# Para instalar paquetes:
# pipenv install requests
# pipenv install --dev pytest  # Para dependencias de desarrollo

# Para ejecutar un script dentro del entorno:
# pipenv run python mi_script.py

# Para activar el entorno:
# pipenv shell

# Para desactivar el entorno (si lo activaste con pipenv shell):
# exit
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Gestión de Dependencias',
    'topic': 'Entornos Virtuales',
    'subtopic': 'poetry',
    'definition': '''
`Poetry` es otra herramienta para la gestión de dependencias y empaquetado en Python. Similar a `pipenv`, facilita la creación y gestión de entornos virtuales, la instalación/desinstalación de paquetes y la gestión de las dependencias de un proyecto.

¿Te estás preguntando en qué se diferencia de `pipenv`?

`Poetry` se centra aún más en el empaquetado. Utiliza un archivo `pyproject.toml` (siguiendo el estándar PEP 518) para gestionar las dependencias y la información del proyecto. Esto incluye metadatos del proyecto, dependencias, dependencias de desarrollo y scripts. `Poetry` también ofrece un sistema de resolución de dependencias más avanzado que `pipenv`, lo que puede ayudar a evitar conflictos complejos.

Además de la gestión de dependencias, `Poetry` facilita la publicación de paquetes a PyPI (Python Package Index). Ofrece comandos para construir, empaquetar y publicar tus proyectos.
''',
    'code_example': '''
# Primero, instala poetry (si no lo tienes):
# pip install poetry

# Navega al directorio de tu proyecto e inicializa poetry:
# poetry new mi_proyecto
# o, si ya tienes un proyecto:
# poetry init

# Esto crea un archivo pyproject.toml

# Para instalar paquetes:
# poetry add requests
# poetry add --dev pytest  # Para dependencias de desarrollo

# Para ejecutar un script dentro del entorno:
# poetry run python mi_script.py

# Para activar el entorno:
# poetry shell

# Para construir el paquete:
# poetry build

# Para publicar el paquete:
# poetry publish
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Gestión de Dependencias',
    'topic': 'Empaquetado',
    'subtopic': 'setup.py',
    'definition': '''
`setup.py` es un archivo de configuración tradicionalmente utilizado en proyectos de Python para describir cómo se empaqueta, instala y distribuye un proyecto. Es el corazón del sistema de empaquetado `setuptools`.

¿Te estás preguntando por qué es necesario?

Pensemos por un momento en querer compartir tu código Python con otros desarrolladores o publicarlo en PyPI (el índice de paquetes de Python) para que cualquiera pueda instalarlo con `pip`. `setup.py` proporciona la información necesaria para que esto sea posible. Contiene metadatos sobre tu proyecto (nombre, versión, autor, descripción), las dependencias que necesita, los archivos que deben incluirse en el paquete, y cómo se deben construir e instalar tus módulos.

Aunque `setup.py` ha sido el estándar durante mucho tiempo, la comunidad de Python está migrando hacia el uso de `pyproject.toml` para la configuración del empaquetado, que veremos a continuación. Sin embargo, muchos proyectos existentes todavía usan `setup.py`, y entenderlo es fundamental para trabajar con el ecosistema de Python.
''',
    'code_example': '''
# Archivo: setup.py

from setuptools import setup, find_packages

setup(
    name='mi_paquete_ejemplo',
    version='0.1.0',
    author='Tu Nombre',
    author_email='tu.email@example.com',
    description='Un paquete de ejemplo para demostrar setup.py',
    long_description=open('README.md').read(),
    long_description_content_type='text/markdown',
    url='https://github.com/tu_usuario/mi_paquete_ejemplo',
    packages=find_packages(), # Descubre automáticamente los paquetes en el directorio
    classifiers=[
        'Programming Language :: Python :: 3',
        'License :: OSI Approved :: MIT License',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
    install_requires=[ # Dependencias de ejecución
        'requests>=2.25.1',
        'numpy>=1.20.0',
    ],
    # extras_require={ # Dependencias opcionales
    #     'dev': ['pytest>=6.0.0', 'flake8>=3.8.0'],
    # },
    # entry_points={ # Si tu paquete tiene scripts de línea de comandos
    #     'console_scripts': [
    #         'mi-script = mi_paquete_ejemplo.cli:main',
    #     ],
    # },
)

# Para construir un paquete distribuible (wheel):
# python setup.py sdist bdist_wheel

# Para instalar en modo editable:
# pip install -e .
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Gestión de Dependencias',
    'topic': 'Empaquetado',
    'subtopic': 'pyproject.toml',
    'definition': '''
`pyproject.toml` es un archivo de configuración que se ha convertido en el estándar moderno para la gestión de proyectos de Python. Se utiliza para configurar herramientas de construcción, herramientas de linting, gestión de dependencias y empaquetado, todo en un solo lugar.

¿Te estás preguntando por qué se prefiere sobre `setup.py`?

Pensemos por un momento en la fragmentación de herramientas en el ecosistema de Python, donde cada herramienta (pip, setuptools, poetry, flit, black, isort, mypy) tenía su propia forma de configuración. `pyproject.toml` (especificado en PEP 518, PEP 621 y otros) centraliza esta configuración, proporcionando una forma universal para que las herramientas de construcción sepan cómo manejar tu proyecto. Esto simplifica la vida del desarrollador y mejora la interoperabilidad.

`pyproject.toml` utiliza el formato TOML (Tom's Obvious, Minimal Language) y permite definir secciones específicas para diferentes herramientas. Por ejemplo, puedes especificar dependencias de construcción, metadatos del proyecto, cómo se ejecuta tu suite de pruebas, y configuraciones para herramientas como `Black` (formateador de código) o `mypy` (verificador de tipos). Herramientas modernas como `Poetry` y `Flit` ya lo utilizan por defecto.
''',
    'code_example': '''
# Archivo: pyproject.toml

[build-system]
requires = ["setuptools>=61.0.0", "wheel"]
build-backend = "setuptools.build_meta"

[project]
name = "mi_paquete_moderno"
version = "0.1.0"
authors = [
  { name="Tu Nombre", email="tu.email@example.com" },
]
description = "Un paquete de ejemplo usando pyproject.toml"
readme = "README.md"
requires-python = ">=3.8"
keywords = ["ejemplo", "moderno", "paquete"]
classifiers = [
    "Programming Language :: Python :: 3",
    "License :: OSI Approved :: MIT License",
    "Operating System :: OS Independent",
]
dependencies = [ # Dependencias de ejecución
    "requests>=2.25.1",
    "pandas>=1.3.0",
]

[project.urls]
Homepage = "https://github.com/tu_usuario/mi_paquete_moderno"
"Bug Tracker" = "https://github.com/tu_usuario/mi_paquete_moderno/issues"

[project.optional-dependencies] # Dependencias opcionales
dev = ["pytest>=7.0.0", "flake8>=4.0.0"]

[tool.setuptools.packages.find]
where = ["src"] # Le dice a setuptools dónde buscar los paquetes

# [tool.poetry] # Ejemplo de configuración de Poetry (si usas Poetry)
# name = "mi-paquete-moderno"
# version = "0.1.0"
# description = ""
# authors = ["Tu Nombre <tu.email@example.com>"]
# readme = "README.md"
# packages = [{include = "mi_paquete_moderno"}]
#
# [tool.poetry.dependencies]
# python = ">=3.8,<3.13"
# requests = "^2.25.1"
# pandas = "^1.3.0"
#
# [tool.poetry.group.dev.dependencies]
# pytest = "^7.0.0"
# flake8 = "^4.0.0"
'''
  });

  await db.insert('programming_content', {
    'language': 'Python',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Gestión de Dependencias',
    'topic': 'Empaquetado',
    'subtopic': 'wheel',
    'definition': '''
Un archivo `wheel` (`.whl`) es el formato de distribución binaria estándar para paquetes de Python. Es un tipo de "paquete precompilado" que contiene todos los archivos necesarios para instalar un paquete de Python, incluyendo el código Python, datos y metadatos, en un formato que puede ser instalado directamente por `pip` sin necesidad de construir nada.

¿Te estás preguntando por qué son tan beneficiosos?

Pensemos por un momento en la instalación de paquetes con dependencias complejas o que requieren compilación de código C/C++. Sin `wheel`s, cada vez que instalas ese paquete, tu sistema tendría que compilar el código fuente, lo que puede ser lento y propenso a errores de compilación (especialmente si faltan compiladores o librerías). Un `wheel` ya viene precompilado, lo que acelera enormemente la instalación y la hace mucho más fiable, ya que la compilación solo se hizo una vez por el publicador del paquete.

Los `wheel`s son un componente clave del moderno ecosistema de empaquetado de Python, y se recomienda su uso para la distribución de paquetes para asegurar una experiencia de instalación rápida y consistente para los usuarios.
''',
    'code_example': '''
# Para construir un archivo .whl de tu proyecto, necesitas la biblioteca `wheel`:
# pip install wheel

# Si tienes un archivo `setup.py` configurado:
# cd tu_proyecto/
# python setup.py bdist_wheel

# Si usas `pyproject.toml` con `setuptools` como backend de construcción:
# cd tu_proyecto/
# python -m build # Requiere instalar 'build': pip install build

# Si usas `Poetry`:
# cd tu_proyecto/
# poetry build

# Después de ejecutar uno de los comandos anteriores, encontrarás el archivo .whl
# en un directorio llamado `dist/` dentro de tu proyecto.

# Ejemplo de un nombre de archivo wheel:
# mi_paquete_ejemplo-0.1.0-py3-none-any.whl

# Puedes instalar un wheel directamente con pip:
# pip install dist/mi_paquete_ejemplo-0.1.0-py3-none-any.whl
'''
  });
}
