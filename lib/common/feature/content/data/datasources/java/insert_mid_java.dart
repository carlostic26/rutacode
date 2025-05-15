import 'package:sqflite_common/sqlite_api.dart';

Future<void> insertMidLevel1Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Java',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Colecciones Avanzadas',
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
    'title_level': 'Colecciones Avanzadas',
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
    'title_level': 'Colecciones Avanzadas',
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
    'title_level': 'Colecciones Avanzadas',
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
}
