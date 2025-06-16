import 'package:sqflite_common/sqlite_api.dart';

Future<void> insertPuntonetJrLevel1Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción y Configuración',
    'topic': 'Entorno de Desarrollo',
    'subtopic': 'Instalación y configuración de Visual Studio',
    'definition': r'''
Instalar y configurar Visual Studio es el primer gran paso para empezar a programar en .NET. Pensemos por un momento en esto como alistar tu taller antes de empezar a construir algo: necesitas tus herramientas bien ubicadas y funcionando.

¿Te estás preguntando por qué esto importa? 

Bueno, una buena configuración te ahorrará muchos dolores de cabeza. Si tu entorno no está bien, te encontrarás con errores extraños o funcionalidades que simplemente no trabajan como esperas. Piensa en un chef que intenta cocinar con cuchillos desafilados o sartenes que no calientan parejo; el resultado no será el mejor.

Visual Studio es el Integrated Development Environment (IDE) principal para .NET. Es donde escribirás tu código, lo depurarás y lo ejecutarás. Durante la instalación, puedes elegir qué cargas de trabajo (workloads) necesitas. Esto es clave: si vas a desarrollar aplicaciones web, asegúrate de seleccionar la carga de trabajo de "Desarrollo web y ASP.NET". Si tu interés es en aplicaciones de escritorio, busca "Desarrollo de escritorio .NET". Cada carga de trabajo incluye las herramientas y SDKs necesarios para ese tipo de desarrollo. Después de la instalación, es importante verificar que todo esté actualizado y que las extensiones que podrías necesitar (como las de un control de versiones específico o herramientas de terceros) estén instaladas y configuradas. Además, es una buena práctica ajustar las preferencias del editor, como el tema, las fuentes y las reglas de formato, para que tu espacio de trabajo sea cómodo y productivo.
''',
    'code_example': '''
// No aplica un ejemplo de código directamente aquí, ya que es una configuración de entorno.
// Sin embargo, una vez configurado, tu primer "Hola Mundo" se vería así:

using System;

namespace MyFirstApp
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("¡Hola, mundo desde Visual Studio!");
        }
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción y Configuración',
    'topic': 'Entorno de Desarrollo',
    'subtopic': 'Estructura de un proyecto .NET Framework',
    'definition': r'''
Entender cómo se organiza un proyecto en .NET Framework es fundamental para no perderse en el camino. Imagina que estás construyendo una casa: no pones las paredes antes de los cimientos, ¿verdad? Cada parte tiene su lugar y su propósito.

Seguramente pensarás de qué va todo esto... 

Pues bien, saber la estructura te permite encontrar archivos rápidamente, entender dónde añadir nuevo código y colaborar de manera efectiva con otros desarrolladores. Si no conoces la estructura, es como buscar una aguja en un pajar cada vez que necesites modificar algo.

Un proyecto .NET Framework generalmente sigue una estructura lógica. En la raíz, tendrás el archivo `.sln` (solution file), que es como el índice principal. Este archivo agrupa uno o más proyectos relacionados. Dentro de cada proyecto, verás archivos `.csproj` (project file) que definen las configuraciones específicas del proyecto, las referencias a librerías y los archivos que lo componen. Luego, encuentras las carpetas comunes como `Properties` (que contiene el `AssemblyInfo.cs` con metadatos del ensamblado), `References` (que muestra las librerías a las que tu proyecto hace referencia, como `System`, `System.Data`, etc.), y luego tus archivos de código fuente (`.cs` para C#, `.vb` para VB.NET). Para proyectos web, también verás `Web.config` (para configuraciones de la aplicación web) y carpetas como `App_Data`, `App_Start`, `Content`, `Scripts`, entre otras, que organizan recursos estáticos, configuraciones de ruteo y archivos de datos. Es una convención que ayuda a mantener el orden y la coherencia en el desarrollo.
''',
    'code_example': r'''
// Estructura de un proyecto .NET (conceptual)

// MySolution.sln
//   ├── MyProject1 (Carpeta del proyecto)
//   │   ├── Properties
//   │   │   └── AssemblyInfo.cs
//   │   ├── References (Referencia a librerías)
//   │   ├── App.config o Web.config (Configuración de la aplicación)
//   │   ├── Program.cs (Punto de entrada de la aplicación)
//   │   ├── MyClass.cs (Clases personalizadas)
//   │   └── MyProject1.csproj (Archivo de definición del proyecto)
//   ├── MyProject2 (Carpeta de otro proyecto en la misma solución)
//   │   ├── ...
//   └── .gitignore (Para control de versiones con Git)

// Ejemplo de un archivo .csproj simplificado
/*
<Project Sdk="Microsoft.NET.Sdk">

  <PropertyGroup>
    <OutputType>Exe</OutputType>
    <TargetFramework>net48</TargetFramework> // Ejemplo para .NET Framework 4.8
  </PropertyGroup>

  <ItemGroup>
    <Reference Include="System.Windows.Forms" /> // Ejemplo de referencia
  </ItemGroup>

</Project>
*/

// No hay un "código incorrecto" para la estructura de un proyecto,
// pero una mala organización podría ser no usar las carpetas estándar
// o mezclar archivos de diferentes responsabilidades, haciendo el proyecto
// difícil de mantener.
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción y Configuración',
    'topic': 'Entorno de Desarrollo',
    'subtopic': 'Uso de NuGet para gestión de paquetes',
    'definition': r'''
NuGet es básicamente el gestor de paquetes oficial para .NET, una herramienta súper útil que simplifica enormemente la vida del desarrollador. Pensemos por un momento en esto como una biblioteca gigante de componentes pre-construidos que puedes añadir a tus proyectos sin tener que escribirlos desde cero.

¿Te estás preguntando por qué esto importa? 

Imagina que necesitas usar una librería para trabajar con archivos JSON o para conectarte a una base de datos específica. Sin NuGet, tendrías que descargar los archivos, gestionar las dependencias manualmente y asegurarte de que todo funcione junto. Con NuGet, es un proceso automatizado y mucho más rápido, lo que te permite enfocarte en la lógica de tu negocio y no en la gestión de librerías de terceros.

NuGet te permite buscar, instalar, actualizar y eliminar paquetes (que son colecciones de código compilado, recursos y metadatos). Estos paquetes se publican y se consumen a través de un feed, siendo nuget.org el repositorio público más grande. Cuando instalas un paquete, NuGet se encarga de descargar no solo el paquete en sí, sino también todas las demás librerías de las que depende (sus "dependencias"), y las añade a tu proyecto y al archivo de configuración de paquetes (como `packages.config` o directamente en el archivo `.csproj` en proyectos más modernos). Esto asegura que siempre tengas las versiones correctas de todas las dependencias y evita conflictos. Además, es genial para compartir tu propio código como un paquete privado dentro de tu empresa o equipo.
''',
    'code_example': r'''
// Para instalar un paquete NuGet desde la Consola del Administrador de Paquetes en Visual Studio:
// (Herramientas -> Administrador de paquetes NuGet -> Consola del Administrador de paquetes)

// Instalar el paquete Newtonsoft.Json (popular para trabajar con JSON)
PM> Install-Package Newtonsoft.Json

// Desinstalar un paquete
PM> Uninstall-Package Newtonsoft.Json

// Actualizar un paquete
PM> Update-Package Newtonsoft.Json

// En el archivo .csproj (para proyectos SDK-style, como .NET Core o más recientes de .NET Framework)
// Verás las referencias a los paquetes así:
/*
<Project Sdk="Microsoft.NET.Sdk">

  <PropertyGroup>
    <OutputType>Exe</OutputType>
    <TargetFramework>net6.0</TargetFramework>
  </PropertyGroup>

  <ItemGroup>
    <PackageReference Include="Newtonsoft.Json" Version="13.0.1" />
  </ItemGroup>

</Project>
*/

// Un ejemplo de "código incorrecto" podría ser tratar de añadir referencias manualmente
// sin usar NuGet para librerías comunes, lo que puede llevar a problemas de compatibilidad
// o la falta de dependencias necesarias.
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción y Configuración',
    'topic': 'Componentes de .NET Framework',
    'subtopic': 'Common Language Runtime (CLR)',
    'definition': r'''
El Common Language Runtime (CLR) es el corazón de .NET Framework. Imagina que es como el director de orquesta de tus aplicaciones .NET. Cuando escribes código en C#, VB.NET o cualquier otro lenguaje compatible con .NET, este código no se ejecuta directamente en el sistema operativo. Primero, el compilador lo traduce a un lenguaje intermedio llamado Common Intermediate Language (CIL). Es el CLR quien toma ese CIL y lo ejecuta, gestionando todo lo necesario.

¿Te estás preguntando por qué esto importa? 

Pues bien, el CLR es el que hace posible que .NET sea tan potente y versátil. Se encarga de tareas cruciales como la gestión de memoria, lo que significa que no tienes que preocuparte tanto por liberar espacio en la memoria manualmente, ya que el Garbage Collector (un componente del CLR) lo hace por ti. También maneja la seguridad del código, asegurándose de que tu aplicación no haga cosas raras o acceda a recursos no autorizados. Además, es el responsable de la compilación Just-In-Time (JIT), que convierte el CIL en código máquina justo antes de que se ejecute, optimizando el rendimiento. Básicamente, el CLR es el que le da vida a tu código .NET y lo hace funcionar de manera eficiente y segura, independientemente del lenguaje en el que lo hayas escrito o del sistema operativo subyacente (aunque este último punto es más evidente en .NET Core y versiones posteriores que en el Framework original).
''',
    'code_example': r'''
// El CLR es una capa de tiempo de ejecución, no interactúas con él directamente con código C# usual.
// Sin embargo, las características del CLR se ven reflejadas en cómo manejas la memoria o las excepciones.

using System;

public class CLRDemo
{
    public static void Main(string[] args)
    {
        // El CLR gestiona la memoria, por lo que no necesitas liberar objetos manualmente.
        // El Garbage Collector (parte del CLR) se encarga de esto.
        string largeString = "Este es un string muy largo..." + new string('A', 100000);
        Console.WriteLine($"Longitud del string: {largeString.Length}");
        largeString = null; // Sugerencia para el GC, pero no es una liberación directa.

        // Manejo de excepciones, una característica del CLR para un código robusto.
        try
        {
            int numerator = 10;
            int denominator = 0;
            int result = numerator / denominator; // Esto lanzará una excepción
            Console.WriteLine(result);
        }
        catch (DivideByZeroException ex)
        {
            Console.WriteLine("Error: " + ex.Message);
        }

        // Ejemplo incorrecto (intentar liberar memoria manualmente, lo cual no es necesario ni posible en .NET de esta forma)
        // Algunos lenguajes como C++ requieren gestión manual de memoria:
        // MyObject* obj = new MyObject();
        // delete obj; // Esto NO se hace así en C# con CLR
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción y Configuración',
    'topic': 'Componentes de .NET Framework',
    'subtopic': 'Biblioteca de clases base (BCL)',
    'definition': r'''
La Biblioteca de Clases Base (BCL) es, como su nombre indica, una enorme colección de clases, interfaces y tipos que te proporcionan la funcionalidad fundamental para construir casi cualquier tipo de aplicación en .NET. Piensa en ella como una caja de herramientas gigante y muy bien organizada que ya tiene casi todo lo que podrías necesitar para empezar.

No sé tú, pero a mí esto al principio me costó entender la magnitud de lo que significaba. ¿Te estás preguntando por qué esto importa? 

Porque sin la BCL, tendrías que escribir desde cero funcionalidades básicas como trabajar con cadenas de texto, manipular fechas, leer y escribir archivos, o incluso realizar operaciones matemáticas simples. La BCL te ahorra una cantidad inmensa de tiempo y esfuerzo, permitiéndote concentrarte en la lógica única de tu aplicación en lugar de reinventar la rueda constantemente.

La BCL es parte integral de .NET Framework y está disponible para todos los lenguajes que se ejecutan en el CLR. Contiene miles de tipos organizados en namespaces, como `System` (que incluye tipos básicos de datos, cadenas, fechas), `System.Collections` (para estructuras de datos como listas y diccionarios), `System.IO` (para operaciones de entrada/salida de archivos), `System.Net` (para comunicación en red), entre muchos otros. Por ejemplo, cuando usas `Console.WriteLine()` para imprimir algo en la consola, estás utilizando una clase (`Console`) y un método (`WriteLine`) que forman parte de la BCL. O cuando manipulas una fecha con `DateTime.Now`, también estás aprovechando una funcionalidad provista por la BCL. La belleza de esto es que estas clases están optimizadas, probadas y mantenidas por Microsoft, lo que garantiza su fiabilidad y rendimiento.
''',
    'code_example': r'''
// Ejemplos del uso de la BCL en C#

using System; // Namespace fundamental de la BCL
using System.Collections.Generic; // Para colecciones genéricas como List<T>
using System.IO; // Para operaciones de entrada/salida

public class BCLDemo
{
    public static void Main(string[] args)
    {
        // Uso de clases para manipular strings (parte de System namespace)
        string greeting = "Hola, mundo!";
        Console.WriteLine($"Mensaje original: {greeting}");
        Console.WriteLine($"Mensaje en mayúsculas: {greeting.ToUpper()}"); // Método de la clase String

        // Uso de la clase DateTime (parte de System namespace)
        DateTime now = DateTime.Now;
        Console.WriteLine($"Fecha y hora actuales: {now}");
        Console.WriteLine($"Solo la fecha: {now.ToShortDateString()}");

        // Uso de una lista genérica (parte de System.Collections.Generic namespace)
        List<int> numbers = new List<int> { 10, 20, 30, 40 };
        numbers.Add(50);
        Console.WriteLine($"Números en la lista: {string.Join(", ", numbers)}");

        // Uso básico de System.IO para escribir en un archivo (requiere try-catch en un escenario real)
        string filePath = "myFile.txt";
        File.WriteAllText(filePath, "Contenido de ejemplo para el archivo.");
        Console.WriteLine($"Archivo '{filePath}' creado.");

        // Ejemplo incorrecto: Tratar de implementar funcionalidades que ya existen en la BCL
        // en lugar de usarlas directamente. Esto es ineficiente y propenso a errores.
        // Por ejemplo, no deberías escribir tu propia clase para manipular fechas
        // cuando DateTime ya hace un trabajo excelente.
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Jr',
    'level': 1,
    'title_level': 'Introducción y Configuración',
    'topic': 'Componentes de .NET Framework',
    'subtopic': 'Sistema de tipos comunes (CTS)',
    'definition': r'''
El Sistema de Tipos Comunes (CTS) es el que define cómo los diferentes lenguajes de .NET entienden y usan los tipos de datos. Es como un diccionario universal que todos los lenguajes de .NET (C#, VB.NET, F#, etc.) consultan para asegurarse de que están hablando el mismo idioma cuando se refieren a cosas como números enteros, texto o fechas.

Vamos a ver de qué se trata todo esto... ¿Te estás preguntando por qué esto importa? 

La magia del CTS es que permite la interoperabilidad entre lenguajes. Imagina que un desarrollador escribe una librería en C# y otro quiere usarla en un proyecto de VB.NET. Gracias al CTS, ambos lenguajes entienden exactamente cómo están definidos los tipos de datos en esa librería, lo que hace que la comunicación sea fluida y sin problemas. Sin el CTS, sería un caos de incompatibilidades, y la idea de tener múltiples lenguajes en una misma plataforma sería casi imposible.

El CTS clasifica los tipos en dos categorías principales: tipos de valor (Value Types) y tipos de referencia (Reference Types). Los tipos de valor, como `int` (entero), `float` (número decimal) o `bool` (booleano), almacenan directamente su valor en la memoria. Cuando los asignas, se copia el valor. Los tipos de referencia, como `string` (cadena de texto), `class` (clases personalizadas) o `array` (arreglos), almacenan una referencia a la ubicación en memoria donde se encuentra el objeto real. Cuando asignas un tipo de referencia, lo que se copia es la referencia, no el objeto en sí. El CTS también define reglas para la declaración, uso y gestión de tipos, asegurando la seguridad de tipos y la consistencia en todo el ecosistema .NET. Esto es fundamental para la robustez y la capacidad de depuración de las aplicaciones.
''',
    'code_example': r'''
// Ejemplos del Sistema de Tipos Comunes (CTS) en C#

using System; // Namespace que contiene muchos tipos definidos por el CTS

public class CTSDemo
{
    public static void Main(string[] args)
    {
        // Tipos de Valor (Value Types): Se copia el valor directamente
        int a = 10;
        int b = a; // b es una copia de 'a'
        b = 20;
        Console.WriteLine($"Valor de a: {a}, Valor de b: {b}"); // Salida: a: 10, b: 20

        // Tipos de Referencia (Reference Types): Se copia la referencia al objeto
        string s1 = "Hola"; // string es un tipo de referencia, aunque se comporte como valor en asignaciones simples
        string s2 = s1; // s2 hace referencia al mismo objeto "Hola"
        s2 = "Adiós"; // Al reasignar, s2 apunta a un NUEVO objeto "Adiós"
                        // NOTA: string es inmutable, por eso la reasignación crea un nuevo objeto.
                        // Con clases personalizadas, la modificación de un objeto afecta a todas sus referencias.
        Console.WriteLine($"Valor de s1: {s1}, Valor de s2: {s2}"); // Salida: s1: Hola, s2: Adiós

        // Ejemplo con una clase personalizada (tipo de referencia)
        MyClass obj1 = new MyClass { Value = 100 };
        MyClass obj2 = obj1; // obj2 ahora hace referencia al MISMO objeto que obj1
        obj2.Value = 200; // Al modificar obj2, obj1 también se ve afectado
        Console.WriteLine($"Valor de obj1.Value: {obj1.Value}, Valor de obj2.Value: {obj2.Value}"); // Salida: obj1.Value: 200, obj2.Value: 200

        // Ejemplo incorrecto (no es un error de compilación, sino de concepto si se malinterpretan los tipos)
        // Intentar pasar un tipo de valor como referencia sin usar 'ref' o 'out' si se necesita modificar el original.
        // O esperar que la modificación de una copia de un tipo de valor afecte al original.
    }
}

public class MyClass // Una clase es un tipo de referencia
{
    public int Value { get; set; }
}
'''
  });
}

Future<void> insertPuntonetJrLevel2Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Desarrollo de Aplicaciones de Escritorio',
    'topic': 'Windows Forms',
    'subtopic': 'Creación de interfaces gráficas',
    'definition': r'''
La creación de interfaces gráficas con Windows Forms es tu puerta de entrada al desarrollo de aplicaciones de escritorio en .NET. Pensemos por un momento en esto como el diseño de la fachada de un edificio: necesitas colocar las ventanas, las puertas y los elementos decorativos de manera que sean funcionales y atractivos para los usuarios. 

¿Te estás preguntando por qué esto importa? 

Porque la interfaz de usuario (UI) es lo primero que ve y con lo que interactúa el usuario. Una interfaz bien diseñada y funcional es clave para una buena experiencia de usuario. Si tu aplicación es potente pero difícil de usar por una UI confusa, es probable que la gente no la utilice.

Windows Forms proporciona un entorno visual de diseño donde puedes arrastrar y soltar controles desde el "Cuadro de herramientas" (Toolbox) a tu formulario. Estos controles son elementos preconstruidos como botones, cuadros de texto, etiquetas, listas desplegables, etc.  Cada control tiene propiedades que puedes ajustar (como texto, color, tamaño, posición) y eventos a los que puedes responder (como un clic de botón). El diseñador visual genera automáticamente el código C# (o VB.NET) detrás de escena, lo que te permite concentrarte en el diseño sin preocuparte por escribir a mano el código para cada elemento visual. Es un enfoque de desarrollo rápido de aplicaciones (RAD) que facilita mucho el prototipado y la construcción de aplicaciones de escritorio.
''',
    'code_example': r'''
// Ejemplo básico de un formulario con un botón y una etiqueta en Windows Forms
// (Este código es generado automáticamente por el diseñador de Visual Studio,
// pero muestra la estructura esencial de los controles)

using System;
using System.Windows.Forms; // Necesario para usar Windows Forms

namespace WindowsFormsApp
{
    public partial class MainForm : Form // 'partial' indica que la clase se extiende en otro archivo (el diseñador)
    {
        private Button myButton;
        private Label myLabel;

        public MainForm()
        {
            InitializeComponent(); // Método generado por el diseñador que inicializa los controles
            SetupCustomControls(); // Llamamos a nuestro método para configurar manualmente (opcional)
        }

        private void SetupCustomControls()
        {
            // Inicializar el botón
            myButton = new Button();
            myButton.Text = "Haz Clic Aquí";
            myButton.Location = new System.Drawing.Point(50, 50); // Posición en el formulario
            myButton.Size = new System.Drawing.Size(150, 30); // Tamaño del botón
            myButton.Click += MyButton_Click; // Asociar un evento al botón

            // Inicializar la etiqueta
            myLabel = new Label();
            myLabel.Text = "Esperando clic...";
            myLabel.Location = new System.Drawing.Point(50, 100);
            myLabel.AutoSize = true; // Ajustar tamaño automáticamente al texto

            // Añadir los controles al formulario
            this.Controls.Add(myButton);
            this.Controls.Add(myLabel);

            this.Text = "Mi Primera App Windows Forms"; // Título de la ventana
        }

        // Manejador del evento Click del botón
        private void MyButton_Click(object sender, EventArgs e)
        {
            myLabel.Text = "¡Botón clickeado!";
            MessageBox.Show("¡Hola desde Windows Forms!", "Mensaje");
        }
    }

    // El código "incorrecto" aquí sería intentar crear toda la interfaz a mano sin usar el diseñador,
    // lo cual sería extremadamente tedioso y propenso a errores, aunque técnicamente posible.
}
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Desarrollo de Aplicaciones de Escritorio',
    'topic': 'Windows Forms',
    'subtopic': 'Manejo de eventos y controles comunes',
    'definition': r'''
El manejo de eventos y el uso de controles comunes son la esencia de la interactividad en Windows Forms. Piensa en ello como si fueras el director de una obra de teatro: los controles son los actores en el escenario (botones, cuadros de texto, etc.), y los eventos son las señales o las "señales" que les das para que realicen una acción, como cuando un actor dice su línea después de una señal. 

¿Te estás preguntando por qué esto importa? 

Sin el manejo de eventos, tu aplicación sería estática, una simple imagen. Es a través de los eventos que tu aplicación responde a las acciones del usuario, como un clic en un botón, escribir texto en una caja o seleccionar un elemento de una lista. Esto es lo que convierte una UI en una aplicación funcional y dinámica.

Cada control en Windows Forms expone una serie de eventos. Por ejemplo, un `Button` tiene un evento `Click`, un `TextBox` tiene eventos como `TextChanged` o `KeyPress`, y un `ListBox` tiene `SelectedIndexChanged`. Para responder a un evento, simplemente "suscribes" un método (llamado manejador de eventos) a ese evento. Cuando el evento ocurre, el método suscrito se ejecuta. Visual Studio facilita esto: al hacer doble clic en un control en el diseñador, automáticamente crea un manejador de eventos predeterminado para el evento más común de ese control (por ejemplo, el evento `Click` para un botón). Dentro de estos métodos, escribes el código que define lo que debe suceder. Además de los botones y cuadros de texto, hay muchos otros controles comunes como `Label` (para mostrar texto), `CheckBox` (para opciones de sí/no), `RadioButton` (para opciones excluyentes), `ComboBox` (para listas desplegables), `PictureBox` (para mostrar imágenes), entre otros, cada uno con sus propias propiedades y eventos que te permiten construir interfaces ricas y responsivas. 
''',
    'code_example': r'''
// Ejemplo de manejo de eventos y uso de controles comunes en Windows Forms

using System;
using System.Windows.Forms;

namespace WindowsFormsApp
{
    public partial class EventHandlingForm : Form
    {
        private TextBox inputTextBox;
        private Label displayLabel;
        private Button processButton;
        private CheckBox enableFeatureCheckBox;
        private RadioButton optionARadioButton;
        private RadioButton optionBRadioButton;

        public EventHandlingForm()
        {
            InitializeComponent(); // Diseñador genera esto
            SetupControlsManually(); // Configuración de controles y eventos
        }

        private void SetupControlsManually()
        {
            this.Text = "Manejo de Eventos y Controles";
            this.Size = new System.Drawing.Size(400, 300);

            // TextBox
            inputTextBox = new TextBox();
            inputTextBox.Location = new System.Drawing.Point(20, 20);
            inputTextBox.Size = new System.Drawing.Size(200, 20);
            inputTextBox.TextChanged += InputTextBox_TextChanged; // Evento TextChanged
            this.Controls.Add(inputTextBox);

            // Label
            displayLabel = new Label();
            displayLabel.Location = new System.Drawing.Point(20, 50);
            displayLabel.AutoSize = true;
            displayLabel.Text = "Escribe algo...";
            this.Controls.Add(displayLabel);

            // Button
            processButton = new Button();
            processButton.Text = "Procesar";
            processButton.Location = new System.Drawing.Point(20, 80);
            processButton.Click += ProcessButton_Click; // Evento Click
            this.Controls.Add(processButton);

            // CheckBox
            enableFeatureCheckBox = new CheckBox();
            enableFeatureCheckBox.Text = "Habilitar Característica";
            enableFeatureCheckBox.Location = new System.Drawing.Point(20, 120);
            enableFeatureCheckBox.CheckedChanged += EnableFeatureCheckBox_CheckedChanged; // Evento CheckedChanged
            this.Controls.Add(enableFeatureCheckBox);

            // RadioButtons (para demostrar opciones excluyentes)
            optionARadioButton = new RadioButton();
            optionARadioButton.Text = "Opción A";
            optionARadioButton.Location = new System.Drawing.Point(20, 160);
            optionARadioButton.Checked = true;
            optionARadioButton.CheckedChanged += OptionRadioButton_CheckedChanged;
            this.Controls.Add(optionARadioButton);

            optionBRadioButton = new RadioButton();
            optionBRadioButton.Text = "Opción B";
            optionBRadioButton.Location = new System.Drawing.Point(120, 160);
            optionBRadioButton.CheckedChanged += OptionRadioButton_CheckedChanged;
            this.Controls.Add(optionBRadioButton);
        }

        // Manejador para el TextChanged del TextBox
        private void InputTextBox_TextChanged(object sender, EventArgs e)
        {
            displayLabel.Text = $"Has escrito: {inputTextBox.Text}";
        }

        // Manejador para el Click del Button
        private void ProcessButton_Click(object sender, EventArgs e)
        {
            MessageBox.Show($"Procesando: {inputTextBox.Text}", "Proceso Iniciado");
        }

        // Manejador para el CheckedChanged del CheckBox
        private void EnableFeatureCheckBox_CheckedChanged(object sender, EventArgs e)
        {
            if (enableFeatureCheckBox.Checked)
            {
                MessageBox.Show("Característica habilitada", "Estado");
            }
            else
            {
                MessageBox.Show("Característica deshabilitada", "Estado");
            }
        }

        // Manejador común para los RadioButtons
        private void OptionRadioButton_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton rb = sender as RadioButton;
            if (rb != null && rb.Checked)
            {
                MessageBox.Show($"Seleccionaste: {rb.Text}", "Opción Elegida");
            }
        }

        // Ejemplo incorrecto: No asignar un manejador de eventos a un control
        // El botón existiría, pero no haría nada al ser clicado.
        // myButton.Click -= MyButton_Click; // Esto desvincularía el evento
    }
}
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Desarrollo de Aplicaciones de Escritorio',
    'topic': 'Windows Forms',
    'subtopic': 'Validación de entradas del usuario',
    'definition': r'''
La validación de entradas del usuario es un paso crucial para construir aplicaciones robustas y confiables en Windows Forms. Es como tener un portero en la entrada de un evento importante: solo deja pasar a aquellos que cumplen con ciertos requisitos, evitando que entre gente no deseada o que pueda causar problemas. 

¿Te estás preguntando por qué esto importa? 

Si permites que los usuarios introduzcan cualquier tipo de dato sin verificarlo, tu aplicación puede fallar, mostrar errores inesperados o incluso ser vulnerable a ataques de seguridad. Imagina una calculadora que recibe texto en lugar de números; simplemente no funcionará. Una buena validación mejora la experiencia del usuario al guiarlos y proteger tu aplicación de datos incorrectos o maliciosos.

La validación puede ser tan sencilla como verificar si un campo de texto no está vacío, o tan compleja como asegurarse de que un correo electrónico tenga el formato correcto, que un número esté dentro de un rango específico, o que una contraseña cumpla con ciertos criterios de seguridad. En Windows Forms, puedes implementar la validación de varias maneras. Una forma común es usar los eventos `Validating` o `Validated` de los controles. El evento `Validating` se dispara antes de que el control pierda el foco, permitiéndote cancelar la pérdida de foco si la entrada no es válida (por ejemplo, mostrando un `MessageBox` con un mensaje de error y manteniendo el foco en el control hasta que el usuario corrija la entrada). También puedes usar controles como `ErrorProvider` para mostrar iconos de error visuales junto a los campos inválidos. Otra técnica es realizar la validación al hacer clic en un botón "Guardar" o "Enviar", revisando todos los campos del formulario antes de procesar la información. Lo importante es dar feedback claro al usuario sobre lo que está mal y cómo corregirlo. 
''',
    'code_example': r'''
// Ejemplo de validación de entrada de usuario en Windows Forms

using System;
using System.Windows.Forms;

namespace WindowsFormsApp
{
    public partial class ValidationForm : Form
    {
        private TextBox ageTextBox;
        private ErrorProvider errorProvider;
        private Button submitButton;

        public ValidationForm()
        {
            InitializeComponent();
            SetupValidationControls();
        }

        private void SetupValidationControls()
        {
            this.Text = "Validación de Entradas";
            this.Size = new System.Drawing.Size(300, 200);

            // TextBox para la edad
            Label ageLabel = new Label();
            ageLabel.Text = "Edad:";
            ageLabel.Location = new System.Drawing.Point(20, 20);
            ageLabel.AutoSize = true;
            this.Controls.Add(ageLabel);

            ageTextBox = new TextBox();
            ageTextBox.Location = new System.Drawing.Point(70, 20);
            ageTextBox.Size = new System.Drawing.Size(100, 20);
            ageTextBox.Validating += AgeTextBox_Validating; // Evento de validación
            this.Controls.Add(ageTextBox);

            // ErrorProvider para mostrar errores visuales
            errorProvider = new ErrorProvider();
            errorProvider.ContainerControl = this; // Indica qué control "contiene" los errores
            errorProvider.SetIconAlignment(ageTextBox, ErrorIconAlignment.MiddleRight); // Posición del icono de error

            // Botón de envío
            submitButton = new Button();
            submitButton.Text = "Enviar";
            submitButton.Location = new System.Drawing.Point(20, 70);
            submitButton.Click += SubmitButton_Click;
            this.Controls.Add(submitButton);
        }

        // Manejador del evento Validating para el TextBox de edad
        private void AgeTextBox_Validating(object sender, System.ComponentModel.CancelEventArgs e)
        {
            // Borrar cualquier error anterior para este control
            errorProvider.SetError(ageTextBox, "");

            if (string.IsNullOrWhiteSpace(ageTextBox.Text))
            {
                errorProvider.SetError(ageTextBox, "La edad no puede estar vacía.");
                e.Cancel = true; // Cancela la pérdida de foco si la entrada no es válida
            }
            else if (!int.TryParse(ageTextBox.Text, out int age))
            {
                errorProvider.SetError(ageTextBox, "Por favor, introduce un número válido para la edad.");
                e.Cancel = true;
            }
            else if (age < 0 || age > 120)
            {
                errorProvider.SetError(ageTextBox, "La edad debe estar entre 0 y 120.");
                e.Cancel = true;
            }
        }

        // Manejador del evento Click para el botón Enviar
        private void SubmitButton_Click(object sender, EventArgs e)
        {
            // Forzar la validación de todos los controles antes de enviar
            if (this.ValidateChildren()) // Valida todos los controles con la propiedad CausesValidation = true
            {
                MessageBox.Show($"Edad ingresada: {ageTextBox.Text}", "Datos Enviados");
            }
            else
            {
                MessageBox.Show("Por favor, corrige los errores en el formulario.", "Errores de Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }
    }

    // Ejemplo incorrecto: No validar las entradas del usuario.
    // Esto podría llevar a errores de formato (crash) o lógica de negocio inválida.
    /*
    private void BadSubmitButton_Click(object sender, EventArgs e)
    {
        // Si no se valida, y el usuario introduce "abc" en un campo numérico:
        int age = int.Parse(ageTextBox.Text); // Esto lanzaría una FormatException
        // ... el programa podría fallar aquí.
    }
    */
}
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Desarrollo de Aplicaciones de Escritorio',
    'topic': 'Windows Presentation Foundation (WPF)',
    'subtopic': 'Introducción a XAML',
    'definition': r'''
XAML (eXtensible Application Markup Language) es el lenguaje de marcado declarativo que usa WPF para construir interfaces de usuario. Pensemos por un momento en esto como el plano arquitectónico de un edificio: en lugar de describir paso a paso cómo construir cada pared, simplemente describes cómo debe ser el edificio una vez terminado, usando un lenguaje estructurado.

¿Te estás preguntando por qué esto importa? 

Porque XAML separa la interfaz de usuario (lo visual) de la lógica de negocio (el código C# o VB.NET). Esto significa que los diseñadores gráficos pueden trabajar en la apariencia de la aplicación sin interferir directamente con los desarrolladores que escriben la lógica. Además, XAML es mucho más legible y fácil de mantener que construir interfaces complejas directamente desde código.

En XAML, los elementos de la interfaz de usuario se representan como etiquetas XML. Por ejemplo, un botón es `<Button>...</Button>`, y un cuadro de texto es `<TextBox>...</TextBox>`. Puedes anidar elementos para crear jerarquías (un botón dentro de un panel, por ejemplo). Cada etiqueta puede tener atributos que representan las propiedades del control (como `Content="Haz Clic"` para el texto de un botón o `Width="100"` para su ancho). XAML también permite definir eventos, estilos y plantillas de datos, lo que lo convierte en un lenguaje muy potente para interfaces de usuario ricas y dinámicas. Al compilar la aplicación, este XAML se convierte en una representación de objetos que WPF utiliza para renderizar la interfaz. Es un cambio de paradigma respecto a Windows Forms, donde la UI se construía más programáticamente.
''',
    'code_example': r'''
<Window x:Class="WpfApp.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Introducción a XAML" Height="350" Width="500">
    <Grid>
        <Grid.RowDefinitions>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="*"/>
            <RowDefinition Height="Auto"/>
        </Grid.RowDefinitions>

        <Label Grid.Row="0" Content="¡Hola, WPF con XAML!" FontSize="24" HorizontalAlignment="Center" Margin="10"/>

        <StackPanel Grid.Row="1" Orientation="Vertical" HorizontalAlignment="Center" VerticalAlignment="Center">
            <TextBox x:Name="MyTextBox" Width="200" Margin="5" Text="Escribe algo aquí..."/>
            <Button Content="Enviar" Width="100" Margin="5" Click="Button_Click"/>
        </StackPanel>

        <StatusBar Grid.Row="2" Height="25">
            <StatusBarItem Content="Listo."/>
        </StatusBar>
    </Grid>
</Window>

// Código C# asociado para el evento Click del botón (MainWindow.xaml.cs)
using System.Windows;

namespace WpfApp
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent(); // Este método carga y procesa el XAML
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show($"Has escrito: {MyTextBox.Text}", "Mensaje desde WPF");
        }
    }
}

// Ejemplo incorrecto: Intentar crear interfaces complejas en WPF solo con código C#
// Aunque es posible, es mucho más tedioso y menos legible que usar XAML.
/*
// Mal ejemplo de cómo NO construir una UI compleja en C# (para WPF)
Button btn = new Button();
btn.Content = "Click Me";
Grid.SetRow(btn, 0); // No es tan declarativo como XAML
// ... y así para cada propiedad y evento
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Desarrollo de Aplicaciones de Escritorio',
    'topic': 'Windows Presentation Foundation (WPF)',
    'subtopic': 'Data Binding básico',
    'definition': r'''
El Data Binding (enlace de datos) es una de las características más potentes y elegantes de WPF. Piensa en ello como una conexión automática y en tiempo real entre la interfaz de usuario y los datos subyacentes de tu aplicación. Es como si un espejo mágico mostrara siempre el estado actual de tus datos, y si cambian los datos, el espejo se actualiza automáticamente.

¿Te estás preguntando por qué esto importa? 

Sin Data Binding, tendrías que escribir un montón de código para mover datos manualmente entre tus controles de UI y tus objetos de negocio. Por ejemplo, cada vez que el usuario escribe algo en un `TextBox`, tendrías que leer el texto y asignarlo a una propiedad de tu objeto. Y cada vez que una propiedad de tu objeto cambia, tendrías que actualizar manualmente el `TextBox`. El Data Binding elimina toda esa plomería de código, haciendo que tu aplicación sea más limpia, más fácil de mantener y menos propensa a errores.

El Data Binding en WPF se basa en el patrón MVVM (Model-View-ViewModel), aunque puedes usarlo sin adherirte estrictamente a él. Consiste en enlazar una propiedad de un control de UI (el "target" o objetivo) a una propiedad de un objeto de datos (el "source" o fuente). La magia ocurre cuando la propiedad del source implementa `INotifyPropertyChanged`, una interfaz que notifica a la UI cuando un valor ha cambiado, permitiendo que la interfaz se actualice automáticamente. Hay diferentes modos de Data Binding: `OneWay` (los cambios en el source actualizan la UI), `TwoWay` (los cambios en el source actualizan la UI y viceversa, ideal para campos de entrada), y `OneTime` (la UI se actualiza una sola vez al inicio). Es una característica que te permite construir interfaces de usuario que reflejan dinámicamente el estado de tus datos con muy poco código.
''',
    'code_example': r'''
<Window x:Class="WpfApp.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Data Binding Básico" Height="200" Width="300">
    <StackPanel Margin="10">
        <Label Content="Nombre:"/>
        <TextBox Text="{Binding Name, Mode=TwoWay}" Width="200" HorizontalAlignment="Left"/>

        <Label Content="Edad:"/>
        <TextBox Text="{Binding Age, Mode=TwoWay}" Width="50" HorizontalAlignment="Left"/>

        <Label Content="Información del usuario (OneWay):"/>
        <TextBlock Text="{Binding FullInfo}" FontSize="14" Margin="0,10,0,0"/>

        <Button Content="Cambiar Nombre" Margin="0,10,0,0" Click="ChangeNameButton_Click"/>
    </StackPanel>
</Window>

// Código C# (MainWindow.xaml.cs y UserViewModel.cs)

// UserViewModel.cs - Este es nuestro "source" de datos
using System.ComponentModel; // Necesario para INotifyPropertyChanged
using System.Runtime.CompilerServices; // Para el atributo CallerMemberName

namespace WpfApp
{
    public class UserViewModel : INotifyPropertyChanged
    {
        private string _name;
        public string Name
        {
            get { return _name; }
            set
            {
                if (_name != value)
                {
                    _name = value;
                    OnPropertyChanged(); // Notifica a la UI que la propiedad ha cambiado
                    OnPropertyChanged(nameof(FullInfo)); // Notifica que FullInfo también cambia
                }
            }
        }

        private int _age;
        public int Age
        {
            get { return _age; }
            set
            {
                if (_age != value)
                {
                    _age = value;
                    OnPropertyChanged();
                    OnPropertyChanged(nameof(FullInfo));
                }
            }
        }

        public string FullInfo => $"{Name} tiene {Age} años.";

        // Implementación de INotifyPropertyChanged
        public event PropertyChangedEventHandler PropertyChanged;

        protected void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}

// MainWindow.xaml.cs - Establece el DataContext
using System.Windows;

namespace WpfApp
{
    public partial class MainWindow : Window
    {
        private UserViewModel _viewModel;

        public MainWindow()
        {
            InitializeComponent();
            _viewModel = new UserViewModel { Name = "Juan Pérez", Age = 30 };
            this.DataContext = _viewModel; // Establece el contexto de datos para el Data Binding
        }

        private void ChangeNameButton_Click(object sender, RoutedEventArgs e)
        {
            // Cambiar la propiedad en el ViewModel, y la UI se actualizará automáticamente
            _viewModel.Name = "Ana García";
            _viewModel.Age = 25;
        }
    }
}

// Ejemplo incorrecto de "Data Binding" manual y tedioso (sin usar el sistema de WPF):
/*
// En el evento TextChanged del TextBox:
private void MyTextBox_TextChanged(object sender, TextChangedEventArgs e)
{
    _viewModel.Name = MyTextBox.Text; // Actualización manual del ViewModel
}

// Cada vez que el ViewModel cambia, actualizar la UI manualmente:
// Esto implicaría añadir eventos personalizados en el ViewModel y manejadores en la UI.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Jr',
    'level': 2,
    'title_level': 'Desarrollo de Aplicaciones de Escritorio',
    'topic': 'Windows Presentation Foundation (WPF)',
    'subtopic': 'Estilos y recursos',
    'definition': r'''
Los estilos y recursos en WPF son como los "temas" y "librerías de diseño" para tus aplicaciones, permitiéndote definir la apariencia y el comportamiento de tus elementos de UI de manera centralizada y reutilizable. Pensemos por un momento en esto como tener un manual de estilo para una marca: todas las comunicaciones deben seguir ciertas fuentes, colores y diseños, asegurando consistencia.

¿Te estás preguntando por qué esto importa? 

Porque sin estilos y recursos, cada vez que quisieras que un botón tuviera un color específico o una fuente particular, tendrías que aplicar esas propiedades individualmente a cada botón. Esto es ineficiente, propenso a errores y hace que sea muy difícil cambiar la apariencia de tu aplicación globalmente. Los estilos y recursos te permiten mantener una apariencia consistente, acelerar el desarrollo y facilitar el mantenimiento y la actualización del diseño.

Un "recurso" en WPF es un objeto (como un color, un pincel, una plantilla o incluso un estilo completo) que puedes definir en un lugar y luego reutilizarlo en múltiples partes de tu aplicación. Los recursos se definen dentro de `<Window.Resources>`, `<Application.Resources>` o en archivos `ResourceDictionary` separados. Un "estilo" es un conjunto de propiedades que se aplican a un tipo de control (por ejemplo, todos los `Button`s) o a controles individuales mediante una clave. Puedes definir un `TargetType` para un estilo, lo que hace que se aplique automáticamente a todos los controles de ese tipo. Los estilos pueden heredar de otros estilos y pueden contener "setters" para propiedades (como `Background="Blue"` o `FontSize="16"`) y "triggers" que cambian la apariencia basada en el estado del control (por ejemplo, cambiar el color de un botón cuando el mouse pasa por encima). Esto te da un control increíble sobre el look and feel de tu aplicación, permitiéndote crear interfaces atractivas y profesionales con menos código repetitivo.
''',
    'code_example': r'''
<Application x:Class="WpfApp.App"
             xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
             xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
             StartupUri="MainWindow.xaml">
    <Application.Resources>
        <SolidColorBrush x:Key="PrimaryBlueBrush" Color="#FF3F51B5"/>

        <Style TargetType="Button">
            <Setter Property="Background" Value="{StaticResource PrimaryBlueBrush}"/>
            <Setter Property="Foreground" Value="White"/>
            <Setter Property="FontSize" Value="14"/>
            <Setter Property="Padding" Value="10,5"/>
            <Setter Property="Margin" Value="5"/>
            <Style.Triggers>
                <Trigger Property="IsMouseOver" Value="True">
                    <Setter Property="Background" Value="DarkBlue"/>
                </Trigger>
            </Style.Triggers>
        </Style>

        <Style x:Key="AccentButtonStyle" TargetType="Button" BasedOn="{StaticResource {x:Type Button}}">
            <Setter Property="Background" Value="OrangeRed"/>
            <Setter Property="BorderBrush" Value="OrangeRed"/>
            <Setter Property="FontWeight" Value="Bold"/>
        </Style>

        <DataTemplate x:Key="MyCustomTemplate">
            <StackPanel Orientation="Horizontal">
                <TextBlock Text="{Binding Name}" FontWeight="Bold"/>
                <TextBlock Text=" (" Margin="5,0,0,0"/>
                <TextBlock Text="{Binding Age}"/>
                <TextBlock Text=")"/>
            </StackPanel>
        </DataTemplate>

    </Application.Resources>
</Application>

<Window x:Class="WpfApp.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Estilos y Recursos" Height="300" Width="400">
    <StackPanel Margin="10">
        <Button Content="Botón Normal"/>

        <Button Content="Botón de Aceno" Style="{StaticResource AccentButtonStyle}"/>

        <Border BorderBrush="{StaticResource PrimaryBlueBrush}" BorderThickness="2" Padding="5" Margin="5">
            <TextBlock Text="Texto con borde azul" Foreground="{StaticResource PrimaryBlueBrush}"/>
        </Border>

        <ListBox x:Name="MyListBox" Margin="0,10,0,0" ItemTemplate="{StaticResource MyCustomTemplate}">
            </ListBox>
    </StackPanel>
</Window>

// Código C# (MainWindow.xaml.cs)
using System.Collections.ObjectModel;
using System.Windows;

namespace WpfApp
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            // Llenar el ListBox con datos para demostrar el DataTemplate
            ObservableCollection<Person> people = new ObservableCollection<Person>
            {
                new Person { Name = "Alice", Age = 30 },
                new Person { Name = "Bob", Age = 24 },
                new Person { Name = "Charlie", Age = 35 }
            };
            MyListBox.ItemsSource = people;
        }
    }

    public class Person // Clase simple para demostrar el DataTemplate
    {
        public string Name { get; set; }
        public int Age { get; set; }
    }
}

// Ejemplo incorrecto: Aplicar propiedades de diseño individualmente a cada control
/*
// En C# o XAML, esto sería tedioso para cada botón:
<Button Content="Botón 1" Background="Blue" Foreground="White" FontSize="14"/>
<Button Content="Botón 2" Background="Blue" Foreground="White" FontSize="14"/>
// ... y así sucesivamente, sin la reusabilidad de un estilo.
*/
'''
  });
}

Future<void> insertPuntonetJrLevel3Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Desarrollo de Aplicaciones Web',
    'topic': 'ASP.NET Web Forms',
    'subtopic': 'Ciclo de vida de una página',
    'definition': r'''
El ciclo de vida de una página en ASP.NET Web Forms es una secuencia de eventos que ocurren desde que un usuario solicita una página hasta que la respuesta se envía de vuelta al navegador. Piensa en ello como el guion de una obra de teatro: cada actor (o componente de la página) tiene su momento exacto para entrar en escena, realizar su parte y luego salir.

¿Te estás preguntando por qué esto importa? 

Entender el ciclo de vida es fundamental para saber dónde colocar tu código. Si intentas acceder a un control antes de que se haya creado, o guardar datos después de que se hayan perdido, te encontrarás con errores o comportamientos inesperados. Saber el orden te permite ejecutar tu lógica en el momento preciso para lograr el efecto deseado.

Cuando un usuario solicita una página ASP.NET, se suceden varias fases importantes:
1.  **Inicialización de la Página:** Se crean los controles de la página y se cargan sus propiedades iniciales.
2.  **Carga de ViewState:** Si es un postback (es decir, la página se está volviendo a cargar después de una interacción del usuario, como un clic de botón), el estado de los controles se restaura a partir del ViewState.
3.  **Carga de Controles (Control Load):** Cada control en la página se carga de forma recursiva. Es un buen momento para inicializar propiedades de controles o datos.
4.  **Manejo de Eventos Postback:** Si hubo un evento (como un clic de botón), los métodos asociados a esos eventos se ejecutan aquí.
5.  **Guardado de ViewState:** El estado actual de la página y sus controles se guarda en el ViewState para el próximo postback.
6.  **Renderizado:** La página y sus controles se renderizan en HTML, que es lo que finalmente se envía al navegador del usuario.
7.  **Descarte (Unload):** Una vez que la página se ha renderizado y enviado, los objetos de la página se limpian y se preparan para la recolección de basura.

Cada una de estas fases tiene sus propios eventos (`Page_Init`, `Page_Load`, etc.) a los que puedes suscribirte en tu código para ejecutar lógica específica. Dominar este flujo te da un control preciso sobre cómo y cuándo se comporta tu aplicación web.
''',
    'code_example': r'''
// Ejemplo básico del ciclo de vida de una página ASP.NET Web Forms en C#
// (Este código va en el archivo .aspx.cs de tu página)

using System;
using System.Web.UI; // Namespace principal para Web Forms
using System.Web.UI.WebControls; // Para controles como Label, Button, etc.

public partial class Default : Page // 'partial' porque la otra parte está en el .aspx
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        // Se ejecuta antes de la inicialización de la página y los controles.
        // Útil para configurar propiedades de página, como la página maestra.
        Response.Write("<p>1. Page_PreInit se ha ejecutado.</p>");
    }

    protected void Page_Init(object sender, EventArgs e)
    {
        // Se ejecuta después de la inicialización de los controles.
        // Los controles ya están disponibles aquí.
        Response.Write("<p>2. Page_Init se ha ejecutado.</p>");
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        // Se ejecuta cuando la página se carga por primera vez o en cada postback.
        // Es un buen lugar para cargar datos que solo deben cargarse una vez (usando !IsPostBack).
        Response.Write("<p>3. Page_Load se ha ejecutado.</p>");

        if (!IsPostBack) // Si la página se carga por primera vez
        {
            // Ejemplo de código que solo se ejecuta en la carga inicial
            MyLabel.Text = "Página cargada por primera vez.";
        }
        else // Si es un postback
        {
            MyLabel.Text += " (Postback)";
        }
    }

    protected void Button_Click(object sender, EventArgs e)
    {
        // Este es un evento de control, se dispara después de Page_Load en un postback.
        Response.Write("<p>4. Button_Click se ha ejecutado.</p>");
        MyLabel.Text = "¡Botón clickeado!";
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        // Se ejecuta justo antes de que la página se renderice en HTML.
        // Última oportunidad para hacer cambios antes de enviar la salida.
        Response.Write("<p>5. Page_PreRender se ha ejecutado.</p>");
    }

    protected void Page_Unload(object sender, EventArgs e)
    {
        // Se ejecuta después de que la página ha sido renderizada y enviada al cliente.
        // Útil para limpiar recursos, pero Response.Write no funcionará aquí.
        // Response.Write("<p>6. Page_Unload se ha ejecutado.</p>"); // Esto no se verá
    }
}

// // <%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>
// <!DOCTYPE html>
// <html xmlns="http://www.w3.org/1999/xhtml">
// <head runat="server">
//     <title>Ciclo de Vida Web Forms</title>
// </head>
// <body>
//     <form id="form1" runat="server">
//         <div>
//             <asp:Label ID="MyLabel" runat="server" Text=""></asp:Label><br />
//             <asp:Button ID="MyButton" runat="server" Text="Hacer Postback" OnClick="Button_Click" />
//         </div>
//     </form>
// </body>
// </html>

// Ejemplo incorrecto: Intentar manipular controles en Page_PreInit si no han sido creados,
// o intentar cambiar el contenido de la respuesta en Page_Unload.
// Ambos llevarían a errores o a un comportamiento no deseado porque no es el momento adecuado en el ciclo.
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Desarrollo de Aplicaciones Web',
    'topic': 'ASP.NET Web Forms',
    'subtopic': 'Controles de servidor y eventos',
    'definition': r'''
Los controles de servidor y los eventos son los bloques de construcción interactivos en ASP.NET Web Forms. Piensa en ellos como los botones, las cajas de texto y los menús que ves en cualquier sitio web, pero con una diferencia clave: son "inteligentes" y pueden ser manipulados directamente desde tu código C# o VB.NET en el servidor.

¿Te estás preguntando por qué esto importa? 

Porque estos controles te permiten crear interfaces de usuario dinámicas sin tener que escribir mucho JavaScript en el lado del cliente. Puedes arrastrar y soltar un botón, darle un ID y luego, en tu código de servidor, responder a su evento `Click` como si fuera una aplicación de escritorio. Esto simplifica mucho el desarrollo web para aquellos que vienen de entornos de escritorio.

Un "control de servidor" es un objeto en la página ASP.NET que el servidor procesa. Tienen la propiedad `runat="server"` en su declaración HTML/ASPX. Cuando el servidor procesa la página, estos controles se convierten en HTML estándar, JavaScript y CSS que el navegador puede entender. Hay una gran variedad de controles, desde los más básicos como `TextBox`, `Button`, `Label`, `HyperLink`, hasta controles más complejos como `GridView` (para mostrar datos en tablas), `Calendar`, `FileUpload`, y `ValidationSummary`. Cada control tiene propiedades que puedes configurar (como `Text` para una etiqueta o `CssClass` para aplicar estilos) y eventos a los que puedes suscribirte. Cuando un evento se dispara en el navegador (por ejemplo, un clic de botón), el formulario se "postea" al servidor (un postback), y ASP.NET identifica qué control disparó el evento y ejecuta el manejador de eventos correspondiente en tu código de servidor. Esto abstrae gran parte de la complejidad de la interacción cliente-servidor que tendrías que manejar manualmente en HTML/JavaScript puro.
''',
    'code_example': r'''
// Ejemplo de controles de servidor y manejo de eventos en ASP.NET Web Forms

// // <%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>
// <!DOCTYPE html>
// <html xmlns="http://www.w3.org/1999/xhtml">
// <head runat="server">
//     <title>Controles de Servidor y Eventos</title>
// </head>
// <body>
//     <form id="form1" runat="server">
//         <div>
//             <h2>Formulario de Contacto</h2>
//             <asp:Label ID="NameLabel" runat="server" Text="Nombre: "></asp:Label>
//             <asp:TextBox ID="NameTextBox" runat="server"></asp:TextBox><br /><br />

//             <asp:Label ID="EmailLabel" runat="server" Text="Email: "></asp:Label>
//             <asp:TextBox ID="EmailTextBox" runat="server" TextMode="Email"></asp:TextBox><br /><br />

//             <asp:Button ID="SubmitButton" runat="server" Text="Enviar Mensaje" OnClick="SubmitButton_Click" /><br /><br />

//             <asp:Literal ID="MessageLiteral" runat="server"></asp:Literal>
//         </div>
//     </form>
// </body>
// </html>

// Código C# (Default.aspx.cs)
using System;
using System.Web.UI;
using System.Web.UI.WebControls; // Necesario para los controles de servidor

public partial class Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // En la carga inicial de la página, podemos configurar propiedades de los controles
        if (!IsPostBack)
        {
            MessageLiteral.Text = "Bienvenido, por favor llena el formulario.";
            NameTextBox.Focus(); // Pone el foco en el campo de nombre
        }
    }

    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        // Este método se ejecuta cuando se hace clic en SubmitButton
        string name = NameTextBox.Text;
        string email = EmailTextBox.Text;

        // Validaciones simples (más robustas se hacen con controles de validación)
        if (string.IsNullOrWhiteSpace(name) || string.IsNullOrWhiteSpace(email))
        {
            MessageLiteral.Text = "<span style='color: red;'>Por favor, completa todos los campos.</span>";
        }
        else
        {
            MessageLiteral.Text = $"<span style='color: green;'>¡Gracias, {name}! Tu mensaje ha sido enviado desde {email}.</span>";
            // Limpiar campos después de enviar
            NameTextBox.Text = string.Empty;
            EmailTextBox.Text = string.Empty;
        }
    }

    // Ejemplo incorrecto: Intentar manipular elementos HTML directamente sin que sean controles de servidor.
    // Si tuvieras un <input type="text" id="myInput"> sin runat="server", no podrías accederlo como
    // myInput.Value en el code-behind. Tendrías que usar Request.Form["myInput"] que es más manual.
    /*
    protected void BadExample_Click(object sender, EventArgs e)
    {
        // Esto NO funcionaría si MyDiv no tiene runat="server"
        // MyDiv.InnerHtml = "Texto cambiado";

        // Deberías usar un Literal o Panel con runat="server"
        // <asp:Literal ID="MyDiv" runat="server"></asp:Literal>
        // MyDiv.Text = "Texto cambiado";
    }
    */
}
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Desarrollo de Aplicaciones Web',
    'topic': 'ASP.NET Web Forms',
    'subtopic': 'Manejo de estado (ViewState, Session)',
    'definition': r'''
El manejo de estado en ASP.NET Web Forms es cómo la aplicación "recuerda" cosas entre diferentes solicitudes HTTP. Pensemos por un momento en esto como la memoria de un asistente personal: necesita recordar tu nombre, tus preferencias y lo que le dijiste hace un momento para poder seguir la conversación de manera coherente.

¿Te estás preguntando por qué esto importa? 

Porque HTTP es un protocolo sin estado. Cada vez que tu navegador hace una solicitud a un servidor, es como si fuera la primera vez; el servidor no "recuerda" nada de la solicitud anterior. Para que una aplicación web sea útil y pueda mantener una conversación con el usuario (por ejemplo, recordar los artículos de un carrito de compras o los datos introducidos en un formulario), necesitamos mecanismos para persistir esa información entre las solicitudes.

ASP.NET Web Forms nos ofrece varias opciones para manejar este estado, siendo `ViewState` y `Session` dos de las más comunes:

* **ViewState:** Es un mecanismo a nivel de página. Cuando un usuario hace un postback (envía el formulario), el estado de los controles de la página se guarda en un campo oculto llamado `__VIEWSTATE` en el HTML de la página. Cuando la página se vuelve a enviar al servidor, este campo oculto se lee y ASP.NET utiliza esa información para restaurar el estado de los controles a como estaban antes del postback. Es útil para el estado de los controles de UI y es transparente para el desarrollador, pero puede hacer que el tamaño de la página HTML sea grande si se usa mucho.

* **Session State:** Es un mecanismo a nivel de usuario (sesión). Permite almacenar datos en el servidor que son específicos de un usuario en particular y persisten a través de múltiples solicitudes de ese mismo usuario. Piensa en ello como un pequeño espacio de almacenamiento exclusivo para cada visitante de tu sitio. Los datos de sesión se almacenan en el servidor, lo que significa que no se envían de ida y vuelta con cada solicitud HTTP, lo que puede ser más seguro y eficiente para grandes cantidades de datos. Sin embargo, si el servidor se reinicia o si usas una granja de servidores sin una configuración adecuada, podrías perder los datos de sesión.

Hay otras opciones como `Application State` (para datos globales de la aplicación), `Cookies` (pequeños archivos de texto en el cliente) y `Query String` (datos en la URL), cada una con sus pros y contras. La clave es elegir la estrategia de manejo de estado adecuada según el tipo y la cantidad de datos que necesites persistir y la duración deseada.
''',
    'code_example': r'''
// Ejemplo de manejo de estado con ViewState y Session en ASP.NET Web Forms

// // <%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" EnableViewState="true" %>
// <!DOCTYPE html>
// <html xmlns="http://www.w3.org/1999/xhtml">
// <head runat="server">
//     <title>Manejo de Estado</title>
// </head>
// <body>
//     <form id="form1" runat="server">
//         <div>
//             <asp:Label ID="ViewStateCountLabel" runat="server" Text="Contador ViewState: "></asp:Label>
//             <asp:Button ID="ViewStateButton" runat="server" Text="Incrementar ViewState" OnClick="ViewStateButton_Click" /><br /><br />

//             <asp:Label ID="SessionCountLabel" runat="server" Text="Contador Session: "></asp:Label>
//             <asp:Button ID="SessionButton" runat="server" Text="Incrementar Session" OnClick="SessionButton_Click" /><br /><br />

//             <asp:Button ID="RefreshButton" runat="server" Text="Recargar Página (sin postback de botón)" />
//         </div>
//     </form>
// </body>
// </html>

// Código C# (Default.aspx.cs)
using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState; // Necesario para SessionState

public partial class Default : Page
{
    private int _viewStateCounter;

    protected void Page_Load(object sender, EventArgs e)
    {
        // Inicializar ViewState si es la primera carga
        if (!IsPostBack)
        {
            ViewState["MyViewStateCounter"] = 0; // Se guarda en ViewState
            Session["MySessionCounter"] = 0; // Se guarda en Session
        }

        // Recuperar valores del ViewState y Session
        _viewStateCounter = (int)ViewState["MyViewStateCounter"];
        int sessionCounter = (int)Session["MySessionCounter"];

        ViewStateCountLabel.Text = $"Contador ViewState: {_viewStateCounter}";
        SessionCountLabel.Text = $"Contador Session: {sessionCounter}";
    }

    protected void ViewStateButton_Click(object sender, EventArgs e)
    {
        _viewStateCounter++; // Incrementa la variable local
        ViewState["MyViewStateCounter"] = _viewStateCounter; // Guarda el nuevo valor en ViewState
        ViewStateCountLabel.Text = $"Contador ViewState: {_viewStateCounter}";
        // Este contador solo persistirá para esta página en este usuario.
        // Si el usuario navega a otra página y regresa, se reinicia (a menos que lo pases entre páginas).
    }

    protected void SessionButton_Click(object sender, EventArgs e)
    {
        int sessionCounter = (int)Session["MySessionCounter"];
        sessionCounter++;
        Session["MySessionCounter"] = sessionCounter; // Guarda el nuevo valor en Session
        SessionCountLabel.Text = $"Contador Session: {sessionCounter}";
        // Este contador persistirá para la sesión del usuario a través de múltiples páginas.
        // Se reinicia cuando la sesión expira o el usuario cierra el navegador.
    }

    // Ejemplo incorrecto: Intentar usar variables locales sin ViewState o Session para persistir datos.
    // Cada vez que se hace un postback, las variables locales se reinician.
    /*
    private int _localCounter = 0; // Esta variable se reinicia en cada postback

    protected void BadLocalCounterButton_Click(object sender, EventArgs e)
    {
        _localCounter++;
        MessageBox.Show($"Contador local: {_localCounter}"); // Siempre mostrará 1 después del primer clic en cada postback
    }
    */
}
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Desarrollo de Aplicaciones Web',
    'topic': 'ASP.NET MVC',
    'subtopic': 'Patrón Modelo-Vista-Controlador',
    'definition': r'''
El patrón Modelo-Vista-Controlador (MVC) es una forma de organizar el código de tu aplicación web, separando las responsabilidades de cada parte. Piensa en ello como si fueras a construir un sistema de información para un restaurante: el Modelo es la cocina (donde se preparan los platos y se gestiona el inventario), la Vista es el comedor (donde se presentan los platos a los clientes), y el Controlador es el camarero (quien toma los pedidos de los clientes y se los pasa a la cocina, y luego entrega los platos de la cocina a los clientes).

¿Te estás preguntando por qué esto importa? 

Porque el patrón MVC promueve la separación de intereses, lo que hace que tu código sea más organizado, fácil de entender, mantener y probar. Si todo tu código estuviera mezclado en un solo lugar, sería un caos indescifrable, especialmente en proyectos grandes. MVC permite que diferentes miembros del equipo trabajen en distintas partes de la aplicación al mismo tiempo sin pisarse.

Aquí te explico cada componente:
* **Modelo (Model):** Representa los datos y la lógica de negocio de tu aplicación. Incluye las clases que definen tus objetos (como `Producto`, `Usuario`), las reglas de negocio (cómo se calcula un precio, cómo se valida un usuario) y cómo se interactúa con la base de datos. El Modelo no sabe nada de la interfaz de usuario.
* **Vista (View):** Es la interfaz de usuario, lo que el usuario ve y con lo que interactúa. En ASP.NET MVC, las Vistas suelen ser archivos `.cshtml` (para Razor) que contienen HTML, CSS y un poco de código de servidor para mostrar los datos que recibe del Controlador. La Vista no tiene lógica de negocio ni manipula datos directamente; solo muestra lo que el Controlador le dice que muestre.
* **Controlador (Controller):** Actúa como intermediario. Recibe las solicitudes del usuario (por ejemplo, cuando acceden a una URL), interactúa con el Modelo para obtener o manipular datos, y luego selecciona la Vista adecuada para mostrar la información al usuario. El Controlador es el cerebro que coordina la interacción entre el Modelo y la Vista.

Esta separación facilita el desarrollo, las pruebas unitarias (especialmente del Modelo y Controlador) y la evolución de la aplicación a lo largo del tiempo.
''',
    'code_example': r'''
// Ejemplo conceptual del patrón Modelo-Vista-Controlador en ASP.NET MVC

// 1. Modelo (Model) - Define los datos y la lógica de negocio
// Models/Product.cs
namespace MyWebApp.Models
{
    public class Product
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public string Description { get; set; }

        // Lógica de negocio sencilla, por ejemplo, aplicar descuento
        public decimal GetDiscountedPrice(decimal discountPercentage)
        {
            return Price * (1 - discountPercentage / 100);
        }
    }
}

// 2. Controlador (Controller) - Maneja las solicitudes, interactúa con el Modelo y selecciona la Vista
// Controllers/ProductsController.cs
using Microsoft.AspNetCore.Mvc; // Para ASP.NET Core MVC (similar en .NET Framework MVC)
using MyWebApp.Models;
using System.Collections.Generic;
using System.Linq;

namespace MyWebApp.Controllers
{
    public class ProductsController : Controller
    {
        // Simulamos una base de datos de productos
        private static List<Product> _products = new List<Product>
        {
            new Product { Id = 1, Name = "Laptop", Price = 1200.00m, Description = "Potente laptop para trabajo y juego." },
            new Product { Id = 2, Name = "Mouse", Price = 25.00m, Description = "Mouse ergonómico." }
        };

        // Acción para mostrar la lista de productos
        public IActionResult Index()
        {
            // El controlador interactúa con el modelo (en este caso, nuestra lista simulada)
            return View(_products); // Pasa la lista de productos a la vista
        }

        // Acción para mostrar los detalles de un producto
        public IActionResult Details(int id)
        {
            Product product = _products.FirstOrDefault(p => p.Id == id);
            if (product == null)
            {
                return NotFound(); // Retorna un error 404 si el producto no se encuentra
            }
            return View(product); // Pasa un solo producto a la vista
        }
    }
}

// 3. Vista (View) - Renderiza la interfaz de usuario usando los datos del Modelo
// Views/Products/Index.cshtml
@model List<MyWebApp.Models.Product> // Declara el tipo de modelo que espera esta vista

@{
    ViewData["Title"] = "Lista de Productos";
}

<h1>Lista de Productos</h1>

<table class="table">
    <thead>
        <tr>
            <th>Nombre</th>
            <th>Precio</th>
            <th>Descripción</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        @foreach (var item in Model) // Itera sobre la lista de productos recibida del controlador
        {
            <tr>
                <td>@Html.DisplayFor(modelItem => item.Name)</td>
                <td>@Html.DisplayFor(modelItem => item.Price)</td>
                <td>@Html.DisplayFor(modelItem => item.Description)</td>
                <td>
                    <a asp-action="Details" asp-route-id="@item.Id">Detalles</a>
                </td>
            </tr>
        }
    </tbody>
</table>

// Views/Products/Details.cshtml
@model MyWebApp.Models.Product

@{
    ViewData["Title"] = "Detalles del Producto";
}

<h1>Detalles del Producto</h1>

<div>
    <h4>@Html.DisplayFor(model => model.Name)</h4>
    <hr />
    <dl class="row">
        <dt class = "col-sm-2">
            @Html.DisplayNameFor(model => model.Price)
        </dt>
        <dd class = "col-sm-10">
            @Html.DisplayFor(model => model.Price)
        </dd>
        <dt class = "col-sm-2">
            @Html.DisplayNameFor(model => model.Description)
        </dt>
        <dd class = "col-sm-10">
            @Html.DisplayFor(model => model.Description)
        </dd>
    </dl>
</div>
<div>
    <a asp-action="Index">Volver a la lista</a>
</div>

// Ejemplo incorrecto: Mezclar lógica de negocio en la vista o lógica de interfaz en el modelo.
// Por ejemplo, que la vista directamente acceda a una base de datos o que el modelo contenga HTML.
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Desarrollo de Aplicaciones Web',
    'topic': 'ASP.NET MVC',
    'subtopic': 'Ruteo y controladores',
    'definition': r'''
El ruteo (routing) y los controladores (controllers) son los pilares de cómo ASP.NET MVC maneja las solicitudes web. Pensemos por un momento en esto como el sistema de correos de un gran edificio de oficinas: el ruteo es quien decide a qué departamento (controlador) y a qué persona (acción) debe ir cada carta (solicitud web), basándose en la dirección escrita en el sobre (la URL).

¿Te estás preguntando por qué esto importa? 

Porque el ruteo te permite tener URLs amigables y limpias, lo que es bueno tanto para los usuarios (son más fáciles de recordar y compartir) como para el SEO (posicionamiento en buscadores). Y los controladores son el punto central donde se recibe esa solicitud y se decide qué hacer con ella, conectando tu lógica de negocio con la interfaz de usuario. Sin un ruteo y controladores bien definidos, tu aplicación web no sabría cómo responder a las peticiones.

En ASP.NET MVC, el ruteo es el primer paso cuando una solicitud llega al servidor. Una "tabla de ruteo" (definida en tu `Program.cs` o `Startup.cs` en .NET Core, o `RouteConfig.cs` en .NET Framework MVC) contiene patrones de URL predefinidos. El motor de ruteo toma la URL de la solicitud entrante y la compara con estos patrones para determinar qué controlador y qué método de acción dentro de ese controlador deben manejar la solicitud.

Los "controladores" son clases C# (o VB.NET) que heredan de `Controller` y que contienen métodos públicos llamados "acciones". Cada acción es responsable de manejar un tipo específico de solicitud HTTP (GET, POST, PUT, DELETE). Por ejemplo, si tienes una URL como `/Productos/Detalles/5`, el ruteo la mapearía al `ProductosController` y al método `Details` (acción), pasándole el `5` como parámetro. Dentro del método de acción, es donde interactúas con tu Modelo (para obtener o guardar datos) y finalmente eliges una Vista para renderizar la respuesta. Es esta combinación de ruteo flexible y controladores organizados lo que da a ASP.NET MVC su estructura limpia y su capacidad de gestionar solicitudes de manera eficiente.
''',
    'code_example': r'''
// Ejemplo de ruteo y controladores en ASP.NET MVC (ejemplo basado en .NET Core/5+, similar en .NET Framework MVC)

// 1. Configuración de Ruteo (Program.cs en .NET 6+ o Startup.cs en versiones anteriores)
// Aquí se define cómo las URLs se mapean a controladores y acciones.
/*
// En Program.cs
var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews(); // Habilita MVC

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting(); // Habilita el middleware de ruteo

app.UseAuthorization();

// Define el patrón de ruteo por defecto: {controller}/{action}/{id?}
// 'Home' es el controlador por defecto, 'Index' la acción por defecto, 'id' es opcional
app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
*/

// 2. Controlador (Ejemplo: HomeController.cs)
using Microsoft.AspNetCore.Mvc;
using MyWebApp.Models; // Asumiendo que tienes un modelo

namespace MyWebApp.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        // Acción por defecto: se accede vía /Home o /
        // URL amigable: /
        public IActionResult Index()
        {
            _logger.LogInformation("Acción Index del HomeController ejecutada.");
            return View(); // Retorna la vista "Index.cshtml"
        }

        // Acción para mostrar información
        // URL amigable: /Home/About
        public IActionResult About()
        {
            ViewBag.Message = "Esta es la página de información de nuestra aplicación.";
            return View(); // Retorna la vista "About.cshtml"
        }

        // Acción con un parámetro (ej. /Home/Welcome/Juan)
        // URL amigable: /Home/Welcome/{name}
        public IActionResult Welcome(string name = "Visitante")
        {
            ViewBag.Greeting = $"¡Hola, {name}!";
            return View(); // Retorna la vista "Welcome.cshtml"
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}

// Ejemplo incorrecto de ruteo: No definir una ruta para una acción.
// Si tuvieras una acción `public IActionResult Contact()` pero no hay ruta que la mapee,
// al intentar acceder a /Home/Contact, el servidor devolvería un error 404 (Not Found).
// Otro error común es que los nombres de las acciones no terminen con 'Async' si son asíncronas
// y se omitan los sufijos, lo cual puede generar warnings o problemas si no se maneja bien el Task.
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Jr',
    'level': 3,
    'title_level': 'Desarrollo de Aplicaciones Web',
    'topic': 'ASP.NET MVC',
    'subtopic': 'Vistas y Razor',
    'definition': r'''
Las Vistas y el motor de plantillas Razor son la forma en que ASP.NET MVC genera el HTML dinámico que se envía al navegador del usuario. Pensemos por un momento en esto como la impresora 3D de tu aplicación web: le das un "plano" (la vista Razor) y los "materiales" (los datos del modelo), y ella construye el producto final (el HTML) para que el usuario lo vea.

¿Te estás preguntando por qué esto importa? 

Porque las Vistas son la parte visible de tu aplicación. Un buen sistema de vistas permite que los diseñadores web (que quizás no son expertos en C#) trabajen en la interfaz, mientras que los desarrolladores se enfocan en la lógica. Razor, en particular, hace que la mezcla de HTML y código de servidor sea muy legible y fácil de escribir, reduciendo la verbosidad y haciendo que el desarrollo de la UI sea más eficiente.

Una "Vista" en ASP.NET MVC es típicamente un archivo `.cshtml` (o `.vbhtml` si usas VB.NET) que contiene una combinación de HTML, CSS y código de servidor incrustado usando la sintaxis de Razor. El "motor de vistas Razor" es lo que procesa este archivo en el servidor y lo convierte en HTML puro antes de enviarlo al navegador.

La sintaxis de Razor es compacta y amigable:
* Comienza con `@` para indicar que el código que sigue es código de servidor (C#).
* `@Model` se usa para acceder al objeto de modelo que el controlador pasó a la vista.
* `@Html.` proporciona métodos auxiliares para generar HTML (por ejemplo, `@Html.DisplayNameFor()` para nombres de propiedades).
* Los bloques de código se abren con `@` seguido de `{}` (ej. `@if (Model.Count > 0) { ... }`).
* Los bucles como `@foreach` se usan para iterar sobre colecciones de datos.

Razor es inteligente y puede inferir cuándo el código C# termina y comienza el HTML, lo que reduce la necesidad de etiquetas explícitas. Esto lo hace muy legible y potente para crear páginas web dinámicas. Además, las Vistas pueden usar "Layouts" (plantillas maestras) para definir el esqueleto común de tu sitio (cabecera, pie de página, navegación), y "Partial Views" para reutilizar fragmentos de UI en múltiples páginas.
''',
    'code_example': r'''
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>@ViewData["Title"] - Mi App Web</title>
    <link rel="stylesheet" href="~/lib/bootstrap/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="~/css/site.css" asp-append-version="true" />
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-sm navbar-toggleable-sm navbar-light bg-white border-bottom box-shadow mb-3">
            <div class="container">
                <a class="navbar-brand" asp-area="" asp-controller="Home" asp-action="Index">Mi App Web</a>
                </div>
        </nav>
    </header>
    <div class="container">
        <main role="main" class="pb-3">
            @RenderBody() </main>
    </div>
    <footer class="border-top footer text-muted">
        <div class="container">
            &copy; @DateTime.Now.Year - Mi App Web
        </div>
    </footer>
    <script src="~/lib/jquery/dist/jquery.min.js"></script>
    <script src="~/lib/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="~/js/site.js" asp-append-version="true"></script>
    @await RenderSectionAsync("Scripts", required: false) </body>
</html>

@model MyWebApp.Models.Product // Declaración del modelo que espera esta vista

@{
    ViewData["Title"] = "Página Principal"; // Establece el título de la página
}

<div class="text-center">
    <h1 class="display-4">¡Bienvenido a mi primera página Razor!</h1>
    <p>Aprende sobre <a href="https://docs.microsoft.com/aspnet/core">cómo construir apps web con ASP.NET Core</a>.</p>
</div>

@if (Model != null)
{
    <h2>Producto del Día: @Model.Name</h2>
    <p>Precio: @Model.Price.ToString("C")</p> <p>Descripción: @Model.Description</p>
}
else
{
    <p>No hay producto del día disponible.</p>
}

@section Scripts {
    <script>
        console.log("Script específico de Index.cshtml cargado.");
    </script>
}

// Product.cs (El modelo que se usa en la vista)
// (Ver ejemplo en el subtema de Patrón Modelo-Vista-Controlador)

// Ejemplo incorrecto: Intentar ejecutar código complejo de lógica de negocio directamente en la vista.
// Aunque Razor permite código C#, no es su propósito principal. La lógica debe estar en el controlador o modelo.
/*
// Mal ejemplo en la vista:
@{
    // Obtener datos directamente de una base de datos aquí (mala práctica)
    // List<Product> products = dbContext.Products.ToList();
}
*/
'''
  });
}

Future<void> insertPuntonetJrLevel4Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Acceso a Datos',
    'topic': 'ADO.NET',
    'subtopic': 'Conexión a bases de datos SQL Server',
    'definition': r'''
Conectarse a una base de datos SQL Server usando ADO.NET es el primer paso para que tu aplicación .NET pueda guardar y recuperar información de forma persistente. Pensemos por un momento en esto como establecer un puente de comunicación entre tu aplicación y el lugar donde se guardan todos los datos importantes.

¿Te estás preguntando por qué esto importa? 

Porque las aplicaciones raramente viven de forma aislada; casi todas necesitan interactuar con una base de datos para almacenar usuarios, productos, pedidos, o cualquier tipo de información que deba persistir más allá del tiempo de ejecución de la aplicación. SQL Server es una de las bases de datos más comunes en el ecosistema Microsoft, y ADO.NET es la tecnología fundamental para hablar con ella.

Para establecer una conexión, necesitas principalmente una "cadena de conexión" (connection string). Esta cadena es como la dirección postal completa y las credenciales de acceso a tu base de datos. Contiene información vital como el nombre del servidor donde reside la base de datos (por ejemplo, `.` para el servidor local, o una IP remota), el nombre de la base de datos a la que te quieres conectar, y las credenciales de autenticación (usuario y contraseña, o si se usa autenticación de Windows). Una vez que tienes la cadena de conexión, usas la clase `SqlConnection` para abrir y cerrar la conexión. Es súper importante que siempre cierres la conexión después de usarla para liberar recursos, aunque el bloque `using` es la forma más segura de asegurarte de que esto suceda automáticamente, incluso si hay errores. Esto previene fugas de recursos y mejora el rendimiento general de tu aplicación.
''',
    'code_example': r'''
// Ejemplo de conexión a una base de datos SQL Server con ADO.NET

using System;
using System.Data.SqlClient; // Necesario para SQL Server

namespace AdoNetDemo
{
    public class SqlConnectionDemo
    {
        public static void Main(string[] args)
        {
            // La cadena de conexión es crucial.
            // Data Source: Nombre del servidor SQL Server ('.' para SQL Express local).
            // Initial Catalog: Nombre de la base de datos a la que te quieres conectar.
            // Integrated Security: True (autenticación de Windows) o False (SQL Server Authentication).
            // Si Integrated Security es False, necesitas User ID y Password.
            string connectionString = "Data Source=.;Initial Catalog=MyDatabase;Integrated Security=True;";
            // string connectionString = "Server=myServerAddress;Database=myDataBase;User Id=myUsername;Password=myPassword;"; // Ejemplo con SQL Server Authentication

            // Usamos 'using' para asegurar que la conexión se cierre y se liberen los recursos automáticamente.
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    Console.WriteLine("¡Conexión a SQL Server establecida con éxito!");
                    // Aquí es donde iría el código para ejecutar comandos.
                }
                catch (SqlException ex)
                {
                    Console.WriteLine("Error al conectar a la base de datos:");
                    Console.WriteLine(ex.Message);
                }
                // La conexión se cerrará automáticamente al salir del bloque 'using'.
            }

            Console.WriteLine("Presiona cualquier tecla para salir.");
            Console.ReadKey();
        }
    }

    // Ejemplo incorrecto: No cerrar la conexión a la base de datos.
    // Esto puede llevar a problemas de rendimiento, bloqueos de base de datos y agotamiento de recursos.
    /*
    public static void BadConnectionExample()
    {
        SqlConnection connection = new SqlConnection("...");
        try
        {
            connection.Open();
            // Hacemos algo...
        }
        catch (SqlException ex)
        {
            Console.WriteLine("Error: " + ex.Message);
        }
        // ¡Olvido cerrar la conexión aquí!
    }
    */
}
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Acceso a Datos',
    'topic': 'ADO.NET',
    'subtopic': 'Ejecución de comandos y lectura de datos',
    'definition': r'''
Una vez que tienes la conexión a la base de datos, el siguiente paso es interactuar con ella: ejecutar comandos para insertar, actualizar, eliminar o, lo más común, leer datos. Piensa en esto como enviar instrucciones específicas a la cocina del restaurante para que preparen algo (insertar), modifiquen un plato (actualizar), retiren algo del menú (eliminar) o te digan qué hay disponible (leer).

¿Te estás preguntando por qué esto importa? 

Porque de nada sirve conectarse a una base de datos si no puedes hacer nada con ella. La ejecución de comandos es el corazón de la interacción de datos, permitiéndote que tu aplicación sea dinámica y pueda trabajar con la información que necesita.

Para ejecutar comandos en ADO.NET, usas la clase `SqlCommand`. Necesitas asociar este comando a tu `SqlConnection` abierta y proporcionarle el texto del comando SQL que quieres ejecutar. Hay tres tipos principales de ejecución:

1.  **`ExecuteNonQuery()`:** Se usa para comandos que no devuelven resultados, como `INSERT`, `UPDATE` o `DELETE`. Te devuelve el número de filas afectadas por la operación.
2.  **`ExecuteScalar()`:** Se usa para comandos que devuelven un solo valor, como un `COUNT(*)`, `SUM(column)` o un `SELECT` que sabes que retornará solo una celda. Retorna el valor de la primera columna de la primera fila.
3.  **`ExecuteReader()`:** Es el más usado para ejecutar consultas `SELECT` que devuelven múltiples filas y columnas. Retorna un objeto `SqlDataReader`, que te permite leer los resultados fila por fila, columna por columna, de manera eficiente y hacia adelante. Es importante cerrar el `SqlDataReader` después de usarlo, o mejor aún, usar un bloque `using` para que se cierre automáticamente.

Siempre es una buena práctica usar parámetros en tus comandos SQL (`@parameterName`) en lugar de concatenar cadenas directamente en la consulta. Esto no solo previene ataques de inyección SQL (un problema de seguridad grave), sino que también mejora la legibilidad y el rendimiento de tus consultas.
''',
    'code_example': r'''
// Ejemplo de ejecución de comandos y lectura de datos con ADO.NET

using System;
using System.Data.SqlClient; // Necesario para SQL Server

namespace AdoNetDemo
{
    public class SqlCommandsDemo
    {
        public static void Main(string[] args)
        {
            string connectionString = "Data Source=.;Initial Catalog=MyDatabase;Integrated Security=True;";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    Console.WriteLine("Conexión establecida.");

                    // --- 1. Ejecutar un comando INSERT (ExecuteNonQuery) ---
                    string insertSql = "INSERT INTO Users (Name, Email) VALUES (@Name, @Email)";
                    using (SqlCommand insertCommand = new SqlCommand(insertSql, connection))
                    {
                        insertCommand.Parameters.AddWithValue("@Name", "Alicia");
                        insertCommand.Parameters.AddWithValue("@Email", "alicia@example.com");
                        int rowsAffected = insertCommand.ExecuteNonQuery();
                        Console.WriteLine($"\nFilas insertadas: {rowsAffected}");
                    }

                    // --- 2. Ejecutar un comando SELECT que devuelve un solo valor (ExecuteScalar) ---
                    string countSql = "SELECT COUNT(*) FROM Users";
                    using (SqlCommand countCommand = new SqlCommand(countSql, connection))
                    {
                        int userCount = (int)countCommand.ExecuteScalar();
                        Console.WriteLine($"\nTotal de usuarios: {userCount}");
                    }

                    // --- 3. Ejecutar un comando SELECT y leer múltiples filas (ExecuteReader) ---
                    string selectSql = "SELECT Id, Name, Email FROM Users WHERE Name LIKE @SearchName";
                    using (SqlCommand selectCommand = new SqlCommand(selectSql, connection))
                    {
                        selectCommand.Parameters.AddWithValue("@SearchName", "A%"); // Buscar nombres que empiecen con 'A'

                        using (SqlDataReader reader = selectCommand.ExecuteReader())
                        {
                            Console.WriteLine("\nUsuarios encontrados:");
                            while (reader.Read()) // Lee fila por fila
                            {
                                // Acceso a los datos por índice o por nombre de columna
                                Console.WriteLine($"Id: {reader.GetInt32(0)}, Nombre: {reader["Name"]}, Email: {reader.GetString(2)}");
                            }
                        } // El SqlDataReader se cerrará automáticamente aquí
                    }
                }
                catch (SqlException ex)
                {
                    Console.WriteLine("Error de base de datos:");
                    Console.WriteLine(ex.Message);
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error general:");
                    Console.WriteLine(ex.Message);
                }
            }

            Console.WriteLine("\nPresiona cualquier tecla para salir.");
            Console.ReadKey();
        }
    }

    // Ejemplo incorrecto: Inyección SQL (PELIGROSO)
    /*
    public static void SqlInjectionVulnerability(string userName)
    {
        string userInput = userName; // Imagina que esto viene de una entrada de usuario sin validar
        // Si userInput es "'; DROP TABLE Users; --", el comando borrará tu tabla.
        string sql = "SELECT * FROM Users WHERE UserName = '" + userInput + "'";

        using (SqlConnection connection = new SqlConnection("..."))
        {
            connection.Open();
            using (SqlCommand command = new SqlCommand(sql, connection))
            {
                // Este comando es vulnerable a la inyección SQL. ¡EVITAR!
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Console.WriteLine(reader["Name"]);
                    }
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
    'module': 'Jr',
    'level': 4,
    'title_level': 'Acceso a Datos',
    'topic': 'ADO.NET',
    'subtopic': 'Uso de DataSets y DataAdapters',
    'definition': r'''
Además de leer datos directamente con un `DataReader`, ADO.NET nos ofrece los `DataSet` y `DataAdapter`, que son herramientas muy potentes para trabajar con datos de una manera desconectada de la base de datos. Pensemos por un momento en esto como tener una fotocopia de un libro: puedes trabajar con la fotocopia, hacerle anotaciones y cambios, y luego, cuando estés listo, "sincronizar" esos cambios de nuevo con el libro original (la base de datos).

¿Te estás preguntando por qué esto importa? 

Porque no siempre es eficiente mantener una conexión abierta a la base de datos. A veces necesitas trabajar con un conjunto de datos en memoria, hacer múltiples operaciones sobre ellos, y luego enviar todos los cambios de vuelta de una sola vez. Los `DataSet` y `DataAdapter` son ideales para escenarios donde necesitas manipular datos sin una conexión persistente, por ejemplo, en aplicaciones de escritorio que muestran datos en una cuadrícula.

Aquí te explico brevemente cada uno:
* **`DataSet`:** Es un contenedor en memoria que representa un conjunto completo de datos, incluyendo tablas, relaciones entre tablas y restricciones, de una o más fuentes de datos. Es como una pequeña base de datos en tu aplicación. Puedes llenarlo con datos de una base de datos, manipular esos datos (añadir, editar, eliminar filas), y luego, incluso desconectarte de la base de datos y seguir trabajando con la información.
* **`DataAdapter`:** Es el puente entre el `DataSet` y la base de datos. Es el encargado de llenar el `DataSet` con los datos de la base de datos (`Fill` method) y de enviar los cambios realizados en el `DataSet` de vuelta a la base de datos (`Update` method). Los `DataAdapter` (como `SqlDataAdapter` para SQL Server) tienen internamente `SelectCommand`, `InsertCommand`, `UpdateCommand` y `DeleteCommand` que usan para realizar estas operaciones.

Esta combinación de `DataSet` y `DataAdapter` te da una flexibilidad enorme para manejar datos, especialmente en escenarios donde la conexión a la base de datos puede ser intermitente o donde necesitas realizar muchas operaciones sobre un conjunto de datos antes de confirmarlos.
''',
    'code_example': r'''
// Ejemplo del uso de DataSet y DataAdapter con ADO.NET

using System;
using System.Data; // Necesario para DataSet
using System.Data.SqlClient; // Necesario para SqlDataAdapter, SqlConnection, etc.

namespace AdoNetDemo
{
    public class DataSetDataAdapterDemo
    {
        public static void Main(string[] args)
        {
            string connectionString = "Data Source=.;Initial Catalog=MyDatabase;Integrated Security=True;";
            string sql = "SELECT Id, Name, Email FROM Users;";

            // 1. Crear un DataSet y un SqlDataAdapter
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlDataAdapter adapter = new SqlDataAdapter(sql, connection);
                DataSet dataSet = new DataSet();

                try
                {
                    // 2. Llenar el DataSet (la conexión se abre y cierra automáticamente por el adapter)
                    adapter.Fill(dataSet, "UsersTable"); // "UsersTable" es el nombre que le damos a la tabla en el DataSet

                    Console.WriteLine("Datos originales en el DataSet:");
                    PrintDataSet(dataSet.Tables["UsersTable"]);

                    // 3. Modificar datos en el DataSet (desconectado de la BD)
                    if (dataSet.Tables["UsersTable"].Rows.Count > 0)
                    {
                        DataRow firstRow = dataSet.Tables["UsersTable"].Rows[0];
                        firstRow["Name"] = "Juan Actualizado"; // Modificar una fila
                        firstRow["Email"] = "juan.updated@example.com";

                        // Añadir una nueva fila
                        DataRow newRow = dataSet.Tables["UsersTable"].NewRow();
                        newRow["Name"] = "Maria Nueva";
                        newRow["Email"] = "maria.new@example.com";
                        dataSet.Tables["UsersTable"].Rows.Add(newRow);

                        // Eliminar una fila (ej. la segunda si existe)
                        if (dataSet.Tables["UsersTable"].Rows.Count > 1)
                        {
                            dataSet.Tables["UsersTable"].Rows[1].Delete();
                        }
                    }

                    Console.WriteLine("\nDatos modificados en el DataSet (aún no en la BD):");
                    PrintDataSet(dataSet.Tables["UsersTable"]);


                    // 4. Configurar los comandos para el DataAdapter para que sepa cómo hacer el Update
                    // Es CRUCIAL que estos comandos sean definidos o generados.
                    // SqlDataAdapter.UpdateCommand, InsertCommand, DeleteCommand
                    // Puedes generarlos manualmente o usar un SqlCommandBuilder (útil para escenarios simples)
                    SqlCommandBuilder commandBuilder = new SqlCommandBuilder(adapter);
                    adapter.InsertCommand = commandBuilder.GetInsertCommand();
                    adapter.UpdateCommand = commandBuilder.GetUpdateCommand();
                    adapter.DeleteCommand = commandBuilder.GetDeleteCommand();


                    // 5. Enviar los cambios del DataSet de vuelta a la base de datos
                    adapter.Update(dataSet, "UsersTable");
                    Console.WriteLine("\nCambios guardados en la base de datos.");

                    // 6. Volver a llenar el DataSet para ver los cambios confirmados
                    dataSet.Clear(); // Limpiar el DataSet antes de volver a llenarlo
                    adapter.Fill(dataSet, "UsersTable");
                    Console.WriteLine("\nDatos en el DataSet después de actualizar la BD:");
                    PrintDataSet(dataSet.Tables["UsersTable"]);
                }
                catch (SqlException ex)
                {
                    Console.WriteLine("Error de base de datos:");
                    Console.WriteLine(ex.Message);
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error general:");
                    Console.WriteLine(ex.Message);
                }
            }

            Console.WriteLine("\nPresiona cualquier tecla para salir.");
            Console.ReadKey();
        }

        // Método auxiliar para imprimir el contenido de una DataTable
        public static void PrintDataSet(DataTable table)
        {
            foreach (DataRow row in table.Rows)
            {
                if (row.RowState != DataRowState.Deleted) // No imprimir filas marcadas para borrar
                {
                    Console.Write("  ");
                    foreach (DataColumn col in table.Columns)
                    {
                        Console.Write($"{col.ColumnName}: {row[col]} \t");
                    }
                    Console.WriteLine();
                }
            }
        }
    }

    // Ejemplo incorrecto: Intentar llamar a adapter.Update() sin haber configurado
    // los comandos InsertCommand, UpdateCommand y DeleteCommand del DataAdapter.
    // Esto resultaría en un error porque el adapter no sabría cómo realizar esas operaciones.
    /*
    public static void BadDataAdapterExample(SqlDataAdapter adapter, DataSet dataSet)
    {
        // Sin commandBuilder o comandos definidos manualmente...
        // adapter.Update(dataSet, "UsersTable"); // Esto lanzaría una excepción.
    }
    */
}
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Acceso a Datos',
    'topic': 'Entity Framework',
    'subtopic': 'Modelado de entidades',
    'definition': r'''
El modelado de entidades en Entity Framework es el proceso de definir tus clases C# (o VB.NET) que representarán las tablas y las relaciones de tu base de datos. Pensemos por un momento en esto como crear un mapa detallado y una leyenda de una ciudad: el mapa son tus clases y la leyenda es cómo esas clases se relacionan con las calles y edificios reales de la base de datos.

¿Te estás preguntando por qué esto importa? 

Porque Entity Framework es un ORM (Object-Relational Mapper). Esto significa que te permite interactuar con tu base de datos usando objetos de tu lenguaje de programación favorito, en lugar de escribir consultas SQL directamente. El modelado de entidades es la base de todo esto; sin él, Entity Framework no sabría cómo traducir tus operaciones con objetos a operaciones de base de datos. Esto reduce drásticamente la cantidad de código de acceso a datos que tienes que escribir y te permite trabajar de una manera más orientada a objetos.

En Entity Framework, puedes modelar tus entidades de tres formas principales:
1.  **Database First:** Si ya tienes una base de datos existente, Entity Framework puede generar automáticamente las clases de entidad y el contexto de la base de datos a partir de ella. Es como si el mapa se dibujara solo a partir de la ciudad ya construida.
2.  **Model First:** Puedes diseñar tu modelo de datos visualmente en Visual Studio, y Entity Framework generará la base de datos a partir de ese modelo. Esto es menos común hoy en día, pero era una opción.
3.  **Code First:** Esta es la forma más popular y la recomendada actualmente. Consiste en definir tus clases de entidad en C# (o VB.NET) primero. Luego, Entity Framework, a través de algo llamado "Convenciones por Convención" y "Configuración Fluida" o "Atributos de Datos", deduce cómo deben ser las tablas de la base de datos. Tú le dices qué propiedades son claves primarias, cuáles son obligatorias, cómo se llaman las tablas si no quieres que se usen los nombres por defecto, y cómo se establecen las relaciones entre ellas.

Por ejemplo, si tienes una clase `Producto` con propiedades `Id`, `Nombre` y `Precio`, Entity Framework por defecto creará una tabla `Productos` con columnas `Id`, `Nombre` y `Precio`, asumiendo que `Id` es la clave primaria. Para relaciones, defines propiedades de navegación (colecciones para uno a muchos, o una sola entidad para uno a uno/muchos a uno), y EF se encarga de las claves foráneas por ti. Esto te libera de la plomería del SQL y te permite centrarte en tu dominio de negocio.
''',
    'code_example': r'''
// Ejemplo de modelado de entidades Code First en Entity Framework

using System.Collections.Generic;
using System.ComponentModel.DataAnnotations; // Para atributos de datos
using System.Data.Entity; // Para DbContext (en .NET Framework)
// using Microsoft.EntityFrameworkCore; // Para .NET (Core)

namespace EntityFrameworkDemo.Models
{
    // Clase de entidad que representa una tabla 'Productos' en la base de datos
    public class Producto
    {
        // [Key] // Opcional: Si la propiedad no se llama 'Id' o 'ProductoId', usa este atributo
        public int Id { get; set; } // Por convención, 'Id' o 'NombreClaseId' será la clave primaria

        [Required] // Hace que la columna sea NOT NULL en la base de datos
        [MaxLength(100)] // Establece la longitud máxima de la cadena
        public string Nombre { get; set; }

        public decimal Precio { get; set; }

        public string Descripcion { get; set; }

        // Propiedad de navegación para una relación uno a muchos
        // Un Producto pertenece a una Categoría
        public int CategoriaId { get; set; } // Clave foránea
        public Categoria Categoria { get; set; } // Propiedad de navegación
    }

    // Clase de entidad que representa una tabla 'Categorias'
    public class Categoria
    {
        public int Id { get; set; }

        [Required]
        [MaxLength(50)]
        public string Nombre { get; set; }

        // Propiedad de navegación para una relación uno a muchos
        // Una Categoría tiene muchos Productos
        public ICollection<Producto> Productos { get; set; } = new List<Producto>();
    }

    // El contexto de la base de datos: la clase principal para interactuar con la BD
    public class MyDbContext : DbContext // Para .NET Framework
    // public class MyDbContext : Microsoft.EntityFrameworkCore.DbContext // Para .NET (Core)
    {
        // Constructor que llama al constructor base con el nombre de la cadena de conexión
        public MyDbContext() : base("name=MyDatabaseConnection")
        {
            // Database.SetInitializer(new DropCreateDatabaseIfModelChanges<MyDbContext>()); // Solo para desarrollo
        }

        // DbSets representan las tablas en la base de datos
        public DbSet<Producto> Productos { get; set; }
        public DbSet<Categoria> Categorias { get; set; }

        // Puedes usar la API Fluida para configurar el modelo si los atributos de datos no son suficientes
        // protected override void OnModelCreating(DbModelBuilder modelBuilder) // Para .NET Framework
        // protected override void OnModelCreating(ModelBuilder modelBuilder) // Para .NET (Core)
        // {
        //     modelBuilder.Entity<Producto>()
        //         .HasRequired(p => p.Categoria) // Producto requiere una Categoría
        //         .WithMany(c => c.Productos) // Una Categoría tiene muchos Productos
        //         .HasForeignKey(p => p.CategoriaId); // La clave foránea es CategoriaId
        // }
    }
}

// Ejemplo incorrecto: No definir una clave primaria en una entidad.
// Entity Framework necesita una clave primaria para identificar unívocamente las filas.
/*
public class BadEntity
{
    public string Name { get; set; } // No hay propiedad 'Id' ni 'BadEntityId' ni atributo [Key]
    public string Description { get; set; }
}
// EF lanzaría una excepción o no podría mapear esta entidad correctamente.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Acceso a Datos',
    'topic': 'Entity Framework',
    'subtopic': 'Consultas LINQ',
    'definition': r'''
LINQ (Language Integrated Query) es una característica de .NET que te permite escribir consultas para bases de datos (y otras fuentes de datos) utilizando la sintaxis de tu lenguaje de programación (C# o VB.NET) en lugar de SQL puro. Pensemos por un momento en esto como tener un traductor universal: tú le das instrucciones en tu idioma y él las convierte automáticamente al "idioma" que la base de datos entiende.

¿Te estás preguntando por qué esto importa? 

Porque elimina la necesidad de escribir SQL incrustado en tu código C#, lo que puede ser propenso a errores, difícil de mantener y vulnerable a la inyección SQL. Con LINQ, tus consultas son fuertemente tipadas, lo que significa que el compilador puede detectar errores antes de que tu aplicación se ejecute, y tienes la ventaja del autocompletado de Visual Studio. Esto hace que el acceso a datos sea mucho más productivo, seguro y fácil de depurar.

Cuando usas LINQ con Entity Framework (conocido como LINQ to Entities), escribes tus consultas directamente sobre tus `DbSet`s (tus "tablas" en el contexto de la base de datos) utilizando una sintaxis similar a la de SQL o a la de métodos. Entity Framework toma tu consulta LINQ, la traduce a SQL apropiado para tu base de datos (SQL Server, MySQL, PostgreSQL, etc.) y la ejecuta. Los resultados se materializan automáticamente en objetos C# de tus entidades.

Puedes usar dos sintaxis para LINQ:
* **Sintaxis de consulta (Query Syntax):** Se parece mucho a SQL (ej. `from p in context.Productos select p`).
* **Sintaxis de método (Method Syntax):** Utiliza métodos de extensión en colecciones (ej. `context.Productos.Where(p => p.Precio > 100)`).
Ambas hacen lo mismo, y la elección entre una u otra suele ser una cuestión de preferencia personal o de complejidad de la consulta. Puedes filtrar (`Where`), ordenar (`OrderBy`), seleccionar (`Select`), unir (`Join`), agrupar (`GroupBy`) y realizar muchas otras operaciones directamente sobre tus colecciones de entidades.
''',
    'code_example': r'''
// Ejemplo de consultas LINQ con Entity Framework

using System;
using System.Linq; // Necesario para LINQ
using EntityFrameworkDemo.Models; // Tus clases de entidad y tu DbContext

namespace EntityFrameworkDemo
{
    public class LinqQueriesDemo
    {
        public static void Main(string[] args)
        {
            // Usamos el contexto de la base de datos
            using (var context = new MyDbContext())
            {
                // Asegúrate de que la base de datos y los datos iniciales existan
                // Esto podría hacerse con migraciones o un inicializador de base de datos
                Console.WriteLine("Realizando consultas LINQ...");

                // --- 1. Obtener todos los productos (Sintaxis de método) ---
                var allProducts = context.Productos.ToList(); // .ToList() ejecuta la consulta
                Console.WriteLine("\nTodos los productos:");
                foreach (var p in allProducts)
                {
                    Console.WriteLine($"- {p.Nombre} (${p.Precio})");
                }

                // --- 2. Obtener productos con precio mayor a 50 (Sintaxis de consulta) ---
                var expensiveProducts = from p in context.Productos
                                        where p.Precio > 50.00m
                                        orderby p.Nombre descending
                                        select p; // La consulta aún no se ejecuta aquí
                Console.WriteLine("\nProductos caros (> $50), ordenados por nombre descendente:");
                foreach (var p in expensiveProducts) // La consulta se ejecuta aquí (evaluación diferida)
                {
                    Console.WriteLine($"- {p.Nombre} (${p.Precio})");
                }

                // --- 3. Obtener un producto por ID (FirstOrDefault) ---
                var productById = context.Productos.FirstOrDefault(p => p.Id == 1);
                if (productById != null)
                {
                    Console.WriteLine($"\nProducto con ID 1: {productById.Nombre}");
                }

                // --- 4. Proyección: Seleccionar solo ciertas propiedades (Sintaxis de método) ---
                var productNamesAndPrices = context.Productos
                                                .Select(p => new { p.Nombre, p.Precio }) // Proyecta a un tipo anónimo
                                                .ToList();
                Console.WriteLine("\nNombres y precios de productos:");
                foreach (var item in productNamesAndPrices)
                {
                    Console.WriteLine($"- {item.Nombre}: ${item.Precio}");
                }

                // --- 5. Consulta con INCLUDE para cargar relaciones (eager loading) ---
                // Si quieres cargar la categoría junto con el producto:
                // using System.Data.Entity; // Necesario para .Include()
                // using Microsoft.EntityFrameworkCore; // Para .NET (Core)
                var productsWithCategories = context.Productos
                                                    .Include(p => p.Categoria) // Carga la categoría relacionada
                                                    .ToList();
                Console.WriteLine("\nProductos con su categoría:");
                foreach (var p in productsWithCategories)
                {
                    Console.WriteLine($"- {p.Nombre} (Categoría: {p.Categoria?.Nombre})");
                }
            }

            Console.WriteLine("\nPresiona cualquier tecla para salir.");
            Console.ReadKey();
        }
    }

    // Ejemplo incorrecto: Intentar usar LINQ para operar directamente sobre IQueryable
    // sin ejecutar la consulta (ej. sin .ToList(), .FirstOrDefault(), etc.)
    // Esto no es un "error" per se, pero la consulta no se ejecuta y no obtienes datos.
    /*
    public static void BadLinqUsage(MyDbContext context)
    {
        var query = context.Productos.Where(p => p.Precio > 100);
        // La consulta no se ha ejecutado. 'query' es un IQueryable, no una lista de productos.
        // No puedes iterar directamente sobre 'query' si lo pasas a otro método que espera una lista, por ejemplo.
    }
    */
}
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Jr',
    'level': 4,
    'title_level': 'Acceso a Datos',
    'topic': 'Entity Framework',
    'subtopic': 'Migraciones y manejo del contexto',
    'definition': r'''
Las migraciones en Entity Framework y el manejo del contexto de la base de datos son herramientas esenciales para gestionar cómo evoluciona tu esquema de base de datos y cómo interactúas con ella de manera eficiente. Pensemos por un momento en esto como el control de versiones para tu base de datos y el punto de acceso principal para todas tus operaciones de datos, respectivamente.

¿Te estás preguntando por qué esto importa? 

Porque el esquema de tu base de datos rara vez permanece estático. A medida que tu aplicación crece, necesitarás añadir nuevas tablas, columnas, modificar tipos de datos, etc. Las migraciones te permiten hacer estos cambios de forma controlada y versionada, lo que es crucial en equipos de desarrollo. Por otro lado, el manejo adecuado del contexto asegura que tus operaciones de base de datos sean eficientes y que los recursos se liberen correctamente.

**Migraciones (Migrations):**
En un flujo de trabajo Code First, las migraciones son la forma preferida de actualizar tu esquema de base de datos para que coincida con los cambios en tus clases de entidad.
1.  **Habilitar Migraciones:** Es el primer paso para indicarle a Entity Framework que quieres gestionar los cambios del esquema.
2.  **Añadir Migración:** Cuando cambias tus clases de entidad (por ejemplo, añades una nueva propiedad a `Producto`), ejecutas un comando (`Add-Migration NombreDeLaMigracion`) que compara tu modelo actual con el modelo que EF usó para crear la base de datos la última vez. Genera un archivo de código que describe los cambios necesarios (como añadir una nueva columna `ALTER TABLE Productos ADD COLUMN ...`).
3.  **Actualizar Base de Datos:** Finalmente, ejecutas el comando `Update-Database`, y Entity Framework aplica los cambios pendientes descritos en tus archivos de migración a la base de datos real. Esto es una forma muy segura y reproducible de evolucionar tu esquema, evitando la necesidad de escribir scripts SQL manualmente y reduciendo el riesgo de errores.

**Manejo del Contexto (DbContext):**
La clase `DbContext` (o `ApplicationDbContext`, `MyDbContext`, etc.) es el corazón de tu interacción con la base de datos en Entity Framework.
* Es la clase principal que coordina la funcionalidad de Entity Framework para un modelo de datos dado.
* Un `DbContext` representa una sesión con la base de datos. Dentro de esta sesión, puedes consultar entidades y guardar los cambios en la base de datos.
* Es importante crear una nueva instancia del `DbContext` para cada "unidad de trabajo" o para cada solicitud web. Los `DbContext`s no están diseñados para ser de larga duración o compartirse entre múltiples solicitudes o hilos.
* Al igual que con las conexiones ADO.NET, es crucial asegurarse de que el `DbContext` se elimine correctamente para liberar recursos. La mejor manera de hacerlo es envolver tu instancia de `DbContext` en un bloque `using` (o usar la inyección de dependencias para gestionarlo, especialmente en ASP.NET Core). Esto garantiza que el método `Dispose()` del contexto se llame, cerrando conexiones y liberando la memoria.

Entender y aplicar correctamente las migraciones y el manejo del contexto te permitirá construir aplicaciones .NET con acceso a datos robusto y mantenible.
''',
    'code_example': r'''
// Ejemplo de migraciones y manejo del contexto en Entity Framework (Code First)

// 1. **Comandos de la Consola del Administrador de Paquetes (en Visual Studio)**
// Estos comandos se ejecutan en: Herramientas -> Administrador de paquetes NuGet -> Consola del Administrador de paquetes

// Habilitar migraciones para tu proyecto (una sola vez por proyecto)
// PM> Enable-Migrations

// Añadir una nueva migración (después de cambiar tus clases de entidad, por ejemplo, añadir una propiedad)
// PM> Add-Migration AddProductDescription // Nombre descriptivo para tu migración

// Aplicar las migraciones pendientes a la base de datos
// PM> Update-Database

// Volver a una migración específica (opcional, para revertir cambios)
// PM> Update-Database -TargetMigration:InitialCreate

// 2. **Código del Contexto de la Base de Datos (MyDbContext.cs)**
// (Este código va en tu proyecto, en la carpeta Models o Data)

using System.Data.Entity; // Para DbContext
// using Microsoft.EntityFrameworkCore; // Para .NET (Core)

namespace EntityFrameworkDemo.Models
{
    public class MyDbContext : DbContext
    {
        // Constructor: apunta a la cadena de conexión definida en App.config/Web.config
        public MyDbContext() : base("name=MyDatabaseConnection")
        {
            // Opcional: Estrategia de inicialización para desarrollo.
            // Database.SetInitializer(new MigrateDatabaseToLatestVersion<MyDbContext, Migrations.Configuration>());
        }

        public DbSet<Producto> Productos { get; set; }
        public DbSet<Categoria> Categorias { get; set; }

        // Aquí iría el OnModelCreating si usas Fluent API para configurar el modelo
        // protected override void OnModelCreating(DbModelBuilder modelBuilder) // Para EF 6
        // protected override void OnModelCreating(ModelBuilder modelBuilder) // Para EF Core
        // {
        //    // Configuraciones avanzadas...
        // }
    }
}

// 3. **Uso del Contexto en el código de tu aplicación**
// (Este código iría en tu controlador, servicio, o capa de lógica de negocio)

using System;
using System.Linq;
using EntityFrameworkDemo.Models;

namespace EntityFrameworkDemo
{
    public class ContextUsageDemo
    {
        public static void Main(string[] args)
        {
            // Uso recomendado del contexto dentro de un bloque 'using'
            // Esto asegura que el contexto se elimine (Dispose) correctamente, liberando recursos.
            using (var context = new MyDbContext())
            {
                try
                {
                    // Añadir una nueva categoría si no existe
                    var existingCategory = context.Categorias.FirstOrDefault(c => c.Nombre == "Electrónica");
                    if (existingCategory == null)
                    {
                        var newCategory = new Categoria { Nombre = "Electrónica" };
                        context.Categorias.Add(newCategory);
                        context.SaveChanges(); // Guarda la nueva categoría en la BD
                        existingCategory = newCategory;
                        Console.WriteLine("Categoría 'Electrónica' añadida.");
                    }

                    // Añadir un nuevo producto
                    var newProduct = new Producto
                    {
                        Nombre = "Teléfono Inteligente",
                        Precio = 799.99m,
                        Descripcion = "Un dispositivo potente con muchas funciones.",
                        CategoriaId = existingCategory.Id // Asigna la categoría
                    };
                    context.Productos.Add(newProduct);
                    context.SaveChanges(); // Guarda el nuevo producto en la BD
                    Console.WriteLine($"Producto '{newProduct.Nombre}' añadido.");

                    // Consultar datos
                    var productosElectronica = context.Productos
                                                    .Where(p => p.Categoria.Nombre == "Electrónica")
                                                    .ToList();
                    Console.WriteLine("\nProductos de Electrónica:");
                    foreach (var p in productosElectronica)
                    {
                        Console.WriteLine($"- {p.Nombre} (${p.Precio})");
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Ocurrió un error: " + ex.Message);
                }
            } // El contexto se "dispose" aquí automáticamente.

            Console.WriteLine("\nPresiona cualquier tecla para salir.");
            Console.ReadKey();
        }
    }

    // Ejemplo incorrecto: Crear un contexto y no eliminarlo, o usar una única instancia de contexto
    // para toda la vida de la aplicación (patrón "singleton").
    // Esto puede llevar a problemas de memoria, problemas de concurrencia y datos desactualizados.
    /*
    public class BadContextUsage
    {
        // NO HACER ESTO en la mayoría de los casos de aplicaciones web o de escritorio de larga duración.
        private static MyDbContext _globalContext = new MyDbContext();

        public void AddProductBadly(string name)
        {
            _globalContext.Productos.Add(new Producto { Nombre = name });
            _globalContext.SaveChanges(); // Puede causar problemas si se llama desde varios hilos/solicitudes
        }
    }
    */
}
'''
  });
}

Future<void> insertPuntonetJrLevel5Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Manejo de Errores y Excepciones',
    'topic': 'Excepciones',
    'subtopic': 'Uso de try-catch-finally',
    'definition': r'''
El bloque `try-catch-finally` es la estructura fundamental para manejar errores inesperados, o excepciones, en tu código C#. Pensemos por un momento en esto como un paracaídas para tu programa: si algo sale mal inesperadamente mientras está "volando" (ejecutándose), el paracaídas (el `catch`) se abre para evitar una caída desastrosa y el `finally` te asegura un aterrizaje suave.

¿Te estás preguntando por qué esto importa? 

Porque el software no es perfecto y los errores ocurren. Desde que un usuario introduzca texto en un campo numérico, hasta que una base de datos no esté disponible, o un archivo que intentas leer no exista. Si no manejas estas situaciones, tu aplicación simplemente "crasheará" y se cerrará de forma abrupta, lo que es una pésima experiencia para el usuario. `try-catch-finally` te permite capturar esos errores, gestionarlos elegantemente y mantener tu aplicación en funcionamiento.

Así es como funciona cada parte:
* **`try`:** Aquí colocas el código que "intentas" ejecutar. Es el bloque donde esperas que todo vaya bien, pero que podría generar una excepción.
* **`catch`:** Si una excepción ocurre dentro del bloque `try`, la ejecución salta inmediatamente al bloque `catch`. Aquí es donde "atrapas" la excepción. Puedes especificar el tipo de excepción que quieres capturar (por ejemplo, `FormatException`, `SqlException`, `IOException`), lo que te permite manejar diferentes tipos de errores de manera específica. Dentro del `catch`, puedes registrar el error, mostrar un mensaje al usuario, o intentar recuperarte del problema. Puedes tener múltiples bloques `catch` para diferentes tipos de excepciones.
* **`finally`:** Este bloque de código se ejecuta SIEMPRE, sin importar si hubo una excepción o no, y si el `catch` la manejó. Es el lugar perfecto para colocar código de limpieza, como cerrar conexiones a bases de datos, cerrar archivos o liberar recursos, asegurándote de que no queden "cabos sueltos" incluso si ocurre un error.

Usar `try-catch-finally` te permite escribir código más robusto y fiable, que puede recuperarse de situaciones inesperadas en lugar de simplemente fallar.
''',
    'code_example': r'''
// Ejemplo del uso de try-catch-finally en C#

using System;
using System.IO; // Para excepciones relacionadas con archivos

namespace ExceptionHandlingDemo
{
    public class TryCatchFinally
    {
        public static void Main(string[] args)
        {
            // --- Ejemplo 1: Manejo de FormatException (conversión de tipo) ---
            Console.WriteLine("Ejemplo 1: Conversión de texto a número.");
            Console.Write("Introduce un número entero: ");
            string userInput = Console.ReadLine();

            try
            {
                int number = int.Parse(userInput); // Esto puede lanzar FormatException
                Console.WriteLine($"El número introducido es: {number}");
            }
            catch (FormatException ex) // Captura solo FormatException
            {
                Console.WriteLine($"Error: Entrada inválida. Por favor, introduce solo números. Detalle: {ex.Message}");
            }
            catch (OverflowException ex) // Captura si el número es demasiado grande/pequeño
            {
                Console.WriteLine($"Error: El número es demasiado grande o pequeño. Detalle: {ex.Message}");
            }
            catch (Exception ex) // Captura cualquier otra excepción no específica (siempre última)
            {
                Console.WriteLine($"Ocurrió un error inesperado: {ex.Message}");
            }
            finally
            {
                Console.WriteLine("Bloque 'finally' de Ejemplo 1 ejecutado.");
            }
            Console.WriteLine("\n------------------------------------\n");


            // --- Ejemplo 2: Manejo de IOException (operaciones de archivo) ---
            Console.WriteLine("Ejemplo 2: Intento de leer un archivo que no existe.");
            string filePath = "archivo_no_existente.txt";

            FileStream fs = null; // Declarado fuera del try para que 'finally' pueda acceder
            try
            {
                fs = new FileStream(filePath, FileMode.Open); // Esto puede lanzar FileNotFoundException
                using (StreamReader reader = new StreamReader(fs))
                {
                    Console.WriteLine(reader.ReadToEnd());
                }
            }
            catch (FileNotFoundException ex)
            {
                Console.WriteLine($"Error: El archivo '{filePath}' no se encontró. Detalle: {ex.Message}");
            }
            catch (IOException ex) // Captura otros errores de E/S
            {
                Console.WriteLine($"Error de E/S: {ex.Message}");
            }
            finally
            {
                // Asegura que el FileStream se cierre, incluso si hay una excepción
                if (fs != null)
                {
                    fs.Dispose(); // Usar Dispose() en lugar de Close() para recursos que implementan IDisposable
                    Console.WriteLine("FileStream cerrado en el bloque 'finally'.");
                }
                Console.WriteLine("Bloque 'finally' de Ejemplo 2 ejecutado.");
            }
            Console.WriteLine("\n------------------------------------\n");


            // --- Ejemplo 3: Bloque try sin catch, solo finally (válido para limpieza) ---
            Console.WriteLine("Ejemplo 3: Try-finally (sin catch).");
            object myResource = null;
            try
            {
                myResource = new object(); // Simula la adquisición de un recurso
                Console.WriteLine("Recurso adquirido.");
                // int zero = 0;
                // int result = 10 / zero; // Si descomentas esto, la excepción no se captura aquí
            }
            finally
            {
                // Siempre se liberará el recurso
                Console.WriteLine("Recurso liberado en el bloque 'finally'.");
                myResource = null;
            }
            Console.WriteLine("\nPresiona cualquier tecla para salir.");
            Console.ReadKey();
        }
    }

    // Ejemplo incorrecto: No usar try-catch para operaciones que pueden fallar.
    // Esto causaría que la aplicación se caiga abruptamente.
    /*
    public class BadCodeExample
    {
        public void Divide(int numerator, int denominator)
        {
            // Si denominator es 0, esto causará una DivideByZeroException y la aplicación crasheará.
            int result = numerator / denominator;
            Console.WriteLine($"Resultado: {result}");
        }
    }
    */
}
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Manejo de Errores y Excepciones',
    'topic': 'Excepciones',
    'subtopic': 'Creación de excepciones personalizadas',
    'definition': r'''
Crear tus propias excepciones personalizadas es una práctica muy útil en el desarrollo de software. Piensa en esto como diseñar una alerta de emergencia muy específica para tu sistema: en lugar de que suene una alarma genérica (como un simple "error"), puedes hacer que suene una alarma que diga exactamente "¡Falta papel en la impresora del segundo piso!" o "¡El cliente no tiene saldo suficiente!".

¿Te estás preguntando por qué esto importa? 

Aunque C# ya tiene muchas excepciones predefinidas (`FormatException`, `NullReferenceException`, etc.), a menudo necesitas comunicar problemas que son específicos de la lógica de negocio de tu aplicación. Una excepción personalizada hace que tu código sea más claro, fácil de depurar y más expresivo. Permite que otros desarrolladores (¡o tu yo futuro!) entiendan rápidamente qué salió mal y por qué, sin tener que descifrar mensajes de error genéricos.

Para crear una excepción personalizada en C#, debes seguir unas convenciones:
1.  **Heredar de `Exception`:** Tu clase de excepción personalizada debe heredar de la clase base `System.Exception` o de alguna de sus subclases (como `ApplicationException` para excepciones específicas de la aplicación, aunque es debatido si esta es la mejor práctica; muchos prefieren heredar directamente de `Exception` o `InvalidOperationException`).
2.  **Nombre:** La clase debe terminar con el sufijo `Exception` (por ejemplo, `SaldoInsuficienteException`).
3.  **Constructores:** Es una buena práctica implementar al menos los tres constructores estándar que se encuentran en la mayoría de las excepciones de .NET:
    * Un constructor sin parámetros.
    * Un constructor que acepta un `string message`.
    * Un constructor que acepta un `string message` y una `Exception innerException` (para encadenar excepciones y mantener el rastro de la causa original).
    * Un constructor que acepte `SerializationInfo` y `StreamingContext` para permitir la serialización de la excepción, si tu aplicación necesita eso (común en aplicaciones distribuidas).

Una vez que tienes tu excepción personalizada, puedes lanzarla (`throw`) cuando se cumpla la condición de error en tu lógica de negocio y luego capturarla (`catch`) en un nivel superior de tu aplicación para manejarla de manera adecuada, proporcionando un contexto y detalles mucho más ricos sobre el problema.
''',
    'code_example': r'''
// Ejemplo de creación y uso de excepciones personalizadas en C#

using System;
using System.Runtime.Serialization; // Necesario para serialización, útil en aplicaciones distribuidas

namespace CustomExceptionsDemo
{
    // 1. Definición de la excepción personalizada
    // Hereda de Exception para que se comporte como una excepción estándar de .NET.
    // [Serializable] // Atributo opcional para permitir la serialización de la excepción
    public class SaldoInsuficienteException : Exception
    {
        public decimal SaldoActual { get; private set; }
        public decimal CantidadRetiro { get; private set; }

        // Constructor 1: Sin parámetros
        public SaldoInsuficienteException() : base("No hay saldo suficiente para la operación.")
        {
        }

        // Constructor 2: Con mensaje
        public SaldoInsuficienteException(string message) : base(message)
        {
        }

        // Constructor 3: Con mensaje y una excepción interna (para encadenar excepciones)
        public SaldoInsuficienteException(string message, Exception innerException)
            : base(message, innerException)
        {
        }

        // Constructor 4: Para serialización (útil para pasar excepciones entre dominios de aplicación)
        protected SaldoInsuficienteException(SerializationInfo info, StreamingContext context)
            : base(info, context)
        {
            SaldoActual = info.GetDecimal("SaldoActual");
            CantidadRetiro = info.GetDecimal("CantidadRetiro");
        }

        // Método para agregar información de serialización (parte del constructor de serialización)
        public override void GetObjectData(SerializationInfo info, StreamingContext context)
        {
            base.GetObjectData(info, context);
            info.AddValue("SaldoActual", SaldoActual);
            info.AddValue("CantidadRetiro", CantidadRetiro);
        }

        // Constructor personalizado con datos específicos del problema
        public SaldoInsuficienteException(string message, decimal saldoActual, decimal cantidadRetiro)
            : base(message)
        {
            SaldoActual = saldoActual;
            CantidadRetiro = cantidadRetiro;
        }
    }

    public class CuentaBancaria
    {
        public decimal Saldo { get; private set; }

        public CuentaBancaria(decimal saldoInicial)
        {
            Saldo = saldoInicial;
        }

        public void Retirar(decimal cantidad)
        {
            if (cantidad <= 0)
            {
                // Usamos una excepción estándar para argumentos inválidos
                throw new ArgumentOutOfRangeException(nameof(cantidad), "La cantidad a retirar debe ser positiva.");
            }

            if (Saldo < cantidad)
            {
                // Lanzamos nuestra excepción personalizada con detalles específicos
                throw new SaldoInsuficienteException(
                    "Intento de retiro excede el saldo disponible.",
                    Saldo,
                    cantidad
                );
            }

            Saldo -= cantidad;
            Console.WriteLine($"Retiro exitoso. Saldo actual: {Saldo}");
        }
    }

    public class Program
    {
        public static void Main(string[] args)
        {
            CuentaBancaria miCuenta = new CuentaBancaria(500m);

            try
            {
                Console.WriteLine($"Saldo inicial: {miCuenta.Saldo}");
                miCuenta.Retirar(200m);
                miCuenta.Retirar(400m); // Esto lanzará SaldoInsuficienteException
                miCuenta.Retirar(100m);
            }
            catch (SaldoInsuficienteException ex)
            {
                Console.WriteLine("\n--- Error de Saldo Insuficiente ---");
                Console.WriteLine($"Mensaje: {ex.Message}");
                Console.WriteLine($"Saldo Actual: {ex.SaldoActual}");
                Console.WriteLine($"Cantidad Solicitada: {ex.CantidadRetiro}");
                // Puedes registrar el error aquí...
            }
            catch (ArgumentOutOfRangeException ex)
            {
                Console.WriteLine($"\n--- Error de Argumento Inválido ---");
                Console.WriteLine($"Mensaje: {ex.Message}");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"\n--- Error Inesperado ---");
                Console.WriteLine($"Tipo: {ex.GetType().Name}");
                Console.WriteLine($"Mensaje: {ex.Message}");
            }
            finally
            {
                Console.WriteLine("\nOperación de cuenta finalizada.");
            }

            Console.WriteLine("\nPresiona cualquier tecla para salir.");
            Console.ReadKey();
        }
    }

    // Ejemplo incorrecto: Lanzar una excepción genérica (Exception) para un error de negocio específico.
    // Esto hace que el código sea menos legible y difícil de manejar de forma específica.
    /*
    public class BadAccount
    {
        public decimal Balance { get; private set; }
        public void Withdraw(decimal amount)
        {
            if (Balance < amount)
            {
                // NO HAGAS ESTO:
                throw new Exception("Error genérico: Saldo insuficiente.");
            }
            Balance -= amount;
        }
    }
    */
}
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Manejo de Errores y Excepciones',
    'topic': 'Excepciones',
    'subtopic': 'Registro de errores',
    'definition': r'''
El registro de errores (logging) es el proceso de guardar información sobre lo que sucede en tu aplicación, especialmente cuando ocurren problemas. Pensemos por un momento en esto como el diario de a bordo de un barco: cada evento importante, cada incidente y cada error se anota para que, si algo sale mal, se pueda rastrear qué pasó, cuándo y por qué.

¿Te estás preguntando por qué esto importa? 

Porque en un entorno de producción, no estarás ahí mirando tu aplicación en todo momento. Cuando ocurre un error que no puedes reproducir fácilmente o que solo afecta a ciertos usuarios, un buen sistema de registro es invaluable. Te permite entender el comportamiento de tu aplicación, diagnosticar problemas, identificar cuellos de botella y mejorar la estabilidad y el rendimiento con el tiempo. Es tu ojo y oído en el sistema cuando no estás presente.

En .NET, existen varias formas de registrar errores, desde las más simples hasta soluciones más robustas:

* **Console.WriteLine / Debug.WriteLine:** Son útiles para depuración rápida durante el desarrollo, pero no son adecuados para producción porque los mensajes se pierden al cerrar la aplicación o no son accesibles en un servidor.
* **Archivos de texto:** Es una forma sencilla de registrar errores. Puedes escribir mensajes de error, la fecha, la hora y la pila de llamadas (stack trace) en un archivo de texto. Es fácil de implementar, pero puede ser difícil de gestionar si los archivos crecen mucho o si hay múltiples aplicaciones escribiendo en ellos.
* **Event Log de Windows:** Es un registro centralizado del sistema operativo donde las aplicaciones pueden escribir eventos. Es bueno para errores críticos del sistema, pero su acceso y filtrado pueden ser complicados para errores de aplicación más detallados.
* **Librerías de logging de terceros:** Esta es la opción más recomendada para aplicaciones de producción. Librerías como **Serilog**, **NLog** o **log4net** son extremadamente potentes y flexibles. Te permiten:
    * **Configurar diferentes "sinks" o destinos:** Puedes enviar logs a archivos, bases de datos, servicios de monitoreo en la nube, consolas, correos electrónicos, etc.
    * **Niveles de logging:** Puedes categorizar los mensajes por su severidad (Debug, Info, Warning, Error, Critical), lo que te permite filtrar qué información quieres ver.
    * **Formato personalizado:** Control total sobre el formato de los mensajes de log.
    * **Inyección de contexto:** Añadir información relevante automáticamente (usuario, ID de transacción, etc.).

Un buen registro de errores es una inversión de tiempo que te ahorrará muchísimas horas de depuración en el futuro y te ayudará a construir aplicaciones más estables y confiables.
''',
    'code_example': r'''
// Ejemplo de registro de errores en C#

using System;
using System.IO;
using System.Diagnostics; // Para Debug.WriteLine y EventLog
// Para Serilog, NLog, o log4net, necesitarías instalar los paquetes NuGet correspondientes.
// Por ejemplo, para Serilog:
// dotnet add package Serilog
// dotnet add package Serilog.Sinks.Console
// dotnet add package Serilog.Sinks.File

// Si usas Serilog:
// using Serilog;

namespace ErrorLoggingDemo
{
    public class ErrorLogger
    {
        // Configuración básica de Serilog (descomenta si lo tienes instalado)
        /*
        private static ILogger _logger;
        static ErrorLogger()
        {
            _logger = new LoggerConfiguration()
                .MinimumLevel.Debug() // Nivel mínimo a registrar
                .WriteTo.Console() // Enviar logs a la consola
                .WriteTo.File("logs/app_errors.txt", rollingInterval: RollingInterval.Day) // Enviar logs a un archivo diario
                .CreateLogger();
        }
        */

        public static void Main(string[] args)
        {
            Console.WriteLine("Demostración de registro de errores.");

            // --- Ejemplo 1: Logging básico con Console.WriteLine y Debug.WriteLine ---
            try
            {
                int a = 10;
                int b = 0;
                int result = a / b; // Esto causará una DivideByZeroException
            }
            catch (DivideByZeroException ex)
            {
                string errorMessage = $"Error de división por cero: {ex.Message}";
                Console.WriteLine($"[CONSOLE LOG] {DateTime.Now}: {errorMessage}"); // Log a la consola
                Debug.WriteLine($"[DEBUG LOG] {DateTime.Now}: {errorMessage}"); // Log para el output de depuración

                // Puedes registrar la pila de llamadas para más detalles
                Debug.WriteLine($"Stack Trace:\n{ex.StackTrace}");
            }

            Console.WriteLine("\n------------------------------------\n");

            // --- Ejemplo 2: Logging a un archivo de texto simple ---
            string logFilePath = "simple_error_log.txt";
            try
            {
                // Simular un intento de escritura en una ruta inválida
                File.WriteAllText("C:\\invalid_path\\test.txt", "Este es un mensaje de prueba.");
            }
            catch (UnauthorizedAccessException ex)
            {
                string errorDetail = $"Acceso denegado al escribir archivo: {ex.Message}\nStack: {ex.StackTrace}";
                try
                {
                    File.AppendAllText(logFilePath, $"{DateTime.Now}: {errorDetail}\n");
                    Console.WriteLine($"[FILE LOG] Error registrado en {logFilePath}");
                }
                catch (Exception fileEx)
                {
                    Console.WriteLine($"[FILE LOG] Error crítico al escribir en el log: {fileEx.Message}");
                }
            }
            catch (Exception ex)
            {
                string errorDetail = $"Error inesperado al escribir archivo: {ex.Message}\nStack: {ex.StackTrace}";
                try
                {
                    File.AppendAllText(logFilePath, $"{DateTime.Now}: {errorDetail}\n");
                    Console.WriteLine($"[FILE LOG] Error registrado en {logFilePath}");
                }
                catch (Exception fileEx)
                {
                    Console.WriteLine($"[FILE LOG] Error crítico al escribir en el log: {fileEx.Message}");
                }
            }

            Console.WriteLine("\n------------------------------------\n");

            // --- Ejemplo 3: Uso de EventLog (Requiere permisos de administrador para crear fuente) ---
            // Solo para errores críticos o eventos del sistema.
            // La fuente debe existir o ser creada con permisos elevados.
            string sourceName = "MyAppErrorSource";
            if (!EventLog.SourceExists(sourceName))
            {
                // Esto requerirá permisos de administrador para ejecutar
                // EventLog.CreateEventSource(sourceName, "Application");
                Console.WriteLine("AVISO: Fuente de EventLog no existe. Intenta ejecutar como administrador para crearla.");
            }
            else
            {
                try
                {
                    EventLog.WriteEntry(sourceName, "Esto es un mensaje de error de prueba para EventLog.", EventLogEntryType.Error);
                    Console.WriteLine("[EVENT LOG] Mensaje escrito en el EventLog de Windows.");
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"[EVENT LOG] Error al escribir en EventLog: {ex.Message}");
                }
            }

            Console.WriteLine("\n------------------------------------\n");

            // --- Ejemplo 4: Uso de una librería de logging (ej. Serilog) ---
            /*
            Console.WriteLine("Ejemplo 4: Logging con Serilog (si está configurado).");
            try
            {
                // Simular un error con más contexto
                string invalidData = "no_es_un_numero";
                int parsedValue = int.Parse(invalidData);
            }
            catch (FormatException ex)
            {
                _logger.Error(ex, "Error al procesar datos de usuario: {InvalidData}", invalidData);
                // La plantilla de mensaje permite añadir parámetros para una mejor búsqueda y análisis
                Console.WriteLine("[SERILOG] Error registrado con Serilog.");
            }
            // Después de usar Serilog, asegúrate de liberar los recursos
            // Log.CloseAndFlush();
            */

            Console.WriteLine("\nPresiona cualquier tecla para salir.");
            Console.ReadKey();
        }
    }

    // Ejemplo incorrecto: Ignorar o "tragar" excepciones sin registrar.
    // Esto hace que los errores sean invisibles y muy difíciles de depurar en producción.
    /*
    public class BadErrorHandling
    {
        public void DoSomethingDangerous()
        {
            try
            {
                // Algo que puede fallar...
                int x = 10 / 0;
            }
            catch (Exception)
            {
                // ¡No hacer nada aquí! Esto "traga" el error y no hay forma de saber qué pasó.
            }
        }
    }
    */
}
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Manejo de Errores y Excepciones',
    'topic': 'Depuración',
    'subtopic': 'Uso del depurador de Visual Studio',
    'definition': r'''
El depurador de Visual Studio es una herramienta súper poderosa que te permite ver lo que está pasando dentro de tu código mientras se ejecuta. Pensemos por un momento en esto como tener visión de rayos X para tu programa: puedes ver el valor de cada variable, la ruta que toma la ejecución y dónde exactamente se detiene o falla tu código.

¿Te estás preguntando por qué esto importa? 

Porque el código rara vez funciona perfectamente a la primera. Cuando algo no va como esperabas (un error, un comportamiento inesperado), depurar es la forma más eficiente de encontrar la causa raíz. Intentar depurar solo con `Console.WriteLine` o `MessageBox.Show` es como buscar una aguja en un pajar con los ojos vendados; el depurador te da la linterna y las pinzas. Es una habilidad esencial para cualquier desarrollador, ya que te ahorra horas de frustración y te permite resolver problemas complejos de manera metódica.

El depurador de Visual Studio te ofrece un control total sobre la ejecución de tu programa. Puedes:
* **Iniciar la depuración:** Presionando `F5` (o el botón de "Iniciar" con el icono de Play).
* **Pausar la ejecución:** Cuando el programa llega a un punto de interrupción (breakpoint).
* **Ejecutar paso a paso:**
    * `F10` (Step Over): Ejecuta la línea actual y pasa a la siguiente, sin entrar en los detalles de las llamadas a métodos. Ideal para saltar llamadas a librerías o métodos que sabes que funcionan bien.
    * `F11` (Step Into): Ejecuta la línea actual y si es una llamada a un método, "entra" en ese método para depurarlo paso a paso. Útil cuando quieres ver qué hace un método.
    * `Shift + F11` (Step Out): Si estás dentro de un método, te saca de él y ejecuta el resto del método, deteniéndose en la línea posterior a la llamada original.
* **Inspeccionar variables:** Mientras el programa está pausado, puedes pasar el mouse por encima de las variables o usar las ventanas "Autos", "Locals" y "Watch" para ver sus valores en tiempo real.
* **Ventana de Inmediato:** Te permite ejecutar líneas de código o evaluar expresiones sobre la marcha.
* **Ventana de Pila de Llamadas (Call Stack):** Muestra la secuencia de llamadas a métodos que llevaron al punto actual en la ejecución.

Dominar el depurador es como tener un superpoder que te permite entender y solucionar problemas en tu código de forma eficiente.
''',
    'code_example': r'''
// Ejemplo de cómo usarías el depurador de Visual Studio con este código

using System;
using System.Collections.Generic;
using System.Linq;

namespace DebuggerDemo
{
    public class SimpleCalculator
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("Bienvenido a la calculadora simple.");

            // PON UN PUNTO DE INTERRUPCIÓN AQUÍ (haz clic en el margen izquierdo de esta línea)
            List<double> numbers = new List<double>();
            double sum = 0;
            int count = 0;

            Console.Write("Introduce el primer número (o 'fin' para terminar): ");
            string input = Console.ReadLine();

            while (input.ToLower() != "fin")
            {
                try
                {
                    double num = double.Parse(input);
                    numbers.Add(num);
                    sum += num;
                    count++;
                }
                catch (FormatException ex)
                {
                    Console.WriteLine($"Error: '{input}' no es un número válido. Por favor, introduce un número.");
                    // PON UN PUNTO DE INTERRUPCIÓN AQUÍ para ver la excepción
                }
                catch (OverflowException ex)
                {
                    Console.WriteLine($"Error: El número es demasiado grande o pequeño. {ex.Message}");
                }

                Console.Write("Introduce el siguiente número (o 'fin' para terminar): ");
                input = Console.ReadLine();
            }

            // PON UN PUNTO DE INTERRUPCIÓN AQUÍ para ver los resultados finales
            if (count > 0)
            {
                double average = sum / count;
                Console.WriteLine($"\nSuma total: {sum}");
                Console.WriteLine($"Cantidad de números: {count}");
                Console.WriteLine($"Promedio: {average:F2}"); // Formato a 2 decimales
            }
            else
            {
                Console.WriteLine("No se introdujeron números para calcular.");
            }

            Console.WriteLine("Programa finalizado. Presiona cualquier tecla para salir.");
            Console.ReadKey();
        }
    }

    // Ejemplo incorrecto: Intentar adivinar el problema sin usar el depurador.
    // Si la aplicación falla sin un mensaje claro, sin el depurador sería difícil saber
    // qué línea de código causó el error, o cuál era el valor de una variable en un momento dado.
    /*
    public class BadDebugging
    {
        public void CalculateComplex(List<double> values)
        {
            // Imagina un cálculo complejo que a veces falla
            double result = 0;
            foreach (var val in values)
            {
                // Si aquí hay un error lógico o una división por cero
                // Sin el depurador, solo verías el programa crashear o dar un resultado incorrecto.
                result += Math.Sqrt(val);
            }
            // ¿Cómo sabrías qué 'val' causó el problema o cuál era el valor de 'result' en cada iteración?
        }
    }
    */
}
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Manejo de Errores y Excepciones',
    'topic': 'Depuración',
    'subtopic': 'Puntos de interrupción y seguimiento de variables',
    'definition': r'''
Los puntos de interrupción (breakpoints) y el seguimiento de variables son como la lupa y el cuaderno de notas del depurador de Visual Studio. Te permiten congelar la ejecución de tu programa en un punto exacto y luego examinar a fondo el estado de tu aplicación en ese momento.

¿Te estás preguntando por qué esto importa? 

Porque el código se ejecuta a una velocidad increíble. Sin puntos de interrupción, sería imposible ver qué está pasando paso a paso. Y sin la capacidad de ver los valores de las variables, no podrías entender por qué tu lógica no está produciendo los resultados esperados. Son herramientas indispensables para diagnosticar y corregir errores, ya que te proporcionan una ventana directa al "cerebro" de tu programa mientras trabaja.

Aquí te explico cómo funcionan y para qué sirven:
* **Puntos de interrupción (Breakpoints):**
    * Son marcas que colocas en tu código (haciendo clic en el margen gris a la izquierda de una línea) que le dicen al depurador que detenga la ejecución del programa justo antes de ejecutar esa línea.
    * Una vez que el depurador se detiene en un breakpoint, puedes inspeccionar el estado de la aplicación.
    * **Tipos de Breakpoints:** No son solo "parar aquí". Puedes configurar:
        * **Condiciones:** Que el breakpoint se active solo si una variable tiene un valor específico (ej. `i == 5`).
        * **Contadores de llamadas:** Que el breakpoint se active solo después de un cierto número de veces que se ha alcanzado la línea.
        * **Acciones:** Ejecutar un mensaje en la ventana de salida sin detener la ejecución (útil para logging rápido).
* **Seguimiento de Variables:** Una vez que estás en un breakpoint, Visual Studio te ofrece varias ventanas para inspeccionar variables:
    * **Ventana "Autos":** Muestra las variables que se usan en la línea actual y la línea anterior. Muy conveniente para ver lo que necesitas en el momento.
    * **Ventana "Locals":** Muestra todas las variables que están en el alcance local del método actual.
    * **Ventana "Watch":** Aquí puedes añadir manualmente cualquier variable o expresión que quieras monitorear, incluso propiedades de objetos complejos. Esto es genial para mantener un ojo en valores específicos a medida que avanzas en el código.
    * **Información sobre herramientas (Tooltips):** Simplemente pasa el mouse sobre una variable en el editor de código y aparecerá una pequeña ventana emergente con su valor actual.

Al usar estas herramientas en conjunto, puedes desentrañar incluso los errores más escurridizos, entendiendo el flujo de tu programa y el estado de sus datos en cualquier momento.
''',
    'code_example': r'''
// Ejemplo práctico de puntos de interrupción y seguimiento de variables en C#

using System;
using System.Collections.Generic;

namespace DebuggingToolsDemo
{
    public class ShoppingCart
    {
        public List<Item> Items { get; set; } = new List<Item>();
        public decimal TotalPrice { get; private set; } = 0m;

        public void AddItem(string name, decimal price, int quantity)
        {
            if (string.IsNullOrWhiteSpace(name))
            {
                throw new ArgumentNullException(nameof(name), "El nombre del artículo no puede estar vacío.");
            }
            if (price <= 0)
            {
                throw new ArgumentOutOfRangeException(nameof(price), "El precio debe ser mayor que cero.");
            }
            if (quantity <= 0)
            {
                throw new ArgumentOutOfRangeException(nameof(quantity), "La cantidad debe ser mayor que cero.");
            }

            var newItem = new Item { Name = name, Price = price, Quantity = quantity };
            Items.Add(newItem); // Establece un punto de interrupción aquí (línea 18)
            UpdateTotalPrice();
        }

        private void UpdateTotalPrice()
        {
            decimal currentTotal = 0m;
            foreach (var item in Items) // Establece un punto de interrupción aquí (línea 25)
            {
                currentTotal += item.Price * item.Quantity; // Aquí puedes observar 'item' y 'currentTotal'
            }
            TotalPrice = currentTotal;
        }

        public class Item
        {
            public string Name { get; set; }
            public decimal Price { get; set; }
            public int Quantity { get; set; }
        }

        public static void Main(string[] args)
        {
            ShoppingCart cart = new ShoppingCart();

            try
            {
                cart.AddItem("Laptop", 1200.50m, 1);
                cart.AddItem("Mouse", 25.00m, 2);
                cart.AddItem("Teclado", 75.00m, 0); // Esto lanzará una excepción
            }
            catch (ArgumentOutOfRangeException ex)
            {
                Console.WriteLine($"Error de argumento: {ex.Message}");
            }
            catch (ArgumentNullException ex)
            {
                Console.WriteLine($"Error de nulo: {ex.Message}");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error inesperado: {ex.Message}");
            }

            Console.WriteLine($"\nTotal del carrito: ${cart.TotalPrice:F2}");

            Console.WriteLine("Presiona cualquier tecla para salir.");
            Console.ReadKey();
        }
    }

    // Para usar este ejemplo:
    // 1. Abre este código en Visual Studio.
    // 2. Haz clic en el margen gris junto a la línea 18 (`Items.Add(newItem);`) para establecer un breakpoint.
    // 3. Haz clic en el margen gris junto a la línea 25 (`foreach (var item in Items)`) para establecer otro breakpoint.
    // 4. Inicia la depuración (presiona F5).
    // 5. Cuando la ejecución se detenga en la línea 18:
    //    - Pasa el mouse sobre `newItem` para ver sus propiedades.
    //    - Abre la ventana "Locals" (Depurar -> Ventanas -> Locales) para ver todas las variables en el ámbito.
    //    - Abre la ventana "Watch" (Depurar -> Ventanas -> Inspección) y añade `cart.Items.Count` y `cart.TotalPrice` para monitorearlos.
    //    - Presiona F10 (Step Over) para ir a la siguiente línea. Observa cómo cambian los valores en las ventanas.
    // 6. La ejecución se detendrá en la línea 25.
    //    - En la ventana "Locals" o pasando el mouse, observa el valor de `item` en cada iteración del bucle.
    //    - Observa cómo `currentTotal` se actualiza.
    // 7. La llamada a `cart.AddItem("Teclado", 75.00m, 0);` lanzará una `ArgumentOutOfRangeException`.
    //    El depurador te llevará al bloque `catch`.
    // 8. Experimenta con F10, F11 y Shift+F11 para ver cómo se mueven a través del código.

    // Ejemplo incorrecto: No usar breakpoints para entender el estado intermedio de un bucle.
    // Si tuvieras un cálculo complejo dentro de un bucle y el resultado final es incorrecto,
    // sin un breakpoint dentro del bucle, sería muy difícil saber en qué iteración o con qué datos
    // el cálculo se desvió.
    '''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Jr',
    'level': 5,
    'title_level': 'Manejo de Errores y Excepciones',
    'topic': 'Depuración',
    'subtopic': 'Análisis de stack trace',
    'definition': r'''
El stack trace (o pila de llamadas) es como el historial de navegación de tu programa justo antes de que ocurriera un error. Cuando tu aplicación lanza una excepción no controlada, o cuando el depurador se detiene, el stack trace es la secuencia de llamadas a métodos que llevaron al punto actual. Piensa en esto como una lista de "quién llamó a quién" en el momento del fallo.

¿Te estás preguntando por qué esto importa? 

Porque el stack trace es una de las herramientas más valiosas para diagnosticar dónde y cómo un error se originó en tu código. Te muestra la línea exacta donde se lanzó la excepción y, más importante aún, te da la secuencia completa de métodos que se estaban ejecutando en ese momento. Sin él, verías un mensaje de error genérico y no tendrías idea de dónde empezar a buscar en tu código. Es tu GPS para encontrar la ubicación de un error.

Cuando una excepción ocurre, el stack trace se genera automáticamente y suele aparecer en la consola, en los logs de error o en la ventana de "Pila de llamadas" del depurador de Visual Studio. Cada línea en el stack trace representa una "llamada de marco" o "stack frame", que incluye:
* El nombre del archivo fuente (por ejemplo, `Program.cs`).
* El nombre del método o función que estaba en ejecución (por ejemplo, `Main`, `Calcular`, `GuardarDatos`).
* El número de línea exacto dentro de ese archivo donde se realizó la llamada o donde ocurrió el error.

La clave para analizar un stack trace es leerlo de abajo hacia arriba (o a veces de arriba hacia abajo, dependiendo de la herramienta). La línea superior suele ser donde la excepción fue lanzada directamente, mientras que las líneas inferiores te muestran la secuencia de llamadas que condujeron a ese punto. Por ejemplo, si tienes un método `A` que llama a `B`, y `B` llama a `C`, y `C` es donde ocurre el error, el stack trace mostrará `C` en la parte superior, luego `B`, y luego `A`. Esto te ayuda a entender el flujo de ejecución y a identificar la causa raíz, que podría estar no en la línea donde se lanzó la excepción, sino en un método anterior que pasó datos incorrectos.
''',
    'code_example': r'''
// Ejemplo de análisis de Stack Trace en C#

using System;
using System.IO; // Para simular errores de archivo

namespace StackTraceAnalysisDemo
{
    public class DataProcessor
    {
        public void ProcessFile(string filePath)
        {
            Console.WriteLine("Procesando archivo...");
            // Este método llama a otro método que puede lanzar una excepción
            ReadFileContent(filePath);
            Console.WriteLine("Archivo procesado con éxito (si no hubo errores).");
        }

        private void ReadFileContent(string path)
        {
            Console.WriteLine("Intentando leer contenido del archivo...");
            // Esta línea puede lanzar una FileNotFoundException si el archivo no existe
            string content = File.ReadAllText(path); // Línea que puede causar la excepción
            Console.WriteLine("Contenido del archivo: " + content);
        }

        public static void Main(string[] args)
        {
            DataProcessor processor = new DataProcessor();
            string nonExistentFile = "datos_inexistentes.txt";

            try
            {
                processor.ProcessFile(nonExistentFile);
            }
            catch (Exception ex)
            {
                Console.WriteLine("\n--- ¡Se ha producido un error! ---");
                Console.WriteLine($"Tipo de excepción: {ex.GetType().Name}");
                Console.WriteLine($"Mensaje: {ex.Message}");
                Console.WriteLine("\n--- Stack Trace (Pila de Llamadas) ---");
                Console.WriteLine(ex.StackTrace); // Aquí imprimimos el stack trace completo
                Console.WriteLine("\n--- Fin del Stack Trace ---\n");

                // Análisis manual del stack trace (lo que harías visualmente)
                Console.WriteLine("Análisis del Stack Trace:");
                // Al leer el Stack Trace, buscarías las líneas que hacen referencia a tu código,
                // no solo a las librerías de .NET.
                // Verás algo como:
                // at StackTraceAnalysisDemo.DataProcessor.ReadFileContent(String path) in C:\...\Program.cs:line 23
                // at StackTraceAnalysisDemo.DataProcessor.ProcessFile(String filePath) in C:\...\Program.cs:line 16
                // at StackTraceAnalysisDemo.Program.Main(String[] args) in C:\...\Program.cs:line 30
                // Esto te dice que el error ocurrió en ReadFileContent, que fue llamado por ProcessFile,
                // que a su vez fue llamado por Main.
            }

            Console.WriteLine("Programa finalizado. Presiona cualquier tecla para salir.");
            Console.ReadKey();
        }
    }

    // Ejemplo incorrecto: No imprimir el stack trace al registrar un error.
    // Si solo registras el mensaje de la excepción, sabrás QUÉ pasó, pero no DÓNDE o CÓMO.
    /*
    public class BadLogging
    {
        public void PerformOperation()
        {
            try
            {
                // Un método que llama a otro que falla
                AnotherMethod();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message); // Solo el mensaje, sin el rastro completo.
                // Esto hace que sea muy difícil depurar si el error no es obvio.
            }
        }

        private void AnotherMethod()
        {
            throw new InvalidOperationException("Algo salió mal aquí.");
        }
    }
    */
}
'''
  });
}

Future<void> insertPuntonetJrLevel6Data(Database db) async {
  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Pruebas y Mantenimiento',
    'topic': 'Pruebas Unitarias',
    'subtopic': 'Introducción a MSTest y NUnit',
    'definition': r'''
Las pruebas unitarias son una forma de verificar que las partes más pequeñas e independientes de tu código (llamadas "unidades", que suelen ser métodos o clases) funcionan exactamente como esperas. Pensemos por un momento en esto como un mecánico que prueba individualmente cada componente de un motor antes de ensamblarlo: se asegura de que el pistón haga su trabajo, que la bujía genere chispa, etc.

¿Te estás preguntando por qué esto importa? Porque detectar errores temprano es infinitamente más barato y fácil que detectarlos tarde, cuando ya están integrados en un sistema complejo. Las pruebas unitarias te dan confianza en tu código, facilitan la refactorización (cambiar el código sin romperlo), y actúan como una documentación viva de cómo debe comportarse cada pieza de tu software. Sin pruebas unitarias, cada cambio que hagas sería un salto de fe, aumentando el riesgo de introducir nuevos errores.

En el mundo .NET, los frameworks más populares para escribir pruebas unitarias son **MSTest** (integrado con Visual Studio) y **NUnit** (uno de los más antiguos y flexibles). Ambos cumplen el mismo propósito: proporcionarte una estructura para escribir pruebas, ejecutar esas pruebas y reportar los resultados (si pasaron o fallaron).

* **MSTest:** Es el framework de pruebas de Microsoft. Viene preinstalado con Visual Studio y es una excelente opción para proyectos que ya están profundamente integrados en el ecosistema de Microsoft. Es sencillo de usar y se siente muy natural para los desarrolladores de C#.
* **NUnit:** Es un framework de pruebas de código abierto muy popular y maduro. Ofrece una gran flexibilidad y características avanzadas, y es ampliamente utilizado en la comunidad .NET. Muchas veces, los equipos eligen NUnit por su versatilidad y el amplio soporte de la comunidad.

Ambos frameworks te permiten definir "clases de prueba" y "métodos de prueba" especiales, que son los que contendrán tu lógica de prueba. Aunque la sintaxis varía ligeramente entre ellos, el concepto es el mismo: escribir código que invoca tu código "real", le pasa ciertas entradas, y luego verifica si la salida o el comportamiento es el esperado.
''',
    'code_example': r'''
// Ejemplo de introducción a MSTest y NUnit

// --- 1. Configuración del proyecto de pruebas ---
// En Visual Studio, cuando creas un proyecto de pruebas unitarias,
// automáticamente se añaden las referencias necesarias al framework elegido.
// Para NUnit, deberías instalar los paquetes NuGet: NUnit y NUnit3TestAdapter.
// Para MSTest, los paquetes son MSTest.TestFramework y MSTest.TestAdapter.


// --- 2. Ejemplo con MSTest ---
// Se crea un proyecto de tipo "MSTest Test Project"
using Microsoft.VisualStudio.TestTools.UnitTesting; // Necesario para MSTest

namespace MyWebApp.Tests
{
    // La clase de prueba debe tener el atributo [TestClass]
    [TestClass]
    public class CalculadoraMSTest
    {
        // Cada método de prueba debe tener el atributo [TestMethod]
        [TestMethod]
        public void Sumar_DosNumerosPositivos_RetornaSumaCorrecta()
        {
            // Arrange (Preparación): Configura los datos de entrada y el estado inicial
            var calculadora = new Calculadora(); // Asume que tienes una clase Calculadora
            int num1 = 5;
            int num2 = 3;
            int expected = 8;

            // Act (Acción): Ejecuta el código que estás probando
            int actual = calculadora.Sumar(num1, num2);

            // Assert (Aserción): Verifica que el resultado es el esperado
            Assert.AreEqual(expected, actual, "La suma de dos números positivos debería ser correcta.");
        }

        [TestMethod]
        public void Restar_NumerosIguales_RetornaCero()
        {
            var calculadora = new Calculadora();
            int num1 = 10;
            int num2 = 10;
            int expected = 0;

            int actual = calculadora.Restar(num1, num2);

            Assert.AreEqual(expected, actual);
        }
    }
}


// --- 3. Ejemplo con NUnit ---
// Se crea un proyecto de tipo "NUnit Test Project"
using NUnit.Framework; // Necesario para NUnit

namespace MyWebApp.Tests.NUnit
{
    // La clase de prueba debe tener el atributo [TestFixture]
    [TestFixture]
    public class CalculadoraNUnit
    {
        // Cada método de prueba debe tener el atributo [Test]
        [Test]
        public void Sumar_DosNumerosPositivos_RetornaSumaCorrecta()
        {
            // Arrange
            var calculadora = new Calculadora();
            int num1 = 5;
            int num2 = 3;
            int expected = 8;

            // Act
            int actual = calculadora.Sumar(num1, num2);

            // Assert
            Assert.AreEqual(expected, actual, "La suma de dos números positivos debería ser correcta.");
        }

        [Test]
        public void Dividir_PorCero_LanzaExcepcion()
        {
            var calculadora = new Calculadora();
            int numerador = 10;
            int denominador = 0;

            // Assert.Throws<TException> se usa para verificar que se lanza una excepción específica
            Assert.Throws<System.DivideByZeroException>(() => calculadora.Dividir(numerador, denominador));
        }
    }
}

// --- Clase que estamos probando (en tu proyecto principal, no en el de pruebas) ---
// Models/Calculadora.cs (o similar)
namespace MyWebApp
{
    public class Calculadora
    {
        public int Sumar(int a, int b)
        {
            return a + b;
        }

        public int Restar(int a, int b)
        {
            return a - b;
        }

        public double Dividir(int a, int b)
        {
            // Esta línea lanzará DivideByZeroException si b es 0
            return (double)a / b;
        }
    }
}

// Ejemplo incorrecto: Una prueba unitaria que prueba múltiples unidades o dependencias externas.
// Una prueba unitaria debe ser "unitaria", es decir, probar solo una pequeña pieza de código de forma aislada.
// Si tu prueba necesita una base de datos, un servicio web, o un archivo externo, no es una prueba unitaria pura.
// Esas son pruebas de integración o end-to-end.
/*
[TestMethod]
public void GuardarUsuario_ConexionBDExitosa_InsertaUsuario()
{
    // Esto requiere una base de datos real, no es una prueba unitaria.
    // var dbContext = new MyDbContext();
    // var userService = new UserService(dbContext);
    // userService.SaveUser(new User { Name = "Test" });
    // Assert.IsTrue(dbContext.Users.Any(u => u.Name == "Test"));
}
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Pruebas y Mantenimiento',
    'topic': 'Pruebas Unitarias',
    'subtopic': 'Creación de pruebas básicas',
    'definition': r'''
Crear pruebas unitarias básicas es un arte que se centra en verificar el comportamiento de la unidad más pequeña y lógica de tu código: un método, una función o una clase aislada. Pensemos por un momento en esto como un chef probando un solo ingrediente antes de añadirlo al plato principal: se asegura de que la sal sea salada y que el azúcar sea dulce, de forma independiente.

¿Te estás preguntando por qué esto importa? 

Porque cada línea de código que escribes tiene un propósito. Las pruebas unitarias te obligan a pensar en ese propósito, en las entradas que tu código espera y en las salidas o efectos secundarios que debe producir. Al escribir pruebas, no solo validas que el código funciona hoy, sino que también creas una red de seguridad para cambios futuros. Si alguien modifica accidentalmente un método y rompe su comportamiento esperado, la prueba unitaria fallará de inmediato, alertándote del problema.

El proceso de creación de una prueba unitaria básica generalmente sigue el patrón "Arrange-Act-Assert" (AAA):

1.  **Arrange (Preparación):** En esta fase, configuras todo lo que tu prueba necesita. Esto incluye inicializar objetos, crear datos de prueba, establecer variables y cualquier otra cosa que sea necesaria para que el método bajo prueba pueda ejecutarse. Es como preparar todos los ingredientes y utensilios en tu cocina antes de empezar a cocinar.
2.  **Act (Acción):** Aquí es donde invocas el método o la función que estás probando. Es la "acción" principal de tu prueba. Llamas al código que quieres verificar. Es como ejecutar la receta.
3.  **Assert (Aserción):** En esta fase, verificas que el resultado de la acción es el esperado. Utilizas métodos de aserción proporcionados por tu framework de pruebas (MSTest o NUnit) para comparar el resultado real con el resultado esperado. Es como probar el plato final y asegurarte de que sabe exactamente como debería.

Al adherirte a este patrón AAA, tus pruebas unitarias serán claras, legibles y fáciles de mantener. Una buena prueba unitaria debe ser rápida, independiente (no debe depender del orden de ejecución de otras pruebas ni de recursos externos) y reproducible (siempre debe dar el mismo resultado para las mismas entradas).
''',
    'code_example': r'''
// Ejemplo de creación de pruebas unitarias básicas siguiendo el patrón AAA

using Microsoft.VisualStudio.TestTools.UnitTesting; // O using NUnit.Framework; si usas NUnit

namespace MyWebApp.Tests
{
    // Clase de ejemplo que vamos a probar
    public class GestorPedidos
    {
        public decimal CalcularPrecioTotal(int cantidad, decimal precioUnitario, decimal descuentoPorcentaje)
        {
            if (cantidad <= 0)
            {
                throw new ArgumentOutOfRangeException(nameof(cantidad), "La cantidad debe ser mayor que cero.");
            }
            if (precioUnitario <= 0)
            {
                throw new ArgumentOutOfRangeException(nameof(precioUnitario), "El precio unitario debe ser mayor que cero.");
            }
            if (descuentoPorcentaje < 0 || descuentoPorcentaje > 100)
            {
                throw new ArgumentOutOfRangeException(nameof(descuentoPorcentaje), "El descuento debe estar entre 0 y 100.");
            }

            decimal subtotal = cantidad * precioUnitario;
            decimal descuento = subtotal * (descuentoPorcentaje / 100);
            return subtotal - descuento;
        }

        public string GenerarMensajeConfirmacion(string nombreCliente, int idPedido)
        {
            if (string.IsNullOrWhiteSpace(nombreCliente))
            {
                throw new ArgumentNullException(nameof(nombreCliente), "El nombre del cliente no puede ser nulo o vacío.");
            }
            if (idPedido <= 0)
            {
                throw new ArgumentOutOfRangeException(nameof(idPedido), "El ID del pedido debe ser mayor que cero.");
            }
            return $"Estimado/a {nombreCliente}, su pedido #{idPedido} ha sido confirmado.";
        }
    }


    // Clase de pruebas para GestorPedidos
    [TestClass] // Para MSTest (o [TestFixture] para NUnit)
    public class GestorPedidosTests
    {
        // Prueba para CalcularPrecioTotal con descuento
        [TestMethod] // Para MSTest (o [Test] para NUnit)
        public void CalcularPrecioTotal_ConDescuento_RetornaPrecioCorrecto()
        {
            // Arrange: Prepara los datos de entrada
            var gestor = new GestorPedidos();
            int cantidad = 2;
            decimal precioUnitario = 50.00m;
            decimal descuentoPorcentaje = 10.00m; // 10% de descuento
            decimal expectedPrice = 90.00m; // (2 * 50) - (100 * 0.10) = 100 - 10 = 90

            // Act: Ejecuta el método que se está probando
            decimal actualPrice = gestor.CalcularPrecioTotal(cantidad, precioUnitario, descuentoPorcentaje);

            // Assert: Verifica el resultado
            Assert.AreEqual(expectedPrice, actualPrice, "El cálculo del precio total con descuento no es correcto.");
        }

        // Prueba para GenerarMensajeConfirmacion
        [TestMethod]
        public void GenerarMensajeConfirmacion_DatosValidos_RetornaMensajeCorrecto()
        {
            // Arrange
            var gestor = new GestorPedidos();
            string nombreCliente = "Ana Pérez";
            int idPedido = 12345;
            string expectedMessage = "Estimado/a Ana Pérez, su pedido #12345 ha sido confirmado.";

            // Act
            string actualMessage = gestor.GenerarMensajeConfirmacion(nombreCliente, idPedido);

            // Assert
            Assert.AreEqual(expectedMessage, actualMessage, "El mensaje de confirmación no es el esperado.");
        }

        // Prueba para un caso de borde o error esperado
        [TestMethod]
        [ExpectedException(typeof(ArgumentOutOfRangeException))] // Para MSTest
        // [Test, Throws(typeof(ArgumentOutOfRangeException))] // Para NUnit
        public void CalcularPrecioTotal_CantidadCero_LanzaExcepcion()
        {
            // Arrange
            var gestor = new GestorPedidos();
            int cantidad = 0; // Cantidad inválida
            decimal precioUnitario = 50.00m;
            decimal descuentoPorcentaje = 0.00m;

            // Act (Se espera que esta línea lance la excepción)
            gestor.CalcularPrecioTotal(cantidad, precioUnitario, descuentoPorcentaje);

            // Assert: La aserción se hace mediante el atributo ExpectedException o Throws.
            // Si la excepción esperada se lanza, la prueba pasa. Si no, o si se lanza otra, falla.
        }
    }
}

// Ejemplo incorrecto: Una prueba unitaria con múltiples "Act" o "Assert".
// Cada prueba unitaria debe enfocarse en verificar una sola cosa.
// Múltiples aserciones son aceptables si verifican aspectos relacionados de un mismo resultado.
/*
[TestMethod]
public void SumarYRestar_Numeros_RetornaResultadosCorrectosPeroMalDiseño()
{
    var calc = new Calculadora();
    int sumResult = calc.Sumar(5, 3);
    Assert.AreEqual(8, sumResult); // Primera aserción
    int subResult = calc.Restar(5, 3); // Segundo "Act" en la misma prueba
    Assert.AreEqual(2, subResult); // Segunda aserción

    // Esto sería mejor dividido en dos pruebas separadas: una para Sumar y otra para Restar.
}
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Pruebas y Mantenimiento',
    'topic': 'Pruebas Unitarias',
    'subtopic': 'Uso de aserciones y pruebas parametrizadas',
    'definition': r'''
Las aserciones son el corazón de tus pruebas unitarias, son las que realmente deciden si tu código pasa la prueba o falla. Son las afirmaciones que haces sobre el comportamiento de tu código. Las pruebas parametrizadas, por otro lado, te permiten ejecutar la misma prueba con diferentes conjuntos de datos de entrada, sin tener que escribir el mismo código de prueba una y otra vez. Pensemos por un momento en esto como un control de calidad: las aserciones son los criterios de aceptación que pones para cada pieza (ej. "el tornillo debe medir exactamente 2 cm"), y las pruebas parametrizadas son como tener una máquina que prueba 100 tornillos diferentes con los mismos criterios de golpe.

¿Te estás preguntando por qué esto importa? 

Porque de nada sirve ejecutar tu código en un entorno de prueba si no verificas los resultados. Las aserciones son esa verificación. Te permiten ser explícito sobre el comportamiento esperado. Las pruebas parametrizadas son importantes porque a menudo el mismo algoritmo necesita ser probado con una variedad de entradas (casos normales, casos extremos, casos de borde). Escribir una prueba separada para cada caso es tedioso y repetitivo; las pruebas parametrizadas automatizan este proceso, haciendo que tus pruebas sean más concisas, fáciles de leer y mantener.

**Aserciones:**
Son métodos proporcionados por tu framework de pruebas (MSTest con la clase `Assert`, o NUnit con `Assert` también) que lanzan una excepción si la condición que están verificando no es verdadera. Los tipos comunes de aserciones incluyen:
* **`Assert.AreEqual(expected, actual)`:** Verifica si dos valores son iguales.
* **`Assert.AreNotEqual(expected, actual)`:** Verifica si dos valores son diferentes.
* **`Assert.IsTrue(condition)` / `Assert.IsFalse(condition)`:** Verifica si una condición booleana es verdadera o falsa.
* **`Assert.IsNull(object)` / `Assert.IsNotNull(object)`:** Verifica si un objeto es nulo o no.
* **`Assert.ThrowsException<TException>(Action)` (MSTest) / `Assert.Throws<TException>(TestDelegate)` (NUnit):** Verifica que una pieza de código lanza una excepción específica.
* **`Assert.Contains(expectedSubstring, actualString)` (NUnit) / `StringAssert.Contains` (MSTest):** Verifica que una cadena contiene una subcadena.

**Pruebas Parametrizadas:**
En NUnit, se logran con atributos como `[TestCase]`, `[TestCaseSource]` o `[Values]`. En MSTest, puedes usar `[DataTestMethod]` junto con `[DataRow]` o `[DynamicData]`. Estos atributos te permiten pasar diferentes valores a los parámetros de tu método de prueba, de modo que el framework ejecute la misma prueba múltiples veces, una vez por cada conjunto de datos. Esto es increíblemente útil para:
* Probar diferentes escenarios de entrada (ej. números positivos, negativos, cero).
* Verificar el manejo de errores con diferentes tipos de datos inválidos.
* Reducir la duplicación de código en tus pruebas.
''',
    'code_example': r'''
// Ejemplo de uso de aserciones y pruebas parametrizadas

using Microsoft.VisualStudio.TestTools.UnitTesting; // Para MSTest
// using NUnit.Framework; // Para NUnit

namespace MyWebApp.Tests
{
    // Clase que estamos probando
    public class ValidadorTexto
    {
        public bool EsPalindromo(string texto)
        {
            if (string.IsNullOrEmpty(texto))
            {
                return false;
            }
            string cleanedText = new string(texto.ToLower().Where(char.IsLetterOrDigit).ToArray());
            string reversedText = new string(cleanedText.Reverse().ToArray());
            return cleanedText.Equals(reversedText);
        }

        public string CapitalizarPrimeraLetra(string texto)
        {
            if (string.IsNullOrWhiteSpace(texto))
            {
                return texto;
            }
            return char.ToUpper(texto[0]) + texto.Substring(1).ToLower();
        }
    }


    // Clase de pruebas con aserciones y pruebas parametrizadas
    [TestClass] // Para MSTest (o [TestFixture] para NUnit)
    public class ValidadorTextoTests
    {
        // --- Aserciones básicas ---
        [TestMethod]
        public void EsPalindromo_CadenaVaciaONula_RetornaFalso()
        {
            var validador = new ValidadorTexto();
            Assert.IsFalse(validador.EsPalindromo(null), "Null debería retornar falso.");
            Assert.IsFalse(validador.EsPalindromo(""), "Cadena vacía debería retornar falso.");
        }

        [TestMethod]
        public void CapitalizarPrimeraLetra_CadenaNula_RetornaNulo()
        {
            var validador = new ValidadorTexto();
            string result = validador.CapitalizarPrimeraLetra(null);
            Assert.IsNull(result, "Capitalizar una cadena nula debería retornar nulo.");
        }

        [TestMethod]
        public void CapitalizarPrimeraLetra_CadenaSoloEspacios_RetornaSoloEspacios()
        {
            var validador = new ValidadorTexto();
            string result = validador.CapitalizarPrimeraLetra("   ");
            Assert.AreEqual("   ", result, "Capitalizar solo espacios debería retornar solo espacios.");
        }


        // --- Pruebas Parametrizadas (Ejemplo con MSTest [DataRow]) ---
        // Para NUnit usarías [TestCase("radar", true)], [TestCase("hola", false)] etc.
        [DataTestMethod]
        [DataRow("radar", true)]
        [DataRow("oso", true)]
        [DataRow("Anita lava la tina", true)] // Con espacios y mayúsculas/minúsculas
        [DataRow("reconocer", true)]
        [DataRow("hola", false)]
        [DataRow("mundo", false)]
        [DataRow("abcde", false)]
        public void EsPalindromo_VariasEntradas_RetornaResultadoEsperado(string input, bool expected)
        {
            // Arrange
            var validador = new ValidadorTexto();

            // Act
            bool actual = validador.EsPalindromo(input);

            // Assert
            Assert.AreEqual(expected, actual, $"'{input}' {(expected ? "debería" : "NO debería")} ser un palíndromo.");
        }

        // --- Pruebas Parametrizadas (Ejemplo con NUnit [TestCase]) ---
        /*
        [TestFixture]
        public class ValidadorTextoNUnitTests
        {
            [TestCase("radar", true, TestName = "radar es un palíndromo")]
            [TestCase("oso", true, TestName = "oso es un palíndromo")]
            [TestCase("Anita lava la tina", true, TestName = "Anita lava la tina es un palíndromo")]
            [TestCase("hola", false, TestName = "hola NO es un palíndromo")]
            public void EsPalindromo_VariasEntradas_RetornaResultadoEsperado(string input, bool expected)
            {
                var validador = new ValidadorTexto();
                bool actual = validador.EsPalindromo(input);
                Assert.AreEqual(expected, actual);
            }
        }
        */
    }
}

// Ejemplo incorrecto: Repetir el mismo código de prueba para cada caso de prueba.
// Esto es lo que las pruebas parametrizadas nos ayudan a evitar.
/*
[TestMethod]
public void EsPalindromo_Radar_RetornaVerdadero()
{
    var validador = new ValidadorTexto();
    Assert.IsTrue(validador.EsPalindromo("radar"));
}

[TestMethod]
public void EsPalindromo_Oso_RetornaVerdadero()
{
    var validador = new ValidadorTexto();
    Assert.IsTrue(validador.EsPalindromo("oso"));
}

[TestMethod]
public void EsPalindromo_Hola_RetornaFalso()
{
    var validador = new ValidadorTexto();
    Assert.IsFalse(validador.EsPalindromo("hola"));
}
// Esto es redundante y difícil de mantener.
*/
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Pruebas y Mantenimiento',
    'topic': 'Mantenimiento de Aplicaciones',
    'subtopic': 'Refactorización de código',
    'definition': r'''
La refactorización de código es el proceso de reestructurar tu código existente sin cambiar su comportamiento externo. Pensemos por un momento en esto como organizar y limpiar tu casa: las paredes y el techo siguen en su lugar, la funcionalidad básica sigue siendo la misma, pero el interior está mucho más ordenado, limpio y es más fácil de habitar.

¿Te estás preguntando por qué esto importa? 

Porque el software, al igual que una casa, acumula "desorden" con el tiempo. El código puede volverse complejo, difícil de entender, duplicado y propenso a errores a medida que se añaden nuevas características. Refactorizar te permite mejorar la legibilidad, la mantenibilidad y la eficiencia de tu código. Hace que sea más fácil añadir nuevas funcionalidades en el futuro y reduce la probabilidad de introducir errores. Además, un código limpio y bien estructurado es una alegría para trabajar y fomenta la colaboración en equipo.

Los objetivos principales de la refactorización incluyen:
* **Mejorar la legibilidad:** Hacer que el código sea más fácil de entender para ti y para otros desarrolladores.
* **Reducir la complejidad:** Simplificar el diseño de tu código.
* **Eliminar duplicación:** Consolidar código repetido en un solo lugar.
* **Mejorar la mantenibilidad:** Hacer que sea más fácil de modificar y extender en el futuro.
* **Aumentar la confianza:** Especialmente cuando se combina con pruebas unitarias, la refactorización te permite cambiar el código sabiendo que su comportamiento no se ha roto.

Algunas técnicas comunes de refactorización incluyen:
* **Extraer método/clase:** Tomar un bloque de código largo y convertirlo en un método o clase separado con un nombre descriptivo.
* **Renombrar variables/métodos/clases:** Usar nombres más claros y significativos.
* **Reemplazar número mágico con constante:** Convertir valores numéricos o de cadena inexplicables en constantes con nombres claros.
* **Consolidar expresiones condicionales duplicadas:** Simplificar `if/else` complejos.
* **Introducir variable explicativa:** Usar una variable temporal para hacer un cálculo complejo más comprensible.

Es importante destacar que la refactorización no es para añadir nuevas funcionalidades. Debe hacerse en pequeños pasos, ejecutando las pruebas unitarias después de cada cambio para asegurarte de que no has introducido ningún error.
''',
    'code_example': r'''
// Ejemplo de refactorización de código en C#

using System;
using System.Linq;
using System.Collections.Generic;

namespace RefactoringDemo
{
    // --- Código Original (Antes de refactorizar) ---
    public class Pedido
    {
        public List<Item> Items { get; set; } = new List<Item>();
        public string CustomerType { get; set; } // "Regular", "Premium", "VIP"

        public void AddItem(string name, decimal price, int quantity)
        {
            Items.Add(new Item { Name = name, Price = price, Quantity = quantity });
        }

        public decimal CalculateFinalPriceOld()
        {
            decimal total = 0;
            foreach (var item in Items)
            {
                total += item.Price * item.Quantity;
            }

            // Aplicar descuento basado en el tipo de cliente
            if (CustomerType == "Premium")
            {
                total *= 0.90m; // 10% de descuento
            }
            else if (CustomerType == "VIP")
            {
                total *= 0.80m; // 20% de descuento
            }
            // Los clientes "Regular" no tienen descuento

            return total;
        }

        public class Item
        {
            public string Name { get; set; }
            public decimal Price { get; set; }
            public int Quantity { get; set; }
        }
    }


    // --- Código Refactorizado ---
    public class RefactoredPedido
    {
        public List<Item> Items { get; set; } = new List<Item>();
        public CustomerTypeEnum CustomerType { get; set; } // Usar un enum para mayor claridad

        // Constantes para descuentos (ejemplo de "Reemplazar número mágico con constante")
        private const decimal PREMIUM_DISCOUNT_RATE = 0.10m; // 10%
        private const decimal VIP_DISCOUNT_RATE = 0.20m;    // 20%

        public void AddItem(string name, decimal price, int quantity)
        {
            // Podríamos validar aquí, o en el constructor de Item
            Items.Add(new Item { Name = name, Price = price, Quantity = quantity });
        }

        public decimal CalculateFinalPrice()
        {
            // Extraer método para calcular el subtotal (ejemplo de "Extraer método")
            decimal subtotal = CalculateSubtotal();

            // Extraer método para aplicar el descuento (ejemplo de "Extraer método")
            decimal finalPrice = ApplyDiscount(subtotal);

            return finalPrice;
        }

        private decimal CalculateSubtotal()
        {
            // Usar LINQ para simplificar la suma (ejemplo de "Simplificar expresiones")
            return Items.Sum(item => item.Price * item.Quantity);
        }

        private decimal ApplyDiscount(decimal subtotal)
        {
            decimal discountRate = GetDiscountRateForCustomerType();
            return subtotal * (1 - discountRate); // Aplicar descuento de forma más clara
        }

        // Extraer método para obtener la tasa de descuento
        private decimal GetDiscountRateForCustomerType()
        {
            switch (CustomerType)
            {
                case CustomerTypeEnum.Premium:
                    return PREMIUM_DISCOUNT_RATE;
                case CustomerTypeEnum.VIP:
                    return VIP_DISCOUNT_RATE;
                case CustomerTypeEnum.Regular:
                default:
                    return 0m;
            }
        }

        public class Item
        {
            public string Name { get; set; }
            public decimal Price { get; set; }
            public int Quantity { get; set; }
        }

        // Usar un enum en lugar de string para los tipos de cliente (ejemplo de "Reemplazar código de tipo con clase/enum")
        public enum CustomerTypeEnum
        {
            Regular,
            Premium,
            VIP
        }
    }

    public class Program
    {
        public static void Main(string[] args)
        {
            // Ejemplo de uso del código original
            Console.WriteLine("--- Código Original ---");
            var pedidoOriginal = new Pedido { CustomerType = "Premium" };
            pedidoOriginal.AddItem("Libro", 25.00m, 1);
            pedidoOriginal.AddItem("Bolígrafo", 1.50m, 5);
            Console.WriteLine($"Precio final original: ${pedidoOriginal.CalculateFinalPriceOld():F2}");

            Console.WriteLine("\n--- Código Refactorizado ---");
            var pedidoRefactorizado = new RefactoredPedido { CustomerType = RefactoredPedido.CustomerTypeEnum.Premium };
            pedidoRefactorizado.AddItem("Libro", 25.00m, 1);
            pedidoRefactorizado.AddItem("Bolígrafo", 1.50m, 5);
            Console.WriteLine($"Precio final refactorizado: ${pedidoRefactorizado.CalculateFinalPrice():F2}");

            Console.WriteLine("\nPresiona cualquier tecla para salir.");
            Console.ReadKey();
        }
    }

    // Ejemplo incorrecto: Refactorizar sin tener pruebas unitarias.
    // Aunque este ejemplo es simple, en un código más complejo, si refactorizas
    // sin pruebas, corres un alto riesgo de introducir errores y romper la funcionalidad existente.
    // La refactorización segura SIEMPRE se hace con una red de seguridad de pruebas.
    /*
    public class UnsafeRefactoring
    {
        public int CalculateComplexValue(int a, int b, int c)
        {
            // Código complejo y largo...
            // Si lo refactorizas sin pruebas que cubran todos los casos,
            // podrías cambiar el comportamiento sin darte cuenta.
            return (a * b) + (c / 2);
        }
    }
    */
}
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Pruebas y Mantenimiento',
    'topic': 'Mantenimiento de Aplicaciones',
    'subtopic': 'Documentación con XML comments',
    'definition': r'''
Los comentarios XML (XML comments) en C# son una forma estandarizada de añadir documentación a tu código directamente en el archivo fuente. Pensemos por un momento en esto como escribir un manual de usuario para cada parte de tu máquina: explicas qué hace, cómo se usa, qué espera y qué devuelve, todo de una manera estructurada que las herramientas pueden entender.

¿Te estás preguntando por qué esto importa? 

Porque el código es leído muchas más veces de las que se escribe. Un código bien documentado reduce la curva de aprendizaje para nuevos miembros del equipo, facilita el mantenimiento y ayuda a evitar errores de uso. Además, herramientas como Visual Studio pueden usar estos comentarios para mostrar información útil (IntelliSense) cuando otros desarrolladores usan tus métodos o clases. ¡Incluso puedes generar documentación externa (como archivos HTML o PDF) a partir de ellos!

Para crear comentarios XML, simplemente escribe `///` (tres barras diagonales) justo encima de una clase, método, propiedad, campo o cualquier miembro de tu código. Visual Studio automáticamente insertará las etiquetas XML básicas. Las etiquetas más comunes que usarás son:

* **`<summary>`:** Una descripción breve y concisa de la clase, método o propiedad. Es lo primero que ve alguien en IntelliSense.
* **`<param name="nombreParametro">`:** Describe cada parámetro de un método o constructor, explicando su propósito y qué valores espera.
* **`<returns>`:** Describe el valor que devuelve un método.
* **`<exception cref="TipoDeExcepcion">`:** Documenta las excepciones específicas que un método puede lanzar y en qué condiciones.
* **`<remarks>`:** Proporciona información adicional más detallada que no encaja en el resumen. Puedes incluir ejemplos de uso, notas de implementación, etc.
* **`<example>`:** Contiene un fragmento de código de ejemplo que ilustra cómo usar el miembro.
* **`<see cref="OtroMiembro"/>`:** Crea un enlace a otro miembro del código.

Usar comentarios XML de forma consistente es una práctica de desarrollo profesional que mejora significativamente la calidad y la mantenibilidad de tu base de código.
''',
    'code_example': r'''
// Ejemplo de documentación con XML comments en C#

using System;
using System.Collections.Generic;

namespace XmlCommentsDemo
{
    /// <summary>
    /// Representa un cliente en el sistema.
    /// <remarks>
    /// Esta clase contiene información básica del cliente y sus pedidos asociados.
    /// Es parte del módulo de gestión de clientes.
    /// </remarks>
    /// </summary>
    public class Cliente
    {
        /// <summary>
        /// Obtiene o establece el identificador único del cliente.
        /// </summary>
        public int Id { get; set; }

        /// <summary>
        /// Obtiene o establece el nombre completo del cliente.
        /// </summary>
        /// <value>Una cadena que representa el nombre completo del cliente.</value>
        public string NombreCompleto { get; set; }

        /// <summary>
        /// Obtiene o establece la dirección de correo electrónico del cliente.
        /// </summary>
        /// <example>
        /// <code>
        /// Cliente miCliente = new Cliente();
        /// miCliente.Email = "ejemplo@dominio.com";
        /// </code>
        /// </example>
        public string Email { get; set; }

        /// <summary>
        /// Inicializa una nueva instancia de la clase <see cref="Cliente"/>.
        /// </summary>
        public Cliente() { }

        /// <summary>
        /// Inicializa una nueva instancia de la clase <see cref="Cliente"/> con el ID y nombre especificados.
        /// </summary>
        /// <param name="id">El identificador único del cliente.</param>
        /// <param name="nombreCompleto">El nombre completo del cliente.</param>
        public Cliente(int id, string nombreCompleto)
        {
            this.Id = id;
            this.NombreCompleto = nombreCompleto;
        }

        /// <summary>
        /// Realiza el registro de un nuevo cliente en el sistema.
        /// </summary>
        /// <param name="cliente">El objeto <see cref="Cliente"/> a registrar.</param>
        /// <returns><c>true</c> si el registro fue exitoso; de lo contrario, <c>false</c>.</returns>
        /// <exception cref="ArgumentNullException">Se lanza si <paramref name="cliente"/> es nulo.</exception>
        /// <exception cref="InvalidOperationException">Se lanza si el cliente ya existe.</exception>
        /// <remarks>
        /// Este método simula la lógica de negocio para registrar un cliente.
        /// En un escenario real, interactuaría con una base de datos.
        /// </remarks>
        public bool RegistrarCliente(Cliente cliente)
        {
            if (cliente == null)
            {
                throw new ArgumentNullException(nameof(cliente), "El cliente a registrar no puede ser nulo.");
            }
            // Simular que el cliente ya existe
            if (cliente.Id == 101)
            {
                throw new InvalidOperationException($"El cliente con ID {cliente.Id} ya está registrado.");
            }

            Console.WriteLine($"Cliente {cliente.NombreCompleto} (ID: {cliente.Id}) registrado con éxito.");
            return true;
        }
    }

    public class Program
    {
        public static void Main(string[] args)
        {
            Cliente nuevoCliente = new Cliente(100, "Juan Pérez");
            Cliente clienteExistente = new Cliente(101, "Ana Gómez"); // Para simular un cliente ya existente

            try
            {
                nuevoCliente.RegistrarCliente(nuevoCliente);
                nuevoCliente.RegistrarCliente(clienteExistente); // Esto lanzará una excepción
            }
            catch (Exception ex)
            {
                Console.WriteLine($"\nError al registrar cliente: {ex.Message}");
            }

            // Cuando escribas 'Cliente obj = new Cliente();' y luego 'obj.' en Visual Studio,
            // verás la documentación en IntelliSense generada a partir de estos XML comments.

            Console.WriteLine("\nPresiona cualquier tecla para salir.");
            Console.ReadKey();
        }
    }

    // Ejemplo incorrecto: Escribir comentarios que no añaden valor o son redundantes.
    // Los comentarios deben explicar el "por qué" o el "qué" de forma de alto nivel,
    // no simplemente repetir lo que el código ya dice.
    /*
    public class BadlyCommentedCode
    {
        // NO HACER ESTO:
        /// <summary>
        /// Esta es una propiedad que contiene el nombre.
        /// </summary>
        public string Name { get; set; } // El nombre.

        /// <summary>
        /// Este método suma dos números.
        /// </summary>
        /// <param name="a">El primer número.</param>
        /// <param name="b">El segundo número.</param>
        /// <returns>La suma de a y b.</returns>
        public int Sum(int a, int b)
        {
            return a + b; // Devuelve la suma.
        }
    }
    */
}
'''
  });

  await db.insert('programming_content', {
    'language': 'PuntoNet',
    'module': 'Jr',
    'level': 6,
    'title_level': 'Pruebas y Mantenimiento',
    'topic': 'Mantenimiento de Aplicaciones',
    'subtopic': 'Uso de control de versiones (Git)',
    'definition': r'''
El control de versiones, y específicamente Git, es una herramienta indispensable para cualquier desarrollador, ya sea que trabajes solo o en equipo. Pensemos por un momento en esto como una máquina del tiempo y un sistema de copias de seguridad inteligente para tu código: te permite guardar diferentes versiones de tu proyecto, volver a versiones anteriores si algo sale mal, y trabajar de forma colaborativa sin pisar el trabajo de los demás.

¿Te estás preguntando por qué esto importa? 

Porque el desarrollo de software es un proceso constante de cambios. Sin control de versiones, perderías el rastro de esos cambios, sería casi imposible colaborar eficientemente con otros desarrolladores, y un error podría borrar días de trabajo sin posibilidad de recuperación. Git resuelve todos estos problemas, proporcionando un historial completo de cada modificación, quién la hizo, cuándo y por qué. Esto es crucial para la trazabilidad, la colaboración y la recuperación ante desastres.

Git es un "Sistema de Control de Versiones Distribuido" (DVCS). Esto significa que cada desarrollador tiene una copia completa del repositorio del proyecto en su máquina local, lo que permite trabajar sin conexión y ofrece una gran flexibilidad. Los conceptos clave en Git incluyen:

* **Repositorio (Repository):** Es el proyecto en sí, incluyendo todos los archivos y el historial completo de cambios. Puede ser local (en tu máquina) o remoto (en servicios como GitHub, GitLab, Bitbucket).
* **Commit:** Es una "instantánea" de tu proyecto en un momento dado. Cada commit tiene un mensaje descriptivo que explica los cambios que contiene. Es como guardar el progreso de tu juego.
* **Rama (Branch):** Es una línea de desarrollo independiente. Te permite trabajar en nuevas características o corregir errores sin afectar la versión principal del código. Es como hacer una copia de tu proyecto para experimentar, y luego puedes fusionar esos cambios de vuelta.
* **Fusionar (Merge):** Es el proceso de combinar los cambios de una rama en otra.
* **Clonar (Clone):** Obtener una copia local de un repositorio remoto.
* **Pull:** Descargar los últimos cambios de un repositorio remoto a tu repositorio local.
* **Push:** Subir tus commits locales a un repositorio remoto.

Dominar Git es una de las habilidades más demandadas y valiosas en el desarrollo de software moderno. Te permite trabajar de forma organizada, segura y colaborativa.
''',
    'code_example': r'''
# Ejemplo de comandos básicos de Git (se ejecutan en la terminal o Git Bash)

# --- 1. Inicializar un repositorio Git (una sola vez por proyecto) ---
# Ve a la carpeta de tu proyecto en la terminal.
# Esto crea un nuevo repositorio Git local.
# git init
# echo "README.md" >> .gitignore # Ignorar archivos no deseados, como la carpeta bin/obj de .NET

# --- 2. Añadir archivos al "staging area" (área de preparación) ---
# Esto le dice a Git qué cambios quieres incluir en tu próximo commit.
# git add .             # Añade todos los archivos modificados y nuevos en el directorio actual
# git add src/Program.cs # O añade archivos específicos
# git add README.md

# --- 3. Crear un commit (guardar una instantánea de los cambios) ---
# Guarda los cambios que están en el staging area en el historial del repositorio.
# El mensaje de commit debe ser descriptivo.
# git commit -m "feat: Implementar calculadora básica con sumar y restar"

# --- 4. Ver el estado del repositorio ---
# Muestra qué archivos han cambiado, cuáles están en staging, etc.
# git status

# --- 5. Ver el historial de commits ---
# Muestra una lista de todos los commits, con sus IDs, autores, fechas y mensajes.
# git log
# git log --oneline # Versión más concisa

# --- 6. Crear una nueva rama ---
# Las ramas permiten trabajar en paralelo sin afectar la rama principal (master/main).
# git branch feature/nueva-funcionalidad
# git checkout feature/nueva-funcionalidad # Cambiarse a la nueva rama
# (O: git checkout -b feature/nueva-funcionalidad para crear y cambiar en un solo comando)

# --- 7. Trabajar en la nueva rama y hacer commits ---
# Haz cambios en tus archivos...
# git add .
# git commit -m "feat: Añadir operación de multiplicación"

# --- 8. Cambiar de nuevo a la rama principal y fusionar los cambios ---
# Primero, asegúrate de estar en la rama donde quieres traer los cambios (ej. main).
# git checkout main
# git merge feature/nueva-funcionalidad # Trae los cambios de la rama a la rama actual
# git branch -d feature/nueva-funcionalidad # Elimina la rama (una vez fusionada y ya no necesaria)

# --- 9. Conectar con un repositorio remoto (ej. GitHub) ---
# Esto se hace una vez para vincular tu repo local con uno en la nube.
# git remote add origin https://github.com/tu-usuario/tu-repositorio.git

# --- 10. Subir tus cambios locales al repositorio remoto ---
# Envía tus commits de tu rama local a la rama correspondiente en el remoto.
# git push origin main

# --- 11. Descargar los últimos cambios del repositorio remoto ---
# Actualiza tu rama local con los cambios que otros han subido.
# git pull origin main


# Ejemplo incorrecto: No usar Git o usarlo de forma incorrecta.
# No usar Git es como trabajar sin un historial, si pierdes tu código o introduces un error,
# no tienes forma fácil de recuperarte o de ver quién hizo qué cambio.
# No hacer commits frecuentes con mensajes descriptivos: Esto reduce la utilidad del historial,
# haciendo difícil entender qué se hizo y por qué.
# Trabajar directamente en la rama principal sin ramas para características/errores:
# Esto hace que la colaboración sea caótica y el historial confuso.
'''
  });
}
