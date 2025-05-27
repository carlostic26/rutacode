import 'package:sqflite_common/sqlite_api.dart';

Future<void> insertMidLevel1Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 1,
    'tittle_level': 'Colecciones Avanzadas',
    'topic': 'Framework de Colecciones',
    'subtopic': 'Iteradores y ListIterator',
    'definition': '''
En Java, los iteradores son herramientas que permiten recorrer colecciones de manera secuencial sin exponer su estructura interna. `Iterator` proporciona métodos para avanzar y eliminar elementos durante la iteración, mientras que `ListIterator` extiende esta funcionalidad permitiendo también la iteración en ambas direcciones y la modificación de elementos.

¿Te preguntas cuándo usar cada uno?

Utiliza `Iterator` cuando necesites recorrer una colección en una sola dirección y posiblemente eliminar elementos durante la iteración. Por otro lado, `ListIterator` es ideal cuando trabajas con listas y requieres mayor flexibilidad, como recorrer hacia atrás o modificar elementos en el camino.

Es importante recordar que modificar una colección directamente mientras se itera sobre ella puede causar excepciones. Por eso, se recomienda utilizar los métodos proporcionados por los iteradores para realizar cambios seguros durante la iteración.
''',
    'code_example': '''
import java.util.*;

public class EjemploIteradores {
    public static void main(String[] args) {
        List<String> nombres = new ArrayList<>(Arrays.asList("Ana", "Luis", "Carlos"));

        // Uso de Iterator
        Iterator<String> iterador = nombres.iterator();
        while (iterador.hasNext()) {
            String nombre = iterador.next();
            if (nombre.equals("Luis")) {
                iterador.remove(); // Elimina "Luis" de la lista
            }
        }

        // Uso de ListIterator
        ListIterator<String> listIterador = nombres.listIterator();
        while (listIterador.hasNext()) {
            String nombre = listIterador.next();
            if (nombre.equals("Ana")) {
                listIterador.set("Andrea"); // Reemplaza "Ana" por "Andrea"
            }
        }

        System.out.println(nombres); // Muestra: [Andrea, Carlos]
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 1,
    'tittle_level': 'Colecciones Avanzadas',
    'topic': 'Framework de Colecciones',
    'subtopic': 'Comparadores (Comparator vs Comparable)',
    'definition': '''
En Java, `Comparable` y `Comparator` son interfaces que permiten definir el orden de los objetos. `Comparable` se implementa en la propia clase del objeto y define un orden natural, mientras que `Comparator` se utiliza para crear diferentes criterios de ordenación sin modificar la clase original.

¿Te preguntas cuál deberías usar?

Si tienes control sobre la clase y existe un orden lógico único (como ordenar personas por DNI), implementa `Comparable`. Si necesitas múltiples formas de ordenar (por nombre, edad, etc.) o no puedes modificar la clase original, utiliza `Comparator`.

Ambas interfaces son fundamentales para ordenar colecciones y trabajar con estructuras que requieren un orden específico.
''',
    'code_example': '''
import java.util.*;

// Implementación de Comparable
class Persona implements Comparable<Persona> {
    String nombre;
    int edad;

    Persona(String nombre, int edad) {
        this.nombre = nombre;
        this.edad = edad;
    }

    @Override
    public int compareTo(Persona otra) {
        return this.edad - otra.edad; // Ordena por edad ascendente
    }

    @Override
    public String toString() {
        return nombre + " (" + edad + ")";
    }
}

// Implementación de Comparator
class ComparadorPorNombre implements Comparator<Persona> {
    @Override
    public int compare(Persona p1, Persona p2) {
        return p1.nombre.compareTo(p2.nombre); // Ordena por nombre alfabéticamente
    }
}

public class EjemploComparadores {
    public static void main(String[] args) {
        List<Persona> personas = Arrays.asList(
            new Persona("Carlos", 30),
            new Persona("Ana", 25),
            new Persona("Luis", 28)
        );

        Collections.sort(personas); // Usa Comparable (edad)
        System.out.println("Orden por edad: " + personas);

        Collections.sort(personas, new ComparadorPorNombre()); // Usa Comparator (nombre)
        System.out.println("Orden por nombre: " + personas);
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 1,
    'tittle_level': 'Colecciones Avanzadas',
    'topic': 'Framework de Colecciones',
    'subtopic': 'Colecciones inmutables',
    'definition': '''
Las colecciones inmutables en Java son aquellas que no pueden ser modificadas después de su creación. Esto significa que no puedes agregar, eliminar ni cambiar elementos en ellas.

¿Te preguntas por qué usar colecciones inmutables?

Son útiles cuando necesitas garantizar que una colección no sea alterada accidentalmente, lo que es especialmente importante en entornos concurrentes o al compartir datos entre diferentes partes de una aplicación. Además, pueden mejorar la seguridad y facilitar el razonamiento sobre el código.

Java proporciona métodos como `Collections.unmodifiableList()` para crear vistas inmutables de colecciones existentes. A partir de Java 9, también puedes usar métodos como `List.of()` para crear colecciones inmutables de manera más concisa.
''',
    'code_example': '''
import java.util.*;

public class EjemploColeccionesInmutables {
    public static void main(String[] args) {
        List<String> listaMutable = new ArrayList<>();
        listaMutable.add("Elemento1");
        listaMutable.add("Elemento2");

        // Crear una vista inmutable de la lista
        List<String> listaInmutable = Collections.unmodifiableList(listaMutable);

        // Intentar modificar la lista inmutable lanzará una excepción
        try {
            listaInmutable.add("Elemento3");
        } catch (UnsupportedOperationException e) {
            System.out.println("No se puede modificar una colección inmutable.");
        }

        // A partir de Java 9
        List<String> listaInmutableJava9 = List.of("A", "B", "C");
        System.out.println("Lista inmutable: " + listaInmutableJava9);
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 1,
    'tittle_level': 'Colecciones Avanzadas',
    'topic': 'Framework de Colecciones',
    'subtopic': 'Métodos utilitarios (Collections, Arrays)',
    'definition': '''
Las clases `Collections` y `Arrays` en Java proporcionan métodos estáticos que facilitan operaciones comunes en colecciones y arreglos, como ordenar, buscar, llenar, copiar y convertir.

¿Te preguntas cómo pueden ayudarte?

Por ejemplo, puedes usar `Collections.sort()` para ordenar una lista, `Collections.shuffle()` para mezclar elementos aleatoriamente, o `Arrays.asList()` para convertir un arreglo en una lista. Estos métodos simplifican muchas tareas cotidianas y mejoran la legibilidad del código.

Es importante familiarizarse con estos métodos para escribir código más eficiente y limpio.
''',
    'code_example': '''
import java.util.*;

public class EjemploMetodosUtilitarios {
    public static void main(String[] args) {
        List<Integer> numeros = Arrays.asList(5, 3, 8, 1, 9);

        // Ordenar la lista
        Collections.sort(numeros);
        System.out.println("Lista ordenada: " + numeros);

        // Mezclar la lista
        Collections.shuffle(numeros);
        System.out.println("Lista mezclada: " + numeros);

        // Buscar un elemento (la lista debe estar ordenada)
        Collections.sort(numeros);
        int indice = Collections.binarySearch(numeros, 5);
        System.out.println("Índice del número 5: " + indice);

        // Llenar la lista con un valor específico
        Collections.fill(numeros, 0);
        System.out.println("Lista después de fill: " + numeros);
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 1,
    'tittle_level': 'Colecciones Avanzadas',
    'topic': 'Stream API',
    'subtopic': 'Introducción a Streams',
    'definition': '''
Los Streams en Java son una forma moderna de procesar colecciones de datos de manera declarativa y funcional. Introducidos en Java 8, permiten realizar operaciones como filtrado, transformación y reducción de datos de forma más concisa y legible.

¿Te preguntas por qué deberías usar Streams?

Imagina que tienes una lista de objetos y necesitas realizar múltiples operaciones sobre ellos, como filtrarlos, transformarlos y luego recolectarlos en una nueva lista. Con Streams, puedes encadenar estas operaciones de manera fluida, evitando bucles explícitos y mejorando la claridad del código.

Es importante destacar que los Streams no almacenan datos; son una abstracción que permite procesar datos de forma secuencial o paralela. Además, son perezosos, lo que significa que las operaciones intermedias no se ejecutan hasta que se invoca una operación terminal.
''',
    'code_example': '''
import java.util.*;
import java.util.stream.*;

public class EjemploStream {
    public static void main(String[] args) {
        List<String> nombres = Arrays.asList("Ana", "Luis", "Carlos", "Lucía");

        // Usando Stream para filtrar nombres que empiezan con 'L'
        List<String> nombresConL = nombres.stream()
                                          .filter(nombre -> nombre.startsWith("L"))
                                          .collect(Collectors.toList());

        System.out.println(nombresConL); // Muestra: [Luis, Lucía]
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 1,
    'tittle_level': 'Colecciones Avanzadas',
    'topic': 'Stream API',
    'subtopic': 'Operaciones intermedias (filter, map, sorted)',
    'definition': '''
Las operaciones intermedias en Streams son aquellas que transforman un Stream en otro. Algunas de las más comunes son:

- `filter`: Filtra elementos según una condición.
- `map`: Transforma cada elemento del Stream.
- `sorted`: Ordena los elementos del Stream.

¿Te preguntas cómo se combinan estas operaciones?

Puedes encadenarlas para crear pipelines de procesamiento de datos. Por ejemplo, puedes filtrar una lista de números para obtener solo los pares, luego multiplicarlos por 2 y finalmente ordenarlos.

Es importante recordar que estas operaciones son perezosas; no se ejecutan hasta que se invoca una operación terminal.
''',
    'code_example': '''
import java.util.*;
import java.util.stream.*;

public class OperacionesIntermedias {
    public static void main(String[] args) {
        List<Integer> numeros = Arrays.asList(5, 2, 8, 3, 1, 4);

        List<Integer> resultado = numeros.stream()
                                         .filter(n -> n % 2 == 0) // Filtra números pares
                                         .map(n -> n * 2)         // Multiplica por 2
                                         .sorted()                // Ordena
                                         .collect(Collectors.toList());

        System.out.println(resultado); // Muestra: [4, 8, 16]
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 1,
    'tittle_level': 'Colecciones Avanzadas',
    'topic': 'Stream API',
    'subtopic': 'Operaciones terminales (collect, forEach, reduce)',
    'definition': '''
Las operaciones terminales en Streams son aquellas que producen un resultado o efecto secundario y terminan el pipeline de procesamiento. Algunas de las más comunes son:

- `collect`: Recolecta los elementos del Stream en una colección.
- `forEach`: Realiza una acción para cada elemento del Stream.
- `reduce`: Reduce los elementos del Stream a un único valor.

¿Te preguntas cuándo usar cada una?

Usa `collect` cuando necesites obtener una colección con los resultados. `forEach` es útil para realizar acciones como imprimir elementos. `reduce` es ideal para calcular valores agregados, como sumas o concatenaciones.

Recuerda que una vez que se invoca una operación terminal, el Stream no puede ser reutilizado.
''',
    'code_example': '''
import java.util.*;
import java.util.stream.*;

public class OperacionesTerminales {
    public static void main(String[] args) {
        List<String> palabras = Arrays.asList("Hola", "Mundo", "Java");

        // collect: Recolecta en una lista
        List<String> lista = palabras.stream()
                                     .collect(Collectors.toList());
        System.out.println(lista); // Muestra: [Hola, Mundo, Java]

        // forEach: Imprime cada palabra
        palabras.stream()
                .forEach(palabra -> System.out.println(palabra));

        // reduce: Concatenación de palabras
        String concatenado = palabras.stream()
                                     .reduce("", (a, b) -> a + b);
        System.out.println(concatenado); // Muestra: HolaMundoJava
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 1,
    'tittle_level': 'Colecciones Avanzadas',
    'topic': 'Stream API',
    'subtopic': 'Parallel streams',
    'definition': '''
Los Parallel Streams en Java permiten procesar elementos de una colección en paralelo, aprovechando múltiples núcleos del procesador para mejorar el rendimiento en operaciones intensivas.

¿Te preguntas cuándo deberías usarlos?

Son ideales cuando trabajas con grandes volúmenes de datos y operaciones que pueden ejecutarse independientemente. Sin embargo, no siempre garantizan mejoras en el rendimiento, especialmente si las operaciones son simples o el volumen de datos es pequeño.

Es importante tener en cuenta que el uso de Parallel Streams puede complicar la depuración y el mantenimiento del código, por lo que deben usarse con precaución.
''',
    'code_example': '''
import java.util.*;
import java.util.stream.*;

public class EjemploParallelStream {
    public static void main(String[] args) {
        List<Integer> numeros = IntStream.rangeClosed(1, 1000000)
                                         .boxed()
                                         .collect(Collectors.toList());

        // Suma secuencial
        long inicioSecuencial = System.currentTimeMillis();
        int sumaSecuencial = numeros.stream()
                                    .mapToInt(Integer::intValue)
                                    .sum();
        long finSecuencial = System.currentTimeMillis();
        System.out.println("Suma secuencial: " + sumaSecuencial + " en " + (finSecuencial - inicioSecuencial) + " ms");

        // Suma paralela
        long inicioParalelo = System.currentTimeMillis();
        int sumaParalela = numeros.parallelStream()
                                  .mapToInt(Integer::intValue)
                                  .sum();
        long finParalelo = System.currentTimeMillis();
        System.out.println("Suma paralela: " + sumaParalela + " en " + (finParalelo - inicioParalelo) + " ms");
    }
}
'''
  });
}

Future<void> insertMidLevel2Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 2,
    'tittle_level': 'Concurrencia',
    'topic': 'Threads Básicos',
    'subtopic': 'Creación de threads (extends Thread vs implements Runnable)',
    'definition': '''
En Java, hay dos formas principales de crear hilos: extendiendo la clase Thread o implementando la interfaz Runnable. Ambas permiten ejecutar código en paralelo, pero tienen diferencias clave en diseño y flexibilidad.

¿Te preguntas cuál deberías usar?

Si extiendes la clase Thread, tu clase no podrá heredar de otra, lo que limita la reutilización. En cambio, al implementar Runnable, puedes heredar de otra clase y separar la lógica del hilo de su ejecución. Además, Runnable es más adecuado cuando deseas compartir la misma instancia entre varios hilos.

En resumen, implementar Runnable es generalmente más flexible y se alinea mejor con las buenas prácticas de programación orientada a objetos.
''',
    'code_example': '''
// Implementando Runnable
class MiRunnable implements Runnable {
    public void run() {
        System.out.println("Ejecutando hilo con Runnable");
    }
}

public class EjemploRunnable {
    public static void main(String[] args) {
        Thread hilo = new Thread(new MiRunnable());
        hilo.start();
    }
}

// Extendiendo Thread
class MiThread extends Thread {
    public void run() {
        System.out.println("Ejecutando hilo extendiendo Thread");
    }
}

public class EjemploThread {
    public static void main(String[] args) {
        MiThread hilo = new MiThread();
        hilo.start();
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 2,
    'tittle_level': 'Concurrencia',
    'topic': 'Threads Básicos',
    'subtopic': 'Estados de un thread',
    'definition': '''
Un hilo en Java puede estar en diferentes estados durante su ciclo de vida. Comprender estos estados es esencial para manejar la concurrencia de manera efectiva.

¿Te preguntas cuáles son estos estados?

1. **NEW**: El hilo ha sido creado pero aún no ha comenzado.
2. **RUNNABLE**: El hilo está listo para ejecutarse y esperando ser asignado a un procesador.
3. **BLOCKED**: El hilo está esperando para adquirir un bloqueo para entrar en una sección crítica.
4. **WAITING**: El hilo espera indefinidamente hasta que otro hilo lo notifique.
5. **TIMED_WAITING**: El hilo espera por un tiempo específico.
6. **TERMINATED**: El hilo ha finalizado su ejecución.

Estos estados ayudan a gestionar y sincronizar hilos en aplicaciones multihilo.
''',
    'code_example': '''
public class EstadosHilo implements Runnable {
    public void run() {
        System.out.println("Estado del hilo: " + Thread.currentThread().getState());
    }

    public static void main(String[] args) throws InterruptedException {
        Thread hilo = new Thread(new EstadosHilo());

        System.out.println("Estado después de crear: " + hilo.getState()); // NEW
        hilo.start();
        System.out.println("Estado después de iniciar: " + hilo.getState()); // RUNNABLE

        hilo.join();
        System.out.println("Estado después de terminar: " + hilo.getState()); // TERMINATED
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 2,
    'tittle_level': 'Concurrencia',
    'topic': 'Threads Básicos',
    'subtopic': 'Métodos de Thread (start, run, sleep, join)',
    'definition': '''
La clase Thread en Java proporciona varios métodos para controlar la ejecución de hilos. Entre los más importantes se encuentran:

- **start()**: Inicia la ejecución del hilo, llamando internamente al método run().
- **run()**: Contiene el código que se ejecutará en el hilo.
- **sleep(ms)**: Pausa el hilo actual durante el tiempo especificado en milisegundos.
- **join()**: Hace que el hilo actual espere hasta que otro hilo complete su ejecución.

¿Te preguntas cómo y cuándo usar estos métodos?

- Usa **start()** para comenzar un hilo; no llames directamente a run(), ya que eso no iniciará un nuevo hilo.
- **sleep()** es útil para simular retardos o esperar sin bloquear otros hilos.
- **join()** es esencial cuando un hilo necesita esperar a que otro termine antes de continuar.

Estos métodos son fundamentales para la coordinación y sincronización en aplicaciones multihilo.
''',
    'code_example': '''
public class MetodosThread {
    public static void main(String[] args) throws InterruptedException {
        Thread hilo = new Thread(() -> {
            System.out.println("Hilo iniciado");
            try {
                Thread.sleep(1000); // Pausa de 1 segundo
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.out.println("Hilo finalizado");
        });

        hilo.start(); // Inicia el hilo
        hilo.join();  // Espera a que el hilo termine
        System.out.println("Hilo principal finalizado");
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 2,
    'tittle_level': 'Concurrencia',
    'topic': 'Sincronización',
    'subtopic': 'Problemas de concurrencia (race conditions)',
    'definition': '''
Cuando múltiples hilos acceden y modifican una variable compartida sin una adecuada sincronización, pueden surgir resultados inesperados. Este fenómeno se conoce como "race condition" o condición de carrera.

¿Te preguntas por qué esto es un problema?

Imagina que dos hilos intentan incrementar el mismo contador simultáneamente. Sin sincronización, ambos podrían leer el mismo valor inicial, incrementarlo y escribir el resultado, perdiendo una de las actualizaciones. Esto puede llevar a errores difíciles de detectar y reproducir.

Para evitar estas situaciones, es esencial utilizar mecanismos de sincronización que controlen el acceso concurrente a los recursos compartidos.
''',
    'code_example': '''
public class ContadorCompartido {
    private int contador = 0;

    public void incrementar() {
        contador++;
    }

    public int obtenerContador() {
        return contador;
    }

    public static void main(String[] args) throws InterruptedException {
        ContadorCompartido contador = new ContadorCompartido();

        Thread hilo1 = new Thread(() -> {
            for (int i = 0; i < 1000; i++) {
                contador.incrementar();
            }
        });

        Thread hilo2 = new Thread(() -> {
            for (int i = 0; i < 1000; i++) {
                contador.incrementar();
            }
        });

        hilo1.start();
        hilo2.start();
        hilo1.join();
        hilo2.join();

        System.out.println("Valor final del contador: " + contador.obtenerContador());
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 2,
    'tittle_level': 'Concurrencia',
    'topic': 'Sincronización',
    'subtopic': 'synchronized (métodos y bloques)',
    'definition': '''
La palabra clave `synchronized` en Java se utiliza para controlar el acceso a bloques de código o métodos que pueden ser ejecutados por múltiples hilos, asegurando que solo un hilo pueda ejecutarlos a la vez.

¿Te preguntas cuándo usar métodos sincronizados o bloques sincronizados?

- **Métodos sincronizados**: Se utilizan cuando se desea sincronizar todo el método. Es una forma sencilla de asegurar que solo un hilo pueda ejecutar el método a la vez.

- **Bloques sincronizados**: Ofrecen un control más fino, permitiendo sincronizar solo una parte del método. Esto puede mejorar el rendimiento al reducir el tiempo que un hilo mantiene el bloqueo.

Ambos enfoques ayudan a prevenir condiciones de carrera y garantizar la consistencia de los datos compartidos.
''',
    'code_example': '''
public class ContadorSincronizado {
    private int contador = 0;

    // Método sincronizado
    public synchronized void incrementar() {
        contador++;
    }

    // Bloque sincronizado
    public void incrementarConBloque() {
        synchronized (this) {
            contador++;
        }
    }

    public int obtenerContador() {
        return contador;
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 2,
    'tittle_level': 'Concurrencia',
    'topic': 'Sincronización',
    'subtopic': 'wait(), notify(), notifyAll()',
    'definition': '''
Los métodos `wait()`, `notify()` y `notifyAll()` en Java se utilizan para la comunicación entre hilos que comparten un recurso común. Permiten que los hilos esperen y se notifiquen entre sí sobre cambios en el estado del recurso compartido.

¿Te preguntas cómo funcionan estos métodos?

- **wait()**: Hace que el hilo actual espere hasta que otro hilo invoque `notify()` o `notifyAll()` en el mismo objeto.

- **notify()**: Despierta un solo hilo que está esperando en el objeto.

- **notifyAll()**: Despierta todos los hilos que están esperando en el objeto.

Estos métodos deben ser llamados dentro de bloques sincronizados para evitar inconsistencias y garantizar la correcta coordinación entre hilos.
''',
    'code_example': '''
public class ProductorConsumidor {
    private static final int LIMITE = 5;
    private final List<Integer> buffer = new ArrayList<>();

    public void producir() throws InterruptedException {
        synchronized (this) {
            while (buffer.size() == LIMITE) {
                wait();
            }
            buffer.add(1);
            System.out.println("Producido: " + buffer.size());
            notifyAll();
        }
    }

    public void consumir() throws InterruptedException {
        synchronized (this) {
            while (buffer.isEmpty()) {
                wait();
            }
            buffer.remove(buffer.size() - 1);
            System.out.println("Consumido: " + buffer.size());
            notifyAll();
        }
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 2,
    'tittle_level': 'Concurrencia',
    'topic': 'Sincronización',
    'subtopic': 'volatile keyword',
    'definition': '''
La palabra clave `volatile` en Java se utiliza para indicar que una variable puede ser modificada por múltiples hilos y que su valor siempre debe ser leído desde la memoria principal, no desde una caché de hilo.

¿Te preguntas cuándo usar `volatile`?

Es útil cuando se necesita asegurar la visibilidad de los cambios de una variable entre hilos sin utilizar sincronización completa. Sin embargo, no garantiza la atomicidad de las operaciones, por lo que no es adecuada para operaciones compuestas como incrementos.

En resumen, `volatile` es una herramienta para asegurar la visibilidad de los cambios en variables compartidas entre hilos.
''',
    'code_example': '''
public class VolatileEjemplo {
    private static volatile boolean bandera = false;

    public static void main(String[] args) throws InterruptedException {
        Thread hilo1 = new Thread(() -> {
            while (!bandera) {
                // Espera activa
            }
            System.out.println("Bandera detectada como verdadera.");
        });

        Thread hilo2 = new Thread(() -> {
            try {
                Thread.sleep(1000);
                bandera = true;
                System.out.println("Bandera establecida en verdadera.");
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        });

        hilo1.start();
        hilo2.start();
        hilo1.join();
        hilo2.join();
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 2,
    'tittle_level': 'Concurrencia',
    'topic': 'Concurrencia Moderna',
    'subtopic': 'ExecutorService',
    'definition': '''
`ExecutorService` es una interfaz en Java que facilita la ejecución de tareas de manera asincrónica utilizando un pool de hilos. Proporciona métodos para gestionar y controlar la ejecución de tareas, permitiendo una mejor utilización de los recursos del sistema.

¿Te preguntas cómo utilizar `ExecutorService`?

Puedes crear un `ExecutorService` utilizando las fábricas proporcionadas por la clase `Executors`, como `newFixedThreadPool`, `newCachedThreadPool`, entre otras. Una vez creado, puedes enviar tareas para su ejecución mediante los métodos `execute` o `submit`. Es importante cerrar el `ExecutorService` al finalizar, utilizando el método `shutdown` para liberar los recursos.
''',
    'code_example': '''
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class EjemploExecutorService {
    public static void main(String[] args) {
        ExecutorService executor = Executors.newFixedThreadPool(2);

        executor.execute(() -> {
            System.out.println("Tarea 1 ejecutada por: " + Thread.currentThread().getName());
        });

        executor.execute(() -> {
            System.out.println("Tarea 2 ejecutada por: " + Thread.currentThread().getName());
        });

        executor.shutdown();
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 2,
    'tittle_level': 'Concurrencia',
    'topic': 'Concurrencia Moderna',
    'subtopic': 'Callable y Future',
    'definition': '''
`Callable` es una interfaz similar a `Runnable`, pero permite que la tarea devuelva un resultado y lance excepciones. Al enviar una tarea `Callable` a un `ExecutorService`, se obtiene un objeto `Future` que representa el resultado pendiente de la tarea.

¿Te preguntas cómo obtener el resultado de una tarea asincrónica?

Puedes utilizar el método `get()` del objeto `Future` para bloquear el hilo actual hasta que la tarea se complete y obtener su resultado. También puedes verificar si la tarea ha finalizado utilizando el método `isDone()`.
''',
    'code_example': '''
import java.util.concurrent.*;

public class EjemploCallableFuture {
    public static void main(String[] args) throws Exception {
        ExecutorService executor = Executors.newSingleThreadExecutor();

        Callable<String> tarea = () -> {
            Thread.sleep(1000);
            return "Resultado de la tarea";
        };

        Future<String> futuro = executor.submit(tarea);

        System.out.println("¿La tarea ha terminado? " + futuro.isDone());

        String resultado = futuro.get(); // Espera hasta que la tarea se complete

        System.out.println("¿La tarea ha terminado? " + futuro.isDone());
        System.out.println("Resultado: " + resultado);

        executor.shutdown();
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 2,
    'tittle_level': 'Concurrencia',
    'topic': 'Concurrencia Moderna',
    'subtopic':
        'Colecciones concurrentes (ConcurrentHashMap, CopyOnWriteArrayList)',
    'definition': '''
Java proporciona colecciones concurrentes que son seguras para su uso en entornos multihilo. Dos de las más comunes son:

- **ConcurrentHashMap**: Una implementación de mapa que permite operaciones concurrentes de lectura y escritura sin necesidad de sincronización explícita.

- **CopyOnWriteArrayList**: Una lista que crea una copia de la matriz subyacente en cada operación de escritura, lo que la hace adecuada para escenarios con muchas lecturas y pocas escrituras.

¿Te preguntas cuándo utilizar estas colecciones?

Utiliza `ConcurrentHashMap` cuando múltiples hilos necesiten acceder y modificar un mapa simultáneamente. `CopyOnWriteArrayList` es ideal cuando las operaciones de lectura son mucho más frecuentes que las de escritura, ya que las escrituras son costosas en términos de rendimiento.
''',
    'code_example': '''
import java.util.concurrent.*;
import java.util.*;

public class EjemploColeccionesConcurrentes {
    public static void main(String[] args) {
        ConcurrentHashMap<String, Integer> mapa = new ConcurrentHashMap<>();
        mapa.put("uno", 1);
        mapa.put("dos", 2);
        System.out.println("ConcurrentHashMap: " + mapa);

        CopyOnWriteArrayList<String> lista = new CopyOnWriteArrayList<>();
        lista.add("A");
        lista.add("B");
        System.out.println("CopyOnWriteArrayList: " + lista);
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 2,
    'tittle_level': 'Concurrencia',
    'topic': 'Concurrencia Moderna',
    'subtopic': 'Locks (ReentrantLock)',
    'definition': '''
`ReentrantLock` es una implementación de la interfaz `Lock` que proporciona un mecanismo de bloqueo más flexible que las sincronizaciones tradicionales (`synchronized`). Permite características avanzadas como la capacidad de interrumpir hilos que esperan por el bloqueo, intentar adquirir el bloqueo sin esperar indefinidamente y más.

¿Te preguntas cómo utilizar `ReentrantLock`?

Puedes crear una instancia de `ReentrantLock` y utilizar sus métodos `lock()` y `unlock()` para controlar el acceso a secciones críticas de código. Es importante asegurarse de liberar el bloqueo en un bloque `finally` para evitar bloqueos permanentes.
''',
    'code_example': '''
import java.util.concurrent.locks.ReentrantLock;

public class EjemploReentrantLock {
    private final ReentrantLock lock = new ReentrantLock();
    private int contador = 0;

    public void incrementar() {
        lock.lock();
        try {
            contador++;
        } finally {
            lock.unlock();
        }
    }

    public int obtenerContador() {
        return contador;
    }

    public static void main(String[] args) {
        EjemploReentrantLock ejemplo = new EjemploReentrantLock();
        ejemplo.incrementar();
        System.out.println("Contador: " + ejemplo.obtenerContador());
    }
}
'''
  });
}

Future<void> insertMidLevel3Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 3,
    'tittle_level': 'Java Moderno (8+)',
    'topic': 'Lambdas y Functional Interfaces',
    'subtopic': 'Expresiones lambda',
    'definition': '''
Las expresiones lambda, introducidas en Java 8, permiten representar funciones anónimas de manera concisa. Estas expresiones facilitan la implementación de interfaces funcionales, mejorando la legibilidad y reduciendo el código boilerplate.

¿Te preguntas cómo se estructura una expresión lambda?

La sintaxis básica es:

```java
(parámetros) -> expresión
Por ejemplo:

java
Copiar
Editar
(int x, int y) -> x + y
Esta expresión lambda toma dos enteros y devuelve su suma. Las lambdas son especialmente útiles en contextos como la programación funcional y el procesamiento de colecciones.
''',
    'code_example': '''
import java.util.Arrays;
import java.util.List;

public class EjemploLambda {
public static void main(String[] args) {
List<String> nombres = Arrays.asList("Ana", "Luis", "Pedro");

pgsql
Copiar
Editar
    nombres.forEach(nombre -> System.out.println("Hola, " + nombre));
}
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 3,
    'tittle_level': 'Java Moderno (8+)',
    'topic': 'Lambdas y Functional Interfaces',
    'subtopic':
        'Interfaces funcionales (Supplier, Consumer, Function, Predicate)',
    'definition': '''
Las interfaces funcionales son interfaces que contienen un único método abstracto. Java 8 introdujo varias interfaces funcionales predefinidas en el paquete `java.util.function`, facilitando la programación funcional.

- **Supplier<T>**: No recibe argumentos y devuelve un resultado de tipo T.
- **Consumer<T>**: Recibe un argumento de tipo T y no devuelve resultado.
- **Function<T, R>**: Recibe un argumento de tipo T y devuelve un resultado de tipo R.
- **Predicate<T>**: Recibe un argumento de tipo T y devuelve un valor booleano.

Estas interfaces se utilizan comúnmente en operaciones de streams y procesamiento de datos.
''',
    'code_example': '''
import java.util.function.*;

public class EjemploInterfacesFuncionales {
    public static void main(String[] args) {
        Supplier<String> proveedor = () -> "Hola desde Supplier";
        System.out.println(proveedor.get());

        Consumer<String> consumidor = mensaje -> System.out.println("Mensaje: " + mensaje);
        consumidor.accept("Hola desde Consumer");

        Function<Integer, String> funcion = numero -> "Número: " + numero;
        System.out.println(funcion.apply(10));

        Predicate<String> predicado = texto -> texto.startsWith("A");
        System.out.println("¿Empieza con A? " + predicado.test("Ana"));
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 3,
    'tittle_level': 'Java Moderno (8+)',
    'topic': 'Lambdas y Functional Interfaces',
    'subtopic': 'Method references',
    'definition': '''
Las referencias a métodos (`method references`) son una forma concisa de referenciar métodos existentes sin ejecutarlos. Se utilizan como una alternativa más legible a las expresiones lambda cuando solo se necesita llamar a un método.

Existen cuatro tipos principales:

1. **Referencia a un método estático**: `Clase::métodoEstatico`
2. **Referencia a un método de instancia de un objeto específico**: `objeto::métodoInstancia`
3. **Referencia a un método de instancia de un objeto arbitrario de un tipo específico**: `Tipo::métodoInstancia`
4. **Referencia a un constructor**: `Clase::new`

Estas referencias mejoran la claridad del código y se integran perfectamente con las interfaces funcionales.
''',
    'code_example': '''
import java.util.Arrays;
import java.util.List;

public class EjemploMethodReference {
    public static void imprimir(String mensaje) {
        System.out.println(mensaje);
    }

    public static void main(String[] args) {
        List<String> mensajes = Arrays.asList("Hola", "Mundo", "Java");

        // Usando expresión lambda
        mensajes.forEach(m -> imprimir(m));

        // Usando referencia a método
        mensajes.forEach(EjemploMethodReference::imprimir);
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 3,
    'tittle_level': 'Java Moderno (8+)',
    'topic': 'APIs Avanzadas',
    'subtopic': 'Optional',
    'definition': '''
La clase `Optional<T>` en Java, introducida en Java 8, es un contenedor que puede o no contener un valor no nulo. Su principal objetivo es evitar el uso excesivo de comprobaciones de nulidad y prevenir excepciones `NullPointerException`.

¿Te preguntas cómo utilizar `Optional`?

Puedes crear instancias de `Optional` utilizando métodos como `Optional.of()`, `Optional.ofNullable()` y `Optional.empty()`. Para acceder al valor contenido, puedes usar métodos como `get()`, `orElse()`, `orElseGet()` y `ifPresent()`. Es importante manejar adecuadamente la ausencia de valor para evitar excepciones inesperadas.
''',
    'code_example': '''
import java.util.Optional;

public class EjemploOptional {
    public static void main(String[] args) {
        Optional<String> nombre = Optional.of("Juan");

        nombre.ifPresent(n -> System.out.println("Nombre: " + n));

        String valor = nombre.orElse("Valor por defecto");
        System.out.println("Valor: " + valor);
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 3,
    'tittle_level': 'Java Moderno (8+)',
    'topic': 'APIs Avanzadas',
    'subtopic': 'Nueva API de Date/Time (LocalDate, LocalTime, etc.)',
    'definition': '''
Java 8 introdujo una nueva API de fecha y hora en el paquete `java.time`, que proporciona clases inmutables y seguras para manejar fechas y horas. Algunas de las clases principales incluyen:

- **LocalDate**: Representa una fecha sin zona horaria, como 2025-05-16.
- **LocalTime**: Representa una hora sin zona horaria, como 10:15:30.
- **LocalDateTime**: Combina fecha y hora sin zona horaria.
- **ZonedDateTime**: Representa fecha y hora con zona horaria.

¿Te preguntas cómo utilizar estas clases?

Puedes crear instancias utilizando métodos como `now()` para obtener la fecha/hora actual o `of()` para especificar valores. Estas clases ofrecen métodos para manipular fechas y horas de manera fluida y segura.
''',
    'code_example': '''
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.LocalDateTime;

public class EjemploDateTime {
    public static void main(String[] args) {
        LocalDate fecha = LocalDate.now();
        LocalTime hora = LocalTime.now();
        LocalDateTime fechaHora = LocalDateTime.now();

        System.out.println("Fecha actual: " + fecha);
        System.out.println("Hora actual: " + hora);
        System.out.println("Fecha y hora actual: " + fechaHora);
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 3,
    'tittle_level': 'Java Moderno (8+)',
    'topic': 'APIs Avanzadas',
    'subtopic': 'Interfaces con métodos default y static',
    'definition': '''
Desde Java 8, las interfaces pueden contener métodos con implementación utilizando las palabras clave `default` y `static`.

- **Métodos default**: Permiten proporcionar una implementación por defecto que las clases que implementan la interfaz pueden usar o sobrescribir.
- **Métodos static**: Son métodos asociados a la interfaz y no a las instancias, y no pueden ser sobrescritos por las clases que implementan la interfaz.

¿Te preguntas cómo se utilizan estos métodos?

Los métodos default se definen utilizando la palabra clave `default` y pueden ser sobrescritos por las clases que implementan la interfaz. Los métodos static se definen con la palabra clave `static` y se llaman utilizando el nombre de la interfaz.
''',
    'code_example': '''
interface Saludador {
    default void saludar() {
        System.out.println("¡Hola desde la interfaz!");
    }

    static void despedirse() {
        System.out.println("¡Adiós desde la interfaz!");
    }
}

public class EjemploInterface implements Saludador {
    public static void main(String[] args) {
        EjemploInterface ejemplo = new EjemploInterface();
        ejemplo.saludar(); // Llama al método default
        Saludador.despedirse(); // Llama al método static
    }
}
'''
  });
}

Future<void> insertMidLevel4Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 4,
    'tittle_level': 'Bases de Datos',
    'topic': 'JDBC',
    'subtopic': 'Arquitectura JDBC',
    'definition': '''
La arquitectura de JDBC (Java Database Connectivity) permite a las aplicaciones Java interactuar con bases de datos de manera eficiente. Esta arquitectura se basa en una estructura de dos capas:

1. **Capa de Aplicación**: Contiene el código Java que utiliza la API de JDBC para enviar solicitudes a la base de datos.
2. **Capa de Base de Datos**: Incluye el sistema de gestión de bases de datos (DBMS) y el controlador JDBC que traduce las llamadas de la API en comandos específicos del DBMS.

Esta separación facilita la portabilidad y la independencia del proveedor de la base de datos, permitiendo que las aplicaciones Java se conecten a diferentes DBMS con cambios mínimos en el código.
''',
    'code_example': '''
// Ejemplo básico de conexión JDBC
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionJDBC {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/mi_base_de_datos";
        String usuario = "usuario";
        String contraseña = "contraseña";

        try (Connection conexion = DriverManager.getConnection(url, usuario, contraseña)) {
            System.out.println("Conexión exitosa a la base de datos.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 4,
    'tittle_level': 'Bases de Datos',
    'topic': 'JDBC',
    'subtopic': 'DriverManager y DataSource',
    'definition': '''
En JDBC, existen dos formas principales de establecer conexiones con una base de datos:

- **DriverManager**: Es una clase que gestiona un conjunto de controladores JDBC. Se utiliza comúnmente en aplicaciones sencillas para obtener conexiones directamente.

- **DataSource**: Es una interfaz que representa una fuente de datos. Se prefiere en aplicaciones empresariales debido a su capacidad para manejar el agrupamiento de conexiones (connection pooling), transacciones distribuidas y una mejor gestión de recursos.

El uso de `DataSource` proporciona una mayor flexibilidad y escalabilidad en comparación con `DriverManager`.
''',
    'code_example': '''
// Ejemplo de uso de DriverManager
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionConDriverManager {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/mi_base_de_datos";
        String usuario = "usuario";
        String contraseña = "contraseña";

        try (Connection conexion = DriverManager.getConnection(url, usuario, contraseña)) {
            System.out.println("Conexión establecida con DriverManager.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 4,
    'tittle_level': 'Bases de Datos',
    'topic': 'JDBC',
    'subtopic': 'Statement vs PreparedStatement',
    'definition': '''
En JDBC, existen dos interfaces principales para ejecutar sentencias SQL:

- **Statement**: Se utiliza para ejecutar sentencias SQL estáticas sin parámetros. Es adecuado para consultas simples que no se repiten con frecuencia.

- **PreparedStatement**: Se utiliza para ejecutar sentencias SQL parametrizadas. Ofrece ventajas como la reutilización de consultas precompiladas, lo que mejora el rendimiento, y una mayor seguridad contra ataques de inyección SQL.

El uso de `PreparedStatement` es generalmente preferido debido a su eficiencia y seguridad.
''',
    'code_example': '''
// Ejemplo de uso de PreparedStatement
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class EjemploPreparedStatement {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/mi_base_de_datos";
        String usuario = "usuario";
        String contraseña = "contraseña";
        String consulta = "INSERT INTO empleados (nombre, salario) VALUES (?, ?)";

        try (Connection conexion = DriverManager.getConnection(url, usuario, contraseña);
             PreparedStatement pstmt = conexion.prepareStatement(consulta)) {

            pstmt.setString(1, "Carlos");
            pstmt.setDouble(2, 50000.0);
            pstmt.executeUpdate();

            System.out.println("Registro insertado exitosamente.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 4,
    'tittle_level': 'Bases de Datos',
    'topic': 'JDBC',
    'subtopic': 'Transacciones',
    'definition': '''
Una transacción en JDBC es una secuencia de operaciones que se ejecutan como una unidad indivisible. Las transacciones aseguran que todas las operaciones dentro de ella se completen exitosamente; de lo contrario, se revierten para mantener la integridad de los datos.

Por defecto, JDBC opera en modo de confirmación automática (`auto-commit`), lo que significa que cada sentencia SQL se ejecuta y se confirma inmediatamente. Para manejar transacciones manualmente, se debe desactivar este modo y controlar explícitamente las confirmaciones (`commit`) y las reversiones (`rollback`).
''',
    'code_example': '''
// Ejemplo de manejo de transacciones en JDBC
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class ManejoTransacciones {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/mi_base_de_datos";
        String usuario = "usuario";
        String contraseña = "contraseña";

        try (Connection conexion = DriverManager.getConnection(url, usuario, contraseña)) {
            conexion.setAutoCommit(false); // Desactivar auto-commit

            try (Statement stmt = conexion.createStatement()) {
                stmt.executeUpdate("UPDATE cuentas SET saldo = saldo - 1000 WHERE id = 1");
                stmt.executeUpdate("UPDATE cuentas SET saldo = saldo + 1000 WHERE id = 2");

                conexion.commit(); // Confirmar transacción
                System.out.println("Transacción completada exitosamente.");
            } catch (SQLException e) {
                conexion.rollback(); // Revertir transacción en caso de error
                System.out.println("Transacción revertida debido a un error.");
                e.printStackTrace();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 4,
    'tittle_level': 'Bases de Datos',
    'topic': 'ORMs',
    'subtopic': 'Introducción a Hibernate',
    'definition': '''
Hibernate es una herramienta que facilita la interacción entre nuestras aplicaciones Java y las bases de datos. En lugar de escribir consultas SQL para cada operación, Hibernate nos permite trabajar directamente con objetos Java, haciendo que el código sea más limpio y fácil de mantener.

¿Te estás preguntando por qué esto importa?

Bueno, manejar datos con JDBC puede ser tedioso y propenso a errores. Hibernate automatiza muchas de esas tareas repetitivas, como la apertura y cierre de conexiones, y el manejo de transacciones. Además, ofrece características avanzadas como caché de segundo nivel y soporte para herencia entre entidades.

En resumen, Hibernate actúa como un puente entre el mundo orientado a objetos de Java y el mundo relacional de las bases de datos, simplificando el desarrollo y mantenimiento de aplicaciones.
''',
    'code_example': '''
// Ejemplo básico de configuración de Hibernate
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateEjemplo {
    public static void main(String[] args) {
        // Crear una fábrica de sesiones
        SessionFactory factory = new Configuration()
                                    .configure("hibernate.cfg.xml")
                                    .addAnnotatedClass(Empleado.class)
                                    .buildSessionFactory();

        // Obtener una sesión
        Session session = factory.getCurrentSession();

        try {
            // Crear un nuevo objeto Empleado
            Empleado nuevoEmpleado = new Empleado("Juan", "Pérez", "juan.perez@empresa.com");

            // Iniciar transacción
            session.beginTransaction();

            // Guardar el objeto en la base de datos
            session.save(nuevoEmpleado);

            // Confirmar transacción
            session.getTransaction().commit();
        } finally {
            // Cerrar la fábrica de sesiones
            factory.close();
        }
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 4,
    'tittle_level': 'Bases de Datos',
    'topic': 'ORMs',
    'subtopic': 'EntityManager y JPA',
    'definition': '''
El EntityManager es el corazón de JPA (Java Persistence API). Es la interfaz que nos permite interactuar con la base de datos utilizando objetos Java. Con él, podemos realizar operaciones como persistir, buscar, actualizar y eliminar entidades.

¿Te estás preguntando por qué esto importa?

Porque trabajar directamente con SQL puede ser complejo y propenso a errores. EntityManager nos ofrece una forma más intuitiva y segura de manejar nuestras entidades, respetando el modelo de objetos de Java.

Además, JPA estandariza la forma en que interactuamos con las bases de datos, lo que significa que podemos cambiar de proveedor (como Hibernate o EclipseLink) sin tener que reescribir todo nuestro código.
''',
    'code_example': '''
// Ejemplo de uso de EntityManager con JPA
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JPAManejo {
    public static void main(String[] args) {
        // Crear una fábrica de EntityManager
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("miUnidadPersistencia");

        // Obtener un EntityManager
        EntityManager em = emf.createEntityManager();

        try {
            // Iniciar transacción
            em.getTransaction().begin();

            // Crear un nuevo objeto Empleado
            Empleado empleado = new Empleado("Ana", "Gómez", "ana.gomez@empresa.com");

            // Persistir el objeto en la base de datos
            em.persist(empleado);

            // Confirmar transacción
            em.getTransaction().commit();
        } finally {
            // Cerrar el EntityManager y la fábrica
            em.close();
            emf.close();
        }
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 4,
    'tittle_level': 'Bases de Datos',
    'topic': 'ORMs',
    'subtopic': 'Anotaciones básicas (@Entity, @Table, @Id)',
    'definition': '''
En JPA, las anotaciones son esenciales para mapear nuestras clases Java a las tablas de la base de datos. Las más básicas y comunes son:

- `@Entity`: Indica que la clase es una entidad y será mapeada a una tabla.
- `@Table`: Permite especificar el nombre de la tabla en la base de datos.
- `@Id`: Define el atributo que será la clave primaria de la entidad.

¿Te estás preguntando por qué esto importa?

Porque estas anotaciones nos permiten definir claramente cómo nuestras clases se relacionan con la estructura de la base de datos, facilitando la persistencia y recuperación de datos.
''',
    'code_example': '''
// Ejemplo de entidad con anotaciones básicas
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "empleados")
public class Empleado {
    @Id
    private int id;
    private String nombre;
    private String correo;

    // Constructores, getters y setters
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 4,
    'tittle_level': 'Bases de Datos',
    'topic': 'ORMs',
    'subtopic': 'Consultas JPQL',
    'definition': '''
JPQL (Java Persistence Query Language) es un lenguaje de consultas orientado a objetos que nos permite realizar consultas sobre nuestras entidades JPA. A diferencia de SQL, que trabaja con tablas y columnas, JPQL trabaja con clases y atributos de Java.

¿Te estás preguntando por qué esto importa?

Porque JPQL nos ofrece una forma más natural y coherente de consultar nuestros datos, alineada con el modelo de objetos de Java. Además, al ser independiente del proveedor de base de datos, nuestras consultas son más portables y fáciles de mantener.
''',
    'code_example': '''
// Ejemplo de consulta JPQL
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import java.util.List;

public class ConsultaJPQL {
    public static void main(String[] args) {
        // Crear una fábrica de EntityManager
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("miUnidadPersistencia");

        // Obtener un EntityManager
        EntityManager em = emf.createEntityManager();

        try {
            // Crear una consulta JPQL
            TypedQuery<Empleado> consulta = em.createQuery("SELECT e FROM Empleado e WHERE e.nombre = :nombre", Empleado.class);
            consulta.setParameter("nombre", "Ana");

            // Obtener los resultados
            List<Empleado> resultados = consulta.getResultList();

            // Mostrar los resultados
            for (Empleado e : resultados) {
                System.out.println(e.getNombre() + " - " + e.getCorreo());
            }
        } finally {
            // Cerrar el EntityManager y la fábrica
            em.close();
            emf.close();
        }
    }
}
'''
  });
}

Future<void> insertMidLevel5Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 5,
    'tittle_level': 'Pruebas Avanzadas',
    'topic': 'Pruebas Unitarias',
    'subtopic': 'Mockito (creación de mocks, verificación)',
    'definition': '''
Mockito es una herramienta que nos permite simular el comportamiento de objetos en nuestras pruebas unitarias. En lugar de depender de implementaciones reales, podemos crear "mocks" que imitan el comportamiento de clases o interfaces, lo que facilita el aislamiento de la unidad que estamos probando.

¿Te estás preguntando por qué esto importa?

Porque al simular dependencias, podemos enfocarnos en probar una clase específica sin preocuparnos por el comportamiento de sus colaboradoras. Esto hace que nuestras pruebas sean más rápidas, confiables y fáciles de mantener.

Con Mockito, podemos definir comportamientos esperados utilizando métodos como `when` y `thenReturn`, y luego verificar interacciones con `verify`. Esto nos da un control preciso sobre cómo nuestras clases interactúan con sus dependencias durante las pruebas.
''',
    'code_example': '''
// Ejemplo de uso básico de Mockito
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import static org.mockito.Mockito.*;

class ServicioTest {

    @Test
    void pruebaServicio() {
        // Crear un mock de la dependencia
        Dependencia dependenciaMock = mock(Dependencia.class);

        // Definir comportamiento del mock
        when(dependenciaMock.obtenerDato()).thenReturn("dato simulado");

        // Inyectar el mock en la clase a probar
        Servicio servicio = new Servicio(dependenciaMock);

        // Ejecutar el método a probar
        String resultado = servicio.procesar();

        // Verificar el resultado
        assertEquals("Procesado: dato simulado", resultado);

        // Verificar que el método fue llamado una vez
        verify(dependenciaMock, times(1)).obtenerDato();
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 5,
    'tittle_level': 'Pruebas Avanzadas',
    'topic': 'Pruebas Unitarias',
    'subtopic': 'Inyección de dependencias para testing',
    'definition': '''
La inyección de dependencias es una técnica que nos permite proporcionar las dependencias que una clase necesita desde el exterior, en lugar de que la propia clase las cree. Esto facilita la sustitución de estas dependencias por versiones simuladas o "mocks" durante las pruebas.

¿Te estás preguntando por qué esto importa?

Porque al inyectar dependencias, podemos aislar la unidad que estamos probando y controlar su entorno de ejecución. Esto hace que nuestras pruebas sean más predecibles y nos permite enfocarnos en el comportamiento específico de la clase bajo prueba.

Además, frameworks como Spring facilitan la inyección de dependencias mediante anotaciones como `@Autowired`, lo que simplifica la configuración y mantenimiento de nuestras pruebas.
''',
    'code_example': '''
// Ejemplo de inyección de dependencias para pruebas
import org.junit.jupiter.api.Test;
import static org.mockito.Mockito.*;

class ControladorTest {

    @Test
    void pruebaControlador() {
        // Crear mocks de las dependencias
        Servicio servicioMock = mock(Servicio.class);
        Repositorio repositorioMock = mock(Repositorio.class);

        // Inyectar los mocks en el controlador
        Controlador controlador = new Controlador(servicioMock, repositorioMock);

        // Definir comportamiento de los mocks
        when(servicioMock.calcular()).thenReturn(42);
        when(repositorioMock.obtener()).thenReturn("dato");

        // Ejecutar el método a probar
        String resultado = controlador.ejecutar();

        // Verificar el resultado
        assertEquals("Resultado: 42, Dato: dato", resultado);

        // Verificar interacciones
        verify(servicioMock).calcular();
        verify(repositorioMock).obtener();
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 5,
    'tittle_level': 'Pruebas Avanzadas',
    'topic': 'Pruebas Unitarias',
    'subtopic': 'Pruebas parametrizadas',
    'definition': '''
Las pruebas parametrizadas nos permiten ejecutar el mismo test con diferentes conjuntos de datos, lo que facilita la validación de múltiples escenarios sin duplicar código. En JUnit 5, podemos utilizar anotaciones como `@ParameterizedTest` junto con fuentes de datos como `@ValueSource` o `@CsvSource`.

¿Te estás preguntando por qué esto importa?

Porque al parametrizar nuestras pruebas, podemos cubrir una mayor variedad de casos con menos esfuerzo, mejorando la eficiencia y mantenibilidad de nuestro código de pruebas.

Además, las pruebas parametrizadas nos ayudan a identificar rápidamente cómo se comporta nuestro código con diferentes entradas, lo que es esencial para garantizar su robustez.
''',
    'code_example': '''
// Ejemplo de prueba parametrizada con JUnit 5
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;
import static org.junit.jupiter.api.Assertions.*;

class CalculadoraTest {

    @ParameterizedTest
    @CsvSource({
        "1, 2, 3",
        "2, 3, 5",
        "5, 5, 10"
    })
    void pruebaSuma(int a, int b, int resultadoEsperado) {
        Calculadora calc = new Calculadora();
        assertEquals(resultadoEsperado, calc.sumar(a, b));
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 5,
    'tittle_level': 'Pruebas Avanzadas',
    'topic': 'Pruebas de Integración',
    'subtopic': 'Testcontainers',
    'definition': '''
Testcontainers es una biblioteca súper útil que te permite levantar contenedores Docker dentro de tus pruebas de integración.  Piénsalo como tener la capacidad de crear entornos de prueba completos y aislados con solo unas líneas de código.

¿Te estás preguntando por qué esto es tan genial?  Bueno, las pruebas de integración a menudo requieren dependencias externas, como bases de datos, servidores de mensajería o servicios web.  Configurar y mantener estos entornos puede ser complicado y propenso a errores.  Testcontainers simplifica todo esto al proporcionar contenedores listos para usar para muchas de estas dependencias.

Vamos a ver de que se trata todo esto.  Con Testcontainers, puedes, por ejemplo, levantar una instancia de PostgreSQL en un contenedor Docker para tus pruebas de base de datos, o un servidor Redis para probar tu caché.  Cuando terminan las pruebas, Testcontainers se encarga de detener y eliminar los contenedores, dejando tu sistema limpio.  Esto asegura que tus pruebas sean más confiables, reproducibles y rápidas de configurar.  Además, ¡es una excelente manera de probar tu código en un entorno lo más parecido posible al de producción! 🐳
''',
    'code_example': '''
import org.testcontainers.containers.PostgreSQLContainer;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TestcontainersEjemplo {

    static PostgreSQLContainer<?> postgres = new PostgreSQLContainer<>("postgres:13.3");

    @Test
    void testConexionBaseDeDatos() throws SQLException {
        postgres.start();
        String jdbcUrl = postgres.getJdbcUrl();
        String username = postgres.getUsername();
        String password = postgres.getPassword();

        Connection conn = DriverManager.getConnection(jdbcUrl, username, password);
        ResultSet rs = conn.createStatement().executeQuery("SELECT 1");
        rs.next();
        assertEquals(1, rs.getInt(1));

        postgres.stop();
    }

    // Ejemplo de uso incorrecto: intentar usar el contenedor después de detenerlo
    // @Test
    // void testDespuesDeDetener() {
    //     postgres.stop();
    //     postgres.getJdbcUrl(); // Esto lanzará una excepción
    // }
}
''',
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 5,
    'tittle_level': 'Pruebas Avanzadas',
    'topic': 'Pruebas de Integración',
    'subtopic': 'Pruebas con bases de datos reales',
    'definition': '''
Las pruebas con bases de datos reales implican conectar tu aplicación a una instancia de base de datos real (en contraposición a una base de datos en memoria o simulada) durante las pruebas de integración.  Esto te permite verificar que las interacciones de tu código con la base de datos funcionan correctamente.

¿Te estás preguntando por qué es importante?  Bueno, las bases de datos tienen peculiaridades, como diferentes tipos de datos, SQL dialects y comportamientos de transacciones.  Las bases de datos en memoria pueden simplificar las pruebas, pero a veces no capturan todos los problemas del "mundo real".  Probar con una base de datos real te da mayor confianza en que tu aplicación funcionará como se espera en producción.

Vamos a ver de que se trata todo esto.  Puedes usar una base de datos local, una instancia en un servidor de prueba o incluso una base de datos en la nube para tus pruebas.  La clave es configurar un entorno de prueba consistente y aislado para evitar interferencias con otros desarrolladores o con los datos de producción.  Herramientas como Testcontainers (que vimos antes) facilitan mucho la creación de estos entornos.  ¡Es como darle a tu código un "examen final" en condiciones reales! 🎓
''',
    'code_example': '''
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import javax.sql.DataSource;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class PruebasBaseDeDatosRealesEjemplo {

    private JdbcTemplate jdbcTemplate;

    @BeforeEach
    void setUp() {
        // Configurar la conexión a la base de datos (¡ajusta esto a tu configuración!)
        DataSource dataSource = new DriverManagerDataSource(
                "jdbc:h2:mem:testdb", // Ejemplo con H2 en memoria (puedes usar PostgreSQL, MySQL, etc.)
                "sa",
                ""
        );
        jdbcTemplate = new JdbcTemplate(dataSource);

        // Crear una tabla de ejemplo
        jdbcTemplate.execute("CREATE TABLE IF NOT EXISTS usuarios (id INT PRIMARY KEY, nombre VARCHAR(255))");
        jdbcTemplate.execute("DELETE FROM usuarios"); // Limpiar la tabla antes de cada prueba
    }

    @Test
    void testInsertarYConsultarUsuario() {
        jdbcTemplate.update("INSERT INTO usuarios (id, nombre) VALUES (?, ?)", 1, "Juan");
        String nombre = jdbcTemplate.queryForObject("SELECT nombre FROM usuarios WHERE id = ?", String.class, 1);
        assertEquals("Juan", nombre);
    }

    // Ejemplo de uso incorrecto: no limpiar la base de datos entre pruebas
    // @Test
    // void testOtroUsuarioSinLimpiar() {
    //     // Si la prueba anterior no limpió la tabla, esta prueba podría fallar
    //     String nombre = jdbcTemplate.queryForObject("SELECT nombre FROM usuarios WHERE id = ?", String.class, 1);
    //     assertEquals("OtroNombre", nombre); // ¡Esto podría fallar!
    // }
}
''',
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 5,
    'tittle_level': 'Pruebas Avanzadas',
    'topic': 'Pruebas de Integración',
    'subtopic': 'Spring Test',
    'definition': '''
Spring Test es un módulo del framework Spring que proporciona utilidades para escribir pruebas de integración para aplicaciones Spring.  Simplifica las pruebas de componentes Spring, como controladores, servicios y repositorios, dentro del contexto de Spring.

¿Te estás preguntando cómo ayuda esto?  Bueno, las aplicaciones Spring suelen depender mucho de la inyección de dependencias (DI) y del contexto de Spring.  Spring Test te permite crear un contexto de prueba que simula el contexto real de la aplicación, lo que facilita la prueba de tus componentes de forma aislada pero integrada con Spring.

Vamos a ver de que se trata todo esto.  Spring Test ofrece anotaciones como `@SpringBootTest` para cargar el contexto de Spring Boot, `@WebMvcTest` para probar controladores web y `@DataJpaTest` para probar repositorios JPA.  También proporciona clases de utilidad como `MockMvc` para simular solicitudes HTTP y `TestRestTemplate` para realizar llamadas a servicios REST.  Usar Spring Test te ayuda a escribir pruebas más concisas, legibles y mantenibles para tus aplicaciones Spring.  ¡Es como tener un "laboratorio de pruebas" especializado para tus componentes Spring! 🧪
''',
    'code_example': '''
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;

@WebMvcTest(ControladorEjemplo.class) // Clase del controlador a probar
public class SpringTestEjemplo {

    @Autowired
    private MockMvc mockMvc;

    @Test
    void testEndpointHolaMundo() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/hola")
                .accept(MediaType.TEXT_PLAIN))
                .andExpect(status().isOk())
                .andExpect(content().string("¡Hola, Mundo!"));
    }

    // Ejemplo de uso incorrecto: no cargar el contexto de Spring correctamente
    // @Test
    // void testSinContexto() {
    //     // Esto fallará si no se usa @SpringBootTest o @WebMvcTest
    //     controladorEjemplo.hola();
    // }
}

// Clase del controlador de ejemplo (en el mismo archivo o en otro)
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
class ControladorEjemplo {

    @GetMapping("/hola")
    public String hola() {
        return "¡Hola, Mundo!";
    }
}
''',
  });
}

Future<void> insertMidLevel6Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 6,
    'tittle_level': 'Build Tools y Dependencias',
    'topic': 'Maven',
    'subtopic': 'Estructura de pom.xml',
    'definition': '''
Maven es una herramienta de construcción (build tool) muy popular en el mundo Java, y el archivo `pom.xml` es su "hoja de ruta".  Piensa en él como un archivo de configuración que le dice a Maven todo lo que necesita saber sobre tu proyecto: sus dependencias, cómo construirlo, etc.

¿Te estás preguntando por qué es tan importante este archivo?  Bueno, en proyectos grandes, gestionar las dependencias (las bibliotecas y otros proyectos de los que depende tu proyecto) puede ser un caos.  El `pom.xml` centraliza toda esa información, facilitando la construcción y el mantenimiento del proyecto.

Vamos a ver de que se trata todo esto.  La estructura básica de un `pom.xml` incluye elementos como:

* `<project>`: El elemento raíz.
* `<modelVersion>`: La versión del modelo de Maven (generalmente 4.0.0).
* `<groupId>`: El identificador único de tu proyecto (suele seguir la convención de nombres de dominio invertidos, como `com.miempresa`).
* `<artifactId>`: El nombre del artefacto (tu proyecto).
* `<version>`: La versión de tu proyecto.
* `<dependencies>`: Una lista de las dependencias del proyecto.

Cada dependencia se define con su propio `<groupId>`, `<artifactId>` y `<version>`.  Maven usa esta información para descargar automáticamente las bibliotecas necesarias de un repositorio (como el Maven Central Repository).  ¡Es como tener un mayordomo que se encarga de traer todos los ingredientes que necesitas para tu "receta" de software! 👨‍🍳
''',
    'code_example': '''
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>com.ejemplo</groupId>
    <artifactId>mi-proyecto</artifactId>
    <version>1.0-SNAPSHOT</version>

    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
            <version>2.5.4</version>
        </dependency>
        </dependencies>

    </project>

''',
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 6,
    'tittle_level': 'Build Tools y Dependencias',
    'topic': 'Maven',
    'subtopic': 'Ciclo de vida de Maven',
    'definition': '''
Maven no solo gestiona las dependencias, sino que también define un ciclo de vida para la construcción de tu proyecto.  Este ciclo de vida es una secuencia de fases (o etapas) que se ejecutan en un orden específico.

¿Te estás preguntando por qué necesitamos un ciclo de vida?  Bueno, imagina que cada vez que construyes tu proyecto, tienes que hacer una serie de tareas: compilar el código, ejecutar pruebas, empaquetarlo, instalarlo, etc.  Maven automatiza todo esto siguiendo un ciclo de vida predefinido, asegurando que cada paso se realice de forma consistente.

Vamos a ver de que se trata todo esto.  Algunas de las fases más comunes del ciclo de vida de Maven son:

* `compile`: Compila el código fuente de Java.
* `test`: Ejecuta las pruebas unitarias.
* `package`: Empaqueta el código compilado en un formato distribuible (como un archivo JAR o WAR).
* `install`: Instala el paquete en el repositorio local de Maven.
* `deploy`: Copia el paquete al repositorio remoto para compartirlo con otros desarrolladores.

Para ejecutar una fase, simplemente usas el comando `mvn` seguido del nombre de la fase (por ejemplo, `mvn clean install`).  Maven se encargará de ejecutar todas las fases anteriores en el ciclo de vida.  ¡Es como tener una línea de ensamblaje para tu software, donde cada fase realiza una tarea específica! 🏭
''',
    'code_example': '''
// Compilar el código
// mvn compile

// Ejecutar pruebas
// mvn test

// Empaquetar el proyecto
// mvn package

// Instalar el paquete en el repositorio local
// mvn install

// Limpiar el proyecto (borrar archivos generados) y luego instalarlo
// mvn clean install

// Ejemplo de uso incorrecto:  Intentar ejecutar una fase que no existe
// mvn hacer_magia  // Esto dará error
''',
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 6,
    'tittle_level': 'Build Tools y Dependencias',
    'topic': 'Maven',
    'subtopic': 'Dependencias y scopes',
    'definition': '''
En Maven, las dependencias son las bibliotecas o proyectos externos de los que depende tu proyecto.  Ya vimos cómo se declaran en el `pom.xml`, pero también es importante entender los "scopes" de las dependencias.

¿Te estás preguntando qué son los "scopes"?  Bueno, los scopes definen cuándo se necesita una dependencia.  Por ejemplo, algunas dependencias solo son necesarias durante la compilación, mientras que otras solo son necesarias durante las pruebas.

Vamos a ver de que se trata todo esto.  Los scopes más comunes en Maven son:

* `compile` (por defecto): La dependencia está disponible en todas las fases del ciclo de vida.
* `test`: La dependencia solo se necesita para compilar y ejecutar pruebas.
* `provided`: La dependencia la proporciona el entorno de ejecución (por ejemplo, un servidor web).  No se incluye en el paquete final.
* `runtime`: La dependencia no es necesaria para la compilación, pero sí para la ejecución.
* `system`: Similar a `provided`, pero debes proporcionar explícitamente la ruta al archivo JAR.  Se desaconseja su uso.

Usar los scopes correctamente ayuda a mantener tu proyecto limpio y a evitar conflictos entre dependencias.  Es como organizar tus herramientas en una caja: ¡usas cada una solo cuando la necesitas! 🧰
''',
    'code_example': '''
<dependencies>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-web</artifactId>
        <version>2.5.4</version>
        <scope>compile</scope>  </dependency>
    <dependency>
        <groupId>org.junit.jupiter</groupId>
        <artifactId>junit-jupiter-api</artifactId>
        <version>5.8.0</version>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>javax.servlet</groupId>
        <artifactId>javax.servlet-api</artifactId>
        <version>4.0.1</version>
        <scope>provided</scope>
    </dependency>
</dependencies>

''',
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 6,
    'tittle_level': 'Build Tools y Dependencias',
    'topic': 'Maven',
    'subtopic': 'Plugins comunes',
    'definition': '''
Los plugins de Maven son extensiones que te permiten realizar tareas adicionales durante el ciclo de vida de la construcción.  Pueden generar código, ejecutar informes, copiar archivos, y mucho más.

¿Te estás preguntando por qué son tan útiles?  Bueno, Maven proporciona un marco de trabajo, pero los plugins te dan la flexibilidad de adaptarlo a las necesidades específicas de tu proyecto.  Es como agregarle "accesorios" a tu herramienta para que haga más cosas.

Vamos a ver de que se trata todo esto.  Algunos plugins comunes de Maven son:

* `maven-compiler-plugin`: Compila el código fuente de Java (ya viene configurado por defecto, pero puedes personalizarlo).
* `maven-surefire-plugin`: Ejecuta las pruebas unitarias.
* `maven-jar-plugin`: Crea un archivo JAR (Java Archive) con tu código.
* `maven-war-plugin`: Crea un archivo WAR (Web Application Archive) para aplicaciones web.
* `maven-source-plugin`: Genera un archivo JAR con el código fuente.
* `maven-javadoc-plugin`: Genera la documentación de la API (Javadoc).

Los plugins se configuran en el `pom.xml` dentro del elemento `<build>`.  Puedes especificar qué fases del ciclo de vida deben ejecutar el plugin y configurar sus parámetros.  ¡Los plugins son como los "superpoderes" de Maven, que te permiten automatizar casi cualquier tarea en tu proceso de construcción! 🦸
''',
    'code_example': '''
<build>
    <plugins>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-compiler-plugin</artifactId>
            <version>3.8.1</version>
            <configuration>
                <source>1.8</source>
                <target>1.8</target>
            </configuration>
        </plugin>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-surefire-plugin</artifactId>
            <version>2.22.2</version>
        </plugin>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-jar-plugin</artifactId>
            <version>3.2.0</version>
        </plugin>
    </plugins>
</build>

''',
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 6,
    'tittle_level': 'Build Tools y Dependencias',
    'topic': 'Gradle',
    'subtopic': 'Build.gradle básico',
    'definition': '''
Gradle es otra herramienta de construcción muy popular, especialmente en el mundo de Android, y su archivo de configuración principal es `build.gradle`.  Es similar a `pom.xml` de Maven, pero usa un enfoque diferente: en lugar de XML, usa un lenguaje de dominio específico (DSL) basado en Groovy o Kotlin.

¿Te estás preguntando qué hace este archivo?  Al igual que `pom.xml`, `build.gradle` define las dependencias de tu proyecto, cómo se debe construir y otras configuraciones.  Sin embargo, su sintaxis es más concisa y flexible, lo que permite una mayor personalización.

Vamos a ver de que se trata todo esto.  Un `build.gradle` básico puede incluir elementos como:

* `plugins`:  Especifica los plugins de Gradle que se utilizarán (por ejemplo, el plugin de Java para compilar código Java).
* `repositories`:  Define los repositorios donde Gradle buscará las dependencias (por ejemplo, Maven Central).
* `dependencies`:  Lista las dependencias del proyecto, similar a Maven.
* `tasks`:  Define las tareas que Gradle puede ejecutar (por ejemplo, compilar, ejecutar pruebas, etc.).

Gradle es conocido por su flexibilidad y rendimiento.  Permite una mayor personalización del proceso de construcción y puede ser más rápido que Maven en algunos casos.  ¡Es como tener una herramienta de construcción más moderna y versátil en tu arsenal! 🛠️
''',
    'code_example': '''
// Ejemplo básico de build.gradle (Groovy DSL)
plugins {
    id 'java'
}

repositories {
    mavenCentral()
}

dependencies {
    implementation 'org.springframework.boot:spring-boot-starter-web:2.5.4'
    testImplementation 'org.junit.jupiter:junit-jupiter-api:5.8.0'
}

// Ejemplo incorrecto:  Sintaxis incorrecta en build.gradle
// plugins {
//     java  // ¡Esto no es válido en Groovy!
// }
''',
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 6,
    'tittle_level': 'Build Tools y Dependencias',
    'topic': 'Gradle',
    'subtopic': 'Tasks',
    'definition': '''
En Gradle, una "task" es una unidad de trabajo.  Representa una acción que Gradle puede realizar, como compilar código, ejecutar pruebas, copiar archivos, etc.  Las tasks son los bloques de construcción fundamentales de un build de Gradle.

¿Te estás preguntando cómo se diferencian de las fases de Maven?  Aunque tienen un propósito similar, las tasks de Gradle son más flexibles.  Puedes definir tus propias tasks personalizadas y configurarlas para que dependan de otras tasks, creando un grafo de dependencias.

Vamos a ver de que se trata todo esto.  Gradle ya proporciona muchas tasks predefinidas (como `compileJava`, `test`, `jar`), pero también puedes crear tus propias tasks para realizar tareas específicas de tu proyecto.  Puedes configurar las tasks para que se ejecuten en un orden específico, para que acepten parámetros, etc.

Gradle usa un enfoque de "build-by-convention", lo que significa que proporciona valores predeterminados razonables para muchas configuraciones.  Sin embargo, te da la libertad de anular estas convenciones y personalizar el build según tus necesidades.  ¡Es como tener una herramienta de automatización muy potente y adaptable! ⚙️
''',
    'code_example': '''
// Ejemplo de tasks en build.gradle (Groovy DSL)
tasks.register('saludar') {
    doLast {
        println '¡Hola desde Gradle!'
    }
}

tasks.register('copiarRecursos', Copy) {
    from 'src/main/resources'
    into 'build/recursos'
}

tasks.register('miJar', Jar) {
    manifest {
        attributes 'Mi-Atributo': 'Mi-Valor'
    }
}

// Ejemplo incorrecto:  Intentar acceder a una propiedad de task que no existe
// tasks.miTask.propiedadQueNoExiste  // Esto dará error
''',
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 6,
    'tittle_level': 'Build Tools y Dependencias',
    'topic': 'Gradle',
    'subtopic': 'Gestión de dependencias',
    'definition': '''
Gradle también se encarga de la gestión de dependencias, similar a Maven.  Puedes declarar las bibliotecas y otros proyectos de los que depende tu proyecto en el `build.gradle`.

¿Te estás preguntando cómo se compara con Maven en este aspecto?  Gradle y Maven usan conceptos similares (groupId, artifactId, version), pero Gradle tiene algunas características adicionales que lo hacen más flexible.  Por ejemplo, Gradle admite rangos de versiones y dependencias dinámicas.

Vamos a ver de que se trata todo esto.  En `build.gradle`, las dependencias se declaran dentro del bloque `dependencies`.  Puedes especificar el scope de la dependencia (como `implementation`, `testImplementation`, `runtimeOnly`), similar a los scopes de Maven.

Gradle también utiliza repositorios para buscar las dependencias, y Maven Central es el repositorio más común.  Sin embargo, Gradle te permite definir repositorios personalizados y tiene un sistema de caché más eficiente que puede acelerar los builds.  ¡Es como tener un sistema de gestión de bibliotecas más inteligente y optimizado! 📚
''',
    'code_example': '''
// Ejemplo de gestión de dependencias en build.gradle (Groovy DSL)
dependencies {
    implementation 'org.springframework.boot:spring-boot-starter-web:2.5.4'
    testImplementation 'org.junit.jupiter:junit-jupiter-api:5.8.0'
    runtimeOnly 'com.h2database:h2'  // Solo necesario en tiempo de ejecución
}

// Ejemplo incorrecto:  Declarar una dependencia sin versión
// implementation 'org.example:mi-libreria'  // Esto generalmente da error
''',
  });

  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 6,
    'tittle_level': 'Build Tools y Dependencias',
    'topic': 'Gradle',
    'subtopic': 'Comparación con Maven',
    'definition': '''
Maven y Gradle son dos herramientas de construcción muy populares en el ecosistema Java, pero tienen algunas diferencias clave.  Elegir entre ellos a veces puede ser una decisión importante para un proyecto.

¿Te estás preguntando cuáles son esas diferencias?  Bueno, Maven usa XML para su archivo de configuración (`pom.xml`), mientras que Gradle usa un DSL basado en Groovy o Kotlin (`build.gradle`).  Gradle generalmente se considera más flexible y conciso, mientras que Maven puede ser más estándar y fácil de aprender para principiantes.

Vamos a ver de que se trata todo esto.  Otras diferencias importantes incluyen:

* **Rendimiento:** Gradle a menudo es más rápido que Maven, especialmente para builds incrementales, debido a su sistema de caché y ejecución de tasks.
* **Flexibilidad:** Gradle es más flexible y te permite personalizar casi cualquier aspecto del build, mientras que Maven sigue un enfoque más "opinionated" con convenciones fijas.
* **Curva de aprendizaje:** Maven puede ser más fácil de aprender para proyectos simples, pero Gradle puede ser más poderoso para proyectos complejos.
* **Popularidad:** Maven ha sido tradicionalmente más popular en proyectos empresariales, mientras que Gradle es la herramienta de construcción estándar para Android.

En última instancia, la mejor herramienta depende de las necesidades específicas de tu proyecto y de las preferencias de tu equipo.  ¡Es como elegir entre dos autos deportivos: ambos te llevan a tu destino, pero con diferentes estilos y características! 🏎️
''',
    'code_example': '''
// No hay pom.xml o build.gradle específico para este subtema, es una comparación conceptual

// Puntos clave para recordar:
// - Maven: XML, Convenciones, Estandarizado
// - Gradle: DSL (Groovy/Kotlin), Flexible, Rendimiento

// Ejemplo incorrecto:  Declarar que una herramienta es "siempre mejor" que la otra
// (Ambas tienen sus pros y contras)
''',
  });
}
