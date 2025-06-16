import 'package:sqflite_common/sqlite_api.dart';

Future<void> insertPuntonetMidLevel1Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Arquitectura y Diseño',
    'topic': 'Principios SOLID',
    'subtopic': 'Aplicación de los principios SOLID en .NET',
    'definition': r'''
Los principios SOLID son un conjunto de cinco principios de diseño de software que te ayudan a construir sistemas más comprensibles, flexibles y mantenibles. Pensemos por un momento en esto como las "buenas prácticas de higiene" para tu código: si las sigues, tu proyecto será más fácil de limpiar, extender y colaborar con otros, evitando que se convierta en un lío inmanejable.

¿Te estás preguntando por qué esto importa? Porque a medida que las aplicaciones crecen, el código puede volverse rígido, frágil y difícil de cambiar. Los principios SOLID, propuestos por Robert C. Martin (Uncle Bob), buscan contrarrestar esta "descomposición" del software, promoviendo un diseño que es resistente al cambio y fácil de entender. Sin estos principios, podrías terminar con un código que es una pesadilla de mantener, donde un pequeño cambio en una parte del sistema rompe otra, o donde añadir una nueva característica se convierte en un dolor de cabeza constante.

Los principios SOLID son un acrónimo de:
* **S - Single Responsibility Principle (Principio de Responsabilidad Única):** Una clase debe tener una y solo una razón para cambiar. Esto significa que cada clase o módulo debe ser responsable de una única funcionalidad. No debe intentar hacer demasiadas cosas.
* **O - Open/Closed Principle (Principio Abierto/Cerrado):** Las entidades de software (clases, módulos, funciones, etc.) deben estar abiertas para la extensión, pero cerradas para la modificación. Esto significa que puedes añadir nuevas funcionalidades sin cambiar el código existente que ya funciona.
* **L - Liskov Substitution Principle (Principio de Sustitución de Liskov):** Los objetos de una clase base deben poder ser reemplazados por objetos de sus clases derivadas sin alterar la corrección del programa. En otras palabras, si `B` es una subclase de `A`, deberías poder usar un objeto `B` donde sea que esperes un `A`, y todo debería seguir funcionando correctamente.
* **I - Interface Segregation Principle (Principio de Segregación de Interfaces):** Los clientes no deben ser forzados a depender de interfaces que no utilizan. Es mejor tener muchas interfaces pequeñas y específicas que una interfaz grande y general.
* **D - Dependency Inversion Principle (Principio de Inversión de Dependencias):** Los módulos de alto nivel no deben depender de módulos de bajo nivel. Ambos deben depender de abstracciones. Las abstracciones no deben depender de los detalles. Los detalles deben depender de las abstracciones. Esto es la base de la inyección de dependencias.

Aplicar estos principios en .NET (o en cualquier lenguaje orientado a objetos) no es un dogma, sino una guía. Te ayudan a escribir código más robusto, extensible y fácil de probar.
''',
    'code_example': r'''
// Ejemplos de aplicación de los principios SOLID en .NET (C#)

using System;
using System.Collections.Generic;
using System.Linq;

namespace SolidPrinciplesDemo
{
    // --- S: Single Responsibility Principle (SRP) ---
    // ANTES (INCUMPLIENDO SRP):
    /*
    public class PedidoManager
    {
        public void CrearPedido(string producto, int cantidad) { /* ... */ } // Responsabilidad de Pedido
        public void EnviarEmailConfirmacion(string email, string mensaje) { /* ... */ } // Responsabilidad de Notificación
        public void GuardarPedidoEnBaseDeDatos(object pedido) { /* ... */ } // Responsabilidad de Persistencia
    }
    */

    // DESPUÉS (CUMPLIENDO SRP):
    public class Pedido
    {
        public int Id { get; set; }
        public string Producto { get; set; }
        public int Cantidad { get; set; }
        public decimal Total { get; set; }

        public void CalcularTotal()
        {
            // Lógica para calcular el total del pedido
            Total = Cantidad * 10.50m; // Ejemplo simple
            Console.WriteLine($"Pedido {Id} - Total calculado: {Total}");
        }
    }

    public class PedidoRepository
    {
        public void Guardar(Pedido pedido)
        {
            // Lógica para guardar el pedido en la base de datos
            Console.WriteLine($"Pedido {pedido.Id} guardado en la base de datos.");
        }
    }

    public class EmailService
    {
        public void EnviarConfirmacion(string email, Pedido pedido)
        {
            // Lógica para enviar el email
            Console.WriteLine($"Email de confirmación enviado a {email} para pedido {pedido.Id}.");
        }
    }

    // --- O: Open/Closed Principle (OCP) ---
    // ANTES (INCUMPLIENDO OCP):
    /*
    public class ProcesadorDescuento
    {
        public decimal CalcularDescuento(decimal precio, string tipoCliente)
        {
            if (tipoCliente == "Regular") return precio * 0.05m;
            if (tipoCliente == "VIP") return precio * 0.15m;
            // Si añades un nuevo tipo de cliente, tienes que modificar este método
            return 0;
        }
    }
    */

    // DESPUÉS (CUMPLIENDO OCP):
    // Abierto para extensión (añadir nuevas implementaciones de IDescuento), cerrado para modificación
    public interface IDescuento
    {
        decimal AplicarDescuento(decimal precio);
    }

    public class DescuentoRegular : IDescuento
    {
        public decimal AplicarDescuento(decimal precio) => precio * 0.05m;
    }

    public class DescuentoVIP : IDescuento
    {
        public decimal AplicarDescuento(decimal precio) => precio * 0.15m;
    }

    public class CalculadoraPrecio
    {
        public decimal CalcularPrecioFinal(decimal precioBase, IDescuento descuentoStrategy)
        {
            return precioBase - descuentoStrategy.AplicarDescuento(precioBase);
        }
    }

    // --- L: Liskov Substitution Principle (LSP) ---
    // ANTES (INCUMPLIENDO LSP): Si Coche volador no puede "volar" si solo es un coche.
    /*
    public class Vehiculo
    {
        public virtual void Mover() { Console.WriteLine("Vehículo se mueve."); }
    }

    public class Coche : Vehiculo
    {
        public override void Mover() { Console.WriteLine("Coche conduce."); }
    }

    public class CocheVolador : Coche
    {
        // Si CocheVolador tiene que lanzar una excepción porque no puede "conducir"
        // o si su comportamiento de "Mover" es fundamentalmente diferente, rompe LSP.
        public override void Mover() { throw new NotSupportedException("Este coche vuela, no conduce."); }
        public void Volar() { Console.WriteLine("Coche volador vuela."); }
    }
    */

    // DESPUÉS (CUMPLIENDO LSP):
    // Asegurarse de que los subtipos son sustituibles por sus tipos base.
    // Esto a menudo implica un diseño de herencia más cuidadoso.
    public abstract class Forma
    {
        public abstract double Area();
    }

    public class Rectangulo : Forma
    {
        public double Ancho { get; set; }
        public double Alto { get; set; }
        public Rectangulo(double ancho, double alto) { Ancho = ancho; Alto = alto; }
        public override double Area() => Ancho * Alto;
    }

    public class Cuadrado : Forma
    {
        // En lugar de heredar de Rectangulo y violar LSP (porque cambiar Ancho afectaría Alto),
        // se maneja el cuadrado como un caso especial o se crea una jerarquía diferente.
        // Aquí, simplemente se asegura que Ancho y Alto siempre sean iguales.
        public double Lado { get; set; }
        public Cuadrado(double lado) { Lado = lado; }
        public override double Area() => Lado * Lado;
    }

    // --- I: Interface Segregation Principle (ISP) ---
    // ANTES (INCUMPLIENDO ISP):
    /*
    public interface IWorker
    {
        void Work();
        void Eat();
        void Sleep();
    }

    public class Robot : IWorker
    {
        public void Work() { Console.WriteLine("Robot working."); }
        public void Eat() { throw new NotImplementedException(); } // Robot no come
        public void Sleep() { throw new NotImplementedException(); } // Robot no duerme
    }
    */

    // DESPUÉS (CUMPLIENDO ISP):
    public interface ITrabajador
    {
        void Trabajar();
    }

    public interface IComedor
    {
        void Comer();
    }

    public interface IDurmiciente
    {
        void Dormir();
    }

    public class Humano : ITrabajador, IComedor, IDurmiciente
    {
        public void Trabajar() { Console.WriteLine("Humano trabajando."); }
        public void Comer() { Console.WriteLine("Humano comiendo."); }
        public void Dormir() { Console.WriteLine("Humano durmiendo."); }
    }

    public class Robot : ITrabajador
    {
        public void Trabajar() { Console.WriteLine("Robot trabajando."); }
    }

    // --- D: Dependency Inversion Principle (DIP) ---
    // ANTES (INCUMPLIENDO DIP): La clase de alto nivel (Reporte) depende de detalles (Consola).
    /*
    public class NotificadorConsola
    {
        public void EnviarMensaje(string mensaje) { Console.WriteLine(mensaje); }
    }

    public class GeneradorReporte
    {
        private NotificadorConsola _notificador = new NotificadorConsola(); // Dependencia directa

        public void Generar()
        {
            // ... lógica del reporte ...
            _notificador.EnviarMensaje("Reporte generado.");
        }
    }
    */

    // DESPUÉS (CUMPLIENDO DIP): Alto nivel depende de abstracción, no de detalles.
    public interface INotificador
    {
        void EnviarMensaje(string mensaje);
    }

    public class NotificadorConsola : INotificador
    {
        public void EnviarMensaje(string mensaje) { Console.WriteLine($"[Consola] {mensaje}"); }
    }

    public class NotificadorEmail : INotificador
    {
        public void EnviarMensaje(string mensaje) { Console.WriteLine($"[Email] Enviando correo: {mensaje}"); }
    }

    public class GeneradorReporte
    {
        private readonly INotificador _notificador;

        // Inyección de dependencia a través del constructor
        public GeneradorReporte(INotificador notificador)
        {
            _notificador = notificador;
        }

        public void Generar()
        {
            // ... lógica del reporte ...
            _notificador.EnviarMensaje("Reporte generado con éxito usando INotificador.");
        }
    }


    public class Program
    {
        public static void Main(string[] args)
        {
            // Demostración S
            Console.WriteLine("--- SRP Demo ---");
            var pedido = new Pedido { Id = 1, Producto = "Laptop", Cantidad = 1 };
            pedido.CalcularTotal();
            new PedidoRepository().Guardar(pedido);
            new EmailService().EnviarConfirmacion("cliente@ejemplo.com", pedido);

            // Demostración O
            Console.WriteLine("\n--- OCP Demo ---");
            var calculadoraPrecio = new CalculadoraPrecio();
            Console.WriteLine($"Precio con descuento regular: {calculadoraPrecio.CalcularPrecioFinal(100m, new DescuentoRegular()):C}");
            Console.WriteLine($"Precio con descuento VIP: {calculadoraPrecio.CalcularPrecioFinal(100m, new DescuentoVIP()):C}");

            // Demostración L
            Console.WriteLine("\n--- LSP Demo ---");
            List<Forma> formas = new List<Forma> { new Rectangulo(4, 5), new Cuadrado(4) };
            foreach (var forma in formas)
            {
                Console.WriteLine($"Área de {forma.GetType().Name}: {forma.Area()}");
            }

            // Demostración I
            Console.WriteLine("\n--- ISP Demo ---");
            Humano humano = new Humano();
            humano.Trabajar();
            humano.Comer();
            Robot robot = new Robot();
            robot.Trabajar();

            // Demostración D
            Console.WriteLine("\n--- DIP Demo ---");
            // Se puede inyectar cualquier implementación de INotificador
            var reporteConsola = new GeneradorReporte(new NotificadorConsola());
            reporteConsola.Generar();
            var reporteEmail = new GeneradorReporte(new NotificadorEmail());
            reporteEmail.Generar();

            Console.WriteLine("\nPresiona cualquier tecla para salir.");
            Console.ReadKey();
        }
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Arquitectura y Diseño',
    'topic': 'Principios SOLID',
    'subtopic': 'Ejemplos prácticos de cada principio',
    'definition': r'''
Entender la teoría de los principios SOLID es un buen comienzo, pero donde realmente se "siente" su valor es en los ejemplos prácticos. Aquí, vamos a aterrizar cada principio con escenarios de código que te mostrarán el "antes" (cómo se suele hacer sin SOLID) y el "después" (cómo aplicar SOLID mejora el diseño).

¿Te estás preguntando por qué esto importa? Porque el código es el lenguaje universal de los desarrolladores. Ver cómo un concepto abstracto como "Responsabilidad Única" se traduce en la forma de organizar tus clases, o cómo el "Principio Abierto/Cerrado" te permite añadir funcionalidad sin tocar código existente, es clave para interiorizar estos principios y aplicarlos en tu día a día. Sin estos ejemplos, SOLID podría parecer un concepto teórico más, pero con ellos, verás cómo impacta directamente en la calidad y flexibilidad de tu software.

Vamos a ver de que se trata todo esto con ejemplos concretos para cada uno:

* **S - Single Responsibility Principle (SRP):** Imagina una clase `Reporte` que se encarga de generar el contenido del reporte, formatearlo y enviarlo por correo. Rompe el SRP. La solución es dividirla en `GeneradorReporte` (contenido), `FormateadorReporte` (formato) y `EmailService` (envío). Cada clase tiene una sola razón para cambiar.
* **O - Open/Closed Principle (OCP):** Piensa en un sistema de cálculo de salarios donde tienes un `CalculadoraSalario` con un montón de `if/else` para diferentes tipos de empleados (Gerente, Desarrollador, Vendedor). Si añades un nuevo tipo de empleado, tienes que modificar esa clase. Para cumplir OCP, crearías una interfaz `ITipoEmpleado` con un método `CalcularSalario()`, y cada tipo de empleado (Gerente, Desarrollador) implementaría esa interfaz. Así, para añadir un nuevo tipo, solo creas una nueva clase que implementa `ITipoEmpleado`, sin tocar la `CalculadoraSalario` existente.
* **L - Liskov Substitution Principle (LSP):** Un ejemplo clásico es el del Rectángulo y Cuadrado. Si un `Cuadrado` hereda de `Rectangulo`, y un método que espera un `Rectangulo` cambia su ancho y alto independientemente, romperá la invariante del `Cuadrado` (lados iguales). Para cumplir LSP, podrías hacer que tanto `Rectangulo` como `Cuadrado` hereden de una clase base `Forma` con un método `Area()`, y que cada uno implemente `Area()` de forma que mantenga su propia lógica sin romper la de su padre.
* **I - Interface Segregation Principle (ISP):** Considera una interfaz `IMaquinaMultiusos` con métodos como `Imprimir()`, `Escanear()`, `Faxear()`, `LlamarTelefono()`. Un `ImpresoraSimple` que implemente `IMaquinaMultiusos` se vería forzada a implementar métodos que no usa (como `Faxear()`), posiblemente lanzando `NotImplementedException`. Para cumplir ISP, crearías interfaces más pequeñas y específicas: `IImpresora`, `IEscaner`, `IFax`, `ITelefono`. Así, cada máquina implementa solo las interfaces que realmente necesita.
* **D - Dependency Inversion Principle (DIP):** Piensa en una clase `NotificadorWeb` que usa directamente `new SqlConnection()` para conectarse a una base de datos. Está fuertemente acoplada a una implementación concreta. Para cumplir DIP, introduces una abstracción (una interfaz) `IDataAccess` y tu `NotificadorWeb` depende de `IDataAccess`. La implementación concreta (ej. `SqlDataAccess`) se le "inyecta" al `NotificadorWeb` (por ejemplo, a través de su constructor). Esto invierte la dependencia: ahora el módulo de alto nivel (`NotificadorWeb`) no depende del de bajo nivel (`SqlDataAccess`), ambos dependen de la abstracción (`IDataAccess`).

Estos ejemplos demuestran que SOLID no son solo reglas, sino herramientas para escribir código más flexible, robusto y fácil de evolucionar.
''',
    'code_example': r'''
// Ejemplos prácticos de los principios SOLID en .NET (C#)

using System;
using System.Collections.Generic;
using System.Linq;

namespace SolidExamples
{
    // --- S: Single Responsibility Principle (SRP) ---
    // Clase que maneja la lógica de un producto.
    public class Producto
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public decimal Precio { get; set; }

        // Responsabilidad: Solo almacenar y exponer datos del producto.
    }

    // Clase para gestionar la persistencia de productos.
    public class ProductoRepository
    {
        public void Guardar(Producto producto)
        {
            Console.WriteLine($"[SRP] Producto '{producto.Nombre}' guardado en la base de datos.");
            // Lógica real de guardar en BD
        }

        public Producto ObtenerPorId(int id)
        {
            Console.WriteLine($"[SRP] Obteniendo producto con ID {id}.");
            return new Producto { Id = id, Nombre = "Ejemplo", Precio = 99.99m };
        }
    }

    // Clase para manejar notificaciones.
    public class NotificadorProducto
    {
        public void NotificarNuevoProducto(Producto producto)
        {
            Console.WriteLine($"[SRP] Notificación enviada: Nuevo producto '{producto.Nombre}' añadido.");
            // Lógica real de envío de email/SMS
        }
    }

    // --- O: Open/Closed Principle (OCP) ---
    // Abierto para extensión, cerrado para modificación.
    // Interfaz para definir el contrato de envío de mensajes.
    public interface IMensajero
    {
        void EnviarMensaje(string mensaje);
    }

    // Implementación para enviar mensajes por Email.
    public class MensajeroEmail : IMensajero
    {
        public void EnviarMensaje(string mensaje)
        {
            Console.WriteLine($"[OCP] Mensaje enviado por Email: {mensaje}");
        }
    }

    // Implementación para enviar mensajes por SMS.
    public class MensajeroSMS : IMensajero
    {
        public void EnviarMensaje(string mensaje)
        {
            Console.WriteLine($"[OCP] Mensaje enviado por SMS: {mensaje}");
        }
    }

    // Clase que utiliza el mensajero de forma genérica.
    public class NotificadorSistema
    {
        private readonly IMensajero _mensajero;

        public NotificadorSistema(IMensajero mensajero)
        {
            _mensajero = mensajero;
        }

        public void Alertar(string mensaje)
        {
            _mensajero.EnviarMensaje(mensaje);
        }
    }

    // --- L: Liskov Substitution Principle (LSP) ---
    // Los subtipos deben ser sustituibles por sus tipos base.
    public abstract class Empleado
    {
        public string Nombre { get; set; }
        public Empleado(string nombre) { Nombre = nombre; }
        public abstract decimal CalcularSalario();
    }

    public class EmpleadoTiempoCompleto : Empleado
    {
        public decimal SalarioMensual { get; set; }
        public EmpleadoTiempoCompleto(string nombre, decimal salarioMensual) : base(nombre) { SalarioMensual = salarioMensual; }
        public override decimal CalcularSalario() => SalarioMensual;
    }

    public class EmpleadoPorHoras : Empleado
    {
        public decimal HorasTrabajadas { get; set; }
        public decimal TarifaPorHora { get; set; }
        public EmpleadoPorHoras(string nombre, decimal horas, decimal tarifa) : base(nombre) { HorasTrabajadas = horas; TarifaPorHora = tarifa; }
        public override decimal CalcularSalario() => HorasTrabajadas * TarifaPorHora;
    }

    // Una función que opera sobre la clase base sin problemas con las derivadas.
    public class CalculadoraSalarios
    {
        public decimal CalcularSalarioNeto(Empleado empleado)
        {
            // La función funciona igual sin importar si es EmpleadoTiempoCompleto o EmpleadoPorHoras
            return empleado.CalcularSalario() * 0.85m; // Ejemplo de descuento de impuestos
        }
    }

    // --- I: Interface Segregation Principle (ISP) ---
    // Interfaces más pequeñas y específicas.
    public interface IAvesQueVuelan
    {
        void Volar();
    }

    public interface IAvesQueNadan
    {
        void Nadar();
    }

    public interface IAvesQueCaminan
    {
        void Caminar();
    }

    public class Gorrion : IAvesQueVuelan, IAvesQueCaminan
    {
        public void Volar() { Console.WriteLine("[ISP] Gorrión volando."); }
        public void Caminar() { Console.WriteLine("[ISP] Gorrión caminando."); }
    }

    public class Pinguino : IAvesQueNadan, IAvesQueCaminan
    {
        public void Nadar() { Console.WriteLine("[ISP] Pingüino nadando."); }
        public void Caminar() { Console.WriteLine("[ISP] Pingüino caminando."); }
    }

    // --- D: Dependency Inversion Principle (DIP) ---
    // Módulos de alto nivel no dependen de módulos de bajo nivel, ambos de abstracciones.
    public interface IBaseDeDatos
    {
        void GuardarDatos(string datos);
        string ObtenerDatos();
    }

    public class SqlServerBaseDeDatos : IBaseDeDatos
    {
        public void GuardarDatos(string datos) { Console.WriteLine($"[DIP] Guardando '{datos}' en SQL Server."); }
        public string ObtenerDatos() { return "Datos de SQL Server"; }
    }

    public class MongoDBBaseDeDatos : IBaseDeDatos
    {
        public void GuardarDatos(string datos) { Console.WriteLine($"[DIP] Guardando '{datos}' en MongoDB."); }
        public string ObtenerDatos() { return "Datos de MongoDB"; }
    }

    public class AplicacionPrincipal
    {
        private readonly IBaseDeDatos _db;

        // Inversión de control: la dependencia se "inyecta" desde fuera
        public AplicacionPrincipal(IBaseDeDatos db)
        {
            _db = db;
        }

        public void Ejecutar()
        {
            string datos = "Mi dato importante";
            _db.GuardarDatos(datos);
            string retrievedData = _db.ObtenerDatos();
            Console.WriteLine($"[DIP] Datos obtenidos: {retrievedData}");
        }
    }


    public class Program
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("--- Demostraciones de Principios SOLID ---");

            Console.WriteLine("\n--- SRP: Single Responsibility Principle ---");
            var producto = new Producto { Id = 101, Nombre = "Teclado Mecánico", Precio = 75.00m };
            var repo = new ProductoRepository();
            var notificador = new NotificadorProducto();
            repo.Guardar(producto);
            notificador.NotificarNuevoProducto(producto);

            Console.WriteLine("\n--- OCP: Open/Closed Principle ---");
            var emailNotifier = new NotificadorSistema(new MensajeroEmail());
            emailNotifier.Alertar("¡Pedido #500 procesado!");
            var smsNotifier = new NotificadorSistema(new MensajeroSMS());
            smsNotifier.Alertar("¡Tu envío ha sido despachado!");

            Console.WriteLine("\n--- LSP: Liskov Substitution Principle ---");
            var calculadoraSalarios = new CalculadoraSalarios();
            List<Empleado> empleados = new List<Empleado>
            {
                new EmpleadoTiempoCompleto("Alice", 3000m),
                new EmpleadoPorHoras("Bob", 160, 15m)
            };
            foreach (var emp in empleados)
            {
                Console.WriteLine($"Salario neto de {emp.Nombre}: {calculadoraSalarios.CalcularSalarioNeto(emp):C}");
            }

            Console.WriteLine("\n--- ISP: Interface Segregation Principle ---");
            var gorrion = new Gorrion();
            gorrion.Volar();
            gorrion.Caminar();
            var pinguino = new Pinguino();
            pinguino.Nadar();
            pinguino.Caminar();

            Console.WriteLine("\n--- DIP: Dependency Inversion Principle ---");
            var appWithSql = new AplicacionPrincipal(new SqlServerBaseDeDatos());
            appWithSql.Ejecutar();
            var appWithMongo = new AplicacionPrincipal(new MongoDBBaseDeDatos());
            appWithMongo.Ejecutar();

            Console.WriteLine("\nPresiona cualquier tecla para salir.");
            Console.ReadKey();
        }
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Arquitectura y Diseño',
    'topic': 'Patrones de Diseño',
    'subtopic': 'Singleton, Factory, Repository',
    'definition': r'''
Los patrones de diseño son soluciones probadas y reutilizables a problemas comunes que surgen en el diseño de software. Pensemos por un momento en esto como un libro de recetas para arquitectos de software: te ofrecen planos estandarizados para construir partes de tu aplicación de manera robusta y escalable. En lugar de reinventar la rueda cada vez, utilizas estas soluciones ya validadas por la comunidad.

¿Te estás preguntando por qué esto importa? Porque el desarrollo de software implica resolver problemas complejos. Los patrones de diseño te proporcionan un vocabulario común para hablar sobre soluciones de arquitectura, hacen tu código más comprensible, mantenible y extensible. Sin ellos, podrías terminar con un diseño "ad hoc" que es difícil de entender para otros (¡o para ti mismo en el futuro!), propenso a errores y costoso de modificar. Con patrones, tu código es más elegante y más fácil de colaborar.

Aquí vamos a ver tres patrones muy populares y útiles en .NET:

* **Singleton:**
    * **¿Qué es?** Asegura que una clase tenga una única instancia y proporciona un punto de acceso global a ella. Es como tener un único director en una empresa: solo hay uno, y todos saben cómo contactarlo.
    * **¿Para qué sirve?** Útil para gestionar recursos compartidos (como una configuración de aplicación, un pool de conexiones a la base de datos o un registro de eventos) donde solo necesitas una instancia para todo el sistema.
    * **Cuándo usarlo:** Cuando realmente necesitas una única instancia y un acceso global controlado.
    * **Precaución:** A menudo se abusa de él. Puede dificultar las pruebas (debido al acoplamiento) y romper el principio de responsabilidad única si la clase singleton empieza a hacer demasiadas cosas.

* **Factory Method (o Simple Factory):**
    * **¿Qué es?** Define una interfaz para crear un objeto, pero permite que las subclases decidan qué clase instanciar. La clase cliente no sabe qué clase concreta se está creando. Es como una máquina expendedora: tú pides "una bebida", y la máquina te da una Coca-Cola o un jugo sin que tú tengas que saber cómo se produce cada una.
    * **¿Para qué sirve?** Para delegar la lógica de creación de objetos a clases especializadas, desacoplando el código que utiliza los objetos del código que los crea. Esto hace tu sistema más flexible para introducir nuevos tipos de objetos sin modificar el código existente.
    * **Cuándo usarlo:** Cuando una clase no puede anticipar el tipo de objetos que necesita crear, o cuando quieres que tus librerías puedan ser extendidas por los usuarios para crear sus propias clases.

* **Repository:**
    * **¿Qué es?** Aísla la lógica de acceso a datos de la lógica de negocio de tu aplicación. Actúa como un intermediario entre el dominio de tu aplicación y la capa de persistencia (como una base de datos). Es como un bibliotecario: tú pides "el libro de historia", y él sabe dónde encontrarlo, ya sea en un estante, en un archivo digital, etc., sin que tú tengas que saber los detalles de cómo se almacena.
    * **¿Para qué sirve?** Proporciona una colección de objetos en memoria (o al menos así lo parece para el código de negocio), simplificando la manipulación de datos y haciendo que tu código sea independiente de la tecnología de base de datos subyacente. Facilita las pruebas unitarias al poder "mockear" (simular) la capa de datos.
    * **Cuándo usarlo:** En aplicaciones donde interactúas con una base de datos u otra fuente de datos persistente, para tener una capa de abstracción limpia y desacoplada.

Dominar estos patrones te dará un arsenal de herramientas para construir software más robusto y mantenible.
''',
    'code_example': r'''
// Ejemplos de Singleton, Factory y Repository en .NET (C#)

using System;
using System.Collections.Generic;
using System.Linq;

namespace DesignPatternsDemo
{
    // --- 1. Patrón Singleton ---
    // Asegura que solo exista una instancia de una clase.
    public sealed class ConfiguracionApp
    {
        private static ConfiguracionApp _instance = null;
        private static readonly object _lock = new object(); // Para hacerla thread-safe

        public string BaseDeDatosConexion { get; private set; }
        public string IdiomaPredeterminado { get; private set; }

        // Constructor privado para evitar instanciación externa
        private ConfiguracionApp()
        {
            // Simula la carga de configuración (ej. de un archivo, DB, etc.)
            BaseDeDatosConexion = "Server=localhost;Database=MiDb;...";
            IdiomaPredeterminado = "es-ES";
            Console.WriteLine("[Singleton] Configuración de la aplicación cargada.");
        }

        // Propiedad estática para obtener la única instancia
        public static ConfiguracionApp Instance
        {
            get
            {
                // Doble chequeo de bloqueo para eficiencia en escenarios multi-hilo
                if (_instance == null)
                {
                    lock (_lock)
                    {
                        if (_instance == null)
                        {
                            _instance = new ConfiguracionApp();
                        }
                    }
                }
                return _instance;
            }
        }

        public void MostrarConfiguracion()
        {
            Console.WriteLine($"[Singleton] Conexión DB: {BaseDeDatosConexion}, Idioma: {IdiomaPredeterminado}");
        }
    }


    // --- 2. Patrón Factory Method (Simple Factory) ---
    // Define una interfaz para crear un objeto, permitiendo a las subclases decidir qué clase instanciar.

    // Interfaz para los productos que serán creados por la fábrica
    public interface INotificacion
    {
        void Enviar();
    }

    // Productos concretos
    public class NotificacionEmail : INotificacion
    {
        public void Enviar() { Console.WriteLine("[Factory] Enviando notificación por Email."); }
    }

    public class NotificacionSMS : INotificacion
    {
        public void Enviar() { Console.WriteLine("[Factory] Enviando notificación por SMS."); }
    }

    // Clase Fábrica que crea instancias de Notificación
    public class NotificacionFactory
    {
        public INotificacion CrearNotificacion(string tipo)
        {
            switch (tipo.ToLower())
            {
                case "email":
                    return new NotificacionEmail();
                case "sms":
                    return new NotificacionSMS();
                default:
                    throw new ArgumentException("Tipo de notificación no soportado.");
            }
        }
    }


    // --- 3. Patrón Repository ---
    // Abstrae la lógica de acceso a datos.

    // Clase de modelo (Entidad de Dominio)
    public class Usuario
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Email { get; set; }
    }

    // Interfaz del repositorio
    public interface IUsuarioRepository
    {
        Usuario GetById(int id);
        IEnumerable<Usuario> GetAll();
        void Add(Usuario usuario);
        void Update(Usuario usuario);
        void Delete(int id);
    }

    // Implementación concreta del repositorio (simula una base de datos en memoria)
    public class UsuarioRepository : IUsuarioRepository
    {
        private List<Usuario> _usuarios = new List<Usuario>();
        private int _nextId = 1;

        public Usuario GetById(int id)
        {
            Console.WriteLine($"[Repository] Obteniendo usuario con ID: {id}");
            return _usuarios.FirstOrDefault(u => u.Id == id);
        }

        public IEnumerable<Usuario> GetAll()
        {
            Console.WriteLine("[Repository] Obteniendo todos los usuarios.");
            return _usuarios;
        }

        public void Add(Usuario usuario)
        {
            usuario.Id = _nextId++;
            _usuarios.Add(usuario);
            Console.WriteLine($"[Repository] Añadiendo usuario: {usuario.Nombre} (ID: {usuario.Id})");
        }

        public void Update(Usuario usuario)
        {
            var existingUser = GetById(usuario.Id);
            if (existingUser != null)
            {
                existingUser.Nombre = usuario.Nombre;
                existingUser.Email = usuario.Email;
                Console.WriteLine($"[Repository] Actualizando usuario: {usuario.Nombre} (ID: {usuario.Id})");
            }
        }

        public void Delete(int id)
        {
            var userToRemove = GetById(id);
            if (userToRemove != null)
            {
                _usuarios.Remove(userToRemove);
                Console.WriteLine($"[Repository] Eliminando usuario con ID: {id}");
            }
        }
    }


    public class Program
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("--- Demostración del Patrón Singleton ---");
            ConfiguracionApp config1 = ConfiguracionApp.Instance;
            ConfiguracionApp config2 = ConfiguracionApp.Instance;

            Console.WriteLine($"¿Son la misma instancia? {object.ReferenceEquals(config1, config2)}"); // Debe ser True
            config1.MostrarConfiguracion();

            // Intento incorrecto de crear una nueva instancia (no se puede debido al constructor privado)
            // ConfiguracionApp config3 = new ConfiguracionApp(); // Error de compilación


            Console.WriteLine("\n--- Demostración del Patrón Factory ---");
            NotificacionFactory factory = new NotificacionFactory();

            INotificacion emailNotificacion = factory.CrearNotificacion("email");
            emailNotificacion.Enviar();

            INotificacion smsNotificacion = factory.CrearNotificacion("SMS");
            smsNotificacion.Enviar();

            try
            {
                INotificacion pushNotificacion = factory.CrearNotificacion("push"); // Tipo no soportado
                pushNotificacion.Enviar();
            }
            catch (ArgumentException ex)
            {
                Console.WriteLine($"Error de Factory: {ex.Message}");
            }


            Console.WriteLine("\n--- Demostración del Patrón Repository ---");
            IUsuarioRepository usuarioRepo = new UsuarioRepository();

            usuarioRepo.Add(new Usuario { Nombre = "Alice", Email = "alice@example.com" });
            usuarioRepo.Add(new Usuario { Nombre = "Bob", Email = "bob@example.com" });

            Usuario userAlice = usuarioRepo.GetById(1);
            if (userAlice != null)
            {
                Console.WriteLine($"Obtenido: {userAlice.Nombre}, {userAlice.Email}");
                userAlice.Email = "alice.smith@example.com";
                usuarioRepo.Update(userAlice);
            }

            Console.WriteLine("\nTodos los usuarios después de la actualización:");
            foreach (var user in usuarioRepo.GetAll())
            {
                Console.WriteLine($"- {user.Id}: {user.Nombre}, {user.Email}");
            }

            usuarioRepo.Delete(2); // Eliminar a Bob
            Console.WriteLine("\nTodos los usuarios después de la eliminación:");
            foreach (var user in usuarioRepo.GetAll())
            {
                Console.WriteLine($"- {user.Id}: {user.Nombre}, {user.Email}");
            }


            Console.WriteLine("\nPresiona cualquier tecla para salir.");
            Console.ReadKey();
        }
    }

    // Ejemplo incorrecto de Singleton: Si el constructor no es privado, o si no es thread-safe.
    // Esto podría llevar a múltiples instancias y comportamientos inconsistentes.
    /*
    public class BadSingleton
    {
        public static BadSingleton Instance { get; set; } = new BadSingleton(); // No es lazy, no es thread-safe
        public BadSingleton() { } // Constructor público
    }
    */

    // Ejemplo incorrecto de Factory: Si la lógica de creación está mezclada con la lógica de negocio.
    /*
    public class BadOrderProcessor
    {
        public void ProcessOrder(string notificationType, string message)
        {
            if (notificationType == "email")
            {
                new NotificacionEmail().Enviar(); // Creación directa, acoplada
            }
            else if (notificationType == "sms")
            {
                new NotificacionSMS().Enviar();
            }
            // Si añades un nuevo tipo de notificación, tienes que modificar esta clase.
        }
    }
    */

    // Ejemplo incorrecto de Repository: Acceder a la base de datos directamente desde la lógica de negocio.
    /*
    public class BadUserService
    {
        public void CreateUser(string name, string email)
        {
            // Lógica de BD mezclada con lógica de servicio
            using (var conn = new System.Data.SqlClient.SqlConnection("..."))
            {
                conn.Open();
                using (var cmd = new System.Data.SqlClient.SqlCommand("INSERT ...", conn))
                {
                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
    */
}
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Mid',
    'level': 1,
    'title_level': 'Arquitectura y Diseño',
    'topic': 'Patrones de Diseño',
    'subtopic': 'Implementación en proyectos reales',
    'definition': r'''
Implementar patrones de diseño en proyectos reales no es solo copiar y pegar código; es entender el problema que resuelven y cuándo aplicarlos de manera efectiva. Pensemos por un momento en esto como un carpintero experimentado que no solo sabe cómo usar un martillo y un serrucho, sino que también sabe cuándo usar cada herramienta y cómo combinar sus habilidades para construir algo complejo y duradero.

¿Te estás preguntando por qué esto importa? Porque el objetivo final de usar patrones es construir software más robusto, flexible y fácil de mantener a lo largo del tiempo. Un patrón mal aplicado puede generar más complejidad que beneficios, mientras que un patrón bien implementado puede simplificar enormemente el desarrollo y la evolución de un sistema. En proyectos reales, donde el código crece y cambia constantemente, los patrones se convierten en tus aliados para gestionar esa complejidad y asegurar la calidad.

Aquí te doy algunas consideraciones clave y ejemplos de cómo se aplican los patrones que hemos visto en el "mundo real" de .NET:

* **Singleton en la vida real:**
    * **Configuración de la aplicación:** Una de las aplicaciones más comunes es para un objeto de configuración global que carga ajustes (conexión a DB, URLs de servicios, etc.) una sola vez al inicio de la aplicación y luego los expone para todo el sistema.
    * **Manejador de Logs:** Un único punto de entrada para escribir mensajes en un archivo de log, asegurando que todos los hilos escriban de forma segura y consistente.
    * **Pool de Conexiones a Base de Datos:** Aunque a menudo se maneja con frameworks, conceptualmente, un pool de conexiones puede verse como un singleton que administra un conjunto limitado de conexiones para ser reutilizadas, optimizando el rendimiento.

* **Factory en la vida real:**
    * **Creación de objetos complejos:** Cuando tienes una jerarquía de clases y la creación de sus objetos es compleja (requiere varias dependencias, lógica condicional), un Factory puede encapsular esa complejidad. Por ejemplo, en un juego, un `FactoryDeEnemigos` podría crear diferentes tipos de enemigos (`Goblin`, `Orco`, `Dragon`) basados en un nivel de juego o dificultad.
    * **Integración con servicios externos:** Si tu aplicación necesita interactuar con diferentes proveedores de pago (PayPal, Stripe, etc.), un `FactoryDeProcesadoresDePago` puede devolver la implementación correcta de `IProcesadorDePago` basada en el tipo de pago seleccionado por el usuario. Esto permite añadir nuevos proveedores sin modificar el código que procesa el pago.

* **Repository en la vida real:**
    * **Aplicaciones con Base de Datos:** Esencial en cualquier aplicación que interactúe con una base de datos (SQL Server, Cosmos DB, etc.). La capa de repositorio proporciona métodos como `ObtenerUsuarioPorId()`, `GuardarProducto()`, `EliminarPedido()`, etc., sin exponer los detalles de ADO.NET, Entity Framework Core o Dapper a la lógica de negocio.
    * **Facilitar Pruebas Unitarias:** En un proyecto real, el Repository es clave para las pruebas. Puedes "mockear" (simular) la interfaz `IUsuarioRepository` en tus pruebas de lógica de negocio, lo que significa que no necesitas una base de datos real para probar tus servicios, haciendo las pruebas más rápidas y fiables.
    * **Cambio de tecnología de persistencia:** Si en el futuro decides cambiar de SQL Server a MongoDB, solo necesitas crear una nueva implementación de `IBaseDeDatos` (o `IUsuarioRepository`) y actualizar la inyección de dependencias, sin tocar la lógica de negocio.

La clave para usar patrones en proyectos reales es entender que son herramientas, no dogmas. Úsalos cuando resuelvan un problema real y no los fuerces donde la complejidad no lo justifica.
''',
    'code_example': r'''
// Ejemplos de implementación de patrones de diseño en un contexto de proyecto real en .NET (C#)

using System;
using System.Collections.Generic;
using System.Linq;

namespace RealWorldDesignPatterns
{
    // --- 1. Singleton: Gestión de Sesiones de Usuario ---
    // En una aplicación web o de escritorio, podrías tener una única instancia para gestionar las sesiones de usuario.
    public sealed class SesionManager
    {
        private static SesionManager _instance = null;
        private static readonly object _lock = new object();
        private Dictionary<string, DateTime> _sesionesActivas = new Dictionary<string, DateTime>();

        private SesionManager()
        {
            Console.WriteLine("[Singleton Real] SesionManager inicializado.");
        }

        public static SesionManager Instance
        {
            get
            {
                if (_instance == null)
                {
                    lock (_lock)
                    {
                        if (_instance == null)
                        {
                            _instance = new SesionManager();
                        }
                    }
                }
                return _instance;
            }
        }

        public string IniciarSesion(string userId)
        {
            string sessionId = Guid.NewGuid().ToString();
            _sesionesActivas[sessionId] = DateTime.Now;
            Console.WriteLine($"[Singleton Real] Sesión {sessionId} iniciada para usuario {userId}.");
            return sessionId;
        }

        public bool ValidarSesion(string sessionId)
        {
            return _sesionesActivas.ContainsKey(sessionId);
        }

        public void CerrarSesion(string sessionId)
        {
            _sesionesActivas.Remove(sessionId);
            Console.WriteLine($"[Singleton Real] Sesión {sessionId} cerrada.");
        }
    }

    // --- 2. Factory: Procesamiento de Pagos ---
    // Una aplicación de comercio electrónico que procesa pagos a través de diferentes pasarelas.

    // Interfaz común para todas las pasarelas de pago
    public interface IProcesadorPago
    {
        bool ProcesarPago(decimal monto, string numeroTarjeta, string ccv);
    }

    // Implementación concreta para PayPal
    public class ProcesadorPagoPayPal : IProcesadorPago
    {
        public bool ProcesarPago(decimal monto, string numeroTarjeta, string ccv)
        {
            Console.WriteLine($"[Factory Real] Procesando pago de ${monto} con PayPal para tarjeta {numeroTarjeta.Substring(0, 4)}XXXX.");
            // Lógica real de integración con la API de PayPal
            return true;
        }
    }

    // Implementación concreta para Stripe
    public class ProcesadorPagoStripe : IProcesadorPago
    {
        public bool ProcesarPago(decimal monto, string numeroTarjeta, string ccv)
        {
            Console.WriteLine($"[Factory Real] Procesando pago de ${monto} con Stripe para tarjeta {numeroTarjeta.Substring(0, 4)}XXXX.");
            // Lógica real de integración con la API de Stripe
            return true;
        }
    }

    // Clase Fábrica que abstrae la creación de procesadores de pago
    public class ProcesadorPagoFactory
    {
        public IProcesadorPago CrearProcesador(string tipoPago)
        {
            switch (tipoPago.ToLower())
            {
                case "paypal":
                    return new ProcesadorPagoPayPal();
                case "stripe":
                    return new ProcesadorPagoStripe();
                default:
                    throw new ArgumentException("Pasarela de pago no soportada.");
            }
        }
    }

    // --- 3. Repository: Gestión de Productos con ORM (ej. Entity Framework Core, Dapper) ---
    // Un repositorio para la entidad Producto, que encapsula el acceso a datos.

    public class Producto
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public decimal Precio { get; set; }
        public int Stock { get; set; }
    }

    // Interfaz del repositorio
    public interface IProductoRepository
    {
        Producto GetById(int id);
        IEnumerable<Producto> GetAll();
        void Add(Producto producto);
        void Update(Producto producto);
        void Delete(int id);
    }

    // Implementación del repositorio usando Entity Framework Core (simulado)
    // En un proyecto real, esto interactuaría con un DbContext.
    public class ProductoRepositoryEF : IProductoRepository
    {
        // Simulación de un DbContext o un conjunto de datos en memoria
        private List<Producto> _productosDb = new List<Producto>();
        private int _nextId = 1;

        public ProductoRepositoryEF()
        {
            // Datos iniciales
            _productosDb.Add(new Producto { Id = _nextId++, Nombre = "Monitor 27\"", Precio = 250.00m, Stock = 10 });
            _productosDb.Add(new Producto { Id = _nextId++, Nombre = "Webcam HD", Precio = 50.00m, Stock = 25 });
        }

        public Producto GetById(int id)
        {
            Console.WriteLine($"[Repository Real] EF: Buscando producto ID {id}...");
            return _productosDb.FirstOrDefault(p => p.Id == id);
        }

        public IEnumerable<Producto> GetAll()
        {
            Console.WriteLine("[Repository Real] EF: Obteniendo todos los productos...");
            return _productosDb.AsEnumerable();
        }

        public void Add(Producto producto)
        {
            producto.Id = _nextId++;
            _productosDb.Add(producto);
            Console.WriteLine($"[Repository Real] EF: Producto '{producto.Nombre}' añadido (ID: {producto.Id}).");
        }

        public void Update(Producto producto)
        {
            var existing = _productosDb.FirstOrDefault(p => p.Id == producto.Id);
            if (existing != null)
            {
                existing.Nombre = producto.Nombre;
                existing.Precio = producto.Precio;
                existing.Stock = producto.Stock;
                Console.WriteLine($"[Repository Real] EF: Producto '{producto.Nombre}' (ID: {producto.Id}) actualizado.");
            }
        }

        public void Delete(int id)
        {
            var toRemove = _productosDb.FirstOrDefault(p => p.Id == id);
            if (toRemove != null)
            {
                _productosDb.Remove(toRemove);
                Console.WriteLine($"[Repository Real] EF: Producto ID {id} eliminado.");
            }
        }
    }


    public class Program
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("--- Implementación en Proyectos Reales: Demostraciones ---");

            Console.WriteLine("\n--- Singleton: SesionManager ---");
            string userId = "devUser123";
            string sessionId = SesionManager.Instance.IniciarSesion(userId);
            Console.WriteLine($"Sesión iniciada: {sessionId}");
            Console.WriteLine($"Sesión {sessionId} válida? {SesionManager.Instance.ValidarSesion(sessionId)}");
            SesionManager.Instance.CerrarSesion(sessionId);
            Console.WriteLine($"Sesión {sessionId} válida después de cerrar? {SesionManager.Instance.ValidarSesion(sessionId)}");


            Console.WriteLine("\n--- Factory: Procesamiento de Pagos ---");
            ProcesadorPagoFactory pagoFactory = new ProcesadorPagoFactory();

            IProcesadorPago paypalProcessor = pagoFactory.CrearProcesador("paypal");
            paypalProcessor.ProcesarPago(150.75m, "4111222233334444", "123");

            IProcesadorPago stripeProcessor = pagoFactory.CrearProcesador("stripe");
            stripeProcessor.ProcesarPago(29.99m, "5555666677778888", "456");

            try
            {
                IProcesadorPago unknownProcessor = pagoFactory.CrearProcesador("bitcoin");
                unknownProcessor.ProcesarPago(10m, "", "");
            }
            catch (ArgumentException ex)
            {
                Console.WriteLine($"Error al crear procesador: {ex.Message}");
            }


            Console.WriteLine("\n--- Repository: Gestión de Productos (con EF simulado) ---");
            IProductoRepository productoRepo = new ProductoRepositoryEF();

            // Añadir un nuevo producto
            productoRepo.Add(new Producto { Nombre = "Auriculares Bluetooth", Precio = 89.99m, Stock = 50 });

            // Obtener todos los productos
            Console.WriteLine("\nLista de productos:");
            foreach (var p in productoRepo.GetAll())
            {
                Console.WriteLine($"- ID: {p.Id}, Nombre: {p.Nombre}, Precio: {p.Precio:C}, Stock: {p.Stock}");
            }

            // Actualizar un producto
            Producto webcam = productoRepo.GetById(2);
            if (webcam != null)
            {
                webcam.Precio = 45.00m;
                webcam.Stock = 20;
                productoRepo.Update(webcam);
            }

            // Obtener el producto actualizado
            Producto updatedWebcam = productoRepo.GetById(2);
            Console.WriteLine($"\nWebcam actualizada: ID: {updatedWebcam.Id}, Nombre: {updatedWebcam.Nombre}, Precio: {updatedWebcam.Precio:C}, Stock: {updatedWebcam.Stock}");

            Console.WriteLine("\nPresiona cualquier tecla para salir.");
            Console.ReadKey();
        }
    }

    // Ejemplo incorrecto de aplicar un patrón: Sobre-ingeniería.
    // Usar un patrón de diseño cuando la solución simple es suficiente.
    // Por ejemplo, crear un Factory para crear un solo tipo de objeto que no va a cambiar nunca,
    // o un Repository para una aplicación que solo lee datos de un archivo CSV simple.
    // Los patrones deben resolver problemas reales, no añadir complejidad innecesaria.
    '''
  });
}

Future<void> insertPuntonetMidLevel2Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Servicios y Comunicación',
    'topic': 'Windows Communication Foundation (WCF)',
    'subtopic': 'Creación de servicios WCF',
    'definition': r'''
Windows Communication Foundation (WCF) es un framework de Microsoft para construir y consumir servicios distribuidos y orientados a servicios. Pensemos por un momento en esto como un sistema de correos ultraseguro y flexible para que diferentes partes de una aplicación (o diferentes aplicaciones completamente) se comuniquen entre sí, sin importar dónde estén o cómo estén construidas.

¿Te estás preguntando por qué esto importa? Porque las aplicaciones modernas rara vez son sistemas monolíticos y aislados. Necesitan comunicarse con bases de datos, con otras aplicaciones, con servicios en la nube, y WCF fue la respuesta de Microsoft para estandarizar y simplificar esta comunicación. Te permite crear servicios que pueden ser accedidos por una variedad de clientes (aplicaciones de escritorio, web, móviles) utilizando diferentes protocolos de comunicación, lo que reduce la complejidad de la integración y te da una gran flexibilidad.

La creación de un servicio WCF se basa en el concepto de "contratos":
* **Contrato de Servicio (`ServiceContract`):** Define qué operaciones expone tu servicio. Esencialmente, es una interfaz (o una clase con este atributo) que declara los métodos que los clientes pueden llamar. Cada método que quieres que sea accesible desde fuera debe tener el atributo `[OperationContract]`.
* **Contrato de Datos (`DataContract`):** Define los tipos de datos complejos (clases) que se pasarán entre el cliente y el servicio. Las propiedades de estas clases que quieres que sean parte del contrato deben tener el atributo `[DataMember]`. Esto asegura que tanto el cliente como el servicio entiendan la estructura de los datos.
* **Contrato de Mensajes (`MessageContract` - menos común en usos básicos):** Permite un control más fino sobre la estructura del mensaje SOAP subyacente.

Una vez que defines tus contratos, simplemente implementas el `ServiceContract` en una clase. Esta clase es la que contendrá la lógica de negocio real de tu servicio. Luego, el servicio WCF puede ser "hosteado" de varias maneras: en una aplicación de consola, en un servicio de Windows, en IIS (Internet Information Services) o en una aplicación web, lo que le da una enorme versatilidad para desplegar tus soluciones.
''',
    'code_example': r'''
// Ejemplo de creación de un servicio WCF básico

using System;
using System.ServiceModel; // Necesario para ServiceContract, OperationContract, etc.
using System.Runtime.Serialization; // Necesario para DataContract, DataMember

namespace WcfServiceDemo
{
    // --- 1. Definición del Contrato de Datos ---
    // Representa una persona con datos que se pueden enviar/recibir.
    [DataContract] // Indica que esta clase puede ser serializada para WCF
    public class Persona
    {
        [DataMember] // Indica que esta propiedad es parte del contrato de datos
        public int Id { get; set; }

        [DataMember]
        public string Nombre { get; set; }

        [DataMember]
        public string Apellido { get; set; }

        [DataMember]
        public int Edad { get; set; }
    }

    // --- 2. Definición del Contrato de Servicio ---
    // Define las operaciones que el servicio expondrá.
    [ServiceContract] // Indica que esta interfaz es un contrato de servicio WCF
    public interface IGestionPersonas
    {
        [OperationContract] // Indica que este método es una operación del servicio
        string Saludar(string nombre);

        [OperationContract]
        Persona ObtenerPersonaPorId(int id);

        [OperationContract]
        void GuardarPersona(Persona persona);

        [OperationContract]
        List<Persona> ObtenerTodasLasPersonas();
    }

    // --- 3. Implementación del Servicio ---
    // Proporciona la lógica real para las operaciones definidas en el contrato.
    public class ServicioGestionPersonas : IGestionPersonas
    {
        // Simulación de una base de datos en memoria
        private static List<Persona> _personas = new List<Persona>
        {
            new Persona { Id = 1, Nombre = "Juan", Apellido = "Perez", Edad = 30 },
            new Persona { Id = 2, Nombre = "Maria", Apellido = "Gomez", Edad = 25 }
        };
        private static int _nextId = 3;

        public string Saludar(string nombre)
        {
            Console.WriteLine($"[Servicio] Recibida solicitud Saludar para: {nombre}");
            return $"Hola, {nombre}! Bienvenido al servicio WCF de gestión de personas.";
        }

        public Persona ObtenerPersonaPorId(int id)
        {
            Console.WriteLine($"[Servicio] Recibida solicitud ObtenerPersonaPorId para ID: {id}");
            return _personas.FirstOrDefault(p => p.Id == id);
        }

        public void GuardarPersona(Persona persona)
        {
            Console.WriteLine($"[Servicio] Recibida solicitud GuardarPersona para: {persona?.Nombre}");
            if (persona == null) return;

            if (persona.Id == 0) // Es un nuevo registro
            {
                persona.Id = _nextId++;
                _personas.Add(persona);
                Console.WriteLine($"[Servicio] Persona {persona.Nombre} (ID: {persona.Id}) añadida.");
            }
            else // Es una actualización
            {
                var existingPerson = _personas.FirstOrDefault(p => p.Id == persona.Id);
                if (existingPerson != null)
                {
                    existingPerson.Nombre = persona.Nombre;
                    existingPerson.Apellido = persona.Apellido;
                    existingPerson.Edad = persona.Edad;
                    Console.WriteLine($"[Servicio] Persona {persona.Nombre} (ID: {persona.Id}) actualizada.");
                }
                else
                {
                    Console.WriteLine($"[Servicio] No se encontró persona con ID {persona.Id} para actualizar.");
                }
            }
        }

        public List<Persona> ObtenerTodasLasPersonas()
        {
            Console.WriteLine("[Servicio] Recibida solicitud ObtenerTodasLasPersonas.");
            return _personas;
        }
    }


    // --- 4. Hosting del Servicio (en una aplicación de consola para este ejemplo simple) ---
    public class Program
    {
        public static void Main(string[] args)
        {
            // Crea una instancia de ServiceHost para el servicio
            // La base address es la dirección donde el servicio estará disponible
            using (ServiceHost host = new ServiceHost(typeof(ServicioGestionPersonas),
                                                     new Uri("http://localhost:8000/GestionPersonas")))
            {
                // Añade un endpoint al servicio.
                // Un endpoint es una combinación de:
                // - Address (dónde encontrarlo)
                // - Binding (cómo comunicarse)
                // - Contract (qué funcionalidad ofrece)
                host.AddServiceEndpoint(typeof(IGestionPersonas),
                                        new WSHttpBinding(), // Un binding popular para HTTP y SOAP
                                        ""); // La dirección relativa, vacía significa que usa la base address

                // Para permitir que se genere la ayuda WSDL (para que los clientes puedan descubrir el servicio)
                // Esto es útil durante el desarrollo.
                System.ServiceModel.Description.ServiceMetadataBehavior smb =
                    new System.ServiceModel.Description.ServiceMetadataBehavior();
                smb.HttpGetEnabled = true;
                host.Description.Behaviors.Add(smb);

                // Abre el host de servicio para que el servicio empiece a escuchar peticiones
                host.Open();
                Console.WriteLine("Servicio WCF 'GestionPersonas' está listo y escuchando en:");
                foreach (var endpoint in host.Description.Endpoints)
                {
                    Console.WriteLine($"- {endpoint.Address} ({endpoint.Binding.Name} / {endpoint.Contract.Name})");
                }
                Console.WriteLine("\nPresiona <Enter> para detener el servicio.");
                Console.ReadLine();

                // Cierra el host de servicio
                host.Close();
                Console.WriteLine("Servicio WCF detenido.");
            }
        }
    }

    // Ejemplo incorrecto: No usar contratos de servicio/datos.
    // Intentar exponer métodos públicos de una clase directamente sin [ServiceContract] y [OperationContract].
    // WCF necesita estos atributos para saber qué exponer y cómo serializar/deserializar los datos.
    // Sin ellos, el servicio no será accesible o los datos no se transferirán correctamente.
    /*
    public class MyBadService
    {
        public string GetMessage() { return "Hello!"; } // Sin [OperationContract]
    }
    // Si intentas hostear MyBadService, WCF no sabrá qué método exponer.
    */
}
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Servicios y Comunicación',
    'topic': 'Windows Communication Foundation (WCF)',
    'subtopic': 'Configuración de endpoints y bindings',
    'definition': r'''
La configuración de los endpoints y bindings en WCF es como definir las "puertas de entrada" y los "protocolos de comunicación" de tu servicio. Pensemos por un momento en esto como en un edificio de oficinas: el "endpoint" es la dirección física de la oficina (la URL), y el "binding" es el tipo de camino que usas para llegar allí (coche, autobús, tren) y el idioma en que te comunicas una vez dentro.

¿Te estás preguntando por qué esto importa? Porque un servicio WCF es inútil si los clientes no saben cómo conectarse a él y cómo hablar con él. Los endpoints y bindings son la clave para hacer que tu servicio sea accesible y funcional. Permiten que tu servicio sea flexible y pueda ser consumido por una variedad de clientes, cada uno con sus propias necesidades de comunicación, sin tener que reescribir el servicio. Esto es crucial para la interoperabilidad y la capacidad de tu aplicación para comunicarse en diferentes entornos.

Un **Endpoint** en WCF se define con la "ABC":
* **Address (Dirección):** Es la ubicación donde se puede acceder al servicio. Generalmente es una URL (Uniform Resource Locator) que especifica el protocolo (HTTP, TCP, MSMQ), la máquina y el puerto.
    * Ejemplo: `http://localhost:8000/MiServicio/`
* **Binding (Enlace/Protocolo):** Define cómo se comunica el servicio. Esto incluye el transporte (HTTP, TCP), el codificación de mensajes (texto/XML para SOAP, binario, MTOM) y los protocolos de seguridad (autenticación, cifrado). WCF ofrece muchos bindings preconfigurados:
    * `BasicHttpBinding`: Para servicios SOAP básicos y amplia interoperabilidad con sistemas no-WCF (como Java o PHP). Es el más "viejo" y compatible.
    * `WSHttpBinding`: Ofrece más características avanzadas de WS-*, como seguridad (WS-Security), transacciones (WS-Transaction) y fiabilidad (WS-ReliableMessaging). Es más rico pero menos interoperable con clientes no-WCF simples.
    * `NetTcpBinding`: Optimizado para comunicación WCF a WCF dentro del mismo entorno Windows/LAN. Es el más rápido y eficiente, usando TCP directamente, pero no es interoperable con sistemas que no sean .NET.
    * `WebHttpBinding`: Para crear servicios RESTful (que usan HTTP y formatos como JSON/XML sin SOAP). Requiere un comportamiento de endpoint especial.
* **Contract (Contrato):** Es la interfaz de servicio que el endpoint expone (lo que definiste con `[ServiceContract]`).

Puedes configurar tus endpoints y bindings de dos maneras principales:
1.  **Programáticamente (en código):** Esto es útil para servicios que se hostean en aplicaciones de consola o servicios de Windows, donde tienes control directo sobre el código de inicio. Te da flexibilidad, pero requiere recompilación para cambiar la configuración.
2.  **Configuración (en un archivo `App.config` o `Web.config`):** Esta es la forma más común, especialmente para servicios hosteados en IIS. Permite modificar la dirección y el binding sin necesidad de recompilar el servicio, lo que es ideal para despliegues y entornos diferentes (desarrollo, pruebas, producción). Es una forma muy poderosa de gestionar la flexibilidad del servicio.

Entender cómo manipular estas configuraciones es fundamental para desplegar y depurar servicios WCF de manera efectiva.
''',
    'code_example': r'''
// Ejemplo de configuración de endpoints y bindings en WCF

using System;
using System.ServiceModel;
using System.Runtime.Serialization;
using System.Collections.Generic;
using System.Linq;
using System.Configuration; // Necesario para leer la configuración desde App.config

namespace WcfConfigurationDemo
{
    // Reutilizamos el contrato de servicio y datos del ejemplo anterior
    [DataContract]
    public class Persona
    {
        [DataMember]
        public int Id { get; set; }
        [DataMember]
        public string Nombre { get; set; }
        [DataMember]
        public string Apellido { get; set; }
        [DataMember]
        public int Edad { get; set; }
    }

    [ServiceContract]
    public interface IGestionPersonas
    {
        [OperationContract]
        string Saludar(string nombre);

        [OperationContract]
        Persona ObtenerPersonaPorId(int id);

        [OperationContract]
        void GuardarPersona(Persona persona);

        [OperationContract]
        List<Persona> ObtenerTodasLasPersonas();
    }

    public class ServicioGestionPersonas : IGestionPersonas
    {
        private static List<Persona> _personas = new List<Persona>
        {
            new Persona { Id = 1, Nombre = "Juan", Apellido = "Perez", Edad = 30 },
            new Persona { Id = 2, Nombre = "Maria", Apellido = "Gomez", Edad = 25 }
        };
        private static int _nextId = 3;

        public string Saludar(string nombre) => $"Hola, {nombre}! (desde servicio WCF).";
        public Persona ObtenerPersonaPorId(int id) => _personas.FirstOrDefault(p => p.Id == id);
        public void GuardarPersona(Persona persona)
        {
            if (persona.Id == 0) { persona.Id = _nextId++; _personas.Add(persona); }
            else { var existing = _personas.FirstOrDefault(p => p.Id == persona.Id); if (existing != null) { existing.Nombre = persona.Nombre; existing.Apellido = persona.Apellido; existing.Edad = persona.Edad; } }
            Console.WriteLine($"[Servicio] Operación GuardarPersona para: {persona?.Nombre}");
        }
        public List<Persona> ObtenerTodasLasPersonas() => _personas;
    }


    public class Program
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("--- Demostración de Configuración de Endpoints y Bindings ---");

            // --- Hosting Programático ---
            Console.WriteLine("\n--- Hosting Programático ---");
            // Puedes tener múltiples ServiceHost si expones diferentes servicios
            ServiceHost hostProgrammatic = null;
            try
            {
                // Dirección base
                Uri baseAddress = new Uri("http://localhost:8001/MiServicioProgramatico");

                hostProgrammatic = new ServiceHost(typeof(ServicioGestionPersonas), baseAddress);

                // Añadir un endpoint con BasicHttpBinding
                hostProgrammatic.AddServiceEndpoint(typeof(IGestionPersonas), new BasicHttpBinding(), "basic");
                Console.WriteLine("Endpoint programático BasicHttpBinding añadido.");

                // Añadir un endpoint con WSHttpBinding (para seguridad, transacciones, etc.)
                hostProgrammatic.AddServiceEndpoint(typeof(IGestionPersonas), new WSHttpBinding(), "ws");
                Console.WriteLine("Endpoint programático WSHttpBinding añadido.");

                // Habilitar metadatos para que los clientes puedan descubrir el servicio
                System.ServiceModel.Description.ServiceMetadataBehavior smb =
                    new System.ServiceModel.Description.ServiceMetadataBehavior { HttpGetEnabled = true };
                hostProgrammatic.Description.Behaviors.Add(smb);

                hostProgrammatic.Open();
                Console.WriteLine("Servicio programático está listo. URLs:");
                foreach (var endpoint in hostProgrammatic.Description.Endpoints)
                {
                    Console.WriteLine($"- {endpoint.Address}");
                }
                Console.WriteLine("Puedes acceder al WSDL en: http://localhost:8001/MiServicioProgramatico/basic?wsdl");

            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error en hosting programático: {ex.Message}");
            }


            // --- Hosting Basado en Configuración (App.config) ---
            Console.WriteLine("\n--- Hosting Basado en Configuración (App.config) ---");
            ServiceHost hostConfig = null;
            try
            {
                // El constructor sin parámetros lee la configuración desde App.config
                hostConfig = new ServiceHost(typeof(ServicioGestionPersonas));
                hostConfig.Open();
                Console.WriteLine("Servicio configurado en App.config está listo. URLs:");
                foreach (var endpoint in hostConfig.Description.Endpoints)
                {
                    Console.WriteLine($"- {endpoint.Address}");
                }
                Console.WriteLine("Puedes acceder al WSDL en: http://localhost:8002/GestionPersonasConfig/mex"); // O dirección específica del endpoint

            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error en hosting por configuración: {ex.Message}");
            }


            Console.WriteLine("\nPresiona <Enter> para detener los servicios.");
            Console.ReadLine();

            // Cierre de hosts
            if (hostProgrammatic != null && hostProgrammatic.State == CommunicationState.Opened)
                hostProgrammatic.Close();
            if (hostConfig != null && hostConfig.State == CommunicationState.Opened)
                hostConfig.Close();

            Console.WriteLine("Servicios WCF detenidos.");
            Console.ReadKey();
        }
    }

    /*
    // --- Contenido del archivo App.config para el hosting basado en configuración ---
    // Este archivo debe ser añadido a tu proyecto de consola y configurado como "Copiar siempre".
    <?xml version="1.0" encoding="utf-8" ?>
    <configuration>
        <startup>
            <supportedRuntime version="v4.0" sku=".NETFramework,Version=v4.7.2" />
        </startup>
        <system.serviceModel>
            <services>
                <service name="WcfConfigurationDemo.ServicioGestionPersonas"
                         behaviorConfiguration="MyServiceBehavior">
                    <endpoint address="http://localhost:8002/GestionPersonasConfig/basic"
                              binding="basicHttpBinding"
                              contract="WcfConfigurationDemo.IGestionPersonas" />
                    <endpoint address="net.tcp://localhost:8003/GestionPersonasConfig/tcp"
                              binding="netTcpBinding"
                              contract="WcfConfigurationDemo.IGestionPersonas" />
                    <endpoint address="mex"
                              binding="mexHttpBinding"
                              contract="IMetadataExchange" />
                    <host>
                        <baseAddresses>
                            <add baseAddress="http://localhost:8002/GestionPersonasConfig/" />
                        </baseAddresses>
                    </host>
                </service>
            </services>
            <behaviors>
                <serviceBehaviors>
                    <behavior name="MyServiceBehavior">
                        <serviceMetadata httpGetEnabled="true" />
                        <serviceDebug includeExceptionDetailInFaults="true" />
                    </behavior>
                </serviceBehaviors>
            </behaviors>
        </system.serviceModel>
    </configuration>
    */

    // Ejemplo incorrecto: Mezclar demasiado las configuraciones programáticas y de archivo.
    // Aunque es posible, puede volverse confuso. Generalmente, se elige una u otra
    // como la fuente principal de configuración para un servicio dado.
    // También, no definir un endpoint MEX cuando los clientes necesitan descubrir el servicio dinámicamente.
}
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Servicios y Comunicación',
    'topic': 'Windows Communication Foundation (WCF)',
    'subtopic': 'Seguridad en servicios WCF',
    'definition': r'''
La seguridad en servicios WCF es un tema crucial que te permite proteger tus comunicaciones y datos de accesos no autorizados, manipulaciones o filtraciones. Pensemos por un momento en esto como la armadura y el cifrado que utilizas para proteger tus mensajes más valiosos: no solo aseguras que solo el destinatario correcto pueda leerlos, sino que también garantizas que no sean alterados en el camino.

¿Te estás preguntando por qué esto importa? Porque los servicios WCF a menudo exponen lógica de negocio y datos sensibles que deben ser protegidos. Sin medidas de seguridad adecuadas, tu servicio podría ser vulnerable a ataques, comprometiendo la integridad y confidencialidad de tu información. La seguridad en WCF te da las herramientas para implementar autenticación (quién eres), autorización (qué puedes hacer) e integridad/confidencialidad (protección de los datos en tránsito), elementos fundamentales en cualquier aplicación empresarial.

WCF ofrece un modelo de seguridad muy flexible y configurable, que se integra con los bindings y los comportamientos del servicio. Se basa en tres pilares principales:

1.  **Seguridad de Mensaje (Message Security):**
    * La seguridad se aplica directamente al mensaje SOAP, antes de que sea enviado.
    * Utiliza estándares como WS-Security para cifrar y firmar digitalmente el mensaje.
    * La seguridad es "end-to-end", lo que significa que el mensaje permanece seguro a lo largo de toda la cadena de comunicación, incluso si pasa por intermediarios.
    * Es más flexible pero también puede ser más complejo de configurar y tener un impacto en el rendimiento.

2.  **Seguridad de Transporte (Transport Security):**
    * La seguridad se aplica a nivel del canal de transporte (ej. SSL/TLS para HTTP, TCP/IP).
    * Cifra y firma todo el canal de comunicación.
    * Es más fácil de configurar y generalmente más eficiente que la seguridad de mensaje.
    * La seguridad es "hop-by-hop", lo que significa que el mensaje está protegido solo entre dos puntos de la comunicación (por ejemplo, entre cliente y un proxy, y luego entre el proxy y el servicio). Si el mensaje pasa por múltiples nodos, cada "salto" debe ser seguro.

3.  **Seguridad a nivel de Miembro (Endpoint Security):**
    * La seguridad se configura en el endpoint, combinando elementos del transporte y/o mensaje.
    * Puedes configurar diferentes modos de seguridad en tus bindings, como:
        * `None`: Sin seguridad (solo para desarrollo o redes internas muy seguras).
        * `Transport`: Utiliza la seguridad del transporte (ej. HTTPS).
        * `Message`: Utiliza la seguridad a nivel de mensaje.
        * `TransportWithMessageCredential`: Combina seguridad de transporte para el canal y credenciales a nivel de mensaje (ej. certificado SSL para el canal y nombre de usuario/contraseña en el mensaje).

Los mecanismos de credenciales para la autenticación pueden incluir:
* **Windows:** Utiliza la autenticación integrada de Windows (Kerberos o NTLM), ideal para entornos de dominio.
* **UserName:** Nombre de usuario y contraseña (usualmente cifrados y enviados a través de un canal seguro).
* **Certificate:** Certificados X.509, que proporcionan una autenticación fuerte.
* **IssuedToken:** Tokens de seguridad emitidos por un servicio de seguridad (como un STS en escenarios de federación de identidad).

Configurar la seguridad en WCF requiere un entendimiento claro de los requisitos de tu aplicación y del entorno de despliegue, ya que una mala configuración podría dejar tu servicio vulnerable o inaccesible.
''',
    'code_example': r'''
// Ejemplo de seguridad en servicios WCF

using System;
using System.ServiceModel;
using System.Runtime.Serialization;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal; // Para manejar identidades

namespace WcfSecurityDemo
{
    // Reutilizamos el contrato de datos
    [DataContract]
    public class Persona
    {
        [DataMember]
        public int Id { get; set; }
        [DataMember]
        public string Nombre { get; set; }
        [DataMember]
        public string Apellido { get; set; }
        [DataMember]
        public int Edad { get; set; }
    }

    // --- Contrato de Servicio con Atributos de Seguridad ---
    [ServiceContract]
    public interface IGestionPersonasSegura
    {
        [OperationContract]
        // Requiere que el llamador esté autenticado
        string SaludarConSeguridad(string nombre);

        [OperationContract]
        // Requiere autenticación y el rol "Administrador"
        [FaultContract(typeof(SecurityException))] // Para informar errores de seguridad al cliente
        string ObtenerDatosSensibles();

        [OperationContract]
        // Un método público sin requerimientos de seguridad para demostrar
        string SaludarPublico(string nombre);
    }

    // --- Implementación del Servicio con Lógica de Seguridad ---
    public class ServicioGestionPersonasSegura : IGestionPersonasSegura
    {
        public string SaludarConSeguridad(string nombre)
        {
            // Puedes acceder a la identidad del cliente autenticado
            IIdentity identity = ServiceSecurityContext.Current?.PrimaryIdentity;
            if (identity != null && identity.IsAuthenticated)
            {
                Console.WriteLine($"[Servicio Seguro] Solicitud SaludarConSeguridad de: {identity.Name}");
                return $"Hola, {nombre}! Has accedido de forma segura como {identity.Name}.";
            }
            else
            {
                Console.WriteLine("[Servicio Seguro] Solicitud SaludarConSeguridad sin autenticación.");
                // Esto no debería ejecutarse si el binding exige autenticación
                return "Acceso denegado. Se requiere autenticación.";
            }
        }

        public string ObtenerDatosSensibles()
        {
            IPrincipal principal = ServiceSecurityContext.Current?.PrimaryPrincipal;
            if (principal != null && principal.IsInRole("Administrador"))
            {
                Console.WriteLine($"[Servicio Seguro] Acceso a datos sensibles por: {principal.Identity.Name}");
                return "Estos son datos ultra sensibles solo para administradores.";
            }
            else
            {
                Console.WriteLine($"[Servicio Seguro] Intento de acceso a datos sensibles denegado para: {principal?.Identity.Name ?? "Anónimo"}");
                // Puedes lanzar una excepción para que el cliente reciba un Fault
                throw new SecurityException("No tienes los permisos necesarios para acceder a esta operación.");
            }
        }

        public string SaludarPublico(string nombre)
        {
            Console.WriteLine($"[Servicio Seguro] Solicitud SaludarPublico de: {ServiceSecurityContext.Current?.PrimaryIdentity?.Name ?? "Anónimo"}");
            return $"Hola, {nombre}! Este es un mensaje público.";
        }
    }

    public class Program
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("--- Demostración de Seguridad en Servicios WCF ---");

            ServiceHost host = null;
            try
            {
                Uri baseAddress = new Uri("http://localhost:8004/ServicioSeguro");
                host = new ServiceHost(typeof(ServicioGestionPersonasSegura), baseAddress);

                // --- Configuración de Binding con Seguridad (TransportWithMessageCredential) ---
                // Este binding utiliza HTTPS para la protección del transporte
                // y credenciales de usuario/contraseña a nivel de mensaje para autenticación.
                WSHttpBinding wsHttpBindingWithSecurity = new WSHttpBinding();
                wsHttpBindingWithSecurity.Security.Mode = SecurityMode.TransportWithMessageCredential;
                wsHttpBindingWithSecurity.Security.Message.ClientCredentialType = MessageCredentialType.UserName; // Autenticación por usuario/contraseña
                // Necesitas un certificado SSL para HTTPS. Para pruebas locales, puedes usar Self-Signed Certificate.
                // wsHttpBindingWithSecurity.Security.Transport.ClientCredentialType = HttpClientCredentialType.None; // Ya que la credencial va en el mensaje

                host.AddServiceEndpoint(typeof(IGestionPersonasSegura),
                                        wsHttpBindingWithSecurity,
                                        "wsSecured");
                Console.WriteLine("Endpoint seguro WSHttpBinding añadido (se requiere HTTPS y usuario/contraseña).");


                // --- Configuración de Binding Básico (sin seguridad - solo para fines de demo) ---
                // Este endpoint sería para métodos públicos que no requieren autenticación.
                BasicHttpBinding basicHttpBinding = new BasicHttpBinding();
                basicHttpBinding.Security.Mode = BasicHttpSecurityMode.None; // Sin seguridad
                host.AddServiceEndpoint(typeof(IGestionPersonasSegura),
                                        basicHttpBinding,
                                        "basicUnsecured");
                Console.WriteLine("Endpoint no seguro BasicHttpBinding añadido (solo para métodos públicos).");


                // --- Habilitar metadatos ---
                System.ServiceModel.Description.ServiceMetadataBehavior smb =
                    new System.ServiceModel.Description.ServiceMetadataBehavior { HttpGetEnabled = true };
                host.Description.Behaviors.Add(smb);

                // --- Añadir credenciales de servicio (para UsernamePasswordValidator) ---
                // Para que el servicio sepa cómo validar usuarios y contraseñas.
                // En un proyecto real, usarías un almacén de usuarios/DB.
                host.Credentials.UserNameAuthentication.UserNamePasswordValidationMode = System.ServiceModel.Security.UserNamePasswordValidationMode.Custom;
                host.Credentials.UserNameAuthentication.CustomUserNamePasswordValidator = new CustomUsernamePasswordValidator();

                // --- Configuración de autorización basada en roles (para ObtenerDatosSensibles) ---
                // Para habilitar PrincipalPermissionAttribute
                System.ServiceModel.Description.ServiceAuthorizationBehavior sab =
                    host.Description.Behaviors.Find<System.ServiceModel.Description.ServiceAuthorizationBehavior>();
                if (sab == null)
                {
                    sab = new System.ServiceModel.Description.ServiceAuthorizationBehavior();
                    host.Description.Behaviors.Add(sab);
                }
                sab.PrincipalPermissionMode = System.ServiceModel.Description.PrincipalPermissionMode.UseWindowsGroups; // O UseCustom, UseAspNetRoles, etc.
                // Nota: para UseWindowsGroups, el usuario que ejecuta el cliente y el servicio deben estar en un dominio o grupos Windows.
                // Para este ejemplo simple, usaremos un validador personalizado con roles hardcodeados.


                host.Open();
                Console.WriteLine("Servicio WCF seguro está listo. URLs:");
                foreach (var endpoint in host.Description.Endpoints)
                {
                    Console.WriteLine($"- {endpoint.Address}");
                }
                Console.WriteLine("\nPresiona <Enter> para detener el servicio.");
                Console.ReadLine();

                host.Close();
                Console.WriteLine("Servicio WCF detenido.");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al hostear el servicio WCF seguro: {ex.Message}");
                if (ex.InnerException != null)
                    Console.WriteLine($"Inner Exception: {ex.InnerException.Message}");
                Console.WriteLine("Asegúrate de que tienes un certificado SSL configurado para HTTPS si usas Transport Security.");
                Console.WriteLine("Puedes usar 'netsh http add sslcert ...' o 'makecert' para crear uno de prueba.");
            }

            Console.ReadKey();
        }
    }

    // Validador de usuario y contraseña personalizado para UserNameAuthentication
    public class CustomUsernamePasswordValidator : System.ServiceModel.Security.UserNamePasswordValidator
    {
        public override void Validate(string userName, string password)
        {
            if (userName == "admin" && password == "password123")
            {
                // Simular roles (aquí simplemente asignamos un rol al principal)
                AppDomain.CurrentDomain.SetThreadPrincipal(new GenericPrincipal(new GenericIdentity(userName), new string[] { "Administrador", "Usuario" }));
                return;
            }
            if (userName == "user" && password == "pass")
            {
                AppDomain.CurrentDomain.SetThreadPrincipal(new GenericPrincipal(new GenericIdentity(userName), new string[] { "Usuario" }));
                return;
            }
            throw new System.ServiceModel.Security.SecurityAccessDeniedException("Credenciales inválidas.");
        }
    }

    // Ejemplo incorrecto: No considerar HTTPS para servicios públicos.
    // Si tu servicio está expuesto a internet y no usas HTTPS (seguridad de transporte),
    // las credenciales y los datos se enviarán en texto plano, lo que es un riesgo de seguridad crítico.
    // Usar BasicHttpBinding sin seguridad para datos sensibles es un error grave.
    '''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Servicios y Comunicación',
    'topic': 'Web API',
    'subtopic': 'Creación de servicios RESTful',
    'definition': r'''
Crear servicios RESTful con ASP.NET Web API (o más modernamente, ASP.NET Core Web API) es el pan de cada día en el desarrollo web moderno. Pensemos por un momento en esto como construir un "menú" para que otras aplicaciones pidan y envíen información de forma estandarizada y eficiente, usando las reglas que ya existen en la web.

¿Te estás preguntando por qué esto importa? Porque hoy en día, las aplicaciones no viven aisladas. Necesitan comunicarse con aplicaciones móviles, con Single Page Applications (SPAs) en el navegador, con otras APIs, y los servicios RESTful son el lenguaje universal para esa comunicación. Son ligeros, fáciles de entender y consumir, y aprovechan al máximo las características del protocolo HTTP. Sin ellos, tendrías que construir sistemas de comunicación propietarios y complejos, lo que ralentizaría tu desarrollo y dificultaría la integración con otros sistemas.

Un servicio RESTful sigue los principios de la arquitectura REST (Representational State Transfer), que se basa en los fundamentos de HTTP:

* **Recursos:** Todo en REST se trata como un "recurso" (ej. un usuario, un producto, un pedido). Estos recursos se identifican con URLs (Uniform Resource Locators) únicas, como `/api/productos` o `/api/usuarios/123`.
* **Verbos HTTP:** Se utilizan los verbos HTTP estándar para realizar operaciones sobre los recursos:
    * `GET`: Para obtener (leer) un recurso o una colección de recursos.
    * `POST`: Para crear un nuevo recurso.
    * `PUT`: Para actualizar un recurso existente (reemplazando completamente el recurso).
    * `PATCH`: Para actualizar parcialmente un recurso existente.
    * `DELETE`: Para eliminar un recurso.
* **Representaciones:** Los recursos se representan en diferentes formatos, siendo los más comunes JSON (JavaScript Object Notation) y XML. JSON es el formato preferido por su ligereza y facilidad de parseo en la mayoría de los lenguajes de programación.
* **Stateless (Sin estado):** Cada solicitud del cliente al servidor debe contener toda la información necesaria para que el servidor la entienda. El servidor no debe almacenar ningún "estado" de la sesión del cliente entre solicitudes. Esto mejora la escalabilidad y la fiabilidad.

En .NET, creas controladores (clases que heredan de `ApiController` en ASP.NET Web API o `ControllerBase` en ASP.NET Core) y defines métodos de acción que responden a los verbos HTTP y a las rutas. Utilizas atributos como `[HttpGet]`, `[HttpPost]`, `[Route]` para mapear las solicitudes HTTP a tus métodos. Esta es la forma moderna de construir APIs para cualquier tipo de cliente.
''',
    'code_example': r'''
// Ejemplo de creación de un servicio RESTful con ASP.NET Core Web API (similar en .NET Framework Web API)

// Asegúrate de tener el SDK de .NET Core/5+/6+ instalado.
// Para crear un proyecto: dotnet new webapi -n MiApiProductos
// Para ejecutar: dotnet run

// Archivo: Models/Producto.cs
using System.ComponentModel.DataAnnotations; // Para validaciones

namespace MiApiProductos.Models
{
    public class Producto
    {
        public int Id { get; set; }
        [Required] // Ejemplo de validación
        [MaxLength(100)]
        public string Nombre { get; set; }
        [Range(0.01, 10000.00)]
        public decimal Precio { get; set; }
        public int Stock { get; set; }
    }
}

// Archivo: Controllers/ProductosController.cs
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
using MiApiProductos.Models; // Asegúrate de que el namespace de tu modelo es correcto

namespace MiApiProductos.Controllers
{
    // Atributo para definir la ruta base del controlador
    [Route("api/[controller]")] // Convención común: /api/Productos
    [ApiController] // Habilita características de API como inferencia de fuentes de parámetros, etc.
    public class ProductosController : ControllerBase
    {
        // Simulación de una base de datos en memoria para el ejemplo
        private static List<Producto> _productos = new List<Producto>
        {
            new Producto { Id = 1, Nombre = "Laptop Gamer", Precio = 1200.00m, Stock = 5 },
            new Producto { Id = 2, Nombre = "Mouse Inalámbrico", Precio = 25.50m, Stock = 50 },
            new Producto { Id = 3, Nombre = "Teclado Mecánico", Precio = 75.00m, Stock = 15 }
        };
        private static int _nextId = 4;

        /// <summary>
        /// Obtiene todos los productos.
        /// GET /api/productos
        /// </summary>
        /// <returns>Una lista de productos.</returns>
        [HttpGet] // Mapea este método a solicitudes HTTP GET
        public ActionResult<IEnumerable<Producto>> Get()
        {
            Console.WriteLine("[API] GET /api/productos - Solicitud recibida.");
            return Ok(_productos); // Retorna 200 OK con la lista de productos
        }

        /// <summary>
        /// Obtiene un producto por su ID.
        /// GET /api/productos/{id}
        /// </summary>
        /// <param name="id">El ID del producto.</param>
        /// <returns>El producto solicitado o NotFound si no existe.</returns>
        [HttpGet("{id}")] // Mapea este método a GET con un parámetro de ruta
        public ActionResult<Producto> Get(int id)
        {
            Console.WriteLine($"[API] GET /api/productos/{id} - Solicitud recibida.");
            var producto = _productos.FirstOrDefault(p => p.Id == id);
            if (producto == null)
            {
                Console.WriteLine($"[API] Producto con ID {id} no encontrado.");
                return NotFound(); // Retorna 404 Not Found
            }
            return Ok(producto); // Retorna 200 OK con el producto
        }

        /// <summary>
        /// Crea un nuevo producto.
        /// POST /api/productos
        /// </summary>
        /// <param name="producto">El objeto producto a crear.</param>
        /// <returns>El producto creado con su nuevo ID y una URI de ubicación.</returns>
        [HttpPost] // Mapea este método a solicitudes HTTP POST
        public ActionResult<Producto> Post([FromBody] Producto producto) // [FromBody] indica que el producto viene del cuerpo de la solicitud (JSON)
        {
            Console.WriteLine($"[API] POST /api/productos - Solicitud recibida para: {producto?.Nombre}");
            if (!ModelState.IsValid) // Validación automática basada en atributos como [Required], [Range]
            {
                return BadRequest(ModelState); // Retorna 400 Bad Request con errores de validación
            }

            producto.Id = _nextId++;
            _productos.Add(producto);
            // Retorna 201 Created y una URI para el nuevo recurso
            return CreatedAtAction(nameof(Get), new { id = producto.Id }, producto);
        }

        /// <summary>
        /// Actualiza un producto existente.
        /// PUT /api/productos/{id}
        /// </summary>
        /// <param name="id">El ID del producto a actualizar.</param>
        /// <param name="producto">El objeto producto con los datos actualizados.</param>
        /// <returns>NoContent si la actualización fue exitosa, o NotFound/BadRequest.</returns>
        [HttpPut("{id}")] // Mapea este método a solicitudes HTTP PUT
        public ActionResult Put(int id, [FromBody] Producto producto)
        {
            Console.WriteLine($"[API] PUT /api/productos/{id} - Solicitud recibida para: {producto?.Nombre}");
            if (id != producto.Id)
            {
                return BadRequest("El ID de la ruta no coincide con el ID del producto.");
            }

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var existingProducto = _productos.FirstOrDefault(p => p.Id == id);
            if (existingProducto == null)
            {
                return NotFound();
            }

            existingProducto.Nombre = producto.Nombre;
            existingProducto.Precio = producto.Precio;
            existingProducto.Stock = producto.Stock;
            return NoContent(); // Retorna 204 No Content (éxito sin contenido de respuesta)
        }

        /// <summary>
        /// Elimina un producto.
        /// DELETE /api/productos/{id}
        /// </summary>
        /// <param name="id">El ID del producto a eliminar.</param>
        /// <returns>NoContent si la eliminación fue exitosa, o NotFound.</returns>
        [HttpDelete("{id}")] // Mapea este método a solicitudes HTTP DELETE
        public ActionResult Delete(int id)
        {
            Console.WriteLine($"[API] DELETE /api/productos/{id} - Solicitud recibida.");
            var producto = _productos.FirstOrDefault(p => p.Id == id);
            if (producto == null)
            {
                return NotFound();
            }

            _productos.Remove(producto);
            return NoContent(); // Retorna 204 No Content
        }
    }
}

// Archivo: Program.cs (para configurar la API)
/*
// En ASP.NET Core 6+, el Program.cs ya viene configurado para una Web API básica.
// Asegúrate de que las líneas para añadir controladores y construir la app estén presentes.

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllers(); // Habilita los controladores para tu API
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(); // Opcional: para generar documentación de API (Swagger/OpenAPI)

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI(); // Opcional: UI para probar la API
}

app.UseHttpsRedirection(); // Redirige HTTP a HTTPS (recomendado en producción)

app.UseAuthorization(); // Para manejo de autenticación/autorización

app.MapControllers(); // Mapea las rutas de los controladores

app.Run();
*/

// Ejemplo incorrecto: No seguir los principios REST.
// Usar GET para modificar datos o POST para obtener datos sin cambios de estado.
// Ejemplo: GET /api/productos/eliminar?id=1 - Esto es incorrecto, DELETE es el verbo apropiado.
// Ejemplo: POST /api/productos/obtenerTodos - Esto es incorrecto, GET es el verbo apropiado.
// Mezclar lógica de negocio directamente en el controlador sin una capa de servicio/repositorio.
// Los controladores deben ser delgados y solo orquestar las operaciones.
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Servicios y Comunicación',
    'topic': 'Web API',
    'subtopic': 'Serialización y deserialización de JSON',
    'definition': r'''
La serialización y deserialización de JSON son procesos fundamentales en el mundo de las Web APIs. Pensemos por un momento en esto como el arte de empacar y desempacar información para enviarla por correo: la serialización es convertir tus objetos de programa (como una lista de productos o un usuario) en una cadena de texto (JSON) que puede viajar por la red, y la deserialización es el proceso inverso, tomando esa cadena de texto y convirtiéndola de nuevo en objetos que tu programa pueda entender y manipular.

¿Te estás preguntando por qué esto importa? Porque las Web APIs, especialmente las RESTful, se comunican principalmente usando formatos de texto plano como JSON. Tus aplicaciones .NET trabajan con objetos en memoria. Para enviar esos objetos a un cliente web o móvil, necesitas "aplanarlos" en un formato de texto. Y cuando recibes datos de un cliente, necesitas "reconstruir" esos datos de texto en objetos que tu código .NET pueda usar. Sin este proceso, la comunicación sería inviable.

En el ecosistema .NET, las bibliotecas más populares para trabajar con JSON son:
* **Newtonsoft.Json (Json.NET):** Ha sido el estándar de facto durante muchos años. Es extremadamente potente, flexible y muy madura. Permite un control muy fino sobre el proceso de serialización, con muchas opciones para formateo, manejo de fechas, ignorar propiedades, etc.
* **System.Text.Json (Built-in en .NET Core y posteriores):** Es la biblioteca de serialización JSON que viene integrada con .NET Core 3.0 y versiones posteriores (incluyendo .NET 5, 6, etc.). Está diseñada para ser de alto rendimiento y eficiente, con un enfoque en la seguridad y la compatibilidad con UTF-8. Aunque inicialmente era menos flexible que Newtonsoft.Json, ha ido ganando características y es la opción recomendada por Microsoft para nuevas aplicaciones.

Ambas bibliotecas te permiten realizar operaciones básicas como:
* **Serialización:** Convertir un objeto C# en una cadena JSON.
    * `string jsonString = JsonConvert.SerializeObject(myObject);` (Newtonsoft.Json)
    * `string jsonString = JsonSerializer.Serialize(myObject);` (System.Text.Json)
* **Deserialización:** Convertir una cadena JSON en un objeto C#.
    * `MyObject obj = JsonConvert.DeserializeObject<MyObject>(jsonString);` (Newtonsoft.Json)
    * `MyObject obj = JsonSerializer.Deserialize<MyObject>(jsonString);` (System.Text.Json)

En ASP.NET Core Web API, la serialización y deserialización de JSON se maneja automáticamente por defecto cuando utilizas `[FromBody]` en tus parámetros de acción o cuando devuelves `ActionResult<T>` desde tus métodos. Esto simplifica mucho el desarrollo, ya que rara vez tienes que llamar directamente a `Serialize` o `Deserialize` en tus controladores, aunque es crucial entender lo que sucede "bajo el capó".
''',
    'code_example': r'''
// Ejemplo de serialización y deserialización de JSON en .NET
// Usaremos System.Text.Json (preferido para nuevas apps .NET Core+)
// y Newtonsoft.Json (aún muy popular y potente).

using System;
using System.Text.Json; // Para System.Text.Json
using Newtonsoft.Json;   // Para Newtonsoft.Json
using System.Collections.Generic;
using System.Text.Json.Serialization; // Para atributos de System.Text.Json

namespace JsonSerializationDemo
{
    public class Product
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public int Stock { get; set; }

        // Ejemplo de atributo para System.Text.Json: Ignorar propiedad
        [JsonIgnore]
        public string InternalCode { get; set; } = Guid.NewGuid().ToString();
    }

    public class Order
    {
        public Guid OrderId { get; set; }
        public DateTime OrderDate { get; set; }
        public List<Product> Items { get; set; }
        public string CustomerName { get; set; }

        // Ejemplo de atributo para Newtonsoft.Json: Cambiar nombre de propiedad en JSON
        [JsonProperty("totalAmount")]
        public decimal Total { get; set; }
    }


    public class Program
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("--- Demostración de Serialización y Deserialización JSON ---");

            // --- Objeto a Serializar ---
            var myProduct = new Product
            {
                Id = 1,
                Name = "Smartphone XYZ",
                Price = 599.99m,
                Stock = 100,
                InternalCode = "P_SMART_001" // Esta propiedad será ignorada por System.Text.Json
            };

            var myOrder = new Order
            {
                OrderId = Guid.NewGuid(),
                OrderDate = DateTime.UtcNow,
                CustomerName = "John Doe",
                Items = new List<Product> { myProduct, new Product { Id = 2, Name = "Auriculares", Price = 49.99m, Stock = 200 } },
                Total = 649.98m
            };


            Console.WriteLine("\n--- Usando System.Text.Json ---");

            // Serialización
            // Por defecto, System.Text.Json usa Camel Case para nombres de propiedades JSON
            var options = new JsonSerializerOptions { WriteIndented = true }; // Para formato bonito
            string jsonProductSystemText = JsonSerializer.Serialize(myProduct, options);
            Console.WriteLine("\nProducto serializado (System.Text.Json):\n" + jsonProductSystemText);

            string jsonOrderSystemText = JsonSerializer.Serialize(myOrder, options);
            Console.WriteLine("\nOrden serializada (System.Text.Json):\n" + jsonOrderSystemText);
            // Observa que 'InternalCode' es ignorado y 'Total' NO se renombra a 'totalAmount' con System.Text.Json
            // Para renombrar en System.Text.Json usarías [JsonPropertyName("totalAmount")]


            // Deserialización
            var deserializedProductSystemText = JsonSerializer.Deserialize<Product>(jsonProductSystemText);
            Console.WriteLine($"\nProducto deserializado (System.Text.Json): ID={deserializedProductSystemText.Id}, Nombre={deserializedProductSystemText.Name}, Stock={deserializedProductSystemText.Stock}");
            Console.WriteLine($"  InternalCode (debe ser valor por defecto si fue ignorado): {deserializedProductSystemText.InternalCode}");

            var deserializedOrderSystemText = JsonSerializer.Deserialize<Order>(jsonOrderSystemText);
            Console.WriteLine($"Orden deserializada (System.Text.Json): Customer={deserializedOrderSystemText.CustomerName}, Items={deserializedOrderSystemText.Items.Count}");


            Console.WriteLine("\n--- Usando Newtonsoft.Json (Json.NET) ---");

            // Serialización
            // Newtonsoft.Json requiere configuración para Camel Case por defecto, o usa nombres de propiedad originales
            // Aquí, lo configuramos para Camel Case para que sea similar a System.Text.Json por defecto.
            var settings = new JsonSerializerSettings
            {
                Formatting = Newtonsoft.Json.Formatting.Indented,
                ContractResolver = new Newtonsoft.Json.Serialization.CamelCasePropertyNamesContractResolver()
            };
            string jsonProductNewtonsoft = JsonConvert.SerializeObject(myProduct, settings);
            Console.WriteLine("\nProducto serializado (Newtonsoft.Json):\n" + jsonProductNewtonsoft);

            string jsonOrderNewtonsoft = JsonConvert.SerializeObject(myOrder, settings);
            Console.WriteLine("\nOrden serializada (Newtonsoft.Json):\n" + jsonOrderNewtonsoft);
            // Observa que 'Total' SÍ se renombra a 'totalAmount' con Newtonsoft.Json debido a [JsonProperty]


            // Deserialización
            var deserializedProductNewtonsoft = JsonConvert.DeserializeObject<Product>(jsonProductNewtonsoft);
            Console.WriteLine($"\nProducto deserializado (Newtonsoft.Json): ID={deserializedProductNewtonsoft.Id}, Nombre={deserializedProductNewtonsoft.Name}, Stock={deserializedProductNewtonsoft.Stock}");

            // Para deserializar correctamente el campo 'totalAmount' que fue renombrado en la serialización
            // necesitamos que la propiedad Total en la clase Order tenga el atributo [JsonProperty("totalAmount")] para Newtonsoft.Json
            var deserializedOrderNewtonsoft = JsonConvert.DeserializeObject<Order>(jsonOrderNewtonsoft);
            Console.WriteLine($"Orden deserializada (Newtonsoft.Json): Customer={deserializedOrderNewtonsoft.CustomerName}, Total={deserializedOrderNewtonsoft.Total}");


            Console.WriteLine("\nPresiona cualquier tecla para salir.");
            Console.ReadKey();
        }
    }

    // Ejemplo incorrecto: Tratar JSON como si fuera XML.
    // JSON es más ligero y menos verboso que XML. Intentar imponer esquemas rígidos o
    // usar herramientas diseñadas para XML para manipular JSON directamente sin serialización/deserialización
    // adecuada puede llevar a código ineficiente y errores.
    // Otro error común es no manejar correctamente los tipos de datos (ej. fechas) o los valores nulos,
    // lo que puede causar errores de deserialización.
}
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Mid',
    'level': 2,
    'title_level': 'Servicios y Comunicación',
    'topic': 'Web API',
    'subtopic': 'Versionado de APIs',
    'definition': r'''
El versionado de APIs es una práctica esencial en el desarrollo de servicios web, que te permite evolucionar tu API sin romper la funcionalidad de las aplicaciones cliente existentes. Pensemos por un momento en esto como las diferentes ediciones de un libro: cada edición puede tener mejoras o cambios, pero las ediciones anteriores siguen siendo válidas para quienes las poseen, asegurando que no se queden sin su libro favorito.

¿Te estás preguntando por qué esto importa? Porque una vez que tu API está en producción y es consumida por múltiples clientes (aplicaciones web, móviles, integraciones con terceros), realizar cambios "ruptura" (breaking changes) puede generar un caos. Los clientes que dependen de la versión anterior dejarán de funcionar. El versionado te permite introducir nuevas funcionalidades, cambiar estructuras de datos o modificar comportamientos de forma segura, dando a los clientes tiempo para migrar a la nueva versión cuando estén listos. Sin versionado, cada cambio que rompe algo significaría que todos los clientes deberían actualizarse inmediatamente, lo cual es inviable en la mayoría de los escenarios.

Existen varias estrategias comunes para el versionado de APIs, cada una con sus pros y contras:

1.  **Versionado por URL (URI Versioning):**
    * **¿Cómo funciona?** Incluye el número de versión directamente en la URL de la API.
    * **Ejemplo:** `GET /api/v1/productos`, `GET /api/v2/productos`.
    * **Ventajas:** Es muy explícito, fácil de entender y de implementar, y es amigable con los navegadores y cachés.
    * **Desventajas:** Puede llevar a URLs más largas y duplica la lógica de ruteo si tienes muchas versiones.

2.  **Versionado por Query String:**
    * **¿Cómo funciona?** La versión se especifica como un parámetro en la cadena de consulta.
    * **Ejemplo:** `GET /api/productos?api-version=1.0`, `GET /api/productos?api-version=2.0`.
    * **Ventajas:** URLs más limpias y la misma base de URL para diferentes versiones.
    * **Desventajas:** Puede no ser tan explícito como la URL, y algunos proxies/cachés pueden ignorar los parámetros de consulta en el almacenamiento en caché.

3.  **Versionado por Encabezado (Header Versioning):**
    * **¿Cómo funciona?** La versión se envía en un encabezado HTTP personalizado.
    * **Ejemplo:** `GET /api/productos` con un encabezado `X-Api-Version: 1.0` o `Accept-Version: 1.0`.
    * **Ventajas:** URL limpia, la negociación de contenido puede ser más robusta.
    * **Desventajas:** No es tan fácil de probar en el navegador, y es menos visible para los desarrolladores.

4.  **Versionado por Content Negotiation (Accept Header):**
    * **¿Cómo funciona?** La versión se especifica en el encabezado `Accept` del cliente, usando un tipo de medio personalizado.
    * **Ejemplo:** `GET /api/productos` con un encabezado `Accept: application/vnd.micompany.v1+json`.
    * **Ventajas:** Muy RESTful, el cliente solicita la representación que desea.
    * **Desventajas:** Más complejo de implementar y probar, y puede ser menos intuitivo.

**Cambios "no ruptura" (Non-breaking changes):** No todos los cambios requieren un nuevo versionado. Añadir un nuevo campo opcional a una respuesta, añadir un nuevo endpoint, o añadir un nuevo método a un servicio existente generalmente no rompe a los clientes antiguos.

La elección de la estrategia dependerá de las necesidades específicas de tu proyecto y de la audiencia de tu API, pero lo importante es tener una estrategia clara y comunicarla a tus consumidores.
''',
    'code_example': r'''
// Ejemplo de versionado de APIs en ASP.NET Core Web API
// Usaremos la biblioteca Microsoft.AspNetCore.Mvc.Versioning

// Para empezar, instala el paquete NuGet:
// Install-Package Microsoft.AspNetCore.Mvc.Versioning
// Install-Package Microsoft.AspNetCore.Mvc.Versioning.ApiExplorer (si quieres usar Swagger/OpenAPI con versionado)

using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Versioning;
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;
using System.Collections.Generic;
using System.Linq;

namespace ApiVersioningDemo
{
    // --- Modelo (reutilizado del ejemplo anterior) ---
    public class Product
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public int Stock { get; set; }
    }

    // --- Configuración en Program.cs (o Startup.cs si usas .NET 5-) ---
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.
            builder.Services.AddControllers();

            // Configurar el versionado de la API
            builder.Services.AddApiVersioning(options =>
            {
                options.ReportApiVersions = true; // Informa las versiones soportadas en los encabezados de respuesta
                options.AssumeDefaultVersionWhenUnspecified = true; // Asume la versión por defecto si no se especifica
                options.DefaultApiVersion = new ApiVersion(1, 0); // Versión por defecto (V1.0)

                // Estrategias de lectura de la versión (puedes combinar varias)
                // 1. Versionado por Query String (ej: ?api-version=1.0)
                options.ApiVersionReader = new QueryStringApiVersionReader("api-version");

                // 2. Versionado por Encabezado (ej: X-Api-Version: 1.0)
                // options.ApiVersionReader = new HeaderApiVersionReader("X-Api-Version");

                // 3. Versionado por URL (configurado directamente en los controladores con [Route("api/v{version:apiVersion}/...")])
                // Para usar este, simplemente configura el RoutePrefix en los controladores.

                // 4. Versionado por Content Negotiation (Accept header)
                // options.ApiVersionReader = new MediaTypeApiVersionReader("api-version");
            });

            // Opcional: Configuración para Swagger/OpenAPI y versionado
            builder.Services.AddVersionedApiExplorer(options =>
            {
                // Formato para la URL en la UI de Swagger (ej. v1.0, v2.0)
                options.GroupNameFormat = "'v'VVV";
                // Sustituir la versión en la ruta de la URL
                options.SubstituteApiVersionInUrl = true;
            });

            builder.Services.AddSwaggerGen();

            var app = builder.Build();

            if (app.Environment.IsDevelopment())
            {
                app.UseSwagger();
                app.UseSwaggerUI(options =>
                {
                    // Configura Swagger para mostrar todas las versiones disponibles
                    foreach (var description in app.Services.GetRequiredService<IApiVersionDescriptionProvider>().ApiVersionDescriptions)
                    {
                        options.SwaggerEndpoint($"/swagger/{description.GroupName}/swagger.json",
                            description.GroupName.ToUpperInvariant());
                    }
                });
            }

            app.UseHttpsRedirection();
            app.UseAuthorization();
            app.MapControllers(); // Mapea las rutas definidas en los controladores
            app.Run();
        }
    }


    // --- Controladores con Versionado ---

    // Simulación de datos para los productos
    public static class ProductData
    {
        public static List<Product> ProductsV1 = new List<Product>
        {
            new Product { Id = 1, Name = "Laptop V1", Precio = 1000m, Stock = 10 },
            new Product { Id = 2, Name = "Mouse V1", Precio = 20m, Stock = 50 }
        };

        public static List<Product> ProductsV2 = new List<Product>
        {
            new Product { Id = 1, Name = "Laptop Pro (V2)", Precio = 1500m, Stock = 8 },
            new Product { Id = 2, Name = "Mouse Ergonomico (V2)", Precio = 30m, Stock = 40 },
            new Product { Id = 3, Name = "Teclado Mecánico RGB (V2)", Precio = 120m, Stock = 20 }
        };
    }

    // --- Controlador para la V1.0 de la API ---
    [ApiVersion("1.0")] // Define que este controlador pertenece a la versión 1.0
    // Puedes tener la versión en la ruta, o usar el Query String/Header
    [Route("api/products")] // Sin el '{version:apiVersion}' aquí, usaremos QueryString/Header
    // [Route("api/v{version:apiVersion}/products")] // Si usas versionado por URL
    [ApiController]
    public class ProductsV1Controller : ControllerBase
    {
        [HttpGet]
        public ActionResult<IEnumerable<Product>> Get()
        {
            Console.WriteLine("[API V1] Solicitud para /api/products (V1.0)");
            return Ok(ProductData.ProductsV1);
        }

        // Puedes tener métodos específicos para cada versión si la lógica es diferente
        [HttpGet("{id}")]
        public ActionResult<Product> Get(int id)
        {
            Console.WriteLine($"[API V1] Solicitud para /api/products/{id} (V1.0)");
            var product = ProductData.ProductsV1.FirstOrDefault(p => p.Id == id);
            if (product == null)
            {
                return NotFound();
            }
            return Ok(product);
        }
    }

    // --- Controlador para la V2.0 de la API ---
    // En la V2, hemos añadido un nuevo producto y quizás un nuevo campo en el futuro.
    [ApiVersion("2.0")] // Define que este controlador pertenece a la versión 2.0
    [Route("api/products")] // Mismo prefijo de ruta si usas QueryString/Header
    // [Route("api/v{version:apiVersion}/products")] // Si usas versionado por URL
    [ApiController]
    public class ProductsV2Controller : ControllerBase
    {
        [HttpGet]
        public ActionResult<IEnumerable<Product>> Get()
        {
            Console.WriteLine("[API V2] Solicitud para /api/products (V2.0)");
            return Ok(ProductData.ProductsV2);
        }

        [HttpGet("{id}")]
        public ActionResult<Product> Get(int id)
        {
            Console.WriteLine($"[API V2] Solicitud para /api/products/{id} (V2.0)");
            var product = ProductData.ProductsV2.FirstOrDefault(p => p.Id == id);
            if (product == null)
            {
                return NotFound();
            }
            return Ok(product);
        }

        // Nuevo método solo disponible en V2 (ej. para buscar por nombre)
        [HttpGet("search")] // api/products/search?name=...
        public ActionResult<IEnumerable<Product>> SearchByName([FromQuery] string name)
        {
            Console.WriteLine($"[API V2] Solicitud para /api/products/search?name={name} (V2.0)");
            var results = ProductData.ProductsV2.Where(p => p.Name.Contains(name, StringComparison.OrdinalIgnoreCase)).ToList();
            if (!results.Any())
            {
                return NotFound();
            }
            return Ok(results);
        }
    }

    /*
    // --- Cómo probar estas APIs (Ejemplos con curl o navegador) ---

    // 1. Para obtener V1 (usando Query String - asumiendo `options.ApiVersionReader = new QueryStringApiVersionReader("api-version");`)
    // Abre tu navegador o Postman y ve a:
    // http://localhost:5000/api/products?api-version=1.0

    // Con curl:
    // curl "http://localhost:5000/api/products?api-version=1.0"

    // 2. Para obtener V2 (usando Query String)
    // http://localhost:5000/api/products?api-version=2.0

    // Con curl:
    // curl "http://localhost:5000/api/products?api-version=2.0"

    // 3. Obtener V2 por su nuevo endpoint de búsqueda (con Query String)
    // http://localhost:5000/api/products/search?name=Laptop&api-version=2.0

    // Con curl:
    // curl "http://localhost:5000/api/products/search?name=Laptop&api-version=2.0"

    // 4. Si configuras versionado por URL (ej. [Route("api/v{version:apiVersion}/products")])
    // http://localhost:5000/api/v1/products
    // http://localhost:5000/api/v2/products

    // Para ver Swagger UI (si lo configuraste):
    // http://localhost:5000/swagger/index.html
    // Verás pestañas o desplegables para seleccionar la versión de la API (v1.0, v2.0).
    */

    // Ejemplo incorrecto: No versionar la API.
    // Realizar cambios "breaking changes" en una API existente sin un nuevo número de versión.
    // Esto obligaría a todos los consumidores a actualizar sus clientes o su aplicación dejaría de funcionar.
    // Ejemplo: Quitar un campo requerido de una respuesta o cambiar el tipo de dato de un parámetro de un día para otro.
}
'''
  });
}

Future<void> insertPuntonetMidLevel3Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Seguridad y Autenticación',
    'topic': 'Autenticación y Autorización',
    'subtopic': 'Uso de Forms Authentication',
    'definition': r'''
Forms Authentication en ASP.NET es una forma de autenticar usuarios en aplicaciones web, especialmente aquellas que no están en un dominio de Windows. Pensemos por un momento en esto como el sistema de registro y login que encuentras en casi cualquier página web: el usuario ingresa su nombre de usuario y contraseña, y si son correctos, el sistema lo "recuerda" para que no tenga que iniciar sesión en cada clic.

¿Te estás preguntando por qué esto importa? Porque la mayoría de las aplicaciones web necesitan saber quién es el usuario que las está usando para personalizar la experiencia, permitir acceso a datos sensibles o simplemente para recordar preferencias. Forms Authentication te proporciona un marco robusto y relativamente sencillo para manejar este proceso, sin depender de la autenticación de Windows, lo que es ideal para aplicaciones que se despliegan en internet y que tienen una base de usuarios global. Sin un mecanismo de autenticación, tu aplicación sería una puerta abierta para cualquiera, comprometiendo la seguridad y la privacidad.

El funcionamiento básico de Forms Authentication es el siguiente:
1.  **Solicitud inicial:** Un usuario intenta acceder a una página protegida.
2.  **Redirección al Login:** Si el usuario no está autenticado, ASP.NET lo redirige automáticamente a una página de inicio de sesión configurada (ej. `Login.aspx` o `Account/Login` en MVC).
3.  **Credenciales:** El usuario ingresa sus credenciales (nombre de usuario, contraseña).
4.  **Validación:** La aplicación valida estas credenciales contra una fuente de datos (una base de datos, XML, etc.). Es **crucial** que las contraseñas se almacenen de forma segura (hasheadas, nunca en texto plano).
5.  **Ticket de Autenticación:** Si las credenciales son válidas, ASP.NET Forms Authentication crea un "ticket" de autenticación, que es un pequeño archivo cifrado y firmado que contiene información sobre el usuario (su identidad, roles, etc.). Este ticket se almacena en una cookie en el navegador del usuario.
6.  **Redirección a la página original:** El usuario es redirigido a la página que intentó acceder inicialmente.
7.  **Solicitudes posteriores:** En cada solicitud subsiguiente, el navegador envía la cookie con el ticket. ASP.NET lo descifra, lo valida y recrea la identidad del usuario, permitiendo el acceso a las páginas protegidas.

Puedes configurar Forms Authentication en el archivo `web.config`, especificando el modo, la página de login, si las cookies son persistentes (para recordar al usuario entre sesiones del navegador) y los tiempos de expiración. Aunque es una tecnología más madura (asociada con ASP.NET Web Forms y ASP.NET MVC 5 y anteriores), los conceptos subyacentes de manejo de sesiones y tickets siguen siendo relevantes en enfoques más modernos como ASP.NET Core Identity.
''',
    'code_example': r'''
// Ejemplo de configuración y uso básico de Forms Authentication en ASP.NET MVC 5 (o Web Forms)
// (Nota: Para ASP.NET Core, el enfoque es ASP.NET Core Identity, que es más moderno y flexible)

// --- 1. Configuración en Web.config (dentro de <system.web> section) ---
/*
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <system.web>
    <authentication mode="Forms">
      <forms loginUrl="~/Account/Login"  // Ruta a tu página de login
             timeout="2880"             // Duración del ticket de autenticación en minutos (2 días)
             defaultUrl="~/"            // Página a la que se redirige después del login exitoso si no hay URL original
             protection="All"           // Protege la cookie (cifrado y validación)
             path="/" />                // Ruta de la cookie
    </authentication>
    <authorization>
      <deny users="?"/>  </authorization>

    <compilation debug="true" targetFramework="4.7.2" />
    <httpRuntime targetFramework="4.7.2" />
  </system.web>
  <system.webServer>
    <modules>
      <remove name="FormsAuthentication" />
      <add name="FormsAuthentication" type="System.Web.Security.FormsAuthenticationModule" />
    </modules>
  </system.webServer>
</configuration>
*/

// --- 2. Controlador de Cuentas (AccountController.cs en ASP.NET MVC) ---
using System.Web.Mvc;
using System.Web.Security; // Necesario para FormsAuthentication

namespace MyWebApp.Controllers
{
    [AllowAnonymous] // Permite el acceso anónimo a este controlador para Login y Register
    public class AccountController : Controller
    {
        // GET: /Account/Login
        public ActionResult Login(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            Console.WriteLine("[FormsAuth] Mostrando página de login.");
            return View();
        }

        // POST: /Account/Login
        [HttpPost]
        [ValidateAntiForgeryToken] // Protección contra CSRF (lo veremos más adelante)
        public ActionResult Login(string username, string password, bool rememberMe, string returnUrl)
        {
            Console.WriteLine($"[FormsAuth] Intento de login para usuario: {username}");

            // TODO: En un escenario real, validarías el usuario y contraseña contra una DB
            // y harías hash de la contraseña.
            bool isValidUser = (username == "admin" && password == "password123");
            // o (username == "user" && password == "pass");

            if (isValidUser)
            {
                // Crea el ticket de autenticación y la cookie
                FormsAuthentication.SetAuthCookie(username, rememberMe);
                Console.WriteLine($"[FormsAuth] Usuario '{username}' autenticado. Redirigiendo...");

                // Redirige al usuario a la URL original o a la página por defecto
                if (Url.IsLocalUrl(returnUrl) && returnUrl.Length > 1 && !string.IsNullOrEmpty(returnUrl))
                {
                    return Redirect(returnUrl);
                }
                else
                {
                    return RedirectToAction("Index", "Home"); // Redirige a la página de inicio
                }
            }
            else
            {
                Console.WriteLine($"[FormsAuth] Login fallido para usuario: {username}");
                ModelState.AddModelError("", "Usuario o contraseña incorrectos.");
                return View(); // Vuelve a mostrar la vista de login con un error
            }
        }

        // POST: /Account/LogOff
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult LogOff()
        {
            Console.WriteLine($"[FormsAuth] Usuario '{User.Identity.Name}' cerrando sesión.");
            FormsAuthentication.SignOut(); // Cierra la sesión (elimina el ticket/cookie)
            return RedirectToAction("Index", "Home");
        }
    }
}

// --- 3. Vista de Login (Views/Account/Login.cshtml en ASP.NET MVC) ---
/*
@model MyWebApp.Models.LoginViewModel // O un modelo simple con Username y Password

@{
    ViewBag.Title = "Iniciar Sesión";
}

<h2>Iniciar Sesión</h2>

@using (Html.BeginForm("Login", "Account", new { ReturnUrl = ViewBag.ReturnUrl }, FormMethod.Post, new { @class = "form-horizontal", role = "form" }))
{
    @Html.AntiForgeryToken() // Token CSRF
    <h4>Usa una cuenta local para iniciar sesión.</h4>
    <hr />
    @Html.ValidationSummary(true, "", new { @class = "text-danger" })
    <div class="form-group">
        @Html.Label("Usuario", new { @class = "col-md-2 control-label" })
        <div class="col-md-10">
            <input type="text" name="username" class="form-control" />
            @Html.ValidationMessage("username", "", new { @class = "text-danger" })
        </div>
    </div>
    <div class="form-group">
        @Html.Label("Contraseña", new { @class = "col-md-2 control-label" })
        <div class="col-md-10">
            <input type="password" name="password" class="form-control" />
            @Html.ValidationMessage("password", "", new { @class = "text-danger" })
        </div>
    </div>
    <div class="form-group">
        <div class="col-md-offset-2 col-md-10">
            <div class="checkbox">
                <label>
                    <input type="checkbox" name="rememberMe" value="true" /> Recordarme
                </label>
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-md-offset-2 col-md-10">
            <input type="submit" value="Iniciar Sesión" class="btn btn-default" />
        </div>
    </div>
}
*/

// --- 4. Protegiendo un Controlador/Acción ---
// Cualquier controlador o acción sin [AllowAnonymous] requerirá autenticación.
// Por ejemplo, el Home Controller
using System.Web.Mvc;

namespace MyWebApp.Controllers
{
    [Authorize] // Este atributo asegura que solo usuarios autenticados puedan acceder a este controlador
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            // User.Identity.IsAuthenticated es true si el usuario está autenticado
            // User.Identity.Name contiene el nombre de usuario autenticado
            Console.WriteLine($"[FormsAuth] Usuario autenticado: {User.Identity.IsAuthenticated}, Nombre: {User.Identity.Name}");
            return View();
        }
    }
}

// Ejemplo incorrecto: Almacenar contraseñas en texto plano.
// NUNCA, bajo ninguna circunstancia, almacenes contraseñas en texto plano en la base de datos.
// Siempre debes hacerles hash (con bcrypt, PBKDF2, etc.) y usar un "salt" único para cada contraseña.
// Otro error es no usar HTTPS, ya que las credenciales de login viajarían sin cifrar por la red.
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Seguridad y Autenticación',
    'topic': 'Autenticación y Autorización',
    'subtopic': 'Implementación de roles y permisos',
    'definition': r'''
La implementación de roles y permisos es el siguiente paso después de la autenticación, una vez que sabes quién es el usuario. Pensemos por un momento en esto como el sistema de acceso a un edificio: una vez que la seguridad te identifica (autenticación), tus credenciales determinan a qué pisos o habitaciones tienes permiso para entrar (autorización basada en roles y permisos).

¿Te estás preguntando por qué esto importa? Porque no todos los usuarios de una aplicación deben tener las mismas capacidades. Un administrador necesita hacer cosas que un usuario regular no puede, como gestionar otros usuarios o acceder a informes sensibles. Implementar roles y permisos te permite controlar de forma granular qué acciones puede realizar cada usuario, haciendo tu aplicación más segura y funcional. Sin un sistema de roles y permisos, tendrías que codificar lógica de acceso en cada parte de tu aplicación, lo que sería inmanejable y propenso a errores.

En .NET, la autorización basada en roles se gestiona principalmente a través de:

* **Roles:** Los roles son grupos lógicos de usuarios que comparten un conjunto similar de permisos. Por ejemplo, `Administrador`, `Editor`, `Usuario`, `Invitado`. Un usuario puede pertenecer a uno o varios roles.
* **Permisos:** Los permisos son las acciones específicas que un usuario (o un rol) puede realizar. Por ejemplo, `CrearProducto`, `EditarUsuario`, `VerInformeFinanciero`.

Cuando usas Forms Authentication (o ASP.NET Core Identity, que es la evolución), el sistema de roles se integra de forma natural:

1.  **Definición de Roles:** Puedes definir los roles en tu base de datos o en el archivo `web.config` (para roles estáticos).
2.  **Asignación de Roles:** A cada usuario se le asignan uno o más roles. Esta asignación generalmente se maneja en tu capa de datos.
3.  **Verificación de Roles en Código:** En tu código (controladores, acciones, o incluso en las vistas), puedes usar el atributo `[Authorize(Roles = "NombreDelRol")]` para restringir el acceso. También puedes verificar roles programáticamente usando `User.IsInRole("NombreDelRol")`.
4.  **Verificación de Roles en `web.config`:** Puedes restringir el acceso a directorios o archivos específicos basándote en roles directamente en el `web.config`.

La gestión de permisos más allá de los roles (ej. un usuario específico puede editar un documento, pero no otro) a menudo requiere una implementación más personalizada, a veces combinando roles con lógica de negocio o implementando autorización basada en políticas en ASP.NET Core. Sin embargo, los roles son el punto de partida fundamental para la mayoría de los escenarios de autorización.
''',
    'code_example': r'''
// Ejemplo de implementación de roles y permisos en ASP.NET MVC 5 (con Forms Authentication)
// (Para ASP.NET Core, ASP.NET Core Identity tiene un sistema de roles y políticas de autorización más moderno)

// --- 1. Configuración en Web.config (dentro de <system.web> section) ---
/*
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <system.web>
    <authentication mode="Forms">
      <forms loginUrl="~/Account/Login" timeout="2880" />
    </authentication>
    <authorization>
      <deny users="?"/> </authorization>
    <roleManager enabled="true" defaultProvider="CustomRoleProvider">
      <providers>
        <add name="CustomRoleProvider"
             type="MyWebApp.Providers.CustomRoleProvider" />
      </providers>
    </roleManager>
  </system.web>
  <system.webServer>
    <modules>
      <remove name="FormsAuthentication" />
      <add name="FormsAuthentication" type="System.Web.Security.FormsAuthenticationModule" />
      <remove name="RoleManager" />
      <add name="RoleManager" type="System.Web.Security.RoleManagerModule" />
    </modules>
  </system.webServer>
</configuration>
*/

// --- 2. Proveedor de Roles Personalizado (CustomRoleProvider.cs) ---
// En un proyecto real, esto interactuaría con una base de datos para obtener los roles de un usuario.
using System.Web.Security;
using System.Linq;
using System.Collections.Generic;

namespace MyWebApp.Providers
{
    public class CustomRoleProvider : RoleProvider
    {
        // Simulación de usuarios y sus roles
        private static Dictionary<string, string[]> _userRoles = new Dictionary<string, string[]>
        {
            { "admin", new string[] { "Administrador", "Editor" } },
            { "editor", new string[] { "Editor", "Usuario" } },
            { "user", new string[] { "Usuario" } }
        };

        public override string[] GetRolesForUser(string username)
        {
            Console.WriteLine($"[Roles] Obteniendo roles para: {username}");
            if (_userRoles.ContainsKey(username))
            {
                return _userRoles[username];
            }
            return new string[] { }; // Sin roles si el usuario no existe
        }

        // Otros métodos del RoleProvider (no implementados para este ejemplo simple)
        public override string ApplicationName { get => throw new NotImplementedException(); set => throw new NotImplementedException(); }
        public override void AddUsersToRoles(string[] usernames, string[] roleNames) => throw new NotImplementedException();
        public override void CreateRole(string roleName) => throw new NotImplementedException();
        public override bool DeleteRole(string roleName, bool throwOnPopulatedRole) => throw new NotImplementedException();
        public override string[] FindUsersInRole(string roleName, string usernameToMatch) => throw new NotImplementedException();
        public override string[] GetAllRoles() => throw new NotImplementedException();
        public override string[] GetUsersInRole(string roleName) => throw new NotImplementedException();
        public override bool IsUserInRole(string username, string roleName) => GetRolesForUser(username).Contains(roleName);
        public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames) => throw new NotImplementedException();
        public override bool RoleExists(string roleName) => throw new NotImplementedException();
    }
}

// --- 3. Controlador con Autorización Basada en Roles ---
using System.Web.Mvc;
using System.Security.Principal; // Para GenericPrincipal

namespace MyWebApp.Controllers
{
    // [Authorize] // Ya se niega el acceso anónimo en web.config globalmente

    public class AdminController : Controller
    {
        // GET: /Admin/Dashboard - Solo accesible por usuarios en el rol "Administrador"
        [Authorize(Roles = "Administrador")]
        public ActionResult Dashboard()
        {
            Console.WriteLine($"[Roles] Acceso a Dashboard por: {User.Identity.Name}");
            // Acceso a la identidad y roles del usuario actual
            var currentUser = User.Identity.Name;
            var isAdmin = User.IsInRole("Administrador");
            var isEditor = User.IsInRole("Editor");

            ViewBag.Message = $"Bienvenido al Dashboard de Administrador, {currentUser}. Eres Admin: {isAdmin}, Editor: {isEditor}.";
            return View();
        }

        // GET: /Admin/EditContent - Accesible por "Administrador" o "Editor"
        [Authorize(Roles = "Administrador, Editor")] // Múltiples roles separados por coma
        public ActionResult EditContent()
        {
            Console.WriteLine($"[Roles] Acceso a EditContent por: {User.Identity.Name}");
            ViewBag.Message = "Puedes editar contenido.";
            return View();
        }

        // POST: /Admin/CreateUser - Solo administradores
        [HttpPost]
        [Authorize(Roles = "Administrador")]
        public ActionResult CreateUser(string newUsername, string newPassword, string role)
        {
            Console.WriteLine($"[Roles] Intento de crear usuario '{newUsername}' con rol '{role}' por: {User.Identity.Name}");
            // Lógica para crear el usuario y asignarle el rol.
            ViewBag.Message = $"Usuario '{newUsername}' creado con rol '{role}'.";
            return View("Dashboard"); // Redirige al dashboard
        }

        // Método sin atributo [Authorize] pero dentro de un controlador que requiere [Authorize] globalmente.
        // Si el controlador tiene [Authorize] arriba, todos sus métodos lo heredan.
        // Si quieres un método público dentro de un controlador protegido, usa [AllowAnonymous]
        [AllowAnonymous]
        public ActionResult PublicInfo()
        {
            return Content("Esta información es pública.");
        }
    }

    // --- 4. Modificando el Ticket de Autenticación para incluir Roles (en AccountController.cs) ---
    // Cuando el usuario inicia sesión, es crucial que el ticket de autenticación incluya los roles.
    // Esto se logra asegurando que FormsAuthenticationModule y RoleManagerModule estén configurados.
    // Al llamar a FormsAuthentication.SetAuthCookie, los roles se asocian automáticamente si el RoleManager está configurado.

    /* Reemplazar o complementar en tu método Login POST:
    [HttpPost]
    [ValidateAntiForgeryToken]
    public ActionResult Login(string username, string password, bool rememberMe, string returnUrl)
    {
        // ... validación de usuario y contraseña ...

        if (isValidUser)
        {
            // Crea el ticket de autenticación. El RoleManager usará el CustomRoleProvider
            // para adjuntar los roles al principal del usuario.
            FormsAuthentication.SetAuthCookie(username, rememberMe);

            // Importante: para que User.IsInRole funcione inmediatamente después del login
            // y si estás en un contexto donde el Principal no se ha seteado aún (ej. dentro del mismo Request en algunos escenarios),
            // a veces necesitas setear el principal manualmente para el request actual.
            // Generalmente, el HttpContext.Current.User se setea automáticamente con los roles por el RoleManagerModule.
            // Si tuvieras problemas, esto podría ayudar:
            // var roles = Roles.GetRolesForUser(username); // Obtener roles usando el RoleProvider
            // var id = new FormsIdentity(username);
            // var principal = new GenericPrincipal(id, roles);
            // HttpContext.User = principal;
            // System.Threading.Thread.CurrentPrincipal = principal;

            Console.WriteLine($"[FormsAuth] Usuario '{username}' autenticado con roles.");

            // Redireccionar...
            if (Url.IsLocalUrl(returnUrl) && returnUrl.Length > 1 && !string.IsNullOrEmpty(returnUrl))
            {
                return Redirect(returnUrl);
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }
        // ...
    }
    */

    // Ejemplo incorrecto: Hardcodear la lógica de roles en cada método.
    // Mal: `if (User.Identity.Name == "admin" || User.Identity.Name == "jefe") { /* hacer algo */ }`
    // Esto es frágil y difícil de mantener. Siempre usa el sistema de roles proporcionado por el framework (`[Authorize(Roles = "")]` o `User.IsInRole()`).
    // Otro error es no separar la autenticación de la autorización. Primero sabes quién es (autenticación), luego decides qué puede hacer (autorización).
}
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Seguridad y Autenticación',
    'topic': 'Autenticación y Autorización',
    'subtopic': 'Protección contra ataques comunes (XSS, CSRF)',
    'definition': r'''
Proteger tus aplicaciones web contra ataques comunes como XSS y CSRF es como fortificar tu castillo digital contra ladrones astutos que buscan una grieta en la armadura. No es suficiente con tener una buena cerradura (autenticación); también necesitas defensas contra técnicas más sofisticadas que buscan engañar al castillo o a sus guardias.

¿Te estás preguntando por qué esto importa? Porque incluso la aplicación más bien diseñada puede ser vulnerable si no se consideran las debilidades comunes de la web. Los ataques XSS y CSRF son tristemente frecuentes y pueden llevar a robo de datos, suplantación de identidad o ejecución de código malicioso en el navegador de tus usuarios. Protegerte contra ellos es una parte fundamental de la responsabilidad de cualquier desarrollador que cree aplicaciones para la web.

Aquí vamos a ver de qué se trata todo esto y cómo .NET te ayuda a defenderte:

**1. Cross-Site Scripting (XSS):**
* **¿Qué es?** Es cuando un atacante inyecta scripts maliciosos (generalmente JavaScript) en una página web vista por otros usuarios. El navegador de la víctima ejecuta este script, que puede robar cookies, credenciales, modificar contenido de la página o redirigir al usuario a sitios fraudulentos.
* **Escenarios comunes:** Foros, comentarios, cajas de búsqueda, perfiles de usuario, donde la entrada del usuario no se valida o "escapa" correctamente antes de mostrarse.
* **¿Cómo protegerse en .NET?**
    * **Codificación de Salida (Output Encoding):** Esta es la defensa número uno. ASP.NET MVC y ASP.NET Core Razor Pages/Views automáticamente codifican la salida de datos a HTML (ej. convierten `<` en `&lt;`). Esto significa que si un atacante inserta `<script>`, se mostrará como texto y no se ejecutará. Siempre usa `@Html.DisplayFor()`, `@Html.Encode()`, o la sintaxis `@model.Property` en Razor en lugar de `Response.Write()` o `Eval()` sin codificar.
    * **Validación de Entrada:** Valida y sanitiza (limpia) todas las entradas del usuario en el servidor. Aunque la codificación ayuda, siempre es mejor no almacenar datos maliciosos en primer lugar.
    * **Política de Seguridad de Contenido (CSP - Content Security Policy):** Es un encabezado HTTP que le dice al navegador desde qué orígenes se pueden cargar scripts, estilos, etc., mitigando la ejecución de scripts no autorizados.

**2. Cross-Site Request Forgery (CSRF o XSRF):**
* **¿Qué es?** Es cuando un atacante engaña a un usuario autenticado para que envíe una solicitud HTTP maliciosa a un sitio web en el que ya tiene una sesión activa. La solicitud parece legítima porque proviene del navegador del usuario autenticado. El atacante podría, por ejemplo, hacer que la víctima cambie su contraseña o realice una transferencia de dinero sin su conocimiento.
* **Escenarios comunes:** Operaciones que cambian el estado del servidor (POST, PUT, DELETE), como cambiar contraseñas, realizar compras, enviar mensajes.
* **¿Cómo protegerse en .NET?**
    * **Tokens Antifalsificación (Anti-Forgery Tokens):** Esta es la defensa principal. ASP.NET MVC y ASP.NET Core utilizan tokens antifalsificación. Cuando se carga un formulario HTML, el servidor incrusta un token oculto y también envía una cookie con otro token. Cuando el formulario se envía, ambos tokens son verificados. Si no coinciden o faltan, la solicitud es rechazada. Esto evita que un atacante cree un formulario malicioso en otro sitio web que engañe a tu usuario.
        * En MVC: `@Html.AntiForgeryToken()` en la vista y `[ValidateAntiForgeryToken]` en el método POST del controlador.
        * En ASP.NET Core: `add @Html.AntiForgeryToken()` o simplemente usar `<form asp-action="...">` en Razor Pages/Views y el atributo `[ValidateAntiForgeryToken]` en el controlador. ASP.NET Core 2.0+ a menudo no requiere el `Html.AntiForgeryToken()` explícito en la vista para algunos escenarios de formularios POST, ya que lo añade automáticamente, pero el atributo en el controlador es crucial.
    * **Verificación de Encabezados de Referencia (Referer Header):** Aunque no es la defensa principal, verificar el encabezado `Referer` (que indica la página de origen de la solicitud) puede añadir una capa extra de seguridad. Sin embargo, no es 100% fiable.

La seguridad es un proceso continuo. No basta con aplicar estas medidas una vez; debes estar atento a las nuevas amenazas y actualizar tus prácticas.
''',
    'code_example': r'''
// Ejemplo de protección contra XSS y CSRF en ASP.NET Core MVC (similar en ASP.NET MVC 5)

using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Html; // Para IHtmlContent
using System.Text.Encodings.Web; // Para HtmlEncoder

namespace SecurityDemo.Controllers
{
    public class SeguridadController : Controller
    {
        // --- Protección contra XSS ---
        // GET: /Seguridad/Comentarios
        public IActionResult Comentarios()
        {
            // Simulación de comentarios existentes (algunos con posible XSS)
            var comments = new List<string>
            {
                "¡Gran artículo!",
                "Qué buen post. <script>alert('XSS de prueba!');</script>", // Ataque XSS
                "Me sirvió mucho <img src='x' onerror='alert(\"Imagen rota y XSS!\")'>", // Otro XSS
                "Esto es un comentario normal."
            };
            return View(comments);
        }

        // POST: /Seguridad/GuardarComentario
        [HttpPost]
        [ValidateAntiForgeryToken] // ¡Protección contra CSRF!
        public IActionResult GuardarComentario(string commentText)
        {
            if (string.IsNullOrEmpty(commentText))
            {
                return BadRequest("El comentario no puede estar vacío.");
            }

            Console.WriteLine($"[Seguridad] Comentario recibido: {commentText}");

            // En un escenario real, guardarías el comentario en una DB.
            // Aquí, lo añadimos y redirigimos para simular la persistencia.
            // Para la demostración, asumimos que estamos procesando la entrada.

            // Aunque ASP.NET Core y Razor codifican la salida por defecto,
            // si alguna vez necesitas mostrar texto sin codificar (¡MUY RARO Y RIESGOSO!),
            // deberías usar HtmlEncoder.Default.Encode() explícitamente.
            // var encodedComment = HtmlEncoder.Default.Encode(commentText);
            // Console.WriteLine($"[Seguridad] Comentario codificado (XSS): {encodedComment}");

            ViewBag.Message = "Comentario recibido exitosamente.";
            return RedirectToAction("Comentarios"); // Redirige para ver los comentarios (incluyendo el nuevo)
        }


        // --- Protección contra CSRF ---
        // GET: /Seguridad/CambiarPassword
        public IActionResult CambiarPassword()
        {
            // Solo mostrar la vista, el AntiforgeryToken se generará automáticamente en el formulario
            return View();
        }

        // POST: /Seguridad/CambiarPassword
        [HttpPost]
        [ValidateAntiForgeryToken] // ¡Este atributo es CRÍTICO para CSRF!
        public IActionResult CambiarPassword(string oldPassword, string newPassword)
        {
            // Lógica para cambiar la contraseña
            Console.WriteLine($"[Seguridad] Intento de cambio de contraseña. Usuario: {User.Identity?.Name ?? "Anónimo"}");
            Console.WriteLine($"[Seguridad] Contraseña antigua: {oldPassword}, Nueva: {newPassword}");

            // Aquí iría la lógica de validación de contraseña actual y actualización en la DB.
            // Por simplicidad, solo mostramos un mensaje.

            ViewBag.Message = "Contraseña cambiada exitosamente (simulado).";
            return View();
        }
    }
}

// --- Vistas de Razor (ej. Comentarios.cshtml) ---
/*
@* Views/Seguridad/Comentarios.cshtml *@
@model List<string>

@{
    ViewData["Title"] = "Comentarios";
}

<h1>Comentarios</h1>

@if (ViewBag.Message != null)
{
    <div class="alert alert-success">@ViewBag.Message</div>
}

<h2>Deja un comentario</h2>
<form asp-action="GuardarComentario" method="post">
    @* ASP.NET Core inserta automáticamente el token antifalsificación para formularios tag-helper *@
    @* Si usas Html.BeginForm, necesitarías @Html.AntiForgeryToken() explícitamente *@
    <div class="form-group">
        <textarea name="commentText" class="form-control" rows="3"></textarea>
    </div>
    <button type="submit" class="btn btn-primary">Enviar Comentario</button>
</form>

<h2>Todos los comentarios:</h2>
<ul>
    @foreach (var comment in Model)
    {
        <li>@comment</li> @* ¡Razor codifica automáticamente el HTML aquí! Esto protege contra XSS. *@
        @* Si POR ALGUNA RAZÓN quisieras mostrar HTML sin codificar (¡EVITAR SIEMPRE QUE SEA POSIBLE!),
           usarías @Html.Raw(comment), lo cual es EXTREMADAMENTE PELIGROSO y abriría una brecha de XSS. *@
    }
</ul>
*/

// --- Vista de Cambio de Contraseña (ej. CambiarPassword.cshtml) ---
/*
@* Views/Seguridad/CambiarPassword.cshtml *@
@{
    ViewData["Title"] = "Cambiar Contraseña";
}

<h1>Cambiar Contraseña</h1>

@if (ViewBag.Message != null)
{
    <div class="alert alert-success">@ViewBag.Message</div>
}

<form asp-action="CambiarPassword" method="post">
    @* ASP.NET Core inserta automáticamente el token antifalsificación aquí *@
    <div class="form-group">
        <label for="oldPassword">Contraseña Antigua:</label>
        <input type="password" name="oldPassword" class="form-control" />
    </div>
    <div class="form-group">
        <label for="newPassword">Contraseña Nueva:</label>
        <input type="password" name="newPassword" class="form-control" />
    </div>
    <button type="submit" class="btn btn-primary">Cambiar</button>
</form>
*/

// Ejemplo incorrecto de XSS:
// En una vista de Razor (o Web Forms), si haces esto:
// <li>@Html.Raw(comment)</li> // Permite la ejecución de scripts maliciosos si 'comment' contiene HTML/JS
// O si estás construyendo HTML dinámicamente y no codificas:
// string output = "<div>" + userInput + "</div>"; // Si userInput es "<script>alert('!');</script>", ¡Boom!

// Ejemplo incorrecto de CSRF:
// No usar [ValidateAntiForgeryToken] en un método POST/PUT/DELETE que cambia el estado del servidor.
// Si tu método POST para cambiar contraseña NO tuviera [ValidateAntiForgeryToken], un atacante podría:
// 1. Engañar al usuario para que visite una página maliciosa.
// 2. Esa página tendría un formulario oculto que se envía automáticamente a tu sitio:
//    <form action="http://tu-sitio.com/Seguridad/CambiarPassword" method="post">
//        <input type="hidden" name="oldPassword" value="cualquiera" />
//        <input type="hidden" name="newPassword" value="atacante_password" />
//    </form>
//    <script>document.forms[0].submit();</script>
// 3. Si el usuario está logeado en tu sitio, la solicitud se enviará con sus cookies de sesión,
//    y el cambio de contraseña se ejecutaría sin que el usuario se dé cuenta.
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Seguridad y Autenticación',
    'topic': 'Cifrado y Protección de Datos',
    'subtopic': 'Uso de clases de cifrado en .NET',
    'definition': r'''
El cifrado es una herramienta fundamental en la protección de datos, permitiéndote transformar información legible en un formato ilegible, de modo que solo las personas autorizadas puedan acceder a ella. Pensemos por un momento en esto como escribir un mensaje secreto con una tinta invisible, donde solo quienes tienen el químico especial pueden revelarlo.

¿Te estás preguntando por qué esto importa? Porque en el mundo digital actual, los datos viajan constantemente y se almacenan en diversos lugares. Desde información personal y financiera hasta secretos empresariales, todo está en riesgo de ser interceptado o accedido por personas no autorizadas. El cifrado te da la capacidad de proteger esta información tanto en tránsito (cuando se mueve de un lugar a otro) como en reposo (cuando está almacenada), garantizando su confidencialidad e integridad. Sin cifrado, cualquier dato sensible estaría expuesto a quienquiera que logre acceder a él.

.NET Framework y .NET (Core/5+) ofrecen un conjunto robusto de clases en el namespace `System.Security.Cryptography` que te permiten implementar diversos algoritmos de cifrado. Los tipos más comunes de cifrado que querrás entender son:

1.  **Cifrado Simétrico (Symmetric Encryption):**
    * Utiliza una **única clave** tanto para cifrar como para descifrar los datos.
    * Es muy eficiente y rápido, ideal para cifrar grandes volúmenes de datos.
    * El desafío principal es cómo compartir de forma segura la clave secreta entre las partes que necesitan comunicarse.
    * Algoritmos comunes en .NET:
        * **AES (Advanced Encryption Standard):** Es el estándar actual y el más recomendado para la mayoría de los propósitos de cifrado simétrico. Las clases como `AesManaged` (en Framework) o `Aes` (en .NET Core/5+) te permiten usarlo fácilmente.

2.  **Cifrado Asimétrico (Asymmetric Encryption o Criptografía de Clave Pública):**
    * Utiliza un **par de claves**: una clave pública y una clave privada.
    * Lo que se cifra con una clave solo puede descifrarse con la otra.
    * La clave pública se puede compartir libremente, mientras que la clave privada debe mantenerse en secreto.
    * Es mucho más lento que el cifrado simétrico, por lo que no se usa para cifrar grandes volúmenes de datos, sino para:
        * **Intercambio seguro de claves simétricas:** Cifrar la clave simétrica con la clave pública de un destinatario.
        * **Firmas digitales:** Probar la autenticidad y la integridad de los datos.
    * Algoritmos comunes en .NET:
        * **RSA (Rivest–Shamir–Adleman):** Ampliamente utilizado para intercambio de claves, firmas digitales y cifrado de pequeños datos. Las clases como `RSACryptoServiceProvider` (en Framework) o `RSA` (en .NET Core/5+) te permiten trabajar con él.

Además de los algoritmos en sí, es importante conocer conceptos como:
* **Vector de Inicialización (IV - Initialization Vector):** Un valor aleatorio que se usa con el cifrado simétrico para asegurar que dos mensajes idénticos no produzcan el mismo texto cifrado. Debe ser aleatorio y único para cada operación de cifrado, pero no necesita ser secreto (se envía junto con el texto cifrado).
* **Modos de Operación:** Cómo se aplica el algoritmo de cifrado a los datos (ej. CBC, GCM). GCM es un modo que también proporciona autenticación de los datos (lo que lo hace un modo de AEAD - Authenticated Encryption with Associated Data).

Cuando uses estas clases, siempre asegúrate de manejar las claves de forma segura y de usar algoritmos y modos de operación recomendados por los expertos en seguridad.
''',
    'code_example': r'''
// Ejemplo de uso de clases de cifrado en .NET (System.Security.Cryptography)
// Este ejemplo usa AES (simétrico) y RSA (asimétrico).

using System;
using System.Security.Cryptography; // Namespace para operaciones criptográficas
using System.Text; // Para convertir strings a bytes y viceversa

namespace EncryptionDemo
{
    public class Program
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("--- Demostración de Cifrado en .NET ---");

            string originalData = "Este es un mensaje secreto que quiero proteger con cifrado.";
            Console.WriteLine($"\nDatos Originales: {originalData}");

            // --- 1. Cifrado y Descifrado Simétrico con AES ---
            Console.WriteLine("\n--- Cifrado Simétrico con AES ---");
            byte[] aesKey;
            byte[] aesIV;
            byte[] encryptedAesData;

            // Generar una clave y un IV para AES (deben ser guardados de forma segura)
            using (Aes aesAlg = Aes.Create()) // Aes.Create() es preferido sobre AesManaged
            {
                aesAlg.GenerateKey();
                aesAlg.GenerateIV();
                aesKey = aesAlg.Key;
                aesIV = aesAlg.IV;

                encryptedAesData = EncryptAes(originalData, aesKey, aesIV);
                Console.WriteLine($"Datos Cifrados (AES, base64): {Convert.ToBase64String(encryptedAesData)}");
            }

            // Descifrar los datos con la misma clave e IV
            string decryptedAesData = DecryptAes(encryptedAesData, aesKey, aesIV);
            Console.WriteLine($"Datos Descifrados (AES): {decryptedAesData}");
            Console.WriteLine($"AES Cifrado Correcto: {originalData == decryptedAesData}");


            // --- 2. Cifrado y Descifrado Asimétrico con RSA ---
            // Nota: RSA no se usa para cifrar grandes volúmenes de datos directamente.
            // Se usa para cifrar claves simétricas o para firmas digitales.
            // Este ejemplo simple muestra la mecánica de cifrado/descifrado.
            Console.WriteLine("\n--- Cifrado Asimétrico con RSA ---");

            // Crear un par de claves RSA (pública y privada)
            // Se recomienda especificar el tamaño de la clave (ej. 2048 o 4096 bits)
            using (RSACryptoServiceProvider rsa = new RSACryptoServiceProvider(2048))
            {
                // Exportar la clave pública (para compartir con quien cifrará los datos)
                string publicKeyXml = rsa.ToXmlString(false); // false = solo clave pública
                Console.WriteLine($"Clave Pública RSA:\n{publicKeyXml.Substring(0, 100)}... (truncado)"); // Mostrar solo un pedazo

                // Exportar la clave privada (¡mantener en secreto!)
                string privateKeyXml = rsa.ToXmlString(true); // true = incluye clave privada
                // Console.WriteLine($"Clave Privada RSA:\n{privateKeyXml.Substring(0, 100)}... (truncado)");


                // Simular el cifrado por una "Parte A" usando la clave pública
                byte[] dataToEncryptRsa = Encoding.UTF8.GetBytes("Mensaje corto y secreto para RSA.");
                Console.WriteLine($"\nDatos a cifrar con RSA: {Encoding.UTF8.GetString(dataToEncryptRsa)}");

                byte[] encryptedRsaData = EncryptRsa(dataToEncryptRsa, publicKeyXml);
                Console.WriteLine($"Datos Cifrados (RSA, base64): {Convert.ToBase64String(encryptedRsaData)}");


                // Simular el descifrado por una "Parte B" usando la clave privada
                string decryptedRsaData = DecryptRsa(encryptedRsaData, privateKeyXml);
                Console.WriteLine($"Datos Descifrados (RSA): {decryptedRsaData}");
                Console.WriteLine($"RSA Cifrado Correcto: {Encoding.UTF8.GetString(dataToEncryptRsa) == decryptedRsaData}");
            }

            Console.WriteLine("\nPresiona cualquier tecla para salir.");
            Console.ReadKey();
        }

        // --- Métodos para Cifrado/Descifrado AES ---
        public static byte[] EncryptAes(string plainText, byte[] Key, byte[] IV)
        {
            if (plainText == null || plainText.Length <= 0)
                throw new ArgumentNullException("plainText");
            if (Key == null || Key.Length <= 0)
                throw new ArgumentNullException("Key");
            if (IV == null || IV.Length <= 0)
                throw new ArgumentNullException("IV");

            byte[] encrypted;
            using (Aes aesAlg = Aes.Create())
            {
                aesAlg.Key = Key;
                aesAlg.IV = IV;

                ICryptoTransform encryptor = aesAlg.CreateEncryptor(aesAlg.Key, aesAlg.IV);

                using (MemoryStream msEncrypt = new MemoryStream())
                {
                    using (CryptoStream csEncrypt = new CryptoStream(msEncrypt, encryptor, CryptoStreamMode.Write))
                    {
                        using (StreamWriter swEncrypt = new StreamWriter(csEncrypt))
                        {
                            swEncrypt.Write(plainText);
                        }
                        encrypted = msEncrypt.ToArray();
                    }
                }
            }
            return encrypted;
        }

        public static string DecryptAes(byte[] cipherText, byte[] Key, byte[] IV)
        {
            if (cipherText == null || cipherText.Length <= 0)
                throw new ArgumentNullException("cipherText");
            if (Key == null || Key.Length <= 0)
                throw new ArgumentNullException("Key");
            if (IV == null || IV.Length <= 0)
                throw new ArgumentNullException("IV");

            string plaintext = null;
            using (Aes aesAlg = Aes.Create())
            {
                aesAlg.Key = Key;
                aesAlg.IV = IV;

                ICryptoTransform decryptor = aesAlg.CreateDecryptor(aesAlg.Key, aesAlg.IV);

                using (MemoryStream msDecrypt = new MemoryStream(cipherText))
                {
                    using (CryptoStream csDecrypt = new CryptoStream(msDecrypt, decryptor, CryptoStreamMode.Read))
                    {
                        using (StreamReader srDecrypt = new StreamReader(csDecrypt))
                        {
                            plaintext = srDecrypt.ReadToEnd();
                        }
                    }
                }
            }
            return plaintext;
        }

        // --- Métodos para Cifrado/Descifrado RSA ---
        public static byte[] EncryptRsa(byte[] DataToEncrypt, string publicKeyXml)
        {
            using (RSACryptoServiceProvider rsa = new RSACryptoServiceProvider())
            {
                rsa.FromXmlString(publicKeyXml);
                // El parámetro "fOAEP" (Optimal Asymmetric Encryption Padding) es crucial para la seguridad de RSA.
                // Siempre debe ser 'true' para datos cifrados (no para firmas).
                return rsa.Encrypt(DataToEncrypt, true);
            }
        }

        public static string DecryptRsa(byte[] DataToDecrypt, string privateKeyXml)
        {
            using (RSACryptoServiceProvider rsa = new RSACryptoServiceProvider())
            {
                rsa.FromXmlString(privateKeyXml);
                byte[] decryptedData = rsa.Decrypt(DataToDecrypt, true);
                return Encoding.UTF8.GetString(decryptedData);
            }
        }
    }

    // Ejemplo incorrecto: Usar algoritmos de cifrado obsoletos o débiles.
    // Algoritmos como DES o RC2 son considerados inseguros hoy en día y no deben usarse.
    // MD5 o SHA1 para hashing de contraseñas también son débiles. Siempre usa algoritmos robustos como AES para cifrado
    // y algoritmos de hash lentos y salteados para contraseñas (como PBKDF2, bcrypt, scrypt).
    // Otro error es no usar un IV aleatorio y único para cada operación de cifrado simétrico,
    // lo que puede hacer que el cifrado sea vulnerable a ataques si se usa el mismo IV para mensajes idénticos.
}
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Seguridad y Autenticación',
    'topic': 'Cifrado y Protección de Datos',
    'subtopic': 'Almacenamiento seguro de contraseñas',
    'definition': r'''
Almacenar contraseñas de forma segura es una de las responsabilidades más críticas que tienes como desarrollador. Pensemos por un momento en esto como la caja fuerte más robusta para tus bienes más valiosos: no solo necesitas una cerradura fuerte, sino que también debes asegurarte de que la caja misma sea resistente a los golpes y que nadie pueda replicar la llave fácilmente.

¿Te estás preguntando por qué esto importa? Porque si un atacante logra acceder a tu base de datos de usuarios y encuentra las contraseñas almacenadas en texto plano o con un cifrado débil, el impacto puede ser devastador. No solo se comprometen las cuentas de tus usuarios, sino que muchos usuarios reutilizan sus contraseñas en múltiples sitios, lo que podría llevar a la toma de control de sus cuentas en otras plataformas. Almacenar contraseñas de forma segura es esencial para la privacidad y la confianza de tus usuarios.

El principio fundamental para almacenar contraseñas es **nunca guardarlas en texto plano (plaintext)**. En su lugar, debes almacenar un **hash criptográfico** de la contraseña. Pero no cualquier hash sirve. Las buenas prácticas son:

1.  **Hashing Fuerte (One-Way Hashing):**
    * Un hash es una función matemática que toma una entrada (la contraseña) y produce una cadena de caracteres de longitud fija (el hash).
    * Es una función "unidireccional": es fácil calcular el hash a partir de la contraseña, pero es computacionalmente inviable revertir el hash para obtener la contraseña original.
    * Cuando un usuario intenta iniciar sesión, se calcula el hash de la contraseña que ingresa y se compara con el hash almacenado. Si coinciden, la contraseña es correcta.
    * Algoritmos de hash criptográficos recomendados:
        * **SHA-256 o SHA-512:** Son mejores que MD5 o SHA-1 (que son vulnerables a ataques de colisión y ahora se consideran débiles). Sin embargo, por sí solos, no son suficientes para contraseñas.

2.  **Salting (Añadir un "sal"):**
    * Un "sal" es una cadena de datos aleatoria y única que se añade a la contraseña antes de hacerle hash.
    * **¿Por qué es crucial?** Si dos usuarios tienen la misma contraseña (ej. "123456"), sus hashes serán idénticos si no usas un sal. Esto hace que sea fácil para los atacantes usar "tablas arcoíris" (pre-calculadas de hashes comunes) para descifrar rápidamente muchas contraseñas.
    * Al añadir un sal único a cada contraseña, incluso si dos usuarios eligen la misma contraseña, sus hashes serán completamente diferentes. El sal se almacena junto con el hash en la base de datos (ya que no necesita ser secreto).

3.  **Key Stretching / Hashing Lento:**
    * Después de añadir el sal, la contraseña y el sal combinados se pasan por un algoritmo de hash que está diseñado para ser deliberadamente **lento**. Esto se logra realizando la operación de hash muchas veces (miles o millones de iteraciones).
    * **¿Por qué es necesario?** Los algoritmos de hash rápidos (como SHA-256) son ideales para verificar la integridad de archivos, pero son demasiado rápidos para contraseñas. Un atacante con un hardware potente podría calcular billones de hashes por segundo, lo que le permitiría probar un gran número de contraseñas por fuerza bruta o diccionario.
    * Los algoritmos lentos aumentan significativamente el tiempo que le toma a un atacante calcular un hash, haciendo los ataques de fuerza bruta inviables.
    * Algoritmos recomendados en .NET para key stretching:
        * **PBKDF2 (Password-Based Key Derivation Function 2):** Es el estándar de oro en .NET para este propósito y se puede usar a través de la clase `Rfc2898DeriveBytes`.
        * **bcrypt y scrypt:** Son alternativas aún más resistentes a ataques de hardware especializado (GPUs). Aunque no están nativamente en `System.Security.Cryptography`, hay implementaciones de terceros para .NET.

En resumen: **Contraseña + Sal Único -> Hash Lento (PBKDF2) -> Almacenar Hash y Sal.** Nunca olvides que la seguridad de las contraseñas es un compromiso constante.
''',
    'code_example': r'''
// Ejemplo de almacenamiento seguro de contraseñas en .NET usando PBKDF2 (Rfc2898DeriveBytes)

using System;
using System.Security.Cryptography; // Necesario para Rfc2898DeriveBytes
using System.Text; // Para Encoding.UTF8
using System.Linq; // Para SequenceEqual

namespace PasswordSecurityDemo
{
    public class PasswordHasher
    {
        // Longitud del sal en bytes
        private const int SaltSize = 16; // 128 bits
        // Longitud del hash en bytes
        private const int HashSize = 20; // 160 bits (para SHA1, aunque PBKDF2 puede usar SHA256/512)
        // Número de iteraciones (cuanto más alto, más seguro pero más lento)
        private const int Iterations = 10000; // Un valor razonable; ajustar según requisitos de seguridad y rendimiento

        /// <summary>
        /// Genera un hash seguro para la contraseña.
        /// Retorna el hash y el sal combinados en una cadena Base64 para almacenar.
        /// Formato: {ITERATIONS}.{BASE64_SALT}.{BASE64_HASH}
        /// </summary>
        public string HashPassword(string password)
        {
            // 1. Generar un sal aleatorio
            byte[] salt;
            using (var rng = RandomNumberGenerator.Create())
            {
                rng.GetBytes(salt = new byte[SaltSize]);
            }

            // 2. Calcular el hash de la contraseña usando PBKDF2
            // Usamos SHA1 como algoritmo hash subyacente para compatibilidad con Rfc2898DeriveBytes por defecto.
            // En .NET Core/5+, puedes especificar SHA256 o SHA512.
            using (var pbkdf2 = new Rfc2898DeriveBytes(password, salt, Iterations, HashAlgorithmName.SHA256)) // Preferir SHA256 si está disponible
            {
                byte[] hash = pbkdf2.GetBytes(HashSize);

                // 3. Combinar el sal y el hash para almacenar
                byte[] hashBytes = new byte[SaltSize + HashSize];
                Buffer.BlockCopy(salt, 0, hashBytes, 0, SaltSize);
                Buffer.BlockCopy(hash, 0, hashBytes, SaltSize, HashSize);

                // Convertir a cadena Base64 para almacenamiento en DB
                return $"{Iterations}.{Convert.ToBase64String(hashBytes)}";
            }
        }

        /// <summary>
        /// Verifica si una contraseña coincide con un hash almacenado.
        /// </summary>
        /// <param name="password">La contraseña a verificar.</param>
        /// <param name="storedHash">El hash almacenado (incluye iteraciones, sal y hash).</param>
        /// <returns>True si la contraseña es correcta, False en caso contrario.</returns>
        public bool VerifyPassword(string password, string storedHash)
        {
            try
            {
                // Extraer iteraciones, sal y hash del hash almacenado
                var parts = storedHash.Split('.');
                if (parts.Length != 2) return false; // Formato incorrecto

                int iterations = int.Parse(parts[0]);
                byte[] hashBytes = Convert.FromBase64String(parts[1]);

                if (hashBytes.Length != SaltSize + HashSize) return false;

                byte[] salt = new byte[SaltSize];
                Buffer.BlockCopy(hashBytes, 0, salt, 0, SaltSize);

                byte[] storedActualHash = new byte[HashSize];
                Buffer.BlockCopy(hashBytes, SaltSize, storedActualHash, 0, HashSize);

                // Calcular el hash de la contraseña proporcionada con el sal y las iteraciones recuperadas
                using (var pbkdf2 = new Rfc2898DeriveBytes(password, salt, iterations, HashAlgorithmName.SHA256)) // Usar el mismo algoritmo que en HashPassword
                {
                    byte[] computedHash = pbkdf2.GetBytes(HashSize);

                    // Comparar los hashes de forma segura para evitar ataques de temporización
                    return SlowEquals(computedHash, storedActualHash);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al verificar contraseña: {ex.Message}");
                return false;
            }
        }

        /// <summary>
        /// Compara dos arrays de bytes en tiempo constante para mitigar ataques de temporización.
        /// </summary>
        private bool SlowEquals(byte[] a, byte[] b)
        {
            uint diff = (uint)a.Length ^ (uint)b.Length;
            for (int i = 0; i < a.Length && i < b.Length; i++)
            {
                diff |= (uint)(a[i] ^ b[i]);
            }
            return diff == 0;
        }
    }


    public class Program
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("--- Demostración de Almacenamiento Seguro de Contraseñas ---");

            var hasher = new PasswordHasher();

            string userPassword1 = "MiContraseñaUltraSecreta123!";
            string userPassword2 = "otraContraseñaFACIL";
            string userPassword3 = "MiContraseñaUltraSecreta123!"; // Misma que la 1

            Console.WriteLine($"\nContraseña 1 original: '{userPassword1}'");
            string hashedPwd1 = hasher.HashPassword(userPassword1);
            Console.WriteLine($"Contraseña 1 hasheada: '{hashedPwd1}'");

            Console.WriteLine($"\nContraseña 2 original: '{userPassword2}'");
            string hashedPwd2 = hasher.HashPassword(userPassword2);
            Console.WriteLine($"Contraseña 2 hasheada: '{hashedPwd2}'");

            Console.WriteLine($"\nContraseña 3 original: '{userPassword3}' (misma que la 1)");
            string hashedPwd3 = hasher.HashPassword(userPassword3);
            Console.WriteLine($"Contraseña 3 hasheada: '{hashedPwd3}'");
            // Observa que hashedPwd1 y hashedPwd3 son diferentes debido al sal único.

            Console.WriteLine("\n--- Verificando Contraseñas ---");

            Console.WriteLine($"Verificando '{userPassword1}' contra el hash 1: {hasher.VerifyPassword(userPassword1, hashedPwd1)}"); // Debería ser True
            Console.WriteLine($"Verificando 'ContraseñaIncorrecta' contra el hash 1: {hasher.VerifyPassword("ContraseñaIncorrecta", hashedPwd1)}"); // Debería ser False
            Console.WriteLine($"Verificando '{userPassword2}' contra el hash 2: {hasher.VerifyPassword(userPassword2, hashedPwd2)}"); // Debería ser True
            Console.WriteLine($"Verificando '{userPassword1}' contra el hash 3: {hasher.VerifyPassword(userPassword1, hashedPwd3)}"); // Debería ser True

            Console.WriteLine("\nPresiona cualquier tecla para salir.");
            Console.ReadKey();
        }
    }

    // Ejemplo incorrecto de almacenamiento de contraseñas:
    // 1. Almacenar contraseñas en texto plano:
    //    // BAD: NEVER DO THIS!
    //    public string Password { get; set; } // Guardar esto directamente en la DB
    // 2. Usar solo un hash simple sin sal (ej. MD5 o SHA1 directo):
    //    // BAD: Vulnerable a tablas arcoíris y ataques de diccionario precalculados
    //    public string HashPassword_BAD_NO_SALT(string password)
    //    {
    //        using (var sha = SHA256.Create())
    //        {
    //            byte[] hashBytes = sha.ComputeHash(Encoding.UTF8.GetBytes(password));
    //            return Convert.ToBase64String(hashBytes);
    //        }
    //    }
    // 3. Usar un sal fijo para todos los usuarios:
    //    // BAD: Si el sal fijo se filtra, todos los hashes son tan vulnerables como si no hubiera sal.
    //    const string FixedSalt = "someFixedSecretSalt";
    //    // Con un sal fijo, dos usuarios con la misma contraseña tendrían el mismo hash,
    //    // volviendo a ser vulnerable a tablas arcoíris.
}
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Mid',
    'level': 3,
    'title_level': 'Seguridad y Autenticación',
    'topic': 'Cifrado y Protección de Datos',
    'subtopic': 'Protección de datos sensibles',
    'definition': r'''
Proteger datos sensibles va más allá de solo cifrar contraseñas; se trata de implementar una estrategia integral para salvaguardar toda aquella información que, si cayera en manos equivocadas, podría causar daño a tus usuarios o a tu negocio. Pensemos por un momento en esto como la seguridad de una bóveda bancaria: no solo proteges el dinero dentro, sino que también aseguras el acceso a la bóveda, la forma en que el dinero se transporta y cómo se registra su movimiento.

¿Te estás preguntando por qué esto importa? Porque las regulaciones de privacidad de datos (como GDPR, HIPAA) y la confianza de los usuarios exigen que las empresas tomen medidas serias para proteger la información confidencial. Un fallo en la protección de datos sensibles puede resultar en multas millonarias, pérdida de reputación y demandas legales. Es tu responsabilidad asegurar que información como números de tarjetas de crédito, datos médicos, números de identificación personal o cualquier otra información de identificación personal (PII) esté protegida en cada etapa de su ciclo de vida.

La protección de datos sensibles abarca varias áreas clave:

1.  **Cifrado en Reposo (Data at Rest Encryption):**
    * Significa cifrar los datos cuando están almacenados en una base de datos, en el disco duro de un servidor, en un dispositivo móvil o en la nube.
    * Si un atacante lograra acceder a la base de datos o al disco, los datos estarían cifrados y, por lo tanto, ilegibles sin la clave de descifrado.
    * Puedes usar:
        * **Cifrado a nivel de base de datos:** Como Transparent Data Encryption (TDE) en SQL Server.
        * **Cifrado a nivel de disco:** BitLocker en Windows, LUKS en Linux.
        * **Cifrado a nivel de aplicación:** Cifrar columnas específicas en tu base de datos utilizando clases de cifrado .NET (como AES, visto en el subtema anterior) antes de guardarlos. Esto te da el mayor control, pero también implica una gestión de claves más compleja.

2.  **Cifrado en Tránsito (Data in Transit Encryption):**
    * Protege los datos mientras se mueven a través de una red (internet, red local).
    * **HTTPS/SSL/TLS:** Es el estándar de oro. Siempre usa HTTPS para todas las comunicaciones web. Esto cifra el canal de comunicación entre el cliente y el servidor, protegiendo contra la interceptación de datos. ASP.NET Core y IIS facilitan la configuración de HTTPS.
    * **VPNs:** Para comunicaciones dentro de redes privadas o entre sucursales.

3.  **Gestión de Claves (Key Management):**
    * Las claves de cifrado son tan sensibles como los datos que protegen. Deben generarse, almacenarse, distribuirse y rotarse de forma segura.
    * **Azure Key Vault / AWS Key Management Service (KMS):** Servicios en la nube dedicados a almacenar y gestionar claves criptográficas de forma segura.
    * **HSMs (Hardware Security Modules):** Dispositivos físicos que almacenan claves y realizan operaciones criptográficas en un entorno altamente seguro.
    * **Protección de la configuración:** Si las claves se almacenan en el archivo de configuración (ej. `web.config` o `appsettings.json`), deberían estar cifradas o protegidas. `DPAPI` (Data Protection API) en Windows o `ASP.NET Core Data Protection` son útiles para esto.

4.  **Tokenización y Anonimización:**
    * **Tokenización:** Reemplazar datos sensibles (ej. número de tarjeta de crédito) con un valor no sensible (un token). Si el token se roba, no revela el dato original. El dato real se almacena de forma segura en otro sistema (ej. un proveedor de pagos).
    * **Anonimización/Pseudonimización:** Modificar datos para que no puedan ser asociados con una persona identificable sin información adicional. Útil para análisis de datos o entornos de prueba.

5.  **Auditoría y Registro (Logging and Auditing):**
    * Registra quién accede a qué datos y cuándo. Esto es vital para detectar intrusiones o actividades sospechosas y para cumplir con las normativas.

La protección de datos sensibles es un enfoque por capas. No confíes en una única medida de seguridad; combina varias para construir una defensa robusta.
''',
    'code_example': r'''
// Ejemplo conceptual de protección de datos sensibles en .NET

using System;
using System.Security.Cryptography; // Para cifrado a nivel de aplicación
using System.Text; // Para Encoding
using Microsoft.AspNetCore.DataProtection; // Para ASP.NET Core Data Protection
using Microsoft.Extensions.DependencyInjection; // Para DI en ASP.NET Core

namespace DataProtectionDemo
{
    public class DataProtector
    {
        // --- 1. Cifrado a nivel de aplicación para un campo específico (ej. Número de Tarjeta de Crédito) ---
        // Este es un ejemplo simplificado. En producción, la clave AES debe gestionarse de forma segura
        // (ej. de un Key Vault), y el IV debe ser único por cada cifrado y almacenarse/enviarse con el texto cifrado.
        private static readonly byte[] AesKey = Encoding.UTF8.GetBytes("EstaEsUnaClaveSecretaDe32BytesParaAES"); // 32 bytes = 256 bits
        private static readonly byte[] AesIV = Encoding.UTF8.GetBytes("EsteEsUnIV16Bytes"); // 16 bytes = 128 bits

        public string EncryptCreditCardNumber(string cardNumber)
        {
            using (Aes aesAlg = Aes.Create())
            {
                aesAlg.Key = AesKey;
                aesAlg.IV = AesIV; // En un escenario real, genera un IV aleatorio para cada cifrado

                ICryptoTransform encryptor = aesAlg.CreateEncryptor(aesAlg.Key, aesAlg.IV);

                using (MemoryStream msEncrypt = new MemoryStream())
                {
                    using (CryptoStream csEncrypt = new CryptoStream(msEncrypt, encryptor, CryptoStreamMode.Write))
                    {
                        using (StreamWriter swEncrypt = new StreamWriter(csEncrypt))
                        {
                            swEncrypt.Write(cardNumber);
                        }
                        byte[] encryptedBytes = msEncrypt.ToArray();
                        // Deberías almacenar/enviar el IV junto con los datos cifrados si es generado dinámicamente
                        return Convert.ToBase64String(encryptedBytes);
                    }
                }
            }
        }

        public string DecryptCreditCardNumber(string encryptedCardNumberBase64)
        {
            byte[] cipherText = Convert.FromBase64String(encryptedCardNumberBase64);

            using (Aes aesAlg = Aes.Create())
            {
                aesAlg.Key = AesKey;
                aesAlg.IV = AesIV; // Usar el IV que se usó para cifrar

                ICryptoTransform decryptor = aesAlg.CreateDecryptor(aesAlg.Key, aesAlg.IV);

                string plaintext = null;
                using (MemoryStream msDecrypt = new MemoryStream(cipherText))
                {
                    using (CryptoStream csDecrypt = new CryptoStream(msDecrypt, decryptor, CryptoStreamMode.Read))
                    {
                        using (StreamReader srDecrypt = new StreamReader(csDecrypt))
                        {
                            plaintext = srDecrypt.ReadToEnd();
                        }
                    }
                }
                return plaintext;
            }
        }

        // --- 2. Protección de Datos con ASP.NET Core Data Protection API ---
        // Ideal para cifrar strings o datos que necesitan ser descifrados por la misma aplicación
        // o por aplicaciones en el mismo cluster. Las claves se gestionan automáticamente.
        private readonly IDataProtector _protector;

        public DataProtector(IDataProtectionProvider dataProtectionProvider)
        {
            // Crea un protector con un "propósito" único. Esto asegura que solo este protector pueda descifrar
            // los datos que cifra, y aísla los datos cifrados de otras partes de la aplicación.
            _protector = dataProtectionProvider.CreateProtector("MyWebApp.SensitiveData");
        }

        public string ProtectData(string sensitiveData)
        {
            // El método Protect cifra los datos.
            return _protector.Protect(sensitiveData);
        }

        public string UnprotectData(string protectedData)
        {
            // El método Unprotect descifra los datos.
            return _protector.Unprotect(protectedData);
        }
    }


    public class Program
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("--- Demostración de Protección de Datos Sensibles ---");

            // --- Uso de Cifrado AES a nivel de aplicación ---
            Console.WriteLine("\n--- Cifrado AES de Tarjetas de Crédito ---");
            var myDataProtector = new DataProtector(null); // No necesita IDataProtectionProvider para esta parte

            string cardNumber = "1234-5678-9012-3456";
            Console.WriteLine($"Número de Tarjeta Original: {cardNumber}");

            string encryptedCard = myDataProtector.EncryptCreditCardNumber(cardNumber);
            Console.WriteLine($"Número de Tarjeta Cifrado: {encryptedCard}");

            string decryptedCard = myDataProtector.DecryptCreditCardNumber(encryptedCard);
            Console.WriteLine($"Número de Tarjeta Descifrado: {decryptedCard}");
            Console.WriteLine($"Coincide: {cardNumber == decryptedCard}");


            // --- Uso de ASP.NET Core Data Protection (simulación) ---
            Console.WriteLine("\n--- ASP.NET Core Data Protection ---");
            // En una aplicación ASP.NET Core real, DataProtectionProvider se inyectaría vía DI.
            // Aquí, simulamos una configuración simple en memoria para la demo.
            var services = new ServiceCollection();
            services.AddDataProtection()
                    .PersistKeysToFileSystem(new DirectoryInfo(@"c:\temp-keys\")) // Guarda las claves en el disco (en prod, usar Azure Key Vault)
                    .SetApplicationName("MyWebApp"); // Para aislar las claves de diferentes apps

            var serviceProvider = services.BuildServiceProvider();
            var dataProtectionProvider = serviceProvider.GetService<IDataProtectionProvider>();

            var aspNetCoreProtector = new DataProtector(dataProtectionProvider);

            string sensitiveEmail = "mi.email.secreto@ejemplo.com";
            Console.WriteLine($"Email sensible original: {sensitiveEmail}");

            string protectedEmail = aspNetCoreProtector.ProtectData(sensitiveEmail);
            Console.WriteLine($"Email protegido (ASP.NET Core DP): {protectedEmail}");

            string unprotectedEmail = aspNetCoreProtector.UnprotectData(protectedEmail);
            Console.WriteLine($"Email desprotegido (ASP.NET Core DP): {unprotectedEmail}");
            Console.WriteLine($"Coincide: {sensitiveEmail == unprotectedEmail}");

            Console.WriteLine("\nPresiona cualquier tecla para salir.");
            Console.ReadKey();
        }
    }

    // Ejemplo incorrecto de protección de datos sensibles:
    // 1. Almacenar datos sensibles en texto plano en la base de datos o logs.
    // 2. Usar un algoritmo de cifrado débil o un modo de operación inseguro.
    // 3. Hardcodear claves de cifrado en el código fuente de la aplicación o en archivos de configuración no protegidos.
    // 4. No usar HTTPS para todas las comunicaciones que involucren datos sensibles.
    // 5. Ignorar la rotación de claves de cifrado, dejando las mismas claves expuestas indefinidamente.
    // 6. Usar un mismo IV estático para todas las operaciones de cifrado simétrico; el IV debe ser aleatorio y único por cifrado.
}
'''
  });
}

Future<void> insertPuntonetMidLevel4Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Optimización y Rendimiento',
    'topic': 'Mejora de Rendimiento',
    'subtopic': 'Uso de caché en aplicaciones web',
    'definition': r'''
El uso de caché en aplicaciones web es una estrategia clave para que tu aplicación responda más rápido y use menos recursos, sirviendo información que ya ha sido procesada o consultada previamente. Pensemos por un momento en esto como tener una memoria rápida para guardar resultados de cálculos o datos frecuentes, en lugar de recalcular o ir a buscarlos cada vez que alguien los pide.

¿Te estás preguntando por qué esto importa? Porque cada vez que un usuario visita tu sitio web, tu servidor probablemente realiza operaciones como consultar una base de datos, realizar cálculos complejos o generar contenido dinámico. Si muchas personas piden la misma información, repetir estas operaciones una y otra vez consume tiempo y recursos del servidor. La caché entra en juego para almacenar estos resultados temporalmente, de modo que la próxima vez que alguien los pida, se puedan servir casi al instante desde la caché, sin necesidad de ir a la fuente original. Sin caché, tu aplicación podría sentirse lenta bajo carga, ofreciendo una mala experiencia de usuario y elevando tus costos de infraestructura.

En .NET, tienes varias formas de implementar caché en tus aplicaciones web:

1.  **Caché de Salida (Output Caching):**
    * Almacena la respuesta completa de una página o una acción de controlador en el servidor. Cuando una nueva solicitud llega para esa misma página/acción, se sirve directamente desde la caché sin ejecutar el código del servidor.
    * Es ideal para páginas o fragmentos de páginas que no cambian con mucha frecuencia.
    * En ASP.NET MVC/Web Forms, se usa el atributo `[OutputCache]`. En ASP.NET Core, se usa `[ResponseCache]` o el middleware de caché de respuestas.

2.  **Caché de Datos (Data Caching o In-Memory Caching):**
    * Almacena objetos de datos específicos (ej. resultados de consultas a bases de datos, objetos de negocio) en la memoria del servidor.
    * Es útil para datos que se acceden frecuentemente pero que no necesitan ser recalculados o consultados cada vez.
    * En .NET Framework, se usa la clase `System.Web.Caching.Cache`. En ASP.NET Core, `Microsoft.Extensions.Caching.Memory.IMemoryCache` es la interfaz estándar.

3.  **Caché Distribuida (Distributed Caching):**
    * Almacena datos en un servidor de caché externo (como Redis o Memcached) que es accesible por múltiples instancias de tu aplicación.
    * Es fundamental para aplicaciones escalables que se ejecutan en varios servidores, ya que asegura que todos los servidores accedan a la misma caché.
    * En ASP.NET Core, se usa `IDistributedCache`.

**Consideraciones clave al usar caché:**

* **Invalidación:** ¿Cuándo los datos en caché se vuelven "viejos" o inválidos y necesitan ser refrescados? Esto puede ser por tiempo (expiración), por dependencia (cuando un dato subyacente cambia), o manualmente.
* **Volatilidad:** ¿Qué tan a menudo cambian los datos? No caches datos que cambian constantemente.
* **Memoria:** La caché in-memory consume RAM. Asegúrate de no agotar los recursos del servidor.
* **Coherencia:** En sistemas distribuidos, mantener la coherencia de la caché entre múltiples servidores es un desafío.

Usar la caché de forma inteligente puede reducir drásticamente la carga en tus servidores y mejorar la experiencia del usuario, haciendo que tu aplicación se sienta más ágil y responsiva.
''',
    'code_example': r'''
// Ejemplo de uso de caché en aplicaciones web ASP.NET Core

// --- 1. Caché de Salida (Response Caching) ---
// Configuración en Program.cs (o Startup.cs)
/*
var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();

// Habilitar el servicio de caché de respuesta
builder.Services.AddResponseCaching();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnet-core-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

// Usar el middleware de caché de respuesta ANTES de MapControllers
app.UseResponseCaching();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
*/

// --- En un Controlador ASP.NET Core (ej. HomeController.cs) ---
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System.Threading.Tasks;

namespace MyWebApp.Controllers
{
    public class HomeController : Controller
    {
        // Cachea la respuesta de esta acción por 60 segundos.
        // Los clientes también pueden cachear la respuesta.
        [ResponseCache(Duration = 60, Location = ResponseCacheLocation.Any, NoStore = false)]
        public IActionResult Index()
        {
            Console.WriteLine("[ResponseCache] Serviendo Index. Hora de generación: " + DateTime.Now.ToString("HH:mm:ss"));
            return View(); // La vista generada será cacheada
        }

        // Puedes cachear por parámetros de ruta o query string si es necesario.
        // Por ejemplo, diferentes versiones de una página basada en un ID.
        [ResponseCache(Duration = 30, Location = ResponseCacheLocation.Any, VaryByQueryKeys = new string[] { "id" })]
        public IActionResult ProductDetail(int id)
        {
            Console.WriteLine($"[ResponseCache] Serviendo ProductDetail para ID: {id}. Hora de generación: {DateTime.Now.ToString("HH:mm:ss")}");
            // Lógica para obtener detalles del producto
            ViewBag.ProductId = id;
            return View();
        }

        // Para evitar caché:
        [ResponseCache(NoStore = true, Duration = 0)]
        public IActionResult Privacy()
        {
            return View();
        }
    }
}

// --- 2. Caché de Datos (In-Memory Caching) ---
// Configuración en Program.cs (o Startup.cs)
/*
var builder = WebApplication.CreateBuilder(args);

// ... otros servicios ...

// Habilitar el servicio de caché en memoria
builder.Services.AddMemoryCache();

// ... build y run app ...
*/

// --- En un Servicio o Controlador ASP.NET Core (ej. ProductService.cs) ---
using Microsoft.Extensions.Caching.Memory;
using System.Collections.Generic;

namespace MyWebApp.Services
{
    public class Product
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
    }

    public class ProductService
    {
        private readonly IMemoryCache _cache;
        private static readonly List<Product> _productsDb = new List<Product>
        {
            new Product { Id = 1, Name = "Laptop X", Price = 1200m },
            new Product { Id = 2, Name = "Smartphone Y", Price = 800m }
        };

        public ProductService(IMemoryCache cache)
        {
            _cache = cache;
        }

        public async Task<List<Product>> GetAllProductsAsync()
        {
            string cacheKey = "AllProducts";
            List<Product> products;

            // Intenta obtener los productos de la caché
            if (!_cache.TryGetValue(cacheKey, out products))
            {
                // Si no están en caché, obténlos de la "base de datos" (simulado con _productsDb)
                Console.WriteLine("[MemoryCache] Productos no encontrados en caché, obteniendo de la DB.");
                await Task.Delay(1000); // Simula una operación de DB lenta
                products = _productsDb;

                // Configura las opciones de caché
                var cacheEntryOptions = new MemoryCacheEntryOptions()
                    .SetSlidingExpiration(TimeSpan.FromSeconds(30)) // Expira si no se accede en 30 segundos
                    .SetAbsoluteExpiration(TimeSpan.FromMinutes(5)); // Expira como máximo en 5 minutos

                // Guarda los productos en caché
                _cache.Set(cacheKey, products, cacheEntryOptions);
                Console.WriteLine("[MemoryCache] Productos guardados en caché.");
            }
            else
            {
                Console.WriteLine("[MemoryCache] Productos obtenidos de la caché.");
            }

            return products;
        }

        public void ClearProductsCache()
        {
            string cacheKey = "AllProducts";
            _cache.Remove(cacheKey); // Invalida la caché manualmente
            Console.WriteLine("[MemoryCache] Caché de productos borrada manualmente.");
        }
    }
}

// Para usar ProductService en un controlador:
/*
public class ProductsController : Controller
{
    private readonly ProductService _productService;

    public ProductsController(ProductService productService)
    {
        _productService = productService;
    }

    public async Task<IActionResult> Index()
    {
        var products = await _productService.GetAllProductsAsync();
        return View(products);
    }

    public IActionResult ClearCache()
    {
        _productService.ClearProductsCache();
        return RedirectToAction("Index");
    }
}
*/

// Ejemplo incorrecto: Cachear datos sensibles o datos que cambian muy a menudo.
// No debes cachear información como el saldo de una cuenta bancaria sin una invalidación muy precisa y en tiempo real,
// ya que podría mostrar información desactualizada.
// Otro error es no considerar la invalidación de la caché. Si los datos cambian en la fuente original (DB),
// pero la caché no se actualiza, los usuarios verán información obsoleta.
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Optimización y Rendimiento',
    'topic': 'Mejora de Rendimiento',
    'subtopic': 'Optimización de consultas a la base de datos',
    'definition': r'''
La optimización de consultas a la base de datos es una de las palancas más potentes que tienes para mejorar el rendimiento de tus aplicaciones, ya que la base de datos suele ser el cuello de botella principal en muchos sistemas. Pensemos por un momento en esto como afinar un motor de carreras para que cada componente funcione con la máxima eficiencia y no haya nada que lo ralentice.

¿Te estás preguntando por qué esto importa? Porque cada vez que tu aplicación interactúa con la base de datos (para leer, escribir, actualizar o eliminar datos), se invierte tiempo. Si tus consultas son lentas o ineficientes, este tiempo se acumula rápidamente, afectando la velocidad de respuesta de tu aplicación, la experiencia del usuario y, en última instancia, la capacidad de tu sistema para manejar un gran número de usuarios simultáneos. Una base de datos lenta es como un embudo que ahoga el rendimiento de toda tu aplicación.

Vamos a ver de qué se trata todo esto y algunas técnicas clave para optimizar tus consultas en el contexto de .NET (y SQL, que es donde sucede la magia):

1.  **Uso Adecuado de Índices:**
    * Los índices son como el índice de un libro: permiten que la base de datos encuentre filas rápidamente sin tener que escanear toda la tabla.
    * Crea índices en columnas que usas frecuentemente en tus cláusulas `WHERE`, `JOIN`, `ORDER BY` y `GROUP BY`.
    * **Cuidado:** Demasiados índices pueden ralentizar las operaciones de escritura (INSERT, UPDATE, DELETE), ya que la base de datos tiene que mantener los índices actualizados.

2.  **Evitar `SELECT *`:**
    * Siempre selecciona solo las columnas que realmente necesitas. Pedir `*` (todas las columnas) recupera datos innecesarios de la base de datos y los envía a través de la red, consumiendo ancho de banda y memoria.

3.  **Filtrar Datos Temprano:**
    * Aplica tus cláusulas `WHERE` lo antes posible en la consulta para reducir el conjunto de datos que la base de datos tiene que procesar.

4.  **Optimizar `JOIN`s:**
    * Asegúrate de que las columnas utilizadas en las cláusulas `JOIN` estén indexadas.
    * Entiende los tipos de `JOIN` (INNER, LEFT, RIGHT, FULL) y usa el que mejor se adapte a tus necesidades para evitar recuperar filas no deseadas.

5.  **Paginación Eficiente:**
    * Cuando muestras grandes listas de datos, no los cargues todos a la vez. Implementa paginación (`OFFSET`/`FETCH NEXT` en SQL Server, `LIMIT`/`OFFSET` en MySQL/PostgreSQL).
    * Esto reduce la cantidad de datos recuperados y el tiempo de respuesta.

6.  **Uso de ORM (Entity Framework Core / EF 6) y su optimización:**
    * Los ORMs como Entity Framework son geniales para la productividad, pero pueden generar consultas SQL ineficientes si no los usas correctamente.
    * **Proyección (`.Select()`):** Cuando uses LINQ, usa `.Select()` para seleccionar solo las columnas que necesitas, en lugar de cargar toda la entidad (`.ToList()`).
    * **`AsNoTracking()`:** Si solo vas a leer datos y no a modificarlos, usa `AsNoTracking()` para evitar que EF rastree los objetos, lo que mejora el rendimiento.
    * **Carga Eager, Lazy y Explicit:**
        * **Eager Loading (`.Include()`):** Carga entidades relacionadas junto con la entidad principal en una sola consulta. Preferible para evitar el problema de "N+1 queries".
        * **Lazy Loading:** Carga entidades relacionadas solo cuando se acceden. Conveniente, pero puede llevar a N+1 queries si no se usa con cuidado.
        * **Explicit Loading:** Carga entidades relacionadas explícitamente cuando las necesitas.
    * **Batching / Transactiones:** Agrupa múltiples operaciones de escritura en un solo lote o transacción para reducir los viajes de ida y vuelta a la base de datos.
    * **SQL Puro:** Para consultas muy complejas o críticas para el rendimiento, a veces es mejor escribir SQL puro y ejecutarlo directamente (`FromSqlRaw`, `ExecuteSqlRaw` en EF Core).

7.  **Análisis del Plan de Ejecución (Execution Plan):**
    * Esta es la herramienta más poderosa. La base de datos te mostrará cómo planea ejecutar tu consulta, dónde está gastando más tiempo y si está usando índices correctamente. Aprende a leerlos.

Implementar estas técnicas puede hacer una diferencia abismal en la velocidad y escalabilidad de tu aplicación.
''',
    'code_example': r'''
// Ejemplo de optimización de consultas a la base de datos con Entity Framework Core
// (Los principios son similares para EF 6 y SQL directamente)

using System;
using System.Linq;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore; // Necesario para Entity Framework Core

namespace DbOptimizationDemo
{
    // --- Modelos de Ejemplo ---
    public class Product
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public int Stock { get; set; }
        public int CategoryId { get; set; }
        public Category Category { get; set; } // Propiedad de navegación
    }

    public class Category
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public ICollection<Product> Products { get; set; } // Propiedad de navegación inversa
    }

    // --- Contexto de Base de Datos de Ejemplo (simulación con SQLite en memoria) ---
    public class MyDbContext : DbContext
    {
        public DbSet<Product> Products { get; set; }
        public DbSet<Category> Categories { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlite("DataSource=:memory:"); // Base de datos SQLite en memoria
            optionsBuilder.LogTo(Console.WriteLine, LogLevel.Information); // Para ver las consultas SQL generadas por EF
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // Seed data para la demostración
            modelBuilder.Entity<Category>().HasData(
                new Category { Id = 1, Name = "Electrónica" },
                new Category { Id = 2, Name = "Hogar" }
            );

            modelBuilder.Entity<Product>().HasData(
                new Product { Id = 1, Name = "Laptop XYZ", Price = 1200m, Stock = 50, CategoryId = 1 },
                new Product { Id = 2, Name = "Smart TV 55", Price = 800m, Stock = 30, CategoryId = 1 },
                new Product { Id = 3, Name = "Batidora Premium", Price = 150m, Stock = 70, CategoryId = 2 },
                new Product { Id = 4, Name = "Aspiradora Robótica", Price = 300m, Stock = 40, CategoryId = 2 },
                new Product { Id = 5, Name = "Auriculares Bluetooth", Price = 75m, Stock = 100, CategoryId = 1 }
            );
        }
    }


    public class Program
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("--- Demostración de Optimización de Consultas a la Base de Datos ---");

            using (var context = new MyDbContext())
            {
                context.Database.EnsureCreated(); // Asegura que la DB en memoria se cree y se seedee

                // --- 1. Evitar SELECT * (Proyección de datos) ---
                Console.WriteLine("\n--- 1. Proyección (Seleccionar solo las columnas necesarias) ---");
                // MAL: Carga todas las columnas de todos los productos en memoria.
                // var allProducts = context.Products.ToList(); // Genera SELECT * FROM Products

                // BIEN: Selecciona solo las propiedades necesarias para una vista o informe.
                var productNames = context.Products
                    .Where(p => p.Stock > 0)
                    .Select(p => new { p.Name, p.Price }) // Selecciona solo Nombre y Precio
                    .ToList();

                Console.WriteLine("Nombres y Precios de Productos en Stock:");
                foreach (var p in productNames)
                {
                    Console.WriteLine($"- {p.Name} (${p.Price})");
                }


                // --- 2. Carga ansiosa (Eager Loading) para evitar N+1 queries ---
                Console.WriteLine("\n--- 2. Carga Ansiosa (Eager Loading) ---");
                // MAL: Problema de N+1 queries. Por cada producto, se haría una consulta extra para su categoría.
                // var productsWithCategoriesLazy = context.Products.ToList();
                // foreach (var product in productsWithCategoriesLazy)
                // {
                //     // Esto dispara una nueva consulta a la DB por cada Category que no esté ya en caché de EF.
                //     Console.WriteLine($"Producto: {product.Name}, Categoría: {product.Category.Name}");
                // }

                // BIEN: Carga la categoría junto con el producto en una sola consulta.
                var productsWithCategoriesEager = context.Products
                    .Include(p => p.Category) // Carga la propiedad de navegación Category
                    .ToList();

                Console.WriteLine("Productos con sus Categorías (Eager Loaded):");
                foreach (var product in productsWithCategoriesEager)
                {
                    Console.WriteLine($"- {product.Name} (Categoría: {product.Category.Name})");
                }


                // --- 3. Filtrar datos temprano ---
                Console.WriteLine("\n--- 3. Filtrar datos temprano ---");
                // En lugar de cargar todo y luego filtrar en memoria:
                // MAL: var allProducts = context.Products.ToList(); var highPriceProducts = allProducts.Where(p => p.Price > 200m);

                // BIEN: Filtrar en la base de datos directamente
                var expensiveProducts = context.Products
                    .Where(p => p.Price > 200m) // El filtro se aplica en la DB
                    .ToList();

                Console.WriteLine("Productos de alto precio (> $200):");
                foreach (var p in expensiveProducts)
                {
                    Console.WriteLine($"- {p.Name} (${p.Price})");
                }


                // --- 4. Usar AsNoTracking() para consultas de solo lectura ---
                Console.WriteLine("\n--- 4. AsNoTracking() para rendimiento en solo lectura ---");
                // Cuando solo necesitas los datos y no vas a modificarlos, evita que EF los rastree.
                var readOnlyProducts = context.Products
                    .AsNoTracking() // EF no rastreará estos objetos, mejorando el rendimiento
                    .Where(p => p.Stock > 10)
                    .ToList();

                Console.WriteLine("Productos con stock > 10 (sin seguimiento de cambios):");
                foreach (var p in readOnlyProducts)
                {
                    Console.WriteLine($"- {p.Name} (Stock: {p.Stock})");
                }


                // --- 5. Paginación eficiente ---
                Console.WriteLine("\n--- 5. Paginación eficiente ---");
                int pageNumber = 1;
                int pageSize = 2;
                var pagedProducts = context.Products
                    .OrderBy(p => p.Id) // Importante para paginación consistente
                    .Skip((pageNumber - 1) * pageSize) // Saltar los elementos de páginas anteriores
                    .Take(pageSize) // Tomar solo los elementos de la página actual
                    .ToList();

                Console.WriteLine($"Productos en la página {pageNumber} (tamaño {pageSize}):");
                foreach (var p in pagedProducts)
                {
                    Console.WriteLine($"- {p.Name}");
                }


                Console.WriteLine("\nPresiona cualquier tecla para salir.");
                Console.ReadKey();
            }
        }
    }

    // Ejemplo incorrecto:
    // 1. SELECT * de tablas grandes:
    //    `context.Orders.ToList();` en una tabla de millones de órdenes es un desastre.
    // 2. N+1 queries (Lazy Loading sin cuidado):
    //    Iterar sobre una colección y acceder a propiedades de navegación sin haberlas cargado previamente.
    //    Si tienes 100 productos y en el bucle accedes a product.Category.Name sin `Include`,
    //    se generarán 100 consultas adicionales (total 101 consultas).
    // 3. Filtrar en memoria en lugar de en la base de datos:
    //    `context.Products.ToList().Where(p => p.Price > 200m);`
    //    Esto trae TODOS los productos a la aplicación y luego los filtra, siendo muy ineficiente.
    // 4. Falta de índices en columnas usadas en WHERE, JOIN, ORDER BY.
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Optimización y Rendimiento',
    'topic': 'Mejora de Rendimiento',
    'subtopic': 'Minimización de recursos en aplicaciones web',
    'definition': r'''
Minimizar los recursos en aplicaciones web es una práctica esencial para mejorar la velocidad de carga, la experiencia del usuario y reducir el consumo de ancho de banda y los costos de hosting. Pensemos por un momento en esto como empaquetar una maleta para un viaje: quieres llevar lo esencial, pero bien doblado y comprimido para que ocupe el menor espacio posible y sea fácil de transportar.

¿Te estás preguntando por qué esto importa? Porque cada archivo (HTML, CSS, JavaScript, imágenes) que tu aplicación web envía al navegador de un usuario consume ancho de banda y tiempo. Cuanto más grandes y numerosos sean estos archivos, más tiempo tardará la página en cargar. En un mundo donde los usuarios esperan inmediatez y muchos acceden desde conexiones móviles, cada milisegundo cuenta. Una página lenta puede significar que los usuarios se frustren y se vayan. Además, reducir el tamaño de los recursos impacta directamente en tus facturas de alojamiento y CDN.

Vamos a ver de qué se trata todo esto y cómo .NET te ayuda a lograrlo:

1.  **Minificación (Minification):**
    * **¿Qué es?** Elimina caracteres innecesarios de tus archivos de código (espacios en blanco, saltos de línea, comentarios, etc.) sin alterar la funcionalidad.
    * **Beneficio:** Reduce drásticamente el tamaño de los archivos CSS y JavaScript.
    * **En .NET:** En proyectos ASP.NET Core, la minificación se puede configurar durante el proceso de publicación para entornos de producción. Herramientas como WebPack o Bundler & Minifier (extensión de Visual Studio) también lo hacen.

2.  **Bundling (Agrupación):**
    * **¿Qué es?** Combina múltiples archivos de un mismo tipo (varios archivos CSS en uno, varios archivos JS en uno) en un solo archivo.
    * **Beneficio:** Reduce el número de solicitudes HTTP que el navegador tiene que hacer al servidor, lo cual es muy importante ya que cada solicitud tiene una sobrecarga de red.
    * **En .NET:** Al igual que la minificación, se puede configurar en el proceso de publicación o usar herramientas de terceros.

3.  **Compresión (Gzip/Brotli):**
    * **¿Qué es?** El servidor comprime los archivos antes de enviarlos al navegador, y el navegador los descomprime al recibirlos. Gzip es el estándar; Brotli es más moderno y eficiente.
    * **Beneficio:** Reduce aún más el tamaño de los archivos que viajan por la red. La mayoría de los servidores web (IIS, Nginx, Apache) están configurados para hacer esto automáticamente.
    * **En .NET:** ASP.NET Core tiene un middleware de compresión de respuestas (`app.UseResponseCompression()`).

4.  **Optimización de Imágenes:**
    * **¿Qué es?** Reducir el tamaño de los archivos de imagen sin comprometer demasiado la calidad visual.
    * **Técnicas:** Usar el formato de imagen correcto (JPEG para fotos, PNG para gráficos con transparencia, WebP para un equilibrio superior), comprimir imágenes con herramientas de optimización (online o offline), usar lazy loading para imágenes (cargarlas solo cuando el usuario se desplaza a ellas).
    * **En .NET:** No hay una solución nativa de optimización de imágenes en tiempo real robusta; se suelen usar herramientas externas o CDN con optimización de imagen.

5.  **Caché del Navegador (Browser Caching):**
    * **¿Qué es?** Instruir al navegador del usuario para que almacene temporalmente archivos estáticos (CSS, JS, imágenes) para que no tenga que descargarlos nuevamente en visitas posteriores.
    * **Beneficio:** Las páginas cargan mucho más rápido para usuarios recurrentes.
    * **En .NET:** Se configura mediante encabezados HTTP como `Cache-Control` y `Expires`, que pueden ser gestionados por el servidor web (IIS) o por tu aplicación ASP.NET Core.

6.  **Uso de Redes de Entrega de Contenido (CDNs - Content Delivery Networks):**
    * **¿Qué es?** Distribuir tus archivos estáticos (JS, CSS, imágenes) a servidores ubicados geográficamente más cerca de tus usuarios.
    * **Beneficio:** Reduce la latencia (el tiempo que tardan los datos en viajar) y descarga el tráfico de tu servidor principal.

La minimización de recursos es un trabajo continuo que requiere atención al detalle, pero los beneficios en rendimiento y experiencia del usuario son significativos.
''',
    'code_example': r'''
// Ejemplo de minimización de recursos en ASP.NET Core

// --- 1. Minificación y Bundling (Configuración de Publish) ---
// En ASP.NET Core, la minificación y el bundling de CSS/JS se configuran típicamente en el archivo de proyecto (.csproj)
// o se usan herramientas de frontend como Webpack, Gulp, Rollup.

// Ejemplo de .csproj (en PropertyGroup) para control en producción:
/*
<PropertyGroup>
    <Optimize>true</Optimize> // Habilita optimización, incluyendo minificación para JS/CSS
    <PublishWithAspNetCoreTargetManifest>false</PublishWithAspNetCoreTargetManifest> // Asegura que se genere en el publish
</PropertyGroup>
*/

// O usando Bundler & Minifier (paquete NuGet o extensión de VS):
// Configura un `bundleconfig.json` en la raíz de tu proyecto:
/*
[
  {
    "outputFileName": "wwwroot/css/site.min.css",
    "inputFiles": [
      "wwwroot/css/site.css",
      "wwwroot/css/custom.css"
    ]
  },
  {
    "outputFileName": "wwwroot/js/site.min.js",
    "inputFiles": [
      "wwwroot/js/site.js",
      "wwwroot/js/utils.js"
    ],
    "minify": {
      "enabled": true,
      "renameLocals": true
    },
    "sourceMap": false
  }
]
*/
// Luego, en tus vistas Razor:
/*
<link rel="stylesheet" href="~/css/site.min.css" asp-append-version="true" />
<script src="~/js/site.min.js" asp-append-version="true"></script>
*/

// --- 2. Compresión de Respuestas (Gzip/Brotli) ---
// Configuración en Program.cs (o Startup.cs)
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.ResponseCompression;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System.IO.Compression; // Para CompressionLevel

namespace ResourceMinimizationDemo
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.
            builder.Services.AddControllersWithViews();

            // Habilitar el servicio de compresión de respuestas
            builder.Services.AddResponseCompression(options =>
            {
                options.EnableForHttps = true; // Habilitar compresión sobre HTTPS (¡importante!)
                // Añadir tipos MIME comunes que se comprimirán
                options.MimeTypes = ResponseCompressionDefaults.MimeTypes.Concat(new[]
                {
                    "application/javascript",
                    "text/css",
                    "application/json",
                    "text/html"
                    // Puedes añadir más tipos si es necesario
                });
                // Elegir el proveedor de compresión (ej. Gzip, Brotli)
                options.Providers.Add<GzipCompressionProvider>();
                options.Providers.Add<BrotliCompressionProvider>(); // Brotli es más eficiente pero no todos los navegadores lo soportan viejos
            });

            // Configurar los proveedores de compresión
            builder.Services.Configure<GzipCompressionProviderOptions>(options =>
            {
                options.Level = CompressionLevel.Fastest; // O CompressionLevel.Optimal, CompressionLevel.NoCompression
            });
            builder.Services.Configure<BrotliCompressionProviderOptions>(options =>
            {
                options.Level = CompressionLevel.Fastest;
            });


            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (!app.Environment.IsDevelopment())
            {
                app.UseExceptionHandler("/Home/Error");
                app.UseHsts();
            }

            app.UseHttpsRedirection();

            // Usar el middleware de compresión de respuestas ANTES de UseStaticFiles y MapControllers
            app.UseResponseCompression();

            app.UseStaticFiles(); // Para servir archivos CSS, JS, imágenes
            app.UseRouting();
            app.UseAuthorization();
            app.MapControllerRoute(
                name: "default",
                pattern: "{controller=Home}/{action=Index}/{id?}");

            app.Run();
        }
    }
}

// --- 3. Caché del Navegador (Controladores y Archivos Estáticos) ---
// Para archivos estáticos (en Program.cs/Startup.cs)
/*
app.UseStaticFiles(new StaticFileOptions
{
    OnPrepareResponse = ctx =>
    {
        // Cachear archivos estáticos por 30 días
        ctx.Context.Response.Headers.Append("Cache-Control", "public,max-age=2592000"); // 30 días en segundos
        ctx.Context.Response.Headers.Append("Expires", DateTime.UtcNow.AddDays(30).ToString("R")); // R = RFC1123 format
    }
});
*/

// Para páginas dinámicas o API (en un Controlador):
using Microsoft.AspNetCore.Mvc;

namespace ResourceMinimizationDemo.Controllers
{
    public class MyDataController : Controller
    {
        [HttpGet]
        // Instruye al navegador para cachear la respuesta por 10 minutos
        [ResponseCache(Duration = 600, Location = ResponseCacheLocation.Client)] // Location.Client es importante aquí
        public IActionResult GetSomeStaticData()
        {
            return Ok(new { Message = "Este dato no cambia mucho.", Timestamp = DateTime.Now });
        }
    }
}

// Ejemplo incorrecto:
// 1. Servir archivos CSS/JS con mucho espacio en blanco, comentarios o sin agrupar.
//    Esto aumenta el tamaño del archivo y el número de solicitudes HTTP.
// 2. Usar imágenes de muy alta resolución o formato inadecuado (ej. PNG para fotos).
//    Imágenes no optimizadas pueden ser la causa principal de lentitud en la carga de la página.
// 3. No habilitar la compresión Gzip/Brotli en el servidor.
//    Los archivos se envían sin comprimir, lo que consume mucho más ancho de banda.
// 4. No configurar encabezados de caché para archivos estáticos.
//    Los navegadores descargarán los mismos archivos repetidamente en cada visita, incluso si no han cambiado.
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Optimización y Rendimiento',
    'topic': 'Profiling y Monitoreo',
    'subtopic': 'Uso de herramientas de profiling',
    'definition': r'''
Las herramientas de profiling son tus mejores amigas cuando necesitas entender exactamente dónde y por qué tu aplicación está siendo lenta o consumiendo demasiados recursos. Pensemos por un momento en esto como tener un médico especializado que puede escanear tu aplicación y decirte con precisión qué órganos (partes de tu código) no están funcionando bien.

¿Te estás preguntando por qué esto importa? Porque muchas veces, cuando una aplicación es lenta, la causa no es obvia. Puede ser una consulta a la base de datos que tarda demasiado, un bucle ineficiente que consume CPU, demasiadas asignaciones de memoria que provocan recolecciones de basura frecuentes, o un problema de concurrencia. Sin un profiler, estarías adivinando y perdiendo mucho tiempo. Un profiler te da datos concretos y visuales que te permiten ir directo al problema, optimizando tu tiempo y esfuerzo.

En .NET, existen varias herramientas de profiling, tanto integradas como de terceros, que te permiten analizar diferentes aspectos del rendimiento:

1.  **Profiler de CPU (CPU Profiling):**
    * **¿Qué analiza?** Mide cuánto tiempo se gasta en cada método o función de tu código. Identifica los "hot spots" o cuellos de botella donde la CPU está trabajando más.
    * **¿Cuándo usarlo?** Cuando tu aplicación parece estar congelada o lenta y sospechas que hay un cálculo intensivo o un bucle ineficiente.
    * **Herramientas en .NET:**
        * **Visual Studio Diagnostic Tools (Profiler):** Integrado en Visual Studio, te permite adjuntar el profiler a tu proceso en ejecución y analizar el uso de CPU.
        * **dotTrace (JetBrains):** Una herramienta de profiling de CPU y memoria muy potente y popular.
        * **PerfView (Microsoft):** Una herramienta de bajo nivel pero muy potente para analizar eventos ETW (Event Tracing for Windows), útil para análisis muy detallados de CPU, I/O y más.

2.  **Profiler de Memoria (Memory Profiling):**
    * **¿Qué analiza?** Rastrea las asignaciones de memoria, identifica fugas de memoria (objetos que no se liberan y que siguen consumiendo RAM), y detecta objetos grandes que están usando demasiada memoria. También te ayuda a entender el impacto de la recolección de basura (Garbage Collection - GC).
    * **¿Cuándo usarlo?** Cuando tu aplicación consume mucha RAM o experimenta pausas inexplicables (que podrían ser el GC trabajando intensamente).
    * **Herramientas en .NET:**
        * **Visual Studio Diagnostic Tools (Memory Usage):** También integrado en Visual Studio.
        * **dotMemory (JetBrains):** El complemento de dotTrace para profiling de memoria.
        * **PerfView:** También útil para análisis de GC.

3.  **Profiler de Base de Datos / I/O:**
    * **¿Qué analiza?** Mide el tiempo que tardan las operaciones de entrada/salida, especialmente las consultas a la base de datos. Identifica consultas lentas, demasiadas consultas (problema N+1), y el impacto de la latencia de disco.
    * **¿Cuándo usarlo?** Cuando la aplicación es lenta y sospechas que la base de datos es el cuello de botella.
    * **Herramientas en .NET/SQL:**
        * **SQL Server Profiler / Extended Events (SQL Server):** Herramientas específicas para monitorear y analizar el rendimiento de SQL Server.
        * **EF Core Logging:** Configurando el logging en Entity Framework Core, puedes ver las consultas SQL generadas y sus tiempos.
        * **APM (Application Performance Management) Tools:** Herramientas como Application Insights (Azure), New Relic, Dynatrace, que integran profiling de DB.

**Cómo usar un profiler:**

* **Identifica el escenario:** ¿Qué acción específica quieres perfilar? Un inicio de sesión, una búsqueda, una carga de página compleja.
* **Ejecuta el profiler:** Inicia tu aplicación y el profiler, y luego realiza la acción que quieres analizar.
* **Analiza los resultados:** Busca los "hot paths" (rutas de código más lentas), objetos que consumen mucha memoria, o consultas de DB ineficientes.
* **Optimiza y repite:** Aplica tus optimizaciones y vuelve a perfilar para verificar que el problema se haya resuelto y no hayas introducido nuevos cuellos de botella.

Los profilers son herramientas poderosas que transforman la optimización de "adivinanzas" en una ciencia basada en datos.
''',
    'code_example': r'''
// Ejemplo conceptual: Cómo instrumentar tu código para ayudar al profiling
// Las herramientas de profiling como Visual Studio Profiler, dotTrace, etc., se adjuntan a tu proceso
// y no requieren cambios directos en el código para la mayoría de los análisis básicos.
// Sin embargo, puedes añadir marcas o usar librerías de tracing para mejorar la visibilidad.

using System;
using System.Diagnostics; // Para Stopwatch y Trace/Debug
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace ProfilingDemo
{
    public class Program
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("--- Demostración Conceptual de Profiling ---");
            Console.WriteLine("Ejecuta esta aplicación y adjunta un profiler (ej. Visual Studio Diagnostic Tools).");
            Console.WriteLine("Observa el uso de CPU y memoria mientras se ejecutan las operaciones.");

            SimulateCpuIntensiveOperation(5);
            SimulateMemoryLeak(2);
            SimulateDbOperation(); // Esto se vería en un profiler de DB o logs de EF

            Console.WriteLine("\nDemostración finalizada. Presiona cualquier tecla para salir.");
            Console.ReadKey();
        }

        /// <summary>
        /// Simula una operación intensiva en CPU.
        /// Un profiler de CPU mostrará que esta función consume mucho tiempo.
        /// </summary>
        public static void SimulateCpuIntensiveOperation(int iterations)
        {
            Console.WriteLine($"\nIniciando operación intensiva de CPU (Fibonacci: {iterations} iteraciones)...");
            Stopwatch sw = Stopwatch.StartNew();

            for (int i = 0; i < iterations; i++)
            {
                long result = CalculateFibonacci(40); // Un número suficientemente grande para ser lento
                Console.WriteLine($"  Calculando Fibonacci({40}) = {result}");
            }

            sw.Stop();
            Console.WriteLine($"Operación CPU terminada en {sw.ElapsedMilliseconds} ms.");

            // Puedes usar TraceSource para marcar puntos de interés para algunos profilers
            Trace.WriteLine("SimulateCpuIntensiveOperation completed.");
        }

        // Función recursiva que es computacionalmente costosa
        private static long CalculateFibonacci(int n)
        {
            if (n <= 1) return n;
            return CalculateFibonacci(n - 1) + CalculateFibonacci(n - 2);
        }

        /// <summary>
        /// Simula una posible fuga de memoria o un alto consumo.
        /// Un profiler de memoria mostrará el aumento del consumo de RAM y las asignaciones de objetos.
        /// </summary>
        public static void SimulateMemoryLeak(int allocations)
        {
            Console.WriteLine($"\nIniciando simulación de consumo de memoria ({allocations} bloques de 10MB)...");
            List<byte[]> memoryHogs = new List<byte[]>();
            Random rand = new Random();

            for (int i = 0; i < allocations; i++)
            {
                byte[] largeArray = new byte[10 * 1024 * 1024]; // 10 MB
                rand.NextBytes(largeArray); // Llenar con datos aleatorios
                memoryHogs.Add(largeArray); // Añadir a la lista para que no sean recolectados por el GC inmediatamente
                Console.WriteLine($"  Asignado {i + 1}0 MB de memoria.");
                Thread.Sleep(100); // Pequeña pausa para observar el incremento en el profiler
            }

            // En un profiler, verías estos objetos como "vivientes" o retenidos.
            // Si no se limpiaran, sería una fuga. Aquí se mantienen a propósito.
            Console.WriteLine($"Consumo de memoria simulado terminado. Total asignado: {allocations * 10} MB.");

            // Para que no se optimice la lista si no se usa después.
            GC.Collect(); // Forzar una recolección de basura para ver el impacto
            GC.WaitForPendingFinalizers();
            Console.WriteLine("GC.Collect() ejecutado.");
        }

        /// <summary>
        /// Simula una operación de base de datos.
        /// Un profiler de base de datos o el logging de EF mostrarían la consulta y su tiempo.
        /// </summary>
        public static async Task SimulateDbOperation()
        {
            Console.WriteLine("\nSimulando operación de base de datos lenta...");
            Stopwatch sw = Stopwatch.StartNew();

            // En una aplicación real, aquí usarías Entity Framework, ADO.NET, etc.
            // Para la demostración, simplemente simulamos el retraso.
            await Task.Delay(2500); // Simula una consulta a DB que tarda 2.5 segundos

            sw.Stop();
            Console.WriteLine($"Operación de DB simulada terminada en {sw.ElapsedMilliseconds} ms.");
        }
    }

    // Ejemplo incorrecto de "profiling":
    // 1. Usar solo `Stopwatch` en cada método: Te da tiempos, pero no la "ruta caliente" completa
    //    o el consumo de memoria detallado. No es un sustituto de un profiler real.
    // 2. Intentar optimizar "a ciegas": Cambiar código sin datos de profiling que justifiquen el cambio.
    //    Esto puede introducir nuevos errores o no mejorar el rendimiento en absoluto.
    // 3. Perfilar solo en el entorno de desarrollo: El rendimiento en desarrollo no es igual que en producción.
    //    Siempre perfila en un entorno que se parezca lo más posible a la producción.
}
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Optimización y Rendimiento',
    'topic': 'Profiling y Monitoreo',
    'subtopic': 'Monitoreo de aplicaciones en producción',
    'definition': r'''
Monitorear aplicaciones en producción es como tener un panel de control en un avión, donde puedes ver en tiempo real cómo está funcionando todo: la altitud, la velocidad, el nivel de combustible, si hay alguna advertencia. Es crucial para asegurar que tu aplicación esté siempre operativa, rindiendo al máximo y para detectar problemas antes de que afecten a los usuarios.

¿Te estás preguntando por qué esto importa? Porque una aplicación que funciona perfectamente en tu máquina de desarrollo puede comportarse de manera muy diferente en producción debido a la carga de usuarios, las interacciones con sistemas externos, el hardware y la red. Sin un monitoreo constante, te enterarías de los problemas solo cuando los usuarios empiezan a quejarse (o peor, cuando ya se han ido). Monitorear te permite identificar cuellos de botella, errores, anomalías de seguridad y problemas de escalabilidad proactivamente. Es la primera línea de defensa para mantener tu aplicación saludable y a tus usuarios contentos.

El monitoreo de aplicaciones en producción se basa en la recopilación y análisis de varios tipos de datos:

1.  **Métricas de Rendimiento (Performance Metrics):**
    * **¿Qué son?** Datos cuantitativos sobre el comportamiento de tu aplicación.
    * **Ejemplos:**
        * **Uso de CPU y Memoria:** Muestra si el servidor está sobrecargado o si hay fugas de memoria.
        * **Latencia de Solicitudes:** El tiempo que tarda tu aplicación en responder a una solicitud HTTP.
        * **Tasas de Error:** El porcentaje de solicitudes que resultan en errores.
        * **Conexiones a Base de Datos:** Número de conexiones abiertas o tiempo de ejecución de consultas.
        * **Rendimiento de E/S (Input/Output):** Velocidad de lectura/escritura en disco o red.
    * **Herramientas en .NET:**
        * **Application Insights (Azure):** Una suite de APM (Application Performance Management) muy completa de Microsoft que integra métricas, logs, trazas y monitoreo de disponibilidad.
        * **Prometheus + Grafana:** Solución popular de código abierto para recopilación de métricas y visualización.
        * **New Relic, Dynatrace, Datadog:** Plataformas de APM de terceros con capacidades avanzadas.

2.  **Registro de Logs (Logging):**
    * **¿Qué es?** Mensajes estructurados generados por tu aplicación que registran eventos importantes (errores, advertencias, información, depuración).
    * **¿Por qué es crucial?** Los logs son la "caja negra" de tu aplicación. Cuando ocurre un error, los logs te dan el contexto exacto (quién, qué, cuándo, dónde) para diagnosticar y solucionar el problema.
    * **Herramientas en .NET:**
        * **Serilog, NLog, log4net:** Librerías populares para registrar logs en .NET.
        * **ELK Stack (Elasticsearch, Logstash, Kibana):** Solución robusta para centralizar, buscar y visualizar logs.
        * **Azure Log Analytics / AWS CloudWatch Logs:** Servicios en la nube para ingesta y análisis de logs.

3.  **Monitoreo de Disponibilidad y Experiencia del Usuario (Uptime & User Experience Monitoring):**
    * **¿Qué es?** Verificar que tu aplicación esté funcionando y sea accesible desde diferentes ubicaciones geográficas, y medir cómo los usuarios reales experimentan la aplicación.
    * **Ejemplos:**
        * **Ping/HTTP Checks:** Verifican si el endpoint está respondiendo.
        * **Transacciones Sintéticas:** Simulan una ruta crítica del usuario (ej. login, añadir al carrito) para detectar problemas.
        * **Monitoreo de Usuarios Reales (RUM - Real User Monitoring):** Recopila datos de rendimiento directamente del navegador de tus usuarios.
    * **Herramientas:** Azure Application Insights, Pingdom, UptimeRobot, Google Analytics (para métricas web).

4.  **Alertas y Notificaciones:**
    * **¿Qué es?** Configurar umbrales para las métricas y los logs, de modo que cuando se superen o se detecten errores críticos, se te notifique (por email, SMS, Slack, etc.).
    * **Beneficio:** Te permite responder rápidamente a los problemas, a menudo antes de que los usuarios se den cuenta.

Implementar un buen sistema de monitoreo en producción te dará tranquilidad, mejorará el rendimiento y la fiabilidad de tu aplicación, y te permitirá tomar decisiones basadas en datos.
''',
    'code_example': r'''
// Ejemplo conceptual de Monitoreo de Aplicaciones en Producción en ASP.NET Core
// Esto implica configurar servicios de logging y métricas.

using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging; // Para logging integrado de .NET Core
using Serilog; // Ejemplo de librería de logging de terceros
using Serilog.Events;
using System;
using Prometheus; // Para métricas con Prometheus .NET client
using System.Diagnostics; // Para el nuevo .NET Diagnostics API

namespace MonitoringDemo
{
    public class Program
    {
        public static void Main(string[] args)
        {
            // --- Configuración de Serilog (Logging) ---
            // Configurar Serilog para escribir en la consola, debug, y un archivo (para producción, usar un sink a un sistema de logs centralizado)
            Log.Logger = new LoggerConfiguration()
                .MinimumLevel.Debug()
                .MinimumLevel.Override("Microsoft", LogEventLevel.Warning) // Reducir ruido de logs de Microsoft
                .Enrich.FromLogContext()
                .WriteTo.Console()
                .WriteTo.File("logs/app-log-.txt", rollingInterval: RollingInterval.Day)
                // Para producción:
                // .WriteTo.Seq("http://localhost:5341") // Ejemplo de un colector de logs centralizado
                // .WriteTo.ApplicationInsights(telemetryConfiguration, TelemetryConverter.Events)
                .CreateLogger();

            try
            {
                Log.Information("Iniciando host web.");
                CreateHostBuilder(args).Build().Run();
            }
            catch (Exception ex)
            {
                Log.Fatal(ex, "El host ha terminado inesperadamente.");
            }
            finally
            {
                Log.CloseAndFlush();
            }
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .UseSerilog() // Usa Serilog para el logging de la aplicación
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder.UseStartup<Startup>();
                });
    }

    public class Startup
    {
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllersWithViews();
            services.AddSingleton<MetricsService>(); // Registra el servicio de métricas

            // --- Configuración de Monitoreo con Application Insights (Azure) ---
            // services.AddApplicationInsightsTelemetry(); // Añade telemetría para Application Insights
            // services.AddApplicationInsightsTelemetryWorkerService(); // Si es para background services
        }

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, ILogger<Startup> logger)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseStaticFiles();

            // --- 2. Middleware de Métricas (Prometheus) ---
            // Expone el endpoint /metrics para que Prometheus lo scrape
            app.UseMetricServer();
            // Colecciona métricas del Request Duration, Request Count, etc.
            app.UseHttpMetrics();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}");
                // Mapa para las métricas si no usas UseMetricServer()
                // endpoints.MapMetrics();
            });

            logger.LogInformation("Aplicación configurada y lista.");
        }
    }

    // --- 3. Generación de Métricas Personalizadas (ej. con Prometheus client) ---
    // Instalar el paquete NuGet: Prometheus.DotNetRuntime
    // Instalar el paquete NuGet: App.Metrics.AspNetCore.Mvc (si usas AppMetrics)

    public class MetricsService // Un servicio que genera métricas
    {
        private readonly Counter _processedItemsCounter;
        private readonly Gauge _currentUsersGauge;

        public MetricsService()
        {
            // Definir un contador para elementos procesados
            _processedItemsCounter = Metrics.CreateCounter("processed_items_total", "Total de ítems procesados.");
            // Definir un gauge para usuarios concurrentes (valor que puede subir y bajar)
            _currentUsersGauge = Metrics.CreateGauge("current_users", "Número actual de usuarios logueados.");
        }

        public void IncrementProcessedItems()
        {
            _processedItemsCounter.Inc();
            Console.WriteLine($"[Metrics] Ítem procesado. Total: {_processedItemsCounter.Value}");
        }

        public void SetCurrentUserCount(int count)
        {
            _currentUsersGauge.Set(count);
            Console.WriteLine($"[Metrics] Usuarios concurrentes: {_currentUsersGauge.Value}");
        }
    }

    // --- En un controlador (ej. HomeController.cs) ---
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly MetricsService _metricsService;

        public HomeController(ILogger<HomeController> logger, MetricsService metricsService)
        {
            _logger = logger;
            _metricsService = metricsService;
        }

        public IActionResult Index()
        {
            _logger.LogInformation("Visita a la página de inicio.");
            _metricsService.IncrementProcessedItems(); // Incrementa una métrica
            _metricsService.SetCurrentUserCount(new Random().Next(1, 100)); // Actualiza un gauge
            return View();
        }

        public IActionResult Privacy()
        {
            try
            {
                throw new InvalidOperationException("Esto es un error de prueba para los logs.");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Se encontró un error al acceder a la página de privacidad.");
            }
            return View();
        }
    }

    // Ejemplo incorrecto de monitoreo:
    // 1. Confiar solo en los logs para identificar problemas de rendimiento.
    //    Los logs son buenos para errores, pero las métricas son mejores para el rendimiento.
    // 2. No tener alertas configuradas.
    //    Si tienes métricas y logs pero nadie los mira activamente, de poco sirven.
    // 3. Monitorear solo la CPU y la memoria.
    //    Ignorar métricas de base de datos, latencia de red, colas de mensajes, etc., puede llevar a puntos ciegos.
    // 4. Registrar información sensible en logs (ej. contraseñas, PII).
    //    Esto crea una brecha de seguridad en tus logs.
}
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Mid',
    'level': 4,
    'title_level': 'Optimización y Rendimiento',
    'topic': 'Profiling y Monitoreo',
    'subtopic': 'Análisis de logs y métricas',
    'definition': r'''
Analizar logs y métricas es el arte de extraer información valiosa del "ruido" de datos que tu aplicación genera, convirtiendo esos datos en conocimiento accionable para mejorar y mantener tu sistema. Pensemos por un momento en esto como ser un detective que busca pistas en una escena del crimen: no solo buscas una evidencia obvia, sino que conectas puntos, analizas patrones y entiendes el contexto para llegar a una conclusión.

¿Te estás preguntando por qué esto importa? Porque solo recopilar logs y métricas no es suficiente; si no los analizas, es como tener un montón de cámaras de seguridad grabando sin que nadie vea las grabaciones. El análisis te permite identificar rápidamente la causa raíz de un problema (un error, una degradación del rendimiento), predecir tendencias, entender el comportamiento del usuario y tomar decisiones informadas para optimizar tu aplicación. Es la clave para pasar de la "reacción" a la "proactividad" en la gestión de tu sistema.

Aquí te explico cómo abordar el análisis de logs y métricas:

**1. Análisis de Logs:**
Los logs son registros de eventos que ocurren en tu aplicación. Contienen información sobre lo que sucede, cuándo sucede y, a menudo, por qué.

* **Centralización de Logs:** Es el primer paso. En lugar de tener logs dispersos en múltiples servidores, usa una solución centralizada (como ELK Stack, Splunk, Azure Log Analytics, Datadog) para agregarlos. Esto facilita la búsqueda y el análisis.
* **Tipos de Logs:**
    * **Errores (Error Logs):** Los más críticos. Busque excepciones, fallos de conexión, errores de validación. Analice la frecuencia, el mensaje de error, la pila de llamadas (stack trace) y el contexto (usuario, entrada).
    * **Advertencias (Warning Logs):** Indican situaciones problemáticas que no son errores críticos pero podrían llevar a ellos. Ej: recursos casi agotados, configuraciones subóptimas.
    * **Información (Informational Logs):** Registran eventos importantes de la aplicación (inicio de sesión, operaciones exitosas, etc.). Útiles para auditoría y seguimiento del flujo.
    * **Depuración/Traza (Debug/Trace Logs):** Muy detallados, usados durante el desarrollo o para diagnóstico profundo en producción (habilitar solo temporalmente).
* **Búsqueda y Filtrado:** Utiliza las capacidades de búsqueda y filtrado de tu sistema de logs para encontrar patrones: errores que aumentan después de un despliegue, errores específicos para un usuario o módulo, etc.
* **Visualización:** Herramientas como Kibana (con ELK) o dashboards de Log Analytics te permiten visualizar tendencias de errores, distribuciones, etc.
* **Contexto:** Un buen log no solo tiene un mensaje, sino también contexto: ID de usuario, ID de transacción, parámetros de entrada. Esto es vital para depurar.

**2. Análisis de Métricas:**
Las métricas son datos numéricos que representan el estado o el rendimiento de tu sistema a lo largo del tiempo.

* **Identificación de KPIs (Key Performance Indicators):** ¿Qué métricas son más importantes para tu aplicación? Ej: tiempo de respuesta promedio, uso de CPU, tasa de éxito de requests, número de usuarios activos.
* **Visualización con Dashboards:** Usa herramientas como Grafana, Azure Dashboards, Datadog para crear paneles visuales que muestren tus métricas en tiempo real o en rangos de tiempo.
* **Tendencias y Anomalías:** Observa los patrones. ¿Hay picos en el uso de CPU a ciertas horas? ¿La latencia aumenta después de un despliegue? ¿Hay caídas inesperadas en el tráfico?
* **Correlación:** Intenta correlacionar métricas. Por ejemplo, si el uso de CPU sube, ¿también suben los errores o la latencia de las solicitudes? Esto ayuda a identificar cuellos de botella.
* **Líneas Base (Baselines):** Establece un "rendimiento normal" para tu aplicación. Las anomalías se detectan cuando las métricas se desvían significativamente de esta línea base.
* **Segmentación:** Divide las métricas por dimensiones (ej. por región geográfica, por tipo de usuario, por versión de la aplicación) para identificar problemas específicos.
* **Alertas:** Configura alertas automáticas cuando las métricas superen ciertos umbrales (ej. latencia > 500ms, tasa de errores > 5%).

La combinación de logs (para el "qué y por qué" detallado) y métricas (para el "cómo y cuánto" global) te da una visión completa de la salud y el rendimiento de tu aplicación. Es un proceso iterativo: analizas, mejoras, y luego vuelves a analizar para ver el impacto.
''',
    'code_example': r'''
// Ejemplo conceptual de cómo generar logs y métricas para su posterior análisis en ASP.NET Core.
// El análisis en sí se hace con herramientas externas (ELK, Prometheus/Grafana, Application Insights).

using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging; // Para el sistema de logging de .NET Core
using Serilog; // Ejemplo de librería de logging de terceros para flexibilidad
using Serilog.Events;
using System;
using Prometheus; // Para generar métricas para Prometheus
using System.Diagnostics; // Para ActivitySource (tracing/distribuido)
using System.Threading.Tasks;

namespace MonitoringAnalyticsDemo
{
    // --- 1. Configuración de Logging con Serilog (mejor que Console.WriteLine en producción) ---
    public class Program
    {
        public static void Main(string[] args)
        {
            Log.Logger = new LoggerConfiguration()
                .MinimumLevel.Debug() // Nivel mínimo de log para el host
                .MinimumLevel.Override("Microsoft", LogEventLevel.Warning) // Suprimir logs de Microsoft a Warning
                .Enrich.FromLogContext() // Añade propiedades del contexto de log
                .WriteTo.Console() // Escribe a la consola
                .WriteTo.File("logs/app-log-.txt", rollingInterval: RollingInterval.Day, outputTemplate: "{Timestamp:yyyy-MM-dd HH:mm:ss.fff zzz} [{Level:u3}] {Message:lj}{NewLine}{Exception}") // Archivo de log diario
                // En un entorno de producción real, configurarías un "sink" a un sistema de logs centralizado:
                // .WriteTo.Seq("http://localhost:5341") // Ejemplo para Seq
                // .WriteTo.Elasticsearch(...) // Ejemplo para Elasticsearch (ELK Stack)
                // .WriteTo.AzureApplicationInsights(...) // Ejemplo para Application Insights
                .CreateLogger();

            try
            {
                Log.Information("Iniciando aplicación para demostración de análisis de logs y métricas.");
                CreateHostBuilder(args).Build().Run();
            }
            catch (Exception ex)
            {
                Log.Fatal(ex, "La aplicación ha terminado inesperadamente.");
            }
            finally
            {
                Log.CloseAndFlush();
            }
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .UseSerilog() // Integra Serilog como el proveedor de logging por defecto
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder.UseStartup<Startup>();
                });
    }

    public class Startup
    {
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllersWithViews();
            services.AddSingleton<CustomMetrics>(); // Servicio para métricas personalizadas
        }

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, ILogger<Startup> logger)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseStaticFiles();

            // --- 2. Configuración de Métricas con Prometheus .NET client ---
            app.UseMetricServer(); // Expone un endpoint /metrics para que Prometheus lo scrape
            app.UseHttpMetrics(); // Colecciona métricas HTTP Request duration y count

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}");
            });

            logger.LogInformation("Middleware de la aplicación configurado.");
        }
    }

    // --- 3. Un servicio para generar métricas personalizadas ---
    public class CustomMetrics
    {
        private static readonly Counter _itemsProcessedCounter =
            Metrics.CreateCounter("app_items_processed_total", "Total number of items processed by the application.");
        private static readonly Gauge _activeUsersGauge =
            Metrics.CreateGauge("app_active_users", "Current number of active users.");
        private static readonly Histogram _processingDurationSeconds =
            Metrics.CreateHistogram("app_processing_duration_seconds", "Histogram of processing durations.");

        public void IncrementProcessedItems() => _itemsProcessedCounter.Inc();
        public void SetActiveUsers(int count) => _activeUsersGauge.Set(count);
        public void ObserveProcessingDuration(double durationSeconds) => _processingDurationSeconds.Observe(durationSeconds);
    }

    // --- 4. Usando Logs y Métricas en un Controlador de Ejemplo ---
    public class ReportController : Controller
    {
        private readonly ILogger<ReportController> _logger;
        private readonly CustomMetrics _metrics;
        private static readonly ActivitySource _activitySource = new ActivitySource("ReportService"); // Para tracing distribuido

        public ReportController(ILogger<ReportController> logger, CustomMetrics metrics)
        {
            _logger = logger;
            _metrics = metrics;
        }

        public async Task<IActionResult> GenerateReport(int reportId)
        {
            // Usando ActivitySource para tracing distribuido (OpenTelemetry)
            using (var activity = _activitySource.StartActivity("GenerateReportOperation"))
            {
                activity?.SetTag("report.id", reportId);

                _logger.LogInformation("Generando reporte {ReportId} para el usuario {UserName}", reportId, User.Identity?.Name ?? "Anónimo");
                _metrics.IncrementProcessedItems();

                Stopwatch sw = Stopwatch.StartNew();
                try
                {
                    // Simular una operación compleja o que falla a veces
                    if (reportId % 2 == 0)
                    {
                        await Task.Delay(new Random().Next(100, 500)); // Simula un procesamiento
                        _logger.LogDebug("Reporte {ReportId} generado exitosamente.", reportId);
                        _metrics.ObserveProcessingDuration(sw.Elapsed.TotalSeconds);
                        return Ok($"Reporte {reportId} generado.");
                    }
                    else
                    {
                        await Task.Delay(new Random().Next(500, 1500)); // Simula un procesamiento más largo
                        throw new InvalidOperationException($"Fallo al generar el reporte {reportId} debido a un error interno.");
                    }
                }
                catch (Exception ex)
                {
                    _logger.LogError(ex, "Error al generar reporte {ReportId}", reportId);
                    activity?.SetStatus(ActivityStatusCode.Error, ex.Message);
                    _metrics.ObserveProcessingDuration(sw.Elapsed.TotalSeconds); // Registrar duración incluso si falla
                    return StatusCode(500, $"Error al generar reporte {reportId}.");
                }
            }
        }

        public IActionResult ActiveUsers(int count)
        {
            _metrics.SetActiveUsers(count);
            _logger.LogInformation("Número de usuarios activos actualizado a {UserCount}.", count);
            return Ok($"Usuarios activos: {count}");
        }
    }

    // Ejemplo incorrecto de análisis:
    // 1. Ignorar warnings en los logs. A veces son precursores de errores mayores.
    // 2. Solo mirar los logs cuando algo se rompe. El monitoreo proactivo busca anomalías en las métricas antes de que sean errores.
    // 3. No establecer líneas base para las métricas. Sin un "normal", es difícil saber cuándo algo es "anormal".
    // 4. No correlacionar logs con métricas. Un pico en la latencia (métrica) debería ser explicable por eventos en los logs (ej. errores de DB).
    // 5. No tener un sistema de centralización de logs. Intentar buscar en archivos de log individuales es una pesadilla.
    // 6. Almacenar logs indefinidamente sin un plan de retención, ocupando espacio y dificultando la búsqueda.
'''
  });
}

Future<void> insertPuntonetMidLevel5Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Desarrollo Asíncrono y Paralelo',
    'topic': 'Programación Asíncrona',
    'subtopic': 'Uso de async y await',
    'definition': r'''
El uso de `async` y `await` en C# es una forma elegante y poderosa de escribir código asíncrono, lo que permite que tu aplicación realice operaciones que toman tiempo (como acceder a la red o a la base de datos) sin bloquear la interfaz de usuario o el hilo principal de ejecución. Pensemos por un momento en esto como pedir una pizza: no te quedas parado en la pizzería esperando a que la hagan; en su lugar, la pides, sigues con tus cosas, y cuando la pizza está lista, te avisan para que la recojas.

¿Te estás preguntando por qué esto importa? Porque las aplicaciones modernas, especialmente las que interactúan con la web, bases de datos o sistemas de archivos, pasan gran parte de su tiempo esperando que estas operaciones externas se completen. Si realizas estas operaciones de forma síncrona (esperando pasivamente), tu aplicación se "congela" y no responde, lo que frustra a los usuarios. En el caso de servidores web, bloquear el hilo de ejecución significa que el servidor no puede atender a otras solicitudes de usuarios, lo que degrada el rendimiento general. `async` y `await` resuelven este problema, permitiendo que tu aplicación permanezca responsiva y escalable.

Vamos a ver de qué se trata todo esto:

* **`async` (El Marcador):**
    * La palabra clave `async` se usa para marcar un método. No cambia cómo el método se ejecuta fundamentalmente, sino que le indica al compilador que este método *puede* contener una o más expresiones `await`.
    * Un método `async` siempre devuelve un `Task`, `Task<TResult>` o `void` (evita `void` para eventos, ya que los errores no pueden ser atrapados fácilmente).
    * Cuando un método es `async`, significa que es capaz de pausar su ejecución en un punto `await` y reanudarla más tarde, sin bloquear el hilo.

* **`await` (El Esperador Inteligente):**
    * La palabra clave `await` se usa dentro de un método `async` y solo se puede usar con una expresión que sea "esperable" (generalmente un `Task`).
    * Cuando el control llega a una expresión `await`, si la tarea a la que se está esperando no está completada, el control se devuelve al llamador del método `async`. El hilo que estaba ejecutando el método `async` queda libre para realizar otro trabajo.
    * Cuando la tarea esperada finalmente se completa, el resto del método `async` se reanuda en el mismo contexto de sincronización donde fue pausado (en aplicaciones UI, esto significa en el hilo de la UI; en aplicaciones de servidor, en un hilo del pool de hilos).

**¿Cómo funciona por debajo (muy simplificado)?**
Cuando el compilador ve `async` y `await`, reescribe tu código en una "máquina de estados". En lugar de un método lineal, crea una serie de bloques de código que se ejecutan, pausan y reanudan. Esto es lo que permite que el hilo se libere.

**Ventajas clave:**

* **Responsividad:** Las aplicaciones de escritorio o móviles no se bloquean, ofreciendo una mejor experiencia de usuario.
* **Escalabilidad del Servidor:** Los servidores web pueden atender muchas más solicitudes simultáneamente, ya que los hilos no se bloquean esperando operaciones de E/S.
* **Legibilidad:** `async` y `await` hacen que el código asíncrono se parezca mucho al código síncrono, lo que lo hace mucho más fácil de leer, escribir y mantener que los enfoques antiguos como callbacks o eventos.

Es una de las características más importantes de C# moderno para construir aplicaciones de alto rendimiento.
''',
    'code_example': r'''
// Ejemplo de uso de async y await en C# para .NET

using System;
using System.Net.Http; // Para operaciones de red
using System.Threading.Tasks; // Para Task y Task<T>
using System.IO; // Para operaciones de archivo
using System.Threading; // Para Thread.Sleep (ejemplo síncrono)

namespace AsyncAwaitDemo
{
    public class Program
    {
        private static readonly HttpClient _httpClient = new HttpClient();

        public static async Task Main(string[] args)
        {
            Console.WriteLine("--- Demostración de async y await ---");

            // --- 1. Comparación con Operaciones Síncronas ---
            Console.WriteLine("\n--- Operación Síncrona (bloqueante) ---");
            Console.WriteLine("Inicio de operación síncrona...");
            DoSynchronousWork();
            Console.WriteLine("Fin de operación síncrona.");
            Console.WriteLine("Nota: El hilo principal se bloqueó durante la espera.");


            Console.WriteLine("\n--- Operación Asíncrona (no bloqueante) ---");
            Console.WriteLine("Inicio de operación asíncrona...");
            // Llamar a un método async y esperar su finalización
            await DoAsynchronousWork();
            Console.WriteLine("Fin de operación asíncrona.");
            Console.WriteLine("Nota: El hilo principal estuvo libre para hacer otras cosas durante la espera.");


            // --- 2. Ejemplo más complejo: Descargar múltiples sitios web en paralelo ---
            Console.WriteLine("\n--- Descargando múltiples sitios en paralelo ---");
            var urls = new[]
            {
                "https://www.google.com",
                "https://www.microsoft.com",
                "https://www.github.com",
                "https://www.stackoverflow.com"
            };

            var downloadTasks = new List<Task<string>>();
            foreach (var url in urls)
            {
                // Cada tarea se inicia y se ejecuta en segundo plano.
                // No usamos await aquí para que todas las descargas comiencen casi simultáneamente.
                downloadTasks.Add(DownloadWebContentAsync(url));
            }

            Console.WriteLine("Todas las descargas iniciadas. Esperando que todas terminen...");

            // await Task.WhenAll(tasks) espera a que todas las tareas en la colección se completen.
            // Si alguna falla, la excepción se lanzará cuando se haga await en WhenAll.
            string[] contents = await Task.WhenAll(downloadTasks);

            Console.WriteLine("\nContenido de sitios web descargado:");
            for (int i = 0; i < urls.Length; i++)
            {
                Console.WriteLine($"- {urls[i]}: {contents[i].Length} caracteres.");
            }


            // --- 3. Manejo de excepciones en async/await ---
            Console.WriteLine("\n--- Manejo de excepciones ---");
            try
            {
                await SimulateErrorAsync();
            }
            catch (InvalidOperationException ex)
            {
                Console.WriteLine($"Capturado el error: {ex.Message}");
            }


            Console.WriteLine("\nPresiona cualquier tecla para salir.");
            Console.ReadKey();
        }

        // Método síncrono que simula una operación larga (bloquea el hilo)
        public static void DoSynchronousWork()
        {
            Console.WriteLine("  Simulando trabajo pesado (síncrono)...");
            Thread.Sleep(2000); // Bloquea el hilo por 2 segundos
            Console.WriteLine("  Trabajo pesado síncrono completado.");
        }

        // Método asíncrono que simula una operación larga (no bloquea el hilo)
        public static async Task DoAsynchronousWork()
        {
            Console.WriteLine("  Simulando trabajo pesado (asíncrono)...");
            // Task.Delay es la versión asíncrona de Thread.Sleep
            // No bloquea el hilo; en su lugar, devuelve el control al llamador.
            await Task.Delay(2000);
            Console.WriteLine("  Trabajo pesado asíncrono completado.");
        }

        // Método asíncrono que descarga contenido web
        public static async Task<string> DownloadWebContentAsync(string url)
        {
            Console.WriteLine($"  Iniciando descarga de: {url}");
            string content = await _httpClient.GetStringAsync(url);
            Console.WriteLine($"  Descarga de {url} completada.");
            return content;
        }

        // Método asíncrono que simula un error
        public static async Task SimulateErrorAsync()
        {
            Console.WriteLine("  Simulando una operación que fallará...");
            await Task.Delay(500); // Simula algo de trabajo antes del error
            throw new InvalidOperationException("¡Algo salió mal en la operación asíncrona!");
        }
    }

    // Ejemplo incorrecto:
    // 1. "Async void" en métodos que no son controladores de eventos:
    //    public async void MyAsyncMethod() { /* ... */ } // BAD: Excepciones en estos métodos son difíciles de atrapar.
    //    Siempre usa `Task` o `Task<T>` como tipo de retorno para métodos `async` que no son controladores de eventos.
    // 2. Bloquear el hilo en un método async (`.Result` o `.Wait()`):
    //    public async Task GetSomeDataAndBlock()
    //    {
    //        var task = GetDataFromApiAsync();
    //        var data = task.Result; // BAD: Esto bloquea el hilo actual hasta que la tarea termine, anulando el propósito de async/await.
    //    }
    //    En su lugar, siempre usa `await` para esperar el resultado de una `Task`.
    // 3. Olvidar el `await` en una `Task` en un método `async`:
    //    public async Task DoWork()
    //    {
    //        GetDataFromApiAsync(); // BAD: La tarea se inicia pero el método no espera su finalización, lo que puede llevar a problemas de carrera o datos incompletos.
    //        // ... código que depende del resultado de GetDataFromApiAsync() que aún no está listo ...
    //    }
    '''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Desarrollo Asíncrono y Paralelo',
    'topic': 'Programación Asíncrona',
    'subtopic': 'Manejo de tareas y cancelación',
    'definition': r'''
Manejar tareas y, en particular, la cancelación en programación asíncrona es fundamental para crear aplicaciones robustas y eficientes. Pensemos por un momento en esto como dirigir una orquesta: no solo le dices a cada músico cuándo empezar a tocar, sino que también puedes indicarles cuándo parar si la pieza musical cambia o si hay una emergencia.

¿Te estás preguntando por qué esto importa? Porque las operaciones asíncronas, como descargas de archivos grandes, consultas a bases de datos remotas o cálculos complejos, pueden tardar mucho tiempo en completarse. Si el usuario decide cerrar la aplicación, cancelar una operación o si la red se cae, no querrás que esa tarea siga consumiendo recursos innecesariamente. Sin un manejo adecuado de tareas y cancelación, tu aplicación podría sufrir de fugas de recursos, bloqueos o simplemente una mala experiencia de usuario. Es clave para el buen comportamiento de tu software.

Vamos a ver de qué se trata todo esto:

1.  **¿Qué es una `Task`?**
    * En C#, `Task` y `Task<TResult>` son los objetos centrales para representar operaciones asíncronas.
    * Una `Task` representa una operación que aún no ha terminado, pero que se espera que lo haga en algún momento futuro. Es una promesa de un resultado o la finalización de una acción.
    * `Task` es para operaciones que no devuelven un valor (similar a un método `void`).
    * `Task<TResult>` es para operaciones que devolverán un valor de tipo `TResult` cuando se completen.

2.  **Estados de una `Task`:**
    * `Created`: La tarea ha sido inicializada pero no ha comenzado a ejecutarse.
    * `WaitingForActivation`: Esperando ser programada en un `TaskScheduler`.
    * `Running`: La tarea está ejecutándose.
    * `WaitingForChildrenToComplete`: La tarea está esperando a que sus tareas "hijas" terminen.
    * `Canceled`: La tarea fue cancelada antes o durante su ejecución.
    * `Faulted`: La tarea terminó debido a una excepción no controlada.
    * `RanToCompletion`: La tarea se completó exitosamente.

3.  **Encadenamiento y Combinación de Tareas:**
    * Puedes encadenar tareas usando `await` sucesivamente.
    * `Task.WhenAll()`: Espera a que un conjunto de tareas se complete. Muy útil para ejecutar varias operaciones asíncronas en paralelo y esperar a que todas terminen.
    * `Task.WhenAny()`: Espera a que cualquiera de un conjunto de tareas se complete. Útil si solo necesitas el resultado de la primera tarea que termine.

4.  **Manejo de la Cancelación:**
    * La cancelación en C# se gestiona mediante el patrón `CancellationToken` y `CancellationTokenSource`.
    * **`CancellationTokenSource`:** Es el objeto que emite la señal de cancelación. Cuando llamas a su método `Cancel()`, notifica a todos los `CancellationToken` asociados.
    * **`CancellationToken`:** Es la estructura que se pasa a los métodos asíncronos para que puedan monitorear si se ha solicitado la cancelación. Los métodos que soportan cancelación (ej. operaciones de E/S, operaciones de red, tus propios métodos largos) aceptan un `CancellationToken` como parámetro.
    * **Reacción a la Cancelación:** Dentro del método que acepta el `CancellationToken`, puedes:
        * Llamar a `token.ThrowIfCancellationRequested()`: Lanza una `OperationCanceledException` si la cancelación fue solicitada.
        * Verificar `token.IsCancellationRequested`: Si es `true`, puedes salir del método de forma limpia.
    * **Beneficio:** Permite que las operaciones de larga duración se detengan de forma elegante y liberen recursos, mejorando la estabilidad y capacidad de respuesta de tu aplicación.

Dominar el manejo de tareas y la cancelación es crucial para escribir aplicaciones asíncronas eficientes y que respondan bien a las interacciones del usuario y a los cambios de estado.
''',
    'code_example': r'''
// Ejemplo de Manejo de Tareas y Cancelación en C# con async/await

using System;
using System.Threading;
using System.Threading.Tasks;
using System.Net.Http; // Para operaciones de red
using System.Linq;
using System.Collections.Generic;

namespace TaskCancellationDemo
{
    public class Program
    {
        private static readonly HttpClient _httpClient = new HttpClient();

        public static async Task Main(string[] args)
        {
            Console.WriteLine("--- Demostración de Manejo de Tareas y Cancelación ---");

            // --- 1. Ejemplo de Cancelación Básica ---
            Console.WriteLine("\n--- Cancelación de una Tarea Larga ---");
            using (CancellationTokenSource cts = new CancellationTokenSource())
            {
                Task longRunningTask = PerformLongRunningOperation(5000, cts.Token); // Operación de 5 segundos

                Console.WriteLine("Iniciando operación larga. Presiona 'c' para cancelar...");

                // Iniciar una tarea separada para escuchar la entrada del usuario
                Task.Run(() =>
                {
                    if (Console.ReadKey().KeyChar == 'c')
                    {
                        Console.WriteLine("\n¡Solicitud de cancelación recibida!");
                        cts.Cancel(); // Enviar la señal de cancelación
                    }
                });

                try
                {
                    await longRunningTask; // Esperar a que la tarea termine o se cancele
                    Console.WriteLine("Operación larga completada.");
                }
                catch (OperationCanceledException)
                {
                    Console.WriteLine("Operación larga CANCELADA.");
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Operación larga falló con un error: {ex.Message}");
                }
            }


            // --- 2. Esperar múltiples tareas con Task.WhenAll ---
            Console.WriteLine("\n--- Esperando múltiples Tareas (WhenAll) ---");
            List<string> urls = new List<string>
            {
                "https://www.example.com",
                "https://www.google.com/nonexistent", // Simular un error para WhenAll
                "https://www.bing.com"
            };

            List<Task<string>> downloadTasks = urls.Select(url => DownloadPageContentAsync(url)).ToList();

            try
            {
                // Task.WhenAll espera que todas las tareas terminen. Si una falla, lanza una AggregateException
                // (o la primera excepción si la capturas directamente con await fuera de un try-catch anidado).
                string[] results = await Task.WhenAll(downloadTasks);
                Console.WriteLine("\nTodas las páginas descargadas exitosamente:");
                foreach (string content in results)
                {
                    Console.WriteLine($"- Contenido de {content.Length} caracteres.");
                }
            }
            catch (AggregateException ae)
            {
                Console.WriteLine("\nUna o más descargas fallaron:");
                foreach (var innerEx in ae.InnerExceptions)
                {
                    Console.WriteLine($"- Error: {innerEx.GetType().Name}: {innerEx.Message}");
                }
            }


            // --- 3. Esperar a la primera tarea con Task.WhenAny ---
            Console.WriteLine("\n--- Esperando la primera Tarea (WhenAny) ---");
            Task<int> task1 = Task.Run(async () => { await Task.Delay(2000); Console.WriteLine("Tarea 1 completada."); return 1; });
            Task<int> task2 = Task.Run(async () => { await Task.Delay(500); Console.WriteLine("Tarea 2 completada."); return 2; });
            Task<int> task3 = Task.Run(async () => { await Task.Delay(1500); Console.WriteLine("Tarea 3 completada."); return 3; });

            Task<int> firstCompletedTask = await Task.WhenAny(task1, task2, task3);
            Console.WriteLine($"La primera tarea en completarse devolvió: {await firstCompletedTask}");


            Console.WriteLine("\nDemostración finalizada. Presiona cualquier tecla para salir.");
            Console.ReadKey();
        }

        /// <summary>
        /// Simula una operación de larga duración que puede ser cancelada.
        /// </summary>
        public static async Task PerformLongRunningOperation(int durationMs, CancellationToken cancellationToken)
        {
            Console.WriteLine("  Operación larga: Comenzando...");
            for (int i = 0; i < durationMs / 100; i++)
            {
                // En cada iteración, verifica si se ha solicitado la cancelación.
                // ThrowIfCancellationRequested() lanzará OperationCanceledException si se cancela.
                cancellationToken.ThrowIfCancellationRequested();
                Console.WriteLine($"  Operación larga: {i * 100}ms completados.");
                await Task.Delay(100); // Pequeña pausa para simular trabajo
            }
            Console.WriteLine("  Operación larga: Finalizada sin interrupción.");
        }

        /// <summary>
        /// Descarga contenido de una URL, simulando una posible falla de red.
        /// </summary>
        public static async Task<string> DownloadPageContentAsync(string url)
        {
            try
            {
                Console.WriteLine($"  Intentando descargar: {url}");
                string content = await _httpClient.GetStringAsync(url);
                Console.WriteLine($"  Descarga exitosa de: {url}");
                return content;
            }
            catch (HttpRequestException ex)
            {
                Console.WriteLine($"  Error al descargar {url}: {ex.Message}");
                throw new Exception($"Falló la descarga de {url}", ex); // Re-lanzar para que WhenAll lo maneje
            }
        }
    }

    // Ejemplo incorrecto:
    // 1. No pasar `CancellationToken` a operaciones que lo requieren:
    //    public async Task DoSomethingLong() { await Task.Delay(10000); } // No se puede cancelar externamente.
    //    Siempre que una operación asíncrona pueda ser de larga duración, es buena práctica aceptar un `CancellationToken`.
    // 2. Bloquear el hilo esperando tareas de forma síncrona:
    //    Task.Run(() => MyAsyncMethod()).Wait(); // BAD: Bloquea el hilo.
    //    MyAsyncMethod().Result; // BAD: Bloquea el hilo.
    //    Usa `await` para esperar el resultado de una tarea en métodos `async`.
    // 3. Ignorar `OperationCanceledException`:
    //    Capturar `Exception` genéricamente sin manejar `OperationCanceledException` específicamente.
    //    Esto puede llevar a que una operación cancelada se trate como un error inesperado.
    '''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Desarrollo Asíncrono y Paralelo',
    'topic': 'Programación Asíncrona',
    'subtopic': 'Consideraciones de rendimiento',
    'definition': r'''
Cuando hablamos de programación asíncrona en C# con `async` y `await`, no solo pensamos en la responsividad de la aplicación, sino también, y muy importante, en el rendimiento. Pensemos por un momento en esto como afinar un coche de carreras: no solo se trata de que acelere, sino de que lo haga de la forma más eficiente posible, sin desperdiciar energía ni sobrecalentarse.

¿Te estás preguntando por qué esto importa? Porque aunque `async` y `await` hacen que el código sea no bloqueante y más escalable, su uso incorrecto puede introducir nuevas ineficiencias. No se trata de una solución mágica que automáticamente hace que todo sea más rápido; se trata de liberar hilos de ejecución para que hagan otro trabajo. Si no tienes en cuenta ciertas consideraciones, podrías terminar con un rendimiento peor, mayor consumo de memoria, o incluso problemas difíciles de depurar como deadlocks.

Aquí hay algunas consideraciones clave de rendimiento cuando trabajas con `async` y `await`:

1.  **Evitar el "Async over Sync" o "Sync over Async":**
    * **¿Qué es?** Esto ocurre cuando llamas a un método asíncrono y lo bloqueas sincrónicamente (ej. usando `.Result` o `.Wait()`) en un contexto que tiene un `SynchronizationContext` (como una aplicación de UI o ASP.NET Framework antiguo).
    * **Problema:** Puede llevar a **deadlocks** (bloqueos mutuos) y degradación del rendimiento, ya que el hilo que espera la operación asíncrona se bloquea, y la operación asíncrona necesita ese mismo hilo para reanudar su ejecución.
    * **Solución:** Siempre `await` las tareas. Si un método es `async`, sus llamadores también deberían ser `async` hasta llegar a un "punto de entrada" síncrono (ej. `Main` en una consola, o un controlador de evento de UI).

2.  **`ConfigureAwait(false)`:**
    * **¿Para qué sirve?** Cuando `await` una `Task`, por defecto, el sistema intentará reanudar el código restante del método `async` en el mismo `SynchronizationContext` (contexto de hilo) que estaba presente antes del `await`.
    * **Impacto en Rendimiento:** En librerías o código de backend (ej. APIs web, servicios de consola) donde no necesitas volver al hilo de la UI, este intento de "capturar" el contexto puede incurrir en una pequeña sobrecarga de rendimiento y, más importante, puede contribuir a deadlocks si se mezcla con bloqueos síncronos.
    * **Uso:** Al usar `await someTask.ConfigureAwait(false);`, le indicas al CLR que no necesitas volver al contexto de sincronización original. Esto puede mejorar ligeramente el rendimiento y, sobre todo, ayuda a prevenir deadlocks en librerías.
    * **Cuidado:** Solo úsalo cuando sabes que no necesitas acceder a elementos específicos del contexto (ej. controles UI).

3.  **"Async All the Way Down":**
    * La mejor práctica es que, una vez que introduces `async` en tu pila de llamadas, sigas usándolo. Es decir, si tu método de acceso a datos es `async`, el servicio que lo llama también debería ser `async`, y el controlador web que llama al servicio también, y así sucesivamente.
    * **Beneficio:** Maximiza los beneficios de no bloqueo y evita los problemas de "Async over Sync".

4.  **Minimizar Asignaciones de `Task`:**
    * Cada vez que creas una `Task` (ej. `Task.FromResult`, `Task.CompletedTask`, `Task.Delay`), hay una pequeña asignación de memoria. Para operaciones muy frecuentes y de corta duración, esto puede acumularse.
    * **`ValueTask<T>` (Desde .NET Core 2.1):** Es una alternativa a `Task<T>` que puede evitar asignaciones de memoria en ciertos escenarios (cuando el resultado ya está disponible o cuando la tarea se completa sincrónicamente). Útil para APIs de muy alto rendimiento.

5.  **ThreadPool Starvation (Agotamiento del Pool de Hilos):**
    * Aunque `async/await` libera hilos, si tienes demasiadas operaciones asíncronas de CPU intensivas que se ejecutan en el `ThreadPool` (ej. bucles muy largos, cálculos matemáticos complejos sin `await`), puedes agotar los hilos del pool, llevando a una degradación del rendimiento.
    * **Solución:** Para operaciones **CPU-intensivas**, usa `Task.Run()` para moverlas a un hilo del `ThreadPool`, pero asegúrate de que sean de corta duración o que el `ThreadPool` pueda manejarlas. Para operaciones E/S-intensivas, `async/await` es ideal.

6.  **Serialización y Deserialización Asíncrona:**
    * Cuando trabajes con JSON, XML u otros formatos, usa las variantes asíncronas de los métodos de serialización/deserialización (ej. `JsonSerializer.DeserializeAsync`).

Al prestar atención a estas consideraciones, puedes asegurarte de que tu código asíncrono no solo sea funcional, sino también altamente eficiente y de alto rendimiento.
''',
    'code_example': r'''
// Ejemplo de Consideraciones de Rendimiento en Programación Asíncrona en C#

using System;
using System.Net.Http;
using System.Threading.Tasks;
using System.Threading;
using System.Diagnostics; // Para Stopwatch y Logging
using System.Text.Json; // Para serialización/deserialización asíncrona

namespace AsyncPerformanceDemo
{
    public class Program
    {
        private static readonly HttpClient _httpClient = new HttpClient();

        public static async Task Main(string[] args)
        {
            Console.WriteLine("--- Consideraciones de Rendimiento en Async/Await ---");

            // --- 1. Evitar "Sync over Async" (Deadlocks) ---
            // Esto NO se debe hacer en aplicaciones con SynchronizationContext (UI, ASP.NET Framework)
            // Aquí en una app de consola pura, podría funcionar, pero es una mala práctica.
            Console.WriteLine("\n--- 1. Evitando Sync over Async (NO HACER EN CONTEXTOS UI/ASP.NET Framework) ---");
            Console.WriteLine("Llamando a GetWebsiteContentBadly().Result (simulando deadlock si hay context)...");
            try
            {
                // Este es el anti-patrón. En una app de consola pura sin SynchronizationContext,
                // puede que no se deadloquee, pero en una app de UI o ASP.NET Framework SÍ.
                string content = GetWebsiteContentBadly().Result; // Bloquea el hilo principal
                Console.WriteLine($"Contenido (BAD): {content.Substring(0, 50)}...");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error/Deadlock simulado: {ex.Message}");
            }
            Console.WriteLine("Llamando a GetWebsiteContentProperly() (async/await)...");
            string properContent = await GetWebsiteContentProperly(); // Correcto
            Console.WriteLine($"Contenido (GOOD): {properContent.Substring(0, 50)}...");


            // --- 2. Uso de ConfigureAwait(false) ---
            Console.WriteLine("\n--- 2. Uso de ConfigureAwait(false) ---");
            await PerformWorkWithConfigureAwait(true); // Con `ConfigureAwait(true)` (default)
            await PerformWorkWithConfigureAwait(false); // Con `ConfigureAwait(false)`

            // --- 3. Async All the Way Down ---
            Console.WriteLine("\n--- 3. Async All the Way Down ---");
            await OuterMethodAsync();


            // --- 4. Minimizar Asignaciones de Task (ej. ValueTask) ---
            Console.WriteLine("\n--- 4. ValueTask para reducir asignaciones ---");
            Stopwatch sw = Stopwatch.StartNew();
            for (int i = 0; i < 100000; i++)
            {
                // Task.FromResult<int>(1); // Crea una nueva Task cada vez
                _ = ReturnIntValueTask(1); // ValueTask puede evitar la asignación si el valor está listo sincrónicamente
            }
            sw.Stop();
            Console.WriteLine($"Tiempo para 100,000 operaciones con ValueTask: {sw.ElapsedMilliseconds} ms.");


            // --- 5. Serialización/Deserialización Asíncrona ---
            Console.WriteLine("\n--- 5. Serialización/Deserialización Asíncrona ---");
            var myObject = new { Name = "Test", Value = 123 };
            using (var stream = new MemoryStream())
            {
                await JsonSerializer.SerializeAsync(stream, myObject); // Serialización asíncrona
                stream.Position = 0;
                var deserializedObject = await JsonSerializer.DeserializeAsync<dynamic>(stream); // Deserialización asíncrona
                Console.WriteLine($"Objeto serializado/deserializado: Name={deserializedObject.GetProperty("Name")}, Value={deserializedObject.GetProperty("Value")}");
            }


            Console.WriteLine("\nDemostración de rendimiento finalizada. Presiona cualquier tecla para salir.");
            Console.ReadKey();
        }

        // --- 1. Ejemplos de Sync over Async (Anti-patrón) ---
        public static async Task<string> GetWebsiteContentBadly()
        {
            // Este es el método asíncrono.
            // En un contexto con SynchronizationContext (UI/ASP.NET Framework), el .Result bloquearía el hilo
            // y el método asíncrono necesitaría el mismo hilo para reanudar, creando un deadlock.
            return await _httpClient.GetStringAsync("https://www.google.com");
        }

        public static async Task<string> GetWebsiteContentProperly()
        {
            // La forma correcta, siempre `await`
            return await _httpClient.GetStringAsync("https://www.google.com");
        }

        // --- 2. Ejemplo de ConfigureAwait(false) ---
        public static async Task PerformWorkWithConfigureAwait(bool continueOnCapturedContext)
        {
            Console.WriteLine($"  Iniciando PerformWorkWithConfigureAwait(continueOnCapturedContext: {continueOnCapturedContext})...");
            Console.WriteLine($"  Hilo antes del await: {Thread.CurrentThread.ManagedThreadId}");

            await Task.Delay(100).ConfigureAwait(continueOnCapturedContext);

            // Si continueOnCapturedContext es false, el código aquí puede reanudarse en cualquier hilo del ThreadPool.
            // Si es true (por defecto), intentará reanudar en el mismo SynchronizationContext.
            Console.WriteLine($"  Hilo después del await: {Thread.CurrentThread.ManagedThreadId}");
            Console.WriteLine($"  Finalizando PerformWorkWithConfigureAwait(continueOnCapturedContext: {continueOnCapturedContext}).");
        }

        // --- 3. Ejemplo de Async All the Way Down ---
        public static async Task OuterMethodAsync()
        {
            Console.WriteLine("  OuterMethodAsync: Calling MiddleMethodAsync...");
            await MiddleMethodAsync();
            Console.WriteLine("  OuterMethodAsync: Finished.");
        }

        public static async Task MiddleMethodAsync()
        {
            Console.WriteLine("    MiddleMethodAsync: Calling InnerMethodAsync...");
            await InnerMethodAsync();
            Console.WriteLine("    MiddleMethodAsync: Finished.");
        }

        public static async Task InnerMethodAsync()
        {
            Console.WriteLine("      InnerMethodAsync: Performing some async I/O...");
            await Task.Delay(100); // Simula una operación I/O
            Console.WriteLine("      InnerMethodAsync: I/O finished.");
        }

        // --- 4. Ejemplo de ValueTask (cuando el valor puede estar disponible sincrónicamente) ---
        public static ValueTask<int> ReturnIntValueTask(int value)
        {
            // Si el valor ya está disponible, podemos devolver un ValueTask sin asignación.
            return new ValueTask<int>(value);
            // Si necesitara una operación asíncrona real:
            // return new ValueTask<int>(Task.FromResult(value)); // Esto sí asigna una Task
            // o si fuera una llamada real a una API:
            // return new ValueTask<int>(SomeExternalService.GetValueAsync());
        }
    }

    // Ejemplos incorrectos de rendimiento con Async/Await:
    // 1. Usar Thread.Sleep en un método `async`:
    //    public async Task BadAsyncMethod() { Thread.Sleep(5000); } // BAD: Bloquea el hilo, no es asíncrono.
    //    Usa `await Task.Delay(5000);` en su lugar.
    // 2. Crear demasiadas tareas de corta duración para operaciones CPU-intensivas:
    //    Si tienes un bucle que realiza millones de cálculos pequeños, crear una nueva tarea para cada cálculo
    //    puede generar una sobrecarga excesiva. `async/await` es para I/O bound operations.
    //    Para CPU-bound, considera paralelismo (TPL) o algoritmos más eficientes.
    // 3. No liberar recursos externos rápidamente:
    //    Olvidar el uso de `using` o `await using` con recursos que implementan `IDisposable` o `IAsyncDisposable`
    //    puede llevar a fugas de recursos aunque el código sea asíncrono.
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Desarrollo Asíncrono y Paralelo',
    'topic': 'Programación Paralela',
    'subtopic': 'Uso de Parallel.For y Parallel LINQ (PLINQ)',
    'definition': r'''
El uso de `Parallel.For` y Parallel LINQ (PLINQ) en C# es tu boleto para hacer que tu código ejecute tareas simultáneamente, aprovechando al máximo los múltiples núcleos de procesamiento que tienen la mayoría de las computadoras hoy en día. Pensemos por un momento en esto como tener un equipo de trabajo para una tarea grande: en lugar de que una sola persona haga todo el trabajo en secuencia, divides la tarea en partes más pequeñas y dejas que varias personas las hagan al mismo tiempo.

¿Te estás preguntando por qué esto importa? Porque hay muchas operaciones que por naturaleza son "paralelizables", es decir, pueden dividirse en subtareas independientes que no necesitan esperar unas a otras. Si tienes una CPU con 4, 8 o más núcleos, y tu código se ejecuta solo en uno de ellos, estás dejando mucho poder de cómputo sin usar. `Parallel.For` y PLINQ te permiten aprovechar ese poder extra para que esas operaciones intensivas en CPU se completen mucho más rápido, mejorando drásticamente el rendimiento en escenarios donde el cuello de botella es el procesamiento.

Vamos a ver de qué se trata todo esto:

1.  **`Parallel.For` y `Parallel.ForEach`:**
    * **¿Qué son?** Son métodos estáticos de la clase `Parallel` (parte de la Task Parallel Library - TPL) que te permiten ejecutar bucles `for` y `foreach` de forma paralela.
    * **¿Cómo funcionan?** El `Parallel.For` o `ForEach` toma tu rango de iteraciones o colección y las divide en particiones. Luego, distribuye esas particiones entre los hilos disponibles en el Thread Pool del .NET Runtime. Cada hilo procesa su porción de la tarea de forma independiente.
    * **Cuándo usarlos:** Son ideales para escenarios donde cada iteración del bucle es independiente de las demás y no hay problemas de concurrencia significativos. Por ejemplo, procesar una lista grande de archivos, aplicar una transformación a cada elemento de un array numérico, o realizar un cálculo independiente para cada elemento.
    * **Beneficio:** Aceleran significativamente la ejecución de bucles intensivos en CPU al distribuir la carga entre varios núcleos.

2.  **Parallel LINQ (PLINQ):**
    * **¿Qué es?** Es una extensión de LINQ (Language Integrated Query) que te permite ejecutar consultas LINQ en paralelo. Simplemente añadiendo el método `.AsParallel()` a tu consulta LINQ, le indicas al sistema que intente ejecutarla de forma paralela.
    * **¿Cómo funciona?** PLINQ toma tu consulta LINQ, la descompone en sus operadores (Where, Select, GroupBy, OrderBy, etc.), y luego intenta paralelizar la ejecución de esos operadores. Al igual que `Parallel.For`, usa el Thread Pool para distribuir el trabajo.
    * **Cuándo usarlo:** Cuando ya estás usando LINQ para consultar colecciones de datos y quieres acelerar el procesamiento de esas consultas, especialmente si implican filtrado o transformación de grandes volúmenes de datos en memoria.
    * **Beneficio:** Combina la expresividad de LINQ con el rendimiento del paralelismo, haciendo que las consultas sobre colecciones grandes sean mucho más rápidas.

**Consideraciones importantes:**

* **Coste de Paralelización:** Paralelizar tiene una sobrecarga. No uses estas herramientas para tareas muy pequeñas o para colecciones con pocos elementos; el costo de dividir el trabajo y gestionar los hilos puede superar cualquier ganancia de rendimiento.
* **Independencia de Operaciones:** Asegúrate de que las operaciones dentro del bucle o la consulta sean lo más independientes posible. Si las iteraciones dependen unas de otras, o si modifican datos compartidos sin una sincronización adecuada, podrías tener resultados incorrectos o condiciones de carrera.
* **Errores y Excepciones:** Si una excepción ocurre en una de las tareas paralelas, `Parallel.For`/`ForEach` y PLINQ la encapsularán en una `AggregateException`. Deberás manejar esta excepción para ver los errores individuales.

`Parallel.For`/`ForEach` y PLINQ son herramientas fantásticas en tu arsenal cuando te enfrentas a problemas intensivos en CPU y quieres exprimir hasta el último bit de rendimiento de tu hardware.
''',
    'code_example': r'''
// Ejemplo de uso de Parallel.For, Parallel.ForEach y PLINQ en C#

using System;
using System.Linq;
using System.Threading.Tasks;
using System.Diagnostics; // Para Stopwatch

namespace ParallelProgrammingDemo
{
    public class Program
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("--- Demostración de Programación Paralela ---");

            // --- Datos de ejemplo ---
            const int ArraySize = 100_000_000; // Cien millones de elementos
            double[] data = new double[ArraySize];
            for (int i = 0; i < ArraySize; i++)
            {
                data[i] = i * Math.PI;
            }

            Console.WriteLine($"\nProcesando un array de {ArraySize} elementos.");

            // --- 1. Comparación con un bucle for tradicional (secuencial) ---
            Console.WriteLine("\n--- Bucle For Secuencial ---");
            Stopwatch swSequential = Stopwatch.StartNew();
            for (int i = 0; i < ArraySize; i++)
            {
                data[i] = Math.Sin(data[i]) * Math.Cos(data[i]); // Operación intensiva en CPU
            }
            swSequential.Stop();
            Console.WriteLine($"Tiempo secuencial: {swSequential.ElapsedMilliseconds} ms.");
            // Resetear data para la siguiente prueba
            for (int i = 0; i < ArraySize; i++) data[i] = i * Math.PI;


            // --- 2. Uso de Parallel.For ---
            Console.WriteLine("\n--- Uso de Parallel.For ---");
            Stopwatch swParallelFor = Stopwatch.StartNew();
            Parallel.For(0, ArraySize, i =>
            {
                data[i] = Math.Sin(data[i]) * Math.Cos(data[i]);
            });
            swParallelFor.Stop();
            Console.WriteLine($"Tiempo con Parallel.For: {swParallelFor.ElapsedMilliseconds} ms.");
            // Resetear data para la siguiente prueba
            for (int i = 0; i < ArraySize; i++) data[i] = i * Math.PI;


            // --- 3. Uso de Parallel.ForEach ---
            Console.WriteLine("\n--- Uso de Parallel.ForEach ---");
            List<int> numbers = Enumerable.Range(0, 10_000_000).ToList(); // Diez millones de números
            long sumParallel = 0;
            // Para sumas, necesitas Thread-safe operations o usar Parallel.For con Thread-local storage
            // Este es un ejemplo simplificado; en un caso real, la suma requeriría un bloqueo o Parallel.For con una variable thread-local.
            Stopwatch swParallelForEach = Stopwatch.StartNew();
            Parallel.ForEach(numbers, number =>
            {
                // Este tipo de operación (lectura) es segura en paralelo
                //Console.WriteLine($"Processing number: {number}"); // No hagas esto en un bucle grande, ralentiza
                // La operación de suma aquí NO ES THREAD-SAFE. Es solo para demostrar el ForEach.
                // Interlocked.Add(ref sumParallel, number); // Para hacerla segura.
            });
            swParallelForEach.Stop();
            Console.WriteLine($"Tiempo con Parallel.ForEach (para 10M elementos): {swParallelForEach.ElapsedMilliseconds} ms.");


            // --- 4. Uso de Parallel LINQ (PLINQ) ---
            Console.WriteLine("\n--- Uso de PLINQ ---");
            // Generar una lista grande de strings para simular procesamiento
            var words = Enumerable.Range(0, 5_000_000) // Cinco millones de strings
                                  .Select(i => $"word_{i}_long_text_example")
                                  .ToList();

            Stopwatch swPlinq = Stopwatch.StartNew();
            // .AsParallel() es lo que habilita el paralelismo
            var processedWords = words.AsParallel()
                                      .Where(w => w.Contains("text")) // Filtrado
                                      .Select(w => w.ToUpperInvariant()) // Transformación
                                      .ToList(); // Materializa la colección
            swPlinq.Stop();
            Console.WriteLine($"Tiempo con PLINQ (para 5M palabras): {swPlinq.ElapsedMilliseconds} ms.");
            Console.WriteLine($"Palabras procesadas por PLINQ: {processedWords.Count}");


            // --- Manejo de excepciones en Parallel.For ---
            Console.WriteLine("\n--- Manejo de Excepciones en Parallel.For ---");
            try
            {
                Parallel.For(0, 10, i =>
                {
                    if (i == 5)
                    {
                        throw new InvalidOperationException($"Error simulado en la iteración {i}");
                    }
                    Console.WriteLine($"Procesando item {i}");
                });
            }
            catch (AggregateException ae)
            {
                Console.WriteLine("\nSe capturó una AggregateException con los siguientes errores:");
                foreach (var ex in ae.InnerExceptions)
                {
                    Console.WriteLine($"- {ex.GetType().Name}: {ex.Message}");
                }
            }


            Console.WriteLine("\nPresiona cualquier tecla para salir.");
            Console.ReadKey();
        }
    }

    // Ejemplo incorrecto:
    // 1. Paralelizar tareas que no son CPU-intensivas:
    //    Si tu operación principal es E/S (lectura de disco, red), `Parallel.For` no ayudará mucho
    //    y puede incluso añadir sobrecarga. Para I/O, usa `async/await`.
    //    BAD: Parallel.For(0, 100, i => DownloadSmallFile()); // Ineficiente si DownloadSmallFile es asíncrono
    // 2. Modificar datos compartidos sin sincronización:
    //    List<int> sharedList = new List<int>();
    //    Parallel.For(0, 1000, i => sharedList.Add(i)); // BAD: Condición de carrera en Add(), la lista no será consistente.
    //    Debes usar colecciones thread-safe (ej. ConcurrentBag, ConcurrentQueue) o mecanismos de bloqueo (lock).
    // 3. Paralelizar colecciones o bucles muy pequeños:
    //    Parallel.For(0, 5, i => Console.WriteLine(i)); // La sobrecarga de crear y gestionar hilos supera la ganancia.
    //    Usa bucles secuenciales para tareas triviales.
    '''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Desarrollo Asíncrono y Paralelo',
    'topic': 'Programación Paralela',
    'subtopic': 'Sincronización y manejo de concurrencia',
    'definition': r'''
La sincronización y el manejo de concurrencia son temas cruciales en la programación paralela, especialmente cuando varios hilos intentan acceder o modificar los mismos datos. Pensemos por un momento en esto como un grupo de personas trabajando en un mismo documento: si todos escriben a la vez en la misma sección, el resultado será un caos. Necesitan reglas para turnarse o para asegurarse de que sus cambios no se pisen.

¿Te estás preguntando por qué esto importa? Porque si no manejas la concurrencia de forma adecuada, tu aplicación puede sufrir de "condiciones de carrera" (que veremos en el siguiente subtema), datos corruptos, resultados inconsistentes o incluso bloqueos (deadlocks). Aunque la programación paralela busca acelerar las cosas, hacerlo sin sincronización es como ir muy rápido en un coche sin frenos ni dirección. Es fundamental para garantizar la corrección y la fiabilidad de tu aplicación cuando múltiples hilos están activos.

Vamos a ver de qué se trata todo esto y las herramientas que .NET te ofrece:

1.  **Exclusión Mutua (Locks):**
    * **¿Qué es?** Es la forma más básica y común de sincronización. Asegura que solo un hilo a la vez pueda acceder a una sección crítica de código (un "bloque de bloqueo").
    * **`lock` en C#:** La palabra clave `lock` se usa con un objeto de referencia (cualquier instancia de `object` o un objeto de clase) para definir una sección de código que solo un hilo puede ejecutar a la vez. Cuando un hilo entra en un bloque `lock`, adquiere un "bloqueo" sobre ese objeto. Si otro hilo intenta entrar al mismo bloque con el mismo objeto, espera hasta que el primer hilo libere el bloqueo.
    * **Cuándo usarlo:** Para proteger el acceso a recursos compartidos (variables, colecciones, archivos, conexiones a DB) que no son thread-safe cuando múltiples hilos los modifican.
    * **Cuidado:** Bloquear demasiado tiempo o bloquear objetos incorrectos puede llevar a cuellos de botella de rendimiento o deadlocks.

2.  **Mecanismos de Sincronización Avanzados:**
    * **`Monitor`:** Es la base de `lock` y ofrece un control más granular, permitiéndote `Enter` y `Exit` un bloqueo explícitamente. También tiene métodos para `Wait` y `Pulse`/`PulseAll` para patrones de productor-consumidor.
    * **`ReaderWriterLockSlim`:** Útil cuando tienes muchos más lectores que escritores. Permite que múltiples hilos lean al mismo tiempo, pero solo un hilo escriba (y bloquea a los lectores mientras escribe). Esto es más eficiente que un `lock` simple para estos escenarios.
    * **`SemaphoreSlim`:** Limita el número de hilos que pueden acceder a un recurso simultáneamente. Útil para controlar la concurrencia a recursos limitados (ej. conexiones a una API externa).
    * **Eventos de Sincronización (`ManualResetEventSlim`, `AutoResetEvent`):** Permiten que los hilos se comuniquen entre sí señalizando eventos. Un hilo puede esperar una señal, y otro puede "establecer" la señal.
    * **`CountdownEvent`:** Un hilo espera hasta que un contador interno llega a cero (útil cuando necesitas esperar a que N operaciones paralelas terminen).

3.  **Colecciones Concurrentes (Thread-Safe Collections):**
    * **¿Qué son?** Clases en el namespace `System.Collections.Concurrent` (ej. `ConcurrentBag<T>`, `ConcurrentQueue<T>`, `ConcurrentDictionary<TKey, TValue>`) diseñadas específicamente para ser usadas por múltiples hilos sin necesidad de bloqueos externos.
    * **Beneficio:** Son más eficientes que usar `lock` con colecciones tradicionales porque usan algoritmos "sin bloqueo" (lock-free) o bloqueos muy finos internamente.
    * **Cuándo usarlas:** Siempre que necesites que múltiples hilos añadan, quiten o accedan a elementos de una colección compartida.

**Principios clave:**

* **Identifica los recursos compartidos:** ¿Qué datos pueden ser modificados por más de un hilo?
* **Minimiza las secciones críticas:** Haz que los bloques de código protegidos por bloqueos sean lo más pequeños posible para reducir el tiempo que los hilos esperan.
* **Usa la herramienta adecuada:** No uses `lock` si una colección concurrente o un mecanismo más especializado es más eficiente.
* **Sé consciente de los deadlocks:** Asegúrate de que tus bloqueos se adquieran y liberen en un orden consistente para evitar que los hilos se bloqueen mutuamente.

La sincronización es compleja y requiere un entendimiento profundo, pero es indispensable para la robustez de tus aplicaciones paralelas.
''',
    'code_example': r'''
// Ejemplo de Sincronización y Manejo de Concurrencia en C#

using System;
using System.Collections.Concurrent; // Para colecciones concurrentes
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace ConcurrencyDemo
{
    public class Program
    {
        // Recurso compartido que requiere sincronización
        private static int _sharedCounter = 0;
        private static readonly object _lockObject = new object(); // Objeto para el bloqueo (lock)

        // Recurso compartido que usa una colección concurrente
        private static ConcurrentBag<int> _concurrentNumbers = new ConcurrentBag<int>();

        // Semáforo para limitar la concurrencia
        private static SemaphoreSlim _semaphore = new SemaphoreSlim(initialCount: 3, maxCount: 3); // Permite 3 hilos a la vez

        public static async Task Main(string[] args)
        {
            Console.WriteLine("--- Demostración de Sincronización y Concurrencia ---");

            // --- 1. Uso de 'lock' para proteger un recurso compartido ---
            Console.WriteLine("\n--- 1. Uso de 'lock' ---");
            _sharedCounter = 0; // Resetear contador

            // Crear un conjunto de tareas que incrementan el contador
            List<Task> lockTasks = new List<Task>();
            for (int i = 0; i < 1000; i++) // 1000 iteraciones
            {
                lockTasks.Add(Task.Run(() => IncrementCounterWithLock()));
            }
            await Task.WhenAll(lockTasks);
            Console.WriteLine($"Contador final con 'lock': {_sharedCounter} (Debería ser 1000)");

            // --- Mal ejemplo: Sin lock, el contador sería inconsistente ---
            _sharedCounter = 0;
            List<Task> noLockTasks = new List<Task>();
            for (int i = 0; i < 1000; i++)
            {
                noLockTasks.Add(Task.Run(() => IncrementCounterWithoutLock()));
            }
            await Task.WhenAll(noLockTasks);
            Console.WriteLine($"Contador final SIN 'lock': {_sharedCounter} (Será inconsistente, ¡CONDICIÓN DE CARRERA!)");


            // --- 2. Uso de colecciones concurrentes ---
            Console.WriteLine("\n--- 2. Uso de ConcurrentBag ---");
            List<Task> concurrentBagTasks = new List<Task>();
            for (int i = 0; i < 1000; i++)
            {
                int localI = i; // Capturar la variable para el closure
                concurrentBagTasks.Add(Task.Run(() => _concurrentNumbers.Add(localI)));
            }
            await Task.WhenAll(concurrentBagTasks);
            Console.WriteLine($"Elementos en ConcurrentBag: {_concurrentNumbers.Count} (Debería ser 1000)");
            // Puedes verificar si hay duplicados o faltantes para entender el comportamiento si no fuera concurrente.


            // --- 3. Uso de SemaphoreSlim para limitar la concurrencia ---
            Console.WriteLine("\n--- 3. Uso de SemaphoreSlim (Máximo 3 operaciones simultáneas) ---");
            List<Task> semaphoreTasks = new List<Task>();
            for (int i = 0; i < 10; i++) // 10 operaciones
            {
                int localI = i;
                semaphoreTasks.Add(Task.Run(async () => await LimitedConcurrentOperation(localI)));
            }
            await Task.WhenAll(semaphoreTasks);
            Console.WriteLine("Todas las operaciones limitadas por semáforo completadas.");


            // --- 4. Ejemplo conceptual de ReaderWriterLockSlim ---
            Console.WriteLine("\n--- 4. Uso conceptual de ReaderWriterLockSlim ---");
            var rwl = new ReaderWriterLockSlim();
            int dataValue = 0;

            // Tarea de lectura
            Task.Run(() =>
            {
                for (int i = 0; i < 5; i++)
                {
                    rwl.EnterReadLock();
                    try
                    {
                        Console.WriteLine($"  Lector: Leyendo valor {dataValue}");
                    }
                    finally
                    {
                        rwl.ExitReadLock();
                    }
                    Thread.Sleep(100);
                }
            });

            // Tarea de escritura
            Task.Run(() =>
            {
                for (int i = 0; i < 2; i++)
                {
                    rwl.EnterWriteLock();
                    try
                    {
                        dataValue++;
                        Console.WriteLine($"  Escritor: Incrementando valor a {dataValue}");
                    }
                    finally
                    {
                        rwl.ExitWriteLock();
                    }
                    Thread.Sleep(300);
                }
            });
            await Task.Delay(2000); // Dar tiempo para que las tareas se ejecuten
            Console.WriteLine("Demostración de ReaderWriterLockSlim terminada.");


            Console.WriteLine("\nPresiona cualquier tecla para salir.");
            Console.ReadKey();
        }

        // Método que incrementa un contador usando 'lock'
        public static void IncrementCounterWithLock()
        {
            lock (_lockObject) // Solo un hilo puede entrar en este bloque a la vez
            {
                _sharedCounter++;
            }
        }

        // Método que incrementa un contador SIN 'lock' (problema de condición de carrera)
        public static void IncrementCounterWithoutLock()
        {
            _sharedCounter++; // Múltiples hilos pueden leer/escribir al mismo tiempo, llevando a resultados incorrectos.
        }

        // Método que simula una operación con concurrencia limitada por SemaphoreSlim
        public static async Task LimitedConcurrentOperation(int id)
        {
            Console.WriteLine($"  Operación {id}: Esperando semáforo...");
            await _semaphore.WaitAsync(); // Adquirir un slot del semáforo
            try
            {
                Console.WriteLine($"  Operación {id}: Ejecutando (Slots restantes: {_semaphore.CurrentCount})");
                await Task.Delay(new Random().Next(100, 500)); // Simular trabajo
                Console.WriteLine($"  Operación {id}: Terminada.");
            }
            finally
            {
                _semaphore.Release(); // Liberar el slot del semáforo
                Console.WriteLine($"  Operación {id}: Semáforo liberado (Slots disponibles: {_semaphore.CurrentCount})");
            }
        }
    }

    // Ejemplo incorrecto de sincronización:
    // 1. Bloquear 'this' o tipos públicos:
    //    public class MyClass { private void Method() { lock (this) { /* ... */ } } } // BAD: Otros pueden bloquear la misma instancia.
    //    public class MyClass { private void Method() { lock (typeof(MyClass)) { /* ... */ } } } // BAD: Bloquea todos los hilos que acceden a CUALQUIER instancia de MyClass.
    //    Siempre usa un objeto `private static readonly object` para bloquear.
    // 2. Bloquear por períodos demasiado largos:
    //    lock (_lockObject) {
    //        // Mucho código, incluyendo operaciones de I/O o DB
    //        await LongRunningOperationAsync(); // BAD: Bloquear un hilo mientras espera I/O.
    //    }
    //    Minimiza las secciones críticas. Si tienes operaciones asíncronas, considera alternativas sin bloqueo.
    // 3. No usar colecciones concurrentes cuando aplican:
    //    Si necesitas una colección compartida, intenta usar `System.Collections.Concurrent` antes de `lock` una colección estándar.
    '''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Mid',
    'level': 5,
    'title_level': 'Desarrollo Asíncrono y Paralelo',
    'topic': 'Programación Paralela',
    'subtopic': 'Evitación de condiciones de carrera',
    'definition': r'''
La evitación de condiciones de carrera es uno de los desafíos más grandes y, a veces, más sutiles en la programación concurrente y paralela. Una condición de carrera ocurre cuando el resultado de una operación depende del orden o la temporización de eventos incontrolables, como la ejecución de múltiples hilos. Pensemos por un momento en esto como dos coches que llegan a una intersección sin semáforo al mismo tiempo: el resultado de quién pasa primero es incierto y podría llevar a un accidente.

¿Te estás preguntando por qué esto importa? Porque las condiciones de carrera pueden llevar a errores extremadamente difíciles de depurar. Pueden manifestarse solo bajo cargas específicas, en ciertos entornos, o de forma intermitente (lo que se conoce como "errores fantasma"). Los resultados pueden ser datos corruptos, cálculos incorrectos, o incluso bloqueos de la aplicación. En un sistema bancario, una condición de carrera podría llevar a que dos transferencias de dinero se ejecuten de forma incorrecta, resultando en pérdidas de dinero. Es fundamental entenderlas y prevenirlas para construir aplicaciones fiables y estables.

Vamos a ver de qué se trata todo esto y cómo prevenirlas:

Una condición de carrera típicamente ocurre cuando:
* Múltiples hilos acceden a un **recurso compartido** (ej. una variable, una colección, un archivo).
* Al menos uno de los hilos está **modificando** ese recurso.
* No hay **sincronización adecuada** para controlar el acceso.

**Ejemplo clásico: El Contador Compartido.**
Imagina un contador global que es incrementado por varios hilos. Si dos hilos leen el valor (ej. 5), ambos lo incrementan a 6 en su memoria local, y luego ambos escriben 6 de vuelta, el contador solo se incrementó una vez, no dos. El resultado final depende de cuál hilo "ganó" la carrera de escritura.

**Técnicas para la Evitación de Condiciones de Carrera:**

1.  **Exclusión Mutua (Locks):**
    * Como vimos en el subtema anterior, usar `lock` (o `Monitor`) es la forma más directa de asegurar que solo un hilo a la vez acceda a la sección crítica donde se modifican los datos compartidos. Esto fuerza la serialización del acceso y elimina la carrera.
    * **Pros:** Sencillo de implementar para muchos escenarios.
    * **Contras:** Puede reducir el paralelismo (los hilos esperan) y es propenso a deadlocks si no se usa con cuidado.

2.  **Operaciones Atómicas (`Interlocked`):**
    * **¿Qué son?** Son operaciones que se garantizan que se completan de forma "atómica" (como una sola unidad indivisible) y thread-safe por el hardware.
    * **Clase `Interlocked`:** En .NET, la clase `System.Threading.Interlocked` proporciona métodos para operaciones atómicas comunes como `Increment`, `Decrement`, `Add`, `Exchange`, `CompareExchange`.
    * **Cuándo usarlo:** Cuando solo necesitas realizar operaciones simples (ej. incrementar un contador, intercambiar valores) y no necesitas proteger un bloque de código más complejo. Es más eficiente que un `lock` para estas operaciones simples.

3.  **Colecciones Concurrentes (`System.Collections.Concurrent`):**
    * Como también mencionamos, estas colecciones (`ConcurrentBag`, `ConcurrentQueue`, `ConcurrentDictionary`, etc.) están diseñadas para ser seguras para usar con múltiples hilos sin que tengas que añadir bloqueos externos. Internamente, manejan la sincronización de forma eficiente.
    * **Pros:** Generalmente más eficientes y menos propensas a errores que usar `lock` con colecciones tradicionales.
    * **Cuándo usarlas:** Siempre que varios hilos necesiten añadir, quitar o acceder a elementos de una colección compartida.

4.  **Inmutabilidad:**
    * **¿Qué es?** Diseñar objetos o estructuras de datos de modo que, una vez creados, sus estados no puedan ser modificados. Si un objeto no puede cambiar, entonces no hay problema de que múltiples hilos lo modifiquen simultáneamente.
    * **Cómo funciona:** Si necesitas cambiar un valor, en lugar de modificar el objeto existente, creas una nueva instancia con el nuevo valor.
    * **Pros:** Elimina completamente la necesidad de sincronización para esos datos.
    * **Contras:** Puede generar más asignaciones de memoria, lo cual tiene una sobrecarga de rendimiento y de GC.

5.  **Variables Locales a Hilo (Thread-Local Storage):**
    * **¿Qué es?** En lugar de compartir una variable, cada hilo tiene su propia copia de la variable.
    * **Uso:** Puedes usar `ThreadLocal<T>` o pasar datos como parámetros a tus métodos paralelos. En `Parallel.For` y `Parallel.ForEach`, hay sobrecargas que permiten el uso de datos locales de hilo (thread-local state) para acumular resultados parciales de forma segura antes de combinarlos.
    * **Pros:** Elimina la necesidad de sincronización para la variable local, ya que no se comparte.
    * **Contras:** Requiere cuidado al combinar los resultados finales.

La clave para evitar condiciones de carrera es identificar el acceso a recursos compartidos y aplicar la estrategia de sincronización más adecuada, pensando en la granularidad y la sobrecarga que introduce.
''',
    'code_example': r'''
// Ejemplo de Evitación de Condiciones de Carrera en C#

using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace RaceConditionPrevention
{
    public class Program
    {
        // --- Escenario con Condición de Carrera (Antipatrón) ---
        private static int _insecureCounter = 0; // Este contador es propenso a condiciones de carrera

        // --- 1. Evitar con 'lock' ---
        private static int _secureCounterWithLock = 0;
        private static readonly object _lockForCounter = new object();

        // --- 2. Evitar con Operaciones Atómicas (Interlocked) ---
        private static int _secureCounterWithInterlocked = 0;

        // --- 3. Evitar con Colecciones Concurrentes ---
        private static ConcurrentBag<int> _threadSafeBag = new ConcurrentBag<int>();

        public static async Task Main(string[] args)
        {
            Console.WriteLine("--- Demostración de Evitación de Condiciones de Carrera ---");

            // --- Condición de Carrera (¡Problema!) ---
            Console.WriteLine("\n--- 1. Demostración de Condición de Carrera (INCORRECTO) ---");
            _insecureCounter = 0;
            List<Task> insecureTasks = new List<Task>();
            for (int i = 0; i < 10000; i++)
            {
                insecureTasks.Add(Task.Run(() => _insecureCounter++)); // _insecureCounter++ NO ES ATÓMICO
            }
            await Task.WhenAll(insecureTasks);
            Console.WriteLine($"Contador final (INSEGURO): {_insecureCounter} (Debería ser 10000, pero no lo será consistentemente)");


            // --- Evitación con 'lock' ---
            Console.WriteLine("\n--- 2. Evitación con 'lock' (CORRECTO) ---");
            _secureCounterWithLock = 0;
            List<Task> lockTasks = new List<Task>();
            for (int i = 0; i < 10000; i++)
            {
                lockTasks.Add(Task.Run(() => IncrementCounterWithLock()));
            }
            await Task.WhenAll(lockTasks);
            Console.WriteLine($"Contador final (SEGURO con lock): {_secureCounterWithLock} (Siempre 10000)");


            // --- Evitación con Operaciones Atómicas (Interlocked) ---
            Console.WriteLine("\n--- 3. Evitación con Interlocked (CORRECTO) ---");
            _secureCounterWithInterlocked = 0;
            List<Task> interlockedTasks = new List<Task>();
            for (int i = 0; i < 10000; i++)
            {
                interlockedTasks.Add(Task.Run(() => Interlocked.Increment(ref _secureCounterWithInterlocked)));
            }
            await Task.WhenAll(interlockedTasks);
            Console.WriteLine($"Contador final (SEGURO con Interlocked): {_secureCounterWithInterlocked} (Siempre 10000)");


            // --- Evitación con Colecciones Concurrentes ---
            Console.WriteLine("\n--- 4. Evitación con ConcurrentBag (CORRECTO) ---");
            _threadSafeBag = new ConcurrentBag<int>();
            List<Task> concurrentBagTasks = new List<Task>();
            for (int i = 0; i < 10000; i++)
            {
                int localI = i; // Capturar la variable para el closure
                concurrentBagTasks.Add(Task.Run(() => _threadSafeBag.Add(localI)));
            }
            await Task.WhenAll(concurrentBagTasks);
            Console.WriteLine($"Elementos en ConcurrentBag (SEGURO): {_threadSafeBag.Count} (Siempre 10000)");
            // Puedes verificar la consistencia de los elementos si lo necesitas:
            // var sortedBag = _threadSafeBag.OrderBy(x => x).ToList();
            // Console.WriteLine($"Primeros 10 elementos ordenados: {string.Join(", ", sortedBag.Take(10))}");


            // --- 5. Uso de Thread-Local State en Parallel.For ---
            Console.WriteLine("\n--- 5. Evitación con Thread-Local State en Parallel.For ---");
            long totalSum = 0;
            Parallel.For(0, 1000000, // Iteraciones
                         () => 0L, // Inicializador de estado local de hilo (partialSum)
                         (i, loopState, partialSum) => // Cuerpo del bucle
                         {
                             partialSum += i; // Modificar solo la suma local del hilo
                             return partialSum;
                         },
                         (partialSum) => // Combinador de resultados finales
                         {
                             // Esta parte se ejecuta secuencialmente para combinar los resultados.
                             Interlocked.Add(ref totalSum, partialSum);
                         });
            Console.WriteLine($"Suma total con Thread-Local State: {totalSum} (Debería ser 499999500000)");
            // Fórmula para la suma de 0 a N-1: N * (N-1) / 2
            // Console.WriteLine($"Suma esperada: {(long)1000000 * (1000000 - 1) / 2}");


            Console.WriteLine("\nPresiona cualquier tecla para salir.");
            Console.ReadKey();
        }

        // Método que incrementa un contador de forma segura con 'lock'
        public static void IncrementCounterWithLock()
        {
            lock (_lockForCounter)
            {
                _secureCounterWithLock++;
            }
        }
    }

    // Ejemplo incorrecto de prevención de condiciones de carrera:
    // 1. Asumir que las operaciones simples son atómicas:
    //    `i++` o `myObject.Property = newValue;` NO son operaciones atómicas en la mayoría de los casos.
    //    Requieren sincronización o el uso de `Interlocked` o colecciones concurrentes.
    // 2. Usar un bloqueo demasiado genérico o en un objeto incorrecto:
    //    `lock (new object())` dentro de un bucle `Parallel.For`. Cada hilo crearía su propio objeto,
    //    lo que resultaría en múltiples bloqueos y ninguna protección real sobre el recurso compartido.
    // 3. Ignorar los resultados de operaciones concurrentes:
    //    Si usas PLINQ o Parallel.For y no capturas adecuadamente las excepciones o no verificas la integridad
    //    de los datos finales, podrías pasar por alto problemas de concurrencia.
    // 4. No distinguir entre operaciones I/O-bound y CPU-bound:
    //    Aplicar soluciones de paralelismo (Thread-pool, PLINQ) a operaciones I/O-bound,
    //    o soluciones asíncronas (`async/await`) a operaciones CPU-bound sin considerar el bloqueo de la CPU.
    '''
  });
}

Future<void> insertPuntonetMidLevel6Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Integración Continua y Despliegue',
    'topic': 'Integración Continua',
    'subtopic': 'Configuración de pipelines de CI/CD',
    'definition': r'''
La configuración de pipelines de CI/CD (Integración Continua/Despliegue Continuo) es la columna vertebral de cualquier desarrollo de software moderno y eficiente. Pensemos por un momento en esto como una línea de ensamblaje automatizada para tu código: en lugar de que cada pieza se mueva manualmente de una estación a otra, todo el proceso, desde el código que escribes hasta su puesta en producción, fluye de forma automática y consistente.

¿Te estás preguntando por qué esto importa? Porque sin un pipeline de CI/CD, el proceso de llevar tu código a producción es lento, propenso a errores humanos y puede generar mucha fricción entre los equipos de desarrollo y operaciones. Imagina la frustración de esperar días o semanas para que tu nueva funcionalidad llegue a los usuarios, solo para descubrir que una integración manual rompió algo. Un pipeline de CI/CD te permite entregar software más rápido, con mayor calidad y menos estrés, detectando problemas temprano y automatizando todo el ciclo de vida de la entrega. Es lo que permite a empresas como Google o Microsoft desplegar cambios múltiples veces al día sin interrupciones.

Vamos a ver de qué se trata todo esto y cómo configurarlos:

Un pipeline de CI/CD es una serie de pasos automatizados por los que pasa tu código, desde que se commite en el repositorio hasta que se despliega en un entorno (prueba, staging, producción). Cada paso tiene un propósito específico:

1.  **Integración Continua (CI):**
    * **Objetivo:** Integrar el código de múltiples desarrolladores en un repositorio central de forma frecuente y automatizada, detectando problemas de integración lo antes posible.
    * **Pasos Típicos en CI:**
        * **Source Code Checkout:** El pipeline obtiene la última versión del código fuente del repositorio (Git, por ejemplo).
        * **Build (Construcción):** Compila el código fuente para generar los artefactos ejecutables (ej. `.dll`s, `.exe`s, paquetes NuGet en .NET). Si la compilación falla, el pipeline se detiene y se notifica al equipo.
        * **Unit Tests (Pruebas Unitarias):** Ejecuta automáticamente todas las pruebas unitarias. Si alguna falla, el build se marca como fallido. Esto es crítico para asegurar la calidad del código a nivel de componentes.
        * **Code Analysis (Análisis de Código Estático):** Herramientas (como SonarQube) analizan el código en busca de bugs, vulnerabilidades, deuda técnica y malas prácticas, sin ejecutarlo.
        * **Artifact Publishing:** Los artefactos compilados y probados se almacenan en un lugar accesible para el siguiente stage (ej. un servidor de artefactos, Azure DevOps Artifacts).

2.  **Despliegue Continuo (CD - Continuous Delivery/Deployment):**
    * **Objetivo:** Tomar los artefactos generados en la CI y desplegarlos en diferentes entornos.
    * **Diferencia entre CD (Delivery) y CD (Deployment):**
        * **Continuous Delivery:** El software está siempre en un estado desplegable, listo para ser liberado a producción *manualmente* con solo presionar un botón.
        * **Continuous Deployment:** El software se despliega *automáticamente* a producción una vez que pasa todas las etapas de prueba automatizadas, sin intervención humana.
    * **Pasos Típicos en CD:**
        * **Deployment to Test/Staging Environment:** Los artefactos se despliegan en un entorno que simula la producción.
        * **Integration/Acceptance Tests (Pruebas de Integración/Aceptación):** Se ejecutan pruebas automatizadas más completas que validan la interacción entre componentes y la funcionalidad de extremo a extremo en el entorno desplegado.
        * **Manual Approval (Opcional):** En Continuous Delivery, o en entornos de producción muy críticos, puede haber un paso manual donde una persona aprueba el despliegue a producción.
        * **Deployment to Production:** Los artefactos se despliegan finalmente en el entorno de producción.
        * **Post-Deployment Verification:** Pequeñas pruebas para asegurar que la aplicación arrancó correctamente y responde después del despliegue.

**Herramientas para configurar pipelines:**
* **Azure DevOps Pipelines:** Una solución completa de Microsoft que incluye repositorios de código, boards, pipelines CI/CD, artefactos, etc.
* **GitHub Actions:** Integrado directamente en GitHub, permite definir flujos de trabajo de CI/CD directamente en tu repositorio.
* **Jenkins:** Un servidor de automatización de código abierto muy popular y flexible, aunque requiere más configuración manual.
* **GitLab CI/CD:** Integrado en GitLab, similar a GitHub Actions.
* **TeamCity (JetBrains):** Otro servidor de CI/CD popular, con una interfaz de usuario amigable.

Configurar un pipeline implica definir estos pasos en un archivo de configuración (YAML es el formato más común hoy en día, ej. `azure-pipelines.yml` o `.github/workflows/*.yml`), que se guarda junto a tu código. Esto permite que el pipeline sea versionado y tratado como código ("Pipeline as Code").

En resumen, los pipelines de CI/CD son esenciales para una entrega de software rápida, fiable y de alta calidad, transformando el proceso de desarrollo en una maquinaria bien engrasada.
''',
    'code_example': r'''
# Ejemplo Conceptual de un pipeline de CI/CD para una aplicación .NET Core
# Este es un archivo YAML (por ejemplo, .azure-pipelines.yml para Azure DevOps o .github/workflows/main.yml para GitHub Actions)
# No es código C# ejecutable, sino la definición de la automatización.

# Este archivo debería estar en la raíz de tu repositorio (ej. azure-pipelines.yml)

trigger:
- main # El pipeline se ejecutará cada vez que haya un push a la rama 'main'

pr:
- main # El pipeline también se ejecutará para cada Pull Request a la rama 'main'

variables:
  buildConfiguration: 'Release' # Variable para la configuración de build
  dotNetSdkVersion: '8.x' # Versión del SDK de .NET a usar

jobs:
- job: BuildAndTest # Nombre del primer trabajo: Construir y Probar
  displayName: 'Build and Run Unit Tests' # Nombre visible en la UI

  pool:
    vmImage: 'windows-latest' # O 'ubuntu-latest', dependiendo de tus necesidades

  steps:
  - task: UseDotNet@2 # Tarea para instalar el SDK de .NET
    displayName: 'Install .NET SDK'
    inputs:
      version: $(dotNetSdkVersion)

  - task: DotNetCoreCLI@2 # Tarea para restaurar paquetes NuGet
    displayName: 'Restore NuGet packages'
    inputs:
      command: 'restore'
      projects: '**/*.csproj' # Busca todos los archivos .csproj

  - task: DotNetCoreCLI@2 # Tarea para construir la aplicación
    displayName: 'Build application'
    inputs:
      command: 'build'
      projects: '**/*.csproj'
      arguments: '--configuration $(buildConfiguration)'

  - task: DotNetCoreCLI@2 # Tarea para ejecutar las pruebas unitarias
    displayName: 'Run Unit Tests'
    inputs:
      command: 'test'
      projects: '**/*Tests.csproj' # Asume que tus proyectos de pruebas terminan en 'Tests.csproj'
      arguments: '--configuration $(buildConfiguration) --no-build --logger trx --results-directory $(Build.SourcesDirectory)/TestResults'
      publishTestResults: true # Publicar los resultados de las pruebas

  - task: PublishBuildArtifacts@1 # Tarea para publicar los artefactos (ej. el ejecutable o la app web)
    displayName: 'Publish Build Artifacts'
    inputs:
      pathToPublish: '$(Build.SourcesDirectory)/src/YourWebApp/bin/$(buildConfiguration)/net8.0/publish' # Ruta a los archivos publicados de tu app
      artifactName: 'drop' # Nombre del artefacto

- job: DeployToDev # Nombre del segundo trabajo: Desplegar a Desarrollo
  displayName: 'Deploy to Development Environment'
  dependsOn: BuildAndTest # Este trabajo depende del éxito del trabajo 'BuildAndTest'
  condition: succeeded('BuildAndTest') # Solo se ejecuta si 'BuildAndTest' fue exitoso

  pool:
    vmImage: 'windows-latest'

  steps:
  - task: DownloadBuildArtifacts@0 # Descargar los artefactos del trabajo anterior
    displayName: 'Download Build Artifacts'
    inputs:
      artifactName: 'drop'
      downloadPath: '$(System.ArtifactsDirectory)'

  - task: AzureWebApp@1 # Tarea para desplegar a Azure App Service (ejemplo)
    displayName: 'Deploy Azure Web App'
    inputs:
      azureSubscription: 'Your Azure Subscription' # Conexión de servicio de Azure
      appName: 'your-dev-webapp-name' # Nombre de tu App Service en Azure (desarrollo)
      package: '$(System.ArtifactsDirectory)/drop' # Ruta al paquete a desplegar

  - script: echo "Deployed to Development Environment successfully!" # Un script simple de confirmación
    displayName: 'Deployment Confirmation'

# Este es un pipeline simplificado. Un pipeline real podría incluir:
# - Pasos para análisis de seguridad (SAST/DAST)
# - Despliegues a múltiples entornos (Staging, Producción) con aprobaciones manuales
# - Pruebas de integración, rendimiento o UI automatizadas después del despliegue
# - Notificaciones (Slack, Teams, Email)

# Ejemplo de un escenario INCORRECTO en un pipeline de CI/CD:
# 1. No ejecutar pruebas unitarias:
#    Si omites la tarea de `dotnet test`, podrías desplegar código con errores básicos.
# 2. Desplegar directamente a producción sin pasar por un entorno de staging:
#    Esto es "Continuous Deployment" puro, que es muy agresivo y solo apto para equipos muy maduros con 100% de confianza en sus pruebas.
#    Para la mayoría, "Continuous Delivery" (despliegue manual a producción) es más seguro.
# 3. No versionar el pipeline:
#    Si tu definición del pipeline no está en el control de versiones junto con tu código (ej. YAML en Git),
#    es difícil auditar cambios o revertir problemas.
# 4. Tener pasos manuales excesivos:
#    Si muchos pasos importantes (compilación, pruebas) son manuales, estás perdiendo los beneficios de la CI/CD.
#    El objetivo es la automatización.
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Integración Continua y Despliegue',
    'topic': 'Integración Continua',
    'subtopic': 'Automatización de pruebas y builds',
    'definition': r'''
La automatización de pruebas y builds es el corazón de la Integración Continua (CI). Es la garantía de que tu código no solo compila, sino que también funciona como se espera, y que este proceso se ejecuta de forma consistente y sin intervención humana. Pensemos por un momento en esto como tener un robot QA y un robot constructor: cada vez que el equipo hace un cambio, estos robots se activan, construyen el nuevo software y lo prueban exhaustivamente en cuestión de minutos, avisando de inmediato si algo falla.

¿Te estás preguntando por qué esto importa? Porque hacer builds y pruebas de forma manual es tedioso, consume mucho tiempo y es propenso a errores. Un desarrollador podría olvidar ejecutar una prueba, usar una configuración incorrecta para el build, o simplemente no tener el entorno adecuado. Todo esto lleva a que los errores se detecten tarde, justo antes del despliegue o, peor aún, en producción. Automatizar estos procesos significa que los errores se identifican casi al instante de ser introducidos, cuando son más baratos y fáciles de corregir. Además, libera a los desarrolladores de tareas repetitivas para que se enfoquen en construir nuevas funcionalidades. Empresas como Netflix dependen en gran medida de esta automatización para mantener la calidad de su servicio mientras despliegan continuamente.

Vamos a ver de qué se trata todo esto:

1.  **Automatización de Builds (Construcción):**
    * **Propósito:** Transformar el código fuente en artefactos ejecutables o desplegables (binarios, paquetes, etc.).
    * **Proceso:**
        * **Obtención de Código:** El sistema de CI/CD (ej. Azure DevOps, Jenkins) clona la última versión del código del repositorio.
        * **Restauración de Dependencias:** Descarga todas las librerías y paquetes externos que necesita el proyecto (ej. paquetes NuGet en .NET) para que el build sea reproducible.
        * **Compilación:** Convierte el código fuente (ej. C#) en código de máquina o intermedio (ej. MSIL para .NET).
        * **Generación de Artefactos:** Empaqueta el resultado de la compilación en un formato listo para el despliegue (ej. un archivo ZIP con la aplicación web, un paquete NuGet, un contenedor Docker).
    * **Herramientas en .NET:** El `dotnet CLI` (`dotnet build`, `dotnet restore`, `dotnet publish`) es la herramienta principal para automatizar builds. En pipelines, se usan tareas o comandos que invocan este CLI.

2.  **Automatización de Pruebas:**
    * **Propósito:** Ejecutar pruebas de software de forma automática para verificar la calidad y el comportamiento esperado del código.
    * **Tipos de Pruebas Automatizadas en CI:**
        * **Pruebas Unitarias:** Son las más rápidas y de bajo nivel. Verifican el funcionamiento de unidades individuales de código (métodos, clases) de forma aislada. Son la primera línea de defensa. Se ejecutan en cada cambio de código.
        * **Pruebas de Integración:** Verifican cómo interactúan entre sí los diferentes módulos o servicios de la aplicación (ej. tu aplicación con la base de datos, o con un servicio externo). Son un poco más lentas que las unitarias.
        * **Pruebas de Aceptación/Funcionales:** Validan que la aplicación cumple con los requisitos del negocio desde la perspectiva del usuario. Pueden simular interacciones de usuario (ej. Selenium para UI web, herramientas de API testing para APIs). Suelen ejecutarse en un entorno de prueba separado.
    * **Proceso:** Después de un build exitoso, el pipeline ejecuta las pruebas designadas. Si alguna prueba falla, el pipeline se detiene y notifica, indicando un problema en el código o en la configuración.
    * **Herramientas en .NET:**
        * **Frameworks de Pruebas:** xUnit, NUnit, MSTest (para escribir las pruebas).
        * **Ejecutores de Pruebas:** El `dotnet CLI` (`dotnet test`) puede ejecutar pruebas de cualquiera de estos frameworks.
        * **Herramientas de Cobertura de Código:** Reportan qué porcentaje del código está cubierto por pruebas (ej. Coverlet, AltCover).

**Beneficios clave de la automatización:**

* **Detección Temprana de Errores:** Los problemas se encuentran minutos después de ser introducidos, no días o semanas.
* **Feedback Rápido:** Los desarrolladores saben casi de inmediato si su cambio rompió algo.
* **Calidad Consistente:** Asegura que cada versión del software pase por el mismo proceso de validación.
* **Reducción de Errores Humanos:** Elimina la posibilidad de errores manuales en la compilación y prueba.
* **Mayor Confianza en el Código:** El equipo tiene más confianza en que el software es estable y funciona correctamente.

La automatización de builds y pruebas es un pilar fundamental para lograr la calidad y velocidad que el desarrollo de software moderno exige.
''',
    'code_example': r'''
# Ejemplo Conceptual de cómo se vería la automatización de tests y builds
# en un pipeline YAML (ej. para Azure DevOps o GitHub Actions) para .NET.

# Los detalles específicos de las tareas pueden variar ligeramente entre diferentes plataformas de CI/CD.

trigger:
- main # El pipeline se activa con cada push a la rama 'main'

variables:
  buildConfiguration: 'Release' # Configuración de build: Release (optimizada, sin símbolos de depuración excesivos)
  dotNetSdkVersion: '8.x' # Versión del SDK de .NET a utilizar

jobs:
- job: BuildAndTest # Definición de un trabajo (job) en el pipeline
  displayName: 'Build and Automate Tests' # Nombre descriptivo para el trabajo

  pool:
    vmImage: 'windows-latest' # O 'ubuntu-latest' para un agente Linux

  steps:
  - task: UseDotNet@2 # Tarea para instalar la versión específica del SDK de .NET
    displayName: 'Install .NET SDK'
    inputs:
      version: $(dotNetSdkVersion)
      #includePreviewVersions: true # Descomentar si necesitas SDKs de pre-lanzamiento

  - task: DotNetCoreCLI@2 # Tarea para restaurar todos los paquetes NuGet del proyecto
    displayName: 'Restore NuGet packages'
    inputs:
      command: 'restore'
      projects: '**/*.csproj' # Busca y restaura paquetes para todos los proyectos .csproj en el repositorio

  - task: DotNetCoreCLI@2 # Tarea para construir el proyecto
    displayName: 'Build application'
    inputs:
      command: 'build'
      projects: '**/*.csproj' # Compila todos los proyectos
      arguments: '--configuration $(buildConfiguration) --no-restore' # --no-restore para no restaurar de nuevo
      #publishWebProjects: false # Opcional: para builds que no son de web

  - task: DotNetCoreCLI@2 # Tarea clave para la automatización de pruebas unitarias
    displayName: 'Run Unit Tests and publish results'
    inputs:
      command: 'test'
      projects: '**/*Tests.csproj' # PATRÓN: Ejecuta pruebas en cualquier proyecto .csproj que termine en 'Tests'
      arguments: '--configuration $(buildConfiguration) --no-build --logger trx --results-directory $(Build.SourcesDirectory)/TestResults'
      # --no-build: No compila de nuevo, asume que el paso de 'build' ya lo hizo.
      # --logger trx --results-directory: Genera un archivo de resultados de pruebas en formato TRX.
      publishTestResults: true # Publica los resultados de pruebas en la interfaz de CI/CD

  - task: DotNetCoreCLI@2 # Tarea para publicar la aplicación (preparar para despliegue)
    displayName: 'Publish Application for Deployment'
    inputs:
      command: 'publish'
      publishWebProjects: true # Publica proyectos web si los tienes
      arguments: '--configuration $(buildConfiguration) --output $(Build.ArtifactStagingDirectory)' # Salida al directorio de artefactos
      zipAfterPublish: true # Empaqueta el resultado en un archivo zip (común para web apps)

  - task: PublishBuildArtifacts@1 # Tarea para subir los artefactos del build (ej. el zip de la app web)
    displayName: 'Upload Build Artifacts'
    inputs:
      pathToPublish: '$(Build.ArtifactStagingDirectory)' # Ruta donde se generaron los artefactos
      artifactName: 'drop' # Nombre del artefacto, se usará para descargarlo en el stage de despliegue
      publishLocation: 'Container' # Publica al contenedor interno del pipeline

# Este es un flujo básico. Un pipeline más avanzado podría incluir:
# - Pasos para ejecutar pruebas de integración (después del despliegue a un entorno de prueba).
# - Tareas para análisis de código estático (ej. SonarCloudScan).
# - Generación de documentación.
# - Construcción de imágenes Docker si tu app es contenerizada.

# Ejemplo de un escenario INCORRECTO en la automatización:
# 1. Ejecutar pruebas unitarias en el entorno de producción:
#    Las pruebas unitarias deben ejecutarse como parte del proceso de build y CI, antes del despliegue.
#    Ejecutarlas en producción es ineficiente y puede causar efectos secundarios no deseados.
# 2. No tener pruebas automatizadas:
#    Simplemente compilar el código sin un conjunto de pruebas automatizadas no garantiza la calidad.
#    Los builds pasan, pero el software puede estar lleno de bugs.
# 3. Pruebas que dependen de la red o servicios externos sin mockear/simular:
#    Esto hace que las pruebas sean lentas, inestables ("flaky tests") y difíciles de ejecutar en un pipeline de CI.
#    Las pruebas unitarias deben ser independientes y rápidas.
# 4. No publicar los resultados de las pruebas:
#    Si las pruebas se ejecutan pero sus resultados no son visibles en la interfaz del CI/CD, es difícil ver fallos y su contexto.
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Integración Continua y Despliegue',
    'topic': 'Integración Continua',
    'subtopic': 'Uso de herramientas como Azure DevOps',
    'definition': r'''
El uso de herramientas como Azure DevOps es fundamental para implementar la Integración Continua (CI) y el Despliegue Continuo (CD) de manera efectiva, especialmente en el ecosistema .NET. Pensemos por un momento en esto como tener una navaja suiza para el desarrollo de software: en lugar de usar herramientas separadas para el código, la gestión de proyectos, los pipelines y los despliegues, tienes todo integrado en un solo lugar.

¿Te estás preguntando por qué esto importa? Porque el desarrollo de software moderno es complejo y requiere coordinación. Si tu equipo usa un sistema para el código, otro para las tareas, uno más para la CI/CD y otro para los artefactos, la comunicación se rompe, la eficiencia disminuye y la visibilidad es escasa. Azure DevOps resuelve esto al ofrecer una plataforma unificada que cubre todo el ciclo de vida de desarrollo de software (ALM - Application Lifecycle Management). Esto significa menos tiempo configurando y más tiempo desarrollando, una entrega más rápida y una mejor colaboración en equipo. Es la elección principal para muchas empresas que trabajan con tecnologías de Microsoft y más allá.

Vamos a ver de qué se trata todo esto y cómo Azure DevOps te ayuda:

Azure DevOps es una suite de servicios de Microsoft que proporciona herramientas para la planificación, desarrollo, pruebas y despliegue de aplicaciones, desde el código hasta la producción. Está compuesto por varios servicios clave:

1.  **Azure Boards:**
    * **¿Para qué sirve?** Para la planificación y el seguimiento del trabajo. Piensa en esto como tu tablero de tareas y gestión de proyectos.
    * **Funcionalidades:** Permite gestionar backlogs, sprints, incidencias, características, historias de usuario. Soporta metodologías Agile (Scrum, Kanban) y Waterfall. Puedes asignar tareas, priorizarlas y seguir su progreso.

2.  **Azure Repos:**
    * **¿Para qué sirve?** Para la gestión de código fuente.
    * **Funcionalidades:** Proporciona repositorios de Git ilimitados y gratuitos, o también repositorios de Team Foundation Version Control (TFVC). Permite la colaboración en código, solicitudes de extracción (Pull Requests), revisiones de código y políticas de rama.

3.  **Azure Pipelines:**
    * **¿Para qué sirve?** El corazón de la CI/CD. Aquí es donde configuras tus flujos de trabajo automatizados.
    * **Funcionalidades:**
        * **Integración Continua (CI):** Automatiza la compilación, pruebas unitarias y análisis de código en cada cambio de código.
        * **Despliegue Continuo (CD):** Automatiza el despliegue de tus aplicaciones a diferentes entornos (desarrollo, pruebas, producción).
        * **Multi-plataforma:** Soporta aplicaciones .NET, Java, Python, Node.js, etc., y puede desplegar en Azure, AWS, GCP, on-premise, y contenedores (Docker, Kubernetes).
        * **YAML Pipelines:** Permite definir tus pipelines como código (YAML), versionándolos junto a tu aplicación.
        * **Agentes de Build:** Puedes usar agentes alojados por Microsoft o configurar tus propios agentes privados.

4.  **Azure Test Plans:**
    * **¿Para qué sirve?** Para la gestión de pruebas manuales y exploratorias.
    * **Funcionalidades:** Permite crear y ejecutar planes de prueba, suites de prueba, casos de prueba. También puedes realizar pruebas exploratorias y de usabilidad. Se integra con Azure Pipelines para pruebas automatizadas.

5.  **Azure Artifacts:**
    * **¿Para qué sirve?** Para gestionar paquetes de software (artefactos).
    * **Funcionalidades:** Proporciona feeds de paquetes para NuGet (para .NET), npm, Maven, Python, etc. Puedes publicar tus propios paquetes o consumir paquetes de fuentes externas, controlando las versiones y dependencias.

**Cómo Azure DevOps facilita la CI/CD en .NET:**
* **Integración Nativas:** Está diseñado para .NET, con tareas predefinidas para `dotnet build`, `dotnet test`, `dotnet publish`, y despliegues a Azure App Services, Azure Kubernetes Service, etc.
* **Plantillas:** Ofrece plantillas de pipelines preconfiguradas para diferentes tipos de proyectos .NET.
* **Extensiones del Marketplace:** Puedes extender su funcionalidad con miles de extensiones de la comunidad o de terceros.

En resumen, Azure DevOps es una plataforma integral que te permite centralizar y automatizar todo el proceso de desarrollo y entrega de software, mejorando drásticamente la eficiencia, calidad y colaboración en tus proyectos .NET y más allá.
''',
    'code_example': r'''
# No hay "código C#" para Azure DevOps Pipelines directamente.
# El "código" aquí es la definición del pipeline en formato YAML,
# que es el lenguaje que Azure Pipelines entiende.

# Este es un ejemplo simplificado de un archivo azure-pipelines.yml
# que se almacenaría en la raíz de tu repositorio de código fuente.

trigger:
- main # El pipeline se ejecutará automáticamente con cada push a la rama 'main'.

pr:
- main # El pipeline también se ejecutará para cada Pull Request a la rama 'main'.

variables:
  buildConfiguration: 'Release' # Variable global para la configuración de la compilación.
  # Puedes añadir otras variables aquí, como 'azureRmServiceConnection' para la conexión de servicio.

pool:
  vmImage: 'windows-latest' # Utiliza un agente de compilación de Windows proporcionado por Microsoft.
                            # Para .NET Core, también puedes usar 'ubuntu-latest'.

stages: # Un pipeline puede tener múltiples etapas (stages) para organizar trabajos (jobs).
- stage: BuildAndTestStage
  displayName: 'Build and Run Tests'
  jobs:
  - job: BuildJob
    displayName: 'Build .NET Application'
    steps:
    - task: UseDotNet@2 # Tarea para asegurar que la versión correcta del SDK de .NET esté instalada.
      displayName: 'Install .NET SDK'
      inputs:
        version: '8.x' # Especifica la versión del SDK de .NET que necesitas.

    - task: DotNetCoreCLI@2 # Tarea para restaurar las dependencias de NuGet.
      displayName: 'Restore NuGet packages'
      inputs:
        command: 'restore'
        projects: '**/*.csproj' # Busca todos los archivos .csproj en el repositorio.

    - task: DotNetCoreCLI@2 # Tarea para compilar la aplicación.
      displayName: 'Build Project'
      inputs:
        command: 'build'
        projects: '**/*.csproj'
        arguments: '--configuration $(buildConfiguration) --no-restore' # Compila en modo Release, sin restaurar de nuevo.

    - task: DotNetCoreCLI@2 # Tarea para ejecutar las pruebas unitarias y publicar sus resultados.
      displayName: 'Run Unit Tests and Publish Results'
      inputs:
        command: 'test'
        projects: '**/*Tests.csproj' # Ejecuta pruebas en proyectos que terminan en 'Tests.csproj'.
        arguments: '--configuration $(buildConfiguration) --no-build --logger trx --results-directory $(Build.SourcesDirectory)/TestResults'
        publishTestResults: true # Esta opción integra los resultados en los reportes de Azure DevOps.

    - task: DotNetCoreCLI@2 # Tarea para publicar la aplicación (prepararla para el despliegue).
      displayName: 'Publish Application'
      inputs:
        command: 'publish'
        publishWebProjects: true # Si es una aplicación web, publica los archivos necesarios para el hosting.
        arguments: '--configuration $(buildConfiguration) --output $(Build.ArtifactStagingDirectory)'
        zipAfterPublish: true # Comprime los archivos publicados en un ZIP, útil para despliegues web.

    - task: PublishBuildArtifacts@1 # Tarea para cargar los artefactos compilados y publicados.
      displayName: 'Upload Build Artifacts'
      inputs:
        pathToPublish: '$(Build.ArtifactStagingDirectory)' # La ruta donde se encuentran los archivos a subir.
        artifactName: 'drop' # Nombre del artefacto, que se podrá descargar en etapas posteriores del pipeline.
        publishLocation: 'Container' # Publica los artefactos en el almacenamiento interno de Azure DevOps.

- stage: DeployToDevStage # Segunda etapa: Despliegue. Solo se ejecuta si la etapa anterior fue exitosa.
  displayName: 'Deploy to Development'
  dependsOn: BuildAndTestStage # Dependencia para que esta etapa solo se ejecute si la anterior finalizó con éxito.
  condition: succeeded('BuildAndTestStage') # Condición explícita para que se ejecute solo si la etapa anterior tuvo éxito.

  jobs:
  - deployment: DeployDevApp # Un "deployment job" para gestionar el despliegue.
    displayName: 'Deploy Web App to Dev'
    environment: 'Development' # Nombre del entorno en Azure DevOps (para trazabilidad y seguridad).
    strategy:
      runOnce:
        deploy:
          steps:
          - task: DownloadBuildArtifacts@0 # Descarga los artefactos generados en la etapa de build.
            displayName: 'Download Published Artifacts'
            inputs:
              artifactName: 'drop'
              downloadPath: '$(System.ArtifactsDirectory)' # Descarga al directorio de artefactos del agente.

          - task: AzureWebApp@1 # Tarea para desplegar una aplicación web a Azure App Service.
            displayName: 'Deploy to Azure App Service'
            inputs:
              azureSubscription: 'Your-Azure-Service-Connection-Name' # Nombre de la conexión de servicio de Azure configurada.
              appName: 'your-dev-webapp-name' # Nombre de tu Azure App Service de desarrollo.
              package: '$(System.ArtifactsDirectory)/drop/**/*.zip' # Ruta al archivo ZIP de tu aplicación.
              # deploymentMethod: 'zipDeploy' # Método de despliegue, zipDeploy es común y eficiente.

          - script: echo "Application deployed to Development environment."
            displayName: 'Deployment Confirmation'

# Este es un pipeline básico. Azure DevOps permite configuraciones mucho más avanzadas como:
# - Aprobaciones manuales antes de desplegar a producción.
# - Despliegues canary, blue-green, o rolling updates.
# - Integración con herramientas de monitoreo (Application Insights).
# - Escaneo de seguridad (SAST/DAST).
# - Integración con Azure Key Vault para secretos.

# Ejemplo INCORRECTO en el uso de Azure DevOps:
# 1. Credenciales de producción directamente en el YAML:
#    Nunca pongas secretos (claves API, contraseñas) directamente en el archivo YAML.
#    Usa variables seguras de pipeline o Azure Key Vault.
# 2. No usar dependencias entre jobs/stages:
#    Si los trabajos no tienen dependencias claras, podrían ejecutarse en un orden incorrecto o antes de que los artefactos estén listos.
#    `dependsOn` y `condition` son cruciales.
# 3. Demasiadas tareas manuales:
#    Si todavía estás haciendo pasos como "copiar archivos manualmente al servidor" o "ejecutar pruebas a mano",
#    no estás aprovechando el potencial de automatización de Azure DevOps.
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Integración Continua y Despliegue',
    'topic': 'Despliegue de Aplicaciones',
    'subtopic': 'Despliegue en servidores IIS',
    'definition': r'''
El despliegue de aplicaciones en servidores IIS (Internet Information Services) es un paso fundamental si estás trabajando con aplicaciones web de .NET en entornos Windows. Pensemos por un momento en IIS como el "anfitrión" o el "servidor de eventos" para tus aplicaciones web: es el encargado de recibir las solicitudes de los usuarios a través de internet y dirigirlas a tu aplicación para que las procese.

¿Te estás preguntando por qué esto importa? Porque aunque desarrolles una aplicación web espectacular, si no sabes cómo ponerla en línea para que tus usuarios la accedan, tu trabajo no estará completo. IIS es una pieza clave en el ecosistema de Microsoft para alojar aplicaciones web ASP.NET (tanto Framework como Core), y entender cómo desplegar en él te asegura que tu aplicación esté disponible, sea performante y segura en un entorno de producción basado en Windows. Muchas empresas aún utilizan IIS para sus infraestructuras web.

Vamos a ver de qué se trata todo esto y cómo se despliega en IIS:

IIS es un servidor web flexible, seguro y administrable de Microsoft, que se incluye con los sistemas operativos Windows Server y también está disponible en Windows para desarrollo. Permite alojar sitios web, aplicaciones web y servicios web.

**Pasos Clave para el Despliegue en IIS:**

1.  **Publicar tu Aplicación:**
    * Antes de desplegar, necesitas "publicar" tu aplicación. Esto significa compilarla y empaquetarla en un formato que IIS pueda entender.
    * En Visual Studio: Haz clic derecho en tu proyecto web y selecciona "Publicar...". Esto creará un conjunto de archivos listos para el despliegue (HTML, CSS, JavaScript, DLLs, etc.) en una carpeta.
    * Desde la línea de comandos: Puedes usar `dotnet publish` para aplicaciones .NET Core/5+ o `MSBuild` para .NET Framework.

2.  **Preparar el Servidor IIS:**
    * **Instalar IIS:** Asegúrate de que IIS esté instalado en el servidor Windows. Esto se hace a través de "Activar o desactivar las características de Windows" (Turn Windows features on or off) en el Panel de Control, o usando Server Manager en Windows Server.
    * **Habilitar Componentes de ASP.NET:** Para ASP.NET Framework, necesitas habilitar los componentes específicos de ASP.NET. Para ASP.NET Core, necesitarás instalar el "ASP.NET Core Hosting Bundle", que incluye el módulo de IIS y el runtime de .NET Core.

3.  **Configurar un Sitio Web o una Aplicación en IIS:**
    * **Crear un Nuevo Sitio Web:**
        * Abre el "Administrador de Internet Information Services (IIS)".
        * En el panel "Conexiones", expande el nodo de tu servidor y luego "Sitios".
        * Haz clic derecho en "Sitios" y selecciona "Agregar sitio web...".
        * Proporciona un nombre de sitio, la ruta física a la carpeta donde publicaste tu aplicación, y configura los "Enlaces" (Bindings) para especificar cómo los usuarios accederán a tu sitio (ej. puerto 80 para HTTP, un nombre de host como `www.tusitio.com`).
    * **Crear una Aplicación dentro de un Sitio Existente:**
        * Si tu aplicación es una sub-aplicación de un sitio existente (ej. `www.tusitio.com/mi_app`), puedes hacer clic derecho en el sitio principal y seleccionar "Agregar aplicación...".

4.  **Configuración del Pool de Aplicaciones (Application Pool):**
    * Cada sitio o aplicación en IIS se ejecuta en un "Application Pool". Este es un proceso de trabajo que aísla tu aplicación de otras en el mismo servidor.
    * Asegúrate de que el Application Pool esté configurado para la versión correcta de .NET:
        * Para ASP.NET Framework: Establece la versión de .NET CLR (ej. .NET CLR v4.0).
        * Para ASP.NET Core: No se selecciona una versión de CLR; en su lugar, el Application Pool debe estar configurado para "Sin código administrado" (No Managed Code) y el "ASP.NET Core Hosting Bundle" se encarga de ejecutar tu aplicación.
    * También puedes configurar la identidad del Application Pool (la cuenta de usuario bajo la cual se ejecuta el proceso) para controlar los permisos de acceso a recursos.

5.  **Permisos de Archivo:**
    * Asegúrate de que la identidad del Application Pool tenga permisos de "Lectura" en la carpeta donde publicaste tu aplicación. Si tu aplicación necesita escribir archivos (ej. logs, uploads), también necesitará permisos de "Escritura" en esas carpetas específicas.

**Consideraciones Adicionales:**

* **HTTPS:** Configura enlaces HTTPS e instala un certificado SSL/TLS para comunicaciones seguras.
* **Web.config:** El archivo `web.config` (o la configuración que se genera para .NET Core) es crucial para la configuración de IIS.
* **Despliegue Continuo:** Para escenarios de CI/CD, puedes automatizar estos pasos usando tareas de Azure DevOps Pipelines, Jenkins, u otras herramientas que interactúen con IIS vía Web Deploy o scripting.

Dominar el despliegue en IIS es una habilidad esencial para cualquier desarrollador .NET que trabaje con aplicaciones web en entornos de producción Windows.
''',
    'code_example': r'''
# Este ejemplo no es código C# ejecutable, sino un enfoque conceptual y
# comandos o configuraciones que usarías para el despliegue en IIS.

# --- 1. Publicar la aplicación .NET (usando el CLI de .NET Core/5+) ---
# Abre tu terminal (CMD, PowerShell o Bash) en la raíz de tu proyecto web
# y ejecuta el siguiente comando:
# C:\path\to\YourWebApp> dotnet publish -c Release -o C:\inetpub\wwwroot\YourWebAppPublished

# Explicación del comando:
# - `dotnet publish`: Comando para empaquetar la aplicación para el despliegue.
# - `-c Release`: Especifica la configuración de build 'Release' (optimizado, sin símbolos de depuración).
# - `-o C:\inetpub\wwwroot\YourWebAppPublished`: Directorio de salida donde se copiarán los archivos publicados.
#   `C:\inetpub\wwwroot` es el directorio por defecto de IIS para sitios web.

# Para una aplicación ASP.NET Framework (más antiguo):
# Usarías Visual Studio (Publicar...) o MSBuild desde la línea de comandos.
# MSBuild YourWebApp.csproj /p:DeployOnBuild=true /p:PublishProfile="FolderProfile"


# --- 2. Preparación del servidor IIS (Comandos de PowerShell) ---

# Instalación de IIS y componentes necesarios (ejecutar como Administrador)
# Instala IIS Base:
# Install-WindowsFeature -Name Web-Server -IncludeManagementTools

# Instala componentes ASP.NET (para .NET Framework):
# Install-WindowsFeature -Name Web-Asp-Net45 # O la versión que necesites

# Para ASP.NET Core/5+: Instalar el Hosting Bundle desde el sitio de Microsoft.
# Descarga e instala 'ASP.NET Core Hosting Bundle'
# (Busca en Google: "ASP.NET Core Hosting Bundle download")
# Esto instala el .NET Runtime y el módulo de ASP.NET Core para IIS.


# --- 3. Configuración de un Nuevo Sitio Web en IIS (PowerShell) ---
# Ejecutar como Administrador
# Importa el módulo de WebAdministration
# Import-Module WebAdministration

# Ruta física donde publicaste tu aplicación
# $appPhysicalPath = "C:\inetpub\wwwroot\YourWebAppPublished"
# $siteName = "MyDotNetWebApp"
# $bindingInfo = "*:80:www.yourdomain.com" # O "*:80:" para cualquier hostname en el puerto 80

# Crear un nuevo Application Pool
# New-WebAppPool -Name "$siteName AppPool" -NoManagedCode # Para .NET Core, "No Managed Code"
# Para .NET Framework: New-WebAppPool -Name "$siteName AppPool" -ManagedRuntimeVersion "v4.0"

# Crear el sitio web
# New-Website -Name $siteName -PhysicalPath $appPhysicalPath -Port 80 -HostHeader "www.yourdomain.com" -ApplicationPool "$siteName AppPool"

# Si necesitas un enlace HTTPS (requiere un certificado SSL/TLS instalado y configurado):
# New-WebBinding -Name $siteName -Protocol "https" -Port 443 -HostHeader "www.yourdomain.com" -SslFlags 1


# --- 4. Configuración de Permisos de Carpeta (PowerShell) ---
# Asegura que la cuenta del Application Pool tenga permisos de lectura
# La cuenta de usuario predeterminada para App Pools es IIS_IUSRS
# $Acl = Get-Acl $appPhysicalPath
# $Acl.SetAccessRuleProtection($true, $false) # Deshabilitar herencia de permisos
# $Rule = New-Object System.Security.AccessControl.FileSystemAccessRule("IIS_IUSRS", "ReadAndExecute", "ContainerInherit, ObjectInherit", "None", "Allow")
# $Acl.AddAccessRule($Rule)
# Set-Acl $appPhysicalPath $Acl

# Si tu aplicación necesita escribir en alguna subcarpeta (ej. logs):
# $LogFolderPath = "C:\inetpub\wwwroot\YourWebAppPublished\Logs"
# $AclLog = Get-Acl $LogFolderPath
# $AclLog.SetAccessRuleProtection($true, $false)
# $RuleLog = New-Object System.Security.AccessControl.FileSystemAccessRule("IIS_IUSRS", "Modify", "ContainerInherit, ObjectInherit", "None", "Allow")
# $AclLog.AddAccessRule($RuleLog)
# Set-Acl $LogFolderPath $AclLog


# --- Ejemplo INCORRECTO de despliegue en IIS: ---
# 1. No instalar el "ASP.NET Core Hosting Bundle" para apps .NET Core:
#    Si intentas desplegar una app .NET Core sin este bundle, IIS no sabrá cómo iniciar tu aplicación,
#    y obtendrás errores 500 o tu sitio no funcionará.
# 2. Configurar el Application Pool con la versión de .NET CLR incorrecta:
#    Para .NET Core, configurar el App Pool con "No Managed Code" es CRÍTICO. Si pones v4.0, fallará.
#    Para .NET Framework, si pones v2.0 o "No Managed Code", también fallará.
# 3. Permisos de archivo insuficientes:
#    Si la cuenta del Application Pool no tiene permisos de lectura sobre la carpeta de tu aplicación,
#    IIS no podrá cargar los archivos, resultando en errores de "Access Denied".
#    Si tu app escribe logs o archivos y no tiene permisos de escritura, fallará en tiempo de ejecución.
# 4. Desplegar archivos directamente sin "publicar":
#    Copiar los archivos del proyecto de Visual Studio directamente a IIS sin usar el proceso de "Publicar"
#    puede resultar en un sitio que no funciona, porque no se incluyen todas las DLLs necesarias, archivos de configuración, etc.
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Integración Continua y Despliegue',
    'topic': 'Despliegue de Aplicaciones',
    'subtopic': 'Configuración de entornos de staging y producción',
    'definition': r'''
Configurar entornos de staging y producción es una práctica estándar y una necesidad absoluta en el desarrollo de software profesional. Pensemos por un momento en esto como tener diferentes "zonas de prueba" y una "zona en vivo" para un evento importante: no lanzas un concierto masivo sin antes haber hecho pruebas de sonido, iluminación y seguridad en un escenario similar pero sin público.

¿Te estás preguntando por qué esto importa? Porque desplegar directamente a producción sin una etapa intermedia es jugar con fuego. Los entornos de staging (también llamados pre-producción, UAT, QA, etc.) te permiten probar tu aplicación en un entorno que es lo más parecido posible a la producción, pero sin el riesgo de afectar a los usuarios reales. Esto ayuda a encontrar bugs de integración, problemas de rendimiento o de configuración que no se detectaron en desarrollo o pruebas unitarias, antes de que lleguen a tus clientes. La meta es reducir al mínimo la probabilidad de que algo salga mal en el entorno de producción, donde los fallos tienen un impacto directo y costoso.

Vamos a ver de qué se trata todo esto:

**Entorno de Staging (Pre-producción/QA/UAT):**

* **Propósito:** Es un clon de tu entorno de producción. Su objetivo es proporcionar un lugar donde puedas realizar pruebas finales (pruebas de integración, pruebas de aceptación de usuario - UAT, pruebas de rendimiento) en un entorno que replica fielmente las condiciones de producción.
* **Características Clave:**
    * **Similitud con Producción:** Debe tener la misma versión del sistema operativo, el mismo servidor web (ej. IIS), la misma versión de la base de datos, las mismas dependencias externas (servicios de terceros, APIs), y configuraciones lo más parecidas posible.
    * **Datos:** A menudo se utiliza una copia reciente y anonimizada de los datos de producción, o datos representativos de prueba, para simular escenarios reales.
    * **Acceso:** Generalmente, solo es accesible por el equipo de desarrollo, QA y usuarios de negocio para pruebas internas o de aceptación.
    * **Propósito de las Pruebas:** Detectar bugs que solo aparecen en un entorno de integración complejo, verificar el rendimiento bajo carga, y realizar pruebas de regresión finales.

**Entorno de Producción (Production):**

* **Propósito:** Es el entorno "en vivo" donde tu aplicación es accesible por los usuarios finales. Es el corazón de tu negocio y donde se genera valor.
* **Características Clave:**
    * **Alta Disponibilidad y Resiliencia:** Diseñado para manejar el tráfico de usuarios, con redundancia, balanceadores de carga y mecanismos de recuperación ante desastres.
    * **Seguridad Estricta:** Las medidas de seguridad son las más rigurosas. Acceso muy limitado y monitoreado.
    * **Monitoreo Extensivo:** Monitoreo 24/7 para detectar cualquier problema (errores, rendimiento, seguridad) de forma inmediata.
    * **Uptime:** El objetivo es mantenerlo funcionando el mayor tiempo posible con el mínimo de interrupciones.

**Configuración y Diferenciación entre Entornos:**

La clave para diferenciar estos entornos radica en la **configuración**. Tu código binario (los archivos `.dll` compilados) debe ser el mismo para ambos, lo que cambia es cómo se comporta la aplicación en cada entorno. Esto se logra mediante:

1.  **Archivos de Configuración:**
    * **`appsettings.json` (para .NET Core/5+):** Permite tener diferentes archivos de configuración para diferentes entornos (ej. `appsettings.Development.json`, `appsettings.Staging.json`, `appsettings.Production.json`). El sistema de configuración de .NET carga automáticamente el archivo correcto basado en la variable de entorno `ASPNETCORE_ENVIRONMENT`.
    * **`Web.config` (para .NET Framework):** Utiliza transformaciones de `Web.config` (ej. `Web.Release.config`, `Web.Debug.config`) para aplicar cambios específicos del entorno durante el proceso de publicación.
    * **Ejemplos de configuración que varían:** Cadenas de conexión a bases de datos, URLs de servicios externos, niveles de log (más verbosos en desarrollo, menos en producción), claves de API, banderas de características.

2.  **Variables de Entorno:**
    * Es una práctica común y segura almacenar configuraciones sensibles (como cadenas de conexión a bases de datos o claves API) como variables de entorno en el servidor, en lugar de directamente en archivos de configuración. Esto evita que los secretos se almacenen en el control de versiones.

3.  **Herramientas de Despliegue:**
    * Los pipelines de CI/CD (ej. Azure DevOps Pipelines) están diseñados para manejar esta diferenciación. Pueden aplicar las configuraciones adecuadas o establecer las variables de entorno correctas durante el paso de despliegue a cada ambiente.

La configuración de entornos separados, y la gestión inteligente de sus configuraciones, es una práctica fundamental para reducir riesgos y asegurar la calidad y estabilidad de tu software en producción.
''',
    'code_example': r'''
# Este ejemplo conceptual muestra cómo gestionarías las configuraciones
# para diferentes entornos en una aplicación ASP.NET Core.

# --- 1. Estructura de archivos de configuración (en tu proyecto .NET Core) ---
# En tu proyecto web, tendrías estos archivos:
# YourWebApp/appsettings.json
# YourWebApp/appsettings.Development.json
# YourWebApp/appsettings.Staging.json
# YourWebApp/appsettings.Production.json

# --- Contenido de appsettings.json (Configuración base, común para todos) ---
# {
#   "Logging": {
#     "LogLevel": {
#       "Default": "Information",
#       "Microsoft.AspNetCore": "Warning"
#     }
#   },
#   "AllowedHosts": "*",
#   "MySetting": "Default Value"
# }

# --- Contenido de appsettings.Development.json (Sobreescribe para Desarrollo) ---
# {
#   "Logging": {
#     "LogLevel": {
#       "Default": "Debug", // Más logs en desarrollo
#       "Microsoft.AspNetCore": "Information"
#     }
#   },
#   "ConnectionStrings": {
#     "DefaultConnection": "Server=DEV_DB_SERVER;Database=MyApp_Dev;Integrated Security=True;TrustServerCertificate=True;"
#   },
#   "MySetting": "Development Specific Value",
#   "FeatureToggles": {
#     "ExperimentalFeature": true // Activar features experimentales en desarrollo
#   }
# }

# --- Contenido de appsettings.Staging.json (Sobreescribe para Staging) ---
# {
#   "Logging": {
#     "LogLevel": {
#       "Default": "Information",
#       "Microsoft.AspNetCore": "Warning"
#     }
#   },
#   "ConnectionStrings": {
#     "DefaultConnection": "Server=STAGING_DB_SERVER;Database=MyApp_Staging;User ID=user;Password=password;"
#   },
#   "MySetting": "Staging Specific Value",
#   "FeatureToggles": {
#     "ExperimentalFeature": false // Desactivar features experimentales en staging
#   }
# }

# --- Contenido de appsettings.Production.json (Sobreescribe para Producción) ---
# {
#   "Logging": {
#     "LogLevel": {
#       "Default": "Warning", // Menos logs en producción para rendimiento
#       "Microsoft.AspNetCore": "Error"
#     }
#   },
#   "ConnectionStrings": {
#     "DefaultConnection": "Server=PROD_DB_SERVER;Database=MyApp_Prod;User ID=user;Password=password;"
#   },
#   "MySetting": "Production Specific Value",
#   "FeatureToggles": {
#     "ExperimentalFeature": false
#   }
# }

# --- 2. Cómo .NET Core selecciona el archivo de configuración ---
# En tu programa (ej. Program.cs para .NET 6+):
// C# code (Program.cs o Startup.cs)
/*
var builder = WebApplication.CreateBuilder(args);

// El ambiente se determina por la variable de entorno ASPNETCORE_ENVIRONMENT
// Ej: "Development", "Staging", "Production"
// builder.Environment.EnvironmentName;

// Por defecto, se carga appsettings.json y luego appsettings.{EnvironmentName}.json
// El último sobreescribe valores del anterior.
builder.Configuration.AddJsonFile("appsettings.json", optional: false, reloadOnChange: true);
builder.Configuration.AddJsonFile($"appsettings.{builder.Environment.EnvironmentName}.json", optional: true, reloadOnChange: true);

// También puedes añadir variables de entorno
builder.Configuration.AddEnvironmentVariables();

// ... el resto de tu configuración y servicios
*/

# --- 3. Configuración de la Variable de Entorno en el Servidor de Despliegue ---

# Para Windows Server / IIS:
# Puedes establecer la variable de entorno ASPNETCORE_ENVIRONMENT para el Application Pool
# que aloja tu aplicación en IIS Manager:
# - Abre IIS Manager.
# - Navega a "Application Pools".
# - Selecciona el Application Pool de tu aplicación, clic derecho -> "Advanced Settings...".
# - En la sección "Process Model", busca "Environment Variables" y haz clic en "..."
# - Agrega una nueva variable:
#   Name: ASPNETCORE_ENVIRONMENT
#   Value: Staging (o Production)

# Para Linux / Docker / Otros Hosts:
# Exporta la variable de entorno antes de ejecutar la aplicación:
# export ASPNETCORE_ENVIRONMENT=Staging
# dotnet YourWebApp.dll

# --- 4. Configuración del Pipeline de CI/CD (Ejemplo Azure DevOps YAML) ---
# En tu archivo azure-pipelines.yml, podrías tener stages separados para staging y producción:

/*
stages:
- stage: BuildStage
  # ... pasos de build y test ...
  # Publicar los artefactos del build

- stage: DeployStaging
  displayName: 'Deploy to Staging Environment'
  dependsOn: BuildStage
  condition: succeeded('BuildStage')
  jobs:
  - deployment: DeployStagingApp
    environment: 'Staging' # Entorno definido en Azure DevOps
    strategy:
      runOnce:
        deploy:
          steps:
          # ... descargar artefactos ...
          - task: AzureWebApp@1
            inputs:
              azureSubscription: 'YourStagingSubscription'
              appName: 'your-app-staging'
              package: '$(System.ArtifactsDirectory)/drop/**/*.zip'
              # Aquí Azure DevOps se encarga de establecer ASPNETCORE_ENVIRONMENT
              # basándose en la configuración del App Service o el entorno de la Release Pipeline.
              # O puedes inyectarlo explícitamente:
              # appSettings: '-ASPNETCORE_ENVIRONMENT Staging'

- stage: DeployProduction
  displayName: 'Deploy to Production Environment'
  dependsOn: DeployStaging # Solo si Staging fue exitoso
  condition: and(succeeded('DeployStaging'), eq(variables['Build.Reason'], 'Manual')) # Ejemplo: despliegue manual a prod
  jobs:
  - deployment: DeployProdApp
    environment: 'Production' # Otro entorno en Azure DevOps
    strategy:
      runOnce:
        deploy:
          steps:
          # ... descargar artefactos ...
          - task: AzureWebApp@1
            inputs:
              azureSubscription: 'YourProductionSubscription'
              appName: 'your-app-production'
              package: '$(System.ArtifactsDirectory)/drop/**/*.zip'
              # appSettings: '-ASPNETCORE_ENVIRONMENT Production'
*/

# --- Escenarios INCORRECTOS de configuración de entornos: ---
# 1. Hardcodear valores de configuración específicos del entorno en el código fuente:
#    BAD: `string connectionString = "Server=PROD_DB;..."` dentro de una clase C#.
#    Esto significa que tendrías que recompilar y volver a desplegar para cambiar un valor,
#    y es un riesgo de seguridad al exponer secretos en el código.
# 2. No usar diferentes cadenas de conexión para bases de datos:
#    Usar la misma base de datos para desarrollo, staging y producción.
#    BAD: Esto puede llevar a corrupción de datos, pérdida de datos de prueba o impactos en el rendimiento de producción.
# 3. Falta de consistencia entre entornos:
#    Si el entorno de staging es muy diferente al de producción (ej. versiones de SO, versiones de IIS/servidor web, dependencias),
#    las pruebas en staging pueden no ser válidas y no detectar problemas que sí ocurrirán en producción.
# 4. Desplegar artefactos diferentes en cada entorno:
#    El mismo paquete binario (el resultado de `dotnet publish`) debe ser el que se promueve a través de los entornos.
#    Lo que cambia es solo la configuración específica del entorno.
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Mid',
    'level': 6,
    'title_level': 'Integración Continua y Despliegue',
    'topic': 'Despliegue de Aplicaciones',
    'subtopic': 'Monitoreo post-despliegue',
    'definition': r'''
El monitoreo post-despliegue es la fase crítica que viene inmediatamente después de que tu aplicación o servicio ha sido puesto en producción. Pensemos por un momento en esto como el control de la torre de un aeropuerto después de que un avión ha despegado: no solo te alegras de que despegó, sino que sigues de cerca su trayectoria, altitud, velocidad y estado para asegurarte de que todo va según lo planeado y detectar cualquier anomalía.

¿Te estás preguntando por qué esto importa? Porque el despliegue es solo el inicio del viaje de tu software en producción. Incluso con las mejores pruebas y pipelines, siempre existe la posibilidad de que surjan problemas inesperados en el entorno real, ya sea por interacciones con otros sistemas, patrones de uso imprevistos o picos de tráfico. Sin un monitoreo robusto, un problema podría pasar desapercibido durante horas, o incluso días, afectando gravemente a tus usuarios y a tu negocio. El monitoreo post-despliegue te permite identificar y resolver problemas rápidamente, mantener la salud de tu aplicación y entender cómo se está comportando en el mundo real. Es lo que permite a las empresas reaccionar antes de que los usuarios noten un problema grave.

Vamos a ver de qué se trata todo esto y las herramientas clave:

El monitoreo post-despliegue implica recolectar y analizar datos sobre el rendimiento, la disponibilidad, los errores y el comportamiento de tu aplicación una vez que está en producción.

**Componentes Clave del Monitoreo:**

1.  **Métricas (Metrics):**
    * **Propósito:** Recolectar datos numéricos a lo largo del tiempo que describen el estado y el rendimiento de tu aplicación.
    * **Ejemplos Comunes:**
        * **Uso de CPU y Memoria:** ¿Está tu aplicación consumiendo demasiados recursos?
        * **Latencia de Solicitudes:** ¿Cuánto tiempo tarda tu aplicación en responder a las peticiones? (Promedio, percentiles 90/95/99).
        * **Tasas de Error:** ¿Cuántas solicitudes están fallando (HTTP 5xx, excepciones internas)?
        * **Rendimiento de la Base de Datos:** Tiempos de consulta, conexiones activas.
        * **Tráfico de Red:** Bytes enviados/recibidos.
        * **Métricas de Negocio:** Número de transacciones, usuarios activos (aunque no siempre directamente de la aplicación).
    * **Herramientas:** Azure Monitor (para Azure App Services/VMs), Prometheus, Grafana, Datadog, New Relic.

2.  **Registros (Logs):**
    * **Propósito:** Recolectar mensajes de texto generados por tu aplicación que describen eventos, errores, advertencias o información de depuración.
    * **Importancia:** Son cruciales para entender qué sucedió *exactamente* cuando algo salió mal. Un log bien estructurado puede decirte la secuencia de eventos que llevaron a un error.
    * **Buenas Prácticas:**
        * Registrar mensajes significativos (no solo "Inicio de método").
        * Incluir contexto (IDs de usuario, IDs de transacción, etc.).
        * Usar niveles de log apropiados (Debug, Info, Warning, Error, Critical).
        * Centralizar los logs en un sistema accesible.
    * **Herramientas:** Azure Monitor Logs (anteriormente Log Analytics), Serilog (para .NET), NLog (para .NET), ELK Stack (Elasticsearch, Logstash, Kibana), Splunk.

3.  **Seguimiento Distribuido (Distributed Tracing):**
    * **Propósito:** Rastrear el flujo de una solicitud a través de múltiples servicios en una arquitectura distribuida (microservicios).
    * **Importancia:** Cuando una solicitud pasa por varios microservicios, identificar dónde está el cuello de botella o el error puede ser un desafío. El trazado distribuido te muestra el "camino" completo de la solicitud y el tiempo que pasó en cada servicio.
    * **Herramientas:** Azure Application Insights, OpenTelemetry, Jaeger, Zipkin.

4.  **Alertas (Alerting):**
    * **Propósito:** Notificar automáticamente al equipo cuando una métrica excede un umbral predefinido o cuando se detecta un patrón de errores.
    * **Importancia:** No puedes estar mirando los dashboards 24/7. Las alertas te informan proactivamente sobre problemas para que puedas actuar rápidamente.
    * **Configuración:** Define umbrales (ej. "más de 500 errores por minuto", "uso de CPU > 90% por más de 5 minutos").
    * **Canales:** Correo electrónico, SMS, Slack, Microsoft Teams, PagerDuty.
    * **Herramientas:** Funcionalidad de alertas en Azure Monitor, Grafana, Datadog.

**Herramientas Comunes en el Ecosistema .NET / Azure:**

* **Azure Application Insights (Parte de Azure Monitor):** Una solución APM (Application Performance Monitoring) completa para .NET y otras plataformas. Recolecta telemetría (solicitudes, dependencias, excepciones, logs, métricas) y proporciona dashboards, análisis de rendimiento y alertas. Es una herramienta muy poderosa para aplicaciones alojadas en Azure.
* **Azure Monitor:** El servicio de monitoreo central de Azure que recolecta datos de todas tus infraestructuras y aplicaciones en Azure. Incluye Logs, Métricas, Workbooks y Alertas.

El monitoreo post-despliegue no es un lujo, es una necesidad. Te da la visibilidad y el control necesarios para mantener tus aplicaciones saludables, satisfacer a tus usuarios y reaccionar rápidamente ante cualquier eventualidad.
''',
    'code_example': r'''
# Este ejemplo es conceptual y se enfoca en cómo configurarías una aplicación .NET
# para el monitoreo post-despliegue, usando Azure Application Insights como ejemplo.
# No es código C# ejecutable, sino snippets de configuración y uso de APIs de monitoreo.

# --- 1. Instrumentar tu aplicación .NET con Application Insights (Ej. ASP.NET Core) ---

# Instalación de paquetes NuGet:
# dotnet add package Microsoft.ApplicationInsights.AspNetCore
# dotnet add package Serilog.AspNetCore # Opcional, para logging avanzado

# En `Program.cs` (para .NET 6+ Minimal APIs) o `Startup.cs` (para .NET 5 y anteriores):

// C# code (Program.cs)
/*
using Microsoft.ApplicationInsights.Extensibility;
using Microsoft.Extensions.Logging;
// Usar Serilog para logging estructurado (opcional)
// using Serilog;
// using Serilog.Events;

var builder = WebApplication.CreateBuilder(args);

// --- Configuración de Application Insights ---
// 1. Añadir el servicio de Application Insights (usando la cadena de conexión del recurso de Azure).
//    La cadena de conexión se puede configurar en appsettings.json o como variable de entorno.
builder.Services.AddApplicationInsightsTelemetry();

// 2. Opcional: Configurar Application Insights para filtrar telemetría o añadir procesadores
builder.Services.AddApplicationInsightsTelemetry(options =>
{
    // Puedes configurar opciones, por ejemplo, deshabilitar la recolección de ciertas cosas
    // options.EnableDependencyTrackingTelemetryModule = false;
});

// 3. Opcional: Configurar el Logging para enviar a Application Insights
builder.Logging.AddApplicationInsights();
// Puedes ajustar los niveles de log para Application Insights
builder.Logging.AddApplicationInsights(
    options => options.TrackExceptionsAsExceptionTelemetry = true);

// Si usas Serilog (logging más flexible):
// builder.Host.UseSerilog((context, services, configuration) => configuration
//     .ReadFrom.Configuration(context.Configuration)
//     .ReadFrom.Services(services)
//     .MinimumLevel.Override("Microsoft", LogEventLevel.Warning)
//     .Enrich.FromLogContext()
//     .WriteTo.Console()
//     .WriteTo.ApplicationInsights(services.GetRequiredService<TelemetryConfiguration>(), TelemetryConverter.Traces));


var app = builder.Build();

// --- Captura de Métricas Personalizadas (Conceptual) ---
// Puedes inyectar TelemetryClient para enviar telemetría personalizada
app.MapGet("/api/mydata", async (TelemetryClient telemetryClient) =>
{
    telemetryClient.TrackEvent("MyCustomApiCall"); // Registrar un evento personalizado
    telemetryClient.TrackMetric("MyFeatureUsage", 1); // Registrar una métrica personalizada

    try
    {
        // Tu lógica de negocio
        await Task.Delay(100);
        return Results.Ok("Data fetched");
    }
    catch (Exception ex)
    {
        telemetryClient.TrackException(ex); // Registrar una excepción
        telemetryClient.TrackTrace($"Error in /api/mydata: {ex.Message}", SeverityLevel.Error); // Registrar un trace/log
        return Results.Problem("An error occurred");
    }
});

// ... resto de la configuración del pipeline HTTP ...

app.Run();
*/

# --- 2. Configuración de appsettings.json para Application Insights ---
# {
#   "ApplicationInsights": {
#     "ConnectionString": "InstrumentationKey=YOUR_INSTRUMENTATION_KEY;IngestionEndpoint=https://eastus-0.in.applicationinsights.azure.com/"
#   },
#   "Logging": {
#     "LogLevel": {
#       "Default": "Information",
#       "Microsoft.AspNetCore": "Warning",
#       "Microsoft.Hosting.Lifetime": "Information"
#     },
#     "ApplicationInsights": {
#       "LogLevel": {
#         "Default": "Information" // Nivel de log a enviar a AI
#       }
#     }
#   }
# }

# --- 3. Configuración de Alertas en Azure Monitor (Conceptual, vía Portal o ARM templates) ---
# No es código C#, sino configuración en la plataforma Azure.

# Ejemplo de una regla de alerta:
# - Recurso: Tu App Service o VM.
# - Tipo de señal: Métricas
# - Nombre de la señal: "Server response time"
# - Lógica de alerta: "Cuando el tiempo de respuesta promedio > 2 segundos durante 5 minutos."
# - Acciones: "Enviar email al equipo de Ops", "Enviar a un canal de Teams", "Activar un webhook".

# Otro ejemplo de alerta:
# - Tipo de señal: Logs (KQL query en Log Analytics)
# - Consulta KQL:
#   exceptions
#   | where timestamp > ago(5m)
#   | summarize errorCount = count() by outerMessage
#   | where errorCount > 10 # Si hay más de 10 excepciones en 5 minutos
# - Acciones: Notificar.

# --- 4. Dashboards y Visualizaciones (Conceptual, usando Azure Portal o Grafana) ---
# Crear un dashboard en Azure Portal o Grafana para visualizar:
# - Gráfico de solicitudes por segundo.
# - Gráfico de tiempo de respuesta.
# - Gráfico de tasa de errores (porcentaje de solicitudes fallidas).
# - Contadores de CPU y memoria.
# - Histograma de latencia de dependencias (llamadas a DB, servicios externos).

# --- Escenarios INCORRECTOS en el monitoreo post-despliegue: ---
# 1. No monitorear en absoluto:
#    El mayor error. Lanzar a producción y esperar lo mejor, sin visibilidad del rendimiento o errores.
#    Lleva a descubrir problemas por quejas de usuarios o en auditorías tardías.
# 2. Monitorear solo "uptime" (si el servidor está vivo):
#    Esto es insuficiente. Un servidor puede estar vivo, pero la aplicación puede estar lenta,
#    generando errores internos o con problemas de rendimiento.
# 3. Registrar demasiada o muy poca información en los logs:
#    Demasiada: Inunda los sistemas de logs, es costoso y difícil de analizar.
#    Muy poca: No proporciona suficiente contexto para depurar problemas cuando ocurren.
# 4. No configurar alertas o tener demasiadas alertas irrelevantes ("alert fatigue"):
#    Sin alertas, los problemas se detectan tarde. Demasiadas alertas que no requieren acción
#    hacen que el equipo las ignore, perdiendo el propósito.
# 5. Monitorear solo la infraestructura, no la aplicación:
#    Es importante monitorear la salud de los servidores (CPU, RAM), pero también es crucial
#    entender cómo se comporta tu aplicación específica (latencia de API, tasa de errores de negocio).
'''
  });
}
