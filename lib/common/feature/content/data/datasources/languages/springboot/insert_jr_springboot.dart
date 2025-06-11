import 'package:sqflite_common/sqlite_api.dart';

Future<void> insertSpringbootJrLevel1Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción y Configuración',
    'topic': 'Creación de Proyectos',
    'subtopic': 'Uso de Spring Initializr para generar proyectos.',
    'definition': '''
Cuando vas a empezar un nuevo proyecto con Spring Boot, la forma más sencilla y rápida de hacerlo es usando Spring Initializr. Piensa en él como un asistente mágico que te prepara todo el esqueleto de tu aplicación para que no tengas que preocuparte por las configuraciones iniciales.

Seguramente pensarás de qué va todo esto y por qué no simplemente creas un proyecto desde cero. Aquí te va la aclaración:

Spring Initializr es una herramienta web (y también integrada en IDEs como IntelliJ IDEA o VS Code) que te permite generar un proyecto Spring Boot con las dependencias y la configuración básica que necesitas. Esto es súper útil porque evita que te pierdas en la maraña de versiones de librerías, configuraciones de Maven o Gradle, y la estructura de directorios. Solo seleccionas lo que quieres (qué tipo de proyecto, qué lenguaje, qué versión de Spring Boot, y las dependencias que vas a usar, como web, JPA, etc.), le das a "Generar" y ¡listo! Tienes un ZIP con todo lo necesario para empezar a codificar la lógica de tu negocio. De hecho, muchas empresas de desarrollo, desde startups hasta grandes corporaciones, usan esta herramienta para estandarizar la creación de nuevos servicios y microservicios, asegurando que todos los proyectos arranquen con una base sólida y consistente. Es la manera recomendada para no perder tiempo en el "boilerplate" (código repetitivo inicial) y centrarte en lo importante.
''',
    'code_example': r'''
// Ejemplo de cómo luce el archivo pom.xml (Maven) generado por Spring Initializr
// con las dependencias básicas para una aplicación web y devtools.
// Fíjate cómo Spring Initializr automáticamente configura la dependencia de Spring Boot Starter Web,
// que incluye todo lo necesario para desarrollar aplicaciones web, como un servidor embebido (Tomcat).

/* Incorrecto (o al menos no lo ideal si buscas rapidez y consistencia):
   Crear un proyecto Maven o Gradle desde cero y añadir manualmente todas las dependencias
   y configuraciones sin la ayuda de Initializr. Esto es propenso a errores de versión
   y a olvidar dependencias importantes.
*/
/*
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>3.2.0</version>
        <relativePath/> </parent>
    <groupId>com.example</groupId>
    <artifactId>demo</artifactId>
    <version>0.0.1-SNAPSHOT</version>
    <name>demo</name>
    <description>Demo project for Spring Boot</description>
    <properties>
        <java.version>17</java.version>
    </properties>
    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>

        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-devtools</artifactId>
            <scope>runtime</scope>
            <optional>true</optional>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
            <scope>test</scope>
        </dependency>
    </dependencies>

    <build>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
            </plugin>
        </plugins>
    </build>

</project>
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción y Configuración',
    'topic': 'Creación de Proyectos',
    'subtopic': 'Estructura básica de un proyecto Spring Boot.',
    'definition': '''
Una vez que has generado tu proyecto con Spring Initializr, te vas a encontrar con una estructura de carpetas y archivos bastante predecible. Esto es genial porque, no importa quién esté trabajando en el proyecto, todos saben dónde buscar cada cosa, lo que facilita mucho la colaboración y el mantenimiento.

No sé tú, pero a mí esto al principio me costó entender por qué cada archivo está donde está, pero la verdad es que cada elemento tiene su razón de ser.

La estructura más común de un proyecto Spring Boot se parece a esto:

├── src
│   ├── main
│   │   ├── java
│   │   │   └── com
│   │   │       └── example
│   │   │           └── demo
│   │   │               ├── DemoApplication.java
│   │   │               ├── controller
│   │   │               ├── service
│   │   │               └── repository
│   │   └── resources
│   │       ├── application.properties (o application.yml)
│   │       ├── static
│   │       └── templates
│   └── test
│       └── java
│           └── com
│               └── example
│                   └── demo
│                       └── DemoApplicationTests.java
├── pom.xml (o build.gradle)
└── .gitignore


Aquí te explico brevemente cada parte:
* **`src/main/java`**: Aquí es donde reside todo tu código Java. Dentro de esta carpeta, encontrarás el paquete base (por ejemplo, `com.example.demo`) y, lo más importante, tu clase principal con la anotación `@SpringBootApplication` (ej. `DemoApplication.java`). Esta clase es el punto de entrada de tu aplicación. Además, es común crear subcarpetas aquí para organizar tus controladores (`controller`), servicios (`service`), repositorios (`repository`), modelos, etc.
* **`src/main/resources`**: Esta carpeta es para tus archivos de configuración, propiedades y recursos estáticos.
    * **`application.properties` o `application.yml`**: Son los archivos de configuración principales donde defines puertos, configuraciones de base de datos, propiedades personalizadas y mucho más.
    * **`static`**: Si tu aplicación sirve archivos web estáticos (HTML, CSS, JavaScript, imágenes), este es el lugar para ponerlos.
    * **`templates`**: Si usas un motor de plantillas como Thymeleaf o FreeMarker para generar HTML dinámico, tus plantillas irán aquí.
* **`src/test/java`**: Aquí pones todos tus tests unitarios y de integración. Es fundamental para asegurar que tu código funciona como esperas y para prevenir regresiones.
* **`pom.xml` (Maven) o `build.gradle` (Gradle)**: Estos son los archivos de configuración de tu sistema de construcción. Definen las dependencias de tu proyecto, los plugins y cómo se va a construir la aplicación.
* **`.gitignore`**: Un archivo estándar de Git que le dice a Git qué archivos y carpetas debe ignorar (como los archivos de compilación, caché, etc.).

Conocer esta estructura te ahorrará dolores de cabeza y te ayudará a navegar por cualquier proyecto Spring Boot con confianza. Es un estándar que facilita la colaboración entre desarrolladores.
''',
    'code_example': '''
// Ejemplo de la clase principal de Spring Boot, generada automáticamente
// por Spring Initializr. Esta es la clase que arranca tu aplicación.

package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class DemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }

}
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción y Configuración',
    'topic': 'Creación de Proyectos',
    'subtopic': 'Configuración de dependencias con Maven o Gradle.',
    'definition': '''
Cuando desarrollas una aplicación con Spring Boot, rara vez vas a escribir todo el código desde cero. En su lugar, te apoyas en un montón de librerías y frameworks que ya hacen la mayor parte del trabajo pesado. Estas librerías se llaman "dependencias". Para gestionar todas estas dependencias de forma eficiente, usamos herramientas como Maven o Gradle.

Seguramente pensarás de qué va todo esto y cuál es la magia detrás de Maven y Gradle. 

Pues bien, estas herramientas son los "gestores de paquetes" por excelencia en el ecosistema Java.

Imagina que estás construyendo una casa y necesitas herramientas específicas: un martillo, un taladro, sierras, etc. En vez de ir a la ferretería a comprar cada una por separado y luego llevarlas a casa, tienes a alguien que te las trae directamente a la obra, asegurándose de que son las versiones correctas y que funcionan bien juntas. Así funcionan Maven y Gradle. Ellos se encargan de:

* **Descargar las librerías**: Cuando declaras una dependencia, Maven o Gradle van a repositorios centrales (como Maven Central) y descargan automáticamente el código compilado de esa librería y todas sus dependencias transitivas (es decir, las librerías que esa librería necesita para funcionar).
* **Resolver conflictos**: A veces, diferentes librerías pueden depender de la misma librería, pero en versiones distintas. Maven y Gradle tienen mecanismos para intentar resolver estos conflictos y asegurar que tu proyecto tenga un conjunto de librerías compatibles.
* **Construir tu proyecto**: No solo gestionan dependencias, también se encargan de compilar tu código, ejecutar tests, empaquetar tu aplicación en un JAR o WAR ejecutable, y muchas otras tareas relacionadas con el ciclo de vida de desarrollo.

**Maven** usa un archivo `pom.xml` (Project Object Model) basado en XML para declarar las dependencias y la configuración del proyecto. Es muy declarativo y estructurado.

**Gradle** usa un archivo `build.gradle` que está basado en Groovy (un lenguaje de scripting que corre en la JVM) o Kotlin DSL. Esto le da mucha más flexibilidad y permite escribir lógica programática para tareas de construcción más complejas. Muchas empresas hoy en día, sobre todo las que buscan más flexibilidad y performance en sus builds, se están moviendo hacia Gradle.

Ambas herramientas son excelentes, y la elección entre una u otra a menudo depende de las preferencias del equipo o de la complejidad del proyecto. Lo importante es que, sin ellas, la gestión de librerías en proyectos Java sería un verdadero caos.
''',
    'code_example': r'''
// Ejemplo de configuración de dependencias en Maven (pom.xml)
/*
<dependencies>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-web</artifactId>
    </dependency>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-data-jpa</artifactId>
    </dependency>
    <dependency>
        <groupId>com.h2database</groupId>
        <artifactId>h2</artifactId>
        <scope>runtime</scope>
    </dependency>
</dependencies>
*/

// Ejemplo de configuración de dependencias en Gradle (build.gradle)
// Aquí definimos las dependencias que nuestro proyecto necesita.
// `implementation` significa que la dependencia estará disponible tanto en tiempo de compilación como en tiempo de ejecución.
// `runtimeOnly` significa que la dependencia solo se necesita en tiempo de ejecución (como un driver de base de datos).
// `testImplementation` es para dependencias que solo se usan durante las pruebas.

/* Incorrecto:
   Intentar descargar manualmente los JARs de las librerías y añadirlos al classpath del proyecto.
   Esto es una mala práctica porque no maneja dependencias transitivas, versiones, o conflictos de forma automática.
*/

/*
dependencies {
    implementation 'org.springframework.boot:spring-boot-starter-web'
    implementation 'org.springframework.boot:spring-boot-starter-data-jpa'
    runtimeOnly 'com.h2database:h2'
    testImplementation 'org.springframework.boot:spring-boot-starter-test'
}
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción y Configuración',
    'topic': 'Anotaciones Fundamentales',
    'subtopic': '@SpringBootApplication',
    'definition': '''
Cuando creas una aplicación Spring Boot, verás que hay una anotación que siempre está presente en tu clase principal: `@SpringBootApplication`. Esta es como la piedra angular de tu aplicación Spring Boot, la que lo pone todo en marcha. 

¿Te estás preguntando por qué esta anotación es tan especial? Aquí te va la explicación:

Básicamente, `@SpringBootApplication` es una anotación de conveniencia que combina otras tres anotaciones muy importantes de Spring:
* `@Configuration`: Indica que la clase puede definir beans (objetos gestionados por el contenedor de Spring) y que los métodos anotados con `@Bean` se usarán para crear estos beans. Es decir, es donde Spring va a buscar configuraciones de tu aplicación.
* `@EnableAutoConfiguration`: Esta es la magia de Spring Boot. Le dice a Spring que intente configurar automáticamente tu aplicación basándose en las dependencias que tienes en tu classpath. Por ejemplo, si tienes la dependencia de H2 (una base de datos en memoria), Spring Boot automáticamente configura una conexión a la base de datos por ti. Esto te ahorra un montón de configuración manual.
* `@ComponentScan`: Le dice a Spring dónde buscar componentes (clases anotadas con `@Component`, `@Service`, `@Repository`, `@Controller`, etc.) para que los registre como beans en el contexto de la aplicación. Por defecto, escanea el paquete donde se encuentra la clase `@SpringBootApplication` y todos sus subpaquetes.

Así que, en lugar de poner estas tres anotaciones por separado en tu clase principal, `@SpringBootApplication` las agrupa en una sola, haciendo que tu código sea más limpio y fácil de entender. Es lo primero que lee Spring Boot para saber cómo debe configurar y arrancar tu aplicación.
''',
    'code_example': '''
// La clase principal de tu aplicación Spring Boot
// Aquí es donde todo comienza. La anotación @SpringBootApplication
// es clave para que Spring Boot configure automáticamente el proyecto.

package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication // Combina @Configuration, @EnableAutoConfiguration y @ComponentScan
public class DemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }
}

// Ejemplo de lo que @SpringBootApplication "oculta" o combina:
/*
@Configuration
@EnableAutoConfiguration
@ComponentScan
public class MyFullConfiguredApplication {
    public static void main(String[] args) {
        SpringApplication.run(MyFullConfiguredApplication.class, args);
    }
}
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción y Configuración',
    'topic': 'Anotaciones Fundamentales',
    'subtopic': '@RestController',
    'definition': '''
Cuando estás construyendo una API REST con Spring Boot, te vas a topar muy a menudo con la anotación `@RestController`. Esta anotación es fundamental porque le dice a Spring que la clase que la lleva es un "controlador", y que además, sus métodos van a devolver datos directamente como JSON (o XML, si así lo configuras), en lugar de nombres de vistas para renderizar HTML. 

Vamos a ver de qué se trata todo esto.

`@RestController` es en realidad una combinación de dos anotaciones:
* `@Controller`: Marca una clase como un controlador de Spring MVC, lo que significa que puede manejar peticiones entrantes de los clientes.
* `@ResponseBody`: Esta anotación se usa en los métodos de un controlador para indicar que el valor de retorno del método debe ser vinculado directamente al cuerpo de la respuesta HTTP. Es decir, Spring convierte el objeto que devuelves (por ejemplo, una lista de usuarios) a un formato de datos (como JSON) y lo envía tal cual al cliente.

Así que, al usar `@RestController` en tu clase, no necesitas poner `@ResponseBody` en cada método. Ya viene implícito. Esto es súper práctico para construir APIs REST donde la comunicación principal es a través de intercambio de datos (como JSON) entre el cliente y el servidor. Por ejemplo, cuando usas aplicaciones móviles o de frontend (como React o Angular) que necesitan consumir datos de un backend, `@RestController` es tu mejor amigo para exponer esos datos. Con esta anotación, Spring se encarga de todo el boilerplate de la serialización y deserialización de datos, permitiéndote enfocarte en la lógica de tu negocio.
''',
    'code_example': r'''
// Ejemplo de un controlador REST en Spring Boot
// Esta clase maneja las peticiones HTTP y devuelve respuestas JSON.

package com.example.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController // Indica que esta clase es un controlador REST y que sus métodos devuelven datos directamente
public class HelloWorldController {

    @GetMapping("/hello") // Mapea las peticiones GET a la ruta /hello
    public String helloWorld() {
        return "¡Hola, mundo desde Spring Boot!"; // Retorna una cadena que se convierte en la respuesta HTTP
    }

    // Un ejemplo más completo devolviendo un objeto JSON
    /*
    @GetMapping("/user")
    public User getUser() {
        return new User("Juan", 30); // Spring Boot automáticamente lo convierte a JSON
    }
    */
}

/* Incorrecto (o al menos no idiomático para REST APIs con Spring Boot):
   Usar @Controller sin @ResponseBody en cada método si quieres devolver JSON.
   Si olvidas @ResponseBody, Spring intentará resolver una vista.
*/
/*
@Controller
public class OldSchoolController {
    @GetMapping("/data")
    public @ResponseBody String getData() { // Necesitas @ResponseBody explícitamente
        return "Algunos datos.";
    }
}
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción y Configuración',
    'topic': 'Anotaciones Fundamentales',
    'subtopic': '@Service',
    'definition': '''
En una aplicación Spring Boot, es común organizar el código en capas para separar las responsabilidades. Una de esas capas cruciales es la capa de servicio, y la anotación `@Service` juega un papel fundamental aquí. Básicamente, `@Service` se usa para marcar clases que contienen lógica de negocio.

Pensemos por un momento en por qué esto importa. ¿Por qué no simplemente ponemos toda la lógica en el controlador?

La respuesta es la "separación de preocupaciones". Un controlador debería encargarse principalmente de recibir las peticiones HTTP, delegar el trabajo real a otra capa y devolver la respuesta. La lógica de negocio, es decir, las reglas específicas de tu aplicación (como "calcular el precio total de un pedido" o "validar si un usuario puede acceder a un recurso"), no debería vivir directamente en el controlador. Aquí es donde entran las clases de servicio.

Al anotar una clase con `@Service`, le estás diciendo a Spring que esta clase es un componente de la capa de servicio. Aunque internamente `@Service` es una especialización de `@Component` (lo que significa que Spring la detectará y gestionará como un bean), su propósito semántico es muy importante. Ayuda a los desarrolladores a entender rápidamente la función de esa clase dentro de la arquitectura del proyecto. Además, Spring puede aplicar funcionalidades específicas (como la gestión de transacciones) a estas clases de servicio de una manera más optimizada. Esto es crucial en aplicaciones empresariales, donde la lógica de negocio puede ser muy compleja y necesita ser reutilizable y fácil de mantener.
''',
    'code_example': '''
// Ejemplo de una clase de servicio en Spring Boot
// Aquí es donde reside la lógica de negocio de tu aplicación.

package com.example.demo.service;

import org.springframework.stereotype.Service;
import com.example.demo.model.User;
import com.example.demo.repository.UserRepository;

@Service // Marca esta clase como un componente de la capa de servicio
public class UserService {

    private final UserRepository userRepository; // Inyecta el repositorio

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User createUser(String name, int age) {
        // Aquí iría la lógica de negocio, por ejemplo, validaciones antes de guardar
        if (age < 18) {
            throw new IllegalArgumentException("El usuario debe ser mayor de edad.");
        }
        User newUser = new User(name, age);
        return userRepository.save(newUser); // Delega la persistencia al repositorio
    }

    public User getUserById(Long id) {
        return userRepository.findById(id).orElse(null);
    }
}

/* Incorrecto (o al menos no la mejor práctica):
   Poner lógica de negocio compleja directamente en el controlador.
   Esto hace que el controlador sea difícil de leer, probar y mantener.
*/
/*
@RestController
public class BadPracticeController {
    // Lógica de negocio directamente aquí, sin una capa de servicio
    @PostMapping("/users")
    public User createAndSaveUser(@RequestBody User user) {
        // Validación y guardado directamente en el controlador
        if (user.getAge() < 18) {
            throw new IllegalArgumentException("Edad inválida.");
        }
        // userRepository.save(user); // Si tuvieras un repositorio inyectado aquí
        return user;
    }
}
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción y Configuración',
    'topic': 'Anotaciones Fundamentales',
    'subtopic': '@Repository',
    'definition': '''
Cuando hablamos de persistencia de datos en Spring Boot, la anotación `@Repository` es clave. Se utiliza para marcar clases que interactúan directamente con la base de datos, es decir, la capa de acceso a datos. Estas clases son las encargadas de realizar operaciones como guardar, buscar, actualizar o eliminar información en la base de datos. 

Esto tiene una explicación, y es porque:

`@Repository` es otra anotación de especialización de `@Component`. Su propósito principal es indicar a Spring que la clase anotada es un "repositorio" o un objeto de acceso a datos (DAO - Data Access Object). Pero no es solo una etiqueta semántica; Spring también proporciona características adicionales a las clases `@Repository`. Por ejemplo, automáticamente traduce excepciones específicas del acceso a datos (como `SQLException`) a la jerarquía de excepciones de acceso a datos de Spring (`DataAccessException`). Esto hace que el manejo de errores de base de datos sea mucho más consistente y fácil de manejar en tu aplicación.

Piensa en los repositorios como el puente entre tu aplicación y la base de datos. Son los que saben cómo "hablar" con la base de datos y cómo traducir las operaciones de tu lógica de negocio en sentencias SQL (o comandos de otras bases de datos) y viceversa. Es una buena práctica separar esta capa para que tu lógica de negocio (en la capa de servicio) no tenga que preocuparse por los detalles de cómo se guardan o recuperan los datos. Si en algún momento decides cambiar de base de datos (por ejemplo, de MySQL a PostgreSQL), solo tendrías que modificar el código en tu capa de repositorio, sin afectar el resto de la aplicación.
''',
    'code_example': '''
// Ejemplo de una interfaz de repositorio con Spring Data JPA
// Spring Data JPA crea automáticamente la implementación de esta interfaz
// para que no tengas que escribir el código de acceso a datos.

package com.example.demo.repository;

import com.example.demo.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository // Marca esta interfaz como un componente de repositorio
// JpaRepository<User, Long> significa que es un repositorio para la entidad User y su ID es de tipo Long
public interface UserRepository extends JpaRepository<User, Long> {

    // Spring Data JPA generará automáticamente la implementación de este método
    User findByName(String name);

    // Método incorrecto si no sigues la convención de nombres de Spring Data JPA
    // Spring no sabría cómo generar la consulta para esto sin una anotación @Query
    // User retrieveUserByGivenName(String name);
}

// Ejemplo de una implementación manual de un repositorio (menos común con Spring Data JPA)
/*
package com.example.demo.repository;

import com.example.demo.model.User;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

@Repository
@Transactional // Para manejar transacciones de base de datos
public class MyCustomUserRepository {

    @PersistenceContext
    private EntityManager entityManager;

    public User save(User user) {
        if (user.getId() == null) {
            entityManager.persist(user);
        } else {
            entityManager.merge(user);
        }
        return user;
    }

    public User findById(Long id) {
        return entityManager.find(User.class, id);
    }
}
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción y Configuración',
    'topic': 'Configuración de Aplicaciones',
    'subtopic': 'Uso de application.properties y application.yml.',
    'definition': '''
En Spring Boot, cuando necesitas configurar tu aplicación (por ejemplo, el puerto en el que corre, la conexión a la base de datos, o cualquier propiedad personalizada), los archivos `application.properties` y `application.yml` son tus mejores amigos. Son el lugar central donde resides toda la configuración que tu aplicación necesita para funcionar.

Aquí te va la aclaración: ¿por qué dos formatos para lo mismo y cuál deberías usar?

Ambos archivos cumplen la misma función: almacenar pares clave-valor que Spring Boot lee al iniciar tu aplicación. La diferencia radica en su sintaxis:

* **`application.properties`**: Utiliza el formato de "pares clave=valor" tradicional de los archivos `.properties`. Es simple y directo. Cada propiedad va en una nueva línea.
    ```properties
    server.port=8080
    spring.datasource.url=jdbc:h2:mem:testdb
    my.custom.property=valor
    ```
* **`application.yml` (YAML Ain't Markup Language)**: Utiliza un formato basado en la indentación, lo que lo hace más legible para configuraciones complejas y jerárquicas. Es especialmente útil cuando tienes muchas propiedades anidadas.
    ```yaml
    server:
      port: 8080
    spring:
      datasource:
        url: jdbc:h2:mem:testdb
    my:
      custom:
        property: valor
    ```

La elección entre uno u otro es más bien una cuestión de preferencia personal o del equipo. Muchos desarrolladores prefieren `.yml` por su legibilidad, especialmente para configuraciones que tienen una estructura de árbol, ya que reduce la redundancia de las claves. Sin embargo, `.properties` es el formato de toda la vida y sigue siendo muy popular.

Lo importante es que ambos te permiten centralizar la configuración de tu aplicación, haciendo que sea fácil de modificar sin tener que recompilar el código. Esto es fundamental para entornos de desarrollo, pruebas y producción, donde las configuraciones pueden variar significativamente.
''',
    'code_example': r'''
// Ejemplo de application.properties:

/*
server.port=8081
spring.application.name=my-awesome-app
spring.datasource.url=jdbc:postgresql://localhost:5432/mydb
spring.datasource.username=user
spring.datasource.password=pass
*/

// Ejemplo de application.yml:

/*
server:
  port: 8082
spring:
  application:
    name: my-awesome-app-yml
  datasource:
    url: jdbc:mysql://localhost:3306/mydb
    username: root
    password: mysecretpassword
my-app:
  greeting: Hello from YAML!
*/

// Ambos archivos son leídos por Spring Boot al inicio.
// Si ambos existen, application.properties tiene precedencia sobre application.yml
// para las propiedades duplicadas.

// Acceso a propiedades desde código Java (ejemplo conceptual):
/*
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class AppConfigReader {

    @Value("${server.port}")
    private int serverPort;

    @Value("${my.custom.property}") // O my-app.greeting si usas YML
    private String customProperty;

    public void printConfig() {
        System.out.println("Server Port: " + serverPort);
        System.out.println("Custom Property: " + customProperty);
    }
}
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción y Configuración',
    'topic': 'Configuración de Aplicaciones',
    'subtopic': 'Gestión de perfiles: dev, test, prod.',
    'definition': '''
En el desarrollo de software, es muy común que una misma aplicación necesite diferentes configuraciones según el entorno en el que se ejecute. Por ejemplo, en desarrollo (dev) puedes usar una base de datos en memoria, en pruebas (test) una base de datos de integración, y en producción (prod) una base de datos robusta y externa. Aquí es donde entra en juego la gestión de perfiles de Spring Boot.

¿Te estás preguntando por qué esto importa y cómo nos ayuda a simplificar la configuración?

Los perfiles de Spring Boot te permiten definir conjuntos de propiedades de configuración que son específicas para un entorno determinado. En lugar de cambiar manualmente los archivos de configuración cada vez que mueves tu aplicación de un entorno a otro, simplemente activas el perfil correspondiente, y Spring Boot carga las propiedades correctas automáticamente.

Esto funciona creando archivos de configuración específicos para cada perfil. Por ejemplo:
* `application.properties` o `application.yml` (configuración por defecto, aplica a todos los perfiles a menos que sea sobreescrita).
* `application-dev.properties` o `application-dev.yml` (para el entorno de desarrollo).
* `application-test.properties` o `application-test.yml` (para el entorno de pruebas).
* `application-prod.properties` o `application-prod.yml` (para el entorno de producción).

Cuando inicias tu aplicación, le indicas a Spring Boot qué perfil debe activar. Por ejemplo, si activas el perfil `dev`, Spring Boot leerá `application.properties` (o `application.yml`) y luego sobreescribirá cualquier propiedad con los valores definidos en `application-dev.properties` (o `application-dev.yml`). Esta característica es increíblemente potente y es una práctica estándar en el desarrollo de aplicaciones empresariales, ya que permite un despliegue y una gestión de entornos mucho más fluidos y menos propensos a errores. Compañías como Netflix, que utilizan Spring Boot extensivamente, dependen fuertemente de esta capacidad de configuración por perfiles para manejar sus miles de microservicios en diferentes entornos.
''',
    'code_example': r'''
// Ejemplo de aplicación de perfiles:

// application.properties (configuración por defecto)
/*
spring.datasource.url=jdbc:h2:mem:defaultdb
my.app.message=Hello from default!
*/

// application-dev.properties (sobrescribe algunas propiedades para el perfil 'dev')
/*
spring.datasource.url=jdbc:h2:mem:devdb
my.app.message=Hello from DEV!
*/

// application-prod.properties (sobrescribe algunas propiedades para el perfil 'prod')
/*
spring.datasource.url=jdbc:mysql://prod-db-server:3306/prod_db
spring.datasource.username=produser
spring.datasource.password=prodpassword
my.app.message=Hello from PROD!
*/

// Cómo activar un perfil al iniciar la aplicación:

// 1. Usando un argumento de línea de comandos (la forma más común):
// java -jar your-app.jar --spring.profiles.active=dev

// 2. Usando una variable de entorno:
// export SPRING_PROFILES_ACTIVE=prod
// java -jar your-app.jar

// 3. En el propio application.properties (no recomendado para producción):
// spring.profiles.active=test

// Ejemplo de cómo acceder a una propiedad en código Java
/*
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class ProfileSensitiveComponent {

    @Value("${my.app.message}")
    private String appMessage;

    public void printMessage() {
        System.out.println("Current application message: " + appMessage);
    }
}
*/
'''
  });
}

Future<void> insertSpringbootJrLevel2Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Desarrollo de APIs REST',
    'topic': 'Controladores y Rutas',
    'subtopic': '@GetMapping, @PostMapping, @PutMapping, @DeleteMapping.',
    'definition': '''
Cuando creamos una API REST en Spring Boot, necesitamos decirle a nuestra aplicación cómo responder a las diferentes solicitudes que llegan de los clientes. Aquí es donde entran en juego las anotaciones `@GetMapping`, `@PostMapping`, `@PutMapping` y `@DeleteMapping`. Estas anotaciones son como los carteles indicadores que le dicen a Spring qué método de tu controlador debe ejecutarse cuando llega una petición HTTP específica.

Vamos a ver de qué se trata todo esto y por qué son tan importantes para construir una API funcional.

Cada una de estas anotaciones corresponde a un método HTTP estándar, que son los verbos que usamos para comunicarnos con los recursos en una API REST:

* **`@GetMapping`**: Esta anotación se usa para mapear solicitudes HTTP `GET`. Generalmente, las peticiones `GET` se utilizan para **obtener** o **leer** recursos del servidor. Piensa en esto como cuando abres una página web o le pides información a una base de datos sin cambiarla.
    * Ejemplo: Obtener la lista de todos los usuarios, o los detalles de un usuario específico.
* **`@PostMapping`**: Se usa para mapear solicitudes HTTP `POST`. Las peticiones `POST` se utilizan para **crear** nuevos recursos en el servidor. Imagina que estás enviando un formulario con datos nuevos.
    * Ejemplo: Registrar un nuevo usuario, o subir una nueva foto.
* **`@PutMapping`**: Esta anotación mapea solicitudes HTTP `PUT`. Las peticiones `PUT` se utilizan para **actualizar** o **reemplazar** completamente un recurso existente en el servidor. Si envías un `PUT` a un recurso que no existe, a menudo se crea.
    * Ejemplo: Actualizar toda la información de un perfil de usuario existente.
* **`@DeleteMapping`**: Mapea solicitudes HTTP `DELETE`. Como su nombre indica, se utiliza para **eliminar** un recurso del servidor.
    * Ejemplo: Eliminar un usuario de la base de datos.

El uso de estas anotaciones es lo que nos permite construir APIs que siguen los principios RESTful, haciendo que nuestras aplicaciones sean predecibles, fáciles de entender y consumir por otros sistemas o por aplicaciones frontend. Al usarlas correctamente, defines la intención de cada operación que tu API expone, lo cual es fundamental para una buena arquitectura.
''',
    'code_example': r'''
// Ejemplo de un controlador que usa las anotaciones de mapeo de peticiones HTTP

package com.example.demo.controller;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/users") // Prefijo para todas las rutas en este controlador
public class UserController {

    // Maneja peticiones GET a /api/users
    @GetMapping
    public String getAllUsers() {
        return "Obteniendo todos los usuarios...";
    }

    // Maneja peticiones GET a /api/users/{id}
    @GetMapping("/{id}")
    public String getUserById() {
        return "Obteniendo un usuario por ID...";
    }

    // Maneja peticiones POST a /api/users
    @PostMapping
    public String createUser() {
        return "Creando un nuevo usuario...";
    }

    // Maneja peticiones PUT a /api/users/{id}
    @PutMapping("/{id}")
    public String updateUser() {
        return "Actualizando un usuario existente...";
    }

    // Maneja peticiones DELETE a /api/users/{id}
    @DeleteMapping("/{id}")
    public String deleteUser() {
        return "Eliminando un usuario...";
    }

    /* Incorrecto:
       Usar la misma anotación para diferentes tipos de operaciones HTTP en la misma ruta
       sin especificar métodos HTTP. Esto causaría ambigüedad.
    */
    /*
    @RequestMapping("/bad-endpoint") // Esto intentará mapear todos los métodos HTTP
    public String ambiguousMethod() {
        return "Esto es ambiguo y puede causar errores si hay otros @RequestMapping.";
    }
    */
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Desarrollo de APIs REST',
    'topic': 'Controladores y Rutas',
    'subtopic': '@PathVariable, @RequestParam, @RequestBody.',
    'definition': '''
Además de las anotaciones que definen el tipo de petición HTTP (como `@GetMapping`), Spring Boot nos ofrece otras anotaciones muy útiles para extraer datos de las peticiones entrantes. Estas son `@PathVariable`, `@RequestParam` y `@RequestBody`. Son esenciales para que tu API sea dinámica y pueda recibir información de los clientes para procesarla.

Seguramente pensarás de qué va todo esto y cuándo usar cada una. Aquí te va la aclaración:

* **`@PathVariable`**: Imagina que tienes una URL como `/productos/123`. El `123` es un identificador único del producto. `@PathVariable` te permite extraer ese `123` directamente de la URL. Se usa para valores que son parte de la ruta misma y que identifican un recurso específico. Es muy útil cuando la URL sigue una estructura jerárquica para identificar elementos.
    * Sintaxis: `@GetMapping("/productos/{id}")` y en el método: `public Producto getProduct(@PathVariable Long id)`.

* **`@RequestParam`**: Piensa en las URLs que ves en tu navegador con un signo de interrogación, como `/productos?categoria=electronica&orden=precio`. Aquí, `categoria` y `orden` son parámetros de consulta. `@RequestParam` se usa para extraer estos parámetros que se envían en la cadena de consulta de la URL. Son opcionales por defecto y se usan para filtrar, paginar u ordenar recursos.
    * Sintaxis: `@GetMapping("/productos")` y en el método: `public List<Producto> getProducts(@RequestParam String categoria, @RequestParam(required = false) String orden)`.

* **`@RequestBody`**: Cuando envías datos más complejos, como un objeto JSON completo (por ejemplo, los datos de un nuevo usuario o un producto a crear), esos datos van en el "cuerpo" de la petición HTTP. `@RequestBody` se encarga de tomar ese cuerpo de la petición y convertirlo automáticamente a un objeto Java. Es la anotación estrella para recibir JSON o XML en peticiones `POST` y `PUT`.
    * Sintaxis: `@PostMapping("/usuarios")` y en el método: `public User createUser(@RequestBody User newUser)`.

Entender y usar correctamente estas anotaciones te permitirá construir APIs REST robustas y flexibles, capaces de manejar diferentes tipos de datos de entrada desde los clientes. Son la base para que tu controlador entienda lo que el cliente le está pidiendo y enviando.
''',
    'code_example': r'''
// Ejemplo de un controlador utilizando @PathVariable, @RequestParam y @RequestBody

package com.example.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.ArrayList;

@RestController
public class DataExtractController {

    // --- Uso de @PathVariable ---
    // Extrae el ID del usuario de la URL
    @GetMapping("/users/{id}")
    public String getUserById(@PathVariable Long id) {
        return "Buscando usuario con ID: " + id;
    }

    // --- Uso de @RequestParam ---
    // Filtra productos por categoría y permite ordenarlos (opcional)
    @GetMapping("/products")
    public String getProducts(
            @RequestParam String category,
            @RequestParam(required = false, defaultValue = "name") String sortBy) { // 'required = false' lo hace opcional, 'defaultValue' asigna un valor por defecto
        return "Obteniendo productos de la categoría '" + category + "' ordenados por: " + sortBy;
    }

    // --- Uso de @RequestBody ---
    // Recibe un objeto JSON en el cuerpo de la petición y lo convierte a un objeto Product
    @PostMapping("/products")
    public String createProduct(@RequestBody Product product) {
        return "Creando producto: " + product.getName() + " con precio: " + product.getPrice();
    }

    // Clase Product (para ejemplo de @RequestBody)
    static class Product {
        private String name;
        private double price;

        public String getName() { return name; }
        public void setName(String name) { this.name = name; }
        public double getPrice() { return price; }
        public void setPrice(double price) { this.price = price; }

        // Constructor, getters y setters omitidos para brevedad
    }

    /* Incorrecto:
       Intentar usar @PathVariable para parámetros de consulta o @RequestParam para segmentos de URL.
       O no definir un objeto DTO/Clase para @RequestBody y esperar recibir datos arbitrarios.
    */
    /*
    @GetMapping("/wrong-path?id={id}") // Mal uso de @PathVariable con query params
    public String getWrongId(@PathVariable String id) { return "Incorrecto"; }

    @PostMapping("/wrong-body")
    public String processWrongBody(@RequestBody String data) { // Esto es muy genérico, mejor usar una clase
        return "No ideal para datos estructurados.";
    }
    */
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Desarrollo de APIs REST',
    'topic': 'Validación de Datos',
    'subtopic': 'Uso de anotaciones como @Valid y @NotNull.',
    'definition': '''
Cuando desarrollamos APIs, es crucial asegurarnos de que los datos que recibimos de los clientes sean válidos y consistentes. No queremos que un usuario nos envíe un campo de email vacío o un número donde se espera texto, ¿verdad? Aquí es donde entran en juego las anotaciones de validación en Spring Boot, como `@Valid` y `@NotNull`, que nos ayudan a aplicar reglas sobre los datos entrantes.

¿Te estás preguntando por qué esto importa tanto y cómo nos ayuda a mantener nuestra API robusta?

La validación de datos es un paso fundamental para prevenir errores, asegurar la integridad de la información y proteger tu aplicación de entradas maliciosas o inesperadas. Spring Boot, junto con la especificación Bean Validation (JSR 380), proporciona un conjunto de anotaciones que puedes usar directamente en tus objetos de modelo o DTOs (Data Transfer Objects) para definir reglas de validación.

Aquí te explico algunas de las más comunes:
* **`@NotNull`**: Como su nombre lo indica, asegura que un campo no sea `null`. Si un cliente envía un objeto donde este campo es nulo, la validación fallará.
* **`@NotEmpty`**: Para colecciones o cadenas de texto, asegura que no sean ni `null` ni estén vacías.
* **`@NotBlank`**: Específico para cadenas de texto, asegura que no sea `null`, que no esté vacía y que no contenga solo espacios en blanco. Es más estricta que `@NotEmpty` para Strings.
* **`@Size(min=X, max=Y)`**: Para cadenas de texto, colecciones o arrays, valida que su tamaño esté dentro de un rango específico.
* **`@Min(value)` / `@Max(value)`**: Para valores numéricos, aseguran que el número esté por encima o por debajo de un valor dado.
* **`@Email`**: Valida que una cadena de texto tenga el formato de una dirección de correo electrónico válida.

Y la anotación maestra que activa todo este proceso de validación en tus controladores es **`@Valid`**. Cuando colocas `@Valid` antes de un `@RequestBody` en tu método de controlador, le estás diciendo a Spring que aplique todas las reglas de validación definidas en el objeto que se está recibiendo. Si alguna regla falla, Spring generará automáticamente un error, y tu aplicación puede capturarlo y devolver una respuesta adecuada al cliente, sin que la lógica de tu negocio se vea afectada por datos inválidos. Es una forma elegante y declarativa de manejar la calidad de los datos de entrada.
''',
    'code_example': r'''
// Ejemplo de uso de anotaciones de validación en un DTO y un controlador

package com.example.demo.dto;

import jakarta.validation.Valid; // Importante para la anotación @Valid
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.Size;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

// 1. Definición del DTO con anotaciones de validación
class UserCreateRequest {

    @NotBlank(message = "El nombre no puede estar vacío") // No null y no solo espacios en blanco
    @Size(min = 3, max = 50, message = "El nombre debe tener entre 3 y 50 caracteres")
    private String name;

    @Email(message = "Formato de email inválido") // Valida formato de email
    @NotBlank(message = "El email no puede estar vacío")
    private String email;

    @Min(value = 18, message = "La edad debe ser al menos 18") // Edad mínima
    private int age;

    // Getters y Setters (omitidos para brevedad)
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }
}

// 2. Uso de @Valid en el controlador
@RestController
public class UserController {

    @PostMapping("/users")
    // @Valid le dice a Spring que valide el objeto userRequest
    public ResponseEntity<String> createUser(@Valid @RequestBody UserCreateRequest userRequest) {
        // Si la validación falla, este método no se ejecutará y Spring enviará un error 400 Bad Request
        // Si todo es válido, puedes procesar el usuario
        return ResponseEntity.ok("Usuario creado: " + userRequest.getName());
    }

    /* Incorrecto:
       No usar @Valid en el controlador cuando tienes anotaciones de validación en el DTO.
       Esto hará que las anotaciones de validación en UserCreateRequest sean ignoradas.
    */
    /*
    @PostMapping("/users-no-validation")
    public ResponseEntity<String> createUserNoValidation(@RequestBody UserCreateRequest userRequest) {
        // Aquí no se validará automáticamente, tendrías que hacerlo manualmente
        if (userRequest.getName() == null || userRequest.getName().trim().isEmpty()) {
            return ResponseEntity.badRequest().body("El nombre es requerido.");
        }
        return ResponseEntity.ok("Usuario procesado sin validación automática.");
    }
    */
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Desarrollo de APIs REST',
    'topic': 'Validación de Datos',
    'subtopic': 'Manejo de errores y respuestas adecuadas.',
    'definition': '''
Incluso con la mejor validación, los errores son una parte inevitable de cualquier aplicación. Los usuarios pueden intentar enviar datos incorrectos, algo puede fallar en la base de datos, o un servicio externo podría no responder. Por eso, manejar los errores de manera elegante y consistente es tan importante como validar los datos. No queremos que nuestra API devuelva un mensaje de error feo o confuso al cliente, ¿verdad?

Vamos a ver de que se trata todo esto y cómo podemos hacer que los errores de nuestra API sean informativos y amigables para quien la consume.

En Spring Boot, el manejo de errores se centra en devolver respuestas HTTP apropiadas con códigos de estado significativos y cuerpos de respuesta que expliquen lo que salió mal. Por ejemplo:

* **`400 Bad Request`**: Se usa cuando el cliente envía una petición con datos inválidos (por ejemplo, falló una validación).
* **`404 Not Found`**: Cuando el recurso que el cliente intenta acceder no existe.
* **`500 Internal Server Error`**: Un error genérico en el servidor que no fue culpa del cliente.
* **`401 Unauthorized`**: El cliente no tiene las credenciales para acceder al recurso.
* **`403 Forbidden`**: El cliente tiene credenciales, pero no tiene permisos para el recurso específico.

Spring Boot proporciona varias formas de manejar errores globalmente o a nivel de controlador:

* **`@ExceptionHandler`**: Esta anotación se usa dentro de un controlador para manejar excepciones específicas lanzadas por los métodos de ese controlador. Puedes definir un método que se ejecutará cuando una excepción particular ocurra, y devolver una `ResponseEntity` personalizada.
* **`@ControllerAdvice` / `@RestControllerAdvice`**: Si quieres manejar excepciones de forma global para toda tu aplicación, `@ControllerAdvice` (o su versión REST, `@RestControllerAdvice`) es la solución. Creas una clase con esta anotación, y dentro de ella, usas `@ExceptionHandler` para capturar excepciones que ocurran en cualquier parte de tu aplicación, centralizando así el manejo de errores. Esto te permite tener un formato de respuesta de error consistente en toda tu API.

Un buen manejo de errores no solo ayuda a los desarrolladores que consumen tu API, sino que también mejora la experiencia del usuario final, al proporcionar mensajes claros sobre lo que deben corregir o qué salió mal.
''',
    'code_example': r'''
// Ejemplo de manejo de errores en Spring Boot

package com.example.demo.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.HashMap;
import java.util.Map;

// 1. DTO para demostrar la validación
class ItemRequest {
    private String name;
    private int quantity;

    // Getters y Setters (omitidos para brevedad)
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
}

// 2. Controlador de ejemplo
@RestController
public class ItemController {

    @PostMapping("/items")
    public ResponseEntity<String> createItem(@RequestBody ItemRequest itemRequest) {
        // Simula una validación de negocio adicional
        if (itemRequest.getQuantity() <= 0) {
            throw new IllegalArgumentException("La cantidad debe ser mayor que cero.");
        }
        return ResponseEntity.ok("Item creado: " + itemRequest.getName());
    }
}

// 3. Clase @ControllerAdvice para manejo global de errores
@ControllerAdvice // Le dice a Spring que esta clase maneja excepciones globalmente
public class GlobalExceptionHandler {

    // Maneja excepciones de validación de @Valid (cuando un @RequestBody falla)
    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST) // Código de estado HTTP 400
    public ResponseEntity<Map<String, String>> handleValidationExceptions(
            MethodArgumentNotValidException ex) {
        Map<String, String> errors = new HashMap<>();
        ex.getBindingResult().getFieldErrors().forEach(error ->
            errors.put(error.getField(), error.getDefaultMessage()));
        return new ResponseEntity<>(errors, HttpStatus.BAD_REQUEST);
    }

    // Maneja excepciones de tipo IllegalArgumentException
    @ExceptionHandler(IllegalArgumentException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST) // Código de estado HTTP 400
    public ResponseEntity<String> handleIllegalArgumentException(IllegalArgumentException ex) {
        return new ResponseEntity<>(ex.getMessage(), HttpStatus.BAD_REQUEST);
    }

    // Maneja cualquier otra excepción no capturada
    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR) // Código de estado HTTP 500
    public ResponseEntity<String> handleAllUncaughtException(Exception ex) {
        return new ResponseEntity<>("Ocurrió un error inesperado en el servidor.", HttpStatus.INTERNAL_SERVER_ERROR);
    }
}

/* Incorrecto (o al menos no la mejor práctica):
   Devolver errores genéricos sin un código de estado HTTP adecuado,
   o no centralizar el manejo de errores, replicando la lógica en cada controlador.
*/
/*
@RestController
public class BadErrorHandlingController {
    @PostMapping("/bad-item")
    public String createBadItem(@RequestBody ItemRequest itemRequest) {
        if (itemRequest.getQuantity() <= 0) {
            // Esto solo devuelve un String, no un código de estado 400
            return "Error: Cantidad inválida.";
        }
        return "Item creado.";
    }
}
*/
'''
  });
}

Future<void> insertSpringbootJrLevel3Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Persistencia de Datos',
    'topic': 'Spring Data JPA',
    'subtopic': 'Definición de entidades y repositorios.',
    'definition': '''
Cuando hablamos de guardar y recuperar datos en una aplicación Spring Boot, Spring Data JPA es una herramienta increíblemente poderosa que simplifica mucho el trabajo con bases de datos relacionales. Los dos pilares fundamentales aquí son las "entidades" y los "repositorios".

No sé tú, pero a mí esto al principio me costó un poco entender cómo se conectaban mis objetos Java con las tablas de la base de datos.

Piensa en una **entidad** como la representación de una tabla en tu base de datos, pero en formato de objeto Java. Cada instancia de una entidad corresponde a una fila en esa tabla, y cada propiedad de la entidad (sus atributos) corresponde a una columna. Las entidades se definen como clases POJO (Plain Old Java Object) y se anotan con `@Entity` para indicarle a JPA que son objetos que se deben persistir en la base de datos. Además, debes indicar cuál es la clave primaria de la tabla con `@Id`. Si esa clave se genera automáticamente por la base de datos, usas `@GeneratedValue`.

Por otro lado, los **repositorios** son interfaces que te permiten realizar operaciones de base de datos (como guardar, buscar, eliminar, etc.) sin tener que escribir ni una sola línea de código SQL. Spring Data JPA, utilizando interfaces como `JpaRepository`, genera automáticamente las implementaciones de estos métodos. Simplemente declaras una interfaz que extiende `JpaRepository` (especificando la entidad y el tipo de su clave primaria), y Spring se encarga de todo. Esto es una maravilla porque te abstrae de la complejidad del JDBC y el SQL, permitiéndote concentrarte en la lógica de tu negocio. Por ejemplo, en Spotify, donde manejan millones de datos de usuarios y canciones, la definición clara de entidades y el uso eficiente de repositorios les permite gestionar una base de datos gigantesca de forma escalable.
''',
    'code_example': r'''
// Ejemplo de una entidad y su repositorio en Spring Data JPA

package com.example.demo.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Column; // Para especificar detalles de la columna
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

// 1. Definición de la Entidad 'Producto'
@Entity // Indica que esta clase es una entidad JPA y se mapea a una tabla de BD
public class Product {

    @Id // Marca el campo como la clave primaria
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Indica que el ID es auto-generado por la BD
    private Long id;

    @Column(nullable = false, unique = true, length = 100) // Especifica que no puede ser nulo, es único y max 100 caracteres
    private String name;

    private double price;

    // Constructor vacío requerido por JPA
    public Product() {}

    public Product(String name, double price) {
        this.name = name;
        this.price = price;
    }

    // Getters y Setters (omitidos para brevedad)
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
}

// 2. Definición del Repositorio para la Entidad 'Product'
@Repository // Marca esta interfaz como un componente de repositorio de Spring
public interface ProductRepository extends JpaRepository<Product, Long> {
    // Aquí no necesitamos implementar nada, Spring Data JPA se encarga
    // de proveer métodos básicos como save(), findById(), findAll(), deleteById(), etc.
}

/* Incorrecto (o al menos mucho más trabajo del necesario con Spring Data JPA):
   Intentar escribir las implementaciones de los métodos de repositorio manualmente
   cuando ya extiendes JpaRepository.
*/
/*
// Esto no sería necesario con Spring Data JPA
@Repository
public class ProductRepositoryImpl implements ProductRepository {
    // ... implementación manual de save, findById, etc.
}
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Persistencia de Datos',
    'topic': 'Spring Data JPA',
    'subtopic': 'Consultas básicas con métodos derivados.',
    'definition': '''
Una de las características más geniales de Spring Data JPA es su capacidad para generar consultas de base de datos automáticamente con solo nombrar tus métodos en las interfaces de repositorio. Esto se conoce como "métodos derivados de consulta" o "query methods". Te permite buscar datos sin escribir una sola línea de SQL o JPQL.

Esto tiene una explicación, y es porque:

Spring Data JPA analiza el nombre de tus métodos en la interfaz del repositorio y deduce la consulta que necesitas. Sigue una convención de nomenclatura muy específica. Por ejemplo, si quieres encontrar un usuario por su email, simplemente defines un método llamado `findByEmail(String email)` en tu `UserRepository`, y Spring Data JPA se encarga de crear la consulta SQL adecuada por ti.

Aquí te dejo algunos ejemplos de cómo funciona esta magia:

* **`findBy[NombreCampo]`**: Busca por un campo exacto. Por ejemplo, `findByName(String name)` o `findByAge(int age)`.
* **`findBy[NombreCampo]And[OtroCampo]`**: Combina condiciones con `AND`. Por ejemplo, `findByNameAndAge(String name, int age)`.
* **`findBy[NombreCampo]Or[OtroCampo]`**: Combina condiciones con `OR`. Por ejemplo, `findByNameOrEmail(String name, String email)`.
* **`findBy[NombreCampo]Between`**: Busca valores dentro de un rango. Por ejemplo, `findByAgeBetween(int minAge, int maxAge)`.
* **`findBy[NombreCampo]LessThan` / `GreaterThan`**: Busca valores menores o mayores que.
* **`findBy[NombreCampo]Like` / `StartingWith` / `EndingWith` / `Containing`**: Para búsquedas de cadenas de texto (similar a `LIKE %valor%` en SQL).
* **`findBy[NombreCampo]OrderBy[OtroCampo]Desc/Asc`**: Para ordenar resultados.

La clave es seguir la convención de nombres. Si Spring Data JPA no entiende el nombre del método, te lo hará saber con un error. Esta capacidad de generar consultas a partir de nombres de métodos es un gran ahorro de tiempo y reduce drásticamente la cantidad de código repetitivo que tendrías que escribir para acceder a la base de datos. Es una de las razones por las que Spring Data JPA es tan popular entre los desarrolladores.
''',
    'code_example': r'''
// Ejemplo de consultas básicas con métodos derivados en un repositorio JPA

package com.example.demo.repository;

import com.example.demo.model.User; // Asumiendo que tienes una entidad User
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional; // Para manejar casos donde no se encuentra el resultado

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    // 1. Encontrar un usuario por su nombre (findBy[NombreCampo])
    // Equivalente a: SELECT * FROM user WHERE name = ?
    Optional<User> findByName(String name);

    // 2. Encontrar usuarios por email, ignorando mayúsculas/minúsculas (findBy[NombreCampo]IgnoreCase)
    // Equivalente a: SELECT * FROM user WHERE LOWER(email) = LOWER(?)
    Optional<User> findByEmailIgnoreCase(String email);

    // 3. Encontrar usuarios por nombre y edad (findBy[Campo1]And[Campo2])
    // Equivalente a: SELECT * FROM user WHERE name = ? AND age = ?
    List<User> findByNameAndAge(String name, int age);

    // 4. Encontrar usuarios mayores a una edad determinada, ordenados por nombre ascendente
    // (findBy[Campo]GreaterThanOrderBy[OtroCampo]Asc)
    // Equivalente a: SELECT * FROM user WHERE age > ? ORDER BY name ASC
    List<User> findByAgeGreaterThanOrderByNameAsc(int age);

    // 5. Encontrar usuarios cuyo nombre contiene una cadena (findBy[Campo]Containing)
    // Equivalente a: SELECT * FROM user WHERE name LIKE '%?%'
    List<User> findByNameContaining(String searchString);

    /* Incorrecto:
       Nombres de métodos que no siguen las convenciones de Spring Data JPA.
       Esto resultaría en un error de compilación o de tiempo de ejecución
       porque Spring no sabría cómo generar la consulta.
    */
    /*
    // Este método no sería reconocido por Spring Data JPA para generar una consulta automática
    List<User> searchUsersByName(String userName);

    // Si quieres usar nombres personalizados, necesitarías la anotación @Query
    // @Query("SELECT u FROM User u WHERE u.name = ?1")
    // User retrieveUserByNameManual(String name);
    */
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Persistencia de Datos',
    'topic': 'Bases de Datos',
    'subtopic': 'Conexión a bases de datos como H2, MySQL o PostgreSQL.',
    'definition': '''
Una aplicación Spring Boot necesita almacenar datos, y para eso usamos bases de datos. Spring Boot hace que conectarse a diferentes tipos de bases de datos relacionales, como H2 (una base de datos en memoria), MySQL o PostgreSQL, sea un proceso bastante sencillo y estandarizado.

¿Te estás preguntando por qué esto importa y cuáles son las diferencias entre estas bases de datos? Aquí te va la aclaración:

La elección de la base de datos depende mucho de las necesidades de tu proyecto. Spring Boot, gracias a su auto-configuración y la flexibilidad de Spring Data JPA, te permite cambiar de una base de datos a otra con cambios mínimos en el código de tu aplicación.

* **H2 Database**: Es una base de datos ligera, de código abierto y, lo más importante, se puede configurar para ejecutarse completamente en memoria. Esto la hace perfecta para el desarrollo local, pruebas unitarias y de integración, o para prototipos rápidos donde no necesitas persistencia de datos después de reiniciar la aplicación. Es increíblemente fácil de configurar y arrancar.
* **MySQL**: Es una de las bases de datos relacionales más populares del mundo. Es robusta, escalable y tiene una enorme comunidad de soporte. Es ideal para aplicaciones de tamaño mediano a grande que requieren un rendimiento sólido y un buen manejo de transacciones. La mayoría de los proveedores de hosting ofrecen soporte para MySQL.
* **PostgreSQL**: Conocida por su robustez, extensibilidad y cumplimiento estricto de los estándares SQL, PostgreSQL es a menudo la elección preferida para aplicaciones empresariales que requieren alta integridad de datos y características avanzadas. Es una alternativa poderosa a MySQL y se usa en sistemas donde la fiabilidad y la capacidad de extensión son primordiales.

Para conectar tu aplicación Spring Boot a cualquiera de estas bases de datos, lo primero que necesitas es añadir la dependencia del driver JDBC correspondiente en tu `pom.xml` (Maven) o `build.gradle` (Gradle). Luego, la configuración principal se hace en tu archivo `application.properties` o `application.yml`, donde le dices a Spring la URL de conexión, el usuario y la contraseña. Spring Boot se encarga del resto, haciendo que la conexión sea fluida y automática.
''',
    'code_example': r'''
// Dependencias necesarias en pom.xml (Maven) para diferentes bases de datos:

// Para H2 Database (típicamente para desarrollo y pruebas)
/*
<dependency>
    <groupId>com.h2database</groupId>
    <artifactId>h2</artifactId>
    <scope>runtime</scope>
</dependency>
*/

// Para MySQL
/*
<dependency>
    <groupId>mysql</groupId>
    <artifactId>mysql-connector-java</artifactId>
    <scope>runtime</scope>
</dependency>
*/

// Para PostgreSQL
/*
<dependency>
    <groupId>org.postgresql</groupId>
    <artifactId>postgresql</artifactId>
    <scope>runtime</scope>
</dependency>
*/

// Ejemplo de configuración en application.properties para cada DB:

// 1. Configuración para H2 (base de datos en memoria)
/*
spring.datasource.url=jdbc:h2:mem:mydb
spring.datasource.driverClassName=org.h2.Driver
spring.datasource.username=sa
spring.datasource.password=
spring.jpa.database-platform=org.hibernate.dialect.H2Dialect
spring.h2.console.enabled=true # Habilita la consola web de H2 para ver la DB
*/

// 2. Configuración para MySQL
/*
spring.datasource.url=jdbc:mysql://localhost:3306/your_database_name?useSSL=false&serverTimezone=UTC
spring.datasource.username=your_username
spring.datasource.password=your_password
spring.datasource.driverClassName=com.mysql.cj.jdbc.Driver
spring.jpa.database-platform=org.hibernate.dialect.MySQL8Dialect
*/

// 3. Configuración para PostgreSQL
/*
spring.datasource.url=jdbc:postgresql://localhost:5432/your_database_name
spring.datasource.username=your_username
spring.datasource.password=your_password
spring.datasource.driverClassName=org.postgresql.Driver
spring.jpa.database-platform=org.hibernate.dialect.PostgreSQLDialect
*/

/* Incorrecto:
   Olvidar la dependencia del driver JDBC en el pom.xml/build.gradle.
   Esto resultaría en un error de "driver no encontrado" al intentar conectar.
*/
/*
// Si intentas conectar a MySQL sin la dependencia:
// ERROR: Cannot find driver class com.mysql.cj.jdbc.Driver
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Persistencia de Datos',
    'topic': 'Bases de Datos',
    'subtopic': 'Configuración de DataSource y propiedades de conexión.',
    'definition': '''
Cuando hablamos de cómo tu aplicación Spring Boot se conecta realmente a una base de datos, el concepto clave es el `DataSource`. Piensa en un `DataSource` como una "fábrica" de conexiones a la base de datos. En lugar de que tu código abra y cierre conexiones directamente, el `DataSource` se encarga de gestionar un pool de conexiones para ti, lo que es mucho más eficiente y escalable.

Pensemos por un momento en por qué esto importa y por qué es mejor usar un `DataSource` que abrir conexiones a mano.

Abrir una nueva conexión a una base de datos es una operación costosa en términos de tiempo y recursos. Si cada vez que tu aplicación necesita hacer una consulta abre una nueva conexión, el rendimiento se degradaría rápidamente. Aquí es donde los `DataSource` (y específicamente los "connection pools" o piscinas de conexiones) brillan. Un `DataSource` mantiene un conjunto de conexiones a la base de datos listas para usar. Cuando tu aplicación necesita una conexión, el `DataSource` le presta una del pool. Cuando termina, la conexión se devuelve al pool en lugar de cerrarse, lista para ser reutilizada por otra parte de tu aplicación. Esto reduce la latencia y mejora el rendimiento general.

En Spring Boot, la configuración del `DataSource` es mayormente automática gracias a la auto-configuración. Simplemente necesitas proporcionar las propiedades de conexión en tu archivo `application.properties` o `application.yml`. Las propiedades más comunes son:

* **`spring.datasource.url`**: La URL de conexión a tu base de datos (por ejemplo, `jdbc:mysql://localhost:3306/mydb`).
* **`spring.datasource.username`**: El nombre de usuario para acceder a la base de datos.
* **`spring.datasource.password`**: La contraseña para el usuario.
* **`spring.datasource.driverClassName`**: El nombre completo de la clase del driver JDBC de tu base de datos (aunque Spring Boot a menudo lo deduce si tienes la dependencia correcta).

Además de estas básicas, hay otras propiedades importantes para el `DataSource`, especialmente si usas un connection pool como HikariCP (que es el pool por defecto en Spring Boot):

* **`spring.datasource.hikari.maximum-pool-size`**: El número máximo de conexiones que el pool puede mantener.
* **`spring.datasource.hikari.minimum-idle`**: El número mínimo de conexiones inactivas en el pool.
* **`spring.datasource.hikari.connection-timeout`**: El tiempo máximo que un cliente esperará por una conexión del pool.

Configurar estas propiedades de manera adecuada es crucial para el rendimiento y la estabilidad de tu aplicación, especialmente bajo carga. Spring Boot facilita mucho este proceso al proporcionarte un `DataSource` preconfigurado y optimizado con solo unas pocas líneas en tus archivos de propiedades.
''',
    'code_example': r'''
// Ejemplo de configuración de DataSource y HikariCP en application.yml

/*
spring:
  datasource:
    url: jdbc:postgresql://localhost:5432/my_database
    username: myuser
    password: mypassword
    driver-class-name: org.postgresql.Driver
    hikari: # Propiedades específicas para HikariCP, el pool de conexiones por defecto
      maximum-pool-size: 10 # Máximo de 10 conexiones en el pool
      minimum-idle: 5 # Mínimo de 5 conexiones inactivas en el pool
      connection-timeout: 30000 # 30 segundos para esperar una conexión
      idle-timeout: 600000 # 10 minutos de inactividad antes de cerrar una conexión
      max-lifetime: 1800000 # 30 minutos de vida máxima para una conexión
      pool-name: MySpringBootHikariPool # Nombre del pool para monitoreo
  jpa:
    hibernate:
      ddl-auto: update # Hibernate creará/actualizará el esquema de la base de datos
    show-sql: true # Muestra las sentencias SQL generadas por Hibernate en la consola
    properties:
      hibernate.dialect: org.hibernate.dialect.PostgreSQLDialect # Dialecto de la base de datos
      hibernate.format_sql: true # Formatea el SQL para que sea más legible
*/

// Para acceso a las propiedades en código (no es necesario para la configuración automática)
/*
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class DatabaseConfig {

    @Value("${spring.datasource.url}")
    private String dbUrl;

    @Value("${spring.datasource.username}")
    private String dbUsername;

    // ... otras propiedades

    public void printDbInfo() {
        System.out.println("DB URL: " + dbUrl);
        System.out.println("DB User: " + dbUsername);
    }
}
*/

/* Incorrecto:
   Intentar manejar las conexiones a la base de datos manualmente en tu código
   sin un DataSource o Connection Pool. Esto llevaría a problemas de rendimiento
   y gestión de recursos en una aplicación real.
*/
/*
// BAD PRACTICE: No hagas esto en una aplicación Spring Boot real
public Connection getManualConnection() {
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "user", "pass");
    } catch (Exception e) {
        e.printStackTrace();
        return null;
    }
}
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Persistencia de Datos',
    'topic': 'Pruebas Unitarias',
    'subtopic': 'Uso de JUnit y Mockito para pruebas de componentes.',
    'definition': '''
Las pruebas unitarias son una parte esencial del desarrollo de software de calidad. Son pequeñas pruebas que verifican el comportamiento de unidades de código individuales (como una clase o un método) de forma aislada. Para esto, en el ecosistema Spring Boot, las herramientas más populares y potentes son JUnit (el framework de pruebas) y Mockito (para crear objetos "mock").

¿Te estás preguntando por qué esto importa y por qué no es suficiente con probar la aplicación manualmente? Aquí te va la aclaración:

Las pruebas unitarias son cruciales porque te permiten:
* **Detectar errores tempranamente**: Es más fácil y barato corregir un error justo después de escribir el código que cuando ya está integrado con otras partes del sistema.
* **Garantizar la calidad del código**: Aseguran que cada parte de tu aplicación se comporta como esperas.
* **Facilitar la refactorización**: Si necesitas cambiar el código, las pruebas unitarias te dan la confianza de que no estás rompiendo funcionalidades existentes.
* **Documentar el código**: Las pruebas unitarias son una excelente forma de documentar cómo se supone que funciona una parte del código.

**JUnit 5** es el framework de pruebas estándar en Java. Te proporciona las anotaciones (`@Test`, `@BeforeEach`, `@DisplayName`, etc.) y las aserciones (`assertEquals`, `assertTrue`, etc.) que necesitas para escribir tus casos de prueba.

**Mockito** es una biblioteca para crear "mocks" (objetos simulados). Cuando estás probando una unidad de código, a menudo esa unidad depende de otras unidades. Mockito te permite simular el comportamiento de esas dependencias para que puedas probar tu unidad de forma aislada. Por ejemplo, si estás probando un servicio que usa un repositorio para acceder a la base de datos, no quieres que tu prueba unitaria realmente acceda a la base de datos. Con Mockito, puedes crear un "mock" del repositorio y decirle cómo debe comportarse (qué devolver cuando se le llama a un método específico). Esto hace que tus pruebas sean más rápidas, más fiables y verdaderamente "unitarias". En el mundo real, empresas como Google o Amazon invierten mucho en pruebas unitarias para asegurar la calidad de sus miles de microservicios, y herramientas como JUnit y Mockito son el pan de cada día para sus desarrolladores.
''',
    'code_example': r'''
// Ejemplo de prueba unitaria con JUnit y Mockito para una clase de servicio

package com.example.demo.service;

import com.example.demo.model.User;
import com.example.demo.repository.UserRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*; // Para 'when' y 'verify'

// Indica a JUnit que use las extensiones de Mockito
@ExtendWith(MockitoExtension.class)
class UserServiceTest {

    @Mock // Crea un mock de UserRepository
    private UserRepository userRepository;

    @InjectMocks // Inyecta el mock de UserRepository en UserService
    private UserService userService;

    // Se ejecuta antes de cada método de prueba
    @BeforeEach
    void setUp() {
        // Opcional: configurar comportamientos por defecto para los mocks si es necesario
    }

    @Test // Marca este método como una prueba unitaria
    @DisplayName("Debería encontrar un usuario por ID existente")
    void shouldFindUserByIdWhenExists() {
        // 1. Given (Dado) - Preparar los datos de prueba
        Long userId = 1L;
        User mockUser = new User("John Doe", 30);
        mockUser.setId(userId);

        // Configurar el comportamiento del mock de UserRepository
        // Cuando se llame a userRepository.findById(userId), debe devolver un Optional con mockUser
        when(userRepository.findById(userId)).thenReturn(Optional.of(mockUser));

        // 2. When (Cuando) - Ejecutar el método que estamos probando
        Optional<User> foundUser = userService.getUserById(userId);

        // 3. Then (Entonces) - Verificar el resultado
        assertTrue(foundUser.isPresent(), "El usuario debería estar presente");
        assertEquals("John Doe", foundUser.get().getName(), "El nombre del usuario debe coincidir");
        assertEquals(30, foundUser.get().getAge(), "La edad del usuario debe coincidir");

        // Verificar que el método findById del repositorio fue llamado exactamente una vez con el ID correcto
        verify(userRepository, times(1)).findById(userId);
    }

    @Test
    @DisplayName("No debería encontrar un usuario por ID inexistente")
    void shouldNotFindUserByIdWhenNotExists() {
        // 1. Given
        Long userId = 99L;
        // Cuando se llame a userRepository.findById(userId), debe devolver un Optional vacío
        when(userRepository.findById(userId)).thenReturn(Optional.empty());

        // 2. When
        Optional<User> foundUser = userService.getUserById(userId);

        // 3. Then
        assertFalse(foundUser.isPresent(), "El usuario no debería estar presente");
        verify(userRepository, times(1)).findById(userId);
    }

    /* Incorrecto:
       No usar mocks y depender de una base de datos real para pruebas unitarias de servicio.
       Esto hace que las pruebas sean lentas, poco fiables (dependen del estado de la DB)
       y no verdaderamente "unitarias" (prueban más de una unidad de código).
    */
    /*
    @Test
    void shouldCreateUserWithRealDbConnection() {
        // Esto NO es una prueba unitaria. Requiere una DB real.
        // UserRepository realRepository = new RealUserRepository(); // NO HACER ESTO
        // UserService userService = new UserService(realRepository);
        // ... prueba ...
    }
    */
}

// Clase User (asumiendo que existe)
/*
package com.example.demo.model;

public class User {
    private Long id;
    private String name;
    private int age;

    public User(String name, int age) {
        this.name = name;
        this.age = age;
    }
    // Getters y setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }
}
*/

// Clase UserService (asumiendo que existe)
/*
package com.example.demo.service;

import com.example.demo.model.User;
import com.example.demo.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public Optional<User> getUserById(Long id) {
        return userRepository.findById(id);
    }

    public User createUser(User user) {
        return userRepository.save(user);
    }
}
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Persistencia de Datos',
    'topic': 'Pruebas Unitarias',
    'subtopic': 'Pruebas de repositorios y servicios.',
    'definition': '''
Continuando con las pruebas unitarias, es importante saber cómo probar diferentes capas de tu aplicación. En Spring Boot, las capas más comunes que probamos son los repositorios (la capa de acceso a datos) y los servicios (la capa de lógica de negocio). Aunque usamos JUnit y Mockito para ambos, la forma en que los probamos tiene sus particularidades.

Esto tiene una explicación, y es porque:

**Pruebas de Repositorios:**
Cuando pruebas un repositorio, tu objetivo principal es verificar que las operaciones de persistencia (guardar, buscar, actualizar, eliminar) interactúan correctamente con la base de datos. Para esto, en lugar de usar mocks de la base de datos, a menudo se usa una base de datos en memoria (como H2) para que las pruebas sean rápidas, aisladas y no necesiten una configuración de base de datos externa. Spring Boot facilita esto con anotaciones como `@DataJpaTest`. Esta anotación:
* Configura automáticamente un `DataSource` en memoria.
* Configura Spring Data JPA.
* Carga solo los beans relacionados con la capa de persistencia, haciendo las pruebas más ligeras.
* Es transaccional, lo que significa que después de cada prueba, los cambios en la base de datos se revierten, asegurando que cada prueba se ejecuta en un estado limpio.

**Pruebas de Servicios:**
Las pruebas de la capa de servicio se centran en la lógica de negocio. Como vimos en el subtema anterior, aquí es donde Mockito es fundamental. Un servicio a menudo depende de uno o más repositorios para obtener y guardar datos, pero en una prueba de servicio, no queremos involucrar la base de datos real. Por eso, "mockeamos" los repositorios. Esto nos permite:
* **Aislar la prueba**: Nos aseguramos de que solo estamos probando la lógica del servicio, no la interacción con la base de datos (que ya se prueba en el repositorio).
* **Controlar el comportamiento**: Podemos simular diferentes escenarios (repositorio devuelve datos, no devuelve datos, lanza una excepción) para probar todas las ramas de la lógica del servicio.
* **Rapidez**: Las pruebas de servicio con mocks son extremadamente rápidas porque no hay interacción real con la red o el disco.

En resumen, para los repositorios, a menudo usamos una base de datos en memoria para probar la integración con JPA. Para los servicios, mockeamos sus dependencias (como los repositorios) para enfocarnos puramente en la lógica de negocio. Esta combinación asegura una cobertura de pruebas efectiva en tu aplicación Spring Boot.
''',
    'code_example': r'''
// Ejemplo de pruebas de repositorio y servicio con Spring Boot Test, JUnit y Mockito

package com.example.demo.testing;

import com.example.demo.model.User;
import com.example.demo.repository.UserRepository;
import com.example.demo.service.UserService;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.context.annotation.Import; // Para importar configuraciones adicionales en DataJpaTest

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import java.util.Optional;

// --- 1. Prueba de Repositorio (@DataJpaTest) ---
// Utiliza una base de datos en memoria (como H2) y configura solo la capa JPA.
@DataJpaTest
@DisplayName("Pruebas de Repositorio de Usuarios")
class UserRepositoryTest {

    @Autowired // Inyecta el repositorio que Spring Data JPA ha creado
    private UserRepository userRepository;

    @Autowired // Utilidad para interactuar con la base de datos de prueba
    private TestEntityManager entityManager;

    @Test
    @DisplayName("Debería guardar y encontrar un usuario")
    void shouldSaveAndFindUser() {
        // Given
        User newUser = new User("Alice", 25);

        // When
        User savedUser = userRepository.save(newUser); // Guarda en la DB en memoria
        Optional<User> foundUser = userRepository.findById(savedUser.getId());

        // Then
        assertTrue(foundUser.isPresent());
        assertEquals("Alice", foundUser.get().getName());
        assertEquals(25, foundUser.get().getAge());
    }

    @Test
    @DisplayName("Debería encontrar un usuario por nombre personalizado")
    void shouldFindUserByName() {
        // Given
        User alice = new User("Alice", 25);
        entityManager.persistAndFlush(alice); // Guarda en la DB y sincroniza

        // When
        Optional<User> foundUser = userRepository.findByName("Alice");

        // Then
        assertTrue(foundUser.isPresent());
        assertEquals(alice.getName(), foundUser.get().getName());
    }

    /* Incorrecto:
       No usar @DataJpaTest o configurar una DB real para pruebas de repositorio.
       Esto ralentizaría las pruebas y las haría dependientes de un entorno externo.
    */
    /*
    @Test // Esta prueba sería lenta y no unitaria si usara una DB real
    void shouldFindUserWithRealDb() {
        // User realUser = userRepository.findById(1L).orElse(null);
    }
    */
}


// --- 2. Prueba de Servicio (con Mockito) ---
// Utiliza mocks para aislar la lógica de negocio del servicio de sus dependencias.
@ExtendWith(MockitoExtension.class)
@DisplayName("Pruebas de Servicio de Usuarios")
class UserServiceBusinessLogicTest {

    @Mock // Mockea la dependencia UserRepository
    private UserRepository userRepository;

    @InjectMocks // Inyecta el mock en la instancia de UserService
    private UserService userService;

    @Test
    @DisplayName("Debería crear un usuario válido")
    void shouldCreateValidUser() {
        // Given
        User newUser = new User("Bob", 28);
        User savedUser = new User("Bob", 28);
        savedUser.setId(1L);

        // Cuando se llame a userRepository.save(cualquierUser), devolver savedUser
        when(userRepository.save(any(User.class))).thenReturn(savedUser);

        // When
        User createdUser = userService.createUser(newUser);

        // Then
        assertNotNull(createdUser.getId());
        assertEquals("Bob", createdUser.getName());
        // Verificar que el método save del repositorio fue llamado exactamente una vez
        verify(userRepository, times(1)).save(newUser);
    }

    @Test
    @DisplayName("Debería lanzar excepción si la edad es inválida al crear usuario")
    void shouldThrowExceptionWhenAgeIsInvalid() {
        // Given
        User invalidUser = new User("Charlie", 15); // Edad inválida

        // When & Then
        // Verifica que se lanza una IllegalArgumentException
        IllegalArgumentException thrown = assertThrows(
            IllegalArgumentException.class,
            () -> userService.createUser(invalidUser),
            "Se esperaba una IllegalArgumentException para edad inválida"
        );
        assertEquals("El usuario debe ser mayor de edad.", thrown.getMessage());

        // Verificar que el método save NUNCA fue llamado porque la validación falló
        verify(userRepository, never()).save(any(User.class));
    }
}
'''
  });
}

Future<void> insertSpringbootJrLevel4Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Manejo de Errores y Excepciones',
    'topic': 'Gestión de Excepciones',
    'subtopic': 'Uso de @ControllerAdvice y @ExceptionHandler.',
    'definition': '''
Cuando creamos APIs, es inevitable que ocurran errores. Un cliente puede enviar datos incorrectos, un recurso no encontrado, o incluso fallas internas del servidor. Para que nuestra API sea robusta y amigable, necesitamos manejar estas situaciones de forma elegante y consistente, y aquí es donde las anotaciones `@ControllerAdvice` y `@ExceptionHandler` de Spring Boot brillan.

¿Te estás preguntando por qué esto importa y cómo nos ayuda a evitar que los errores arruinen la experiencia de tu usuario?

Sin una gestión de excepciones adecuada, un error en tu código podría terminar mostrando un mensaje de error feo y confuso al usuario final, o incluso detalles internos de tu sistema que podrían ser una vulnerabilidad. Las anotaciones `@ControllerAdvice` y `@ExceptionHandler` nos permiten interceptar las excepciones que se lanzan en nuestra aplicación y convertirlas en respuestas HTTP significativas y estructuradas.

* **`@ExceptionHandler`**: Esta anotación se usa a nivel de método dentro de un controlador o, más comúnmente, dentro de una clase `@ControllerAdvice`. Su propósito es capturar una excepción específica. Cuando una excepción del tipo que especifiques ocurre en tu aplicación, el método anotado con `@ExceptionHandler` se ejecutará. Dentro de este método, puedes procesar la excepción, loguearla y construir una `ResponseEntity` con un código de estado HTTP adecuado (por ejemplo, 404 Not Found, 400 Bad Request, 500 Internal Server Error) y un cuerpo de respuesta informativo (como un JSON con un mensaje de error claro).

* **`@ControllerAdvice` (o `@RestControllerAdvice`)**: Imagina que tienes muchos controladores en tu aplicación, y quieres que todos manejen las mismas excepciones de la misma manera. En lugar de repetir el código `@ExceptionHandler` en cada controlador, usas `@ControllerAdvice`. Esta anotación se aplica a una clase completa y la convierte en un "asesor" global para todos tus controladores. Cualquier método `@ExceptionHandler` dentro de una clase `@ControllerAdvice` interceptará las excepciones lanzadas por cualquier controlador en tu aplicación. Esto es fundamental para tener un manejo de errores centralizado y consistente, asegurando que todas las respuestas de error de tu API sigan un formato uniforme, lo que facilita mucho la vida de los clientes que consumen tu API. Es la estrategia estándar para una buena API.
''',
    'code_example': r'''
// Ejemplo de uso de @ControllerAdvice y @ExceptionHandler para manejo global de errores

package com.example.demo.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;
import java.util.NoSuchElementException; // Una excepción común para "no encontrado"

// 1. Un controlador simple que podría lanzar excepciones
@RestController
class ProductController {

    @GetMapping("/products/{id}")
    public String getProduct(@PathVariable Long id) {
        if (id == 99L) {
            throw new NoSuchElementException("Producto con ID " + id + " no encontrado.");
        }
        if (id < 0) {
            throw new IllegalArgumentException("El ID del producto no puede ser negativo.");
        }
        return "Detalles del producto " + id;
    }
}

// 2. La clase @RestControllerAdvice para manejar excepciones globalmente
@RestControllerAdvice // Combina @ControllerAdvice y @ResponseBody
public class GlobalExceptionHandler {

    // Maneja NoSuchElementException y devuelve 404 Not Found
    @ExceptionHandler(NoSuchElementException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND) // Define el código de estado HTTP
    public ErrorResponse handleNotFoundException(NoSuchElementException ex) {
        return new ErrorResponse(HttpStatus.NOT_FOUND.value(), ex.getMessage(), System.currentTimeMillis());
    }

    // Maneja IllegalArgumentException y devuelve 400 Bad Request
    @ExceptionHandler(IllegalArgumentException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST) // Define el código de estado HTTP
    public ErrorResponse handleBadRequestException(IllegalArgumentException ex) {
        return new ErrorResponse(HttpStatus.BAD_REQUEST.value(), ex.getMessage(), System.currentTimeMillis());
    }

    // Maneja excepciones de validación (@Valid) y devuelve 400 Bad Request con detalles
    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public Map<String, String> handleValidationExceptions(MethodArgumentNotValidException ex) {
        Map<String, String> errors = new HashMap<>();
        ex.getBindingResult().getFieldErrors().forEach(error ->
            errors.put(error.getField(), error.getDefaultMessage()));
        return errors;
    }

    // Maneja cualquier otra excepción no capturada y devuelve 500 Internal Server Error
    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public ErrorResponse handleGenericException(Exception ex) {
        // En un entorno real, no exponer el mensaje de excepción exacto
        return new ErrorResponse(HttpStatus.INTERNAL_SERVER_ERROR.value(), "Ocurrió un error interno del servidor.", System.currentTimeMillis());
    }

    // Clase auxiliar para la respuesta de error
    static class ErrorResponse {
        private int status;
        private String message;
        private long timestamp;

        public ErrorResponse(int status, String message, long timestamp) {
            this.status = status;
            this.message = message;
            this.timestamp = timestamp;
        }

        // Getters (omitidos para brevedad)
        public int getStatus() { return status; }
        public String getMessage() { return message; }
        public long getTimestamp() { return timestamp; }
    }
}

/* Incorrecto (o al menos no la mejor práctica):
   Manejar excepciones con bloques try-catch extensos en cada método del controlador,
   o dejar que las excepciones se propaguen sin una respuesta HTTP significativa.
*/
/*
@RestController
class BadProductController {
    @GetMapping("/bad-products/{id}")
    public String getBadProduct(@PathVariable Long id) {
        try {
            if (id == 99L) {
                throw new RuntimeException("Producto no encontrado.");
            }
            return "Producto OK.";
        } catch (RuntimeException e) {
            // Esto devuelve un 200 OK con un string, no un 404
            return "ERROR: " + e.getMessage();
        }
    }
}
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Manejo de Errores y Excepciones',
    'topic': 'Gestión de Excepciones',
    'subtopic': 'Creación de clases de excepción personalizadas.',
    'definition': '''
Aunque Spring Boot y Java nos dan muchas excepciones estándar (`NullPointerException`, `IllegalArgumentException`, etc.), a menudo, en nuestras aplicaciones, necesitamos errores más específicos que reflejen la lógica de negocio. Aquí es donde la creación de nuestras propias clases de excepción personalizadas se vuelve muy útil.

Vamos a ver de que se trata todo esto y por qué te convendría crear tus propias excepciones.

Imagínate que estás construyendo una tienda online. Si un usuario intenta comprar un producto que no tiene suficiente stock, o si intenta acceder a un pedido que no le pertenece, las excepciones estándar de Java quizás no comuniquen claramente lo que pasó. Una excepción personalizada, como `ProductNotFoundException` o `InsufficientStockException`, es mucho más descriptiva.

Las principales razones para crear excepciones personalizadas son:
* **Claridad de la lógica de negocio**: Tu código se vuelve más legible y expresa mejor lo que está pasando. Cuando ves un `ProductNotFoundException`, sabes exactamente qué error ocurrió.
* **Manejo específico de errores**: En tus `@ExceptionHandler` (tanto en el controlador como en `@ControllerAdvice`), puedes crear manejadores específicos para tus excepciones personalizadas, devolviendo respuestas HTTP y mensajes de error muy precisos al cliente. Por ejemplo, `ProductNotFoundException` siempre podría mapearse a un `404 Not Found`, mientras que `InsufficientStockException` podría mapearse a un `400 Bad Request` con un mensaje específico sobre el stock.
* **Separación de preocupaciones**: Mantienes los errores de negocio separados de los errores técnicos o de sistema.

Al crear una excepción personalizada, generalmente extiendes de `RuntimeException` (si es una excepción no verificada que no necesitas capturar explícitamente) o `Exception` (si es una excepción verificada que el compilador te obligará a manejar). Es buena práctica incluir un constructor que acepte un mensaje para describir el problema. Las empresas con APIs grandes y complejas, como las de servicios financieros o de comercio electrónico, utilizan extensivamente excepciones personalizadas para dar un feedback muy preciso a los desarrolladores que consumen sus APIs.
''',
    'code_example': r'''
// Ejemplo de creación y uso de excepciones personalizadas

package com.example.demo.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

// 1. Creación de una excepción personalizada para "Recurso no encontrado"
@ResponseStatus(HttpStatus.NOT_FOUND) // Opcional: Define el HttpStatus por defecto para esta excepción
class ResourceNotFoundException extends RuntimeException {
    public ResourceNotFoundException(String message) {
        super(message);
    }
}

// 2. Creación de una excepción personalizada para "Validación de negocio fallida"
@ResponseStatus(HttpStatus.BAD_REQUEST) // Opcional: Define el HttpStatus por defecto para esta excepción
class InvalidOperationException extends RuntimeException {
    public InvalidOperationException(String message) {
        super(message);
    }
}

// 3. Un servicio que puede lanzar las excepciones personalizadas
class OrderService {
    public String getOrderDetails(Long orderId) {
        if (orderId == 100L) {
            throw new ResourceNotFoundException("Pedido con ID " + orderId + " no encontrado.");
        }
        if (orderId == 200L) {
            throw new InvalidOperationException("Operación no permitida para el pedido " + orderId);
        }
        return "Detalles del pedido " + orderId;
    }
}

// 4. Controlador que utiliza el servicio y confía en el @ControllerAdvice
@RestController
class OrderController {

    private final OrderService orderService = new OrderService(); // Simulación de inyección

    @GetMapping("/orders/{id}")
    public String getOrder(@PathVariable Long id) {
        return orderService.getOrderDetails(id);
    }
}

// 5. El @RestControllerAdvice para manejar las excepciones personalizadas
@RestControllerAdvice
class CustomExceptionHandler {

    // Maneja ResourceNotFoundException, el @ResponseStatus de la excepción la mapea a 404
    @ExceptionHandler(ResourceNotFoundException.class)
    public ErrorResponse handleResourceNotFoundException(ResourceNotFoundException ex) {
        return new ErrorResponse(HttpStatus.NOT_FOUND.value(), ex.getMessage(), System.currentTimeMillis());
    }

    // Maneja InvalidOperationException, el @ResponseStatus de la excepción la mapea a 400
    @ExceptionHandler(InvalidOperationException.class)
    public ErrorResponse handleInvalidOperationException(InvalidOperationException ex) {
        return new ErrorResponse(HttpStatus.BAD_REQUEST.value(), ex.getMessage(), System.currentTimeMillis());
    }

    // Clase auxiliar para la respuesta de error (igual que en el subtema anterior)
    static class ErrorResponse {
        private int status;
        private String message;
        private long timestamp;

        public ErrorResponse(int status, String message, long timestamp) {
            this.status = status;
            this.message = message;
            this.timestamp = timestamp;
        }
        public int getStatus() { return status; }
        public String getMessage() { return message; }
        public long getTimestamp() { return timestamp; }
    }
}

/* Incorrecto:
   Lanzar excepciones genéricas como RuntimeException cuando una excepción personalizada
   sería más descriptiva del problema de negocio.
*/
/*
// En OrderService
// public String getOrderDetails(Long orderId) {
//     if (orderId == 100L) {
//         throw new RuntimeException("Error genérico: Pedido no encontrado."); // Menos informativo
//     }
//     return "Detalles...";
// }
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Manejo de Errores y Excepciones',
    'topic': 'Respuestas Personalizadas',
    'subtopic': 'Estructuración de mensajes de error.',
    'definition': '''
Cuando nuestra API encuentra un problema, ya sea por datos inválidos, un recurso no encontrado o un fallo interno, no es suficiente con solo devolver un código de estado HTTP. Los clientes de nuestra API (otras aplicaciones, frontends móviles o web) necesitan saber qué salió mal para poder reaccionar adecuadamente. Aquí es donde entra la importancia de estructurar los mensajes de error de manera clara y consistente.

¿Te estás preguntando por qué esto importa y cómo nos ayuda a simplificar la configuración?

Un buen mensaje de error no es solo un `String` genérico como "Error". Debería proporcionar suficiente información para que el cliente entienda el problema y, si es posible, cómo solucionarlo. Piensa en el desarrollador que consume tu API: un mensaje bien estructurado le ahorrará horas de depuración.

Generalmente, estructuramos los mensajes de error en un objeto JSON con campos comunes como:

* **`timestamp`**: La fecha y hora en que ocurrió el error. Útil para registrar y depurar.
* **`status`**: El código de estado HTTP (por ejemplo, `404`, `500`).
* **`error`**: Una breve descripción del tipo de error (por ejemplo, "Not Found", "Bad Request").
* **`message`**: Un mensaje más detallado y legible para el humano sobre la causa del error.
* **`path`**: La ruta de la URL que causó el error.
* **`details`**: Campo opcional que puede contener un array de errores específicos (por ejemplo, para errores de validación, listando cada campo que falló y por qué).

Al tener un formato de error estandarizado, los clientes de tu API pueden parsear la respuesta y mostrar mensajes útiles al usuario final, o tomar decisiones programáticas basadas en el tipo de error. Por ejemplo, si una validación de un formulario falla, el frontend puede extraer los detalles del error para mostrar un mensaje al lado de cada campo inválido. Esto es crucial en arquitecturas de microservicios, donde múltiples APIs necesitan comunicarse de forma predecible sobre los errores.
''',
    'code_example': r'''
// Ejemplo de una clase para estructurar mensajes de error y cómo se usaría

package com.example.demo.error;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.http.HttpStatus;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

// Clase para un mensaje de error estandarizado
class ApiError {
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy hh:mm:ss")
    private LocalDateTime timestamp;
    private int status;
    private String error; // Ej: "Bad Request"
    private String message; // Mensaje descriptivo
    private String path; // Ruta de la petición
    private Map<String, String> errors; // Opcional: para errores de validación por campo

    public ApiError() {
        timestamp = LocalDateTime.now();
    }

    public ApiError(HttpStatus status, String message, String path) {
        this();
        this.status = status.value();
        this.error = status.getReasonPhrase();
        this.message = message;
        this.path = path;
    }

    public ApiError(HttpStatus status, String message, String path, Map<String, String> errors) {
        this(status, message, path);
        this.errors = errors;
    }

    // Getters y Setters (omitidos para brevedad)
    public LocalDateTime getTimestamp() { return timestamp; }
    public void setTimestamp(LocalDateTime timestamp) { this.timestamp = timestamp; }
    public int getStatus() { return status; }
    public void setStatus(int status) { this.status = status; }
    public String getError() { return error; }
    public void setError(String error) { this.error = error; }
    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }
    public String getPath() { return path; }
    public void setPath(String path) { this.path = path; }
    public Map<String, String> getErrors() { return errors; }
    public void setErrors(Map<String, String> errors) { this.errors = errors; }
}

// Ejemplo de uso en un @ControllerAdvice
/*
package com.example.demo.exception;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.context.request.WebRequest;

import java.util.HashMap;
import java.util.Map;

@ControllerAdvice
public class CustomGlobalExceptionHandler {

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<Object> handleValidationErrors(MethodArgumentNotValidException ex, WebRequest request) {
        Map<String, String> errors = new HashMap<>();
        ex.getBindingResult().getAllErrors().forEach(error -> {
            String fieldName = ((FieldError) error).getField();
            String errorMessage = error.getDefaultMessage();
            errors.put(fieldName, errorMessage);
        });

        String requestPath = ((ServletWebRequest) request).getRequest().getRequestURI();
        ApiError apiError = new ApiError(HttpStatus.BAD_REQUEST, "Error de validación", requestPath, errors);
        return new ResponseEntity<>(apiError, new HttpHeaders(), HttpStatus.BAD_REQUEST);
    }

    // ... otros @ExceptionHandler para otras excepciones, devolviendo ApiError
}
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Manejo de Errores y Excepciones',
    'topic': 'Respuestas Personalizadas',
    'subtopic': 'Uso de ResponseEntity para respuestas HTTP.',
    'definition': '''
Cuando construyes una API REST con Spring Boot, no solo devuelves datos, sino que también necesitas controlar la respuesta HTTP completa: el código de estado, las cabeceras y el cuerpo de la respuesta. Aquí es donde `ResponseEntity` se convierte en una herramienta indispensable.

Vamos a ver de que se trata todo esto y por qué es tan útil para construir APIs robustas.

`ResponseEntity` es una clase de Spring Framework que representa la respuesta HTTP completa, incluyendo el cuerpo, las cabeceras y el código de estado. Mientras que en un `@RestController` normalmente solo devuelves el objeto que quieres que se convierta en JSON (y Spring se encarga del resto), `ResponseEntity` te da un control mucho más fino sobre la respuesta.

Piensa que con `ResponseEntity` puedes:
* **Devolver cualquier código de estado HTTP**: No solo 200 OK. Puedes devolver 201 Created (para recursos creados), 204 No Content (para eliminaciones exitosas sin contenido de retorno), 404 Not Found, 400 Bad Request, 500 Internal Server Error, etc. Esto es crucial para que los clientes de tu API entiendan el resultado de su petición.
* **Añadir cabeceras HTTP personalizadas**: Necesitas, por ejemplo, añadir una cabecera `Location` cuando creas un recurso para indicar la URL del nuevo recurso. `ResponseEntity` te permite hacerlo fácilmente.
* **Controlar el cuerpo de la respuesta**: Puedes devolver cualquier objeto en el cuerpo, o incluso un cuerpo vacío si el código de estado lo requiere.

El uso de `ResponseEntity` es una práctica estándar en Spring Boot para construir APIs REST que siguen las mejores prácticas. Te permite ser explícito sobre el resultado de tus operaciones y comunicarte de manera efectiva con los clientes de tu API. Es la herramienta que te da el control total sobre lo que tu API le dice al mundo exterior.
''',
    'code_example': r'''
// Ejemplo de uso de ResponseEntity para respuestas HTTP personalizadas

package com.example.demo.controller;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.util.ArrayList;
import java.util.List;

class User {
    private Long id;
    private String name;
    private int age;

    public User(Long id, String name, int age) {
        this.id = id;
        this.name = name;
        this.age = age;
    }
    // Getters y Setters (omitidos para brevedad)
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }
}

@RestController
public class CustomResponseController {

    private List<User> users = new ArrayList<>(); // Simulación de una base de datos en memoria
    private Long nextId = 1L;

    public CustomResponseController() {
        users.add(new User(nextId++, "Alice", 30));
        users.add(new User(nextId++, "Bob", 25));
    }

    @PostMapping("/api/users")
    public ResponseEntity<User> createUser(@RequestBody User newUser) {
        newUser.setId(nextId++);
        users.add(newUser);

        // Construye la URI del nuevo recurso para la cabecera Location (buenas prácticas REST)
        URI location = ServletUriComponentsBuilder.fromCurrentRequest()
                .path("/{id}")
                .buildAndExpand(newUser.getId())
                .toUri();

        // Devuelve 201 Created con el nuevo usuario en el cuerpo y la cabecera Location
        return ResponseEntity.created(location).body(newUser);
    }

    @GetMapping("/api/users/{id}")
    public ResponseEntity<User> getUserById(@PathVariable Long id) {
        return users.stream()
                .filter(user -> user.getId().equals(id))
                .findFirst()
                // Si el usuario existe, devuelve 200 OK con el usuario
                .map(user -> ResponseEntity.ok(user))
                // Si no existe, devuelve 404 Not Found (sin cuerpo)
                .orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/api/users/{id}")
    public ResponseEntity<Void> deleteUser(@PathVariable Long id) {
        boolean removed = users.removeIf(user -> user.getId().equals(id));
        if (removed) {
            // Si se eliminó exitosamente, devuelve 204 No Content
            return ResponseEntity.noContent().build();
        } else {
            // Si no se encontró el usuario para eliminar, devuelve 404 Not Found
            return ResponseEntity.notFound().build();
        }
    }

    /* Incorrecto (o al menos menos controlable):
       Devolver directamente el objeto sin ResponseEntity cuando necesitas controlar
       el código de estado HTTP o añadir cabeceras.
    */
    /*
    @PostMapping("/api/products-less-control")
    public Product createProductLessControl(@RequestBody Product newProduct) {
        // Esto devolverá 200 OK por defecto, aunque un 201 Created sería más apropiado.
        // No se puede añadir cabeceras de Location fácilmente aquí.
        // return productService.save(newProduct);
        return new Product("Laptop", 1200.0); // Simulación
    }
    */
}
'''
  });
}

Future<void> insertSpringbootJrLevel5Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Documentación de APIs',
    'topic': 'Swagger/OpenAPI',
    'subtopic': 'Integración de Swagger en proyectos Spring Boot.',
    'definition': '''
Cuando construyes una API REST, es crucial que esté bien documentada para que otros desarrolladores (y tú mismo en el futuro) puedan entender cómo usarla. Aquí es donde Swagger (ahora parte de OpenAPI Specification) se vuelve una herramienta indispensable. Swagger te permite integrar documentación interactiva directamente en tus proyectos Spring Boot.

¿Te estás preguntando por qué esto importa y cómo nos ayuda a simplificar la configuración?

Sin una buena documentación, una API es como un libro cerrado: nadie sabe cómo usarla. Tradicionalmente, documentar una API era un proceso manual, propenso a errores y a desactualizarse. Swagger/OpenAPI cambia esto drásticamente. Al integrar Swagger en tu proyecto Spring Boot, puedes:

* **Generar documentación automáticamente**: Basándose en tus controladores y anotaciones de Spring, Swagger puede crear un documento de API (en formato JSON o YAML) que describe todos tus endpoints, parámetros, modelos de datos y respuestas.
* **Proveer una UI interactiva**: Además del documento, Swagger UI te ofrece una interfaz web amigable donde puedes ver la documentación de tu API, probar los endpoints directamente desde el navegador y ver las respuestas en tiempo real. Esto es una maravilla para los desarrolladores que consumen tu API.
* **Mantener la documentación actualizada**: Dado que la documentación se genera a partir de tu código, se mantiene más fácilmente sincronizada con los cambios de tu API.

Para integrar Swagger en un proyecto Spring Boot, típicamente usas una biblioteca como Springdoc OpenAPI. Simplemente añades la dependencia necesaria, y con un mínimo de configuración, ya tienes una interfaz Swagger UI disponible en tu aplicación. Esto no solo mejora la experiencia de los desarroll desarrolladores, sino que también acelera la integración de tu API con otras aplicaciones. Grandes empresas que tienen múltiples APIs, como Google o Stripe, utilizan especificaciones similares para garantizar que sus APIs sean fácilmente consumibles por sus socios y desarrolladores.
''',
    'code_example': r'''
// Ejemplo de integración de Springdoc OpenAPI (Swagger) en un proyecto Spring Boot

// 1. Añadir la dependencia en tu pom.xml (Maven):
/*
<dependency>
    <groupId>org.springdoc</groupId>
    <artifactId>springdoc-openapi-starter-webmvc-ui</artifactId>
    <version>2.5.0</version> </dependency>
*/

// 2. Configuración opcional en application.properties (o .yml)
// Puedes personalizar la información de la API, el título, la descripción, etc.
/*
springdoc.swagger-ui.path=/swagger-ui.html # URL para acceder a la UI de Swagger
springdoc.api-docs.path=/v3/api-docs # URL para el JSON de la especificación OpenAPI
springdoc.packages-to-scan=com.example.demo.controller # Escanea solo tus controladores
springdoc.paths-to-match=/api/** # Solo documenta rutas que empiezan con /api/

# Información de la API (opcional)
springdoc.info.title=Mi API de Usuarios
springdoc.info.version=1.0
springdoc.info.description=API REST para la gestión de usuarios
springdoc.info.terms-of-service=http://swagger.io/terms/
springdoc.info.contact.name=Tu Nombre
springdoc.info.contact.url=https://tu-sitio.com
springdoc.info.contact.email=tu.email@example.com
springdoc.info.license.name=Apache 2.0
springdoc.info.license.url=http://springdoc.org
*/

// 3. Crear un controlador REST (ya con tus anotaciones normales de Spring)
// Springdoc OpenAPI las leerá automáticamente
/*
package com.example.demo.controller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.ArrayList;

@RestController
@RequestMapping("/api/users")
@Tag(name = "Gestión de Usuarios", description = "Operaciones CRUD para usuarios") // Etiqueta para agrupar endpoints en Swagger UI
public class UserController {

    private List<User> users = new ArrayList<>(); // Simulación
    private Long nextId = 1L;

    @Operation(summary = "Obtener todos los usuarios", description = "Devuelve una lista de todos los usuarios registrados.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Lista de usuarios obtenida con éxito"),
            @ApiResponse(responseCode = "500", description = "Error interno del servidor")
    })
    @GetMapping
    public List<User> getAllUsers() {
        return users;
    }

    @Operation(summary = "Crear un nuevo usuario", description = "Crea un nuevo usuario en la base de datos.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "201", description = "Usuario creado con éxito"),
            @ApiResponse(responseCode = "400", description = "Datos de usuario inválidos"),
            @ApiResponse(responseCode = "500", description = "Error interno del servidor")
    })
    @PostMapping
    public ResponseEntity<User> createUser(@RequestBody User newUser) {
        newUser.setId(nextId++);
        users.add(newUser);
        return ResponseEntity.status(201).body(newUser);
    }

    @Operation(summary = "Obtener usuario por ID", description = "Devuelve un único usuario dado su ID.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Usuario encontrado"),
            @ApiResponse(responseCode = "404", description = "Usuario no encontrado"),
            @ApiResponse(responseCode = "500", description = "Error interno del servidor")
    })
    @GetMapping("/{id}")
    public ResponseEntity<User> getUserById(
            @Parameter(description = "ID del usuario a buscar", required = true)
            @PathVariable Long id) {
        return users.stream()
                .filter(user -> user.getId().equals(id))
                .findFirst()
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }
}
*/
// Una vez la aplicación está corriendo, puedes acceder a la UI de Swagger en:
// http://localhost:8080/swagger-ui.html (si usas el puerto 8080 y la configuración por defecto)
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Documentación de APIs',
    'topic': 'Swagger/OpenAPI',
    'subtopic': 'Generación automática de documentación de endpoints.',
    'definition': '''
La verdadera magia de Swagger/OpenAPI, especialmente con librerías como Springdoc OpenAPI en Spring Boot, reside en su capacidad para generar la documentación de tus endpoints de forma automática. Esto significa que, con solo unas pocas configuraciones y anotaciones en tu código, puedes tener una documentación detallada y actualizada de tu API REST.

Esto tiene una explicación, y es porque:

Tradicionalmente, mantener la documentación de una API al día era una pesadilla. Cada vez que cambiaba un endpoint, un parámetro o una respuesta, el documento de la API debía actualizarse manualmente, lo que a menudo llevaba a incoherencias entre el código y la documentación. La generación automática resuelve este problema.

¿Cómo funciona esta magia?
1.  **Análisis de código**: Springdoc OpenAPI escanea tus clases de controlador y los métodos que usan anotaciones como `@RestController`, `@RequestMapping`, `@GetMapping`, `@PostMapping`, etc.
2.  **Extracción de información**: De estas anotaciones, extrae la ruta, el tipo de método HTTP, los parámetros de la URL (`@PathVariable`, `@RequestParam`), los cuerpos de las peticiones (`@RequestBody`) y los tipos de retorno.
3.  **Reflexión de clases**: También examina las clases (modelos/DTOs) que utilizas en tus `@RequestBody` y en los tipos de retorno para construir las definiciones de los esquemas de datos (los objetos JSON que tu API envía y recibe).
4.  **Anotaciones adicionales**: Puedes añadir anotaciones específicas de OpenAPI (`io.swagger.v3.oas.annotations.*`) para enriquecer la documentación con descripciones más detalladas, ejemplos, respuestas específicas para diferentes códigos de estado, y agrupar tus endpoints. Anotaciones como `@Operation`, `@ApiResponses`, `@Parameter`, y `@Schema` son tus aliadas aquí.
5.  **Generación de la especificación**: Con toda esta información, Springdoc OpenAPI genera un archivo JSON o YAML que cumple con la especificación OpenAPI (anteriormente conocida como Swagger Specification). Este archivo es la "fuente de la verdad" de tu API.
6.  **Interfaz de usuario interactiva**: Finalmente, Swagger UI toma ese archivo de especificación y lo convierte en una interfaz web fácil de usar donde puedes visualizar y probar tu API.

Este proceso automatizado no solo te ahorra tiempo y esfuerzo, sino que también garantiza que tu documentación siempre refleje el estado actual de tu API, un factor crítico para cualquier equipo de desarrollo que trabaje con microservicios o APIs públicas.
''',
    'code_example': r'''
// Ejemplo de cómo las anotaciones ayudan a la generación automática de documentación

package com.example.demo.controller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.ArrayList;

// (Clase User de ejemplo de subtema anterior)
class User {
    private Long id;
    private String name;
    private int age;

    public User(Long id, String name, int age) {
        this.id = id;
        this.name = name;
        this.age = age;
    }
    // Getters y Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }
}

@RestController
@RequestMapping("/api/products")
@Tag(name = "Gestión de Productos", description = "Endpoints para manejar productos de la tienda.")
public class ProductController {

    private List<Product> products = new ArrayList<>();
    private Long nextProductId = 1L;

    public ProductController() {
        products.add(new Product(nextProductId++, "Laptop", 1200.0));
        products.add(new Product(nextProductId++, "Mouse", 25.0));
    }

    @Operation(summary = "Obtener todos los productos", description = "Lista todos los productos disponibles en la tienda.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Lista de productos recuperada con éxito",
                         content = @Content(mediaType = "application/json",
                                            schema = @Schema(implementation = Product.class))), // Muestra el esquema de Producto
            @ApiResponse(responseCode = "500", description = "Error interno del servidor")
    })
    @GetMapping
    public List<Product> getAllProducts() {
        return products;
    }

    @Operation(summary = "Crear un nuevo producto", description = "Añade un nuevo producto a la tienda con los datos proporcionados.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "201", description = "Producto creado y añadido al stock"),
            @ApiResponse(responseCode = "400", description = "Datos de producto inválidos"),
            @ApiResponse(responseCode = "500", description = "Error interno del servidor")
    })
    @PostMapping
    public ResponseEntity<Product> createProduct(
            @io.swagger.v3.oas.annotations.parameters.RequestBody(
                    description = "Detalles del producto a crear", required = true,
                    content = @Content(schema = @Schema(implementation = Product.class)))
            @RequestBody Product newProduct) {
        newProduct.setId(nextProductId++);
        products.add(newProduct);
        return ResponseEntity.status(201).body(newProduct);
    }

    @Operation(summary = "Buscar producto por nombre", description = "Encuentra productos cuyo nombre contenga la cadena de búsqueda.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Productos encontrados"),
            @ApiResponse(responseCode = "404", description = "No se encontraron productos con ese nombre"),
            @ApiResponse(responseCode = "500", description = "Error interno del servidor")
    })
    @GetMapping("/search")
    public List<Product> searchProductsByName(
            @Parameter(description = "Cadena de texto para buscar en el nombre del producto", required = true)
            @RequestParam String name) {
        List<Product> found = new ArrayList<>();
        for (Product p : products) {
            if (p.getName().toLowerCase().contains(name.toLowerCase())) {
                found.add(p);
            }
        }
        return found;
    }

    // Clase Product para el ejemplo
    static class Product {
        private Long id;
        private String name;
        private double price;

        public Product(Long id, String name, double price) {
            this.id = id;
            this.name = name;
            this.price = price;
        }
        // Getters y Setters
        public Long getId() { return id; }
        public void setId(Long id) { this.id = id; }
        public String getName() { return name; }
        public void setName(String name) { this.name = name; }
        public double getPrice() { return price; }
        public void setPrice(double price) { this.price = price; }
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Documentación de APIs',
    'topic': 'Versionado de APIs',
    'subtopic': 'Estrategias de versionado: URI, encabezados, parámetros.',
    'definition': '''
A medida que tu API REST evoluciona, es muy probable que necesites introducir cambios que rompan la compatibilidad con versiones anteriores. Aquí es donde el versionado de APIs se vuelve esencial. Permite a los clientes seguir usando una versión antigua mientras desarrollas y despliegas una nueva.

¿Te estás preguntando por qué esto importa tanto y cómo nos ayuda a mantener nuestra API robusta?

El versionado es crucial para asegurar la continuidad del servicio para tus consumidores. Pensemos por un momento en las diferentes estrategias que puedes usar para indicar la versión de tu API:

* **Versionado por URI (Uniform Resource Identifier)**: Esta es una de las estrategias más comunes y directas. La versión de la API se incluye directamente en la ruta de la URL.
    * Ejemplo: `GET /api/v1/users` y `GET /api/v2/users`.
    * **Ventajas**: Es muy claro y fácil de entender, tanto para desarrolladores como para herramientas de depuración. La URL por sí misma indica la versión.
    * **Desventajas**: Requiere cambios en la URL cada vez que hay una nueva versión, lo que puede ser un poco más rígido. Algunas personas argumentan que no es puramente RESTful ya que la URI debería identificar un recurso, no su representación o versión.
* **Versionado por Encabezado (Header Versioning)**: La versión de la API se especifica en una cabecera HTTP personalizada, como `X-API-Version` o a través de la cabecera `Accept` (negociación de contenido).
    * Ejemplo con cabecera personalizada: `GET /api/users` con `X-API-Version: 1` o `X-API-Version: 2`.
    * Ejemplo con `Accept` (Media Type Versioning): `GET /api/users` con `Accept: application/vnd.yourapi.v1+json`.
    * **Ventajas**: Las URLs permanecen limpias y los recursos se identifican de manera consistente. Es más flexible para el cambio de versiones sin cambiar la estructura de la URL.
    * **Desventajas**: Menos visible y obvio que el versionado por URI. Puede ser más complejo de implementar y probar para algunos clientes.
* **Versionado por Parámetros de Consulta (Query Parameter Versioning)**: La versión se pasa como un parámetro en la cadena de consulta de la URL.
    * Ejemplo: `GET /api/users?version=1` y `GET /api/users?version=2`.
    * **Ventajas**: Fácil de implementar y probar. Las URLs base no cambian.
    * **Desventajas**: Puede hacer que las URLs se vean menos limpias y es común que los parámetros de consulta se utilicen para filtrar o paginar datos, no para el versionado de la API en sí. Puede llevar a ambigüedad.

La elección de la estrategia de versionado depende de varios factores, como la simplicidad, la visibilidad y cómo afecta a tus clientes existentes. Muchas empresas grandes, como Twitter o Facebook, utilizan el versionado para gestionar la evolución de sus APIs y no romper las aplicaciones que dependen de ellas.
''',
    'code_example': r'''
// Ejemplos conceptuales de cómo implementar diferentes estrategias de versionado en Spring Boot

// 1. Versionado por URI
/*
package com.example.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserApiVersionController {

    @GetMapping("/api/v1/users")
    public String getUsersV1() {
        return "Lista de usuarios (v1)";
    }

    @GetMapping("/api/v2/users")
    public String getUsersV2() {
        return "Lista de usuarios (v2) - incluye campo 'email'";
    }

    // Ventaja: Muy claro en la URL
    // Desventaja: Cambia la URL
}
*/

// 2. Versionado por Encabezado (custom header)
/*
package com.example.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/users")
public class UserApiHeaderVersionController {

    @GetMapping(headers = "X-API-Version=1")
    public String getUsersV1ByHeader() {
        return "Lista de usuarios (v1) - Via X-API-Version: 1";
    }

    @GetMapping(headers = "X-API-Version=2")
    public String getUsersV2ByHeader() {
        return "Lista de usuarios (v2) - Via X-API-Version: 2";
    }

    // Ventaja: URLs limpias, recurso único
    // Desventaja: Menos obvio para el cliente sin inspeccionar cabeceras
}
*/

// 3. Versionado por Parámetro de Consulta
/*
package com.example.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/users")
public class UserApiQueryParamVersionController {

    @GetMapping(params = "version=1")
    public String getUsersV1ByQueryParam(@RequestParam(name = "version") String version) {
        return "Lista de usuarios (v1) - Via query param 'version=" + version + "'";
    }

    @GetMapping(params = "version=2")
    public String getUsersV2ByQueryParam(@RequestParam(name = "version") String version) {
        return "Lista de usuarios (v2) - Via query param 'version=" + version + "'";
    }

    // Ventaja: Fácil de implementar
    // Desventaja: Parámetro de consulta para versionado vs filtrado, puede ser confuso
}
*/

/* Incorrecto (o al menos a evitar en la mayoría de los casos):
   No versionar tu API o intentar manejar la lógica de versión dentro del mismo método
   sin una estrategia clara.
*/
/*
@RestController
@RequestMapping("/api/data")
public class BadVersioningController {
    @GetMapping
    public String getData(@RequestParam(required = false) String apiVersion) {
        if ("v2".equals(apiVersion)) {
            return "Datos de la version 2";
        } else {
            return "Datos de la version 1 (default)";
        }
        // Esto lleva a un método muy complejo con múltiples 'if's si la API crece
    }
}
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Documentación de APIs',
    'topic': 'Versionado de APIs',
    'subtopic': 'Mantenimiento de múltiples versiones de una API.',
    'definition': '''
Una vez que has elegido una estrategia de versionado, el siguiente paso es entender cómo vas a mantener y gestionar múltiples versiones de tu API en producción. Esto no es solo una cuestión técnica, sino también una decisión estratégica que impacta a tus usuarios y a la evolución de tu producto.

¿Te estás preguntando por qué esto importa y cómo nos ayuda a mantener nuestra API robusta?

Mantener múltiples versiones de una API implica más que solo copiar y pegar código. Requiere una estrategia clara para el desarrollo, despliegue y eventual deprecación de versiones antiguas. Aquí te va la aclaración:

1.  **En el código base:**
    * **Separación de paquetes/clases**: La forma más limpia es tener paquetes separados para cada versión (`com.yourapp.api.v1.controller`, `com.yourapp.api.v2.controller`). Esto ayuda a evitar conflictos de código y a mantener cada versión autocontenida.
    * **Herencia o composición**: Si las versiones son muy similares, podrías intentar la herencia o composición para reutilizar código, pero esto puede volverse complejo y difícil de manejar si las diferencias crecen. A veces, la duplicación controlada es preferible a una abstracción que complica demasiado el código.
    * **Mapeo de datos**: Es crucial tener diferentes DTOs (Data Transfer Objects) para cada versión si la estructura de datos cambia. No intentes usar el mismo DTO para todas las versiones si hay diferencias significativas.

2.  **En el despliegue:**
    * **Aplicación monolítica**: Si tu aplicación es un monolito, puedes tener todos los controladores de diferentes versiones coexistiendo en la misma aplicación. Spring se encargará de mapear las solicitudes a los controladores correctos según la estrategia de versionado elegida.
    * **Microservicios**: En un ecosistema de microservicios, podrías optar por desplegar diferentes versiones de tu servicio como microservicios separados. Esto te da la máxima flexibilidad para actualizar o escalar versiones de forma independiente. Un API Gateway (como Spring Cloud Gateway o Zuul) puede enrutar las solicitudes a la versión correcta.

3.  **Deprecación y soporte:**
    * **Comunicación**: Es vital comunicar claramente a tus consumidores cuando una versión se considera "deprecated" (obsoleta) y cuándo dejará de recibir soporte. Esto se hace a través de la documentación, anuncios y, a veces, cabeceras de respuesta HTTP.
    * **Período de gracia**: Ofrece un período de gracia razonable (meses o incluso años, dependiendo de la API) antes de deshabilitar completamente una versión antigua, dando tiempo a los clientes para migrar.
    * **Monitoreo**: Monitorea el uso de las versiones antiguas para saber cuándo ya no hay clientes activos y puedes retirarlas de forma segura.

Mantener múltiples versiones es un acto de equilibrio entre la flexibilidad para evolucionar la API y la complejidad de su mantenimiento. Sin embargo, es una práctica estándar de la industria, vista en APIs de empresas como Stripe, AWS o Google, porque es fundamental para garantizar que tu API pueda crecer sin romper a sus usuarios existentes.
''',
    'code_example': r'''
// Ejemplo conceptual de cómo mantener múltiples versiones de un controlador
// Usando la estrategia de versionado por URI para claridad

package com.example.demo.api;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

// Modelo de datos para la V1
class UserV1 {
    private String name;
    private int age;

    public UserV1(String name, int age) { this.name = name; this.age = age; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }
}

// Modelo de datos para la V2 (con un nuevo campo 'email')
class UserV2 {
    private String name;
    private int age;
    private String email; // Nuevo campo en V2

    public UserV2(String name, int age, String email) {
        this.name = name;
        this.age = age;
        this.email = email;
    }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
}

// Controlador para la V1
@RestController
@RequestMapping("/api/v1/users")
public class UserV1Controller {

    @GetMapping
    public List<UserV1> getAllUsersV1() {
        return Arrays.asList(
            new UserV1("Alice V1", 30),
            new UserV1("Bob V1", 25)
        );
    }

    @PostMapping
    public ResponseEntity<String> createUserV1(@RequestBody UserV1 user) {
        // Lógica para crear usuario V1
        return ResponseEntity.ok("Usuario V1 creado: " + user.getName());
    }
}

// Controlador para la V2
@RestController
@RequestMapping("/api/v2/users")
public class UserV2Controller {

    @GetMapping
    public List<UserV2> getAllUsersV2() {
        // En un caso real, podrías transformar datos V1 a V2 o acceder a una fuente de datos compatible
        return Arrays.asList(
            new UserV2("Charlie V2", 35, "charlie@example.com"),
            new UserV2("David V2", 40, "david@example.com")
        );
    }

    @PostMapping
    public ResponseEntity<String> createUserV2(@RequestBody UserV2 user) {
        // Lógica para crear usuario V2
        return ResponseEntity.ok("Usuario V2 creado: " + user.getName() + " con email: " + user.getEmail());
    }
}

/* Incorrecto:
   Intentar manejar todas las versiones dentro del mismo método de un solo controlador,
   usando muchas condiciones 'if/else' y mezclando lógicas de datos diferentes.
*/
/*
@RestController
@RequestMapping("/api/users")
public class BadMultiVersionController {

    @GetMapping
    public ResponseEntity<?> getUsers(@RequestHeader(value = "X-API-Version", required = false) String apiVersion) {
        if ("2".equals(apiVersion)) {
            // Lógica para V2
            return ResponseEntity.ok(Arrays.asList(new UserV2("Mix User", 30, "mix@example.com")));
        } else {
            // Lógica para V1
            return ResponseEntity.ok(Arrays.asList(new UserV1("Mix User", 30)));
        }
        // Esto se vuelve inmanejable rápidamente con más versiones o endpoints
    }
}
*/
'''
  });
}

Future<void> insertSpringbootJrLevel6Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Seguridad Básica',
    'topic': 'Spring Security',
    'subtopic': 'Configuración básica de seguridad.',
    'definition': '''
La seguridad es un aspecto crítico en cualquier aplicación, y Spring Security es la navaja suiza de Spring Boot para manejar la autenticación (¿quién eres?) y la autorización (¿qué puedes hacer?). Es un framework robusto que te permite proteger tus aplicaciones de forma declarativa y configurable.

No sé tú, pero a mí esto al principio me costó un poco entender cómo funcionaba el filtro de Spring Security y dónde encajaba todo.

La configuración básica de Spring Security implica añadir la dependencia `spring-boot-starter-security` a tu proyecto. Una vez que haces esto, Spring Security automáticamente protege todas tus rutas por defecto, solicitando autenticación para cualquier acceso. Esto es un buen punto de partida, pero rara vez es lo que necesitas en una aplicación real.

Para personalizar el comportamiento de seguridad, normalmente creas una clase de configuración que extiende de `WebSecurityConfigurerAdapter` (en versiones antiguas) o, más comúnmente ahora, defines un `Bean` de tipo `SecurityFilterChain` en tu clase de configuración. Aquí es donde puedes:

* **Definir reglas de autorización**: Especificar qué rutas (`/public`, `/admin/**`, `/users/**`) son accesibles para todos, cuáles requieren autenticación, y cuáles requieren roles específicos. Por ejemplo, podrías permitir que cualquiera vea `/public`, pero solo usuarios autenticados puedan acceder a `/users`, y solo administradores a `/admin`.
* **Configurar el formulario de login**: Si estás construyendo una aplicación web tradicional, puedes habilitar un formulario de login predeterminado o personalizar el tuyo propio.
* **Habilitar autenticación HTTP Basic o basada en formularios**.
* **Configurar el manejador de contraseñas (PasswordEncoder)**: Es fundamental usar un codificador de contraseñas fuerte para almacenar las contraseñas de los usuarios de forma segura (nunca en texto plano). Spring Security ofrece varios, como `BCryptPasswordEncoder`.

Spring Security funciona a través de una cadena de filtros que interceptan las peticiones HTTP y aplican las reglas de seguridad. Su flexibilidad y extensibilidad lo hacen la opción preferida para asegurar aplicaciones Spring. Un buen ejemplo es cómo lo usaría un banco, donde la seguridad es primordial; cada transacción y acceso está estrictamente controlado por un framework como Spring Security para proteger los datos de los clientes.
''',
    'code_example': r'''
// Ejemplo de configuración básica de Spring Security

package com.example.demo.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

@Configuration // Indica que esta clase contiene configuraciones de Spring
@EnableWebSecurity // Habilita la seguridad web de Spring
public class SecurityConfig {

    // 1. Configuración de la cadena de filtros de seguridad HTTP
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .authorizeHttpRequests(authorizeRequests ->
                authorizeRequests
                    .requestMatchers("/public").permitAll() // Permite acceso público a /public
                    .requestMatchers("/admin/**").hasRole("ADMIN") // Solo usuarios con rol ADMIN
                    .requestMatchers("/user/**").hasAnyRole("USER", "ADMIN") // Usuarios con rol USER o ADMIN
                    .anyRequest().authenticated() // Cualquier otra petición requiere autenticación
            )
            .formLogin(formLogin ->
                formLogin
                    .loginPage("/login").permitAll() // Permite acceso al formulario de login
                    .defaultSuccessUrl("/home", true) // Redirecciona después del login exitoso
            )
            .logout(logout ->
                logout
                    .permitAll() // Permite el logout sin autenticación previa
            )
            .csrf(csrf -> csrf.disable()); // Deshabilita CSRF (para APIs REST sin stateful session, o para simplificar ejemplos)

        return http.build();
    }

    // 2. Configuración de un UserDetailsService en memoria (para pruebas, no para producción)
    // En producción, esto se conectaría a una base de datos o LDAP
    @Bean
    public UserDetailsService userDetailsService(PasswordEncoder passwordEncoder) {
        UserDetails user = User.builder()
            .username("user")
            .password(passwordEncoder.encode("password")) // Codifica la contraseña
            .roles("USER") // Asigna el rol USER
            .build();

        UserDetails admin = User.builder()
            .username("admin")
            .password(passwordEncoder.encode("adminpass"))
            .roles("ADMIN", "USER") // Asigna los roles ADMIN y USER
            .build();

        return new InMemoryUserDetailsManager(user, admin);
    }

    // 3. Bean para el codificador de contraseñas (BCrypt)
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    /* Incorrecto:
       No usar un PasswordEncoder y almacenar contraseñas en texto plano.
       Esto es una grave vulnerabilidad de seguridad.
    */
    /*
    // @Bean
    // public UserDetailsService badUserDetailsService() {
    //     UserDetails badUser = User.builder()
    //         .username("plainuser")
    //         .password("plainpassword") // Contraseña en texto plano - ¡NO HACER ESTO!
    //         .roles("USER")
    //         .build();
    //     return new InMemoryUserDetailsManager(badUser);
    // }
    */
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Seguridad Básica',
    'topic': 'Spring Security',
    'subtopic': 'Autenticación y autorización en aplicaciones simples.',
    'definition': '''
Dentro del universo de Spring Security, los conceptos de autenticación y autorización son los pilares fundamentales. La autenticación es el proceso de verificar la identidad de un usuario (¿quién eres?), mientras que la autorización es el proceso de determinar qué permisos tiene ese usuario (¿qué puedes hacer una vez identificado?).

Seguramente pensarás de qué va todo esto y cómo nos ayuda a simplificar la configuración.

Pensemos por un momento en un escenario cotidiano:
* **Autenticación**: Cuando inicias sesión en tu aplicación de banca online, ingresas tu nombre de usuario y contraseña. El sistema verifica si esas credenciales coinciden con las que tiene registradas. Si coinciden, estás **autenticado**.
* **Autorización**: Una vez autenticado, el sistema de banca verifica si tienes permiso para realizar una transferencia a una cuenta diferente o solo puedes ver tu saldo. Si tienes permiso para transferir, estás **autorizado** para hacerlo. Si no, tu acción será denegada.

Spring Security maneja estos dos procesos de manera muy flexible:

**Autenticación:**
* **Proveedores de autenticación**: Spring Security no te fuerza a usar una única forma de autenticación. Puedes autenticar usuarios desde una base de datos, un servidor LDAP, OAuth2, o incluso en memoria para pruebas.
* **Manejadores de contraseñas**: Siempre insiste en el uso de `PasswordEncoder` para codificar las contraseñas antes de almacenarlas y compararlas. Esto es vital para la seguridad.
* **Tipos de autenticación**: Puede manejar autenticación basada en formularios (típica en aplicaciones web), HTTP Basic (envía usuario/contraseña en cada petición), o basada en tokens (como JWT para APIs RESTful).

**Autorización:**
* **Roles y Autoridades**: La autorización se basa en roles (por ejemplo, `ADMIN`, `USER`, `GUEST`) o autoridades más granulares (por ejemplo, `CAN_DELETE_PRODUCT`, `CAN_VIEW_ORDERS`). A los usuarios autenticados se les asignan estos roles/autoridades.
* **Expresiones de seguridad**: Puedes usar expresiones como `hasRole('ADMIN')`, `hasAnyRole('USER', 'MANAGER')`, `isAuthenticated()`, `permitAll()`, `denyAll()` en tus configuraciones de URL para controlar el acceso a diferentes partes de tu aplicación.
* **Anotaciones a nivel de método**: Para un control más granular, puedes usar anotaciones como `@Secured("ROLE_ADMIN")` o `@PreAuthorize("hasRole('ADMIN')")` directamente en tus métodos de servicio o controlador para asegurar que solo los usuarios autorizados puedan ejecutarlos.

Spring Security se integra perfectamente en el flujo de peticiones, interceptando cada solicitud y aplicando las reglas de seguridad antes de que llegue a tu lógica de negocio. Esto te permite construir aplicaciones seguras sin tener que escribir manualmente gran parte del código de seguridad.
''',
    'code_example': r'''
// Ejemplo de autenticación y autorización en un controlador de Spring Boot

package com.example.demo.controller;

import org.springframework.security.access.prepost.PreAuthorize; // Para anotaciones de seguridad a nivel de método
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SecureController {

    // Cualquier persona (autenticada o no) puede acceder a esta ruta
    @GetMapping("/public")
    public String publicEndpoint() {
        return "Este es un endpoint público. ¡Bienvenido!";
    }

    // Solo usuarios autenticados pueden acceder a esta ruta
    // (Configurado en SecurityConfig con .anyRequest().authenticated())
    @GetMapping("/user/profile")
    public String userProfile() {
        // Obtener información del usuario autenticado
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName(); // Nombre del usuario autenticado
        return "Hola, " + username + "! Bienvenido a tu perfil de usuario.";
    }

    // Solo usuarios con el rol 'ADMIN' pueden acceder a esta ruta
    @GetMapping("/admin/dashboard")
    @PreAuthorize("hasRole('ADMIN')") // Requiere el rol ADMIN
    public String adminDashboard() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        return "Bienvenido al panel de administración, " + username + "!";
    }

    // Solo usuarios con el rol 'USER' o 'ADMIN' pueden acceder a esta ruta
    @GetMapping("/general/data")
    @PreAuthorize("hasAnyRole('USER', 'ADMIN')") // Requiere cualquiera de los roles
    public String generalData() {
        return "Datos generales accesibles por usuarios y administradores.";
    }

    /* Incorrecto:
       Intentar hacer la lógica de seguridad manualmente dentro de cada método de controlador
       en lugar de delegar en Spring Security. Esto es propenso a errores y repetitivo.
    */
    /*
    @GetMapping("/bad-secured-endpoint")
    public String badSecuredEndpoint() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null || !authentication.isAuthenticated()) {
            // Manejo manual de no autenticado - ¡NO HACER ESTO!
            throw new RuntimeException("Acceso denegado: no autenticado");
        }
        // ... lógica
        return "Datos seguros.";
    }
    */
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Seguridad Básica',
    'topic': 'Gestión de Usuarios',
    'subtopic': 'Creación de usuarios en memoria.',
    'definition': '''
Cuando estás empezando con Spring Security o simplemente necesitas una solución de seguridad rápida para desarrollo o pruebas, la creación de usuarios "en memoria" es una opción súper útil. Esto significa que Spring Security gestiona una lista de usuarios directamente en la memoria de la aplicación, sin necesidad de una base de datos o un sistema de autenticación externo.

No sé tú, pero a mí esto al principio me costó entender que esto era solo para pruebas, y no una solución para producción.

Pensemos por un momento por qué querrías hacer esto:

* **Prototipado rápido**: Si estás construyendo un prototipo o una prueba de concepto, no quieres perder tiempo configurando y manteniendo una base de datos de usuarios. Con usuarios en memoria, puedes levantar la aplicación con seguridad básica en minutos.
* **Pruebas unitarias/de integración**: Para las pruebas, necesitas que el entorno sea lo más consistente y rápido posible. Los usuarios en memoria eliminan la dependencia de una base de datos externa, haciendo que las pruebas sean más rápidas y fiables.
* **Ejemplos y demostraciones**: Cuando muestras una funcionalidad de seguridad, es más fácil de configurar y ejecutar para una demostración si los usuarios ya están predefinidos.

En Spring Security, esto se logra a través de la implementación de `UserDetailsService`, generalmente usando un `InMemoryUserDetailsManager`. Dentro de esta configuración, defines usuarios individuales (`UserDetails`), especificando su nombre de usuario, contraseña (¡siempre codificada!) y los roles o autoridades que poseen. Cada `UserDetails` representa un usuario con sus credenciales y permisos.

Es importante recordar que, aunque es muy conveniente, esta solución **no es adecuada para entornos de producción**. Cuando la aplicación se reinicia, todos los usuarios en memoria se pierden. Para producción, necesitarías persistir a tus usuarios en una base de datos, LDAP, o integrarte con un servicio de identidad externo. Pero para los escenarios mencionados, es una herramienta poderosa y sencilla.
''',
    'code_example': r'''
// Ejemplo de configuración de usuarios en memoria con Spring Security

package com.example.demo.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class InMemorySecurityConfig {

    // 1. Define los usuarios en memoria
    @Bean
    public UserDetailsService userDetailsService(PasswordEncoder passwordEncoder) {
        // Crea un usuario "user" con rol USER
        UserDetails user = User.builder()
            .username("user")
            .password(passwordEncoder.encode("password")) // Contraseña codificada
            .roles("USER") // Asigna el rol "USER"
            .build();

        // Crea un usuario "admin" con roles ADMIN y USER
        UserDetails admin = User.builder()
            .username("admin")
            .password(passwordEncoder.encode("adminpass"))
            .roles("ADMIN", "USER") // Asigna los roles "ADMIN" y "USER"
            .build();

        // Retorna un InMemoryUserDetailsManager con los usuarios definidos
        return new InMemoryUserDetailsManager(user, admin);
    }

    // 2. Define un PasswordEncoder para codificar las contraseñas
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder(); // BCrypt es un algoritmo de hashing fuerte
    }

    // 3. Configuración básica de la cadena de filtros para usar estos usuarios
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
            .authorizeHttpRequests(authorize -> authorize
                .requestMatchers("/public").permitAll() // Ruta pública
                .requestMatchers("/admin/**").hasRole("ADMIN") // Solo admin
                .requestMatchers("/user/**").hasAnyRole("USER", "ADMIN") // User o admin
                .anyRequest().authenticated() // Cualquier otra requiere autenticación
            )
            .formLogin(form -> form
                .permitAll() // Permite acceso al formulario de login
            )
            .logout(logout -> logout
                .permitAll() // Permite logout
            )
            .csrf(csrf -> csrf.disable()); // Deshabilita CSRF para simplificar en ejemplos/APIs REST

        return http.build();
    }

    /* Incorrecto:
       No usar un PasswordEncoder y almacenar contraseñas en texto plano.
       Esto expone tus usuarios a riesgos de seguridad.
    */
    /*
    // @Bean
    // public UserDetailsService insecureUserDetailsService() {
    //     UserDetails insecureUser = User.builder()
    //         .username("baduser")
    //         .password("{noop}plainpassword") // {noop} es para contraseñas sin codificar, NO USAR EN PROD
    //         .roles("USER")
    //         .build();
    //     return new InMemoryUserDetailsManager(insecureUser);
    // }
    */
}
'''
  });

  await db.insert('programming_content', {
    'language': 'Springboot',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Seguridad Básica',
    'topic': 'Gestión de Usuarios',
    'subtopic': 'Asignación de roles y permisos básicos.',
    'definition': '''
Una vez que un usuario ha sido autenticado (sabemos quién es), el siguiente paso fundamental en seguridad es la autorización: determinar qué puede hacer ese usuario dentro de nuestra aplicación. En Spring Security, esto se maneja principalmente a través de la asignación de "roles" y "permisos" (también llamados autoridades).

Aquí te va la aclaración: Esto es como si un usuario es un "invitado" (rol `GUEST`), solo puede ver ciertas páginas. Si es un "miembro" (rol `USER`), puede hacer más cosas. Y si es un "administrador" (rol `ADMIN`), tiene acceso a todo.

* **Roles**: Son etiquetas de alto nivel que representan un conjunto de responsabilidades o un nivel de acceso dentro de tu aplicación. Por ejemplo, `ADMIN`, `USER`, `MANAGER`, `GUEST`. En Spring Security, los roles suelen prefijarse con `ROLE_` (ej. `ROLE_ADMIN`), aunque puedes configurarlo para no usar este prefijo.
* **Permisos (Autoridades)**: Son permisos más granulares que un usuario tiene para realizar una acción específica. Un rol puede agrupar varios permisos. Por ejemplo, el rol `ADMIN` podría tener los permisos `CREATE_PRODUCT`, `DELETE_PRODUCT`, `VIEW_REPORTS`. Un rol `USER` podría tener solo `VIEW_PRODUCT`. Spring Security a menudo usa el término "autoridades" de forma intercambiable con permisos o roles.

La asignación de roles y permisos se realiza en el momento de la autenticación, cuando creas el objeto `UserDetails` para un usuario. En la configuración de seguridad, luego usas estos roles o permisos para proteger tus endpoints o métodos:

* **Protección a nivel de URL**: Usando `http.authorizeHttpRequests()` en tu `SecurityFilterChain`, puedes especificar qué roles son necesarios para acceder a ciertas rutas. Por ejemplo, `/admin/**.hasRole('ADMIN')`.
* **Protección a nivel de método**: Para un control más fino, puedes usar anotaciones como `@PreAuthorize` o `@Secured` directamente en los métodos de tus servicios o controladores. Esto es útil si una lógica de negocio específica dentro de un método solo debe ser ejecutada por usuarios con ciertos permisos, independientemente de la URL.

Esta clara separación de autenticación y autorización, y la flexibilidad para definir roles y permisos, es lo que hace a Spring Security tan potente. Te permite construir sistemas donde el acceso a los recursos está finamente controlado, asegurando que cada usuario solo pueda interactuar con la aplicación de la manera que le corresponde.
''',
    'code_example': r'''
// Ejemplo de asignación y uso de roles y permisos en Spring Security

package com.example.demo.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity; // Habilita seguridad a nivel de método
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.security.access.prepost.PreAuthorize; // Para @PreAuthorize

@Configuration
@EnableMethodSecurity(prePostEnabled = true) // Habilita @PreAuthorize y @PostAuthorize
public class RolePermissionConfig {

    // 1. Configuración de usuarios con roles y permisos en memoria
    @Bean
    public UserDetailsService userDetailsService(PasswordEncoder passwordEncoder) {
        // Usuario con rol USER
        UserDetails regularUser = User.builder()
            .username("user")
            .password(passwordEncoder.encode("userpass"))
            .roles("USER") // Rol USER
            .authorities("READ_PERMISSION") // Permiso específico
            .build();

        // Usuario con rol ADMIN (y también puede actuar como USER)
        UserDetails adminUser = User.builder()
            .username("admin")
            .password(passwordEncoder.encode("adminpass"))
            .roles("ADMIN", "USER") // Roles ADMIN y USER
            .authorities("READ_PERMISSION", "WRITE_PERMISSION", "DELETE_PERMISSION") // Permisos específicos
            .build();

        // Un usuario con un permiso específico, pero sin rol directo
        UserDetails specificPermissionUser = User.builder()
            .username("editor")
            .password(passwordEncoder.encode("editorpass"))
            .authorities("WRITE_PERMISSION") // Solo el permiso WRITE_PERMISSION
            .build();


        return new InMemoryUserDetailsManager(regularUser, adminUser, specificPermissionUser);
    }

    // 2. Codificador de contraseñas
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    // 3. Configuración de la cadena de filtros para proteger URLs basadas en roles
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
            .authorizeHttpRequests(authorize -> authorize
                .requestMatchers("/public").permitAll()
                .requestMatchers("/admin/**").hasRole("ADMIN") // Solo acceso de rol ADMIN a /admin
                .requestMatchers("/user/**").hasAnyRole("USER", "ADMIN") // Acceso de USER o ADMIN a /user
                .anyRequest().authenticated()
            )
            .formLogin(form -> form.permitAll())
            .logout(logout -> logout.permitAll())
            .csrf(csrf -> csrf.disable());
        return http.build();
    }

    // Ejemplo de un controlador que usa roles y permisos a nivel de método
    @RestController
    public static class RolePermissionController {

        @GetMapping("/public")
        public String publicAccess() {
            return "Endpoint público accesible por todos.";
        }

        @GetMapping("/user/read")
        @PreAuthorize("hasRole('USER')") // Solo usuarios con rol USER
        public String userReadAccess() {
            return "Acceso de lectura para usuarios.";
        }

        @GetMapping("/admin/manage")
        @PreAuthorize("hasRole('ADMIN')") // Solo usuarios con rol ADMIN
        public String adminManageAccess() {
            return "Acceso de administración para administradores.";
        }

        @GetMapping("/data/write")
        // @PreAuthorize("hasAuthority('WRITE_PERMISSION')") // Solo usuarios con el permiso WRITE_PERMISSION
        // O también con hasRole:
        @PreAuthorize("hasAnyRole('ADMIN', 'EDITOR') or hasAuthority('WRITE_PERMISSION')")
        public String writeData() {
            return "Endpoint para escribir datos, requiere permiso de escritura.";
        }
    }

    /* Incorrecto:
       Asignar roles y permisos de forma inconsistente o no utilizarlos
       para proteger los recursos, dejando brechas de seguridad.
    */
    /*
    // Si tienes un método que maneja información sensible sin una anotación de seguridad,
    // cualquier usuario autenticado podría acceder a él.
    // @GetMapping("/sensitive-info")
    // public String getSensitiveInfo() {
    //     return "Información altamente confidencial."; // ¡NO PROTEGIDA!
    // }
    */
}
'''
  });
}
